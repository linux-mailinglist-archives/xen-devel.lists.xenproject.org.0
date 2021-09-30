Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0F41D795
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199719.353945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtE2-0002CG-LP; Thu, 30 Sep 2021 10:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199719.353945; Thu, 30 Sep 2021 10:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtE2-00029c-IA; Thu, 30 Sep 2021 10:23:38 +0000
Received: by outflank-mailman (input) for mailman id 199719;
 Thu, 30 Sep 2021 10:23:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVtE1-00029W-A2
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:23:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0654e257-3c8d-4cbb-9869-645bd790e82e;
 Thu, 30 Sep 2021 10:23:36 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-uKjFh5p3MB2clVxN7cHFZg-1;
 Thu, 30 Sep 2021 12:23:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 10:23:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 10:23:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0048.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 10:23:32 +0000
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
X-Inumbo-ID: 0654e257-3c8d-4cbb-9869-645bd790e82e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632997415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OH4c6v8MmIglWbh9xaH+Cj0cJtHeQRU7Omh855cbIUc=;
	b=NGLEJJWereAtlBFYPbV0SBFmZ9porZ1PKCPtmkMPocWurD32ENm9d1iGlAfXyNkNEZRN2k
	vQOxdRXoGHCHROHQ9EqfE3xvweg9yVlvxjihHOqhtSXm7xDKY7frsDcX4DoLIEiqQFNTSQ
	MdUkcaROn+MCqUo8vq99V1onUFJO7rQ=
X-MC-Unique: uKjFh5p3MB2clVxN7cHFZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lnz9ry1ZIkJRw7ExYyLaLy13LSZ+c7KnpQ/1JxWdurM4v1WCCg22RLFo54dAYWTXObxi8KJX+ad3gZtFr5kYjS8rrs7fGrcDBW5NMeydHl/XqQfeqlZhILL0MVtXcGkMqKlJW9KJ9GiVacZIBBuuh9UynBBie+ihcTZd20klBbGcEmquAqNUE9YPFDddVST2JkHpoKDu8otJUpXEgQyzOLwAwqN/kGUg0Ix4fnUWWRcf5xRzmGTzHmySlUwLjYrI9JFabdvYbCDArfkHwQcZXj8UfvsxD9jzwTBfDtBamirUkgm+spYOrBCKbxIrFHLMYEWZkgt2TbCL1PNtkQA6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OH4c6v8MmIglWbh9xaH+Cj0cJtHeQRU7Omh855cbIUc=;
 b=mQFz/l8IrZEw9ojXpTo/aQJRqpmR2OF6SxUwjRmcYy4viZCVR3fZxfXGxVoYQs4W1yLkBHeGppQcMrxONlLN2PAhF1oGFQWBQKLhvMMNA2KdEPOPK0SoOQR5rKNxKFbJ4M1TxBQWE0Xsr3t4uCv8LWbZwPWyVl540kTzJKJc8LQtFkgdBVFgIvB0ixsxyau9Kwrp36jfd/+GtDL0fj5+GQAOCx/2wB+LwRvS9y0puzLrHrSNVCyo8JDIafUgfLtKFfMxHGkh63sVsdKu7XcI7LvphGW8nyMLB+9NYVtrVbSo0W2cGgRvHPNmAsHIPXk+7dOA0Va0scWbPNg3tDjJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
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
 <20210930075223.860329-11-andr2000@gmail.com>
 <ef2c008f-7682-1549-8d27-712b04fbd84f@suse.com>
 <603e2cdf-748f-f18b-99f4-44ddf3c0b9c1@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84368ff1-64f5-418f-6a49-5098b7edf119@suse.com>
