Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C472E27E7C6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 13:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608.2021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNaVR-0007tD-OB; Wed, 30 Sep 2020 11:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608.2021; Wed, 30 Sep 2020 11:42:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNaVR-0007so-L4; Wed, 30 Sep 2020 11:42:45 +0000
Received: by outflank-mailman (input) for mailman id 608;
 Wed, 30 Sep 2020 11:42:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Npl0=DH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kNaVQ-0007sj-O1
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:42:44 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a6a49a1-618f-4f95-b9a5-ee53b51b95a9;
 Wed, 30 Sep 2020 11:42:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Npl0=DH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kNaVQ-0007sj-O1
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 11:42:44 +0000
X-Inumbo-ID: 0a6a49a1-618f-4f95-b9a5-ee53b51b95a9
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0a6a49a1-618f-4f95-b9a5-ee53b51b95a9;
	Wed, 30 Sep 2020 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601466162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdXgkOu3ylqnn1zoExFL9VmyUXl2+ZCZhLSNKounvE0=;
  b=HPDHZ9PyPVQS+nOvE4FpI4pIyqJz8jxo2ZyOoBasxNEWFolkPAXqLitx
   7QV+ZRVNsfjTelrKqH8n/pTUh7io+gsnWlQWzAMWJ2L86ck1wtYTk2Zl0
   MemLhbLXv87OPNySpLRB4+qsexd8pY9KXEoYoeM6GVjBqDfa6oGGUBvOj
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KZcH2yqEPGmYgpzCTQcnwziklCfV47GiZR8knMGcUdCcnTps/6KmpdcJ622fhTxdV82dJAis3J
 2h8YJqGkF6XeXtdjDeoAvXkVaMoD3BZua/wq0b4bOLKp0EqmXGR1E/Re5SmzzdbDVRO00olDxp
 n2puov22Mo+pb15T1y6U8wsCF0LJOB2Lr4rCT75MECzfp8em1LGtzr7cjm045GJ2e0V1LL+4or
 Oe82Ph0iCoysiNr0mwQwAzK2MvXEHjgVLnsjdS9mCw+L47c/mG3ctCZ8Pw0mSG3vKNXlnL3Njq
 u5k=
X-SBRS: None
X-MesageID: 28964510
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28964510"
Date: Wed, 30 Sep 2020 12:42:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>, Paul Durrant
	<pdurrant@amazon.com>, Jerome Leseinne <jerome.leseinne@gmail.com>, "Edwin
 Torok" <edvin.torok@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen-bus: reduce scope of backend watch
Message-ID: <20200930114235.GL2024@perard.uk.xensource.com>
References: <20200923155731.29528-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200923155731.29528-1-paul@xen.org>

On Wed, Sep 23, 2020 at 04:57:31PM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently a single watch on /local/domain/X/backend is registered by each
> QEMU process running in service domain X (where X is usually 0). The purpose
> of this watch is to ensure that QEMU is notified when the Xen toolstack
> creates a new device backend area.
> Such a backend area is specific to a single frontend area created for a
> specific guest domain and, since each QEMU process is also created to service
> a specfic guest domain, it is unnecessary and inefficient to notify all QEMU
> processes.
> Only the QEMU process associated with the same guest domain need
> receive the notification. This patch re-factors the watch registration code
> such that notifications are targetted appropriately.
> 
> Reported-by: Jerome Leseinne <jerome.leseinne@gmail.com>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> 
> diff --git a/hw/xen/xen-backend.c b/hw/xen/xen-backend.c
> index 10199fb58d..f2711fe4a7 100644
> --- a/hw/xen/xen-backend.c
> +++ b/hw/xen/xen-backend.c
> @@ -41,6 +41,11 @@ static void xen_backend_table_add(XenBackendImpl *impl)
>      g_hash_table_insert(xen_backend_table_get(), (void *)impl->type, impl);
>  }
>  
> +static void **xen_backend_table_keys(unsigned int *count)
> +{
> +    return g_hash_table_get_keys_as_array(xen_backend_table_get(), count);

That could be cast to (const gchar **) as the GLib doc suggest, or (const
char **) since gchar and char are the same.
https://developer.gnome.org/glib/stable/glib-Hash-Tables.html#g-hash-table-get-keys-as-array

> +}
> +
>  static const XenBackendImpl *xen_backend_table_lookup(const char *type)
>  {
>      return g_hash_table_lookup(xen_backend_table_get(), type);
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index 9ce1c9540b..c83da93bf3 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -430,7 +430,13 @@ static void xen_bus_unrealize(BusState *bus)
>      trace_xen_bus_unrealize();
>  
>      if (xenbus->backend_watch) {
> -        xen_bus_remove_watch(xenbus, xenbus->backend_watch, NULL);
> +        unsigned int i;
> +
> +        for (i = 0; i < xenbus->backend_types; i++) {
> +            xen_bus_remove_watch(xenbus, xenbus->backend_watch[i], NULL);

We should check if backend_watch[i] is NULL.

> +        }
> +
> +        g_free(xenbus->backend_watch);
>          xenbus->backend_watch = NULL;
>      }
>  

The rest of the patch looks fine. Next improvement is to only look at
only one backend type in xen_bus_backend_changed() since there is now a
watch per backend type :-), but that would be for another day.

Cheers,

-- 
Anthony PERARD

