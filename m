Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA1B2F3FB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 11:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088280.1446044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1do-0001hW-Nw; Thu, 21 Aug 2025 09:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088280.1446044; Thu, 21 Aug 2025 09:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up1do-0001g4-Kf; Thu, 21 Aug 2025 09:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1088280;
 Thu, 21 Aug 2025 09:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1up1dm-0001ff-PP
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 09:31:26 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b81d3b9-7e71-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 11:31:25 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso561793f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 02:31:25 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c4f77e968esm1132018f8f.21.2025.08.21.02.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 02:31:24 -0700 (PDT)
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
X-Inumbo-ID: 9b81d3b9-7e71-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755768685; x=1756373485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7UUzI5xEraTbBLRyDZmYidZa6/vhfjYBua1iJJI3no8=;
        b=caUm7fERrvb4k3Uqo719bY6nxEZJCji5X7lQDwpAuFKHZzq2eqvXBk5U95gK2YoqAh
         4bjM1XTyA9GQOqZ46dUY5bv0QIAhpvKnZND3xgW6oZ3eIIm0Z+64fYKmv6xCDRL4qKBm
         l754+xEMftdwnLq4E/wG48oLMRaXYQAHEiKF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755768685; x=1756373485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UUzI5xEraTbBLRyDZmYidZa6/vhfjYBua1iJJI3no8=;
        b=GJ7z3QX78SLnZBAuysWEPyFSEQX65ZXrw4/biE2V17yPvVpCNgIfDoOZ71gqkQGha5
         0PWuZUAjeFeSNhoAT40JMm/wTRVjWHcQNK72xW56KCimJEp4DBnTeD1lbCSrSAylzyNL
         asElJ0cY3hXUt1n/lUFFVS18n63PGm6vM3Obuomt7McTg/wE9y5wDWi6lsxYWIMfvwTY
         Yd6mOiBGGPPkewCBCi9Mrjbge5uT/1n/WGJcz4X/XgSltnkIu+3oUht8JtObZ1HWR1Qa
         DVsGme5PErW82kNky66Ctf+1VjZgyxewuCy8FoHbaKZjW/plZQJtu8crh7CHQv1wuw4o
         srCg==
X-Forwarded-Encrypted: i=1; AJvYcCU6S8bw1DU6HK+va91O1/w3xVUDsy/G8k1OxMML1vtOsFFwc4nNAxHjktSwoLCrxTgCsyDza2QrPWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAsX0LugD9GBYblFY0qrBYtAXWiI7pOwpaWP76sB9A7+ke4HJh
	8mKTAXqT4k7bdkdLhzbtVFwlk+6eC7BWSIz9EugWGQKce3ERsS31RbVmg3X4hyvqmcw=
X-Gm-Gg: ASbGncvWBKGP/yzvxZjrMgcN6VA8So6qJD7BRPCnt/8/qWqK/jTo22ombvERLG2J+5D
	mNiLDqQ0zLzmUZa+BtUcppaI8TCVDq7/SJvFDnhaKgE/IXjpF9s3niDVcajU8yW6fNzqgh7gZrP
	mpoOnE7ONhoGuUX/T+BkS1obPwwpysfXNiTLNPl8D3gSMqEhhSAJRCAs+vPnH/Bv/Bo6Pj+C3ci
	scPpLfa0P7t1VHarWu663DbHJ4+H+ZyUiLcBAkaa/9uGikC2FBVTpvNGcr3OdE2OE4kSLC82/K1
	y9tdYX7sLcLWyquR2aKd+0TxaUbVl8zbniCgkqfT50ukzYzP7B6dpxh1BKsDK4MxMyL1mxHsdpo
	TrO7bo/NeaepzA4IpQlhHja6atV3cVBhf2BnX9PX+PgP+JcS99hDaN5rVfm1MRCbiAQZT
X-Google-Smtp-Source: AGHT+IG5yRHb4bghgS9XvZ8KlDpoBE+3aKKsD2whqGUrsAgR9vpzKOMYGS0kTz1v4w/gza9piLtviA==
X-Received: by 2002:a05:6000:4210:b0:3c0:7e02:8676 with SMTP id ffacd0b85a97d-3c4978390fbmr1362296f8f.61.1755768684671;
        Thu, 21 Aug 2025 02:31:24 -0700 (PDT)
Message-ID: <5b87bb85-3e52-453e-82ab-6d4f9b7eec28@citrix.com>
Date: Thu, 21 Aug 2025 10:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] releases: use newer compression methods for tarballs
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fdd60576-c852-4ce9-921d-9e77a86a3e66@suse.com>
 <f2105411-ac78-4283-a7d7-45f5b1bc0bfe@citrix.com>
 <eac220b7-d5e9-4710-a0fd-e69a0162df7d@suse.com>
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
In-Reply-To: <eac220b7-d5e9-4710-a0fd-e69a0162df7d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/08/2025 8:26 am, Jan Beulich wrote:
> On 20.08.2025 14:15, Andrew Cooper wrote:
>> On 15/07/2025 7:33 am, Jan Beulich wrote:
>>> It's unclear to me why we have git create a tarball, extract that, just
>>> to then make a tarball again (without any special options, like to
>>> override owner or timestamps;
>> That's because in c5be91eb8140 you deleted the intermediate step of
>> merging qemus
> Hmm, perhaps - I'm generally trying to keep the size of such changes down,
> when working in an area I'm not overly familiar with.
>
>>> in this context I notice that tarballs
>>> created by Andrew have file ownership of andrew/andrew, while ones made
>>> by Julien use root/root).
>> Ownership where exactly?  the tarball itself (which will be down to
>> accounts on downloads.xenproject.org) or the tarball contents itself?
> tarball contents.
>
>>> lzip, unlike the other two tools, doesn't really show a progress
>>> indicator with -v. Merely having final statistics may make the use of
>>> the option here questionable.
>> I can't say I find any of the stats relevant.
> Happy to drop the v options.
>
>>> --- a/tools/misc/mktarball
>>> +++ b/tools/misc/mktarball
>>> @@ -31,4 +31,14 @@ git_archive_into $xen_root $tdir/xen-$de
>>>  
>>>  GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
>>>  
>>> -echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"
>>> +if [ -n "$(command -v xz)" ]
>>> +then
>>> +  tar c -C $tdir xen-$desc | $(command -v xz) -v -9 >$xen_root/dist/xen-$desc.tar.xz
>>> +fi
>>> +
>>> +if [ -n "$(command -v lzip)" ]
>>> +then
>>> +  tar c -C $tdir xen-$desc | $(command -v lzip) -v -9 >$xen_root/dist/xen-$desc.tar.lz
>>> +fi
>>> +
>>> +echo "Source tarball in $xen_root/dist/xen-$desc".tar.[glx]z
>> If we're deciding to use multiple compressions, they want to not be
>> optional here.  I'd far rather have a reminder to install the package,
>> than for it to simply be omitted.
>>
>> We don't want to be re-tar-ing now that the qemu's are gone, so I think
>> the structure wants to end up as:
>>
>> git archive --format=tar HEAD > tmp.tar
>> gzip -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.gz &
>> zx -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.xz &
>> lzip -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.lz &
>> wait
>>
>> Might as well use the multiple cores better...
> I, too, was thinking of that. Yet as per above, when fiddling with code I'm
> not overly familiar with, I try to limit the amount of change done. As you
> ask for a bigger change, I can certainly do so.

Would you like me to do the patch then?

~Andrew

