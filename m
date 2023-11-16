Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4269C7EE194
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634217.989583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cUH-0007Li-NE; Thu, 16 Nov 2023 13:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634217.989583; Thu, 16 Nov 2023 13:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cUH-0007IX-K5; Thu, 16 Nov 2023 13:32:53 +0000
Received: by outflank-mailman (input) for mailman id 634217;
 Thu, 16 Nov 2023 13:32:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cUG-0007DF-JP
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:32:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a35deb2f-8484-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:32:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 13:32:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:32:48 +0000
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
X-Inumbo-ID: a35deb2f-8484-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgG/t5S8cqu9/92dBpqjmwC1a1PCcdMTGsyo9ye+tnQhntm9QeN4JbbD3FgBC64jLX1EuGQSFIEHP5mxskI0XZSJmMZIg3RKpLxPr5C5q852YZaty/0kxj8uNCJ/bppvW7Cs2Z9eRSzd/fL6/HSvQuaWwbdz5xx7jAqM3XBWe0h2Q+upKIc17ylBXv+HERLSlitvnECqN3gt6rhUVlhRDZyhzLHxlRgij/IMgUDkGLKTxyg0lXHFh4XEXRWLZMx1HQrhDhCva8LEIbvHj37afEB8iJE3yXY0kq5VFcCpSSFQ1CZqW3ceCFEk+0JZZJ/i/qORDBmBCO5Okze0bHZ2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIKEOf7RPr2XJINaMBbAxC+M/xeaOf3qKmLgganWrro=;
 b=ZMWhybTBRpdojieaW2+PxucipcRqEOuIRzJOYtNhip5i5S0O57PSY6KXii72RDnWpXiNN+sPvccRn+NVMJKBxHB3KPyOWUR5VLjmhc7AyXfFk+BgZBmtKTjMYvLxQZEe1kD42QO1ZOIyZFRv9jVbCrk5Z1PB1DZmGePyo88sNzt6CqYGrw/OP38L6FnVwkg/N0j341pjxQC9zbd9bC2Ivty3Zas8rkIOLeiDNs8gT1f6LG0+ZQNI+8BNLfXJhbBqyUKK60WSUrzGc71kcpEL89MshGwsSc1Dnrhfe+NM5ZqL5MFUbUxoVHIOGyxTmEhZnXQVyZWjOtV1QuqNjJJu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIKEOf7RPr2XJINaMBbAxC+M/xeaOf3qKmLgganWrro=;
 b=GNztj4NdwmDqLIBjY3LytSHzqJD+4HjBZL84gi7IkHzjfLI5fibD2B/+Wwb5NlokvUeu6iva69WW07jO0YO+OgqUoKIagqld2Jy883YyojXJsNe0iyZj1nr0R0KYAhQNcErZdXzhXP5Yph2CR0gANNh5uYGB7w9b3lwTELItjr7KXY5rwmLCwVNY+s2N4RjoTm20sfJzGpioxfgCwPhRP1pQQrrXZU+GQbPS6HU4ILg08ZFHv0TP9AkYvt58Oo4lClwF+/L1uWvulXIdYYpML1Xp0OStHGOmzoQ2MMQmzvCX74UXgOmUobj1lBMik4W9cWD5tDR0uBamNUZ6QM2qAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d5b7124f-b7cd-4a3a-b12f-e8e315e9f89d@suse.com>
