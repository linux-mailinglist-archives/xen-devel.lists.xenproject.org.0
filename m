Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F775747F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 08:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564951.882752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLeOj-0002z2-Lh; Tue, 18 Jul 2023 06:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564951.882752; Tue, 18 Jul 2023 06:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLeOj-0002w9-He; Tue, 18 Jul 2023 06:41:25 +0000
Received: by outflank-mailman (input) for mailman id 564951;
 Tue, 18 Jul 2023 06:41:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLeOh-0002w3-JA
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 06:41:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bc99047-2536-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 08:41:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7626.eurprd04.prod.outlook.com (2603:10a6:10:201::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 06:41:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 06:41:19 +0000
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
X-Inumbo-ID: 1bc99047-2536-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8acpD8sfyKEZLZNqLjfn0U32cYq12cmEUvGS8w27c5k5tRcopLcPUHHukS6GcWzUmCqU9Li0MrsZ9fzfRVAepEQwkrq6PUnlHvwQY6KURqvO3lgS9T4ScFrsmHc6neBvom1vuANrzuNEaCMWP+gjYzSDw9HhfaunbrB4Blh5ndZmhvCe6op8QWeJzY7P5Tkxgk2LpyMUrOXKb4z63cqtVziKzRkvDwpyXDGVklJ6JiKVYhLwRRp4o0rEdnWiev+QrM7NxXaV/TJcaW6zWpgZpioEX1EIAP/se92sD+VT+vOyskQP9s83vKsLdw04YbwBarZe3hL1JvJ7ndSlHjmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rA7UTSu9LQtNU+NdEy7mQ8uuODWbKRlS/Zmmie54Nes=;
 b=FTkDpAJEGMJmICUzoCV9nnD360OR5+uZM3ApYNYRAUnkD85g1b1c0KNfX2V/5SmVeo9G4teEGd1pEhcDS8Bboo30EQwtTCnTyEU3d95Qd7X4Riu6VxcIjadrrPkM+ZSYzu2IsaY/43jmOYU0zjmzmXj4DaArQtJ+1D03ejMwgsr18jr2anZEPUQ7hhsxFLSw5OgJxOoPPcFXrhr8vIEEYhLEm/uEjoSy1aW3mXSwpF2GkGcbgVZd9TrFuAUQXuh/CEUC0UfSGP2EtAg4PgwbZ7amz8tDz7zDhdDKuiyUIcoHY2JSBmyomeBxFI2iYJW19HpVfxKsLKNJOEdMUKNsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rA7UTSu9LQtNU+NdEy7mQ8uuODWbKRlS/Zmmie54Nes=;
 b=nKT3Y2HRu4ncbx40eIE0pkZz+XCbfDfZQ9In3pnvoXWF2cNfr9aWCcmeLJK409iyhWEp377moUt8eHI8uQaTbnDX78OYEhYOkVccmH2m0LZ1UMArgT9qFqXW1X3CC4yoT53bJR2g5UGb8QyvhWonKJrTfdcrvw9xdBuyRduqXXof+UspwwLbq4UTSXoWppOMQk3uyQtDtaKRBlv+lMl/bjD1xyg7h8RxzMYuQJe8sYZW8zt1xUOhnkOrDNu6ezKuXsbMJ+LhDZsFq2KvkZQk/6u5F/lzi2zg/DfSZanvvvRIkt0gPj+U4TAggL/6IaeywZTXENEyK3YuFU88q4kexg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ae9fe4b-d36d-4dbe-bc1a-ac5d78513690@suse.com>
Date: Tue, 18 Jul 2023 08:41:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
 <85172d385a730e196999b366207e2b2e8a261906.1688670018.git.sanastasio@raptorengineering.com>
 <aa58706f-5033-ef33-5202-bcc418bedb86@suse.com>
 <2fa2837d-37f4-aa28-6ca8-2e28b6f44181@raptorengineering.com>
 <7e01fe7f-59ee-1fb3-fb9f-8013491b72a3@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7e01fe7f-59ee-1fb3-fb9f-8013491b72a3@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 908b2365-8043-4f43-c8c0-08db8759feba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TZdRiiac3pequujdkbACuSxUDPHWkT3rU0n+jGGbS9qH+4EFU6u0mSCT2yRaxeQOVrjz+KR3kSTp0w4sbbv20psSdciREhGkdRzlm+OsCRCll+y8u14Oy7EPRbHOXPop9KcLJeOStSvOhaJZdENd/p4kjq5eh91k9s3BjuTWnkCPs5gNq49Err7WzL79Kbg/AP2DvOY4mIkEKdproxc1r0GhR2eftHClLWrtKaJ0kBsFZRhkt4V6SrNozqRtggymGASzLGAHcFAr9GYX5fJzNTwzC3rrUx/S7HzZ46LfnaeW8wmiu8fKzQebqah5SQGmyP9/5XeZALlaIA+s7LCXBvVq6cTr63yoaxDgldB5WBnBlPgDFnvJOWpOBy1YmwSMm7sVyTkwveBHYGkaMjBc1BCsoJTWRJ1ZLRq0hhZGJSh04NezsB3yVF/87OQBi+4s9Aq1qHRreJozl/zxqr7JbOj525vK0C4NrKAFv8tx9Y9VTo7uSUZeQDTBOOkYs60U6S5WLr9QErtg8NWke1disJKc362hgp+uxOqCncp1J0MiooNEPek53ZDE1BN6KcHFXPsQDUHnPW5VV7HTy7etuPXETlRUCGSt9Z5kGyb8TAsknWKlPZp2e8LRgY7ttcex
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(478600001)(5660300002)(66556008)(66946007)(66476007)(54906003)(4326008)(316002)(6916009)(8936002)(2906002)(8676002)(41300700001)(31686004)(66899021)(6512007)(966005)(26005)(53546011)(6486002)(6506007)(38100700002)(186003)(2616005)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEN4NlYvd2FiWTUzeHkyOWt5V2tRUzF5NlJxY0JUQ3lCMXJpK0JyUm1tdlNT?=
 =?utf-8?B?dTdwaXhydXVFd0hJMnhYekl3Mzc4S1d4Ymp2THFUWFZab2p0VlgwUFZrZFZz?=
 =?utf-8?B?NFBFcEJUVjBWbHo2KzltL2hBMlBoZWdCRlhzMVA3MWF6VGNQVnZyQngvbUJo?=
 =?utf-8?B?WnBRdktTKzVybkdKSFdYSWp2K0szYkxBNml6WTFreGVNSVNwZDdFaXpXT2xR?=
 =?utf-8?B?T09YNlZSNXRCTGJXVnRUa3JwMlcwSkpZak9Qc2RpbFIwTUFSandyVGt0Vitq?=
 =?utf-8?B?dVR2RFpJTG1aZnZiZlZNUC9OOHJYSmJZbmh4Q25HNVBQL3hPTldQbUJlWGEv?=
 =?utf-8?B?d2srOXZpbUkyZ25lMlVJUU1oRHlnZ2NUbDc5WkRjbkYyeDdLYVNHL0gvZkVN?=
 =?utf-8?B?dDljKzdRVkVUbjQ2NExGemtOeGpDdVhtaGkxZnF1a3JycW12WEN2R1QveEhw?=
 =?utf-8?B?dFRRS01wZ0FFR1JwUFFsRHlBWEhCVWE4RDBRanM3RWZJM1FVNUUzM3I2VTU2?=
 =?utf-8?B?NGU5S0ZrSjBIT3ZKWG1DZ2RLWjQ4TG9Ydm1YSkV4NVRadjNuVDRTKzdwRThr?=
 =?utf-8?B?N3grZzNpajd6NVZHVkV1ZThYb0ZITjBubHFQN2FaRlo2cjFGbm8wZms3R055?=
 =?utf-8?B?K2I3dVZjRzRWbkRYNGJzZnJMS1dWTDZ2T0NBRjJycjlmNHRlMnR0aEVoMGc1?=
 =?utf-8?B?N2d2TUNVSHU3YUsrNkh2eFEzNFE0Y1g5WkVVakVubmlDWnNnWS84enpKOC95?=
 =?utf-8?B?VnZIZ1Zjem5ONVJ5M3JtN2VEOUxrRGpZb0lUemlkWXk0Ukx6d2FXZ2svaHFP?=
 =?utf-8?B?Ym5lcjdwSzIxMVBsYWlnUVpzbnVWcGNUZlJJcU1URUtVVU5mYmhUdzV4eGI4?=
 =?utf-8?B?WUNDeEwwRU5qUi9yLytLd21peU9Gc2xUV1QzSDZGSGhyNnh5SHFMbHdhOHJw?=
 =?utf-8?B?K09aY3dmOWJNRGg3SXhRbXRRdjlwWXJiUzh6cWplNStoamhGMUVvYUZLY1k1?=
 =?utf-8?B?UnJueDU1cVc3QVVtKzluVWFDajI0TjdBNkI0Q2p6Y3o2ait3N3NZMkhQQ3Zu?=
 =?utf-8?B?WjVnK2t2aWdtSnhib3RmNEN2TUJrWVQxYlpVM215Q3g0MWFNcGJxQXpKY1Bn?=
 =?utf-8?B?bkhMZHRWV0twQTlZVlJmcmZhUEdYL2ptbE9BdXRNQjBhYXNWSzhqbldicFI4?=
 =?utf-8?B?cUNacXpEYXZsUThhWW9FTE1VWEJxeS82YklsZkdYM2dwdlhXMGh0T3dSUzgr?=
 =?utf-8?B?VGtjczdVZU5MenRvUHhtM3c0cm5Vckt6ODR4OGZFMWV0Ly9LMGN1ZFQyMWwv?=
 =?utf-8?B?RWg0MmZlVkNyK2tETnJYNWxONFRTNnpYQUkxVWRPcHVSUE1aaEoxb2Nxc2pj?=
 =?utf-8?B?LzJpSjZSRzhLWG81NVIxTEhpeDZDeHRBcU9sRGhjTzlZV0kvR2t3U2V2VnY2?=
 =?utf-8?B?dkQ1RTFDb21hKzRsam1oUGZiOEhDZnlaUjM0OHcrOCtvcGJiQ0ZGUk5MV0da?=
 =?utf-8?B?dHROQldFQUk3T2tnNlJUeVpxNEttcjJhbTNIY3dOQ0pJSWVqa25yWnhjWm54?=
 =?utf-8?B?bXh3dytpSjRFbVJUTlBGMUVmZFVHbDFjTzJINnF0RC83UXAxaHk0OEFWeUJ1?=
 =?utf-8?B?TXpPcmV4U1ZXQU53ZmhNZGUzWGFhQVR3UUEyeVhpWENFZGpQeUxQUlFTdG1t?=
 =?utf-8?B?SVd5MVlOWGhwZHFhM29ETnMyaXhTOTZPOVl0bGdlb1dJejVGeUMwdDg0bUlY?=
 =?utf-8?B?Kyszbi8wRkMxZkFuWGc0VEpTNE00RlRGcHZCdFkyeGt4czBacEplOUVOcmRD?=
 =?utf-8?B?VmJ1aG1ZNm9qRU1XNlFuN1dPNjZLdTE4Zk50R0RCMGVjTllHek96QURUb2Vo?=
 =?utf-8?B?alA0NlVRdXFwZEZtU2pvSUtjd3c2RkhUV1VueFBHNUxTUUpTZ2xwQkF2Wks1?=
 =?utf-8?B?NCsvekM3eHQ3MDNDOGNOUGhUZ1lnOWdkRTdabUNxTE5oTUNhcHZralk0Y3R2?=
 =?utf-8?B?WmZUQnpBSmJYVWdScFhOWGtmd1BoMXQ3UEU0MG95dUxtKytrbU1Qc3Q1dW1h?=
 =?utf-8?B?Z2p5SGpaa1Bwb01XRDZ0MkkyVmdlZmsrcExVWk5Nc2xUc0szZHBGUTNtOWkw?=
 =?utf-8?Q?uVH4gdAW0WTK4Y7ge0a3MsYbf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908b2365-8043-4f43-c8c0-08db8759feba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 06:41:19.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzNCaXmtMInjTxd986E7bZMPrv4PyPnIWJct2PFYwv9cAGRxHlnSnoDFGL7BrbbQpynQf9VRBSbN5grNv8KFxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7626

On 17.07.2023 20:40, Shawn Anastasio wrote:
> Quick followup,
> 
> On 7/17/23 1:32 PM, Shawn Anastasio wrote:
>> On 7/17/23 11:17 AM, Jan Beulich wrote:
>>> This could do with using ARRAY_SIZE(rets). Same again below.
>>
>> Sure, will do this.
> 
> ARRAY_SIZE is defined in <xen/lib.h> which can't yet be included due to
> missing headers. I could copy its definition into this file along with a
> TODO comment to fix it once the include works.
> 
> If I were to go down that route, I'd also probably not include the
> __must_be_array assertion and related machinery that the <xen/lib.h>
> version has, since it'd require a large portion of <xen/lib.h> to be
> copy/pasted.

You (like anyone else) could review (and then offer R-b) my "common:
move a few macros out of xen/lib.h" [1]. That's of course only a tiny
first step (covering little more that what I need in that series). You
(or I or anyone else) could then put a patch on top moving ARRAY_SIZE()
(and its prereqs) to the new header as well. Since the new header has
no other prereqs, it should be usable as is, without the need for any
arch headers, both here and similarly in the RISC-V work.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-07/msg00582.html

