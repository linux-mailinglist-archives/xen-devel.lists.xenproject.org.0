Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6708A2FBC3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 22:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884963.1294718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thb8a-0000M3-9I; Mon, 10 Feb 2025 21:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884963.1294718; Mon, 10 Feb 2025 21:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thb8a-0000Jw-65; Mon, 10 Feb 2025 21:16:16 +0000
Received: by outflank-mailman (input) for mailman id 884963;
 Mon, 10 Feb 2025 21:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IQvQ=VB=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1thb8Y-0000JX-PO
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 21:16:14 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413c8a4b-e7f4-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 22:16:12 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-545039b6a67so2496865e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 13:16:12 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450a64ea2dsm507133e87.14.2025.02.10.13.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 13:16:09 -0800 (PST)
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
X-Inumbo-ID: 413c8a4b-e7f4-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739222171; x=1739826971; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcvNRzbKDR9Xjxq3GqC0ltUqZA2nVEHEPyukdswlYXs=;
        b=iwfuelChl+IVEchN0n8jOT8RIE3RAHBHvq/1HuscaatYTgjt60+sJeLAoHC98Eh93m
         h/4LC5nyz1EVwGRWn8fJmhM3sMBfkmIazq82CS2n6jL7FbuAJHfjHjmi5oNWxonlD7/E
         ZeSFX+OM4sLZl3P++Mzf2i1gvSyfXuj2ajY4q0fO0TF5Io0skU5f4X2QrHd9pwNz0Zjy
         qpubzUNo6x5hdYmfHYT6hHbdiCAF6Y7HDJEOUruSVkpoLJEtk9ZhpgbXT8d49/re8ukq
         poMSSU7CFOzByIbjjHtVo3uWHxklQmriwzDS0adxwqop6yFO/HoGZWYLa0wkTsnuHzGB
         YfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739222171; x=1739826971;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FcvNRzbKDR9Xjxq3GqC0ltUqZA2nVEHEPyukdswlYXs=;
        b=ZvjwDPrfFDFZY0m2nI2gKohSfsNky55RYmwiE7VY0ELSSGtgkwIxX87G3M1x+5h+ZL
         XYiAkYIgjLI07B0HEabuDaGrtON5ixBbbwxsvYuguxGSh/ci3DT4Ts2lYFqEgKvPENcL
         LZFGzJgTDYEcmy1paZ/fIMMy5PHBhB0q4RTN3f8EwXnJzro95p47aDT6ShnDQyf6Mycm
         riwGb2g89JWbtibgreLwDT3rTEh8AeltyMfr/nwuO2ZKwsEvHcgieI9XelaiE1F87liu
         W1Il62+zfVUMsLZeDAHfAQvs0BXN9RooVVyvmM9mnHhMWkr5ZnzEWm0QsjNjmSXu/HpO
         lvSw==
X-Gm-Message-State: AOJu0Yya/Tq1Lw2WHfe0xfWhIbo1ZAnWmJU0qrPhNCROWseDJDcHEGy7
	xlL7S+xe1JYrk++5boML+V0P6Zcnca2jLH9J2FvY9ZoWwwGnX/7PtzwVwA==
X-Gm-Gg: ASbGncs94RfVlJJGJcr0kNmCbUmx32frK2URnYlvteMEvjN75eEwK6YECywpBgs9E0e
	C4zMTZbjNwqP+piIWNr3KeEFUOaciwIQst8H3c1v83Nh+vKhUppW6A3UEQdf0hUutJ1T2X+fWcf
	+JkESF6+O/BIFcqBXZ9O/Ydl7l15fAnAD2g3MmPpUoEcyl/FLFfYkxThluAgo9Dh5+/C2tyaqg8
	oS7NXD0+T5kz+vVnpcvxxkP/W4jxECRp5OgHb9Z+BjjJiI4Oxh8WSfDLvZhBMdcEsLlQYMR1qDh
	z0KarXMjw5JUbELc
X-Google-Smtp-Source: AGHT+IF1XfMgRl33OsMdbC7ndHVRq03NkJg8W1AywGDoGD2gokfC88i+UzOU9fbOWF8bFoIZvih2MA==
X-Received: by 2002:a05:6512:3a90:b0:545:ece:82da with SMTP id 2adb3069b0e04-5450ece84b8mr1022628e87.4.1739222170499;
        Mon, 10 Feb 2025 13:16:10 -0800 (PST)
Message-ID: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
Date: Mon, 10 Feb 2025 23:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Coding Style Review and Automation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello, everybody!

