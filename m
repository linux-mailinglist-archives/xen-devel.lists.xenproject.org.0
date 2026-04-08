Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECt8B99z1mkWFggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 17:27:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F673BE2C9
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 17:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276289.1561811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAUo6-0000mm-Bw; Wed, 08 Apr 2026 15:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276289.1561811; Wed, 08 Apr 2026 15:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAUo6-0000l3-8T; Wed, 08 Apr 2026 15:27:06 +0000
Received: by outflank-mailman (input) for mailman id 1276289;
 Wed, 08 Apr 2026 15:27:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAUo5-0000kx-1C
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:27:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAUo3-006TgT-Ul
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:27:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d673a4-e002-0a2a0a5209dd-0a2a45089a66-34
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:27:03 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d673c7-fab6-0a2a45080019-d155da32bd90-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 17:27:03 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b9c3e2cf3c0so1015691966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 08:27:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3cff1e54sm658555366b.46.2026.04.08.08.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 08:27:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775662023; x=1776266823; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNkbyxOJgg8AOtR8HKDfMqNt8lwrmOcN6PGW4ES7vyA=;
        b=CJRYfFgjjyZwSNTT8G2NRx5w3NHk2mAFhFIYj1K+AzIVE75T/t33lFbx6UnT3SRb9+
         tEFoWauze7Pw3GHub423a+78uyAmzTQrAmMnqitah5O7s4cFHh0ZkCUWsjy6KRUlOrFN
         HCgGb64u7xTIwBqaBSQS4uWuzCKLmUIyTjWo/zI+d0fvtp0KH6zoBEnleUqvc54EDOp3
         rP+uCgmsnpsHFi0KyEhRZJDJKZc6rq0KnSzM8ny014wdt/MAMKoRhAyhOPQE9Tc5m6XE
         /nwLtXcWdVAC+94rk4k2vcd7kSODG54rMYuWDOpmBJvwbBGjh9Fs8LUn6jx5KPCj9mGs
         Zkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775662023; x=1776266823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNkbyxOJgg8AOtR8HKDfMqNt8lwrmOcN6PGW4ES7vyA=;
        b=F0FOJt9vfzaEmwXnorML6DHCCsU87+N/DTI/2eGMDWDpeIFyAQ1J+f7VgAJbmQ+RLR
         czsnYzfob9EU9NmmLkCnNhgdQ1QV/Bz/WfOhr/XROlMFmoQ9Zsgt/MZsi/yXJRYrdOYA
         kQmSZlOUPfMk+e58F6ckHnI2VZGvJIbgV+YIwGJd0gPhw/X18tW6QPL99zjdoeMBY8tW
         pfGHVCh7QSvfA2vPycw3TSqHXox+n02L+jfruarXmEdLlkqczGsUG6e1ehJ5Fhr+dVnx
         2caGol5zgrGsWGTwKo5FAzbBN5nKdViJ453Twslvt452Jco9BfkgTONmgyrJ6n/RKLh4
         yjrw==
X-Forwarded-Encrypted: i=1; AJvYcCV4SQjuLyMw5BV7Sk5fVvBlAnMqYvnFrOjgxvMKAgKnWnxzkB6faOGwG2tZOhTp5e5e2Bsno+titdU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPpsWVrLxYp4w1Yp9yqXK2VgK2d9978vXYmwK/0avt4PSMHwxA
	XvOU2ZPQWtV7G+njWmO/nuE2i4zJNNtGlDUiSPLql4sHD1Ss0lADkCtT
