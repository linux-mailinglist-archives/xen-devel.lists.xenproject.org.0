Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DC69D1B6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 17:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498267.769118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9OK-0002Fv-0J; Mon, 20 Feb 2023 16:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498267.769118; Mon, 20 Feb 2023 16:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9OJ-0002DT-Rt; Mon, 20 Feb 2023 16:51:51 +0000
Received: by outflank-mailman (input) for mailman id 498267;
 Mon, 20 Feb 2023 16:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V060=6Q=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pU9OI-0002DN-5F
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 16:51:50 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd6bbf13-b13e-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 17:51:48 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id c5so2574859wrr.5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 08:51:48 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003dc47d458cdsm1698014wmo.15.2023.02.20.08.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 08:51:46 -0800 (PST)
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
X-Inumbo-ID: dd6bbf13-b13e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrblE+gpgxc/XJD6vkWMSZ2+dCIk37H5XuHx35NlQuo=;
        b=NHKUONy9L0/a8/aCGe6KxiRezPMTaijYU3L6RI1BApcuDE8rOBloTqZKu5wM0s5dID
         GOarUJXhLcd1y7bzNCYb98L8y/6245+gzmjgo9Ws1XadOA94ncA8elkD/CUVkoVcCOYQ
         cxEfhiunxgls4wOx0nkc5bxXaJYZuxiZ1kZeDDzIiKoDrK5xNInQqQg/k1OWLjCzzZ0X
         BKgEhd0ToEmR9kaJEDQH4NmTClmynXXJu+5LyiSX9RiMIKQmWRz7gCJGo0pJYijiAZIy
         ktpdMYsO6KZihufVgT3NkGNic36Bht3JU/W4HlWsflN9RMjYBfrmgvSlTkIiob3HXNoP
         HrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrblE+gpgxc/XJD6vkWMSZ2+dCIk37H5XuHx35NlQuo=;
        b=0yFlTfZO9gsTR5Xbvn/zG4UjSEjG2jn3lZHtuXaWi5TJYag9CzALJ6EQZYqoiwpwl+
         mawV21Uq0KjsVC7psfdN7FOYVRhDPT8/TqJZHEWYTpLqoIjxfTqNMwpiRwgEky5vbmne
         +Jwz0m3Aae4FjwNN4gXHCa38KIEeJzmv2PV3rehZfg9xxd35RXmgJgvdhcL4FcedOGhr
         SGCDntAP6FKhX7IuisMtuR3ujOb9NsftjeVr4oIsdkAvwb1VKeArf/9DW8/VBEE9A+H0
         KgBvs4HGgX/ZUkVmAvwgPMXSKk3fOxON1RRincmqzlKR2VMv4dJbp2wEbNaoMLsiWaAj
         ldUA==
X-Gm-Message-State: AO0yUKXvWkPw0fr7oakOEUGxI3A18QojtEP6pdVimypUtaKI5QO70+fZ
	tJmOECMPN2nZF9MGYA3ru5Q=
X-Google-Smtp-Source: AK7set+dG3Zp+Fen4SBKzG9hBUHfRNF/Iov4bQRUjqvfVZ+HZs4927WZz/xh45tbyiCSyeVy+vYE7Q==
X-Received: by 2002:a5d:540d:0:b0:2c5:54a7:363c with SMTP id g13-20020a5d540d000000b002c554a7363cmr262219wrv.23.1676911907351;
        Mon, 20 Feb 2023 08:51:47 -0800 (PST)
Date: Mon, 20 Feb 2023 17:51:44 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Message-ID: <20230220165144.GA2653336@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <20230216150734.GB2137216@horizon>
 <ba0c8c8f-894a-0ec7-4339-0537952f781a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba0c8c8f-894a-0ec7-4339-0537952f781a@suse.com>

On Thu, Feb 16, 2023 at 04:15:29PM +0100, Jan Beulich wrote:
> On 16.02.2023 16:07, Matias Ezequiel Vara Larsen wrote:
> > On Wed, Dec 14, 2022 at 08:29:53AM +0100, Jan Beulich wrote:
> >> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> >>> @@ -287,6 +289,20 @@ static inline void vcpu_runstate_change(
> >>>      }
> >>>  
> >>>      v->runstate.state = new_state;
> >>> +
> >>> +    vcpustats_va = (shared_vcpustatspage_t*)d->vcpustats_page.va;
> >>> +    if ( vcpustats_va )
> >>> +    {
> >>> +	vcpustats_va->vcpu_info[v->vcpu_id].version =
> >>> +	    version_update_begin(vcpustats_va->vcpu_info[v->vcpu_id].version);
> >>> +        smp_wmb();
> >>> +        memcpy(&vcpustats_va->vcpu_info[v->vcpu_id].runstate_running_time,
> >>> +               &v->runstate.time[RUNSTATE_running],
> >>> +               sizeof(v->runstate.time[RUNSTATE_running]));
> >>> +        smp_wmb();
> >>> +        vcpustats_va->vcpu_info[v->vcpu_id].version =
> >>> +            version_update_end(vcpustats_va->vcpu_info[v->vcpu_id].version);
> >>> +    }
> >>
> >> A further aspect to consider here is cache line ping-pong. I think the
> >> per-vCPU elements of the array want to be big enough to not share a
> >> cache line. The interface being generic this presents some challenge
> >> in determining what the supposed size is to be. However, taking into
> >> account the extensibility question, maybe the route to take is to
> >> simply settle on a power-of-2 value somewhere between x86'es and Arm's
> >> cache line sizes and the pretty common page size of 4k, e.g. 512 bytes
> >> or 1k?
> >>
> > 
> > I do not now how to address this. I was thinking to align each vcpu_stats
> > instance to a multiple of the cache-line. I would pick up the first multiple
> > that is bigger to the size of the vcpu_stats structure. For example, currently
> > the structure is 16 bytes so I would align each instance in a frame to 64
> > bytes. Would it make sense? 
> 
> Well, 64 may be an option, but I gave higher numbers for a reason. One thing
> I don't know is what common cache line sizes are on Arm or e.g. RISC-V.

Thanks. I found that structures that require cache-aligment are defined with
"__cacheline_aligned" that uses L1_CACHE_BYTES. For example, in x86, this
aligns to 128 bytes. What is the reason to use a higher value like 512 bytes or
1k?.

Thanks, Matias. 

