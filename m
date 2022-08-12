Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A8590CBF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 09:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385350.620964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPKz-0008P5-Hk; Fri, 12 Aug 2022 07:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385350.620964; Fri, 12 Aug 2022 07:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPKz-0008Mw-Es; Fri, 12 Aug 2022 07:44:09 +0000
Received: by outflank-mailman (input) for mailman id 385350;
 Fri, 12 Aug 2022 07:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMPKy-0008ML-HS
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 07:44:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bc558a4-1a12-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 09:44:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 07:44:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 07:44:06 +0000
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
X-Inumbo-ID: 8bc558a4-1a12-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve0QKPbzJcgIbaYkhss5zZTtK7/e52sm3KcxdnJjJOJQLRO1fuwBTUkrbMtXwn+zqPau4Ed3pOP4P+IDprhl7y036IiAt2PXvVdYBCPs+6oxlZUiDnq06aSWgRCBNhKpQq7h5kE4Qymit2VPDSbfcOnJyvTs30GesaDfAY/k4E/D0yaL5o30ego+tlu8QxGDA8yPmpqHKdjmDL3+S+LMYOdRNFoQezOIu9U0EHuYo0LEedSZekpEz3+lhtTM7x1xCwyI2g/uSjFb/0GjWexN7XWPjSwvbya6W4zO0gklKKNhKxpN/WU/3loNRS0IcBAj0/KQavZ3SHg0OOPckLek8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paHBxFxNPQQaCR96HVsNx65Tk5J0VvsjBSY4OoT4Sio=;
 b=Tp+H6IiCm/RMBQHmEMAZ64bSPuUBOHzBzAAkADHCYjNuwxDcBGkwCBFj35PO6eMoDg1quRd9Cmuu/y+46y6SkwLwzsr5g8TQzaElXFnIZSUx75qDOzFNPE2tQ3/yDpIkH3rbEanXgwfHpUlYWdMEtcH4nSMMbzy+8waAZFmC/ii4P8QydEjkMCswufCCQNWsSTKm3wseA29EpsX/33tHli8V+SvCzVEStE5f7g5NnXbELRf+S5j5xcCkDaRm99Qtc99cD/uysuiHA4WydfyjDSN/7rRSsI7qr7Z0Me3XyGkAFZyJkSSayKNm+1UTaInb0GnVCUoTIJa/5qjzAm76Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paHBxFxNPQQaCR96HVsNx65Tk5J0VvsjBSY4OoT4Sio=;
 b=3aYZzOyX53glqxRnjRfsi+BJiEZ73Om+n6ZY0hN2JjrI+HCBz+bKjUv6kYz3C+Q2VjOlGMTiSiZYLsa1P6SqEkZiMeAvGGCrOyw8ugoqmKsM4SRkVHsIFPObavxuBmViWG5NQ6hqP5x4iHunB6ljIqvBGpdSM5AEGmCopuQYhrqqm0SyAaxJDsM9e0iu2HomANOyRjO3ily2f5ojgGgkyE6ozfiU2qmdj13Q06x1H1UevnV/jd52slmixFFR35o8BD1jM6oWyRDp3Cc49Q3f7OsGWPVkL/LGWpnmBbCNn2dY1uJWvryv18YJwtgsBvfX2C3LaSQ4BpAyDJL0b/sEmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c642811-0b63-72e6-3ef0-6d6262b5975c@suse.com>
