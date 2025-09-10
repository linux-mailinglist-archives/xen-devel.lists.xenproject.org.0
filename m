Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596BB517DC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 15:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118245.1464099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwKqK-00047t-SB; Wed, 10 Sep 2025 13:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118245.1464099; Wed, 10 Sep 2025 13:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwKqK-00046B-PJ; Wed, 10 Sep 2025 13:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1118245;
 Wed, 10 Sep 2025 13:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwKqI-000465-V6
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 13:26:34 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c48b40d1-8e49-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 15:26:33 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45dd505a1dfso43374305e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 06:26:33 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df81c72edsm28526685e9.1.2025.09.10.06.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 06:26:31 -0700 (PDT)
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
X-Inumbo-ID: c48b40d1-8e49-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757510792; x=1758115592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UyO9lwvUP4MF7hak4fj1iSeZE9v5FUGZpfGxCuN8ZIk=;
        b=DEb5ls23JUdtffuGkzoN/YkD529J+hUyvmybD+ic2gpbu1pYhIpAzP5/HugPDrQCZw
         5pZ9iI9HssnK+8jR/XA/p9DS/+xsKaIvpYNihFPhwdlMhZs0pvOrw2nqgIpw9idpsJz5
         wehlOPqFSA2IpPcXhWOj98N565puuVr6lANuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510792; x=1758115592;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyO9lwvUP4MF7hak4fj1iSeZE9v5FUGZpfGxCuN8ZIk=;
        b=WcguUq3g2kLhvCjFFbG82x1eIXZc+0L9/DiSizVWtzkop4rOBuMKRvseOU2DsEfQIH
         2aIFdz412MXS6SQgrYw33UeZWjXMBibW6kI9+h1KaPOSEfJy8lkvr6sxpZMh79TQZtvA
         BRYRaCujboGevMdzMBy4A8o1h+EJg1MPTbwnXAFMJLlCP1ukF4VvOy7cL3WVtsklelRZ
         FPY4AxZSnn6k6LivBKqIqfNJZXhAbmj8LF6kTs768KBxORHzlogfq82u1jN4vXBKwp2s
         Lh4y6uC/vJlROFnerpkAomKhnwv9hP2O6kjJEBlqKi2FNf9XDCj8i5rKqyYGNTsUEJgx
         RxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzQKmUkaxz0RrqPBzOCtzX5hDfgzYIdRfdoV/rEhN1Pyt5pQHk/ecmFBl+PtVGQAUvQ8GUGH8QJDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyECbogz3RK3XlvNYSUJ1haCfhP/VD55/fClRN1J87qhURZvDgt
	Hp0hgFdNnUZwCdhOa5ZubpMiYg2QVFHpx/FMiRzJ8kN2s6ZuTw35krkCQWgHXgRBIxs=
X-Gm-Gg: ASbGncug2wimYbnAXst2avB7fH+6DPYJdSOU9jPsCWtdfZ09BEmrLHWBpEXabmqVJpl
	8Cew1F9EWaq5EWbhMnZzIPPX+iPxcnd2t58crR2xsxn/HNGxHRr0wFaeJ7Xe7tNbwlU/GND6R0E
	r4qxnihwUTNdPvJlcujlx8wQJJX+rGaH/wcco571PHvmL7p+AIo3QeSOCBadrnHHXgkxrZpKCOL
	FkrxaVAUXZ8PcE0Qg81mXwjIYQrip/Tw3JAWLdBsbqLdStfOvww1b6Iti1evrTbZ5ZUDu2Yu17b
	4rjJx9xBwzpd0rDAq2LT10T1dInam/YAnek4JPX7t0CEH25WBvbqZokNn3kqNz0SP+bzg045Ztm
	yPD6cSxMvpI+Uq9G1Ry/IIE3eUhgwzQ5i6tMDT6SQX2513iJ/WIbpg07rJYwrSSB19Kgv4X0HvH
	V3o7V/SlYts+T0SQ==
X-Google-Smtp-Source: AGHT+IGElgGFoDyljSjCkEbC4J1Xam49FWC4hAq0w5OnD+Olq5O6YGdFMZOMWyveohq5E1L1RRfy1A==
X-Received: by 2002:a05:600c:474e:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45dddecd894mr133709535e9.23.1757510792455;
        Wed, 10 Sep 2025 06:26:32 -0700 (PDT)
Message-ID: <bbe33d31-949c-4bf1-96f5-598b21faf149@citrix.com>
Date: Wed, 10 Sep 2025 14:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/IO-APIC: drop setup_ioapic_ids_from_mpc()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
 <034dd6dd-4e3f-4353-9a11-7a0ebda9a664@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <034dd6dd-4e3f-4353-9a11-7a0ebda9a664@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2025 8:55 am, Jan Beulich wrote:
> Along the lines of what b89f8f054f96 ("x86/apic: Drop sync_Arb_IDs()")
> said, the function is dead logic as well: All 64-bit capable Intel systems
> have (at least) xAPIC (if not x2APIC).
>
> Even if Eclair can't know it, such code is violating Misra rule 2.2 (dead
> code; we didn't accept that yet, but - where possible - we probably would
> better follow it). Depending on one's reading, this code may actually be a
> violation of rule 2.1 (unreachable), which we did accept:
>
> "Code is unreachable if, ..., there is no combination of program inputs
>  that can cause it to be executed."
>
> Otoh it's "only" __init code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The code change is fine, but the commit message should be first
paragraph only.

The first paragraph is plenty of justification to make the change,
irrespective of anything else.

The other 3 paragraphs are musings on an area of MISRA where which is
unclear, or even disputed.  The code here is statically reachable,
dynamically unreachable, and trying to argue this in terms of dead or
unreachability detracts from an otherwise clear patch.

With a very strong preference to have the commit message be only the
first paragraph, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

