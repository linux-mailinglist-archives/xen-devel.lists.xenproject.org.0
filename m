Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F06AB9C82
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 14:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987095.1372551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuR4-0007R8-OJ; Fri, 16 May 2025 12:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987095.1372551; Fri, 16 May 2025 12:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuR4-0007Pa-LW; Fri, 16 May 2025 12:45:10 +0000
Received: by outflank-mailman (input) for mailman id 987095;
 Fri, 16 May 2025 12:45:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFuR2-0007PS-W6
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 12:45:08 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99294e2a-3253-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 14:45:08 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so14547545e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 05:45:08 -0700 (PDT)
Received: from [10.81.43.161] ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd50eda6sm31916875e9.13.2025.05.16.05.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 05:45:07 -0700 (PDT)
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
X-Inumbo-ID: 99294e2a-3253-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747399508; x=1748004308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hR6tfFpNGkgK83dfReZQaURSgcWQZAdu0yzou0TQTMg=;
        b=avF6TvpigOb8xVyzSRQayifZ5nLzkI8kDHtUBw8AqpyepTTa4/4kZ39arplgBQky9Q
         firB1J1VXDNZhV+D3IQmqxGNPc+XmqqKCdg96luH93wLsNOLAejDb0x1NP9lwvcwOYLi
         Ec51OlgNvxLqZ7Xd1r6HSb0/a+L+un3fo4mGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399508; x=1748004308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR6tfFpNGkgK83dfReZQaURSgcWQZAdu0yzou0TQTMg=;
        b=G8R/wiCnC3L/5g7+154h5uoIM7rFM1JZQSKpbUwLpVmsgNRsQ+0Mjgey229VUB53j+
         H6nuGu+yUqN6x1Ktn48hsMDeHif2tk9FFumXdrXz75d7PSbalp4oWdf9xJCAhomYjMZA
         quz9EldXl2Ln5PnOBze/wzeHAY/1/2GGRyaMAo8t8Akv7MRBi0K85gaekor+8mwXzm1S
         r3ng6RhEOu2nz5JvAUH50Mj33zFKgpMfPv8uXkdhOxUIRd2XzSB1ePpHuVKHTvPU6cqs
         ttu0JIiVu/H9kqMTHf4x9sjeT/sna9zm7I5h1bsLYZpVF6PdvPTZmkfpl8sWjZrsCuBx
         yVlA==
X-Forwarded-Encrypted: i=1; AJvYcCVc9QrED8914Be7qmXQtRrKP+84jS61tzdWj3AptTvcLFJf3v8dnosfTk8C0AzgqmBWMiZBD5w1LpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4MAe64+OjLLvzMhJRWHGR45t66CV0xoKhInLqV3iSUAHFmHFJ
	EZfP2cNR0Q6+3GbK6MgNk6a5w+CmD1o550HUuIr6FRWyahYTakHlv9SERV5Pbi83Q9I=
X-Gm-Gg: ASbGncvieDVVAeJ+s4iRswfhtTBMny3cP+Uc7uxZvcldoLDRyVbSAPqtzUeEjUwlqF1
	5tRpwTT+b0BhdyrSvKFNlluEsiIbm4BvjhExZKNFq9ULFgMOaqVU6k+mo4X+36N3yu1wZFo3z79
	vDVi0Z3nlcRv5t9dABZelcj3p498NC+GStjFDoVKiGo0YJIHqbXrjqokd+Xp1zFbAR0ySvBSnq4
	81FBHqmn/Esrxv9tnETGYtAG64B7JB4YZ8uaTyGe4REdzj2fooT8zcgBHl24oMa66FKhS9olprO
	6GG5++5cqyaFOyxQkHOGmwPofsAx+15+KyMi5Qb9o7SP5nmTywqv9UlSqrBD1g==
X-Google-Smtp-Source: AGHT+IFH01s4vmp7V81rk2SUEj7hvywGZ4N7cJWaOuMfqJFjZIq5h3y+wkH5koR+O4eaUGVOkFh3ZQ==
X-Received: by 2002:a05:600c:b88:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-442fd60b4abmr29398215e9.7.1747399507710;
        Fri, 16 May 2025 05:45:07 -0700 (PDT)
Message-ID: <85f778d1-7fb5-47da-9153-35333e486d24@citrix.com>
Date: Fri, 16 May 2025 13:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PING MISRA] Re: [PATCH v5 2/2] x86/vmx: remove __vmread()
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, nicola.vetrini@bugseng.com,
 consulting@bugseng.com, dmukhin@ford.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250513052809.3947164-1-dmukhin@ford.com>
 <20250513052809.3947164-3-dmukhin@ford.com>
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
In-Reply-To: <20250513052809.3947164-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This is adjusting some MISRA configuration.  I'm reasonably sure the
change is fine as we're simply removing the referenced helper, but can
we get a second opinion from anyone who knows what
function-macro-properties.json is supposed to be doing?

Thanks,

~Andrew

On 13/05/2025 6:28 am, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Remove __vmread() and adjust ECLAIR configuration to account for the change.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  docs/misra/function-macro-properties.json | 9 ---------
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h    | 5 -----
>  2 files changed, 14 deletions(-)
>
> diff --git a/docs/misra/function-macro-properties.json b/docs/misra/function-macro-properties.json
> index 74058297b5..59ba63626e 100644
> --- a/docs/misra/function-macro-properties.json
> +++ b/docs/misra/function-macro-properties.json
> @@ -152,15 +152,6 @@
>              "taken": ""
>           }
>        },
> -      {
> -         "type": "function",
> -         "value": "^__vmread.*$",
> -         "properties":{
> -            "pointee_write": "2=always",
> -            "pointee_read": "2=never",
> -            "taken": ""
> -         }
> -      },
>        {
>           "type": "function",
>           "value": "^hvm_pci_decode_addr.*$",
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> index d85b52b9d5..299e2eff6b 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -336,11 +336,6 @@ static always_inline unsigned long vmread(unsigned long field)
>      return value;
>  }
>  
> -static always_inline void __vmread(unsigned long field, unsigned long *value)
> -{
> -    *value = vmread(field);
> -}
> -
>  static always_inline void __vmwrite(unsigned long field, unsigned long value)
>  {
>      asm goto ( "vmwrite %[value], %[field]\n\t"


