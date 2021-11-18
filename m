Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C354557D5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227238.392961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndVu-00048N-65; Thu, 18 Nov 2021 09:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227238.392961; Thu, 18 Nov 2021 09:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mndVu-00044u-0g; Thu, 18 Nov 2021 09:15:26 +0000
Received: by outflank-mailman (input) for mailman id 227238;
 Thu, 18 Nov 2021 09:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mndVs-00044o-2m
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:15:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ea733a8-4850-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 10:15:22 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-i8ueb_0WM1aXLys9wyoc-A-1; Thu, 18 Nov 2021 10:15:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 09:15:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 09:15:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0372.eurprd06.prod.outlook.com (2603:10a6:20b:460::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 09:15:18 +0000
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
X-Inumbo-ID: 0ea733a8-4850-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637226922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/enDxBkCcmQSOEP2/JG57BnuVcoOjEWJNVfYtVs7ag=;
	b=dUk7nu1pn5AJ/QBb8npNbWocZgte2e2324A+BR4/5f5OYQbW8pIcYBDc1ZVA2GFJ47w8r2
	JkVMizNfsCZJxw5YN2BtbbbyJjf0ZyTj1J++SXwYEbloT2n2FQiC6B8L9ZpiLd00NwpjEe
	4WJAx53UcCoWfrQ3hZ94G8itdacfjCs=
X-MC-Unique: i8ueb_0WM1aXLys9wyoc-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OL4FbTt63J8xcNHP+zIj8mBPRkqra8K3lwcXCMrzM336gSAduXbi+KxqK0yeAm0CqI7/AwtpWYN5lsc3rPhdk1u/u51EglsQaKOF48k3bX2o2cdfZ0yTT6+LSJJf+1UGwiQ9pz8dC4XL400dzAG+VjQC+AvLORnqoEJe/bRpKvJ0wnIRkj22gO/2h7MThBolZg3h5ermtOQL2eYaH8P1zrN6aix9SkZfRBdoqXk1ELTJ+TJx0VaPscpBu8xcMfDbwPndza0OBBVWoNZFZbhPBAjGqRBzGwKFc/vIGPT/OVoJEvE8m5Vddhz1BABd2evk1M4fxny6n4P8PKBvg7pwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/enDxBkCcmQSOEP2/JG57BnuVcoOjEWJNVfYtVs7ag=;
 b=VMXLXz6VGc+VVY5G0CTPi6HCB4NVF1D7qfhwA7lc2oAYlzg0n2SHYaIqrIJFoOUqmj+JxC8SLFQUvCC9/sD1KSRuL6wrAehJQhgp79WRVWC+lOk7/5i4WgOGfI/LOkAPDxyaY0aV4Z70E9NvRrKNh84LZSPNjcYLJxxOJn2NnhjeQ2wAP0mgOGaW/IQPQnZAQAz0ISbjAxKu/0OFR91V5z6p16KQe3VQtxDZsBeumwrdFpA0DJFb+ipQGjhWY8VFViRWL89YgQRU0/GPMUGLkbSPjc+WtiiyPqEs3UA8cW9m1mcCZcdZPagi6yqe/s7sPD8uv0koGIYw8renxXfH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
Date: Thu, 18 Nov 2021 10:15:17 +0100
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
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0372.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79332b5a-8b05-490e-18e9-08d9aa73f0f2
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037D40BA18267AC77753843B39B9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qL99KDh+MPHivocKMU8p8FdrhMVgJG2C/XUoP0kegUzSVu76goimkr2z9TWcsQdHuAM+F/RV0xdfuRQKRXKVccW/cgnUcge6hH0iYxjhKcD/5OVaWHtPK0F/N1XpGO4XfZT2i90+uZ4CgT+gwuLPOO9j8auV33L6yEWNYDxRY2/7vAm1vEda8uOSxJ0oy4FIRHdqQIvtWnzvJDxEn+OA1Mt/rQt7br9AG7d1Nb48r9NSSYCmN93di4zPJSuSFdAmhGPC1O86oTs+ab5xZvdgQjGrkJznYr3gIRFWfzj9IGTatnnTqdthJinnq3EToSjkx4T70gl57OMVuMGx/hWmLOqG8yoSSTELnIoKaCDfCrgAVFwDP+SZd90nQquPtbknYAGDrRV2X+u5ILPYT4y6MtPGS47HVxPdHuNARBCDR2PcHqM9sIwrNaUnC/50AptjZfRS5O+0A83uoMIpBz+pvR3DNBrUHs8MFgI7fHyDpza4Sp6kWbOSZHaN2aSXo/RoPA6V8/YlpcY/w9FKrsJOebw80uCORzbIpoW1Mfk0RQPwRZb3lIhGVqb1rqPwsUE4rdrH9eU6oclgsGVmvtN0kD30YXZMH35OHbfHs9dUpzjE3eFCk9m3Q6DNmE3c7DJOLqCVB/iJbDSaBtqpWKAOuOa0yC7sVkdlDD6tnb4hs0MHW3NWm6blMBm90R4iNVO9YZSGkZm9xRq+JlpFfwfusk2WWT3fG4Zlv8BLBVCZaIqxvrW2sErDH2b+UlgdLVxv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(186003)(54906003)(86362001)(53546011)(66946007)(16576012)(66476007)(956004)(2616005)(2906002)(6916009)(66556008)(31696002)(31686004)(7416002)(6486002)(8936002)(83380400001)(38100700002)(8676002)(5660300002)(36756003)(26005)(4326008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk5Lc1RWczJZZDlLM0V4VXBpekFaWEd5dnhnZlptdkw5ZUlqakFHVWR1Q3Zh?=
 =?utf-8?B?TTJVcHRiYnFlcEZMc0pwZS9nTWgwT1BScEFyVjJPNmVjTHB6WXY5Vk10OEJj?=
 =?utf-8?B?aUNjeFB0TWZFN3hORjltMi92anZzSHIzWDNYQ0dXbHkvZWtJaUc2cmVmUk5E?=
 =?utf-8?B?VnFVRVRqcU5DZWhPc0NIOWdCUldZSGtOWGF3KzBRWGdjMDVPSXVVQTB5ZGQ1?=
 =?utf-8?B?WGVqYTdEZVhsanJsVktKeHBSRmx2aDBhZW5vRXRFTUVmNTlIUDUrWFhLbzlY?=
 =?utf-8?B?bzFSMGV3bVBvNVltR25BTmVZS1FmK1h1ZFVXY2RibGMzZlNURkU4aklFbnFX?=
 =?utf-8?B?YjI1aVVYaEN2amhOUXRCSmlEczB6WlA5Ums1SEM0R0NaRkJiYVEyTW5BWjVS?=
 =?utf-8?B?SWFITHArajFtKzl6bm1tMzlmTzhXQTdNLzhidXY1eERTa2pmVUZTVUVIQjdQ?=
 =?utf-8?B?RFhIK0haV2ZpL2VmUEEvVXNnWXJLYTBJNDNBbTE2anlKaXpiVjVUR3Znb2dH?=
 =?utf-8?B?U3FrMHdKUVQ2UW1aeDNFZCtTZURseTdaZzRTdnZGNUdyQmJVajltbkVVcmpH?=
 =?utf-8?B?aEVzV0JqSjBZdFR0eEYrSUx2SmZ6ZFFoQXNDSzVCZERsYTg0d2xlMmF0TW9r?=
 =?utf-8?B?ODlLWmdYSzZsV2VSb3N6ZDdtZFJSTnRlYzhKb0xsWUJnZUdHcGpvNzZ0V2RR?=
 =?utf-8?B?Q0ErVjlDbmkrdmlZck5GNDNwanNReWxXeEQwRjRPSDFpV2ovZHl3eEx6YVRq?=
 =?utf-8?B?OXc3d3V3TFk3UDJrYjVBdWR5dEIwdExIYXFURUpiamlUNDZlYVpaMUMvc2t6?=
 =?utf-8?B?T0lub25sczlLcFJZRFJmYVFrYk1DNHJIQlhnKytsTHVGYnI5SzQ4TlNwSnYy?=
 =?utf-8?B?UlJCdHFybDg1VU1DbGptbmNpV1J1TU1sNURGSHNCSzNyaTh0enJzdlFZME1s?=
 =?utf-8?B?ckxwdENUeWQwd3dSVlQzRUtNMnlzNFhTajlhUVBHNDZETCswa0ZEMXMva3c1?=
 =?utf-8?B?dmdKS0V6STR2TU8xQ2ZzWlQ1VlZSckI2bDVibTBBYVFVM3FrSnBMblFLdkZl?=
 =?utf-8?B?M2FjbUhQZ3JueFNKMWRSV1ZrWHdwSXhkbTVjWWhaOHRnc1o0NkdPTU1BT3dn?=
 =?utf-8?B?aGtENm9lZjh0dStEVDE1RHVYSytHYThXYzlVOHRNRDErY2VMMHRqbmRzU0pw?=
 =?utf-8?B?bkF0Q3JHNzVkcWN5a3dseHF1QlBUQlFuL3lrc0hLTTFyWG9XMXFxdEZZRzQ4?=
 =?utf-8?B?MlFwTEtzRGxEWUc5NFQ1UEYxa0hBMXZJVHdtc0VET3lERCtMNnJjTWd5SDFl?=
 =?utf-8?B?Sk8xS25ENUZselVGMG9Gbm9PTmxmWGxvWm14RmJjRlBHK2h0Wk90UllxcER4?=
 =?utf-8?B?dkFKbE1TSENVRGRTanJNZjY2R2YrNklSS0xza21Pb3k0WjhqVGlPYmliaGd2?=
 =?utf-8?B?RE5Ic3FxZFZwV29rMVhCNXY3UlJDTmZPeEV2a2w0WGN6dml5aUtBczQwUmV0?=
 =?utf-8?B?VWxxMStVM3NXaEx0cHRJakwxQWlOdDVPb1c0dTdROERuVThnSkVaQkR5eldP?=
 =?utf-8?B?THIrTGNmVE5MZUgrZldaekhTSFcrd0hBV2ZYc25GVW9PY2tCQ3VXd05PMTBL?=
 =?utf-8?B?SG5jNDhjSGpyb2RrQ0dwNUoyQ3lSM1FOUXNsanFGdncyYkY3eU9FNTRnTVg1?=
 =?utf-8?B?WkdEMGFOWk9uSnVPcUFqbDJIRlI5L2R2RUlCUnhtUVg0RFh6Q2xyMXJnYzEx?=
 =?utf-8?B?UTBmMldpNGdHNEx1czV1UVJ3Nm9ic29JMGF4VlllcjRlVGhFMHRZdjFNQk95?=
 =?utf-8?B?WElqNDJuTWFjSDJScWtwN000U09XVHViS1NMRHhYQUJxUEpWQlZNRWJVNHBj?=
 =?utf-8?B?ay9hc2hSUWZwcFA1Q0tIczBrVVR5TGJzM0NPbHJVK0c3bFY3VzF6SGlMelgy?=
 =?utf-8?B?dm55bDlva0J2VEh6Y1l6SFNtTERISXRHUXNOcTdMS1pmNTFxWkZQUGlIN3Ns?=
 =?utf-8?B?Z0Q4VlY0VFc3ZnM1Y1lFc2Nvb2FLUk9pN2lDeHdNYjJQWnFyTjhFVEpGUEc5?=
 =?utf-8?B?WjJubGx4SU54Q2UxVURHKytPdEhqQlV3c0Z6QXlTa1JkQjBxeUZnWmFTNS9m?=
 =?utf-8?B?MjI4eTJWV1VnRUtwVWdOMkFtckU0NzROVjZ4eGs4bFhVUHo2SnlxRWVKQVI4?=
 =?utf-8?Q?OFjt+c3bePjdNeu9pgSa2lk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79332b5a-8b05-490e-18e9-08d9aa73f0f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:15:19.1154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXEBnyDPOS3Rd8VpMpOyC7ZIJJkVuyGEsONh3/qTGNGEPVnz48agcK1ICOnLSQL/ey/jt4m3aIMhV5Xp0Nuh2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 18.11.2021 09:54, Oleksandr Andrushchenko wrote:
> On 18.11.21 10:36, Jan Beulich wrote:
>> On 18.11.2021 08:49, Oleksandr Andrushchenko wrote:
>>> On 17.11.21 10:28, Jan Beulich wrote:
>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> When a vPCI is removed for a PCI device it is possible that we have
>>>>> scheduled a delayed work for map/unmap operations for that device.
>>>>> For example, the following scenario can illustrate the problem:
>>>>>
>>>>> pci_physdev_op
>>>>>      pci_add_device
>>>>>          init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>>>>>      iommu_add_device <- FAILS
>>>>>      vpci_remove_device -> xfree(pdev->vpci)
>>>>>
>>>>> leave_hypervisor_to_guest
>>>>>      vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
>>>>>
>>>>> For the hardware domain we continue execution as the worse that
>>>>> could happen is that MMIO mappings are left in place when the
>>>>> device has been deassigned
>>>>>
>>>>> For unprivileged domains that get a failure in the middle of a vPCI
>>>>> {un}map operation we need to destroy them, as we don't know in which
>>>>> state the p2m is. This can only happen in vpci_process_pending for
>>>>> DomUs as they won't be allowed to call pci_add_device.
>>>>>
>>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>> Thinking about it some more, I'm not convinced any of this is really
>>>> needed in the presented form.
>>> The intention of this patch was to handle error conditions which are
>>> abnormal, e.g. when iommu_add_device fails and we are in the middle
>>> of initialization. So, I am trying to cancel all pending work which might
>>> already be there and not to crash.
>> Only Dom0 may be able to prematurely access the device during "add".
>> Yet unlike for DomU-s we generally expect Dom0 to be well-behaved.
>> Hence I'm not sure I see the need for dealing with these.
> Probably I don't follow you here. The issue I am facing is Dom0
> related, e.g. Xen was not able to initialize during "add" and thus
> wanted to clean up the leftovers. As the result the already
> scheduled work crashes as it was not neither canceled nor interrupted
> in some safe manner. So, this sounds like something we need to take
> care of, thus this patch.

But my point was the question of why there would be any pending work
in the first place in this case, when we expect Dom0 to be well-behaved.

Jan


