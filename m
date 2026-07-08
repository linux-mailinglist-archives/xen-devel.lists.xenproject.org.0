Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wnNdMCpGTmoUKAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 14:44:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B4F7266A0
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 14:44:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ODioz/aM";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="K2zuVha/";
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h6exN740;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HUeeAx+W;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356961.1611474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whRdR-0007kT-ED; Wed, 08 Jul 2026 12:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356961.1611474; Wed, 08 Jul 2026 12:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whRdR-0007hz-Ai; Wed, 08 Jul 2026 12:44:17 +0000
Received: by outflank-mailman (input) for mailman id 1356961;
 Wed, 08 Jul 2026 12:44:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tzimmermann@suse.de>) id 1whRdP-0007hq-Vg
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 12:44:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whRdP-0004gw-By
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:44:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tzimmermann@suse.de>)
 id 6a4e461e-5cb7-0a2a0a5109dd-0a2a450cbf8e-2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 14:44:15 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tzimmermann@suse.de>)
 id 6a4e461e-f399-0a2a450c0019-c387df83854e-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 14:44:14 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 895847587E;
 Wed,  8 Jul 2026 12:44:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E49F2779AE;
 Wed,  8 Jul 2026 12:44:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id a8ljNhtGTmq8GAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Jul 2026 12:44:11 +0000
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
	t=1783514654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hDF+/OTRPKVzsa0KeAPg8wf1kzxM6JSavTh2UwnGYsY=;
	b=ODioz/aM0QFgAXmqpD/oUA9HB3yB9M/Bl1c9MNyVxw/fvF14YGY/IleiHweFd/cgga9Frk
	ImfYsUYa3sSKBL1E/XjdTmdhUp82jHXWxcUjIAXbj691vjSApUzs/lRkJI7yGKcK2K3pcO
	MVCF1f6L9qz0daiwE40hW4gTHxUYCDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783514654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hDF+/OTRPKVzsa0KeAPg8wf1kzxM6JSavTh2UwnGYsY=;
	b=K2zuVha/qKYTnseDH6XD1GPQmAWxSfn1sZNQSDTMShoOZRQ8cku5+qVTc0Cb9/+bFz2hRb
	/l/AsPPGrN9YGtAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783514652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hDF+/OTRPKVzsa0KeAPg8wf1kzxM6JSavTh2UwnGYsY=;
	b=h6exN740bbdw6hpDzzBYDkmQzHiitjpwb0W2hCr3rvLIdOBfFhDJ6dPgqvwSYe/+tXLLuc
	6EB3may42kikv5x1Tsi3iZkYrqYme9PxOMrRFn5Qtezmer1oci88vBUhkrVKSPRF0UN+Vr
	ueZBatEhC8Cp/v8hNzPiVBoyFiLR6k0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783514652;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hDF+/OTRPKVzsa0KeAPg8wf1kzxM6JSavTh2UwnGYsY=;
	b=HUeeAx+WjTStqntL0Yt2VJ6IqQBhpd7QXppSm9VZ2Wt/Y+bIwkmbfJAZj2reBWX366tT5a
	bQDisnohF0X7K1Ag==
Message-ID: <1c84099b-6f0d-4655-9aea-015a821b50db@suse.de>
Date: Wed, 8 Jul 2026 14:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
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
 <20260705-drm-simple-kms-removal-v1-3-b4e1ca053623@oss.qualcomm.com>
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
In-Reply-To: <20260705-drm-simple-kms-removal-v1-3-b4e1ca053623@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
X-purgate-ID: tlsNG-d25034/1783514654-90110D51-01F11462/0/0
X-purgate-type: clean
X-purgate-size: 13657
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,suse.de:from_mime,suse.de:dkim,suse.de:mid,suse.com:url,qualcomm.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 03B4F7266A0

Hi,

the imx driver is well maintained IIRC. I'd advise you to split off this 
patch from the series and send it out separately. That is more likely to 
catch the attention of the driver's maintainers.

Best regards
Thomas

