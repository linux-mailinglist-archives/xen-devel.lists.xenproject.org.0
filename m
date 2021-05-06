Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5BA377191
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 13:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124268.234560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfLX2-0003SL-6T; Sat, 08 May 2021 11:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124268.234560; Sat, 08 May 2021 11:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfLX2-0003Q5-2n; Sat, 08 May 2021 11:54:04 +0000
Received: by outflank-mailman (input) for mailman id 124268;
 Sat, 08 May 2021 11:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wEz=KD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1lfLX0-0002oB-6C
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 11:54:02 +0000
Received: from sonata.ens-lyon.org (unknown [140.77.166.138])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a8aa0bd-16ed-4ea4-8dd9-bb86e3442cee;
 Sat, 08 May 2021 11:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id C5EB7201A2;
 Sat,  8 May 2021 13:34:33 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EeqwRdYTS3Gp; Sat,  8 May 2021 13:34:33 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id A69F3201A1;
 Sat,  8 May 2021 13:34:33 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLE9-00BM8I-42; Sat, 08 May 2021 13:34:33 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:34:33 +0200
Resent-Message-ID: <20210508113433.xgnrtzopj2cpbsgi@begin>
Resent-To: xen-devel@lists.xenproject.org, dgdegra@tycho.nsa.gov,
 quan.xu0@gmail.com
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
X-Inumbo-ID: 7a8aa0bd-16ed-4ea4-8dd9-bb86e3442cee
Date: Thu, 6 May 2021 23:40:16 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v2 09/13] vtpmmgr: Support GetRandom passthrough on TPM
 2.0
