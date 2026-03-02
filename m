Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODW9KlphpWmx+wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 11:07:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040451D60C0
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 11:07:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244078.1543543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx0B4-00013a-KJ; Mon, 02 Mar 2026 10:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244078.1543543; Mon, 02 Mar 2026 10:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx0B4-00010j-HU; Mon, 02 Mar 2026 10:07:02 +0000
Received: by outflank-mailman (input) for mailman id 1244078;
 Mon, 02 Mar 2026 10:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xkMV=BC=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vx0B3-00010d-AL
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 10:07:01 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a59ea01-161f-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 11:06:55 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7d1872504cbso1855805a34.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 02:06:55 -0800 (PST)
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
X-Inumbo-ID: 8a59ea01-161f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1772446014; cv=none;
        d=google.com; s=arc-20240605;
        b=TpCwPOVjn3owzxUMtGbylauYIrmTtbo9AeBeJwfT0uXdupYL/E06gqI4pfGamhPJ+F
         RNhehsvRgg9AFdbRerb9BYDvg6yGygQfkM6i0qcqmKjSXUResmrH6dL7pkpD6BniibQf
         1wbsnF2mjXL2ZEyalataTfYa1PB27dYB/6mfYV+KpF+Aba5aj04/JgP1c28VQJ0vLyA9
         c6m5/AA798+JozkIdELGRiQR1ZRXuaU+lE6psX3A79KyZekUthhCEMfwkJ0ryKcQt9eB
         hX417r8URpSTfBAyp7U0hUjmaS3qblLIibq6suKAunqWgvaE7aixvk/v+HImBbyk334I
         u7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ne+Ffqddt+jp/TSNBA9XZK1oaixSm2EvzlC0rKoP8EA=;
        fh=wB0f5JGUSpWYejuxtnrl8SDqvqyWrEsEaWvC32LbdiU=;
        b=kbIF8In98CP/aTAOJ5M59WujFW3ZL7gn5pb0h737FLWo4EBr30PsfK4s5XYIT9I05N
         FxgiOnxBcfHhM88/PGd87t9XRVXtnbIbhKmZO5rw3gKiwRX68tzLJzCegBf8p4iMpODe
         xn3ByHqkXz0RhC09T83lcuZXb4VggsWD/XZVtjMjXhhSezS5W2Z88rt/phYLZNSw8O82
         oN5gdHDA+zaNTdSHHQx6pfC2UMEYa5bLdI7L+usPp12zc0sMjda2b+cQkNhEiY71ZzYX
         hnMJfq9vr8GnPnE/iur+zN7RFTMXPBFE730c72OvH8rlCplBY+UHvpI5oTF6uzELRvMN
         heRA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772446014; x=1773050814; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne+Ffqddt+jp/TSNBA9XZK1oaixSm2EvzlC0rKoP8EA=;
        b=pOWmrQQu9AeKdr+truA3zbs9zdioliKT/kOFsrJ+/UScRKI/YcpeCT6y8U68m9pxQT
         sVUb8txa1B90VV8weIDVxF3tp9rj7EXP41BQw93GqN9cUSGqZ+/ZVkXIM5OV/0364Anu
         tefuPUVTRhRTlaqyOBARokTsiggBLEoBB2TWPFtb1qhSuY3yuKvdfMePzUDhBhcvebtn
         UuLjJuRbkN78+/1ezTDSygx/5GGW/VYq+yCxxmTdN5zX1Y4VVGoIIOt+0ERatUOtiT7Z
         PXzka8aeV+RVLSJDGTCsEeYKKrqHiITYuAbXQ7E327qt5YLEqYGHJ82BtmGLKsn+C9gf
         e72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446014; x=1773050814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ne+Ffqddt+jp/TSNBA9XZK1oaixSm2EvzlC0rKoP8EA=;
        b=I0nNbrcvdcB8VJ1f95X6uAyjrUXl7UbPZPJh0PLZcEm/gi0CIYSe+RemB8wIfAnbNN
         6rxuDWcbANRh9gjchs1G9nQzEv2TALQLrhDiVws6tzQ2lVGMWCaL/deme6ffubwX2k0s
         RK1hzLN6ulXswDKB9TWxGpILurqMeLPArMCdu04keVGulfOM/GPTPHdgQan+5RAb9oaG
         u8hQWIEX2zx2Qb7AjWKUUfqrqFFmReGtVRfQEIckLLdq0YrAqE8E+JDtnxGvb2G7AIli
         EfS+2LVB44ZFxhPjthcZnaVTEHm8e3VJvSv904+1qjtJkC8WvZUMlntksiYOWCbQla2/
         o8WQ==
