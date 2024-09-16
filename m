Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFBD979B2C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799136.1208975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5I7-00008C-7M; Mon, 16 Sep 2024 06:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799136.1208975; Mon, 16 Sep 2024 06:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5I7-00005y-4g; Mon, 16 Sep 2024 06:32:55 +0000
Received: by outflank-mailman (input) for mailman id 799136;
 Mon, 16 Sep 2024 06:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq5I5-00005s-1m
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:32:53 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f29a572-73f5-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 08:32:51 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so504476766b.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Sep 2024 23:32:51 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df75csm270978866b.149.2024.09.15.23.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 23:32:49 -0700 (PDT)
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
X-Inumbo-ID: 7f29a572-73f5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726468370; x=1727073170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbtsq6V0s0IYSbih8mEK4febQytIK5zzn4ddhoUtnSk=;
        b=QmUsw5PzO2lB98Z8QCXnTYlwK1j8zcJrov4lfSNyIIn825An4y5B8jOF1+k/d6a/10
         i68ZGdVWmsh+y+7N3+BN5oV1KQm7d+XUUn1OIipbImWUHCgtO0JnDzMHMUFk1NCd1v+e
         q1NspytZNW9QkeNchk5vEN3k0SL3GKkKNigjtyLTSitRfUPUMZCEhtBzl10knJk2zQo0
         Vietq8nMAFuy9E3uKPmd6phfkBIbbC0ozt04wQd/eO1D/8oVGhKv2znYvFHNCMarNM9T
         7++v7hVGijCq6qV/Mx9T6+vFqcebsjU3cEr/UqrR3eH79yqu0APq6Zk8H3NRsYtA0bVd
         AYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726468370; x=1727073170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbtsq6V0s0IYSbih8mEK4febQytIK5zzn4ddhoUtnSk=;
        b=o7LTtamwJoFdg/+7xNG5M1QV/9wuyzOo4+32B4D2j2GAAeiGVMEtwmiraDPitFpm3p
         VQ1tUzW3UgfgwAUx7oG2QdgWSfh7juQ1rpXxk0FSXTzLLHqazFgYgBlzojkwE3CW4ziL
         wMoCtuqmXQkJMy8zW36v5QY3ETBW+b2ffai8WkolAxl0pbdU1wywcUJOBVeqo+Ccxip8
         Z2lXKX9lM4flgYm5Ti/SGCpiagLr+W0UUWVgZ3okvZsj0kenYxJHGE/97dBo+ljxw7WH
         1i36r4UPpTNLcgflLxgRghleFmX94YHiddwvHZWtBd+GZAlA+IicJOSE/5toxYhMEnXW
         IjjA==
X-Forwarded-Encrypted: i=1; AJvYcCUCc0rDwDemW2cmZTIalfREXy7XTqDkztJ7EXfkB2dyyqfafo5u6QWFsPl0XRWV+CyzuC0ZSHAfu20=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPfAsueAG/FVehlmMemRam6JbYIK6TYy6eV+5FxLO2ZGWoCKJu
	MZ4T8girLchx6MX/UT25ItxG92Gleq4V+mhj4SbIbMNQJ4VoySxxqQZAU0M3Mg==
X-Google-Smtp-Source: AGHT+IH1WXLsH7/Vwcuq/2Ru7CsojYa1KPnjbbhDwOS3cec1Zwi56UU+IDqky7zWlBwPl0J7+8JU6g==
X-Received: by 2002:a17:907:1b05:b0:a72:69e8:f039 with SMTP id a640c23a62f3a-a902941d803mr1452078566b.12.1726468370231;
        Sun, 15 Sep 2024 23:32:50 -0700 (PDT)
Message-ID: <1b62f8bf-1dab-47a7-9016-b495757132f9@suse.com>
Date: Mon, 16 Sep 2024 08:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] xen/riscv: set up fixmap mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
 <779334f22d3770f7de6a630d2e6ace20c95bb32b.1726242605.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <779334f22d3770f7de6a630d2e6ace20c95bb32b.1726242605.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 17:57, Oleksii Kurochko wrote:
> Set up fixmap mappings and the L0 page table for fixmap support.
> 
> {set, clear}_fixmap() is expected to be implemented using
> map_pages_to_xen(), which, in turn, is only expected to use
> arch_pmap_map().

Now you've left out what you actually mean to justify here: The
exposure / direct access to xen_fixmap[]. I'd also suggest to
drop "only" - I guess I used that in a reply to v6 to emphasize
what I wanted to get across, but it makes not as much sense here.
Instead adding "during early boot" at the end of the sentence may
provide additional context.

> Define new macros in riscv/config.h for calculating
> the FIXMAP_BASE address, including BOOT_FDT_VIRT_{START, SIZE},
> XEN_VIRT_SIZE, and XEN_VIRT_END.
> 
> Update the check for Xen size in riscv/lds.S to use

Nit: xen.lds.S

> XEN_VIRT_SIZE instead of a hardcoded constant.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

With the adjustments (again doable while committing)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