Message-ID: <20210506214016.yt2df7y6xf5cbdzm@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-10-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506135923.161427-10-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jason Andryuk, le jeu. 06 mai 2021 09:59:19 -0400, a ecrit:
> GetRandom passthrough currently fails when using vtpmmgr with a hardware
> TPM 2.0.
> vtpmmgr (8): INFO[VTPM]: Passthrough: TPM_GetRandom
> vtpm (12): vtpm_cmd.c:120: Error: TPM_GetRandom() failed with error code (30)
> 
> When running on TPM 2.0 hardware, vtpmmgr needs to convert the TPM 1.2
> TPM_ORD_GetRandom into a TPM2 TPM_CC_GetRandom command.  Besides the
> differing ordinal, the TPM 1.2 uses 32bit sizes for the request and
> response (vs. 16bit for TPM2).
> 
> Place the random output directly into the tpmcmd->resp and build the
> packet around it.  This avoids bouncing through an extra buffer, but the
> header has to be written after grabbing the random bytes so we have the
> number of bytes to include in the size.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> v2:
> Add bounds and size checks
> Whitespace fixup
> ---
>  stubdom/vtpmmgr/marshal.h          | 15 ++++++++
>  stubdom/vtpmmgr/vtpm_cmd_handler.c | 61 +++++++++++++++++++++++++++++-
>  2 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/stubdom/vtpmmgr/marshal.h b/stubdom/vtpmmgr/marshal.h
> index dce19c6439..f1037a7976 100644
> --- a/stubdom/vtpmmgr/marshal.h
> +++ b/stubdom/vtpmmgr/marshal.h
> @@ -890,6 +890,15 @@ inline int sizeof_TPM_AUTH_SESSION(const TPM_AUTH_SESSION* auth) {
>  	return rv;
>  }
>  
> +static
> +inline int sizeof_TPM_RQU_HEADER(BYTE* ptr) {
> +	int rv = 0;
> +	rv += sizeof_UINT16(ptr);
> +	rv += sizeof_UINT32(ptr);
> +	rv += sizeof_UINT32(ptr);
> +	return rv;
> +}
> +
>  static
>  inline BYTE* pack_TPM_RQU_HEADER(BYTE* ptr,
>  		TPM_TAG tag,
> @@ -920,8 +929,14 @@ inline int unpack3_TPM_RQU_HEADER(BYTE* ptr, UINT32* pos, UINT32 max,
>  		unpack3_UINT32(ptr, pos, max, ord);
>  }
>  
> +static
> +inline int sizeof_TPM_RQU_GetRandom(BYTE* ptr) {
> +	return sizeof_TPM_RQU_HEADER(ptr) + sizeof_UINT32(ptr);
> +}
> +
>  #define pack_TPM_RSP_HEADER(p, t, s, r) pack_TPM_RQU_HEADER(p, t, s, r)
>  #define unpack_TPM_RSP_HEADER(p, t, s, r) unpack_TPM_RQU_HEADER(p, t, s, r)
>  #define unpack3_TPM_RSP_HEADER(p, l, m, t, s, r) unpack3_TPM_RQU_HEADER(p, l, m, t, s, r)
> +#define sizeof_TPM_RSP_HEADER(p) sizeof_TPM_RQU_HEADER(p)
>  
>  #endif
> diff --git a/stubdom/vtpmmgr/vtpm_cmd_handler.c b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> index 2ac14fae77..c879b24c13 100644
> --- a/stubdom/vtpmmgr/vtpm_cmd_handler.c
> +++ b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> @@ -47,6 +47,7 @@
>  #include "vtpm_disk.h"
>  #include "vtpmmgr.h"
>  #include "tpm.h"
> +#include "tpm2.h"
>  #include "tpmrsa.h"
>  #include "tcg.h"
>  #include "mgmt_authority.h"
> @@ -772,6 +773,64 @@ static int vtpmmgr_permcheck(struct tpm_opaque *opq)
>  	return 1;
>  }
>  
> +TPM_RESULT vtpmmgr_handle_getrandom(struct tpm_opaque *opaque,
> +				    tpmcmd_t* tpmcmd)
> +{
> +	TPM_RESULT status = TPM_SUCCESS;
> +	TPM_TAG tag;
> +	UINT32 size;
> +	const int max_rand_size = TCPA_MAX_BUFFER_LENGTH -
> +				  sizeof_TPM_RQU_GetRandom(tpmcmd->req);
> +	UINT32 rand_offset;
> +	UINT32 rand_size;
> +	TPM_COMMAND_CODE ord;
> +	BYTE *p;
> +
> +	if (tpmcmd->req_len != sizeof_TPM_RQU_GetRandom(tpmcmd->req)) {
> +		status = TPM_BAD_PARAMETER;
> +		tag = TPM_TAG_RQU_COMMAND;
> +		goto abort_egress;
> +	}
> +
> +	p = unpack_TPM_RQU_HEADER(tpmcmd->req, &tag, &size, &ord);
> +
> +	if (!hw_is_tpm2()) {
> +		size = TCPA_MAX_BUFFER_LENGTH;
> +		TPMTRYRETURN(TPM_TransmitData(tpmcmd->req, tpmcmd->req_len,
> +					      tpmcmd->resp, &size));
> +		tpmcmd->resp_len = size;
> +
> +		return TPM_SUCCESS;
> +	}
> +
> +	/* TPM_GetRandom req: <header><uint32 num bytes> */
> +	unpack_UINT32(p, &rand_size);
> +
> +	/* Returning fewer bytes is acceptable per the spec. */
> +	if (rand_size > max_rand_size)
> +		rand_size = max_rand_size;
> +
> +	/* Call TPM2_GetRandom but return a TPM_GetRandom response. */
> +	/* TPM_GetRandom resp: <header><uint32 num bytes><num random bytes> */
> +	rand_offset = sizeof_TPM_RSP_HEADER(tpmcmd->resp) +
> +		      sizeof_UINT32(tpmcmd->resp);
> +
> +	TPMTRYRETURN(TPM2_GetRandom(&rand_size, tpmcmd->resp + rand_offset));
> +
> +	p = pack_TPM_RSP_HEADER(tpmcmd->resp, TPM_TAG_RSP_COMMAND,
> +				rand_offset + rand_size, status);
> +	p = pack_UINT32(p, rand_size);
> +	tpmcmd->resp_len = rand_offset + rand_size;
> +
> +	return status;
> +
> +abort_egress:
> +	tpmcmd->resp_len = VTPM_COMMAND_HEADER_SIZE;
> +	pack_TPM_RSP_HEADER(tpmcmd->resp, tag + 3, tpmcmd->resp_len, status);
> +
> +	return status;
> +}
> +
>  TPM_RESULT vtpmmgr_handle_cmd(
>  		struct tpm_opaque *opaque,
>  		tpmcmd_t* tpmcmd)
> @@ -842,7 +901,7 @@ TPM_RESULT vtpmmgr_handle_cmd(
>  		switch(ord) {
>  		case TPM_ORD_GetRandom:
>  			vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_GetRandom\n");
> -			break;
> +			return vtpmmgr_handle_getrandom(opaque, tpmcmd);
>  		case TPM_ORD_PcrRead:
>  			vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_PcrRead\n");
>  			// Quotes also need to be restricted to hide PCR values
> -- 
> 2.30.2
> 

-- 
Samuel
<i8b4uUnderground> d-_-b
<BonyNoMore> how u make that inverted b?
<BonyNoMore> wait
<BonyNoMore> never mind

