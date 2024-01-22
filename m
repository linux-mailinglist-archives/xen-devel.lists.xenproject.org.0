Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DADF835FC8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 11:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669739.1042110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrbe-0008DL-9V; Mon, 22 Jan 2024 10:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669739.1042110; Mon, 22 Jan 2024 10:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrbe-0008B8-68; Mon, 22 Jan 2024 10:32:42 +0000
Received: by outflank-mailman (input) for mailman id 669739;
 Mon, 22 Jan 2024 10:32:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRrbc-0008Ax-L0
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 10:32:40 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90de7a58-b911-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 11:32:39 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ccbc328744so35172981fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 02:32:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a5-20020a92a305000000b0036062f40c51sm7218735ili.71.2024.01.22.02.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 02:32:38 -0800 (PST)
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
X-Inumbo-ID: 90de7a58-b911-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705919559; x=1706524359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8eCn3LtHsmObdItr2D7NIZIMjxkS5zGjMECDjuSe5YE=;
        b=TXNccssIo2RVGPJSPQ8+sK6aNQm1/5bV4ro+RthYq89WmwZBIpT8QxB2GzXTLrHutu
         j0hFCT86rhnGai0K0S6JjzGFZTzDzwB8HVeObAm+87Rff7i2Rvz41ESElsmiRb0x5zYX
         XXk9C26nJ70ftyXlXpjSYEdGhQ19WuT2TdWfuDRnHsWgUA5FPq6EHUHAZfIxWgsaDeny
         xKhPlgxHAqTLJL7tj3nlb8lZsjUGjkpub8IprpS/Qliq8m5ekJj2Qr27O6WOmvLZF0BK
         aabEgQuZHa/OCwzDzIMEZZvoMGURnS08+Gn5aiu9k24q+2x0UiVxESMuYG736fZzLsVl
         0gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705919559; x=1706524359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eCn3LtHsmObdItr2D7NIZIMjxkS5zGjMECDjuSe5YE=;
        b=vWR0Tt1tduaL+U6DXLX8hY2qVktsAdNLyVlWaSZIOYMKodxxaKV/9Z3Cb08NEYuvdj
         m3W/f0cc7lWy46UFKbfBngEFXvL1oDbwPyu08Nw1qni7kQw0Z+dhboQBwRllMVJf0pZC
         w7yMT1aN0z5Mt+i+tLWeHswHmSnLiuR+NoYKhs8W3iZsDq4gaztKU+Kk7CdszXf3ohyA
         cgNsSUKOhoKK/XHtmHdKxUqsQMCsBIaPvKxOkpBv1ALz/cUBLbmvAUeEJUlTV3uu28la
         sRA+eZuxaQl9V61DlRBZpG0Dq2INA2ywL+OGhdHg768ZaSkn8VZ2OsheABrtS2uW5zO4
         PWIg==
X-Gm-Message-State: AOJu0Yxovqf7eJjtcTUfzR1HF+mZ6nYpsCPmVj+/GqwKqEy7nsSMTgYf
	/ibZ8y6fOicHZRbU+C9iHyU/XdWGzbBITEi/GvGsEeLrTomUC7vZSfn4yMpYPgCWoSzL6ccyQrU
	=
X-Google-Smtp-Source: AGHT+IHjVP4G/4LSSReixmB3ajF8kuzS1dKxIQnVi3oY6HJtTxxbFIY/4g+an7rq5kqqcrDI4rIACA==
X-Received: by 2002:a2e:9e1a:0:b0:2cc:fd69:8073 with SMTP id e26-20020a2e9e1a000000b002ccfd698073mr1544156ljk.13.1705919558687;
        Mon, 22 Jan 2024 02:32:38 -0800 (PST)
Message-ID: <5309e7d3-7b3c-4522-99dc-bbd7734aeb34@suse.com>
Date: Mon, 22 Jan 2024 11:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Community Process Group - Proposal
Content-Language: en-US
To: Kelly Choi <kelly.choi@cloud.com>
Cc: committers@xenproject.org, advisory-board@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
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
In-Reply-To: <CAO-mL=yvVWjnOHSFSqcrknoXOqk-N3JY76qObQnzftrkmsq6xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2024 18:10, Kelly Choi wrote:
> Hi everyone,
> 
> I've spent a bit of time talking to various individuals and the advisory
> board about setting up a new Community Process Group.
> 
> A survey was recently conducted to identify how the community as a whole
> feels about a certain situation. It was not intended to ban specific
> wording or create a policy to do so, but more to give context that the
> community has a wide range of ideas, and individuals may agree and disagree
> a lot more frequently than we as individuals might think. It helps us
> understand that as a community there are many situations where it is not
> clear. As such, the results indicated a very even split among the
> community, which indicates a larger problem as we may not always come to
> agreement.
> 
> There is obvious frustration with how certain matters are handled, as some
> members may want the project to move faster, whereas others like to take a
> cautious approach. Given we are an open source project, differences in
> opinion are likely to happen and what we don’t want to do is cause further
> frustration.
> 
> *This is where I would like to propose the idea of a ‘Community Process
> Group’.*
> 
> A CPG can help as they will be able to advise members on similar issues
> regarding community processes or appeals and decide on the best way
> forward. To help with this process, I have consulted with various
> individuals including some committers and conduct team members.
> 
> *What is a CPG’s purpose?*
> In the first instance, we would expect an informal vote resolves most
> disagreements. However, there will be certain circumstances where the
> outcome is not always agreed on.
> 
> A CPG will be your second point of call, where you can escalate matters
> quickly for a democratic solution.

Between informal voting and this "second point of call", where does
formal voting go?

> Their purpose is to resolve process issues and informal vote appeals to
> avoid matters going to a formal vote, but also act as a representative on
> behalf of others in the community on future matters.
> 
> For example:
> 
>    - Naming conventions
>    - Whether feedback requesting changes on a patch series is acceptable
>    - How to move forward in case of non-actionable feedback to a patch
>    series
>    - How to move forward when a contributor or reviewer has not been
>    responsive
>    - Policy questions not related to the code of conduct
> 
> *What is their role and responsibility?*
> 
> The CPG has the authority to propose a resolution to situations where there
> are disagreements, that don’t involve large technical decisions. Their
> decision proposed should be accepted as final since members will have
> discussed the best steps and come to a consensus vote.
> 
> The CPG does not aim to replace the committers' authority or the advisory
> board but instead holds the authority to make decisions that are in the
> best interest of the community in relation to processes. Committers still
> hold the power should there be a formal escalation regarding technical
> decisions, but this would be extremely rare. Advisory Board members hold
> the final power regarding project and business-wide decisions.

Nevertheless it doesn't become clear to me how adding yet another authority
besides the committers will actually help.

> *How are members selected?*
> The CPG will be composed of 5 randomly selected members in total.
> An odd number has been purposely selected to avoid an impasse during
> decisions.
> 
> The criteria:
> Individual members must be active contributors and are willing to help the
> community succeed. As such they must be a part of the following groups:
> 
>    - Committers
>    - Active Maintainers: maintainers with >= 20 reviews in the last 2
>    releases
>    - Active Contributors: contributors with >= 10 commits in the last 2
>    releases

I'm afraid I can't leave this uncommented, as matching a common pattern
I'm generally unhappy with. Whatever the numbers you select in such
criteria, they'll open up an easy road for faking. At the same time it
of course is difficult to come up with any non-numeric or not-only-
numeric criteria. For example, I'd be heavily inclined to ask that
"non-trivial" be added to both of the numbers. Yet then there arises a
judgement issue: What's non-trivial can be entirely different
depending on who you ask.

What definitely needs clarifying is what "review" is: Are R-b tags
counted, or is it the number of replies sent commenting on patches?

> Future rotations of CPG members:
> New members will be selected randomly for each new release to ensure
> fairness.
> 
> *Expectations*
> CPG members are expected to use their best judgement of what is best for
> the community in terms of conflict resolution and process improvements.
> They can propose an outcome that progresses the project forward.
> The CPG is also expected to address wider concerns, feedback, and ideas
> during a monthly meeting with all community members.
> 
> For example:
> 
>    - If someone is displaying repeated concerning behaviour that disrupts
>    the community, members can ask the CPG for help on a solution. (This is
>    different from a code of conduct violation which would be for serious
>    offences only.)
>    - Help drive discussions on how much we deviate from technical
>    specifications
> 
> *Next steps*
> Given this suggestion is a big change in what I hope is a positive
> direction, we will require your feedback and a final formal vote on the
> process, before it is implemented into the governance policies. The
> specific wording can be decided after this proposal.
> 
> This will hopefully help us overcome some of the frustrations and issues we
> have seen in the community from a difference in opinion as a collective
> discussion will now be made. Should we need to, the process can be reviewed
> to improve at later stages.

Related to what I said earlier: Should it turn out that disagreement within
the CPG is difficult to deal with, will we then gain yet another authority?
Imo before adding such a new instance, it wants properly sorting
- why with what we already have we can't deal with the (supposedly few)
  situations, and
- in how far introducing a new instance will (likely) once and for all
  avoid similar situations arising again, just one layer up (i.e. to make
  sure there's no scalability issue, due to proliferation of instances).

Jan

