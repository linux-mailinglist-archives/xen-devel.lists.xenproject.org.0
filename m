Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCcaCTMCqGkRnQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:58:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779231FDFB7
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245241.1544633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxiyr-0007D3-CP; Wed, 04 Mar 2026 09:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245241.1544633; Wed, 04 Mar 2026 09:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxiyr-0007BL-9F; Wed, 04 Mar 2026 09:57:25 +0000
Received: by outflank-mailman (input) for mailman id 1245241;
 Wed, 04 Mar 2026 09:57:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkSz=BE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vxiyq-0007BC-7l
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 09:57:24 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89773025-17b0-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 10:57:22 +0100 (CET)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7d4c307db9aso4228262a34.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 01:57:22 -0800 (PST)
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
X-Inumbo-ID: 89773025-17b0-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1772618241; cv=none;
        d=google.com; s=arc-20240605;
        b=l1PuMxzQteA966OJCLvlfkBgRV7o6qV1ZozuZRmQnUbBKg+jDaZxeJEKM5f1I5NX3O
         SmoW3hLEpMfS5uo+GlVVy6hm7ztJ/iehmhHdbT6CSYgjpzwAkVGEGev6/1w01WgTQNEQ
         mM0oWl3xIiUygpL1eK2YegaDt+Ny/aGE8WnPp5+8uDLdUM34idAhZgejypcctj5jI46G
         8WdCh6gPkSyuxAni+osuw8d0YWJlAUz69QGmgRhyJ71TfYi0C86/RL7MpXYHgXOoQB4i
         Ur1uyHosYhSR3jMF9xaqleEoNyUSlc1LaI00lwiNJdZv5aneEMxx/XlYTCDiTBS8jPUF
         AsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJrv+HwIDbQuRAZOh72iXVEhQflBFsynWIP/XUoI34s=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=do9ni7nGjwR5h1EoJTZmLjV5VSNSN11cAA4C62E5MPMdB1cgS5I+6ImoD7/UVWdrKe
         /Jzf3x8E28VcwIJBvNTmZsQFGqJYnYMKmbkpYgE3q5k6vrh72NR0rtniC6IJkLfrMuSJ
         /kPtD8nk9D8aSfgyQJOcXb1HH/ca4S5WC6idXEfT6svFYcLO2GTkFImo897vbFE8YESJ
         iWxlkw9of0QiKF1xrIAYzvcfwTmZAGppMLKj3SM6Av6cD6J3gn0ltrFdpJ1gS3HVMxgF
         0X1Z4HsDu9EEa2FZO3a2XYjiWg14kICFowpO0xho/ETrAKpzDXA6/ROTJWzHJ4a+yOrC
         R8dQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772618241; x=1773223041; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJrv+HwIDbQuRAZOh72iXVEhQflBFsynWIP/XUoI34s=;
        b=t+Gh2fklY7L0rvrtpXWmXFwAdthgrf7J3iRVzvibznI3mUlXnqFCy53vVcwb96300R
         qEU8ZeJOGctfhJSWcrCrqLVNbQJsP317Pn97fXkcHhk6KLHK+MXjKs/dB4rq2OmSbjU7
         PYzxELUu70bqOpD4PH2BmpIuZzDuXB4TdyPALYfr9q+GKz8MphaHhTzgk5OWYDCGzzLV
         Svfc/gJYuWN8DfgoMEV3Fu9nXnP/0uOXV6WVCTef3aBVPpYR2v1Afav3ndJl3YC5+eqj
         BgcetwY6BrWgM2hZ2o1cv8kjJKR6pHI7+2Y6ClsfxNFvnpzASK1D6Ag6E6YOslUUfAy3
         fFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618241; x=1773223041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJrv+HwIDbQuRAZOh72iXVEhQflBFsynWIP/XUoI34s=;
        b=niPNjRdCUnYagSKscFlGJSvazKd7REXjUtlgsiK9dpqeghaIRtEjk4emiI8/LEukIb
         6+tNe5sci4Is3W4pL6Ka93ln6csJh23AVf1BDUJoVhXSFAvzmhWTnC0crpDZZiYHFxKj
         Tfz0C23IcJJQ+M6Iu87eS1ObTBzc525T++qp3XhV9f3FJej2fBwziTfOe7z1Zpi8OZ9y
         4Q2z5KodJu5+/yK/gdTqsLqYzIQqRUINT126CZ3cx99IAkPtvwre/LYkBW/M5wTP9sWf
         sMneW7lpaXaOjUEZR69Lhfxoh6Ob3ZKvLNnLJdL7JE/8XDxu+4jFt2p5RrIvMyZZ7FAb
         MNxw==
