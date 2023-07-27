Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59E676570F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571176.894404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2dm-0000t2-Li; Thu, 27 Jul 2023 15:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571176.894404; Thu, 27 Jul 2023 15:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2dm-0000qJ-Ip; Thu, 27 Jul 2023 15:10:58 +0000
Received: by outflank-mailman (input) for mailman id 571176;
 Thu, 27 Jul 2023 15:10:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qP2dk-0000qD-LR
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:10:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c713cf79-2c8f-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 17:10:54 +0200 (CEST)
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
X-Inumbo-ID: c713cf79-2c8f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690470654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2TO7d1dwf1pepJRrNNx2i6Rq9ZFvpuh9m9Y463ovFus=;
  b=T73VcmIPSi9KWdHpel20sxSHy8SQ8uzj5GupgS4kQdOrY5tYWmKC9uwh
   dGVE718y4Ka9eQJdIr0CCbiSbkTrTjEGofXBO0TYcVbi7n5FEGejgN00c
   SLYx1cxaCVLxPGbCPNDpXNeg+jb6DwWBQZ7QnWWGpJijquwR6IX1xmCvd
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116952080
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4MhwbK7Dn2QKF/vLewtFQAxRtBfHchMFZxGqfqrLsTDasY5as4F+v
 jAbWzzTafaPM2X2etF0b4ixoExX78XUzYRkHldprC1kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8R4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 Ow9OS9Kbxa6l8Hr24+XVsZihZQNI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx/G9
 z+cpzShav0cHP+P0QHazHyqvO/GvBiieLsVK7azycc/1TV/wURMUUZLBDNXu8KRiEe4V8hON
 k889S8nrKx0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDht9HjCCFrsbaVYWmA7brSpjS3UQAcNWIYbDUIZRcE6dLk5oo0i3ryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV/7yr2EHYxDOqn4jqExUIyhn4UGH1wAwsMeZJeLeUBUjnAedoddjIFgLQ5
 yhcx6By/8hVU8jTyXXlrPElWejwuq3baGC0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5ycCl/KI+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5f0VidEU/s2l2LpLwv47VPN7npgrY80bcmlpylLLJLEPCLFIVv7GAXmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZKRW3m2UMTXMisw+QOL77rH+aTMD15YxMn6e97KtMNcmU8vrugw
 0xRrWcEmQGn2iWbdm1nqBlLMdvSYHq2llpjVQREALpi8yFLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:zUytGancZ0vb4RQafMAlj84rfdvpDfIV3DAbv31ZSRFFG/Fw9v
 re5cjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: 9a23:qV1m6GwLRQjHRT83opiDBgUNCuU0bTrcyk7AABKjNEp1Z7OWGXGfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A9bpySg+E5uuMpoq2HNoLatGQf+R4+5/xNk4Lq5U?=
 =?us-ascii?q?PmvLdFRV3BDyWsw3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="116952080"
Date: Thu, 27 Jul 2023 16:10:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v7 11/15] xenpm: Print HWP/CPPC parameters
Message-ID: <90b10c84-9ba2-42c0-b34c-ae7d5f8bafbb@perard>
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-12-jandryuk@gmail.com>
 <882c0e9f-8e66-4be3-aecf-477d38da9371@perard>
 <CAKf6xpvrh1Y7j3pb506pNgQMgsKM0OmdbKqQtrLBXUPdMqZS6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpvrh1Y7j3pb506pNgQMgsKM0OmdbKqQtrLBXUPdMqZS6w@mail.gmail.com>

On Thu, Jul 27, 2023 at 09:54:17AM -0400, Jason Andryuk wrote:
> On Thu, Jul 27, 2023 at 7:32 AM Anthony PERARD
> <anthony.perard@citrix.com> wrote:
> >
> > On Wed, Jul 26, 2023 at 01:09:41PM -0400, Jason Andryuk wrote:
> > > @@ -772,6 +812,32 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
> > >                 p_cpufreq->u.s.scaling_min_freq,
> > >                 p_cpufreq->u.s.scaling_cur_freq);
> > >      }
> > > +    else
> > > +    {
> >
> > I feel like this could be confusing. In this function, we have both:
> >     if ( hwp ) { this; } else { that; }
> > and
> >     if ( !hwp ) { that; } else { this; }
> >
> > If we could have the condition in the same order, or use the same
> > condition for both "true" blocks, that would be nice.
> 
> Makes sense.  From your comment on patch 8, I was thinking of
> switching to a bool scaling_governor and using that.  But now I think
> hwp is better since it's the specific governor - not the default one.
> In light of that, I would just re-organize everything to be "if ( hwp
> )".
> 
> With that, patch 8 is more of a transitive step, and I would leave the
> "if ( !hwp )".  Then here in patch 11 the HWP code would be added
> first inside "if ( hwp )".  Does that sound good?

Yes, that sounds fine.

> > > +        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
> > > +
> > > +        printf("cppc variables       :\n");
> > > +        printf("  hardware limits    : lowest [%u] lowest nonlinear [%u]\n",
> > > +               cppc->lowest, cppc->lowest_nonlinear);
> >
> > All these %u should be %"PRIu32", right? Even if the rest of the
> > function is bogus... and even if it's probably be a while before %PRIu32
> > is different from %u.
> 
> Yes, you are correct.  In patch 8 "xenpm: Change get-cpufreq-para
> output for hwp", some existing %u-s are moved and a few more added.
> Do you want all of those converted to %PRIu32?

For the newly added %u, yes, that would be nice.

As for the existing one, maybe as a separated patch, if you wish. At the
moment, patch 8 is easy to review with "--ignore-space-change".

Cheers,

-- 
Anthony PERARD

