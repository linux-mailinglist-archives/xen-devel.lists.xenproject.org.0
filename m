Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709FFCB6642
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:54:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184307.1506786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTizO-00050u-LS; Thu, 11 Dec 2025 15:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184307.1506786; Thu, 11 Dec 2025 15:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTizO-0004yU-Ib; Thu, 11 Dec 2025 15:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1184307;
 Thu, 11 Dec 2025 15:53:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BerU=6R=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTizN-0004yO-Mn
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:53:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99623710-d6a9-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 16:53:56 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 16B5B4EEBC6E;
 Thu, 11 Dec 2025 16:53:55 +0100 (CET)
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
X-Inumbo-ID: 99623710-d6a9-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765468435;
	b=Rmxg0UOE7LDNSQ+OakoJd9aOn0bPQtNOD4WpxRgMHu3hEkJETn9FwZN2zaYTNyIlWNdA
	 KejWnRcHTXKe2OY9NElRklJljSB5rg9cyZ42Hh2R1lsDujEveX/cLkgy5BqREcChQAi9H
	 YNO33nJz5Zv9H/PcyDt651hl0LM0NDD0PJSzn2A0o8yFZpDvAcULl9LWBj3Fgx/UhttRS
	 6QmhlZHx1CXqBS9qKvKP3vV4Ju83LHDE+uJts4zFsH1jebaiCfjdc0o6j99FvXDEArtBp
	 xqUhpEqyYcQe1LYjNFgHjhzaGtYbqlq5xe2X8glJ5lAYP2Cn9IQ/pyC9uJJmMC3sXqHK9
	 o/HF9f4/3t1AaLxU8WGZNwGoHF3boEulvaDGXXY7UKxEWWyPZshtI9kwHmfCv3XFAddxC
	 rRuqrOLkzMmmiH71a3B8n3PgU6KFxjDt5zyKyrgC7WOZGcnEadU3FQ3QXXVMNyWM/DOcq
	 2521/Hszbm+tTEskw3LIygeEMoanmE0+zzGsUvBtLJzfCcYHWjRfElzHPk3pD7u46lv3M
	 wJopMlg31Ppy9jKs5wwfcIA3/uHxPJo4YcvLG7smB2RhGZNo31SJC5O3Ul300D16iXemz
	 zMe9CnW6wQnEJuFyLRtnzY6Whbycz1vq0d/ZZe/nfK6ghdsT4X82gH8BYm9xZf8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765468435;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=edBA1z/pXzn+Zf6HmhT9Cd0ynY3hmVg0pQTsm5cTPDU=;
	b=vq5ZYyZnVsMrGdgCMEC72/TXeYjTBTj4Wcre3bJZAteqrHUgusel7dJEtXptfP3VIoLU
	 XYafCW4kj+hO/7o2zQ4ZDmODfprhcYQ/gGCGFaQlGPK0e1i81QprU6U8ivsokeypD80yX
	 kR2bZ2MBcpZ5QlFWYLxtSep4BXNGmdkj1v6XLXeJkmD2ODEPcsl6jWjFNH4x7cLgF2Ic9
	 pK05SuoqmUm7p/FkG5tu5rDgBKTH0cruw1q88BpA8dEwsbbpOJWUWqdWxxkuut2DioYyJ
	 bgZzr65Dh9IxqkDYoBmcNiGJACz5vQKHrmPODZhrWpgRpdhl3aABq3aqbwuD/7FrRWUzO
	 Gb5TSOrk7S+ap8CPIVrDTzLdNNAZEc/bbk2brl8++ppTpb9Fz/OgWN9krNZTyp+q9Fgi6
	 lvuJUR61fPpBNH3u6H5ITaixJgY9njBOr6eem1yYIl+wS4WMA326qeJdhVNoxAb1bF3QO
	 Q93VL4acXHOapF0sRNpqIJ5GogjNAB/qJuGj7IXZOFk8ldCW3Wr1dsKPAvAjLq/O4dBZa
	 I5kbYXYr63jgEPoBXrGyCRRTzFt5eyn1VgXAql7+64Fz5aOapEFGIJ+tzmGN+aegh4uYi
	 KqPUu9yyurAYIuQfgrT/wAgJRk2n/7nulcaB9k+yvKRfN6X1Tz1gyJTTNiU+i44=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765468435; bh=oU/w6HTpzx+EQXxcRLotoMULhpp17O+v8kCTC6xQbRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=smCjQA+qF/Jr01Lo8Ul4E7GkoZVmmMtpMcbEEYjLmJhtQ7aOVWy/3mYYyg0o4DcZn
	 jSel/rVyoxUrpbB6nkH3vhldPDIULMBt96e1Jun1dBmbY6ZotvvwSXltnOSZVg9haY
	 rEKpORnKF9Gb8nvEs/3yYx95FVqQ4bMbNPmdHFGI0hixM1jIl/NcYhORDpkYZhq4Jr
	 dtFd2hRjM7ACm7ySQiCTEJRDAAzZ6Tqvy62ZtiemFrRgPR1vPLQCUV4vxEVr99v3Ah
	 35CGE5cuW4vH9PiUxxqf+tKF02m9YsTNi2Tf6Bb88ertOE6n09DaUwsMnpiuCCQ1z+
	 i769F042tD1ig==
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 16:53:55 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Current Eclair analysis
In-Reply-To: <67d26857-6b7a-4b5d-8bdb-c973885926a0@suse.com>
References: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
 <c0d5cf8c-cb57-47a5-a989-f65677e565aa@suse.com>
 <dab08dfc1de25d7573c401ecad8a1f21@bugseng.com>
 <67d26857-6b7a-4b5d-8bdb-c973885926a0@suse.com>
