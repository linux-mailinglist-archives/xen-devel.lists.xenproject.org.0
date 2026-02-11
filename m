Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBiRDj5VjGnblAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:09:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426B1232CC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227167.1533507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq793-00056n-BG; Wed, 11 Feb 2026 10:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227167.1533507; Wed, 11 Feb 2026 10:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq793-000540-7p; Wed, 11 Feb 2026 10:08:29 +0000
Received: by outflank-mailman (input) for mailman id 1227167;
 Wed, 11 Feb 2026 10:08:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgMA=AP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vq791-00053u-SJ
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:08:27 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a9ddf75-0731-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 11:08:26 +0100 (CET)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-409521ba360so1091671fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 02:08:26 -0800 (PST)
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
X-Inumbo-ID: 9a9ddf75-0731-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770804505; cv=none;
        d=google.com; s=arc-20240605;
        b=lH0nrhT+Zobz0NYUeAvQPGDXMnNSfmb8YOpwAsDGgNgAKO/ARsCy+Q6VPr1e5a1vQ2
         LcJH7sFIoYHJ+xpplKstkaU0gmT3uudQRTgVF7W7YU0QMWRFc8d4unhPsQ5FHszUnjeS
         699N4MZsMo5x/44pdidCE0q7NbRs7FItgwFACeZs2yflVTqj4P2UrW8X7ObLc9ftlDc1
         9NeL31RO3Uk/zQ/CwQEdheQK4vUGaNgZ1M87Mtvug6lRjE5wLIc7QgrcwhnXOLKeaBx0
         nKVPqvWcNo7PGjDFRAEq+dE024kYCQfcbJAYFER69sv1QwB/JFHWAc9yKjbd6QyWJbYV
         ZFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqM7RKB6quCku8tMvd8VdIKk5k371oawDTVd6sVsdV4=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=fdb1o4x6cLZcF1e3P+2QnDkKRl6wPEtS4x2rk7eZADjbhHXKmc0HGtHAFZ134NWAwc
         1rDuMOQpEflQh/PGZGGQiWkiWJDNJEydXJ9Zv6/+zlbiEiNd/igpOXweDH2uy9UgUKio
         eguA0F0edpmi+SyMeawJPxKeKxzt1Is5F7NnBysQsVfWS/yRrJCeBQFVUtotXy/cNhiE
         S8M40FRSpx9m2wVtDN6Z8bxe00lDBWffZGqFkYzb0MzeGcRZ7vuH5i4rk9M4soy2EQj+
         bgKqingISyU/cjrWb0Vo2PLil/4OEnmCO70WTvgpCJvOok+woXUi3A2gvSpL077aZnwP
         1BNQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770804505; x=1771409305; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqM7RKB6quCku8tMvd8VdIKk5k371oawDTVd6sVsdV4=;
        b=FM/wttRLS7YHsXgsC4PiGtk1tQyNGayn1V3oa4nBm58C7O0j8+1XI063gTANz/LpsZ
         OLamR+SMqOH7OfjIo0+zUTH1D501HTN7xGSd5lwQXYpb6JxQScdR5hmz2qgksuNRLJM5
         e+0qc6NcDK7hoaIEIPrm9tR+QfBJ0K51xNmAhiy1fMWKjH08QrVM4/+Qmm2asGjzGvW4
         D/SpZMRIczwghpNCUhZTrCLlQWgcQNUT1iauh4ORCNr1chMMMimbewZVrgApn2zJ0UB/
         luwwa9weDnJ8SapZgza0o4cEBxh3lYS3RwVNXnl77EYMvPTwJPsp6ouEtx1Z5gYm/U5K
         JUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804505; x=1771409305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fqM7RKB6quCku8tMvd8VdIKk5k371oawDTVd6sVsdV4=;
        b=G6A3///G6IaDMxpT8geTUsbwlse+LxhE9cat2xSkQ2a5zxN2fnRirTVkW/VdEVTInh
         3EodgcV1mEL9NsNI6/WnP5qaooW4p7mO4IUNprEov508Hemko2paQfJ0mNneH3yP85IL
         lzifwErINGt1tHQ1Lbg7iynAGtkl5pGAwEeo1nwAIIoqjYcQYt9aH4kfQjIaMf/4zxZ6
         ydTiXSUUMQpr2w6Z2Zwkj66NjE6rpL/DtGnPmSeOffZYaoWwJXYciEIkLfO6v9uWZ1jF
         kQtP/p2WmJMwQM2eWiGsNLM+bzzlzQmuSDwO52/yIypMaPjYdopMDJzusV2MHnwPlstI
         WTyw==
