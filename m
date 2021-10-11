Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F67B428C5D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205881.361308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZto9-0007x7-Ue; Mon, 11 Oct 2021 11:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205881.361308; Mon, 11 Oct 2021 11:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZto9-0007tg-Q6; Mon, 11 Oct 2021 11:49:29 +0000
Received: by outflank-mailman (input) for mailman id 205881;
 Mon, 11 Oct 2021 11:49:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZto8-0007ql-Dw
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:49:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c030cf38-7d89-4ce6-aa40-0b4007b27dfd;
 Mon, 11 Oct 2021 11:49:27 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-XfAc0SvnMhutDOWwpPUhWg-1; Mon, 11 Oct 2021 13:49:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 11:49:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:49:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 11:49:22 +0000
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
X-Inumbo-ID: c030cf38-7d89-4ce6-aa40-0b4007b27dfd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633952966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUuL5kdJHijeji1xEY+oeq8hIM3yywBwiLNJhiNMlew=;
	b=ccOGVgYQFVDJ7w8GlK58EcQf5/RkMns//zVi2vUKoNHhyhJcJPhSfLKdfYoR4GXYhk6AWj
	1dhLicllQ+iWKsvS4O9ai7G05TZTpMHbFn9mgxdx5wPl4bnfOAwrlA39ifBRQ8Wu6ZXoQh
	5QKlTj74+fV9sjHHIAJKxCOgvKgWNDA=
