Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFB3B489C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 20:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147361.271580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwqGL-000094-JZ; Fri, 25 Jun 2021 18:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147361.271580; Fri, 25 Jun 2021 18:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwqGL-00007g-Fg; Fri, 25 Jun 2021 18:09:09 +0000
Received: by outflank-mailman (input) for mailman id 147361;
 Fri, 25 Jun 2021 18:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwqGK-00007Z-Nm
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 18:09:08 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee1f386a-1d66-4ec1-b9e7-e6ab92edf1ba;
 Fri, 25 Jun 2021 18:09:07 +0000 (UTC)
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
X-Inumbo-ID: ee1f386a-1d66-4ec1-b9e7-e6ab92edf1ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624644547;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DCR9DOjKD8pVtz4qOLegIOjyauoklhVfvRnIVBYfnS4=;
  b=JyP/OxcqYYiFDIqdxuC2fH6rV9KUN7Fl1lK3A+8Tw+pRRMiRqRL4fclS
   za2U5fr2VBvvH7nxDo8FwMCbbIMp4pkuL7k4jgU3Cwq59ZXnMzZ2bTaf+
   mLSLjBV5QwJ6iVUXKgdMNv4kisFzPMKSlnHFbFoeTL+F4I5l/XWq+Qtak
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2CFwX7yGZefsnzZOF5Meh2vsn6mi52bWioaIS2CnybiQ4Ag2zz6bFnosrvlbSl9C4BqhmieF1w
 qCj5OHC0C1SeCkuM2lst1Zzx3e3xmV4sYgC6d6g1BD4Pcaoy21OFdY41c3RIO89y2xWTuRImj5
 LzDHVj69i4XdV9UoCXGu697wHGkOi9O72SBBTz8ufaILY4mYLtKhEycW5w4mZ2pH0Gr4de+8/z
 JIIktXVKSw2PdCA5NVsLUx1wOYKG0lPaCwqfUVOCMpvAU6TdkU8dSBWlmACk84ib4wrp8Bnahs
 dq4=
X-SBRS: 5.1
X-MesageID: 46710053
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bC/JJaypWhvIcxwBjd8QKrPw7b1zdoMgy1knxilNoERuA7elf8
 DHpoV56faGskdqZJhAo6HxBEDuewK6yXcY2+gs1PKZLXHbUWaTR72KjrGSsAEIeReOkNK1vJ
 0IG8UTZ7PN5BpB/L/HCWKDYrQdKay8gcSVbJDlvhJQpG9RC52I6T0SNu/RKDwKeOAPP+tEKL
 OMos9AoSPIQwVnUiysbkN1INQriee76q7bXQ==
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="46710053"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CW0zvnO0ThZng76EKMu/usQQX2j0KIRa7/awSwXNVxadGCDStmei8HJZF1hnhTtzDg75qnqnmt/DWJlt8q+sKXYqo8n+CIfLG3jzRUSZ34JvSdPVqODdYqyxIbez707ZiF9tQTQL5yZO3ag+w3515NddMO0WuLDrf7HEDry2a50HE0kTpgQMKIZtLwTU1GLdMmKFG14hBj9lQl11E+UgkLiXAkCkf22yK2jKY0xkTC1gQ0xV9+2Ad5gkEJPUD6MLTZitzYIhymAp4jAVPkEfRciVpqxpyS5Sec0c1H8Wi3qONLfw0aoMwlFPJjv9MSAeFoJODF81ZZQj4QdkE0OdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG/EsOZKVfSHR+G9NgGAfbRGt9br8CDW/wU3ZxVJpJQ=;
 b=XM0qGkr2kmJVgbHo8YnlEXTFQTRIeQxeTeSHphOjiMJe0hxmbGz8LaCsi5F0zuhlDIghlfoYr0gSl4omnaUMYWLsX5PsgDWX3TuzqmzbabaoCA9e9DqBEIxJCgv7ZBs3VoLBv1mhg6aZQnKzInCGOgwy5F/HE54J26FJxLhSRD7iNagEQ4OXa7df+nybZ5m61keE3qSMzZeBm9UHZJlFwEuzI1001B4GvEmzwMmFc3jc6gCdPsvVvJAlgJiy2Y9lscL19sVi0v99B8C8UEY+y4qtLm54NHT5sYbldxIrXQghQwT0r0H5q8PJene11SuIaBETxrYMyGwZEJf/UYUucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG/EsOZKVfSHR+G9NgGAfbRGt9br8CDW/wU3ZxVJpJQ=;
 b=a9Xrus7Gl//Boy3IzP9m9xsrXzQ5tg7PHeuN02lf9S+/tQLD5c/JhFHfEoLlxKOIp6CtXorid4Y5J3iHZCbI/fhTMwDNAT32U6kAWrou+ahG+5oJ6eEeHPaDeQ00TBWCT8svMl01XHaZSgpywOCQpDDD4TvrEVY6ojYjuA39Tf4=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <61ff4f26-a9cc-d123-98a0-be6c23f21e9b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 04/12] libxenguest: avoid allocating unused deferred-pages
 bitmap
