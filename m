Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC9DA33060
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 21:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886740.1296361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiIxP-0003Yl-UV; Wed, 12 Feb 2025 20:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886740.1296361; Wed, 12 Feb 2025 20:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiIxP-0003Wk-RV; Wed, 12 Feb 2025 20:03:39 +0000
Received: by outflank-mailman (input) for mailman id 886740;
 Wed, 12 Feb 2025 20:03:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mI2F=VD=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tiIxO-0003We-SN
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 20:03:38 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 723ada08-e97c-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 21:03:37 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-308e92c3779so12656601fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 12:03:37 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545037ac758sm1498702e87.111.2025.02.12.12.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 12:03:34 -0800 (PST)
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
X-Inumbo-ID: 723ada08-e97c-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739390617; x=1739995417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCaE2BFtWY1Gflh3hDCFauLk23kn4iMc/UqcUGsoR/Q=;
        b=Uam2eugB3TPKybu8vrWdNt6oqwPlaaXN8vT/9konEu3H7w+YLeoT5GrvTsdAYY0tNb
         NOu2R2vEKT0gwcpagFKpLzKCKuFkkd8V1Va6eaSpN9anY6SaRScbEIzWq2WWChEFpNUE
         owEf7Yl/MkEuPNABPqyoVE56XGQT7dRCMwUCpvTe91PYaNVc02mU0eaVh6ZK1APb5noR
         dS5Iu60U/Nn5eFfb5gfDyx4ycVodNB5zTRqF6dMYCQVXptr2Dj3FaX7SbdEXLv2nXHxI
         GdBQKnA6Wngn0ktjhPbOLkQi1iq4X+JNiGS/O5wcUn55M9FgGHUBvbCTELQnGkpqhSBz
         xXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390617; x=1739995417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCaE2BFtWY1Gflh3hDCFauLk23kn4iMc/UqcUGsoR/Q=;
        b=GA6V8Zu7y6BrqoN0BbEeCOKOgLtpM+b6CepjdpzNynf5LnZI0J+8JaU8gOgdwOd9QH
         uC4+ZviUfVZQMDatAF/HJUAqblyYAaFoRA2oMZC9hi9BhpIkjwK+iKLzQRcRvnp6cQyx
         cGHUqeouxGecRWb84LyzCnYF2s24hB0HYsBmX/CAmO8CNvlI8w3RWzGga70rCQC4dZmG
         SGsAg1l1VGRKsVWG8M1OWl+LtzMKaeRDbaegwRtIqMcc/ZxnNr6i/MdDwEfwhQIB8BP4
         uAKIS5tDDGI3poXQSZ9M5hnYP+re0zrGQASgVIhiYuWrUUJ18snn1fLSOclcbVCSrEeo
         kDeA==
X-Forwarded-Encrypted: i=1; AJvYcCVoPp4smUpER1H+XvSSe/rQQvRrH5FW8sSw0t/1LiSgz5+ZUD2FyhXPL8V81BxjSo2iGfNunK/upaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0ZbUr2A+MGb+/Wwvp9R1LjLcIvAVvulKntgSGYwZxi2HdDBdY
	lf6TF8E36jGUo0oIYTwR70YY3jtFOG4GMtpMDrDQw7E5U4gaE9DS
X-Gm-Gg: ASbGncsp9t33T9wOHuKw2D0q+S/jHYqhgGVTj29c32hZ0F5qDwtMdXlxgyYxsL5R3iq
	P5lrzCdLTyIn0RGS4twCKFCfSK7WGj01dFrZayBdaHRSoJzuypucoxTphx/CdaxLkJ1IhRlOZh9
	1wR8tsUhtvjrhjnTktv0JHBpuyIuPY71Tg0mPlDMacfUivT/d1fWDVhpS36jnsaE3tRzXgq0zyq
	gs6j2RkCI9enWc3tFscMvBB2dX05bp2nCWpDurNg/IUc+tyOMaSOmVOeTo5gcEwPNeE7DmTaFJt
	8WflPQaF7Z9qFLaD
X-Google-Smtp-Source: AGHT+IHWQu55HgE8glczcSndGtkG4rj+yPVLrIjr8T7tQuJfrs4pOIAjUh+XeQguAK13hlwP4E803w==
X-Received: by 2002:a05:6512:39cf:b0:545:6a2:4c3c with SMTP id 2adb3069b0e04-5451e01f18cmr73854e87.21.1739390616403;
        Wed, 12 Feb 2025 12:03:36 -0800 (PST)
Message-ID: <48c1f97b-b543-44c7-93a0-d23b47ba24fe@gmail.com>
Date: Wed, 12 Feb 2025 22:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Coding Style Review and Automation
To: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Michal Orzel <michal.orzel@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <alpine.DEB.2.22.394.2502111426380.619090@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2502111426380.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello, everybody!

On 12.02.25 00:33, Stefano Stabellini wrote:
> Hi Oleksandr,
>
> This morning, we had a discussion among maintainers, and the suggested
> approach moving forward is as follows:
Great news!!
>
> - First, it would be helpful to see a sample of the proposed changes
>    applied to a single source file as an example. If you could provide
>    such a patch, it would help advance the discussion.
Sure, I can create such a patch. I will quote Jan here:
"May I suggest to consider e.g. drivers/ instead? That'll involve
more people (to build an opinion) while at the same time it's fewer files
and less code overall."

Which seems to perfectly fit this exercise. So, I'll run clang-format on drivers
and see what file is most affected and then make a patch out of that.
For that I am going to use the latest clang-format (main branch), so we can see
if there is some progress after what Luca sent before (aka 9MB patch) [1].

New clang-format already has some improvements made by Anastasiia Lukianenko
back in 2020 and those have landed the upstream, for example [2].
Those were specifically made to better suit Xen coding style.

Luca was targeting the clang-format which is widely available (version 15) and
thus was not able to benefit from those: but nevertheless, I will prepare the
patch with Anastasiia's improvements plus the Luca's .clang-format: I'll merge
.clang-format from both authors.

For the reference: I've put Luca's .clang-format into my Xen fork for now along
with gathered feedback from the community on some clang-format options and
their settings [3] as those were discussed on the mailing list back in 2023.
I will re-work that in order to add changes made by Anastasiia.

>
> - If the changes are acceptable, we need to properly document the new
>    coding style in xen.git. If not, we will need to iterate again. We may
>    also need to add a "xen" template to clang-format.
I am not sure that single patch is going to show all the changes and we'll be
able to make the right decision out of that. That was already proven by the size
of the patch Luca posted: 9M. But, anyways, this will definitely show what can
be accepted now.

>
> - Once finalized, we will proceed by making changes to the Xen source
>    code piece by piece, as you suggested, rather than applying a single
>    large patch.
>
> Let me know your thoughts.
Sounds good, thank you!!

Stay safe,
Oleksandr Andrushchenko

