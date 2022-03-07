Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA44D04F2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 18:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286333.485826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGp9-0004uQ-CI; Mon, 07 Mar 2022 17:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286333.485826; Mon, 07 Mar 2022 17:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGp9-0004rC-8N; Mon, 07 Mar 2022 17:07:07 +0000
Received: by outflank-mailman (input) for mailman id 286333;
 Mon, 07 Mar 2022 17:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRGp7-0004r6-5v
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 17:07:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 024a609f-9e39-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 18:07:03 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-EJt4v3n8Mdi0qfTJRzBlpQ-1; Mon, 07 Mar 2022 18:07:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8731.eurprd04.prod.outlook.com (2603:10a6:20b:43e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Mon, 7 Mar
 2022 17:06:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 17:06:59 +0000
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
X-Inumbo-ID: 024a609f-9e39-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646672822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUhvdr1iwNRxejErf30G1YM1hmJnjSpAlCNGALh+CJc=;
	b=lzUkDnKmxCvmiex+jXevjlFmF0mTwaSDiNgAuatEkru93YnbBRj9PBBhoIscq89NDT8lrT
	TPE0g5hzzmH7D6u2b/7Hk3mvXvyT6O59zNwcQ2b6hRT3s15X1Nsa7V8/HpZ11rU51Gbbi/
	oE0U0CVagOBv1bx0FcWM+l7lf52BTq0=
X-MC-Unique: EJt4v3n8Mdi0qfTJRzBlpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAOOY6BNha0qeK1EPM7TK7bow4hnl4Nmt1jbOpk0lOlsYLwlztiIekoPxxGvVMR/E99D6XWIU/NryJF0VotRAuOd/mCEGxwJ9GGJBSraKGQwJEycavUrDL07px2fJ2dhXfMgT5LNgMbekzvYNrrztfYHc/odetm+nKUiCZv3AmclNEi8AIzzhUeHgCRHhYCVp+DdrNQAAZ4bsFGvu/Mjz/YJQOVeGw8N0szMAsyfD2O25BTZmzQx1otGuzgmLtb16YHtyKPmWAzx2QaP+K4qbBMi8CJLRrIsD/E7BbzwXQ41H7w3Am2j+tLwkFYFlSXzBxu4GPqVlreTw3VYFAhGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shjXGSpVv5/bgyHdHpdMlgS8QQgnoymWvTKqlQGN4II=;
 b=VjEGz8fZFUTmbV3NH1I9FvQYkeJ8eTBU2qiJOLTnTqBt64ibpFB2snL79uPcQhB27WBdqVNXrFzyibmoqEbOEjpp6yw6QqD7Pbbkwj0ySIo/KYLLi/AbxBrkOZ4d57fZiMYGOFIPyKAMY0hXW9UleqEiljzcg4nT70mpbuJOZxc47W3b67jwHd0WO6psdVeGqO3YcvlzTvn92fyd12y/ZJRF+bXO2VHp3eqAQpzXKoIJZlc4F0oKu+AC3uy6IYJA4kzoFQ6083fZshn6IzLZA2MWycb0E7o+me4Pd5+i+LuDhix5cdAe7OhlL9izIa9duk81AuEKCNN2WDNSSVItFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5623c11-cccd-c74c-6ebd-ada9885216e6@suse.com>
Date: Mon, 7 Mar 2022 18:07:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] livepatch: set -f{function,data}-sections compiler
 option
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220307155558.72876-1-roger.pau@citrix.com>
 <984284e3-c423-16ec-5ad7-c4211ebddb70@suse.com>
 <YiY0jMinvZf8sBaK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiY0jMinvZf8sBaK@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0023.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a0922f4-848e-4788-c1d0-08da005ce436
