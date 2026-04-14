Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM36EOkC3mkRmAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 11:03:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B393F7A25
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 11:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281480.1564371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZfZ-0008CW-F2; Tue, 14 Apr 2026 09:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281480.1564371; Tue, 14 Apr 2026 09:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZfZ-0008AF-CU; Tue, 14 Apr 2026 09:02:53 +0000
Received: by outflank-mailman (input) for mailman id 1281480;
 Tue, 14 Apr 2026 09:02:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69de0207.v1-b9680d33670344a88a98b650cd451bf3@bounce.vates.tech>)
 id 1wCZfY-0008A5-Kd
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 09:02:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCZfW-008ho5-Kk
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:02:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69de0207.v1-b9680d33670344a88a98b650cd451bf3@bounce.vates.tech>)
 id 69de02b6-e002-0a2a0a5209dd-0a2a450c8724-28
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:02:50 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69de0207.v1-b9680d33670344a88a98b650cd451bf3@bounce.vates.tech>)
 id 69de02b9-f40c-0a2a450c0019-c602bb01ed5c-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:02:50 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fvys36XyvzBsWKQC
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 08:59:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b9680d33670344a88a98b650cd451bf3; Tue, 14 Apr 2026 08:59:51 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776157191; x=1776427191;
	bh=8jPI6VgNJMTJNIvIHMSppJhg9KypSLlcd8SYkTbpLig=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=T3Zor9C52AcN957CmzdR6gij3hs/UD+/NF4ku8IuVvqx57Zf7jnOmzgsP2X53u7qH
	 hLCh2sFMrnw6YzNHjpD7Yhh0su+I6E/RTKy1vn2Otk7hB8AXn+V5Sb6fsQEFPIT3S1
	 G9jFD52dQyz2vnEWD9h8FsYtWztDxtdwY1M/Npda2TYo5E0OKR9Aj6FSdXYkG5byzs
	 Do0O6Jc4M6EOZpmDfAHlTm4cG3Qu3C4PyCSS0Xe8+EiC8Qxx+8uIOFiaGYr+0gAQV2
	 Bg0nSz1dswDyKJOteWkT4I4UBxLvA7/fpBGDFnxURwS1Vz/vhONFAYDm6xlrNSc3Va
	 b9kfdN1be4F1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776157191; x=1776417691; i=teddy.astie@vates.tech;
	bh=8jPI6VgNJMTJNIvIHMSppJhg9KypSLlcd8SYkTbpLig=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ajdXIbbOT8V+fkiigRG3cTwnPBcHYOaUlDxN69Yt1irH5yTFG+HmfzvIlSzNj8myx
	 c2wr1nvttUzE3aDu45CgcekS2FcTOFnJgP8WFtXr0pfKjdWm1jVTUQL5urjxvYHgsV
	 mx/0FywqR2OCIcvpCx6zMlihb8ZyBxAgOQPiLNp8KEknoqPic5uJOYu/IQcqZSJFFx
	 rC4VRmTZuaTi2u8fUdbXgks1RoWnQ7uKVTwFr1uszu38aNOqMLSf9aAFRcu+/siAci
	 vAYu57opIEvk8ZQpR568+PomoaW/u8mKHyo+oBLzjgRB+yhNfPdwE1k6vrpjMsh40X
	 GV0s47gdrDC8w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v3=202/3]=20libxl:=20Allow=20PCI=20device=20passthrough=20using=20-device=20Qemu=20command=20line?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776157191140
Message-Id: <ece34618-f527-455d-a6fe-c964aa1f4878@vates.tech>
To: "Thierry Escande" <thierry.escande@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
References: <20260410150333.1533568-1-thierry.escande@vates.tech> <20260410150333.1533568-3-thierry.escande@vates.tech>
In-Reply-To: <20260410150333.1533568-3-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b9680d33670344a88a98b650cd451bf3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260414:md
Date: Tue, 14 Apr 2026 08:59:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1776157370-8055FA3D-F07BA524/0/0
X-purgate-type: clean
X-purgate-size: 13699
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.781];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 90B393F7A25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 10/04/2026 =C3=A0 17:06, Thierry Escande a =C3=A9crit=C2=A0:
> This change makes use of the new option 'hotplug' for host PCI devices
> passthrough'd to the guest. If hotplug=3D0 is used in the pci device
> configuration table, the device will be attached to the guest using the
> Qemu command line as '-device xen-pci-passthrough,hostaddr=3D...'
> 
> The host device configuration is passed to the -device option as a json
> array, just like it's done for hotplug using QMP. The json array is
> created by a new internal function libxl__device_pci_get_qmp_json() that
> is also used by pci_add_qmp_device_add().

