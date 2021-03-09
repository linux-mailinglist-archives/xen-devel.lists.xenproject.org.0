Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924613323A3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 12:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95342.179972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJaCl-0005WQ-P4; Tue, 09 Mar 2021 11:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95342.179972; Tue, 09 Mar 2021 11:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJaCl-0005W1-Li; Tue, 09 Mar 2021 11:07:11 +0000
Received: by outflank-mailman (input) for mailman id 95342;
 Tue, 09 Mar 2021 11:07:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UNn=IH=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1lJaCk-0005Vw-Uk
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 11:07:11 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f85e8eb6-f745-4797-b504-afb4fc1419cb;
 Tue, 09 Mar 2021 11:07:10 +0000 (UTC)
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
X-Inumbo-ID: f85e8eb6-f745-4797-b504-afb4fc1419cb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615288029;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z9DS7br3KZq6yoL91idIK7t+6tIwKEkXKQMms9ptZ80=;
  b=dmbJ3zNB55T3y0QI9ssjrpJ4UmLKBNETgbciLO5uphNFykbBo9RXiWgq
   B40Q1YtxkvqJ/KOZzbTeqmOROhazKatM2O3hLo4hz8zcelyia9C/7utML
   Ym9xCMJVaYARjPzIn+O2GIxYkKMsBAxfuwKXZsGIWGhz7szLZ5hBrFyYy
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: U5cAvLhxQ5FO6uggSTdwWhc7gTiWdmNAvhXl6nrD547VN84oe5r+H6wjnSB17wWbKf5raBqY3Z
 vzCYNiWyuFVJVucydt2cqkr5bNjAo4ecM9YyNaF6s0/wVVDmAuiUCUhFs+iz+4/DPQK7Fk1669
 hsRUM+buPYQ4RT6uPppG2UAph5Um8BDTxPlngI1eqgIlI1tyyChIGLOOSs28q4tXnoneK7GQIJ
 rVp1SAkrxEgnYigvbZ0bHT3Kw+IVFlrHDcn1prpiqWXa7aL1zgMiIboQ6x1ei8VJYNL+GzucSu
 yNo=
