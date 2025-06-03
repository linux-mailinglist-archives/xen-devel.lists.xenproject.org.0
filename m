Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D381ACC74B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004397.1384101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRJq-00071O-5S; Tue, 03 Jun 2025 13:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004397.1384101; Tue, 03 Jun 2025 13:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRJq-0006zX-2V; Tue, 03 Jun 2025 13:04:42 +0000
Received: by outflank-mailman (input) for mailman id 1004397;
 Tue, 03 Jun 2025 13:04:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMRJp-0006zO-Is
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:04:41 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f54a3da-407b-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 15:04:40 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so61562025e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 06:04:40 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe754acsm18488654f8f.59.2025.06.03.06.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 06:04:39 -0700 (PDT)
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
X-Inumbo-ID: 4f54a3da-407b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748955880; x=1749560680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=He6rdsQGJzXm42/cfMSDjAoJdTiTVdxbtR5Bhkdesuw=;
        b=jyc9GU3pW9ItWF21MmrFmlveeZ2xvNnFlLqXEiYhEbGq6jvAnHi8bPRMV50B+RZPp+
         DLX7vHVwUgI+Y8xDdkjfT3jmAQ3ETAfHM5NnHpSY86x5+JwkIf6Ggx6sV+mRqlHDM/fF
         UkMdLLmqpSG5YPkCpvBmyQR/Bp/Du1mKlp86Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748955880; x=1749560680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He6rdsQGJzXm42/cfMSDjAoJdTiTVdxbtR5Bhkdesuw=;
        b=VLN17AGJkBBEYqPCDEfzbXCbBufrasI7cAmw+k/q5Dbh3I0IjF2cuK5K7s/fvr9mKa
         MDGYD4idgUoAg3gb6bX8f+X3/UnN0aX16Q2wXH1t3+hklVPD/wvGSJr5DvVSiZCl5nsE
         X3LVl7qYlbZnR1bv88EFEE2fz/gnmZWJZ63dju5yqAzcWmQUaa0ZvvP+eEPcbtQqacu0
         lPm4SPlB9pxHuIKdhiVIzIZCCxh6U3adw18G2QwDIr8+WPNeg2MT2PiXXQrejC/EEcMj
         BNcx0oDKw63YlPbquUvFIaM4BTgcrerw1F++qT0Z1vPZJSmdlI/nvw/YGg777ubYaAcf
         S31w==
X-Forwarded-Encrypted: i=1; AJvYcCUHIP6hOlEkf1PF/Y7WpByPG4JebWLs+eGGlVyt6iJTq3arxquGzRoiwv01AN1JzkpH5YDnDNWGrHA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyL6S4OV06pPonTmPQntyBpUurFk2ZthUGTkhJlIRCZlxEfso0y
	TFX6UKgKw4O0PrLq/d0npbSWisQ2H9a39+PiOtt/WOltXPoFL0OL+BIiWdVJ0zR8oh4=
X-Gm-Gg: ASbGncs7ZNFHLAHnJLGuG9mLU09g6bXuDBiyKraNAtcc1DkTtctMHgq/AR56H+MJepp
	T+9Wt/MgCRQiwI1+D0EDI8pMbZWvfKV4CBmrQqJ6I/rGD6QCGRud4kQrKFw5hhohws+9LQ9pUod
	P2MasHEKodaSfn2vQCPAClubzuAkmrpMdFOPstUzlS088YpCFdWQ7lMwR07KrstamkOGOhrexow
	v1gsiMh9sxhrWNwAMCAohtaxrG78ZnudCy8m3ogvLMuJn3vppgcNrgtT1o6xSFHpM082yRLWDHi
	tqViGceC3tiwz/aag5izDRS2oL8x7kdX5bW5yLL0jY/BdNnAY/iH/p8QQxJUsYGPa2FHdTvAo9P
	CaR8IoPjSCaNJ7zgVvxnOjfVIqto=
X-Google-Smtp-Source: AGHT+IHZ3aXE7UbbQwOONxvPgqMjjzIUBxo14087QCQZk7Dmd9j8UaKPtZPn5I0S4VzeTP2PT002jw==
X-Received: by 2002:a05:600c:871b:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-450d65306dfmr157962995e9.14.1748955879802;
        Tue, 03 Jun 2025 06:04:39 -0700 (PDT)
Message-ID: <1800c6aa-b3de-418b-967f-d7e7de932fe4@citrix.com>
Date: Tue, 3 Jun 2025 14:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/9] CI: Use CDATA avoid the need to escape tests
 outputs
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-8-anthony@xenproject.org>
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
In-Reply-To: <20250603124222.52057-8-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> index 695ed77e46..852c1cfbcf 100755
> --- a/automation/scripts/run-tools-tests
> +++ b/automation/scripts/run-tools-tests
> @@ -25,9 +25,9 @@ for f in "$1"/*; do
>          echo "FAILED: $f"
>          failed+=" $f"
>          printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
> -        # TODO: could use xml escaping... but current tests seems to
> -        # produce sane output
> +        printf '<![CDATA[' >> "$xml_out"
>          cat /tmp/out >> "$xml_out"
> +        printf ']]>' >> "$xml_out"

I think you want a \n on this printf.

I'd also suggest leaving a TODO for "escape ]]> if necessary".

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

