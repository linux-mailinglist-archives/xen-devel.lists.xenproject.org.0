Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92C5B146A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 08:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402681.644524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWAkK-0006lR-Nf; Thu, 08 Sep 2022 06:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402681.644524; Thu, 08 Sep 2022 06:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWAkK-0006iW-Ks; Thu, 08 Sep 2022 06:10:40 +0000
Received: by outflank-mailman (input) for mailman id 402681;
 Thu, 08 Sep 2022 06:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWAkJ-0006iQ-55
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 06:10:39 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f51e9062-2f3c-11ed-a016-b9edf5238543;
 Thu, 08 Sep 2022 08:10:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4498.eurprd04.prod.outlook.com (2603:10a6:208:73::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 06:10:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 06:10:34 +0000
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
X-Inumbo-ID: f51e9062-2f3c-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC5TB9uodexcVn19jl0aIqpuCF5L+ccaLnCIJVsW8/YUSCYd1lBAnqj/mMlXHtI4320TsyFANsOYzI1a5CA04BVXaIOdmtSiv432wrBHQkm+AirPKXC2GcgyTdVPCTRsnWbTZCjwClYwDyeCql0HY+EiA1jch4SVwahGbawliCEIXJhrM9aDQYL4A6P7JOFD09vMyZm04wnrfNlM8FzCnu42EKEI6pAzJj77ofWEJe94b3COxC4R+tpvsAUv647TwzCuFCgEOgWgnAB6BBFOzJ9pFoAJ6AJb/MylFPRuQa2oz6+Dwi1xzDzw5R1g34qc2spSNKihYuTsbhha1DDcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEIQJaQYbMvzCnrPv2PapYeeNIVdjAbWOsuFpT9auG4=;
 b=CCZnhpWOac3SpLIksTSACDQtXFfzx5eDeY0atBwAQ58KJVBt0vYcQmgB24OgV6SWzHKdcMPFjOPSzAiyGsSgsqmgPSrxIupLwzN4Y4tfnEPZHZnZA47Punmmyq3AczkLnpnmOMEvOX2v7Rd7au04HUR+XfcmWfzSbfdyXn1KS1glkk5hJ1bew09g4USaCVphrUAmeaNHbLMyK+EJyb642mtL85AbuAEcw0LIkx7LpNGyp2/+BlRa4wGLwtdvEvg7EmYnjI7XOy+q9ytUXLdlsdhc5LiRppWPrFEwsUgmf0N6A+crXOoL00GwRZyrJ+6aOspdd26rO29WFwlDSmfALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEIQJaQYbMvzCnrPv2PapYeeNIVdjAbWOsuFpT9auG4=;
 b=AvxstKcDa62KN9OgiUZwTTj9Y0PgvCxbI3kK7BuH8Ious27px4TzrR6khi/J+r1vdpbRgPxWItTi45cpPWvq/prgPrd0G0DKw8bULjoILL9Y0J+GWsS9MRntcc07otxcwa4ZwWwpRb7dSZEOxzf0/9WcHsHOmmIxyh5FPculhs8SPfEZHduUjgDMO54TOiyZsZHLTY4+VNEVTYstlNYUqBHVdMU1OM789jKU+7gvFkW2fc/73RCSrDM1nXP63zlGDcS2qyTQnvFczFbmX9t5SEAVeGAaLb68/AJhKvgRz4CZ6WseZB2ouCGCkzfd90gIu7dzSGrAlUh3VyPyk64KMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08f233cb-0586-1845-fd67-030eb8c4373e@suse.com>
Date: Thu, 8 Sep 2022 08:10:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] Config.mk: correct PIE-related option(s) in
 EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68173fe3-b3dc-224b-c30f-719efa48fcdf@suse.com>
 <bf2cc299-6de5-42c4-2711-c13cf59fcae1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bf2cc299-6de5-42c4-2711-c13cf59fcae1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB4498:EE_
