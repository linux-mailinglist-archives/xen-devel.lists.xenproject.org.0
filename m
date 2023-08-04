Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226076FF8E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 13:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577110.904002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRt9n-00039c-JS; Fri, 04 Aug 2023 11:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577110.904002; Fri, 04 Aug 2023 11:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRt9n-00037x-GN; Fri, 04 Aug 2023 11:39:47 +0000
Received: by outflank-mailman (input) for mailman id 577110;
 Fri, 04 Aug 2023 11:39:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRt9l-00037p-Cf
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 11:39:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a9cad57-32bb-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 13:39:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9552.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 11:39:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 11:39:41 +0000
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
X-Inumbo-ID: 9a9cad57-32bb-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqcapm3KGkpf64TDOmb0PdRfdKBMDX4bBP3TAQDNu9+Y5EC2DxAmqDb78HgsYkQw7UYFSnRhh4VR4ODbm3DFRw5qYo6uyjqlwC9jDqxdI/ToLi12SF4FS6x9jKpGgYPtj/SMlMBUFVH8QydfkpfpLrAABf1GZ7vf47O90tjmdKapF9N2S6faT2zWp2H8xAjN+brEh/rlJhG1VCit4CV5rdcvkrZLLU8DkvmMfdZ7VPNfRs1gMOnBg/Ym7b7vDbrWVdic1xY+CuOZcQ6HrJp987axrGOy2lFst6wG3RLKc6tSSxADjD+KFOA/gWuNGvBlpCPNok5f/o/9jUQLko54xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lN9SFW9g/Qx3UKEHTnyDh2ynuN5d2QJ+aszhumNIb/U=;
 b=FDVrdUsmsJZqsOK39cxaUD2E1HZIW/eksYW7KW+UpBM5xYGzz/nlqXz7Yc19FyMCNl+RNTjPzYUShhojnx6hzkJXVpyTs7yKWVd7vkqZst84Ucgc1rzQX6Y0DFZetKz3AzA5A0LlRzCahF5GRm6sA4dEoKzuwBdwCbRd/v0PS43HKNJDxOeS18REp9M5Xd8e+qIoAIZQH8Z7YlG9dqXEw4PxPBnamh/nUpsFoNno+Sz6kS20zAp25Mefp7ATLiBfEYotYAlONySjmbcGCQQquOFGx5spn1d9P+IXUbHcxOYEhSM65Ki9QoN4kxm7eNB5UA2JJEpw6qn/CjbysMiZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN9SFW9g/Qx3UKEHTnyDh2ynuN5d2QJ+aszhumNIb/U=;
 b=oTZkJ6j1mjOp3cRWXLhEBe6Jtup4Xe5LAkCbm2y1TeFU2RYQClaNdUrwWK8+QEiIH0eqShD565Z/xqLqf43HEJaVjK9esvsPVVD1hog05acQLXgyc8HO6KKcJMuWSmD8sebFkBS36V2xUvlXBgKRIXbWMrL6rea5mArzFV54H+r5u1u02wqDf2i9/4nAhieZ5+H1jnaa2Y1RGGkXyc01A0NvBwvRpi2tZYP92dyLgwIgNzBJUoMBNM/CkWdDfDhd3hF6df2fJWebNa/I5iM3WMqeQiVXjtWGSTOFU3HJuPh8s6mdyU4x0RLJefHNK7WdTQTrx6OTCzRiZu0zhte8IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95a6d085-cbb9-ecb6-134d-6e4d994bfd35@suse.com>
