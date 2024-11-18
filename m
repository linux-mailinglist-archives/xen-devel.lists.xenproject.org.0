Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98B9D1ABF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 22:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839561.1255350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD9V7-00059r-M0; Mon, 18 Nov 2024 21:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839561.1255350; Mon, 18 Nov 2024 21:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD9V7-000589-Ix; Mon, 18 Nov 2024 21:41:41 +0000
Received: by outflank-mailman (input) for mailman id 839561;
 Mon, 18 Nov 2024 21:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUlN=SN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tD9V6-000583-JV
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 21:41:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e30449b2-a5f5-11ef-a0c9-8be0dac302b0;
 Mon, 18 Nov 2024 22:41:36 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so29944815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 13:41:36 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da265ca8sm172725655e9.14.2024.11.18.13.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 13:41:34 -0800 (PST)
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
X-Inumbo-ID: e30449b2-a5f5-11ef-a0c9-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzYiLCJoZWxvIjoibWFpbC13bTEteDMzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUzMDQ0OWIyLWE1ZjUtMTFlZi1hMGM5LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTY2MDk2Ljc5OTI5NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731966095; x=1732570895; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nONolnJzn0IQ4ZuzliJB/6msxh9WiWjFljy9G8rVIsQ=;
        b=aSoj9N9y6HADlW3sAcY/4N+U4H0sbDQWQwJwnbRnsUzyrSy0jJCeufhZMkJ3EVPnTg
         C8GzMkRmYI4793N2LRp/v4SHRW8+o30v22qR/AkZ/arubJZLk1z3bFhzmWt2xDUXKnmX
         H4/EFJU+URNllnCYOV47oiFpCmcWyCyTFiYAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731966095; x=1732570895;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nONolnJzn0IQ4ZuzliJB/6msxh9WiWjFljy9G8rVIsQ=;
        b=HC85UlF7lj8Hn0Ae081A8YL5+TSYvEYHOmq0MmpKUkl8iCZrscI7S9VgOu5ZbtlOk8
         TyyrNTSFilx7w7+DH+y7hu9lSD0rDXU4brh9WfgDAf0EUxM6e3NkIfs+Ido3vuHCuutQ
         g5hYC6r1MCzerRVQe9xF8qBBYYXKYZWGRPWXw8IJ1JN4cal7b4kQ6qRnwb/Wg8v6laVs
         svLBIXvhB1DktHGjgDaOZxLk3Bny+FmJBdDpwA6nNbrKcCB+igS4eVhN4XRhQMadQx+6
         SsaEQXNuZzEg9mh6xyyK9xG8HS6Vt3KaygL2kmnGwq04OIrwagOHxjVqxdF8yPnU6GWG
         55dQ==
X-Gm-Message-State: AOJu0YxlR0wqDzcFBed04XPmIhk2+B8vzEjRidG2T1GPPJDAuEFF7eH6
	lBfzGz12NmZhFUUBIDPxYAbIRpsG39asAmS8XHvp0LDJvkGfVuCluX6EXGW7VrHeij0SCOFKMoc
	f
X-Google-Smtp-Source: AGHT+IEPpazDcTqaQbiZnVjGWG3kHMYDsAtxLhGzXRvIAMZ8Rnr6wJ8JsplG7vBCt8gJuxFJ5oL67Q==
X-Received: by 2002:a05:600c:4f10:b0:431:5194:1687 with SMTP id 5b1f17b1804b1-432df74da89mr114405635e9.18.1731966095293;
        Mon, 18 Nov 2024 13:41:35 -0800 (PST)
Message-ID: <4de83f5b-5fde-44a9-8943-b1bb3f41d2e3@citrix.com>
Date: Mon, 18 Nov 2024 21:41:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: x86: Declarations for compat_set_{cx,px}_pminfo()
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Eclair reports Rule 8.4 violations for these two.  They're real
violations, but fixing them is proving challenging.

Because of how x86_64/platform_hypercall.c sets up some defines and
includes ../platform_hypercall.c, the declarations of
compat_set_{cx,px}_pminfo() of pmstat.h become compat ones.

Therefore the real hypercall handler does see a correct declaration.

However, the implementation in cpufreq.c does not get the compat-ified
version of pmstat.h, so misses the declaration and thus the violation.

Worse however is the fact that cpufreq.c depends on not having the:

#define xen_processor_performance compat_processor_performance

in scope while it's transforming between the two formats, meaning we
can't simply reuse pmstat.h with suitable defines.

Any clever ideas for how to untangle this mess, before I go for the
brute force approach of an #if COMPAT section in the main hypercall handler?

~Andrew

