Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nQogAibZK2pjGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24D678901
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=loMi435A;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336514.1598380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyiC-0007Kx-Qq; Fri, 12 Jun 2026 10:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336514.1598380; Fri, 12 Jun 2026 10:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyiC-0007Hj-Mx; Fri, 12 Jun 2026 10:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1336514;
 Fri, 12 Jun 2026 10:02:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb480060000701b@swg.vates.tech>)
 id 1wXyiA-00075q-MN
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:02:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyiA-0056qV-33
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:02:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb480060000701b@swg.vates.tech>)
 id 6a2bd918-bab6-0a2a0a5309dd-0a2a4505e16c-16
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:02:02 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb480060000701b@swg.vates.tech>)
 id 6a2bd919-aaa8-0a2a45050019-b9ff1c12838b-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:02:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb480060000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:58 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id E748C8617A;
 Fri, 12 Jun 2026 12:01:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=W2PIqGnQPJCzpPlFJa/o78PGJAT62z/Jp0r1WifCJts=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=loMi435AcmY+Oh1gmCMoTG1DhGHggkbfoWDNIClZuSPrceyw7O4HpAp6dFzAOuvXGLihO+9Sy
 WrQdUStk6yLaz+IGmyYD954PUvWY2j+QN9I7WykfleGQyklePRCUuD1HqM8ejIJ7LZ5FPD2EjJm
 KZMaZo0sIHZTCwyjvhLF7Y0akHKlB+i1qA8JEjNr3Odxzy8dwBIZQvX1NjpLQX2yLDMIsEJOS1h
 b/8Zm8gk3GPOuwZOINTM1LWPTtOXgF20HDQXMlJMgmBMgqOTEHXSXNJhFHsZkMWi5957l/iNb3+
 BKSRnbf30yIE7AZoQDdjI2uYOm3okj+iGx3dBNk0XqPQ==
X-Zone-Loop: b1f71015f4aec160f60e3f94f6cadf48b56e32c2833a
x-campaign-type: default
x-transaction-id: bcd295d9-146d-4bb6-922d-88706975e08d
x-swg-uid: 01-a4b653a8-9df2-4ac5-bf23-ef8e0fc6aacb
X-Mailer: Sweego
Message-ID:
 <1781258518.8631fc262581453bbf619ec5b2062170.19ebb480060000701b@vates.tech>
x-swg-bid: 1781258518.8631fc262581453bbf619ec5b2062170.19ebb480060000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:57 +0200
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
 <f6521590-e51c-4f00-bcf8-faee79a5d3a5@suse.com>
 <afiPsnPYJCtm7VmH@macbook.local>
Content-Language: en-US
In-Reply-To: <afiPsnPYJCtm7VmH@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a6.4e997faf0f1432c7.19ebb47fede.554d8f88cc1a56d9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258518238
X-purgate-ID: tlsNG-c201ff/1781258522-D3F66443-D46FE2C2/0/0
X-purgate-type: clean
X-purgate-size: 3629
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
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
X-Rspamd-Queue-Id: 9A24D678901

---=Part.a6.4e997faf0f1432c7.19ebb47fede.554d8f88cc1a56d9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 5/4/26 14:23, Roger Pau Monn=C3=A9 wrote:
> On Mon, May 04, 2026 at 01:11:44PM +0200, Jan Beulich wrote:
>> On 29=2E04=2E2026 11:29, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
>>>> --- a/tools/firmware/hvmloader/pci=2Ec
>>>> +++ b/tools/firmware/hvmloader/pci=2Ec
>>>> @@ -413,6 +413,58 @@ void pci_setup(void)
>>>>          pci_devfn_decode_type[devfn] |=3D PCI_COMMAND_MASTER;
>>>>      }
>>>> =20
>>>> +    /*
>>>> +     *  Calculate MMCONFIG area size and squeeze it into the bars ar=
ray
>>>> +     *  for assigning a slot in the MMIO hole
>>>> +     */
>>>> +    if ( is_running_on_q35 )
>>>> +    {
>>>> +        /* disable PCIEXBAR decoding for now */
>>>> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR, 0);
>>>> +        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR + 4, 0);
>>>> +
>>>> +        switch ( PCI_MAX_MCFG_BUSES )
>>>> +        {
>>>> +        case 64:
>>>> +            bar_data =3D PCIEXBAR_64_BUSES | PCIEXBAR_ENABLE;
>>>> +            bar_sz =3D MB(64);
>>>> +            break;
>>>> +
>>>> +        case 128:
>>>> +            bar_data =3D PCIEXBAR_128_BUSES | PCIEXBAR_ENABLE;
>>>> +            bar_sz =3D MB(128);
>>>> +            break;
>>>> +
>>>> +        case 256:
>>>> +            bar_data =3D PCIEXBAR_256_BUSES | PCIEXBAR_ENABLE;
>>>> +            bar_sz =3D MB(256);
>>>> +            break;
>>>> +
>>>> +        default:
>>>> +            /* unsupported number of buses specified */
>>>> +            BUG();
>>>> +        }
>>>> +
>>>> +        addr_mask =3D ~(bar_sz - 1);
>>>> +
>>>> +        for ( i =3D 0; i < nr_bars; i++ )
>>>> +            if ( bars[i]=2Ebar_sz < bar_sz )
>>>> +                break;
>>>> +
>>>> +        if ( i !=3D nr_bars )
>>>> +            memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars=
));
>>>> +
>>>> +        bars[i]=2Eis_mem    =3D 1;
>>>> +        bars[i]=2Edevfn     =3D PCI_MCH_DEVFN;
>>>> +        bars[i]=2Ebar_reg   =3D PCI_MCH_PCIEXBAR;
>>>> +        bars[i]=2Ebar_sz    =3D bar_sz;
>>>> +        bars[i]=2Eaddr_mask =3D addr_mask;
>>>> +        bars[i]=2Ebar_data  =3D bar_data;
>>>> +
>>>> +        mmio_total +=3D bar_sz;
>>>> +        nr_bars++;
>>>> +    }
>>>
>>> I think it might be best if the ECAM fake BAR is the first element in
>>> the bars array, so we ensure it's the first item to consume memory
>>> from the low MMIO hole=2E  Not sure how that will work with the curren=
t
>>> sorting of the resources based on their size, but it's imperative for
>>> hvmloader to attempt to position ECAM ahead of the other device
>>> resources IMO=2E
>>
>> Why would this be?
>=20
> I would assume it's best to have ECAM access in the low 4G (for 32bit
> OSes) at the expense of some 32bit BARs possibly not fitting in the
> 32bit space=2E  But the ECAM space could be placed above 4G, and 32bit
> OSes might not care much about extended address space capabilities=2E

Ok, so that replies my previous question=2E

As mentioned earlier, if we agree on the ECAM region being placed first
in MMIO hole, then we don't care who set it up (toolstack, hvmloader,
firmware)=2E It is setup (for now by hvmloader) if we detect a Q35 chipset=
=2E

Regards,



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a6.4e997faf0f1432c7.19ebb47fede.554d8f88cc1a56d9=---

