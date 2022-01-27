Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E843D49E223
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 13:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261431.452652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3fY-0005uH-Jq; Thu, 27 Jan 2022 12:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261431.452652; Thu, 27 Jan 2022 12:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3fY-0005s7-Gm; Thu, 27 Jan 2022 12:14:28 +0000
Received: by outflank-mailman (input) for mailman id 261431;
 Thu, 27 Jan 2022 12:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD3fW-0005rv-KH
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 12:14:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa94098f-7f6a-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 13:14:24 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-bZFxq0s8PdiXNfQ0I0ji4g-1; Thu, 27 Jan 2022 13:14:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 12:14:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 12:14:23 +0000
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
X-Inumbo-ID: aa94098f-7f6a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643285665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9w6f5wY8mPKlXWlY/G1Nrj5kr1M+9umWtcuCiq59gI=;
	b=IcdIjbIJeN7d8J8sgaj/dUkm1MGJcMSDxAtaO9HG9wfIGo4SyySDbIr/dC80IRcmbUczPO
	O7VJFtlQB4qHd/5XnJfmbzZimqeJU/hGcx3QXUPOR7yz225JJPo39eLGGLvAedb0r4F2V4
	kUkACgH4/YppqZGGq7Qt/iyMrjlfnjc=
X-MC-Unique: bZFxq0s8PdiXNfQ0I0ji4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1mekHaD3v7A8cbPk+egDGLTZy3qv1ddaQ2RuNgtQX+KxsubkSSxrFTndJtkX9Y4fw20fDlMo+kdnCjjmy/2mEt1GoRYGqAHZYabxpDgpR8mo6kFcch9Hw8T1eRnr9QVXFZSWnBA6VE1gyBIAQugTZMm1MM9xfxxDyeNVX5J7jrVi+HnamDFMob4TCDaqK2yi/HI8SA8GYJ4jrBAXI07yzL6EQsaZ53fiwlvMS4GStPoOemtTJCjOUudVxeFl5HLqCO9tXR4Jihr7jOAhExNwlIh7QfLI5P8Z5yseinIsP5F5x9KBAzZxmshqUJoal58CAgfZiU1kPhnwjAlbgObng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqpTnif0F9bY38cKDGOlfIum6QhbwVE2YJhicpSd+V4=;
 b=XrjRktZhf3gwuNeq/VW4xKN1LeIiasR+FXM0g9N9uUhemJJOW0MkPp55ambHT1XjYsF1puoRzBkYbsSWkikPcDUkNptIi1IL1gFkD/C0RhsVXZpO4qT1yQVozq68APXa8lY+/kdhXH6w+8nrOM/YVSIAuhHFfpGRQ2+TSQeQGvzgpRL5Hoh2XlM+88XUC2KM7R2JOtaFX6kDJGAxoIss/GbgYXvQc42DVkaB0JRwfIy6Kok4XTLp6zmZNrXXbUfiDqPtbqhAs0uiAhcyOc/04uDGyhIphNdE8b5AHhcZpcG7voHCQfwc2u4hFLUJhHOWGKei+TjJFh1IVUyCTJYzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <994b74d9-12db-dcfe-5dfa-eb01394262ae@suse.com>
Date: Thu, 27 Jan 2022 13:14:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] xen/pci: detect when BARs are not suitably positioned
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220127082218.57902-1-roger.pau@citrix.com>
 <4a82bfdf-479d-3813-069a-84d30a6e29fd@suse.com>
 <YfJqF8/IIz7k+8G3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfJqF8/IIz7k+8G3@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0100.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfabafd8-a154-4f90-9392-08d9e18e8de3
