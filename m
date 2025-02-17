Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C0A38DDE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 22:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890889.1300015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk8N2-00037V-Tg; Mon, 17 Feb 2025 21:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890889.1300015; Mon, 17 Feb 2025 21:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk8N2-00034x-QJ; Mon, 17 Feb 2025 21:09:40 +0000
Received: by outflank-mailman (input) for mailman id 890889;
 Mon, 17 Feb 2025 21:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk8N2-00034r-6S
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 21:09:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eaa87bd-ed73-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 22:09:37 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso10099115e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 13:09:37 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43987d1865asm31598475e9.3.2025.02.17.13.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 13:09:36 -0800 (PST)
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
X-Inumbo-ID: 7eaa87bd-ed73-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739826577; x=1740431377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2713HVB0qWFNrm01J25JcoWI9WWlQdl+i4qJirQwMqI=;
        b=nYKQ+V9ZS43Epxd6EsdSIRZCvZjQR/shK7Ax3vCSX5p5i/ZmMz8W/UZvFsMJQ8qj3T
         GORTtcYgcpfKa8UlbOYbWa8KNwOFAHMSAgh+iosT/xctvMWfGhQpRHjN5enj6fqBCFhX
         1V2nqw/plkOrSHdQUA1Kd9Iu+q5kueUvQYQlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739826577; x=1740431377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2713HVB0qWFNrm01J25JcoWI9WWlQdl+i4qJirQwMqI=;
        b=DkWBvrB8nU7/uUVZLJYqtLhT6yoGaTG/6T3MW391zPlnJgfLdt51GoHh0PFDCutibB
         EsyXpyt9rgIuWQdvK/FRpNyAy6kMIGpnL+KdbhrTUrRasoaIPGmWJCx6oSZcnNrjRfjm
         1kGZRSHHNtrGkWzPLKsH4NZyLU+46VuGwVTcoGRWl1hesl9Jz6i/6BaQDISAUJvjzqYJ
         OFZxRu12GlzMms0hrjdbsGwvJ79b0e7arSZ8PhJ70VmRZhTpC3yzhjh2ssc1PY+fsjqt
         AWI3DCulyBOzRZeabkoxDprI+3D0BxNRcQQ51KfAJE4GjKjHn59Y79rQGpl1bbZ51H0/
         GHoA==
X-Forwarded-Encrypted: i=1; AJvYcCUk7bUgXWip0Bmt9D6hYJAaPteh6WCVfDL0pSqvDJL2M3e4J3wX4abyETVi3cdII6eqQ0Na/o8AEbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnhoRaEIetdY7ZDZLEtFNLCuhWIXHSmHW2t0d46VgLky0LK8RG
	bbvitLsRk/fEYsyF+PNeyO9ep7Rhx9bbHGF8gVfLWGt2AJOrlk3wey2ES4baz1U=
X-Gm-Gg: ASbGncvbka+LNNlzLGeRqNL61Cob3WnhaYnzr/jE6zdSEeYQv0dBUg6Odu0xloazR2A
	tL4HgIK9Zd6/q2AntMxwoPTxdbcKBhcw5ulGmVdzVoCrA7D+52aFFE66ZnLpJD0CqcRcGTioPh9
	4XMxn30PxkgsK/iuL2x0SuStH3vyu1dfqpeod0cxDSz+BxfsA6rE26PO/+3qeQCkxU03mmqiJzI
	9owemKY25wuFtewZHYFeG66X7dcQZpvY4x+DLwwZcTmSL9CcPcVBjcyqAhkoYHZzfoV59ivmSdW
	6V00y5JXPvOGQ9y97Ljt4c5+9HiQHlbU4Lu2Ulb666rAbmMCK3W3VyM=
X-Google-Smtp-Source: AGHT+IE4CLpqLhXw7EstfHQW1eY5QNwKfZYZ4W/r8pr12swk5yH4Yp3DfNRCmanwnPix8jOaPvdnBg==
X-Received: by 2002:a05:600c:190f:b0:439:554f:f64f with SMTP id 5b1f17b1804b1-4396e5b9f88mr137622305e9.0.1739826576908;
        Mon, 17 Feb 2025 13:09:36 -0800 (PST)
