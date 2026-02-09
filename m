Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKtQIlkEimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:59:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D491123FF
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225652.1532209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTfM-0007yS-Ck; Mon, 09 Feb 2026 15:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225652.1532209; Mon, 09 Feb 2026 15:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTfM-0007vZ-9b; Mon, 09 Feb 2026 15:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1225652;
 Mon, 09 Feb 2026 15:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/H=AN=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vpTfK-0007vT-M9
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:59:10 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fb9b7fd-05d0-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:59:01 +0100 (CET)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-409470ad5bbso1090178fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 07:59:01 -0800 (PST)
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
X-Inumbo-ID: 3fb9b7fd-05d0-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770652740; cv=none;
        d=google.com; s=arc-20240605;
        b=cyVKPXdEdRmzombBCoPJcwFJrnpWkUru4dciuEkuYJHeG2ZSBORCu5gX4ithBTwppS
         FOf/yPBRe7JuZp9TIB7DE8uRw1zfAkM5Dq/YftAeEDMOHC5XRWpdfeB/YJXNZTAZDhFg
         gF2BAOKZIzvEbhm5zRNg+niM9wokohktMmNs3JG4rhAQNIoNY2ANdzcFuUdh41uQ7uko
         0hEsDsSoy1nXKJPYzzi+vpeJtUjuKqvAM4XAYQs9FjN4JFSJhtjH8POlgEAHcGXqKKXq
         /tOPE43CW5e3dIz5bdFA8qKC7I/kWyCfeILwxxOgxf5UD6jaOI4D6w/wJ+WTyl5gcQc2
         eTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cSa/Wv7wZ4Hlv0Oe1UZ8HrxPfw35imhD2B4tJvjAK6U=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=KrhpBrIay2DDr7uU8c5JXJmTu/4lqKgtH6+e92F0GdxTaYzT3+Cbf8mCX0nFOE827p
         0OUV1Btl3nEgE0q9LuJL8Qjp0etmkG5RXoXix+M/2FA4HhkYTXN6vKTTMoXf2Yim94o7
         lex19Ozq0E1NhJIT2aFpR3AHgvZjXLyn0gf4JIP0NC3KCFlh8Y9pcH1R4HiUGiyAOxf0
         ik0t3vXdXN3Gmx3iHgFVnhF1Jyd+RxtVGzhCmDJsvsxNNcL8Cw+Wh0nWROflz1tTAn2i
         Y+MNp0190iClJAofALXam3zGAwTI3XeEOyQnfkNaIbLqikhoEsXs6fzmd0Nvgl5mP7BV
         olZA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770652740; x=1771257540; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSa/Wv7wZ4Hlv0Oe1UZ8HrxPfw35imhD2B4tJvjAK6U=;
        b=eXIIqx1gNADwmoComEbjP1gGZgWLIDsMV8uXnfyc0KFvQYO4BEGZ+sFt5Crq6By3r9
         wAwfQ3c7rE6EBCedQe/xuLpJJwxyUZKE1LzG/NFwOw25PNO/UWNCPBDWPmgN0j089oEI
         Hb244mxlFYYp3l+VQj7G8KffjLzwqQFFHT5Z8NgFYh5C7jSZ9xiyPFcClUPhymTNcYIn
         Yb8feJxmWBmRa29H8K2l5rC/BYRpLkq/Kfaa7bs8wqlK+sNB7Kqwf6zoagXjfn6qYCJ3
         iHzKeQdh+fegjWKFd1VfVAyyUtjTf284XncgYhew5I3/15xBqbYLW6uzKLlZYdvBzL2n
         BvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770652740; x=1771257540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cSa/Wv7wZ4Hlv0Oe1UZ8HrxPfw35imhD2B4tJvjAK6U=;
        b=uKWgerMRb1dAERQI45D9OQMIQtXAPOXTHqfie6IXhS/lAO7L+eWE9TcXf5itkrOYa/
         eiuVcgUVnS/hzRSw9f99ec5SF+SY68x9Fpe8wYrJuXBoZDYKdgZd8WxyIm4K5hKQUp1w
         GQDu7cPNSEtVI1te6ct8pmbLacLjKP66QY3Gf/8OwDeRqeJp5MnQKYEx9jSRrmEiBYNn
         bHH3v0Qv7LuUioRDOfN3Xpk8TcJxHqt3iHjRcGX3uh2JSWqNGaoLGJz2i2q5j9KzR9gx
         jA2g5IvNgk4hJYFyNxqGMSL2tirVclm75vXbHtV2Ipp4uA11WXvzutVNCXQwGHyiKVop
         /5Dg==
