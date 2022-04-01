Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104EC4EEE41
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 15:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297391.506577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHRd-0001Zc-9P; Fri, 01 Apr 2022 13:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297391.506577; Fri, 01 Apr 2022 13:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHRd-0001XI-6R; Fri, 01 Apr 2022 13:36:05 +0000
Received: by outflank-mailman (input) for mailman id 297391;
 Fri, 01 Apr 2022 13:36:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naHRb-0001XC-Lj
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 13:36:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naHRY-0005pt-Oa; Fri, 01 Apr 2022 13:36:00 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naHRY-0003Qj-IB; Fri, 01 Apr 2022 13:36:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=VEyII3VL7hdfsz6IMAVFET3sFlCb63Q4mu9gWhPMCEs=; b=eOB7OmJD3jRjo+TjhgcneR/Lnu
	YrG3mCx6N3qA8n7oG5QB8tO0gi9/S8Ev7nE23Gmkv4z0RfPrdDfmx9cRcoNfDdG8Lj52vjl6ph+KI
	iR87iEd9MB06io/diD4iIY35yrFzWe8/MjmBYmO3aXs1ThUAlVM/WYspeEVTxeX6TGOk=;
Message-ID: <57312254-b599-6de5-04aa-f88907c49163@xen.org>
Date: Fri, 1 Apr 2022 14:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
 <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
 <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 01/04/2022 11:46, Juergen Gross wrote:
> On 01.04.22 12:21, Julien Grall wrote:
>> Hi,
>>
>> I have posted some comments in v3 after you sent this version. Please 
>> have a look.
>>
>> On 01/04/2022 01:38, Stefano Stabellini wrote:
>>> +static int init_domain(struct xs_handle *xsh, libxl_dominfo *info)
>>> +{
>>> +    struct xc_interface_core *xch;
>>> +    libxl_uuid uuid;
>>> +    uint64_t xenstore_evtchn, xenstore_pfn;
>>> +    int rc;
>>> +
>>> +    printf("Init dom0less domain: %u\n", info->domid);
>>> +    xch = xc_interface_open(0, 0, 0);
>>> +
>>> +    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
>>> +                          &xenstore_evtchn);
>>> +    if (rc != 0) {
>>> +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
>>> +        return 1;
>>> +    }
>>> +
>>> +    /* Alloc xenstore page */
>>> +    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
>>> +        printf("Error on alloc magic pages\n");
>>> +        return 1;
>>> +    }
>>> +
>>> +    rc = xc_dom_gnttab_seed(xch, info->domid, true,
>>> +                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
>>> +    if (rc)
>>> +        err(1, "xc_dom_gnttab_seed");
>>> +
>>> +    libxl_uuid_generate(&uuid);
>>> +    xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
>>> +
>>> +    rc = gen_stub_json_config(info->domid, &uuid);
>>> +    if (rc)
>>> +        err(1, "gen_stub_json_config");
>>> +
>>> +    /* Now everything is ready: set HVM_PARAM_STORE_PFN */
>>> +    rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
>>> +                          xenstore_pfn);
>>
>> On patch #1, you told me you didn't want to allocate the page in Xen 
>> because it wouldn't be initialized by Xenstored. But this is what we 
>> are doing here.
> 
> Xenstore (at least the C variant) is only using the fixed grant ref
> GNTTAB_RESERVED_XENSTORE, so it doesn't need the page to be advertised
> to the guest. And the mapping is done only when the domain is being
> introduced to Xenstore.

And we don't expect the guest to use the grant entry to find the 
xenstore page?
> 
>>
>> This would be a problem if Linux is still booting and hasn't yet call 
>> xenbus_probe_initcall().
>>
>> I understand we need to have the page setup before raising the event 
>> channel. I don't think we can allow Xenstored to set the HVM_PARAM (it 
>> may run in a domain with less privilege). So I think we may need to 
>> create a separate command to kick the client (not great).
>>
>> Juergen, any thoughts?
> 
> I think it should work like that:
> 
> - setup the grant via xc_dom_gnttab_seed()
> - introduce the domain to Xenstore
> - call xc_hvm_param_set()
> 
> When the guest is receiving the event, it should wait for the xenstore
> page to appear.
IIUC, this would mean the guest would need to do some sort of busy loop 
until the xenstore page to appear.

If so, this doesn't sound great to me. I think it would be better to 
have a flag in the page to indicate whether the page is not ready.

Xenstored could then clear the flag before raising the event channel.

Cheers,

-- 
Julien Grall