What is the rationale behind introducing a tool to help with coding style
verification? I will partially quote Viktor Mitin here [2]:

"The Xen Project has a coding standard in place, but like many projects, the
standard is only enforced through peer review. Such mistakes slip through and
code is imported from other projects which may not follow the same standard. The
goal would be to come up with a tool that can audit the code base as part of a
CI loop for code style inconsistencies and potentially provide corrections. This
tool is to embed as a part of the continuous integration loop."

I would add that it would better reflect reality to say that Xen's coding style
is quite incomplete to become a standard and needs some improvement to achieve
that.

Here, I would like to provide a bit of history and acknowledge those brave
individuals who dared and tried to introduce to Xen coding style checking and
formatting support with clang-format.

Year 2017, Ishani Chugh.
---------------------------------------------------------------------
This journey began with a request from an Outreachy program member [1].
Then came the first patches by Ishani Chugh [2]
Status: *busted*.

Year 2019, Viktor Mitin
---------------------------------------------------------------------
Then picked up by Viktor Mitin, EPAM's first attempt [3].
Status: *busted*.

Year 2020, Anastasiia Lukianenko
---------------------------------------------------------------------
Continued by Anastasiia Lukianenko, EPAM's second attempt [4], [5].
Some contributions were made to LLVM to make clang-format a better fit for
Xen [6].
Xen-summit and presentation [7] and the summary document [8].
Status: *busted*.

Year 2023, Luca Fancellu
---------------------------------------------------------------------
Luca restarted it, first ARM attempt [9], [10], [11].
Status: *busted*.

That's all for now, but it is still impressive as of 2025.

So, in my opinion, what were the main issues with all these attempts? There are
many different views, but I would emphasize the following:

1) clang-format doesn't perfectly fit Xen's code style as some rules it applies
are not liked by the community or it applies rules that Xen's coding style
doesn't define (those Luca described in his .clang-format for every clang
option).

2) clang-format doesn't work in a "one-option-at-a-time" mode [12]: clang
maintainers strongly oppose requests to allow turning off all options except
some. Believe it or not, other maintainers also have strong opinions on what is
right and what is not for their projects, and this is one area where they will
not compromise.

3) The size of the patch after applying clang-format is huge. Really. Something
like 9 MB. Even if everyone agrees that the approach is good and we can proceed
with it, it is highly unlikely anyone will be able to review it. Considering
that new patches are being added to the upstream during such a review, it may
also lead to new code style violations or require a new review of that huge
patch.

4) Which clang-format version should we set as the one used by Xen, so it is
easy for everyone to use it on their hosts?

5) You name it. I think many people in the community can name their points for
and against clang-format.

So, in this attempt, I would suggest the following approach:
I think that I could start sending patches after the latest .clang-format 21 for
some part of Xen, ARM code base for example, using work already done by Luca.
This way:

1) Patches are formatted with clang-format, which is a strong plus.
2) The diff is well maintained and I can still alter it by hand if there are
comments or dislikes.
3) Finally, when the patch is accepted, we can be more confident that
clang-format will find far fewer inconsistencies than if it were just applied to
the "raw" code. Thus, the next time clang-format runs, it will produce a much
smaller patch than before.
4) Finally, introduce clang-format and run it on the leftovers: at this stage,
it would be much easier to discuss every option clang has and the resulting
output it produces.
5) Update existing/add new rules to the Xen coding style based on community
agreements and the results of this activity.

We may define the subsystems to start this activity on and also define an
acceptable size of the patch for review, say 100K. Considering that the longer
the review, the more outdated the patch becomes and will require a new round as
new code comes in.

I would love to hear from the community on this approach and finally get it
done. Not busted.

Stay safe,
Oleksandr Andrushchenko

[1] https://lore.kernel.org/xen-devel/1130763396.5603480.1492372859631.JavaMail.zimbra@research.iiit.ac.in/T/#m1db2521362edd286875acf10296873993226dcf2
[2] https://lists.xenproject.org/archives/html/xen-devel/2017-04/msg01739.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg01862.html
[4] https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg02157.html
[5] https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg00022.html
[6] https://reviews.llvm.org/D91950
[7] https://xenproject.org/blog/clang-format-for-xen-coding-style-checking-scheduled/
[8] https://docs.google.com/document/d/1MDzYkPgfVpI_UuO_3NRXsRLAXqIZ6pj2btF7vsMYj8o
[9] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02294.html
[10] https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00498.html
[11] https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01993.html
[12] https://github.com/llvm/llvm-project/issues/54137#issuecomment-1058564570


