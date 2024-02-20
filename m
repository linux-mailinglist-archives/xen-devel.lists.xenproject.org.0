Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40C85B5DC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683252.1062689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLqS-0001e6-K0; Tue, 20 Feb 2024 08:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683252.1062689; Tue, 20 Feb 2024 08:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLqS-0001bd-HL; Tue, 20 Feb 2024 08:51:20 +0000
Received: by outflank-mailman (input) for mailman id 683252;
 Tue, 20 Feb 2024 08:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLqR-0001bV-K2
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:51:19 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36810bef-cfcd-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 09:51:18 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso28474595e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:51:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfcd0e000000b0033d14c96ec1sm12607957wrm.45.2024.02.20.00.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:51:17 -0800 (PST)
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
X-Inumbo-ID: 36810bef-cfcd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708419078; x=1709023878; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=09ANSO5LYiG62Dw0zQaLZ0AeDC8RORPldvSVf/QkRgE=;
        b=FPlNtrgA6DyRRkzeK9Y8ST/ETGUPPkK4DUA5d4nztd01QLt0fPcgoNxvANHq2XfQd/
         Kx5/5wfZKn52ghMCtgUs9gH/rIPdqFcMaNXNgkI6SxWR24Ki6iDURFUufVwhSFawMgR4
         Qfc56KqP1nyd9NtYXDy3jmN7Z1d2nN0GfaDETDRWETLaCjo0Me6jbTuemLCboktvOxLL
         LaBudJx4LqiriidoLH6zEGv667QA9nGkATEMStqepPYImSWKtp6VDHUnndEWWfvMWVmT
         SCcaRrQetJfDntywcdIDgn02p67lGkWP64iXsFzWtiHMNSp8/1qRevWxQkA9nCmqqJTf
         OA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419078; x=1709023878;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09ANSO5LYiG62Dw0zQaLZ0AeDC8RORPldvSVf/QkRgE=;
        b=o1/YiBehsH+u2KI3X6luBnf7HTt/A523g3DjI+FPBC8yNFeMxr49tN7d6XgQOVRFWS
         ctZ+gPIKk0ERGPC+xkDz8/TZ95i1Fwz+jrbs0iLV1ihGpVTi6V4uXhMNnie66cIFHWo7
         tkUoFcm5UaLBpgGuU1Mwwko6h0soYSUIGMxOrtZAnZ6PslE7qY9pCTFSypliC98DLlqI
         hagALAECFrcznI6LYnkHs+MNkix0VLSBlnhelxvuxMKgYt51t9HR86xbK0cxanMUTJvA
         rQeFd3GASG0HR1YSdyfkRw45N8M2/aFsapvNngKZ7JrQzYNKYguPiFi7h+7R+wsbg+az
         nGvA==
X-Gm-Message-State: AOJu0YwhcnhNS1b5U/KbzHxbNE6RE7cWy4ULaHyk/eJjAI4sZ21fT6QW
	MpV0x4ywUOV+Xgfj6+NeIF8jcS1MoUOcz91Vdc8DJSj/3wzYZfV+hhP9Fh8uh+qytR2Ug2Hw/ec
	=
X-Google-Smtp-Source: AGHT+IGGnQO3MvuIv3Z0vWdAcnZcAW4DMbgAdvS1W7Z3xJcfLj47AoDY+WEhXjw+0rYVHLwdxYpbiA==
X-Received: by 2002:a5d:698b:0:b0:33d:50cd:b9ba with SMTP id g11-20020a5d698b000000b0033d50cdb9bamr2780820wru.21.1708419078076;
        Tue, 20 Feb 2024 00:51:18 -0800 (PST)
Message-ID: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
Date: Tue, 20 Feb 2024 09:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/8] limit passing around of cpu_user_regs
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unlike (synchronous) exception handlers, interrupt handlers don't normally
have a need to know the outer context's register state. Similarly, the vast
majority of key handlers has no need for such.

1: serial: fake IRQ-regs context in poll handlers
2: keyhandler: drop regs parameter from handle_keyregs()
3: serial: drop serial_rx_fn's regs parameter
4: PV-shim: drop pv_console_rx()'s regs parameter
5: serial: drop serial_[rt]x_interrupt()'s regs parameter
6: IRQ: drop regs parameter from handler functions
7: x86/APIC: drop regs parameter from direct vector handler functions
8: consolidate do_bug_frame() / bug_fn_t

I think it is now only the lack of an ack for the 1st patch which is keeping
this series from going in.

Jan

