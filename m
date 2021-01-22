Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8A300855
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 17:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72936.131480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2z2N-0007vX-Mb; Fri, 22 Jan 2021 16:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72936.131480; Fri, 22 Jan 2021 16:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2z2N-0007v8-JP; Fri, 22 Jan 2021 16:11:51 +0000
Received: by outflank-mailman (input) for mailman id 72936;
 Fri, 22 Jan 2021 16:11:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypQx=GZ=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1l2z2M-0007v3-82
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:11:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ea37abc-4c28-42db-a4bc-4e54abecc012;
 Fri, 22 Jan 2021 16:11:48 +0000 (UTC)
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
X-Inumbo-ID: 5ea37abc-4c28-42db-a4bc-4e54abecc012
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611331908;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E8RfQaF4CLubzTiDYwyIq6c91qsMZ8+HS25TRGoRWEA=;
  b=OprqWvQdA4sluKLJ9lgjmXV9jH8+8lQWkxT22Q98p5/SFNtd3GyWVwpv
   sfxIQ6gQRvlskyGs65iL9/oukQ2I+65NRGD9i0gbKmsykg/7Z8B89LSjp
   U4LVDgdo5XTNciZlzSLF6O60bEg9nUQEJilBbWvBZobz5Qy2WiVUeoX4e
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rCUIUpG3vKB1+g1FjWEZmcq0AsR/qw9VUM8p41JJYAWtGwPAXS2op1McoIoZxN7Bi6wARv10IW
 Z9arKElygLs6CgTzMwfuv+o7QDIqDQR73qu7K72i/ie+Hi0NJzqZbAncMHtdtad2cW6ulY5U0v
 3iYXhVwh1+m2pE0aiY0We2a6oIh27kqc60bhf+vyzr1nrVu10gyp+/6ULsrhU6xq8XHMTP73O5
 +lxaeOorxSvh304MBtD5WmY763Iq8A0IjxGAR/XQU2QUaFWuMNVX451KfRSC+/VCxirERXmnyK
 Yr8=
X-SBRS: 5.2
X-MesageID: 36979059
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,366,1602561600"; 
   d="scan'208";a="36979059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ynu1NNa0+5LZVT0F3SRJBQ0hN2m9Jp6oSDWXgwhLcRJ6rEgXSkWaNxVAwrqUHIwoSXSTZMS68gNGeNR2TXkVD30MVDgR8p9WdVQNWpfmGuGwHCRoX4lbFFXgmfLA6VPsyc6krJR/6Uttjbw3GdXNAr4ASRKbdfwyGApdhsS0EGmHMFibwpKvzN92T2RArw8xnKgvzCJYQt1fzMdaNSwIssRZQqBEWZVe3gUWhXBplDHcArrSAGG406QSXQh4lCaRzBIGgRDhDrsm5zhF6aYylFwvPKZ9DZwoTF1+vYIjgW0R3rM7TwhWPL2mjdgcASwa7S6ixLTF5U5SqWXPEj1wQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8v2hNjW/DwGAOiS6xZJlTgwoULslzdn9Zop57gyJPA=;
 b=W2BtpQQSHmGtJngu3cVPtfgY/NRZ5AK/Wo9ut4xQl6tK5B1Vt397290UIL9+ZdoBTg/Z1JqPGnOJ4UnEjSwHQlyjaKnQvwSzOJR9rBRL+dZjYKjh0SeD7ww4ghN69TB1V2/tO5d9in/nPNEKFD9LCO+IUgROj4ykFmI7z5qzDvquS+WOVA24we47AdD8886yOVoqCNLu4NwQkUOESi2gZT/ZsgE4LyXCLXMJpYaeGFlgrtRsuqDknoHjaVduEwOKb0ldu3hbffrFAtdNqxNseBwM1ZRXmqOUyoHaaUrDnGMgcW4xGMRcCiCYfh9sV+FPO/WhC+CJnQDPmXZl7DX6mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8v2hNjW/DwGAOiS6xZJlTgwoULslzdn9Zop57gyJPA=;
 b=UiWtI1AxQbVGe7gHvcxfsFOtFT7o+SKTupEuJLRlzkfYRlFc3q6OZMlrABXkqgqaSvPmPOgUniV2PIXwf+F569PIuss02CkFd+pCSoloM4QF82vFoRksLK8OJykP56ZyDknZ44WLF126ru1UegGBnfiQ791Z+h7+5i3R2QphtcA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Ian Jackson <iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Edwin Torok <edvin.torok@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, =?iso-8859-1?Q?J=FCrgen_Gro=DF?=
	<jgross@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