X-MC-Unique: XfAc0SvnMhutDOWwpPUhWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VesjsPIWIy+805g4gzJRBB6wHLeBhMmou7fPOvQA6ZFKwWOYgUpwoyrIqwgNoP0+tNsH5B2smxfth6rbFkLAoGJ5dpELPkiV76GxttWwbANcXZT82TyhbjURypHtyTykO2SFh19ZRowShsunRH5xY6r3xKXIxlpu/39pBNwYevD8JK9OkBXCSPuTV+2Lnyyts/8at3MmyWFI5cw8JQn003CNs4feechz0lwXnuLrw0YeOSBuGqnkK8QMQupcuF2Qtu+GTDrGiHWryi/0VABtf9ABIlMdv+C5mulUWw854cnUqj8mZwW7raBGL4cgYEsks80UBqph5Ix6y1w5k3gKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUuL5kdJHijeji1xEY+oeq8hIM3yywBwiLNJhiNMlew=;
 b=Hzv0zxhohZQ/FpzTfLz7cT7aNrU72oEB/ZuWXwzMgUGAO63pwSdd8gng7ePS9aC30G2P+SKNz7dSZWT42w6LgpqcmL3RSCv3VSJhNeEz393gMVQLWDuKmGR/BgxMXkcnmSwEbwaVpmjMKi9v09SLx1w72ldcTE2GO4IVYR9SNT4z37DDJ0tFCcEZ8Xz5f15VHkv+6sMBFBpM0Q+bGNbXrlzXzwy9KaltWS+EAV9ABp3cB18eE7xlKlLwiXQzttoNz4oC8WO4EFuk3dV2tN38C08jX6XFPeJZ72s77yityVVeBuWt1LLHaJNsdyuZesXmTddzZZnOPoed1SVchJv5Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 23/51] build,include: remove arch-*/*.h public
 header listing from headers*.chk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-24-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80ef158e-9502-8f97-8e3c-55717d1596dd@suse.com>
Date: Mon, 11 Oct 2021 13:49:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-24-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb907852-5008-46b7-de90-08d98cad2b37
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392CD77D9161CB2DAE47016B3B59@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8OtOO5FM4lzRSUNLD6JwBbeKu2e7etZnNYIsJl7jB+DI0s6/R5BXGc/OOJdCczA1FoWTg8HO+zWU7TMJ8hwzWxyDEhTzTrlyCjfCMTsjhXL6Xrn3xH8NipygSwXifQy93RzKL3ugcISN3/6ZGNH3fPX7AGLXJXtAaNQpAWy4G9Q5smI+qNX+Uthfuc2zzgqs6DooghWwS+L0F0mGvv6kjDnD/wFfncXxuxXKL5jNEa2akgAOiB1rO9VF5s1OxE59BybnnqhK858WxuqgxzGEB6Ry6OQziG+RhPOBWV2UFHZjO+80Co8fSLfqEe33aSrhonp8GNqEpHEU3irxaG3SMEfuikyOFVlSPMMcmaPuBxVB7KiM0ToOW1eSVhFfut+RaX/CeWZbfTc5lsJrWocF5BF90nxWPf23BDSHVP5G2EjdOoJRiARvYlGenl9JPdsFz/yOYFReW0hcYMy8Hx4iqX53br3xAC9OIVG2BaWAUhxaTWr0t1agfvabYFnW/p2gPVsAVBqaVogWOC7QqMU3Chv5BOQ3LoOFP5g130CaLkxxndI9p8ncttq6DECU1WMftMOyhJPX+FYovKffItTlbepGYAxwf2B3rO9gqTl0g+7HFmABGOs8eXyiZ94Mi09n7r21+OuyXGNunTuXpoFO/D4scP8R3tHX3tO1fc7BT2b7c8W1q3+GRWqCMsCYXBet8gAqkKBkhlQnEaVTIjzo3UnE3UmlMAD+gEWrLwXIJzbtqwtWV+cjHb2Kf3vr5+FU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(956004)(26005)(6486002)(8676002)(36756003)(54906003)(2616005)(5660300002)(186003)(86362001)(8936002)(16576012)(508600001)(31696002)(38100700002)(66946007)(31686004)(53546011)(2906002)(66476007)(66556008)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjlNcjk3UGFWYlRpY1dPSzR5clo5bG93bkxqRWJiRmVPK3lOMVE1dC9XNFRw?=
 =?utf-8?B?eVdCR0V2dEJna0NXZXJBbHl4UGxuV2U1U2Z6MWFBM2RtRk9FNGU2VVpZM2Er?=
 =?utf-8?B?MlZQL3ZYZ2pENzhtMjZIeEVvbHRqVGUzUjRwdnNwc2JxUHJ4c3FBdCt0QmVs?=
 =?utf-8?B?Z0JnQytOUWRURGRuN1NScUNFRzI5UTBOV2tSeGtKMjFGZjV3VXJhaHlXRGlP?=
 =?utf-8?B?M2d2N0thekZMYkRhUlZnOFFITzhjV2ljNzhYcWwwSTVNdms0bVovdFpFeEUz?=
 =?utf-8?B?bUJSWkFRWVpMeXdlUHU1K3BLK2JVbklFWmpwelZUaTVDa1kvNnpHbGZkaTJx?=
 =?utf-8?B?dDR3S0N5bXlZRWVGRmxhekNoc0pjTXEzS0Y0RzBnaWFIMzVVT0tORFhEZnlO?=
 =?utf-8?B?NzVZRmF0OGxmNXQrS3V2V0V1di9GU1dWSERsRjBNNE94UG5UOUNYWTl4alRy?=
 =?utf-8?B?K0pHN3JxU0NBVjFTcXozRC9FbHZscndnS0xYT1hjQlhQLzczNDN5ZE4wMThp?=
 =?utf-8?B?QVc4UGlWa2x3emo4Y3c3T05NVCs0VWg5b0h3SzE4SW11RC83RTJUV1h6SmVi?=
 =?utf-8?B?anlYd3VodkNsM2s2aGNVaXoyMHpSU1VJLzh2akQzSWM2Z2lRb2N3YUE1OHBl?=
 =?utf-8?B?ZllZc0IzbE9VRkkrOTNGZGRpOGxxdktnUU5Vb3RETFk4djRUblNMSVRScnpR?=
 =?utf-8?B?bmgrMmp0VGVCVzlCbkhnN044SnZESEpyWlU5V2FTSmxNMEVpeUxOSHZkSzVs?=
 =?utf-8?B?eXFWekxuTlpodWQwbXM4TkRpaUpTZUhvWHp5T1FpT3AxUWdrdzBTVHo5Q01y?=
 =?utf-8?B?a2JlWG1Od1pTaTNmbjBVd2RyV1p1K1Y3WTNOdG9aWFRmZCtDOUVxVnIzUXV2?=
 =?utf-8?B?bGJTT1h1bDhYbmdUQnpxc1JwWUZXYXErNmFQR3pIclNTMEh2RXlFT3ozcDhS?=
 =?utf-8?B?T04zbU9ORTdTM2tWN3BQWUpNREU1UFN0Q08wMm1JRkRSTnN3dEp6L0crM1Y1?=
 =?utf-8?B?dG1ndHJSUmp2blc4OVpVZmZqZ084d0RYaFR4Y3lXRU5TVytLdmkwdHRpQ3BR?=
 =?utf-8?B?cEMxdkhkU2JFcUlHSWJaR3NyWGIvY1pBUnhGc0tqeGp6RWpZM055WlVJbHFD?=
 =?utf-8?B?dzMzTnh5WVVQaDNHcHh5TU5oczFQend0eFFFSkF0TVZiOUJnYlZDUlQ5SSti?=
 =?utf-8?B?VGpuaklleDZYSWZ1b01jakpCMXBkSlFzcUNXL0t6dHVPM0d4NVE4Qit1Mlkv?=
 =?utf-8?B?UDJndmlNVUVCVFJRVHVCOVZWK2FZc2FZR2N3eWw4dStkTjMyYTFiWGFudUgw?=
 =?utf-8?B?ekJrTkJvdlBhNG1VWHJwcy92YkNmOSs2cWVQalA4SFN2MHl4TFVKeGJxaHV0?=
 =?utf-8?B?NnJ2Y04yUDV1RkhHWHNjMWpSR0diMjZWMHJvb3R6KzhrNGJ1OTZnU1VGS2cr?=
 =?utf-8?B?cnJadzlZb1dJSUhJRXBMV2pzL3oyUDZ1c1ZZYldPSklwRzdmWXpyUERlVmlo?=
 =?utf-8?B?VjkxS1ZFa1REaUxXQXhia1QwWXVFZzErb0VHL3o3OWxOSEtvN2piMm4xUHB1?=
 =?utf-8?B?T09JMWY2ZzhRcW5ZU3hpZEN2UWRoRXlZam42ZUVoQXZWY3B2QUppeEdwUjQ4?=
 =?utf-8?B?MGhuMkMyRW1uRkNwVFJLd0oxWjZIMzNJTkI5NDFMMmt4M3BSaHV4c2J3OUZJ?=
 =?utf-8?B?cTNWOXo3b3pKOVZuaWVBanlTaDJWZTB3bm5DbmhzaUU1RW1jYUhQdHkyNjNh?=
 =?utf-8?Q?VdbeBwSj2WhELDKymrB475P/Nc++tFhB+TliUGl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb907852-5008-46b7-de90-08d98cad2b37
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:49:23.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOWQA0UCA55q6HESsk4V+POPm71uuGku9DK9oA/90TE9xHLHoiVxHJKXZL5/HbtyMs5jV0kmoR04J4U6SH2+iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 24.08.2021 12:50, Anthony PERARD wrote:
> $(public-y) contains "public/arch-%" but when used by
> $(PUBLIC_HEADERS) $(public-y) is filtered-out by the pattern
> "public/arch-%". So $(public-y) content is never used.

It has been this way from its very introduction, and iirc $(public-y) was
meant to be an abstract construct to which other pieces could get added
in principle. I'm having a slight preference to keeping things as they
are, unless you tell me that this is getting in the way of anything. And
to be clear there as well - if there are no other reasons than pure
cleanup, and if somebody else approved of the removal, I wouldn't object.

Jan

> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -39,9 +39,6 @@ cppflags-$(CONFIG_X86)    += -m32
>  
>  endif
>  
> -public-$(CONFIG_X86) := $(wildcard public/arch-x86/*.h public/arch-x86/*/*.h)
> -public-$(CONFIG_ARM) := $(wildcard public/arch-arm/*.h public/arch-arm/*/*.h)
> -
>  .PHONY: all
>  all: $(headers-y)
>  
> @@ -81,7 +78,7 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
>  
>  all: headers.chk headers99.chk headers++.chk
>  
> -PUBLIC_HEADERS := $(filter-out public/arch-% public/dom0_ops.h, $(wildcard public/*.h public/*/*.h) $(public-y))
> +PUBLIC_HEADERS := $(filter-out public/arch-% public/dom0_ops.h, $(wildcard public/*.h public/*/*.h))
>  
>  PUBLIC_C99_HEADERS := public/io/9pfs.h public/io/pvcalls.h
>  PUBLIC_ANSI_HEADERS := $(filter-out public/%ctl.h public/xsm/% public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
> 


