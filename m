Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7910184C9D3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 12:43:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677463.1054049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXgKc-0001jK-Oc; Wed, 07 Feb 2024 11:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677463.1054049; Wed, 07 Feb 2024 11:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXgKc-0001gI-Lz; Wed, 07 Feb 2024 11:43:10 +0000
Received: by outflank-mailman (input) for mailman id 677463;
 Wed, 07 Feb 2024 11:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7mL=JQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXgKb-0001d2-23
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 11:43:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de17bcc-c5ae-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 12:43:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 421E8221BF;
 Wed,  7 Feb 2024 11:43:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D8B6139D8;
 Wed,  7 Feb 2024 11:43:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bo/VBchsw2UgfgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Feb 2024 11:43:04 +0000
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
X-Inumbo-ID: 0de17bcc-c5ae-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707306184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGzSiKPaIOOGKNiGPGbMuq7bs0z9asbp2mQfLWN4l70=;
	b=Oy+aD0CP4xZLDumskl12HgZSMMhT6xHP/M+DcRhgewNQCl0Id6Il0vFP8cwiJmuc+CuZSB
	wLHXeJkUEvrmNzY7zP1hw9hamCjiqNt8gQgopK6sxSdrokaKoAvkkkxAlPh1L0i3LbuDzm
	KR8tIjiM3cQLlRfL+Bm74dlF/ncTy9Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707306184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGzSiKPaIOOGKNiGPGbMuq7bs0z9asbp2mQfLWN4l70=;
	b=Oy+aD0CP4xZLDumskl12HgZSMMhT6xHP/M+DcRhgewNQCl0Id6Il0vFP8cwiJmuc+CuZSB
	wLHXeJkUEvrmNzY7zP1hw9hamCjiqNt8gQgopK6sxSdrokaKoAvkkkxAlPh1L0i3LbuDzm
	KR8tIjiM3cQLlRfL+Bm74dlF/ncTy9Q=
Message-ID: <f538b855-f2bb-4881-bd8a-eb8988579c85@suse.com>
Date: Wed, 7 Feb 2024 12:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240207103138.26901-1-jgross@suse.com>
 <20240207103831.dtvlyjtbmgz7kmll@begin>
 <d51d842e-5609-4c98-9a31-8d6a0b237c31@suse.com>
 <20240207110021.hhlbkpx3vv3p7o4j@begin>
 <d0fc9a2a-e1e0-4cdf-8619-378a0c829bc6@suse.com>
 <20240207113456.2pxcrcazxseznyjq@begin>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240207113456.2pxcrcazxseznyjq@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.62
X-Spamd-Result: default: False [-0.62 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-0.10)[64.95%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.77)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 07.02.24 12:34, Samuel Thibault wrote:
> Jürgen Groß, le mer. 07 févr. 2024 12:16:44 +0100, a ecrit:
>> On 07.02.24 12:00, Samuel Thibault wrote:
>>> Jürgen Groß, le mer. 07 févr. 2024 11:42:20 +0100, a ecrit:
>>>> while implementing kexec in Mini-OS.
>>>
>>> Oh, nice :D
>>>
>>>> For that I need it for sure.
>>>
>>> It needs to be done by kexec itself then.
>>
>> That's another option, yes.
>>
>> The question is whether we want to support to be kexec-ed from other
>> systems, too.
> 
> But aren't other systems' kexec supports supposed to do the memset?
> 
> They really should.

I guess there is a reason why the Linux kernel does clear its .bss section
in early boot. Maybe it is due to how the boot process works (the ELF file
is encapsulated in vmlinuz), but following your reasoning they should have
cleared their .bss while unpacking the ELF contents, not while booting the
contents.

I'm not sure they do the .bss clearing in kexec either, as the kernel is
clearing it anyway.


Juergen

