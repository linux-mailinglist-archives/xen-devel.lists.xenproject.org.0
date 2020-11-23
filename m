Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA8A2C0A7C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34314.65266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khC6e-0001Nc-A7; Mon, 23 Nov 2020 13:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34314.65266; Mon, 23 Nov 2020 13:42:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khC6e-0001ND-6H; Mon, 23 Nov 2020 13:42:12 +0000
Received: by outflank-mailman (input) for mailman id 34314;
 Mon, 23 Nov 2020 13:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khC6d-0001N7-5o
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:42:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 141e6cd0-5d26-4321-b570-e5e371b9e97a;
 Mon, 23 Nov 2020 13:42:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8290FACC6;
 Mon, 23 Nov 2020 13:42:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khC6d-0001N7-5o
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:42:11 +0000
X-Inumbo-ID: 141e6cd0-5d26-4321-b570-e5e371b9e97a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 141e6cd0-5d26-4321-b570-e5e371b9e97a;
	Mon, 23 Nov 2020 13:42:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606138929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yvT1rtFNJqHFdld4N2rCK8jcitLajPpc2UIYfJuNRJA=;
	b=XdP9jIXLpiTfwJMa/1oObmMdJGlc8I2on9+Xsi0sk0tNWObdr/iLSWETskIUko3fBDfUyk
	6xA2hm9TtMb6VBTlQaYYu0d6fUSc/GvELlo6NXdxPnhQ+R0u2s1XkAc5bso0jqvvDwRxDQ
	RyC+Imy9avWUxVFAe1zGJI2UqQeFAvo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8290FACC6;
	Mon, 23 Nov 2020 13:42:09 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/7] x86: some assembler macro rework
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Date: Mon, 23 Nov 2020 14:42:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Parts of this were discussed in the context of Andrew's CET-SS work.
Further parts simply fit the underlying picture. And a few patches
towards the end get attached here simply because of their dependency.
What is now patch 7 has been moved to the end of the series, in the
hope of at least unblocking the rest.

Most patches in principle have acks / R-b-s which would allow them
to go in. However, there still the controversy on the naming of the
newly introduced header in patch 1 (which subsequent patches then
add to). There hasn't been a name suggestion which would - imo -
truly represent an improvement, and I've explained why I think this
seemingly ambiguous name is actually intentionally very similar to
its sibling's. To prevent this series from further being stuck on
this I'll give it a few more days for better suggestions (or vetos)
to surface, and otherwise commit what I have suitable tags for.

It's also still not really clear to me what - if any - changes to
make to patch 7. As said there I'd be willing to drop some of the
changes made, but not all. Prior discussion hasn't led to a clear
understanding on my part of what's wanted to be kept / dropped. It
could have looked like the entire patch was wanted to go away, but
I don't think I can agree with this.

1: replace __ASM_{CL,ST}AC
2: drop ASM_{CL,ST}AC
3: fold indirect_thunk_asm.h into asm-defns.h
4: guard against straight-line speculation past RET
5: limit amount of INT3 in IND_THUNK_*
6: make guarding against straight-line speculation optional
7: reduce CET-SS related #ifdef-ary

Jan

