Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC53F1AC4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168822.308274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiHU-0000ZG-LI; Thu, 19 Aug 2021 13:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168822.308274; Thu, 19 Aug 2021 13:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiHU-0000WO-Hn; Thu, 19 Aug 2021 13:40:28 +0000
Received: by outflank-mailman (input) for mailman id 168822;
 Thu, 19 Aug 2021 13:40:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGiHT-0000WG-1b
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:40:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e398f03-cdb6-401f-be61-dbd8430655d4;
 Thu, 19 Aug 2021 13:40:26 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-I41w3FdoN-6CEZMWYEwdEw-1; Thu, 19 Aug 2021 15:40:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 13:40:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 13:40:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0057.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 13:40:22 +0000
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
X-Inumbo-ID: 6e398f03-cdb6-401f-be61-dbd8430655d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629380425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tl7rSc9cgnJ5IRGZ1PjN2xYP1Gf+iv1kyt/0f+Jpuk0=;
	b=XgbEwB3DLv3I5wQ0sYoF7Gw+Uhquw1y0EG85qeeZJfDd7os1nQVf91GklQlICCA+qoIUPq
	+PhaWnz7xwojFZ14O7dQt8OCs5krFg76jAq/ZiGxEa7O/mLUndWWCMpqLon/TE8xNYgrWR
	4C6UK0bx3fzdITH/9GjWI3TRDt27Y1k=
X-MC-Unique: I41w3FdoN-6CEZMWYEwdEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KP4mWqZEERAtr2NuUjz3ykavz8EOstybRoZW9eZpMktQOwRRqQLh70fMwqN9dksYYUFL6fdU4FugA6KQOgcSHGx6443JDRuDXMsSM55Ie+VmNuRq6ytDyKdXgQjcmcKTcUvMMx7QapLOq4B+PPoT8oQ56lYQYrMb3cyoXH/YFvtUV9KPqsKb2KKzoLmMzm8bpB3hA6vR2vIVxbAqD0Jl8eKTAVS2JyHDq53zVASiBkGVOl28Xn9cGo/PYzDBAKumu+KvoUv1RqarTTCzhNXjAfK1uemMtI6kx/NOjrei5rwaOWdGMjJrcNFKi1da9Q0a0/4TgzxuBTFTNFZr4wXbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tl7rSc9cgnJ5IRGZ1PjN2xYP1Gf+iv1kyt/0f+Jpuk0=;
 b=TmqEfKaMDsaIlzFm1yAlAFIoq0EHXuqkFGH0kilR93RDnT+OkghvGR4dRkzKODELU9THzhIB3Rcbl21qpV0wFRjh7qCSKRGUi26vty9cN7z8LQe6VhI/r6OmsLQLiVCrvqDWzkNjE3ZznwX9GNAuSodCRpT3HIcC4bwMlaOFQCqdB+6JtABlhYxYQH7uD61FA+fzs7p+Zrd92pWttjDz9pAxCNOpiagT5m8ceALxVu3z/b70o8G7rVETUhFsi/mNL5V9zuv1YbJx8BBR7N7S4tFy0MxsUUrJ/03Q6KV3Kr7FHKU/UyriofwMncwHhQyXImRgs4sz98gCWZalmDOwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 10/14] xen/arm: Discovering PCI devices and add the PCI
 devices in XEN.
To: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <a7fa6f626b0852c7859fe8d64b01293d1aa8fc0e.1629366665.git.rahul.singh@arm.com>
 <367ea162-9afb-1e30-860a-117abaf38867@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20989624-c3e3-dee6-c6d3-03e978c4a289@suse.com>
