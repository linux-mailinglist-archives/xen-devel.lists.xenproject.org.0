Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aw8LE4+5UGo34AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 11:21:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D0738FA8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 11:21:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="dILxM/gr";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=87sBJDQk;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="dILxM/gr";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=87sBJDQk;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358962.1612789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi7Py-0002rU-Ay; Fri, 10 Jul 2026 09:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358962.1612789; Fri, 10 Jul 2026 09:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi7Py-0002pQ-7U; Fri, 10 Jul 2026 09:21:10 +0000
Received: by outflank-mailman (input) for mailman id 1358962;
 Fri, 10 Jul 2026 09:21:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tzimmermann@suse.de>) id 1wi7Px-0002p4-0V
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:21:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi7Pw-006Ic3-Ci
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 11:21:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tzimmermann@suse.de>)
 id 6a50b979-2eae-0a2a0a5409dd-0a2a450add82-32
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 11:21:08 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <tzimmermann@suse.de>)
 id 6a50b984-ec7d-0a2a450a0019-c387df8296f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 11:21:08 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D50E6766B2;
 Fri, 10 Jul 2026 09:21:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4649C779BD;
 Fri, 10 Jul 2026 09:21:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SMP0D4O5UGpRFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Jul 2026 09:21:07 +0000
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
	t=1783675267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8qm83c1l0o6q3XoAGYoMaLAsZhnmYdvopXg5ZHUKvsU=;
	b=dILxM/grMnkzT//PGjQgvRPzbTCyIqvBUwpem+/INy1OyOSXlBIsz9gqcx8MxRJrJ6EpZX
	Cpig7crCihNg5sGQ7MQqhcSHYm1taht0DXodMMnHJ4Mb+/tkfV7+s15uwBCTIpFPuCs4Km
	/5539L0LnwIhNbmOea8tBUeTeEyZvHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783675267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8qm83c1l0o6q3XoAGYoMaLAsZhnmYdvopXg5ZHUKvsU=;
	b=87sBJDQkU9r1dB9EiaLLEplnR13DEPh/Y9k4Hfy/3NsxtVESK1Yh4eBVWlPV4NslXUHVcs
	iY9Tim/GeeXLNdBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783675267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8qm83c1l0o6q3XoAGYoMaLAsZhnmYdvopXg5ZHUKvsU=;
	b=dILxM/grMnkzT//PGjQgvRPzbTCyIqvBUwpem+/INy1OyOSXlBIsz9gqcx8MxRJrJ6EpZX
	Cpig7crCihNg5sGQ7MQqhcSHYm1taht0DXodMMnHJ4Mb+/tkfV7+s15uwBCTIpFPuCs4Km
	/5539L0LnwIhNbmOea8tBUeTeEyZvHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783675267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8qm83c1l0o6q3XoAGYoMaLAsZhnmYdvopXg5ZHUKvsU=;
	b=87sBJDQkU9r1dB9EiaLLEplnR13DEPh/Y9k4Hfy/3NsxtVESK1Yh4eBVWlPV4NslXUHVcs
	iY9Tim/GeeXLNdBA==
Message-ID: <54ca357b-6069-4c04-b0c2-f1aca96dbd79@suse.de>
Date: Fri, 10 Jul 2026 11:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/gm12u320: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: Thomas Zimmermann <tzimmermann@suse.de>
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
 <20260705-drm-simple-kms-removal-v1-6-b4e1ca053623@oss.qualcomm.com>
 <e69b3cf5-9a9f-46ca-abc8-68c1375ef6ca@suse.de>
Content-Language: en-US
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
In-Reply-To: <e69b3cf5-9a9f-46ca-abc8-68c1375ef6ca@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-4011c0/1783675268-AEF77248-05FE8121/0/0
X-purgate-type: clean
X-purgate-size: 10621
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:from_mime,suse.de:email,suse.de:mid,suse.de:dkim,qualcomm.com:email,suse.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ze.huang@oss.qualcomm.com,m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: C18D0738FA8



Am 10.07.26 um 11:09 schrieb Thomas Zimmermann:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Convert gm12u320 to direct primary plane, CRTC and encoder setup.
>>
>> Keep shadow-plane helper state, framebuffer access helpers and
>> no-scaling plane-state check from simple-KMS path.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> And I also have this device. Works nicely with the patch
>
> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

Well, see my reply to the Sashiko bot for possible problems.

