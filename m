Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n3JlDAXZK2o4GQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A6D6788C3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=IEOOb7W8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336484.1598298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhe-0003NW-VC; Fri, 12 Jun 2026 10:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336484.1598298; Fri, 12 Jun 2026 10:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhe-0003LP-Q9; Fri, 12 Jun 2026 10:01:30 +0000
Received: by outflank-mailman (input) for mailman id 1336484;
 Fri, 12 Jun 2026 10:01:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb477688000701b@swg.vates.tech>)
 id 1wXyhd-0003EE-30
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhc-00FkJb-Fp
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb477688000701b@swg.vates.tech>)
 id 6a2bd8f8-5cb7-0a2a0a5109dd-0a2a4501caa6-0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:28 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb477688000701b@swg.vates.tech>)
 id 6a2bd8f7-c1f2-0a2a45010019-b9ff1c129d19-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb477688000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:23 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id BFF6B86445;
 Fri, 12 Jun 2026 12:01:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=xh2R9waaTNMlfuIpEZ+fmHJLfYoYS0YH6zSSnkU3BXg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=IEOOb7W8uDwv9SWRXxK6GTMFjF1YEnPkPeCX9+O9GSfDktzjqVNOIfu2eJI65H84DGYrUuNWd
 UNVI/m2+hCW54UMgg0i4+0FgD/yoN6eqnbtslzxRizdQYwPIwLvX8BV+ZDbi1X4imYUxQh+P3Nw
 H/+hgS0DKiVwC/+gPVwB98Cn+WzO7NUBw8oC/4hzWLTX74Qk1GJfBhqdlvSxgd4Mg46vYOu4ti3
 ISbdgK8L8nvZYbe9FZ3jID5X9aPYSYCLVdqfXk/fkK9MMkA2nzuEbn3vTTfrJ+kwPwFafYrvvJa
 IacRp8kRfZ0sfTLWbhfhfQ3zbIL3s4qaGOVkDlNMTtIA==
X-Zone-Loop: cd387740805893fc041fcdc0bfb1211f7ed0b1514b48
x-campaign-type: default
x-transaction-id: 8c2abd98-fde3-4191-8203-2d01627deb66
x-swg-uid: 01-50646aa8-31a4-4cc4-8376-51b9307fa75c
X-Mailer: Sweego
Message-ID:
 <1781258483.8631fc262581453bbf619ec5b2062170.19ebb477688000701b@vates.tech>
x-swg-bid: 1781258483.8631fc262581453bbf619ec5b2062170.19ebb477688000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 05/17] hvmloader: add Q35 DSDT table loading
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-6-thierry.escande@vates.tech>
 <afCVKAelR1ZyGB2U@macbook.local>
Content-Language: en-US
In-Reply-To: <afCVKAelR1ZyGB2U@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9d.e6c60d5e013701e0.19ebb4774ff.df584024bd427cbf=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258482943
X-purgate-ID: tlsNG-d62444/1781258488-AE55DFF4-CF16CEF1/0/0
X-purgate-type: clean
X-purgate-size: 4426
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
X-Rspamd-Queue-Id: A1A6D6788C3

