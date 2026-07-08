Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ppGhDr1UTmpZKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:46:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA638726EF6
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:46:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=cDvm5pxk;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357033.1611537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSb3-0002eE-5B; Wed, 08 Jul 2026 13:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357033.1611537; Wed, 08 Jul 2026 13:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSb3-0002bo-1Z; Wed, 08 Jul 2026 13:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1357033;
 Wed, 08 Jul 2026 13:45:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41fa3b4500080a8@swg.vates.tech>)
 id 1whSb1-0002bi-6R
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:45:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whSb0-00HTef-Ib
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:45:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41fa3b4500080a8@swg.vates.tech>)
 id 6a4e548d-e002-0a2a0a5209dd-0a2a45069258-8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:45:50 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41fa3b4500080a8@swg.vates.tech>)
 id 6a4e548e-08de-0a2a45060019-b9ff1c238fcd-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:45:50 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f41fa3b4500080a8.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 13:45:46 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7192680A0E;
 Wed,  8 Jul 2026 15:45:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Ykgml7YM04eyLMiYabgG/jP8nFiF/IG2m+8+oNR3T2E=;
 h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:references:feedback-id;
 b=cDvm5pxkwld6ZbaJJoDWVgquK2qJwtQefD9aCLHb9m+yBlII5HCtQItkquWpCKmny/E276XNx
 dLJ6EjKIjdC7sLpWJ7cgjyCy+jrnQG1J5zrBFRwCWvDYDceZwncwh73/BmWTizcU9AY/C6YN6JD
 K+LYToAlQ5LXpXwY8K1SL+qTQ2+Gz1v8rTSAGPaimKqAAVpKEWznuFGU21bdFE0+SL6jBN1Z7zQ
 swUNQXxlirt3z7bv6/YIsd5jC63Zu2UF85mA2IciXEC/z4M+/oode3at0C+hzY8vpNN6JUAQLqd
 MwbsuOgM+TLip7bcTiG021uKgfR4CFEmsY2hSweSdgag==
X-Zone-Loop: 209573d26e817b55eee7e9d493af098417a114cada9b
x-campaign-type: default
x-transaction-id: 718c8d51-196b-4cd7-9e6e-ec5dd208f4ec
x-swg-uid: 01-ce87ecb0-df1a-4ec1-9856-086a95c8b763
X-Mailer: Sweego
Message-ID:
 <1783518346.8631fc262581453bbf619ec5b2062170.19f41fa3b4500080a8@vates.tech>
x-swg-bid: 1783518346.8631fc262581453bbf619ec5b2062170.19f41fa3b4500080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 14:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improper handling of fast-resumed domains by O/Cxenstored
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@vates.tech>
 <bf89f32e-f54f-47ad-a99f-eb0b1ba1d06e@suse.com>
Content-Language: en-US
From: Andrii Sultanov <andriy.sultanov@vates.tech>
In-Reply-To: <bf89f32e-f54f-47ad-a99f-eb0b1ba1d06e@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.42c.e1bd5308536b174f.19f41fa3960.90fe45a6668b2c7d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783518345568
X-purgate-ID: tlsNG-16d1c6/1783518350-42D2568D-6CC1F1EC/0/0
X-purgate-type: clean
X-purgate-size: 2707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[andriy.sultanov@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_MUA_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.sultanov@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA638726EF6

---=Part.42c.e1bd5308536b174f.19f41fa3960.90fe45a6668b2c7d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/7/26 14:53, J=C3=BCrgen Gro=C3=9F wrote:

> In fact this is a hypervisor issue=2E In __domain_finalise_shutdown()=20
> the call
> of domain_changed_state() should only happen if=20
> send_global_virq(VIRQ_DOM_EXC)
> is done=2E
>
> Could you please test whether the following diff is helping?
>
> diff --git a/xen/common/domain=2Ec b/xen/common/domain=2Ec
> index 53ac1d6c40=2E=2Ea4d9095c20 100644
> --- a/xen/common/domain=2Ec
> +++ b/xen/common/domain=2Ec
> @@ -286,11 +286,12 @@ static void __domain_finalise_shutdown(struct=20
> domain *d)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
>
> =C2=A0=C2=A0=C2=A0=C2=A0 d->is_shut_down =3D 1;
> -=C2=A0=C2=A0=C2=A0 domain_changed_state(d);
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( (d->shutdown_code =3D=3D SHUTDOWN_suspend)=
 && d->suspend_evtchn )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evtchn_send(d, d->suspe=
nd_evtchn);
> -=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0 else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domain_changed_state(d);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 send_global_virq(VIRQ_D=
OM_EXC);
> +=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
>
> =C2=A0static void vcpu_check_shutdown(struct vcpu *v)
>
>
>
> Juergen
It does look like the above patch is needed=2E

But even with it:

 =C2=A0 =C2=A0 1) toolstacks should register suspend_evtchn for all domain=
s
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(xapi currently does not register it for any d=
omains)
 =C2=A0 =C2=A0 AND
 =C2=A0 =C2=A0 2) both xenstoreds should use xenmanage_poll_changed_domain
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(oxenstored still hasn't integrated xenmanage)

Otherwise a VIRQ_DOM_EXC on a shutdown (shutdown_code !=3D SHUTDOWN_suspen=
d)
domain will force xenstored to check all the domains and to tear down the
suspended domain which did not send out the VIRQ=2E

Given that xenmanage is only available on 4=2E21+, it seems like an easier
solution would be to just skip SHUTDOWN_suspend domains in the=20
check_domains()
loop (I don't believe we'd miss sending out a @releaseDomain event, anothe=
r
VIRQ should be sent out on domain destruction)=2E I'll probably integrate =
this
hacky fix into the older version I'm working with (4=2E17=2E6) and start w=
ork on
the proper solution long-term=2E

Thank you!
Andrii



-- 
Andriy Sultanov | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.42c.e1bd5308536b174f.19f41fa3960.90fe45a6668b2c7d=---

