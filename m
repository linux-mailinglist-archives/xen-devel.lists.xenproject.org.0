Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3670162D7AD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 11:03:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444869.699993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbjt-0008AS-Na; Thu, 17 Nov 2022 10:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444869.699993; Thu, 17 Nov 2022 10:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbjt-00088d-KG; Thu, 17 Nov 2022 10:03:21 +0000
Received: by outflank-mailman (input) for mailman id 444869;
 Thu, 17 Nov 2022 10:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovbjs-00088X-Ci
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 10:03:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f572d4e-665f-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 11:03:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7928.eurprd04.prod.outlook.com (2603:10a6:20b:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Thu, 17 Nov
 2022 10:03:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 10:03:17 +0000
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
X-Inumbo-ID: 0f572d4e-665f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHIXE+7fiLfhtSNuQIzn7eD8twolVwcsi3c2Ri9MsfWcdC4IdEl4eH/UN2pzgC/4GVDyOKwtH0ZuR7L9RODHr1Ywgq5DOCbgiNyELnR8ov6TwF/scULNC0gcHzhXlg3Z3mccd2ltFsrZMvUho3O2E/E35dvQ4X9IgAUVyxxxA20+Eiu8JXHfuyky+tA5nI5M5gDkY2u2YIwHwekm5GvX8yNjPsAuli4WJ32NGWJk3gRzfGUkTjsfOqXIaWatqgH3CqCxAOFgxyhER9HniLoIFvRtRbqO6AJvPO9VJ9wQdXEmhUzntIC/M0to3naiwR95QvJKrBeov3ofHfzqs5LGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuNei5qwv6o/7msBDuVlcfNyV0O3NJszWiyVcHWKmx4=;
 b=Uk5aoSHKYojyVOxZLRjo9P8M5fx48U1XC0JOxv9IOSaiNI6JxmEsDS8O9ewY8ag0FWYEO/RcnTetyVm2OJadcuH/23eaqs/gdY5LMKUn7EXRxI6oNgYUkycBaRAnbdibwduykR6F92iOPRhKljmb0u30RcS6itWnvDq5MIKSOa114cEyPP+2dj60SrMcvgRucpGR9mITpRePCSKSU17qJd7vlcWNDT8ea4ipSVNbWLoQR3H7W3EaD1fKSuH9bJkMBSDveKssoJ1U1TcdRwkwGRW+Q+tT+odB1uQ57fATsaXGiYyw0bcremMAM7fae4OUNvn2x8z/5qCFgvJGYCIjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuNei5qwv6o/7msBDuVlcfNyV0O3NJszWiyVcHWKmx4=;
 b=aSy3wG/JXA2VUyuwRgdwleP073A7OhYuOQLK/DSmCnKk/2Pe1wg/hI2mkYwv9tS1JUuvQb96GL2kp7LXATrONk6lFVMyeIM/i0ZLXKUTZkdjoELgFnjFxiq+LMtwShG/CMbR/+NxcXro73TNJNEJO8H2SeMJGUj4smZhdNEfO8jXerU/SqlHZWl+62XKmVZB79ZVDlboY7jZIw36CpsEPg56B6nIIoOd3lpCSS5274IXQZadlQMWy1NjI1rdONOwOZfY3Z9up6vi2ol9+094nRjzs2Qc0E/6d2A52lYhifI6XCGQiBUgnNLRp33FDL5pwcmw+VcVE6aBKNdrPnVN4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93736488-8e0c-282a-2e5f-db0cf9419183@suse.com>
Date: Thu, 17 Nov 2022 11:03:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] docs/misra: List files in Xen originated from external
 sources
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221116092032.4423-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221116092032.4423-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 6594b289-4975-4774-262b-08dac882f2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AGEdzP0CKfdTCuDmLx+veJwz75yGfko/rmS1NektElC9pAcDUlnuZOAIzpaGc3qDjT4YI9jODdIYZfCqciE99SsHaYrBR0qrmRpSZNV0W2b/4YqtxMBAno6wFU9PL1urnrcnvJqIlcYvsqiwrNwrqQv3TXSiNhATjI8pp+BYFnZh92825xPMyeT1pGnl8atyjn8AFVgcgHSvLOFnRwWeOnhpR9pS66noJ9Hzx/CUbUQFilLtZbXokIgHbIca1Wz/SY59Gxqi2AeIJviSSRJVIJkaygRQIxWdGc4YbqkawlIlhl4j+PxvkRFT+Q5Jhe5Dp4EAnrMfqHfV5TtskislqUAvdjL5PQ68VUpivSN0p3V2qYS9xKMVMDG0zBF+ylJ6Tu0ae8OMKCgiGhgrfKdawvlxadY81f6OE7pBp9qCCXmFsACOkzWjdoHJv5Ol0qcneTZ12d/fvJdLu6OKRd2uH5ZbbATwceuKreKuNQY4kaY1bY/1HW3BYmiO+cA1Z7oASQB3gkVEYE0iUSJ3M60Bxpi9f/xq4yxUk3q7mU8WynC+XZSKzvauiXjVJxG3mUzUq61eJhvZ/7GgpoUQnsPdsJ2NLQLsrc4MUXLJUWIghntcGUvusEPnzdHQkcoCF/mKmrjSFqZSsQAfBDHH/tnzGSGpcMeJPzvMLUy5S9LhyTCkH4/brDurM5zuMyMe0uEv6l9jwl2oRgZ49BeEl8ArJolzYMXFkM5501w7UpppvmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199015)(66556008)(4326008)(66946007)(8676002)(316002)(66476007)(6916009)(31696002)(8936002)(86362001)(36756003)(41300700001)(5660300002)(478600001)(2616005)(186003)(53546011)(6512007)(26005)(6506007)(54906003)(38100700002)(6486002)(83380400001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmRVckkycStOVlNwOHpYWGtCNThBS1AzTHJJbERSY0NZMWMyYlFFYnQrV2xI?=
 =?utf-8?B?SnFoaURlcitaUWhWWlB2YVlIOXFiRVhLQklnYU1IdkQzQWpSbHd3MWplcm1W?=
 =?utf-8?B?c2V1NkxzSTJNaEZCL2hobVFhNjNvSWRiR3hzTCtHOTJGS2RRSVNab3lHZTVV?=
 =?utf-8?B?UkdHNXFkOFdKT2R5YU9hMEpWR09BUnBPa2RqSUtPcUIwaUlEclhEQ3NXRnpB?=
 =?utf-8?B?ZWdISHVOT0x6ZFJucVhNN1diUUw4NnRIUnZEcU93R29wNk91YkNWMEVoZnFO?=
 =?utf-8?B?djI2ZW9hU0RPMmo5MG9WTzFjVXVPWE9xU0QvVE94cmxoTERIMDFua3RsL0Fh?=
 =?utf-8?B?RThwcUNpbUJDRU9sdGVmQlFOSENydktTU0dDRHVkSUhwUmhFV2JMU3pSSkhQ?=
 =?utf-8?B?VHdIc2JHRitudGN2WDFZM3pSdlAyWllZNXhJaWlTN0R2TXEyMW9ZVlI5ZkVl?=
 =?utf-8?B?aG9qcU9xOU4wajhFelU1YVhtWFNKOEVmSGNMTm9rVjFOM3l1QXJzMGx4WkZX?=
 =?utf-8?B?TWtHRW4vMUE2b2pLMXFSNHJDYytwa0tYVXBhNUJHUE5DYkVjUGpocU15bHAr?=
 =?utf-8?B?TmpiQ3NYNUxpbkZTOFBLaWtLTUNEVTVVV0V4TzZRNmg3QTE4WW0vUlg2K1ZV?=
 =?utf-8?B?ME1mcGlCeTRqa3BDaUsxRkh5RWl5SHRVTG5rT21sbm50dUY1OVNKQ2YwZ1A1?=
 =?utf-8?B?d1k0bHdzNExDMHNSOTVXTEpnZGxxZUFzY1JCUUxkWnIyNm01cUI5RVVQUjEy?=
 =?utf-8?B?bmxtUW5YZTRoKzhSN3c2aVdKOG5ORDhIVEtwRUh1OWs2b0dRbVRxTElUZ2ox?=
 =?utf-8?B?RUxIQlBTakxMdTZMTlF6WnQ0YTRnY2VCbDVub09yL28vSStXRTBXalFFWnZw?=
 =?utf-8?B?aktLdmRDZ3lkajAvV3AwTWF2ejBtQzRaK0JuOVpoS2NFbTN6aGtZS1VpQkNu?=
 =?utf-8?B?eXBVNjJBcVYxZGsrYzEzVXdPVTZQK2J2dzc1VlFVRzJxdGFndjdqSFdUQUVt?=
 =?utf-8?B?YkZSY0tWWjVNd2JzTytLZlBxbjVRWEJyeXo0bW5WTWl5dTZUemtzQkVpLy9z?=
 =?utf-8?B?OGxRNlFDYXAyNHd6Skk4b2ZheDJjVHpkMFFRMkN1YjRXNkZYWEpvK1VSdWJE?=
 =?utf-8?B?Z2xteHFhdVFiY1FwbW9OOUF1Y21hV2drNEM5Qld0c0VoODV6dE1sU21GQ0JU?=
 =?utf-8?B?SDQ5QmlkdmVrRDdtN3VodXRxRmh6OTEzeDY3VHRJam5MSzh6LzVoOWE0SFZl?=
 =?utf-8?B?Yko0VXZWRVk1amJuWGRGQjFCU04rYkxhNmxkT3hQVC9RaHpPN09wTGhRcGlV?=
 =?utf-8?B?VHFuNy9BTUoxMmc1dThldjBNSHQydFJCWHQ0WTN3YzVrYlBLNFNSODlTaXdV?=
 =?utf-8?B?NWN3eTczQmROYlNCQlFOOVltNlQySUxWR3hweEdMZy81NGMxRklQblpmc1BZ?=
 =?utf-8?B?aGFCeS9POFJUdmdid3MzTVVCaEZQcTFIbzEzL0p6eDBNVTBhMy9pNG9lN1Vp?=
 =?utf-8?B?RTdHbWFLQW9CR3lYMzd0QTNVaEd4aTc0SG92djdDb3p1c1VPeTJBQ0ZseXJU?=
 =?utf-8?B?c1U0MGc3U21xcmFVV2x1KzVSdjgwZmFmcXllNkI4aWVDU3B6RzVkYy9XdTlq?=
 =?utf-8?B?RXQ5Wll1OFV5Z0UzU1NJMk1LanBsRmwwNGloTnpNK216dWwxQ2JxT3ZMTEJK?=
 =?utf-8?B?V01WRjVYVFN1NDIyWmUxZzdaR0Ixa1lNRnFXbEJHZy9XZW9UbnM1Qmd6RXFJ?=
 =?utf-8?B?MERyQWY0bGhpTVUyUE1wQ295REM2ZmRTRXlYQUxCbEx3YnVtcHhhOEhudWJV?=
 =?utf-8?B?REphS1RtOE81YUp4cnhMYXFGZDd1Y1J2MzlmVnlDemlnMTFuQk5yam80dVFs?=
 =?utf-8?B?eVkwcDU3TUs4YTYrZDYzeVBIMHRoTExZQUNnM3JtOHhvTUh6Vkd4aURxeVRj?=
 =?utf-8?B?ejBKaDI2L1g5ckVYQnc0eC9JcVJRUWFrcEFYUnpZdGs2OEpobXV2aGNId3cr?=
 =?utf-8?B?Y01kVXJBUFEvYVluYVVmcXBHdDd2bDNhWFNqVHpkZGtiUklOOXFZcm9acUZw?=
 =?utf-8?B?bEpIRzhsSmRMdGpOM3lqd1l3c1RXU2d4eEtNalRudVNyYlN0ZzJJbUxub1dX?=
 =?utf-8?Q?uAyFQuHGizqK8UXy9RXvCPoJN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6594b289-4975-4774-262b-08dac882f2eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:03:17.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEChEuX+5QtojGNDu1eKKWxs27sx+JCrd9OlXkkDS2fneTmoPkoPK8wDpv6ZxdcAhBeLecaz6UIs+xsTzMar1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7928

On 16.11.2022 10:20, Michal Orzel wrote:
> --- /dev/null
> +++ b/docs/misra/external-files.txt
> @@ -0,0 +1,70 @@
> +External files in Xen
> +=====================
> +
> +The following table lists files present in the Xen codebase that originated
> +from external sources e.g. Linux kernel. The purpose of this table is to:
> + - keep track of the external files in the Xen codebase,
> + - help with the review process (e.g. changes done to the files that did not
> +   diverge, shall be first submitted to the external projects and then
> +   backported to Xen),
> + - act as a base for listing files to exclude from MISRA checkers.
> +
> +NOTES:
> +1) The files shall be listed in alphabetical order.

