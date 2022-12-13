Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D264BD9C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 20:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461126.719167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BKv-00031F-E1; Tue, 13 Dec 2022 19:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461126.719167; Tue, 13 Dec 2022 19:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BKv-0002zS-BC; Tue, 13 Dec 2022 19:53:09 +0000
Received: by outflank-mailman (input) for mailman id 461126;
 Tue, 13 Dec 2022 19:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsqc=4L=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1p5BKt-0002zI-J2
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 19:53:07 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0124.outbound.protection.office365.us [23.103.208.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c268770a-7b1f-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 20:53:06 +0100 (CET)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1692.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 19:53:02 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610%5]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 19:53:02 +0000
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
X-Inumbo-ID: c268770a-7b1f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=tnvgy/xTAJuKoLYyk/KSQLpuol8U3VjmsSAGbzsOfNnUX9eafwae9MP279xtvki9zBzrbLMQSUAmQ7nggyOKM1omI7pc6Z8CLYy5Q3VwV7V2+Jlm5pVQJG/FmeUZ3mlsYfWfftN9P9sbgfFnzrPiLFJoWRmUgcutDsbO77gQYtNee4bxdoYyicVev91fJCKz3BSf8O7fvUjFTLWAbpfSeR9Y8ZpE80/Jd1RJsEEL4rZTSPqys84F+huIS8rBkaKm9+jaR7L/hY4UaXNkkp/1jcPKZtxQcJd6f3su+JKIqlsCjmajSpf9tY7kjMMBprcsyaQ4DY8OxwrRhj6a18oZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHSvZrTZQtWFI7F16rrfG3KOpPlzn9NPjYA2g0/qmS8=;
 b=CppTCcgYWyROidHWmbHX75/ZWNdmGln7ZHwteVuSvmIC6ZnGFDPl1tIB6u/MUQTAa17FzHVs+DEZjUz1AGLgyhKfSvjYnFV+780cqoOh44skiWN3vQdM4ryhulKKn8MgSOYiMJN7DX5Fd+++AYRl0Rd90GwurmSdIgv1r/mQclFGOcaozNw1jDjp5EZARff9TgQDTHgGNQ+XQHpybPCOI2sZZZeF2V6lAZoMzjyYwWFcVLx9/IHsFUns809jh606GpHNDTo4vj1ThlrIThYXidvd+ReQSjsIe5xdZQsT8eeM1CTHzPafgSz2nlV2u5k5NlBaaSzkXliQ0JgFKe/xMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHSvZrTZQtWFI7F16rrfG3KOpPlzn9NPjYA2g0/qmS8=;
 b=rFBqmPhFr44D3GoNKdcl16bBZqxZwpRjDJtvrxytPbZdVZNqxjMcM87Yw3ZWp6YzjvQmYsHia7kile9+wdhUdRdyzRSCDNslTFWZslllTfRL8T157iKlEceyMJa3m8OYggMq3ZBuS55i3vnsKRCXe3wshq/jk4BfBiaA/l3VMkODlqTZWG2utKEE3KXfFInhB8vNqLOrtIrS/65i8mLCSTdUwKkYfPOgvtL2BLCZQ4iGzq5Y14zVWB/HuGzAzDNQe3iTiz1dOOA6dEm6Q8OlOEfSCZP0V26KBorxXKlS7bwF9E6ZcuSvfm7K/vOU7DYTA+1WN6O82tE4Il7qDHay2Q==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
CC: "Brookes, Scott" <sbrookes@RiversideResearch.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "demi@invisiblethingslab.com"
	<demi@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
