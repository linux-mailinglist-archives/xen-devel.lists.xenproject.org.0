Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8DAF7D1F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 18:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032257.1405939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXMNq-0004kh-LN; Thu, 03 Jul 2025 16:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032257.1405939; Thu, 03 Jul 2025 16:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXMNq-0004iU-IV; Thu, 03 Jul 2025 16:01:58 +0000
Received: by outflank-mailman (input) for mailman id 1032257;
 Thu, 03 Jul 2025 16:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8MTI=ZQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXMNo-0004iO-WC
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 16:01:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a36a28e-5827-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 18:01:55 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so49631855e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 09:01:54 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b4708d0aa0sm159789f8f.34.2025.07.03.09.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 09:01:53 -0700 (PDT)
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
X-Inumbo-ID: 0a36a28e-5827-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751558514; x=1752163314; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZP7m7eDZo85J3icow3DNw7kvPoBFA9p/LEsbA225EjQ=;
        b=mI+ovzQKrtDG76Ay7zw4786TADSR8hgoo/qMI2X6HmG9STfHuByPEcn3srMy1Hhkaz
         EnQFQLuWGd2rwF74sVdY76eoXbbJsfj3/KT2CufKsr/6js8WHv8pgmNPldEDFdth5Q0l
         wNdai7Qg07pDiCP8bGIQCKo1Q5LO3KD1Neb9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751558514; x=1752163314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZP7m7eDZo85J3icow3DNw7kvPoBFA9p/LEsbA225EjQ=;
        b=JZmcN/ja1QlsKLZu4R5iiIkvpyGjr6yAkTupt9QUj8t2136J13dXIzeDQBBOsbT8am
         2w2gT3IbZn+jMVCYIWRVpcH+NzFibnFkwlCMdrsL9bJXuZOc0PHaWghb77+tqSFattd1
         RLxDHwJfhlGWtWfxFa4yeg+H1klD68Eoz3ISMAiXRZzq6Xyn+SIlFjMVmOH9026U3QBQ
         7ZX2FU1Ulf7byng4uNq+cjhN0JlxLPkjYr/cpSx7MNq4NBLAWYf9OEAdyF/6uTl/ApTH
         ZfhWP5DmVyMlI77ZIzjRcfoNMUmcY9A9YevRr2wlywdW2Fx2Wob83AFi6coXdTEw0XIq
         9zWw==
X-Gm-Message-State: AOJu0YyukaiSkLH+VaW2xOz+P4ris4wo1p3reBcjHy4nFq87pHThZd8v
	I5e3u+HkQw/ThyqdrifE6j+WG9XUmsBD58HVo9wAQIag1tsnuNmgXZzeJ0b5vOW/YCM=
X-Gm-Gg: ASbGncv0QcpcrHtIJrTuscG50aBm3JG7CjDLUNE4hmL2GeVnjDBpg5prFCW3cusD+J/
	EChczoqWXneKkux+6c9/TGH6Y6XzANndjHwgfI6pfnyw0SaRkvEEnm5kiivMp+X1vYXIOQDdUhw
	O10Dv/MKLxN9GqX4qPBWPSQga05MaNWCDPVvWCOtirYFxrHll+9FGPZWWBCuW5Zm6vAWfM1wxPP
	egJisayhZKS+UcUX4oi6BicZ2/5PCbrsmFAeQh92hN3mhKA4kJ1+gxTGypqeBnswXM1gnlZuNES
	BlA/V6Xu86snbNTG4mSonlS7PImFyenVO4c6Rzg+G13vXRXj4QO6YEAERWM388YB7hO4jnajIbZ
	JQnlEY9Vmfmxu69ZCpKtphM+Vkn5LUYeXdiKKuD9O
X-Google-Smtp-Source: AGHT+IHTQYImTRkxgM7X1SfsZBWv4N0RY0VJk6yJNhFPAfjpsQQaCGSEQifVsMnyMkJcpolkF3i1kw==
X-Received: by 2002:a05:600c:628c:b0:442:f482:c421 with SMTP id 5b1f17b1804b1-454a3708eaamr61857265e9.22.1751558513942;
        Thu, 03 Jul 2025 09:01:53 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:01:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/6] x86/idle: Remove broken MWAIT implementation
Message-ID: <aGapcEcSfZHURMrL@macbook.local>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702144121.1096448-2-andrew.cooper3@citrix.com>

On Wed, Jul 02, 2025 at 03:41:16PM +0100, Andrew Cooper wrote:
> cpuidle_wakeup_mwait() is a TOCTOU race.  The cpumask_and() sampling
> cpuidle_mwait_flags can take a arbitrary period of time, and there's no
> guarantee that the target CPUs are still in MWAIT when writing into
> mwait_wakeup(cpu).
> 
> The consequence of the race is that we'll fail to IPI targets.  Also, there's
> no guarantee that mwait_idle_with_hints() will raise a TIMER_SOFTIRQ on it's
> way out.
> 
> The fundamental bug is that the "in_mwait" variable needs to be in the
> monitored line in order to do this in a race-free way.

I assume in_mwait being in the same monitored line is required so that
you can do an atomic exchange and ensure the remote CPU was either in
the monitor state, or just getting out of it but before processing
softirqs when the softirq is set?

That means that a CPU getting out of mwait would also need to do an
atomic exchange to clear in_mwait and fetch the pending softirqs?

> Arranging for this while keeping the old implementation is prohibitive, so
> strip it out in order to implement the new one cleanly.  In the interim, this
> causes IPIs to be used unconditionally which is safe albeit suboptimal.
> 
> Fixes: 3d521e933e1b ("cpuidle: mwait on softirq_pending & remove wakeup ipis")
> Fixes: 1adb34ea846d ("CPUIDLE: re-implement mwait wakeup process")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

