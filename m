Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IUqJoWGDWo8ygUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 12:01:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF23B58B426
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 12:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313765.1583836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPdis-0004i7-1b; Wed, 20 May 2026 10:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313765.1583836; Wed, 20 May 2026 10:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPdir-0004gg-V2; Wed, 20 May 2026 10:00:17 +0000
Received: by outflank-mailman (input) for mailman id 1313765;
 Wed, 20 May 2026 10:00:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e44d40e68000f373@swg.vates.tech>)
 id 1wPdiq-0004ga-3m
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 10:00:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPdip-00F9AE-Fl
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:00:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e44d40e68000f373@swg.vates.tech>)
 id 6a0d862e-2eae-0a2a0a5409dd-0a2a4506b882-10
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:00:15 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e44d40e68000f373@swg.vates.tech>)
 id 6a0d862f-7371-0a2a45060019-b9ff1c2292e1-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:00:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e44d40e68000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 10:00:08 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id D1DF2811AA;
 Wed, 20 May 2026 12:00:07 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=bQatXbQY4ZA2SaKgg7Wr6TCXHjhRgm9n5VK3mC7JflY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=m278DRsvCTxsd5HXzwJ6XdLusUcujQwaEIs211mo+SaLhWI/D9/VN2SyV173Jy8A21+BKePie
 FelX2l7LpiVJVjAeMu4d4CkACmahBFiMJnAIqPAzz4A41njeDT03Fy6+u2p1Xyylxc9pghQpOKy
 n7/O61+yf5vvlzXDFPGEq1SXL/Rse9wvtKFYSDLgS3IIL5qHCHY99Fgeh6V67GO5xauPkSPwin/
 64VM6Ti6N2j3kGKtI6Ck8u4iuixEm46tlfPOxmerqDHOuIoowDC5uCDCNYax89BFFktPdocc7Gg
 nsdJFZgSfnTCfXA9kbUD7w0dmxAVILHjcN9SOsiBAqJg==
X-Zone-Loop: 4a2e9b52e063a9079685eded1d98c20f208f82ef25fc
x-campaign-type: default
x-transaction-id: d4b92f99-7d6a-486e-8dff-dc960c70dae4
x-swg-uid: 01-35f6bea6-3258-47f9-a778-65e9a96ab596
X-Mailer: Sweego
Message-ID:
 <1779271208.8631fc262581453bbf619ec5b2062170.19e44d40e68000f373@vates.tech>
x-swg-bid: 1779271208.8631fc262581453bbf619ec5b2062170.19e44d40e68000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 20 May 2026 12:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] pci: Introduce parse_pci_sbdf{_seg}()
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117760.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@vates.tech>
 <ag0e3ZgNDQN9A6Vn@kraken>
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
In-Reply-To: <ag0e3ZgNDQN9A6Vn@kraken>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rsU2yxDq17VOtzGHA3ZtMnoT"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779271208019
X-purgate-ID: tlsNG-16d1c6/1779271215-86B75D75-9B17226B/0/0
X-purgate-type: clean
X-purgate-size: 9306
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim]
X-Rspamd-Queue-Id: EF23B58B426
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rsU2yxDq17VOtzGHA3ZtMnoT
Content-Type: multipart/mixed; boundary="------------dpInNmscFASBFIegzTSCyLoV";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <3ba68adb-97a9-4c04-ba0e-c716c5bfbc65@vates.tech>
Subject: Re: [PATCH 1/5] pci: Introduce parse_pci_sbdf{_seg}()
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117760.8631fc262581453bbf619ec5b2062170.19e3bae9f48000f373@vates.tech>
 <ag0e3ZgNDQN9A6Vn@kraken>
In-Reply-To: <ag0e3ZgNDQN9A6Vn@kraken>

--------------dpInNmscFASBFIegzTSCyLoV
Content-Type: multipart/mixed; boundary="------------1v3gL6Jja0MXw0yu9Dtj4RlM"

