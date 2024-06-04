Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C058FBA20
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 19:18:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735454.1141617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEXnI-0003IS-BH; Tue, 04 Jun 2024 17:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735454.1141617; Tue, 04 Jun 2024 17:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEXnI-0003Fz-8e; Tue, 04 Jun 2024 17:17:56 +0000
Received: by outflank-mailman (input) for mailman id 735454;
 Tue, 04 Jun 2024 17:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sEXnG-0003Ft-TE
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 17:17:54 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 600f26f2-2296-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 19:17:52 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-35dbfe31905so1388725f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jun 2024 10:17:52 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c0f47sm12171984f8f.8.2024.06.04.10.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 10:17:51 -0700 (PDT)
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
X-Inumbo-ID: 600f26f2-2296-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717521472; x=1718126272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOatp/Hc0cZBNHQx2peJlGOb098WMlw6EB3Wt3S4mxM=;
        b=Dr4QSrk/kr0M7TmZ4tt8v4LfpzGeyTepuduGHCkg03o+q6/GpRJ+o6cX9DrkcMfcAd
         PH9ncmND4MbsjCBG+Lsaz1ApHAUusJfxsEDOenkGrrUMVz7DC6nsRHBevIWLP2ReKdt0
         Sg1H3Ls5qaqgghAvlBHJVBNJGNe1WMXtRAcyaGw4q//nesFtx7b2qZDZ7pSJCA30tNMC
         T+8F09l7/J7MNh6DTg+DmlHDKWlxjDS/CNmf3j3/1Odl9Zb4ae/XpCiolLuCc/BWAs7F
         U9LqCWRH/h4T1c75r6B5UaySTJexm2+or7cN1QP3VZLxFcPAWdUV7q2xDaPGZIoGHTI2
         5p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717521472; x=1718126272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOatp/Hc0cZBNHQx2peJlGOb098WMlw6EB3Wt3S4mxM=;
        b=kpYuSIzhqQLV6lr+xGsDcZkxClZ4zO1keB/Z/3Ca04TyBnMkCRsz9bA7RKd14Odr97
         A7BtkzCVZ6mBH4eqZRE9DrMBwFNsUb+kd7FK3T/0EzOno70jnxGCH7ydMwcOprQ+qx8i
         z2WYiaZLKZgVPjRRhagEBgoOQvKKbKv08nxcIwS17AINZx9/8adi6wtT8ve8z841xl9Y
         T+u01SoZN5SoTqgoW4Xf6zULAE8XvoroiU9GnrOyb8ZgNUoKUJl4Jyag07umLGc9xeme
         jEV+ItbWLqWQsykgvwnrGQoQf37Hw+uhZqdq2asOsue6g+z1e1K1LxB95pKjI3OMhDXE
         Wj0w==
X-Forwarded-Encrypted: i=1; AJvYcCWA5sX8d1PlrOzw7Qxt0TVaKH2CiYLP+Ehjv60gxjLYc2qL0Y3YbljYhHrODvag+f//kl6zgrGfniSlMw6+vyQdwXqWjMXOU7mEIgH3FxQ=
X-Gm-Message-State: AOJu0Yzv6PO5ZlfabO8a+Cp/QA2Xoq1KKwhn5KqiGJ8S8lQq2mdXTzui
	HuYM4+DSKiVR8WRzZEcd6fUU6p69DrQHqiemh4qz/692bHqjYqaHCBZPZPPlGg==
X-Google-Smtp-Source: AGHT+IEX1FiNnIYUsRAgaKSZjd+27u3zg2WyADRLrc9eyP7Uj1OzwRbgJwgk1Xkh5nA0qLJIN6Nh8g==
X-Received: by 2002:a05:6000:400f:b0:354:f7f3:5e60 with SMTP id ffacd0b85a97d-35e8ef8e5c1mr33055f8f.52.1717521471933;
        Tue, 04 Jun 2024 10:17:51 -0700 (PDT)
Message-ID: <46b884e2-cbec-46f0-9070-7013307a310f@suse.com>
Date: Tue, 4 Jun 2024 19:17:49 +0200
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
 <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
 <BL1PR12MB58494B2DD0CD75CCDF1F5CA1E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <67960b60-3108-4920-8bf1-68a00e117569@suse.com>
 <BL1PR12MB58490E8F1F26532B0FDFFFD6E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB58490E8F1F26532B0FDFFFD6E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2024 10:18, Chen, Jiqian wrote:
> I tried to get more debug information from my environment. And I attach them here, maybe you can find some problems.
> acpi_parse_madt_ioapic_entries
> 	acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE, acpi_parse_int_src_ovr, MAX_IRQ_SOURCES);
> 		acpi_parse_int_src_ovr
> 			mp_override_legacy_irq
> 				only process two entries, irq 0 gsi 2 and irq 9 gsi 9
> There are only two entries whose type is ACPI_MADT_TYPE_INTERRUPT_OVERRIDE in MADT table. Is it normal?

Yes, that's what you'd typically see (or just one such entry).

Jan

