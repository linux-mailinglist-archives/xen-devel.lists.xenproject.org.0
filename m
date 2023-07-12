Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5608750526
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562350.878988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXSN-0002Zx-I1; Wed, 12 Jul 2023 10:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562350.878988; Wed, 12 Jul 2023 10:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXSN-0002XB-FQ; Wed, 12 Jul 2023 10:52:27 +0000
Received: by outflank-mailman (input) for mailman id 562350;
 Wed, 12 Jul 2023 10:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJXSL-0002Wq-VY
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:52:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f8dcceb-20a2-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 12:52:25 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DBBPR04MB8025.eurprd04.prod.outlook.com (2603:10a6:10:1e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:52:23 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 10:52:23 +0000
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
X-Inumbo-ID: 2f8dcceb-20a2-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DldRQgaxTdzy/Yxl2RnTAr5zF/PPwWAI+L/7k1J51UkHiuFA/6BPDfVfrdbCb0HaJUXyk5jq04kDkVt/vorgwCNcGqiWHiv0FijI5URyeoN29IOAIHzSFSQDTKb16y8ztts4w4gLjKUNlPR/9MVGdi5HdzCksPqBvlzxKexjOOdIlGMgVNBhpEZCd1Bip8IozKlrDmz+QzoBAOnfXlxSey7GqIgrpIbBw73/0g1NooTa22AbX2CBw2qepRcjbA7jpp9Fd8/5bI7ziPu8LFKJadLIdQ5YHVmLoXyaC21+z16l6SNKl7PLds6w/iQu0NRoAwfp2+ZDWQbZPkL86QB90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpZYUK4NCM8LATODje/gfsOtb3Cjjx/3p1PoPTJQIxg=;
 b=Izsy33YGkjc2W3Ttru0+DjrLVeq7v11AmEP0uqANuvPQZYasao/DBQhpsU55TjI8I2y/D0rTAUbEwCTazZLzR9f5esPLdvJ3NHpFvKLh/txNElpf/alEpLN54T/FeFuCUu6fniFTx2EZl/1GWADj56OpIWo6SqaxsjL7yUlAPmrYI7hFawHBrAWpksyH2N55DbUFkWXv6H+bHmk+UzwVlQ84X20Q+4nwYuczvd6TW4nlQtiLWQoastgz64C0gIxBqMZKeazhoCwJcS9w0dD7OVi6lWnrhrBkyef8Q8i7hp07qRTBkU6++STr5BUjHhC1CSh9n4tv4rr9Sdl4SW/JxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpZYUK4NCM8LATODje/gfsOtb3Cjjx/3p1PoPTJQIxg=;
 b=AGomH+vBNbg6yURbJT4A1hRM0812H9OIQrDlpeFnrkX2P2fVy0CVVNTHPx/eO1e9g/weDWsYaLmy3VTygpKyUPh0PfVtV/ZVaoP4hkii2rUvZRovUobWMJeuaHRq2hrUF9vw3R4QsX4rd9CkUq8pCvshhRnKEGPKRIIGTzAvqOJ8F4LcAjTI5hMQrSPA/eCV6Qbe5p6AAjtrzZdOzhEJNVLuIlT2rWZpMcBorpHO1QM4DXnzsPdi1lkxGqiZuG98NlNYgaxOpCUg7rsgFalDIjRbkxnusS3cYVALvpQotrcSa2mNtUlvogEaxiqL31jIV1pnz5u8zz6AeM0N147F0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <301fda12-33bb-325f-2ca7-8f177ddf89b2@suse.com>
Date: Wed, 12 Jul 2023 12:52:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 07/15] x86/vmx: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
 <c4953517b9675b2099841be704f0c67989e76342.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c4953517b9675b2099841be704f0c67989e76342.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DBBPR04MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae2815b-3d72-40e2-a9cb-08db82c61296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UgUlHrmMr7TiYCi2w4SAqXNqGUF6AWRRcK4f5IFtlustKBKsDAbYcPFeXVYbCSWjv45LTWi6DiPObc6oE7g9HGTNMujo6P7/5uV4k4L8jnTgczFaehIkd6z7fFcDvkJBv2xXTkwWszejx/82md0GWdCyLS+tduv2tqZqmn5wdrGHkESWvXGRckTFhzhtEgyWspK3c3mizx73103C2xU7AdNzHqH8tGhETavhDxN+NElWdMPad0a0qlFO63rr2EfaFiEf/GrXq3aRPsPGkLHrAh+yxvIpzZM4/r7mYsYtNRVXraf3lZ+szNrOp91Y/jzu7M/l0CynSBuoK+AC2oVxi59k672EQbD2QaeJQlY29wSRw3EC850MG7aGHV5pheRl9J5VDpiHwLeLXPqW1CLdvO3VP0HG8+caWBYf2s+uzoBMvKed9zlmTAqf3dx1+HxSw8D4NflL7QAWeNOi5+eIGk/t0YU/AG96bbXw8IL+V6+BOmwJphm+eDsB/ZU3H7Anas/jYufyLLIPz1owPbEI+ZclRhiDkiVnPe8cJAIo1bpFmQ+gRWZ9U7ld8pS4eIO9cM0jjA4wBTcCup5d1w8EglXaViWbb9kRlUjGZb4m9OMsSkJeivKOj5MbV4i/Xp/8jHIG6P9WpF2pMBaM1S0v7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(7416002)(6916009)(66946007)(66476007)(66556008)(4326008)(316002)(41300700001)(2906002)(478600001)(31686004)(8936002)(5660300002)(8676002)(54906003)(6486002)(6512007)(26005)(53546011)(6506007)(186003)(36756003)(83380400001)(38100700002)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUFmNG85UVc1TjI3ZUg5R2pra3lBSFNIdStNWkszSkJEU0o2SzhtZVBhMTNX?=
 =?utf-8?B?QXVIbDFuSWRrZStRM3JLRldTSHpWMmJjcktTS0tPZUppY0haMHN3WDgvUlZV?=
 =?utf-8?B?L0tCS2Q1aXQwUWJPQVlPVjMxZndHdjNlN0R1Rmg0R1kxK2VXSDdUY1dES3cz?=
 =?utf-8?B?WnFQQU13TFlRRTRVUVQ3NDJ0TFRlQXlSZ1BubXJJUUVSQ1BwNGsxaFFvTGxW?=
 =?utf-8?B?NERZdUJqZ2RFNitHMk1mUjF4YmZ3ZW1GYUNzK3hJWmJtZUEzTVdhMGlMRDlx?=
 =?utf-8?B?ZTBkYitNVExmN3hnakxrem1NQkRZZ0ZuTHU4YWg2c051VXBEdVJDcE9HS3gw?=
 =?utf-8?B?VmxmWGxqUWFKd2hUWWEzNDBFdi84Z1lRa082Z1lnT29rWVljdVZuTVZMc2dk?=
 =?utf-8?B?Y3NQNk5YcHVNM0FPR2FCYVVrL0pMYzV0Zk16dWh1ME9FT3IxNExqaklSTDc2?=
 =?utf-8?B?SkYwSk5rdTNjRnpmNHpDbEFCV3BXd0dEaVR2TlZPWTZoeHh3RG5oU3d4QmNx?=
 =?utf-8?B?cXBIUkNnVFpJRFd1RWRhb3JCNGhsSWZuODRPb1BNb1drTk0xY2NFYUtyWFpM?=
 =?utf-8?B?VVNQSHJsRVg2UFBRRUR3cmtqbHVVSjFuMmJYQldPTGlWdGJZRzlLOUVrUW1M?=
 =?utf-8?B?TFppR2ZNK0gxdHhuYm43VGcrUXR4S2FZd28zMk1FaW1sdDhZWVROVmRraEdw?=
 =?utf-8?B?VEQvVXBhc2JqdkRxdGp3WHlUa3hwZW1zZ2JDcWJRbWlPS283ZUl1MmlxRXl6?=
 =?utf-8?B?NVh2cWRjcFJ1NmFjTnhxbm4wSUxrd0ZMUTgxMHdVT2x3c1cvNzJoY1VlRjRi?=
 =?utf-8?B?SXY3L1JqT3BNclE3UmpqZ0d6MFJZSlFJVlp6RmVWZm5EWk4vL0xVQ3RKTnZZ?=
 =?utf-8?B?QzJJSHdqOUUwQTI2WURnNzVsaHV6YzdBR2xQenRxaTNYN3VaeWlKcVFlSnlk?=
 =?utf-8?B?L2NPcGZWNFZuVm5CWXhoRDhRQ2dVZXlGbG1RbzNKSlQ5UnZzY2VQZTRiQ1BD?=
 =?utf-8?B?Y1FxcTNJdE54aDRsSkNNdEZ5dTNUWjlLQzVqK2FEZ1ZtWjRjMkhqSEZZeXhj?=
 =?utf-8?B?WGF0YVo4TU1CR1JCSUpWbzVVVUZkKy9ERzMzaHQ3WW84REt6RTRWdllqTDE5?=
 =?utf-8?B?OXZXb3JXdjZxKzdHVzVYRDZsbU0xNHVBc1ZNMGNxUWluaHYxeVlKcWplTDMr?=
 =?utf-8?B?KzlXRnBLVFc4Y1V0Q0lPSlZlbkt5NlZEdFJ1M1RUV3NrZmlkayt1ZWxvNzRH?=
 =?utf-8?B?WFN2YTRxc0dKQitadHVldFU3enFoWmRwenpNaGZOcmZIUjkxazJDTjVxdm0z?=
 =?utf-8?B?VnR2cXFUb0c3TEpSd0JLZERKMDFSYWQ4czJGMjVCSHFPemk0RmgrL3prTFpX?=
 =?utf-8?B?alN0QUxtU0Z3MVAreTcyUTdOZXplT245ZlB1ZzFNUldwNlhxUDhhREdJbDBI?=
 =?utf-8?B?bHFOWFZNRko0eXFOekxYMzJJMDRtVUdkcSsrMm4yNDhxK3JLN0UyTlJqSmRp?=
 =?utf-8?B?ekltNXRyWVQrdFg5ZW1EdDF2TFhPcmdYRW91VUtrMmI5L0d5eXgwWk9pZlNQ?=
 =?utf-8?B?eEtnRDRST0NwUXp4RGpybGxFWUdVZ1lVNWFCeEtlY3NuNDRmR2RrMkJzeDNp?=
 =?utf-8?B?QXh5dU5rY0w1dUZpMFhySzRuelNsb0tabFBwQnlTU0hpQU9obU1xQ0FDenI0?=
 =?utf-8?B?OVFneGNxZU5mVGkvTnU4M1FtemlDVjJaMGlyb0htSFFiNjJtRzl4eVY1dUdp?=
 =?utf-8?B?cWYvOVF6enVFSGdaTWFxUVFFN1lnKzB0NzYveFowWms5SUgrcGlYdVJnQkdK?=
 =?utf-8?B?UFhlcmpESW5yRU4vMTNZb0hSdHpMZThlQlY4Z1EvaElCU1dDN2cwYU9WaDRH?=
 =?utf-8?B?SUxSYTNNcjVkRFFoSVR2MmdsMjczZHVZQnNqVDdLT21KOUdpQTJCZmErQzdt?=
 =?utf-8?B?SjlYa0UvS2dyaFpIZG9Ha0puOXc3T3BtZUg3NGNkdnprZ25FeEZCR3ZPYmxL?=
 =?utf-8?B?TXc0Q1FYdFh1SkE3MFBmVG9FNk0zam9pMjJ2T2FZYUFEZWJ6dmtZNkFJZm1F?=
 =?utf-8?B?WlZ3ZUFnU1NsK3V2RWwrUlBNL3BwMGcyRlNPem5YVUIwdmk5MlJycitSd0Jk?=
 =?utf-8?Q?n0Gz5tZlMcnXxh1Pm2EcgAsaF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae2815b-3d72-40e2-a9cb-08db82c61296
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:52:23.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXgWHSssQ8PanrY7gJs/qgrpDKj96tqc9goGqmdRRz/P4WKrV1LpKPoYpbA0Qss+9d6D4ETTDak03JQ48smDZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8025

On 12.07.2023 12:32, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following changes are made:
> - add the 'U' suffix to macros near
>   'CPU_BASED_ACTIVATE_SECONDARY_CONTROLS' and
>   'SECONDARY_EXEC_NOTIFY_VM_EXITING' macros in 'vmcs.h'
> - add the 'U' suffix to macros near 'INTR_INFO_VALID_MASK'
>   macro in 'vmx.h'
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v3:
> - change 'Signed-off-by' ordering
> - change commit message
> - remove unnecessary changes in 'vvmx.c'
> - add 'uint32_t' casts in 'vvmx.c'
> - add missing 'U' in 'vmcs.h' macros
> - change macro to '(1u << 31)' in 'vmx.h'
> - remove unnecessary changes to 'vmx.h'

With this many changes I don't think you can retain an R-b, unless
the person it came from really explicitly agreed with at least all
not purely cosmetic changes (which I don't think was the case here).

Irrespective:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

