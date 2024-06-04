Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011FB8FAA8D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735142.1141300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENPQ-00086R-GT; Tue, 04 Jun 2024 06:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735142.1141300; Tue, 04 Jun 2024 06:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENPQ-00084Q-Ch; Tue, 04 Jun 2024 06:12:36 +0000
Received: by outflank-mailman (input) for mailman id 735142;
 Tue, 04 Jun 2024 06:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sENPP-00084K-1j
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:12:35 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eba331c-2239-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 08:12:34 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4212a3e82b6so24523945e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:12:34 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4214beb5c9asm8050775e9.7.2024.06.03.23.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 23:12:33 -0700 (PDT)
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
X-Inumbo-ID: 6eba331c-2239-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717481553; x=1718086353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ncrw/z44aexW3t62vaMFiYSgAkBMt/KPWfW7heWoKpo=;
        b=ATsG1BE3vdVJaF31YL5joSnNQcQutt8+TMTXXihaoSbhFa0TlHWBCuohYzzSULuaL4
         Y3N6fXrNb2XUhw8mVMdrRjoWb4CssdW8o/ifszr7mZASz+CCijw68I2YtDzkn02QIVrI
         lWtoef9fkQ2GlO9qiDz1CncHzRIc29UtY+eP1Re8oYbkOyO8RbTXy1O4lw/qZ9HlaYv0
         hMiEcqsn+h2agwlHjmUdhU2Jj0f9vciN6XW4mKAqSVJp2uyXVQwOGXry+BUVwE3/pVKf
         ucio6gLns3N1nF6jkRpG9sthcpmOJpxvt+jGUANR0N9n3LyRmF6nP9lD+DRl7fqWxgWo
         VFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717481553; x=1718086353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ncrw/z44aexW3t62vaMFiYSgAkBMt/KPWfW7heWoKpo=;
        b=SM3faTY+vlJ+TvriyGwLmwsFu88xEoQ6Wpr1s/KyT4YGi/2W1rPs+h6zJ+xT6PkaWn
         hbus5zep2+PlYE/tvkxscOrAaPFFDJCs2v/OVYt5PRa4f/irn/fpolURRFzHm4aMcal5
         5OghsXlzXsTyY1Z7/nHvfB+CzNrlSn7ljTskVNdZqLnkIERhyQy/9K3ml0WYM+++DoZ0
         OT/TgIZelmj4P1/cw7Grhtn23Ay4koYWnZx2IHdguVyq9q8xadS7KJKJkH5Z4pfAMS7Z
         bpsO+zE8iUNJHV+MIfvvZVVfpnfApDbMCIW1C1n05j0ypL6vwxMJLmWUa1aIfGe7TDpq
         HK5g==
X-Forwarded-Encrypted: i=1; AJvYcCUjZqMl0OEN5jVtzCV/K47Y4kOuPQuu6WoHV2hSpdpKMBeXsFUU+L6+sSXqNSoIZN8RyIkn0MZifimo5Kaw+FUgaOVY6piZn4+XEV2r0lc=
X-Gm-Message-State: AOJu0YzptYJHxJI08GVdwJNNlHkL3yuM9kc9ZZEpF231jgjaIYX3kX5o
	1PfnINJ08xyN5tm+yai65qUalk/C4ooMLbu6Rlh/+yIdURJ9te0NP9QMNne5qA==
X-Google-Smtp-Source: AGHT+IEUz8RRft9lHuNQNdxArfMv8M/pCNU6QFvZ52JopR2JROFVIbxR0sY8xtpFmipYfaaxj9OWGw==
X-Received: by 2002:a05:600c:1d25:b0:421:3880:d7d5 with SMTP id 5b1f17b1804b1-4214513b8f1mr12248475e9.18.1717481553372;
        Mon, 03 Jun 2024 23:12:33 -0700 (PDT)
Message-ID: <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
Date: Tue, 4 Jun 2024 08:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2024 08:01, Chen, Jiqian wrote:
> On 2024/6/4 13:55, Jan Beulich wrote:
>> On 04.06.2024 05:04, Chen, Jiqian wrote:
>>> On 2024/5/30 23:51, Jan Beulich wrote:
>>>> On 30.05.2024 13:19, Chen, Jiqian wrote:
>>>>> I dump all mpc_config_intsrc of array mp_irqs, it shows:
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 0 dstapic 33 dstirq 2
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 15 srcbus 0 srcbusirq 9 dstapic 33 dstirq 9
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 1 dstapic 33 dstirq 1
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 3 dstapic 33 dstirq 3
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 4 dstapic 33 dstirq 4
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 5 dstapic 33 dstirq 5
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 6 dstapic 33 dstirq 6
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 7 dstapic 33 dstirq 7
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 8 dstapic 33 dstirq 8
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 10 dstapic 33 dstirq 10
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 11 dstapic 33 dstirq 11
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 12 dstapic 33 dstirq 12
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 13 dstapic 33 dstirq 13
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 14 dstapic 33 dstirq 14
>>>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 15 dstapic 33 dstirq 15
>>>>>
>>>>> It seems only Legacy irq and gsi[0:15] has a mapping in mp_irqs.
>>>>> Other gsi can be considered 1:1 mapping with irq? Or are there other places reflect the mapping between irq and gsi?
>>>>
>>>> It may be uncommon to have overrides for higher GSIs, but I don't think ACPI
>>>> disallows that.
>>> Do you suggest me to add overrides for higher GSIs into array mp_irqs?
>>
>> Why "add"? That's what mp_override_legacy_irq() already does, isn't it?
> No. mp_override_legacy_irq only overrides for gsi < 16, but not for gsi >= 16(I dump all mappings from array mp_irqs).

I assume you mean you observe so ...

> In my environment, gsi of my dGPU is 24.

... on one specific system? The function is invoked from
acpi_parse_int_src_ovr(), and I can't spot any restriction to
IRQs less than 16 there.

Jan

