Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E122E7141
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 15:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59918.105049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuFa2-0001Av-PS; Tue, 29 Dec 2020 14:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59918.105049; Tue, 29 Dec 2020 14:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuFa2-0001AW-MJ; Tue, 29 Dec 2020 14:02:30 +0000
Received: by outflank-mailman (input) for mailman id 59918;
 Tue, 29 Dec 2020 14:02:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuFa0-0001AQ-Cm
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 14:02:28 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7af179a-c968-472e-bea4-9b2032cabf27;
 Tue, 29 Dec 2020 14:02:26 +0000 (UTC)
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
X-Inumbo-ID: f7af179a-c968-472e-bea4-9b2032cabf27
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609250546;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CgjQ0wkE9VpL2pIFsFqGfISDSfYvkzdFBLi/EhdnM7M=;
  b=LWu+MA3X5Tb0rWc9IEmEPF0L+V2pMbqHHAVEIK26r9xR7CW9IS1EmwQZ
   P0nTk+qIe8F9j3W4Roq0MNb5jjWJMRh85fSCOsZRUUemC0uB8HDDjF6kk
   ACLz3nHJBh4KtLb1+XWj06s+IGvbuejDBd9Rxreji/0fxnnA23wPHtcr1
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NI82ovU2MoKJVF7geU070lxpwIQI6wsnr0dFw0ov40iJHI6SgAxlCxQp2q/e0h0e11eQI8T8lu
 QnFltl1UrhzIod2ftbrYGKIrfk0svWi1BAhCUGdp99kp66fiFqF+AtwjFZiDnKh0ef6zfRbjn+
 P04IRDYcL0wdq3izua5Z+Yig6Nj7dXQ+LmPBqd3Jeib5TTtp0Z6sJxY9Bk9rXc+sef87qabt5B
 V1//9dTt9rdXzpPam68tAoZ0SXJbDsQksjJD5a77QXgcAnJ8eU+Joo+SCyFnp+4yrbdTEJG0WY
 hEQ=
X-SBRS: 5.2
X-MesageID: 34126277
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34126277"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWycmHXWvdBEgQaFupU9yGu8yepyugGMSe8lsFSWq4fvDNeo1igMbvynuNz1p2lwKbKMsASskM1ET7PCWHwVwVmIf7DUVu9BVDeyjqnFYNAQ0HXrlpjb4u1gdSEikO+lBulSiqrf+ON/6kxHz1uD2AZ25m9dNtt94YTyUd3RAWn1zfSwoPJdKuUlQoWCy8b+PsBzZDGD8YOk4qe5FvRWlNxACvh33mVZ7re2/WsaCtYvi6ULJ4h3U5CvSvDyEmlAJ3U9kRFZUH6bepk175pwiz11dF7lyEWDh/pXsH+RDY+cEx1icSWh12pBGZTpkYjDtLFWMu/Iw6M9bGMGg+HDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm6Cdv61E5EFUzA1Vtu6CqolBNW57o6oC1DXEVZJgN8=;
 b=QbZVti40msp9oHGYHNOfD8VZlDWeqmmL8O3pbH3KAqN9mmfkN5fYN2ErNKoRMidXXYMCTmUlo/Yot3jxYGQzfCtIxHqm+2Ox8bwQYpwIBqIIsYdxc6Sgqc0KHqQKJUJEMEKgVLjZqIx54fErBxbPVrw6FS+We6H5EhSj7tARJxEK3zEtH/x6/DFxdJi5I1jsDwBi7XD0MaxyZUbndPZ0b8XKhMA61XR3WeA8rek7o4k/koVcHpzVQTOpUm3HUAG5xMi5GL4ua5guFp6GmRoisYg+irkjVQ9/ENVK3DTwY0+k083P+0wqlqSVPsjxBds9QkShlX5IIzsKUaQ9nRC1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm6Cdv61E5EFUzA1Vtu6CqolBNW57o6oC1DXEVZJgN8=;
 b=qjHBzNHZC/l7LO2yOWNQw5zaqg5HMVmmQc7q9g8868TtWfWn9vFh7TGTchkimSoQQkOOD7bZ4lt2fYdzcHf3SHoeIVSR3fZtUEWFmpmDBdLOQ19l/3V8HajH822e/Z14bS+TWqDgvUDnRHp80rc6ZsSVcRTnqZE20/xGlgVdUDY=
