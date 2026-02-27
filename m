Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNgJDQOxoWmMvgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 15:58:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3F1B955E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 15:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242888.1543050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvzHB-00056L-2W; Fri, 27 Feb 2026 14:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242888.1543050; Fri, 27 Feb 2026 14:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvzHA-00054V-W4; Fri, 27 Feb 2026 14:57:08 +0000
Received: by outflank-mailman (input) for mailman id 1242888;
 Fri, 27 Feb 2026 14:57:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnSo=A7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vvzHA-00054I-Bp
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 14:57:08 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94862660-13ec-11f1-9ccf-f158ae23cfc8;
 Fri, 27 Feb 2026 15:57:06 +0100 (CET)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-463208653d6so1660561b6e.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 06:57:06 -0800 (PST)
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
X-Inumbo-ID: 94862660-13ec-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1772204224; cv=none;
        d=google.com; s=arc-20240605;
        b=gY9uXtwpFrZuibwAJxjJ6JCRc0YBru2NJaiKUSqaJ65lADduN0F9QyvXaCkhZ6RrEO
         HWSo80YtZwp42awbnPbRUO97c64YLbgzrF0XwabOR1Zk2yTLCcm0yTcaMqFxA6mx7mB1
         yZpotkPGSXo+1PzDKn/1tvw+BPOnnpgMNCukUG33VW1QzNTI3ytypqex7pboMFHw6L3X
         uVjb74PL9zJqLCEzOaHyx0GLFzai0MvACaSF3+1zQkluLwBp35jvfiELQOF+91wxgKDF
         UpUw5UOTAthA6QnXPyeB9cwzCNFzK/yy5j889cIcu66QPPEUaXT3keb7gmZmPLAg8MmB
         PZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uP0I2e4uOXDfd3JeMJBtJ3gHmt9cGgxAGzKiImTtKe0=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=S+67903PocbFI4IfKkBwJaNcdQKxhJcWCpx8p1FSexT8LJaiSc3jI8DPwGO49PPJxM
         60/W1nvZuxvu82pj2Ew1VwAQgRxHaXrG/dfBmrqcwmlv2odu0frbzkYf81yu6B4U1ewq
         2q5+e9sn8vNQ5B3SAMmmGS7SUgbqHjzWvTD5IV0G0yj1aNQ0d00OSgK62s7LGGglOFSV
         3ECHT6ULdofUDm8p5ynjxrA4rHCFV80qGXY6BnLqzN5eVqSemZg5RPKYDjCg+m3AinsH
         LH34swlEt/EmcEZj/engBxuYXURDE8qUIicL0G2iU2gyfYud2sJK6AC+xwB7Fv3GOguA
         FNDw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772204224; x=1772809024; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uP0I2e4uOXDfd3JeMJBtJ3gHmt9cGgxAGzKiImTtKe0=;
        b=XPT1tFMwWqNYhwOqnflTIAI8+yK/tYvt4yOnusiCR/I3llZOyL/bqRGTtsWxDy6mUy
         AhvwG9L3nktoevNhTQ3RIPVeZXZKMPlysp27YsRGco7LReLQXoPJLGzjLTsEfFVpy5FU
         PiqbtfeyK5M3PuymHZrXFU1GG3j/Co7RzUfqynB0EXiQa9jyYDzZOwYkp+rWZ3n3qyp1
         IixNMB9zx6/amWyIFJtsLwA12pJkFJFLHlmC6O+OOLnTGjC8Flth7gPrR9tvnz/sGMkr
         iwS7YIxMEMLFcEQ34C3xzBcSWgh2tYpsJD9pSLXVZeYYFU/KhZYs+f3mulGX3zwzB1e7
         DKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204224; x=1772809024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uP0I2e4uOXDfd3JeMJBtJ3gHmt9cGgxAGzKiImTtKe0=;
        b=aMlH41BU2FX32xWjY/1VSjXQY3lsIMsyn3lXJbvieJteUejNG3vf2aCRqX4jG6sLMR
         lSwvRKPS0gYlbwVDTahlTgsWm+kLauVzCrGz8XjaBj/imGXnZEHarI8Xxzr3IOlTOCRG
         oKLd5Smr2MLtRZ2hIIRlRnJhASO3O6hhulZeBYNSiZ7X3X7OSTBwISBVR1mx0H1gmi3A
         MvFapvr4M905sApjt8O9p1l6dCMz4cT6p4Et1MjpqmzoZS7VqtPyV0NSHPNK0Bc1Belg
         rroIy780VvZSBxH4gwBkXuxyYyjkdR/gvUzhJWBRCf6v6psm9dLhswAFBDnC7HloWnn/
         7f/w==
X-Gm-Message-State: AOJu0YwtvOVOAvWm/s2kS+W/qZRPB5lsDUlGPQyXiyeb4ybSKmxrHNpw
	z3hMkgerbkJPk1BP29ttpDZqkhBgJi/teyQdlHky3ynOYI0iOdpZzZhe5dpVX3xsHk8jcl701Jq
	evGNd9fwCVGRYuwsb9xr2q5od0lKfeA7RS8bG8pa+gg==