Date: Fri, 4 Aug 2023 13:39:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Michal Orzel <michal.orzel@amd.com>, xenia.ragiadakou@amd.com,
 Ayan Kumar Halder <ayankuma@amd.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com>
 <alpine.DEB.2.22.394.2308031733380.2127516@ubuntu-linux-20-04-desktop>
 <00fb1a58849ec08534465df2f8ca2284@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00fb1a58849ec08534465df2f8ca2284@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9552:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d445304-cdc5-47ba-4a4d-08db94df7db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hkU3JijJATfzjY5AHubQDMM26MPhGlwxWFxAttNsAiiIFCQZY6IyGMEydZeLG75vSPuSpzXW/9PNywxS2Z3epq4UYiaH5kFmKo5dsJ3RB/+oCVZQYeGQ35ck1wLB6eIPAPVNRY3TUodrIDzTWaiAvcGJccjqFsqjMWuBAnyOEZsV6Zzr/8WHiVJ6a9mdAYcpdGywxtkVHs7Y007HTGLHD+l3JMjnCZ41WfxD9DPyU5ZgtWoY7HlFEFieq1gMwpyp0/XtLfWLpAjOnePtJUbrj6w1H2VEV0Cxnv6VAaT8fDLvf1HxKz0lnk1dNneG9HktpcmWcpvsYKbBb86panRitY/o8MUFJNwdZzGLJcJdc2COyDEkLYnMpPtz9EF2o9/kZnnfV3BME4oaP8nK4iaWw39/RWqBGoDdkQafboS8uTCaIxRkoytNO3azzAdml9y58uUzWytf1JhZE8Xkl1NF7EG8JO6E0RohNbZtWpVr6wQJiloUcehnZxtAW73RWAh/UEfctjokNncPWheUFESTpXA06lb8yg/btZRnjnGtxSqs7jDf3x2wM2heqJKvVOpAKh4GMv7e38R+z/v2aFdbEZc1B6SxZPV2vaYAHCYNT3mBgVgtTMwcTul6LZimGt3PoR+u8a6C6CCCkmqcbnHGUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(39860400002)(136003)(366004)(1800799003)(186006)(451199021)(86362001)(31696002)(36756003)(31686004)(54906003)(478600001)(38100700002)(6512007)(83380400001)(2616005)(6506007)(26005)(53546011)(6666004)(6486002)(8676002)(8936002)(41300700001)(6916009)(4326008)(66476007)(316002)(7416002)(5660300002)(66556008)(66946007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEJKVXVCV1RWQnhjTlFYb0MzVWZYSlY1cTNvM1JVaGE0ZFlVL1NHVXdPZ0xj?=
 =?utf-8?B?RmVIeDl2Wi9zY085WE9nR1FibWxLWWMwUlZFcithVzFhNGdNOEc1bEMvbkJn?=
 =?utf-8?B?Nk1uWlNPU0s1K3BOUFJhMUFEZGZTQzJGNk5ZTEFNVzhMMUI3MEo5eUU4Rnhy?=
 =?utf-8?B?eXdlMWJJQTNUcUo2ZkVhRmkwNHJyVWhJdmlqT25jaDVNek9QOS93M3dDOWtP?=
 =?utf-8?B?ZW1ISU5kRW9EMEJOSzNraCtMN21XaVNSUzhXQ3VOZ3Y5TGZ2dUtmT1oyS1hH?=
 =?utf-8?B?d1VldHpMNVdMYTFibmNMS1UvamswZGlqdllnWnhFWjluOXVnczJ2bDB5dDlP?=
 =?utf-8?B?RmNmT3NqUi83UXhPdE5qV2NDcjl1NUh6d3dTS0RydmIrSnNRaFc0NVNaKzNW?=
 =?utf-8?B?N3hmNFRjMWRVZ0ZtRXhkSFF1a3NjV05HYThQeDRoekFrMW9lMHRDMmNhd3Yx?=
 =?utf-8?B?cVRMRlQxUzhXcG5NVmgxWTNZZ2F5bUZWTkpSRVA2dGwzazNHRzZMRFc4NUx3?=
 =?utf-8?B?TDZQS3B3R3lHbE5yckVxemRjb3A4RURSRkg5ZU9pbll0Sk9xbXo0MnhVZmZi?=
 =?utf-8?B?dXlYZGE4aUZKZjF2OXliQ1NVSElJSy9iN0d6L2FKQXkvVjd5dDBhR3RIN2x4?=
 =?utf-8?B?eW82VlM4bjZDZXRhSzBIK0h4MWV2akJmVFhyRGpJSnliOGoxbU00RUZCRzZi?=
 =?utf-8?B?YndzM0dnUm8venlMZFBpQWplQzZKZ0c2NGxnZCtUV3lRRWpyYXRYTVV5QWxl?=
 =?utf-8?B?OVUvNk5PcUJwUFFxZGZOZzU1M2hTQXppREhWVHhkWEVKYnNvYWlpVWZXMmtX?=
 =?utf-8?B?OXVrbmlQWkxGTUFzSzFEZFhpVEdaY2JYcUpYYit5b3QyNXNZdklsL2V0Q2lD?=
 =?utf-8?B?SGJ2Z0IwM1h4L0hJYjA1SHBPc0g2TE9vYk5hVjJXaVQyTDIydzZqVDlhcnhn?=
 =?utf-8?B?dkg5dmY4K2pYTjJFQjZXUG1BazNJYklqRldtaE1mZFQ2ZFVyZVBManVJZGo3?=
 =?utf-8?B?aytLQUI3OE4rK24vTFYrSExYckdWRnFPL2l2OGYrMmJGUWtrRE1DT0dLdUpm?=
 =?utf-8?B?NGk2eXlhdVhiL1EyYUN3cy93dk9YT3U3Rkw0Y2c1bC9qKzJIL2llT21UeTdr?=
 =?utf-8?B?cmpBZ0FXVDh1TGlEQ3JBREpzakR2L0VwbHJIYXMvMm04WUFBck1mdkh6a0hU?=
 =?utf-8?B?MFkrQVBhUEpya0tBalFmQUs2LzZCTnZrTk9jRU54SGJEYmhadGxMVlZtRVJw?=
 =?utf-8?B?KzB1TDRIVHhSTXVmYlNLcC9GWk5ONUpSR3hIUU1QOVVHWlFFenc3MVN3ajVE?=
 =?utf-8?B?WExjREw5Y0JBVFRiWmxyT1FoZXA5MnhkbVY1WFRHQ0R4bkFHMmE3U3U0Q2Qy?=
 =?utf-8?B?bVErTjhHS1A3VjU0ZTVCYlo3TGZ1TWxCVmVha3dpMGFPeEZmVUVCOXBod1JH?=
 =?utf-8?B?WmNYNEc3V3hEWnZFVnJaemVXcXdGL2Jtc1NqU3FHZzYzWGdUN0FrdlMrdUF0?=
 =?utf-8?B?aEordzVCSk9vNzlyR0IvOFU1RUxkVHhjNDlxMGQyTUJ2U2pmR1YwbWEza05y?=
 =?utf-8?B?SXZlem5MNEdUZWhKVUplWVVpMzdnQi81QkV5eVVQbUQ2TithT0tKZWFwZ3pF?=
 =?utf-8?B?VFN6VzFjYUJBdUNqMFl0KzFOcGVuSC9uekF6aTdINTBWSForMUpCVFJCZUdU?=
 =?utf-8?B?OTc1aU83Y3NzOEUycE9zczZGN2RSR0U5NU9FSHhvWnRETWZUUGdFa1hnLzl6?=
 =?utf-8?B?aGFMUCtGd1NNN3ErSHRaaUEzU051aXM2NXVwUXI0dHNodTlyV3Rhc1grYVdM?=
 =?utf-8?B?MjlBWU1maVROMCtQa1kzREhnQll0bkRTN1V4UFBKUEJuMkNhUFU5NFk2ZlNW?=
 =?utf-8?B?ZkFyVDBmSDdHQkowMnlZQkRFZDVVT0VZVHhWT3I2WnR6c3piajNDVytPRGF5?=
 =?utf-8?B?dmk1cTVVVldGZ0toRnN4YlFWOVM3TUk2UWFzdHRrRFg1a3Rjd3VoL0V4ZVZW?=
 =?utf-8?B?U01CVlRHanFXY2p0YldOYmtGSm5UczNoZElZajA4aS90b1FrU2twUFNWbWo4?=
 =?utf-8?B?ZmhXUEIrcnJHYVNaZWx1bzU5YWFKS2ZyR0tTcGJxaFl5NkxMcDVGd005eXdD?=
 =?utf-8?Q?A6eXmQiJkVfLp0y8qpN641NJ0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d445304-cdc5-47ba-4a4d-08db94df7db3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 11:39:41.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rA7e90Jg8f9smvweWKUFC8+h06TePyCrs2VSa198sfYV/KqVkt6QTVnABMWnej254XbT4nQoJLH7zBBx3/Q2XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9552

On 04.08.2023 11:47, Nicola Vetrini wrote:
> Upon further examination, I identified the following patterns:
> 
> 1. Functions defined in .c called only from asm code (e.g., the already 
> mentioned __start_xen)
> 2. Functions/variables declared in a .h, defined in a .c that does not 
> include the .h with the declaration
> (e.g., 'fill_console_start_info' is defined in 'xen/drivers/vga.c', 
> declared in 'xen/include/xen/console.h' which is not visible when 
> compiling the .c).
> 3. Variables that are either extern or not, such as 'acpi_gbl_FADT' in 
> 'xen/include/acpi/acglobal.h', depending on
>     DEFINE_ACPI_GLOBALS
> 
> Below are the proposed resolution strategies:
> 
> 1. I would advise to add the declaration in the relative .h, to support 
> automatic consistency checks with the
>     implementation and a quick reference when touching the asm.

That'll need discussing first.

> 2. To comply with the rule, the header with the declaration should be 
> included. Also note that there are some
>     corner cases, such as 'get_sec', which is used in 'cper.h' without 
> including 'time.h' (which should gain a
>     declaration for it).

This one of course wants fixing wherever found.

> 3. One possible resolution pattern is including 'acglobal.h' twice 
> (either directly or indirectly trough acpi.h, if
>     the latter does not cause other issues) like so:
> 
>     (assuming DEFINE_ACPI_GLOBALS is undefined here)
>     #include "acglobal.h"
>     #define DEFINE_ACPI_GLOBALS
>     #include  "acglobal.h"
> 
>    this way, the rule is followed properly, though it's not the prettiest 
> pattern and also clashes with the objectives
>    of D4.10 ("Precautions shall be taken in order to prevent the contents 
> of a header file being included
>    more than once"), but then a motivated exception is allowed there.

Not really sure about this one.

Jan

