Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3DB72E045
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 13:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548105.855898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91m4-0007FP-7N; Tue, 13 Jun 2023 11:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548105.855898; Tue, 13 Jun 2023 11:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91m4-0007D2-4Y; Tue, 13 Jun 2023 11:01:20 +0000
Received: by outflank-mailman (input) for mailman id 548105;
 Tue, 13 Jun 2023 11:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q91m2-0007Cw-6J
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 11:01:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b9a3d97-09d9-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 13:01:15 +0200 (CEST)
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
X-Inumbo-ID: 9b9a3d97-09d9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686654075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bzIgJF1d4fa/39g/1Ipd1CToy/HdoGFWODylF4OoT1U=;
  b=ahyyHqJapHah+fR9MHHp/E7JNBI9SrMpMnrv6zEDnPpfSbwdK7Spgirs
   WTq2dmLOQOmYYupcp21R9OheIIAUzMjEILZ2SuzxZRhimVf7GyGncH6ra
   UZBSEddY9ACmHYhSkWJvZdo2q8MhmVUFLQCxD0GMe6aoOeBkXh8v+sDr6
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111338205
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:5R74qKKK6bgzi9zfFE+RwZUlxSXFcZb7ZxGr2PjKsXjdYENS1TdWz
 mUaXzuDOPnYY2PzfNslbtzk8EgG7JKBx9FlTgFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AVlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4mKFN++
 9ooBQwjUSDdqOO8562EUtJF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJwOxRbC/
 j+uE2LREh8cMISS+H2+yCiP3O3klCnbcYk5PejtnhJtqALKnTFCYPEMbnO8pfC3okezQ9xbJ
 goY90IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6GAkAUQzgHb8Yp3Oc/XTEw3
 0WFt8/oDzdo9raSTBqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tpkPmfOZtNp6YsvPKKW/fw
 jqtsxcmvJxG2KbnyJ6HEUD7byOE/8aZEFBvul2IAgpJ/SsiOtf7OtXABUzzqK8Zcd3HFgTpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKRBaJxslcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIoQP8ktK1TWoHE3DaJ144wLuBJ0+U3YE
 c3CGftA8F5AUfg3pNZIb7p1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PXBt3VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbafVM8RD98UaaMqV7jEqQ895loei7z1
 inVcidlJJDX2BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:g5IvQawAljH+MxMmJPF9KrPwT71zdoMgy1knxilNoH1uEvBw8v
 rEoB1173LJYVoqMk3I+urgBED/exzhHPdOiOEs1NyZMDUO1lHHEL1f
X-Talos-CUID: 9a23:AXfSXG9tRBSXcxKt/LWVvx89KPArVE3w8FnvExGXCGxOV4KNcnbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AhJ3o1Q3N/lOV3AhDvq7CkRfVPTUj86qoDBgAoNI?=
 =?us-ascii?q?9gZOnby5bMj29pT+ca9py?=
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="111338205"
Date: Tue, 13 Jun 2023 12:00:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools: fix make rpmball
Message-ID: <f424bb2c-aee2-4435-95b6-9baa62b435f3@perard>
References: <20230613105513.12949-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230613105513.12949-1-olaf@aepfle.de>

On Tue, Jun 13, 2023 at 12:55:13PM +0200, Olaf Hering wrote:
> Commit 438c5ffa44e99cceb574c0f9946aacacdedd2952 ("rpmball: Adjust to
> new rpm, do not require --force") attempted to handle stricter
> directory permissions in newer distributions.
> 
> This introduced a few issues:
> - /boot used to be a constant prior commit
>   6475d700055fa952f7671cee982a23de2f5e4a7c ("use BOOT_DIR as xen.gz
>   install location"), since this commit the location has to be
>   referenced via ${BOOT_DIR}
> - it assumed the prefix and the various configurable paths match the
>   glob pattern /*/*/*
> 
> Adjust the code to build a filelist on demand and filter directories
> from an installed filesystem.rpm. This works on a SUSE system, and
> will likely work on a RedHat based system as well.
> 
> Take the opportunity to replace the usage of $RPM_BUILD_ROOT with
> %buildroot, and use pushd/popd pairs.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
> 
> v2: remove bogus pushd/popd pair, use pipe as delimiter for s command for consistency

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

