Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCx+OL29iWneBQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:58:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9310E702
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225239.1531710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOxa-0001rE-M6; Mon, 09 Feb 2026 10:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225239.1531710; Mon, 09 Feb 2026 10:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOxa-0001pN-JK; Mon, 09 Feb 2026 10:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1225239;
 Mon, 09 Feb 2026 10:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/H=AN=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vpOxZ-0001lq-LA
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:57:41 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21dc5c79-05a6-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:57:32 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-4097b420ce0so2544378fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 02:57:32 -0800 (PST)
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
X-Inumbo-ID: 21dc5c79-05a6-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770634651; cv=none;
        d=google.com; s=arc-20240605;
        b=lYp+ckw3QLIQKd7kaGkaOirR87cr2bYjUlLy5HKJzAuNPqbUsNigZE89xz4rJxXvbn
         K+HYKn8RAUgn3ZPTdjrPJ8xShAVAI/Xc8OsipPc6b0f6UabEAIYct2/gBIALqZewHlQR
         oCkcpCiIZPQ4B4JbD8CM5gtCzUnT74rOiPxJ7K5YwXDZ3y1j3XbxGeAtOlnucOemBzcS
         z6TXvNSB316HoDMkL/PRMvCHKRCewujFRm91GKrtnDCl8J6bZReZG/VpP3oLaSN2Df+z
         dckUiD5M333QsNo+FbWSu17taZwAYG9JObEd/d+cfcOMP/HsQ2rkao5tjKjLdPZchHC/
         3R/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gHNH1H2nAPvRNt6QXWPS/jE/ydclZc1VP95kPl1l2Ms=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=OoGLqTFg2ePCoLFZKakJ7yWfAUO5uqrXrA1XYAQAnMwAFpngWrJQEXggLccWjnvEII
         Uxa2g3S6HZsaaj4mj+z0kTUgW5Cq4M/V6JZmu7YTYQGeFnFQYtwxRGyLv0/FAw+6QvLf
         MDalWjXqZ3ogkKLsVDR4eHRmrPMKtDlltbi33Di3L5/ubnLOWOxl4RZMfdp9rhGQwkTQ
         LfGInM+RypPqeIGW2pIwMQAoQKrMbh2Vmb46HWiEObju3KhviPVzI4YOGrGwQv98McCy
         Mv3mrRxhRDWd0qysEz620nUNV53bkGCqvj/QvVtQNYac2LfsNkx23C5PrFRErL6LUQMz
         B32Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770634651; x=1771239451; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHNH1H2nAPvRNt6QXWPS/jE/ydclZc1VP95kPl1l2Ms=;
        b=U1jAXiQdQxD6/1/rMPplgTB49b/Pzmxb2Xj3kHn5DAy74fatrKFNd9VBVUArIzDYFT
         N2+UMZFK9ZrEgj18hmHNkf0G0+S8qoUxLHJFXSSf+OYH5Xtca24tX4jOEDA47M7lJWDT
         /LK/cVTGatqX00H6N2JhSve68Wcyp51hzuDoKEBhYNFzS9cVH4iNnQLC5GRzApPYOokw
         M9dPv/4QXWpGGxXwFedcpwxstI5H428kGFrevU/isLz9TuG/dU8Io0uJ7tfrUa18Eg12
         PrmgHpQUjUX82mf5PIL9Q+SzTzpBGIZBcDvs4PRaZxB6SqDj7ADBlEopznc3nMRZTkyn
         V7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634651; x=1771239451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gHNH1H2nAPvRNt6QXWPS/jE/ydclZc1VP95kPl1l2Ms=;
        b=rL9Kdkwnid3MlyzAS71ke0TttKuPpS2nadb/iVb4WBxGEgiPNoRmdcDgnlWnxmKNeX
         tPD2siPY8zenj3ct50VnsZtjFWj6SlXyT/4a+ezMA39tnIph777b1aHO7Q9WMfM9Cs/i
         0mehLJygjDi6EVuvJzjLlGYcV45gsjxyki2kM7rOAzro9LdBWRwH5IR5K/wVWj8RmOia
         ZjUoSttMPeWRWOd3yjdUGbRPpCgd3fyFgPe+QpmlRzzJ/T0GV2XCvWN3mHuhCGLl1RkY
         C4+OQCfGTpIhs0J/Vin9Wpz8iyXsAv0AHWxJHpFVC7T9AW76JCCbOM2R11yIFtgbAGm1
         3AAA==
X-Gm-Message-State: AOJu0YziAHdbPnmeYGAHN8lLJqvxF1aks5Ll3xktV5pXXb+ZZFMUhmsC
	6m91+vwVgWNWWa3vaBfCUeD0n1IDgLFGMcaApRRYeeIiMX/NFaPniYy8zHTY7ZU+vLJXHqPoZEd
	JzqI50wTJw1H8DGDLC4vWmKDckppiNc1J1QQbAhb/vg==
X-Gm-Gg: AZuq6aJtIiUn5VBlZm4gLXOgGG+AHpPqvQXz27Y937z2hdO2bY9f8vV5i39fPUTBh/u
	QYLmLA+xFGHBufo48v3W4ItiPC0ukDtkmoVCQVqnj0jMlsNygZ9XdL9teqzt2JWYqyuPPphN1ic
	VYdYQnaoFpng4fZremjsGJC78oB9TdCBX4egiLIeguyRBGXU+sIZXsYup4Dgd2LtLRMoIduyfnR
	lai1EhbBRzUu5YLRE6xiHOhan1gBnXx6nnSPll2fkKP5Ah/FxL90I7Q3HPY23DDAcKUmBhK/N2O
	y3k3hwKLvQuo+UzyLOrtFs33VQ==
