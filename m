Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A141A7FEDFF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 12:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644553.1005700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fIX-000879-SS; Thu, 30 Nov 2023 11:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644553.1005700; Thu, 30 Nov 2023 11:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fIX-00084e-PU; Thu, 30 Nov 2023 11:33:37 +0000
Received: by outflank-mailman (input) for mailman id 644553;
 Thu, 30 Nov 2023 11:33:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8fIW-00084Y-B8
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 11:33:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8fIW-0004Ax-2x; Thu, 30 Nov 2023 11:33:36 +0000
Received: from [15.248.2.159] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8fIV-0002DJ-Sv; Thu, 30 Nov 2023 11:33:36 +0000
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
	bh=98Rige8ox9FvcQdiJHSqw4Ca8bvvOmmUE7ZswLVOK0c=; b=QgJ6YJcCkQhUfiKVNiTPXLvRgP
	0AeRRDdHOcCO8VVTQH2NFKEEQD4L2MhfcFQw2YiOGT8/LhADSZYwtTuGkUUZBgJuc9YCSnDjMDJp+
	I6CJHOgmB/yUOnFQ94g7rYVemtQFbexNcu3xdKElmdO3VbU7y0apAZqCpwWNA1hcO2+0=;
Message-ID: <d373be79-af9e-49d0-95c3-5e5c0c187cca@xen.org>
Date: Thu, 30 Nov 2023 11:33:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/public: fix flexible array definitions
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231130092112.18118-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231130092112.18118-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/11/2023 09:21, Juergen Gross wrote:
> ---
> V2:
> - bump interface version and make change only for new version
>    (Jan Beulich)
> ---
>   xen/include/public/io/cameraif.h | 2 +-
>   xen/include/public/io/displif.h  | 2 +-
>   xen/include/public/io/fsif.h     | 4 ++--
>   xen/include/public/io/pvcalls.h  | 2 +-
>   xen/include/public/io/ring.h     | 5 +++--
>   xen/include/public/io/sndif.h    | 2 +-
>   xen/include/public/xen-compat.h  | 2 +-
>   xen/include/public/xen.h         | 6 ++++++
>   8 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/include/public/io/cameraif.h b/xen/include/public/io/cameraif.h
> index 13763abef9..a389443769 100644
> --- a/xen/include/public/io/cameraif.h
> +++ b/xen/include/public/io/cameraif.h
> @@ -763,7 +763,7 @@ struct xencamera_buf_create_req {
>    */
>   struct xencamera_page_directory {
>       grant_ref_t gref_dir_next_page;
> -    grant_ref_t gref[1]; /* Variable length */
> +    grant_ref_t gref[XENPV_FLEX_ARRAY_DIM];
>   };
>   
>   /*
> diff --git a/xen/include/public/io/displif.h b/xen/include/public/io/displif.h
> index 73d0cbdf15..132c96fa5c 100644
> --- a/xen/include/public/io/displif.h
> +++ b/xen/include/public/io/displif.h
> @@ -537,7 +537,7 @@ struct xendispl_dbuf_create_req {
>   
>   struct xendispl_page_directory {
>       grant_ref_t gref_dir_next_page;
> -    grant_ref_t gref[1]; /* Variable length */
> +    grant_ref_t gref[XENPV_FLEX_ARRAY_DIM];
>   };
>   
>   /*
> diff --git a/xen/include/public/io/fsif.h b/xen/include/public/io/fsif.h
> index ec57850233..dcade1c698 100644
> --- a/xen/include/public/io/fsif.h
> +++ b/xen/include/public/io/fsif.h
> @@ -40,7 +40,7 @@ struct fsif_read_request {
>       int32_t pad;
>       uint64_t len;
>       uint64_t offset;
> -    grant_ref_t grefs[1];  /* Variable length */
> +    grant_ref_t grefs[XENPV_FLEX_ARRAY_DIM];
>   };
>   
>   struct fsif_write_request {
> @@ -48,7 +48,7 @@ struct fsif_write_request {
>       int32_t pad;
>       uint64_t len;
>       uint64_t offset;
> -    grant_ref_t grefs[1];  /* Variable length */
> +    grant_ref_t grefs[XENPV_FLEX_ARRAY_DIM];
>   };
>   
>   struct fsif_stat_request {
> diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
> index 230b0719e3..af0e9abd13 100644
> --- a/xen/include/public/io/pvcalls.h
> +++ b/xen/include/public/io/pvcalls.h
> @@ -30,7 +30,7 @@ struct pvcalls_data_intf {
>       uint8_t pad2[52];
>   
>       RING_IDX ring_order;
> -    grant_ref_t ref[];
> +    grant_ref_t ref[XENPV_FLEX_ARRAY_DIM];

I am probably missing something. In the commit message, you suggested 
that XENPV_FLEX_ARRAY_DIM will use 1 for older interface version for 
compatibility reason.

Yet, if I am not mistaken, [] is not equivalent to [1]. So aren't you 
effectively breaking the compatibility?

Cheers,

-- 
Julien Grall

