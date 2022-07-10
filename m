Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9E956CC7E
	for <lists+xen-devel@lfdr.de>; Sun, 10 Jul 2022 05:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364544.594583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAN9l-0000dJ-IM; Sun, 10 Jul 2022 02:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364544.594583; Sun, 10 Jul 2022 02:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAN9l-0000bW-DA; Sun, 10 Jul 2022 02:58:49 +0000
Received: by outflank-mailman (input) for mailman id 364544;
 Sun, 10 Jul 2022 02:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puvd=XP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oAN9j-0000bQ-6l
 for xen-devel@lists.xenproject.org; Sun, 10 Jul 2022 02:58:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3502bf8d-fffc-11ec-bd2d-47488cf2e6aa;
 Sun, 10 Jul 2022 04:58:44 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16574219191281002.3677204736817;
 Sat, 9 Jul 2022 19:58:39 -0700 (PDT)
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
X-Inumbo-ID: 3502bf8d-fffc-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1657421921; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GkXs1IZo9L/WTtQvSe/e8YZlbzUzrn8qem0tZstCOT6saM5KoCIajLz/ECawQJ0Fq0Tmn+Ga83WcKh8k8ozPW9Gyp+5EatL51ns5x+NCiewEbjL5V2MbMOQBDBvFzcGJvhZb6NzzOBazQpVgdq7UPnqXcWnql9WIhRt20llmOMo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657421921; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JuwqlljZ0pCG9JhQeB9bTp107EufSATKXjA5r12gq/U=; 
	b=jPdo85qWe03noK39Nf8r9y/APeeJu5hEUVLhs8E3cuZaLAsH2tTA+iXeNNWKJf/oiBWzWmHn3tQXsv9fe5n5ZGFOmfys+ex0CMUYK4EtR3gBKmALlLDnpKseVekz/it1lx5qLRstxtrznAjfw4xgcF0O9b2ZXhPuCOtNT8O6tbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657421921;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:To:To:Cc:Cc:References:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JuwqlljZ0pCG9JhQeB9bTp107EufSATKXjA5r12gq/U=;
	b=HWShZCzztyBNj6I5bdMmTHec6Z9ERgxwErZkILZRxYqRhF6tF1KKUEiIl7A4KayM
	NDs6picNS0aCDEqCX3gwEU+oqKBl5e0yirjyuzGuFfx8oIcCbRH4RudUqhCuPZ78iLo
	F6Y+MqhcBZzZyfjwyATacEY/RIA/4NZ5pAcMS8sg=
Message-ID: <7672d8bb-cae5-a07b-3410-6f495686c106@apertussolutions.com>
Date: Sat, 9 Jul 2022 22:58:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Scott Davis
 <scott.davis@starlab.io>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <92644952-48be-d25b-4471-121cfa14a5c0@apertussolutions.com>
 <20220706191325.440538-1-jandryuk@gmail.com>
 <b689b39e-581d-01fe-c473-b585dca880eb@apertussolutions.com>
 <CAKf6xpubT9GNTO-nY1WZXhAFSArrfNqJ9Da+pG06Ye3cTzo1CA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [RFC PATCH] flask: Remove magic SID setting
In-Reply-To: <CAKf6xpubT9GNTO-nY1WZXhAFSArrfNqJ9Da+pG06Ye3cTzo1CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 7/7/22 08:45, Jason Andryuk wrote:
> On Thu, Jul 7, 2022 at 6:14 AM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> On 7/6/22 15:13, Jason Andryuk wrote:
>>> flask_domain_alloc_security and flask_domain_create has special code to
>>> magically label dom0 as dom0_t.  This can all be streamlined by making
>>> create_dom0 set ssidref before creating dom0.
>>
>> Hmm, I wouldn't call it magical, it is the initialization policy for a
>> domain labeling, which is specific to each policy module. I considered
>> this approach already and my concern here is two fold. First, it now
>> hard codes the concept of dom0 vs domU into the XSM API. There is an
>> ever growing desire by solution providers to not have a dom0 and at most
>> have a hardware domain if at all and this is a step backwards from that
>> movement. Second, and related, is this now pushes the initial label
>> policy up into the domain builder code away from the policy module and
>> spreads it out. Hopefully Xen will evolve to have a richer set of
>> initial domains and an appropriate initial label policy will be needed
>> for this case. This approach will result in having to continually expand
>> the XSM API for each new initial domain type.
> 
> Yeah, adding dom0 vs. domU into the XSM API isn't nice.  My original
> idea was just for dom0, but I added the domU hook after you basically
> said in your other email that dom0less had to work.  There should not
> be any more of these since they are just to provide backwards
> compatibility.

