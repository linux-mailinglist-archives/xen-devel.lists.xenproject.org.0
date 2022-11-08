Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D7621980
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440291.694436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRXQ-0006J7-3h; Tue, 08 Nov 2022 16:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440291.694436; Tue, 08 Nov 2022 16:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRXQ-0006Gs-0n; Tue, 08 Nov 2022 16:33:24 +0000
Received: by outflank-mailman (input) for mailman id 440291;
 Tue, 08 Nov 2022 16:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osRXO-0006Gm-TJ
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:33:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2068.outbound.protection.outlook.com [40.107.249.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ef86fc9-5f83-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 17:33:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 16:33:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 16:33:20 +0000
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
X-Inumbo-ID: 0ef86fc9-5f83-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa78eJADXs9E0JlYqSvj9znkRNEkkyO+Rqidoojind+knER4GPUHUM+oOKzkVcwWXqQVLTrlEKWhD8z6Oboz/eN+0xhSgNloQKfxWrVdap+HE/VsvuXCFQP9zNMSfyn4EzdC7c8qBtz4tBgw8Wg2Ql9FRosYYI0eOJ5CAucsCw9H5Q2r/26ynmZEygWWxhDJ5j+3Hv9OaYfharW8khnJmIyKPLT64fMEE8tnkhgZScChQ9EgjZqkOK70apZDXJ2imacZIF6scf8VsYbM0U96AKxEnb/kA7DtEhT8lFTGGjTjpTRz7gEgRbWlSw+bKUEbvN3yPycFZKhbnZPpCFMiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yXhiocv9/KQB7pT6PT/yrGtCj+DEwJvZc10DZj/Sc8=;
 b=kYnStpP3H5c3yFijd38ctoNEI2sheZMzcX1GEjYKRNhd3sE9jab/LlVnmI46Yikintf4g3Dm3sYnquu+EPeqMLHMok2Y5uGXN6Z6jTqcjKIDweXun/eoHJ8QaLLZXFxhW17XwWiR5eMQLezg8GnHsoYum/vwTcH2XSKNehLxHeGL6kFgvoQ4SxxbHbdoZyxxl0nd5BadljhlG7UqJOl1DbE/R32XFwXLsgNu8VVIN4eqDoHOT8yK9kn7JFzIfI+hEM2TIN/JAFHHO9XAeC6chW27xclGY7c4q2TiLjS+KhNZwgjcgEjuv3uoAAhSu2jq3AunvdagMHfssEhhe0+lyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yXhiocv9/KQB7pT6PT/yrGtCj+DEwJvZc10DZj/Sc8=;
 b=RiY5ue8CpyUvlzTBwQcb8rlho+ef0OwBTo8cJgHFQqlRopHY6RAQWBbbVazG7GLeJeeQutz1o3nqlwk8eJyw7gwVKBKzM/iqbhmRNnKVPEDYv0natyZsIroXI7PniA1+tsTtunkFsmdiYu2+piIUIuLqXHPahfPaz1n9hnm3PQKSalOZWrNSfZYAL8qSCCp1QXjWgprVuqG2ibydPCAnVMDA55ZKgJjUGvI42if9TYVxp943AThIlU82ia4djN4LqfOgGmp/4JcsI0Xz+3wIusKDxibUFyawqQZzwQvyQk83o+yy6HpBXjleQRHqVc+3SlsV+57joxNV98BDxanD2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a9e8fd9-fae0-643e-7754-ade395576695@suse.com>
Date: Tue, 8 Nov 2022 17:33:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 "Henry.Wang@arm.com" <Henry.Wang@arm.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221108135516.62775-1-roger.pau@citrix.com>
 <9b785cc6-2de1-a522-9e57-62c0421c6a21@suse.com> <Y2qA3sEnSa2xdseR@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2qA3sEnSa2xdseR@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0041.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: ba370869-3420-49df-534f-08dac1a6f277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0N+AaeEOR8uXv4e1EUMRPW9QKxVOyWySjVaf0sWiqYaGUfxoYBq/4Cgdn5myVCcoOVFDlogVc3hwf/MAEPRS9BiXc8ph77uO69IgvYnY5RQ5XTfl066fczg85vpCZ96m1Ts0exPUoynauB0Czbgpm88+UTF9ZiYQDmpUUfCGQF1sKjNz6Bvm3XPjBox4uOXC10SGVCoEzdn2oKI+szKH0dFeh5ADaxgcVJrLOblAreZEGT0cDeqRzAHDZaY9YhzIdrpl7qPL7LCUFlSjcYx7Ra5nR6yIDw5W5Wra+sfA3YmLmrYxmSuzH2IV2wQJAiMZRLoQyuNmMvSX/qstNd+ls4BlGod7euri8KVtq1WDv67MQ2sq8hxcaE9MycLM2m6ZNFLOdGfxvK9uBd3xjP07pjc1gyyrX1a9Jwn+zoNCX/cwhdvZ7lpqqQDcTDRDfatLZT1f8EobljtyvLneVfcAfZ+2FOvFT3P3y/WySwhhvA8PIAIDqPdcUa6hPPPEfD3rbD+dBVatt7lpiOIcw6Aja1VmpYqQRE2GFea+iTW+ZvwB98D9Fz3oFt5k4qM5tSWETaTKwEkuscQyT2T//mS6rPIIReIACm8FqzOLMhYS5TOqjJFrQuJed8qp3/fX8+5ta815rN9qWQmnfKo9fA/Y6M6efbTJGOcKuDRhOFpSkU8MTCjzlVSkhr27gDYAFwj5uZqNBxXQDErjIWzOPbI5mIxH1uyxubjdyzwDqaPIisdE3tdDsdYYKIjsHcnPhUH0Adva2Sw4oV+EHiYeEIEiFOCpIF1BxCGSOyLLX3eflgXpeqxIjCu7VYYlH8gJFMdXI6d+fQUwYHk5nJcVJxoAzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(8676002)(4326008)(316002)(2906002)(86362001)(31696002)(6506007)(38100700002)(53546011)(36756003)(66556008)(66476007)(66946007)(31686004)(966005)(6486002)(54906003)(6512007)(2616005)(8936002)(41300700001)(478600001)(186003)(6916009)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnRKUy8rN0M4ZzhiNUhHSkEwOUZobHo2VENIOFRZSG9LNVBNeXdJTVd4TnRT?=
 =?utf-8?B?ZlRlUjUwNjV0cm0xZjJ2ZmZvK0wza2xhTmR4bDhNOGovTjArenFzVkI0cDFK?=
 =?utf-8?B?RDk3SkFIckRzbmVVYzFKYXcyTkpvV2lWNkpoK1NCMkxuVGoydHVWaXBkanFs?=
 =?utf-8?B?VjRtQUViNjhDOGJQbkV2U1k2ODU2U2J5RlNReWpkWmhjcnlMZ0dDS2p2dlUr?=
 =?utf-8?B?QnphV3Nab0d3djdVWnloQTB5cHJRYmFMQmFtbEFiTVdMN1MvVHhORDZxQ0FK?=
 =?utf-8?B?Qk5RY0FmRHpmRm5TdlhVcnlzK3p1WC96Tm8vOEROZlQybUZzQnZTdm1oc0NJ?=
 =?utf-8?B?Y1h6eG9RckhLUUFhbnQzcm1rRTBvUG8veDR5SVpPbUMxdUZZbGkzZ0FxRnBB?=
 =?utf-8?B?NUVBYXpNNXdUQjgyL3o2ZExkTm1FS2FjaFdNSzB1MTd2VmtJMXVGUHFzUmxZ?=
 =?utf-8?B?U2dVN2V5VlI0NVFOQ0FXTXQyRWJKQmtad2U3TXY0dTFLK1RDWDVGUHFxOWJm?=
 =?utf-8?B?L0NzcnRmOTNlVmlMdWdxRTg5OXhUejRRSWxSRzZDWjMwZG5NZDhEeFZrV1hz?=
 =?utf-8?B?NDBxSVJNVTh4ZEoxOHpmdmVTTUZuS013Y2JGS1ZEUkdibnNqcTErTjNjYUZ5?=
 =?utf-8?B?cm9oa3UySFI4amcvWS9wMzcxTlYrM2dwakFueEorNjNZOUlEbjMvbU5YWTJJ?=
 =?utf-8?B?WkxEUWk2dkdyUFJ4Y2hHZ0FOdFBWRnBvNTFDRUJtSVN4THpLOTRzc2oveDJ6?=
 =?utf-8?B?bG1JWk5rSWVoRkptemEwMzZRNEpBQTQ1UGlQbzdZZVd5bHdnWXkybWg5N1Qy?=
 =?utf-8?B?akxHQ24xWXkxQVlzcG5RYmlETC9SWTFRc096UTgvcEp5QWVKZTVXandXZlhV?=
 =?utf-8?B?Yko3dWlLbkpWcGgxUk5udzZkYm1UcFRkbmdlcXF2WENLU0Q1anE0TzY1ZGpU?=
 =?utf-8?B?WXk1MkNsdS9DSEJYbG0zeFVsT01VM3dDZXJvVmhucUNOZGlJanJoZ3M5WFpa?=
 =?utf-8?B?UVo0aWExNkRmbEpvSEJQNDd5ZnVQaVdON0haaVZKYzFVQ01mamQ0VzNvWG5U?=
 =?utf-8?B?VlVRaTdIL3RaeE1Wb3MrbTZyRWp0TG04SkVjc2x6Qm1CZHRBNmJPUFE5Y2s1?=
 =?utf-8?B?ZldFNUQ0ODNTaUE1bVdWWkRpRi9JNUUzSlBRQ2ZXNlkzUC9lc3dSUmRKam11?=
 =?utf-8?B?bkdTT2RDaHZpOGlIUk5ObElKWExnL0hrbjNqbmtTRTdYNkcySHA3RnU4Uytp?=
 =?utf-8?B?UU1vMVc0T2hZNENHRmZhQnYrSkRBZmdtWUpvYktGSmN4cVBocjVTNnc4Y1lr?=
 =?utf-8?B?aTJSMkdwck5hVSsrcDBNekU4RXpoVXpqRFA0enQ0dWx6d0NVYWZoS3VtSEYr?=
 =?utf-8?B?UDA1anlOVGxyVWlHcjA5OGVES3VXVmhCTGZUMTRrcVFMQ2tWSmVYSnVjalB5?=
 =?utf-8?B?RS9DMUMyczBOQm9GNzV3MGl4cEROcTZMbHFKNkhwYjB0SDU5cjBMRlZPYWdH?=
 =?utf-8?B?K2thWi9jRmNBeTVZNU5NOTRpVTBUY2hpdkVaazBJTXFZWTdaaDA0Zys4OEl6?=
 =?utf-8?B?QWZjRFNVOFRVWE51TFljcXVselVYa3BORnliZDNpUE55WWNGMDFrZ1Q2OUxj?=
 =?utf-8?B?M3VuZHovajBZTDB2dW53MzNGd0hQRUpKV012b2VBZDQ2OU95ekI0RzlqOXJl?=
 =?utf-8?B?L1lwT0NZdWEwTE9WUzM4bmYweU9OalhsNGVGVHVuUDlaMmpDQytNb2pmcndR?=
 =?utf-8?B?QVpZV2RsSjBrWUY3ajA4WHBhVDZ3cEQ3QjU3QkdOZ0FRaFViZm9DOEEycldX?=
 =?utf-8?B?QlBjM2JZdGdBT0VOblZBUFlneFFTVGVUN201NUdlQkxvKy9pbDNHNlppRXBK?=
 =?utf-8?B?WlZOcDlISUZ4UnBUTk9WdmJ5ZjR1My9hSSt0R0VjVmN5ZlZxR0hnN2x3STlh?=
 =?utf-8?B?ZTdNL2ZSTlZ6NUxZdWJOZDMxeTZ1amF5S3pzaE1XZzE1M0haWFp0dGVKYnBl?=
 =?utf-8?B?eHpIZWVQclVEa0FYVDlIcnlEZ3EyNUhwdk85YmtlQjlPTDJNZFJKWUpiaXl1?=
 =?utf-8?B?UlRuUnZ3REJNTDVuRGMwNzV5NC9LbTJPem1PZXZ0VHVqaGZIbzVGSXVFR0Jt?=
 =?utf-8?Q?6BfUjNSb946x946fXzDKBm4cO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba370869-3420-49df-534f-08dac1a6f277
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:33:20.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Fl4u4Tv8MhmSyfYJ/tY4TJrWL9JKkGsNtEN+7N8WRS7jDpkqCh1inH8QshDrOmd51mHgqSohHGvbTAnTvx5qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640

On 08.11.2022 17:16, Huang Rui wrote:
> On Tue, Nov 08, 2022 at 11:56:17PM +0800, Jan Beulich wrote:
>> On 08.11.2022 14:55, Roger Pau Monne wrote:
>>> The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
>>> from the firmware instead of doing it on the PCI ROM on the physical
>>> device.
>>
>> I can't find any mention of VFCT in the ACPI 6.3 spec, nor anywhere
>> under Linux'es include/acpi/. I don't mind the addition that you're
>> doing, but there needs to be a pointer to a sufficiently "official"
>> spec.
> 
> Thanks! In fact, this is defined by AMD atombios (VBIOS), we have up
> streamed this in the Linux kenrel. You can see more details here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/amd/include/atombios.h

I can see about two dozen lines at the bottom of that file, with
effectively no helpful comments at all. I'm afraid I don't view
this as "more details", let alone something replacing a spec.
There at least needs to be enough to be sure that "VFCT" is really
firmly reserved for this and only this purpose within the overall
ACPI table name space.

Jan

