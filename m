Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B64773BB7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:54:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580086.908378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTP22-00059J-BR; Tue, 08 Aug 2023 15:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580086.908378; Tue, 08 Aug 2023 15:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTP22-00056R-7s; Tue, 08 Aug 2023 15:54:02 +0000
Received: by outflank-mailman (input) for mailman id 580086;
 Tue, 08 Aug 2023 15:54:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTP20-00056I-Gu
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:54:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c95bd1f8-3603-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:53:59 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3779B4EE0737;
 Tue,  8 Aug 2023 17:53:58 +0200 (CEST)
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
X-Inumbo-ID: c95bd1f8-3603-11ee-b280-6b7b168915f2
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 17:53:58 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>, Dario
 Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
In-Reply-To: <be588477-cafd-4875-aeef-9b17206a5cc5@xen.org>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
 <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org>
 <5135e7ac-1025-3a45-7cf6-d049a15b8df5@suse.com>
 <be588477-cafd-4875-aeef-9b17206a5cc5@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <cde2ae86db8ba9a86ce5afdb9f47a4e4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>> 
>> ... "return" alone already tells the compiler that "break" is
>> unreachable. You don't need unreachable() for that. As said before,
>> "break" like this simply want purging (and Misra is wrong to demand
>> "break" everywhere - it should instead demand no [unannotated]
>> fall-through, which can also be achieved by return, continue, and
>> goto).
> 
> My suggestion was in the context of this series where we add
> ASSERT_UNREACHABLE() before break. From my understanding, we don't
> have a lot of leeway here because, from what Nicola wrote, rule 16.3
> is mandatory.
> 
> So I think using unreachable is better if we every decide to use break
> after return.
> 
> Cheers,

16.3 is not Mandatory, just Required. I was just reluctant to knowingly 
add one more violation
while fixing another before submitting the patch. If indeed 16.3 won't 
likely be adopted by Xen,
then that break should indeed go away.

However, the main thing that's holding me back from doing a slimmed-down 
v2 here is that
evidently there's no consensus even on the ASSERT_UNREACHABLE() patches.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

