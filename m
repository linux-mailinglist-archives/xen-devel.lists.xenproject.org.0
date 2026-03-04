Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGDZDhwNqGn2nQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 11:44:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770121FE833
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 11:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245268.1544663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxjiG-0007ha-Ac; Wed, 04 Mar 2026 10:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245268.1544663; Wed, 04 Mar 2026 10:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxjiG-0007eQ-7q; Wed, 04 Mar 2026 10:44:20 +0000
Received: by outflank-mailman (input) for mailman id 1245268;
 Wed, 04 Mar 2026 10:44:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkSz=BE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vxjiE-0007dg-Bp
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 10:44:18 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1655a109-17b7-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 11:44:16 +0100 (CET)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-4152698e745so702070fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 02:44:15 -0800 (PST)
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
X-Inumbo-ID: 1655a109-17b7-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1772621054; cv=none;
        d=google.com; s=arc-20240605;
        b=Y1zBp6fGmxJsW1WCuy9jCleg26qqAY2WFx4DenpauXdPPdl4vWRGfEP2iMm0haYLO6
         pbeBjsYiOk39pKbBMofbGlvA80kK/4mIyG/6b7aRe91lwDn+9uewzGQdXHFdPXou1WpC
         Zk7G/1hvEpmKjwSRulP7Qa+tWZlkjyc256+Sf3P8P4+i88ofYYnhJ493gS8Z8gQHFlgW
         FVNvuIGMq4gb+N8iWBA8E7eGaskzkybjd6nPUzdo7RHj6GKtInjJfYVhE3q+HPaV63BL
         4dfOYhhajRHaoBd3+6TJe1yC/hJZn0eutA0VetZyL9G/SJC/OURRbuOdBU27XpZI/ttw
         Ml9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GxCxuIeq0ZlkpJHq3FJYHVbyqA6Ag06ecfzQyA5N5dQ=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=UIYoTqjW3FNt1YPi0kDLkGDYpSnTBQD3SAOPR2LYvypyOYbboRkddku3fBn9mZXU2v
         xCRfHSqbqHqO17nw0Kfqe2Luk19BJem1ViprVYca8ouDTxv8nfIQq5DygE4wEbnbFIeS
         y8r5jVWszgvmye0spS5qQrGpFdPdL2nv53mx1jFpGHiiJyu+reKPNgYxqb1a1IRbgCTT
         JxZMIy0iGmOfdWP+pghgvoAeJl1XKaj/8WjrCl3YN0xO6iAGyc0L5iFxJZ6nLbd6ppyD
         FIvF3vXKD4Z7MD0TsXosk9esakxzv+0vGep42ABa28GSOnZzvfsynuzZfCf3M6wzRlSY
         zWIw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772621054; x=1773225854; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxCxuIeq0ZlkpJHq3FJYHVbyqA6Ag06ecfzQyA5N5dQ=;
        b=SJLINArzjfaBNxiVgVmUl8wXsZLCbblfHgg0j81x6YduThLu7PbAN6P5shw6QH21is
         xKLLZ5mOlBIwRIMPL0CBEKap8xBywxFL4SfPe9LScSH6wzZtHWMeCphuKAbHwgOqkbHd
         V6xRSkcaay03U73zMRdA1n8rs0vfwi5BjWXB0ZIjZFLDxr//HUn/b8GCP8x5jO7PANe3
         YrW34uWPzXKHk3byR7QvZAmEbIDqtQ3ILfhkS+9hqs8kfGx6zTOJNeOhpvQ1So+IYhIB
         YFI5JOD18q5QYj4omEvDBKitKWaNumWMsryqkJy7x1T2pEOmiq/uvwKuMcL1AkVKCUeq
         GwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621054; x=1773225854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GxCxuIeq0ZlkpJHq3FJYHVbyqA6Ag06ecfzQyA5N5dQ=;
        b=fKlCz5eZBUlS3zAMMRRpVrJUVXBG2D8ym+U64XCaUyg8/Sl6q+k96e/D7f9Y6ibX73
         vPU/cXqtitMTdGyJ0KUIlFKVomO+ehdFypI5xWtOLbCzcet7P40VNQaiU+9fX5x0i3+I
         scp4VEMsHQIgXF+XGKIzT95d+uL82+UAWY+TWqNR9SXjOHL06aK8Dl9c0H0MqwsiOec/
         yk3699s+pVoDIqmtSV1yBSVGY3Clk8BbpCedIZLKskmbIALTPIxwrsPDW0MrOKXYqN0H
         jmSxY3h1VX/O4TvB17iv07pz/F2AxCAZFK+gMaItCtOnBG4cvYpt8rrHHVLophCrjsn3
         mqpg==