Message-ID: <44825600-c27b-34ac-01b2-1ffb5e0bf0be@citrix.com>
Date: Fri, 25 Jun 2021 19:08:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <61ff4f26-a9cc-d123-98a0-be6c23f21e9b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1fc69f1-2aa4-4772-65f1-08d938044fba
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6240102E68639ED3E73BA85CBA069@SJ0PR03MB6240.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrb3Vi2ZtpQlGiOeVUi5j4v7GuzqQZsqNNUs9yVBx/M3EhHXnOQJJVfkNA+KAVdnDT0VORjO/3zl+7C0753zRwKbt2SW01MLWrLOjdfYYjRDjXmvWcKSpanCF6DIXUVDoKhV7Qw/I33dqUwB4iNCWiLzC8yL10EE3reBgK2RdIA4lUAtutvNRue0MTMrr8CPNudpvDJ1McvqCTz0WTmvoYDUvGtfE5uHtp7wViuQjrPDR1LiGc3YTuobedZKQ+0DDOovSBk4b+NOFJanTI2naXpbW40W8iJZ5znSi+mp356OiS/sOlgbyV13GrKK8RkZSuU6FzBuiI3f2myzAML0zk/zW9h8VuXNQzKgfAEu3ngFfOCCRUexWVoXTjZoTtBN2TSkCXmEq1NeTQ7rk5hDqPUqGl4nGO2nryIcAtEmmxmgIiSaUFchmrBs/WLBL1YtP2gu/Yiyv6IsLOCawzlb3RzDKi+ckwtAkpcmvx8H3mg14q+ohka2hBwUT+aZ2/P7jfKWrZiZyYilr47mlzyRanukUddQk367fipdhJYOohIJZQWxsApakSwcUB4bmKqvcdl0Arxle/OlQ74w0VfVw3t7TFm0KPXeqKYO3fImv7dlRKOrWzRa3Er1iqqtc0p0rQbJVnGAM4X7nNG+og/Adep08K2fVN9/mMQGGKTcCus5y+CLh0hBpBVTcO+W2U7fdIwF7yemdExgtbtTKFRNk3FLzdq/9Ckto3o2X5IfDrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(366004)(136003)(83380400001)(4326008)(26005)(316002)(478600001)(16526019)(186003)(66946007)(16576012)(54906003)(5660300002)(31686004)(66556008)(66476007)(110136005)(53546011)(38100700002)(6666004)(2906002)(36756003)(86362001)(956004)(8936002)(31696002)(6486002)(8676002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1F1ZDdPTUwrd1E3Yk93WmVubG1UVzBuOXVTSmtmNm8yS08xQlZnSWdVNE5k?=
 =?utf-8?B?cllzUkRMQWJrNm93VWxxYlF1NUN4T2ZJQnI0UGNpMHBpQkdWNlBndUlDaTJ3?=
 =?utf-8?B?TFJsMUIwd1ZTb1lkWFZJWjNIMlZxOXphdXdzT3B3U0s2YzBhWHUzWHZqR1d5?=
 =?utf-8?B?Rkczb1Nva2ZRQ1VzM3VJSjVQR3VYNnFKWWg4c081SldPVHpOSTkvOUNMUjBT?=
 =?utf-8?B?TStiM010L1hwU2hubHhzeEp5YTZwOU41M2lxVnp1R0FjV3d3Z3JTSmlmNDdO?=
 =?utf-8?B?RnlnTVlQWmlXSmR6d3hYS0tzM2hzdmorSi9JVVVHSmJYTStxeDZMS0FyanZ1?=
 =?utf-8?B?R3Rxd2kxdnhjdzRlaS82dUVhSGNSd2NKeHBISjUwOTJmbFVZTG8zZUZSRFVi?=
 =?utf-8?B?dTBzRU12ZlBPSW9jMnYxcFlHWFBwUjUrTklGNVlYVDN3SEtOZHpKY1Q1U3hW?=
 =?utf-8?B?ZUtkMWJYRGhvc09jMmRZbUdpVDlLaFpUeVJtSS9MOU9sZElLaDNESVVVQTBu?=
 =?utf-8?B?S3VUeThjRXlZOWYrNFJQZXpWYS9hNXM0bm9FYmxwWlVYNDFrZ21VOURZOFZO?=
 =?utf-8?B?QU5RN0tSd052cFhHQU1IMUFJVHhMbnZQbDJaSjN2YjBUZmlXbGo5Tkc4b0w4?=
 =?utf-8?B?endhNXFLVHkrQzFNTzR4QkJhYWF6SnRDQnFjRmtQT3EzbTRnZFdYSWkvaFV4?=
 =?utf-8?B?QlFMck5IUnlWSGhlaDFXOGJzNDQ1TGViZ085c090ak5NOGsrZS9hL1JNQm9H?=
 =?utf-8?B?MzFsOFhHNitpeWNTYlpUZVVvTUJiTDhnVlM0c2dyYnJ2ZTdsUCtQODAwdXNy?=
 =?utf-8?B?VitOV0VvaW12TVdyWGxPU0JXdUJPSE95SjZzUkI0OUpQNEtVZ2Y0VFZTQ3pu?=
 =?utf-8?B?ajBIamVnUXNyMjkzazNPbGVWRERjVzEyK2c5cGhGYTU4TENhaFphQzBqZksw?=
 =?utf-8?B?ZDVqeEJLeWlLQ0hUV1hVTVhiSXlxTE5nUjE4VVp6b3o4cVhYZEY1MnZUK2N1?=
 =?utf-8?B?emNTaUxPT29zSWk4Y3lwa3cyalhOS2lGazBNdlQzQWhWMzdmZ0IrYXp0OWxY?=
 =?utf-8?B?eVpRUjV1YlNqeUJIbkk1ck0zRmkyby9HVVh3N1hsYVo4MjVWTWlHZ3hRYk5p?=
 =?utf-8?B?RkF5QjYvdFJMNXVEUUJISWduejhGTlJaZXowVSsySytZR2UwYWEyZUdMb0sz?=
 =?utf-8?B?Skh4eEVwazkwTUg1c295OWhqTHFzTmg4NVI4dnlVcGxheEhRdndDVHlhU3lO?=
 =?utf-8?B?aHRXN2JmRDhtRy9VM2M5N2xwcFFRVmRSR2lWOEdxbm5ObVloUW14bDRIQ3Ez?=
 =?utf-8?B?WGlQbHZYUXY5SkVJSThmSUNreTJVMzNac2psa1FHQktSWTZwRmJtS2hqVVN3?=
 =?utf-8?B?cC9oU3Y5QUFPaXZEL01IMWhOejUzRXI3ZEpnRDhjbzIyaHlkV0RaZjcyU3dL?=
 =?utf-8?B?YjkwYjBET2M2Q3VBY2pKVXBHVDNpYjk5T0ozYkNUbksrajc5QzZlQ0pUR1h0?=
 =?utf-8?B?RURVZFBCTEZoT0RabFNaUHdkSnZlM3F0SkxkekpiZEc0UnVnNnZtSGJTMFJK?=
 =?utf-8?B?bDEwZ2kzWXJsZFJrdGZQOHNEWXVvNGZQSVp1ZkttR0RPZjhObkFRZ3M5a2J5?=
 =?utf-8?B?RFJGTmIyNVlVcml4SnkyOHR4c2k4NmFyY1QrY1BHTGhUTDdLb2hYT1NMdmZW?=
 =?utf-8?B?S1RSQmlqZitheUEyam1FOGdEcExoMFNpaWh1WjN3OUxERmdUNm1xck5MZE1Y?=
 =?utf-8?Q?oPx27sZSYh9LGERN7MxJWxWMz63ED+rZ9EMqMky?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fc69f1-2aa4-4772-65f1-08d938044fba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 18:09:02.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21HotF01oKWZ893qYv1EBvIrIRBfG3YoWioAWlQTaZmIk5iF0DofFBCgXqWw3TOrvx5zfchdaMUv7dSUZr71+O6t5xVxO8qqZ7TMoC42xS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6240
X-OriginatorOrg: citrix.com

On 25/06/2021 14:19, Jan Beulich wrote:
> Like for the dirty bitmap, it is unnecessary to allocate the deferred-
> pages bitmap when all that's ever going to happen is a single all-dirty
> run.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The clearing of the bitmap at the end of suspend_and_send_dirty() also
> looks unnecessary - am I overlooking anything?

Yes. Remus and COLO.=C2=A0 You don't want accumulate successfully-sent
deferred pages over checkpoints, otherwise you'll eventually be sending
the entire VM every checkpoint.


Answering out of patch order...
> @@ -791,24 +797,31 @@ static int setup(struct xc_sr_context *c
>  {
>      xc_interface *xch =3D ctx->xch;
>      int rc;
> -    DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
> -                                    &ctx->save.dirty_bitmap_hbuf);
> =20
>      rc =3D ctx->save.ops.setup(ctx);
>      if ( rc )
>          goto err;
> =20
> -    dirty_bitmap =3D ctx->save.live || ctx->stream_type !=3D XC_STREAM_P=
LAIN
> -        ? xc_hypercall_buffer_alloc_pages(
> -              xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)=
))
> -        : (void *)-1L;
> +    if ( ctx->save.live || ctx->stream_type !=3D XC_STREAM_PLAIN )
> +    {
> +        DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
> +                                        &ctx->save.dirty_bitmap_hbuf);
> +
> +        dirty_bitmap =3D
> +            xc_hypercall_buffer_alloc_pages(
> +                xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_siz=
e)));
> +        ctx->save.deferred_pages =3D bitmap_alloc(ctx->save.p2m_size);
> +
> +        if ( !dirty_bitmap || !ctx->save.deferred_pages )
> +            goto enomem;
> +    }

