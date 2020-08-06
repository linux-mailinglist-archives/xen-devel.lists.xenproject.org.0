Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE423E035
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 20:15:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3kPm-0001Gr-I3; Thu, 06 Aug 2020 18:14:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49j5=BQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3kPl-0001Gm-MN
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 18:14:53 +0000
X-Inumbo-ID: 28bd1d69-615c-463c-9edd-5f52e2d15ec3
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28bd1d69-615c-463c-9edd-5f52e2d15ec3;
 Thu, 06 Aug 2020 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596737692;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NnooFXVGBE3t5Dl34Ex/rObZe8p4BOXf0ZuzvzW4zlY=;
 b=SoVOxDN60H8OyHRihzyH1idLz3I/LBgatHW2tPhDOupGVmPplFokIbqm
 rEgVuN3Ov99chooFpFQxBkuQzmzGI0BMjTCzFCP6j8jQ9gqwBqpJrd9jI
 yQKfII4eIaUwAR/wn0vMpJXPsaCj+Ty/H2KDk+p3Oscx820rfia51rKUi g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 38KQS5iY/6syySpqkUy2DhJBo4gDFpxcatHY3SSKgAnUKagzlqdeCURXx7BV4ZiNhExGHmSAjH
 f59oU4s/mejxEJ27b0Dr32JdhkftFY6Ahr4ReOLJLcMTCFWyidhVqtW1+FEsCaFSBVDx9zBxaj
 sAG8fCxvYdDgBan/txE1YBdJ8IlUYh+ltGsR8uPYPTeaonN8MdUxtivZifc6HXjBxTRgTpBCV7
 N/mTg0BRR8ZmIxsGIZX2lUwf9DENpXsU2LY2yRCoUPTvAUKKfQ+R74V+SDEKQp5ED4ni+ig5D0
 KGk=
X-SBRS: 3.7
X-MesageID: 24918326
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,441,1589256000"; d="scan'208";a="24918326"
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
To: Trammell Hudson <hudson@trmm.net>, Jan Beulich <jbeulich@suse.com>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <132b5b88-c78d-01cf-df27-6430689570e4@citrix.com>
Date: Thu, 6 Aug 2020 19:14:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 15:15, Trammell Hudson wrote:
> On Thursday, August 6, 2020 2:04 PM, Jan Beulich <jbeulich@suse.com> wrote:
>
>> On 06.08.2020 13:44, Trammell Hudson wrote:
>>
>>> On Thursday, August 6, 2020 9:57 AM, Jan Beulich jbeulich@suse.com wrote:
>>>> Also, considering kernel and initrd are embedded, is there really a
>>>> strict need for a config file? It would seem to me that you could
>>>> boot the system fine without.
>>> The config file is still necessary for Xen options (console, etc) as
>>> well as the kernel command line.
>> But command line options are optional. Yes, you need a config file if
>> you want to pass any options. But you may be able to get away without
>> command line options, and hence without config file.
> My concern is that if there is no config file embedded in the unified
> image, then the logic for retrieving the untrustworthy file from disk
> kicks in.  However, it is not a change from the status-quo, so I've
> reverted the behavior (as part of also fixing the shim logic).
>
> I also added code to load the ucode section from the unified image
> if it is present, which required touching the arm tree as well to add
> an additional parameter to efi_arch_cfg_file_late().  It also
> appears that in the event of the error path that the ucode will
> never be freed.  Probably not a big deal, unless you're launching
> a failing Xen from the EFI shell over and over.

For SecureBoot, it is important that nothing which is signed can be
tricked into running unsigned code.

That includes configuration such as xen.cfg or the command line. 
Consuming these from unsigned sources is ok, so long as we can guarantee
that the parsing is robust (see boothole for how this goes wrong), and
the effects are controlled.

I can't think of a Xen example offhand, but consider Linux's
"unsafe_fsgsbase" command line option which was inserted for a period of
time which deliberately opened up a privilege escalation vulnerability
for the purpose of testing the FSGSBASE series carefully.

I suppose the closest which Xen has is probably "ats" (but you've lost
all security by using PCI Passthrough anyway...), but there are also
problems with things like "flask=disabled", "hardware_domain", the
various IVRS/DMAR fixup options.

In the absence of a full audit of all our command line arguments, and
extra vigilance reviewing code coming in, the safer alternative is to
prohibit use of the command line, and only accept it in its Kconfig
embedded form for now.

Beyond that, things like LIVEPATCH and KEXEC need compiling out, until
they can be taught to verify signatures.

Beyond that, things like the GDB serial stub probably need a way of
being able to be compiled out, and then being compiled out.  (This is
definitely not an exhaustive list.)

Xen's secureboot requirements also extend to the dom0 kernel, due to the
responsibility-sharing which currently exists.  For a Linux dom0, Xen
must ensure that lockdown mode is forced on (/dev/mem in dom0 still has
a lot of system level power).  At a minimum, this involves extending
lockdown mode to prohibit the use of /{dev/proc}/xen/privcmd, which is
still a trivial privilege escalation hole in PV Linux that noone seems
to want to admit to and fix.


I think it is great that work is being started in this direction, but
there is a huge quantity of work to do before a downstream could
plausibly put together a Xen system which honours the intent of SecureBoot.

I know Safeboot has different goals/rules here, but whatever we put
together called "Secure Boot support" will have to be compatible with
Microsoft's model for it to be useful in the general case.

I think it might be worth having a CONFIG_SECURE_BOOT, selectable
initially only under CONFIG_EXPERT, and use it to force off various
other aspects of functionality, along with a list of known issues which
can be chipped away at before it can be declared supported.

~Andrew