Message-ID: <3fe4cb88-4fcc-4860-af6e-75907f72f282@citrix.com>
Date: Mon, 17 Feb 2025 21:09:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/resource: Verify that Xen can deal with invalid
 resource type
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250217204822.136437-1-olekstysh@gmail.com>
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
In-Reply-To: <20250217204822.136437-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2025 8:48 pm, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> The sign of the presence of a corresponding bugfix is an error
> returned on querying the size of an unknown for Xen resource type.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Refer https://patchew.org/Xen/20250217102741.4122367-1-olekstysh@gmail.com/
> Current patch should go in with Xen fix from the link above.
>
> 1. w/ fix in Xen:
>
> + ./tests/resource/test-resource
> XENMEM_acquire_resource tests
> Test x86 PV
>   Created d1
>   Test grant table
> (XEN) [    8.702293] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 1 to 32 frames
> (XEN) [    8.704499] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 32 to 40 frames
> Test x86 PVH
>   Created d2
>   Test grant table
> (XEN) [    8.717210] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 1 to 32 frames
> (XEN) [    8.719477] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 32 to 40 frames
>  [ ok ]
>  [ ok ]
> Welcome to Alpine Linux 3.18
> Kernel 6.1.19 on an x86_64 (/dev/hvc0)
>
> 2. w/o fix in Xen:
>
> + ./tests/resource/test-resource
> XENMEM_acquire_resource tests
> Test x86 PV(XEN) [    9.839691] common/grant_table.c:1909:d0v0 Expanding d0 grant table from 1 to 2 frames
>   Created d1
>   Test grant table
> (XEN) [    9.846621] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 1 to 32 frames
> (XEN) [    9.848796] common/grant_table.c:1909:d0v1 Expanding d1 grant table from 32 to 40 frames
>     Fail: Expected error on an invalid resource type, got success
> Test x86 PVH
>   Created d2
>   Test grant table
> (XEN) [    9.865235] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 1 to 32 frames
> (XEN) [    9.867403] common/grant_table.c:1909:d0v1 Expanding d2 grant table from 32 to 40 frames
>     Fail: Expected error on an invalid resource type, got success
>  *   Execution of "/etc/local.d/xen.start" failed.
>  [ !! ]
>  [ !! ]
> Welcome to Alpine Linux 3.18
> Kernel 6.1.19 on an x86_64 (/dev/hvc0)
> ---
> ---
>  tools/tests/resource/test-resource.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
> index 1b10be16a6..3f5479cf78 100644
> --- a/tools/tests/resource/test-resource.c
> +++ b/tools/tests/resource/test-resource.c
> @@ -123,6 +123,17 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
>          fail("    Fail: Managed to map gnttab v2 status frames in v1 mode\n");
>          xenforeignmemory_unmap_resource(fh, res);
>      }
> +
> +    /*
> +     * While at it, verify that an attempt to query the size of an unknown
> +     * for Xen resource type fails.

"If this check starts failing, you've find the right place to test your
addition to the Acquire Resource infrastructure."

Or something suitable.  There needs to be a hint of why 3 was picked
here, and part of this sentence will show up in the context of the patch
bumping 3 to 4, which also helps remind reviewers to ask if a change
isn't somewhere in the submitted series.

Anyway, LGTM now.

Personally, I'd merge this into the bugfix patch.  This improved test
wants backporting along with the fix, and the end result is still only 3
hunks.

Then, I'd suggest posting the combined result for-4.20 (cc Oleksii). 
It's not a major bug, but it's also a very simple and low risk fix too.

~Andrew

> +     */
> +    rc = xenforeignmemory_resource_size(
> +        fh, domid, 3, 0, &size);

P.S.  Now it's simple, fold this back into 1 line.  It causes an extra
line of the comment to be visible in context.

