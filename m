Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B22CCC6D7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 16:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189773.1510484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFjB-0001I7-F9; Thu, 18 Dec 2025 15:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189773.1510484; Thu, 18 Dec 2025 15:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFjB-0001FO-Bz; Thu, 18 Dec 2025 15:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1189773;
 Thu, 18 Dec 2025 15:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ars1=6Y=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vWFjA-0001FI-8s
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 15:15:40 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 667ad482-dc24-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 16:15:34 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7194.eurprd03.prod.outlook.com (2603:10a6:10:22c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 15:15:31 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:15:31 +0000
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
X-Inumbo-ID: 667ad482-dc24-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hcavef1eYK2JUIntYwsCEucLqJvsk/zZxGjjFNbIJURnVnhSwb4oQI7ZiFU1/z9CmTKSqp+4+IMdYmI5DcwdlFTurQmmpwKGtwFZ2AL9QLB/uFY8US3DWxBHH0zBWi5rc5MhJruZOqqSj45dwZOgqdAuepvOiDwP22mZJxxFXG4edI/nUDZOH1hwP6eCUKmdAcpesNbiNh0QUEG+jXzMH2Pv0XNudNDdhqL6BfRvFntHuQlocdhwquFocH2xcCO+yb28vHXnM8ajW8KbWtnFSnn/dw2E/cBabqXlIQWs1zNk+69BKj81tQ9hR6za6pBVCxBBPyPxACWCFqwaH9GA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8hmnY0aC2xdlj9g5eJ9RbkTonQqKXrtQjX0wXyKp6Q=;
 b=CkvkCF5c59UmN8kMWzOqL6cCf1rMJXAJRiv94zBSk8pDO6M+mfBXMusUDSZayt16udDqdq1opQeT/tSRQ2+1SOaVLwphnxJMoosx1zZls1yrpQNCLfpl6XQZ4q4QrJXjVI3SbX3/CNd3lQaCJEaNHeXM5R/h1YIU2qfuMqE57Pucc1GCwrR9H1ZYnIrAlr/TbmocJXxbS6CQyWisrogO0EPnS76Xk4WDrhcNIbIOHCFmj6W2k1oEhb2vBHKGNCIlrUfUst3ALQMXbY4mMTwV60bk36F6IWFrsnqIuo7cmWFCwpSwoU/Nj1f7VlTD+K0M0iCFptBG2iSCKkdePtB4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8hmnY0aC2xdlj9g5eJ9RbkTonQqKXrtQjX0wXyKp6Q=;
 b=K/eXOYZSJSNXc5q/loAY1j0eupoyh6w96CSt9e7bnwe/NI0COYCUrMo4sC8YO9yrf9sJBSlBAcIDpyVrp8HHdQbesgO6xjt9bNaJJS0EZOoalanLO0iYEyC2niK/4Ds/I90yGotiq4kE1nWuz/+P6uIr+s8OceVPNIFtDKXd7i/fhXRkg8Lhd26ISrrfFzlUXXLYmxNXGBt+UawQ/HTeD8L9W/duP/IVpnlUzBAXEFeUXkwgyO42qj9GymVNSbFvnqS7DZRv/oB1SV/e+6Uoep4QO7tOoPnksPgxagU9tl6AaNiuQo57gY8nMqmkkU8oqLkErCXdwDhAU5q9wKJ9VQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jason
 Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
Subject: [XEN][PATCH v3] coverage: extend coverage on .init and lib code
Thread-Topic: [XEN][PATCH v3] coverage: extend coverage on .init and lib code
Thread-Index: AQHccDEmmUShmwm5mkaS+qWQBIDIEg==
Date: Thu, 18 Dec 2025 15:15:31 +0000
Message-ID: <20251218151530.249065-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DB9PR03MB7194:EE_
x-ms-office365-filtering-correlation-id: 07899b37-b728-4012-fc02-08de3e4848c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?z+Qdh4Doje2bVFod4QQWKAJrT6CvJD7ILubiw5vB607iw3/3+myQQVO2sL?=
 =?iso-8859-1?Q?0RYaqywWU3YxJyk7sN89an4NiPIroDaK/hp3BJl9YlYALvs9R5emDtgm40?=
 =?iso-8859-1?Q?iHRlEAXPKch+RKseGP7silC7i1JbmXsAiqiXrav5B27E894wAaLsc+eOMW?=
 =?iso-8859-1?Q?J1hF9sSGbhE23cVOTuImNFuLMmmRY9L8dtEluxZr7r6i9lzT0pRrEJzMgB?=
 =?iso-8859-1?Q?E8QjwuIx6uXfW0a8F4P1mX/vP9YJsQtu3IaWJmmPFM6RyfkrmhZKKy6R4l?=
 =?iso-8859-1?Q?wmP9dt86PXkuRsD550bV6p6wuKPzRjNU+5RAUxec8tdgjWYDtvgSDV3ATx?=
 =?iso-8859-1?Q?dEpaGUlt3FReTexSoVb73yerIrGQ12JEx4ZEcPlcIZ4KMMDAjxy02bVLmC?=
 =?iso-8859-1?Q?t1goRnNP63pkIm5+XBKvylSQ30TId5H+jfEkitw2tElckzSpIJtmLYaHQq?=
 =?iso-8859-1?Q?EugiVweIRoZct8TmxVLDqopomtDf4CqybXM3F14TEs9reP4VCg5flYkmHR?=
 =?iso-8859-1?Q?aeDZ5vtjOQij7VOpjzYRyLVoa2lw1ccYpX42R5MMylO1qpDMkxwJTPehYf?=
 =?iso-8859-1?Q?vVk+jrpSa6K9Xeunph6dwb0XhbuS7zP5raktS6tIswfJV5D2HpcDnfw55Q?=
 =?iso-8859-1?Q?Zqmr+vGC4ahVHXvHI9Yvq1qXYYHH2+F3pIgYQTnqVKxwemeTfALp5lyhy4?=
 =?iso-8859-1?Q?FXv8chuQibXo2E2RSboC9VtFKmfV189jH4et6oLheQIxqeZUJO2yquZgQu?=
 =?iso-8859-1?Q?Own9jlZoSePAXOTJumGco+xes6P7FbcrKduThzZLYKCgciM2d2prXzJJFj?=
 =?iso-8859-1?Q?6qMT9p8WVltaZLBJ+O/zQ2iX4GUHs99sk0JmgBXg6FDyP+s4qLOLgbey9c?=
 =?iso-8859-1?Q?eDmn16azozwl67n8+GQsS6pFkH9q0CdjVkBG5xm39SEWsgeCjBr6jbvC0k?=
 =?iso-8859-1?Q?Ud4pxpY+ZPcLqoBqBjEAC0EIyO6HxtSQ0ilGPlJ0Gyf38+2wn/3I1YBmne?=
 =?iso-8859-1?Q?OMadyVni3qgKhEQdmYE6rrGAYMbjc5awt8xza7VEm2C+Vh/xVxSc0vVnvC?=
 =?iso-8859-1?Q?tWfLMiEB9lVstTahG6IW4d+S9Xh8/jJ4Aw9Y9pgCKY2j+iTkYakI1chMNu?=
 =?iso-8859-1?Q?uQxD49KrDSanhpuQwDlWD9pzy653oCUQ+G7qt9oRSzYY6DWrL6pFUQQWig?=
 =?iso-8859-1?Q?3jGpg4rYAfK3ipUDP0BgUwp8Rd9fOEYIU2Lu18CNpgBgNfI0eH8zQh4p6L?=
 =?iso-8859-1?Q?nRx301CjeGhKUz3N2QUbOIWnaSjzUQ1BqeAbSCt11bVjHH0ZCa+WgkDJHF?=
 =?iso-8859-1?Q?LUpFCFN+AaIAfQHG9aGvx/GPB0Sk8TE2xEpISrCRWWLrqnK96heRc0aJuK?=
 =?iso-8859-1?Q?dLvHtg4/6bIuE0Ltp1Y/RfqyEHG0Bl+UjsSO2uILBi39QCmOq4P8snqMnu?=
 =?iso-8859-1?Q?fkLAa33yYx/yvc5xNf5jrEKmOKY1tq0VVDrTKnoorfoxdpxT7fNMWwcOEx?=
 =?iso-8859-1?Q?BcfnfI8X3+Jq+1JiEHwxVvH0NamYz1DmMF+wUYlc3lP33baAitNrbv+jBJ?=
 =?iso-8859-1?Q?8F73umg2nmfvbM+HsXn3/ei9NTtA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4/Q0aMUQHS+JAc5ig9MbMpLqn2FoFREj0TvsIxtHQamJvORnymz6jMevTF?=
 =?iso-8859-1?Q?IdXn2iDbgFN24E54++zEw90zsh6VhJAxIbxtHyJKLYq6JsTNw1GKXTSWCd?=
 =?iso-8859-1?Q?WPT8j1tNHorylV4+Rs3w1WLa+/OUCbMuo582xOeXzzc0A91z5EAWjjiEvV?=
 =?iso-8859-1?Q?04AO3uRoowtkP2Q58mvNVwBoeqs0zxQlfocu1Lu4DHe5LWt33bAj6ew1r2?=
 =?iso-8859-1?Q?7Gfd1FKJ+y+fx61zzA+4V0rQgB1BhAGvznXfqmt+sIvIcK67FvChRNncUt?=
 =?iso-8859-1?Q?3sJ9vc/tw7fGtshr4g9pfmKUtIKAkPMgpol4138XPwebC2gjk/BO0mQSQy?=
 =?iso-8859-1?Q?6Ytp8dW5qDQ6/mn0mOXTZPanahgkQFRoXe0it3xoLVCVBGMrlnofy7NA1B?=
 =?iso-8859-1?Q?YLP9e1jwt0vQyCcbBIvyuz4nngC3j+l26vWfyFiVY9qc5CFJUgQnYTdN1X?=
 =?iso-8859-1?Q?/BztRdnUxFeXpwcNCahsC7ENkgAObI1mtdEz5F+z/nFfQ5f9xkPJYwU+xi?=
 =?iso-8859-1?Q?T+EdK0NgqgKACbG6gsXM34mzlmE0Px/r5aRJbnidq0IpiBKjUx4VmrrbQ5?=
 =?iso-8859-1?Q?xQ//LC/Kj9/yYEeHoKL7SLVARBR5WPlPiW38u5F5oRqhxcrD1sntOXSCsH?=
 =?iso-8859-1?Q?ZHvjURIMkT6k6K+0YExDvjhHem2HuVhEh2AZlZ2Yj3xE2rKAAXixK6i19R?=
 =?iso-8859-1?Q?cG1t2bzBJfB13gsBMaEMd+sjV9SdAfxKN5Uwcl89hY+MP/7gtyG2aPtJcy?=
 =?iso-8859-1?Q?ZARPYykmhPRbHo/GgcJ8108Ljxop9gH6Qh54j5eLuj/wp2Vuww3F8qUTUW?=
 =?iso-8859-1?Q?1jxo+zpzNDyALwrx+t6Y9ACMZmBdWXvuzgBQJPGnFdLLt6SA472lz+j2XG?=
 =?iso-8859-1?Q?vlCi0NTz9ua3s8EgWBjxrXvv5NOSimeO7OAnb63lUQ6qht6VJ4XwpQIJDb?=
 =?iso-8859-1?Q?CtswRUMykqNAuJkX1vmWZV1d5zADmnVKugQebnezT77kzqcl8CjYl+Hvpo?=
 =?iso-8859-1?Q?5gE2BjJS8iOFThXCVEIjaq4MeXbWNZy5wIzcbf0RK5lG5mvX7NUkU7cDp+?=
 =?iso-8859-1?Q?Sbx6DHBZGNFJLz0vuZ0FGLU9aLxXGCjR/skTMAffN/wl4SZO/yagVAGQFV?=
 =?iso-8859-1?Q?0w9cI6xUO/vrgZQIN34wFEyBBSSFKeT93vqqRlWLlxT13OyN0N4xAKVvgk?=
 =?iso-8859-1?Q?/idY3qsvq731ErwOChQMgF2xzl9iDn+cFUtZVM1sOYsOvhfgiCAzxoLYcX?=
 =?iso-8859-1?Q?i3x73olqvhyw6mkU6UODbWvvL/hTZdGuw/RV++7DHMN+H9hB1fVpg4w0Pn?=
 =?iso-8859-1?Q?X62z4rWQrEh+8Y7wDAawwdFVcj8Na450NgIxYdbYscDAskZJbhkONIArl4?=
 =?iso-8859-1?Q?oOyonMWPs2+iV1ZXmZ2lZwf+6Roacbf5mfy9RYLKFVwWp1iah0fUDf2Rnn?=
 =?iso-8859-1?Q?CnEBVr13cPSq0PPmpKfUOkxu3rGo5zsARwwxdLAiIbq9dd1bhNZqpUziwy?=
 =?iso-8859-1?Q?wEr+TQdKn98L8loPCnEfmly5xYXTV8VRrt5Rxyk/ukMtxybIbNtF4MHqoz?=
 =?iso-8859-1?Q?RCDIqaRqeIIFKimN59pAVj5E8OobjtQrqBGT3igUwdSk04YjfEDegryMur?=
 =?iso-8859-1?Q?5cOgtidU3kKBJ3golFhrZQdmQwT8WAYRL4ctp13IAU2eMJixPPDXLDyA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07899b37-b728-4012-fc02-08de3e4848c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 15:15:31.2245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kgCxoa3GRRZrrOBqJtGWD6U7CzJF/aLB30yglhxMJgjnWE8kEQwYs+izCifEeA3AymDMlprq3PEJWHVkwGFlWx4o1Vw/68mOFS/e4qxr3jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7194

From: Grygorii Strashko <grygorii_strashko@epam.com>

Extend coverage support on .init and lib code.

To enable coverage support on .init code the gcc special
section should stay in memory after Xen boot when COVERAGE=3Dy.

So, add hidden Kconfig option RELAX_INIT_CHECK "Relax strict check for
.init sections only in %.init.o files", which is selected when COVERAGE=3Dy
and allows to bypass strict check for .init sections only in %.init.o
files.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v3:
 - drop DO_NOT_FREE_INIT_MEMORY: only gcc special section should stay
   in memory after Xen boot
 - split make cmd quiet_cmd_obj_init_o on two: obj_init_check and
   obj_init_check
 - drop libfdt/libelf changes - they need additional work
   -- before v2 of this patch libfdt/libelf were out of code coverage scope
   -- v2 allowed to enable coverage for libfdt/libelf easily thanks to DO_N=
OT_FREE_INIT_MEMORY
      which kept all .init code in memory
   -- without DO_NOT_FREE_INIT_MEMORY it's not so easy any more, so drop li=
bfdt/libelf changes

changes in v2:
 - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two differen=
t things,
   both potentially reusable
 - enable coverage for libfdt/libelf always
 - enable colverage for .init always

v2: https://patchwork.kernel.org/project/xen-devel/patch/20251205193411.136=
8659-1-grygorii_strashko@epam.com/
v1: https://patchwork.kernel.org/project/xen-devel/patch/20251203222436.660=
044-1-grygorii_strashko@epam.com/
 xen/Kconfig.debug |  6 ++++++
 xen/Rules.mk      | 22 +++++++++++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c555..7770de87a44b 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -39,11 +39,17 @@ config COVERAGE
 	bool "Code coverage support"
 	depends on SYSCTL && !LIVEPATCH
 	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
+	select RELAX_INIT_CHECK
 	help
 	  Enable code coverage support.
=20
 	  If unsure, say N here.
=20
+config RELAX_INIT_CHECK
+	bool
+	help
+	  Relax strict check for .init sections only in %.init.o files.
+
 config CONDITION_COVERAGE
 	bool "Condition coverage support"
 	depends on COVERAGE && CC_HAS_MCDC
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 2b28d1ac3c18..25aeb08cbfef 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -33,11 +33,15 @@ cov-cflags-y :=3D
 nocov-y :=3D
 noubsan-y :=3D
=20
+# when coverage is enabled the gcc special section should stay in memory
+# after Xen boot
+ifneq ($(CONFIG_COVERAGE),y)
 SPECIAL_DATA_SECTIONS :=3D rodata $(foreach a,1 2 4 8 16, \
                                             $(foreach w,1 2 4, \
                                                         rodata.str$(w).$(a=
)) \
                                             rodata.cst$(a)) \
                          $(foreach r,rel rel.ro,data.$(r).local)
+endif
=20
 # The filename build.mk has precedence over Makefile
 include $(firstword $(wildcard $(srcdir)/build.mk) $(srcdir)/Makefile)
@@ -146,10 +150,9 @@ endif
 $(call cc-option-add,cov-cflags-$(CONFIG_COVERAGE),CC,-fprofile-update=3Da=
tomic)
=20
 # Reset cov-cflags-y in cases where an objects has another one as prerequi=
site
-$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
-    cov-cflags-y :=3D
+$(nocov-y) $(extra-y): cov-cflags-y :=3D
=20
-$(non-init-objects): _c_flags +=3D $(cov-cflags-y)
+$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y): _c_flags +=3D $(cov-cflags-y)
=20
 ifeq ($(CONFIG_UBSAN),y)
 # Any -fno-sanitize=3D options need to come after any -fsanitize=3D option=
