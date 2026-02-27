Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEMVHsV0oWkPtQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 11:41:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58001B6188
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 11:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242562.1542950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvGK-0001cz-Dv; Fri, 27 Feb 2026 10:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242562.1542950; Fri, 27 Feb 2026 10:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvvGK-0001ak-BG; Fri, 27 Feb 2026 10:40:00 +0000
Received: by outflank-mailman (input) for mailman id 1242562;
 Fri, 27 Feb 2026 10:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnSo=A7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vvvGJ-0001ae-0E
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 10:39:59 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8669d52-13c8-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 11:39:57 +0100 (CET)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7d556c1a79eso1963760a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 02:39:57 -0800 (PST)
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
X-Inumbo-ID: a8669d52-13c8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1772188796; cv=none;
        d=google.com; s=arc-20240605;
        b=EYca0EryuNgUJalBAFMJ6rcIIxuW3og9xwU6j3plJ4Zmf29S3dt0zATen8zFnjnGFu
         q8xPgL6ty7vblSvWllEF94HX1ebXQIJ0Cl/vUnM+ngcn4lWq6PSnT233CGHnjdZ5W0ai
         +6yNr6Mb2myFU1NGuTx1Bqn9DgUSLGl+J6K1dnCUOX1jBiyfmC3QYb+UkuZic1IP2ku6
         1/rsn4ZqaJPBJev6U8a24UyfB8qO2GIqk3IPtesYwWVaefw+Fxw/1dd23H9A5kVAFFNy
         QiubacJifmmmb3uiRwjmVPLZqaoVfLGk89+IoriUUoiBQngRxWofXaPgGe5veSnTwGSZ
         chEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h3W9wnAPujhYxuLAQIaNeWK9TmYessUc15me4oDThKk=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=TyprFk7FfCGkfZhOyuLr9e2kOPNxOJ8MMoyqA3Yo5CcWUBp7New3XQ0nHjE04rdEsC
         iwDNE/okY5aT95mho5y1U08F3RRxsYjYRHDfHFX7yw59t9QlH8PldVfxM6o5x6rk6HAo
         LFVKrueNUt1dMcB9jWYw1uLaJGgsj3GxH9LM8cYJEHOmMk+uV6D93JGW345qozMwWnH7
         3oNH+ya3GJWcit0weJK7ESXF3PVDYqkNbpA8C9gDeYAhrYJSvBzSe+8MrX/R78lmAg5m
         C3/iA+8gzyhMgT4bLEw/gHWqBPHO+xdBgN8f+2QngMo/zFgMhJ6a/T9838yEXmi3rHjQ
         5HJg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772188796; x=1772793596; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3W9wnAPujhYxuLAQIaNeWK9TmYessUc15me4oDThKk=;
        b=s5Km/6lBAti21cnYofiAGU8BE7ZVbuQZoTkU5wU3hD9tYW1Qezz2zuvdFUvkNyD1WQ
         clzNKI7Hhnu92QMC1T0IutMp657kAcsEmeyscf0SbuxRpT15Tr2jTGRR9zq86bPfVf+l
         J1oCmTh+MG01eCz77EWQGX1ItR1t1R+EL1rMatz9u0JU/memZdQyfN1rwZ19FFsyGB5N
         mIEQ9W3CVJy9nriWYp6bDfFiYWN0H2xwfPFBfQwasateRfR8bsMebgip/WdKsDKhJdYL
         q37Uy3O1EpqABJGoH0p1k6yiISosan4edJ9RZUNw7DT9NUyguMhOb9gp99vMBtjJcXuV
         Mzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188796; x=1772793596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h3W9wnAPujhYxuLAQIaNeWK9TmYessUc15me4oDThKk=;
        b=LC/W0aY83WyHdpi/5y/GdWTAEp+g3E6JOSUKsdkSdJ7hpw4i/qJ9BHUAvW03Ke0rPv
         0qfUAz8DMt/OrZWfOyNociQNxYQmJszpJgoO74SjgmiL8V6PTKgwgH87Yzeo4tAwvJ9J
         f2CUz6uSowAzuyGjV2M7mmyuFRpeMdJauHWfCE2p7y97yMZ9gYywYfgQ+bmWXv1nxSuB
         vtOt04rZrIh3pI6itIBZ3/BA2Icfs4WJxfRukdxvlgJONJdQt/KMO4be3hPOhthIM3G9
         HkeRmPLrzQG3r1eVcjqk03IadUS0U/je1tKxL8o3xhlXowPhKXzULOt1VTckPEIE6eX3
         E9zw==