X-Gm-Message-State: AOJu0YyD6mRJGRwSqmsrOzVBM3k9401JrExlJLPa17FduYngGS8D04np
	8wRwSbNnBla9H5C/fYsh4QtdBBP3y9B5HgsqUIJFE+njJqztn1Hh+5tKUdQRKyZkXgmwwKybvh4
	Qs79qtFWlbX5rl7nwwStCDpqnWHJMoQI4b14ZrJ1cbA==
X-Gm-Gg: ATEYQzwrRvcyAev/Uk7+1iDc1smXuDAS9DaiJI4861EwH9ZH5Yw0u9nDSOWHJGmk539
	k8NUUn0Pu3WEdBoODMGFBRjsmt8A49Iwbgu+0T8gEaSwsFPT7kim3ELSdxVPRNRxpnpDLkUky+x
	sH350vykt8Q8n5IwEbbN6r7qNhQsAjKx2l3kqcBLleVXwJc1RqUnrcictXBPpTbmLMKigPXpZxi
	DiWx20uIzOXrrlHHcm+nt/pAiLnklNTJfswiV8MdosBBLPG+Zh6xoOMepClmTYblpFlNtTNwki2
	tvlnf9O0+5De8hcCCvDDivm0nYW6qUXjL9uNmw==
X-Received: by 2002:a05:6830:44a1:b0:7d1:9574:db9a with SMTP id
 46e09a7af769-7d591eb98aamr7466286a34.12.1772446013904; Mon, 02 Mar 2026
 02:06:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772013062.git.bertrand.marquis@arm.com>
 <832ba950a53a7139b51053f6570fd9b26ba42df1.1772013062.git.bertrand.marquis@arm.com>
 <CAHUa44EjtezLGx=YNtyK-xCU9gmEvBGVLhmG=0YpRWftFxGY-Q@mail.gmail.com> <C0024849-8ACF-4662-B89F-E327732FA669@arm.com>
In-Reply-To: <C0024849-8ACF-4662-B89F-E327732FA669@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 2 Mar 2026 11:06:41 +0100
X-Gm-Features: AaiRm52wVBFJ97Qaqhh96KG9ybloh1x00cBNCQR_oUSruRLIKe7BQMlZOyXHPUA
Message-ID: <CAHUa44H3p5SMFiK3AXrUYWjsxSfa=AQs4PUTJ552AiRNCi3aQQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] xen/arm: ffa: Add cached GET_REGS support
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email];
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
X-Rspamd-Queue-Id: 040451D60C0
X-Rspamd-Action: no action

Hi Bertrand,

