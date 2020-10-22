Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61405295F49
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 15:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10423.27688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVaGH-0000Fl-8g; Thu, 22 Oct 2020 13:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10423.27688; Thu, 22 Oct 2020 13:04:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVaGH-0000FM-5D; Thu, 22 Oct 2020 13:04:09 +0000
Received: by outflank-mailman (input) for mailman id 10423;
 Thu, 22 Oct 2020 13:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DD7K=D5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1kVaGE-0000FH-Vs
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:04:07 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0c1f949-0c04-4e47-a16d-39698c72a1ab;
 Thu, 22 Oct 2020 13:04:05 +0000 (UTC)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1603371832291764.96684238394;
 Thu, 22 Oct 2020 06:03:52 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DD7K=D5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
	id 1kVaGE-0000FH-Vs
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 13:04:07 +0000
X-Inumbo-ID: a0c1f949-0c04-4e47-a16d-39698c72a1ab
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a0c1f949-0c04-4e47-a16d-39698c72a1ab;
	Thu, 22 Oct 2020 13:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1603371842; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DAShzTJ9WokckaDedtYPm7w1OE1Ds959YQbGOCWa4E5BZMDQXI8JT5kITGk/9fZigFkDhy++IhEhhoOQRtzzKL+Ll1Gu/CSSui7g2RZ5zmc3YdZRcUooX2vMi8lCnmwo8kEG8NdeYUSL3Z2NpZqBLM52wrUKnHdQf8wGRflFjKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1603371842; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pXjFeA1IYvBzIxRV5NYvGjEsogk6GRObXecbpb4CJXI=; 
	b=VGPCFY4AV0PlcCVLOVwtmWkjDl/UfHgGWwWnHallAojgzjTKEqH/n7+HtLqs1ipEuKVOwb9fX1rThV3c67DJrimnrS54+mRmtyeFY5bVv2Hp97lmwgWCuV3GD2SLO1YznNLwOayKqa4PjsuNDWb0pFOQZ03ieV/wztemmI+/B1A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1603371842;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pXjFeA1IYvBzIxRV5NYvGjEsogk6GRObXecbpb4CJXI=;
	b=u9aJ8Temn4eo7F6NRNrU6ZPdpIzPBeYSOzYR5CNQ1KY8u0p9WgtjJXv+NwSOj03O
	oPDIL9VFjDnSIQai25ZONg14+irm58xabNOV2DEgW6tibMI3Q1uRTKyysdDK7+EGPzN
	wWUWzOK5PsOBOf8yrKy8vTs/4MH+mn+RiNEhQrng=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1603371832291764.96684238394; Thu, 22 Oct 2020 06:03:52 -0700 (PDT)
Date: Thu, 22 Oct 2020 09:03:52 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Hongyan Xia" <hx242@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3" <andrew.cooper3@citrix.com>,
	"jandryuk" <jandryuk@gmail.com>, "dgdegra" <dgdegra@tycho.nsa.gov>
Message-ID: <175506893e2.fbe49bc728583.7319641449344681246@apertussolutions.com>
In-Reply-To: <09aad1f6-b9bd-1ba4-5e08-198ab2815a5b@suse.com>
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
 <2dbee673-036a-077e-6cb4-556aac46ac33@apertussolutions.com> <09aad1f6-b9bd-1ba4-5e08-198ab2815a5b@suse.com>
Subject: Re: XSM and the idle domain
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Thu, 22 Oct 2020 04:13:53 -0400 Jan Beulich <jbeulich@suse.com> wro=
te ----

 > On 22.10.2020 03:23, Daniel P. Smith wrote:=20
 > > On 10/21/20 10:34 AM, Hongyan Xia wrote:=20
 > >> Also, should idle domain be restricted? IMO the idle domain is Xen=20
 > >> itself which mostly bootstraps the system and performs limited work=
=20
 > >> when switched to, and is not something a user (either dom0 or domU)=
=20
 > >> directly interacts with. I doubt XSM was designed to include the idle=
=20
 > >> domain (although there is an ID allocated for it in the code), so I=
=20
 > >> would say just exclude idle in all security policy checks.=20
 > >=20
 > > The idle domain is a limited, internal construct within the hypervisor=
=20
 > > and should be constrained as part of the hypervisor, which is why its=
=20
 > > domain id gets labeled with the same label as the hypervisor. For this=
=20
 > > reason I would wholeheartedly disagree with exempting the idle domain =
id=20
 > > from XSM hooks as that would effectively be saying the core hypervisor=
=20
 > > should not be constrained. The purpose of the XSM hooks is to control=
=20
 > > the flow of information in the system in a non-bypassable way. Codifyi=
ng=20
 > > bypasses completely subverts the security model behind XSM for which t=
he=20
 > > flask security server is dependent upon.=20
 > =20
 > While what you say may in general make sense, I have two questions:=20

[Apologies for any poor formatting, responding from webmail interface ( ._.=
)]

Hey Jan, these are very legitimate questions.

 > 1) When the idle domain is purely an internal construct of Xen, why=20
 >  does it need limiting in any way? In fact, if restricting it in a=20
 >  bad way, aren't you risking to prevent the system from functioning=20
 >  correctly?=20

Think in terms of least privilege, do you want the idle domain and by exten=
sion the hypervisor to have the additional privilege of imposing state on t=
o the system as opposed to processing the state changes. I am not saying it=
 is wrong technical approach (though I do believe at a minimum the implemen=
tation approach is flawed), I am just asking is it wise from a privilege de=
legation aspect of whether it could be done differently from a technical st=
and point. The underlying concern here is once you grant the privilege the =
hypervisor will forever have the privilege which can be used for good (LU) =
and bad (corruption). Take for instance what is being attempted with DomB, =
in this approach the privilege to impose state (configure domains) is deleg=
ated to the Boot Domain but it is not delegated the privilege to create sta=
te (domain creation). As I mentioned before, this is what Jason was suggest=
ing in having another domain type that is allowed to impose the state that =
is transitioned to from the idle domain to conduct the action.

Whether or not the idle domain is allowed to make hypercalls is not necessa=
rily a concern of the XSM hooks. If it is decided that this is the desired =
path, then what is of concern is that the corrective action does not weaken=
/break the hooks. If this ends up being the desired approach, then IMHO the=
 correct action is to update the dummy policy, flask policy, and SILO (if i=
t applies) to allow the privilege/access to occur versus putting bypasses i=
nto the security hooks.

 > 2) LU is merely restoring the prior state of the system. This prior=20
 >  state was reached with security auditing as per the system's=20
 >  policy at the time. Why should there be anything denind in the=20
 >  process of re-establishing this same state? IOW can't XSM checking=20
 >  be globally disabled until the system is ready be run normally=20
 >  again?

There is an assumption you made there that is being overlooked and that is =
you are assuming it is the same state. It is important to understand what a=
ssumptions are being made and when possible impose those assumptions throug=
h policy than with code. Not everyone will want to make the same assumption=
s and may want a better controlled path for that state to flow.

No you don't want to globally disable the XSM checking as that means you ha=
ve lost all control over the system where any and all policy violations cou=
ld occur without any auditing. This would open a huge hole for a malicious =
actor to take advantage of for an attack against the system.=20

In the end to reiterate, if this is decided to be the desired approach then=
 IMHO the correct implementation is to encode the access in policy not in b=
ypasses to the XSM hooks.

 > Please forgive if this sounds like rubbish to you - I may not have a=20
 > good enough understanding of the abstract constraints involved here.=20

No worries, it is always better to question when in doubt than making an as=
sumption. Hopefully I helped in providing a better explanation.

 > Jan=20
 >=20

