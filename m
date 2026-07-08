Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m10NODGITmoKOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 19:26:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69E7292B9
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 19:26:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=XnqesQfc;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357263.1611737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whW1c-0000x7-0z; Wed, 08 Jul 2026 17:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357263.1611737; Wed, 08 Jul 2026 17:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whW1b-0000uN-TO; Wed, 08 Jul 2026 17:25:31 +0000
Received: by outflank-mailman (input) for mailman id 1357263;
 Wed, 08 Jul 2026 17:25:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f42c35785000edb5@swg.vates.tech>)
 id 1whW1a-0000uH-Tr
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 17:25:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whW1a-000ToB-7R
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 19:25:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f42c35785000edb5@swg.vates.tech>)
 id 6a4e87dc-e002-0a2a0a5209dd-0a2a4506b096-44
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 19:25:30 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f42c35785000edb5@swg.vates.tech>)
 id 6a4e8809-08de-0a2a45060019-b9ff1c22a7c1-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 19:25:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f42c35785000edb5.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 17:25:26 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5382D80F03;
 Wed,  8 Jul 2026 19:25:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=6Ko9NBZx4PsdGOu83A9E1p9noaUJLghb1MgJXu2hims=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=XnqesQfcjaRe8pP5dyNPT2PXXzW2WOhpWYxCZUeQNQTvU8qEFuYsXnzwEx/lGgpIC3UBzdG8z
 t9MhafCTxdPgDjUUVgKxTWpxhaP8OcjNB43tSXyS40lkBjsTK+8cNVd1sdivxtWFkXUygehHfKc
 aQRKQr51xRDZRsM9BaOo7GNMZsoH8PY1RuMu1eak+nX+XrkC83O5LmrmlZS2g0CgmsdqfCILftH
 Xjx22DEg71wNNx1LLDmVjyYsGXkAqQ+8NzgUnRtuii+yuIdU+8mLXi8y436c4AKHTxS+Jg59AHi
 8oNLKmhsiQgzNSLeX0VUCgrq91reABAqOEO4rshTW/Mg==
X-Zone-Loop: fba0efe7a5b5aca58351cc64949a6f6b75a39dcc7f4f
x-campaign-type: default
x-transaction-id: ae812844-1748-4495-8a1c-c3380d09da16
x-swg-uid: 01-63c4d92b-1a9a-4b29-9b0a-a8738bae09d5
X-Mailer: Sweego
Message-ID:
 <1783531526.8631fc262581453bbf619ec5b2062170.19f42c35785000edb5@vates.tech>
x-swg-bid: 1783531526.8631fc262581453bbf619ec5b2062170.19f42c35785000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 19:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XTF PATCH] XSA-475 PoC: Viridian Out-of-bounds
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <27f4bb5783a62a7322f2eb5504758392fe5faa83.1783530575.git.teddy.astie@vates.tech>
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
In-Reply-To: <27f4bb5783a62a7322f2eb5504758392fe5faa83.1783530575.git.teddy.astie@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VlNIE1PVV6bnfE1FnfYGSwFB"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783531525423
X-purgate-ID: tlsNG-16d1c6/1783531530-4233E68D-4C8ADB82/0/0
X-purgate-type: clean
X-purgate-size: 13089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:from_mime,vates.tech:email,vates.tech:mid,vates.tech:dkim,xen.org:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C69E7292B9

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VlNIE1PVV6bnfE1FnfYGSwFB
Content-Type: multipart/mixed; boundary="------------mJk9duNd4YpK9Xjqrs5Qe087";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ae965480-299c-4d24-b663-6f5bac58c02f@vates.tech>
Subject: Re: [XTF PATCH] XSA-475 PoC: Viridian Out-of-bounds
References: <27f4bb5783a62a7322f2eb5504758392fe5faa83.1783530575.git.teddy.astie@vates.tech>
In-Reply-To: <27f4bb5783a62a7322f2eb5504758392fe5faa83.1783530575.git.teddy.astie@vates.tech>

--------------mJk9duNd4YpK9Xjqrs5Qe087
Content-Type: multipart/mixed; boundary="------------0PYWaQNr3SNjGHYkKJZGcZkT"

