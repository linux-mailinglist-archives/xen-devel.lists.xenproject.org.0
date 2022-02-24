Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A80A4C2FBF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 16:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278421.475664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNG7K-0003eS-Ld; Thu, 24 Feb 2022 15:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278421.475664; Thu, 24 Feb 2022 15:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNG7K-0003bq-I3; Thu, 24 Feb 2022 15:33:18 +0000
Received: by outflank-mailman (input) for mailman id 278421;
 Thu, 24 Feb 2022 15:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNG7J-0003bT-3q
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 15:33:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15835989-9587-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 16:33:15 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-4xyFhZQBP5GrZvC_bxdEHw-1; Thu, 24 Feb 2022 16:33:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7251.eurprd04.prod.outlook.com (2603:10a6:20b:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 15:33:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 15:33:12 +0000
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
X-Inumbo-ID: 15835989-9587-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645716795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5R+2VHDgppM3rqEJHDSmmHWwmW926pYrHshAXwJO0TI=;
	b=VCskZ45bnCI31dJgICOZGgHaaIOEGNs6n9O+B98LRQBqrzOYLfs3wSjVIw7kt59In6Em4u
	V3U7l4pscawH/54D3933Af9HSIT5rAmoFnZOI+lh/4K9HucRE/MLU3cdy4otAtFYwKRleF
	0Kld9DmRDnLd4bdNCUd00nrw9Wd5vHo=
X-MC-Unique: 4xyFhZQBP5GrZvC_bxdEHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zdhe+Bx3volnoZRlaLnkCg56S6VMwEi0rUC7K3si7+icakx6X28fpdZcAcDbNSEflbZU9FXuT0QBONn/Nuk2Hijrl/4kMvSpXG/VWs99mqAzEonpp5GuS6wktmfRiLWwi8zV6Fj8bHOS0zgOm2fSYACjO2VQ0ZSO0ptuMOfNWpceM7bzwrmmg5Rz62RijcuapbD1GPVuREiZOCtzozc9Y4clAC6F1m3ieAwF9/pKe0B6Pf55xVqtCZS13aRmaraiEAOkBeCx7aVtOprCn02qZyOMZ0tkpH2vaVwGvmezDFSz8ouoClHWPAI9FJbOaN4YPPWr4PLALuMK6ZlnH7Etaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZrrsloNWEExtgxPvaYwMkJWXAdO/XFAyldvEfQrlso=;
 b=HyHtJxbo2AZhZshKs+xsmgokCf/AHwfGtR/hTKN8TZJ+44Zwxjcpq5AXIYPoiCyTMEvnyZQmxYH2VJVQIL9vrjXjjLelA5Ebg31kytrxZkfDrm1zikWnIrJWxd7VlpupvU0K2M/j5TpTZPUbeqXcJXMVRNgJb0g0uH17+Ux0orVZh6Oelpnb3C+sf1eJa2D/vIJIaCJdfGiXw+vNqFaNvHCCdgWURdqB3dTwB/TN/NJpd6mxQMe1o2Io3j7orCeuq/3P9ljPE7xrT4mvjJW3eMTscgI0WJr3Mz+Q2EA1mPHmExxd2KpdyjCvpKebFJA2Mx1ASbWzffnYvQa2NaLWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81d22e3f-6309-1141-0af5-00a8231a7b56@suse.com>
Date: Thu, 24 Feb 2022 16:33:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH RFC] pci/ats: do not allow broken devices to be assigned
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org
References: <20220224124344.86192-1-roger.pau@citrix.com>
 <3eb5e059-b37c-27c9-5c1b-0ed92b9edfd0@suse.com>
 <Yheb8Z2oNwypwHFd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yheb8Z2oNwypwHFd@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0045.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a3c79f5-5d3e-437c-6c47-08d9f7aaf7ec
