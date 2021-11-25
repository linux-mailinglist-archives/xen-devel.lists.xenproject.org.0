Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554D45D9F4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 13:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231018.399398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqDky-00057S-KH; Thu, 25 Nov 2021 12:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231018.399398; Thu, 25 Nov 2021 12:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqDky-00054Q-Ga; Thu, 25 Nov 2021 12:21:40 +0000
Received: by outflank-mailman (input) for mailman id 231018;
 Thu, 25 Nov 2021 12:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lxap=QM=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mqDkx-00054K-GW
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 12:21:39 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d173808-4dea-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 13:21:38 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id y26so15813308lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 04:21:38 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x17sm222042lji.96.2021.11.25.04.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 04:21:37 -0800 (PST)
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
X-Inumbo-ID: 3d173808-4dea-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vKwW+VHe5OcMxed3R036glSM7CFNnysyFNmayki8jus=;
        b=HmNbEV8gOFpo7zvwzGdiodhLx5aO0alsx+N0u4jE+PzgpviXCE34KVp+onkz+8jkrU
         uO/5CPgXPir/GlBDsg47DNy1Ma6Vu2CxJZ5W2n/48nAcV8Fps9BzXhbzMblsQtEUNuKS
         STL5otz6feV42aLr917H9BxgogTI7KN4zcqracOUhD6sFRp8+2AucwIe5ewEv9QXBThv
         uYYPeemklzZTZqq1tNPWhKTpCYaGwBXsLvWUDD/a7W44DBFYfZN+LherWsQp9ko9eUuX
         6IWaoxA1kwD6CQqGMF/5HUfljIUd5sh84yN7BWfp2K3p3diYl66SyKQtQfHGSnnEzWC9
         1JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vKwW+VHe5OcMxed3R036glSM7CFNnysyFNmayki8jus=;
        b=loU2ah6Dv9c2HdaikRiSZ77vcbKf9fYgFzJXzP8hOAZcA3hJxnrX0FKAm1QNioLbuU
         osb9YT8fU7r/YXZaVV+AF5kug5oaxtXNsi/5/JvScNkYM+UGLV4TFYIyZ4yMCwNoEi+y
         HctQY57bg2zTPXe4EIZk83xDxegwxRR5ScuI4+Ry75cNttxckFfhyXV4QIYJAGo3ftSH
         xBRaCFTlqwf7Bzqyr78EYyJH4XshzntXDiw/zYRX/SgRY+42C6Ot5ddiPRF7plwa84ve
         8Vd33MBp7N+3xmxtVdbqX8TWjtQIll4HEEIMF6GWRj4sJ2ZJW3V6ao0B+Tj0ia6VjL21
         lXPQ==
X-Gm-Message-State: AOAM530AV2namHzF8bTXURSVuhlx5jESadFOiVCakGn5FVwNRLnnvHNJ
	nCi625dT06sXUw6obSAxkmluhi2/IfSIHA==
X-Google-Smtp-Source: ABdhPJyjtb3X/8swejQdKOhc7frtnSzRSVwz0xBmcpEyK7dmM5Smu4K+sNVZW3KlH80bKOSjwvpNeg==
X-Received: by 2002:a19:c3d5:: with SMTP id t204mr23073068lff.303.1637842898089;
        Thu, 25 Nov 2021 04:21:38 -0800 (PST)
Subject: Re: [PATCH V3 6/6] dt-bindings: xen: Clarify "reg" purpose
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>
References: <1637787223-21129-1-git-send-email-olekstysh@gmail.com>
 <1637787223-21129-7-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2111241708170.1412361@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <38cf1231-4a52-ea4a-cfc2-a73c09631031@gmail.com>
Date: Thu, 25 Nov 2021 14:21:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2111241708170.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 25.11.21 03:09, Stefano Stabellini wrote:

Hi Stefano

> On Wed, 24 Nov 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Xen on Arm has gained new support recently to calculate and report
>> extended regions (unused address space) safe to use for external
>> mappings. These regions are reported via "reg" property under
>> "hypervisor" node in the guest device-tree. As region 0 is reserved
>> for grant table space (always present), the indexes for extended
>> regions are 1...N.
>>
>> No device-tree bindings update is needed (except clarifying the text)
>> as guest infers the presence of extended regions from the number
>> of regions in "reg" property.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> According to the recent update to Xen's guest.txt:
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob_plain;f=docs/misc/arm/device-tree/guest.txt;hb=refs/heads/master
>>
>> Changes V2 -> V3:
>>     - new patch
>> ---
>>   Documentation/devicetree/bindings/arm/xen.txt | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
>> index db5c56d..156fe10b 100644
>> --- a/Documentation/devicetree/bindings/arm/xen.txt
>> +++ b/Documentation/devicetree/bindings/arm/xen.txt
>> @@ -7,10 +7,14 @@ the following properties:
>>   	compatible = "xen,xen-<version>", "xen,xen";
>>     where <version> is the version of the Xen ABI of the platform.
>>   
>> -- reg: specifies the base physical address and size of a region in
>> -  memory where the grant table should be mapped to, using an
>> -  HYPERVISOR_memory_op hypercall. The memory region is large enough to map
>> -  the whole grant table (it is larger or equal to gnttab_max_grant_frames()).
>> +- reg: specifies the base physical address and size of the regions in memory
>> +  where the special resources should be mapped to, using an HYPERVISOR_memory_op
>> +  hypercall.
>> +  Region 0 is reserved for mapping grant table, it must be always present.
>> +  The memory region is large enough to map the whole grant table (it is larger
>> +  or equal to gnttab_max_grant_frames()).
>> +  Regions 1...N are extended regions (unused address space) for mapping foreign
>> +  GFNs and grants, they might be absent if there is nothing to expose.
>>     This property is unnecessary when booting Dom0 using ACPI.
> I would remove the last sentence about ACPI as the initialization is not
> done via the xen,xen device tree node in that case anyway.

Agree, will do. I assume, the similar sentence for the "interrupts" 
property down the text wants removing as well.


>
> With that change:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!


-- 
Regards,

Oleksandr Tyshchenko