X-Gm-Message-State: AOJu0YybnKqOqoT4RHxBT+khese2HnoVb5WsXIFgKU4vBjSXZZsbpQ8p
	ifEB3wMxR5lu31lWzal9klP5n2OjO4moj9uX2IgjuHemVPijT6NuOGqWeEKwXGqYwlr2ZNW/YK9
	qG6e8dHeFxsC97/O9/IZzmOSUwZkcu8tye+vA7PiGjA==
X-Gm-Gg: ATEYQzyxKRfCay8bG243yuhMWLfHDdGp2x89bJA+CZq3aGuam+LiQMelf6gOWVPHAeH
	NzSBn5GtvAKLMwAcxc98eKj5tz2nzDcXiwgL1JyRgJQ8CYB/o+kM5MiYfmiaMAI8+uf9DoKgijM
	AoIXN9geaW4a9l+6wlX8Ms7sutRr76emzH5rqomGkUmdwOZRcKZMiKYlCGjNMOX38ht3QFpLzkw
	1uw1b+UefUGPucGwV+p228Q/No5HwwmghNfdz9Vt1hsl9ey77M8hihKA1fcWmp64yRKp6LMDcrW
	gvOgplZXCxujepXe9/X3z3CuyRc2Vtte+iKcyw==
X-Received: by 2002:a05:6830:6004:b0:7cf:d9ba:c9a6 with SMTP id
 46e09a7af769-7d6bf9196c9mr735966a34.0.1772618240772; Wed, 04 Mar 2026
 01:57:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772464956.git.bertrand.marquis@arm.com> <e05fcde563e09dc63fbe4e3299049f6d6ebf903e.1772464956.git.bertrand.marquis@arm.com>
In-Reply-To: <e05fcde563e09dc63fbe4e3299049f6d6ebf903e.1772464956.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 4 Mar 2026 10:57:09 +0100
X-Gm-Features: AaiRm53rXnOqjPZrccAyxOHhScQz_4AYLdc_7WKEWrK1obIrIo_QP1oyH_ODXJU
Message-ID: <CAHUa44HFaHLFucOgH2zkryDPM9zgR75xzX-VhAeCd5b_iZW=8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] xen/arm: ffa: Cache SP partition info at init
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 779231FDFB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Bertrand,

On Mon, Mar 2, 2026 at 4:44=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> FFA_PARTITION_INFO_GET currently queries the SPMC on each call and walks =
the
> RX buffer every time. The SP list is expected to be static, so repeated
> firmware calls and validation are unnecessary.
>
> Cache the SPMC partition-info list at init time, keeping only secure
> endpoints, and reuse the cached entries for SP count and partition-info
> responses. Initialize the VM create/destroy subscriber lists from the cac=
hed
> list and free the cache on init failure.
>
> SP partition info now reflects the init-time snapshot and will not change=
.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v1:
> - removed unneeded NULL assignment after XFREE
> - remove warned usage and only rely on printk_once to warn on the 15-bit
>   convention
> - rework ffa_partinfo_init cleanup
> - ensure we do not do unaligned accesses when building the SP cache
> - enforce SPMC partinfo size to be at least 1.1 structure size when
>   creating and remove tests when using the cache
> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 216 +++++++++++++++++++++-----------
>  1 file changed, 146 insertions(+), 70 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 6a6f3ffb822e..b933becaa55a 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -6,6 +6,8 @@
>  #include <xen/const.h>
>  #include <xen/sizes.h>
>  #include <xen/types.h>
> +#include <xen/unaligned.h>
> +#include <xen/xmalloc.h>
>
>  #include <asm/smccc.h>
>  #include <asm/regs.h>
> @@ -33,6 +35,10 @@ static uint16_t subscr_vm_created_count __read_mostly;
>  static uint16_t *subscr_vm_destroyed __read_mostly;
>  static uint16_t subscr_vm_destroyed_count __read_mostly;
>
> +/* SP list cache (secure endpoints only); populated at init. */
> +static void *sp_list __read_mostly;
> +static uint32_t sp_list_count __read_mostly;
> +static uint32_t sp_list_entry_size __read_mostly;