X-SBRS: 5.2
X-MesageID: 39215643
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="39215643"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px8otZoAGE92qPllBQYOM946/pan7bXs7sMQj3jXOn+ltJp4IZeYog6l1zgHR9wD88/5x52hFERtBoeBTYFou/gLhC1fJzMv2yfD1gFzLAABhBYc4k0QMXDf6xud6VjVl+d+cc1Cs3Lcne24dJBWKO+c7ruRb6x8C/PtyLoVbuBQQsM5ZJvXwE8ZFIsHtfXC2OZh7iAdIboCgRWbjVfttFgJ+nnf1UyRTF77Sgk9hlq59jlyXeOCcnHzaM/p6Z4Ed06QGOq1vBaKzNyvnSbZhR5isVm7P0lrvz+P9MnXoj2XrL6JLzcmxrsBUpqw8zaedzQdC9ibgmy3HObEAHB9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=931RgjNXrlMZ53cEU4zSTn+6C3H8Es50mRbHwSZQCSg=;
 b=DsJx/z3mVJvlaM+0bKLQO2hOI32w3gBAIyBc2GWbQhYepxE+bSdMRpT4XvTaxpY1hUKuTmDj21hOxuPEoFm4PrV35tJDfgAEHdPHnQhYp4/5L3msXFT+hkkPCPx30HjL9zTavTUuH1VPziFITGt+cwrJIv6JXLmVMlMkkHXX4fJdQvuk7ExMWDVOFRz6vFmUxKxWX7Kjkemnse3trvPlf+35ml6WTjs8fUdOXEi7QNglLJYM3NAYYs+xWdR/nw0NBVRZPazK/LqjFILChZstQnpZt8dfzR4Z3ARwNqLw6K6j+EtNU81ODUwoOAiXJtWVcshQzCzrWECSP8eMJsRpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=931RgjNXrlMZ53cEU4zSTn+6C3H8Es50mRbHwSZQCSg=;
 b=Nk4HeO7xmBYfcV7gRczmJp6VmcMFlB8bnkF/14ppITaQHAwCRQNVmDGsAfqzdvYLdGBN38eCR0DaK/o7bIWWuodX5eCHAwAtqD8KAW+RQKlMB/J2wCK28YPrmzc1tMY8n6SN2JLvmAfoyQY125WgUSpNrb2tormzkt8iB4lUZtg=
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, David Scott <dave@recoil.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
Thread-Topic: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
Thread-Index: AQHXFNLk9g6CO5afwkSJp733cbqj36p7fplf
Date: Tue, 9 Mar 2021 11:06:52 +0000
Message-ID: <MWHPR03MB2445D4D985D837E5C90A6A92F6929@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <20210309105634.7200-1-roger.pau@citrix.com>
In-Reply-To: <20210309105634.7200-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1f8238a-117f-4e69-538d-08d8e2eb71fc
x-ms-traffictypediagnostic: MWHPR03MB2896:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB289683DF8034822EC0A03A99F6929@MWHPR03MB2896.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4h4lpWA2BTIHsg66Z/xQHeThVh1Pxjw4rJ3DWDDFK2zHOdWdK3H899kIbEjrJZXtTRQMOBoRgRBPGwAYvuWHKDpTfJUhk7lZwkIgVQMzh0EBWly20pr1XG3pYjN/p4O50M8e7IkKDze6hAY3WKZo2/YpdePlRDo/cLMqFZPkr5Fm+xvTC1O1Wz8DMCsgYCMdCMItWEj8JWSizoS7m3MUvzZKtBaxAeaS8UtVsMdELlDb+I1Bc0aZY9+PHoXb+M5gH0YjzeHRB5X+5MsFhyCFeXvgAeYXQU+tVkE7/46ZFdU58BFpJDFgVfqpisR36OrPfXce/tZKZ5kFZFZjcIfRtBrKxyBtrjM3azxLA5GfgX4wEuojTn9QWQAJhsVAAIwETfrTVJVEQGK/OCFipOUjcB06WbCNP/fux/qc2kfhCYsGObS8tsSLDkPpCVrOHWYOWJHYJv4y86wsaimCSa7KEwMnsNjo9rZuD8jjD0xeywckV0XqDG7sJKpCKrVWEA9/I9Rwe1xJB8sFJnV5WFO+qw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(55016002)(71200400001)(478600001)(33656002)(26005)(8936002)(83380400001)(8676002)(186003)(4326008)(52536014)(9686003)(7696005)(7416002)(5660300002)(44832011)(66446008)(66556008)(54906003)(2906002)(76116006)(91956017)(64756008)(66946007)(110136005)(66476007)(53546011)(316002)(6506007)(86362001)(30864003)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?yYMESr9V8shyoWZBdzWx3Yn2qkMGT7FonQXDvFkw5CV3Lw7ZNaf5H6oa5E?=
 =?iso-8859-1?Q?BkzpBJWcqnFHikKkig5+pYTtnLnqfX3T2HDMU3L/1jz/yTzmUuBUIQAF7O?=
 =?iso-8859-1?Q?uARvsrR3bdc3Q9EbgJHzetilU9EaJTmWXP+5P2y7tyHVHcNIThGl7weJ+3?=
 =?iso-8859-1?Q?KYfPlCeokhuB5o6jZ14r+ha1FM0xypIFFbBt2ttzC2GZlu5kP+esvDwBT+?=
 =?iso-8859-1?Q?iPboQKzQaQQcjpm3snwBRou0uaRsaMTHuqONCGJkUHxPC/pIxP3k0C32AQ?=
 =?iso-8859-1?Q?6mL2aAf6IuXZi3bs0ufOZs2j9gPwSOgzEmMW3Bh+ABWIt1mNYeApEem3/J?=
 =?iso-8859-1?Q?QDGYh08Ws/PknkJ9UsdwS1ojex2Sm3N2dnRBxwPvbal9wUlLcdtJB1AVk7?=
 =?iso-8859-1?Q?tmSpTiPvZYSu7u4agiPH0NW51ps1PZ8yDfOI67xtaGM1NPgW161cn/JJU6?=
 =?iso-8859-1?Q?YqhbrM2LgjS7wO0PFoCO5wXr2AUv2WLqB1YdbrDpUZ2kIbokxufaC/GcEE?=
 =?iso-8859-1?Q?ImpqRnrhbfU4A/RA8V+p0sPN+LpdZET6Almb3JA8WEwO30R0xMK+/itVUm?=
 =?iso-8859-1?Q?vQv6Atbu4cEaeUlU156FJyEAohXsro1kIUw3OUnkIiqQHwyo+kYTzrvmS2?=
 =?iso-8859-1?Q?SNiGkbxGQy3p9k6uH1m5iJdag4Hu2cPz3q1c+dxXhio9SE2dDYML04iGu1?=
 =?iso-8859-1?Q?PGR84QcA/VGz6LT6g+NE9qxtn68CSYDJLGkJHmY//ScLTdE1ghZfAdrgqe?=
 =?iso-8859-1?Q?s1o9RjIHVVXaC3r+miZf9O8LgFtblWAoAyZkPxJxtYAkhxRzF3Y9RLgVod?=
 =?iso-8859-1?Q?JrGMHE7lAYxSMIncsgQDUtD30ctAkeWs0YQ0DDaIugySibpzG0zybHokP3?=
 =?iso-8859-1?Q?FbOjX0cAZ8w8R8AE8RYwtM+JuOpSMrSQROo+uzgVqiFy1h6j6O0P27A++W?=
 =?iso-8859-1?Q?oODjdpTP6Ush728GWKI9e0P0fOyFjWgzh/KCnSDVVDQPAHch+tXmy8bFDy?=
 =?iso-8859-1?Q?UjeHAODt+IctS6MGB/S/SSeWYYFi6DZAIyotOVzGLzXXZJr6tcLvRgyuw2?=
 =?iso-8859-1?Q?nHIZzfJlYMXAzARTK3uKG07dHFkvBss0bpwfni+ivVM4geXAfujkkFgUu7?=
 =?iso-8859-1?Q?2gKtuk1+hG68CE2/5kR8jaDE2BkZD++foe9hcoar4VXgiIWznzE0tk2Rtw?=
 =?iso-8859-1?Q?fi51TK5x+KxjAw/rxtHy66A+DFRN2smvh3ck1/qwKR7HGQCdqfhNzc9IaH?=
 =?iso-8859-1?Q?Mzma6YVGKaRCRxCQ78yLZYLj8AJ9Vc7hdli80Q7sqq1nx9QsnO5xarLRag?=
 =?iso-8859-1?Q?ExDD/4jBVF8Vz8mX/E/jgIkkopOowRQgILi5MpD6gqygV8E=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f8238a-117f-4e69-538d-08d8e2eb71fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 11:06:52.8759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QTkug2uZx2yP1AYEMMJQzZho3nC6ttPnGFKaRuOZ9x+pFAfaN4bLexEAUV+JZgnvlk+Sp28o0XmZCj13wMuO9dN9JZkBtktUvz0k8kykTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2896
