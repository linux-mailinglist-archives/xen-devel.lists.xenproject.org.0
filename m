Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553BE3AE33E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 08:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145333.267396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDRC-00051n-Kq; Mon, 21 Jun 2021 06:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145333.267396; Mon, 21 Jun 2021 06:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDRC-0004z3-HL; Mon, 21 Jun 2021 06:29:38 +0000
Received: by outflank-mailman (input) for mailman id 145333;
 Mon, 21 Jun 2021 06:29:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvDRA-0004yx-J5
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 06:29:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9ab3232-aa2b-4504-aa99-7dbeddceb42c;
 Mon, 21 Jun 2021 06:29:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-NFnNjG9RM9maupu51qD9Cg-1; Mon, 21 Jun 2021 08:29:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Mon, 21 Jun
 2021 06:29:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:29:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0123.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Mon, 21 Jun 2021 06:29:31 +0000
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
X-Inumbo-ID: a9ab3232-aa2b-4504-aa99-7dbeddceb42c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624256974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Uv0XarbtPB6daZS22G14d9F1EhsAX6KBLEB/Yaibts=;
	b=gE8jyVJ9Kp7uiZccr94SQusHAIB9kUkBakNb6AVughCqS5R5xPOv2yhca8AdxsannG1ktM
	OBnFjP1tKmIyscb8croKzb4nj/XCjs0gwB1vpPt0pzBJ8XUNqj7fXjhLOO3B+PBa5Hqkpa
	XxZEmXsJcd5VnSwkc4BceKscrswp4uQ=
X-MC-Unique: NFnNjG9RM9maupu51qD9Cg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfqLiWbRCaPHeEtQvhhgxL581LjB0mHVeTnGtSGTxP49eI7NydKRjCP0T9IIIHIfzA5xJ7Z+P6bFCoJe7k1jIPO21BKQeOQE8bxS4Z1bAqRa3pTVNcinNUjq7NG9FnhJojd2uS/eC9N24A0WU+mnYqr50vFSXJwrPDauqTYrNn0Zusb/Ca+9nlWasE+1623WdMBQzEG0PJU5TqT4+t8k3YWkzKWJpuuHxERekFg5xjgLiAOpkA61E1ZcUZv6UF/7Io85XlARe4FuS+HFFgFghDiU57tdm8fauUJMpt6zFW4TmB3ZGcJyHbcsBSG6xp/eEYOa+rVqPSCk+/fCMFAleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I91bC7ihyW4hvTflqsSmS4NmmT/3qXbhdMHAfE7waik=;
 b=l9aBuZUPHhsoZPhc8Be9vbpD0Ocs1LpTP6xqxQv8cF6puGA8Jsze09CWA9ifY/A+gX5CryEWyZaaXmgf/V/2W4zkxTC5XACeglPlaa6S1Bu7Sarj+A1d+sOnyYrwcNFVvTR7uGQJStorw8kojYAKaQzkBUeN5zifd8FDVvxtbqBl++mRHnO/Ay/GtOgrNuj8tVquCwJPC9OxisFtrnNc24Wz/5rjZZmi73eLflQM8H/O/1zvnNTmaUhr22Zn3cbT+MvFjJGl/TJMixj+0MPOhqNRAH2Q1wkQ0aHPYEnCMzJ+WXH/8odi7tv9kcLWrjWb1xb253QqGa4PWrP/9ln+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/AMD: make HT range dynamic for Fam17 and up
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
 <9fdd9760-6de7-be4c-a75b-0d3b1cc10a38@citrix.com>
 <ee781cf2-47c2-0b5c-4f21-37ceaed283af@suse.com>
