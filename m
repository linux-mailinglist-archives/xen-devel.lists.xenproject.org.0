Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDnmLhzuxGnN5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:28:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277AE331554
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263465.1555386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5g4O-0005ac-9O; Thu, 26 Mar 2026 08:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263465.1555386; Thu, 26 Mar 2026 08:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5g4O-0005Yo-6m; Thu, 26 Mar 2026 08:28:00 +0000
Received: by outflank-mailman (input) for mailman id 1263465;
 Thu, 26 Mar 2026 08:27:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5g4M-0005Yi-PC
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:27:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5g4M-003FZi-4c
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:27:58 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4ee09-5cb7-0a2a0a5109dd-0a2a450a864e-34
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:27:58 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4ee0d-1772-0a2a450a0019-d155802ec476-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:27:57 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486fe2024a9so5171155e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 01:27:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722d49c18sm14272485e9.14.2026.03.26.01.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 01:27:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774513677; x=1775118477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BGh+VegIMFtFjLOpSwyfOkMDimDxlBlonwHQUY/NTe4=;
        b=OzNR34btWqSboqFBkalD5ggHeb4T/5HKWZlKG8X/Ypr8wc8kfrKWkh+L9ecl24Han3
         axhmfF5BKs9O/oW/qdcllu1dIKOf+DYGzVnPa3FmgE6SBiRPHvnfqcBlp9FpnhrFCvil
         iMinKXfqyrDiJY2Bfw9PCSPdKTbmg16FkFfVCbFs5V9lHnEcoyxo7RCvOoQc0UM62GyC
         05Q6ERtSYDBC+UGDKv4whefWohjwzZw4XpFlM4wX08dUhuS8Jpzj2ZDRRh+9+Wlx0fex
         phNdO8+dWERljU+xzTvPci6unDaHUcOvmRMzmM/YfOo9wbxhX22Kif/84HDyjiprAnzy
         w2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513677; x=1775118477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGh+VegIMFtFjLOpSwyfOkMDimDxlBlonwHQUY/NTe4=;
        b=cOiJSpEduJWX1MwGmjDiD1Lu81JUWlV6UzAHxRS/Z5f3O8JfV01RskMoEV7LsXKKYE
         GBltpP+SWS/4/t+DgAeJvbbWOFxNWyVoHFPFGBILHv7grQMzrPoohDwQAtmy/0khiHSB
         ok+3ZduVZFh4+U9DqC6mb7uFtfsOSl75yJEU+zrurE1nbvVQ+Q51qGLibCw/bh+HZfI2
         oaQDB/duJzcnERQoi2ayVSwjzhnqpDfL/O8Os89WDkqCfrcuyQWxbSOkdsMsy4XgBcVH
         uIF+SJAujshbITGmymJqrikxUSt1Gf1oK+N1QESZuFoquDOOvmolDeBEWMSvRJvgVpP6
         towQ==
X-Gm-Message-State: AOJu0YycifaPPpPjc6yMadFb4sG4FT323CdLo/MNl+rV+Mns14XIT2TK
	AthFyBQiPPGMjzC+q1OCIAvVfeS1b6gzf3jV+TsoH5eD7gsd/3igtmN21mwSv0ykIzLzBOI1Bsg
	tYnp/gA==
X-Gm-Gg: ATEYQzzBxdwEghyoBy/kWxAWJafBYXeHKpAiYoNz2e8BaelEU8KbAFz1danpiw5MxnW
	SZjauQg045frnpcn8HWjs3P+hUt1w7dqsIk87FnGc2mk2SxtFUWECfFkbMmjH0flygJEZjKXcwC
	F3WFzQY7aAi5dld5h1zxZAOqW+hkO2T2wsP0c92aYX+h9t7tlvIJ9xmRl86+03PQT+wZK3XK2BT
	E2/fQBgTYv+01XSNch517QLhsTYgIJsMjMzqgy+6XPoAbQW4Ukz9mT1k9paPKtejYnMko0Chu7l
	41d4DaFod6wvLy78ZL6DPWZYclvoW4j2p/etYQOO1DOcDwh2O1tvcUIilcK6Sri5COf0fI7fa/h
	FkKWC5+iT0BWJePDvchawoKG20/HjxJlIqXRI0ZZOcCkaAq7rWE+4tvX83cXSMtX8L7ZOCsITa+
	sUd5fIXbUCjfUJaJ893fKIY3s1xr/e5X89p4+jc7UK4V70KR67aRR9VApR3JH44MGXaOWFv0xvx
	sHJ8L28oc4Ot3Y=
