Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F6542D2C1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 08:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209007.365331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mauJH-0000Ji-Mm; Thu, 14 Oct 2021 06:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209007.365331; Thu, 14 Oct 2021 06:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mauJH-0000HQ-If; Thu, 14 Oct 2021 06:33:47 +0000
Received: by outflank-mailman (input) for mailman id 209007;
 Thu, 14 Oct 2021 06:33:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mauJG-0000HC-2K
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 06:33:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a56a6897-5383-478e-85a8-7c55052c78da;
 Thu, 14 Oct 2021 06:33:44 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-f6blBYJHM-CsWXqRncd5aQ-1; Thu, 14 Oct 2021 08:33:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 14 Oct
 2021 06:33:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 06:33:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0395.eurprd06.prod.outlook.com (2603:10a6:20b:461::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 06:33:39 +0000
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
X-Inumbo-ID: a56a6897-5383-478e-85a8-7c55052c78da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634193223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3k18KUY7Mn8P5CtXXSuSc7R5hcBANkGDL8fbmqL+iw=;
	b=P94ScAkvBrEOw70SM6ieoDtVNh1tVABsosO1FF/AdsFjMoJNZn5sm/uq0JSOULhgp0DDnE
	OHob+y7RRWpXV5vOt00vP7u/AkDbwXpsupH1OX7bFw0tKx0DBph+E5cIOYrcMPLkBRfjGl
	pK/+ksqLW/SoxVNXv9dLKlG1g+sXA2I=
X-MC-Unique: f6blBYJHM-CsWXqRncd5aQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaoPtkfmOh7bkH2YLwSIIt5XFR1IDM+hUN6FuOfY3t5Mmg0gCdu5XbS9Wlixns5r7AeZtJf5K5VtmVveFyIeTkybJaRr64Q+ixQaIQRnHoZ5pKB9ihEQc5bQ+pXFkfh4V1a+Pso09riuywT0fSUtLCjs1fQVH83GTv050JPqOeMhOy/oUybVdlUk8w0CENEAPjhk76vjSNukdC/9Z6KzzlBT1bAo3zAuBE5tzSMtfDhbK4bhKgtwNGzIE7e1hTYhQ3XPGlNK76Qx1OrY/abGdRHiCJhCh9sMOUW4SIu1WBLzvXJWU5l/JPU1Z7zESelrWSyWXbt6pHkdyuPq5ZwB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF1riM5pNfGR8+fE8PW3t6daVf0J6gApoTEvMQazbi8=;
 b=TNoAgH9Tmcx/Zi22/pgshbK1/kbLLVIgPAwrESdpIZjCnYxBHcbypC0ocOjVQJNInYeudmFzHbRJm3M9xdv/cfLVh2G7+6DiNmKUvO4kPqdpU/9s6zCiRvcDh0mFeikueLtd75ORcBT8ko3H2frWShbfGWZXmRG9qZpeVEGCHS95qnCVNpVky3CkU7gNaeKVudIuuB7uxDZ1UZb7jXGcgTeNQBa7AIyxPKdVcvUQVL1uBgvMUpFDZmKJKrPhaIu/nAaU1PNRGAIHAihXFenBaVh/HuEVYbromfNEKEyY2Fv7tMKz26Dxl2n/WgyJZdytGDWBNoDUTQqrgImpyWA/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Andre.Przywara@arm.com" <Andre.Przywara@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
 <6d75f604-6938-b185-61e1-a6684d9fca14@suse.com>
 <2b943774-072e-20a1-b97c-d88b24adf340@epam.com>
 <ed4876ca-7384-42a8-6fba-e73c1840402a@suse.com>
 <alpine.DEB.2.21.2110131223210.9408@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa345819-068d-0049-f0e8-8b96379b4247@suse.com>
Date: Thu, 14 Oct 2021 08:33:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110131223210.9408@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0395.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9534a67f-b820-42a9-7fe8-08d98edc8fb4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270452FB50F543219B729F70B3B89@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8GL/kK9JFreNnKbJrts9HW1K9/fSv+xsh8vEz8XqyXwiUXPzSRxMphA9pZ1nfqY4um4RzTLXMQSUdQMzy1MTpNYL0dnyz+2+8qjosr2GFDBmf+G3fN26Kv0GSZWNjxkUXA//HA8GaAXex52BFSimGAaFNoQV8ep16qMCNturYNaFx7tU4ufM67CTgvm3WeVD6ZVB9Yj3nUcplfS0ECChYsuydbmKYqVPGZXAw5cg4U70SI/Br+gWlwGf3WD4JA4IQGGC1JvN7s7hdYHPNli31EE2mY28WO6Qi/G8uETjb7PbJYYh4Vz7J0cpopk9W9sxyqCVejS373vIAaGhup4byOuB9cK3uE2dvGc9yrMDVHzbAhipwles/A1sBlZ9fWBY33mQDL43qNwECD+gIgST/1F7flLkuD2iDiJihQ6IxKInTKQ6e6Acg1/llomRZXM9KRsZZ33RjxgPpPLRw5tKg670JmlyZnofAkXO3IKxLPQmr2k9/poxU+bnqa70jM9QvXsLPUbXNf93FwYoBHj/v6w/KJIPgUfmkBH6dCwtSDNlHvGBJb/fBI3AQ+frB8flr8kMbAPl4TC49tQ9TSBm05bBRC+x8M4fPx+f7dOMDZ6yiBKzUxbxnmPP9k9Xg8v0BScuZkQVunw9t0WzY3vVW4MEMvvUUaI/UhIPJAv6xva5D5mC13AFl6SMLdgyIjSA4EoZaFVDImEqtEgpDq5yvg3EgQ/CsRU25ghGvlRGUiokY2RN1o2ffdsG7yk606fh64PZ2yFa+XuXi8KVKGiYkF9s2+na7otSEogVAkdtHja8wpeHBNR2ls0833sST8m+vDqll3919AJJQqmXDDInZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(956004)(31686004)(54906003)(16576012)(2616005)(508600001)(4326008)(966005)(8936002)(38100700002)(8676002)(316002)(66946007)(83380400001)(66556008)(66476007)(7416002)(31696002)(186003)(26005)(36756003)(2906002)(53546011)(86362001)(5660300002)(6486002)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?znL4basyEOc0kfTiU9REtX3itGpAkVFfxr1R51RarFWDWnz2lVw7FSW5QauH?=
 =?us-ascii?Q?7uSwllCBrwFr6eQRwFK1vODOpb4P487mB6o02/WH3Tf9ZRVWpqmofCQp8b67?=
 =?us-ascii?Q?ThOnjx4VXawxp9gh8LDO8iOxlFcB8InfP0Jz1/fl/Liy3DpJX5iYGVKwba3S?=
 =?us-ascii?Q?pTYq2J6WxES6U2cXPQEqFrpfvd2kc3pyclE8zaelniYInDgpi3HYwykHqjht?=
 =?us-ascii?Q?25M/MyAJPsJXTH1TkNm7uNOHbaqYDJ//z2jY8kfnFV2U9YTaji9epJjY3UPs?=
 =?us-ascii?Q?r86Gv7IPCbvh7qHub1uSXYnslH+Sh1iVlNf7LN5euAc0TbhQZ8PgW8KgeNMl?=
 =?us-ascii?Q?PJIhupwrkEv4mHIVFknbWRQ+lwgzK8qamTuNVi+DTHuMV7CM08HRcpMDCfWS?=
 =?us-ascii?Q?7LG2qQH5WKw7bmcEfOUFq65FtqiUPx9sBZphI9mO0bAnx0eH/19aEI7pFtkc?=
 =?us-ascii?Q?1KJHyk9R4Xk+hyJYONBBwjbOdlDVoLvPQBQA73N++fcg5AvUg3ZWQuzz6P9J?=
 =?us-ascii?Q?ZhJG0HXOGaNl7VGFKc85yAPN0ZfhZDfri/eTV6KzN3g7TAvMcBda2YmiESHd?=
 =?us-ascii?Q?Bg7fHyXNP0Cuifh+iwdmgyIQMmmYP60kMoZ+DcsHy0CzMJgdgYjdVyOsoEWX?=
 =?us-ascii?Q?Z4n54vAnY5dVSp798QQCk7dcQINN+GnMKCy+nwYlOkV6J642ZTaFlqpVFR5e?=
 =?us-ascii?Q?2jNPax29EzIkqF8hbIChUumgfrXnQgLamOLAsyxBmdsm67IGwx+hjk8eYOZG?=
 =?us-ascii?Q?nQXF7tGnMroWyjfiu5PHfOGUD1MhgrXcR3XCyziACmP8t+wmwaYejWfBPvvU?=
 =?us-ascii?Q?gPG1gm2zqzFniKGwbEK38Yv8zGaONzyKIz1z9jIefEs+El5Ot29/a8OWGC9Y?=
 =?us-ascii?Q?LOJZswyRVNheFCjx0apSzSRZur8y2yPh4jXpnzPC7pn7cwqFkDlU4FYN+bZg?=
 =?us-ascii?Q?Df8lkPa0EqljTYNTtlxvJgM01BfcudL4Du2MBMwZcxTDxDBDkti0AVwBXj2G?=
 =?us-ascii?Q?HaDiS45PnSBs8/cHKQ08t1ZTTFCqLuCEBEgGVQR1OAHkvTnz0FprDPHElCpR?=
 =?us-ascii?Q?Bqkx82L8/hXBHfdAD3SSNGmWQo02Gb1VXrSzxr5Zp1ONwT85IzZMf3nu7ppy?=
 =?us-ascii?Q?xLSZ0AnY4WMHIUfIUFaczv7z52Qn8mpJSXHCOS3yLWo+av3n/ixQ+ew2idPv?=
 =?us-ascii?Q?BbI9yUCM1fdeJ7WUibNVRrqZo7BKG+6e9zMxyedvg/0lU8LpwpP1rq5BauLE?=
 =?us-ascii?Q?g3i28OrQ3ziOvPZimmDpuF5D9ss5iWcf9prGeZ2kUkBuViTWqxw7zDBc5U6J?=
 =?us-ascii?Q?3Cq4y/B0ImKYikFXUYP4dkts?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9534a67f-b820-42a9-7fe8-08d98edc8fb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 06:33:40.7794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npCqxm72KoJ6FTjmj+vbVnNkI45xRL/cNak7GiDjkZANa/NdxYGmAPaiU/J9PG+GXrg6oVJrCpxOZy5RD82RuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

On 13.10.2021 21:27, Stefano Stabellini wrote:
> On Wed, 13 Oct 2021, Jan Beulich wrote:
>> On 13.10.2021 16:51, Oleksandr Andrushchenko wrote:
>>> On 13.10.21 16:00, Jan Beulich wrote:
>>>> On 13.10.2021 10:45, Roger Pau Monn=C3=A9 wrote:
>>>>> On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/arch/arm/vpci.c
>>>>>> @@ -0,0 +1,102 @@
>>>>>> +/*
>>>>>> + * xen/arch/arm/vpci.c
>>>>>> + *
>>>>>> + * This program is free software; you can redistribute it and/or mo=
dify
>>>>>> + * it under the terms of the GNU General Public License as publishe=
d by
>>>>>> + * the Free Software Foundation; either version 2 of the License, o=
r
>>>>>> + * (at your option) any later version.
>>>>>> + *
>>>>>> + * This program is distributed in the hope that it will be useful,
>>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>>> + * GNU General Public License for more details.
>>>>>> + */
>>>>>> +#include <xen/sched.h>
>>>>>> +
>>>>>> +#include <asm/mmio.h>
>>>>>> +
>>>>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>>>>>> +
>>>>>> +/* Do some sanity checks. */
>>>>>> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int=
 len)
