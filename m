Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CCB346DEB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 00:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100825.192324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOqi8-0003AE-6E; Tue, 23 Mar 2021 23:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100825.192324; Tue, 23 Mar 2021 23:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOqi8-00039s-2r; Tue, 23 Mar 2021 23:45:20 +0000
Received: by outflank-mailman (input) for mailman id 100825;
 Tue, 23 Mar 2021 23:45:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QwVt=IV=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lOqi7-00039n-9a
 for xen-devel@lists.xen.org; Tue, 23 Mar 2021 23:45:19 +0000
Received: from mail-ot1-x32c.google.com (unknown [2607:f8b0:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cdcb398-8f79-41cf-a852-0603059a46dd;
 Tue, 23 Mar 2021 23:45:18 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so21280797oto.2
 for <xen-devel@lists.xen.org>; Tue, 23 Mar 2021 16:45:17 -0700 (PDT)
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
X-Inumbo-ID: 4cdcb398-8f79-41cf-a852-0603059a46dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30XQNYb2T9mP3JRg6lsKoXYDzFycp16JlM5yfypF0B8=;
        b=gY/WciJerlVATJVt9+xYAEBSdyz8/iWoO+dSYlPl1eSW9Lt6LHoI5lX+lem4iwFQG7
         RvIk7ZGZHS1WoYjy8Hym4E9LdlrFGBaTqbm74dEAtkeK8TlJhEBPgzrdowvMkIXziict
         qi+q2/ZuNHeZHBlLW2OIYMhw2KuvXjpD2jaklEUACPsLnHrxVwwNmCVha3bhMNnsF6DM
         JCNyxmvZFm3mmXMqZq5LyN+5iVYNwer7RxwyBiCZFMQVx1c4hJYwlAqYKNEyeflm0zRi
         qMq+XpZm1s687TKmTIDiJ81PrExlZGyoG1fBq8IwDhqHOQWAJ+Zx+NtX5xs+u/Y3b9DH
         tCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=30XQNYb2T9mP3JRg6lsKoXYDzFycp16JlM5yfypF0B8=;
        b=cPHqc17fDo9I+RyT1zMsp15y7zXsEzymi8JZvFzDKMIw46T5UteDiLLji1JcHf96QU
         Rpf5vCSaRn1q9mMIpkEyItijUpQIkhuzx/zkgOCo5uDQmxxYB4Xws+WY6fsvVofaUZ7N
         kxwyxlLgncd1iPh8raPv85YAz+vS2OuwxIUYGM2KkU09qsmxZvlTZJg5gJS3oK8ZIQQl
         NVI5u/DjJd4Bvy5/GCAjqJLFdJVQhuz0+m0hcIKe7Ii+39xhTM1fPRZdwtu6oq1MCCBK
         5eubWnJKlLoCRXHby/dsK5+kGgTOCdaWXBc5SlyMh3DxXr6IceU9TvyYCADvg7IBW8DD
         s+CQ==
X-Gm-Message-State: AOAM533MVewztXoaI7/3TwAOwLjTg6IG2wf5uyChqiVXI3KmwD6ZmVvP
	qRoGppZ7u93VkWxpeg0FE/tJquVBrymrzLpyT2c=
X-Google-Smtp-Source: ABdhPJxU0pQLYI+mJL9FcgyAObkDwyEWPoRt+1tIi3/QEYjne938wfp8j9wBjZX98hJz0bOXb2D4AV3XyCjyQ6xNxtI=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr665276otj.183.1616543117417;
 Tue, 23 Mar 2021 16:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <2e7213c1-e01c-9d9d-3ac1-3086eb6889e5@apertussolutions.com> <c3a60e96-3179-f377-5c8b-3e6941d055ae@apertussolutions.com>
In-Reply-To: <c3a60e96-3179-f377-5c8b-3e6941d055ae@apertussolutions.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 23 Mar 2021 16:45:06 -0700
Message-ID: <CACMJ4GaqX4X8iR-NfbVpQnXO5DU7DNb9pKi2mUdjXrAxMCPmWA@mail.gmail.com>
Subject: Re: Working Group Meeting for hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, iwj@xenproject.org, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Rich Persaud <persaur@gmail.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	luca.fancellu@arm.com, Adam Schwalm <adam.schwalm@starlab.io>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, paul@xen.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 18, 2021 at 8:33 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> On 3/16/21 12:09 AM, Daniel P. Smith wrote:
> > All,
> >
> > We have posted[1][2] the design documents for hyperlaunch and would
> > invite attendance at a working group call to discuss two agenda items.
> > The first item is a review of the documents and the second is a
> > discussion about bringing production-ready revisions of our previous
> > prototype in as patches to provide a near-term implementation of the
> > design. If possible please join us this Thursday 3/18 at
> > 1700CET/1600GMT/1200EDT/0900PDT. Below are the call details.
> >
> > [1]
> > https://lists.xenproject.org/archives/html/xen-devel/2021-03/msg00939.html
> > [2]
> > https://lists.xenproject.org/archives/html/xen-devel/2021-03/pdfCV4LaWCrTN.pdf
>
> Agenda link,
> https://cryptpad.fr/pad/#/2/pad/edit/+MJgJ0EkalH81-YVOlsp1bEo/

## Minutes from the Hyperlaunch Working Group meeting, 18th March

* Posted design docs:
    1) main doc: has the high level design
    2) device tree doc: has implementation details for launch

