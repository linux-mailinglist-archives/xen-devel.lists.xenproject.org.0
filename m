Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC2E7A91E3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 09:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606115.943857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjDnj-0000Pr-PI; Thu, 21 Sep 2023 07:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606115.943857; Thu, 21 Sep 2023 07:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjDnj-0000Mt-ME; Thu, 21 Sep 2023 07:08:39 +0000
Received: by outflank-mailman (input) for mailman id 606115;
 Thu, 21 Sep 2023 07:08:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjDni-0000Mn-8n
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 07:08:38 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae4184e2-584d-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 09:08:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 07:08:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 07:08:34 +0000
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
X-Inumbo-ID: ae4184e2-584d-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC8A2MLOjaLj30ABSpoVqlq+xf0VghqFweeJGNt4m9oke8Ho1yQ02HahW6T6sfTFBd/eJEeU7S0dB2wG7ihK7ankZSCpWLBeCRAHl/8yHban1+305Cl1AQNdqHkoQjJoGOOAHOIsdcYfEhRvfbPzrCMZmZ70ZqWsDniTjybfzKmTOJN4r5t6IASOd/dWTY291S/uNipDq1SFxSAshGGTOrb1zg3wO+7EBRJb55GDLHQQG6rKLiUulkTJCBSeyxs5N2KYmILCkZNITUAkScz/3w80H8TYVFP0yk0BKAbancCX7nKima3mwMAhn8/PbpO0P/EE3AhDij9O6Ojy7jCDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTVUuaHhvoDDSz+OYNieLdgJjxPwfOd6DYB4fY5lPVw=;
 b=B6Dk5O4TvNBLQz2DQC/QfPhO9CA7zWQFceWrJz7sMKn/WraaeX0CerYR4SnsHDJ++Js5A6zNaUmYSntF50kI21VBKC7SL8B6kDgE3KNXl8ATrsQFoX5eRVpeEXVCGoq46UgsEpmJORJ9Qzu/+vxiC0sPxDB4BgPNkstdRcPyEdu9Cm99jvqAO5zoLe1zy1dArjrPI1JyPf8SnZjos+mL+SE2zbroIbFtW/yoxdfw03Jl26zQwWXK0Thpp5ilRukg6lTapgb0IJ/E2iTDDYuZhbPHlIGXgYmm3v7wQZ4XqIf8NCXoiLcPiv34iD8GPFntNHno1My6BNiXfkvJ6NZVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTVUuaHhvoDDSz+OYNieLdgJjxPwfOd6DYB4fY5lPVw=;
 b=GAdbpUhtfwBGvR1WGo3TNaCTk/CcvvmCR+AsTOqw5Ni8kJ72cUpCxA8vlB7+cU41r/8HHj+NadGv4AdQNTu9cIdBA+x9dihA01424pp4IE4d7iBatqQd3VCTAvsKsM12OZo5pZTTuk4M+Jkadulg1NRLPhZO+1hZ1uphqGxzom4IWcXiAQgTld1MPh61gSbtM8usk0dlFag0JgdISs2x6jRGSSXyx3sPcbR39DivIIQTsM7KfEagnxHcICToyHjo1SE0JBFHOwZhwGip7SHpyYKe9sNj1+EMOe9U75vkzZJu49c8+L/L/zF9G/iJTD2N5xi2TLNwhRN90/D+31T8DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fcff9af9-3abd-2d0a-f40c-826f6b1de815@suse.com>