X-Gm-Message-State: AOJu0YzGav+io2ZFCEnQUWUFFjmWdb/7144UehKv08Ii+BUTUz3VrxE3
	Bad3UuRsiEg7fKYsxRuZMkqAXAsMX78Te5YRuSUCOmptZLrYhcfBpKmOtVoKLP988UcVhVBJjXU
	m4NMIG5RF4Reh7HzW6HCM+1Cc58TmD+ZehaEdSaZItg==
X-Gm-Gg: AZuq6aK9PXdRVaMpzXhPr528r51/ihjCf4kUBiKO1FMNBF89ix2CBnYknO5sdEwQDB5
	/EOxejJtvfiR2rq6g9xi4exlJ7OOTTABY/2OTSrOAKBZatSafEJD3PxHQ4OUTghFG0jZSRWtCFm
	4+qWcfqQ8tRNQAP0qFwSei21Lbyv29HyKltl219S95qs/ptcV2jLNiiOoxhyaQvhpifiiqV4v8o
	MiOER+EyuwrMrqOuX84UmP7mkNablBzj1ToF9P6EreIFAAW2o3EEzxA8VhH1vvwx7j2x0AiprhR
	CmQTOs17NoJCa6SK5F4AkYxPWQZkF9fYzc2eWQ==
X-Received: by 2002:a05:6870:9e92:b0:409:4c35:a3ca with SMTP id
 586e51a60fabf-40a96c96a6amr9426993fac.15.1770804504660; Wed, 11 Feb 2026
 02:08:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <94e10f14d499d7e584fb0fbdd28d0288bb5831bd.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <94e10f14d499d7e584fb0fbdd28d0288bb5831bd.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Feb 2026 11:08:11 +0100
