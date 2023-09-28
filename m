Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9B7B1764
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 11:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609406.948485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnNl-0008GL-Sr; Thu, 28 Sep 2023 09:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609406.948485; Thu, 28 Sep 2023 09:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnNl-0008D1-Q0; Thu, 28 Sep 2023 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 609406;
 Thu, 28 Sep 2023 09:32:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlnNl-0008Cv-1i
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 09:32:29 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe16::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efbc1109-5de1-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 11:32:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9277.eurprd04.prod.outlook.com (2603:10a6:102:2b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:32:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 09:32:24 +0000
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
X-Inumbo-ID: efbc1109-5de1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duM5Qym1gqXbhM3Rkx8B3fLFvNV0lD5xjVuOzAvo9QgYo8g7bjCVShXxcodkSyUP7/Vs8fqd8ZKbDEoFCAt2mDSOhqla+UZkcZLgqDIOGE+dSkb0Cnwx0MDKg7YZP2ngprQEOoXcEFK8/SFIEVBfZO/N5Aybk2p30q8dV/3NC5cd6z6/l+ZLn+iwnyqLL0VaRq5cZvNccLt4HBxPM22OCOui+8qzZ7AJDJiaelogTbEGTQQizFFKs7USFkHCJF4DWzgf4Zfwj2ESHjp/OEIh9nw/HN42oTuCKGpk+d7cNAHXYXX70rhxug/Y3nvvAykSadQbMxihh248Jf6ck3+I/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NFRCU9QRcYEtzo4mdkDhqekqVC3/HznqijbN/lqlhw=;
 b=WIveFWMuTAhRRgn2RR/1gvDeY5vtOGI4OMbdw+/VqtTsnSp0cyk7Gmih4yk5UPsvmMDxT2HRk6ZYfSmHhai5+kNwRG+lGxjsxGR1QZbqDTcz+ixTXgG4zlkDrWoRN2PnVzbybskqyTJEioASHjT36RZ52rsStWI+BsQ8TqgR9joYzUzqJuV+MKnBSkGYgFoTx0Nh6TtlvxfPNakLQPhqsdkNgxWA/Zz+eptCRggTAHPVef30W3+CDtoiWWKcYmY64i27Nah+aQ8s7weh6mjWiWdsUjqgA6VYlUtO2+HevBpDC+gQmopif0woy2p/li9frMjn/z8jQJ5Af+tzjfrfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NFRCU9QRcYEtzo4mdkDhqekqVC3/HznqijbN/lqlhw=;
 b=rVdw6mf2ntnX/OSyXNoWRvqE0wjSmIbZx6KSdeY/nCvW+0W8UMiNHfE6QTJO+ZaDsti509CUqjv6Q+mLvU1NYxGG4Q8H9QgzmEyP4FexP3iAcRhcv6q0tynk+WHylGpsS3HS6rdUOv/hHe5fpvTiKywNr0V1UXtQVdyBt2cI7qFBFukVl2GkUNZpr6yUVJd0KHDEWQHtTkcbu+M8lCezc7dU6455kfYWAwByGw4kdftbju2K/AO+159qKzFV+BsXEJ8pJAhoWctkGYJZN31NKye/Ya69xWLRmLgsYrNzj2k3HokRH1VZrRVCraZpJ8osILsye/f6eFEyv4Fd9uhYig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1cc81b4-d990-b995-a24a-ba80c1e970ba@suse.com>
Date: Thu, 28 Sep 2023 11:32:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] SUPPORT: downgrade Physical CPU Hotplug to
 Experimental
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, julien@xen.org, bertrand.marquis@arm.com,
 wl@xen.org, Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230927232004.1981595-1-sstabellini@kernel.org>
 <ZRU6A2wDSVEEHGbK@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRU6A2wDSVEEHGbK@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 875e6f54-1b03-4a79-b22c-08dbc005d2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IMlF02ildPJRUtULw6B1hCFNvsJJF9PY3j8g0u4LtTe92NGOL8i6CC+0+AQ60A77x75zuBzOWxGU7HVbGS1VDid8xw6w/yIkSCeanv4lp807MGkpsNFmNd0Y941ZnvqBGGXqo00cnLL6qTEDEWFHgIAvQP4H7rwsLQel7WID9uPsOEGTLOS4soL7LE6OEEJf322cKvne7EJLna8+I06OEXEFuagv005sQiN+OgWYpa4M9+QfFF/RC44czWGLXCYWoLsIe8OVcUc6Rdi62FLIBAVeuyee0DRMSY0azfVhfpYXGR/U4tt5Yi2M+WR1ajZMqFR2/FBiXUjoYMcfZFeT2CGPwccx4Jm+rxhr7ptobUIcHUx8zgws6wjqOnHTZW3tibmHrD2Dg/FQyc86cSsJGm2Tlb7DhxVXKf4ztUUOk5aJJeBmmvkhEZZaXe8hQdbLCcwBSUXga5N+w0yrKilPdefxxdZJqmHWboHCqi5Tdet5Ad9Q9sfkpu3Gy4Mp8NwW1xoXMGnr0KZE+AITcEMt1uMKswUmh0YajTeIczITK9JX6QqqCw3C2n+k2pG043eRi3fXjjv8gjNzF+3lWFyxVEPRPtIHGTEm8qGqF5jta+a6ex1c6BL8o5SAtm+vIGRES2hTmVojIIWB0FnXrNnd5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(4326008)(5660300002)(8676002)(6512007)(8936002)(36756003)(6506007)(2616005)(53546011)(66476007)(26005)(86362001)(41300700001)(66556008)(478600001)(4744005)(66946007)(31696002)(2906002)(110136005)(316002)(6486002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mmk4MUpuc2l0SEdyb0gvVyt5NmZYOUhOdHR0cWRKYkx4YkwzdTJ1UEF2SFhn?=
 =?utf-8?B?aStqQVBXQnQyVnJQejI2QVZEQ2h0TG1tWlgrM1Y2S1VES3JJcGlxbFdIeFVs?=
 =?utf-8?B?THJLRHVWb2xGSEpsTS9sUnFCVlBJWkQzQWVZTXJCYXA0SjRRTnh3ODFZU3Zk?=
 =?utf-8?B?enVSM05nVnJoaHZEb0Y0aGREeU1FMEdSUE1GRmNVYWY2VWl0cmpaT1lHY2Rn?=
 =?utf-8?B?WVBIc251YWl0L1BwVDBDcUwweDRhVXkwdUpzOTVaZ0tES0UyMmZMZlNLSU05?=
 =?utf-8?B?bjNLMTN0cGxkYVE0clZjdDZOQ1ZLUGNDbzlqMUQwcitGdXZ3TVJKa3BxalM4?=
 =?utf-8?B?ZFJjZG45UjdFWUl0YlRDdzBpTmloYWtlYkJsVjN6OXV0dCtmRm42b1JPWGFD?=
 =?utf-8?B?TVZnWDJLTGljT1ladERuQXVNa2cvd0hjV1RZLzBQNEN6bVFFVkdtbDhTSVFu?=
 =?utf-8?B?RHVjOWFxb3E0LzlLUFNvYktMZ3B6QjJGdG13UEU2UVNiT2tOQXh0eGtJQ09s?=
 =?utf-8?B?ZS9jYnZHM3lTYzl4SDJGdnZSNGY2STltMEk5WGoycWw0dnJTeWx0cnFkZEM3?=
 =?utf-8?B?dVVBcUN5STY0TmltaERKUDJjZW9VU1dwVWZNMkh0YTFPdFFkYnh1cURHK3k2?=
 =?utf-8?B?S0I1NGVOSmxrVzRYRnZPM01FZVpjOExCRmFWYVBQclRHYndDVWFiR3FhNnU3?=
 =?utf-8?B?U2wzOEdKMi9EYzgzVEdMUVFFcWVYY2NwZFViWDAycVJVc0Vwc0dvS3JmUzBM?=
 =?utf-8?B?bHAwYnViOFhiZENaOFBXRXZBRHZ3V1ZENWFDNHlvLzBPT1hKaEFDbWhTckxU?=
 =?utf-8?B?QWgrN2U4aFc3YVMrdzN1YnZqTi9rcS9IWHo4M1lrZmk0YVdYTHY1MXhaTWkv?=
 =?utf-8?B?d2dhN2ErZXVOUU1QV3pMbGxraHk0T1lNSTVoVGhWWklYNjZpYnhpT2F0cmdj?=
 =?utf-8?B?SzNqYmdSL1l1Ym1NT0hNZ2ZKaStpUlM0alJCZTBZMi9iQXV4dDdqTk8rVnk2?=
 =?utf-8?B?RG5lSENWVFpSWFVEUTBWcmc0L3JBT2FNUE95UjZUZXlxcmRqbm9kdFdqK1ZW?=
 =?utf-8?B?TXY3clQ4OVhDR08ybmxZM1lNTEFBRlhRUE9Bemp2ckV2N1MzZkV1RDQyTUVJ?=
 =?utf-8?B?YjF4aHRrY2VrS0RkRlpvbThmaEN4NXZOeGlXeUxETHNJNy9GTlZwU1JnQ01D?=
 =?utf-8?B?dGpWa2IrNDhMODJWODByc2FaSDNJVU14a1FibmtEb2lhNWppbnp0Ym1MUDgr?=
 =?utf-8?B?V0FVeW5aYUlhWlVmMXV3SE9qU1ZwUy9peG5CcGR6Und5ZytSbmYwS1hFanV2?=
 =?utf-8?B?SzIzdGdLWnlLaFVZN0UyclFWZXhIM0RBNkFmM2t5UHYycjVJZytsWlRVZEYw?=
 =?utf-8?B?U2ZLb2R4T0JGMFFseHJYR2hrcUpVYjI4L0I4R3EvZzlTckZ5TDBMaVdpWGd5?=
 =?utf-8?B?OVc3TTQwMU9lRkxFU2VFZ3dzRER5U01LWE93UzB0OHVaT2NKZjRyaDRybTJV?=
 =?utf-8?B?UWJrMW5MTmV6U0RVRG82TVoxaEZIVHBDUjF1b3RrN2RhUURlTEphb1NDaFgv?=
 =?utf-8?B?NEdOMUR2cFE2MXFLM1Z6M0xsbnBSczJiMVZLSS8rdndDY1Y2Y3l2MzZLdzNX?=
 =?utf-8?B?YUVUbExqSHhpU3l3TGEwTFVML1RKY0llVTFVMkk5YjAxMWxpMUxUaUYxa0dj?=
 =?utf-8?B?M1VqcFgzV1BxTzZWeEIvbGxRalYvSk5ubFQxeitQbkNaN3ZrQldYbktiaVM0?=
 =?utf-8?B?dGtPaUZjQkRsdGNPdTlVTVp3TnE2R1JiV3FLNFJoNWtFMEY2SzhkYk95a1VD?=
 =?utf-8?B?aGo4UFZwRWlWQVBlRG1ma3JvNE9mWUdFaE5oME9KMkNQVkZiSTNSZzFPSFZv?=
 =?utf-8?B?RDl3bUtuSmU3cmFNOFBlbHZEYWN0MXRUdWsvMlBIQitmV2U5MUZ0YTFTdG5H?=
 =?utf-8?B?SmZ4QnJnRG56dy9nem90R2dqemFTS2hIYU9Ob3paVG1ZS3dRVEZEcGJLK0pa?=
 =?utf-8?B?RGcyVmlsQ1dldDgrVmN5TjlxMHNZOUdpNW5Yc1V6MklZRU51NFRWTmR1Nkhx?=
 =?utf-8?B?azAwbk1YMk9yTlFJNkMxQlpSQWxGTlZERVhGbTFmVEd6WFFZT1JXUTFUQVVX?=
 =?utf-8?Q?EycFp2X/vMZVJ3MBJ26PmhAGR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875e6f54-1b03-4a79-b22c-08dbc005d2b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:32:24.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFQuPHmiTA0HtUJOYdE2dEQ7Ak9bp2a5hwZ89PiHZSkA+3db3s+UcQENhx1NQDrnIBznrOpm/zNjqsQbxsqfwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9277

On 28.09.2023 10:32, Roger Pau Monné wrote:
> On Wed, Sep 27, 2023 at 04:20:04PM -0700, Stefano Stabellini wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> The feature is not commonly used, and we don't have hardware to test it,
>> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
>> members. We could use QEMU to test it, but even that it is known not to
>> work.
> 
> I think this last sentence is ambiguous.  QEMU ACPI CPU hotplug
> implementation does work AFAIK, it's Xen implementation of ACPI
> hotplug that explodes (or so I've been told).  I would drop or reword
> the "but even that it is known not to work." part of the sentence.

Maybe simply add "... on our end"?

Jan