Date: Thu, 16 Nov 2023 14:32:47 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/5] x86/HVM: drop tsc_scaling.setup() hook
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 841e1965-fa3d-4183-c65d-08dbe6a88636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AnVvb76jNq8lPPTcLdqcoKUb+HjP5g5eqO9NsRSInNHCFIkg6uLB7lT1/WW+4xbYjeZqRAZT0Rn8xDd1g5FVbMBIvOpyYP65mZ71gTQ208ckIOMrqyb/Neh5+hZlx6BFqQLxSub9/d7dm01ZEX4sGHjLkNS93v9nyxW9f4ij0ZKygdfd9skMFK4ykiG+P2wfSEc0Ih85AMmMMYN+5omnnjwcEXDxVeEAfbjxlYwIdOvwUCgUl2qQAiebXpJHw5j3pxa+kABGuuvbI8H4krqd/DTRmlDGErdh4L1/NuPQMQzzuXEJPncnAwU8o37jeXtsi5Fp0MNShGKuh4Qf30I3tu3ocONoJ8CMQHAeRIn8oelowTWxqjGUfzqIbcajZ6Hrc/6W6g++4o9ExA3A43vtJS2J7ynQrw0NyIEFpcdesMoNPEaMqqYctfgAxDVI6+aBpVRp302XdbMdiR6vNMfZcw2VtwXdeoNGwBx6ksguwaDxwJZhqO05N7JnjR5oollkOMnIBm7b33R/LklSQAjheWEeNexDLus2e2DgWSylIoS+dH3pHMpfTLttsQC89xGEFafSSED0WzV63Hsw4ZYFpLII/vFU9nw01AYQggId105uYdcTBSJyo+V60Sc8p1Jz8YQHCAUle0rCxUMVSY+IeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(86362001)(4326008)(8936002)(6506007)(31696002)(26005)(41300700001)(2616005)(2906002)(31686004)(66946007)(66556008)(5660300002)(6512007)(54906003)(6486002)(478600001)(66476007)(316002)(6916009)(83380400001)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHBRY3RJdFRkTUJMdnBLaDF6V3NVUHJEMFlwT1ZmTlh4RzhIM0paenhvMUl3?=
 =?utf-8?B?R0NnVjAyNUkxOXR5UWVLZWk1a0Z0M2IyLzRWOC9Kdk53WjExUmdSSUlLNzRL?=
 =?utf-8?B?VXRUYlNuZkpjd1NIc1FNeGVwYXFMZWMwaENOVTlVSWlCYVIvMmhQbFJubVB4?=
 =?utf-8?B?QXFyOXdSYzlTNkF3M1NHcDAyZENaZU1Za2JkQzgvUlFCenppZm9KR3k3T0FC?=
 =?utf-8?B?dk1LeEtwclp3L080SE1XYjRINFpzN3I4NEJwa3RhMU5BWXAzK2RjYlZ0cVJn?=
 =?utf-8?B?and3MnU4NjVQaFJhYzRnbWN6RUVXdVpHNHBiQTNHbldyZWhza2ZUUGJtRFFJ?=
 =?utf-8?B?RFVJeWZ1RENkOVgvOWp2K1ZTZHdKTWIrdnUxNnlXOXZzY3p0QmFMWno4Ylp3?=
 =?utf-8?B?NWEzaDVTTmk1OGdnU0w2Z1FXNXFuSnp4S2tsVnZGblZNT0JSRS9yUEQ4VzFN?=
 =?utf-8?B?bFNpUk4zQW1RTllqN1NhUjQ3NmNxbWlHL2pSM0dtOEhqcCsvQWxuUEwzNnFU?=
 =?utf-8?B?dlJHSmRpakRDY3lIYVRkbFRlWkNDai9mdndxY0ZSVy9CN1krRDA5LzZrQ0pG?=
 =?utf-8?B?ZWkvRTBUZ3dubU5tVm42T2VFb1Y4eVFrVGlWMktjcGIyeXlFTTNIKzJoRFNI?=
 =?utf-8?B?dmt0R0dkeVd6bklCalhGUEZhTG1IZXVIdzZmUXpiV1htZytpTStrbUo3Q1FP?=
 =?utf-8?B?bm4wY0IyOFNOVGo5bXdvQmt6dG9CWWpOVWI4cFVVSmR5U0dwUGh1MmhXYWl0?=
 =?utf-8?B?WkFzaGMzUC9JNzdUbGwwZVd3eTRPanBKTWtwRjkxTDVzeTRhelM4RWRlU20y?=
 =?utf-8?B?UXl4bnk4RE9uSWEvbWdvVEtadUVaWGtwUCsyOFFaVm9FOERsTlQ2Q1V0N2I4?=
 =?utf-8?B?Tk12ZENYKy9QQnZHa2RaZnZsS3lQRW92eFZ1emlnbW11S3BSUUZwVGtrWmFN?=
 =?utf-8?B?UnRwU1RkL1NENmNkV0JoVFhPZkhuSmVxbE9XVU5HSTVncU9SRG1sT0hxQk11?=
 =?utf-8?B?bTV3L2dLVS9TcWFOc2R5TDlyLzhvZmJZYXJNK1BDS2tXT01QTWRWSHY0K1BM?=
 =?utf-8?B?eWdNekFKb1NZU0tDcXZIZURsc01TMDlmbHJBYXlkUUphRDE5dkNHdnlUNDl3?=
 =?utf-8?B?bXIraDZ4eE9qL1VhdDZaNHpRcjhPZFpKNmNhWUN1M0I4Qnh0dnFZbmNqTXpS?=
 =?utf-8?B?eFZ0T2RTdHhmOXhVSkgzWi9JUDBhT0cxd281bzlxNDFWOU1nU2dIWGhXTUpT?=
 =?utf-8?B?TWdBZVNaYkNmMzVCNjA5aFl0aTlzcy9mRnR4UVpjYUcwbEJaVjJWTmttNzI2?=
 =?utf-8?B?SGZ4S1M1OEEzMzNCS2Ixdlc0Y21HVTRRWDlXOERnMkFJc214bUNDNjVIWGdn?=
 =?utf-8?B?ZWdqakVXRU9BZWFoVno1Y2VyWDhwMDErby9ZNnhqZFArSURsQVNYR3lVYm8r?=
 =?utf-8?B?eEExcWc5NEgrbisyZVk0eWtmdWlDd3c5aHU1Tk9IekRQSTkxQXpMQ0dvQW01?=
 =?utf-8?B?QVlRejMyRkF3dzkvWGhLbTMwQ3FlZWxnTHNXZ1MxSVlwVGYyT0VydlE4UUlU?=
 =?utf-8?B?ZU01UVUyM3BYTTMrZlZxU1J6ZXZSTG5XQWwvQ3prMGtuSU9zT1o4YldxWEZQ?=
 =?utf-8?B?UjQzdlR1VU1iNi95T05rOE9FUDV4Z0FNVG82cm5HalhiRjVVdHY4MHZzRHdP?=
 =?utf-8?B?eWRMTmJieHNTdXcrNGdEWHhsQjFXcDhjOWd6UnFScFdSYVM3VU1CN1dzMnEy?=
 =?utf-8?B?a05PZjJvNUVEdEdCbmh1Zm9MZ0dtYzhUcW5PckRjM0xaQ1VRTlE0dFJJcEpl?=
 =?utf-8?B?a3JEZ3hsS1BUQ1B6WFVSSW44eW5FR0tjNkJTdTBOOVA2VEZHaTQveWNwMW1u?=
 =?utf-8?B?V3E5YUlmcGZjZmlldFVTQzRwQnM2RnluQWM5RnlVVGdTbVlYTGNTdFZBNkRt?=
 =?utf-8?B?bi9WWWJTU0RJYk56MVd3elM3T1pqb0VBbUZOcXRiZDVHYW96VVN3N2FqcXRz?=
 =?utf-8?B?UURiSHROdzlUMGN1M1J6dzIzUDAwZVI4R1lzQnlGVHJCM2RwdmZJSFZrdE9P?=
 =?utf-8?B?aUFkRGp5Vyt1U0trRUNvVThBdlE2c2NMNlZlbnlTQ2VmLzg2VFcwYkpkRUxa?=
 =?utf-8?Q?H2w+qwjj9Zj9Xeja3bmZuerI6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841e1965-fa3d-4183-c65d-08dbe6a88636
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:32:48.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnATFyoVvGC67MADXogEyYhpEo3hd8XdM3TzUNMOi7pz9NdM/ycr64B6apIUYDQVuKRFp0lt7o1iZSdPZyHv8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333

