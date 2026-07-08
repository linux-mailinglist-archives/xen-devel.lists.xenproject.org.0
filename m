Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ta+RAutFTmoFKAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 14:43:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F2726675
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 14:43:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dUEBh06f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=liIbm3A1;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UK6WQbby;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Kz3KMMhw;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356953.1611464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whRbZ-0007G8-2D; Wed, 08 Jul 2026 12:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356953.1611464; Wed, 08 Jul 2026 12:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whRbY-0007DT-Vm; Wed, 08 Jul 2026 12:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1356953;
 Wed, 08 Jul 2026 12:42:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tzimmermann@suse.de>) id 1whRbY-0007DN-4w
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 12:42:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whRbX-009vSU-1M
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:42:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tzimmermann@suse.de>)
 id 6a4e4599-2eae-0a2a0a5409dd-0a2a450b860a-38
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 14:42:18 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tzimmermann@suse.de>)
 id 6a4e45aa-ac48-0a2a450b0019-c387df82c342-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 14:42:18 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0871876077;
 Wed,  8 Jul 2026 12:42:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79341779AE;
 Wed,  8 Jul 2026 12:42:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id m8AlHKhFTmqiFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Jul 2026 12:42:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783514538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X5dzTTCatZZvkmE8q15IV7Lpko/hPbN5TdQoKiurduA=;
	b=dUEBh06fNWTd2m8I8EOJluGoLByyD9XOlJ3przweVPZbhz6VZ7S1zsjn7DFg7zULfjPWm2
	QnUpa1SkvgpZNH8hINzV8CAg1WtIfcJ1K0UzREvU38I4qdLzy/5uxYICxq1/MxFMLt48u7
	cd3RpJS8rOX114IaN/X9ePsGlBoy+9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783514538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X5dzTTCatZZvkmE8q15IV7Lpko/hPbN5TdQoKiurduA=;
	b=liIbm3A1PHJAFrQqgluRDTsuHQKsA2UoHIJFH7AOynoG8lo5e9afqxGlIUN3trUGQ0IuTo
	0/NfJkRIeI7DY6AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783514537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X5dzTTCatZZvkmE8q15IV7Lpko/hPbN5TdQoKiurduA=;
	b=UK6WQbby0uEoeFln5BDlhQtliE8Q+fOlMQaTPyWNztP1ofk9W69/pu9fLxccGUy43ajOcY
	sFExOrJ7vDTzkIXuhRFtmdEVPT0e0E70KiR4kZ6gA9uXvWtg5nI8Ag9nSKiW97SUuXd9DE
	y5QBxIf27c42uswsjGAUK9oMjo2v2I4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783514537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X5dzTTCatZZvkmE8q15IV7Lpko/hPbN5TdQoKiurduA=;
	b=Kz3KMMhwjoyhH/AzT1OYB8kEQJge7Pt0/4KgWomD22Kc2swil+/M3DLVAh4str1zTv5f0F
	9UNXwy3W8vz0V9BQ==
Message-ID: <3abfae37-770c-49bf-ba1c-98bd6b0b52bc@suse.de>
Date: Wed, 8 Jul 2026 14:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
To: Ze Huang <ze.huang@oss.qualcomm.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, xen-devel@lists.xenproject.org
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
 <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
 <DJRCCWQOT4TA.1OPAZI88KOWLW@oss.qualcomm.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <DJRCCWQOT4TA.1OPAZI88KOWLW@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-42698a/1783514538-A733C220-92F50856/0/0
X-purgate-type: clean
X-purgate-size: 3650
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:from_mime,suse.de:dkim,suse.de:mid,suse.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ze.huang@oss.qualcomm.com,m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 498F2726675

Hi

Am 06.07.26 um 10:22 schrieb Ze Huang:
> On Mon Jul 6, 2026 at 3:27 PM CST, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 04.07.26 um 20:31 schrieb Ze Huang:
>>> struct drm_simple_display_pipe was meant to simplify simple DRM
>>> drivers, but instead adds an extra wrapper around normal DRM atomic
>>> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
>>> should be converted to regular atomic helpers and stop depending on the
>>> simple-KMS interfaces.
>>>
>>> This series converts the following drivers:
>>>
>>>     - arcpgu
>>>     - aspeed
>>>     - imx lcdc
>>>     - mcde
>>>     - pl111
>>>     - gm12u320
>>>     - repaper
>>>     - tve200
>>>     - xen frontend
>>>
>>> Each patch replaces drm_simple_display_pipe_init() with explicit
>>> primary plane, CRTC and encoder setup, and moves the old simple-pipe
>>> callbacks into regular plane and CRTC helper callbacks named according
>>> to local driver conventions.
>>>
>>> The conversions preserve helper behavior that used to be implicit in
>>> drm_simple_kms_helper.c, including plane-state validation, CRTC
>>> primary-plane checks, affected-plane propagation, framebuffer prepare
>>> handling, and existing event/vblank flow where applicable.
>>>
>>> Result is less helper indirection and more explicit driver-side atomic
>>> wiring, with no remaining simple-KMS dependency in these drivers.
>>>
>>> These changes are build-tested only. No hardware testing has been
>>> performed on the affected devices.
>> Thanks a lot for the series. That's quite a nice cleanup.  Did you use
>> any AI to create these patches?
>>
> Hi Thomas,
>
> Yes, I did. I wrote the first two conversion patches (arcpgu and
> aspeed) myself to understand the migration pattern. For the remaining
> drivers, I used GPT-5.5 to help with the repetitive boilerplate
> conversion.
>
> I should have reviewed the generated code more carefully before sending
> the series. The sashiko-bot feedback shows that I missed several important
> details, including commit-local state handling, the implicit NULL fb /
> visibility checks from simple-KMS, and vblank/pageflip event ordering.
> I am now going through these issues more carefully and working out the
> correct fixes before sending a v2.

Great, thanks.

The drivers you've picked are somewhat under-maintained, but I'll take a 
look at your submissions.


>
> Do you expect AI assistance to be mentioned in the cover letter or commit
> messages in some specific form? If there is a preferred tag or wording
> for this, I will use it in v2.

See Documentation/process/coding-assistents.rst for how to mark AI-made 
patches.  Although not everyone agrees that it's a good idea.  IMHO you 
should mention AI usage in the cover letter.


>
> For issues that appear to be pre-existing but are exposed or carried over
> by the migration, which is better?

It's probably better to not bother about pre-existing issues for now.  
Those are a rabbit hole.  If you're looking for follow-up patches to do. 
You're welcome to address them.


>
> 1. Include them as separate prep/fix patches at the beginning of the v2
> series, before the corresponding conversion patches; or
> 2. address those pre-existing issues in a separate follow-up series?
>
> Thanks for your time and review. :)
>
>> Best regards
>> Thomas
>>
> Best regards,
> Ze

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)