X-MS-TrafficTypeDiagnostic: AM9PR04MB8731:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB87319FA77E6489DF4114403EB3089@AM9PR04MB8731.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rDAnHx8Q9qGI0WmRY2GEkziDna5HyQmM07R+TNt+HJ1I9hfUg56RKa49x2Vq9krayp1Cg6DdclCuJFVo82tqL624uQnKcGuvDq311tO/xzXWhe5CvJfDLj7+gIh6nSE63hAPbIj6BFVLTXMvD7bYVyJC/WER37wjhOBIgkCzukVkBmp2BxCkG9pjthkndl45VSDbIa+Vr9oM1D8q5PvhoYa5eG2o0YDXWND38a5cddcDr6UQkQptz0Kf69nxBLuwkpJcvc5aUvGQljIQ15Dhv7igkqQ4fCYZGgMDPLGQnVNb8UY7DTkP38qlP8VtrsL49nhEmN3mXv/iE93QIlQxN98Mn392bmpXAuQZ0UOzwVWKyvYy6pAx+ht5EYCCsIa25qWCLCt1yQfmlRKuEuwUdK25DwEc+SS4ZalKLWWbKAPTeifmDjqUOHo7lwFG0P3hL8DtVz0OAQyaAxN3kY8ZzRSBqIKPObrV4D6MUKOI35H0iU2RA20c9PahIxUiElFALm5LD/91evMofXZZNxWY25jvoaLMi+kN6NUWlltrHm1MEHmVO0tyzVbIO5IpFuHurpiLiv90MBf6txje7cERlyzLwMSdocMyYKqCEz0B/m5xpdgpSEpQ3hIMMtQDCRLKaj/aR3Gx4Jxl+TnvO7zkKE6GmfuMex/3hSGObyVDyyn5SEJmq1iG5P1zeDGyCkW/DBQsLQgPG0Vr5gG7a189pQlv7UbP1K93G2i/ulfUTVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(316002)(6506007)(53546011)(6512007)(6666004)(6916009)(54906003)(36756003)(66946007)(66476007)(6486002)(31686004)(83380400001)(66556008)(4326008)(2616005)(38100700002)(2906002)(86362001)(31696002)(508600001)(8936002)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NyMCslY5lwcxE7YQIT11wmVtoj2PHRFDDs7xdHiLA9fgLtD3utNOHj8tGVEC?=
 =?us-ascii?Q?oIYE+GZgToEhJBEn49N8d3DD0oVreRvGBVj7jEVOfSyQHwi3LVTNq1knkVR2?=
 =?us-ascii?Q?JCZGX5tCn2dPv7tZCUe0nkCFboUYK5RIaAq5nSOBBaOk79hOXu3Ka7XS+DeU?=
 =?us-ascii?Q?PTASmhJo1hR1oyh3uaBmWZXpxqxgC+5tS1wJRBgMgPBTqHWV4YkhV9DubrQO?=
 =?us-ascii?Q?h0RntflnFKxFBFOKOHO0B9S0JyAXOlVvlKYo23EI9MMWQKrXQnFxD/Bs5xjt?=
 =?us-ascii?Q?EI5mEFN30n5xCeCFwHmBucSkx7QtGRnFynGKL6K+terjYsq2eYwt0wbm2v8i?=
 =?us-ascii?Q?Ri+laeXFh2EwRe3gNZeU35qtcBbLlf0H1iNi0TrXjJiOSZqkH4Y4srFBAhOj?=
 =?us-ascii?Q?1i+yHChPdx4pF96gr4nE782xoJB0oyT4Go87qBjieH40o0UwqgR96po1sqY6?=
 =?us-ascii?Q?Kj93gbp0Dgw5azjyZwdVN2zrrt9Ukkxr248BvrWJ4yC8HhVi/YEmrkJysKxp?=
 =?us-ascii?Q?40Dqsjz2avIZjQKSQ20pBNS/xR/u5Qr/Yq13sYk0ToWJkB1ACWVxHmRDCBBt?=
 =?us-ascii?Q?EgqzP74Qg8DjEeTHCXJk94sWVkBbPR/EjEx/J+/8o/OO8uwQBBc9U+DXt9gU?=
 =?us-ascii?Q?wjsapyWdZqbyUADuJVtd2jIK4Kfv7E+1FQ2yJ8EnTM8c+1qyfqVCtyO9POjP?=
 =?us-ascii?Q?qshrRqI+0qh8CZwgaMAOwuEXJRXpgLD8BIRjqMCrIU6MOWwXWBQQZLIpIKH+?=
 =?us-ascii?Q?gaWTk8050bcmXdJW/xEBpuQ9/w5Lq68Od6KlE09solOKDh6ZYE0RHMQpqAbu?=
 =?us-ascii?Q?f92swsHvMe/VgOFE+9w/1fyD2n5i7hnUAakybuQ0pnNOT8ARLLGgrjgPsM5e?=
 =?us-ascii?Q?+xshcJQb9ryYUGnOLgcC71z+vudKQxp3dnQIWzBKWEq6BzHBWd3KEExKddt5?=
 =?us-ascii?Q?NVll6yp0tNCEOmsnO3XjQQbEoX3L08SjEAyS4/DiXnCjGSfafKJIvwMEUSkV?=
 =?us-ascii?Q?9U/C62SjDB4y6EHHj8KKREFR5ValWRJ8Nu5K2z+PH0mvLEweVcYKFsj1wkaU?=
 =?us-ascii?Q?GTIgM2NMrYqo9begGHQbHSXMW9Zu4QeSlPQUDdctz2UU8qHiQZ87uqP5HvNU?=
 =?us-ascii?Q?S3NKi4uQ/pQcYsiSv/Yu3NCkJ7MIDoSfoO3mWYFt5IhljYebUZtS7Fcg039e?=
 =?us-ascii?Q?L3Sdg0sLVHat0PDWMapX6mqIdNpTvdwFl0uOJUjUudlJEDyn4pwj4mOP75a6?=
 =?us-ascii?Q?JKNvIzYVRISezp9qISrrQ0KuPr9laq59mLiFtKROgaJrciGSKIHcRmBbmjOo?=
 =?us-ascii?Q?eI8+e7GdL43l+gDOxSDTv62cFXSR51dE1IoHGUxpS4myO5W6oKlpEj0EnxbF?=
 =?us-ascii?Q?tBRJkrdjP0mvmVsHbcJqD6Zz1CFgq9cqslRM+KRQ3MD52SdBjtPrOfVyxwgp?=
 =?us-ascii?Q?sXp30dh+ZbIoudhrlcKZ8sq0kH5Nbd4hh7xhijiPyuz2N7pj0lglYLC2gfmx?=
 =?us-ascii?Q?y90fCoeBeHbiAUFdhw1fEehDTo/6BH06nwVMdC2leZ1Rwrpwijk1nPYPnDpd?=
 =?us-ascii?Q?tc6wl//APzmXhVjjrCnbnw7PT5IPYF7oxcr0NuW+Hp2bvfmYf6mkruJ4hw3E?=
 =?us-ascii?Q?TZd+/RRejKbFH12fMdq2I1g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0922f4-848e-4788-c1d0-08da005ce436
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 17:06:59.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5fPyyTUg+h1IGoq/qnWXQX4/4pCi9RGh40Eo9MpOwfFn6IE55vnvQFYfKIAjHnhDQX0fhtjx1YqPpT/3XXFow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8731

