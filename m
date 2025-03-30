Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E51A75921
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 11:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931588.1333795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyoyY-0002BI-1p; Sun, 30 Mar 2025 09:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931588.1333795; Sun, 30 Mar 2025 09:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyoyX-00029q-Uo; Sun, 30 Mar 2025 09:29:05 +0000
Received: by outflank-mailman (input) for mailman id 931588;
 Sun, 30 Mar 2025 09:29:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyoyX-00029k-AT
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 09:29:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyoyW-000Ero-2V;
 Sun, 30 Mar 2025 09:29:04 +0000
Received: from [2a02:8012:3a1:0:bc2b:32d:d844:1191]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyoyW-0096LS-1t;
 Sun, 30 Mar 2025 09:29:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=lcVwf9ngiQ05Vzj71XI3bwYVTMADqpMd4aqn3s4Kut8=; b=TtWskzyYAhkT6xXC9zbTPOp1j/
	fY9uymGD7tpxYo7YgnC0eHdR3eU+QgSDDB0icrNGRvDv0vCaobosRHwNsFiYLfg6gkKBXvzGlp729
	YCGxytVBJ9F3vHThu5aVSFg2Vy0PVuQjuJZPrWpgClV65akrud8SCLQwmK9DD++/JnuA=;
Message-ID: <5b901464-64f4-489c-ad62-e03b7f9d47b7@xen.org>
Date: Sun, 30 Mar 2025 10:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com, michal.orzel@amd.com, bertrand.marquis@arm.com
References: <20250327233419.1119763-1-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250327233419.1119763-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 27/03/2025 23:34, Stefano Stabellini wrote:
> The little endian implementation of bitmap_to_xenctl_bitmap leads to
> unnecessary xmallocs and xfrees. Given that Xen only supports little
> endian architectures, it is worth optimizing.
> 
> This patch removes the need for the xmalloc on little endian
> architectures.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v3:
> - code style
> - copy_bytes > 1 checks
> - copy_bytes > 0 check for copy_to_guest_offset
> ---
>   xen/common/bitmap.c | 42 ++++++++++++++++++++++++++++++------------
>   1 file changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
> index 3da63a32a6..d3f9347e62 100644
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -52,7 +52,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
>   	unsigned int remainder = nbits % 8;
>   
>   	if (remainder)
> -		bp[nbits/8] &= (1U << remainder) - 1;
> +		*bp &= (1U << remainder) - 1;

This is changing the behavior of clamp_last_byte(). Yet, it doesn't seem 
the comment on top of is changed. Is this intended? Also, I would 
consider rename 'bp' so it is clearer this is meant to point to the last 
byte of the bitmap rather than the start.

Cheers,

-- 
Julien Grall


