Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275618C120F
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 17:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719300.1121972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s55op-0006qr-TY; Thu, 09 May 2024 15:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719300.1121972; Thu, 09 May 2024 15:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s55op-0006oJ-Qj; Thu, 09 May 2024 15:36:27 +0000
Received: by outflank-mailman (input) for mailman id 719300;
 Thu, 09 May 2024 15:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XlW=MM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s55oo-0006oD-L8
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 15:36:26 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e45141c8-0e19-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 17:36:24 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-434d0e3f213so5241671cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 08:36:24 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54f5e05sm9406931cf.32.2024.05.09.08.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 08:36:23 -0700 (PDT)
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
X-Inumbo-ID: e45141c8-0e19-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715268983; x=1715873783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2rLhyY7+jFslnqo1KWFK3KBVrrUmsZ2Qd4R799lPfSc=;
        b=NfC4ZJ9heSHMnlwRb/LIBb5dqtBmhiceGrJV8ICS3MMRyqQ8ILDGyfPj1siENCy52O
         rPKTg8StJ5mLsifqYTGe3VZOPJooM4b0AF83PG2Ti8doBbCBpqUScFrc7mgaMkdxUvsz
         22IZRIWHUPHoN+EEK2oF2WYZDNmLpDvDrzgsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715268983; x=1715873783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rLhyY7+jFslnqo1KWFK3KBVrrUmsZ2Qd4R799lPfSc=;
        b=F6RExw2vMvPrZMLaosPT98zXGVjgfhGIe9G+yIKOhVfRb/Mkx8SFMxQrW9o1oDAkkk
         ElJDNlveAfjbvnRLu590kMQJZjGOvikyvrfIg5/VIoM/e/eBqDvxJ1mTmVWsrNrsct2a
         CYHNdIOhGHuh32xz2XipxkHzKLTcHleD1fS00dEEAEJDSMDZ6L85qNFZR22rC27xAQ20
         R4Lxwp/q+aR5WXmzqdh0syHhufcf2uHpPE9hO5Ufse+E237A1xbcOwW2O0Ggc+dhkRdT
         3IiyFFCTRIUJ/oClOdo3e8omNT5nEkeZQ0EE8LXnyl8xMs0+E9RwrKkD/Lk72E+PJKjq
         kpAw==
X-Forwarded-Encrypted: i=1; AJvYcCXT7dqgXBTbIB6VlO2uxWZgYB8KvMKzwLr27ZTNrhgkOKrIWeMVtTX1JbRNBNf4J9UYYBOiP88ooSVAWspMvjkvXvTSRuB/eVTBpNAaytg=
X-Gm-Message-State: AOJu0YzN8tRRUcIBRFnfFB4qIilKXZ6qcoRUUTC6sPzLZqd0vQiXyNVH
	GB9fdJ6jw53GFwfxkKLaF9BWUg0retvmun7CSBelbIlkw9pcQ1IyGGJOBdB6leg=
X-Google-Smtp-Source: AGHT+IHgHOG4xtfch0vyDazppqDtgJeZdoSuZImSsyYfeQercExIaT1iKeCHt1AmD3iS0Klbc7vMZA==
X-Received: by 2002:ac8:5d8f:0:b0:43a:ffa5:3f24 with SMTP id d75a77b69052e-43dbf74d77amr60079061cf.58.1715268983385;
        Thu, 09 May 2024 08:36:23 -0700 (PDT)
Message-ID: <5bf22886-08a1-459d-939e-008f2c1836ea@citrix.com>
Date: Thu, 9 May 2024 16:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Clean up of gzip decompressor
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240424163422.23276-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2024 5:34 pm, Daniel P. Smith wrote:
> An issue ran into by hyperlaunch was the need to use the gzip decompressor
> multiple times. The current implementation fails when reused due to tainting of
> decompressor state from a previous usage. This series seeks to colocate the
> gzip unit files under a single directory similar to the other decompression
> algorithms.  To enable the refactoring of the state tracking, the code is then
> cleaned up in line with Xen coding style.
>
> Changes in v3:
> - patch "xen/gzip: Drop huffman code table tracking" was merged
> - patch "xen/gzip: Remove custom memory allocator" was merged
> - patch "xen/gzip: Drop unused define checks" was merged
> - move of the decompressor state into struct was broken up to ease review
> - expanded macros that were either only used once or obsfucated the logic
> - adjusted variable types as needed to be more appropriate for their usage
>
> Changes in v2:
> - patch "xen/gzip: Colocate gunzip code files" was merged
> - dropped ifdef chunks that are never enabled
> - addressed formatting changes missed in v1
> - replaced custom memory allocator with xalloc_bytes()
> - renamed gzip_data to gzip_state
> - moved gzip_state to being dynamically allocated
> - changed crc table to the explicit size of uint32_t 
> - instead of moving huffman tracking into state, dropped altogether
>
>
> Daniel P. Smith (8):
>   gzip: clean up comments and fix code alignment
>   gzip: refactor and expand macros
>   gzip: refactor the gunzip window into common state
>   gzip: move window pointer into gunzip state
>   gzip: move input buffer handling into gunzip state
>   gzip: move output buffer into gunzip state
>   gzip: move bitbuffer into gunzip state
>   gzip: move crc state into gunzip state

In hindsight my suggestion that lead to "refactor and expand macros"
wasn't great.

We want to keep the underrun labels for a future when the error handling
isn't panic().  After that, expanding flush_window() is better folded
into "refactor the gunzip window into common state" to reduce the churn.

As that was my fault, and unpicking it is reasonably hard, and we're on
a tight deadline for 4.19 now, I've gone ahead and unpicked this.

Also I've rebased over Jan's patch addressing the memory leaks reported
by Coverity, as the two sets of fixes collide, along with various other
minor notes.

I've conferred with Daniel who is happy with the aformentioned changes.

This area of code still has a lot of work needing doing on it, but
removing the use of global state is a concrete improvement in the status
quo.

~Andrew

