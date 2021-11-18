Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B24245571D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227186.392851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncuS-000332-E5; Thu, 18 Nov 2021 08:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227186.392851; Thu, 18 Nov 2021 08:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncuS-0002zk-AW; Thu, 18 Nov 2021 08:36:44 +0000
Received: by outflank-mailman (input) for mailman id 227186;
 Thu, 18 Nov 2021 08:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mncuQ-0002zd-12
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:36:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f00a8c-484a-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 09:36:40 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-nmK9MEgLNha_PGGWC_4d4w-1; Thu, 18 Nov 2021 09:36:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 08:36:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 08:36:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:20b:311::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Thu, 18 Nov 2021 08:36:34 +0000
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
X-Inumbo-ID: a6f00a8c-484a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637224600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=foNIdUAlezc7Iw3okXdDS12ebVv8xlOQjqjqyt43OSo=;
	b=SRwjKpx0TPwOEAVOr3tEZ0LauYNsAd+hoaQZVFkP4ngzjXxA9Disj/p1qAMu2hFeie4y6k
	wt3K4afTmdiTofI/Mxz6uPQnDN/exr0862rtRlItyRFaKOxNBffc5dtxK6HpHU4SDd3RH4
	qHwwiCXURWUITuIqgBDwzSEbRyx7Xo8=
X-MC-Unique: nmK9MEgLNha_PGGWC_4d4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASs23MBYBMikMf1ZaXjPBfczNA1FO/DMkZm1Qw8aKRzW/GFUhNz4jIF5wNNmBqGGq5gPE/A/+OZJNModD5LcIW7rl5mV3aw2PSGcNsq2LkNu88NbIb/qmizGNN1XF0Z9fWsn6pdj/Jd5mG/VfWSikgQ2W365ZP3i/zXbAIMuT+kay9p7+DH6ukYJyAZZ1YQ1zTTnXZBvcmxJ3UezfG1A6rLaukaaKJeylOdYxe8cuT2GsCAfPqnglMk4LQQIV999qSKCl3ha1fnRQp3NkeUsnITnGmYbzgA1MVQqW7fkiusYpK42sRpzGsG2JIcHFMQXuB0Dop3ViJ0gGn5oMYU2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foNIdUAlezc7Iw3okXdDS12ebVv8xlOQjqjqyt43OSo=;
 b=Z5LesO0dsrUyLMv4+nA9GISjJC86NynzW61l85MqnpzjL/tfMBoyiTleBoUe2bCYvu9Y96zNEYxopf7ROP6hPhE4E5Zo5cRwqlnrDK53E4Q3+BV+LSqBv/mMXYMYCPZDkW4+S/x2z2KcieZSUsdN4/m4kpb7wCt3YfommNS3mY2ycvSxJpSw1pg3v6GwfwYLdhyRk0S74lZkqbA7xmAVQyAtC9ELZx+QmvjSIreaFayethMTMxuEO9Rz05iP+gf1mcj05HnLJX7D0hmIzf0Zw9290xigr/sbdRSfxD8CO8hnm5ybg3XBeNUHQOevuB2xe0lNGw3yjKe2Y40vgK61Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
Date: Thu, 18 Nov 2021 09:36:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0015.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 829d5e90-bd7e-4017-f6d7-08d9aa6e87fd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3389479FC3AE5BF8373F53BFB39B9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mm7sSIixQU/EKcBEM0oFD76KWwl8CmoJw040f5t61HTwXHvLnyXJ8BnMhipT6Jf60j8uzQgToVqb4x+xXDpLE0COVwy5QzOHyq4Zrf8kQxpFEt8u73JaOCyb4LkNsB//Etmtw0lHIzTsuM0wjrnv2V0mUQ+dkMgGvSPvpjOTBFNRciRACKyON7r8tvNtsXttGlAwE3ak3mN1cey5DXMJPsUkVO8xip1+YnR0EM9Ruszk21R+wwmL1M/LNlp6bMS8gQmNmdksEpp2LSQjfFXkLNvjYWwd/xwisCEbTNKncYQAlC+Wv5YOv5UdppMVv1IEw5QEHoN7l0buzSMocKdgQKQjVEDeitwLnhv2dVY+ikdS/3ccVfP13vfq6yzkWwc6ml6kCe36aoKu7CbuT6ndhjNqw81xVkN/IW70EZJ/3OHULcTUulQSX0AnXp9AXyU2aKPLywOG7hOeUEqBhq4QOerNeL4OB+HKJYMG4acf6qZb12juLWE9Ty4pNBgBCzUV63mzeF0p3IqkIro1goLNkNg9Z3x1ua1uCuR9ZkgBL0Q5XdO0JlwACHZmfuKd3KMVm/HYVE/HrRyuuZnZCymfa+suv7TNu2J9hwsZocpnfWZjD1ibwuH/X2vGIK65fa1TNKmC2Agu2nbAI0Mzm7niMXAHpzdMJ3OPo/rSiOJmjTjOzD2lFXZlbIiFGteEPDiZkGgh0yoLWbcA2LQ0Cur2VeyzPUx5QUcQNw4Hlnsl9srtp/3BRSVnspN/PFxqjgwe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(66556008)(5660300002)(26005)(86362001)(53546011)(4326008)(31696002)(2616005)(38100700002)(54906003)(31686004)(186003)(36756003)(83380400001)(316002)(2906002)(16576012)(66946007)(956004)(8676002)(508600001)(6916009)(8936002)(7416002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alVaQkZBYnl2WUg1Y1pvT0NMVTBqZEpFcXJUckozdXF4YkZQNGcvbXNJQkFz?=
 =?utf-8?B?QXlOT0lJMGVDUGRuVklLTEYrbkl6RzljZUhIZ2h5dHdpZWN5Z3dPNk1RVTRC?=
 =?utf-8?B?TlNwU2kyL2VRdWc3QjluUkxBQ01WbXFGTVgwWU1jZ3A3b0kvYUpzenh6dkxM?=
 =?utf-8?B?UXVqcmZwKzBFWHF1eTFMdncxWEJ0aGhVT2tqZlEwdU5VWkM5V1E5V3VCZUx1?=
 =?utf-8?B?WG96ZXV4K3FSdUd1SGh0ZEQ0M0syTk4zK3dKTklxY3ZvWTkwdVNMUkczdDMy?=
 =?utf-8?B?NFhabmRreFN1MHBURjRhb05ORElIUU9SOWQzMkt3dGpOZUdHQitGaGkxVk5T?=
 =?utf-8?B?V1RPOVRTc255UmtQZ0oveDN5bjNrSVgxM0VPZ2VJT1l1VllPS2FINkNGb0Zm?=
 =?utf-8?B?UGtTVkxKbXY5azVsN3pJanduSEY5eEVnV1pKT2pqbXdhdlhpak1TNXgxZ3Fp?=
 =?utf-8?B?SjFlVjVsUkp5NkdPaFZVUCt4c0UybjR5WW1relVpRmpRbDBJOWJ0TEE3RG9B?=
 =?utf-8?B?ODF0cnJzYmNBQVRJUWNLSzdNWXhpY0UrMjZzaEFlQ2dwZE1CR1lxZUlyVUc3?=
 =?utf-8?B?bFlVOVA0bEIreHBabnA0eXJHOFhyYVdlTTZvRkhxckxpQW1wNWRBazdoUm5G?=
 =?utf-8?B?bXcrNEdWczhHM2M0VHpGMi9pdzhlejZEbnRhSW95ajdWbjFaaHJiemhtU3pu?=
 =?utf-8?B?RjhuUHgvU1dpT29TQjdSOXdyZTQ1OW1uUmZRM01sbEdONjl0Ym9SYkU3NVpQ?=
 =?utf-8?B?YUkrSlgzQ3dKRGlveCtNMjNHTysrL3FCUEFxcGRYUnc5TVgvSDlWc0FOM1hp?=
 =?utf-8?B?bGU2TVVlSGpvV3ZiNjFnenAvU1R1dndCVlRXSWk0aXVvWU16UUI5NFZaVkVK?=
 =?utf-8?B?QUZmSjBQOWtySituRjYrcnZIWWRlSFpqQ1lJN1pYNWhmN3ZOV0JOQ2NRNThG?=
 =?utf-8?B?dUVKcEx4bXp6QnlOZi9xK25iK3c2UUJ4Q24ybksyVFA2M1Bzcm5zMmNBZW5F?=
 =?utf-8?B?Z05jUjBUZnllV2J5MkloR212UmJyNUhEaUVPYllUcTVVaWNUUU9VUE1Td005?=
 =?utf-8?B?Z2NrL25YWllIcFBuTGJ3QWpNdEwrNDAvSm5Pam5vM2JZdU5mekt1Vy9zNDUr?=
 =?utf-8?B?eFoyaFhsWHdWUXVwaHBHODBPdGFOeUdiL2xFT1EvZHFjaVcxNnoyWEIvdmk2?=
 =?utf-8?B?SXNCdktOMmxnK0c5aTFKbEhkTGMvdmhZU2gydFdkYUc4dW92ckdKMVhEWmtJ?=
 =?utf-8?B?ajNtb2JPR0NqTXVOaVl2d0U4eVV1NHh2RTloU0U0RVZnQmZXWHpTYkZuV1Ar?=
 =?utf-8?B?YlVKUU4zb0t6dFFsb1ZEWmZGN3ZhSjlGb0YyeEJYRDVVU0Z2Vzh1NFRRRGwx?=
 =?utf-8?B?Q3pqMVRKTzVQdU5vNHQvbm9WQkMyZTNsQm15M1pTMC9zWkN0SkpweXhrbU8y?=
 =?utf-8?B?dkJuMy9HSENPYm15Tk15ZWZYTEJodEhtSFhQdzFyU2pMbzVQTnlYT1JDSmpC?=
 =?utf-8?B?eGlyamUydFVyeXlBZ1RjY1VYK094RFVmZWhiSmppWXZPUzZmL3QzQUwvVVFE?=
 =?utf-8?B?UnFTSzROcE5BWm1OOEQrVWRSRmFqMXkvMEN4UVdFM0sxMFdaZnFKWWt6aFEr?=
 =?utf-8?B?c0k3bkNOSGlvRjR3TVdJd2ZRVHVjUi83RURSZWFFczBtZksvYkpwRFMyWDdo?=
 =?utf-8?B?bDFtWVVVNjVrMWkxQWRDeEZxdkl3bm1FUmNXLzlCUGFyQzVGeTNDQzZQa1Jo?=
 =?utf-8?B?NkRzSTRjVFZXeW5La3RwRFdJR0sxeXpPQkJDWEZWbnpSem9KOTJZNHdmTVRy?=
 =?utf-8?B?ZnBPNGZrZ0NrMVM5dS9FMnE4TTlGS2s2aTkrZGlJcnJXOEUrbGh2K0tqMkFq?=
 =?utf-8?B?QUhoWjZrVTNERUVyeXlXU0JwRW00ZjM4QU84eUNTY0svUC8vbTdpcytqSVky?=
 =?utf-8?B?bkZsRFRjOFI4bG5QU2R0ZmRscnlkR2gwZnp2TWpmbisvSmNSaGpnalpKQlhM?=
 =?utf-8?B?VEtvYzNHSUdBM1A2TjdteGRzdFgrYXZqVCtvS1pad21UMWQxckJ5RmtqbHJl?=
 =?utf-8?B?T1V5aFdoRXNDRlBDcEJlWHkrWkZxTUxyOEs3eG5pYlRkcWJsTnB0UERBaTdE?=
 =?utf-8?B?QVYzZnd0aGRqV0dGMzFMbHJ5WXhjamRGbmVncHZLVnROUURqdlV6eXpzTHh6?=
 =?utf-8?Q?vitn59brAB0tIVvHtlhClkM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829d5e90-bd7e-4017-f6d7-08d9aa6e87fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:36:35.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLtoBlxbEtQVVQLq63bGv+S3TK5xsPgAd3ZvRKg7sHAUbiBqnPZvoRRU75C/F3knmtrOe4CWE/RwqqI1FtJTgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 18.11.2021 08:49, Oleksandr Andrushchenko wrote:
> 
> 
> On 17.11.21 10:28, Jan Beulich wrote:
>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> When a vPCI is removed for a PCI device it is possible that we have
>>> scheduled a delayed work for map/unmap operations for that device.
>>> For example, the following scenario can illustrate the problem:
>>>
>>> pci_physdev_op
>>>     pci_add_device
>>>         init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>>>     iommu_add_device <- FAILS
>>>     vpci_remove_device -> xfree(pdev->vpci)
>>>
>>> leave_hypervisor_to_guest
>>>     vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
>>>
>>> For the hardware domain we continue execution as the worse that
>>> could happen is that MMIO mappings are left in place when the
>>> device has been deassigned
>>>
>>> For unprivileged domains that get a failure in the middle of a vPCI
>>> {un}map operation we need to destroy them, as we don't know in which
>>> state the p2m is. This can only happen in vpci_process_pending for
>>> DomUs as they won't be allowed to call pci_add_device.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Thinking about it some more, I'm not convinced any of this is really
>> needed in the presented form.
> The intention of this patch was to handle error conditions which are
> abnormal, e.g. when iommu_add_device fails and we are in the middle
> of initialization. So, I am trying to cancel all pending work which might
> already be there and not to crash.

Only Dom0 may be able to prematurely access the device during "add".
Yet unlike for DomU-s we generally expect Dom0 to be well-behaved.
Hence I'm not sure I see the need for dealing with these.

>>   Removal of a vPCI device is the analogue
>> of hot-unplug on baremetal. That's not a "behind the backs of
>> everything" operation. Instead the host admin has to prepare the
>> device for removal, which will result in it being quiescent (which in
>> particular means no BAR adjustments anymore). The act of removing the
>> device from the system has as its virtual counterpart "xl pci-detach".
>> I think it ought to be in this context when pending requests get
>> drained, and an indicator be set that no further changes to that
>> device are permitted. This would mean invoking from
>> vpci_deassign_device() as added by patch 4, not from
>> vpci_remove_device(). This would yield removal of a device from the
>> host being independent of removal of a device from a guest.
>>
>> The need for vpci_remove_device() seems questionable in the first
>> place: Even for hot-unplug on the host it may be better to require a
>> pci-detach from (PVH) Dom0 before the actual device removal. This
>> would involve an adjustment to the de-assignment logic for the case
>> of no quarantining: We'd need to make sure explicit de-assignment
>> from Dom0 actually removes the device from there; right now
>> de-assignment assumes "from DomU" and "to Dom0 or DomIO" (depending
>> on quarantining mode).

As to this, I meanwhile think that add/remove can very well have Dom0
related vPCI init/teardown. But for DomU all of that should happen
during assign/de-assign. A device still assigned to a DomU simply
should never be subject to physical hot-unplug in the first place.

Jan


