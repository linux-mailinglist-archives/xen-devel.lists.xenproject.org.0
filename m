Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025D4D1B6C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287059.486853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbXH-0005LA-95; Tue, 08 Mar 2022 15:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287059.486853; Tue, 08 Mar 2022 15:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbXH-0005Iq-57; Tue, 08 Mar 2022 15:14:03 +0000
Received: by outflank-mailman (input) for mailman id 287059;
 Tue, 08 Mar 2022 15:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRbXF-0005IQ-BX
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:14:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c443c9-9ef2-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 16:14:00 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-aBzH7QdpOUiKyfcMDCCfIQ-1; Tue, 08 Mar 2022 16:13:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3835.eurprd04.prod.outlook.com (2603:10a6:8:3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 15:13:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 15:13:57 +0000
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
X-Inumbo-ID: 61c443c9-9ef2-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646752440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5OoU96Ap4k4K+NtTZdmEV9LXE0oO+QoeBpkhnraEBSs=;
	b=iZjntBRX46+gFAmGL3TOp3/iU+OYIyq4Bc1+7CKwuPMYxDXmoWN3qfJqswCHLfb1bCamLE
	F8T59dH1hDtWSrDQRwkBu9NVpCYyjkGQng7o2cYiOJpfw5jJI9ybuz/LA7j2dYp42EEZXW
	qaGTZxEtDKMtdgtvDmhXCunaYOUQoO0=
X-MC-Unique: aBzH7QdpOUiKyfcMDCCfIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8+h7uaprwa5VAt8Rf5w0yYBRM/Icgalk8xJs7vArYwAW3vkhmS9F6ho7KtZHcQLSF0BkyI9lnXmJkBChBzRCyc3f00tJtuikM7bEsHl5j+4LxC3HxEVyYZmhQPgZTK5XPRyW4Mr2OdyVy2nzLzpzjSf4uybHE3A62G+xqTc9g4dpSPKPe3wMQPdlrfncVfOIpwDrOmNw5q/BFpeEPP/xNrJ+QwRGY/Zg8fPoZhZFqYtFoXCK6yT/RxjkJ7jhP2VN0k0FlhvoIUzBwRl+/EjJqWL+xzaJq6i1pkaqPlEpU977kUHH3uA2RuAAoeKrIoMLszxqrRWfafZvFFwK1fMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDJT662Xp0+WUPHCjz1OH2JmJiOiUBGXrTsFZh2EqGc=;
 b=BOe2yVxMPjoGdyhUz440wWM6DEiyyHcxQM1eBeUnANybVvbXX4VkWNhysTcldzIxbNUDc0kMBw1yjFA5upvvJHLFMwi3Iic8GHJotj8uHge+gEujFtUu86kP/PLLLkmWdO8Pqgly+NoSasfFmAgiW7K7WzJL5zDtuMbEiXY9a9k6wcBdRjIhOQhKTwWAd0c7OMKOffGXUTFoOPtQtDgUsnc3ctcqy13oJBLGAaMIxX4dAZJeFGZIMv5YNICi6qlINWFDfD4/PWNen9nNEgMgZf5FoNlgqfdTxgnOpe2dGr5dpbWRNT52PSiWck+fhE9BVa2sAH9uJCqYEwahGuO40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cce44ca-3e31-bc13-3c56-2811efc36d5b@suse.com>
Date: Tue, 8 Mar 2022 16:13:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 2/2] livepatch: set -f{function,data}-sections compiler
 option
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-3-roger.pau@citrix.com>
 <c35415ef-b3c1-cc1c-2fb2-aa2de2602cd5@suse.com>
 <YidsSmPV1Pqulp+h@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YidsSmPV1Pqulp+h@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0072.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa945712-bc74-4be3-6f5d-08da0116442f
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3835:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB38353F28E321CD730AF70222B3099@DB3PR0402MB3835.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pwEX0iNQ4WNwxL2j75U71QNIHj0ojMerXruoBpiBr+mARTIWbBKp3QwRdqjR3GrWdCZY0vb+e3jltTZ5TGio5jeBgUbaHmUdUHh3Lgi/vrN14jmnG7Tcy4+mDLLnn5kmJvjupyAooQlDDu0qonk/QcsLFldvAzxCZPnFDgohz7Vcrp/MffrQr1eOaPFg8SXQuqbmEkvWpYd5jcPevO5PK/y/V/lpHbwle9uQnQywo2CWD+y0LMb6eww2mL9r1/DnYUyx8n/exn5CvmhjwY8hpQoQwIZutxyRL7pG+P0dYKMBuPgMuXxKMrEjquMBOlqQh+QVEIwSVIkUpxBZE4qHBhEi8GeAAMPg+OYZSXXXQplDpsyQV9Rv17eqpWvOweBEeXZv393rEGArOX2Ad+KkUtYbwg7y3EzAGsZ08bTivQLsneuf7EyyQLt9L7bS+81t91gOyN4TUhkSWYenZLxld+oru/DhA8GbDfmi6bgGjZnj36wOv5Hbky0HBTaa0lxGr0WWnWsa/Pj2pwcf4ORyRV82NJfjU5bQr4S8Xv2BTbHmfDDi+AyHYEM+uN2PI3M7yoFEJLhDa/EbMvTDIXudwfvN3Z4nqQ8BnVwhCRWBGADowEcUjjrNlRPB9cogsfl9iJsnLyXgRusM+9cMr6MqpLx/ChKpAAsDmIj4iHY1dvDawWS4gFpi7IoV+5lsqwKvnNaoj3MCJXk+GsrwZ5NLG49jXeYD3zni81LuTppkY7I0reLSAvdXIh4Gqzu9Vhkf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8936002)(5660300002)(53546011)(6506007)(86362001)(8676002)(4326008)(31686004)(36756003)(66476007)(316002)(38100700002)(2616005)(26005)(66946007)(83380400001)(66556008)(186003)(6512007)(6486002)(508600001)(6916009)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iuKc9dF+3GkM5FUyEoZDpkA+JwDDrhYwzC8dzMImCt3+2SJseLrXljgNkRLC?=
 =?us-ascii?Q?qEPiKUAfk2h3c2eksabeD539JXsQWRXHdrRH0yPMyFP7ikw4rCjG8MmGdcKM?=
 =?us-ascii?Q?LWmsiZgzaTuKqRHX1IxcqMIX6npROX+OBr6tVXPghuiupgYjCKG0e5/FneJK?=
 =?us-ascii?Q?Si9367YiVYMRC4bCy799/fb3BdeZsicBCkt3mMX2OcYC+ahAH++4iOfATMBd?=
 =?us-ascii?Q?fSsyLWGs+eGl4k119Q6X6fOyeeip96+XZhEA9IC17pOBylULLuLwkpOr20/V?=
 =?us-ascii?Q?WK/CsCVhzj/7htGF6AoRdcNn/omZ9efN04VHSpxsVVQxmwQczid5kpInqv5/?=
 =?us-ascii?Q?WGn0fpZAkMmaIdtkRS+dORxB6JYQiZ568uRyMtdFG/sFMge3VlpUr9QigUyE?=
 =?us-ascii?Q?d98SWV7IkgWiNqCI3ZyaFO/KefjPiTLCVJ7cgjthY6DO2jQ3AKWSASyTBXmW?=
 =?us-ascii?Q?WocgTabfTzFdQl2PJTvCacctgbrkB1N+JUxi06jjvFmy5xJKczyI/1CsxqAu?=
 =?us-ascii?Q?HE92trdToN9VHaQ4ZzaRCrziuih81xlBxUKbut5MvL/nsPH/n6Myye2kS00W?=
 =?us-ascii?Q?pfYy3npM+1F9lx3xWIPep/msM7/5oI/lgQYuhYU1kQslinB8aVdloCpPN+ty?=
 =?us-ascii?Q?m2MP8vqDoZumuUOSMB4QRo4zTTkcjx+S/rXCW/4FipMibp/Qg9Btlw1KffGo?=
 =?us-ascii?Q?O5Opb1upRI53yOuBqiOX9/LuSsPwEihuT3hACvVejiuG9Aaj4/zXiAvbTXdF?=
 =?us-ascii?Q?oPoK6ZuE32CL4GrC4CAS4JLbUqXCfgClO7FE57eIeU6tj5Zr75KOEziLi09a?=
 =?us-ascii?Q?vSoyBP96HfCD8/ncQWcg8lDSCetG/aJT0MrqgKkK7pGh4D0dm2XIwHOy9Kyb?=
 =?us-ascii?Q?tQCJPPr6t6EWHzvQVrcpQlyKVG2pMSpMDMbphFIZ6RSi7Xu29hEaDC1fijhI?=
 =?us-ascii?Q?SdRsb0wzSg+cgBts9V5cPW3rifZkFIDemB2FGZu0BePwqKZyjTzyRAVShbTF?=
 =?us-ascii?Q?ZqEtKY9DhVmIRsIk3cTeLpCsjGArhHOv+mhIz49JSC/21Xnv7k/CyWYjpaMW?=
 =?us-ascii?Q?SchNV4GD778FxM2V4tMXIiD67YLznhkclq3mUdu/eLkcf9+tv3TQLYXtY3ve?=
 =?us-ascii?Q?YKjfM0pOOdNmDenlhXs2NLHe+NiXpoXKRwbjQ3LYxnRlx2uXY0TtcGRPckE6?=
 =?us-ascii?Q?KzSfyWRUfzQ+J149vUrHpb/NGJqz+qwODIkVWYVYpHRShnj75AoTn1tVYjWd?=
 =?us-ascii?Q?v+lxQmAqMxthjmAeFid/vLak0Z9P0EyvmPjMPy4Ci7SvEbD5YeTkC7Kn/FPi?=
 =?us-ascii?Q?eVdFgRQK6BZLT2IlBfwCirazoPQILr2U2zZllymOMYQTgiPq1AmwjTjJQIcK?=
 =?us-ascii?Q?k54R5ii5hrJvpsk+jZh78l44eL2k8TNR87z9mWvIvBRZ+Jh0RN1eENRxiYFj?=
 =?us-ascii?Q?qpO2lUBp+DQ1ezR8m2jYBeT2cSXnNV5XRJn1S9uT2jOwZ2SLvq6TH1fjJq2M?=
 =?us-ascii?Q?x+B3KoJis2k98/4FOFLbfr6uhYJtyQTDjiwfb/nieDfA8b7napmWDNGOzYj4?=
 =?us-ascii?Q?ejw0QnDvDT5zJ/ppiDoG+Kgedgz6drR9Hnw9M+naJA0SRYPwuz0U8cK48KIW?=
 =?us-ascii?Q?TRs4y+l+wwHj3vuKYGHPRIs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa945712-bc74-4be3-6f5d-08da0116442f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:13:57.3245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxzSdVZt79gxUFfFjpbJuEV6v7Ozoayy0qXjyah2LJG9de9VaIngTvHd0oDc3VgXBwC675hU17Ey8iB9Sjn7HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3835

