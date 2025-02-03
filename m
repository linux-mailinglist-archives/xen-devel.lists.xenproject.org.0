Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0BA258F8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 13:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880555.1290631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tevDB-0002Ch-Iz; Mon, 03 Feb 2025 12:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880555.1290631; Mon, 03 Feb 2025 12:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tevDB-0002Au-F7; Mon, 03 Feb 2025 12:05:57 +0000
Received: by outflank-mailman (input) for mailman id 880555;
 Mon, 03 Feb 2025 12:05:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tevD9-0002Ao-UM
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 12:05:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37a8339d-e227-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 13:05:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436341f575fso49941845e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 04:05:53 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23deddcsm151412805e9.14.2025.02.03.04.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 04:05:52 -0800 (PST)
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
X-Inumbo-ID: 37a8339d-e227-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738584353; x=1739189153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8V7eAdWGlyEeHXIqPP+G5ptir16Xq4sc3yP2ew0oSoI=;
        b=jh2CFrmE0OnI8T5O3qgxbMZS8TREOtLhwbdfI8+fJ7xCOBNMMrk78RFmqKV7xLbp4V
         LKxsR9U8rTpY6w4pIAGP+xNwpxZm17ZTZeT6ckmMxYrvdJtoKUvAJRtC1G+PjC79ZoNu
         1o02+rGETRuI2Emw33w+lvvoZ2lvGzCj68ixI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584353; x=1739189153;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8V7eAdWGlyEeHXIqPP+G5ptir16Xq4sc3yP2ew0oSoI=;
        b=Hqzt7R7ngf1FyRGFVpTwXMfHCuF9Go+LzI4Twnj7chejpeZjGNB+jSgBSVPU6e6Dgc
         CYgMck3IgC5Sr1w6Jn/8dKYOJAwWHw/u9BEX9McMPgUFP/XRPACogMr6Tj5VAE5agi7y
         tMYykNN1Q9fnoVARckbLDKKZwcwRkpBYEF3QVBEOp2YziqZ85xLtZ9ZkysE0XnjghGtN
         LIYgTXobMGBGHm90RoTOaFJE4hYQWYh5qrI396YaRco67J/BYMyOkTP6AMehRpek4oL5
         biMasvsx90gmdfOYzL6x9oepW59l696vQ5ohSAqr+2wZpXTzprT9s6D+O2uPMz/8T/wb
         KjHg==
X-Forwarded-Encrypted: i=1; AJvYcCV4IBCAuyQwGdtWpv14HOMTOnqQLCwThZIrXfXKeoYRgeRhXq6cNSJIgSnWfap472wOpvjdQG8jql4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwtVSXhq2lHKi40wAliz4UUxR1q5LzdIuOeyf172WLVEVp6du7
	YGAMXXpfhAjGfYBYEAeo/qXWMrN5zJ+QtEmU4Ue0pczOENM1DsqV/dkt4nhFCDM=
X-Gm-Gg: ASbGncvXSLf082sBemL8R4VBfI0EiyawRubg/17ZHxHFtu0mLQkcRN1m0tJBXiAr9yH
	0Q5miYE4I/8627uhMVHDFXuYGeDj+qJyXzscRTEKPkbNRBs/fSKw58QzC2/Bap2hxRawKmwfNMl
	49G46bWn6SMCKCE5Oau++IKYapL2TO3tGk14z36GqMOnApHpdu+wbyysgjgzFY+hNkSxbBZ0N0W
	mjYHjgO8rCHNNAzzgQrIjqT6hqqswplZtPBN6cx9+8XJdqKzorNsiTputL+AKRc72Uogb16XIL6
	oEhlbL4rqkC6/9UbBLLiqJHWDfYme+7XvHwJCVZlzChd4/CtsduLDHY=
X-Google-Smtp-Source: AGHT+IEDqdxfuf9M7oWSHIFDByCN+iawXA3tWNRdLWJ4kF1lsFB8tUYxSEwxVNb28bFku/7XBYpoIg==
X-Received: by 2002:a7b:c5d7:0:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-438e07cd500mr170672175e9.22.1738584353204;
        Mon, 03 Feb 2025 04:05:53 -0800 (PST)
Message-ID: <e369962e-d92b-4af9-81f4-532da7813984@citrix.com>
Date: Mon, 3 Feb 2025 12:05:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.21] x86/msi: Change __msi_set_enable() to take
 pci_sbdf_t
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250202134840.40102-1-andrew.cooper3@citrix.com>
 <1b23820f-2778-4219-b8f3-278da7a42b41@suse.com>
Content-Language: en-GB
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
In-Reply-To: <1b23820f-2778-4219-b8f3-278da7a42b41@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/02/2025 8:42 am, Jan Beulich wrote:
> On 02.02.2025 14:48, Andrew Cooper wrote:
>> This removes the unnecessary work of splitting a 32-bit number across
>> 4 registers, and recombining later.  Bloat-o-meter reports:
>>
>>   add/remove: 0/0 grow/shrink: 0/9 up/down: 0/-295 (-295)
>>   Function                                     old     new   delta
>>   enable_iommu                                1748    1732     -16
>>   iommu_msi_unmask                              98      81     -17
>>   iommu_msi_mask                               100      83     -17
>>   disable_iommu                                286     269     -17
>>   __msi_set_enable                              81      50     -31
>>   __pci_disable_msi                            178     146     -32
>>   pci_cleanup_msi                              268     229     -39
>>   pci_enable_msi                              1063    1019     -44
>>   pci_restore_msi_state                       1116    1034     -82
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> I was actually thinking to do the same. And we have more of such conversions
> to be done.

Yes.  This happened to be an easy one I spotted while reviewing your
series, that I could do on the train.

AMD IOMMU should move to a pci_sbdf_t too.  Right amd_iommu's seg and
bdf fields are opposite way to a pci_sbdf_t.

But it occurs to me (having just been at a conference where people were
asking for easy introductory work), that stuff like this is a good
candidate.  I'll see about doing a gitlab ticket.

~Andrew