Thread-Topic: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
Thread-Index: AQHW8Nc+QBwVu/ASVEKuol5FG3gZMKoz0KTB
Date: Fri, 22 Jan 2021 16:11:44 +0000
Message-ID: <MWHPR03MB2445B9D3D961A4323A708DFDF6A09@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <20210122155603.23402-1-iwj@xenproject.org>,<20210122155603.23402-7-iwj@xenproject.org>
In-Reply-To: <20210122155603.23402-7-iwj@xenproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87e14c26-f602-47f2-12d5-08d8bef069bf
x-ms-traffictypediagnostic: MWHPR03MB3120:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB312091CF47913CD6EC17975AF6A09@MWHPR03MB3120.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wWgFHwKOrIZa+k8vKUv8ZLJUgtNTkbKpgtVPvHAy6GMvwDwh8WZbaXg7fkoDO0+p2wCFtrHrqgYCTzl/OWTjaDINpTCsTZ3QGEGPhQbB7Tt9G1pcDvARfed4gm4PhqQhMh0LkyAHrzn7wJR6mFuZTcYmWLzqzY4BaOJq6pz3IaaqZEHHOP/DzLwqsZ/fUDtodZaouwGkwyzxy0/EURy236Z9HiAQGoOcDi8q1lnYJd9lyYOUNLD4IhCmM1EQhGX41y1XY4GXf+q2diOY8ys74vHmhNWR9UxNY7cxYN1Gblrbc8oZcGYgvy7N8GvevyX6xZYlDnw9Ao0c0QHAjLjtHIbU1dGI06r3KmJS6u+Ds8hGuGB2z/MZXgVIktyeNp+8ISYzBnSAVsE9KL91fs88mA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(33656002)(9686003)(55016002)(8676002)(2906002)(66476007)(66446008)(64756008)(66946007)(76116006)(66556008)(5660300002)(52536014)(91956017)(83380400001)(8936002)(66574015)(71200400001)(4326008)(498600001)(107886003)(53546011)(6506007)(7696005)(44832011)(54906003)(110136005)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?LjvZhiXxd9G7yiuPpbzKtY+obnFZcW8OOdXW+xLGz3ac5vpHJJmkAKq+7z?=
 =?iso-8859-1?Q?V0Crk/mewsij6sdGeHh4ZRp4EtlrV/vr2sq/m+uMUOsCt97Q6tGnA7xUaj?=
 =?iso-8859-1?Q?+eDZv66r3jaMY1B77i6+zOYd7HtOzd2mGpXwmyBexLC44DpdgMC311J03J?=
 =?iso-8859-1?Q?XCfJXqwjkB/w09o8TJ1yUxQOymgcGckVU3GCS39jMF6KPMCEydlQtcA809?=
 =?iso-8859-1?Q?vhCJlPDFGOvL381H5u5/oRbdwvr3rJjZ8qjl+iP/Ho0kMVUjrBNM/LxJte?=
 =?iso-8859-1?Q?7uETp8KJdCH+zxtoCDeOImuKnHIbRf8CceR/e8grnZSgyQWKp/fHmOfDI2?=
 =?iso-8859-1?Q?7RqqL6eKEkZRcMRFLnMmBKIvYrXmNouabdgXrw6SRPVF+ei+qyDrg8ldD6?=
 =?iso-8859-1?Q?w38uKFb+IMjUNoOMR+3wvNKTWM24XC6LE/K0QtK2s+A+LTB8AM7opVwWc8?=
 =?iso-8859-1?Q?BXwXmrdKn8GejA7ZsFd5KIoRvCDG7GNFsHqD/RxtByBtU/79gLygX5BVK9?=
 =?iso-8859-1?Q?NUjHWfY6iFf+zo7TTMkewcgxQwGiXEge6EjH34ELaofmPETK3jGhZBpUw4?=
 =?iso-8859-1?Q?weLSR2U/A9ReTV0/5aZu3/w4dB66eh5M7z0WYlLWbREbHeNR3Uc2EfDL5V?=
 =?iso-8859-1?Q?IftWVNpZOWPd+d0A1QQlMPC/Jq4yM+6ySZqtnRm3GmdnD/MO1qwU8WU4DL?=
 =?iso-8859-1?Q?lUt+wIPik2wp7TWOxABhAYBG16oT7AviFHA5C2LLJNXTLp3SEapthWYN0x?=
 =?iso-8859-1?Q?m86u/nB4voVMAZBT4txk1c9hw/VT2IZAH7ECmPPj9B2YjqYZiPWfCsMjaq?=
 =?iso-8859-1?Q?ApbjaAMTQtyYXPDdJKf1YLyXqCdbrb9E4Yo/TSStTNWx3YORVI53Ms6J+1?=
 =?iso-8859-1?Q?JzQYAEnvv3KTuDGz9UjBeEo34mCohPimGQb4fo2t7tdVbZC0ROg69Lx8BQ?=
 =?iso-8859-1?Q?TbuTAMxE1D/7W/9oqooWbIPbkYn4oTNRnjsLdw98R1mmnX1UhJYgNIKEV/?=
 =?iso-8859-1?Q?G7UGOdOcYzW8u+Gts=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e14c26-f602-47f2-12d5-08d8bef069bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2021 16:11:44.7114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8xJA4Cr2xejtov0rg5YuNX9AgAtCr7NMigFcZuPktgx1ZZKfVqdpVDVx9bH+JMfcecaf/W+YH+hx/BAkjsKBOLKrK/V7GQkFvEWEuGz6og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3120