s
@@ -259,8 +262,8 @@ $(obj)/%.o: $(src)/%.S FORCE
 	$(call if_changed_dep,cc_o_S)
=20
=20
-quiet_cmd_obj_init_o =3D INIT_O  $@
-define cmd_obj_init_o
+quiet_cmd_obj_init_check =3D INIT_C  $@
+define cmd_obj_init_check
     $(OBJDUMP) -h $< | while read idx name sz rest; do \
         case "$$name" in \
         .*.local) ;; \
@@ -269,12 +272,17 @@ define cmd_obj_init_o
             echo "Error: size of $<:$$name is 0x$$sz" >&2; \
             exit $$(expr $$idx + 1);; \
         esac; \
-    done || exit $$?; \
+    done || exit $$?
+endef
+
+quiet_cmd_obj_init_objcopy =3D INIT_O  $@
+define cmd_obj_init_objcopy
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=
=3D.init.$(s)) $< $@
 endef
=20
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(ob=
j)/%.o FORCE
-	$(call if_changed,obj_init_o)
+	$(if $(filter y,$(CONFIG_RELAX_INIT_CHECK)),,$(call if_changed,obj_init_c=
heck))
+	$(call if_changed,obj_init_objcopy)
=20
 quiet_cmd_cpp_i_c =3D CPP     $@
 cmd_cpp_i_c =3D $(CPP) $(call cpp_flags,$(c_flags)) -MQ $@ -o $@ $<
--=20
2.34.1

