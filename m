Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95945A8403A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 12:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945216.1343455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ot0-0001kY-CR; Thu, 10 Apr 2025 10:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945216.1343455; Thu, 10 Apr 2025 10:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2ot0-0001iF-9T; Thu, 10 Apr 2025 10:11:54 +0000
Received: by outflank-mailman (input) for mailman id 945216;
 Thu, 10 Apr 2025 10:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2osy-0001i9-Pr
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 10:11:52 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 382e6922-15f4-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 12:11:50 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so5862245e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 03:11:50 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8936115asm4407210f8f.12.2025.04.10.03.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 03:11:49 -0700 (PDT)
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
X-Inumbo-ID: 382e6922-15f4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744279910; x=1744884710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DcN7auf3s/RSmxKl5bmo+zlo3eyaeJm+WxAIcMe2E8w=;
        b=rPnKH2uLjTldeEQLxe82TzBpSUdHjt8hp7b5zSE1TFMN7B3YUNBFxLVl+E2u2i56vh
         FFnDRFUgg5mYfeWksz6cJaTbB0wiP7acIt9Ke4bOuFHyDS0Y3ezhi+HWFKXyFrE19t7n
         wF9arbgliy0t//8vi2IOE5u/i+iWcnB8tn8ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279910; x=1744884710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcN7auf3s/RSmxKl5bmo+zlo3eyaeJm+WxAIcMe2E8w=;
        b=QysLGtCJITLL/4oX/1HmfFy9I39tW7KUcPb/ZLBy0Px1b3OUIub+jYI0EhXOeWxoc0
         Z84iCsu7sDQwtVlqArs4GftSrsYzeywVoTbbu2lLC5vJJYPFqyz/OgM2BUrscS0TjjOU
         wqdwdPTfL5aFm6FAl+9DTJubAxr6sN0fqtJv95idbl9OHKKBo7GQF8qZQg/cC2c9RwZ4
         fQVgK7mqR5eZEogXMLM5Zwnxqs5Zi4XTPhXSC2EjkRODTbhmePsibl6lSFALILnod9MM
         ab3ktjGQsb+JDd5YoFGG7FuGjRkyu0HiCKCUGX/vcmoXKoS5HRY0LxQ5Wka+oTyiFBCI
         oraw==
X-Gm-Message-State: AOJu0YzDQvHP8rp4YQPHGdGuJPCHu7qZAQKmSSCXTwXfu+0OmVuxsyvM
	mhfokbRLyUcSYX5B18ylNv00l9UsD5pFp4wldKmzZxEaRo1i3ThvObOKsOvR4jE=
X-Gm-Gg: ASbGncsWvI4zcEDgl7YgHSZnq7IgWHrGgPTrWUvTCB14ToS+Nfjfv+NHeIiaVfBh3st
	Vqd79lwXLIi667Zr3Y4CilfKw0NjOLL8rbuW4JhfKXlc6C2QOd4UFkAC4guX0O90GKBTIAt+H+a
	ZevzVzPY89bWLLV1R/KM8DL7MACnvZbgr788mejPGXcNmYFn5yrH1nncHsL2exHJXs8CyHzPmbI
	OY89pnAp79VXTx8tWuK4q76T0eFlGNsJl7oqZ2jZmsaaCf7pdmVOpcI1IWb2qbC8MgQhIkOyH+v
	ET6GwBguHkQHC2clu1niuWU87PcVFwm6M8KCU9FTOm2mxdVpTyrXh/hdquCQgbbLsp/kfmiYyTf
	EkKgaAA==
X-Google-Smtp-Source: AGHT+IHbSrKSoSvXGKpxBTKh81SdPDIIUenpf5mQqHcOnTUWu3XGpuqS0X1PUuDvFEtejWa7/NOfcg==
X-Received: by 2002:a05:600c:4e54:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43f2d7da910mr27479575e9.16.1744279910327;
        Thu, 10 Apr 2025 03:11:50 -0700 (PDT)
Message-ID: <51de54c6-4540-4b84-ad96-9d2edc487016@citrix.com>
Date: Thu, 10 Apr 2025 11:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] Clean up Gitlab yaml
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-5-andrew.cooper3@citrix.com> <Z_eYagfQ8vlMYenK@l14>
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
In-Reply-To: <Z_eYagfQ8vlMYenK@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 11:07 am, Anthony PERARD wrote:
> On Wed, Apr 09, 2025 at 05:36:58PM +0100, Andrew Cooper wrote:
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 36ec6a7e1ee5..5a0a853e551d 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -1,12 +1,19 @@
>> +variables:
>> +  REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts
> Did you consider naming that variable XEN_REGISTRY like in the xen.git
> repo? REGISTRY is a fine name too.

I did, except the makefile for rebuilding takes REGISTRY, so this
removes a REGISTERY=$XEN_REGISTRY from the container rebuild logic.

Which is another thing I haven't posted, because it turns out our
docker-in-docker only works for x86, not for ARM.

>
>> +
>>  workflow:
>> -  name: "xen test artifacts"
>> +  name: "Xen test artifacts"
> Isn't this a very useless workflow:name? Can I suggest to remove it
> instead? I mean, currently, all pipeline appear to do the same thing:
>
>     https://gitlab.com/xen-project/hardware/test-artifacts/-/pipelines
>
> Without "workflow:name" set, the default name will be the subject of the
> top commit.

I did wonder about the utility of it.  I'll drop.

~Andrew