Am 04.07.26 um 20:31 schrieb Ze Huang:
> Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects.
>
> Keep no-scaling plane check and GEM framebuffer prepare callback from
> simple-KMS path. Only touch hardware state when framebuffer exists,
> since atomic plane updates can run on disabling transitions.
>
> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 178 ++++++++++++++++++++++++++----------
>   1 file changed, 130 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> index f52832b43aca..d091dc562098 100644
> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> @@ -14,9 +14,9 @@
>   #include <drm/drm_gem_dma_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_of.h>
> +#include <drm/drm_plane_helper.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>   #include <drm/drm_vblank.h>
>   #include <linux/bitfield.h>
>   #include <linux/clk.h>
> @@ -102,7 +102,9 @@
>   
>   struct imx_lcdc {
>   	struct drm_device drm;
> -	struct drm_simple_display_pipe pipe;
> +	struct drm_plane plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
>   	struct drm_connector *connector;
>   	void __iomem *base;
>   
> @@ -135,14 +137,13 @@ static unsigned int imx_lcdc_get_format(unsigned int drm_format)
>   	}
>   }
>   
> -static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
> +static void imx_lcdc_update_hw_registers(struct drm_crtc *crtc,
>   					 struct drm_plane_state *old_state,
>   					 bool mode_set)
>   {
> -	struct drm_crtc *crtc = &pipe->crtc;
> -	struct drm_plane_state *new_state = pipe->plane.state;
> +	struct drm_plane_state *new_state = crtc->primary->state;
>   	struct drm_framebuffer *fb = new_state->fb;
> -	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
> +	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
>   	u32 lpcr, lvcr, lhcr;
>   	u32 framesize;
>   	dma_addr_t addr;
> @@ -188,16 +189,16 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
>   		clk_prepare_enable(lcdc->clk_per);
>   }
>   
> -static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
> -				 struct drm_crtc_state *crtc_state,
> -				 struct drm_plane_state *plane_state)
> +static void imx_lcdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					       struct drm_atomic_commit *state)
>   {
>   	int ret;
>   	int clk_div;
>   	int bpp;
> -	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
> -	struct drm_display_mode *mode = &pipe->crtc.mode;
> +	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
> +	struct drm_display_mode *mode = &crtc->mode;
>   	struct drm_display_info *disp_info = &lcdc->connector->display_info;
> +	struct drm_plane_state *plane_state = crtc->primary->state;
>   	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
>   	const int vsync_pol = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;
>   	const int data_enable_pol =
> @@ -231,34 +232,34 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
>   
>   	ret = clk_prepare_enable(lcdc->clk_ipg);
>   	if (ret) {
> -		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
> +		dev_err(crtc->dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
>   		return;
>   	}
>   	ret = clk_prepare_enable(lcdc->clk_ahb);
>   	if (ret) {
> -		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
> +		dev_err(crtc->dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
>   
>   		clk_disable_unprepare(lcdc->clk_ipg);
>   
>   		return;
>   	}
>   
> -	imx_lcdc_update_hw_registers(pipe, NULL, true);
> +	imx_lcdc_update_hw_registers(crtc, NULL, true);
>   
>   	/* Enable VBLANK Interrupt */
>   	writel(INTR_EOF, lcdc->base + IMX21LCDC_LIER);
>   }
>   
> -static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
> +static void imx_lcdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +						struct drm_atomic_commit *state)
>   {
> -	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
> -	struct drm_crtc *crtc = &lcdc->pipe.crtc;
> +	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
>   	struct drm_pending_vblank_event *event;
>   
>   	clk_disable_unprepare(lcdc->clk_ahb);
>   	clk_disable_unprepare(lcdc->clk_ipg);
>   
> -	if (pipe->crtc.enabled)
> +	if (crtc->enabled)
>   		clk_disable_unprepare(lcdc->clk_per);
>   
>   	spin_lock_irq(&lcdc->drm.event_lock);
> @@ -273,17 +274,18 @@ static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
>   	writel(0, lcdc->base + IMX21LCDC_LIER);
>   }
>   
> -static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
> -			       struct drm_plane_state *plane_state,
> -			       struct drm_crtc_state *crtc_state)
> +static int imx_lcdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +					     struct drm_atomic_commit *state)
>   {
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>   	const struct drm_display_mode *mode = &crtc_state->mode;
> -	const struct drm_display_mode *old_mode = &pipe->crtc.state->mode;
> +	const struct drm_display_mode *old_mode = &crtc->state->mode;
> +	int ret;
>   
>   	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
>   	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
>   	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
> -		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
> +		drm_err(crtc->dev, "unsupported display mode (%u x %u)\n",
>   			mode->hdisplay, mode->vdisplay);
>   		return -EINVAL;
>   	}
> @@ -292,27 +294,42 @@ static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
>   		old_mode->hdisplay != mode->hdisplay ||
>   		old_mode->vdisplay != mode->vdisplay;
>   
> -	return 0;
> +	if (!crtc_state->enable)
> +		goto out;
> +
> +	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
> +	if (ret)
> +		return ret;
> +
> +out:
> +	return drm_atomic_add_affected_planes(state, crtc);
>   }
>   
> -static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
> -				 struct drm_plane_state *old_state)
> +static void imx_lcdc_plane_helper_atomic_update(struct drm_plane *plane,
> +						struct drm_atomic_commit *state)
>   {
> -	struct drm_crtc *crtc = &pipe->crtc;
> -	struct drm_pending_vblank_event *event = crtc->state->event;
> -	struct drm_plane_state *new_state = pipe->plane.state;
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_plane_state *new_state = plane->state;
> +	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
> +	struct drm_pending_vblank_event *event;
>   	struct drm_framebuffer *fb = new_state->fb;
>   	struct drm_framebuffer *old_fb = old_state->fb;
>   	struct drm_crtc *old_crtc = old_state->crtc;
>   	bool mode_changed = false;
>   
> -	if (old_fb && old_fb->format != fb->format)
> -		mode_changed = true;
> -	else if (old_crtc != crtc)
> -		mode_changed = true;
> +	if (!crtc)
> +		return;
>   
> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
> +	if (fb) {
> +		if (old_fb && old_fb->format != fb->format)
> +			mode_changed = true;
> +		else if (old_crtc != crtc)
> +			mode_changed = true;
>   
> +		imx_lcdc_update_hw_registers(crtc, old_state, mode_changed);
> +	}
> +
> +	event = crtc->state->event;
>   	if (event) {
>   		crtc->state->event = NULL;
>   
> @@ -327,11 +344,56 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
>   	}
>   }
>   
> -static const struct drm_simple_display_pipe_funcs imx_lcdc_pipe_funcs = {
> -	.enable = imx_lcdc_pipe_enable,
> -	.disable = imx_lcdc_pipe_disable,
> -	.check = imx_lcdc_pipe_check,
> -	.update = imx_lcdc_pipe_update,
> +static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *plane,
> +					      struct drm_atomic_commit *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *crtc = plane_state->crtc;
> +	struct drm_crtc_state *crtc_state = NULL;
> +	int ret;
> +
> +	if (crtc)
> +		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, false);
> +	return ret;
> +}
> +
> +static const struct drm_plane_helper_funcs imx_lcdc_plane_helper_funcs = {
> +	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
> +	.atomic_check	= imx_lcdc_plane_helper_atomic_check,
> +	.atomic_update	= imx_lcdc_plane_helper_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs imx_lcdc_plane_funcs = {
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= drm_plane_cleanup,
> +	.reset			= drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static const struct drm_crtc_helper_funcs imx_lcdc_crtc_helper_funcs = {
> +	.atomic_check	= imx_lcdc_crtc_helper_atomic_check,
> +	.atomic_enable	= imx_lcdc_crtc_helper_atomic_enable,
> +	.atomic_disable	= imx_lcdc_crtc_helper_atomic_disable,
> +};
> +
> +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs = {
> +	.reset			= drm_atomic_helper_crtc_reset,
> +	.destroy		= drm_crtc_cleanup,
> +	.set_config		= drm_atomic_helper_set_config,
> +	.page_flip		= drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_encoder_funcs imx_lcdc_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
>   };
>   
>   static const struct drm_mode_config_funcs imx_lcdc_mode_config_funcs = {
> @@ -369,7 +431,7 @@ MODULE_DEVICE_TABLE(of, imx_lcdc_of_dev_id);
>   static irqreturn_t imx_lcdc_irq_handler(int irq, void *arg)
>   {
>   	struct imx_lcdc *lcdc = arg;
> -	struct drm_crtc *crtc = &lcdc->pipe.crtc;
> +	struct drm_crtc *crtc = &lcdc->crtc;
>   	unsigned int status;
>   
>   	status = readl(lcdc->base + IMX21LCDC_LISR);
> @@ -387,6 +449,9 @@ static int imx_lcdc_probe(struct platform_device *pdev)
>   	struct imx_lcdc *lcdc;
>   	struct drm_device *drm;
>   	struct drm_bridge *bridge;
> +	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder *encoder;
>   	int irq;
>   	int ret;
>   	struct device *dev = &pdev->dev;
> @@ -428,23 +493,40 @@ static int imx_lcdc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Cannot initialize mode configuration structure\n");
>   
> -	/* CRTC, Plane, Encoder */
> -	ret = drm_simple_display_pipe_init(drm, &lcdc->pipe,
> -					   &imx_lcdc_pipe_funcs,
> -					   imx_lcdc_formats,
> -					   ARRAY_SIZE(imx_lcdc_formats), NULL, NULL);
> +	plane = &lcdc->plane;
> +	ret = drm_universal_plane_init(drm, plane, 0,
> +				       &imx_lcdc_plane_funcs,
> +				       imx_lcdc_formats,
> +				       ARRAY_SIZE(imx_lcdc_formats),
> +				       NULL,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret < 0)
> +		return dev_err_probe(drm->dev, ret, "Cannot initialize primary plane\n");
> +	drm_plane_helper_add(plane, &imx_lcdc_plane_helper_funcs);
> +
> +	crtc = &lcdc->crtc;
> +	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
> +					&imx_lcdc_crtc_funcs, NULL);
> +	if (ret < 0)
> +		return dev_err_probe(drm->dev, ret, "Cannot initialize CRTC\n");
> +	drm_crtc_helper_add(crtc, &imx_lcdc_crtc_helper_funcs);
> +
> +	encoder = &lcdc->encoder;
> +	ret = drm_encoder_init(drm, encoder, &imx_lcdc_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
>   	if (ret < 0)
> -		return dev_err_probe(drm->dev, ret, "Cannot setup simple display pipe\n");
> +		return dev_err_probe(drm->dev, ret, "Cannot initialize encoder\n");
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
>   	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
>   	if (ret < 0)
>   		return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
>   
> -	ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (ret)
>   		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
>   
> -	lcdc->connector = drm_bridge_connector_init(drm, &lcdc->pipe.encoder);
> +	lcdc->connector = drm_bridge_connector_init(drm, encoder);
>   	if (IS_ERR(lcdc->connector))
>   		return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init bridge connector\n");
>   
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)



