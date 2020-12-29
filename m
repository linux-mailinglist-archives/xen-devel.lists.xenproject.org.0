Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF542E715A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 15:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59936.105085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuFyu-0003Lk-Em; Tue, 29 Dec 2020 14:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59936.105085; Tue, 29 Dec 2020 14:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuFyu-0003LJ-9l; Tue, 29 Dec 2020 14:28:12 +0000
Received: by outflank-mailman (input) for mailman id 59936;
 Tue, 29 Dec 2020 14:28:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuFys-0003Kx-W5
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 14:28:11 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09feba26-6164-42e2-9667-5039cc306ea8;
 Tue, 29 Dec 2020 14:28:08 +0000 (UTC)
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
X-Inumbo-ID: 09feba26-6164-42e2-9667-5039cc306ea8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609252088;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tvFMsrt8KXHoYipeywmWXNk2w170txRF+V318AOynyk=;
  b=XPNKPrPKdlbyQgUQTXQD62f1zQk69iBfvMl7XQclgkkoJ/mV7H2xSXib
   v5lESc0XzLdhGgLX8ayyetbIZ8iJG/T29ZhbkZl0900gziUCwd6xd25tG
   KYA+vIv1dTBp/7KDPUNvOocigP/zo4oGlHYyH/Yu8KtVRoxZOYglheDQx
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3/Y7gZN6tR6QgyMRjAQTA8kjB1n5KGE0mcrVWOQMR2i7BLD+kr5tgR+pRugEexH6HC9qPvJN8Z
 9Ux/Udyjx9yQP2n9VjQ2cC1wF1ZbOwi1JsY0U3KVf1r6dUoDBGZ9+MUbmeeNBaJqvO+CJVhy4y
 i8dEm55tD31mnjFCZ5rXsP9ohw2AQGGBMpHH9rt7ixtoxpgJw4GuG3rwInB07qFmkTRGYK9DfF
 l5vHTeUUGUKuJHFjdEyG3hbwZGJ+SRrW16Xeaq+JoTaktVwCesg89Z6A3PRX2KX5NglIPm2ncm
 3bc=
X-SBRS: 5.2
X-MesageID: 34091956
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34091956"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXjaXBnK/4iJxYF1IsGTy02VvNFOHt3vtxOEmEWXKzzSgTOTJQ1AvN7Wc7LiQ2D3JMH9mry4kvQ1pHP2hhbFLM6qCUSSFXMuUm3kpEcbBGgTxG0o5jR21Cd7lV7+r0IUl4Pn7CY0nMsK+3pypx9q/BE7Znz4FpNdkiDVsMXJKM7b4ZQKbjdP8WDXBtFnS6k/sL23A/rQsS59PpXg99SwhVokFKPk2q49OKxN4BsWxT8XazOrTF5kqfpN10xIA/3F2JG+lVFCjCgWcTT/zvZcOOwT8Wo26ExmGqM00hmyqdqJFPMiNPi4USGmjMq1ZuFXeM8bj67cqfwiU0p0nfFpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SwvUQp001dK63uoLpS9nHeRnhOPlo3FkXiMtSA5P98=;
 b=PIGhmnfXxPGWYZbqcoNBotmiFDxdambNJCIiWaMrFdOhjp0gNK/55/KsUJY/cdYF2UgnHv39eP4ANgMSY+S2rpb/Kf/43CsEQmvoi6gd0fI19V5YGBxHsbMzCVBK1MaRViz5VRsjQpZxwizgdBZYkWrl4m+QumWJDpsPVV8nQfOEUqfmOe/sej/NYLSxSsBdQq4GbiIsBbQWKwmCS4fC0eQp/Pm+08EFlP+IJe167peG+HBBUt0jazf05+4VLn/lUInFlLZ1GFe912VXk1W4O06c4EWxGdl7WAT550OqKogUKjLZd+niTqtQEZchajl5RKYqRpQowFiSc8GjZKwa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SwvUQp001dK63uoLpS9nHeRnhOPlo3FkXiMtSA5P98=;
 b=ZKyRxzwPNVWMMFbjsXmMSMlf3UP9peeiUTU7LPCqoLs7KMjfoqsq+UwtSPry+S2mIPpaSIwpNOME/NRAjzOljNDG+S+r9W/jwsySYywOsoA7/NXloU2Uujyr00KG3+TycpxLMnXPW0uzBxIVbFrfgzNhP/p0Wto0PSLpGecUN9M=
