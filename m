Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFC472A43
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 11:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245955.424262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwigM-00060l-VX; Mon, 13 Dec 2021 10:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245955.424262; Mon, 13 Dec 2021 10:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwigM-0005yE-Rq; Mon, 13 Dec 2021 10:35:46 +0000
Received: by outflank-mailman (input) for mailman id 245955;
 Mon, 13 Dec 2021 10:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwigM-0005y4-1R
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 10:35:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d5e8504-5c00-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 11:35:45 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-2o7A6IykP1avATSWLUn8Zw-1; Mon, 13 Dec 2021 11:35:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 13 Dec
 2021 10:35:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 10:35:40 +0000
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
X-Inumbo-ID: 6d5e8504-5c00-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639391744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAEZKMErl5Xu/naz0thxmf6iF/fwuIb9Z/n/UQ4NtQI=;
	b=M1BFl8ERH0ezz76CFUpzveoGB6yReFdDCQNtKQtXSDrLph/qqsLPJ4OjVpMWxNAA92YqAg
	NL2za6TfI4k4wOp4FXRSTaVpueyleOuNu2mXOjg/zb7tgtr4NdZjdunj16aF0z9tOwn8od
	2Hmq/K/OZtdpMkXkxdiYT+VCJx1s7pc=
X-MC-Unique: 2o7A6IykP1avATSWLUn8Zw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHKERlJBx4aqmXyXCkZ01ZKlq6wQIZJvPWujJ6TD+Hjios0awwOEbElDqpeGw3jgl2LNCW2y3urNq9nUcjOMoA5HQA4MIjVPU+CfZkiVqXxA7gUctMpeWyjWodRZepeM1g8BTI137om3FmYVZinGMvlmJlr/COHT2BN8kXEHNSJ1WBuE/Y2jY1JI17cJS8ugjzMVebopUF9IwOBf/9rYu9PNs3/Wa9vsMRG7fMNJJ0+sno9IPlVd6NSyhDZOgxKv9o19gG2FDs7nhGTv+EGtBJEpyM42K76xZAkf9QnS9WbLk/RxFV2IiaTXU4Op9VyT5E4bqdfxn66GPd3yWH013Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAEZKMErl5Xu/naz0thxmf6iF/fwuIb9Z/n/UQ4NtQI=;
 b=bs+0Mdxe0ozzEIEO8wmnxtkeJ/GghqaArVxXOqdcJ0je+8xhpG4WlXqdcvcBc8mLmvTucFpIrvsYh+0RgLkVDNZY6JHtCNVX2b695OoFbhexyK1dnM3oq4nwxHs0JVtJBIu9X07fDceiKK6GYSTrZmhtm9GOyyo0yc1nkV1MZAO1u1wyVAoLMPF5zJ+KHZklxqxS0puJDtKT/qhbiISPwN1IPNwoz5VXdcmb34wBNyZ2L9lH7ANg59Vu5AUl2ntpdq/m+Sxnx3ECVzySBQ7JndVsx2Vr1dx+mkpQlFggfAToU9ZW4iqlTSV9zmpNl6n6G6nJK2PaB3W/Pv0UoayBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3f1e075-e142-7fc4-e050-89cf3665901c@suse.com>
