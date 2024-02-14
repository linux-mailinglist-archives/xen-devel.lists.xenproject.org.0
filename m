Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4188546DF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 11:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680350.1058473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCEb-0003vf-4F; Wed, 14 Feb 2024 10:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680350.1058473; Wed, 14 Feb 2024 10:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCEb-0003t8-0e; Wed, 14 Feb 2024 10:11:21 +0000
Received: by outflank-mailman (input) for mailman id 680350;
 Wed, 14 Feb 2024 10:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Sn1=JX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1raCEZ-0003t2-OI
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 10:11:19 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6524e94b-cb21-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 11:11:18 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a3d5181b3a7so50866866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 02:11:18 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 xa4-20020a170907b9c400b00a3d669a2055sm3100ejc.88.2024.02.14.02.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 02:11:17 -0800 (PST)
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
X-Inumbo-ID: 6524e94b-cb21-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707905478; x=1708510278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttnhX1vyDb1plETASpPah46BfJRyMiz9hrM2P7CaeCM=;
        b=RICXzomta55cEyb6zJFJ4WeF7edSddCQMdH59flILy1Hwfk06eRLfwhUEw9zzCi8WK
         Q9TcEjcGxfwjLXEG4+T7wJrVwbVT9sSYZqG+OyCMI6k+sE7IP6wgR5geKwiosTZNdOZl
         EoOLa0WfDcSC2Tjow+fMkb/lFk/I1qGSBy56I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707905478; x=1708510278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttnhX1vyDb1plETASpPah46BfJRyMiz9hrM2P7CaeCM=;
        b=g+3Lde6+nERI5JcvfL7D5EwnKUGox+4Efb1puKlPPMCvAystxsv3oOhkzSeHvvlukW
         m68Uy5mtIHJnWO64Z5pJWchtmCE4EF1SW9ZoRUODZVwrRi1K19pN9GXTuKgawRcNnhlv
         wyFh13X6w0eOkMCToQJvSMXXkgXzpYLxgw/Ilrz44mx7vJQLhEIQv/YUPsdjKzrqRyEl
         G53hIx0bWxkssFsDNf+eiXeHSMcvZOwJCTVROk5JFHOOJTRE8ARMvOPaA/POQ/Dwpw/L
         vQmBQxyugm4TgjIA1dZIk0KFa/Jy1AdbBFhvmzZUl7Sn+nyDrPCIdhKoqi6UcDXarOhd
         1vRw==
X-Forwarded-Encrypted: i=1; AJvYcCUecL6JDVqaNpJXqoIG96RRDCuvbwQto8eaPr0SQIj/v2Pyl3UabYXV0fObK7ESothKTiZ4Qa9PfFIuNJhtTEFUTDjfskUH8LGiiswa7Xk=
X-Gm-Message-State: AOJu0YwMUHnyI9I48oyK3fzUpgsNMm0ZhszavL1T3x0B9qSdMna0aQy4
	OixGjxSWkHGvo2cgdyvPVAn5KoOOTUkwg84NZAG/WMCxMfsqLm4amIo75cYTG1w=
X-Google-Smtp-Source: AGHT+IE37UagxXXvcmh1o1MD2lFSW3g3hwZe/7We13S26Nj0bRk7PcIZKX2lBOut/8Evqnyu0OmRlg==
X-Received: by 2002:a17:906:ce2b:b0:a38:5b3c:7c9b with SMTP id sd11-20020a170906ce2b00b00a385b3c7c9bmr1396476ejb.18.1707905478199;
        Wed, 14 Feb 2024 02:11:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXo81/8DafWu+PSgb3Xs9IgEMAhwMPB3lvphudh2aKegwdEknXsXUsG5hgKpoHyR6ml+qN3PNWFdQpdjYmJwXopJHiFnvUtn1gOlPYqDlgWcgr2/EB+2xD9GJGvkLnOXm6v
Message-ID: <863655b7-c889-4b7c-bb21-3d93b28b7ef8@citrix.com>
Date: Wed, 14 Feb 2024 10:11:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Re: [PATCH v2 2/2] iommu/vt-d: switch to common RMRR
 checker
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-3-roger.pau@citrix.com>
 <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
 <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
 <37ed1abe-afcc-4a76-8a86-623282ca37a3@suse.com> <Zcx9w5eZkXiN9s66@macbook>
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
In-Reply-To: <Zcx9w5eZkXiN9s66@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2024 8:45 am, Roger Pau Monné wrote:
> I've found it:
>
>     for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )
>
> Should be:
>
>     for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )

Coverity did end up spotting this.

> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
>
>
> ** CID 1592056:  Incorrect expression  (USELESS_CALL)
>
>
> ________________________________________________________________________________________________________
> *** CID 1592056:  Incorrect expression  (USELESS_CALL)
> /xen/drivers/passthrough/x86/iommu.c: 807 in iommu_unity_region_ok()
> 801             return true;
> 802     
> 803         printk(XENLOG_WARNING
> 804                "%s: [%#" PRI_mfn " ,%#" PRI_mfn "] is not (entirely) in reserved memory\n",
> 805                prefix, mfn_x(start), mfn_x(end));
> 806     
>>>>     CID 1592056:  Incorrect expression  (USELESS_CALL)
>>>>     Calling "mfn_add(addr, 1UL)" is only useful for its return value, which is ignored.
> 807         for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )
> 808         {
> 809             unsigned int type = page_get_ram_type(addr);
> 810     
> 811             if ( type == RAM_TYPE_UNKNOWN )
> 812             {


~Andrew

