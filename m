Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39417983AD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 10:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597845.932226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeWVX-0004We-21; Fri, 08 Sep 2023 08:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597845.932226; Fri, 08 Sep 2023 08:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeWVW-0004TJ-VY; Fri, 08 Sep 2023 08:06:26 +0000
Received: by outflank-mailman (input) for mailman id 597845;
 Fri, 08 Sep 2023 08:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCyG=EY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qeWVW-0004TD-At
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 08:06:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9affeb70-4e1e-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 10:06:25 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E84BD4EE0738;
 Fri,  8 Sep 2023 10:06:24 +0200 (CEST)
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
X-Inumbo-ID: 9affeb70-4e1e-11ee-8783-cb3800f73035
MIME-Version: 1.0
Date: Fri, 08 Sep 2023 10:06:24 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>, Doug Goldstein
 <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/3] automation/eclair: build docs/misra to address
 MISRA C:2012 Dir 4.1
In-Reply-To: <alpine.DEB.2.22.394.2309071723400.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com>
 <ade1b214fc0e3a59c007ae2cdff78dc33b614c64.1693558913.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2309071723400.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <c42938083003a14af371c3afdfbfe135@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2023 02:25, Stefano Stabellini wrote:
> On Fri, 1 Sep 2023, Nicola Vetrini wrote:
>> The documentation pertaining Directive 4.1 is contained in docs/misra.
>> The build script driving the analysis is amended to allow ECLAIR to
>> analyze such file.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  automation/eclair_analysis/build.sh   | 11 ++++++++---
>>  automation/eclair_analysis/prepare.sh |  5 +++--
>>  2 files changed, 11 insertions(+), 5 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/build.sh 
>> b/automation/eclair_analysis/build.sh
>> index ec087dd822fa..556ed698bf8b 100755
>> --- a/automation/eclair_analysis/build.sh
>> +++ b/automation/eclair_analysis/build.sh
>> @@ -34,11 +34,16 @@ else
>>  fi
>> 
>>  (
>> -  cd xen
>> -
>>    make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>>         "CROSS_COMPILE=${CROSS_COMPILE}"         \
>>         "CC=${CROSS_COMPILE}gcc-12"              \
>>         "CXX=${CROSS_COMPILE}g++-12"             \
>> -       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
>> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
>> +       -C docs misra
> 
> I don't think you need all these options to generate docs and misra.
> Probably it would be sufficient just make -C docs misra
> 
> However given that they are not harmful:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 

Ok, I'll try it out for the next version, otherwise I'll revert to this 
invocation.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

