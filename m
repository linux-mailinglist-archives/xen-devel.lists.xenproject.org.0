Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E87918CE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 15:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595225.928720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd9oz-0008UB-Fr; Mon, 04 Sep 2023 13:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595225.928720; Mon, 04 Sep 2023 13:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd9oz-0008Rj-D1; Mon, 04 Sep 2023 13:40:53 +0000
Received: by outflank-mailman (input) for mailman id 595225;
 Mon, 04 Sep 2023 13:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qd9oy-0008KO-7i
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 13:40:52 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8ff114a-4b28-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 15:40:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:40:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 13:40:48 +0000
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
X-Inumbo-ID: a8ff114a-4b28-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfZgyipPFzbFIZ7fRBTbGW21Os8ec4rLWFCwsgKSDnwAmDq7YOchBhrRmvjqQzToSsE0h3As9cZrUMc3kClmtbUqW3VuySpVJvaGo79G1E4fdF8xx+6vComVQAM3lRYAOKqEmfppvrD6qq/a6yOIFyV5W1lcdz/VoFvRVVRvr5nOld1Elaz5WIfaj4JqIdv4bFqUtJ3ve9fmRxWyTAKXS8IUsOuU/JcbjzFIEUT2UI0bAjDNftl1tF/pLp1N89osP49DugwjWjNuC9ECdLmhM9cQr9paUmrbDac5bke5WLuMLErGjX9XoxSk6EQ2T3kH9wurWz+bTtW9r9C+p9DxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9L6vwvrR7V6qNVkpoe82dW81DbyRpbCR08Mw1dxcMP4=;
 b=A1HPhdSxbpCZkwypWbS+i5U/zCn9vJa7sQPbg4o2bJ8T0b6FGB7NyB8qooqr0Jl2OznvjOA6tgkF9EktWn0ZCaD5jiqp/fpOt9MMPrwRmjyB0yde2a/MQ/wUdvmbMRytcMRjvj0nxoamyVaD2o/unGn6BgrnxqdLPY6lzHnLIQAgXhiYpAvs32xqp/hAkb+IrO+whVOq6EooeVNPAk2WVKDMAiHjyaFi0f+TT6Pu6u4PqsRtodfIjARrMuVgBrUWzxuAovdssAVM5d2JQ8UcljE4/87wPjjBqHqkRbv7oegxbX6HwLOtz2lKNyCfJL88G0N5+rz6vU0UbU6EhA1X+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9L6vwvrR7V6qNVkpoe82dW81DbyRpbCR08Mw1dxcMP4=;
 b=qqL750BQ4LykodnA/wCruM39F20dlMwIoHFw7s0zLbUQ3trYrHBsnhVtMpc7qFfGlbpqA1DhXlK1he6pv66Gl5ht44oehy7OlhTXkYtJ/rOF3xXVBTiujUmeq1jXzuX14TbH5DdDfL+/ad3uumQyRWoefW+Xpo8Y9W6vVsrD9Gd7/gdZWzQSri3IiB2NZ9QkUG1nYm9ziTPqGKMjrmPWVvCaNWs8N2UFC2n83WWQT2dDl3b2RMDSZv9t9YA4KIDDTXh9tQ7d8znfv1k0hvl59seNDeR0OyWzm8dfUVYWaRuSegYRElaEMItwY1hnK5kqs6/9/PS+1L2OIp5aI3Q8xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d894d37-4a03-7d51-9a45-3f764d05a90d@suse.com>