Date: Fri, 12 Aug 2022 09:44:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v3 1/4] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change() (part I)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
In-Reply-To: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0018.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8135757-7fe0-46a9-b4e2-08da7c366f23
X-MS-TrafficTypeDiagnostic: DU2PR04MB8646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G4nAliDYlbaGrrSrMJFCzmvlxKcq1+IgIqd1gvJFj9PdUMmGGN+WKJixPB6e5PwR4xlyXzvMZZPupQndmrTmftDK59+UTZWCVTLwylLj0ffBaf1cuOr7t/t8YKLrHhHUL10muT+3/qiRuWDlTcIC3XcHMFFoHU2sgQHAYb3/GexB/hTrhSUUx4mgpvJs3qHwEkxNhOhQKPSMIjhQcAWK2kJWHwq464cZ8qYMWUYiD+jqOIMmunRoENI8g43jNtwzFBRe11OWgsuVvqxD0zM1EQI2z1PfrThJWuJ5D2qKqILaxmBN+mIbVF9DZOIpYGO4tqsOFYksaGleI39IycK1Xp4H/q1xclMGTX+llaDvR4zH4B+XZenPMJnXFkgqFOYpgEtDHm1EZ63/5lFlm1db8yvZHD33Gl6mss07CH3Tcm09xjld/NaBbGiDifw1noWJWq/WCwj0ryeS4Z9djzkWHNXnfBkxTkm986BEHnDKanmMtVt9K9uULQin4HL/m3T0S0P9aGdUYAosKz5aSMFrHVAkEVROTS4I5NI9LxbrGlT0uj8fI5XUwSvpiKZoeQre9luXgbE4D6tF/rFAhMfFes06AF6Hnd0+9DC1mEFydHEPn+48uZ9dExLelkCuZqf1Td3mPo7sLN6EjhoNtOxtZxPu5/vswmUG7m/rTQYiH/+4NuIXRKE+8VW9p1XRoff17ugS+Pbl1GBLooYqoi/SXfT7SntiZR76vFiDS3/ms/l1mToSVLR9VrmWTKyrPAsEPEgys+ATkTE7WH4yHV4vAe61MkWecpUgF4iFRdbS/FfXIQC0Ron+ookc10plBCRRAuAMYeTICarddnz3r0f+MKn7NtjlxnF2VClgIBiTtJ/EhB67FEo5SSDV17EREBOq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(396003)(366004)(6506007)(8936002)(26005)(6512007)(54906003)(6916009)(2616005)(5660300002)(4744005)(41300700001)(6486002)(86362001)(31686004)(6666004)(36756003)(478600001)(186003)(31696002)(316002)(2906002)(38100700002)(4326008)(66476007)(66946007)(66556008)(8676002)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTYycWFqNnIwQ1NEUGRFMnZ2bjMyc0dmZVhRRkNGZHdSRHh3SDFQZDdtMDk2?=
 =?utf-8?B?NFQwc1hhS0ozQUFZd3dVV2wzcjRmK0UwUk1sSTE1VUtvM1lUUDZHeXY1c3Q1?=
 =?utf-8?B?R0cvZFk0bUQ2aUdaK1ZkNkdDVS9JOXk2bjZPdzlwMVBYYXBjNnozS1ZBR1J5?=
 =?utf-8?B?c2x6YmY4M2pET1Rxa0h3VUVGSEZZNTVLdldETmJqdlNvK0F0UmhSODVnSlF4?=
 =?utf-8?B?bnpKeGdTYWhRNzlhWFdrMDliSmNXU2s2NUpGb2tBbjJndjNGa2l4Z3VMbXpj?=
 =?utf-8?B?em5RVkFacll0U3pkYUl2YXZLSGg2d2ZmMVdwOUl3TmtaMGl4czROQUtoMnF0?=
 =?utf-8?B?S1J3YlRCeUlTS2NjbGZwSThvVDhvYjZ3SnREcndQSkNCTzZlZkRGM283OUVZ?=
 =?utf-8?B?WGhzM2FnbXUvZy9NSkFMVHBBaTdUTkNNTEhzSDUvSHRHa2VucFBXM25zNGlE?=
 =?utf-8?B?ZXFkcWd4cW93c2xoNnF1MGxQVko3a2RhQm1jaWo0YzV3aCszemdBZWZMZW1y?=
 =?utf-8?B?YmhmZ3pDcUE3QTVoTnRlYmZWeWgyekNScmJualZxT2JLM2dxbEp6bk15WGlD?=
 =?utf-8?B?d3prOHpyTU1FQ3FJR3ZQK2tvdUh0Vkt1bEc0T2NKbjI4UHU0SEZrMmRjVy8x?=
 =?utf-8?B?TEdiS2pzYTVZcUtXaVVwOE1RRUp3LzZKdk9CRVJBTHhHNkkveW9PaWlURjRY?=
 =?utf-8?B?WDZKdU93OE1UQlN6clZLa2dXNWZ4czlJQmtKNnRVYWVCakdPU1VNL2FNM0k4?=
 =?utf-8?B?clZ2SGdnTDZYUnB0S0F4UnRyU1piVXdyNzVMZ1Z0d3ZELzNCYW81T2x6Y2NF?=
 =?utf-8?B?RDhtN0pZTjhNV1QraU15TTg3TGZlN2dHNS9Fa2wzTEZvdHUraWpEZ3pKOTcx?=
 =?utf-8?B?RXBHem5LMFdSQjc0UjhKVXhwdFVLWlN2dUFsVDMxZWQ1TFRtUWVRcFJnck9j?=
 =?utf-8?B?Y1ZlNTI2aUJlL2NzelJ3d3dSRWhKQ3lyWnBwYkVNNXVVbzdQc0pDdFJCQlpE?=
 =?utf-8?B?dEpaRStoZGdXNUxyNEVsS2pGNUtoWGpoMG04YmhoTWtzK1dZTUs2c05UOENp?=
 =?utf-8?B?bkN4RnhJZVNVWlBwV1pUK2VsUXU1ZEtqcVIvQUZ3YXNrTGxZOVlqQVdMV29q?=
 =?utf-8?B?SEtJazFSbllpNUg0V3JNZm96clR5L2FSaEw4amlaWWNxMHF6RjduQkp3a1ly?=
 =?utf-8?B?OHdxTjRpTVFEcEhiV3V0KzUvQlZ0M1VlK2NEMHRSZitNQlZJNmg3Qk1WMUV1?=
 =?utf-8?B?OE51S2pCSUpHeGZkY0d4azNDb1VZeU9MejlhZ1JYR1NMYzZWaTFjRzU0Kzhh?=
 =?utf-8?B?bkk5cTZIQzJCeWlFd005UEdCYVlSRHFpYW5WOCtpdFYwVUdleUhuM0RIK1dK?=
 =?utf-8?B?ZHVwUHZRUXJuSGpCMG5RM203dzFvN3B4N3E3VG5zU2EwM04xMEQ4cWVaN1Rw?=
 =?utf-8?B?VU5lZ2xnYWJkcm9oVFR0a3M4QjJDRGpyY3dsamg4b0RZTXZMWm42WVh3NHJ1?=
 =?utf-8?B?OU9sY1p3VjkwMUVGMFQ1ZTRNdTdqVlpPSXVjT3lFSzdsTjhKMWxkcTR3cG1i?=
 =?utf-8?B?YlM1a0t3WmhDc0E5Y20wbGdFNVB6VTcxZUNuY01CSEE4ZkVqZlVCbmFha1hH?=
 =?utf-8?B?S3VTc2hVTUZpRTM0UDg2eG4xUE8va204Z3hyN1B6Tnpadi93bVNyRWdnRzda?=
 =?utf-8?B?cEo2Ty82TlFkcVBwN1JsdHZraGJ1T2gyRXhnbWtVR2VWZHJzSU1SZmN2c2R6?=
 =?utf-8?B?MnR4SkZ6WDdldmtybVgweDVyMndhYWdqelcvMVVTVlhoajQ1VGpRakw5S3N0?=
 =?utf-8?B?am1hMkJMYWNVdE8wa1ROZG1kSEdmOUZNdFZGSGI5bm1RWS9iQVNETnBvcXc2?=
 =?utf-8?B?dG9UblRxejRmR3hJQTgvb0EvMXVBZjljN1pUeDRkSUpUb3hEeFQvU2xKYnhy?=
 =?utf-8?B?aytDZm0xSWsyLzREaG51cDZTdjFJbnNWbEUvWVova1JLbVF6VGtmR0pkSi8y?=
 =?utf-8?B?U1ZwNDdQVVlIMDVsckFacUdlNGQxY0NYemNCTldJd3RBaFB3NHgrM1R1S3Zz?=
 =?utf-8?B?RjhMM1FGUG9oUzYrMGphbG9nZkVXczhHYnEzbjNVRUNybHVmRXM5ZnBSbnlv?=
 =?utf-8?Q?/Fn+gHKJknTSIuHvdkR+fR3/H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8135757-7fe0-46a9-b4e2-08da7c366f23
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:44:06.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3+Sf9n/9tzHiX+KsXPemUOc+ROBhK7NDcizRVChfZDsxU7ls/uJ7x6UZQ+kJlE1mLTkJGLq3IOjy/W1OvHudw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

Replace a p2m_is_ram() check in the 2M case by an explicit _PAGE_PRESENT
one, to make more obvious that the subsequent l1e_get_mfn() actually
retrieves something that really is an MFN. It doesn't really matter
whether it's RAM, as the subsequent comparison with the original MFN is
going to lead to zapping of everything except the "same MFN again" case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Split from previous bigger patch.

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -856,7 +856,7 @@ static void cf_check sh_unshadow_for_p2m
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
             {
                 if ( !npte ||
-                     !p2m_is_ram(p2m_flags_to_type(l1e_get_flags(npte[i]))) ||
+                     !(l1e_get_flags(npte[i]) & _PAGE_PRESENT) ||
                      !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
                 {
                     /* This GFN->MFN mapping has gone away */


