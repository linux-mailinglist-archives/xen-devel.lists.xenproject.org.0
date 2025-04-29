Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A51AA0F29
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 16:39:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972748.1361053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9m6q-0002vY-Gk; Tue, 29 Apr 2025 14:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972748.1361053; Tue, 29 Apr 2025 14:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9m6q-0002sS-Di; Tue, 29 Apr 2025 14:38:56 +0000
Received: by outflank-mailman (input) for mailman id 972748;
 Tue, 29 Apr 2025 14:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPhw=XP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9m6o-0002sM-Oc
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 14:38:54 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac57cf25-2507-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 16:38:53 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so51181815e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 07:38:53 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b0232267sm4173865e9.39.2025.04.29.07.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 07:38:52 -0700 (PDT)
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
X-Inumbo-ID: ac57cf25-2507-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745937533; x=1746542333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+bH2VtO965DApheflq6WJZVHbuWGpEGuuDOfcTC4myY=;
        b=KW6Cp10ke+1KinTDAWZf8JJK7gxsoxLGPUh/g7rXY5J2MuySHlV8rnm61HVrxMIYfi
         ngqHma7zLfnSR3s9ZJ02VLuseMEbxZAQUX5R2KE2RGzqYW1DYTWt9/8aWcTbcNwmOz6c
         0F9YEl/18xksPyqyG0BdhpHlhXNR8rb2b1OCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937533; x=1746542333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bH2VtO965DApheflq6WJZVHbuWGpEGuuDOfcTC4myY=;
        b=AJUnMKdBOmZ/K01NhzNgp/q4XcVmzfCTGofVffNwjwt2W39LoReWbsOYNiDlX5gU6v
         zg8HjUiyzh0ecH3kYbIPi4ozCXMxc3EHErKlwyRP1gNEiqPA5x/8AsfAv8L7ovOrE4c2
         +veBEHA2ZwTS/kJ69I5+IQlqiCLWf7OIwTLXA/T3ILEPXDKvZGsP1SzGRroMhqgrkEto
         jKzFnxt2fZZhp0gWa1vcLJ+V4hZeUk2PXXezUZmN9rGgBXNU5Vjipmh/Sa/cJWODLZfs
         0475pSk6DMjAJyJ7XVHVXsndERY4AV/0RYfRIPtViNfNg2XXVC3c9OAV7RwRTne+AjNT
         wl8A==
X-Forwarded-Encrypted: i=1; AJvYcCW1ooxvjVaGPYsZhY/yPitKWh9ZHeIcw1POq+G+9Srz7KP9f2pcaztn9heKrHJx3dBKL3RRlXvcCek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXsSFKhPEFftdeKvb1DWnufq5cmKvGSDNXtTa41OI9FZh91PHv
	8ESmJFFJ4MQDf3lcQad5uYhAB5b24ng9oHsNP2aM7J0TU11fTeGHy+7SKgqw7FU=
X-Gm-Gg: ASbGncuF9i4efjoQklHQBIUoRjqXuSXYz3lTndWTD3U9SpQ4izUwqHjK8Fzzm7KFRtl
	MMQMP4Ea56VmOVnUackvaBLnQTJTHJEE8Uh4txRhdeUBfj0bjT4M5HB/eUyI/iqBUiWJm1fxguf
	Ny8cb7+3YjZjQbgLWGHDXii5OKL7+D7fsmfAc11JmNufk6OzSWHqXNr1nmrUHAfp/0OZoPCdrhi
	YzMsroMq45dCzbL05+gj3RoENaNpGdd9zPJ3tb/nP7ux+4PuguR4XdcfXDzwFboKHVv7CR8zbdS
	RRR3fvh26gWZ0MYpHQwKBq8eoOtbOEiOqLF45OyqG/C/dm+AMfVhLEHX8gFonpB68BhUj8gXwop
	UFBXH9A==
X-Google-Smtp-Source: AGHT+IEz0M3YvmQrPHT1D/TQ+n1bkMRH0XKuCVufus5QpckGV8BdchYH4uo1PkS82FK1285Fo/Zw+Q==
X-Received: by 2002:a05:600c:4f8b:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-441acb20523mr29568085e9.8.1745937532997;
        Tue, 29 Apr 2025 07:38:52 -0700 (PDT)
Message-ID: <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
Date: Tue, 29 Apr 2025 15:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com>
 <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com>
 <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com>
 <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com>
 <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/04/2025 4:13 am, H. Peter Anvin wrote:
> On April 28, 2025 7:25:17 PM PDT, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 29/04/2025 3:00 am, H. Peter Anvin wrote:
>>> On April 28, 2025 5:12:13 PM PDT, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> On 28/04/2025 10:38 pm, H. Peter Anvin wrote:
>>>>> On April 28, 2025 9:14:45 AM PDT, Linus Torvalds <torvalds@linux-foundation.org> wrote:
>>>>>> On Mon, 28 Apr 2025 at 00:05, Ingo Molnar <mingo@kernel.org> wrote:
>>>>>>> And once we remove 486, I think we can do the optimization below to
>>>>>>> just assume the output doesn't get clobbered by BS*L in the zero-case,
>>>>>>> right?
>>>>>> We probably can't, because who knows what "Pentium" CPU's are out there.
>>>>>>
>>>>>> Or even if Pentium really does get it right. I doubt we have any
>>>>>> developers with an original Pentium around.
>>>>>>
>>>>>> So just leave the "we don't know what the CPU result is for zero"
>>>>>> unless we get some kind of official confirmation.
>>>>>>
>>>>>>          Linus
>>>>> If anyone knows for sure, it is probably Christian Ludloff. However, there was a *huge* tightening of the formal ISA when the i686 was introduced (family=6) and I really believe this was part of it.
>>>>>
>>>>> I also really don't trust that family=5 really means conforms to undocumented P5 behavior, e.g. for Quark.
>>>> https://www.sandpile.org/x86/flags.htm
>>>>
>>>> That's a lot of "can't even characterise the result" in the P5.
>>>>
>>>> Looking at P4 column, that is clearly what the latest SDM has
>>>> retroactively declared to be architectural.
>>>>
>>>> ~Andrew
>>> Yes, but it wasn't about flags here. 
>>>
>>> Now, question: can we just use __builtin_*() for these? I think gcc should always generate inline code for these on x86.
>> Yes it does generate inline code.  https://godbolt.org/z/M45oo5rqT
>>
>> GCC does it branchlessly, but cannot optimise based on context.
>>
>> Clang can optimise based on context, except the 0 case it seems.
>>
>> Moving to -march=i686 causes both GCC and Clang to switch to CMOV and
>> create branchless code, but is still GCC still can't optimise out the
>> CMOV based on context.
>>
>> ~Andrew
> Maybe a gcc bug report would be better than trying to hack around this in the kernel?

I tried that.  (The thread started as a question around
__builtin_constant_p() but did grow to cover __builtin_ffs().)

https://gcc.gnu.org/pipermail/gcc/2024-March/243465.html

~Andrew