This was used by VMX only, and the intended VMCS write can as well
happen from vmx_set_tsc_offset(), invoked (directly or indirectly)
almost immediately after the present call sites of the hook.
vmx_set_tsc_offset() isn't invoked frequently elsewhere, so the extra
VMCS write shouldn't raise performance concerns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1086,9 +1086,6 @@ static int cf_check hvm_load_cpu_ctxt(st
     v->arch.hvm.guest_cr[2] = ctxt.cr2;
     hvm_update_guest_cr(v, 2);
 
-    if ( hvm_funcs.tsc_scaling.setup )
-        alternative_vcall(hvm_funcs.tsc_scaling.setup, v);
-
     v->arch.msrs->tsc_aux = ctxt.msr_tsc_aux;
 
     hvm_set_guest_tsc_fixed(v, ctxt.tsc, d->arch.hvm.sync_tsc);
@@ -4033,9 +4030,6 @@ void hvm_vcpu_reset_state(struct vcpu *v
     hvm_set_segment_register(v, x86_seg_gdtr, &reg);
     hvm_set_segment_register(v, x86_seg_idtr, &reg);
 
-    if ( hvm_funcs.tsc_scaling.setup )
-        alternative_vcall(hvm_funcs.tsc_scaling.setup, v);
-
     /* Sync AP's TSC with BSP's. */
     v->arch.hvm.cache_tsc_offset =
         v->domain->vcpu[0]->arch.hvm.cache_tsc_offset;
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1454,20 +1454,13 @@ static void cf_check vmx_handle_cd(struc
     }
 }
 
-static void cf_check vmx_setup_tsc_scaling(struct vcpu *v)
-{
-    if ( v->domain->arch.vtsc )
-        return;
-
-    vmx_vmcs_enter(v);
-    __vmwrite(TSC_MULTIPLIER, hvm_tsc_scaling_ratio(v->domain));
-    vmx_vmcs_exit(v);
-}
-
 static void cf_check vmx_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 {
     vmx_vmcs_enter(v);
 
+    if ( !v->domain->arch.vtsc && cpu_has_vmx_tsc_scaling )
+        __vmwrite(TSC_MULTIPLIER, hvm_tsc_scaling_ratio(v->domain));
+
     if ( nestedhvm_vcpu_in_guestmode(v) )
         offset += nvmx_get_tsc_offset(v);
 
@@ -3030,10 +3023,7 @@ const struct hvm_function_table * __init
     }
 
     if ( cpu_has_vmx_tsc_scaling )
-    {
         vmx_function_table.tsc_scaling.ratio_frac_bits = 48;
-        vmx_function_table.tsc_scaling.setup = vmx_setup_tsc_scaling;
-    }
 
     model_specific_lbr = get_model_specific_lbr();
     lbr_tsx_fixup_check();
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -240,9 +240,6 @@ struct hvm_function_table {
         uint8_t  ratio_frac_bits;
         /* maximum-allowed TSC scaling ratio */
         uint64_t max_ratio;
-
-        /* Architecture function to setup TSC scaling ratio */
-        void (*setup)(struct vcpu *v);
     } tsc_scaling;
 };
 


