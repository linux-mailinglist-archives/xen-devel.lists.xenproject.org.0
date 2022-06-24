Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D5559A19
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 15:06:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355536.583260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4j1F-0000xd-Tz; Fri, 24 Jun 2022 13:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355536.583260; Fri, 24 Jun 2022 13:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4j1F-0000vq-Pv; Fri, 24 Jun 2022 13:06:41 +0000
Received: by outflank-mailman (input) for mailman id 355536;
 Fri, 24 Jun 2022 13:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kb19=W7=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1o4j1E-0000vk-4u
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 13:06:40 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bbccfe3-f3be-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 15:06:38 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id q9so3059695wrd.8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jun 2022 06:06:38 -0700 (PDT)
Received: from horizon ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffb91000000b0020c5253d907sm2288903wrr.83.2022.06.24.06.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 06:06:37 -0700 (PDT)
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
X-Inumbo-ID: 7bbccfe3-f3be-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tmmMc/+6fMOuYyEJeltVYvGlEaNaHuROm71Y1fktAl4=;
        b=bJ85DQYPh5E55q2omOp3YTdeEdMsEEpPMr9zJayKDo9+NKjwjZf2qvmcTnKqGB5S8Q
         DRHGXAhEENI5EsSPU+37hY77PYjSbs+W6u+jhbIi77gYbEAdn8fSMTq9maV31R0cw4HM
         udn+/LHSFLNy+gW4C2Bz5DE29LEGkfQyagvAL4dNg8CB9+llv3u0qhzrjxlQygfG/pua
         69eqQ93icigEbrSwTSO5ape1LYsBUEbZ2EWZfnlkz2qF5r0fFG+P5mlmupWCBAa/67U/
         +ZVROxLFfNHQPteuQCza6vkuxXI5YogQrxrx1Jum1lIC7a3i7gxLW//XhWJ1WTReK9Mf
         PcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tmmMc/+6fMOuYyEJeltVYvGlEaNaHuROm71Y1fktAl4=;
        b=j/UQc+uzyxsiEl9KF0vvr6882/Jzh3r9ySaKxnNwreEQYxOWdWCXv1KHjtwS7Xn0n8
         pZiDiobz7PH91UpFYwilxGCo4G15KzInHT+bDvDcbMo+ziAmK1Ryx0PzxkaDJcA//0+7
         K59CK3Fw+o4Ac0NCsQGg9cTLiy9qoWaWJrTrOYudC8lkVBRgOSVxJF+cXr539XCY3+hX
         8QN16EqGUV+RjtpNxeetYAynzU0i4Owo5O707OvfL5OjE177Ilz6lpGJAC4p40iWoDyW
         9mlUYRYS7JLnmnrAIRqGLcJDInMNk0uc7Yq/JSgr+IiqHO2x7HahdHnq0BXeQbHq+Rs1
         zZAg==
X-Gm-Message-State: AJIora9bZrb/6igW3ZpV/HxQmkB4Xue6/6IK5KWTYIsl824ub1+cn3Kd
	uPDmJ+8liAReN6qxKq5SfqA=
X-Google-Smtp-Source: AGRyM1vKMSdy6rxDVn7NWw1i7aNMFQYln4QpGcwF4NeYfHwbcRM6gXJ25ElLshmrg/asjbpKla1NJg==
X-Received: by 2002:a5d:4ace:0:b0:21b:a37d:f5d with SMTP id y14-20020a5d4ace000000b0021ba37d0f5dmr11187299wrs.38.1656075998014;
        Fri, 24 Jun 2022 06:06:38 -0700 (PDT)
Date: Fri, 24 Jun 2022 15:06:35 +0200
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH 0/2] Add a new acquire resource to query vcpu
 statistics
Message-ID: <20220624130635.GA249540@horizon>
References: <cover.1652797713.git.matias.vara@vates.fr>
 <EEFF4C8C-F26D-47CF-8E5D-5E62BB6579BC@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EEFF4C8C-F26D-47CF-8E5D-5E62BB6579BC@citrix.com>

Hello George and thanks for the review! you will find my comments below.

On Fri, Jun 17, 2022 at 07:54:32PM +0000, George Dunlap wrote:
> 
> 
> > On 17 May 2022, at 15:33, Matias Ezequiel Vara Larsen <matiasevara@gmail.com> wrote:
> > 
> > Hello all,
> > 
> > The purpose of this RFC is to get feedback about a new acquire resource that
> > exposes vcpu statistics for a given domain. The current mechanism to get those
> > statistics is by querying the hypervisor. This mechanism relies on a hypercall
> > and holds the domctl spinlock during its execution. When a pv tool like xcp-rrdd
> > periodically samples these counters, it ends up affecting other paths that share
> > that spinlock. By using acquire resources, the pv tool only requires a few
> > hypercalls to set the shared memory region and samples are got without issuing
> > any other hypercall. The original idea has been suggested by Andrew Cooper to
> > which I have been discussing about how to implement the current PoC. You can
> > find the RFC patch series at [1]. The series is rebased on top of stable-4.15.
> > 
> > I am currently a bit blocked on 1) what to expose and 2) how to expose it. For
> > 1), I decided to expose what xcp-rrdd is querying, e.g., XEN_DOMCTL_getvcpuinfo.
> > More precisely, xcp-rrd gets runstate.time[RUNSTATE_running]. This is a uint64_t
> > counter. However, the time spent in other states may be interesting too.
> > Regarding 2), I am not sure if simply using an array of uint64_t is enough or if
> > a different interface should be exposed. The remaining question is when to get
> > new values. For the moment, I am updating this counter during
> > vcpu_runstate_change().
> > 
> > The current series includes a simple pv tool that shows how this new interface is
> > used. This tool maps the counter and periodically samples it.
> > 
> > Any feedback/help would be appreciated.
> 
> Hey Matias,
> 
> Sorry it’s taken so long to get back to you.  My day-to-day job has shifted away from technical things to community management; this has been on my radar but I never made time to dig into it.
> 
> There are some missing details I’ve had to try to piece together about the situation, so let me sketch things out a bit further and see if I understand the situation:
> 
> * xcp-rrd currently wants (at minimum) to record runstate.time[RUNSTATE_running] for each vcpu.  Currently that means calling XEN_DOMCTL_getvcpuinfo, which has to hold a single global domctl_lock (!) for the entire hypercall; and of course must be iterated over every vcpu in the system for every update.
> 

