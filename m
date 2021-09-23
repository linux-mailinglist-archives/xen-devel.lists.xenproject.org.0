Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E12415CAE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:18:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193749.345140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMjv-0001ke-Bs; Thu, 23 Sep 2021 11:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193749.345140; Thu, 23 Sep 2021 11:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMjv-0001hF-81; Thu, 23 Sep 2021 11:18:07 +0000
Received: by outflank-mailman (input) for mailman id 193749;
 Thu, 23 Sep 2021 11:18:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTMjt-0001h9-SI
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:18:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb968836-1c5f-11ec-ba2a-12813bfff9fa;
 Thu, 23 Sep 2021 11:18:04 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-H_AUkDNRNbyR7QDuPPWtSQ-1;
 Thu, 23 Sep 2021 13:18:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 11:18:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 11:18:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0232.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Thu, 23 Sep 2021 11:18:00 +0000
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
X-Inumbo-ID: eb968836-1c5f-11ec-ba2a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632395884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J81t8+yaR4LN6D9aRF2BIKOcrCWettxIPfYEDkKGzCQ=;
	b=OZHFiOoQJqQqVkwG7mXgQtfpFAfaEY6wxtBSWS224ZJFbnyVYE97OmYbP+78Sq/HFG/mC+
	usxzw7QhkkNmkjfmwVsqNTZ9tBH+SSEI8+XoJdRkhcau5oZ1nh57+mzenFAVwwwykfuD2j
	vq0jroiukCyKXutq+rwqkYd+435/Pvs=
X-MC-Unique: H_AUkDNRNbyR7QDuPPWtSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNgY4my2hahXCig+MMTk5riAbbxuXPnJGe/ebnQoVwl4QkgPjA3H5V/TX8O4QwhFH5akqezB3p0cL7B+4CqN95JHB2fW12YNnqYLNqT/hUiy6NzIIQuSGY0gFNwRKjCxyekzESmtRJsktphqZrtJCJSLR+vRa00DXJLRB2MloXP+gOY+oyoLT9Vjj8J7hxPMNurREuD+KnhEjcRt6I/9Pd8CSeHZEA1I/kAcPcrE1KiAP0HsANN6vR4IrREw/7jhYPKl/qValQ6sRtvV7hDcqFp/xZPu5J63qyRGpo4r+nbwmQWmiHlVdQqZKDiD+SdicZQNCM3FRYqiUpRh1kNolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=J81t8+yaR4LN6D9aRF2BIKOcrCWettxIPfYEDkKGzCQ=;
 b=aV+fdTy60kq1ziVszaj3rcrxDLnXGUw/Rn9l3oRS0jdQbYloeKC70Idc0Je3ii5L0DsQCDTDCSx8MUSE2QrUfzBur5f9Nl4LeAPTbAOR8LIcaG1+tnHXNZ2d3FfdxJD5vjKEcurvhgKij5tmXczkd3lKKS7K9SQg/JZpUWSp6bKNs8KQvsJzgdJtM78gS9C3BWRPQAs+td3QLwSxPco/932r1rqAo6/HdqduJ5Mx/DZPYkOQ34Orgcau5QS+YypDXhliy2f8olvhInnQeyrJnptyzDL2unJSfN1frzpXlJYrdYyQIf1HnXtQQRWHG7sVSIFt2g+NO9ziMw3cXoJtaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 1/2] xen-pciback: prepare for the split for stub and PV
To: Juergen Gross <jgross@suse.com>
Cc: boris.ostrovsky@oracle.com, julien@xen.org, sstabellini@kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <20210923095345.185489-1-andr2000@gmail.com>
 <d12b0bcd-e998-d4c5-e673-9c13a864eea4@suse.com>
 <478b9175-f21f-b77a-2bc1-ad230bbdf548@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87bb76ba-c8b4-5ab0-a8c3-13e8ab4af3b9@suse.com>
