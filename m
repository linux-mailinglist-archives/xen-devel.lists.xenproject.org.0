Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1F781135
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 19:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586480.917736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX2uG-0003CN-La; Fri, 18 Aug 2023 17:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586480.917736; Fri, 18 Aug 2023 17:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX2uG-00039D-I1; Fri, 18 Aug 2023 17:05:04 +0000
Received: by outflank-mailman (input) for mailman id 586480;
 Fri, 18 Aug 2023 17:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0mA=ED=citrix.com=prvs=58781cf72=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qX2uE-000395-Eh
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 17:05:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bb6913a-3de9-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 19:04:58 +0200 (CEST)
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
X-Inumbo-ID: 5bb6913a-3de9-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692378298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6JuWnuXFQBzL4AwWv5H41W08zPgDgJ1o2Il70G3bJ3s=;
  b=DM6GYvFHvECrjsOLH1ovuykaZmMv8jhZRJSWiuMSOJ2thf17OAWrDHhz
   X4Vk5moWHDysL+wbJlbJXQbZ/NgHjOhXtIa5RxMeS87c+8DCHr3EdwKQA
   0qcoUESaSBl9iydGTp/VB3W1UYQ3uoZl6hkYeqYuHM2tUzdBcO8G/3+7U
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119196135
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rl5CtK6IyGLfIF+cRktbsAxRtPPHchMFZxGqfqrLsTDasY5as4F+v
 mdLWG+POPaCM2akL4t+O4++804H6JDUnNc2TlE4/380Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAS7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mq
 KUZIjspbTq5mcm9zOzrdcYwicgJM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx/J/
 zOYpj+kav0cHPC6lx280FK0vcnwpx37RLM8DqOVz9c/1TV/wURMUUZLBDNXu8KRiFO6Wt9ZA
 1wZ/Gwpt6da3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDFbYdginMYzTC4t0
 BmCmNaBLSNrmK2YTzSa7Lj8hTG9Iy8ONkcZeDQJCwAC5rHLqZk+lBvVQv5/EaS+iZv+HjSY/
 tyRhHFg3fNJ15dNjvjluwmd2FpAu6QlUCZovwTdVUamxDlnT4WpOdyXxgTU4dxfedPxoka6g
 FAInM2X7eYrBJ6LlTCQTOhlIIxF98ppIxWH3wcxQsBJGyCFvif6INsOuG0WyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2vpnEGia24hTqFfK0QfUYXY
 M/zTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDEE+1UbwPfN7tnsstoRTk5F
 f4FZ6NmLD0FDIXDjtT/q9ZPfTjm01BqbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9z4/1E
 oWGchYAkjLX3CSXQThmn1g/MNsDq74j9yNkVcHtVH70s0UejXGHtfxAKsNoLed3roSOD5dcF
 pE4RilJOdwXIhyvxtjXRcCVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:mD7TNasR5hsWN3EUI0wWXK/J7skDVNV00zEX/kB9WHVpm62j5q
 WTdZEgv3LJYVkqNE3I9eruBED4ewK6yXcX2/hyAV7BZmnbUQKTRelfBO3ZrQEIcBeOldK1u5
 0AT0FIMqyVMbErt63HCdGDYqwdKQO8gdiVbDrlvhFQpN1RGtpdBtlCe3um+iIffng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3A5BcPDmh/SSUKtoO3My8ikJ9HUjJuLyTcxnz0IGW?=
 =?us-ascii?q?CF01iROPFdnDM969OjJ87?=
X-Talos-MUID: 9a23:KeUDpgYbSAw3nuBTmxqyowhAFN9TxZuUNkARoLscpeS9HHkl
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="119196135"
Date: Fri, 18 Aug 2023 18:04:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach
 for HVM domain
Message-ID: <48113eee-e047-47ad-b7a7-29feb8464ce9@perard>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-3-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230809103305.30561-3-julien@xen.org>

