Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEA1DE4D5
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:49:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc5EU-0005eY-0d; Fri, 22 May 2020 10:48:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc5ER-0005eT-Vm
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:48:52 +0000
X-Inumbo-ID: d2a6b2be-9c19-11ea-abb1-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2a6b2be-9c19-11ea-abb1-12813bfff9fa;
 Fri, 22 May 2020 10:48:51 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: oMCupNkvvGSw15n75VORzuOhWKwFc/VttI6152HTwXDbEpTjCjpYPj0kA4ukxoGlqC8XInmsNM
 S6pxCm+2BZ3I8JBq7G7XBOss1vkTX5nvwLaEt+Si5mo0OPIIZBRJQci/N0WH+TciDrRHXgt8Qd
 oznCZB+OGVJmMJ7X5bkktaf2p+zfygAKrTUBrqzPm9BmuK4pF+kUFPR4DdcoV08pxZD2ZEcTvb
 mFzKRDvTlJd5uzASC6xurpNM63jDV2aSD4b8cX2lgI3VjT7BJkBG/Pt9vPY6d0TZxhpPqfUe73
 u7Q=
X-SBRS: 2.7
X-MesageID: 18428895
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18428895"
Date: Fri, 22 May 2020 12:48:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: refine guest_mode()
Message-ID: <20200522104844.GY54375@Air-de-Roger>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
 <1704f4f6-7e77-971c-2c94-4f6a6719c34a@citrix.com>
 <5bbe6425-396c-d934-b5af-53b594a4afbc@suse.com>
 <16939982-3ccc-f848-0694-61b154dca89a@citrix.com>
 <5ce12c86-c894-4a2c-9fa6-1c2a6007ca28@suse.com>
 <20200518145101.GV54375@Air-de-Roger>
 <d58ec87e-a871-2e65-4a69-b73a168a6afa@suse.com>
 <20200520151326.GM54375@Air-de-Roger>
 <38d546f9-8043-8d94-8298-8fd035078a8a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38d546f9-8043-8d94-8298-8fd035078a8a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 11:52:42AM +0200, Jan Beulich wrote:
> On 20.05.2020 17:13, Roger Pau Monné wrote:
> > OK, so I think I'm starting to understand this all. Sorry it's taken
> > me so long. So it's my understanding that diff != 0 can only happen in
> > Xen context, or when in an IST that has a different stack (ie: MCE, NMI
> > or DF according to current.h) and running in PV mode?
> > 
> > Wouldn't in then be fine to use (r)->cs & 3 to check we are in guest
> > mode if diff != 0? I see a lot of other places where cs & 3 is already
> > used to that effect AFAICT (like entry.S).
> 
> Technically this would be correct afaics, but the idea with all this
> is (or should I say "looks to be"?) to have the checks be as tight as
> possible, to make sure we don't mistakenly consider something "guest
> mode" which really isn't. IOW your suggestion would be fine with me
> if we could exclude bugs anywhere in the code. But since this isn't
> realistic, I consider your suggestion to be relaxing things by too
> much.

OK, so I take that (long time) we might also want to change the cs & 3
checks from entry.S to check against __HYPERVISOR_CS explicitly?

What I would prefer is to have some kind of homogeneity in how guest
mode vs Xen mode checks are performed, so that we don't confuse
people.

Thanks, Roger.

