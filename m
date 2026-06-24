Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JMO1CIfhO2rAeggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:54:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788046BEDED
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:54:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=fFO7fwq0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1344993.1604005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcO3C-0004hd-Iy; Wed, 24 Jun 2026 13:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344993.1604005; Wed, 24 Jun 2026 13:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcO3C-0004fQ-FS; Wed, 24 Jun 2026 13:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1344993;
 Wed, 24 Jun 2026 13:53:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef9e88fe0000701b@swg.vates.tech>)
 id 1wcO3A-0004fH-8o
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:53:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcO39-002Yvi-0T
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:53:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef9e88fe0000701b@swg.vates.tech>)
 id 6a3be172-5cb7-0a2a0a5109dd-0a2a4502edfc-0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:53:54 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef9e88fe0000701b@swg.vates.tech>)
 id 6a3be172-5a27-0a2a45020019-b9ff1c1288ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:53:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ef9e88fe0000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 24 Jun 2026 13:53:48 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id C7DDB82DB3;
 Wed, 24 Jun 2026 15:53:47 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=KFGnajVnb/REO/MSGN0mI+FieRhi5Tp4WOL/4JiVQA0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=fFO7fwq0Lvrq8ot+e+N6U/2CP1hKq0GOXCstK+cP/paONEowe0cwlD/rFnc20b0QVwnvHWvup
 E3lhiEfXdAEwlWBQqhujWxcnI9jXCWmT+Yh01M/QbCVvrNIfDRucwmGEK19EPoXNrhrNlZFAqGh
 vBKIxKpuOANfXDQ/mb4yqFi/JksVebSQBzYmM5S8DYPQQVIfQEsBKyYZFj6EYJgWCKPJgSB6U2Q
 iqdNXph7lXxCOnWKyjkQO1bVct5wJXvkScijK0NM+UHaJXdxr0esTGxVKoIaWXTt6BnR318VZfs
 gjVYeSOADpvCfkWux7ccX5AOv4/hFuB/y/iNSx5e/0Aw==
X-Zone-Loop: e893d56769d22d54f6d3d217867c925fe9e3ae125905
x-campaign-type: default
x-transaction-id: f7559322-046b-4c97-9874-c247418b58fe
x-swg-uid: 01-553590b8-52bf-46c2-b02e-f1cbd86144cd
X-Mailer: Sweego
Message-ID:
 <1782309228.8631fc262581453bbf619ec5b2062170.19ef9e88fe0000701b@vates.tech>
