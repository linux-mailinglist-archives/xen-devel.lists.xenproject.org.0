Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN2PNs7ljWms8QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:38:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4F12E4DC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229104.1535113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXpI-00006n-M0; Thu, 12 Feb 2026 14:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229104.1535113; Thu, 12 Feb 2026 14:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXpI-0008WQ-Hr; Thu, 12 Feb 2026 14:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1229104;
 Thu, 12 Feb 2026 14:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yal/=AQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vqXpG-0008WI-F8
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:37:50 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61837e0e-0820-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 15:37:40 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-4094d7d71a9so2148744fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 06:37:40 -0800 (PST)
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
X-Inumbo-ID: 61837e0e-0820-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770907059; cv=none;
        d=google.com; s=arc-20240605;
        b=cgn+VpBgA1zFN267gVAus5QYA5NL9IRabgtijbrH3slOvLqrPWiqzrS/1dDqB+V/gI
         I0Xsj/we8ZcmvvQUVJDvaGDIDZzXYxs+xMUaZvfJJV4NL8VeQTMSERY2UGDyLZPTzdh6
         hOIKZhyvAW5YZovaBms+aIPbEt41ZsU7jncLonKxw8PhCAKEPxAQOt9tR9m6MsrnapIt
         Yi8HWE9ax9sGxsHURX+ptEWYVFWtZRxy/CnKeW74pMGzJRZDCRDiYPGlxb40MPEhthwV
         c8+sfjW6EY9ecqvaBQ33Kdp7KnuXC/ViV6alFE5kt/1QTmuOkq9tSZP87q+1PrNH7oGO
         6wFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mabh2nObHMsaLbzi66GrhWaFHQzF5Ocs+HqxXhDR+q4=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=LyzgUxPsecCAe8Ukl1elubcG5yJ7gRLhY25476wqSDw9ROfcPkC5fYHJEbYGfkUwRt
         Ol2SpTn2LYeWqTYEU8wfr5l3j/J1zr3NWQSazsxwKVZwVFoOywM1afob0S62d8Zuj7j/
         NO8ewr8ADWd8/vsdLJTbQ5Z3UheFTuz9wnvJSUc1NGu5nlLV0jMHTJt3PPUH6QsE/m9c
         IekefvB8xsk87h7m7G8Ly9ycfIfRVGue4K2iv0g3njF8pQ6xD32eRAQ6YI5zjTGwxjAk
         inCGAOEV7pOYE0zxn2ty8glrZlwItgJYopHfN2CCJVngBsIr2pegDPcFn8DE15HlzCt2
         4zGA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770907059; x=1771511859; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mabh2nObHMsaLbzi66GrhWaFHQzF5Ocs+HqxXhDR+q4=;
        b=fBmRqQFHZyf6d9gfkv4t/TIC0KOM1JYaMzrS4WgBgcyX0oDkpq2EcJv+oXfqHuXy7W
         eOqo7HX7qtUY8MT/DsTVdeKsH5MdGtLAOPdtFoeqShIJVXsSwKp2PUZgVl/9JLI/wowN
         Ft6SOhWFIpCuPDcfrgYp4rxdZO4SdnNIx+VCz4FTU37W0k40PQqfB5UuW3hzGyMOM7VG
         fIC7tBxhyy4UKVvbY4dKDyHW5+szs7zcDTp+7m881mTEvZ9NZ1+QSGaQLki84rC87xBA
         SMmjSjr1Jzso8kMuR1FVktJfxAam233Fy84J5iKE7/BBPXwiNGiApppN13tTjhXtakXr
         OmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907059; x=1771511859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mabh2nObHMsaLbzi66GrhWaFHQzF5Ocs+HqxXhDR+q4=;
        b=dcb+341t2dmVyrGHvR7jYlZKM1QrxxRdGwkwwduZrzkFJhU3o3kOlEPS8OkiEsiHNy
         eR+xyfyiVVW6vn5xXiM1inus36XwkwBmY3W/JV+dIhHpgSNRE+VYzW1D7eOIvc1+q7LT
         TqZE9PLaOgPNUXk382Yj7tyOaGLXw3n87/R2N2xMDy+8elNB098ZDFo8r97O1qDSpUE/
         55AmxupAHKTu0BexPVldN7wvgCWmOn+LnBtz0wKxnZGRmMX3CL3PjQovVFK/V/iKzWgO
         AkFpKPLq8ek2l7FPVlB+EcFjqtEq7/7sRKnvaWf3PURrZJDjUgkL79rPj8OKdVXUTu4z
         Nnqw==
