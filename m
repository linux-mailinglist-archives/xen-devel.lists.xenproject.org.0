Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F605449C4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 13:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345060.570704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzG4J-0002go-HY; Thu, 09 Jun 2022 11:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345060.570704; Thu, 09 Jun 2022 11:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzG4J-0002dx-Dx; Thu, 09 Jun 2022 11:11:15 +0000
Received: by outflank-mailman (input) for mailman id 345060;
 Thu, 09 Jun 2022 11:11:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fG7=WQ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1nzG4I-0002dm-5c
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 11:11:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de3ecbb3-e7e4-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 13:11:12 +0200 (CEST)
Received: from [192.168.1.137] (host-82-59-248-251.retail.telecomitalia.it
 [82.59.248.251])
 by support.bugseng.com (Postfix) with ESMTPSA id 7FDC44EE0CDD;
 Thu,  9 Jun 2022 13:11:09 +0200 (CEST)
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
X-Inumbo-ID: de3ecbb3-e7e4-11ec-bd2c-47488cf2e6aa
Message-ID: <45c4d8fa-06de-b4a2-5688-14b9cbe5b48c@bugseng.com>
Date: Thu, 9 Jun 2022 13:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew.Cooper3@citrix.com,
 julien@xen.org, Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
 <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
 <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
 <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/22 04:17, Stefano Stabellini wrote:
 > # Rule 9.1 "The value of an object with automatic storage duration shall not be read before it has been set"
 >
 > The question is whether -Wuninitalised already covers this case or not.
 > I think it does.
 >
 > Eclair is reporting a few issues where variables are "possibly
 > uninitialized". We should ask Roberto about them, I don't think they are
 > actual errors? More like extra warnings?

No, -Wuninitialized is not reliable, as it has plenty of (well known)
false negatives.  This is typical of compilers, for which the generation
of warnings is only a secondary objective.  I wrote about that here:

   https://www.bugseng.com/blog/compiler-warnings-use-them-dont-trust-them

On the specifics:

$ cat p.c
int foo (int b)
{
     int a;

     if (b)
     {
         a = 1;
     }

     return a;
}

$ gcc -c -W -Wall -Wmaybe-uninitialized -O3 p.c
$ gcc -c -W -Wall -Wuninitialized -O3 p.c
$

Note that the example is less contrived than you might think.
See, JF Bastien's talk at 2019 LLVM Developers' Meeting:

   https://www.youtube.com/watch?v=I-XUHPimq3o

More generally, you can only embrace MISRA if you agree on
its preventive nature, which is radically different from
the "bug finding" approach.  The point is rather simple:

1) static analysis alone cannot guarantee correctness;
2) peer review is unavoidable;
3) testing is unavoidable.

In order to effectively conduct a peer review, you cannot
afford being distracted every minute by the thought
"is this initialized?  where is it initialized?  with which
value is it initialized?"
In a MISRA setting, you want that the answer to such questions
is immediately clear to anyone.
In contrast, if you embrace bug finding (that is, checkers with
false negatives like the ones implemented by compilers),
you will miss instances that you may miss also with testing
(testing a program with UB does not give reliable results);
and you will likely miss them with peer review, unless you
can spend a lot of time and resources in the activity.

The checker implemented by ECLAIR for Rule 9.1 embodies this
principle: if it says "violation", then it is a definite
violation;  if it says "caution", then maybe there is no
UB, but a human will have to spend more than 30 seconds
in order to convince herself that there is no UB.

I understand this may sound frustrating to virtuoso programmers,
and there are many of them in the open source world.
But the truth is that virtuosity in programming is not a good
thing for safety-related development.   For safety you want
code that is simple and straightforward to reason about.
Kind regards,

    Roberto