--------------1v3gL6Jja0MXw0yu9Dtj4RlM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMDUvMjAyNiDDoCAwNDo0MywgZG11a2hpbkBmb3JkLmNvbSBhIMOpY3JpdMKgOg0K
PiBPbiBNb24sIE1heSAxOCwgMjAyNiBhdCAwNToyMToyNVBNICswMjAwLCBUZWRkeSBBc3Rp
ZSB3cm90ZToNCj4+IEluIG1hbnkgcGxhY2VzLCB3ZSdyZSBwYXJzaW5nIGEgUENJIHN0cmlu
ZyBpbnRvIGluZGl2aWR1YWwgcGFydHMNCj4+IChzZWcsIGJ1cywgZGV2LCBmbikgYW5kIHRo
ZW4gdHJhbnNmb3JtIGl0IGludG8gYSBwY2lfc2JkZl90IHVzaW5nIFBDSV9TQkRGDQo+PiBt
YWNyby4gUmF0aGVyIHRoYW4gY29udmVydGluZyBmcm9tIHBhcnRzIHRvIHBjaV9zYmRmX3Qg
YW5kIHZpY2UgdmVyc2EsDQo+PiBpbnRyb2R1Y2UgYSBuZXcgZnVuY3Rpb24gdGhhdCBwYXJz
ZXMgYSBQQ0kgc3RyaW5nIGludG8gYSBwY2lfc2JkZl90IHN0cnVjdHVyZQ0KPj4gZGlyZWN0
bHkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZh
dGVzLnRlY2g+DQo+PiAtLS0NCj4+ICAgeGVuL2RyaXZlcnMvcGNpL3BjaS5jIHwgMTggKysr
KysrKysrKysrKysrKysrDQo+PiAgIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCB8ICAzICsrKw0K
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvcGNpL3BjaS5jIGIveGVuL2RyaXZlcnMvcGNpL3BjaS5jDQo+
PiBpbmRleCAwODRiZTM4ODBjLi4xZDA2Y2IwMzViIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGNpL3BjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wY2kvcGNpLmMNCj4+IEBA
IC0yMDIsMyArMjAyLDIxIEBAIGNvbnN0IGNoYXIgKl9faW5pdCBwYXJzZV9wY2lfc2VnKGNv
bnN0IGNoYXIgKnMsIHVuc2lnbmVkIGludCAqc2VnX3AsDQo+PiAgIA0KPj4gICAgICAgcmV0
dXJuIHM7DQo+PiAgIH0NCj4+ICsNCj4+ICtjb25zdCBjaGFyICpwYXJzZV9wY2lfc2JkZihj
b25zdCBjaGFyICpzLCBwY2lfc2JkZl90ICpzYmRmKQ0KPj4gK3sNCj4+ICsgICAgdW5zaWdu
ZWQgaW50IHNlZywgYnVzLCBkZXYsIGZ1bmM7DQo+PiArICAgIGNvbnN0IGNoYXIgKm91dCA9
IHBhcnNlX3BjaShzLCAmc2VnLCAmYnVzLCAmZGV2LCAmZnVuYyk7DQo+IA0KPiBJTU8sIGJv
dGggcGFyc2VfcGNpKCkgYW5kIHBhcnNlX3BjaV9zZWcoKSBzaG91bGQgYmUgbWVyZ2VkIGlu
dG8NCj4gcGFyc2VfcGNpX3NiZGYoKSBhbmQgcGFyc2VfcGNpX3NiZGZfc2VnKCkgYXQgdGhl
IGVuZCBvZiB0aGUgc2VyaWVzLA0KPiBzaW5jZSB0aGVyZSB3aWxsIGJlIG5vIHJlbWFpbmlu
ZyBjb25zdW1lcnMgb2YgdGhlIG9sZCBBUElzLg0KPiANCj4gV2hhdCBkbyB5b3UgdGhpbms/
DQo+IA0KDQpUaGF0IHdhcyBteSBwbGFuLCBidXQgcGFyc2VfcGhhbnRvbV9kZXYoKSAoaW4g
DQp4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYykgd2FudHMgdG8gcGFyc2UgdGhlIFBD
SSBzdHJpbmcgd2l0aG91dCB0aGUgDQpmdW5jdGlvbiBwYXJ0IChpLmUgWFhYWDpZWTpaWikg
d2hpY2ggY2FuJ3QgYmUgZXhwcmVzc2VkIHdpdGggYSBmdWxsIFNCREYgDQpwYXJzZSBmdW5j
dGlvbi4NCg0KSXQgY3VycmVudGx5IHdvcmtzIGJ5IHBhc3NpbmcgTlVMTCB0byBgZnVuY19w
YCwgd2hpY2ggaGFzIHNwZWNpYWwgDQpoYW5kbGluZyBpbiBwYXJzZV9wY2kuDQoNCldlIGNv
dWxkIGV2ZW50dWFsbHkgYWxsb3cgb21pdHRpbmcgUENJIGZ1bmN0aW9uIGFuZCBtYWtlIGRl
ZmF1bHQgaXQgdG8gDQp6ZXJvLCBzbyB0aGF0IHdlIHdpbGwgYmUgYWJsZSBtaWdyYXRlIHBh
cnNlX3BoYW50b21fZGV2IHRvIHRoaXMgbmV3IA0KZnVuY3Rpb24gKHNvIGl0IG5vdyBhbGxv
d3MgcGFyc2luZyBmdWxsIFNCREYsIGJ1dCBpZ25vcmUgdGhlIGZ1bmN0aW9uIA0KcGFydCBv
ZiBpdCkuDQoNCj4+ICsNCj4+ICsgICAgKnNiZGYgPSBQQ0lfU0JERihzZWcsIGJ1cywgZGV2
LCBmdW5jKTsNCj4+ICsgICAgcmV0dXJuIG91dDsNCj4+ICt9DQo+PiArDQo+PiArY29uc3Qg
Y2hhciAqcGFyc2VfcGNpX3NiZGZfc2VnKGNvbnN0IGNoYXIgKnMsIHBjaV9zYmRmX3QgKnNi
ZGYsIGJvb2wgKmRlZl9zZWcpDQo+PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgc2VnLCBi
dXMsIGRldiwgZnVuYzsNCj4+ICsgICAgY29uc3QgY2hhciAqb3V0ID0gcGFyc2VfcGNpX3Nl
ZyhzLCAmc2VnLCAmYnVzLCAmZGV2LCAmZnVuYywgZGVmX3NlZyk7DQo+PiArDQo+PiArICAg
ICpzYmRmID0gUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYyk7DQo+PiArICAgIHJldHVy
biBvdXQ7DQo+PiArfQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaCBi
L3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPj4gaW5kZXggYWZiNmJiZjUwZC4uN2JmYzU5Y2Q3
NSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPj4gKysrIGIveGVu
L2luY2x1ZGUveGVuL3BjaS5oDQo+PiBAQCAtMjgwLDYgKzI4MCw5IEBAIGNvbnN0IGNoYXIg
KnBhcnNlX3BjaV9zZWcoY29uc3QgY2hhciAqcywgdW5zaWduZWQgaW50ICpzZWdfcCwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmJ1c19wLCB1bnNp
Z25lZCBpbnQgKmRldl9wLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCAqZnVuY19wLCBib29sICpkZWZfc2VnKTsNCj4+ICAgDQo+PiArY29uc3QgY2hh
ciAqcGFyc2VfcGNpX3NiZGYoY29uc3QgY2hhciAqcywgcGNpX3NiZGZfdCAqc2JkZik7DQo+
PiArY29uc3QgY2hhciAqcGFyc2VfcGNpX3NiZGZfc2VnKGNvbnN0IGNoYXIgKnMsIHBjaV9z
YmRmX3QgKnNiZGYsIGJvb2wgKmRlZl9zZWcpOw0KPj4gKw0KPj4gICAjZGVmaW5lIFBDSV9C
QVJfVkYgICAgICAoMXUgPDwgMCkNCj4+ICAgI2RlZmluZSBQQ0lfQkFSX0xBU1QgICAgKDF1
IDw8IDEpDQo+PiAgICNkZWZpbmUgUENJX0JBUl9ST00gICAgICgxdSA8PCAyKQ0KPj4gLS0g
DQo+PiAyLjUyLjANCj4+DQo+Pg0KPj4NCj4+IC0tDQo+PiBUZWRkeSBBc3RpZSB8IFZhdGVz
IFhDUC1uZyBEZXZlbG9wZXINCj4+DQo+PiBYQ1AtbmcgJiBYZW4gT3JjaGVzdHJhIC0gVmF0
ZXMgc29sdXRpb25zDQo+Pg0KPj4gd2ViOiBodHRwczovL3ZhdGVzLnRlY2gNCj4gDQoNClRl
ZGR5DQo=
--------------1v3gL6Jja0MXw0yu9Dtj4RlM
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------1v3gL6Jja0MXw0yu9Dtj4RlM--

