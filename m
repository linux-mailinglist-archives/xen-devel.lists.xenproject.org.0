Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06848A9704
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 12:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708191.1106848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOjZ-0006cX-Ni; Thu, 18 Apr 2024 10:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708191.1106848; Thu, 18 Apr 2024 10:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOjZ-0006ax-Kx; Thu, 18 Apr 2024 10:11:13 +0000
Received: by outflank-mailman (input) for mailman id 708191;
 Thu, 18 Apr 2024 10:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/a5=LX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rxOjX-0006ZW-Gq
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 10:11:11 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f999d851-fd6b-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 12:11:09 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5a49261093cso357194eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 03:11:09 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i15-20020ac8488f000000b00436a8ee913csm521231qtq.41.2024.04.18.03.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 03:11:07 -0700 (PDT)
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
X-Inumbo-ID: f999d851-fd6b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713435068; x=1714039868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ptKjCsIFTUGRg1SU1EIDVHYctIZTxqcYQ/g95XWh3Ww=;
        b=PJKN5QA2HAKa64rQyGxITl/eSbTky+o5w1XLEIoxveDtWGKja7so3BfjIkHVGvKJ2V
         LHGXoIbBuDnv8GbGuIMpZB5LgDV3SHJJe/XPkRv50czpVIcke4csI7VlZnCFkTOXBOIw
         Gf/sRaH+bNp5U1uUazQBkfABYC+IutPQQGM8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713435068; x=1714039868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptKjCsIFTUGRg1SU1EIDVHYctIZTxqcYQ/g95XWh3Ww=;
        b=ltb0X1VkEnbGxWY7W4AimsDSRPe1xQ5RVedbSygVcNtKQZxu0K2eWcfHhAikzyq48S
         0gJvrA7hKwUSBsXkwEiMVOuXGJdnsfPedpfzGh+s48q3KAD1fvdRdf7HKkbbs0uXVkm5
         61FSrF1t2tZQJkWMz/JhCc7dofPXxTkAtsH2ZXyWqJWqkNpd+/VSRKNuYxIhTGbYfVH/
         9ObcUwGyIjt7Kw0JbMjBYkS8PsGwqvIhfrHxiQqiXFJDUHwzSxDiZkjiq1bg3yWsEdaG
         4EHoL01LAWDA1e2jb9Ma1WEYQpGLmzX81nhU5+6gtmK4Yyv1zjRgcdkLfk/V9Trqylsj
         btIA==
X-Gm-Message-State: AOJu0YxIzJ4YulSC73jwuzTaBAt8IKNUBSpoYD+q0Ynm0KXFF9tmj4j6
	1sdqCnaoOdgU2z68SJdy0WBBmpmADtHTEC/MefkzZty5hidsykF/S8ktB2in8PTYIY0OoHIEZpM
	8+lY=
X-Google-Smtp-Source: AGHT+IHsl8O6jMO4XSDw2U5pyaQHuUT86K5NAhokWp3CLKbCNPiqnEmy2lDiC+i7yNmm1kFCUFaaCw==
X-Received: by 2002:a05:6358:6997:b0:187:1a77:f1c1 with SMTP id a23-20020a056358699700b001871a77f1c1mr2703345rwi.28.1713435067984;
        Thu, 18 Apr 2024 03:11:07 -0700 (PDT)
Message-ID: <523141f8-7341-492f-b8dd-a4eb36f5444f@citrix.com>
Date: Thu, 18 Apr 2024 11:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/xlat: Sort out whitespace
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Julien Grall <julien@xen.org>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
 <20240415154155.2718064-2-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2404151449240.997881@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2404151449240.997881@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/04/2024 10:49 pm, Stefano Stabellini wrote:
