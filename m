Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9B53247FC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 01:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89552.168743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF4hZ-0004Xb-Cy; Thu, 25 Feb 2021 00:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89552.168743; Thu, 25 Feb 2021 00:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF4hZ-0004Ww-9i; Thu, 25 Feb 2021 00:40:21 +0000
Received: by outflank-mailman (input) for mailman id 89552;
 Thu, 25 Feb 2021 00:40:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lF4hX-0004Wr-A2
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 00:40:19 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b515e7a-8246-49a5-9a57-53544aa4d497;
 Thu, 25 Feb 2021 00:40:17 +0000 (UTC)
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
X-Inumbo-ID: 4b515e7a-8246-49a5-9a57-53544aa4d497
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614213617;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nPDUblydehS6l+/YSHhxieL6FYDcnWbzljL9LshT6rM=;
  b=ViqLw0NYb9d9hGh6hloTSBncHgmi+eY+0NvAwTWIM5zvOR7knHT05Q8w
   ngdP5VCqTndZMY6apovVZ4z/GcotA92ywumgZJuFWG6cn0N8Jj4gHGwXC
   UTy+QyDVd7alLtTvVaXCFWboRE1HozZnqc9eFCe2NrfBI+02X8WDGiJrZ
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cBOIVlwWvxE1iZG2TDbbzx0k/WL5tWuLjl8Lz1Cr0hugJ1/CIaEHPh5/KxG1E+1fcZGfJZJmPF
 gamstplSS/e1rMGDEPFBU/ts/zttX+EvV71vyOPCZny4mJdnnrJ7ZLS7tUU923fjfv/yKV6Dpy
 BZP0NmOqMRbXH/hhSZFFK/s21d/GeK4Um6L3QmKCh3SRdsmxDYHITkN2e8H9tjn5x5saJGxf/v
 L89K0HX5+cMPA+a/xUhLA5uxefxyuCTb8J7JxqtTdxUN+jFbgzvfIf/LODzSa1owK0e/jazE4q
 2yk=
X-SBRS: 5.2
X-MesageID: 37993797
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="37993797"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG6ByNtmZX3pSUx2FjPq4HvQkvUUHblAzZ6guIX0Au8lDrIojoRo5fNUFW+Zl1g11h8ZqlMCcWV5Udv32TFS3hkPmSj1rZa6uqW7cn91i2TIdFdcvGaMbMTxPZp+IKoS2miBYeOMgN11vbJEF9Obv9NjDENOLuwDTF4Wo8ScZhO+HBp+wtLzGEhyi/bHZnMcvT6Y3Ay3JyTe14xIepU34Nu9UVJonSi4glc1z+OsgeNgpyJeJ4bipdBdcFW3nHFBf5JP8/hXQkgjDpT5JS+/hfatcLeWBKyvTCgBjafOOgAXo5mBH5cGy4uKtnWYgBzw41JItEL23docka5QCWRE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPDUblydehS6l+/YSHhxieL6FYDcnWbzljL9LshT6rM=;
 b=be8hisUrDXyr4NAPGNgT0E0qGL/okhih+EjHzUVHHgNfSWgriZUgAUg4diABIDxFc/ll5E4er1gDGtT8Ia1GmUvfz46WQOdf2VqyD6HJ7swqkSlGL6JHlNgEMcyvxwdOsZIvhdtFz9U+3O6U9KixnNKxSEIFBWlea2uVKsj1S7Xujxk6HSuMQ5ySCMQMge9Xi1rYY1eucLndPpse8qd0iNBlXUTW0iT9BcXIt/vy19kXxtWMzCermP1o6m33uzNoGaLS1gke9p0Z8Nkv0eoc3Tew+WV4jDqsz53r2t8J5szSh6lWJPEznV2naCXNba7ktazfpngl8NWWUhxjMCyy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPDUblydehS6l+/YSHhxieL6FYDcnWbzljL9LshT6rM=;
 b=ovG8ejXjoIGUDBfAF3UmdmcI8gIoba8/PPi6k1w/DM1qUyqdzMRmYOfNCUnq3W7+3DvWhOJnKGAW5vi6N6Msx38q7ss8uaN3aB3jRnzFphOggh9+bxv03n3OxZUr945u0kkRCAj4Q0xE/Sum+FVLsxJjkZh3tkJLMHNA6ptbsAs=
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<julien.grall.oss@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Meng
 Xu <mengxu@cis.upenn.edu>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org> <87zgzv56pm.fsf@epam.com>
 <c1c55bcb-dfd4-a552-836a-985268655cf1@xen.org> <87o8g99oal.fsf@epam.com>
 <CAJ=z9a0v37rc_B7xVdQECAYd52PJ0UajGzvX1DYP56Q2RXQ2Tw@mail.gmail.com>
 <87eeh59fwi.fsf@epam.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <28f8ffcc-d2df-438c-4fa8-a8174d897109@citrix.com>
