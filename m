Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659BA1EDDDD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 09:17:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgk7j-00066O-Vo; Thu, 04 Jun 2020 07:17:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgk7i-00066J-9W
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 07:17:10 +0000
X-Inumbo-ID: 66cda650-a633-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66cda650-a633-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 07:17:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9A2ACAC6C;
 Thu,  4 Jun 2020 07:17:11 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
Message-ID: <ec938432-d1b4-046d-9c37-06512bab82fa@suse.com>
Date: Thu, 4 Jun 2020 09:17:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.06.2020 09:08, Jan Beulich wrote:
> On 04.06.2020 03:46, Marek Marczykowski-Górecki wrote:
>> Then, we get the main issue:
>>
>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
>>     (XEN) domain_crash called from io.c:178
>>
>> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor its stubdom
>> yet. But XEN_DMOP_remote_shutdown for domain 3 was called already.
> 
> I'd guess an issue with the shutdown deferral logic. Did you / can
> you check whether XEN_DMOP_remote_shutdown managed to pause all
> CPUs (I assume it didn't, since once they're paused there shouldn't
> be any I/O there anymore, and hence no I/O emulation)?
> 
> Another question though: In 4.13 the log message next to the
> domain_crash() I assume you're hitting is "Weird HVM ioemulation
> status", not "Weird PIO status", and the debugging patch you
> referenced doesn't have any change there. Andrew's recent
> change to master, otoh, doesn't use the word "weird" anymore. I
> can therefore only guess that the value logged is still
> hvmemul_do_pio_buffer()'s return value, i.e. X86EMUL_UNHANDLEABLE.
> Please confirm.

If so, the prime candidate source of the X86EMUL_UNHANDLEABLE would
seem to be hvmemul_do_io()'s first switch(). Could you instrument
that one as well, so see what vio->io_req.state has caused it?

Jan