X-OriginatorOrg: citrix.com

> Change this, by selecting between C xenstored and Ocaml xenstored
"at random"

Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Ian Jackson <iwj@xenproject.org>
Sent: 22 January 2021 15:56
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson; Edwin Torok; Christian Lindig; Andrew Cooper; J=FCrgen Gro=
=DF; Wei Liu; Ian Jackson
Subject: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored

Previously, we let the Xen build system and startup scripts choose
which xenstored to use.  Before we upgraded to Debian buster, that
gave us C xentored tests on ARM.  Since then, armhf and arm64 have
both had enough ocaml support and we haven't been testing C xenstored
at all !

Change this, by selecting between C xenstored and Ocaml xenstored
"at random".  Actually, this is based on the job name.  So the same
job in different branches will use the same xenstored - which helps
avoid confusion.

I have diffed the output of standalone-generate-dump-flight-runvars.
As expected, this addes a variable all_host_xenstored to every job.

To make sure we have enough diversity, I eyeballed the results.  In
particular:
  * The smoke tests now have 2 C and 2 Ocaml, one of each on
    ARM and x86.
  * XTF tests have 2 oxenstored and 3 C xenstored.
  * The ovmf flight has one of each
  * The seabios and libvirt flights look reasonably mixed.

Most other flights have enough jobs that I think things are diverse
enough without looking at them all in detail.

I think this lack of testing needs fixing for the Xen 4.15 release.
So after review I intend to push this to osstest pretest, and may
force push it even if shows regressions.

CC: Edwin T=F6r=F6k <edvin.torok@citrix.com>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: J=FCrgen Gro=DF <jgross@suse.com>
CC: Wei Liu <wl@xen.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 mfi-common | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mfi-common b/mfi-common
index 35efd233..2834411f 100644
--- a/mfi-common
+++ b/mfi-common
@@ -509,6 +509,13 @@ job_create_test () {
   xenbuildjob=3D"${bfi}build-$xenarch$xsm_suffix"
   buildjob=3D"${bfi}build-$dom0arch$xsm_suffix"

+  local xenstored=3D"$xenstored"
+  if [ "$xenstored" =3D "" ]; then
+    stripy_rand "$job 2" xenstored  xenstored oxenstored
+    # Without " <n>", all XTF jobs use oxenstored
+    # With " 1", All OVMF tests use xenstored
+  fi
+
   job_create_test_filter_callback \
     "$job" "$recipe" "$toolstack" "$xenarch" "$dom0arch" "$@" || return 0

@@ -529,7 +536,8 @@ job_create_test () {

   ./cs-job-create $flight $job $recipe toolstack=3D$toolstack       \
     $RUNVARS $TEST_RUNVARS $global_runvars $most_runvars          \
-    xenbuildjob=3D$xenbuildjob buildjob=3D$buildjob $tsbuildjob "$@"
+    xenbuildjob=3D$xenbuildjob buildjob=3D$buildjob                   \
+    all_host_xenstored=3D$xenstored $tsbuildjob "$@"
 }

 usual_debianhvm_image () {
--
2.20.1


