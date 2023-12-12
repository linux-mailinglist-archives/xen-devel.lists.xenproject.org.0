Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC380EDCC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 14:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653142.1019435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2xm-0007m3-Ab; Tue, 12 Dec 2023 13:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653142.1019435; Tue, 12 Dec 2023 13:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2xm-0007jB-7j; Tue, 12 Dec 2023 13:38:18 +0000
Received: by outflank-mailman (input) for mailman id 653142;
 Tue, 12 Dec 2023 13:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5yJ=HX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rD2xl-0007j5-3f
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 13:38:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3bfc1ec-98f3-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 14:38:15 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 32DC44EE0737;
 Tue, 12 Dec 2023 14:38:15 +0100 (CET)
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
X-Inumbo-ID: b3bfc1ec-98f3-11ee-98e8-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 12 Dec 2023 14:38:15 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 7/7] x86/xstate: move BUILD_BUG_ON to address MISRA
 C:2012 Rule 2.1
In-Reply-To: <af20721d-c353-4327-8ae2-6e803de4ba37@suse.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <a969550faea681c69730c0968264781f7739670d.1702283415.git.nicola.vetrini@bugseng.com>
 <1d05baf2-e262-4151-b5a3-308f0ffa1e97@suse.com>
 <af20721d-c353-4327-8ae2-6e803de4ba37@suse.com>
Message-ID: <06787876c18401f7adbfb23f7f91ee84@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-12 11:07, Jan Beulich wrote:
> On 12.12.2023 11:04, Jan Beulich wrote:
>> On 11.12.2023 11:30, Nicola Vetrini wrote:
>>> The string literal inside the expansion of BUILD_BUG_ON is considered
>>> unreachable code; however, such statement can be moved earlier
>>> with no functional change.
>> 
>> First: Why is this deemed dead code in its present position, but okay 
>> when
>> moved? Second: While moving is indeed no functional change (really
>> BUILD_BUG_ON() can be moved about anywhere, for not producing any code 
>> in
>> the final binary), it removes the connection between it and the 
>> respective
>> asm() (where %z would have been nice to use).
> 
> Oh, and third: Which string literal? I expect you're not building with
> an ancient compiler, so it got to be
> 
> #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); 
> })
> 
> which you see in use. Yet that string literal isn't "code" or "data", 
> but
> an argument to _Static_assert(). Is Eclair perhaps not properly aware 
> of
> _Static_assert()?
> 
> Jan

On further inspection, this should have fallen into the deviation for 
pure decls. This patch can be dropped, we'll adjust this inside ECLAIR.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

