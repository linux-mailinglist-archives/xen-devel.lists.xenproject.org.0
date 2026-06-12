Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IDGxDe/YK2ouGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D956967889B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=O97hIpqN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336471.1598272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhM-0001yB-Ug; Fri, 12 Jun 2026 10:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336471.1598272; Fri, 12 Jun 2026 10:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhM-0001va-QQ; Fri, 12 Jun 2026 10:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1336471;
 Fri, 12 Jun 2026 10:01:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb473e25000701b@swg.vates.tech>)
 id 1wXyhL-0001sS-6s
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhK-009llX-JD
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb473e25000701b@swg.vates.tech>)
 id 6a2bd8e1-e002-0a2a0a5209dd-0a2a45058ac6-32
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:10 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb473e25000701b@swg.vates.tech>)
 id 6a2bd8e6-aaa8-0a2a45050019-b9ff1c1287c1-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb473e25000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:08 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 49788864C8;
 Fri, 12 Jun 2026 12:01:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=SgMjdxegYzrvKgMTHiojta7TUkAuW8/NFjXdVBUYF3E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=O97hIpqN6gn/Vgv4XzggB4xK/gabcqU5YKWsq8Nlx5SkdobfAQK1QGXCCmdoUuke07w45mHvX
 Whv1rtLsVejSu5uUcQVVoQJuMUQxup3fBj3f5Rg4kB2hxGVJG/brxyq9aXu6NEH8qGv7z14cMZc
 uvLC3/f/DFfYE+k+6tV4s+jI4pepGoRC+v/Eazs8o9h5wygUGcxNCU9Zt6p8S77Us5ZCxLKWGAG
 5Eo87EXbDkNy9ldD2l8fkY2wyr9EdJI8pmUvo2wHrvgc40Wt/VCyumEKMrfGF6sDOofkRD5nCDV
 6d7CQD9jXAlQwGI+rrFBFVFVMg12lV4kW3a3VKaGX7Vw==
X-Zone-Loop: 93ed67e546f59fc714809f800e0b386d989becf98e0e
x-campaign-type: default
x-transaction-id: 5cb3ddd8-72f5-4a64-a60e-f89bdaaacec1
x-swg-uid: 01-143717bb-954c-4758-99f1-6aefd653a4d0
X-Mailer: Sweego
Message-ID:
 <1781258468.8631fc262581453bbf619ec5b2062170.19ebb473e25000701b@vates.tech>
x-swg-bid: 1781258468.8631fc262581453bbf619ec5b2062170.19ebb473e25000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 03/17] hvmloader: add function to set the emulated machine
 type (i440/Q35)
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-4-thierry.escande@vates.tech>
 <afCOS0Ufbk790t8J@macbook.local>
Content-Language: en-US
In-Reply-To: <afCOS0Ufbk790t8J@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9a.50c45423f473a627.19ebb473c42.fc5f5bd48fb3c302=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258468418
X-purgate-ID: tlsNG-c201ff/1781258470-DB36C443-9DB383DC/0/0
X-purgate-type: clean
X-purgate-size: 5333
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D956967889B

---=Part.9a.50c45423f473a627.19ebb473c42.fc5f5bd48fb3c302=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/28/26 12:39, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>> This adds a new function init_pc_machine_type() which allows to
>> determine and set the emulated chipset type=2E Possible values are
>> MACHINE_TYPE_I440 and MACHINE_TYPE_Q35 and stored in the global variabl=
e
>> machine_type=2E
>>
>> The machine_type variable will be used from multiple places in followin=
g
>> commits=2E
>=20
> Is this initialization something that OVMF or SeaBIOS also does?
> (maybe not for Xen ATM)
>=20
> Asking myself because as said earlier we want to possibly get rid of
> hvmloader, plus we will want ECAM support in PVH at some point=2E

Possibly=2E There are surely overlaps in term of initialization between
the toolstack, hvmloader and the firmwares but that's another story imo=2E

