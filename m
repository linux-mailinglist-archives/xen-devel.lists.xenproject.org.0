Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF35FB14DC5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 14:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062614.1428328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjbe-0001dq-Ju; Tue, 29 Jul 2025 12:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062614.1428328; Tue, 29 Jul 2025 12:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugjbe-0001bA-Gc; Tue, 29 Jul 2025 12:38:58 +0000
Received: by outflank-mailman (input) for mailman id 1062614;
 Tue, 29 Jul 2025 12:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oL40=2K=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ugjbd-0001b4-1k
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 12:38:57 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbd83f69-6c78-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 14:38:54 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1753792722718910.8697294354804;
 Tue, 29 Jul 2025 05:38:42 -0700 (PDT)
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
X-Inumbo-ID: fbd83f69-6c78-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1753792730; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jUvn/4I/UKj+65kgGq1WGB531RY2jZ/KSfWnGLXDZfMmqavynPVEokCg8eMZJEa6z6goIhOBW7ZfzMMSQXgOSeq/qwIdGR2wqHNEFyfWsTws1Q5CuFwJSO7ADrGSWVHR/Qats/QGE6UNx3uQqKT1ec7CmA4UwzryXXpBeWioAtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753792730; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NS0pDxgnTSZZgCV0PwFs1M3UFUq/7qlHpCNJ9dM8JHM=; 
	b=Vhhvei2GJQdRlKoLEDNHrCs309qy9Zj6582Z8gPibR/ZN7bCwqIIMOsym95t7eQqLMK6J5MAwYAQotkq6ejMBjhRtUbp02DNK+yiDv5g8Bl9jxs4uJ3w9jfnd3qmvoRqR5ijDPsvH6Y1DvxTLv+1SNKoW8UlgNddsdDkPl3rM74=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753792730;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NS0pDxgnTSZZgCV0PwFs1M3UFUq/7qlHpCNJ9dM8JHM=;
	b=QHWiQ73NBk3KuqCPqHw5BZ0KLtEb3BcAtBFTBOpB2MXvm9MVdW4HWT4q3Ft5xcjm
	TLX/C44J3ySEDAYODCA0QGEcQC0Uon70FAxuZql2+nsEWjfF+0reFFEdM/uHUVCnOiP
	I+nY41MyJKN/01rYKeSeZHas0KBjPVykle+l0tZY=
