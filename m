Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87FF7DCA2B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 10:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625562.974956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlPc-0004fx-OO; Tue, 31 Oct 2023 09:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625562.974956; Tue, 31 Oct 2023 09:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxlPc-0004ca-LB; Tue, 31 Oct 2023 09:51:52 +0000
Received: by outflank-mailman (input) for mailman id 625562;
 Tue, 31 Oct 2023 09:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxlPb-0004cG-QK
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 09:51:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ba04e3f-77d3-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 10:51:48 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9065.eurprd04.prod.outlook.com (2603:10a6:10:2f0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.16; Tue, 31 Oct
 2023 09:51:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 09:51:46 +0000
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
X-Inumbo-ID: 1ba04e3f-77d3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGtkgaXVYHs1XLhyzGSAN3eMjnQ7bpLjuwlmHBTZwb0iTv44+Jqr3Z34/JTmTSGADgMOP2y4GSwOpDnsjwgItjwxmcuzhR97vRkeANgPOwbRahpYSISwayjLaBnIZlt/J49AefQk9NNnwmj1IHbaidYcW8EuMOJnnPrdv17h6yDKhUNK+BgXnMmtCQmadS0jKqQaH8r2f4UDienprjxD314cg/Jfl5aQAYWe1ako9OSjgfU/6LFzAQnV+rAfse6MLnR83udn4wQVedYVx6m7RJb1PA58MR/W6u7YYIXqUNo1pViXfCxjxINeEVIFFYDxjr2CNdLNKPgaoI8YcJAoXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugEItJLZv8dVP9C5M+ZUA3UW+W5uh458RgXWaOS3rZk=;
 b=afQT4Mbjj/xfIMpg4HcFYbto2a7hHD0dqoDW93vfXmqK0dsW9+OF5jtFXXkDxR/voV9S0JUSITgVaqsaYXJ4xaOdsjGbP5PRpLZ9viCVhWXsJc8rcqWHHhN3ehft1d15ozoointNg5kF+csI7lwvL0oBKDIK6dbHlO7YtjEcTwywkgKBFRlhZLzkPrYG4xqb3d+b+Xwquf1rGFmuk0iRrMm3Q/ynPqEEHRp1FwOaP7X1Ze6RfR3PYvunpE0YUCsbLS6+ibPPCs6o4xisOWDnEcesWBBUEw1AQSiYhJMb+Wn6MRUPH0kXFO89ZfvWVwRMj1NvMIR+mJXTwAoWHF7syA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugEItJLZv8dVP9C5M+ZUA3UW+W5uh458RgXWaOS3rZk=;
 b=4nLYO5kFd5nSF5U4f1cHO+0WLCYaKG+b9idq9XmvB9Dm+ebGoRjyJENJd/QGAkCorAOrnNks1HekF7C8b8BCgYFRj/INBg9PI9gWd+HfEQI/753VRlwUvoWHQyQRV7GbDrEmp2zBG/qKe+X+TfABUSP0lHzIEfL+oM8J1Pd1AmI0TLJIRTreE+UGXjZFvzhY4g4o5R/gIyBWEOhhFxx7qj4U/8W/zNclXVghRGlXCg9qwBoAX10Fy7AgdGtbwCBGI13YSOm6Cm0QZBfpbjSNoM0MFlZfEsjJFFux1WuuNFblcHcEwdE4BeIaOJ8Y4BQOJymlRi4FS96xxddm3QJmOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d9059f2-541f-7a3a-5ab3-2ef73fdb41aa@suse.com>
Date: Tue, 31 Oct 2023 10:51:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/PVH: allow Dom0 ELF parsing to be verbose
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b297e430-f3e3-97a7-be7d-1debdbcb0119@suse.com>
 <ZUDEGqGBjKWpwY5e@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZUDEGqGBjKWpwY5e@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c779883-e4c2-4400-8c23-08dbd9f6fec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qLTSFVmv44qe8fUOe2HSY3d7xOTiDuRcB7m8B9lLrAbfkQ5hkBLgIGQEJujriFIcHX5ec3RK7ZzGMOXunfSqET6SCGKtbJ2tXZ2DbVAZSLjfECuM4E04JMWlrU6V4hjy+RMtJt4Y+cIDwLgfRQJ1Jq1d171fiimyCn45fo3Z7QqwoRE3TKoBYvPQqjANZ6zBfRgEiCN6Afnamt+qToOrOamyVovtxXkzsphxebwPOyFXV2TSat2bIrurDHNUhjGW1PjS5/Cls+jezjugH4DtMAOYGlnJ0YsPy7dYtkLzjRK09flPH3b+Jm9ZVW0er15nb8HAT7t4TMNvTqVynsHGz5cmnnu1m/b9lFWAiNUJTyesxiJlhDO+7tFYMtSQuPzB60JUKCB9wTuhS9fxbVYCq59RI80ppwcJYB6VK2cWRFc00Oo55kHtew8qqPWy9nUENOflMxaelpbdRyxKZs/1pNi11Bc62JqS902TchG2gzVTG1qYMNUOuCBvtjiqsNa5+gST1chDhOV4+cmeu7wkf9oN4JHuN4Wy6L77sLdld7+Ocn6bozmJgtyR8e9a4jyat7yshZActCwp/hnw9eHAMANPYYczTt7E4oEIkReS0MeiQ5iRE4tB/gCw2nM0LtzD1S23hO2O6Cff6F7ifdLT2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(26005)(2616005)(6506007)(53546011)(6512007)(38100700002)(36756003)(31696002)(86362001)(83380400001)(66476007)(66556008)(316002)(66946007)(6916009)(54906003)(41300700001)(5660300002)(4326008)(8936002)(8676002)(31686004)(478600001)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHZPT3d4cHlocUlsM3ByTGlSbE1wdjF4SFp2RUE1S2kyaWp0T1luS083NGx1?=
 =?utf-8?B?d1BxOGcwY2xKT1RIaWNkMHFJdVljaURMU2M5L0JSazJkSWxSWEZVaDJsSU4y?=
 =?utf-8?B?YWVzc1JJZ3FVVVhRWE9EUmhuUFJaYlRrSGxGL1NyaEJRdzMwNVJKTWc0bWRp?=
 =?utf-8?B?Mk14dDhzRWJaTHR3bzhqaDZIUUVBZmtmSUtUUTBJZkhvVitua1FuNTFMamxJ?=
 =?utf-8?B?bmV0S3RuOEI3NVcxdGMrbXVzN2JyUTVrc3NWVzRObVdCcDU2UGhkK1hDbDdw?=
 =?utf-8?B?TjhhQTkrMGJ1eVNZNmo5ZmZ6TTY3NXgwcTdqWUtiSG8zVWh3MENGeGlqcWR2?=
 =?utf-8?B?dzRodnpTVm9UcFVESHBRdjg2dEwzaXdXSSs0TnA3cEZFb3pueVhjaVBla21S?=
 =?utf-8?B?ckI1Mm42dytoYW1WTm9rc0dsRHMvQkVIM09zUHA2VllPY0J3Wkc4UHlBVkxZ?=
 =?utf-8?B?QXV2YnNyTGMranNYRklscHA4Q2tNZVZxOFJTRWQvT2VzbHVhTk4zZkp4dWxU?=
 =?utf-8?B?bE51dUFIRnhCSDNUTy9iQVRra0U1d0ltRnFsOUd2WmhsT3pwTkNPaktmZFZI?=
 =?utf-8?B?ZE05ZDdRTm1Yb1ZQN0E3UXovVVRRZkdTM3ptZGxXdm9JajhXQnVrMFlvanhl?=
 =?utf-8?B?QVJKTnNDZEtQMWl3Snh3bitMb1FDTGFvbE5OOHk3YitnWEZ4NFhKR3M4bVdl?=
 =?utf-8?B?RkpZVmYvQnJTUkU1U0l4L2hzekM5QmljaytzNm1ia0hWMm96RHpZOG9yeFpE?=
 =?utf-8?B?aDJxY3Z3UzVISFZSNFQwOGVpNzg1V3RMY1JuSEJkdG5GdlNTSWl3UlFRaFJP?=
 =?utf-8?B?Q2E1TE1JQzBYVTNndCtRaW5jVC9lYjM2STVwWHJTVitGVlpwMjEyZzBEbTF6?=
 =?utf-8?B?Vkt2eDRxcEpuanpDS1VpQ21NVnE0a3FTbm02cHc0TXQ5ZVVFVjhxUjZEaE0y?=
 =?utf-8?B?L2gzcXJ5dSszTlJvRDU2QnRBUm9BNlF5YjlUUGtCYVRpdm90N2plSzhJTVdZ?=
 =?utf-8?B?TzdyTEI0emJsQ3JlU3VRYXozRmUyNUpNSFh5VGxjL3dLdzh2eXExZFpCMkdN?=
 =?utf-8?B?SWJTelpmVnVnWTdVVkh5Z1BLNzZ3aFRhMmU2MU8wZTl3YndpQW01dUJtNGho?=
 =?utf-8?B?V0JJOWdsY1dUQXkvRklJclNzMSt6UTFyL2FHTTdmdi91amZoanJmd0FDL09V?=
 =?utf-8?B?dlRqVW9jTEF2MkRLZmV5Uk4ra2d6V0NkSmcrNFZXTWdVYXIzcC8xVXdSalZB?=
 =?utf-8?B?Mno2WGR0S05IK1dPWjFaajd6Zmk4YUJjY1VKR2VjenBkYjQxQVlnZjVkTlJh?=
 =?utf-8?B?dWVKR1pTejB1b00wNVdjdUlFbXk3RE9iVUxsM3ZLU0pNSE5PNFJKZkt4VTBx?=
 =?utf-8?B?WkY0bWpWR3NrM2E3em5lZmRVVWFGRmFGZHF1YXhDaEkrdHp3cGM4ei9TQkZK?=
 =?utf-8?B?OTNRa3paT2tveVMzNTFZZzBEOTZYOHQ1MXladERKT0daTnlUcmEzOVlNRk8r?=
 =?utf-8?B?dUZ6VVA0VWdZUnJsR09scytnWmtCNGlwN0MxOFRlVlIrWWlYd0MwV1VXZWhY?=
 =?utf-8?B?UnN5L0FXTnNQQm4zbDg1ZVN1dzlJWjVXcDhCVkRvMXJNRGM1a1FFSGRuL1lv?=
 =?utf-8?B?M2JLMTF5dEtlRmZXQ0pERk93R0QyODZMS2VjeHRIT0MyZkZ6ajhUcU5yL1VG?=
 =?utf-8?B?NUdGOVV6MHVKOWRmRlQ5Z0UxTFV1OUtsNjJ2RlV5RzdMRDZZcHZSZ3dXWUY1?=
 =?utf-8?B?Z29LeTNrN3RlVzdqOUdKZjY1bEtsTytsMDRuUlhzVUpFY29SaE54bVhPQ0xs?=
 =?utf-8?B?OTFLM1hGNXdUUnEzT0RXZDN6S0dVa2xabGg2Vm9QT1NhRUNGYXJveDRzY1lG?=
 =?utf-8?B?cWJlWHpvSjVPZEMwOTdIM0lMUVVaRHpRMDV5eExSakpsWGR6SVZCOG5pTFBq?=
 =?utf-8?B?VE0wWHA0MXQyYm9SMjR1V3QyMCt0UUdvSXhGUGRkS1VFRDVpQTRKYjZJRThB?=
 =?utf-8?B?VFlsS3k4ZVBOWmZ2UE02UXJYVmd6ZkRiOEphdXgzSzlqUlR1U2JuaXFINkVU?=
 =?utf-8?B?c1QxbE5KeGxqak13UlJTTkk3YWNvYlJVVlpzWXl2dG9uNTRpQjlGRkIxSVdn?=
 =?utf-8?Q?b+wMzqcYe9ePS1gAzgLncvakP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c779883-e4c2-4400-8c23-08dbd9f6fec6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 09:51:46.4184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1SjArL+uucVHIP/QLuE8g4M8DKcPHCYAGcyNgtgpmp9ypXH1Ve91fVjO04SDISxTM7d0NOwmjDx1DKZYle/NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9065

On 31.10.2023 10:08, Roger Pau Monné wrote:
> On Mon, Oct 30, 2023 at 02:14:44PM +0100, Jan Beulich wrote:
>> VERBOSE had ceased to exist already before the introduction of this ELF
>> parsing code.
>>
>> Fixes: 62ba982424cb ("x86: parse Dom0 kernel for PVHv2")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Some of the printed information might not be relevant for PVH mode,
> like the 'ELF: addresses:' virt_* fields.

We may want to conditionalize some of that, but since you mention virt_*:
Just ahead of the printing we forcefully set e.g. virt_entry when hvm is
true. virt_base, otoh, is pretty clearly useless to log, for being set to
zero unconditionally when hvm is true.

In any event, what I was missing was the output from elf_xen_parse_note().
I had mistakenly tried to boot a PV-only kernel as PVH, but it didn't
occur to me to check for a typo in the kernel specification in the grub
entry. It was only the sequence of ELF notes that finally directed me
towards checking that ...

> Note also that in 62ba982424cb opt_dom0_verbose wasn't available yet,
> that option got introduced a couple of years later by 525ef6584f852.

Right; I've set the Fixes: tag solely from the wrong use of VERBOSE.

> Maybe it's 679216943f545 that should have also switched the
> elf_set_verbose() in the PVH dom0 builder to use opt_dom0_verbose, at
> the same time that the PV one was switched?

Perhaps that would have been a good point in time, but here we are.

Jan

