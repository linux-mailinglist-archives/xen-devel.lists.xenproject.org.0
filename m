Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA02836C6
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 15:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3009.8660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPQlT-00072u-TR; Mon, 05 Oct 2020 13:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3009.8660; Mon, 05 Oct 2020 13:42:55 +0000
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
	id 1kPQlT-00072V-QB; Mon, 05 Oct 2020 13:42:55 +0000
Received: by outflank-mailman (input) for mailman id 3009;
 Mon, 05 Oct 2020 13:42:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kPQlS-00072Q-ID
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 13:42:54 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1906c677-7ae0-4d89-9a9e-f6c5f2bb03c9;
 Mon, 05 Oct 2020 13:42:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kPQlS-00072Q-ID
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 13:42:54 +0000
X-Inumbo-ID: 1906c677-7ae0-4d89-9a9e-f6c5f2bb03c9
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1906c677-7ae0-4d89-9a9e-f6c5f2bb03c9;
	Mon, 05 Oct 2020 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601905372;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=w01SC9C/nCOxtEay1oyxna3Ur1GH+Q+tk1QpjWTLj8Y=;
  b=O8+j8ysOaUm48UfiA/W3J8uJSwd9Qwcacl0ETrFyOdjpZf9JAVW/ubpu
   7PRXC6meF7KFpczyz749gTom7dYHKPKYJ6LvH/gJ1dRgfPwc2bwoQJKzw
   1QOTi9aVyG3tprmvoEOD9IudGAOxKnGbWJ6LESGDmSQ7YBnaOtDDjR3nU
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lHy3J9jzmyQD+2Rml7BJaQ8PRQyjTSZ8zWj+ZPxzN7PDuStYh6tINEfp79QtkbIB1mD28Hqvf2
 cpukhGcQQ+ZQAG6GM4vScngz4XmjbFWHkAK6HKpJHa96CwMHoH/bQoCmQ9/p0YxrU1TL3VNBzl
 kwZmTJ1lFeE3NNzGjCIhZk8XTvNbCNcdWxGExy9hX06O2zndBfibQIlmH6w4nC8EU45S8ilE3C
 Uj9gOAjybWL5t+BOD/9bPWOlkHM4TMcDiunb43Wtw0ahNt+oloklbDahpl++SqRTsBAHcydX41
 NVs=
X-SBRS: None
X-MesageID: 29310585
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="29310585"
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
To: George Dunlap <George.Dunlap@citrix.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Rich Persaud <persaur@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
 <868b25bd-ab2c-7f33-1dc2-9476c86d8050@citrix.com>
 <F65DC414-FFA4-4990-84FF-A94503B38F3A@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <351673c4-c3a0-a1c4-5738-2339b698417e@citrix.com>
Date: Mon, 5 Oct 2020 14:41:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <F65DC414-FFA4-4990-84FF-A94503B38F3A@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 01/10/2020 15:50, George Dunlap wrote:

>>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>>> ---
>>>
>>> CC: Ian Jackson <ian.jackson@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Rich Persaud <persaur@gmail.com>
>>> CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>> ---
>>> docs/index.rst                        |  2 +
>>> docs/policies/dependency-versions.rst | 76 +++++++++++++++++++++++++++
>>> 2 files changed, 78 insertions(+)
>>> create mode 100644 docs/policies/dependency-versions.rst
>>>
>>> diff --git a/docs/index.rst b/docs/index.rst
>>> index b75487a05d..ac175eacc8 100644
>>> --- a/docs/index.rst
>>> +++ b/docs/index.rst
>>> @@ -57,5 +57,7 @@ Miscellanea
>>> -----------
>>>
>>> .. toctree::
>>> +   :maxdepth: 1
>>>
>>> +   policies/dependency-versions
>> I think it is great that this is going into Sphinx.
>>
>> However, I'd prefer to avoid proliferating random things at the top
>> level, to try and keep everything in a coherent structure.
> I was hoping for your feedback on where to put this. :-)
>
>> For better or worse, I guestimated at "admin guide" (end user and
>> sysadmin guide), "guest docs" (VM ABI, and guest kernel developers), and
>> "hypervisors docs" (hacking Xen).
> Is “hypervisor” in this sense meant to mean the actual hypervisor (xen.git/xen), or the whole hypervisor system (i.e., everything in xen.git)?

