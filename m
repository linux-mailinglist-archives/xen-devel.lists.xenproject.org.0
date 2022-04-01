Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACD44EEB30
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 12:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297303.506390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEPR-0008L4-FZ; Fri, 01 Apr 2022 10:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297303.506390; Fri, 01 Apr 2022 10:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEPR-0008IU-B7; Fri, 01 Apr 2022 10:21:37 +0000
Received: by outflank-mailman (input) for mailman id 297303;
 Fri, 01 Apr 2022 10:21:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naEPP-0008IO-F2
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 10:21:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naEPO-0002UO-Dk; Fri, 01 Apr 2022 10:21:34 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naEPO-0006XR-72; Fri, 01 Apr 2022 10:21:34 +0000
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
	bh=WY7qYO4qwmcmb1mZ8BPp1zRbDkGk/TofJiVnNMkVnpQ=; b=lUvagXL9veQPFa+bKF8j6DTWiD
	eo8uMoEmbljjrPqQ+oYaDtNPvMmdj+aw1JSPWJ/NjUlm9CFgnXAed8NM7Gs+7C9CGBQlOR2cep4qf
	Arf6nJmmxPIOfdAdj7I5Ecac6T+bSvXRiG097Fvmp4U6d2431A26DtZJjovNuF6qi6YQ=;
Message-ID: <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org>
Date: Fri, 1 Apr 2022 11:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-8-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220401003847.38393-8-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have posted some comments in v3 after you sent this version. Please 
have a look.

On 01/04/2022 01:38, Stefano Stabellini wrote:
> +static int init_domain(struct xs_handle *xsh, libxl_dominfo *info)
> +{
> +    struct xc_interface_core *xch;
> +    libxl_uuid uuid;
> +    uint64_t xenstore_evtchn, xenstore_pfn;
> +    int rc;
> +
> +    printf("Init dom0less domain: %u\n", info->domid);
> +    xch = xc_interface_open(0, 0, 0);
> +
> +    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_STORE_EVTCHN,
> +                          &xenstore_evtchn);
> +    if (rc != 0) {
> +        printf("Failed to get HVM_PARAM_STORE_EVTCHN\n");
> +        return 1;
> +    }
> +
> +    /* Alloc xenstore page */
> +    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
> +        printf("Error on alloc magic pages\n");
> +        return 1;
> +    }
> +
> +    rc = xc_dom_gnttab_seed(xch, info->domid, true,
> +                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
> +    if (rc)
> +        err(1, "xc_dom_gnttab_seed");
> +
> +    libxl_uuid_generate(&uuid);
> +    xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
> +
> +    rc = gen_stub_json_config(info->domid, &uuid);
> +    if (rc)
> +        err(1, "gen_stub_json_config");
> +
> +    /* Now everything is ready: set HVM_PARAM_STORE_PFN */
> +    rc = xc_hvm_param_set(xch, info->domid, HVM_PARAM_STORE_PFN,
> +                          xenstore_pfn);

On patch #1, you told me you didn't want to allocate the page in Xen 
because it wouldn't be initialized by Xenstored. But this is what we are 
doing here.

This would be a problem if Linux is still booting and hasn't yet call 
xenbus_probe_initcall().

I understand we need to have the page setup before raising the event 
channel. I don't think we can allow Xenstored to set the HVM_PARAM (it 
may run in a domain with less privilege). So I think we may need to 
create a separate command to kick the client (not great).

Juergen, any thoughts?

Cheers,

-- 
Julien Grall

