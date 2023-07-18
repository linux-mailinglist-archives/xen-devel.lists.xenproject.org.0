Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4801D757A36
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 13:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565124.883002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLifH-0005Ej-FH; Tue, 18 Jul 2023 11:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565124.883002; Tue, 18 Jul 2023 11:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLifH-0005CG-Bn; Tue, 18 Jul 2023 11:14:47 +0000
Received: by outflank-mailman (input) for mailman id 565124;
 Tue, 18 Jul 2023 11:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agjq=DE=citrix.com=prvs=55665d270=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qLifG-0005CA-4z
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 11:14:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b35763d-255c-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 13:14:44 +0200 (CEST)
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
X-Inumbo-ID: 4b35763d-255c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689678883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=H0sf74qDQKrwVRyEDdS7iWnmtZ2Fml7U03kG8T2HpA4=;
  b=TJnEZcO92Rfd/9sSzuGV97cDqo4o+Pi6k9Jl8vcj0+dgayghf/k088KE
   GuS60YbTFUgXdzL8nq3LTxPXDBirMnUOpQ9ZWPZ8hHSOrjee4EgvIw5yb
   FKg/co+PoxYQ7M0QTnd3vHrb7LOrhBXotRE67VyNAp2IY00wSRp5MEgd4
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119170195
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:bJHDEaowUg+HQosABIhtLhMHCBReBmILZRIvgKrLsJaIsI4StFCzt
 garIBmAaP3YNDahLop/PNmy8k5Uu5XXx9dqSAA4qSE2EC9EopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzilNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGANNinZg96a+baAavt2weIdDvjZO7pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jufrj2mWkhLabRzzxKa+SmohcmTuB+rAoU5GbSA3+9TqwO6kzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS9wWl2qfSpQGDCQAsTDFbb8c9nNQrXjFs3
 ViM9/vgHTF1uaeZYW6c/LyT6zi1PEAowXQqPHFeC1Ffup+6/d9110iUJjp+LEKrpo31QQiqx
 wymlSwFp6cJyug19ZSJ+mmS1lpAuaP1oh4JChT/Bzz1v10nOtL9OeRE+nCAs68ecd/xok2p+
 SFdxpPAtL1m4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 Kz741k5CGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonE/OxfAgDm8zxB1+U3aB
 Xt9WZz0ZZr9If06pAdaus9HieN7rszA7Ti7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Mm
 +uzw/Cikk0FOMWnO3m/zGLmBQxSRZTNLcys+pM/my/qClYOJVzN/NeLmeN4J9I1wvQL/goKl
 1nkMnJlJJPErSWvAW23hrpLMdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:L58TpaoEWa3hxCtvgPcxR6kaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: 9a23:/f50hmzp0dRGTrTnqO0tBgVEGpgcKHnh4E7UGG+qEyFPdp+ke1iprfY=
X-Talos-MUID: 9a23:tOw6TAW+jZwhfH7q/CDn3zVhEptN3/T0D2sAmK0vqvCvawUlbg==
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="119170195"
Date: Tue, 18 Jul 2023 12:14:36 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Message-ID: <1571d2d1-0a5e-49e9-b2f2-84af65e2d0cf@perard>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-4-roger.pau@citrix.com>
 <d7be70e8-611c-4f7d-a585-2a00b1513a92@perard>
 <ZLVR23KbddRHrC5z@MacBook-Air-de-Roger.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLVR23KbddRHrC5z@MacBook-Air-de-Roger.local>

On Mon, Jul 17, 2023 at 04:36:11PM +0200, Roger Pau Monné wrote:
> On Wed, Jul 12, 2023 at 05:39:01PM +0100, Anthony PERARD wrote:
> > On Tue, Jul 11, 2023 at 11:22:27AM +0200, Roger Pau Monne wrote:
> > > Add a new array field to libxl_cpuid_policy in order to store the MSR
> > > policies.
> > > 
> > > Note that libxl_cpuid_policy_list_{copy,length,parse_json,gen_json}
> > > are not adjusted to deal with the new MSR array now part of
> > > libxl_cpuid_policy_list.
> > 
> > Why? Isn't this going to be an issue? Or maybe that going to be dealt
> > with in a future patch?
> 
> I'm unsure what's the point of those?  The CPUID/MSR data is passed as
> a migration stream record from the hypervisor, so I don't see much
> point into converting it into json.  It also seems quite complex, and
> can't likely we done without breaking (or adjusting) the current
> format.

I think this data is used when the machine reboots. I've only try to
edit the file "/var/lib/xen/userdata-d.*" and it change which cpu flags
where available in the machine after a reboot. You could maybe confirm
that when you change an msr value, it is actually conserved across
reboot.

> My plan was to leave this unimplemented and if someone is in
> interested in having the data in json they can as well implement it.
> 
> Would you be OK if I add a note to the commit message that
> implementing json marshalling is left to implement for interested
> parties?

My guess is, we will have to think of something and add the msr into
json, even if it's done in a separate patch.

Cheers,

-- 
Anthony PERARD

