Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D90742D5EE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209143.365499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawyY-0007jb-BJ; Thu, 14 Oct 2021 09:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209143.365499; Thu, 14 Oct 2021 09:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mawyY-0007gi-6w; Thu, 14 Oct 2021 09:24:34 +0000
Received: by outflank-mailman (input) for mailman id 209143;
 Thu, 14 Oct 2021 09:24:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mawyW-0007ga-Do
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:24:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8902089a-2cd0-11ec-81b7-12813bfff9fa;
 Thu, 14 Oct 2021 09:24:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-aYdKigpaM5u0gBcgs7VH7g-1; Thu, 14 Oct 2021 11:24:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 09:24:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:24:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 09:24:26 +0000
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
X-Inumbo-ID: 8902089a-2cd0-11ec-81b7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634203470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZLj66i6hGY5I84DeWR3QtUUvJ/2qUv2IIcOobyKT/k=;
	b=jM1mmNIb0nhets2pBZAg4oUvJV87TeNsFShYNJSo5PHf2gnkB5h9tTBz0s1fe5HWWtOpfs
	w5v9IfOCaO9Z7unrU2gni4AOERUjifiAoRw3EHye2/b1G3NaJa/9dhzFYCc+usAP5jcgn4
	xkq1eRDIKUooCXtcSk343czXgx+YCmI=
X-MC-Unique: aYdKigpaM5u0gBcgs7VH7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjfjxoaiPJdTQGPsZGauXT3Dv2RtnD3iS2hdMlkIm7MpboXhZQotplAO0g8ZBhFV1QpABOSBdfsUW9/F9Zj94J6/iZOkhxDxsXYW4zAG8NyjJPFPsVRuM6AywT2yh0jv/ayDutrS7ugcfvuVwEZXrtRyMS/AtYxex4CCtPLxvGJAHt+9x1gKqlSjQy2dS6RxfB4d6Yy3MBecOLm61IX+GgstUSZKA7QXcsd4+lyPAeBF8B9nl5IsFoQLlCi3HrTE1ejcOrlyqpkKcrntnlqPlo0sQ/0vgX8kY4zYPE/7nBxJVA0KifSRMRnc/jdR+VopKuaNab1QNGkdfiLjIDOdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9rrDq5Fv2o9T1u0FTRQ51evMDzS1qw2OXOKETvbK+U=;
 b=ijW0WSVtpGGixKkz1QV0H5ag65xqx6aNLt92NpNWB1nSkgznh+uqUTGCNo62JvpVFREj2f0XTwfWle6hRh5du8V8MkZe3n5l8PjDKpBRtIpefXnC2IP9mNar42iGCQGLAmPVVeQWucKVQfcEMjjwWb86uk4Ptlqmi41u/CFmysTdXjFd2aKoxmjxc4jl9JbL9mOuBxeMB9smuEWTxvN5Bau8FJfAWOuqxc4xpU5SYEaFGd6cxKFtYF44MIEPnAlBFVO2blMj1zKJyHlXZURyRTE/PaDXpj8SNbxRpZuxJpvbceofhzo+8bugOPEfti8JGwbpgm4PJ+jCqeWGGkhXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Rahul Singh
 <Rahul.Singh@arm.com>, George Dunlap <george.dunlap@citrix.com>,
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
 <fa345819-068d-0049-f0e8-8b96379b4247@suse.com>
 <72660561-2D8C-4D02-831B-E446A55B82F7@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8394bf58-5778-83f3-b23c-25f69a545c78@suse.com>
