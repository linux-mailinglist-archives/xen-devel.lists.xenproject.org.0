Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F353D3D34
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 18:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160154.294461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6xit-00058T-0I; Fri, 23 Jul 2021 16:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160154.294461; Fri, 23 Jul 2021 16:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6xis-00056C-TY; Fri, 23 Jul 2021 16:08:26 +0000
Received: by outflank-mailman (input) for mailman id 160154;
 Fri, 23 Jul 2021 16:08:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIeu=MP=bounce.vates.fr=bounce-md_30504962.60fae976.v1-7cdb1def0caa4857ac7531b18568edfc@srs-us1.protection.inumbo.net>)
 id 1m6xiq-000566-RC
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 16:08:25 +0000
Received: from mail179-27.suw41.mandrillapp.com (unknown [198.2.179.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 342405a0-ebd0-11eb-9430-12813bfff9fa;
 Fri, 23 Jul 2021 16:08:22 +0000 (UTC)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-27.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4GWZ463gycz6CQ3pH
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jul 2021 16:08:22 +0000 (GMT)
Received: from [185.78.159.90] by mandrillapp.com id
 7cdb1def0caa4857ac7531b18568edfc; Fri, 23 Jul 2021 16:08:22 +0000
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
X-Inumbo-ID: 342405a0-ebd0-11eb-9430-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1627056502; i=charles.schulz@vates.fr;
	bh=g6105xxJnlxIF25iosmsfZnR1NOcnemEtu1xC39+Mqk=;
	h=From:Subject:Message-Id:To:Cc:In-Reply-To:References:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=RnM2PaL5N5Ng3mQsQWk6bzeE0YXwAeZFc47HINNKXLfaWcGDxxx2BTDP/g9hqZFCw
	 V6uibD+IilZ6zUSSqbaHnwhEd9N14XlSmn4v0usQLUxgmfCRsEgwiyJzk7voPQzGN2
	 B7Rk8Mksilta2b3Gcau6MF3whjVMnkRpvEcNsxzc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1627056502; h=From : 
 Subject : Message-Id : To : Cc : In-Reply-To : References : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=g6105xxJnlxIF25iosmsfZnR1NOcnemEtu1xC39+Mqk=; 
 b=AbbFjpJNweQ2yG/qm60k/WvvhPEuATaPMGzXRKSKAFJHMyR0XffllmN0r9QxZkT6yRyvEo
 ybUgLVRLuv4S096panmxz1dpL+AByfBP+/q2KFBvd6wgQIvXMHCldE/Yq4IqwumAQwuPAa0s
 0OmBJkvjNL2btSswXsiFsUeATYcJE=
From: "Charles-H. Schulz" <charles.schulz@vates.fr>
Subject: Re: Suggested changes to the admission policy of the vulnerability pre-disclosure list
X-Virus-Scanned: amavisd-new at vates.fr
Message-Id: <233d10c1a5ea82af845266740c28155cfc95ca63.camel@vates.fr>
To: George Dunlap <dunlapg@umich.edu>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <CAFLBxZaURZgLYPbKjxBv_btNPzX9D5w3gFCsVrTH0Xw=RfgPug@mail.gmail.com>
References: <87r1fzclw0.fsf@vates.fr> <6da30009-d817-f48e-11b4-ba9c92cde93d@suse.com> <87k0lqmmf8.fsf@vates.fr> <ea129173-c1fa-76f3-4964-8491b6728ca0@suse.com> <87wnpqm380.fsf@vates.fr> <14d1b95e-9d3a-8464-010b-d7796a26a8c4@suse.com> <87tukqy9gw.fsf@vates.fr> <CAFLBxZaURZgLYPbKjxBv_btNPzX9D5w3gFCsVrTH0Xw=RfgPug@mail.gmail.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.7cdb1def0caa4857ac7531b18568edfc
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20210723:md
Date: Fri, 23 Jul 2021 16:08:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Georges,

Le vendredi 23 juillet 2021 =C3=A0 14:09 +0100, George Dunlap a =C3=A9crit=
=C2=A0:
> 
> 
> On Mon, Jul 19, 2021 at 9:49 AM Charles-H. Schulz
> <charles.schulz@vates.fr> wrote:
> > 
> > Jan Beulich @ 2021-07-19 08:44 CEST:
> > 
> > > > 
> > > > They act as a resource center for their downstreams, but the
> > information goes
> > > > top down, i.e from the software developer to the downstream, not
> > the
> > > > opposite. Also how it entails an even bigger change to the list
> > policy is
> > > > unclear to me. 
> > > 
> > > For things to make sense (as you seem to agree with as per further
> > up),
> > > if their downstreams aren't to subscribe to our (and perhaps other)
> > > pre-disclosure list themselves, the CERTs would need to act as a
> > proxy,
> > > in that they'd be permitted to relay the information before the
> > embargo
> > > ends. I didn't think there would be much of a difficulty seeing
> > that
> > > this would be more of a change to the policy.
> > 
> > Indeed, because you assume that CERTs will communicate information
> > before
> > they are public. But they don't work that way in that they act as the
> > legal
> > and actual hub for the public information and listing of
> > vulnerabilities
> > reports (CVEs etc.) What they do before the end of the embargo date I
> > already
> > explained, and that specifically does not entail sharing the
> > information with
> > downstream users. So to me there is no big change of policy - this is
> > the
> > highway patrol sharing the license plate numbers of criminals or
> > suspects
> > with the city police. 
> > 
> 
> 
> Nonetheless, you still haven't made a clear case why being informed of
> the vulnerabilities *under embargo* is necessary.=C2=A0 Anyone can sign u=
p
> to the xen-announce mailing list and receive notifications of XSAs at
> the moment the embargo lifts.=C2=A0 We advertise *that new advisories are
> coming out* on the main XSA webpage [1] and in a machine-readable JSON
> file [2] as soon as the predisclosure happens.=C2=A0 (There are also
> libraries [3] to consume the JSON file, and an example program [4]
> which could be run in a cron job to alert someone to upcoming public
> XSA disclosures.) The delta between the predisclosure and the public
> disclosure is typically two weeks.
> 
> Someone could argue that all of the activities you describe -- looking
> for larger patterns of vulnerabilities, acting as a clearinghouse /
> notification channel / advisory system for downstreams, etc -- could be
> done by observing the public disclosures, particularly if suitable
> people were alerted to upcoming public disclosures (and thus ready to
> process them as soon as they come out).=C2=A0 What is needed is to make t=
he
> case that this is insufficient -- that having the extra two weeks to
> process things before the public disclosure will be of material benefit
> in those activities.
> 
> (Hopefully it should be clear that I'm inviting you to make such a
> case.)


I had highlighted two reasons. Quoting myself: 

"So a national CERT being in the loop of such advanced, upstream
vulnerability pre-disclosures list is pretty much what a CERT does when
it's not publishing security advisories of some kind. There are several
benefits for a CERT:
- threat intelligence and analysis: one vulnerability discovered in one
  source may not be an isolated "incident" - it may be connected to a
broader attack made of the exploitation of several vulnerabilities
found across
  different software stacks. This also providers valuable information
about the
  threat landscape and relevance. For instance, Xen having several
  vulnerability reports is one thing, but what happens if KVM receives
a batch
  of previously unknown vulnerabilities roughly at the same time? For a
CERT,
  that level of information can be very important (sometimes "national
  security" important)

- because of a CERT being a nexus of several threat
information/intelligence
  by being as upstream as it can on critical software components, it
can then
  act -not by disclosing or patching yet unpublished vulnerabilities on
its
  own- by setting the effective patching and remediation work on the
  information systems it is in charge of protecting. In the case of a
  national CERT, such as the CERT-FR, that would be the French central
  administration networks and information systems. Essentially it would
  prioritize the response given the specific level and nature  of
threats and the
  presence of vulnerabilities on the systems (i.e: first patch MS
Office,
  then Apache httpd, then the vulnerability XYZ00123 on Xen as it
really
  affects only a small part of our Xen deployments)."

To this, I add a third, very specific one: CERT-FR is ultimately in
charge of protecting a set of governmental secure systems relying on
Xen.

I hope this is clearer now. 



> 
> [1] https://xenbits.xenproject.org/xsa/
> [2] https://xenbits.xenproject.org/xsa/xsa.json
> [3]
> https://gitlab.com/xen-project/people/gdunlap/go-xenlib/-/tree/master/xsa=
lib
> [4]
> https://gitlab.com/xen-project/people/gdunlap/go-xenlib/-/tree/master/scr=
ipts/xsa-alert
> =C2=A0
> > > > The what if question is not a valid one, as you are either
> > recognized as a
> > > > national CERT (there may sometimes be more than one) or you're
> > not, by
> > > > regulatory approval of some sort.=C2=A0 Nobody else can claim
> > > > they're a
> > national
> > > > CERT.
> > > > You can be a private CERT, but that's out of the scope of my
> > request. 
> > > > 
> > > > > The present items on the list try to use pretty generic
> > > > > terms, while your suggestion is pretty specific.
> > > > 
> > > > So how is that a problem in our this specific instance?
> > > 
> > > Why would we exclude private CERTs? I could easily see there
> > > being
> > > countries which have no "national CERT" (for a variety of
> > > reasons),
> > > with some private / non-government organization jumping in.
> > > 
> > 
> > This is a good point I'm not making :)
> > My request is solely about national CERTs, I do not feel that I
> > have
> > enough
> > standing here requesting that private CERTs be added to the list,
> > although
> > I'm sure there's a point to be made here as well.
> > 
> 
> 
> Jan, I think if you think it's better to include "private CERTs" (do
> such things exist?), then it should be up to you (or someone else in
> favor of such a thing) to craft the criteria for inclusion.=C2=A0 I
> personally think limiting ourselves to national CERTs to begin with
> is fine.
> 
> In any case, what's needed to move things forward (absent further
> discussion) is:
> 
> 1. Specific proposed changes to the security policy to be hammered
> out
> 
> 2. Someone to hold a project-wide vote, in accordance with the
> XenProject Governance Document.
> 
> Normally #2 would be me, but today is my last day until January.

Thank you. I don't think we're in a rush but if we can do this before
January it's perhaps better. 


Best regards,

-- 
Charles-H. Schulz
Chief Strategy Officer- CSO
XCP-ng & Xen Orchestra - Vates solutions


