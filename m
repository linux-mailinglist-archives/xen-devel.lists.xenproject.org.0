Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959304BBABA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275510.471428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4LC-0000KY-U3; Fri, 18 Feb 2022 14:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275510.471428; Fri, 18 Feb 2022 14:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4LC-0000Hh-QR; Fri, 18 Feb 2022 14:34:34 +0000
Received: by outflank-mailman (input) for mailman id 275510;
 Fri, 18 Feb 2022 14:34:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL4LB-0008Sp-9I
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:34:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e21f6463-90c7-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 15:34:32 +0100 (CET)
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
X-Inumbo-ID: e21f6463-90c7-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645194872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=OBvd7Te7RVC9tLWUnRCr7dexqEAV0RltpksYs1SPDnw=;
  b=R3aKWenWhiUGNwfuWyF4iX3s5Ek/OpvQFD9sd4CbtEfwC9SNZlHQpyt7
   usjz4oB3QZKxy0g0duz8yRZcEQ7Dh/6HuEZOUeqtZtmw3BP/sHDBDd6P9
   9YA4aR0dzSiZW9Nn2Xi4Gm7FPKArv4mzUjNSPBEE9F81Ds5C6UNuBRiZm
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 63960496
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yaHGUKnBiORX9doYGzCHIh7o5gyWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXCmzXOv+CMWX9KNt1Ooq/9khTsZSEzIUxHQtrrX82EiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2UILd9IR2NYy24DjWlPV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYRxsUI4nDx/0kUD5pHj5UI6tnv5rLPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ62PO
 ZJFOGQHgBLobx9RNH0qKJIFhe6tmHrnXxgGq0+Euv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7CBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJeD9AnzA7S05PXxDeUGUIaSB8GTdA54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D5gbQ4xawZRGp8crVnl
 CFV8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBowaJpcKGO3O
 RW7VeZtCHl7ZSrCgUhfOd/ZNijX5fK4SYSNug78NbKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHePqtdLdQhQRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:DCiLMq1pvVo0VBtwcJTw4wqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="63960496"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6Ixpo+AY8qOybEFDFwVrdOw0xtCGDyypGF3c9qnd6BdCokqebGcxViWDiO/AZpIvaJxzsxjVv7F4OFEApxNWlsoFfqckp0wiKFxhXNHDfRaLOheyhM+u390rnLvahl7cl32cElkC/JTA57H+WUEDQC+8WLhPCRD7PHUBjqEsjvbH75zlPPxmSqwLbrL/90nj7Qt1Z/65iHtTAg0ZQKis4VzE2jBMhUeZyuYhxcAlMDjRxRx5L+B5MuKcZTxHGXOVaTLYouw3QnOuLY+766setZxV1/ezMUCU2gbPyGgYXUDgcnJ03gdbF6URC2UQtBAP5wUY3gZHhXxJSB4PhR68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5KrC8FlxtiywlEQxR4J2fdDfBJ+V23D+gnQTYifv1I=;
 b=SvzvLa3xJlK2Ze10l26a9mBsji+99lxl0KXdAA1A54PNadroUZtoFQQdnCKkIK6exy79VMU1ArJCKAUv/x40AyKWYFy/TE0Sf4uLln1IEGwCububjOhEUTnV/wSGOTcZLyeQvVwnE7lrSOn0AOmCgt7dSPmdIZ/yCg/YhbSv3OadT/DGrZ9qr/CnaeU+24GEWoRQa8WQTzojF3k7Q7X7iEm4icVINdx7yn0d3rIr+M5iI7iRomYmb1P5gP4rfmddLF65Bw/i5f3wWAQu4GbWbZ0U426P37ur17bGQUiUaE2ne/SplGgY+SugMTQ9rS53m8b8iqeCcMSAMw4A369zGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5KrC8FlxtiywlEQxR4J2fdDfBJ+V23D+gnQTYifv1I=;
 b=pFBYwqcI67c6kf8R2NxFy978xltcIrZMpZZSzQ711f6YTPjPr0gBESzYSN4Ae4sNj/pBtA9K7F+kvDuKT/UFoYgjzf191mBkfoE/InEjPVD/EArrrODzhxDvVB8C0uYrhP74uZASU7Qc9X4YPaXPJLgTHe9rE+Kwrl7IvzjrGOY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] x86/retpoline: split retpoline compiler support into separate option
