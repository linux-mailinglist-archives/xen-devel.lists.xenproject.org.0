Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C04419061
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196474.349331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUleZ-0002JV-5p; Mon, 27 Sep 2021 08:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196474.349331; Mon, 27 Sep 2021 08:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUleZ-0002Gy-2Z; Mon, 27 Sep 2021 08:06:23 +0000
Received: by outflank-mailman (input) for mailman id 196474;
 Mon, 27 Sep 2021 08:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUleX-0002Gs-8q
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:06:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70289721-5838-4ff3-a296-7fec41166e18;
 Mon, 27 Sep 2021 08:06:20 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-o45J6dk8MKGyyamDK7_FmA-1; Mon, 27 Sep 2021 10:06:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 08:06:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:06:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0063.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 08:06:15 +0000
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
X-Inumbo-ID: 70289721-5838-4ff3-a296-7fec41166e18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632729979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBc77q+KcNW4aZDXnGFVHZi2SMQ/1hAVmd8/In7Ex0A=;
	b=jjSDemvKORP7DfZyEvXp6rZMJEMLvDUqtB7cc5hw90l2mSQlY8aBMSThCIToDpqLeZwr6j
	23j5b5ZyeQ5X07ZnVmJavX4euZ53Z8ZnmEIo86V0EWuGKuCH5dFXsdQdb/8grXeSbLsc2N
	c+NSS/4q08kW3JxS6A0ISb7pDdgiD+E=