Date: Tue, 29 Jul 2025 08:38:42 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>
Message-ID: <19856313650.d0b02fed38477.5092861349645761382@apertussolutions.com>
In-Reply-To: <20250728175548.3199177-4-andrew.cooper3@citrix.com>
References: <20250728175548.3199177-1-andrew.cooper3@citrix.com> <20250728175548.3199177-4-andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] tools/flask: Reformat allow declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Mon, 28 Jul 2025 13:55:48 -0400 Andrew Cooper <andrew.cooper3@citrix.com> wrote ---

 > Having multiple values wrapped onto as few lines as practical is good for 
 > space efficiency, but causes complex collisions for hypercall backports and 
 > local policy changes.  Reformat to use one value per line. 
 >  
 > No functional change, only whitespace changes. 
 >  
 > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com> 
 > --- 
 > CC: Daniel P. Smith <dpsmith@apertussolutions.com> 
 > --- 
 >  tools/flask/policy/modules/dom0.te     | 122 ++++++++++--- 
 >  tools/flask/policy/modules/xen.if      | 241 +++++++++++++++++++++---- 
 >  tools/flask/policy/modules/xen.te      |  25 ++- 
 >  tools/flask/policy/modules/xenstore.te |   6 +- 
 >  4 files changed, 327 insertions(+), 67 deletions(-) 
 >  
 > diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te 
 > index ccadbd6469db..ad2b4f9ea75f 100644 
 > --- a/tools/flask/policy/modules/dom0.te 
 > +++ b/tools/flask/policy/modules/dom0.te 
 > @@ -7,23 +7,61 @@ 
 >  # 
 >  ################################################################################ 
 >  allow dom0_t xen_t:xen { 
 > -    settime tbufcontrol readconsole clearconsole perfcontrol mtrr_add 
 > -    mtrr_del mtrr_read microcode physinfo quirk writeconsole readapic 
 > -    writeapic privprofile nonprivprofile kexec firmware sleep frequency 
 > -    getidle debug getcpuinfo heap pm_op mca_op lockprof cpupool_op 
 > -    getscheduler setscheduler hypfs_op 
 > +    settime 
 > +    tbufcontrol 
 > +    readconsole 
 > +    clearconsole 
 > +    perfcontrol 
 > +    mtrr_add 
 > +    mtrr_del 
 > +    mtrr_read 
 > +    microcode 
 > +    physinfo 
 > +    quirk 
 > +    writeconsole 
 > +    readapic 
 > +    writeapic 
 > +    privprofile 
 > +    nonprivprofile 
 > +    kexec 
 > +    firmware 
 > +    sleep 
 > +    frequency 
 > +    getidle 
 > +    debug 
 > +    getcpuinfo 
 > +    heap 
 > +    pm_op 
 > +    mca_op 
 > +    lockprof 
 > +    cpupool_op 
 > +    getscheduler 
 > +    setscheduler 
 > +    hypfs_op 
 >  }; 
 >  allow dom0_t xen_t:xen2 { 
 > -    resource_op psr_cmt_op psr_alloc pmu_ctrl get_symbol 
 > -    get_cpu_levelling_caps get_cpu_featureset livepatch_op 
 > -    coverage_op get_dom0_console 
 > +    resource_op 
 > +    psr_cmt_op 
 > +    psr_alloc 
 > +    pmu_ctrl 
 > +    get_symbol 
 > +    get_cpu_levelling_caps 
 > +    get_cpu_featureset 
 > +    livepatch_op 
 > +    coverage_op 
 > +    get_dom0_console 
 >  }; 
 >  
 >  # Allow dom0 to use all XENVER_ subops that have checks. 
 >  # Note that dom0 is part of domain_type so this has duplicates. 
 >  allow dom0_t xen_t:version { 
 > -    xen_extraversion xen_compile_info xen_capabilities 
 > -    xen_changeset xen_pagesize xen_guest_handle xen_commandline 
 > +    xen_extraversion 
 > +    xen_compile_info 
 > +    xen_capabilities 
 > +    xen_changeset 
 > +    xen_pagesize 
 > +    xen_guest_handle 
 > +    xen_commandline 
 >      xen_build_id 
 >  }; 
 >  
 > @@ -32,41 +70,83 @@ allow dom0_t xen_t:mmu memorymap; 
 >  # Allow dom0 to use these domctls on itself. For domctls acting on other 
 >  # domains, see the definitions of create_domain and manage_domain. 
 >  allow dom0_t dom0_t:domain { 
 > -    setvcpucontext max_vcpus setaffinity getaffinity getscheduler 
 > -    getdomaininfo getvcpuinfo getvcpucontext setdomainmaxmem setdomainhandle 
 > -    setdebugging hypercall settime setaddrsize getaddrsize trigger 
 > -    getpodtarget setpodtarget getpagingmempool setpagingmempool set_misc_info 
 > +    setvcpucontext 
 > +    max_vcpus 
 > +    setaffinity 
 > +    getaffinity 
 > +    getscheduler 
 > +    getdomaininfo 
 > +    getvcpuinfo 
 > +    getvcpucontext 
 > +    setdomainmaxmem 
 > +    setdomainhandle 
 > +    setdebugging 
 > +    hypercall 
 > +    settime 
 > +    setaddrsize 
 > +    getaddrsize 
 > +    trigger 
 > +    getpodtarget 
 > +    setpodtarget 
 > +    getpagingmempool 
 > +    setpagingmempool 
 > +    set_misc_info 
 >      set_virq_handler 
 >  }; 
 >  allow dom0_t dom0_t:domain2 { 
 > -    set_cpu_policy gettsc settsc setscheduler set_vnumainfo 
 > -    get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy dt_overlay 
 > +    set_cpu_policy 
 > +    gettsc 
 > +    settsc 
 > +    setscheduler 
 > +    set_vnumainfo 
 > +    get_vnumainfo 
 > +    psr_cmt_op 
 > +    psr_alloc 
 > +    get_cpu_policy 
 > +    dt_overlay 
 >      get_domain_state 
 >  }; 
 > -allow dom0_t dom0_t:resource { add remove }; 
 > +allow dom0_t dom0_t:resource { 
 > +    add 
 > +    remove 
 > +}; 
 >  
 >  # These permissions allow using the FLASK security server to compute access 
 >  # checks locally, which could be used by a domain or service (such as xenstore) 
 >  # that does not have its own security server to make access decisions based on 
 >  # Xen's security policy. 
 >  allow dom0_t security_t:security { 
 > -    compute_av compute_create compute_member compute_relabel 
 > +    compute_av 
 > +    compute_create 
 > +    compute_member 
 > +    compute_relabel 
 >  }; 
 >  
 >  # Allow string/SID conversions (for "xl list -Z" and similar) 
 >  allow dom0_t security_t:security check_context; 
 >  
 >  # Allow flask-label-pci to add and change labels 
 > -allow dom0_t security_t:security { add_ocontext del_ocontext }; 
 > +allow dom0_t security_t:security { 
 > +    add_ocontext 
 > +    del_ocontext 
 > +}; 
 >  
 >  # Allow performance parameters of the security server to be tweaked 
 >  allow dom0_t security_t:security setsecparam; 
 >  
 >  # Allow changing the security policy 
 > -allow dom0_t security_t:security { load_policy setenforce setbool }; 
 > +allow dom0_t security_t:security { 
 > +    load_policy 
 > +    setenforce 
 > +    setbool 
 > +}; 
 >  
 >  # Audit policy change events even when they are allowed 
 > -auditallow dom0_t security_t:security { load_policy setenforce setbool }; 
 > +auditallow dom0_t security_t:security { 
 > +    load_policy 
 > +    setenforce 
 > +    setbool 
 > +}; 
 >  
 >  # Allow dom0 to report platform configuration changes back to the hypervisor 
 >  allow dom0_t xen_t:resource setup; 
 > diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if 
 > index cfa11b27b786..ef7d8f438c65 100644 
 > --- a/tools/flask/policy/modules/xen.if 
 > +++ b/tools/flask/policy/modules/xen.if 
 > @@ -6,9 +6,25 @@ 
 >  # 
 >  ################################################################################ 
 >  define(`declare_domain_common', ` 
 > -    allow $1 $2:grant { query setup }; 
 > -    allow $1 $2:mmu { adjust physmap map_read map_write stat pinpage updatemp mmuext_op }; 
 > -    allow $1 $2:hvm { getparam setparam altp2mhvm_op }; 
 > +    allow $1 $2:grant { 
 > +        query 
 > +        setup 
 > +    }; 
 > +    allow $1 $2:mmu { 
 > +        adjust 
 > +        physmap 
 > +        map_read 
 > +        map_write 
 > +        stat 
 > +        pinpage 
 > +        updatemp 
 > +        mmuext_op 
 > +    }; 
 > +    allow $1 $2:hvm { 
 > +        getparam 
 > +        setparam 
 > +        altp2mhvm_op 
 > +    }; 
 >      allow $1 $2:domain2 get_vnumainfo; 
 >  ') 
 >  
 > @@ -46,22 +62,65 @@ define(`declare_build_label', ` 
 >  ') 
 >  
 >  define(`create_domain_common', ` 
 > -    allow $1 $2:domain { create max_vcpus setdomainmaxmem setaddrsize 
 > -            getdomaininfo hypercall setvcpucontext getscheduler 
 > -            getvcpuinfo getaddrsize getaffinity setaffinity 
 > -            settime setdomainhandle getvcpucontext set_misc_info 
 > -            getpagingmempool setpagingmempool }; 
 > -    allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim 
 > -            set_vnumainfo get_vnumainfo cacheflush 
 > -            psr_cmt_op psr_alloc soft_reset 
 > -            resource_map get_cpu_policy vuart_op set_llc_colors 
 > -            get_domain_state }; 
 > +    allow $1 $2:domain { 
 > +        create 
 > +        max_vcpus 
 > +        setdomainmaxmem 
 > +        setaddrsize 
 > +        getdomaininfo 
 > +        hypercall 
 > +        setvcpucontext 
 > +        getscheduler 
 > +        getvcpuinfo 
 > +        getaddrsize 
 > +        getaffinity 
 > +        setaffinity 
 > +        settime 
 > +        setdomainhandle 
 > +        getvcpucontext 
 > +        set_misc_info 
 > +        getpagingmempool 
 > +        setpagingmempool 
 > +    }; 
 > +    allow $1 $2:domain2 { 
 > +        set_cpu_policy 
 > +        settsc 
 > +        setscheduler 
 > +        setclaim 
 > +        set_vnumainfo 
 > +        get_vnumainfo 
 > +        cacheflush 
 > +        psr_cmt_op 
 > +        psr_alloc 
 > +        soft_reset 
 > +        resource_map 
 > +        get_cpu_policy 
 > +        vuart_op 
 > +        set_llc_colors 
 > +        get_domain_state 
 > +    }; 
 >      allow $1 $2:security check_context; 
 >      allow $1 $2:shadow enable; 
 > -    allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp }; 
 > +    allow $1 $2:mmu { 
 > +        map_read 
 > +        map_write 
 > +        adjust 
 > +        memorymap 
 > +        physmap 
 > +        pinpage 
 > +        mmuext_op 
 > +        updatemp 
 > +    }; 
 >      allow $1 $2:grant setup; 
 > -    allow $1 $2:hvm { getparam hvmctl sethvmc 
 > -            setparam altp2mhvm altp2mhvm_op dm }; 
 > +    allow $1 $2:hvm { 
 > +        getparam 
 > +        hvmctl 
 > +        sethvmc 
 > +        setparam 
 > +        altp2mhvm 
 > +        altp2mhvm_op 
 > +        dm 
 > +    }; 
 >  ') 
 >  
 >  # xen_build_domain(target) 
 > @@ -91,11 +150,30 @@ define(`create_domain_build_label', ` 
 >  # manage_domain(priv, target) 
 >  #   Allow managing a running domain 
 >  define(`manage_domain', ` 
 > -    allow $1 $2:domain { getdomaininfo getvcpuinfo getaffinity 
 > -            getaddrsize pause unpause trigger shutdown destroy 
 > -            setaffinity setdomainmaxmem getscheduler resume 
 > -            setpodtarget getpodtarget getpagingmempool setpagingmempool }; 
 > -    allow $1 $2:domain2 { set_vnumainfo dt_overlay get_domain_state }; 
 > +    allow $1 $2:domain { 
 > +        getdomaininfo 
 > +        getvcpuinfo 
 > +        getaffinity 
 > +        getaddrsize 
 > +        pause 
 > +        unpause 
 > +        trigger 
 > +        shutdown 
 > +        destroy 
 > +        setaffinity 
 > +        setdomainmaxmem 
 > +        getscheduler 
 > +        resume 
 > +        setpodtarget 
 > +        getpodtarget 
 > +        getpagingmempool 
 > +        setpagingmempool 
 > +    }; 
 > +    allow $1 $2:domain2 { 
 > +        set_vnumainfo 
 > +        dt_overlay 
 > +        get_domain_state 
 > +    }; 
 >  ') 
 >  
 >  # migrate_domain_out(priv, target) 
 > @@ -103,11 +181,27 @@ define(`manage_domain', ` 
 >  #   (inbound migration is the same as domain creation) 
 >  define(`migrate_domain_out', ` 
 >      allow $1 domxen_t:mmu map_read; 
 > -    allow $1 $2:hvm { gethvmc getparam }; 
 > -    allow $1 $2:mmu { stat pageinfo map_read }; 
 > -    allow $1 $2:domain { getaddrsize getvcpucontext pause destroy }; 
 > +    allow $1 $2:hvm { 
 > +        gethvmc 
 > +        getparam 
 > +    }; 
 > +    allow $1 $2:mmu { 
 > +        stat 
 > +        pageinfo 
 > +        map_read 
 > +    }; 
 > +    allow $1 $2:domain { 
 > +        getaddrsize 
 > +        getvcpucontext 
 > +        pause 
 > +        destroy 
 > +    }; 
 >      allow $1 $2:domain2 gettsc; 
 > -    allow $1 $2:shadow { enable disable logdirty }; 
 > +    allow $1 $2:shadow { 
 > +        enable 
 > +        disable 
 > +        logdirty 
 > +    }; 
 >  ') 
 >  
 >  ################################################################################ 
 > @@ -120,8 +214,14 @@ define(`migrate_domain_out', ` 
 >  #   This allows an event channel to be created from domains with labels 
 >  #   <source> to <dest> and will label it <chan-label> 
 >  define(`create_channel', ` 
 > -    allow $1 $3:event { create send status }; 
 > -    allow $3 $2:event { bind }; 
 > +    allow $1 $3:event { 
 > +        create 
 > +        send 
 > +        status 
 > +    }; 
 > +    allow $3 $2:event { 
 > +        bind 
 > +    }; 
 >  ') 
 >  
 >  # domain_event_comms(dom1, dom2) 
 > @@ -135,8 +235,18 @@ define(`domain_event_comms', ` 
 >  #   Allow two domain types to communicate using grants and event channels 
 >  define(`domain_comms', ` 
 >      domain_event_comms($1, $2) 
 > -    allow $1 $2:grant { map_read map_write copy unmap }; 
 > -    allow $2 $1:grant { map_read map_write copy unmap }; 
 > +    allow $1 $2:grant { 
 > +        map_read 
 > +        map_write 
 > +        copy 
 > +        unmap 
 > +    }; 
 > +    allow $2 $1:grant { 
 > +        map_read 
 > +        map_write 
 > +        copy 
 > +        unmap 
 > +    }; 
 >  ') 
 >  
 >  # domain_self_comms(domain) 
 > @@ -144,7 +254,12 @@ define(`domain_comms', ` 
 >  #   and event channels 
 >  define(`domain_self_comms', ` 
 >      create_channel($1, $1_self, $1_channel) 
 > -    allow $1 $1_self:grant { map_read map_write copy unmap }; 
 > +    allow $1 $1_self:grant { 
 > +        map_read 
 > +        map_write 
 > +        copy 
 > +        unmap 
 > +    }; 
 >  ') 
 >  
 >  # device_model(dm_dom, hvm_dom) 
 > @@ -159,9 +274,23 @@ define(`device_model', ` 
 >      create_channel($2, $1, $2_channel) 
 >      allow $1 $2_channel:event create; 
 >  
 > -    allow $1 $2_target:domain { getdomaininfo shutdown }; 
 > -    allow $1 $2_target:mmu { map_read map_write adjust physmap target_hack }; 
 > -    allow $1 $2_target:hvm { getparam setparam hvmctl dm }; 
 > +    allow $1 $2_target:domain { 
 > +        getdomaininfo 
 > +        shutdown 
 > +    }; 
 > +    allow $1 $2_target:mmu { 
 > +        map_read 
 > +        map_write 
 > +        adjust 
 > +        physmap 
 > +        target_hack 
 > +    }; 
 > +    allow $1 $2_target:hvm { 
 > +        getparam 
 > +        setparam 
 > +        hvmctl 
 > +        dm 
 > +    }; 
 >      allow $1 $2_target:domain2 resource_map; 
 >  ') 
 >  
 > @@ -184,7 +313,10 @@ define(`make_device_model', ` 
 >  define(`use_device_iommu', ` 
 >      allow $1 $1_self:mmu exchange; 
 >      allow $1 $2:resource use_iommu; 
 > -    allow $1 domio_t:mmu { map_read map_write }; 
 > +    allow $1 domio_t:mmu { 
 > +        map_read 
 > +        map_write 
 > +    }; 
 >  ') 
 >  
 >  # use_device_iommu_nointremap(domain, device) 
 > @@ -194,8 +326,14 @@ define(`use_device_iommu', ` 
 >  #   Allows acceptance of (typically older) less isolating hardware. 
 >  define(`use_device_iommu_nointremap', ` 
 >      allow $1 $1_self:mmu exchange; 
 > -    allow $1 $2:resource { use_iommu use_iommu_nointremap }; 
 > -    allow $1 domio_t:mmu { map_read map_write }; 
 > +    allow $1 $2:resource { 
 > +        use_iommu 
 > +        use_iommu_nointremap 
 > +    }; 
 > +    allow $1 domio_t:mmu { 
 > +        map_read 
 > +        map_write 
 > +    }; 
 >  ') 
 >  
 >  # use_device_noiommu(domain, device) 
 > @@ -203,14 +341,34 @@ define(`use_device_iommu_nointremap', ` 
 >  #   even without an IOMMU available. 
 >  define(`use_device_noiommu', ` 
 >      allow $1 $1_self:mmu exchange; 
 > -    allow $1 $2:resource { use_iommu use_iommu_nointremap use_noiommu }; 
 > -    allow $1 domio_t:mmu { map_read map_write }; 
 > +    allow $1 $2:resource { 
 > +        use_iommu 
 > +        use_iommu_nointremap 
 > +        use_noiommu 
 > +    }; 
 > +    allow $1 domio_t:mmu { 
 > +        map_read 
 > +        map_write 
 > +    }; 
 >  ') 
 >  
 >  # admin_device(domain, device) 
 >  #   Allow a device to be used and delegated by a domain 
 >  define(`admin_device', ` 
 > -    allow $1 $2:resource { setup stat_device add_device add_irq add_iomem add_ioport remove_device remove_irq remove_iomem remove_ioport plug unplug }; 
 > +    allow $1 $2:resource { 
 > +        setup 
 > +        stat_device 
 > +        add_device 
 > +        add_irq 
 > +        add_iomem 
 > +        add_ioport 
 > +        remove_device 
 > +        remove_irq 
 > +        remove_iomem 
 > +        remove_ioport 
 > +        plug 
 > +        unplug 
 > +    }; 
 >      allow $1 $2:hvm bind_irq; 
 >      use_device_noiommu($1, $2) 
 >  ') 
 > @@ -218,5 +376,8 @@ define(`admin_device', ` 
 >  # delegate_devices(priv-domain, target-domain) 
 >  #   Allow devices to be delegated 
 >  define(`delegate_devices', ` 
 > -    allow $1 $2:resource { add remove }; 
 > +    allow $1 $2:resource { 
 > +        add 
 > +        remove 
 > +    }; 
 >  ') 
 > diff --git a/tools/flask/policy/modules/xen.te b/tools/flask/policy/modules/xen.te 
 > index de98206fdd89..1427f81b0d7b 100644 
 > --- a/tools/flask/policy/modules/xen.te 
 > +++ b/tools/flask/policy/modules/xen.te 
 > @@ -52,7 +52,11 @@ type device_t, resource_type; 
 >  
 >  # Domain destruction can result in some access checks for actions performed by 
 >  # the hypervisor.  These should always be allowed. 
 > -allow xen_t resource_type : resource { remove_irq remove_ioport remove_iomem }; 
 > +allow xen_t resource_type : resource { 
 > +    remove_irq 
 > +    remove_ioport 
 > +    remove_iomem 
 > +}; 
 >  
 >  ################################################################################ 
 >  # 
 > @@ -65,15 +69,26 @@ allow xen_t resource_type : resource { remove_irq remove_ioport remove_iomem }; 
 >  ################################################################################ 
 >  
 >  # Domains must be declared using domain_type 
 > -neverallow * ~domain_type:domain { create transition }; 
 > +neverallow * ~domain_type:domain { 
 > +    create 
 > +    transition 
 > +}; 
 >  
 >  # Resources must be declared using resource_type 
 > -neverallow * ~resource_type:resource { use use_iommu use_iommu_nointremap 
 > -                                       use_noiommu }; 
 > +neverallow * ~resource_type:resource { 
 > +    use 
 > +    use_iommu 
 > +    use_iommu_nointremap 
 > +    use_noiommu 
 > +}; 
 >  
 >  # Events must use event_type (see create_channel for a template) 
 >  neverallow ~event_type *:event bind; 
 > -neverallow * ~event_type:event { create send status }; 
 > +neverallow * ~event_type:event { 
 > +    create 
 > +    send 
 > +    status 
 > +}; 
 >  
 >  ################################################################################ 
 >  # 
 > diff --git a/tools/flask/policy/modules/xenstore.te b/tools/flask/policy/modules/xenstore.te 
 > index 49de53ebe2a5..776c2748698e 100644 
 > --- a/tools/flask/policy/modules/xenstore.te 
 > +++ b/tools/flask/policy/modules/xenstore.te 
 > @@ -19,7 +19,11 @@ allow xenstore_t domain_type:domain2 get_domain_state; 
 >  # rule between xenstore_t and every domain type that talks to xenstore 
 >  create_channel(xenstore_t, domain_type, xenstore_t_channel) 
 >  allow event_type xenstore_t: event bind; 
 > -allow xenstore_t domain_type:grant { map_read map_write unmap }; 
 > +allow xenstore_t domain_type:grant { 
 > +    map_read 
 > +    map_write 
 > +    unmap 
 > +}; 
 >  
 >  # Xenstore is a utility domain, so it should use the system role 
 >  role system_r types xenstore_t; 
 > -- 
 > 2.39.5 
 >  
 > 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