On Mon, Mar 2, 2026 at 9:58=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 27 Feb 2026, at 15:56, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Wed, Feb 25, 2026 at 11:02=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> FF-A v1.2 defines PARTITION_INFO_GET_REGS for register-based partition
> >> info retrieval, but Xen currently only supports the buffer-based GET
> >> path for guests.
> >>
> >> Implement GET_REGS using the cached SP list and VM entries, including
> >> the register window layout and input validation. Track VM list changes
> >> via the partinfo tag and use it to validate GET_REGS tag inputs. Ensur=
e
> >> that when a non-Nil UUID is specified, the UUID fields in both GET and
> >> GET_REGS results are MBZ as required by the specification.
> >>
> >> PARTITION_INFO_GET_REGS is available to v1.2 guests, returning cached =
SP
> >> entries and VM entries with UUIDs zeroed for non-Nil UUID queries.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> xen/arch/arm/tee/ffa.c          |  16 +++
> >> xen/arch/arm/tee/ffa_partinfo.c | 211 ++++++++++++++++++++++++++++++++
> >> xen/arch/arm/tee/ffa_private.h  |   4 +-
> >> 3 files changed, 230 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index aa43ae2595d7..d56eb20c2239 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -44,6 +44,11 @@
> >>  *   - doesn't support signalling the secondary scheduler of pending
> >>  *     notification for secure partitions
> >>  *   - doesn't support notifications for Xen itself
> >> + * o FFA_PARTITION_INFO_GET/GET_REGS:
> >> + *   - v1.0 guests may see duplicate SP IDs when firmware provides UU=
IDs
> >> + *   - SP list is cached at init; SPMC tag changes are not tracked
> >> + *     between calls
> >> + *   - SP list is capped at FFA_MAX_NUM_SP entries
> >>  *
> >>  * There are some large locked sections with ffa_spmc_tx_lock and
> >>  * ffa_spmc_rx_lock. Especially the ffa_spmc_tx_lock spinlock used
> >> @@ -188,6 +193,7 @@ static bool ffa_negotiate_version(struct cpu_user_=
regs *regs)
> >>             write_lock(&ffa_ctx_list_rwlock);
> >>             list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
> >>             write_unlock(&ffa_ctx_list_rwlock);
> >> +            ffa_partinfo_inc_tag();
> >>         }
> >>
> >>         goto out_continue;
> >> @@ -341,6 +347,12 @@ static void handle_features(struct cpu_user_regs =
*regs)
> >>     case FFA_FEATURE_SCHEDULE_RECV_INTR:
> >>         ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0)=
;
> >>         break;
> >> +    case FFA_PARTITION_INFO_GET_REGS:
> >> +        if ( ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 )
> >> +            ffa_set_regs_success(regs, 0, 0);
> >> +        else
> >> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> >> +        break;
> >>
> >>     case FFA_NOTIFICATION_BIND:
> >>     case FFA_NOTIFICATION_UNBIND:
> >> @@ -402,6 +414,9 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
> >>     case FFA_PARTITION_INFO_GET:
> >>         ffa_handle_partition_info_get(regs);
> >>         return true;
> >> +    case FFA_PARTITION_INFO_GET_REGS:
> >> +        ffa_handle_partition_info_get_regs(regs);
> >> +        return true;
> >>     case FFA_RX_RELEASE:
> >>         e =3D ffa_rx_release(ctx);
> >>         break;
> >> @@ -629,6 +644,7 @@ static int ffa_domain_teardown(struct domain *d)
> >>         write_lock(&ffa_ctx_list_rwlock);
> >>         list_del(&ctx->ctx_list);
> >>         write_unlock(&ffa_ctx_list_rwlock);
> >> +        ffa_partinfo_inc_tag();
> >>     }
> >>
> >>     ffa_rxtx_domain_destroy(d);
> >> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_pa=
rtinfo.c
> >> index d7f9b9f7153c..1c7b3579f798 100644
> >> --- a/xen/arch/arm/tee/ffa_partinfo.c
> >> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> >> @@ -28,10 +28,39 @@ struct ffa_partition_info_1_1 {
> >>     uint8_t uuid[16];
> >> };
> >>
> >> +/* Registers a3..a17 (15 regs) carry partition descriptors, 3 regs ea=
ch. */
> >> +#define FFA_PARTINFO_REG_MAX_ENTRIES \
> >> +    ((15 * sizeof(uint64_t)) / sizeof(struct ffa_partition_info_1_1))
> >> +
> >> /* SP list cache (secure endpoints only); populated at init. */
> >> static void *sp_list __read_mostly;
> >> static uint32_t sp_list_count __read_mostly;
> >> static uint32_t sp_list_entry_size __read_mostly;
> >> +
> >> +/* SP list is static; tag only moves when VMs are added/removed. */
> >> +static atomic_t ffa_partinfo_tag =3D ATOMIC_INIT(1);
> >> +
> >> +void ffa_partinfo_inc_tag(void)
> >> +{
> >> +    atomic_inc(&ffa_partinfo_tag);
> >
> > Do we need to worry about this value wrapping? Is wrapping permitted?
>
> wrapping is permitted, as the end this value is used to ensure changes in
> the middle of info_get_regs are detected. Having enough changes in the
> middle for this to wrap and end up un-detected by the caller is near to i=
mpossible.
> In any case, the status we return is a snapshot which have changed as soo=
n as
> the result is returned so i would consider this a best effort (even if th=
e probability
> for this to happen is very very near to 0).

I'm sorry for being unclear. atomic_t is implemented as struct { int
counter; }, wrapping the counter element is undefined behaviour. But
it will take quite some time before we get there and perhaps the
assembly implementation of atomic_inc() is expected to mitigate the
undefined behaviour part.