--------------0PYWaQNr3SNjGHYkKJZGcZkT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDgvMDcvMjAyNiDDoCAxOToyMywgVGVkZHkgQXN0aWUgYSDDqWNyaXTCoDoNCj4gU2ln
bmVkLW9mZi1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQo+IC0t
LQ0KPiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4g
DQo+IFRlc3RlZCAoY3Jhc2hpbmcgWGVuKSBvbiBhIFhlbiBidWlsZCB3aXRoIHJldmVydGVk
IHBhdGNoICh0ZXN0ZWQgYm90aCBDVkVzKS4NCj4gDQo+ICAgZG9jcy9hbGwtdGVzdHMuZG94
ICAgICAgICAgfCAgIDEgKw0KPiAgIHRlc3RzL3hzYS00NzUvTWFrZWZpbGUgICAgIHwgIDEx
ICsrKysNCj4gICB0ZXN0cy94c2EtNDc1L2V4dHJhLmNmZy5pbiB8ICAgMSArDQo+ICAgdGVz
dHMveHNhLTQ3NS9tYWluLmMgICAgICAgfCAxMjQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTM3IGluc2VydGlvbnMoKykN
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMveHNhLTQ3NS9NYWtlZmlsZQ0KPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy94c2EtNDc1L2V4dHJhLmNmZy5pbg0KPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0ZXN0cy94c2EtNDc1L21haW4uYw0KPiANCj4gZGlmZiAtLWdpdCBh
L2RvY3MvYWxsLXRlc3RzLmRveCBiL2RvY3MvYWxsLXRlc3RzLmRveA0KPiBpbmRleCBmZjM4
NzQ3Li40NDFlYWY3IDEwMDY0NA0KPiAtLS0gYS9kb2NzL2FsbC10ZXN0cy5kb3gNCj4gKysr
IGIvZG9jcy9hbGwtdGVzdHMuZG94DQo+IEBAIC0xODUsNiArMTg1LDcgQEAgc3RhdGVzLg0K
PiAgIA0KPiAgIEBzdWJwYWdlIHRlc3QteHNhLTQ3Mi0zIC0gVmlyaWRpYW4gcmVmZXJlbmNl
IFRTQyBwYWdlIGxlYWsuDQo+ICAgDQo+ICtAc3VicGFnZSB0ZXN0LXhzYS00NzUgLSB4ODY6
IEluY29ycmVjdCBpbnB1dCBzYW5pdGlzYXRpb24gaW4gVmlyaWRpYW4gaHlwZXJjYWxscw0K
PiAgIA0KPiAgIEBzZWN0aW9uIGluZGV4LXV0aWxpdHkgVXRpbGl0aWVzDQo+ICAgDQo+IGRp
ZmYgLS1naXQgYS90ZXN0cy94c2EtNDc1L01ha2VmaWxlIGIvdGVzdHMveHNhLTQ3NS9NYWtl
ZmlsZQ0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi4zMWJkYjg0
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdGVzdHMveHNhLTQ3NS9NYWtlZmlsZQ0KPiBA
QCAtMCwwICsxLDExIEBADQo+ICtpbmNsdWRlICQoUk9PVCkvYnVpbGQvY29tbW9uLm1rDQo+
ICsNCj4gK05BTUUgICAgICA6PSB4c2EtNDc1DQo+ICtDQVRFR09SWSAgOj0geHNhDQo+ICtU
RVNULUVOVlMgOj0gaHZtNjQNCj4gKw0KPiArVEVTVC1FWFRSQS1DRkcgOj0gZXh0cmEuY2Zn
LmluDQo+ICsNCj4gK29iai1wZXJlbnYgKz0gbWFpbi5vDQo+ICsNCj4gK2luY2x1ZGUgJChS
T09UKS9idWlsZC9nZW4ubWsNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3hzYS00NzUvZXh0cmEu
Y2ZnLmluIGIvdGVzdHMveHNhLTQ3NS9leHRyYS5jZmcuaW4NCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uN2NhNWEyOA0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL3Rlc3RzL3hzYS00NzUvZXh0cmEuY2ZnLmluDQo+IEBAIC0wLDAgKzEgQEANCj4gK3Zp
cmlkaWFuID0gWyAiYmFzZSIgXQ0KPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUNCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL3hzYS00NzUvbWFpbi5jIGIvdGVzdHMveHNhLTQ3NS9tYWlu
LmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uY2ZkYWNhYg0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rlc3RzL3hzYS00NzUvbWFpbi5jDQo+IEBAIC0w
LDAgKzEsMTI0IEBADQo+ICsvKioNCj4gKyAqIEBmaWxlIHRlc3RzL3hzYS00NzUvbWFpbi5j
DQo+ICsgKiBAcmVmIHRlc3QteHNhLTQ3NQ0KPiArICoNCj4gKyAqIEBwYWdlIHRlc3QteHNh
LTQ3NSBYU0EtNDc1DQo+ICsgKg0KPiArICogQWR2aXNvcnk6IFtYU0EtNDc1XShodHRwczov
L3hlbmJpdHMueGVuLm9yZy94c2EvYWR2aXNvcnktNDc1Lmh0bWwpDQo+ICsgKg0KPiArICog
U29tZSBib3VuZHMgY2hlY2sgd2VyZSBtaXNzaW5nIGluIHZpcmlkaWFuIGh5cGVyY2FsbHMs
IGNhdXNpbmcgb3V0IG9mIGJvdW5kDQo+ICsgKiB3cml0ZXMgKENWRS0yMDI1LTU4MTQ3KSBv
ciBvcGVyYXRpbmcgb24gYSB3aWxkIHBvaW50ZXIgKENWRS0yMDI1LTU4MTQ4KS4NCj4gKyAq
IFdlIGNhbiB0cmlnZ2VyIGl0IGJ5IHRhcmdldHRpbmcgdkNQVXMgSUQgdGhhdCBhcmUgb3Zl
ciBIVk1fTUFYX1ZDUFVTLg0KPiArICoNCj4gKyAqIEBzZWUgdGVzdHMveHNhLTQ3NS9tYWlu
LmMNCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8eHRmLmg+DQo+ICsNCj4gK2NvbnN0IGNo
YXIgdGVzdF90aXRsZVtdID0gIlhTQS00NzUiOw0KPiArDQo+ICsjZGVmaW5lIEhWQ0FMTF9T
RU5EX0lQSSAweDAwMGINCj4gKw0KPiArI2RlZmluZSBIVkNBTExfRkxVU0hfVklSVFVBTF9B
RERSRVNTX1NQQUNFX0VYICAweDAwMTMNCj4gKyNkZWZpbmUgSFZDQUxMX0ZMVVNIX1ZJUlRV
QUxfQUREUkVTU19MSVNUX0VYICAgMHgwMDE0DQo+ICsjZGVmaW5lIEhWQ0FMTF9TRU5EX0lQ
SV9FWCAgICAgICAgICAgICAgICAgICAgIDB4MDAxNQ0KPiArDQo+ICtlbnVtIEhWX0dFTkVS
SUNfU0VUX0ZPUk1BVCB7DQo+ICsgICAgSFZfR0VORVJJQ19TRVRfU1BBUlNFXzRLLA0KPiAr
ICAgIEhWX0dFTkVSSUNfU0VUX0FMTCwNCj4gK307DQo+ICsNCj4gK3N0cnVjdCBodl92cHNl
dCB7DQo+ICsgICAgdWludDY0X3QgZm9ybWF0Ow0KPiArICAgIHVpbnQ2NF90IHZhbGlkX2Jh
bmtfbWFzazsNCj4gKyAgICB1aW50NjRfdCBiYW5rX2NvbnRlbnRzWzY0XTsNCj4gK307DQo+
ICsNCj4gK3N0YXRpYyB2b2lkIHRlc3Rfc2VuZF9pcGkodWludDY0X3QgdmNwdV9tYXNrKQ0K
PiArew0KPiArICAgIHN0cnVjdCB7DQo+ICsgICAgICAgIHVpbnQzMl90IHZlY3RvcjsNCj4g
KyAgICAgICAgdWludDhfdCB0YXJnZXRfdnRsOw0KPiArICAgICAgICB1aW50OF90IHJlc2Vy
dmVkX3plcm9bM107DQo+ICsgICAgICAgIHVpbnQ2NF90IHZjcHVfbWFzazsNCj4gKyAgICB9
IGlucHV0X3BhcmFtcyA9IHsgMCB9Ow0KPiArDQo+ICsgICAgaW5wdXRfcGFyYW1zLnZlY3Rv
ciA9IDB4RDA7DQo+ICsgICAgaW5wdXRfcGFyYW1zLnZjcHVfbWFzayA9IHZjcHVfbWFzayAm
IH4xOyAvKiBEb24ndCBzZWxmLWlwaSAqLw0KPiArDQo+ICsgICAgaWYgKHZlbmRvcl9pc19p
bnRlbCkNCj4gKyAgICAgICAgYXNtIHZvbGF0aWxlICgidm1jYWxsIiA6OiAiYSIoMHg4MDAw
MDAwMFUpLCAiYyIoSFZDQUxMX1NFTkRfSVBJKSwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiZCIoJmlucHV0X3BhcmFtcykgOiAibWVtb3J5Iik7DQo+ICsgICAg
ZWxzZSBpZiAodmVuZG9yX2lzX2FtZCkNCj4gKyAgICAgICAgYXNtIHZvbGF0aWxlICgidm1t
Y2FsbCIgOjogImEiKDB4ODAwMDAwMDBVKSwgImMiKEhWQ0FMTF9TRU5EX0lQSSksDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJkIigmaW5wdXRfcGFyYW1zKSA6
ICJtZW1vcnkiKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgdGVzdF9zZW5kX2lwaV9l
eChzdHJ1Y3QgaHZfdnBzZXQgc2V0KQ0KPiArew0KPiArICAgIGludCByZXQgPSAwOw0KPiAr
ICAgIHN0cnVjdCB7DQo+ICsgICAgICAgIHVpbnQ2NF90IGFkZHJlc3Nfc3BhY2U7DQo+ICsg
ICAgICAgIHVpbnQ2NF90IGZsYWdzOw0KPiArICAgICAgICBzdHJ1Y3QgaHZfdnBzZXQgc2V0
Ow0KPiArICAgIH0gaW5wdXRfcGFyYW1zOw0KPiArDQo+ICsgICAgaW5wdXRfcGFyYW1zLmFk
ZHJlc3Nfc3BhY2UgPSAwOw0KPiArICAgIGlucHV0X3BhcmFtcy5mbGFncyA9IDA7DQo+ICsg
ICAgaW5wdXRfcGFyYW1zLnNldCA9IHNldDsNCj4gKw0KPiArICAgIGlmICh2ZW5kb3JfaXNf
aW50ZWwpDQo+ICsgICAgICAgIGFzbSB2b2xhdGlsZSAoInZtY2FsbCIgOiAiPWEiKHJldCkg
OiAiYSIoMHg4MDAwMDAwMFUpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgImMiKEhWQ0FMTF9TRU5EX0lQSV9FWCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiZCIoJmlucHV0X3BhcmFtcykgOiAibWVtb3J5Iik7DQo+ICsgICAgZWxz
ZSBpZiAodmVuZG9yX2lzX2FtZCkNCj4gKyAgICAgICAgYXNtIHZvbGF0aWxlICgidm1tY2Fs
bCIgOiAiPWEiKHJldCkgOiAiYSIoMHg4MDAwMDAwMFUpLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJjIihIVkNBTExfU0VORF9JUElfRVgpLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJkIigmaW5wdXRfcGFyYW1zKSA6ICJtZW1v
cnkiKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgdGVzdF9mbHVzaF92YWRkcl9leChz
dHJ1Y3QgaHZfdnBzZXQgc2V0KQ0KPiArew0KPiArICAgIGludCByZXQgPSAwOw0KPiArICAg
IHN0cnVjdCB7DQo+ICsgICAgICAgIHVpbnQ2NF90IGFkZHJlc3Nfc3BhY2U7DQo+ICsgICAg
ICAgIHVpbnQ2NF90IGZsYWdzOw0KPiArICAgICAgICBzdHJ1Y3QgaHZfdnBzZXQgc2V0Ow0K
PiArICAgIH0gaW5wdXRfcGFyYW1zOw0KPiArDQo+ICsgICAgaW5wdXRfcGFyYW1zLmFkZHJl
c3Nfc3BhY2UgPSAwOw0KPiArICAgIGlucHV0X3BhcmFtcy5mbGFncyA9IDA7DQo+ICsgICAg
aW5wdXRfcGFyYW1zLnNldCA9IHNldDsNCj4gKw0KPiArICAgIGlmICh2ZW5kb3JfaXNfaW50
ZWwpDQo+ICsgICAgICAgIGFzbSB2b2xhdGlsZSAoInZtY2FsbCIgOiAiPWEiKHJldCkgOiAi
YSIoMHg4MDAwMDAwMFUpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ImMiKEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfU1BBQ0VfRVgpLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgImQiKCZpbnB1dF9wYXJhbXMpIDogIm1lbW9y
eSIpOw0KPiArICAgIGVsc2UgaWYgKHZlbmRvcl9pc19hbWQpDQo+ICsgICAgICAgIGFzbSB2
b2xhdGlsZSAoInZtbWNhbGwiIDogIj1hIihyZXQpIDogImEiKDB4ODAwMDAwMDBVKSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYyIoSFZDQUxMX0ZMVVNIX1ZJ
UlRVQUxfQUREUkVTU19TUEFDRV9FWCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgImQiKCZpbnB1dF9wYXJhbXMpIDogIm1lbW9yeSIpOw0KPiArICAgIH0NCj4g
Kw0KPiArdm9pZCB0ZXN0X21haW4odm9pZCkNCj4gK3sNCj4gKyAgICBzdHJ1Y3QgaHZfdnBz
ZXQgc2V0Ow0KPiArICAgIHNldC5mb3JtYXQgPSBIVl9HRU5FUklDX1NFVF9TUEFSU0VfNEs7
DQo+ICsNCj4gKyAgICBwcmludGsoIlRlc3QgSFZDQUxMX1NFTkRfSVBJIHRvIDY0IGZpcnN0
IENQVXMgKG5vbi1leGlzdGVudClcbiIpOw0KPiArICAgIHRlc3Rfc2VuZF9pcGkofjApOw0K
PiArDQo+ICsgICAgcHJpbnRrKCJUZXN0IEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1Nf
U1BBQ0VfRVggd2l0aCBhbGwgYmFua3Mgc2V0XG4iKTsNCj4gKyAgICBzZXQudmFsaWRfYmFu
a19tYXNrID0gfjA7DQo+ICsgICAgbWVtc2V0KHNldC5iYW5rX2NvbnRlbnRzLCAxLCBzaXpl
b2Yoc2V0LmJhbmtfY29udGVudHMpKTsNCj4gKyAgICB0ZXN0X2ZsdXNoX3ZhZGRyX2V4KHNl
dCk7DQo+ICsNCj4gKyAgICBwcmludGsoIlRlc3QgSFZDQUxMX0ZMVVNIX1ZJUlRVQUxfQURE
UkVTU19TUEFDRV9FWCB3aXRoIGFsbCBiYW5rcyBzZXQgKHNraXBwaW5nIHNlbGYpXG4iKTsN
Cg0KXg0KDQpUaGlzIGlzIHN1cHBvc2VkIHRvIGJlIEhWQ0FMTF9TRU5EX0lQSV9FWCBoZXJl
DQoNCj4gKyAgICBzZXQudmFsaWRfYmFua19tYXNrID0gfjA7DQo+ICsgICAgbWVtc2V0KHNl
dC5iYW5rX2NvbnRlbnRzLCAxLCBzaXplb2Yoc2V0LmJhbmtfY29udGVudHMpKTsNCj4gKyAg
ICBzZXQuYmFua19jb250ZW50c1swXSAmPSAxOyAvKiBkb24ndCBzZWxmLWlwaSAqLw0KPiAr
ICAgIHRlc3Rfc2VuZF9pcGlfZXgoc2V0KTsNCj4gKw0KPiArICAgIHh0Zl9zdWNjZXNzKCJT
dWNjZXNzOiBQcm9iYWJseSBub3QgdnVsbmVyYWJsZSB0byBYU0EtNDc1XG4iKTsNCj4gK30N
Cj4gKw0KDQo=
--------------0PYWaQNr3SNjGHYkKJZGcZkT
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------0PYWaQNr3SNjGHYkKJZGcZkT--

