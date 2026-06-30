Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 47UXNkCEQ2piZwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:54:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C6B6E1D46
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:54:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=NImmzmRK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1348536.1606270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUEI-0005ku-Cl; Tue, 30 Jun 2026 08:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348536.1606270; Tue, 30 Jun 2026 08:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUEI-0005il-9g; Tue, 30 Jun 2026 08:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1348536;
 Tue, 30 Jun 2026 08:54:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b@swg.vates.tech>)
 id 1weUEF-0005if-N8
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 08:54:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weUEF-000ANT-3v
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:54:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b@swg.vates.tech>)
 id 6a438426-bab6-0a2a0a5309dd-0a2a450be958-20
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:54:02 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b@swg.vates.tech>)
 id 6a43842a-ac48-0a2a450b0019-b9ff1c129ca5-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:54:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f17bc2c48000701b.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 30 Jun 2026 08:53:55 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 15B8386AA7;
 Tue, 30 Jun 2026 10:53:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=y2QQiRraOZuETXNv9/4igqIDPjEHPJOEYMHQgOnq+mg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NImmzmRKP2NL13rbkNxB1uflnLLF6tLSv5bsXjZhtUJt/Ombzh1JCIcyQidQnv39/ynQ4Xl9Q
 nWjf4xaztjuAfygUMocexxVRHVYR3vppj5Vw4SFtdP1REr7OEpgEnjtxnYDsFwno+8RL7fEZFMe
 5ikHAxwX9n+zQV+ymfvZPaKic2GMP1yftSJRcUFO3qvU9FGfAeq6hPBSI4syz4+thXjLVqFrAye
 vfkYS0p/VCytfkg/B9krdHbbqGMFW6ghkKP/+JwCwTkIYhgx8pPI0sQ40BSl2drOk2A9bMAxLf8
 f7MbIHymQz4jiV+JTxuVAx3pEOXEAo6ik5LONJ5+fHEw==
X-Zone-Loop: 1bbb4e1db285619f1c4d3f843931f62ac4a58a253617
x-campaign-type: default
x-transaction-id: 70c1351f-a5d2-438d-9d57-a194e3985632
x-swg-uid: 01-f975c6ff-d34f-4152-bc13-a6f9ae659495
X-Mailer: Sweego
Message-ID:
 <1782809635.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b@vates.tech>
x-swg-bid: 1782809635.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 30 Jun 2026 10:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/18] PCI SBDF Refactoring
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@vates.tech>
 <3cb85058-ad02-4233-930a-a397fb67daa9@suse.com>
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
In-Reply-To: <3cb85058-ad02-4233-930a-a397fb67daa9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hwmnCxkQsMy377bFMlri9RdG"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782809635309
X-purgate-ID: tlsNG-42698a/1782809642-3A73A220-FB5F1BA7/0/0
X-purgate-type: clean
X-purgate-size: 7501
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,xen.org:url];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43C6B6E1D46

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hwmnCxkQsMy377bFMlri9RdG
Content-Type: multipart/mixed; boundary="------------qDqpdvMKLKAggeHLuoDmxgbK";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Message-ID: <ef669d1a-efa9-46b5-a6f2-e2fcf4b65f55@vates.tech>
Subject: Re: [PATCH v3 00/18] PCI SBDF Refactoring
References: <1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@vates.tech>
 <3cb85058-ad02-4233-930a-a397fb67daa9@suse.com>
In-Reply-To: <3cb85058-ad02-4233-930a-a397fb67daa9@suse.com>

--------------qDqpdvMKLKAggeHLuoDmxgbK
Content-Type: multipart/mixed; boundary="------------HVtYjKOt4yqAP1cIxdP70z60"

