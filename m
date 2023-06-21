Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7667384D8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 15:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552782.863050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxmP-000094-1p; Wed, 21 Jun 2023 13:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552782.863050; Wed, 21 Jun 2023 13:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxmO-00007A-U6; Wed, 21 Jun 2023 13:21:48 +0000
Received: by outflank-mailman (input) for mailman id 552782;
 Wed, 21 Jun 2023 13:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VkdJ=CJ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qBxmO-000074-2p
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 13:21:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 920ccee0-1036-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 15:21:46 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.44.212.241])
 by support.bugseng.com (Postfix) with ESMTPSA id EBF514EE0737;
 Wed, 21 Jun 2023 15:21:37 +0200 (CEST)
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
X-Inumbo-ID: 920ccee0-1036-11ee-8611-37d641c3527e
Message-ID: <cbf75735-4baf-bbb8-cae9-9529c277294a@bugseng.com>
Date: Wed, 21 Jun 2023 15:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [XEN PATCH v2] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
 <0ba16220-64a6-63bf-a1b8-77dcc847d2ed@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <0ba16220-64a6-63bf-a1b8-77dcc847d2ed@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/06/23 12:27, Jan Beulich wrote:
> On 20.06.2023 14:10, Roberto Bagnara wrote:
>> +   * - static function is used in an inline function with external linkage
>> +     - ARM64, X86_64
>> +     - Non-documented GCC extension. An inline function with external linkage
>> +       can be inlined everywhere. If that calls a static functions, which is
>> +       not available everywhere, it is a constraint violation according to
>> +       C99 6.7.4p3: "An inline definition of a function with external linkage
>> +       shall not contain a definition of a modifiable object with static
>> +       storage duration, and shall not contain a reference to an identifier
>> +       with internal linkage."  A standard-compliant C compiler ought
>> +       to diagnose all constraint violations: when it does not, as is the
>> +       case for GCC, the behavior is implicitly undefined.
> 
> With _spin_lock_cb() taken care of, do we have any left? Or else can this
> be dropped?

Dropped both from the document and the tool configuration.

    Roberto


