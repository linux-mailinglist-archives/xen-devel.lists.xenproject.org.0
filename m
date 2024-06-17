Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43490ACC2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 13:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742226.1148981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJAO2-0000po-7K; Mon, 17 Jun 2024 11:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742226.1148981; Mon, 17 Jun 2024 11:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJAO2-0000o2-3F; Mon, 17 Jun 2024 11:18:58 +0000
Received: by outflank-mailman (input) for mailman id 742226;
 Mon, 17 Jun 2024 11:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJAO0-0000nw-BZ
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 11:18:56 +0000
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [2607:f8b0:4864:20::a2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61200927-2c9b-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 13:18:54 +0200 (CEST)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4ed0b3c6a76so1210536e0c.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 04:18:54 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc02e72sm420421485a.96.2024.06.17.04.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:18:52 -0700 (PDT)
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
X-Inumbo-ID: 61200927-2c9b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718623133; x=1719227933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aD/kHSHDd1AmHQBBqxIXCmE4l2MuaIQ5nOaIbQOtiMU=;
        b=ggSMDROCp6jUnbf3ULjBzZruTcTQPLCJT7zon/sLllBSIW3RGGvBtEavFA4Amky+qf
         DCLXx9n0VPgZtaTDTvzDZcs0ArDzBP9lAU4ClOljcb0M48Z2O7j7HnNuGrIsU71RRLDI
         A6fCiFQbGdlrfTXaQKp9ZIJtvvpCwesUjDSIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718623133; x=1719227933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aD/kHSHDd1AmHQBBqxIXCmE4l2MuaIQ5nOaIbQOtiMU=;
        b=LxuTEQ/Q82eGYiQaJDAeEkq90rC8/G+Fve8EOgbcYnNitcVIZPRS9eNDWN/RTCxxQe
         5uoLFBHuWtioYRf5jU7kl5QmVuUsqH2tfy5V0cXG3ltqxQd7O3EN6jAJ/5sBDKsZK3Dw
         nLL5OxpqGb8D9G0o3Brrroc43cas6YhR+wklxKPxIfAqd+Q7gnhCTUKqP8uRpv34gX94
         D4p6TOF20DDkz3UGHlKPzTHBi30hPs2QUYatjsIPw8assheocMR2fNSFotwapgbZZH5O
         PqgNkSvhljzxmL9/tN1tjaV9+IIkj3bebL7UqlmhWO7bIB3d8Dv0Hh3i3o+R/4kgHM9M
         zAFg==
X-Forwarded-Encrypted: i=1; AJvYcCXiLlWcyCw14CLjavmKvUB2Uk47Ugv8EvhLWrJgzw2I5CWvq6D90258+TfebQ2DVQVSppeT9G+guVY4uqX3gru4lDo5KTITm/dqR01Jess=
X-Gm-Message-State: AOJu0Ywc29XlOoQE02ucvuURvYYJMYBfRbr371bWPDtuttssUZsn4jGA
	hxfHFhoUsWS4qxBk+W/eb4GthqkcOl7ck3FBvx9aeb/I9nwJqoTpqCUaaAUVCME=
X-Google-Smtp-Source: AGHT+IGqQGKg93phNICfTYyaI/i8v/ia8Qu0b/LtSpc/0xgA82aGOkgtYqxlG6z59o1AoEbTTG6Vtg==
X-Received: by 2002:a05:6122:310d:b0:4e4:e9db:6b10 with SMTP id 71dfb90a1353d-4ee3db8b0f0mr8755637e0c.2.1718623132710;
        Mon, 17 Jun 2024 04:18:52 -0700 (PDT)
Message-ID: <5746769a-6868-48ed-a58b-f8f75f17965a@citrix.com>
Date: Mon, 17 Jun 2024 12:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: for_each_set_bit() clean-up (API RFC)
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <46abec6c-ebe9-4426-865e-5513107949be@citrix.com>
 <5e2b6c55-8d6d-4153-8632-a6608cd41012@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5e2b6c55-8d6d-4153-8632-a6608cd41012@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/06/2024 10:54 am, Jan Beulich wrote:
> On 14.06.2024 19:07, Andrew Cooper wrote:
>> More fallout from looking at the code generation...
>>
>> for_each_set_bit() forces it's bitmap parameter out into memory.  For an
>> arbitrary sized bitmap, this is fine - and likely preferable as it's an
>> in-memory to begin with.
>>
>> However, more than half the current users of for_each_set_bit() are
>> operating over an single int/long, and this too is spilled to the
>> stack.  Worse, x86 seems to be the only architecture which (tries, but
>> not very well) to optimise find_{first,next}_bit() for GPR-sized
>> quantities, meaning that for_each_set_bit() hides 2 backing function calls.
>>
>> The ARM (v)GIC code in particular suffers horribly because of this.
>>
>> We also have several interesting opencoded forms:
>> * evtchn_check_pollers() is a (preprocessor identical) opencoding.
>> * hvm_emulate_writeback() is equivalent.
>> * for_each_vp() exists just to hardcode a constant and swap the other
>> two parameters.
>>
>> and several others forms which I think could be expressed more cleanly
>> as for_each_set_bit().
> I agree.
>
>> We also have the while()/ffs() forms which are "just" for_each_set_bit()
>> and some even manage to not spill their main variable to memory.
>>
>>
>> I want to get to a position where there is one clear API to use, and
>> that the compiler will handle nicely.  Xen's code generation will
>> definitely improve as a consequence.
>>
>>
>> Sadly, transforming the ideal while()/ffs() form into a for() loop is a
>> bit tricky.  This works:
>>
>> for ( unsigned int v = (val), (bit);
>>       v;
>>       v &= v - 1 )
>> if ( 1 )
>> {
>>     (bit) = ffs(v) - 1;
>>     goto body;
>> }
>> else
>>     body:
>>
>> which is a C metaprogramming trick borrowed from PuTTY to make:
>>
>> for_each_BLAH ( bit, val )
>> {
>>     // nice loop body
>> }
>>
>> work, while having the ffs() calculated logically within the loop body.
> What's wrong with
>
> #define for_each_set_bit(iter, val) \
>     for ( unsigned int v_ = (val), iter; \
>           v_ && ((iter) = ffs(v_) - 1, true); \
>           v_ &= v_ - 1 )
>
> ? I'll admit though that it's likely a matter of taste which one is
> "uglier". Yet I'd be in favor of avoiding the scope trickery.

Oh, of course.

FWIW, Frediano pointed out a form without the goto, but this is better
still.

It's certainly less bad than having to also explain the metaprogramming
to get scope working nicely.


>> The first issue I expect people to have with the above is the raw 'body'
>> label, although with a macro that can be fixed using body_ ## __COUNTER__.
>>
>> A full example is https://godbolt.org/z/oMGfah696 although a real
>> example in Xen is going to have to be variadic for at least ffs() and
>> ffsl().
> How would variadic-ness help with this? Unless we play some type
> trickery (like typeof((val) + 0U), thus yielding at least an unsigned,
> but an unsigned long if the incoming value is such, followed by a
> compile-time conditional operator to select between ffs() and ffsl()),
> I don't think we'd get away with just a single construct for both the
> int and long (for Arm32: long long) cases.

Ideally we want _Generic() but we can't have that yet.

In lieu of that, I was thinking a chain of __builtin_choose_expr()
instantiating variants for int/long/long-long.

The complication is that we need a double for() loop for the
long/long-long in order to declare the iterator as strictly unsigned
int.Without this, a CLTQ gets emitted to extend the result of the ffs*()
call. This https://godbolt.org/z/Px88EWdPb ought to do. I'll probably
end up expressing that as __for_each_set_bit() taking in a type derived
from typeof(), and an ffs*() variant to use.
>> Now, from an API point of view, it would be lovely if we could make a
>> single for_each_set_bit() which covers both cases, and while I can
>> distinguish the two forms by whether there are 2 or 3 args,
> With the 3-argument form specifying the number of bits in the 3rd arg?
> I'd fear such mixed uses may end up confusing.
>
>> I expect
>> MISRA is going to have a fit at that.  Also there's a difference based
>> on the scope of 'bit' and also whether modifications to 'val' in the
>> loop body take effect on the loop condition (they don't because a copy
>> is taken).
>>
>> So I expect everyone is going to want a new API to use here.  But what
>> to call it?
>>
>> More than half of the callers in Xen really want the GPR form, so we
>> could introduce a new bitmap_for_each_set_bit(), move all the callers
>> over, then introduce a "new" for_each_set_bit() which is only of the GPR
>> form.
>>
>> Or does anyone want to suggest an alternative name?
> I'd be okay-ish with those, maybe with slight shortening to bitmap_for_each()
> or bitmap_for_each_set().

Lets go with bitmap_for_each().  While we've got some examples looking
for the first clear bit, I don't believe we've got any examples wanting
to loop over all clear bits.

Are you happy repurposing for_each_set_bit() to be a 2-argument macro
operating strictly on a single GPR?

~Andrew

