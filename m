Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55484D2D10
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 11:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287681.487783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtT6-0006FO-HN; Wed, 09 Mar 2022 10:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287681.487783; Wed, 09 Mar 2022 10:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtT6-0006C3-DK; Wed, 09 Mar 2022 10:22:56 +0000
Received: by outflank-mailman (input) for mailman id 287681;
 Wed, 09 Mar 2022 10:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRtT5-0006Bx-9Y
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 10:22:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1795cce-9f92-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 11:22:54 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-asDt2nIJOwWrIsndu0hbVA-1; Wed, 09 Mar 2022 11:22:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6128.eurprd04.prod.outlook.com (2603:10a6:803:ff::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:22:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:22:50 +0000
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
X-Inumbo-ID: e1795cce-9f92-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646821373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8zZxUIGz90owRPjSPHMX+0Ekmd7aZzKBfkVxIeHqlVM=;
	b=WOWPOzUhFnH71iFsbygdYYoXQawd+nOlFVgeGQ1tFb62+9/gAvDbVSDjCnGM1rcBMKEVDg
	WNCzSvATy+OQ+QW+NCPjoGdkHfGl+ZmdEelv85P7LCLgfq5V8OgElA4NS+2BhceGH8uNQP
	r9PH0b6QK1YvKsXR0NDW66vlclO4JRU=
X-MC-Unique: asDt2nIJOwWrIsndu0hbVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZYvNutg89wb7RCHiUdadQPYv9A8W9+S9y7pTmPSSCbbSH9JqluNG0+IZky0x0xIhBHwN0yoLBIYjSxdZOLZafS4jri+aE1aF8VqzMjR2J4lJ44fS3xvIMnTGvC8PXwgrVdsx4wNwDo52kzLanbbZy+LvzM5EX0SZnAl1lI3EiagUpFdpCHFeMXXwWFBcRGxeVK0NNaOuPsdLZ04o/tZRs0G/yXxnLLdDgfIvlZCqRjVl5ckHgDHtpVMyjkO5EV7MiEhFpT2jDuvQMVVWGiq+P5rbtxLy8tJrOo+tXMOROI+bLIi3jRUHHmkn1W6dVDIfRrw22/Cl4Poa+HXjTeTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOPriPz1CXUTNJX0y+D5Vl5H3iHJHiAJV/OvcWzFC70=;
 b=i3TD+0UAgmN5rOmcIXUEccetDL63QkUDA3iO5uAqKr+K62TCWhZ7yqeW5qjUDm5bJVKAlIAX4ZHkuLpvXCr0N2ObGdqTFc2Hk9KSb5SWw2/zkZUj0giPrQAJTGqnMZ+KzSSQQwHI/c9ApA9kGvdlPq6q1zsz2yR/WdSv+YM1KRwRUvGeGosxyrZjwE5yYHpdlRclVrrDlH8bpCZy8HuvfBYGv1uA21HDNTVjvkpoZzVAkmsKcRr0uWVPtnzuSALgeW6o6SA66UvmYoUAdUFt5uYPN3bfPeY4/39OvFoN3B+do7KptFM5YqOleFJ5itrValWAR+cScwgxUMBR+sZBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0f67b74-3443-2b10-ae94-80a284269265@suse.com>
Date: Wed, 9 Mar 2022 11:22:43 +0100
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
 <d400722d-d5a2-5bc6-8c16-be1d8e8ee046@suse.com>
 <YihzsHCgjVd0g4b5@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YihzsHCgjVd0g4b5@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a09f847-5640-489d-cade-08da01b6c3d4
X-MS-TrafficTypeDiagnostic: VI1PR04MB6128:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB612890B5C4C333FFD50E5EF3B30A9@VI1PR04MB6128.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5CY8od/swQS3CDv8zV1PQhCa2S+0rpzp5+UxuCekO83fvv68r2i+u/ZQOw4697E6z5vI8NXLvUeZ8CbrYqN20FNW8HFAa/PfL/HGXB6mXFbLBED+NTKAVUDygPAx9jPmCxU+KEKrdgA5Wa1Kzy0DuOKEAfNFR72H45eJC5J9CRPpF8ECGaJWWnCU7vVDSOY5PWGi5rUYWgNzbZi5HUoQvJCB0R//E2Dk2k0ejquEVl83WmItDrlBxLkhCuzhFHTfVG0lGKJCVRAuYtB9aGzCHkV9MqwlLhO91esQ11uPVbKSnamY1JP9xg/yFawpR9XZIaK7aRBvsmTVcF/SBtDtV04TYxj75CUr2VS4jqZPqp60o9dnxmGJCDG5HyvY1Z16Z91/Du2tqwItCIu9mJeAu1wyvyz8+YYCbDRhiTWwIMoFCwOajcA67gq7qQM+hZECaG4sSG9CpCrrBH/4hDbtcfqxI5KanD0/F+pv4G5XBMZkI+vBoY+Sf6X1pyYxao6Fk6Um4V+qRbiovWF5FSV6NRF+h2SUOXlXhHMGCGJzPNV+et8sIbdC5WvsAUJC6o4GIngv7fSkVLYZ7UYjga9CaRPsPqg3eWziLFuZCT+StCA0xpTWBqXXbU0OZ4Cyyl+g4SvdAehGCZvZs9X4TqlwVLrdLqEQIEbRw+82RU6REZcca+SC3vSsbpnce+tY6YQfdDjFGlRMGExPqIFbBlqSaz5DnEWhnYX+FxArDmoSxwBvH6HuNOzrORnS+xR4vdWv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(316002)(31686004)(6486002)(66476007)(66556008)(36756003)(6506007)(8936002)(54906003)(6916009)(5660300002)(83380400001)(508600001)(6666004)(53546011)(26005)(86362001)(2906002)(31696002)(186003)(38100700002)(4326008)(2616005)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fmCoKYsi7xdHriUm0Ca/gLkMipiObOks1vr8rP4PQWW4z71EkIFF5pkUX7ch?=
 =?us-ascii?Q?d9XSKpCMRQHo2ouJINFjbQ6bwyYi9Ot85q2L/9WjTXWijaTwLq7odLyPtjgt?=
 =?us-ascii?Q?hSSSAilBZOdipbMB0+eRB+cTsP6xei0nMCVq/0KhfLES98RgVVsGt0ucoEb6?=
 =?us-ascii?Q?qXwfaQE6eZj1zk7Mf7T4hTYmyhpKq+y/98Q5BCktgrMHtRwn/8k71qUzVjpy?=
 =?us-ascii?Q?9qLAFdPbad07Yu0kASpXAOTZJkiBYbCS9sDkV8+oJKm5oyRNZJqlbPUYT2Gx?=
 =?us-ascii?Q?mCnZWDeSXpBC5ANHAK2bZHjjHE7PKqwH3ulTznlXIyzc7gL8Nut6rOm5WlXE?=
 =?us-ascii?Q?6nPpnMpZSMhJGH4vk+vs0hTV39TwlfiFONfn8c2gd9DRd/5d4Hh3ay7qY3Bd?=
 =?us-ascii?Q?ryByOz+yviOOrCYt7RMW3wlYLPbgxrX+Sbmq24EZw+jxBvs+4fvxBk2u2SQ3?=
 =?us-ascii?Q?THDDczYHXU76YO35fNrU6q4JNO+a2fkJYwvLIBjop/qNp5ybOi8LagSnc0MZ?=
 =?us-ascii?Q?XK3ri6kXQUJIpAnVCK/0dNv2wCR1nUKlD8BhFDcZZ9wx92hHW1kDWNTdiULs?=
 =?us-ascii?Q?yvG+h0qXa5wuh4H9v7F9Y4n4FRINrR3mQWgk3vgglWwYjjJ3PGO4tRUeKq7o?=
 =?us-ascii?Q?4hF3QN9It1zUne6LpU7tTnoYj1+s563Mp6qKr2auZph6uzkdpKLlKikOlUjA?=
 =?us-ascii?Q?isPuPUoF7SNyMc8WsyzRXn1Jg3qSwP5Q4NQ4nUhiC1Y23rqGyfUFdIqcDoi/?=
 =?us-ascii?Q?HDIm9N5XnvPB6cCf6aCy5g3GNdO/mVDf/YzBZoob4FzGiRo4T4sr2rcGAcRq?=
 =?us-ascii?Q?51N3En/yG6PSG9fUh4zz4bQuB4lAkdDcCj6jybWAZVvO1QLNZVW+lBmrtb2x?=
 =?us-ascii?Q?EW7pXVwO4dJaNTz209CLew/OqleezQODFZE5qDW8KCp0YFanmxxxvKlPo/TU?=
 =?us-ascii?Q?6KVtyP8NO6ZFccglHZWpZwxCTFxtV2Nzh/1FsGHf7LI8VUzn1GnKVDobjDkZ?=
 =?us-ascii?Q?H7hshrpTga5lmUw1gpGnl5PFN+m9Hiq8dDtY038hTdJ0B3k4sZ0WSdZHzhev?=
 =?us-ascii?Q?bc2ID9mK8MFoj5Nv0tx+SQk5OKkbTDQJxS++jfqcOYiiKDKQITS0MihKtvQU?=
 =?us-ascii?Q?sdBgxSsRyL5YI5FH9vEhwx1CxxYHLnuZMbxrREeu58iTOaxOMsZWepZC0KT8?=
 =?us-ascii?Q?CJ9fF4V57IpH9damdaxojMIjFy5JKU/JK1/fOgSd4WBnen4E+r3tkXA8oh8V?=
 =?us-ascii?Q?9mJ+CHsm381XaWNB/YISJC2Np6SerAL1c45bOO+RsvAZAAbOySaHI+1Hu1xo?=
 =?us-ascii?Q?cBS/Zo0/GgTm2Nm5qKzS7shp0sIwZKCdc5XtxoZVvhoaKh25Jq/c65Sr42Hp?=
 =?us-ascii?Q?Fh4aJDHjkba+GRbOz/6YHU+XfE4RSccMyCc1tRsT+J21oLle1lf2Gxyn8Bzb?=
 =?us-ascii?Q?Z3pP3ptpKsC1uYID5+Dj9xhwILSoddPWfX5AFVZ8YYmSlD4/ct0fuUmWLvKZ?=
 =?us-ascii?Q?d7NB8GmSVoIZtltHSz++PudsKJgb1FL7hvlyBhPY7ZWdqyRTu8Ncr5rjHU/Q?=
 =?us-ascii?Q?z00V4+TmZXwIqVn5n3qFb0fXVzL2YYhtfLjncx1xQRbGUdR8lCPbDSbEgZx+?=
 =?us-ascii?Q?Y53YsIFFdnCvmEqIfBQRdWs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a09f847-5640-489d-cade-08da01b6c3d4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:22:50.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkAfWzcdPzxD+gziBh3QrDK+b9Zl7JE1g8Ow7FYauXSbvFl1qNf+OQ3lRb7sfuiyNDYVj7cEYjrRD4+/Urv4DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6128

On 09.03.2022 10:30, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 05:58:49PM +0100, Jan Beulich wrote:
>> On 08.03.2022 17:41, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Mar 08, 2022 at 04:13:55PM +0100, Jan Beulich wrote:
>>>> On 08.03.2022 15:46, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Mar 08, 2022 at 03:09:17PM +0100, Jan Beulich wrote:
>>>>>> On 08.03.2022 14:49, Roger Pau Monne wrote:
>>>>>>> If livepatching support is enabled build the hypervisor with
>>>>>>> -f{function,data}-sections compiler options, which is required by t=
he
>>>>>>> livepatching tools to detect changes and create livepatches.
>>>>>>>
>>>>>>> This shouldn't result in any functional change on the hypervisor
>>>>>>> binary image, but does however require some changes in the linker
>>>>>>> script in order to handle that each function and data item will now=
 be
>>>>>>> placed into its own section in object files. As a result add catch-=
all
>>>>>>> for .text, .data and .bss in order to merge each individual item
>>>>>>> section into the final image.
>>>>>>>
>>>>>>> The main difference will be that .text.startup will end up being pa=
rt
>>>>>>> of .text rather than .init, and thus won't be freed. .text.exit wil=
l
>>>>>>> also be part of .text rather than dropped. Overall this could make =
the
>>>>>>> image bigger, and package some .text code in a sub-optimal way.
>>>>>>>
>>>>>>> On Arm the .data.read_mostly needs to be moved ahead of the .data
>>>>>>> section like it's already done on x86, so the .data.* catch-all
>>>>>>> doesn't also include .data.read_mostly. The alignment of
>>>>>>> .data.read_mostly also needs to be set to PAGE_SIZE so it doesn't e=
nd
>>>>>>> up being placed at the tail of a read-only page from the previous
>>>>>>> section. While there move the alignment of the .data section ahead =
of
>>>>>>> the section declaration, like it's done for other sections.
>>>>>>>
>>>>>>> The benefit of having CONFIG_LIVEPATCH enable those compiler option
>>>>>>> is that the livepatch build tools no longer need to fiddle with the
>>>>>>> build system in order to enable them. Note the current livepatch to=
ols
>>>>>>> are broken after the recent build changes due to the way they
>>>>>>> attempt to set  -f{function,data}-sections.
>>>>>>>
>>>>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>>>
>>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>>>> @@ -88,6 +88,9 @@ SECTIONS
>>>>>>>         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>>>>>> =20
>>>>>>>         *(.text)
>>>>>>> +#ifdef CONFIG_CC_SPLIT_SECTIONS
>>>>>>> +       *(.text.*)
>>>>>>> +#endif
>>>>>>>         *(.text.__x86_indirect_thunk_*)
>>>>>>>         *(.text.page_aligned)
>>>>>>
>>>>>> These last two now will not have any effect anymore when
>>>>>> CC_SPLIT_SECTIONS=3Dy. This may have undesirable effects on the
>>>>>> overall size when there is more than one object with a
>>>>>> .text.page_aligned contribution. In .data ...
>>>>>
>>>>> Agreed. I wondered whether to move those ahead of the main text
>>>>> section, so likely:
>>>>>
>>>>>        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>>>>
>>>>>        *(.text.page_aligned)
>>>>>        *(.text.__x86_indirect_thunk_*)
>>>>>        *(.text)
>>>>> #ifdef CONFIG_CC_SPLIT_SECTIONS
>>>>>        *(.text.*)
>>>>> #endif
>>>>
>>>> Perhaps; I'm not really worried of .text.__x86_indirect_thunk_*,
>>>> though. When adding .text.* that one can likely go away.
>>>>
>>>>> FWIW, Linux seems fine to package .text.page_aligned together with th=
e
>>>>> rest of .text using the .text.[0-9a-zA-Z_]* catch-all.
>>>>
>>>> There's no question this is functionally fine. The question is how
>>>> many extra padding areas are inserted because of this.
>>>>
>>>>>>> @@ -292,9 +295,7 @@ SECTIONS
>>>>>>> =20
>>>>>>>    DECL_SECTION(.data) {
>>>>>>>         *(.data.page_aligned)
>>>>>>> -       *(.data)
>>>>>>> -       *(.data.rel)
>>>>>>> -       *(.data.rel.*)
>>>>>>> +       *(.data .data.*)
>>>>>>>    } PHDR(text)
>>>>>>
>>>>>> ... this continues to be named first. I wonder whether we wouldn't
>>>>>> want to use SORT_BY_ALIGNMENT (if available) instead in both places.
>>>>>
>>>>> We could use the command line option if available
>>>>> (--sort-section=3Dalignment) to sort all wildcard sections?
>>>>
>>>> Depends on the scope of the sorting that would result when enabled
>>>> globally like this.
>>>
>>> I'm not sure I'm following. Don't we generally want to sort by
>>> alignment in order to avoid adding unnecessary padding as much as
>>> possible?
>>>
>>> For any wildcard sections we really don't care anymore how they are
>>> sorted?
>>
>> Sure. Question is whether sorting is limited to within any single
>> *(...) construct, or whether it could extend to adjacent ones. IOW
>> whether the command line option strictly is a replacement of adding
>> SORT_BY_ALIGNMENT to every one of these constructs.
>=20
> AFAICT the command line option will have the effect of setting the
> sorting of any wildcard containing sections to use SORT_BY_ALIGNMENT.
> Ie: .data.* would become SORT_BY_ALIGNMENT(.data.*):
>=20
> *(.data SORT_BY_ALIGNMENT(.data.*))
>=20
> I've taken a look at the binutils ld source and that seems to be the
> case, any wildcard containing enum will get it's sorting set to by
> alignment (but I'm not familiar with ld code so I might be missing
> pieces).

Okay - why don't we try that then (in a separate patch, so it's going
to be easy to revert)? For the patch here all I'd like to ask for is
to keep .text.page_aligned enumerated explicitly (and the wildcard
placed after it, obviously).

Jan


