Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B94697A0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239019.414263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEW4-0007cG-RF; Mon, 06 Dec 2021 13:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239019.414263; Mon, 06 Dec 2021 13:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEW4-0007Zy-OE; Mon, 06 Dec 2021 13:58:52 +0000
Received: by outflank-mailman (input) for mailman id 239019;
 Mon, 06 Dec 2021 13:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEW3-0007Zs-K3
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:58:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3985698-569c-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:58:50 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-PX-7x9g7N-WxjOu0RXYLFg-1; Mon, 06 Dec 2021 14:58:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 13:58:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:58:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 13:58:47 +0000
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
X-Inumbo-ID: a3985698-569c-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638799130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oClr/AW8JQ8GztO8qndzhAbdaIpmxjM9iR3dXIMZw7Q=;
	b=MiDINsiq7SztCUI+YsRs14W7W8oPqN4nEJYbZnWS7IKxElsV3QjhdZ5S57SSImtKAxpBWs
	UMGuzcxMGyMy8QZj9hQOt8RjTm332aCsxh27fn++iSCvvfJSNdFPXqSxn1AeNj14BnIuYN
	yKAS5ME7boTvMLhYP6oSWjsemtBoMeg=
X-MC-Unique: PX-7x9g7N-WxjOu0RXYLFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T28HLl0dxGvmMLNaBw08HkHX31zYAe3Q6kfYr3wlOp72er5AkY8S0/9wD5cS/+xN67ms6gKUi2rQfIQl5KZvsEHe8Xm2rSkArd6yPAH3Hjr7vOpZfoMVJzKoQv1K3efrAikXELsBNRLR0zBWcWOupPzy3Jb+rCELN+2xYcIT8bLKPw4WMZdO9rnMPpNrZfdRE6HNKtZa4MVWbfwNz4oLzLVJ6HdlUdOLxM1R4DX29CJN3esv0yg1G26RhR7FxxnxaZ7sliUOoqE0LS4sHxXRk4y09rXFg3w3SYHfx07nnoH7juCdchMOSTiGIXj51SLMsNUlo3EyvPA4nKzsYtpFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hthfPL9z/NcdxxnI5ltv4B8p1fDABZ758m7L2Hlcxzk=;
 b=VNIcTR8ZIpe7W6tSlLH6sIzMN4S/P/avGsO0RLvvRO9IQ+RjsKG8UGnXOaMaBfdPhqxvW9DjnNzhILkcGWufW8BXcPC5qRzdJHwiVjjrd9+4nsXhu9pa7H6a+BJRZtF7wk3hGAzrhxhF1WymdHClWGw1MFviMf4O3n18xnN+d8nPeMqarsL0qK8rF4Vd5ad4TW+44yEUhOJSa9bRUzIPsTsr+CrGAM02Q5yNt3bl6zMwDDbDdHHVti+6z2IOMB9zb0zuPvd+037QmXtjIu0Z0crj1qG08rrbFHuGlz1ZxTr+V/GofUWKP57GdQVTJ7kaO7axsURi5n7KeWpmsbVw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ac98bc7-5b39-3c88-556b-53a5fdeb2445@suse.com>
