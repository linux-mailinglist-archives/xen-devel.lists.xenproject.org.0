Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C33AB444
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 15:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143989.265125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltriB-00073b-58; Thu, 17 Jun 2021 13:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143989.265125; Thu, 17 Jun 2021 13:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltriB-00070y-29; Thu, 17 Jun 2021 13:05:35 +0000
Received: by outflank-mailman (input) for mailman id 143989;
 Thu, 17 Jun 2021 13:05:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ltri9-00070s-KH
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 13:05:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ltri9-0001BQ-JS
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 13:05:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ltri9-0003b2-IT
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 13:05:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1ltri4-0006e3-Nx; Thu, 17 Jun 2021 14:05:28 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=ZaBafeIL/+f2W/mLpVvaaOoiNkqJPEN8iiJhO0wIjFA=; b=1nBgI0JMvvsgSY/24xFxeDhMy5
	1gvUZGgHhwS81Z6yK0Hutidx58ogksFmfp0S3kJ3ndITwf5tk1iDJIZeTQs5STUhiNBJKLXIv3bRc
	GulEb0LkWgbIBwqdaqId3g4nr8Y/xwzBhxygfV6+zIhwVYJw6KZUYA6XG+hHXr8OZu+E=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24779.18584.523983.904660@mariner.uk.xensource.com>
Date: Thu, 17 Jun 2021 14:05:28 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    xen-devel@lists.xenproject.org,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    "committers\@xenproject.org"  <committers@xenproject.org>
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
In-Reply-To: <99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
References: <osstest-161917-mainreport@xen.org>
	<7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
	<b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
	<637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com>
	<99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Firstly, let me try to deal with substance and/or technical merit.

Jan, I am finding it difficult to follow in your message whether you
are asserting that your disputed change (to Xen) did not introduce a
vulnerability.

I think you are saying that there is no vulnerability, because in any
overall configuration where this is a vulnerability, the guest would
have to be making an unjustified assumption.

If this is your reasoning, I don't think it is sound.  The question is
not whether the assumption is justified or not (answering which
question seems to require nigh-incomprehensible exegesis of processor
documentation).

The question is whether any guest does in fact make that assumption.
If any do, then there is a vulnerability.  Whether that's a
vulnerability "in" Xen or "in" the guest is just a question of
finger-pointing.

If none do then there is no vulnerability.


On to process:

Jan Beulich writes ("Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions - FAIL"):
> On 16.06.2021 17:43, Andrew Cooper wrote:
> > I am very irritated that you have *twice* recently introduced security
> > vulnerabilities by bypassing my reviews/objections on patches.
> 
> I'm sorry, Andrew, but already in my original reply a month ago I did
> express that I couldn't find any record of you having objected to the
> changes. It doesn't help that you claim you've objected when you
> really didn't (which is the impression I get from not finding anything,
> and which also matches my recollection of what was discussed).

Andrew, can you provide references to your objections ?

> I don't think I know which 2nd instance you're referring to, and hence
> I can't respond to that aspect.

And, likewise, references for this.

> > In the case of this revert specifically, I did get agreement on IRC
> > before reverting.
> 
> How can I know you did? You didn't even care to reply to my mail from
> a month ago. And there was no reason to make an emergency out of this
> and ask on irc. You could have sent mail just like is done for all
> other normal bug fixes etc. Iirc I was on PTO at that time; it would
> hence only have been fair to wait until my return.

I think it would be good practice to copy and paste relevant IRC
discussions into email in this kind of situation.  That email also
makes space to properly write down what you are doing, that you
realise it is controversial, who you have consulted, and why you are
going ahead.

I looked at one of the two disputed reverts in Xen,
cb199cc7de987cfda4659fccf51059f210f6ad34, and it does not have any
tags indicating approval by anyone else.

Andy, if you got agreement on IRC, who from ? [1]

Ian.

[1] This may well have included me.  I do not reliably record this
kind of information in my wetware.  That is what we have computers
for.