X-OriginatorOrg: citrix.com

The impact on the OCaml side is minimal and looks good to me.

Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Roger Pau Monne <roger.pau@citrix.com>
Sent: 09 March 2021 10:56
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne; Ian Jackson; Wei Liu; Andrew Cooper; George Dunlap; Ja=
n Beulich; Julien Grall; Stefano Stabellini; Anthony Perard; Christian Lind=
ig; David Scott; Jun Nakajima; Kevin Tian; Boris Ostrovsky
Subject: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible MS=
R behavior selection

Introduce an option to allow selecting a behavior similar to the pre
Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
handled by Xen result in the injection of a #GP to the guest. This
is a behavior change since previously a #GP was only injected if
accessing the MSR on the real hardware would also trigger a #GP, or if
the attempted to be set bits wouldn't match the hardware values (for
PV).

This seems to be problematic for some guests, so introduce an option
to fallback to this kind of legacy behavior without leaking the
underlying MSR values to the guest.

When the option is set, for both PV and HVM don't inject a #GP to the
guest on MSR read if reading the underlying MSR doesn't result in a
#GP, do the same for writes and simply discard the value to be written
on that case.

Note that for guests restored or migrated from previous Xen versions
the option is enabled by default, in order to keep a compatible
MSR behavior. Such compatibility is done at the libxl layer, to avoid
higher-level toolstacks from having to know the details about this flag.

Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Boris, could you please test with Solaris to see if this fixes the
issue?
---
Changes since v2:
 - Apply the option to both HVM and PV guest.
 - Handle both reads and writes.
 - Rename to msr_relaxed.
 - Introduce a Xen commnad line option to set it for dom0.
 - Set it unconditionally for guests being restored or migrated from
   previous Xen versions.
 - Provide the option to dom0.
 - Attempt at adding the ocaml helpers (build tested only).

