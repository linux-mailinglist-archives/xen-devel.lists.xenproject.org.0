Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677042D513
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 10:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209072.365411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maw9v-0006yx-GM; Thu, 14 Oct 2021 08:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209072.365411; Thu, 14 Oct 2021 08:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maw9v-0006wM-CC; Thu, 14 Oct 2021 08:32:15 +0000
Received: by outflank-mailman (input) for mailman id 209072;
 Thu, 14 Oct 2021 08:32:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maw9t-0006wG-Hn
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 08:32:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39985ca2-2cc9-11ec-81b5-12813bfff9fa;
 Thu, 14 Oct 2021 08:32:11 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-VFDt4exlNDuEJrMwTN_zeQ-1; Thu, 14 Oct 2021 10:32:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Thu, 14 Oct
 2021 08:32:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 08:32:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:20b:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 08:32:07 +0000
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
X-Inumbo-ID: 39985ca2-2cc9-11ec-81b5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634200330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z43p2Ltsw1hT3c2nivnepNJi1ZV1Za1fMWgGQFYRb9s=;
	b=Ved+S5Vkp5F42LhlZmJYaNw3NhlR6ABemnD43Sp9QwwfX9dWxpyhjUU9C7xrs94mY46ggz
	uTCbzYJY7Ga3We7ZZkB4Ijnt7f1J+d16UX7fEDMFMrf0BmmmlkqxvgNK2cugrEIF+E4wZ7
	13Lzv+gcLeABMYP7ZHRVd2NkFbTi85k=
X-MC-Unique: VFDt4exlNDuEJrMwTN_zeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnSKOQGM7EmfQjHGw8jPCnuKGGXB/cfFHGtJJEi1jpH+ux3yP+ZHFOpxoIvRyhiCIdcZ6nC39SHDW+M9GYpSRyBW72/+njvvOdj6YbnYnJwYe/c6xWEYJELfUSRTHVdVZMc59LYrunCLCcx/+9lYdciezQvW2Bmz+fqHwlx50thoxAo45bg7NgXOKR/aPcaGHBnoChQEIeE4YjDQn9QGukKSeVeKYlpNNx5Tw5nkPEQNCQkERW6Vuc6bkrpoXHflotARmVGPu0pSS0ihIwFinC7Wu+y+z8wc7MwaAKUXLxEZQQWkxxxRgh+4EXab+596GpIgDvWi2BIyjQdspwGv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z43p2Ltsw1hT3c2nivnepNJi1ZV1Za1fMWgGQFYRb9s=;
 b=MgxXAtQnRpALbHjqQKHt5RlId0+ql+VJWmg3/TYwAZqPD4cocyFMiLyUcEhVtrycOy+P+/yAgRmzLS/VXBWb+1Ro+RsdmT8sxKsuYGgJzxZegA0SsiGpIKlQfqw6rAAhAI+7Co781cpPtK3NF/SV6btmTM5MWn55sgAAHfA5nJtJMyfZy6itGKwH8mSkij83F1S1NVQqiPitKhbaVSRtUWFdwltMI51sU14pPKy5vTwK7/K4I9afHJYW02Mc66a4q6kbKVMyc9zdP1iDAUsKz0+oMMhp0g/e4xOrHpp8vChRu51byJw3t4cFH4IUURPs+YaAiEuxmjA9CGKfzHIkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 41/51] build,x86: remove the need for build32.mk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-42-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c99f2bc5-b1dc-7647-4199-a6a731730967@suse.com>
