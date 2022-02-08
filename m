Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0594AD86E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 13:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268294.462097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHPuQ-0008A4-HM; Tue, 08 Feb 2022 12:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268294.462097; Tue, 08 Feb 2022 12:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHPuQ-00086n-D0; Tue, 08 Feb 2022 12:47:50 +0000
Received: by outflank-mailman (input) for mailman id 268294;
 Tue, 08 Feb 2022 12:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHPuP-00086h-IK
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 12:47:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 506a496d-88dd-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 13:47:46 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-gfVNdIKfPxWu83EWWUzh6g-1; Tue, 08 Feb 2022 13:47:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 12:47:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 12:47:43 +0000
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
X-Inumbo-ID: 506a496d-88dd-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644324467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCBbFOX3XSv2fXeF6T6uIWsVPJ8VjM+e3i/x67RHhtw=;
	b=HJSJF/GPGRNWiW7+jVx+89ORMJZB1D8ZURc13b1zdGp/zctT3tcXERWTRE9YwAe2CEmjZE
	+YZlw+Wo/CalCHcDK5B3i46c6s0hysdAmHqWwyS2DOh09ZoGgEt49YMuUytmRie3yLVRJ2
	6YIeojETqLdKXizPd7ZnBq3yemSALJg=
X-MC-Unique: gfVNdIKfPxWu83EWWUzh6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lR+FsVxZcpnIIvi3IQF1ROb3S2J0/mPcFuOaYJJCaSHPF0Oe0mT6k08WXjBNpOL21oGPX6KjY9PskbNQPU/GhqMsfCKi6v65IP9iPq7fJpmut6tdvIz2Dq660vqBpTJjvzVX5duSB+lfZJmM6L9oIbhCUudkFubyLb0Bq5LK95vTUMIEzmxQ1xCOo988cMzR/xeN4xRGcW9FD5+HNGmAeb20wpbarTNxk4rISlMs5Fbm2Q2DxxTd9rYySApaXmepA2HjA2Rd6HD/5EjdOc2nBHkZp03bUJgM/mT6OYfnnTzjhAOCQjKDtjjsxdq0WTZFlqpPXaC6ssCcly9l/LB7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pBqllCtNJpk2e1FOqL61YHvYU+BVKD7E6ETRNjMf/E=;
 b=R/k/dqYEuL1nUy+BZLBfxKDWVe889w4x+gkEcGrr/L1twP8xrHiap0w0M9/QxGkAR6r52ToJbc99DqulMKFsSyPF7rsQicF5VpfWBofVLqvdrV72RW49TB+AbuvH2Z8d6kUgamrLK4HtLU+9oYPHfNP2UykO8xaUWJWVgg0BxTquOGj5G5d+mZ5fMRGvugSWMVmtYDBfZyVE7lS9HSKLrM977ooXYSKWao7fhbZ8ssqBWnTQPEkzr/1u/k+QWa4V9SuXWDol6BMJe+TByY+7alTNJYD992vvKdQVmyG5A27U5SEoMp7dqHb3k6CpvHOaHLTJFCqT7IlE6KrY5S2m9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3629d57d-6d89-5ada-1664-cd532342fd0b@suse.com>
Date: Tue, 8 Feb 2022 13:47:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
 <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
 <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a879a7a-7c6c-4084-81b2-08d9eb0132d5