If (in this specific case) we're not using QMP anymore, I think 
libxl__device_pci_get_qmp_json should lose the "qmp" qualification.
(unless QEMU also considers JSON-formatted command-line paramters as QMP)

> 
> Then, instead of sending the 'device_add' command, the device_add
> callback is called to perform the 'query-pci' check to make sure the
> passthrough'd device is present.
> 
> In the same way at shutdown, the device is not removed using QMP and
> only the pci_remove_done() function is called.
> 
> As with QMP, the use of the 'hotplug=3D0' option honors the 'seize' optio=
n
> by adding the PCI device to the assignable list if needed. This mimics
> what is done in libxl__device_pci_add() with regards to seize option and
> the assignable PCI device list. This allows to display a proper error
> message if the device is not assignable before Qemu starts.
> To do so the function pciback_dev_is_assigned() has been renamed as
> libxl__pciback_dev_is_assigned() and made available internally, as well
> as libxl__device_pci_assignable_add(). Also, libxl_pci_assignable() is
> now exported in libxl.h and renamed as libxl_device_pci_assignable()
> since its prototype looks like the other libxl_device_pci_*() APIs.
> 
> Example use:
>   pci =3D [ "00:03.0,seize=3D1,hotplug=3D0" ]
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
> v2:
> - Add support for YAJL json parser
> 
> v3:
> - Move code block for device command line parameters creation to a
>    correct place.
> - Better handling of PCI device assignation check to display the correct
>    error message if the device is not assignable.
> ---
>   tools/include/libxl.h             |  1 +
>   tools/libs/light/libxl_dm.c       | 85 +++++++++++++++++++++++++++++++
>   tools/libs/light/libxl_internal.h |  7 +++
>   tools/libs/light/libxl_pci.c      | 57 ++++++++++++++-------
>   4 files changed, 132 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 7c098edab6..efd2664a90 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -2666,6 +2666,7 @@ int libxl_device_pci_assignable_add(libxl_ctx *ctx,=
 libxl_device_pci *pci, int r
>   int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci=
 *pci, int rebind);