X-Received: by 2002:a05:600c:484a:b0:487:1fbf:e0a1 with SMTP id 5b1f17b1804b1-4871fbfe189mr14672745e9.4.1774513677166;
        Thu, 26 Mar 2026 01:27:57 -0700 (PDT)
Message-ID: <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
Date: Thu, 26 Mar 2026 09:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <aPzBO_eW8mQHM66u@mail-itl> <acQzzlXNDxNq885V@mail-itl>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <acQzzlXNDxNq885V@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774513677-5389A900-4A15B4DD/0/0
X-purgate-type: clean
X-purgate-size: 3864
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 277AE331554
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 20:13, Marek Marczykowski-Górecki wrote:
> On Sat, Oct 25, 2025 at 02:23:23PM +0200, Marek Marczykowski-Górecki wrote:
>> Hi,
>>
>> After updating from Xen 4.17 to 4.19 it appears that I have some
>> performance issues if system was suspended before. For now this is just
>> vague observation, as I don't have much data yet.
>>
>> Generally, the user observable effect is that audio playback (over
>> Qubes's PV audio thing) becomes very choppy, beyond usefulness (cannot
>> make audio calls anymore, music/video playback also becomes useless with
>> some players. For me this suggests some increased latency in scheduling
>> - maybe some timer fires too late?
>>
>> This doesn't happen always, but I'd say quite often after S3, sometimes
>> may need two or three suspend cycles to trigger the issue. But it's
>> possible it is also some other factor, like which pCPU the VM gets
>> scheduled on, maybe? But for now I didn't hit this issue before
>> performing any S3. I don't have a reliable reproducer yet.
>>
>> While I write it's related to 4.17 -> 4.19 update, there is also slight
>> possibility it's related to hardware change (CFL -> MTL). But, it's
>> unlikely, since I'd probably get much more bug reports about that (the
>> stable Qubes version uses 4.17, and we have many users on MTL).
>>
>> What would be the method to collect some useful debugging info? Some
>> debug-keys (r? a?), some cmdline options?
> 
> In the meantime (sharing some of it on Matrix already), I managed to
> build a much more isolated test. Specifically, a single PVH domU with
> VLC, preloading 1s of audio (and not playing it really, the output is
> set to a file). The specific command is:
> 
>     VLC_VERBOSE=3 vlc -I cli -A afile --no-loop --play-and-exit --run-time 1   ./melodigne-quiz-blind-test-187140.mp3
> 
> The domU rootfs (or rather: initramfs) is based on AppImage of VLC,
> there is not much more inside, and the above command is called as part
> of init script (and domU is terminated shortly after).
> 
> There is no persistent state in the test, the whole thing is network
> booted from the same base. The only things changing between runs is xen
> binary + toolstack.
> 
> In the output I'm looking for this line: main input debug: Stream buffering done (1018 ms in 2 ms)
> 
> Before S3 it takes 0-2ms, sometimes (rarely) 10ms (not sure why). Just
> after S3 it takes very similar amount of time.
> Then, I wait 30min, and run that command (or really the whole domU)
> again a few times. I consider it "good" if I get at least one result
> below 10ms. With this test in hand, I did run bisect between
> staging-4.17 and staging-4.19. And here stuff gets interesting:
> 
> At 498a4ded74b3f062c52e42568223dc5858d27731 I get the following times
> (in ms):
> 
>     30m after S3: 2, 2, 10, 10, 
>     1h after S3: 2, 16, 16, 2, 17
> 
> At 5effd810c629d9a836e46ee321ca7409dad27212:
> 
>     30m after S3: 26, 27, 26, 15
>     1h after S3: 24, 25, 37, 37, 25
> 
> This doesn't make any sense to me. There is a clear difference, yet
> 5effd810c629d9a836e46ee321ca7409dad27212 looks like a no-op change (at
> least for this Intel system).

Pretty odd indeed. I assume you double checked the effect by going back
and forth between the two commits. If the effect persists, could you make
both binaries (xen-syms or xen.efi respectively, depending on which one
you use of the system) available somewhere for inspection? There has to
be some relevant difference, e.g. by addresses shifting slightly.

Another possible further step may be to move forward from that commit,
putting a revert of 5effd810c629 on top. If the behavioral effect is due
to particular layout of the linked images, the effect should re-surface
later (likely again at a seeming innocent change).

Jan