X-MS-TrafficTypeDiagnostic: DB9PR04MB9281:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB92812161A04E71579AA21EE6B32D9@DB9PR04MB9281.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+9fYObO3uXHuxYEZsu6DT0RlhMp4tcPhRaIFTzZZwOvAFeq6EvX+GVdMrVQh+lQQByxYlqbuf5W/H1rrpT6Lx/HG2ho3jjcgJ+EudPBqMuBpvMsPhxwYxnxw36ROf5OkNoJWq/2LNFmQ8HtPEWjbZjfOUv8DqqS4Jcjt6bhcPSgAhFD2Q9DRflF659rNHWcf8zEO8cKttd1y69Uw/T0U/phNyEZ2D8lEhKNjU2q4xRzh8pn2LbeaupH83LzbFC5ZzB8vDJx60mW3II3SpOLer3wzJGuEK7Xgd3q7zt0Jm4R2WNzvWbK0Aq5zVY1ZRl3EpY/kH5HUZc2ehH3w8nBw7CededNSMK2OelwcQuBo8mS+KG6YAbhPks8m/aB6NBW1wyjlvbifF6ZrKC6nD+CEvgsLgIrxTfP9v2FFmUbUuL4Lo0EcHfIfXogJKBBiHMIRtvE1FtjAg1y8V5mLwRCLbbUITC/0rRkRU8CEqRp5BHw+QQseX/hOKtS2ndDBCHBoVbKJUdS/szLh3wzvgdCrbxNM+mL7TYcAJNqNbm+f8aYDJ1nZZlaHDfmFcptsRcsRQ9jHJNO0zF7L/vOkr8AGG1jDmrx4jKwr2YXGb5j6uf0TdV59S/VICjy6UEzA5bj01R7iW8538c9qCbWludhyXrJKw/y/B2OMZWWs5rWs/oqvFtlhjTIvLndDwq1g8xUW9JjjZpXKNz8SnipOlsqvCyBsKBNlt+VxtGziXnuW37g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(6512007)(66476007)(110136005)(2616005)(31686004)(54906003)(316002)(36756003)(26005)(83380400001)(5660300002)(186003)(4326008)(53546011)(66556008)(66946007)(8936002)(8676002)(6486002)(508600001)(31696002)(2906002)(86362001)(38100700002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UKf2zKe2zUesEy2kNANTqppg0oDJSriv5idiDj2eFwK6jcecOz5atbqsYKSL?=
 =?us-ascii?Q?aQKYlbZwHOPK3KoTLUWuD2W8/VwYDMy3Wx+0dpOvBJKfGpRYjB4V9xhNHPjf?=
 =?us-ascii?Q?SxIBOE5oPXh4+1M/adZiLRf6G/ERzrwncRqN901mmXMI07qlWQTdugGhK2vv?=
 =?us-ascii?Q?WOOTNJy5HtCa46gxMTZlYVWjx0p1G44rD0lwExk9rXOMGwjF3/pZZmBH+gKB?=
 =?us-ascii?Q?MZozwd0EPuwX3cCGEayetnPQkB6bohHU2/iNvVNcLyoOkvogY5NdzPCJDyMP?=
 =?us-ascii?Q?QMf3EV4oCM5an81bxBLTiB918OiQESalj4KwO5kak1AC1cJNNlRMppNME0cq?=
 =?us-ascii?Q?HY04gwh6Ue3Pn9+k+bMnuuCNneHeVkB93wmdM87591oWnp896ZpsD/4dE8yw?=
 =?us-ascii?Q?0B3nZNN3f3maSErr4/fmaJzNS5V2UH4HJVBgK5ZNhJknZE9XMigHRvxGiu6g?=
 =?us-ascii?Q?uXCVLx/kIlb/XtVOJue55nWcx6FG7jQNrGOOvNXQ0FObNAq3/gdeatZ01jb6?=
 =?us-ascii?Q?7kCeF80fpyulCnxXs8y9TajbXINwEr0/fRJnZuOFdDKk65pe30Kthu/Pp7WY?=
 =?us-ascii?Q?1Wu7z37BBSlgcu6wM6Lcf3KXh7AO9G7jF8O2DvWn1QnjnbzxIDpUZXRB7jlb?=
 =?us-ascii?Q?xDQdxra2WK28UH5ygGUvM2EeVSsF0F/kf4XKtmVyZiEb0ArCWwNRvQupmaoz?=
 =?us-ascii?Q?MeRV36ZaIjdWMy7V4sm5DZz3ZliMKtMyqJRi1b2iOPWMTEuPcBHtGHl8OOhL?=
 =?us-ascii?Q?fKpK8MxBDTQE+KrmJBEIb9ePaCcLAwseKdmQNUBlQs+UaNyqh7QwmxCrjtLE?=
 =?us-ascii?Q?YXZ36YRRKtxRoD5KWOJM5PDPlF0oKwPukO9+82cgy6cOfVGEXCpF/AvZtUaP?=
 =?us-ascii?Q?vU/ZJJ1GvQjpynR+NSYQBgpbuJQ7Cnv4zEwKaf3uLYfnZ/fUOIRZILCDRCLq?=
 =?us-ascii?Q?vkAldIcArTE0z5ZSo2toySWFE7bFyCZjA3cbcmNM0gvHXjDjkE1p6x9EWMHY?=
 =?us-ascii?Q?NY2aSfWnn0mbtLdjNGNPmZIkxoyY75MTnI4oPRzRxLbLnejinoNuUjbt58ns?=
 =?us-ascii?Q?HYDh3Q2jyhPKVSj4X6zYtknB5aJxSpsHv+EJkoJdKJ4EydC5ZNYpF3TRQ1tH?=
 =?us-ascii?Q?d5e774WDRfRbHG96GT+DoSn2e2mDbmporUvyCiV7+M/q3uCK3zjT40W9Xs6m?=
 =?us-ascii?Q?pEg4XEwc0oZ99c6B49tdI4REm6AvIYvFq2tb1ivSB+scKTXo0PDLu+XH1J37?=
 =?us-ascii?Q?W9qhtIz0rzGI0GO+htyuvgs6j3kyk18bhyg9SRH/bIvAKHwFs5dp/iFmMoOQ?=
 =?us-ascii?Q?Q7W/aPqddrLK+rM9J81TLVIKtDWOzrKZUOxCAA5XL8lHrcMHO+HYrDrxfkIm?=
 =?us-ascii?Q?sqA8d70EuNOzNO826TLD2jV1eGgN7P/KkedWUcU7VRv4fuN/H3CM7OmWeMO5?=
 =?us-ascii?Q?ggbQJa5ruV2J99UpV++yqMtbj1rVNm4afpAMiUnJYpP+ReO+mGL39KOrXZ2r?=
 =?us-ascii?Q?bTCCG3o4ctDz6dXzrAPy4UDnvhW63Jy/AP+hb9pvyi5JqpvCT7Ayu//56OLQ?=
 =?us-ascii?Q?7g73EFiDmblqqNly1uBrK4uJsoZCF2NsHMIocu4uVtL3GhC9muSYYO2lCoXk?=
 =?us-ascii?Q?D4YG7CklwfHtpTmORJTTSrA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a879a7a-7c6c-4084-81b2-08d9eb0132d5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:47:43.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upaw9ZDsAjlVngbTKvuJ5qnh/MnTLWoaQ4cIymb/6tOEU4YUt4UP9vCOTKRP1rMLox8zbqVirePx2EL8ZciJWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

On 08.02.2022 12:58, Julien Grall wrote:
> On 07/02/2022 19:56, Oleksandr Tyshchenko wrote:
>> On 07.02.22 19:15, Julien Grall wrote:
>>> Hi Oleksandr,
>>> On 05/01/2022 23:11, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Rework Arm implementation to store grant table frame GFN
>>>> in struct page_info directly instead of keeping it in
>>>> standalone status/shared arrays. This patch is based on
>>>> the assumption that grant table page is the xenheap page.
>>>
>>> I would write "grant table pages are xenheap pages" or "a grant table
>>> page is a xenheap page".
>>>
>>> [...]
>>>
>>>> diff --git a/xen/arch/arm/include/asm/grant_table.h
>>>> b/xen/arch/arm/include/asm/grant_table.h
>>>> index d31a4d6..d6fda31 100644
>>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>>> @@ -11,11 +11,6 @@
>>>>  =C2=A0 #define INITIAL_NR_GRANT_FRAMES 1U
>>>>  =C2=A0 #define GNTTAB_MAX_VERSION 1
>>>>  =C2=A0 -struct grant_table_arch {
>>>> -=C2=A0=C2=A0=C2=A0 gfn_t *shared_gfn;
>>>> -=C2=A0=C2=A0=C2=A0 gfn_t *status_gfn;
>>>> -};
>>>> -
>>>>  =C2=A0 static inline void gnttab_clear_flags(struct domain *d,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int mask, uint16_t
>>>> *addr)
>>>>  =C2=A0 {
>>>> @@ -46,41 +41,12 @@ int replace_grant_host_mapping(unsigned long
>>>> gpaddr, mfn_t mfn,
>>>>  =C2=A0 #define gnttab_dom0_frames() \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min_t(unsigned int, opt_max_grant_fram=
es, PFN_DOWN(_etext -
>>>> _stext))
>>>>  =C2=A0 -#define gnttab_init_arch(gt) \
>>>> -({ \
>>>> -=C2=A0=C2=A0=C2=A0 unsigned int ngf_ =3D
>>>> (gt)->max_grant_frames;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0 unsigned int nsf_ =3D
>>>> grant_to_status_frames(ngf_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>>>> - \
>>>> -=C2=A0=C2=A0=C2=A0 (gt)->arch.shared_gfn =3D xmalloc_array(gfn_t,
>>>> ngf_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0 (gt)->arch.status_gfn =3D xmalloc_array(gfn_t,
>>>> nsf_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0 if ( (gt)->arch.shared_gfn && (gt)->arch.status_gf=
n
>>>> )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>>>> - { \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while ( ngf_--
>>>> )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (g=
t)->arch.shared_gfn[ngf_] =3D
>>>> INVALID_GFN;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while ( nsf_--
>>>> )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (g=
t)->arch.status_gfn[nsf_] =3D
>>>> INVALID_GFN;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> - } \
>>>> - else \
>>>> - gnttab_destroy_arch(gt); \
>>>> -=C2=A0=C2=A0=C2=A0 (gt)->arch.shared_gfn ? 0 :
>>>> -ENOMEM;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -})
>>>> -
>>>> -#define gnttab_destroy_arch(gt) \
>>>> -=C2=A0=C2=A0=C2=A0 do { \
>>>> - XFREE((gt)->arch.shared_gfn); \
>>>> - XFREE((gt)->arch.status_gfn); \
>>>> -=C2=A0=C2=A0=C2=A0 } while ( 0 )
>>>> -
>>>>  =C2=A0 #define gnttab_set_frame_gfn(gt, st, idx, gfn,
>>>> mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> ({ \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rc_ =3D
>>>> 0;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfn_t ogfn =3D=
 gnttab_get_frame_gfn(gt, st,
>>>> idx);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( gfn_eq(ogfn, INVALID_=
GFN) || gfn_eq(ogfn, gfn)
>>>> ||=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (rc_ =3D guest_physmap_remove_page((gt)->domain, ogfn,
>>>> mfn,=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0)) =3D=3D 0
>>>> )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((=
st) ?
>>>> (gt)->arch.status_gfn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : (gt)->arch.shared_gfn)[idx] =3D
>>>> (gfn);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> - rc_; \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!gfn_eq(ogfn, INVALID_GFN=
) && !gfn_eq(ogfn,
>>>> gfn))=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? guest_physmap_remo=
ve_page((gt)->domain, ogfn, mfn,
>>>> 0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>>>> 0;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>
>>> Given that we are implementing something similar to an M2P, I was
>>> expecting the implementation to be pretty much the same as the x86
>>> helper.
>>>
>>> Would you be able to outline why it is different?
>>
>> Being honest, I didn't think about it so far.=C2=A0 But, I agree with th=
e
>> question.
>>
>> It feels to me that Arm variant can now behave as x86 one (as
>> xenmem_add_to_physmap_one() now checks for the prior mapping), I mean to
>> use INVALID_GFN as an indication to remove a page.
>>
>> What do you think?
>=20
> I will defer that to Jan.
>=20
> Jan, IIRC you were the one introducing the call to=20
> guest_physmap_remove_page(). Do you remember why the difference between=20
> x86 and Arm were necessary?

The code was different before, and Arm's behavior was also different.
Hence the two functions couldn't be quite similar. If Arm behavior is
now converging with x86'es, the functions becoming more similar is
not entirely unexpected.

>>>> @@ -358,6 +371,25 @@ void clear_and_clean_page(struct page_info *page)=
;
>>>>  =C2=A0 =C2=A0 unsigned int arch_get_dma_bitsize(void);
>>>>  =C2=A0 +static inline gfn_t page_get_xenheap_gfn(const struct page_in=
fo *p)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 gfn_t gfn_ =3D _gfn(p->u.inuse.type_info & PGT_gfn=
_mask);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ASSERT(is_xen_heap_page(p));
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return gfn_eq(gfn_, PGT_INVALID_XENHEAP_GFN) ? INV=
ALID_GFN : gfn_;
>>>> +}
>>>> +
>>>> +static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gf=
n)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 gfn_t gfn_ =3D gfn_eq(gfn, INVALID_GFN) ? PGT_INVA=
LID_XENHEAP_GFN
>>>> : gfn;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ASSERT(is_xen_heap_page(p));
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 p->u.inuse.type_info &=3D ~PGT_gfn_mask;
>>>> +=C2=A0=C2=A0=C2=A0 p->u.inuse.type_info |=3D gfn_x(gfn_);
>>>> +}
>>>
>>> This is not going to be atomic. So can you outline which locking
>>> mechanism should be used to protect access (set/get) to the GFN?
>>
>>
>> I think, the P2M lock.
>=20
> Ok. So, looking at the code, most of calls to page_get_xenheap_gfn() are=
=20
> not protected with the p2m_lock().
>=20
> (Jan please confirm) If I am not mistaken, on x86, a read to the M2P is=20
> not always protected. But they have code within the P2M lock to check=20
> any difference (see p2m_remove_page()). I think we would need the same,=20
> so we don't end up to introduce a behavior similar to what XSA-387 has=20
> fixed on x86.

Yes, this matches my understanding.

Jan


