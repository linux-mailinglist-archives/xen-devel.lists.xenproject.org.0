Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083AA3BE53
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892800.1301748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjMs-0007eT-T4; Wed, 19 Feb 2025 12:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892800.1301748; Wed, 19 Feb 2025 12:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjMs-0007bL-Pc; Wed, 19 Feb 2025 12:39:58 +0000
Received: by outflank-mailman (input) for mailman id 892800;
 Wed, 19 Feb 2025 12:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVer=VK=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tkjMr-0007bF-Sh
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:39:57 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f2d47a4-eebe-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 13:39:55 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5461a485aa2so3087843e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:39:55 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452cb59c35sm1780785e87.203.2025.02.19.04.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:39:53 -0800 (PST)
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
X-Inumbo-ID: 9f2d47a4-eebe-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968795; x=1740573595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1q8iUaPMB6K0l5cfmZmVl21dp1hs01pLrf3sGlLarQA=;
        b=eKUcNsnj8CTSDttWuOeodeIyjuYHQAvtvL5n2UpGYOXLSN8kReQm8H8i9vQTbk9XMw
         1ChF9yFIbReVskeqXVNIBWEoS69jTQ45p48q6xGq+texfCMRxLiUrL/ynqffAdhR8NeS
         GpulnCG1/cvgLyj4+SLbWjovBh9K/28sof2P9wG6cQ2ONL2+WGOgdkgV4arrG8cDS+Dc
         L+s9f2Kvh29RLJGjaNTNSkoaAWJPm4pyNuYwPSsB0g6zPHYt9kj3gzkP9T10jEJ8/NWD
         TH/+VERceIjeeyQGEbROg3wrQcZtOl8JLhoOvPEBU0VP2+g5XaMgOBDKxlZdZzoR6S3+
         bleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968795; x=1740573595;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1q8iUaPMB6K0l5cfmZmVl21dp1hs01pLrf3sGlLarQA=;
        b=w4lj0dBM7zmJya0cwAyu3YTufGeIk+7/+exBrE01jzXyZ8PVs8UGbo2ZuKhLJ1HhBn
         /DU2sxUUqn6Pieo08tFdbiF1tSdcxRqGosYCD6mKe/vs+MY+Wqh3j8uk8rUT0iADEpin
         ct+9Fh+WExxmjiPd6/G1jdX25pXGa03DvnyjpRnodlEtpr53lyTpOHJoFUP495o/6LC8
         SHi/uDGCQE4RbfsoceOdxYDM5UhDt/P0tFWonYCqKeZ0dBjDcOTDDNxLrIWnMo2ojNGw
         sw025om7NoNWQXu04YRjrTuDn3TIGIdsOOr3VzMr5y9jCVIuWqu2DwqMV5a2fnplWi+A
         5GDg==
X-Forwarded-Encrypted: i=1; AJvYcCVl0XrGMyB8uzzsPit+0Q0uGjo8cKCbRTLVY7YoLDGfnrXg/2QVdTSj09hKUot8JjwKq/J1TzyvyXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydIF0gcy77cM262Vyd/lrIdi2I1R+rnfgv7eeVUqo++x3xNsBk
	6uj3keYxXFJemHc5SfAUBL4IADSKI9kNv/ShQy+ndisqXPENAMtj
X-Gm-Gg: ASbGncvs3SRal3E12433n6rrmsd2/uR13yaYKUvellk/jWnNeQYyFr82PkhzB/Raj14
	J/EkqHXumuVavnLEpZLUDalnrUoiGwNhEBLxyi/4t/pAm7zlS+TwIsjBUU8NYzF6vac72ZizjMZ
	WX0BB3QI3pZiQUvH4KKst0StJ2qjpV0QqRTuY/SBw41O0sm8JUkHQWhkwVaqB0UPKdNvAPaM46W
	ziO+A0QcLOMfHNfXHbLKn6s92f+M/yZyn9zEDXXwQqLN2538knSl0dgP3EdX9qCai2Ca+UJ+Qcd
	eVjCXXXaQmIP8osg
