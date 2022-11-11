Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D32625834
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 11:25:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442419.696565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otRDX-0000OF-NM; Fri, 11 Nov 2022 10:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442419.696565; Fri, 11 Nov 2022 10:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otRDX-0000LW-Kc; Fri, 11 Nov 2022 10:24:59 +0000
Received: by outflank-mailman (input) for mailman id 442419;
 Fri, 11 Nov 2022 10:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/2sd=3L=citrix.com=prvs=3078b29da=roger.pau@srs-se1.protection.inumbo.net>)
 id 1otRDW-0000LQ-Pu
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 10:24:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14f81aba-61ab-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 11:24:55 +0100 (CET)
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Nov 2022 05:24:39 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5137.namprd03.prod.outlook.com (2603:10b6:408:d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 10:24:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.030; Fri, 11 Nov 2022
 10:24:33 +0000
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
X-Inumbo-ID: 14f81aba-61ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668162295;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sGhnX9PEbGHHKW4pIF89GXQE1AbpTAFbQNeOWTAF5cM=;
  b=g/at61tQM9xdD0HR1uaK/vlruRXayM6AJS7RvkQEAIoK64spFasqaLtd
   GT2Rq+OxhlOwaaebV+whFKbgUvHtO5Srheu7+x1Eog6sXLuGiCuXs1A0S
   StXuUK8N9QJqwmj89m/iXld1P1Lzl8r/rUuj1FGb88qbqQtlxZ5fIj6jG
   s=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 84230055
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jPoQGqpjvmnlVFHoCgmMD6V/nIJeBmLvZBIvgKrLsJaIsI4StFCzt
 garIBnSM/+JMDH1eth0aN7k8kIOu5/WxtdmGlFppSo8FXlDpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHziBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAApcQxqRvuHr+6OmRMBuuOEqMeXIZJxK7xmMzRmBZRonabbqZv2QoPV+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeGrbIW9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAurBNhJTOXlq5aGhnXJ/jMuKAQGfGC5rOv+p1CCd8hZB
 h09r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOlMIwXy1s6
 VaPkPvgHzkpu7qQIVqF/6qQhSO/P24SN2BqTTAAZRsI5Z/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxAA8mrNVi8cI3qe6+FnvgjSwq5yPRQkwji3UU3yk6EVlZYejT42u9VXfq/1HKe6kokKpu
 XEFn42U6rkIBJTVyyiVGr1RQ/eu+uqPNyDajRh3BZ49+j+x+nmlO4dN/DV5I0QvOcEBEdP0X
 HLuVcpqzMc7FBOXgWVfOtrZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:8Lq7Ma10V0YiJ71e6jGRlAqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEj+Ka+Adwo4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kfEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 HxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72MeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOux5Dq
 r/Q+FVfYp1P78rhJJGdZk8qPSMex3wqDL3QRWvyAfcZdc6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.96,156,1665460800"; 
   d="scan'208";a="84230055"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULa2pLAMWXsgbpcPLxyhNaenkTDOiren7Ut0v7YUWt94oL383GDYYq+vhkYH0rQ2oPXRzSTNRh7JXe76BOlC3utnFXiylDjmSbiV6+48RlNFymNfzKIc6ARuRI7ROwWYipC7ZwgXArEqaDFiGXYoiZA+CT83bNWSU/q8QnhTXgiQlVHzzLGR8qphA53/d/Cr0vOw+7XISB/pG/KW+6ew6DhCM526l+4/jspmt4TtaeclHtIIlCBcOlOloJC0izFvv7Z8SM26FYt2SIgg1WhBFMfJRWlMB170q+cZSvA6lc4h+x7MvSn16jbDMNO1pClPhiZX3yPtqmxsl4zJ52n3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vrs8A0dqY/TrkOge+2bnNZFSQX12ELuGSsJShoXRY7U=;
 b=FfZ3NS2l6bpvF5M/6MX8OywSlYYapsMrxfXMGtNAySBRafml6Hx41wQmoDkLtZqQF7T6edEgQjKYl4vfjJaVyUrejRSlcf7gVvJTx+GkvMg1sjTMTDzfZxbAcqdNFLHOIHNPriZHyE/Nu9PT0gC25b+b9gjJjoVq0/vP9gDSXACUrUgeMCreAt3FRb3uSjMy4foWEIJhmSM+hLjLOi4VSuzN5NV09s6qSLxRKF4Xv7+DrTX9ax4Vb/PVCyAk9fpf5vqN4I1ZS27Go+GkmylgRQlPg4Nay0XnDECHb1aPHmY5oBzzn8eLp06FcXcZcTviy/fBhzGS9oxXU91oOnz66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vrs8A0dqY/TrkOge+2bnNZFSQX12ELuGSsJShoXRY7U=;
 b=bT75qaCHGMUOeONPR8I7r6AZ5jytkTEyCGpAFc2/znevy5XTZznouCv6uj8Naj/aAX3znFAFaSYKVm+rbHGCQIpi6TYoIZS3ceycr3M1F8XFxFnIqj5lDShgBDMfZFu2a0Ck7AvsFXSOkP+O+Xa9Fcw1B1s2of8v2z46eKuCEVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 11 Nov 2022 11:24:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Message-ID: <Y24i2x1xBQQm6MJl@Air-de-Roger>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
X-ClientProxiedBy: PA7P264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::7) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: 019f65cc-71ee-41a1-6f6d-08dac3ceed05
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W9K/gJ6y1+i/PKhIn87ksgPIfe3XxJ+sq3WaKmWCbBQy1NWDpKDceOia42umNebWKJLTiVdgnDh3EO+AwFx5B+YEKbOE/bi4Vv/6USbsoiDGb5BH3bicpBVLpvmHTjeeeucDyl53iCxtJ6q+0TL5NhUZaJ7U6S7hekSqV8aOInmXOI1ZDf91ktaj3CZMNdQBlbvgWizhZY3bdL0jBV66YHsS//SRFRpRZ83ZWViaMbXpzQW6zJsduU4j8OH0514ds/bEexxuXsU8qss3riyIGXWOdMLQA4bFmokIP1dGBmTxGkDDJUXrjTLRCaMUEJTNNfbanHjUnCbmxQY2l0bzoBlYA6GUlFScvEC2nySDw5ugQOUODpBzKgGV0kboeUrMWAOyljv167RXiUi5wB1/6aarWUmdyHRenyCaeATOw8LNOYGdZ9vD96vrOFu+inVLlaYYYrIgIc6KbwaO5N8/Ld8D59KChJ9J2MdVIJF2xNV/m7WM0CNgMmwAfhOqCsCfmgyQv8Pu0pUrM2Mz0sFXQopY0SFSDONy94FQLOloLIyy2FXvKc4AFZOQMA0SNyTFNhbpED82XauyNDW6vhEDs7Vls58onNpIXwK8jnQvjRY+lgOeNgfXyKA3gD21CxJOIUHbvsTRZljRiOdBmHJD5heDu1qHBh6AB9g2JMW2G5CoRuC9tBMudVH3N/RzqJa2x4OqalJOBaWC0BTLsWE/Aw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(82960400001)(38100700002)(316002)(33716001)(54906003)(4326008)(66946007)(66476007)(8676002)(66556008)(41300700001)(6636002)(6512007)(9686003)(86362001)(5660300002)(83380400001)(6486002)(478600001)(6506007)(6862004)(53546011)(186003)(8936002)(26005)(85182001)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFhsZTc5cXFDczYrSVoxdTFKOS9yU0syTnpJMVZib3VhTndzRys0ZitBam5N?=
 =?utf-8?B?TStSeElXRjRFa2duY3dtdmJDK3M5VWxUVEtDTGhvL05DVHd2ZFpGa2FqQTB2?=
 =?utf-8?B?MEtpeWJYNlM0TTVKRDcrMXF0MHQ5SGhKR0F2V3pEeWcwMjVlejF3M3ZmYXo5?=
 =?utf-8?B?dWxRcm5zemJPU0hzbFhmMHpqSGV4R1VBUVdab0VBbHpEN205R1Y3czdiWThY?=
 =?utf-8?B?WHNtcmUyaDhTSGJUd3ZiTDhXVGhhejU1K2svN2xtSXNuK2tVYW0rdTUyV2hh?=
 =?utf-8?B?OTAranZSSDAzb1NTTW9HVVFla0ZPN3RjZXI2RkJ2NjlnbVQzQU9QK0Y5NTcv?=
 =?utf-8?B?Qi9JK0EraVJpTDBkNW8rbWJHRHJWai94djJ2dVZyN2pFMG4zQTgvS2prWnc5?=
 =?utf-8?B?dnRkVjU3SFp5WXI3UTVFRHM2UWU2NE12NlZRVC9XaThYcTJGeGFPZ2RaU3J6?=
 =?utf-8?B?b3BBaE1GUWhsTTFnZm5vci9vRjh5bjhLUURMYy9iQ1BuZEdIU1ZOM0xQK1Z5?=
 =?utf-8?B?UDFyNHUyS3E2MnRVUkxRK3JRMTBZbWNxOE9vUXQvckRlRWVSM3dqZnZUT1dB?=
 =?utf-8?B?eDhhV1FZREZGM1ZHSTlnYTFLYktYRVNPdHRFK2o4blI0SC9zRXNOSk9ZN0ZE?=
 =?utf-8?B?SXRSMlNGcjVESFQ2MjFIcjYvcjFaMEpuV1c2WWxwMmx4N2dYSEcreUtHVlZ2?=
 =?utf-8?B?UTZGTFUyU0ZlS2RRM29Md2kydGVLbTVrQWJsYk1paFBHYlpHTVlnN3MwUGpX?=
 =?utf-8?B?ekdsdnI1cEhsNXBOOHg1R2Nvd3BwaXg1elZ5M1pKMVQ4bWF1TVZGSGFYVlR2?=
 =?utf-8?B?STBZbGZ1cWVzVEoyWDBCQmpjaUk5TkVKS2t1SGtKb2JXMWZHSkNwQVQ3Si9M?=
 =?utf-8?B?OUpaQ2YrL1pQL0dMam1mZVVnT2pMLzZGUzhTVmhlYmJHc3hnNU9lNmJwYXIx?=
 =?utf-8?B?amRuSzNqY01QT01XelFVN2V4NTVUaDdZRk8rUXhnclJPSXh6Ujk2S1hRYmVu?=
 =?utf-8?B?eW1wYjBvTzFRTk5IckNiMTJFMjA1ZTJVRUlkSFV4Q2FSK005clNTem1pYmdC?=
 =?utf-8?B?U2pxc05qZk94MDAxQ0F1RkE3ZUxhK1VGL1EyWWNRSDRFam9xcEZ6MnBVMUts?=
 =?utf-8?B?VTVTYWVXNzdUUFJqVWg2ME9YQkhRamhocHZqQWxzdm1ib0xXVFJua0IvZlB0?=
 =?utf-8?B?Vmh0ektmVitpYUFQcjExNENGSGxLaDNubXlhdmxlamhOZ3BML3BLUFJhcCtT?=
 =?utf-8?B?ZHNVVnMrR0ZOYzFqTHNmbnhSQzZVd2lGL2t5L2hPNSs5TnNzSDZqNTY5TlY2?=
 =?utf-8?B?YzhTcUQwUkg4Q1N0d1duWDNlT0dvUFpXSDhSNlRoVlg1M1B3L1lsWENhQmUv?=
 =?utf-8?B?MU4zVzN2eHJXVTJjU25BdzIraVRvV1NuU0l2SmNLNm13bnJ4S1ZFQUg4aE9a?=
 =?utf-8?B?ZmhvNzgwZnN4bWJ1UWJHVkVINVhVTzF0cWo5OUgzcHpxaU1RVWNpUUh5OGt1?=
 =?utf-8?B?ZGdZckg1UUgzUGphTExNRzhIdUxwRWVDWXZ5cFpWbTlmL2t0Ym5pSGZsQ2xO?=
 =?utf-8?B?SmlCSWg0b3lZMjdDazFpOGd1bmFtanVoRjJ6MWVKSTlCVVREbWtyWnJWMFZV?=
 =?utf-8?B?dUF3VXZ2WFFsMzFIMExXTmJRYkJrdCtsRWdqS2MxUjFTNG9sZStNbExnRElm?=
 =?utf-8?B?dG92L2t6Z2RLQlQ2Y1hwNXVGNWxnbGgrVEdXUnFNV3phZFBtOHo5cE9zNi9Z?=
 =?utf-8?B?WUk2UlNvUHUrUEdZbTJaWGRBZTgzUHB0WWlYWGI1eDd5YWlVV3M2YVowUkxu?=
 =?utf-8?B?ZnVqc2g4UGR6MlpZTDhBOFNNaVBVOFVLMTl3b2RaZkF1T1dwTnVEc2hhOHlJ?=
 =?utf-8?B?WWhCbWY5cC9PUUtwdzg5bStOdmx4a05oVGVTNUc0YlVoNEFEZmxTbjZxeGxL?=
 =?utf-8?B?L2luYUFaUE1qZHB0S3VxTmhXejF2elRMK3luWGdWMHh4bGU1OHViWXhQanZL?=
 =?utf-8?B?YVpMdG1mWTBpVnlxbzRyQWhQdW5mdDgyNmNvNVhHY01UWGFHWFYxWVc2TDE3?=
 =?utf-8?B?MWs5RzBiT0trWmdTZGZjS0pIcWliMzlKZFBzVjJ0ZVJ4U2pQNVdHTUkvWTNn?=
 =?utf-8?Q?mP78WuiPAZhkLWz6hoXsNQp2v?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019f65cc-71ee-41a1-6f6d-08dac3ceed05
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:24:33.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjIpE5xsMqHFWiMQNXTP+l+Dk20gypJMgnTkNIdTA3r02lXOQ7+z6RvsadkmB58jGCW7SfeQjg6Bat5fQDNOkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5137