Date: Thu, 14 Oct 2021 10:32:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-42-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6d2244f-4a45-4116-c346-08d98eed1bf4
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63019D88BA681484EFAD36D0B3B89@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ylwFPJj/dDt7mzNFbY/XTH7uJAcZYDo6laLaFrvrv9boVKJLEojr+7zQZ74yykR/zAOmKm9wbya2BD1+BUWT4wnKqoq66ay25kO+/XuzXGQ/d41TywYn+FZEipKCZtc2oqK+lg6KH06lRyvnJwA9Jqdv6t00Bqd9IjYprqKyRlcASZdhQDbRDCLYKK5LXbL9xJf5G9pb+VubOG6E6+DY1Df+T17ZDeLDjsKwV0Y6DnWh77Kdw3lgdJuK0zBpT/lp2O2KYu40wVOM1G/rAQNgJwAa/Tdx4x+lnsnXxZBNhR5lrSQefBs3XU0xilm9szz5BWfgt+Kz9b1owA/rx32TZxrwfMMIp2FMGm8OBs73jiyg6XmMonX5hlUCbCSwWLWRqNtvdhEKe44vIuL54Rqf4azHkIAyRvH7nfNz6yvxGI4G3PCecGqaYT/83UJDUHQO3fAC3mHzXnfvzwN8rOE+Ok/mm0mOas1FRr81OyTWqnG2P2aLPJX5nirDymHUSTeojPzj1yoAMd/UcgjHDhFF3Oom5ROtFozTG3J9wLJnnDjyUbx0DA35ttUZU+NlBv3X/raQxgWqT1codxO2yhapbyImkvNJIdGHfxxaapeiQs2MZBs1fvhahgNstIpcpVTpk43eN6IYDjgmnSsDmYQCjXrm7PwQ4S1fDiGhnr1UQPNJPr54Cj7zrWlZ/ACwyfmnfQvxIURDfp0f2FSgLMyeAneeAidS+V543w9SXwMzAIJhg54uU/VnpbhHw9KTtwY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(4326008)(956004)(186003)(31696002)(2906002)(54906003)(86362001)(36756003)(38100700002)(508600001)(31686004)(16576012)(316002)(66946007)(66476007)(6916009)(8676002)(66556008)(26005)(53546011)(2616005)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3o0Tjd4b0RQaCtkbzZENG9pWCtHNno1ejZVam5SQW9VOWhMN1BLTWgydDNt?=
 =?utf-8?B?enJsQjNweEt4N1gramRoTmRtK2w0UTd3cGl5Y2NEK1VIaWdoaURaeTN6aXVG?=
 =?utf-8?B?TjVpai9BcFc2MC9yLytpRXBiYkhGWkRyZmNUOWRwOStRVng4ZlBHWmhqTEx3?=
 =?utf-8?B?aEk3VzQ0RmpuZVRpbkd1a3RVL1RoQVlacGxGcVpCMHlQWVFNT25RWG1YdUxj?=
 =?utf-8?B?ak5OUEs4U0p2TEFjek5Wc0dva3IzZ3dYK25sWUxiZ0UwYWg4YlQ3alhZUGxy?=
 =?utf-8?B?cXk4aEVFSlRwQnFPNXJ2MUZJMVlCdlNBWVBhOU0xOXBYWWZJMy9Oam9hWVJ2?=
 =?utf-8?B?MXc2a3hnQWFReTM2N1liZjZCbVZjS21XcEpSQ3B3c1VzcjdWRGZnSVVvV2hi?=
 =?utf-8?B?WjZmbzM5TitrVEhlNTl2Mkx0MVVRdXN3NVBybmJ5YWdqcHB3YmhHd01HUm1r?=
 =?utf-8?B?T1diVWlGZld5MU5kLzNvL1JRNURNam04dkJCUVg3d3dHTyt6cSszekU3REZ6?=
 =?utf-8?B?SkN2T3Z0Q1NOUjVkb1FVYjBCc2FhZWMvUTNmYWZrelI2Z3lJMm1RRG1QZUFn?=
 =?utf-8?B?SUJLVFhHeEQ1WHc1cTI3MFpVYWErUXpzTVVOTXo4TkJFa2czb1h4NFRGUUJB?=
 =?utf-8?B?ODhIVnNmZ3hyVThab3dyNWlvNXQ1cER1WWJGZ3NLcHhsWEtVdkZQL210TVhZ?=
 =?utf-8?B?Z2NoeU1FRXhPT2ZpMnh0ZHgySmdObG1HekZkTC8zOHdGam9JVHIrSnFmck1T?=
 =?utf-8?B?RzBlbE5qNStvWFgwRnQvTzhQV1JucDg0c25GSXBEcGtLOUZyN3VEUnd2eGlS?=
 =?utf-8?B?T1ZYRU51alQ2TE5ibDF5ZTVtZ0p2VnRkRzVMSkE2ZVp6M1dqYW5wcXptcXN4?=
 =?utf-8?B?MlBsbFdzRGZ2dmZvb2FlYUFUU3JNdDVjK0FyOW9JdXNwUDd4MndSK01yejYv?=
 =?utf-8?B?Z2xFWDhRM0RVQkhsQUZveWlIdHAySVQyRzlZMTloaVNkWDNjRXd3QzZ1NVh3?=
 =?utf-8?B?VUg0aGdmRDA3cmo2c2tNeW91Y3BFcFd4WjUxUEZjZFZVZUEvYTZVdlFNMVRw?=
 =?utf-8?B?RGU2bS9Wamc1c0JpWGFMUGpwdWF6UUxFM2hEbXVVbzZ6cFdyUW9OamdjQjh1?=
 =?utf-8?B?eGlFREZYNEFlZi8xeklGN215Ris1Mm0zQ1A0bWgvQ0orSTRMam01ekUydno5?=
 =?utf-8?B?cnRSMEJmc2Z0SWp4T0F4VzY2N2x1UkswQk1HSGxLNERNS1VadnBBaThaK2Rw?=
 =?utf-8?B?bEk5MlExWURtb2QrRmEvSVlpMTI2Znk2bWVMNGFycHRzOWFPeHJqclVLSUJ2?=
 =?utf-8?B?QWcrV29jcm9TWElmMnRXTVRWWkRBNFBNNzh0SnNaV01CZkxqZ3pxb3ljT0pD?=
 =?utf-8?B?S24yT29MMHFUdDN1ZStqbVB4b1FmUDVFN3dGTXdTL05FUGZ2WU5KQTFBQUlM?=
 =?utf-8?B?eFJSa0p3NUxiV0VOTENQY3lTODRFejdtZXNuZTA2SCtxb1FjOUlVN2tkeWdn?=
 =?utf-8?B?WHF0eUVrMkpGQnNxckNjaUJNSFRIQ1EwZmsvNFhnVCtnMEJwbmVmejB2RFJ5?=
 =?utf-8?B?SG5HU2pKOVUvbjArUTJCWnFPMjgreTVxdnBacm5wbllLVjZXaFNpaUxDcE10?=
 =?utf-8?B?aS9BeVQ3dHJLQWwvWlR5clcxaklOeGE0MnNudU1oREt5Uk91emVScmd4bStI?=
 =?utf-8?B?dndmYlNsaTFMc054NU9panVGYmUwdWNMbTRDaDhSYWRxUm1xNjNqblkyVHNW?=
 =?utf-8?Q?imx5MmwW8m3Nc6FHv74OpQjwhDVaPEc9rt4V/QK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d2244f-4a45-4116-c346-08d98eed1bf4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 08:32:07.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9AMAi5WqOIUd83Gd46pvGdVR6Mv+AcaRuf41Tux1mfccLMGuBGKQ7zNZZYZI75W/QqjjmeXNs+++3yNxEfxYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 24.08.2021 12:50, Anthony PERARD wrote:
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,23 +1,51 @@
>  obj-bin-y += head.o
> +head-objs := cmdline.S reloc.S
>  
> -DEFS_H_DEPS = $(BASEDIR)/$(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
> +nocov-y += $(head-objs:.S=.o)
> +noubsan-y += $(head-objs:.S=.o)
> +targets += $(head-objs:.S=.o)

This working right depends on targets initially getting set with := ,
because of ...

> -CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h \
> -	       $(BASEDIR)/include/xen/kconfig.h \
> -	       $(BASEDIR)/include/generated/autoconf.h
> +head-objs := $(addprefix $(obj)/, $(head-objs))

... this subsequent adjustment to the variable. Might it be more future
proof for start with

head-srcs := cmdline.S reloc.S

and then derive head-objs only here?

> -RELOC_DEPS = $(DEFS_H_DEPS) \
> -	     $(BASEDIR)/include/generated/autoconf.h \
> -	     $(BASEDIR)/include/xen/kconfig.h \
> -	     $(BASEDIR)/include/xen/multiboot.h \
> -	     $(BASEDIR)/include/xen/multiboot2.h \
> -	     $(BASEDIR)/include/xen/const.h \
> -	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
> +$(obj)/head.o: $(head-objs)
>  
> -$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
> +LDFLAGS_DIRECT_OpenBSD = _obsd
> +LDFLAGS_DIRECT_FreeBSD = _fbsd

This is somewhat ugly - it means needing to change things in two places
when config/x86_32.mk would change (e.g. to add another build OS). How
about ...

> +$(head-objs:.S=.lnk): LDFLAGS_DIRECT := -melf_i386$(LDFLAGS_DIRECT_$(XEN_OS))

... instead:

$(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst x86_64,i386,$(LDFLAGS_DIRECT))

? Or if deemed still too broad

$(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst elf_x86_64,elf_i386,$(LDFLAGS_DIRECT))

?

> -$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
> -	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
> +CFLAGS_x86_32 := -m32 -march=i686
> +CFLAGS_x86_32 += -fno-strict-aliasing
> +CFLAGS_x86_32 += -std=gnu99
> +CFLAGS_x86_32 += -Wall -Wstrict-prototypes
> +$(call cc-option-add,CFLAGS_x86_32,CC,-Wdeclaration-after-statement)
> +$(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-but-set-variable)
> +$(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-local-typedefs)
> +$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
> +CFLAGS_x86_32 += -I$(srctree)/include

I'm afraid I'm not convinced that having to keep this in sync with the
original is in fair balance with the removal of build32.mk.

Jan


