Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLhdAER6oWkUtgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 12:04:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6F61B6550
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 12:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242649.1543021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvds-0000Ea-Ph; Fri, 27 Feb 2026 11:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242649.1543021; Fri, 27 Feb 2026 11:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvds-0000Cj-Mx; Fri, 27 Feb 2026 11:04:20 +0000
Received: by outflank-mailman (input) for mailman id 1242649;
 Fri, 27 Feb 2026 11:04:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnSo=A7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vvvdr-0000Cc-Kk
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 11:04:19 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f1305e4-13cc-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 12:04:18 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-66307e10d1dso1290252eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 03:04:18 -0800 (PST)
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
X-Inumbo-ID: 0f1305e4-13cc-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1772190256; cv=none;
        d=google.com; s=arc-20240605;
        b=CCg3pQej76pktGgJX5b9luTENXXE4cVwHmn3OvFF5wxEuiOgMTMYS2gEJnoED+gavy
         k23RJ3QHawfynE5RxEPh/V8EUJ22+xzS7Uf3jY9as+qWlD0mi0ZvUCRjFnpjJC2J/xlf
         hWgMq1VcmiO5oomQm/FNS9mGTTJY4PZ8MFH/WUGau4qz1TgS7uTXtUpzZFcvTqOcvkap
         E227KMjD6VcUgAIkL1qfKztqGbhqze4MCuo28anrb3M3D6FRzXaIsM+1KgpECdQrUM0G
         wq7Y9ABY18WceTOxgj1RqMfs+XScO9sMHT70pqM65vYe99JFopaQDTctuFvsox1y7dUx
         G/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6MlY3FtrWxiva9pGXWn6CW4earS45tIfBaAOvGykNY=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=lkjDke2NZAP0CVdUEqJbMn49ffXPx1iUfMtJ8l6xC7TEwh/CJpS9KzT/lXv7LhBIta
         bHqAi5i4SUNELHsAX/7NtsQJ6+ZbpR7/+Go2THcuOSRBvalaIIh5kL2saGiPV3gBbJcj
         tcJOjXXZA+Sx6CfOAeIq3V3xOsvflKp8FCIdf/HDufbYvrshg79oxwvd/l720LaMFGOP
         CNEmpoHUozSHcvpIF1U2W0KMqmjmyh9y6wVhX5DbSbPc82u8YD4Utgdt7M3iTJHBpKAP
         zUSjYn3gLb65dqb8wt58lp8rdkIVg85PyO6SKitRAZN+Vo+D1XT3uqRNr1Y0453oBZWd
         eRpQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772190256; x=1772795056; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6MlY3FtrWxiva9pGXWn6CW4earS45tIfBaAOvGykNY=;
        b=mkeTBbtkd3C4s15V1n0yPJNlgtYe5lfuPZdQFrEMGUIxu+8TAW10iy36BBybhZsjQD
         chABHik3TSi1pYF1dF4OwxL05VPwO0tDq+VLwMC1wPcdrw94rNEKPdiX98L0j48cZUIe
         fFXMMEcBJX/j+jm89yNIh2cJqffJAa+2usA4njOSLqTt1WWBgLDV66Q6EfjLJo2cb33A
         PvsC51JVvVB4+AnWtpq37vr+4nnoQVYiUDVBytJoGJidnsDrn7B4vAnhCRG9s3L98/P1
         mD5o7OQziZPDc7z8lYWuILYOXlOY+alF03Ef0bh/adK/j62PhL+/49T38hVFWbbeJklt
         58tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772190256; x=1772795056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6MlY3FtrWxiva9pGXWn6CW4earS45tIfBaAOvGykNY=;
        b=NCAi/SSHrZfepwkkg/icDwRa27vybUc5UkPymllei+BX8AqCbAmfKSirb9ojGUdvRt
         BSK8t6yZ/KYUlXVMaJsai1cjvnN7sKogvcRHMeGRVfymgmp2FhHIXXCe3nAQTZkGfeI+
         7nVMIUFRnPMEMjbMjvisArRaA8dBDksGLBdnRFr1ixRnC4CYrP0KWVVUZ3VPMYS0Tx+E
         pM4r+uFiFywUZ9Z0qH6lduq6nGvVzK+H+MI2cuslC+clz+PDvPEe0BNIDfGyYIg0bSCD
         k8SQ2fZimX3dAOMu6fhKELFZLKJXe6A4jZ1zIcUZDaDY19mMl8DfN8NPLB4G54AeNUjv
         J0kQ==
X-Gm-Message-State: AOJu0YwiEsr9fxeWAXvDYIZjQYPjuQcRNoowoIjk3p/TjQe5IMf4IXRo
	WMHh7s3VwCzAvm7j0KLx5ftE3rUuh25kZ9s332KsBnF+Z8nM5FdonEgIqFifRKKzwXxVDgGhIdC
	JUF7IsLjrSIVvKmhR9UFaZQ5i2MvUgQ8UC4YQUZRqPg==
