Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2483771EB
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 14:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124311.234610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfMT0-0003NS-Q8; Sat, 08 May 2021 12:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124311.234610; Sat, 08 May 2021 12:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfMT0-0003Lb-My; Sat, 08 May 2021 12:53:58 +0000
Received: by outflank-mailman (input) for mailman id 124311;
 Sat, 08 May 2021 12:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wEz=KD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1lfMSy-0003LU-Op
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 12:53:56 +0000
Received: from sonata.ens-lyon.org (unknown [140.77.166.138])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f1a7492-48be-48d6-872b-3ac647eace0c;
 Sat, 08 May 2021 12:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 0512D201A4;
 Sat,  8 May 2021 13:34:42 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rwcWxDj7mb7; Sat,  8 May 2021 13:34:41 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id D84EC201A3;
 Sat,  8 May 2021 13:34:41 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLEH-00BM8M-Aa; Sat, 08 May 2021 13:34:41 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:34:41 +0200
Resent-Message-ID: <20210508113441.zapne7itvhhiu2vu@begin>
Resent-To: jandryuk@gmail.com, xen-devel@lists.xenproject.org,
 dgdegra@tycho.nsa.gov, quan.xu0@gmail.com
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
X-Inumbo-ID: 7f1a7492-48be-48d6-872b-3ac647eace0c
Date: Thu, 6 May 2021 23:41:13 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v2 10/13] vtpmmgr: Remove bogus cast from TPM2_GetRandom
Message-ID: <20210506214113.bhkhiif4utufxxwp@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-11-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506135923.161427-11-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jason Andryuk, le jeu. 06 mai 2021 09:59:20 -0400, a ecrit:
> The UINT32 <-> UINT16 casting in TPM2_GetRandom is incorrect.  Use a
> local UINT16 as needed for the TPM hardware command and assign the
> result.
> 
> Suggested-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/tpm2.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/tpm2.c b/stubdom/vtpmmgr/tpm2.c
> index 655e6d164c..ebd06eac74 100644
> --- a/stubdom/vtpmmgr/tpm2.c
> +++ b/stubdom/vtpmmgr/tpm2.c
> @@ -427,15 +427,22 @@ abort_egress:
>  
>  TPM_RC TPM2_GetRandom(UINT32 * bytesRequested, BYTE * randomBytes)
>  {
> +    UINT16 bytesReq;
>      TPM_BEGIN(TPM_ST_NO_SESSIONS, TPM_CC_GetRandom);
>  
> -    ptr = pack_UINT16(ptr, (UINT16)*bytesRequested);
> +    if (*bytesRequested > UINT16_MAX)
> +        bytesReq = UINT16_MAX;
> +    else
> +        bytesReq = *bytesRequested;
> +
> +    ptr = pack_UINT16(ptr, bytesReq);
>  
>      TPM_TRANSMIT();
>      TPM_UNPACK_VERIFY();
>  
> -    ptr = unpack_UINT16(ptr, (UINT16 *)bytesRequested);
> -    ptr = unpack_TPM_BUFFER(ptr, randomBytes, *bytesRequested);
> +    ptr = unpack_UINT16(ptr, &bytesReq);
> +    *bytesRequested = bytesReq;
> +    ptr = unpack_TPM_BUFFER(ptr, randomBytes, bytesReq);
>  
>  abort_egress:
>      return status;
> -- 
> 2.30.2
> 

-- 
Samuel
<N> (* If you have a precise idea of the intended use of the following code, please
<N>    write to Eduardo.Gimenez@inria.fr and ask for the prize :-)
<N>    -- Eduardo (11/8/97) *)
 -+- N sur #ens-mim - et c'était un des développeurs -+-