>
> >
> >> +}
> >> +
> >> +static inline uint16_t ffa_partinfo_get_tag(void)
> >> +{
> >> +    /*
> >> +     * Tag moves with VM list changes only.
> >> +     *
> >> +     * Limitation: we cannot detect an SPMC tag change between calls =
because we
> >> +     * do not retain the previous SPMC tag; we only refresh it via th=
e mandatory
> >> +     * start_index=3D0 call and assume it stays stable while combined=
_tag (our
> >> +     * VM/SP-count tag) is used for guest validation. This means SPMC=
 tag
> >> +     * changes alone will not trigger RETRY.
> >> +     */
> >> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >> +        return atomic_read(&ffa_partinfo_tag) & GENMASK(15, 0);
> >> +    else
> >> +        return 1;
> >> +}
> >> static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t f=
lags,
> >>                                       uint32_t *count, uint32_t *fpi_s=
ize)
> >> {
> >> @@ -125,6 +154,7 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid=
 uuid, uint32_t *sp_count,
> >>     for ( n =3D 0; n < sp_list_count; n++ )
> >>     {
> >>         void *entry =3D sp_list + n * sp_list_entry_size;
> >> +        void *dst_pos;
> >>
> >>         if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
> >>             continue;
> >> @@ -136,11 +166,20 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uu=
id uuid, uint32_t *sp_count,
> >>          * This is a non-compliance to the specification but 1.0 VMs s=
hould
> >>          * handle that on their own to simplify Xen implementation.
> >>          */
> >> +        dst_pos =3D *dst_buf;
> >>         ret =3D ffa_copy_info(dst_buf, end_buf, entry, dst_size,
> >>                             sp_list_entry_size);
> >>         if ( ret )
> >>             return ret;
> >>
> >> +        if ( !ffa_uuid_is_nil(uuid) &&
> >> +             dst_size >=3D sizeof(struct ffa_partition_info_1_1) )
> >> +        {
> >> +            struct ffa_partition_info_1_1 *fpi =3D dst_pos;
> >> +
> >> +            memset(fpi->uuid, 0, sizeof(fpi->uuid));
> >> +        }
> >> +
> >>         count++;
> >>     }
> >>
> >> @@ -152,6 +191,38 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uui=
d uuid, uint32_t *sp_count,
> >>     return FFA_RET_OK;
> >> }
> >>
> >> +static uint16_t ffa_get_sp_partinfo_regs(struct ffa_uuid uuid,
> >> +                                         uint16_t start_index,
> >> +                                         uint64_t *out_regs,
> >> +                                         uint16_t max_entries)
> >> +{
> >> +    uint32_t idx =3D 0;
> >> +    uint16_t filled =3D 0;
> >> +    uint32_t n;
> >> +
> >> +    for ( n =3D 0; n < sp_list_count && filled < max_entries; n++ )
> >> +    {
> >> +        void *entry =3D sp_list + n * sp_list_entry_size;
> >> +
> >> +        if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
> >> +            continue;
> >> +
> >> +        if ( idx++ < start_index )
> >> +            continue;
> >> +
> >> +        memcpy(&out_regs[filled * 3], entry,
> >> +               sizeof(struct ffa_partition_info_1_1));
> >> +        if ( !ffa_uuid_is_nil(uuid) )
> >> +        {
> >> +            out_regs[filled * 3 + 1] =3D 0;
> >> +            out_regs[filled * 3 + 2] =3D 0;
> >> +        }
> >> +        filled++;
> >> +    }
> >> +
> >> +    return filled;
> >> +}
> >> +
> >> static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t star=
t_index,
> >>                                    uint32_t *vm_count, void **dst_buf,
> >>                                    void *end_buf, uint32_t dst_size)
> >> @@ -368,6 +439,146 @@ out:
> >>     }
> >> }
> >>
> >> +void ffa_handle_partition_info_get_regs(struct cpu_user_regs *regs)
> >> +{
> >> +    struct domain *d =3D current->domain;
> >> +    struct ffa_ctx *ctx =3D d->arch.tee;
> >> +    struct ffa_uuid uuid;
> >> +    uint32_t sp_count =3D 0, vm_count =3D 0, total_count;
> >> +    uint16_t start_index, tag;
> >> +    uint16_t num_entries =3D 0;
> >> +    uint64_t x3 =3D get_user_reg(regs, 3);
> >> +    int32_t ret =3D FFA_RET_OK;
> >> +    uint64_t out_regs[18] =3D { 0 };
> >> +    unsigned int n;
> >> +    uint16_t tag_out;
> >> +
> >> +    if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
> >> +    {
> >> +        ret =3D FFA_RET_NOT_SUPPORTED;
> >> +        goto out;
> >> +    }
> >> +
> >> +    /*
> >> +     * Registers a3..a17 (15 regs) carry partition descriptors, 3 reg=
s each.
> >> +     * For FF-A 1.2, that yields a maximum of 5 entries per GET_REGS =
call.
> >> +     * Enforce the assumed layout so window sizing stays correct.
> >> +     */
> >> +    BUILD_BUG_ON(FFA_PARTINFO_REG_MAX_ENTRIES !=3D 5);
> >> +
> >> +    for ( n =3D 4; n <=3D 17; n++ )
> >> +    {
> >> +        if ( get_user_reg(regs, n) )
> >> +        {
> >
> > x4-x17 are SBZ, so I think we should only ignore them.
>
> Ack, this was added to satisfy the compliance suite but this
> has been solved since. I will remove.
>
> >
> >> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +            goto out;
> >> +        }
> >> +    }
> >> +
> >> +    if ( x3 >> 32 )
> >
> > Same here: Bits[63:32] are SBZ.
>
> Same here.
>
> >
> >> +    {
> >> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        goto out;
> >> +    }
> >> +
> >> +    start_index =3D x3 & GENMASK(15, 0);
> >> +    tag =3D (x3 >> 16) & GENMASK(15, 0);
> >> +
> >> +    /* Start index must allow room for up to 5 entries without 16-bit=
 overflow. */
> >> +    if ( start_index > (GENMASK(15, 0) - (FFA_PARTINFO_REG_MAX_ENTRIE=
S - 1)) )
> >> +    {
> >> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        goto out;
> >> +    }
> >> +
> >> +    uuid.val[0] =3D get_user_reg(regs, 1);
> >> +    uuid.val[1] =3D get_user_reg(regs, 2);
> >> +
> >> +    if ( sp_list_count &&
> >> +         sp_list_entry_size !=3D sizeof(struct ffa_partition_info_1_1=
) )
> >> +    {
> >> +        ret =3D FFA_RET_NOT_SUPPORTED;
> >
> > This can't happen. But I guess a sp_list_entry_size > sizeof(struct
> > ffa_partition_info_1_1) might be supported to be future proof.
>
> Right now we have FFA_PARTINFO_REG_MAX_ENTRIES enforcing the
> structure to be 1.1 size. If this is not true in the future we will have =
to modify
> this.
>
> This is not really future proof and i will check if i can rework this.
>
> >
> >> +        goto out;
> >> +    }
> >> +
> >> +    tag_out =3D ffa_partinfo_get_tag();
> >> +
> >> +    if ( start_index =3D=3D 0 )
> >> +    {
> >> +        if ( tag )
> >> +        {
> >> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +            goto out;
> >> +        }
> >> +    }
> >> +    else if ( tag !=3D tag_out )
> >> +    {
> >> +        ret =3D FFA_RET_RETRY;
> >> +        goto out;
> >> +    }
> >> +
> >> +    if ( ffa_uuid_is_nil(uuid) )
> >> +    {
> >> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> >> +            vm_count =3D get_ffa_vm_count();
> >> +        else
> >> +            vm_count =3D 1; /* Caller VM only */
> >> +    }
> >> +
> >> +    ret =3D ffa_get_sp_count(uuid, &sp_count);
> >> +    if ( ret )
> >> +        goto out;
> >> +
> >> +    total_count =3D sp_count + vm_count;
> >> +
> >> +    if ( total_count =3D=3D 0 || start_index >=3D total_count )
> >> +    {
> >> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        goto out;
> >> +    }
> >> +
> >> +    if ( start_index < sp_count )
> >> +        num_entries =3D ffa_get_sp_partinfo_regs(uuid, start_index, &=
out_regs[3],
> >> +                                               FFA_PARTINFO_REG_MAX_E=
NTRIES);
> >> +
> >> +    if ( num_entries < FFA_PARTINFO_REG_MAX_ENTRIES )
> >> +    {
> >> +        uint32_t vm_start =3D start_index > sp_count ?
> >> +                            start_index - sp_count : 0;
> >> +        uint32_t filled =3D 0;
> >> +        void *vm_dst =3D &out_regs[3 + num_entries * 3];
> >> +        void *vm_end =3D &out_regs[18];
> >> +
> >> +        ret =3D ffa_get_vm_partinfo(uuid, vm_start, &filled, &vm_dst,=
 vm_end,
> >> +                                  sizeof(struct ffa_partition_info_1_=
1));
> >> +        if ( ret !=3D FFA_RET_OK && ret !=3D FFA_RET_NO_MEMORY )
> >> +            goto out;
> >> +
> >> +        num_entries +=3D filled;
> >> +    }
> >> +
> >> +    if ( num_entries =3D=3D 0 )
> >> +    {
> >> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        goto out;
> >> +    }
> >> +
> >
> > What if the tag read with ffa_partinfo_get_tag() has changed?
>
> As said this is a best effort, we provide a snapshot.
> Now i could check and compare the tag at the end to handle this case.
>
> I will check if i can make this a bit stronger by comparing the tag at th=
e
> beginning and the end or try to handle it differently (get its value whil=
e we
> have the rwlock on the list of VMs maybe).