Help me understand, why is it considered magic/undesirable to assign a
label for Dom0/DomU in flask_domain_alloc_security() when the context is
clearly discernible, yet it is acceptable to assign SECINITSID_XENBOOT,
SECINITSID_DOMXEN, and SECINITSID_DOMIO? Specifically, when
flask_domain_alloc_security() is called with the current domain labeled
with SECINITSID_XENBOOT, we know it is creating either a system domain
or a Dom0/DomU. At no time should there be a domain created at this time
that needs to be labeled with SECINITSID_UNLABELED. When the current
domain is no longer SECINITSID_XENBOOT, then the context is no longer
understood and the only safe SID to initializat with is
SECINITSID_UNLABELED.

While I am more than open to listening as to why my opinion/approach may
be flawed, codifying dom0 and/or domU into the XSM API is really a
non-starter for me.

> A dom0/domU flask policy is not interesting for dom0less/hyperlaunch.
> So I don't see why xen/flask needs support for determining sids for
> domains.  If you have dom0less/hyperlaunch + flask, every domain
> should have a ssidref defined in its config when building.  If you
> require ssidrefs for dom0less/hyperlaunch + flask, then there is less
> initial label policy.  An unspecified ssidref defaulting to
> unlabeled_t is fine.

Actually, a Dom0/DomU policy is very interesting for those of us that
would like to see XSM/Flask to be the default policy regardless of the
method of construction for the initial system. A specific test case I
would run was a configuration containing a Dom0 and a DomU without XSM
labels specified. This configuration should Just Work(tm).

> I saw your other patch as adding more "initial label policy" since it
> adds more special cases.  I see requiring an explicit ssidref or
> getting unlabeled_t as a feature.  Automatic labeling seems like a
> misfeature to me.

This is the crux of the problem, you view the XSM API Expansion as label
or fail while viewing the Default Initial Assignment as being automatic
labeling. The reality is that this is not the case and that the end
result between them is exactly the same, just with slightly different
flows to get there. The difference being that the XSM API Expansion has
codified Dom0/DomU into the XSM API and incurred an additional XSM call
on each construction path.

Consider the state sequence for struct domain_security_struct{} of the
two under dom0less where labels cannot be specified,

XSM API Expansion:
 1. xsm_ssidref_{dom0,domU}() -> config->ssidref = SECINITSID_DOM0 or
    SECINITSID_DOMU respectively
 2. xsm_alloc_security_domain() -> d->ssid->sid = SECINITSID_UNLABELED
 3. xsm_domain_create() will always test config->ssidref,
    SECINITSID_DOM0 or SECINITSID_DOMU, because (1) will always set it
    and never as SECINITSID_UNLABELED

Default Initial Assignment:
 1. xsm_alloc_security_domain() -> d->ssid->sid = SECINITSID_DOM0 or
    SECINITSID_DOMU
 2. config->ssidref = NULL
 3. xsm_domain_create() will always test d->ssid->sid, SECINITSID_DOM0
    or SECINITSID_DOMU because of (1) and never as SECINITSID_UNLABELED

Hyperlaunch domain construction works differently, Dom0/DomU was not
codified into the API and where possible the existing Dom0 API
codifications were eliminated. The XSM API Expansion approach would
result in a similar if statement that is in xsm_alloc_security_domain()
under the Default Initial Assignment approach. It would likely occur in
builder_create_domains(). There a check of the domain'a permissions and
functions would occur to then call the appropriate
xsm_ssid_{dom0,domu}() hook.

Maybe some day it will be reasonable to expect labeling as a standard
part of a domain's configuration, and thus acceptable to panic during
boot when it is missing. Unfortunately, that is not today and no matter
how it is dressed, the current model has to be a default label
assignment based on the understanding that the context is boot-time
domain construction.

v/r,
dps

