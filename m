Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22EE9D2DF7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 19:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840741.1256232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDT1l-0007iO-18; Tue, 19 Nov 2024 18:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840741.1256232; Tue, 19 Nov 2024 18:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDT1k-0007fB-TT; Tue, 19 Nov 2024 18:32:40 +0000
Received: by outflank-mailman (input) for mailman id 840741;
 Tue, 19 Nov 2024 18:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDT1j-0007f2-He
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 18:32:39 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5467930-a6a4-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 19:32:35 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539f2b95775so4045653e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 10:32:35 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e043b84sm677228766b.137.2024.11.19.10.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 10:32:34 -0800 (PST)
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
X-Inumbo-ID: a5467930-a6a4-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmYiLCJoZWxvIjoibWFpbC1sZjEteDEyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE1NDY3OTMwLWE2YTQtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDQxMTU1LjAxNTc0Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732041154; x=1732645954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j+UQ/L3sES3BCQtbRVuMz93+SPhoXcvmWWH5kLblqvQ=;
        b=c0y1k/BasCpXTjsZf8bJFZMt8gV5qVxDZzjQZ/Q54dId/X57h7XW2TCvD29RR5lA2G
         i9VvCQ9LaToytQm1g0svdFcO37gy9UHGIfxE+Oobs0sGv5R0aqmek3rapctirBp6q3Mg
         zzRCx4OGRNtSuZrtf2oVvXRRCKgaPilX+AsmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041154; x=1732645954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+UQ/L3sES3BCQtbRVuMz93+SPhoXcvmWWH5kLblqvQ=;
        b=jkU7hCb0sklwp09ZPZgDM84nmiFKQIxetibc+QS38havqGiTFaS3nTuaj13QHBKec4
         zzf4Us5ELHJxxPyvT4ckfkyICoF0G4+o8TG/AS/2z0rbHQpWn8zlK+iiY3eTITcjkFLC
         6VzNqrVduub3WeuGFXnXmLFmI5zMDBlbgOWTZEQbXlp1U+ybr59I797LvVxgxsOEuVYm
         L74ywr0vi8w9yskQ4rf1yTgL42TgYdBlqh2P9yTEiF5yxhldsRz6lDuN/NwtdcykIFel
         PkXH+n17PsuEro4fyTzQml2fCgoRWsaGR14GCfObONAu/3TydKaMGJ7T3PMFkS7LGXvM
         YFCA==
X-Gm-Message-State: AOJu0YwViD0akzhctBD7AfZk/g6VtcqCOmdX+2D5RfsIwoohGh8k9lEe
	7b99qSlU5LIQxpGBKzRnMcSK5AoOyTP3rz/SU4wKatSmClW7aWhMI65v5o8ejj0=
X-Google-Smtp-Source: AGHT+IF0E4/mm0C3QOyWOlZ6OMaMuaD+RcZudjd6XnwK0cWYIvrlE3vLs6rL8v3BmpyxU85gsG+4aA==
X-Received: by 2002:a05:6512:ac7:b0:536:542e:ce1f with SMTP id 2adb3069b0e04-53dab29eb5fmr10851461e87.18.1732041154426;
        Tue, 19 Nov 2024 10:32:34 -0800 (PST)
Message-ID: <d9aa57ed-228e-4099-8a3f-cca365e50eca@citrix.com>
Date: Tue, 19 Nov 2024 18:32:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
 <875xojmexk.fsf@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <875xojmexk.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2024 3:16 pm, Volodymyr Babchuk wrote:
>> On Thu, 14 Nov 2024, Volodymyr Babchuk wrote:
> As for test harness, I am using Zephyr currently. My first intention was
> to use XTF, but it is x86-only... I am still considering using XTF for
> x86 runs.

I need to get back to fixing this.

My in-progress ARM (and RISC-V) branch can make a prink() (console IO
hypercall) and clean shutdown (schedop).

~Andrew

