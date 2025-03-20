Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C63A6A344
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921576.1325389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvClU-0000cA-1G; Thu, 20 Mar 2025 10:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921576.1325389; Thu, 20 Mar 2025 10:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvClT-0000Za-Tj; Thu, 20 Mar 2025 10:04:39 +0000
Received: by outflank-mailman (input) for mailman id 921576;
 Thu, 20 Mar 2025 10:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvClS-0000ZU-Nk
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:04:38 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb5babdb-0572-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 11:04:37 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso3585025e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 03:04:37 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdac9dsm43203145e9.30.2025.03.20.03.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 03:04:36 -0700 (PDT)
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
X-Inumbo-ID: bb5babdb-0572-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742465077; x=1743069877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DZjhMmUwEuFM8ZmT/IkTPn3WpSv12KT6at7YyYmJ9oQ=;
        b=rJ7dpZGPJVw2N8EDVl8pqhFg8xKM8yIAzsVCn8jhVUd7cZu7XeDX5GN9p8WCFR3LNF
         M/v7WHkOvv/PJlrAI+nk0xfvRR0b5GqZsTDlrKGD1RrYFjPKJcnE67FxgK1NhFXrTFLK
         wYjdzjWeEUinnrbV96HThlzYZUbE9dmSYy6Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742465077; x=1743069877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZjhMmUwEuFM8ZmT/IkTPn3WpSv12KT6at7YyYmJ9oQ=;
        b=fve6aN99Q7WEQlx/yXOwsYaBa4ot1MRF75YSJPBHQH6ZMB5/Z9AE2MZdUW/c3qphRt
         EvkPC8XGOMowV2MVJpKEKzUixqiI9z95I/bKJhsJkMMSWON9YI8L2N4L2Fnl/GcWyEyH
         /MK9kb5zglCa4D5gWS2n+k3JBx33/tRETm1IRU7p5JgOohdfAoOINHTiHF7/Q0o3K9RR
         ob08dhGjZwMpUFnYC7k5mkgeqQegXIXmAAWLKbIjoYdPHexzp7aSpk2AdK617JbRM/9+
         H/6yaPIfV9Xj289aQu/dJNocuzWvtf/VnPYdyeBEpEIZ9r9pkIaKsypAAdQr2EVvCqt7
         RX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgN5UnFlL8dzyXQU7HPOa0InohmT/icCRd0Q9wP/hhs+fy7Re01xMSitqAweHQq/gBl3YiL3qU3V4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUL9pZ68yMuR4FKSKuP2t2pZcpqesvID2ki+f5WHOmvFu5U3jK
	vGdTov5oLIS0zK1Pwb99ojcAYZscG5ewnR5G/yPQd9ATDkgdpF0L/StC6WSz4Oc=
X-Gm-Gg: ASbGncvgvxDoUNe82CEOrHUtdn8owGJU3aIqmEB+5o3ZAnSLgayjalT90d/Cx5awoQx
	043cqOgBeBR1RQgJn8D9h50UPkBHN3rXwDRf5SgoNiGOg3IMlHYLuoY/RVjP5iFGXCUuGBxk/cm
	/GLnavnJZDqFeq2i+9mBypcLmNzq92TfOSzqCmnShBTlvBOgk8C1pFdw4JdPFz+nojDEVeYjJUz
	D8b//lvu19MhyDaG0/2rrpASKpNf6Cv9sDsTWiZXwI3gLGVqdHLHOm2TWNCB5RUmbWi1X+kiHTI
	Pt6+cwc3nWzNLHm6ndd3o6AxvBYg2XvqVPvuGzOoV5VhDdRYLVzn0Do62mm7MpoXVRbxrKZu8WR
	tMvNt/EQmJA==
X-Google-Smtp-Source: AGHT+IG8RoE4NzqY2SX1/7cRGFZi7Dl3e9en3/b/TYgthzKum1hLK6zWg0SOCgxbwjk9EcPh7m5LJQ==
X-Received: by 2002:a05:600c:1f83:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-43d4383d55bmr49151295e9.26.1742465077112;
        Thu, 20 Mar 2025 03:04:37 -0700 (PDT)
Message-ID: <fb1351f3-5f47-44de-b722-07497a8c32e4@citrix.com>
Date: Thu, 20 Mar 2025 10:04:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/PVH: don't open-code elf_round_up()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <577ddc98-fdbb-48af-9c7e-1a411383516b@suse.com>
 <b1b94660-da2f-48ad-a1b6-10cb52e559f6@suse.com>
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
In-Reply-To: <b1b94660-da2f-48ad-a1b6-10cb52e559f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2025 9:28 am, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was wondering whether in elf_round_up() itself we might better use
> ROUNDUP().

I did wonder that too.  It's probably easier to arrange now we've got
xen-tools/common-macros.h.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

