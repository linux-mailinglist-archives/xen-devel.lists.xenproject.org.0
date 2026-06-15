Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vBKcCdUOMGqLMgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:40:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D368743F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:40:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=sEYXrHAu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1338334.1599365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ8TT-0001Fm-OH; Mon, 15 Jun 2026 14:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338334.1599365; Mon, 15 Jun 2026 14:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ8TT-0001Cv-Kz; Mon, 15 Jun 2026 14:39:39 +0000
Received: by outflank-mailman (input) for mailman id 1338334;
 Mon, 15 Jun 2026 14:39:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b@swg.vates.tech>)
 id 1wZ8TS-0001CQ-K6
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:39:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ8TS-002Dvf-0B
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:39:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b@swg.vates.tech>)
 id 6a300ea9-bab6-0a2a0a5309dd-0a2a4508e956-2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:39:37 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b@swg.vates.tech>)
 id 6a300ea9-63b5-0a2a45080019-b9ff1c128055-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:39:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ecbb938f1000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 15 Jun 2026 14:39:34 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 59A8C8125B;
 Mon, 15 Jun 2026 16:39:33 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=YeBSKmM3d45xA6mIhYRKKU6RC0gpVbPgpdW9t0dv/44=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sEYXrHAuYo6ST1E1HOsevB1sGRNaI1qEDC3AetveRxQfVtGjon2ZebLDLyKoJGM3JK9K/El9Y
 fUCYiEvnU+TZnLSU2AbbV4KZFLOiwMQHuvEqHqlEjy7qhROIr2S/En5EJu/CYuAoM3im8QhlyXM
 rtvNcABM9mFT3ClWf0dLhf6OzEtHgI9eHwNycFGYM6WXf9rKcXaB9iV84mDc1AsRDwtkfb0H0gU
 M0/Gx5tMZpwsCNhVKW46ZmFdMpwCUY4ZtX82zKQz8NDQuLL5SCNiUvvgt5UiJ8x+kz0AoZ9Lgh/
 JvRrWk/sRnZjoEuXjsLQFpasFryYFsdv7Y1vUCkX8Y7w==
X-Zone-Loop: a01599c3c2de43949be69a82c4da69a760ba6154ea55
x-campaign-type: default
x-transaction-id: 8074d41c-f4b4-4135-9430-f1e30700aa79
x-swg-uid: 01-054d54a4-e51d-4d08-b66a-127303647617
X-Mailer: Sweego
Message-ID:
 <1781534374.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b@vates.tech>
x-swg-bid: 1781534374.8631fc262581453bbf619ec5b2062170.19ecbb938f1000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 15 Jun 2026 16:39:33 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl>
 <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
 <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
 <1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bfb000701b@vates.tech>
 <ai-_jUw0QmdC7gPK@macbook.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ai-_jUw0QmdC7gPK@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.28b.5658017691e213a8.19ecbb9368b.8bb43b920ff56cd9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781534373516
X-purgate-ID: tlsNG-c1860d/1781534377-BD56FDB1-D8768867/0/0
X-purgate-type: clean
X-purgate-size: 13404
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B7D368743F

---=Part.28b.5658017691e213a8.19ecbb9368b.8bb43b920ff56cd9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:02:05AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 12, 2026 at 05:17:31PM +0200, Anthony PERARD wrote:
> > On Fri, Jun 12, 2026 at 03:32:00PM +0100, Andrew Cooper wrote:
> > > On 12/06/2026 3:20 pm, Jan Beulich wrote:
> > > > On 12=2E06=2E2026 16:18, Andrew Cooper wrote:
> > > >> Well, no intended change=2E=C2=A0 It was a very big patch=2E
> > > >>
> > > >> Nothing should ever be using efi_get_time()=2E=C2=A0 It's unusabl=
e (i=2Ee=2E
> > > >> crashing) on hundreds of millions of machines=2E
> > > >>
> > > >> So, while we obviously do need to fix the assertion, this is "onl=
y"
> > > >> collateral damage from having fallen into the efi_get_time() path=
 in the
