Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236FF19395A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 08:09:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHMbi-0002CE-MB; Thu, 26 Mar 2020 07:07:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHMbh-0002C9-8q
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 07:07:13 +0000
X-Inumbo-ID: 6a15df56-6f30-11ea-875b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a15df56-6f30-11ea-875b-12813bfff9fa;
 Thu, 26 Mar 2020 07:07:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB258ABE7;
 Thu, 26 Mar 2020 07:07:10 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c88f7cac-9990-957d-746b-fc60040c4c59@suse.com>
Date: Thu, 26 Mar 2020 08:07:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325154702.GD28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 16:47, Roger Pau Monné wrote:
> On Mon, Mar 23, 2020 at 10:04:35AM -0700, Tamas K Lengyel wrote:
>> +static int copy_vcpu_settings(struct domain *cd, struct domain *d)
>> +{
>> +    unsigned int i;
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
>> +    int ret = -EINVAL;
>> +
>> +    for ( i = 0; i < cd->max_vcpus; i++ )
>> +    {
>> +        const struct vcpu *d_vcpu = d->vcpu[i];
>> +        struct vcpu *cd_vcpu = cd->vcpu[i];
>> +        struct vcpu_runstate_info runstate;
>> +        mfn_t vcpu_info_mfn;
>> +
>> +        if ( !d_vcpu || !cd_vcpu )
>> +            continue;
>> +
>> +        /*
>> +         * Copy & map in the vcpu_info page if the guest uses one
>> +         */
>> +        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
>> +        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
>> +        {
>> +            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
>> +
>> +            /*
>> +             * Allocate & map the page for it if it hasn't been already
>> +             */
>> +            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
>> +            {
>> +                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
>> +                unsigned long gfn_l = gfn_x(gfn);
>> +                struct page_info *page;
>> +
>> +                if ( !(page = alloc_domheap_page(cd, 0)) )
>> +                    return -ENOMEM;
>> +
>> +                new_vcpu_info_mfn = page_to_mfn(page);
>> +                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
>> +
>> +                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn, PAGE_ORDER_4K,
>> +                                     p2m_ram_rw, p2m->default_access, -1);
>> +                if ( ret )
>> +                    return ret;
>> +
>> +                ret = map_vcpu_info(cd_vcpu, gfn_l,
>> +                                    d_vcpu->vcpu_info_offset);
>> +                if ( ret )
>> +                    return ret;
>> +            }
>> +
>> +            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
>> +        }
>> +
>> +        /*
>> +         * Setup the vCPU runstate area
>> +         */
>> +        if ( guest_handle_is_null(runstate_guest(cd_vcpu)) )
> 
> Maybe I'm confused, but isn't this the other way around and you need
> to check? If the parent runstate is not null copy it to the fork,
> ie:
> 
> if ( !guest_handle_is_null(runstate_guest(d_vcpu)) )
> {
>     ...
> 
>> +        {
>> +            runstate_guest(cd_vcpu) = runstate_guest(d_vcpu);
>> +            vcpu_runstate_get(cd_vcpu, &runstate);
>> +            __copy_to_guest(runstate_guest(cd_vcpu), &runstate, 1);
> 
> You should check the return code I think.

I don't think so - this is a best effort operation just like e.g.
in the handling of VCPUOP_register_runstate_memory_area.

Jan