Date: Thu, 21 Sep 2023 09:08:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xen | Failed pipeline for staging-4.15 | 3a9a2901
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <650ace63a5321_28a55b478157@gitlab-sidekiq-catchall-v2-86b648d56d-wk4kh.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <650ace63a5321_28a55b478157@gitlab-sidekiq-catchall-v2-86b648d56d-wk4kh.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad616b2-dcc1-468a-5e26-08dbba719172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RXzybS4kU2uITNErx+94T3obHhxMDAZhC700gdHCDTJX/DYMY9cjTxs5Xj6AfLVUNgwaBE8+hu3WaI2CBqxInGkGoIS99CY2RP5lYyjjozX/W8p3UR8ueoSTqeYgIHEFnz1cUH/8skrOwzbNBzvAx8j9R+PVnR6KXp6lRqO31HBuyWvCb9fgmgvGc7+8mloR6Px8ksUMew+8oZddTLYwDUftSRtUa89mpyWBbT8M65PUrqyqF3xJQ7lZxdCIjMM5Q2XOyhLRN2B/VB98ZHdODyj/Z40hVkswKxrD4R8aTdwGqh2iHQUvO/W2tX05PZtrs/BkDvpz0xua8se2xkzmxBtPj6DgPaoLmH2sWV6+S/ql59MhfHz+6stvy/Z6ddrZDgDtuCAVvoUAnvVYm0bqT2dHNLUz4gA0PNUrguHTZvND0GA4vbG2wYF3gC1BB5kRTyyu8BrWQ5qwk96zjNY+6zyaxWDv4H6nWWblPsWusA8kBw25aNRbyBtdo7Ulw+ni5abAqu1P6G3PSTnJP7AOz2hM6m/Wtaatpd0KblN07oXN81gNJZ3CrevbMMJvVI0jfabWsSurQ+wK9enRhGnvGoCGJ55NYmjK8xQMKAs4WopeK8zsV2g0cOgng5woph7jaAvTMNoKo1/9aMiaqpSgRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(186009)(1800799009)(451199024)(83380400001)(2906002)(86362001)(31696002)(36756003)(31686004)(26005)(2616005)(38100700002)(966005)(478600001)(316002)(8676002)(5660300002)(66946007)(66556008)(6916009)(66476007)(8936002)(41300700001)(53546011)(6666004)(6512007)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTRYT0R0TFRRK3pzSFF2S3VvSjJmQ1VwTEFqNTFOWFUrOVMvVzFCeTgrTXNs?=
 =?utf-8?B?b2llODd0UmNZNU4wWGdSVzBZRzk1YVlrbFhuZU1mQ3REdjk4dXB5Y0pHTklz?=
 =?utf-8?B?eVRmLzI3QWJSb0RCY29iUVdXbzhqOTJtci9xTHdtTFhRVUJkbHVGdDVsRUdF?=
 =?utf-8?B?SW5CeTFzUGNSSU0wYmRNOU01d2J0RXI1aWdiSzc1bm9XSjNrbk9KRnJIeFBO?=
 =?utf-8?B?VGg3WjV3S2FnM1krUlpncHpxRXgxOHgwdHBXUUlQKzdoUjZTMzY5VDZiM1JW?=
 =?utf-8?B?LzVlSTVKMWZjUklTSWNGakJJOXpuV3dueEt0anQyNzNGaXZzQnoyQVdYUDNk?=
 =?utf-8?B?VGo4UElHN0FBdHpJQlNRYWdFN3d1YTZJMllObVJMOVJmOCtKQ1FNN3UwY3I3?=
 =?utf-8?B?R1BxQXNONnJtZzVQSUxhWllXS2hucDZVcXcwdDZ5T2plV2gwTDhRbEVVbHd5?=
 =?utf-8?B?dXBMOUoyTGtlTW1kZVovMkRGYWZaZ00zUUNjS0s0c1FlMlpibnVpNnlhSWFB?=
 =?utf-8?B?cHdtZzlJeEd0VjhYUE1QWjJWdHZsazR1eUZEdThva05CUmVJZERyU1VOb3pL?=
 =?utf-8?B?VEYyTXZxcS9lMWxYdmM5QWc2WVUzWkV2OE5Lczhmb05IL2szazVPWHViT1J2?=
 =?utf-8?B?WWRCZ3RLT0dqRytpdVJrODhyUU1QU2E1M3J4OHNpWCsvWjJRdW1ZWmVTemVy?=
 =?utf-8?B?bUhyM201My81QWptUlg5cWxUZTBXTzhxN0RmYjJPc3BUR1F6dWdHQk1iV2Ft?=
 =?utf-8?B?YVpiUXI0OGJ1NHNTUmdOTm4vWXhmazlVZ2R1UmsrVFZBeThwUWtSaTYzb3Jr?=
 =?utf-8?B?YkcrOWVucTVtTXFUcnBEaWlGclFneUZadEpUMmNHeGZPREdYZ1BPdGJDdHUv?=
 =?utf-8?B?bTBxVDhPYzdiaS9GTEpvM2hIT1hOaFM3cW5MWFFXRlBDWlIrTTZrU1FQOUNQ?=
 =?utf-8?B?bXVMbVVXRmt5dmVlZ0ptZDF4SCsxRkQvY1dkOEFtbjBBMGZrL3FOQ1k4RitH?=
 =?utf-8?B?NVFEbHgwYVZqRlFoQzErQUh4Y0RxQ3MwNnNoVnlCUWZyeUhpeW9GZ2ovdjhk?=
 =?utf-8?B?WnhkZWNTWDUzdmhmVGsrWUd1T0JYTE1ZUW9IY09VUXhwUGZkTzlwQXRtQ0pP?=
 =?utf-8?B?Mlh4cE5udzRWdUFJaS9SaDcyREpvUW5wajJ6WE9CTDlBaFA4aC85Z1JHcGFN?=
 =?utf-8?B?SWxXalQ1Vkdsc3E5dERBcGtUU01PWkZ6ZjVHaU1nVlByNmcxQUVUeVZqc3FJ?=
 =?utf-8?B?VUdtTHI0dWZ0dzRPOHF1enUvbjQ3aERtTm9SeGp6U2t1bWwyN1RTK3oreEhr?=
 =?utf-8?B?NGhCdzBLSUtlSkpXa2ZCZWlVQ0pzemMvTWE5ZEx6ZWRtdk1NMW9JTTdKSzdW?=
 =?utf-8?B?Z0tDMGdzUXZxVWVqazY1K1ZPYTQ5NW9ucUk5UFFEanRlSGlMbjBMUW9QUHl3?=
 =?utf-8?B?Q3hibkFpSXcrSGFTQjhPRS9mUGZrb3hQcjBTaVl5emw5UVhoOFo0VDlSUTVX?=
 =?utf-8?B?TGFjZjlrQ1Bma0t1cHR6b0hnM1JtTnZFWUg1MXc5MUxqZlBJWkdJWUVaUW1O?=
 =?utf-8?B?ckk0eVM0WFNEWkVOampBZU5BTnJjbGJ3Tm5uM0VGcE05bTgydGs2WkV3NzBz?=
 =?utf-8?B?N3ZuM2xqcG51SHdjaXVOSUNNdW95N3JkdzVLT1VxNkkyVENFcUkrUVNzL0xK?=
 =?utf-8?B?eFovU2lJaFg0RnhNN0JybW5RRWVIdTNaeDE4dndjU1NxT1I3Y0JZSGU4Lzky?=
 =?utf-8?B?bXNCaFloSWxibVlJK1UyRHhreFhZK2V6U3NvTmdjNndpdkd1TUNURDQ0Wlhj?=
 =?utf-8?B?OU0ySEI5RXdselpGWXFybjFmallzNzY3bjdMN3gvRzNFNThDS3J6Um5YUUx4?=
 =?utf-8?B?dDJEYm0zVnliMmtrRmxPSTA4cXVaaFVGenFIeHJ1WUQzV0lUMTNhc1NMWlNr?=
 =?utf-8?B?dWp4RTFyTFV4MzNDNjBsVE44OEtPK0xCeHVackQ0UzlHclZ1U3FLeU94SnMz?=
 =?utf-8?B?L2kvN2NFaUtwd2U0bGg3cys2dEtRVUYxeFVjMVJhcE16T2F3dlhKYVVTdUda?=
 =?utf-8?B?TjdlT2FuUzQzS0Zmak9NODNMZUdET1EwT0Z3bndCN2MwTXhtVXgwamU1K3ZI?=
 =?utf-8?Q?RIzIPpK2jF1tcNE40DYHpxELz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad616b2-dcc1-468a-5e26-08dbba719172
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 07:08:34.0004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQIR4uidFF4aQiuNmTZc0F3Mt8JUrO+I+fH6eD3SpwxyUSH/kVXvng1jSPkEtzJTdMMFoiexTILU4J1RxTulLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758

