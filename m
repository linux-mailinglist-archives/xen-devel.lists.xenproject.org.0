Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gh5LIEC7R2pueQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 15:38:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEF0702F1F
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 15:38:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=XCnGvjCD;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353396.1609328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfe5S-0000tv-3C; Fri, 03 Jul 2026 13:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353396.1609328; Fri, 03 Jul 2026 13:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfe5S-0000rR-07; Fri, 03 Jul 2026 13:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1353396;
 Fri, 03 Jul 2026 13:37:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f2833024000080a8@swg.vates.tech>)
 id 1wfe5Q-0000rL-Ct
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 13:37:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfe5P-009EC2-Q0
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 15:37:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f2833024000080a8@swg.vates.tech>)
 id 6a47bb1b-bab6-0a2a0a5309dd-0a2a450beb98-22
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:37:43 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f2833024000080a8@swg.vates.tech>)
 id 6a47bb27-ac48-0a2a450b0019-b9ff1c239d03-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:37:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f2833024000080a8.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 03 Jul 2026 13:37:39 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id A451F81C28;
 Fri,  3 Jul 2026 15:37:38 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=1n3YZFETxOsJfoHK6l3xelDjADhaX9JklcckDZjk4d8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=XCnGvjCDchGO7ZKV9Y8phvrpTyCVWKf2GjYoGSz08e9C6TgoJvf/WISWc5s4T94w51t4iBYs5
 XwNBOqycCNOmYGYhi2dVt/cOLLjzBnTGes1c6d7px0iC2NdU7uvkpsFNnA808fKav1JeMCGtNoh
 FElo4+tQwVk98rJO3sfS0UUTCZiS2kOU1QxQ7Wxypo6ZHA4hsNpgGkCpfGfmQfy7XSqcPIx5+7b
 /vjCkgLwQWBvg8oNUboL03kEhi5CRvkXvnaQaYRSfDenTF01h5ayxC61lw7i8jNLjmGhZOOb9ro
 dn/MoerKtP0urxKi4f0dCmu/3+ROAfmKMrYu7Tg6e11g==
X-Zone-Loop: 37c93c5ea6495444149334cade739c490a5ca6b9c555
x-campaign-type: default
x-transaction-id: 4fc35f1d-c934-418c-b421-c1125f076366
x-swg-uid: 01-c0c9f1b1-1563-4409-949d-07487259897a
X-Mailer: Sweego
Message-ID:
 <1783085859.8631fc262581453bbf619ec5b2062170.19f2833024000080a8@vates.tech>
x-swg-bid: 1783085859.8631fc262581453bbf619ec5b2062170.19f2833024000080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 3 Jul 2026 15:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22] x86/cpu-policy: set up host policy earlier
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
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
In-Reply-To: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rNHeVO3n5DbEEksqKdgM8wxX"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783085858816
X-purgate-ID: tlsNG-42698a/1783085863-A653B220-83AF77CE/0/0
X-purgate-type: clean
X-purgate-size: 10702
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.59 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,vates.tech:from_mime,vates.tech:dkim,vates.tech:mid];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,invisiblethingslab.com,gmail.com];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDEF0702F1F

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rNHeVO3n5DbEEksqKdgM8wxX
Content-Type: multipart/mixed; boundary="------------QK8rbwIujNhxSW0B5RvVCqkL";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-ID: <b32f0e93-93ee-4601-b0a9-a52b69c5a6cb@vates.tech>
Subject: Re: [PATCH v2 for-4.22] x86/cpu-policy: set up host policy earlier
References: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
In-Reply-To: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>

--------------QK8rbwIujNhxSW0B5RvVCqkL
Content-Type: multipart/mixed; boundary="------------nR83I3x2siQvkRtBsKTIqkEr"

