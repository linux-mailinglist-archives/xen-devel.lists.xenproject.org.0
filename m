Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3o3oNdtlS2rzQgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 10:22:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325170E0BE
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 10:22:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355128.1609908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgeb5-0003Kb-2J; Mon, 06 Jul 2026 08:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355128.1609908; Mon, 06 Jul 2026 08:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgeb4-0003IJ-Vh; Mon, 06 Jul 2026 08:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1355128;
 Mon, 06 Jul 2026 08:22:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <huang.ze@linux.dev>) id 1wgeb4-0003ID-0l
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 08:22:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgeb3-0090CM-CE
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 10:22:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <huang.ze@linux.dev>)
 id 6a4b65c5-bab6-0a2a0a5309dd-0a2a450cd736-12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 10:22:32 +0200
Received: from [91.218.175.177] (helo=out-177.mta0.migadu.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <huang.ze@linux.dev>)
 id 6a4b65c8-f399-0a2a450c0019-5bdaafb148e6-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 10:22:32 +0200
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 16:22:24 +0800
Message-Id: <DJRCCWQOT4TA.1OPAZI88KOWLW@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Joel Stanley" <joel@jms.id.au>, "Andrew Jeffery"
 <andrew@codeconstruct.com.au>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Alex
 Lanzano" <lanzano.alex@gmail.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
In-Reply-To: <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-d25034/1783326152-91F23D51-6D59C8EC/0/0
X-purgate-type: clean
X-purgate-size: 2782
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed), No valid DKIM,reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:tzimmermann@suse.de,m:ze.huang@oss.qualcomm.com,m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	FORGED_SENDER(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8325170E0BE

On Mon Jul 6, 2026 at 3:27 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> struct drm_simple_display_pipe was meant to simplify simple DRM
>> drivers, but instead adds an extra wrapper around normal DRM atomic
>> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
>> should be converted to regular atomic helpers and stop depending on the
>> simple-KMS interfaces.
>>
>> This series converts the following drivers:
>>
>>    - arcpgu
>>    - aspeed
>>    - imx lcdc
>>    - mcde
>>    - pl111
>>    - gm12u320
>>    - repaper
>>    - tve200
>>    - xen frontend
>>
>> Each patch replaces drm_simple_display_pipe_init() with explicit
>> primary plane, CRTC and encoder setup, and moves the old simple-pipe
>> callbacks into regular plane and CRTC helper callbacks named according
>> to local driver conventions.
>>
>> The conversions preserve helper behavior that used to be implicit in
>> drm_simple_kms_helper.c, including plane-state validation, CRTC
>> primary-plane checks, affected-plane propagation, framebuffer prepare
>> handling, and existing event/vblank flow where applicable.
>>
>> Result is less helper indirection and more explicit driver-side atomic
>> wiring, with no remaining simple-KMS dependency in these drivers.
>>
>> These changes are build-tested only. No hardware testing has been
>> performed on the affected devices.
>
> Thanks a lot for the series. That's quite a nice cleanup.=C2=A0 Did you u=
se=20
> any AI to create these patches?
>

Hi Thomas,

Yes, I did. I wrote the first two conversion patches (arcpgu and
aspeed) myself to understand the migration pattern. For the remaining
drivers, I used GPT-5.5 to help with the repetitive boilerplate
conversion.

I should have reviewed the generated code more carefully before sending
the series. The sashiko-bot feedback shows that I missed several important
details, including commit-local state handling, the implicit NULL fb /
visibility checks from simple-KMS, and vblank/pageflip event ordering.
I am now going through these issues more carefully and working out the
correct fixes before sending a v2.

Do you expect AI assistance to be mentioned in the cover letter or commit
messages in some specific form? If there is a preferred tag or wording
for this, I will use it in v2.

For issues that appear to be pre-existing but are exposed or carried over
by the migration, which is better?

1. Include them as separate prep/fix patches at the beginning of the v2
series, before the corresponding conversion patches; or
2. address those pre-existing issues in a separate follow-up series?

Thanks for your time and review. :)

> Best regards
> Thomas
>

Best regards,
Ze