So this is better than the previous patch.=C2=A0 At least we've got a clean
NULL pointer now.

I could in principle get on board with the optimisation, except its not
safe (see below).

> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -130,7 +130,7 @@ static int write_batch(struct xc_sr_cont
>                                                        ctx->save.batch_pf=
ns[i]);
> =20
>          /* Likely a ballooned page. */
> -        if ( mfns[i] =3D=3D INVALID_MFN )
> +        if ( mfns[i] =3D=3D INVALID_MFN && ctx->save.deferred_pages )
>          {
>              set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
>              ++ctx->save.nr_deferred_pages;
> @@ -196,8 +196,12 @@ static int write_batch(struct xc_sr_cont
>              {
>                  if ( rc =3D=3D -1 && errno =3D=3D EAGAIN )
>                  {
> -                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_=
pages);
> -                    ++ctx->save.nr_deferred_pages;
> +                    if ( ctx->save.deferred_pages )
> +                    {
> +                        set_bit(ctx->save.batch_pfns[i],
> +                                ctx->save.deferred_pages);
> +                        ++ctx->save.nr_deferred_pages;
> +                    }

These two blocks are the only two which modify deferred_pages.

It occurs to me that this means deferred_pages is PV-only, because of
the stub implementations of x86_hvm_pfn_to_gfn() and
x86_hvm_normalise_page().=C2=A0 Furthermore, this is likely to be true for
any HVM-like domains even on other architectures.

If these instead were hard errors when !deferred_pages, then that at
least get the logic into an acceptable state.=C2=A0

However, the first hunk demonstrates that deferred_pages gets used even
in the non-live case.=C2=A0 In particular, it is sensitive to errors with t=
he
guests' handling of its own P2M.=C2=A0 Also, I can't obviously spot anythin=
g
which will correctly fail migration if deferred pages survive the final
iteration.

~Andrew


