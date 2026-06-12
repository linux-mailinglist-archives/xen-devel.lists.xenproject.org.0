Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZPwGBxLZK2pMGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F36788E0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=G3KPHZyT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336495.1598334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhr-0004r7-9z; Fri, 12 Jun 2026 10:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336495.1598334; Fri, 12 Jun 2026 10:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhr-0004nA-5q; Fri, 12 Jun 2026 10:01:43 +0000
Received: by outflank-mailman (input) for mailman id 1336495;
 Fri, 12 Jun 2026 10:01:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47a989000701b@swg.vates.tech>)
 id 1wXyhp-0004iA-Kw
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhp-0056he-0t
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47a989000701b@swg.vates.tech>)
 id 6a2bd8fe-bab6-0a2a0a5309dd-0a2a450482a6-16
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:41 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47a989000701b@swg.vates.tech>)
 id 6a2bd904-1dec-0a2a45040019-b9ff1c12a64d-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb47a989000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:36 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id D1BB68617A;
 Fri, 12 Jun 2026 12:01:35 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=0Z5Cwdb++2idGCheBWjVKl0AzU3Ayz9OcRia9e5cj6k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=G3KPHZyTYlsjNOzTlUBQVMbOr4CtoYJ7ME3mOBM7RDKTJA1jXcgZw+N1wZVbKySkfbJzH/UU9
 y0R/xj0xqCLHbo9tzBJu+Ipncprbn/hUraaH55SI3o0Xk+IAikWkSc4/V1X+gI29TYJeAQsDhQ6
 tI/KHAlbXzVmtTitjZ3mQECp1Y1OYlVxYquTuxVnDNMEHiuTsrmcxO7+f/JVlRVd6kxh7ClkL/k
 YjKfktQwublFY/2Fe1T9CFk4wQsT/m7t0OU7Avae5+wPyYRDSYpBHhQv19Cn0i5P1clKCBxVwy0
 1t5usRwZ8medwthNMQ9dMMyrxOlT3pDTlPfrLvYVFZvA==
X-Zone-Loop: a0532ff13dbfdef3385ea8a6df809474f2553db469d7
x-campaign-type: default
x-transaction-id: 1c37cc4b-8f6b-430c-b8fc-e5806ee7c565
x-swg-uid: 01-3b3a9b5e-0106-4040-9e9b-e4ccaa4b1bc7
X-Mailer: Sweego
Message-ID:
 <1781258496.8631fc262581453bbf619ec5b2062170.19ebb47a989000701b@vates.tech>
x-swg-bid: 1781258496.8631fc262581453bbf619ec5b2062170.19ebb47a989000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 08/17] hvmloader: Extend PCI BAR struct
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-9-thierry.escande@vates.tech>
 <afC2uLj_fD2qPPsT@macbook.local>
Content-Language: en-US
In-Reply-To: <afC2uLj_fD2qPPsT@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a1.932943b93a936fff.19ebb47a80c.5349851b6c1bb480=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258496013
X-purgate-ID: tlsNG-ebf023/1781258500-2B5683FF-4AFD3B3F/0/0
X-purgate-type: clean
X-purgate-size: 3963
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 778F36788E0

---=Part.a1.932943b93a936fff.19ebb47a80c.5349851b6c1bb480=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/28/26 15:31, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:03PM +0000, Thierry Escande wrote:
>> For the upcoming allocation of the MMCONFIG range in MMIO hole, this
>> patch extends the 'bars' structure to make it universal for any
>> arbitrary BAR type=2E Either IO, MMIO, ROM or a chipset-specific resour=
ce=2E
>>
>> One important new field is addr_mask, which tells which bits of the bas=
e
>> address can (should) be written=2E Different address types (ROM, MMIO B=
AR,
>> PCIEXBAR) will have different addr_mask values=2E
>>
>> For every assignable BAR range we store its size, PCI device BDF (devfn
>> actually) to which it belongs, BAR type (mem/io/mem64) and correspondin=
g
>> register offset in device PCI conf space=2E
>>
>> Also, to reduce code complexity, all long mem/mem64 BAR flags checks ar=
e
>> replaced by simple bars[i] field probing, eg=2E:
>> -        if ( (bar_reg =3D=3D PCI_ROM_ADDRESS) ||
>> -             ((bar_data & PCI_BASE_ADDRESS_SPACE) =3D=3D
>> -              PCI_BASE_ADDRESS_SPACE_MEMORY) )
>> +        if ( bars[i]=2Eis_mem )
>=20
> I think this is also supposed to be a non-functional change, just
> adding new fields and adjusting the code to make use of them?

Right=2E It's preparation work for MMCONFIG area setup in a next patch=2E

>=20
>>
>> Signed-off-by: Alexey Gerasimenko <x1917x@gmail=2Ecom>
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  tools/firmware/hvmloader/pci=2Ec | 58 ++++++++++++++++++++------------=
--
>>  1 file changed, 35 insertions(+), 23 deletions(-)
>>
>> diff --git a/tools/firmware/hvmloader/pci=2Ec b/tools/firmware/hvmloade=
r/pci=2Ec
>> index 91c7fd2171=2E=2E6e6720adae 100644
>> --- a/tools/firmware/hvmloader/pci=2Ec
>> +++ b/tools/firmware/hvmloader/pci=2Ec
>> @@ -160,9 +160,10 @@ static void class_specific_pci_device_setup(uint16=
_t vendor_id,
>> =20
>>  void pci_setup(void)
>>  {
>> -    uint8_t is_64bar, using_64bar, bar64_relocate =3D 0;
>> +    uint8_t is_64bar, using_64bar, bar64_relocate =3D 0, is_mem;
>=20
> The newly introduce fields want to be booleans types=2E

Ok=2E Should I also change the existing ones to bool or this must be in a
separate patch?

>=20
>>      uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
>>      uint64_t base, bar_sz, bar_sz_upper, mmio_total =3D 0;
>> +    uint64_t addr_mask;
>>      uint8_t vga_devfn =3D 0xff;
>>      uint16_t class, vendor_id, device_id;
>>      unsigned int bar, pin, link, isa_irq;
>> @@ -176,10 +177,13 @@ void pci_setup(void)
>> =20
>>      /* Create a list of device BARs in descending order of size=2E */
>>      struct bars {
>> -        uint32_t is_64bar;
>>          uint32_t devfn;
>>          uint32_t bar_reg;
>>          uint64_t bar_sz;
>> +        uint64_t addr_mask; /* which bits of the base address can be w=
ritten */
>> +        uint32_t bar_data;  /* initial value - BAR flags here */
>=20
> Hm, that's just storing the flags of the BAR, given that you already
> store the 64bit and memory flags, you just need the prefetch and ROM
> enabled booleans to have the full set, and then you can remove the
> bar_data field from the struct=2E

Do you mean reading the bar data from their registers in the resource
assignation loop instead of using the bar_data field? Storing it in this
struct saves a few back and forth with Qemu=2E

Or I didn't get the point=2E=2E=2E

>=20
>> +        uint8_t  is_64bar;
>> +        uint8_t  is_mem;
>=20
> Use bool types please for the is_ fields=2E

Sure=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a1.932943b93a936fff.19ebb47a80c.5349851b6c1bb480=---

