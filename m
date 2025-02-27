Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D3CA489FA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 21:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898407.1306965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnkeP-0005iJ-E0; Thu, 27 Feb 2025 20:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898407.1306965; Thu, 27 Feb 2025 20:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnkeP-0005gl-BP; Thu, 27 Feb 2025 20:38:33 +0000
Received: by outflank-mailman (input) for mailman id 898407;
 Thu, 27 Feb 2025 20:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jS7=VS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnkeO-0005gf-OX
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 20:38:32 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd4dfeb7-f54a-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 21:38:29 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so605345f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 12:38:29 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844913sm3085543f8f.66.2025.02.27.12.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 12:38:28 -0800 (PST)
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
X-Inumbo-ID: cd4dfeb7-f54a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740688708; x=1741293508; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AreJrjUs46peuwIs8BQ7Xaa8ahyUnM098lqwLEM544Y=;
        b=jdYc+4AyOgXvUrW7Hod6+MZfISn+0KgTMRk6vw4YYyk6eEdC9V5iMdT3GnEB0DDI05
         RlqZtLCXVF45My1VwLYEPkKqogIP16KaIeN8DM9BeCF4BjPSKubIzfmbZzU5S0PHhdgI
         f2vK8uv7JQd47H94Q6TufVUEY4yh9cKf8jYHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740688708; x=1741293508;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AreJrjUs46peuwIs8BQ7Xaa8ahyUnM098lqwLEM544Y=;
        b=De7CsFkobVWCeN6MgQ3NBdKvMgZ68EyoT4szy8mU6ZHv6BUthpBRKTWIjGnfC5i8rK
         TfMwSjSAqfw/4NG2z6M2ATRcL5Ykx1fIEYkUjk8HO4+jsDHApJ6D/uLo2uUW8adFQymH
         YLFDuRdeZMQUV+sTe9CXdF+lYKcBbmVWM6651kW9jh2ISACXliHanfMLKKGzRvadvtQH
         z84mdbjf57iit+LwwkOaQ9GOxxZav/SlqgHmyqOWhNpeRadyKTO+In9fR6GNz/R+6Ixh
         8kiLzsPIDSXhcY1s54k7Rv+1Pm/997z9QzKuFW1HawXObZDR5v016gHfq98+01ivmh3M
         BROg==
X-Gm-Message-State: AOJu0Yxxh7ab5JF4m/sVd8V9uPE02LXRafUHUFAf1sSTPX213m+EcoWt
	9GZMYqjgNY/qUgNx92Jz4HpHeOHa9x88wSlzPkDG1n/eCr8X8gTpC9JYOoIWNHd7Eahgm7vx2hz
	F
X-Gm-Gg: ASbGncuWXsN80e85VU/x1/2cNAhPyq4jbncrrcGLois2LpFP6v0Brogy8ElItLVIhTZ
	PlQzGc1HqpA3/nA5mSOGds+g7qhMaOSRrKZFbce4lFHLjMW6JzGMs8TRCMs16p9L2Kl8rZMvaaz
	GPq8MOydQLaSE/I/ApHnRr/fjk1E0uxFD469q7wVCoH7AyyDRzvYwAKWGSx54hnDmLhShOadP2N
	WVpB/wmyhpRraTbQHqejUdzHuTFArOp1tJCwHp5N3e9HNYWtDnDjKIrNm/QWkzQlN4stq0poQoN
	DV46v0Pu4GgWu+RtOdyUaDriJ2nGUL4FhgDBY/YA76Ihhh6Y4JKkbEcq2/jAs4bxBQ==
X-Google-Smtp-Source: AGHT+IE4G+VAFb5OB9z2w27CVR7wAgg0+dCSGYm6gMIQGfCdnIGO8nYvinoFGiNE7MmdCwJ4x6IH/g==
X-Received: by 2002:a05:6000:188c:b0:38c:5bfa:a93d with SMTP id ffacd0b85a97d-390ec7c8f9fmr460756f8f.10.1740688708634;
        Thu, 27 Feb 2025 12:38:28 -0800 (PST)
Message-ID: <a90f1bb3-90a8-4c3e-818f-498319815475@citrix.com>
Date: Thu, 27 Feb 2025 20:38:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Verbosity during boot
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've raised this during review before, but:

> (XEN) [    1.209230] AMD-Vi: IOMMU Extended Features:
> (XEN) [    1.213998] - Peripheral Page Service Request
> (XEN) [    1.218849] - x2APIC
> (XEN) [    1.221536] - NX bit
> (XEN) [    1.224221] - Invalidate All Command
> (XEN) [    1.228297] - Guest APIC
> (XEN) [    1.236062] - Performance Counters
> (XEN) [    1.244692] - Host Address Translation Size: 0x2
> (XEN) [    1.254547] - Guest Address Translation Size: 0
> (XEN) [    1.264313] - Guest CR3 Root Table Level: 0x1
> (XEN) [    1.273925] - Maximum PASID: 0xf
> (XEN) [    1.282338] - SMI Filter Register: 0x1
> (XEN) [    1.291241] - SMI Filter Register Count: 0x2
> (XEN) [    1.300607] - Guest Virtual APIC Modes: 0
> (XEN) [    1.309655] - Dual PPR Log: 0x2
> (XEN) [    1.317801] - Dual Event Log: 0x2
> (XEN) [    1.326078] - Secure ATS
> (XEN) [    1.333490] - User / Supervisor Page Protection
> (XEN) [    1.342892] - Device Table Segmentation: 0x3
> (XEN) [    1.351981] - PPR Log Overflow Early Warning
> (XEN) [    1.361040] - PPR Automatic Response
> (XEN) [    1.369341] - Memory Access Routing and Control: 0x1
> (XEN) [    1.379012] - Block StopMark Message
> (XEN) [    1.387273] - Performance Optimization
> (XEN) [    1.395637] - MSI Capability MMIO Access
> (XEN) [    1.404138] - Guest I/O Protection
> (XEN) [    1.412042] - Host Access
> (XEN) [    1.419105] - Enhanced PPR Handling
> (XEN) [    1.427008] - Attribute Forward
> (XEN) [    1.434494] - Host Dirty
> (XEN) [    1.441308] - Virtualized IOMMU
> (XEN) [    1.448699] - VMGuard I/O Support
> (XEN) [    1.456345] - VM Table Size: 0x2
> (XEN) [    1.491312] AMD-Vi: IOMMU 0 Enabled.
> (XEN) [    1.499087] AMD-Vi: IOMMU 1 Enabled.
> (XEN) [    1.506835] AMD-Vi: IOMMU 2 Enabled.
> (XEN) [    1.514554] AMD-Vi: IOMMU 3 Enabled.
> (XEN) [    1.522452] I/O virtualisation enabled

Lots of that information is not actually useful, not even for
developers.  What's worse is that this is a release build of Xen and it
still takes 0.3s to print the feature list alone.

~Andrew