>
>> ---
>>   drivers/gpu/drm/tiny/gm12u320.c | 128 
>> ++++++++++++++++++++++++++++++++--------
>>   1 file changed, 104 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/gm12u320.c 
>> b/drivers/gpu/drm/tiny/gm12u320.c
>> index d73dfebb4353..992160ea794d 100644
>> --- a/drivers/gpu/drm/tiny/gm12u320.c
>> +++ b/drivers/gpu/drm/tiny/gm12u320.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/usb.h>
>>     #include <drm/clients/drm_client_setup.h>
>> +#include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_atomic_state_helper.h>
>>   #include <drm/drm_connector.h>
>> @@ -27,7 +28,6 @@
>>   #include <drm/drm_modeset_helper_vtables.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_probe_helper.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>     static bool eco_mode;
>>   module_param(eco_mode, bool, 0644);
>> @@ -87,7 +87,9 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less 
>> bright, more silent)");
>>     struct gm12u320_device {
>>       struct drm_device             dev;
>> -    struct drm_simple_display_pipe   pipe;
>> +    struct drm_plane             plane;
>> +    struct drm_crtc                 crtc;
>> +    struct drm_encoder             encoder;
>>       struct drm_connector             conn;
>>       unsigned char                   *cmd_buf;
>>       unsigned char *data_buf[GM12U320_BLOCK_COUNT];
>> @@ -554,31 +556,33 @@ static int gm12u320_conn_init(struct 
>> gm12u320_device *gm12u320)
>>   }
>>     /* 
>> ------------------------------------------------------------------ */
>> -/* gm12u320 (simple) display pipe                      */
>> +/* gm12u320 display pipe                              */
>>   -static void gm12u320_pipe_enable(struct drm_simple_display_pipe 
>> *pipe,
>> -                 struct drm_crtc_state *crtc_state,
>> -                 struct drm_plane_state *plane_state)
>> +static void gm12u320_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +                           struct drm_atomic_commit *commit)
>>   {
>>       struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, 
>> GM12U320_HEIGHT };
>> -    struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
>> +    struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
>> +    struct drm_plane_state *plane_state = crtc->primary->state;
>>       struct drm_shadow_plane_state *shadow_plane_state = 
>> to_drm_shadow_plane_state(plane_state);
>>         gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
>>       gm12u320_fb_mark_dirty(plane_state->fb, 
>> &shadow_plane_state->data[0], &rect);
>>   }
>>   -static void gm12u320_pipe_disable(struct drm_simple_display_pipe 
>> *pipe)
>> +static void gm12u320_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +                        struct drm_atomic_commit *commit)
>>   {
>> -    struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
>> +    struct gm12u320_device *gm12u320 = to_gm12u320(crtc->dev);
>>         gm12u320_stop_fb_update(gm12u320);
>>   }
>>   -static void gm12u320_pipe_update(struct drm_simple_display_pipe 
>> *pipe,
>> -                 struct drm_plane_state *old_state)
>> +static void gm12u320_plane_helper_atomic_update(struct drm_plane 
>> *plane,
>> +                        struct drm_atomic_commit *commit)
>>   {
>> -    struct drm_plane_state *state = pipe->plane.state;
>> +    struct drm_plane_state *old_state = 
>> drm_atomic_get_old_plane_state(commit, plane);
>> +    struct drm_plane_state *state = plane->state;
>>       struct drm_shadow_plane_state *shadow_plane_state = 
>> to_drm_shadow_plane_state(state);
>>       struct drm_rect rect;
>>   @@ -586,11 +590,71 @@ static void gm12u320_pipe_update(struct 
>> drm_simple_display_pipe *pipe,
>>           gm12u320_fb_mark_dirty(state->fb, 
>> &shadow_plane_state->data[0], &rect);
>>   }
>>   -static const struct drm_simple_display_pipe_funcs 
>> gm12u320_pipe_funcs = {
>> -    .enable        = gm12u320_pipe_enable,
>> -    .disable    = gm12u320_pipe_disable,
>> -    .update        = gm12u320_pipe_update,
>> -    DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
>> +static const struct drm_plane_funcs gm12u320_plane_funcs = {
>> +    .update_plane    = drm_atomic_helper_update_plane,
>> +    .disable_plane    = drm_atomic_helper_disable_plane,
>> +    .destroy    = drm_plane_cleanup,
>> +    DRM_GEM_SHADOW_PLANE_FUNCS,
>> +};
>> +
>> +static int gm12u320_plane_helper_atomic_check(struct drm_plane *plane,
>> +                          struct drm_atomic_commit *state)
>> +{
>> +    struct drm_plane_state *plane_state = 
>> drm_atomic_get_new_plane_state(state, plane);
>> +    struct drm_crtc *crtc = plane_state->crtc;
>> +    struct drm_crtc_state *crtc_state = NULL;
>> +    int ret;
>> +
>> +    if (crtc)
>> +        crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>> +
>> +    ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> +                          DRM_PLANE_NO_SCALING,
>> +                          DRM_PLANE_NO_SCALING,
>> +                          false, false);
>> +    return ret;
>
> Interestingly, this patch handled _check_plane_state() correctly.
>
> Best regards
> Thomas
>
>> +}
>> +
>> +static const struct drm_plane_helper_funcs 
>> gm12u320_plane_helper_funcs = {
>> +    DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>> +    .atomic_check    = gm12u320_plane_helper_atomic_check,
>> +    .atomic_update    = gm12u320_plane_helper_atomic_update,
>> +};
>> +
>> +static int gm12u320_crtc_helper_atomic_check(struct drm_crtc *crtc,
>> +                         struct drm_atomic_commit *state)
>> +{
>> +    struct drm_crtc_state *crtc_state = 
>> drm_atomic_get_new_crtc_state(state, crtc);
>> +    int ret;
>> +
>> +    if (!crtc_state->enable)
>> +        goto out;
>> +
>> +    ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
>> +    if (ret)
>> +        return ret;
>> +
>> +out:
>> +    return drm_atomic_add_affected_planes(state, crtc);
>> +}
>> +
>> +static const struct drm_crtc_helper_funcs gm12u320_crtc_helper_funcs 
>> = {
>> +    .atomic_check    = gm12u320_crtc_helper_atomic_check,
>> +    .atomic_enable    = gm12u320_crtc_helper_atomic_enable,
>> +    .atomic_disable    = gm12u320_crtc_helper_atomic_disable,
>> +};
>> +
>> +static const struct drm_crtc_funcs gm12u320_crtc_funcs = {
>> +    .set_config        = drm_atomic_helper_set_config,
>> +    .page_flip        = drm_atomic_helper_page_flip,
>> +    .reset            = drm_atomic_helper_crtc_reset,
>> +    .destroy        = drm_crtc_cleanup,
>> +    .atomic_duplicate_state    = 
>> drm_atomic_helper_crtc_duplicate_state,
>> +    .atomic_destroy_state    = drm_atomic_helper_crtc_destroy_state,
>> +};
>> +
>> +static const struct drm_encoder_funcs gm12u320_encoder_funcs = {
>> +    .destroy = drm_encoder_cleanup,
>>   };
>>     static const uint32_t gm12u320_pipe_formats[] = {
>> @@ -677,13 +741,29 @@ static int gm12u320_usb_probe(struct 
>> usb_interface *interface,
>>       if (ret)
>>           return ret;
>>   -    ret = drm_simple_display_pipe_init(&gm12u320->dev,
>> -                       &gm12u320->pipe,
>> -                       &gm12u320_pipe_funcs,
>> -                       gm12u320_pipe_formats,
>> -                       ARRAY_SIZE(gm12u320_pipe_formats),
>> -                       gm12u320_pipe_modifiers,
>> -                       &gm12u320->conn);
>> +    ret = drm_universal_plane_init(dev, &gm12u320->plane, 0,
>> +                       &gm12u320_plane_funcs,
>> +                       gm12u320_pipe_formats,
>> +                       ARRAY_SIZE(gm12u320_pipe_formats),
>> +                       gm12u320_pipe_modifiers,
>> +                       DRM_PLANE_TYPE_PRIMARY, NULL);
>> +    if (ret)
>> +        return ret;
>> +    drm_plane_helper_add(&gm12u320->plane, 
>> &gm12u320_plane_helper_funcs);
>> +
>> +    ret = drm_crtc_init_with_planes(dev, &gm12u320->crtc, 
>> &gm12u320->plane, NULL,
>> +                    &gm12u320_crtc_funcs, NULL);
>> +    if (ret)
>> +        return ret;
>> +    drm_crtc_helper_add(&gm12u320->crtc, &gm12u320_crtc_helper_funcs);
>> +
>> +    ret = drm_encoder_init(dev, &gm12u320->encoder, 
>> &gm12u320_encoder_funcs,
>> +                   DRM_MODE_ENCODER_NONE, NULL);
>> +    if (ret)
>> +        return ret;
>> +    gm12u320->encoder.possible_crtcs = drm_crtc_mask(&gm12u320->crtc);
>> +
>> +    ret = drm_connector_attach_encoder(&gm12u320->conn, 
>> &gm12u320->encoder);
>>       if (ret)
>>           return ret;
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)