X-MS-Office365-Filtering-Correlation-Id: e63d5c2c-955a-431d-a1cf-08da9160d76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lmvVqJepZhl9f6b6EXEDMJSh28CR6IL9wQwdWc7Kji5E5s7AFZOsG3CsAe1vIO0ctVoMe9A88RWMn5UPFgIgmplrRsmLUcm2F+Cjvdq1TIxQ9LH1o0+uutcUqqaAvHQoBDoyOKyLE95GeqdiEJcJ4q0V0LM1wRWVgW0oDBqDeCPemFMI2XaJcfA3fr30MBuAUD+5Cuxa4iwAntkeGZ79GGbwkcDNNS9OgWbih3BMpGwqAeWyCHz2jm1b1yRN+s+gw+5i0pXSy7krtuXVCv7pXgDsQieSM/kuXPikIrN4TveDpptqjHrSoh/srKKuFTex39uhNYujNz6XqbMZMUUT/lm7whC3aTHxkr7C0CmRdmwRJRlAOcJhcQ1686e6O2GgoqzOomdheSRGAB1XoH21RUeHlwUmYuzwc+OhePaTO0j2RSCORCLH7TmUzDgSx168g2BgFK2o3D0nlBBgq4Uec5XLUoZa3hoLIgg3KVopKnY2SF7coESMOEXj6Gftlm4NImNP9L0Q2Qol2/hHGwhQTBpHgibFqgQxfEfLNW7qKZfx1AAFy84f2Fk2L8KojPzTYhGrHRDJzf/ESNj2plYgFVU4+9zShSj1Gm80LSUYxKl8qzfIk2uobAwThFIN8oj+jY6aoVd+9vxOdU79O5j5kB6djbuWOn20hDJJuAACHK4/+74bjUnSOXdQUsK7GuvxKsCGuw7CPsJ6vgCLxUO8/7l/bMudeBbx2oLUVG022OIg3gMWRoXrR5odra6AreBXHvN2knsJBD1gYDODggFNzxmIbWr+vTY6WvVy/6Vhdng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(366004)(376002)(136003)(6506007)(186003)(53546011)(2616005)(478600001)(6512007)(41300700001)(6486002)(31696002)(26005)(38100700002)(86362001)(316002)(6916009)(54906003)(8936002)(2906002)(4326008)(36756003)(66946007)(31686004)(66476007)(66556008)(5660300002)(8676002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGt1Y1lDNW9aSmFLMWtDeHpaME5oUWRxS2FYU3RVZ3VDODhlbG12eWVOOFNo?=
 =?utf-8?B?emwvaWhFZExFNXVhWUIxT0xXVDk0SHVyRElVOEdoVTNWdkthK1gzdU5IVTRk?=
 =?utf-8?B?QmpGUDdpTlZHSi9kOThvMHdRa1NzeGl6dGxwN3liQmlCbUhOUDZaVldTWS8v?=
 =?utf-8?B?UUhScURJNDgyZXJYUnJnZFNiSEhObnZWdFFzUThrWCtpVzFJcTVlZktGUGZU?=
 =?utf-8?B?SWkyZENCRkFsZmVwQkNPNXZzS1V3MVdYbExJbHhIYi9lVk8zMTRsU3lIVWxS?=
 =?utf-8?B?L09ibE1NTzBGbXpnaUF6bERPWEFnQTR1RnRCY3ljRDNWUVdZaU1KNGl4eWpZ?=
 =?utf-8?B?a1MrVkhJY0N1M1VIUDN3M3FoNWpydDZ3YU90aGJXYnFkN1laSmRJKzBsRTlx?=
 =?utf-8?B?YXJUVEVNNlA5UlQ4YWdWcDBHczhkUWY1eTVVUDJQNzVRbG8zZ2pHUDJjOUVR?=
 =?utf-8?B?WHUwbkc2ZG5vT0h2bmJCS2llMHNyUHozc242UHI1U2FtaXU3SklTOXg3bk1T?=
 =?utf-8?B?M3pmQnluV1NxWDRaZFNHSmtmamVwY2dZSlUyQ0VQd0VEWEs2aDZCek52eWFw?=
 =?utf-8?B?dnNZUHpDT3NQd0x5eXZpRlhOWXZua1RlK3ArNkhOU0xJUUNqVDRoN3ppM1Ny?=
 =?utf-8?B?QUo5bEJnZDJJYTFoRDJaSzZtUk5wcjB3Mzc3bHFsM1hxSTIyS090Syt6MFor?=
 =?utf-8?B?cDliSG5FMW1rTW93R0I5dkFFdndCS3hxbUh2VTY1c0lyWFpTVy9vS1JNV0dj?=
 =?utf-8?B?UEVSWHNmSXpxdVovYmsyb1lBWHF5NW0wRXRxWlNPMG5sT3dlckhuVXZlT3VI?=
 =?utf-8?B?d21VVkMwRkQvVVMwdXRYcURoZzlCSktvVGRvL1V3RU1ZeVhETUgrVzJ3OWlM?=
 =?utf-8?B?RjdQZTdUTVJ5Q1AvM3BjWXE5ZXRPV1lhVEFxbEljbjg3NGk5RGtndmdQK1V2?=
 =?utf-8?B?aDR6eE9qVTFSTU5IZWZaelhoWWVRYnlUTGtQVUxxU0RYRlhkdWpuN1RBLytJ?=
 =?utf-8?B?QWtyRVdoSlppYjVpaHVrbVdlYVFKNkZsdDJDT2NZOVYvRlFXMnk2L0EvejN0?=
 =?utf-8?B?WnVxb2x0R1czMTQ3VWt3VU56MUg1TCtTWHArZHR6U0haYlczbTEvSlgyQTBO?=
 =?utf-8?B?aVhEaGhBcTFQaTdCL0NrSFIwZnFRdVJjSldVcnRDOW1zZVNzNFZkakhSYmdQ?=
 =?utf-8?B?bVIvTllFRHo5bHVxekdBTE9EblVzS3Q5RmVMcFpETkphellRcWhDUUUwYUJR?=
 =?utf-8?B?K0kxU09heG92ZTFwaEE0SHZFMk5DRTZGaHRQdGhQc1VRRzVyZUlpQnNUYnlx?=
 =?utf-8?B?bWJjWHZzZng3VDNyS3pVNm5qNmV4bFZLSTZYQ0ZROWJpSnZwQWxsb2dDcnMv?=
 =?utf-8?B?b0gvelJ3eHlxL2VDNlZrbGZoTkFCdFJNZldzQmFxSzVKMzBWVEdvQ3RPZU5X?=
 =?utf-8?B?WFNHaTVHTS9xRUhYS1FGdlE1RGkyL1BpdVFtOU9HNE4xMzRMWWNwSHp1TVlx?=
 =?utf-8?B?SzVZR1ZUNVVLRFRrRWpUNzVJYk1rdGhCYjhxUUt1Q0JUSU9ibDN4Q1htdzdO?=
 =?utf-8?B?OFBWOWxLV2FXOEprWnBzUzhrcFplR3NtSzhiWSs5YnNOM2ZlclprbStkb2h3?=
 =?utf-8?B?ZFNwNllFZGxIU01VWWNqNE83RndVZVVmWUtDYklPVHpmOHBBY3NucU9KTVJL?=
 =?utf-8?B?ZlIrb0txWEVFU2k4UmFMU2NkK2VHUkRycXdSNUZGR1NEaGxGS0tkVDh5Z0tT?=
 =?utf-8?B?RHVpZnFWTlpWbDN6RU4yQ1o1VzZVTDdueForLzM0QkxxVDRsc2lGcUNuaG04?=
 =?utf-8?B?eWxUR0VsRmdGckNTTkIwSWhCQmc3dG9XYnhOM3IzUHduN1BmRnhiMmQ4SXlL?=
 =?utf-8?B?cnZmbUR6YmU5czE5Z1BHT0tVM2tqT3JnNkQ0a0ZaZS9ldFFMVjRhTDNaY2Zm?=
 =?utf-8?B?dDIxRHQyVFlJQ2QxWCtXdzc3clJIM3RCYXFrMmlFSGthbFZDeGwxd3o1dGxW?=
 =?utf-8?B?NlZNZXFVY3NOMEIzcXNEa2dGK2U1cndrek9UZWhWaG11UXpDeUJ1U3ZNK0Ny?=
 =?utf-8?B?Wm9NSjZSOFNRVGtLR3lHNHlydjVRNVRyY09SQUpVUy9kc0pCTGpOR2NEeFk3?=
 =?utf-8?Q?wp6AzUyoJze8yQlsGKFL6wlVp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63d5c2c-955a-431d-a1cf-08da9160d76d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 06:10:34.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBysQurA0RtYutz6ligWoUKCwwl5ATjxzbuF3bfWyaZTa3vKLm09P67C+7ibB4ajD1iEpwqECi2YY+759DmyKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4498

On 07.09.2022 16:33, Julien Grall wrote:
> On 25/08/2022 08:17, Jan Beulich wrote:
>> I haven't been able to find evidence of "-nopie" ever having been a
>> supported compiler option. The correct spelling is "-no-pie".
>> Furthermore like "-pie" this is an option which is solely passed to the
>> linker. The compiler only recognizes "-fpie" / "-fPIE" / "-fno-pie", and
>> it doesn't infer these options from "-pie" / "-no-pie".
> 
> OOI, how did you find out this issue?

By reviewing Andrew's "x86/hvmloader: Don't build as PIC/PIE".

>> Add the compiler recognized form, but for the possible case of the
>> variable also being used somewhere for linking keep the linker option as
>> well (with corrected spelling).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan


