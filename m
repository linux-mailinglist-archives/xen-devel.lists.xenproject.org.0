Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A3428BA2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205753.361149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZszR-00036G-6f; Mon, 11 Oct 2021 10:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205753.361149; Mon, 11 Oct 2021 10:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZszR-00032i-2U; Mon, 11 Oct 2021 10:57:05 +0000
Received: by outflank-mailman (input) for mailman id 205753;
 Mon, 11 Oct 2021 10:57:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZszP-00031j-9r
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:57:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5d79684-2a81-11ec-80d3-12813bfff9fa;
 Mon, 11 Oct 2021 10:57:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-qHaUE0MVMGKDo-iZp6izJw-1; Mon, 11 Oct 2021 12:56:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 10:56:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 10:56:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0139.eurprd06.prod.outlook.com (2603:10a6:20b:467::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 10:56:56 +0000
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
X-Inumbo-ID: f5d79684-2a81-11ec-80d3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633949820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DB7jtOgJUj8fwbhyYndlSR4Uu8vNNru+gEh8/XSgjHg=;
	b=d/7Ki5qSFVPoddQnIbEVLNoeH/cZuwBnBXnFRx7aWH9Diok3QXQIh8mZ1kusUgAnQItF/C
	+ptz/J3Yws/EVBxT03RjVTacxuJ27KECZ92VWMe17CHfqG5r4QAV9N/vICGKK9sbqcHaaO
	NaF+ntGcozh+jl0+1jdoGGnmcG9sfog=
X-MC-Unique: qHaUE0MVMGKDo-iZp6izJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F38LaftQBE9/+UsBVmbeMbKXeYy3cKw5sNjmmfiea/Ps1pql+Tax+VcjmpsFCOR6xlC4pCsYhb0KV856h6WhqIkSS49SJ69QXv11ljj+I4uagkpB7xwyakbPutCkPrtAmQ4z1MU0RhppLMR+qmxt4noQnFfF4WeTTIbzp2sTplRLjE5HoIDQWpdXQJsqv0qPXfatUomCbdij0VJpIZaZNigFFA3w8HkQI+/BC91Pa9jP+mqN+zp/zI7K3kcwE54GmA4o9SNnAWBSEDARdC1qKGPwDLCkO9Ii0j6BuwiD2JngF04RHu87fbP6W8arpZV63u3qMmklfuqaqgru8e5OBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB7jtOgJUj8fwbhyYndlSR4Uu8vNNru+gEh8/XSgjHg=;
 b=VojSVT3TfPezxS9yWzrJz+7wwp0OyvCjWVi4KJI4VwUBfv2kt6plFPj0Gi4v1DsCtaL3/h0BxnyXpleFrhTsMxYLC8IL05kF0/iUFY2Gve6ZeaPnHyl+kfIKWi6WTf31nDkaZihYkkXhXkIkgmvJZhQR8yqNO1mWGXg4h6wXFCzWlyT/5tcj+yda/97vzYMF7EeoD3S7TRLZxWWzzRUF3Weaeb7d/0cWFvghijlLspBb56LqXQPEMe/agzvTAHZ2RyvuIyurX+AMnbRhOg1/cKGUF6o3uQ6L0fE440dff2zFhzs0svmqzgvtxZ4MBwCXyeqONxeUk+ekY0alHv66cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 20/51] build: avoid re-executing the main Makefile
 by introducing build.mk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-21-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87036d63-b5d4-55bf-0bb3-9b981a147f15@suse.com>