Checking the tag at the end to let the caller retry might be enough.

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
> >> +    out_regs[0] =3D FFA_SUCCESS_64;
> >> +    out_regs[2] =3D ((uint64_t)sizeof(struct ffa_partition_info_1_1) =
<< 48) |
> >> +                  ((uint64_t)tag_out << 32) |
> >> +                  ((uint64_t)(start_index + num_entries - 1) << 16) |
> >> +                  ((uint64_t)(total_count - 1) & GENMASK(15, 0));
> >> +
> >> +    for ( n =3D 0; n < ARRAY_SIZE(out_regs); n++ )
> >> +        set_user_reg(regs, n, out_regs[n]);
> >> +
> >> +    return;
> >> +
> >> +out:
> >> +    if ( ret )
> >> +        ffa_set_regs_error(regs, ret);
> >> +}
> >> +
> >> static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> >>                                       uint8_t msg)
> >> {
> >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
> >> index 1a632983c860..c291f32b56ff 100644
> >> --- a/xen/arch/arm/tee/ffa_private.h
> >> +++ b/xen/arch/arm/tee/ffa_private.h
> >> @@ -289,7 +289,7 @@
> >> #define FFA_MSG_SEND2                   0x84000086U
> >> #define FFA_CONSOLE_LOG_32              0x8400008AU
> >> #define FFA_CONSOLE_LOG_64              0xC400008AU
> >> -#define FFA_PARTITION_INFO_GET_REGS     0x8400008BU
> >> +#define FFA_PARTITION_INFO_GET_REGS     0xC400008BU
> >> #define FFA_MSG_SEND_DIRECT_REQ2        0xC400008DU
> >> #define FFA_MSG_SEND_DIRECT_RESP2       0xC400008EU
> >>
> >> @@ -452,6 +452,8 @@ bool ffa_partinfo_init(void);
> >> int32_t ffa_partinfo_domain_init(struct domain *d);
> >> bool ffa_partinfo_domain_destroy(struct domain *d);
> >> void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
> >> +void ffa_handle_partition_info_get_regs(struct cpu_user_regs *regs);
> >> +void ffa_partinfo_inc_tag(void);
> >>
> >> int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_id, struct domain=
 **d_out,
> >>                                    struct ffa_ctx **ctx_out);
> >> --
> >> 2.52.0
>
>

