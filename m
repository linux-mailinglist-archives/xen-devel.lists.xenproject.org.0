Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ajGvDm9qOWrwsAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 19:01:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C36B1584
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 19:01:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=oEbVyDel;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1344010.1603199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbi0c-0008UG-FB; Mon, 22 Jun 2026 17:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344010.1603199; Mon, 22 Jun 2026 17:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbi0c-0008RP-7j; Mon, 22 Jun 2026 17:00:30 +0000
Received: by outflank-mailman (input) for mailman id 1344010;
 Mon, 22 Jun 2026 17:00:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef046aaee000701b@swg.vates.tech>)
 id 1wbi0a-0008RI-7m
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:00:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbi0Z-006y3z-6k
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 19:00:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef046aaee000701b@swg.vates.tech>)
 id 6a396a24-5cb7-0a2a0a5109dd-0a2a450b9db0-12
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 19:00:26 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef046aaee000701b@swg.vates.tech>)
 id 6a396a2a-5e53-0a2a450b0019-b9ff1c1292a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 19:00:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ef046aaee000701b.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Jun 2026 17:00:23 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id A099186965;
 Mon, 22 Jun 2026 19:00:22 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Ju/3B1Me1rhkY4iVn8cV9+73JS+eoK2kWix/pB3Clqw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=oEbVyDelKVa6jc+u5MRIwYbPVuAzNuZsYkTUZwWpMS7b/SWI6QBpomSgpsthD+3iQBbmiNAVk
 qsZcfR2mO9CrexOfa9NAqV+4uy/60Xn6t9bOO/JcWdCYGKZFLj9BEd8PPFV22CV6snJc2BTfOb+
 ntYpm1n1WevvZc1suNmXo6J5JjmtFy4TAQd/lQTBSu6xvEzPsQVm1rGnU9fsAYqTPBnj6toIEml
 0Y9zARe5lYmCvdmHgwaH2D7qzh3ZBFgqkEqZFncdOl2pXBuX8p6ysEBrmzzJhO3ql+V/7+b5WHz
 BCQRSTj4pZGX6lTm9kEKTFPAb6RSnM5G9ZiRI2NzyU2g==
X-Zone-Loop: 0a139c037d014ccdb397080bb7ed4a24c27db484ba34
x-campaign-type: default
x-transaction-id: b714e493-43fc-4ace-b79e-5b7ace180e53
x-swg-uid: 01-ac2338f3-a9ff-435f-85a4-e49e0fd53587
X-Mailer: Sweego
Message-ID:
 <1782147623.8631fc262581453bbf619ec5b2062170.19ef046aaee000701b@vates.tech>
x-swg-bid: 1782147623.8631fc262581453bbf619ec5b2062170.19ef046aaee000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 22 Jun 2026 19:00:22 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v4 5/6] libxl: Allow PCI device passthrough using
 -device Qemu command line
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
 <1776955859.8631fc262581453bbf619ec5b2062170.19dbad2a232000f373@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1776955859.8631fc262581453bbf619ec5b2062170.19dbad2a232000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.995.43df3ab7b010b33d.19ef046a784.305e84d759ca35ab=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782147622789
X-purgate-ID: tlsNG-42698a/1782147626-4CFF100E-8D91848C/0/0
X-purgate-type: clean
X-purgate-size: 7330
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 824C36B1584

---=Part.995.43df3ab7b010b33d.19ef046a784.305e84d759ca35ab=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 04:50:30PM +0200, Thierry Escande wrote:
> This change makes use of the new option 'hotplug' for host PCI devices
> passthrough'd to the guest=2E If hotplug=3D0 is used in the pci device
> configuration table, the device will be attached to the guest using the
> Qemu command line as '-device xen-pci-passthrough,hostaddr=3D=2E=2E=2E'
>=20
> The host device configuration is passed to the -device option as a json
> array, just like it's done for hotplug using QMP=2E The json array is

s/json array/JSON object/

> created by using libxl__device_pci_get_qapi_json() introduced by the
> previous patch=2E
>=20
> Then, instead of sending the 'device_add' command, the device_add
> callback is called to perform the 'query-pci' check to make sure the
> passthrough'd device is present=2E

That's not the reason we do `query-pci`, we run the command to find out
where QEMU assigned the device, to extract the the devfn=2E We already
know the device is present, either because QEMU started or because the
QMP command didn't returned an error=2E

We could avoid the `query-pci` command if we tell QEMU where to place
the new device=2E

So here, we skip `device_add` because that's already been done via the
command line=2E


> In the same way at shutdown, the device is not removed using QMP and
> only the pci_remove_done() function is called=2E
>=20
> As with QMP, the use of the 'hotplug=3D0' option honors the 'seize' opti=
on
> by adding the PCI device to the assignable list if needed=2E This mimics
> what is done in libxl__device_pci_add() with regards to seize option and
> the assignable PCI device list=2E This allows to display a proper error
> message if the device is not assignable before Qemu starts=2E

