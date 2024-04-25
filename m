Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA78B22C8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 15:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712089.1112489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzzBO-0006jP-U5; Thu, 25 Apr 2024 13:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712089.1112489; Thu, 25 Apr 2024 13:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzzBO-0006hb-QW; Thu, 25 Apr 2024 13:30:38 +0000
Received: by outflank-mailman (input) for mailman id 712089;
 Thu, 25 Apr 2024 13:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIz1=L6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rzzBN-0006gm-Ld
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 13:30:37 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffb45162-0307-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 15:30:37 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-22edcfcd187so349569fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 06:30:37 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t16-20020ac85310000000b0043718ece8dfsm6911860qtn.12.2024.04.25.06.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 06:30:35 -0700 (PDT)
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
X-Inumbo-ID: ffb45162-0307-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714051835; x=1714656635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dIjG4ES0MJ/mM6LZ7+rMDaiJZqVAgspaCiDN1KaFyiI=;
        b=rvSoOqY9nAEpDu62th8BN9PeK5YoyxnkdZkBVaNO3EtPOIfzsm/rdF4VX81Jo5JGd7
         XC6W5n7IGpok2Aaza2jxSvDZ/t1g71u2ZJboq6wdal3BdKtqhPDwgzBPUSbvMskFTui0
         BQvd4HGOFxnrTmnlkBPCTGk0LHMmWJkmWD/+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714051835; x=1714656635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIjG4ES0MJ/mM6LZ7+rMDaiJZqVAgspaCiDN1KaFyiI=;
        b=TFYT3ALu1TBjUeZ7PbNjP1yT8fq4Tfew1Nz9+nfuDBE99FgKPQbzcNT9uPq6sfSpCA
         1uHr7yNrUjBT9WknvQZQsrpnJUxEvCMwMKpNzm+HxgC7Yg0cRhfVb9hvu7LET+B6OEDK
         ik3xvo3kij01e3fPNXSSSHozJoT3qTihCN1DQzPrJBVch0433ABH3idtXJy4NQScbLsU
         IURBm3rSfZQ9yI7fhhb/2xsxPY7MmHyO3zEnVVvlvQPQ1cujz5Tx31UVOJQauvY+8+f5
         uozaGtQp1bT2SBm/q3fCkmxznAO5AuAKq4kpNgkkKwJ278QGT8Tr4YLBap9Z+I+hpMek
         0gRw==
X-Forwarded-Encrypted: i=1; AJvYcCVz12+JEaOcIdDUdiF+AjHDXTUppVN79FTDTEAe+n61kVR7iPWfm+j5D9Y3AyEb9LA7T2W+CC2vooQTC5sPbKrYcS+SZ8Oey/nbvI5I/8o=
X-Gm-Message-State: AOJu0YwwYkNCvCULyBHmCX6qoac+vank1++oZY1tBzi2UBtsMm9r2VFA
	g5fzEHXzrw9A6q0dvOlGFUaaeDvwWVZNyn21nvO5q75ut27CfFj+pZT6Hgel/sI=
X-Google-Smtp-Source: AGHT+IGN118D8CqHV1r3t6sP1kBOK/p+3pXrrsbQ1Jc9GmMpe3am+nZ9CV77IqZ6GARrzrgpkzSzuA==
X-Received: by 2002:a05:6870:d391:b0:221:8b50:f1a0 with SMTP id k17-20020a056870d39100b002218b50f1a0mr7131003oag.19.1714051835373;
        Thu, 25 Apr 2024 06:30:35 -0700 (PDT)
Message-ID: <65819d08-eea1-4ce3-8eca-6358ecba1bb2@citrix.com>
Date: Thu, 25 Apr 2024 14:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/spec: adjust logic to logic that elides lfence
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20240418155208.7771-1-roger.pau@citrix.com>
 <20240418155208.7771-3-roger.pau@citrix.com>
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
In-Reply-To: <20240418155208.7771-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/04/2024 4:52 pm, Roger Pau Monne wrote:
> It's currently too restrictive by just checking whether there's a BHB clearing
> sequence selected.  It should instead check whether BHB clearing is used on
> entry from PV or HVM specifically.
>
> Switch to use opt_bhb_entry_{pv,hvm} instead, and then remove cpu_has_bhb_seq
> since it no longer has any users.
>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 954c983abcee ('x86/spec-ctrl: Software BHB-clearing sequences')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New in this version.
>
> There (possibly) still a bit of overhead for dom0 if BHB clearing is not used
> for dom0, as Xen would still add the lfence if domUs require it.

This is the note about dom0 that I made on the previous patch.

"protect dom0" only has any effect if the appropriate foo_pv or foo_hvm
is also selected.  It's not possible to express "protect dom0 but not
domU of $TYPE".

This early on boot we have no idea whether dom0 is going to be PV or
HVM.  We could in principle figure it out by peeking at dom0's ELF
notes, but that needs a lot of rearranging of __start_xen() to do safely.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

