Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEP1CxzklWneVwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 17:09:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894E01579CE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 17:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235841.1538686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsk6K-0006Lp-1Z; Wed, 18 Feb 2026 16:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235841.1538686; Wed, 18 Feb 2026 16:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsk6J-0006K0-UK; Wed, 18 Feb 2026 16:08:31 +0000
Received: by outflank-mailman (input) for mailman id 1235841;
 Wed, 18 Feb 2026 16:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfGN=AW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vsk6I-0006Js-Hu
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 16:08:30 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ea1d3f1-0ce4-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 17:08:27 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771430890171379.7664783297532;
 Wed, 18 Feb 2026 08:08:10 -0800 (PST)
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
X-Inumbo-ID: 0ea1d3f1-0ce4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771430893; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q0LId52bKp0/GTS2A6wkt1dd3cezWqk7zH2usy5ZtPzdfyUq3kJF3bm3oOZlSvkzhwG/EL8CEN2Hj5zMYNyslNgNLl18lZl4yiOLp4N0FLGQVMUcjf+oM0FwQ6t5STqJ0Tuo+VUnZ87OzycsBlJ3J0LUrH82bq2DrQ8BYh1Ny/s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771430893; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fWRXMj7PK6kMHx6AVdRzCrEyKuz94e5VKxOetrzHKTQ=; 
	b=KhcK/2kbD92aW0JwBswzAi6nG6LNDTFyTJLfFsN++hRYElxR3moDuXfBf4wC+PIUMKOLDqQSmUpzU0tTbS00kBfAI94ChdUA+rKsd1XrEE6izHbu2urzOriwXD+BM2xOFtQNn2jmhmVRkYY7+MPqkbPktQ0acffjn7C3MI3Mx10=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771430893;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fWRXMj7PK6kMHx6AVdRzCrEyKuz94e5VKxOetrzHKTQ=;
	b=JSH1WcTpJG2IAQ2NEhj+qb1ldiJzCMfmMrbPcfY2BHDs7rFX2pY4Q9TqQBalBTk6
	mX2j7mGAUwvjQk1ZIxvDnmGXauw2DPlsxj1cMsSDE2MPVANv4iHJu4bQRLNxenkrnDu
	bEWgEGO92Vb97NCxAVrH8rB8hsb7rCwZ3PTvRXcs=
Message-ID: <89173609-0089-4c89-a924-2feb88e77308@apertussolutions.com>
Date: Wed, 18 Feb 2026 11:08:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/5] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow
 non-hwdom binding
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 grygorii_strashko@epam.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, jason.andryuk@amd.com,
 victorm.lira@amd.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-2-stefano.stabellini@amd.com>
 <82c06e52-1db0-46e5-be9f-7ca0360ffc70@suse.com>
 <alpine.DEB.2.22.394.2602091520460.1134401@ubuntu-linux-20-04-desktop>
 <43e80ad6-7b42-42de-b36f-1a9079589912@suse.com>
 <alpine.DEB.2.22.394.2602131206040.6031@ubuntu-linux-20-04-desktop>
 <053d2624-2891-4534-83f0-b05e190afe3b@apertussolutions.com>
 <e08b65e3-8908-4882-9481-d4aa7dbfcfa1@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <e08b65e3-8908-4882-9481-d4aa7dbfcfa1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 894E01579CE
X-Rspamd-Action: no action