Date: Mon, 6 Dec 2021 14:58:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/boot: Restrict directmap permissions for
 .text/.rodata
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211206130855.15372-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211206130855.15372-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea9854fd-cbb0-4447-f6d9-08d9b8c08613
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295867BF2E1E9F74AC051BCB36D9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yg6Bvk8yEAzoNT5Wqu1kUZqGAdbgjJYp9rfpDhFaF+ofQe0vXT8yOmPtxK3wVVxscil+IjJfORTjg/izIYy8Gc8iPMmInGOkHAQx1gGO7JsaUK4nueSkF4cmIo7zkzqt22eKbLQcBE1HpD1zpS7gP9PcImhsBigwcJkBw4IFkvyXZZNlFshQe3cBI6PxTz+s0EGSchUmdevT7zvuyV3FCSP/zL6Aex7FrcmQKFVOkQLGcOB8Rss7ipxshINhzKKposev/xTmpAWVE9Mw/59HkbBxYZ2HPN58gFQoFE3IZR8Xl4ABJrkifX3GNYecBMMs5w+Rypi6JNejKQ6jKgINzh0pRdZukOT066Kxf2/XBmj29qHXHaJFT8GZVNUBFuhHRHCEsWlSATMi6QAaW+kECnHdn8EOV245LIMKaKtXY7Q9BUX8AR4EAfRWWSIOlk0pZdJOhIOClfn8iWIbHyzNDPP8JG+NtynXHu4ZpyelzgiyfJ2a12ZAxfMpR0AzybH+TRAp3XLhopzi31oLegoLX6b9repHCuOB1NRm9M3rHqAZD9A59p422TF/uFj71lOJhT/OE73rmUaHOaxgp04Am3rrB4Tran1zIqaEYMBqcrqXezd6OXjaxl0yNujKYk8pBpFdZwzxSerczm80Gt01PbeKnHOoBq/Pa6l5n1qwpUVRQ7kowZSHiPseKfEK/1X9KkPK3jvuTM6mPPXc0e7ehKO9xLYrv5pJkW9lXm97RyYGbZFcL8+CxJKtxlxml7Crut1S1Qr3Iz2wU4WEifwPNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(83380400001)(66556008)(316002)(38100700002)(5660300002)(53546011)(956004)(6916009)(36756003)(26005)(66946007)(4326008)(508600001)(66476007)(8936002)(6486002)(31696002)(8676002)(2906002)(31686004)(2616005)(186003)(54906003)(86362001)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i9pk4Vja9/yJhBKSRAS6s7jP6MAr9hdTfly1HnYwWlQKqQz0PLKJqojDC1gs?=
 =?us-ascii?Q?ps8+NnfYJkfcmyvdJ7suNjRXMqOi2HBq1Y3gmdYGHsc4bjwhC3O+Wj9PdxwY?=
 =?us-ascii?Q?WOKR6o0QYcgTiVdBGKzfPtDBA50/sdjLLOgX41RMzwa6gQyTd033DkDZUmMl?=
 =?us-ascii?Q?0Qo1s6MT8F9UC7RTYqg2bg+sUUOJuKsV3c4rkQ4/uAQGj877hlTQ2oI2s3nn?=
 =?us-ascii?Q?KSkCTOAxq48X9p8Xs4O4Fr6J/i4BlHFMRC0Rr2BUo+ajvNCAxURyIwpn5oGO?=
 =?us-ascii?Q?lSwOrr1869FNBcYKjQjlFPUEeyPghMH6JRAlFKD7A6rjEzlrxIIHngt4FSBM?=
 =?us-ascii?Q?+hvShgqONf6s7KVAKJf1EKWsT3dI7UKh5+v0JVvpSoKd46CAuw7IG554ifAF?=
 =?us-ascii?Q?YfqAbCd+g98a4hLTNNLXXv+iAS2w5BrgSpuydaj5DerWSq8h143/2X2pqGcY?=
 =?us-ascii?Q?AV9XYSojtcGAg3EGL48LndNl6/m3LYv3Jy55dWCvAOXG8gmQYi1MRLvvuboh?=
 =?us-ascii?Q?zEVTe76aFjja24hjfRZxYN5pm8l5anMpmTLJCk81fGUa6rwGw04LVJPNH4/I?=
 =?us-ascii?Q?fKdRucTqWMwFV8qLKBrsTphJZenH6XBvHJVGEGlnLSts+bYgPrxxWGFpYK4C?=
 =?us-ascii?Q?d1avHXzWR45e6i9gEy1pGAwJg9R9dXyU53AeaHIixIRCBEQKqxgCTzgWD3GO?=
 =?us-ascii?Q?8/PstfrS6/bZ7Ia4B+SS8F/YRy1NZonv7vm5Ga2ERqA6xVylNZkNA4MdmboR?=
 =?us-ascii?Q?d9AbPf/HNeoFjXsniwYZlwhjmDAGNN37PEXtXVqDusrh40jZOiTaSFIO56dO?=
 =?us-ascii?Q?V4lSuihl3g49VM73ev6bGjvkUhS9C4dDFTopO927FQu2LfD4uXSO9YPIXpnF?=
 =?us-ascii?Q?ZEjQxypOU48WOMa7BqAqrylTGcJznvH48hwJDJiU8Z7qIifbRyHgvqY8rt+E?=
 =?us-ascii?Q?4e54LfqZepM7WYYjbGuNH19+QaMBC0Bv2F2YttAJMTMYlG+R4TH5+VYzN4Fr?=
 =?us-ascii?Q?GxN2qf6WBoFeJspSQZr/UOPR2lvJFdrDbO7NRL05W5clfqg7yQYao3UPYxPO?=
 =?us-ascii?Q?4CGnsNoBq28obtFUofTe8xQ/j25ZNX8T2+0LzpKV7kkHAJt0VqHu2oVPTgDI?=
 =?us-ascii?Q?wEQtFJqZhOHAZw4VOH6IFjlN5WYmDiuGGBs9WUR4erh20LmN/V803BL78/mh?=
 =?us-ascii?Q?fyErkhMiq5bmyHEoIY956qkyUH9Q0KgoxA5FzaxfL4n09lXFGcl9yUiGFro2?=
 =?us-ascii?Q?GEgL12H8vYHg0rOKIdXJUfaEOMT9b/2eA3EK0vVbRcYttvmxq/dgFffiD+YW?=
 =?us-ascii?Q?vQWLgPZwC9m5SbrlkVzt0FJXUa6KAUK0QZAtwyp+IEiFYs1TckiBohTC7a0p?=
 =?us-ascii?Q?DT0BkCmi5YsBXCtB9ECKl8abuG0d8V9VlG/dOeQk5g9FKFCV9FvxxIatba20?=
 =?us-ascii?Q?Q+zsAX+l/n+W0II1/J6MT1qvDJMQjhscszHeknZa9ulmhmpzYyVyGIMNTrmd?=
 =?us-ascii?Q?7tvwPL+QJKUzLgACoX0AFCz3Ga8aCVWW3wTk23OC2UShTcQhWLtBX44zejp5?=
 =?us-ascii?Q?VG0eLSYWEZ8wnwsnVkvubgyXquiNKTT4D53Kx4fXB2jam/l+nPAnd73m96bg?=
 =?us-ascii?Q?9OuGzI4iqZGpV5MgYZbXLWo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9854fd-cbb0-4447-f6d9-08d9b8c08613
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:58:47.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRJv/cx58SQjMGtct/S9m/Rgz2ki9XDgvFXcoi2riS/446FRJp2fsGEHsy5/Tw+jlYAr6ShSxLvD5ZZJ77+hSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 06.12.2021 14:08, Andrew Cooper wrote:
> While we've been diligent to ensure that the main text/data/rodata mappin=
gs
> have suitable restrictions, their aliases via the directmap were left ful=
ly
> RW.  Worse, we even had pieces of code making use of this as a feature.
>=20
> Restrict the permissions, as we have no legitimate need for writeability =
of
> these areas via the directmap alias.