Subject: [RFC 2/4] Add VMF tool
Thread-Topic: [RFC 2/4] Add VMF tool
Thread-Index: AQHZDyyCZmiYxt72lUSeSdNxVMCy4A==
Date: Tue, 13 Dec 2022 19:53:02 +0000
Message-ID:
 <BN0P110MB16421A321E63E8DE766E0C44CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 909825dd-f06a-34b3-d508-9ecb7894b4f7
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1642:EE_|BN0P110MB1692:EE_
x-ms-office365-filtering-correlation-id: 9891cc48-a4b6-4cbb-3e06-08dadd43a518
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nCakgadVebztqIerCv/2u6rfRGwe9XHMdLSO6WfssGvXzOPSU1za6JNXH6P33cRLZeKs5C2jRt094hZL1VFvpiJThW5zImmY+ww26SCTmUnjYdxjVvtk5lC8tFMnF0v9Gv/MXXvBKfinisVRWTCSby9FywhAcf5D0z4HRrRlnUj2/cXP0OuSxXMj5KSnQQkabjbL8uW4pKnDiytTjeRwhAsj0USIVWNBCyLkiiwA6yt7HAC+Dt2vazEKlASb6l3waYQc9Zk9j1ISiM0parASKeR1FFnYNDQVER5MTXZ2oINqOcdbWBM9cXmyWNXMowxTQkWOuBgUiPWy6ahWJ66wK0JQLWX9jRywH3D759xL5U9LNLq/RlicZjdUfe0zAsRB4iqWZgScP9QJ49d9Z01xG996uJumYKT+GVx6MQmaCz2Hy/dotjTUiv9geEUENZutjW6oX3Nb8HyYmbADuvwFMntXi8H7awQYIqtj6adhmVnyctFZ9tEM9wSSvjmsZ/9a2gBqWjJ/jh9e4aJqrdhA00RVZJYxSYUWkvKOlSobUWh9zJTn/NKMCSLb2mgxMGlzKgVexF5XKazsTDiRxmquQ4wXsYqQbokTG+Z0J9TFzZAS6DX+L9v5wA0skMucCw5HeKq+Up+vpxrGba1rdsaHBg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(451199015)(33656002)(5660300002)(7416002)(8936002)(83380400001)(6200100001)(6862004)(52536014)(38070700005)(2906002)(38100700002)(508600001)(71200400001)(8676002)(66556008)(6506007)(9686003)(186003)(26005)(2940100002)(66476007)(122000001)(7696005)(4326008)(76116006)(64756008)(82960400001)(54906003)(66446008)(86362001)(55016003)(66946007)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 SPxrhJKb3NQixgyTO97nAykM34le54EgEMKzDTlqZfhSN6Pq/AV/6/KCpP0N1JAYquJxPHjslVXYBxg2VLPDpb39NvfhTHrgiq6eBVL9rj08HDXNl9+4pmuqFWGjO7/EnB/PEu5nyZ+1uX6b3PB2CMcK092FvSWSR3VccbN0ZRJqXv80vKIdP8R+OhOYTxJJvGRk9HO5eolvo3J0coEx/wcH3beykKZnzbIus8Cx2paz2j3hdZtHUCCaS17Nr2xCiE0KS1VNBPNsmJENUM3d9Ox5wxIcRdzvcSyOmChFSQ97HIuTBRFHJ3FA6Bi0uBBRclKcP9WW6LmU608KwNlUcYHZFywJG/KAyk7pvvdRBPrnDmBVjS9nYAJFI4Ii5mBa6B/qlLp0Wv6QoyRVQA37RwTBvHNxjjEQQztUbGefwBc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9891cc48-a4b6-4cbb-3e06-08dadd43a518
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 19:53:02.8566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1692

VMF tool for calling vmf_op hypercall. Eventually should be merged into xl =
and=0A=
related libraries.=0A=
---=0A=
 tools/Makefile     |  1 +=0A=
 tools/vmf/Makefile | 32 +++++++++++++++++++++++++++=0A=
 tools/vmf/vmf.c    | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++=
++++=0A=
 3 files changed, 98 insertions(+)=0A=
 create mode 100644 tools/vmf/Makefile=0A=
 create mode 100644 tools/vmf/vmf.c=0A=
=0A=
diff --git a/tools/Makefile b/tools/Makefile=0A=
index 7997535..ccf36a1 100644=0A=
--- a/tools/Makefile=0A=
+++ b/tools/Makefile=0A=
@@ -9,6 +9,7 @@ SUBDIRS-y +=3D libs=0A=
 SUBDIRS-y +=3D flask=0A=
 SUBDIRS-y +=3D fuzz=0A=
 SUBDIRS-y +=3D xenstore=0A=
+SUBDIRS-y +=3D vmf=0A=
 SUBDIRS-y +=3D misc=0A=
 SUBDIRS-y +=3D examples=0A=
 SUBDIRS-y +=3D hotplug=0A=
