Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHSgAr8tGGqyfQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 13:57:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424A5F1B0B
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 13:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321131.1588113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSZMa-0001Sh-3s; Thu, 28 May 2026 11:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321131.1588113; Thu, 28 May 2026 11:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSZMa-0001QZ-0M; Thu, 28 May 2026 11:57:24 +0000
Received: by outflank-mailman (input) for mailman id 1321131;
 Thu, 28 May 2026 11:56:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e6e7146fb000d780@swg.vates.tech>)
 id 1wSZLc-0001O3-0E
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 11:56:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSZLb-00Ee6P-7r
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 13:56:23 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e6e7146fb000d780@swg.vates.tech>)
 id 6a182d59-bab6-0a2a0a5309dd-0a2a4508c0d4-38
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 13:56:23 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e6e7146fb000d780@swg.vates.tech>)
 id 6a182d66-63b5-0a2a45080019-b9ff1c228f05-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 13:56:23 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e6e7146fb000d780.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 May 2026 11:56:18 +0000
Received: from [192.168.178.182] (unknown [51.148.166.212])
 (Authenticated sender: pau.safont)
 by mail2.vates.fr (Postfix) with ESMTPSA id 05B258657E;
 Thu, 28 May 2026 13:56:16 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=s2qt3kzZ2OImGll5tziYia1fWoioyR+7oRKNGzX+r6s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ge3R6SzTaxgJ0kOCx4JwC4kpqa6uO70vwlcabmMqoPYVJHnbZ8TOuHtaW6Z1PBlJnQC3pd/VR
 mfrpt+uWgWffbQvALqi2t2wO4mfZjzsodsZBKQ1aigjA6qA6y1g9kjCY643/D9LpROP/GyL1Xi9
 rViRJonOPEgc+m1OPMAxDKIq6IVfaw71ouCveOqQ8cQRqlmv4reHYpu2y5Jkp8838uXFtEQyNOV
 qbwQ+iKskXvGhYtLnBB00/KMNxv8luBgsb2tOaK3gBpspuXqqQcKQX3wF0NwFmv0i3YH9QtjNGZ
 X+holc9yGD7tQpX7U1Ztci7LSCwCkaRh5y2tA0sYu4Kw==
X-Zone-Loop: 344848b688ce5f7ef483476bc5ec6443a710f6a431d6
x-campaign-type: default
x-transaction-id: 04e08e82-0a8d-4a2f-9e6f-cdec36b1a607
x-swg-uid: 01-e5e78c17-2b30-4d3a-a302-65644abb583a
X-Mailer: Sweego
Message-ID:
 <1779969378.8631fc262581453bbf619ec5b2062170.19e6e7146fb000d780@vates.tech>
x-swg-bid: 1779969378.8631fc262581453bbf619ec5b2062170.19e6e7146fb000d780
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 28 May 2026 12:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Fix fallout from DOMID_ANY ABI breakage
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Denis Mukhin <dmukhin@ford.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Colin James <colin.barr@vates.tech>
References: <20260528113915.2355130-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Pau Ruiz Safont <pau.safont@vates.tech>
In-Reply-To: <20260528113915.2355130-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.164b.4bb40c100cd11592.19e6e7144c1.909c992ab4a050dc=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779969377473
X-purgate-ID: tlsNG-c1860d/1779969383-BE577DB1-0E49C9D6/0/0
X-purgate-type: clean
X-purgate-size: 2264
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:dmukhin@ford.com,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:colin.barr@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pau.safont@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url,vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pau.safont@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[vates.tech,amd.com,suse.com,xen.org,citrix.com,kernel.org,ford.com,gmail.com,invisiblethingslab.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9424A5F1B0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.164b.4bb40c100cd11592.19e6e7144c1.909c992ab4a050dc=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 28/05/2026 12:39, Andrew Cooper wrote:
> ---
>   CHANGELOG=2Emd                         | 4 ++++
>   tools/helpers/init-xenstore-domain=2Ec | 2 +-
>   tools/ocaml/libs/xc/xenctrl=2Eml       | 4 +++-
>   tools/python/xen/lowlevel/xc/xc=2Ec    | 2 +-
>   4 files changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/CHANGELOG=2Emd b/CHANGELOG=2Emd
> index 25f5a192ed48=2E=2E1db3efc4864c 100644
> --- a/CHANGELOG=2Emd
> +++ b/CHANGELOG=2Emd
> @@ -7,6 +7,10 @@ The format is based on [Keep a Changelog](https://keepa=
changelog=2Ecom/en/1=2E0=2E0/)
>   ## [4=2E22=2E0 UNRELEASED](https://xenbits=2Exenproject=2Eorg/gitweb/?=
p=3Dxen=2Egit;a=3Dshortlog;h=3Dstaging) - TBD
>  =20
>   ### Changed
> + - Users of XEN_DOMCTL_createdomain/xc_domain_create() must now pass DO=
MID_ANY
> +   to obtain an automatically allocated domid=2E  The prior sentinel va=
lues (0
> +   since the start of Xen, and DOMID_INVALID since Xen 4=2E21) now no l=
onger
> +   represent a wildcard input=2E
>    - On x86:
>      - Enable pf-fixup option by default for PVH dom0=2E
>  =20
> diff --git a/tools/ocaml/libs/xc/xenctrl=2Eml b/tools/ocaml/libs/xc/xenc=
trl=2Eml
> index 97108b9d861a=2E=2E147afa62c293 100644
> --- a/tools/ocaml/libs/xc/xenctrl=2Eml
> +++ b/tools/ocaml/libs/xc/xenctrl=2Eml
> @@ -208,7 +208,9 @@ let with_intf f =3D
>   external domain_create_stub: handle -> domid -> domctl_create_config -=
> domid
>     =3D "stub_xc_domain_create"
>  =20
> -let domain_create handle ?(domid=3D0) config =3D
> +let domid_any =3D 0x7ff5 (* DOMID_ANY from public/xen=2Eh *)
> +
> +let domain_create handle ?(domid=3Ddomid_any) config =3D
>     domain_create_stub handle domid config
>  =20
>   external domain_sethandle: handle -> domid -> string -> unit
> base-commit: e63ba93511b33c0d3bb8cc5870f946f41e1d2655

Acked-by: Pau Ruiz Safont <pau=2Esafont@vates=2Etech>

Regards,
Pau



-- 
Pau Ruiz Safont | Vates XAPI Developer

XCP-ng & Xen Orchestra - Vates=
 solutions

web: https://vates=2Etech
---=Part.164b.4bb40c100cd11592.19e6e7144c1.909c992ab4a050dc=---