--------------nR83I3x2siQvkRtBsKTIqkEr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDMvMDcvMjAyNiDDoCAwODoyOCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gSW4g
b3JkZXIgdG8gdXNlIGNwdV9oYXNfKiBleHBhbmRpbmcgdG8gaG9zdF9jcHVfcG9saWN5Lios
IHRoZSBob3N0IHBvbGljeQ0KPiBuZWVkcyBzZXR0aW5nIHVwIGFsb25nc2lkZSBib290X2Nw
dV9kYXRhLng4Nl9jYXBhYmlsaXR5W10uIEFycmFuZ2UgZm9yDQo+IHRoYXQgdG93YXJkcyB0
aGUgZW5kIG9mIGlkZW50aWZ5X2NwdSgpLiBUaGVuIG1ha2Ugc3VyZSAueDg2X2NhcGFiaWxp
dHlbXQ0KPiBhbmQgaG9zdCBwb2xpY3kgcmVtYWluIGluIHN5bmMgd2hlbiBzZXR1cF97Zm9y
Y2UsY2xlYXJ9X2NwdV9jYXAoKSBhcmUNCj4gdXNlZC4NCj4gDQo+IFJlbmFtZSB0aGUgZnVu
Y3Rpb24gbm93IGl0J3Mgbm8gbG9uZ2VyIHN0YXRpYy4NCj4gDQo+IEZpeGVzOiA4OTRiZDc2
MTc5MjQgKCJ4ODYvSW50ZWw6IHVzZSBob3N0IENQVSBwb2xpY3kgZm9yIEFSQVQgY2hlY2tp
bmciKQ0KPiBSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBUaGlzIHJlYWxseSB3YXMgcGFy
dCBvZiBvbmUgb2YgdGhlIFhTVEFURSBjbGVhbnVwIHBhdGNoZXMgYXQgdGhlIGhlYWQgb2YN
Cj4gdGhlIEFNWCBzZXJpZXMuIFRoaXMgZXhwbGFpbnMgdGhlIHNwZWNpZmljIHBsYWNlbWVu
dCBhaGVhZCBvZiB0aGUgY2FsbCB0bw0KPiB4c3RhdGVfaW5pdCgpKS4gTGlrZWx5IGFueXRo
aW5nIGZyb20gdGhlcmUgZG93bndhcmRzIHNob3VsZG4ndCByZWFsbHkNCj4gbGl2ZSBpbiBp
ZGVudGlmeV9jcHUoKSBhbnl3YXkuDQo+IC0tLQ0KPiB2MjogQ2FsbCBjYWxjdWxhdGVfaG9z
dF9jcHVfcG9saWN5KCkgZnJvbSBzZXR1cF97Zm9yY2UsY2xlYXJ9X2NwdV9jYXAoKQ0KPiAg
ICAgIGluc3RlYWQgb2YgZnJvbSBpbml0X2d1ZXN0X2NwdV9wb2xpY2llcygpLg0KPiANCj4g
LS0tIGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYw0KPiArKysgYi94ZW4vYXJjaC94ODYv
Y3B1L2NvbW1vbi5jDQo+IEBAIC02Niw4ICs2NiwxMCBAQCB2b2lkIF9faW5pdCBzZXR1cF9j
bGVhcl9jcHVfY2FwKHVuc2lnbmVkDQo+ICAgCV9fY2xlYXJfYml0KGNhcCwgYm9vdF9jcHVf
ZGF0YS54ODZfY2FwYWJpbGl0eSk7DQo+ICAgCWRmcyA9IHg4Nl9jcHVfcG9saWN5X2xvb2t1
cF9kZWVwX2RlcHMoY2FwKTsNCj4gICANCj4gLQlpZiAoIWRmcykNCj4gKwlpZiAoIWRmcykg
ew0KPiArCQljYWxjdWxhdGVfaG9zdF9jcHVfcG9saWN5KCk7DQo+ICAgCQlyZXR1cm47DQo+
ICsJfQ0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgRlNDQVBJTlRTOyArK2kpIHsNCj4g
ICAJCWNsZWFyZWRfY2Fwc1tpXSB8PSBkZnNbaV07DQo+IEBAIC03OCw2ICs4MCw4IEBAIHZv
aWQgX19pbml0IHNldHVwX2NsZWFyX2NwdV9jYXAodW5zaWduZWQNCj4gICAJCSAgICAgICBf
X2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCksDQo+ICAgCQkgICAgICAgaSwgZm9yY2VkX2Nh
cHNbaV0gJiBkZnNbaV0pOw0KPiAgIAl9DQo+ICsNCj4gKwljYWxjdWxhdGVfaG9zdF9jcHVf
cG9saWN5KCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHZvaWQgX19pbml0IHNldHVwX2ZvcmNlX2Nw
dV9jYXAodW5zaWduZWQgaW50IGNhcCkNCj4gQEAgLTkyLDYgKzk2LDggQEAgdm9pZCBfX2lu
aXQgc2V0dXBfZm9yY2VfY3B1X2NhcCh1bnNpZ25lZA0KPiAgIAl9DQo+ICAgDQo+ICAgCV9f
c2V0X2JpdChjYXAsIGJvb3RfY3B1X2RhdGEueDg2X2NhcGFiaWxpdHkpOw0KPiArDQo+ICsJ
Y2FsY3VsYXRlX2hvc3RfY3B1X3BvbGljeSgpOw0KPiAgIH0NCj4gICANCj4gICBib29sIF9f
aW5pdCBpc19mb3JjZWRfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQ0KPiBAQCAtNTg2LDYg
KzU5MCw4IEBAIHZvaWQgaWRlbnRpZnlfY3B1KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykNCj4g
ICAJfQ0KPiAgIA0KPiAgIAkvKiBOb3cgdGhlIGZlYXR1cmUgZmxhZ3MgYmV0dGVyIHJlZmxl
Y3QgYWN0dWFsIENQVSBmZWF0dXJlcyEgKi8NCj4gKwlpZiAoYyA9PSAmYm9vdF9jcHVfZGF0
YSkNCj4gKwkJY2FsY3VsYXRlX2hvc3RfY3B1X3BvbGljeSgpOw0KPiAgIA0KPiAgIAl4c3Rh
dGVfaW5pdChjKTsNCj4gICANCj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS1wb2xpY3kuYw0K
PiArKysgYi94ZW4vYXJjaC94ODYvY3B1LXBvbGljeS5jDQo+IEBAIC0zNTksMTEgKzM1OSwx
OCBAQCB2b2lkIGNhbGN1bGF0ZV9yYXdfY3B1X3BvbGljeSh2b2lkKQ0KPiAgICAgICAvKiBX
YXMgYWxyZWFkeSBhZGRlZCBieSBwcm9iZV9jcHVpZF9mYXVsdGluZygpICovDQo+ICAgfQ0K
PiAgIA0KPiAtc3RhdGljIHZvaWQgX19pbml0IGNhbGN1bGF0ZV9ob3N0X3BvbGljeSh2b2lk
KQ0KPiArdm9pZCBfX2luaXQgY2FsY3VsYXRlX2hvc3RfY3B1X3BvbGljeSh2b2lkKQ0KPiAg
IHsNCj4gICAgICAgc3RydWN0IGNwdV9wb2xpY3kgKnAgPSAmaG9zdF9jcHVfcG9saWN5Ow0K
PiAgICAgICB1bnNpZ25lZCBpbnQgbWF4X2V4dGRfbGVhZjsNCj4gICANCj4gKyAgICAvKg0K
PiArICAgICAqIEJhaWwgaWYgdGhlIHJhdyBwb2xpY3kgd2Fzbid0IHNldCB1cCB5ZXQuIEF0
IGxlYXN0IHJlY2FsY3VsYXRlX3hzdGF0ZSgpDQo+ICsgICAgICogY2FuJ3QgYmUgdXNlZCB5
ZXQgaW4gdGhhdCBjYXNlLg0KPiArICAgICAqLw0KPiArICAgIGlmICggIXJhd19jcHVfcG9s
aWN5LmJhc2ljLm1heF9sZWFmICkNCj4gKyAgICAgICAgcmV0dXJuOw0KPiArDQo+ICAgICAg
ICpwID0gcmF3X2NwdV9wb2xpY3k7DQo+ICAgDQo+ICAgICAgIHAtPmJhc2ljLm1heF9sZWFm
ID0NCj4gQEAgLTkwNCw4ICs5MTEsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY2FsY3VsYXRl
X2h2bV9kZWZfcG9sDQo+ICAgDQo+ICAgdm9pZCBfX2luaXQgaW5pdF9ndWVzdF9jcHVfcG9s
aWNpZXModm9pZCkNCj4gICB7DQo+IC0gICAgY2FsY3VsYXRlX2hvc3RfcG9saWN5KCk7DQo+
IC0NCj4gICAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19QVikgKQ0KPiAgICAgICB7DQo+
ICAgICAgICAgICBjYWxjdWxhdGVfcHZfbWF4X3BvbGljeSgpOw0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvaW5jbHVkZS9hc20vY3B1LXBvbGljeS5oDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9jcHUtcG9saWN5LmgNCj4gQEAgLTMwLDQgKzMwLDEwIEBAIHZvaWQgcmVj
YWxjdWxhdGVfY3B1aWRfcG9saWN5KHN0cnVjdCBkb20NCj4gICAgKi8NCj4gICB2b2lkIGNh
bGN1bGF0ZV9yYXdfY3B1X3BvbGljeSh2b2lkKTsNCj4gICANCj4gKy8qDQo+ICsgKiBDb2xs
ZWN0IHRoZSBob3N0IENQVSBwb2xpY3kuICBDYWxsZWQgYWZ0ZXIgY29sbGVjdGluZyBlbm91
Z2ggQ1BVSUQgb3V0cHV0LA0KPiArICogYW5kIGFnYWluIGFmdGVyIGFsbCBmZWF0dXJlIG92
ZXJyaWRlcyBoYXZlIGJlZW4gcHV0IGluIHBsYWNlLg0KPiArICovDQo+ICt2b2lkIGNhbGN1
bGF0ZV9ob3N0X2NwdV9wb2xpY3kodm9pZCk7DQo+ICsNCj4gICAjZW5kaWYgLyogWDg2X0NQ
VV9QT0xJQ1lfSCAqLw0KPiANCg0KVGhhdCBsb29rcyBxdWl0ZSBjb25mdXNpbmcuDQoNCkFz
IEkgdW5kZXJzdGFuZCBpdCwgKGlkZWFsbHkpIGhvc3QgQ1BVIHBvbGljeSAod2hpY2ggSSBz
dXBwb3NlLCBjb250YWlucyANCiJub24gc3ludGhldGljIiBjcHUgZmVhdHVyZXNldCkgaXMg
YWJvdXQgdGhlIENQVUlEIGluZm8gdGhhdCBYZW4gaXMgDQphbGxvd2VkIHRvIHNlZSBhbmQg
cmVseSBvbiwgd2hpbGUgInN5bnRoZXRpYyBDUFUgY2FwYWJpbGl0aWVzIiBpcyBtb3JlIA0K
YWJvdXQgWGVuIGRlY2lzaW9ucy4NCg0KSWYgImNwdSBmZWF0dXJlc2V0IGluZm8iIGFuZCAi
aG9zdCBjcHUgcG9saWN5IiBjYW4gZ2V0IG91dCBvZiBzeW5jLCB0aGVuIA0KcmVjYWxjdWxh
dGluZyBob3N0IGNwdSBwb2xpY3kgZWFjaCB0aW1lIHdlIG1ha2UgYSBtb2RpZmljYXRpb24g
b2YgdGhlIA0KY3B1IGZlYXR1cmVzZXQgc291bmRzIGxpa2UgYSBiYWQgaWRlYSwgYW5kIHdl
IHByb2JhYmx5IHNob3VsZCB0cnkgdG8gbm90IA0KZW5kIHVwIGluIHRoaXMgc2l0dWF0aW9u
IGluIHRoZSBmaXJzdCBwbGFjZSBieSBub3QgaGF2aW5nIGhvc3QgQ1BVIA0KcG9saWN5IGFu
ZCBmZWF0dXJlc2V0IGNvbXBldGluZyBvbiB3aGF0IGhhcmR3YXJlIGZlYXR1cmUgWGVuIHNo
b3VsZCByZWx5IG9uLg0KDQpUZWRkeQ0K
--------------nR83I3x2siQvkRtBsKTIqkEr
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------nR83I3x2siQvkRtBsKTIqkEr--

