Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB36385E6
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 10:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448121.704991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUiZ-0003D7-7D; Fri, 25 Nov 2022 09:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448121.704991; Fri, 25 Nov 2022 09:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUiZ-0003Ap-4Z; Fri, 25 Nov 2022 09:09:55 +0000
Received: by outflank-mailman (input) for mailman id 448121;
 Fri, 25 Nov 2022 09:09:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oyUiY-0003Ai-2E
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 09:09:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb8550f6-6ca0-11ed-8fd2-01056ac49cbb;
 Fri, 25 Nov 2022 10:09:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8066.eurprd04.prod.outlook.com (2603:10a6:20b:3eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Fri, 25 Nov
 2022 09:09:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 09:09:23 +0000
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
X-Inumbo-ID: eb8550f6-6ca0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8wolmveCHg78lKtgt3liFo0pDuJ2QzxU7KV7OAHhx3CbomRORU3GcJiLAa1gmjLiw6dNg2VhTMop84Kfnb1SchU/0miFXQuvGOadUlQBkoRTjHCgaNUWPl1z0GUu2gEaqpy5U/8awDZ3+iep2ba94GnvmLa7ezHgiUu5EiOc/m3goNQanIY766RBpKfQ18x6eJRMwcFk8zudbfsSjbsrXLk96GT6K1liZlX50mV93VF1nvznEPuxSmDIhKs7dF644LAZfEOhbMxf2Wl/w4MT3Y0ZeO6i2+zTOnmCmCG/NWho4zj2Zf7OWq1+nq8XAhW1LjLb40zWC3RNksxiqn+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkzG6vfyxgw8LTU7MRtKPm1Faxf1F4cCuwn/3h7f9WI=;
 b=esJNuMkcU2bVcpUAfkhI9Z3mWJOX/MKnYD6X5k0a51TYTBWQbvkgkOiJdW9QRDuwonMuhqYXxfuCF28TW0o9hJksVHU04R4MtrC1dbi2zJHW55Tpb2uRyJvQaz/ceeKpgg35PNl349+FNzJywNQ6/tKbM8a6m9pI7e4RRTSeH4v9W80A+4O19U3djSb+E3wbkBfmygwPeDIsKR9ACP7dhg5lPeno3mF+57PNWm4+iehw43/X1UhDRu3eAsBsSauHizGmO/H4TlAXgHT+h5YcprzBSba0+y2CBk/vBVZyxdd5YgFtpRG/rK9BUKlAxos2zxgQePrsQRiUI0z83Ipw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkzG6vfyxgw8LTU7MRtKPm1Faxf1F4cCuwn/3h7f9WI=;
 b=BmU7hKC9YulpJc/0iT+pHnvIDv/Dq8c4ImUeNmRQDc+i1dM3YEI2UIYN7TzrtnVGkTwSybqBNdm+C2EOZUxmVwqSULtlAv5TrvfuJSom9Cv2wTZIv0pDErJ5zEG83YFCqbNWYURPhajWUoKv82d7WrKRnE6gbfyLuvIkwRGXIry1e4cxJt7N+d36ALMhkGvt42/jHmWkI8nLEvQH3rYBTgpDYdW0MD4XKXNgYrV14guuH65ZaRE6aQzHSNe78ilPWhNtMfAwZDX5p85Bvrgz8HFmw/V0S9AYtYpayRBTey5If0J/teVHAA7Sh367ni5TGiSChD4jiC0uCKYqKCND3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7fdef1d-709b-70e4-2e45-63eb24dab351@suse.com>
Date: Fri, 25 Nov 2022 10:09:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger> <Y38z/h4aEkzh5rCG@Air-de-Roger>
 <c928c198-2565-2105-2b6e-b07e96935080@suse.com>
 <Y386hoiAovoACjEG@Air-de-Roger>
 <3f3bced7-62e8-4ff2-655d-aed222f343a9@suse.com>
 <Y3+JwEtSHTRhngN1@Air-de-Roger>
 <516fb872-bc79-ad8a-233b-b821265c1911@suse.com>
 <Y4CEKd800UtOKetX@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y4CEKd800UtOKetX@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: ac446ed6-77a9-4e9d-60bf-08dacec4bebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VA7JUWyrs8tTxnN3LR/BSCB+AEe989nD3DOeHwlNSKbPsR65xtNTP1WqukeqX7mlqitwasbqTtcAl/AfbaGgNpny3JAfh+wVTYC6inOCEtws8YRsXWp86r5ToH309jBmZX4EgXtTasPklH5IgsaBporUkq/mPT/nlenxgQs5EqvsbbCSyl5J5pb+rfar5Mj/WJejqqvVnZ/rQOuGL/Ee94IQaEFAXlFeyRu/tN/V0vVT+kIRJ/Q38MF0Yd6POUiIQ6JIlWmigNpn070Gudj9MHnaAdaCQt8iJn8PKJ8IQWf/Zb3VqTwloz7hqkL0XA6vOR/6f7DHuoUiOiLUxpr/KBPW6cawCGtwx1t6xL/jwF2jjmKAIjJlDCBrojCuupjhmyDJzg0BfaH1f+tXEpzNlRAkHHyAGGHXd+TrWfo3D1FhjppKhQYvIc9Laeai1UHQudLEgCNAixkG4Iu3zCqiEYXzhvO1FnFF1b0XHg7jWSL9uZJplVejrDbQeMexvsdVoSVxRwQeXo+HcMJACXZzM4tdYCtSk/utjRvmoqWdTW4gqaSPMqZeAh2rz5IOwZVHuosFRuicsCWbdJLQrYXcWvK1/mfbvZnTZa3/c9o+sUvX5avLE6Lhxwt4bNVp9OkczUeXjkQt5x1JYFBEqZoq7dYluZ2Z51hYM2oyo6XfbpASSc28EUJIH5WYVVcutc9pDM7bcoZ4oceykxM72KVUlRCZXvZZxNGMFCAIVsPQY+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(41300700001)(86362001)(2616005)(6486002)(26005)(53546011)(6506007)(6512007)(4326008)(478600001)(8676002)(66556008)(36756003)(186003)(83380400001)(66476007)(6916009)(66946007)(54906003)(316002)(31686004)(66899015)(2906002)(38100700002)(31696002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WktVeU11UklYSTdQQlpGYXRTS2Q3V0RVVHFncW4rNlZXTTFnSjlhUUVUV04r?=
 =?utf-8?B?cDlBWUU5azZmYXg4S2RndXBwQkNwZzBhbnBBM1JENDhtclFuRVdvWkYvL1g0?=
 =?utf-8?B?RFpnb1dmNXhQYVE0OEUzR01RM0RmSTEwWXZ2c0J1cWlYbE1SUnBSd3lXRjVO?=
 =?utf-8?B?b1dCemNQajJRcndBaEU2TUxZSDVscUo3VGR1djZPKytuY29idnRWUU1KMk1x?=
 =?utf-8?B?SDVZN0NLTjJTRUNOQWZmcitDRE9VV0ZUUE1kZHBqYXJEUGF4NFNiMGYwQjRB?=
 =?utf-8?B?cFVzVzZLaFFmRHJHQ3R3cHExVWw4YUlVcDE0TVVtQlNCY2NObUxvRmI3b2Rs?=
 =?utf-8?B?Y0ZabWxleFVrNy9wbkhMWlhzL085R2M3dEs0OXBidUJvYVpIcnNXT3VhMzRK?=
 =?utf-8?B?WjZZaGFnY2h4NmRvQ2NmRkYvbWVEWmZ3QUw3czBpR2tySFV5RlZ4MTZoK0Rr?=
 =?utf-8?B?TVlqRm9lZk1QS1Uza3BzdkdTN3gwcitENnRNK0o2eFo4UTErV01MaTRCN2tG?=
 =?utf-8?B?TFNTaHRaTHZMQUcyVFRkMm5wTjhack9EdGtWczZUT01oMTh0bEVHdEdhQk5y?=
 =?utf-8?B?MWlzMGZZNFNrZWMvbFAxY3ROUHkwcURncEtuYUpReWlBZGxpZFE4em42UGx2?=
 =?utf-8?B?dGIycExrZW8zS29VWVkxZlJ5U3VQTk0yOTc4Ykc3ZEhvMU5vTzF1STBJOGtK?=
 =?utf-8?B?UjdDK0dseDJVREhMbXA3Tm0vNDBPRmRPMEQ5MCtZTDZ6dDJTV1ZTMjFFZmxz?=
 =?utf-8?B?SjlTaUNtakV3cGtLdUNQWWpOQVFxTzN4YWZuTGxrOFFzYVFGRno5MWJ5MFdK?=
 =?utf-8?B?TUl5MCtaM0pDei9lSHhaMWtEcE1sV3FnVVNobFhiMG5ZWjZ5S1NjbEtOa0px?=
 =?utf-8?B?b0ZOcmU1YVp6NkNzZVBPSStHcllEK1lJM0VxOSt6Q0hybkRxYUFBSlJvdVZq?=
 =?utf-8?B?bVlXdFcvRUppajdDWVduaFlodXM3eEoveGI2VHAxejJ4Q1lTa3NSZlgzR0Uz?=
 =?utf-8?B?U3BQSW4yTEp4S2d5VjRNWnlwNkpQOElyVlBpaGJINHJVVlo3emFsOWVMOUIy?=
 =?utf-8?B?TkEwYUJnYytlNDZBQ1Avb3ZtK1V4SmVLelBkNG1vZlU0aHBjV3FiNkkzTUNz?=
 =?utf-8?B?TG9ZdkpVLzJIS2VNQVYrcU9MTEtkL2U4azRlZTBsQUl1UWZ2ckcwUnd4ZFhz?=
 =?utf-8?B?all4U1liTmtDOXN0TUtBVHdUNGtHMWUzWHBBNWtBMjdiUFMzejVGY2NxYVdM?=
 =?utf-8?B?VDNIbzMrVjd3bm9PUVF2YlZvN0xZdzNnTVpILy9WcEtySUF6QTh2eXoybnFw?=
 =?utf-8?B?WXd5M3A4UStKNU5yRmZYVU1ZeG00V1AyQ2R4ZjBBcDBDTS9zelpONlBlUkZM?=
 =?utf-8?B?WmxYY3dDTXVYa2ZKamp6UkR0d3J0K01vTm02VUh1NlhqVkJxcGZoY2p4VHA3?=
 =?utf-8?B?Y1ZpOWZZZ3Zjbm93ZHFRcWVPekF2cjI2VlZHcDNqM0hVOUVLTi9FejFzbVVz?=
 =?utf-8?B?MjdFK0lMUzQ2aytrVzV3NTRSUFRIMjA0UmJuaWszSUhUdGpOVXEzaXU4Qnc4?=
 =?utf-8?B?SmhMK0FkT05Rb2ZyT0RncVdOUHBMVmxINjk5S1ZlSXY0RFBadU82TTFkMHZ3?=
 =?utf-8?B?SVZSQTE3TTBEalE3eXBKeU05bUhickRFVFFLUGJQNDM4cko1RDZ4M040SEZE?=
 =?utf-8?B?d0JpUzRsSkFqTEk2SUNBa0M0VTVaeWIvajBtMWR1cVpYOFNUTDJWN0I4UHRZ?=
 =?utf-8?B?NXQwTXVZcjF1NzFxNTFzODhMeHN6d3ZDVzU3ZkdrdUtITEtoS2Y0SzZySjdu?=
 =?utf-8?B?b3YzbVptbndCdFF4aHhUUENEaGdxVzFDNXhSdXdYMkJZZENvY1lQY01reFg3?=
 =?utf-8?B?MzkrNTgrUVVwbU4wZXVOb1F3LysrYnk3WDhvdmdXVlZUcWJDSlNmWFZaZmZ4?=
 =?utf-8?B?UStlbDF5MUplS0xCNk9PWTUvTy9SOXFYdzRaNUF2clpBazdUM25aWmNtczY5?=
 =?utf-8?B?eS93UFVCc05nbHMvL0xWMWRwMmYrVVVnUWEyYS9aU2JRZTRMa000eVlSdmgw?=
 =?utf-8?B?MEhld01ONnkzRWFYR2pUeXRCQ2duTUxRZDhuYXJ6bW1TTm9KSVdqRG1xR1Rt?=
 =?utf-8?Q?atrmHB/0XEre36xqimqwJa1pU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac446ed6-77a9-4e9d-60bf-08dacec4bebe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 09:09:23.6499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9L3LqJo138MrFLtgpvCcnZIcL4B+Pjc3v8ovek+BcUYrRfqtKKdiSdr3zRCabv9rePm0g9UKstUC1LvGmqgAVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8066

On 25.11.2022 10:00, Roger Pau Monné wrote:
> On Fri, Nov 25, 2022 at 09:43:59AM +0100, Jan Beulich wrote:
>> On 24.11.2022 16:12, Roger Pau Monné wrote:
>>> On Thu, Nov 24, 2022 at 12:16:13PM +0100, Jan Beulich wrote:
>>>> We need to be careful here - the kernel treating it as "edge" (like
>>>> any other interrupt coming directly from the LAPIC), it ack-s it
>>>> before calling the handler, i.e. before evtchn_upcall_pending would
>>>> have a chance to be cleared. See Linux'es sysvec_xen_hvm_callback().
>>>
>>> Hm, that's not how I handle it on FreeBSD, where the vector is acked
>>> after calling the handler (evtchn_upcall_pending gets cleared before
>>> the EOI).  Maybe there's some corner case I'm missing that requires
>>> the EOI to be performed before clearing evtchn_upcall_pending?
>>
>> I think for the purpose of the one vector doing the EOI late is okay,
>> but aiui the goal of doing it early for edge triggered interrupts in
>> general (and yet more generally as early as possible) is to unmask
>> lower priority vectors as well.
> 
> My reasoning for doing it late was in order to avoid adding extra
> latency to things like the timer handling, as the EOI will likely
> trigger a vmexit.
> 
>> Of course that's useful only if IRQs
>> as a whole are unmasked during (part of) the handling.
> 
> What do you mean with IRQs as a whole?  Are you referring to setting
> the interrupt flag?

Yes (it being cleared).

> Thanks for the input, it's appreciated, and sorry for diverging the
> conversation so much.

I think that's quite fine, because aspects like the one still in context
are at least potentially relevant. Especially since here we're not
dealing with architectural behavior, but with an extrapolation thereof.
And views may (and apparently do) differ as to what the correct
extrapolation would be, even if just for corner aspects.

Jan