Date: Tue, 29 Dec 2020 15:02:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 13/24] Don't assume tv_sec is a unsigned long (for NetBSD)
Message-ID: <20201229140215.zl5yju6hm7wcacht@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-14-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-14-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0171.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::10)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c85c08f-b314-4d03-84f4-08d8ac025d5d
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463D6B72601F3DE2B2E276E8FD80@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m81SmFdEsoC39CItSweN4l88YBqTcro/eig1MCKJZnKolovAYVidYQcuZQcPdxvl/Ig96jxbMzdX4QbZjgk/y3vWJVxrbByWLOi0bVQKeTeGgSATbNyYdoCI8zaNpo1j7uy2Gor/hQGel0Se9Ts4oqo2uUfdlWd/uIp0pFmegWB64+E6XYYk2TUkGB4yGFQgeUAiy49paiTDPUcCD8NfD6iUZtG8wWFIJL2ffaNXsywNfpJNN9qD/ovrLqiV8oRUAy3aNMwKk5182YCs2AXWoiUo1pwqgMC4Es3SKtsEjMSd7DORCIBO4AhFk/5CGuEOid51LA1nZlubqMM5x2Emhgx3YMk82mKl/wkjuzmnFhkVESu4HxOM50UBAjo6v7rNk+XDKdqgxAX/tWtEikfTqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(136003)(366004)(376002)(346002)(186003)(33716001)(9686003)(66476007)(4326008)(6496006)(8936002)(6916009)(6666004)(1076003)(66556008)(956004)(66946007)(16526019)(83380400001)(2906002)(26005)(316002)(86362001)(6486002)(5660300002)(85182001)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2p1SzBNRUZ5d2h1V3BIMkFoQTg0MkRwdXJpcnhpcWZLemwxRU1obzl2MEFn?=
 =?utf-8?B?Rm4zM21qa1dRQTFoeWRGdW81MXkzbzdLZmpCYzltdGVjK1N3MmFpNTN2NGR3?=
 =?utf-8?B?dmNlQnhTak1rUW5mTm9USEtwaHNwVlF2eFNtZi84REpiajF4bFI5MEpVYm1m?=
 =?utf-8?B?RkxoS3hXdU9kS05jMFRKcU5LczhCN3RlZDBsa3k4UUtsM05LbFRtMkRDNUpJ?=
 =?utf-8?B?RldjR09jUTVSOXY2VDQwUlBuWlZUMWxNalZjdGd1RTJsMFNwaFlUMk8xdElO?=
 =?utf-8?B?MTIxWE81L20yOGJuYVBtYlU1ekpDK3h6N0pzRFdMTktXSDNXSGNQeXRSRXNr?=
 =?utf-8?B?VUpXL2Rab2NlTEVmdWFlVDdSU3RXQUw2Q1A3WU5PNlM4cXoxQVpudCtML0hx?=
 =?utf-8?B?TXoxL2gyNjVPd3p5dVh6T0ltd1BBUHVnS3dkOHg2eFVYdlR6KzVYbEFxcTB1?=
 =?utf-8?B?RjZqa2hRQ0tBYmxHcmQ4UyttWWVSZ3pNQ1I4THNOc3JOQmdrajNabTc2SnB3?=
 =?utf-8?B?bHNzOGFKUVRJeW1IM2M3cVVRWWY0WUE1NWh6ZGdXU255TDFDMzVKbytUYzlH?=
 =?utf-8?B?VWhJYUxDZnQ2Umd1aW5KWHJVT0ViNmZFUlhQSXRQWUtaUSs1ZVZnWXBneCsz?=
 =?utf-8?B?RUJXUllZalI0a2o3NFBCdjg3WlY4WFJ6SERocXRKalBVcGt1WjdKRzdHNXV0?=
 =?utf-8?B?alNXWVA1N3pRT0c4TGtJbllIdnNRallGb0pNZHBKTGcxTlJ3QUxBbkp0S2hJ?=
 =?utf-8?B?blRBY3R5V2NOdWo0anN0KzJBWFh0NE5RbXArcEhoTmdpOW1xWVVKdGpGS3JM?=
 =?utf-8?B?ZXg5SmtkMFplMXFWZjFnRGthRjhLaEZtWld6eGRMcjhMdXBndDZuRHA0V1h4?=
 =?utf-8?B?a2FFSm1CUG4ya3k0eWxLUUdHMVM0U3pIeUhGVmNjTkgwdEI1V1FZa1ZtMHlt?=
 =?utf-8?B?Yjc3K3Q3akVMMWc5RlpKNTZSa3Fqa1c0MmQ2N09rUTN1dDVEWGV4T2RMNndE?=
 =?utf-8?B?b0gzQTNXRlVMc3crR00rNUd1U1QzcUlsblZSR3BPTlhqVm1SNXY2dXB6U0JQ?=
 =?utf-8?B?UkxEVmlvOW5sekpTSWdvREszcVdlMTJkSEhQdllrVDh0Nm1LcU53SWo4V0Nw?=
 =?utf-8?B?QnlIbmoyY2JwT3lvSDAyZXdVRWl2VWJkUmxxblF4Z2pCLzduQ056SS8xQzNs?=
 =?utf-8?B?VWRzQlIzbVo3aFRqWW8zcEZwNGVRVmhzWk0wVkFDQlExdE9kSjNEblJuRUth?=
 =?utf-8?B?VkNmNVFjL2RUVnZnd2daVmpwZ2h1UWxVNXZhdXBmOTNSZUN3REZ3aWMvbTcx?=
 =?utf-8?Q?zzD+XFuVRxFI2fRJnaLEtDZhZIzHT+s4P5?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 14:02:22.7913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c85c08f-b314-4d03-84f4-08d8ac025d5d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zksvNCGjaoFz+wKnjDE/rVWM3eIMDfYJXO/cZMkFvZf+15vw/zNpmkfOXj993LlEpterrJBrEjlkmLuJJK6XNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:12PM +0100, Manuel Bouyer wrote:
> ---
>  tools/libs/light/libxl_create.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 321a13e519..44691010bc 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -496,7 +496,7 @@ int libxl__domain_build(libxl__gc *gc,
>          vments[2] = "image/ostype";
>          vments[3] = "hvm";
>          vments[4] = "start_time";
> -        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
> +        vments[5] = GCSPRINTF("%jd.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);

You don't cast tv_sec to intmax_t here...

>  
>          localents = libxl__calloc(gc, 13, sizeof(char *));
>          i = 0;
> @@ -535,7 +535,7 @@ int libxl__domain_build(libxl__gc *gc,
>          vments[i++] = "image/kernel";
>          vments[i++] = (char *) state->pv_kernel.path;
>          vments[i++] = "start_time";
> -        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
> +        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);

... yet you do it here. I think the first occurrence is missing the
cast?

Thanks, Roger.

