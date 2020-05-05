Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D31C575B
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 15:48:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVxvI-0007Ka-5c; Tue, 05 May 2020 13:47:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVxvH-0007KV-94
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 13:47:47 +0000
X-Inumbo-ID: 0026d37c-8ed7-11ea-9dbf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0026d37c-8ed7-11ea-9dbf-12813bfff9fa;
 Tue, 05 May 2020 13:47:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E47E7ABB2;
 Tue,  5 May 2020 13:47:47 +0000 (UTC)
Subject: Re: [PATCH 1/3] x86/mm: do not attempt to convert _PAGE_GNTTAB to a
 boolean
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20332b18-960c-a180-8150-55fae60bdc6e@suse.com>
Date: Tue, 5 May 2020 15:47:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505092454.9161-2-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.2020 11:24, Roger Pau Monne wrote:
> Clang 10 complains with:
> 
> mm.c:1239:10: error: converting the result of '<<' to a boolean always evaluates to true
>       [-Werror,-Wtautological-constant-compare]
>     if ( _PAGE_GNTTAB && (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
>          ^
> xen/include/asm/x86_64/page.h:161:25: note: expanded from macro '_PAGE_GNTTAB'
> #define _PAGE_GNTTAB (1U<<22)
>                         ^

This is a rather odd warning. Do they also warn for "if ( 0 )"
or "do { } while ( 0 )", as we use in various places? There's
no difference to me between a plain number and a constant
composed via an expression.

> Remove the conversion of _PAGE_GNTTAB to a boolean, since the and
> operation performed afterwards will already return false if the value
> of the macro is 0.

I'm sorry, but no. The expression was put there on purpose by
0932210ac095 ("x86: Address "Bitwise-and with zero
CONSTANT_EXPRESSION_RESULT" Coverity issues"), and the
description there is clearly telling us that this wants to stay
unless Coverity changed in the meantime. Otherwise I'm afraid
a more elaborate solution will be needed to please both. Or a
more simplistic one, like using "#if _PAGE_GNTTAB" around the
construct.

Jan