X-Gm-Features: AZwV_Qitgxl6iN38jOoWc9xfa70pVbIFnz2caY86PLL3MRmbfLCo_xzbuaynqBs
Message-ID: <CAHUa44EN19q4NBteEY12g0w2TZE4apfo=a0Lu30ufjTDYr5DLw@mail.gmail.com>
Subject: Re: [PATCH 11/12] xen/arm: ffa: Add MEM_SHARE page diagnostics
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9426B1232CC
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> MEM_SHARE failures in get_shm_pages() are silent, which makes malformed
> ranges and page mapping failures hard to diagnose.
>
> Add debug logging for page validation failures:
> - descriptor validation failures (unaligned, range short/overflow)
> - per-page mapping failures (unmapped GFN, wrong p2m type)
> - address overflow detection in range walks
>
> Ratelimit temporary reclaim failures and log permanent reclaim failures
> as errors.
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_shm.c | 73 ++++++++++++++++++++++++++++++++------
>  1 file changed, 63 insertions(+), 10 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index 905a64e3db01..89161753e922 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -169,6 +169,12 @@ static int32_t get_shm_pages(struct domain *d, struc=
t ffa_shm_mem *shm,
>      uint64_t addr;
>      uint64_t page_count;
>      uint64_t gaddr;
> +    int32_t ret =3D FFA_RET_OK;
> +    const char *reason =3D NULL;
> +    unsigned int bad_rg =3D 0;
> +    unsigned int bad_pg =3D 0;
> +    unsigned long bad_addr =3D 0;
> +    p2m_type_t bad_t =3D p2m_invalid;
>
>      for ( n =3D 0; n < range_count; n++ )
>      {
> @@ -176,34 +182,78 @@ static int32_t get_shm_pages(struct domain *d, stru=
ct ffa_shm_mem *shm,
>          addr =3D ACCESS_ONCE(range[n].address);
>
>          if ( !IS_ALIGNED(addr, FFA_PAGE_SIZE) )
> -            return FFA_RET_INVALID_PARAMETERS;
> +        {
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            reason =3D "unaligned";
> +            bad_rg =3D n;
> +            bad_addr =3D (unsigned long)addr;
> +            goto out;

The extra help variables clutter the code, and the debug message
requires one to read the code to understand it. I'd prefer separate
prints for each error location. For example:
gdprintk(XENLOG_DEBUG, "ffa: mem share pages invalid: unalinged range
%u address %#lx\n", ...)
return FFA_RET_INVALID_PARAMETERS;

It should result in fewer lines of code and clearer debug messages.

Cheers,
Jens

> +        }
>
>          for ( m =3D 0; m < page_count; m++ )
>          {
>              if ( pg_idx >=3D shm->page_count )
> -                return FFA_RET_INVALID_PARAMETERS;
> +            {
> +                ret =3D FFA_RET_INVALID_PARAMETERS;
> +                reason =3D "range overflow";
> +                bad_rg =3D n;
> +                bad_pg =3D m;
> +                goto out;
> +            }
>
>              if ( !ffa_safe_addr_add(addr, m) )
> -                return FFA_RET_INVALID_PARAMETERS;
> +            {
> +                ret =3D FFA_RET_INVALID_PARAMETERS;
> +                reason =3D "addr overflow";
> +                bad_rg =3D n;
> +                bad_pg =3D m;
> +                bad_addr =3D (unsigned long)addr;
> +                goto out;
> +            }
>
>              gaddr =3D addr + m * FFA_PAGE_SIZE;
>              gfn =3D gaddr_to_gfn(gaddr);
>              shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), &t,
>                                                    P2M_ALLOC);
>              if ( !shm->pages[pg_idx] )
> -                return FFA_RET_DENIED;
> +            {
> +                ret =3D FFA_RET_DENIED;
> +                reason =3D "gfn unmapped";
> +                bad_rg =3D n;
> +                bad_pg =3D m;
> +                bad_addr =3D (unsigned long)gaddr;
> +                goto out;
> +            }
>              /* Only normal RW RAM for now */
>              if ( t !=3D p2m_ram_rw )
> -                return FFA_RET_DENIED;
> +            {
> +                ret =3D FFA_RET_DENIED;
> +                reason =3D "p2m type";
> +                bad_rg =3D n;
> +                bad_pg =3D m;
> +                bad_addr =3D (unsigned long)gaddr;
> +                bad_t =3D t;
> +                goto out;
> +            }
>              pg_idx++;
>          }
>      }
>
>      /* The ranges must add up */
>      if ( pg_idx < shm->page_count )
> -        return FFA_RET_INVALID_PARAMETERS;
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        reason =3D "range short";
> +        bad_pg =3D pg_idx;
> +        goto out;
> +    }
>
> -    return FFA_RET_OK;
> +out:
> +    if ( ret )
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: mem share pages invalid: %s rg %u pg %u addr %#lx=
 p2m %u\n",
> +                 reason ? reason : "unknown", bad_rg, bad_pg, bad_addr, =
bad_t);
> +    return ret;
>  }
>
>  static void put_shm_pages(struct ffa_shm_mem *shm)
> @@ -759,8 +809,10 @@ bool ffa_shm_domain_destroy(struct domain *d)
>               * A temporary error that may get resolved a bit later, it's
>               * worth retrying.
>               */
> -            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#l=
x : %d\n",
> -                   d, shm->handle, res);
> +            if ( printk_ratelimit() )
> +                printk(XENLOG_G_WARNING
> +                       "%pd: ffa: Failed to reclaim handle %#lx : %d\n",
> +                       d, shm->handle, res);
>              break; /* We will retry later */
>          default:
>              /*
> @@ -772,7 +824,8 @@ bool ffa_shm_domain_destroy(struct domain *d)
>               * FFA_RET_NO_MEMORY might be a temporary error as it it cou=
ld
>               * succeed if retried later, but treat it as permanent for n=
ow.
>               */
> -            printk(XENLOG_G_INFO "%pd: ffa: Permanent failure to reclaim=
 handle %#lx : %d\n",
> +            printk(XENLOG_G_ERR
> +                   "%pd: ffa: Permanent failure to reclaim handle %#lx :=
 %d\n",
>                     d, shm->handle, res);
>
>              /*
> --
> 2.50.1 (Apple Git-155)
>

