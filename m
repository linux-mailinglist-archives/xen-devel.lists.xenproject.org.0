Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE58813F00
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 02:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654813.1022211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDwhR-00045U-5p; Fri, 15 Dec 2023 01:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654813.1022211; Fri, 15 Dec 2023 01:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDwhR-00042b-35; Fri, 15 Dec 2023 01:09:09 +0000
Received: by outflank-mailman (input) for mailman id 654813;
 Fri, 15 Dec 2023 01:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3yi=H2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rDwhO-00042E-NA
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 01:09:06 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87d2014f-9ae6-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 02:09:00 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so1613435e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 17:09:00 -0800 (PST)
Received: from [192.168.188.81] ([81.6.40.96])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a05600000c900b0033330846e76sm17433020wrx.86.2023.12.14.17.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 17:08:59 -0800 (PST)
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
X-Inumbo-ID: 87d2014f-9ae6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702602540; x=1703207340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9q2YIiSgoRTyD6YcDpdgmC6AZSRx+Tm7VqsNiyuBDY=;
        b=TMaS5jQ2s1lp6ezkvD+6Sy5udY7bKgSjL9W7s9adtFRvFUpDbzMVjl7XXxGDV+oNPN
         Vyew5eqreJQEThAw5OlB7IOnqe9k+BizosOorfat83IH9SykIFdml+WAKtHHQRY5EM0E
         0NFGs6JxXTQlXXYzmA1zECNJkZFbZo6in9Rwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702602540; x=1703207340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F9q2YIiSgoRTyD6YcDpdgmC6AZSRx+Tm7VqsNiyuBDY=;
        b=Fj31N6JCjo67DCm1x7vNT2vuB4pjLtp66hzUKrn9cjh2HNYNVCU1iZTEJ0deJeyhlR
         TDBgqd+qimZbLzDAODNVr6jalI61QgtfxBBK3tSemY6F2BotEqpZl1NvEFbjRq00d3Uh
         AIARP42nRJzoNFZ5007jXmrwzscD53NfQQbFd8cYy99DPwOph8cMeqxDW4Us5ONthAP8
         eNIsKI/phnOKCcWcZz9IpZDy99W0ZRBYU6dK6WfkkRV7APhTPceALQz9r3wSxYwVmOGQ
         VWvDs7x2vkbqVGtLb1q6Du/g+zEwr55TQroZon2Cer5PT4sB/S+1zW0SPd3u+MX4ODTn
         Sz+A==
X-Gm-Message-State: AOJu0YxMIXsvN26l66rWlBox+DaH+vHzzTHcDjGbh6iJzCHZ3QHAeSw6
	4GRJXcRWjii9Mcc5gpqzj4uaLw==
X-Google-Smtp-Source: AGHT+IEskJWNPNs/l0/dyl+45Io8m4/eZ42InVnFf5AA14yjbXWnYjcAyKXyCafZiOJVTXmu5cfVYg==
X-Received: by 2002:a05:600c:548c:b0:40b:54ef:ff07 with SMTP id iv12-20020a05600c548c00b0040b54efff07mr5415191wmb.32.1702602540101;
        Thu, 14 Dec 2023 17:09:00 -0800 (PST)
Message-ID: <7c10c729-cd9c-45cd-9ae1-d8baaae7d591@citrix.com>
Date: Fri, 15 Dec 2023 01:08:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] xen/bug: introduce bug_fn_nonconst_t to validate
 run_in_exception_handle()
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <3423244b0b1506d2a928799d80e15c19add75566.1702570086.git.federico.serafini@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3423244b0b1506d2a928799d80e15c19add75566.1702570086.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/12/2023 4:35 pm, Federico Serafini wrote:
> Introduce function type bug_fn_nonconst_t (as opposed to bug_fn_t)
> to validate the argument passed to run_in_exception_handle().
>
> Place the definition of bug_fn_nonconst_t before of asm/bug.h inclusion
> so that arch-specific implementations of run_in_exception_handler() can
> use it (and move bug_fn_t into the same place for the same reason).
>
> Furthermore, use bug_fn_nonconst_t to address violations of
> MISRA C:2012 Rule 8.2  ("Function types shall be in prototype form with
> named parameters").
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> At the moment, bug_fn_t can not be used within run_in_exception_handler()
> because of the const qualifier on the formal parameter.
> I tried to adjust the constness of the functions passed to
> run_in_exception_handler but at a certain point I stopped:
> a lot of code churn is required and I am not sure about the correctenss of the
> result.

run_in_exception_handler() should be bug_fn_t.  Any mutation of the
pointer passed in is UB, as it corrupts state behind C's back.

In fact, it's not right for any of the IRQ infrastructure to take a regs
pointer, because the pointer can't be safely be mutated reasons, *and*
its not relevant content for an interrupt handler to peek at (except
perhaps a profiler).  Furthermore, there is even a way to recover the
regs pointer if you really need it, via get_irq_regs().

From a safety perspective, dropping the regs parameter would be a very
good thing.  It shrinks the compiled binary (don't need to spill and
recover the pointer in all the infrastructure), and it will avoid
needing to answer awkward questions such as "why are you passing around
a pointer that you can't legally read or write?"  But it's also a lot of
work and definitely out of scope for run_in_exception_handler()

> So, I came up with this solution, taking inspiration from the exising functions
> show_execution_state() and show_execution_state_nonconst().

show_execution_state_nonconst() is a bodge of mine to use a const-taking
function in an API wanting a non-const pointer, and it only exists
because I didn't have time to untangle this mess while working to
security embargo.

The only path I can see which actually mutates the pointer is
do_debug_key() into debugger_trap_fatal() into GDBstub's
process_command().  However, it's a debugger making arbitrary state
changes, so can cast away const in order to do so.

> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> index cb5138410e..c6f5594af5 100644
> --- a/xen/include/xen/bug.h
> +++ b/xen/include/xen/bug.h
> @@ -99,18 +111,15 @@ struct bug_frame {
>  
>  #endif
>  
> -struct cpu_user_regs;
> -typedef void bug_fn_t(const struct cpu_user_regs *regs);
> -
>  #ifndef run_in_exception_handler
>  
>  /*
>   * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
>   * and use a real static inline here to get proper type checking of fn().
>   */

I'm pretty sure this TODO can be completed now that we have xen/macros.h

In fact, the fact there's a common run_in_exception_handler() provided
now also helps simplify some of the other cases.


I would much rather that we fix run_in_exception_handler() to use
bug_fn_t than to continue hacking around the breakage.  I really don't
think it's terribly complicated to fix now.

~Andrew

