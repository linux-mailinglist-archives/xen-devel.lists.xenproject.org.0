Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ccU6GO3YK2osGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CF678895
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=gaLeUsxx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336468.1598263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhG-0001aO-NN; Fri, 12 Jun 2026 10:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336468.1598263; Fri, 12 Jun 2026 10:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhG-0001YA-IZ; Fri, 12 Jun 2026 10:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1336468;
 Fri, 12 Jun 2026 10:01:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4721b0000701b@swg.vates.tech>)
 id 1wXyhF-0001WV-Fh
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhE-009PRP-LO
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4721b0000701b@swg.vates.tech>)
 id 6a2bd8e0-5cb7-0a2a0a5109dd-0a2a4506e570-0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:04 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4721b0000701b@swg.vates.tech>)
 id 6a2bd8e0-7371-0a2a45060019-b9ff1c128b79-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb4721b0000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:01 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id EC25E86502;
 Fri, 12 Jun 2026 12:01:00 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=NC0fTZHYg2VkRO73ZlLz4BH1Jvnue5GqGDee2Igk/iY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gaLeUsxxlaRTdx4+3DZSFStCaURbFKDMRXQAEHIjy5T4I3ImYits5+Cp6dBeG/4NQRPsQKbf0
 oGaS3vEJIXBV06kHbZwzIqihzOyMqXyUStC7jIIG149hNYq5E1OEC/+CH4yAYHZJlnC+I5zTkNs
 xP24KukQILKccAaSHtQsiQAKMHHGHNYLTE+eBAIEObqNGtS8mEDo8dIC/xO7gZ9solA2O12erE8
 uoEn6LSk3bG3DUqm17xhXuuHuxLKHvVN4NKMrLBisORqV/4o7puVdnTm4yEdkGxa0zv/1hpOjXI
 duhjC2RHH+ubwgS/Dyrj/ltXGdemYU6qlXf4hp2tDXsw==
X-Zone-Loop: 594f0875a32ed588de6460aab0fbce3c73033e98cdb2
x-campaign-type: default
x-transaction-id: 3d128196-c033-402e-a238-4436ab3d21a5
x-swg-uid: 01-352306b2-47eb-4c4e-881c-4990081be366
X-Mailer: Sweego
Message-ID:
 <1781258461.8631fc262581453bbf619ec5b2062170.19ebb4721b0000701b@vates.tech>
x-swg-bid: 1781258461.8631fc262581453bbf619ec5b2062170.19ebb4721b0000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 02/17] libacpi: new DSDT ACPI table for Q35
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-3-thierry.escande@vates.tech>
 <afCJTdlBPPyWEejk@macbook.local>
Content-Language: en-US
In-Reply-To: <afCJTdlBPPyWEejk@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.99.f504815354de79d1.19ebb471fc9.f47476d06f00c6ec=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258461129
X-purgate-ID: tlsNG-16d1c6/1781258464-8F397D75-01FF7E13/0/0
X-purgate-type: clean
X-purgate-size: 11562
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: B35CF678895

---=Part.99.f504815354de79d1.19ebb471fc9.f47476d06f00c6ec=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/28/26 12:17, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>> This patch adds the DSDT table for Q35 (new tools/libacpi/dsdt_q35=2Eas=
l
>> file)=2E It only contains the specific Q35 parts that differ from i440)=
=2E
>> At the moment, these are:
>>
>> - BDF location of LPC Controller
>> - Minor changes related to FDC detection
>> - Addition of _OSC method to inform OSPM about PCIe features supported
>>
>> As we are still using 4 PCI router links and their corresponding
>> device/register addresses are same (offset 0x60), no need to change PCI
>> routing descriptions=2E
>>
>> Note that '15cpu' ACPI tables are only applicable to qemu-traditional
>> (which have no support for Q35), so we need to use 'anycpu' version onl=
y=2E
>=20
> Is the above statement fully accurate?  It seems like 15cpu tables are
> used with rombios, so the dependency is not on qemu-trad, but rather
> rombios?
>=20
> If it's truly only dependent on qemu-trad then we should remove those,
> as we have removed qemu-trad=2E