X-Gm-Gg: ATEYQzyprCAYmiyhY8RMWWm6hlnj0Lr50q2Tlbraytsrl2M780xHEZTbmLsZqNZtkzr
	uifLqw71PjEl332sa6G30kypU+XI/Mb7OP2AteF6YiyJSBBUHCJ0+/wfxfuq/mjYqFNN78qmRI4
	05Hp1LBkYX6eghhqzbwbNq0XIWK7ZC/Dc9zf1uA8gSS9l5qYYCrn0jEwgY0d71EoKaBuXJnP7v2
	Tt2+SC/lPxjkhAnjMV3B5xOHvfM73+oyrBPRnlVqItpuMlEDYlL1ETN2uFwSARjxUnFvEB+xmX2
	7h1cHy2b18Bz9QAMu9SKYfA6N638t7+krsICzQ==
X-Received: by 2002:a05:6820:808:b0:679:e617:e835 with SMTP id
 006d021491bc7-679faf1189emr1604672eaf.46.1772190256431; Fri, 27 Feb 2026
 03:04:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772013062.git.bertrand.marquis@arm.com> <c981d94eb7596a17a4198fcdabcaaf17027aaad3.1772013062.git.bertrand.marquis@arm.com>
In-Reply-To: <c981d94eb7596a17a4198fcdabcaaf17027aaad3.1772013062.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 27 Feb 2026 12:04:05 +0100
X-Gm-Features: AaiRm51Y4_eS1nheyFso7Oz7fzWFW3GCRsplKYVGsL2zpKMX470K9nqLWluSiBI
Message-ID: <CAHUa44Fy2kp9p7V9QdaOxjw8rTaDdF2unMCiiPv3eEvYyoYZiQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] xen/arm: ffa: Drop SP subscriber lists
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
X-Rspamd-Queue-Id: 5E6F61B6550
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 25, 2026 at 11:02=E2=80=AFAM Bertrand Marquis
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
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 155 ++++++++------------------------
>  1 file changed, 36 insertions(+), 119 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 8a3eac25f99f..d7f9b9f7153c 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -28,12 +28,6 @@ struct ffa_partition_info_1_1 {
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
> @@ -434,14 +428,6 @@ static void ffa_sp_list_cache_free(void)
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
> @@ -504,79 +490,6 @@ static bool ffa_sp_list_cache_init(const void *buf, =
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
> @@ -616,48 +529,43 @@ bool ffa_partinfo_init(void)
>          goto out;
>      }
>
> -    ret =3D init_subscribers(sp_list, sp_list_count, sp_list_entry_size)=
;
> +    if ( sp_list_entry_size < sizeof(struct ffa_partition_info_1_1) )
> +    {
> +        printk(XENLOG_ERR "ffa: partition info size invalid: %u\n",
> +               sp_list_entry_size);
> +        goto out;
> +    }
> +    ret =3D true;
>
>  out:
>      e =3D ffa_rxtx_spmc_rx_release(notify_fw);
>      if ( e )
>          printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n=
", e);
> -    if ( !ret )
> -        uninit_subscribers();
>      if ( !ret )
>          ffa_sp_list_cache_free();
>      return ret;
>  }
>
> -static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> -                              uint16_t end, uint16_t sp_id)
> +static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> +                                   unsigned int first_unnotified)
>  {
>      unsigned int n;
> +    struct ffa_partition_info_1_1 *fpi;
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
> +        fpi =3D sp_list + n * sp_list_entry_size;
>
> -static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> -                                   unsigned int create_signal_count)
> -{
> -    unsigned int n;
> +        if ( !(fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
) )
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
> +        if ( (fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED) &=
&
> +             n >=3D first_unnotified )
>              continue;
>
>          set_bit(n, ctx->vm_destroy_bitmap);
> @@ -666,32 +574,39 @@ static void vm_destroy_bitmap_init(struct ffa_ctx *=
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
> +    struct ffa_partition_info_1_1 *fpi;
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
> +        fpi =3D sp_list + n * sp_list_entry_size;
> +        if ( !(fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED) =
)
> +            continue;
> +
> +        res =3D ffa_direct_req_send_vm(fpi->id, ffa_get_vm_id(d),
>                                       FFA_MSG_SEND_VM_CREATED);
>          if ( res )
>          {
>              printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %=
u to  %u: res %d\n",
> -                   ffa_get_vm_id(d), subscr_vm_created[n], res);
> +                   ffa_get_vm_id(d), fpi->id, res);
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
> @@ -702,22 +617,24 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      unsigned int n;
>      int32_t res;
> +    struct ffa_partition_info_1_1 *fpi;
>
>      if ( !ctx->vm_destroy_bitmap )
>          return true;
>
> -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    for ( n =3D 0; n < sp_list_count; n++ )
>      {
>          if ( !test_bit(n, ctx->vm_destroy_bitmap) )
>              continue;
>
> -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_v=
m_id(d),
> +        fpi =3D sp_list + n * sp_list_entry_size;
> +        res =3D ffa_direct_req_send_vm(fpi->id, ffa_get_vm_id(d),
>                                       FFA_MSG_SEND_VM_DESTROYED);
>
>          if ( res && printk_ratelimit() )
>              printk(XENLOG_WARNING
>                     "%pd: ffa: Failed to report destruction of vm_id %u t=
o %u: res %d\n",
> -                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
> +                   d, ffa_get_vm_id(d), fpi->id, res);
>
>          /*
>           * For these two error codes the hypervisor is expected to resen=
d
> @@ -729,7 +646,7 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
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