"yes".  If it seems like I'm making this up as I go along, then perhaps
its because I am.

> It seems to me that we need something like the latter; in which case maybe we should change that section to “developer documentation” or something, with “hypervisor” as a section under that?

My gut feeling is that "developing the hypervisor" is different enough
from "developing the toolstack" that there will be little overlap in
content.

>
>> I'm happy to shuffle the dividing lines if a better arrangement becomes
>> obvious.  This particular doc logically lives with "building Xen from
>> source".
> I don’t see a “building Xen from source” section (except for Hypervisor Documentation/Code Coverage/Compiling Xen, which is obviously specific to code coverage).

There isn't one yet.

> If the main target of the page is to tell admins / downstreams what distros we support, then it might go under “Admin Guide” somewhere.  If the main target is to tell developers what versions they have to support / don’t have to support, then putting it under a newly-created “developer documentation” section would probably make the most sense.
>
> I think I’d go with the latter, if you’re OK with it.

I don't think this page is applicable to downstreams.  They've already
got packages and have figured out their own support.

This is purely a statement of what we (upstream) expect/check, which
will inform developers wishing to work on master.

>
>
>>>    glossary
>>> diff --git a/docs/policies/dependency-versions.rst b/docs/policies/dependency-versions.rst
>>> new file mode 100644
>>> index 0000000000..d5eeb848d8
>>> --- /dev/null
>>> +++ b/docs/policies/dependency-versions.rst
>>> @@ -0,0 +1,76 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Build and runtime dependencies
>>> +==============================
>>> +
>>> +Xen depends on other programs and libraries to build and to run.
>>> +Chosing a minimum version of these tools to support requires a careful
>>> +balance: Supporting older versions of these tools or libraries means
>>> +that Xen can compile on a wider variety of systems; but means that Xen
>>> +cannot take advantage of features available in newer versions.
>>> +Conversely, requiring newer versions means that Xen can take advantage
>>> +of newer features, but cannot work on as wide a variety of systems.
>>> +
>>> +Specific dependencies and versions for a given Xen release will be
>>> +listed in the toplevel README, and/or specified by the ``configure``
>>> +system.  This document lays out the principles by which those versions
>>> +should be chosen.
>>> +
>>> +The general principle is this:
>>> +
>>> +    Xen should build on currently-supported versions of major distros
>>> +    when released.
>>> +
>>> +"Currently-supported" means whatever that distro's version of "full
>>> +support".  For instance, at the time of writing, CentOS 7 and 8 are
>>> +listed as being given "Full Updates", but CentOS 6 is listed as
>>> +"Maintenance updates"; under this criterium, we would try to ensure
>>> +that Xen could build on CentOS 7 and 8, but not on CentOS 6.
>>> +
>>> +Exceptions for specific distros or tools may be made when appropriate.
>>> +
>>> +One exception to this is compiler versions for the hypervisor.
>>> +Support for new instructions, and in particular support for new safety
>>> +features, may require a newer compiler than many distros support.
>>> +These will be specified in the README.
>> The problem we have is that xen.git contains two very different things.
>> There is the hypervisor itself, which is embedded, and can easily be
>> cross compiled, and there is the content of tools/ which depends on a
>> lot of distro infrastructure.
>>
>> We expect tools/ to work in any supported distro, without having to do
>> weird toolchain gymnastics.
>>
>> For xen/ at the moment we have a very obsolete toolchain requirements,
>> and this is holding us back in some areas.  We're looking to bring that
>> forward, and may consider that being newer than some of the old distros
>> is necessary.
>>
>> At the moment however, we have quite a lot of functionality which is
>> dependent on being able to detect suitable toolchain.  GCOV and CET-SS
>> are examples.  These features will turn themselves off in older distros,
>> so while you can "build" Xen that far back, you might not get everything.
>>
>> For CET in particular, there is no feasible way to support it on older
>> toolchains.  (unless someone comes up with an extremely convincing way
>> of hand-crafting memory operands using raw .byte's in inline assembler.)
>>
>> I definitely don't think it is unreasonable for us to require the use of
>> (potentially) bleeding edge toolchains if they want to use (potentially)
>> bleeding edge features.  CET-SS isn't bleeding edge any more, but
>> CET-IBT is due to the additional linker work required to make it
>> function.  A future one which we need to do something about is Control
>> Flow Integrity, which is Clang specific, depends on LTO, and caused
>> Linux to up their minimum supported version to 10.0.1 which was when all
>> the bugfixes got merged.
> You seem to be explaining why I wrote this paragraph.  Did you have any specific changes you wanted to make? :-)