You're right, the dependency is on Rombios=2E And I though Rombios was
only used for qemu-trad, my bad=2E So it implies to use Seabios or OVMF to
have Q35 support=2E Is it something acceptable?

>=20
>>
>> Signed-off-by: Alexey Gerasimenko <x1917x@gmail=2Ecom>
>=20
> If the first SoB if from Alexey, the From: should also match=2E

Ok, I'll change authorship or signed-off order depending on how close it
is from the original patch=2E

>=20
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  tools/firmware/hvmloader/Makefile |   2 +-
>>  tools/libacpi/Makefile            |   2 +-
>>  tools/libacpi/dsdt=2Easl            |   3 +
>>  tools/libacpi/dsdt_q35=2Easl        | 130 ++++++++++++++++++++++++++++=
++
>>  4 files changed, 135 insertions(+), 2 deletions(-)
>>  create mode 100644 tools/libacpi/dsdt_q35=2Easl
>>
>> diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmload=
er/Makefile
>> index bdc33a877f=2E=2E99f045efaa 100644
>> --- a/tools/firmware/hvmloader/Makefile
>> +++ b/tools/firmware/hvmloader/Makefile
>> @@ -78,7 +78,7 @@ rombios=2Eo: roms=2Einc
>>  smbios=2Eo: CFLAGS +=3D -D__SMBIOS_DATE__=3D"\"$(SMBIOS_REL_DATE)\""
>> =20
>>  ACPI_PATH =3D =2E=2E/=2E=2E/libacpi
>> -DSDT_FILES +=3D dsdt_i440_anycpu_qemu_xen=2Ec
>> +DSDT_FILES +=3D dsdt_i440_anycpu_qemu_xen=2Ec dsdt_q35_anycpu_qemu_xen=
=2Ec
>>  ACPI_OBJS =3D $(patsubst %=2Ec,%=2Eo,$(DSDT_FILES)) build=2Eo static_t=
ables=2Eo
>>  $(ACPI_OBJS): CFLAGS +=3D -iquote =2E -DLIBACPI_STDUTILS=3D\"$(CURDIR)=
/util=2Eh\"
>>  CFLAGS +=3D -I$(ACPI_PATH)
>> diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
>> index d3d4bc9543=2E=2Ee6c4a3fd8b 100644
>> --- a/tools/libacpi/Makefile
>> +++ b/tools/libacpi/Makefile
>> @@ -11,7 +11,7 @@ endif
>> =20
>>  MK_DSDT =3D $(ACPI_BUILD_DIR)/mk_dsdt
>> =20
>> -C_SRC-$(CONFIG_X86) =3D dsdt_anycpu=2Ec dsdt_15cpu=2Ec dsdt_i440_anycp=
u_qemu_xen=2Ec dsdt_pvh=2Ec
>> +C_SRC-$(CONFIG_X86) =3D dsdt_anycpu=2Ec dsdt_15cpu=2Ec dsdt_i440_anycp=
u_qemu_xen=2Ec dsdt_q35_anycpu_qemu_xen=2Ec dsdt_pvh=2Ec
>>  C_SRC-$(CONFIG_ARM_64) =3D dsdt_anycpu_arm=2Ec
>>  DSDT_FILES ?=3D $(C_SRC-y)
>>  C_SRC =3D $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
>> diff --git a/tools/libacpi/dsdt=2Easl b/tools/libacpi/dsdt=2Easl
>> index 130826fdcc=2E=2Edc764881c9 100644
>> --- a/tools/libacpi/dsdt=2Easl
>> +++ b/tools/libacpi/dsdt=2Easl
>> @@ -201,6 +201,9 @@
>>                  #ifdef MACHINE_TYPE_I440
>>                      Name (_ADR, 0x00010000) /* device 1, fn 0 */
>>                  #endif
>> +                #ifdef MACHINE_TYPE_Q35
>> +                    Name (_ADR, 0x001f0000) /* device 31, fn 0 */
>> +                #endif
>=20
> You possibly want to do:
>=20
> #ifdef =2E=2E=2E
> #elif defined(=2E=2E=2E)
> #else
> #error =2E=2E=2E
> #endif