Changes since v1:
 - Only apply the option to HVM guests.
 - Only apply the special handling to MSR reads.
 - Sanitize the newly introduced flags field.
 - Print a warning message when the option is used.
---
 docs/man/xl.cfg.5.pod.in            | 19 +++++++++++++++++++
 docs/misc/xen-command-line.pandoc   | 17 ++++++++++++++++-
 tools/include/libxl.h               |  7 +++++++
 tools/libs/light/libxl_arch.h       |  5 +++++
 tools/libs/light/libxl_arm.c        |  6 ++++++
 tools/libs/light/libxl_create.c     |  7 +++++++
 tools/libs/light/libxl_internal.c   |  3 +++
 tools/libs/light/libxl_types.idl    |  2 ++
 tools/libs/light/libxl_x86.c        | 20 ++++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.ml      |  4 ++++
 tools/ocaml/libs/xc/xenctrl.mli     |  4 ++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 10 ++++++++++
 tools/xl/xl_parse.c                 |  7 +++++++
 xen/arch/x86/dom0_build.c           |  3 +++
 xen/arch/x86/domain.c               |  9 +++++++++
 xen/arch/x86/hvm/svm/svm.c          | 10 ++++++++++
 xen/arch/x86/hvm/vmx/vmx.c          | 10 ++++++++++
 xen/arch/x86/pv/emul-priv-op.c      | 10 ++++++++++
 xen/arch/x86/setup.c                |  1 +
 xen/include/asm-x86/domain.h        |  3 +++
 xen/include/asm-x86/setup.h         |  1 +
 xen/include/public/arch-x86/xen.h   |  8 ++++++++
 22 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 040374dcd6..72b7927483 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2861,6 +2861,25 @@ No MCA capabilities in above list are enabled.

 =3Dback

+=3Ditem B<msr_relaxed=3DBOOLEAN>
+
+Select whether to use a relaxed behavior for accesses to MSRs not explicit=
ly
+handled by Xen instead of injecting a #GP to the guest.  Such access mode =
will
+force Xen to replicate the behavior from the hardware it's currently runni=
ng
+on in order to decide whether a #GP is injected to the guest for MSR reads=
.
+Note that the guest is never allowed to read the value of unhandled MSRs, =
this
+option only changes whether a #GP might be injected or not.  For writes a =
#GP
+won't be injected as long as reading the underlying MSR doesn't result in =
a
+#GP.
+
+This option will be removed in future releases once we are certain the def=
ault
+MSR access policy has been properly tested by a wide variety of guests.  I=
f you
+need to use this option please send a bug report to
+xen-devel@lists.xenproject.org with the details of the guests you are runn=
ing
+that require it.
+
+=3Dback
+
 =3Dback

 =3Dhead1 SEE ALSO
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 4737c92bfe..6cf61a5c57 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -740,7 +740,7 @@ Specify the bit width of the DMA heap.

 ### dom0
     =3D List of [ pv | pvh, shadow=3D<bool>, verbose=3D<bool>,
-                cpuid-faulting=3D<bool> ]
+                cpuid-faulting=3D<bool>, msr-relaxed=3D<bool> ]

     Applicability: x86

@@ -789,6 +789,21 @@ Controls for how dom0 is constructed on x86 systems.
     restore the pre-4.13 behaviour.  If specifying `no-cpuid-faulting` fix=
es
     an issue in dom0, please report a bug.