>>>>>> +{
>>>>>> +    /* Check access size. */
>>>>>> +    if ( len > 8 )
>>>>>> +        return false;
>>>>>> +
>>>>>> +    /* Check that access is size aligned. */
>>>>>> +    if ( (reg & (len - 1)) )
>>>>>> +        return false;
>>>>>> +
>>>>>> +    return true;
>>>>>> +}
>>>>>> +
>>>>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>>> +                          register_t *r, void *p)
>>>>>> +{
>>>>>> +    unsigned int reg;
>>>>>> +    pci_sbdf_t sbdf;
>>>>>> +    unsigned long data =3D ~0UL;
>>>>>> +    unsigned int size =3D 1U << info->dabt.size;
>>>>>> +
>>>>>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>>>>>> +    reg =3D REGISTER_OFFSET(info->gpa);
>>>>>> +
>>>>>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    data =3D vpci_read(sbdf, reg, min(4u, size));
>>>>>> +    if ( size =3D=3D 8 )
>>>>>> +        data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>>>>> +
>>>>>> +    *r =3D data;
>>>>>> +
>>>>>> +    return 1;
>>>>>> +}
>>>>>> +
>>>>>> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>>>>>> +                           register_t r, void *p)
>>>>>> +{
>>>>>> +    unsigned int reg;
>>>>>> +    pci_sbdf_t sbdf;
>>>>>> +    unsigned long data =3D r;
>>>>>> +    unsigned int size =3D 1U << info->dabt.size;
>>>>>> +
>>>>>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>>>>>> +    reg =3D REGISTER_OFFSET(info->gpa);
>>>>>> +
>>>>>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    vpci_write(sbdf, reg, min(4u, size), data);
>>>>>> +    if ( size =3D=3D 8 )
>>>>>> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
>>>>> I think those two helpers (and vpci_mmio_access_allowed) are very
>>>>> similar to the existing x86 ones (see vpci_mmcfg_{read,write}), up to
>>>>> the point where I would consider moving the shared code to vpci.c as
>>>>> vpci_ecam_{read,write} and call them from the arch specific trap
>>>>> handlers.
>>>> Except that please can we stick to mcfg or mmcfg instead of ecam
>>>> in names, as that's how the thing has been named in Xen from its
>>>> introduction? I've just grep-ed the code base (case insensitively)
>>>> and found no mention of ECAM. There are only a few "became".
>>> I do understand that this is historically that we do not have ECAM in X=
en,
>>> but PCI is not about Xen. Thus, I think it is also acceptable to use
>>> a commonly known ECAM for the code that works with ECAM.
>>
>> ACPI, afaik, also doesn't call this ECAM. That's where MCFG / MMCFG
>> actually come from, I believe.
>=20
> My understanding is that "MCFG" is the name of the ACPI table that
> describes the PCI config space [1]. The underlying PCI standard for the
> memory mapped layout of the PCI config space is called ECAM. Here, it
> makes sense to call it ECAM as it is firmware independent.
>=20
> [1] https://wiki.osdev.org/PCI_Express

Okay, I can accept this, but then I'd expect all existing uses of
MCFG / MMCFG in the code which aren't directly ACPI-related to get
replaced. Otherwise it's needlessly harder to identify that one
piece of code relates to certain other pieces.

Jan


