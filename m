Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F360E344
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 16:25:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430620.682523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onhKx-0007yl-E5; Wed, 26 Oct 2022 14:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430620.682523; Wed, 26 Oct 2022 14:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onhKx-0007vp-B1; Wed, 26 Oct 2022 14:24:55 +0000
Received: by outflank-mailman (input) for mailman id 430620;
 Wed, 26 Oct 2022 14:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onhKv-0007vj-TV
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 14:24:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140059.outbound.protection.outlook.com [40.107.14.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4043257-5539-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 16:24:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8836.eurprd04.prod.outlook.com (2603:10a6:20b:42f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 14:24:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 14:24:49 +0000
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
X-Inumbo-ID: f4043257-5539-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coCrfAQjgqu8FNe34VpupCY7IT9zLFxD/eBmE0kudqMWCvFIyhMfzUAxm2cHBAf/NtrpuXLcrKX2qJRWPE9XqciZ2e7ALjwlGdDx4CEQH6EOZOvRKLRrpq+10DeLz/lKPEdEmp2vDXYchn/wjgpjz3NMl7jKcCdNUBvPbD6CAbt84hzBFKjLgnKjH+bmHCtBZqG3gkCGIC1/wzYSsLdGEh06cYXEMjVd1YA4FYsy3nshUkcRwFkHosOJxBWjB9xko3G7hZBTmCMpYhQAfAvAgYalNEHdNsq3br49Y9ijs0KqV/k6tasZAYu9K63pC8RuEC0tInZn/VeXyaO22TTuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWxrGAWAw0/X6LENbgHoP2IGgFGkCRf3WP3OUYrnITE=;
 b=i6+E0oGM1VcTOvN+94BjwdppQs1T0C6FiCb/59fMyl+8gbOZoG3duVzmxMCVr+eZpyf1c4Yi5rg195jLHLwFKNd3NX1MWAg5EiruVcm4iY9Az1Xf9eMwlcCZ5FP0nvtU2sX8bvdNXNeFtbr3FYtU+YYrytyh5baoRe8zZllbEfFUOiG6GhsJSjiDRXOxsHnN/u4pA8mFgqpMaQfM3Y4AhmOeI10b9B1NiVuCv3XdgTI5FD0F44YWvIDZEmYSFEBLJN4Zt2+OGdcQPIV485tOEjY/ChnCuXXfeTK1uDunqZegvFwJbDYzOEDnyeyO4fMSp611RT0sf23wySer1xHSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWxrGAWAw0/X6LENbgHoP2IGgFGkCRf3WP3OUYrnITE=;
 b=xirivownqJMpHWnDxoU73oI7Hf8fUrfLfumzHa9NYWL28ZwYP86n385oG/dfiBTo4Vpp1IUNmACUMuANhGatJ64Xo4Jfb6a3gauz6zJha8BW+MrNrYHsMiKlfua7zzoHMyd7yXdpmUackZTs1bDhWrt2z6TMRU/QCAcWQ/Vv/NohMIB9kG8bNyUPudRVNYuAOL39VDVPG1AoEdBWnTk1yTy7MxpDiCVAAuHpVQYiVN3yf2d1ja0//Ui+mXNwFUvkf69yls5RUfwLzB/oar7BjhY306IFUZqklkP1FISwfEMcF3iVHcm2um5SWehcndqo/Nm4Qs2jDMM/83IyZwxrCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed2b08ea-db8a-fca0-3583-ead23043ae0e@suse.com>
Date: Wed, 26 Oct 2022 16:24:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/4] tools/tests: Unit test for p2m pool size
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221026102018.4144-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0037.eurprd06.prod.outlook.com
 (2603:10a6:203:68::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f194ee1-a6f3-41b4-9783-08dab75dd711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SEU300JEUq20hr6dYMkiz7urWnXA9ZViDYuEfO9eOM2IqSB6B87FBd9bjTW9xN39fftpGPU3z7an5gX9aA7DWqNhwW6bG5zJaaBoMynPBqNzUaQV82hDYvPHMmXKqq0TbV1ozgxtnEDtMk6sanZRJzjjg+moMhAJrnR6lgw1SWzfvKHjDWh/nkgGgrhDZoQjgAqgkhnXo9hF9He18SiqVuBVU8nktC42/IgwTObIhTUoz070zvtD/l6Krlj1x1cN+GtBPsDqaSUBufU12R95y6f91zXWczIQRDmywq38NTxSiWqX9IgvGbX9qOo5pEHHI8nFqC6+a3FsmwJYAFQMfUK2+S4uTJg9famicul9mSB4MXHNHyKF2/tMVoXjKSp7QnPttLjl0oIKOUA2eHPEe0kdhYfqCJX75saB5FMtZG2G/2tIhQVbxLxXsIBsLxuROgID0HI89nAbM+pJoh1QroxH1Jg6PtZc8GjxRrViQmb7UICD/ijdOUdiqC1T+6mqH7ULQv5WYXEjaHkON//RO5gPKiZqhq2lowg4vBgjqc/Vn3T0HEG+Ti/a700u7qQ8EPYwlaCgCquR+/mDfRI80/Qy7KIuZuA/mTkdDJ8c3425C71dra+u3s1NGh0K5QKaG6YPOpd46kJgcuOoL568DDNtgUm7VdLKokEfYMxojyWgCBqW9zA9Zi7jql5FqwzP30Jr/Wp2R4xmy0w1SN0Vp9j7RlLP1iLqLLV4HibpJME2oWbzPxlRnW/kzxubnqA72RNZ4HYQMwf5yZ6watlYcK14+j2au5BYUOFDRobj2vw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199015)(66556008)(66476007)(66946007)(8676002)(36756003)(41300700001)(2906002)(4326008)(6486002)(8936002)(6916009)(54906003)(5660300002)(316002)(38100700002)(83380400001)(6506007)(31696002)(26005)(53546011)(86362001)(6512007)(186003)(2616005)(31686004)(7416002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUNoR0M0TnZxTkc5K0JQOUY0amQ4dG1rUnRhNjc5bkQ4WHRQbitxN212TmpN?=
 =?utf-8?B?c1k4MU5pTDJjdWFRZ3JZZ0Z2SzZCWm9XNk1kNGhXOHpQK1JyTHpScGRpY3ky?=
 =?utf-8?B?QnBadlFIenFaM2dHSWdvYnc5K08vN3N5VTBQSm1YYlVaQkgzeGZNL002MXBt?=
 =?utf-8?B?aHZ1Z1hDOEJqY2pHUVdxK1Q3QWNpVWV4ZDVyVlBUdUhqSldJTFlhemd4ZE1S?=
 =?utf-8?B?Mit5MFJQUlVKTEdtVFU5L0JtWEFrTVpqRXFhOGsxTVNvM2xxVVN0WGtSRlhF?=
 =?utf-8?B?Y0ZDbHByOWZtTTRoeUg1dE9MRHlsZ09NUTBrNWRJWVJ3NEtRaDNtZUQyYUx6?=
 =?utf-8?B?d3RKbkdkRURyMmtSVUVhVHIrT2pSZXFmb0pFa3VCR1BYT3B2UkUrRFBQbTRk?=
 =?utf-8?B?WXQ1UDZwQ1c2bHpWc29ZL2VoNnFzcVFKYUFBSCs0czk5dkQ5bVp4Mk1nZW1R?=
 =?utf-8?B?dzdFYVF3QTJxM29UZGRoRWg4RDlncm1HSncwOW9INUE5aWpseW5INU5vWFNm?=
 =?utf-8?B?ODIzTk4vNVJoR1RDcXR4U3NBeHVNOTlveTB6RFpUcXlOTWtxL1VnVkJVbkVS?=
 =?utf-8?B?SjRUYi9BSjZHaWxzNGl0MjViekd4T2hHbWp1Ny9IbWozdHVKL0RRWTdJbjZU?=
 =?utf-8?B?bnNCTnBWMy9sS3dYRDRES2grODRLLzRWQnplRkpYU3NpR2hraDNabFVrYm93?=
 =?utf-8?B?ZWRNTnRTVkNyTi9Ramp1L3FhU0NaNWdqdFZCM3V5aU1iRWNEYUFjZW91WXh4?=
 =?utf-8?B?RGU5dmkxN0ZENFBoRjRFR3hzQytPM1hhUjJLWkQzTWs0Q0RIL3FjS1pOR3JJ?=
 =?utf-8?B?akl3VEJobThWUHFMZG4vUWtXSmpaRlo3NmRGK0VmWlpIOHAzMXJoZm1lMXFt?=
 =?utf-8?B?ZXNBRFI2NTE2bUU1MWcrNVZyVkU1ckROT0N1Y2lGSDlyMVBzK3VYWFpjQktL?=
 =?utf-8?B?dDlIdEQ0OEpzaXVwQWpIZTJZYmNyZzhqa0RtUHBVc0U2bjFiUUZHaDFQL3JI?=
 =?utf-8?B?NmMxUTJCbHNOVkd3RkRtK2VGY2hiUW5sVHdDWnhMbEl3ekRna1h6TEZ6TlRT?=
 =?utf-8?B?ZEJvSWh2SDNOSU4rZS9KR1lGWnBjdlNXc2lVaFlzVUJKUWZDT3FQQ252UEVK?=
 =?utf-8?B?QWNQTitRNnZhcGhJdEh2RVlFSGpNaVVCejFMOWhEZ2NaWVNUSWlnNW85ZlFK?=
 =?utf-8?B?NFRFcU5tSHAwNS81dnBZOHJPSURHVTI0R1VYajkyQWJSV3N5M3RSekMrK3J0?=
 =?utf-8?B?K1F2VDBVUERobFYvcUw2ZXdSRWZUdFdIZHhqbDhlK3F5OE9FczNZcUNIdjhT?=
 =?utf-8?B?USswbmdTSzNmUUV5TE52UUNZeEdZZmJ0dzRocUE5WXRyNm43bzRpYktGV2Vp?=
 =?utf-8?B?eitSQ1F0MnZQQzErMUxJSlVObnhJQkU1N2xHOC80OVV5TndwRVJPRG1Qa3Vx?=
 =?utf-8?B?QU1pajdHdU40MitkTVFVR0lkRWFhVi9HQ1BWWHJPV2VqMTdFL1pXMlpJaFAr?=
 =?utf-8?B?WHg0OThzUWs4V0NEand2bHZZOC9NUWlXVFZweXdjdERoeFdJWkphZ2Fjb0Fa?=
 =?utf-8?B?S3lEU1F6QVRXcGhqa3lRM3VGZjAyRS9ERzk4ejJtVG5xR3BITk5WV212QXFB?=
 =?utf-8?B?ZGIrSlpFeGVJUVNkTGtYOUxrd2FIZ29wV3pwOS9OYjBvUGRERm5LWDFPNERD?=
 =?utf-8?B?THIwTWZ4UThLOHNieFdkRzJqcEdNRVRBOTM3SWVhVDlMMXJRdFFXbzBKa3Nt?=
 =?utf-8?B?YXcwVFNKdUlHc1FMSFEwRnhBaE5QOEZmM2NYZGtwQ0k1am4vS0FVbm1CL0R2?=
 =?utf-8?B?NElYYStreWJCNXJzZGZIV1hic1k4NDJoTUdCWjdRTk9hZ2R3NU9BZ01TaWVk?=
 =?utf-8?B?RHJHYVI3ZkN5azQ0ZjdrN1JWeDlINGhJcmhPYTRBdCtMSUtub2tBdXNLVFMz?=
 =?utf-8?B?SnkxNVoyYXdrWEI2MmpZZGw4Q1hTd2xiWmlLNkQzR1JXY0NxN3FkbXN6VGQx?=
 =?utf-8?B?a3R4aHdzcEs4cUZGMHIwUEhwMWhsVnhxaUJGTkZvSC94anpqWTd1Um9ESE9a?=
 =?utf-8?B?RTIrNC96ejFndDlCTGtVV293NVJZYm0vbnlhYk5lNkprbVlzUEh0Skp2Z2JT?=
 =?utf-8?Q?Vp3NV251AzOMXb9bpvoxspVFK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f194ee1-a6f3-41b4-9783-08dab75dd711
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 14:24:49.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nldW4ExYuChpY9VvZIaUR9Rk6iItX51p+uBfubLSpAYY/3W5Pg9fmuvyTARvb5tXvc0d7OLnTFCrArNSgO7SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8836

On 26.10.2022 12:20, Andrew Cooper wrote:
> --- /dev/null
> +++ b/tools/tests/p2m-pool/Makefile
> @@ -0,0 +1,42 @@
> +XEN_ROOT = $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TARGET := test-p2m-pool
> +
> +.PHONY: all
> +all: $(TARGET)
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -- *.o $(TARGET) $(DEPS_RM)
> +
> +.PHONY: distclean
> +distclean: clean
> +	$(RM) -- *~
> +
> +.PHONY: install
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> +	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
> +
> +.PHONY: uninstall
> +uninstall:
> +	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
> +
> +CFLAGS += $(CFLAGS_xeninclude)
> +CFLAGS += $(CFLAGS_libxenctrl)
> +CFLAGS += $(CFLAGS_libxenforeginmemory)

Typo here or typo also elsewhere: CFLAGS_libxenforeignmemory? I
have to admit that I can't really spot where these variables are
populated. The place in Rules.mk that I could spot uses

 CFLAGS_libxen$(1) = $$(CFLAGS_xeninclude)

i.e. the expansion doesn't really depend on the library.

Apart from this looks okay to me, maybe apart from ...

> --- /dev/null
> +++ b/tools/tests/p2m-pool/test-p2m-pool.c
> @@ -0,0 +1,181 @@
> +#include <err.h>
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +
> +#include <xenctrl.h>
> +#include <xenforeignmemory.h>
> +#include <xengnttab.h>
> +#include <xen-tools/libs.h>
> +
> +static unsigned int nr_failures;
> +#define fail(fmt, ...)                          \
> +({                                              \
> +    nr_failures++;                              \
> +    (void)printf(fmt, ##__VA_ARGS__);           \
> +})
> +
> +static xc_interface *xch;
> +static uint32_t domid;
> +
> +static struct xen_domctl_createdomain create = {
> +    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +    .max_vcpus = 1,
> +    .max_grant_frames = 1,
> +    .grant_opts = XEN_DOMCTL_GRANT_version(1),
> +
> +    .arch = {
> +#if defined(__x86_64__) || defined(__i386__)
> +        .emulation_flags = XEN_X86_EMU_LAPIC,
> +#endif
> +    },
> +};
> +
> +static uint64_t default_p2m_size_bytes =
> +#if defined(__x86_64__) || defined(__i386__)
> +    256 << 12; /* Only x86 HAP for now.  x86 Shadow broken. */

... this shadow related comment (the commit message could at least
say what's wrong there, to give a hint at what would need fixing to
remove this restriction) and ...

> +#elif defined (__arm__) || defined(__aarch64__)
> +    16 << 12;
> +#endif
> +
> +static void run_tests(void)
> +{
> +    xen_pfn_t physmap[] = { 0 };
> +    uint64_t size_bytes, old_size_bytes;
> +    int rc;
> +
> +    printf("Test default p2m mempool size\n");
> +
> +    rc = xc_get_p2m_mempool_size(xch, domid, &size_bytes);
> +    if ( rc )
> +        return fail("  Fail: get p2m mempool size: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    printf("P2M pool size %"PRIu64" bytes (%"PRIu64"kB, %"PRIu64"MB)\n",
> +           size_bytes, size_bytes >> 10, size_bytes >> 20);
> +
> +
> +    /*
> +     * Check that the domain has the expected default allocation size.  This
> +     * will fail if the logic in Xen is altered without an equivelent
> +     * adjustment here.
> +     */
> +    if ( size_bytes != default_p2m_size_bytes )
> +        return fail("  Fail: size %"PRIu64" != expected size %"PRIu64"\n",
> +                    size_bytes, default_p2m_size_bytes);
> +
> +
> +    printf("Test that allocate doesn't alter pool size\n");
> +
> +    /*
> +     * Populate the domain with some RAM.  This will cause more of the p2m
> +     * pool to be used.
> +     */
> +    old_size_bytes = size_bytes;
> +
> +    rc = xc_domain_setmaxmem(xch, domid, -1);
> +    if ( rc )
> +        return fail("  Fail: setmaxmem: : %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    rc = xc_domain_populate_physmap_exact(xch, domid, 1, 0, 0, physmap);
> +    if ( rc )
> +        return fail("  Fail: populate physmap: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    /*
> +     * Re-get the p2m size.  Should not have changed as a consequence of
> +     * populate physmap.
> +     */
> +    rc = xc_get_p2m_mempool_size(xch, domid, &size_bytes);
> +    if ( rc )
> +        return fail("  Fail: get p2m mempool size: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    if ( old_size_bytes != size_bytes )
> +        return fail("  Fail: p2m mempool size changed %"PRIu64" => %"PRIu64"\n",
> +                    old_size_bytes, size_bytes);
> +
> +
> +
> +    printf("Test bad set size\n");
> +
> +    /*
> +     * Check that setting a non-page size results in failure.
> +     */
> +    rc = xc_set_p2m_mempool_size(xch, domid, size_bytes + 1);
> +    if ( rc != -1 || errno != EINVAL )
> +        return fail("  Fail: Bad set size: expected -1/EINVAL, got %d/%d - %s\n",
> +                    rc, errno, strerror(errno));
> +
> +
> +    printf("Test very large set size\n");
> +
> +    /*
> +     * Check that setting a large P2M size succeeds.  This is expecting to
> +     * trigger continuations.
> +     */
> +    rc = xc_set_p2m_mempool_size(xch, domid, 64 << 20);
> +    if ( rc )
> +        return fail("  Fail: Set size 64MB: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +
> +    /*
> +     * Check that the reported size matches what set consumed.
> +     */
> +    rc = xc_get_p2m_mempool_size(xch, domid, &size_bytes);
> +    if ( rc )
> +        return fail("  Fail: get p2m mempool size: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    if ( size_bytes != 64 << 20 )
> +        return fail("  Fail: expected mempool size %u, got %"PRIu64"\n",
> +                    64 << 20, size_bytes);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int rc;
> +
> +    printf("P2M Shadow memory pool tests\n");

... the question of why "Shadow" here.

Jan

