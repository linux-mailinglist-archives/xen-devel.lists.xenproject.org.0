Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BD1E45B3
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 16:21:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdwvV-0001ar-9V; Wed, 27 May 2020 14:21:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Hki=7J=redhat.com=fweimer@srs-us1.protection.inumbo.net>)
 id 1jdwvT-0001am-CT
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 14:21:00 +0000
X-Inumbo-ID: 48524b22-a025-11ea-81bc-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 48524b22-a025-11ea-81bc-bc764e2007e4;
 Wed, 27 May 2020 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590589257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsR6FQSfpPDBRu16d0tiuTG2BxyyN88e+ocsvc5aPWY=;
 b=ZB6ErvAfsH2nTu6jSjVwOpKy5vLv7tV5tl2/ERzXAMKgGs7MAzUdDXQhiHHz1/I0zhjf/d
 YoeR7zvWsokL17hd3LRnLLfAEuchQvK2olXHewEFZR+nNYKvRNwRuhvY6fIZeyh9GUvcHF
 jd7LH4LFCnaVcnkGqdz2pf91D2rB7NQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-MuetF85rO5Sx5VW2hrFfdg-1; Wed, 27 May 2020 10:20:55 -0400
X-MC-Unique: MuetF85rO5Sx5VW2hrFfdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB9F84B8A1;
 Wed, 27 May 2020 14:20:54 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-106.ams2.redhat.com
 [10.36.113.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E55F768A4;
 Wed, 27 May 2020 14:20:51 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: -mno-tls-direct-seg-refs support in glibc for i386 PV Xen
References: <87mu5til8a.fsf@oldenburg2.str.redhat.com>
 <551ceac2-9cf6-00fd-95a6-a5b9fea6a383@citrix.com>
 <20200527134441.y5dta4n2dm3ftlmw@function>
 <3c6c1ab3-e9d9-78d1-8a1e-36da206c4c98@citrix.com>
Date: Wed, 27 May 2020 16:20:49 +0200
In-Reply-To: <3c6c1ab3-e9d9-78d1-8a1e-36da206c4c98@citrix.com> (Andrew
 Cooper's message of "Wed, 27 May 2020 15:15:27 +0100")
Message-ID: <87sgflh326.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, libc-alpha@sourceware.org,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

* Andrew Cooper:

> Oh, so the i386 TLS model relies on the calculation wrapping (modulo 4G)
> when the segment limit is 4G, instead of taking a fault?

That's about it.

> Intel states this is behaviour is implementation specific (SDM Vol3
> 5.3.1) and may fault, while AMD doesn't discuss it at all as far as I
> can tell (APM Vol2 4.12 is the right section, but I can't see this
> discussed).
>
> While I can believe it probably works on every processor these days, it
> does seem like dodgy ground to base an ABI on.

Sure, but it has been this way since the beginnings of NPTL, for close
to twenty years now.  The TCB is at positive offsets, and the user TLS
data at negative offsets.

> It also means that Xen isn't necessarily the only affected party.=C2=A0 I=
'm
> pretty sure GRSecurity use reduced segment limits as well.

Mostly for CS and DS, I believe, for the fake NX handling.  I think that
was never upstream, but some vendor kernels had variants of it.

> I also bet it doesn't work reliably under emulation.

It has to, given that it's so pervasively used under Linux. 8-/

Thanks,
Florian