X-MC-Unique: o45J6dk8MKGyyamDK7_FmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md3g5j5F0EBEFss1X1iYUtpGyeOaXlHLAaewwWMI1+j+aXEGzJ8OedfFb0gIJXQLfdvw7sqhbEpSLfWfv2+D1w4CbDBaO6LeWR99Zuot0ZR9W2pU64+kuMkCWaX833aoWVsl67A08dVJSsxZIVb+53yzMwR5ecncLU+EPC/C4/k8NLmtmX+ffpS08C02UyG2QeU5Qx4a7s+v6MklbWx9X5JM6i7+FW/oclEhN1iz8vWcNTWjkONFDj3Pdl+Yu+2ag5Bpri4SUQ+oUyGsgPtVZKCbROUrftd4T7iEYgSZT5pfw54mTeYR9JxwTQwMV/F4Sk//LCy6FSK7iCwci/5MbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZBc77q+KcNW4aZDXnGFVHZi2SMQ/1hAVmd8/In7Ex0A=;
 b=OsEkZrXW0CXb+o7yCQ4qnBZ5XUcoiYNaZFWobwL6/Zayg6Cb65AWn8MmlobNLkGF2z+9WQsANvuyfC73AXsM0RlT5/lLU1PFYoxoj2UAsVS6wsZZhW91G1DE5tvBa/+/haVHEX+jtmgFBRp1EqUVIniXQQs0BPnA48gDy4Qt+aTUETmF8oDAHHXKDKLOMUU9ZIBE4MQbAk7DSYmCyLX+DtVNjDbdvoSETKiXHmg/X6pir3Izbc7bEc5bkuHOkq281DA0EDHnuOYfMKjUiR7cyGAIWyzQ5oy6LCcDmVCMBE2JIxOIGOh2gCXlF/DGWD8QD1OjPMbkbDZxmBZP0JynNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 11/11] xen/arm: Process pending vPCI map/unmap
 operations
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-12-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7bb451e0-9a99-e2b4-a2be-0377de38c0be@suse.com>
Date: Mon, 27 Sep 2021 10:06:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923125438.234162-12-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c88b998-affb-4b1f-8ac6-08d9818dae1d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB559816112BC034CF8FA7AC64B3A79@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OdXJr7FICZTqVWLcYLqqmSIt6skfyFNiX01tUgewXDfEqT2zVm+VHQ6r9ytNXROkmovv9nLBeDg86M7cOh3xsSZqEiZe+aNbGhjy0ogkXfO1HP/eqhTObS/q94eF3IlmlmAcy+1xz+VXsIKSlApDIRBDtd5D4+gR24KB+ZriNsiNhoi67QwYbuKMstqDW6OAAAaxEvCvleuBWlyUmAyvaPR9K4DpWEWMEQiqRp0N17LQgGZHh6OCieiQXXOUNWqj+ntV5ozjInI1ZakTwfYNZDyPAMhl1BhZsH2JI8d8nr173x4RfopD2AwEQDsGnIPD6Qoxw0lN+nCTjFAKstvxgh8epV668iENFIwvWTz3Fwgxevj6lS+NxNpwFR2WKyXwaEHdiPyiUTs0Yam9iMtYheyJMkO5bWCLd+28iBBO6yLj4vR+lsQcteOLlu+b4x3JJHbeYUopRW88bHYfkFJPUq1d4kWQsJ4qfdFQ4X6pxZmRPCXjstzmwDSR6oYAXT4ypx3ZDL2XqRxrYPpS4B1t7zKny6iFcp43L5WXtnNlPf6WEFJRbhNvdNyjwNHPhMbbMmvNLhn2Go5Kli7+7lIUDs6SokxVPo/CQOaBkVEKRetMw/PRgvGJhKVfeRndRl5ZK8OzeoC9GaZcWHFePIF8NwnXj4NnJl/MJI+EoS7/+oemUyU+ZAKxXxEF2DPZ2lGmzaAH3DlhOKFmfqgFNgiymuLSRnRKG9ClC0/+ZXD7q+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(53546011)(83380400001)(5660300002)(6486002)(6916009)(4326008)(2616005)(26005)(956004)(2906002)(38100700002)(16576012)(316002)(7416002)(31686004)(8936002)(36756003)(86362001)(66946007)(66476007)(66556008)(508600001)(31696002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mzg4VDhzY3h3b0FKQWt5VXQ2bWQxSGZUWnh1TSthNjdoRDFLRldWcExqTVN4?=
 =?utf-8?B?dDdqTXlWNkhqRm01UktaQ051SXB6VDBhandTOUNrOUJLekhRTCtIb29xK1lw?=
 =?utf-8?B?Sk9iMjV3cGM4a2VpdmYvQ1dmeDRHRDZJQXZpUks0VXhkK0YrQXE0VWw3dktT?=
 =?utf-8?B?a3dLcXRSOVd4QmwvUjNMVnJRdityKy9zUHVQN2J3ZkVpSGRuRXl4WWMyMEJ4?=
 =?utf-8?B?U3ZZVGdEaGs0V3pTOHVMeG1Ua093ODBpVmtHRS9VbzcxbzF0YSswRktzdlEv?=
 =?utf-8?B?SGdWVXJzTFdVdnFvaytGL3hZYjJ6QnBZb1hjSUdtWGdqNlZmWWVyQkFKM3Zn?=
 =?utf-8?B?VlFzU3BnMCtDbGpKQXg5SnF3ZXZCcndlb0xaS1ZPRGQvcjYwV1plL0VFdkNX?=
 =?utf-8?B?MG0yNWtQcHpnNW43cWhUVGFCUmlHS2pMNkU1VGRyUUJZUTJNQTFacHJNc2dC?=
 =?utf-8?B?d2RpSTZMMjNOQkJjdlo3M21BWkMreUdRWjNnajlIY1plUFBiVVlQaG9zZ3BQ?=
 =?utf-8?B?RVdkalhUVnhxNmd1N0F2bElPMlFvZW1NcHQrTk1zeGg4VjRoNkE5angwRWxa?=
 =?utf-8?B?Z21UUnhhSzdXbHBVQlU4MjgvOTd6dkdKT2dGRjQ0UW8ybkNzTGJGQ0RwVWtS?=
 =?utf-8?B?Qi8xZUdBWitycUdsYjlrc0xuK2tpTWdjVXJ6bUdvZVREcm5lNTA1TkZLM1ps?=
 =?utf-8?B?SkdYbWtVbUNHVGNmVTJHbVAzaHIrL0toaDBqdENBTElmWEliaHZkVnM3Rzhz?=
 =?utf-8?B?Tm9rUDNzK2xwRUEzL2VCMDUrdUJRVFFUZzNRSWRUOFd3VGM4UnBPNWVmeVU3?=
 =?utf-8?B?cWtUc2JqN0tvT3FyWGQ5dDVKUENEYTFNaGR5aHlCU2tWaVFkRUV3QVFneTJR?=
 =?utf-8?B?UEplelhxOHdOUTVEd056MDMvZHlyczgwMEdHY2dBWFpWQlN3Z05jODBGZ3p2?=
 =?utf-8?B?ODI0dEtsajRYb0hxRlg1TDQxNDFhWmVNZXVhdHVqWlJwM3lXbHkvRDdkTzFx?=
 =?utf-8?B?UGFTRGF6UlJaU1JlbzUvOGhUQ0l4ZldlMzlyeEExVWFIQitxcWlrYlBjNDM1?=
 =?utf-8?B?b2pDTk9RUGlLZ29zUVRiajl4cWlNSWVmSUpTbU1hVXJoMDQ2WUlwZ1NsQ09P?=
 =?utf-8?B?VVEwRWg1QXVRdXVoQmQ5V3FuLzh2b2FZZWhGTFE4ZFgwcDNGVjcybkd0dDFk?=
 =?utf-8?B?ck1aNm1rdVBOOGcyUlNVVnJ2bm5hNXE4Q29zZ0N5SXFpcXo0QkpsTDBxZkpm?=
 =?utf-8?B?S1hRQnFBNWxub3FRY0VrL2g1Mlp5YnNZK3VwVGpXZG5SVC90OHNrb1lzMmVF?=
 =?utf-8?B?VTR3ZmRsSTJhQ1BOK2M1MGVFSVFUREpSaXlRT0lmYjBvSk44SGI1ck9mZ2kw?=
 =?utf-8?B?NFNucUN5S2ZqdmpzU3hIVENmbU1SR1RWZnlsMzFqMHk3ZzVodXBmTUFhMEJP?=
 =?utf-8?B?ZG84RTh1eEQ0Mm1zRk4xWkErczRFaFlic0txRlR0ZWNKMlFyUjdaTmdrdktl?=
 =?utf-8?B?RlhBMjREMXVxU0xjVXBkcEJzeDBZamtGOW9qM0ZFRjUvOFcrdGpLSzU3YSs4?=
 =?utf-8?B?VFg5NHBEWTR5Q1IySmllbGlCM255SnNwL3gyTHdhbDdIY2VGcnd3b0duS0Fw?=
 =?utf-8?B?ZmFEOFhlK2RiSEt3MjF6NEJCeTV3cm03Tk9DRFF6djdOQ2crTFNBbDEzNks1?=
 =?utf-8?B?R1JvYk5FditOL3hjVktvNzZHTFR0UmNpRWxrY1FuNTI3RG1PaU9jN0o1TVFw?=
 =?utf-8?Q?ovgOMC5uYkZm/8ZAUOZ6EVdOjyZRX+2dvquccdo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c88b998-affb-4b1f-8ac6-08d9818dae1d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 08:06:16.3248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zPR84w/ucCLMA2yJ6LfbTFqeCMbp12Ixs41jSESDrIhQGFlbRhHBBEwFZKd8cfUCm/gqwi5PYOKdXfousykPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

+ Paul (retaining full context for this reason)

On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> vPCI may map and unmap PCI device memory (BARs) being passed through which
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
> Run the corresponding vPCI code while switching a vCPU.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v1:
>  - Moved the check for pending vpci work from the common IOREQ code
>    to hvm_do_resume on x86

While perhaps obvious for Arm folks, I'd like to see the reason for this
spelled out in the description.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -549,6 +549,12 @@ void hvm_do_resume(struct vcpu *v)
>      if ( !vcpu_ioreq_handle_completion(v) )
>          return;
>  
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
> +    {
> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +        return;
> +    }

Note that you're altering behavior here: Originally this was done ...

> @@ -212,19 +210,12 @@ static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
>  
>  bool vcpu_ioreq_handle_completion(struct vcpu *v)
>  {
> -    struct domain *d = v->domain;
>      struct vcpu_io *vio = &v->io;
>      struct ioreq_server *s;
>      struct ioreq_vcpu *sv;
>      enum vio_completion completion;
>      bool res = true;
>  
> -    if ( has_vpci(d) && vpci_process_pending(v) )
> -    {
> -        raise_softirq(SCHEDULE_SOFTIRQ);
> -        return false;
> -    }

... first thing. And I think it wants (perhaps even needs) to remain
that way; otherwise you'll need to explain why not, and why the change
is correct / safe.

Jan