X-MS-TrafficTypeDiagnostic: AS8PR04MB9175:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB9175C7A54D5152D83C255662B3219@AS8PR04MB9175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GkqNPfJi3khmVjflL8IuC+IWUyQDY2qeM7+78liVmOFTAA9gkQd7xE+g22MErn0L7O5/KNqDby9ugE6Gl8e8/bZpYlNDMBuwkWKpDCmwNKRSSYYRp00r2ugBCwtSGxLdoWQWesikq5YwiPri6v2/VAb6KbMTH+HqAUhaOn7fX5XuOtF+2Bhf5HeFHj4bEiUf62javrCaaxAbumiGEyth39BUCJvk54LXhVpxsBi5d8abLnl1mSYZHqJMaxQyFy4KG7DSQJ+1gMEgFmbhEo+riZriBugXw24yG0VzIt473d2kGgm9ao/Ke4cVM4OJA6A+a3PBLo8yd8bWHVRdChuS/tDloMYa7XFn3WGGk/Vz/0rxhd11fij2TrhHviYhO5mELDMczJrG7IcytvGf/geu+StDwDhdVo3EW+0ato32x7pZmFcFR09idvGOWECMaxWSTdq9tsKG9NuAiAPpffJVXMCia3Vl92O9FXDrg48O8tkqIgDfmJuM6WsVQV1GeeZC9eLgSPVqHkdeYEZoZU1tDyM3rRp3cSQ6ZUlI2qHCkpBJ3zYDS+6c9X1cNbeyjcCB1EyJ0Xe0vU4u3on+ZW145NbQGQGOfgzXg+3pBgOwRLxPD9P0qqCGQ3OsTN7tTVGb0xOdzo7C7/AaCoPsvlXcsIDWLOEiZP8byM7E4F4AK7roVQ2FniPWgmw3KLD++l9tr2VfEQQWryjOgY8y2ZQG0lFx17IzV2MDgLYqT2f0at5R5DtS/oOVam4a2g+BMWyk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(508600001)(6506007)(53546011)(38100700002)(6486002)(4326008)(54906003)(66946007)(66556008)(31696002)(2906002)(8936002)(86362001)(8676002)(66476007)(5660300002)(26005)(186003)(36756003)(2616005)(31686004)(7416002)(6916009)(316002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7jwFbHfNkA6L0nEyz5RTYBVCphtTUc9AvrP6BkxfVQlpP6MSl4cYrTa7jS1Z?=
 =?us-ascii?Q?ym7gtBCuMSwf73RCRKtIwJPz2v6wG8LTigRU1t0yem4tkYvADru0zgp5fHxb?=
 =?us-ascii?Q?WQY/ZOmZIysQxmsz4EpdZmvq9BIY6PGiBINEU6MSFUgSUXQgZTqi3jCoOEzS?=
 =?us-ascii?Q?faoOt53pu/y0oVTlN2U8uPlIQ34ClCHfD3CAVCrNMSGEyId63H8MNsYkmgSn?=
 =?us-ascii?Q?A3mSV/BEoLniQEmmjRe1OlNZx4AD5paaU9JQxWnVpLX7NKjF5EjqaiTICACQ?=
 =?us-ascii?Q?M+dVZCQxKcjhQTnkJy0fTRzY6hgG01JmLOkX1maQUWGIg6OCKMMr0qtW3I7K?=
 =?us-ascii?Q?VMsPlprSxc8+Wx7YcAVQic98GEwqkIQdRLhk0gKFT6X1WqMVE6U6flScFDay?=
 =?us-ascii?Q?qA1uIXkhEN+YnXrE2OG72fqenhuogzo1bUc4rItlUDfyIxgofMfmTWyS4eV6?=
 =?us-ascii?Q?hy25VGfv3wNU3A+THkCFdWIZDk26HlOPNtIkI6/XZX96uCHLXFyGPIXfVPvx?=
 =?us-ascii?Q?VIYhwmRqSwXM14Hr/fbDG+5Mnkr2LgTorMzERI/3TSOprSKAHW4EEjmWu1nM?=
 =?us-ascii?Q?vSNAc/HfMUESj+F7QIEnPIrdvNz1YstYaT1Z+FJdyPSyLz7Xq2IR48sLOXWz?=
 =?us-ascii?Q?xnVuyzQUGs2H2aCArERwtzipM4BHBozypiRyTizbUC7LTomKOr70iPfdT59V?=
 =?us-ascii?Q?VdEIiohLn1qe+Y8gUnCzmWJu0oBwTDUKn0sC+WH+ehW4voFKxa/S+MLDOeir?=
 =?us-ascii?Q?2XWapaCJTAQVXSbcw54MDgBmG8lXsPsJzzt+ABKLtsfOjzSiC9BPKwwu/Ezm?=
 =?us-ascii?Q?IzDwLtdPDvASlVOtwxbsHzjZTz23S0XcVs/YTGmGAwOBkd+zW6993J0g8GHZ?=
 =?us-ascii?Q?mz0TzGBP9MYDyHFSl0aRG5T03mahMf54O1OpYWJRVESd8BQALxsn6+ZsDfIF?=
 =?us-ascii?Q?JO8XYN7mArevZukTZpahzakhH2K6Lnpm7LoHfTPbScq4iOfZlHul502MnHGv?=
 =?us-ascii?Q?TyCeKilRTz5dvI7k3lIB+iT25TDWc+Tyzz+iy133lfdozHOZb04Xgl3QB4KB?=
 =?us-ascii?Q?3nKSQ0vEeblzpvGQTojRkcH/Me8peo/n/HAeL0NWRsf6dOElP1Uzd9jBsEXL?=
 =?us-ascii?Q?lOUy6J0xwnM4d/mWJsxKlFDidWMtQeo+edLaqSYLrJDzTsVOWcQrteQ+l5oU?=
 =?us-ascii?Q?TAx8ej8wQUtGcrjyq0LLCTOq+mi89n+p19fDOOa96FQav/Hm4sJs+bbdT+VS?=
 =?us-ascii?Q?yRkfw6sRhZh5FkoZFa4Gr5HOsZo5poxEeAy4Zf0N+ULjaQafwHp5sc1VS2dD?=
 =?us-ascii?Q?NxNyGNktEFzcUUBO7IuGH0SET7FXGS0Zr172Z6z7ImV8LYByQB0WuPuVnSIV?=
 =?us-ascii?Q?FR2Z+e79gZIrTWvX+8NK4LDZi/JuPEBYNKtYTgemOo2GrOyRZXLnHkyjig6C?=
 =?us-ascii?Q?qZqY6V6gu3wFFdh0XBFtlCdrX6DIADq5kBJdAueLDzAaxNf1a9EpUq4ra3L1?=
 =?us-ascii?Q?Ne7fheN+nI9nvA+DNxpONWy7rseOQmlpaeHbda33Q0AlHEL3oq7ArpZBeDPH?=
 =?us-ascii?Q?OmwFjXEnpfgLm67rHnccL/fmAUERoFaek7SV8p46ZeDhh1fnWojq8T7XdBTJ?=
 =?us-ascii?Q?Bp+TBIucJr634yJuTM0IALs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfabafd8-a154-4f90-9392-08d9e18e8de3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 12:14:23.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFZbVZSfOmQVQy4jbjo0pJyP0c2+/4BIScWTvyDBCIc8jVZy2EV+oblcUk/PH7lUs0dFHAYW8C5w6wPSuzYc7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175

On 27.01.2022 10:47, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 27, 2022 at 09:48:16AM +0100, Jan Beulich wrote:
>> On 27.01.2022 09:22, Roger Pau Monne wrote:
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -1625,6 +1625,17 @@ bool is_iomem_page(mfn_t mfn)
>>>      return !mfn_valid(mfn);
>>>  }
>>> =20
>>> +bool is_iomem_range(paddr_t start, uint64_t size)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    for ( i =3D 0; i < PFN_UP(size); i++ )
>>> +        if ( !is_iomem_page(_mfn(PFN_DOWN(start) + i)) )
>>> +            return false;
>>> +
>>> +    return true;
>>> +}
>>
>> I'm afraid you can't very well call this non-RFC as long as this doesn't
>> scale. Or if you're building on this still being dead code on Arm, then
>> some kind of "fixme" annotation would be needed here (or the function be
>> omitted altogether, for Arm folks to sort out before they actually start
>> selecting the HAS_PCI Kconfig setting).
>=20
> I was expecting the lack of 'RFC' tag to attract the attention of the
> maintainers for feedback.

Oh, I see.

>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
>>>      return (page_get_owner(page) =3D=3D dom_io);
>>>  }
>>> =20
>>> +bool is_iomem_range(paddr_t start, uint64_t size)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    for ( i =3D 0; i < e820.nr_map; i++ )
>>> +    {
>>> +        const struct e820entry *entry =3D &e820.map[i];
>>> +
>>> +        /* Do not allow overlaps with any memory range. */
>>> +        if ( start < entry->addr + entry->size &&
>>> +             entry->addr < start + size )
>>> +            return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>
>> I should have realized (and pointed out) earlier that with the type
>> check dropped the function name no longer represents what the
>> function does. It now really is unsuitable for about anything other
>> that the checking of BARs.
>=20
> is_devmem_range would be more suitable?

I'd make it even more tight and use e.g. is_pci_bar_range(). Or
maybe is_uncovered_range()?

> I will wrap this in an #ifdef HAS_PCI section now.

What would be the point of that, as long as X86 selects HAS_PCI
unconditionally? (Arguably one may want to turn off PCI support in
shim-only builds.)

Jan