But then you don't?

> +2) The origin of the files derived from the projects other than Linux, shall
> +   be specified within the () placed next to the path.

Might it be more generally useful to have another column, then not only
stating the project but also the path it lives at there (or lived at the
time of cloning)?

> +3) The table shall be updated when importing new files from external projects.
> +4) At the moment, only the source files are listed in the table.
> +
> +| Relative path to xen/                     | Diverged from | Subject to       |
> +|                                           | origin? [Y/N] | backports? [Y/N] |
> ++-------------------------------------------+---------------+------------------+
> +| arch/arm/arm64/cpufeature.c               | N             | Y                |
> +| arch/arm/arm64/insn.c                     | N             | Y                |
> +| arch/arm/arm64/lib/find_next_bit.c        | N             | Y                |
> +| arch/x86/acpi/boot.c                      | Y             | ?                |
> +| arch/x86/acpi/lib.c                       | ?             | ?                |

This was simply split off from boot.c, which I'd be inclined to take to
mean Y in the "diverged" column. In the backports column I'd prefer to
keep ? for both, or any other indicator taken to mean "maybe / uncertain".

What about arch/x86/acpi/cpufreq/* and other stuff in arch/x86/acpi/?

> +| arch/x86/cpu/mcheck/mce-apei.c            | N             | Y                |
> +| arch/x86/cpu/mcheck/non-fatal.c           | ?             | Y                |

Even before disappearing in 2.6.32 the file was different from Linux'es,
simply because we don't have anything like schedule_delayed_work(). So
it's pretty clearly Y for "diverged".

> +| arch/x86/cpu/mtrr/*                       | Y             | N                |
> +| arch/x86/cpu/amd.c                        | Y             | N                |
> +| arch/x86/cpu/centaur.c                    | Y             | N                |
> +| arch/x86/cpu/common.c                     | Y             | N                |
> +| arch/x86/cpu/hygon.c                      | Y             | N                |
> +| arch/x86/cpu/intel_cacheinfo.c            | Y             | Y                |
> +| arch/x86/cpu/intel.c                      | Y             | N                |
> +| arch/x86/cpu/mwait-idle.c                 | Y             | Y                |
> +| arch/x86/genapic/*                        | Y             | N                |
> +| arch/x86/x86_64/mmconf-fam10h.c           | N             | Y                |
> +| arch/x86/dmi_scan.c                       | Y             | ?                |
> +| arch/x86/mpparse.c                        | Y             | ?                |

Like above I'd like to keep ? (or alike) here, as neither Y nor N are
fully accurate.

> +| arch/x86/srat.c                           | Y             | N                |

What about common/cpu.c?

> +| common/libfdt/* (libfdt)                  | N             | Y                |
> +| common/lz4/decompress.c                   | N             | Y                |
> +| common/ubsan/ubsan.c                      | Y             | Y                |
> +| common/xz/*                               | N             | Y                |
> +| common/zstd/*                             | N             | Y                |
> +| common/bitmap.c                           | N             | Y                |
> +| common/bunzip2.c                          | N             | Y                |
> +| common/earlycpio.c                        | N             | Y                |
> +| common/inflate.c                          | N             | Y                |

What about common/notifier.c?

> +| common/radix-tree.c                       | N             | Y                |

What about common/rcupdate.c? (Stopping at this in this regard:
It's unclear by what criteria you have gone. Even as simple an
indicator as "Copyright (C) ... Linus Torvalds" was apparently not
used. Similarly mentioning criteria for considering a file
"diverged" would be very helpful to spell out, even if there's
likely some fuzziness involved there.)

> +| common/un*.c                              | N             | Y                |
> +| crypto/rijndael.c (OpenBSD)               | N             | Y                |
> +| crypto/vmac.c (public domain)             | N             | Y                |
> +| drivers/acpi/apei/*                       | N             | Y                |

I'm not sure of the N here.

> +| drivers/acpi/tables/*                     | N             | Y                |
> +| drivers/acpi/utilities/*                  | N             | Y                |
> +| drivers/acpi/hwregs.c                     | N             | Y                |
> +| drivers/acpi/numa.c                       | ?             | Y                |

Y

> +| drivers/acpi/osl.c                        | Y             | Y                |
> +| drivers/acpi/reboot.c                     | N             | Y                |
> +| drivers/acpi/tables.c                     | ?             | Y                |

Y

What about drivers/cpufreq/*, drivers/char/ehci-dbgp.c,
drivers/char/xhci-dbc.c, and drivers/video/font*? What about some of
the stuff under tools/, especially tools/kconfig/?

Jan

