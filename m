Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D743B4D1E09
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287258.487173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRdAs-0000nj-1D; Tue, 08 Mar 2022 16:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287258.487173; Tue, 08 Mar 2022 16:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRdAr-0000lN-TD; Tue, 08 Mar 2022 16:59:01 +0000
Received: by outflank-mailman (input) for mailman id 287258;
 Tue, 08 Mar 2022 16:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRdAq-0000lH-V6
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:59:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c401015-9f01-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 17:58:59 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-jbY1DcciP5-adSmzYen8sg-1; Tue, 08 Mar 2022 17:58:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4613.eurprd04.prod.outlook.com (2603:10a6:20b:21::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 16:58:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 16:58:57 +0000
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
X-Inumbo-ID: 0c401015-9f01-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646758739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YroyeSNVD2WfZaM1moAoDqtewW2FbFcWokVtkyLnVK4=;
	b=GGhVLQHWu7uzJjUyYMkQs5s3KOmUVm3vOGp7orbGoSjQc6RkQVDOyXY6doxXCoYFRsBZoB
	yvRMx3gtkZVL0g4gEz86YpewsoiegMvd5DpsWrSlwegWSrq6D2uD49U+yhNa8HKSVBc0BC
	aWKtnwyu4nkNMCAib6odeUvz3qmdLKE=
X-MC-Unique: jbY1DcciP5-adSmzYen8sg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW9yFGd8P8ISdFjfXC99k9vJJ/g5O8po0E4cxx6yBHICW4VMmMziuNvj6SFiL0kAU9kGSEhX/oNQLgFv2zyDDdRuoHwDoPW4gHYGJRA31orSw1jtFmIwlF3SH9A6U8bc9m8aLM9SNvsO1NwE7rPkHwMTP41ivX1ftRC+7kI1C8IKDi5QHHSV0T9EIK61+FL+ejjRBAOPXomnfAT7HFEyCW028Yw6VWo6TI+frKjmgkPmBWbzejUeBxIsNHNfXdycBip6Gi0RapyqZwKUEwYZNHm0Ci2UoQBL+iigxzgUxiUt3a9AcQUzbxjDWpEFJWG99gMkMeZFAtuNPx7bO/wdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymkM/QvlWViNXLz+BD43jTuKIk42fHJh3wM19X0MRSE=;
 b=Hh7PBpWgMoehCunNIdmVvrpeZtGqwRBq9ZHC/YwKw0D6qPp3uSIig3O+dcIW5YVtDUle9uyKYLbma4hGcSdpmoJb6VpawwPLltzU8/GxM64VtuXNGc3g+UE0PNNwE8q8dxfLNiplEequkwS1baJsx1OY5n6CY3LrM1nf9URWk+J4QkV2zNW96PZVA0C39D8ullCofguTfxguHzjDpYCyZLZ9K6tuUYB58CAhRtWoqU1gGKZ/3ngAxpegf3a5PwCFhnlsh2b7aHG4zHQcaUdU6A1bmphRQolI/b6f0LI4AigY1626qPJB0h/+G3wdHxh9oF4ae5VJCCkUe933gcS6wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d400722d-d5a2-5bc6-8c16-be1d8e8ee046@suse.com>
Date: Tue, 8 Mar 2022 17:58:49 +0100
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
 <9cce44ca-3e31-bc13-3c56-2811efc36d5b@suse.com>
 <YieHVbKjtXY8vpOn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YieHVbKjtXY8vpOn@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0005.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f979a6f0-b2c7-47c7-8563-08da0124ef1e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4613:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4613C3A4A88E3F11034369ECB3099@AM6PR04MB4613.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2udqJUIX7/Er6gfQCzR+bqRux3JcNbaK1nQ6OnCX68an14JxHVASKSrLNxcqd6AL3Td1U0xabmjlAQpVSF9nuU/MxYWavccMQK2tEHnn9cY49bRl44E9ZSOcPWGshhXUVGkPcvTAcvHCCq27AnTHmPc/lW1mT0S8O9y2B6rapGeUVgQ8Vtfa1aKIjGSL7K4fBEEZxuh/gOIIGpSxHx9MRwXQX2uv0pdKGC9Mv+KDlYEYbOhCO+z+8dH2M/xFsrrCXtm5+DIUUdUq852swUW/HqGQPkbmdKdFUolnYBmQ3CjN4/YXE/TZzm1ynNKfbEe1v33y+ORHXvF7t8a47ru9yR7cJ4jcyE7PIjIzT4A/EbhaiPDj9ORACLEVm5o1Ggghdz3GhUP8sdDGCUxIcQd6wd+YGBROygWUur0zZiuyu1ncyIhPcStqIcidjMqYvsh9iwFwFq2XyPVSmj+Vb9eajZ0LXdgYsnu6NkD4Wj0WKBYF1lwpD45x2uz1A+neytOnpjar7O7MDNtRkjO76r8N6IPBitLnLo58rkxFMl60z4YHbvhGyxK7EPabnK78DUXwv/Tj4lGZ6pd+R81z5oJCYHIhnBMq2r0pEJpKN7mc6tJY12yaFoSK1+gqhEpsBmgL/Eo2MtlVuXAiyg4v5YkraJ8v2+4XEA1blPXFBp3IcAyg13/X9yD1/w3NIJySxmLW/fhSx38hYlopCHq79YezkryJo4qXW8D4FYP5ANBmoWjfb+Iq1uCrnkGxBYjWp9qw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(53546011)(6506007)(6512007)(6486002)(26005)(38100700002)(8676002)(2616005)(66946007)(5660300002)(508600001)(2906002)(8936002)(66556008)(66476007)(31686004)(186003)(316002)(54906003)(36756003)(4326008)(6916009)(86362001)(83380400001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3v9jWH8XgfSdnF/tBdCOdjOaDGW7TQuhmLgdJvGhoCKRek7y7P7Yrbc5zt2j?=
 =?us-ascii?Q?lArx1JIY9XuhrDI2ZfY0PdmjUcqUIpAmoCDYZpzLiTyW75VcpLBQlQgmDQ7M?=
 =?us-ascii?Q?Gx6CtXS5a5rvo6LsrVJ9YLWUeGApEmU8xedTIImiNEKSGCGnAsZoN/inDhjb?=
 =?us-ascii?Q?LobBs4XAYwlKlgu1E7SGSuN1Kr94UvernziAOllS+HVBemIx/+tqYGgtIhet?=
 =?us-ascii?Q?wn0QGD6SA4KZq8P663n/DZyPqhL62GunUu4hrXKQYmBJxCXCuk4Zao/MFOkY?=
 =?us-ascii?Q?CrYJXavWiAS7PFg5/kMpdUeuyugMfIJNgAuOmFUBZHUn96VK6Qo5LzAFcuDF?=
 =?us-ascii?Q?q60kd+f8r/cK0UgfmvG1uTrWd3A+JCLsOchKS2Fwxfpu/V571Nwf2t/JKYQK?=
 =?us-ascii?Q?OjMcQU9FMmBqNjjnlnlLnqeMTH0vLI9loRp2UY1rpTMxt/UDuepUAtowvW4c?=
 =?us-ascii?Q?zyzlLZxaemEuWhv90gDKJ/SsbOeA0PUU4BdktFlpXJa7bmAkAA47hNZbK0N1?=
 =?us-ascii?Q?RrTXzTiZXPD7qoCkEsH/NqQ7if4zHoY7DocP0keuNRct7fBdQ8MPzNj+cgLG?=
 =?us-ascii?Q?1yuvDsMgkyZEMGdyaYVaUVVMTS1ug3Y5WXl3lMFbxvh7iF6cxoE5MaFt1S12?=
 =?us-ascii?Q?8YZ0xu0j8v/FZO+hUJLuUv1rFkKEGW89vsMvUdErvJeeBEZFnkgkt4rZsrhu?=
 =?us-ascii?Q?1IyVAbJTWo6/dsiMAWIvbIB/Dk0WVWzxLCIoAQ6klSPBJFARKxn9O2mLcUqX?=
 =?us-ascii?Q?sPlvKvuvAaUGRxMYH1NThsrF0OXacOgaKdSm4kHeBIXeXZXyLk8brIuA6yx9?=
 =?us-ascii?Q?kXjMcXSdI/8N8vrQL79++7MsZjjW3TAfNtE/nIhAb3x4l/A2Pw8m3DUNbeQU?=
 =?us-ascii?Q?yybmlsAMsJvsdRYLpINrN84lSc5SYj70wOrERh8ljZr8VOsU74kf+t5VqjdE?=
 =?us-ascii?Q?cicMuf2s0pb0gt75gjFtc2YTJtw9BvG5g0476JLcYxoGma5j6CIYcKyZvANH?=
 =?us-ascii?Q?QQpAbDp7urYv2c7Y3JEv8vuWl62gN1LWfAPDuzhtSobNI/oPPSQDcvXo/Pcl?=
 =?us-ascii?Q?WqmpW+jX9JcfJyiSFpmHC5KiLSvLPZREWRLZtLYxgCcYxij4Oqo79ybDOwXd?=
 =?us-ascii?Q?UrPQQ/CXpXMSUI+E8LE8sZ4n/2G1SWG3a3yAj689BXqQVH24gBp8Smk6PBF9?=
 =?us-ascii?Q?/Jx7MFtJa11uF9htRmpw9+l/UdVMKoeJvUo8o5gFYNXfjR1iiAV/+UAiDZf7?=
 =?us-ascii?Q?WcBE+JYPGi+Mic1cHMV/JI6dD8qJkxboSLRYRhznigsc+EQ5eCxckFo+xncz?=
 =?us-ascii?Q?r/yDiCitoeG3HgjZWTpFG9NgFVWUJyRwejNjkbxSkRZ2+/HdqqOVsY/yVTnT?=
 =?us-ascii?Q?J+dp/AR/8l7vbKtTsdFhkxaDVfMBqUBg37nNmmzcKUdBg99niUkJd03V8v86?=
 =?us-ascii?Q?YJtrbsHbHMCpk4GAV/E7X7UMSLeBvumUSzphJpfCBqJgPO/o6FNJY28p4HH/?=
 =?us-ascii?Q?qGm5l8cxAIu1HLWvYVr73FeM0TVp2Pa4zkJnFVrHRAzGULLv8Qb9793Wit7h?=
 =?us-ascii?Q?zb8U8UA1uvVp40IUDwDjlAMA2dYlJBfEdsS+bNWKoYYX4T48NEBaoFR7tmqy?=
 =?us-ascii?Q?9sMO7YDmrFt8fGNYGjjhJJQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f979a6f0-b2c7-47c7-8563-08da0124ef1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:58:56.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myIJDCVwGhSTd4Gw/a2EMg9vi37e7aoLHSSzGv3QdYYj1bC+fq4PGur5FL318wPmq3gNzOP7wjmdacYbMYgVAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4613

On 08.03.2022 17:41, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 04:13:55PM +0100, Jan Beulich wrote:
>> On 08.03.2022 15:46, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Mar 08, 2022 at 03:09:17PM +0100, Jan Beulich wrote:
>>>> On 08.03.2022 14:49, Roger Pau Monne wrote:
>>>>> If livepatching support is enabled build the hypervisor with
>>>>> -f{function,data}-sections compiler options, which is required by the
>>>>> livepatching tools to detect changes and create livepatches.
>>>>>
>>>>> This shouldn't result in any functional change on the hypervisor
>>>>> binary image, but does however require some changes in the linker
>>>>> script in order to handle that each function and data item will now b=
e
>>>>> placed into its own section in object files. As a result add catch-al=
l
>>>>> for .text, .data and .bss in order to merge each individual item
>>>>> section into the final image.
>>>>>
>>>>> The main difference will be that .text.startup will end up being part
>>>>> of .text rather than .init, and thus won't be freed. .text.exit will
>>>>> also be part of .text rather than dropped. Overall this could make th=
e
>>>>> image bigger, and package some .text code in a sub-optimal way.
>>>>>
>>>>> On Arm the .data.read_mostly needs to be moved ahead of the .data
>>>>> section like it's already done on x86, so the .data.* catch-all
>>>>> doesn't also include .data.read_mostly. The alignment of
>>>>> .data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
>>>>> up being placed at the tail of a read-only page from the previous
>>>>> section. While there move the alignment of the .data section ahead of
>>>>> the section declaration, like it's done for other sections.
>>>>>
>>>>> The benefit of having CONFIG_LIVEPATCH enable those compiler option
>>>>> is that the livepatch build tools no longer need to fiddle with the
>>>>> build system in order to enable them. Note the current livepatch tool=
s
>>>>> are broken after the recent build changes due to the way they
>>>>> attempt to set  -f{function,data}-sections.
>>>>>
>>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>> @@ -88,6 +88,9 @@ SECTIONS
>>>>>         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>>>> =20
>>>>>         *(.text)
>>>>> +#ifdef CONFIG_CC_SPLIT_SECTIONS
>>>>> +       *(.text.*)
>>>>> +#endif
>>>>>         *(.text.__x86_indirect_thunk_*)
>>>>>         *(.text.page_aligned)
>>>>
>>>> These last two now will not have any effect anymore when
>>>> CC_SPLIT_SECTIONS=3Dy. This may have undesirable effects on the
>>>> overall size when there is more than one object with a
>>>> .text.page_aligned contribution. In .data ...
>>>
>>> Agreed. I wondered whether to move those ahead of the main text
>>> section, so likely:
>>>
>>>        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>>
>>>        *(.text.page_aligned)
>>>        *(.text.__x86_indirect_thunk_*)
>>>        *(.text)
>>> #ifdef CONFIG_CC_SPLIT_SECTIONS
>>>        *(.text.*)
>>> #endif
>>
>> Perhaps; I'm not really worried of .text.__x86_indirect_thunk_*,
>> though. When adding .text.* that one can likely go away.
>>
>>> FWIW, Linux seems fine to package .text.page_aligned together with the
>>> rest of .text using the .text.[0-9a-zA-Z_]* catch-all.
>>
>> There's no question this is functionally fine. The question is how
>> many extra padding areas are inserted because of this.
>>
>>>>> @@ -292,9 +295,7 @@ SECTIONS
>>>>> =20
>>>>>    DECL_SECTION(.data) {
>>>>>         *(.data.page_aligned)
>>>>> -       *(.data)
>>>>> -       *(.data.rel)
>>>>> -       *(.data.rel.*)
>>>>> +       *(.data .data.*)
>>>>>    } PHDR(text)
>>>>
>>>> ... this continues to be named first. I wonder whether we wouldn't
>>>> want to use SORT_BY_ALIGNMENT (if available) instead in both places.
>>>
>>> We could use the command line option if available
>>> (--sort-section=3Dalignment) to sort all wildcard sections?
>>
>> Depends on the scope of the sorting that would result when enabled
>> globally like this.
>=20
> I'm not sure I'm following. Don't we generally want to sort by
> alignment in order to avoid adding unnecessary padding as much as
> possible?
>=20
> For any wildcard sections we really don't care anymore how they are
> sorted?

Sure. Question is whether sorting is limited to within any single
*(...) construct, or whether it could extend to adjacent ones. IOW
whether the command line option strictly is a replacement of adding
SORT_BY_ALIGNMENT to every one of these constructs.

Jan


