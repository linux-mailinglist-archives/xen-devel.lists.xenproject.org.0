Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC042C4A7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208628.364831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafzB-00013X-EZ; Wed, 13 Oct 2021 15:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208628.364831; Wed, 13 Oct 2021 15:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafzB-00011j-9x; Wed, 13 Oct 2021 15:16:05 +0000
Received: by outflank-mailman (input) for mailman id 208628;
 Wed, 13 Oct 2021 15:16:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mafz9-00011S-El
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:16:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c055cbf-3f3a-4337-b4cc-3f6583754b92;
 Wed, 13 Oct 2021 15:16:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38--hVHb6j9Pvuoe63MsEgpzg-1; Wed, 13 Oct 2021 17:16:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 15:15:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 15:15:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:20b:312::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 15:15:57 +0000
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
X-Inumbo-ID: 5c055cbf-3f3a-4337-b4cc-3f6583754b92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634138161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9Bk3hyQ6WFv8b7AKpENlbOMGd3Xcuist44c9GqXli0=;
	b=FjpzwHdsQrfEaFB9UkIyXhtKBrooWGzNMLloT8sc21VoXLRx8GZDdBHrluYXCHYIPTgrOT
	HRlPqc9FZxD8BVTlpi987SWrY3KmLm6RQQqw1WHQyAAeEDx7hvZtVgRLSfB/I/lCaWtblV
	y26mWwflE+LNMJovBRydMzjVv0KBhSY=
X-MC-Unique: -hVHb6j9Pvuoe63MsEgpzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LddIhw9tVGrhiRL9WT9JQm/cgZO1v2pUvFKUgBQaiwQHsGAQ7s8L+YtsfooB4TAIPKkFBS+C6WfvjLfuj1xIcCJ5EpyWXK1rx7YkGHZaJ80LHME/xiH/VC5Y0AchzlYWnanfIQwutZ0KUEqIgmr6ovJVi35lQo3BXXxPVEq84ZLcBnPKpbym6qHCdcCkIZRZmdORHfejeom0kD7mR/VUZ3aV8gA+OktUTAm+OJB4oju6p4pd/EMinui3Exsk8hHop2HHJd8W5hRIMPPy1oqRAbk37K45adpUdwI2IG3EF0oO8azg186cm+sui76m+bibJEOfNlK2CaV2I6V/4DCE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChPBkOokExfNpSi4eQBrlEMriU6D8fnaAJGFLqliShY=;
 b=JudbGF+KKpKHjbciWzh1rZfTD546IhHhbtud36r25cvl1TblL0iCTizFQUrHz8I7n1hNaYbLeulIFEIJYbb9ULDhoNH0y/YSzTjm5bwm1ttBwqhEPkuMBfLlqj7hzZDI/dCLrXAa7AHxqf+4jH2t05WJVaAylsSftOVffzhpEMTNd2WsvMLstFuvUFvyvcXET3d6Sey4m9RXF93U2ejJg/Mt7PPE+Z0D6oVMD77L96dmzzHCpZtpEOafNayYMnGO5OiRq3uyi1rmlcdyd6Ob8wKHRU8pZV82oArZw3dP+kG2DC7lKou5dc9Gasp3hnpbbHLn5zPzWQ3wraGrhEegoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Andre.Przywara@arm.com" <Andre.Przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Rahul Singh
 <rahul.singh@arm.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
 <6d75f604-6938-b185-61e1-a6684d9fca14@suse.com>
 <2b943774-072e-20a1-b97c-d88b24adf340@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed4876ca-7384-42a8-6fba-e73c1840402a@suse.com>
