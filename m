Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDtoAA0HqGnSnQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 11:18:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6973F1FE369
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 11:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245255.1544643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxjJ7-0002bu-52; Wed, 04 Mar 2026 10:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245255.1544643; Wed, 04 Mar 2026 10:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxjJ7-0002Zd-1V; Wed, 04 Mar 2026 10:18:21 +0000
Received: by outflank-mailman (input) for mailman id 1245255;
 Wed, 04 Mar 2026 10:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkSz=BE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vxjJ5-0002ZS-EK
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 10:18:19 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75bcb0f8-17b3-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 11:18:17 +0100 (CET)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-46391f4c1f9so4357560b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 02:18:17 -0800 (PST)
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
X-Inumbo-ID: 75bcb0f8-17b3-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1772619496; cv=none;
        d=google.com; s=arc-20240605;
        b=YpmkWmfUSBSbqjH0tXLDKGjPGH/4GCLal/7rNudIpJv/riqc0eV27VLStkgzMCADIs
         c1PyicM1fBM01E7JBfrWXPpsMazCJmBTN6xVTdxLwd6sG01m5B6wj0NuMPee9TrmXEf8
         B4wIqIupQ5eo7vLmC2hZKdnHaoiWp9JGrCe7WIe7Fl+cfEpTkgwf4VXVV2SeMUmXbm49
         XR7x8PLXeZRQ47oYjfdy/w1YZ6w0f52oGnuhVuYejjURS+2I915I8T1GpQhDmaTiAo2d
         rVa56IXuvSJMqtOgHmCBWAMrDlfnK2JZm3iLiaScyOWBuRntMZXYZmMOHtr6rM2pebkp
         fXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JpRotDvDJ+H6v67uMsFM80otTZemd09qTEWD769DE6g=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=FxkQD7GIdEXOOUTxrR9IbWgWpAPi10PtymObVjpFAVqYzPlS7xMGyRDwiD2oovNgVD
         8icau4kgGDwc76djs8/w9sup9isUoieJzGVwVe5mH8PNxwpKV/8xVQxoxZnRJbcfrqVQ
         bqOuTqd3ihgq8Se0eGXGENiqQAlSdu32Vq/w3HhF7BSPMX8jUpP/rAmM183gREReaaSW
         sR5xU50s6qXyuczPII57bufBmgUQfy1tJQuLT+iOTl/hYiMiiHC0ZLYP1o7+/UFm4niE
         6e789IaStBrL3AtGs+eCAF3MubEL3Fca5F5k+FWiwb60QvqoAJG/sYxcXXA8D/Avt0M+
         pzCw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772619496; x=1773224296; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpRotDvDJ+H6v67uMsFM80otTZemd09qTEWD769DE6g=;
        b=wbVUYNQ4pEbSf/8MFFXMbMEVSoEsF+9HDSrEiFmji8Pog5cO2PpJ/vusYakKnYHWaO
         WmezaO8fXqrt1NH/G45HerdQKA+/DuAeoj1X+gqZt62RXkvpomQ4q/g0/4PMFLbBcVXl
         3LHy7DfCt8pGSvOUKVV4SJAxyrEfHcBRWhPFfKnwgolg5iPHqiTKDLhrDymtxayLB0zJ
         8Q2MEaLnpzLzVob4KfRkS+WDvb0ol8G9/WE2v3baPrdbZ+BjB1I1/V4q+v70FEfyUqno
         moA9QKaC1rbyhXLzXTT8CAxnBq3t8RkS5w+XM7cRJtOOfJPJ0S7zs+xlBFuljhB7cLyE
         CLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772619496; x=1773224296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JpRotDvDJ+H6v67uMsFM80otTZemd09qTEWD769DE6g=;
        b=YKbjydRe8YRthVr59bhYAM5GDPIdlAUwTgRShgN9HF153NVo9nYbR4vPdh8uirgBBE
         DdQqTUMoNL3k1jDd3htoAvs2EGxKC8Y4dRo3l0xSU4l7zPkdnGH46f5tcHXxEreWFfvV
         aB321Cbuo0ZIEIfIuwrOr43CQUgsIKWlQ4RpgQJuRDAKX6SNWJChkOX3Bqz12gk4G4W0
         RxNMucgQX+PvFNZz05DZ/sozGTwLJdl+LZFDCdsohl4ecEWOhUdIYjr3yJzViIhpU92D
         ntC0Lan0x6VKX2r1Vl1C3eHPkmuFVfumEaWvat3klng7LWhel02peN7HBBshp34/z7ua
         /DpA==