I don't think the paragraph as written gets this point across.

Even from the first sentence, Xen (the hypervisor) doesn't depend on
external libraries, whereas Xen (the content of xen.git) does.

>
>>> +
>>> +Distros we consider when deciding minimum versions
>>> +--------------------------------------------------
>>> +
>>> +We currently aim to support Xen building and running on the following distributions:
>>> +Debian_,
>>> +Ubuntu_,
>>> +OpenSUSE_,
>>> +Arch Linux,
>> No link for Arch?
> The link points to the page describing the release lifecycles; Arch doesn’t really have that concept (as noted in the next section).
>
> I could make it so that links to the release lifecycle page is in the table below instead.
>
>>> +SLES_,
>>> +Yocto_,
>>> +CentOS_,
>>> +and RHEL_.
>>> +
>>> +.. _Debian: https://www.debian.org/releases/
>>> +.. _Ubuntu: https://wiki.ubuntu.com/Releases
>>> +.. _OpenSUSE: https://en.opensuse.org/Lifetime
>>> +.. _SLES: https://www.suse.com/lifecycle/
>>> +.. _Yocto: https://wiki.yoctoproject.org/wiki/Releases
>>> +.. _CentOS: https://wiki.centos.org/About/Product
>>> +.. _RHEL: https://access.redhat.com/support/policy/updates/errata
>>> +
>>> +Specific distro versions supported in this release
>>> +--------------------------------------------------
>>> +
>>> +======== ==================
>>> +Distro   Supported releases
>>> +======== ==================
>>> +Debian   10 (Buster)
>>> +Ubuntu   20.10 (Groovy Gorilla), 20.04 (Focal Fossa), 18.04 (Bionic Beaver), 16.04 (Xenial Xerus)
>>> +OpenSUSE Leap 15.2
>>> +SLES     SLES 11, 12, 15
>>> +Yocto    3.1 (Dunfell)
>>> +CentOS   8
>>> +RHEL     8
>>> +======== ==================
>> How about a 3rd column for "supported until" ?  It would stop this page
>> becoming stale simply over time.
> If we did that, it would make the table longer, as we’d have a separate row for each distro release rather than each distro.
>
> The release manager needs to look at this table before the release; for that they’ll have to go to the release lifecycle page of the various distros anyway, to pick up new versions of the distro.  So I don’t think having the date here adds that much.

Irrespective of the content of the table, I'd recommend Sphinx's
list-table construct (see the example
docs/guest-guide/x86/hypercall-abi.rst).  This is deliberately more
amenable to diffing when changes are made.

Also I need to refresh one of my patches to add another extension for
hyperlinks.


The table on its own isn't terribly helpful, and will go stale.  The
point of adding a 3rd column is so people don't have to click through
onto every distro page to find out whether the content of this page is
still correct.

I'd also recommend merging the hyperlinks into the first column of the
table as a more obvious place to have the links, rather than in a line
of text.

~Andrew