X-Gm-Gg: ATEYQzzi/MUqSGmvcejn+utbRy7vIxNGNVuQfaPzHCw0BeabmOzWJewpbmjkXzl/+vU
	a7xnKw5VyFS6902WRTCfByRDHeHzp+GwYfr07x42vSZXSLQkVTnIOujOKHRZ79nG62jnJoCL8X/
	W4doAsfabfNqUq+/BI4q9chs+FqvZJwoApJ47s2Pik5PrJot1fWo9CR8GYGlP9lyTMZkLWv6Roh
	kP68b04q26kQpbqI99mMFZr2aWX2APKtHjaiQyk8O7EwL8StP0Wt3mJ1b97qs1PTUoAmmrY7ozf
	oCNvMzFFchiBYDZdJWGCfTpiSlAihO6OdDctWw==
X-Received: by 2002:a05:6820:3102:b0:679:9787:7c83 with SMTP id
 006d021491bc7-679fadc2728mr2095400eaf.13.1772204224140; Fri, 27 Feb 2026
 06:57:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772013062.git.bertrand.marquis@arm.com> <832ba950a53a7139b51053f6570fd9b26ba42df1.1772013062.git.bertrand.marquis@arm.com>
In-Reply-To: <832ba950a53a7139b51053f6570fd9b26ba42df1.1772013062.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 27 Feb 2026 15:56:52 +0100
X-Gm-Features: AaiRm52qXEoJkbSGbyYrWc6fx9m2wzqoHPewwueJaXSJbodqLMDRNjJ0RE4Fs7Y
Message-ID: <CAHUa44EjtezLGx=YNtyK-xCU9gmEvBGVLhmG=0YpRWftFxGY-Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] xen/arm: ffa: Add cached GET_REGS support
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,linaro.org:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 88E3F1B955E
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 25, 2026 at 11:02=E2=80=AFAM Bertrand Marquis
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
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c          |  16 +++
>  xen/arch/arm/tee/ffa_partinfo.c | 211 ++++++++++++++++++++++++++++++++
>  xen/arch/arm/tee/ffa_private.h  |   4 +-
>  3 files changed, 230 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index aa43ae2595d7..d56eb20c2239 100644
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
> @@ -188,6 +193,7 @@ static bool ffa_negotiate_version(struct cpu_user_reg=
s *regs)
>              write_lock(&ffa_ctx_list_rwlock);
>              list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
>              write_unlock(&ffa_ctx_list_rwlock);
> +            ffa_partinfo_inc_tag();
>          }
>
>          goto out_continue;
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
> @@ -629,6 +644,7 @@ static int ffa_domain_teardown(struct domain *d)
>          write_lock(&ffa_ctx_list_rwlock);
>          list_del(&ctx->ctx_list);
>          write_unlock(&ffa_ctx_list_rwlock);
> +        ffa_partinfo_inc_tag();
>      }
>
>      ffa_rxtx_domain_destroy(d);
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index d7f9b9f7153c..1c7b3579f798 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -28,10 +28,39 @@ struct ffa_partition_info_1_1 {
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

Do we need to worry about this value wrapping? Is wrapping permitted?

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
>  static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t fla=
gs,
>                                        uint32_t *count, uint32_t *fpi_siz=
e)
>  {
> @@ -125,6 +154,7 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uu=
id, uint32_t *sp_count,
>      for ( n =3D 0; n < sp_list_count; n++ )
>      {
>          void *entry =3D sp_list + n * sp_list_entry_size;
> +        void *dst_pos;
>
>          if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
>              continue;
> @@ -136,11 +166,20 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid =
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
> @@ -152,6 +191,38 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid u=
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
> @@ -368,6 +439,146 @@ out:
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
> +    uint16_t tag_out;
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
> +    for ( n =3D 4; n <=3D 17; n++ )
> +    {
> +        if ( get_user_reg(regs, n) )
> +        {

x4-x17 are SBZ, so I think we should only ignore them.

> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out;
> +        }
> +    }
> +
> +    if ( x3 >> 32 )

Same here: Bits[63:32] are SBZ.

> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    start_index =3D x3 & GENMASK(15, 0);
> +    tag =3D (x3 >> 16) & GENMASK(15, 0);
> +
> +    /* Start index must allow room for up to 5 entries without 16-bit ov=
erflow. */
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
> +    if ( sp_list_count &&
> +         sp_list_entry_size !=3D sizeof(struct ffa_partition_info_1_1) )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;

This can't happen. But I guess a sp_list_entry_size > sizeof(struct
ffa_partition_info_1_1) might be supported to be future proof.

> +        goto out;
> +    }
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

What if the tag read with ffa_partinfo_get_tag() has changed?

Cheers,
Jens

> +    out_regs[0] =3D FFA_SUCCESS_64;
> +    out_regs[2] =3D ((uint64_t)sizeof(struct ffa_partition_info_1_1) << =
48) |
> +                  ((uint64_t)tag_out << 32) |
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

