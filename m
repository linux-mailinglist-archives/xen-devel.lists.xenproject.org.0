Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mJLoAuTYK2ooGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75BC678890
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=HMpq9sHb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336466.1598245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyh7-00011r-5B; Fri, 12 Jun 2026 10:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336466.1598245; Fri, 12 Jun 2026 10:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyh7-0000yw-1q; Fri, 12 Jun 2026 10:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1336466;
 Fri, 12 Jun 2026 10:00:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb46f4d1000701b@swg.vates.tech>)
 id 1wXyh4-0000yS-QD
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:00:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyh4-001Vmq-6K
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:00:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb46f4d1000701b@swg.vates.tech>)
 id 6a2bd8d4-bab6-0a2a0a5309dd-0a2a450ad9fa-14
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:00:54 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb46f4d1000701b@swg.vates.tech>)
 id 6a2bd8d1-56b3-0a2a450a0019-b9ff1c12992f-4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:00:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb46f4d1000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:00:50 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 62B6C81A5D;
 Fri, 12 Jun 2026 12:00:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=RlqxdzSDiyAKrkuHoDNLQjE/GaBf/wst6RfEkuJcZIM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=HMpq9sHbXNM8k6U8JNeac5Zm1PyRj+sSN5yF505N6Q2DI6zluVj7iSLOpONsanKrIGppRj5l4
 +fwOxfZBr9brjjGgzypvoqrjBPWoXq9pMJJj1GRUftNi9M4/gKQuy05/rtaFoHwe+nzVgDAHxwJ
 Dso766XcjDtO8Jox8gaPxe/pMWYg1uEX6tI0NfscJWfW8NA70b1aVpuOryr6yJw1bO0ckd9PuLb
 PbA6pRrFcd1HGmIxtmAA/NTbypXKNVZqhxcZyiXWpvF1qKGL1r+E0nTsCzm53L2+ZQUM/jF7w3E
 6MHIPdO4vKYJK9RFz7lX8gdYsZsruOsuMBh1kQMj3Whw==
X-Zone-Loop: a7d4a78d47c5d8e06b5876a5609dbb89905e92f901d5
x-campaign-type: default
x-transaction-id: a7b0f033-8afa-4bd8-9638-f8112718101c
x-swg-uid: 01-52bebb1f-2e2d-4a03-a73d-c9f0f0cc42bb
X-Mailer: Sweego
Message-ID:
 <1781258450.8631fc262581453bbf619ec5b2062170.19ebb46f4d1000701b@vates.tech>
x-swg-bid: 1781258450.8631fc262581453bbf619ec5b2062170.19ebb46f4d1000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 01/17] libacpi: Split dsdt.asl file and extract i440
 specific parts
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-2-thierry.escande@vates.tech>
 <afB4cc8wI__auaJu@macbook.local>
Content-Language: en-US
In-Reply-To: <afB4cc8wI__auaJu@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.90.99f9891e8e209ca8.19ebb46f282.ff12cacea3db4b4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258449539
X-purgate-ID: tlsNG-4011c0/1781258452-711628B7-6BCE1375/0/0
X-purgate-type: clean
X-purgate-size: 11977
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A75BC678890

