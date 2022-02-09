Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37394AF539
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269340.463398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHotd-0005d6-HR; Wed, 09 Feb 2022 15:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269340.463398; Wed, 09 Feb 2022 15:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHotd-0005bH-DR; Wed, 09 Feb 2022 15:28:41 +0000
Received: by outflank-mailman (input) for mailman id 269340;
 Wed, 09 Feb 2022 15:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3wK=SY=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nHotc-0005bB-8s
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:28:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee5f01d1-89bc-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 16:28:30 +0100 (CET)
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
X-Inumbo-ID: ee5f01d1-89bc-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644420516;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bpg2I5WKFBKETW7gLBy9FPk34HZxeoYvF70yHK+WfW0=;
  b=HWBbsNALz8atCFCX/4B9DL2D/tJc3Q34B8sXNrjdI4r5P15NRsLrN2US
   R6Nc5tGgmlyDwRQHWUlE1M2g8h+TXF6+pXmCzVfvLEOOheQ9k5+sFQ1zr
   bMwpruoMMtm5UdW3v4zSThTrk71KjnfRJXDwWoeRn7mIxyBbdfQr90bHV
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KBMBpYGSxZBT2Ttm762+7Skl+dxS+BZ0i+8nzukQ1Gr2pPYFI2/7vna5/cqH4Y1+3NdCjazZGK
 Ax6fxKM8Z+oViuZkwd53/CQ5C2KIr3d1rPZd1H8q68HWSYy/7naPoFSVcHsX4Ns1baBB7r4SZO
 8fb+hQAsFtrD5xt3F76i4g8n0lIHCODm6cbfsYW5XwdUG7zLSzevgv1+KHLpKJVKoPyauRMFED
 CY6YVMxFGHaVdF/0KswfRBKTM2UolqhBjY37krII6PWAZt8Sh6+Dvhb81hf0BGhZTrjkSX5gMI
 r4rQM+UHH9V0S4MjrNTakpmk
X-SBRS: 5.1
X-MesageID: 63748491
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ll/hQq6xqCcCvJT+VqcK8AxRtDnBchMFZxGqfqrLsTDasY5as4F+v
 moXDGzUPPreN2TycopybIvgoxwO757Wx99iSQdopH00Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2t8w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 d9f7ZWBCiASJqTPuNsiXkdfGhhaMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALDsDtMcU6s3VpyTjfAN4tQIzZQrWM7thdtNs1rp4VQqqOO
 5tAAdZpRBjyeEFUPX4NMZ0BreiUh1faLWNgjmvA8MLb5ECMlVcsgdABKuH9RNuOQslEm1eCk
 UjP9W/5HxIyOcSWzHyO9XfErvTUgSrxVYYWFbu53v1nmluewioUEhJ+fVG2u+Wjg0iyHddWM
 VUJ+zEGpLI3skesS7HVXBCmoXjCoh8VXfJRFfE37EeGza+8ywSEAC4CRz1Iat0jvec3QyAn0
 hmCmNaBLSNrmK2YTzSa7Lj8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXdGz7qx
 CuRhDMjnLhVhskOv4254FTGjjSEtpXPCAkv6W3/XGio8wd4b46NfJGz5B7Q6vMoEWqCZgDf5
 j5ewZHYtb1QS8HW/MCQfAkTNLij9a6MAX77ukZmHLkeyDnz/HeaWY8FtVmSO3xVGsoDfDboZ
 mratgVQ+IJfMROWUENnX26iI590lPa9TLwJQtiRN4MTOcYpKGdr6QkzPRb44oz7rKQ7fUjT0
 7+/eN3kM3sVAL8PINGeF7ZEiu9DKszTKAruqXHHI/aPjOP2iJ29E+5t3L6yggYRtv7sTOL9q
 Yk3Cidy408DONASmwGOmWLpEXgELGIgGbf9oNFNe+iIL2JOQT99V6SNnO9wItw8wsy5c9skG
 FnnBye0L3Kl2hX6xfiiMCg/ONsDo74jxZ7EAcDcFQnxgCVyCWpexKwea4E2bdEaGB9LlpZJo
 w0+U5zYWJxnE22fkxxENMWVhNEyJXyD2FPVVwL4MWdXV8A7HWThpIS7FjYDAQFTV0JbQ+Nl+
 Ob+vu4aKLJeLzlf4DH+Mqrwlgjs5ihEw4qfnSLge7FuRakly6AzQwTZhf4rOcAcbxLFwzqRz
 QGNBhkE4+LKpucIHBPh3Mhodq+lTLlzGFR0BW7e4erkPCXW5DP7k4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQd8NraD2PgYlyP89/MwJEmmtiZ78KDeCRdZPgWWiTwbJ7xwadt3z
 eAksc8Qygq+lht1bYrW0nEKrzyBdyVSXb8mu5cWBJ7QpjAqklwSM4bBDiLW4Y2Ub4keOEcdP
 TLJ1rHJgK5RxxSefiNrR2TNx+dUmb8HpAtOkA0ZP12Ml9fI2q030RlW/WhlRwhZ1Ewaged6O
 2wtPExpP6SeuTxvgZEbDWyrHghAAjyf+1DwlARVxDGIERHwWzyfNnA5NMaM4FsdojBVcTVs9
 b2FzHroDGTxd8br0ypuAUNoppQPlzCqGtEuTCx/I/m4Ig==