> > > >> first place=2E=C2=A0 That wants investigating too=2E
> > > > Perhaps a reduced-hardware system with ACPI_FADT_NO_CMOS_RTC set?
> > >=20
> > > The identified system is a Broadwell-D=2E
> > >=20
> > > Come to think of it, there were some systems of that era which (fals=
ely)
> > > claimed to have no CMOS=2E=C2=A0 (An HP Haswell Blade comes to mind,=
 but it
> > > will be a similar chipset=2E)
> >=20
> > Some info from the boot log about the machine:
> >     HPE ProLiant m510 Server Cartridge
> >     BIOS Version: H05 v1=2E98 (02/02/2023)
> >     System Memory: 32 GB
> >     1 Processor(s) detected, 8 total cores enabled, Hyperthreading is =
enabled
> >     Proc 1: Intel(R) Xeon(R) CPU D-1548 @ 2=2E00GHz
> >     HPE Power Profile Mode: Custom
> >     Power Regulator Mode: Dynamic Power Savings
> >     Advanced Memory Protection Mode: Advanced ECC Support
> >     Boot Mode: UEFI
> >     HPE SmartMemory authenticated in all populated DIMM slots=2E
> >=20
> > One of the cartridge on a Moonshot=2E
> >=20
> > > > On such systems efi_get_time() would better work properly=2E
> >=20
> > I guess it works fine on this system=2E On a different cartridge, with=
 a
> > Xen build prior to the commit, I have in the boot logs:
> >=20
> >     Wallclock source: EFI
>=20
> Can you provide the decoded dump of the ACPI FADT table?

Sure, I hope it's the right one, it seems I needed to look for FACP
instead of FADT, here we go:

/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20221020 (64-bit version)
 * Copyright (c) 2000 - 2022 Intel Corporation
 *
 * Disassembly of facp=2Edat, Mon Jun 15 14:29:25 2026
 *
 * ACPI Data Table [FACP]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (i=
n hex)
 */

[000h 0000 004h]                   Signature : "FACP"    [Fixed ACPI Descr=
iption Table (FADT)]
[004h 0004 004h]                Table Length : 0000010C
[008h 0008 001h]                    Revision : 05
[009h 0009 001h]                    Checksum : ED
[00Ah 0010 006h]                      Oem ID : "HP    "
[010h 0016 008h]                Oem Table ID : "ProLiant"
[018h 0024 004h]                Oem Revision : 00000001
[01Ch 0028 004h]             Asl Compiler ID : "HP  "
[020h 0032 004h]       Asl Compiler Revision : 00000001

[024h 0036 004h]                FACS Address : 7B581000
[028h 0040 004h]                DSDT Address : 7B7E2000
[02Ch 0044 001h]                       Model : 00
[02Dh 0045 001h]                  PM Profile : 04 [Enterprise Server]
[02Eh 0046 002h]               SCI Interrupt : 0009
[030h 0048 004h]            SMI Command Port : 000000B2
[034h 0052 001h]           ACPI Enable Value : A0
[035h 0053 001h]          ACPI Disable Value : A1
[036h 0054 001h]              S4BIOS Command : 00
[037h 0055 001h]             P-State Control : 00
[038h 0056 004h]    PM1A Event Block Address : 00000400
[03Ch 0060 004h]    PM1B Event Block Address : 00000000
[040h 0064 004h]  PM1A Control Block Address : 00000404
[044h 0068 004h]  PM1B Control Block Address : 00000000
[048h 0072 004h]   PM2 Control Block Address : 00000450
[04Ch 0076 004h]      PM Timer Block Address : 00000408
[050h 0080 004h]          GPE0 Block Address : 00000420
[054h 0084 004h]          GPE1 Block Address : 00000000
[058h 0088 001h]      PM1 Event Block Length : 04
[059h 0089 001h]    PM1 Control Block Length : 02
[05Ah 0090 001h]    PM2 Control Block Length : 01
[05Bh 0091 001h]       PM Timer Block Length : 04
[05Ch 0092 001h]           GPE0 Block Length : 10
[05Dh 0093 001h]           GPE1 Block Length : 00
[05Eh 0094 001h]            GPE1 Base Offset : 00
[05Fh 0095 001h]                _CST Support : 00
[060h 0096 002h]                  C2 Latency : 0065
[062h 0098 002h]                  C3 Latency : 03E9
[064h 0100 002h]              CPU Cache Size : 0000
[066h 0102 002h]          Cache Flush Stride : 0000
[068h 0104 001h]           Duty Cycle Offset : 01
[069h 0105 001h]            Duty Cycle Width : 00
[06Ah 0106 001h]         RTC Day Alarm Index : 0D
[06Bh 0107 001h]       RTC Month Alarm Index : 00
[06Ch 0108 001h]           RTC Century Index : 32
[06Dh 0109 002h]  Boot Flags (decoded below) : 0033
               Legacy Devices Supported (V2) : 1
            8042 Present on ports 60/64 (V2) : 1
                        VGA Not Present (V4) : 0
                      MSI Not Supported (V4) : 0
                PCIe ASPM Not Supported (V4) : 1
                   CMOS RTC Not Present (V5) : 1
