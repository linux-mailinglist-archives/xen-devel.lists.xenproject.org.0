Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F6676A9E9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573723.898695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjjq-00065J-Et; Tue, 01 Aug 2023 07:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573723.898695; Tue, 01 Aug 2023 07:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjjq-00062l-Bs; Tue, 01 Aug 2023 07:24:14 +0000
Received: by outflank-mailman (input) for mailman id 573723;
 Tue, 01 Aug 2023 07:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSu=DS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQjjo-00062e-Lk
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:24:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6943176e-303c-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 09:24:11 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 59B7A4EE0737;
 Tue,  1 Aug 2023 09:24:11 +0200 (CEST)
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
X-Inumbo-ID: 6943176e-303c-11ee-b259-6b7b168915f2
MIME-Version: 1.0
Date: Tue, 01 Aug 2023 09:24:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH 4/4] arm/efi: address MISRA C:2012 Rule 5.3
In-Reply-To: <8165e7b1-4eef-7b13-32f3-05ff38837100@xen.org>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
 <c153e4fbe19510ba1244024e7a4b8897c86afd3a.1690810346.git.nicola.vetrini@bugseng.com>
 <8165e7b1-4eef-7b13-32f3-05ff38837100@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <d7d2553c68b008ff54c765ffa0a0f9da@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 31/07/2023 16:01, Julien Grall wrote:
> Hi,
> 
> On 31/07/2023 14:35, Nicola Vetrini wrote:
>> Rule 5.3 has the following headline:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>> 
>> The parameter 'fdt' in static function within this file is removed,
>> as they served no purpose and shadowed the homonymous variable.
> 
> I am not convinced this is a good idea to keep 'fdt' as static
> variable around because the name is too generic. Also in the future we
> may be able to remove the global static variable.
> 
> This means that most of this patch will be reverted.
> 
> So as I wrote on Matrix, I would rather prefer if the global variable
> is renamed to 'fdt_efi'.
> 
> Cheers,

Will do. Changing the parameters seemed less messy, but I'm fine either 
way, so
I'll submit a v2 with that rename.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