x-swg-bid: 1782309228.8631fc262581453bbf619ec5b2062170.19ef9e88fe0000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 24 Jun 2026 15:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstore-paths: Allow subnet prefix in IP address
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 xsDNBGn5sK8BDACuzSrrTjpVf4ay06OYB6yY0J1PqKffihoNMtrQRZjAHxoAPC7LTBVHV/XO
 Zw5HJc+9R71z1JV+iYg6z3jPziGKzX8Fj3ZXlzJPmpf1PuETH3KdbvtJT4ny+OGntnJntUoR
 KRPhTirr6yNeBk/637O3CQXjtqFUPZnko8OI/o1yawIBhJJAWicutjkkUgd28Bh6HV9EIumH
 tCBgn5/1A/fpm9624MMgYLsA8qjC4XsoovQvFCaO8HEhvfzrrTZHjn/nPeB9SigxIxXW8YaT
 VqMdqul07o72m3eA2mf+LMu9a04FX/d4wbxBLtELm+1jIrbtyaFZEMOLv/haSiS/Lj3btJH/
 EoucejoZ5SH49ksmVAmKOLktOaTQ8b2gEvP7iaKiIiszCCtOSRohr+2GvDsDeLvVZnlR3I+S
 PhHar7TPKjFz0G3DPNolyjXywNqOAMpomSPi8lSwjAFsxOtQbcck/qRGRSNk4DAmH70pA+89
 MXfQXZ3qt1Q01B1+sU0I8xsAEQEAAc0kVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVz
 LnRlY2g+wsENBBMBCAA3FiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sK8FCQWjmoACGwME
 CwkIBwUVCAkKCwUWAgMBAAAKCRBmD6nRAsvP0ID6DACGOktArFbLKHNzuyOVCskwfUZPla6Z
 pd3GZ8r61SrAKePIr2BnpgPkd0hV3bSRkRLIrgjzR2NRCzfp0x0HfuhcYfAYPR46XHTvjaJE
 v99sT/vGUG1BZguYDOScSEpgSNaNlYum3RKZbMuROxdK8G+YHccJY8PvWSq2K2yiae2KGiAv
 1yjnZxug9/PtDfX8vQFUSg2w1ukRDf50wvDohN1zUQfFtofOP2xCRsDZiHAlQ0pF+aUjXQhP
 eP3IdpfWc8cyRLXF06Rk46YMYCytweGtGdHcqAfrVthl84129ZPN422k/voW0sm14gjYlGcT
 UwgnYlFRk2FLq0QeKEDcS0aj3o3EVAQCrayoGzi1pnlIKE3PRGUcUzjGVvzQ/po24gOjwba9
 Egr/Wmu3MQlx/7A8zT5QBzF/n+RYdLNQ0Eu6YnUwf0Z1uieqNaon+olyIRFiLb/hCZHO6ekN
 f5vrm2clHUbQAYaPQebknujoKBo6ZLHg0WM1gZS01Gz+aUpKsUfOwM0EafmwsAEMAKiQiZa3
 yQMmc/h3sDbfVHPSiBA4IMI/NAB7IotzPHq1GzCpsoVILAhF/INbWjxJ3DbVf+en3/FvdVZg
 2S38xtnth0njNdlVKpyxm054phKjbdoFDwaknWolS4hrddTmetSG5/52AjtmPFtlXAk0NmLv
 fJnW3seXVQbgM7sW/MNXPP5UKDpkGnLhnvej+GU0s3109sJeXT5ImVdphFs9cvyZyBT9t1Pb
 Rowv58EgV0zE4hbAeVkULAbxFV5b/ExTjjGVHoX7CVhWxvCiTqCUoXZRkUE9C3FnkzEFRkKb
 Yu6NCfiHfEyB3Xyg9hfdrRgjMRq907zCof+nDtWxGz1MSEuvTj1g9GZ049Bennqzjc/Q+0ov
 XoK4jm+Py0FiUGUaA6yhexficjH+kCR/xDbVnWrMhSLB4AuTBT9HjfZI6gk3uYLhoT8Pig4/
 eVtR2Q1wZIJsFToR6ofGuyECwFcs+PUXN7fmGRSiPXgjAr/zIUBdW0VWCE3OGPNqtRk2E5s6
 IQARAQABwsD8BBgBCAAmFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sLAFCQWjmoACGwwA
 CgkQZg+p0QLLz9DncQwAg76IehTemLIfrB8T9WIBZrI4kUV7G7a4rjiVoUiHYN5QwhnbZnsa
 JDlt+Ezoqy/510eo2bCSzvW5xXYPgyjcuOPwgQo1Qp764QxyX6rld2f2RcWkDuBHun55ZWXj
 by8o21ginPRwruBVYY5rVf3DV1iBu4NurUeHtyFk/dS0XTOQi2wVUb17sW/+ybCEokdVacZG
 zOqP/OmwHrF8ylXlXnhQq6e3r+J+T8fuoGJelm/CJiMwyP6cEWE8sxVqX/iqwjwUYkuOCpE+
 lOWSvdNHgoEkWR0RXBPQjnGmLKbfTl/QDXLk6NP2/r9uxm2HL6Ei3QJKSEdrp+XZaVnk/Off
 O485NOTKwGOxyWb006cTMh53xPkAJFQu4Tvdj+odsHz88jqw5wfPG0BYWx0I/FspYj7N9kZR
 8ULR9nX0LvpzJ/kB4NgHIUt8YtIL6ZSfM2dbF7fKzvx1UqFfvozJZwFzfEieJLXa4nlGgR6D
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xZqEQRgwwPfDqakIcWzTHsHS"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782309228017
X-purgate-ID: tlsNG-720697/1782309234-4D1027C5-F11CBE54/0/0
X-purgate-type: clean
X-purgate-size: 8203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ngoc-tu.dinh@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:email,vates.tech:mid,vates.tech:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 788046BEDED

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xZqEQRgwwPfDqakIcWzTHsHS
Content-Type: multipart/mixed; boundary="------------D0Hy00lEXwEXLq43dF3wpgpL";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <6bd3cb66-5999-49e3-a387-c481669c24bd@vates.tech>
Subject: Re: [PATCH] xenstore-paths: Allow subnet prefix in IP address
References: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
In-Reply-To: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>

--------------D0Hy00lEXwEXLq43dF3wpgpL
Content-Type: multipart/mixed; boundary="------------aI0KlAt4BkMevNKqBXKawlgQ"

