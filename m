Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JIC3NSHZK2pbGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D66788F7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=pn+pj8Te;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336509.1598371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyi6-0006bz-Ib; Fri, 12 Jun 2026 10:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336509.1598371; Fri, 12 Jun 2026 10:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyi6-0006YS-Ed; Fri, 12 Jun 2026 10:01:58 +0000
Received: by outflank-mailman (input) for mailman id 1336509;
 Fri, 12 Jun 2026 10:01:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47f3b1000701b@swg.vates.tech>)
 id 1wXyi4-0006Es-U1
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyi4-00D9qT-AB
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47f3b1000701b@swg.vates.tech>)
 id 6a2bd90b-5cb7-0a2a0a5109dd-0a2a4504a10a-28
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:56 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47f3b1000701b@swg.vates.tech>)
 id 6a2bd910-1dec-0a2a45040019-b9ff1c12b34f-5
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb47f3b1000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:55 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id A88F386509;
 Fri, 12 Jun 2026 12:01:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=vvYWXAhDfi/K43ZJ3M5MXl0m5lIQeCMCqJFFe7ErX2k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=pn+pj8Teq2OSAPXl+7Ox4luXFDrmY7p0earYTDjgvH5vQgo9LqIRuvuqwBDUsVF4GKjPXMbbr
 NzjzWVzJkn43lP623wsdKuXbWlLH2HNH+Ipl9g39dDuxQp8CT9xdX2oDzt5kzeCxesazKN3/MgB
 I/zwm1Dw87nGZiP8odNGENmaeEpBcPtEfqtw2yejxIISBeXC9WaWva2lJmo2bcK+klmxlhFUyeB
 r5St88HmCIaOrgba7dc9vZQ7j3FhTcm8cset2xgbe5wvfxXXQQ9xJvYltjNZllU9SaRnQFEU3MS
 0x0oiXu41e41/vzYibNIBZt8OrZrSyIdesk3kh8QRFUA==
X-Zone-Loop: a50bc79f334c8345876e5ea4354e00800b8855f5c96b
x-campaign-type: default
x-transaction-id: 9d9368f4-7e90-4035-b1ea-90324fbbca58
x-swg-uid: 01-1b48acef-94ab-41bb-8ed6-07de46ad6fc7
X-Mailer: Sweego
Message-ID:
 <1781258515.8631fc262581453bbf619ec5b2062170.19ebb47f3b1000701b@vates.tech>
x-swg-bid: 1781258515.8631fc262581453bbf619ec5b2062170.19ebb47f3b1000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 11/17] hvmloader: allocate MMCONFIG area in the MMIO hole
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-12-thierry.escande@vates.tech>
 <afHPdxc72FDGnQoq@macbook.local>
Content-Language: en-US
In-Reply-To: <afHPdxc72FDGnQoq@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a5.41b66890c2b53957.19ebb47f22e.2eb5fe2545d91601=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258514990
X-purgate-ID: tlsNG-ebf023/1781258516-435683FF-DA1B4582/0/0
X-purgate-type: clean
X-purgate-size: 7017
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
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
X-Rspamd-Queue-Id: 881D66788F7

---=Part.a5.41b66890c2b53957.19ebb47f22e.2eb5fe2545d91601=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/29/26 11:29, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
>> The actual MMCONFIG size depends on the number of PCI buses available
>> which should be covered by ECAM=2E Possible options are 64MB, 128MB and
>> 256MB=2E
>=20
> Are such values inherited from the real q35 impleemntation?
>=20
> AFAICT the ACPI MCFG spec notes:
>=20
> "The size of the memory mapped configuration region is indicated by
> the start and end bus number fields in the Memory mapped Enhanced
> configuration space base address allocation structure as shown in
> Table 4-3=2E 0-255 is the range of allowed bus numbers supported for a
> given PCI Segment Group=2E"
>=20
> So it's in principle possible to specify a MCFG that covers a single
> bus, and then it would have a size of 256 * 4K =3D 1M=2E  Which avoids
> wasting 63M of MMIO space in the low MMIO hole that's already fairly
> tight on space=2E
>=20
> Is this limitation possibly inherited from the way the ECAM region
> position and size must be notified to the chipset?
>=20
> And further seeing the code below - I found the answer myself, it's
> because the chipset only supports negotiation those ECAM sizes=2E  We
> could possibly expose a smaller region in MCFG, but doesn't seem like
> a good move=2E

Yes indeed, it's a waste of space in MMIO hole=2E Maybe it's ok to only
allocate the 1MB needed for 1 bus since there would be no reason for a
guest to access passed the 1st MB=2E I can give it a try but that's
possibly risky=2E=2E=2E