--------------HVtYjKOt4yqAP1cIxdP70z60
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMDYvMjAyNiDDoCAwODoxMiwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjkuMDYuMjAyNiAxOToyMSwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBUZWRkeSBBc3RpZSAo
MTgpOg0KPj4gICAgcGNpOiBVc2UgcGNpX3NiZGZfdCBpbiBwY2lfZGV2aWNlX2RldGVjdCgp
DQo+PiAgICBwY2k6IFVzZSBwY2lfc2JkZl90IGluIHBjaV9hZGRfZGV2aWNlKCkNCj4+ICAg
IHBjaTogVXNlIHBjaV9zYmRmX3QgaW4gcGNpX3ByZXBhcmVfbXNpeCgpDQo+PiAgICBwY2k6
IFVzZSBwY2lfc2JkZl90IGluIHBjaV9yZW1vdmVfZGV2aWNlKCkNCj4+ICAgIHBjaTogVXNl
IHBjaV9zYmRmX3QgaW4gcGNpX3JvX2RldmljZSgpDQo+PiAgICBwY2k6IFVzZSBwY2lfc2Jk
Zl90IGluIHBjaV9oaWRlX2RldmljZSgpDQo+PiAgICBwY2k6IFVzZSBwY2lfc2JkZl90IHBj
aV9jaGVja19kaXNhYmxlX2RldmljZSgpDQo+PiAgICBwY2k6IEludHJvZHVjZSBwYXJzZV9w
Y2lfc2JkZntfc2VnfSgpDQo+PiAgICBhbWQvaW9tbXU6IFBhcnNlIGludG8gcGNpX3NiZGZf
dCBkaXJlY3RseQ0KPj4gICAgdnRkOiBVc2UgcGNpX3NiZGZfdCBpbiBhY3BpX3BhcnNlX2Rl
dl9zY29wZSgpDQo+PiAgICBkcml2ZXJzL2NoYXIveGhjaTogUGFyc2UgaW50byBwY2lfc2Jk
Zl90IGRpcmVjdGx5DQo+PiAgICBuczE2NTUwOiBQYXJzZSBpbnRvIHBjaV9zYmRmX3QgZGly
ZWN0bHkNCj4+ICAgIHZ0ZDogUmVuYW1lIGFjcGlfaW9hcGljX3VuaXQuaW9hcGljLmluZm8g
dG8gYWNwaV9pb2FwaWNfdW5pdC5iZGYNCj4+ICAgIHBjaTogVXNlIHBjaV9zYmRmX3QgaW4g
X3NjYW5fcGNpX2RldmljZXMNCj4+ICAgIHBjaTogQWxsb3cgb21taXRpbmcgZnVuYyB3aGVu
IHBhcnNpbmcgd2l0aCBwYXJzZV9wY2lfc2JkZigpDQo+PiAgICBlaGNpLWRiZ3A6IFVzZSBw
Y2lfc2JkZl90IGluc3RlYWQgb2YgKGJ1cywgc2xvdCwgZnVuYykNCj4+ICAgIHBjaTogRHJv
cCBwYXJzZV9wY2lfc3BsaXR7X3NlZ30oKQ0KPj4gICAgUkZDOiBkb2NzOiBEb2N1bWVudCBz
dXBwb3J0IGZvciBQQ0kgc2VnbWVudCBpbiBkYmdwIGFuZCBjb21OIHBhcmFtZXRlcg0KPiAN
Cj4gSnVzdCB0byBtZW50aW9uIHRoYXQgeW91ciBwYXRjaGVzIHN0aWxsIGFycml2ZSBpbiBh
biBvZGQgd2F5IChzYW1lIGFzIHYyKS4gSW4NCj4gbXkgaW5ib3gsIHRoZSBjb3ZlciBsZXR0
ZXIgaXMgaXNvbGF0ZWQgd2hpbGUgdGhlIHBhdGNoZXMgdGhlbXNlbHZlcyBzaG93IGFzIGEN
Cj4gdGhyZWFkLiBPbiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAyNi0wNi90aHJlYWRzLmh0bWwNCj4gaXQncyBldmVuIHdvcnNlIC0gYWxsIHBh
dGNoZXMgc2hvdyB1cCBpbmRpdmlkdWFsbHkuDQo+IA0KPiBKYW4NCj4gDQoNCldlJ3JlIGF3
YXJlIG9mIHRoYXQsIGFuZCBob3BlZnVsbHkgdHJ5aW5nIHRvIGdldCBpdCBmaXhlZCBvbiBv
dXIgc2lkZSwgDQpidXQgaXQgZG9lc24ndCBzZWVtIHRoYXQgZWFzeS4gT3RoZXJ3aXNlLCBJ
IHdpbGwgZXZlbnR1YWxseSB0cnkgc29tZSANCndvcmthcm91bmRzIGlmIHRoZSBzaXR1YXRp
b24gZG9lc24ndCBpbXByb3ZlLg0KDQpsb3JlLmtlcm5lbC5vcmcgc2VlbXMgdG8gaGF2ZSBw
aWNrZWQgdGhlIHNlcmllcyBhIGJpdCBiZXR0ZXIgdGhvdWdoDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy94ZW4tZGV2ZWwvMTc4Mjc1MzgwOS44NjMxZmMyNjI1ODE0NTNiYmY2MTllYzVi
MjA2MjE3MC4xOWYxNDY4NTQwNTAwMDcwMWJAdmF0ZXMudGVjaC8NCg0KVGVkZHkNCg==
--------------HVtYjKOt4yqAP1cIxdP70z60
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------HVtYjKOt4yqAP1cIxdP70z60--

--------------qDqpdvMKLKAggeHLuoDmxgbK--

--------------hwmnCxkQsMy377bFMlri9RdG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpDhCIFAwAAAAAACgkQZg+p0QLLz9DT
EQwAicpZgrrk0w0iefCa6THlgBHhcrPvdguMK+8pniE7BLMLR2mpbzjaUJEwv5p352pSFo7IaHEp
AsZk98R934V52oPusp4Nw/3WK5o0eMwyZmJboa422KB8CVYWg1iKBiQwRrRLJhUNj5OTVFnjBnrD
wdgVuCfB/kzVB/AWdxtcE/f60NkgSeMBB++UakWufm6xLkQm9fxGrvJcnicjMkC5LyN/Vk17AurK
l4gqXViI9r+A7OKNuwpZfUKvrDJVcLlXMPxtsWqS4P46yDMWY5EGhZBN5CrP9wdK99brxPUOJtJJ
oII4Q/6l50c60W4O2YsF7KHMceoJrbHMEkGX70YhW57sjaTgg6wxdEHrr2HjI+TTyh1tkpfLRlO9
cSs2vKkbkVyRbmGcAZXEM+Zp5wWOnqQgPbOqjfEBUzrc6A2LiFf/bpVjINFXPJ7bSWiZs3BZAP5s
zHoCVDoPvbFSlYaZWA10bWJwPMjSvcD1/x/D9qTW7mSLLXb4P6cgqHJiVdPE
=iQ89
-----END PGP SIGNATURE-----

--------------hwmnCxkQsMy377bFMlri9RdG--

