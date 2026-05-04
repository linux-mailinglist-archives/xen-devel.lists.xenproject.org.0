Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBO/HyeV+Gn0wgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0BD4BD2D5
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299850.1574443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgp-0007ON-FL; Mon, 04 May 2026 12:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299850.1574443; Mon, 04 May 2026 12:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgp-0007Jt-Am; Mon, 04 May 2026 12:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1299850;
 Mon, 04 May 2026 12:46:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df306664a000f373@swg.vates.tech>)
 id 1wJsgn-00078H-K0
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgm-008wOo-W5
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:46:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df306664a000f373@swg.vates.tech>)
 id 69f89518-5cb7-0a2a0a5109dd-0a2a450aa660-16
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:46:20 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df306664a000f373@swg.vates.tech>)
 id 69f8951c-56b3-0a2a450a0019-b9ff1c228e6d-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:46:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19df306664a000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 May 2026 12:46:16 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7642186532;
 Mon,  4 May 2026 14:46:15 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=q1TgSmZVUf3dXKf9bf2uUFbwIpA7FlTLhGnt2rhwGps=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=lUySsOR0jgGmF+HhEUUYa3qzA7m3FUIq1kyUE8gFrhvPinhTOux4sL67xxL7F31lnehIZzPz2
 kuZMx2B5uG/AjDU5be0wyFohKWRtQWNKH09jZJeQT9lyTQy7Ec5CEGoRGetrLuAmk1jyUdlnF2q
 vKO8Grb+CRO1unGhEyczgMeA033mCCA6pM7XIUsawlLm+59TOq4taYe4uJ6KSjqxeMBi1TKB1er
 KkCjRa1/rgRF7IRxOV/vQJOon6iaBx3VzfnKPqqXIpVsJDWosiYabBXPSFTs4y+TPQ5/ixeTB48
 ex68kzEl9aEkGG+8ymJpr8tV8k72sArqdB3hjoipAejw==
X-Zone-Loop: 8d9832def169c1c8b2a41beffa9570fc5dc448829fb3
x-campaign-type: default
x-transaction-id: 3f9e383b-2881-450b-a3bd-1d7ddc0a7667
x-swg-uid: 01-92df888f-1250-4cb6-92dd-ab9d4f8d3731
X-Mailer: Sweego
Message-ID:
 <1777898776.8631fc262581453bbf619ec5b2062170.19df306664a000f373@vates.tech>
x-swg-bid: 1777898776.8631fc262581453bbf619ec5b2062170.19df306664a000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 4 May 2026 14:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: Drop allow_unsafe parameter, tune down XSA-9
 mitigations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1776877188.8631fc262581453bbf619ec5b2062170.19db6223737000f373@vates.tech>
 <fda8cb13-4ac6-4575-aba5-b2fcc3b4e1f9@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <fda8cb13-4ac6-4575-aba5-b2fcc3b4e1f9@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.110.5812edc7bc0bfa36.19df306644a.2fcdf0beede501cf=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777898775627
X-purgate-ID: tlsNG-4011c0/1777898780-44F618B7-10128DD2/0/0
X-purgate-type: clean
X-purgate-size: 1939
X-Rspamd-Queue-Id: 2D0BD4BD2D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:url,vates.tech:dkim,vates.tech:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.110.5812edc7bc0bfa36.19df306644a.2fcdf0beede501cf=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 04/05/2026 =C3=A0 12:39, Jan Beulich a =C3=A9crit=C2=A0:
> On 22=2E04=2E2026 18:58, Teddy Astie wrote:
>> @@ -1205,19 +1201,12 @@ static void cf_check init_amd(struct cpuinfo_x8=
6 *c)
>>   	if (c->family =3D=3D 0x10)
>>   		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
>>  =20
>> -	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
>> -		opt_allow_unsafe =3D 1;
>> -	else if (opt_allow_unsafe < 0)
>> -		panic("Xen will not boot on this CPU for security reasons"
>> -		      "Pass \"allow_unsafe\" if you're trusting all your"
>> -		      " (PV) guest kernels=2E\n");
>> -	else if (!opt_allow_unsafe && c =3D=3D &boot_cpu_data)
>> +	if (cpu_has_amd_erratum(c, AMD_ERRATUM_121))
>> +	{
>=20
> Nit: Misplaced brace (it's Linux style here)=2E But really I don't see w=
hy
> braces are added in the first place=2E
>=20

Yes, they can be removed here=2E

>>   		printk(KERN_WARNING
>> -		       "*** Xen will not allow creation of DomU-s on"
>> -		       " this CPU for security reasons=2E ***\n"
>> -		       KERN_WARNING
>> -		       "*** Pass \"allow_unsafe\" if you're trusting"
>> -		       " all your (PV) guest kernels=2E ***\n");
>> +			   "*** This CPU is affected with erratum 121"
>> +			   " 64-bits PV guests are able to cause a DoS (XSA-9) ***\n");
>=20
> Why the change in indentation?
>=20

Looks like my editor got confused with the mixed indentation of the=20
file=2E I can fix this case for the next version of the patch=2E

> There's also punctuation missing between both parts of the log message=
=2E
>=20

ok

> Jan
>=20

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.110.5812edc7bc0bfa36.19df306644a.2fcdf0beede501cf=---