X-Gm-Message-State: AOJu0YyRPbcfzlejgqYhJ/hOlr/QPW/6780LjjiNT35Az4QjCuZBPNsm
	UiSd+j9YO4kJnGOQUgKENtiXQGn7ns2m/VelyKcKDawO3N/O9jOcTw99/cbrYkByXXpB4HjTMQ3
	Ka+WQXze4w2vZZtroXSTFGeMOZXoahcIrvBpddPzw2g==
X-Gm-Gg: AZuq6aKVxBh0BHyx3VOZILAa0BnprMM+3OnN2ujqsyTG+E+YsgHFYgppsQF6bYWrNVz
	SGnUUNM4MaAuY8XKQBb6o8gtEWx+GxwpBeNcaltNEZ31i50b/N3xjxd7BcYsFDWp5+UT8OsCZ8b
	Mzxg2gSB76fwmIS4oea94ZB+2+ObE7RloSkgNkSL3oUFvOHu++cIfQaL16/u939VSvPX87SUOC6
	ku18CbU1MHWy9IqLQ4LZC99lCr/6howUgWrNGzzZwEvcrWZqxfLBMhWsQKMy/Jtjl2lqoFVWz4M
	gXrlmzJNFCMuyxXeLSOKMFmQjPq0xsRYovQsFP1ct/k3c/uy
X-Received: by 2002:a05:6870:c14b:b0:404:2fe7:e184 with SMTP id
 586e51a60fabf-40ec71ccbdbmr1356894fac.43.1770907058512; Thu, 12 Feb 2026
 06:37:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770826406.git.bertrand.marquis@arm.com> <8ddb97095d8f7f4140e660d2ff13ec2ccc82cc62.1770826406.git.bertrand.marquis@arm.com>
In-Reply-To: <8ddb97095d8f7f4140e660d2ff13ec2ccc82cc62.1770826406.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 12 Feb 2026 15:37:26 +0100
X-Gm-Features: AZwV_QhoAEZFgArmZCSkiRmg19U5O9SyYZ7iGDtS4Y4Q7uEda3KUzxIT8lCehoY
Message-ID: <CAHUa44FMMVN2qR9f0AdbUguoWWJEyEY93YnCcGynHdpHLwqT1Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] xen/arm: ffa: Add FF-A 1.2 endpoint memory
 access descriptors
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47B4F12E4DC
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 11, 2026 at 6:16=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> FF-A 1.2 extends the endpoint memory access descriptor (EMAD) from
> 16 to 32 bytes, adding implementation-defined (IMPDEF) fields and
> reserved space. The MEM_SHARE path currently assumes the 1.1 EMAD
> size and rejects the 1.2 layout.
>
> Add FF-A 1.2 EMAD support to MEM_SHARE:
> - define ffa_mem_access_1_2 and store IMPDEF payload in ffa_shm_mem
> - emit 1.2 EMADs to the SPMC for FF-A 1.2 guests, forwarding IMPDEF
> - refactor header parsing into read_mem_transaction() for 1.0/1.1+
> - detect EMAD format by mem_access_size to allow 1.1 on 1.2 guests
>
> Export ffa_fw_version to build memory descriptors according to the
> firware version to relay share memory requests and remove unused offset

firmware

