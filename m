Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E48A80C4B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:31:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942096.1341382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u292p-0006Wr-Bg; Tue, 08 Apr 2025 13:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942096.1341382; Tue, 08 Apr 2025 13:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u292p-0006Sx-8k; Tue, 08 Apr 2025 13:31:15 +0000
Received: by outflank-mailman (input) for mailman id 942096;
 Tue, 08 Apr 2025 13:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Iqs=W2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u292n-0005ys-GO
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:31:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcc8d6b8-147d-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 15:31:12 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso37924595e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 06:31:12 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b7dedsm15102527f8f.52.2025.04.08.06.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 06:31:11 -0700 (PDT)
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
X-Inumbo-ID: bcc8d6b8-147d-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744119071; x=1744723871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NOkSNpbX1JVcGPrFeghfe1pQ7Op1ydlEj+13XSifgEU=;
        b=If1SeuchthB1QDJ/otTVLtSMgtg2I3mDpqeZhsG6wyNKSzX9ionMKbkt/2b7aFgZyb
         lNXSOIMn7/L93+AWvFQovCUit7O0GDZExYuFjbkLqJg1WEaUPe8tPYKykDilz0jF30EB
         IV9RQUSiP8Tc3N1gFuVVWss/Oksh7wjYY5Fls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119071; x=1744723871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOkSNpbX1JVcGPrFeghfe1pQ7Op1ydlEj+13XSifgEU=;
        b=W4XxYQMRYPTPIpuVMFvWnoDXWU4KK90PjwwADINCZnswonw9n8kikEYPEmrjmgLOFt
         GcWfysEmmqKNZ/vrJEurEhdcs886+l2Xm+ukoeMPDD99twfXwfyOQaYJEaP+ppm5v0ce
         wAgXh8OvJ/Ds3r+QQm1fgDqSzMUInkT9wDEJtO6CtP1v6zOKuzy2yrtslS9kSwpDym3f
         /bZNXh6OajaRpAXpuvNox7S42xKv7bhIjEexhySq4piiPTuQxot51Uo/2u1IxHnWrrVN
         17koE1KiKePGb83vZiGgeTYwjKPYYcNtYqK2J3JEapicNRXteg5DBbAnNcAId56BAWEU
         sJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVswffDTL048szTfeCnINdXv9xpPrtzqB/08YwQcyeMrBQjIpZO8gLM4Ran8fP5WEdcHskz38mNyJg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzP3V+XWts+dJCm74S4nSXf67t1+gh0Jddbgse2Z7ZAYQivsskt
	s93MQxFdmosGiQPgPsuMG1LQEJV3WbLuMo1DTu2FnfCyQmV1eT9o8og26VgvHto=
X-Gm-Gg: ASbGncsEEXGVFuGm7+5X58ErfFSOEhKNx6KvXM6dO7YK0ePQkY6f+CyjevV7vsfuBL3
	/pccTa2qd4f8TOen46FX2CtDOnsJChbbssWext07+6Vg+9cVepEngo6R9JaHwFZ4TrJntEoduO1
	YY7/7RhopQnjfK3maAwR39RFCWletJdnnRvs5rjp6lJ5mXeYAK2P0NVI2QGxLG+G763iQ+C6kfw
	7T9KCWzuZlVBCRwyLPE2WJIYVILj4xNnjaMynTxrrMHP9mHabp9Xm51AJzCwdp0HwGBOk/lQgqr
	UqN/ia3X4wQM28ZWciZsBv1hDHfZVw1F+dBmhErShSp4K3De2eVyBSo9gNcReNwe0ZRpYJ78hiz
	gGYl+M4V1lM9Ekc7JKjfm
X-Google-Smtp-Source: AGHT+IFIraB3gnQYI6p1gpf9L697VGJnkGCEeP279m9Xszn7etiRuxm/r2LPINsfGkKnm3WKYn/+TQ==
X-Received: by 2002:a05:600c:1e23:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43ecf81b197mr151184485e9.5.1744119071464;
        Tue, 08 Apr 2025 06:31:11 -0700 (PDT)
Message-ID: <a16618c7-94ac-48e3-817d-80c88c18c95f@citrix.com>
Date: Tue, 8 Apr 2025 14:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl+hvmloader: extend IGD check part 2
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/04/2025 2:23 pm, Marek Marczykowski-Górecki wrote:
> Consider also "Display controller" an IGD, not only "VGA compatible
> controller" in few more places.
>
> Fixes: 4191619e0893 ("libxl: extend IGD check")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Do you prefer this to be split into two patches (libxl, hvmloader)?

Probably not for something this trivial.

>
>  tools/firmware/hvmloader/pci.c | 1 +
>  tools/libs/light/libxl_pci.c   | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index c3c61ca060a6..1ee97a5b4b20 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -173,6 +173,7 @@ void pci_setup(void)
>          switch ( class )
>          {
>          case 0x0300:
> +        case 0x0380:

Now we've got multiple, we should have /* VGA */ and /* Display */
comments like libxl has.

Can fix on commit.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