Date: Thu, 25 Feb 2021 00:39:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <87eeh59fwi.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e22ea7e-7fb8-4584-dc29-08d8d925e85c
X-MS-TrafficTypeDiagnostic: BYAPR03MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3864CD82911458DE2C10AE1CBA9E9@BYAPR03MB3864.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: obh//eMkWchf5GvOU3KFdzm/01lUDsYMostug+9Ze0B8dymgzo3da7ILOXrPtCeROe+lQ8LLpyU+2EV0cc04e4iGk8EkRLN6WSHTgfU31LnoA8otZxVTvt8h/2rapS3nI8ZvCDu3melFl/13stK4ML5nt7vAKe5Ppn1rciIq2/apUubzzZAIwJTPZuVHqi3w0ojuFK1Vne7RaePRajWlpMd0iSMTRjhiI/M6Ww4hTNfw+h4Uo76Qx8XfgqurqbM3x/VykI2yfIgye69RlfraZQRKJTBNKCm9+2bNMnp6SuI1+bh0wcqGEI77+Spr756iB2Klj//1JsOwn4i+y8uLyPSn+AqsfRd1L9zh/R+fUkETDuftUfG4Ku5tSpF2GExKKjQwyiZM/64e8GN1iz33Fs5Iyji0lbyxLCAEsELInyLRPV9ZRvB+P0Wa4JFEzimM/xVt5FoLc3xNCnMrgBYsLmDFLTh0T4ganXAtO2MBJIY5/YBym3boTtpofYfCQAP17d65GzuS/fuwTSv3mhD6b4QsTwh41KwunhOb8cWlcjATPkAzVD4SRyhc9+76nvkzWNRBGfLhQcL69dDdBihH747Ig7e8FSHAaoNCF9MtRzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(86362001)(110136005)(54906003)(16526019)(31696002)(5660300002)(2906002)(66946007)(66476007)(26005)(66556008)(83380400001)(36756003)(316002)(186003)(8936002)(956004)(16576012)(8676002)(53546011)(478600001)(31686004)(6486002)(6666004)(4326008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVUyMFZNM2VqcnpmMGFydGljcVJ4ejVwenl6VVBJT0FrZHFCUFRjdGZmaXJF?=
 =?utf-8?B?ZndBMVJQUW9IT1I3R0s5QjloRU1CRG1zN2NVNEFYZXYxOWljc041dC9FbGg1?=
 =?utf-8?B?Z0hMREljZEs2d2RaSFhmQTNBcm1TL0pKQ2EvMWdRS1BjY0RmekFad0s5SG1I?=
 =?utf-8?B?bkdnTVVMVStmb3c4R1FYVVJXVGFvWWVyTWxvbFExKzdZOG5TUGlkRElnVnVY?=
 =?utf-8?B?RGNkTXQ3UU9ZeUJCTGtDKythV3FMVmZrbjFEM29lY3VVZHBBbUFLNngxaC9m?=
 =?utf-8?B?M0UzeW1TSDRvUTV4Ym01TzF6T2V2eWR1TmxyQ29IS3VaMjdwNVlyYzZKcito?=
 =?utf-8?B?OEh3djNyOFpqSXZMazcwUk00UGN0NGhPbkdzWEQvdUtIRTJLZmFOdy9tVEhh?=
 =?utf-8?B?L0JrZHlkMFc2Z0N1elZHK3NzdG1FdVkrVVVqUkVjT0pKRHllWXRvSE1ZTjUw?=
 =?utf-8?B?OEw5dWJmaXJVUGdCZmhncmlQSUdXaFpPQ0dUM1BVWmUrVHdyRExZeENnQ0I1?=
 =?utf-8?B?a0plZDRHYmxweEFwUHpob0o0NkVtcTBVR3FlUk5Oa2Y0ais5MnZEdVFGRVk5?=
 =?utf-8?B?eFJuSEcxelVmd2ZnRlFYSm9zc2pNU1B2cUluUEV5UitpT0EweVBpTDRrMGJ1?=
 =?utf-8?B?UWEvelh6VmFkV2JmaGwwc0dycDEySUVYck45TDNJMFRwQUFxdy93Qk5UcWFL?=
 =?utf-8?B?dmNTazE1TDQ0VTRPVGluaTdYd0o5NzlYY2RyYnY5bGtsaStYK20xbVVYQTFV?=
 =?utf-8?B?T2VUZXhZejJZTmtWY1Rxb2xwdytKZUFHdmtQQ0Y0UytXTmdUUS9LZTcwMkhn?=
 =?utf-8?B?Z2NrRWNWMWZJTWs0UVJlZXoyUjdZQ1Yrb1RNUUlvejZBMC9WNW5hZlBjMWdo?=
 =?utf-8?B?UXI3MTUzaVB0ZjVRK3o2RUltU0pTN2FnNzJXa2xyMTdRUVJ2K2Q4K1NRZnVI?=
 =?utf-8?B?QWdYd1ZPK3EwM3hTamdjcjlGY2hiZFZYWGJmcXhITUE0Rkd4Ui80eHF3Q2Jr?=
 =?utf-8?B?c0RMWVljV3lnbGN2UzltMnZxdUFXNXpFeFFiTERJWFVHQ0sxWXh2Q1M3ZkdK?=
 =?utf-8?B?VkxYV1lEVVN4YlVSdGt4aFFENVhPcWhPMzg1RGVZbGVnbktaWE56Y25idnRz?=
 =?utf-8?B?REltQVNZSlpBZmhtQnFabDlTcitnV0RpVnYvbUZoR1F3QWVObUZMVVFwUnEw?=
 =?utf-8?B?cWpZbmdtejJMc0hQbThIbXVXMjZIc2tNUnNSNytKRkw5N1hVUURyU015Y0Fr?=
 =?utf-8?B?ZkJ5T0pSZUszV0d4NWd6TSs4RFNQUzBXaVppUUxtbUVuMkpvcnRSYVZVeHVa?=
 =?utf-8?B?ZlN5QXIrZktwbHBPUlNzR1VDUmwreExGZldHTFYyY0pya0xVTVFIdE0vTFU2?=
 =?utf-8?B?Q2dDQWJIckpXSks4ZHlrREFqKzl4L1Jmd1F6NnFBMEhXcnR5bTU1ZzVvSkFO?=
 =?utf-8?B?YUpQWXJwaEpoYWJKYjBuVENUd013TzdJVEFaMFltTVJHUEs5cE5XR043OE5N?=
 =?utf-8?B?SWNSc1g0QUxoWlhBNk9SUjR4WGpFamR0NHhyU3J3VlhiZVBOa2lHOE9qVDVn?=
 =?utf-8?B?cStpM1dRd08xVFJOcEtzVFZjNnJiRmdqNW5pcXoydi90MVZuVzgwSW84a0R5?=
 =?utf-8?B?Wmt2bS95aVJCZm1EalIzM1JnbWtIK2RjVkI0SDZUWDZVd3ZJMHBFTDloRGpT?=
 =?utf-8?B?M3RRbm0wY0E4UWxNQU9Fa3E2SytTSHhKZGE1aVJyNnBEMnlxSlYrK1dTcThm?=
 =?utf-8?Q?qu8PHIwXsXcDe0FPKUSYaB77yaDQTQe+/lmNBNV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e22ea7e-7fb8-4584-dc29-08d8d925e85c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 00:40:11.0670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5pblHnxPwhHlgi7jC9cR3F2TOXCZQuGGevLqZVO5Xp5GwCrwilCyT2stu2nT8U2A1buz9XdsA2q9EWr0iKU+aoxkAVMY/5J6ecoWMXGfrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3864
