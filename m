Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF715172E6
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 17:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318969.538998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlY7n-0003rM-ON; Mon, 02 May 2022 15:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318969.538998; Mon, 02 May 2022 15:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlY7n-0003p3-KS; Mon, 02 May 2022 15:38:11 +0000
Received: by outflank-mailman (input) for mailman id 318969;
 Mon, 02 May 2022 15:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sPmK=VK=gmail.com=f.fainelli@srs-se1.protection.inumbo.net>)
 id 1nlY7m-0003ox-Fm
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 15:38:10 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9b3302-ca2d-11ec-a405-831a346695d4;
 Mon, 02 May 2022 17:38:09 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id p6so12988686pjm.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 May 2022 08:38:09 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 ba1-20020a170902720100b0015e8d4eb1e6sm4806927plb.48.2022.05.02.08.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 08:38:06 -0700 (PDT)
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
X-Inumbo-ID: dd9b3302-ca2d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G3glF1N1lkKRH3me6ZqnttV9WJnWFWFCivroWGr8uPw=;
        b=jnlfZk0MfWr19qnX7NNM7gjFbPrAaWIfsyMT/a2rh5ffB/v2pJfbjyvAq97gGIe7rG
         uTUMZLa+nH4Wi+FN1pN2qcbvqHIR7otQfoQlalMkw87IR+nh4GjHlRC2yY+aj07x7Zne
         zGxtELORRMhqCmhbzrZiK6h4L9mSjjEbD0e/BNWv1R3qQVzAWwb6BmkzUoGpIqPCgA0+
         2ObdH2Pg4hawFfFic1Il4G3F/+ejKXGEvbg5eg2rTiwMZw7T8927WOyZTHdoi9Cab9u+
         ja/WP8lvKP5PRcbOA34iZHYDbBB8sQnBVMJ+5O9kafsYw33rMK6sYehTkd+7FNKb5q1e
         OVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G3glF1N1lkKRH3me6ZqnttV9WJnWFWFCivroWGr8uPw=;
        b=nhjlqVN1GC51zHbnzj/OuOLqTWtpAMslCMM/rNSEHQQk41Vvi71XegfmwWLyEkLChk
         bqjeK0rez2/XThKH+6d+8Q2bOIsH8GQ819rLcBIhXB37NK1l+zlOk3qICHoPt/kn/ZQ+
         RCMWD6ym9tCAgtSsO1nHE6UvaSXMWshtkhyqOXw7G7Lq9UKgl7zxWdakzmc0/3CRX9Ts
         wLyq6tInqANiH0fpryhTLbiKmA2MPz/kECRoQLj5PW9482ZngzBRmkgR5wOj9eKNe9rj
         Wf7t1H4xuS6SS7gU9iomUdQ864yUhuuPp6Fk7S2SJq5zY+Qgw5rFNyD+cqVZtVIkcuXy
         G9Ow==
X-Gm-Message-State: AOAM531AVI2SJjR0UkkzxKt5yGytyv3QrORp6+srRmREbD8Pq090Fjxc
	L71Hlh0uXicCHvKNG/aAyiA=
X-Google-Smtp-Source: ABdhPJz2mcdlrFcmvMvPOd4zB8ruKzEKevBlh0oNjAFvQiI4OOjKtV9AXzvbEK94SOMfNeMR9xysnA==
X-Received: by 2002:a17:903:230f:b0:15e:6e55:3230 with SMTP id d15-20020a170903230f00b0015e6e553230mr12264443plh.35.1651505887371;
        Mon, 02 May 2022 08:38:07 -0700 (PDT)
Message-ID: <eaf3a893-00dd-8717-202e-911b395670e1@gmail.com>
Date: Mon, 2 May 2022 08:38:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
 vkuznets@redhat.com, will@kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-16-gpiccoli@igalia.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220427224924.592546-16-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/27/2022 3:49 PM, Guilherme G. Piccoli wrote:
> This patch improves the panic/die notifiers in this driver by
> making use of a passed "id" instead of comparing pointer
> address; also, it removes an useless prototype declaration
> and unnecessary header inclusion.
> 
> This is part of a panic notifiers refactor - this notifier in
> the future will be moved to a new list, that encompass the
> information notifiers only.
> 
> Fixes: 9eb60880d9a9 ("bus: brcmstb_gisb: add notifier handling")
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Not sure if the Fixes tag is warranted however as this is a clean up, 
and not really fixing a bug.
-- 
Florian

