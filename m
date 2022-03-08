Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA904D19A6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286918.486635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaGt-0001Rr-3t; Tue, 08 Mar 2022 13:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286918.486635; Tue, 08 Mar 2022 13:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaGs-0001OD-Ve; Tue, 08 Mar 2022 13:53:02 +0000
Received: by outflank-mailman (input) for mailman id 286918;
 Tue, 08 Mar 2022 13:53:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRaGq-00010W-KC
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:53:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10850441-9ee7-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 14:52:59 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-oCxbH8yDNz6-oW8feW8ooA-1; Tue, 08 Mar 2022 14:52:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5303.eurprd04.prod.outlook.com (2603:10a6:20b:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 13:52:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 13:52:56 +0000
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
X-Inumbo-ID: 10850441-9ee7-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646747579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yKsUp5TFllCbN8cWmemN41kbdSCY21VHkGEnScpabdE=;
	b=Kmx4v7k7qYBt4/YwtTm6vOGKwukiLFAjAZqgSp4Eou609icLJjaWRjtX3gOS0qnEUzSZye
	cIvj09OzKF0RCN0YxVeXjnxi8Mit0hpMVhU7f2rWmx8k0zNXl2EYJgcG9U/sB56SrW7EmW
	ov0ey2jKC0GmsXd11L9HMmtiTYL+ZXU=
X-MC-Unique: oCxbH8yDNz6-oW8feW8ooA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyU7yfHGCiifOy0/CKR90bgAdIsMShxxU7k2rcuChwSp5zjSh55Zy71/gv4aVO1HTEk7Vu9DKe1Qo5IavEN5Qlms3TBg++FvsZZ4PNbB3nqZq+PgWsA/csnH7nfAqhoz+sL22HRdyOJOEmZRB6GjrQ2mV97EZustEz1bccAls7TEzGAhi2jxlaE4kuwqrFXCr/nNlZcr0TANbQLRb2iq+Sdgl68RV4PuckMGdqHTaYsO9QqbMUbZBTDvuI3dJm598Tjaq2566jdPQyh/H3bLydy+Yx9RZ6jPL1fKRQ+uP5NYIDCmhM9p+twvPoGRBfG8Y0asmV98WlWR/sCK5B3kNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKfaemJrMfPvHoimJl7a/DPrGcRY7VTcCuerE2pjJNE=;
 b=R79NtpJTEglP36ZcyoFFgCBGry3/T4kRpiQxAKS+vgP27jlKLIyhzYi7ivY/Cbhtdzx5fhosnVKjuMro1R1PHr6dFINpoMP530nX/vJ+bBFO/1g9XYI5+hBKC/H0WX83GpPleqfX4Tw8bwWmGumLP6UG8gtFOc2Qhcl6m0y0+CPDvL4P3/yOHz8112cWp2mBdkIt81QTLQ5qLH4foDa8HnEy4xs3ETa8vRhbckOpKLieOxNNpXRrB+aSBradzED6UxnftWsYRowQ9oMORkhYCMib5T+LosN+if/Uwq/bGA4TWDoV1KPnJ/77GWosZpO35mpLKvQgvBNFmixwEOMXtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4881ce3d-0598-bade-3b5e-ff26e3125b4d@suse.com>
Date: Tue, 8 Mar 2022 14:52:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
 <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
 <cc6c9782-fff6-1832-0c25-d8fd38ed1c1d@suse.com>
 <88014841-017c-5621-0193-c4223596a29c@suse.com>
 <4455dab2-d52b-2e1a-388a-ffc3123438a4@suse.com>
 <7764a747-bff5-7c76-ab4b-a93fdd9050df@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7764a747-bff5-7c76-ab4b-a93fdd9050df@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3917ba48-0fe3-415c-a5c0-08da010af2f4
X-MS-TrafficTypeDiagnostic: AM6PR04MB5303:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB53037210AA4D5D7F76A1A7F4B3099@AM6PR04MB5303.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LHWWCrH5LLxzJ51MVUnHfems45rg8qSCa8Pfv84wK7CPEo0BxHgBnodCC9MdNQ9eIuxRNSoEnSXOtJrms/JSobJFtot3iFqMxUnWxnMEpZHI6qrny75pvGuu9i8MwKiAVDlH+tcOtcbJl4G3bsD6IpebWp/cBO565Ag4Db4axdSe3bAKyfikhT+gKIgvA15Q502Gs0LYoHkudLdbddUB15u4tfoyBWw+8uv6zb7C5i7d2q8sPgcOPsFqHp2cktFccDS7b3e7xiE3EMNW0LrwFgSUAdw3QSoqcqJBvIzLmdcpvCuCUKcmkFyBNBUiC1J3coQTbnWqTdUc2Tif7jQxkygzN9y7UsXyhhIqtvsGa2YKRjC8W9LHXLPGN1kl81T+Weoo743kyjnCzEYdqwpAn70TS4nAUvMWDnxFsSCUW4QgWj3KbAASJJxUYBl+qoE2F/M5yoHFq43uPQ0iQKhkEZ+kCQpRt4rQXn4hoFR7SzkIQcalhnJXjZE149neZJkRfJGEwCJzLu441AR30gPupjenTbjHyIf9i4iMNqS8YjK9pUlGnPLE4csVH7fkPQyudvg54oP1WSV8s6AjQD3rwTqD5AP/oJ6HBG0nXdTh24/NqSESzTaoEdHmr7co6aNIJ5FQyCkTN5LqLaWZNLuzighDGGcSb79a9HHiwtZ1TF1LkV0QrE2xJlIeqLVL2na1IfJ9CHqYV52Gx3k6BUcsQrZzyt789hl05OnkJSA4Gf8EXNugyPe1FcfrfAi6lq5i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(38100700002)(508600001)(6486002)(2616005)(66574015)(6862004)(26005)(31686004)(186003)(4326008)(66476007)(8676002)(66556008)(66946007)(53546011)(86362001)(31696002)(83380400001)(8936002)(7416002)(6506007)(54906003)(316002)(37006003)(6636002)(6512007)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lmtnnsgYHpKGs0s21XTXZVpmD8QFVW3CEPUk4md9owyD3wwwybXbCddfWrCx?=
 =?us-ascii?Q?N3KIKenr5ZGQaBc+aJVRFwCOzZWe7013yglnGRs3Rllo2fFEpnVj3x8DHiES?=
 =?us-ascii?Q?tRbjuvJWnpiPtrOh7c6m6JajNoWQqJ8J76/DEBFYr5lkrcrwILTF+PV5Tuxm?=
 =?us-ascii?Q?7vX3WZjl/h+XSgOnRFpcoH3z/9DIxUnvOetyOZE6tT7uQXesv76IEEcn1Lyb?=
 =?us-ascii?Q?RlazN2xgrNUT6n6ZB69vb4S6y/hvw6hxT0INz06PmShY+7b3pUnkKEOhjsHk?=
 =?us-ascii?Q?ux/epNl8r4OvyuRMXLfN7wWDOVsMZE5S6LLOalX/xHWyqP3//8+Pfl37IWPj?=
 =?us-ascii?Q?BIMBBL+GuaY1YDMl4Psi41WFUFFT8X5hNoIhX4t46JgaAzNw7gWHwN4nYDNi?=
 =?us-ascii?Q?m6tAfsd48W/RNU83tlzIZlMykazqDXOEBxrlEwCBQKuhdIEezhRVwlbnVnfy?=
 =?us-ascii?Q?OjP+KtwzM7Q6LIyh1doXRYO7WtCex4s0e/26fYIbJHy7mp0lbDAf7ttkn/Vo?=
 =?us-ascii?Q?8GZyqK2Kwe9PZ21ETtc0IXo35U+sp0WNGU2edTlv1cEv9mH1sMZ99sF8+l8Y?=
 =?us-ascii?Q?satIYDwaf4RQikpG6ZaNKKCGSc8CKHv3I0GDR/3aBoIlEKrEzsqR4WYSR5dw?=
 =?us-ascii?Q?+Me/MX6GFxK0P4beUgVnqFN3qIomynh6GoYJffQidLg5Gusjf1kP5sPXwlon?=
 =?us-ascii?Q?WiyetdlmZqfgP0RXs3UzwDqTv8kW6E4OZ+MGtvBHMft9BikA5nRaQzjw+POR?=
 =?us-ascii?Q?o96zmQxf1dgy1DpWJsRRFWP3moWlVmkfYx6ZrtDCDwWs2EaYr8yb4se0+wrx?=
 =?us-ascii?Q?64F+bgxUwwgpghiP6oqwO08C1FzAyMHfPAdqQuejNkUBqsTy+1xjTY7+41f3?=
 =?us-ascii?Q?FX7m5FCvUOst1bDm2/G6jQBSI3IMznVNdFOyUYfrPa5vcH4LUKLVoxuCRCep?=
 =?us-ascii?Q?PvPRoHdr0odFJ6HRFh7X9z88uAApwosxGhzdYNplsPeb3OOnTZLc8LAAFHqB?=
 =?us-ascii?Q?Gu7+1iWUJ3AHFJ0dNotclvG02zDUAr2WsQBMeuncgHTBuzfc7+doR8YfyEc4?=
 =?us-ascii?Q?OIsa0IXTJsdFQ0HljvIvhRGsfm1jJINDeOyq41yYWlo06uRXSHSYHKY65tZ0?=
 =?us-ascii?Q?37s/cB96oVmVFc2X/lRn9cOFUE074/as8ozjRvQFtqubiKynGmzTtXJ2OfT5?=
 =?us-ascii?Q?UyfiZ+EWk6JELLR9VRLEuH2FvxavRImKwK1gCsj8YDl9bJXry96+/sf4Bi+9?=
 =?us-ascii?Q?UuT8oNGDrtp+PYyFeagSOGtP0nuGY+4BGyCmxyh2sVy3/KPED3aIfC6sRfML?=
 =?us-ascii?Q?upsjOoQ1M7OK1alEQYliGpyhT4GQTJ504InRCZWbHV4304urCc35mNtRxDzR?=
 =?us-ascii?Q?/LwdAFMWpcIfwXw2KIJ1dfn/bjpAuxcrA6RTlA8bt9NPFSpVNlyEW/LvR25L?=
 =?us-ascii?Q?skgALDGJ7s4OPgPs+R1tJg0IrNTUEPAAvoFa2AXYK2Vb48WrYGOVGThGso94?=
 =?us-ascii?Q?8cLpcKxSpbJ2KOecLfEIBu4yk1LQ6CNdJKZjG66kl5eeMTCo8ltKHv90KRlT?=
 =?us-ascii?Q?Ooyj1AoyEnlMxrTFEM30dzFmY5rFfqBu9FRdOifJdDCM3wiXxUu4kk45r7Ze?=
 =?us-ascii?Q?8C+GReO6v7q5jvUTIlki0+c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3917ba48-0fe3-415c-a5c0-08da010af2f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:52:56.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWfd+vAXZXNFX4GOWusy2bpeHCOtaJ+Fldwy7btJmZXkZjysCWMQfrBBavcZ+CwNMP7HlQDn0pNa4TPR7fHKAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5303

On 08.03.2022 14:44, Juergen Gross wrote:
> On 08.03.22 14:42, Jan Beulich wrote:
>> On 08.03.2022 13:56, Juergen Gross wrote:
>>> On 08.03.22 13:50, Jan Beulich wrote:
>>>> On 08.03.2022 09:39, Juergen Gross wrote:
>>>>> On 08.03.22 09:34, Jan Beulich wrote:
>>>>>> On 08.12.2021 16:55, Juergen Gross wrote:
>>>>>>> In order to avoid indirect function calls on the hypercall path as
>>>>>>> much as possible this series is removing the hypercall function tab=
les
>>>>>>> and is replacing the hypercall handler calls via the function array
>>>>>>> by automatically generated call macros.
>>>>>>>
>>>>>>> Another by-product of generating the call macros is the automatic
>>>>>>> generating of the hypercall handler prototypes from the same data b=
ase
>>>>>>> which is used to generate the macros.
>>>>>>>
>>>>>>> This has the additional advantage of using type safe calls of the
>>>>>>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>>>>>>> the same prototypes.
>>>>>>>
>>>>>>> A very brief performance test (parallel build of the Xen hypervisor
>>>>>>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>>>>>>> the performance with the patches applied. The test was performed us=
ing
>>>>>>> a PV and a PVH guest.
>>>>>>>
>>>>>>> Changes in V2:
>>>>>>> - new patches 6, 14, 15
>>>>>>> - patch 7: support hypercall priorities for faster code
>>>>>>> - comments addressed
>>>>>>>
>>>>>>> Changes in V3:
>>>>>>> - patches 1 and 4 removed as already applied
>>>>>>> - comments addressed
>>>>>>>
>>>>>>> Juergen Gross (13):
>>>>>>>      xen: move do_vcpu_op() to arch specific code
>>>>>>>      xen: harmonize return types of hypercall handlers
>>>>>>>      xen: don't include asm/hypercall.h from C sources
>>>>>>>      xen: include compat/platform.h from hypercall.h
>>>>>>>      xen: generate hypercall interface related code
>>>>>>>      xen: use generated prototypes for hypercall handlers
>>>>>>>      x86/pv-shim: don't modify hypercall table
>>>>>>>      xen/x86: don't use hypercall table for calling compat hypercal=
ls
>>>>>>>      xen/x86: call hypercall handlers via generated macro
>>>>>>>      xen/arm: call hypercall handlers via generated macro
>>>>>>>      xen/x86: add hypercall performance counters for hvm, correct p=
v
>>>>>>>      xen: drop calls_to_multicall performance counter
>>>>>>>      tools/xenperf: update hypercall names
>>>>>>
>>>>>> As it's pretty certain now that parts of this which didn't go in yet=
 will
>>>>>> need re-basing, I'm going to drop this from my waiting-to-be-acked f=
older,
>>>>>> expecting a v4 instead.
>>>>>
>>>>> Yes, I was planning to spin that up soon.
>>>>>
>>>>> The main remaining question is whether we want to switch the return t=
ype
>>>>> of all hypercalls (or at least the ones common to all archs) not
>>>>> requiring to return 64-bit values to "int", as Julien requested.
>>>>
>>>> After walking through the earlier discussion (J=C3=BCrgen - thanks for=
 the link)
>>>> I'm inclined to say that if Arm wants their return values limited to 3=
2 bits
>>>> (with exceptions where needed), so be it. But on x86 I'd rather not se=
e us
>>>> change this aspect. Of course I'd much prefer if architectures didn't
>>>> diverge in this regard, yet then again Arm has already diverged in avo=
iding
>>>> the compat layer (in this case I view the divergence as helpful, thoug=
h, as
>>>> it avoids unnecessary headache).
>>>
>>> How to handle this in common code then? Have a hypercall_ret_t type
>>> (exact naming TBD) which is defined as long on x86 and int on Arm?
>>> Or use long in the handlers and check the value on Arm side to be a
>>> valid 32-bit signed int (this would be cumbersome for the exceptions,
>>> though)?
>>
>> I was thinking along the lines of hypercall_ret_t, yes, but the
>> compiler wouldn't be helping with spotting truncation issues (we can't
>> reasonably enable the respective warnings, as they would trigger all
>> over the place). If we were to go that route, we'd rely on an initial
>> audit and subsequent patch review to spot issues. Therefore,
>> cumbersome or not, the checking approach may be the more viable one.
>>
>> Then again Julien may have a better plan in mind; I'd anyway expect
>> him to supply details on how he thinks such a transition could be done
>> safely, as he was the one to request limiting to 32 bits.
>=20
> In order to have some progress I could just leave the Arm side alone
> in my series. It could be added later if a solution has been agreed
> on.
>=20
> What do you think?

I see no issue with this if there's no other dependency on Arm following
suit.

Jan


