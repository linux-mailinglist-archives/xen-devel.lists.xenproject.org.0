Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA234881194
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 13:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695889.1086147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmuv2-0006VB-97; Wed, 20 Mar 2024 12:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695889.1086147; Wed, 20 Mar 2024 12:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmuv2-0006T4-6S; Wed, 20 Mar 2024 12:19:44 +0000
Received: by outflank-mailman (input) for mailman id 695889;
 Wed, 20 Mar 2024 12:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoSn=K2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmuv0-0006Sy-Ay
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 12:19:42 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fc83bcb-e6b4-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 13:19:40 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-789e83637e0so294055885a.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 05:19:40 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j8-20020a37c248000000b00789e6cc73e6sm4987468qkm.48.2024.03.20.05.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 05:19:38 -0700 (PDT)
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
X-Inumbo-ID: 1fc83bcb-e6b4-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710937179; x=1711541979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0uERgRqE/pW0ekxHvJSU8DMKsA+1dq4drch8FXNrkDY=;
        b=hN4m0SqUVIr5ZmiP6f1VbkjwFNsp+gt1vDdLKSD3cPokl0xBKPVx6HdKum1XlJxqfO
         6Ap4SXUb+n5969BugEYq0q1nhsbkJB7a0J758GnayNjVAS0Kdtehd2+tp/vff4lc6POx
         SDeiY/pIdKBci+V67BEyV6UcYhQPBbGsY4dK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710937179; x=1711541979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uERgRqE/pW0ekxHvJSU8DMKsA+1dq4drch8FXNrkDY=;
        b=JF+wRNtY9Fr4Fr4F2wmfJZIzkd4EB64Ml8TThgTVOxesWRL5UAuc/PE8qe77xlGked
         E7fa7MwJ5gT5pQXUeutDmioxH+CwwMftPNU9rcQ9KFP77WZBnbeKak4vFxkWYD+IUVBc
         LmaSE+4HGTv9qPYcDPy4kDtilKT+jUOVPzDPC65t2OgS6H+ujHP+Uq7Xat5pccAwaGf8
         fFy66Yxa1ktjhLCqRNmEQy6qaR5EuT15U/ZIIikXLx8dAuDv0YZrBmA2b9ryeB/0aGyg
         k+bMjIIyZ1D65pQbgIbmqWDu65Opt7ci0pwqnd/oBiyGT9mIPwNJ8pT5ms4Oku1gNEuo
         1ipQ==
X-Gm-Message-State: AOJu0Yxe9BrcuTkgtpgUtnrV+8u+JWPEyzkmInh6fjA+I67f58VOTywG
	qhKZV2BwuzV4imKT+uEm1Xl8pTMsWXoC/E7UsZTFhsFdOInTHIzd7eYN5Nq3jR8=
X-Google-Smtp-Source: AGHT+IEcNUUrZgbjS8UTTfjq+0R1ojjrRFLdx1yqWSMjZNhZ8zR44I0PeZP2f6+aZZCZINGSUXuOtQ==
X-Received: by 2002:a05:620a:3b98:b0:78a:22ca:a31a with SMTP id ye24-20020a05620a3b9800b0078a22caa31amr1392679qkn.16.1710937179183;
        Wed, 20 Mar 2024 05:19:39 -0700 (PDT)
Message-ID: <19d9487e-67cf-4c1e-9dc6-419d9c5d0120@citrix.com>
Date: Wed, 20 Mar 2024 12:19:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] xen/credit2: Clean up trace handling
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-3-andrew.cooper3@citrix.com>
 <CA+zSX=b7X91bZZQcm=PvLbxeEofq12yNn2h+-Rb7WZESYmxPeA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=b7X91bZZQcm=PvLbxeEofq12yNn2h+-Rb7WZESYmxPeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2024 12:16 pm, George Dunlap wrote:
> On Mon, Mar 18, 2024 at 4:36 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> There is no need for bitfields anywhere - use more sensible types.  There is
>> also no need to cast 'd' to (unsigned char *) before passing it to a function
>> taking void *.  Switch to new trace_time() API.
>>
>> No functional change.
> Hey Andrew -- overall changes look great, thanks for doing this very
> detailed work.
>
> One issue here is that you've changed a number of signed values to
> unsigned values; for example:
>
>> @@ -1563,16 +1559,16 @@ static s_time_t tickle_score(const struct scheduler *ops, s_time_t now,
>>      if ( unlikely(tb_init_done) )
>>      {
>>          struct {
>> -            unsigned unit:16, dom:16;
>> -            int credit, score;
>> -        } d;
>> -        d.dom = cur->unit->domain->domain_id;
>> -        d.unit = cur->unit->unit_id;
>> -        d.credit = cur->credit;
>> -        d.score = score;
>> -        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1,
>> -                    sizeof(d),
>> -                    (unsigned char *)&d);
>> +            uint16_t unit, dom;
>> +            uint32_t credit, score;
> ...here you change `int` to `unit32_t`; but `credit` and `score` are
> both signed values, which may be negative.  There are a number of
> other similar instances.  In general, if there's a signed value, it
> was meant.

Oh - this is a consequence of being reviewed that way in earlier iterations.

If they really can hold negative numbers, they can become int32_t's. 
What's important is that they have a clearly-specified width.

~Andrew

