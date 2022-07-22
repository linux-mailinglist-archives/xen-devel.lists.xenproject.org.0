Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6214757E46E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373344.605497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvZE-0003KQ-1Y; Fri, 22 Jul 2022 16:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373344.605497; Fri, 22 Jul 2022 16:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvZD-0003Gw-UU; Fri, 22 Jul 2022 16:31:55 +0000
Received: by outflank-mailman (input) for mailman id 373344;
 Fri, 22 Jul 2022 16:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvZC-0003Gq-Gv
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:31:54 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb0c3ed2-09db-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 18:31:52 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id h9so7260427wrm.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:31:53 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 y7-20020adfe6c7000000b0021e4f595590sm5103809wrm.28.2022.07.22.09.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:31:51 -0700 (PDT)
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
X-Inumbo-ID: cb0c3ed2-09db-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+Hju2upPsuaUMXu0Y7f4daw3tGQKzInvRhbWU/D3Jt0=;
        b=XmOsBGowtYcYScTl5DG3Q1Pz/OuOw+nlEbfk6WFvQEa7wZIHHeEghH/K6AVd6QIRbt
         wkSIhXTLDOYEbzhOW1qzIoLq/8KWEtDZDqtkQyyuu4zfmco71nPpDAmnuxa0K7mu5Bum
         wyRfpKCzwrsmSPzUtr1pFTgq4q+ERdmkcFq3NizhV5IlCniv1bbuH7MaelogQ+s3VPb4
         U4qg5svBHucz9DlsySoqM1hvwcaX6epM+0/mCHHP64y5my1kqFo2SVJLbjYDTXToFzAF
         u8r6Hb0dCfhDWGpGa+hOTpGzG49aBHJAvXlSTmQUo2KHA5Rnp3DnIwZN5l4d6yNISLMQ
         rQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+Hju2upPsuaUMXu0Y7f4daw3tGQKzInvRhbWU/D3Jt0=;
        b=eC8vizE33105Og2HYhkqPpxSZycPAvhfQXobZNTSvmcIPzcp6Fe5ZbhzGuWjLaDGBi
         8gein5W9eHr339/cwC7AzWJaupbNQPvcaJ0hQsE2srWgj+7dHDWkxxQIve3KAoKnYopw
         F1z/ht6nYA2MZR6rrdYwpBc3NVxGed2dy8knXFLZD8N4uyHAHQ12ONPq4sAxwpxeR118
         RG9fInbeuLkDsDecLtPnMj59M/SVHx/DsMMLjTQr9D0q3lVVx/HX8h5zKia3RyUYHO4J
         nbr1rvu83ViImv1s3lruQwiW5+H236ABooO5n3encUfPvIvFlB2vhY+7uEKGBWnExOH+
         hPIQ==
X-Gm-Message-State: AJIora9kof9xUm4yDI78hE+/5VoDG315wsfZn7JXSB5cZIAf0/bNX+kq
	PJk8JCnPvW2/PJVe4zo+vto=
X-Google-Smtp-Source: AGRyM1t4KYFr8FDqqVdNfkH0UqepHKS9F2xz7PIVNIKMvrUHfW7v8dcyDxJ+6Z/kdY5qqqYYmkmK9A==
X-Received: by 2002:adf:fecd:0:b0:21e:61cd:713d with SMTP id q13-20020adffecd000000b0021e61cd713dmr472228wrs.668.1658507512675;
        Fri, 22 Jul 2022 09:31:52 -0700 (PDT)
Message-ID: <934251cb-70e7-264b-d79e-618f55f2760e@gmail.com>
Date: Fri, 22 Jul 2022 17:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 01/14] iommu: add preemption support to
 iommu_{un,}map()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <3b3e1a15-f358-3095-87fc-c47843eff94a@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <3b3e1a15-f358-3095-87fc-c47843eff94a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:43, Jan Beulich wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> The loop in iommu_{,un}map() can be arbitrary large, and as such it
> needs to handle preemption.  Introduce a new flag that signals whether
> the function should do preemption checks, returning the number of pages
> that have been processed in case a need for preemption was actually
> found.
> 
> Note that the cleanup done in iommu_map() can now be incomplete if
> preemption has happened, and hence callers would need to take care of
> unmapping the whole range (ie: ranges already mapped by previously
> preempted calls).  So far none of the callers care about having those
> ranges unmapped, so error handling in arch_iommu_hwdom_init() can be
> kept as-is.
> 
> Note that iommu_legacy_{un,}map() are left without preemption handling:
> callers of those interfaces aren't going to modified to pass bigger
> chunks, and hence the functions won't be modified as they are legacy and
> uses should be replaced with iommu_{un,}map() instead if preemption is
> required.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