[1] https://gitlab.com/luca.fancellu/xen-clang/-/commit/8938bf2196be66b05693a48752ebbdf363e8d8e1.patch
[2] https://github.com/llvm/llvm-project/commit/f6b252978c40bc437d8495218a69e3bd166b105b
[3] https://github.com/andr2000/xen/blob/clang/xen/.clang-format
>
> Cheers,
> Stefano
>
>
> On Mon, 10 Feb 2025, Oleksandr Andrushchenko wrote:
>> Hello, everybody!
>>
>> What is the rationale behind introducing a tool to help with coding style
>> verification? I will partially quote Viktor Mitin here [2]:
>>
>> "The Xen Project has a coding standard in place, but like many projects, the
>> standard is only enforced through peer review. Such mistakes slip through and
>> code is imported from other projects which may not follow the same standard.
>> The
>> goal would be to come up with a tool that can audit the code base as part of a
>> CI loop for code style inconsistencies and potentially provide corrections.
>> This
>> tool is to embed as a part of the continuous integration loop."
>>
>> I would add that it would better reflect reality to say that Xen's coding
>> style
>> is quite incomplete to become a standard and needs some improvement to achieve
>> that.
>>
>> Here, I would like to provide a bit of history and acknowledge those brave
>> individuals who dared and tried to introduce to Xen coding style checking and
>> formatting support with clang-format.
>>
>> Year 2017, Ishani Chugh.
>> ---------------------------------------------------------------------
>> This journey began with a request from an Outreachy program member [1].
>> Then came the first patches by Ishani Chugh [2]
>> Status: *busted*.
>>
>> Year 2019, Viktor Mitin
>> ---------------------------------------------------------------------
>> Then picked up by Viktor Mitin, EPAM's first attempt [3].
>> Status: *busted*.
>>
>> Year 2020, Anastasiia Lukianenko
>> ---------------------------------------------------------------------
>> Continued by Anastasiia Lukianenko, EPAM's second attempt [4], [5].
>> Some contributions were made to LLVM to make clang-format a better fit for
>> Xen [6].
>> Xen-summit and presentation [7] and the summary document [8].
>> Status: *busted*.
>>
>> Year 2023, Luca Fancellu
>> ---------------------------------------------------------------------
>> Luca restarted it, first ARM attempt [9], [10], [11].
>> Status: *busted*.
>>
>> That's all for now, but it is still impressive as of 2025.
>>
>> So, in my opinion, what were the main issues with all these attempts? There
>> are
>> many different views, but I would emphasize the following:
>>
>> 1) clang-format doesn't perfectly fit Xen's code style as some rules it
>> applies
>> are not liked by the community or it applies rules that Xen's coding style
>> doesn't define (those Luca described in his .clang-format for every clang
>> option).
>>
>> 2) clang-format doesn't work in a "one-option-at-a-time" mode [12]: clang
>> maintainers strongly oppose requests to allow turning off all options except
>> some. Believe it or not, other maintainers also have strong opinions on what
>> is
>> right and what is not for their projects, and this is one area where they will
>> not compromise.
>>
>> 3) The size of the patch after applying clang-format is huge. Really.
>> Something
>> like 9 MB. Even if everyone agrees that the approach is good and we can
>> proceed
>> with it, it is highly unlikely anyone will be able to review it. Considering
>> that new patches are being added to the upstream during such a review, it may
>> also lead to new code style violations or require a new review of that huge
>> patch.
>>
>> 4) Which clang-format version should we set as the one used by Xen, so it is
>> easy for everyone to use it on their hosts?
>>
>> 5) You name it. I think many people in the community can name their points for
>> and against clang-format.
>>
>> So, in this attempt, I would suggest the following approach:
>> I think that I could start sending patches after the latest .clang-format 21
>> for
>> some part of Xen, ARM code base for example, using work already done by Luca.
>> This way:
>>
>> 1) Patches are formatted with clang-format, which is a strong plus.
>> 2) The diff is well maintained and I can still alter it by hand if there are
>> comments or dislikes.
>> 3) Finally, when the patch is accepted, we can be more confident that
>> clang-format will find far fewer inconsistencies than if it were just applied
>> to
>> the "raw" code. Thus, the next time clang-format runs, it will produce a much
>> smaller patch than before.
>> 4) Finally, introduce clang-format and run it on the leftovers: at this stage,
>> it would be much easier to discuss every option clang has and the resulting
>> output it produces.
>> 5) Update existing/add new rules to the Xen coding style based on community
>> agreements and the results of this activity.
>>
>> We may define the subsystems to start this activity on and also define an
>> acceptable size of the patch for review, say 100K. Considering that the longer
>> the review, the more outdated the patch becomes and will require a new round
>> as
>> new code comes in.
>>
>> I would love to hear from the community on this approach and finally get it
>> done. Not busted.
>>
>> Stay safe,
>> Oleksandr Andrushchenko
>>
>> [1]
>> https://lore.kernel.org/xen-devel/1130763396.5603480.1492372859631.JavaMail.zimbra@research.iiit.ac.in/T/#m1db2521362edd286875acf10296873993226dcf2
>> [2] https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg01739.html
>> [3] https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg01862.html
>> [4] https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg02157.html
>> [5] https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg00022.html
>> [6] https://reviews.llvm.org/D91950
>> [7]
>> https://xenproject.org/blog/clang-format-for-xen-coding-style-checking-scheduled/
>> [8]
>> https://docs.google.com/document/d/1MDzYkPgfVpI_UuO_3NRXsRLAXqIZ6pj2btF7vsMYj8o
>> [9] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02294.html
>> [10]
>> https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00498.html
>> [11]
>> https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
>> [12] https://github.com/llvm/llvm-project/issues/54137#issuecomment-1058564570
>>