Date: Tue, 29 Dec 2020 15:28:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 17/24] Make libs/light build on NetBSD
Message-ID: <20201229142801.6tcgu7seg2opgsrt@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-18-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-18-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29c7ad52-60b4-4f22-f17e-08d8ac05f504
X-MS-TrafficTypeDiagnostic: DM6PR03MB3948:
X-Microsoft-Antispam-PRVS: <DM6PR03MB39480C3C0BA95991EDEAE6DB8FD80@DM6PR03MB3948.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAdkUMqqs4fk4AAIHMRjI+IWDX07bdiES+sCzZWzXK5dgCb4dgzgEV6wsf3JFrehORRd7PWw1rxW5+bngWUGL0O8a0/+VfzKokL5KR56HAmTDgM4LKtz4SHw6P20a7b5k5Mqtsz7b/ofEDMrBrRKAyRj6CU8gZekmaR+rTJgTtEgrhrLp3VleHxaenQzdILMoOlfygQSm7QtgaOpXVyCeunj2Ms4msGO8sKpYkhx3eTk6RLwMniFNtanNE0dCPaA6dCOG1G6tjQfPaOBvHGi5m2vsrBkGSuroPkmvudoXGlT28madwWVFO5pSbiDHnXFQCqbKEa5funobHgOxaYedZNTZ/Q5uJCUO2sn1n5htToVYkQJwBBbec3rScuZneWmOAFw637qVYzGwz0P1n6MJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(366004)(396003)(376002)(39860400002)(6666004)(66476007)(6486002)(33716001)(83380400001)(478600001)(6496006)(8936002)(26005)(16526019)(6916009)(316002)(956004)(186003)(4326008)(2906002)(1076003)(5660300002)(86362001)(9686003)(8676002)(66556008)(85182001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFMwSFNzZjdTVEJNREFwcEMra1BvN0J3ek1NOHhneTRRMGt5d2FtMXhEdkx4?=
 =?utf-8?B?NUx3ejNxOSsvZllkeEJhQjhEOXFTeWV4V0pOMGUrTTNJeFk0djg3L2ZucUxD?=
 =?utf-8?B?dFNFU2o0RDRham50anc1QkZWUGgzUnp0enRjbnZJYk5GVnhIL3pGRmhxVWVs?=
 =?utf-8?B?clZ0bzByTHAydDkwaFFiRkMxYWc5TlBtOEpINkdwOEdXRWVTZW5vWVBuMXpF?=
 =?utf-8?B?MW5DR0phNjhrd3VveVhYb3JlR1ppSmNsUGpMYkR0dUpjR3lrZkdwTjlMK1hQ?=
 =?utf-8?B?ZVk0ZlNWTkJEcnpxbDVzRWRYbnY2Y2VxZUhzZGxLVTJKK29aOVI3SmhEU0F6?=
 =?utf-8?B?UDhBVVZGL0xieVJ5VEFQTHpzWUZqbkZmS21wN1ZERFMwR0NmTjUyeStHbGFX?=
 =?utf-8?B?cTV3Mm8vRmFDQ0JZTHFFM2Jab3N4d3JCNjFrNStGQTFtWXZOdGFvUmJCUmtn?=
 =?utf-8?B?NjQ4WUQ1L0JyUWVvazRaWFZNbzJEZ1RFamx3TndvYnpMUHltYkE0MDVZVUw3?=
 =?utf-8?B?TEVuaXkwUXVkVldrS0N4ckhMRGNtZ1hFNTlzMFVIZnp4ZkI4bE9MYWFBSlho?=
 =?utf-8?B?VU5UQ2ZZVk53akpHRFRXTmkreGRqaUtWWWZGOFhWekN0ZkRUVlYxeEphZnlH?=
 =?utf-8?B?c3RkcGFmd01FYTQ0d1Fma1BnM2ZYbkxkNDlQaHJyUGw1N3JDQlBjeENOUm42?=
 =?utf-8?B?MjUwSW9ZQ2hlT3hqS1VhQVJZNHhjdHRpZ3JTOUlhSC9oNndqV2JweEsvSStW?=
 =?utf-8?B?d0ZsSmZmdmVqWUcxWmhWakg5QnFWcVhBOC9Hd2RlZHNpNlRJVzhJdzZJYjF6?=
 =?utf-8?B?aVNLMGlkOEt2djVWU1NLd0VrQ2Y3MUhLT3F0eUdjNUdmR0lhNnZGLytSbTl4?=
 =?utf-8?B?Q0RMZzYvdkFXc21HYm5wZXZQamNsR1RHWXZqUmFUWTNOSGhMclZsTTN6QUk1?=
 =?utf-8?B?dGovOGNtdEE1emd4eFFIUGxYNm02WDEvRGI2V3gyMS9RSFVjKzNaNVV3cFQw?=
 =?utf-8?B?SWd3bU4wUHVDd3N4VTV6K1luK3FMVUR2T3JJT0VvUHVmS0hPMHhmN0txRzhB?=
 =?utf-8?B?Wi9FVCs2dzJKaDJnR1hWRjdhMDg2SXJJbFhrZ1JvZVBtSzh0QThsVDQyZTU1?=
 =?utf-8?B?bE1maU1pWExRVW5UU3FKbTYrcHo1SUtrZnB4Vnh2a3hLajBwYTRleGRhdk9L?=
 =?utf-8?B?WWVTNEVtLytTQmFRUVRCYnJtZlRsVVBYdkRMaE05R3k5aHpqa1dZZzEweUF4?=
 =?utf-8?B?ak1Kd2IzT1BjQS91cUpKT3lnd1EvdCtkR2RLb2pEVkpZajUwaXlyeGZ6ZzJN?=
 =?utf-8?Q?X0tm/t329GXMT4+iz8sEWcbU05T3CiiT2U?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 14:28:05.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c7ad52-60b4-4f22-f17e-08d8ac05f504
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PjDtE0lS8R6FkhfG9rXNy8KBs+TDx8yJFQwGEC0Zt5221i0YsZ1ScTqBYtxBiNrMEsKcqngFXcm2XkMGooffA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3948
X-OriginatorOrg: citrix.com

There's already a patch with the same subject in the series. I would
recommend to be a bit more specific with the fixes, specally if
there's no log message. This for example would better be:

tools/libxl: fix uuid build on NetBSD

On Mon, Dec 14, 2020 at 05:36:16PM +0100, Manuel Bouyer wrote:
> ---
>  tools/libs/light/libxl_uuid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_uuid.c b/tools/libs/light/libxl_uuid.c
> index dadb79bad8..a8ee5f253e 100644
> --- a/tools/libs/light/libxl_uuid.c
> +++ b/tools/libs/light/libxl_uuid.c
> @@ -82,7 +82,7 @@ void libxl_uuid_generate(libxl_uuid *uuid)
>      uuid_enc_be(uuid->uuid, &nat_uuid);
>  }
>  
> -#ifdef __FreeBSD__
> +#if defined(__FreeBSD__) || defined(__NetBSD__)
>  int libxl_uuid_from_string(libxl_uuid *uuid, const char *in)
>  {
>      uint32_t status;
> @@ -120,7 +120,7 @@ void libxl_uuid_clear(libxl_uuid *uuid)
>      memset(&uuid->uuid, 0, sizeof(uuid->uuid));
>  }
>  
> -#ifdef __FreeBSD__
> +#if defined(__FreeBSD__) || defined(__NetBSD__)

There's no need to add NetBSD here, just remove the #ifdef altogether
and the content of the #else branch, since this section is already
only for FreeBSD and NetBSD (the #else variant was only used by
NetBSD, see the #elif defined(__FreeBSD__) || defined(__NetBSD__) up
on the file).

Thanks, Roger.