X-OriginatorOrg: citrix.com

On 24/02/2021 23:58, Volodymyr Babchuk wrote:
> And I am not mentioning x86 support there...

x86 uses per-pCPU stacks, not per-vCPU stacks.

Transcribing from an old thread which happened in private as part of an
XSA discussion, concerning the implications of trying to change this.

~Andrew

-----8<-----

Here is a partial list off the top of my head of the practical problems
you're going to have to solve.

Introduction of new SpectreRSB vulnerable gadgets.  I'm really close to
being able to drop RSB stuffing and recover some performance in Xen.

CPL0 entrypoints need updating across schedule.  SYSCALL entry would
need to become a stub per vcpu, rather than the current stub per pcpu.
This requires reintroducing a writeable mapping to the TSS (doable) and
a shadow stack switch of active stacks (This corner case is so broken it
looks to be a blocker for CET-SS support in Linux, and is resulting in
some conversation about tweaking Shstk's in future processors).

All per-cpu variables stop working.  You'd need to rewrite Xen to use
%gs for TLS which will have churn in the PV logic, and introduce the x86
architectural corner cases of running with an invalid %gs.  Xen has been
saved from a large number of privilege escalation vulnerabilities in
common with Linux and Windows by the fact that we don't use %gs, so
anyone trying to do this is going to have to come up with some concrete
way of proving that the corner cases are covered.


