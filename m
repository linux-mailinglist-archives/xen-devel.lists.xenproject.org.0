Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD679105B2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 15:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744482.1151520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKHhV-0002wd-Mi; Thu, 20 Jun 2024 13:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744482.1151520; Thu, 20 Jun 2024 13:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKHhV-0002v6-Jo; Thu, 20 Jun 2024 13:19:41 +0000
Received: by outflank-mailman (input) for mailman id 744482;
 Thu, 20 Jun 2024 13:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DyN3=NW=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sKHhU-0002v0-79
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 13:19:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beee9dc0-2f07-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 15:19:39 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 48A504EE0738;
 Thu, 20 Jun 2024 15:19:38 +0200 (CEST)
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
X-Inumbo-ID: beee9dc0-2f07-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Thu, 20 Jun 2024 15:19:38 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] automation/eclair_analysis: deviate common/unlzo.c for
 MISRA Rule 7.3
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <alpine.DEB.2.22.394.2406191817310.2572888@ubuntu-linux-20-04-desktop>
References: <20342a68627d5fe7c85c50f64e9300e9a587974b.1718704260.git.alessandro.zucchelli@bugseng.com>
 <63d11da5-4a5a-4354-ab57-67fbb7110f45@suse.com>
 <alpine.DEB.2.22.394.2406191817310.2572888@ubuntu-linux-20-04-desktop>
Message-ID: <566b0cb9b718b5719a6b497b36e90ab4@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-20 03:17, Stefano Stabellini wrote:
> On Tue, 18 Jun 2024, Jan Beulich wrote:
>> On 18.06.2024 11:54, Alessandro Zucchelli wrote:
>> > The file contains violations of Rule 7.3 which states as following: The
>> > lowercase character `l' shall not be used in a literal suffix.
>> >
>> > This file defines a non-compliant constant used in a macro expanded in a
>> > non-excluded file, so this deviation is needed in order to avoid
>> > a spurious violation involving both files.
>> 
>> Imo it would be nice to be specific in such cases: Which constant? And
>> which macro expanded in which file?
> 
> Hi Alessandro,
> if you give me the details, I could add it to the commit message on 
> commit

Hi,

The file common/unlzo.c defines the non-compliant constant 
LZO_BLOCK_SIZE as
"256*1024l" (note the 'l'). This file is excluded from ECLAIR analysis 
but
as the constant is used in macro xmalloc_bytes, expanded in non-excluded 
file
include/xen/xmalloc.h, thus these specific violations need this 
configuration
in order to be excluded.

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