+*   msr-relaxed: Select whether to use a relaxed behavior for accesses to =
MSRs
+    not explicitly handled by Xen instead of injecting a #GP to dom0.
+    Such access mode will force Xen to replicate the behavior from the har=
dware
+    it's currently running on in order to decide whether a #GP is injected=
 to
+    dom0 for MSR reads.  Note that dom0 is never allowed to read the value=
 of
+    unhandled MSRs, this option only changes whether a #GP might be inject=
ed
+    or not.  For writes a #GP won't be injected as long as reading the
+    underlying MSR doesn't result in a #GP.
+
+    This option will be removed in future releases once we are certain the
+    default MSR access policy has been properly tested by a wide variety o=
f
+    guests.  If you need to use this option please send a bug report to
+    xen-devel@lists.xenproject.org with the details of the guests you are
+    running that require it.
+
 ### dom0-iommu
     =3D List of [ passthrough=3D<bool>, strict=3D<bool>, map-inclusive=3D<=
bool>,
                 map-reserved=3D<bool>, none ]
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index a7b673e89d..ae7fe27c1f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -495,6 +495,13 @@
  */
 #define LIBXL_HAVE_VMTRACE_BUF_KB 1

+/*
+ * LIBXL_HAVE_X86_MSR_RELAXED indicates the toolstack has support for swit=
ching
+ * the MSR access handling in the hypervisor to relaxed mode. This is done=
 by
+ * setting the libxl_domain_build_info arch_x86.msr_relaxed field.
+ */
+#define LIBXL_HAVE_X86_MSR_RELAXED 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index c305d704b1..8527fc5c6c 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -85,6 +85,11 @@ int libxl__arch_extra_memory(libxl__gc *gc,
                              const libxl_domain_build_info *info,
                              uint64_t *out);

+_hidden
+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src);
+
 #if defined(__i386__) || defined(__x86_64__)

 #define LAPIC_BASE_ADDRESS  0xfee00000
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 5e2a209a8b..e2901f13b7 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1222,6 +1222,12 @@ int libxl__arch_passthrough_mode_setdefault(libxl__g=
c *gc,
     return rc;
 }

+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src)
+{
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_creat=
e.c
index 46f68da697..1131b2a733 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -2287,6 +2287,13 @@ int libxl_domain_create_restore(libxl_ctx *ctx, libx=
l_domain_config *d_config,
         unset_disk_colo_restore(d_config);
     }

+    /*
+     * When restoring (either from a save file or for a migration domain) =
set
+     * the MSR relaxed mode for compatibility with older Xen versions if t=
he
+     * option is not set as part of the original configuration.
+     */
+    libxl_defbool_setdefault(&d_config->b_info.arch_x86.msr_relaxed, true)=
;
+
     return do_domain_create(ctx, d_config, domid, restore_fd, send_back_fd=
,
                             params, ao_how, aop_console_how);
 }
diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_int=
ernal.c
index d93a75533f..86556b6113 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -16,6 +16,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */

 #include "libxl_internal.h"
+#include "libxl_arch.h"

 void libxl__alloc_failed(libxl_ctx *ctx, const char *func,
                          size_t nmemb, size_t size) {
@@ -594,6 +595,8 @@ void libxl__update_domain_configuration(libxl__gc *gc,

     /* video ram */
     dst->b_info.video_memkb =3D src->b_info.video_memkb;
+
+    libxl__arch_update_domain_config(gc, dst, src);
 }

 static void ev_slowlock_init_internal(libxl__ev_slowlock *lock,
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index 5b85a7419f..f45adddab0 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -644,6 +644,8 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
                               ])),
+    ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                              ])),
     # Alternate p2m is not bound to any architecture or guest type, as it =
is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 58187ed760..1656f2c730 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -19,6 +19,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         abort();
     }

+    config->arch.domain_flags =3D 0;
+    if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
+        config->arch.domain_flags |=3D XEN_X86_MSR_RELAXED;
+
     return 0;
 }

@@ -809,6 +813,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc=
 *gc,
                                               libxl_domain_build_info *b_i=
nfo)
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
+    libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
 }

 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
@@ -851,6 +856,21 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc =
*gc,
     return rc;
 }

