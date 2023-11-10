Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490F77E8555
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 23:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630821.983962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Zkg-0002VR-8v; Fri, 10 Nov 2023 22:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630821.983962; Fri, 10 Nov 2023 22:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Zkg-0002Ss-4O; Fri, 10 Nov 2023 22:13:22 +0000
Received: by outflank-mailman (input) for mailman id 630821;
 Fri, 10 Nov 2023 22:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK6u=GX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r1Zkf-0002Sm-HH
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 22:13:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a48c3e6-8016-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 23:13:19 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40a4859b231so5323315e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 14:13:19 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b004094d4292aesm530809wmq.18.2023.11.10.14.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 14:13:18 -0800 (PST)
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
X-Inumbo-ID: 5a48c3e6-8016-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699654398; x=1700259198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EM6gouvi/9+cJS403KfZBLMwqeRdBs6ofp44nFKKCp0=;
        b=NghGfwlC0QirMnglk5b+CjWFaWJvSLwnYAMoJnSBqfrA9uFjNLZSbK99Na32nNeLGS
         FFZtgylgGQgaGtzht4xnzD27eldvZ4YyaXKTAY/lQ70nv4bcBSFUw8UCXefIb3SlfTus
         ozqMlwLuCnd81Ve4apb86viMSSvGsquCHM0s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699654398; x=1700259198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EM6gouvi/9+cJS403KfZBLMwqeRdBs6ofp44nFKKCp0=;
        b=vbjhWL+kB3gE8MwUSl0ZzehooGtExRzTixFFV89ukQLPkf//g7q3nFp+ffuIS3v/md
         jhyNlrr8he+CxzLPnAhwECyljXO9F5ppMs2CZ8PYnY2asBDRXc+o2eVNCPBqhmtgma1z
         /WRUIw7N+n+J6LThZ2777o/1WcfcxdV+1+2mV/gBQdjKwBJX27+NSlqxeFpDWd+kArXy
         YwRPnxeZJXxcoXyOU1a1xbwZB4Q8wCZM7OaJUnPY91bxUf2edSHBJeYT79BB4VO+VmPA
         xU4LgjObSN8CPvR7hbtwNNTbWW75Vnaj9s16i7GVwSx5v2BtROlNS8DcUJ/XBtHdCB+4
         q9xQ==
X-Gm-Message-State: AOJu0YwuJ5NG32sCr+Q4o3OQ47+DfCgAwIpPfZoPVecnpVVK2PZNnOOw
	r6+KW3hN506viO0zYg08GQeyiw==
X-Google-Smtp-Source: AGHT+IHao1u+iWBG6kN+o2PKMIdg6mpEQFFYuzL7X+93GHzjXP64yJ0JBt4E8JWqLPCP88lC4eLGRg==
X-Received: by 2002:a05:600c:4715:b0:405:1ba2:4fcb with SMTP id v21-20020a05600c471500b004051ba24fcbmr472911wmo.16.1699654398261;
        Fri, 10 Nov 2023 14:13:18 -0800 (PST)
Message-ID: <a162733f-859f-41ce-8575-89b0e2cf702e@citrix.com>
Date: Fri, 10 Nov 2023 22:13:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] docs: Delete kconfig docs to fix licensing
 violation
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231108143751.49309-1-andrew.cooper3@citrix.com>
 <a6f54856-f0e2-a2ef-5cbc-900ed87c5d31@suse.com>
 <alpine.DEB.2.22.394.2311091558380.3478774@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311091558380.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/11/2023 11:59 pm, Stefano Stabellini wrote:
> On Thu, 9 Nov 2023, Jan Beulich wrote:
>> On 08.11.2023 15:37, Andrew Cooper wrote:
>>> These 3 Kconfig docs were imported from Linux erroneously.  They are
>>> GPL-2.0-only in Linux, but have no SPDX tag and were placed in such a way to
>>> be included by the blanket statement saying that all RST files are CC-BY-4.0.
>>>
>>> We should not be carrying a shadow copy of these docs.  They aren't even wired
>>> into our Sphinx docs, and anyone wanting to refer to Kconfig docs is going to
>>> look at the Linux docs anyway.  These, and more docs can be found at:
>>>
>>>   https://www.kernel.org/doc/html/latest/kbuild/
>>>
>>> which also have corrections vs the snapshot we took.
>> Imo this reference ...
>>
>>> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: George Dunlap <George.Dunlap@citrix.com>
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Henry Wang <Henry.Wang@arm.com>
>>> ---
>>>  docs/misc/kconfig-language.rst       | 701 ---------------------------
>>>  docs/misc/kconfig-macro-language.rst | 247 ----------
>>>  docs/misc/kconfig.rst                | 304 ------------
>>>  3 files changed, 1252 deletions(-)
>>>  delete mode 100644 docs/misc/kconfig-language.rst
>>>  delete mode 100644 docs/misc/kconfig-macro-language.rst
>>>  delete mode 100644 docs/misc/kconfig.rst
>> ... wants putting into, say, the last of these three files you delete, as
>> a replacement. I can't spot any other place where we would have such a
>> reference.
>>
>> One problem I see with deleting our shadow copy is that by referring to
>> Linux'es doc, the wrong impression may arise that whatever new features
>> they invent we also support. Thoughts? (If nothing else, I'd expect this
>> aspect to be mentioned / justified in the description.)
> I think the ideal solution would be to replace the shadow copies with a
> link to the Linux docs of a specific Linux tag (v5.4), instead of
> generic Linux master. I am not sure where to place the links though.

I don't personally think we need to keep any other reference around. 
They're not interesting, because they're not going to be found by anyone
except those who already know they're there, and won't need to refer to
them for the kind of content they provide.

Kconfig isn't a fast-moving target, and there's nothing new in Linux vs
what we've got here.  The only interesting difference between us and
Linux is the fact we don't use modules, and we didn't even strip that
out of the shadow copy.

We do have xen/tools/kconfig/README.source which states where it came from.

I could be persuaded to add the following hunk.  What we have isn't
precisely v5.4 anyway - we've got some reasonable differences in the
makefile side of things.

~Andrew

diff --git a/xen/tools/kconfig/README.source
b/xen/tools/kconfig/README.source
index 44631f68e8..ac394106b9 100644
--- a/xen/tools/kconfig/README.source
+++ b/xen/tools/kconfig/README.source
@@ -5,5 +5,7 @@ in this part of the Xen source tree.
 
 xen/tools/kconfig
 -----------------
-The kconfig directory was originally imported from the linux kernel
-git tree at kernel/git/torvalds/linux.git, path: scripts/kconfig
+The kconfig directory was originally imported from the Linux kernel
+git tree at kernel/git/torvalds/linux.git, path: scripts/kconfig of
+roughly v5.4.  Linux's documentation can be found at:
+https://www.kernel.org/doc/html/latest/kbuild/


