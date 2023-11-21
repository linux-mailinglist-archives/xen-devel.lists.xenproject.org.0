Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466927F2A6A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 11:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637718.993704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5O28-0008QS-6D; Tue, 21 Nov 2023 10:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637718.993704; Tue, 21 Nov 2023 10:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5O28-0008NB-1w; Tue, 21 Nov 2023 10:31:08 +0000
Received: by outflank-mailman (input) for mailman id 637718;
 Tue, 21 Nov 2023 10:31:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f+q9=HC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r5O27-0008N5-7L
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 10:31:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11abf2d7-8859-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 11:31:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1CE144EE073A;
 Tue, 21 Nov 2023 11:31:02 +0100 (CET)
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
X-Inumbo-ID: 11abf2d7-8859-11ee-98e1-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 11:31:02 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
In-Reply-To: <764e7329-166a-4399-9e59-f69feca80137@suse.com>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <732f722b-fcdd-4a69-9c32-5c306e81c998@suse.com>
 <5fdbf9db5f45272bd25cf1b4b3184357@bugseng.com>
 <764e7329-166a-4399-9e59-f69feca80137@suse.com>
Message-ID: <3f148318b3d642200761e6e18aba7957@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-21 11:18, Jan Beulich wrote:
> On 21.11.2023 10:46, Nicola Vetrini wrote:
>> On 2023-11-21 10:16, Jan Beulich wrote:
>>> On 16.11.2023 10:08, Nicola Vetrini wrote:
>>>> The comment-based justifications for MISRA C:2012 Rule 8.4 are
>>>> replaced
>>>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>>>> 
>>>> Add missing 'xen/compiler.h' #include-s where needed.
>>>> 
>>>> The text in docs/misra/deviations.rst and docs/misra/safe.json
>>>> is modified to reflect this change.
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> This patch should be applied after patch 2 of this series.
>>> 
>>> Code changes look okay to me, but I'm afraid I don't understand the
>>> remark
>>> above, and hence I fear I might be missing something.
>> 
>> Since on v2 it was observed that I forgot to state the dependency of
>> this patch on the R8.4 series, I added that comment here (otherwise
>> there would be no definition of asmlinkage).
> 
> IOW instead of "this series" you really meant to quote the title of 
> that
> other series?
> 
> Jan

I pasted the link to the mentioned series a couple of lines below. I 
should have put a reference to make this clearer.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

