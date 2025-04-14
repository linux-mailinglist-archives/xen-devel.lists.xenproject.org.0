Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932D1A889BE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950983.1347140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NZF-00018K-BH; Mon, 14 Apr 2025 17:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950983.1347140; Mon, 14 Apr 2025 17:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NZF-00015v-7u; Mon, 14 Apr 2025 17:25:57 +0000
Received: by outflank-mailman (input) for mailman id 950983;
 Mon, 14 Apr 2025 17:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4NZD-00015n-Bv
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:25:55 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84c0c074-1955-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 19:25:54 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so25036535e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 10:25:54 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963fccsm11494988f8f.3.2025.04.14.10.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 10:25:52 -0700 (PDT)
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
X-Inumbo-ID: 84c0c074-1955-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744651553; x=1745256353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FUIzQD6p6HQ+GYIBiHA+cwCINAwcLx8RmSgULC9rwiQ=;
        b=loc6Air33RBpuZ0+p0aJVXHWpkei0bCmzPDs8w22EdtAKa8p0lT9nZ/n7UDFWexdPX
         wek3v8M1EvKBJxkENfD4bywRjtbwj6M632pbXD19a2bnmEzVdbnL+m0l27jSJCCi+aqK
         ZQGeFOlTbvEjpdMVH1R6j27eI3XlfxD6KXriA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744651553; x=1745256353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUIzQD6p6HQ+GYIBiHA+cwCINAwcLx8RmSgULC9rwiQ=;
        b=ij+tCEkLxCt4oaCkZ0PbXS5Jz8qEXdmEqLpBS2ZrvoIWeR2tvn+wEn95b6S8v7GKAP
         K/iFUFEVedPZqs3ZtU/gBZb5uh932gKdAU05sl8dohNQY6QXeIlVtGTiAML9n0Ln6Don
         lR8OPl0hi3KFu405y+BM347sZyFrYu0lbI5DQPxkuya9VcBbFgeDLSwoeMUXmh0Fs7Ut
         tmPn4QqxH3nuqVZxZdszBDUkp6UOdDU0XmzPbKZKf1TrI36sOFIb36eD/GIYTTBE3+vQ
         fPMCF1EuOpTaxoJ9ask69kGiTCWbFYiUbrfGkuElkE30Pl4AjbTRyTMQ8JuXbLdNZ/ZL
         MyaQ==
X-Gm-Message-State: AOJu0Yzu1jxOEqwiYEIQodYR7H+feu0hFP7mpda4o4Gq4RPvsEUcuA4R
	Pv4OXG2jBStJ8fiNiSx+xUvhkUi97m+m7H6Cy9/D5itqj8WJQC9/vyf69rJpsnY=
X-Gm-Gg: ASbGnctPPRZS0iiuIaV7Nx9cMM/qfUhgOvHYysq1+jCEz+BRx03+U/tl2vMxuDdzRo6
	/WtpvIf2mSxgIt+wU3NiuSzG/8f2C51ojdXXFKsfalfMPE+23SAbS76+BnlWNhvrLfDW57gRyDw
	QbIAhx309fXu0ofhEGnJo1iNnKhxEZQ00hE8vToHO6wzX5ZMTIsRyULLeScICimCdxzeoKDX53W
	4gX+t6gaigIM8q0DY0oBbZUcsGI1bmTx/gimiOUTpnNcOLLuKPiEe6aIqkvWvUB817x7buxvRY+
	euEy0mVnuiCHfxk9rUnT5egFjYNmBheWcucL4c3Jj1buqsq2pGw4yB1V+DC9mYPJat7BQFfyiPO
	Fc9QDCw==
X-Google-Smtp-Source: AGHT+IFdZRqZSqIAJRRJLH9tid8qkMuVAWpworf0ljyEj7lQMP1OehQ0flMyy9wpphLppXWZCB+Fgw==
X-Received: by 2002:a05:600c:1f14:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-43f3a93fa6bmr116418525e9.13.1744651553312;
        Mon, 14 Apr 2025 10:25:53 -0700 (PDT)
Message-ID: <f8920620-3e2c-4421-b2ec-726145733265@citrix.com>
Date: Mon, 14 Apr 2025 18:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] CI: Switch to new argo artefact
To: Anthony PERARD <anthony@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-5-andrew.cooper3@citrix.com> <Z_1EyjnMwIudRszF@l14>
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
In-Reply-To: <Z_1EyjnMwIudRszF@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/04/2025 6:24 pm, Anthony PERARD wrote:
> On Mon, Apr 14, 2025 at 12:09:01PM +0100, Andrew Cooper wrote:
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index 51229cbe561d..d46da1c43d05 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -242,7 +242,7 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
>>    needs:
>>      - alpine-3.18-gcc-debug
>>      - project: xen-project/hardware/test-artifacts
>> -      job: x86_64-kernel-linux-6.6.56
>> +      job: linux-6.6.56-x86_64
>>        ref: master
>>      - project: xen-project/hardware/test-artifacts
>>        job: alpine-3.18-x86_64-rootfs
>
> Don't you need to remove the dependency on "x86_64-argo-linux-6.6.56"
> which is just out of context, as I think this is now part of
> "linux-6.6.56-x86_64" job.

Yes.  Sorry, this was a bad rebase taking out my "ref:
andrewcoop-test"'s through the series.

>
> Besides that:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

~Andrew