--------------mJk9duNd4YpK9Xjqrs5Qe087--

--------------VlNIE1PVV6bnfE1FnfYGSwFB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpOiAQFAwAAAAAACgkQZg+p0QLLz9Cr
vgv8CkMX/ujLmp061dZRwXmKQTBjXQ12HLHkoPfcek6nlIpJfyXinvZz1DF78BjNjncYcyur2yUf
lhf5F17tsCBzEnBz9G4gjONOzPZruDWAy07q6zqfizkFDGTXj0BB0AwhAnn2KGomVRfbgNW/9eIn
vCMgEkt/QEGJZ63zsP6n0KxkKW/8MKop27CeJJXgE01l4XrLvrogpjqNRWz1x0aLny6HyZ0tgpPI
6kXMm0CapnskfO58pULTiUClu/gXkICrjCAE/1Uwusqsf77bkNDGz/VrYT7jhpYndfA2NX6HTyWF
8snn6PAAPkswVi0Hi9uyocM5OZoVze/pVQ1TLCdK2oas/Z+J/+vehGL/mdikQ/SY+tIRZYT2Neor
iVhGblZ9sWjI+FuJrN5LmT19YXFx3oMSQuFFYe2vqSdeJjIdPpA8J2EL8X5tGbnksChEskkjQYrS
Z1oUfMJFwGS0i8Hq6BfH+K/s73K5rtrZprNCuBeFtE4cClLvLsc746WcYA1X
=/39D
-----END PGP SIGNATURE-----

--------------VlNIE1PVV6bnfE1FnfYGSwFB--

