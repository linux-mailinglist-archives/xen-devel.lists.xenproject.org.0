Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z9GWBLUdMWpobwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:56:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B1068DC3D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:56:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Won6GrzI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1338978.1600075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQWE-0004jY-9I; Tue, 16 Jun 2026 09:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338978.1600075; Tue, 16 Jun 2026 09:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQWE-0004hc-68; Tue, 16 Jun 2026 09:55:42 +0000
Received: by outflank-mailman (input) for mailman id 1338978;
 Tue, 16 Jun 2026 09:55:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecfdb9b7d000701b@swg.vates.tech>)
 id 1wZQWD-0004gR-GF
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:55:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQWC-00G8i1-DZ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:55:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecfdb9b7d000701b@swg.vates.tech>)
 id 6a311d8b-2eae-0a2a0a5409dd-0a2a4507be1c-36
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:55:40 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecfdb9b7d000701b@swg.vates.tech>)
 id 6a311d9c-229c-0a2a45070019-b9ff1c1296fb-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:55:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ecfdb9b7d000701b.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Jun 2026 09:55:36 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id A772986570;
 Tue, 16 Jun 2026 11:55:35 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=DRaCbEi9RDImnrJhXMid53D/I8ueZqhZWIMUZwS6ZDY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Won6GrzIlkFQROPBYj8K1QtC3Te0JOT168K67Hu76u8lWSmmSfqpuB0rnA2La/2yehQ04U9Ea
 ze1Q/EAdF8Wdt4rYtiZezPEXubj7JDasy7qFaw54fLjcfvu8V1F8ROckOKntcWUUGtxPuPjNWaP
 WpOw9hb9uCN+4n12ebxkNzn2veNNpvgMuoYrf49EHK6GQyFMD8IyQ2Kiat+E2TGtrcrB4Q2R0FU
 ob/H6L70PipYV80l+Rp26PBBPu8cNoyw2ICQ7LSQYOjN1OTEmBLlaHgs/bQVgENfOI9e5MUGf+i
 LbJS7rqKdRn6IGf4vFNLrGW1MpyVlCGQYqp/CB+1glMA==
X-Zone-Loop: e1c25fd78962bc1547fa946927bc92a28f71fc6e3794
x-campaign-type: default
x-transaction-id: 0a56fad7-2293-409e-8a77-ebc961904113
x-swg-uid: 01-430f55a8-9894-4f16-8af8-b78b57285057
X-Mailer: Sweego
Message-ID:
 <1781603736.8631fc262581453bbf619ec5b2062170.19ecfdb9b7d000701b@vates.tech>
x-swg-bid: 1781603736.8631fc262581453bbf619ec5b2062170.19ecfdb9b7d000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 16 Jun 2026 11:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] lib: make safe_copy_string_from_guest() validate
 input
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>
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
In-Reply-To: <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7x0Un0WrRta0V06v7ou004O1"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781603735917
X-purgate-ID: tlsNG-ef75cf/1781603740-08961C48-2FFAB548/0/0
X-purgate-type: clean
X-purgate-size: 11490
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.59 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:from_mime];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,apertussolutions.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48B1068DC3D

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7x0Un0WrRta0V06v7ou004O1
Content-Type: multipart/mixed; boundary="------------ZK2ybu0YmKhbALu031yQbiQL";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-ID: <6c4855ac-5a13-4234-8757-c0e10e9bd366@vates.tech>
Subject: Re: [PATCH 4/4] lib: make safe_copy_string_from_guest() validate
 input
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>
In-Reply-To: <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>

--------------ZK2ybu0YmKhbALu031yQbiQL
Content-Type: multipart/mixed; boundary="------------BnZOf9bMl63xyDAkBVQesUHE"

