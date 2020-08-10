Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529A240698
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 15:31:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k57tM-0002y1-PN; Mon, 10 Aug 2020 13:31:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BwXP=BU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k57tK-0002xw-Nz
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 13:31:06 +0000
X-Inumbo-ID: 852d7cc9-044a-442d-b2f0-eab5c0502c9d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 852d7cc9-044a-442d-b2f0-eab5c0502c9d;
 Mon, 10 Aug 2020 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597066265;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YZYCVIElUZ9DPa9FwwQV5ojxIpDLXnJ7SpCIq/Yhxck=;
 b=c+kaF4afbzI0M+NlJdXptmhwYi02atkoRUvpq8B//f6wN1dLcOaU5zqa
 h0x+V5SjiGtJ9IJ+r7x4YgomftfHQ8bY091byuQ89Bf8iqjF9hkMhVNoz
 8XoldhyaF4balbwol744kWpfipAJDqM2LNd64vNDJbCVaaDAKlvvoPMiv c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6t3Pj5/K2nopBs2JzBzP+C7r0C6Nk+84KzfE5snkGm4twf0kpi6xA/NGQtmTYU5inwL+Z7o+1O
 SyVSQoChupUdiAU8z1KwXAfoGVkPBcRw+Pxd2QKPCsf2+z6wvA67eX6uJhqSAkPjyLCJqYgQzN
 kGXA1sIkgy7BQum9wZJarYTsA3SIaDhVhuKhyAGhQJUZLJnVBMTp4zQxLLERlNM7DdQg2daLWK
 Z81rx6xV69Yn8EHVa4sWFBvA/lvrhIYNAB/5Nn4gj/03O0bDQQdaeALp047jGZaWDozgkilKFf
 nIs=
X-SBRS: 2.7
X-MesageID: 24495014
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,457,1589256000"; d="scan'208";a="24495014"
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
To: Trammell Hudson <hudson@trmm.net>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
 <132b5b88-c78d-01cf-df27-6430689570e4@citrix.com>
 <CXSQq8DgbTTtEtGG6W67lvGVMmT92dpQQWdC5bHKya9WwRwKZmcI3Oy4clutRHjY7BjDay5i-Iy5QVc6PAQsOKmIGvrI1MrfuN7RLnOnG1E=@trmm.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2afa43a1-d29e-32db-1583-a752b4a122e9@citrix.com>
Date: Mon, 10 Aug 2020 14:31:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CXSQq8DgbTTtEtGG6W67lvGVMmT92dpQQWdC5bHKya9WwRwKZmcI3Oy4clutRHjY7BjDay5i-Iy5QVc6PAQsOKmIGvrI1MrfuN7RLnOnG1E=@trmm.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/08/2020 19:22, Trammell Hudson wrote:
> On Thursday, August 6, 2020 8:14 PM, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> For SecureBoot, it is important that nothing which is signed can be
>> tricked into running unsigned code.
>>
>> That includes configuration such as xen.cfg or the command line.
>> Consuming these from unsigned sources is ok, so long as we can guarantee
>> that the parsing is robust (see boothole for how this goes wrong), and
>> the effects are controlled.
> In addition to the "unsafe_fsgsbase", the Linux command line is full
> of potential issues, from subtle ones like "lockdown=none" to more
> brute force things like "init=/bin/sh".

Oh - of course.  That one is far easier.

>   safeboot uses the signed
> kernel command line to pass in the root hash of the dm-verity Merkle
> tree, which cryptographically protects the rest of the runtime, so
> it definitely needs to come from a trusted source.
>
>> [...]
>> In the absence of a full audit of all our command line arguments, and
>> extra vigilance reviewing code coming in, the safer alternative is to
>> prohibit use of the command line, and only accept it in its Kconfig
>> embedded form for now.
> Turning off command line or config parsing might be a step too far.
> Since the xen.cfg in the unified image is included in the signature,
> any options configured in it should be trustworthy.  This makes it easier
> for distributions to have a Xen build with boot-time work arounds for
> different hardware or configurations.

Apologies - I didn't mean to suggest disabling command line parsing
entirely.  Simply from unsigned sources.

With the proposal here, there are two signed sources; one in Kconfig,
and one in the embedded xen.cfg file.

>
>> [...]
>> I think it might be worth having a CONFIG_SECURE_BOOT, selectable
>> initially only under CONFIG_EXPERT, and use it to force off various
>> other aspects of functionality, along with a list of known issues which
>> can be chipped away at before it can be declared supported.
> That makes sense to me.  Either doing it at compile time (by making
> CONFIG_LIVEPATCH and CONFIG_KEXEC and etc depend on !CONFIG_SECURE_BOOT),
> or having a global variable that turns off the code (similar to the
> Linux lockdown patches that are triggered if UEFI secure boot is enabled).

Hmm - I'm in two minds here.

From a user point of view, we really don't want it to be compile-time
only, because it is very important to be able to debug the exact binary
which is giving you problems, and some times that will mean "disable
secure boot and poke".

On the other hand, simply putting a "Secure Boot Enabled" check/print in
there will probably (at this point) give users a false sense of any of
this being remotely supported.

>> [...]
>> I think it is great that work is being started in this direction, but
>> there is a huge quantity of work to do before a downstream could
>> plausibly put together a Xen system which honours the intent of SecureBoot.
> I'm really worried that the current shim based approach is a false sense
> of security -- it provides trivial ways for attackers to bypass the
> SecureBoot guarantees, so closing some of those easy holes with the
> verified unified image is definitely an incremental improvement towards
> a more secure system.
>
> However, I also don't want the unified image patch to get bogged down
> while trying to pursue every UEFI SecureBoot(tm) related issue, so
> perhaps the patch series should be renamed to only focus on the unified
> build part, not the SecureBoot part.  That way downstream distributions
> can use it to add the security features that they need (caveat lector),
> without necessarily depending on the strict UEFI compliance.

Its entirely fine to take incremental work.  I didn't mean to give the
impression of objecting to this change just because it wasn't fully UEFI
SecureBoot(tm) compliant.

My main concern is simply to avoid giving any kind of impression that
UEFI SecureBoot is generally usable at the moment.

~Andrew

