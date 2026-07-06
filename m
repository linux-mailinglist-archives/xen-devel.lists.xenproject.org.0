Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SiuFAg1ZS2o5PwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 09:28:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455E70D87E
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 09:28:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0wpOaniI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vRZoMy4m;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0wpOaniI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vRZoMy4m;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355070.1609867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgdk6-0002GW-TM; Mon, 06 Jul 2026 07:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355070.1609867; Mon, 06 Jul 2026 07:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgdk6-0002E7-QM; Mon, 06 Jul 2026 07:27:50 +0000
Received: by outflank-mailman (input) for mailman id 1355070;
 Mon, 06 Jul 2026 07:27:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tzimmermann@suse.de>) id 1wgdk5-0002E1-Tl
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 07:27:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgdk4-008kHC-R5
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:27:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tzimmermann@suse.de>)
 id 6a4b58f4-bab6-0a2a0a5309dd-0a2a4504dbea-0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:27:48 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tzimmermann@suse.de>)
 id 6a4b58f4-a01d-0a2a45040019-c387df83ad7c-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:27:48 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F04575D1A;
 Mon,  6 Jul 2026 07:27:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3D21779AA;
 Mon,  6 Jul 2026 07:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WgXvJfNYS2pBcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Jul 2026 07:27:47 +0000
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
	t=1783322868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+2Djb0q9WRkslYZbyJ71zpFQjsAPKkL2tq9BmdbU6nU=;
	b=0wpOaniIIGdIp6z0GgnhUgcX7Ud0CNlgNZsCsQlsgePgV/syB4GI+NetQO74Bu88DWebkJ
	JV4RcnUvOxIyYy8sZyMKhb2UP77fMvZEMirZrApFrnCjD5L+0SYMYo+ZFQQ5lID32YXDF1
	lItEzeSK46VQqsmy5ExgcL0vPlIuQ7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783322868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+2Djb0q9WRkslYZbyJ71zpFQjsAPKkL2tq9BmdbU6nU=;
	b=vRZoMy4mlXVDCDDzBHVKqK0jVdeF3GKGuTQBv6rpUASi6BEc+d8w4iSN5qdOKqb9Ez4Cpc
	/dCOcX9RcSAElJAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783322868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+2Djb0q9WRkslYZbyJ71zpFQjsAPKkL2tq9BmdbU6nU=;
	b=0wpOaniIIGdIp6z0GgnhUgcX7Ud0CNlgNZsCsQlsgePgV/syB4GI+NetQO74Bu88DWebkJ
	JV4RcnUvOxIyYy8sZyMKhb2UP77fMvZEMirZrApFrnCjD5L+0SYMYo+ZFQQ5lID32YXDF1
	lItEzeSK46VQqsmy5ExgcL0vPlIuQ7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783322868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+2Djb0q9WRkslYZbyJ71zpFQjsAPKkL2tq9BmdbU6nU=;
	b=vRZoMy4mlXVDCDDzBHVKqK0jVdeF3GKGuTQBv6rpUASi6BEc+d8w4iSN5qdOKqb9Ez4Cpc
	/dCOcX9RcSAElJAA==
Message-ID: <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
Date: Mon, 6 Jul 2026 09:27:47 +0200
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
In-Reply-To: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
X-purgate-ID: tlsNG-ebf023/1783322868-2DFA21CC-B12700DB/0/0
X-purgate-type: clean
X-purgate-size: 4096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,suse.com:url,suse.de:from_mime,suse.de:dkim,suse.de:mid];
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
X-Rspamd-Queue-Id: 5455E70D87E

Hi

Am 04.07.26 um 20:31 schrieb Ze Huang:
> struct drm_simple_display_pipe was meant to simplify simple DRM
> drivers, but instead adds an extra wrapper around normal DRM atomic
> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
> should be converted to regular atomic helpers and stop depending on the
> simple-KMS interfaces.
>
> This series converts the following drivers:
>
>    - arcpgu
>    - aspeed
>    - imx lcdc
>    - mcde
>    - pl111
>    - gm12u320
>    - repaper
>    - tve200
>    - xen frontend
>
> Each patch replaces drm_simple_display_pipe_init() with explicit
> primary plane, CRTC and encoder setup, and moves the old simple-pipe
> callbacks into regular plane and CRTC helper callbacks named according
> to local driver conventions.
>
> The conversions preserve helper behavior that used to be implicit in
> drm_simple_kms_helper.c, including plane-state validation, CRTC
> primary-plane checks, affected-plane propagation, framebuffer prepare
> handling, and existing event/vblank flow where applicable.
>
> Result is less helper indirection and more explicit driver-side atomic
> wiring, with no remaining simple-KMS dependency in these drivers.
>
> These changes are build-tested only. No hardware testing has been
> performed on the affected devices.

Thanks a lot for the series. That's quite a nice cleanup.  Did you use 
any AI to create these patches?

Best regards
Thomas

>
> This series is based on drm-next-2026-06-27.
>
> Thanks,
> Ze Huang
>
> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
> ---
> Ze Huang (9):
>        drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers
>
>   drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 ++++++++++++++++------
>   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c      | 178 ++++++++++++++++++-------
>   drivers/gpu/drm/mcde/mcde_display.c      | 162 ++++++++++++++++------
>   drivers/gpu/drm/mcde/mcde_drm.h          |   6 +-
>   drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
>   drivers/gpu/drm/pl111/pl111_display.c    | 174 ++++++++++++++++++------
>   drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
>   drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
>   drivers/gpu/drm/tiny/arcpgu.c            | 165 ++++++++++++++++++-----
>   drivers/gpu/drm/tiny/gm12u320.c          | 128 ++++++++++++++----
>   drivers/gpu/drm/tiny/repaper.c           | 130 ++++++++++++++----
>   drivers/gpu/drm/tve200/tve200_display.c  | 221 +++++++++++++++++++++----------
>   drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
>   drivers/gpu/drm/tve200/tve200_drv.c      |  17 ++-
>   drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
>   drivers/gpu/drm/xen/xen_drm_front_kms.c  | 177 +++++++++++++++++++------
>   18 files changed, 1164 insertions(+), 381 deletions(-)
> ---
> base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
> change-id: 20260704-drm-simple-kms-removal-01a031c6a129
>
> Best regards,
> --
> Ze Huang <ze.huang@oss.qualcomm.com>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