IronPort-HdrOrdr: A9a23:7oP7i69FJ5eiVGA80ltuk+F7db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFr7X5To3SIDUO31HYbb2KjLGSjAEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadh/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHjWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNENyMIv/MmTvKe0Tt8gDg06t
 M740uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pVVFb/l/1rwKp5KuZJIMvB0vFtLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZNyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR52Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFAgFCvsukaSRloeMN4YDABfzP2zGyfHQ08n3KverKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,356,1635220800"; 
   d="scan'208";a="63748491"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ1v+TfY2S8Co6pk/Dz5MVVO8G9BB3io3eWcipubPLqjCgP4LXrfWy2ykxuH8YHwS0X6FYluLOBB1BZUZkoChCm9QKlR/k/S86JbnYtwYZsnBzA4rD/ZkTkWKIXDv7rgMVJPHqt+VOaUlI14ntf/JNVvtxdus37Vi1vx3nItBCUexVtd4ZkAWU7DJKnDlX1o8dLJcgtZ/ibREf3DdYfCVW8Z/fDA1fHKMITH9Hro+YROSrBtaBB9GdrrxXWvMNrwrVWX183xPhIb2yvqEUxcc8/fc09sedV5fZoRKAA0s1oE0IvX2CrNZlTPG/t5msNJvax74iBJ6VaHM0eULke1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpg2I5WKFBKETW7gLBy9FPk34HZxeoYvF70yHK+WfW0=;
 b=hOrETNs0oUmDxmT5WBD/2CLihrZxgRkoXCJUvnFr+iz5hWnAE8kDCM2dAl+8MyT5CQ7IEIKZmgK4A8J11GKBKjRwq7AdlKjbeF85kVempTJ1D1WRkmT2RiQxkDiREnqAF0jcrvz26J0lIsLW62B1iaPKfu6F6poGULfhyuysTa4IkbFSmX3t6D+i4hhQymdV0qFwiSweWaHtIfKBoj5tlUqjzYCXliy/+fU9V8o8UGWyu4+cAL2TqgBqBwSP9QOz5galjHRzetM208da7HSQLm3c2eaAuuc9i/ITxIyBNWM+CLmPwdbs5OdkF4pBmDUZt3rGaNrxVVu+U6ruDf5cDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpg2I5WKFBKETW7gLBy9FPk34HZxeoYvF70yHK+WfW0=;
 b=GLKYVnwQ6s/akRygmceWQMpz7B8UfZo8FM4Av4HLRSCv7bR5mkJ9P0DNx8NoJIf7geDR4ITvbx3H4jfMsSWeHrPzHxcQjQ9Z0bXyR2i3olc+5ezmiBe52PQABHhIAigXloDG0L7+0HdDfh73u5jrDi0z87u8be3YbI8/kNdMk5w=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYHE+TdJl64aH33EedeR0PZ4zblKyJx9wAgAFf6oCAABb6gIAAHAAA
