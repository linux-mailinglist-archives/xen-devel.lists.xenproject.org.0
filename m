Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03934AD580
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268010.461788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNkn-0003sm-PO; Tue, 08 Feb 2022 10:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268010.461788; Tue, 08 Feb 2022 10:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNkn-0003q5-Lb; Tue, 08 Feb 2022 10:29:45 +0000
Received: by outflank-mailman (input) for mailman id 268010;
 Tue, 08 Feb 2022 10:29:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHNkm-0003p4-BH
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:29:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07396012-88ca-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:29:43 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-IWvdI5pZOXml_Bnsafl9Iw-1; Tue, 08 Feb 2022 11:29:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB6012.eurprd04.prod.outlook.com (2603:10a6:10:37::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 10:29:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 10:29:39 +0000
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
X-Inumbo-ID: 07396012-88ca-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644316182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyDnzHyhr07D9RbqcXikt2svKFChMYHgPtWct1qXp/E=;
	b=H5KqpjEeGbQ58+Z6+fmp07zLY3yOGzSIBNJEuynqOAZXkD5T/POC5sxEFyTHy50jjhHioz
	44pKsoBbx7bch/4bDLt7YL4haqEObyKOwUEITH6JOlgONpZ2qYa8Bp0bS3/LKlUC1tmC+K
	Vrl2Unit2y79WsQhBW9++3CxPciU1TA=
X-MC-Unique: IWvdI5pZOXml_Bnsafl9Iw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzRkFy+3/7+xm1Nx5asaeYezOIQhmjdgYvxeGBefsKYcJBFdGuyKz5Jzzg5qto6sfrsUpYgro1tLQ5uDgWpY55/X4LkcxbXTQjQUIuVBc18JhI5+B2npaptYVwrb98Y57OaO45Ty/II6EIo7kwz9xHtMu/iViQSC8TX+Do5YeNlJ9Jc/UDIkZFnbm8AB7xksKrDgWFSgSvl+OIfVqdPjgYH8laCafz283NKOdKLUXUHNVEPDwPqoJCfvmfdbNHDFIOdmA2tGIRGulWhy0yXj2iSTsvY9weOsgTAYJOEd9Hx/LklVuHcRkmyZ8A33k9CL2QnarsG6apDLvjuBUL0vmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v64T+BBu1Xx85TwBXHaQS21VYi81iaqZh9f/C2Ok1TM=;
 b=W5C74HnsUlEmqVBUp/Bjks+stvnVXIAMaMuptXClUe9FAehhAYJSjI+AXAKi9a03VuFfAeEXAPH9GbFIfWg1KS3lY0huAMR0cul7e79sJYMiCjXLT+wv6keGSRRs7yw/L39ljrjPfO1IZhohtbcb6ZhxcOnABXYM18ua5mtCIBVKmUT6dAb3NrcU8fK4VeD6H2GyT3UHOjbBHtedMtn+w0TTbfyV2NNKqdlnpttHcxdkdPxhZrXc0NoGz7RdTn3BEDZp7VNOH0gCw7BWtmp60SE/uuNDTwZlKJdla67cjZDTT9m5PisjfDmMHQGKZ18jEdQ+XT1mZ6OS/i/OpvD1Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10cd89b5-a804-3354-26d8-bc271bd9c5e6@suse.com>
Date: Tue, 8 Feb 2022 11:29:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
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
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
 <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
 <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
 <15c16171-f196-38d2-370c-38627935a21b@suse.com>
 <20762939-6b7e-ff60-7c1a-d47c4767ff4f@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20762939-6b7e-ff60-7c1a-d47c4767ff4f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d42bfc8-7a1c-4c45-16f1-08d9eaede921
X-MS-TrafficTypeDiagnostic: DB7PR04MB6012:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB6012196787767C6859260C6EB32D9@DB7PR04MB6012.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eQRF7CxlH2q7TjWk2fZL02e5Y03cn/VIgg7sN3gggd6a65vvbiZmjx2lwl42BToFH0AxCHSn1bmRDjdcgysSwe7wuYw8NYLRFM3i+9z5vz+YPFa8T+hAIsJJzutLkFe57Nvenf3Bq/0v9pWpsV03xhcmDAsHv1pF0gXaXLrLGl0Y6dvw01CGjInWRstSQAvaw/iskj14CV+hZ0tj+BnGQueuvOVUZOGUoxEfNXhdGfgNoUDh2Ie4YiFKMTjRqH+8axASMqwtehnIwv8yufrsTNuGErl/DTQkn1vsq32Cx29THgUeNqGr3QdLS7mrplYp7Ui64CSRvA950HK2UBfTAtT+osOplrQ0yIgw/qCX1+uLSksxNfHNHingjjwTQ97qR73PhDcmZnBuh4cwAqlsCADaW+nChrnPlbBlo4brzmz/8feLhwK8Wshemq/kFLd/5+JTBBhEC/GY4vUetIc16ThutrxM5WxM9PRrHO2ob5AJIOKJyoOOSOt6kWqp1iVwPvKyNTuk0O0UCEx3KmLttRb9+puRgMVuqgNDl9Pp3SDHRUHIFp+orkpl0eswzPAZUuRnNup3FpoV387xu5NIko1rMAPnAJ/SYYNgXEGXwsXKP/a7wb4y5DQ46gV8sDuRCKvllfELavcqg6+06X7leJyBV3wiHFD8ZbqNH/67FOeoc2kCexVKQsj17xZrSAfDNvSgDVYlpZA1UPFKeH2hG09dOheHrUzZuJOEqgAs6Xc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(8936002)(66556008)(66946007)(6486002)(6506007)(86362001)(31686004)(4326008)(53546011)(54906003)(7416002)(6916009)(66476007)(316002)(5660300002)(31696002)(6666004)(6512007)(508600001)(83380400001)(186003)(26005)(36756003)(2906002)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FogYXOUmJxnLRABJ4C+HGXDj0oypa01O8oSoNwB/ZVRdRWglHt3ki65jjgP+?=
 =?us-ascii?Q?6Cb+wxvIkveYXZY4cxh8s1g+hfsybcf7f0aj9Qq1982OQXfaAyBiUMNHQ5Rv?=
 =?us-ascii?Q?2s9RYiV9a4bA/LsVdnTGxa45IXbjJcYmtwhggxwEz8LQZ04GrtWuXfNeT9fb?=
 =?us-ascii?Q?EPnCYO9LZfpxrBIitwWgyxyXUcFP6zcZrb0eNwNYYQJInqqkyw1iAvvEGHfm?=
 =?us-ascii?Q?DCT+E99slm1qIc3Apq5Re5O8ChDeSRo+OCh3gZOEbo+pKbPGCsmQZ+ao0+kk?=
 =?us-ascii?Q?AR4viP0MyMbOgz+Zxc2iUqu1BcsKCQ0gTZL/C7t18H2l3T0RTCcdzW2LKgED?=
 =?us-ascii?Q?GXx3m9gnsRanEzG44Qj2/OwHapWImJrv+r5uek9r8wIRd+XG+QBZazZbpTth?=
 =?us-ascii?Q?JOXV6rntx0JtzEaDFno2mdE88nEPbhKxtFiIXkXNZbSjbQsdb/WxWfYdKNt0?=
 =?us-ascii?Q?c014kOeR87EDnremXtq2QminxnfEfPpME19FT+ksww8iFEAp39uI08aSkPMC?=
 =?us-ascii?Q?IPEqaG/Q8tXQb+jbZpZOLsS5FnVAK0BYk/uZ6ikNuuYPcPrKa+sYXI/LEtaf?=
 =?us-ascii?Q?unY4oIPP0A3YzMhSuRjuuJIXRyksMaC6k4zgf+hNWA85LtyaU18NNREtmAZ/?=
 =?us-ascii?Q?z/0YcSBNUUqa0x7rmtgQMeyNsevN5+2sWpn2Cn/SV/mNXQriujsP0TOBaZdN?=
 =?us-ascii?Q?iRZP8jB8gGUKdnYFpyQTPhZ4Sh04RPVt4XgUgNK4/uMtgAUbqCYl79yN4otC?=
 =?us-ascii?Q?6YfAno/OYYWpreWCq8DEZmDXW4MZjrxvscfOFa4MxzWhUTlyFiVyKXi2Qxq5?=
 =?us-ascii?Q?rq2yT+fiYJrBkkX7T1KBYHv6yB+Gyt8llmhZjRp13/z2QUHUk8f9akOpd5CZ?=
 =?us-ascii?Q?yvYvnXy6mIznm7mIvWC3ztdzKoImcljZqvhdm1rg/EF9EENSPb0x4ozp4fh9?=
 =?us-ascii?Q?S87iOiy8Hvp47IH0LWkx6+edByKIYXBZ6JCPwSeol8joOpljw0Db+Jv/0J+r?=
 =?us-ascii?Q?WyItvjoS9MVL6tT8+7UA5PZ0tciww/5UWveAORCCa0K6H7LV8V+7rVy750tT?=
 =?us-ascii?Q?pwY2Uo1aTJZzyZfN78BBLhC3hSlYwdWvwr9HczDiE2Mh0ius+iOPsuftB9Fk?=
 =?us-ascii?Q?bkyrWDveYvIUrrHTK2SyOda34LD6MLKi06okmeeMMdm73+/JQyOAwhQht29z?=
 =?us-ascii?Q?Od02QS3keZ0F46JqmJwKgNDkx23YJHfYdnXlzaX3b3o/Qqsks6HBg4UDGwsY?=
 =?us-ascii?Q?G9OzVXYb4sm/y4I1LIgEwNl4OHB2m2akBMhbZwblRGKP9OUtmw/4RwO4RDJN?=
 =?us-ascii?Q?1Oy/nJH62CP2eAN/rpQnX4oJ5bqD5Mu9d8PrE+c74uLn2fiDWbCt7ee7Gt+Q?=
 =?us-ascii?Q?sFwSS1AoSeaqHDXM6pKV1ZzxlZpCQVMtODyADIlNn+5dXDrJsV6jD0sXFDwu?=
 =?us-ascii?Q?P920qn/hVtycmTe0s09LAhGWDQQ9xFFLTn9VZFsTc1TTnaXIjB77wBq3NdHK?=
 =?us-ascii?Q?R7niK+LkZRJFWxQsIpcd2wGcXMygDAF99m58i8bi6d2RZPjjpjatreTwpiGl?=
 =?us-ascii?Q?/psJ9MlrLo+5xvJT4TDf9AyhhJp0VT2c8XYrZ53jBgxCJrRU/zWBYZWddg26?=
 =?us-ascii?Q?oybYwos0vzARKT8y8cZ3ft0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d42bfc8-7a1c-4c45-16f1-08d9eaede921
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:29:39.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7VpvNMq5TOJquN3f0jpeIURGdyIpHY5LojSpG6WencZUaOW3GmctYQ8Gw5Loc9L6eOmwm1UOu10nfbHRw48og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB6012

On 08.02.2022 11:22, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 08.02.22 12:09, Jan Beulich wrote:
>> On 08.02.2022 10:55, Oleksandr Andrushchenko wrote:
>>>
>>> On 08.02.22 11:44, Jan Beulich wrote:
>>>> On 08.02.2022 10:27, Oleksandr Andrushchenko wrote:
>>>>> On 08.02.22 11:13, Jan Beulich wrote:
>>>>>> On 08.02.2022 09:32, Oleksandr Andrushchenko wrote:
>>>>>>> On 07.02.22 18:28, Jan Beulich wrote:
>>>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>>>>>>>> @@ -1507,6 +1511,8 @@ static int assign_device(struct domain *d, =
u16 seg, u8 bus, u8 devfn, u32 flag)
>>>>>>>>>                              pci_to_dev(pdev), flag);
>>>>>>>>>          }
>>>>>>>>>     =20
>>>>>>>>> +    rc =3D vpci_assign_device(d, pdev);
>>>>>>>>> +
>>>>>>>>>       done:
>>>>>>>>>          if ( rc )
>>>>>>>>>              printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%=
d)\n",
>>>>>>>> There's no attempt to undo anything in the case of getting back an
>>>>>>>> error. ISTR this being deemed okay on the basis that the tool stac=
k
>>>>>>>> would then take whatever action, but whatever it is that is suppos=
ed
>>>>>>>> to deal with errors here wants spelling out in the description.
>>>>>>> Why? I don't change the previously expected decision and implementa=
tion
>>>>>>> of the assign_device function: I use error paths as they were used =
before
>>>>>>> for the existing code. So, I see no clear reason to stress that the=
 existing
>>>>>>> and new code relies on the toolstack
>>>>>> Saying half a sentence on this is helping review.
>>>>> Ok
>>>>>>>> What's important is that no caller up the call tree may be left wi=
th
>>>>>>>> the impression that the device is still owned by the original
>>>>>>>> domain. With how you have it, the device is going to be owned by t=
he
>>>>>>>> new domain, but not really usable.
>>>>>>> This is not true: vpci_assign_device will call vpci_deassign_device
>>>>>>> internally if it fails. So, the device won't be assigned in this ca=
se
>>>>>> No. The device is assigned to whatever pdev->domain holds. Calling
>>>>>> vpci_deassign_device() there merely makes sure that the device will
>>>>>> have _no_ vPCI data and hooks in place, rather than something
>>>>>> partial.
>>>>> So, this patch is only dealing with vpci assign/de-assign
>>>>> And it rolls back what it did in case of a failure
>>>>> It also returns rc in assign_device to signal it has failed
>>>>> What else is expected from this patch??
>>>> Until now if assign_device() returns an error, this tells the caller
>>>> that the device did not change ownership;
>>> Not sure this is the case:
>>>   =C2=A0=C2=A0=C2=A0 if ( (rc =3D iommu_call(hd->platform_ops, assign_d=
evice, d, devfn,
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 pci_to_dev(pdev), flag)) )
>>> iommu_call can leave the new ownership even now without
>>> vpci_assign_device.
>> Did you check the actual hook functions for when exactly the ownership
>> change happens. For both VT-d and AMD it is the last thing they do,
>> when no error can occur anymore.
> This functionality does not exist for Arm yet, so this is up to the
> future series to add that.
>=20
> WRT to the existing code:
>=20
> static int amd_iommu_assign_device(struct domain *d, u8 devfn,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pci_dev *p=
dev,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 flag)
> {
>  =C2=A0=C2=A0=C2=A0 if ( !rc )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D reassign_device(pdev->=
domain, d, devfn, pdev); <<<<< this will set pdev->domain
>=20
>  =C2=A0=C2=A0=C2=A0 if ( rc && !is_hardware_domain(d) )
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D amd_iommu_reserve=
_domain_unity_unmap(
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d, ivrs_mappings[req=
_id].unity_map);
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( ret )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print=
k(XENLOG_ERR "AMD-Vi: "
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "unity-unmap for %pd/%04x:%02x:%02x.%u=
 failed (%d)\n",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d, pdev->seg, pdev->bus,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_SLOT(devfn), PCI_FUNC(devfn), ret)=
;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domai=
n_crash(d);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> So....
>=20
> This is IMO wrong in the first place to let IOMMU code assign pdev->domai=
n.
> This is something that needs to be done by the PCI code itself and
> not relying on each IOMMU callback implementation
>>
>>   My understanding is that the roll-back is
>>> expected to be performed by the toolstack and vpci_assign_device
>>> doesn't prevent that by returning rc. Even more, before we discussed
>>> that it would be good for vpci_assign_device to try recovering from
>>> a possible error early which is done by calling vpci_deassign_device
>>> internally.
>> Yes, but that's only part of it. It at least needs considering what
>> effects have resulted from operations prior to vpci_assign_device().
> Taking into account the code snippet above: what is your expectation
> from this patch with this respect?

You did note the domain_crash() in there, didn't you? The snippet above
still matches the "device not assigned to an alive DomU" criteria (which
can be translated to "no exposure of a device to an untrusted entity in
case of error"). Such domain_crash() uses aren't nice, and I'd prefer to
see them go away, but said property needs to be retained with any
alternative solutions.

Jan


