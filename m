Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B6926877F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 10:49:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkAb-00037L-ND; Mon, 14 Sep 2020 08:49:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHkAa-00037G-P8
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 08:49:04 +0000
X-Inumbo-ID: e86e36d2-771b-414a-9515-334add7a103a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e86e36d2-771b-414a-9515-334add7a103a;
 Mon, 14 Sep 2020 08:48:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69A64AFEB;
 Mon, 14 Sep 2020 08:49:08 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_tyshchenko@epam.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200911160622.19721-1-julien@xen.org>
 <20200911160622.19721-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <403f8774-1ca9-560d-2ca5-fa00b64d2a98@suse.com>
Date: Mon, 14 Sep 2020 10:48:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911160622.19721-3-julien@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.09.2020 18:06, Julien Grall wrote:
> --- a/xen/include/asm-x86/guest_atomics.h
> +++ b/xen/include/asm-x86/guest_atomics.h
> @@ -20,6 +20,7 @@
>      ((void)(d), test_and_change_bit(nr, p))
>  
>  #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
> +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))

While them sitting side by side there's perhaps little risk of
them going out of sync with one another, I still find it a
little odd to open-code guest_cmpxchg() instead of using it,
preferably even like

#define guest_cmpxchg64 guest_cmpxchg

(i.e. not using the function-like macro form). Unless of course
there's a particular reason you went this route. Preferably with
it adjusted this minor x86 part
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