:-(, so we are duplicating code to handle pci->seize=2E That's not great=
=2E
Could you extract that so we can call it for hotplug and domain startup?

> diff --git a/tools/libs/light/libxl_dm=2Ec b/tools/libs/light/libxl_dm=
=2Ec
> index 511ec76a65=2E=2Efb0aeea640 100644
> --- a/tools/libs/light/libxl_dm=2Ec
> +++ b/tools/libs/light/libxl_dm=2Ec
> @@ -1798,6 +1798,39 @@ static int libxl__build_device_model_args_new(lib=
xl__gc *gc,
>              break;
>          }
> =20
> +        if (guest_config->num_pcidevs) {
> +            libxl_device_pci *pci;
> +            libxl__json_object *qmp_json;
> +            char *json_str;
> +
> +            for (i =3D 0; i < guest_config->num_pcidevs; i++) {
> +                pci =3D &guest_config->pcidevs[i];
> +
> +                if (pci->hotplug)
> +                    continue;

Since I don't think having an existing `pci->hotplug` field is a good
idea, you could run the whole loop based on the DM's machine type, that
is if it is Q35 we add pci-passthrough devices on the command line,
otherwise it's done via QMP=2E

In libxl__add_pcis(), we have access to `d_config`, so we can check
`device_model_machine` and pass the information to run `device_add` cmd
or not via the parameters of libxl__device_pci_add()=2E

If it turns out to be needed for i440FX machines, we could introduce a
domain config for the whole VM rather than by PCI devices we want to
passthrough=2E

> +                if (pci->seize && !libxl__pciback_dev_is_assigned(gc, p=
ci)) {
> +                    rc =3D libxl__device_pci_assignable_add(gc, pci, 1)=
;
> +                    if (rc)
> +                        return rc;
> +                }
> +
> +                if (!libxl_device_pci_assignable(libxl__gc_owner(gc), p=
ci)) {

There's the macro `CTX` that can be used instead of `libxl__gc_owner(gc)`=
=2E

> +                    LOGD(ERROR, guest_domid, "PCI device %x:%x:%x=2E%x =
is not assignable",
> +                         pci->domain, pci->bus, pci->dev, pci->func);
> +                    return ERROR_FAIL;
> +                }
> +
> +                qmp_json =3D libxl__device_pci_get_qapi_json(gc, pci);

It's not `qmp_json` here :-), QMP is the protocol use to communicate
with QEMU via a socket, but there's no QMP involve on the command line=2E
That function doesn't return any JSON, it returns an object that can
represent some JSON=2E=20

Here, we have an object to be passed to `-device` or `device_add`, maybe
just `pci_obj` would be ok as a name for the variable=2E

> +                json_str =3D libxl__json_object_to_json(gc, qmp_json, f=
alse);
> +                if (!json_str)
> +                    return ERROR_NOMEM;
> +
> +                flexarray_vappend(dm_args, "-device", json_str, NULL);
> +            }
> +        }
> +
>          if (state->dm_runas) {
>              if (qemu_opts->have_runwith_user) {
>                  flexarray_append_pair(dm_args, "-run-with",
> diff --git a/tools/libs/light/libxl_pci=2Ec b/tools/libs/light/libxl_pci=
=2Ec
> index 5004ca47d9=2E=2Ef5216f6b33 100644
> --- a/tools/libs/light/libxl_pci=2Ec
> +++ b/tools/libs/light/libxl_pci=2Ec
> @@ -1148,7 +1148,10 @@ static void pci_add_qmp_device_add(libxl__egc *eg=
c, pci_add_state *pas)
>      qmp->domid =3D domid;
>      qmp->payload_fd =3D -1;
>      qmp->callback =3D pci_add_qmp_device_add_cb;
> -    rc =3D libxl__ev_qmp_send(egc, qmp, "device_add", args);
> +    if (pci->hotplug)
> +        rc =3D libxl__ev_qmp_send(egc, qmp, "device_add", args);
> +    else
> +        pci_add_qmp_device_add_cb(egc, qmp, NULL, 0);

Could you add the mention /* must be last */ on the same line?
Also, the call to pci_add_qmp_device_add() should be immediately followed =
by
"return", we don't want to be in a position where "pci_add_dm_done()"
could be executed twice=2E

Could you add a comment? Saying we skip "device_add" because the device
has already be added via command line?

>      if (rc) goto out;

So, this could be moved to the true block of the if, right after
libxl__ev_qmp_send() call=2E

>      return;
> =20
> @@ -1830,6 +1833,14 @@ static void do_pci_remove(libxl__egc *egc, pci_re=
move_state *prs)
>      libxl_domain_type type =3D libxl__domain_type(gc, domid);
>      libxl_device_pci *pci =3D &prs->pci;
>      int rc, num;
> +
> +    /* Passthrough'd device has been passed to Qemu command line so the=
re is
> +     * no need to remove it via QMP */

That's not the only thing been done=2E After trying to ask nicely QEMU to
detach from the PCI device, there's a bunch more cleanup done in dom0=2E
If you look at the success and error path, we always call
`pci_remove_detached()`=2E

The only problem is that when Q35 is been use, we just want be able to
hot-unplug the device from QEMU's emulated PCI bus, but that's just a
detail; and it doesn't really matter how the device is been added to the
machine, there isn't much difference between QEMU's command line and QMP=
=2E

> +    if (!pci->hotplug) {
> +        pci_remove_done(egc, prs, 0);
> +        return;
> +    }
> +

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.995.43df3ab7b010b33d.19ef046a784.305e84d759ca35ab=---

