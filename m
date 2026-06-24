Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gf7FLXjlO2oCfAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:11:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DD06BEFAF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:11:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=ZX1Z2yiW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1345006.1604014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOJO-0007jH-TM; Wed, 24 Jun 2026 14:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345006.1604014; Wed, 24 Jun 2026 14:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOJO-0007gw-Q5; Wed, 24 Jun 2026 14:10:42 +0000
Received: by outflank-mailman (input) for mailman id 1345006;
 Wed, 24 Jun 2026 14:10:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef9f7ec4e000701b@swg.vates.tech>)
 id 1wcOJN-0007gq-9V
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:10:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcOJM-002cNU-B2
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 16:10:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef9f7ec4e000701b@swg.vates.tech>)
 id 6a3be558-bab6-0a2a0a5309dd-0a2a4509bbc0-18
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:10:40 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef9f7ec4e000701b@swg.vates.tech>)
 id 6a3be55f-97e6-0a2a45090019-b9ff1c12864f-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:10:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ef9f7ec4e000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 24 Jun 2026 14:10:35 +0000
Received: from [192.168.1.61] (155.223.66.37.rev.sfr.net [37.66.223.155])
 (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 846C482DF7;
 Wed, 24 Jun 2026 16:10:34 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=pr0CPx7D1Psn+An8dOZ4USTlG8NwBSCbnKlcH5YRRr8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ZX1Z2yiWk3+jA3B6dKV62GoRNQ55OTcYAWnWp/gBqTW/RHwptmF8iXJyP15ndjeCIDN/7Ndf3
 46Nl1YlyCRRJeUjcCCKNdj7vw8kX8OkzL1PZqQY5Go5NS7dPN+M9JuNhlJX/6yZuJSVLCQofGVY
 GsPt5+tCROhkxpTWoB5jYYBR8MdSMli8ifHPpKYZUEyUbIoXrJUipUUMY/LrHhqL77sPrzDy1ZU
 mO9j0ysb2kUB+JrMFndY1K1bkYfmEUHPU7BcLvhhJD+BTuG0EuS591iVsSpa/nSpTjTbMHZZmZr
 0tsFshemxM9/q53FZDceobPzUNrgXcVpYDz4E4xRDohw==
X-Zone-Loop: 5826f3218c9c91ae47ad8032721273db1f3e4a9eccd0
x-campaign-type: default
x-transaction-id: 7ddacf55-85ec-4a92-b0c2-ab53fb2b738e
x-swg-uid: 01-c28baca0-f1c6-402c-b7fe-e084d43271a9
X-Mailer: Sweego
Message-ID:
 <1782310235.8631fc262581453bbf619ec5b2062170.19ef9f7ec4e000701b@vates.tech>
x-swg-bid: 1782310235.8631fc262581453bbf619ec5b2062170.19ef9f7ec4e000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 24 Jun 2026 16:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstore-paths: Allow subnet prefix in IP address
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
 <6bd3cb66-5999-49e3-a387-c481669c24bd@vates.tech>
Content-Language: en-US
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
In-Reply-To: <6bd3cb66-5999-49e3-a387-c481669c24bd@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.375.9b1f48710838121e.19ef9f7ea3b.d13b27f2cb1979e1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782310234683
X-purgate-ID: tlsNG-bad1c0/1782310240-5579D986-A69CE448/0/0
X-purgate-type: clean
X-purgate-size: 4775
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ngoc-tu.dinh@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2DD06BEFAF

---=Part.375.9b1f48710838121e.19ef9f7ea3b.d13b27f2cb1979e1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24/06/2026 15:53, Teddy Astie wrote:
> Le 08/06/2026 =C3=A0 11:51, Tu Dinh a =C3=A9crit=C2=A0:
>> In the guest-reported IP address in xenstore, it's useful to know which
>> subnet it belongs to=2E
>>
>> Add a specification for the IPv6 host address/prefix format specified b=
y
>> RFC 4291=2E
>>
>> For the IPv4 address/prefix notation, as there seems to be no equivalen=
t
>> RFC specifying the host address/prefix format, specify it ourselves=2E
>>
>> Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>
>> ---
>> =C2=A0 docs/misc/xenstore-paths=2Epandoc | 12 ++++++------
>> =C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/docs/misc/xenstore-paths=2Epandoc b/docs/misc/xenstore-=20
>> paths=2Epandoc
>> index 4994194=2E=2E1fab3bf 100644
>> --- a/docs/misc/xenstore-paths=2Epandoc
>> +++ b/docs/misc/xenstore-paths=2Epandoc
>> @@ -78,12 +78,12 @@ VALUES are strings and can take the following forms=
:
>> =C2=A0 * MAC_ADDRESS -- 6 integers, in hexadecimal form, separated by '=
:',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specifying an IEEE 802=2E3 ethernet=
 MAC address=2E
>> -* IPV4_ADDRESS -- 4 integers, in decimal form, separated by '=2E',
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specifying an IP version 4 address as des=
cribed
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IETF RFC 791=2E
>> -* IPV6_ADDRESS -- Up to 8 integers, in hexadecimal form, separated
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by ':', specifying an IP version 6 addres=
s as
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 described in IETF RFC 4291=2E
>> +* IPV4_ADDRESS -- An IP version 4 address as specified by IETF RFC 791=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optionally appended with a "/prefix" valu=
e=20
>> representing the
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefix length of the host address's subne=
t, with=20
>> "prefix"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 being a decimal integer in the range of 0=
 to 32=2E
>> +* IPV6_ADDRESS -- An IP version 6 address or abbreviated "address/=20
>> prefix"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 combination as specified by IETF RFC 4291=
 and RFC=20
>> 5952=2E
>> =C2=A0 Additional TAGS may follow as a comma separated set of the follo=
wing
>> =C2=A0 tags enclosed in square brackets=2E
>=20
> I'm not convinced this is a good idea=2E This is technically a breaking=
=20
> change, as the proposed format now allows IPv4/subnet form, while the=20
> user of this info may not be aware and could fail to parse the IP=2E
>=20
> If we need to expose additional infos, I think it's preferable to either=
=20
> expose a alternative IP node with this new format or put the additional=
=20
> info in a separate node=2E
>=20

xenstore-paths=2Epandoc already states that "The values written are=20
primarily for display purposes and must not be used for packet filtering=
=20
or routing purposes"=2E I don't think any toolstack currently checks for=
=20
the field's content format (XAPI doesn't check, xl doesn't even know=20
about the field)=2E Given that guests can present just about any value to=
=20
this field, it has always been considered an untrusted field and=20
consumers must be able to accept unexpected formats=2E

The spec change also makes the network prefix optional, not mandatory=2E=
=20
It'd be up to the field consumers to add support for network prefixes=20
(or at least tolerate them) before rolling out the actual change=2E

Conversely, adding an alternative IP node requires the guest to report=20
at multiple places at once just to ensure backwards compatibility, and=20
makes treating the field itself more complex for the consumer=2E So I=20
don't see the benefit of mandating yet another field for this purpose=2E

> Teddy



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.375.9b1f48710838121e.19ef9f7ea3b.d13b27f2cb1979e1=---

