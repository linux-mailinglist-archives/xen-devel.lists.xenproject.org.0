Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6F19C86B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 19:56:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK44B-0007qr-3P; Thu, 02 Apr 2020 17:55:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK44A-0007qm-0j
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 17:55:46 +0000
X-Inumbo-ID: 2ccb3f70-750b-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ccb3f70-750b-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585850145;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=o/f+h2iqW2yJM7kEztkWaeAwmd8skiPSTm8glelY6IA=;
 b=WyBQ8ipClvahAI+Y+J5/YgNYxPe/y+RK7xp69UwFnUP0SJ7R7LYzLdae
 GedIZ9qH6RoIOFQOOYKY9oVK2fmOGTn2wruZjNWtUzxO44m+XzmJfib/Q
 GVA8gD6lTHjIYNuBjn47ewfjEbw1RMWUkCvMBYc8mVTnPzF6O3p0jI/tt I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RkuBTBUyUaNBED5uNY288M9IG/dLM6BqV7NKXXzOCrsoFMcjULJ1OD89xtoJX10chE+bw6CXAi
 /R4YAnt5q2wzaqNeiDcFpXKlK1ujCd3x6lzsT2jfn7daDTd/vrKk+dOhIJ3iPnNan6BTJyvaaG
 bolbUJ4ednvmz5zFhE1i9xSwLYL2hiMVRU/R5a2jNKi6uuT7978dAEwFgJCuAAJCeTk4BfhnIF
 eJLVHHB/P46UAuqkcqJX5MZpIbFmRH/PJOXwKkVjCcf9KQikPF5k0XrZmmdB3HvRKZ+EDpPb9N
 CDU=
X-SBRS: 2.7
X-MesageID: 15750170
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,336,1580792400"; d="scan'208";a="15750170"
Subject: Re: [PATCH 4/4] x86/APIC: restrict certain messages to BSP
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <76e02143-474f-54c1-bba3-5c5973d7751a@citrix.com>
Date: Thu, 2 Apr 2020 18:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13/03/2020 09:26, Jan Beulich wrote:
> All CPUs get an equal setting of EOI broadcast suppression; no need to
> log one message per CPU, even if it's only in verbose APIC mode.
>
> Only the BSP is eligible to possibly get ExtINT enabled; no need to log
> that it gets disabled on all APs, even if - again - it's only in verbose
> APIC mode.
>
> Take the opportunity and introduce a "bsp" parameter to the function, to
> stop using smp_processor_id() to tell BSP from APs.

On further consideration, this is introducing a latent bug.

In a theoretical world where we could take the BSP offline, it is still
the CPU with the ID 0 which needs various of these things setting back up.

You could argue that we could move ExtINT/NMI handling to a different
CPU, and in this case, BSP still isn't the right distinction.  We'd want
something to signify "the processor which is the target of legacy
interrupts", as in such a case, it would specifically no longer be the
CPU we booted on.

OTOH, the adjustment for the NMI watchdog does look to be different. 
AFAICT, that is for deferring the watchdog setup until later in boot, at
which point "the BSP" is the appropriate distinction to use.  (That said
- I'm not sure why anything should need delaying.  I suspect this is
misplaced code to begin with.)

As for the messages being printed, I think that is fine to restrict to
the BSP.

A conversation on LKML has revealed why LVT0.MASK gets sampled - it is
to distinguish between the two virtual wire modes.  LVT0.MASK needs to
stay masked on the BSP if the firmware configured it like that, because
the PIC is wired through an IO-APIC pin which ultimately ends up
delivering an MSI ExtINT interrupt, rather than using the dedicates
sideband bus message to emulate the legacy ExtINT/LINT0 line.

~Andrew