X-Gm-Message-State: AOJu0Yww5ErXZ0NKoXKXaZLDgwApur7Qi1y+onsz4fyZebJpZzG1QS4c
	Ulw9aLeYy1AQWZ3D5aJX171ZQlB7ha/Hz2E1T9bDnE57YL5rs2Pld5HZzqggc5ynsc3sjtx4uM9
	DBMd/8ykOVA00+zd5sRFwm2Ebb/8pQYxiz/WYFt3FYg==
X-Gm-Gg: ATEYQzwPpmkR3CexVA1vMwCICtyyWQ6JWZpAKu5k40WV9IhbVRKvWGwXN2sC+y0jdXQ
	mYIKCTgd1hE/1VZ2V8KnE71cMzrQC8kF91lSl9mi2PD7Xuu9XU6bVY6URJF6L6fJd/2YsSwvaKU
	nUzPvw+2fjM6Ghem71W0caBZrlhvARRdZvh4v6bN75vVwt02qWBD3+x19wa82EWfXkHTM5vhXE6
	HD6qopkUhexg1JPYzz2n6Pc9NZFvhA+c669wXdgMSC9iSSQxtdqSgZ2qa4MggVdL6Q3r85QmrS3
	hdvgDn38H9rdouSHOLaGCaxib6zstm9cfJE8QQ==
X-Received: by 2002:a05:6870:f2aa:b0:40f:c84:e59b with SMTP id
 586e51a60fabf-416aba6999bmr906334fac.30.1772621053783; Wed, 04 Mar 2026
 02:44:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772464956.git.bertrand.marquis@arm.com> <a7a2ba28c75241c1f1340482ed31d521ef38d218.1772464956.git.bertrand.marquis@arm.com>