--------------QK8rbwIujNhxSW0B5RvVCqkL--

--------------rNHeVO3n5DbEEksqKdgM8wxX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpHuyIFAwAAAAAACgkQZg+p0QLLz9DH
9gwAj1DBC3g+ypP7sgNc/tzpiJqcdu9T8nWj/PYNPDAJ2O4SYXFAyFhN79ZlM72uF23+/cYeypcn
b7o+kqtPrE+fY1n88+VifLVuLbCn56AsXdJSMLpVHWZyCaUu9qern2VFXjX6gCzH721PaV6qYWSq
Ggn2t5gktXVnM6PbiDwLcCHQbh1N7iHSlmPdH84wSMgTdKhwAYItxEgf8TO3LNfL9FswqCRVhYco
dogmuX75vB6ihc8Cq6u6By8cEf0Hr9uG8XJDzLG891N4pyCZUoOjjqDk/bvPbCVa5fa1qEY5uJvv
Mtj3uvRNNIEtDCP3h42ph3zrMjkCrlKM334Z73TNEiCiiglp8ix58514axvXNn7D3U1OPOjuCmab
dfRtarZHieGoUx94mn0VPqKQcJt3XZkkKd6fV03CTnVrvlMr/4NXfQUrsdQQ8UOrJKXB4dqGD/3C
LKLalgXPR6rcI/7oWj2Uba2KVr3uA3+W2IShrHNDVtMIYRNVmaGs25eCNAgt
=m4c3
-----END PGP SIGNATURE-----

--------------rNHeVO3n5DbEEksqKdgM8wxX--

