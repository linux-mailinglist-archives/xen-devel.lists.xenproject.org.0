Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD06E402554
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180639.327372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWiO-0001QM-Ke; Tue, 07 Sep 2021 08:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180639.327372; Tue, 07 Sep 2021 08:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWiO-0001Nu-Gj; Tue, 07 Sep 2021 08:44:24 +0000
Received: by outflank-mailman (input) for mailman id 180639;
 Tue, 07 Sep 2021 08:44:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNWiN-0001No-Io
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:44:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc12e3ba-0fb7-11ec-b0da-12813bfff9fa;
 Tue, 07 Sep 2021 08:44:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-oBpkjDe3M9inU-ss14bDRA-1; Tue, 07 Sep 2021 10:44:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 08:44:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 08:44:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.21 via Frontend Transport; Tue, 7 Sep 2021 08:44:18 +0000
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
X-Inumbo-ID: cc12e3ba-0fb7-11ec-b0da-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631004261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4e7cPHUvDvUZfKXDaQ86Rvpo//kr0KR6cJuZ42srw8=;
	b=YdMmxJB6LCzBqyjr+DM5N/SKAO3o7KNK6zUW8qkEMnfnrOiIz5X1OQ2ktnzRUwkH0d8HAz
	w9sdMQaDQrZ6d7PNsRfHq0ogbzjXXItdbAVBlymFazNkZgpftm1ZKKExRaXiPjzEWlDnnx
	6S3+tMkTaL8Z6Uou5HOHwRzAZHhQURM=
X-MC-Unique: oBpkjDe3M9inU-ss14bDRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOow3NjjInyVCfxS9vqeqY63pJ0KBiESWjsfyp+1ATipzvH2igUzh11pjTShd2KncD7rR/ayi3gTvIomuKNu0I6Y2mxGdFpQadArg3Y1+BmmL8jknM0cAsmHWUO5/j1Xkx0yZn4thNgYX5/6ypI9XZBNZ7pbj/PnlPprdgnnMaCwvMELkITT61+N0MtyYAHQE/okgKKkgCB88CEujXNlwJDW0FUUR7lbdkH3iybMe24zZsrBS1D00FekTjdR+KzXdCvYgYm2yDDXH84RmRRrYMylwAHLlPo8NUA9Pn9jArRndw0YjX1MV/ajdjx1YjhCZJgG3PBJEBkB7FOpTNdP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=y4e7cPHUvDvUZfKXDaQ86Rvpo//kr0KR6cJuZ42srw8=;
 b=DUY8S9+3T4PqbPkfbNPukhp/vXabM3oi+pV5oxCLfJLWJMbsu/FbVEBZerI+OB6tzwZNcQTxZSo+lPjkrK2ZcPJLZCJx1q4lJLQbtbhBh190aakPZBYPi5jVjQdimTsKVXwCGFgOuP28uz4R5RENQhyd6/VzwvrI9XK+JSXxlnzV3DyfbdAUu2Xisx8FZX4B/lOfx+HD7icfHKhSJw0/AYp+IHXiMvfq9bSHjULMDaPY7J52Tuqko0xGkE1Aiw6n0nbLLBbq1mz1eNkjUZUyX/AMSClxc+u+aLkOShZ40b4AMfcPBXyea67SWwRCWvhaC3eql7A+391cL06fLToCGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/9] vpci: Add hooks for PCI device assign/de-assign
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-3-andr2000@gmail.com>
 <371a403c-adec-f1e1-8887-5664a749b169@suse.com>
 <c299a9fb-f84a-a042-f452-006c9d082256@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1df422b-4e10-40d1-2726-a4d5b76673f0@suse.com>
Date: Tue, 7 Sep 2021 10:44:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c299a9fb-f84a-a042-f452-006c9d082256@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0059.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c996cd76-f1d4-41ad-3d7d-08d971dbaecc
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478ED99925F54CAEBC35FEBB3D39@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VF2FFk0KGCV3MQlxoEH+MsOlzoP1NcNWFOgje6DRluLaRJaeMdnvbI2PwFUkbvPeoSrwDZ3iegVl6iIVZBqguzRlI/h2VBvn1dgakh4VOI2+9EvkKnON5Co+6lPf6CmZQd4aftwx89hbu0zzKVM3xhwet3gDpxHd0SWM6Jme9YUVZTLw6zeEMpskmYAUY//QxB67njQAE56fNaWKTcVaUELa/izF9Mx5qO69TxZL0XfCu6rRyAeVY6Ie9u72wj8cvcfgoDSGBvaNhhCPXnVda4X+aVn1z/oO5Kxw0RdsUsyrW74WnzNBuOpL4eRskbJOVzD70kGOrUSg7uXRR7IfyMTM69LnfeGQSMGav02SV+MH0jRa1GNzKF3YSAJOEy5jAyZzYwiM7hXXw5Jr+F9+nq+r3ZGzS5sgvt5yaZ07OVkwo1e0t2DwcgYdLMNI9H+bcq5oM0G8fn0goHQoYzUToy8UR8ZbkgYuE2uQO0zwTxYwkkKXQpWfBoXkpJkO9UocTQGJOJonddXlKC5JPTDm2OLcMgJfsQ9TCM6qA/IcGTucxnvE3OPDRMH/dfwFJ68Vfjy3rv9W1mx/6Kn6LW4eQWvrU3AyV/PkZlY1fd162XtFWNEcDZhPAco3zvgTEa41zV7sc8Cff+KvUUlkcLUrcGBpGNUwbryPGBZwIDxj03SoQx1EAWNymVVj+um0hU/+frLAI+fCOaCGu7xU25DXniaWnBfA/0x9zu/PG1L68tQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(376002)(366004)(346002)(316002)(16576012)(110136005)(54906003)(4326008)(83380400001)(5660300002)(478600001)(26005)(7416002)(66556008)(53546011)(66476007)(66946007)(186003)(38100700002)(86362001)(31696002)(6486002)(2616005)(956004)(31686004)(2906002)(36756003)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXdaMHcxNVN3VzJ5a0VoUG5Md04wNHBPcWZmckI2c3gycVE3Z29rVW9USDNB?=
 =?utf-8?B?WjRzQ2pYMFNPR0REd09zUDhLWmdIWWJjVHRLUEhwNDVROWNnakJhcU9OSXNj?=
 =?utf-8?B?aTNBSml1MW1qWnp0cDlBZmp2cy8zQW44TkZ5QW9IbFpJQnpqYmVoNUJPUk80?=
 =?utf-8?B?d0hqTTZZN2ZrTlkvYzJPeDI1Ly9MYk5lM0twOEdWRHozbW9kQ2VpcDE3KzEy?=
 =?utf-8?B?U0lwMmlqVVdDYWova2J5T0EvZzFsMndhQXM0RXNOVkM0WnNNNzUrNG9hSWh4?=
 =?utf-8?B?M2Jab2hsZkVFczdQOHQ1cUxiVWVUa3VBY202VWRReTNpL0oxM254cWNXak56?=
 =?utf-8?B?ajVabmdyWDNvOHF5KzNvY3Q2dlBBUUVDRHl5d29OVDhRemNJL20xZjZRUmlG?=
 =?utf-8?B?SFA3dHB1TmVpMWE1ei9lSE9BaWdMNkU2aGdFZTF2bXk4UUl5T2t6YTZUN0Rj?=
 =?utf-8?B?dUVZWlBaM0lZQTV4bVhpMWdCY2cxdkx1MWRjVmlYbTZxMVExVkRlVnhrcVZp?=
 =?utf-8?B?cVlWeWc1STBlOHRDV1RJcmYzeWJVVjdwY0ZhRi9lVldMWDlUS3lLUTI1YW5w?=
 =?utf-8?B?TlZvbmJJckc1TnpIQzM5NDNKS2paZDNPMXBJR3k3dzRsa3hjblAveHUwMEV2?=
 =?utf-8?B?K2RZMzFqeXZQUU5zT214OHozck5XbE5EMitkc0p3MmI3ZmUySzdLTGVqUHZQ?=
 =?utf-8?B?M3F3azZVL1hDYU55T1d5NnBSeFVhenRqVEZXeTM2a3FIdmtVTDRnL0hzb2M1?=
 =?utf-8?B?K0JlTHJPVDgxYWlRcUhFbk9xTGpSb29veiszRVpLaFRhbVpDMlhzSWp0Wjhm?=
 =?utf-8?B?ZitPb3FVeXYrTVgydlUxWG9NbnFQZTZXMzFMRlNTVTF2WnNDQlNrWnZSVnRS?=
 =?utf-8?B?bzZjRU55Ylpaa0xrR0hCNDVTSC9Oa1dRZlIrWHgxQnVxNERkZEtocVBwTGMw?=
 =?utf-8?B?T1VqTHY4cGRON3VsbEFBMlhXbFVseFpHN0lzRnE4Rm1NVjJSSHZId3JFVWYz?=
 =?utf-8?B?NkxReks5d1N1VGZpNlhGeVBXbXFXWFg2c21weFBZVU9jSVJGbmpJL3Rzdko5?=
 =?utf-8?B?ZjYrOE9NMlJycFoyQTNiY25XN1NoQlliMXNhaDdWNHZxZXY1emhiNHhXbDFi?=
 =?utf-8?B?bmJIV1d3SWt0Vm54amVNRm1MdUk3M20rUUhrb2N1c3JhNTRlOW5RbXZZMlZC?=
 =?utf-8?B?Ym5taGdzUjVDYXRVdnBGVnkxWEg3SWRhOVk4UU5pOUhyZUd6ZjlDZ1ovWHFH?=
 =?utf-8?B?aElsSHJQTmgxVFV1SzNaRmltMUlGY0hwa3NWMy91RTZNc3MzNGtnOUVEcFlk?=
 =?utf-8?B?SVNCNG5aU1dmaGkwQXFxM3BuSGx6bVFZVnMxMWt0SkpaRUl3QlF2MUw5eG9Y?=
 =?utf-8?B?NXJ6L2dldFN4WXdNNnBOYXJveDQrNGNDbkEzYkpEaVlCQ3c0alBLRSsyMEd0?=
 =?utf-8?B?RkxKYVIxaEo5U0xtbzhFN1Z0c0VnTUo4OEp6dVRmeUFlYmFJdEdQbVdWUTFq?=
 =?utf-8?B?aEF6T3FVb0FCc0JLTW5qUEE1TmY2c3MzNzF2bzNMTmkyRHpVUWFyQjVCcGJm?=
 =?utf-8?B?RHNQNE9VaWMyUXFCenVFaEt0QmZ2aURtVFB6WUZuTEw3K2hoTllYRGFWeTBE?=
 =?utf-8?B?Q290NnRkeW4rQnZEeHpST3ZPVVVpTUNpWW1Bd1ZvQ2xYVE1vK1B2WUZQeklX?=
 =?utf-8?B?TUxySEVJa3FrLzFRSTB6UG9ydEVuM3F4bkNSYW1nSDNDQXA2QmZzNGNCODA3?=
 =?utf-8?Q?tK61S0zdo1rRJMkw2vquIRETKrJH6w0eQ9ifkMC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c996cd76-f1d4-41ad-3d7d-08d971dbaecc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:44:19.5302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HchVqPhG4yzsYm02HKtDhZNhZiHstDe+4WMddXT/g3GBiLb+MLl899LV++udI191a/RB5Vdzt5ttPYDx7c7vCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

