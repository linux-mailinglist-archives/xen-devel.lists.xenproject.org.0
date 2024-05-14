Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FEC8C4EB6
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 12:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721357.1124735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6p0f-0002Du-6e; Tue, 14 May 2024 10:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721357.1124735; Tue, 14 May 2024 10:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6p0f-0002CI-3r; Tue, 14 May 2024 10:03:49 +0000
Received: by outflank-mailman (input) for mailman id 721357;
 Tue, 14 May 2024 10:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6p0e-0002CC-6o
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 10:03:48 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40fc30d8-11d9-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 12:03:46 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5a5c930cf6so535506766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 03:03:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7da8sm707505366b.99.2024.05.14.03.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 03:03:46 -0700 (PDT)
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
X-Inumbo-ID: 40fc30d8-11d9-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715681026; x=1716285826; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdSZthp74TLUjLS/d377/SBlO1xL1eefpvnkDZAQNnQ=;
        b=X0IvX7GLpuTMJAa21Jnut6R0+rabPfLquGDvfvlZmH/cWNky5KsLTC58NU2GgcLo79
         Sb4qGjwbOe+4JNYg3vWIt7MzHuyNmv+xbdvhvJB4ZAK9HL0hEp0Tkf2y5BC6KZdev4cC
         T4upeB5un/bmHpyqCJ9Gg1CuGGmwN9Zl8W8PCE0wQjiKeo7J+HUcZFSvEGiYTLWHSEV/
         vOp2+npXfzZo5yKuOMHq1YV8N1INUsr1GWIW0QMuxbxF/hVeyQkgKpX0iznFHEAeS7Ba
         5qOKvzny4JQ2PawxwRkEuaUChmGwo7sJhtIKN8UgoaBylDPqAxlaObIqT9L90QdwRWGg
         3N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715681026; x=1716285826;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdSZthp74TLUjLS/d377/SBlO1xL1eefpvnkDZAQNnQ=;
        b=ORz8s1VVzNzPo8ZU5zuaw//qIslxmeIzScyoXTQOp3xhcyZhuG2qcViKCNqB9wkuBg
         H8YjEZGbcgr2no9h1AHYKtbArBSIaJoXd4yd9WKxqscwjK9h6pmUjHrKakvfDR27fAXQ
         lWXcCvZYPZzCKZ17l4w1XhquXQvgwrXnBkRTOdid5yG42ghT/2cUq87N3F/QY/Yr/Odx
         9imGgeCkJJKo+d4+zQWkflOJvs7widiECPOQ9y9mueWGWBqHeCUYutPu/w26FwQXO89K
         tCjQGR4mjO8VQNLOgfAjaQm6n3BARJOehIH0i3QPtn4SzidL+sUhro7W4cK35hfvxKzu
         P8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqxuWwZhh2+KqfiW1IEFy29j2fgse4YuuzI5jQTknIKK2Ewd6KDySiN2weU/I9DgVjCMrEIt3W6anPAoSLyv//fzVIUJTScxofoQCCtOc=
X-Gm-Message-State: AOJu0Yy2ync8ecVyjLVM0WXp0aYwpoeubCciQCzEQpKSuIEibYVhox8d
	CS15cB9AyT+Qhj22f9oHm+ck+O/OJK6xaSFl1Mw7+zchupP7zs12aEVmefsuRQ==
X-Google-Smtp-Source: AGHT+IHhkPKcGHa7zpr+tjD5ufu50ISrCwlos9ftoIwiPdoh6zt/3CRtBbAC12aF8u6/mm1AISaNhA==
X-Received: by 2002:a17:906:194a:b0:a59:9b75:b90 with SMTP id a640c23a62f3a-a5a2d53ad53mr828755366b.2.1715681026293;
        Tue, 14 May 2024 03:03:46 -0700 (PDT)
Message-ID: <ccd70c8f-1381-43f7-8be8-edc1dd505ce2@suse.com>
Date: Tue, 14 May 2024 12:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
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
In-Reply-To: <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 11:51, Andrew Cooper wrote:
> On 14/05/2024 10:25 am, Jan Beulich wrote:
>> On 03.04.2024 08:16, Jan Beulich wrote:
>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>> The commit makes a claim without any kind of justification.
>>> Well, what does "have no business" leave open?
>>>
>>>> The claim is false, and the commit broke lsevtchn in dom0.
>>> Or alternatively lsevtchn was doing something that was never meant to work
>>> (from Xen's perspective).
>>>
>>>>  It is also quite
>>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>>> Why would that be "obvious"? What business would a stubdom have to look at
>>> Xen's side of an evtchn?
>>>
>>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>>> and it's not acceptable to short circuit the XSM on the matter.
>>> I can certainly accept this as one possible view point. As in so many cases
>>> I'm afraid I dislike you putting it as if it was the only possible one.
>>>
>>> In summary: The supposed justification you claim is missing in the original
>>> change is imo also missing here then: What business would any entity in the
>>> system have to look at Xen's side of an event channel? Back at the time, 3
>>> people agreed that it's "none".
>> You've never responded to this reply of mine, or its follow-up. You also
>> didn't chime in on the discussion Daniel and I were having. I consider my
>> objections unaddressed, and in fact I continue to consider the change to
>> be wrong. Therefore it was inappropriate for you to commit it; it needs
>> reverting asap. If you're not going to do so, I will.
> 
> You tried defending breaking a utility with "well it shouldn't exist then".
> 
> You don't have a leg to stand on, and two maintainers of relevant
> subsystems here just got tired of bullshit being presented in place of
> any credible argument for having done the change in the way you did.

Please can you finally get into the habit of not sending rude replies?

> The correct response was "Sorry I broke things.  Lets revert this for
> now to unbreak, and I'll see about reworking it to not intentionally
> subvert Xen's security mechanism".

I'm sorry, but I didn't break things. I made things more consistent with
the earlier change, as pointed out before: With your revert,
evtchn_status() is now (again) inconsistent with e.g. evtchn_send(). If
you were serious about this being something that needs leaving to XSM,
you'd have adjusted such further uses of consumer_is_xen() as well. But
you aren't. You're merely insisting on lsevtchn needing to continue to
work in a way it should never have worked, with a patch to improve the
situation already pending.

Just to state a very basic principle here again: Xen-internal event
channels ought to either be fully under XSM control when it comes to
domains attempting to access them (in whichever way), or they should
truly be Xen-internal, with access uniformly prevented. To me the
former option simply makes very little sense.

> As it stands, you're 2-1 outvoted, and wasted any sympathy I may have
> had for the principle of the change based on the absurdity of your
> arguments.

No, pending objections are pending objections. Daniel's responses didn't
eliminate them.

As a separate aspect: I can't assume anymore that it is just coincidence
that you taking such a controversial action is at a time when I'm away.

Jan

