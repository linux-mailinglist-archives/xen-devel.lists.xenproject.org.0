Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3958B8BA5
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 16:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715326.1116872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2AZ4-0006Cg-Rt; Wed, 01 May 2024 14:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715326.1116872; Wed, 01 May 2024 14:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2AZ4-00069f-Od; Wed, 01 May 2024 14:04:06 +0000
Received: by outflank-mailman (input) for mailman id 715326;
 Wed, 01 May 2024 14:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0p4=ME=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s2AZ3-00069Z-RY
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 14:04:05 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa7a9de2-07c3-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 16:04:03 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-78f05341128so473794185a.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 07:04:03 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k4-20020a0cc784000000b006a0cb461f89sm3150190qvj.6.2024.05.01.07.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 07:04:02 -0700 (PDT)
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
X-Inumbo-ID: aa7a9de2-07c3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714572243; x=1715177043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iMxejeIzjvoaJbOylrVM2d+rDBZmPm9tSSUkJk06FUA=;
        b=lx8kdjr50KpsNbHpRO78vnh1hPTMpo+26JF7V+RgQEz9fPf/Dm8ljgO+zKPybNzIap
         L3VXWIe21tO4cAk8lUdPfDct3aCkzZvFOqRg/rSjDxONhcCOdxi/FD32l6o4w7u4DBm8
         ZlUJu7HfA4qqnEAZwayCW//7Xjh7OR+We9THc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714572243; x=1715177043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMxejeIzjvoaJbOylrVM2d+rDBZmPm9tSSUkJk06FUA=;
        b=fGMIytXHHBEwsVyX92lduZaSeARAQa04IhkidiOsaTqM0irkCVBwlDOW7EQ1yyxqMA
         9ualO5B5IjG0adYeTUSJy3KKyhXq6SvNbgW/aZ5XByWibNH6VjFw7Y/N2RtVKkOtCmTp
         q4z5bDYHZAS85iI+BIg2bSbtS82N0alfFRv/k2hmTw3sY8NDDoOA4I4F68OG+a43hFnH
         JiTLjVl0bcP6nHQGc1+7YzN/aK591GyAg/4mF1TjFtqHJsBpSufFQWRbSNyMN10+GB8D
         FIu9seG6qqEGo5pE9P047wGytc3U2vF5ESnh4l7XjRtdWdvf33L835rh5bunWpoIsmD0
         9MgA==
X-Gm-Message-State: AOJu0Yw19vzOmIuXqrt2VRnUZ9hvUMhkpCB6LlC/pHZxaDKD+y5K3n+F
	9elB2GMXzKCKtM0CBuy20rfOyYWmg8arAVq+5VJ8m/JxTNGuVzg4Yi6F/R9+LaArS6iV9adlXDm
	p
X-Google-Smtp-Source: AGHT+IFswrEyF7UFjObQ/mTFSeZCz1PMV7DTg3l8LmAjjldKRt39C8khdkwldLKMZBsKsxvoWTXH9g==
X-Received: by 2002:ad4:5c8d:0:b0:6a0:8225:d89e with SMTP id o13-20020ad45c8d000000b006a08225d89emr3108746qvh.25.1714572242690;
        Wed, 01 May 2024 07:04:02 -0700 (PDT)
Message-ID: <dcb9a57f-b002-46bd-a7dc-1cd580a9ab69@citrix.com>
Date: Wed, 1 May 2024 15:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/{c,o}xenstored: Don't link against libsystemd
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
 <20240425173216.410940-2-andrew.cooper3@citrix.com>
 <b5e242fa-daf1-43a2-afd2-cc1ad1bd4dc1@perard>
 <341c5901-254e-4ad2-b935-6b586cd25f2e@citrix.com>
 <413a63de-07ec-43a9-ae60-6b0cfdd61312@perard>
 <83160ad7-19b1-496f-a560-c11db67b1caf@perard>
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
In-Reply-To: <83160ad7-19b1-496f-a560-c11db67b1caf@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2024 2:29 pm, Anthony PERARD wrote:
> On Fri, Apr 26, 2024 at 09:51:47AM +0100, Anthony PERARD wrote:
>> Run `systemd-notify --ready` instead. Hopefully, that will be enough.
>> ($NOTIFY_SOCKET is a socket, and a bit more complicated that I though,
>> it can start with "@" for example)
> FTR: If it turns out that calling systemd-notify binary isn't working
> well enough, we could have an implementation of sd_notify() in our tree,
> openssh are doing there own here:
> https://bugzilla.mindrot.org/show_bug.cgi?id=2641
> and there's an example implementation on systemd's documentation:
> https://www.freedesktop.org/software/systemd/man/devel/sd_notify.html#Notes
> (Nothing for ocaml)
>
> But let's go with `systemd-notify --ready` as it is just easier to
> write a bit of shell script.

I was already thinking of going down the small-library-function route.

Given that I miss-analysed the launch-xenstore, script, I'm not overly
enthused with just falling back to waiting on the pidfile, because
that's adding technical debt rather than removing it.

~Andrew