+void libxl__arch_update_domain_config(libxl__gc *gc,
+                                      libxl_domain_config *dst,
+                                      const libxl_domain_config *src)
+{
+    /*
+     * Force MSR relaxed to be set (either to true or false) so it's part =
of
+     * the domain configuration when saving or performing a live-migration=
.
+     *
+     * Doing so allows the recovery side to figure out whether the flag sh=
ould
+     * be set to true in order to keep backwards compatibility with alread=
y
+     * started domains.
+     */
+    libxl_defbool_setdefault(&dst->b_info.arch_x86.msr_relaxed,
+                    libxl_defbool_val(src->b_info.arch_x86.msr_relaxed));
+}

 /*
  * Local variables:
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.m=
l
index a02e26b27f..4789e42e91 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -48,9 +48,13 @@ type x86_arch_emulation_flags =3D
        | X86_EMU_USE_PIRQ
        | X86_EMU_VPCI

+type x86_arch_domain_flags =3D
+       | X86_MSR_RELAXED
+
 type xen_x86_arch_domainconfig =3D
 {
        emulation_flags: x86_arch_emulation_flags list;
+       domain_flags: x86_arch_domain_flags list;
 }

 type arch_domainconfig =3D
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.=
mli
index d2a312e273..566c12cb26 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -42,8 +42,12 @@ type x86_arch_emulation_flags =3D
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI

+type x86_arch_domain_flags =3D
+  | X86_MSR_RELAXED
+
 type xen_x86_arch_domainconfig =3D {
   emulation_flags: x86_arch_emulation_flags list;
+  domain_flags: x86_arch_domain_flags list;
 }

 type arch_domainconfig =3D
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenc=
trl_stubs.c
index 9a8dbe5579..2f658a6418 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -233,6 +233,16 @@ CAMLprim value stub_xc_domain_create(value xch, value =
wanted_domid, value config

 #undef VAL_EMUL_FLAGS

+#define VAL_DOMAIN_FLAGS        Field(arch_domconfig, 1)
+
+               cfg.arch.domain_flags =3D ocaml_list_to_c_bitmap
+                       /* ! x86_arch_domain_flags X86_ none */
+                       /* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+
+                       (VAL_DOMAIN_FLAGS);
+
+#undef VAL_DOMAIN_FLAGS
+
 #else
                caml_failwith("Unhandled: x86");
 #endif
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1893cfc086..9fb0791429 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2741,6 +2741,13 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);

+    if (!xlu_cfg_get_defbool(config, "msr_relaxed",
+                             &b_info->arch_x86.msr_relaxed, 0))
+            fprintf(stderr,
+                    "WARNING: msr_relaxed will be removed in future versio=
ns.\n"
+                    "If it fixes an issue you are having please report to =
"
+                    "xen-devel@lists.xenproject.org.\n");
+
     xlu_cfg_destroy(config);
 }

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0ce29e91a3..74b443e509 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -256,6 +256,7 @@ bool __initdata opt_dom0_shadow;
 #endif
 bool __initdata opt_dom0_pvh =3D !IS_ENABLED(CONFIG_PV);
 bool __initdata opt_dom0_verbose =3D IS_ENABLED(CONFIG_VERBOSE_DEBUG);
+bool __initdata opt_dom0_msr_relaxed;

 static int __init parse_dom0_param(const char *s)
 {
@@ -282,6 +283,8 @@ static int __init parse_dom0_param(const char *s)
         else if ( IS_ENABLED(CONFIG_PV) &&
                   (val =3D parse_boolean("cpuid-faulting", s, ss)) >=3D 0 =
)
             opt_dom0_cpuid_faulting =3D val;
+        else if ( (val =3D parse_boolean("msr-relaxed", s, ss)) >=3D 0 )
+            opt_dom0_msr_relaxed =3D val;
         else
             rc =3D -EINVAL;

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5e3c94d3fa..86e5b506ce 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -683,6 +683,13 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
         }
     }

+    if ( config->arch.domain_flags & ~XEN_X86_MSR_RELAXED )
+    {
+        dprintk(XENLOG_INFO, "Invalid arch domain flags %#x\n",
+                config->arch.domain_flags);
+        return -EINVAL;
+    }
+
     return 0;
 }

@@ -852,6 +859,8 @@ int arch_domain_create(struct domain *d,

     domain_cpu_policy_changed(d);

+    d->arch.msr_relaxed =3D config->arch.domain_flags & XEN_X86_MSR_RELAXE=
D;
+
     return 0;

  fail:
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b819897a4a..4585efe1f8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, u=
int64_t *msr_content)
     const struct domain *d =3D v->domain;
     struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
     const struct nestedsvm *nsvm =3D &vcpu_nestedsvm(v);
+    uint64_t tmp;

     switch ( msr )
     {
@@ -1965,6 +1966,12 @@ static int svm_msr_read_intercept(unsigned int msr, =
uint64_t *msr_content)
         break;

     default:
+        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content =3D 0;
+            break;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gpf;
     }
@@ -2151,6 +2158,9 @@ static int svm_msr_write_intercept(unsigned int msr, =
uint64_t msr_content)
         break;

     default:
+        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
+            break;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  msr, msr_content);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index bfea1b0f8a..b52824677e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3123,6 +3123,7 @@ static int is_last_branch_msr(u32 ecx)
 static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr =3D current;
+    uint64_t tmp;

     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=3D%#x", msr);

@@ -3204,6 +3205,12 @@ static int vmx_msr_read_intercept(unsigned int msr, =
uint64_t *msr_content)
             break;
         }

+        if ( curr->domain->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content =3D 0;
+            break;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gp_fault;
     }
@@ -3505,6 +3512,9 @@ static int vmx_msr_write_intercept(unsigned int msr, =
uint64_t msr_content)
              is_last_branch_msr(msr) )
             break;

+        if ( v->domain->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) =
)
+            break;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  msr, msr_content);
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.=
c
index e5a22b9347..74e71403ff 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
     const struct domain *currd =3D curr->domain;
     const struct cpuid_policy *cp =3D currd->arch.cpuid;
     bool vpmu_msr =3D false;
+    uint64_t tmp;
     int ret;

     if ( (ret =3D guest_rdmsr(curr, reg, val)) !=3D X86EMUL_UNHANDLEABLE )
@@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
+        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
+        {
+            *val =3D 0;
+            return X86EMUL_OKAY;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
         break;

@@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
+        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
+            return X86EMUL_OKAY;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  reg, val);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 23bbb6e8c1..d217c223b0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -749,6 +749,7 @@ static struct domain *__init create_dom0(const module_t=
 *image,
         .max_grant_frames =3D -1,
         .max_maptrack_frames =3D -1,
         .max_vcpus =3D dom0_max_vcpus(),
+        .arch.domain_flags =3D opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED =
: 0,
     };
     struct domain *d;
     char *cmdline;
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 3900d7b48b..7213d184b0 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -437,6 +437,9 @@ struct arch_domain
     /* Mem_access emulation control */
     bool_t mem_access_emulate_each_rep;

+    /* Don't unconditionally inject #GP for unhandled MSRs. */
+    bool msr_relaxed;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/include/asm-x86/setup.h b/xen/include/asm-x86/setup.h
index 642a5e8460..24be46115d 100644
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -65,6 +65,7 @@ extern bool opt_dom0_shadow;
 extern bool opt_dom0_pvh;
 extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
+extern bool opt_dom0_msr_relaxed;

 #define max_init_domid (0)

diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x8=
6/xen.h
index 629cb2ba40..f9d0e33b94 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -304,6 +304,14 @@ struct xen_arch_domainconfig {
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIR=
Q |\
                                      XEN_X86_EMU_VPCI)
     uint32_t emulation_flags;
+
+/*
+ * Select whether to use a relaxed behavior for accesses to MSRs not expli=
citly
+ * handled by Xen instead of injecting a #GP to the guest. Note this optio=
n
+ * doesn't allow the guest to read or write to the underlying MSR.
+ */
+#define XEN_X86_MSR_RELAXED (1u << 0)
+    uint32_t domain_flags;
 };

 /* Location of online VCPU bitmap. */
--
2.30.1


