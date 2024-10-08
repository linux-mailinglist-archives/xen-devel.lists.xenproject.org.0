Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFD0994C14
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 14:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813087.1225889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9f3-0004aW-TZ; Tue, 08 Oct 2024 12:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813087.1225889; Tue, 08 Oct 2024 12:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9f3-0004YH-Qy; Tue, 08 Oct 2024 12:49:57 +0000
Received: by outflank-mailman (input) for mailman id 813087;
 Tue, 08 Oct 2024 12:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qE7Y=RE=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1sy9f2-0004YB-7W
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 12:49:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1001115-8573-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 14:49:54 +0200 (CEST)
Received: from [192.168.1.219] (unknown [151.29.43.51])
 by support.bugseng.com (Postfix) with ESMTPSA id 5C8684EE0743;
 Tue,  8 Oct 2024 14:49:53 +0200 (CEST)
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
X-Inumbo-ID: d1001115-8573-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1728391793; bh=sFalaaj0L0R8cRkDDRzsDFz2MqByPFvCoeHbDBl5VKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OaYlCq6v7kxthcLSesbDecUhPvaaWU3tTpNHJQqDePAmFMThQ+a+WE6siQzete461
	 REmng6h9dqlU49dNd1LGbIb20dTEQHTqX/zQ5UkgB4/MW+oNEIUk+GMfz/IOQEoVwu
	 0H9N8Xmw4MXLy5dub2bE/FuPlaClTBmX7NwUI8s45bnuIYQhyBt5+FENCP2rlZMbR8
	 D8CWaJwEx9fw6wZG4HXCt4nKtf++sZy9Nc10BvXQ+6+zvRnmUnq2+qWh8kfR2mnTMd
	 c7jdUks0bfQz5lTl371fYQGyAaBIpYbQDU9Bhskt9NnQjAqG9oiWqFUCeYKgXrf9yv
	 Gc1IHtrVi7YFA==
Message-ID: <9adf139f-cfa4-4e71-a02b-5b7cff898d01@bugseng.com>
Date: Tue, 8 Oct 2024 14:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
 <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com>
 <a8dfe133-6f9b-4a26-918b-d0531d6af918@bugseng.com>
 <8d5e4761-9fc2-4e18-a6c2-9df1822dbbea@suse.com>
 <alpine.DEB.2.22.394.2410011431360.451631@ubuntu-linux-20-04-desktop>
 <02833aad-d6f1-4ffa-8d4a-d8c31e9b0524@suse.com>
 <2f51a8e7-4044-4a84-a541-100799a28012@bugseng.com>
 <1f8f6a0c-980f-43cb-9967-801641f8dbc0@suse.com>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <1f8f6a0c-980f-43cb-9967-801641f8dbc0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-08 07:59, Jan Beulich wrote:
> On 02.10.2024 08:54, Roberto Bagnara wrote:
>> On 2024-10-02 08:09, Jan Beulich wrote:
>>> On 01.10.2024 23:36, Stefano Stabellini wrote:
>>>> On Tue, 1 Oct 2024, Jan Beulich wrote:
>>>>> On 01.10.2024 07:25, Roberto Bagnara wrote:
>>>>>> On 2024-09-30 15:07, Jan Beulich wrote:
>>>>>>> On 30.09.2024 14:49, Federico Serafini wrote:
>>>>>>>> guest_handle_ok()'s expansion contains a sizeof() involving its
>>>>>>>> first argument which is guest_handle_cast().
>>>>>>>> The expansion of the latter, in turn, contains a variable
>>>>>>>> initialization.
>>>>>>>>
>>>>>>>> Since MISRA considers the initialization (even of a local variable)
>>>>>>>> a side effect, the chain of expansions mentioned above violates
>>>>>>>> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
>>>>>>>> contain any expression which has potential side effect).
>>>>>>>
>>>>>>> I'm afraid I need to ask for clarification of terminology and alike here.
>>>>>>> While the Misra doc has a section on Persistent Side Effects in its
>>>>>>> Glossary appendix, what constitutes a side effect from its pov isn't
>>>>>>> really spelled out anywhere. Which in turn raises the question whether it
>>>>>>> is indeed Misra (and not just Eclair) which deems initialization a side
>>>>>>> effect. This is even more so relevant as 13.6 talks of only expressions,
>>>>>>> yet initializers fall under declarations (in turn involving an expression
>>>>>>> on the rhs of the equal sign).
>>>>>>>
>>>>>>> All the same of course affects patch 2 then, too.
>>>>>>
>>>>>> MISRA C leaves the definition of "side effect" to the C Standard.
>>>>>> E.g., C18 5.1.2.3p2:
>>>>>>
>>>>>>      Accessing a volatile object, modifying an object, modifying a file,
>>>>>>      or calling a function that does any of those operations are all
>>>>>>      side effects,[omitted irrelevant footnote reference] which are
>>>>>>      changes in the state of the execution environment.
>>>>>>
>>>>>> The MISRA C:2012/2023 Glossary entry for "Persistent side effect"
>>>>>> indirectly confirms that initialization is always a side effect.
>>>>>
>>>>> Hmm, that's interesting: There's indeed an example with an initializer
>>>>> there. Yet to me the text you quote from the C standard does not say
>>>>> that initialization is a side effect - it would be "modifying an
>>>>> object" aiui, yet ahead of initialization being complete the object
>>>>> doesn't "exist" imo, and hence can be "modified" only afterwards.
>>>>
>>>> I feel it's becoming a bit too philosophical. Since there's some room
>>>> for interpretation and only two violations left to address, I believe
>>>> it's best to stick with the stricter interpretation of the definition.
>>>> Therefore, I'd proceed with this series in its current form.
>>>
>>> Proceeding with the series in its current form may be okay (as you say,
>>> you view the changes as readability improvements anyway), but imo the
>>> interpretation needs settling on no matter what. In fact even for these
>>> two patches it may affect what their descriptions ought to say (would
>>> be nice imo to avoid permanently recording potentially misleading
>>> information by committing as is). And of course clarity would help
>>> dealing with future instances that might appear. I take it you realize
>>> that if someone had submitted a patch adding code similar to the
>>> original forms of what's being altered here, it would be relatively
>>> unlikely for a reviewer to spot the issue. IOW here we're making
>>> ourselves heavily dependent upon Eclair spotting (supposed) issues,
>>> adding extra work and delays for such changes to go in.
>>
>> You can do two things to obtain a second opinion:
>>
>> 1) Use the MISRA forum (here is the link to the forum
>>      section devoted to the side-effect rules of MISRA C:2012
>>      and MISRA C:2023 (https://forum.misra.org.uk/forumdisplay.php?fid=168).
>>      The MISRA C Working Group will, in due course, provide
>>      you with an official answer to your questions about what,
>>      for the interpretation of Rule 13.6, has to be considered
>>      a side effect.
>>
>> 2) Reach out to your ISO National Body and try to obtain
>>      an official answer from ISO/IEC JTC1/SC22/WG14 (the
>>      international standardization working group for the
>>      programming language C) to your questions about what the
>>      C Standard considers to be side effects.
> 
> I took the latter route, and to my (positive) surprise I got back an answer
> the same day. There was a request for someone to confirm, but so far I didn't
> see further replies. Since this is a German institution I raised the question
> in German and got back an answer in German (attached); I've tried my best to
> translate this without falsifying anything, but I've omitted non-technical
> parts:
> 
> "Initialization of an object is never a side effect of the initialization
> by itself. Of course expressions used for initialization can themselves have
> side effects on other objects.
> 
> @Andreas: Do you agree? C after all has a far simpler object model than C++.
> The (potential) change in object representation (i.e. the bytes underlying
> the object) is not a side effect of object initialization, but its primary
> purpose."
> 
> Further for Misra she added a reference to a Swiss person, but I think with
> Bugseng we have sufficient expertise there.

Unfortunately, the (translation of the) answer you received adds
confusion to previous confusion: who answered has highlighted the
"side" part of the term, which is indeed relevant in computer science,
but not for the C standard.  To the point that the same argument could
be used to deny that ++i has a side effect because the increment is
the "primary" effect...

Part of the confusion is maybe in the the following paragraph Jan
wrote earlier:

 > Hmm, that's interesting: There's indeed an example with an initializer
 > there. Yet to me the text you quote from the C standard does not say
 > that initialization is a side effect - it would be "modifying an
 > object" aiui, yet ahead of initialization being complete the object
 > doesn't "exist" imo, and hence can be "modified" only afterwards.

In C, it is not true that the object does not exist ahead of
initialization.  Try the following:

extern int f(int* p);

int main() {
   int i = f(&i);
}

Kind regards,

    Roberto

