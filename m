Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F5244CC50
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 23:15:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224488.387787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkvrL-0005FH-Of; Wed, 10 Nov 2021 22:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224488.387787; Wed, 10 Nov 2021 22:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkvrL-0005DV-LR; Wed, 10 Nov 2021 22:14:23 +0000
Received: by outflank-mailman (input) for mailman id 224488;
 Wed, 10 Nov 2021 22:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8kS=P5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mkvrK-0005DP-UN
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 22:14:23 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dc7e621-4273-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 23:14:21 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id v11so16352745edc.9
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 14:14:21 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k23sm551375edv.22.2021.11.10.14.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 14:14:20 -0800 (PST)
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
X-Inumbo-ID: 8dc7e621-4273-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UAiXr5A00XmjUQrBx+VVC7ASne0hspgVd9kPtPcpw5Q=;
        b=LjnOArbjpoQ6zS9yaoJ2hdaftwPip6qOBjbbhBws9AxukEdhMmgXaZDvyu/esokvWq
         zSJWS4JS38i2l92pto4dpesoalYPPu4oiUg1kuRK51XDdaP6iN9KMDZNRl1iwq/alvvS
         1PaJzS5uyTiN6KzsfNElg7m2M1uNPX7XFh/VuOUnw8jHAxxezbE2c1VcEqmxt0pERnRX
         ALDmpljTuuFR/0URg0ncgIKthhWe0CnrMtyJdvwpO1lf0pRDWsr3oox88HWkQGSKFPhX
         m9YBxQNcvux3UNBj3QcKJWBJlRXLaCMx4aSHqKJhxx+S+eY46tM6KyYSM7nY1GtKmZU8
         kizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UAiXr5A00XmjUQrBx+VVC7ASne0hspgVd9kPtPcpw5Q=;
        b=19X+TXdf2KhiYkMXrX0q0G9ghtR74Mfx9ny/nfMCg4kcUgftOfyc6Qq7S7RJjRWjIr
         DVk1EfJumJlFGx8c2WGrC+hujUSO0yiZ2bgeAwcCmqmA13Sgdzg7fIR8vv8AAIpIZ9aQ
         Qtvh0GHE6Nr657xP83sG+avdb+9g5Ow7w56L2d+8l6NIMRsfyg9vznuXU4z2nBr+71rj
         PfPTP/htwBrg3mujdm+wOtc+uKGYq7Xo0DSzwbzct1zZbuXqqX2RxamwbWvf2NdNHOmv
         RV+O9qTzYRzPK2htLov7Sdwg87FTqg9qITV7E+0I+0bXURdehFc/vWEpLpaLU8gwz4hY
         6Icg==
X-Gm-Message-State: AOAM532+5CnM7Yh2wNW/xpxRi+VPcZKlSVhgX80NiLL6ahCDi2MhmV/m
	GlZI3/f8QOGl2c91L7OINck=
X-Google-Smtp-Source: ABdhPJwOx7mV7m0UnYBvVcEebFM8Iy5CbeArcA13YswBqi3czGpYyjAVSPWgDUVZrOFBSKbLrJqJjg==
X-Received: by 2002:a17:906:58c6:: with SMTP id e6mr3154447ejs.524.1636582460610;
        Wed, 10 Nov 2021 14:14:20 -0800 (PST)
Subject: Re: [PATCH V2 2/4] arm/xen: Switch to use
 gnttab_setup_auto_xlat_frames() for DT
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Russell King <linux@armlinux.org.uk>, Julien Grall <julien@xen.org>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110271754400.20134@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <60cc5b07-5935-aa26-8690-353c779bbab5@gmail.com>
Date: Thu, 11 Nov 2021 00:14:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110271754400.20134@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 28.10.21 04:28, Stefano Stabellini wrote:

Hi Stefano

I am sorry for the late response.

> On Tue, 26 Oct 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Read the start address of the grant table space from DT
>> (region 0).
>>
>> This patch mostly restores behaviour before commit 3cf4095d7446
>> ("arm/xen: Use xen_xlate_map_ballooned_pages to setup grant table")
>> but trying not to break the ACPI support added after that commit.
>> So the patch touches DT part only and leaves the ACPI part with
>> xen_xlate_map_ballooned_pages().
>>
>> This is a preparation for using Xen extended region feature
>> where unused regions of guest physical address space (provided
>> by the hypervisor) will be used to create grant/foreign/whatever
>> mappings instead of wasting real RAM pages from the domain memory
>> for establishing these mappings.
>>
>> The immediate benefit of this change:
>> - Avoid superpage shattering in Xen P2M when establishing
>>    stage-2 mapping (GFN <-> MFN) for the grant table space
>> - Avoid wasting real RAM pages (reducing the amount of memory
>>    usuable) for mapping grant table space
>> - The grant table space is always mapped at the exact
>>    same place (region 0 is reserved for the grant table)
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> Changes RFC -> V2:
>>     - new patch
>> ---
>>   arch/arm/xen/enlighten.c | 32 +++++++++++++++++++++++++-------
>>   1 file changed, 25 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
>> index 7f1c106b..dea46ec 100644
>> --- a/arch/arm/xen/enlighten.c
>> +++ b/arch/arm/xen/enlighten.c
>> @@ -59,6 +59,9 @@ unsigned long xen_released_pages;
>>   struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
>>   
>>   static __read_mostly unsigned int xen_events_irq;
>> +static phys_addr_t xen_grant_frames;
> __read_mostly