Date: Thu, 14 Oct 2021 11:24:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <72660561-2D8C-4D02-831B-E446A55B82F7@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde39c09-8013-446a-73b2-08d98ef46b1e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608DFD373F281FFA9BDF1AEB3B89@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Az49k7xSU9OuPC9f4aUStAgeqZ8FcJte0VxYYpe+6tlXtOEpI+fqhbtcG27uRYlHFmGXa0wb/yijlrHtKpVxZGeRMKBhqf05SZeLEpE5LXdA4LhOOOCgucV2Eqc5T96U6rOh1odN0lV5L7RVQPfLnHHp55y16IgkKyXNvwkvFVOltK5VZ/C3UYdCgbIqW/nl/WFQ8ogGtBY4HZTBMdTHn8jK6C4vmaWNHr8yp3iB/DydfLhoQKPK29Mb3dc1a3OJFXVsfZdfHJAw7GprrL9pBUAYV1PB8N6g4I5L/HytZnEXB5Ckc8plT0/12fn9h9OYMiXvqCXABNdej/7SnEE7sUBcEy3TAfgrAuR8SYIoaI5qQRcnVYn0+nkubBFFUV1pThKM/yMrFJPFAeCSG68cREjMJ7gTmiSCkWZ4FDS7qTcEXb/i3HbUxYsCSNT0VjSyyuwelFGDslj7TCQnWEPY18D6m4v1PcND4xaUjMdDRwlNiVGlowCjgQT8GmwqCGlxvWfRecHGcV4auPsnWfzCek7p20Q3AO3keI5xR5GK/ptP4vRxH/2hEUQdujYokBXJMFKD7oSt/c0brQL/E32C2Y3DD+uYPSRQBqx/PcmOpF6DhToAZ3jgpJVwEmJlfZkDxCtOCecR64Wvneo2J+D+AejfwpKN1tNKSe96a5nWxUh+tEPGX5uBOdnJSr+HoHaQuzpgQJL9f0Z6O9KtiR6zFqna7INRUs6cRNnAayZqENK8j2Pq7xSKjEp6yOp09ZJdBJg4C6MDcM4zYpfkWwamlqWdjP81p/OOwCAbPyy5tm12cGGLc0VQ/SRzxyFuIK6HUtN8Bw1OgbuNn/LINV8FJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(966005)(31686004)(54906003)(16576012)(508600001)(2616005)(2906002)(5660300002)(6486002)(316002)(956004)(31696002)(66946007)(66476007)(86362001)(66556008)(186003)(53546011)(38100700002)(4326008)(8676002)(6916009)(8936002)(26005)(7416002)(83380400001)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EbEkEr5ecpUNKbeNNwQPe/0y309ilwdyB2H+TyNzCIWEsqLc5049veye7afm?=
 =?us-ascii?Q?vGm5HU0gw5Osp+It94aix1jmv1lRbtHmpaC1YW3CaXWoIdx4MOUZCkLdwNqS?=
 =?us-ascii?Q?kkfO/Y3hSERFcY6o0IOxuTMlQnaZgIWp/XqENRwBXjumST9xbNoDQUtcenUz?=
 =?us-ascii?Q?QjxC3xNAj+VwNI6N6oWQgwp/1YXglbK3fMj0oyB8XaCEK+xAqtZ9mEbg3F9j?=
 =?us-ascii?Q?YT7mDEOdgAqrliGt2U9E6kZv8BPLD/atVAe3TOX+znzBbjprCy7AD1NLpIrY?=
 =?us-ascii?Q?VWCbSJFAP+jk1u2R6m7WZfl1y93K6rJJXiNT3+XFDR8+rTpgMV84jbCEiEFV?=
 =?us-ascii?Q?9+1Wzyvnriu8LCBwTZ4FLYKfgTH6uheq84gQRST39AMWBS7zeKf3cza55Dyl?=
 =?us-ascii?Q?52R+sMWfQ25z3fyHmOlzs2elNbfg60m0sXOSbleBWy5Ix/sgkW7DChAPa8fw?=
 =?us-ascii?Q?dWUEhsKqhKDvA6xo6Ed5yW2Cn7tnktidS324qEe9/EEYwb4MROnAcHPzqCdC?=
 =?us-ascii?Q?TAoY72I8e9yZ6j/X02IbrZsK4nn1NIFmXWbDkoyvyzGNY93/OtWthmndeY7G?=
 =?us-ascii?Q?eYJUmrGHkGIniob805L43Fjd+iNf/casUjLOFWoLsC66hNNp8xxmwVYo1ZHZ?=
 =?us-ascii?Q?n2wQG7ekJFf3d9VAyztMNeDrFJKnGh3DNIFRDObtEgTdyW3PAh4MvsVzElz5?=
 =?us-ascii?Q?Q4T0p3e7oxJkb3jAEAd9tMeo67BYRIgZboAog3HOCBoC2XCpSYJv3WvZTguu?=
 =?us-ascii?Q?oKVACa1TKqR48mvrvt6sVueiYI8V+4KT/EuQljt/1wBfrgl4glmHoOfTVKU2?=
 =?us-ascii?Q?w874Dsdauklu0sWVWQ3nt02842Xx/7Cz7hZDDiOsbliQXaM/vDhjfyBCyJ2U?=
 =?us-ascii?Q?eEew130CKz3tGe9hCUPxasOoYvykKf7ZVcg7xG+AGdmVhjFT8yrO4xjvDdlI?=
 =?us-ascii?Q?QRqUqz4+Yd7qe/8Ye4nW3F2AG6LUbXNdpPBN+SCWvI37R+U9DjdL/FZCYGHj?=
 =?us-ascii?Q?HnEVhq0up/WaUUa4UbVvJ6PmHAJjaAHczO3MozLePTRgagTS3eEHyz3ebzhk?=
 =?us-ascii?Q?4F1SeSdHKNwKfNHqQHuRIyS2NPrRyFvtp/X8dj+FwUJg0waC0c0rdoWS4Roe?=
 =?us-ascii?Q?6McoqW0yFMDjhm1cJvxPGfSZVUdD+yDpe5Ws+PQcTHcxtCP4TUge0+27txvJ?=
 =?us-ascii?Q?bvLWOIQLzC6YMWx97NPTtdu5X+y48tlEfDdv8J3vNhRfLn8DtGTEAXbFP9rs?=
 =?us-ascii?Q?WNPFYLHMBK7VclsAGifBmtoKUihfcBBH5bdAKhHaPX2mrVLI+hxp5MPd4n3w?=
 =?us-ascii?Q?1zmN9NovBTzyRtFk2Eh61fwP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde39c09-8013-446a-73b2-08d98ef46b1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:24:27.1557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShGQ1iTFOLvWRfnZN/WQO/Lfv7sg7at0oaGRQUZhpjuGRCffdnuGlDXohF3A55tWjiNZjnkvl784SmO+/UHAdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 14.10.2021 11:03, Bertrand Marquis wrote:
> Hi Jan,
>=20
>> On 14 Oct 2021, at 07:33, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 13.10.2021 21:27, Stefano Stabellini wrote:
>>> On Wed, 13 Oct 2021, Jan Beulich wrote:
>>>> On 13.10.2021 16:51, Oleksandr Andrushchenko wrote:
>>>>> On 13.10.21 16:00, Jan Beulich wrote:
>>>>>> On 13.10.2021 10:45, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/xen/arch/arm/vpci.c
>>>>>>>> @@ -0,0 +1,102 @@
>>>>>>>> +/*
>>>>>>>> + * xen/arch/arm/vpci.c
>>>>>>>> + *
>>>>>>>> + * This program is free software; you can redistribute it and/or =
modify
>>>>>>>> + * it under the terms of the GNU General Public License as publis=
hed by
>>>>>>>> + * the Free Software Foundation; either version 2 of the License,=
 or
>>>>>>>> + * (at your option) any later version.
>>>>>>>> + *
>>>>>>>> + * This program is distributed in the hope that it will be useful=
,
>>>>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>>>>> + * GNU General Public License for more details.
>>>>>>>> + */
>>>>>>>> +#include <xen/sched.h>
>>>>>>>> +
>>>>>>>> +#include <asm/mmio.h>
>>>>>>>> +
>>>>>>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>>>>>>>> +
>>>>>>>> +/* Do some sanity checks. */
>>>>>>>> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned i=
nt len)
>>>>>>>> +{
>>>>>>>> +    /* Check access size. */
>>>>>>>> +    if ( len > 8 )
>>>>>>>> +        return false;
>>>>>>>> +
>>>>>>>> +    /* Check that access is size aligned. */
>>>>>>>> +    if ( (reg & (len - 1)) )
>>>>>>>> +        return false;
>>>>>>>> +
>>>>>>>> +    return true;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>>>>> +                          register_t *r, void *p)
>>>>>>>> +{
>>>>>>>> +    unsigned int reg;
>>>>>>>> +    pci_sbdf_t sbdf;
>>>>>>>> +    unsigned long data =3D ~0UL;
>>>>>>>> +    unsigned int size =3D 1U << info->dabt.size;
>>>>>>>> +
>>>>>>>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>>>>>>>> +    reg =3D REGISTER_OFFSET(info->gpa);
>>>>>>>> +
>>>>>>>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>>>>>>>> +        return 0;
>>>>>>>> +
>>>>>>>> +    data =3D vpci_read(sbdf, reg, min(4u, size));
>>>>>>>> +    if ( size =3D=3D 8 )
>>>>>>>> +        data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>>>>>>> +
>>>>>>>> +    *r =3D data;
>>>>>>>> +
>>>>>>>> +    return 1;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>>>>>>>> +                           register_t r, void *p)
>>>>>>>> +{
>>>>>>>> +    unsigned int reg;
>>>>>>>> +    pci_sbdf_t sbdf;
>>>>>>>> +    unsigned long data =3D r;
>>>>>>>> +    unsigned int size =3D 1U << info->dabt.size;
>>>>>>>> +
>>>>>>>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>>>>>>>> +    reg =3D REGISTER_OFFSET(info->gpa);
>>>>>>>> +
>>>>>>>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>>>>>>>> +        return 0;
>>>>>>>> +
>>>>>>>> +    vpci_write(sbdf, reg, min(4u, size), data);
>>>>>>>> +    if ( size =3D=3D 8 )
>>>>>>>> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
>>>>>>> I think those two helpers (and vpci_mmio_access_allowed) are very
>>>>>>> similar to the existing x86 ones (see vpci_mmcfg_{read,write}), up =
to
>>>>>>> the point where I would consider moving the shared code to vpci.c a=
s
>>>>>>> vpci_ecam_{read,write} and call them from the arch specific trap
>>>>>>> handlers.
>>>>>> Except that please can we stick to mcfg or mmcfg instead of ecam
>>>>>> in names, as that's how the thing has been named in Xen from its
>>>>>> introduction? I've just grep-ed the code base (case insensitively)
>>>>>> and found no mention of ECAM. There are only a few "became".
>>>>> I do understand that this is historically that we do not have ECAM in=
 Xen,
>>>>> but PCI is not about Xen. Thus, I think it is also acceptable to use
>>>>> a commonly known ECAM for the code that works with ECAM.
>>>>
>>>> ACPI, afaik, also doesn't call this ECAM. That's where MCFG / MMCFG
>>>> actually come from, I believe.
>>>
>>> My understanding is that "MCFG" is the name of the ACPI table that
>>> describes the PCI config space [1]. The underlying PCI standard for the
>>> memory mapped layout of the PCI config space is called ECAM. Here, it
>>> makes sense to call it ECAM as it is firmware independent.
>>>
>>> [1] https://wiki.osdev.org/PCI_Express
>>
>> Okay, I can accept this, but then I'd expect all existing uses of
>> MCFG / MMCFG in the code which aren't directly ACPI-related to get
>> replaced. Otherwise it's needlessly harder to identify that one
>> piece of code relates to certain other pieces.
>=20
> If that is ok with I will:
> - move function from x86/hw/io.c to vpci.c renaming them to ECAM
> - rename MMCFG_{BDF/REG_OFFSET) to ECAM_{BDF/REG_OFFSET}
>=20
> For the rest of the occurrences in x86 I will not modify any of them as s=
ome
> are related to ACPI so using (M)MCFG is right and for the others I am not=
 100%
> sure.
>=20
> Do you agree ?

Probably not, but I don't want to put time into checking existing
names right now. Yet I'm getting the impression that I'm being
overruled here anyway, so there may be little point in investing any
time here in the first place.

Jan


