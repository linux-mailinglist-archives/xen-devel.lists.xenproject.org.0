Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8490751BA7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 10:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563013.879877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJrmf-0004DY-Q9; Thu, 13 Jul 2023 08:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563013.879877; Thu, 13 Jul 2023 08:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJrmf-0004Aj-MH; Thu, 13 Jul 2023 08:34:45 +0000
Received: by outflank-mailman (input) for mailman id 563013;
 Thu, 13 Jul 2023 08:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJrmd-0004AD-Tf
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 08:34:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c9da47c-2158-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 10:34:42 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8522.eurprd04.prod.outlook.com (2603:10a6:20b:431::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 13 Jul
 2023 08:34:38 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 08:34:38 +0000
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
X-Inumbo-ID: 1c9da47c-2158-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwGUw8kNlzq06YuWJbVSIniM4+qe34iBIe60f1h4BhCTGIh+DOLbPL3F8nj6UULLst0NGpDg/rH+1+UMt8chdfrmikOWfuwltKSd0/fsP5cJVIkeLXcgy1RCn9ZP3z8XTEQnzLXtX9FUHhDQRorbZvdD7OHE5P1syN6ArDUCUsanV7h5UpgCnnD/Y9qPqBR5rPMAwa5POdgYYVZCoyAErT0OrZ46KQs3c6J26K37B/Zz4UvdBfwGz7adaWc8PMu34qlqrloKCqOcOJ58PWqS76NQdqfLQucZCbnoVp8rIB9U4QJNvfbyitcga7L5sd+v/4ynjvCXXUrXVa3XZaj0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uzpr0KNsi9KArvSLtlgVEBn4FYzY/UzYTVybChcsCeI=;
 b=NfL0+Yz62rDvSilV7NC5P2xEBLrdsVoDdm8rVq8wqsf0VtXCUMbonhUEOWLNDwehKDjUOj7Y2vdCT7+YtkR3FxP4BRH8pa9XBrtWdJtcI8X5wddAXmCUwHWEvEKzRkyZyUn8n5FF1ua8J1AirZCjZqVTnhIulTAFoY6GpwNyi0STrr+RIdOh+plNlTB07EubCGCCK45bJqdzUjh3BnpUI5M68me7H9xJtQNmaFAo54nk5AGarYs7Adeg2sAp7ir7a5N9QfEViOgCTzKd1Qtj9DyDTUTNpwJJg4AN/Ubq08FoocDPAHFbuEGeCCcOnPovrflYG+zd7C60vEXDe18u4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uzpr0KNsi9KArvSLtlgVEBn4FYzY/UzYTVybChcsCeI=;
 b=X4Fi3fZZzjniAv/5qyC/ntH1Rz5dxnbsNYhCkMbzpyPxDF2pWakXmjGD3iGF1fNcM/Td+r1wFZSWdWow9PsSay29dWRZeJzW1GlAPPCVoIDBPwlUySeoJ6k7uLN1mw9Wt+Zn9/DxJfkv+CcPqGlFbMxJxU5ASVREHa450VdPEl3RNOwRRdya+ykwo1bRAW2sqPWm5Xx9lajRKFu3HSf4t/5/S751V22JB3lpscb4SD8vpZotuWN0kbbvFfyyGryBNP7E7M3sW8zdokUFYeE1VcOfONsZDSgspo1E8agHiXVaY1frBEAxzDMmQYBd6ZEM7POVBw9glu7kiK6N/1zzTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d785bbdb-22df-c76e-087a-7ffc5532ae4e@suse.com>
Date: Thu, 13 Jul 2023 10:34:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 00/15] xen: fix violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>, Michal Orzel
 <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: f82a6a8a-9445-4392-d159-08db837bfecf
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fMtB704pkdzlULRKZ0IP9kJkKpTqXAu/z0catzUEAYz6J66ScXDgflyA2TLpBwY5C1v9fx5PJVAwUMA9YmV84DVt/kDjiX1S00EB28oSJUNsDI4q0G8+bmUfW5IJkHJQa7+iN5m1Ws0MueDy3Q3C6xY/iOx4SzOmIjOjbJTFzTpR+Gk2lEfwfzuNcp0HLaiTTYVsBGeWo7NjbiBp5epKxzBDlA0iLp282zWeSV77leghyuSwFezZEkWdiVIh97E3n/srS/wSiawCL2+gTOvKUn+QSqejjtFzVXJR+/GcLN0/SbAdiUD/qw2FVSFFUPUfc4vN1eSbgSzDU2ozw5SDYdYdH1tWVZdH1LVceHrWmMTOwwyAl2oXZ8UYZ49tVhzteAJPvh/hYhANBUZEhgxqGwqM5IzD6b289e9yOqxX7/+xMEJ9ILlOl1WVf9cVm6CVMxyu6LNNlZsVqEMvoBhjveoctnJUrO+9x3K6TXZNfRERGq+A2A4fLsRRR+Hv9/nfXWkz5CkYQeJ4kPd04W25+0gkgcar11q/4N+FXNIh9dU5mnWwWRkvSiMI0knJq5sjL6kzqcuB1EyzFxs8kdTtuDchJA+eSyO4U0vMVsCGBfbdWy5kZXQLZLccVF5+ddbUd3CirlMH1GxXm3fMLAJzqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199021)(38100700002)(2616005)(53546011)(66946007)(66556008)(66476007)(86362001)(478600001)(110136005)(26005)(186003)(4326008)(6486002)(6506007)(6666004)(36756003)(6512007)(316002)(54906003)(31696002)(7416002)(31686004)(8936002)(8676002)(2906002)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW9OcE0xQTlsQ3VQTGdCRkRoZXdOWG8wUUlXV1VXSm1rSzc5eGdEbXB5M0lp?=
 =?utf-8?B?YXcvUUNHWmhzemdRSHhrenNJbkZubzlVWkc0V01VNWwrT3pZT3ZET3dpNFZl?=
 =?utf-8?B?ZGh0OUdmRXJYVjQ0VTdBNmowdHh6VVFmUUM2dkp4QmJWQWwrVklCSVdRY0Zn?=
 =?utf-8?B?R2laNEM2Y2FrT3VZamxzT2N5YmRmS2hXOUhNdFpwbkRsMW5KeHoraWpnQnBG?=
 =?utf-8?B?S2JGekpCU0M3WURTOXR5c0dsUSsrOTlBSEt0TTg1VFZnYnZMQ3JHOERhdGVJ?=
 =?utf-8?B?TDJoMWF2OTA3OGt0VGRJM2pkSUEwTDFMRHUwYzZNOEUyY2RJVG00ekhyUE91?=
 =?utf-8?B?M3hmbmFDRlpxUkp0SkcvY05xdWlzQUplaWlNZ0pydFBqazdycEdacHd3ZHVJ?=
 =?utf-8?B?WTF3K1hKZVdIaWZpKzgwWHhKdHZ6OGQ4cHE2a2o5NlQ2Z0pVQit4cjVRYVdr?=
 =?utf-8?B?RnVmOUs1RFUwTGl5K1orWm50aUZTZEhFMVZkMTc2OTh2ZzM5cWx4VU1sR0FX?=
 =?utf-8?B?Zm03Tk5CYVl3Q3R5OWpWQVR0Y09CUktyU1VMV0ZUQzE5SDdtSWVOOUl0SDFX?=
 =?utf-8?B?YXo1UGlmMkR3c3BEbUJnZ2RzU09IYld3eFFHY2l6bVV4MkxRU1hNeEp3ei9t?=
 =?utf-8?B?NUpwR3RtRHZkR0R6SDd1UjNlbmlDQktHNXEwUXRtUjkvbjc2YzFKNU44RTRo?=
 =?utf-8?B?dy9XZXl4Z3Q2ZkV2V0R0UXJtNW9RYmJTR2NXSDRJcEYrb09EOUtKNVdjNDM4?=
 =?utf-8?B?Y1VXTS9RTDZQaEIwYUN1Yk8yNnh3cWkrRjN5MlpnTGJ1cDltVVpmbmc0eW5E?=
 =?utf-8?B?YVY4VTlPWldhZVdIUFVGczZyWUl3bGgyelByZ2l4NGk2TWpiaG83dWZyQkYv?=
 =?utf-8?B?OVJ0WkFnVlU0UFFHTitkUkpnOS9uWGNuUFFXNDIxNFF2a29nZGc1K3ByTDRQ?=
 =?utf-8?B?QTFPM1l5aFZLazgwTGZNUUhQUWhzN0ozWTVucWRCdHpPR0hBVjRCcUNCSFRB?=
 =?utf-8?B?K1ppTTltZEtpeWg2Q1dXQ3VySXdoRlgwOThBenpQOXpiWUtGM3ZLUHlyNCtx?=
 =?utf-8?B?WFZJZ2VPRzV3cnJNbWtHYnpxNjFuaXpPd0cxeGgycVh5bFZIQ2pnYXpndzRV?=
 =?utf-8?B?ekFDWFdxS0lxR0pGaDgyWkJKRVY1T2l4ZTlOQ01hUnJUNXNDTkpUOGNlcXlK?=
 =?utf-8?B?ZUVFVGpKZDBqUEZkWlFUelF0SHUwb2ZHS1YrR1MzaklZZEkyQUFvaFJPMHVP?=
 =?utf-8?B?azRLUm9IcDlVV3lSMmx2Z252aDFONjBYckt2VXJ4SDVrM0t3d0N5Q3AzNkxD?=
 =?utf-8?B?VjF5Ym9XMGFmNGhwU2dNY210elFWdE1Nak9uNkRiaThLeHFpOW5lNzdDQWFh?=
 =?utf-8?B?R3hmNWE5N1lyOE1JdlhnUmsxSmRYcTRmTm54UDQ1UCt6OUNEVnNkNEdkeDhk?=
 =?utf-8?B?alVUWkVGUGZnRDdmNUhmbEVTNnJRblU1WXZ2MTdCTExFb0prWGo2TStLTUFN?=
 =?utf-8?B?YTQwSDlNa2RVdG5IY3E0bzdLMTF6a1hXWGJsQUhmc0M5by9rYVBVTmFwOGYz?=
 =?utf-8?B?aEVSd0k3WC9NYXRTOU83Umh1TE9MeitiazlLbVJjaStiT3BYN1JBbTZ6dDdO?=
 =?utf-8?B?eUhPK1F1MWhnNms5U3RyRkRleHlOQzhwU1VvVzVaZzBqcnlBdEo0S3dPU0Fm?=
 =?utf-8?B?MTZJUHJLSVNqWTJ6eldpUy8zaVNpNENVVUJqVE5UdTI3QlRyS0FybXQ0RG1H?=
 =?utf-8?B?VDNuZzFDVGQvRTZTaE82QUV4c0VWSVcwS3JOWENCOThBRVVoL2hjZHQ0S1Ex?=
 =?utf-8?B?bEYzckdtNmdnYVhxN3dvV2JyMGs0YUduWWpWQ0JaaUsxck1ORDBwWklaS2dD?=
 =?utf-8?B?R2JySGt4UUhwT21ucVpKT3k5SnpGeXZEVUhBLzdNVjFlazRpcS85Y05UR0xR?=
 =?utf-8?B?clpocWtJMzVaaDh2TkRJUEIyVVQ5MCtQT3NTVjhYdTV4bEpNQXI2Q1VNSjhs?=
 =?utf-8?B?WjRWUUxMWDhwK29CcjJ3Q1dTN014OENsa1BreDZNR0F5ZnhnaGtMbE1nWk1m?=
 =?utf-8?B?MXMrbGpVaFpiQ0tKSUVRUmwzcWJjaDZxcjNBRDVjSjBTV2JQeGtmYjNaYTBW?=
 =?utf-8?Q?fRU5zE0mLP6fAGMUCDLUD93i/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82a6a8a-9445-4392-d159-08db837bfecf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 08:34:38.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I90igndqJktqLUo2YNG5mV6m6ctREEDi8LOSQoDApJMWO8UsPmAREWdh+LcQovJYVErn+/0IafPTr5IAe2flDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8522