Date: Fri, 18 Feb 2022 15:34:14 +0100
Message-ID: <20220218143416.34475-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218143416.34475-1-roger.pau@citrix.com>
References: <20220218143416.34475-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0223.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 658147a6-596c-4729-b009-08d9f2ebc3ea
X-MS-TrafficTypeDiagnostic: DS7PR03MB5543:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB5543E921E3CB8FB6701EB8918F379@DS7PR03MB5543.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aafhI/N//VXt5Qo4d/Rv2WkKL3iGB6LsF5mGo/OE083fZv1nxot1DZf5BFZ1pwjxOQXY8e7ap5K6vBOhShqLwva0BlS7FgkDBrufMq4QWzI/HfvafnRlKQRzT+c+dxtE1Mhur6SGlBakTSnQRblbK0X9b4JKCjR+mTgsW+wKBw88yyYvq5YLqa0x6AFggPdxcnjHDWaSKY1shgPZMWJxZbF3W/RyZDMOYiwh4P9mIwlT6XLuUlokKMFjeN1VlGkkN2zSBWOFjFvu6Uh6N1jkUFr9t18tvJ0g65kr+7Xa/tD5dKZBEwKp6OUuXK++8a+o1wzCNd6OnG0qkH4jf8XtGFVEDKDuN8kf8YcRagbfvzqGaW0NZ2CJvnyNA6mjmlEgdzdyMobLVJK/hCTF6PO1BEh0qQfuVf0xXpeNqJdWsTzwBxMANagZaSKdBTawLmMIoBsjNmZTuutJ9kYLp4xiFOccoyHPqGTnwbql0NX7CNEn93nMGuvfO9GPwDM5+4YULuTuNCxP+K/lv0r2Y+bDUIDAGuIzyGP7kkjJmoVb3AcFCWOd5z4Yo2QSvbF/XWQz0JhxuxTUBLcJMXVRReRtP+1FTvk1KaANgkH42I2T8ZL4ObZhXZ3n20Pt0RNVY46xnJ/l22brrjg4uYS9F7Gukw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6512007)(36756003)(82960400001)(8936002)(26005)(1076003)(6486002)(8676002)(6666004)(6916009)(2616005)(66946007)(5660300002)(2906002)(54906003)(66476007)(316002)(66556008)(83380400001)(4326008)(508600001)(6506007)(186003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0lIVUpiVHZmb21FR3U3cjBzd0ZCbi9DQStPbDNlZ0tVSWhzRFBCUDlidEkz?=
 =?utf-8?B?VWE0bThaUm9ReTZWdDJKbmlkaWhQSGFEWkc0T3VuTnB1cXY3eTBiRUNnNkJl?=
 =?utf-8?B?amw0UkY2aUQ5VEtOK1I4aTFwc0lxZDQ4R0lsWXJYTVBhNUNYc1F6UjNlZzRt?=
 =?utf-8?B?WlVTUlY3VFF0Sk9lNXY2eUNjZ01jbW91ODl4dDlNd29oVWRJeGtQQVBja3Uv?=
 =?utf-8?B?VVpBdzJCU2pVQytFTDI1NFRqWnh0bmROTmFnTGd0OGFrTnFZWHF0YlVLSzNh?=
 =?utf-8?B?ODltMmljQjdSaDc2bWwrajdPSU5EUG9HOEJmQUhCL0NTbXZlMGhmek5iVEgr?=
 =?utf-8?B?U1NlSWpmVDBkSGEzMWM4Rjd4NXlyNkxPcWQ5Ym5FZVpWaDFMZnNncjZ2d2hp?=
 =?utf-8?B?aFNYZGN4ZkZZMkIyV1ZXTUh6Y0hlSVZYREtPYUZVbjhxWUoxaWlzcGpabU5i?=
 =?utf-8?B?VTFXV1Nkbmd1a09mV25nU1p2TGlHOGhQV0RueCtjaXBMMmpOcFA5YWMzM3NL?=
 =?utf-8?B?Um90OTJ1UmRFcU9Ea0JONkNFRGVGNThkUUk3K25GYWtqbHlGV2hDT0NWVERo?=
 =?utf-8?B?NW93LzR0QVlIbE9zbGN0TFJydFFUTVZpblFodmxzU3RSY2I3WkFYNlZnV2tQ?=
 =?utf-8?B?WnFUblFSRmhDaVJhN2FpcW9JUDh0clB2bmZjcXZNL3RUZnNHcGZyenhiS0gv?=
 =?utf-8?B?YXVTankrc0Y5YWwvT3ZIcUtxOEpSRjNtVmMxYWR4ejk2SzZ0NXI3M1pncUNW?=
 =?utf-8?B?SkJXeWIvSGVJLzJDV0xweG5FT0h4VzBuWGdlTjRQZjhCSDErVnZBN3RIWlZq?=
 =?utf-8?B?bnJ4UFNsYW1Qd01qbVJIY0ZLY1I0U2tZR1pMK01zWHV0aUc5NC80aDdtOXBQ?=
 =?utf-8?B?UkJheS9DWXNlQU5Yai9iL3pRTlFOSTJiMzR3dUJSaHhlaTF3a1hnYXlVUGo2?=
 =?utf-8?B?eWZKOUJSR1pMMEhiRDAvdWVtZUVLZExOc1Z4SHlOMGVzZjdjQmYwWTU2eldZ?=
 =?utf-8?B?V0EwNmluTy9LZFlXVWZOOWFSK1NMVUlMY3dGNlJUSklTRFgwbm5ha1ZVdGxW?=
 =?utf-8?B?Rk9sRC9vdWFxTEZaTkdCM3lXSkZCUkY0YU9lOGlNSmdMVjFFVlZTbW9tWWVt?=
 =?utf-8?B?anBwSjZ0UnlYMnpnRnRXTkNrZXFWcGJ1cEY3YnR2d2ZZR1N4elMzWmNDK3hh?=
 =?utf-8?B?azRyS1A0MURCbXNPckhLbEk5NEEvTmxmbVpsc2VLMERyRUlmK1IrT2JDY2Vj?=
 =?utf-8?B?NVFVZ3RjN1dOWEU4R0s4cE44a1Nyc3EremFPd1ZGSGd1WEhXbGtmLzh6WUNB?=
 =?utf-8?B?WitrcG9YejVHOFZyWUxjTVhPQ3NVRkZuMW43U0pPMWV4aGhsSUp4Z0hrVzQ5?=
 =?utf-8?B?ZmdPSDBhNW15dDVRQVFkQTh1QmVyN25VVGpmUi9Ob1RBOUpJbUxzUFFEYW45?=
 =?utf-8?B?QlNKUmtwbWxXeTNOT25DSnlEN29Rb0hPNk4vQnc3NkVLSWpBT3RwMEkvV0Vr?=
 =?utf-8?B?c2Jsa2dhQjZHTm1aSld1YkVoZjFrbml0djZsRWZTRm55eWhPT2JJK25SQndI?=
 =?utf-8?B?enNPK2JRTEQ2WFNnK2ZVVFRDY2pNN0ZucFl6aW5Ba010S1pPT0JadGkzR2li?=
 =?utf-8?B?SkoyUUphNW9LSmZSQlBJM0R2dGVjUjlSQ01CQmR1aDJNc28wNkJNS3dDdHdj?=
 =?utf-8?B?SWp4ckJhK0txU0JyS0Z4R21Kb2g3TVhrN1JaT2FaZ0owb3crMkZHdkQyejNq?=
 =?utf-8?B?QXdWWjNWQlBHaW8zU3F3M1RPVU5lUkNUdk9RSTcrUzNHQi8vZ241Tkg4bVZ4?=
 =?utf-8?B?YzEvNnFkcFpnaUp4SFVqTkI0aUR5Q3U5UXhEVjJueXZXRFI1UVhGQU5UTVNZ?=
 =?utf-8?B?d3kwM2tkTzdUVnU4OU9ZQ1VCTjQ4Sk5TbURjQlArTk82SUVabTIzVExTYWkr?=
 =?utf-8?B?cEJhRFA0NGt6djU3RFFacXZveWVkSFUyZXBpLzM5Szh1czFUSWdMN3ZvU3dO?=
 =?utf-8?B?Z1Q3b3pxOVI2UkRJZGx1N1VTbGtNOEFQT1dPeWVwbENQZGlMUjFzVlh6aDU0?=
 =?utf-8?B?ZnlMM1FVaEZrQUp1djBHeW5ncktaNmZ6WDRQcDFGMms4dmZTS25RNERQWGZE?=
 =?utf-8?B?b3EyNDR2bnpIMEh3VHdidjNvekdMS2pCRFpWa0hrOUlOM2dmVDVWUVhHZVhj?=
 =?utf-8?Q?NTacOkrg/5ejpy3hWky5yjI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 658147a6-596c-4729-b009-08d9f2ebc3ea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 14:34:27.0322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgqKvh1TK6+p4i07OBiG71NfQaU2dSjc4dHThmA4mq+B0v+x2g79x5FZnixLS5i99cxMJIzMxvSGTWgJtLpYAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5543