---=Part.90.99f9891e8e209ca8.19ebb46f282.ff12cacea3db4b4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/28/26 11:06, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>> In order to factorize the common parts between i440 and q35 dsdt files,
>> this patch splits dsdt=2Easl and put the i440 specific parts into
>> dsdt_i400=2Easl=2E
>>
>> This also makes use of #include directives instead of file
>> concatenations to build the asl files=2E
>>
>> Also, the anycpu asl files generation makes use of makefile pattern
>> rules to avoid duplication for i440 and q35=2E
>>
>> Becuase the LPC controller BDF (which differs between i440 and q35) mus=
t
>=20
> s/Becuase/Because/
>=20
>> be set at device declaration, it is still set in dsdt=2Easl by checking
>> for a MACHINE_TYPE_I440 macro defined in dsdt_i400=2Easl=2E
>=20
> s/i400/i440/
>=20
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  tools/firmware/hvmloader/Makefile  |  2 +-
>>  tools/firmware/hvmloader/ovmf=2Ec    |  4 ++--
>>  tools/firmware/hvmloader/seabios=2Ec |  4 ++--
>>  tools/firmware/hvmloader/util=2Ec    |  4 ++--
>>  tools/firmware/hvmloader/util=2Eh    |  4 ++--
>>  tools/libacpi/Makefile             | 10 ++++-----
>>  tools/libacpi/dsdt=2Easl             | 25 ++++-----------------
>>  tools/libacpi/dsdt_i440=2Easl        | 36 ++++++++++++++++++++++++++++=
++
>>  8 files changed, 53 insertions(+), 36 deletions(-)
>>  create mode 100644 tools/libacpi/dsdt_i440=2Easl
>>
>> diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmload=
er/Makefile
>> index 21de72187d=2E=2Ebdc33a877f 100644
>> --- a/tools/firmware/hvmloader/Makefile
>> +++ b/tools/firmware/hvmloader/Makefile
>> @@ -78,7 +78,7 @@ rombios=2Eo: roms=2Einc
>>  smbios=2Eo: CFLAGS +=3D -D__SMBIOS_DATE__=3D"\"$(SMBIOS_REL_DATE)\""
>> =20
>>  ACPI_PATH =3D =2E=2E/=2E=2E/libacpi
>> -DSDT_FILES +=3D dsdt_anycpu_qemu_xen=2Ec
>> +DSDT_FILES +=3D dsdt_i440_anycpu_qemu_xen=2Ec
>>  ACPI_OBJS =3D $(patsubst %=2Ec,%=2Eo,$(DSDT_FILES)) build=2Eo static_t=
ables=2Eo
>>  $(ACPI_OBJS): CFLAGS +=3D -iquote =2E -DLIBACPI_STDUTILS=3D\"$(CURDIR)=
/util=2Eh\"
>>  CFLAGS +=3D -I$(ACPI_PATH)
>> diff --git a/tools/firmware/hvmloader/ovmf=2Ec b/tools/firmware/hvmload=
er/ovmf=2Ec
>> index 23610a0717=2E=2Ed264a50c73 100644
>> --- a/tools/firmware/hvmloader/ovmf=2Ec
>> +++ b/tools/firmware/hvmloader/ovmf=2Ec
>> @@ -119,8 +119,8 @@ static void ovmf_load(const struct bios_config *con=
fig,
>>  static void ovmf_acpi_build_tables(void)
>>  {
>>      struct acpi_config config =3D {
>> -        =2Edsdt_anycpu =3D dsdt_anycpu_qemu_xen,
>> -        =2Edsdt_anycpu_len =3D dsdt_anycpu_qemu_xen_len,
>> +        =2Edsdt_anycpu =3D dsdt_i440_anycpu_qemu_xen,
>> +        =2Edsdt_anycpu_len =3D dsdt_i440_anycpu_qemu_xen_len,
>>          =2Edsdt_15cpu =3D NULL,=20
>>          =2Edsdt_15cpu_len =3D 0
>>      };
>> diff --git a/tools/firmware/hvmloader/seabios=2Ec b/tools/firmware/hvml=
oader/seabios=2Ec
>> index 444d118ddb=2E=2E74b0406b5a 100644
>> --- a/tools/firmware/hvmloader/seabios=2Ec
>> +++ b/tools/firmware/hvmloader/seabios=2Ec
>> @@ -90,8 +90,8 @@ static void seabios_acpi_build_tables(void)
>>  {
>>      uint32_t rsdp =3D (uint32_t)scratch_alloc(sizeof(struct acpi_20_rs=
dp), 0);
>>      struct acpi_config config =3D {
>> -        =2Edsdt_anycpu =3D dsdt_anycpu_qemu_xen,
>> -        =2Edsdt_anycpu_len =3D dsdt_anycpu_qemu_xen_len,
>> +        =2Edsdt_anycpu =3D dsdt_i440_anycpu_qemu_xen,
>> +        =2Edsdt_anycpu_len =3D dsdt_i440_anycpu_qemu_xen_len,
>>          =2Edsdt_15cpu =3D NULL,
>>          =2Edsdt_15cpu_len =3D 0,
>>      };
>> diff --git a/tools/firmware/hvmloader/util=2Ec b/tools/firmware/hvmload=
er/util=2Ec
>> index e651342681=2E=2Ef1ed1eb48d 100644
>> --- a/tools/firmware/hvmloader/util=2Ec
>> +++ b/tools/firmware/hvmloader/util=2Ec
>> @@ -843,8 +843,8 @@ void hvmloader_acpi_build_tables(struct acpi_config=
 *config,
>>      s =3D xenstore_read("platform/device-model", "");
>>      if ( !strncmp(s, "qemu_xen", 9) )
>>      {
>> -        config->dsdt_anycpu =3D dsdt_anycpu_qemu_xen;
>> -        config->dsdt_anycpu_len =3D dsdt_anycpu_qemu_xen_len;
>> +        config->dsdt_anycpu =3D dsdt_i440_anycpu_qemu_xen;
>> +        config->dsdt_anycpu_len =3D dsdt_i440_anycpu_qemu_xen_len;
>>          config->dsdt_15cpu =3D NULL;
>>          config->dsdt_15cpu_len =3D 0;
>>      }
>> diff --git a/tools/firmware/hvmloader/util=2Eh b/tools/firmware/hvmload=
er/util=2Eh
>> index 765a013ddd=2E=2E3c5eeff5e7 100644
>> --- a/tools/firmware/hvmloader/util=2Eh
>> +++ b/tools/firmware/hvmloader/util=2Eh
>> @@ -381,8 +381,8 @@ extern struct e820map memory_map;
>>  bool check_overlap(uint64_t start, uint64_t size,
>>                     uint64_t reserved_start, uint64_t reserved_size);
>> =20
>> -extern const unsigned char dsdt_anycpu_qemu_xen[], dsdt_anycpu[], dsdt=
_15cpu[];
>> -extern const int dsdt_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu=
_len;
>> +extern const unsigned char dsdt_i440_anycpu_qemu_xen[], dsdt_anycpu[],=
 dsdt_15cpu[];
>> +extern const int dsdt_i440_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_=
15cpu_len;
>=20
> While there you can make this unsigned int, like the dsdt_anycpu_len
> field=2E

Sure=2E

>=20
>> =20
>>  unsigned long acpi_pages_allocated(void);
>> =20
>> diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
>> index b21a64c6b4=2E=2Ed3d4bc9543 100644
>> --- a/tools/libacpi/Makefile
>> +++ b/tools/libacpi/Makefile
>> @@ -11,7 +11,7 @@ endif
>> =20
>>  MK_DSDT =3D $(ACPI_BUILD_DIR)/mk_dsdt
>> =20
>> -C_SRC-$(CONFIG_X86) =3D dsdt_anycpu=2Ec dsdt_15cpu=2Ec dsdt_anycpu_qem=
u_xen=2Ec dsdt_pvh=2Ec
>> +C_SRC-$(CONFIG_X86) =3D dsdt_anycpu=2Ec dsdt_15cpu=2Ec dsdt_i440_anycp=
u_qemu_xen=2Ec dsdt_pvh=2Ec
>>  C_SRC-$(CONFIG_ARM_64) =3D dsdt_anycpu_arm=2Ec
>>  DSDT_FILES ?=3D $(C_SRC-y)
>>  C_SRC =3D $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
>> @@ -39,18 +39,16 @@ $(H_SRC): $(ACPI_BUILD_DIR)/%=2Eh: %=2Easl
>>  $(MK_DSDT): mk_dsdt=2Ec
>>  	$(HOSTCC) $(HOSTCFLAGS) $(MKDSDT_CFLAGS-y) $(CFLAGS_xeninclude) -D__X=
EN_TOOLS__ -o $@ mk_dsdt=2Ec
>> =20
>> -$(ACPI_BUILD_DIR)/dsdt_anycpu_qemu_xen=2Easl: dsdt=2Easl dsdt_acpi_inf=
o=2Easl $(MK_DSDT)
>> +$(ACPI_BUILD_DIR)/dsdt_%_anycpu_qemu_xen=2Easl: dsdt_%=2Easl dsdt=2Eas=
l dsdt_acpi_info=2Easl $(MK_DSDT)
>>  	# Remove last bracket
>>  	awk 'NR > 1 {print s} {s=3D$$0}' $< > $@=2E$(TMP_SUFFIX)
>> -	cat dsdt_acpi_info=2Easl >> $@=2E$(TMP_SUFFIX)
>>  	$(MK_DSDT) --debug=3D$(debug) --dm-version qemu-xen >> $@=2E$(TMP_SUF=
FIX)
>>  	mv -f $@=2E$(TMP_SUFFIX) $@
>> =20
>>  # NB=2E awk invocation is a portable alternative to 'head -n -1'
>> -$(ACPI_BUILD_DIR)/dsdt_%cpu=2Easl: dsdt=2Easl dsdt_acpi_info=2Easl  $(=
MK_DSDT)
>> +$(ACPI_BUILD_DIR)/dsdt_%cpu=2Easl: dsdt_i440=2Easl dsdt=2Easl dsdt_acp=
i_info=2Easl  $(MK_DSDT)
>>  	# Remove last bracket
>>  	awk 'NR > 1 {print s} {s=3D$$0}' $< > $@=2E$(TMP_SUFFIX)
>> -	cat dsdt_acpi_info=2Easl >> $@=2E$(TMP_SUFFIX)
>>  	$(MK_DSDT) --debug=3D$(debug) --maxcpu $*  >> $@=2E$(TMP_SUFFIX)
>>  	mv -f $@=2E$(TMP_SUFFIX) $@
>> =20
>> @@ -65,7 +63,7 @@ $(ACPI_BUILD_DIR)/dsdt_anycpu_arm=2Easl: $(MK_DSDT)
>>  	mv -f $@=2E$(TMP_SUFFIX) $@
>> =20
>>  $(C_SRC): $(ACPI_BUILD_DIR)/%=2Ec: $(ACPI_BUILD_DIR)/%=2Easl
>> -	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*=2E$(TMP_SUFFIX) -tc $<
>> +	$(IASL) -vs -I $(CURDIR) -p $(ACPI_BUILD_DIR)/$*=2E$(TMP_SUFFIX) -tc =
$<
>>  	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*=2Ehe=
x > $@=2E$(TMP_SUFFIX)
>>  	echo "int $*_len=3Dsizeof($*);" >> $@=2E$(TMP_SUFFIX)
>>  	mv -f $@=2E$(TMP_SUFFIX) $@
>> diff --git a/tools/libacpi/dsdt=2Easl b/tools/libacpi/dsdt=2Easl
>> index 32b42f85ae=2E=2E130826fdcc 100644
>> --- a/tools/libacpi/dsdt=2Easl
>> +++ b/tools/libacpi/dsdt=2Easl
>> @@ -5,8 +5,6 @@
>>   * Copyright (c) 2004, Intel Corporation=2E
>>   */
>> =20
>> -DefinitionBlock ("DSDT=2Eaml", "DSDT", 2, "Xen", "HVM", 0)
>> -{
>>      Name (\PMBS, 0x0C00)
>>      Name (\PMLN, 0x08)
>>      Name (\IOB1, 0x00)
>> @@ -199,7 +197,10 @@ DefinitionBlock ("DSDT=2Eaml", "DSDT", 2, "Xen", "=
HVM", 0)
>> =20
>>              Device (ISA)
>>              {
>> -                Name (_ADR, 0x00010000) /* device 1, fn 0 */
>> +                /* Error will be raised if the machine type is not def=
ined */
>> +                #ifdef MACHINE_TYPE_I440
>> +                    Name (_ADR, 0x00010000) /* device 1, fn 0 */
>> +                #endif
>=20
> I think we want the preprocessor directives not indented the same as
> asl code, like we do in C, iow:
>=20
>             Device (ISA)
>             {
>                 /* Error will be raised if the machine type is not defin=
ed */
> #ifdef MACHINE_TYPE_I440
>                 Name (_ADR, 0x00010000) /* device 1, fn 0 */
> #endif
>=20
> Same with the includes and defines below=2E

Will do=2E

>=20
>> =20
>>                  OperationRegion(PIRQ, PCI_Config, 0x60, 0x4)
>>                  Scope(\) {
>> @@ -329,23 +330,6 @@ DefinitionBlock ("DSDT=2Eaml", "DSDT", 2, "Xen", "=
HVM", 0)
>>                      })
>>                  }
>> =20
>> -                Device (FDC0)
>> -                {
>> -                    Name (_HID, EisaId ("PNP0700"))
>> -                    Method (_STA, 0, NotSerialized)
>> -                    {
>> -                          Return (0x0F)
>> -                    }
>> -
>> -                    Name (_CRS, ResourceTemplate ()
>> -                    {
>> -                        IO (Decode16, 0x03F0, 0x03F0, 0x01, 0x06)
>> -                        IO (Decode16, 0x03F7, 0x03F7, 0x01, 0x01)
>> -                        IRQNoFlags () {6}
>> -                        DMA (Compatibility, NotBusMaster, Transfer8) {=
2}
>> -                    })
>> -                }
>=20
> I need to look at the Q35 changes, but ff the only differences are the
> Name() method at the top and this, we might as well use an #ifdef
> here, and there's no need to split into so many separate files?  I
> need to look at further patches=2E

Since the changes are not that big I can indeed use #ifdef within
dstd=2Easl directly and avoid the split=2E There would be specific files
declaring the machine type and I can keep the current concatenation
mecanism=2E

>=20
> The ACPI table generation stuff could certainly do with an overall
> rework=2E
>=20
>>                  Device (UAR1)
>>                  {
>>                      Name (_HID, EisaId ("PNP0501"))
>> @@ -444,4 +428,3 @@ DefinitionBlock ("DSDT=2Eaml", "DSDT", 2, "Xen", "H=
VM", 0)
>>      Method(_PIC, 1) {
>>          Store(Arg0, PICD)
>>      }
>> -}
>> diff --git a/tools/libacpi/dsdt_i440=2Easl b/tools/libacpi/dsdt_i440=2E=
asl
>> new file mode 100644
>> index 0000000000=2E=2Ee80c454ad9
>> --- /dev/null
>> +++ b/tools/libacpi/dsdt_i440=2Easl
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: LGPL-2=2E1-only */
>> +/*********************************************************************=
*********
>> + * DSDT for Xen with Qemu device model (for i440 machine)
>> + *
>> + * Copyright (c) 2004, Intel Corporation=2E
>> + */
>> +
>> +DefinitionBlock ("DSDT=2Eaml", "DSDT", 2, "Xen", "HVM", 0)
>> +{
>> +    #define MACHINE_TYPE_I440
>=20
> IMO we probably want to define this outside of the DefinitionBlock
> section, just after the copyright header=2E

Yes, I'll define that in dsdt_i440=2Easl and dsdt_q35=2Easl along with the
isa device sbdf=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.90.99f9891e8e209ca8.19ebb46f282.ff12cacea3db4b4=---

