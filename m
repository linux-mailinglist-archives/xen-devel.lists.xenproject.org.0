Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B3861102
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684815.1064944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUJp-0006fn-Dh; Fri, 23 Feb 2024 12:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684815.1064944; Fri, 23 Feb 2024 12:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUJp-0006do-B1; Fri, 23 Feb 2024 12:06:21 +0000
Received: by outflank-mailman (input) for mailman id 684815;
 Fri, 23 Feb 2024 12:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0yaO=KA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rdUJo-0006di-0V
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:06:20 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2f4c005-d243-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 13:06:17 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-512b700c8ebso987189e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 04:06:17 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 od6-20020a0562142f0600b0068fdc6f89cbsm408247qvb.133.2024.02.23.04.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 04:06:16 -0800 (PST)
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
X-Inumbo-ID: f2f4c005-d243-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708689977; x=1709294777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxkkrvkgc+DSjiHCxjUfb9IZNAwxhD7Q4naR3cAtQYg=;
        b=aw+EbZPCuM9wtrCPaDjDfs4H3y9uEticDSI6QWeMwmAcxzO+ASC/w7QYyhK/ZnV4Pu
         U4hpDawLgTKbvzH8VZ6VA6hx1ETdU0At/wiCGu7O0qxp8u+mjXuP5wzuRyCi7+1/T1Vp
         tgNT8IPC0mtNeoJHUrwLISKzHB2VbsDiRo2TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689977; x=1709294777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxkkrvkgc+DSjiHCxjUfb9IZNAwxhD7Q4naR3cAtQYg=;
        b=P0UQw0LFhGknuWkLC0VVDW4VXP6H5C1N28f3fhvvyz9HUtmsTYU7XZzBP26RtqzUFp
         y0M77Plq+S2XFbR5q4+cVVzXmhdYCE4fJDAMGas20FOSyJTH2hNw775Nl1dFinP4dAkd
         J07Q9KBLWhi5h553SnERi80BVN+5+glV1LE/E367bduEaYYbKxtinybYiBEJPFs7kt2e
         Fmbppxukr1XLT7ynuYuZQJX2IjugR9olrknx1Nria/o+n78Y0hZN5h/82G1xMTsg7d5b
         5G2a8+tfA9mQJPZVTHuSUMixPg6B9NR864vkia7ElE0Lv5tbfvC9zlJR05uoq03ByV19
         WTkQ==
X-Gm-Message-State: AOJu0YxxO+5CUgqKDXfv5mdi4QGMr0kJJVskWQw/G6DJkt12LO9/SM1t
	FAuWzDR8lINSJNaUvr+h0i9sTjIUJAFZRYcYivZLQojg7CYFoY3vozLKISkr2bQ=
X-Google-Smtp-Source: AGHT+IF0jj9M58YIHOQY0Mk98hfGMBpXeO6qDsBxwGe6PYWRBrWUWjnLvBfJaOd6O7n9PEcmwqj6Vg==
X-Received: by 2002:ac2:5f76:0:b0:512:c2e7:27a3 with SMTP id c22-20020ac25f76000000b00512c2e727a3mr1219685lfc.33.1708689977141;
        Fri, 23 Feb 2024 04:06:17 -0800 (PST)
Message-ID: <1d2ab544-b7c3-4d98-867e-1d76f933b512@citrix.com>
Date: Fri, 23 Feb 2024 12:06:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] oxenstored: make Quota.t pure
Content-Language: en-GB
To: Edwin Torok <edwin.torok@cloud.com>,
 Christian Lindig <christian.lindig@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1706697858.git.edwin.torok@cloud.com>
 <f98edc633527b6d9a6855af0aff4fb77970454cc.1706697858.git.edwin.torok@cloud.com>
 <5879EE8F-6FAB-4026-BEDB-1AEEA7BF23DB@cloud.com>
 <400C98F1-A3C6-4E14-90DE-91E314C48697@cloud.com>
 <9301CE74-1D0D-4264-9987-D52AA21F525B@cloud.com>
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
In-Reply-To: <9301CE74-1D0D-4264-9987-D52AA21F525B@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/02/2024 11:35 am, Edwin Torok wrote:
>> On 31 Jan 2024, at 16:27, Edwin Torok <edwin.torok@cloud.com> wrote:
>>> On 31 Jan 2024, at 11:17, Christian Lindig
>>> <christian.lindig@cloud.com> wrote:
>>>> On 31 Jan 2024, at 10:52, Edwin Török <edwin.torok@cloud.com> wrote:
>>>>
>>>> Now that we no longer have a hashtable inside we can make Quota.t pure,
>>>> and push the mutable update to its callers.
>>>> Store.t already had a mutable Quota.t field.
>>>>
>>>> No functional change.
>>>
>>> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>>>
>>> This is shifting copying working to GC work, at least potentially. I
>>> would agree that this is a good trade-off and the code looks correct
>>> to me. But I think we should see more testing and benchmarking
>>> before merging this unless we are fine merging speculative improvements.
>>>
>>> — C
>>>
>>>
>>
>>
>> I’ve written this [1] microbenchmark which creates ~300_000 entries
>> in xenstore, assigns quota to 1000 domains and then measure how long
>> it takes to list xenstore
>> (It doesn’t matter whether these domains exist or not).
>> It shows a measurable improvement with this patch, once I’ve run a
>> more realistic test on the original machine with 1000 real VMs I’ll
>> post those results too:
>
> The machine that can run this test is offline now due to a lab move,
> but I managed to get this data before it went away, and I think this
> patch series is ready to be committed.
>
> Flamegraph without my changes, where Hashtbl.copy takes up a
> significant amount of oxenstored
> time: https://cdn.jsdelivr.net/gh/edwintorok/xen@oxenstored-coverletter/docs/original.svg?x=153.0&y=1269
> <https://cdn.jsdelivr.net/gh/edwintorok/xen@oxenstored-coverletter/docs/original.svg?x=153.0&y=1269>
> Flamegraph with this patch series, where Hashtbl.copy does not show up
> at
> all: https://cdn.jsdelivr.net/gh/edwintorok/xen@oxenstored-coverletter/docs/oxenstored_no_hashtbl_copy.svg?x=294.3&y=1301
> <https://cdn.jsdelivr.net/gh/edwintorok/xen@oxenstored-coverletter/docs/oxenstored_no_hashtbl_copy.svg?x=294.3&y=1301>
> (There are of course still hashtbl in the flame graph, due to the
> well-known inefficient poll_select implementation, and we see hashtbl
> iteration as a parent caller, which is fine)
>
> IMHO this means the patch series is a worthwhile improvement: it
> removes a codepath that was previously a hotspot completely from
> oxenstored.

Agreed.  I'll queue this series in due course.

~Andrew