--------------BnZOf9bMl63xyDAkBVQesUHE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTYvMDYvMjAyNiDDoCAxMTowNSwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gLi4u
IHJhdGhlciB0aGFuIHBhcGVyaW5nIG92ZXIgZ3Vlc3QgZmxhd3M6IFN0cmluZ3MgcGFzc2Vk
IG91Z2h0IHRvIGJlIG51bC0NCj4gdGVybWluYXRlZCAoeWV0IHNhZGx5IGxpYnhjIGhhc24n
dCBiZWVuIGRvaW5nIHNvIHRodXMgZmFyKS4gVGhpcyB3YXkgd2UNCj4gYWxzbyBhdm9pZCBv
cmRlci0xIGFsbG9jYXRpb25zLCBzZWVpbmcgdGhhdCBhbGwgcHJlc2VudCBjYWxsZXJzIHBh
c3MNCj4gUEFHRV9TSVpFIGZvciBtYXhfc2l6ZS4NCj4gDQoNCkknbSBub3Qgc3VyZSB0byBm
dWxseSB1bmRlcnN0YW5kIHRoZSBjb21taXQgbWVzc2FnZSwgaXMgaXQgbW9yZSBhYm91dCAN
CnBvc3NpYmxlIFBBR0VfU0laRSsxIGFsbG9jYXRpb25zIChoZW5jZSAyIHBhZ2VzIHJlcXVp
cmVkKSBvciBzb21ldGhpbmcgDQplbHNlID8NCg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBJIGNhbid0IHNwb3QgYW55IGNh
bGxlciBzaWRlIHVzZSBvZiBGTEFTS19ERVZJQ0VUUkVFX0xBQkVMLCBoZW5jZSB0aGVyZSdz
DQo+IG5vIGNvcnJlc3BvbmRpbmcgcHJlcmVxIHBhdGNoLg0KPiANCj4gLS0tIGEvQ0hBTkdF
TE9HLm1kDQo+ICsrKyBiL0NIQU5HRUxPRy5tZA0KPiBAQCAtMTEsNiArMTEsOCBAQCBUaGUg
Zm9ybWF0IGlzIGJhc2VkIG9uIFtLZWVwIGEgQ2hhbmdlbG9nDQo+ICAgICAgdG8gb2J0YWlu
IGFuIGF1dG9tYXRpY2FsbHkgYWxsb2NhdGVkIGRvbWlkLiAgVGhlIHByaW9yIHNlbnRpbmVs
IHZhbHVlcyAoMA0KPiAgICAgIHNpbmNlIHRoZSBzdGFydCBvZiBYZW4sIGFuZCBET01JRF9J
TlZBTElEIHNpbmNlIFhlbiA0LjIxKSBub3cgbm8gbG9uZ2VyDQo+ICAgICAgcmVwcmVzZW50
IGEgd2lsZGNhcmQgaW5wdXQuDQo+ICsgLSBYRU5fRE9NQ1RMX0RFVl9EVCdzLCBGTEFTS19b
R1NdRVRCT09MJ3MsIGFuZCBGTEFTS19ERVZJQ0VUUkVFX0xBQkVMJ3MgaW5wdXQNCj4gKyAg
IHN0cmluZyBzaXplcyBuZWVkIHRvIGluY2x1ZGUgdGhlIG51bCB0ZXJtaW5hdG9yLg0KPiAg
ICAtIE9uIHg4NjoNCj4gICAgICAtIEVuYWJsZSBwZi1maXh1cCBvcHRpb24gYnkgZGVmYXVs
dCBmb3IgUFZIIGRvbTAuDQo+ICAgICAgLSBUaGUgbGlieGVuZ3Vlc3QgYnpJbWFnZSBsb2Fk
ZXIgbm93IHVzZXMgdGhlIHN5c3RlbSBsaWJsejQgbGlicmFyeS4NCj4gLS0tIGEveGVuL2xp
Yi9ndWVzdC1zdHJjcHkuYw0KPiArKysgYi94ZW4vbGliL2d1ZXN0LXN0cmNweS5jDQo+IEBA
IC0zLDggKzMsOCBAQA0KPiAgICNpbmNsdWRlIDx4ZW4vZXJyLmg+DQo+ICAgDQo+ICAgLyoN
Cj4gLSAqIFRoZSBmdW5jdGlvbiBjb3BpZXMgYSBzdHJpbmcgZnJvbSB0aGUgZ3Vlc3QgYW5k
IGFkZHMgYSBOVUwgdG8NCj4gLSAqIG1ha2Ugc3VyZSB0aGUgc3RyaW5nIGlzIGNvcnJlY3Rs
eSB0ZXJtaW5hdGVkLg0KPiArICogVGhlIGZ1bmN0aW9uIGNvcGllcyBhIHN0cmluZyBmcm9t
IHRoZSBndWVzdCBhbmQgY2hlY2tzIHRoZXJlJ3MgYSBOVUwNCj4gKyAqIHRlcm1pbmF0aW5n
IHRoZSBzdHJpbmcuDQo+ICAgICovDQo+ICAgY2hhciAqc2FmZV9jb3B5X3N0cmluZ19mcm9t
X2d1ZXN0KFhFTl9HVUVTVF9IQU5ETEUoY2hhcikgdV9idWYsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBzaXplLCBzaXplX3QgbWF4X3NpemUpDQo+
IEBAIC0xNCw4ICsxNCw3IEBAIGNoYXIgKnNhZmVfY29weV9zdHJpbmdfZnJvbV9ndWVzdChY
RU5fR1UNCj4gICAgICAgaWYgKCBzaXplID4gbWF4X3NpemUgKQ0KPiAgICAgICAgICAgcmV0
dXJuIEVSUl9QVFIoLUVOT0JVRlMpOw0KPiAgIA0KPiAtICAgIC8qIEFkZCBhbiBleHRyYSAr
MSB0byBhcHBlbmQgXDAgKi8NCj4gLSAgICB0bXAgPSB4bWFsbG9jX2FycmF5KGNoYXIsIHNp
emUgKyAxKTsNCj4gKyAgICB0bXAgPSB4bWFsbG9jX2FycmF5KGNoYXIsIHNpemUpOw0KPiAg
ICAgICBpZiAoICF0bXAgKQ0KPiAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7
DQo+ICAgDQo+IEBAIC0yNCw3ICsyMywxMiBAQCBjaGFyICpzYWZlX2NvcHlfc3RyaW5nX2Zy
b21fZ3Vlc3QoWEVOX0dVDQo+ICAgICAgICAgICB4ZnJlZSh0bXApOw0KPiAgICAgICAgICAg
cmV0dXJuIEVSUl9QVFIoLUVGQVVMVCk7DQo+ICAgICAgIH0NCj4gLSAgICB0bXBbc2l6ZV0g
PSAnXDAnOw0KPiArDQo+ICsgICAgaWYgKCAhbWVtY2hyKHRtcCwgMCwgc2l6ZSkgKQ0KPiAr
ICAgIHsNCj4gKyAgICAgICAgeGZyZWUodG1wKTsNCj4gKyAgICAgICAgcmV0dXJuIEVSUl9Q
VFIoLUVNU0dTSVpFKTsNCj4gKyAgICB9DQoNCkVNU0dTSVpFIGZlZWxzIGEgYml0IG9kZCBh
cyB0aGUgaXNzdWUgaGVyZSBpcyB0aGF0IHRoZXJlIGlzIG5vIE5VTCANCnRlcm1pbmF0b3Ig
cmF0aGVyIHRoYW4gdGhlIG1lc3NhZ2UgYmVpbmcgdG9vIGxhcmdlLg0KDQpXaGF0IGFib3V0
IEVJTFNFUSBhcyB3ZSBlbmNvdW50ZXJlZCBhIG1hbGZvcm1lZCBzdHJpbmcgPw0KDQo+ICAg
DQo+ICAgICAgIHJldHVybiB0bXA7DQo+ICAgfQ0KPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJs
aWMvZG9tY3RsLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+IEBA
IC01NzQsNyArNTc0LDcgQEAgc3RydWN0IHhlbl9kb21jdGxfYXNzaWduX2RldmljZSB7DQo+
ICAgICAgICAgICAgICAgdWludDMyX3QgbWFjaGluZV9zYmRmOyAgIC8qIG1hY2hpbmUgUENJ
IElEIG9mIGFzc2lnbmVkIGRldmljZSAqLw0KPiAgICAgICAgICAgfSBwY2k7DQo+ICAgICAg
ICAgICBzdHJ1Y3Qgew0KPiAtICAgICAgICAgICAgdWludDMyX3Qgc2l6ZTsgLyogTGVuZ3Ro
IG9mIHRoZSBwYXRoICovDQo+ICsgICAgICAgICAgICB1aW50MzJfdCBzaXplOyAvKiBMZW5n
dGggb2YgdGhlIHBhdGgsIGluY2x1ZGluZyBudWwgdGVybWluYXRvciAqLw0KPiAgICAgICAg
ICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQoY2hhcikgcGF0aDsgLyogUGF0aCB0byB0aGUg
ZGV2aWNlIHRyZWUgbm9kZSAqLw0KPiAgICNpZmRlZiBfX1hFTl9fDQo+ICAgICAgICAgICAg
ICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXY7IC8qIFJlc29sdmVkIGRldmljZSBub2Rl
IG9mIHRoZSBhYm92ZSAqLw0KPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMveHNtL2ZsYXNr
X29wLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3hzbS9mbGFza19vcC5oDQo+IEBA
IC0yNiw3ICsyNiw4IEBAIHR5cGVkZWYgc3RydWN0IHhlbl9mbGFza19zZXRlbmZvcmNlIHhl
bl8NCj4gICBzdHJ1Y3QgeGVuX2ZsYXNrX3NpZF9jb250ZXh0IHsNCj4gICAgICAgLyogSU4v
T1VUOiBzaWQgdG8gY29udmVydCB0by9mcm9tIHN0cmluZyAqLw0KPiAgICAgICB1aW50MzJf
dCBzaWQ7DQo+IC0gICAgLyogSU46IHNpemUgb2YgdGhlIGNvbnRleHQgYnVmZmVyDQo+ICsg
ICAgLyoNCj4gKyAgICAgKiBJTjogc2l6ZSBvZiB0aGUgY29udGV4dCBidWZmZXIsIGluY2x1
ZGluZyBudWwgdGVybWluYXRvcg0KPiAgICAgICAgKiBPVVQ6IGFjdHVhbCBzaXplIG9mIHRo
ZSBvdXRwdXQgY29udGV4dCBzdHJpbmcNCj4gICAgICAgICovDQo+ICAgICAgIHVpbnQzMl90
IHNpemU7DQo+IEBAIC04Niw4ICs4NywxMSBAQCBzdHJ1Y3QgeGVuX2ZsYXNrX2Jvb2xlYW4g
ew0KPiAgICAgICB1aW50OF90IG5ld192YWx1ZTsNCj4gICAgICAgLyogSU46IGNvbW1pdCBu
ZXcgdmFsdWUgaW5zdGVhZCBvZiBvbmx5IHNldHRpbmcgcGVuZGluZyBbU0VUXSAqLw0KPiAg
ICAgICB1aW50OF90IGNvbW1pdDsNCj4gLSAgICAvKiBJTjogc2l6ZSBvZiBib29sZWFuIG5h
bWUgYnVmZmVyIFtHRVQvU0VUXQ0KPiAtICAgICAqIE9VVDogYWN0dWFsIHNpemUgb2YgbmFt
ZSBbR0VUIG9ubHldICovDQo+ICsgICAgLyoNCj4gKyAgICAgKiBJTjogc2l6ZSBvZiBib29s
ZWFuIG5hbWUgYnVmZmVyIFtHRVQvU0VUXTsgbXVzdCBjb3ZlciBudWwgdGVybWluYXRvcg0K
PiArICAgICAqICAgICBpZiAibmFtZSIgKGJlbG93KSBpcyBhbiBpbnB1dA0KPiArICAgICAq
IE9VVDogYWN0dWFsIHNpemUgb2YgbmFtZSBbR0VUIG9ubHldDQo+ICsgICAgICovDQo+ICAg
ICAgIHVpbnQzMl90IHNpemU7DQo+ICAgICAgIC8qIElOOiBpZiBib29sX2lkIGlzIC0xLCB1
c2VkIHRvIGZpbmQgYm9vbGVhbiBbR0VUL1NFVF0NCj4gICAgICAgICogT1VUOiB0ZXh0dWFs
IG5hbWUgb2YgYm9vbGVhbiBbR0VUIG9ubHldDQo+IEBAIC0xNTAsNyArMTU0LDcgQEAgdHlw
ZWRlZiBzdHJ1Y3QgeGVuX2ZsYXNrX3JlbGFiZWwgeGVuX2ZsYQ0KPiAgIHN0cnVjdCB4ZW5f
Zmxhc2tfZGV2aWNldHJlZV9sYWJlbCB7DQo+ICAgICAgIC8qIElOICovDQo+ICAgICAgIHVp
bnQzMl90IHNpZDsNCj4gLSAgICB1aW50MzJfdCBsZW5ndGg7DQo+ICsgICAgdWludDMyX3Qg
bGVuZ3RoOyAvKiBsZW5ndGggb2YgdGhlIHBhdGgsIGluY2x1ZGluZyBudWwgdGVybWluYXRv
ciAqLw0KPiAgICAgICBYRU5fR1VFU1RfSEFORExFKGNoYXIpIHBhdGg7DQo+ICAgfTsNCj4g
ICB0eXBlZGVmIHN0cnVjdCB4ZW5fZmxhc2tfZGV2aWNldHJlZV9sYWJlbCB4ZW5fZmxhc2tf
ZGV2aWNldHJlZV9sYWJlbF90Ow0KPiANCj4gDQoNClRoZSByZXN0IGxvb2tzIGdvb2QgdG8g
bWUuDQoNClRlZGR5DQo=
--------------BnZOf9bMl63xyDAkBVQesUHE
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDNBGn5sK8BDACuzSrrTjpVf4ay06OYB6yY0J1PqKffihoNMtrQRZjAHxoAPC7L
TBVHV/XOZw5HJc+9R71z1JV+iYg6z3jPziGKzX8Fj3ZXlzJPmpf1PuETH3KdbvtJ
T4ny+OGntnJntUoRKRPhTirr6yNeBk/637O3CQXjtqFUPZnko8OI/o1yawIBhJJA
WicutjkkUgd28Bh6HV9EIumHtCBgn5/1A/fpm9624MMgYLsA8qjC4XsoovQvFCaO
8HEhvfzrrTZHjn/nPeB9SigxIxXW8YaTVqMdqul07o72m3eA2mf+LMu9a04FX/d4
wbxBLtELm+1jIrbtyaFZEMOLv/haSiS/Lj3btJH/EoucejoZ5SH49ksmVAmKOLkt
OaTQ8b2gEvP7iaKiIiszCCtOSRohr+2GvDsDeLvVZnlR3I+SPhHar7TPKjFz0G3D
PNolyjXywNqOAMpomSPi8lSwjAFsxOtQbcck/qRGRSNk4DAmH70pA+89MXfQXZ3q
t1Q01B1+sU0I8xsAEQEAAc0kVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVz
LnRlY2g+wsENBBMBCAA3FiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sK8FCQWj
moACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRBmD6nRAsvP0ID6DACGOktArFbLKHNz
uyOVCskwfUZPla6Zpd3GZ8r61SrAKePIr2BnpgPkd0hV3bSRkRLIrgjzR2NRCzfp
0x0HfuhcYfAYPR46XHTvjaJEv99sT/vGUG1BZguYDOScSEpgSNaNlYum3RKZbMuR
OxdK8G+YHccJY8PvWSq2K2yiae2KGiAv1yjnZxug9/PtDfX8vQFUSg2w1ukRDf50
wvDohN1zUQfFtofOP2xCRsDZiHAlQ0pF+aUjXQhPeP3IdpfWc8cyRLXF06Rk46YM
YCytweGtGdHcqAfrVthl84129ZPN422k/voW0sm14gjYlGcTUwgnYlFRk2FLq0Qe
KEDcS0aj3o3EVAQCrayoGzi1pnlIKE3PRGUcUzjGVvzQ/po24gOjwba9Egr/Wmu3
MQlx/7A8zT5QBzF/n+RYdLNQ0Eu6YnUwf0Z1uieqNaon+olyIRFiLb/hCZHO6ekN
f5vrm2clHUbQAYaPQebknujoKBo6ZLHg0WM1gZS01Gz+aUpKsUfOwM0EafmwsAEM
AKiQiZa3yQMmc/h3sDbfVHPSiBA4IMI/NAB7IotzPHq1GzCpsoVILAhF/INbWjxJ
3DbVf+en3/FvdVZg2S38xtnth0njNdlVKpyxm054phKjbdoFDwaknWolS4hrddTm
etSG5/52AjtmPFtlXAk0NmLvfJnW3seXVQbgM7sW/MNXPP5UKDpkGnLhnvej+GU0
s3109sJeXT5ImVdphFs9cvyZyBT9t1PbRowv58EgV0zE4hbAeVkULAbxFV5b/ExT
jjGVHoX7CVhWxvCiTqCUoXZRkUE9C3FnkzEFRkKbYu6NCfiHfEyB3Xyg9hfdrRgj
MRq907zCof+nDtWxGz1MSEuvTj1g9GZ049Bennqzjc/Q+0ovXoK4jm+Py0FiUGUa
A6yhexficjH+kCR/xDbVnWrMhSLB4AuTBT9HjfZI6gk3uYLhoT8Pig4/eVtR2Q1w
ZIJsFToR6ofGuyECwFcs+PUXN7fmGRSiPXgjAr/zIUBdW0VWCE3OGPNqtRk2E5s6
IQARAQABwsD8BBgBCAAmFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sLAFCQWj
moACGwwACgkQZg+p0QLLz9DncQwAg76IehTemLIfrB8T9WIBZrI4kUV7G7a4rjiV
oUiHYN5QwhnbZnsaJDlt+Ezoqy/510eo2bCSzvW5xXYPgyjcuOPwgQo1Qp764Qxy
X6rld2f2RcWkDuBHun55ZWXjby8o21ginPRwruBVYY5rVf3DV1iBu4NurUeHtyFk
/dS0XTOQi2wVUb17sW/+ybCEokdVacZGzOqP/OmwHrF8ylXlXnhQq6e3r+J+T8fu
oGJelm/CJiMwyP6cEWE8sxVqX/iqwjwUYkuOCpE+lOWSvdNHgoEkWR0RXBPQjnGm
LKbfTl/QDXLk6NP2/r9uxm2HL6Ei3QJKSEdrp+XZaVnk/OffO485NOTKwGOxyWb0
06cTMh53xPkAJFQu4Tvdj+odsHz88jqw5wfPG0BYWx0I/FspYj7N9kZR8ULR9nX0
LvpzJ/kB4NgHIUt8YtIL6ZSfM2dbF7fKzvx1UqFfvozJZwFzfEieJLXa4nlGgR6D
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------BnZOf9bMl63xyDAkBVQesUHE--

