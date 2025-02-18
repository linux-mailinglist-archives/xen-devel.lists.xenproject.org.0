Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35445A39511
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 09:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891112.1300201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkIrX-0007DZ-Kk; Tue, 18 Feb 2025 08:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891112.1300201; Tue, 18 Feb 2025 08:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkIrX-0007B6-HV; Tue, 18 Feb 2025 08:21:51 +0000
Received: by outflank-mailman (input) for mailman id 891112;
 Tue, 18 Feb 2025 08:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKhn=VJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tkIrW-0007B0-Rz
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 08:21:51 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6672def4-edd1-11ef-9aa6-95dc52dad729;
 Tue, 18 Feb 2025 09:21:49 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5452c2805bcso3994791e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 00:21:49 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545282cf459sm1489292e87.258.2025.02.18.00.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 00:21:48 -0800 (PST)
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
X-Inumbo-ID: 6672def4-edd1-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739866909; x=1740471709; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XGrGqZJEmVrFQA0XhUIG+chJsmm4p4+RoPHnQUNevo=;
        b=QhvSLO0G8kjgq9xulZGMlOGABVTC2wS8cEl0Cx9NmH0BwyjUJqaRNMFfh1K3jGOZEG
         +3qcGZEihOa+FVPky0MFYIyIykkW64Gz0wlcdSWPx7JIl7JC7owrqkj0SzjNpCImtTHM
         oCAWOazVC61ubUookqFSa5m/aA5KaLkWeMjiMyf1cpOWsJAaZ9SW61OeAsQQdFQQB/VN
         JOpYvpSThLGv4jygc7LxokiFqJPKqjO3SNM/8lLfIv/W4Y5WMF+MIu1RB6IEDSJn5j4+
         9SqQcvzn4MHTYMdcxsWZtWuqFhWUTYmSEKZyyY+FW1yzEarD452FpmbHkepaIZAhyQ1a
         VF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739866909; x=1740471709;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5XGrGqZJEmVrFQA0XhUIG+chJsmm4p4+RoPHnQUNevo=;
        b=dq1cXF+zZVBzWluwOOS8b+XN4LmcA8TlyjO50P/Y4bRqFS94/v4AKeZf4GnUmbw9s8
         zT5RFjOzK0DMnlvvKdEmJL5k66Q1j3yT2uFloIajVTaYZrx+rquXC2kJiLn6yHk6HDDy
         iBgeztVPIDzeGOH8Ta1NkyP68vMJRRKToKzgIqHmoKfl90DVtWrSoUxgABjDFbQmPa5v
         dtWUmfzD1ozdnKk7WhjL3nZFlCi76y/MNBBNLQvgP79vbvl4LuhwoZ4DOpJXsY/bfDu6
         UK0skBXcOa/wNxyePaoF0Rtd1mwx4cMwWqNfVJarHDR0Ks59E4PpAh68hRTkdXsTUAWp
         j6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5RVm52q/nWwVreLjr1jzCDyBC1vmRJ3aYHGosnzQjhtuFNKFRGFvjF/g+wyIwCEo2kTdou+CT6As=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTvRcM7PPfJbj5xw7Gqxvv5eloFmd2k2mI7nrrch+TutDmnLgk
	+KqSXqwBzpTryBQ3WowEeRfILHrR0PITADeOUsb9ISifTp8iHdzp
X-Gm-Gg: ASbGncvcmX6rXtKIAHnNwhL7+81c2FDwexhffX0IBkyTN5BRE/iqT+bojbIOKMHXMls
	Qi8lD5wi5d8EgH5dHUZ7BVvqLcejubH+SrdA5MPm2UvqmxZ4qCvZyC1RRH9EyZ24nEHYzyXhRDx
	B/moc9+33BRQdsNvF+2IX5qITq6X71vbY4YHgVQZOFPULO+c2AcFcPhNy/NPGIZbI/SboHKVVCF
	zYIcEYg+m7X8V3fRfYBciQiuOFsruMRZWbcL+7RSyK1hSCSAMKeWn6BRAvLMtZFSNzz1/wdVV96
	rtBxhscr+LTUbPUez4GqfSff