>=20
>> Signed-off-by: Alexey Gerasimenko <x1917x@gmail=2Ecom>
>=20
> Same as previous patch, if the first SoB is from Alexey the From:
> (patch author) should also match=2E
>=20
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  tools/firmware/hvmloader/hvmloader=2Ec |  2 ++
>>  tools/firmware/hvmloader/pci_regs=2Eh  |  4 +++
>>  tools/firmware/hvmloader/util=2Ec      | 42 ++++++++++++++++++++++++++=
++
>>  tools/firmware/hvmloader/util=2Eh      | 11 ++++++++
>>  4 files changed, 59 insertions(+)
>>
>> diff --git a/tools/firmware/hvmloader/hvmloader=2Ec b/tools/firmware/hv=
mloader/hvmloader=2Ec
>> index 6d23150fc9=2E=2E626cc53649 100644
>> --- a/tools/firmware/hvmloader/hvmloader=2Ec
>> +++ b/tools/firmware/hvmloader/hvmloader=2Ec
>> @@ -332,6 +332,8 @@ int main(void)
>> =20
>>      init_hypercalls();
>> =20
>> +    init_pc_machine_type();
>> +
>>      memory_map_setup();
>> =20
>>      xenbus_setup();
>> diff --git a/tools/firmware/hvmloader/pci_regs=2Eh b/tools/firmware/hvm=
loader/pci_regs=2Eh
>> index 7bf2d873ab=2E=2E4d4dc0cd01 100644
>> --- a/tools/firmware/hvmloader/pci_regs=2Eh
>> +++ b/tools/firmware/hvmloader/pci_regs=2Eh
>> @@ -107,6 +107,10 @@
>> =20
>>  #define PCI_INTEL_OPREGION 0xfc /* 4 bits */
>> =20
>> +#define PCI_VENDOR_ID_INTEL              0x8086
>> +#define PCI_DEVICE_ID_INTEL_82441        0x1237
>> +#define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
>=20
> In Xen we have a separate file for vendor and device IDs, called
> pci_ids=2Eh=2E  Maybe it would be better to use a similar approach in
> hvmloader, and keep pci_regs=2Eh only containing PCI register offsets=2E

As suggested by Jan, I'll use pci_ids=2Eh from Xen (if it's ok to add a
symlink to pci_ids=2Eh in tools/include/xen)

And is it ok to add the PCI device IDs to pci_ids=2Eh in this commit or
should it be done in a separate one ?

>=20
>> +
>>  #endif /* __HVMLOADER_PCI_REGS_H__ */
>> =20
>>  /*
>> diff --git a/tools/firmware/hvmloader/util=2Ec b/tools/firmware/hvmload=
er/util=2Ec
>> index f1ed1eb48d=2E=2Ef9116bea4d 100644
>> --- a/tools/firmware/hvmloader/util=2Ec
>> +++ b/tools/firmware/hvmloader/util=2Ec
>> @@ -22,6 +22,7 @@
>>  #include "hypercall=2Eh"
>>  #include "ctype=2Eh"
>>  #include "vnuma=2Eh"
>> +#include "pci_regs=2Eh"
>>  #include <acpi2_0=2Eh>
>>  #include <libacpi=2Eh>
>>  #include <stdint=2Eh>
>> @@ -648,6 +649,47 @@ void __bug(const char *file, int line)
>>      crash();
>>  }
>> =20
>> +machine_type_t machine_type;
>> +
>> +void init_pc_machine_type(void)
>=20
> Since detection is done based on PCI device IDs, it might be better
> placed in pci=2Ec, and so you don't need to include pci_regs=2Eh in
> util=2Ec=2E

Yes, that makes more sense=2E And I'll rename it as
pci_init_machine_type() then=2E

>=20
>> +{
>> +    uint16_t vendor_id;
>> +    uint16_t device_id;
>> +
>> +    if ( machine_type !=3D MACHINE_TYPE_UNDEFINED )
>> +        return;
>> +
>> +    vendor_id =3D pci_readw(0, PCI_VENDOR_ID);
>> +    device_id =3D pci_readw(0, PCI_DEVICE_ID);
>> +
>> +    /* only Intel platforms are emulated currently */
>> +    if ( vendor_id !=3D PCI_VENDOR_ID_INTEL )
>> +        goto error;
>> +
>> +    switch ( device_id )
>> +    {
>> +    case PCI_DEVICE_ID_INTEL_82441:
>> +        machine_type =3D MACHINE_TYPE_I440;
>> +        printf("Detected i440 chipset\n");
>> +        break;
>> +
>> +    case PCI_DEVICE_ID_INTEL_Q35_MCH:
>> +        machine_type =3D MACHINE_TYPE_Q35;
>> +        printf("Detected Q35 chipset\n");
>> +        break;
>> +
>> +    default:
>> +        goto error;
>> +    }
>> +
>> +    return;
>> +
>> +error:
>> +    printf("Unknown emulated chipset encountered, VID=3D%04Xh, DID=3D%=
04Xh\n",
>=20
> We don't usually use the h suffix in hex numbers in hvmloader, it's
> more common to prefix them with 0x, so I would recommend to use the %#06=
x
> formatter instead=2E

I did some tests regarding Jan comment and yes, # and width specifier
seem to act weirdly=2E Will use 0x%0nx instead=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.9a.50c45423f473a627.19ebb473c42.fc5f5bd48fb3c302=---