ok


>
>
>> +#define GRANT_TABLE_INDEX   0
>>   
>>   uint32_t xen_start_flags;
>>   EXPORT_SYMBOL(xen_start_flags);
>> @@ -303,6 +306,7 @@ static void __init xen_acpi_guest_init(void)
>>   static void __init xen_dt_guest_init(void)
>>   {
>>   	struct device_node *xen_node;
>> +	struct resource res;
>>   
>>   	xen_node = of_find_compatible_node(NULL, NULL, "xen,xen");
>>   	if (!xen_node) {
>> @@ -310,6 +314,12 @@ static void __init xen_dt_guest_init(void)
>>   		return;
>>   	}
>>   
>> +	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
>> +		pr_err("Xen grant table region is not found\n");
>> +		return;
>> +	}
>> +	xen_grant_frames = res.start;
>> +
>>   	xen_events_irq = irq_of_parse_and_map(xen_node, 0);
>>   }
>>   
>> @@ -317,16 +327,20 @@ static int __init xen_guest_init(void)
>>   {
>>   	struct xen_add_to_physmap xatp;
>>   	struct shared_info *shared_info_page = NULL;
>> -	int cpu;
>> +	int rc, cpu;
>>   
>>   	if (!xen_domain())
>>   		return 0;
>>   
>>   	if (!acpi_disabled)
>>   		xen_acpi_guest_init();
>> -	else
>> +	else {
>>   		xen_dt_guest_init();
>>   
>> +		if (!xen_grant_frames)
>> +			return -ENODEV;
> maybe we can avoid this, see below
>
>
>> +	}
>> +
>>   	if (!xen_events_irq) {
>>   		pr_err("Xen event channel interrupt not found\n");
>>   		return -ENODEV;
>> @@ -370,12 +384,16 @@ static int __init xen_guest_init(void)
>>   	for_each_possible_cpu(cpu)
>>   		per_cpu(xen_vcpu_id, cpu) = cpu;
>>   
>> -	xen_auto_xlat_grant_frames.count = gnttab_max_grant_frames();
>> -	if (xen_xlate_map_ballooned_pages(&xen_auto_xlat_grant_frames.pfn,
>> -					  &xen_auto_xlat_grant_frames.vaddr,
>> -					  xen_auto_xlat_grant_frames.count)) {
>> +	if (!acpi_disabled) {
> To make the code more resilient couldn't we do:
>
> if (!acpi_disabled || !xen_grant_frames) {
I think, we can.

On the one hand, indeed the code more resilient and less change.
 From the other hand if grant table region is not found then something 
weird happened as region 0 is always present in reg property if 
hypervisor node is exposed to the guest.
The behavior before commit 3cf4095d7446 ("arm/xen: Use 
xen_xlate_map_ballooned_pages to setup grant table") was exactly the 
same in the context of the failure if region wasn't found.

...

Well, if we want to make code more resilient, I will update. But, looks 
like we also need to switch actions in xen_dt_guest_init() in order to 
process xen_events_irq before xen_grant_frames, otherwise we may return 
after failing with region and end up not initializing xen_events_irq so 
xen_guest_init() will fail earlier than reaches that check.
What do you think?


>
>> +		xen_auto_xlat_grant_frames.count = gnttab_max_grant_frames();
>> +		rc = xen_xlate_map_ballooned_pages(&xen_auto_xlat_grant_frames.pfn,
>> +										   &xen_auto_xlat_grant_frames.vaddr,
>> +										   xen_auto_xlat_grant_frames.count);
>> +	} else
>> +		rc = gnttab_setup_auto_xlat_frames(xen_grant_frames);
>> +	if (rc) {
>>   		free_percpu(xen_vcpu_info);
>> -		return -ENOMEM;
>> +		return rc;
>>   	}
>>   	gnttab_init();

-- 
Regards,

Oleksandr Tyshchenko


