Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B69FD7E7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2024 23:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863458.1274869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tRIPx-0002N3-1X; Fri, 27 Dec 2024 22:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863458.1274869; Fri, 27 Dec 2024 22:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tRIPw-0002K0-SG; Fri, 27 Dec 2024 22:02:48 +0000
Received: by outflank-mailman (input) for mailman id 863458;
 Fri, 27 Dec 2024 22:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F97z=TU=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tRIPv-0002Ju-53
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2024 22:02:47 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c4c76af-c49e-11ef-99a3-01e77a169b0f;
 Fri, 27 Dec 2024 23:02:44 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 27 Dec 2024 23:02:43 +0100
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
X-Inumbo-ID: 4c4c76af-c49e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1735336964; x=1766872964;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=iWh9tFCT0lDPpRN72XPJ9AOSKZ+diQ9xBOEt7P/uiFI=;
  b=jnK5NQ41phAFe63Iok3Y+qSZXaGiu2LQTSTn7ab1HkoswYJPgG1F7Ubw
   uOhEY4+mPNqfjm2TyuDX+p8p1KX5SrBK2zxhogl6odZAPmkVA0PQGNkbk
   mCSvdhSMZgbaXB75T4vhthRSC71lsTIOe4vTogoPinIux8Lm9pzc50u7Z
   M=;
X-CSE-ConnectionGUID: 4ZXccBGDRxqMOj3qAAsBYg==
X-CSE-MsgGUID: a+HA1IRMTqSM0HFTboKd4Q==
X-IronPort-AV: E=Sophos;i="6.12,269,1728943200"; 
   d="scan'208";a="28331679"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <65903263-efd3-48a3-8e71-909afaf0b6d6@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241222161444.1558599-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241222161444.1558599-2-Ariel.Otilibili-Anieli@eurecom.fr> <65903263-efd3-48a3-8e71-909afaf0b6d6@suse.com>
Date: Fri, 27 Dec 2024 23:02:43 +0100
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a86-676f2400-8f41-26131fc0@197006440>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 1/1] =?utf-8?q?libacpi/Makefile=3A?= clear ASL 
 warning about PCI0
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Friday, December 27, 2024 15:27 CET, Jan Beulich <jbeulich@suse.com>=
 wrote:

> On 22.12.2024 17:10, Ariel Otilibili wrote:
> > iasl has one ID per warning [6]; subsequent commits will address ot=
her ASL warnings.
> >=20
> > ```
> > $ awk 'NR>533 && NR<556 {print NR ":" $0}' source/compiler/aslmetho=
d.c
> > 534:    case PARSEOP=5FDEVICE:
> > 535:
> > 536:        /* Check usage of =5FHID and =5FADR objects */
> > 537:
> > 538:        HidExists =3D ApFindNameInDeviceTree (METHOD=5FNAME=5F=5F=
HID, Op);
> > 539:        AdrExists =3D ApFindNameInDeviceTree (METHOD=5FNAME=5F=5F=
ADR, Op);
> > 540:
> > 541:        if (!HidExists && !AdrExists)
> > 542:        {
> > 543:            AslError (ASL=5FERROR, ASL=5FMSG=5FMISSING=5FDEPEND=
ENCY, Op,
> > 544:                "Device object requires a =5FHID or =5FADR");
> > 545:        }
> > 546:        else if (HidExists && AdrExists)
> > 547:        {
> > 548:            /*
> > 549:             * According to the ACPI spec, "A device object mus=
t contain
> > 550:             * either an =5FHID object or an =5FADR object, but=
 should not contain
> > 551:             * both".
> > 552:             */
> > 553:            AslError (ASL=5FWARNING, ASL=5FMSG=5FMULTIPLE=5FTYP=
ES, Op,
> > 554:                "Device object requires either a =5FHID or =5FA=
DR, but not both");
> > 555:        }
> >=20
> > $ awk 'NR>188 && NR<206 || NR=3D=3D432 || /ASL=5FMSG=5FMULTIPLE=5FT=
YPES/ {print NR ":" $0}' source/compiler/aslmessages.h
> > 189:/*
> > 190: * Values (message IDs) for all compiler messages. There are cu=
rrently
> > 191: * three distinct blocks of error messages (so that they can be=
 expanded
> > 192: * individually):
> > 193: *      Main ASL compiler
> > 194: *      Data Table compiler
> > 195: *      Preprocessor
> > 196: *
> > 197: * NOTE1: This list must match the tables of message strings in=
 the file
> > 198: * aslmessages.c exactly.
> > 199: *
> > 200: * NOTE2: With the introduction of the -vw option to disable sp=
ecific
> > 201: * messages, new messages should only be added to the end of th=
ese
> > 202: * lists, so that values for existing messages are not disturbe=
d.
> > 203: */
> > 204:typedef enum
> > 205:{
> > 280:    ASL=5FMSG=5FMULTIPLE=5FTYPES,
> > 432:} ASL=5FMESSAGE=5FIDS;
>=20
> From this I can't conclude that the same message ID (ASL=5FMSG=5FMULT=
IPLE=5FTYPES
> here) can't (in principle) be used in multiple places, for similar pu=
rposes.
> Pretty certainly we want to avoid disabling unrelated warnings elsewh=
ere
> (including ones only to be surfaced by future versions of iasl).
>=20

In principle, the same ID won=E2=80=99t be used twice. Though I will pu=
sh a PR to the project sometime next year. So far ASL=5FMSG=5FMULTIPLE=5F=
TYPES has been used once, I will ask the ID be made specific about =5FH=
ID and =5FADR.

I did open a PR that clarifies, from which has the MUST been enforced, =
ACPI 6.3 Errata A [1].

[1] https://github.com/acpica/acpica/pull/992
> > --- a/tools/libacpi/Makefile
> > +++ b/tools/libacpi/Makefile
> > @@ -21,6 +21,8 @@ H=5FSRC +=3D $(addprefix $(ACPI=5FBUILD=5FDIR)/, =
ssdt=5Ftpm.h ssdt=5Ftpm2.h ssdt=5Flaptop=5Fslat
> >  MKDSDT=5FCFLAGS-$(CONFIG=5FARM=5F64) =3D -DCONFIG=5FARM=5F64
> >  MKDSDT=5FCFLAGS-$(CONFIG=5FX86) =3D -DCONFIG=5FX86
> > =20
> > +IASL=5FWARNS=3D3073
>=20
> If we were to go this route, the variable name better would make clea=
r that
> this is a list of warnings to be disabled.

Sure, Jan.
>=20
> And then instead of ...
>=20
> > @@ -32,7 +34,7 @@ TMP=5FSUFFIX	=3D tmp
> >  all: $(C=5FSRC) $(H=5FSRC)
> > =20
> >  $(H=5FSRC): $(ACPI=5FBUILD=5FDIR)/%.h: %.asl
> > -	$(IASL) -vs -p $(ACPI=5FBUILD=5FDIR)/$*.$(TMP=5FSUFFIX) -tc $<
> > +	$(IASL) $(IASL=5FWARNS:%=3D-vw%) -vs -p $(ACPI=5FBUILD=5FDIR)/$*.=
$(TMP=5FSUFFIX) -tc $<
> >  	sed -e 's/AmlCode/$*/g' -e 's/=5Faml=5Fcode//g' $(ACPI=5FBUILD=5F=
DIR)/$*.hex >$@
> >  	rm -f $(addprefix $(ACPI=5FBUILD=5FDIR)/, $*.aml $*.hex)
> >  =20
> > @@ -65,7 +67,7 @@ $(ACPI=5FBUILD=5FDIR)/dsdt=5Fanycpu=5Farm.asl: $(=
MK=5FDSDT)
> >  	mv -f $@.$(TMP=5FSUFFIX) $@
> > =20
> >  $(C=5FSRC): $(ACPI=5FBUILD=5FDIR)/%.c: $(ACPI=5FBUILD=5FDIR)/%.asl
> > -	$(IASL) -vs -p $(ACPI=5FBUILD=5FDIR)/$*.$(TMP=5FSUFFIX) -tc $<
> > +	$(IASL) $(IASL=5FWARNS:%=3D-vw%) -vs -p $(ACPI=5FBUILD=5FDIR)/$*.=
$(TMP=5FSUFFIX) -tc $<
> >  	sed -e 's/AmlCode/$*/g' -e 's/=5Faml=5Fcode//g' $(ACPI=5FBUILD=5F=
DIR)/$*.hex > $@.$(TMP=5FSUFFIX)
> >  	echo "int $*=5Flen=3Dsizeof($*);" >> $@.$(TMP=5FSUFFIX)
> >  	mv -f $@.$(TMP=5FSUFFIX) $@
>=20
> ... continuing to need to alter two places, I guess we'd be better of=
f
> introducing IASL=5FFLAGS or some such, where the -vs then could also =
go.
>=20

Thanks for the feedback, Jan. Sometime next year I will push a new vers=
ion. My best regards to you and your dear ones.
> Jan