Message-ID: <3415ff03-fb0c-1aab-aa57-9c5e4bb1c8eb@suse.com>
Date: Mon, 21 Jun 2021 08:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ee781cf2-47c2-0b5c-4f21-37ceaed283af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR01CA0123.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 033b89a0-7251-4daa-6bcf-08d9347dee15
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB460782206B05AC71E6BD99ACB30A9@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	odI+EtJe/ReiT3LxB6Q6hGPUqAKj4QCo/zzBTJmuDN5coiJqwb197Vfsp/WLcH15g0U4EdCqXa9j1MeF+Ix+E+wcUxbLh3ZDjCzEhhre+0XNqmSCsU6AeT4gGItfX2cAvdzx0BOTIw8ey9CxlK6CZA4sHDcHI560342ika/xZMy/e+DrQ/NvnjqYPcget8VwlDEObQ/CB5OMkg+ZHRwDUpaWt5SCIhcynmQ4YzDRB1tqhwVrTsk5X4/GqOTclz2wx3VSnx/TNXDODQYodbHEvhAhk6yWHRWENwvkhrJZfTJeiMXh7/YuUFmi05zhbF69MJEv2Vx73sCvGpIjcRiblB0JBHhLEkzB6kG/0bsyLerUon4bbGW/apuGXlcLjrX3+gCRs22SPsx/bq4xxbzuUK5qxaNC6ZtQBlk/aSnLmi73aD0kF0ysk2N4oG5JcD3fzUydKiDXlSR0zT3vU6EV8fzENLwBhtuwvqJXL/YeBTaQ8Dnb5AoyRmkbcKKMzdLpiyZvy87cLFEw51l0/8pK2VUOlwbA+jLGk+9edXhtYOZRRQht2vt5BxspXXTNMkHfVDZTsAYD53hS9JSfZj4jIEjnCquc5uUX80KW3AQnYBkqJBXi2CIV3ddl5ngEZ8uz3fgxYumTP5yHgQGqYuVAn6S7MfUl+gGLiVlytWuX8r0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(39850400004)(136003)(366004)(53546011)(38100700002)(54906003)(66946007)(83380400001)(16576012)(316002)(4326008)(66556008)(66476007)(8676002)(2616005)(478600001)(16526019)(6486002)(36756003)(956004)(5660300002)(31696002)(186003)(86362001)(6916009)(26005)(2906002)(8936002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/6qw5e57+hsZ8E2D/Rx8kJb9Xn+r+7cAgIeXf+neWQlc8iANMFFrqIEGKbm4?=
 =?us-ascii?Q?naP0sUa6xpppfIL9cyNAK1mOnF0qOw2qHp0Sb5Yo0eAtr+fBlAwxgm3nqDP6?=
 =?us-ascii?Q?SGBDAaKNUD1IAnZkNvt0fZ6evVJAlI2mtZjF41pl0pj1Vw/g96r2Arql0EG1?=
 =?us-ascii?Q?VSTXyAGzU4pwX/oVvhanY4fJJ6X0xOsQWVyEfa4eJ5lJ4IUfiI3ZAJi79+r8?=
 =?us-ascii?Q?3hcFN/6DrPq5lA5kx6bfQ8lNAI2q7DdQP9BW/oKW2/guEfMJWH+g19/VAiAr?=
 =?us-ascii?Q?8R4E/PJ+TyqQv1KOoaDntDAZDh9tbUML/ZjK0w4N2euMofqGErdsldP7GJHK?=
 =?us-ascii?Q?tEZ8nzAyF1O/7vf8ZutTxEx373j2OBJfV3SrfZMXR2aSmQYD+Mad0LPHklx1?=
 =?us-ascii?Q?7lECYhrcCHLKeUsNjZatDt6PymEKSaNrHagajSpmmJ+6rJy+0ghPiofAXkO9?=
 =?us-ascii?Q?Xeh9bI8px97+bZUPjAAfrNZ3QgiuX1RKh5jhHEHZv6rClqUKMZTJWg/l24Du?=
 =?us-ascii?Q?W/0njoNYg8j6TDIw/pA0oY6l7Z+6Sl/i5jk1kdwM9VhLdqFlHIMSSuUGO/RM?=
 =?us-ascii?Q?71GlnGYVyMgzxPsKBxRmchPNjaq1KVgKWSDevkPGRFMYQKjJ3e9yq4Xc0iFc?=
 =?us-ascii?Q?hENMEOxIFgw/37tNTCZ7J2FC4+pYoV9KacgwIHuqNEp0XWa7R+PuNdh0qQEI?=
 =?us-ascii?Q?Z97QfOYZfo24vU2jBv96W/+zrGzYCODXND5pLMBZQmjip/lta1woAnaFLRsq?=
 =?us-ascii?Q?GEzUtS+5Pb+WyU+BkKXodTZlD+OXBac0ZWstiQGvYZL0J/bnuS3h2zBgO4hv?=
 =?us-ascii?Q?8LdigxnfLk3190bln05sSh4UsGkKuXJoOj/6sqIcWqKddsm9cjRm37htw6ls?=
 =?us-ascii?Q?xj4c6IYcb4kMW+UWCnzs+5oU1dA+OWr195LvVo6Yfco4Tr/MjlpL53mpfdDz?=
 =?us-ascii?Q?2Zz0CG2UY1wvdZjZMdOk5VhPStIn0BF60Njd2IHrN965O9+Fq+/B6foyuT3F?=
 =?us-ascii?Q?9vnvuHUM2OIE/WjHBPD/saBcMFhFoA8AMDLRAI0GDRtKcI4WV9JBZ6NI69td?=
 =?us-ascii?Q?Y/5hAgWl6VQbftz8fVnGw6Cpa4CwexQBU2V9c7ZPgiMQSwoNOOuWyBHiUsnQ?=
 =?us-ascii?Q?JR/FbcGrWj3eKEXfNYns0HRAI8vw8NKQlZAzikDg2K83kjBrWVIJNP+dbz4X?=
 =?us-ascii?Q?3zsmn0ScgcXbKJOmTC+FacwcoCxrGk2qGS+AlsnJcMLRcybms2SHwv04e2D4?=
 =?us-ascii?Q?i6O8lHaTk1nTcnL6Apw0abMdqJhF650jeS9k9+nYiXKjkgtD/IWUmbrlCw7S?=
 =?us-ascii?Q?AEzNlDoOGnOM6wtNHdSDMUod?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033b89a0-7251-4daa-6bcf-08d9347dee15
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 06:29:32.0492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ee4zQeptCpvUwNV/mDgh0lX6dhHjXpbfZ9Gy6Nk+683XR1GDZaJFSLG+V0DM5ZUsiR5VRJR5eGPDM/6lyNV5iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 21.06.2021 08:18, Jan Beulich wrote:
> On 18.06.2021 18:32, Andrew Cooper wrote:
>> On 18/06/2021 17:00, Jan Beulich wrote:
>>> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
>>> address range") documentation correctly stated that the range was
>>> completely fixed. For Fam17 and newer, it lives at the top of physical
>>> address space, though.
>>>
>>> To correctly determine the top of physical address space, we need to
>>> account for their physical address reduction, hence the calculation of
>>> paddr_bits also gets adjusted.
>>>
>>> While for paddr_bits < 40 the HT range is completely hidden, there's no
>>> need to suppress the range insertion in that case: It'll just have no
>>> real meaning.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Really, this ought to be reported by Igor.=C2=A0 He did all the hard wor=
k.
>=20
> Sure, changed.
>=20
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -349,13 +349,17 @@ void __init early_cpu_init(void)
>>> =20
>>>  	eax =3D cpuid_eax(0x80000000);
>>>  	if ((eax >> 16) =3D=3D 0x8000 && eax >=3D 0x80000008) {
>>> +		ebx =3D eax >=3D 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>>>  		eax =3D cpuid_eax(0x80000008);
>>> -		paddr_bits =3D eax & 0xff;
>>> +
>>> +		paddr_bits =3D (eax & 0xff) - ((ebx >> 6) & 0x3f);
>>
>> While I can see the attraction of editing paddr_bits, I think it will
>> break the emulated pagewalk (at least).
>>
>> With SME active, the address space reduction is only physical addresses
>> only, not guest physical.=C2=A0 An HVM guest still needs to see the orig=
inal
>> paddr_bits, and the emulated pagewalk needs to use this for reserved bit
>> calculations.
>>
>> i.e. under NPT, you can still have a working 2^48 guest physical address
>> space despite the host physical address space is limited to 2^43 by
>> encryption being active.
>=20
> Which means we may need to split the variable into paddr_bits
> (calculated as above) and gaddr_bits (left at what paddr_bits has
> been so far). However, isn't that what hap_paddr_bits is already
> for, while for shadow mode it still needs to be the "adjusted" way?
> We'd then simply not fall back to the "adjusted" paddr_bits, but to
> the original one.
>=20
> Another aspect I was wondering about is whether
>=20
>  		if (paddr_bits > PADDR_BITS)
>  			paddr_bits =3D PADDR_BITS;
>=20
> should apply before or after subtracting the value from
> 80000008.EBX.

And of course this was meant to be 8000001F.EBX.

Jan

> I was first inclined to make it the more relaxed
> way (applying before reduction), but then thought I'd first leave
> it as is now, on the basis that the PTE layout doesn't change, and
> hence 52 remains the limit for the full address.
>=20
> Jan
>=20
>=20


