Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB8447ACA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 08:26:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223069.385601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjz2P-0001r6-Pp; Mon, 08 Nov 2021 07:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223069.385601; Mon, 08 Nov 2021 07:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjz2P-0001pC-Mf; Mon, 08 Nov 2021 07:25:53 +0000
Received: by outflank-mailman (input) for mailman id 223069;
 Mon, 08 Nov 2021 07:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mjz2O-0001p6-Ld
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 07:25:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19a52faf-4065-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 08:25:51 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-AR6760qmMhaiqdpz7HGRuA-2; Mon, 08 Nov 2021 08:25:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 07:25:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 07:25:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:20b:48b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 07:25:46 +0000
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
X-Inumbo-ID: 19a52faf-4065-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636356350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6mpVkDjt/XouPaaAa5fkNpl7f5bqFWVabWCbTrqlZE=;
	b=jgxad1SIlzA5rdKwHU0GuyXfwr1LbzbUW+c0vBtSljb0vrdosTfVO1CDBd4HfG9/fs2nN5
	pNEDAMLN2ySxWMU5u/2+um+yj80wL0FhfJKrrSN3f+6J+1KLr77zCVHtMTskLoqrtqeV11
	rG8dXL18SFF/xMCjIPkZDY0KD6ZuRVs=
X-MC-Unique: AR6760qmMhaiqdpz7HGRuA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHIvCvWjIjVI0DJ+CpseDN2uZwbaIAEiisqEi8DL5FKR5nz9Fg8JKUF51oQYgZAj9f6UMVuO+lU6JVfrox3U1y9kXzo5CKZlgvbmyx/qtosTu1Tu7z2NVBNG9MoLeKjpUL4kpBMqQYhfUFLgqUIu1v9tHI55a/y6V3tqYaMoSpJTD4IHOYI4UiOQphT4XKJZJAj/xBWewckPxWOlperuXimR+InuB9T6nULhBIpgFTyaD5tq19AqQeoH4HQ7mQuCnt9W9BD4MycaF+4ObGRFa8XWOhTXiPdl0HDcCzybajph7XGcH/7qNNbxLIKrZni55mdUUp6wdPG8jham5TpedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEzHDHgvA+riJnyqQwRa7+/5OHq7PCoSB7kENDfplXs=;
 b=A7DKvUnCrpWegTok/uHQhtifOQYd/1er8N6fRRH/GgEGPavsXEkdjSSNbQw31vlSuhU+m/U6kpWs0OjKMnZFB1jupw8oPLvSnfQL0PosjWyvp5WzdSNCMZj1+cdxFc507cSQvkgDwxTqBy3Whr0XOiUKi74/5Yl6GOhTmCLvkua8DJNf7u+T9Wfz+MjAmknadnRK2xgO6hP8vBimZWTa7P7pDUCVmdjB1heASgYvP8Yt3WPqqRMGY3m5IB+M4L9j8C09ppJv5QZfhGau/fjKeGeBa6p9VzCHo6hw70dwcsgCqFYCE7/ItckXUbU1IYqtrIo4HmnZOvn1SIKAvMyN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
