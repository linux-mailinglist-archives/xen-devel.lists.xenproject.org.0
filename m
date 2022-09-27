Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B45EBBB1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 09:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412284.655531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od59i-0003FP-2h; Tue, 27 Sep 2022 07:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412284.655531; Tue, 27 Sep 2022 07:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od59h-0003CP-Vk; Tue, 27 Sep 2022 07:37:25 +0000
Received: by outflank-mailman (input) for mailman id 412284;
 Tue, 27 Sep 2022 07:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1od59f-0003CJ-Jn
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 07:37:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2044.outbound.protection.outlook.com [40.107.104.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37d5230b-3e37-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 09:37:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 07:37:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 07:37:16 +0000
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
X-Inumbo-ID: 37d5230b-3e37-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqkMELclt0njwv8ap4vHRHf8iAviIFIaGYU4MEvCmzksEo4JDu5hOxhOJ/3UG/TyiTSvnhScg4Dzb9K0KJXI7uYrQI2NjO1E95F3oZ3BCGeX55keoP8KfYSA7NWQAfJekL15CmVN0fRy264A3hr6je2zAwnTphBEPSKIKIIi/0SsSrXRwWaFi0YQkZ631AJ2yMrx5buKMuKrAelt75Veg1zN5knHf/rWzPHvjArPAf6D5RTdtivL08BC9YXkiJJTkpvGPl1evRKIuDtTZXw6cT299q+mmsrklLLbY17wdtyr4tm5/93FCDJmRwkafb15BwySulomEGRqJqj+TvLxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHU4h0ZZTwlKDYTi2tVdKM39Nq25dJ6x/TLnolSi+6U=;
 b=fafalCZkb7JNk7rbfvJ133B2aO/+0SMZLhEhnALMmPAXQKGi7A74fts0ctOjrf1Vmxoo/cBJFdsMIR/wLd1+JbJ3Ew/mxtZ9eD20l4mKF7baX/sgcTyMxVFzvDi1AX6uLGea5+b9Apy0TNPFwUfXA1x2VTVAspCFBKsbygB/cPtNvn+UoQPEEYl5LJThBa8VSpdZxec3PPTDsp1bvkHngmiRFaO7YW65muFSiPVm9PswiXjZNfZ46VEmmW2EH6bj6zHhKpoPb2Su2LENjNvacYc2533tqK7o1CPKPcwUvAYP63estINOfQaeJ8rJKua6Z8xUIFSijzPNNpdbTcC2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHU4h0ZZTwlKDYTi2tVdKM39Nq25dJ6x/TLnolSi+6U=;
 b=3j7UhX4XGa7egwamAaB2omIXOnmjS1Ue0A27bmogGRYbYCjY3sDE3YoNhDmalS9d/qiA0ThABcW8gHAXDLKGNOknFprpklc20VDABqMQstQ2otcq0ZEEqtpJYBrv43PwB0y3qAJa2MwOcnUmD+H7YKekO9+RI96acO4N78wmONa058PHlOyCGigrwh2AdyR+vCX2ZKkEBAUwEk1KmDZ9NkuDQEhoLJXR+AT+RVWIZyPYnIhyJ1dVyX/piZE/qr1jlv5PCW8QoTfrVQ1dYWMXJvsPoYLQPOXf3oVWBKOYTfmPJ9d62YbTLTHSQd5lVxR9f/ih473wfzOzeYBeW4rTeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5547335f-9e01-d461-f866-c0f823aa2814@suse.com>
Date: Tue, 27 Sep 2022 09:37:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 1/6] xen/x86: Provide helpers for common code to access
 acpi_numa
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220920091218.1208658-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9e4016-1192-4545-2c11-08daa05b1a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yaFp/vlIc/SCg58p3NuOo06jXlUWyMaUdeJGURS5ummDjLy7noO7ZMkWMmIvIEShaChA7Byat6T0h5ugAu2lej+zpHbpZCbEAzM/jW5b0eYSMmxjpOt6P1jdqhHbp9BsWP9M6URWLR2VI8AilpLVHPu4Rda8yPLT0G15CoNZ+laIr/Sr9NBJG6WSi5nWdAOplWIQP4udHh8BFFDn7Eid86ecUWHE2le43g6ITwAnG+RJYrivf9ldWpZ0coaXQp7gmBrJ3idqXF3PI89syqa6ArAHFzb5/EA5BQirDpS3/Zj/pSu4KHoG25Lguz90kk2CPXONvghPzMk+oMexbvh2tdzrxptCiE2qYSlv1wydp30AiOzeSYr6LBWJSeH1SMx6AAZWUgZN3OIHaUYiKMylEzJRUpVBY1eO1odeWCYmrQTJTQTAd4JCo19bUp2WqJYp29FzRxPIGV/w+uafSnCCCudKZzdamP+ZmTRh4Sl1SKWqMNg2SOmqveTUDkHp54MmtsXnoruEdkJYDQd5VCeJIh3XrIMfvP1j1TCF2te86W6Gl5t8K0ZgAaTSGrLYMU//qk53oHH2e3UPwXtwYn5f36zzVRyOIuVzbssW74kkk6dNSqQGY+QsQ8fLOgUCx6XQ3pjl1z10yVsuzla3hqbt8rusyC2MNh/eFdetMnEOiSjyoPulec0wltFGTv4C2DfACmqC5nVwfxxtHomTXFU37KEfGFCKXZmd3RWenet3bO/8sSRkgea6ljp5YRvxDS2lD7ZG0CvacJOi4etLi3shk4DvKw0/BJsPf06AYHwlqmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(38100700002)(31686004)(31696002)(478600001)(6486002)(54906003)(6916009)(2906002)(6506007)(8936002)(8676002)(2616005)(53546011)(6512007)(26005)(186003)(5660300002)(86362001)(316002)(41300700001)(36756003)(83380400001)(4326008)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1RGamdmSk9WK0Zya1Z4dW9QbW9pcUJmdjdTY0lSc0ZDZXpEd1pJTXY5OUVB?=
 =?utf-8?B?cjZIeWNoQjB1RVExUklTeTV5VEhWc2xnb3h5RVlnZnk1VG81ZW9hWjBYdkIx?=
 =?utf-8?B?OFEvRHljMHNYdnI0dFZiU3M1enF3YkxOYjlCOVJKR1M1cFdxUFRETkdiT2hN?=
 =?utf-8?B?dEVqdVJBZzErdktDUlo4d205dkNSWmRpVlBYN0xzOG9HZ1JKTVdkOXBPOFdD?=
 =?utf-8?B?QjhtK3lUZWhOc1FFNzF0SCtoUm05a3ZYVndkbTFPS1BBdUJmRkpLc3Ztbmtj?=
 =?utf-8?B?ekJpOVlEUHBqVHY3ZUJ6dS9YZHVPSlBmM1BlbUs3U3VtdzM2WXNIMXh3N3E1?=
 =?utf-8?B?ZlVuRFNuZkd2aEFQb1pjRFRjRU0wU0RxNmtPdWtIS3ROeEdtd1lvdHU0V29W?=
 =?utf-8?B?UVVITkhBZm0wYUZ1TXJTem5tZDFKZjNONDhYUGFMa1gwL1psWmF3bDdyc1U4?=
 =?utf-8?B?QjdYeFNQRHR1SXJmbURIWGxRU0Uxa3V0VUdGbUlhaFRTbXNkbFNHK3k0OUZh?=
 =?utf-8?B?OUc0Ymh0VG1EM2R0SWV2ME5vYlhmY0Y5amZ3WUpZbU52WG53bjhqOGljQWg1?=
 =?utf-8?B?eFo0WVVkaDZ5bm5nNXgzMjJ4T0pYUHc4UmpqZVl2NGJGc2lMblJ6ZDZmYXg5?=
 =?utf-8?B?MmZDeFRDRkZ6V2w5UHRjZ2VDMUJlcmMwck0wdzV2Yi8vb2hHZWQ2ZVV2OEVZ?=
 =?utf-8?B?dDd0a1RSaDhRZE1SSGhGa0x4REw5RkN6WUEwRThPaVcvYnlQaC81V3BWSVZv?=
 =?utf-8?B?QjJFZmo2VXd1dWVpR3Izb2tMMnl4YUVubmNORDVZYWpaN0wydG1Wd1pHL3ND?=
 =?utf-8?B?eEx1d3JvUXZhVVV1TjNzREUxRXpsZzZaeXA3YTFUTHVlMlkwL0ptNmdpWkJI?=
 =?utf-8?B?M1ZSVGZFeG9DS3JkMzdBMkhnU21zQjc5eGY1bWdCdVR5QW01MDBnbXpuTW13?=
 =?utf-8?B?eFBUQU51UmhrcHV1TzZWSjlJVWJTdzd6WlF2TTZHTGdGa3l6RGJWWW9oNE9t?=
 =?utf-8?B?VnhtQUQySGUyOUQ1QXJncTEwdjhMYStqdGRlRFJmK29OVEtFeFJPZzFid1Vx?=
 =?utf-8?B?KzJ1cmtENlIxTzhSdGdmZkJXcitKc211VHRxck5ETXlIYnVXMWY2eWJmS2x5?=
 =?utf-8?B?TG1sWUJIYzlnSDJSci8rOHpLMnVySjdzdHU5cW9MTXhhRWVNMFBKSXhBbVMr?=
 =?utf-8?B?cDREaFhYS29vMHZ2MHE4WDdqRnFIQXF1KzdWcVpUOXFsRHdsVnZjQVd0VlNL?=
 =?utf-8?B?UnFjanp4NWFXV1d3SnAvU295cjFQL21uV0lKZEdNMVJMUHZXeWhCMUd4OC9K?=
 =?utf-8?B?OEVxUHRoemRZd29qL2VUSUVieEQwZm12M25JRmZOWmZiVXNZblZiQk5FRHpr?=
 =?utf-8?B?Mm54Nkk3R3lZZWIrMGRvL3B2RDVnUjFOUkZVOTVyeWhPV3FIaE1JK1plRHpw?=
 =?utf-8?B?bGUzeC9UckkvdmhXMHdhUjc1azh5RnJycGlkMlRJM0dHWS9ZMzBKZWRza0w3?=
 =?utf-8?B?RXZncGNJN1dkUVFzSHJXSjllYkRJRkg1cE9aVXhORGdvMXVURGFWVGZoOVNT?=
 =?utf-8?B?allTaGxqTlpXMEpIWGRyMkp2WU1veDNveERrdWVzUTBFNHlIajd3WWdIcVFB?=
 =?utf-8?B?eVRpM1BSQjRCWjVvSy8zZjUvdGZ4MG5Wcy8yL1RxeTBVZktkRC83a1pwazFz?=
 =?utf-8?B?em9ZL01vRGtUcHdpN3NseTEvQ3pqaHJCb25vYlJmZXdpeUdqRW1wOUFNNU5R?=
 =?utf-8?B?MC9SanY5dTJ3ekliOVdxVkQ2d0wyUkttMUZiZ3FxbE5aZ2VOTzBEMWFDK1JB?=
 =?utf-8?B?SDlucHZ4OHlLdjJFT0xYV1dTK2NJZ2toOU9lTXFMajFQSGhvYit1dWhIVEVa?=
 =?utf-8?B?aE8yMERGTzVaZFNRZ0tIb0llVlZzQjkyZGZwczdXQkRWandPeVhUaHBFSDQr?=
 =?utf-8?B?dkZlT1NPUnpmWklkUzE2WjI0RVZBb2VYYWpuTzFsM1FMOW9Zd3pzREFOcVJM?=
 =?utf-8?B?WWIvcllXUVphTFZPRC9RV2svc0wxL0VzZEo0ZFZPSys4enZpdzdlTWNBM1VQ?=
 =?utf-8?B?and2dEhzWWtFNWNSRExSb1cxdUZsdlNxdy9xZG9kWFhjem5zNk0rSDl1cjdI?=
 =?utf-8?Q?9nvBzuoTYT/3YV1Qrm5XuRV67?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9e4016-1192-4545-2c11-08daa05b1a0c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 07:37:16.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Joa11ySRG+nx1Q8l++/LufloF/WgjoL1xm8roDRV8wyl6aLHzH6gpCbQ30Rgsd0/afM9blk8B+yL+gqka3f3JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

