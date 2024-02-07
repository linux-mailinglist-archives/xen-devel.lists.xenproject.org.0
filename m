Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95A84CA8A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 13:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677496.1054094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXgmq-0008Hf-Po; Wed, 07 Feb 2024 12:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677496.1054094; Wed, 07 Feb 2024 12:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXgmq-0008FO-M8; Wed, 07 Feb 2024 12:12:20 +0000
Received: by outflank-mailman (input) for mailman id 677496;
 Wed, 07 Feb 2024 12:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7mL=JQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXgmp-0008FD-JU
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 12:12:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23664dc9-c5b2-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 13:12:18 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D83A5220E0;
 Wed,  7 Feb 2024 12:12:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B242C13931;
 Wed,  7 Feb 2024 12:12:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ekTuKaFzw2VaBwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Feb 2024 12:12:17 +0000
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
X-Inumbo-ID: 23664dc9-c5b2-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707307938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwOSzPmFc0MyA3yvn93iNKUXA2xbWuVuWVf9ZdgYwbo=;
	b=g0i73Y6bw0VSiU7ghAJnBTULN99GGpl1JT9BZuuSI5sGuWXUC07bBTj8XuOeV44UaP7tEO
	Hzti6N1rE4zimfmL5gWO6p6LYiNIvJTzEUGM1t4Su4VGTxpMAVUucREn+Pe2VppkxDVU8G
	xvm11eaHaNTpuxXb0kAvjhShG7yPwdA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707307937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwOSzPmFc0MyA3yvn93iNKUXA2xbWuVuWVf9ZdgYwbo=;
	b=ol1Scw0J9VSS99tUYSukEKpRJSDoPty/qHTu/rEWyXdycdJun1QgrDiOzGoKy3cWXSeFZz
	DykcbRzooIvlCTtFPKPB2XViFeU6+tns8zkPcF+HmtWwIfBjmcMFGWGa3YIUH2Jls/pxfn
	mo6PXUGu1QnkrI2hVKZT7oQEQ2c3pk8=
Message-ID: <64ef988e-cadf-4fd3-8927-db882c0f4185@suse.com>
Date: Wed, 7 Feb 2024 13:12:17 +0100
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
 <f538b855-f2bb-4881-bd8a-eb8988579c85@suse.com>
 <20240207120230.elgawtnwmftcdqr4@begin>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240207120230.elgawtnwmftcdqr4@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ol1Scw0J
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.76 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.77)[subject];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.53)[80.53%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.76
X-Rspamd-Queue-Id: D83A5220E0
X-Spam-Flag: NO

On 07.02.24 13:02, Samuel Thibault wrote:
> Jürgen Groß, le mer. 07 févr. 2024 12:43:03 +0100, a ecrit:
>> On 07.02.24 12:34, Samuel Thibault wrote:
>>> Jürgen Groß, le mer. 07 févr. 2024 12:16:44 +0100, a ecrit:
>>>> On 07.02.24 12:00, Samuel Thibault wrote:
>>>>> Jürgen Groß, le mer. 07 févr. 2024 11:42:20 +0100, a ecrit:
>>>>>> while implementing kexec in Mini-OS.
>>>>>
>>>>> Oh, nice :D
>>>>>
>>>>>> For that I need it for sure.
>>>>>
>>>>> It needs to be done by kexec itself then.
>>>>
>>>> That's another option, yes.
>>>>
>>>> The question is whether we want to support to be kexec-ed from other
>>>> systems, too.
>>>
>>> But aren't other systems' kexec supports supposed to do the memset?
>>>
>>> They really should.
>>
>> I guess there is a reason why the Linux kernel does clear its .bss section
>> in early boot. Maybe it is due to how the boot process works (the ELF file
>> is encapsulated in vmlinuz),
> 
> Yes, the unpack prevents grub etc. from doing it.
> 
>> but following your reasoning they should have cleared their .bss while
>> unpacking the ELF contents, not while booting the contents.
> 
> AIUI the decompressor itself doesn't actually know about ELF.
> decompress_kernel() does call handle_relocations(), but it should indeed
> clear bss itself and not leave it out to assembly indeed.
> 
>> I'm not sure they do the .bss clearing in kexec either,
> 
> AIUI they do, see kimage_load_normal_segment() which clears the page
> before possibly loading some file piece into it.
> 
> Really, this is part of what "loading an ELF" means.

Okay, I'll do the clearing only in the kexec code then.


Juergen

