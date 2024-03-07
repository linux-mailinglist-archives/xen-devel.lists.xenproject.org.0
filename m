Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8ED875B26
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 00:35:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690066.1075728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riNGN-0007of-Iy; Thu, 07 Mar 2024 23:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690066.1075728; Thu, 07 Mar 2024 23:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riNGN-0007mM-GI; Thu, 07 Mar 2024 23:34:59 +0000
Received: by outflank-mailman (input) for mailman id 690066;
 Thu, 07 Mar 2024 23:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXJj=KN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1riNGM-0007mC-7p
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 23:34:58 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eb2b697-dcdb-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 00:34:57 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-413161dae46so4488755e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 15:34:57 -0800 (PST)
Received: from [192.168.86.29] ([83.104.235.82])
 by smtp.gmail.com with ESMTPSA id
 bq26-20020a5d5a1a000000b0033e2777f313sm16689938wrb.72.2024.03.07.15.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 15:34:56 -0800 (PST)
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
X-Inumbo-ID: 4eb2b697-dcdb-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709854497; x=1710459297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+77g2/BzW4D6dQgLN0/JFcef5gXJ4V23qaqh5TBrxg=;
        b=eMl2W1PhlLyeW6e+9/ZxvlIzQvkooou8mN1moQTurd1w3Lg7OCFKti7Ieag5Ux1AV7
         B3Zp/MK5y8XP8+aZoljh1LFVOxNNRrghZSfSFkqbiu1Bo4Oq6T24CVG9g+I9aH4D1bCl
         0zK371DOwM3rCRlqx0tu0cCNwErKybrgrFCnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854497; x=1710459297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+77g2/BzW4D6dQgLN0/JFcef5gXJ4V23qaqh5TBrxg=;
        b=UxYFcGyLi5Ju5kciPtWD9nDQ10yh/CHz/f/ha+sxPlVgvNmPntmszvpgE6cCPH89rZ
         ZSe0eJff6ImO3aXQwTBsTcwRJIw2RHKb4hx5IYJrBjW8fk1nqSULD8WaipB2Bc7p/dj/
         k9jYyixqj4aciiY7fqTcchR2x78v5s0POs9MyhOgHqyV1MFIubozoGAQiUK3AmPhMi+L
         YT+P2R6jZgMJaGEOKBzX0oQwL/Z4hfDobnd/CrWyM5xYtARSD7vt6Vl8RTnjn+16BIYG
         yam1e9S4M8CbjFyEP69YfNc0iDWZ/8ApkGW4GTHjEqb2PY5qY5UeMqLJc8127T3cANcB
         2ZSw==
X-Forwarded-Encrypted: i=1; AJvYcCVw1Rte9benVMUzwDboP1C2TKlKQuKj64GQ/kJkXdwsTQVaevvaYjwDEh07tQP15NyFGlbYbQu3MD7HKq1GoQgxFlc/6lkUgh/JZbcq0TI=
X-Gm-Message-State: AOJu0Yy+Yi1HHXVU5z52fS1aY7QMGWPryusskrKwZMNHXofqfR6YPG28
	T4Eun5I2pP8f7DIm+Oxp5ulzd24gdEEjEtXxKEO3UDqykoIxaP6LFWe+GV3Smr0=
X-Google-Smtp-Source: AGHT+IGrGKQWuMQ4tPH6GIWCn/tTFolVkrBDaH68V6+6u877hjgNd+60aaXsGBE0OzaZEaMasMfkuQ==
X-Received: by 2002:a5d:4144:0:b0:33d:d2bc:bf41 with SMTP id c4-20020a5d4144000000b0033dd2bcbf41mr13795897wrq.31.1709854496721;
        Thu, 07 Mar 2024 15:34:56 -0800 (PST)
Message-ID: <715771bb-bff4-46d7-82b0-d0ad6d7a33ae@citrix.com>
Date: Thu, 7 Mar 2024 23:34:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/svmdebug: Print sev and sev_es vmcb bits
Content-Language: en-GB
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, wl@xen.org
References: <cover.1709846387.git.vaishali.thakkar@vates.tech>
 <9cc6b407ec3b45f034b7deb6f5f44a561eecca47.1709846387.git.vaishali.thakkar@vates.tech>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9cc6b407ec3b45f034b7deb6f5f44a561eecca47.1709846387.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2024 9:40 pm, Vaishali Thakkar wrote:
> diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
> index 24358c6eea..f54b426fb3 100644
> --- a/xen/arch/x86/hvm/svm/svmdebug.c
> +++ b/xen/arch/x86/hvm/svm/svmdebug.c
> @@ -53,6 +53,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>             vmcb->exitinfo1, vmcb->exitinfo2);
>      printk("np_ctrl = %#"PRIx64" guest_asid = %#x\n",
>             vmcb_get_np_ctrl(vmcb), vmcb_get_guest_asid(vmcb));
> +    printk("sev = %d sev_es = %d\n",
> +           vmcb_get_sev(vmcb), vmcb_get_sev_es(vmcb));

Hmm.  These are covered by the previous line printing all of np_ctrl. 
What about rearranging the previous line to be something like:

printk("asid: %#x, np_ctrl: %#"PRIx64" -%s%s%s\n",
    vmcb->_asid, vmcb->_np_ctrl,
    vmcb->_np ? " NP" : "",
    vmcb->_sev ? " SEV" : "",
    ...);

This is more compact (things like "guest" in "guest asid" is entirely
redundant), and provides both the raw _np_ctrl field and a bit-by-bit
decode on the same line, rather than having different parts of the info
on different lines and bools written out in longhand?

See xen/arch/x86/spec_ctrl.c: print_details() for a rather more complete
example of this style of printk() rendering for bits, including how to
tabulate it for better readability.

~Andrew

