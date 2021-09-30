Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CD341D5FD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 11:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199635.353818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVs1H-00047f-Te; Thu, 30 Sep 2021 09:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199635.353818; Thu, 30 Sep 2021 09:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVs1H-00045s-QT; Thu, 30 Sep 2021 09:06:23 +0000
Received: by outflank-mailman (input) for mailman id 199635;
 Thu, 30 Sep 2021 09:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVs1G-00045m-1Q
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 09:06:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f7e1691-c7ee-4932-bd59-a57bb9a194ed;
 Thu, 30 Sep 2021 09:06:20 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-0ydWM4VCPg2trlJHBS_pEA-1; Thu, 30 Sep 2021 11:06:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 30 Sep
 2021 09:06:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 09:06:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 09:06:15 +0000
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
X-Inumbo-ID: 5f7e1691-c7ee-4932-bd59-a57bb9a194ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632992779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYGcCumBlh/iqHb8Hi/PrcnD7eDeCZFRwKWtGjgsJFU=;
	b=RgXj0qQV78q+TnTH4tJ4bi9eVL0EQFoXeZjXGETyoNTmLpqy16JDd6GKVIBByPrcAg4nu1
	spK4ZIjxvqh7P/gj2HLMfj16icaDVhyFPYcTr9N3CDRi7lhJsb7OuiZjTXpPPDbSNt6Iuo
	pRNahSU57zMR+C95qC7DyVp8aLNyyBs=
X-MC-Unique: 0ydWM4VCPg2trlJHBS_pEA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4xDdPGUpzoJXsS222n/a1+/7rYzpbNNn53djj1wWXGsWDaadFybAR8ZDMMBi/4JLqH6EhqCFnjpgsHBomIW6VDSnI3PWMKjQRdv4Pv4Xo7NyCuDQiDmNfOpwb01D5y7aBvS890oKbDHVcjLP0QPEQxU/31b/+cNqrQZsT+hloM0GuuhwyIdV+vt62UDXVwo7paQsSZ9WZsyh3lCA1K/YcHOy0eBRhu1TDF33IfTr3A2xEK0wx7yujBdnFXWFBY6lQ3Ue136IlC0vZ4/MQYxcqJnaA4wQMeNrcgvXvOFsqIzbpQAv9eEnkVf0lhl5uGcLVRG6PAI+kV155cas0jujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sYGcCumBlh/iqHb8Hi/PrcnD7eDeCZFRwKWtGjgsJFU=;
 b=A6x3Y/J0S/9c/nNx8e1paxbJ/HbGnpuXVvv7op0USXXslcHyA5EVyK4jbbR5r/q7mGIFVwTE1dD0FpNYy8sz+Ho0mmU1+cdypg31AP15NwmygrqwSuuYyOAjnKFstfQjWAenNZFpCNd+QmvnGm3AYsDvtMLKZTAeKqCOffoXXfzCEDyzxShGOINVTFFluX4egDGMdacI3RV2Wmn70/R0PcKmzKCie5tJwkXtBVbKHrVf4mVTA3xrKRpFyMRwSnz3/jcul3t8mZJPnXsa2qIiEfcNZJKYdkqRxFuKyHc8CMKnXZMaJBc0gwcMwwcAGsB16xixOQ3Buz9IlJqNS9+Ayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
 <79fa6e5f-ace7-c46a-489a-2e1ba52e53da@suse.com>
 <7e179a48-3127-93e4-cdaa-e5be82cfe770@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d035651-6e16-a6cb-6760-e5d077e1a85c@suse.com>
