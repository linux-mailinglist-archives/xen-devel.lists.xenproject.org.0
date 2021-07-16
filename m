Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1423CBD87
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 22:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157692.290424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4U8H-0004NG-8c; Fri, 16 Jul 2021 20:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157692.290424; Fri, 16 Jul 2021 20:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4U8H-0004Jh-3I; Fri, 16 Jul 2021 20:08:25 +0000
Received: by outflank-mailman (input) for mailman id 157692;
 Fri, 16 Jul 2021 20:08:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7kP=MI=bounce.vates.fr=bounce-md_30504962.60f1e735.v1-8ee62009a6e34c72819365ee49e5f3db@srs-us1.protection.inumbo.net>)
 id 1m4U8F-0004Jb-9B
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 20:08:23 +0000
Received: from mail145-24.atl61.mandrillapp.com (unknown [198.2.145.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 918ff300-e671-11eb-89b2-12813bfff9fa;
 Fri, 16 Jul 2021 20:08:21 +0000 (UTC)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-24.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4GRMkF0ShZzGlsp7H
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jul 2021 20:08:21 +0000 (GMT)
Received: from [185.78.159.90] by mandrillapp.com id
 8ee62009a6e34c72819365ee49e5f3db; Fri, 16 Jul 2021 20:08:21 +0000
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
X-Inumbo-ID: 918ff300-e671-11eb-89b2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1626466101; i=charles.schulz@vates.fr;
	bh=fKS1WnkjGcSl6goYPQK8gZQbD+rWhmlYpMjnrqsxDMI=;
	h=From:Subject:References:To:Cc:In-Reply-To:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=NxN+ngVRqhOoDtsnlzhX1uNfOp5sF9Uy46W4gwJ0MZo+l0subEhNXqNqMTgj5ZZB4
	 V2OHtq/xshiGzmsgjuvI3Tu3KaS4aPB/u8xCd/97aTi3lBIf50mcI6Sja1gj8QA3fj
	 jS/RN4EukIwRbdh70SnsmBklMAB8btf2JNTjxo5w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1626466101; h=From : 
 Subject : References : To : Cc : In-Reply-To : Message-Id : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=fKS1WnkjGcSl6goYPQK8gZQbD+rWhmlYpMjnrqsxDMI=; 
 b=LJsXpowsk9PHluQ7NJtsoWUfR5/enqAEiCahionzx6fW5e7ej7Z5/MISPKORVPrGBliltg
 9P1AqoZboJGXr8gfBpl3DhRJ4ApqCPhWsJHflPU5ZwhLDdBAJMtMMozBscjU/veJ6S5JSiqj
 0PoBk1FOrbBk0bIsGM7DCfWhD4DCY=
From: "Charles-H. Schulz" <charles.schulz@vates.fr>
Subject: Re: Suggested changes to the admission policy of the vulnerability pre-disclosure list
X-Virus-Scanned: amavisd-new at vates.fr
References: <87r1fzclw0.fsf@vates.fr> <6da30009-d817-f48e-11b4-ba9c92cde93d@suse.com> <87k0lqmmf8.fsf@vates.fr> <ea129173-c1fa-76f3-4964-8491b6728ca0@suse.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: 
In-Reply-To: <ea129173-c1fa-76f3-4964-8491b6728ca0@suse.com>
Message-Id: <87wnpqm380.fsf@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.8ee62009a6e34c72819365ee49e5f3db
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20210716:md
Date: Fri, 16 Jul 2021 20:08:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


Jan Beulich @ 2021-07-16 17:21 CEST:

> On 16.07.2021 15:13, Charles-H. Schulz wrote:
>> Jan Beulich @ 2021-07-16 09:52 CEST:
>>> On 15.07.2021 23:23, Charles-H. Schulz wrote:
>>>> Hello,
>>>>
>>>> I /we /Vates would like to suggest some changes to the policy regarding the
>>>> enrollment to the pre-disclosure mailing list of the Xen Security Team.
>>>>
>>>> We have had some talks with the French national CERT who has a need to be the
>>>> recipient of such a list. This national CERT -and in my experience other
>>>> national CERTs such as the NIST for instance- is in constant contact with a
>>>> large Xen userbase that is mostly made up of large parts of the public sector
>>>> as well as critical infrastructure operators belonging to the private
>>>> sector. For confidentiality reasons they cannot disclose who uses Xen and
>>>> where it is used nor who may be using it internally or within the related
>>>> national cybersecurity authority.
>>>>
>>>> Because of that, their request may not be clear or matching the existing
>>>> criteria for inclusion in the mailing list. National CERTs are trusted
>>>> actors and have historically been among the very first entities to define,
>>>> advocate for and put in practice the very notion of responsible
>>>> disclosure. Much of the current practice of Open Source projects in that
>>>> regard actually stems from CERTs. As part of their policies and processes
>>>> regarding vulnerability disclosure, the notion of confidentiality and
>>>> documented, waterfall-like processes of disclosure is play an integral
>>>> part of
>>>> how they handle informaton and publicity around vulnerability. As a result,
>>>> national CERTs (and the French National CERT) do not spread undisclosed
>>>> vulnerability without following established and agreed-upon processes. Such
>>>> processes include, in our instance, the ones defined and followed by the Xen
>>>> Security Team. Compliance with these are the first criteria to earn trust and
>>>> respect from the ecosystem and the downstream users. You can see an example
>>>> of their work here: https://www.cert.ssi.gouv.fr/
>>>>
>>>> Part of the mission of the French National CERT is to work with
>>>> critical infrastructure providers in securing their IT.
>>>> This kind of expertise entails the securing of these information
>>>> systems before any unforeseen incident as well as after the incident
>>>> (incident remediation).
>>>> None of the tasks involved imply the communication of zero-day types
>>>> of vulnerabilities or vulnerabilities that are unpublished to the
>>>> downstream users.
>>>
>>> Would you mind shedding some light on the benefits of a national CERT
>>> being in the know of unpublished vulnerabilities when they can't share
>>> that knowledge with their downstreams, and hence their downstreams -
>>> as long as they aren't themselves members of our predisclosure list -
>>> would still be zero-dayed at the time of publication of such
>>> vulnerabilities? Shouldn't their advice to their downstreams rather be
>>> to direct them towards applying for pre-disclosure list membership?
>> 
>> In practice, most of the downstream users that the CERTs work with are not
>> going to subscribe to the Xen pre-disclosure list, nor to any pre-disclosure
>> lists of vendors or Open Source Software projects. The downstream users will
>> work with CERTs and various cybersecurity service providers (Security
>> Operations Centers -SOCs- being a typical example) in order for vulnerability
>> discovery, disclosure, patching and later integration of fixes or remediatory
>> measures be managed and applied.
>
> It feels to me as if you didn't really answer my question. You restate
> what I understood is the current state of things, from your initial mail.
> The important aspect "when they can't share that knowledge with their
> downstreams" doesn't get discussed at all. All their downstreams would
> have to wait not only until public disclosure (instead of patching their
> systems - as far as permitted in every individual case - already during
> the embargo period), but there'll be an unavoidable further delay,
> however small or large. I'm having difficulty seeing how this can be in
> everybody's best interest, and hence I can't help suspecting that
> information might flow irrespective of this being prohibited except
> _among_ members of the predisclosure list.

You seem to suspect dishonest or malevolent intent from CERTs.
It's not a proper base for discussion. Therefore I'm not going to hypothesize
on some sharing of information with downstream users which will actually not
happen, because the behaviour you suspect is not an accepted behaviour,
neither from the CERTs themselves nor by professional actors in charge of responsible
disclosure and software security. 

Having said that, you are right indeed that the downstream users will not
patch their systems before some time, usually because CERTs, service
providers or software vendors will notify them or do the work for them. But
that is how things tend to work unfortunately. CERTs act as their source of
information and prompt them to act. One can find it a bit idiotic, and I also
do think that both public and private sector entities should be much more
proactive when it comes to their security. But that's another discussion. 

>
> What I could see is them acting as a proxy for their downstreams, but
> this isn't what you've been asking for, and this would also mean much
> more of a change to the policy.

They act as a resource center for their downstreams, but the information goes
top down, i.e from the software developer to the downstream, not the
opposite. Also how it entails an even bigger change to the list policy is
unclear to me. 

>
>> So a national CERT being in the loop of such advanced, upstream vulnerability
>> pre-disclosures list is pretty much what a CERT does when it's not publishing
>> security advisories of some kind. There are several benefits for a CERT:
>> - threat intelligence and analysis: one vulnerability discovered in one
>>   source may not be an isolated "incident" - it may be connected to a broader
>>   attack made of the exploitation of several vulnerabilities found across
>>   different software stacks. This also providers valuable information about the
>>   threat landscape and relevance. For instance, Xen having several
>>   vulnerability reports is one thing, but what happens if KVM receives a batch
>>   of previously unknown vulnerabilities roughly at the same time? For a CERT,
>>   that level of information can be very important (sometimes "national
>>   security" important)
>> 
>> - because of a CERT being a nexus of several threat information/intelligence
>>   by being as upstream as it can on critical software components, it can then
>>   act -not by disclosing or patching yet unpublished vulnerabilities on its
>>   own- by setting the effective patching and remediation work on the
>>   information systems it is in charge of protecting. In the case of a
>>   national CERT, such as the CERT-FR, that would be the French central
>>   administration networks and information systems. Essentially it would
>>   prioritize the response given the specific level and nature  of threats and the
>>   presence of vulnerabilities on the systems (i.e: first patch MS Office,
>>   then Apache httpd, then the vulnerability XYZ00123 on Xen as it really
>>   affects only a small part of our Xen deployments).
>> 
>> - last but not least, CERTs act as central vulnerability reports
>>   "broadcasters". CERT users/subscribers/clients point to CERTs to receive
>>   their daily security watch and alerts. 
>> 
>>>
>>> As to the actual policy - how would you propose to categorize such
>>> organizations, i.e. how would a new bullet point in the present
>>>
>>> "
>>> This includes:
>>>
>>>     Public hosting providers;
>>>     Large-scale organisational users of Xen;
>>>     Vendors of Xen-based systems;
>>>     Distributors of operating systems with Xen support.
>>> "
>>>
>>> look like in your opinion? This is pretty important imo, as it will
>>> need to be understood who else might then become eligible.
>> 
>> I think it's either a very difficult or a very simple question. If I were to
>> suggest to simply add a line with "national CERTs" meaning: CERTs that
>> operate on behalf of governments for the protection and cybersecurity watch
>> of national administration and critical infrastructures" would that be
>> accepted? I'm happy with that one. It's really two criteria I'm adding: being
>> a CERTs acting wth a clear mandate from a national authority to serve as the
>> national computing emergency response team. Not sure how satisfactory that
>> is.
>
> So what if some entity acted largely like a "national CERT", but wasn't
> called that way?

The what if question is not a valid one, as you are either recognized as a
national CERT (there may sometimes be more than one) or you're not, by
regulatory approval of some sort.  Nobody else can claim they're a national
CERT.
You can be a private CERT, but that's out of the scope of my request. 

> The present items on the list try to use pretty generic
> terms, while your suggestion is pretty specific.

So how is that a problem in our this specific instance?

> I'm further afraid that
> "a clear mandate from a national authority" may not provide any
> justification at all, depending on (often political) view points.
>

That is factually and legally false. A national CERT, just like a national
cybersecurity authority, is appointed by law or decree in a country and it
does not call for any justification not anything political. It is part of the
administration of the country. In France, CERT-FR is part of ANSSI, itself
part of the National Security and Defense Directorate (SGDSN), acting under
the authority of the Prime Minister. In Germany, CERT-DE belongs to the BMI
(Interior Ministry). I believe in the US CERT-US operates within the NIST or
the DHS, etc. 

All the best,

-- 
Charles-H. Schulz
Chief Strategy Officer - CSO
XCP-ng & Xen Orchestra - Vates solutions

