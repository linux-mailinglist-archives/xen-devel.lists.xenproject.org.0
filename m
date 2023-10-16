Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6267CAFB3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 18:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617883.960967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQaL-0006Qe-2S; Mon, 16 Oct 2023 16:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617883.960967; Mon, 16 Oct 2023 16:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsQaK-0006OU-VK; Mon, 16 Oct 2023 16:36:52 +0000
Received: by outflank-mailman (input) for mailman id 617883;
 Mon, 16 Oct 2023 16:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2KAZ=F6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsQaJ-0005gR-HP
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 16:36:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35059009-6c42-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 18:36:51 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B3A264EE0737;
 Mon, 16 Oct 2023 18:36:50 +0200 (CEST)
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
X-Inumbo-ID: 35059009-6c42-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 18:36:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-next v2 5/8] x86/io_apic: address violation of
 MISRA C:2012 Rule 10.1
In-Reply-To: <d52fdb46-5ac2-fb0a-2b76-348acf4a5cff@suse.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <1fe7602b48cabb7710025f6b4e32e9b99a1faacd.1697123806.git.nicola.vetrini@bugseng.com>
 <d52fdb46-5ac2-fb0a-2b76-348acf4a5cff@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <dedfe060d6dc7e39555b2d41710c9691@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 17:42, Jan Beulich wrote:
> On 12.10.2023 17:28, Nicola Vetrini wrote:
>> The definition of IO_APIC_BASE contains a sum of an essentially enum
>> value (FIX_IO_APIC_BASE_0) that is positive with an index that, in all
>> instances, is unsigned, therefore the former is cast to unsigned, so 
>> that
>> the operands are of the same essential type.
>> 
>> No functional change.
>> ---
>>  xen/arch/x86/include/asm/io_apic.h | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> Oh, also - there's no S-o-b here.
> 
> Jan

Ah, good catch.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