X-Google-Smtp-Source: AGHT+IHw7+7M9I6Wejqp6kiqMOJ2f68FdSbjlRxOQG4UbKSIKgkmUat9S0rhN1YHbSYkLzhPwXB5jw==
X-Received: by 2002:a05:6512:1244:b0:545:3031:40aa with SMTP id 2adb3069b0e04-5462eedb5c2mr1346285e87.9.1739968794324;
        Wed, 19 Feb 2025 04:39:54 -0800 (PST)
Message-ID: <6f133e51-17b5-4edf-8db3-5c9b91028898@gmail.com>
Date: Wed, 19 Feb 2025 14:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/2] code style: Format ns16550 driver
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com,
 roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <20250216102108.2665222-2-andr2000@gmail.com>
 <5ed54fcf-d4fd-4ec0-8c40-1e50d9b16ae2@suse.com>
Content-Language: en-US
In-Reply-To: <5ed54fcf-d4fd-4ec0-8c40-1e50d9b16ae2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Jan!

On 17.02.25 12:20, Jan Beulich wrote:
> On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -14,7 +14,7 @@
>>    * abstracted.
>>    */
>>   #if defined(CONFIG_HAS_PCI) && defined(CONFIG_X86)
>> -# define NS16550_PCI
>> +#define NS16550_PCI
>>   #endif
> Hmm. Either form ought to be okay, so the line would want leaving untouched.
This is controlled by PPIndentWidth option [1]:
we have it set to "-1" which means "When set to -1 (default) *IndentWidth*
is used also for preprocessor statements."

Unfortunately, I was not able to see a change with PPIndentWidth + IndentWidth

PPIndentWidth: -1
IndentWidth: 4

--- test_define.c    2025-02-19 11:20:30.708096428 +0200
+++ test_define_minus1.c    2025-02-19 11:21:42.313013373 +0200
@@ -1,5 +1,5 @@
  #ifdef __linux__
-# define FOO
+#define FOO
  #else
-# define BAR
+#define BAR
  #endif

PPIndentWidth: 1
IndentWidth: 4

--- test_define.c    2025-02-19 11:20:30.708096428 +0200
+++ test_define_1.c    2025-02-19 11:23:46.986618706 +0200
@@ -1,5 +1,5 @@
  #ifdef __linux__
-# define FOO
+#define FOO
  #else
-# define BAR
+#define BAR
  #endif