Date: Mon, 8 Nov 2021 08:25:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0079.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbae88dc-edfe-4971-7568-08d9a288fb4e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863BB494C1983FEC3558243B3919@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	190R8IxXC0IlbTmmpsFWNqQlEVTAlOXt+y8PygfPebq1tzF8av7/6uW7WaO8kKu1ePSVsIK2NG0iIhJlFjSrawZl27b8PNIYdVZsG2eSeMfBAOu+1XfuARtmNU2BX8/OYatjtjU/9jKx7khMyU3HUHdvmJWLfbXkQzWgZh/4QywLLcMKINXatCYwntF5S81jCMeS1ViiWMGNn7RATmtBUYf2vg5LxSRn2N0Fog1RDKGW8wInDP1B2VVUv97VDx1Adm1F3igtq1SEjM4qFNGyxm+bHu2XJjG0ZuBtBr20aIxqKN17zQfcQcjvokNmZSEULbAdLfgJ0RRg/dk77k+Dm032f3nD79pCxyUWhy7UA4MZsjfqfgms0774gU5dOvekssqS6oybCWdrHYB40k6o3XKwZ17RF+NoHHT5jNpFxKi5serU2o+D3JFvc24P6UIhXDQhhMqGuZ/i/LQiBcbIWamq/tFWP/mCDJWbEz+9dPv5P6g41MVNyiGAPotHrkN9M54QZ9gC/waZshKZq7CEabdiz03QFblbORohobPGvVbRJZ4KdRW3dL7/BIioFgOI8RGdXmx/OlTUWozSHj7l371przSxLPHl+LW0lh+FtIgRLoiv36PCD8C1geKiQyEUzdJCjqQ8x0xN86FM9RLOMKXZWpP3ub9xca6y3T9RqmUtqKVbKZvYtHx5QtEZQwg87Z9LgG63EQJqtQyYLdoT17jwFzG7Xo6epWXAZru9AjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(16576012)(83380400001)(86362001)(8936002)(8676002)(2906002)(66476007)(316002)(38100700002)(31686004)(4326008)(31696002)(6486002)(5660300002)(508600001)(956004)(53546011)(6916009)(2616005)(26005)(186003)(66946007)(36756003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tFc5SkEAt9rSwCx4O5Tg1gz3B+QvwEOuBjzPC9cBt6k6kT4TUAHo6gaDIg5Q?=
 =?us-ascii?Q?+OpdiQTovHMI2UZZiZossOcVuxn+sRDdy4j28Cxngh6dAwQnEsWG0p3kCjQz?=
 =?us-ascii?Q?k/RiZzEKM31D9W7WLCxgi+lzO0MWSBlYvWjZYsNKwbULtlRnKJtjGjORlhkS?=
 =?us-ascii?Q?Y2fhl972WibfjUVJ9U7E6qhdYACHPdndrEOGBHcLnaAPMEM4vUWJ5ufDD2wK?=
 =?us-ascii?Q?OgawHsIuu9wIVfM4XP3lx+Ndzuzlfc4pfYJXjxzzccNRmbziNuezuDsUVal/?=
 =?us-ascii?Q?it22VwhaZ81AV5XDKdtrbsFM9H6GT176wuuqxUvtTtmOjNJouACSLPHxieYU?=
 =?us-ascii?Q?jh71WbooZ9uW/nd8hxd7vChW3Hkp87WiLnxFLbbiKAz8ALMaqvzWJs9UrXHf?=
 =?us-ascii?Q?h+EmvFa3sI6b5bYUO/fbu/iSLzr1Jms7N0IMmut50nGqXkmyYZJf8tXbeWpw?=
 =?us-ascii?Q?uptBvrUyIlTSuJv+nZ+kCSTZ/3I0KudmRDfGbSPgUIBrA6Tes7t0QuXCB9Uy?=
 =?us-ascii?Q?/1y7up3ZiB2DEv6kJACuqVTYCy7UIolFOhNdAdEB9a660ld7k1TnLKrnVRk4?=
 =?us-ascii?Q?qGlBgWmm3jq7hUW6mpqmrd6HdmACpCwg3SgzchOxeU0/U0g6gxK03if6ZsuX?=
 =?us-ascii?Q?pgogX0L7MT7hHPjAupX4Fjskevlam0bar073+zlT07Bqf5LCsjkXaqJmOP0H?=
 =?us-ascii?Q?7tnloYdnL7ew7EMyfCV2vEEAxs9z52rjDUnbTmsGZeDXVEO03R4XGuTTDRr3?=
 =?us-ascii?Q?XrvyTuHTGH1iGJi3+GSgXzycKboTTBkfzOa2vLj5BCKvqMtjrOHmS57CQlI7?=
 =?us-ascii?Q?3yXXsVXdIH/AvWrguYqDveQYtvmfrH52hm494IULCtV50c21JUgepxylClzO?=
 =?us-ascii?Q?2SiJZME+oOW52pKP5UxU16SByLWqDt05ABcuON9L5N1az9udU+IDazmBsvbV?=
 =?us-ascii?Q?eWgCi63zHySG0ZAAdgR3tjhZTdcO6a5wsCAdbo/pl2BDYC71HSQXBSOY6z/M?=
 =?us-ascii?Q?F4zwxPk/yRoW4PwYf8Yo99vAt4Xpqy1DJJ/JEWNX6zdw7THJlz90X5YvEO0C?=
 =?us-ascii?Q?5BhoE5kJFZuug1qoIsqOYso+TqPhEtoKqHk8PpTGwLnGcj6t9reqYYh8z1Z4?=
 =?us-ascii?Q?gNwOYLiBu2FozvfKJukkzP2I06DxaHMIaiqLpYglGL5NAGWRR/WZ0YwLYmtX?=
 =?us-ascii?Q?77trbE7JMOyZEMgzL0WVd+lWVTMh8ZbTfQji4xqk34cK0ECMq3dJJaDVBU/8?=
 =?us-ascii?Q?62jOg2NKH9CIdntchDoIvqzKiIopBQt0O4Xv/SyVoYhDxvR1WnCUVemFNnSo?=
 =?us-ascii?Q?pEe9O8wwh3DeLrgFeV0NFwFtKBXyJlmGjILdjUsSpB7ksftWPRgemdr4tNru?=
 =?us-ascii?Q?p0l4Sj+Xb0qX1A/8xvey8c+RZeI8D70U2MhCnKRWdOwTvZp9ZhtBhwl0S55V?=
 =?us-ascii?Q?fKsUgHifabMSOUYmmk/2z0ttJRCH9FlYLqEGi/HglNtdpnWBqFBnOM/+VqB/?=
 =?us-ascii?Q?6o/fiX2oB2UEIB7BC3xQnp1uhodb9tipKI7xENu4Xx0EPTvbb9TdM5rUanfK?=
 =?us-ascii?Q?xjI8X8xKU01dVk+8d7UUArwqvoApuiEQFqOWB/MggTFHzDp2fkOMFwyApzkt?=
 =?us-ascii?Q?THisiNhCbmDHMKRbIFYRoNw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbae88dc-edfe-4971-7568-08d9a288fb4e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 07:25:46.6540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCbKk7+F1UFvcdWzM8W55fEqSNdfQNJ7FasILk6QPAx+RGWAhw6O5qJ/OspfsGm6UfL3NKQtvQ6x3KmTp+AQxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 05.11.2021 16:33, Stefano Stabellini wrote:
> On Fri, 5 Nov 2021, Jan Beulich wrote:
>> On 04.11.2021 22:50, Stefano Stabellini wrote:
>>> On Thu, 4 Nov 2021, Luca Fancellu wrote:
>>>>> On 4 Nov 2021, at 21:35, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>>>>> On Thu, 4 Nov 2021, Luca Fancellu wrote:
>>>>>>> On 4 Nov 2021, at 20:56, Stefano Stabellini <sstabellini@kernel.org=
> wrote:
>>>>>>> @@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_node=
(EFI_FILE_HANDLE dir_handle,
>>>>>>> * dom0 and domU guests to be loaded.
>>>>>>> * Returns the number of multiboot modules found or a negative numbe=
r for error.
>>>>>>> */
>>>>>>> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>>>>>> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image=
)
>>>>>>> {
>>>>>>>    int chosen, node, addr_len, size_len;
>>>>>>>    unsigned int i =3D 0, modules_found =3D 0;
>>>>>>> +    EFI_FILE_HANDLE dir_handle;
>>>>>>> +    CHAR16 *file_name;
>>>>>>> +
>>>>>>> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);
>>>>>>
>>>>>> We can=E2=80=99t use get_parent_handle here because we will end up w=
ith the same problem,
>>>>>> we would need to use the filesystem if and only if we need to use it=
,=20
>>>>>
>>>>> Understood, but it would work the same way as this version of the pat=
ch:
>>>>> if we end up calling read_file with dir_handle =3D=3D NULL, then read=
_file
>>>>> would do:
>>>>>
>>>>>  blexit(L"Error: No access to the filesystem");
>>>>>
>>>>> If we don't end up calling read_file, then everything works even if
>>>>> dir_handle =3D=3D NULL. Right?
>>>>
>>>> Oh yes sorry my bad Stefano! Having this version of the patch, it will=
 work.
>>>>
>>>> My understanding was instead that the Jan suggestion is to revert the =
place
>>>> of call of get_parent_handle (like in your code diff), but also to rem=
ove the
>>>> changes to get_parent_handle and read_file.
>>>> I guess Jan will specify his preference, but if he meant the last one,=
 then
>>>> the only way I see...
>>>
>>> I think we should keep the changes to get_parent_handle and read_file,
>>> otherwise it will make it awkward, and those changes are good in their
>>> own right anyway.
>>
>> As a maintainer of this code I'm afraid I have to say that I disagree.
>> These changes were actually part of the reason why I went and looked
>> how things could (and imo ought to be) done differently.
>=20
> You know this code and EFI booting better than me -- aren't you
> concerned about Xen calling get_parent_handle / dir_handle->Close so
> many times (by allocate_module_file)?

I'm not overly concerned there; my primary concern is for it to get called
without need in the first place.

> My main concern is performance and resource utilization. With v3 of the
> patch get_parent_handle will get called for every module to be loaded.
> With dom0less, it could easily get called 10 times or more. Taking a
> look at get_parent_handle, the Xen side doesn't seem small and I have
> no idea how the EDK2 side looks. I am just worried that it would
> actually have an impact on boot times (also depending on the bootloader
> implementation).

The biggest part of the function deals with determining the "residual" of
the file name. That part looks to be of no interest at all to
allocate_module_file() (whether that's actually correct I can't tell). I
don't see why this couldn't be made conditional (e.g. by passing in NULL
for "leaf").

Jan


