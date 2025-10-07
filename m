Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B28BBC0A1B
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 10:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138591.1474256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v633v-0000q7-Ip; Tue, 07 Oct 2025 08:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138591.1474256; Tue, 07 Oct 2025 08:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v633v-0000na-G5; Tue, 07 Oct 2025 08:28:47 +0000
Received: by outflank-mailman (input) for mailman id 1138591;
 Tue, 07 Oct 2025 08:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sa46=4Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v633u-0000nU-9T
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 08:28:46 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c352789-a357-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 10:28:32 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so38579105e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 01:28:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a0241bsm283868045e9.11.2025.10.07.01.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 01:28:31 -0700 (PDT)
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
X-Inumbo-ID: 9c352789-a357-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759825712; x=1760430512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODhrzQLj25vh/uhcf/FdIY0GqzxijxAuYvmzOB+piUU=;
        b=kYs3br8rsAKTZ0sM+I3A48TzBCzjnjEHA78YS9KoujST+M+nONNjPsWL9TVKm1mDUh
         xqQVhtZX5bpvzMKaetAgVfn0vcpQQC1ZAv9oHF+Agjtp1CrBoQkAKxZgQLdRV7phgAK1
         xpj1OF2HGdOm4pK5TEthPjt0gz6AF7lYOM9eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759825712; x=1760430512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODhrzQLj25vh/uhcf/FdIY0GqzxijxAuYvmzOB+piUU=;
        b=kOPti8GXdCxe+E1tRijzIxfdk4qf1ko7iBF3p3iytFbfbuzN/ai8WPHlfsj+mfv3IV
         BEsKTyAkoonDMPUC9sUJBbNP9VAwtlH1fJYCBHCjv5FNvc74jiGQhJpgUcBKaIbNqkta
         WpLzmpBHTVL56+SDAnOeXe3XmCscS/Gh2lEkD6Ys7R7nDmcERFR2yGwjzSgD2wH5kCRD
         noZrUGoZoEwoAMS/tBuJaMi85WFI7jeLjRrwDnVJ8RKcPsB+tdQNA2WBFs2reHSA90Ch
         dRF0ePpugBTSTtFhQBgryqKebY+ADY7TQbaIc+qYin1lZ3LerBmsHKU2xazIcQ0Dtd6t
         ma3g==
X-Gm-Message-State: AOJu0YxSw2QgozGTQjPMWgkAn/D5YkhMd5ge8+jIO8evhwsrzVKdeUx/
	AZxNS0hMQ1iapg+B1ksug8lIlzvUhubXaB1Bzl/IvqVqwiZSVr7tbI/OzjavZEhO6uY=
X-Gm-Gg: ASbGncvPtVT9nMgSArcUaJklCyVLoJr+AEXsrJVncA3BOk80qRn+YS1CZqTHEwvinMZ
	TNT/AzbgbjkhStaQFOV3pB4UhdXzD5v2Dsg6cNDXeF28rP3CmXWbRZ+xtwWSliOosjvKhBR9Gwr
	eOZMpy65YMDLpr6urIN8V29fY98o8uGXumciY2OxJ1ewZLM2FKSJfSGnUC7IjeZJ9Pdsi0Pr6DX
	ICflodxFGPpIBSeOBxCyUjDSUrvHqGMheycVi8kbQSPKI2bbngayw7mNtWUfp4kRbmjIXaZ7B8t
	Zq6jYo3DvwqI8V8ngWtSz6H/uMpbimYZg8rBk0noP8ohR2JpdS6Tz4hSEqQOl/AGoed4Lv6W2rR
	WRJX4iqYJzYGLHRrNGoB41PzuE5AiVv3GMrQwYFvf4FsQ6cDnIf5YNO68NfiAkjiYLiFps4QR5j
	DUM/Dl+MVicIQc
X-Google-Smtp-Source: AGHT+IFSWLSzCE8LO4nPxygffLIEnmu44uzzLupemstwbSlDOA1aXuWMcb6AabO2lLKwWzKtqEgA6w==
X-Received: by 2002:a05:600c:528d:b0:46e:6339:79c5 with SMTP id 5b1f17b1804b1-46fa298df05mr16801275e9.5.1759825712191;
        Tue, 07 Oct 2025 01:28:32 -0700 (PDT)
Message-ID: <dab0d59a-4a72-454d-aa3d-3bebe9caf146@citrix.com>
Date: Tue, 7 Oct 2025 09:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.21.0-rc1
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
 <20251006200840.2171113-3-andrew.cooper3@citrix.com>
 <aOS5O2h767J1QPxs@Mac.lan>
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
In-Reply-To: <aOS5O2h767J1QPxs@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/10/2025 7:54 am, Roger Pau Monné wrote:
> On Mon, Oct 06, 2025 at 09:08:40PM +0100, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>>  README       | 10 +++++-----
>>  SUPPORT.md   |  2 +-
>>  xen/Makefile |  2 +-
>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/README b/README
>> index 9329f30e1366..eaee78bd7375 100644
>> --- a/README
>> +++ b/README
>> @@ -1,9 +1,9 @@
>>  ############################################################
>> -__  __                                _        _     _
>> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
>> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
>> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
>> + __  __            _  _    ____  _
>> + \ \/ /___ _ __   | || |  |___ \/ |   _ __ ___
>> +  \  // _ \ '_ \  | || |_   __) | |__| '__/ __|
>> +  /  \  __/ | | | |__   _| / __/| |__| | | (__
>> + /_/\_\___|_| |_|    |_|(_)_____|_|  |_|  \___|
>>  
>>  ############################################################
>>  
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index eb44ee85fd12..491f9ecd1bbb 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>>  
>>  # Release Support
>>  
>> -    Xen-Version: 4.21-unstable
>> +    Xen-Version: 4.21-rc
>>      Initial-Release: n/a
>>      Supported-Until: TBD
>>      Security-Support-Until: Unreleased - not yet security-supported
>> diff --git a/xen/Makefile b/xen/Makefile
>> index 49da79e10fb4..ba8c7147a2f6 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>>  # All other places this is stored (eg. compile.h) should be autogenerated.
>>  export XEN_VERSION       = 4
>>  export XEN_SUBVERSION    = 21
>> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>> +export XEN_EXTRAVERSION ?= .0-rc1$(XEN_VENDORVERSION)
> In previous switches to start cutting RC's we didn't add the 1 to the
> XEN_EXTRAVERSION, see 19730dbb3fd8078743d5196bd7fc32f3765557ad for
> example.

Correct.  That was also buggy and complained about.

>   If we do add the rc number we need to remember to bump it
> each time and RC is released.

Last time we had truly buggy early rc tarballs, the middle ones were
bodged somewhat (incompletely, and not a straight git archive), and by
RC5 we had a commit with the correct XEN_EXTRAVERSION to make the
tarball correct.

See 4.20.0-rc5

~Andrew