X-MS-TrafficTypeDiagnostic: AM8PR04MB7251:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB725147A550CAF6DF6541C54CB33D9@AM8PR04MB7251.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ErFPgJHKQpl+yXCn556PBpDohjNNZmhUmL9kEr/iCtq01m5E/8HFB4s9Mbv18M7q5DpiVpGKLyQKr8kFWvL7nyt/GzA68JWNNe6l8Zl+F/mQ/ptsdIx9VkRQgl62L9mKlOeR8ATS9/kAmYVv1ZX8Pramp0WFasJWer5aZG4bNeBv2CSQj0RAOzt5vNz7zB5OLrUBWS8hNhFwu1yFWT2Vtx4Yp8DorCrg2EcSqAoITFylKIhZqbxM/FtkKkSUXkwZ6sImki1vOle6+yQ1T8pAowZH3rSac72RvMNtq84y71/FdfPocA/aiD+1pLIE0gfUI/ydAK925CQ0dPocHDZCWSTkHitZcckTI06W0PvC5ql5F16mG+5RL7oFnqJpq6oHwz1V+m4rvaPF1vzUr/eC6yveJThxqcdXnCU0jk7FEEY+bW69dG1RpXUeU37wVFaGxNLPSBodaqH2UwHW+eL7wGVSMYB+c97cXkCYWhOXeAOJZEYmDCj1QEEp3rx7MTmlLK/zcs/snLiNNNbM23ouySvsMGNuE04P7iLMirMNIaSj05seVP/j451sBkCDXWcH7omOp81Y56eiWjAT/G6jv3uLTAQLxCeqnWUijblhBaElGPJnhpt8sn6vhdGJ36AeANvdJJoerFl3kIipkUkrJegl7DkWfdVxZ4nWQDw89incMvwkS5ojl6LYC+LaZV3mbKH18h1P1+qheX3BxyT1G5SzOrcmrX4Wo4fvberrTt8NzRT7nrma1yl1veFwZ5BQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(6486002)(66556008)(66476007)(4326008)(53546011)(8676002)(31696002)(38100700002)(6506007)(2616005)(508600001)(2906002)(110136005)(6512007)(54906003)(186003)(26005)(316002)(31686004)(36756003)(7416002)(83380400001)(66946007)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rs7K2R61kzTJgfiv7ssttN6zx4qsjjWO7GyWDUiBDIaz/tt9VWyDYRPs/7T0?=
 =?us-ascii?Q?d3fQQsFwVUrHJXgpnP8YR1mXt0YdMSybmSwWBLqZWvP3kCWmiiZdFFSYZnqz?=
 =?us-ascii?Q?DqYkS8Y54yCA9QjGTLqz1vKsmGH/buuuMQj5PjUsGEeE9nTLPmeozHV7z4lc?=
 =?us-ascii?Q?n9ffjTyKp2ZdJYEfTVnE9og9WW4ZPAnyZeWHQDbelwH3AbcLyZLL71FcNabi?=
 =?us-ascii?Q?JiRB3bsNv4bRI2snzDm+r70sweHJk0h8SVKScBWNxY6VE4jhore0ez+XkIz1?=
 =?us-ascii?Q?KHlRNkQZiUsPAyxPApO21WRudyPEyJ/xm6pQ/8PmIzm4Tsx7SL8uKbqAXQ/Z?=
 =?us-ascii?Q?HELmk7hhZNksb9uFYj1OarqpFnRhu34+/QOA9jrMOykKOIPG0UejLOLd4jPq?=
 =?us-ascii?Q?5fsrVxUOn6nIe2BeGDYsOfTjlFPMvM6Acv/Kpa3YriIG6Kp4IJ0hmAhSfrDD?=
 =?us-ascii?Q?2TXFsHqR2WVwLiKrLa0IYw4Vo2HxPoj8ZBhiuSLmjvx2XCjjUeEl4i2AlyJ2?=
 =?us-ascii?Q?onobCNMcehMp3XHrDdJXZZSxNX8VVMvH0h+KcZr8JtFZJcXdqxZcCA8CIJyY?=
 =?us-ascii?Q?6NtzKBRfycGicaJjxeDoIBuhlCujR8tAshtRgKsgTbvtGfVrqCB+l5qJ9xhE?=
 =?us-ascii?Q?KSNWBQEYwt4/BDEhUaHHIiz+5y2is9Id4lX+HUb++2qIqLoJQ0sRk1wSNFSI?=
 =?us-ascii?Q?9lQ2z9AItAxX6mKLA1Efp31qEk99kbx+ny1N04gz9lPwRrVNRcHS7L/jfauR?=
 =?us-ascii?Q?ixT2gKhmph6yicSWMDtNkkrVd9F+KfRlqm+natnP/Kg9jKZ7eWzIHIAcz7wl?=
 =?us-ascii?Q?EMIbAgaRn+rarVMD5R+u8f+NOSvm2TWEaraMroxyTnwFLy6E9BsG1e97whSs?=
 =?us-ascii?Q?s8bGQaa0Z8P6mZIspsj9K1+kKCOgy1H7WpIhg3oLK2nwh4aC3mi0EgaHGAOP?=
 =?us-ascii?Q?I83diex2hZjgK31el0cRGah9F43F6h4sHiwUYCImdMcWEH5iDMiBpvhM35un?=
 =?us-ascii?Q?8VmL8qszFxVT1tUwibsfweFWMIpOblEw17ktHJ539XofPEBzm2k/0prr3C8M?=
 =?us-ascii?Q?Vm6ErNZGjiy4RwU64LgSipUa8zYCG2Sc+/oSEKVg9axx5L9I4b9zGqNBPsjC?=
 =?us-ascii?Q?77W0irToS4NVaFx9+gQEhGlKS9iDMCwbsBv9aTV6RmGt4QwYgTmbP37whORt?=
 =?us-ascii?Q?MSR/Cd5XjpxT4yM+WCnm8u+1H8JkVhmaYbFLh5+HL7xsdYCaEOu3kuO7CX82?=
 =?us-ascii?Q?Fsg2hwPwgclpYF4aSl5MLgzEYpUYWbabpmor119cvURvV4mphADqp8lvRGxt?=
 =?us-ascii?Q?7/khlzuZ2+s6sIgnZh2jEO/h+IkbQSlpbazI1zt5qGApwMNiTqP2hjgV++ym?=
 =?us-ascii?Q?rW8GlMrAzEG3fWpRAss4PrkbCpr+sXP5+705KfgcnA45njsFT76a5GNZFwLi?=
 =?us-ascii?Q?xr7faAc+w0jXp/gc3IwjJqCld8jvAVL8M49+3z78NKMvDoASUYaYpv6xsr6A?=
 =?us-ascii?Q?77P5Lotnhv50buwUrmhs0nHBN1TrZvaZNipqhh0MWyz4zy0Eg9HnJ06ifd05?=
 =?us-ascii?Q?vEtdcPeAw2BJhu6XARsaGrN/2oQWnzMhJTsHhy6P7aQGWq/R4tFWqaIiwZOo?=
 =?us-ascii?Q?K8VyIo/1IFsIHcuv4bII4nw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3c79f5-5d3e-437c-6c47-08d9f7aaf7ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 15:33:12.7634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jRovZZWxxabCebGLzcZb8dffiGfn3xzz16zzI6spUvtTkiKMzOjXKAdGaqsMfj/GXPWExl9KhdxfaqRU1rROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7251

