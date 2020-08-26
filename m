Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7125319B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 16:41:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAwaz-0001Bc-94; Wed, 26 Aug 2020 14:40:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAwax-0001BV-4a
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 14:40:11 +0000
X-Inumbo-ID: 660feca2-9553-4ba5-981c-67f0ca886ed6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 660feca2-9553-4ba5-981c-67f0ca886ed6;
 Wed, 26 Aug 2020 14:40:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F39AAB7C8;
 Wed, 26 Aug 2020 14:40:40 +0000 (UTC)
Subject: Re: [PATCH] x86: use constant flags for section .init.rodata
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200826135159.20436-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <560d3f13-7a7d-351e-f929-befea41680ff@suse.com>
Date: Wed, 26 Aug 2020 16:40:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826135159.20436-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 26.08.2020 15:51, Roger Pau Monne wrote:
> LLVM 11 complains with:
> 
> <instantiation>:1:1: error: changed section flags for .init.rodata, expected: 0x2
> .pushsection .init.rodata
> ^
> <instantiation>:30:9: note: while in macro instantiation
>         entrypoint 0
>         ^
> entry.S:979:9: note: while in macro instantiation
>         .rept 256
>         ^
> 
> And:
> 
> entry.S:1015:9: error: changed section flags for .init.rodata, expected: 0x2
>         .section .init.rodata
>         ^

Another quirk, I would say. Has this been reported to them?

> Fix it by explicitly using the same flags and type in all the
> instances.

Indeed these look to be the only instances (in assembly files,
I didn't check asm()-s in C ones), with the slight exception
of the .fixup section specifications in x86_64/compat/entry.S
(where @progbits is omitted). Fair enough to establish
consistency here even without the specific issue above in mind.

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

