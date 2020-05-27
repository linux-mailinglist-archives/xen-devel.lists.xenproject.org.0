Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 522491E4421
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 15:45:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdwMR-0006Ua-R9; Wed, 27 May 2020 13:44:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9XM8=7J=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jdwMQ-0006UV-7D
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 13:44:46 +0000
X-Inumbo-ID: 383e66f9-a020-11ea-a74b-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 383e66f9-a020-11ea-a74b-12813bfff9fa;
 Wed, 27 May 2020 13:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id E64B6D737;
 Wed, 27 May 2020 15:44:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pgx7Mf1c6z9U; Wed, 27 May 2020 15:44:42 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id C1D68D242;
 Wed, 27 May 2020 15:44:42 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jdwML-001IBK-JO; Wed, 27 May 2020 15:44:41 +0200
Date: Wed, 27 May 2020 15:44:41 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: -mno-tls-direct-seg-refs support in glibc for i386 PV Xen
Message-ID: <20200527134441.y5dta4n2dm3ftlmw@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Florian Weimer <fweimer@redhat.com>, xen-devel@lists.xenproject.org,
 libc-alpha@sourceware.org
References: <87mu5til8a.fsf@oldenburg2.str.redhat.com>
 <551ceac2-9cf6-00fd-95a6-a5b9fea6a383@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <551ceac2-9cf6-00fd-95a6-a5b9fea6a383@citrix.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: Florian Weimer <fweimer@redhat.com>, xen-devel@lists.xenproject.org,
 libc-alpha@sourceware.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Andrew Cooper via Libc-alpha, le mer. 27 mai 2020 14:39:00 +0100, a ecrit:
> Why does the MSB make any difference?  %gs still needs to remain intact
> so the thread pointer can be pulled out, so there is nothing that Xen or
> Linux can do in the way of lazy loading.
> 
> Beyond that, its straight up segment base semantics in x86.  There will
> be a 1-cycle AGU delay from a non-zero base, but that nothing to do with
> Xen and applies to all segment based TLS accesses on x86, and you'll win
> that back easily through reduced register pressure.
> 
> Are there any further details on the perf problem claim?  I find it
> suspicious.

The concern is not about the indirection.

The concern is that to keep safe from the guest, the hypervisor has to
restrict the size of the segment, and thus negative offsets, used in the
i386 TLS model, are rejected by the processor, and the hypervisor has to
emulate these access, thus a high cost.

Samuel

