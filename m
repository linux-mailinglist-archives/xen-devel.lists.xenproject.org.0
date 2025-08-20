Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C03B2E4A5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 20:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087553.1445541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uonBZ-0007zL-Qf; Wed, 20 Aug 2025 18:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087553.1445541; Wed, 20 Aug 2025 18:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uonBZ-0007xq-K1; Wed, 20 Aug 2025 18:05:21 +0000
Received: by outflank-mailman (input) for mailman id 1087553;
 Wed, 20 Aug 2025 18:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiHc=3A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uonBY-0007xk-AG
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 18:05:20 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b2dce79-7df0-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 20:05:18 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU0PR03MB9520.eurprd03.prod.outlook.com (2603:10a6:10:41f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 18:05:16 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 18:05:16 +0000
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
X-Inumbo-ID: 3b2dce79-7df0-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvSC/PKDex6n0dCkpJV+ZCvpsbsm8QuzKHtA+8kvstNhJDe0IFrSUqFVHpdYzyssUUtgY5l8eyfWO3xt0gSOzOVbBgez5vw4vrqWu8CYpMhsCclOtHZhyv9Hcf+wE8N9o0Gp29lwnnyPUlTBSPT8BHQPIekc87tmLeTtUyNfrBT/qK+lCWuth+Mu/co573+K6PDa7MyOlvrpSyT4adlW6eG590MR8gtfj9jbQLaYAA6dKOn2+BshQfrQJoHHUOWVgPrNZz6hjReurw3ciK9q2HM2/c2lanzCkagnJ4BB3+rp/jZ0BYgOiPZ0ribnaKYEc7EXaLbHcUXj9scrMjzAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSUJrm7Fx6wELtcDAKEV3aI9aIz402pWT08PIGG+1EA=;
 b=sq8QbVmW/d/eMPsz17Qb6rwbHyrJnpUXqvyQDeBkHkfbaLpXBYA2b26SgL/Pkuaq9sS/eZtOV9U5cMtREjiIQpJ/2gsBtowrEfgiOjEEaVojg48QCC9O/9Bim6yUNRY+TXNWQaMh4opgtQlbgasfRPND6vGV2re+n2VXU5Ysh9Ie2vQgtcmbokmgOzyNAIDAtpoojk9V2s7ZNQGvOvsFxMFKh/A1Hk/Dc+Bhli3GB/pK4fCAfQlL/BYIgbtjPjGQc3LMdiuEEzWCeFHmjvHu0Z0KlDUeYADKD81Bfzw76lea+u5UgCkdZtm27eqokZYWFXUE4aQfCMiCNPw1mX7BZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSUJrm7Fx6wELtcDAKEV3aI9aIz402pWT08PIGG+1EA=;
 b=UfoRTRIn2Hh2XPHj52CxOftpYrnTsHl2OT03B++QkNvqujy+mjG43QEfnY6JA1Ik3YYfvXVMZscdb+t3BXQVpIItPFnTaIptEv0rmyrLmINwPfkvkTZFH+6i7q6x5EeXD5IJyLe1BYsLSqZeecCiyhmS8/V/PFef7szOK4dvbxqYgmfyi4R443g3pXJ4IKipDG3fI+A4HBRusP1u4jTxSO6QmcPjTyUVqs4W+vnNEdhSrNrDbhLIv2xZXXkUyEmIK0gQzGsJ26ypsUzorqNFx+y6KpxKREGJSz1j4SzkYcf4cW5mXFTAHFwm94KEGCDnn0UmPs7SOgIjGwkOk4pgGQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH] common/efi: deviate Rule 2.1 violation in read_file()
Thread-Topic: [PATCH] common/efi: deviate Rule 2.1 violation in read_file()
Thread-Index: AQHcEfz7XSs2OBYVOkGOyX+FE8ObGA==
Date: Wed, 20 Aug 2025 18:05:16 +0000
Message-ID:
 <c20a58f24875806adfaf491f9c6eef2ca8682d18.1755711594.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU0PR03MB9520:EE_