X-Gm-Message-State: AOJu0YyMQ+lKayIIFyQNLsNzpQwOpsk21Pv0UmDK/X9d4fYCzRZz3YAk
	dkJJ4GtAkB109UHUz0+XAMnhRCFPJ3RqmMIS2i6a0rL2KdF3CZh4pYsaK0XfHHCnw9GT6rtR24u
	8xDmJWyQiH+n6oPnwrrnGYZY5ruYK8mLhahtjQ0zBfw==
X-Gm-Gg: AZuq6aIkIj6jf4D/9mg/8piv53YM+vNSAXiTezQQJE4C2qqCZdwTcCYYTOrwtusRVwx
	P+6MJe2LMi4mtlVGOTOeKOMWsPzlgshQfTCArBaG5K4frY5FOal+S3HtZlAIQSSt4sM2OgeGlkv
	LPGfY4LygsvGo6XMGJ9HFgR/xkrh3g+z9MP9OLlcYLSJ2GhunMBW8diFlq7N/xgrQj+DqLhGPjm
	zXxh6nLqXI4ZLWvmDwxJGdddgzd/X4h+twJU9mjLl643eYd0P6SaO2JPvqGsAabE+QRuNaj6mn0
	m7vuxWOCGdhD1tK3bjevpQX47A==
X-Received: by 2002:a05:6870:fb8f:b0:3ec:9c0c:283a with SMTP id
 586e51a60fabf-40a96cddaacmr6056897fac.24.1770652739582; Mon, 09 Feb 2026
 07:58:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <a8d316dbdbd00a7980c6d527038f9046bb895c69.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44HZ59JC2X1p0GWGN1TVAoGo9K1emVPrBQon4V0VT960YA@mail.gmail.com> <1A922065-D0DC-4930-806C-6C202B5A6957@arm.com>
In-Reply-To: <1A922065-D0DC-4930-806C-6C202B5A6957@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 9 Feb 2026 16:58:48 +0100
X-Gm-Features: AZwV_Qhc75scEaEIUlr-5KEopBKl8tD2-FV-XKlqVTAhyFrwLnljNOG3GWxGjn4
Message-ID: <CAHUa44E3zv0rNSv68vSkzzV7LQRfgHLq41YdOD5ZZXf+bhJoZQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] xen/arm: ffa: Add FF-A 1.2 endpoint memory access descriptors
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email,linaro.org:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F0D491123FF
X-Rspamd-Action: no action

Hi Bertrand,