Date: Thu, 19 Aug 2021 15:40:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <367ea162-9afb-1e30-860a-117abaf38867@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f716e34-21bc-415a-6e5c-08d96316e48d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24473BAAF403FC6FEBF8EA28B3C09@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m5WmimVeRSDbhnO11cUpQBqRLrvzXAhVLl+K2ZvfJIltBAu2BVSfeL1VN7lAWQZrcPlDQUg4UUr0JptztJeUtmECtTPZ+2sdzEqatb/xL0ZhEmfQU5tFHfHbsP6d+3+Qp/Ga6ysk6QNEt5VeMwnhV9gumNOSlsScjDsijwlcn2BFo90k8qXra/+MUKgK1aIS+dAd45rTjjoTSeb8imLNjMFc1iEQmtzQBEl0szrV+mHeL4oPZ8EeBJtsN2CtLXSruGGkJC17a5yjvms1dO4vnreOmaVrjOn/ue/itHRib8d1PBEp5qswuDmjDA36iZFuouEPYlhLqIpsy7pv3SCsca1YMJagl7mnQay41Uei4V0WYdZ29lIFGHPyp3YZTxUQAvDNQ47ggeLzncWHAqynRTNcITYWUpge5QGyR35TQjgdRJGmwGP5niQKxXpcuXDW+YYyl8XInhLAgErcfzTZU0Bfy+IPWQUVlHoLIhbfxrOfoyy02FJfdbq7ZWA/wUVtrhqHJeKxt2j/FEMBS6CxJt4SrfWZNkv3etG/5VV1MAox/GVOHDOYwdmvFBf6Z3yO4zIW//YQspVkfHm4ovNwOK9RJ19KLohl4NTs0u7mqKoMiejqEc+Tmw/RfgrQ1/937tDkdt9MY9322Y1UE2eH+40WBTtSwD6IahUY72+6zJQ5afh/4smUhgvtEz+FXLuLixdwDkXQBqSxZM5LYv5gapFK3GlfAcc3ngaWWXRLa9M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(396003)(366004)(136003)(2616005)(26005)(6486002)(5660300002)(38100700002)(4326008)(8676002)(316002)(54906003)(53546011)(110136005)(6666004)(478600001)(186003)(956004)(8936002)(66476007)(31696002)(16576012)(2906002)(31686004)(83380400001)(36756003)(86362001)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGV6cjV4TXk3L2dTZnJLaWlGNzBBSXEyMkJyKzIveG9yQ2VaWTUweGQrVmxV?=
 =?utf-8?B?YjR4V0tCMExiMkE0UGgxSmF0SUFLc2I2NkxtMmdQMUdKd0VacTNpYkhuU3NH?=
 =?utf-8?B?bWxjU0x1UWJKcnUwZ1V5T1ZaSDQyRXpQSWVjNW9iMnFidm5jd3JyNURIeDZq?=
 =?utf-8?B?NnR4REZjNEM5RmpRRmQ3WUlhbFZnU0FCN3BaV2tIR2ZKUXl6R2dqTXYyUTEz?=
 =?utf-8?B?S1BHcnNmL3NvZFBLZ0hYRnlBNk9FWnhMUE1IdGtFM0ROUGRZdUUyUGFTU2lq?=
 =?utf-8?B?UGpIZ0hOci8zWm5SZ3h6N040Y0VEZk1rbDlPS3VCWFFWaytidjRDYllFR29t?=
 =?utf-8?B?eXJKRm8zeC9DaTF1MUNobHE5MzBqaXdzZWlvQitxTEFBQVpMZkJNdDFGQmI2?=
 =?utf-8?B?dzdJcmdPTERHMnNaQ0o1KzdyUnA0Z1Z2c0VJMG5mQlNKbGxPTkRYdUVkZFg3?=
 =?utf-8?B?YXd6NEFtUGUvMFhBbXFHWDgzK055OXd1TXpIM01sUk5XK0FZaTRBV0RNcFN0?=
 =?utf-8?B?OEFLZFZ5OEVhSkJ0UjBMcjBqOVRMQ0VYZDcrOTBNS2wzaXl1WG5YeFZPY3Y5?=
 =?utf-8?B?ZXp1R0oxbm1xbEV5cXBseUtoQlBtQ1VNUlpjeVJkc01xQ1FaUlU1RUNPY0E0?=
 =?utf-8?B?OGFYcGh5WEhEbTdYM004dnVVMTdRTStHUzZaaHgxYzhFcEJITHVZNmswbVll?=
 =?utf-8?B?UHJCZU42VytXTStFbjl1SkYvbkpzRFM1U1NYWEthOTlBQnEvYWc0WHQ2V1FY?=
 =?utf-8?B?enZ5czlMNmE2UUU4aHlwZFB2YzFQOU5rTWVPK1VWemR1Y2UwbzdRcnUyT3dU?=
 =?utf-8?B?dEZPNGcyOXhJaU5GQzBzUzlkRE5hclVyQlhqUEpQS1hNV3lCSmlPYlpRbUVL?=
 =?utf-8?B?K0NqVzFqbFlSZ2s0RUo5V3FOTkwwQ1JRL3I2T0pZYWgrKzhZWE5LQ3QxUnFk?=
 =?utf-8?B?VFhIRit2NEoraE4rSENnTzlyNDgxbTFGVTJPVmRnU1IyY3VQK09ZRjNob2Nn?=
 =?utf-8?B?MXl4bmJqTHp0OXI4UUtjRnRFNkp2QzA4WGhVWEJTN3ZjekpMZmlGTGtFSzZr?=
 =?utf-8?B?bG0vUFBYMVZhZ2l2VFNBbS9RUDg2cUFNYVVSL3A0L040YzVNU3VDc3BmMUFw?=
 =?utf-8?B?eXNZSDhNaXB4QXRqNiswQjA1NWJaZjNKQW1qSzVUbmprWjV5M25oSHhlNmwz?=
 =?utf-8?B?MGp1am91R0JXK3BRRHNqQzhySm1yekFxS3YyTjNiZWJqT1FmNVF1cVo5K1Vm?=
 =?utf-8?B?V2p4Vzh2ZEhLakdwS0EvRUJQN3MwSmRxQlVrL01CME9EV0ttOVV6eENmRy9x?=
 =?utf-8?B?cHBtTmQ4YUxRRDV1ck1pbjVtcUxzeW9yMVloY2JYL2crdWpXZ2V0alVGQTNO?=
 =?utf-8?B?VWZKd3Z3WWV2YlpENTNUSG9SbmI1S2ZDSnRSSUVXbGNrbENQVGRTd0k0MFZI?=
 =?utf-8?B?YTNwSnZkbVNKNitWT1ZGVDFVdnViakFySnRTUFBQVGtYNzRVK0xtYndIVmY5?=
 =?utf-8?B?ZGhFQ2x4TU03VFZWZ3h0VWFOU0xRbFI4WEgwNkhCaU5iS25Pc0l2WE9jdHBH?=
 =?utf-8?B?S3dxWEhoRXdmbTJtc2VTdFlZcG5xOTlsVXJrZllNVTFoTlRJY1RoSWV3R3Vn?=
 =?utf-8?B?RmZrbm1CbkpoazdWZlo0Zk85RERUSXZNa0IvbjdVVGxjYWNYMTJaQzZudlFL?=
 =?utf-8?B?T1ZoQW0rWi9QczVjQTRzMWVQbkpUU3dZVzVYd1RKSlp3VmVEckxhTzdNNjVO?=
 =?utf-8?Q?EyAySWsBkf4wEGYdDD+4UtjYh5PB5Yd1AfuiHz0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f716e34-21bc-415a-6e5c-08d96316e48d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 13:40:22.5649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGVjQaDccC31ep5EwLBuRD3u1CbwJHrQI2PXkPkn4wKsBr4kD0BtNjkVBxXoxfY6Qj/RRFEqJOrfxH15kW6iPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 19.08.2021 14:35, Julien Grall wrote:
> On 19/08/2021 13:02, Rahul Singh wrote:
>> Hardware domain is in charge of doing the PCI enumeration and will
>> discover the PCI devices and then will communicate to XEN via hyper
>> call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.
> 
> There are other PHYSDEVOP operations to add PCI devices. I think it is 
> fine to only implement the latest (CC Jan for some opinion and confirm 
> this is the latest). However, this ought to be explained in the commit 
> message.

I don't think "latest" matters much here. Considering there was no
physdevop support at all on Arm, enabling whichever set seems like
a good fit would be okay.

Having written this I realize that by "latest" you may mean whether
the used sub-ops have not been obsoleted by newer ones (rather than
the last ones that were added to the physdevops set). While indeed
PHYSDEVOP_pci_device_add hasn't been superseded so far, I have a
vague recollection of there being some missing part. Without me
remembering details I'm afraid using what is there is the best we
can do for for the moment. However, ...

>> --- a/xen/arch/arm/physdev.c
>> +++ b/xen/arch/arm/physdev.c
>> @@ -9,12 +9,45 @@
>>   #include <xen/errno.h>
>>   #include <xen/sched.h>
>>   #include <asm/hypercall.h>
>> -
>> +#include <xen/guest_access.h>
>> +#include <xsm/xsm.h>
>>   
>>   int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>   {
>> -    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
>> -    return -ENOSYS;
>> +    int ret = 0;
>> +
>> +    switch ( cmd )
>> +    {
>> +#ifdef CONFIG_HAS_PCI
>> +    case PHYSDEVOP_pci_device_add: {
>> +        struct physdev_pci_device_add add;
>> +        struct pci_dev_info pdev_info;
>> +        nodeid_t node = NUMA_NO_NODE;
>> +
>> +        ret = -EFAULT;
>> +        if ( copy_from_guest(&add, arg, 1) != 0 )
>> +            break;
>> +
>> +        pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
>> +        if ( add.flags & XEN_PCI_DEV_VIRTFN )
>> +        {
>> +            pdev_info.is_virtfn = 1;
>> +            pdev_info.physfn.bus = add.physfn.bus;
>> +            pdev_info.physfn.devfn = add.physfn.devfn;
>> +        }
>> +        else
>> +            pdev_info.is_virtfn = 0;
>> +
>> +        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
>> +        break;
>> +    }

... I don't think it should be only "add" which gets supported. "remove"
exists not just for the purpose of hot-unplug, but also for Dom0 to
remove (and then re-add) devices after e.g. bus re-numbering. (There are
some gaps there iirc, but still ...)

> This is pretty much a copy of the x86 version without the NUMA bit. So I 
> think we want to move the implementation in common code.

+1 (if sensibly possible)

Jan


