Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017F4D0AAB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 23:12:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286445.485963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRLZr-00014Q-1J; Mon, 07 Mar 2022 22:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286445.485963; Mon, 07 Mar 2022 22:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRLZq-00011b-TF; Mon, 07 Mar 2022 22:11:38 +0000
Received: by outflank-mailman (input) for mailman id 286445;
 Mon, 07 Mar 2022 22:11:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pTMl=TS=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1nRLZp-00011V-QG
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 22:11:37 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk
 (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dbbe816-9e63-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 23:11:36 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01a.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1nRLZm-0002r4-Ql; Mon, 07 Mar 2022 22:11:34 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1nRLZl-0006j5-Mf; Mon, 07 Mar 2022 22:11:34 +0000
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
X-Inumbo-ID: 8dbbe816-9e63-11ec-8eba-a37418f5ba1a
Message-ID: <445970ed-4237-4bba-6701-b7223e93ae12@cantab.net>
Date: Mon, 7 Mar 2022 22:11:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20220307205313.31247-1-andrew.cooper3@citrix.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <20220307205313.31247-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH] x86/kexec: Fix kexec-reboot with CET active
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01a-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41

On 07/03/2022 20:53, Andrew Cooper wrote:
> The kexec_reloc() asm has an indirect jump to relocate onto the identity
> trampoline.  While we clear CET in machine_crash_shutdown(), we fail to clear
> CET for the non-crash path.  This in turn highlights that the same is true of
> resetting the CPUID masking/faulting.
> 
> Move both pieces of logic from machine_crash_shutdown() to machine_kexec(),
> the latter being common for all kexec transitions.  Adjust the condition for
> CET being considered active to check in CR4, which is simpler and more robust.

Reviewed-by: David Vrabel <dvrabel@amazon.co.uk>

> Fixes: 311434bfc9d1 ("x86/setup: Rework MSR_S_CET handling for CET-IBT")
> Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
> Fixes: 5ab9564c6fa1 ("x86/cpu: Context switch cpuid masks and faulting state in context_switch()")
> Reported-by: David Vrabel (XXX which alias to use?)

Amazon, please.

David