Date: Thu, 30 Sep 2021 12:23:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <603e2cdf-748f-f18b-99f4-44ddf3c0b9c1@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 361e3912-8e16-434a-21fa-08d983fc5acf
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5471CE46E7F2E1169941B710B3AA9@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gHXGPVqcssuGnb3aG7Uq7jofEpRKJtdAbfxXQgKoifYxtinD26+V/BLXz9Mr9G6hpwqYJdXDMjfzqGVrhggnP/TyxSy1tG9LYeKIAFSZRz8FioZK1C9A9kWwivnBbcBNWvUF9ivc53hqCck/rNhVxZ+L30dxSwx5NZuTWEtNvVOg0jkTgttbzTWqnFXuK55MITADwKbHvI7Aj5gTMSLJY1r1NvSwTBzuw2fvSYb4tpTaFoxzwvayOEZdUJPYxqceWvRQoOuFtzj51bFGx0zh7pSq/a0oxRCldTh2pwGhhUiJhq19AkcMSriYRaszExx9omYnH7WKpPtT4kFSlQ2Ez9t4bNnmQvJxPieqa4Ytt5oXict1Wp9j/iuZqHbTwmo2QLdogGeOcGzXVGYGIbP7veoR5/ZSMQ/koO7UG67DMZ2PR1UbeiWLkPGx7fL+7m2wAE3DGnt1K3YV68nRuhz0J2U4SKfqHZfJIQ+xYyLoOk6nxpRm0y3Kfma4kj6O82nS2EB3yi+KA8PMZoPGcOB6ymYhB9bl8NWAolLVbDwMOMObdqpI8SMMKXnVxtWfCMP5UC9ecJ8j9x+0Hw7HYCy6uOmUExUOcCOffKMlGB5DceXqvCYKpclIuMWh4IVUUqMKTkLRSkke64sxL8BSK9he2a3V0g0QxAEUGGrknpEmUxSAAeB527Of84t/f0j/D609f0FulJ5W8fGCcyGucN7EPITt9JI72tm34p1yaxuS9gL/MZ+RIuoYZUYBmfVIgOvB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(7416002)(6486002)(6916009)(2906002)(31696002)(8676002)(4326008)(31686004)(83380400001)(66946007)(66476007)(66556008)(53546011)(26005)(36756003)(186003)(54906003)(5660300002)(316002)(956004)(38100700002)(508600001)(16576012)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0FjeklRSmdralFMajNybGZzUkI4Mms0aTh1NnNHYTNKMjh3WGJsSW5qQWow?=
 =?utf-8?B?RzA4MUNDa3I0VldENnE4aVFsRHlVekUyUEtKWEpnMXlneDhjaXlMOVA5enU2?=
 =?utf-8?B?cStIYmZRcjB2ckVEdkRQUUNQelVHZG9XRG1ZTU85b1F0dWgzU1FqUE9IUjVY?=
 =?utf-8?B?MHVIWlM2ckIrWjhodVRNaXdvZGxGRUxPaGN1dkFwaWVyMjhpRVo0SDZONUJs?=
 =?utf-8?B?TEVPN2l0OUNDQkNOcHZDNEIwaTJERlhSQzBudVY2dTIwLzY1Z1ZLNHVJZGd3?=
 =?utf-8?B?b0lzMUhkRkJlTmJnaWRraSt2T2VkaWthdEJGNnljZkFwakw3YVBWMU4ySzVQ?=
 =?utf-8?B?c2FCNTVUS0M2cU5OWXNlaFhTajVKSVV1K1JVQUhrcWtZVGhlS3RkMjFUdXBp?=
 =?utf-8?B?VHFvMG5jckwwTzVGaUMzbU13b1hDckJLcklBckpxMW0vYTMwM25xdTl6WGhi?=
 =?utf-8?B?b2Z6Y0FkcTlRVFd5eVJhVjRJcERYYkNMc2xqbmJ6cmw4dWh6UWJmV09FaUha?=
 =?utf-8?B?Q0JpNTNEcVl5Si8xY0VDNjF1ZTZxTDRpeUZ6QjI0S1FLMy8rTk5veDhrMytX?=
 =?utf-8?B?UnJDaVBCZHY3bzVxRkZXSUFoV3o5RkhITFdiRGgvN2NKL3I2VzBpRjBTKzlB?=
 =?utf-8?B?MnJiMkZ2OWgxUlpocXpRTE1OWWlPZFFOUzdyMUtRSjlMUXN0Yjd2M2lSWjlH?=
 =?utf-8?B?Rk11SlJORTFvMzZEOERkR2YwR25JZDZMWEhURzFYdUFPRlR6TVB5Y1FKcUY0?=
 =?utf-8?B?bmxEV291NDY4VlFuVEVZRTBtSlVlSlRGREJkekJpU3paQ241YkREUkRoc2Iz?=
 =?utf-8?B?ckxQcm4xY1MzYVVKY0pWM1VVS25LQVUyNGlWeXQrRUxCbXA3Z21wZ2c5TFQv?=
 =?utf-8?B?MThZN1JVZmN6T3g4UXNhQlQyckNxa1FKcHZjbWovdnBkVE9qVDZNcmdWNVdp?=
 =?utf-8?B?a1puZnA0d1BWSk0rMGM4QUJoMTNPUW56dFRLcit6T2JtYXpwNVZtS0dtaFk2?=
 =?utf-8?B?Q1JjUDZ2VW5OcTM2NHRQVTVhN2JlSkcwcjZwQ25aTHdnVGdnSTRmREwzVzZC?=
 =?utf-8?B?bXMyV090VmVYWVROL3BoTm9ESG81eWZiUGtaSDhVQ212UjdGU2hGVkhvWWYz?=
 =?utf-8?B?RGQrVHZ4MHlWTGpMWndrMGMreFRrMVJVUmxkMmVYTU90d0kvcFlUZ3BqVHFy?=
 =?utf-8?B?ZGlwdTVnOFpIT2V4MlgxYkhkTk8rRmNmRVdHdEcrK1Y2R2VVdDFCQmpya2Rh?=
 =?utf-8?B?M1l4OTNhcVpjaWMvSkVFZ1N1MDRFM0hPTEtPeDZLdEttcnlyQlh1RGI0RDRX?=
 =?utf-8?B?cFk5dVhSbUF4TkhtNkVxd3dXOFE1a3VXT1VXeXI2OW5nSVhmRkZFOEQ3bnhQ?=
 =?utf-8?B?cVg3SnF3K0xHYytjL1ZLNFFIdXdjeTZxQ0h1a1ovYXd2QnZrdWh6RWd6OGNU?=
 =?utf-8?B?VnI0emovWG4xWFhCUmNIVHZvc0l5YzFyTWx3NitGV2doS3YxMkVNbGNZMm4w?=
 =?utf-8?B?aFUvZnptTTR5SDNLNkZEUnZRTzNUS1FZN1JjRTZWcFhwNzRvUjRobWMyaEdN?=
 =?utf-8?B?NVVzMkxVVzk1MFZPWmsvOWQ4NzV3a1MrRG9obG9Qa1IwUXIwVzJianFveHRX?=
 =?utf-8?B?RHRLbU9DeFVNZERZRURueU4xZTEwUXpCY1kyYWNWQ2VEY3dUM1hta0F3dmt4?=
 =?utf-8?B?ZXVubVRVdFYxQmJLNEVqMTM2OEdxODZabFRjemNSV1Vxc2h4aXVLT25oOTlw?=
 =?utf-8?Q?ND/xar3usER6u7HSrzAyarI12bIlbaqYaXIU8z7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361e3912-8e16-434a-21fa-08d983fc5acf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 10:23:32.9096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oz1P7Co/YLgqODSF24uSgAeNwv2WubQ45+Fpk78c6FYohAthin9DvpkBVFH64bJVMXP81NQz98Z8qK+JeREmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 30.09.2021 11:34, Oleksandr Andrushchenko wrote:
> On 30.09.21 11:51, Jan Beulich wrote:
>> On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -831,6 +831,66 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>>       return ret;
>>>   }
>>>   
>>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> May I ask why the code enclosed by this conditional has been put here
>> rather than under drivers/vpci/?
> Indeed this can be moved to xen/drivers/vpci/vpci.c.
> I'll move and update function names accordingly.
>>
>>> +static struct vpci_dev *pci_find_virtual_device(const struct domain *d,
>>> +                                                const struct pci_dev *pdev)
>>> +{
>>> +    struct vpci_dev *vdev;
>>> +
>>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>>> +        if ( vdev->pdev == pdev )
>>> +            return vdev;
>>> +    return NULL;
>>> +}
>> No locking here or ...
>>
>>> +int pci_add_virtual_device(struct domain *d, const struct pci_dev *pdev)
>>> +{
>>> +    struct vpci_dev *vdev;
>>> +
>>> +    ASSERT(!pci_find_virtual_device(d, pdev));
>> ... in this first caller that I've managed to spot? See also below as
>> to up the call tree the pcidevs-lock being held (which at the very
>> least you would then want to ASSERT() for here).
> I will move the code to vpci and make sure proper locking there
>>
>>> +    /* Each PCI bus supports 32 devices/slots at max. */
>>> +    if ( d->vpci_dev_next > 31 )
>>> +        return -ENOSPC;
>> Please avoid open-coding literals when they can be suitably expressed.
> I failed to find a suitable constant for that. Could you please point
> me to the one I can use here?

I wasn't hinting at a constant, but at an expression. If you grep, you
will find e.g. at least one instance of PCI_FUNC(~0); I'd suggest to
use PCI_SLOT(~0) here. (My rule of thumb is: Before I write a literal
number anywhere outside of a #define, and not 0 or 1 or some such
starting a loop, I try to think hard how that number can instead be
expressed. Such expressions then often also serve as documentation for
what the number actually means, helping future readers.)

Jan


