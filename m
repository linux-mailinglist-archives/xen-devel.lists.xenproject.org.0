Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4126286D117
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 18:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687389.1070784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfkVP-0005zQ-Nu; Thu, 29 Feb 2024 17:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687389.1070784; Thu, 29 Feb 2024 17:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfkVP-0005xd-L3; Thu, 29 Feb 2024 17:47:39 +0000
Received: by outflank-mailman (input) for mailman id 687389;
 Thu, 29 Feb 2024 17:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfkVO-0005xX-DJ
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 17:47:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f895295-d72a-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 18:47:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 000E6CE17A3;
 Thu, 29 Feb 2024 17:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B603C433F1;
 Thu, 29 Feb 2024 17:47:33 +0000 (UTC)
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
X-Inumbo-ID: 9f895295-d72a-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709228854;
	bh=h+725gTgwrWW08pKog7k0AVSNurxSbMcVAWqMnf9LZc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dwYdLPT7rlis1mT3+QBiGR/3MWL9Sr3zpjfp5qLrGntbU5FyxMsZ9JQPZgPlnhbXf
	 JqblHLMqTr+xpXbbUUgw2gTs4+PpufxZPqU8VTDQLiBYZ6c74ETPPQIScZ3mBxIR0d
	 Gyh05sVzIMTYQWGPfkN3AO4Bm3kdopL0MvC0ElI5+PfGoaQGH9t0IvkpeUj94jl0Zq
	 H+2zcxEzBgUotVaSJUdx27/kdix9CZsSEXhBFUZ94JA2q+E7g0X+8PdfuiEW30JNNL
	 i/8ppn5yTJK7/BwpNYLdC7xVbeDJTyXSzryei6Zyy2fFNZbW+Zqf0kF0GkL04ia7F8
	 1wP5XnU9eJxQA==
Date: Thu, 29 Feb 2024 09:47:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Kelly Choi <kelly.choi@cloud.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, michal.orzel@amd.com
Subject: Re: preparations for 4.18.1
In-Reply-To: <00881c6e-22a5-4283-b071-a9b92fbaf89a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402290945210.853156@ubuntu-linux-20-04-desktop>
References: <7dc621a0-924c-499c-86c1-c35ec1f34ec2@suse.com> <1f251f2e-91de-4f81-a93c-dcb95746d2e5@xen.org> <5a4e8583-7747-4f24-94f0-d040dabb5b04@suse.com> <521a4d3b-8ef1-4449-97bd-1a3d3e0e35ec@xen.org> <alpine.DEB.2.22.394.2402281445450.575685@ubuntu-linux-20-04-desktop>
 <00881c6e-22a5-4283-b071-a9b92fbaf89a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Feb 2024, Jan Beulich wrote:
> On 28.02.2024 23:45, Stefano Stabellini wrote:
> > On Wed, 28 Feb 2024, Julien Grall wrote:
> >> On 28/02/2024 12:58, Jan Beulich wrote:
> >>> On 28.02.2024 12:50, Julien Grall wrote:
> >>>> On 27/02/2024 13:19, Jan Beulich wrote:
> >>>>> the release is due in two to three weeks. Please point out backports you
> >>>>> find
> >>>>> missing from the respective staging branch, but which you consider
> >>>>> relevant.
> >>>>
> >>>> For Arm:
> >>>>
> >>>> e11f576650 ("xen/arm: Fix UBSAN failure in start_xen()")
> >>>
> >>> Which I assume you or Stefano will take care of?
> >>
> >> I was expecting Stefano would do it as he did the backports in the past.
> 
> Was it deliberate that you did not also put it on the 4.17 branch?

Yes, I wasn't sure how far back we want to backport so I thought it
would be better to check with Julien and Michal.

