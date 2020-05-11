Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D71CD31F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 09:43:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY35w-0005TL-IE; Mon, 11 May 2020 07:43:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY35w-0005TF-3i
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 07:43:24 +0000
X-Inumbo-ID: 175bc38a-935b-11ea-a1f4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 175bc38a-935b-11ea-a1f4-12813bfff9fa;
 Mon, 11 May 2020 07:43:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6B08EAC5B;
 Mon, 11 May 2020 07:43:25 +0000 (UTC)
Subject: Re: [PATCH] x86/gen-cpuid: Distinguish default vs max in feature
 annotations
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200508152729.14295-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6380a05-d67a-b3a8-a624-ba5c161a8c53@suse.com>
Date: Mon, 11 May 2020 09:43:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508152729.14295-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 17:27, Andrew Cooper wrote:
> @@ -133,9 +134,13 @@ def crunch_numbers(state):
>      state.hvm_shadow_def = state.pv_def | state.raw['S']
>      state.hvm_hap_def = state.hvm_shadow_def | state.raw['H']
>  
> +    # TODO: Ignore def/max split until the toolstack migration logic is fixed
>      state.pv_max = state.pv_def
>      state.hvm_shadow_max = state.hvm_shadow_def
>      state.hvm_hap_max = state.hvm_hap_def
> +    # state.pv_max = state.raw['A'] | state.raw['a']
> +    # state.hvm_shadow_max = state.pv_max | state.raw['S'] | state.raw['s']
> +    # state.hvm_hap_max = state.hvm_shadow_max | state.raw['H'] | state.raw['h']

While in comment form it doesn't matter yet, for actually enabling
this it would seem to me to be more expressive as

    state.pv_max = state.pv_def | state.raw['a']
    state.hvm_shadow_max = state.hvm_shadow_def | state.pv_max | state.raw['s']
    state.hvm_hap_max = state.hvm_hap_def | state.hvm_shadow_max | state.raw['h']

Thoughts?

Jan

