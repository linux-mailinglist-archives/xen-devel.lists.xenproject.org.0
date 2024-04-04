Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D8898860
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 14:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700867.1094614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsMgm-0006e1-79; Thu, 04 Apr 2024 12:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700867.1094614; Thu, 04 Apr 2024 12:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsMgm-0006bV-3q; Thu, 04 Apr 2024 12:59:32 +0000
Received: by outflank-mailman (input) for mailman id 700867;
 Thu, 04 Apr 2024 12:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPXS=LJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsMgk-0006bP-QE
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 12:59:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ba32ba9-f283-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 14:59:28 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E12D54EE073C;
 Thu,  4 Apr 2024 14:59:27 +0200 (CEST)
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
X-Inumbo-ID: 2ba32ba9-f283-11ee-a1ef-f123f15fe8a2
MIME-Version: 1.0
Date: Thu, 04 Apr 2024 14:59:27 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 xen-devel@lists.xenproject.org
Subject: Re: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
In-Reply-To: <f922e7af-9415-44dd-8c05-6eb093080ed6@suse.com>
References: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
 <f922e7af-9415-44dd-8c05-6eb093080ed6@suse.com>
Message-ID: <f3d829870e8f673f21106b8d062eb29f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-28 11:25, Jan Beulich wrote:
> On 11.07.2023 18:40, Roberto Bagnara wrote:
>> Mandatory Rule 19.1 (An object shall not be assigned or copied to an
>> overlapping object) is directly targeted at two undefined behaviors,
>> one of which is the subject of 6.5.16.1p3, namely:
>> 
>>    If the value being stored in an object is read from another object
>>    that overlaps in any way the storage of the first object, then the
>>    overlap shall be exact and the two objects shall have qualified or
>>    unqualified versions of a compatible type; otherwise, the behavior
>>    is undefined.
> 
> I'd like to come back to this, for two reasons:
> 
> 1) In the description of -fstrict-aliasing, gcc 13.2 doc says "Even 
> with
> -fstrict-aliasing, type-punning is allowed, provided the memory is 
> accessed
> through the union type." We even build with -fno-strict-aliasing, yet
> misra/rules.rst has no mention at all of type punning being permitted.
> 
> 2) With us using -fno-strict-aliasing, I wonder in how far e.g. commit
> 7225f13aef03 ("x86: avoid Misra Rule 19.1 violations") wasn't 
> pointless, as
> imo the "compatible types" part of the C spec clause then can be 
> treated as
> irrelevant.
> 
> To me both simply mean we're relying on another compiler extension 
> that's
> not exactly spelled out as such.
> 
> Opinions?
> 
> Jan

Regardless of whether the compiler will do the right thing or not, 
Mandatory guidelines can't be deviated.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