- new version of docs much better, in-line with vision for Xen design docs
- Xen tree has example of another good recent design doc

- Stefano: have minor feedback on some details eg. node names
Evaluating fit with work on System Device Tree; is very aligned.

* Naming: "Hyperlaunch" and the related terms "Hyperlaunch Static"
and "Hyperlaunch Dynamic"

- No objections; proceeding with these names for now
- OK to retire term 'dom0less' in favour of 'Hyperlaunch Static' since
  Hyperlaunch Static will do everything that dom0less does, plus more
- an Appendix in the posted main design document has reasoning,
  rationale behind the proposed naming

* Towards merging:
- Andy: Xen currently in release freeze, so wait for opening for
  4.16, and then follow up

* Crash domain: When is it started? What defines a crash?

Aim: Xen does its best to handle misconfig / faults to get system up
to a usable console

Andy: two separate crash cases:
  1: hypervisor crash:
  - current Xen can reserve memory on boot, load a crash kernel,
    jump into it on a crash: mount root disk, dump logs, reboot
  - is kexec case, and also the safety case for error in the hypervisor

  2: crash of a domain that Xen is starting:
  - can use normal Xen functionality to recover
  - structure in doc supports DRTM measurement of crash handling logic

Stefano: there is some similar need or equivalent in Safety systems
Bertrand: doc should describe what a crash is, what the functionality
can do

* ACTION: update doc to describe proposed crash response functionality

* Terminology: 'recovery' or 'rescue' terms preferred:

- First: better as "crash environment" (not "crash domain")
- Second: "recovery domain""

Bertrand: safety case: reboot to most recent known working config
- on server, reboot to interactive is ok
- make sure domain has sufficient capacity to do both

* ACTION: add definitions and descriptions to the design doc
    - work out where the safety use case fits
    - multiple domains can have control domain permission

* Recommendations on approach for development
 - 40-odd patch series in prototype: too big for one series (!)
 - will work on changes to both x86 and Arm code together

Stefano: sending multiple smaller series is OK: make each testable

* How much common vs. arch-specific?

Andy: aim for common: logic in-line with RISC-V and PowerPC ports
- eg. LCM handling in common; and may require some arch-specific

Christopher: prototype used PV for Hardware Domain, following code
for current most-common dom0; any guidance on PV vs PVH, experience
with PVH dom0?

Roger: PVH dom0 used on FreeBSD; is in GitLab CI and osstest.
PVH use for domU is more common.

Andy: Hardware Domain and Control Domain need clearer definitions

* ACTION: add definitions and descriptions for Hardware, Control,
domain to the design doc

Roger:
- feedback on PCI points: have posted to the list

* Beyond posted docs:

Andy: Bareflank-style setup is relevant: can ensure Hyperlaunch work
aligns and keep use case in mind
eg. case where hypervisor doesn't have scheduler, offloads power mgmt
Rich: seek design input for Hyperlaunch
Eric: invite to next call?

* ACTION: invite Bareflank developers to next call, supply pointer to
Hyperlaunch design docs

* Public development:

Rich: ok for in-development Hyperlaunch code to be public on github?
Christopher + Daniel: most likely yes; can check with project sponsor

--
Christopher