X-Google-Smtp-Source: AGHT+IGzJ4OFBmYOUYbo8kg1+f/bSu1ANUxoGhZC+bMf0zgQLIZbyZxlQUM9H6XWuCy7mYiYDyUzsw==
X-Received: by 2002:a05:6512:ba6:b0:545:bda:f20 with SMTP id 2adb3069b0e04-5452fe9041dmr4378306e87.32.1739866908503;
        Tue, 18 Feb 2025 00:21:48 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------e78UtPWOc30A6nAhCuPb5aug"
Message-ID: <e184844f-de92-4eb1-a24d-0b0518ebf112@gmail.com>
Date: Tue, 18 Feb 2025 09:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20(?) 1/3] xen/console: Fix truncation of panic()
 messages
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20250217194421.601813-1-andrew.cooper3@citrix.com>
 <20250217194421.601813-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250217194421.601813-2-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------e78UtPWOc30A6nAhCuPb5aug
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/17/25 8:44 PM, Andrew Cooper wrote:
> The panic() function uses a static buffer to format its arguments into, simply
> to emit the result via printk("%s", buf).  This buffer is not large enough for
> some existing users in Xen.  e.g.:
>
>    (XEN) ****************************************
>    (XEN) Panic on CPU 0:
>    (XEN) Invalid device tree blob at physical address 0x46a00000.
>    (XEN) The DTB must be 8-byte aligned and must not exceed 2 MB in size.
>    (XEN)
>    (XEN) Plea****************************************
>
> The remainder of this particular message is 'e check your bootloader.', but
> has been inherited by RISC-V from ARM.
>
> It is also pointless double buffering.  Implement vprintk() beside printk(),
> and use it directly rather than rendering into a local buffer, removing it as
> one source of message limitation.
>
> This marginally simplifies panic(), and drops a global used-once buffer.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich<jbeulich@suse.com>

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Julien Grall<julien@xen.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Ayan Kumar Halder<ayan.kumar.halder@amd.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> This taken from a security series (hence partially reviewed already), and
> thought it only applied to a forthcoming selftest, but then Ayan posted a
> truncated example to Matrix.
>
> Therefore this needs backporting, and might be wanted for 4.20 at this point.
> It's low risk and easy to test.
> ---
>   xen/drivers/char/console.c | 21 +++++++++++++--------
>   xen/include/xen/lib.h      |  2 ++
>   2 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 7da8c5296f3b..2926c97df9a4 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -962,11 +962,17 @@ static void vprintk_common(const char *prefix, const char *fmt, va_list args)
>       local_irq_restore(flags);
>   }
>   
> +void vprintk(const char *fmt, va_list args)
> +{
> +    vprintk_common("(XEN) ", fmt, args);
> +}
> +
>   void printk(const char *fmt, ...)
>   {
>       va_list args;
> +
>       va_start(args, fmt);
> -    vprintk_common("(XEN)", fmt, args); + vprintk(fmt, args); va_end(args); } @@ -1268,23 
> +1274,22 @@ void panic(const char *fmt, ...) va_list args; unsigned 
> long flags; static DEFINE_SPINLOCK(lock); - static char buf[128]; 
> spin_debug_disable(); spinlock_profile_printall('\0'); 
> debugtrace_dump(); - /* Protects buf[] and ensure multi-line message 
> prints atomically. */ + /* Ensure multi-line message prints 
> atomically. */ spin_lock_irqsave(&lock, flags); - va_start(args, fmt); 
> - (void)vsnprintf(buf, sizeof(buf), fmt, args); - va_end(args); - 
> console_start_sync(); printk("\n****************************************\n");
>       printk("Panic on CPU %d:\n", smp_processor_id());
> -    printk("%s", buf);
> +
> +    va_start(args, fmt);
> +    vprintk(fmt, args);
> +    va_end(args);
> +
>       printk("****************************************\n\n");
>       if ( opt_noreboot )
>           printk("Manual reset required ('noreboot' specified)\n");
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index 81b722ea3e80..130f96791f75 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -60,6 +60,8 @@ debugtrace_printk(const char *fmt, ...) {}
>   
>   extern void printk(const char *fmt, ...)
>       __attribute__ ((format (printf, 1, 2), cold));
> +void vprintk(const char *fmt, va_list args)
> +    __attribute__ ((format (printf, 1, 0), cold));
>   
>   #define printk_once(fmt, args...)               \
>   ({                                              \
--------------e78UtPWOc30A6nAhCuPb5aug
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/17/25 8:44 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250217194421.601813-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">The panic() function uses a static buffer to format its arguments into, simply
to emit the result via printk("%s", buf).  This buffer is not large enough for
some existing users in Xen.  e.g.:

  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Invalid device tree blob at physical address 0x46a00000.
  (XEN) The DTB must be 8-byte aligned and must not exceed 2 MB in size.
  (XEN)
  (XEN) Plea****************************************

The remainder of this particular message is 'e check your bootloader.', but
has been inherited by RISC-V from ARM.

It is also pointless double buffering.  Implement vprintk() beside printk(),
and use it directly rather than rendering into a local buffer, removing it as
one source of message limitation.

This marginally simplifies panic(), and drops a global used-once buffer.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250217194421.601813-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Ayan Kumar Halder <a class="moz-txt-link-rfc2396E" href="mailto:ayan.kumar.halder@amd.com">&lt;ayan.kumar.halder@amd.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

This taken from a security series (hence partially reviewed already), and
thought it only applied to a forthcoming selftest, but then Ayan posted a
truncated example to Matrix.

Therefore this needs backporting, and might be wanted for 4.20 at this point.
It's low risk and easy to test.
---
 xen/drivers/char/console.c | 21 +++++++++++++--------
 xen/include/xen/lib.h      |  2 ++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7da8c5296f3b..2926c97df9a4 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -962,11 +962,17 @@ static void vprintk_common(const char *prefix, const char *fmt, va_list args)
     local_irq_restore(flags);
 }
 
+void vprintk(const char *fmt, va_list args)
+{
+    vprintk_common("(XEN) ", fmt, args);
+}
+
 void printk(const char *fmt, ...)
 {
     va_list args;
+
     va_start(args, fmt);
-    vprintk_common("(XEN) <a class="moz-txt-link-rfc2396E" href="mailto:,fmt,args);+vprintk(fmt,args);va_end(args);}@@-1268,23+1274,22@@voidpanic(constchar*fmt,...)va_listargs;unsignedlongflags;staticDEFINE_SPINLOCK(lock);-staticcharbuf[128];spin_debug_disable();spinlock_profile_printall('\0');debugtrace_dump();-/*Protectsbuf[]andensuremulti-linemessageprintsatomically.*/+/*Ensuremulti-linemessageprintsatomically.*/spin_lock_irqsave(&amp;lock,flags);-va_start(args,fmt);-(void)vsnprintf(buf,sizeof(buf),fmt,args);-va_end(args);-console_start_sync();printk(">", fmt, args);
+    vprintk(fmt, args);
     va_end(args);
 }
 
