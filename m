Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40F8059F0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 17:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648124.1012142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYEw-0007AG-Bj; Tue, 05 Dec 2023 16:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648124.1012142; Tue, 05 Dec 2023 16:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYEw-00078c-90; Tue, 05 Dec 2023 16:25:42 +0000
Received: by outflank-mailman (input) for mailman id 648124;
 Tue, 05 Dec 2023 16:25:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tw6T=HQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rAYEv-00077J-DM
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 16:25:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edd6dff0-938a-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 17:25:40 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9CD2E4EE0741;
 Tue,  5 Dec 2023 17:25:39 +0100 (CET)
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
X-Inumbo-ID: edd6dff0-938a-11ee-98e5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 05 Dec 2023 17:25:39 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/DMI: adjustments to comply with Misra C:2012 Rule
 9.3
In-Reply-To: <1ca903e7-ed2c-435e-999d-2a8519957498@suse.com>
References: <1ca903e7-ed2c-435e-999d-2a8519957498@suse.com>
Message-ID: <4d4c07c874575ab09d96f5dcfceeeff7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 2023-12-05 14:35, Jan Beulich wrote:
> The rule demands that all array elements be initialized (or dedicated
> initializers be used). Introduce a small set of macros to allow doing 
> so
> without unduly affecting use sites (in particular in terms of how many
> elements .matches[] actually has; right now there's no use of
> DMI_MATCH4(), so we could even consider reducing the array size to 3).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course a question is how many of these DMI table entries are in fact
> no longer applicable (e.g. because of naming 32-bit-only systems).
> Subsequently the table in dmi_scan.c itself may want cleaning up as
> well, yet I guess the question of stale entries is even more relevant
> there.
> ---
> v2: Make things also build with older gcc.
> 

Analyzed with ECLAIR for Rule 9.3: resolves all the violations related 
to DMI_MATCH.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