> On Mon, 15 Apr 2024, Andrew Cooper wrote:
>>  * Fix tabs/spaces mismatch for certain rows
>>  * Insert lines between header files to improve legibility
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> ---
>>  xen/include/xlat.lst | 31 +++++++++++++++++++++++++++----
>>  1 file changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
>> index 9c41948514bf..e811342bb096 100644
>> --- a/xen/include/xlat.lst
>> +++ b/xen/include/xlat.lst
>> @@ -20,19 +20,24 @@
>>  # First column indicator:
>>  # ! - needs translation
>>  # ? - needs checking
>> +
>>  ?	dom0_vga_console_info		xen.h
>>  ?	xenctl_bitmap			xen.h
>>  ?	mmu_update			xen.h
>>  !	mmuext_op			xen.h
>>  !	start_info			xen.h
>>  ?	vcpu_time_info			xen.h
>> +
>>  ?	pmu_amd_ctxt			arch-x86/pmu.h
>>  ?	pmu_arch			arch-x86/pmu.h
>>  ?	pmu_cntr_pair			arch-x86/pmu.h
>>  ?	pmu_intel_ctxt			arch-x86/pmu.h
>>  ?	pmu_regs			arch-x86/pmu.h
>> +
>>  !	cpu_user_regs			arch-x86/xen-@arch@.h
>> +
>>  !	trap_info			arch-x86/xen.h
>> +
>>  ?	cpu_offline_action		arch-x86/xen-mca.h
>>  ?	mc				arch-x86/xen-mca.h
>>  ?	mcinfo_bank			arch-x86/xen-mca.h
>> @@ -50,6 +55,7 @@
>>  ?	mc_notifydomain			arch-x86/xen-mca.h
>>  !	mc_physcpuinfo			arch-x86/xen-mca.h
>>  ?	page_offline_action		arch-x86/xen-mca.h
>> +
>>  ?	argo_addr			argo.h
>>  !	argo_iov			argo.h
>>  ?	argo_register_ring		argo.h
>> @@ -59,6 +65,7 @@
>>  ?	argo_ring_message_header	argo.h
>>  ?	argo_send_addr			argo.h
>>  ?	argo_unregister_ring		argo.h
>> +
>>  ?	evtchn_alloc_unbound		event_channel.h
>>  ?	evtchn_bind_interdomain		event_channel.h
>>  ?	evtchn_bind_ipi			event_channel.h
>> @@ -74,6 +81,7 @@
>>  ?	evtchn_set_priority		event_channel.h
>>  ?	evtchn_status			event_channel.h
>>  ?	evtchn_unmask			event_channel.h
>> +
>>  ?	gnttab_cache_flush		grant_table.h
>>  !	gnttab_copy			grant_table.h
>>  ?	gnttab_dump_table		grant_table.h
>> @@ -86,9 +94,10 @@
>>  ?	gnttab_get_version		grant_table.h
>>  !	gnttab_get_status_frames	grant_table.h
>>  ?	grant_entry_v1			grant_table.h
>> -?       grant_entry_header              grant_table.h
>> +?	grant_entry_header		grant_table.h
>>  ?	grant_entry_v2			grant_table.h
>>  ?	gnttab_swap_grant_ref		grant_table.h
>> +
>>  !	dm_op_buf			hvm/dm_op.h
>>  ?	dm_op_create_ioreq_server	hvm/dm_op.h
>>  ?	dm_op_destroy_ioreq_server	hvm/dm_op.h
>> @@ -108,15 +117,20 @@
>>  ?	dm_op_set_pci_intx_level	hvm/dm_op.h
>>  ?	dm_op_set_pci_link_route	hvm/dm_op.h
>>  ?	dm_op_track_dirty_vram		hvm/dm_op.h
>> +
>>  !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op.h
>> +
>>  ?	vcpu_hvm_context		hvm/hvm_vcpu.h
>>  ?	vcpu_hvm_x86_32			hvm/hvm_vcpu.h
>>  ?	vcpu_hvm_x86_64			hvm/hvm_vcpu.h
>> +
>>  ?	hypfs_direntry			hypfs.h
>>  ?	hypfs_dirlistentry		hypfs.h
>> +
>>  ?	kexec_exec			kexec.h
>>  !	kexec_image			kexec.h
>>  !	kexec_range			kexec.h
>> +
>>  !	add_to_physmap			memory.h
>>  !	add_to_physmap_batch		memory.h
>>  !	foreign_memory_map		memory.h
>> @@ -130,6 +144,7 @@
>>  !	reserved_device_memory_map	memory.h
>>  ?	vmemrange			memory.h
>>  !	vnuma_topology_info		memory.h
>> +
>>  ?	physdev_eoi			physdev.h
>>  ?	physdev_get_free_pirq		physdev.h
>>  ?	physdev_irq			physdev.h
>> @@ -143,6 +158,7 @@
>>  ?	physdev_restore_msi		physdev.h
>>  ?	physdev_set_iopl		physdev.h
>>  ?	physdev_setup_gsi		physdev.h
>> +
>>  !	pct_register			platform.h
>>  !	power_register			platform.h
>>  ?	processor_csd			platform.h
>> @@ -158,23 +174,30 @@
>>  ?	xenpf_pcpu_version		platform.h
>>  ?	xenpf_resource_entry		platform.h
>>  ?	xenpf_ucode_revision		platform.h
>> +
>>  ?	pmu_data			pmu.h
>>  ?	pmu_params			pmu.h
>> +
>>  !	sched_poll			sched.h
>>  ?	sched_pin_override		sched.h
>>  ?	sched_remote_shutdown		sched.h
>>  ?	sched_shutdown			sched.h
>> +
>>  ?	t_buf				trace.h
>> +
>>  ?	vcpu_get_physid			vcpu.h
>>  ?	vcpu_register_vcpu_info		vcpu.h
>>  !	vcpu_runstate_info		vcpu.h
>>  ?	vcpu_set_periodic_timer		vcpu.h
>>  !	vcpu_set_singleshot_timer	vcpu.h
>> -?	build_id                        version.h
>> -?	compile_info                    version.h
>> -?	feature_info                    version.h
>> +
>> +?	build_id			version.h
> This is misaligned after this patch. You might want to fix this on
> commit.
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, but what's misaligned about it?

This is one line where there was a space/tabs mismatch before, which has
been corrected.

This is what cat -A thinks of the delta.

 !^Ivcpu_set_singleshot_timer^Ivcpu.h$
-?^Ibuild_id                        version.h$
-?^Icompile_info                    version.h$
-?^Ifeature_info                    version.h$
+$
+?^Ibuild_id^I^I^Iversion.h$
+?^Icompile_info^I^I^Iversion.h$
+?^Ifeature_info^I^I^Iversion.h$
+$
 ?^Ixenoprof_init^I^I^Ixenoprof.h$

~Andrew