X-Gm-Message-State: AOJu0YxmWogP8Mq4zJBQw2qk2YBZ7t6laN96J/JyL2RcKZUacKrl4ldp
	DY1pio9/dP5W3XB9AISmRcw9ysy/mD3wT9Ypn6QlwFdvJnVs6+wcMyIbkOs5+pp72hlIfx2iQw4
	yG5Zy+V3UU+vMdghhc65l4n/1s3reeGh9rgdSZ2tBSA==
X-Gm-Gg: ATEYQzyGJlCmqO2C/llGxIEZz8dSYmV6wKYbJJjOS/wkv4nFHStK/Ghvse18leBekjE
	MopIiAkicIyQhZjxNWBen9kwjnnNCB2zsROpAqIEmuejsccIyBWybGxTorkjAlc0E2s1ALlC8xC
	Bx3TozUSuylkhhN16YttYlYztmWgNiq+FjZ8DN1JfdpmtueXyW+cKVvhvHnnxBHtzQANoufNq5Z
	HGXqL6sM5BWtJ/WGZat8W7D1R1Gl26kNgWuUMTCaE0Dit5zOyyTHCoCS4VBY6x66cgvRE7S3CxR
	EMNLJEcfu56jekyW7potLkQZ0pDnDW4YSo9Ndw==
X-Received: by 2002:a05:6808:1523:b0:45f:174a:1297 with SMTP id
 5614622812f47-4651a930c51mr840103b6e.0.1772619496138; Wed, 04 Mar 2026
 02:18:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772464956.git.bertrand.marquis@arm.com> <055bed7c55f298a0916518fb61929bfc7dac6ef2.1772464956.git.bertrand.marquis@arm.com>
In-Reply-To: <055bed7c55f298a0916518fb61929bfc7dac6ef2.1772464956.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 4 Mar 2026 11:18:04 +0100
X-Gm-Features: AaiRm51qC8uak2_7R9TRz35VgYWwssl2010_OAlaPhSqRjGyzz2y8BEJ2whLgc0
Message-ID: <CAHUa44GD3UyXgZpQiz9LvAgcBnyL5qc2t3FDEaowjY03cvNrqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] xen/arm: ffa: Drop SP subscriber lists
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6973F1FE369
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,arm.com:email,mail.gmail.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
> The init-time SP cache already contains partition properties, but the
> code still builds separate subscriber arrays for VM created/destroyed
> notifications. That duplicates state and allocation.
>
> Use the cached SP list directly to:
> - decide which SPs receive created/destroyed notifications
> - build the per-domain destroy bitmap
> - skip destroy notifications for SPs not notified on create
>
> Also switch cached SP entry field reads in VM create/destroy
> notification paths to unaligned-safe helpers, as cache entries are
> variable-size and should not be dereferenced via struct pointers.
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v1:
> - use unaligned-safe reads for cached SP entry fields
>   (id/partition_properties) in VM create/destroy notification paths
> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 170 +++++++++-----------------------
>  1 file changed, 47 insertions(+), 123 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index b933becaa55a..419e19510f6f 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -29,12 +29,6 @@ struct ffa_partition_info_1_1 {
>      uint8_t uuid[16];
>  };
>
> -/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> -static uint16_t *subscr_vm_created __read_mostly;
> -static uint16_t subscr_vm_created_count __read_mostly;
> -static uint16_t *subscr_vm_destroyed __read_mostly;
> -static uint16_t subscr_vm_destroyed_count __read_mostly;
> -
>  /* SP list cache (secure endpoints only); populated at init. */
>  static void *sp_list __read_mostly;
>  static uint32_t sp_list_count __read_mostly;
> @@ -92,6 +86,14 @@ static uint16_t ffa_sp_entry_read_id(const void *entry=
)
>                             offsetof(struct ffa_partition_info_1_0, id));
>  }
>
> +static uint32_t ffa_sp_entry_read_partition_properties(const void *entry=
)
> +{
> +    return get_unaligned_t(uint32_t,
> +                           (const uint8_t *)entry +
> +                           offsetof(struct ffa_partition_info_1_0,
> +                                    partition_properties));
> +}
> +
>  static bool ffa_sp_entry_matches_uuid(const void *entry, struct ffa_uuid=
 uuid)