Date: Thu, 30 Sep 2021 11:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <7e179a48-3127-93e4-cdaa-e5be82cfe770@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5808d2d-3f9d-47a2-0ffe-08d983f18f82
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375DCC50F2B39D9CC3C4857B3AA9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U/3GyfP0tlTkiELl4jqVZ6LdYgI8JrFfTpzbkMnGXjSHqZkPD5s9JLDNQJILzaGw8D3kdaHifqyPOGJfcHqDfMihyBBoJPjnHT8yhZUvDSOvSqpFATorqNBlc7Sg3qBKAY5aHZpyEo7SX+RUTZHhXaA5KfcWOVieWAAcPFXwD23/s4Xodb3aG3EH7Yje5JO20TDDCirz6A7kYMmzhYuIrP4jzblh/ZVSzBG9L3khuR0NwwT8gw/blOfx2p8DGmyTTGHMHfGabcU/1vPiG2sCUusKu+k1zMZsUJgicVPylJiR8eU/SD7EDSvYvXBiFNYhTRDqObfRG35fbI2TCidnFnTL7sf/HDk7HqAdYFBEmj6tLuDPNoDZD+jzXKApMVcmelIknj8SnEup7kEm1xLyLi8kDsnus38jeICEULh9MoEmWIScmj9UCg8clbdRdgVMavFFEDtkTEc/JTmLAmwVN2aIV+5bfwX1tdL0gQZGHmWQ8BEl1wTC4g7e+iFWIkEbugiA34BeOHxrJso1JuBJCZmpSRX2QXbxM0xIeHIDZMbxccKAPspw6ASnBMBRQB3+Jkz38VgZI9fCoqfGNbrfm+wZUocdnDiK8iUxPEhaIQr9MM8qTyv/kckEFzTFBZRjK8ySE9IsL/WUxQxHtWyaYXPe11syQII09tYOsxH1Ee2tRz+CJV0yseq7z4hwB+7po0ORyqwE4g6q52cCUEOYa+ey7I0dPIWYd2rtN2j4BDmEqoEyu+ZjhJnaL/QqRM9G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(186003)(26005)(53546011)(2906002)(66946007)(38100700002)(4326008)(6916009)(31696002)(8676002)(316002)(7416002)(6486002)(16576012)(31686004)(956004)(2616005)(54906003)(86362001)(66476007)(8936002)(5660300002)(36756003)(83380400001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yn7ZjB7zn5inFgtVgKTciuvs/fhcLvjNZ2F+w/r215apqLrNrGVPLppXjhEhFusSh3UhLaKI/A9oH2ZLJjCgUoH+46W5lhmtxtFNeOGNPUj8vaVDpU69SctN8svUsfWiU+aoKb1/70RtSyFnsPX1PrXo5QZpiPbKl1xWUfWtWYE7CMRCRCRnOToh+1Uq8bhA/nxQMDDIOWkS0A6KVDLeW1ljuvS6h0IgGwGX9EigBNcbqxHYQpWqAsX9WHUCyoRpa4HFtXKGt5P5vTHyihlX7LzdM+xGMOA0gSEwP8FXdZyh4C/Sq08pD/cIwBjTqSBpba+tz+kM2dZ/mQrIL04C01fGwkYVlxfA29Vc156mgjX5YPSaJmju3meCEeYQCBjTtemPvlsj8/BOGZ+jfjoMVXEmzS9zwmdE1H6HvR/ixVofKRCXCNDo7DsisldnSEIIqDsc0CtbYfTNIhEy3LAJ2Yh0EBXYj8qTBMOgXqnc9+zZGcRgW/kdCPv8WRGueF0NtKpwlvnJkJR9njmfg4MqQT3NgjJk0mPqkBW9btJLKmrGNKXFk0vrCCAtI9cr62WwbX4VH2jhutWl1/CXQdQSgCzaRWrhcY47iq4mvUEpWFlI0IN7YqCKOLNeUGbwwWvYaDgoqVgZYVHmxIYDByeAt2EEb3XpJy2tApqn17gg5bpfBMiw6TQFClKh+C44OB0bv2vi7BToKyTRa8iWZ/+1Kmxv5IydHr/N1DqOcIje2IjMZ2rYeZsJKobOfXnvOKo4
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5808d2d-3f9d-47a2-0ffe-08d983f18f82
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 09:06:16.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWxhOzLiRKdqRcPauWgkvHqcJ9qJMkxw4ywYQIXJ/hg+sxt8s7+CZeZf/qUqFIeGt6zek7F8K9iMHI+Ic9UalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 30.09.2021 10:45, Oleksandr Andrushchenko wrote:
> On 30.09.21 11:21, Jan Beulich wrote:
>> On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
>>> @@ -1429,6 +1433,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>           rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
>>>       }
>>>   
>>> +    if ( rc )
>>> +        goto done;
>>  From all I can tell this is dead code.
> Before the change rc was set in the loop. And then we fall through
> to the "done" label. I do agree that the way this code is done the
> value of that rc will only reflect the last assignment done in the loop,
> but with my change I didn't want to change the existing behavior,
> thus "if ( rc"

rc is always 0 upon loop exit, afaict:

    for ( ; pdev->phantom_stride; rc = 0 )

Granted this is unusual and hence possibly unexpected.

>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -86,6 +86,29 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>>>   
>>>       return rc;
>>>   }
>>> +
>>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>>> +/* Notify vPCI that device is assigned to guest. */
>>> +int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
>>> +{
>>> +    /* It only makes sense to assign for hwdom or guest domain. */
>> Could you clarify for me in how far this code path is indeed intended
>> to be taken by hwdom? Because if it is, I'd like to further understand
>> the interaction with setup_hwdom_pci_devices().
> setup_hwdom_pci_devices is not used on Arm as we do rely on
> Dom0 to perform PCI host initialization and PCI device enumeration.
> 
> This is because of the fact that on Arm it is not a trivial task to
> initialize a PCI host bridge in Xen, e.g. you need to properly initialize
> power domains, clocks, quirks etc. for different SoCs.
> All these make the task too complex and it was decided that at the
> moment we do not want to bring PCI device drivers in Xen for that.
> It was also decided that we expect Dom0 to take care of initialization
> and enumeration.
> Some day, when firmware can do PCI initialization for us and then we
> can easily access ECAM, this will change. Then setup_hwdom_pci_devices
> will be used on Arm as well.
> 
> Thus, we need to take care that Xen knows about the discovered
> PCI devices via assign_device etc.

Fair enough, but since I've not spotted a patch expressing this (by
adding suitable conditionals), may I ask that you do so in yet another
patch (unless I've overlooked where this gets done)?

>>> +    if ( is_system_domain(d) || !has_vpci(d) )
>>> +        return 0;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/* Notify vPCI that device is de-assigned from guest. */
>>> +int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
>>> +{
>>> +    /* It only makes sense to de-assign from hwdom or guest domain. */
>>> +    if ( is_system_domain(d) || !has_vpci(d) )
>>> +        return 0;
>>> +
>>> +    return 0;
>>> +}
>>> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>> At this point of the series #ifdef is the less preferable variant of
>> arranging for dead code to get compiled out.
> What is that other preferable way then?

"if ( !IS_ENABLED() )" as I did already point out to you yesterday in
reply to v2 of patch 10 of this very series.

>>   I expect later patches
>> will change that?
> No, it is going to be this way all the time

The question wasn't whether you switch away from the #ifdef-s, but
whether later patches leave that as the only choice (avoiding build
breakage).

Jan