Date: Mon, 4 Sep 2023 15:40:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Xen-devel] [PATCH] x86/HVM: adjust hvm_interrupt_blocked()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
References: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
 <ZPBusqv7NGaJnOoT@MacBook-MacBook-Pro-de-Roger.local>
 <ZPByJJEoJOjV3CIY@MacBook-MacBook-Pro-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZPByJJEoJOjV3CIY@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b71f70-b402-4e73-a367-08dbad4c8be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9/G8bnRwkJiap6OxVUEEb6dVskjMk2kQTdblEkVeNXjpwUJ0yR5kf9WB+8ncMz9LDXMqTwoD10cH+/Dx6LbXQiyeWPHzu6T8HgLibz5oV6Nu5IbX5gFkXYgVVOJf89FSSgP7yE5wjH5wojiUUf6swo0yo4YdAH1XsyN8TZgU2/Zd2uriAUcsJyIqe1WGJ2Drr7ebn7CsQSROTO0ngZST61zmuCVV+2dRUZYGWDAIYtlOLNjvU8BX7EaUwSvw0xmglxz1zx5t/p0Dx7JIcayzEthohyxgDb2nVS27rwMT5D+BH8pBtM4Nr03QfaXThkg21P9iTtW+5+gm5YcfLbtGGCjHegNuCJ1N69kLY1jEvQwo5JVQK52n4Z5QNddG4FUW9TIVh2V21vUeTYo/QUDd+suklmm0iLCxFjwRdcZ6oigfixFokUgWcRiDHR8BAhJgc3uDXpRB344XT3T8cfuUhDA0GqAx4LufZI3iq7RiDSRPXYVrN/AoFBSFssnZTLpsswHw/+3vfI1EAtdWDWyW5xIx1St+hyXqaKJgOdG6eQHlKpiqOkaSSibV18g2aguXKGFUlT1JisKoltNzmr0MbXxM3vdZ85U5omo7/I1HQGXWlXjmj1bPCU5Z226MdZOp9FaqF+zq2woLkpj++9h+Lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(186009)(1800799009)(451199024)(41300700001)(66899024)(38100700002)(478600001)(31696002)(86362001)(2616005)(83380400001)(26005)(6512007)(6506007)(53546011)(6486002)(54906003)(2906002)(36756003)(316002)(6916009)(66946007)(66476007)(66556008)(8676002)(8936002)(5660300002)(31686004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHhJcmxUa2g0bzBWVUlaS3hlRCtLMGVHdm9nbVFyQTY2cWJGOFUySzBIekNY?=
 =?utf-8?B?aGY2SUVuWVBZV01mL2RMRURraWVNaXJwcWRFSEV3TEUvYzZRY3RxbUNaeE1i?=
 =?utf-8?B?NENia1hEa01tK2lyR1hhU3VqeE9mVHJOd1RJSDcwbTgyQU51R1hxZnBPaTgw?=
 =?utf-8?B?WnJtV20wemRNMDkwVEcwQ1FYSEYyT2sxSUc2eDByTjkwS0krd0VQeXJHZFVX?=
 =?utf-8?B?cHRpVTgrOW5hNU9RbGJEMTB1YXJaTndWMllKTEhpRk9OUU9EOXZhUnZ1Y1FT?=
 =?utf-8?B?STBMcGc3eWlYZXhmTm1Hdlp3YVd1akZLWUM2YS9VS01jd1lrcC9BQUJ5VDFu?=
 =?utf-8?B?dUUyOERmQlA3NDloMVhOTHFNSHNaYnVkUmFUZkx6Zk11dU1CaGlwcjFFTVFj?=
 =?utf-8?B?elJHTkJhcTBSQVFvbXdicmVLK05PRnZqbFhMTDFyRFoxcXBKdVlkdFkwcndG?=
 =?utf-8?B?QWZmVUNnNWZ6RjZjOEVHRGM2V2lGSHZsQTlaMk1zRXd3bG51eDN0MktpUUUy?=
 =?utf-8?B?L2xoWitQK25hSE42dUFFS0FzSzZ5cGtMUlU3a0VWbDF3UnY4K1BCc3F5WlVl?=
 =?utf-8?B?NS8zcW5xSWZDUzM4ODNkNXEwQVA1Z2Z0TTR0RGpLWUdBdS84SkxNaXFhczdF?=
 =?utf-8?B?MkVWZmNTSytMaEs5NmVCRGcwUHdIRUh4VkxGaHFFd0JzNkZnRTRacVVpTmN3?=
 =?utf-8?B?emwwVlFValVoT25zL25sN1VabFc2VjBVYzhDQU53NHdtazc2K0FHVjBPckpO?=
 =?utf-8?B?bnFuOW4yYTA2WU8wQ3VmQ3ppWXg5eHplTDAxV2ZtMWxndFNyYmliWHpPb255?=
 =?utf-8?B?V0ovNjBid1lzUHl0TUNSN0t5QlZtU0RHUEhyREVwVTF2SGtuSDVQVnFSUmYr?=
 =?utf-8?B?NG15ejVsZGdVb0JpZkZkUWRHc1VYL053eFprcXpKWnJObzJSWWZjeFY1VnFz?=
 =?utf-8?B?NjNBbWVlZy90SDZwTGh2UmtpVUJYSkJIalhjd09zWlcrYVF6TUJqdVUzV2Fu?=
 =?utf-8?B?VUc3dGxRblhia2wrWS9KNGo5N3lwQVV5SU1XeG1UdTY1bE1zeEFkUFhUL3F6?=
 =?utf-8?B?ZFRFcStHSTF6MklKck1TRW9qSjVFWUtpRXJKQ0lqN2FDWGgrU0lyRjNmRGh6?=
 =?utf-8?B?a1dZTFB5N0dpWThBMHZLY25ValFDYXBCSS9KeGNhTCtPODA2d2xGdHVQL3Nw?=
 =?utf-8?B?MUlESndkNStyeHl4SWgrcnpadWdMdFg3QS9sbFhHcWdjcnBEblJTNHRIelAy?=
 =?utf-8?B?NGdHRHUwQzNaR1R2b0U2dGk3UkxtK2VDYmE4K29xSm16bC9WblBYZm5wR095?=
 =?utf-8?B?VXZHb3RxSEo1RWF3RThPOVdRV1B4Q1o1N3lSbEt4SUpCeU5TZlZ2U3R5b0lW?=
 =?utf-8?B?emlSMUdpSUFoQzJXdG1xTWtsN1JFS2NnRFdrQmFDYjBZVlM2ZFBValdYbXQ5?=
 =?utf-8?B?Ky9QOGh4UXFUSHZzb2ZpZWJqbzRyVnEwU2FwdHhqaHk4NjczVXZpTTl6cklS?=
 =?utf-8?B?WWxlckhTSTlURHdVOCsvQkR4RUdISFdzQWRRY1lzaEtHYnd0d2k2Z1pyV3F0?=
 =?utf-8?B?dHk3NXNQMHJnQ3RnMmRvRzNCVDNXcjRBVWJoN0NSUTROWGlLUWRldThuNllj?=
 =?utf-8?B?V0xQZmJ1ajhNdFE1eTdyTGFaZVZYOW9SdW5xQk9FaDNhSkhtVkZWRFkzV3o1?=
 =?utf-8?B?SlNMU2FWcGlKRzBpOFdhWDdiR2VKTWNHdDBVWk1jNjFtOXphSy9yelVWaGQw?=
 =?utf-8?B?eTVzdUJhUWFDL2c3cmFWU25ueVQrMGp6R2JFL0IyNDJRN3Jyb2o1TllwdGU4?=
 =?utf-8?B?TkRVdWt6ODZYeEhha21aTCtVeEFEZ0Z1VkJ1Yi96ZDJHMEN0Unl2S3pNRDZP?=
 =?utf-8?B?aVY4VUJLNHNzVFZmWFFZRzBMaHdDa1MxVi9hZ2NlZ2QrTGZwZ0NNWjlFZUxM?=
 =?utf-8?B?VklRWFlkMCs5NDdGVG92a0NvUjVKU21MMjZTVTlPQ2Y0NXBBWC9DWWtNdGFW?=
 =?utf-8?B?eFdDZkU4REhYU1RvQloyRXZ4cTk1WGtoOFZRMDhGZXBidGdGTjgzRWNpQ0hm?=
 =?utf-8?B?YTFnTUIwc210cmFLYUtpVHBhQTR5Y3ZZQWxHRGtDUXVZS0hRNitlMVphM1la?=
 =?utf-8?Q?DooANV492AfPioFsxTpmGC1gc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b71f70-b402-4e73-a367-08dbad4c8be7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:40:48.0820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0RoVX2oIDPSlL3+j2KhWzKHgi1QSDRmnnzZwc5kVGDlqvHzWRojl+ekcw2GKr95b7CNbnsHPcwpIMS4ylGe0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043

On 31.08.2023 12:57, Roger Pau Monné wrote:
> On Thu, Aug 31, 2023 at 12:42:58PM +0200, Roger Pau Monné wrote:
>> On Fri, Oct 12, 2018 at 09:58:46AM -0600, Jan Beulich wrote:
>>> First of all, hvm_intsrc_mce was not considered here at all, yet nothing
>>> blocks #MC (other than an already in-progress #MC, but dealing with this
>>> is not the purpose of this patch).
>>>
>>> Additionally STI-shadow only blocks maskable interrupts, but not NMI.
>>
>> I've found the Table 25-3 on Intel SDM vol3 quite helpful:
>>
>> "Execution of STI with RFLAGS.IF = 0 blocks maskable interrupts on the
>> instruction boundary following its execution.1 Setting this bit
>> indicates that this blocking is in effect."
>>
>> And:
>>
>> "Execution of a MOV to SS or a POP to SS blocks or suppresses certain
>> debug exceptions as well as interrupts (maskable and nonmaskable) on
>> the instruction boundary following its execution."
>>
>> Might be worth adding to the commit message IMO.
> 
> So I've found a further footnote that contains:
> 
> "Nonmaskable interrupts and system-management interrupts may also be
> inhibited on the instruction boundary following such an execution of
> STI."
> 
> So we want to take the more restrictive implementation of STI-shadow,
> and block #NMI there also.

Hmm, that text says "may", not will, and imo STI affecting NMI can at best
be viewed as a quirk (quite possibly intentional, for simplifying some
internal logic on the processor). Plus I'm not convinced AMD allows similar
leeway in SVM; at least I can't spot any similar statement in their PM.

Jan