On 07.03.2022 17:36, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 05:28:20PM +0100, Jan Beulich wrote:
>> On 07.03.2022 16:55, Roger Pau Monne wrote:
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
>>> Note that placement of the sections inside of .text is also slightly
>>> adjusted to be more similar to the position found in the default GNU
>>> ld linker script. This requires having a separate section for the
>>> header in order to place it at the begging of the output image,
>>> followed with the unlikely and related sections, and finally the main
>>> .text section.
>>>
>>> On Arm the .data.read_mostly needs to be moved ahead of the .data
>>> section like it's already done on x86, and the alignment needs to be
>>> set to PAGE_SIZE so it doesn't end up being placed at the tail of a
>>> read-only page from the previous section. While there move the
>>> alignment of the .data section ahead of the section declaration, like
>>> it's done for other sections.
>>>
>>> The benefit of having CONFIG_LIVEPATCH enable those compiler option
>>> is that the livepatch build tools no longer need to fiddle with the
>>> build system in order to enable them. Note the current livepatch tools
>>> are broken after the recent build changes due to the way they
>>> attempt to set  -f{function,data}-sections.
>>>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> The x86 part of this looks fine to me, just one other remark:
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -350,10 +350,14 @@ source "common/sched/Kconfig"
>>>  config CRYPTO
>>>  	bool
>>> =20
>>> +config CC_SPLIT_SECTIONS
>>> +	bool
>>
>> I think this wants to live higher up in the file, perhaps between
>> ALTERNATIVE_CALL and HAS_ALTERNATIVE. (CRYPTO, as seen in context
>> here, imo also would better live higher up.) Or alternatively it may
>> want to move to xen/Kconfig, next to CC_HAS_VISIBILITY_ATTRIBUTE.
>=20
> I was tempted to place it in xen/Kconfig. The logic for the current
> suggested placement is to be closer to it's current only user
> (LIVEPATCH), but I'm not opposed to moving it somewhere else if
> there's consensus.

I guess the main question is whether this option is intended to gain
a prompt. If so, xen/common/Kconfig is likely the better place. If
not, I think it better fits in xen/Kconfig.

Jan


