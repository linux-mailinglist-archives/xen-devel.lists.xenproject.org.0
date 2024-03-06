Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531FE8735A3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 12:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689088.1074052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpX1-0001fU-L2; Wed, 06 Mar 2024 11:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689088.1074052; Wed, 06 Mar 2024 11:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpX1-0001d1-IK; Wed, 06 Mar 2024 11:33:55 +0000
Received: by outflank-mailman (input) for mailman id 689088;
 Wed, 06 Mar 2024 11:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=frGc=KM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rhpWz-0001cv-Iz
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:33:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 682c4665-dbad-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 12:33:52 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 61B4268827;
 Wed,  6 Mar 2024 11:33:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2598113A65;
 Wed,  6 Mar 2024 11:33:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 15YzB59U6GWLFQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 06 Mar 2024 11:33:51 +0000
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
X-Inumbo-ID: 682c4665-dbad-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709724831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWos/1lXlyQ7RHkskDWY40b7ic1MXb23n+nmckfVvzc=;
	b=hZSo0j89l3YvJ9zafpn9TehqNr133tdMWz2GWRiq+HNpQW4P6WnWAbRLldxvmlO6J/AbsO
	wdWLXPuXPcY1CKWc434Ki/G5rrHtviK0D1adRhw6wX4LFDweBBpsUGxX8XtZk2Ejw6P6G8
	qfqNKyTDLFILMNsEy4r9nSfhYqKHWi0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709724831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWos/1lXlyQ7RHkskDWY40b7ic1MXb23n+nmckfVvzc=;
	b=hZSo0j89l3YvJ9zafpn9TehqNr133tdMWz2GWRiq+HNpQW4P6WnWAbRLldxvmlO6J/AbsO
	wdWLXPuXPcY1CKWc434Ki/G5rrHtviK0D1adRhw6wX4LFDweBBpsUGxX8XtZk2Ejw6P6G8
	qfqNKyTDLFILMNsEy4r9nSfhYqKHWi0=
Message-ID: <f372ba5e-2b46-4193-b7bd-01b4a2b459a9@suse.com>
Date: Wed, 6 Mar 2024 12:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add an entry for tools/9pfsd
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240306111631.1696-1-jgross@suse.com>
 <56270f54-d86d-4849-9964-ae94318215b8@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <56270f54-d86d-4849-9964-ae94318215b8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.13
X-Spamd-Result: default: False [-3.13 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-2.75)[98.93%];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.91)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 06.03.24 12:23, Jan Beulich wrote:
> On 06.03.2024 12:16, Juergen Gross wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -206,6 +206,12 @@ Maintainers List (try to look for most precise areas first)
>>   
>>   		-----------------------------------
>>   
>> +9PFSD
>> +M:	Juergen Gross <jgross@suse.com>
>> +M:	Anthony PERARD <anthony.perard@citrix.com>
>> +S:	Supported
>> +F:	tools/9pfsd
> 
> This wants a trailing slash.

Oh, indeed.

> Can pretty certainly be taken care of while committing.

Thanks,


Juergen