--------------aI0KlAt4BkMevNKqBXKawlgQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDgvMDYvMjAyNiDDoCAxMTo1MSwgVHUgRGluaCBhIMOpY3JpdMKgOg0KPiBJbiB0aGUg
Z3Vlc3QtcmVwb3J0ZWQgSVAgYWRkcmVzcyBpbiB4ZW5zdG9yZSwgaXQncyB1c2VmdWwgdG8g
a25vdyB3aGljaA0KPiBzdWJuZXQgaXQgYmVsb25ncyB0by4NCj4gDQo+IEFkZCBhIHNwZWNp
ZmljYXRpb24gZm9yIHRoZSBJUHY2IGhvc3QgYWRkcmVzcy9wcmVmaXggZm9ybWF0IHNwZWNp
ZmllZCBieQ0KPiBSRkMgNDI5MS4NCj4gDQo+IEZvciB0aGUgSVB2NCBhZGRyZXNzL3ByZWZp
eCBub3RhdGlvbiwgYXMgdGhlcmUgc2VlbXMgdG8gYmUgbm8gZXF1aXZhbGVudA0KPiBSRkMg
c3BlY2lmeWluZyB0aGUgaG9zdCBhZGRyZXNzL3ByZWZpeCBmb3JtYXQsIHNwZWNpZnkgaXQg
b3Vyc2VsdmVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVHUgRGluaCA8bmdvYy10dS5kaW5o
QHZhdGVzLnRlY2g+DQo+IC0tLQ0KPiAgIGRvY3MvbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5k
b2MgfCAxMiArKysrKystLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW5z
dG9yZS1wYXRocy5wYW5kb2MgYi9kb2NzL21pc2MveGVuc3RvcmUtcGF0aHMucGFuZG9jDQo+
IGluZGV4IDQ5OTQxOTQuLjFmYWIzYmYgMTAwNjQ0DQo+IC0tLSBhL2RvY3MvbWlzYy94ZW5z
dG9yZS1wYXRocy5wYW5kb2MNCj4gKysrIGIvZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhzLnBh
bmRvYw0KPiBAQCAtNzgsMTIgKzc4LDEyIEBAIFZBTFVFUyBhcmUgc3RyaW5ncyBhbmQgY2Fu
IHRha2UgdGhlIGZvbGxvd2luZyBmb3JtczoNCj4gICANCj4gICAqIE1BQ19BRERSRVNTIC0t
IDYgaW50ZWdlcnMsIGluIGhleGFkZWNpbWFsIGZvcm0sIHNlcGFyYXRlZCBieSAnOicsDQo+
ICAgICAgICAgICAgICAgICAgICBzcGVjaWZ5aW5nIGFuIElFRUUgODAyLjMgZXRoZXJuZXQg
TUFDIGFkZHJlc3MuDQo+IC0qIElQVjRfQUREUkVTUyAtLSA0IGludGVnZXJzLCBpbiBkZWNp
bWFsIGZvcm0sIHNlcGFyYXRlZCBieSAnLicsDQo+IC0gICAgICAgICAgICAgICAgICBzcGVj
aWZ5aW5nIGFuIElQIHZlcnNpb24gNCBhZGRyZXNzIGFzIGRlc2NyaWJlZA0KPiAtICAgICAg
ICAgICAgICAgICAgSUVURiBSRkMgNzkxLg0KPiAtKiBJUFY2X0FERFJFU1MgLS0gVXAgdG8g
OCBpbnRlZ2VycywgaW4gaGV4YWRlY2ltYWwgZm9ybSwgc2VwYXJhdGVkDQo+IC0gICAgICAg
ICAgICAgICAgICBieSAnOicsIHNwZWNpZnlpbmcgYW4gSVAgdmVyc2lvbiA2IGFkZHJlc3Mg
YXMNCj4gLSAgICAgICAgICAgICAgICAgIGRlc2NyaWJlZCBpbiBJRVRGIFJGQyA0MjkxLg0K
PiArKiBJUFY0X0FERFJFU1MgLS0gQW4gSVAgdmVyc2lvbiA0IGFkZHJlc3MgYXMgc3BlY2lm
aWVkIGJ5IElFVEYgUkZDIDc5MSwNCj4gKyAgICAgICAgICAgICAgICAgIG9wdGlvbmFsbHkg
YXBwZW5kZWQgd2l0aCBhICIvcHJlZml4IiB2YWx1ZSByZXByZXNlbnRpbmcgdGhlDQo+ICsg
ICAgICAgICAgICAgICAgICBwcmVmaXggbGVuZ3RoIG9mIHRoZSBob3N0IGFkZHJlc3MncyBz
dWJuZXQsIHdpdGggInByZWZpeCINCj4gKyAgICAgICAgICAgICAgICAgIGJlaW5nIGEgZGVj
aW1hbCBpbnRlZ2VyIGluIHRoZSByYW5nZSBvZiAwIHRvIDMyLg0KPiArKiBJUFY2X0FERFJF
U1MgLS0gQW4gSVAgdmVyc2lvbiA2IGFkZHJlc3Mgb3IgYWJicmV2aWF0ZWQgImFkZHJlc3Mv
cHJlZml4Ig0KPiArICAgICAgICAgICAgICAgICAgY29tYmluYXRpb24gYXMgc3BlY2lmaWVk
IGJ5IElFVEYgUkZDIDQyOTEgYW5kIFJGQyA1OTUyLg0KPiAgIA0KPiAgIEFkZGl0aW9uYWwg
VEFHUyBtYXkgZm9sbG93IGFzIGEgY29tbWEgc2VwYXJhdGVkIHNldCBvZiB0aGUgZm9sbG93
aW5nDQo+ICAgdGFncyBlbmNsb3NlZCBpbiBzcXVhcmUgYnJhY2tldHMuDQoNCkknbSBub3Qg
Y29udmluY2VkIHRoaXMgaXMgYSBnb29kIGlkZWEuIFRoaXMgaXMgdGVjaG5pY2FsbHkgYSBi
cmVha2luZyANCmNoYW5nZSwgYXMgdGhlIHByb3Bvc2VkIGZvcm1hdCBub3cgYWxsb3dzIElQ
djQvc3VibmV0IGZvcm0sIHdoaWxlIHRoZSANCnVzZXIgb2YgdGhpcyBpbmZvIG1heSBub3Qg
YmUgYXdhcmUgYW5kIGNvdWxkIGZhaWwgdG8gcGFyc2UgdGhlIElQLg0KDQpJZiB3ZSBuZWVk
IHRvIGV4cG9zZSBhZGRpdGlvbmFsIGluZm9zLCBJIHRoaW5rIGl0J3MgcHJlZmVyYWJsZSB0
byBlaXRoZXIgDQpleHBvc2UgYSBhbHRlcm5hdGl2ZSBJUCBub2RlIHdpdGggdGhpcyBuZXcg
Zm9ybWF0IG9yIHB1dCB0aGUgYWRkaXRpb25hbCANCmluZm8gaW4gYSBzZXBhcmF0ZSBub2Rl
Lg0KDQpUZWRkeQ0K
--------------aI0KlAt4BkMevNKqBXKawlgQ
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------aI0KlAt4BkMevNKqBXKawlgQ--