---=Part.9d.e6c60d5e013701e0.19ebb4774ff.df584024bd427cbf=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/28/26 13:08, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:02PM +0000, Thierry Escande wrote:
>> This patch allows to select Q35 DSDT table in the function
>> hvmloader_acpi_build_tables()=2E The machine_type global variable is us=
ed
>> to select a proper table (i440/q35)=2E
>>
>> As we are bound to the qemu-xen device model for Q35, there is no need
>> to initialize config->dsdt_15cpu/config->dsdt_15cpu_len fields=2E
>>
>> Signed-off-by: Alexey Gerasimenko <x1917x@gmail=2Ecom>
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  tools/firmware/hvmloader/util=2Ec | 17 +++++++++++++++--
>>  tools/firmware/hvmloader/util=2Eh |  2 ++
>>  2 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/firmware/hvmloader/util=2Ec b/tools/firmware/hvmload=
er/util=2Ec
>> index f9116bea4d=2E=2E45519ea583 100644
>> --- a/tools/firmware/hvmloader/util=2Ec
>> +++ b/tools/firmware/hvmloader/util=2Ec
>> @@ -885,8 +885,21 @@ void hvmloader_acpi_build_tables(struct acpi_confi=
g *config,
>>      s =3D xenstore_read("platform/device-model", "");
>>      if ( !strncmp(s, "qemu_xen", 9) )
>=20
> Tying Q35 to xenstore seems a bit sub-optimal, as Q35 detection is
> done purely from the PCI config space=2E  It would be better if we could
> avoid relying on the xenstore node, and hence also fixup at least
> ovmf_acpi_build_tables() and seabios_acpi_build_tables() to use the
> Q35 ACPI tables when Q35 is detected, regardless of the device-model
> xenstore node=2E

Looking at the acpi_build_tables() for ovmf, seabios, and rombios, I
suppose the idea here was to set the correct ACPI tables for guest using
Rombios with qemu-xen=2E

So I can move the qemu-xen check in rombios_acpi_build_tables() and do
the machine_type check in all acpi_build_tables callbacks=2E I'm a bit
puzzled by the duplication, though=2E=2E=2E

>=20
>>      {
>> -        config->dsdt_anycpu =3D dsdt_i440_anycpu_qemu_xen;
>> -        config->dsdt_anycpu_len =3D dsdt_i440_anycpu_qemu_xen_len;
>> +        switch ( machine_type )
>> +        {
>> +        case MACHINE_TYPE_Q35:
>> +            config->dsdt_anycpu =3D dsdt_q35_anycpu_qemu_xen;
>> +            config->dsdt_anycpu_len =3D dsdt_q35_anycpu_qemu_xen_len;
>> +            break;
>> +        case MACHINE_TYPE_I440:
>> +            config->dsdt_anycpu =3D dsdt_i440_anycpu_qemu_xen;
>> +            config->dsdt_anycpu_len =3D dsdt_i440_anycpu_qemu_xen_len;
>> +            break;
>> +        default:
>> +            /* Not likely to happen */
>> +            BUG();
>> +        }
>> +
>>          config->dsdt_15cpu =3D NULL;
>>          config->dsdt_15cpu_len =3D 0;
>>      }
>> diff --git a/tools/firmware/hvmloader/util=2Eh b/tools/firmware/hvmload=
er/util=2Eh
>> index 2f37504aca=2E=2E4641ca0c46 100644
>> --- a/tools/firmware/hvmloader/util=2Eh
>> +++ b/tools/firmware/hvmloader/util=2Eh
>> @@ -393,7 +393,9 @@ bool check_overlap(uint64_t start, uint64_t size,
>>                     uint64_t reserved_start, uint64_t reserved_size);
>> =20
>>  extern const unsigned char dsdt_i440_anycpu_qemu_xen[], dsdt_anycpu[],=
 dsdt_15cpu[];
>> +extern const unsigned char dsdt_q35_anycpu_qemu_xen[];
>=20
> If I'm not mistaken, patch 2 introduces the dsdt_q35_anycpu_qemu_xen
> symbol to the hvmloader build, so that you can reference it here?
>=20
> At first I was going to comment that you are referencing a symbol not
> included in the patch, but I think such symbol was previously added to
> the build in patch 2 (and was unused there)=2E

Right, dsdt_q35_anycpu_qemu_xen=2Ec that declares
dsdt_q35_anycpu_qemu_xen[] is generated by patch 2 and used in this patch=
=2E

>=20
>>  extern const int dsdt_i440_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_=
15cpu_len;
>> +extern const int dsdt_q35_anycpu_qemu_xen_len;
>=20
> unsigned int would be better here=2E

Yes, that will be done in a previous patch when dsdt_anycpu_qemu_xen_len
is renamed to dsdt_i440_anycpu_qemu_xen_len=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.9d.e6c60d5e013701e0.19ebb4774ff.df584024bd427cbf=---