Nit: prefer an empty line here, but it's fixed in a later patch.

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>  static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t fla=
gs,
>                                        uint32_t *count, uint32_t *fpi_siz=
e)
>  {
> @@ -79,92 +85,84 @@ static int32_t ffa_copy_info(void **dst, void *dst_en=
d, const void *src,
>      return FFA_RET_OK;
>  }
>
> -static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count=
)
> +static uint16_t ffa_sp_entry_read_id(const void *entry)
>  {
> -    uint32_t src_size;
> -
> -    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLA=
G,
> -                                  sp_count, &src_size);
> +    return get_unaligned_t(uint16_t,
> +                           (const uint8_t *)entry +
> +                           offsetof(struct ffa_partition_info_1_0, id));
>  }
>
> -static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_co=
unt,
> -                                   void **dst_buf, void *end_buf,
> -                                   uint32_t dst_size)
> +static bool ffa_sp_entry_matches_uuid(const void *entry, struct ffa_uuid=
 uuid)
>  {
> -    int32_t ret;
> -    int32_t release_ret;
> -    uint32_t src_size, real_sp_count;
> -    void *src_buf;
> -    uint32_t count =3D 0;
> -    bool notify_fw =3D false;
> +    struct ffa_uuid sp_uuid;
>
> -    /* We need to use the RX buffer to receive the list */
> -    src_buf =3D ffa_rxtx_spmc_rx_acquire();
> -    if ( !src_buf )
> -        return FFA_RET_DENIED;
> +    if ( ffa_uuid_is_nil(uuid) )
> +        return true;
>
> -    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
> -    if ( ret )
> -        goto out;
> -    notify_fw =3D true;
> +    memcpy(&sp_uuid,
> +           (const uint8_t *)entry +
> +           offsetof(struct ffa_partition_info_1_1, uuid),
> +           sizeof(sp_uuid));
> +    return ffa_uuid_equal(uuid, sp_uuid);
> +}
>
> -    /* Validate the src_size we got */
> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
> -         src_size >=3D FFA_PAGE_SIZE )
> +static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count=
)
> +{
> +    uint32_t count =3D 0;
> +    uint32_t n;
> +
> +    for ( n =3D 0; n < sp_list_count; n++ )
>      {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out;
> +        void *entry =3D sp_list + n * sp_list_entry_size;
> +
> +        if ( ffa_sp_entry_matches_uuid(entry, uuid) )
> +            count++;
>      }
>
> -    /*
> -     * Limit the maximum time we hold the CPU by limiting the number of =
SPs.
> -     * We just ignore the extra ones as this is tested during init in
> -     * ffa_partinfo_init so the only possible reason is SP have been add=
ed
> -     * since boot.
> -     */
> -    if ( real_sp_count > FFA_MAX_NUM_SP )
> -        real_sp_count =3D FFA_MAX_NUM_SP;
> +    *sp_count =3D count;
>
> -    /* Make sure the data fits in our buffer */
> -    if ( real_sp_count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / src_siz=
e )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out;
> -    }
> +    if ( !ffa_uuid_is_nil(uuid) && !count )
> +        return FFA_RET_INVALID_PARAMETERS;
>
> -    for ( uint32_t sp_num =3D 0; sp_num < real_sp_count; sp_num++ )
> -    {
> -        struct ffa_partition_info_1_1 *fpi =3D src_buf;
> +    return FFA_RET_OK;
> +}
>
> -        /* filter out SP not following bit 15 convention if any */
> -        if ( FFA_ID_IS_SECURE(fpi->id) )
> -        {
> -            /*
> -             * If VM is 1.0 but firmware is 1.1 we could have several en=
tries
> -             * with the same ID but different UUIDs. In this case the VM=
 will
> -             * get a list with several time the same ID.
> -             * This is a non-compliance to the specification but 1.0 VMs=
 should
> -             * handle that on their own to simplify Xen implementation.
> -             */
> +static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_co=
unt,
> +                                   void **dst_buf, void *end_buf,
> +                                   uint32_t dst_size)
> +{
> +    int32_t ret;
> +    uint32_t count =3D 0;
> +    uint32_t n;
>
> -            ret =3D ffa_copy_info(dst_buf, end_buf, src_buf, dst_size, s=
rc_size);
> -            if ( ret )
> -                goto out;
> +    for ( n =3D 0; n < sp_list_count; n++ )
> +    {
> +        void *entry =3D sp_list + n * sp_list_entry_size;
>
> -            count++;
> -        }
> +        if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
> +            continue;
> +
> +        /*
> +         * If VM is 1.0 but firmware is 1.1 we could have several entrie=
s
> +         * with the same ID but different UUIDs. In this case the VM wil=
l
> +         * get a list with several time the same ID.
> +         * This is a non-compliance to the specification but 1.0 VMs sho=
uld
> +         * handle that on their own to simplify Xen implementation.
> +         */
> +        ret =3D ffa_copy_info(dst_buf, end_buf, entry, dst_size,
> +                            sp_list_entry_size);
> +        if ( ret )
> +            return ret;
>
> -        src_buf +=3D src_size;
> +        count++;
>      }
>
>      *sp_count =3D count;
>
> -out:
> -    release_ret =3D ffa_rxtx_spmc_rx_release(notify_fw);
> -    if ( release_ret )
> -        gprintk(XENLOG_WARNING,
> -                "ffa: Error releasing SPMC RX buffer: %d\n", release_ret=
);
> -    return ret;
> +    if ( !ffa_uuid_is_nil(uuid) && !count )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    return FFA_RET_OK;
>  }
>
>  static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t start_=
index,
> @@ -435,6 +433,13 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp_id=
, uint16_t vm_id,
>      return res;
>  }
>
> +static void ffa_sp_list_cache_free(void)
> +{
> +    XFREE(sp_list);
> +    sp_list_count =3D 0;
> +    sp_list_entry_size =3D 0;
> +}
> +
>  static void uninit_subscribers(void)
>  {
>          subscr_vm_created_count =3D 0;
> @@ -443,6 +448,63 @@ static void uninit_subscribers(void)
>          XFREE(subscr_vm_destroyed);
>  }
>
> +static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
> +                                   uint32_t fpi_size)
> +{
> +    const uint8_t *src =3D buf;
> +    uint32_t secure_count =3D 0;
> +    uint32_t n, idx =3D 0;
> +
> +    if ( fpi_size < sizeof(struct ffa_partition_info_1_1) ||
> +         fpi_size >=3D FFA_PAGE_SIZE )
> +        return false;
> +
> +    if ( count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / fpi_size )
> +        return false;
> +
> +    for ( n =3D 0; n < count; n++ )
> +    {
> +        const uint8_t *entry =3D src + n * fpi_size;
> +        uint16_t id =3D ffa_sp_entry_read_id(entry);
> +
> +        if ( !FFA_ID_IS_SECURE(id) )
> +        {
> +            printk_once(XENLOG_ERR
> +                        "ffa: Firmware is not using bit 15 convention fo=
r IDs !!\n");
> +            printk(XENLOG_ERR
> +                   "ffa: Secure partition with id 0x%04x cannot be used\=
n",
> +                   id);
> +            continue;
> +        }
> +
> +        secure_count++;
> +    }
> +
> +    if ( secure_count )
> +    {
> +        sp_list =3D xzalloc_bytes(secure_count * fpi_size);
> +        if ( !sp_list )
> +            return false;
> +    }
> +
> +    sp_list_count =3D secure_count;
> +    sp_list_entry_size =3D fpi_size;
> +
> +    for ( n =3D 0; n < count; n++ )
> +    {
> +        const uint8_t *entry =3D src + n * fpi_size;
> +        uint16_t id =3D ffa_sp_entry_read_id(entry);
> +
> +        if ( !FFA_ID_IS_SECURE(id) )
> +            continue;
> +
> +        memcpy(sp_list + idx * fpi_size, entry, fpi_size);
> +        idx++;
> +    }
> +
> +    return true;
> +}
> +
>  static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_siz=
e)
>  {
>      uint16_t n;
> @@ -538,7 +600,7 @@ bool ffa_partinfo_init(void)
>      if ( e )
>      {
>          printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> -        goto out;
> +        goto out_release_rx;
>      }
>      notify_fw =3D true;
>
> @@ -546,15 +608,29 @@ bool ffa_partinfo_init(void)
>      {
>          printk(XENLOG_ERR "ffa: More SPs than the maximum supported: %u =
- %u\n",
>                 count, FFA_MAX_NUM_SP);
> -        goto out;
> +        goto out_release_rx;
> +    }
> +
> +    if ( !ffa_sp_list_cache_init(spmc_rx, count, fpi_size) )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to cache SP list\n");
> +        goto out_release_rx;
>      }
>
> -    ret =3D init_subscribers(spmc_rx, count, fpi_size);
> +    if ( !init_subscribers(sp_list, sp_list_count, sp_list_entry_size) )
> +        goto out_free_sp_cache;
>
> -out:
> +    ret =3D true;
> +    goto out_release_rx;
> +
> +out_free_sp_cache:
> +    ffa_sp_list_cache_free();
> +
> +out_release_rx:
>      e =3D ffa_rxtx_spmc_rx_release(notify_fw);
>      if ( e )
>          printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n=
", e);
> +
>      return ret;
>  }
>
> --
> 2.52.0
>

