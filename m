Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DF1E80C2
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:48:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegIX-00018y-Sy; Fri, 29 May 2020 14:47:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jegIW-00018t-E5
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:47:48 +0000
X-Inumbo-ID: 5c5796ee-a1bb-11ea-81bc-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c5796ee-a1bb-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 14:47:47 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: viVHp8AO1Zt2nI/Z3zSZXcL6MVxc0T6JUCXptF7OtqoLsQkJZ3qaePBCEprcgJlukWsVP0bpJs
 4/N7yWjTH4sTKS97w7D5necpdd1vKrP4Bhto2FDz7hrQ1586AQXI3gdwidl5ktX/BloSdotZ/V
 p/krZsxVtDKXdFUi9fxzfkQx033S8JE5MuHa8c+1m0d8QwlK6dKV9K+ymk2vTdPW3SA7oDXy/y
 B5tQOdR3AzIM7Y4wIgxAPJYuEWam0GJ+eWRBeuJX6gwGz/pkQPWNqZmxRqE89kX6pcOpxu1N+f
 wtM=
X-SBRS: 2.7
X-MesageID: 18765118
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,448,1583211600"; d="scan'208";a="18765118"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24273.8332.662607.125522@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 15:47:40 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
In-Reply-To: <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
> Which isn’t to say we shouldn’t do it; but it might be nice to also have an intermediate solution that works right now, even if it’s not optimal.

I propose the following behaviour by updste-grub:

 1. Look for an ELF note, TBD.  If it's found, make XSM boot entries.
    (For now, skip this step, since the ELF note is not defined.)

 2. Look for a .config alongside the Xen binary.  Look for
       ^CONFIG_XSM_FLASK=y
    If the file is is not found, or no line matches, make no XSM
    boot entries.

Ian.

