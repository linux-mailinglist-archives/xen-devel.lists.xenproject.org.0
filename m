Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AD27AD195
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607659.945935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfxn-00074w-D4; Mon, 25 Sep 2023 07:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607659.945935; Mon, 25 Sep 2023 07:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfxn-00072K-9o; Mon, 25 Sep 2023 07:25:03 +0000
Received: by outflank-mailman (input) for mailman id 607659;
 Mon, 25 Sep 2023 07:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkfxl-00072E-U6
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:25:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3238628-5b74-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 09:25:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9664.eurprd04.prod.outlook.com (2603:10a6:102:262::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Mon, 25 Sep
 2023 07:24:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:24:57 +0000
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
X-Inumbo-ID: a3238628-5b74-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8ePyQc/jUT+sTKQ9LcdNRqzMPPNBto9137x2A7GUKApI7n/6LigPh9lWsJQfuJlPdlrf0gUUAQTHHaH7j1RoaCEe3sPMktsArNgVG4nE3QTcPD6xRK1KGFAYefllM8XBImezo9mTitRevHMRq0I22CiaefA6gu484+J56Dj1maL5pnIytmKQ/kPeclAL/sS8hyasf1GA1lnXuImZDTRPq1ZJXiSR8cooRY2pfjPzFu0p/Um3+5KRv1mFIhUhxqp+EKymiSIsFqWVYd1Mpq4KmK0F507N6yM3Maw29Mfsg9pkC+2QjeSDUUlh0LNfUt9got3EExYJJTsKp00GAFCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rokn5+2NoE/mwy3A6w2MzIGLg8rvq5FjMrZQD1QLEys=;
 b=M+H9WRyXFmNO/u3ghK2pJjBSVR/bi/lTK3whYxou5WglffpQO/nARiMVpMUwte5Keq8lBUPMIOv3eE3P+1VraHhecb9h4b0XclLu9ngkb3Ve77QpO+gt/eQen2cjbr/dQc18pvyKYeKyHGNv1Ip/A64k+LTi/T0VvYmIqPu43WNWXe5HZOUc2msWXzop0y/8kst6wLBWEneTcUwgoSReo/Jki42h3ehqmTWEVuOffhiC0ov9xZ+dUPOd2e5xWJQlt2aHeIozzof84MUnE7LAgzN3FeAT4OW1aGJvPBrCsa004SfbuoPIzO0Vm3Ovx5X3xeJkY+fQC9L000jxYJE+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rokn5+2NoE/mwy3A6w2MzIGLg8rvq5FjMrZQD1QLEys=;
 b=IHY+o+NlGkBsQqihN7AcHQUZy4BZl1Dn6TocuMggR48DBXf0Uml50IKZu35jNYLJZ8Vpvbv2FmP4ngE9LyPSKgZNn/LcwzNoRvc/dPoHAtctry5Tsajk60pEMaOjNw59U2+rZygElVrM8AAbZPZSrSIedVjlz5LmQndPRJ9MAsOIwA9ncqCmz+llpHsl1oO1Us9RXK66umm0zswe2eVqFcjlZfo36p4pk54ECf0t1nJO4++Zvi2fIeJUYRXNfYqSs4PWemdqHMUG5XTJga0ggeEqya80Jzfk/wS51qDd6m0AUUsn6TT7+0XZYGcE7ybf6Om2opCqoPCMGpyRuhv2Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com>
Date: Mon, 25 Sep 2023 09:24:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9664:EE_
X-MS-Office365-Filtering-Correlation-Id: f84e7489-217c-4b31-686b-08dbbd9885a5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YIxDzzmnnznvloNDItdITnNrXNbR3wWA0dakcixw5dFBQSTC46zfHCk1TFedijYwWGB8CsoYM83L0/H620Ckucb2qowMYOclI4JGClza5YWrDnIxO2MmL/zHHAs9IXxGQZnQqaIX4h9vFLp3n+2s4tk+q/67uSpavXlruYJ6bwka0x4qboyQLVsxihmJlIgq7aSqy5sf+AZ3cErHatQYkfNN/L27wQx163pneREvn3Yj7oFJLDbIeRsY5m0h1T54m4uZKTn+73BCczYmsVZryWdgb4PCSy5bI4e6sdpDx1oe/R5//WU/XrGQkxCPgLaFSUnuIKZMgFV/P1iyxu+3NfGpPXlOSd7Ap1lp27S3Ns5S+BY3mADiOKoYnYr4Qld0Kk1l4V2So/AT0aoJGEJvF47bevXH6CYN6MAVVEm6W9zgZv2s863y9/ECmRranFELFpVhk1+Hs9mUD2HkXkrta+Ao/X6vkDp12FFPvSqguEMqnKWf5pvr2vKX1+yCIhZP6DIVd/BNe41GAakD3DzHhTG7F7z0JngZ0tKNb2s/GRu8PIlNT5KWxKyyJL99jRe+b60BlTcl7lBfg7bbLvn2w+7QQMG5MPEEnrIw/JxOEAPBrdU3xzQPzJdcdDl5+p9l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(451199024)(26005)(478600001)(2616005)(966005)(36756003)(83380400001)(86362001)(31696002)(5660300002)(6486002)(53546011)(38100700002)(6506007)(6512007)(4326008)(2906002)(8936002)(8676002)(31686004)(41300700001)(316002)(54906003)(6916009)(66946007)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHZ3Tzlaei96eU40dXpTaUJ4TVNTcWdBbDgreWhNN08wdzZTWWxKcUZlcFlE?=
 =?utf-8?B?bE9wZHNRdHpDRFNoQThKVElhRzVpTjZVNGhwcDBrTmRvOHcrL2FYZGVEVHFZ?=
 =?utf-8?B?UVQ2Z0NKdXFFN2J5MnJURE9zT0MrOVVnTU5wak1lVzFyRWh6czF5c2VRaW9N?=
 =?utf-8?B?aTBBZG9IVTdnOGJwVzhpZHB4Y2I4TlVodVJ2dVZnVnFmYjlBUCs1OVgvNXFj?=
 =?utf-8?B?L3VVSENKRGRvZHRzNDhqQ0lpUEozOVl5NEZFaEM3WlFmekluVjJ0T2lVeUdh?=
 =?utf-8?B?cmpFNUF2OUZ4MzNrS09WRW00NnZWemhqdzYxTkk1NkJYSzZFa3N1TjAwWml1?=
 =?utf-8?B?L0c2VzJkNzFiSTErL0t5NUlOd3d2SHR1NDhwemFGUkhlVlh4dTRnODc0WHhy?=
 =?utf-8?B?VTlLcjBXVHQySCs0eHJSUWhBYUM0SDBUZzZ1VjJxV1EzMGMxS3RvK0dXQ0RG?=
 =?utf-8?B?UEhMT1ArN2c5bDhlNzErWVhOYXNIUEtWY3dmbVZIOGJoMm1JK2wzOGZjZEdM?=
 =?utf-8?B?c0o3ZC90a2hTRXZtc3pQTzI1VldiZ05vdmt2UzlSdnlLdlR6MEllR254OG9x?=
 =?utf-8?B?TTVZaFFLaW4zNFBBT3VMaTBtdFJ0eC80UHl4ak4vM2hodjJyS1hHV3V4T2k3?=
 =?utf-8?B?TXVFUi9qSmFhMVBBbjQ3VnBYS1RSWjRZNVp6ZWMxQmJVOElnb0JHQmhsL2tI?=
 =?utf-8?B?L1hEaUVtQ3c3M1pSRmpLZ2pHQVFJcmlNNWJ0NlgvQ0Z1ckFlNStRK3AxbE1J?=
 =?utf-8?B?ZEU0WTAxUlVoSDNleHVZUGRibi9VVWdkV3J0K3BaT0JITzZKSlpIc0NpZnlK?=
 =?utf-8?B?aWJFVi9kNmtxZzZER0dvaDY3RStUQlJMbXdNa3pZQ1lhVlRpRUNFZXBOWWlQ?=
 =?utf-8?B?UEpKd0ZxTkVpeTRjY1haWXFtTmxmTFBMd1B1WGdPb3czWU5SZFB5bnZHdDdp?=
 =?utf-8?B?UTlTR0VFVUlDL2pqVVFiS3I3MWhNVjBHWVZ1RHBTUEV3ZGx4Ly9sS2Z5WXZP?=
 =?utf-8?B?Q01aajMrVUkrcVcxd0dOczZXeUFtWE4yVEJ0Z1hKK0l0M01tbE51TTNnNElh?=
 =?utf-8?B?aVA3bDJ4Z3FsWVNzOUZSMGlmNmV2c2RMbjIxQ0ltOE9hUGlHV0RxYW53TSty?=
 =?utf-8?B?OUYvN2c3YkxSREtRVW8rMTF2aWlyenNpRGJVZ1FWQVlJbmRpSnR2ZEVISWNS?=
 =?utf-8?B?M001c2FTY1VCMFREc0R2bk5TZ0xMb3FYYTdGN3NtcGQ4WWVCL2hwTXRCWm50?=
 =?utf-8?B?TnR3QU1qT09BOFUzNlgxMkIzUXdtd2RlbDhkN0Z6cnA1eklMMURyTEtQLzly?=
 =?utf-8?B?cmc2VkN6THF0SUV6elo0VjcrZ1k3cTducHNxTVlLUkhGb2o3bkFVUTY5VHBI?=
 =?utf-8?B?SWhNNlh6YzRNS2JKZUpIY00rV3E0WXVxeVloRWthWmRwa1ZBNFhIeEdWaGJD?=
 =?utf-8?B?RVpYU3ptS2x5d0lqc3h5WEc5ZEZ0dmhDa0pZWlJMcHU3RzZVbzdxNXhtdGtw?=
 =?utf-8?B?ZGp3aGIyemloVHlIS2VQNkdSK2pUbGxxSXVJMHBidFdLdGJIOGpmVU5jSm5R?=
 =?utf-8?B?UVg0V2plK1JNZnNsT2pIMXJBeTJtUmRxS1MrRndaSVZPOVBLY01yWjg2bmdQ?=
 =?utf-8?B?MFVTTGNacHl2djJvcGowSzRHQmdTUGk2K2lrL2MyLzd0aWlzeTdhRnBCcXpR?=
 =?utf-8?B?T2tPakdnL0hGWUpCTWs1M2tENkVQUDhyK0VoWm1SYkFDcE9ZMC9IVFNuNFBv?=
 =?utf-8?B?Z3hLZ2hJalpyclZQcnNvNmJ5SytUZ3VjeGJUb3NzcWNKT3djSmhZWG9wNSsr?=
 =?utf-8?B?QTZBczlOdlNLQ0NkcHBpcERBNytrWm9XUk56WGdPN202WUIxTXdOUXl3b2p4?=
 =?utf-8?B?dEJGMlZycEtGa2loeUc1Rzk3WFNZbUZWTW5WZEowNjBXVTRzZXJaaU10VzJW?=
 =?utf-8?B?djRKb3BzMGphOWFlNExxWWwwMHJ3MUhwMEdIaGpEWk1OeGRXd1h0VlJ2Tmth?=
 =?utf-8?B?RDVYbmNIbGlWUEpjNUp6Vk91ajZTTEhLa1NXekhHRW5UbGhnV3NkdEdnVUF3?=
 =?utf-8?B?MTlraG9uYzI0ZENub3IraS9LblNtREEySVZ0bk9YUS9qeGhtdmcrR2hvMlQz?=
 =?utf-8?Q?E0H/Y36YQLYGlRr6P8f5FODTz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84e7489-217c-4b31-686b-08dbbd9885a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:24:57.9147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXeEWhyLAHa8SkqsQas2Se8baHVCU62JnCqKvDZu8HuRRDFjRnpRvkthZUDfImC1Q8V/ImSh5u8v8N1QU8x3nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9664

On 25.09.2023 03:25, Henry Wang wrote:
> Hi everyone,
> 
> This is the reminder that we are currently in code freeze. The hard code
> freeze date will be in two weeks, i.e. Fri Oct 6, 2023.
> 
> The planned date for 4.18 rc1 is this Friday, i.e. Sep 29, 2023.
> 
> Also, below is the (updated) critical items on my list for 4.18 release:
> 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
> https://gitlab.com/xen-project/xen/-/issues/114
> 
> 2. tools: Switch to non-truncating XENVER_* ops
> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@citrix.com/
> 
> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging | 6a47ba2f
> https://marc.info/?l=xen-devel&m=168312468808977
> https://marc.info/?l=xen-devel&m=168312687610283
> 
> 4. [PATCH v2 0/8] Fixes to debugging facilities
> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/

May I ask that at least "x86: support data operand independent timing mode"
also be put on this list? There were other x86 items we wanted in 4.18, but
I think they have been put on hold now for too long to still be reasonable
to expect to make it.

Jan

