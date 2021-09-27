Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B2419035
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196448.349299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlNk-0006Qj-Tq; Mon, 27 Sep 2021 07:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196448.349299; Mon, 27 Sep 2021 07:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlNk-0006Oh-Qe; Mon, 27 Sep 2021 07:49:00 +0000
Received: by outflank-mailman (input) for mailman id 196448;
 Mon, 27 Sep 2021 07:48:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUlNj-0006Ob-KD
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:48:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97fd1c9e-fd0b-43ac-ba4e-114f95c15f80;
 Mon, 27 Sep 2021 07:48:58 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-kKUSX5cKN3mZZjaxpD4jzA-2; Mon, 27 Sep 2021 09:48:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 07:48:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:48:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.10 via Frontend Transport; Mon, 27 Sep 2021 07:48:51 +0000
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
X-Inumbo-ID: 97fd1c9e-fd0b-43ac-ba4e-114f95c15f80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632728937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rwhkrQJ9kLkgjnOKQPT+JHOelIXQyjB/Af+cIBoY/g=;
	b=ShR6AMct/APX/jPoBSwYpkF5v29tUMphPLWFtXfX/e92OSXJM/GiggA7U58Dl50A4L7fAm
	yTrRvEBHou6Aae9B/oc1zpvhbaxU72p606E3fNkpmkzKxuhgVPtJ3dS0rlrnLpphC7dZi/
	/sd2u50bz2xS/zrRAWm9tRDL1I9dbvM=
X-MC-Unique: kKUSX5cKN3mZZjaxpD4jzA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHi0XFL68jt+EhgIJVb+oysbP6DiqEkr59EOnu7SnCO48cWiGGoDqrGp5yXhr6ORc3Zgpf4DxSjDO+is6tnXbeUuM7+Wb8zMlTeEzKmDajF/Ss3KY30bgkwopQSjQXJiBa9UeHuFOX/J1YeLvaxronfDjfkwdLtlrR+TsU+fTL9/Cw4e23VFxpUoew9pqUROPAPdRm7DByKSD/LQPc9nxeR87ZDKrwUuDaZsj08hNaKw2HAQkKhw2Zf6jcnt9YQ3znMofxFP3VNJCYHjpukGanvnESkbQ5h8vTDV2R+SW/cLdOn56GxV54rSIxyfdtjjBMgLNSENvHmvUBKSpBJWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4rwhkrQJ9kLkgjnOKQPT+JHOelIXQyjB/Af+cIBoY/g=;
 b=Ui9Mpp6RIXpW81lQegAykOes9pw0Iiqz51xWzponhwScX49iPEN8C/1H9+q/JzHowXYG16X7+pXEX2MnsAxuhI6KTy6ekbVQVEmf7FSg87lDTHEmFitCorW9973C2T3SIFGZxHwEHnzUZGSWVtoJ4PDQPrRtq95w4g8Vx49uBMQOSSEUcuY8YSekKRiuMGMyRWSTqhMb2uV9mfMoUmNht/R2S1ksQIxfZriMI2FEFWW/tikIqAbtjIYZEJ5OhGdJsRZHITSnDx2mBuJJS+BMsC1P3VVsS62gJGh4x7N0SbpwZZAhw1qDyW1iHKWgVNE2xJSvChvyAI5jqoxmihulBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <750b9449-c986-025d-9b68-dd0f6967b083@suse.com>