Where do we end up reading .text and/or .rodata through the directmap? Can'=
t
we zap the mappings altogether?

As to superpage shattering - I understand this is not deemed to be an issue
in the common case since, with Xen moved as high up below 4G as possible,
it wouldn't normally live inside a 1G mapping anyway? This may want calling
out here. Plus, in non-EFI, non-XEN_ALIGN_2M builds isn't this going to
shatter a 2M page at the tail of .rodata?

> Note that the pagetables and cpu0_stack do get written through their dire=
ctmap
> alias, so we can't just read-only the whole image.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> Ever so slightly RFC, as it has only had light testing.
>=20
> Notes:
>  * The stubs are still have RX via one alias, RW via another, and these n=
eed
>    to stay.  Hardening options include splitting the stubs so the SYSCALL=
 ones
>    can be read-only after setup, and/or expanding the stub size to 4k per=
 CPU
>    so we really can keep the writeable alias as not present when the stub
>    isn't in active use.
>  * Future CPUs with Protection Key Supervisor (Sapphire Rapids and later)
>    would be able to inhibit writeability outside of a permitted region, a=
nd
>    because the protection key is per logical thread, we woulnd't need to
>    expand the stubs to 4k per CPU.

I'm afraid I don't follow: The keys still apply to entire pages, don't they=
?
This would still allow write access by all 16 CPUs sharing a page for their
stubs.

>  * At the time of writing, PV Shim still makes use of .rodata's read/writ=
e
>    alias in the directmap to patch the hypercall table, but that runs ear=
lier
>    on boot.  Also, there are patches out to address this.

I did consider committing that change, but it wasn't clear to me whether
there were dependencies on earlier parts of the series that it's part of.

>  * For backporting, this patch depends on c/s e7f147bf4ac7 ("x86/crash: D=
rop
>    manual hooking of exception_table[]"), and nothing would break at comp=
ile
>    time if the dependency was missing.

Hmm, not nice. I'm likely to forget if we would indeed decide to backport
the one here.

Jan


