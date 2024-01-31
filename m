Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE938442E5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 16:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674076.1048772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCOI-0004qY-83; Wed, 31 Jan 2024 15:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674076.1048772; Wed, 31 Jan 2024 15:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVCOI-0004o9-4R; Wed, 31 Jan 2024 15:20:42 +0000
Received: by outflank-mailman (input) for mailman id 674076;
 Wed, 31 Jan 2024 15:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSjc=JJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rVCOH-0004ny-D7
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 15:20:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b01f6fa-c04c-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 16:20:40 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24FD021A5C;
 Wed, 31 Jan 2024 15:20:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAF6A1347F;
 Wed, 31 Jan 2024 15:20:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6M07NkdlumV7IAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 31 Jan 2024 15:20:39 +0000
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
X-Inumbo-ID: 4b01f6fa-c04c-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706714440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/LRVMX5IE5IqJkFCbeIi3EdRR7kyRiKJSQ+VftHkTE=;
	b=Q7NcVH+toiLY+5GUaPF1GwCAUbzKAxpU7HOMi8K7920IKYVY/Wz2hp/6JZzs7B8kQolUzE
	rA+nYSRTHoa0tpc4VPnnsFaPzd0Zvufh/vhGegwNgbRYAquPCbOmgjMgrTz9FBWR333mvc
	mp3CE0vddMyoSTB2f75ZhxkQTez1oME=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706714440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/LRVMX5IE5IqJkFCbeIi3EdRR7kyRiKJSQ+VftHkTE=;
	b=Q7NcVH+toiLY+5GUaPF1GwCAUbzKAxpU7HOMi8K7920IKYVY/Wz2hp/6JZzs7B8kQolUzE
	rA+nYSRTHoa0tpc4VPnnsFaPzd0Zvufh/vhGegwNgbRYAquPCbOmgjMgrTz9FBWR333mvc
	mp3CE0vddMyoSTB2f75ZhxkQTez1oME=
Message-ID: <3ce7fa13-fb64-438d-ba7d-455e2b42854b@suse.com>
Date: Wed, 31 Jan 2024 16:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/33] tools/xl: support new 9pfs backend xen-9pfsd
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-18-jgross@suse.com>
 <43cb6d28-34da-47b9-b61f-0be8298f9d8b@perard>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <43cb6d28-34da-47b9-b61f-0be8298f9d8b@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Q7NcVH+t
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.32 / 50.00];
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
	 R_MIXED_CHARSET(0.67)[subject];
	 BAYES_HAM(-2.49)[97.69%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[lists.xenproject.org,xen.org,gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -5.32
X-Rspamd-Queue-Id: 24FD021A5C
X-Spam-Flag: NO

On 15.01.24 16:14, Anthony PERARD wrote:
> On Thu, Jan 04, 2024 at 10:00:39AM +0100, Juergen Gross wrote:
>> @@ -2242,6 +2256,28 @@ void parse_config_data(const char *config_source,
>>   
>>               libxl_string_list_dispose(&pairs);
>>   
>> +            if (p9->type == LIBXL_P9_TYPE_UNKNOWN) {
>> +                p9->type = LIBXL_P9_TYPE_QEMU;
> 
> The defaulting is normally done in libxl, so that it works for all users
> of libxl. Can this be done instead in libxl? Hopefully, it's enough to
> do it in libxl__device_p9_setdefault().
> 
> Same question for the followup checks and default values.

I'll look into it.


Juergen