On 24.02.2022 15:53, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 24, 2022 at 01:58:31PM +0100, Jan Beulich wrote:
>> On 24.02.2022 13:43, Roger Pau Monne wrote:
>>> TBD: it's unclear whether we still need the pcidevs_lock in
>>> iommu_dev_iotlb_flush_timeout. The caller of
>>> iommu_dev_iotlb_flush_timeout is already bogus as it iterates over a
>>> list of pdevs without holding the pcidevs_lock.
>>
>> Analysis of whether / where recursive uses are needed should imo
>> include cases where the lock ought to be held, but currently isn't
>> (like apparently this case).
>=20
> Well, I'm not opposed to that. I think just aiming to get the current
> usages analyzed will already be hard.

While I fully agree, the decision to drop recursive locking would better
not put roadblocks in the way of adding locking where it is currently
missing.

>>> @@ -1487,6 +1487,11 @@ static int assign_device(struct domain *d, u16 s=
eg, u8 bus, u8 devfn, u32 flag)
>>>      ASSERT(pdev && (pdev->domain =3D=3D hardware_domain ||
>>>                      pdev->domain =3D=3D dom_io));
>>> =20
>>> +    /* Do not allow broken devices to be assigned. */
>>> +    rc =3D -EBADF;
>>> +    if ( pdev->broken )
>>> +        goto done;
>>
>> I think this wants exceptions for Dom0 and DomIO. An admin may be
>> able to fix things in Dom0, e.g. by updating device firmware.
>=20
> Doesn't a device get assigned to DomIO (or Dom0 if not using quarantine
> mode), and then when deassigned from DomIO gets assigned to Dom0?
>=20
> So there's no usage of assign_device in the path that (re)assigns a
> device used by a guest into Dom0?

Well, this assumes all tool stacks behave like the xl one presently
does. Which I think is the wrong way round: Making a device assignable
should be "deassign from Dom0" (implicitly making it land in DomIO),
while removing a device from the set of assignable ones should be
"assign to Dom0" (implicitly deassigning from DomIO). That way (I
think I said so elsewhere earlier on) libxl would also avoid the need
to actually use DOMID_IO explicitly. It using DOMID_SELF like done in
various other places would seem more clen to me.

Paul - I think it was you who decided to make it work the way it
currently does. Do you have any insights into your thought process
back then which you could share?

> Or would you rather imply that pdev->broken should get cleared at some
> point (ie: when the device is assigned back to Dom0)?

I did ponder this for a while when writing the earlier reply. But I
decided against, for it being a functional change: _pci_hide_device()
currently is also sticky. But yes, in principle if a misbehaving
device _can_ be fixed (e.g. by updating its firmware), then I think
there needs to be a way to clear the "broken" flag.

Jan


