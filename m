Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A41181B56C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 13:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658858.1028272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGHkC-0006OP-Mv; Thu, 21 Dec 2023 12:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658858.1028272; Thu, 21 Dec 2023 12:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGHkC-0006Mj-Jq; Thu, 21 Dec 2023 12:01:40 +0000
Received: by outflank-mailman (input) for mailman id 658858;
 Thu, 21 Dec 2023 12:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zyZL=IA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rGHkB-0006Md-NN
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 12:01:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1fe8e20-9ff8-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 13:01:38 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D51044EE0742;
 Thu, 21 Dec 2023 13:01:37 +0100 (CET)
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
X-Inumbo-ID: b1fe8e20-9ff8-11ee-98eb-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 21 Dec 2023 13:01:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Federico Serafini
 <federico.serafini@bugseng.com>, consulting@bugseng.com, =?UTF-8?Q?Rog?=
 =?UTF-8?Q?er_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
In-Reply-To: <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com>
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
 <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
 <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com>
Message-ID: <eb53449bd6595ea0931460e62dd57b9c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 2023-12-21 12:03, Andrew Cooper wrote:
> On 21/12/2023 10:58 am, Jan Beulich wrote:
>> On 21.12.2023 11:53, Federico Serafini wrote:
>>> Remove declarations of __put_user_bad() and __get_user_bad()
>>> since they have no definition.
>>> Replace their uses with a break statement to address violations of
>>> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
>>> terminate every switch-clause").
>>> No functional change.
>>> 
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>> Several violations of Rule 16.3 come from uses of macros
>>> get_unsafe_size() and put_unsafe_size().
>>> Looking at the macro definitions I found __get_user_bad() and 
>>> __put_user_bad().
>>> I was wondering if instead of just adding the break statement I can 
>>> also remove
>>> such functions which seem to not have a definition.
>> No, you can't. Try introducing a caller which "accidentally" uses the
>> wrong size. Without your change you'll observe the build failing (in
>> a somewhat obscure way, but still), while with your change bad code
>> will silently be generated.
> 
> The construct here is deliberate.  It's a build time assertion that bad
> sizes aren't used.
> 
> __bitop_bad_size() and __xsm_action_mismatch_detected() are the same
> pattern in other areas of code too, with the latter being more explicit
> because of how it's wrapped by LINKER_BUG_ON().
> 
> 
> It is slightly horrible, and not the most obvious construct for
> newcomers.  If there's an alternative way to get a build assertion, we
> could consider switching to a new pattern.
> 
> ~Andrew

would you be in favour of a solution with a BUILD_BUG_ON in the default 
branch followed by a break?

default:
     BUILD_BUG_ON(!size || size >=8 || (size & (size - 1)));
     break;

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