diff --git a/tools/vmf/Makefile b/tools/vmf/Makefile=0A=
new file mode 100644=0A=
index 0000000..ac5073b=0A=
--- /dev/null=0A=
+++ b/tools/vmf/Makefile=0A=
@@ -0,0 +1,32 @@=0A=
+XEN_ROOT=3D$(CURDIR)/../..=0A=
+include $(XEN_ROOT)/tools/Rules.mk=0A=
+=0A=
+CFLAGS  +=3D $(CFLAGS_libxenctrl)=0A=
+LDLIBS  +=3D $(LDLIBS_libxenctrl)=0A=
+=0A=
+.PHONY: all=0A=
+all: build=0A=
+=0A=
+.PHONY: build=0A=
+build: vmf=0A=
+=0A=
+.PHONY: install=0A=
+install: build=0A=
+	$(INSTALL_DIR) $(DESTDIR)$(bindir)=0A=
+	$(INSTALL_PROG) vmf $(DESTDIR)$(bindir)/vmf=0A=
+=0A=
+.PHONY: uninstall=0A=
+uninstall:=0A=
+	rm -f $(DESTDIR)$(bindir)/vmf=0A=
+=0A=
+.PHONY: clean=0A=
+clean:=0A=
+	$(RM) -f $(DEPS_RM) vmf vmf.o=0A=
+=0A=
+.PHONY: distclean=0A=
+distclean: clean=0A=
+=0A=
+vmf: vmf.o Makefile=0A=
+	$(CC) $(LDFLAGS) $< -o $@ $(LDLIBS) $(APPEND_LDFLAGS)=0A=
+=0A=
+-include $(DEPS_INCLUDE)=0A=
diff --git a/tools/vmf/vmf.c b/tools/vmf/vmf.c=0A=
new file mode 100644=0A=
index 0000000..8b7b293=0A=
--- /dev/null=0A=
+++ b/tools/vmf/vmf.c=0A=
@@ -0,0 +1,65 @@=0A=
+#include <stdio.h>=0A=
+#include <string.h>=0A=
+#include <stdlib.h>=0A=
+#include <xenctrl.h>=0A=
+=0A=
+#include <xen/xen.h>=0A=
+#include <xen/vmf.h>=0A=
+=0A=
+int call(unsigned int cmd, unsigned int domid)=0A=
+{=0A=
+  int ret;=0A=
+=0A=
+  xc_interface *xch =3D xc_interface_open(NULL, NULL, 0);=0A=
+  ret =3D xc_vmf_op(xch, cmd, domid);=0A=
+  xc_interface_close(xch);=0A=
+=0A=
+  return ret;=0A=
+}=0A=
+=0A=
+void help(const char *arg0)=0A=
+{=0A=
+  printf("Usage:\n");=0A=
+  printf("  %s dump\n", arg0);=0A=
+  printf("  %s info <domid>\n", arg0);=0A=
+  printf("  %s tables <domid>\n", arg0);=0A=
+  printf("  %s unmap <domid>\n", arg0);=0A=
+  printf("  %s lock\n", arg0);=0A=
+}=0A=
+=0A=
+int get_domid(const char *str) {=0A=
+  char *endptr;=0A=
+  long domid =3D strtol(str, &endptr, 10);=0A=
+  if (domid >=3D 0)=0A=
+    return (int)domid;=0A=
+=0A=
+  printf("Invalid domid (%ld)\n", domid);=0A=
+  exit(1);=0A=
+}=0A=
+=0A=
+int main(int argc, const char* argv[])=0A=
+{=0A=
+  int domid;=0A=
+  if (argc =3D=3D 2) {=0A=
+    domid =3D DOMID_IDLE;=0A=
+  } else if (argc =3D=3D 3) {=0A=
+    domid =3D get_domid(argv[2]);=0A=
+  } else {=0A=
+    help(argv[0]);=0A=
+    return 0;=0A=
+  }=0A=
+=0A=
+#define ARG(cmd) ((strcmp(cmd, argv[1]) =3D=3D 0))=0A=
+=0A=
+  if (ARG("info"))=0A=
+    return call(XENVMF_dump_info, domid);=0A=
+  else if (ARG("tables"))=0A=
+    return call(XENVMF_dump_tables, domid);=0A=
+  else if (ARG("unmap"))=0A=
+    return call(XENVMF_unmap, domid);=0A=
+  else if (ARG("lock") && (argc =3D=3D 2))=0A=
+    return call(XENVMF_unmap, DOMID_IDLE);=0A=
+=0A=
+  help(argv[0]);=0A=
+  return 0;=0A=
+}=0A=
-- =0A=
2.7.4=0A=
=0A=

