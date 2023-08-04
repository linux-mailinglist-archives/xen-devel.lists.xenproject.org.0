Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2225176FDCF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577054.903881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrSC-0003JN-0R; Fri, 04 Aug 2023 09:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577054.903881; Fri, 04 Aug 2023 09:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrSB-0003HB-Tw; Fri, 04 Aug 2023 09:50:39 +0000
Received: by outflank-mailman (input) for mailman id 577054;
 Fri, 04 Aug 2023 09:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRrSA-0003Gv-Ek
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:50:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d17331c-32ac-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 11:50:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1DA324EE0737;
 Fri,  4 Aug 2023 11:50:37 +0200 (CEST)
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
X-Inumbo-ID: 5d17331c-32ac-11ee-b26b-6b7b168915f2
MIME-Version: 1.0
Date: Fri, 04 Aug 2023 11:50:37 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
In-Reply-To: <8672f79a-3e44-1cc3-b448-9ee4a4ed9090@suse.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop>
 <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
 <6a5260299c5822abfbd74749ebea8f8f@bugseng.com>
 <8672f79a-3e44-1cc3-b448-9ee4a4ed9090@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <e410b61c94f0f35958e288421f1834d0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>>> 
>>> This pattern (two closing braces at the same level) is why switch 
>>> scope
>>> variable declarations were introduced (at least as far as 
>>> introductions
>>> by me go). If switch scope variables aren't okay (which I continue to
>>> consider questionable), then this stylistic aspect needs sorting 
>>> first
>>> (if everyone else thinks the above style is okay - with the missing
>>> blank line inserted -, then so be it).
>> 
>> Actually, they can be deviated because they don't result in wrong code
>> being generated.
> 
> Only later I recalled Andrew's intention to possibly make use of
> -ftrivial-auto-var-init. While, unlike I think he said, such declared
> variables aren't getting in the way of this (neither gcc nor clang
> warn about them), they also don't benefit from it (i.e. they'll be
> left uninitialized despite the command line option saying otherwise).
> IOW I think further consideration is going to be needed here.
> 
> Jan

Well, in that case I'm happy if I can contribute in some way to the 
discussion, but
perhaps this is best sorted out in a separate discussion, so that later 
I can send a v2
reflecting the decision(s).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