X-Gm-Message-State: AOJu0YykDuDlLWDtSyR0tlUQvioQD/PGKwKvsHouLaE5O23OFoUT9Hv3
	sAGV/cp1YQeDNA6VBnWBHojWqSB92aVoo6W3Rb45INy06I8EJDkLrHfnVNaVWlGXgzq9OmEyVeW
	crJYbsbGoFnA6opPzi+25gJmtr3cK8qPq8VY+ZcBUYw==
X-Gm-Gg: ATEYQzxqavso1wf6XkDVoA+/ZcnYuirPxywnkOMg5R5JcwpC7UIOT2o8WVn5tk2KDUX
	IJiUfah5bpHU8+YNxYXOA32IAElXbmFm6n98d+kVREwsq0mU0qaaXNy/XB/u9+AgtL6bHZP1kuo
	79OhddDNhqFtpJjJN2SPc4QSJqzmCIGddwr8HBn9cnrHPau8f8atUuoPXxF0tSTXIU/OVzF/VRp
	3sJMH2ahQxqP0KDvzCk9VSS90EnzXgOyxkEBbuxuZMm1JKXUjv+DZ1wGfSwDORH+pZHlyFcV0Fz
	XlN4NTRJLv3kDEeKGsrp/3t+FjhhXgfuc9JnpA==
X-Received: by 2002:a05:6870:2486:b0:332:1b00:6d5 with SMTP id
 586e51a60fabf-416270b79a8mr1139560fac.39.1772188795628; Fri, 27 Feb 2026
 02:39:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772013062.git.bertrand.marquis@arm.com> <0a5f66eaa16f262d4ffad6a8ec4b1b02461f96c1.1772013062.git.bertrand.marquis@arm.com>
In-Reply-To: <0a5f66eaa16f262d4ffad6a8ec4b1b02461f96c1.1772013062.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 27 Feb 2026 11:39:44 +0100
X-Gm-Features: AaiRm51JF90RxqO2uRLppLmMZ0QLQBVcD5zM6vQKFBbZgdtuNotFTKW02KTdOlA
Message-ID: <CAHUa44FSq6aHTO=HWNOB1Qa5keuEfmhwpSW4hRjVgQdUX0fjmA@mail.gmail.com>
Subject: Re: [PATCH 2/4] xen/arm: ffa: Cache SP partition info at init
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,linaro.org:dkim,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: D58001B6188
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 25, 2026 at 11:02=E2=80=AFAM Bertrand Marquis
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
>  xen/arch/arm/tee/ffa_partinfo.c | 205 +++++++++++++++++++++-----------
>  1 file changed, 138 insertions(+), 67 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 6a6f3ffb822e..8a3eac25f99f 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -6,6 +6,7 @@
>  #include <xen/const.h>
>  #include <xen/sizes.h>
>  #include <xen/types.h>
> +#include <xen/xmalloc.h>
>
>  #include <asm/smccc.h>
>  #include <asm/regs.h>
> @@ -33,6 +34,10 @@ static uint16_t subscr_vm_created_count __read_mostly;
>  static uint16_t *subscr_vm_destroyed __read_mostly;
>  static uint16_t subscr_vm_destroyed_count __read_mostly;
>
> +/* SP list cache (secure endpoints only); populated at init. */
> +static void *sp_list __read_mostly;
> +static uint32_t sp_list_count __read_mostly;
> +static uint32_t sp_list_entry_size __read_mostly;
>  static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t fla=
gs,
>                                        uint32_t *count, uint32_t *fpi_siz=
e)
>  {
> @@ -79,92 +84,78 @@ static int32_t ffa_copy_info(void **dst, void *dst_en=
d, const void *src,
>      return FFA_RET_OK;
>  }
>
> -static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count=
)
> +static bool ffa_sp_entry_matches_uuid(const void *entry, struct ffa_uuid=
 uuid)
>  {
> -    uint32_t src_size;
> +    const struct ffa_partition_info_1_1 *fpi =3D entry;
> +    struct ffa_uuid sp_uuid;
> +
> +    if ( ffa_uuid_is_nil(uuid) )
> +        return true;
>
> -    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLA=
G,
> -                                  sp_count, &src_size);
> +    if ( sp_list_entry_size < sizeof(*fpi) )
> +        return false;

This can never happen since we don't accept SPMC below version 1.1. We
even have a check to ensure the SPMC doesn't return a too-small
spi_size.