Message-ID: <bbc741428e680a4b5b08442558f85941@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-11 11:50, Jan Beulich wrote:
> On 11.12.2025 11:08, Nicola Vetrini wrote:
>> On 2025-12-11 11:00, Jan Beulich wrote:
>>> On 10.12.2025 19:14, Andrew Cooper wrote:
>>>> The Eclair step is now the dominating aspect of wallclock time.  
>>>> While
>>>> the recent changes were a step in the right direction, we need some
>>>> adjustments.
>>> 
>>> One other question, related to the "dominating" aspect, but not to 
>>> any
>>> of the points raised so far. Can scan results possibly be recorded
>>> somehow, somewhere, such that upon re-scanning the same tree 
>>> (pre-push
>>> test followed by post-push test) the identical re-scan can be 
>>> avoided?
>>> And perhaps even incrementally - if only .c files change within a 
>>> (set
>>> of) commit(s), only re-scan those, rather than everything? Could be
>>> extended to .h files if dependencies were properly taken into 
>>> account.
>> 
>> We support incremental analysis, but it requires non-trivial changes 
>> to
>> the current Xen integration. If someone wants to invest time and/or
>> resources in it, I can support the effort, but it requires a fair deal
>> of rearrangements of scripting in order to avoid losing information
> 
> What about the initial part of the question, scanning the exact same 
> tree
> a 2nd time? Is that merely a special case of "incremental", and hence 
> would
> require the same amount of effort?
> 
> Jan

I originally misinterpreted your question, and in fact I had an internal 
discussion on this. What you are asking is not directly supported by 
eclair because ECLAIR acts based on compiler invocations triggered by 
the build system, so two different builds are entirely independent of 
each other, unless a correspondence between analyzed artifacts (analysis 
frames in ECLAIR jargon) is estabilished. Overall, in our opinion this 
is best done not internally by ECLAIR, but at a higher (or lower, 
depending on how you represent it) level, which is the build system 
level. The idea is basically as follows:

- set up ccache with a remote storage backend (one per machine where 
runners are hosted is probably the best approximation);
- let ccache be used transparently across multiple runs; it will trigger 
re-compilation only when the file is not already in its cache, and as a 
consequence trigger the analysis of that TU or program. Due to the 
dockerization of builds and how gitlab is set up this may require some 
fumbling with env vars to point to the right compilation cache, but 
should be doable without too much effort;
- For each run:
   - fetch the result from the base run (for some meaning of "base")
   - run an eclair incremental analysis using option +project. This runs 
the Xen build as usual, but using ccache (I think other projects such as 
Zephyr already do something similar in their CI);
   - load new results in the old database, substituting evidences related 
to the same TU (done with a specific eclair_report flag).

In essence this covers both usecases, but it requires a nontrivial 
amount of effort.

N.B. ECLAIR does not use ccache internally: its concept of incremental 
analysis is completely orthogonal to the one that ccache uses.


-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

