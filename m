Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A658BC021EB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149335.1480999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxGu-00088d-VG; Thu, 23 Oct 2025 15:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149335.1480999; Thu, 23 Oct 2025 15:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxGu-00085n-S6; Thu, 23 Oct 2025 15:30:36 +0000
Received: by outflank-mailman (input) for mailman id 1149335;
 Thu, 23 Oct 2025 15:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ct/T=5A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBxGt-00085h-8f
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:30:35 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3637dcaf-b025-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:30:33 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 DM6PR03MB4987.namprd03.prod.outlook.com (2603:10b6:5:1eb::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Thu, 23 Oct 2025 15:30:29 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:30:29 +0000
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
X-Inumbo-ID: 3637dcaf-b025-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5sX0DFy97TMA5v1vaY8mNxXdrcSxVJwnQZlU5sRZoFNmOGCW6B7WvZjPO00kBtZ2eweMD64oWwg6nl0+4kKISsBF81Uey8iFBhHKbPXUfw+UHTqpvSK5GaLe7t2IQLMaFd5TSwvxK8fyrDGcQtedQh8xFhPQ568Xc5u9kig/3B5GMN47PQx6jQ0N0JEa55AwG6yIxvLiEh++LN7wbmMkSZaOIm5guQ6+cREyz18/w0tkcBQBTos/9lyg1pQ1ZCUcurTkyE9A9PYatBjFs/t1yC3RTxk4FMnrWbArRUNUGkzi8HJrMKXqwW60nD16u1Wn96VWhxw9jaOnAsFjCvy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6BpgfENMwdRZxJi4fJcgdFSVq6aJwS6FJNe2jquDHI=;
 b=Ox7e1GxLYxvUGdCCe0pxsfSQtydK7fJkUKFOj9NYSWTRqM9eTNiA+iHafq4YtDMRuZv/SRkuw0ot+fxTGxLtBtvKn5N7fZd42LtKWNbBJEsQOOXlp3vJvuFeIogP3ENVWtf9lFxl9fy/WYVU5cqGjYboKs1Z6mtD2BFOPOAbiZNAc0drVkG+rvYG93u2aBKXnOuT5YtUzfulT1pLNbMkRJIumQhlxa61DF4V5tBK2kGhsrtUGa8YzhFASKqdlOaCLTZ0waK6vm712R0IqxEwVGOXtXeMl/r3uwj1P4OvnoRftJ9/ABsvjsIlydKlWwC/rv07kQqV82XmUue9M//teA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6BpgfENMwdRZxJi4fJcgdFSVq6aJwS6FJNe2jquDHI=;
 b=zw8If+B8LmjMhGZE2CNfTIRrijvau7ZUwDOBGYO317YARKXeETjnwhQ/NlWh/6GUi176WCxQ/ue7LM5bqUbsvEJozlW9RHHRh9lmO8ZB9VHCUuv8LoPyqxKgqa1ejVYTlFqIRwMikrWQf+967SFy++PWHxhKSorD2TR1EQj0f7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a6b61e9b-e1c2-472f-95d6-05b114b201d2@citrix.com>
Date: Thu, 23 Oct 2025 16:30:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: move vlapic_set_ppr/apicv_write()
 under CONFIG_INTEL_VMX
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251023152036.561109-1-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251023152036.561109-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0175.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::18) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|DM6PR03MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2e3dd0-4afb-4f66-756b-08de124918e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3hMT1d5NWt5ZWtTRnJzY0FEQ2pnamlRZzhvSmNSZWt1c0IvUDJBcURSZEIy?=
 =?utf-8?B?NzRxREF2TDJBbnpuTEZGQ0pSUU9JdktITmFDUEFEWjMzclRnTWJxK3d0SHg3?=
 =?utf-8?B?Mmx1RFAyN0lXSEpvTlB2Q0d4cXp2TjlQUG5LUm5hWUl1aTJ1aWh2RDBJSFRz?=
 =?utf-8?B?TmNGOXVlRzJ3UGl2MUFCTjZkYzNsWmpMR2lRK0JGaWRjcG9NVlE1S0lxaTR6?=
 =?utf-8?B?eGtjckU2TmcyZUFJV3lEeFJjTlN0aE8za080QkF6MGthclF5R1k1S3pIdmZP?=
 =?utf-8?B?UjVnblB3aVMrVFlORDZNSXpLOEpOUk8wRm1QL2dkeVVlWkNMTlJzTFhNMFFr?=
 =?utf-8?B?WFRWbTVSNGxJVnZRVWt2bHY2UkU1TFhoTnNjd0lJbkdVUlVnSG5NMnIySkFQ?=
 =?utf-8?B?UDVNb2VwVHYvQ0EwSjBKYTRKZUhFVEhPR3VFTjNXRGdqL3psQkQ5U1BOSS85?=
 =?utf-8?B?OVBoR1ZrUFU2UFBkS0V1MVhrbENQNVZ6R1UwbVBUNUlicmhybERtUGEwS0s2?=
 =?utf-8?B?RmVQZTZFYlJjT2ZZSWZVSEdJZlBtRjRuNEhUcmVQMSs5d3BzYmtYb0xiazlD?=
 =?utf-8?B?ZmhTNmpteWc1ZCtLeFdVZEJLZkxhdXdreWdHaTRqRCtUOThGZytJWDlicFk1?=
 =?utf-8?B?ajBxbTRzYmQxMXZDTVowUFpRVk1mWWVCd045ZDB5SmNoM0lPZ2duWGU3eVpv?=
 =?utf-8?B?Rms2Yzh1elM2cHYvSm0zMGIxclh3bFJaNWdtVCtuNWQ1MTBTb0xhUG1GMHVx?=
 =?utf-8?B?K2R4b0NzdGFaMTVsT2R4aDNIZU9yRGZyRHFPSkhyRUtUREliZGxzOTBBM1hR?=
 =?utf-8?B?c2FwbUxPUTdQd2RFVE94OWNaQ3c2TTlhYXRzQVRaelFZZ29QajYwTG9uMTNu?=
 =?utf-8?B?aHloVjVYVEtwWm4wcVdVN2pvVWgybTIvNjlHVUNtOEdlWkl0RE5CVWZ6cHI5?=
 =?utf-8?B?cXB1NWJiTmI2aUc2ZHVaU2hUY3hzNEJVS3lCSWRuWFo3Ukp6anFQczU4cks2?=
 =?utf-8?B?ckh3ZisrcUhYb0x3eERDYlBZWjJ3bkFpL0JtZUpRQkthSngwMDVvSU15SDBC?=
 =?utf-8?B?Rk83NmhQbU12VlhNU1BxNWwvSW1HazVJTWtpb1kwTGpOYU1tdXN4Vmd5ZWFh?=
 =?utf-8?B?VXpDNGJWK1JYbStHRTVILzhZRlk1NVhnWmN6MUxjL2p3ci9mM1dXSWluT1li?=
 =?utf-8?B?dVBsTWtPZm9qejBNeFRDU1VxcGtTQm1kWGdjS2xKT1IyeXVqQ0tja3Y3Qlo1?=
 =?utf-8?B?QXczd3U2Mkg3Q3RyTlhhQTA3V1lCd283dDhZYnRiNlYwUCs1eTlaVXhzV0FE?=
 =?utf-8?B?WERUS2dqQVNadnpJUmRhRnBNTlhZNHVTSUlYNXk1VThVa05iRW9QVTRnSjJP?=
 =?utf-8?B?MTIwWFZyQXhKaGdoRXkxYWZjanM1a1B0M3B5d095c0RoL1ZHMXltakk4aWhE?=
 =?utf-8?B?cGZ0Wm5oOFlBNjJQTmY0Qmk0NTNtK0pLSjJGZ05yaEpIMVM4bXlkdTVXYnZI?=
 =?utf-8?B?aUNMdjdla3p6SU1TclVSblVzTHBMZ25rblBVclU2Ri8rTTBJVGl1V3ZJOWM1?=
 =?utf-8?B?NWdPcnFLdDBKelZUbmdMeThmM3BiOWFra0FPUGJZTWUycXh0SFcxR1NLYjho?=
 =?utf-8?B?SjR2dmxZcGhFSytZZEM0MDJ0THRYSHB1Y2tWeG9uTWhvNzEzd010ajVHa2lD?=
 =?utf-8?B?bVJ0TEQxaVJqSUJidnFiZVJ4R2NCT28raER4M0w5UEhaV3F4NTFkallVN3pa?=
 =?utf-8?B?UjBBVXltL2pTRkhuMzRNbGRyQWdOSmJYS3hWOEpSSFJaMHBGR3d4SHhhTUR3?=
 =?utf-8?B?OTFZWlphd1ZMdUZoY3JwRzNmUUQrMFdDaFBBcW9EbzF2bE0rbTYrL3Nsb0xy?=
 =?utf-8?B?MmpQUTkyaDRPd3JsNktiY3FHRnhNYTQ5bG0wUlJSQXN5aVJjbTNsbFU2TWV6?=
 =?utf-8?Q?ni1e55zheNPDKxaDtmZAdmXK2wDPWSde?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXQvSFlFZ1BoZGp6MUVkbDRCVzBpeWFYdHdoSVI5S29mb1o3cG1NRlBUdG9r?=
 =?utf-8?B?QUVnVWFvU0I4cWNmRjF6MXFGMGN5dGFGU1lOckN6azRoaWxFVlRZUG9QV0J4?=
 =?utf-8?B?T1pESnBQWTZJQUlZK1FEQWlMZTlSSjIyNFBEZW54djArQ1I5cFlzSHJ2QS9S?=
 =?utf-8?B?T3gyRkxpOVREVDlEYnhrRXkxc1c1QThES2gxT3VnMDFyTVBWaktRUVBUeEta?=
 =?utf-8?B?dEhGK1VUNUxPOFhRMGR0NUhhbXVwdTBjRlB0Zmh2ZDFwaWM5ckVaSXRSeWN3?=
 =?utf-8?B?U3o1emcwNktDeW5LSnZEK2lJQU1Oa0U2cDU2TjR2Y1ZibFVWN01FV0tNOWZi?=
 =?utf-8?B?QWdKMThtOG16Wnc1NUp2U0VIKzZ0TnFGYmhTc3M2TlpDSkNRS0xqTE8zcVJD?=
 =?utf-8?B?WE9sSSt1aGxxRVVFR3IzWkJ5cXdqd3ppblI5NjlKRFFFd3RyUFpjZld4cXVr?=
 =?utf-8?B?eGFETjF2ZUFHV1JmVU90NWpHdXRvRTFKbFAyeG1kRC9mZld6Rk12ZlFxL0J6?=
 =?utf-8?B?L05oeGg5ekZWY3drb293SS9qVmJSZlJaMzhWZ1R3RkE0WkVhQ1M3OEEyNGFY?=
 =?utf-8?B?Vmo3eXZEaEliOEZDWTlXS3BBb1dqc1M5TS8wSGNQY0s1L3JqS24yTWRQSWFh?=
 =?utf-8?B?ZXZOSzM2UFpUU1RzQisyNnA5K0d5eW9hQm45V0trMk9zbWxTeGtLc0Uxcng3?=
 =?utf-8?B?ZUZGeGYwSnlub1JvM2g5bVN5NDV4T2tHbnJGdU1lZ25MRzE5TVNuaVY3MzM1?=
 =?utf-8?B?dGM3OEJyYTI4TnpQRDZIa0RDRGZ1TTk1RGZjRXpEN3N0dVdGZm5QZ3B0dXYz?=
 =?utf-8?B?Ulkydzk4TXdMVWcrMmZZQ2hJWkNQbUtmcEZyeStuL0tXV0ZRQUg0aGFTL1A3?=
 =?utf-8?B?eWJQZXJrQXhIYTZlWGtXTjRiVW1wTzNUQ0tRMlZoRWM1REVoNkhhaHlpWDhS?=
 =?utf-8?B?MUJUckZ6ZWh2OFdQbmxiTUtZcnpzWVRRWVRDbjdNNHJna1RxaTB0QXBLYm1v?=
 =?utf-8?B?SGY4TWFGMlJSL2N6T0UxVkNQZncydHpTa01BZGpmaXNBcmtmWDJLbmt2QytW?=
 =?utf-8?B?a1Q5RXo5WkZIMWcwcXN2OTJURlByRThJQStUcEptbHNFWFlHT1hsZXp1OW5r?=
 =?utf-8?B?enVzaXBRTUFhNS9kMEJiUGpEUFl2dDB2ME81eVVIb3hDSUJEbUtzSXhUS01a?=
 =?utf-8?B?bEdrSktCNFhNQmh0c1lXNTZEb3BuRkszZlZzb1UvRkw4bEFvMWxuU01FTXQ5?=
 =?utf-8?B?eCsyZE5kb251MFF3ZFNLcC80MmlJUUsrTmpZRWpHYW1BbDB2NHFKNmJvNUhN?=
 =?utf-8?B?ODJTZE1Vd0tsSWVqaEdsSXRONnpMWTBxYlVKSFlNZ0dFQnZSc2FmVHNJbmlL?=
 =?utf-8?B?S1BIb0pYZlFTM3pXbEF1WjRneWthRmRHQXB4aEE5M3VHTFYvbUgzdWszdDVs?=
 =?utf-8?B?Vmx2em1LOWpMRk9QTFFOc0VQN2xMVWwrSUJhZnZmQVV3REpyVXZWYXRVamJQ?=
 =?utf-8?B?ejNPS2JoS2liNnhoMUJmaGR5Zi9vL055M09iYW9aOE9TUVJkMjF6eEg2VzFJ?=
 =?utf-8?B?aE5RUFhZUnJHL0VYWCt5S211T1ZYdFVodkhUdDBWUTFaK2ltTFlIZkUyWk1l?=
 =?utf-8?B?M040c3NDU09MOHp5WGFtaFpST1hwOWpwOVFUZVl1T2NWZFY5ZFFKUDRKL2xT?=
 =?utf-8?B?cmFqTTQ4bUppTWx4U1REWkcrZlJUQjhHQlA3THU0VTlvNG10YkZ1L0FDRzJ3?=
 =?utf-8?B?VkpQN1RlY2tlbXRwZVdKWUEzTFRjY2pYMjRoNFYxYUNuNGwyTDFpcko2RWNE?=
 =?utf-8?B?eXBOQlV4eGF0eWNGekdPODRDdHNROGRlK0JHSmRESEYveVpVZ08rUDJqMGlI?=
 =?utf-8?B?cXQwTEZ3YSs3UUhZYVludzlrcGEwN3hoa3pHT3poYXQ2NXg3M2U2ZDI2ZE91?=
 =?utf-8?B?MjBnQTZyV3c2elRTWkZPb3d6OHVObkkrVVRDeCtuV1JJcEtQWTh2U3Z4aG9W?=
 =?utf-8?B?N1VrN21zeUdoVnVtVm05M2lZTklxK1c2UjUwM1NsazBHdW1Kd2h2MUI4S29N?=
 =?utf-8?B?U01qY1N0ZWRqQnkxUGVjTEtVYlVuYmhVZDAvSDhSd09ma0hDazZ4dHZtOEY1?=
 =?utf-8?B?TVEzNllZWFVSMzdJOG1PYmNvT1QySXZFenh0WXN0cy93RGExK1J3NUNtdEVT?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2e3dd0-4afb-4f66-756b-08de124918e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 15:30:29.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3apueVJjM9tbqT2Eb05HBpOSv+vYzulf+Zw7JeSOre177iIw8vstsO9QZMFQ8ivyWniEnHyKHfp3twiGZT3FSwZpP0ijSIZ8Yx0ehTwiWXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4987

On 23/10/2025 4:20 pm, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Functions:
>  - vlapic_apicv_write()
>  - vlapic_set_ppr()
> are used by Intel VMX code only, so move them under CONFIG_INTEL_VMX ifdef.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Yes and no.  Yes right now, but this is needed for AMD AVIC, which I
understand is one one of the plans.

Throwing #ifdef's around like this in common files is fragile and will
lead to a randconfig nightmare.

There is an alternative which ought to work.  Turning on
-ffunction-sections (we already have this for livepatching), and
implementing link time --gc-sections (new work).

That way, the compiler/linker simply drops functions that are not
referenced in the final binary.

Personally I think it will be far nicer and more scalable than the
#ifdefary, (not to mention far easier - it gets rid of everything
unreferenced with one fell swoop).

Thoughts?

~Andrew