Date: Mon, 27 Sep 2021 09:48:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c2da389-15c7-47f3-0484-08d9818b3fe9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024C32884B01F9305800CC5B3A79@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	orU9aeimQKbvP0ORGrN6x4BJ6DTvZlYYG2R3E+Uht1UAXYYeZKik08+kjapYQ/BUQ0D1EEzLws//aqmpK/cbDnHL30h7h65Mh8GmihE50J7twetG8m3U0r6D1vkYKYPXXTcfwhRfvmcgv353abf4NJvugQHmE7AkCjQhn9mEaQNfZ1BQYwPpcvN+yJsD9c1MSuP5KrTyicLaeZ+s13SqxWAuyjfrqTRrGtJAGGsKn2lf/yJ0L8pC6jaJKO9BFjV/g28/6D5M1J1RkNA4QM+QSeRgOTrC+yvJyJ+86cERJMAf32zcQKHgs+iYDPbPYr73AkcI+rOaYaxi0pKOd3LM1vuafObymshJbWj4/dmz9iZ1JWBxxn6UQmo2mel/5g0FQw/Ay5AH2XWLWqmeUkexSVOSeov3rgkB6t0TNkkNlpnn1yj48AED8a+/FP4OkmzJYhTrSEKg9+yPhXT2WwVD/nWNzxbSb6FoNTVXZKWcIoB5XofSWIBSFcGQwQ7DMsxbu6XhwzhHnpsEpNZpGQyAjgqlbkPH3k0+SKFqT2Bh9i8DQAH9ExsV3j5QesqSHTJhL0meOtw8LoBubKDsV7c4CPa01eSPtamvCOQafzXv/gdaxj7unuVngVRup4iyGeSCWSG3udJMSyV4JTqQwSjCUMNeT32mxSIGYa7FI0Joz1cK0mmPn3gq4p+75/SCSlIHkJbvAg1j8QEOrz+e9yTIC4pfjNFVzVyh2ALm/w4Xwy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(508600001)(316002)(16576012)(956004)(26005)(2616005)(86362001)(6486002)(186003)(66556008)(66476007)(8676002)(4326008)(31696002)(66946007)(53546011)(31686004)(2906002)(8936002)(83380400001)(5660300002)(54906003)(38100700002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czVoMkpiM0NUTlVqODRjWHBhOXpRN3MycENwMU9ZeFBra25BcC9pU1FOSnl1?=
 =?utf-8?B?QXNQeDZHbUxScFQwTmZHcGJrZFRuaEVSZmZvVFg2N256cTVHVncrMlhhd29p?=
 =?utf-8?B?cmh2bGRxaHdQcWJ1UTA0QmVNMHZkUW5EaHBBU0ZTdmpYc0RZa2lRV21YRUhG?=
 =?utf-8?B?Q2JmcVVFaDAvSzQ5L2JRRkthcWM5bENEWkt0bmczdGxiZGFsenlXTStEZUZy?=
 =?utf-8?B?cE1BZzJrb0xmR1YzRmxMQ0k2RklGWGxpSVR2dU9QWGQwMytiV1REc3JGUzNo?=
 =?utf-8?B?d3VsTktLOVJtU1FqVm5tSjRqUnRFTDVvZVpwcTRuSGRqMXR4T3RGeWlzMDdE?=
 =?utf-8?B?eEJud2ZIejUzQzhhQ0cyUVZQTEVmQUJVN0NTdEpGWWJjaUNRTi9lTDJobXpw?=
 =?utf-8?B?RThSUzJVeVQrWXdtdWxWN2JhbVBVUVNrN1hQa095MjZaZmNxNVI5ZlN0NkZm?=
 =?utf-8?B?RUR2N1hyVUkxeDdKMnBVT01YV1htUXpNSDZxZGtxN2dBbUxuQkQ0K1JXWWdi?=
 =?utf-8?B?Nm5VanE4Yld0c2JLSjhpTmJBVkhLNUgyV0IrNEdZWEVhc2RvZGwzYUZqY1ZI?=
 =?utf-8?B?Q25jbTZiVkUrUFFEV1draW0wWW4xWDVEbW5LUE5WbHZRcGZFRmN0Q29hWlhv?=
 =?utf-8?B?K21USHlIVmx2Sllncm1MZkJEQzJnTi9oVXdnUit5bjRTdVNPUjZBWERZL0NT?=
 =?utf-8?B?M1RsRkt0cHA1YnErelJCb0NzRzZ4aHFGeDY4a244eHZTTkVTL2tyY2I2NzJx?=
 =?utf-8?B?dVBzSzVSS1c0SWlPajhJVnRIWU5zN0c0U29mTVlFVFUvckIvdlNUZVZ0SHlz?=
 =?utf-8?B?R2hra2pOcjBXaGpFaVFwcnAyemI2VzdncUpsK3p2dVNYZmFIVjVVNWhPS2sx?=
 =?utf-8?B?SEdSditiSW9HN2NTY200dzJJTU5kdHpKandxN0UvY2FPVE5COHFwekxhN3Rq?=
 =?utf-8?B?ZDJDUTlLMWpwamJ3a25SZWN5dWU1ZkRFWFM1R0hNNTFpQUV4d09VaGs4ckF1?=
 =?utf-8?B?Ykt1U2QwR3NQV3puMjRaSFNpVmdqZitEVFh4TVZYdWJXTytDYjR6Y25rSmRw?=
 =?utf-8?B?WWw2QkFTcGxhK3lmYXlHS0ZaYmlFdjkzTU9QOGgzZjNzVmFPdnE3QkNGeFky?=
 =?utf-8?B?SFI5U29aNGRBRi85ZmthckJVWmRwMjYwNkJ1V0xQQ20vWENzQzNjL3RUTDE5?=
 =?utf-8?B?VzhVdHEwRUhabGVhUW5PSEJGYXp3bkgzRmd5L1htdUdKTThtSzR4UWlKVWJZ?=
 =?utf-8?B?aUk0YjFhZEZsRnF5ZkV6UWs2R1NTejlmejlKWkN4NmhlRzBDZ2FOMGVkVWxo?=
 =?utf-8?B?TGJNMlR3dzBKdkx3TnBXY3FWVS9LY3c5WEFMS3gyWWYwNnJTSWxnVWwzNDdo?=
 =?utf-8?B?c3dxSXdwRk1abXNYbUczMXdkM2FDK3lMa0U2QVRyUjEyTktnTWdPRzZReWNV?=
 =?utf-8?B?a1VnWWdLeG9KSDBSd29aTHFNaVk0b2tmMTUzenBpNkx4OVZMdlBOSEZuTzNP?=
 =?utf-8?B?bndTWnMwS00zbnFOWjcvNW14UVJsSHhUTC81RWxrc0l0M21CK0cwZS81OElh?=
 =?utf-8?B?dVdnci8zTDlGVzJka1pMOCtXb0NkS0pVTjY5aTl6T3Q1a0JWY0ZiV2huek5m?=
 =?utf-8?B?Z00zMDRvQ0NPeXMxT2ZOVERpZUFsSzdnRGV3YSsxY1lic0JZWkVVYWpoOEFT?=
 =?utf-8?B?bS9hUUZPSHp4OWJ3dW5ENEp5V2ZNVEhSQ3N3R05jWWNGWUx4T1FsdjZnSlow?=
 =?utf-8?Q?EKWNPoY/xEJEs/k5iHplfnSdXoNG/d/UX6Ux6b0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2da389-15c7-47f3-0484-08d9818b3fe9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 07:48:52.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuPWozKGCjYH1uF+sFOYQCrcCyvu3rNSEKI9cIt+99T+ZGtl4v7dPPnrFFMhkPXqYGb2cFuY3mDZe4RSzQ7MPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 27.09.2021 09:35, Oleksandr Andrushchenko wrote:
> 
> On 27.09.21 10:26, Jan Beulich wrote:
>> On 27.09.2021 08:58, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Currently PCI backend implements multiple functionalities at a time.
>>> To name a few:
>>> 1. It is used as a database for assignable PCI devices, e.g. xl
>>>     pci-assignable-{add|remove|list} manipulates that list. So, whenever
>>>     the toolstack needs to know which PCI devices can be passed through
>>>     it reads that from the relevant sysfs entries of the pciback.
>>> 2. It is used to hold the unbound PCI devices list, e.g. when passing
>>>     through a PCI device it needs to be unbound from the relevant device
>>>     driver and bound to pciback (strictly speaking it is not required
>>>     that the device is bound to pciback, but pciback is again used as a
>>>     database of the passed through PCI devices, so we can re-bind the
>>>     devices back to their original drivers when guest domain shuts down)
>>> 3. Device reset for the devices being passed through
>>> 4. Para-virtualised use-cases support
>>>
>>> The para-virtualised part of the driver is not always needed as some
>>> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
>>> model for PCI device passthrough. For such use-cases make the very
>>> first step in splitting the xen-pciback driver into two parts: Xen
>>> PCI stub and PCI PV backend drivers.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> ---
>>> Changes since v3:
>>> - Move CONFIG_XEN_PCIDEV_STUB to the second patch
>> I'm afraid this wasn't fully done:
>>
>>> --- a/drivers/xen/xen-pciback/Makefile
>>> +++ b/drivers/xen/xen-pciback/Makefile
>>> @@ -1,5 +1,6 @@
>>>   # SPDX-License-Identifier: GPL-2.0
>>>   obj-$(CONFIG_XEN_PCIDEV_BACKEND) += xen-pciback.o
>>> +obj-$(CONFIG_XEN_PCIDEV_STUB) += xen-pciback.o
>> While benign when added here, this addition still doesn't seem to
>> belong here.
> 
> My bad. So, it seems without CONFIG_XEN_PCIDEV_STUB the change seems
> 
> to be non-functional. With CONFIG_XEN_PCIDEV_STUB we fail to build on 32-bit
> 
> architectures...
> 
> What would be the preference here? Stefano suggested that we still define
> 
> CONFIG_XEN_PCIDEV_STUB, but in disabled state, e.g. we add tristate to it
> 
> in the second patch
> 
> Another option is just to squash the two patches.

I'd suggest to do so, but I'm not the maintainer of this code.

Jan


