Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521889169DD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 16:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747819.1155319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6qb-0007jw-FE; Tue, 25 Jun 2024 14:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747819.1155319; Tue, 25 Jun 2024 14:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6qb-0007ht-C9; Tue, 25 Jun 2024 14:08:37 +0000
Received: by outflank-mailman (input) for mailman id 747819;
 Tue, 25 Jun 2024 14:08:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sM6qZ-0007fD-SE
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:08:35 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68446aa4-32fc-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 16:08:34 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-79c0e7ec66dso28237285a.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:08:34 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce92f564sm407682085a.107.2024.06.25.07.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:08:02 -0700 (PDT)
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
X-Inumbo-ID: 68446aa4-32fc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719324513; x=1719929313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ9i7tm2EOJhClHOiMOnSBBeVRYUqEwtN3M9NdULw9o=;
        b=Yj+fNMenoVBn38Oz7NtLhD88s8q5mDadcGuPIGTAalVDvazQrMWq6o0qlKpKMYmYoh
         IHs7KrAEb84pCn3MHwcyEsxm78C3fXihY96OUrnF5/65sMQ6kkUQh0cjw3vAKY7sNxfJ
         YxWhL1Pc8mtmRoN+tb8jKYbA1/JfLOAgUp0Pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719324513; x=1719929313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ9i7tm2EOJhClHOiMOnSBBeVRYUqEwtN3M9NdULw9o=;
        b=o+q0+AkCMFOkIcciBIVXsjV+Sd1bt8QQw2U5uFqWO6MivSMRFxiCljUDrqi4myY05R
         r1srkNGloVUoiLztqDtUxHgsg7hnIooWVplN5Kq7vg9/7sEo5nWiByBXuz1F0DOHJOEb
         x8VnKYh8ns7IoadVno1XrQz8cFAY97PKZWYCaT2N0nP5MjaGLmbb5b8zvmKXEGAyAExf
         WPm4aFI8uDzYJL+gQbPS0dhXNEiCuGVMxGa39fGaqc/+moSX3l4KNZNgQTBZMqq6vjML
         LLoWS06vPROgkKoK3nU8j+z4eZMagJHG4tsX1Trw49FsCO2351e/np71bvhXhAwkZIH/
         rmjg==
X-Forwarded-Encrypted: i=1; AJvYcCUCZPjhenordWVMcPtEmqxbgXWYJ0hY23tSEw3EBE0nDFtUAtBEYqEaTQHv+WxmgnoVbC/eXUJxSMTVanWvXnqYoWETXFpm14Y0iSwGI4U=
X-Gm-Message-State: AOJu0YyISyYJIHCyzYFeg75fgwycuY5X9BYjM/WoV9CzU3TRJ1WlL6VI
	88vkvBnVYMkMe3Bmvh+IF03wUSWzKcCM50RpxcCmArOvv32NyQSfGRgWUFTTXYsW2jDI/jIbmK6
	lpRU=
X-Google-Smtp-Source: AGHT+IHhNQeHxMF1iz5ojO+z0qsbLxUl4HMoxdtep1bUmSJdeiaQBXlgKLgDtwV1cnq/v+t5Docqdw==
X-Received: by 2002:a05:620a:471f:b0:795:e635:68d6 with SMTP id af79cd13be357-79be467224bmr908391985a.3.1719324482957;
        Tue, 25 Jun 2024 07:08:02 -0700 (PDT)
Message-ID: <7f72220b-7386-41bf-9f5e-0be2c70320e4@citrix.com>
Date: Tue, 25 Jun 2024 15:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] Config.mk: update MiniOS commit
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
 <52373e0cea119ff04ebb997f3d0aea6bd3c9dc41.camel@gmail.com>
 <c0519803-8753-4933-8193-fa036f626b36@suse.com>
 <60b60f2cb8f44126b442259fbc1c878b8166b7dc.camel@gmail.com>
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
In-Reply-To: <60b60f2cb8f44126b442259fbc1c878b8166b7dc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/06/2024 3:02 pm, Oleksii wrote:
> On Tue, 2024-06-25 at 10:26 +0200, Jan Beulich wrote:
>> On 25.06.2024 10:10, Oleksii wrote:
>>> On Tue, 2024-06-25 at 09:57 +0200, Jan Beulich wrote:
>>>> Pull in the gcc14 build fix there.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Probably nice to reference a gcc14-clean MiniOS tree from what is
>>>> going
>>>> to be 4.19.
>>> I would like to ask what do you mean by gcc14-clean here?
>> Being able to build successfully with (recently released) gcc14, out
>> of
>> the box.
> Sorry for not asking that in initial reply.
>
> I am still confused with "from what is going to be 4.19".
>
> Are this words about gcc version used by Xen itself?
> If yes, then before this patch gcc version of Xen and MiniOS was the
> same?

A release of Xen is more than just xen.git.

In this case, https://xenbits.xen.org/gitweb/?p=mini-os.git;a=summary
took a bugfix for GCC-14, and xen.git's reference to it needs updating.

MiniOS is one of the components used by xen.git/stubdom/*

~Andrew

