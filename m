Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9011AEB12
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 11:03:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPjNh-0004PI-Tp; Sat, 18 Apr 2020 09:03:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kcTk=6C=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jPjNf-0004PD-HA
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2020 09:03:19 +0000
X-Inumbo-ID: 720ae38e-8153-11ea-b58d-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 720ae38e-8153-11ea-b58d-bc764e2007e4;
 Sat, 18 Apr 2020 09:03:18 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jPjNd-000O9E-9K; Sat, 18 Apr 2020 09:03:17 +0000
Date: Sat, 18 Apr 2020 10:03:17 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 07/10] x86/shadow: the guess_wrmap() hook is needed for
 HVM only
Message-ID: <20200418090317.GD92478@deinos.phlegethon.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
 <1e221192-7899-b60d-0280-b77ab5877772@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1e221192-7899-b60d-0280-b77ab5877772@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 16:28 +0200 on 17 Apr (1587140897), Jan Beulich wrote:
> sh_remove_write_access() bails early for !external guests, and hence its
> building and thus the need for the hook can be suppressed altogether in
> !HVM configs.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

> @@ -366,6 +367,14 @@ int sh_validate_guest_entry(struct vcpu
>  extern int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
>                                    unsigned int level,
>                                    unsigned long fault_addr);
> +#else
> +static inline int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
> +                                         unsigned int level,
> +                                         unsigned long fault_addr)
> +{

Can we have an ASSERT(!shadow_mode_refcounts(d)) here, please,
matching the check that would have made it a noop before?

Cheers,

Tim.