On Thu, Nov 10, 2022 at 10:47:07PM +0000, Andrew Cooper wrote:
> On 04/11/2022 16:18, Roger Pau Monne wrote:
> > The current reporting of the hardware assisted APIC options is done by
> > checking "virtualize APIC accesses" which is not very helpful, as that
> > feature doesn't avoid a vmexit, instead it does provide some help in
> > order to detect APIC MMIO accesses in vmexit processing.
> >
> > Repurpose the current reporting of xAPIC assistance to instead report
> > such feature as present when there's support for "TPR shadow" and
> > "APIC register virtualization" because in that case some xAPIC MMIO
> > register accesses are handled directly by the hardware, without
> > requiring a vmexit.
> >
> > For symetry also change assisted x2APIC reporting to require
> > "virtualize x2APIC mode" and "APIC register virtualization", dropping
> > the option to also be reported when "virtual interrupt delivery" is
> > available.  Presence of the "virtual interrupt delivery" feature will
> > be reported using a different option.
> >
> > Fixes: 2ce11ce249 ('x86/HVM: allow per-domain usage of hardware virtualized APIC')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
> > don't want to rewrite the function logic at this point.
> > ---
> > Changes since v1:
> >  - Fix Viridian MSR tip conditions.
> > ---
> >  xen/arch/x86/hvm/viridian/viridian.c |  2 +-
> >  xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
> >  xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
> >  xen/arch/x86/traps.c                 |  4 +---
> >  4 files changed, 24 insertions(+), 15 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> > index 25dca93e8b..44eb3d0519 100644
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
> >          res->a = CPUID4A_RELAX_TIMER_INT;
> >          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
> >              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> > -        if ( !cpu_has_vmx_apic_reg_virt )
> > +        if ( !has_assisted_xapic(d) )
> >              res->a |= CPUID4A_MSR_BASED_APIC;
> 
> This check is broken before and after.  It needs to be keyed on
> virtualised interrupt delivery, not register acceleration.
> 
> But doing this correctly needs a per-domain vintr setting, which we
> don't have yet.
> 
> It is marginally less broken with this change, than without, but that's
> not saying much.
> 
> >          if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
> >              res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
> > diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> > index a1aca1ec04..7bb96e1a8e 100644
> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -1136,7 +1136,7 @@ static int construct_vmcs(struct vcpu *v)
> >  
> >      if ( !has_assisted_xapic(d) )
> >          v->arch.hvm.vmx.secondary_exec_control &=
> > -            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
> > +            ~SECONDARY_EXEC_APIC_REGISTER_VIRT;
> >  
> >      if ( cpu_has_vmx_secondary_exec_control )
> >          __vmwrite(SECONDARY_VM_EXEC_CONTROL,
> > @@ -2156,10 +2156,10 @@ int __init vmx_vmcs_init(void)
> >      if ( !ret )
> >      {
> >          /* Check whether hardware supports accelerated xapic and x2apic. */
> > -        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> > +        assisted_xapic_available = cpu_has_vmx_tpr_shadow &&
> > +                                   cpu_has_vmx_apic_reg_virt;
> >          assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
> > -                                    (cpu_has_vmx_apic_reg_virt ||
> > -                                     cpu_has_vmx_virtual_intr_delivery);
> > +                                    cpu_has_vmx_apic_reg_virt;
> 
> apic reg virt already depends on tpr shadow, so that part of the
> condition is redundant.
> 
> virtualise x2apic mode and apic reg virt aren't dependent, but they do
> only ever appear together in hardware.
> 
> Keeping the conditionals might be ok to combat a bad outer hypervisor,
> but ...
> 
> >          register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
> >      }
> >  
> > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > index e624b415c9..bf0fe3355c 100644
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -3405,25 +3405,29 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
> >  
> >  void vmx_vlapic_msr_changed(struct vcpu *v)
> >  {
> > +    bool virtualize_x2apic_mode = has_assisted_x2apic(v->domain) ||
> > +                                  (cpu_has_vmx_virtualize_x2apic_mode &&
> > +                                   cpu_has_vmx_virtual_intr_delivery);
> 
> ... this is still wrong, and ...
> 
> >      struct vlapic *vlapic = vcpu_vlapic(v);
> >      unsigned int msr;
> >  
> > -    if ( !has_assisted_xapic(v->domain) &&
> > -         !has_assisted_x2apic(v->domain) )
> > +    if ( !cpu_has_vmx_virtualize_apic_accesses &&
> > +         !virtualize_x2apic_mode )
> >          return;
> 
> ... this surely cannot be right.
> 
> While attempting to figure ^ out, I've found yet another regression vs
> 4.16.  Because virt intr delivery is set in the execution controls
> system-wide and not controlled per domain, we'll take a vmentry failure
> on SKX/CLX/ICX when trying to build an HVM domain without xAPIC
> acceleration.
> 
> 
> This, combined with the ABI errors (/misfeatures) that we really don't
> want to escape into the world but I haven't finished fixing yet, means
> that the only appropriate course of action is to revert.
> 
> I'd really hoped to avoid a full revert, but we've run out of time.

Can we wait for the revert until Monday, it's a public holiday here
today and won't be able to reply to the comments.

Thanks, Roger.

