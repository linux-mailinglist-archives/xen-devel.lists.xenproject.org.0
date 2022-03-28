Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA184E9A32
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 16:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295484.502825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYqlF-0001II-Bw; Mon, 28 Mar 2022 14:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295484.502825; Mon, 28 Mar 2022 14:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYqlF-0001GT-90; Mon, 28 Mar 2022 14:54:25 +0000
Received: by outflank-mailman (input) for mailman id 295484;
 Mon, 28 Mar 2022 14:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=adjj=UH=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1nYqlD-0001GL-Fc
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 14:54:23 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f35e3812-aea6-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 16:54:21 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id g8so11561967qke.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Mar 2022 07:54:21 -0700 (PDT)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 o6-20020a05620a22c600b0067d247816eesm7793398qki.85.2022.03.28.07.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 07:54:20 -0700 (PDT)
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
X-Inumbo-ID: f35e3812-aea6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kLNgQxOFU/J6V+DMplcwfWYxPupNA9Gh1yV98IjMbVs=;
        b=N8UPe/jxbZ9fSw4Oq2XNyxvti61swftL91xPHMiLZ6xhyYeN2AUpVirsxdP+AID+qO
         zbgk00ra9pBfGaqzy2mIMmFvrOsOTcurgE48LFL01P7y35aB4vFq+9bfVtW2WNCqp1AA
         VtsBKjrGwD5Qc8GK+VVgcrmLYXUux+1Wyzpam/nK2gRdL85iA/aNres7m1MvMCzqKag7
         wY0hoxrsHuKFh0mtt/RVyTFlbXeDIjAHVtoxcFRQ6eQ522vBaswpKrMKB+Brlo6tV073
         oo1Ls4ZfW8DOWWz5N+212ge9U1j+/Fkc9GNfGFyZ2iFq9LtbSPNKoewgRTWTAxJrar4e
         0PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kLNgQxOFU/J6V+DMplcwfWYxPupNA9Gh1yV98IjMbVs=;
        b=qxiMj80ZoTeK3FUBorX/leC0OyxrBh5pPbbWsTWYlAxXmXNsJVp3BpSSK8wt8r+VVF
         c8U/hgmtcvQs8jVofHCdtRRwxjTve07mfCaBl9B5PTJfIkZS4p5prcLEOlozCsCDW6vb
         tUW9TXKxseH1GPkyYCcyaUhO+/ucjzlSsH8AdLxjgXrUmlOJBXOX4XA96tq2x8gs3HMk
         flFErGtdjGUFwiTvQ5Ey79LzO/j7WJW/GYhBHJp/jU2cL5Ran84et96gG2xlYITz1K42
         0IGStnFGEP6u9UVEmf9E7IZDqfj4LgqIvuAo0YC6QG2f6PXzrBNbH/e1tJHVS4poe6c2
         yI8g==
X-Gm-Message-State: AOAM533LB2u0F6X63jK2+QUXjWItUYCm2cEQOk7nCpYPCB369fa6mzmp
	JKsw23utC3DTapt3AA75Yl82I+GKwqA=
X-Google-Smtp-Source: ABdhPJwURYNt+iZv8Oa8zmfS5ji51idj/trtNp0qI6DzaCu+ArIsF7lcV2YEkt3ftjVO/wfM18hNXA==
X-Received: by 2002:a37:68d8:0:b0:67e:1558:a708 with SMTP id d207-20020a3768d8000000b0067e1558a708mr16118919qkc.25.1648479260577;
        Mon, 28 Mar 2022 07:54:20 -0700 (PDT)
Message-ID: <7dbe9e1d-3768-b607-af26-4f4a817143d6@gmail.com>
Date: Mon, 28 Mar 2022 10:54:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Bertrand.Marquis@arm.com,
 Julien Grall <julien@xen.org>, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
 <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
 <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
 <ccb85826-feb8-7c26-64e3-0a459bdaf8b6@gmail.com>
 <CAKf6xpsB9Tr+WtDWPRYmkjB+8QmA0-oWrAcYh5D2G6WVWDZo1Q@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