@@ -1268,23 +1274,22 @@ void panic(const char *fmt, ...)
     va_list args;
     unsigned long flags;
     static DEFINE_SPINLOCK(lock);
-    static char buf[128];
 
     spin_debug_disable();
     spinlock_profile_printall('\0');
     debugtrace_dump();
 
-    /* Protects buf[] and ensure multi-line message prints atomically. */
+    /* Ensure multi-line message prints atomically. */
     spin_lock_irqsave(&amp;lock, flags);
 
-    va_start(args, fmt);
-    (void)vsnprintf(buf, sizeof(buf), fmt, args);
-    va_end(args);
-
     console_start_sync();
     printk("</a>\n****************************************\n");
     printk("Panic on CPU %d:\n", smp_processor_id());
-    printk("%s", buf);
+
+    va_start(args, fmt);
+    vprintk(fmt, args);
+    va_end(args);
+
     printk("****************************************\n\n");
     if ( opt_noreboot )
         printk("Manual reset required ('noreboot' specified)\n");
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 81b722ea3e80..130f96791f75 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -60,6 +60,8 @@ debugtrace_printk(const char *fmt, ...) {}
 
 extern void printk(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2), cold));
+void vprintk(const char *fmt, va_list args)
+    __attribute__ ((format (printf, 1, 0), cold));
 
 #define printk_once(fmt, args...)               \
 ({                                              \
</pre>
    </blockquote>
  </body>
</html>

--------------e78UtPWOc30A6nAhCuPb5aug--