On Wed, Aug 09, 2023 at 11:33:05AM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, libxl will grant IOMEM, I/O port and IRQ permissions when
> a PCI is attached (see pci_add_dm_done()) for all domain types. However,
> the permissions are only revoked for non-HVM domain (see do_pci_remove()).
> 
> This means that HVM domains will be left with extra permissions. While
> this look bad on the paper, the IRQ permissions should be revoked
> when the Device Model call xc_physdev_unmap_pirq() and such domain
> cannot directly mapped I/O port and IOMEM regions. Instead, this has to
> be done by a Device Model.
> 
> The Device Model can only run in dom0 or PV stubdomain (upstream libxl
> doesn't have support for HVM/PVH stubdomain).
> 
> For PV/PVH stubdomain, the permission are properly revoked, so there is
> no security concern.
> 
> This leaves dom0. There are two cases:
>   1) Privileged: Anyone gaining access to the Device Model would already
>      have large control on the host.
>   2) Deprivileged: PCI passthrough require PHYSDEV operations which
>      are not accessible when the Device Model is restricted.
> 
> So overall, it is believed that the extra permissions cannot be exploited.
> 
> Rework the code so the permissions are all removed for HVM domains.
> This needs to happen after the QEMU has detached the device. So
> the revocation is now moved in a separate function which is called
> from pci_remove_detached().
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> TODO: I am getting a bit confused with the async work in libxl. I am
> not entirely sure whether pci_remove_detached() is the correct place
> to revoke.

Whenever an async task in libxl takes more than one function to
complete, the next function (or callback) that is going to be executed
is further down in the current source file (usually). This is to try to
avoid too much confusion when reading through a set of async calls. So
pci_remove_detached() is after all the DM stuff are done, and it's
before we deal with stubdom case which will go through these step again,
so it seems appropriate.

So, this new pci_revoke_permissions() function been place before
do_pci_remove() will make it harder to follow what do_pci_remove() does.
Does it need to be a separate function? Can't you inline it in
pci_remove_detached() ?

If it does needs to be a separate function, a better way to lay it down
would be to replace calls to pci_remove_detached() by
pci_revoke_permissions() as appropriate, and rename it with the prefixed
"pci_remove_", that is pci_remove_revoke_permissions().

> TODO: For HVM, we are now getting the following error on detach:
> libxl: error: libxl_pci.c:2009:pci_revoke_permissions: Domain 3:xc_physdev_unmap_pirq irq=23: Invalid argument
> 
> This is because the IRQ was unmapped by QEMU. It doesn't feel
> right to skip the call. So maybe we can ignore the error?

The error is already ignore. But I guess you just want to skip writing
an error message. But I think we should still write something, at least
a DEBUG message. Also add a comment that QEMU also unmap it, so errors
are expected.

> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 7f5f170e6eb0..f5a4b88eb2c0 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1980,75 +2052,19 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
>              prs->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
>              prs->xswait.callback = pci_remove_qemu_trad_watch_state_cb;
>              rc = libxl__xswait_start(gc, &prs->xswait);
> -            if (rc) goto out_fail;
> -            return;
> +            if (!rc) return;

This is confusing, we usually check for error condition in libxl, not
success condition. So the currently written code is better.

> +            break;
>          case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
>              pci_remove_qmp_device_del(egc, prs); /* must be last */
>              return;
>          default:
>              rc = ERROR_INVAL;
> -            goto out_fail;
> +            break;

You can keep the goto here, this is the usual way to deal with error.
(except a label named "out" would be more appropriate, but out_fail is
fine).

>          }
>      } else {
> +        rc = 0;

You don't need to set rc in the else block and just set it after the if.
The true block of the "if(hvm)" can skip to out_fail on error to avoid
the rc=0. That's an expected pattern in libxl.


>      }
> -skip_irq:
> -    rc = 0;
> +
>  out_fail:
>      pci_remove_detached(egc, prs, rc); /* must be last */
>  }
> @@ -2242,6 +2258,8 @@ static void pci_remove_detached(libxl__egc *egc,
>      if (rc && !prs->force)
>          goto out;
>  
> +    pci_revoke_permissions(egc, prs);
> +
>      isstubdom = libxl_is_stubdom(CTX, domid, &domainid);
>  
>      /* don't do multiple resets while some functions are still passed through */

Thanks,

-- 
Anthony PERARD