Date: Wed, 13 Oct 2021 17:15:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2b943774-072e-20a1-b97c-d88b24adf340@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da8ee173-008f-497e-f000-08d98e5c5c09
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5744E712FC7F1145D264E1C0B3B79@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NJsZJvVEp4s60IRVc1yxqzhjdLc0CCnBn9XfDXGkTc3VHOJWyQF3t7wup4k7iTQ/7z4gN7ghY9yRoc4KiI/wS++n/L+zW7jqx9iD2GzXg2mQE+T3R6j9fg+gy9TPo+mQ0RgOnQb39cOKJnx9sRmLN9c8RXFZlIJGqWIBq2ONz6HCng4Dk++YDym16Kvl2zUfkNztvFVvx2Xjbm0GzkDWOHJiLHwmCrrMDIcJ6HH7m4cZf58iyXrZHgBspv1RKJysRAsIYXlucHOSrkEV58B8vIe+hmLDRw7MQEbLG7vQRRhhdGvLluo/OqhSLyo+UwBFJpExwRRdew1lImEL70Aehh+AIukAuuSZJU8zZbnMtXl+hVOHdJign3t5XZCIwgu54Y474HJx304+4wUFzEM27gSgkGK4t2BoDUS+7w7nemBZatjNVThGSN+YVsBVxK7mulRASGCylygO59/lXOp5SfLOZVJ72Sl5USpGSTOIcpCN5YbxawONIVQkXTShBtCn6bHVLoRNtj8mmnX6EFtbxtI3+7lCVSmjjpN8icMpe7sxJHVeee1n7O7IJJcAEEzt42aW/XmYPJepgJGkOAzhi4Gtu4JUicqv0Yy0bunCe17AKhMWGX1cfjoJHxFz2T6x5a2ONUSOp5EC14PPdvhveXja5Scx8rAaAP4y/re7H+5ZEl+N2q15eqZWXBs9TQMmPS7LwzGy8zJUJ+dZre1JbtKvCc9ZqvsKLyJX5EqbdKd6P5rV8sz+BXYIZuGFVHPN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(83380400001)(8936002)(7416002)(26005)(31696002)(2616005)(956004)(54906003)(8676002)(31686004)(6916009)(4326008)(16576012)(316002)(508600001)(5660300002)(186003)(66476007)(2906002)(86362001)(66556008)(6486002)(36756003)(38100700002)(66946007)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ijOj/CfqGBInFAZ1zB8w69MCRrBbDXfmTiymeoqR1RiYx0HTLX6u8y7tfNsj?=
 =?us-ascii?Q?u8J6UBvIxkdi/o5HYor3MT2aP42SYu79VX6uv0fktK9Pw2O1Ydiy64HbXlmg?=
 =?us-ascii?Q?3C6j0irtca0kmTFMgcrcA2L4ieWOceOiFGyu/kVZ4sAYaPuG/mVEDUZIUyan?=
 =?us-ascii?Q?EdwSYzP3Tkuk3TNK/yn7PBYgyNiGFJIwoZYBKHvngPyM3XlAB3l7hCPPWLzk?=
 =?us-ascii?Q?6wQK/hwDw3+M2UEBrpKf/LcZ5H0Kuzy6N1vEGo+yEqqbiPoN/ZkQbcNcZloG?=
 =?us-ascii?Q?QMZzqgle9fbdAWAIQ8CWOLxeu7egOHz0eZiwFTV5oGtHLgV+xa4JHXQVxLS7?=
 =?us-ascii?Q?kR1H4nXsUF0+lf7IzU4iRzjPNqXQo9osUvTIA4nEzWUlxRAXF8QgajIiZzeQ?=
 =?us-ascii?Q?ipY78kWiMYS+h3VF0ccQDoS4W4JFmOwrYwsdMrGn/8CttPvSKBZ2IOfT9YpE?=
 =?us-ascii?Q?iVapS9wilmth5gJMvdFWqwIN+jBMIv0T0t7vjQT+6LtxrOf3+QY7zaQ6Qi/m?=
 =?us-ascii?Q?gilw5UHz1E/CiZaWwX0sscX3Vx3Ts+3vLouvEkDHiXz1Q4N3ecvfdSZCiB2u?=
 =?us-ascii?Q?iGxIOemiH1yzAwBoRkM52rycJsKu7ulN83Uylpa+QW7YHODnLdrJ8o/CUYr9?=
 =?us-ascii?Q?0hfsCjK5dgNBSoREuJJsdo9vvGNzazNN+SVl9L88g8EBfAEFULKAWXhN0VIP?=
 =?us-ascii?Q?xFrCUbgZN1d2sX9NKILJbIDO1ROfXYw1FUUA88QtMZ0wMjG9db4RGfUzrkxV?=
 =?us-ascii?Q?R07UaAtwQB3w46Hv050dXweXH7eBa2IFaUzfJuIqAi9JjbO6arheR2Gh9eTX?=
 =?us-ascii?Q?gmBIyTkT1Gxqk03dFoUqBQ3pehGD3zREcqaGqIUx27xEP4RRGE44emOkmPmc?=
 =?us-ascii?Q?ElueIAw0WLzLygaUbF3cJDtS470QVnFVg+xQ0Lu0lv5qcO/RAzMK4vd4Q2FS?=
 =?us-ascii?Q?59zhrow6xPNAg9QtBaqhw2jDVTerbhcS7cUjJdvy8sy4rHKjaDyfrK5iKETH?=
 =?us-ascii?Q?wUPoCjY8C1Nn7OvaiHKX/m82rUH3roYIP51l3PRfcN00WeCZNJgmYEMvpuoz?=
 =?us-ascii?Q?JibnURJjRYQGQ0Q9wwKsyBfT1dGSE87hyeD/H8ZkBdw3xUjaYO+9zt5Ct/HL?=
 =?us-ascii?Q?ggW3zYvYml9wHTgfFbXQFr2y0SDDRfrrNP5weU+DpCGvro+eIY0fPiyEeNRN?=
 =?us-ascii?Q?AvQuDnPVo5oAOAXSf+s8qniNjRgZMsGt8UnDeI14vZTO+e2Ok9AYBOkOJIwR?=
 =?us-ascii?Q?7eiPA2/SOlLgBi+h4GdblZNxTP0Li/k14XILOl7PJ7iaV4VFI6Eh9uC9vrsA?=
 =?us-ascii?Q?Vja6st+qI+yTVM24rRhs8uVz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8ee173-008f-497e-f000-08d98e5c5c09
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 15:15:58.2845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPmR8Bja5rU8eYcFk4KGPkORo+M4xdcjxkOgfSdIxSRq+eAQR9rwB4GJe1KfU6U+EplHFgsZoJyTNfKefmX7KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 13.10.2021 16:51, Oleksandr Andrushchenko wrote:
> On 13.10.21 16:00, Jan Beulich wrote:
>> On 13.10.2021 10:45, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/vpci.c
>>>> @@ -0,0 +1,102 @@
>>>> +/*
>>>> + * xen/arch/arm/vpci.c
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modi=
fy
>>>> + * it under the terms of the GNU General Public License as published =
by
>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>> + * (at your option) any later version.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + */
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#include <asm/mmio.h>
>>>> +
>>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>>>> +
>>>> +/* Do some sanity checks. */
>>>> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int l=
en)
>>>> +{
>>>> +    /* Check access size. */
>>>> +    if ( len > 8 )
>>>> +        return false;
>>>> +
>>>> +    /* Check that access is size aligned. */
>>>> +    if ( (reg & (len - 1)) )
>>>> +        return false;
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>> +                          register_t *r, void *p)
>>>> +{
>>>> +    unsigned int reg;
>>>> +    pci_sbdf_t sbdf;
>>>> +    unsigned long data =3D ~0UL;
>>>> +    unsigned int size =3D 1U << info->dabt.size;
>>>> +
>>>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>>>> +    reg =3D REGISTER_OFFSET(info->gpa);
>>>> +
>>>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>>>> +        return 0;
>>>> +
>>>> +    data =3D vpci_read(sbdf, reg, min(4u, size));
>>>> +    if ( size =3D=3D 8 )
>>>> +        data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>>> +
>>>> +    *r =3D data;
>>>> +
>>>> +    return 1;
>>>> +}
>>>> +
>>>> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>>>> +                           register_t r, void *p)
>>>> +{
>>>> +    unsigned int reg;
>>>> +    pci_sbdf_t sbdf;
>>>> +    unsigned long data =3D r;
>>>> +    unsigned int size =3D 1U << info->dabt.size;
>>>> +
>>>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>>>> +    reg =3D REGISTER_OFFSET(info->gpa);
>>>> +
>>>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>>>> +        return 0;
>>>> +
>>>> +    vpci_write(sbdf, reg, min(4u, size), data);
>>>> +    if ( size =3D=3D 8 )
>>>> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
>>> I think those two helpers (and vpci_mmio_access_allowed) are very
>>> similar to the existing x86 ones (see vpci_mmcfg_{read,write}), up to
>>> the point where I would consider moving the shared code to vpci.c as
>>> vpci_ecam_{read,write} and call them from the arch specific trap
>>> handlers.
>> Except that please can we stick to mcfg or mmcfg instead of ecam
>> in names, as that's how the thing has been named in Xen from its
>> introduction? I've just grep-ed the code base (case insensitively)
>> and found no mention of ECAM. There are only a few "became".
> I do understand that this is historically that we do not have ECAM in Xen=
,
> but PCI is not about Xen. Thus, I think it is also acceptable to use
> a commonly known ECAM for the code that works with ECAM.

ACPI, afaik, also doesn't call this ECAM. That's where MCFG / MMCFG
actually come from, I believe.

Jan


