Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600468BE575
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718202.1120746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Lbm-0003Xu-DT; Tue, 07 May 2024 14:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718202.1120746; Tue, 07 May 2024 14:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Lbm-0003VC-9g; Tue, 07 May 2024 14:15:54 +0000
Received: by outflank-mailman (input) for mailman id 718202;
 Tue, 07 May 2024 14:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mcW=MK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4Lbl-0003V6-AE
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:15:53 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f3379a3-0c7c-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 16:15:52 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7928c351c6bso283076485a.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 07:15:52 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vk21-20020a05620a70d500b00792938d0f02sm2588423qkn.39.2024.05.07.07.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 07:15:50 -0700 (PDT)
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
X-Inumbo-ID: 4f3379a3-0c7c-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715091351; x=1715696151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wpVCwRfr9ubipiDlF+tgfX3af1LVpIRSlrT9PfCJ7d8=;
        b=vP0PN91C8YKrS+jPbdMyBa8uL8uQ/h+2g9u1AkAp46n0/ckqdVgj7wsbhMR7eJYCw1
         yNnUyaENe+J/T6R4vClePRMn8qwgdum7zeDrlhUS4oYmqpwnLTm9lzEbPUggWaXvErj4
         psuA9H7/jq6s4zhIMiRVN1t8o82a5jS9s9pY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091351; x=1715696151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpVCwRfr9ubipiDlF+tgfX3af1LVpIRSlrT9PfCJ7d8=;
        b=IV8CBw8x3DiE0xhIbV36NTt4j5i+4Ugg88jHELe/edab9dCbJFTa7QyCKHyn2/moNR
         /L8g7kQphCxJCDSf+srhPh6NF+IyYTIeTY24LzeJlO2LfS00r0Fe+08cuXmXzHApsbum
         FJjF/fUU4vUKRnWdXbJ/y/YMp1HPKk9x1AW6ZJZibrBFPOUK8+zqVRFwYJMRwDAagcyg
         t+WaUGestg7sPjSqWrrp3bhuuKhDOgbAJaaCvtyTISz/zAFsnVtFRE2jb1kbogoQqGEa
         CjygRTbe1X037a8T3ccXctiw2+d/iYoSf1p3McDyZlu53OH/Dmg+ufkBplQnvgy8b2AC
         Y+8Q==
X-Gm-Message-State: AOJu0YyMKnpIO2zXHrOw5Kuukvm2oXmAyGWcjcvIekuJAhk0HD6l9AIi
	HeU74sR23nbX4jO+h09rhZbvCuJxz9SYFvTWXt3K9Cjw38WqfHV/PLU/thL0pp1LwU96VdnS2YK
	j
X-Google-Smtp-Source: AGHT+IEe7o+xgwE6/oWoj19AXPdS2WYbq+F0c2bT91ca+kojtZNs/D8viPQ6PYswj3PCmWOvazXhsg==
X-Received: by 2002:a05:620a:4047:b0:790:fd04:5a1b with SMTP id i7-20020a05620a404700b00790fd045a1bmr17449643qko.9.1715091351039;
        Tue, 07 May 2024 07:15:51 -0700 (PDT)
Message-ID: <549a101f-b9b6-47fb-a782-c716f1ce49ec@citrix.com>
Date: Tue, 7 May 2024 15:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: Open xldevd.log with O_CLOEXEC
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <20240507110806.1692135-1-andrew.cooper3@citrix.com>
 <ZjoRMHmL8_K9_lsL@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <ZjoRMHmL8_K9_lsL@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2024 12:32 pm, Marek Marczykowski-Górecki wrote:
> On Tue, May 07, 2024 at 12:08:06PM +0100, Andrew Cooper wrote:
>> `xl devd` has been observed leaking /var/log/xldevd.log into children.
>>
>> Link: https://github.com/QubesOS/qubes-issues/issues/8292
>> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony@xenproject.org>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> Also entirely speculative based on the QubesOS ticket.
>> ---
>>  tools/xl/xl_utils.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
>> index 17489d182954..060186db3a59 100644
>> --- a/tools/xl/xl_utils.c
>> +++ b/tools/xl/xl_utils.c
>> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfile)
>>          exit(-1);
>>      }
>>  
>> -    CHK_SYSCALL(logfile = open(fullname, O_WRONLY|O_CREAT|O_APPEND, 0644));
>> +    CHK_SYSCALL(logfile = open(fullname, O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0644));
> This one might be not enough, as the FD gets dup2()-ed to stdout/stderr
> just outside of the context here, and then inherited by various hotplug
> script. Just adding O_CLOEXEC here means the hotplug scripts will run
> with stdout/stderr closed.

Lovely :(  Yes - this won't work.  I guess what we want instead is:

diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
index 060186db3a59..a0ce7dd7fa21 100644
--- a/tools/xl/xl_utils.c
+++ b/tools/xl/xl_utils.c
@@ -282,6 +282,7 @@ int do_daemonize(const char *name, const char *pidfile)
     dup2(logfile, 2);
 
     close(nullfd);
+    close(logfile);
 
     CHK_SYSCALL(daemon(0, 1));
 
which at least means there's not a random extra fd attached to the logfile.
>>      free(fullname);
>>      assert(logfile >= 3);
>>  
>>
>> base-commit: ebab808eb1bb8f24c7d0dd41b956e48cb1824b81
>> prerequisite-patch-id: 212e50457e9b6bdfd06a97da545a5aa7155bb919
> Which one is this? I don't see it in staging, nor in any of your
> branches on xenbits. Lore finds "tools/libxs: Open /dev/xen/xenbus fds
> as O_CLOEXEC" which I guess is correct, but I have no idea how it
> correlates it, as this hash doesn't appear anywhere in the message, nor
> its headers...

It's the libxs patch, but rebased over yesterday's push to staging. 
auto-base doesn't work quite so well in cases like this.

~Andrew