Date: Mon, 13 Dec 2021 11:35:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <b7010028-5a5a-c6ea-fd14-e0d9aa662487@suse.com>
 <4c98984a-6c06-506a-8ee5-ba671cdc4873@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4c98984a-6c06-506a-8ee5-ba671cdc4873@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0045.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b4b7498-7b84-46c8-0901-08d9be244ebc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51686B7A1A04A35F98148CB6B3749@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c7pwVWlDa/9DARB4gpgALUT7HboaY1iiXb1hvStaf9ax67Bjhso+bMTPfteeAB1L0nEqb1Jkph5MKRBPrQ0oMhs1PchQzdVgQcinKl/VEeo57R0zbd5qfqZY7ZhTC5JcuKEM/+yAkJLcbsjVyokcFFAvXIWpE/6ZTc/N2MqXGxn2coy+isZ7sNRFUyps8pNQPa1TC4nFlE0li8YrWo3TicepI2W7dCuksWS+zdPKjEZVvA6H9KISE1IT3UbLQ0Xh/aGk5TIry8/t+r8EL7e/EQeblV+8Ypv+AZF5yjBQIC/1ZVtehGqrl1ctW0KTXwzddcTDJWgSvyQFm91QY/W7KPxN5KtlZdURDwoTKPU/gXmzs4uOegrwVRnOax7lZDJfxPdI6OT8sVMREVniGrVP6sFDvBjY7dSleCt79W3NLGcpEYwKWhr2emArQ0UV74doBkLGhGmsLgs69SpKUfrD8hbxwq6aVBExQNvmLgHwAoCXoGeRlvMOfRa9wjzWbXY7unmq/MwqMXfhOv76lrfFwv4ddPFY7mDlqzp3QQcuNJjKwL+cFrqeR8clfwvMABF/y5LzEHYdfPDqvBEUzuI7lrM83Fbg/26lwQNu7f3lEGCBS0AFdd34WSdFAvry97AZHgrlHK6peMOXbRerBVeYBYAFb6vfJROfDCG5Ac3XzckHRIeLIg41ZfWS0850k0WG/iiAot1AbZOnO8wwxgWW5Ac3jMpfzj5ymt4A3Mc7i2pxczx/L1zhVSavb3abaarE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(36756003)(66556008)(4326008)(2906002)(186003)(66476007)(86362001)(7416002)(6506007)(53546011)(6666004)(8676002)(316002)(31696002)(6862004)(6512007)(54906003)(37006003)(38100700002)(508600001)(6486002)(31686004)(5660300002)(66946007)(8936002)(26005)(6636002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJrOEtQdkVYc2pkNFNoYStIMlcySHA0cExVa2M1bEtWMEZnS3BCNWJwTXBI?=
 =?utf-8?B?S0RsZENxdE5RUDlWRGk1V2gzYUpQUDdaOHZoT1JQUkRIUFBqQWNTYkZ4OFIv?=
 =?utf-8?B?SlJpdHBlVXQ2ZUdTdStiU1E0OHZzZExBZGwyRlI4bU9FYVdjbmlmT04rVlZm?=
 =?utf-8?B?TUlETTAyMFAvUGJaNDNQN2JrM2FzUHRWU1BtOU1NZHp4VXVOaWdLVEZBM3ZR?=
 =?utf-8?B?OUI3eitjZmJGVVNBbzhkSGVrWnZPcjN2MEZEbFRDUks1TEt4R1FEaVRnczBo?=
 =?utf-8?B?OGI3UHg4L05VOXN1ZkRhaXhwMFVwejlveGp0VkpFZ0ZxTkdaSFVKYjdDZXl2?=
 =?utf-8?B?WVJoWjB5WkswUC9TZCtBa1NUVGVTN2FuTmRpaWszTEpXZ01ScWtIYWNGNGVL?=
 =?utf-8?B?amQ5VFV0ckZDYmcyeVRJUG5JNE93QnZUQzB1Y3J3Rlo5UDgwckROcDE2N2dk?=
 =?utf-8?B?QjlaNE56dFFtTG04SGZkUXJxNXExU0c4TjA4Y2tQYnBtbUdteHlndDl1RjEw?=
 =?utf-8?B?dHFQUGRsOWRscUdTaGdMaVNDbHRlRzMzbWJEOVhIbEFlc20wbUd1RnhITXlp?=
 =?utf-8?B?RVcvRU1KWVA1OHJodHpkVXJjc0IvL2IyYjc1Qm13ZHZzUVl2ZEttNVhWbnMz?=
 =?utf-8?B?UVYrMFpFZ21sZ05hOS8rNm9XZW5KZDBxZWk1UUMvdzVjakhnMnpBUkNDbmlO?=
 =?utf-8?B?d3dFWkVIMGl1bzVCcFZiZWFHS3Z2QmhUeGtxK0VvMFpIb1ZobFJ3TUJPTkI5?=
 =?utf-8?B?R0kxUnJQUEUzWWx0aTl5MlF4VCt4RUlhYi9SODNXME54dDVpelQva2h5cmRj?=
 =?utf-8?B?WE42VE9vaC9vZTVMdi9YTUJ2NnZ6VXpHZ2xSTXdVZk1NQXRtWjZEWkMwS1lx?=
 =?utf-8?B?SWtDb2tVaXV1b0w3LzZvU01DQ005TGVUSlJlSlJHOUNuZmxWdEs2SVNZMkxJ?=
 =?utf-8?B?R0VEN1Q4VDk0aGgwRndNSUY5eVUwVkJiSHhqTUJYYmpYUm41VGZTZ0kwakdG?=
 =?utf-8?B?QmdGd1FnMlN2ZHVvT0tGeTFXNHFiRXBsRVpiSE5RVm5JVVR6NWlyQXNxN3Ju?=
 =?utf-8?B?RDNPb3Q2eEIyYjFObFBOQjVHeitnWHNDUVl2WE05dFBoUmR1d1BCQXJrcmJi?=
 =?utf-8?B?ejV6dG9COFAvcit1dmJpMWhJTXpXcFB4KytBQ1ppTVRLS3Z0bzlxNmE2VzZw?=
 =?utf-8?B?Y0R0QlpUb3ZudEUvdlRaZHQ4L2FwWkZWaTZrV2x4cHVQVG1uZTRFSHVOcGp5?=
 =?utf-8?B?SUhSWW9iKzZUaDVJdE1uYm9qWGhxWFVROHlrTjVqallpM3dFdjBJa0RXYmF1?=
 =?utf-8?B?ZDVsZ1JGK1hUbzg4WXUzUG5WRU9McHNDbE1NZ05JdHN0QndrRTc5SmFHWm9y?=
 =?utf-8?B?QzI2cXpvbEJ4RFZ2ci81SGJwUzQ4U1J6UklId2NTazJkVXgxWUJwNTZ6TG1O?=
 =?utf-8?B?eklGc2VrQk55VmRFTUdidGp4dEdlVDc2anJsUDM2Z3kwalZaK0RrbURnam1H?=
 =?utf-8?B?Sm5qMm9iREM1MlU3SEZhZ3ExMWx1eHVHQXJZbkpOcFRBQjlpazI0NUNIaC81?=
 =?utf-8?B?aGNHMEFiSjZGTGp2eUkrN1gxN3EyYlVvek1XVnJ0cTRLcnp6VE0zZnR6TDVE?=
 =?utf-8?B?eGRrVmVDUjFOVmt0aDFCdm9zVDNUSmhsL1hEeVVseXR6RHRCa1I4SUFHN0Mw?=
 =?utf-8?B?bzN0VmRWamhhUkRWTDd2T2haVHQ3UEdLS29oYVhLSnhWY3hwckFabS9WOG1M?=
 =?utf-8?B?bkV0TXdQK2JwMHlXMG5wbjVxam5GeVBFbDl0cHQ0cjJ0L1ZncklENlY0YUph?=
 =?utf-8?B?MUhsRW5sV0hackY0YmxwUG1IeFhCQWRHY2JEVHNEOFljWC9seTN6S0dpNDJQ?=
 =?utf-8?B?cDR2RVBtNzEvT0RZVE5VbWlkYlNKTHl5QkFVQWMxdEt4SXozZkV5Vzk0S3BO?=
 =?utf-8?B?ay9Db0ZRMjB6V1RTQ0lMRDRiOFN6UC8wNzVwWXNBSWFJZ1NqRnlOUDVkL0tn?=
 =?utf-8?B?ZXpZdzJiRDh4WWN0RmhtYUlOdis2T2trTExUNVNFaFNBbUlSZ2ZyUUY0MkZT?=
 =?utf-8?B?cldJZUpOUkROcGVjMEM3dkdTTnpkMlBrL2hKTlVKek8yUFl0UXk5YmFsRDNa?=
 =?utf-8?B?V2QyVHNyOU9SRWlEb2hvZk85a2hla0htRVNGUlR2VllKcnFXdStwR0wwWWZr?=
 =?utf-8?Q?2g9U1nfXU9yvKDQ2D22LS+s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4b7498-7b84-46c8-0901-08d9be244ebc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 10:35:40.2349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6wx0L1hP1ZiwQN9x/7OJlFsWS5tbFi/pi9zDrbsHZJkJlww0I2gcst+ehi1wzMxmY1k/S5rI+zuaZ/d7m0Z3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 09.12.2021 10:10, Juergen Gross wrote:
> On 09.12.21 10:05, Jan Beulich wrote:
>> On 08.12.2021 16:55, Juergen Gross wrote:
>>> In order to avoid indirect function calls on the hypercall path as
>>> much as possible this series is removing the hypercall function tables
>>> and is replacing the hypercall handler calls via the function array
>>> by automatically generated call macros.
>>>
>>> Another by-product of generating the call macros is the automatic
>>> generating of the hypercall handler prototypes from the same data base
>>> which is used to generate the macros.
>>>
>>> This has the additional advantage of using type safe calls of the
>>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>>> the same prototypes.
>>>
>>> A very brief performance test (parallel build of the Xen hypervisor
>>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>>> the performance with the patches applied. The test was performed using
>>> a PV and a PVH guest.
>>>
>>> Changes in V2:
>>> - new patches 6, 14, 15
>>> - patch 7: support hypercall priorities for faster code
>>> - comments addressed
>>>
>>> Changes in V3:
>>> - patches 1 and 4 removed as already applied
>>> - comments addressed
>>>
>>> Juergen Gross (13):
>>>    xen: move do_vcpu_op() to arch specific code
>>>    xen: harmonize return types of hypercall handlers
>>>    xen: don't include asm/hypercall.h from C sources
>>>    xen: include compat/platform.h from hypercall.h
>>>    xen: generate hypercall interface related code
>>>    xen: use generated prototypes for hypercall handlers
>>>    x86/pv-shim: don't modify hypercall table
>>>    xen/x86: don't use hypercall table for calling compat hypercalls
>>>    xen/x86: call hypercall handlers via generated macro
>>>    xen/arm: call hypercall handlers via generated macro
>>>    xen/x86: add hypercall performance counters for hvm, correct pv
>>>    xen: drop calls_to_multicall performance counter
>>>    tools/xenperf: update hypercall names
>>
>> It's not easy to tell which, if any, of the later patches are fully
>> independent of earlier ones and could go in ahead of those awaiting
>> further acks. Do you have any suggestion there, or should we wait
>> until things can be applied in order?
> 
> I think all but the last patch should be applied in order. The last one
> obviously can be applied at any time.

Hmm, I think 11 and 12 are fine to go ahead as well; I actually need them
for some immediate purpose and hence I did pull them (but nothing else)
into my local tree, without observing issues.

Jan


