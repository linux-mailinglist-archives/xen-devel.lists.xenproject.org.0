Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753023F2E38
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 16:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169565.309758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH5eH-0007Sq-Gm; Fri, 20 Aug 2021 14:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169565.309758; Fri, 20 Aug 2021 14:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH5eH-0007Qj-DX; Fri, 20 Aug 2021 14:37:33 +0000
Received: by outflank-mailman (input) for mailman id 169565;
 Fri, 20 Aug 2021 14:37:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH5eF-0007Qd-Sz
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 14:37:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfa40300-bb3a-4f85-b45b-8a89738e6516;
 Fri, 20 Aug 2021 14:37:30 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-hKeGDovuOjOvaUkKCOU4nw-1; Fri, 20 Aug 2021 16:37:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 20 Aug
 2021 14:37:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 14:37:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0059.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 14:37:26 +0000
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
X-Inumbo-ID: cfa40300-bb3a-4f85-b45b-8a89738e6516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629470249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ij/gM9WxNVKA4jhCN/biYFt4Nn/KgPsxvohxiIRTXW8=;
	b=Y+mg/UFPZaGzQDw8TdrTaZwjLO8Tu4PVsVsNAz+JtEUSXhO5ePFzznhWXlMjmmNZ6LAa9P
	GFEQWCd99fkgeWiPe4z7gihs0XdjZbHu2E5R8ogGQcFpzHN5CABlDBysnt9SofJPi9GCMQ
	RhzJy5+petTBcGHA57ogHu3n0RY0wys=
X-MC-Unique: hKeGDovuOjOvaUkKCOU4nw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4qqTh1TwBZ+LCPjLVasVdJ1+suLDdA0dK7rJWM9Z9FQNvQ0lHBnJwQ2eT8PlNbWEvna4yLceoM3EKBLGquE/P9bvmkfkxxWCiSn6i7Ogtlz9IYbt3FVwKj9rPjoGzuyy8tSQ9D3m1ocdKmAIiQZYLoseDpCOQSzWha4tMWwO3tikpRouRRdfOt8gcsHcFxR09sOe3pTV/bC+hGDNgfdl2K+eYqSAylXNKZEME7XpK5WUrbkRWl5NASLQDpHJhZfcsdCu7sihB7Ff+7f2erL0Tjwqk9U6ciPoprfQQCkm6IGS++PifxkjQoKp+AgHvWo3PGjc2ybO+f1ve6O1dg7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij/gM9WxNVKA4jhCN/biYFt4Nn/KgPsxvohxiIRTXW8=;
 b=eQEQkSGEhd7l1KoN/1R3ygsv6/0g3hVhNGXJFbUtKrMdaPFR04INLkVOwgphhoT5sUOGXSD3+dbmgzjoTQJ1Ul19BoSTEJXzpuRxabAXgqiDYBw2wn7uMknHGyuFa3IBwzMN5KIht7tAvcgAZaIBoRfGm9nlxEoo25Kw+4ATeMNMjnxEOz/WKs/mXeaSNMkLInGi+3Hb/POjIpkz4oQIaIx/SqY9p+qmjVTn3pl2+b8RhhK0YUwq78LZiGBfwUBUjxyF/YaXehwUpSoIKWBn1sCKqxC7BO9VbYoISREGDwaS61CP9WKcRNpP0aF9urkUiZGMyWItpSCj+JbOqYJ4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
 <731afb80-bb68-0c66-4f0f-341a46118770@xen.org>
 <DBFA6CEF-F8BC-4516-B609-99985F0C4698@arm.com>
 <b17f7970-ec4c-96e8-1a1c-0d3039d4d43e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f9c4837c-085d-d7a3-d79d-a77c6b5bf201@suse.com>