For example, in xcp-ng, xcp-rrdd is sampling all the VCPUs of the system every 5
seconds. Also, xcp-rrdd queries other counters like XEN_DOMCTL_getdomaininfo. 

Out of curiosity, do you know any benchmark to measure the impact of this
querying? My guess is that the time of domctl-based operations would increase
with the number of VCPUs. In such a escenario, I am supposing that the time to
query all vcpus increase with the number of vcpus thus holding the domctl_lock
longer. However, this would be only observable in a large
enough system.

> * VCPUOP_get_runstate_info copies out a vcpu_runstate_info struct, which contains information on the other runstates.  Additionally, VCPUOP_register_runstate_memory_area already does something similar to what you want: it passes a virtual address to Xen, which Xen maps, and copies information about the various vcpus into (in update_runstate_area()).
> 
> * However, the above assumes a domain of “current->domain”: That is a domain can call VCPUOP_get_runstate_info on one of its own vcpus, but dom0 cannot call it to get information about the vcpus of other domains.
> 
> * Additionally, VCPUOP_register_runstate_memory_area registers by *virtual address*; this is actually problematic even for guest kernels looking at their own vcpus; but would be completely inappropriate for a dom0 userspace application, which is what you’re looking at.
> 

I just learned about VCPUOP_register_runstate_memory_area a few days ago. I did
not know that it is only for current->domain. Thanks for pointing it out.

> Your solution is to expose things via the xenforeignmemory interface instead, modelled after the vmtrace_buf functionality.
> 
> Does that all sound right?
> 

That's correct. I used vmtrace_buf functionality for inspiration.

> I think at a high level that’s probably the right way to go.
> 
> As you say, my default would be to expose similar information as VCPUOP_get_runstate_info.  I’d even consider just using vcpu_runstate_info_t.
> 
> The other option would be to try to make the page a more general “foreign vcpu info” page, which we could expand with more information as we find it useful.
> 
> In this patch, you’re allocating 4k *per vcpu on the entire system* to hold a single 64-bit value; even if you decide to use vcpu_runstate_info_t, there’s still quite a large wastage.  Would it make sense rather to have this pass back an array of MFNs designed to be mapped contiguously, with the vcpus listed as an array? This seems to be what XENMEM_resource_ioreq_server does.
> 
> The advantage of making the structure extensible is that we wouldn’t need to add another interface, and potentially another full page, if we wanted to add more functionality that we wanted to export.  On the other hand, every new functionality that we add may require adding code to copy things into it; making it so that such code is added bit by bit as it’s requested might be better.
> 

Current PoC is indeed a waste of memory in two senses:
1) data structures are not well chosen 
2) memory is being allocated unconditionally

For 1), you propose to use an extensible structure on top of an array of MFNs. I
checked xen.git/xen/include/public/hvm/ioreq.h, it defines the
structure:

struct shared_iopage {
    struct ioreq vcpu_ioreq[1];
};

And then, it accesses it as:

p->vcpu_ioreq[v->vcpu_id];

I could have similar structures, let me sketch it and then I will write down a
design document. The extensible structures could look like:

struct vcpu_stats{ 
   uint64 runstate_running_time;
   // potentially other runstate-time counters
};

struct shared_statspages {
   // potentially other counters, e.g., domain-info
   struct vcpu_stats vcpu_info[1]
}; 

The shared_statspage structure would be mapped on top of an array of continuous
MFNs. The vcpus are listed as an array. I think this structure could be extended
to record per-domain counters by defining them just before vcpu_info[1].  

What do you think?

For 2), you propose a domctl flag on domain creation to enable/disable the
allocation and use of these buffers. I think that is the right way to go for the
moment.

There is a 3) point regarding what Jan suggested about how to ensure that the
consumed data is consistent. I do not have a response for that yet, I will think
about it.

I will address these points and submit v1 in the next few weeks.   

Thanks, Matias.

> I have some more comments I’ll give on the 1/2 patch.
> 
>  -George
> 
> 
> 
> 
> 
> 
> > 
> > Thanks, Matias.
> > 
> > [1] https://github.com/MatiasVara/xen/tree/feature_stats
> > 
> > Matias Ezequiel Vara Larsen (2):
> >  xen/memory : Add stats_table resource type
> >  tools/misc: Add xen-stats tool
> > 
> > tools/misc/Makefile         |  5 +++
> > tools/misc/xen-stats.c      | 83 +++++++++++++++++++++++++++++++++++++
> > xen/common/domain.c         | 42 +++++++++++++++++++
> > xen/common/memory.c         | 29 +++++++++++++
> > xen/common/sched/core.c     |  5 +++
> > xen/include/public/memory.h |  1 +
> > xen/include/xen/sched.h     |  5 +++
> > 7 files changed, 170 insertions(+)
> > create mode 100644 tools/misc/xen-stats.c
> > 
> > --
> > 2.25.1
> > 
> 



