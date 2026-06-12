Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q2LkIfrYK2ozGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7599D6788AE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=aKL6+EBo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336479.1598290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhY-0002uT-MM; Fri, 12 Jun 2026 10:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336479.1598290; Fri, 12 Jun 2026 10:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhY-0002rN-IV; Fri, 12 Jun 2026 10:01:24 +0000
Received: by outflank-mailman (input) for mailman id 1336479;
 Fri, 12 Jun 2026 10:01:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb476458000701b@swg.vates.tech>)
 id 1wXyhX-0002lp-5o
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhW-009Pc1-I7
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb476458000701b@swg.vates.tech>)
 id 6a2bd8ec-e002-0a2a0a5209dd-0a2a4506c066-22
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:22 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb476458000701b@swg.vates.tech>)
 id 6a2bd8ec-7371-0a2a45060019-b9ff1c128cb5-4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb476458000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:18 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1A1F086445;
 Fri, 12 Jun 2026 12:01:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Hmxf8p1byidHbSD/narBC20xyG5TgvPQOei13uwg3Ko=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=aKL6+EBoZYn/7Yb0GirVDHsuJkuP7ffCvLLY0S/Jj8YExmit6Bik0qa2PJivvppx1L8g5Gymg
 1wN2YkBvtpPkJD+Edug903J4Etzb28CdK6yTsCvlnj0jBqMqw6/Li5dN9IMGNnHoPvjNKl6UOks
 iP/Fo7oDLeOUmJP7pgCTmKInqlrRnxMv63r+HnsAXm1Rm10T8QoD0cN5L88Fg0vUmzJUuBwZ5sm
 sS1cEGPx/nS+N0l0W2LCZ3gHv6vyDhcYvFP/4J926Flur0jk/W/t8otTaX3qfu3kPCG10cW9wJC
 O07R/fmuNtnUy2WUmsNt8yZAusHw9imSqPpKr1XCe00Q==
X-Zone-Loop: d817cea9fb2c4a1e1413a5caebb9f619f6e17a1363db
x-campaign-type: default
x-transaction-id: a0f68d93-5f96-40af-a125-4cf2c9ba84d6
x-swg-uid: 01-900e4c06-9835-432e-8ec2-2ae6941ba1fe
X-Mailer: Sweego
Message-ID:
 <1781258478.8631fc262581453bbf619ec5b2062170.19ebb476458000701b@vates.tech>
x-swg-bid: 1781258478.8631fc262581453bbf619ec5b2062170.19ebb476458000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 03/17] hvmloader: add function to set the emulated machine
 type (i440/Q35)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-4-thierry.escande@vates.tech>
 <9f67c3ee-4450-4d4b-b03c-66ac1aa63014@suse.com>
Content-Language: en-US
In-Reply-To: <9f67c3ee-4450-4d4b-b03c-66ac1aa63014@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9c.4e937718b81e8a5a.19ebb4762d1.6263379c9ef8814c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258478290
X-purgate-ID: tlsNG-16d1c6/1781258482-86369D75-753689DA/0/0
X-purgate-type: clean
X-purgate-size: 2009
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7599D6788AE

---=Part.9c.4e937718b81e8a5a.19ebb4762d1.6263379c9ef8814c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 5/4/26 16:43, Jan Beulich wrote:
> On 13=2E03=2E2026 17:35, Thierry Escande wrote:
>> @@ -648,6 +649,47 @@ void __bug(const char *file, int line)
>>      crash();
>>  }
>> =20
>> +machine_type_t machine_type;
>> +
>> +void init_pc_machine_type(void)
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
>=20
> Nit: Comment style=2E

That's for the missing capital on the first word and full stop, right?

>=20
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
>=20
> Nit: Labels indented by at least one blank please=2E
>=20
>> +    printf("Unknown emulated chipset encountered, VID=3D%04Xh, DID=3D%=
04Xh\n",
>> +           vendor_id, device_id);
>> +    BUG();
>=20
> Can't this be moved up into the default case, thus avoiding "goto" and l=
abel
> altogether?

There is already a goto error on the vendor ID check=2E That makes it more
readable imo=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.9c.4e937718b81e8a5a.19ebb4762d1.6263379c9ef8814c=---

