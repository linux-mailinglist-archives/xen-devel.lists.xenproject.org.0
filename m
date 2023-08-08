Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0DA773A9C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 16:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579982.908218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNJW-0002Dl-QS; Tue, 08 Aug 2023 14:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579982.908218; Tue, 08 Aug 2023 14:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNJW-0002AT-NB; Tue, 08 Aug 2023 14:03:58 +0000
Received: by outflank-mailman (input) for mailman id 579982;
 Tue, 08 Aug 2023 14:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTNJU-0002A5-Tc
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 14:03:56 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe12::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68f66e5a-35f4-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 16:03:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8945.eurprd04.prod.outlook.com (2603:10a6:20b:42c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Tue, 8 Aug
 2023 14:03:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 14:03:52 +0000
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
X-Inumbo-ID: 68f66e5a-35f4-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/MhJs5AV1Phb3NblQxVs8PMDu0IGIf5Hg/Pao7yAEPd7TCV9AQPSE31+Vuegf51HoXoplwcRwm4Y2iwZOQSqtOXNkp3nLochtzDoXcuzkhEg8i9XmTAwgaSqmzBAwhv3pTvi4xg5+ku8SVkQnKJfa3GLHJJRQwc35B9edWvbA/gN1RwOICi+npeIvZv+i7IOFJ22x6hkCgerRL/5wxg9K+ELqF2jNzEqGOtCbnMQK194JH+2rI7PxKrMk8Vu9Gt5fEpryOtIDvEUIoow4pt9zKf2Gau2EJiYPZ2ucUrA2CM0q4HVlPun9HRJ2yau1kIEvr/VhW/yP4qDXQ6iFcziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJeY52rlTThTYy2nDcE8cZ/gX+XfB/fqbt0cVJxWawU=;
 b=RgflQ1Sl0iV08TtgD3Ang5koUM4Ku7knuQfyL1cCzHSa8c+z9PObQDhWf4205pyWifZ5ExLHuAu0OtuG+PXxsv8rRnEdNIq0XE8YocnumWwtrSy6ypuxMucQIGVtDnf4GhCR36zg/iS4SAMv854kSMMgqLYMAWSHNMWBpfgQlhe04QuPouwDz6MVaEm+jTbcxJbzuQb73LaUzuf7ntY8A/CxiFrFPT290Tx2Gc4WMZMeE1BcmYLLkKuMt+P5ToW3jKhhmeefPnMbPkRje5yi5u4LhDTYv6fwHK85VeUm2ct3cPheYTCE3gl5iAt/8+71hoOf7z2RNiYl+vnOs1yx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJeY52rlTThTYy2nDcE8cZ/gX+XfB/fqbt0cVJxWawU=;
 b=Ks9BWLY1YJR3nkE66/TA7Hrs/lDY3fES9sGmlsES3zQnHqhp1cgXwW2/yzHJ16WpzbBBO3KNgidfUvwaG9GYJHeFRILmiAtl7HwzXLXV0rYrzOzCm7fy2it4gi84/VQvTeblPixcbHt+xDw4xFk2ex3Q9h9iySZh6l584UAS5q6+xINqE0WIv+dlgyjGpRFyA6IRF5w+F40MJ/4CM9abJrHj5zkxeUCU4i6q7q82yTUUJUjXVjywZV5mMC1tWinnsjhnF7/N5jaZaPEKUHNQrYrhHJ0nP/PZsrWbwh6qKop41mFwNDHbcDEIfQ1AntHbOK4k0ZIKVVeHiHtdm4rdkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30c4b7b4-6043-8ac2-67d5-000fd1a81266@suse.com>
Date: Tue, 8 Aug 2023 16:03:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 4/5] x86/xstate: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <927d771a3c38b8a3c47913aea21cf8890fd4e6ef.1691492441.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <927d771a3c38b8a3c47913aea21cf8890fd4e6ef.1691492441.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: b8bd7c30-63b4-4d75-1985-08db98184c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JkT1QZX/Qv9OwGc2p4c2ntxvK8V1+qyptPJKvZkf5sNwf83nA4JL7dzfB0djfqgRXrFEezTACYpHTrAT4ldjvmah7lgPlaw4IIkJ3TtnRsXqDHdn4YIMefo+E+dDYQBqxM74eABe+D1nvfpkAUZwcaL0zX4Dr4Xy/e7eS1QaeMYrX7QwCTLejFd+nWtUac3Rbcfj3a/mzXS2MX7A38ud+sipaDMnBZzH9n2txhnDpxdyQC6wdxAw5smfGyrANmjXf94luxlk2Hopcr/+GNjwt8FYKX0Bm3hMOUiNefVQuNmR9ybp6tCN8qPUOZjO3p6wTp9Vgf1cXnA9eQiOU40ITuWY+WMXdsNHBDNIPDTCpCxK+bmcSXkByGI9YrPDDnfJMUokYPirvL761DB6jJc/baAmzkvaKFokxcVPG2H46UjUEUesjrlrUphRek7tI/+U1gUBNRtkkXoNDY+RriGQOa3HPwVSzmhfAY4a9PzGf89mKfOeLoHs8hTN7GzVtHFhR+/o8NmN5GPC5SLQRwoYyzBGN5Hqj0fVGbCAIN8zRM27pIBlbPhOxj8rY2PWdA0jeO9z4Pzhxf5ocGfGabTcZ1Ejv0xKZIXNyAcUlIOtD2cpNH4EnIkKUAQzwzZT2m1mnc3sq0J9rSRPKzbj3V/5ZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(1800799003)(186006)(41300700001)(38100700002)(6486002)(6506007)(53546011)(26005)(2616005)(6512007)(4744005)(316002)(54906003)(2906002)(86362001)(31696002)(6916009)(66946007)(66556008)(36756003)(4326008)(66476007)(8936002)(31686004)(478600001)(8676002)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG14d1hoT3k1OFBndFJXMG5JdzZDWEtMbmdhT3I4KzduSnA3Rk1MQllDZWor?=
 =?utf-8?B?SlZiNmdKaG9sYWZxaHF5R2dmc3lxcW9oN05JV3I1enFoVGJCRVVwWTdVQ1Jj?=
 =?utf-8?B?Y0RibTRJV3BmN3MyOU0vUGFER09ldU9XMkQvNldPSnM0Wis1Lzh2WkhXQkd0?=
 =?utf-8?B?Vnl1Q3JUMlhtYkc1VTk2UGhUQy9jblc1YVFtdGVBQktCUjZpd3d3OXE4bnZL?=
 =?utf-8?B?YmE0WGxFWnkxV3ZZSWZ0Y2hUcWY2OXRSME9BK0sxdFlNV1MzNGtLbWZhYTB0?=
 =?utf-8?B?UVVwWkVoNDhseWhjSnM1NWdNU24wcXZia1d3NTMvSW5Oc2Q1cHpXalNwRFRX?=
 =?utf-8?B?MlhuNWNYK2NrV2RPcDZ5MFJ2NU5teUJCUCtwTVF0K2NYNlJveTE3VXlNZVlN?=
 =?utf-8?B?bUNmSDhDZmhTSHFoSW13d1hYNGh5T2pFTCthOU52YUViUlpENEVxUngxc1hS?=
 =?utf-8?B?VEFSMHcvbk02S29XU3MvK3dyYnpkY1BsNHB1OXR6THpGTUt5aE5yb2szUnZ1?=
 =?utf-8?B?L1d1R09MTlJoYm9MRmFmS2M2WHhQaGVqUm1wTTJJREpDTVZha1VZcFgxdEF1?=
 =?utf-8?B?Q2RzWGRpTVVtOStJMEoyVGl2ZndSV0VTYzR6M2RwSjlpY2JCNnVvaXJrbkVI?=
 =?utf-8?B?Tnduckd1dDdTM3U3TzgrV0JJeVF3Q3RLdm5KYkVEdUsrek5kWk9DUGY0RXhw?=
 =?utf-8?B?YjhtckE3N3R5cWdVcmd3RkYxRXJrSDUwdCs3QVZ0OHZDM2R3UjFKRGpMUWky?=
 =?utf-8?B?ZUp3ZFEvY3U2WGJKZ1ZyUkZqRkdlTW5aRVJZSjJmc2RITDJhR2xCd0lxbWdV?=
 =?utf-8?B?TnZqUS9IQUExeU1zcHlNaEVGRWtpRTN1LzV5bDNvY0N6R0pJU3VvMlU1Y3Vm?=
 =?utf-8?B?aGVxTldSZWE0NUVKU25zNDh5NFdYeXVHVzcxZm5PcGxTd2FCVzIyYWU0TVUz?=
 =?utf-8?B?NTE4M2ZaSzI4YTUyM25ZQjdmaE5VZ1VmUzVzR0JyS3psRFBUcFJ6bkNyRGlM?=
 =?utf-8?B?WFR1d2lhRmVlamJFYlc0NloyeVZXWkt4VXVENStadjhqQ3cwQlA3eGwzVUVq?=
 =?utf-8?B?SHM4RFZWQWZWNUJPeW5Ka0tKMzBrT1dsL2lndEwzUXA1NkpoSXNuUFIzWEJk?=
 =?utf-8?B?RTZuV3E1RDVBSFNJcXBBc1doQVRnQkhKZU1EZWFDWmN5TXR2ZzgxaWtIdVN3?=
 =?utf-8?B?UTFTVFZmU0RVci83Qk9VSlFaazNRZkJLOG1XNWQ2aHpQdzdCVFBBT0owT3B2?=
 =?utf-8?B?eG1MVGl1WGdCbzZlM3AzY0NPazhZV3crY1NiSHJ6dTZQWkhPc1F6TG93cEVX?=
 =?utf-8?B?a1N0aHh1VWVHK0NDZlRzQ0lOMEZ3UDhud3NXekI1RnZDbUFuTC9sZGlXRHE2?=
 =?utf-8?B?aytMV1hyaHdtbm9kTnU2Q0JyemFWWUxUZWxPWlNYT2l5UVFrYitDN2lROHVQ?=
 =?utf-8?B?TlhOQURqM09VZ3I1YmR0cVlLMnJ2MWxteTJwUURJOERMNENHd2s2T1hXcmh0?=
 =?utf-8?B?M3dySmNyRDlHaHpOOFdYREw0WUVOZjViaHgwOVR4dkZsMCt4UzBpbGtMY2Ry?=
 =?utf-8?B?MnF2amkyQyswRWY4VFJudURoRG1qNVVhMHFYMWNrU0NsVlA1WVlvd3VaV2V0?=
 =?utf-8?B?OFFDd2VWckUzc1lIVUxlMFd6L3JUQkgxRUp3aWVZeGpGNGpJNVNxWjUxUXhB?=
 =?utf-8?B?S1I4VVZiZlQxakJOSFpRSWo0Qmt5bzMydDk0RTdqTmpRUVhoWEYrMFdWai8r?=
 =?utf-8?B?REZjVm5MRElrN2tlM3EyNmNOYkNsdTVMOVE3VnVxMm5zcXZOY0xoT3hwVVds?=
 =?utf-8?B?ek5PbEVHVE9ZK2JJQjFYOFY2MU1MY0hFMWRnNUdlUGEzb2IzZS8yZWJzNDBJ?=
 =?utf-8?B?RExXbkpPNElWRVpmc2ZyczllQW9GbmFpTGRxZFdlS0x1d3VEcWdmV0dCZDNX?=
 =?utf-8?B?T01NMlY0VDQ3YTBIOGVYT3JXd1psNjEyWUpJV3BmT1hvbksvY3JoTERXTllT?=
 =?utf-8?B?TzJuVXRzSE1Ydk9lYlJoN3NFWUJIc09oVDE4aFZTcW1jc1pNY1UvcmhLYVdB?=
 =?utf-8?B?TDFNWGkzY3J3Zm95bTFXdU1jaGxUbVkrV3J3UE9POG5VTGgxTDdiMVR5TXNq?=
 =?utf-8?Q?aGk7/Odf45GZXM7vrHaoOW88G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bd7c30-63b4-4d75-1985-08db98184c23
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 14:03:52.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00Qu44L1u5mrfHR592AILj4XYYN/aa77JWXFGtY5VQsvjic6iUc1s4bN6e0Tbs1g23PpVxUthiuLPkNIwynz1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8945

On 08.08.2023 13:08, Nicola Vetrini wrote:
> Rename the local variables s/xsave/xstate/ to avoid clashing
> with function 'xsave' defined in 'xen/arch/x86/include/asm/xstate.h'.

s/defined/declared/ (in some areas of Misra the distinction looks to
be quite relevant, so being precise everywhere is helpful even if only
to not leave uncertainty)

> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