>   libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int =
*num);
>   void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int =
num);
> +bool libxl_device_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci);
>   
>   /* CPUID handling */
>   int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char=
* str);
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 511ec76a65..28e4adbd4f 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -1798,6 +1798,91 @@ static int libxl__build_device_model_args_new(libx=
l__gc *gc,
>               break;
>           }
>   
> +        if (guest_config->num_pcidevs) {
> +            libxl_device_pci *pci;
> +            libxl__json_object *qmp_json;
> +            char *json_str;
> +#ifdef HAVE_LIBJSONC
> +            json_object *jso;
> +            const char *buf;
> +#elif defined(HAVE_LIBYAJL)
> +            yajl_gen hand;
> +            /* memory for 'buf' is owned by 'hand' */
> +            const unsigned char *buf;
> +            libxl_yajl_length len;
> +#else
> +#           error Missing JSON library
> +#endif
> +
> +            for (i =3D 0; i < guest_config->num_pcidevs; i++) {
> +                pci =3D &guest_config->pcidevs[i];
> +
> +                if (pci->hotplug)
> +                    continue;
> +
> +                if (pci->seize && !libxl__pciback_dev_is_assigned(gc, pc=
i)) {
> +                    rc =3D libxl__device_pci_assignable_add(gc, pci, 1);
> +                    if (rc)
> +                        return rc;
> +                }> +
> +                if (!libxl_device_pci_assignable(libxl__gc_owner(gc), pc=
i)) {
> +                    LOGD(ERROR, guest_domid, "PCI device %x:%x:%x.%x is =
not assignable",
> +                         pci->domain, pci->bus, pci->dev, pci->func);
> +                    return ERROR_FAIL;
> +                }
> +
> +                qmp_json =3D libxl__device_pci_get_qmp_json(gc, pci);
> +
> +#ifdef HAVE_LIBJSONC
> +                rc =3D libxl__json_object_to_json_object(gc, &jso, qmp_j=
son);
> +                if (rc)
> +                    return rc;
> +
> +                buf =3D json_object_to_json_string_ext(jso,
> +                                                     JSON_C_TO_STRING_PL=
AIN);
> +                if (!buf) {
> +                    json_object_put(jso);
> +                    return ERROR_NOMEM;
> +                }
> +#elif defined(HAVE_LIBYAJL)
> +                hand =3D libxl_yajl_gen_alloc(NULL);
> +                if (!hand) {
> +                    return ERROR_NOMEM;
> +                }
> +#if HAVE_YAJL_V2
> +                /* Disable beautify for data sent to QEMU */
> +                yajl_gen_config(hand, yajl_gen_beautify, 0);
> +#endif
> +
> +                rc =3D libxl__json_object_to_yajl_gen(gc, hand, qmp_json=
);
> +                if (rc) {
> +                    yajl_gen_free(hand);
> +                    return rc;
> +                }
> +
> +                rc =3D yajl_gen_get_buf(hand, &buf, &len);
> +                if (rc !=3D yajl_gen_status_ok) {
> +                    yajl_gen_free(hand);
> +                    return rc;
> +                }
> +#endif
> +
> +                json_str =3D libxl__strdup(gc, (const char *)buf);
> +                if (json_str)
> +                    flexarray_vappend(dm_args, "-device", json_str, NULL=
);
> +
> +#ifdef HAVE_LIBJSONC
> +                json_object_put(jso);
> +#elif defined(HAVE_LIBYAJL)
> +                yajl_gen_free(hand);
> +#endif
> +
> +                if (!json_str)
> +                    return ERROR_NOMEM;
> +            }
> +        }
> +
>           if (state->dm_runas) {
>               if (qemu_opts->have_runwith_user) {
>                   flexarray_append_pair(dm_args, "-run-with",
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_i=
nternal.h
> index b65e0064b9..cab2ab4526 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -1729,6 +1729,13 @@ _hidden int libxl__device_pci_setdefault(libxl__gc=
 *gc, uint32_t domid,
>                                            libxl_device_pci *pci, bool ho=
tplug);
>   _hidden bool libxl__is_igd_vga_passthru(libxl__gc *gc,
>                                           const libxl_domain_config *d_co=
nfig);
> +_hidden libxl__json_object *libxl__device_pci_get_qmp_json(libxl__gc *gc=
,
> +                                                         libxl_device_pc=
i *pci);
> +_hidden int libxl__pciback_dev_is_assigned(libxl__gc *gc,
> +                                           libxl_device_pci *pci);
> +_hidden int libxl__device_pci_assignable_add(libxl__gc *gc,
> +                                             libxl_device_pci *pci,
> +                                             int rebind);
>   
>   /* from libxl_dtdev */
>   
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 49d272d0de..07d005e71d 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -686,7 +686,7 @@ out:
>       return rc;
>   }
>   
> -static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
> +int libxl__pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
>   {
>       char * spath;
>       int rc;
> @@ -755,9 +755,9 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_=
device_pci *pci)
>       return 0;
>   }
>   
> -static int libxl__device_pci_assignable_add(libxl__gc *gc,
> -                                            libxl_device_pci *pci,
> -                                            int rebind)
> +int libxl__device_pci_assignable_add(libxl__gc *gc,
> +                                     libxl_device_pci *pci,
> +                                     int rebind)
>   {
>       libxl_ctx *ctx =3D libxl__gc_owner(gc);
>       unsigned dom, bus, dev, func;
> @@ -798,7 +798,7 @@ static int libxl__device_pci_assignable_add(libxl__gc=
 *gc,
>       }
>   
>       /* Check to see if it's already assigned to pciback */
> -    rc =3D pciback_dev_is_assigned(gc, pci);
> +    rc =3D libxl__pciback_dev_is_assigned(gc, pci);
>       if ( rc < 0 ) {
>           return ERROR_FAIL;
>       }
> @@ -913,7 +913,7 @@ static int libxl__device_pci_assignable_remove(libxl_=
_gc *gc,
>       }
>   
>       /* Unbind from pciback */
> -    if ( (rc =3D pciback_dev_is_assigned(gc, pci)) < 0 ) {
> +    if ( (rc =3D libxl__pciback_dev_is_assigned(gc, pci)) < 0 ) {
>           return ERROR_FAIL;
>       } else if ( rc ) {
>           pciback_dev_unassign(gc, pci);
> @@ -1098,16 +1098,10 @@ out:
>       pci_add_dm_done(egc, pas, rc); /* must be last */
>   }
>   
> -static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
> +libxl__json_object *libxl__device_pci_get_qmp_json(libxl__gc *gc,
> +                                                   libxl_device_pci *pci=
)
>   {
> -    STATE_AO_GC(pas->aodev->ao);
>       libxl__json_object *args =3D NULL;
> -    int rc;
> -
> -    /* Convenience aliases */
> -    libxl_domid domid =3D pas->domid;
> -    libxl_device_pci *pci =3D &pas->pci;
> -    libxl__ev_qmp *const qmp =3D &pas->qmp;
>   
>       libxl__qmp_param_add_string(gc, &args, "driver",
>                                   "xen-pci-passthrough");
> @@ -1134,11 +1128,30 @@ static void pci_add_qmp_device_add(libxl__egc *eg=
c, pci_add_state *pas)
>       if (pci->permissive)
>           libxl__qmp_param_add_bool(gc, &args, "permissive", true);
>   
> +    return args;
> +}
> +
> +static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
> +{
> +    STATE_AO_GC(pas->aodev->ao);
> +    libxl__json_object *args =3D NULL;
> +    int rc =3D 0;
> +
> +    /* Convenience aliases */
> +    libxl_domid domid =3D pas->domid;
> +    libxl_device_pci *pci =3D &pas->pci;
> +    libxl__ev_qmp *const qmp =3D &pas->qmp;
> +
> +    args =3D libxl__device_pci_get_qmp_json(gc, pci);
> +
>       qmp->ao =3D pas->aodev->ao;
>       qmp->domid =3D domid;
>       qmp->payload_fd =3D -1;
>       qmp->callback =3D pci_add_qmp_device_add_cb;

Is it expected to set this callback when !pci->hotplug (given it's the 
same than the one we call afterward) ?
(I don't really know well how works libxl though)

> -    rc =3D libxl__ev_qmp_send(egc, qmp, "device_add", args);
> +    if (pci->hotplug)
> +        rc =3D libxl__ev_qmp_send(egc, qmp, "device_add", args);
> +    else
> +        pci_add_qmp_device_add_cb(egc, qmp, NULL, 0);
>       if (rc) goto out;
>       return;
>   
> @@ -1509,7 +1522,7 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t d=
omid,
>       return AO_INPROGRESS;
>   }
>   
> -static bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
> +bool libxl_device_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
>   {
>       libxl_device_pci *pcis;
>       int num;
> @@ -1572,13 +1585,13 @@ void libxl__device_pci_add(libxl__egc *egc, uint3=
2_t domid,
>       rc =3D libxl__device_pci_setdefault(gc, domid, pci, !starting);
>       if (rc) goto out;
>   
> -    if (pci->seize && !pciback_dev_is_assigned(gc, pci)) {
> +    if (pci->seize && !libxl__pciback_dev_is_assigned(gc, pci)) {
>           rc =3D libxl__device_pci_assignable_add(gc, pci, 1);
>           if ( rc )
>               goto out;
>       }
>   
> -    if (!libxl_pci_assignable(ctx, pci)) {
> +    if (!libxl_device_pci_assignable(ctx, pci)) {
>           LOGD(ERROR, domid, "PCI device %x:%x:%x.%x is not assignable",
>                pci->domain, pci->bus, pci->dev, pci->func);
>           rc =3D ERROR_FAIL;
> @@ -1820,6 +1833,14 @@ static void do_pci_remove(libxl__egc *egc, pci_rem=
ove_state *prs)
>       libxl_domain_type type =3D libxl__domain_type(gc, domid);
>       libxl_device_pci *pci =3D &prs->pci;
>       int rc, num;
> +
> +    /* Passthrough'd device has been passed to Qemu command line so ther=
e is
> +     * no need to remove it via QMP */
> +    if (!pci->hotplug) {
> +        pci_remove_done(egc, prs, 0);
> +        return;
> +    }
> +

I think you can move the renaming/refactoring part into a separate patch 
and make the hotplug part separate.

>       pcis =3D libxl_device_pci_list(ctx, domid, &num);
>       if (!pcis) {
>           rc =3D ERROR_FAIL;



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



