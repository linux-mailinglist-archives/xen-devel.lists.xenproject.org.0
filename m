Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446F14D1969
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286876.486557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRa6Y-0004oA-8w; Tue, 08 Mar 2022 13:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286876.486557; Tue, 08 Mar 2022 13:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRa6Y-0004ld-5L; Tue, 08 Mar 2022 13:42:22 +0000
Received: by outflank-mailman (input) for mailman id 286876;
 Tue, 08 Mar 2022 13:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRa6X-0004lX-4K
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:42:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9310dd65-9ee5-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 14:42:19 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-rSnQhfVcNXeHq3oaOjfuSQ-2; Tue, 08 Mar 2022 14:42:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2858.eurprd04.prod.outlook.com (2603:10a6:3:dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Tue, 8 Mar
 2022 13:42:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 13:42:14 +0000
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
X-Inumbo-ID: 9310dd65-9ee5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646746939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wawVZcj2s5JoZuE9NG8FjNQVTNL9k0UTvZo/S2GbZYE=;
	b=cs0FG5edK6qX8yIunuXfCCs8+riYY08B7R9f0w/1GfUQvhI6Nf8nKraDwpw1AGiZ4OxKlx
	/FNKqVQGuJY0qZxq+CUgNUaPo3iLefi6mVav9bWtOth3L1KdrWNRQ1voyN+IenV0Ce5BMK
	nA1IdoTdS0IUAYMBjH9uCDeKlNRQJI0=
X-MC-Unique: rSnQhfVcNXeHq3oaOjfuSQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li9eoyoxaGFnONs9w0LvBMdtDkrRZoy6OSiEkUyWVoSImw3PF2Vvq9MvdyGXgzLGpmB/3Vuk+pLyWd9iUGAU2IAnF9wJgXvu9Nq99pvkUEYfP11CdlEjJG49iMHtKdwh1gvs3qn1RBpiFf/kvdV552kb2h2VzrxD4YiZdCyq1BqyudJUr6DVMKlNc0yLyiqob2Su6UAq/Po7S1/4L2kBypszP5+k7CpfjDkht8c/5lNstfaSYalZhrvUlSANpmDwYedpmqDyWdHM+qbrVZ8gWZ+tdkcpzRH50UAynxggwPynqTDYFN4WxQVLuDzDueRhEmvp8bLa5RKXI9F3Bgj9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvBmONlQp41aBCRV/7mEA1SG2JJhYfyuY1K5GKBYnXw=;
 b=JtBhyOLf4QHYUF+svcgQsazZl+suya35AcsDDxSJ0syLYrHz841ziEurs/CC+fx4CIgbQ9WK0HUdUK7ieOuEs8WLGJQTFVRwr5DqAYGAu9ReeP1hR6VMh8XrHYhwHH0/I4eDOC06bkt+zf8kQTzUkhuUECe3m9x09sgj86HeZt1el4rHw2lT/lejd6V1xfMpxUv5XesCHaS6BQJ/B01QF4WTr5qnP5zPXFKCM9hNPkzH/EDR1AmTLvKUwO7ovrWUgQFUqmjsNjMjJm0EGwBWfqPea4apjKz4BSBCoa7mXRVLMLU8uS1oz/GYAA1/Ed06S0UZlhDR+rhWJJpQ4JTUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4455dab2-d52b-2e1a-388a-ffc3123438a4@suse.com>
Date: Tue, 8 Mar 2022 14:42:11 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <88014841-017c-5621-0193-c4223596a29c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c19dda8-9ffd-47b1-40dd-08da01097400
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2858:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2858933320187B8CB990B36BB3099@HE1PR0402MB2858.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PRY+PaSqY51J5lHTb59rOx1f42mDyN0H5c1GCYBtErt+1e4wAksjKJ810pZ6JLNp6wiKVwkBUGgIvZhYO0M4aTSpd1KkkZC/PDU/iHkfJVMhreVM8lK0/7SZxkJtRJnC5HvcHKd5vYutshEaT3wkH1XQdVhvGJr26k+bXLDAI6n/QAoqWqUpdDCsi7ANuMEyjo+EAF9Z/DGXzgARzO0/L5JxpWFPbB9IXOnh+FgBnIw+iNhICLTWGfOz7PsS0TfCB7QEW++TCOa/rmODbzMYHT0LUNZ48iTN+BsgedpYH1tjb36UaCNitCQqAj/YevBZoM8g3H75Vl8pjijNlzVJ14gGbp57T5+K4zKEYrtQ4Z6YfUyvW/SfPGUb8Cx66FwcLWFobhw/SjT37lLEyFeD8o1DNOlcWBB+IpJviXWHDHcODNS2y1OvDLb35sqMukeg5hQHCSN6JrCfDnE/UCc+BDnkdxvpSU2jzGs+rcefInXhvfGmfY1msZyCMj2NLyBHrwFZXJKyWRiYqEPMIt0FYSXGTupvwZP6st85IXVzH7VzYjXvqzUTNHwYqr5W5IW94nxf+nlEGLzpqAWjoOhoGpuslgqkLui8AQa/4cqc2uXHfr9LtSY4jivLe/28SfLHPvsRuaXOR+JoHSYEbd7UKWjEb/agPnyFHawwI/c4+d2S78G7OkM1xnhZEsbuxb1OrgApfyeyGTZrfk0bZhrWmhqcmADIC2sUqJ4/nF0g13U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(86362001)(31696002)(8936002)(37006003)(54906003)(508600001)(316002)(6636002)(6486002)(7416002)(4326008)(6862004)(5660300002)(66556008)(66946007)(66476007)(8676002)(66574015)(2906002)(83380400001)(6666004)(6512007)(53546011)(6506007)(26005)(186003)(2616005)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HjBIVo9JurdGMRkdOLmRAJP8J9+wb+Ah5zDo16TesF82228jh1mCNBniVMts?=
 =?us-ascii?Q?F8oblnP+YfkIpGJIYwyvVLHSxT2DH+dtdkbE2oyQsCYM9/MBvHSXlYtYLPCq?=
 =?us-ascii?Q?S6jxaDiSxuKC6otm+jJFrNlzfSubGadQwCwa9XuqiVD78sK+RzmaX8cUCfdn?=
 =?us-ascii?Q?uoByn93R1TzsLtXPd90pWIPz3PQ/C+Uxz/1wOzRaV+xiYeFotWyDMgwFd1aH?=
 =?us-ascii?Q?ANSDgawcdSNLOZn7lO2tuHZd4pvia9WuGD5PAaZJBnOXFyLrudWlP2ZPxjeg?=
 =?us-ascii?Q?93mWiHSCUwL0Sdho1PSNjjs/nbXnPKFj1fEnT4PEJcswkaMmaHCQ73fHGF0O?=
 =?us-ascii?Q?d7f4vU4an3cPmnzAQRJukU/gn4ONdKoy8MbkRFWMWwgtZh6qr4GiSDEZe6y+?=
 =?us-ascii?Q?+gH62H4J+Eu0Qc8ZfgYNhTpBEIeSEkbVM7L1Wb4pO37huI9sJ0TcbE2CXWFZ?=
 =?us-ascii?Q?uLxKFuZ0rSS3MdUJqzZxP2rmhcsEk+sZtmhUWasPCy96GedJS6hGIzmRaO0L?=
 =?us-ascii?Q?tA1x8rtg420PYqZcucbM4Ojp9zP/VU7TRgAVxx2lrFniaUCAh4W86hS5V0QL?=
 =?us-ascii?Q?FFdt2d+7AGTuZZdPC035yYnbfug6qsa/KZVZXS3jxjPSvWHwTrbu4Oqg0NAg?=
 =?us-ascii?Q?pE/Yvs9oChD5n1c9P08FZAQezkNb1xekqiyKoe7djRDAoTh4DZVkegRnrsfo?=
 =?us-ascii?Q?4ycarl5VASTp4n4NG7QeTTnVTALwv26tko/Ag5c2MJTapPxy+uig2IJZPfXR?=
 =?us-ascii?Q?zjanHUF2PWx+XGQMKKmUetgWIxrb2MvVALog3+v3+5WC0QITdimqmeoo8R+m?=
 =?us-ascii?Q?u/x+H8kNRbJakSk/Wryr8F66jn4kSHpCft0tTFf/ocxwjomvMxzbaw7tD0UL?=
 =?us-ascii?Q?Lwhwz73Q2BoE1V6+2vFQSFuxjkcBMwnQHJK/GZOJvsv7bQI4WmGmHtZ1RLsY?=
 =?us-ascii?Q?hAmsHewjwxVPT471SkLtX/Ol31cqGlLsoNhZJxlcO3gcKTRpYJsdjDbB06Pz?=
 =?us-ascii?Q?Xil95SgjCmT2/+Hh6LwVe21F+w1d3Y9apPDZbxHI79VDiR4xUMb4Mq0tqdE9?=
 =?us-ascii?Q?7tQreUxHK35fPiAlo8ZRautxk05W/wbb4NmZyyKG09ZlvK2XbRBgX3qftJ0t?=
 =?us-ascii?Q?0ETTxLHf24u1Wx+T905mLd/aeqgrS/9duy5n4pUUSLs7lCyHbXQNC79EkFIT?=
 =?us-ascii?Q?cWuE/ZnutnhmaJVU9+MBbZt09X+MAGhO9s2WOKDAWiQ9MwBKD+tCzMy+wZDc?=
 =?us-ascii?Q?HZ6zFCiky0H6WHqXWShg1iayOMxN0cvRNFQmUOIYu7/+d9nvEEsLxTQxG2Wc?=
 =?us-ascii?Q?4bPNVE1jMGxGDNbDWSpg97v3nEHmi7WfKyNglnuI0PBxAV83hNmy2WAMqtMl?=
 =?us-ascii?Q?oPnV4n5abov7NSKf7UQWIqwS/hXisTCBIh2aquhZcAmqVI5RXYtfHmyYX9yO?=
 =?us-ascii?Q?7HZLU2wEVVZDPfp7egrHDrDoV+UbD/SrlvDmigbZXDVuq5yaof3f/qdoJCdz?=
 =?us-ascii?Q?b7IZJJ7mLz6n8fTcCL+lyUnEqMSciolEuK12+qp9+EzDypk3ha6w+1bn8mGJ?=
 =?us-ascii?Q?kLCXqOUYE3iRGuMOWfBGT4nADIaqHeCHsJ0W5yeQXLZLKcY9lB4oQh/eH0cy?=
 =?us-ascii?Q?OK6K56PzBL/+wgEEHNC/sLA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c19dda8-9ffd-47b1-40dd-08da01097400
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:42:13.9791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yG5Hmh+1/Sl7sp9vGq1rJQUmAi198PRnC34zb8efhThm1yXohGlQpDqUWXwdhJemb+FG4W14NKwm7ollQ4DL4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2858

On 08.03.2022 13:56, Juergen Gross wrote:
> On 08.03.22 13:50, Jan Beulich wrote:
>> On 08.03.2022 09:39, Juergen Gross wrote:
>>> On 08.03.22 09:34, Jan Beulich wrote:
>>>> On 08.12.2021 16:55, Juergen Gross wrote:
>>>>> In order to avoid indirect function calls on the hypercall path as
>>>>> much as possible this series is removing the hypercall function table=
s
>>>>> and is replacing the hypercall handler calls via the function array
>>>>> by automatically generated call macros.
>>>>>
>>>>> Another by-product of generating the call macros is the automatic
>>>>> generating of the hypercall handler prototypes from the same data bas=
e
>>>>> which is used to generate the macros.
>>>>>
>>>>> This has the additional advantage of using type safe calls of the
>>>>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>>>>> the same prototypes.
>>>>>
>>>>> A very brief performance test (parallel build of the Xen hypervisor
>>>>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>>>>> the performance with the patches applied. The test was performed usin=
g
>>>>> a PV and a PVH guest.
>>>>>
>>>>> Changes in V2:
>>>>> - new patches 6, 14, 15
>>>>> - patch 7: support hypercall priorities for faster code
>>>>> - comments addressed
>>>>>
>>>>> Changes in V3:
>>>>> - patches 1 and 4 removed as already applied
>>>>> - comments addressed
>>>>>
>>>>> Juergen Gross (13):
>>>>>     xen: move do_vcpu_op() to arch specific code
>>>>>     xen: harmonize return types of hypercall handlers
>>>>>     xen: don't include asm/hypercall.h from C sources
>>>>>     xen: include compat/platform.h from hypercall.h
>>>>>     xen: generate hypercall interface related code
>>>>>     xen: use generated prototypes for hypercall handlers
>>>>>     x86/pv-shim: don't modify hypercall table
>>>>>     xen/x86: don't use hypercall table for calling compat hypercalls
>>>>>     xen/x86: call hypercall handlers via generated macro
>>>>>     xen/arm: call hypercall handlers via generated macro
>>>>>     xen/x86: add hypercall performance counters for hvm, correct pv
>>>>>     xen: drop calls_to_multicall performance counter
>>>>>     tools/xenperf: update hypercall names
>>>>
>>>> As it's pretty certain now that parts of this which didn't go in yet w=
ill
>>>> need re-basing, I'm going to drop this from my waiting-to-be-acked fol=
der,
>>>> expecting a v4 instead.
>>>
>>> Yes, I was planning to spin that up soon.
>>>
>>> The main remaining question is whether we want to switch the return typ=
e
>>> of all hypercalls (or at least the ones common to all archs) not
>>> requiring to return 64-bit values to "int", as Julien requested.
>>
>> After walking through the earlier discussion (J=C3=BCrgen - thanks for t=
he link)
>> I'm inclined to say that if Arm wants their return values limited to 32 =
bits
>> (with exceptions where needed), so be it. But on x86 I'd rather not see =
us
>> change this aspect. Of course I'd much prefer if architectures didn't
>> diverge in this regard, yet then again Arm has already diverged in avoid=
ing
>> the compat layer (in this case I view the divergence as helpful, though,=
 as
>> it avoids unnecessary headache).
>=20
> How to handle this in common code then? Have a hypercall_ret_t type
> (exact naming TBD) which is defined as long on x86 and int on Arm?
> Or use long in the handlers and check the value on Arm side to be a
> valid 32-bit signed int (this would be cumbersome for the exceptions,
> though)?

I was thinking along the lines of hypercall_ret_t, yes, but the
compiler wouldn't be helping with spotting truncation issues (we can't
reasonably enable the respective warnings, as they would trigger all
over the place). If we were to go that route, we'd rely on an initial
audit and subsequent patch review to spot issues. Therefore,
cumbersome or not, the checking approach may be the more viable one.

Then again Julien may have a better plan in mind; I'd anyway expect
him to supply details on how he thinks such a transition could be done
safely, as he was the one to request limiting to 32 bits.

Jan


