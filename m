Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A0679E19
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 16:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483607.749859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKLh1-0007Hy-Qm; Tue, 24 Jan 2023 15:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483607.749859; Tue, 24 Jan 2023 15:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKLh1-0007FV-O6; Tue, 24 Jan 2023 15:58:39 +0000
Received: by outflank-mailman (input) for mailman id 483607;
 Tue, 24 Jan 2023 15:58:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKLgz-0007FM-Dm
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 15:58:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f383c12f-9bff-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 16:58:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 15:58:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 15:58:30 +0000
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
X-Inumbo-ID: f383c12f-9bff-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sdi4oHl07HOxj8Ea0KoXAXtrm/v0J4AscAm+AnLeq7+VrEsO3PrWwDzWJeLO0EC1+Daflos+xxDKNp3+uHnNvWBKl6g6rpeoB0hqrahcBj99X9gsLiFUkGL49b/AmSmUWvYiHI0hx77amBtPQahO516yu6sq2eXLJtm1+86+YD/7ot9A+YCtBIuCUlwfwmx3mguhSbC/y4kJk7JGuC6mun742fxorp27HPPnW9036y2OVnZibMzwyF/ix956xIt4A76fqIEHWB9OckuZfxRdVg5ZKt6VHreqA+pKowZM9IZo+zYUuHyzKf8zoHmnqTVn7SYdb4A9HOPVHWP5rjP+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7d7ZlAm2BxCPrIvK1TvA6JtRrtUwPvml/FrnjP+me0=;
 b=gA6G6DzCAF3vO85q3Id2T29RKyC+tIU/hbSC5GWrS9KSnulDh4nd8JkRdd0fUecLko819OJRbAi/73EtoMyfY+XqtwELBmvrMYXtTKswV4btrUgAxRnIgUH0O2BC2bR00iCY3pb/9cHibFei6u45uBVzz5JInJCAjH8uj4RrWcUixPjd8mt6Cc1KdQUk1OFU66L4SZdxBnY+bf7ORJf240FtiVP+HgntxLm8O2QOZQkRZ9u7tskV4UwaACXitnlRskciZOWAyD9OBIuGDrCT6zUW/7PtkuebfAHwSFWGAiUCvhZ6R+q/3bOSpPMCuTstGkJBnvRBZZ6WwbMTGb6YIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7d7ZlAm2BxCPrIvK1TvA6JtRrtUwPvml/FrnjP+me0=;
 b=QCK8cebgr/ZZYsWmRt9WyC3VQv2s+lpMfGiftZz40wyAWEmLB7iekrvnSaQMBkHRPbo28RAVacItHCLtJ0BXoamReTRvQqG57flXP7tAnw9eeOsgWfSXinYe0WRASSD81hiRmqmXcTd0quux09eOAPmAdHHnK64V7Ry1wVOWQLvw1msPIuVfgrH/CHrbDJERCItPHk3GxCwa+dK0AV0iRfX4CzxzioN5xxx62XUM6cOn4cMicQ5RvlcLjTEACE5eh1vyIjbEN72sMaCtoFZAkQL7i6T8fmdzjFtITsgVrEtEOZXAzm4ytR3d74x6kvoHKG/Z6xw2NBSvVu7DJqX+4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06a46a30-88a2-2cbe-1c99-7f700e469160@suse.com>