On 2/18/26 10:14, Jan Beulich wrote:
> On 18.02.2026 16:07, Daniel P. Smith wrote:
>> On 2/13/26 15:09, Stefano Stabellini wrote:
>>> On Tue, 10 Feb 2026, Jan Beulich wrote:
>>>> On 10.02.2026 00:23, Stefano Stabellini wrote:
>>>>> On Mon, 9 Feb 2026, Jan Beulich wrote:
>>>>>> On 05.02.2026 00:37, Stefano Stabellini wrote:
>>>>>>> Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
>>>>>>> global to VIRQ_DOMAIN to allow other domains to bind to it.
>>>>>>>
>>>>>>> Note that Linux silently falls back to polling when binding fails, which
>>>>>>> masks the issue.
>>>>>>>
>>>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>
>>>>>> Technically this is an ABI change, and hence I'm uncertain it can go without
>>>>>> that aspect being at least mentioned, perhaps even its implications properly
>>>>>> discussed.
>>>>>
>>>>> I am not sure if it qualifies as an ABI change or not but I am happy to
>>>>> expand the commit message in any way you might suggest.
>>>>>
>>>>> The jist of it is already in the commit message, really the key element
>>>>> is that VIRQ_CONSOLE can be bound by multiple domains.
>>>>>
>>>>> Aside from spelling out "this is an ABI change" what do you have in
>>>>> mind?
>>>>
>>>> What I mean is discussion of the implications for domains using the vIRQ.
>>>> Previously most domains would have attempts to bind this vIRQ rejected.
>>>> Technically it is possible that kernels had code paths blindly doing the
>>>> binding, relying on it to work only when running as Dom0. And really, you
>>>> appear to break XEN_DOMCTL_set_virq_handler when used with VIRQ_CONSOLE,
>>>> without which its binding wasn't possible at all before (except for the
>>>> hardware domain, which get_global_virq_handler() falls back to when no
>>>> other domain is set). Or am I mis-reading things, as I can't spot any use
>>>> of VIRQ_CONSOLE under tools/, whereas I would have expected provisions
>>>> for (host) console handling to be delegated to a separate control or
>>>> console domain? Of course other toolstacks (the XAPI-based one for
>>>> example) might actually have such provisions.
>>>>
>>>> And then there's the XSM question: XEN_DOMCTL_set_virq_handler obviously
>>>> is subject to XSM checking. The same isn't true for VIRQ_DOMAIN-type
>>>> vIRQ-s. Yet this vIRQ isn't supposed to be universally available to
>>>> every DomU. Instead the ->console->input_allowed checking is kind of
>>>> substituting such a check, which iirc Daniel said (in more general
>>>> context) shouldn't ever be done. IOW in patch 5 you're actually effecting
>>>> policy, which should be XSM's job aiui.
>>>>
>>>> Bottom line: The patch may need to be more involved, but at the very
>>>> least the description would need updating to justify it being as simple
>>>> as it is right now.
>>>
>>> What do you think of this:
>>>
>>> ---
>>>
>>> xen/console: change VIRQ_CONSOLE from global to per-domain
>>>
>>> Previously VIRQ_CONSOLE was a global VIRQ (VIRQ_GLOBAL type), meaning
>>> only the hardware domain (or a domain explicitly set via
>>> XEN_DOMCTL_set_virq_handler) could bind it. Any other domain attempting
>>> to bind would fail with -EBUSY because get_global_virq_handler() would
>>> return hwdom by default.
>>>
>>> This patch changes VIRQ_CONSOLE to VIRQ_DOMAIN type, allowing any domain
>>> to bind it independently, similar to VIRQ_ARGO. The console notification
>>> is now sent via send_guest_domain_virq() directly to the focus domain
>>> rather than through send_global_virq().
>>>
>>> Implications:
>>>
>>> 1. Guest kernels that previously called bind on VIRQ_CONSOLE blindly
>>>      will now succeed. Linux handles binding failure gracefully by falling
>>>      back to polling, so this should not cause regressions.
>>>
>>> 2. XEN_DOMCTL_set_virq_handler can no longer be used with VIRQ_CONSOLE.
>>>      The domctl explicitly rejects non-VIRQ_GLOBAL types. This means
>>>      toolstacks that relied on set_virq_handler to delegate console handling
>>>      to a separate console domain will need to use a different mechanism.
>>>      Note: No known in-tree toolstack uses set_virq_handler with VIRQ_CONSOLE.
>>>
>>> 3. VIRQ_DOMAIN bindings are not subject to XSM checks beyond the
>>>      standard event channel allocation policy. Access control for console
>>>      input is enforced via the per-domain console->input_allowed flag,
>>>      which is set for:
>>>      - The hardware domain (by default in domain_create())
>>>      - dom0less domains on ARM (in construct_domU())
>>>      - The PV shim domain on x86 (in pv_shim_setup_dom())
>>>      - Domains with vpl011 using the Xen backend (in domain_vpl011_init())
>>
>> Actually this goes back to the concern I have raised many times,
>> is_hardware_domain() always serves a double purpose. The explicit check
>> that the domain is where the hardware is, but also the implicit access
>> control check that it is allowed to do the hardware access. The implicit
>> access control check is a subversion of XSM and the reality is that the
>> input_allowed flag is just unmasking this subversion for an explicit
>> access control check outside the purview of xsm.
> 
> I don't think I can deduce from this what your view is on the change proposed.
> There is, as per what you say, an existing issue with is_hardware_domain().
> (Likely at some point you'll propose patches to address this.) What I can't
> conclude is whether you deem this new issue "okay(ish)" on the basis that some
> vaguely related issue already exists, or whether you object to this new way
> of "subversion".

Digging deeper, the underlying issue is that when struct domain_console 
was introduced and now this series is building upon it. The struct 
domain_console_patch added a resource access control check point for all 
domains through input_allowed that went around XSM. Now we are here with 
this series that is exposing what was done. To your question, am I 
okay(ish) with this. Not really, but it's also not the fault of Stefano 
or his series that the earlier commit laid this landmine for him.

With all that said, thinking about it in totality, the fine-grained 
access control does needs to be there for tightly controlled 
environments, but is not necessary for a general security posture. Plus, 
I am going to have to think about how to correctly inlay the XSM check, 
which is outside the scope of this series. All of that is to say, I am 
not okay but don't feel it's right to block this series over it.

v/r,
dps

