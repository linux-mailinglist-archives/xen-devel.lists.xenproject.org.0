Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA47FA157
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642105.1001266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bzl-0006Bn-Kv; Mon, 27 Nov 2023 13:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642105.1001266; Mon, 27 Nov 2023 13:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bzl-00069g-HE; Mon, 27 Nov 2023 13:49:53 +0000
Received: by outflank-mailman (input) for mailman id 642105;
 Mon, 27 Nov 2023 13:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhMp=HI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r7bzj-000644-8Z
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:49:51 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3f922c5-8d2b-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 14:49:47 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b479b9c35so5060915e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 05:49:47 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b0040b4110f548sm7165815wmq.23.2023.11.27.05.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 05:49:46 -0800 (PST)
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
X-Inumbo-ID: d3f922c5-8d2b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701092986; x=1701697786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoBvhxJ0Av+vT3EEw/lW8cjGSpIv16L+xvyD2Mzxz3I=;
        b=ZyO9DFrsNrcIdvD2+Fc9B0PT2jqgTBoNKhTzWJrKBEsiNu4Zb9Mj4PRH4izCvHB/cB
         Da3xlWIurZ5KKFUwnE7N8BKc3oOVP+gxD9c0KU1Ey8yjI5Yw+8xyBHZ/hT9nQPOqBZdi
         P9pMELbsdRQdgnlVfqdWgQ8r6tI2/vUwhRoQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701092986; x=1701697786;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HoBvhxJ0Av+vT3EEw/lW8cjGSpIv16L+xvyD2Mzxz3I=;
        b=euTTQDLWE1Vo0AQx1PabSEng2/HcEQoR93iaao4N53d/+VJRTGGYw0EcRQAjDlTTY9
         6zm5/wFm0MgZ+P4ciPnnO6TLCMC54IJUkMpyIVjQ9SgRJzmnYglmtm5xIc1tt0szqFKG
         TDP/oiq+zQV5BQkvtP6o37bKBgOrxVMfhkGWwc22JvPyTSVdzfMSsrFkyP8H6conbbxj
         OqY9e3s45T6ZigmAj/dEq+pZTr9aGQHTSK4F9oK+q4SZ8w/yng+Wh7m6kkYu0zQLqztQ
         fdVA40HWOVOQrwF+NY5IY16tzu4HUQPg+OW2FPKJnc1aTJ3JgGOw/XVMRlNkSZV8L8ij
         h2hg==
X-Gm-Message-State: AOJu0YxXb8o6pR56J5LBRO5qKTC0gg2qk2RbH+7mI3ako8QafDVXM7bw
	4z2HayVmguNGCTiEuNDJ2q2Z5vIXzsH8fiVuxWo=
X-Google-Smtp-Source: AGHT+IFuqGIwz6+wHvkfzOiKkbRFfxGApHIL9h3BY/xk1pvcBrSxZw7QdwvTBN2f+QxR3c4JisqZ8Q==
X-Received: by 2002:a05:600c:1381:b0:405:3455:e1a3 with SMTP id u1-20020a05600c138100b004053455e1a3mr7850571wmf.17.1701092986562;
        Mon, 27 Nov 2023 05:49:46 -0800 (PST)
Message-ID: <287760a9-c6fd-4723-8357-f0abf9202d46@cloud.com>
Date: Mon, 27 Nov 2023 13:49:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20231127134619.2978-1-alejandro.vallejo@cloud.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <20231127134619.2978-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/11/2023 13:46, Alejandro Vallejo wrote:
> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
> registers are derivable from each other through a fixed formula.
> 
> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
> rather than x2APIC IDs (which are not, at the moment). As I understand it,
> this is an attempt to tightly pack vCPUs into clusters so each cluster has
> 16 vCPUs rather than 8, but this is a spec violation.
> 
> This patch fixes the implementation so we follow the x2APIC spec for new
> VMs, while preserving the behaviour (buggy or fixed) for migrated-in VMs.
> 
> While touching that area, remove the existing printk statement in
> vlapic_load_fixup() (as the checks it performed didn't make sense in x2APIC
> mode and wouldn't affect the outcome) and put another printk as an else
> branch so we get warnings trying to load nonsensical LDR values we don't
> know about.
> 
> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

While no R-by from Andrew was in the mailing list, it was in the xenbits
patch, of which this is a direct copy except for minor delta suggested
by Jan in lapic_load_fixup()

> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=953dcb0317d20959ffee14e404595cfbb66c607a#patch1

Cheers,
Alejandro