X-OriginatorOrg: citrix.com

Keep the previous option as a way to signal generic retpoline support
regardless of the underlying compiler, while introducing a new
CC_INDIRECT_THUNK that signals whether the underlying compiler
supports retpoline.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Make the compiler option check generic instead of GCC only.

Changes since v1:
 - Put def_bool before depend on.
---
 xen/arch/x86/Kconfig |  6 +++++-
 xen/arch/x86/arch.mk | 10 ++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index b4abfca46f..a1a90da4fc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -32,9 +32,13 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/x86/configs/x86_64_defconfig"
 
-config INDIRECT_THUNK
+config CC_INDIRECT_THUNK
 	def_bool $(cc-option,-mindirect-branch-register)
 
+config INDIRECT_THUNK
+	def_bool y
+	depends on CC_INDIRECT_THUNK
+
 config HAS_AS_CET_SS
 	# binutils >= 2.29 or LLVM >= 6
 	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index fa7cf38443..6388b1d93f 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -42,10 +42,12 @@ CFLAGS += -mno-red-zone -fpic
 # SSE setup for variadic function calls.
 CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
-# Compile with thunk-extern, indirect-branch-register if avaiable.
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
-CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
+ifeq ($(CONFIG_INDIRECT_THUNK),y)
+# Compile with gcc thunk-extern, indirect-branch-register if available.
+CFLAGS-$(CONFIG_CC_IS_GCC) += -mindirect-branch=thunk-extern
+CFLAGS-$(CONFIG_CC_IS_GCC) += -mindirect-branch-register
+CFLAGS-$(CONFIG_CC_IS_GCC) += -fno-jump-tables
+endif
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
-- 
2.34.1