In-Reply-To: <a7a2ba28c75241c1f1340482ed31d521ef38d218.1772464956.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 4 Mar 2026 11:44:02 +0100
X-Gm-Features: AaiRm53ynxyazzqty8FDyjUylSW0eVwQ7WkkuOEBqe5vudRypS-nm3kCiGgnB4A
Message-ID: <CAHUa44G3g+tLiViNh32ryVCmtfdWJNozmkOhVpYr_zgb7ks5Ng@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] xen/arm: ffa: Add cached GET_REGS support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 770121FE833
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,linaro.org:email];
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
> FF-A v1.2 defines PARTITION_INFO_GET_REGS for register-based partition
> info retrieval, but Xen currently only supports the buffer-based GET
> path for guests.
>
> Implement GET_REGS using the cached SP list and VM entries, including
> the register window layout and input validation. Track VM list changes
> via the partinfo tag and use it to validate GET_REGS tag inputs. Ensure
> that when a non-Nil UUID is specified, the UUID fields in both GET and
> GET_REGS results are MBZ as required by the specification.
>
> PARTITION_INFO_GET_REGS is available to v1.2 guests, returning cached SP
> entries and VM entries with UUIDs zeroed for non-Nil UUID queries.
>
> Also publish VM membership updates (VM count, ctx list, and partinfo
> tag) under the same write-locked section so GET_REGS sees coherent state
> and concurrent changes are reliably reported via RETRY.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v1:
> - ignore x4-x17 not being zero and x3 bits 63-32 not being zero (defined
>   as SBZ in the spec)
> - detect tag changes during GET_REGS handling and return RETRY
> - remove strict check of sp_list_entry_size, larger cache entry sizes
>   will now be accepted
> - publish VM count, ctx list, and partinfo tag updates under
>   ffa_ctx_list_rwlock for coherent visibility
> ---
>  xen/arch/arm/tee/ffa.c          |  23 +++-
>  xen/arch/arm/tee/ffa_partinfo.c | 200 ++++++++++++++++++++++++++++++++
>  xen/arch/arm/tee/ffa_private.h  |   4 +-
>  3 files changed, 223 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index aa43ae2595d7..d6cae67e1a48 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -44,6 +44,11 @@
>   *   - doesn't support signalling the secondary scheduler of pending
>   *     notification for secure partitions
>   *   - doesn't support notifications for Xen itself
> + * o FFA_PARTITION_INFO_GET/GET_REGS:
> + *   - v1.0 guests may see duplicate SP IDs when firmware provides UUIDs
> + *   - SP list is cached at init; SPMC tag changes are not tracked
> + *     between calls
> + *   - SP list is capped at FFA_MAX_NUM_SP entries
>   *
>   * There are some large locked sections with ffa_spmc_tx_lock and
>   * ffa_spmc_rx_lock. Especially the ffa_spmc_tx_lock spinlock used
> @@ -183,10 +188,11 @@ static bool ffa_negotiate_version(struct cpu_user_r=
egs *regs)
>
>          if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>          {
> -            /* One more VM with FF-A support available */
> -            inc_ffa_vm_count();
>              write_lock(&ffa_ctx_list_rwlock);
> +            /* Publish VM membership changes atomically with tag updates=
. */
> +            inc_ffa_vm_count();
>              list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
> +            ffa_partinfo_inc_tag();
>              write_unlock(&ffa_ctx_list_rwlock);
>          }
>
> @@ -341,6 +347,12 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>      case FFA_FEATURE_SCHEDULE_RECV_INTR:
>          ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
>          break;
> +    case FFA_PARTITION_INFO_GET_REGS:
> +        if ( ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
>
>      case FFA_NOTIFICATION_BIND:
>      case FFA_NOTIFICATION_UNBIND:
> @@ -402,6 +414,9 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>      case FFA_PARTITION_INFO_GET:
>          ffa_handle_partition_info_get(regs);
>          return true;
> +    case FFA_PARTITION_INFO_GET_REGS:
> +        ffa_handle_partition_info_get_regs(regs);
> +        return true;
>      case FFA_RX_RELEASE:
>          e =3D ffa_rx_release(ctx);
>          break;
> @@ -625,9 +640,11 @@ static int ffa_domain_teardown(struct domain *d)
>
>      if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ACCESS_ONCE(ctx->guest_vers)=
 )
>      {
> -        dec_ffa_vm_count();
>          write_lock(&ffa_ctx_list_rwlock);
> +        /* Publish VM membership changes atomically with tag updates. */
> +        dec_ffa_vm_count();
>          list_del(&ctx->ctx_list);
> +        ffa_partinfo_inc_tag();
>          write_unlock(&ffa_ctx_list_rwlock);
>      }
>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 419e19510f6f..16da5ee567db 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -29,10 +29,39 @@ struct ffa_partition_info_1_1 {
>      uint8_t uuid[16];
>  };
>
> +/* Registers a3..a17 (15 regs) carry partition descriptors, 3 regs each.=
 */
> +#define FFA_PARTINFO_REG_MAX_ENTRIES \
> +    ((15 * sizeof(uint64_t)) / sizeof(struct ffa_partition_info_1_1))
> +
>  /* SP list cache (secure endpoints only); populated at init. */
>  static void *sp_list __read_mostly;
>  static uint32_t sp_list_count __read_mostly;
>  static uint32_t sp_list_entry_size __read_mostly;
> +
> +/* SP list is static; tag only moves when VMs are added/removed. */
> +static atomic_t ffa_partinfo_tag =3D ATOMIC_INIT(1);
> +
> +void ffa_partinfo_inc_tag(void)
> +{
> +    atomic_inc(&ffa_partinfo_tag);
> +}
> +
> +static inline uint16_t ffa_partinfo_get_tag(void)
> +{
> +    /*
> +     * Tag moves with VM list changes only.
> +     *
> +     * Limitation: we cannot detect an SPMC tag change between calls bec=
ause we
> +     * do not retain the previous SPMC tag; we only refresh it via the m=
andatory
> +     * start_index=3D0 call and assume it stays stable while combined_ta=
g (our
> +     * VM/SP-count tag) is used for guest validation. This means SPMC ta=
g
> +     * changes alone will not trigger RETRY.
> +     */
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        return atomic_read(&ffa_partinfo_tag) & GENMASK(15, 0);
> +    else
> +        return 1;
> +}