Date: Wed, 9 Feb 2022 15:28:31 +0000
Message-ID: <b4521aed-56dc-0049-5535-447621fd112d@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgKLpCnhjP18c7oo@Air-de-Roger>
 <2567d4cd-b27b-df0b-d449-c486ab13c672@citrix.com>
 <YgPGHyVdSWrPwcWD@perard.uk.xensource.com>
In-Reply-To: <YgPGHyVdSWrPwcWD@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 880e1969-5bfa-45da-24df-08d9ebe0d41b
x-ms-traffictypediagnostic: SJ0PR03MB6952:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR03MB6952E662CB58C69F536BC5A3812E9@SJ0PR03MB6952.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1K15j+8o42Y50K8JX7/P7E8WoG7lmJz0AbYHebj5eqsIWcOqEynOVLwDOmd4DeLzlggCeRnlP+Za6c7h+VqLt67AO4hzpr5DuE3Hxke+PCkfv1rd9tSzGjJ8E5OOTN0N6KbJtkqRkDrUbIHVAL6+6EyD2sFkSvW8EYNORwoPcf4d81AbZ0FUXh47qFsI6qBY65cjzleIqznHAYJmajIcZhtrwGwj4J4U1WyHxYyh0hYrDh88Wa5Rz5E5NbApTCH5GB0DhwnYzyP/GCtF4qFGG+ITzXddSGEkvatlyLCh2lc9wSnXWtOnBab5Kri+zXFXCwxjJfHMGMOJiQsStvwgHr3DFBDLkh7Ka0+UJmFoe4qgdB1kg7P0mVreMH5OVzAmVfEvwHT3/D/SFkIV7bDM41N7JdV1Qik08Vceg/l/Q1pjH1lpxKhCYCnYmuiqjbVkdmZXLo5OrjWmMoBM8r7GniEskDl6eVtKVE+6a4CX62TmR+b52DWdm8Cx1tJTl9E5KGvkwlm0omgWowtZMj1f6WTjm/AxfEEGqGWTNiq/G0KOwkhkdqx1Ub+H1hyaEbdOPEOJbYa+enzdIDjb4CeRRlqps7/an8Gu1cYPUDpi6nT5DkkAZXDaWrM5XEnc2OOfiJZS/SmEdsgFcafmKPILexPKRbT4VG0bDAerQaymja9Lov8g3F4Jw8W9Z/63u9pco2kumMRc+xX6ZKs5IKkUNDYOzOcEdXIaygCazHC9DHtwlJ3i5lukJ8dFLbNXwyhP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(6862004)(4326008)(66946007)(122000001)(91956017)(38070700005)(86362001)(8676002)(66446008)(7416002)(66556008)(31696002)(5660300002)(66476007)(54906003)(53546011)(316002)(6486002)(64756008)(508600001)(6512007)(36756003)(76116006)(6506007)(6636002)(37006003)(186003)(2616005)(31686004)(38100700002)(71200400001)(2906002)(82960400001)(26005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlM1YzFGaktub1daeGNjWEl5WmZCZXpoTjlIY0FLYjNDeURKRlBWQ1JKQjdp?=
 =?utf-8?B?a3ZHRGRoSC9TQWl6dDZkWHV6aFVENWlwaGljZjhLZmNOdDBHck5Da1JsVkd2?=
 =?utf-8?B?RG9jVVkwdTBad3BlY1A0Mk1DZjJqcDErbWJ0ako5bDcvTEg0U29aNkhTd055?=
 =?utf-8?B?eit2enlFYjVXeUpNSk5EN1pSSjA3TERxUXlXYzF1dzR5NDkwSmNyWE5GVmR4?=
 =?utf-8?B?WHhObTZnQmRnbDJEbm1OVVpQYkNRVVVLWHdYNjBETUhLeXJaRllBYk1EcEhK?=
 =?utf-8?B?VFlmdGl2VGJDbUZaRUVHRG5HbitUa1RFV1lvcWFpeFVCb2dJc3pYdnNyOVZU?=
 =?utf-8?B?SDBaTnRGQXpkcE5NcXFyemxWaktHMnVLSTRCaG8xRlNlSktrQzV4UkdDeTFK?=
 =?utf-8?B?QW16T3hvVi9qNkR4L2NEcTFRUis4R1NIOCszNUJNckptUUszUW1hdnNFVFU0?=
 =?utf-8?B?SFB4ckFMM3EyOEFGUDJaaERIeXZDZUk4VWtwSkNIRkptZnJtVjcvWXZsZ1Nh?=
 =?utf-8?B?ZzZPelBMZE4xc2JIZDFTODRGcEZuTFl0VlhYVE1MYnFzdGVoVnM0ejQyUStB?=
 =?utf-8?B?M25pQ3p5WFN4SmFuMjdUZnFBSUE2M1dHNXNyVzE1RmYxSlpYUzNXOVBMbjZ0?=
 =?utf-8?B?RU1oSFhjQndlb1BpS3l3MlBBUVZvUGtRckV0Ny94V24vbStIdS91TWtwNjJr?=
 =?utf-8?B?Z3BPREpwc2l0MnJpRjhwZmlqUE9FVDhkbVFyck4yREp0TGY0VWZpNXFpb3Ns?=
 =?utf-8?B?U3hiOUNCaTJBcjcvVWJHOUJoV1JFNnJKa0V4Q2lTWmtZTTNQaUV4elpNbEdG?=
 =?utf-8?B?am1OUkdMa01uVDMxTzg3WFJWRTVseDl5SFJtcmlzOHE4TFkxakpYUlcrTGVE?=
 =?utf-8?B?LytNeUJLVTMvdkRRSW9ibUI2ek9TVkgzQ3hVRDZRSDI4WnVwUTBuQlJYci8r?=
 =?utf-8?B?SjU3QUpDc3ByeitSYlFuZmZ1bk82RE9ZbEozaFZidnN3TXFGNGRKWWk0OTQv?=
 =?utf-8?B?c1VsTnhEVVh2aGdBV2Jod3NIdmtndFMwbEt2WThJR29COERUY05VbkhpMVBQ?=
 =?utf-8?B?dEtpUEt4c3YvWm40SFhMdW44dTJBWUNoVTNSdU9aN1lNTTJ4ZHhsZ0NBS0ls?=
 =?utf-8?B?TW84STc3N1dCNWxUb21Pck1PYUsydlJTZllhZWN5STYzMExaQnRpNTdqTHhi?=
 =?utf-8?B?bGZzYURzRzV6MC9pclQzN3Q5YmNMdVRjTjkvWS9wRmJxLzNXZ2dxMmdRRWYr?=
 =?utf-8?B?SlUwQkpWUFdCa2MrYkR1RDJzYmVjeWZVSitVZ2QxZjR0TlJhRDYxalpVWXFi?=
 =?utf-8?B?Y0wwTG5uN3M1SHBnSUdTcmF5cllTTlhyYzRmS212eFVUbFYvQlFScDE1TXZR?=
 =?utf-8?B?UVFDaTd6VXo5ZHBZVVo5VEVuL0dZczZKcktMdEVlbDhoNDV0LzJoNVJkSGZn?=
 =?utf-8?B?ZjdnYWpPZVRHa2lTczlscXNOb2twb1JNN1NRQmU4VEJIdDBnREM0SURiN2tV?=
 =?utf-8?B?d1UrQ0RNQlp5VHFCU0ZMYVdMY3JsTWk2RHNXSGFRc0V6b1BILzNzTlMvdy95?=
 =?utf-8?B?cHVjZ01iajBEN1pHeXl2NTZQZEthamNzN2tUbXdNVlNub2VSQTBCc09PTjcr?=
 =?utf-8?B?QmVYSXdrbk52Vm8zMnZ0djdKY0h5RklYdVlKd2tKVkhHRVNFVTV2ZFB3emlZ?=
 =?utf-8?B?YmpzN2QraGJzdERNV3p1c0FGenZEbngzcU1kQ2U3MEpaY05adS9vLzgvZ0di?=
 =?utf-8?B?N2ZVWkpHWDAvNHhBTHUyRzRrSG40bkR5UDNkU1VldHFtM0dBNENNSS9VQlVi?=
 =?utf-8?B?V1ZqNCs2YUJxN05BaTAyNVZQaGRUK2FESXZHdExrTmdwMlo2WER4MDVXZDRm?=
 =?utf-8?B?NStQWHcrN01oT1R2YmJmcTgycXlEejErK00yaitJNnRkeEdmMjJKTWcvZDNh?=
 =?utf-8?B?NGhjcHJyc0IySjdRQ1BhanVZMjV4RC9TYUNuMkNTN3ZDcnBOcHZhOHBnSDVC?=
 =?utf-8?B?WTV6Y3ZidGxGTTBOSC9FbVFtaDRSSXZtMUVhYlc5N0JOdEZWaWcrWG1kTWhk?=
 =?utf-8?B?c1l1TDJWaGhFa1N2Z09xQ3lvcXYzaVBFY1J0R0duWGJoV0FsRnRSTlBOVjRq?=
 =?utf-8?B?ZTVIUG9jQ2pHQ252UC83U0M1eWNnKzNiMW8zUFArYWc5UEgyZHYzbFU1cUpS?=
 =?utf-8?B?b1ZRTlBUVnpXdEVyR3k3cTdQYUpyZEY5VWZFek85VjF3NVJLbnZRREw2dlVG?=
 =?utf-8?Q?tWMT3bWUJozqXEp5Oly4xIjWeNWLXwETz+9wg+iR0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A27FFF9458A7AA4286546DA8210A8A60@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880e1969-5bfa-45da-24df-08d9ebe0d41b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 15:28:31.1980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iQLHy5n60Ixc3B01RnOlbFk1nWYn+g94l5OJ5LNgzJh841m0u3LrIn5QGoOdumgvipYmV8LdXw/naPgNOtM+QNLTRu1f9/qziHjFFD/YkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6952
X-OriginatorOrg: citrix.com

T24gMDkvMDIvMjAyMiAxMzo0OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIFdlZCwgRmVi
IDA5LCAyMDIyIGF0IDEyOjI2OjA1UE0gKzAwMDAsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+PiBP
biAwOC8wMi8yMDIyIDE1OjI2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIE1vbiwg
RmViIDA3LCAyMDIyIGF0IDA2OjIxOjAwUE0gKzAwMDAsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+
Pj4+IGRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQvdHlwZXMuZ2VuLmdvIGIvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3R5cGVzLmdlbi5nbw0KPj4+PiBpbmRleCBiMWU4NGQ1MjU4Li41
ZjM4NGI3NjdjIDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQvdHlwZXMu
Z2VuLmdvDQo+Pj4+ICsrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5nZW4uZ28NCj4+
Pj4gQEAgLTM4OSw2ICszODksMTAgQEAgUnVuSG90cGx1Z1NjcmlwdHMgRGVmYm9vbA0KPj4+PiAg
ICBEcml2ZXJEb21haW4gRGVmYm9vbA0KPj4+PiAgICBQYXNzdGhyb3VnaCBQYXNzdGhyb3VnaA0K
Pj4+PiAgICBYZW5kU3VzcGVuZEV2dGNobkNvbXBhdCBEZWZib29sDQo+Pj4+ICtBcmNoWDg2IHN0
cnVjdCB7DQo+Pj4+ICtBc3Npc3RlZFhhcGljIERlZmJvb2wNCj4+Pj4gK0Fzc2lzdGVkWDJBcGlj
IERlZmJvb2wNCj4+Pg0KPj4+IERvbid0IHlvdSBuZWVkIHNvbWUgaW5kZW50YXRpb24gaGVyZT8N
Cj4+IEkgaGFkbid0IHJlYWxpemVkIGl0IGFwcGVhcmVkIGxpa2UgdGhpcyBoZXJlIChhbmQgdGhl
IHNhbWUgaGFwcGVucyBmb3INCj4+IG90aGVyIHBhcnRzIG9mIG15IGNvZGUgYXMgSSdtIHNlZWlu
ZyBub3cpIGJlY2F1c2UgdGhlIGdpdCBvdXRwdXQgaXMNCj4+IGNvcnJlY3QuIEkgd2lsbCBmaXgg
aXQuDQo+Pj4NCj4+PiBBbHNvIG5hbWUgd291bGQgYmV0dGVyIGJlIEFzc2lzdGVkeHsyfUFQSUMg
SU1PIGlmIHBvc3NpYmxlLiBIYXZpbmcgYQ0KPj4+IGNhcGl0YWwgJ1gnIGFuZCBsb3dlcmNhc2Ug
J2FwaWMnIGxvb2tzIHJlYWxseSBzdHJhbmdlLg0KPj4gT2theS4NCj4gDQo+IA0KPiBUaGlzIGlz
IGEgZ2VuZXJhdGVkIGZpbGUsIHlvdSBjYW4ndCBjaGFuZ2UgaW5kZW50YXRpb24gb3IgZmllbGRz
IG5hbWVzLg0KPiBJdCB3b3VsZCBiZSByZWJ1aWx0IGF1dG9tYXRpY2FsbHkgaWYgeW91IGhhZCBn
b2xhbmcgaW5zdGFsbGVkIGFuZCB3aGVyZQ0KPiByZWJ1aWxkaW5nIGFsbCB0aGUgdG9vbHMuDQo+
IA0KPiBUaGVyZSdzIHR3byB3YXlzIHRvIGdlbmVyYXRlIGl0LCB5b3UgY291bGQgaW5zdGFsbCBn
b2xhbmcgYW5kIGJ1aWxkIGFsbA0KPiB0aGUgdG9vbHMuIE9yIHdpdGhvdXQgZ29sYW5nOiBqdXN0
DQo+IGBjZCB0b29scy9nb2xhbmcveGVubGlnaHQ7IG1ha2UgdHlwZXMuZ2VuLmdvYC4gQm90aCBz
aG91bGQgcmVnZW5lcmF0ZQ0KPiBib3RoICJoZWxwZXJzLmdlbi5nbyIgInR5cGVzLmdlbi5nbyIg
ZmlsZXMuDQo+IA0KPiBUaGVyZSdzIGFuIGV2ZW4gZWFzaWVyIHdheSwgdGVsbCB0aGUgY29tbWl0
dGVyIHRvIHJlZ2VuIHRoZSBmaWxlcyB3aGVuDQo+IGNvbW1pdHRpbmcgOi0pLg0KDQpPaCwgeWVh
aCBJIGZvcmdvdCB0aGV5IHdlcmUgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQuIFJpZ2h0LCB0aGFu
ayB5b3UuDQoNCkphbmUu

