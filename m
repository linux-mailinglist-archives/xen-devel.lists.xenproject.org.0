Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0973ADE980
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 13:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019058.1395917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRqX8-0002eT-0M; Wed, 18 Jun 2025 11:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019058.1395917; Wed, 18 Jun 2025 11:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRqX7-0002cR-U2; Wed, 18 Jun 2025 11:00:45 +0000
Received: by outflank-mailman (input) for mailman id 1019058;
 Wed, 18 Jun 2025 11:00:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H+gG=ZB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uRqX6-0002cL-Sy
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 11:00:44 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7880aaea-4c33-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 13:00:39 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so4723622f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 04:00:39 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54aeasm16860560f8f.14.2025.06.18.04.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 04:00:38 -0700 (PDT)
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
X-Inumbo-ID: 7880aaea-4c33-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750244439; x=1750849239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pz/j6REenJK98gq4UAuf9ldxO4zim6CyD7BhTzRWWzk=;
        b=ideMGNHV9P2fSssZ3kW03v4Du+1k0l6sZR0yv2txBG6myE/aVpUkVXw0aej3gxRiEH
         ijaATOe1t2YF+cv1MPG65I4pj5QExCq9GGavaKXV1CYVjaLlX4wSXdcG+gkT/1m45u9G
         /RMe5H06z9+NeNr5c7dgewqNBuJHwY6PDX+Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750244439; x=1750849239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz/j6REenJK98gq4UAuf9ldxO4zim6CyD7BhTzRWWzk=;
        b=ttQwKX9LSJYsyRWGQ0OAL/F1c2E9vtMoRpzSR6NXhOe/A2twnKnP+N7OSpk0wyg9o7
         cZhsBz1gxp9OQ0KAdWyTTpfg9WyiNj9RpP0aOlM0cN4Mw4ZMiA2FHC2VaiAOkMgSMPEC
         KlgIPpZjgq/Ee5OqDW7QH8RvPdVj/I9T5x53tcAvhn9Go8sHpgRFcny85UAdt5Ke7Xb8
         /bjz+8b6RIhDcwDz1k7xMHMjs2m28Y36LUWLq/Q+dtO6Up1Tcvh5iliNQ8hHSVvRcnSJ
         syiGo+af9YaaXejK9Fmtbsqf7gov7M4tGp6C5x/PTKSvzE1lLIKmvmvTd/BuBCRItq12
         BOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Zqe+Gn65xTy/RdmcJ0G4qyEbuPbpx2zIzBbvMx1Ex7A4Pvcggv/mG7gksLhbb086t7gQ+fuqluE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwetPu8bJOU92hhjYwvEoC8hogJYq+xY/OcMebnC2g8UnHy6z3G
	Or6tAP73esEzAJUCokfY5bMTh5Muc+ek3FYf/GLF9L9FiZLQZuPL++vKKVevssVVkEI=
X-Gm-Gg: ASbGncses5M9LDtATkLVJQAnakD1K9S0Ip8+Hv2BJdomjLJnHNaV8U90b9+3s/iY2E2
	v1T27D2wAJu0aBmIAqhpm0lnBO7tTOiygxm+qCWp9Db3h3p7KaZpMyrvQkOxbYKgv9MkN3HxtwS
	4hTHK9MnTBFOadjEqj/A3pTHKZx5QdVXoeSI+VQLiXs0RxfLN8uKG/JW4v+zZDUCVeFlYCbFKrg
	ZeB8ownT5C58z9u6My5VAWZ+ceIQmzJbFHi0Ah4MqhRyI2CwTf0OAemB4NNJTFPUTw2W3NuKFJg
	eGIyIP+eNO0chY2It5wR4QCUkbRlY0D5gmNpqCVDDrzx2b1zqFrBDBruYqydsNFOPRQNwWvVQJN
	/QbrpPL/MfkVnvDViKL0iRULYneE=
X-Google-Smtp-Source: AGHT+IFbH9ETYF0uCKrdWmfx8uxACSUbNymbt2EiJHCh6eMiGtL4o4ECMgn0Bn80tJ/s1HgHJnAf2Q==
X-Received: by 2002:a05:6000:2003:b0:3a4:e6d7:6160 with SMTP id ffacd0b85a97d-3a5723679cdmr12189875f8f.6.1750244439145;
        Wed, 18 Jun 2025 04:00:39 -0700 (PDT)
Message-ID: <4a0e4e50-1e4d-4046-8897-b4769591650b@citrix.com>
Date: Wed, 18 Jun 2025 12:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: restore changes lost by "consolidation"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <2e354a84-2277-4a7f-8291-3f19526d645a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2e354a84-2277-4a7f-8291-3f19526d645a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2025 11:35 am, Jan Beulich wrote:
> Both c6e0a5539623 ("cpufreq: use existing local var in
> cpufreq_statistic_init()") and a1ce987411f6 ("cpufreq: don't leave stale
> statistics pointer") were lost in the course of "moving" the code,
> presumably due to overly lax re-basing.
>
> Fixes: bf0cd071db2a ("xen/pmstat: consolidate code into pmstat.c")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

