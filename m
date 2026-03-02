Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGdKF3BZpWlp+AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 10:33:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F091D5995
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 10:33:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244035.1543505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwzeB-0003bb-9i; Mon, 02 Mar 2026 09:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244035.1543505; Mon, 02 Mar 2026 09:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwzeB-0003YW-6n; Mon, 02 Mar 2026 09:33:03 +0000
Received: by outflank-mailman (input) for mailman id 1244035;
 Mon, 02 Mar 2026 09:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xkMV=BC=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vwze9-0003YP-B8
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 09:33:01 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc21db40-161a-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 10:32:58 +0100 (CET)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7d598f4b6fdso963767a34.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 01:32:58 -0800 (PST)
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
X-Inumbo-ID: cc21db40-161a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1772443977; cv=none;
        d=google.com; s=arc-20240605;
        b=k6IoubsQ5ytNlr1nkujopGSKne86IxTyQMSnWl625koCi1Mc5tF2VqVv35LYVtWGUG
         bQCP98NZGaoNOs/C+Otliv8Px7b6GIlHLlukaUttp6H3tIJU9vDCTDBNpJjvkGWnpshi
         opUEE5v4yQvs6l5AMCazrUufbgzkAagY0XccZ92Ji1BXQJq7FF2jP7gPgCmqyXN3cvhf
         AB2OWOKhBiUESJiB7ldIlMfQ8M16XGdJWkNCGEKYDtbGaCF5MUvC8ZDgksa0MQyUgjbV
         qT+Zx7y9pa7qAIRx0aVDGynJtU1WUtAZ8AuKlfN17XtqFMHtRkQaRB1Wsoq6nPbFs4Au
         TrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oz/jjwH9wMeY0dltDZkbDWUYQnrhBJEIc9co1u63XqY=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=MNpl0bmLicJbvbRJ/aTDO3e70jaDX6O0I2gycwVk0XdaibR8oDKJOwqke3YciLanCO
         Bnx6hAhID/FoCXloYYM570kbGs0Vp7RNT58//QNi/KjHt1VotgTqiOOAOkT/jAxZoGAK
         +//xp2kaBj0UuBanvbIYJ7LjHNX+c8nHrIfiyB2pLAO1xjpnWzDL2Ma67lBAcYFzQc7u
         vfgXO6WBZEavSwQOI61pnYH6Zii56iF2iITNqri8bcjRM/VS8n50d2gTQW7uQPPKdflZ
         WUWpesveKIFmkZ2Ufv9+rKdvEwcIuh4f2yW3cOYYeX74rrKQaStVN7ZUD4qRinHw3NGx
         vW6Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772443977; x=1773048777; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz/jjwH9wMeY0dltDZkbDWUYQnrhBJEIc9co1u63XqY=;
        b=FY2ooT3/fk2sDjSFNTqMgYzzUy9QGk6+YrJYc/qy6yzr18pQr7emuWWR3HXljtKvKA
         v7CDMLfvVoShcAextL61pr3yv4SZpnL7SFU4tH2aecAtqHCfkiIbY/tIyFBjZgCmYocQ
         eHdrsySMMYQz6WFxj57qv8jCLRlRXbDIo/KMZ9FBSwHNAdKbMa88x1A+fzKwxNAe8NN5
         MC9EvhT2e1aER1WnGZnrrRK9297QVfJkWJ7sFPkYwk3ydbMKFWPdF732uP/U+RX+xFLM
         Ev77QqqmNzhdZW/RtsKrkYlf5uDwMOGQrwDlfAvY9980pFaQhArKi8yTo29K7+qQeZyv
         Izhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443977; x=1773048777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oz/jjwH9wMeY0dltDZkbDWUYQnrhBJEIc9co1u63XqY=;
        b=qqMZVT9++5gMG5DIWR0NJL9gBCUu5AU3YjemfMD6xyp+FCMjiokhTCpHTodHtz2r0o
         EsEyXiPdAEtG4Sqyn/UcQ2VEfTsNpe3ot6rkoHv3f6Sb/G/OFc9YGcsZBqdCO4DqL9ox
         3ipCrqVPYJXub/uCF8agRuzX1a0+mDd+3jWeCUpjHUpnZ1TGrwZ5Ib1UoKXItL+1Kkbl
         HrtCSdhsf4E3C6i3/AP4pFswvtf38EtngTOoYoLpqE/L1xvNDaz7nRTs8aPIhLu9iBdG
         EOPW+5yIXBubV5iaufLmSCoAQnAYlTgIF5qby7eHkoVWGlqN+g9KmAOMwt64m7E6zEyx
         +PIA==
