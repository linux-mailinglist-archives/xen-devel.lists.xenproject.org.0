Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD80A0B896
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 14:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870577.1281741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXKm0-0002Gp-W3; Mon, 13 Jan 2025 13:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870577.1281741; Mon, 13 Jan 2025 13:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXKm0-0002F6-Sp; Mon, 13 Jan 2025 13:46:32 +0000
Received: by outflank-mailman (input) for mailman id 870577;
 Mon, 13 Jan 2025 13:46:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+JSt=UF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXKlz-0002F0-7l
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 13:46:31 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca5399b9-d1b4-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 14:46:29 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so616048066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2025 05:46:29 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9060c00sm503595766b.41.2025.01.13.05.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 05:46:28 -0800 (PST)
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
X-Inumbo-ID: ca5399b9-d1b4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736775988; x=1737380788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/y5rd0Puue2VupoayGh0HYUm9mRYlH6OktBkuFN9j2w=;
        b=iuU7p0AqnrzVIuMduUDUeSKkQVHLdxx49eissvvjMkqfbNdio/g1U7yJDq/yvr4AdP
         53CQ3+TMSLu4U0J+xdZXmVBs8R2o5Wmf4S/h1LzzX56xKSrAL4SLK7UHdzqx2sCnKc5l
         OaXnwFTXZi9L14hPag53TvNWjtpUi6bkHN6FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736775988; x=1737380788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y5rd0Puue2VupoayGh0HYUm9mRYlH6OktBkuFN9j2w=;
        b=oJUHON2wkY+5JhpyrKaBGOcUZg77lznjGnPcNmp8enbJB/jDG/QcLVvI/2U9otZatI
         jO+FmOwuSvW3medoESumecPD7s1AY3enBzGXfIW7SRk7I0QpQt+imfZGSVRPJ3/PZ17t
         NfU0agPgF1hU202UekJDLMVKp2TIhg/fNSAm+w6nHNUOYeo2gixQNSMcowMVLVJ+ngO3
         RXNvBtPPylQrx2YJV/k95CeVXftGXN35O1L9IReOlPDl6Y9EIPjz4Nf91X+O33ji3d7L
         hM8LmotauYkIR6P514KeppVHg4qZyRr0A5ynzdfvpiDO0++nOIeAI47dDo1qPo8IDbqU
         4gIg==
X-Forwarded-Encrypted: i=1; AJvYcCXFrwdndobLX5eVtPyhHu8UIjttc7g3dh9KUcfme0jh81WwgkvEMQZQiD4I3tuAqw3sP6TkXp/xN9k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/v4AvE2YK5o7lSgYQDPZi2MhhWpWawB2JN9QkUfuU2wMyvYce
	OYvVSpNlXBi7EG2VlG5ydmOLY6JZzOquoZiiKgC/e5IGF+jfs/CmT3ftORaQRVD00iJBZTxQkBr
	V
X-Gm-Gg: ASbGncvWVI0qIk0eA/iWMEOF9M9tzAY+knM7lX0wcSaY3Gnwc3njs2YhAHXncCSPXho
	3u+uy2ovp+8qUwijBAEnn0LE5DfFTs1rV5pfMmu2IZO/exPmorO7sycjL4gUI7bzRWCfpUcqwQ2
	oSyJ9aVgXNYdiwDl3MeKA2CYZTljzd3WAPR/p1+Kcrcza6Et/I40bMHgAVD8VaSsTGv7PCIuDX7
	D8B3vDkYLEPK5DmLeL9HDZ+7YfFzQMjv6OcjB0tSCP+/kx8SbfktzBTm/i5EbAaM5c=
X-Google-Smtp-Source: AGHT+IHcn/gZ+61WcMlBT8a9x8xBfwbaJBfza/5ugV/kSkENJRXIKSBEB6+vI++lx8hLWNsN6SC2pg==
X-Received: by 2002:a05:6402:354a:b0:5d2:7396:b0ed with SMTP id 4fb4d7f45d1cf-5d972e0e3abmr45025233a12.14.1736775988514;
        Mon, 13 Jan 2025 05:46:28 -0800 (PST)
