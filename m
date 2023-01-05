Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F365F0D9
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472056.732165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSmT-00078a-E1; Thu, 05 Jan 2023 16:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472056.732165; Thu, 05 Jan 2023 16:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSmT-00076P-Aa; Thu, 05 Jan 2023 16:07:49 +0000
Received: by outflank-mailman (input) for mailman id 472056;
 Thu, 05 Jan 2023 16:07:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSmR-0005kL-Ss
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:07:48 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2067.outbound.protection.outlook.com [40.107.104.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1833933e-8d13-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 17:07:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9326.eurprd04.prod.outlook.com (2603:10a6:102:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:07:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:07:46 +0000
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
X-Inumbo-ID: 1833933e-8d13-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkvHJGOSyTC+uh7KK9yKtwXtD4wBCxEwOJlMnqQSu0uq0g5kEhJP33TmxQx5ZLAnAeh6eKMBP8hBcNSTnA/eZVd/yyV3iemh/pZwK6bnI2twKpzn7b32ohBawSvYYc4UnmfWnUz27Nzz2BDbcL8G2jDbJaJsJQuPb12RU65DEoGBTi9/CfUPELl7bwhceZIxHT9fU27AE5/kA35CjnzJck9pIgGo3oeYYH54JXjMoweMBO0dHVZ2EFzrWU8fMFJlV44FgMt2Rrbu3UCpLjHjdf0xqXiAY5qraRKvwzLyhOFQzmLKAJWlanwHq4l3qg+nTh72XW5Fall2qvwOn3q7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkzMWSo4VP4iVpCTjNCVb8H5HyGWrBz+Rgr5MlOxOXI=;
 b=idd6L6FpiU/2DvabEp8/JucIpXyj+UvQJxZXHrqG/WXbSXT9xPtk7rEb5jzkr195Ly6+1lr8bFzLvTCI1VZ69bb5UHy79RAf183moAqy81GH80ZoDksquItCilhSiaff6AJva41BfQC02vmNgHcgXgTnQs/Ix6YXRAZMblcLBc7ttkVfjOxq2nows5tv38cD0Cd8xbn+yoTjFimuTr2h4ox/Ai35saWHLWVawU9qIG1JQh66TeQNMFtZmW5QebKq8kwJrexAAmq7997yp+Tc9sGIWDyfJGuo3/WhuDRlw2JvHw7F18Y3klQU7YfAZygcEe6sOj5PSwXVAn30LnXNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkzMWSo4VP4iVpCTjNCVb8H5HyGWrBz+Rgr5MlOxOXI=;
 b=gQz6yA5sZHFf4Twv/F1LXZxXucKEh3yRKR3vYxJ78t+WO8OlSBTxbPMiKzC+9KAFJoXSFDWSPtnYjmazJ5cDfynhBBUDQx1W1lEB0LNXzNVhbhF9l6Ga3vfFUEoL+P/PW8hNPQ6/uYSpJrETfq8Lmw29avdvD1RqbsIpRFXUCfaOU1GJeM+m12mLSiiLKW6TMJM9zyUPxPM1fv2FNhXKzt9fU4/I6wKHsaGiyDpXzodcUG1B/4KxOoyfjZ4xkMzPT6PienCcRRuQcIbZ3w+6/wonafpQ2PT2Snu/4bQRhUrBtYo4hzLioSz0YjYUuy9qB4zEYJBUYX1PR/yZh4Q12Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <514f374d-daa0-ddc0-8cdf-9dfd014d508b@suse.com>
Date: Thu, 5 Jan 2023 17:07:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 11/11] x86/shadow: sh_remove_all_mappings() is HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a50beb0-154a-425f-3cd2-08daef36fbd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3UX9Gb8wOQdYBNL9QMEEOh/S1m4Gqp6MVJVEmW5FkJ4v1Yw6hcrzEQ2bc6lLbB8jlHJwIOV/MvG/aHVvOpnANkCw+NvZYH1WY/cFVNstBkFx2NAD9t4g7hturD5hrjbDW+3LEc56WRnHhhBlkBKV2Mv1jOuZXRYJRLHx6eMigYrkhqQzQw1qeUn+uy63WtgvbqSNpj7XwdyyT2/UrV0FElj7qvgmPP0nFgiTvM9UtqgzGyDeHpFDBT6qGPKmh6PYmYLDnBjd/YxG/UuPuGKcASoDp8xWkp5eCA8yhDiUYjmglusPifgnXBE2IRNF9VFz88w8LjMk027+RqhW4Krd6VR/APKXFGwhvd3PMK6PxFGDbhttPAGTL0cEUX0sULKYp6fH46ctayr3I/46WmDvrcAwe3X5Yh9MVHBB9LIAZapfJaSJLNxfhn3ZKcP0q/Or0LfuPljDkaWweHXCP23z1JhgpOgPH0Gjxsu3e7yoYATC6w//88r/2q5N+mgiZRK1LDyCkPuRoXmd2wyEkIpDJb7/1qXtvPd2ggvbyzNWUcYXfWCNQwNnlGTX6aGcew+1JgOleoEQEHpw0Yw49M/hAxYjDrQShvy8m+3JEElbNWpWtnlOqyVrRQnyaIuf1u6ZSKYjZzlPplgA2+iHFUXmz0h5qU07IWapG/OslnwmCGI1mo8VE0tsVoei9OI1KR438XKYS1QJcVLiy+Olm2AD4pNbxAf9uheuxKCLcsJ0+JA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199015)(186003)(26005)(2616005)(83380400001)(86362001)(31696002)(36756003)(6512007)(38100700002)(316002)(66556008)(31686004)(54906003)(6916009)(2906002)(4326008)(66946007)(8936002)(41300700001)(8676002)(5660300002)(66476007)(478600001)(6486002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R05veldYdGltS2N2aEd0NE4rY2tnRzBuMFBZZVZXVTJIampqMHRtL0Y3RjJv?=
 =?utf-8?B?MVBFU05QcjBUajdPOWx1ZGtJZEM2MFN5RFUwVGxrRWVmaTFCZm5VeUdDeCtj?=
 =?utf-8?B?TzJQeWlobkFhRFhTQTdwUjc5NzJNNEp4OW5YREs1a2x0elhFWCtlUmg2aTNY?=
 =?utf-8?B?YkJVYklnM3NzazVzV1VTNkhxSk5wbkJRbDM1K0pDUmZ4aytUNVM3NTcyaE5M?=
 =?utf-8?B?cE9aeDNLVk9ncjJFekwrZXAvSWJseHIxeEd1OUhjbmRrcGhNS2N0aC9HTjF5?=
 =?utf-8?B?R2hHcjJWUmlXV2U0OUtrMUp2cHBuNHZ4RmZGTzJPNE5GR3NDM2xjU0lYeWxD?=
 =?utf-8?B?RWhpVVVuaEFSY3RTRTFBMXZiSnRSSGp3ZXRWZnNMYmtVRVRRTmN0cUxmOGpz?=
 =?utf-8?B?dzJhY0FIaXJocFExaWNadjhIa3IvZnJOQmRPaTM4N2hEc1BMeDVxaGM4elVs?=
 =?utf-8?B?UDdlNTBtWk9lbCs4NjM1V3d3NkVBWE1LWVRXUjRhUTZrWmZEV3k2eEErZy9H?=
 =?utf-8?B?TlpwU0dVVWtYa2ZzMWlOT3R1NEhaa0JZYUpicWdoakFpMm9lNE01bzBncW84?=
 =?utf-8?B?dHFRQnozaFJ2R0s2QXY3UTJRR295WFVRQ29ZRStlTVQzbHNuUXh2SDkybDJM?=
 =?utf-8?B?ZFJNek9semszRWxrbjF2YjZDVElKN2k0Y1g1STROci9aaEFqVDV2eGlsRzBM?=
 =?utf-8?B?alJxNGhTd0ZvdkdzbFc1ckRQVWhnQ1N0VFBFU0RDT0RONmxaVzZIM3F3V2th?=
 =?utf-8?B?c3dob0JGRHBJY2tGZ0JVdWQ0Q3pzZ01zMHlDSVV6Sk11S2dXNnJQbkJYeXRz?=
 =?utf-8?B?SGNjWTU4bHdVejU5bWVaeXV2eENiRlVxUjVqbndSRXNib2s0YW9lYlJRL1ZC?=
 =?utf-8?B?QktvZzZraWtzRmdhRHlzU09BM3p3bThJbDhHQy9JOUFnZzk3ZjF2czlMSEM0?=
 =?utf-8?B?eTA2ZjlZRW5XUDYyRDZPdjlONEcwaFFVL3AveXVTSjZ3MWNnd3NhbFM5aEJj?=
 =?utf-8?B?ektNTWl1V0kwY1lRV3FycmlzUS9oSnBOMGkzVncybWhzeVRyQUJ1cVVvUHgx?=
 =?utf-8?B?dXRWdWthVkkwQkdmUmM0VTQwYXo4cnowRUFLNWxqb3U3Uk4yOWJCd1hMSXhT?=
 =?utf-8?B?V2RBWXZWQjEyaFpmWEpNTm4yazhqbEs4YVo5RG5US1ByVm9vU2pmOUduMDhN?=
 =?utf-8?B?R29SNHpETDh5NHNNT1dSZlZGRnpITjVZRUxZd2NHcjFjaTk1NnhPeTVwdkYv?=
 =?utf-8?B?WUthWHUyR0pzRWxtbzRJMXQwSTlNMkdRR1JkSzhJeWpHdzRJTW1IRGhEdmU2?=
 =?utf-8?B?U1lLVmx6YWdlU3MxL2NvdXozb3loWmpKL1hBZUEwS2F6VGl0M2N4aFplbmox?=
 =?utf-8?B?NmdrSTJpNjJYbEJCUFRLNjdEOWp5ejF3TWF6czJEZUVCNHRpazBaWi9jbTJl?=
 =?utf-8?B?dHpNMVltYisvZHZNR2lQY3AwQWp4TjhIWWNhYnZ0QVV0ZVIvU2l2YjR2K2Fh?=
 =?utf-8?B?WjllVjVqaTRTcndEUVBmTmJiS1BBVEFxLzN2Y3lFYkVLY1M0SVlpb2RUZXIv?=
 =?utf-8?B?a0FKZFFOa3lwa0NWZVp5RGJhL3VhODJvaU1lU3p3cHd3YWJFNkJIRWdRWHgz?=
 =?utf-8?B?TS9WUFBwZms1U2swL2V4R0h4S21lTjRjdUNGcHJCVWhvOGZJc216NW9ZV3lH?=
 =?utf-8?B?N2NtVlFHekMxRVRKRUpkM3NocW8yTStQNWVSSm9jTTZpMXhPQ0ZlSkpDS1pm?=
 =?utf-8?B?RkdqV2VZeDFOZmpNOFBOZVlFNmxObHc2ZWxJTGlDSjZFeUlKVmxVTHBOTFFI?=
 =?utf-8?B?NXZXRnU5eUlHOEEvZyt1TWM5VTFDdk9GMW4wSkxqMXg4cUZyL0VWQzBGWDE5?=
 =?utf-8?B?NE9tc2VRNjY1WWkwcC9VcGxSVmxrL2xPNVc5WmxsNFA5YlRId1JoVENydFNk?=
 =?utf-8?B?OVJTZjBKUDhVY0EvbCtpZWtMMlpVOXhncXRkMnFwL0RBb201R2FPcmFvUXJi?=
 =?utf-8?B?QUtkR043VUNnMlRwanh2OFQ2ZTlCZXhWODg5MUhTUnc1Z3FnMm1TUGV3RWdQ?=
 =?utf-8?B?Y2RJdWJDdE9Xc2F3c0t6WHlyVll4eFQxbGRiK1ZLT2x4MGpWZjg1alZHSGJp?=
 =?utf-8?Q?IH31xceya9dKIixK+0UWJGd2v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a50beb0-154a-425f-3cd2-08daef36fbd2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:07:45.9884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9Kk2GnJgQoXn6o5Aw5NeB4cTtB+/9ZszHm7RsREp/286bWoi2PaoGWsz28cy/lSyRECxe8zOeimWxZIkK2dDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9326

All callers live in hvm.c. Moving the function there is undesirable, as
hash walking is local to common.c and probably better remains so. Hence
move an #endif, allowing to drop an #ifdef.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1992,7 +1992,6 @@ int sh_remove_write_access(struct domain
     /* We killed at least one writeable mapping, so must flush TLBs. */
     return 1;
 }
-#endif /* CONFIG_HVM */
 
 /**************************************************************************/
 /* Remove all mappings of a guest frame from the shadow tables.
@@ -2004,12 +2003,10 @@ int sh_remove_all_mappings(struct domain
 
     /* Dispatch table for getting per-type functions */
     static const hash_callback_t callbacks[SH_type_unused] = {
-#ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
         [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
         [SH_type_l1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3),
         [SH_type_fl1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3),
-#endif
         [SH_type_l1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4),
         [SH_type_fl1_64_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4),
     };
@@ -2064,6 +2061,7 @@ int sh_remove_all_mappings(struct domain
     return 1;
 }
 
+#endif /* CONFIG_HVM */
 
 /**************************************************************************/
 /* Remove all shadows of a guest frame from the shadow tables */


