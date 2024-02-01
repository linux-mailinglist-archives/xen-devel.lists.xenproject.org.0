Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE12846159
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 20:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674704.1049814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVd17-0007B3-Cg; Thu, 01 Feb 2024 19:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674704.1049814; Thu, 01 Feb 2024 19:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVd17-00079P-9x; Thu, 01 Feb 2024 19:46:33 +0000
Received: by outflank-mailman (input) for mailman id 674704;
 Thu, 01 Feb 2024 19:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6jM=JK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVd16-00079J-0S
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 19:46:32 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97ecce65-c13a-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 20:46:30 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fc2e36eeeso4438585e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 11:46:30 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b0040fbad272f6sm2749569wmo.46.2024.02.01.11.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 11:46:28 -0800 (PST)
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
X-Inumbo-ID: 97ecce65-c13a-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706816788; x=1707421588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfkwkaqY6LXddZTpjAutD7ZofgChudRBdiKliQIp684=;
        b=kJodZGNaoJ/xpTXoOG+p9tZorYuISKox5tL8+di1Z8Z69TndK9BbKQfxNtxLPbK5Uw
         BelAq78jxgpa7WMQ2TTNhbCl0BNooZaXMSScarfUrBvFPG6nNGlMakWQ9PhGOTV7TtkR
         RW3H6ni/N9sq8y7FM2RgvztAVEWvF6DWYbZTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706816788; x=1707421588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bfkwkaqY6LXddZTpjAutD7ZofgChudRBdiKliQIp684=;
        b=TrbiwdsEUueoYFiCDQPPx2U1fF1WvzDOR3WFbofZssJspcHtcl4opSYitJWYENHVDt
         6WpKAtkZektX8WZAbPVh6SA7SJ0Wovz6+zVkD1VU8tM89xB9DUZHfEcbe6q6keMfoeMT
         Dx097D17qui8zqzm+ILcvMndHIREQDb327No4IJPrfwSBK2MCVTIZ6B4TiQWsLWUWuci
         a/4Y8t7fuqMZVfs0cxjtJPbt/ZVDkg1PBKAzFjaBemQrR/xUX6s6g/tiUD1/943dJglQ
         Drmku0RG1RP/6ozy2Jg5ykN3bRgroWhKB6gsG6YbK7F2f5U6DKmaOT1U4iXJ8AA233Jq
         EaSw==
X-Gm-Message-State: AOJu0YxxYV+XcV/ChlPIJGdVWV/FgTqfkTXqIQpsxFtRNX2FKY3LAZ9u
	Z7tzqrBl2PT5vJ2Mguno1Yuccsfq+cPvw+ytsoB4Kuu4FIUSvOda18flwFdM4lyZU4YxKjybTLG
	X
X-Google-Smtp-Source: AGHT+IEJaaNAy11CuMjtIhDZG94zdoM/cT/VjnMvTfACwIfYbdb20LD5RDeMkTWTR4pnlkY/7Rrk/A==
X-Received: by 2002:a05:600c:3504:b0:40e:e834:3d86 with SMTP id h4-20020a05600c350400b0040ee8343d86mr29092wmq.37.1706816788516;
        Thu, 01 Feb 2024 11:46:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXOypleYe3f63m/2LIhLM3XdOH2lum/UvKlw0/fdUoCFsOZarZM4b7qt2jWUNm2edi9MXwbvxlDInQ8I7PwudzYrWlycp635ybDBhRlLV2OxIC3WIPneM4deYsKla1Mm2yielMOUWYEJA9gidZS1yKgadoVvsg=
Message-ID: <95df07a3-0fae-4f1b-bca7-04a72a333dff@citrix.com>
Date: Thu, 1 Feb 2024 19:46:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitmap: Drop unused headers
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20240201103506.549662-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240201103506.549662-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/02/2024 10:35 am, Andrew Cooper wrote:
> Nothing in bitmap.h uses lib.h, and there's no point including types.h when we
> need to include bitops.h anyway.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  xen/include/xen/bitmap.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
> index b9f980e91930..9f749e3913d8 100644
> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -3,8 +3,6 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#include <xen/lib.h>
> -#include <xen/types.h>
>  #include <xen/bitops.h>

Turns out this went too far, and breaks PPC.  Other arches look ok.

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/6076263594

bitmap.h uses mem{set,cpy}() so needs string.h.  That's a bug in this
patch specifically.

However, cpumask.h transitively picks up IS_ALIGNED() (so needs
macros.h) and ASSERT() which sadly is still in lib.h

I guess moving the mess from bitmap.h to cpumask.h is a (minor) improvement.

But this comes back to the header tangle which prevented moving BUG() in
the first place.  Sadly there's been no reply to my question in the
debugger.h removal, but I'm going to get that committed and then we can
re-evaluate.

~Andrew