On Mon, Feb 9, 2026 at 3:50=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 9 Feb 2026, at 11:57, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> FF-A 1.2 extends the endpoint memory access descriptor (EMAD) from
> >> 16 to 32 bytes, adding implementation-defined (IMPDEF) fields and
> >> reserved space. The MEM_SHARE path currently assumes the 1.1 EMAD
> >> size and rejects the 1.2 layout.
> >>
> >> Add FF-A 1.2 EMAD support to MEM_SHARE:
> >> - define ffa_mem_access_1_2 and store IMPDEF payload in ffa_shm_mem
> >> - emit 1.2 EMADs to the SPMC for FF-A 1.2 guests, forwarding IMPDEF
> >> - refactor header parsing into read_mem_transaction() for 1.0/1.1+
> >> - detect EMAD format by mem_access_size to allow 1.1 on 1.2 guests
> >>
> >> Functional impact: MEM_SHARE supports FF-A 1.2 EMADs.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa_shm.c | 108 +++++++++++++++++++++++++++++--------
> >> 1 file changed, 86 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> >> index 4c0b45cde6ee..905a64e3db01 100644
> >> --- a/xen/arch/arm/tee/ffa_shm.c
> >> +++ b/xen/arch/arm/tee/ffa_shm.c
> >> @@ -30,6 +30,14 @@ struct ffa_mem_access {
> >>     uint64_t reserved;
> >> };
> >>
> >> +/* Endpoint memory access descriptor (FF-A 1.2) */
> >> +struct ffa_mem_access_1_2 {
> >> +    struct ffa_mem_access_perm access_perm;
> >> +    uint32_t region_offs;
> >> +    uint8_t impdef[16];
> >> +    uint8_t reserved[8];
> >> +};
> >> +
> >> /* Lend, donate or share memory transaction descriptor */
> >> struct ffa_mem_transaction_1_0 {
> >>     uint16_t sender_id;
> >> @@ -73,7 +81,7 @@ struct ffa_mem_transaction_1_1 {
> >> /*
> >>  * The parts needed from struct ffa_mem_transaction_1_0 or struct
> >>  * ffa_mem_transaction_1_1, used to provide an abstraction of differen=
ce in
> >> - * data structures between version 1.0 and 1.1. This is just an inter=
nal
> >> + * data structures between version 1.0 and 1.2. This is just an inter=
nal
> >>  * interface and can be changed without changing any ABI.
> >>  */
> >> struct ffa_mem_transaction_int {
> >> @@ -92,6 +100,8 @@ struct ffa_shm_mem {
> >>     uint16_t sender_id;
> >>     uint16_t ep_id;     /* endpoint, the one lending */
> >>     uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> >> +    /* Endpoint memory access descriptor IMPDEF value (FF-A 1.2). */
> >> +    uint64_t impdef[2];
> >>     unsigned int page_count;
> >>     struct page_info *pages[];
> >> };
> >> @@ -297,17 +307,21 @@ static void init_range(struct ffa_address_range =
*addr_range,
> >>  * This function uses the ffa_spmc tx buffer to transmit the memory tr=
ansaction
> >>  * descriptor.
> >>  */
> >> -static int share_shm(struct ffa_shm_mem *shm)
> >> +static int share_shm(struct ffa_shm_mem *shm, uint32_t ffa_vers)
> >> {
> >>     const uint32_t max_frag_len =3D FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZ=
E;
> >>     struct ffa_mem_access *mem_access_array;
> >> +    struct ffa_mem_access_1_2 *mem_access_array_1_2;
> >>     struct ffa_mem_transaction_1_1 *descr;
> >>     struct ffa_address_range *addr_range;
> >>     struct ffa_mem_region *region_descr;
> >> -    const unsigned int region_count =3D 1;
> >>     uint32_t frag_len;
> >>     uint32_t tot_len;
> >> +    uint32_t mem_access_size;
> >> +    uint32_t mem_access_offs;
> >> +    uint32_t region_offs;
> >>     paddr_t last_pa;
> >> +    uint32_t range_count;
> >>     unsigned int n;
> >>     paddr_t pa;
> >>     int32_t ret;
> >> @@ -326,16 +340,35 @@ static int share_shm(struct ffa_shm_mem *shm)
> >>     descr->handle =3D shm->handle;
> >>     descr->mem_reg_attr =3D FFA_NORMAL_MEM_REG_ATTR;
> >>     descr->mem_access_count =3D 1;
> >> -    descr->mem_access_size =3D sizeof(*mem_access_array);
> >> -    descr->mem_access_offs =3D MEM_ACCESS_OFFSET(0);
> >> +    if ( ffa_vers >=3D FFA_VERSION_1_2 )
> >> +        mem_access_size =3D sizeof(struct ffa_mem_access_1_2);
> >> +    else
> >> +        mem_access_size =3D sizeof(struct ffa_mem_access);
> >> +    mem_access_offs =3D sizeof(struct ffa_mem_transaction_1_1);
> >> +    region_offs =3D mem_access_offs + mem_access_size;
> >> +    descr->mem_access_size =3D mem_access_size;
> >> +    descr->mem_access_offs =3D mem_access_offs;
> >>
> >> -    mem_access_array =3D buf + descr->mem_access_offs;
> >> -    memset(mem_access_array, 0, sizeof(*mem_access_array));
> >> -    mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> >> -    mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> >> -    mem_access_array[0].region_offs =3D REGION_OFFSET(descr->mem_acce=
ss_count, 0);
> >> +    if ( ffa_vers >=3D FFA_VERSION_1_2 )
> >> +    {
> >> +        mem_access_array_1_2 =3D buf + mem_access_offs;
> >> +        memset(mem_access_array_1_2, 0, sizeof(*mem_access_array_1_2)=
);
> >> +        mem_access_array_1_2[0].access_perm.endpoint_id =3D shm->ep_i=
d;
> >> +        mem_access_array_1_2[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> >> +        mem_access_array_1_2[0].region_offs =3D region_offs;
> >> +        memcpy(mem_access_array_1_2[0].impdef, shm->impdef,
> >> +               sizeof(mem_access_array_1_2[0].impdef));
> >> +    }
> >> +    else
> >> +    {
> >> +        mem_access_array =3D buf + mem_access_offs;
> >> +        memset(mem_access_array, 0, sizeof(*mem_access_array));
> >> +        mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> >> +        mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> >> +        mem_access_array[0].region_offs =3D region_offs;
> >> +    }
> >>
> >> -    region_descr =3D buf + mem_access_array[0].region_offs;
> >> +    region_descr =3D buf + region_offs;
> >>     memset(region_descr, 0, sizeof(*region_descr));
> >>     region_descr->total_page_count =3D shm->page_count;
> >>
> >> @@ -349,8 +382,9 @@ static int share_shm(struct ffa_shm_mem *shm)
> >>         region_descr->address_range_count++;
> >>     }
> >>
> >> -    tot_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_cou=
nt,
> >> -                                region_descr->address_range_count);
> >
> > Please remove the unused ADDR_RANGE_OFFSET() macro and friends, as
> > they're no longer accurate.
>
> Very true, will remove them in v2.
>
> >
> >> +    range_count =3D region_descr->address_range_count;
> >> +    tot_len =3D region_offs + sizeof(*region_descr) +
> >> +              range_count * sizeof(struct ffa_address_range);
> >>     if ( tot_len > max_frag_len )
> >>     {
> >>         ret =3D FFA_RET_NOT_SUPPORTED;
> >> @@ -358,7 +392,7 @@ static int share_shm(struct ffa_shm_mem *shm)
> >>     }
> >>
> >>     addr_range =3D region_descr->address_range_array;
> >> -    frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_co=
unt, 1);
> >> +    frag_len =3D region_offs + sizeof(*region_descr) + sizeof(*addr_r=
ange);
> >>     last_pa =3D page_to_maddr(shm->pages[0]);
> >>     init_range(addr_range, last_pa);
> >>     for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> >> @@ -448,6 +482,12 @@ static int read_mem_transaction(uint32_t ffa_vers=
, const void *buf, size_t blen,
> >>     if ( size * count + offs > blen )
> >>         return FFA_RET_INVALID_PARAMETERS;
> >>
> >> +    if ( size < sizeof(struct ffa_mem_access) )
> >> +        return FFA_RET_INVALID_PARAMETERS;
> >
> > Implicitly, size should also be a multiple of 16. Don't you agree?
>
> The spec is giving some constraints on the offset but there is nothing ex=
plicit for the
> per mem access size. As we have no 64bit fields in it, I am not really se=
eing any
> implicit multiple of 16.

I was perhaps assuming too much. The offset is required to be a
multiple of 16, so it would make sense for all elements in the array
to be at a 16-byte aligned offset.

>
> I am checking the offset because it is enforced by the spec but for the s=
ize i would
> rather not put something as who knows what might be added in the future.

It's not important right now, since we only accept a single EMAD. But
once we accept more than one, the second EMAD might be accessed from
an unaligned address if we're not careful.

>
> >
> >> +
> >> +    if ( offs & 0xF )
> >> +        return FFA_RET_INVALID_PARAMETERS;
> >> +
> >>     trans->mem_reg_attr =3D mem_reg_attr;
> >>     trans->flags =3D flags;
> >>     trans->mem_access_size =3D size;
> >> @@ -464,7 +504,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *re=
gs)
> >>     uint64_t addr =3D get_user_reg(regs, 3);
> >>     uint32_t page_count =3D get_user_reg(regs, 4);
> >>     const struct ffa_mem_region *region_descr;
> >> -    const struct ffa_mem_access *mem_access;
> >> +    const struct ffa_mem_access_1_2 *mem_access;
> >>     struct ffa_mem_transaction_int trans;
> >>     struct domain *d =3D current->domain;
> >>     struct ffa_ctx *ctx =3D d->arch.tee;
> >> @@ -474,9 +514,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *r=
egs)
> >>     register_t handle_hi =3D 0;
> >>     register_t handle_lo =3D 0;
> >>     int ret =3D FFA_RET_DENIED;
> >> +    uint32_t ffa_vers;
> >>     uint32_t range_count;
> >>     uint32_t region_offs;
> >>     uint16_t dst_id;
> >> +    uint8_t perm;
> >> +    uint64_t impdef[2];
> >>
> >>     if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
> >>     {
> >> @@ -515,8 +558,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *re=
gs)
> >>     if ( frag_len > tx_size )
> >>         goto out_unlock;
> >>
> >> -    ret =3D read_mem_transaction(ACCESS_ONCE(ctx->guest_vers), tx_buf=
,
> >> -                               frag_len, &trans);
> >> +    ffa_vers =3D ACCESS_ONCE(ctx->guest_vers);
> >> +    ret =3D read_mem_transaction(ffa_vers, tx_buf, frag_len, &trans);
> >>     if ( ret )
> >>         goto out_unlock;
> >>
> >> @@ -545,13 +588,35 @@ void ffa_handle_mem_share(struct cpu_user_regs *=
regs)
> >>         goto out_unlock;
> >>     }
> >>
> >> +    if ( trans.mem_access_size < sizeof(struct ffa_mem_access) )
> >> +    {
> >> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        goto out_unlock;
> >> +    }
> >> +
> >>     /* Check that it fits in the supplied data */
> >>     if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
> >>         goto out_unlock;
> >>
> >>     mem_access =3D tx_buf + trans.mem_access_offs;
> >> -
> >>     dst_id =3D ACCESS_ONCE(mem_access->access_perm.endpoint_id);
> >> +    perm =3D ACCESS_ONCE(mem_access->access_perm.perm);
> >> +    region_offs =3D ACCESS_ONCE(mem_access->region_offs);
> >> +
> >> +    /*
> >> +     * FF-A 1.2 introduced an extended mem_access descriptor with imp=
def
> >> +     * fields, but guests can still use the 1.1 format if they don't =
need
> >> +     * implementation-defined data. Detect which format is used based=
 on
> >> +     * the mem_access_size field rather than the negotiated FF-A vers=
ion.
> >> +     */
> >> +    if ( trans.mem_access_size >=3D sizeof(struct ffa_mem_access_1_2)=
 )
> >> +        memcpy(impdef, mem_access->impdef, sizeof(impdef));
> >> +    else
> >> +    {
> >> +        impdef[0] =3D 0;
> >> +        impdef[1] =3D 0;
> >> +    }
> >> +
> >>     if ( !FFA_ID_IS_SECURE(dst_id) )
> >>     {
> >>         /* we do not support sharing with VMs */
> >> @@ -559,13 +624,11 @@ void ffa_handle_mem_share(struct cpu_user_regs *=
regs)
> >>         goto out_unlock;
> >>     }
> >>
> >> -    if ( ACCESS_ONCE(mem_access->access_perm.perm) !=3D FFA_MEM_ACC_R=
W )
> >> +    if ( perm !=3D FFA_MEM_ACC_RW )
> >>     {
> >>         ret =3D FFA_RET_NOT_SUPPORTED;
> >>         goto out_unlock;
> >>     }
> >> -
> >> -    region_offs =3D ACCESS_ONCE(mem_access->region_offs);
> >>     if ( sizeof(*region_descr) + region_offs > frag_len )
> >>     {
> >>         ret =3D FFA_RET_NOT_SUPPORTED;
> >> @@ -590,6 +653,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *re=
gs)
> >>     }
> >>     shm->sender_id =3D trans.sender_id;
> >>     shm->ep_id =3D dst_id;
> >> +    memcpy(shm->impdef, impdef, sizeof(shm->impdef));
> >>
> >>     /*
> >>      * Check that the Composite memory region descriptor fits.
> >> @@ -605,7 +669,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *re=
gs)
> >>     if ( ret )
> >>         goto out;
> >>
> >> -    ret =3D share_shm(shm);
> >> +    ret =3D share_shm(shm, ffa_vers);
> >
> > Shouldn't we rather use ffa_fw_version?
>
> Definitely yes.
>
> In fact i have done this in a follow up patch and i need to export the fw=
 version to be able to
> do that but I will bring that forward and do it here, that makes a lot mo=
re sense.

Sounds good.

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >>     if ( ret )
> >>         goto out;
> >>
> >> --
> >> 2.50.1 (Apple Git-155)
>
>

