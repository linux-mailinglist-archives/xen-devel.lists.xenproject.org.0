Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0868F8A1F40
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 21:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704172.1100380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzq0-0004aE-Nw; Thu, 11 Apr 2024 19:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704172.1100380; Thu, 11 Apr 2024 19:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruzq0-0004Xm-Ky; Thu, 11 Apr 2024 19:11:56 +0000
Received: by outflank-mailman (input) for mailman id 704172;
 Thu, 11 Apr 2024 19:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruzpz-0004XV-Qx
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 19:11:55 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bbff3d1-f837-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 21:11:54 +0200 (CEST)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-23333dddd8aso179269fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 12:11:54 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vy19-20020a05620a491300b0078d7533e00fsm1391380qkn.36.2024.04.11.12.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 12:11:52 -0700 (PDT)
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
X-Inumbo-ID: 5bbff3d1-f837-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712862713; x=1713467513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R2BBMO1hdvxs2eysjAnLkz49a8Bv6XNr/LVgNQfBzHM=;
        b=DuoxpgT3d0cezmezEHzYW3xY4vY5obOHfLtQM+yLEcAFOolegcSrpbnJNrjmyrpSts
         B9PXDSE6/kARZLg1Jo9Cj3SB4I3cSN6FTq69TpBsxo3zK2mfHDerxmb8K3emWu07ho89
         LDKJ7Yfo2LhPJqTBe+6Dhh5vw9uFjyYHGuk/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712862713; x=1713467513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2BBMO1hdvxs2eysjAnLkz49a8Bv6XNr/LVgNQfBzHM=;
        b=kEL6l2xYh3ewZiH7+6+zuttDGTVvDJF4C7CYdBywixMJiupDXqBIQ5P4wTpFHry77k
         dnm2Rv5idEymAbPH6M+3yUumSl3c+Kfm061GvhIMswG/Ctn2Q+oUHpgQ0wGK/Gr8U+cN
         UekMijvJV/uV34gleIkiI2DRAtQ762Kxc7BIQPczvIBZUS3xvpGDPhOhTP/kcsT0IrWM
         5YwVRJio+gWlfmfFsayvqsejqigyzdXMWsGQ9giE3VgnQUp+gBhc5xyviH8lBh1stoPB
         8EjU2+hVHQZeF6w7A7okT48naNG6yZ+OcBnMZ14TgeoBXwyN2JRK+0rHOL6PNg85mb0k
         3Ygg==
X-Forwarded-Encrypted: i=1; AJvYcCUcv9w6KDU8dBu0Dw8aQXvBZCml5cqaEJB/T9vEXREvDm4VraCasd0f7Gpf0xAU82hThxx+6F+FMT19bkei2WPIBjKx8JDETynqWI6VjSw=
X-Gm-Message-State: AOJu0YxXVYM8HIGx24uKbw7qKynQEPVeSL78vscQoOFLRvzLpCshu9UX
	dD23f/Rm8i0DQr4V26z9XRI6T6ssyV7dq1OXTPL8DIyo5ePQFl6sEHb7Upvq7fk=
X-Google-Smtp-Source: AGHT+IFA9jwgV4JmwbPLgJ4m/maamhz3aN1SrfZzTqKLjOCwl/HsB0YrfwacKy076g1bNs/PJt1bow==
X-Received: by 2002:a05:6870:f10c:b0:22e:bd35:d3fb with SMTP id k12-20020a056870f10c00b0022ebd35d3fbmr499277oac.22.1712862713564;
        Thu, 11 Apr 2024 12:11:53 -0700 (PDT)
Message-ID: <382b8aaf-ea9f-42c7-b57b-945fa4fd36aa@citrix.com>
Date: Thu, 11 Apr 2024 20:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] gzip: clean up comments and fix code alignment
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-3-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240411152518.2995-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
> This commit cleans up the comments and fixes the code alignment using Xen
> coding style. This is done to make the code more legible before refactoring.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

I've found two more minor adjustments:

diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index feb6d51008aa..9205189d4618 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -375,7 +375,7 @@ static int __init huft_build(
     memzero(stk->c, sizeof(stk->c));
     p = b;  i = n;
     do {
-        Tracecv(*p, (stderr, (n-i >= ' ' && n-i <= '~' ? "%c %d\n" :
"0x%x %d\n"),
+        Tracecv(*p, (stderr, (n-i >= ' ' && n-i <= '~' ? "%c %d\n" :
"0x%x %d\n"),
                      n-i, *p));
         c[*p]++;                    /* assume all entries <= BMAX */
         p++;                      /* Can't combine with above line
(Solaris bug) */
@@ -563,7 +563,8 @@ static int __init huft_build(
     return ret;
 }
 
-/* Free the malloc'ed tables built by huft_build(), which makes a linked
+/*
+ * Free the malloc'ed tables built by huft_build(), which makes a linked
  * list of the tables it made, with the links in a dummy first entry of
  * each table.
  *


I can fold on commit.  (First hunk is trailing whitespace, which doesn't
show up so well on email).


However, there are some more major adjustments wanted too.

The reason why the code indention is so messed up is because it has been
auto-formatted, but with some NEXTBYTE()/NEEDBITS()/DUMPBITS() missing
semi-colons.  This throws off subsequent formatting, including some of
the indentation changes you've made.

Fixing the semicolons is a far more messy diff, but a much better end
result.

However, the PKZIP_BUG_WORKAROUND ifdefary hiding braces still throws
things off, this time in the opposite direction.  NOMEMCPY also gets in
the way.

I'd be tempted to suggest breaking out a patch earlier dropping these
two, and then doing the semicolon fixes in this one along with the other
work.

Thoughts?

~Andrew

