Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276BD3B5AAE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 10:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147749.272652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxmvF-0003x9-3S; Mon, 28 Jun 2021 08:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147749.272652; Mon, 28 Jun 2021 08:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxmvF-0003uW-08; Mon, 28 Jun 2021 08:47:17 +0000
Received: by outflank-mailman (input) for mailman id 147749;
 Mon, 28 Jun 2021 08:47:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxmvD-0003uQ-PV
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 08:47:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37800dcc-adce-4e56-8146-34f7112a418e;
 Mon, 28 Jun 2021 08:47:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-gu4uCluIPFGyi0N5Acz6qg-2;
 Mon, 28 Jun 2021 10:47:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 28 Jun
 2021 08:47:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 08:47:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0130.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 08:47:08 +0000
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
X-Inumbo-ID: 37800dcc-adce-4e56-8146-34f7112a418e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624870033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gG9mfNJ2KY2KWty3JiJ8dwc56C7sjhBo7TdmiXTQJic=;
	b=WXKM4tTAZ6MDCVpadbQY3iXeApxdgfRCz6FFtzOTEI40Wmko7JSUO2keM+nO/HlEoEqBDy
	66964BCy6adLCbdFMzPQtpi8JlhbDDNJxtC95SoYMS8zoWn9OYgPX+0yhp33PUihLYOA4K
	fr4iGbak++d/wvpbzEwMhOGQqsLXrD8=
X-MC-Unique: gu4uCluIPFGyi0N5Acz6qg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E296JI+XHtI4dtk9eCAcQXRz3qNGM1zaM7b/LA7TpYkEi8MUkKGDP9AbF0BIBZYZhL6lIbyKeEcIKn9/9syPclweEoDsL9FjJFcPwOuhO1ZnMEVTCYLR2ys0ji4med5/TpoKQI+ncBjITXmt930ZbCcRm3FbQ39FknaCvuRb71GbTTAxHsS2yPUGAwO4JUvo7PEh1iLQfNGRy97IaPi6roExBQMATMRoMqY6YwlOttghUIRKTwvjEeYa/sHEaLwljsBA0CEKwQ0kJpu3HIe6jasHXOkTsFaXOSxsfBlAC4nFdoBA2j+B02cfuuh5nea0F8eYXp47hlJAF3P5AoGBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZBBbGPOcR6TTLv+d6owWAOPtBvGPLTU0IZO4pqfTLs=;
 b=l3J4f69GQtoBH2jsC/YfnmEQdvPKHEz9dRfe5cZFRntQlLAAK0dMVLYV9NvFA55XHZ4mEyganAGlyKH3ISqE4TDZSdwZsDZKuRTJT2BOXZ9vELJN6NwzGCrEJBlgozQX+i/s7YOTexh3fVP4s/+sKEU0/uXNzc185hQBFpZOwbpB8R0KjQkoszLy/sYGOkGCm3nMlDOwQqmFHFyKXg2/w0GmOdwaFkva4NMhUhT6M7hypPYVllr3ncZIf2ZRp8Eo3d1G+0CI4YjoM+tt4EeLcNJnCfGOOD4Rfi5ZNMVOKMWkmRHnxl2RZmfAXTIi3eFk1AH4H85rlJzu0iHUN4q39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 04/12] libxenguest: avoid allocating unused deferred-pages
 bitmap
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <61ff4f26-a9cc-d123-98a0-be6c23f21e9b@suse.com>
 <44825600-c27b-34ac-01b2-1ffb5e0bf0be@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3aea7472-6c1d-f786-db5f-ead60eb03240@suse.com>
