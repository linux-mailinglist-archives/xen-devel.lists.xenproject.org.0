Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D95A214192
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 00:32:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrUD6-0006Ke-L5; Fri, 03 Jul 2020 22:31:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqYw=AO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1jrUD4-0006KZ-Db
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 22:31:07 +0000
X-Inumbo-ID: e044b874-bd7c-11ea-bca7-bc764e2007e4
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e044b874-bd7c-11ea-bca7-bc764e2007e4;
 Fri, 03 Jul 2020 22:31:03 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593815461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e6HM5KalB3cdRfA4Hps7INNFh9eeE6yz+RhORK/ferw=;
 b=UxWfa4HS6S7NQAyS/jMl4fjxbcCv1prvRSCKbsDllp1+dzc5z4T7inYWBkJ3FhkaGfHaTZ
 vAGLgP5gEjwFC1sgShElbTjfY3RehAdz/I6E1I+msYo1HdhV615kK2pihe8pCXeOFCgX9E
 WONDkzZJl/h8MJnEGa00LKFRZ09tDewa4sRXfvLgaYEAaDe0ATeTslGCTtHWH9CNJoVLkl
 62KdtDowVoLPx/rBXkQleegbyC+nJxPWzpcyu6WdZgfHKU6pXPFzpUBtldeZBQuvTSrj0p
 EV6miUZEF3v9PMDvUvKVJnZHJUh9rLNxNz7hdtwPUXED6ouA+tE72u89gRISxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593815461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e6HM5KalB3cdRfA4Hps7INNFh9eeE6yz+RhORK/ferw=;
 b=bvB//3vcFyKBqGU4jVbTlAhUCfJaMSN/jkN+tpi1wI9XzIYrvfyn0Bmgf8ATogOTaNPtl2
 DSyT7KFiHbveqTBg==
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 LKML <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: FSGSBASE seems to be busted on Xen PV
In-Reply-To: <e78d2ee5-66cf-2ed8-c04f-71dd92efdfe1@citrix.com>
References: <CALCETrVfi1Rnt5nnrHNivdxE7MqRPiLXvon4-engqo=LCKiojA@mail.gmail.com>
 <e78d2ee5-66cf-2ed8-c04f-71dd92efdfe1@citrix.com>
Date: Sat, 04 Jul 2020 00:31:00 +0200
Message-ID: <87eepss02j.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: X86 ML <x86@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper <andrew.cooper3@citrix.com> writes:
> On 03/07/2020 18:10, Andy Lutomirski wrote:
>> If you can't get this fixed in upstream Xen reasonably quickly, we may
>> need to disable FSGSBASE in a Xen PV guest in Linux.
>
> This has come up several times before, but if its actually breaking
> userspace then Xen needs to change.
>
> I'll see about making something which is rather more robust.

You mean disabling XEN PV completely? That would be indeed very robust
and allows us to get rid of lots of obscure code. Feel free to add my
Acked-by :)

Thanks,

        tglx