Please add an empty line here.

>  static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t fla=
gs,
>                                        uint32_t *count, uint32_t *fpi_siz=
e)
>  {
> @@ -140,6 +169,7 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uu=
id, uint32_t *sp_count,
>      for ( n =3D 0; n < sp_list_count; n++ )
>      {
>          void *entry =3D sp_list + n * sp_list_entry_size;
> +        void *dst_pos;
>
>          if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
>              continue;
> @@ -151,11 +181,20 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid =
uuid, uint32_t *sp_count,
>           * This is a non-compliance to the specification but 1.0 VMs sho=
uld
>           * handle that on their own to simplify Xen implementation.
>           */
> +        dst_pos =3D *dst_buf;
>          ret =3D ffa_copy_info(dst_buf, end_buf, entry, dst_size,
>                              sp_list_entry_size);
>          if ( ret )
>              return ret;
>
> +        if ( !ffa_uuid_is_nil(uuid) &&
> +             dst_size >=3D sizeof(struct ffa_partition_info_1_1) )
> +        {
> +            struct ffa_partition_info_1_1 *fpi =3D dst_pos;
> +
> +            memset(fpi->uuid, 0, sizeof(fpi->uuid));
> +        }
> +
>          count++;
>      }
>
> @@ -167,6 +206,38 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid u=
uid, uint32_t *sp_count,
>      return FFA_RET_OK;
>  }
>
> +static uint16_t ffa_get_sp_partinfo_regs(struct ffa_uuid uuid,
> +                                         uint16_t start_index,
> +                                         uint64_t *out_regs,
> +                                         uint16_t max_entries)
> +{
> +    uint32_t idx =3D 0;
> +    uint16_t filled =3D 0;
> +    uint32_t n;
> +
> +    for ( n =3D 0; n < sp_list_count && filled < max_entries; n++ )
> +    {
> +        void *entry =3D sp_list + n * sp_list_entry_size;
> +
> +        if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
> +            continue;
> +
> +        if ( idx++ < start_index )
> +            continue;
> +
> +        memcpy(&out_regs[filled * 3], entry,
> +               sizeof(struct ffa_partition_info_1_1));
> +        if ( !ffa_uuid_is_nil(uuid) )
> +        {
> +            out_regs[filled * 3 + 1] =3D 0;
> +            out_regs[filled * 3 + 2] =3D 0;
> +        }
> +        filled++;
> +    }
> +
> +    return filled;
> +}
> +
>  static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t start_=
index,
>                                     uint32_t *vm_count, void **dst_buf,
>                                     void *end_buf, uint32_t dst_size)
> @@ -383,6 +454,135 @@ out:
>      }
>  }
>
> +void ffa_handle_partition_info_get_regs(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct ffa_uuid uuid;
> +    uint32_t sp_count =3D 0, vm_count =3D 0, total_count;
> +    uint16_t start_index, tag;
> +    uint16_t num_entries =3D 0;
> +    uint64_t x3 =3D get_user_reg(regs, 3);
> +    int32_t ret =3D FFA_RET_OK;
> +    uint64_t out_regs[18] =3D { 0 };
> +    unsigned int n;
> +    uint16_t tag_out, tag_end;
> +
> +    if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    /*
> +     * Registers a3..a17 (15 regs) carry partition descriptors, 3 regs e=
ach.
> +     * For FF-A 1.2, that yields a maximum of 5 entries per GET_REGS cal=
l.
> +     * Enforce the assumed layout so window sizing stays correct.
> +     */
> +    BUILD_BUG_ON(FFA_PARTINFO_REG_MAX_ENTRIES !=3D 5);
> +
> +    start_index =3D x3 & GENMASK(15, 0);
> +    tag =3D (x3 >> 16) & GENMASK(15, 0);
> +
> +    /* Start index must allow room for up to 5 entries without 16-bit ov=
erflow. */

Nit: The line above is over 80 columns.

With or without the line above fixed. Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

> +    if ( start_index > (GENMASK(15, 0) - (FFA_PARTINFO_REG_MAX_ENTRIES -=
 1)) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    uuid.val[0] =3D get_user_reg(regs, 1);
> +    uuid.val[1] =3D get_user_reg(regs, 2);
> +
> +    tag_out =3D ffa_partinfo_get_tag();
> +
> +    if ( start_index =3D=3D 0 )
> +    {
> +        if ( tag )
> +        {
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out;
> +        }
> +    }
> +    else if ( tag !=3D tag_out )
> +    {
> +        ret =3D FFA_RET_RETRY;
> +        goto out;
> +    }
> +
> +    if ( ffa_uuid_is_nil(uuid) )
> +    {
> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +            vm_count =3D get_ffa_vm_count();
> +        else
> +            vm_count =3D 1; /* Caller VM only */
> +    }
> +
> +    ret =3D ffa_get_sp_count(uuid, &sp_count);
> +    if ( ret )
> +        goto out;
> +
> +    total_count =3D sp_count + vm_count;
> +
> +    if ( total_count =3D=3D 0 || start_index >=3D total_count )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    if ( start_index < sp_count )
> +        num_entries =3D ffa_get_sp_partinfo_regs(uuid, start_index, &out=
_regs[3],
> +                                               FFA_PARTINFO_REG_MAX_ENTR=
IES);
> +
> +    if ( num_entries < FFA_PARTINFO_REG_MAX_ENTRIES )
> +    {
> +        uint32_t vm_start =3D start_index > sp_count ?
> +                            start_index - sp_count : 0;
> +        uint32_t filled =3D 0;
> +        void *vm_dst =3D &out_regs[3 + num_entries * 3];
> +        void *vm_end =3D &out_regs[18];
> +
> +        ret =3D ffa_get_vm_partinfo(uuid, vm_start, &filled, &vm_dst, vm=
_end,
> +                                  sizeof(struct ffa_partition_info_1_1))=
;
> +        if ( ret !=3D FFA_RET_OK && ret !=3D FFA_RET_NO_MEMORY )
> +            goto out;
> +
> +        num_entries +=3D filled;
> +    }
> +
> +    if ( num_entries =3D=3D 0 )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    /*
> +     * Detect list changes while building the response so the caller can=
 retry
> +     * with a coherent snapshot tag.
> +     */
> +    tag_end =3D ffa_partinfo_get_tag();
> +    if ( tag_end !=3D tag_out )
> +    {
> +        ret =3D FFA_RET_RETRY;
> +        goto out;
> +    }
> +
> +    out_regs[0] =3D FFA_SUCCESS_64;
> +    out_regs[2] =3D ((uint64_t)sizeof(struct ffa_partition_info_1_1) << =
48) |
> +                  ((uint64_t)tag_end << 32) |
> +                  ((uint64_t)(start_index + num_entries - 1) << 16) |
> +                  ((uint64_t)(total_count - 1) & GENMASK(15, 0));
> +
> +    for ( n =3D 0; n < ARRAY_SIZE(out_regs); n++ )
> +        set_user_reg(regs, n, out_regs[n]);
> +
> +    return;
> +
> +out:
> +    if ( ret )
> +        ffa_set_regs_error(regs, ret);
> +}
> +
>  static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>                                        uint8_t msg)
>  {
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 1a632983c860..c291f32b56ff 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -289,7 +289,7 @@
>  #define FFA_MSG_SEND2                   0x84000086U
>  #define FFA_CONSOLE_LOG_32              0x8400008AU
>  #define FFA_CONSOLE_LOG_64              0xC400008AU
> -#define FFA_PARTITION_INFO_GET_REGS     0x8400008BU
> +#define FFA_PARTITION_INFO_GET_REGS     0xC400008BU
>  #define FFA_MSG_SEND_DIRECT_REQ2        0xC400008DU
>  #define FFA_MSG_SEND_DIRECT_RESP2       0xC400008EU
>
> @@ -452,6 +452,8 @@ bool ffa_partinfo_init(void);
>  int32_t ffa_partinfo_domain_init(struct domain *d);
>  bool ffa_partinfo_domain_destroy(struct domain *d);
>  void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
> +void ffa_handle_partition_info_get_regs(struct cpu_user_regs *regs);
> +void ffa_partinfo_inc_tag(void);
>
>  int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_id, struct domain *=
*d_out,
>                                     struct ffa_ctx **ctx_out);
> --
> 2.52.0
>