On 07.09.2021 10:33, Oleksandr Andrushchenko wrote:
> On 06.09.21 16:23, Jan Beulich wrote:
>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -864,6 +864,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>>>       if ( ret )
>>>           goto out;
>>>   
>>> +    ret = vpci_deassign_device(d, pdev);
>>> +    if ( ret )
>>> +        goto out;
>>> +
>>>       if ( pdev->domain == hardware_domain  )
>>>           pdev->quarantine = false;
>>>   
>>> @@ -1425,6 +1429,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>>>           rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
>>>       }
>>>   
>>> +    if ( rc )
>>> +        goto done;
>>> +
>>> +    rc = vpci_assign_device(d, pdev);
>>> +
>>>    done:
>>>       if ( rc )
>>>           printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
>> I have to admit that I'm worried by the further lack of unwinding in
>> case of error: We're not really good at this, I agree, but it would
>> be quite nice if the problem didn't get worse. At the very least if
>> the device was de-assigned from Dom0 and assignment to a DomU failed,
>> imo you will want to restore Dom0's settings.
> 
> In the current design the error path is handled by the toolstack
> via XEN_DOMCTL_assign_device/XEN_DOMCTL_deassign_device,
> so this is why it is "ok" to have the code structured in the
> assign_device as it is, e.g. roll back will be handled on deassign_device.
> So, it is up to the toolstack to re-assign the device to Dom0 or DomIO(?)
> in case of error and we do rely on the toolstack in Xen.
> 
>>
>> Also in the latter case don't you need to additionally call
>> vpci_deassign_device() for the prior owner of the device?
> 
> Even if we wanted to help the toolstack with the roll-back in case of an error
> this would IMO make things even worth, e.g. we will de-assign for vPCI, but will
> leave IOMMU path untouched which would result in some mess.
> So, my only guess here is that we should rely on the toolstack completely as
> it was before PCI passthrough on Arm.

Well, okay, but please make this explicit in the description then.

Jan


