Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B17E1D17A0
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 16:31:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYsPq-0002xQ-9C; Wed, 13 May 2020 14:31:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYsPp-0002xL-1Q
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 14:31:21 +0000
X-Inumbo-ID: 687ea422-9526-11ea-a395-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 687ea422-9526-11ea-a395-12813bfff9fa;
 Wed, 13 May 2020 14:31:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49C11ADF8;
 Wed, 13 May 2020 14:31:20 +0000 (UTC)
Subject: Re: [PATCH] x86/guest: Fix assembler warnings with newer binutils
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200512162830.5912-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0edc48e1-5f09-573b-8958-94c3a95f2c33@suse.com>
Date: Wed, 13 May 2020 16:31:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512162830.5912-1-andrew.cooper3@citrix.com>
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

On 12.05.2020 18:28, Andrew Cooper wrote:
> --- a/xen/arch/x86/guest/xen/hypercall_page.S
> +++ b/xen/arch/x86/guest/xen/hypercall_page.S
> @@ -8,7 +8,6 @@
>  GLOBAL(hypercall_page)
>           /* Poisoned with `ret` for safety before hypercalls are set up. */
>          .fill PAGE_SIZE, 1, 0xc3
> -        .type hypercall_page, STT_OBJECT
>          .size hypercall_page, PAGE_SIZE

Looks like we don't need to sacrifice type setting here: Simply
moving .type ahead of .set in DECLARE_HYPERCALL() seems to also
help. To save a roundtrip, this alternative change
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