X-Gm-Gg: AeBDieu9bLrsDQfA+NhqJssHdd0826e8MiAXRW2YQg6hk4p89+VX4onrC5PpgnHwLU5
	FwFSe8ISvodVgJZPM/eXuaddJl67HRKWf9+Um2x2cRgzeGEQri3GiGnKCXnLLddHdlwZ5yPV/QG
	keUfoqgRqzBmlvuQcgphOEQDhl9C7xdvGU7sASd4Qgpjge0MpIhnntLvh423wltu9MK0MJ6N1TS
	ELj+qA0rI7EdE9d1j3i0Za7+XTU3l+0JrRBNfXC+gD3ZokBk8qAuUTnAdvAUTAlcNZEkAUffhgA
	Puq/b0pG8eqdfejfC42In2th0Xo2McuDssxU2fbINzdMHgth87Z/yCcvi1uv7njloS7gHmW7/ck
	zT0jhwXFEvJT/F32S7IO9h8mP7gv4YanaLkinXafmcFR7a9gGjpjPL3N9S/DqbKfY9p6SRSR8pk
	hExvw7kqWByESZx1vCHHbt3/h5fQdnn7DHtuJJMZyBUuxUNd8GwaNzMGKSKsGW7FLyMU/a3n/dm
	PY=
X-Received: by 2002:a17:907:3e25:b0:b9c:5672:852 with SMTP id a640c23a62f3a-b9c67a2e990mr1154786666b.40.1775662023063;
        Wed, 08 Apr 2026 08:27:03 -0700 (PDT)
Message-ID: <e8cd37a7-196b-4154-9164-61cb672b2fa4@gmail.com>
Date: Wed, 8 Apr 2026 17:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] x86: Reject CPU policies with vendors other than
 the host's
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
 <20260312112116.22563-2-alejandro.garciavallejo@amd.com>
 <92d21438-9573-45ce-a589-d292d1c31ecf@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <92d21438-9573-45ce-a589-d292d1c31ecf@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775662023-F5159497-356FFFE1/10/73395122804
X-purgate-type: spam
X-purgate-size: 3379
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,changelog.md:url,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 77F673BE2C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/12/26 10:01 PM, Andrew Cooper wrote:
> On 12/03/2026 11:21 am, Alejandro Vallejo wrote:
>> While in principle it's possible to have a vendor virtualising another,
>> this is fairly tricky in practice and comes with the world's supply of
>> security issues.
>>
>> Reject any CPU policy with vendors not matching the host's.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>   CHANGELOG.md                             |  5 +++++
>>   tools/tests/cpu-policy/test-cpu-policy.c | 27 ++++++++++++++++++++++++
>>   xen/arch/x86/lib/cpu-policy/policy.c     |  5 ++++-
>>   3 files changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index c191e504aba..90ba5da69e4 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -23,6 +23,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>      - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>>        prior to the version 1.0 release, and there has been no development since
>>        before then in Xen.
>> +   - Domains can no longer run on a system with CPUs of a vendor different from
>> +     the one they were initially launched on. This affects live migrations and
>> +     save/restore workflows across mixed-vendor hosts. Cross-vendor emulation
>> +     has always been unreliable, but since 2017 with the advent of speculation
>> +     security it became unsustainably so.
> 
> c/s 0f1cb96e9785294f149ab3c7feb90c0eb9daeede was when it got added to Xen.
> 
> I'm certain there's a whitepaper somewhere from AMD about this, but I
> can't locate it.  It was partly marketing about how you could buy AMD
> hardware (which was cheaper) and live-migrate your Intel VMs without
> interruption.  It would have been nice to find for posterity.
> 
> For the changelog, can I suggest this:
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c191e504aba9..377711d40953 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -23,6 +23,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>        prior to the version 1.0 release, and there has been no development since
>        before then in Xen.
> +   - Cross-vendor support; guests can now only be configured as the same
> +     vendor as the host CPU.  When added back in 2009, with enough trickery
> +     Intel and AMD CPUs could be made to be compatible enough to live migrate
> +     a guest, but the vendors have been diverging since then in ways that Xen
> +     cannot compensate for, and the advent of speculative security issues has
> +     put to rest any possibility of this being a viable option.
>   
>    - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
>      anything useful outside of x86.
> 
> 
> which is closer to the style of the surrounding bullet points.  Also
> s/domain/guest/ which is a subtle but important distinction made by the
> Security Team when discussing configurations.

With applying of suggested changes to CHANGELOG.md:
  Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # CHANGELOG.md

Thanks.

~ Oleksii

