Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA48115DA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 16:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654077.1020724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDQtm-0005PE-E9; Wed, 13 Dec 2023 15:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654077.1020724; Wed, 13 Dec 2023 15:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDQtm-0005M6-Au; Wed, 13 Dec 2023 15:11:46 +0000
Received: by outflank-mailman (input) for mailman id 654077;
 Wed, 13 Dec 2023 15:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UN0u=HY=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1rDQtk-0005Lh-Qq
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 15:11:44 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec61cf8a-99c9-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 16:11:43 +0100 (CET)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-67a9cba087aso49059736d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 07:11:43 -0800 (PST)
Received: from [10.10.1.94] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 c11-20020a0ce64b000000b0067ab7eada1dsm5158876qvn.59.2023.12.13.07.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 07:11:42 -0800 (PST)
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
X-Inumbo-ID: ec61cf8a-99c9-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702480302; x=1703085102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73Cstw290dL3F2NVRvr54YyF04NGyknLRrd77sTMgqY=;
        b=ATkZPzgSvT3u3wZRAXmlRusNQMy2WiK3DC8KC21/wRa31B6K7QKlMUEOVzVJZmkB1G
         gjxYzDLv3qqbXN5VV+/p9/AmH5fLBFoEFqOX1RJ9kiTQsaFI5xZA7z2ialVJDnYMlsrs
         VwA+nTtpDVhQqE/6EM7nroawwPZ0ZDnXhaEWqQ7Ie//TSomko5x5hkI9s1pQSgILCzvb
         bEIoAnWLbhrE0iDL/oNi8097ft3COaSYnyy6X/hACAyRHt7vy3DpVywaHaLTRcu6o5y8
         dHGO2MOrsXAhJa+HWvWkAhgkVmKyKF7yIHmtODs055Tq/ke3cqwx+0Q0rsFE1oOHAHRy
         9tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702480302; x=1703085102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73Cstw290dL3F2NVRvr54YyF04NGyknLRrd77sTMgqY=;
        b=ec7bDGTuZM1H6hSWJ97wxOrwbiEPh1lEGlDEQlCFD0crNujuP4p0UlVF9l9zNC43aN
         DrtEEUKp24pwvyK53YNVV4U1Dvlud+V+8sSN4tovIsiTM7h1J22kP/ORdq4hvF+AH2Pa
         GU+afmN20qD8JDkgMLJf6r6EU0hv0oQ/q0bqYTmjahQd5z5BKR3a+sbgjtK3jD+1aSwP
         uZYmvLP72Cth0n83QQo+3a2JT+yH40KaiGw+u8t+lhiIvAsszblvbjiFFjJ6FY+aR7dI
         JJ/3XC1VZaNcYWqlNS5MYTgtjUsOrBdE+i1h18NOp3/SRmFEPgPSExasBkI2TSoNL3hi
         +BPQ==
X-Gm-Message-State: AOJu0YzKl88I4XhOij/Ihk8AIAgdI2dV22emfCaTrQYhXlYwfPBxlDx6
	ErZhanz5dbNmJTTN0uahzdk=
X-Google-Smtp-Source: AGHT+IFjCYiMzYjaXbyYSHWcaFPtcgZUOF/2El6isre/4/9pxaWQiUQJhfLANx39wZXkWdNkq5oeIQ==
X-Received: by 2002:a0c:eb0c:0:b0:67a:b4f5:577a with SMTP id j12-20020a0ceb0c000000b0067ab4f5577amr9363106qvp.88.1702480302337;
        Wed, 13 Dec 2023 07:11:42 -0800 (PST)