On 20.09.2022 11:12, Wei Chen wrote:
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -50,9 +50,28 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>  bool numa_off;
>  s8 acpi_numa = 0;
>  
> -int srat_disabled(void)
> +int __init arch_numa_setup(const char *opt)
>  {
> -    return numa_off || acpi_numa < 0;
> +#ifdef CONFIG_ACPI_NUMA
> +    if ( !strncmp(opt, "noacpi", 6) )
> +    {
> +        numa_off = false;
> +        acpi_numa = -1;

When making the v5 changes, did you go over the results to check they are
actually consistent? I'm afraid they still aren't, because of the line
above: Here we disable NUMA, but that doesn't mean there's broken firmware.
Therefore I guess I need to ask for another round of renaming of the two
helper functions; I'm sorry for that. What you introduce ...

> +        return 0;
> +    }
> +#endif
> +
> +    return -EINVAL;
> +}
> +
> +bool arch_numa_broken(void)
> +{
> +    return acpi_numa < 0;
> +}

... here wants to be arch_numa_disabled(), whereas the function currently
named this way (in patch 5) wants to be e.g. arch_numa_unavailable() (or,
using inverted sense, arch_numa_available()). Of course I'll be happy to
see other naming suggestions for both functions, as long as they reflect
the respective purposes.

Alternatively, to retain the current naming, the assignments to acpi_numa
would need revising. But I think that would be the more fragile approach.

Jan