>=20
>> As Xen is limited to the bus 0 currently, the lowest possible
>> setting is used (64MB), defined via PCI_MAX_MCFG_BUSES in
>> hvmloader/config=2Eh=2E When multiple PCI buses support for Xen will be
>> implemented, PCI_MAX_MCFG_BUSES may be replaced by a calculation of the
>> number of buses according to PCI devices enumeration=2E
>>
>> The MMCONFIG entry is inserted into bars array in the same manner like
>> for any other BARs=2E In this case, the devfn field will point to MCH P=
CI
>> device and bar_reg will contain PCIEXBAR register offset=2E It will be
>> assigned a slot in the MMIO hole later in a very same way like for plai=
n
>> PCI BARs, with respect to its size and alignment=2E At this point, the
>> actual base address and size of the ECAM space are passed to Xen using
>> the HVMOP_set_ecam_space hypercall=2E
>>
>> Signed-off-by: Alexey Gerasimenko <x1917x@gmail=2Ecom>
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  tools/firmware/hvmloader/config=2Eh   |  4 +++
>>  tools/firmware/hvmloader/pci=2Ec      | 55 +++++++++++++++++++++++++++=
++
>>  tools/firmware/hvmloader/pci_regs=2Eh |  7 ++++
>>  3 files changed, 66 insertions(+)
>>
>> diff --git a/tools/firmware/hvmloader/config=2Eh b/tools/firmware/hvmlo=
ader/config=2Eh
>> index baaed91c7f=2E=2Eaa3158bca5 100644
>> --- a/tools/firmware/hvmloader/config=2Eh
>> +++ b/tools/firmware/hvmloader/config=2Eh
>> @@ -55,6 +55,10 @@ extern uint32_t *cpu_to_apicid;
>>  #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
>>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connec=
ted */
>>  #define PCI_ICH9_LPC_DEVFN  0xf8    /* dev 31, fn 0 */
>> +#define PCI_MCH_DEVFN       0       /* bus 0, dev 0, func 0 */
>> +
>> +/* possible values are: 64, 128, 256 */
>> +#define PCI_MAX_MCFG_BUSES  64
>> =20
>>  #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
>> =20
>> diff --git a/tools/firmware/hvmloader/pci=2Ec b/tools/firmware/hvmloade=
r/pci=2Ec
>> index 6e6720adae=2E=2E54c23ffdd8 100644
>> --- a/tools/firmware/hvmloader/pci=2Ec
>> +++ b/tools/firmware/hvmloader/pci=2Ec
>> @@ -413,6 +413,58 @@ void pci_setup(void)
>>          pci_devfn_decode_type[devfn] |=3D PCI_COMMAND_MASTER;
>>      }
>> =20
>> +    /*
>> +     *  Calculate MMCONFIG area size and squeeze it into the bars arra=
y
>> +     *  for assigning a slot in the MMIO hole
>> +     */
>> +    if ( is_running_on_q35 )
>> +    {
>> +        /* disable PCIEXBAR decoding for now */
>> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR, 0);
>> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR + 4, 0);
>> +
>> +        switch ( PCI_MAX_MCFG_BUSES )
>> +        {
>> +        case 64:
>> +            bar_data =3D PCIEXBAR_64_BUSES | PCIEXBAR_ENABLE;
>> +            bar_sz =3D MB(64);
>> +            break;
>> +
>> +        case 128:
>> +            bar_data =3D PCIEXBAR_128_BUSES | PCIEXBAR_ENABLE;
>> +            bar_sz =3D MB(128);
>> +            break;
>> +
>> +        case 256:
>> +            bar_data =3D PCIEXBAR_256_BUSES | PCIEXBAR_ENABLE;
>> +            bar_sz =3D MB(256);
>> +            break;
>> +
>> +        default:
>> +            /* unsupported number of buses specified */
>> +            BUG();
>> +        }
>> +
>> +        addr_mask =3D ~(bar_sz - 1);
>> +
>> +        for ( i =3D 0; i < nr_bars; i++ )
>> +            if ( bars[i]=2Ebar_sz < bar_sz )
>> +                break;
>> +
>> +        if ( i !=3D nr_bars )
>> +            memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars))=
;
>> +
>> +        bars[i]=2Eis_mem    =3D 1;
>> +        bars[i]=2Edevfn     =3D PCI_MCH_DEVFN;
>> +        bars[i]=2Ebar_reg   =3D PCI_MCH_PCIEXBAR;
>> +        bars[i]=2Ebar_sz    =3D bar_sz;
>> +        bars[i]=2Eaddr_mask =3D addr_mask;
>> +        bars[i]=2Ebar_data  =3D bar_data;
>> +
>> +        mmio_total +=3D bar_sz;
>> +        nr_bars++;
>> +    }
>=20
> I think it might be best if the ECAM fake BAR is the first element in
> the bars array, so we ensure it's the first item to consume memory
> from the low MMIO hole=2E  Not sure how that will work with the current
> sorting of the resources based on their size, but it's imperative for
> hvmloader to attempt to position ECAM ahead of the other device
> resources IMO=2E

With a size of 64MB it's always placed first from what I can tell=2E I
don't get why it is imperative=2E Would it be to make sure that it is
actually allocated in the first 4GB?

>=20
>> +
>>      if ( mmio_hole_size )
>>      {
>>          uint64_t max_ram_below_4g =3D GB(4) - mmio_hole_size;
>> @@ -592,6 +644,9 @@ void pci_setup(void)
>>              }
>>          }
>> =20
>> +        if ( bar_reg =3D=3D PCI_MCH_PCIEXBAR )
>> +            hvm_set_ecam_space(base, bar_sz);
>=20
> As noted in a previous patch, it would be better if it's QEMU (as part
> of handling the PCI_MCH_PCIEXBAR writes) that notifies Xen of the ECAM
> window placement=2E

Yes, as mentioned earlier I can do it that way=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a5.41b66890c2b53957.19ebb47f22e.2eb5fe2545d91601=---

