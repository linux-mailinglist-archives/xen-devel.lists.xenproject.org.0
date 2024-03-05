Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF79871FBF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 14:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688795.1073403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhURO-0002aZ-OD; Tue, 05 Mar 2024 13:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688795.1073403; Tue, 05 Mar 2024 13:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhURO-0002Ye-KP; Tue, 05 Mar 2024 13:02:42 +0000
Received: by outflank-mailman (input) for mailman id 688795;
 Tue, 05 Mar 2024 13:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5t=KL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhURN-0002YY-JS
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 13:02:41 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a558eacc-daf0-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 14:02:39 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so7743247a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 05:02:39 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dh18-20020a0564021d3200b0056760e830f0sm1885747edb.81.2024.03.05.05.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 05:02:37 -0800 (PST)
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
X-Inumbo-ID: a558eacc-daf0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709643758; x=1710248558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBWja+jM2d0PGuZam/o/TZhJWcnGuUdDP0aqZXCvB7w=;
        b=fjxNlQirDWMoP9UPRJBoyDvZIfQunu/vokZXC6gULzTO4P75rnS3/UdQjBBaDTRQ7T
         g1qX76nLSCDpUo9rwU/cTb/SYRY5WMS7v6nzE+spWsG/0qDeP2d5Iqci9pbxhsY2rwJ+
         mVGKSH+IYFNNDZOLaaFqyACjJzYJuCSIMAhB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709643758; x=1710248558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBWja+jM2d0PGuZam/o/TZhJWcnGuUdDP0aqZXCvB7w=;
        b=bJ6WCCHRQVw76ckSsnSN0jvVUUeYmgu7ilP9s6y5EwmOZESWZDvH15SaWb9uuEdnR8
         RlHWTfAcZ1efSosGW4xWmBZUIzUrXjxUc8wYKle1H4yUVluI3Zog4yVbzP7JN3/n+Zqe
         XhwbBoYzi9ZHsNUypp1AWo9HBBUo+QKRbGa4DtZBiBnUDiMTiWi4SZPDTnvBszp4ULdf
         OlCe0ETSRco/mNEpQlSVMVzHQ8PizWF6S24YxVPg55UeN9TiPvfmq8865TrS4juAUan3
         C8lw85Kh5NFzbWnXKcFdHaZ80gbT2FytZNyhOwqxvS/weIiip20sXVHY0vd5ig2NQ0LR
         9PYA==
X-Gm-Message-State: AOJu0YwV9ySgJ5hn6wsXqd2XJn7A9kkIZTFbjWpcvFT3+NzEzBE/gq+M
	RaVbxhYYHIApDamwfy6dU1jLgELK2oNUHvgp5dOFy81KLnSPEKkWMQPIZlZMjdZZvRjq8sxnC/b
	1
X-Google-Smtp-Source: AGHT+IHwEAbtsWzs7Nw2LWvks57AuuQAxw30sQuhzDI7Zp9gSu33Uk64+dnnm+lg6cxzllouDH/mRQ==
X-Received: by 2002:a50:85c6:0:b0:565:9fff:6046 with SMTP id q6-20020a5085c6000000b005659fff6046mr9471361edh.3.1709643758148;
        Tue, 05 Mar 2024 05:02:38 -0800 (PST)
Message-ID: <d6448913-8f22-40ee-b703-4d154906eab7@citrix.com>
Date: Tue, 5 Mar 2024 13:02:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/livepatch: Relax permissions on rodata too
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240305121121.3527944-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2024 12:11 pm, Andrew Cooper wrote:
> diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> index d2efe9e11492..f45812483b8e 100644
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -91,9 +91,15 @@ void relax_virtual_region_perms(void)
>  
>      rcu_read_lock(&rcu_virtual_region_lock);
>      list_for_each_entry_rcu( region, &virtual_region_list, list )
> +    {
>          modify_xen_mappings_lite((unsigned long)region->text_start,
>                                   PAGE_ALIGN((unsigned long)region->text_end),
>                                   PAGE_HYPERVISOR_RWX);
> +        if ( region->rodata_start )
> +            modify_xen_mappings_lite((unsigned long)region->rodata_start,
> +                                     ROUNDUP((unsigned long)region->rodata_end, PAGE_SIZE),

I missed the final refresh to turn this to PAGE_ALIGN().  Fixed locally.

~Andrew