On 12.07.2023 12:32, Simone Ballarin wrote:
> Changes to macros 'X86_CR0_PG' and 'MSR_EFER' in files
> "xen/arch/x86/include/asm/x86-defns.h" and "xen/arch/x86/include/asm/msr-index.h"
> are not made since they are used also in assembly files.

Following on from yesterday's remark here: Both files are touched anyway,
as per ...

>  xen/arch/arm/domain_build.c                  |   4 +-
>  xen/arch/arm/efi/efi-boot.h                  |   2 +-
>  xen/arch/arm/gic-v2.c                        |   6 +-
>  xen/arch/arm/gic-v3.c                        |  10 +-
>  xen/arch/arm/include/asm/arm64/brk.h         |   2 +-
>  xen/arch/arm/include/asm/arm64/efibind.h     |  10 +-
>  xen/arch/arm/include/asm/arm64/insn.h        |  16 +-
>  xen/arch/arm/include/asm/vreg.h              |   2 +-
>  xen/arch/arm/kernel.c                        |   2 +-
>  xen/arch/arm/traps.c                         |  14 +-
>  xen/arch/arm/vgic-v2.c                       |   2 +-
>  xen/arch/arm/vgic-v3.c                       |   2 +-
>  xen/arch/x86/acpi/cpufreq/powernow.c         |  14 +-
>  xen/rch/x86/apic.c                          |   2 +-
>  xen/arch/x86/cpu-policy.c                    |  18 +-
>  xen/arch/x86/cpu/mcheck/mce-apei.c           |   4 +-
>  xen/arch/x86/cpu/vpmu_intel.c                |   2 +-
>  xen/arch/x86/cpuid.c                         |   8 +-
>  xen/arch/x86/efi/efi-boot.h                  |   6 +-
>  xen/arch/x86/extable.c                       |   2 +-
>  xen/arch/x86/hvm/hypercall.c                 |   2 +-
>  xen/arch/x86/hvm/irq.c                       |   2 +-
>  xen/arch/x86/hvm/pmtimer.c                   |   4 +-
>  xen/arch/x86/hvm/stdvga.c                    |  50 ++---
>  xen/arch/x86/hvm/svm/asid.c                  |   2 +-
>  xen/arch/x86/hvm/svm/svm.c                   |   8 +-
>  xen/arch/x86/hvm/viridian/viridian.c         |   2 +-
>  xen/arch/x86/hvm/vlapic.c                    |   6 +-
>  xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
>  xen/arch/x86/hvm/vmx/vvmx.c                  |   8 +-
>  xen/arch/x86/include/asm/apicdef.h           |   2 +-
>  xen/arch/x86/include/asm/config.h            |   2 +-
>  xen/arch/x86/include/asm/guest/hyperv-tlfs.h |  28 +--
>  xen/arch/x86/include/asm/hpet.h              |   2 +-
>  xen/arch/x86/include/asm/hvm/trace.h         |   4 +-
>  xen/arch/x86/include/asm/hvm/vioapic.h       |   2 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |  84 ++++----
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h       |  16 +-
>  xen/arch/x86/include/asm/msi.h               |   2 +-
>  xen/arch/x86/include/asm/msr-index.h         | 202 +++++++++----------
>  xen/arch/x86/include/asm/pci.h               |   8 +-
>  xen/arch/x86/include/asm/x86-defns.h         |   2 +-

... the diffstat, so allowing other constants there to be used from
assembly code (if and when need be) would be a good idea as well. I
guess this may apply elsewhere as well, when constants live outside of
#ifndef __ASSEMBLY__ sections.

Jan

