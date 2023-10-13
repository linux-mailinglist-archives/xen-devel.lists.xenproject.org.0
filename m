Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D847C874E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 16:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616579.958698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrIj4-0005JU-29; Fri, 13 Oct 2023 14:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616579.958698; Fri, 13 Oct 2023 14:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrIj3-0005H6-Vg; Fri, 13 Oct 2023 14:01:13 +0000
Received: by outflank-mailman (input) for mailman id 616579;
 Fri, 13 Oct 2023 14:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqf=F3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qrIj2-0005H0-Mp
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 14:01:12 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3d61ff1-69d0-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 16:01:06 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40776b20031so1191235e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 07:01:06 -0700 (PDT)
Received: from [172.31.7.9] ([203.12.200.210])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a637b15000000b005ab281d0777sm1284718pgc.20.2023.10.13.07.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 07:01:04 -0700 (PDT)
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
X-Inumbo-ID: f3d61ff1-69d0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697205665; x=1697810465; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tPy4WG2QrODKRJx5QUTwOBSRILtPZ0qEBU+tg92VtXk=;
        b=Hly2ht//eRxcSVMK//xBuyoJKJK1Pc+qVBY7CA7QusOBrYK9owPUIxz4VcNZvcwjS0
         +xcTmc+DHbK6E6Rv7xcWL1KL7xJ2JD6mbUc/6QYad1yRwyc+aBm8BwxHhx03JFmTMqNa
         19lzgfJ9tSrD/xDivhUdgDxStjEjaJ2o5grWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697205665; x=1697810465;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPy4WG2QrODKRJx5QUTwOBSRILtPZ0qEBU+tg92VtXk=;
        b=Mawujbprc1jCDoxEBn8YSo8BCByOn36atjNo5oEcFSU8awphFzwlQnz4JryRaprMKz
         CK+zpw/H9GKPdCM896NV6bBEGwvosrFwYdp/BRgma8xxdEhPqCmL0UKeiEiZt9umwy2D
         vN82JFOf4Be5UzCax+A0VdJZ8ynfFbyTO2T4xAOLtYNef4bEMOQBlZu0f3gf0HbeXwUt
         dJwl9+O5DjgsK555AqvNyBTi764+giH3CcdYnhmLYSwJikAHT59m5U/mLoQfa68y7ryy
         VRVYC0waqSjI6dnqqBGHTNszEj8xtNh22H1QlFDFOgPPx+RB7/TiU0DlwL/GBuVBnTmQ
         D+9A==
X-Gm-Message-State: AOJu0YwYkt1SN35qmhNRYu9R6NtxAxe/R7mobY5pr9dbEgqhZckeua0b
	6EctkvhgZPJN+wQkQIF0KXWtFA==
X-Google-Smtp-Source: AGHT+IHDBj9T5u58AlMAxr6q3OZrKkzVU5INMxZZyJu5coijatvYlHjaRfu95baT93pYuI673b1NhQ==
X-Received: by 2002:adf:fcd2:0:b0:32d:8505:b9d7 with SMTP id f18-20020adffcd2000000b0032d8505b9d7mr7019329wrs.43.1697205665580;
        Fri, 13 Oct 2023 07:01:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------D4buNF50ZyVCR0nELFIpUXHb"
Message-ID: <383027d6-d405-4935-a5a9-1d11e8dd8e44@citrix.com>
Date: Fri, 13 Oct 2023 22:00:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [for-4.18][PATCH 1/2] xen/x86: Add family guards to the
 is_zen[12]_uarch() macros
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
 <20231012172601.22600-2-alejandro.vallejo@cloud.com>
 <06c4df56-8118-4f11-843a-7e4ae81f2464@citrix.com>
 <652928c3.170a0220.37d5e.7636@mx.google.com> <ZSkrohpG69OU8M8y@macbook>
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
In-Reply-To: <ZSkrohpG69OU8M8y@macbook>

This is a multi-part message in MIME format.
--------------D4buNF50ZyVCR0nELFIpUXHb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/10/2023 7:36 pm, Roger Pau Monné wrote:
> On Fri, Oct 13, 2023 at 12:23:43PM +0100, Alejandro Vallejo wrote:
>>>> diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
>>>> index d862cb7972..5a40bcc2ba 100644
>>>> --- a/xen/arch/x86/include/asm/amd.h
>>>> +++ b/xen/arch/x86/include/asm/amd.h
>>>> @@ -145,11 +145,12 @@
>>>>   * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
>>>>   * as a heuristic that distinguishes the two.
>>>>   *
>>>> - * The caller is required to perform the appropriate vendor/family checks
>>>> - * first.
>>>> + * The caller is required to perform the appropriate vendor check first.
>>>>   */
>>>> -#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
>>>> -#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
>>>> +#define is_zen1_uarch() ((boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) && \
>>>> +                         !boot_cpu_has(X86_FEATURE_AMD_STIBP))
>>>> +#define is_zen2_uarch() (boot_cpu_data.x86 == 0x17 && \
>>>> +                         boot_cpu_has(X86_FEATURE_AMD_STIBP))
>>> What leads you to believe there aren't Hygon Zen2's ?
>> The same argument that a Hygon zen2 supports STIBP. Having seen neither HW
>> nor docs all that's left is divination skills :)

Hygon reported/fixed Zen2 uarch issues in Xen.  Something clearly exists.

~Andrew
--------------D4buNF50ZyVCR0nELFIpUXHb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 13/10/2023 7:36 pm, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZSkrohpG69OU8M8y@macbook">
      <pre class="moz-quote-pre" wrap="">On Fri, Oct 13, 2023 at 12:23:43PM +0100, Alejandro Vallejo wrote:<span
      style="white-space: pre-wrap">
</span></pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index d862cb7972..5a40bcc2ba 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -145,11 +145,12 @@
  * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
  * as a heuristic that distinguishes the two.
  *
- * The caller is required to perform the appropriate vendor/family checks
- * first.
+ * The caller is required to perform the appropriate vendor check first.
  */
-#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
-#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
+#define is_zen1_uarch() ((boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) &amp;&amp; \
+                         !boot_cpu_has(X86_FEATURE_AMD_STIBP))
+#define is_zen2_uarch() (boot_cpu_data.x86 == 0x17 &amp;&amp; \
+                         boot_cpu_has(X86_FEATURE_AMD_STIBP))
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
What leads you to believe there aren't Hygon Zen2's ?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">The same argument that a Hygon zen2 supports STIBP. Having seen neither HW
nor docs all that's left is divination skills :)</pre>
      </blockquote>
    </blockquote>
    <br>
    Hygon reported/fixed Zen2 uarch issues in Xen.  Something clearly
    exists.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------D4buNF50ZyVCR0nELFIpUXHb--

