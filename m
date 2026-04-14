Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIB4EnUE3mkQmQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 11:10:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35473F7AEE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 11:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281490.1564381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZmS-0000Pe-5C; Tue, 14 Apr 2026 09:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281490.1564381; Tue, 14 Apr 2026 09:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZmS-0000NI-2U; Tue, 14 Apr 2026 09:10:00 +0000
Received: by outflank-mailman (input) for mailman id 1281490;
 Tue, 14 Apr 2026 09:09:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69de02f9.v1-3bd3658f131248f4abab24c50165b9dc@bounce.vates.tech>)
 id 1wCZmQ-0000N8-Fc
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 09:09:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCZmP-00AOQ4-No
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:09:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69de02f9.v1-3bd3658f131248f4abab24c50165b9dc@bounce.vates.tech>)
 id 69de0463-bab6-0a2a0a5309dd-0a2a4502c576-10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:09:57 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69de02f9.v1-3bd3658f131248f4abab24c50165b9dc@bounce.vates.tech>)
 id 69de0464-42fa-0a2a45020019-c602bb01b8ab-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:09:57 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fvyxj3CLJzBsXNlW
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 09:03:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3bd3658f131248f4abab24c50165b9dc; Tue, 14 Apr 2026 09:03:53 +0000
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
	s=mte1; t=1776157433; x=1776427433;
	bh=SmtwCDm1NRLAsj7Hr+STM+l6ztJL8PN3iVl5NvgBlR4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AuOfPcSo9Vux40ixD83qEwkU72TL/RIP2pjwH6jC1sGQjE3WUK2Eexn/IFIzrlv3M
	 kGlWB4lMUWvnzUpap3TIkmSbfFtn0KJbus/htK6FoIkjh5nektpgKhjNCNGovlFgNQ
	 J2XMknacI2FC2ezKkJ7TJRvY8Ji0QEqADwCAeE8q7aBTIYvEw3VjbaRptfDGOsf2uy
	 Iv7ofdTms9Pd2Gc2krwr8/juMAhItejMj+1qWHmjht1IWe/xlPJbdmORCvWuhYTkLF
	 SOmgz7dhGZ4G+S8qZPpZ9OJeYz4rqqYjsQSRhgS484s7X2rpVX0aQdJu7uLAwhuDbU
	 nrvrlWmWDeRtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776157433; x=1776417933; i=teddy.astie@vates.tech;
	bh=SmtwCDm1NRLAsj7Hr+STM+l6ztJL8PN3iVl5NvgBlR4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OgneJo8boniEahu6IlKf5jd5eYgxhhqOruTjV/8JO9qa0EFGiwAYdVc7CZwwVhi0z
	 riBDTg1nvXqwP9EPoSkm/cDTdyEq+RunhvjY9JKPRjnawqV4Ee2JVCYyBwmOD1EL58
	 Grzt7AQxwEJgRlQhAvgoRUzZq8dIdngOshGT9RaapYZFbqgNeNc3lUZ6nSO66wEDmQ
	 GcIrK/Cm/YsbLssEbh9zR8rm2yxqFepYJvFuWIcSGxUHcb/SXkm5Wwu80OzzhrVI+C
	 VbpMmjDR1gIonaD7vY5F57UVw6b2zCybi27sF30UFvSIuWVZ5db5RRH24KnXF2HjBX
	 kvRIcOvUzTwrA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v3=203/3]=20docs:=20provide=20description=20for=20pci=20hotplug=20option?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776157432758
Message-Id: <aebab2d5-afc4-4495-b2ec-bdd0caef9b9e@vates.tech>
To: "Thierry Escande" <thierry.escande@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
References: <20260410150333.1533568-1-thierry.escande@vates.tech> <20260410150333.1533568-4-thierry.escande@vates.tech>
In-Reply-To: <20260410150333.1533568-4-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3bd3658f131248f4abab24c50165b9dc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260414:md
Date: Tue, 14 Apr 2026 09:03:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1776157797-449F4CD1-1B01D432/0/0
X-purgate-type: clean
X-purgate-size: 2184
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.436];
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
X-Rspamd-Queue-Id: A35473F7AEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 10/04/2026 =C3=A0 17:06, Thierry Escande a =C3=A9crit=C2=A0:
> This patch adds description for the 'hotplug' PCI option, allowing
> devices to be attached to the guest using the legacy QMP hotplug
> mechanism or by passing them to the Qemu command line using '-device'.
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
> v2: no change
> v3: no change
> ---
>   docs/man/xl-pci-configuration.5.pod | 17 +++++++++++++++++
>   docs/man/xl.cfg.5.pod.in            |  6 ++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-config=
uration.5.pod
> index 0691f06ad3..8b664173cb 100644
> --- a/docs/man/xl-pci-configuration.5.pod
> +++ b/docs/man/xl-pci-configuration.5.pod
> @@ -166,6 +166,23 @@ dom0 without confirmation.  Please use with care.
>   
>   =3Dback
>   
> +=3Ditem B<hotplug>=3DI<BOOLEAN>
> +
> +=3Dover 4
> +
> +=3Ditem Description
> +
> +Tells L<xl(1)> to use QMP hotplug mechanism to attach assignable device =
to
> +the guest, or to pass it via Qemu command line using
> +'B<-device xen-pci-passthrough,...>'. The default is to use the legacy Q=
MP
> +mechanism.
> +
> +=3Ditem Default Value
> +
> +1
> +
> +=3Dback
> +
>   =3Ditem B<power_mgmt>=3DI<BOOLEAN>
>   
>   =3Dover 4
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 3aac0bc4fb..181aaffa0f 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1230,6 +1230,12 @@ B<(HVM only)> Changes the default value of B<power=
_mgmt> for all PCI
>   devices passed through to this VM. See B<power_mgmt>
>   above.
>   
> +=3Ditem B<pci_hotplug=3DBOOLEAN>
> +
> +B<(HVM only)> Changes the default value of B<hotplug> for all PCI
> +devices passed through to this VM. See L<xl-pci-configuration(5)> for
> +more details.
> +
>   =3Ditem B<gfx_passthru=3DBOOLEAN|"STRING">
>   
>   Enable graphics device PCI passthrough. This option makes an assigned

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