Date: Fri, 20 Aug 2021 16:37:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b17f7970-ec4c-96e8-1a1c-0d3039d4d43e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0059.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b057f6f-7bfe-4e5f-2c2c-08d963e80846
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3776AEF731A728F612A2EDFAB3C19@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q0RpzYIn/dejU6w3MRPWLEQHu7dZfVZyGIozWPjq4fJXp5ROIviXjmtjLlNODt/5yBubRizjkdj1G5PP/dJuYnz39gS3OdGb5vWsgvkuCPgj8L6/u0J12pI4DmLEZ1hFAsEN4TbKvlMuKRSLz0ydP0NGl7QAMOvCBzFVAg8HjlMQkldo/b1nMTn11e+EZ075NjimhXqpLyoNgCI+UUIYA8klqNrIPwVsHOZIENug5g8HWlolDZWRs8tuF5DSF48hLB9DHxfQCWyehjZJ4/9vXnEhz/e6+2aNp2sZ59jM4lJ0pSF641wfTkFnZXQx/SlMmC34ZcT+bzJcl1f1oh9jr1iJGDNUmxwOJziVpP8R48GgcRYmDLyvm0pa/ixgK2hFyF3jfdg3JYXEcI0iWnLuRTCdreeFHn4ghIZYTo5GTSGY7T6IK+ISkOwdv7wQf66nemvtE1mzSKNzoFszk+w4vXgcjsdPvke2J2zHHHJXCgWetYeNaSPTdeYp5S4zgZrpOc0F3DNbJN35ctZdPr6cUTeHxcWSHJ3cOxCFkyPMGg4M9fnMyBfTD6ahBX9Th4tqqcG3K+8wXokzYhFSuyxEWjA3aPF0pJod38MmPik67iVZbomz6MEY1zGnnuHhhtTFe2IwwYxyvCFrv5XUfnMwOWaA+hUf5hytskUiPqRXXhSMTrvj8qImbvAeYLchrmujlTmbdT8NVVh2c2xqz7ycBefaYUvAYM4tgeq8R0mt+M8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(136003)(346002)(39860400002)(5660300002)(186003)(53546011)(26005)(86362001)(31696002)(36756003)(2906002)(478600001)(83380400001)(316002)(31686004)(16576012)(6486002)(66556008)(110136005)(66946007)(66476007)(54906003)(4326008)(956004)(8936002)(2616005)(8676002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWZ1KzFBVlhxNC9ha3dQRFJUVkJWREEwY1h2UngyN1VMT3pSbWlXNmdqYVJ5?=
 =?utf-8?B?T2d0emhwK3R3WFBOSlhQNHZxT2NXOVhhT0EwZWNQa1lLbm5DRjUrclZjVDd3?=
 =?utf-8?B?NndwbXpLTFhwa3gzb21iQnYzQUVGamdkNGo3ZHVUNE9jczJLOWtvQVZxYXFo?=
 =?utf-8?B?ZG8wOEpQMUZyZWNsREVDbG9qclJTbXhZQ21hTGozVzAxV1I3Rkd5azI1THdM?=
 =?utf-8?B?SFFXS21xVmswNUhCaW5JY2c0aDc2YVNKTmt4Y1g3MXpVem9sN2tsbFpGWkV4?=
 =?utf-8?B?S0UxNU9DNU5yR2dVZEp1d2dvTmNsQUR3czE0M2RVdFQ2ajdtenBCOWpLSFM2?=
 =?utf-8?B?QzB2OEtNWncwcGJWUW4wUW5nMkVsOUUvSzhzUnFxWjROZSs1ZDJOakpRRGJn?=
 =?utf-8?B?eTlBbytSVi9Fem0rSk1TSFN1T2NKeVZqcUQxV3FwNHBZMjJ4NXJRc2lOeS9N?=
 =?utf-8?B?cmszS0MwQTlod2NuZVRsVDFQUUh0dE5YaTJxY2lGUmt0K2Rva2ZvYjlTS0ZY?=
 =?utf-8?B?ZTNuellCNnkzd2ZLZXhaSVc3eXpxa0RCaitkV2NRWWhydEl5TmQ2K1UxMUlr?=
 =?utf-8?B?RjZ1REtOcjZxKzJGNFN5aDdETStUb2Y3emd3Z3BNb1E5RkhPZE1nU3hsRlNm?=
 =?utf-8?B?N1k0emwzTFpDVDZCSTF6SXBTOU5OejRhdVBIcHVESmlUdHlMV1R1WHpiNmdV?=
 =?utf-8?B?dDkzd3FVdHNGekoySEVFUnVSdW9YZ2lJRkxNVmUxMU53U3FqUUk5YUtmQzlT?=
 =?utf-8?B?L0M5NUF5dFdvZ1JVMFNQRzZRQWhBQTdsN1QvSENwTjYrSXB6bWtNZjdwZkRo?=
 =?utf-8?B?a0ROOERZS0xXSlV5bEk5MFBBVnMvd0tnYjJkRERxVFVoQ0xDVE1qZFlLTm55?=
 =?utf-8?B?YTBheFhKcXRxc3NoV1ZERDg5aHZLUEdsWDN4TUM0STQ0Q1gwZ0lWcWt4RGVV?=
 =?utf-8?B?RHl3cXBOREhLQk8xZTBCVENFTnU1SVltWjRvaVNMcE1Za3k0ZWo4TXNHQ1Fj?=
 =?utf-8?B?ZWp4Z3Y5ODJyY0plZHlpdFlqTmo4QjRvR050OWIyUDVQeEtPQmJkdnNoallB?=
 =?utf-8?B?ZTRZOTArak9SbSs0UmNVbzRoVTUzTUhjSldub0NETkRrd09scDM4Y1YraGNh?=
 =?utf-8?B?T0w0UGJwRDlkbm5XMXZ3QWNBVkRxc3ZuSDNtYXMzT2NtMWhhMm8zRjdNaEVF?=
 =?utf-8?B?bFozanYwVVpBMmZ4aFUwVmNXODcxWitrN1A5bDQvVWJGeGE1NnFmMWFVWjlv?=
 =?utf-8?B?MUhEK0l5ZGx1WjZJMUJjL1NmMFNpRjM2TUcwTnVZUlBsU0dpbWlQTDZGM2l1?=
 =?utf-8?B?UVJYdEw4L0EyR2FGaEZWb2UyMW5RM25kVkR0UGNpUmd0Z2Y5R1F2cVM3UWJV?=
 =?utf-8?B?emFldWFFMjJCZ1p4TTJ1bnJPQ1JCUk9lSHVNVUpZb3NZdllPSFhQa2hQTlBa?=
 =?utf-8?B?WVNROVBqYWhVZjZjVzFUT2xoaFIwTVEvVVdDZCtUK1dLd2pIR2lXNmZZRVRo?=
 =?utf-8?B?NjAwSzRqdFgxSGpXYVFIQTBvdyt3TVE1QUVMYy80YXp0V3kyWmtqYStzcU5J?=
 =?utf-8?B?WEhkQ3VuUnBQN2ZDZWhLMXp0VDNtUzRTUGdpVjRiT2VjK1ZGWkIydGh6SG9z?=
 =?utf-8?B?M1NDOHJLWGwwY1d2VHYzWjBOUGtJVVpVNWZoQndZa0RWVDVHSkxaQXdweklK?=
 =?utf-8?B?T0hGTGdIV2xBc2tINmp1aU9UOW5TSFJRYW5aZUNsMFhLVm5HbU5yZm53MStL?=
 =?utf-8?Q?KvZ+CWNznDJO0zJjXvJGTN3hUQjae42/T2xJU3d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b057f6f-7bfe-4e5f-2c2c-08d963e80846
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 14:37:27.3214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWuxppB0Xly1aAjGp5czbPCz6Y2ltptU+KlABn1rnT9QRkkz5TPOTZpYDO/n6PxoeejTdeiOdBy0VaFZ3f0VGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 20.08.2021 16:34, Julien Grall wrote:
> On 20/08/2021 13:19, Rahul Singh wrote:
>>> On 19 Aug 2021, at 1:31 pm, Julien Grall <julien@xen.org> wrote:
>>> On 19/08/2021 13:02, Rahul Singh wrote:
>>>> Add cmdline boot option "pci=on" to enable/disable the PCI init during
>>>> boot.
>>>
>>> I read this as "PCI" will be either disabled/enabled for the platform. Whereas, I think it will be used to decide whether Xen discover PCI and PCI passthrough is supported or not.
>>
>> Yes. I will modify the option to "pci-passthrough== <boolean>"
>>>
>>> Can you also clarify why a user would want to select "pci=off"?
>>
>> As pci-passthrough support emulate the PCI devices for DOM0 also, I thought if someone want to
>> boot the DOM0 without emulating the PCI device in XEN and wants to have direct access to device.
> 
> Dom0 will always have direct access to the PCI device. The only 
> difference is whether the access to the hostbridge and config space will 
> be trapped by Xen. I expect the both to mainly happen during boot and 
> therefore the overhead will be limited.
> 
>>
>> I am ok to drop this patch if you feel adding the option is not required at all.
> One of the reason I could see this option to be useful is to figure out 
> if an issue occurs because of the hostbridge emulation. Yet, I am still 
> not fully convinced adding an option is worth it.
> 
> Jan and others, any opinions?

Well, if there's a proper fallback, then why not allow using it in
case of problems?

Jan