X-Gm-Message-State: AOJu0Yy+9onrI+N3JHQEJRQlV1Qak71pqiplwnADNTE6y2CqX+hasA3J
	fchK+ztNlGze7MyiI6kJo+sL31g5yhcl0wYsYQ7+qo4/xgzpYr1r7EHjsk38nSQ6HNZ6s0MEEkf
	kshPISv6lybIEdy0zB6EjtPEp9S1kgvVpeWZkttLI3g==
X-Gm-Gg: ATEYQzwCQsy3avJvCATKI3TYFdTIfbtR9HuxVrUXbz8ytH8yVB6k96jgToI0lK81ji8
	GBkuZzXWGPPKWepFERgH+cKDAlD0acRcnUQDq1tm9SPpumN+bb7IvENPGYlYj8vo/VQTDiL9w04
	RTvT0W1/w/et0yAdKENbXpn5NnG/unx3Vj0OpmRZurhFG8mCNb6YQ3aAOwWTefMbsjgcp9Tordb
	ICjfn9dki7XgKO4wzn5pHdJFRUE4DpKGRLXcxXafI0nWkRGDca4mTOYc32LJpbcIECHrydZqP6R
	G1TlltGJVe6anzqSfuYKhLu2zVwSgNf4+sVPTw==
X-Received: by 2002:a05:6870:1cf:b0:409:40bb:6b5d with SMTP id
 586e51a60fabf-41627037555mr7000189fac.32.1772443976705; Mon, 02 Mar 2026
 01:32:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772013062.git.bertrand.marquis@arm.com>
 <0a5f66eaa16f262d4ffad6a8ec4b1b02461f96c1.1772013062.git.bertrand.marquis@arm.com>
 <CAHUa44FSq6aHTO=HWNOB1Qa5keuEfmhwpSW4hRjVgQdUX0fjmA@mail.gmail.com> <9B608F0B-E564-42C6-9F85-E1701F707554@arm.com>
In-Reply-To: <9B608F0B-E564-42C6-9F85-E1701F707554@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 2 Mar 2026 10:32:45 +0100
X-Gm-Features: AaiRm53AaLLoqVe-OrkO3fZ6xPo3jnbDhrINV8JkLnXp54HlRI9BlXX3wdssV5k
Message-ID: <CAHUa44Fv9LuYED_jjW3UeEDZLjL==s0Myw2vD7PSHPUgn-OC3Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] xen/arm: ffa: Cache SP partition info at init
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,linaro.org:email,linaro.org:dkim,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91F091D5995
X-Rspamd-Action: no action

Hi Bertrand,

On Mon, Mar 2, 2026 at 9:51=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 27 Feb 2026, at 11:39, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Wed, Feb 25, 2026 at 11:02=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> FFA_PARTITION_INFO_GET currently queries the SPMC on each call and wal=
ks the
> >> RX buffer every time. The SP list is expected to be static, so repeate=
d
> >> firmware calls and validation are unnecessary.
> >>
> >> Cache the SPMC partition-info list at init time, keeping only secure
> >> endpoints, and reuse the cached entries for SP count and partition-inf=
o
> >> responses. Initialize the VM create/destroy subscriber lists from the =
cached
> >> list and free the cache on init failure.
> >>
> >> SP partition info now reflects the init-time snapshot and will not cha=
nge.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa_partinfo.c | 205 +++++++++++++++++++++-----------
> >> 1 file changed, 138 insertions(+), 67 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_pa=
rtinfo.c
> >> index 6a6f3ffb822e..8a3eac25f99f 100644
> >> --- a/xen/arch/arm/tee/ffa_partinfo.c
> >> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> >> @@ -6,6 +6,7 @@
> >> #include <xen/const.h>
> >> #include <xen/sizes.h>
> >> #include <xen/types.h>
> >> +#include <xen/xmalloc.h>
> >>
> >> #include <asm/smccc.h>
> >> #include <asm/regs.h>
> >> @@ -33,6 +34,10 @@ static uint16_t subscr_vm_created_count __read_most=
ly;
> >> static uint16_t *subscr_vm_destroyed __read_mostly;
> >> static uint16_t subscr_vm_destroyed_count __read_mostly;
> >>
> >> +/* SP list cache (secure endpoints only); populated at init. */
> >> +static void *sp_list __read_mostly;
> >> +static uint32_t sp_list_count __read_mostly;
> >> +static uint32_t sp_list_entry_size __read_mostly;
> >> static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t f=
lags,
> >>                                       uint32_t *count, uint32_t *fpi_s=
ize)
> >> {
> >> @@ -79,92 +84,78 @@ static int32_t ffa_copy_info(void **dst, void *dst=
_end, const void *src,
> >>     return FFA_RET_OK;
> >> }
> >>
> >> -static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_co=
unt)
> >> +static bool ffa_sp_entry_matches_uuid(const void *entry, struct ffa_u=
uid uuid)
> >> {
> >> -    uint32_t src_size;
> >> +    const struct ffa_partition_info_1_1 *fpi =3D entry;
> >> +    struct ffa_uuid sp_uuid;
> >> +
> >> +    if ( ffa_uuid_is_nil(uuid) )
> >> +        return true;
> >>
> >> -    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_=
FLAG,
> >> -                                  sp_count, &src_size);
> >> +    if ( sp_list_entry_size < sizeof(*fpi) )
> >> +        return false;
> >
> > This can never happen since we don't accept SPMC below version 1.1. We
> > even have a check to ensure the SPMC doesn't return a too-small
> > spi_size.
>
> I tried to make the code forward compatible. It is not really a possible =
case right now
> but we could fall into this in the future.

