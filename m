Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0FB3CCF72
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 10:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158216.291372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Oxt-0007Hz-JO; Mon, 19 Jul 2021 08:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158216.291372; Mon, 19 Jul 2021 08:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Oxt-0007Ft-GG; Mon, 19 Jul 2021 08:49:29 +0000
Received: by outflank-mailman (input) for mailman id 158216;
 Mon, 19 Jul 2021 08:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lm8=ML=bounce.vates.fr=bounce-md_30504962.60f53c94.v1-75dba24ea1a2454d9d5f9b20718192af@srs-us1.protection.inumbo.net>)
 id 1m5Oxr-0007Fn-61
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 08:49:27 +0000
Received: from mail179-5.suw41.mandrillapp.com (unknown [198.2.179.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e60403d3-26c9-40e3-a8f8-0f1fbf08d077;
 Mon, 19 Jul 2021 08:49:25 +0000 (UTC)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-5.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4GSwWT08VgzG0CL4t
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jul 2021 08:49:25 +0000 (GMT)
Received: from [185.78.159.90] by mandrillapp.com id
 75dba24ea1a2454d9d5f9b20718192af; Mon, 19 Jul 2021 08:49:24 +0000
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
X-Inumbo-ID: e60403d3-26c9-40e3-a8f8-0f1fbf08d077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1626684565; i=charles.schulz@vates.fr;
	bh=oUlxRh+eC5/WZw+QbhycRSODn986MN+o1py8nDXJIIA=;
	h=From:Subject:References:To:Cc:In-Reply-To:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=j1sAx4G7EcSVSvWNh1S1O/QR5wP7Dh+kUh/GVwqoqraFVMRV4TtLS4cgrzQ5Rf7WV
	 zidcyTURFn0u0FM8Q29Fd0s6d1723HaByjIWQg7BZzgarOX22pEyHCo2jFB0KKCFo9
	 uhvagKBQY1nhWPv7kTHvPCo2ZcxYFq+Iwcxw9r1w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1626684564; h=From : 
 Subject : References : To : Cc : In-Reply-To : Message-Id : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=oUlxRh+eC5/WZw+QbhycRSODn986MN+o1py8nDXJIIA=; 
 b=nk0zRR7V2so40mxzOn1yUMzbrmX4D1hmnWmpr90eZI6lNdgGSmhzR09RJ9CmJXeA91wOIx
 OcGdYF41HVvADORx2uehCcuCEN+Vamtr/X9wLqbRKANhFC5sjbzdEbSc6DqBv5yHN30rkNUa
 dF+HAnuZBHTKJaXzGNSEtFDh9eKSg=
From: "Charles-H. Schulz" <charles.schulz@vates.fr>
Subject: Re: Suggested changes to the admission policy of the vulnerability pre-disclosure list
X-Virus-Scanned: amavisd-new at vates.fr
References: <87r1fzclw0.fsf@vates.fr> <6da30009-d817-f48e-11b4-ba9c92cde93d@suse.com> <87k0lqmmf8.fsf@vates.fr> <ea129173-c1fa-76f3-4964-8491b6728ca0@suse.com> <87wnpqm380.fsf@vates.fr> <14d1b95e-9d3a-8464-010b-d7796a26a8c4@suse.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: 
In-Reply-To: <14d1b95e-9d3a-8464-010b-d7796a26a8c4@suse.com>
Message-Id: <87tukqy9gw.fsf@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.75dba24ea1a2454d9d5f9b20718192af
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20210719:md
Date: Mon, 19 Jul 2021 08:49:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


Jan Beulich @ 2021-07-19 08:44 CEST:

> On 16.07.2021 22:08, Charles-H. Schulz wrote:
>> Jan Beulich @ 2021-07-16 17:21 CEST:
>>> On 16.07.2021 15:13, Charles-H. Schulz wrote:
>>>> Jan Beulich @ 2021-07-16 09:52 CEST:
>>>>> On 15.07.2021 23:23, Charles-H. Schulz wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I /we /Vates would like to suggest some changes to the policy regarding the
>>>>>> enrollment to the pre-disclosure mailing list of the Xen Security Team.
>>>>>>
>>>>>> We have had some talks with the French national CERT who has a need to be the
>>>>>> recipient of such a list. This national CERT -and in my experience other
>>>>>> national CERTs such as the NIST for instance- is in constant contact with a
>>>>>> large Xen userbase that is mostly made up of large parts of the public sector
>>>>>> as well as critical infrastructure operators belonging to the private
>>>>>> sector. For confidentiality reasons they cannot disclose who uses Xen and
>>>>>> where it is used nor who may be using it internally or within the related
>>>>>> national cybersecurity authority.
>>>>>>
>>>>>> Because of that, their request may not be clear or matching the existing
>>>>>> criteria for inclusion in the mailing list. National CERTs are trusted
>>>>>> actors and have historically been among the very first entities to define,
>>>>>> advocate for and put in practice the very notion of responsible
>>>>>> disclosure. Much of the current practice of Open Source projects in that
>>>>>> regard actually stems from CERTs. As part of their policies and processes
>>>>>> regarding vulnerability disclosure, the notion of confidentiality and
>>>>>> documented, waterfall-like processes of disclosure is play an integral
>>>>>> part of
>>>>>> how they handle informaton and publicity around vulnerability. As a result,
>>>>>> national CERTs (and the French National CERT) do not spread undisclosed
>>>>>> vulnerability without following established and agreed-upon processes. Such
>>>>>> processes include, in our instance, the ones defined and followed by the Xen
>>>>>> Security Team. Compliance with these are the first criteria to earn trust and
>>>>>> respect from the ecosystem and the downstream users. You can see an example
>>>>>> of their work here: https://www.cert.ssi.gouv.fr/
>>>>>>
>>>>>> Part of the mission of the French National CERT is to work with
>>>>>> critical infrastructure providers in securing their IT.
>>>>>> This kind of expertise entails the securing of these information
>>>>>> systems before any unforeseen incident as well as after the incident
>>>>>> (incident remediation).
>>>>>> None of the tasks involved imply the communication of zero-day types
>>>>>> of vulnerabilities or vulnerabilities that are unpublished to the
>>>>>> downstream users.
>>>>>
>>>>> Would you mind shedding some light on the benefits of a national CERT
>>>>> being in the know of unpublished vulnerabilities when they can't share
>>>>> that knowledge with their downstreams, and hence their downstreams -
>>>>> as long as they aren't themselves members of our predisclosure list -
>>>>> would still be zero-dayed at the time of publication of such
>>>>> vulnerabilities? Shouldn't their advice to their downstreams rather be
>>>>> to direct them towards applying for pre-disclosure list membership?
>>>>
>>>> In practice, most of the downstream users that the CERTs work with are not
>>>> going to subscribe to the Xen pre-disclosure list, nor to any pre-disclosure
>>>> lists of vendors or Open Source Software projects. The downstream users will
>>>> work with CERTs and various cybersecurity service providers (Security
>>>> Operations Centers -SOCs- being a typical example) in order for vulnerability
>>>> discovery, disclosure, patching and later integration of fixes or remediatory
>>>> measures be managed and applied.
>>>
>>> It feels to me as if you didn't really answer my question. You restate
>>> what I understood is the current state of things, from your initial mail.
>>> The important aspect "when they can't share that knowledge with their
>>> downstreams" doesn't get discussed at all. All their downstreams would
>>> have to wait not only until public disclosure (instead of patching their
>>> systems - as far as permitted in every individual case - already during
>>> the embargo period), but there'll be an unavoidable further delay,
>>> however small or large. I'm having difficulty seeing how this can be in
>>> everybody's best interest, and hence I can't help suspecting that
>>> information might flow irrespective of this being prohibited except
>>> _among_ members of the predisclosure list.
>> 
>> You seem to suspect dishonest or malevolent intent from CERTs.
>> It's not a proper base for discussion. Therefore I'm not going to hypothesize
>> on some sharing of information with downstream users which will actually not
>> happen, because the behaviour you suspect is not an accepted behaviour,
>> neither from the CERTs themselves nor by professional actors in charge of responsible
>> disclosure and software security. 
>> 
>> Having said that, you are right indeed that the downstream users will not
>> patch their systems before some time, usually because CERTs, service
>> providers or software vendors will notify them or do the work for them. But
>> that is how things tend to work unfortunately. CERTs act as their source of
>> information and prompt them to act. One can find it a bit idiotic, and I also
>> do think that both public and private sector entities should be much more
>> proactive when it comes to their security. But that's another discussion. 
>
> Well, if it's really (and intentionally) like this, then my suspicion
> above would indeed be wrong.
>
>>> What I could see is them acting as a proxy for their downstreams, but
>>> this isn't what you've been asking for, and this would also mean much
>>> more of a change to the policy.
>> 
>> They act as a resource center for their downstreams, but the information goes
>> top down, i.e from the software developer to the downstream, not the
>> opposite. Also how it entails an even bigger change to the list policy is
>> unclear to me. 
>
> For things to make sense (as you seem to agree with as per further up),
> if their downstreams aren't to subscribe to our (and perhaps other)
> pre-disclosure list themselves, the CERTs would need to act as a proxy,
> in that they'd be permitted to relay the information before the embargo
> ends. I didn't think there would be much of a difficulty seeing that
> this would be more of a change to the policy.

Indeed, because you assume that CERTs will communicate information before
they are public. But they don't work that way in that they act as the legal
and actual hub for the public information and listing of vulnerabilities
reports (CVEs etc.) What they do before the end of the embargo date I already
explained, and that specifically does not entail sharing the information with
downstream users. So to me there is no big change of policy - this is the
highway patrol sharing the license plate numbers of criminals or suspects
with the city police. 

>
>>>>> As to the actual policy - how would you propose to categorize such
>>>>> organizations, i.e. how would a new bullet point in the present
>>>>>
>>>>> "
>>>>> This includes:
>>>>>
>>>>>     Public hosting providers;
>>>>>     Large-scale organisational users of Xen;
>>>>>     Vendors of Xen-based systems;
>>>>>     Distributors of operating systems with Xen support.
>>>>> "
>>>>>
>>>>> look like in your opinion? This is pretty important imo, as it will
>>>>> need to be understood who else might then become eligible.
>>>>
>>>> I think it's either a very difficult or a very simple question. If I were to
>>>> suggest to simply add a line with "national CERTs" meaning: CERTs that
>>>> operate on behalf of governments for the protection and cybersecurity watch
>>>> of national administration and critical infrastructures" would that be
>>>> accepted? I'm happy with that one. It's really two criteria I'm adding: being
>>>> a CERTs acting wth a clear mandate from a national authority to serve as the
>>>> national computing emergency response team. Not sure how satisfactory that
>>>> is.
>>>
>>> So what if some entity acted largely like a "national CERT", but wasn't
>>> called that way?
>> 
>> The what if question is not a valid one, as you are either recognized as a
>> national CERT (there may sometimes be more than one) or you're not, by
>> regulatory approval of some sort.  Nobody else can claim they're a national
>> CERT.
>> You can be a private CERT, but that's out of the scope of my request. 
>> 
>>> The present items on the list try to use pretty generic
>>> terms, while your suggestion is pretty specific.
>> 
>> So how is that a problem in our this specific instance?
>
> Why would we exclude private CERTs? I could easily see there being
> countries which have no "national CERT" (for a variety of reasons),
> with some private / non-government organization jumping in.
>

This is a good point I'm not making :)
My request is solely about national CERTs, I do not feel that I have enough
standing here requesting that private CERTs be added to the list, although
I'm sure there's a point to be made here as well.

>>> I'm further afraid that
>>> "a clear mandate from a national authority" may not provide any
>>> justification at all, depending on (often political) view points.
>>>
>> 
>> That is factually and legally false. A national CERT, just like a national
>> cybersecurity authority, is appointed by law or decree in a country and it
>> does not call for any justification not anything political. It is part of the
>> administration of the country. In France, CERT-FR is part of ANSSI, itself
>> part of the National Security and Defense Directorate (SGDSN), acting under
>> the authority of the Prime Minister. In Germany, CERT-DE belongs to the BMI
>> (Interior Ministry). I believe in the US CERT-US operates within the NIST or
>> the DHS, etc. 
>
> There is very much a political aspect in here, imo: "Appointed by
> law or decree in a country" can be against law in another country.
> Knowledge of vulnerabilities can be used not only to improve
> cybersecurity.
>

The fact that one national law is contrary to another national law has no
bearing on the Xen Security Team I think. My point was that there is nothing
political in understanding that national CERTs are established, chartered,
regular actors whose primary function is establishing trust and improving
cybersecurity. 

What you're alluding to are behaviours we are all well aware of, but in
practice you will not find those in national CERTs, which are public entities
with a public service mission acting in public in routine and emergency
contexts. Any director of a national CERT can stand up in front of the
Parliament of his/her coutry and clearly explain what they do. It's not
necessarily the case for the other actors you mention, who will have a large
part of their activities classified. So I would say this is a case for
comparing the CIA and the NYC Fire Department. 

All the best,
-- 
Charles-H. Schulz
Chief Strategy Officer - CSO
XCP-ng & Xen Orchestra - Vates solutions

