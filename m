Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0J3VFAPZK2o3GQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4F6788BE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="DU/2yU5Q";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336485.1598304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhf-0003UQ-9e; Fri, 12 Jun 2026 10:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336485.1598304; Fri, 12 Jun 2026 10:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhf-0003Np-4a; Fri, 12 Jun 2026 10:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1336485;
 Fri, 12 Jun 2026 10:01:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb478423000701b@swg.vates.tech>)
 id 1wXyhd-0003EV-BG
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhc-009Pge-O6
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb478423000701b@swg.vates.tech>)
 id 6a2bd8f2-bab6-0a2a0a5309dd-0a2a4508bdda-34
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:28 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb478423000701b@swg.vates.tech>)
 id 6a2bd8f8-63b5-0a2a45080019-b9ff1c12a977-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb478423000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:26 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4CA7986509;
 Fri, 12 Jun 2026 12:01:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=oYy9YgLXe1603Xgx3X3FY7zrTsXhJGcgHp7nx5qF91o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DU/2yU5QU19glj5EhZgtltuFV/YxMXJow5GtqFz5zWCuxcIjoJATr6JH2jAOAUKAqxCnIv9BR
 cEcVE8sQNPh1gfFk9aMPxVZ3q4YIjg7nB4gxX3AQnum/yv9og0eyY6/tD4A3jE3qQMZRMCrUo9r
 eaqTW+QmEBrHF//qyqgDAUPk22098FMrbs1eUmb9PTo9SWFSKd0ek0WDrHNh5xNobG7b1p2CRNQ
 UJG4QsLYOYcEDRZ1Q7ZFEryzAz0xfD3FH2PzZNA3l/rhUGkWkFNCXj/aufJ73326507t/hcesgc
 GBB8sm8uzksJA+JyFpoqtN9c/NUfKlsh89DoPXpt9PnQ==
X-Zone-Loop: 0bbb76286eaa2d8fb7590fad95f9cfe4b775e88d3b84
x-campaign-type: default
x-transaction-id: acd69170-0109-40c6-ba4d-1ca468d791fb
x-swg-uid: 01-3f8fc87f-5f45-406c-b9ea-a25bc5487e5a
X-Mailer: Sweego
Message-ID:
 <1781258486.8631fc262581453bbf619ec5b2062170.19ebb478423000701b@vates.tech>
x-swg-bid: 1781258486.8631fc262581453bbf619ec5b2062170.19ebb478423000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 06/17] hvmloader: Move pci devices setup to a separate
 function
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-7-thierry.escande@vates.tech>
 <afCsimOpaMIr50Ua@macbook.local>
Content-Language: en-US
In-Reply-To: <afCsimOpaMIr50Ua@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9e.1604d895d609bd5f.19ebb478295.4ebf08a4ccc32d2=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258486421
X-purgate-ID: tlsNG-c1860d/1781258488-B777EDB1-614A097D/0/0
X-purgate-type: clean
X-purgate-size: 4432
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_MUA_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECE4F6788BE

---=Part.9e.1604d895d609bd5f.19ebb478295.4ebf08a4ccc32d2=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/28/26 14:48, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:02PM +0000, Thierry Escande wrote:
>> For readability and code simplification, this patch moves PCI-device
>> specific initializations out of the pci_setup() function to a new
>> function class_specific_pci_device_setup()=2E
>=20
> AFAICT this is a non-functional change=2E  Should likely be mentioned in
> the commit message to avoid any doubts=2E

Sure, will do=2E

>=20
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  tools/firmware/hvmloader/pci=2Ec      | 117 +++++++++++++++-----------=
--
>>  tools/firmware/hvmloader/pci_regs=2Eh |   4 +
>>  2 files changed, 68 insertions(+), 53 deletions(-)
>>
>> diff --git a/tools/firmware/hvmloader/pci=2Ec b/tools/firmware/hvmloade=
r/pci=2Ec
>> index c41c8d946a=2E=2Ea76d051bdf 100644
>> --- a/tools/firmware/hvmloader/pci=2Ec
>> +++ b/tools/firmware/hvmloader/pci=2Ec
>> @@ -84,12 +84,71 @@ static int find_next_rmrr(uint32_t base)
>>      return next_rmrr;
>>  }
>> =20
>> +static void class_specific_pci_device_setup(uint16_t vendor_id,
>> +                                            uint16_t device_id,
>> +                                            uint16_t class,
>=20
> It's a bit weird to pass the class value into the function, the value
> is only used inside the function itself, and hence could be fetched
> inside the function as the device BDF is provided as parameters?

That was to have less modification and have all calls to pci_readw() in
one place=2E I can move this one to the new function, no problem=2E

>=20
>> +                                            uint8_t bus,
>> +                                            uint8_t devfn, uint8_t *vg=
a_devfn)
>> +{
>> +    switch ( class )
>> +    {
>> +    case PCI_CLASS_DISPLAY_VGA:
>> +        /* If emulated VGA is found, preserve it as primary VGA=2E */
>> +        if ( (vendor_id =3D=3D 0x1234) && (device_id =3D=3D 0x1111) )
>> +        {
>> +            *vga_devfn =3D devfn;
>> +            virtual_vga =3D VGA_std;
>> +        }
>> +        else if ( (vendor_id =3D=3D 0x1013) && (device_id =3D=3D 0xb8)=
 )
>=20
> Since you introduce defines for the device classes, could you also
> introduce defines for the vendor and device IDs used here?

Sure=2E

>=20
>> +        {
>> +            *vga_devfn =3D devfn;
>> +            virtual_vga =3D VGA_cirrus;
>> +        }
>> +        else if ( virtual_vga =3D=3D VGA_none )
>> +        {
>> +            *vga_devfn =3D devfn;
>> +            virtual_vga =3D VGA_pt;
>> +            if ( vendor_id =3D=3D 0x8086 )
>=20
> This one is PCI_VENDOR_ID_INTEL, also a couple of more instances below=
=2E

Right=2E Will do the same for all IDs=2E

>=20
>> +            {
>> +                igd_opregion_pgbase =3D mem_hole_alloc(IGD_OPREGION_PA=
GES);
>> +                /*
>> +                 * Write the the OpRegion offset to give the opregion
>> +                 * address to the device model=2E The device model wil=
l trap
>> +                 * and map the OpRegion at the give address=2E
>> +                 */
>> +                pci_writel(*vga_devfn, PCI_INTEL_OPREGION,
>> +                           igd_opregion_pgbase << PAGE_SHIFT);
>> +            }
>> +        }
>> +        break;
>=20
> Newlines after break statements=2E

Ok

>> diff --git a/tools/firmware/hvmloader/pci_regs=2Eh b/tools/firmware/hvm=
loader/pci_regs=2Eh
>> index 4d4dc0cd01=2E=2Ec94278855b 100644
>> --- a/tools/firmware/hvmloader/pci_regs=2Eh
>> +++ b/tools/firmware/hvmloader/pci_regs=2Eh
>> @@ -111,6 +111,10 @@
>>  #define PCI_DEVICE_ID_INTEL_82441        0x1237
>>  #define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
>> =20
>> +#define PCI_CLASS_STORAGE_IDE            0x0101
>> +#define PCI_CLASS_DISPLAY_VGA            0x0300
>> +#define PCI_CLASS_BRIDGE_OTHER           0x0680
>=20
> As mentioned in a previous patch, this would better be placed in a
> pci_ids=2Eh header=2E

Sure, will do=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.9e.1604d895d609bd5f.19ebb478295.4ebf08a4ccc32d2=---

