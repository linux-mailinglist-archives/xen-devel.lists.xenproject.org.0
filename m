Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040D8C4E9D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721313.1124645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oPG-0005HD-HZ; Tue, 14 May 2024 09:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721313.1124645; Tue, 14 May 2024 09:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oPG-0005Fd-Da; Tue, 14 May 2024 09:25:10 +0000
Received: by outflank-mailman (input) for mailman id 721313;
 Tue, 14 May 2024 09:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6oPF-0005FX-Fo
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:25:09 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da5b4ce0-11d3-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 11:25:07 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51fea3031c3so7071493e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:25:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c6d7sm700934666b.59.2024.05.14.02.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 02:25:06 -0700 (PDT)
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
X-Inumbo-ID: da5b4ce0-11d3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715678706; x=1716283506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mX3TB+de2A03snoFMDWj2SlfJr+ktFoulnQl/oak/pU=;
        b=RRH3O6J+fr0KJ+sCKahpz/65U4z7ybyqgHe5B9dkZZAGLXQr00/Yckyptxtl1/GHQN
         mfwGq5gPlr9A9tMhyLnWR5XmJVZhT9gvSnfxB5HpDBl1tO5noJwq0KMrroRC530qszfw
         8MxNNACNfFeURWkHuR0SesGtU1irMjolqyOYKsDwNqI8FtMstoSeoBZbqle1X5ajgytO
         Pn6oSh6ThaYmLdBtDgleAmLYeIK+4iZGNN3ydCW8bTJiK5AGeq91fcCG7T5PHGVTVhPK
         /P5jiGJEh+hDfSDGywzLIhsatS/XDHXHgRibuvpA83dIXFarRacT0MdgazAovNDV1s/u
         ZbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715678706; x=1716283506;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mX3TB+de2A03snoFMDWj2SlfJr+ktFoulnQl/oak/pU=;
        b=GoU9q1NYZvqrb0+ZDFb6c22fVybz8+Xo015Jz/ElF9EZxuoZPyM3jfl7mgK8AWj+EN
         QF1UmO69sMLHrqb2dC7ZWiT51p05wxEyCXvbo4V1ssaXmbuSq+1ENuTJlMU+A8zn7vjN
         8NOzrKgHCh7nUm0isJl3vfFZKlMi8pXiuQ4XnDZ/2N7/4emL/dVEJ8wL8PCknI77a4PH
         T+umLjIpBfT7eWd7Vcs/Untji2WbwJrJ5nMGkY4eBCwUJbq/rc+MuWYoogMAu5ynOQtW
         AZgHkGo0Fb3FGPu+HCkS+jQ0zQj6jA6J7y4MVZcU3rxrnlDIBdloQtxmEyOvy9xBw5+I
         8PWg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Nz4WNCiAYqEhYGJ8/8dHwmKcSQTt63EEMISKWrn7e72aosBBdfNtvoYwBARyyxz8nl52TZyubq0G0N3YwJ7Gx2/JgJAaLqn6Z3kgfE4=
X-Gm-Message-State: AOJu0Yx6JeyabCyhfcMC4TZkdRzyvQ5vEIhBcUx/SbKThT0EetvR6TBR
	JnpPpDe557K8rDUxHz2RwDbUCLYPScufS1CrssAnn9X8WT2DxTsAzIZ4qjHnOjFG5NAA1A3ybL4
	=
X-Google-Smtp-Source: AGHT+IHtTza15ZNLlFIOwB9SeocQPby51iuDtQ775c/csh/M8Tu3U9lu5oES5ymGeo1fl6luoHTITw==
X-Received: by 2002:a05:6512:1281:b0:522:3356:3b8 with SMTP id 2adb3069b0e04-5223356040bmr10026735e87.27.1715678706596;
        Tue, 14 May 2024 02:25:06 -0700 (PDT)
Message-ID: <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
Date: Tue, 14 May 2024 11:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
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
In-Reply-To: <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 08:16, Jan Beulich wrote:
> On 02.04.2024 19:06, Andrew Cooper wrote:
>> The commit makes a claim without any kind of justification.
> 
> Well, what does "have no business" leave open?
> 
>> The claim is false, and the commit broke lsevtchn in dom0.
> 
> Or alternatively lsevtchn was doing something that was never meant to work
> (from Xen's perspective).
> 
>>  It is also quite
>> obvious from XSM_TARGET that it has broken device model stubdoms too.
> 
> Why would that be "obvious"? What business would a stubdom have to look at
> Xen's side of an evtchn?
> 
>> Whether to return information about a xen-owned evtchn is a matter of policy,
>> and it's not acceptable to short circuit the XSM on the matter.
> 
> I can certainly accept this as one possible view point. As in so many cases
> I'm afraid I dislike you putting it as if it was the only possible one.
> 
> In summary: The supposed justification you claim is missing in the original
> change is imo also missing here then: What business would any entity in the
> system have to look at Xen's side of an event channel? Back at the time, 3
> people agreed that it's "none".

You've never responded to this reply of mine, or its follow-up. You also
didn't chime in on the discussion Daniel and I were having. I consider my
objections unaddressed, and in fact I continue to consider the change to
be wrong. Therefore it was inappropriate for you to commit it; it needs
reverting asap. If you're not going to do so, I will.

Jan