[06Fh 0111 001h]                    Reserved : 00
[070h 0112 004h]       Flags (decoded below) : 000004A5
      WBINVD instruction is operational (V1) : 1
              WBINVD flushes all caches (V1) : 0
                    All CPUs support C1 (V1) : 1
                  C2 works on MP system (V1) : 0
            Control Method Power Button (V1) : 0
            Control Method Sleep Button (V1) : 1
        RTC wake not in fixed reg space (V1) : 0
            RTC can wake system from S4 (V1) : 1
                        32-bit PM Timer (V1) : 0
                      Docking Supported (V1) : 0
               Reset Register Supported (V2) : 1
                            Sealed Case (V3) : 0
                    Headless - No Video (V3) : 0
        Use native instr after SLP_TYPx (V3) : 0
              PCIEXP_WAK Bits Supported (V4) : 0
                     Use Platform Timer (V4) : 0
               RTC_STS valid on S4 wake (V4) : 0
                Remote Power-on capable (V4) : 0
                 Use APIC Cluster Model (V4) : 0
     Use APIC Physical Destination Mode (V4) : 0
                       Hardware Reduced (V5) : 0
                      Low Power S0 Idle (V5) : 0

[074h 0116 00Ch]              Reset Register : [Generic Address Structure]
[074h 0116 001h]                    Space ID : 01 [SystemIO]
[075h 0117 001h]                   Bit Width : 08
[076h 0118 001h]                  Bit Offset : 00
[077h 0119 001h]        Encoded Access Width : 01 [Byte Access:8]
[078h 0120 008h]                     Address : 0000000000000CF9

[080h 0128 001h]        Value to cause reset : 06
[081h 0129 002h]   ARM Flags (decoded below) : 0000
                              PSCI Compliant : 0
                       Must use HVC for PSCI : 0

[083h 0131 001h]         FADT Minor Revision : 00
[084h 0132 008h]                FACS Address : 0000000000000000
[08Ch 0140 008h]                DSDT Address : 000000007B7E2000
[094h 0148 00Ch]            PM1A Event Block : [Generic Address Structure]
[094h 0148 001h]                    Space ID : 01 [SystemIO]
[095h 0149 001h]                   Bit Width : 20
[096h 0150 001h]                  Bit Offset : 00
[097h 0151 001h]        Encoded Access Width : 02 [Word Access:16]
[098h 0152 008h]                     Address : 0000000000000400

[0A0h 0160 00Ch]            PM1B Event Block : [Generic Address Structure]
[0A0h 0160 001h]                    Space ID : 01 [SystemIO]
[0A1h 0161 001h]                   Bit Width : 00
[0A2h 0162 001h]                  Bit Offset : 00
[0A3h 0163 001h]        Encoded Access Width : 00 [Undefined/Legacy]
[0A4h 0164 008h]                     Address : 0000000000000000

[0ACh 0172 00Ch]          PM1A Control Block : [Generic Address Structure]
[0ACh 0172 001h]                    Space ID : 01 [SystemIO]
[0ADh 0173 001h]                   Bit Width : 10
[0AEh 0174 001h]                  Bit Offset : 00
[0AFh 0175 001h]        Encoded Access Width : 02 [Word Access:16]
[0B0h 0176 008h]                     Address : 0000000000000404

[0B8h 0184 00Ch]          PM1B Control Block : [Generic Address Structure]
[0B8h 0184 001h]                    Space ID : 01 [SystemIO]
[0B9h 0185 001h]                   Bit Width : 00
[0BAh 0186 001h]                  Bit Offset : 00
[0BBh 0187 001h]        Encoded Access Width : 00 [Undefined/Legacy]
[0BCh 0188 008h]                     Address : 0000000000000000

[0C4h 0196 00Ch]           PM2 Control Block : [Generic Address Structure]
[0C4h 0196 001h]                    Space ID : 01 [SystemIO]
[0C5h 0197 001h]                   Bit Width : 08
[0C6h 0198 001h]                  Bit Offset : 00
[0C7h 0199 001h]        Encoded Access Width : 00 [Undefined/Legacy]
[0C8h 0200 008h]                     Address : 0000000000000450

[0D0h 0208 00Ch]              PM Timer Block : [Generic Address Structure]
[0D0h 0208 001h]                    Space ID : 01 [SystemIO]
[0D1h 0209 001h]                   Bit Width : 20
[0D2h 0210 001h]                  Bit Offset : 00
[0D3h 0211 001h]        Encoded Access Width : 03 [DWord Access:32]
[0D4h 0212 008h]                     Address : 0000000000000408

