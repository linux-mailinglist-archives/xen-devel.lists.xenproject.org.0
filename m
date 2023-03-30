Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD36D031E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516635.801077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqRu-0008P2-Rl; Thu, 30 Mar 2023 11:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516635.801077; Thu, 30 Mar 2023 11:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqRu-0008Lf-O6; Thu, 30 Mar 2023 11:28:10 +0000
Received: by outflank-mailman (input) for mailman id 516635;
 Thu, 30 Mar 2023 11:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqRt-0008Hi-7b
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:28:09 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f17ae3ad-ceed-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:28:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8782.eurprd04.prod.outlook.com (2603:10a6:102:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 11:28:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:28:05 +0000
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
X-Inumbo-ID: f17ae3ad-ceed-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHhl5j7FNcvkHOfe24V4SM18kCPTzXi+RRxUi7vk0sifUa3lgs6Mp69rZY35nLyx4KsMo0nGDgSmaiombpLoTpHjZZnlfVsHZ1u9sJjg9ZTbc3WPqwmF7GJstR8Nggi7kLa8K8tqEFUG4+v5DsBIJVU1A8QXQRux9wMkH8K3X2cYFkFKDhGyZaoo0tDHDze38gYKY8lZ2ulPvJ1fEzg/S0Zx9vL+K6el6lB0n9wA5ZiA5jhAp32n+HZokynrQyczDfscjXs2wR/UdCpfPKFzb68UorZ5X3jZ6BSglv+4SlNyQc82o9AJuRCATsh2DoBjJHhS9DhXjMAvPVutB2H0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLFXY1A1PoRDeG2OxMqFXZeghqkcVHyCuf7lr3QrX/U=;
 b=LGIbasSAViVCSKX+dCOV9iyH+d19WKFAnbd2vtR0Eem1zG+jt69M4tfe3W8NM5RJ2e3OVTERrg3gYtvPJAHhAlnMleA81Xl3z7uVVZJ59WptKej4lb8ry5DyxqmsnDyiw+rLeB2Tv0PMrIrxzpDcHuW27bhaN/iNSIafMgJwUlsWRxb+qFDCCXPN9B/yhSoKw3LcIhA5281PjEiN3I/iHTp1Dry3MJmuryhMMb/f846P4UOnaoqQbWoKImcT28PBcrs4SUWHKHEifmy3oxiLQAAr5dtaMod8tIMM+nMuJutsi/h10JVOJHIcUntIbGEJ3RPRZ5Te9XJhus3m/j3Y2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLFXY1A1PoRDeG2OxMqFXZeghqkcVHyCuf7lr3QrX/U=;
 b=otxxi+15956H2KFZJhaldcSAmVBLCw1pUJDwmbnpRcKcrDxfg6BV4GZ5tAo6H+xP8I1pcBQkaCyTEvLYbkFpJ+G4FkLap9orf0YjxyzT+crw93jd+8AMPecX/Zfv//k9M1dN4vGbm/5VnN8MTl2SL4KXgaa06vLofZdifgOsDyY95bVqnSneN24vycATzeVh2n8BkAUIDYooxjDMxKhylkjUvJZb3JkuOyBjvlOQPAFKXTazKhpILJqr8TynFeFAOq/Re6Azy2RSDKaFiVxWX8Lg1qVzumIQ6tOnaOIIQtdr3sZCujHtDwNERpGwMS9V1WCi2NIVTtX3+ZiF8Q/7HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6363f9aa-4030-d889-a85d-f5834e607d85@suse.com>
Date: Thu, 30 Mar 2023 13:28:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 05/13] x86/shadow: don't generate bogus "domain dying"
 trace entry from sh_page_fault()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed8ee46-0696-4e5a-9a0c-08db3111d4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kkYaEWtsx7PFfKM1PwHx6ux3lX/5+JYW5iaNU4gaMLqiCj/dLuDY34hw5EYx69kAq3wA5Orm7qsh3/zRJ02Rln81zb026YzqQ/+1al5TPH2uPh71zRBxEq6l/958odINyftdk1VFgMDT6vDxuXRyNHALOCwMDdYzqNX03C5r0ZopW+9b8rwLQ7zFEc7HLEVCSzyxhmH/TKCJB9Eow4ZwPzOPACHrSQddv9M6pcHvjGER0d1dl/edMxb3Urq7P/1X++xwfQ9fduwW7VnlAe610HqOSqNWdTYym7y71XNqjiTKyJA4jZSRkmtzqbatE1FNrmhNQH13njoDkBI+6GDgD39Sf+2w9DaJx4rUZF2vMRagUlmKEapADmzlqx/Xwu/2ELxWP+3P8u4jbujn1p4f/gR9QZTwCwrkxetRt4/ZN9znJN5b0H20F9A80+AkQHHJ5fNYZuiTta5Xu9phyZGWKwGGoDrru/87EtyRxiHaaQhAZK6EZX+aaIzWHqyR5HBCdW6rq0QFXa1rwrKwHzQj6hvlI/zlxhHqv4khPibcFTkkt8icPmxGL8h1mF8ETLuJN1ZlDjAdEGQFoVQ82JyvkDFBnQ9Nt4B2mH4ZCggfBapaAGPd9F25hovP2jh5P5rGmY7DJZzucUn0nvk7vcCb6JenJY+9skcXhSx8B6kjxf3ciBOeSzeZw+SSWIVRFj7AXxRmfZI1z3us6sQQ8mRzSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(316002)(66556008)(8676002)(66476007)(54906003)(6916009)(5660300002)(38100700002)(41300700001)(4744005)(66946007)(8936002)(186003)(4326008)(2616005)(6506007)(6486002)(6512007)(478600001)(83380400001)(26005)(86362001)(2906002)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjFDNkFtdWpUOEdRQjIrNzBPK3AwT2Vvb0tGRHY4akpJK3NoRTBXSm9Qd0Z4?=
 =?utf-8?B?WGRQR1lLVGdodmtRS3VkTlpHcWdkblJWMTRiY25XZVliNDN6Wk5pOUtmcWUr?=
 =?utf-8?B?eU9teGticmpJWnBQc0x0VVZUTnFKaVAxeUN5bWV2RElFWlV1TjZxOEI1UkxW?=
 =?utf-8?B?U1hyNE03aFV1cHlqZ2NIeFY5cnFmdFJpOC95U1RtNDFQSE1rNnB1V3BEdUVq?=
 =?utf-8?B?a0x2eTBWMEljMm1ZMHgvS0tSNTI3MkFhRTBpeU53NVV0cFJ6bXlpaVZjU2VV?=
 =?utf-8?B?SDVyRlRKemQ4RHM4V2ZoSU1TNTNHQU4wVmtEN1IxVkJBL3hGQSs0OTF5dGtJ?=
 =?utf-8?B?QjJndlhQRHgzUHY3VWk0UTQzeE04aGYwQW0wdDdlSEh6OFptTE9pblBXb2JP?=
 =?utf-8?B?VGJqdXE3c3JqU2tDZmZIMlJyTmdubjFKZno3cEwzNm9DNmpGNmNncFB3M0w1?=
 =?utf-8?B?R0tVQ1hUQjg0TEZGQ2N2eDBnamxFSERVMEF0ay9CWTFGbjVHQ2FKSlNzQnI0?=
 =?utf-8?B?N2M5TGpNK3ZBd3krdmFqYVc1V3V3RTFlZ2hkQVhnK1VBZFdlQjJNYi8vVUla?=
 =?utf-8?B?c2cvQThyMVNwYXdGWnE0RzQrWDIwMk1kbmtMQ1lJNk1qeDE4bDdjN0Z3NDBi?=
 =?utf-8?B?b0MyUStENFI2T0tpRXpRU3NHalowcy9BcjhMRk8renlnWERSS2dZR2JaenVD?=
 =?utf-8?B?OW1rTHNBTnU5dWdVYWlGd2hJOWtTZGFvR3ZOeUsveVcySVpDYi91NlcwQXZO?=
 =?utf-8?B?ZHpSZmM5Yi9paXpBUERHSExibDdvcE1WWXRSQzllR05rdHZOZzFJQkJldkQ5?=
 =?utf-8?B?TVJnYkRsWFluT2l6UFZOdTBKZUhhazJod2ZBQUNXRGwzQWV0NHNTVGlISnFQ?=
 =?utf-8?B?bThzSWZUdDE0Yy9YWTJ1WHY4Zm5Bd0FVM2lmUTNxT2hZN2RMSGJ4MTFpM0Y0?=
 =?utf-8?B?TTQ3YzJxVFg0UnhEWndlbW5XY00xSjN6ZXdJM3lzbjkxMmFPZlJaNTltWG9Y?=
 =?utf-8?B?RGloQkxwZUpiSjBtb0puZ0NjN2crTDZINkE1T3lESzlIdWd2ZDArdWQ0QXlz?=
 =?utf-8?B?ZGpyalBJKzRXYXF4ekZEZFB5N09KNHU0S1lXYXdsc3ZqOStVME9CNEorK2VN?=
 =?utf-8?B?eGk2aHF6b0VPNC9GTmJ2U3d1b2tVTFlUeUFNZS9ia3YzbEc0dlkzd3hCYVgx?=
 =?utf-8?B?RFNkMUo2TFpkcXczNFBQOUJNRXVPZzc3dWx6ZURNNlRlenkxVHEySG12dEVr?=
 =?utf-8?B?OW1zcUtjT0JaTkRpd0RWZDFOSHdNWHpvNkxjcExpM2tWcHMya1RnTTRDcy9S?=
 =?utf-8?B?OGE0KzVzUFJ4WVdEeHFsSW0zWUhNZG9zQW9HZHZ4VE9FOEQxQncyc2RjdXVE?=
 =?utf-8?B?aEtyQTVFNlFCdEppck40VHhVSzJNeG5rRXluUjhCSFNIeGVmeFJrTWJoVndP?=
 =?utf-8?B?NW82QlFtZXpOMTZTWldxeVVGaGNqRkVhdTliK0JteGRiL3Y4TmpxQllXS0d0?=
 =?utf-8?B?Qi8zVThualAyQlNqLy9HWSt2L1FQdXZodTY4Sk9kcDRWUTNOZkpyaFgvM2ha?=
 =?utf-8?B?UmpySzR4SVhacWN5Z1l2Z2xsOGFOZXFreVZra3gveXNIbzJlcjh2VTdIWnFi?=
 =?utf-8?B?UncwK1VzL1RzNHBrZE5wMFdleVNVOEZNOTNHOXhkeWRTanFmMVdaTHhtekFT?=
 =?utf-8?B?Sm4rZ09qa1BndmJxT0dWVlhKUFZaclV2Q1V2TCt4b05RMndHakpxeGx5bEx4?=
 =?utf-8?B?d1NZK3BOenVhazV3TjZobjZSZGk2bk93aVVUcytsYjhvMEdGVnNvMmJLenFp?=
 =?utf-8?B?SllWYXJLeGROei9sUEMrM0FRa29rVnVsS2V2ckdreHZHNHhGNFdBM2MyWnRo?=
 =?utf-8?B?YytHVDlHWUk3dDg3SklqQThzUW5XNDEvWEx2end0WWE0SjdJTFBaMkRQalhY?=
 =?utf-8?B?MksvZVRYd1JHallzcjZ6Q1lWQ3htdkw1OVJ1TG9LbktYK0dycDJ4UVoyQUhQ?=
 =?utf-8?B?eExkbSt5SGcxbzRpZVFrUjBaZGVMS1ltd2dBWXhlQzVSY29ick8zYU0xdHJQ?=
 =?utf-8?B?ZVhOalBvK1pmYUR1NlhoeHl4QTR1REI2aFZSd3BFNmhkWWN5aVlzRWErd010?=
 =?utf-8?Q?v5MGSMVN514DlFBMKuGFjASGu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed8ee46-0696-4e5a-9a0c-08db3111d4d4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:28:05.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAPpOQJNCsFA6To+zP515CbVcui0/lVJEhFS/0UQ4q9TUH5kg0u7LDYmbbIovPka0tTJQ9MTfClbu9aTYe8OKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8782

When in 3-level guest mode we help a guest to stay alive, we also
shouldn't emit a trace entry to the contrary. Move the invocation up
into the respective #ifdef, noting that while this moves it into the
locked region, emitting trace records with the paging lock held is okay
(as done elsewhere as well), just needlessly increasing lock holding
time a little.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2492,10 +2492,10 @@ static int cf_check sh_page_fault(
         sh_update_cr3(v, 0, false);
 #else
         ASSERT(d->is_shutting_down);
+        trace_shadow_gen(TRC_SHADOW_DOMF_DYING, va);
 #endif
         paging_unlock(d);
         put_gfn(d, gfn_x(gfn));
-        trace_shadow_gen(TRC_SHADOW_DOMF_DYING, va);
         return 0;
     }
 