X-Received: by 2002:a05:6871:7385:b0:3fd:9f68:b8c4 with SMTP id
 586e51a60fabf-40a96e60f2dmr5781860fac.28.1770634650795; Mon, 09 Feb 2026
 02:57:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <a8d316dbdbd00a7980c6d527038f9046bb895c69.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <a8d316dbdbd00a7980c6d527038f9046bb895c69.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 9 Feb 2026 11:57:19 +0100
X-Gm-Features: AZwV_QjEYjLK80seHVWR5O0YxU8u9Nr5dBKcu5-KmRV-e-2B8jb8rhN2P1YLyAk
Message-ID: <CAHUa44HZ59JC2X1p0GWGN1TVAoGo9K1emVPrBQon4V0VT960YA@mail.gmail.com>
Subject: Re: [PATCH 04/12] xen/arm: ffa: Add FF-A 1.2 endpoint memory access descriptors
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,linaro.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AE9310E702
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
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
> Functional impact: MEM_SHARE supports FF-A 1.2 EMADs.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_shm.c | 108 +++++++++++++++++++++++++++++--------
>  1 file changed, 86 insertions(+), 22 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index 4c0b45cde6ee..905a64e3db01 100644
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
> @@ -73,7 +81,7 @@ struct ffa_mem_transaction_1_1 {
>  /*
>   * The parts needed from struct ffa_mem_transaction_1_0 or struct
>   * ffa_mem_transaction_1_1, used to provide an abstraction of difference=
 in
> - * data structures between version 1.0 and 1.1. This is just an internal
> + * data structures between version 1.0 and 1.2. This is just an internal
>   * interface and can be changed without changing any ABI.
>   */
>  struct ffa_mem_transaction_int {
> @@ -92,6 +100,8 @@ struct ffa_shm_mem {
>      uint16_t sender_id;
>      uint16_t ep_id;     /* endpoint, the one lending */
>      uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> +    /* Endpoint memory access descriptor IMPDEF value (FF-A 1.2). */
> +    uint64_t impdef[2];
>      unsigned int page_count;
>      struct page_info *pages[];
>  };
> @@ -297,17 +307,21 @@ static void init_range(struct ffa_address_range *ad=
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
>      uint32_t frag_len;
>      uint32_t tot_len;
> +    uint32_t mem_access_size;
> +    uint32_t mem_access_offs;
> +    uint32_t region_offs;
>      paddr_t last_pa;
> +    uint32_t range_count;
>      unsigned int n;
>      paddr_t pa;
>      int32_t ret;
> @@ -326,16 +340,35 @@ static int share_shm(struct ffa_shm_mem *shm)
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
> @@ -349,8 +382,9 @@ static int share_shm(struct ffa_shm_mem *shm)
>          region_descr->address_range_count++;
>      }
>
> -    tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
> -                                region_descr->address_range_count);

Please remove the unused ADDR_RANGE_OFFSET() macro and friends, as
they're no longer accurate.

> +    range_count =3D region_descr->address_range_count;
> +    tot_len =3D region_offs + sizeof(*region_descr) +
> +              range_count * sizeof(struct ffa_address_range);
>      if ( tot_len > max_frag_len )
>      {
>          ret =3D FFA_RET_NOT_SUPPORTED;
> @@ -358,7 +392,7 @@ static int share_shm(struct ffa_shm_mem *shm)
>      }
>
>      addr_range =3D region_descr->address_range_array;
> -    frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count=
, 1);
> +    frag_len =3D region_offs + sizeof(*region_descr) + sizeof(*addr_rang=
e);
>      last_pa =3D page_to_maddr(shm->pages[0]);
>      init_range(addr_range, last_pa);
>      for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> @@ -448,6 +482,12 @@ static int read_mem_transaction(uint32_t ffa_vers, c=
onst void *buf, size_t blen,
>      if ( size * count + offs > blen )
>          return FFA_RET_INVALID_PARAMETERS;
>
> +    if ( size < sizeof(struct ffa_mem_access) )
> +        return FFA_RET_INVALID_PARAMETERS;

Implicitly, size should also be a multiple of 16. Don't you agree?

> +
> +    if ( offs & 0xF )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
>      trans->mem_reg_attr =3D mem_reg_attr;
>      trans->flags =3D flags;
>      trans->mem_access_size =3D size;
> @@ -464,7 +504,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      uint64_t addr =3D get_user_reg(regs, 3);
>      uint32_t page_count =3D get_user_reg(regs, 4);
>      const struct ffa_mem_region *region_descr;
> -    const struct ffa_mem_access *mem_access;
> +    const struct ffa_mem_access_1_2 *mem_access;
>      struct ffa_mem_transaction_int trans;
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
> @@ -474,9 +514,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs=
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
> @@ -515,8 +558,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
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
> @@ -545,13 +588,35 @@ void ffa_handle_mem_share(struct cpu_user_regs *reg=
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
> @@ -559,13 +624,11 @@ void ffa_handle_mem_share(struct cpu_user_regs *reg=
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
> @@ -590,6 +653,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      }
>      shm->sender_id =3D trans.sender_id;
>      shm->ep_id =3D dst_id;
> +    memcpy(shm->impdef, impdef, sizeof(shm->impdef));
>
>      /*
>       * Check that the Composite memory region descriptor fits.
> @@ -605,7 +669,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
>      if ( ret )
>          goto out;
>
> -    ret =3D share_shm(shm);
> +    ret =3D share_shm(shm, ffa_vers);

Shouldn't we rather use ffa_fw_version?

Cheers,
Jens

>      if ( ret )
>          goto out;
>
> --
> 2.50.1 (Apple Git-155)
>

