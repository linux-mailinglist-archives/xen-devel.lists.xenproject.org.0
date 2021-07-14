Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B83C8A5B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 20:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156171.288173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3jCk-0001un-Gm; Wed, 14 Jul 2021 18:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156171.288173; Wed, 14 Jul 2021 18:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3jCk-0001sQ-Dj; Wed, 14 Jul 2021 18:01:54 +0000
Received: by outflank-mailman (input) for mailman id 156171;
 Wed, 14 Jul 2021 18:01:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3jCj-0001sG-2M
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 18:01:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3jCg-0002aM-BU; Wed, 14 Jul 2021 18:01:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3jCg-0001uB-4s; Wed, 14 Jul 2021 18:01:50 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qKBLiSvebRCGBGg8R5rnEb1izOQN/PqWw1SeEaqJpAc=; b=mkYxBohlrOBp+8ru6KvfuWWBA+
	U8I2jRae7ajS8X/bJLPXDhap0Q1tj5qNNaEwM7d4sm/LZu0sd7zZu9BXunKsWiV4E0kEmHaHYU2hR
	Hn0IO6IbSdpO2FejDv4LDGWh1VCGVLDY3gfZ3firkHiHv3VeSXPCkdJPz6+uvnijbiec=;
Subject: Re: [PATCH] SUPPORT.md: add Dom0less as Supported
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 iwj@xenproject.org, wl@xen.org
References: <alpine.DEB.2.21.2107131734170.23286@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <47749630-ff78-e00f-63c0-8ff71a6a04c9@xen.org>
Date: Wed, 14 Jul 2021 19:01:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2107131734170.23286@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/07/2021 01:39, Stefano Stabellini wrote:
> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> mature enough and small enough to make it security supported.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 317392d8f3..c777f3da72 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -832,6 +832,12 @@ OVMF firmware implements the UEFI boot protocol.
>   
>       Status, qemu-xen: Supported
>   
> +## Dom0less
> +
> +Guest creation from the hypervisor at boot without Dom0 intervention.
> +
> +    Status, ARM: Supported
> +

After XSA-372, we will not scrubbed memory assigned to dom0less DomU 
when bootscrub=on. Do we want to exclude this combination or mention 
that XSAs will not be issued if the domU can read secret from unscrubbed 
memory?

Cheers,

-- 
Julien Grall