Message-ID: <41179178-a1cd-4b9f-8955-f9f2acdb4967@gmail.com>
Date: Wed, 13 Dec 2023 10:11:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org,
 committers@xenproject.org
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
From: "dpsmith.dev" <dpsmith.dev@gmail.com>
In-Reply-To: <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/1/23 05:27, George Dunlap wrote:
> On Thu, Nov 30, 2023 at 10:28 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> Hi all,
>>
>> This vote is in the context of this thread:
>> https://marc.info/?l=xen-devel&m=169213351810075
> 
> To add slightly more context.
> 
> The issue here is more than a simple "should we use the word broken or
> not".  We already have a mechanism for resolving this, which is that
> the maintainers of the code in question (in this case THE REST), can
> vote.  In any case, on that thread, four of THE REST were opposed to
> using the word "broken" in technical documentation, and one in favor.
> 
> However -- and I hope I'm not misrepresenting Andy here -- Andy thinks
> that position is preposterous, and that this kind of request is a
> clear example of a kind of a pattern of unreasonable review which is
> damaging to the project and driving away contributors.  Daniel Smith
> at least supported the use of the word "broken" in that thread as
> well; and (hoping I'm not reading too much into it), the tone of
> writing also suggests a level of exasperation.  Andy seems to think
> there are others who agree with him as well. This specific issue has
> been sort of simmering in the background since August, and we're
> trying to get it resolved.
> 
> In my discussions with Andy, trying to understand his point of view,
> we always reach a sort of impasse, where Andy thinks the majority of
> contributors would agree with him, that insisting on removing "broken"
> is a completely unreasonable request; and I think that the majority of
> contributors would agree with me, that insisting on removing "broken"
> is a simple enforcement of long-established norms about how technical
> documentation is written.
> 
> Everyone would agree, I think, that community norms should be upheld;
> everyone agrees that unreasonable nitpicking or imposition of personal
> idiosyncratic preferences should be avoided; but in this case we
> disagree about whether "don't use broken in technical documentation"
> is a "community norm" or "personal idiosyncratic preference".
> 
> So the idea was to run a test and find out.  If most people in the
> community really do think that "broken" is suitable for the
> documentation in our project, then of course the maintainers should
> stop objecting to that kind of language.  If most of the people in the
> community think that "broken" is *not* suitable for technical
> documentation, then of course this isn't an example of unreasonable
> review (although other instances may be).
> 
> Fundamentally a lot of these sorts of issues come up because different
> parts of the community are not "on the same page".  The question is,
> how do we *get* on the same page?  I don't want to have a vote or poll
> over every little issue; but if we really have a deep 2(+) / 4 split,
> it's probably worth having some sort of a discussion to figure out
> where we are.  Hence the poll.
> 
> I would have worded it differently; but nonetheless, it's a sort of
> single data point.  What do you as the community think?  Is "this
> hypercall is broken" the sort of thing you'd like us to prevent, or is
> that being unreasonable?
> 

While this survey may have been released with the best of intentions, I 
can't help but to find it poorly conceived. Banning words, whether in 
general or for a specific instance, is not something to be taken lightly 
via "informal vote", and in my humble opinion is not addressing the 
underlying issue at hand. In fact, and not to be overly dire, the result 
is that it has put the project at the verge of a fork and/or collapse of 
the project as a whole. This survey must be immediately recalled, all 
results destroyed and anyone that has reviewed said results, should not 
discuss them, either publicly or privately.

I do not feel that a rush to form a Technical Advisory Board would 
address the larger issue at hand either. I would instead call for a 
bounded-duration working group to be convened, with an explicit charter 
to collect and vet community issues. Individuals may express any and all 
grievances publicly or privately to the working group. The goal for this 
group would be to listen, debate, and ultimately draft a set of 
recommendations for governance and/or other measures to achieve 
community reconciliation.  As such, the makeup of said working group 
must be those with a cultural understanding of Xen, but a level removed 
from the day-to-day happenings on xen-devel.

For instance, I would nominate Rich Persaud to chair and oversee 
membership of the working group. To my knowledge, Rich is the longest 
standing (XenSource, 2005) active community member that has continually 
worked for the betterment of the community as a whole. He is not a 
maintainer nor a direct code contributor, which I believe best positions 
him to be objective when considering disputes. From there, not to thrust 
this upon anyone unbeknownst, but I would suggest Xen contributors like 
Christopher Clark, David Woodhouse, and Tamas Lengyl as working group 
candidates for Rich to consider.  Each could apply their experience from 
Xen and other OSS communities, and none are immersed in the day-to-day 
minutiae of Xen development.

Very Respectfully,
Daniel P. Smith