> +
> +    memcpy(&sp_uuid, fpi->uuid, sizeof(sp_uuid));
> +    return ffa_uuid_equal(uuid, sp_uuid);
>  }
>
> -static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_co=
unt,
> -                                   void **dst_buf, void *end_buf,
> -                                   uint32_t dst_size)
> +static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count=
)
>  {
> -    int32_t ret;
> -    int32_t release_ret;
> -    uint32_t src_size, real_sp_count;
> -    void *src_buf;
>      uint32_t count =3D 0;
> -    bool notify_fw =3D false;
> -
> -    /* We need to use the RX buffer to receive the list */
> -    src_buf =3D ffa_rxtx_spmc_rx_acquire();
> -    if ( !src_buf )
> -        return FFA_RET_DENIED;
> -
> -    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
> -    if ( ret )
> -        goto out;
> -    notify_fw =3D true;
> +    uint32_t n;
>
> -    /* Validate the src_size we got */
> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
> -         src_size >=3D FFA_PAGE_SIZE )
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
>
> -        src_buf +=3D src_size;
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
> +
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
> @@ -435,6 +426,14 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp_id=
, uint16_t vm_id,
>      return res;
>  }
>
> +static void ffa_sp_list_cache_free(void)
> +{
> +    XFREE(sp_list);
> +    sp_list =3D NULL;

XFREE() is already setting sp_list to NULL.

> +    sp_list_count =3D 0;
> +    sp_list_entry_size =3D 0;
> +}
> +
>  static void uninit_subscribers(void)
>  {
>          subscr_vm_created_count =3D 0;
> @@ -443,6 +442,68 @@ static void uninit_subscribers(void)
>          XFREE(subscr_vm_destroyed);
>  }
>
> +static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
> +                                   uint32_t fpi_size)
> +{
> +    const uint8_t *src =3D buf;
> +    uint32_t secure_count =3D 0;
> +    uint32_t n, idx =3D 0;
> +    bool warned =3D false;
> +
> +    if ( fpi_size < sizeof(struct ffa_partition_info_1_0) ||
> +         fpi_size >=3D FFA_PAGE_SIZE )
> +        return false;

Would it make sense to check that fpi_size is well aligned with struct
ffa_partition_info_1_0? If it's an odd size, we'll make unaligned
accesses below with memcpy(). But perhaps that's a bit much. The SPMC
isn't supposed to provide garbage.

> +
> +    if ( count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / fpi_size )
> +        return false;
> +
> +    for ( n =3D 0; n < count; n++ )
> +    {
> +        const struct ffa_partition_info_1_0 *fpi =3D
> +            (const void *)(src + n * fpi_size);
> +
> +        if ( !FFA_ID_IS_SECURE(fpi->id) )
> +        {
> +            if ( !warned )

Is this needed? Doesn't printk_once() already ensure this? Or did you
happen to leave printk_once() by mistake and meant for this to be
printed once each time ffa_sp_list_cache_init() is called, since
"warned" isn't static.

> +            {
> +                printk_once(XENLOG_ERR
> +                            "ffa: Firmware is not using bit 15 conventio=
n for IDs !!\n");
> +                warned =3D true;
> +            }
> +            printk(XENLOG_ERR
> +                   "ffa: Secure partition with id 0x%04x cannot be used\=
n",
> +                   fpi->id);
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
> +        const struct ffa_partition_info_1_0 *fpi =3D
> +            (const void *)(src + n * fpi_size);
> +
> +        if ( !FFA_ID_IS_SECURE(fpi->id) )
> +            continue;
> +
> +        memcpy(sp_list + idx * fpi_size, fpi, fpi_size);
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
> @@ -549,12 +610,22 @@ bool ffa_partinfo_init(void)
>          goto out;
>      }
>
> -    ret =3D init_subscribers(spmc_rx, count, fpi_size);
> +    if ( !ffa_sp_list_cache_init(spmc_rx, count, fpi_size) )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to cache SP list\n");
> +        goto out;
> +    }
> +
> +    ret =3D init_subscribers(sp_list, sp_list_count, sp_list_entry_size)=
;
>
>  out:
>      e =3D ffa_rxtx_spmc_rx_release(notify_fw);
>      if ( e )
>          printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n=
", e);
> +    if ( !ret )
> +        uninit_subscribers();

ret is initially false and can only be set to true if
init_subscribers() returns true. So there's never any point in calling
uninit_subscribers().

> +    if ( !ret )
> +        ffa_sp_list_cache_free();

ret can be false even if ffa_sp_list_cache_init() hasn't been called
yet. Calling ffa_sp_list_cache_free() anyway is harmless, but not
elegant.

Cheers,
Jens

>      return ret;
>  }
>
> --
> 2.52.0
>

