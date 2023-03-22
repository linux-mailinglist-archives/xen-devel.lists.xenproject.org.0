Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D06C4465
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:52:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513146.793726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petFn-0001qg-23; Wed, 22 Mar 2023 07:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513146.793726; Wed, 22 Mar 2023 07:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petFm-0001oN-VX; Wed, 22 Mar 2023 07:51:26 +0000
Received: by outflank-mailman (input) for mailman id 513146;
 Wed, 22 Mar 2023 07:51:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1petFl-0001oH-Uh
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:51:26 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 583384bf-c886-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 08:51:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7000.eurprd04.prod.outlook.com (2603:10a6:20b:104::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:51:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 07:51:23 +0000
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
X-Inumbo-ID: 583384bf-c886-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUNsSwPnDUXaBBa4+9Kbrf8Cky3ojxSBhnH/Ad7U7110N5I11jvmIT1+qKP0Vnr07zXRSWRURKUGb7IliKOCcuDtJx718IQg7W5jykrRJj6IyFEvsN6IiXU7PLK//LR0dP3Zq8xk7T/wjk0NoS1yyiuCyMjvrnr3e5H79GDECAcHvi8i33ZAewxkge3I1R9vKvLcK8PbmrhtE57J3O8CLL0Uz+mn6DlOEE0CMAPu5r068wbKZAqkMgRA+Iuf54gr84/A5TG/MOudNzs87TmxVEYev7f5ln0fLWWIVrL0RHkKGEs7mNsrZsKmG9bHbEKEGBte7hbQE2hV3zRqR13P7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A/j0taGy1Zf1ABWstIOrlCKjhX9BwMhwrK6NnO/ToY=;
 b=Rlq9XvHOVjZvgCDl4rJCi+DQElWQKWcCL3Gejgzgg7RyMD/oUH0fgOFrYDRSRBJ2mZLb6d4GnSm6wRHDeyCc4U2H/px24a4FLSURMPpSrYXKTfxCgaQZPDbreafyiIKMLtlKRWP8n3T/GYrhpLlCGINE5Oq+U4cRyj5EdYrulDkeCc7YbrJIqGTRaAd29kH24P8uwN06+XJKyxeZJG6RpJH+g2mWojzxKECvsQ5GBbuF43Xpf9Rsf262jdLlmkJkBoTKtRm1R9m3S2zBaLEnyKaP03ArNMNpzkVM0Y+R/k5P+9W4A7a5SvoQbPN2FbPAlSjLweXLFm8k/nVL5YCJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A/j0taGy1Zf1ABWstIOrlCKjhX9BwMhwrK6NnO/ToY=;
 b=ZbA/qAAbYqpuwdcfA7Ofgpuz5p14NhtKIu512Mc4C9ZJBPI+K1Jcbz6VTpoo9dWM8IAb8AG87/E8zdeTIVc4OHbq2cTcCH3bWrTVlbjgP1BMeHe1DnDpJIFa2+ji0Fh2rT/thssLKKgIs7mGMia8apTINjRM7peQeVqXGw/+wV0NsrH+hOX2mc39k8L+3yWjkgeiNd30YZIA+sROyG6Gp3mdLCa8D/lpzdyVzEo/VKtsxlU8Wmb9nMID5sOpX0ot9LAyT1HQBFIzaXQkqnV14SGAfwkfVHjLIgzysLbGldrjxuuJwbL2GuqrP9l2MM858+0+5PO6dSzx9Zy4xsYM+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78734ef5-724d-959e-ced6-23f84c14da29@suse.com>
Date: Wed, 22 Mar 2023 08:51:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 06/10] xen/arm: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
 <20230317131949.4031014-7-luca.fancellu@arm.com>
 <bfe68fee-dc22-dcf4-c4fa-d30ddc95718e@suse.com>
 <35B6524B-1AB1-4978-B887-91C4EC3D5231@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35B6524B-1AB1-4978-B887-91C4EC3D5231@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 287a8c33-8760-4796-f8a1-08db2aaa3b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3HJGOuxxOLfR3UPeGrMphmXK+hE7xRuAYb2xiqM8us5eaLzyEeY+RaH7/yaGqzK+XX4ngeWmc83OT2WDa0Hrg9Id2BvLDGFKTKa+p8VoAPmE6ViyredjxXW0vXhgGrSr+eGqS2Xln41A6U/qhfVhOeaTNyX4yn/K3Sjyr0ZcJXkqUZIXEHbfG0G5SvwSWz2+Iu0rvk3CYMUxYp7EopZTlAef7NgJiLyU0CBPhlg85ceXQRikJyonXfzrrkQ8Tx/UHouZrDcvSmuxjSNhNuCH39ls179hwdNlJJlAe6/L0QOBpl92E5aoyH9uWp3QC5dshBukru4lGwK7QAkT5TPwz5JEG4Qrj1tb3QhLosK/av82UilO1sie1si9xUYcz03hPvJw8V+YzQPF8QcWuoowhZRUTI8LfVmD6DP8jyiwBgSwL7/AP0J5pBKZO3A/B4zHqfpqna9IsFpu0d/jgQdktxGKAokHZpIPyjSddW1DVl1L1uQMSCb+dAV+4bhozR1izcU17TNqISCujsoS6asPXTToKOmePYTgRqAhMyxtOO9fOhwHvvAT3jG6eAKIBtpyhedgoBfJyadurGKX1QTvt+jYXiDr2M7IDbJGneDl+HDfjiGo8bUxvwNwHuZqkQLDBBYLY+ERpqU5kSCHCtZh5YRFL2vzs3fddquvnNP655Cl+lrf1NxtFaxgd0S7x9JRvBO/e96kNhB10MULaHCmLcIF2clrtqXQtZhPn4Y2iHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(366004)(39850400004)(346002)(451199018)(38100700002)(31696002)(54906003)(4744005)(86362001)(26005)(8676002)(6916009)(8936002)(5660300002)(66946007)(36756003)(316002)(4326008)(7416002)(478600001)(66476007)(66556008)(41300700001)(2906002)(186003)(2616005)(31686004)(53546011)(6506007)(6512007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEh2OXVkZWtiVlBidzBCOHBQWEM0OXJjQ3JydEVlTUpaT3FXYVRPeFFmZzR3?=
 =?utf-8?B?U3dOQWh5V3lRTHpDQURKaS81dXJKNTRXdFNneGx1UC9KYlNYM2d0anNoclU2?=
 =?utf-8?B?d0FBbXoyK3NxcWNTTGROWERycE1Fc25nUzFadHNneVIzZGtCVFcwWUZlaXZo?=
 =?utf-8?B?Unh3NmFvOU5wVzQyVytlZVArcHdWM0VlMEtFY0RrQUVqWG9udEZtZW5DYi9S?=
 =?utf-8?B?Qy81Tm5PTDNFVGdNZjF4ZXBub3h0dlNSQ2tYalhJUzJPUk15OXZzQkhWaG1G?=
 =?utf-8?B?UkEwMGZndTFLbFZ2WkxqSkdUa3d5RnYxbytkZGowZE9QK1RncDZQUnRrdnI0?=
 =?utf-8?B?VlY4TWk0TWxrN3JITjdFOTlnaVRzVytJL0FYYVV1eThWbUp4TUFiNXIxdi9p?=
 =?utf-8?B?WmRnZitQNXU4RnZDWTREWjdCVXBRQ0dRZ1I3a0k4TmJoTzlYS0pSWnNlM2da?=
 =?utf-8?B?V3JFdEw0VENJODRMV2luKzJaZFlxWkJUVXIvcjBZTnArdC9ZVXU3dGVLaDRT?=
 =?utf-8?B?d0VrWno4UDNKcDVReC9QbUJMdXp4M2VpWENUc2lqS3F1NnM4UkhUUUFmVlhU?=
 =?utf-8?B?dHNpN1B0RVF2ODd2VC9Xc1o0Z2NmVWVIRncwc1RvSXVzQk13ajkwRTZGaEM1?=
 =?utf-8?B?aFowTWhGclZJQkZ0VUJBTnVvbTl1ai8xMzJKUGRXYmRHWTJMUkZVL3BYVWph?=
 =?utf-8?B?Y2hXbEZaY0NTRGxKQ2RKZWF0SlpHVjJOSzdDZUtzaEhrMTgwMXpHdW10RWpR?=
 =?utf-8?B?L0FLYk9LNnBXNXd4Tm1HRjZqNFNFaUZwUnM5SXZBU0U5ZGhMNk9lVXRNYkZG?=
 =?utf-8?B?WlQ0QVBDRUhiQkxxbkhhYnNsOVZpYm5kQWsxcmlIanY2VkpCdXVZZkxXRXZJ?=
 =?utf-8?B?azhXNUt0WGtSaDdkalgzVWpOc3puQXZiL29IaG9KYjlvV25kdnJ1NDZOdG5h?=
 =?utf-8?B?YWFGUW9Ud09WWHdBR2pEZ2FabFExZ2xLNUl2SXprbjlWaENCcklXb2h5cFZH?=
 =?utf-8?B?YnlyaGFEekpTeERGeGFDdXo1YjhBQ2ZLSVBDRVV6VEZsOXdSQzg0Q3QzWGNp?=
 =?utf-8?B?QlVpMDhWeHRvaTlQZ29JbHpRbFpDWTc1cFB6SFZnY0ZhMmNTUXBEZkcxNGcw?=
 =?utf-8?B?ZE5iRXNCZ2pDbFhwRk1SZktXTTBkVXl4MzBSRFU0ZWlZTEFSb2RFNjVhUDBl?=
 =?utf-8?B?Y3dzRHVxTWRtbU9hOFF4cjRSeisyUXJBbmZ1alVSVTQybFk5YW9QaDVnK1Y3?=
 =?utf-8?B?MEZEZEFwbWRtK2IzK2tFUDR1NlVoRmRPOW1KSUZnSUF3Vkc4cXQ3TW5OUnZP?=
 =?utf-8?B?ZFlLUzVseGpBeVBoM0JBQjl2cmRUMVUydTEwL0VTT3hJV2FqT09QNjlkOHZR?=
 =?utf-8?B?a3haYTkrTFhyNngxcmxDamFLcFlhamtYVThoN3UvTDEzeEFBS2o5alRKMjZQ?=
 =?utf-8?B?TXdIM2o2K1NuNVlqR215MDZ3aWZGOWpGOXI1M25aRTlwbnBGU0JoYkJGLzFs?=
 =?utf-8?B?Y1prLyswMUtTc3BrT00wbStKc1hETm1odzhoU0swRklHekM5d3JHRjhYZHZE?=
 =?utf-8?B?MThPYUdIbnhJVXlFL2kxMnFPRkVqd25seFV0OTJNaGQ4NFF5YmR2b0tFZE9p?=
 =?utf-8?B?YnlKTHJsK05KTFJZaExpa29NNlNYdC9VMy8wNE5uN1FPUEhGOUREV3RuMGEy?=
 =?utf-8?B?UmJ0WEdGK1lEM0VzSkw4RFYzYzdtNVh6dEFPVnRKQ1VJNjJVQWxaalBQR0xN?=
 =?utf-8?B?bzh0MWJTa3hYb0FtR3k5YUlTZkp4WFdaRlN6K1FFRWxpdzBpSVZjZVI4Uit1?=
 =?utf-8?B?Umk1aWFJcStFVmxrK242dEhiUmFQd3h6QlU5bFNQTnpvK3RyaFRvb3N5Vlhy?=
 =?utf-8?B?VS9PRTdLcC9NSFYzc29WRkpFeXRLL1NBWmlSalBXLzZkdUZCTFEzRS9DS2FU?=
 =?utf-8?B?WlpyK1VDc2FDRWJWN0dHRldvb3piK2VkTGVQWGhwUWs2SWNaTUJpcVJnbzQr?=
 =?utf-8?B?cVVnSXNFenBjTExnQ1RPc25JQVFhNnJaL2xUNFZUZXRPUTBJRFZwMk9zVjY3?=
 =?utf-8?B?NXZnTnR1TnhNTDZpV1pqWUhVQ0UyRnpTajdkK2ZwQjl5ZnRFNUplRnlIM1cr?=
 =?utf-8?Q?mnNPy74M3TDDdUjHhuaPq8yb9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287a8c33-8760-4796-f8a1-08db2aaa3b45
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 07:51:23.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObI3N/GL4kPbrtUoAIszNXU3xqtJ5A58baQMFbY8FlEsp9BM9dB+frDTM4dAcKBY4JFLA8WdPrx6QsmsM7ZxyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7000

On 22.03.2023 08:32, Luca Fancellu wrote:
> While I was browsing the code, I spotted a possible bug in x86/dom0_build.c, in
> parse_dom0_param(...) if an option is not recognised we set rc = -EINVAL, but we don’t
> stop the loop and we continue to parse.
> Is it the intended behaviour?

My view: Yes. But I can see how one might look at this differently.
Yet iirc the same behavior can be found elsewhere as well, e.g. for
"spec-ctrl=". The goal is to parse everything we recognize, covering
for people using options on older hypervisors which are supported
only by newer ones.

Jan