> macros.
>
> Functional impact: MEM_SHARE supports FF-A 1.2 EMADs.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v1:
> - export ffa_fw_version and use it to construct descriptors according to
>   firmware version
> - remove unused offset macros
> ---
>  xen/arch/arm/tee/ffa.c         |   2 +-
>  xen/arch/arm/tee/ffa_private.h |   1 +
>  xen/arch/arm/tee/ffa_shm.c     | 121 +++++++++++++++++++++++----------
>  3 files changed, 87 insertions(+), 37 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 6de2b9f8ac8e..23e1f408485b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -70,7 +70,7 @@
>  #include "ffa_private.h"
>
>  /* Negotiated FF-A version to use with the SPMC, 0 if not there or suppo=
rted */
> -static uint32_t __ro_after_init ffa_fw_version;
> +uint32_t __ro_after_init ffa_fw_version;
>
>  /* Features supported by the SPMC or secure world when present */
>  DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 58562d8e733c..ccef2f7631f6 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -436,6 +436,7 @@ struct ffa_ctx {
>  };
>
>  extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> +extern uint32_t __ro_after_init ffa_fw_version;
>
>  extern struct list_head ffa_ctx_head;
>  extern rwlock_t ffa_ctx_list_rwlock;
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index adc7e645a1c7..070babce9627 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -30,6 +30,14 @@ struct ffa_mem_access {
>      uint64_t reserved;
>  };
>
> +/* Endpoint memory access descriptor (FF-A 1.2) */
> +struct ffa_mem_access_1_2 {
> +    struct ffa_mem_access_perm access_perm;
> +    uint32_t region_offs;
> +    uint8_t impdef[16];
> +    uint8_t reserved[8];
> +};
> +
>  /* Lend, donate or share memory transaction descriptor */
>  struct ffa_mem_transaction_1_0 {
>      uint16_t sender_id;
> @@ -55,25 +63,10 @@ struct ffa_mem_transaction_1_1 {
>      uint8_t reserved[12];
>  };
>
> -/* Calculate offset of struct ffa_mem_access from start of buffer */
> -#define MEM_ACCESS_OFFSET(access_idx) \
> -    ( sizeof(struct ffa_mem_transaction_1_1) + \
> -      ( access_idx ) * sizeof(struct ffa_mem_access) )
> -
> -/* Calculate offset of struct ffa_mem_region from start of buffer */
> -#define REGION_OFFSET(access_count, region_idx) \
> -    ( MEM_ACCESS_OFFSET(access_count) + \
> -      ( region_idx ) * sizeof(struct ffa_mem_region) )
> -
> -/* Calculate offset of struct ffa_address_range from start of buffer */
> -#define ADDR_RANGE_OFFSET(access_count, region_count, range_idx) \
> -    ( REGION_OFFSET(access_count, region_count) + \
> -      ( range_idx ) * sizeof(struct ffa_address_range) )
> -
>  /*
>   * The parts needed from struct ffa_mem_transaction_1_0 or struct
>   * ffa_mem_transaction_1_1, used to provide an abstraction of difference=
 in
> - * data structures between version 1.0 and 1.1. This is just an internal
> + * data structures between version 1.0 and 1.2. This is just an internal
>   * interface and can be changed without changing any ABI.
>   */
>  struct ffa_mem_transaction_int {
> @@ -92,6 +85,8 @@ struct ffa_shm_mem {
>      uint16_t sender_id;
>      uint16_t ep_id;     /* endpoint, the one lending */
>      uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> +    /* Endpoint memory access descriptor IMPDEF value (FF-A 1.2). */
> +    uint64_t impdef[2];
>      unsigned int page_count;
>      struct page_info *pages[];
>  };
> @@ -297,16 +292,20 @@ static void init_range(struct ffa_address_range *ad=
dr_range,
>   * This function uses the ffa_spmc tx buffer to transmit the memory tran=
saction
>   * descriptor.
>   */
> -static int share_shm(struct ffa_shm_mem *shm)
> +static int share_shm(struct ffa_shm_mem *shm, uint32_t ffa_vers)
>  {
>      const uint32_t max_frag_len =3D FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
>      struct ffa_mem_access *mem_access_array;
> +    struct ffa_mem_access_1_2 *mem_access_array_1_2;
>      struct ffa_mem_transaction_1_1 *descr;
>      struct ffa_address_range *addr_range;
>      struct ffa_mem_region *region_descr;
> -    const unsigned int region_count =3D 1;
>      uint32_t tot_len;
> +    uint32_t mem_access_size;
> +    uint32_t mem_access_offs;
> +    uint32_t region_offs;
>      paddr_t last_pa;
> +    uint32_t range_count;
>      unsigned int n;
>      paddr_t pa;
>      int32_t ret;
> @@ -325,16 +324,35 @@ static int share_shm(struct ffa_shm_mem *shm)
>      descr->handle =3D shm->handle;
>      descr->mem_reg_attr =3D FFA_NORMAL_MEM_REG_ATTR;
>      descr->mem_access_count =3D 1;
> -    descr->mem_access_size =3D sizeof(*mem_access_array);
> -    descr->mem_access_offs =3D MEM_ACCESS_OFFSET(0);
> +    if ( ffa_vers >=3D FFA_VERSION_1_2 )
> +        mem_access_size =3D sizeof(struct ffa_mem_access_1_2);
> +    else
> +        mem_access_size =3D sizeof(struct ffa_mem_access);
> +    mem_access_offs =3D sizeof(struct ffa_mem_transaction_1_1);
> +    region_offs =3D mem_access_offs + mem_access_size;
> +    descr->mem_access_size =3D mem_access_size;
> +    descr->mem_access_offs =3D mem_access_offs;
>
> -    mem_access_array =3D buf + descr->mem_access_offs;
> -    memset(mem_access_array, 0, sizeof(*mem_access_array));
> -    mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> -    mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> -    mem_access_array[0].region_offs =3D REGION_OFFSET(descr->mem_access_=
count, 0);
> +    if ( ffa_vers >=3D FFA_VERSION_1_2 )
> +    {
> +        mem_access_array_1_2 =3D buf + mem_access_offs;
> +        memset(mem_access_array_1_2, 0, sizeof(*mem_access_array_1_2));
> +        mem_access_array_1_2[0].access_perm.endpoint_id =3D shm->ep_id;
> +        mem_access_array_1_2[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> +        mem_access_array_1_2[0].region_offs =3D region_offs;
> +        memcpy(mem_access_array_1_2[0].impdef, shm->impdef,
> +               sizeof(mem_access_array_1_2[0].impdef));
> +    }
> +    else
> +    {
> +        mem_access_array =3D buf + mem_access_offs;
> +        memset(mem_access_array, 0, sizeof(*mem_access_array));
> +        mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> +        mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> +        mem_access_array[0].region_offs =3D region_offs;
> +    }
>
> -    region_descr =3D buf + mem_access_array[0].region_offs;
> +    region_descr =3D buf + region_offs;
>      memset(region_descr, 0, sizeof(*region_descr));
>      region_descr->total_page_count =3D shm->page_count;
>
> @@ -348,8 +366,9 @@ static int share_shm(struct ffa_shm_mem *shm)
>          region_descr->address_range_count++;
>      }
>
> -    tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
> -                                region_descr->address_range_count);
> +    range_count =3D region_descr->address_range_count;
> +    tot_len =3D region_offs + sizeof(*region_descr) +
> +              range_count * sizeof(struct ffa_address_range);
>      if ( tot_len > max_frag_len )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> @@ -445,6 +464,12 @@ static int read_mem_transaction(uint32_t ffa_vers, c=
onst void *buf, size_t blen,
>      if ( size * count + offs > blen )
>          return FFA_RET_INVALID_PARAMETERS;
>
> +    if ( size < sizeof(struct ffa_mem_access) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( offs & 0xF )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
>      trans->mem_reg_attr =3D mem_reg_attr;
>      trans->flags =3D flags;
>      trans->mem_access_size =3D size;
> @@ -461,7 +486,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      uint64_t addr =3D get_user_reg(regs, 3);
>      uint32_t page_count =3D get_user_reg(regs, 4);
>      const struct ffa_mem_region *region_descr;
> -    const struct ffa_mem_access *mem_access;
> +    const struct ffa_mem_access_1_2 *mem_access;
>      struct ffa_mem_transaction_int trans;
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> @@ -471,9 +496,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
)
>      register_t handle_hi =3D 0;
>      register_t handle_lo =3D 0;
>      int ret =3D FFA_RET_DENIED;
> +    uint32_t ffa_vers;
>      uint32_t range_count;
>      uint32_t region_offs;
>      uint16_t dst_id;
> +    uint8_t perm;
> +    uint64_t impdef[2];
>
>      if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
>      {
> @@ -512,8 +540,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      if ( frag_len > tx_size )
>          goto out_unlock;
>
> -    ret =3D read_mem_transaction(ACCESS_ONCE(ctx->guest_vers), tx_buf,
> -                               frag_len, &trans);
> +    ffa_vers =3D ACCESS_ONCE(ctx->guest_vers);
> +    ret =3D read_mem_transaction(ffa_vers, tx_buf, frag_len, &trans);
>      if ( ret )
>          goto out_unlock;
>
> @@ -542,13 +570,35 @@ void ffa_handle_mem_share(struct cpu_user_regs *reg=
s)
>          goto out_unlock;
>      }
>
> +    if ( trans.mem_access_size < sizeof(struct ffa_mem_access) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
>      /* Check that it fits in the supplied data */
>      if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
>          goto out_unlock;
>
>      mem_access =3D tx_buf + trans.mem_access_offs;
> -
>      dst_id =3D ACCESS_ONCE(mem_access->access_perm.endpoint_id);
> +    perm =3D ACCESS_ONCE(mem_access->access_perm.perm);
> +    region_offs =3D ACCESS_ONCE(mem_access->region_offs);
> +
> +    /*
> +     * FF-A 1.2 introduced an extended mem_access descriptor with impdef
> +     * fields, but guests can still use the 1.1 format if they don't nee=
d
> +     * implementation-defined data. Detect which format is used based on
> +     * the mem_access_size field rather than the negotiated FF-A version=
.
> +     */
> +    if ( trans.mem_access_size >=3D sizeof(struct ffa_mem_access_1_2) )
> +        memcpy(impdef, mem_access->impdef, sizeof(impdef));
> +    else
> +    {
> +        impdef[0] =3D 0;
> +        impdef[1] =3D 0;
> +    }
> +
>      if ( !FFA_ID_IS_SECURE(dst_id) )
>      {
>          /* we do not support sharing with VMs */
> @@ -556,13 +606,11 @@ void ffa_handle_mem_share(struct cpu_user_regs *reg=
s)
>          goto out_unlock;
>      }
>
> -    if ( ACCESS_ONCE(mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW )
> +    if ( perm !=3D FFA_MEM_ACC_RW )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
>          goto out_unlock;
>      }
> -
> -    region_offs =3D ACCESS_ONCE(mem_access->region_offs);
>      if ( sizeof(*region_descr) + region_offs > frag_len )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> @@ -587,6 +635,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      }
>      shm->sender_id =3D trans.sender_id;
>      shm->ep_id =3D dst_id;
> +    memcpy(shm->impdef, impdef, sizeof(shm->impdef));
>
>      /*
>       * Check that the Composite memory region descriptor fits.
> @@ -602,7 +651,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      if ( ret )
>          goto out;
>
> -    ret =3D share_shm(shm);
> +    ret =3D share_shm(shm, ffa_fw_version);
>      if ( ret )
>          goto out;
>
> --
> 2.52.0
>

