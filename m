Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F117A429420
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 18:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206303.361844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxnM-0001yj-Oj; Mon, 11 Oct 2021 16:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206303.361844; Mon, 11 Oct 2021 16:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxnM-0001wz-KT; Mon, 11 Oct 2021 16:04:56 +0000
Received: by outflank-mailman (input) for mailman id 206303;
 Mon, 11 Oct 2021 16:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxnL-0001wp-KS
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 16:04:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8417b3a-2aac-11ec-80e9-12813bfff9fa;
 Mon, 11 Oct 2021 16:04:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-cq54twrfOi2qzkfDcZsd4A-1; Mon, 11 Oct 2021 18:04:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 16:04:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 16:04:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0060.eurprd02.prod.outlook.com (2603:10a6:20b:3a::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Mon, 11 Oct 2021 16:04:50 +0000
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
X-Inumbo-ID: f8417b3a-2aac-11ec-80e9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633968292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PXozTFInzsIz15RU/C/L0HiOFmqLlUCFDy+c36U7X0=;
	b=fHbqhudgKequ+Kt52VOETxjoGpJiU++pbrW6ZaByUT5KsPIX2lh0QmS/6udA3D6NtEQRU1
	7wfm7yt68BzqjAXKR6735yPULD5dXDsR4jud24DAJBaQ+sf7T527eGYF5fJWaVJNAOdGAe
	g/rVvM12rmWNXjh889Quo//v5YUHL1Y=
X-MC-Unique: cq54twrfOi2qzkfDcZsd4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpUcyrI/qVOTx9++GQpw3fFzgq9F/W+JE/0fD4KzbVPfh4mSXf0x+lWbCX8ZQZRZRe8smcQadvlx+mEgY7BxYRHv0xK67YQZyAoZ5DtU5aZv5Glkx4m1LB6emk24h+7BXyfNOHhnDj5y1xD+GmYPm9Tjrfryz3IMHNbochR9Luvkz/VTGKPYGEmdaIzd2+3i4ei6XF6RmTkrEP2BjL8D628aVEHMIDrI3/mOtHXzXp3A/tGIFPbd44gWGBiBI5Jw8M1BtyYqtocRpqh9l1dzFbAPqiCeSm0jAnxclqnVS2ky+36J61UswVyStRr+KV95Hdj4ILF6Ek/iHnjqVuxrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PXozTFInzsIz15RU/C/L0HiOFmqLlUCFDy+c36U7X0=;
 b=ju2uEE9sGKARG2wuU/2MsqwxyvZHV+EiAYGNSCOMI8AZjzwRiUwKugYEYELW3HlT2rvphHeJKFxaAQOX1oNwZ8BINK6u7nHa8AvkjTJ4qwuZW5MF2ufhkZfe57fBuLns6jUaVxZd+IvpTIZ5Wt79CW8i2ZCzHUgKxdTWq/jC6/nMO+86593XoS9MI3npF0HLTSevFjgtiJoJKXedDCTNqAXcF425EDRq3h8mGdSpoiuEw8uvvcIcRj8nwMjdqXG3SUk5dXpAxy91jSrdrdLA2hNgzA+tE1kXYj2YwdWHpNqhdYjYI6Js2oDojEhkPx66R63BahUrIQcy+9oqWrTwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 39/51] build: rework coverage and ubsan CFLAGS
 handling
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-40-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce84dfbb-aab2-2ca1-3521-22b640c99233@suse.com>
Date: Mon, 11 Oct 2021 18:04:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-40-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0060.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64c3d82c-94cd-4c87-dfbb-08d98cd0db26
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480C52AF7F2299F163B2985B3B59@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jHNnsCfsvhf+TWi3miKl59G9WlRSGKYaN0W5oGTaUey+fGx++6NpmKWgTKqrkp+s7nxIrAQDs2il+I5kJj7mXYPKQkdwbeyRaI6tAySb0tZ9QdIK8BGl+joqXKEvn0i27xYPEB0XbHFBRXdz0qT0x/sJ+T5ZKJ2zBjLw6pKIxn0o1dBS0Kk34fI0rODTKwWZ6IAByiic4/Kf3mJc5tLI1Yp3sYtCadzxb+j74+YiR1kiaE5LhsmdPk2WAPiqJl/10cZcbgR8vyLJedBnhmsf2MUJ700Z/5lvfwLOGibSCurQvECXIr+KGUk38vIJ8KlSvkjdb5LvyXp4/cvsLmSI4pnKgL4U8ZuYv0pPDi1qkcENag/Pz9qgmIraZtTktyyMiYRa4tUrHg4FGJmgEibV46qHHYEWfKwyFyPpS6d0kgHE5wAfUyjjbQj8vblcPVOvmL/qXFcveymgeHFF+Zd4qvypc1lceI/QlLiw3D1Fq/DpNILIUW/mVWyEA/WWku7PytYObLpAg3YfOkT6g/XAS6abEQi3CqVOBnfNo674artfZkmZawLPQOryLAFPI4204rwH7YtIOsXoOeg69D+eCqbTOHiY7S21VuHa8KTNmUFCnD/1X/DYbYVCH7gl/Gm3geX1c3KQyhWV4Y32YiBSN6t23MNSYWD6T86wyx6c3brnRLP9uAtyxp4byZXobYjNeSaI6ki6DhXLB/ahvjKHhlYqNXmeTidueitTBQr055c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(86362001)(31696002)(4326008)(54906003)(66476007)(66556008)(31686004)(66946007)(16576012)(316002)(2616005)(5660300002)(508600001)(6486002)(186003)(2906002)(53546011)(6916009)(36756003)(26005)(83380400001)(38100700002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkN4T1plbmFIK0l3TzQzVzhxQkZHSkpGUXBuWVJ3UnV3YnhJb0FBNjA0UXVm?=
 =?utf-8?B?RE5oWUhtclJiSkVWdm5zVFJsTXNzdmZzRE9FRFhCYXY4WkwzMGgzNEovSnhK?=
 =?utf-8?B?M3E5NE91U1pObThFQmdRNmlrZXRHQXFOREdscElBRXE3UWNQS3RiOXJXWEc4?=
 =?utf-8?B?WVRBQUVvMThIeXdRY0poRThsZ3QyeFhiQjgzNStLRE5YOU4waUhqcXpCNndG?=
 =?utf-8?B?Z25kSFVQZ3B0S2hzU2xVMjg3MVhUbTR2SFQrYVFhWmlPWUdoSEF4RDZzSXdx?=
 =?utf-8?B?djVwODJPeS9ZdFMwMVFxK05NU203TzNoR2xrVVErRUZpSFZ5YjRjblVJK1FB?=
 =?utf-8?B?L21kLzVVMGxNZ2tRZUFsQm1tRjU5VkNXdE9TN2h5L1ZKUU81aEYzNU9JQXZw?=
 =?utf-8?B?b0s4R2ZrSHRXWG96VGk4MG1kQjhPWlVHeHVLKzRyS2plM1JVMkFGUm1uTEdU?=
 =?utf-8?B?SHRURnAyVzljT29iYitURFBZaU9LK21BVWh3c3diQU9CMlBtbVZEbm1aYmIy?=
 =?utf-8?B?TytBdWFuODZsOVJKaml5UlQ2bk5vdXFWNkdrek5KZnlEMG8rQkZINWZDWlNu?=
 =?utf-8?B?MTMxM0hZOXA2UXVpTllRVEE2TXZ1bndUdnA3aU1SNEVUby9lY0hsYTd4djdE?=
 =?utf-8?B?Z01JZWVlUm9RcHNGclhFSUFFY2kwUnFIekxES3ZGelNWNEErbVIzS01VOGs5?=
 =?utf-8?B?QkZhS3hBa3RZamRYNnVwZHIyNlZmZkFVOVVHRXdwUnJLWW9Rd29nZkxSTUFk?=
 =?utf-8?B?aXE5b3QzV0Jtd09XSWNJcFdNcW9GSjVScm5kdkdSYmZNempNVVVuR3FTZUxT?=
 =?utf-8?B?d1BlQkpVR2pLTS9YYWlJbG9iQUcxSC9wanYzaTBFdkowVnpFYWQvdGxub2g5?=
 =?utf-8?B?RUFuT3Fsa25iK01mSjcrOFVQVDZEYWk2YVB3VmNtNzR2QnFKcEd6YlczTXB5?=
 =?utf-8?B?YjdQRmRzbklkVGlZT1NNak1GRkU3RHVzeTBTMWhUQ2ovTE1uMCtrZXVOTmI1?=
 =?utf-8?B?N3l3bUNiZ3ZoTm1CQUU5VE9xWWVnUzZwY0czaWRZdjF5RXMyakp4aWw4Wmhr?=
 =?utf-8?B?cndVN1ZJM0JPOVBlR2hCZk9WSnl4YStJcitnbi9neWN4VG5lcTlvdnZpT0h6?=
 =?utf-8?B?TXBSaWVKQTFEU3pYc0JRNXBlU2pVOXVoVjdwYXZpSDVKdVVmeXJMTlVteW1E?=
 =?utf-8?B?Qkszc29oV0pDeDBPTkRSRUtnTVF2NFhDR2JkK1pUMmFNUmYvZlJUNjFNZEpk?=
 =?utf-8?B?cVRZYmVOaWluUVc2T3RyZmRsWUFuWDFYdjFidDNjQlNJM2RBVVRhS2VVd01m?=
 =?utf-8?B?RHNBeFdXbFdwMFBnYk83NlIvOWlSM2pZSThKdFE4MFQrSllGSlU1cEZXRnZU?=
 =?utf-8?B?ZGZnN01qU2tYOVUzVlZFVmd5L1ArZjQ3U3lQbGdsMWowMTZiZXgyVkR6VE9l?=
 =?utf-8?B?bjFYSGhjcEh5dlRWQ1FYUDErWGp2V2tOak5pY2E0OEJlNThCRlduT1EzL28y?=
 =?utf-8?B?VDZpenByd016T1VQTDRPTkljY3RGbVJmdGN1WVJRWkFaOHhIcnNTZThzUE9E?=
 =?utf-8?B?Wm9rVi9SMkhKR2pyUmlGbTF3Y2lyQTVON293Sk5Xc2tGY1pab3AwK3ZJZmFC?=
 =?utf-8?B?K3owV21sMWJPWXl6WmtGVnYrT1MvVU1QWTJaWW50S29uZFBUT2diaUJmYmpp?=
 =?utf-8?B?Tk9za0pDMkRlQ3BYcnVzeERraUpOOUFGTjMvSkloTHJRdkUvMmhCT3hQNzhk?=
 =?utf-8?Q?blsu6saMttDbSSUfFxCcyA8H3Jc22jKcf7CZhkN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c3d82c-94cd-4c87-dfbb-08d98cd0db26
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 16:04:50.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ci0R+SzYxBWhXN0gLbH6nCYXrtmE+6BMOpg7G/4VCOohIdhtd9fm//UVplu/CcLThiF1PQP6olyWGWn01e4kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 24.08.2021 12:50, Anthony PERARD wrote:
> When assigning a value a target-specific variable, that also affect
> prerequisite of the target. This is mostly fine, but there is one case
> where we will not want the COV_FLAGS added to the CFLAGS.
> 
> In arch/x86/boot, we have "head.o" with "cmdline.S" as prerequisite
> and ultimately "cmdline.o", we don't want COV_FLAGS to that last one.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I think I understand what's going on, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>

It would seem to me though that ...

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -131,19 +131,31 @@ targets += $(targets-for-builtin)
>  
>  $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>  
> +non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
> +
>  ifeq ($(CONFIG_COVERAGE),y)
>  ifeq ($(CONFIG_CC_IS_CLANG),y)
>      COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
>  else
>      COV_FLAGS := -fprofile-arcs -ftest-coverage
>  endif
> -$(filter-out %.init.o $(nocov-y),$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += $(COV_FLAGS)
> +
> +$(non-init-objects): _c_flags += $(COV_FLAGS)
> +
> +# Reset COV_FLAGS in cases where an objects as another one as prerequisite
> +$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
> +    COV_FLAGS :=

... pulling this and ...

>  endif
>  
>  ifeq ($(CONFIG_UBSAN),y)
>  # Any -fno-sanitize= options need to come after any -fsanitize= options
> -$(filter-out %.init.o $(noubsan-y),$(obj-y) $(obj-bin-y) $(extra-y)): \
> -CFLAGS-y += $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
> +UBSAN_FLAGS := $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
> +
> +$(non-init-objects): _c_flags += $(UBSAN_FLAGS)
> +
> +# Reset UBSAN_FLAGS in cases where an objects as another one as prerequisite
> +$(noubsan-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
> +    UBSAN_FLAGS :=

... this up ahead of their respective _c_flags assignments would be
easier to follow, for being more logical (produce, then consume).

Also, as a nit: In the comments do you mean "... where an object has ..."?

Jan


