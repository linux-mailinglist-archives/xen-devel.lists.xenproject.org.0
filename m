Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153777E26B8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 15:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628027.979028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00XA-0004Zr-BK; Mon, 06 Nov 2023 14:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628027.979028; Mon, 06 Nov 2023 14:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r00XA-0004XS-8C; Mon, 06 Nov 2023 14:24:56 +0000
Received: by outflank-mailman (input) for mailman id 628027;
 Mon, 06 Nov 2023 14:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y50s=GT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r00X8-0004XM-Rw
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 14:24:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4003c4b0-7cb0-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 15:24:52 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5D7D94EE0740;
 Mon,  6 Nov 2023 15:24:52 +0100 (CET)
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
X-Inumbo-ID: 4003c4b0-7cb0-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Mon, 06 Nov 2023 15:24:52 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v4] xen: address violations of Rule 11.9
In-Reply-To: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com>
References: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com>
Message-ID: <fe9f04781ea1ad9bc5f9b92bf58cd09b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-19 09:55, Nicola Vetrini wrote:
> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
> compile-time check to detect non-scalar types; its usage for this
> purpose is deviated.
> 
> Furthermore, the 'typeof_field' macro is introduced as a general way
> to access the type of a struct member without declaring a variable
> of struct type. Both this macro and 'sizeof_field' are moved to
> 'xen/macros.h'.
> 
> No functional change intended.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v2:
> - added entry in deviations.rst
> Changes in v3:
> - dropped access_field
> - moved macro to macros.h
> ---
> Changes in v4:
> - Amend deviation record.
> ---

This patch has received some R-by-s, but no acks at the moment.
Perhaps at least one is needed to get this into 4.19?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

