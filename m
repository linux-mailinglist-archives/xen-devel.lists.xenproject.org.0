Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40076B22C1F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 17:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078874.1439908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrHR-0007t3-VS; Tue, 12 Aug 2025 15:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078874.1439908; Tue, 12 Aug 2025 15:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrHR-0007rA-ST; Tue, 12 Aug 2025 15:51:17 +0000
Received: by outflank-mailman (input) for mailman id 1078874;
 Tue, 12 Aug 2025 15:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BkKW=2Y=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulrHQ-0007r4-5V
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 15:51:16 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d765a6a-7794-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 17:51:15 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso34201965e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 08:51:15 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5852e28sm298486965e9.9.2025.08.12.08.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 08:51:14 -0700 (PDT)
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
X-Inumbo-ID: 2d765a6a-7794-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755013874; x=1755618674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iqW/+PCBX2Y4oQSo0oAABlQ2kTfubhM4GA/WBixaJYM=;
        b=sWSBPAadTLWHSeoEcROcqw2LqtNEiMyHbtvSg/Fv4nuuk/UOSaBNcKEApiaTkfyJG2
         jmvYIkvVsa7flVL1CM7WrUdeUXuCvyPaFVzrUQ69yFR35oC/P4EnGVCvjC51HB+GNEci
         PGcIHQBXffySQ3H7f/z46e6FZidkqz5jBpXiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755013874; x=1755618674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqW/+PCBX2Y4oQSo0oAABlQ2kTfubhM4GA/WBixaJYM=;
        b=myOsr390XysVkP3bGHigUmkwailFX6GTH0dLysSwpj5+gMttf+zccVIukmkpIwjiWz
         grF1Rj5mB7+P/9GJo4jwGxtbRCy4Ui44xOdFbobPfUGLCMTSIwBVDQ84jw/1nOqr8bMO
         ROcBkTV3rhzUhJc01RkjiONdL2zG8/GpFx2Ju6Ti+zDot29K27zWNrP/VDvXHQTPxPXp
         NWeLkIfcfazm6NvCtNKxp/+2KmPu3ZhY7Pwfxe3UF3ZPzPinkYn1IiJfDsrBDqMT4aHz
         V/nj/W2bMvwMLCRTjq2Zml4kA+cGOSgbDx+zUYW0Sx2ZFTxH1AG5itl/p2C9r2Z6mldp
         a29g==
X-Forwarded-Encrypted: i=1; AJvYcCW8DNodVrbFdxyUlerUBLRsvwfteZnKxSeN0CWVKC02NE3QJNREO2Ewil38HgdrQU8lWx3HvDQlLiA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7au1kENmtLRrcolpYFBWJTWI56H9WgxMd39CijD1usQ8PysgB
	79cLAgIeZhXz/VD0vUZyd5g/ihlm/8N6HZMvloQVZ70Z8jH9xr3TU7TbSTcz0GwXDf4=
X-Gm-Gg: ASbGncsNyte3OBhl0u0ju0YqNFIU2FvYisPwVi196limZ+ak6pwdzmnlO9sLRMdyFEN
	ioChE6Qa++vl+E/EwuO13no5czibwjOXfEuU3BaU/UXbWvyLQQg4cMyuhOeK/xZdmmQjcQMgFQ9
	ww2w03dPFBRx4aQvXV6Eojvy1DOTniU6dG9Ms6JaENXDLYizoL0VRI1ydmbuieb59hkvlWRREqt
	hmaAMKhbQuo13MbfQOKJYBZFMr/C1S7dxoyqryfA7srTeEIIbSsRdwHCca5NfHLI9LDtqRFJ86X
	XaJlLcanFJFHUek1b2jZaTeALbExlQEDDEoAQQZkXdH85QqOzu/PhFKiYYqbCK3veik75hiR0Iv
	aSy5MfDsgo8U+t1ivTdZiw84Lspi8DhKhFBif0OYvAM4oT1FwonrSSM7HiwxMS7XkLaAD
X-Google-Smtp-Source: AGHT+IGUnpaqcXcyy5CfWrwqF4SRPXansY8Mr+zsvZ3+3GeO839Kcvn7GZeWrKVR8lJjKunTVld/VQ==
X-Received: by 2002:a05:600c:1381:b0:459:dba8:bb7b with SMTP id 5b1f17b1804b1-45a15b100a2mr3845025e9.13.1755013874407;
        Tue, 12 Aug 2025 08:51:14 -0700 (PDT)
Message-ID: <8275b155-d04d-4d75-bdd0-f9a6a8f72875@citrix.com>
Date: Tue, 12 Aug 2025 16:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Remove unused symbols from linker script
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250812151923.96832-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250812151923.96832-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2025 4:19 pm, Frediano Ziglio wrote:
> The symbols declared with DECLARE_IMPORT are meant to be
> used by the 32 bit code.
> The __base_relocs_{start,end} symbols were not used by the
> code.
> No functional changes.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reported-by: Jan

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Can be fixed on commit.