x-ms-office365-filtering-correlation-id: 249b24e5-8865-4122-b359-08dde0141e37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IiL3i7d5yKz9eHA/2eAYC5ijVCIr5J6K7dMLuK/BGCPjqjU7/URFPQ7rWi?=
 =?iso-8859-1?Q?idHNtBt9T5jjy6y+WWFHNGq1+pkpvSKFGuJkKRj0UXZDPP4MJ50OExXBi7?=
 =?iso-8859-1?Q?fbyoV1+hovwC7Z3BUS+zU378+/hHBIZVC1vnzYqY9o87CP4Dy7AHXt/0iu?=
 =?iso-8859-1?Q?GLjTlSReLrpDemcgaj6o8yiSuUz+sBwM6QJ0p4rj4iJM36P/QejYY8WUKl?=
 =?iso-8859-1?Q?6pngBZ3oUJ14463DTWdEIJxIlIPPEXS2lPk3/ud63p+yfZfY8JliwxhPoN?=
 =?iso-8859-1?Q?L44/3EJSnwlzRhMcIQ7i0yT4dvly4WN7HfdsCWfxnhQaC/W5xbUO2BeIFQ?=
 =?iso-8859-1?Q?Xhy5MDwTgQ01bGxDIk0dI8q+4csYUz8Tqk80cshCBQI5P1cdeNfUGG0Lky?=
 =?iso-8859-1?Q?DQVQF9I3cyhfa7hXdajBrUlKYR92exK0IPwfzN/ilozfIG4gzE73bter/w?=
 =?iso-8859-1?Q?7OEih47XWxm1/Ps84cFbP/ir7gTME8L9Xt7Cm0c8tVFHappqnkFdbcCJlN?=
 =?iso-8859-1?Q?tD3ETVliu3NJXy8QJtAqTM1XnMOkDKsNt2Wlrl7F39lbXNd515AKWPfR8s?=
 =?iso-8859-1?Q?efEg/EW5FHuBxMU6h32cj7bUlaptgBOBdRbBJpIpdLXys6B2GP2IgbyR1p?=
 =?iso-8859-1?Q?aZNRZX2ueqSZklix48AcOIXgAsUs0N2yZq95IBn+jdDhSLm2wW7znnMfGt?=
 =?iso-8859-1?Q?D2MxCNvaZ9pLBclmznQkztuK62xFfWFUOotb2XPZQry5MmZDc3LAp/aCF7?=
 =?iso-8859-1?Q?4H2vwkOTTJdCL8qdnxGZ+gZb92Ddtwpi2CALz+wCyW9C1oT/2qo7kxT47C?=
 =?iso-8859-1?Q?JhQuETWty609B/Lvv1cYbKLFbpvcXlTZ5PAQ5f1LiGYDdQDSyEyvKCNUCq?=
 =?iso-8859-1?Q?AoPB+12glO3T3tsBus0vGeoMCydcFcTYZt0V/1bnoIXj09sj4MCj17H6Nl?=
 =?iso-8859-1?Q?EJkyMopVqpPlQZ4W2WTurqQxh9Yu4VaIca8XUH+SoahhiBZhRM9LiKdoFO?=
 =?iso-8859-1?Q?utDZsPQlFy//OmFIdStFtbOPpXFXE06Uk+vN/3o8hMOsOF60SUrUIQruCb?=
 =?iso-8859-1?Q?vsteiP8rVscCKmnjWhTEtPOTEI63xQs+v4Y7dgCUhah/je1GwhKEteNi1J?=
 =?iso-8859-1?Q?THB14UmXMss20sGad+TAOKNjoOkvcYeXlAhHD2Pm27HrQ2CXexuFlefMZK?=
 =?iso-8859-1?Q?L8g4IRd1UL0J0P7jYWSLrAqqQnq75a1fWFnDshaHXEV0h+2I4BkbnIfA8C?=
 =?iso-8859-1?Q?D+T+TXtY2EL14wPgdYHfFM36vtWeLfVJjYFXfY4lsGUiksDgXtQNGCBJ/q?=
 =?iso-8859-1?Q?32ljXL7S8So1qdeFu9VofItTFXUWKnxDUbRp47qMXb62dEL/MkoMjaPbd+?=
 =?iso-8859-1?Q?VOuKXc/J5vVohGGLhSl9cd3X188mBHHHDHxAXsz/winhQ6Aa8Vk4Ca6U/f?=
 =?iso-8859-1?Q?H7pf9s7vS8vM3BHs6wMNu0Fay6z/RFuBg9VK3WAucP86eXf0VwqGGRGvIw?=
 =?iso-8859-1?Q?Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I2+UGQTiZDoZWJFIJ8LUre6AK/GSvtQ5Jpzt3ZXV1Lplt9OxWxKfi6Hb2X?=
 =?iso-8859-1?Q?fQleW0rBLsDzjDFNAB6mbDdTRD9eE1gdycYZB99uwe6nJC3so6hckkBwlQ?=
 =?iso-8859-1?Q?wxe2j5uBZAFZ06fq8o4aIZf1dI0VeOjoz5TN4LU3hzG+1sREm8MEG5Gvbs?=
 =?iso-8859-1?Q?heuG4R9WSnV/cf588JBUMJNyiYbqv0ovHCyXekFJCoAwObrK6+lJPKDuTO?=
 =?iso-8859-1?Q?w9/W3whhyKiDbKBMLNByv+1i4+s/NL4kG9BCy6HfADeKI4ZBmrn+f/FIwE?=
 =?iso-8859-1?Q?8TP3p1HBH85b5SyAld1xNR5pkqsJTdT+5z8tG3xWfWapF6OA6ie3o+Uek6?=
 =?iso-8859-1?Q?2tlY3NG3bUGib0jKSYpvQwQONifRp/Pz6LLM/J51/8jOmAlWBXBVjZQUft?=
 =?iso-8859-1?Q?Vf2yt85BwEGT+k2hq0V9O9rzG0rGzi3EVxEpVyw7ACEVDw6hFcdP8ulkcm?=
 =?iso-8859-1?Q?lo3vm+OntEiR2GeQNDDIEhkDzK/r1jFW1ADuAP5MDpHPcbvB4JX47OHBo7?=
 =?iso-8859-1?Q?5oMNkrqyllL9+kafo7f5Va/8bbfN/Wh6leEoRrZgpFLR/Y/GI3bMArobUJ?=
 =?iso-8859-1?Q?dCWxgzjI2fNhO2/7wiDxQySqVmlObr5jH+KuAKzUkoTKwYXpWeX7OLhr3m?=
 =?iso-8859-1?Q?KUnBTUIoxa8P+8vJx/W5417iKbXCUKO7gC5xi8eTmlUHf2Fte8/dTh5Mai?=
 =?iso-8859-1?Q?mH4kYVGJUFe9JC+y/X2Bwwbm7W/zbdGi2zAED1eG1M9qZEEhN7FmBvWF5x?=
 =?iso-8859-1?Q?+5FOX7lzRUW+6U7MLLM1AHHiMST+/PhCuzaZsc/QtCIh+ceyzqwyHAFD+O?=
 =?iso-8859-1?Q?n8GJHgubLSw22LOIn1iGVU5LjAysPTUxqSsU6hh5Wv0hIbj9iHjKuwVevG?=
 =?iso-8859-1?Q?v9yTsF3GWkap5vK6CclATHO6fPmLLOUuHfLg9WolUch/mANYOOdjF0SRUr?=
 =?iso-8859-1?Q?86QLZvVodZan2lW0AL3tlo4tgCZWhXmuK36sPp2jGWlnkS2O/HxTvS1CHD?=
 =?iso-8859-1?Q?eNO8pzbbcGeBuqtVNAGPvqkscoceqzZGahcYgJPDql3ypbv+0/9QTlN4KO?=
 =?iso-8859-1?Q?T9/Ickg6v5HAOykiOuAriV7IYorglfRZ+bU1Ttsv/e5vbD62nn6SLG7S/D?=
 =?iso-8859-1?Q?LKx50uLpjz/YFFeaDoyNl+vdlHQbD0IWCiklWo7I9YxaJlj3ig9K+baUM1?=
 =?iso-8859-1?Q?19TjGRP/gzFT74OIatccm36z3h5qtke7hJQKdFJh3PoghRNgHQypSllh3m?=
 =?iso-8859-1?Q?ndnwzGnhawhBin5IQICT+tz4Xj4cq4wvJw7AwTRpAPeswQ2tuZPXXX6PRf?=
 =?iso-8859-1?Q?MyzGC8RUHc7MNGbY+1k/+pB6/0BwBhN8NzSU9T0aGAPB0uh0WKffT6luob?=
 =?iso-8859-1?Q?SbHQN2MTQ/Hz6kEeS1r3etUwIGh7ltiFDl5T9MSz7Rjdc72eEKrSh+hroH?=
 =?iso-8859-1?Q?ax1VdfRLZenhmzuHMG5XcLhJYfAIeTCbRZjiB0ohidlsHstQmFTtsQHFCd?=
 =?iso-8859-1?Q?7VuXjFVdQLtgdebBH84BV0Wqu6bsSTo1KU7VhV4rgG1++MgDSasgHHVXSI?=
 =?iso-8859-1?Q?PTAu8bMfoLi27M6lKyfjty5WI3cfsy6EKosEgi/6TTHBLDhwJ0zZiUJXrG?=
 =?iso-8859-1?Q?GPca6fXBIXEvN6TCH8avXHANcfVh7QgbIiqGZWsyxGWIEZKJ2SlficKA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249b24e5-8865-4122-b359-08dde0141e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 18:05:16.6791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6iEaHyCFnf9Px57OfnDO3l6FaXyOs+n74x29Dc6ph+M/nz/yKVCNqone/EeaqxHDZF1zjmO8nelKxnyCoH83FyYrMm5foCeF40Pa1HfpAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9520