Date: Mon, 28 Jun 2021 10:47:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <44825600-c27b-34ac-01b2-1ffb5e0bf0be@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1db7e232-a450-4ff4-853f-08d93a115042
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6864A72C8C42342DF965AFD2B3039@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WWQhcLw4+GIxILx8saGcvYkxLcqJnVV0lLIYgguqmmGMp67R2JDuizBxnBrCd6bH6SO2TqmPIiHXJIiB+mDLO1X0tyeLSpk5ugQQp69x81iLC4q+epP8BjGkJH1eo2nb/r3paShaYDT7og2KkQOHVmlBfevUQcjRW7/5ZyLFhMO4W4A2xViFiHuPgMXwn2zqibuABHcj8UPL6iHtIp2vZi/yNjoEAp83SofPmnS/BkuF5AyPCpJ89eDnjMZ3K0mn6+SFqB7Q/3Nnb84+aFG93aLCdV5lFqs5x8XHvxvnibzju7QYnIAJAW+9fkqqHNlPYehLuS/E29S81dzQssV5VHCSf40Ubm4yyemLPXmQbsecbwTex7RRD7c2V2Ovo4ok6WZZ8lAI3tJ2E4DYJFna8tp1HiNV+hCYi3E01dLacPMGgXJrMB48hhLlfE5b1CkuFGFKFil6LIvp+viMmkVLvGPSP02yZ523lPehbXjPk+L3rsMK+J7FhYUimbbkqAeqOU82zkwG642MMmB9gzeggu3MiAOoUseSeNnKAjU5vQowrzpevss/mPaRF0fpENnFcZ6z47M4C/ysX6GThG4h+zeixIt1hLRNjPQDdiaf5RlqCXe74Ndf8xFQzSIIU5dG23GbqkmzUbO8P9tX/yK7Of6ba3OPoyJ/ZVvJUEotTcep0Z3mrh33S0vyWZJBNHhNptGeCKrXuMtA57+Byqg6pQu+vWHI2SwWJU44i6RGs7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(6486002)(54906003)(38100700002)(2906002)(66476007)(66556008)(86362001)(66946007)(316002)(2616005)(5660300002)(16576012)(6916009)(26005)(478600001)(31696002)(8676002)(8936002)(83380400001)(186003)(16526019)(36756003)(4326008)(31686004)(956004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E3NeHoyUKlUZLP2Kx/FRdLP8dHu31i24/RD3/nDVOsnQaP1UV8P51oOTSHJg?=
 =?us-ascii?Q?qotPWSaCyLekPFrHerQhNYby//d3Ec0eMRYCIzEy+ZVy+K7WlSf1DsY4F+nj?=
 =?us-ascii?Q?H0e+Xjl4xBId5lgQcNNcQJaw8PeDZorJFpQ1lCf4qWWrH3g/SCkr0KBTdxV8?=
 =?us-ascii?Q?Acmw/7PCWOq+yY2kPYzuL6SCc+L0jLmCOmiTtlsN+K/M3XObQKq1xTcX/Gh0?=
 =?us-ascii?Q?CLzdZVVIVop9jvHcV22Cbqoc+D4yjSil0v3GO0OOUfkiDoO4qNNUiDvvEZY4?=
 =?us-ascii?Q?IREd5gmAYbZlKiJwIGcRsMHBWQsZCyJgqA+fLEIF1sD2ndi23g7cfzhv0PvN?=
 =?us-ascii?Q?pVCDKJRPCuhseRjOz44r+GB6+SukiJEgCKQRWA6MmHaSah6NpPmTz+4piTW7?=
 =?us-ascii?Q?TPKUpUp8fOHm4lvnqgGRFdt6kQe0GdMATuXJPTPvqL4dZhpOR5rAlkonq1Xs?=
 =?us-ascii?Q?r72Bpg3698hvtP8U/Woa54jeT9LYnHcCwvMiLsn6P9s3AdDfDvAcX+vBUmwD?=
 =?us-ascii?Q?XViUjNEtO5gaHqMUPsKwkqLQbfvNfwU/gi2TFMHoQMkbQrEl+d8/shauKs5C?=
 =?us-ascii?Q?+itjnmd3AFENd3vyl5VEjmjvGe/AUc4HpPJO4TcKHZDPmFut/wzui7UDnCP7?=
 =?us-ascii?Q?O8hpxO0FKHt1SyeCD3rhLTV3iU+G7yPQ73PPZyxYpz0H5/IvXgk2IkAl++fi?=
 =?us-ascii?Q?gwf4b+I4YPKyTRofYGCK5GQO7tIoLd6vn1ZtNrurpU4+i6Q1f52aL46uQvi0?=
 =?us-ascii?Q?sw15bKQXYWfnBmRMFP16bmhxYYqaSNAV/dkbpssmHNXROnlcQeFg33ngNsh3?=
 =?us-ascii?Q?xhcIX9947+8FozTrdhJt6v+CLsqrjpFagp7/zx6ZTVVygzQfQb0QoZgkKwYV?=
 =?us-ascii?Q?S3yMODc06W9eIxe067W/W0eqAFpUtbwkmIRNZWNbJlv3rxsta0YhDVIXx4HU?=
 =?us-ascii?Q?gxio37f9oA6NKyXjjqUQrK+uM1ScBCgNRQDNCgsm5zuzP8b+iDaFCzQVG6e4?=
 =?us-ascii?Q?wb1Jv4D/01On5N1+UqUNglONcbkC0+NJig+oRAwtJXkhFBeN3nz++mFognwX?=
 =?us-ascii?Q?p/TgyDij3hWMqSia870sBm9abHRM2nXupU0apf0fLG9IFaji1JR6+8ynHtXg?=
 =?us-ascii?Q?Qn9f46LTo1P8UOfizb035aKg64Q0NKIYsXtmvRAMJsTRNjZ7fhslgR3FWT+g?=
 =?us-ascii?Q?MbYPBq5t01vGqXfbPi+Q4b/nwjLtEQpLDMkhelth4k++HU17hdqR/775AjhS?=
 =?us-ascii?Q?WVIVJkup/+NeJYfKdeLihVMkOqQNW6Vc06Cl4wRER/F4np7ZL80A2EudJAlZ?=
 =?us-ascii?Q?yAvsJo8+PH5xnsZj4PLQUNqm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db7e232-a450-4ff4-853f-08d93a115042
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 08:47:08.5837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8/RGnYqsUq34LXOoWY1rUp7txczqig6P9aJK+CdvpJ642bjY69T/71vtFR4Fc6rIQYZnNUrhjsJgZclAQ8njg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 25.06.2021 20:08, Andrew Cooper wrote:
> On 25/06/2021 14:19, Jan Beulich wrote:
>> Like for the dirty bitmap, it is unnecessary to allocate the deferred-
>> pages bitmap when all that's ever going to happen is a single all-dirty
>> run.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The clearing of the bitmap at the end of suspend_and_send_dirty() also
>> looks unnecessary - am I overlooking anything?
>=20
> Yes. Remus and COLO.=C2=A0 You don't want accumulate successfully-sent
> deferred pages over checkpoints, otherwise you'll eventually be sending
> the entire VM every checkpoint.

Oh, so what I've really missed is save() being a loop over these
functions.

> Answering out of patch order...
>> @@ -791,24 +797,31 @@ static int setup(struct xc_sr_context *c
>>  {
>>      xc_interface *xch =3D ctx->xch;
>>      int rc;
>> -    DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
>> -                                    &ctx->save.dirty_bitmap_hbuf);
>> =20
>>      rc =3D ctx->save.ops.setup(ctx);
>>      if ( rc )
>>          goto err;
>> =20
>> -    dirty_bitmap =3D ctx->save.live || ctx->stream_type !=3D XC_STREAM_=
PLAIN
>> -        ? xc_hypercall_buffer_alloc_pages(
>> -              xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size=
)))
>> -        : (void *)-1L;
>> +    if ( ctx->save.live || ctx->stream_type !=3D XC_STREAM_PLAIN )
>> +    {
>> +        DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
>> +                                        &ctx->save.dirty_bitmap_hbuf);
>> +
>> +        dirty_bitmap =3D
>> +            xc_hypercall_buffer_alloc_pages(
>> +                xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_si=
ze)));
>> +        ctx->save.deferred_pages =3D bitmap_alloc(ctx->save.p2m_size);
>> +
>> +        if ( !dirty_bitmap || !ctx->save.deferred_pages )
>> +            goto enomem;
>> +    }
>=20
> So this is better than the previous patch.=C2=A0 At least we've got a cle=
an
> NULL pointer now.
>=20
> I could in principle get on board with the optimisation, except its not
> safe (see below).
>=20
>> --- a/tools/libs/guest/xg_sr_save.c
>> +++ b/tools/libs/guest/xg_sr_save.c
>> @@ -130,7 +130,7 @@ static int write_batch(struct xc_sr_cont
>>                                                        ctx->save.batch_p=
fns[i]);
>> =20
>>          /* Likely a ballooned page. */
>> -        if ( mfns[i] =3D=3D INVALID_MFN )
>> +        if ( mfns[i] =3D=3D INVALID_MFN && ctx->save.deferred_pages )
>>          {
>>              set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
>>              ++ctx->save.nr_deferred_pages;
>> @@ -196,8 +196,12 @@ static int write_batch(struct xc_sr_cont
>>              {
>>                  if ( rc =3D=3D -1 && errno =3D=3D EAGAIN )
>>                  {
>> -                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred=
_pages);
>> -                    ++ctx->save.nr_deferred_pages;
>> +                    if ( ctx->save.deferred_pages )
>> +                    {
>> +                        set_bit(ctx->save.batch_pfns[i],
>> +                                ctx->save.deferred_pages);
>> +                        ++ctx->save.nr_deferred_pages;
>> +                    }
>=20
> These two blocks are the only two which modify deferred_pages.
>=20
> It occurs to me that this means deferred_pages is PV-only, because of
> the stub implementations of x86_hvm_pfn_to_gfn() and
> x86_hvm_normalise_page().=C2=A0 Furthermore, this is likely to be true fo=
r
> any HVM-like domains even on other architectures.

IOW are you suggesting to also avoid allocation for HVM live
migration, thus effectively making assumptions on the two hooks
being just stubs in that case, which can't ever fail?

> If these instead were hard errors when !deferred_pages, then that at
> least get the logic into an acceptable state.=C2=A0

But the goal here isn't to change the logic, just to avoid allocating
memory that's effectively never used. What you suggest could be a
separate patch, yes, but I'm afraid I'm not feeling confident enough
in understanding why you think this needs changing, so I'd prefer to
leave such a change to you. (If I was to apply some guessing to what
you may mean, I could deduce that you think ->nr_deferred_pages may
still need maintaining, with it being non-zero at the end of the last
step causing migration to fail. But there would then still not be any
need for the bitmap itself in the cases where it no longer gets
allocated.)

> However, the first hunk demonstrates that deferred_pages gets used even
> in the non-live case.=C2=A0 In particular, it is sensitive to errors with=
 the
> guests' handling of its own P2M.=C2=A0 Also, I can't obviously spot anyth=
ing
> which will correctly fail migration if deferred pages survive the final
> iteration.

How does the first hunk demonstrate this? The question isn't when
the bitmap gets updated, but under what conditions it gets consumed.
If the only sending function ever called is suspend_and_send_dirty(),
then nothing would ever have had a chance to set any bit. And any
bits set in the course of suspend_and_send_dirty() running will get
cleared again at the end of suspend_and_send_dirty().

Jan


