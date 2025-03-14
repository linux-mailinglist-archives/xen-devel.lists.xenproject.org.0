Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569B2A60FCC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:20:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914418.1320181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt35d-0005Qv-Lt; Fri, 14 Mar 2025 11:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914418.1320181; Fri, 14 Mar 2025 11:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt35d-0005Oc-J9; Fri, 14 Mar 2025 11:20:33 +0000
Received: by outflank-mailman (input) for mailman id 914418;
 Fri, 14 Mar 2025 11:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt35c-0005Nw-A9
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:20:32 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b9ba24-00c6-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 12:20:27 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so353231366b.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:20:27 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeca4sm209885766b.21.2025.03.14.04.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:20:26 -0700 (PDT)
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
X-Inumbo-ID: 54b9ba24-00c6-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741951227; x=1742556027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fDOMEI5+1jdykECQ4epxe5UvA+4ETkPC3Yy+z8ayluw=;
        b=HXx1/NEyJ5zxy/fKdaP9zkO3Py2TBTfXtKNzKQI5/wsUdOVELAYeA/HpSJAPcYbTCt
         jS3FElQSt1mJzEOVFJZA6qsLAISsPKTBKSAE9puns/A3jPHqeq5d3iMggYbDSr/4U+yP
         nka3+pHuHA8SMS0Gv6Z1EeyrwoTpKihDXYk/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951227; x=1742556027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDOMEI5+1jdykECQ4epxe5UvA+4ETkPC3Yy+z8ayluw=;
        b=jplgh/zcvHT035CsL3ZsXw3Zqk2T2Qwx2ez75F5ZcQiHtEb/nloBcJDUApjAvm1Ve6
         579GEpo9eRN5gmdH54XtXanrPEJcOn1RjXqW1ycg/OAo26qYlbxTBQqa6nYy6aY4X+Jx
         ZAAjJAfnCxNQBX+JwFX8mUXy+IoWLDpHPR8fM0L0lk1sTED1uniCEayrGz3LWEFLX1/X
         V3KCq5n0Z79gdnjVixOcqg6ep46vHSsGIQRa4bdcstxxQiU1PBxy+DyJi9lxLB0sy6mp
         0KRBnj0/rdCakYdzxHwnrBa98A4mgEaRqSYprNFfwl1jCEBsxF1iZ0wP8Nao/RKdi1bz
         xDQA==
X-Forwarded-Encrypted: i=1; AJvYcCUouzQQiZBChExuwEiSOXtFenUt4rPqQgouekTvb0CTKIJsnvVAFB4C7LhdsDntKwqhN/A2qpcpoz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXjpj7GTrD65ivtB5ArNup10rgyZZZsyZG8naZeYArMDunYnWX
	FdNTibUGfcXxyHCww8h2LQiMEe1U9Ji01fxoeo2v9kADNspLJc0iPq8TRjv93rY=
X-Gm-Gg: ASbGncsl/VQ+SaBeX/7e0iwvxgLMW3C8vvYqMI12Ww734YSqBbRhFz45oVrDJbirn40
	ppgimlgWgGaYhzCfPpHWS3u9K38/f6zXPzP8f5QEeq2N6PYfmutUpJOFNkS7C7uHESr10uWUgXb
	pLxlbAyphLWe6vI6AASRXWs9zr0EJvD5erFTRVKaSprpyS2V5NLY5IvbNCUNwZAoAwUJId+bTkW
	9L3yccEqcLbMwAavGgRPFPWZ8WmXLfbaGfTrJQF7Ee/jV2qVTs6h8VBBnL8qUEgnIlngW7u2jmU
	WFIdsw+7qM8ZKCboZwBHpaoAPwEb1R+/wFO7bNejqSM3KIROlPldnr2nRZw0QMg6NGyK3/Ktbr5
	2ntXK1I+L
X-Google-Smtp-Source: AGHT+IFfwjqrRRdUSkIE6cz0kK6j+se8icZlFRhuEX0OeN8WxeHbl1+MzIZ/XimnpEInVt5P7YKm2Q==
X-Received: by 2002:a17:907:7251:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-ac330301e93mr218694166b.29.1741951226873;
        Fri, 14 Mar 2025 04:20:26 -0700 (PDT)
Message-ID: <0dc20917-831f-4efd-9018-cdf35d2bb0d2@citrix.com>
Date: Fri, 14 Mar 2025 11:20:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
 <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
 <Z9PpI8KQnA_gHy9e@macbook.local>
 <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>
 <dd147c79-055e-4a94-bb23-4c59821d520a@citrix.com>
 <3d905488-b3ec-452f-afca-9a7d85484fe9@suse.com>
 <Z9QBIEICQIQH2WD9@macbook.local>
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
In-Reply-To: <Z9QBIEICQIQH2WD9@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2025 10:12 am, Roger Pau Monné wrote:
> On Fri, Mar 14, 2025 at 10:13:07AM +0100, Jan Beulich wrote:
>> But isn't it then going to be enough to latch &wqv->esp into a local variable,
>> and use that in the asm() and in the subsequent if()?
> I have the following diff which seems to prevent the duplication,
> would you both be OK with this approach?
>
> Thanks, Roger.
> ---
> diff --git a/xen/common/wait.c b/xen/common/wait.c
> index cb6f5ff3c20a..60ebd58a0abd 100644
> --- a/xen/common/wait.c
> +++ b/xen/common/wait.c
> @@ -124,6 +124,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>      struct cpu_info *cpu_info = get_cpu_info();
>      struct vcpu *curr = current;
>      unsigned long dummy;
> +    void *esp = NULL;
>  
>      ASSERT(wqv->esp == NULL);
>  
> @@ -166,12 +167,12 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>          ".L_skip:"
>          "pop %%r15; pop %%r14; pop %%r13;"
>          "pop %%r12; pop %%rbp; pop %%rbx"
> -        : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
> +        : "=&S" (esp), "=&c" (dummy), "=&D" (dummy)
>          : "0" (0), "1" (cpu_info), "2" (wqv->stack),
>            [sz] "i" (PAGE_SIZE)
>          : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
>  
> -    if ( unlikely(wqv->esp == NULL) )
> +    if ( unlikely(esp == NULL) )
>      {
>          gdprintk(XENLOG_ERR, "Stack too large in %s\n", __func__);
>          domain_crash(curr->domain);
> @@ -179,6 +180,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>          for ( ; ; )
>              do_softirq();
>      }
> +    wqv->esp = esp;
>  }
>  
>  static void __finish_wait(struct waitqueue_vcpu *wqv)
>

If that works, then fine.  It's certainly less invasive.

The moment I actually get around to (or persuade someone else to) switch
the introspection mappings over to acquire_resource, then wait.c is
going to be deleted.

~Andrew