MISRA C Rule 2.1 states: "A project shall not contain unreachable code."

The return statements in the 'read_file()' function is unreachable due
to function 'PrintErrMesg()' which is noreturn:
    PrintErrMesg(name, ret);
    /* not reached */
    return false;

This is deviated using a SAF-xx-safe comment (specified in the file
'docs/misra/safe.json').
No functional change.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Previous thread:
https://patchew.org/Xen/5944d87aae330246b7dab6eebd04d5d71a7d7e8f.1755608417=
.git.dmytro._5Fprokopchuk1@epam.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1994619131
---
 docs/misra/safe.json  | 8 ++++++++
 xen/common/efi/boot.c | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 3584cb90c6..2b3178de2d 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -124,6 +124,14 @@
         },
         {
             "id": "SAF-15-safe",
+            "analyser": {
+                "eclair": "MC3A2.R2.1"
+            },
+            "name": "Rule 2.1: unreachable code",
+            "text": "This is a deliberate use of unreachable code. The ret=
urn statement is retained to improve code clarity and readability by explic=
itly specifying the intended behavior for a case if PrintErrMesg() was to r=
eturn."
+        },
+        {
+            "id": "SAF-16-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 50ff1d1bd2..860c41c8e7 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -852,7 +852,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
     PrintErr(L" failed for ");
     PrintErrMesg(name, ret);
=20
-    /* not reached */
+    /* SAF-15-safe deliberately unreachable code */
     return false;
 }
=20
--=20
2.43.0

