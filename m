Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9496C77380E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 08:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579254.907155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTFqk-00047Y-3N; Tue, 08 Aug 2023 06:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579254.907155; Tue, 08 Aug 2023 06:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTFqk-00045o-0c; Tue, 08 Aug 2023 06:05:46 +0000
Received: by outflank-mailman (input) for mailman id 579254;
 Tue, 08 Aug 2023 06:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTFqi-00045i-Cn
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 06:05:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b059bbc-35b1-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 08:05:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8303.eurprd04.prod.outlook.com (2603:10a6:102:1c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 06:05:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 06:05:40 +0000
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
X-Inumbo-ID: 9b059bbc-35b1-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYjzD2nVc9oegIBKedZSUX3uTqvFys8bGzW/t2Gv6AQjoE64y267dSIxMjhlfoRXb7DB5ILSYKomTaWzxx2PVjRohtzzriKXjMHE5nHrgtT1OyFAtunbdKzUHfShE3wIrhshBShWOwl26U4XLcP+zhtTWKsO/Sggm5UPafM9LaqknJL3NeXjVby+7d3CD1uNHDjUWwy6FZZv7Z/Pu7n7opLMx9dNCHG8vwOzzL6PI58wvPG2x90qm19fsXFjMRJa/HWYEz7mnPuuALLEyKAHHA8KzEhTPrDwCeirAOBWy7POx3jo6A/soELLtLhyA3rzRPLCFqEqLVdeIhG4oogszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2Yzjge/p0tWN7wdJH/oMS1mkwIsQlhjyMxz148iZ2M=;
 b=TKppu9NmhXrFIP969QiRbsrBiFNqMSSLhUFPnTmmGmlrI/DqyR05CIfuBppyqgvHXXnGDdC8N1ry9cVJ01cZyJrS2mMfxaU27ynhswF51ZJmpIX/fdBJGgLr2IUMORBFo9xCWsLHCuljk7ToA8TsS8+OfCgQERtMKvp52YlBvKAEXmJzpsLOd7pd7O431Lsk4yEKMvF8rv16JhS48s6ejq/+VGArjlq9WqZnDvV7i/z0Azey61M90F3WJQ17mi1j+nAGWPP/941vphPa1GGIKT4KSR5P6w5t7G4pn/5U+gItwMZxwptPm3/6BuV5ITwQsXCu0Ixx9Da4Jn2a2YrZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2Yzjge/p0tWN7wdJH/oMS1mkwIsQlhjyMxz148iZ2M=;
 b=kwEpkHABcReSeErJ9Eje3vt+imOWvEJDTH26q62oEG8zge+MT6pHK5b1cOneRF7S4hXW9ragcD9Pt5GxpAVcwN2gFD//k5XS+OnzD68Q+NzPWxsRR8vj4i1dTmycPcHuWhp9iKj5NvgraPTDGfvspTDrH2PCwe0BUNkqKEpd8PSJcXJP/3dcnls4S2Y7+mm6nZGFEt0R1rhojsnVefNWV0/KosJwU4/4KuZruT1shWHj69aFuvbYs8j3BHHdvyOFHVo9VUTbj6AmSVbCe3z3Ohoru5/oiQ75E6FQB3DQ1KgKxa+YSfQlSPv+YJm5hRox6Op4gKMb4jGgKCj/QYdxUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <825bb94c-a427-62ff-a790-39c0792553d3@suse.com>
Date: Tue, 8 Aug 2023 08:05:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/5] mm: Factor out the pdx compression logic in ma/va
 converters
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-3-alejandro.vallejo@cloud.com>
 <db533ea3-8b1f-fb36-a0b8-d196f3a84f33@suse.com>
 <64d11b39.050a0220.2ab40.c2cc@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64d11b39.050a0220.2ab40.c2cc@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: c11a9028-d14a-41d4-c253-08db97d57e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wyQ+mO39wN94ENW42/74qpWHvwSTMyQB/RNfeBfwlr5zQva+6sUSEHNfa+v1ULI+i9s0gYvxvW56h917vo4Gqz2shET55uDyQTwTAGwSH6U2k5dwhReQgHdisCaVNvtkA8o5U3jBPhL3OjtJOktIgMg5Y7zAueMEs09RhnyzLo+L3c7pTb9SRiZHSy9WRTwvIlTNFrL2wF2zEtI5ubSYv3JaL/X+nwwAP9aQhoegxcAOKGOjXH6WBsc+bpVJu7C0+agOqm/RYnOOL5ILBQSXqT0oy4TbPyOSjz+t/Vkdd91tclw02uJDxK6FlnwajNy2Ln9lJMhm06IJWJekS5IrDFeazjeEq7IMsLAFqrBhWyb4IVQ/hAFkg6bDKfjMj8fSUKYYFcfsKizQ4Bm+MobJrHmf1FsW7+r+XHX1rFw+wy3vQv3UIX9KrY/CrDJKuOC2f+eZLWeDzuDQXx9GNU1n9sdASmHoCIlTd5elYw2yet85t2deS0biIrmyrT7O0Gfs+ano7Dr24t+SYLK/aedhMbzK6bqkZqUfO3M0Lrohi+fjKL7XwxB6hVKMYH1htRtaCk4HOFWHSZth2dNceCIuaKjiILxz7L5an7Jc7juccTHyOA/r9vha9/mdEBzRnsZWe5PPcAnSBUT3u5Tiqbr5wCOgOKKVTUjUBvOet+aLtQRKfU34sEKLRjZakYeY/rj95L3iG6dCEghDyV8e9L55Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(186006)(1800799003)(90011799007)(90021799007)(451199021)(31686004)(6666004)(2616005)(54906003)(2906002)(38100700002)(4326008)(5660300002)(8936002)(316002)(4744005)(6916009)(8676002)(7416002)(66946007)(66556008)(66476007)(86362001)(6512007)(478600001)(31696002)(6486002)(41300700001)(36756003)(6506007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1hJNFNjdWoxM1Bld1VONmt5NGNJTFBIYUxXbk1BSXdCNU5nTDFwTEtwMDhX?=
 =?utf-8?B?OFM3U242bjEyY1gxQkIrZzhaUUFmQkorN3Exb3Y0VHh1RjdnNm9nSGNOWHlU?=
 =?utf-8?B?M04vcitpMTNteTNGbUpSWWNzMTJMM1RCSDVJNml2RFBnZElFK0xnY2dQbmhy?=
 =?utf-8?B?Uy9Cc3VSUUpDVnlOalJDczB4ZzdSVkdnclZ5VjBQVmR0d1FDZjBjRkI4Tko3?=
 =?utf-8?B?dmVYeFNsbEt3OVdoZ3BQdzVDU0VZUnFLcUozOG1zMzNCeHI3VUgxOFJlWnVW?=
 =?utf-8?B?c2pSTnFBWVozKzI4cXVsV215ZGNIMGduWlk4NlNXSTRrekNPYWlQS2JjUWxB?=
 =?utf-8?B?Y2dKOHk1aUovZHpZcjhPUUtWbk9iVzNObS9NdGFrVzZVSlV1MkUxQnk3Vjlv?=
 =?utf-8?B?ak5ZWmtPVXJvdjJ5VGZoVCt4OU84NjN2KzV1N2JNcC9ocXhOK1JTWUZxbkNs?=
 =?utf-8?B?eUxNM0kvKysrT2gvcHdLY0Z0b2tBV013djA2bFFsVEVzS01zZkw1QmVscDBF?=
 =?utf-8?B?OGdLd29iT1FHVmhVT0pkbGQrbnNSaDEvbXE5dkxWVmRlcHNEUUNRNUJmZDV1?=
 =?utf-8?B?U2pmbzJLWEFIb1poZ2FvWU12eUNYUWhJUTIrV3hGVGl2cXFRMDZBYldFZm5q?=
 =?utf-8?B?bFBpSXJ2MU4vTVF2VzB6UFJsTWl1akNxMkNrRDVhcGR6T3ZFbUxHV1ZlSlps?=
 =?utf-8?B?TXFoU01URmIwM1Q2SjE4WFdmVnI1SXA4RXM5TmNQd29EaWlNS3pMbVUxaFVR?=
 =?utf-8?B?bUxKMmVtd1grVWZNNWRZNERDVWNUcVYwVzI3NzV5UTNWblFFR3ZoZzJoRWQ2?=
 =?utf-8?B?WkdKMmtNRnAzZm8vOVJmSitzci9EUkxQSmxMVnZDYWp3LzBYNnJxYnB0cGd0?=
 =?utf-8?B?emhRTlU0WjE2Q1A1d2U4SytmOEdHUEdHeVVmL21DSlBBcUdRMTl1SE9mREJD?=
 =?utf-8?B?cVIzeTNTZlBrVjBCWVFEbk9yRFlGdExValFvaERKbWVGN1ZCc2hKOHc0T3NQ?=
 =?utf-8?B?ZmtZNHd3a2FvZHVCR3d5cWwyb2ZMdTk2NkdXazY3OFNDV3ZGTU1oaTNqWmhr?=
 =?utf-8?B?SmY4RnRGSFc3YnNYcWR6NFNjUlZpOElsNjBTS0dySXloOHNEWkg4RVAyR1hu?=
 =?utf-8?B?blhiMDl5RlUyVkdVZXAzdWFGTDhEdmpnc2tGcFJMWDJjaSs3YWlvN3RxQmpS?=
 =?utf-8?B?NTVXLzZPL0V4blpTeUU5TkIyNHVLMkE5bFBrcVp0OWN6M2pPeitQSXI3ektS?=
 =?utf-8?B?ZVdLVElPZ2FRT0FDQUFKdjYwM2dPYjVTZDNwODBWbm1CeXdkNGU5Vm5YRXdh?=
 =?utf-8?B?M0ZiYnFSMlljWnorM2lJWlFwd05UZ3VJSjBmdkZsTUpob3hLRFNtVjY5U1Jq?=
 =?utf-8?B?Z1I3MFdtM3FUS29KcXNOQzE4eVVKVGZQZ241NXFuWmludVlzaWdKRkY1alRn?=
 =?utf-8?B?aFowejZEUGZZNTF4SE1hZlBDNnZYTXYyM2lvUnFTdGhPS2p2b2hIYUVDOGN5?=
 =?utf-8?B?QnkweDJjeG5UNmpsUnZqVldyK2Q0RWhDaWFsVU1jVnIwVlhpMmtzUTR0ZDA3?=
 =?utf-8?B?Ym9ENGJFR29kd2t4SWRSbnNFUk9jYjNJZVdGNWp5OTNRWEx5S2hoNTBoWi9s?=
 =?utf-8?B?WXNPWDFxaHBmRmZ2UnNHd1NEV3o0NHY2aXVXR3pzVFZwMUJKajZhRkFCYlJP?=
 =?utf-8?B?dklPRHUrWmtkWjhHMHFxOE5mTmJDendVWXFpWkZFQ0UzMTIwMms0Nzg4dld1?=
 =?utf-8?B?NlBLUGt4ZDJ0NE0zZGhIQ2NwbzNuVEllZXRIS3lqMkZzOUpHNk9sZTl4eW5m?=
 =?utf-8?B?OHh0YlY1VnFWaTlYdmp4VGJTcUtDOS9raE1FTStNY2JKTnlWQ0tHaUFva3E0?=
 =?utf-8?B?WGVvL2tyQkZzUHc5TkFrUEhjK1pSbVoyTi9GcDF3QW9XZS9GcEhIUTdUOHF0?=
 =?utf-8?B?RXY1c1R4ZStWRWNjYytYZmxJdDlQaVZDMW14eUliODhQV1UxOTYyVHR3U0gz?=
 =?utf-8?B?Qzl2aTY5aTdOZDB5bW1IZ1JGYkZDZkZXOUJTZ01jeDNlRkVWWDRrandHUWlp?=
 =?utf-8?B?L09ZYlQxbXpTaFhjQ3dTV1R6TDgyRGZEWWNMV3dUc1poVFcyRmxCbTMwZ1Fj?=
 =?utf-8?Q?lDuEyRIvT/B+W1+vfRZScLvyg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11a9028-d14a-41d4-c253-08db97d57e15
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 06:05:40.3690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUKTJW/TLm6XFjI+nB4tcr9dps39yDgUQ+siT7ZyzOmvr+hYMJickeF06EmRKgK/uR6QavpvNGpIk2ACvsYVIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8303

On 07.08.2023 18:26, Alejandro Vallejo wrote:
> On Mon, Jul 31, 2023 at 05:15:19PM +0200, Jan Beulich wrote:
>> Especially since the names of the helper functions are longish,
>> I'm afraid I'm not fully convinced of the transformation.
> In what sense? If it's just naming style I'm happy to consider other names,
> but taking compression logic out of non-pdx code is essential to removing
> compiling it out.

I understand that, but my dislike for long names of functions doing
basic transformations remains. I'm afraid I have no good alternative
suggestion, though, and while it's been a long time, this may also
have been one reason why I didn't go with helpers back at the time.

Plus of course I remain unconvinced that compiling out really is the
better option compared to patching out, as was done by my series.

Jan

