Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA398378C79
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 14:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125204.235681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg5O0-0002vj-4y; Mon, 10 May 2021 12:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125204.235681; Mon, 10 May 2021 12:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg5Nz-0002tV-WD; Mon, 10 May 2021 12:51:48 +0000
Received: by outflank-mailman (input) for mailman id 125204;
 Mon, 10 May 2021 12:51:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Mbt=KF=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lg5Nx-0002tP-Le
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 12:51:45 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21936f57-bf11-4213-bae6-923d59036851;
 Mon, 10 May 2021 12:51:44 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1620651099282908.8077127391684;
 Mon, 10 May 2021 05:51:39 -0700 (PDT)
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
X-Inumbo-ID: 21936f57-bf11-4213-bae6-923d59036851
ARC-Seal: i=1; a=rsa-sha256; t=1620651101; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EmyTgMSss4I0LIy7xAxhF6XyANzhVWPKOOJG+YArKmIhWTyn6C3ojwgssdEBX3kEhfG/DTt/6XdlVNv3XpjNuK9Y+P+k2EDa1ESjZeQM3wbRTnwYctgK8zaVmUjIUvAG9tqCRR2zIGB+x6W5FfiYCaXXu8Q4zts7rQhqkKWxaIc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1620651101; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pynKZeyQxVTifrojGR/tNbMPrrrFntd1doGv+bVQ9HQ=; 
	b=dcThfqocKl+1lARpjlTJ9vhYz913v8P+pBETRWVoUjIraZcml4NnN0DLHwH3QDgd55hqMhlIRd7gFpnl2zeNwtTZ+7EBJ23oZWoB3mDTyvon8eu3puQiFEwk1Vq8BgHFMiZfikB5B0GlVWL49f3n5p0FeqCbbSx6agmq5yt0ebM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620651101;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pynKZeyQxVTifrojGR/tNbMPrrrFntd1doGv+bVQ9HQ=;
	b=PLquPeXE1+g+U6kyPoBlxTrJyz/i0I8vn2rQUOgM2CoOEpbSZNrKNHRzHcKoVJ9e
	5DWaYgoSEKLNY0mNEQqBtgWn1vGBTIWnMu4XLlRBKEZoEIKmrP9rZM3bwW/64DMPkEi
	e5Mxjr63ycw5pVZWyrnWTvi/O9PlK/9Rn03inmYY=
Subject: Re: [PATCH v2 09/13] vtpmmgr: Support GetRandom passthrough on TPM
 2.0
To: xen-devel@lists.xenproject.org
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-10-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <acbe24ac-0702-ebe3-1a6b-7f5899d97f79@apertussolutions.com>
Date: Mon, 10 May 2021 08:51:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-10-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/6/21 9:59 AM, Jason Andryuk wrote:
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
> 
> ---
> v2:
> Add bounds and size checks
> Whitespace fixup
> ---

Reviewed by: Daniel P. Smith <dpsmith@apertussolutions.com>

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
> 