>  {
>      struct ffa_uuid sp_uuid;
> @@ -440,14 +442,6 @@ static void ffa_sp_list_cache_free(void)
>      sp_list_entry_size =3D 0;
>  }
>
> -static void uninit_subscribers(void)
> -{
> -        subscr_vm_created_count =3D 0;
> -        subscr_vm_destroyed_count =3D 0;
> -        XFREE(subscr_vm_created);
> -        XFREE(subscr_vm_destroyed);
> -}
> -
>  static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
>                                     uint32_t fpi_size)
>  {
> @@ -505,79 +499,6 @@ static bool ffa_sp_list_cache_init(const void *buf, =
uint32_t count,
>      return true;
>  }
>
> -static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_siz=
e)
> -{
> -    uint16_t n;
> -    uint16_t c_pos;
> -    uint16_t d_pos;
> -    struct ffa_partition_info_1_1 *fpi;
> -
> -    if ( fpi_size < sizeof(struct ffa_partition_info_1_1) )
> -    {
> -        printk(XENLOG_ERR "ffa: partition info size invalid: %u\n", fpi_=
size);
> -        return false;
> -    }
> -
> -    subscr_vm_created_count =3D 0;
> -    subscr_vm_destroyed_count =3D 0;
> -    for ( n =3D 0; n < count; n++ )
> -    {
> -        fpi =3D buf + n * fpi_size;
> -
> -        /*
> -         * We need to have secure partitions using bit 15 set convention=
 for
> -         * secure partition IDs.
> -         * Inform the user with a log and discard giving created or dest=
roy
> -         * event to those IDs.
> -         */
> -        if ( !FFA_ID_IS_SECURE(fpi->id) )
> -        {
> -            printk_once(XENLOG_ERR
> -                        "ffa: Firmware is not using bit 15 convention fo=
r IDs !!\n");
> -            printk(XENLOG_ERR
> -                   "ffa: Secure partition with id 0x%04x cannot be used\=
n",
> -                   fpi->id);
> -        }
> -        else
> -        {
> -            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED=
 )
> -                subscr_vm_created_count++;
> -            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROY=
ED )
> -                subscr_vm_destroyed_count++;
> -        }
> -    }
> -
> -    if ( subscr_vm_created_count )
> -        subscr_vm_created =3D xzalloc_array(uint16_t, subscr_vm_created_=
count);
> -    if ( subscr_vm_destroyed_count )
> -        subscr_vm_destroyed =3D xzalloc_array(uint16_t,
> -                                            subscr_vm_destroyed_count);
> -    if ( (subscr_vm_created_count && !subscr_vm_created) ||
> -         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
> -    {
> -        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n"=
);
> -        uninit_subscribers();
> -        return false;
> -    }
> -
> -    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
> -    {
> -        fpi =3D buf + n * fpi_size;
> -
> -        if ( FFA_ID_IS_SECURE(fpi->id) )
> -        {
> -            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED=
 )
> -                subscr_vm_created[c_pos++] =3D fpi->id;
> -            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROY=
ED )
> -                subscr_vm_destroyed[d_pos++] =3D fpi->id;
> -        }
> -    }
> -
> -    return true;
> -}
> -
> -
> -
>  bool ffa_partinfo_init(void)
>  {
>      bool ret =3D false;
> @@ -617,52 +538,39 @@ bool ffa_partinfo_init(void)
>          goto out_release_rx;
>      }
>
> -    if ( !init_subscribers(sp_list, sp_list_count, sp_list_entry_size) )
> -        goto out_free_sp_cache;
> -
>      ret =3D true;
>      goto out_release_rx;
>
> -out_free_sp_cache:
> -    ffa_sp_list_cache_free();
> -
>  out_release_rx:
>      e =3D ffa_rxtx_spmc_rx_release(notify_fw);
>      if ( e )
>          printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n=
", e);
> -
> +    if ( !ret )
> +        ffa_sp_list_cache_free();
>      return ret;
>  }
>
> -static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> -                              uint16_t end, uint16_t sp_id)
> +static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> +                                   unsigned int first_unnotified)
>  {
>      unsigned int n;
>
> -    for ( n =3D start; n < end; n++ )
> +    for ( n =3D 0; n < sp_list_count; n++ )
>      {
> -        if ( subscr[n] =3D=3D sp_id )
> -            return true;
> -    }
> -
> -    return false;
> -}
> +        const void *entry =3D sp_list + n * sp_list_entry_size;
> +        uint32_t partition_props =3D
> +            ffa_sp_entry_read_partition_properties(entry);
>
> -static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> -                                   unsigned int create_signal_count)
> -{
> -    unsigned int n;
> +        if ( !(partition_props & FFA_PART_PROP_NOTIF_DESTROYED) )
> +            continue;
>
> -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> -    {
>          /*
>           * Skip SPs subscribed to the VM created event that never was
>           * notified of the VM creation due to an error during
>           * ffa_domain_init().
>           */
> -        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
> -                               subscr_vm_created_count,
> -                               subscr_vm_destroyed[n]) )
> +        if ( (partition_props & FFA_PART_PROP_NOTIF_CREATED) &&
> +             n >=3D first_unnotified )
>              continue;
>
>          set_bit(n, ctx->vm_destroy_bitmap);
> @@ -671,32 +579,42 @@ static void vm_destroy_bitmap_init(struct ffa_ctx *=
ctx,
>
>  int32_t ffa_partinfo_domain_init(struct domain *d)
>  {
> -    unsigned int count =3D BITS_TO_LONGS(subscr_vm_destroyed_count);
> +    unsigned int count =3D BITS_TO_LONGS(sp_list_count);
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      unsigned int n;
> +    unsigned int first_unnotified =3D sp_list_count;
>      int32_t res;
>
> -    if ( !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) )
> +    if ( !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) || !sp_list_co=
unt )
>          return 0;
>
>      ctx->vm_destroy_bitmap =3D xzalloc_array(unsigned long, count);
>      if ( !ctx->vm_destroy_bitmap )
>          return -ENOMEM;
>
> -    for ( n =3D 0; n < subscr_vm_created_count; n++ )
> +    for ( n =3D 0; n < sp_list_count; n++ )
>      {
> -        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], ffa_get_vm_=
id(d),
> +        const void *entry =3D sp_list + n * sp_list_entry_size;
> +        uint32_t partition_props =3D
> +            ffa_sp_entry_read_partition_properties(entry);
> +        uint16_t id =3D ffa_sp_entry_read_id(entry);
> +
> +        if ( !(partition_props & FFA_PART_PROP_NOTIF_CREATED) )
> +            continue;
> +
> +        res =3D ffa_direct_req_send_vm(id, ffa_get_vm_id(d),
>                                       FFA_MSG_SEND_VM_CREATED);
>          if ( res )
>          {
>              printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %=
u to  %u: res %d\n",
> -                   ffa_get_vm_id(d), subscr_vm_created[n], res);
> +                   ffa_get_vm_id(d), id, res);
> +            first_unnotified =3D n;
>              break;
>          }
>      }
> -    vm_destroy_bitmap_init(ctx, n);
> +    vm_destroy_bitmap_init(ctx, first_unnotified);
>
> -    if ( n !=3D subscr_vm_created_count )
> +    if ( first_unnotified !=3D sp_list_count )
>          return -EIO;
>
>      return 0;
> @@ -711,18 +629,24 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
>      if ( !ctx->vm_destroy_bitmap )
>          return true;
>
> -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    for ( n =3D 0; n < sp_list_count; n++ )
>      {
> +        const void *entry;
> +        uint16_t id;
> +
>          if ( !test_bit(n, ctx->vm_destroy_bitmap) )
>              continue;
>
> -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_v=
m_id(d),
> +        entry =3D sp_list + n * sp_list_entry_size;
> +        id =3D ffa_sp_entry_read_id(entry);
> +
> +        res =3D ffa_direct_req_send_vm(id, ffa_get_vm_id(d),
>                                       FFA_MSG_SEND_VM_DESTROYED);
>
>          if ( res && printk_ratelimit() )
>              printk(XENLOG_WARNING
>                     "%pd: ffa: Failed to report destruction of vm_id %u t=
o %u: res %d\n",
> -                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
> +                   d, ffa_get_vm_id(d), id, res);
>
>          /*
>           * For these two error codes the hypervisor is expected to resen=
d
> @@ -734,7 +658,7 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
>              clear_bit(n, ctx->vm_destroy_bitmap);
>      }
>
> -    if ( bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count)=
 )
> +    if ( bitmap_empty(ctx->vm_destroy_bitmap, sp_list_count) )
>          XFREE(ctx->vm_destroy_bitmap);
>
>      return !ctx->vm_destroy_bitmap;
> --
> 2.52.0
>

