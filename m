Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3457EBE3245
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 13:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144481.1477872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9MQU-0007kj-UQ; Thu, 16 Oct 2025 11:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144481.1477872; Thu, 16 Oct 2025 11:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9MQU-0007ig-RR; Thu, 16 Oct 2025 11:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1144481;
 Thu, 16 Oct 2025 11:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCbN=4Z=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v9MQT-0007iY-En
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 11:45:45 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a634b2f3-aa85-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 13:45:44 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so7153865e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 04:45:44 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cd833ebsm19427425e9.3.2025.10.16.04.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 04:45:43 -0700 (PDT)
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
X-Inumbo-ID: a634b2f3-aa85-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760615144; x=1761219944; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QBSVAVuQOjviGf6IDJyd5Pj0bW/bQ+trKuyvDHY/wj8=;
        b=IHWRYbyhx8jRf8zqN+inbnQfGqDPyDB6CVd6tA7m98dHo3T03KhQ2F89CudeWYnufX
         7Fm4SzIZTjqRgLGuxMbMQ2gG+quisyGvws0Ez2zAUVFO0L1C1Q+BiFQGNlf+zdXk7U2G
         iXSM3+KB7cuXCLcTr4bOfel325Bee3TbsEQv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760615144; x=1761219944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBSVAVuQOjviGf6IDJyd5Pj0bW/bQ+trKuyvDHY/wj8=;
        b=hfpDH3I9IncqaHPdAmb5+BCfcV8GRqrGwcIn27jyZ9PwhYZ8Celw0/8ufF3AaMtiTm
         RfMwq+kAxjfv56IDoQbXb2gYQDhfdfLlQJgO1aLt5Rx7sFFFO2AquX+8Iu52Fho84+b0
         vtyD6vIBbZMD9EiiWPMRcT0A4gdhM34P29bQRL5x9ga9g0SQycuHJchaCu76vEUhqFJD
         LfqGwWpC0Z3RLwViSGhFscBYZsI9NIbdapEtf2bCCibNofgqBj5G1MCakb9DutHjce8i
         hI6DAe+Nv0NjwVJz8eWK0ZPn04KSmdnw/MkZcV5HvRf9PE9lMpuBrFdtF59ZUBNWSdbv
         xovw==
X-Forwarded-Encrypted: i=1; AJvYcCVoFFYE5jXCmcUe0lyBvMK3CSCRrVLSdK/2r1RCFS3ozEPApPGHN59W9jCrtwjWLgn4r0ZIQavcF4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhvSNmF8RqZgNvEdCww5hepukElo4shoR2NobnauQIqDYmFLXq
	uVcFieQqTp15e3JYWtHCaUJUQQ+2vk6qhgvUfP8ZPssD7F5B3pc+7ByCxkTecB9VCkM=
X-Gm-Gg: ASbGnctHG7njTseXrLL/61eYW5mdh88iIHZ5Ts0R5T+9nSX99LVuz0LtQUyj0WHqbVb
	VURqTC8HtP7rgPVGK3+D6Vd4thUCZEloMTb+3OFOcS4v8Y5Bwc0f9mu0NSs2A+6fCg/pz5azC29
	xkOxuIJLgvz/DzEPe8qOil9XvnIwwtvuNVer35rMAKLjw5weYOTQ5Tn6B4oqSKLm3MihBCb6Na5
	U/liS6ZkZDjIhSi6HVQuyE46mCmE3oDW/wRrjkLtfT3xJKPyNX9HRFwfe9bsK32VfzOBwuCNWHW
	RKbCRA65aYrkaG6CrdXAcBc2A4/FWClRGkCqtbuZ7P0nUyFO21P1t1uH8Bx2Jb6uqHXqPVUFME/
	mLFQ7bJs508IE3iIYdD+53IHU3tM1LHLCXuEry7qwEEbgifq9IxPQq/IfrQPI6i1lfREATZJOFL
	suSY9rp8FOqjXYzvpgXzh2cRWeHu/+Us+bY89S3c5JwXB1b69W
X-Google-Smtp-Source: AGHT+IE9BWmmykwORLn0e4KXPEWPxgSZa511j85Carbf0L/Jf0mqRZiGVRYUcNuNYgZsfc4OQmZrDw==
X-Received: by 2002:a05:600c:c110:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-46fb42ee4d2mr133439275e9.41.1760615143965;
        Thu, 16 Oct 2025 04:45:43 -0700 (PDT)
Message-ID: <ce0bc10e-cef2-4c74-9fd2-9301416754b1@citrix.com>
Date: Thu, 16 Oct 2025 12:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] libxl: make gentypes.py compatible with Python
 older than 3.9
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>
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
In-Reply-To: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/10/2025 12:22 pm, Jan Beulich wrote:
> removeprefix() was added only in 3.9. As long as the "jso_sub_" prefix is
> always going to be there anyway, switch to a less specific but more
> compatible construct.
>
> Fixes: f6c6f2679d49 ("libxl: libxl__object_to_json() to json-c")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Sadly this is only the tip of the iceberg. Some minimum version of the
> json-c library is apparently needed for the toolstack to build, but no
> minimum version is being checked for.

Well, this is why we have release candidates, and a bug queue.

>
> --- a/tools/libs/light/gentypes.py
> +++ b/tools/libs/light/gentypes.py
> @@ -384,7 +384,7 @@ def libxl_C_type_gen_jso(ty, v, indent =
>          s += "int rc;\n"
>          sub_scope_object = "jso_sub_1"
>      else:
> -        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
> +        sub_scope_object = "jso_sub_%d" % (1+int(scope_object[8:]))

This isn't quite an equivalent change.  You want:

def removeprefix(s, p): # Py < 3.9 compat
    if s.startswith(p):
        return s[len(p):]
    return s

at the top level somewhere, and to call removeprefix(scope_object,
"jso_sub_") here.

Sadly, because string is a builtin type, you can't make the 3.9 syntax
work on older versions of python by extending the string type.

~Andrew