On 08.03.2022 15:46, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 03:09:17PM +0100, Jan Beulich wrote:
>> On 08.03.2022 14:49, Roger Pau Monne wrote:
>>> If livepatching support is enabled build the hypervisor with
>>> -f{function,data}-sections compiler options, which is required by the
>>> livepatching tools to detect changes and create livepatches.
>>>
>>> This shouldn't result in any functional change on the hypervisor
>>> binary image, but does however require some changes in the linker
>>> script in order to handle that each function and data item will now be
>>> placed into its own section in object files. As a result add catch-all
>>> for .text, .data and .bss in order to merge each individual item
>>> section into the final image.
>>>
>>> The main difference will be that .text.startup will end up being part
>>> of .text rather than .init, and thus won't be freed. .text.exit will
>>> also be part of .text rather than dropped. Overall this could make the
>>> image bigger, and package some .text code in a sub-optimal way.
>>>
>>> On Arm the .data.read_mostly needs to be moved ahead of the .data
>>> section like it's already done on x86, so the .data.* catch-all
>>> doesn't also include .data.read_mostly. The alignment of
>>> .data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
>>> up being placed at the tail of a read-only page from the previous
>>> section. While there move the alignment of the .data section ahead of
>>> the section declaration, like it's done for other sections.
>>>
>>> The benefit of having CONFIG_LIVEPATCH enable those compiler option
>>> is that the livepatch build tools no longer need to fiddle with the
>>> build system in order to enable them. Note the current livepatch tools
>>> are broken after the recent build changes due to the way they
>>> attempt to set  -f{function,data}-sections.
>>>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -88,6 +88,9 @@ SECTIONS
>>>         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>> =20
>>>         *(.text)
>>> +#ifdef CONFIG_CC_SPLIT_SECTIONS
>>> +       *(.text.*)
>>> +#endif
>>>         *(.text.__x86_indirect_thunk_*)
>>>         *(.text.page_aligned)
>>
>> These last two now will not have any effect anymore when
>> CC_SPLIT_SECTIONS=3Dy. This may have undesirable effects on the
>> overall size when there is more than one object with a
>> .text.page_aligned contribution. In .data ...
>=20
> Agreed. I wondered whether to move those ahead of the main text
> section, so likely:
>=20
>        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>=20
>        *(.text.page_aligned)
>        *(.text.__x86_indirect_thunk_*)
>        *(.text)
> #ifdef CONFIG_CC_SPLIT_SECTIONS
>        *(.text.*)
> #endif

Perhaps; I'm not really worried of .text.__x86_indirect_thunk_*,
though. When adding .text.* that one can likely go away.

> FWIW, Linux seems fine to package .text.page_aligned together with the
> rest of .text using the .text.[0-9a-zA-Z_]* catch-all.

There's no question this is functionally fine. The question is how
many extra padding areas are inserted because of this.

>>> @@ -292,9 +295,7 @@ SECTIONS
>>> =20
>>>    DECL_SECTION(.data) {
>>>         *(.data.page_aligned)
>>> -       *(.data)
>>> -       *(.data.rel)
>>> -       *(.data.rel.*)
>>> +       *(.data .data.*)
>>>    } PHDR(text)
>>
>> ... this continues to be named first. I wonder whether we wouldn't
>> want to use SORT_BY_ALIGNMENT (if available) instead in both places.
>=20
> We could use the command line option if available
> (--sort-section=3Dalignment) to sort all wildcard sections?

Depends on the scope of the sorting that would result when enabled
globally like this.

Jan