On 20.09.2023 12:50, GitLab wrote:
> 
> 
> Pipeline #1010772231 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging-4.15 ( https://gitlab.com/xen-project/xen/-/commits/staging-4.15 )
> 
> Commit: 3a9a2901 ( https://gitlab.com/xen-project/xen/-/commit/3a9a2901cc8b24f28dbdc6fb63f57006c77a1f47 )
> Commit Message: x86/shadow: defer releasing of PV's top-level s...
> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
> Committed by: Andrew Cooper ( https://gitlab.com/andyhhp )
> 
> 
> Pipeline #1010772231 ( https://gitlab.com/xen-project/xen/-/pipelines/1010772231 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 19 failed jobs.

I'm somewhat puzzled here, in two ways:

> Job #5127621914 ( https://gitlab.com/xen-project/xen/-/jobs/5127621914/raw )
> 
> Stage: build
> Name: debian-stretch-clang-debug
> Job #5127621916 ( https://gitlab.com/xen-project/xen/-/jobs/5127621916/raw )
> 
> Stage: build
> Name: debian-stretch-gcc

This one failed with

In file included from /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/timer.h:4:0,
                 from /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/timed-average.h:29,
                 from /builds/xen-project/xen/tools/qemu-xen-dir/include/block/accounting.h:28,
                 from /builds/xen-project/xen/tools/qemu-xen-dir/include/block/block_int.h:27,
                 from /builds/xen-project/xen/tools/qemu-xen-dir/block/file-posix.c:30:
/usr/include/linux/swab.h: In function '__swab':
/builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/bitops.h:20:34: error: "sizeof" is not defined [-Werror=undef]
 #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
                                  ^
/builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/bitops.h:20:41: error: missing binary operator before token "("
 #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
                                         ^
cc1: all warnings being treated as errors

What? How can "sizeof" no be "defined"?

> Job #5127621965 ( https://gitlab.com/xen-project/xen/-/jobs/5127621965/raw )
> 
> Stage: build
> Name: opensuse-leap-clang-debug
> Job #5127621939 ( https://gitlab.com/xen-project/xen/-/jobs/5127621939/raw )
> 
> Stage: build
> Name: debian-unstable-32-gcc-debug
> Job #5127621913 ( https://gitlab.com/xen-project/xen/-/jobs/5127621913/raw )
> 
> Stage: build
> Name: debian-stretch-clang
> Job #5127621924 ( https://gitlab.com/xen-project/xen/-/jobs/5127621924/raw )
> 
> Stage: build
> Name: debian-unstable-clang-debug
> Job #5127621934 ( https://gitlab.com/xen-project/xen/-/jobs/5127621934/raw )
> 
> Stage: build
> Name: debian-unstable-gcc-debug-randconfig
> Job #5127621930 ( https://gitlab.com/xen-project/xen/-/jobs/5127621930/raw )
> 
> Stage: build
> Name: debian-unstable-gcc-debug
> Job #5127621928 ( https://gitlab.com/xen-project/xen/-/jobs/5127621928/raw )
> 
> Stage: build
> Name: debian-unstable-gcc
> Job #5127621937 ( https://gitlab.com/xen-project/xen/-/jobs/5127621937/raw )
> 
> Stage: build
> Name: debian-unstable-32-clang-debug
> Job #5127621974 ( https://gitlab.com/xen-project/xen/-/jobs/5127621974/raw )
> 
> Stage: build
> Name: debian-unstable-gcc-arm64
> Job #5127621975 ( https://gitlab.com/xen-project/xen/-/jobs/5127621975/raw )
> 
> Stage: build
> Name: debian-unstable-gcc-debug-arm64
> Job #5127621964 ( https://gitlab.com/xen-project/xen/-/jobs/5127621964/raw )
> 
> Stage: build
> Name: opensuse-leap-clang
> Job #5127621892 ( https://gitlab.com/xen-project/xen/-/jobs/5127621892/raw )
> 
> Stage: build
> Name: archlinux-gcc-debug
> Job #5127621889 ( https://gitlab.com/xen-project/xen/-/jobs/5127621889/raw )
> 
> Stage: build
> Name: archlinux-gcc

This one exhibits what e35138a2ffbe ("rombios: Work around GCC issue 99578")
addresses, yet 4.16, which also doesn't have that backport, succeeded earlier
on.

Jan

