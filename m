Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMjILHBue2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:28:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2CB0EFD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216637.1526591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSzt-0006Id-Op; Thu, 29 Jan 2026 14:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216637.1526591; Thu, 29 Jan 2026 14:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSzt-0006Gy-LQ; Thu, 29 Jan 2026 14:27:49 +0000
Received: by outflank-mailman (input) for mailman id 1216637;
 Thu, 29 Jan 2026 14:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ICVe=AC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vlSzs-0005x4-0V
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:27:48 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acfd4d5f-fd1e-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:27:45 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1769696848567136.48743967324322;
 Thu, 29 Jan 2026 06:27:28 -0800 (PST)
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
X-Inumbo-ID: acfd4d5f-fd1e-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1769696852; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RmRZrQhgTnx8pI0Vt/7hDJuJAkvazWPBtKFQWS/Q04u5dda1jYh92a0l/943939Q2Q+XmaWG12jLCZBtrregbmXwiNWeMZ46FF3Fxg0beWjvSRYCkMDtIRzo9R9EyxdPSGAiQVrStY5xkYAkp18QHZB2JgjiuZbohEqdtc7NVX8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769696852; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Csi40rQ6fKyJbiyM0FXQWkQQah5ioh+4oM6lP9s5imQ=; 
	b=LQgjpzY6DnPvLX0MNQEJ7kbTqt0x3B6oft645cD4yBkeVoplE3l+jRG+uEI/u6w+iCChC99CebVctB9WIidW1G8Q63tpxvGUPhLbnxghjrZNU2/NNh30c5RPV/TAbcgJiIKXukfwmFaCFRjZtByW0UV9Hdfqe9wC5zhYviPdPZ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769696852;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Csi40rQ6fKyJbiyM0FXQWkQQah5ioh+4oM6lP9s5imQ=;
	b=cdonrx28oM4RGm/3ytQKpagvsam3hs3ZEjPCK+z10ymkZzbYCs9FRjjlZdUN32CA
	1QdfFsP94ULp5bAWTgcOyeGp53pHMCmbBneO8tn3OeC9aFj5r2HGoFr+/sDH9KSEAK9
	YMG2Z+eLHTQukclzVAGWHJM0ycathaGcM9WMccno=
Message-ID: <24f75da5-116d-4955-a999-04366ec3146b@apertussolutions.com>
Date: Thu, 29 Jan 2026 09:27:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/console: handle multiple domains using
 console_io hypercalls
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 grygorii_strashko@epam.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, jason.andryuk@amd.com,
 victorm.lira@amd.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
 <20260123010640.1194863-1-stefano.stabellini@amd.com>
 <ebc50459-b6f8-4827-b326-edda5f0f67d7@suse.com>
 <alpine.DEB.2.22.394.2601281807290.2238666@ubuntu-linux-20-04-desktop>
 <2044f927-6d9f-4c7f-9e47-6e4c6dbb2fcd@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2044f927-6d9f-4c7f-9e47-6e4c6dbb2fcd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apertussolutions.com:mid,apertussolutions.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BF2CB0EFD
X-Rspamd-Action: no action

On 1/29/26 3:24 AM, Jan Beulich wrote:
> On 29.01.2026 03:42, Stefano Stabellini wrote:
>> On Wed, 28 Jan 2026, Jan Beulich wrote:
>>> On 23.01.2026 02:06, Stefano Stabellini wrote:
>>>> @@ -742,17 +758,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>>>>           if ( copy_from_guest(kbuf, buffer, kcount) )
>>>>               return -EFAULT;
>>>>   
>>>> -        if ( is_hardware_domain(cd) )
>>>> +        /*
>>>> +         * Take both cons->lock and console_lock:
>>>> +         * - cons->lock protects cons->buf and cons->idx
>>>> +         * - console_lock protects console_send and is_focus_domain
>>>> +         *   checks
>>>> +         *
>>>> +         * The order must be respected. guest_printk takes the
>>>> +         * console_lock so it is important that cons->lock is taken
>>>> +         * first.
>>>> +         */
>>>> +        spin_lock(&cons->lock);
>>>> +        nrspin_lock_irq(&console_lock);
>>>> +        if ( is_focus_domain(cd) )
>>>
>>> Why would any of the domains possibly being permitted to be "focus" suddenly
>>> gain direct access here? Full access in do_console_io() is still prevented by
>>> the XSM check there, afaict. Cc-ing Daniel, as it's not quite clear to me
>>> whether to introduce another XSM check here, whether to check ->is_console
>>> directly, or yet something else.
>>
>> The XSM check still happens first in do_console_io() via
>> xsm_console_io(XSM_OTHER, current->domain, cmd), which validates that
>> the domain has permission to use console_io hypercalls. The focus check
>> is an additional restriction that only allows reading when the domain
>> has focus: it doesn't grant new permissions. Dom0less domains with
>> input_allowed = true are already permitted by XSM policy to use
>> console_io;
> 
> Are they? I don't see any XSM or Flask code checking that flag. What the
> dummy xsm_console_io() checks is ->is_console.

Unless I am misunderstanding what you are asking here, I don't see why 
XSM would be concerned with this check. The `is_focus_domain()` 
conditional is not an access decision but a decision whether write to 
the console or buffer the write.


> However, what indeed I didn't pay attention to when writing the original
> comment is that guest_console_write() has only a single caller,
> do_console_io(). So there's no concern in this regard here as long as no
> new caller appears.


Correct, the `xsm_console_io()` hook is the access check if the guest is 
allowed to read/write to the console. Any paths to this function should 
be guarded by a call to this hook.

v/r,
dps

