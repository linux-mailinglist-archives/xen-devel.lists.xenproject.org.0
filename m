Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1567CDC4F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 14:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618552.962324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt62Y-00015N-BY; Wed, 18 Oct 2023 12:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618552.962324; Wed, 18 Oct 2023 12:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt62Y-00012w-8m; Wed, 18 Oct 2023 12:52:46 +0000
Received: by outflank-mailman (input) for mailman id 618552;
 Wed, 18 Oct 2023 12:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVsY=GA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qt62W-00012o-Ub
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 12:52:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a45bacc-6db5-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 14:52:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CDED84EE0739;
 Wed, 18 Oct 2023 14:52:42 +0200 (CEST)
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
X-Inumbo-ID: 3a45bacc-6db5-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Wed, 18 Oct 2023 14:52:42 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, roger.pau@citrix.com, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: MISRA C:2012 D4.11 caution on staging
In-Reply-To: <c47528e7-e202-4b5b-85ae-3bb0d1d0b608@xen.org>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
 <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com>
 <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com>
 <26f09702-9340-41ae-afcc-808becb67876@citrix.com>
 <75a00257-c062-4d82-9b64-1707ce4566e6@xen.org>
 <594c09e1f8b2e1e8321c2cb862fcb378@bugseng.com>
 <5ddb6398-f2a3-4bcb-8808-bad653b6c3cd@xen.org>
 <c4f4f1fc-b20a-c08f-9782-9ce06f6dd868@suse.com>
 <3573c8c2-1a9c-444c-a542-539b16f689f2@xen.org>
 <8c25bfd7768d6b290362f56a8b8d44d9@bugseng.com>
 <c47528e7-e202-4b5b-85ae-3bb0d1d0b608@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <87b5936151ace813d9dc9592ee35f86e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2023 14:38, Julien Grall wrote:
> Hi Nicola,
> 
> On 18/10/2023 13:30, Nicola Vetrini wrote:
>> On 17/10/2023 15:28, Julien Grall wrote:
>> I tested this, and the report is prevented by the ASSERT. It's up to 
>> the maintainers to
>> decide how do you want to proceed: my suggestion is deviating it,
> 
> It is not clear to me what would you deviate. Can you clarify?
> 
> Cheers,

The memcpy call, as in:

/* SAF-x-false-positive-eclair */
memcpy(d->handle, config->handle, sizeof(d->handle));

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