Well, the iasl compiler doesn't support the defined() directive (at
least the latest Debian version from 2025) so I'll rather use something
like:

#define MACHINE_TYPE MACHINE_TYPE_XXX

#if MACHINE_TYPE =3D=3D MACHINE_TYPE_XXX
 =2E=2E=2E
#elif MACHINE_TYPE =3D=3D MACHINE_TYPE_YYY
 =2E=2E=2E
#endif

>=20
> But seeing the difference is only for the address, why not do:
>=20
> #define ISA_DEV_SBDF 0x00010000
> =2E=2E=2E
> Name (_ADR, ISA_DEV_SBDF)
> =2E=2E=2E
>=20
> And avoid the ifdef mess?

Yes, sure=2E

>=20
>> =20
>>                  OperationRegion(PIRQ, PCI_Config, 0x60, 0x4)
>>                  Scope(\) {
>> diff --git a/tools/libacpi/dsdt_q35=2Easl b/tools/libacpi/dsdt_q35=2Eas=
l
>> new file mode 100644
>> index 0000000000=2E=2E7cefe63506
>> --- /dev/null
>> +++ b/tools/libacpi/dsdt_q35=2Easl
>> @@ -0,0 +1,130 @@
>> +/* SPDX-License-Identifier: LGPL-2=2E1-only */
>> +/*********************************************************************=
*********
>> + * DSDT for Xen with Qemu device model (for Q35 machine)
>> + */
>> +
>> +DefinitionBlock ("DSDT=2Eaml", "DSDT", 2, "Xen", "HVM", 0)
>> +{
>> +    #define MACHINE_TYPE_Q35
>> +
>> +    #include "dsdt=2Easl"
>> +
>> +    Scope (\_SB=2EPCI0)
>> +    {
>> +       /* _OSC, modified from ASL sample in ACPI spec */
>> +       Name (SUPP, 0) /* PCI _OSC Support Field value */
>> +       Name (CTRL, 0) /* PCI _OSC Control Field value */
>> +       Method (_OSC, 4) {
>> +           /* Create DWORD-addressable fields from the Capabilities Bu=
ffer */
>> +           CreateDWordField (Arg3, 0, CDW1)
>> +
>> +           /* Switch by UUID=2E
>> +            * Only PCI Host Bridge Device capabilities UUID used for n=
ow
>=20
> Comment style, in Xen we use:
>=20
> /*
>  * Switch by UIID=2E
>  * Only PCI Host Bridge Device capabilities UUID used for now=2E
>  */
>=20
> The opening and closing lines are standalone=2E  Also missing a full
> stop on the last line=2E  The rest of the comments below also need
> adjusting=2E

Will fix that=2E

> >> +            */
>> +           If (LEqual (Arg0, ToUUID ("33DB4D5B-1FF7-401C-9657-7441C03D=
D766"))) {
>> +               /* Create DWORD-addressable fields from the Capabilitie=
s Buffer */
>> +               CreateDWordField (Arg3, 4, CDW2)
>> +               CreateDWordField (Arg3, 8, CDW3)
>> +
>> +               /* Save Capabilities DWORD2 & 3 */
>> +               Store (CDW2, SUPP)
>> +               Store (CDW3, CTRL)
>> +
>> +               /* Validate Revision DWORD */
>> +               If (LNotEqual (Arg1, One)) {
>> +                   /* Unknown revision */
>> +                   /* Support and Control DWORDs will be returned anyw=
ay */
>> +                   Or (CDW1, 0x08, CDW1)
>> +               }
>> +
>> +               /* Control field bits are:
>> +                * bit 0    PCI Express Native Hot Plug control
>> +                * bit 1    SHPC Native Hot Plug control
>> +                * bit 2    PCI Express Native Power Management Events =
control
>> +                * bit 3    PCI Express Advanced Error Reporting contro=
l
>> +                * bit 4    PCI Express Capability Structure control
>> +                */
>> +
>> +               /* Always allow native PME, AER (no dependencies)
>> +                * Never allow SHPC (no SHPC controller in this system)
>> +                * Do not allow PCIe Capability Structure control for n=
ow
>> +                * Also, ACPI hotplug is used for now instead of PCIe
>> +                * Native Hot Plug
>> +                */
>> +               And (CTRL, 0x0C, CTRL)
>> +
>> +               If (LNotEqual (CDW3, CTRL)) {
>> +                   /* Some of Capabilities bits were masked */
>> +                   Or (CDW1, 0x10, CDW1)
>> +               }
>> +               /* Update DWORD3 in the buffer */
>> +               Store (CTRL, CDW3)
>=20
> This looks equal to the QEMU code FWIW=2E
>=20
>> +           } Else {
>> +               Or (CDW1, 4, CDW1) /* Unrecognized UUID */
>> +           }
>> +           Return (Arg3)
>> +       }
>> +       /* end of _OSC */
>> +    }
>> +
>> +    /****************************************************************
>> +     * LPC ISA bridge
>> +     ****************************************************************/
>=20
> I would use a normal one-line comment here: /* LPCI ISA Bridge */
>=20
> Has any of this been picked up from the QEMU asl files?  Asking
> because the above comment looks to be verbatim copied from the QEMU
> file, and we then need to carry their copyright notice, which is not
> done in this patch=2E
>=20
>> +
>> +    Scope (\_SB=2EPCI0=2EISA)
>=20
> AFAICT this is adding more content to the ISA device already defined
> in dsdt=2Easl?

AFAIU, yes that's the goal=2E Since I'll revert the split and use #ifdef
directives in dsdt=2Easl this will be removed=2E

>=20
>> +    {
>> +        /*
>> +         LPC ISA bridge
>> +
>> +         PCI Interrupt Routing Register 2 (PIRQE=2E=2EPIRQH) cannot be
>> +         used because of existing Xen IRQ limitations (4 PCI links
>> +         only)
>> +        */
>=20
> Right, and PIRQA=2E=2EPIRQD is already defined in the generic dsdt=2Easl=
=2E
> Might be worth mentioning, otherwise the block looks incomplete=2E
>=20
>> +
>> +        /* LPC_I/O: I/O Decode Ranges Register */
>> +        OperationRegion (LPCD, PCI_Config, 0x80, 0x2)
>> +        Field (LPCD, AnyAcc, NoLock, Preserve) {
>> +            COMA,   3,
>> +                ,   1,
>> +            COMB,   3,
>> +
>> +            Offset(0x01),
>> +            LPTD,   2,
>> +                ,   2,
>> +            FDCD,   2
>> +        }
>> +
>> +        /* LPC_EN: LPC I/F Enables Register */
>> +        OperationRegion(LPCE, PCI_Config, 0x82, 0x2)
>> +        Field(LPCE, AnyAcc, NoLock, Preserve) {
>> +            CAEN,   1,
>> +            CBEN,   1,
>> +            LPEN,   1,
>> +            FDEN,   1
>> +        }
>> +
>> +        Device (FDC0)
>> +        {
>> +            Name (_HID, EisaId ("PNP0700"))
>> +            Method (_STA, 0, NotSerialized)
>> +            {
>> +                Store (FDEN, Local0)
>> +                If (LEqual (Local0, 0)) {
>> +                    Return (0x00)
>> +                } Else {
>> +                    Return (0x0F)
>> +                }
>> +           }
>> +
>> +           Name (_CRS, ResourceTemplate ()
>> +           {
>> +               IO (Decode16, 0x03F2, 0x03F2, 0x00, 0x04)
>> +               IO (Decode16, 0x03F7, 0x03F7, 0x00, 0x01)
>> +               IRQNoFlags () {6}
>> +               DMA (Compatibility, NotBusMaster, Transfer8) {2}
>> +           })
>> +        }
>> +    }
>=20
> This seem to match the blocks in QEMU, so it's likely fine=2E

I'll add qemu copyright header

Would that be ok under the original copyright notice ?
/******************************************************************
 * Q35 part heavily inspired by q35-acpi-dsdt=2Edsl from Qemu
 *
 * Copyright (c) 2010 Isaku Yamahata
 *                    yamahata at valinux co jp
 */


Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.99.f504815354de79d1.19ebb471fc9.f47476d06f00c6ec=---