--------------dpInNmscFASBFIegzTSCyLoV--

--------------rsU2yxDq17VOtzGHA3ZtMnoT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoNhicFAwAAAAAACgkQZg+p0QLLz9Cq
Dgv/TJZtU9wjpVBKM7xiaEhor2qPz1SJt1au3SGp6G6dVrxCfYwSAvhLKx6gzwDcn1GqRL4VVsVX
SPggZRboxtnuOTlz5iEDTe5YHSnH34+PrJySAomI3du8Ax6AZps+YYCHMeNaz9IW/UUMk83mt58Q
RmI36qkqtD6Hm977fZbp4YK7ztlyel1oM2jFXi4UC/nAgB8pvZswoRTE7YFmZJv7HDVr1C4EjMoI
R1jUsxA9QySFMsiXL4SAw1yoc9fliFDzv7n03olDq/4BoucCgj7iReLiqW4yxobvymUhSjO/7/F4
mRkWjS8Xh0D8eZIBArL3N5X1aYdaFwhBwTozTb9BGlDZqB8wCiXMKtS7YPMHrMNRm2BopSMPQyIq
egd0Vizk4TQX8I2iMPav/7OBWTSxSKhImBRr05pt39t38nkigTN1fCchxJWrS1FmEEZUSqcRF3Hx
H3ZsRD/no6U86bOu9Ml4g/A65azrJ0YVV2wADcqXjJSoPyUEVhMFuV9cH99p
=OUqs
-----END PGP SIGNATURE-----

--------------rsU2yxDq17VOtzGHA3ZtMnoT--

