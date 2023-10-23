Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE07D2D0C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621082.967131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqXr-0003Zz-Gw; Mon, 23 Oct 2023 08:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621082.967131; Mon, 23 Oct 2023 08:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqXr-0003Xh-Dw; Mon, 23 Oct 2023 08:44:19 +0000
Received: by outflank-mailman (input) for mailman id 621082;
 Mon, 23 Oct 2023 08:44:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1quqXq-0003XZ-Dr
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:44:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5986644c-7180-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 10:44:16 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A890E4EE0740;
 Mon, 23 Oct 2023 10:44:16 +0200 (CEST)
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
X-Inumbo-ID: 5986644c-7180-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 10:44:16 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v2] xen: Add SAF deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <23f2682f-acc4-20aa-21fc-644a3c1141b5@suse.com>
References: <a9c52c943380f2c35f0a6ccab8215c03e87c99dc.1697712857.git.nicola.vetrini@bugseng.com>
 <de2b666e-ca48-58d2-73eb-5adc797f818e@suse.com>
 <d879b8e4689e51131f081edcb3b2abe6@bugseng.com>
 <dd58e1cb-8f17-986d-f4f9-f39e998e05a0@suse.com>
 <5b1cd4fba12664f2ef49bcc2eb198e31@bugseng.com>
 <d83c024b-05a9-5298-9e43-e693675c2da5@suse.com>
 <6a90edf81f410db8069526228de75d7e@bugseng.com>
 <7d7ebafa-9751-bd0a-c47a-1894d9edadf5@suse.com>
 <800b2c809829942210323804b6778c40@bugseng.com>
 <23f2682f-acc4-20aa-21fc-644a3c1141b5@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <564217259e2f65e34d3497697bd5f9e5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>>>> 3. an use of MASK_EXTR() in x86/hvm/svm/emulate.c appears, with 
>>>> octal
>>>>     constants in the expansion. This will be deviated;
>>> 
>>> This is what I'm concerned of: How do you know up front whether such
>>> new
>>> uses want deviating?
>> 
>> I understand you concern now. I can argue that all the macros in that
>> table have indeed
>> an octal constant in their definition (0 is explicitly allowed by
>> MISRA).
>> This is also specified in the comment above the INSTR_ENC macro
>> definition, therefore any
>> new addition should have an octal the second argument to INSTR_ENC.
> 
> Right, and I previously indicated I agree as far as INSTR_ENC() goes.
> What we appear to continue to disagree about is MASK_EXTR().
> 

Yeah, sorry. What about

if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) && /* octal-ok */
      (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* octal-ok */
      (modrm_rm  & 7) == MASK_EXTR(instr_modrm, 0007) )  /* octal-ok */
             return emul_len;

It does not really fit in the SAF framework, because the deviation is 
still done with a
configuration, but at least it gives some clear indication on how to 
introduce an octal
constant in this file.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

