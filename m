Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A1A2701F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881250.1291379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfGyD-0006Gr-OX; Tue, 04 Feb 2025 11:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881250.1291379; Tue, 04 Feb 2025 11:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfGyD-0006ER-LX; Tue, 04 Feb 2025 11:19:57 +0000
Received: by outflank-mailman (input) for mailman id 881250;
 Tue, 04 Feb 2025 11:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yR1u=U3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tfGyC-0006EL-Kh
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:19:56 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5155589-e2e9-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 12:19:54 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38da713b9daso544253f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 03:19:54 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e6b62sm186725765e9.24.2025.02.04.03.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 03:19:52 -0800 (PST)
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
X-Inumbo-ID: f5155589-e2e9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738667993; x=1739272793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UKwqvjUgd6kCSt3filuq8RedJj78OWS1xv6FBW1Y9ak=;
        b=B6QUI2TFNoqqJbwC+77kLez/jeB+hBVzjH/5QwE8bjiR/fpzjN8IjyEh7fxgxT3pU5
         YMcGpnEZUOFP6DynISjW+QtuXn84EqsXVxaxWjI0iOXrdWc12PJ4Rz38WdHfRP1ad4+2
         ATRwTHFn3jNNuyK5RVoP98429qVtD6NB2c4mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738667993; x=1739272793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKwqvjUgd6kCSt3filuq8RedJj78OWS1xv6FBW1Y9ak=;
        b=sjKIytS/9S7ZqXlq0YApEe9gleq+6fZT2wO/Qij5qfboy3HiONGYBJChp7cIL00Zdi
         OSKiNGewmVH22so7B8Br0+hFjYxmTTlww+dPXHfD6Tpl5AUFTWCOg0GzqGmqcpHwQS25
         +vMzVhO3TUfA6oQMDIIr/amf7IUZoUVX6b5MYN+OJvrgo5ouQ763tBJkD2PcMCjhUezO
         3mlcxLPWwT02TJ3vSD6Sfu2XvgegaRjAu+B3rNuytQ+oRxx2GGBTGQOcp087SWX8sIS0
         15iPibASgB57pkpyVWUyjq7lNNkSRgeobZS+r8sUSHv25rJFB3/O8a2IlpYcs8sqG9I9
         fGbg==
X-Forwarded-Encrypted: i=1; AJvYcCUEOp+gLd6nZrppjOu+1cx9xZi/UJu0vBb8xvW5WFghq0Rcn0fyKQJhud7LwNPhfSXumVN+ElEZ8ls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFq6HpIWSKf0CJs3/Iwia9OxQZXASUV6SHIUkr2+yWPGoswCoV
	aof//afGZpo41gW2S3HYaJDc9a5nLtQMFGFUrf7jqssuTzPdWW0/EfkwE97XEvY=
X-Gm-Gg: ASbGnculjnxTKrvc2VWYWAGm1/b/KVv5q3RrAF9Sk4W0XQ2QHbVAxyqaSCZycvR4svz
	rQVscoX2wdXPysjJmKeHUYbE18ZJSlgVKbaszYDG7aiRUL+0pqrD2W+u/JTwjsW0XabPnLcR4yp
	q2pfPAX/lxo47HD/8+RvuCCwbxHWLUEy49AHrW3cdN+3ZaAGD6A/4RlM1B7QGpIlk3ergW0TnJs
	6lgK7UIKeeNjyhw13fWyEiXSOX+REk3BKswAxAOtaw4bKZ70tZ+1yqN9pAgGkL8bIHTjdrjD0Dd
	TXBXsOoEhWWNUoQroz6tsRlxW1u6dXHboC6fRnHvHbTqoFRUIopN6Rg=
X-Google-Smtp-Source: AGHT+IF1DFZqciL6BYd3grNNhA6wCRYO9WvrrpL/6BzJ+okge0gXxkOnKPTxo3LlhmZzta/tw1JRxg==
X-Received: by 2002:a05:6000:1548:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38c51f8a3camr27594802f8f.35.1738667993349;
        Tue, 04 Feb 2025 03:19:53 -0800 (PST)
Message-ID: <06dbe21c-6f86-44f1-bca7-931e2587f390@citrix.com>
Date: Tue, 4 Feb 2025 11:19:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20? 5/6] radix-tree: introduce
 RADIX_TREE{,_INIT}()
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <bd8d65e6-e887-4afe-8ff0-df86416fa869@suse.com>
 <528e3341-45ce-4e82-bdb5-ee3dc72a6925@citrix.com>
 <3facc3f9-fd75-49f9-aa8e-ecee3c67dc80@suse.com>
 <a75d8a6e-bdb5-4bf9-a94e-073f630d5c69@suse.com>
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
In-Reply-To: <a75d8a6e-bdb5-4bf9-a94e-073f630d5c69@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/02/2025 8:36 am, Jan Beulich wrote:
> On 03.02.2025 17:58, Jan Beulich wrote:
>> On 03.02.2025 17:48, Andrew Cooper wrote:
>>> On 03/02/2025 4:26 pm, Jan Beulich wrote:
>>>> ... now that static initialization is possible. Use RADIX_TREE() for
>>>> pci_segments and ivrs_maps.
>>>>
>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> I'd not considered having RADIX_TREE() but it's nicer than my attempt.
>>>
>>> However,
>>>
>>>> --- a/xen/include/xen/radix-tree.h
>>>> +++ b/xen/include/xen/radix-tree.h
>>>> @@ -72,6 +72,9 @@ struct radix_tree_root {
>>>>   *** radix-tree API starts here **
>>>>   */
>>>>  
>>>> +#define RADIX_TREE_INIT() {}
>>> ... this ought to be (struct radix_tree_root){} so it can't be used with
>>> other types, and radix_tree_init() wants to become:
>>>
>>> void radix_tree_init(struct radix_tree_root *root)
>>> {
>>>         *root = RADIX_TREE_INIT();
>>> }
>>>
>>> instead of the raw memset(), so the connection is retained.
>> Can do; in fact I did consider both, but omitted them for simplicity.
> Sadly I've now learned the hard way that the former can't be done. Gcc
> 4.3 complains "initializer element is not constant", which - aiui - is
> correct when considering plain C99 (and apparently the GNU99 extension
> to this was introduced only later).
>
> What I can do is make this compiler version dependent, adding type-
> safety on at least all more modern compilers. Thoughts?

I think you can guess what my view is about us still supporting GCC 4.3.

As this needs backporting, lets just go with {} for now.

~Andrew

