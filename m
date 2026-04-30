Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOYgMgVJ82kMzAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 14:20:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6473E4A2B1D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2026 14:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298117.1573661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIQMu-0004US-30; Thu, 30 Apr 2026 12:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298117.1573661; Thu, 30 Apr 2026 12:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIQMu-0004Sg-08; Thu, 30 Apr 2026 12:19:48 +0000
Received: by outflank-mailman (input) for mailman id 1298117;
 Thu, 30 Apr 2026 12:19:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dde54a2a9000f373@swg.vates.tech>)
 id 1wIQMs-0004Sa-Ep
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 12:19:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIQMq-006NJ8-9B
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 14:19:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dde54a2a9000f373@swg.vates.tech>)
 id 69f348d8-bab6-0a2a0a5309dd-0a2a4508b17c-34
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 14:19:45 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dde54a2a9000f373@swg.vates.tech>)
 id 69f348e1-63b5-0a2a45080019-b9ff1c2294cb-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 14:19:45 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dde54a2a9000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Apr 2026 12:19:41 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3B36086534;
 Thu, 30 Apr 2026 14:19:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=5PJuoDO+IUJP94Y/AXxtsVNhqUs4q7DPJAsExb/x+N0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=X6ImDpdSlSZ/QUNiwMHHn9fHL0Vr46MLc6ZdcxOWhGHBBtY1vXU3aaWUXjji28Agu4znS1UVb
 dwZObq5oYXrxgyhhq/jfRorTPJKHIPgCGVkViiMSHH8mylGoh6toem5V9WQeG+fzDHU21MdLaSE
 joRLETVTgF2OPGGQUoMqNp6aiRgKqnf4LNTNoR8KiXbf11tu1sCGwckgUjPQqSX2wFPjSQCbwg5
 PU/tPPh3lje7s0uxOWImwLF6XFPiwVE/zgug7v0h5vRPiBYZ78UGvjltB92A7AzWO2ZuBA5q6on
 Puc8E+ghUNKy9Li8JCH7FS2Q88BtybNZZ+CZ4nuCb2jQ==
X-Zone-Loop: cd6d33d4832819ab798166a8883d56bb43d39a62e49c
x-campaign-type: default
x-transaction-id: f8d55d72-40fc-4ef1-a2fa-f74c28736ab1
x-swg-uid: 01-34ca0fdd-52e2-4b54-a34c-214c960750d8
X-Mailer: Sweego
Message-ID:
 <1777551581.8631fc262581453bbf619ec5b2062170.19dde54a2a9000f373@vates.tech>
x-swg-bid: 1777551581.8631fc262581453bbf619ec5b2062170.19dde54a2a9000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 30 Apr 2026 14:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: identify uninitialized CPU data using BAD_APICID
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260430114647.94526-1-roger.pau@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <20260430114647.94526-1-roger.pau@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.363.4a99b96f1ae4c136.19dde54a08b.938d6b25e654684b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777551581324
X-purgate-ID: tlsNG-c1860d/1777551585-C2776DB1-EDB6AFE7/0/0
X-purgate-type: clean
X-purgate-size: 1636
X-Rspamd-Queue-Id: 6473E4A2B1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.363.4a99b96f1ae4c136.19dde54a08b.938d6b25e654684b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/04/2026 =C3=A0 13:47, Roger Pau Monne a =C3=A9crit=C2=A0:
> Uninitialized cpu_data[]=C2=A0entries have the apicid field set to BAD_A=
PICID,
> not boot_cpu_data=2Eapicid=2E  Fix the check in cpu_smpboot_free() to us=
e the
> correct condition=2E
>=20
> Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
> Signed-off-by: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>
> ---
>   xen/arch/x86/smpboot=2Ec | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/smpboot=2Ec b/xen/arch/x86/smpboot=2Ec
> index 491cbbba33ae=2E=2Eff05955bae40 100644
> --- a/xen/arch/x86/smpboot=2Ec
> +++ b/xen/arch/x86/smpboot=2Ec
> @@ -961,8 +961,7 @@ static void cpu_smpboot_free(unsigned int cpu, bool =
remove)
>        * In that case the socket number cannot be relied upon, but the r=
espective
>        * socket_cpumask[] slot also wouldn't have been set=2E
>        */
> -    if ( c[cpu]=2Eapicid !=3D boot_cpu_data=2Eapicid &&
> -         cpumask_empty(socket_cpumask[socket]) )
> +    if ( c[cpu]=2Eapicid !=3D BAD_APICID && cpumask_empty(socket_cpumas=
k[socket]) )
>       {
>           xfree(socket_cpumask[socket]);
>           socket_cpumask[socket] =3D NULL;

Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.363.4a99b96f1ae4c136.19dde54a08b.938d6b25e654684b=---