[0DCh 0220 00Ch]                  GPE0 Block : [Generic Address Structure]
[0DCh 0220 001h]                    Space ID : 01 [SystemIO]
[0DDh 0221 001h]                   Bit Width : 80
[0DEh 0222 001h]                  Bit Offset : 00
[0DFh 0223 001h]        Encoded Access Width : 01 [Byte Access:8]
[0E0h 0224 008h]                     Address : 0000000000000420

[0E8h 0232 00Ch]                  GPE1 Block : [Generic Address Structure]
[0E8h 0232 001h]                    Space ID : 01 [SystemIO]
[0E9h 0233 001h]                   Bit Width : 00
[0EAh 0234 001h]                  Bit Offset : 00
[0EBh 0235 001h]        Encoded Access Width : 00 [Undefined/Legacy]
[0ECh 0236 008h]                     Address : 0000000000000000


[0F4h 0244 00Ch]      Sleep Control Register : [Generic Address Structure]
[0F4h 0244 001h]                    Space ID : 01 [SystemIO]
[0F5h 0245 001h]                   Bit Width : 08
[0F6h 0246 001h]                  Bit Offset : 00
[0F7h 0247 001h]        Encoded Access Width : 00 [Undefined/Legacy]
[0F8h 0248 008h]                     Address : 0000000000000000

[100h 0256 00Ch]       Sleep Status Register : [Generic Address Structure]
[100h 0256 001h]                    Space ID : 01 [SystemIO]
[101h 0257 001h]                   Bit Width : 08
[102h 0258 001h]                  Bit Offset : 00
[103h 0259 001h]        Encoded Access Width : 00 [Undefined/Legacy]
[104h 0260 008h]                     Address : 0000000000000000

/**** ACPI table terminates in the middle of a data structure! (dump table=
)
CurrentOffset: 10C, TableLength: 10C ***/
Raw Table Data: Length 268 (0x10C)

    0000: 46 41 43 50 0C 01 00 00 05 ED 48 50 20 20 20 20  // FACP=2E=2E=
=2E=2E=2E=2EHP
    0010: 50 72 6F 4C 69 61 6E 74 01 00 00 00 48 50 20 20  // ProLiant=2E=
=2E=2E=2EHP
    0020: 01 00 00 00 00 10 58 7B 00 20 7E 7B 00 04 09 00  // =2E=2E=2E=2E=
=2E=2EX{=2E ~{=2E=2E=2E=2E
    0030: B2 00 00 00 A0 A1 00 00 00 04 00 00 00 00 00 00  // =2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    0040: 04 04 00 00 00 00 00 00 50 04 00 00 08 04 00 00  // =2E=2E=2E=2E=
=2E=2E=2E=2EP=2E=2E=2E=2E=2E=2E=2E
    0050: 20 04 00 00 00 00 00 00 04 02 01 04 10 00 00 00  //  =2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    0060: 65 00 E9 03 00 00 00 00 01 00 0D 00 32 33 00 00  // e=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E23=2E=2E
    0070: A5 04 00 00 01 08 00 01 F9 0C 00 00 00 00 00 00  // =2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    0080: 06 00 00 00 00 00 00 00 00 00 00 00 00 20 7E 7B  // =2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E ~{
    0090: 00 00 00 00 01 20 00 02 00 04 00 00 00 00 00 00  // =2E=2E=2E=2E=
=2E =2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    00A0: 01 00 00 00 00 00 00 00 00 00 00 00 01 10 00 02  // =2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    00B0: 04 04 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // =2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    00C0: 00 00 00 00 01 08 00 00 50 04 00 00 00 00 00 00  // =2E=2E=2E=2E=
=2E=2E=2E=2EP=2E=2E=2E=2E=2E=2E=2E
    00D0: 01 20 00 03 08 04 00 00 00 00 00 00 01 80 00 01  // =2E =2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    00E0: 20 04 00 00 00 00 00 00 01 00 00 00 00 00 00 00  //  =2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    00F0: 00 00 00 00 01 08 00 00 00 00 00 00 00 00 00 00  // =2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
    0100: 01 08 00 00 00 00 00 00 00 00 00 00              // =2E=2E=2E=2E=
=2E=2E=2E=2E=2E=2E=2E=2E


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.28b.5658017691e213a8.19ecbb9368b.8bb43b920ff56cd9=---

