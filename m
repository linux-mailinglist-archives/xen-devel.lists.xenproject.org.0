Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D494580CEBB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652275.1018035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChgH-0007Y3-1e; Mon, 11 Dec 2023 14:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652275.1018035; Mon, 11 Dec 2023 14:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChgG-0007Ug-UV; Mon, 11 Dec 2023 14:54:48 +0000
Received: by outflank-mailman (input) for mailman id 652275;
 Mon, 11 Dec 2023 14:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rChgF-0007Ua-6X
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:54:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38ec11e6-9835-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 15:54:45 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D47AC4EE073E;
 Mon, 11 Dec 2023 15:54:44 +0100 (CET)
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
X-Inumbo-ID: 38ec11e6-9835-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Mon, 11 Dec 2023 15:54:44 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
In-Reply-To: <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
Message-ID: <c77560d6044700f10a8b149d539a95d1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-11 13:32, Julien Grall wrote:
> Hi,
> 
> On 11/12/2023 10:30, Nicola Vetrini wrote:
>> The branches of the switch after a call to 'do_unexpected_trap'
>> cannot return, but there is one path that may return, hence
>> only some clauses are marked with ASSERT_UNREACHABLE().
> I don't understand why this is necessary. The code should never be 
> reachable because do_unexpected_trap() is a noreturn().
> 
> Cheers,

It was meant as a safeguard against mistakes. There are MISRA rules that 
deal with this aspect (e.g., a noreturn function should not return), but 
they are not in Amendment 2, which is what Xen is following.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

