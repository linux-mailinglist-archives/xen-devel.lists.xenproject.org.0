Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FF31EF6A0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:44:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhAlP-0000CI-En; Fri, 05 Jun 2020 11:43:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mreJ=7S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jhAlN-0000C4-PE
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:43:53 +0000
X-Inumbo-ID: d3e0148c-a721-11ea-afa3-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3e0148c-a721-11ea-afa3-12813bfff9fa;
 Fri, 05 Jun 2020 11:43:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t18so9430762wru.6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 04:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=nAlcKlfPk6ZczuCNLD7Qy+W72K+JE/r+jEbqZSuN73A=;
 b=LSM+JFO+48v0Ohu2oRr1HSBfue+MY/8ChkSX0YunZd4u9wdJTcCGevgSacmxyjkn6t
 gui/hyn2ea/wub8YR7cS2Hhf4Khu/SeTy18R401WUNjrheumv68uqlHdE3xW26ciG9ll
 t7irBfo146kYW5Nx9/dD77AOjOH8ACXJXNLhIPLTS5l3Z01Uuot1kgIfJE8mqK/C2bOm
 /4yjUB9Yc4H0gy1mMpE7sC8xqQvvmBp5G30Fs6VfLhQyiiNholh+psFUyXsZzY9Q11n7
 SvWwVDIVUnbOPH4E3z/0PssN0pBUsLDZ0ncHI69cKqbszpNdwMM8GdP8OWA9Fsuzk01d
 wQDA==
X-Gm-Message-State: AOAM530edHQb9mhpROk7rpT4RfqNXuhhFth+qnIslNQF/oKqMAI8NBqK
 2YYFvBPh/ORr+0cp4ZWEcIw=
X-Google-Smtp-Source: ABdhPJwk5JFiutWhFvs6jtx9brPV918LsB6xJJvSQR+LoY3m8DPWWV6wksSIZFnDc1TDPludAcWYcw==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr9464565wrt.416.1591357431548; 
 Fri, 05 Jun 2020 04:43:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id e12sm11154197wro.52.2020.06.05.04.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 04:43:51 -0700 (PDT)
Date: Fri, 5 Jun 2020 11:43:49 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.14 v2] x86/rtc: provide mediated access to RTC for
 PVH dom0
Message-ID: <20200605114349.5ugjbwwoot5jq6qs@liuwe-devbox-debian-v2>
References: <20200605110240.52545-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200605110240.52545-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 01:02:39PM +0200, Roger Pau Monne wrote:
> Mediated access to the RTC was provided for PVHv1 dom0 using the PV
> code paths (guest_io_{write/read}), but those accesses where never
> implemented for PVHv2 dom0. This patch provides such mediated accesses
> to the RTC for PVH dom0, just like it's provided for a classic PV
> dom0.
> 
> Pull out some of the RTC logic from guest_io_{read/write} into
> specific helpers that can be used by both PV and HVM guests. The
> setup of the handlers for PVH is done in rtc_init, which is already
> used to initialize the fully emulated RTC.
> 
> Without this a Linux PVH dom0 will read garbage when trying to access
> the RTC, and one vCPU will be constantly looping in
> rtc_timer_do_work.
> 
> Note that such issue doesn't happen on domUs because the ACPI
> NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> the RTC. Also the X86_EMU_RTC flag is not set for PVH dom0, as the
> accesses are not emulated but rather forwarded to the physical
> hardware.
> 
> No functional change expected for classic PV dom0.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Wei Liu <wl@xen.org>

