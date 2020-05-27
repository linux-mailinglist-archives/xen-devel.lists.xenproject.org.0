Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78E81E4586
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 16:16:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdwqC-0000mk-Kk; Wed, 27 May 2020 14:15:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV0l=7J=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdwqA-0000md-R6
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 14:15:30 +0000
X-Inumbo-ID: 84525d66-a024-11ea-a755-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84525d66-a024-11ea-a755-12813bfff9fa;
 Wed, 27 May 2020 14:15:29 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:35482
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdwq8-000Vss-KN (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Wed, 27 May 2020 15:15:28 +0100
Subject: Re: -mno-tls-direct-seg-refs support in glibc for i386 PV Xen
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Florian Weimer <fweimer@redhat.com>, xen-devel@lists.xenproject.org,
 libc-alpha@sourceware.org
References: <87mu5til8a.fsf@oldenburg2.str.redhat.com>
 <551ceac2-9cf6-00fd-95a6-a5b9fea6a383@citrix.com>
 <20200527134441.y5dta4n2dm3ftlmw@function>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3c6c1ab3-e9d9-78d1-8a1e-36da206c4c98@citrix.com>
Date: Wed, 27 May 2020 15:15:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527134441.y5dta4n2dm3ftlmw@function>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

On 27/05/2020 14:44, Samuel Thibault wrote:
> Hello,
>
> Andrew Cooper via Libc-alpha, le mer. 27 mai 2020 14:39:00 +0100, a ecrit:
>> Why does the MSB make any difference?  %gs still needs to remain intact
>> so the thread pointer can be pulled out, so there is nothing that Xen or
>> Linux can do in the way of lazy loading.
>>
>> Beyond that, its straight up segment base semantics in x86.  There will
>> be a 1-cycle AGU delay from a non-zero base, but that nothing to do with
>> Xen and applies to all segment based TLS accesses on x86, and you'll win
>> that back easily through reduced register pressure.
>>
>> Are there any further details on the perf problem claim?  I find it
>> suspicious.
> The concern is not about the indirection.
>
> The concern is that to keep safe from the guest, the hypervisor has to
> restrict the size of the segment, and thus negative offsets, used in the
> i386 TLS model, are rejected by the processor, and the hypervisor has to
> emulate these access, thus a high cost.

Oh, so the i386 TLS model relies on the calculation wrapping (modulo 4G)
when the segment limit is 4G, instead of taking a fault?

Intel states this is behaviour is implementation specific (SDM Vol3
5.3.1) and may fault, while AMD doesn't discuss it at all as far as I
can tell (APM Vol2 4.12 is the right section, but I can't see this
discussed).

While I can believe it probably works on every processor these days, it
does seem like dodgy ground to base an ABI on.

It also means that Xen isn't necessarily the only affected party.  I'm
pretty sure GRSecurity use reduced segment limits as well.

I also bet it doesn't work reliably under emulation.

~Andrew