Date: Thu, 23 Sep 2021 13:17:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <478b9175-f21f-b77a-2bc1-ad230bbdf548@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0232.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38f43355-5a85-49c2-620d-08d97e83cdbc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57412606ADB588077C14D425B3A39@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Beeqt/OZ1hyEHduJZDfMjyppdL7+nsSaSSRmO4TE8zqt2lhBKIC6NkkQrX7/mKVKmIoPWItawQ7WKLmmzGY66/5KgMyFHOmkkY6lxrp6X8y+AA4RQ+9gCKb3Rtufi9B88xqOn8b6TKky+IvoLZdcCKF5omxQlOK9ug6ygpul4nAmEPSU7mL/zKzdnYGhul6oo1POB0IAANocScsDgwUzVyH0ls+HL5PPIZba3yGgnrZWUsUOqZXVMXtf48b/0SHDo0VN8fUKzPN/zC7fvEV72u+VJ1zyguIFOduiknYVw+D+4hh3JguAK93Y+YGJZHqcAA8mOMoe8fbyjbqcQM28O0FtvJ07y6ZpcYn+wJHu69/tUngdDQ6z/WxVS5qAeCS0Evn9JjzkqdxnAJFl+AjTchdZ9R1pNnkhh6pNIHehNWHqsz5GsMqArDM3uE77G83P0kaIxO/+2EfpjzDY94JNVPESGZXstsVUYavmSbLaYZzVkrH8qR7O3ET4gbgBxSzIH0u0wSUfQbZt8ZcaOJjXU2uJjM2EjMCUhZcV2Z2t1wMz3UfWLPoiIE1Rys9Zfb2TbvjEvscndutaRDGP5Yks3TFelBp9Ja3IBTARY/Vk8XWrC4745yna+571JqE7KaFT9FgzjJZhW08Sc42A1JArkUlCIEHVk2KhPyAzbX98ZlsnYM18+h3LwiJtbxG5d5nyC89uRkrWeUBnM2+MuhIHOwrdCYPd2/VdNq+PEMSHs5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6862004)(186003)(36756003)(4326008)(26005)(6486002)(8676002)(2906002)(38100700002)(31696002)(83380400001)(6636002)(31686004)(53546011)(86362001)(508600001)(956004)(5660300002)(66946007)(2616005)(16576012)(37006003)(8936002)(316002)(66556008)(66476007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUVjdUg5MjdxUXFWQmRSWWVFR0xtRCt4cGFHRDJGZ2pHQUdta1Iyb3V1SXdE?=
 =?utf-8?B?WjZnenZ0YWNZMGFydTRHTmFLaWhjd1BpL053akttRitFZlh2VUoySmRJN2pH?=
 =?utf-8?B?Tk44RUxnOXJXODEycHVPdlpDRzVrR0MvcWVkZVh1T0h3SHBaMFVhZDJxYmZm?=
 =?utf-8?B?YlcydGFoOGZqN01YSndHUDBubEpBa0hmQmY5Nk9rbGZZd3h0Rm9kbVNkdjVh?=
 =?utf-8?B?N2RON0lMeVR1OGpXQTZFdW5KdFBJK2xrZWEwQXdMdkY5cmlVSkdUVW5YM0d2?=
 =?utf-8?B?bjJMU0dtOFpnNEErcXZSUW5pOFBQT1BDTWpzdGJuckFDTUVNTW9VcUpOelVU?=
 =?utf-8?B?YjlVWTBLcnRRR1QxVEh6c1V6TXJFK3hkbXEzYUNtV1lqbGFMaXpEUGMwOXVq?=
 =?utf-8?B?S0pjbDNQMFp1YmR0dTJXbXV5YjRsT25TOW9Xdy9xS1orMnQxUnNGWnpXbDl3?=
 =?utf-8?B?RC9Lb2huUDE0Y1JNVlplNk03NHdvK1ZlcWxZVCtRNlVsK2N6ZDN0NzdoN3U4?=
 =?utf-8?B?cW9BOUN2VHBZdmpQZ01BaVVxcFVQWjJ2aFpHMndqajZxeFlLcEtxanFPNGhC?=
 =?utf-8?B?ejRyclB6MUxDbUdkNVYzSHVRbTVkYjhvZlRlL1dpb1RoQnUrNlBzVUpxWmph?=
 =?utf-8?B?bHZWTjMvRkZxdDJreG4xQ2hvTzg2eXozWk1WWUplKzRPNjlKOUo4bG84ZHht?=
 =?utf-8?B?STJmbXFUWnZpMEtWZzN2MzQvdVdNSS9YVlVLYWxZU2JQNStyWEtRWVcrY2xs?=
 =?utf-8?B?SC80RFh2OXpRcTR4Mk9zSGRoa2NpMDVKTWZ0ZjNjWTh3a2RBdWtIeHFKOEIv?=
 =?utf-8?B?NlZ4cDJyRnp5aWZianRFb0R4a2FuOGRkOVZwSzRQUCs4d3AxOE1xZkJCdFFo?=
 =?utf-8?B?NENCTDAvci9ZT3lWZVFFbmFueXdFd2I1NG03citmRTlMdk5pN2l1MjJvZG1w?=
 =?utf-8?B?YTFPZUZ0RVlHRkpJMFg4d1BHNHpwMSsxSFJublZleThKTVl0OFY1cXlQU3pp?=
 =?utf-8?B?Z2VWWXBGdFI1ai90M1RaVTlMaE54WEF2NUJ1V0VFcnVXWVg1VkZORGt1aVNO?=
 =?utf-8?B?N3UrQWowSXIrRldLQUdnZGI4TnFTK3RaVVl2MXVITlhMb0RVQldhTzgrcXRa?=
 =?utf-8?B?WnBuT3pLMDd0WW03VmV3YTUyZm00RmFLNG1aeGNkSGxxcHlFcEVKUnNheWh1?=
 =?utf-8?B?U1YzczJ4N1NCUmFvY0tKRW5zUUEyaXlubG1QOWNkL05KdnVFSDBVcU4wV3Nt?=
 =?utf-8?B?NVN1UFR2bjU2MnQ0d3ZVOXdNVHZXVDQvaFdZc1pyckt5azFkN3pmMExPREdP?=
 =?utf-8?B?ZkVaR2tGTElWTlJmaDEwbVN1ak9WemV5Nm9GTy9jTlBrb1RXV01IcWw1M0lY?=
 =?utf-8?B?ZjB2SlppSEtyamY3Q2p2RUtKREpKRjRMbjBsbCt2RzczTkdCcmlEUHJ4T0Jq?=
 =?utf-8?B?MXpCcm5jblpzVUlWR0N1a3pYMnIvWHNLMkNJWDd6djY0NEp2UDBGc3lvTTR1?=
 =?utf-8?B?Mm5UUkgxZFJwNGRYaWNKZ0RQUDVmRnlZdElsNVp0Tm56bzE2WjBOVmVjbzVT?=
 =?utf-8?B?a3lZc2pCOENkZ1QySm96UjRSNERabTlITGUyZGd4czJOZEtNN2N5b0VlaDcv?=
 =?utf-8?B?c3N2OW82WWNoc00wbEZmdnFXQlN6V1JTRDgxNEg0K3Q4d0RELzdvYlExeTM1?=
 =?utf-8?B?L08vMlFBZThuV05QWDdySzlFamR3QW5RZUFMcUd3a0xJaDBxZC9LaVBXYUFC?=
 =?utf-8?Q?eLMFKvNIrC9u7gZCLSdcecTpWrkCm4xpNXYIn2c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f43355-5a85-49c2-620d-08d97e83cdbc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:18:00.7826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHFVMvqamEqSEnqY3qQEGHs4J4ja+9HYem0/+C0cBrLIA0BZeVLQJn2gIM3OJ0ZczIOz1B34jlQG5bOcwUdS9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 23.09.2021 13:12, Juergen Gross wrote:
> On 23.09.21 13:10, Jan Beulich wrote:
>> On 23.09.2021 11:53, Oleksandr Andrushchenko wrote:
>>> --- a/drivers/xen/Kconfig
>>> +++ b/drivers/xen/Kconfig
>>> @@ -180,10 +180,34 @@ config SWIOTLB_XEN
>>>   	select DMA_OPS
>>>   	select SWIOTLB
>>>   
>>> +config XEN_PCI_STUB
>>> +	bool
>>> +
>>> +config XEN_PCIDEV_STUB
>>> +	tristate "Xen PCI-device stub driver"
>>> +	depends on PCI && !X86 && XEN
>>> +	depends on XEN_BACKEND
>>> +	select XEN_PCI_STUB
>>> +	default m
>>> +	help
>>> +	  The PCI device stub driver provides limited version of the PCI
>>> +	  device backend driver without para-virtualized support for guests.
>>> +	  If you select this to be a module, you will need to make sure no
>>> +	  other driver has bound to the device(s) you want to make visible to
>>> +	  other guests.
>>> +
>>> +	  The "hide" parameter (only applicable if backend driver is compiled
>>> +	  into the kernel) allows you to bind the PCI devices to this module
>>> +	  from the default device drivers. The argument is the list of PCI BDFs:
>>> +	  xen-pciback.hide=(03:00.0)(04:00.0)
>>> +
>>> +	  If in doubt, say m.
>>> +
>>>   config XEN_PCIDEV_BACKEND
>>>   	tristate "Xen PCI-device backend driver"
>>>   	depends on PCI && X86 && XEN
>>>   	depends on XEN_BACKEND
>>> +	select XEN_PCI_STUB
>>
>> Does kconfig not at least warn about this? The selected item has a
>> "depends on !X88" conflicting with the "depends on X86" here.
> 
> XEN_PCI_STUB != XEN_PCIDEV_STUB

Oh, sorry.

Jan