--------------ZK2ybu0YmKhbALu031yQbiQL--

--------------7x0Un0WrRta0V06v7ou004O1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoxHZcFAwAAAAAACgkQZg+p0QLLz9DU
Xgv/evF0Ujna2K+E0mmmD4o9bB+1Nrc7HlU5VO2NBVm2DX02ZnKTHHE5vQlwdQXrCmo4yo1x7py0
BPLSyriBQ5RaZ+hXTGZyompvZZj4juFCqgHaMrYz+5N8DYCvWlTOjfy9f8R30Q5HGKb7xWydeNxD
e83ltM7j4PpLmO+IIG6TEvyYucYuES36RASlDCG3D20qDvCaYPRiaK9PhNl9887fjihXvRgfJkzq
1PvSOrfAYqTBHCACgtVV0WbcS/4SKQlUQqVHJAbRi6j+4+zc75XnvMkmEp5dK+yDsNlRBPznkVnz
hdJnLoZ39RZsgNFKPGmy80zltw1uwU/vtGWlDeDUfqLNxK6m0QOXoAUR7VEDZxy9EiGEq+6heljP
YqqjOMipRUzhxerc/ylXXVLA8eWGHfOIbQULRiuXK+ymNkkPtoYFz7zScrn2TKFv3mizTzid5FlA
6eDXgvllDbxUO7LKVEILwDHUFEUaoyvEaK3mqO6NNa+vzia88rYeONVZcH17
=3D+r
-----END PGP SIGNATURE-----

--------------7x0Un0WrRta0V06v7ou004O1--

