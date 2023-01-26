Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63967D69F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 21:44:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485217.752270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL95g-0001hf-AI; Thu, 26 Jan 2023 20:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485217.752270; Thu, 26 Jan 2023 20:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL95g-0001f0-6y; Thu, 26 Jan 2023 20:43:24 +0000
Received: by outflank-mailman (input) for mailman id 485217;
 Thu, 26 Jan 2023 20:43:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4vwE=5X=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pL95f-0001eu-AT
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 20:43:23 +0000
Received: from ppsw-32.srv.uis.cam.ac.uk (ppsw-32.srv.uis.cam.ac.uk
 [131.111.8.132]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 129012a8-9dba-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 21:43:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:59324)
 by ppsw-32.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pL95d-000rTU-B9 (Exim 4.96) (return-path <amc96@srcf.net>);
 Thu, 26 Jan 2023 20:43:21 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3BBFB1FC8B;
 Thu, 26 Jan 2023 20:43:21 +0000 (GMT)
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
X-Inumbo-ID: 129012a8-9dba-11ed-a5d9-ddcf98b90cbd
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <8b4c6aa8-cdc5-50a3-2170-f4af80fe1a26@srcf.net>
Date: Thu, 26 Jan 2023 20:43:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <23ea08db-3b64-5d1a-6743-19abb7bd6529@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 2/4] x86/spec-ctrl: defer context-switch IBPB until
 guest entry
In-Reply-To: <23ea08db-3b64-5d1a-6743-19abb7bd6529@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/01/2023 3:26 pm, Jan Beulich wrote:
> In order to avoid clobbering Xen's own predictions, defer the barrier as
> much as possible.

I can't actually think of a case where this matters.  We've done a
reasonable amount of work to get rid of indirect branches, and rets were
already immaterial because of the reset_stack_and_jump().

What I'm trying to figure out is whether this ends up hurting us.  If
there was an indirect call we used reliably pre and post context switch,
that changed target based on the guest type, then we'd now retain and
use the bad prediction.

>  Merely mark the CPU as needing a barrier issued the
> next time we're exiting to guest context.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I couldn't find any sensible (central/unique) place where to move the
> comment which is being deleted alongside spec_ctrl_new_guest_context().

Given this, I'm wondering whether in patch 1, it might be better to name
the new bit SCF_new_guest_context.  Or new_pred_context context (which
on consideration, I think is better than the current name)?

This would have a knock-on effect on the feature names, which I think is
important because I think you've got a subtle bug in patch 3.

The comment really wants to stay, and it could simply move into
spec_ctrl_asm.h at that point.

~Andrew

