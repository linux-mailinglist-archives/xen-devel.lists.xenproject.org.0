Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D7855AA6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 07:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681229.1059871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVPz-0000SM-Oq; Thu, 15 Feb 2024 06:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681229.1059871; Thu, 15 Feb 2024 06:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raVPz-0000PM-MB; Thu, 15 Feb 2024 06:40:23 +0000
Received: by outflank-mailman (input) for mailman id 681229;
 Thu, 15 Feb 2024 06:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raVPy-0000PG-2l
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 06:40:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15a7a0e1-cbcd-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 07:40:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2CBAA1F850;
 Thu, 15 Feb 2024 06:40:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D98C313A72;
 Thu, 15 Feb 2024 06:40:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4lbyMtGxzWXUcQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 06:40:17 +0000
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
X-Inumbo-ID: 15a7a0e1-cbcd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707979218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMgwWIROcUiEtJ/aRznmaKwaecq/6qWAjHktvBCBXaA=;
	b=sd2poRr/QuYUSEmDU6CToMvt16E+dQVgAGsOx05//vwj+mVe+5NmraDuamP3xSipfVHrnT
	0HtMqVyu65WTSWz00Ws9nlohg6zpJNGY+vki+z8dLUgpH6UiZd1D06iwg2m6TqQM+4Lc3I
	3SQ3PuNvk7SyWUCuFFNmCWpyIzkSxsk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707979218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMgwWIROcUiEtJ/aRznmaKwaecq/6qWAjHktvBCBXaA=;
	b=sd2poRr/QuYUSEmDU6CToMvt16E+dQVgAGsOx05//vwj+mVe+5NmraDuamP3xSipfVHrnT
	0HtMqVyu65WTSWz00Ws9nlohg6zpJNGY+vki+z8dLUgpH6UiZd1D06iwg2m6TqQM+4Lc3I
	3SQ3PuNvk7SyWUCuFFNmCWpyIzkSxsk=
Message-ID: <f8a24054-4d19-489a-bcc5-e465a391b2f7@suse.com>
Date: Thu, 15 Feb 2024 07:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/22] tools/libs/light: add backend type for 9pfs PV
 devices
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>, George Dunlap <george.dunlap@cloud.com>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-16-jgross@suse.com>
 <5e6893dd-5280-4a14-8d00-4ed76e8c8e98@perard>
 <c6af9dd1-01d4-48a2-86b9-ccb2967136f7@suse.com>
 <a3a0d9eb-97ae-4e5d-ad08-cfe5319836d7@perard>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <a3a0d9eb-97ae-4e5d-ad08-cfe5319836d7@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.31
X-Spamd-Result: default: False [0.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(1.16)[0.387];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 BAYES_HAM(-0.35)[76.45%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.59)[subject];
	 FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,gmail.com,xen.org,cloud.com];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 14.02.24 18:27, Anthony PERARD wrote:
> On Wed, Feb 14, 2024 at 11:18:18AM +0100, Jürgen Groß wrote:
>> On 13.02.24 19:03, Anthony PERARD wrote:
>>> On Thu, Feb 08, 2024 at 05:55:39PM +0100, Juergen Gross wrote:
>>>> +struct libxl__aop9_state {
>>>> +    libxl__spawn_state spawn;
>>>> +    libxl__ao_device *aodev;
>>>> +    libxl_device_p9 p9;
>>>> +    uint32_t domid;
>>>> +    void (*callback)(libxl__egc *, libxl__aop9_state *, int);
>>>
>>> This "callback" is never used, right?
>>
>> Why do you think so?
>>
>> In xen9pfsd_spawn() it is used:
>>
>>    aop9->callback = xen9pfsd_spawn_outcome;
> 
> By never used, I mean that nothing is reading the value, their is no
> "aop9->callback(egc, aop9, rc)" call.
> It might have been useful if a caller of xen9pfsd_spawn() was actually
> setting this field, but that's not an option here. And callbacks of
> xen9pfsd_spawn() knows to call xen9pfsd_spawn_outcome() when done.

Oh, right. This must be a relict of a previous attempt to make it work.

I'll remove the callback.


Juergen