At the moment, it's only ffa_sp_list_cache_init(), which initializes
and puts things in the SP. So as long as ffa_sp_list_cache_init() and
this function are in sync, there should be no problem. It simplifies
things if we can trust the SP cache to be usable.

>
> >
> >> +
> >> +    memcpy(&sp_uuid, fpi->uuid, sizeof(sp_uuid));
> >> +    return ffa_uuid_equal(uuid, sp_uuid);
> >> }
> >>
> >> -static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp=
_count,
> >> -                                   void **dst_buf, void *end_buf,
> >> -                                   uint32_t dst_size)
> >> +static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_co=
unt)
> >> {
> >> -    int32_t ret;
> >> -    int32_t release_ret;
> >> -    uint32_t src_size, real_sp_count;
> >> -    void *src_buf;
> >>     uint32_t count =3D 0;
> >> -    bool notify_fw =3D false;
> >> -
> >> -    /* We need to use the RX buffer to receive the list */
> >> -    src_buf =3D ffa_rxtx_spmc_rx_acquire();
> >> -    if ( !src_buf )
> >> -        return FFA_RET_DENIED;
> >> -
> >> -    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size=
);
> >> -    if ( ret )
> >> -        goto out;
> >> -    notify_fw =3D true;
> >> +    uint32_t n;
> >>
> >> -    /* Validate the src_size we got */
> >> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
> >> -         src_size >=3D FFA_PAGE_SIZE )
> >> +    for ( n =3D 0; n < sp_list_count; n++ )
> >>     {
> >> -        ret =3D FFA_RET_NOT_SUPPORTED;
> >> -        goto out;
> >> +        void *entry =3D sp_list + n * sp_list_entry_size;
> >> +
> >> +        if ( ffa_sp_entry_matches_uuid(entry, uuid) )
> >> +            count++;
> >>     }
> >>
> >> -    /*
> >> -     * Limit the maximum time we hold the CPU by limiting the number =
of SPs.
> >> -     * We just ignore the extra ones as this is tested during init in
> >> -     * ffa_partinfo_init so the only possible reason is SP have been =
added
> >> -     * since boot.
> >> -     */
> >> -    if ( real_sp_count > FFA_MAX_NUM_SP )
> >> -        real_sp_count =3D FFA_MAX_NUM_SP;
> >> +    *sp_count =3D count;
> >>
> >> -    /* Make sure the data fits in our buffer */
> >> -    if ( real_sp_count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / src_=
size )
> >> -    {
> >> -        ret =3D FFA_RET_NOT_SUPPORTED;
> >> -        goto out;
> >> -    }
> >> +    if ( !ffa_uuid_is_nil(uuid) && !count )
> >> +        return FFA_RET_INVALID_PARAMETERS;
> >>
> >> -    for ( uint32_t sp_num =3D 0; sp_num < real_sp_count; sp_num++ )
> >> -    {
> >> -        struct ffa_partition_info_1_1 *fpi =3D src_buf;
> >> +    return FFA_RET_OK;
> >> +}
> >>
> >> -        /* filter out SP not following bit 15 convention if any */
> >> -        if ( FFA_ID_IS_SECURE(fpi->id) )
> >> -        {
> >> -            /*
> >> -             * If VM is 1.0 but firmware is 1.1 we could have several=
 entries
> >> -             * with the same ID but different UUIDs. In this case the=
 VM will
> >> -             * get a list with several time the same ID.
> >> -             * This is a non-compliance to the specification but 1.0 =
VMs should
> >> -             * handle that on their own to simplify Xen implementatio=
n.
> >> -             */
> >> +static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp=
_count,
> >> +                                   void **dst_buf, void *end_buf,
> >> +                                   uint32_t dst_size)
> >> +{
> >> +    int32_t ret;
> >> +    uint32_t count =3D 0;
> >> +    uint32_t n;
> >>
> >> -            ret =3D ffa_copy_info(dst_buf, end_buf, src_buf, dst_size=
, src_size);
> >> -            if ( ret )
> >> -                goto out;
> >> +    for ( n =3D 0; n < sp_list_count; n++ )
> >> +    {
> >> +        void *entry =3D sp_list + n * sp_list_entry_size;
> >>
> >> -            count++;
> >> -        }
> >> +        if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
> >> +            continue;
> >>
> >> -        src_buf +=3D src_size;
> >> +        /*
> >> +         * If VM is 1.0 but firmware is 1.1 we could have several ent=
ries
> >> +         * with the same ID but different UUIDs. In this case the VM =
will
> >> +         * get a list with several time the same ID.
> >> +         * This is a non-compliance to the specification but 1.0 VMs =
should
> >> +         * handle that on their own to simplify Xen implementation.
> >> +         */
> >> +        ret =3D ffa_copy_info(dst_buf, end_buf, entry, dst_size,
> >> +                            sp_list_entry_size);
> >> +        if ( ret )
> >> +            return ret;
> >> +
> >> +        count++;
> >>     }
> >>
> >>     *sp_count =3D count;
> >>
> >> -out:
> >> -    release_ret =3D ffa_rxtx_spmc_rx_release(notify_fw);
> >> -    if ( release_ret )
> >> -        gprintk(XENLOG_WARNING,
> >> -                "ffa: Error releasing SPMC RX buffer: %d\n", release_=
ret);
> >> -    return ret;
> >> +    if ( !ffa_uuid_is_nil(uuid) && !count )
> >> +        return FFA_RET_INVALID_PARAMETERS;
> >> +
> >> +    return FFA_RET_OK;
> >> }
> >>
> >> static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t star=
t_index,
> >> @@ -435,6 +426,14 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp=
_id, uint16_t vm_id,
> >>     return res;
> >> }
> >>
> >> +static void ffa_sp_list_cache_free(void)
> >> +{
> >> +    XFREE(sp_list);
> >> +    sp_list =3D NULL;
> >
> > XFREE() is already setting sp_list to NULL.
>
> Ack will fix in v2
>
> >
> >> +    sp_list_count =3D 0;
> >> +    sp_list_entry_size =3D 0;
> >> +}
> >> +
> >> static void uninit_subscribers(void)
> >> {
> >>         subscr_vm_created_count =3D 0;
> >> @@ -443,6 +442,68 @@ static void uninit_subscribers(void)
> >>         XFREE(subscr_vm_destroyed);
> >> }
> >>
> >> +static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
> >> +                                   uint32_t fpi_size)
> >> +{
> >> +    const uint8_t *src =3D buf;
> >> +    uint32_t secure_count =3D 0;
> >> +    uint32_t n, idx =3D 0;
> >> +    bool warned =3D false;
> >> +
> >> +    if ( fpi_size < sizeof(struct ffa_partition_info_1_0) ||
> >> +         fpi_size >=3D FFA_PAGE_SIZE )
> >> +        return false;
> >
> > Would it make sense to check that fpi_size is well aligned with struct
> > ffa_partition_info_1_0? If it's an odd size, we'll make unaligned
> > accesses below with memcpy(). But perhaps that's a bit much. The SPMC
> > isn't supposed to provide garbage.
>
> Memcpy should prevent issues even if accesses are not aligned.
> If we had this test, we cannot return an error to the SPMC so we would ha=
ve to
> generate one to the caller. It is simpler i think to handle non-aligned a=
s we do not
> expect the SPMC to generate such a case.
> Tell me if you agree.

We dereference fpi below, and depending on compiler flags and pointer
types, memcpy() might not be safe with unaligned pointers.
From 6.3.2.3 Pointers, paragraph 7, in the C standard:
"A pointer to an object type may be converted to a pointer to a
different object type. If the
resulting pointer is not correctly aligned for the referenced type,
the behavior is
unde=EF=AC=81ned."

I've seen past examples where the compiler optimized memcpy() in a way
that breaks with unaligned pointers.

We don't expect the test above to fail, but if it does we will not use
the secure firmware. I think refusing unexpected sizes is even
simpler. It should make finding eventual errors much easier.

So my question above is whether it's worth checking that fpi_size is
well-aligned, or if it's so unlikely that we don't need to consider
it.

Cheers,
Jens

>
> >
> >> +
> >> +    if ( count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / fpi_size )
> >> +        return false;
> >> +
> >> +    for ( n =3D 0; n < count; n++ )
> >> +    {
> >> +        const struct ffa_partition_info_1_0 *fpi =3D
> >> +            (const void *)(src + n * fpi_size);
> >> +
> >> +        if ( !FFA_ID_IS_SECURE(fpi->id) )
> >> +        {
> >> +            if ( !warned )
> >
> > Is this needed? Doesn't printk_once() already ensure this? Or did you
> > happen to leave printk_once() by mistake and meant for this to be
> > printed once each time ffa_sp_list_cache_init() is called, since
> > "warned" isn't static.
>
> Very right, i need to remove the warned, printk_once should be enough her=
e.
>
> >
> >> +            {
> >> +                printk_once(XENLOG_ERR
> >> +                            "ffa: Firmware is not using bit 15 conven=
tion for IDs !!\n");
> >> +                warned =3D true;
> >> +            }
> >> +            printk(XENLOG_ERR
> >> +                   "ffa: Secure partition with id 0x%04x cannot be us=
ed\n",
> >> +                   fpi->id);
> >> +            continue;
> >> +        }
> >> +
> >> +        secure_count++;
> >> +    }
> >> +
> >> +    if ( secure_count )
> >> +    {
> >> +        sp_list =3D xzalloc_bytes(secure_count * fpi_size);
> >> +        if ( !sp_list )
> >> +            return false;
> >> +    }
> >> +
> >> +    sp_list_count =3D secure_count;
> >> +    sp_list_entry_size =3D fpi_size;
> >> +
> >> +    for ( n =3D 0; n < count; n++ )
> >> +    {
> >> +        const struct ffa_partition_info_1_0 *fpi =3D
> >> +            (const void *)(src + n * fpi_size);
> >> +
> >> +        if ( !FFA_ID_IS_SECURE(fpi->id) )
> >> +            continue;
> >> +
> >> +        memcpy(sp_list + idx * fpi_size, fpi, fpi_size);
> >> +        idx++;
> >> +    }
> >> +
> >> +    return true;
> >> +}
> >> +
> >> static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_s=
ize)
> >> {
> >>     uint16_t n;
> >> @@ -549,12 +610,22 @@ bool ffa_partinfo_init(void)
> >>         goto out;
> >>     }
> >>
> >> -    ret =3D init_subscribers(spmc_rx, count, fpi_size);
> >> +    if ( !ffa_sp_list_cache_init(spmc_rx, count, fpi_size) )
> >> +    {
> >> +        printk(XENLOG_ERR "ffa: Failed to cache SP list\n");
> >> +        goto out;
> >> +    }
> >> +
> >> +    ret =3D init_subscribers(sp_list, sp_list_count, sp_list_entry_si=
ze);
> >>
> >> out:
> >>     e =3D ffa_rxtx_spmc_rx_release(notify_fw);
> >>     if ( e )
> >>         printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d=
\n", e);
> >> +    if ( !ret )
> >> +        uninit_subscribers();
> >
> > ret is initially false and can only be set to true if
> > init_subscribers() returns true. So there's never any point in calling
> > uninit_subscribers().
>
> True, I will fix that.
>
> >
> >> +    if ( !ret )
> >> +        ffa_sp_list_cache_free();
> >
> > ret can be false even if ffa_sp_list_cache_init() hasn't been called
> > yet. Calling ffa_sp_list_cache_free() anyway is harmless, but not
> > elegant.
>
> yes, i will rework a bit the cleanup logic here.
>
> Thanks for the review
>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >>     return ret;
> >> }
> >>
> >> --
> >> 2.52.0
>
>