In-Reply-To: <CAKf6xpsB9Tr+WtDWPRYmkjB+8QmA0-oWrAcYh5D2G6WVWDZo1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/22 12:52, Jason Andryuk wrote:
> On Fri, Mar 25, 2022 at 11:46 AM Daniel P. Smith <dpsmith.dev@gmail.com> wrote:
>>
>> On 3/24/22 20:30, Stefano Stabellini wrote:
>>> On Wed, 23 Mar 2022, Jan Beulich wrote:
>>>> On 23.03.2022 01:22, Stefano Stabellini wrote:
>>>>> The existing XSM check in evtchn_alloc_unbound cannot work and should
>>>>> not work: it is based on the current domain having enough privileges to
>>>>> create the event channel. In this case, we have no current domain at
>>>>> all. The current domain is Xen itself.
>>>>
>>>> And DOM_XEN cannot be given the appropriate permission, perhaps
>>>> explicitly when using a real policy and by default in dummy and SILO
>>>> modes?
>>>
>>> The issue is that the check is based on "current", not one of the
>>> domains passed as an argument to evtchn_alloc_unbound. Otherwise,
>>> passing DOMID_XEN would be straightforward.
>>>
>>> We would need to use a hack (like Daniel wrote in the other email) to
>>> set the idle_domain temporarily as a privileged domain only for the sake
>>> of passing an irrelevant (irrelevant as in "not relevant to this case")
>>> XSM check. That cannot be an improvement. Also, setting current to a
>>> "fake" domain is not great either.
>>
>> My suggestion was not to intended to be simply a hack but looking at the
>> larger issue instead of simply doing a targeted fix for this one
>> instnace. While I cannot give an example right off hand, the reality is,
>> at least for hyperlaunch, that we cannot say for certain there will not
>> be further resource allocations that is protected by the security
>> framework and will require preliminary handling by the construction
>> logic in the hypervisor. The low-complexity approach is to address each
>> one in a case-by-case fashion using direct calls that go around the
>> security framework. A more security conscience, and higher complexity,
>> approach would be to consider a least-privilege approach and look at
>> introducing the ability to do controlled switching of contexts, i.e.
>> moving `current` from DOMID_IDLE to DOMID_CONSTRUCT, to one that is
>> granted only the necessary privileges to do the resource allocations in
>> which it is limited.
>>
>> This is also not the first time this issue has come up, I don't recall
>> the exact thread but several months ago someone ran into the issue they
>> need to make a call to a resource function and was blocked by XSM
>> because DOMID_IDLE has no privileges. The reality is that the idea of
>> monolithic high-privileged entities is being dropped in favor of
>> least-privilege, and where possible hardware enforced, constraint. This
>> can be seen with Intel de-privileging SMM and running SMI handlers in
>> constrained ring 3. Arm is gaining capability pointers, CHERI, that will
>> enable the possibility for constrained, least-privileged kernel
>> subsystems. Would it not be advantageous for Xen to start moving in such
>> a direction that would enable it to provide a new level of safety and
>> security for consumers of Xen?
>>
>> Coming back to the short-term, I would advocate for introducing the
>> concept and abstraction of constrained context switching through a set
>> of function calls, which would likely be under XSM to allow policy
>> enforcement. Likely the introductory implementation would just mask the
>> fact that it is just setting `is_privileged` for DOMID_IDLE. Future
>> evolution of the capability could see the introduction of new
>> "contexts", whether they are represented by a domain could be determined
>> then, and the ability to do controlled switching based on policy.
> 
> For the specific case of evtchn_alloc_unbound, Flask's
> xsm_evtchn_unbound has a side effect of labeling the event channel.
> So skipping the hook will have unintended consequences for Flask.
> 
> xsm_evtchn_unbound could be split in two to have an access piece and a
> labeling piece.  The access piece is run at hypercall entry, and the
> labeling is still done in evtchn_alloc_unbound.  For Flask, labeling
> depends on the two domain endpoints, but not current.
> 
> More generally, it seems to me there are too many xsm checks in the
> middle of functions/operations.  They are fine for a normal entry via
> hypercall, but they interfere with Xen's internal operations.  Xen
> shouldn't be restricted in its own operations.  The live update people
> hit it with domain creation, and I just posted a patch for
> unmap_domain_pirq.
> 
> It would be more obvious for auditing if each hypercall entrypoint
> applied xsm checks.  Make the allow/deny decision as early as
> possible.  Then a worker function would be easily callable for the
> Xen-internal case.  The flip side of that is the xsm hook may need
> sub-op specific data to make its decision, so it fits to put it in the
> sub-op function.  It seems to me the location of hooks was determined
> by where the data they need is already available.  Re-arranging hooks
> may require some duplication.

While it can be inconvenient in some cases, one of the purposes of flask
is to provide fine(er) grained access control over resources and for Xen
the path to a resource is often through a multiplexed interface. As such
I would be very cautious in considering the addition of distance between
the time of check and the time of access to a resource.

It has been some time since it has occurred but I am aware that there
was an audit conducted to ensure all necessary resources were covered
and the placement of decision points were in the correct locations. With
that said, the code has evolved and it may be time for another audit
(though it would take some cycles to do such an audit).

> The xsm controls should clearly apply to the DomUs and other entities
> managed by Xen.  xsm restricting Xen itself seems wrong.  Having
> internal operations get denied by xsm may unintentionally subvert Xen
> itself.
> 
> Yes, moving checks outward makes for an un-restricted middle.  But the
> security server running in the same address space isn't going to help
> against code exec inside the hypervisor.
> 
> I think I view it like this:  Why is a xen internal operation subject
> to a security check?  When would one ever want to deny a xen internal
> operation?

In the past this was the standard of thinking but the reality of the
last few years has demonstrated this approach can no longer be relied
upon. If this approach was safe, then Intel would have had no reason to
put the work into providing the necessary mechanisms to de-privilege SMI
handlers, just to pick a recent example. Hardware changes are coming,
and in the case of OpenPOWER and Arm it is already here, that will
enable kernels and hypervisors to de-privilege sections of their
processing logic depending on the risk, for example ensuring code
processing input from a hypercall cannot reach memory used by the
security server.

My point here is that instead of cementing a historical approach into
the code base, that perhaps it would be worth considering using a more
flexible approach that provides the necessary modularity to enable the
introduction of this kind of capability, even if today it is merely a
facade, without having to rework the interfaces to remove all the
secondary direct paths.

V/r,
dps