I thought it is a bug in the latest clang-format (21), but I was not able to
get the expected result with clang-format 18 as well. I am not sure if
I'm doing anything wrong with .clang-format, but this works one way
for me as ow now.
Takeaway: I was not able to control this, but the result seems to be acceptable
It should be noted in the coding style though
>> @@ -43,12 +43,12 @@
>>   
>>   static struct ns16550 {
>>       int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
>> -    u64 io_base;   /* I/O port or memory-mapped I/O address. */
>> +    u64 io_base; /* I/O port or memory-mapped I/O address. */
>>       u64 io_size;
>>       int reg_shift; /* Bits to shift register offset by */
> Breaking alignment between comments (also in the immediately following hunk),
> while at the same time ...
This one...
>>       int reg_width; /* Size of access to use, the registers
>>                       * themselves are still bytes */
> ... not taking care of the comment style violation here?
This is controlled by ReflowComments option [3]:

 From the tool point of view the comment is formatted correctly
I didn't find a way to convert such comments into
/*
  * Size of access to use, the registers * themselves are still bytes */ if this is what you mean.
>> @@ -63,8 +63,8 @@ static struct ns16550 {
>>       bool dw_usr_bsy;
>>   #ifdef NS16550_PCI
>>       /* PCI card parameters. */
>> -    bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
>> -    bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
>> +    bool pb_bdf_enable; /* if =1, pb-bdf effective, port behind bridge */
>> +    bool ps_bdf_enable; /* if =1, ps_bdf effective, port on pci card */
> (Just leaving this here for context of the earlier comment.)
... and this one. It seems that the tool tries to always have a single space before
the comment. There is an option SpacesBeforeTrailingComments [2] which
unfortunately only controls C++ style comments and "...does not affect trailing
block comments (|/*| - comments)..."
So, it seems that this is the rule to consider
>> @@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
>>       if ( ns16550_ioport_invalid(uart) )
>>           return -EIO;
>>   
>> -    return ( (ns_read_reg(uart, UART_LSR) &
>> -              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
>> +    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
>> +               ? uart->fifo_size
>> +               : 0;
> Indentation of the ? and : lines is clearly wrong here? What is the tool
> doing?
There are number of options that have influence on this formatting:
AllowShortBlocksOnASingleLine [4]
BreakBeforeTernaryOperators [5]
AlignOperands [6]

I was not able to tweak these options to have the previous form.
>> @@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
>>   #ifdef NS16550_PCI
>>       if ( uart->bar && uart->io_base >= 0x10000 )
>>       {
>> -        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>> -                                  uart->ps_bdf[2]),
>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>> +        pci_conf_write16(
>> +            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
>> +            PCI_COMMAND,
>> +            PCI_COMMAND_MEMORY);
>>           return;
>>       }
> Hmm, transforming a well-formed block into another well-formed one. No
> gain? (Same again further down.)
No, gain from human point of view
But there is a gain that it is now formatted automatically.
>> @@ -335,14 +338,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>       else
>>       {
>>           /* Baud rate already set: read it out from the divisor latch. */
>> -        divisor  = ns_read_reg(uart, UART_DLL);
>> +        divisor = ns_read_reg(uart, UART_DLL);
>>           divisor |= ns_read_reg(uart, UART_DLM) << 8;
> An example where tabulation is being broken. There are quite a bit worse
> ones further down.
This one will be impossible to implement with clang-format IMO.
Because there are cases where you want this (like above) and you know why:
the assignments look prettier here that way. But this doesn't mean
that in some other places other assignments will look got for you if
formatted the same way.
The question here what is the metric (human perception?) in this case
and how this perception can be be programmed into clang-format
configuration?
>> @@ -350,8 +353,10 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>>       ns_write_reg(uart, UART_MCR, UART_MCR_DTR | UART_MCR_RTS);
>>   
>>       /* Enable and clear the FIFOs. Set a large trigger threshold. */
>> -    ns_write_reg(uart, UART_FCR,
>> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
>> +    ns_write_reg(uart,
>> +                 UART_FCR,
>> +                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>> +                     UART_FCR_TRG14);
> What's the underlying indentation rule here? The way it's re-formatted
> certainly looks odd to me. What we occasionally do in such cases is add
> parentheses:
>
>      ns_write_reg(uart,
>                   UART_FCR,
>                   (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>                    UART_FCR_TRG14));
>
> Also - does the format they apply demand one argument per line? Else
> why not
>
>      ns_write_reg(uart, UART_FCR,
>                   (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
>                    UART_FCR_TRG14));
>
> Plus what's their criteria to choose between this style of function calls
> and the one in context higher up for calls to pci_conf_write16()?
This is controlled with AlignAfterOpenBracket [7]
So this could be:
*AlignAfterOpenBracket: Align*

-    ns_write_reg(uart, UART_FCR,
-                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
+    ns_write_reg(uart,
+                 UART_FCR,
+                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
+                     UART_FCR_TRG14);

*AlignAfterOpenBracket: |DontAlign*

-    ns_write_reg(uart, UART_FCR,
-                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
+    ns_write_reg(uart,
+        UART_FCR,
+        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);

|*AlignAfterOpenBracket: |AlwaysBreak*

-    ns_write_reg(uart, UART_FCR,
-                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
+    ns_write_reg(
+        uart,
+        UART_FCR,
+        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);

|*AlignAfterOpenBracket: |BlockIndent*

-    ns_write_reg(uart, UART_FCR,
-                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
+    ns_write_reg(
+        uart,
+        UART_FCR,
+        UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14
+    );

||
|
>> @@ -424,31 +430,37 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>>   
>>       /* Calculate time to fill RX FIFO and/or empty TX FIFO for polling. */
>>       bits = uart->data_bits + uart->stop_bits + !!uart->parity;
>> -    uart->timeout_ms = max_t(
>> -        unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
>> +    uart->timeout_ms =
>> +        max_t(unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
> Again both forms look conforming to me. I think there's a general issue
> with the tool making transformations when none are needed. I won't
> further point out any such.
Again, this is something which a human can decide what is better for
their taste. clang-format won't be able to treat such cases differently
>> @@ -1197,7 +1174,9 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
>>   
>>                   nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
>>                                                  PCI_HEADER_TYPE) &
>> -                               0x80)) ? f + 1 : 8;
>> +                               0x80))
>> +                            ? f + 1
>> +                            : 8;
> Again the odd indentation of ? and :.
>
>> @@ -1422,19 +1409,19 @@ struct serial_param_var {
>>    * com_console_options for serial port com1 and com2.
>>    */
>>   static const struct serial_param_var __initconst sp_vars[] = {
>> -    {"baud", baud_rate},
>> -    {"clock-hz", clock_hz},
>> -    {"data-bits", data_bits},
>> -    {"io-base", io_base},
>> -    {"irq", irq},
>> -    {"parity", parity},
>> -    {"reg-shift", reg_shift},
>> -    {"reg-width", reg_width},
>> -    {"stop-bits", stop_bits},
>> +    { "baud",      baud_rate  },
>> +    { "clock-hz",  clock_hz   },
>> +    { "data-bits", data_bits  },
>> +    { "io-base",   io_base    },
>> +    { "irq",       irq        },
>> +    { "parity",    parity     },
>> +    { "reg-shift", reg_shift  },
>> +    { "reg-width", reg_width  },
>> +    { "stop-bits", stop_bits  },
>>   #ifdef CONFIG_HAS_PCI
>> -    {"bridge", bridge_bdf},
>> -    {"dev", device},
>> -    {"port", port_bdf},
>> +    { "bridge",    bridge_bdf },
>> +    { "dev",       device     },
>> +    { "port",      port_bdf   },
>>   #endif
>>   };
> Interesting - here tabulation is being introduced.
This is controlled with AlignArrayOfStructures [8] and
we can have it as is if we set it to None
The same was discussed before, so one can refresh that at [9]

>> @@ -1706,7 +1704,7 @@ static void __init ns16550_parse_port_config(
>>       if ( !parse_namevalue_pairs(str, uart) )
>>           return;
>>   
>> - config_parsed:
>> +config_parsed:
> This is a no-go - ./CODING_STYLE specifically says why this isn't appropriate.
Yes, it can't formatted as we wish. This is controlled with IndentGotoLabels [10]
and is a binary option, which leaves no means to disable it as both true and
false will re-format the code

true:false:
intf(){vs.intf(){
if(foo()){if(foo()){
label1:label1:
bar();bar();
}}
label2:label2:
return1;return1;
}}

> All of the remarks aside, there are also a lot of good changes that are being
> made.
Agree and at least applying some of those changes may improve the code
to be more consistent.
> Jan
Thank you,
Oleksandr
[1] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#ppindentwidth
[2] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#spacesbeforetrailingcomments
[3] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#reflowcomments
[4] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#allowshortblocksonasingleline
[5] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#breakbeforeternaryoperators
[6] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignoperands
[7] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignafteropenbracket
[8] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#alignarrayofstructures
[9] https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg02172.html
[10] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#indentgotolabels