Date: Tue, 24 Jan 2023 16:58:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v4 2/3] xen/drivers: ns16550: Fix the use of
 simple_strtoul() for extracting u64
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 xuwei5@hisilicon.com, xen-devel@lists.xenproject.org
References: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
 <20230124122336.40993-3-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230124122336.40993-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2365b4a4-c460-46ca-1288-08dafe23d605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cEN887Z8D3FQpZfBfbteZkqicy5fj7pF6mm4NOTktLLC70mjIG6DO4qP9sXX99lLvdVRZ6ijUdNlHcuHTk5Lfjg32QmKGVb72/WUMO8Jf7SS56AkiF3agQwrBrp7OvgxnjcSAf5PiB3jAwrX5YUfIZADUSDf3pod9GOQhpsUL2FF/hnILE9TrfAuUuaShVkDqF8oOhuCbGXd/XeSwTOSlV5x/JB94NcavtsG23tGBKA+g6IrSgpwvffWWysr7QanSW/PlBYio8XbUjLvsDDG5nnOZUqjJCyKk+bfui6cLuJiJ5W+co76SP6d9Ta+X8wHoGZitK2FPNkWphBCH+Y0NGKPhXFiXE2NFZeiCDc6OBafrERH1UTWEm8Z9+4TRMGP3agGShyxrtLA37VFobaD/liR27/EMTjQ0Ihp7juiXrJ3JyXnWtYXzYty2dPlbTIW9tmdfN2JvO3G4nkPGYzPF/h5cNERfkiBlY30Ww4iMoZ/N7AlaeZFMkvZlo5LCOESHWp0VO0O7ydtt3l5rBZf9CYTkDBJDT7G6XwumjiDUGiwN856KrMYBRtmUTdGD4mZiU/yWsh0xX8HlCeC8Mu/xnVAXmbJ3kN8BebPPLjZ8S+FZJErQPDfwuPXIDgANHaetJ38QlFb7QpgY3PQuPFvtcmgv5wA0gzrOFsJEoOqr/z1cJm+L+V3rXPq8rWggCaY5nstnwPwGT80T6e0yGC66ofLYN8lRx6clkLUBfZJyMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(38100700002)(5660300002)(31696002)(86362001)(7416002)(8936002)(2906002)(66476007)(6916009)(66946007)(4326008)(4744005)(8676002)(66556008)(41300700001)(26005)(53546011)(6512007)(186003)(2616005)(6666004)(316002)(36756003)(6506007)(478600001)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDJlMmo5MHdpREFVUmZaOVVxSFd3WnFYRUVXVlBRbFJQcS9WaDNmVXBVWDE3?=
 =?utf-8?B?VWFRWUpVM1JUdHQ3bHdWN0g2SUx1OW1vVjRsRG1FeHoyTnRTODgwTDdZay82?=
 =?utf-8?B?TDkydW5kU1ZyT1V0K0xjR0p3MEY3OU4reTh2RzBHc1lncmhqMllmU1hJS0dv?=
 =?utf-8?B?dWdjS0NGMnl5RDdld3lYNmNzZi9QamprOXhSVTJUOUVydUYrUDN0d1RrT0Jt?=
 =?utf-8?B?bnhiT0h4cVRYTVpxWk1uUTliZGlIeXFSSUNEV0t3OVVxclVCbnhnZmdEeDZh?=
 =?utf-8?B?VTFIeTJGTFBOakEzMTRiMG9nZ004OEVEYWF3Mno3Y283bTUyTGhTbWMzR2xx?=
 =?utf-8?B?N0Y1MjlKYlNIVHZGS1drc1RDTW5tYVVabHp3eU5Ca2NOQ1FCc21sSVRrQkVq?=
 =?utf-8?B?YjQvR1Nzb1Y2dTV6S2xudUZlK3B6UlRjMUY5U0cydzVBQXJucExuR0ZaNkg1?=
 =?utf-8?B?cUg0TDhuaHBnZ2RXVkpWUERyQWFVZEtFek9JTXRXb21LQ3FrVU9XY29lbGo3?=
 =?utf-8?B?TGRYenhaN3RNY2dKODl4cXlpc3Q4UEdYa3Fad0RHMnVPTFB5TnpEa2libTZT?=
 =?utf-8?B?TkR5amxnZ1hWSUQ1NTc1N25hdHNsT2d4dU4vcUhhbkl3cnhQWjhacjdtZ1RO?=
 =?utf-8?B?OFNoOEVrNDNPME5ZVEFwZGk2UDJ4STVlOFU3bHh5Y2Z4QmEwN2xRbjE0d24w?=
 =?utf-8?B?OUpjeC9GZTgvUUZHNHU1T1IreWZyemxsY2JUZTFOZlE1SW41YVhuam91U1Iw?=
 =?utf-8?B?cytOTlhlM1ZGdFRoVkMvVENkdnAwK2QvajUvVlN2cmJDNzlxS2JiR3pid09H?=
 =?utf-8?B?K0o0K25UWVNVbnl6NXpTNW0xZUdja1FGZ0hKMzA0UmczS0RhMlhmajJPWmZ0?=
 =?utf-8?B?dXdBUUp5WUJjY2pnTE5NZ0Z3Z0JQM2svVjlHTk0yZEV0aUk2M0dSaFlFSWND?=
 =?utf-8?B?U1B0T0VmaU5zamd1N3AzOHhqQ256eGFRM2s4NTRVZDdvWHMvb2lBSlVGdDJP?=
 =?utf-8?B?WE84ZUpkV0x4UjZwMVJMVWI0TE5OZ3F1Mmp0enZkYktLM1RwZ1AwVjZPU1Az?=
 =?utf-8?B?c3E5bTlUZ1Zidlp3NDJXMytKbXBnZlhDNXRkS2JhQjlQYUF3akhYSjBET2tv?=
 =?utf-8?B?YUJSWDBwRkEzeEo0dUhyWU1KbWJuOUlUb3dHU2hRbDFhSGhiK0p6b0xWU1M5?=
 =?utf-8?B?N0hwazZhSGJ6MHNTN01OT1RXSnNnVVBNVEdwRHpDMXlwNXFZSExBQi9BYlRW?=
 =?utf-8?B?K29sMUJ1Rkk3UHhIY0JCZlpTTGV6NHlXTUNuNzNyS2p3SUx2YmtKcUQ0SGhK?=
 =?utf-8?B?eHpvVTNnT2RiQU9Eai9EbTlSdE1Bb21qNGVpNUdIZGV6TG5lVWNxbVlMaFRJ?=
 =?utf-8?B?dTRIeUtDa0hzM25MaHFHNlA0NE4yMnlxMWZBTW1rUUhldEFLWlFBZHJsbEhk?=
 =?utf-8?B?NE15N29CdlgwRU1uTW9XdDZqUmJZZWxXVU91My9udjVQaXYwZ05sdTBBeWVD?=
 =?utf-8?B?L29HQTJWWGRMaHNSY2dNMGtlU2ZIQlFsdmRNaUtiMGsvL05xRDlZNHQzQUJO?=
 =?utf-8?B?N24yR3VpamFrSnhpempGT3IvRkJKazZaNnNuMG11anppcGlWU3ltVEFGdVFh?=
 =?utf-8?B?cnNtdkNySW9TazNJS1hsaC9DWis4WkprK3cvNVJaOUJTNmpTaDdpVEF0UzJi?=
 =?utf-8?B?WFJodTR1WFVmdFRlSXNMdnZOVGNRQzZlZ3BBYjZKeU1OVk5aU1NqeUlVSytC?=
 =?utf-8?B?Z2FnMHZnVWloN3ZnMWozdmNrL3JxdCtKMDFDTXFIMisyMWdtQTVsUFp3Q3FY?=
 =?utf-8?B?bFlKMmpsZUtlazFrQUNWQk5iQ3JBWWhUd01tVUZYS1BaY0VTcE1qbUlZakl3?=
 =?utf-8?B?N3VBdnlXY2tJTnV4ZzdsL3VrWTdub3FiKzlyU2k1S3k1aW94L1dvYVJpNVM3?=
 =?utf-8?B?d3M3NUVhbUx2ZUsxSmRXb2lKeWx6Ym1aNm81bC9ZckxMcm94WWRCMnRLc2Rs?=
 =?utf-8?B?NzhJaXh5WDdRUk00S1I0Sm4xTy9rTmRnOGJ2WHFockRmV2tZZ3JIS2U3ZmxU?=
 =?utf-8?B?bXdLRktnWjNBaHltMVlVR1dpbTNndTZwTEdrSlI5MDZPZWM1cTMwMFRrZGY3?=
 =?utf-8?Q?68YWg608oGqz/TVSUgeELVl/Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2365b4a4-c460-46ca-1288-08dafe23d605
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:58:30.3375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D544z7uvp9kALrUo2FWwnrV1Z2Ki9QVx91ueVwjUt5S1uJW8UAhoPvuJRTuhYLbrrI1Jur2wtIfYLDz2embQrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796

On 24.01.2023 13:23, Ayan Kumar Halder wrote:
> One should be using simple_strtoull() ( instead of simple_strtoul() )
> to assign value to 'u64' variable. The reason being u64 can be
> represented by 'unsigned long long' on all the platforms (ie Arm32,
> Arm64 and x86).
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

While committing I've taken the liberty to replace "extracting" by
"parsing" in the title.

Jan

