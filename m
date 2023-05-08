Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7421F6FA059
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 08:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531269.826848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvuoU-0006Td-0g; Mon, 08 May 2023 06:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531269.826848; Mon, 08 May 2023 06:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvuoT-0006Qb-Su; Mon, 08 May 2023 06:57:37 +0000
Received: by outflank-mailman (input) for mailman id 531269;
 Mon, 08 May 2023 06:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvuoS-0006QT-0n
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 06:57:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b0fb0df-ed6d-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 08:57:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7351.eurprd04.prod.outlook.com (2603:10a6:10:1b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 06:57:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 06:57:31 +0000
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
X-Inumbo-ID: 9b0fb0df-ed6d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAD64Mg4IsVRJutXtFIyTfGHN6ne3i+pj8shU+hnYN9c8zLAV4m8DojUEeVOGx2nAmwReHtyxt3pifK6NJce8LpAXMJfflLW+V4z0NtdyPcPpOg7yFlMDNMmUD63SR+3s+EqITkyvKxELDvTHodnznZiO1VW8rvrlF3dn9G4IMErHPA+INZdj+VQkubcqsZkzQF2Ia7Z0M/Kk3F1c6N6Qyr5grq6ayy0Cllmwrg6Qx0GfPHIK6RHklAPqIRf0zkdDb1GtzrN2I0M21S9hPhqIMqA5iPXD761xJTFmpS8jrQnPkGdR0+L1cT0xPMqCCB+1qTKc1fMUbhUGk79qnZGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nt2NJz22ENuOlKjutZ54L4hE9P3SR48KwWTodLGBkk0=;
 b=T0Xyw7tcHJqe25UyZXEhvaxxcvrhTWoHcnmjK65kVceMlcvbh08TiNuv1x0jj7Hr7Ll1SpFFTH+yECe09vKD6TeNRSu2h3taa8b1I5v0+Qe6sHCwXjZLtDtR+fHVV6f9RrKmHuHBZjerSidBSl1XM3DZtQuS1sfnkk5tt2Vp8t7Dj6ANqen7w0Bj+BoRb2pkWikVQIRl95qNiD8tbduWVzhfDFTMmR5a9eTzKbvHziVneeQoL7+N3YKMQ2yBRq8M5Ro2G28l5Uig29aeno+G9utsjLbX4GI7BbxWzqPb+Bu/9wCVuVn7I1IksoSnc08cyvxx6Yw/j9Wfyo5t1SrP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nt2NJz22ENuOlKjutZ54L4hE9P3SR48KwWTodLGBkk0=;
 b=c4F84VgF3VYNLietC/CA5yN5LOc6uV0eV74wNC3PtWPWvd19MmG8MeWUTq8L7+c0zdLDXz7egiG62B+GkobWd/LTCXw0TxAUFmnbuXQDWLGYL8ZrLj2vFYDPUVAysb4PH94SFwcIrPnTlcYRR0Re6LfHgLQn1aHuxrtudzsbCuI+KdAudF9pW5sZEIz+JlEzevBbJqG3BE9//koH4W5u3GSAIVKMjKXZ3p6HOmBOMntizBJkhleTxxVCmMPIF6dqZ4wc+ApHv3Rom97iNbtUuuSdp/2kqB6R7uYE22VuBmSZXmUrMfd/VUiRQUeYhHKXvPP3VRYH6lFYQGe7Zzqa3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5dbcc00-ee8e-3530-f04b-0bfd8b936f9a@suse.com>
Date: Mon, 8 May 2023 08:57:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/6] x86/cpuid: Rename FSCAPINTS to X86_NR_FEAT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230504193924.3305496-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0074.eurprd02.prod.outlook.com
 (2603:10a6:208:154::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a6e9f7-cc58-4c80-df15-08db4f917e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n1Od0eWNjtNhp5Uh+scAWwZKzbWzgNhGL/qVUgvVvU7ZzJdx+aic3jNxsv94SiPicd1OQ2LUHzgxfwjUd+LHYCHhCz0c8tHax4NPXwubFNbvSZOuuD1HhihwfeYm6y7WJ9fOHbRErtF1X7sVnXgFtgq1wMDWtjEJmjcaowRL9RBqINDNABOHTyDUlTrMxh4lIuJOUv/8JL8GZnQW6i1y4y/C1m8S29pQQcibwG4Tt4ETOrxceS1k0gdlb1zyiR5iSxF+fFbCTiU5pCRBXGlumV+yLdMVGb6ozIhZftczpZSnvSEC4GLAjcCVDs8cyjN5K1tctpxFDFvcMt9lbSLrRxRMhQkEaQUw8Eo2647Kg1crNEJXdho+2hHj6DVPLkL/aTkpMu5mycGHr0UYXgnjW89ue/hkZVaT9s6L0iNGaBg6F1//XhnELapSbNGXc/NAxxinVMp1EHhEMpxQGqjsindojRQ3sf50dR2PoPfEkOly8v9aKfNatNRzGHQJhYa3PmHuWa+3KTsqp2EHLasN0JkXp+yBxAE4zele4/Tjlxguqjn1Aq+yKqRoI3lrzZAtLAjrjL0dPjs61xICtw19HsmmsScyRjtQ/B8TvezbBsrhI5Kq1aHwFJViNiRb4yDhQsZsiagzTQCHjrI4cizhZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(31686004)(6916009)(38100700002)(41300700001)(4326008)(36756003)(8676002)(8936002)(316002)(6512007)(6506007)(26005)(53546011)(6486002)(478600001)(66946007)(66476007)(66556008)(2616005)(31696002)(5660300002)(86362001)(186003)(54906003)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZitZVlFxTzI1aGdYWG1kUXV2RHQyMHhpUkFDemtXSXNRSzJENE5rbXpseENk?=
 =?utf-8?B?LzNvYXFHRmlmclAzUklsbEQwSmNCM0kxQ0NoWERTem11REcrMHAyR2R2ZGxy?=
 =?utf-8?B?K3haVGlTSVB5QytSNDBJajNOYTBwWWNGbEpqZ256OUFHOTd6U2dnU1dUdkVR?=
 =?utf-8?B?TVhZVkxmSm14a3ltU2JuaGxXSWk4NDlPMkxyOVBoNEF1TWxZSlpsMEh6Nk1Y?=
 =?utf-8?B?S2VRVWFFYTN1Vm9wakRTd0dRd3ZwQVFlQ2RSVW1NUlowc1Y5NGc0M1NoZW5G?=
 =?utf-8?B?QVdiY21wVlpqRUJBOFFJWmovbkRZQXM1cUw2MXhGOXd5cVFzZmlMZlRRUk1r?=
 =?utf-8?B?Q1R3UzUyaWRVSDJkQmlhUlJPZlJMZ0NjSzRRM2h5VllTQTFYRGRDMFA5T2ta?=
 =?utf-8?B?RFE3emZQd3B4SE5IRVpWTkJWK2NQUzBncS9IUkx0Z0R2Z3hlTTVQTDhRWW1i?=
 =?utf-8?B?a1EwWlByNDdpR1VQbzFBbFF4OFJ1M0xzb3czWmhsOVhDNGRUcnJxeUFrcnlL?=
 =?utf-8?B?VmFVa0NkbnE1N0w2Zm5UanFQY2kyczJlM0lxTXhVVG41V1UreXFxN2JxU2Ro?=
 =?utf-8?B?c3A1YkVlV0hOMWxKQk0yczVwNFBTWXRMUTBUVEM3NVNtd1dpcUNhUWJjTE5y?=
 =?utf-8?B?cFQwNnRjdW5WdE4vOEdlVWczVFB2UmNUd0FkYTE5UzRjVERWWEdXZktFQUJR?=
 =?utf-8?B?N3dPcHFIRThCdjFzdExHQjRvRmVvYS8vUXdlK3Fha1VqaEtWTTdqY3oraE12?=
 =?utf-8?B?dExkTU9VcVRSS0NGZTF0ajI1Z3VmNjdCMVJvdEU5UmUvSGZhRDVnNVl3WDNN?=
 =?utf-8?B?eHJ5Y1hoZHFwQXQ5OHVGc2NXSUd2bkF6azZVY1NPYmpnOGs5bElMZDZXaGZ2?=
 =?utf-8?B?bTk5d0hqZGI2b0EwMzg0UGtpbTl4Y0U4ZEV1WkloOVNJODRLMjVUeEE1Qk1I?=
 =?utf-8?B?amFaVHp0NWllcjdNVWFaWXhJR2RTczVtT3VqSHJ2d05mUnBobERpMk91b1Jq?=
 =?utf-8?B?SVJ1VU1RL0JIQndrZS9wYVdLNk9CZXlCUDh4YUxJOWNZdkN0U3Y3bDhieUZr?=
 =?utf-8?B?WHU3QUo4Z0ltS21EczNyUmRMekJBOEd5bDdLQXl0QXlvSFhZSjFsRzNUWHg4?=
 =?utf-8?B?MzZ6ekozcWhHdEdjbFVsSmN3YlFtRzU1VzNjL0FFci8vRE55bm1yZmlZVjZR?=
 =?utf-8?B?Y1oxdWpaUXhzdnNIdFhZMlgvWDNiQm5oTDN6V2hQaVc2SkpzR0xLK1l2bTJa?=
 =?utf-8?B?Y2xOTUE1RStycjl0RC9OVDhLUVVxbU9QNyt0YUYyOTlJOTREd3JJU0hBTDdv?=
 =?utf-8?B?Q2Q0cnJnUVNVdjFvZVRSVXZQL2pHbi9iZ1ZzTkZrWkVSMlZjaEttOUFnMHk3?=
 =?utf-8?B?eDI0NzBwRmh1WEhzZWNjMUI0amhJcFJtRitBOHVRUTNOencrd0dQNEJzaFR1?=
 =?utf-8?B?U3MrclZoN01iWDUxVFUrN1Zhc2hwZjJaWXBvYkNtZWIyNElkNERJQ3JVM0dl?=
 =?utf-8?B?SjVlRUdDa0xRYm1NakNNRWVyb05tRk1NZkp0bEFNK3FGcXI0UG14bUtFQnQ0?=
 =?utf-8?B?d2NKNi92MVhmbnI1Zm1hMTRpMHpNVy8zclpPWFFCRnlvcFlWSHhUcDd6bDQy?=
 =?utf-8?B?Wk5mcXE2ckJSWDgwZmwrQk1nVWZmYUhvZWlBMDZZY2tBUitobFU1NFduWlJx?=
 =?utf-8?B?TlhkcXJVRXd5TXdOV1Vna2p0emZMN0kxQnZzQ1BRZFg1RXBveEJoRGh3ekdk?=
 =?utf-8?B?N1RVU3RxaWhIcFMyVWlrN0NacEcwQ0hhUFQyUno2OTk2c0VvMEF6SDk0Wk0z?=
 =?utf-8?B?em02WDBYRHFoZmJQZmFsUnk2YTNnZG5pOXU5VWV3VEZ2eEg3MzBQQksrWUd1?=
 =?utf-8?B?MVVKQmxOZHZza0xGcGFhOUtwQjR5aEg1eXBzWUJ0NlVEWDhUYzVLSHBnWVJa?=
 =?utf-8?B?dTNYOWM4QThlaW1BVjBHdWxOSHNYN3NtK2tvWGJFcW1wRUQweTB2dzNsbWE0?=
 =?utf-8?B?bkJpMGlUTzZlMWlpcTE2Y2ZrcmxDRmQyZzJkalFrYnIwVXloaGhneFRMZFN4?=
 =?utf-8?B?Q0xrL0EyVFA4UnNyUmtnbzVWVCtDSHNuUTRkWDhxdnJyWHBWTHhYa1RlUkxD?=
 =?utf-8?Q?bTIjTofEQt6oU+x/umiEv3N23?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a6e9f7-cc58-4c80-df15-08db4f917e36
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 06:57:31.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IN+WWWBIuvbOCCPZ7LhXA00fe/yHA1TQDiHtDj9AW/oDCT1qG77/V0+W2BygddkEXpFFNgN2+DzPqVi5A6QfIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7351

On 04.05.2023 21:39, Andrew Cooper wrote:
> The latter is more legible, and consistent with X86_NR_{CAPS,SYNTH,BUG} which
> already exist.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

And in the light of this the name choice in the earlier patch is probably
indeed the least bad one. (I'm sorry, I should have paid attention to the
title of this patch here when replying there.)

Jan