Date: Mon, 11 Oct 2021 12:56:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-21-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b650eecc-648f-4801-b09f-08d98ca5d7fb
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233508228FE7022618EA2D9CB3B59@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ljz2GSF2QhZntGp4K/9jBgdQvpbe0tABmupC2nyZv6/YIneBC91TQF3gwnIUJWzF5vTsk5fcZRfr5fwDdbS/vMrxTwIjIbOT/d0dfTmooXxjoA6SctT2MkbwsZtS1BKr4LX3CL3UNkMNjLtVRUVZArMbQOO2Abq9V9Lbk96913sm5vxEMZT63MkOuxeMDJSxfseyTSuyDjfgVsuSH7w37LvacdmIheIo3L+Zm9ZQGrX8Dg9Lham8yvElsyPM/2bEVnmOeqhdB8r2vcBscHkDIiUlStaVp0GpBThmWx5x3TFPadVjYHU0G79JfJwJlYH4AsnLDUmebrOY7t9DCP5ZzOvD1wgv57ZTuhv5WXvfT3qSew5ukuU1CoF/VFqVzHbspOxeLFql7ZijXhn84UpRijr3DyBbdtLsriYp8wBlVDeCFBNaBS56Afwhq9sGDVBmTmWtOMd0GePjrLa64zmx2+45kpnTEBq5bPdWF/tvVGUMUETNlvfYWODAEGgHSu7y8tD2BC6/WXcPBN1b70TbLH1Ms++wvj7KFHrRIW5kewfCjWddnvMtFAyx6wWREEET3Ub9f+DLX8Mv8zKqz98oIsZk7rktVGJSt7XGp2xpnKMojeQ4XKlRbit9vyop/bLOY3CKluVv4k3lbRzxE9KmHsyU4TPQALeBNNDI1w4saewU/cujmExX29t0Vysx+EmFPRi+O7AEYqB89SdVY9wnDGiKspewjLLMQJTiTOue8vABs2FZJpB3zhJXvMESrCVi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(956004)(2616005)(53546011)(83380400001)(86362001)(6486002)(54906003)(316002)(4326008)(5660300002)(38100700002)(66476007)(66556008)(31696002)(508600001)(8936002)(8676002)(6916009)(36756003)(26005)(31686004)(2906002)(186003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW1jQjdsLzJVR2llTHRFK3pPT0FCak5jbnhLem1yRnJ1bFp6WVNCREhRY2dk?=
 =?utf-8?B?SXdBVlhyem9Qa1NtUDBYQ2hZc3J4VHlGWkl6cmhZZjh2NG91c3JtdkJhcTQ3?=
 =?utf-8?B?ZXJtVW81RFljcmVMdE81UU10aFVud2FLeDZwMzBZemhVMjc0QkNHRlJIZGFV?=
 =?utf-8?B?ZFI1RzhSUS9jdXEyKy9ENlZUcGlrLzE4bERXNW1uMnlXRFUzTGZKT2RzZEtO?=
 =?utf-8?B?SFBaRVRRczVBcVJaVVF5VHZQN3BkZi95YkJvcGFPdHM3L0xxVDVMdmZHSVFq?=
 =?utf-8?B?ZDluZm9rTzJMTUZMajNCZUZ2c1drcVIzdks2cWVobkcwWUJ1d2d0R3JMaDlq?=
 =?utf-8?B?b1JyeHRxdkxMalFuQUlJTHdpRkdyL2hNazV5TU1RUWkzdlhDZGZZZEZUWVZB?=
 =?utf-8?B?RHdrazRjbXg0bm9Xa2IyRDc2TzFLUmYrS2Z6QnJjVmh2dWVqYzl6dWlaV1VR?=
 =?utf-8?B?ZlV2cFNKSUE1enhnYnVpeVFQcmcyVUtkdnU0aFBZT2lZSjBGWFJyWTlFVW50?=
 =?utf-8?B?a3ZwQ0M0QVd1YmlmeXE5VWo2MTNqUWR2L2V5S245Y0w4ZmplaG1zR1hxcWhF?=
 =?utf-8?B?WjV3bU5HNUtpNTkwVnpiT2Q3UjZtRlVSdTZIN0wvYWMwOUQ0WUdOVnBkZDZz?=
 =?utf-8?B?endoMENHOGpoQ0E3cFB3ZnpidnZUS3pNU3RvSU54cHlncWV1RXE5cUtGeU9h?=
 =?utf-8?B?enNuZFN1REpibDFuWXpxN2VXVFkwL25Kek9GR2ROSkRKVHRsMHNzM0w2SVhJ?=
 =?utf-8?B?dlhFZnJOVVF5M2t2U2t6eGF5TXY4dnJZaHFhc1ZkUTA1MTBvMzZaclA0S1Q3?=
 =?utf-8?B?ODdTcCtXaS9Dd1ZSOWxTdmhOQUc4QVFEMHJEOEFHMXQzYUUxSTlVeVhNMW93?=
 =?utf-8?B?SGdMVzd3ZWZSNWJLTndaV290OG9oL1M4NGFLcWdwc1FpYm55Q1FlVTV3OXdQ?=
 =?utf-8?B?NzNZNkJJNkpqRzVkWWN3V1hXWmFrWWdyRGIrMHV6M3ZOSENHQk5UcVlWZHhY?=
 =?utf-8?B?emhzeXpPaWRtQ0pFcG5JbUpSRThPZkE3MWFXR2ZUZ0ZtYnZOU0kySkFGRFJ0?=
 =?utf-8?B?bnFBODFTN05hN1g3clZNb3N6U1JleUtsNEVVWGdrcGxXeGgxc0tWUGJCc3BW?=
 =?utf-8?B?MjZtUGFLUklacU5meVdYekxPVGxxU0ExYUlNWEpmNmd3Sk16dm9xTzRoSXZK?=
 =?utf-8?B?VWkxYjlvSHNQbGs0bVowQVFhL0ZXd0NDUi9LYkU2WXEvMUFaRXl5UkF5MklJ?=
 =?utf-8?B?WFcxSGxTdHZFZGxxZUp4eExvNCtKU3U4SEM3VGtZRFFCYmVKNExBSTFrczlH?=
 =?utf-8?B?OU9EeXA2SW96bFIzSzZ0cTBoUHhhd3dCM0t0a0RERHd3R2w1Q1pvMGhFZWZZ?=
 =?utf-8?B?Z094OXVMTGlYSTVRTFZ1Z1hHYm9idkpHdmdKenVIc2t0NGdPQUtjcjhJa1NY?=
 =?utf-8?B?WU12bUxJWWVRYWdZenNGdDRlTEF4VHhkWHB5dXNSVjAyazVBM1ZrcC9DV2tT?=
 =?utf-8?B?MFZLbDQ4YXdGamp4ODNWbmpHakV6UjgvTnZlVXZLTXcyZjlBLzhOd0ZkLzlh?=
 =?utf-8?B?ZHBkbjJBRy9JMWpzamU4MjlYRkVtbjdsYnpLL0FESFFsbVNYYlArUEhicSs2?=
 =?utf-8?B?b3YzdWVYekhmOXRVSFZ5MHppUEY5YzZIL2JUR3dMRTc1STJ0VWFldlFKaG82?=
 =?utf-8?B?bEFVOFVvY2FQb0pPbVlJcFUzWWdlNFBoYkZ5bXBYQXBUa0U2M0JlT0RSK3Qw?=
 =?utf-8?Q?a2KEtrrl/fq3Zc/pMh8EB1o7uVJucKdDcmqqfdg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b650eecc-648f-4801-b09f-08d98ca5d7fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 10:56:57.1624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjZJyLqPHK5oZNOPBDF6fUR6yeS5kv1gteVIPAP3d02r4pROHtd+WGVW1YMqYMiJjud66gFEqMxM/75bEuHg8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 24.08.2021 12:50, Anthony PERARD wrote:
> Currently, the xen/Makefile is re-parsed several times: once to start
> the build process, and several more time with Rules.mk including it.
> This makes it difficult to reason with a Makefile used for several
> purpose, and it actually slow down the build process.

I'm struggling some with what you want to express here. What does
"to reason" refer to?

> So this patch introduce "build.mk" which Rules.mk will use when
> present instead of the "Makefile" of a directory. (Linux's Kbuild
> named that file "Kbuild".)
> 
> We have a few targets to move to "build.mk" identified by them been
> build via "make -f Rules.mk" without changing directory.
> 
> As for the main targets like "build", we can have them depends on
> there underscore-prefix targets like "_build" without having to use
> "Rules.mk" while still retaining the check for unsupported
> architecture. (Those main rules are changed to be single-colon as
> there should only be a single recipe for them.)
> 
> With nearly everything needed to move to "build.mk" moved, there is a
> single dependency left from "Rules.mk": $(TARGET), which is moved to
> the main Makefile.

I'm having trouble identifying what this describes. Searching for
$(TARGET) in the patch doesn't yield any obvious match. Thinking
about it, do you perhaps mean the setting of that variable? Is
moving that guaranteed to not leave the variable undefined? Or in
other words is there no scenario at all where xen/Makefile might
get bypassed? (Aiui building an individual .o, .i, or .s would
continue to be fine, but it feels like something along these lines
might get broken.)

> @@ -279,11 +281,13 @@ export CFLAGS_UBSAN
>  
>  endif # need-config
>  
> -.PHONY: build install uninstall clean distclean MAP
> -build install uninstall debug clean distclean MAP::
> +main-targets := build install uninstall clean distclean MAP
> +.PHONY: $(main-targets)
>  ifneq ($(XEN_TARGET_ARCH),x86_32)
> -	$(MAKE) -f Rules.mk _$@
> +$(main-targets): %: _%
> +	@:

Isn't the conventional way to express "no commands" via

$(main-targets): %: _% ;

?

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -9,8 +9,6 @@ include $(XEN_ROOT)/Config.mk
>  include $(BASEDIR)/scripts/Kbuild.include
>  
>  
> -TARGET := $(BASEDIR)/xen
> -
>  # Note that link order matters!

Could I talk you into removing yet another blank line at this occasion?

> @@ -36,7 +34,9 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>                                              rodata.cst$(a)) \
>                           $(foreach r,rel rel.ro,data.$(r).local)
>  
> -include Makefile
> +# The filename build.mk has precedence over Makefile
> +mk-dir := .

What's the goal of this variable? All I can spot for now it that ...

> +include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)

... this is harder to read than

include $(if $(wildcard ./build.mk),./build.mk,./Makefile)

which could be further simplified to

include $(if $(wildcard build.mk),build.mk,Makefile)

and then maybe altered to

include $(firstword $(wildcard build.mk) Makefile)

> --- /dev/null
> +++ b/xen/build.mk
> @@ -0,0 +1,58 @@
> +quiet_cmd_banner = BANNER  $@
> +define cmd_banner
> +    if which figlet >/dev/null 2>&1 ; then \
> +	echo " Xen $(XEN_FULLVERSION)" | figlet -f $< > $@.tmp; \
> +    else \
> +	echo " Xen $(XEN_FULLVERSION)" > $@.tmp; \
> +    fi; \
> +    mv -f $@.tmp $@
> +endef
> +
> +.banner: tools/xen.flf FORCE
> +	$(call if_changed,banner)
> +targets += .banner

To make the end of the rule more easily recognizable, may I ask that
you either insert a blank line after the rule or that you move the +=
up immediately ahead of the construct?

Jan


