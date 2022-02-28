Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B604C6D79
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280535.478504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfo2-0003rK-UH; Mon, 28 Feb 2022 13:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280535.478504; Mon, 28 Feb 2022 13:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfo2-0003oo-RC; Mon, 28 Feb 2022 13:11:14 +0000
Received: by outflank-mailman (input) for mailman id 280535;
 Mon, 28 Feb 2022 13:11:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOfo1-0003oi-CA
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 13:11:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6b3f615-9897-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 14:11:12 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-rQ06ts_1OHagxddGVVvKRQ-1; Mon, 28 Feb 2022 14:11:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7229.eurprd04.prod.outlook.com (2603:10a6:800:1a3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 13:11:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 13:11:07 +0000
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
X-Inumbo-ID: e6b3f615-9897-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646053871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kD0aGtyTjlr11TReNGT/7qP736xzv7cfeHhdIJ/IuQE=;
	b=OnxM8EAIRGcs6B0ClomdquI+CQwM5/JGH7qkhqGLizXlb4zvhwfXRZglHQKHrrOrgan1F4
	1upr0pHkscRCPQ9Zvv3OfHXKHc9J8TGUT+s+Rths8yi7Y6JG3v3l6VQ/H9vO8QrufrWlBt
	aF/eEInqW+joVJ4eEPMTcws8egnAsjo=
X-MC-Unique: rQ06ts_1OHagxddGVVvKRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxKxxDxPHpb+wAV/hYlwHggDn6AuIXbch6D6RMbM9defQ+e7idbDApS7/myOeHp6+0Z0hV9ZtmE4sZJK9943KB/wRyAhOd9Q0TiBVD42W2uYld5T71C7fp1dvHRqCUPW630mC1Qan3tMnIsENX7BF6KAvACJLglACz59D0dekEk82JZ3ZWFVeK25WiWLwxjsp8y6Zc048Vd8qKLpRPDsv3p/by6h4Dy8xcTIaGTuc2/wtR2qi9oxEM08sQkEk2vBX/QvGlzzvcQYCiDrEkTp5y7uAXtomBOXpPWmGIHif08wL/TwF8tT/CdwXBlmur1WxmBYZQBXA/7VlpuNc3IAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qZHvWeych6RhHN2ubviait2sJiMss69UsUHHbRKn74=;
 b=mqgPpgqiL2vFdC4FCLfXFQiprvjN/LcS5FMsDuWoMst4X5Siv7sGg2L9GYNvsx5w7HOGAzEt5gEgErbQ/37Hy2+fYeyqS6ndeeXQtSn5ekiiAY9D5zAqsaJMPAhMa5W1aM6Vl/2Tq+AV0/Y3EbX+oiggpXrSiUZCJ7ov3j+x9HMsQjNA3gktuVrsmvTSOhXxtDK4fX8esK+Z8CW1y6tKwB9C+VZZxbGQOXdXJdqjsOp1bNhdCxZmUjleAciQLLAvA5tTcTsz7S+fNQ2FkKFMKc3K1EvfqtJBBQlEWVIp9K6qQ+CYhIc6zyF9eW1YcjBKm3xRkvbPW5e0fjz8RsBOAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9aff51c2-0e8c-685c-7bff-0ed7ff7347c7@suse.com>
Date: Mon, 28 Feb 2022 14:11:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <YhyrAyxhNtNWi7NY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YhyrAyxhNtNWi7NY@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0403.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfd78576-181a-4649-5eed-08d9fabbc815
X-MS-TrafficTypeDiagnostic: VE1PR04MB7229:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7229DF5214354E237682A488B3019@VE1PR04MB7229.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CInelCzg5KB9JYGPFzFF6B103vGLeNRih1/obILHvCONuv44HLIOz5AIdvo5i3xdyrNrVzsp9r9GaN/o9wnTYwQzc8zEnUcIQX0lhgOF/UkfLOjyHkvg+m7ZlcFMxNOpdBWUx5hPwISwB9X4GC+kzhUcCJ7B7mPXfYFD65HRaPu8YF4t4B6R8DmG7ZoRANhwUnSPuTl2zKwE9OqhHRIbDR7Tjxss/xdqiUHF4YOdHjM+d/rNzhvXR6tgHy2uZNA2l8L6svC3N1gzetria/cwjY5IcBZVEutjQ/bRsfU4C52dajN9b32UR6S3/zQ0dfJiUKaUtM3wi/6lZOv9Pi1d/X3n0rkgOPkqEpGhiPMTJTrvgKT/OcOZD8f1qk7sgbsM9UUiNt1oJwwrLVREHnSVu974Vb27/OCt5j9EtmSpJTPQxYMd2OSG15YEA9UaTrO6KQKToK63nFERqfDBemOlJtCmDfkwT70uJzSxim5swgDNX7m9H/6pdPycZ3kujUkUD3vyZFAHTATzLRYvr8HOKJZgnDrerG15iAv9pc1tuZql7rAkMBaDMHRjc9EIrL6GOwiRaphsfFbOwFJZY/f/D1CHr7OAtAnM1wSHUAF91DEcHJ9pE4iRaUjN/O++qB5WQMX6tnCO7eBvTxMQKU2HDzuH3G08BXovE02hMh1rwpoeMiHzXQafaAzE454OxbzNbIBAWZ+mArNoMogxEd440u4S9IUs5+mCIY2p2gMFH0J2uKdj8El1q81rI4ftUeYt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(186003)(4326008)(2616005)(26005)(83380400001)(2906002)(5660300002)(36756003)(7416002)(8936002)(31696002)(86362001)(6512007)(316002)(6666004)(6916009)(31686004)(54906003)(6506007)(6486002)(53546011)(508600001)(66476007)(66556008)(66946007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?okXwB14W9cqLkawTOglL8jpJg76wgisTiY80odOsAy+m7/rzHp1GzV+AqfPj?=
 =?us-ascii?Q?+VR+JZ47Fh5PyMr496SRSpo6knO19fst8tJERVvHNBlF/s+3Fjb0YhC/HMgf?=
 =?us-ascii?Q?qzr4TuU7+9l1JC4cleZoNuxpwUc+UEXPHeCDYbFsNMw+Wbvqmvb+PQ9Zs3CW?=
 =?us-ascii?Q?B6RW1wN9Nn8Sqk/cSR2Zo0GaCVa+xw9hyuvxkn4udXg6mvCf21jrvucNbUxe?=
 =?us-ascii?Q?2xWKSVc+txIfj31xDRYR8BayuQWvS5JXlRdq0Cq4zD/PmqSrISxgK6tfAiOl?=
 =?us-ascii?Q?+WdezSSDtrN6oJbYbjO6z2K0na1ydHn3Q0RGrpww6AsE9qV9VVqQ4gTVOlXP?=
 =?us-ascii?Q?6H+w/w7K3UmX9z8pn+PFQxKhYNmTPF4ufCKN7AwLay9/G/3cG9gHE3xutdE1?=
 =?us-ascii?Q?8946l7ta+tHrgAkLRP4ntq4wHtWciY7xIjFuDS+mD7bVH/v0oVfwd/7gNEr/?=
 =?us-ascii?Q?QUl0062XyE5VS1/5UqigH4cLtmaSDFg1P/wab++mAufsYWquXo5LgKOJuP2D?=
 =?us-ascii?Q?hP1i0oIPeo3TXqeFQ7wMn8qveGF5uwkMXKRJ7puzwAjh5hOUrF3cD5xIyVkS?=
 =?us-ascii?Q?BVG2UCHA8xheAI8hpJ70wl8tcrJtRb7sCvVhtO0tIdLJA/jGTADsEQHikTyi?=
 =?us-ascii?Q?jZygmx+7CxnWwwzi9APlrT+RjAAVYruL7XlixDMs9Gt40NPK0ayHxHdPOiYQ?=
 =?us-ascii?Q?7JYhuny9mqO2FyPphPs3VPmbV6p54aBqNAs8XuPwo/iaM8ScHsfURbqp0tdF?=
 =?us-ascii?Q?O7YNYhEmm6u5kiTSEkuAfReEYwIyqzPUfvPRVqEphQeH+n7BNZzYR89cfe7D?=
 =?us-ascii?Q?gH0XG8s7fqsR+xxTeQhg853DabO2bcJBoAlr5CS6cPrjjwqciaDJKIOnJWGr?=
 =?us-ascii?Q?gemFFhvjomrL6OGJZUheBMPszV9Pccj3BvjfcNA3bMvXdKABfa6aLmQ8iiT8?=
 =?us-ascii?Q?xMfnvMTSffwC+LUauzb5K4snTCt4rTAx0O3yaNcClG2iaJ3cCbfeNN+/9UjO?=
 =?us-ascii?Q?sOayjys4cALbd1beDxWIrFARpApHnHWwDQos1JHgSbozh1LPRrfnYU2SKB6U?=
 =?us-ascii?Q?CusDgyBfwf00Eckbspyn6UfGx9OKrFfqHE64inOEfY1ND/GUT7ogcITU+7kt?=
 =?us-ascii?Q?cbbATFMQhvc12nG9Mm/4tb2DkTlc8hDiiAWDJzDxUw9h71aAwKkZjKdCwziy?=
 =?us-ascii?Q?Dd1YAnKw9/iBuPTqYaTEz590HVmWjLOQDfuOMniLxYcz/wTpeIJOE7bmDVNi?=
 =?us-ascii?Q?clLjiif9qGrhpqZTl8uco23w5jXalHnukM1fBUqzcmK4CKPvgMh/oXRvTcTE?=
 =?us-ascii?Q?8753D3+11m40bQp2aVXuSciagQ3+J3//7Au/o5IOuBgGB+ItjTyRF8rNnvrz?=
 =?us-ascii?Q?0MENEXwTKoQQ7l+g/lmACYW7fsSIlw3cyGBQ4dszkcMSJPLdS9zwJMoTCoPn?=
 =?us-ascii?Q?ymaJ3bHRnKl2Ayw3i8FfSTAC4gJqjPMQkxtzN7VKkmQ+LA0m7bt98VbBmnmD?=
 =?us-ascii?Q?B7gHOHY2F1zVKti/FtD/tcEf5v1+C2paMGBCLVQ8O84gnFK83rmheBC1dBjP?=
 =?us-ascii?Q?ZpWcna9doa8QpcfFFZ7GIq2cdAVOeII6rPwAOcwnfZL5OPnS/FD/EbIqSLKP?=
 =?us-ascii?Q?RGCUIraZUD/Df/SJI3+yK9M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd78576-181a-4649-5eed-08d9fabbc815
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 13:11:07.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nphEnF64kTJ8lQui2hr3hO/HdVGaiCwpluWf8Wf0Tir9ORbPx7/inf2cdoGmkVjW3shWaDJIlcMLBhEnJVT0gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7229

On 28.02.2022 11:59, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 24, 2022 at 03:08:41PM +0100, Jan Beulich wrote:
>> On 18.02.2022 18:29, Jane Malalane wrote:
>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>> and x2apic, on x86 hardware.
>>> No such features are currently implemented on AMD hardware.
>>>
>>> For that purpose, also add an arch-specific "capabilities" parameter
>>> to struct xen_sysctl_physinfo.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>> ---
>>> v3:
>>>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
>>>    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
>>>  * Have assisted_x2apic_available only depend on
>>>    cpu_has_vmx_virtualize_x2apic_mode
>>
>> I understand this was the result from previous discussion, but this
>> needs justifying in the description. Not the least because it differs
>> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
>> vmx_vlapic_msr_changed() does. The difference between those two is
>> probably intended (judging from a comment there), but the further
>> difference to what you add isn't obvious.
>>
>> Which raises another thought: If that hypervisor leaf was part of the
>> HVM feature set, the tool stack could be able to obtain the wanted
>> information without altering sysctl (assuming the conditions to set
>> the respective bits were the same). And I would view it as generally
>> reasonable for there to be a way for tool stacks to know what
>> hypervisor leaves guests are going to get to see (at the maximum and
>> by default).
>=20
> I'm not sure using CPUID would be appropriate for this. Those fields
> are supposed to be used by a guest to decide whether it should prefer
> the x{2}APIC over PV alternatives for certain operations (ie: IPIs for
> example), but the level of control we can provide with the sysctl is
> more fine grained.
>=20
> The current proposal is limited to the exposure and control of the
> usage of APIC virtualization, but we could also expose availability
> and per-domain enablement of APIC register virtualization and posted
> interrupts.

But then I would still like to avoid duplication of information
exposure and expose through the featureset what can be exposed there
and limit sysctl to what cannot be expressed otherwise.

Jan


