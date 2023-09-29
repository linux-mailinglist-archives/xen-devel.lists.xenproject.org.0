Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90827B3A08
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 20:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610662.950135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmIFM-00046k-C2; Fri, 29 Sep 2023 18:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610662.950135; Fri, 29 Sep 2023 18:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmIFM-00044G-8t; Fri, 29 Sep 2023 18:29:52 +0000
Received: by outflank-mailman (input) for mailman id 610662;
 Fri, 29 Sep 2023 18:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fe2t=FN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qmIFK-00044A-SQ
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 18:29:50 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c591893-5ef6-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 20:29:49 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32615eaa312so589324f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Sep 2023 11:29:49 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4642000000b00317e77106dbsm21995538wrs.48.2023.09.29.11.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 11:29:48 -0700 (PDT)
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
X-Inumbo-ID: 2c591893-5ef6-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696012189; x=1696616989; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AEa7As8/xtsWqegGei6A5Tb7gDmWHgxkdZMeYqU9Hhw=;
        b=TveDoswcSlR6IcIfqvsBG4iFFCzzqBvhobGrtTeRFtO6UWr/SzBfhHdc8PZPONEOO8
         gqPydJne+3cx1IiTb1cWCBtybDnfhQ1lhekLuauLyHYxS8nJk8jAWmsVI9og9MytMPD7
         8OCvcD5FhQnPbs6TMqGaEAO9CiffyrfJDtrhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696012189; x=1696616989;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEa7As8/xtsWqegGei6A5Tb7gDmWHgxkdZMeYqU9Hhw=;
        b=GRDyev05khYlksJoYv+GZZtFpAlp0K6POtr4PYqBAyhdZeqL/FW0e7hkC1mkWGl/pa
         JpemXJi2+si4cB/EX66KRiKbZaCU2v6XHHyPXAPQ4AUXt2iq8XeDYK0sRbffVh3FQ3P0
         ug6wvlvz0uuuXsNGojFdfwJp6ebbhAVEM1OLP44mqB8qvg0d6MY81B4clx3rgQxVZbXE
         W2lyw6kjuj/t9aFX7BUw7twMjl9y0waUrtjF9Q+IHXlwQ77ULrG+cWH8PyEzGdqCGoQX
         BGe8+TASdjsOXsbFSmBhYXhN37lJG3eYHREJkt+Ier0qOO34vhRtOfwHEkH0mDPlFUn3
         8kwg==
X-Gm-Message-State: AOJu0YzQ6ZWMqkSCNZgMCUUL81QxaRs4ZlUZwNHigHMt4kRlqg1RMsoA
	7DNmqCNcOfEFE2RD4uLgYn6nGxxlLyxjL5VGFwc=
X-Google-Smtp-Source: AGHT+IE2BF0lpgwgfaaaSu1aNeA1stGgTGNY7hmwUqvq7w6VvkOW+a2Scmg6d5KsqdYpEYy7KDunBQ==
X-Received: by 2002:a5d:5610:0:b0:319:6d91:28bf with SMTP id l16-20020a5d5610000000b003196d9128bfmr4173592wrv.60.1696012188908;
        Fri, 29 Sep 2023 11:29:48 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------M0arufweOvb06m7RsghkJaY9"
Message-ID: <0ef3fd80-e6bf-46e2-8f2e-a349d8528cef@citrix.com>
Date: Fri, 29 Sep 2023 19:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen/ppc: Add .text.exceptions section for exception
 vectors
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
References: <cover.1695942864.git.sanastasio@raptorengineering.com>
 <de5b99d79671a7fe11c5720797aaa6e3207661d1.1695942864.git.sanastasio@raptorengineering.com>
 <dc966303-6b94-4b82-8b66-4c55bc325449@citrix.com>
 <1c54864c-e2c2-56eb-1b42-6013d9e609e1@raptorengineering.com>
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
In-Reply-To: <1c54864c-e2c2-56eb-1b42-6013d9e609e1@raptorengineering.com>

This is a multi-part message in MIME format.
--------------M0arufweOvb06m7RsghkJaY9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2023 7:15 pm, Shawn Anastasio wrote:
> On 9/29/23 4:28 AM, Andrew Cooper wrote:
>> As I said for patch 1, we're now at 4.18-rc1.   Does this need to be
>> included now, or wait for 4.19?  There's something to be said for having
>> a basic exception handler, but it is technically a new feature...
>>
> I don't think there's any pressing need to bring this into 4.18, unless
> the burden of doing so is trivial.

Ok, in which case lets not complicate 4.18 with this.

Shortly I'll start up my usual xen-next branch to hold okay'd content
for 4.19, but the patches can sit on mailing list in the short term.

Thanks,

~Andrew
--------------M0arufweOvb06m7RsghkJaY9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 29/09/2023 7:15 pm, Shawn Anastasio
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:1c54864c-e2c2-56eb-1b42-6013d9e609e1@raptorengineering.com">
      <pre class="moz-quote-pre" wrap="">On 9/29/23 4:28 AM, Andrew Cooper wrote:<span
      style="white-space: pre-wrap">
</span></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As I said for patch 1, we're now at 4.18-rc1.   Does this need to be
included now, or wait for 4.19?  There's something to be said for having
a basic exception handler, but it is technically a new feature...

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't think there's any pressing need to bring this into 4.18, unless
the burden of doing so is trivial.</pre>
    </blockquote>
    <br>
    Ok, in which case lets not complicate 4.18 with this.<br>
    <br>
    Shortly I'll start up my usual xen-next branch to hold okay'd
    content for 4.19, but the patches can sit on mailing list in the
    short term.<br>
    <br>
    Thanks,<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------M0arufweOvb06m7RsghkJaY9--