--------------D0Hy00lEXwEXLq43dF3wpgpL--

--------------xZqEQRgwwPfDqakIcWzTHsHS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmo74WsFAwAAAAAACgkQZg+p0QLLz9CH
ogv/W7M/mYg8VmdjY/4zI2HpadPWabPrg6OzoRFVfVRTW8/TWG6bKJu9v3yk3Zl4YLQ1UPb21336
vBPXZCHggil9R+AmwrXAAIAWTKcTNFH0l5FO1UubU/RpqWeOEJ7HfE6xXkLtDGfsMXSurhs388fF
pxe7XQiz0A3xwwW8btbFYz3gvYyp/BPVVcTDMn3Zxx1mu/iMu/RrwjeqQUMbScX1ZgyThhaMPl26
+a/d0PpQMIuGddB7tNrsyZOnOhoMTWdvuO4xqrZUuF9HII5Tr5gVzY+dGFCRlJJQ8jtW14Ea7Y1P
5AkQhoKC8ts9vx7BKRDW8YgPiEJDlRT92wpPwyvw32y7FPE7Aay2ekDZxoOP7Vr7x9V9fiahrYKC
xmQnXx1ZNBmoemYi08ea+NALPi3htio0VTsjtJoRJEHL9AiDmdTnlXmYTlZkeky6E+wwjF8XSCkN
vPGBVdIeNRX+M1gr63I9MSX8Lg3zt69Sy9F2dkAb8cwXbvwGUKgBrusAlhj4
=Ocfg
-----END PGP SIGNATURE-----

--------------xZqEQRgwwPfDqakIcWzTHsHS--