Message-ID: <e7cea505-a54e-4094-8335-31b426c485e9@citrix.com>
Date: Mon, 13 Jan 2025 13:46:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/5] docs: set DATE to SOURCE_DATE_EPOCH if available
To: Maximilian Engelhardt <maxi@daemonizer.de>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1735585600.git.maxi@daemonizer.de>
 <25f9fabf-1239-4465-92c9-484fc24fc4f7@citrix.com>
 <2637960.Lt9SDvczpP@localhost> <23136765.EfDdHjke4D@localhost>
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
In-Reply-To: <23136765.EfDdHjke4D@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/01/2025 7:03 pm, Maximilian Engelhardt wrote:
> On Montag, 30. Dezember 2024 23:28:42 CET Maximilian Engelhardt wrote:
>> On Montag, 30. Dezember 2024 22:38:24 CET Andrew Cooper wrote:
>>> On 30/12/2024 9:00 pm, Maximilian Engelhardt wrote:
>>>> Use the solution described in [1] to replace the call to the 'date'
>>>> command with a version that uses SOURCE_DATE_EPOCH if available. This
>>>> is needed for reproducible builds.
>>>>
>>>> The -d "@..." syntax was introduced in GNU date about 2005 (but only
>>>> added to the docuemntation in 2011), so I assume a version supporting
>>>> this syntax is available, if SOURCE_DATE_EPOCH is defined. If
>>>> SOURCE_DATE_EPOCH is not defined, nothing changes with respect to the
>>>> current behavior.
>>>>
>>>> [1] https://reproducible-builds.org/docs/source-date-epoch/
>>>>
>>>> Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
>>>> ---
>>>>
>>>>  docs/Makefile | 8 +++++++-
>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/docs/Makefile b/docs/Makefile
>>>> index b30cc619f8..beba02a94f 100644
>>>> --- a/docs/Makefile
>>>> +++ b/docs/Makefile
>>>> @@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
>>>>
>>>>  -include $(XEN_ROOT)/config/Docs.mk
>>>>  
>>>>  VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-
> directory
>>>>  xenversion)>
>>>>
>>>> -DATE		:= $(shell date +%Y-%m-%d)
>>>> +
>>>> +DATE_FMT	:= +%Y-%m-%d
>>>> +ifdef SOURCE_DATE_EPOCH
>>>> +DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)"
>>>> 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)"
>>>> 2>/dev/null || date -u "$(DATE_FMT)") +else
>>>> +DATE		:= $(shell date "$(DATE_FMT)")
>>>> +endif
>>>>
>>>>  DOC_ARCHES      := arm x86_32 x86_64
>>>>  MAN_SECTIONS    := 1 5 7 8
>>> While this looks fine for docs, there's another (identical) use of date
>>> in tools/firmware/hvmloader/Makefile, as well as some differing uses to
>>> construct XEN_BUILD_{DATE,TIME}.  INSTALL talks about VGABIOS_REL_DATE
>>> too.
>>>
>>> Does something like this work for you?  It seems to DTRT for SMBIOS.  It
>>> needs adapting a bit more for vgabios and Xen, but I think having one
>>> common $(date) is going to be better than ad-hoc ones over the tree.
>>>
>>> ~Andrew
>> Hi Andrew,
>>
>> Thanks for your quick reply. Your patch looks fine to me. You can add my
>> Tested-by.
>>
>> We currently use "export XEN_BUILD_{DATE,TIME}=...", "export
>> SMBIOS_REL_DATE=..." and "export VGABIOS_REL_DATE=..." for building xen in
>> Debian, so we did not run into reproducibility problems with these. But
>> having them combined to all use SOURCE_DATE_EPOCH if available sounds like
>> a good idea and would also benefit other downstream users.
>>
>> Maxi
> Hi Andrew,
>
> I extended your patch to also cover the other uses of date. Please check if 
> this look reasonable as I'm not an expert in makefiles. It seems to DTRT in 
> the cases I tested.
>
> What I changed compared to your patch:
>
> * Add LC_ALL=C to all date commands. This was also missing in my original 
> patch, but I think it's a good thing to do and XEN_BUILD_{DATE,TIME} already 
> do it.
>
> * Change the quoting to allow calling the date command without any additional 
> (formatting) arguments.
>
> * Add an include of Config.mk to tools/firmware/vgabios/Makefile and moved the 
> definition of XEN_BUILD_{DATE,TIME} further down in xen/Makefile to have the 
> newly defined date wrapper available.
>
> Does this look reasonable or are there parts that should be done differently?

That looks good to me.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

