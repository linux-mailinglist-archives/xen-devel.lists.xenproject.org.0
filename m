Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QjD7KnatS2qXYQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 15:28:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D3711469
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 15:28:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J6jD3g6q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OiKV0e1l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355366.1610130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgjLw-00074z-2h; Mon, 06 Jul 2026 13:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355366.1610130; Mon, 06 Jul 2026 13:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgjLv-00073Q-Vy; Mon, 06 Jul 2026 13:27:15 +0000
Received: by outflank-mailman (input) for mailman id 1355366;
 Mon, 06 Jul 2026 13:27:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wgjLu-00073K-2A
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 13:27:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgjLs-008Dhg-Nk
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:27:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4bad30-2eae-0a2a0a5409dd-0a2a450187a6-2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 15:27:12 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4bad2c-400f-0a2a45010019-cddcb4833cb4-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 15:27:09 +0200
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxDLX361307
 for <xen-devel@lists.xenproject.org>; Mon, 6 Jul 2026 13:27:08 GMT
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h5183u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 13:27:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2c82843005eso56520265ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 06:27:07 -0700 (PDT)
Received: from localhost ([151.243.38.149]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad7146914sm51455915ad.35.2026.07.06.06.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 06:27:05 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z62ZCofdO2RSyyIJCVJx2qppYjkSOPFanx+87YcffZY=; b=J6jD3g6q1gm777Y0
	tCEhSej+igS1polSMQBKyYChhg+l/XZ4uwIc80VGLNbhFVtISQD3SpBmjE1ZwhbF
	Gyy+MZ6yrmI/cemN48srn8oUg6zOIJn4hEBXEccdQEQcbYcJLAmnJCa3pO8gwWMS
	hQX0gz+gfZGsFO0XhX7ADUamBPev1aPouLxYej3AVjWqNyitOIqt+jg5xamMruy9
	mXClb3UePhfIV1iJDxj1j8O0FupwqsG6JhREVpfdK6IKl5SgTqCojkkEdR0ZVmop
	bmddZIy/is8juTCeZv8+eboKz68wZOZqboke98c+QKCX6raXn8VcSx3hJMac8F3h
	cxmmQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344427; x=1783949227; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z62ZCofdO2RSyyIJCVJx2qppYjkSOPFanx+87YcffZY=;
        b=OiKV0e1lGX0tqlA5nbU6+4oH9k3eg2/WLsqJl04Qz/w8vwac83YUMiSEKUnd142v/2
         y8FCHwec6ylT+fqfX+zEosx3y1OfyoJZMTlEVJ3tRB7vSaqm0Km0US6IrY5k9t+TijRH
         PE6ZMbfGAvBDF2K/y3YM8DIBv0ofN70AhNA8ci6KO+FEFyRuoAIs59sFL8RAEWzPaXpZ
         +/dgYzVZxGP7y/peTJV/Cdc/sZwkocx7NP8CIvBW6Zqb+ls0XoAzW2BYxiK/0Jsc3cJB
         KuTd6uKopGOzrYJEil4D2BKKLOYBdI73StxVF/BTK2Ya4lIsYOsY/j0csAIXoOkbe14o
         GDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344427; x=1783949227;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z62ZCofdO2RSyyIJCVJx2qppYjkSOPFanx+87YcffZY=;
        b=huUvyAAqmBrQQ9ZcAJ4ZALbgB6IKvfQOZ2nUs6XAp2p6Y/bOQc3Y+Tbnq2U6BrdaaX
         VzBBOTbrNWJry4RImthpfuB8ZHLD7zqjdQ/K0s6XkU7kE0IcRBAy6NoOgtWUK7Kt2Hjr
         Z6UeIMwf0wvgllsoS1PuuQqT381UiNbS+PRIEJAKhjKH3o7CawWM425zAGIbdg7jBqOQ
         npKkpQl4KTtGdRRrUGTGHze+PtYKr2e3sMuGTT9KlZfp7aU0vytrqsXSfBwl2cCLEYbf
         0jm80s0pNu6sgPd/EUMvo5Q2L3NXguDwLj9yUNnz2w8XKQE1QQF33hy+ZuZ3xn9tkRY/
         7LWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7p986Xi2a6ySpdih9XnHoy58rrmZb9Cgm47stIyCtv9PWwMI8x0ZbKwRfUU2YdXcJDgCDbhZ8JyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwA1EkvZINw18GIDhGDbKsTDEK00tkkVt1beR7NmW/4L56AhcL0
	Kyid1gAuQznROG6TS2QiJTuSS0hG9ru7NpjqHt3Q6ORlgRGepK5qLNO8Vtt2Ov/efJpmpX1H8tJ
	5nx/dMdAzoFB5kLnXJNbac8ywvty/KJC1GQldo5Fh0Ivp0txnUnjVbzuUc3hkSec78qBTXA==
X-Gm-Gg: AfdE7ckmUydErdvyneRrq3/XgJKE7PoJVvz7Te7bOmFawfeLpbEkWny8L8Elv65Gcqp
	KARValLoWXK1jckBMuYy4zB+4E9J4VPhIVkVvPfKmNZ3uWi6mijY6wWbtcf1oy6RE3bFRf+VHSb
	fz/hyPmpVwFvDoRrdPXc300MrHmyKL7FFRjuXl6HCEqEKREuXneIYrWeRotS3H2XgudrDzu8pe0
	PDSFyo0uEHle18hRWA152llNMHqoIAXMaU+Ro5jYUBc0QMpUoDib7N7f7WnoMQPEgXCJfDPDdWE
	2TyzgfDxjmk+nxvtM93lNsFGqMQOc6QAyKvQg/lwPrFqNLpwzoVgj0Bn83TeLojaSYbN4pgi5y8
	o0vUfmtCEtcWkjZ4=
X-Received: by 2002:a17:903:2409:b0:2ca:4cfd:a6ea with SMTP id d9443c01a7336-2ccbe729806mr5550595ad.16.1783344426565;
        Mon, 06 Jul 2026 06:27:06 -0700 (PDT)
X-Received: by 2002:a17:903:2409:b0:2ca:4cfd:a6ea with SMTP id d9443c01a7336-2ccbe729806mr5550005ad.16.1783344425931;
        Mon, 06 Jul 2026 06:27:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:26:52 +0800
Message-Id: <DJRIU0Y04PXO.1B0U1KFJRF3DX@oss.qualcomm.com>
Subject: Re: [PATCH 1/9] drm/arcpgu: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-1-b4e1ca053623@oss.qualcomm.com> <2f2f0744-02a0-44ae-a8af-df6163869be4@suse.de>
In-Reply-To: <2f2f0744-02a0-44ae-a8af-df6163869be4@suse.de>
X-Proofpoint-GUID: eM5BaVqdrswApQhwvmYlpky61NjR9sv4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX2GeM++OEF0Gy
 LA73SUjC8CWQJcCuUDnkRzjNWmNq8sGBns8ONfKmC+8KeAMC6lDRRPeT7aKIMAeBHXtr863t7Sp
 tMHExcEUQlytc33Tp9CksiLf9T1y0bg=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bad2b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rGEwuu0Ht92CbwYE1HAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX3Z1+aDONU+Nh
 uSvhRPx/LYPfI7v8WT8GEq31xCUD0iTPrqdm6Lb/ovT+37YlH2y5QYrHZQINlOOnemXv9rFJi/W
 pI3/U01/y4aPGzNYe+T0bqHtDLr1AuohDSBnw/r0qrBJxJS1b8iTkfLSRPGNGQf4p2xdHzL6DRf
 0tRw6lebvYS++Cgkwv9FeN+C973sB/C6Fp4iJNBlc1H9/zZi/EISOfrqctLtHN1wr9SmpQJWX5y
 o0HvA2ApB4COIZr04qwmDzPrP7ZUvpgIpnCqf3JYmORqu/6ORcyR9UYMTYfRupnYYfweLNb6ib+
 pG6HJICnuDSszmFrxpNgeOgrTAkhQEduaVLKArPqpq1lR5thFWhjJWEN1mMRlY04H5QudpQsitr
 r9lMdoaBDagmCa5jRzdqAPTePb+6NLcklMg6OwidMcWVV0CE4edA/RrBpYNswujKFVQ8Edls0cj
 IcUJ6DJ8/4pBXo1WsJA==
X-Proofpoint-ORIG-GUID: eM5BaVqdrswApQhwvmYlpky61NjR9sv4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060137
X-purgate-ID: tlsNG-d62444/1783344429-81CDE1E0-BD2DC90D/0/0
X-purgate-type: clean
X-purgate-size: 13558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:ze.huang@oss.qualcomm.com,m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[suse.de,oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B54D3711469

On Mon Jul 6, 2026 at 4:01 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Instantiate plane, CRTC and encoder directly and wire them up with
>> standard atomic helpers.
>>
>> This removes arcpgu's dependency on deprecated simple-KMS display pipe
>> interface.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/tiny/arcpgu.c | 165 +++++++++++++++++++++++++++++++++-=
--------
>>   1 file changed, 131 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu=
.c
>> index c93d61ac0bb7..375cdb79e4e8 100644
>> --- a/drivers/gpu/drm/tiny/arcpgu.c
>> +++ b/drivers/gpu/drm/tiny/arcpgu.c
>> @@ -17,12 +17,12 @@
>>   #include <drm/drm_fbdev_dma.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_framebuffer.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_module.h>
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_probe_helper.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/module.h>
>>   #include <linux/of_reserved_mem.h>
>> @@ -52,14 +52,14 @@ struct arcpgu_drm_private {
>>   	struct drm_device	drm;
>>   	void __iomem		*regs;
>>   	struct clk		*clk;
>> -	struct drm_simple_display_pipe pipe;
>> +	struct drm_plane	plane;
>> +	struct drm_crtc		crtc;
>> +	struct drm_encoder	encoder;
>>   	struct drm_connector	sim_conn;
>>   };
>>  =20
>>   #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, dr=
m)
>>  =20
>> -#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_privat=
e, pipe)
>> -
>>   static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
>>   				 unsigned int reg, u32 value)
>>   {
>> @@ -117,7 +117,7 @@ static const u32 arc_pgu_supported_formats[] =3D {
>>  =20
>>   static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
>>   {
>> -	const struct drm_framebuffer *fb =3D arcpgu->pipe.plane.state->fb;
>> +	const struct drm_framebuffer *fb =3D arcpgu->plane.state->fb;
>>   	uint32_t pixel_format =3D fb->format->format;
>>   	u32 format =3D DRM_FORMAT_INVALID;
>>   	int i;
>> @@ -139,10 +139,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_=
private *arcpgu)
>>   	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
>>   }
>>  =20
>> -static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_displa=
y_pipe *pipe,
>> -					       const struct drm_display_mode *mode)
>> +static enum drm_mode_status arcpgu_crtc_helper_mode_valid(struct drm_cr=
tc *crtc,
>> +							  const struct drm_display_mode *mode)
>>   {
>> -	struct arcpgu_drm_private *arcpgu =3D pipe_to_arcpgu_priv(pipe);
>> +	struct arcpgu_drm_private *arcpgu =3D dev_to_arcpgu(crtc->dev);
>>   	long rate, clk_rate =3D mode->clock * 1000;
>>   	long diff =3D clk_rate / 200; /* +-0.5% allowed by HDMI spec */
>>  =20
>> @@ -155,7 +155,7 @@ static enum drm_mode_status arc_pgu_mode_valid(struc=
t drm_simple_display_pipe *p
>>  =20
>>   static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
>>   {
>> -	struct drm_display_mode *m =3D &arcpgu->pipe.crtc.state->adjusted_mode=
;
>> +	struct drm_display_mode *m =3D &arcpgu->crtc.state->adjusted_mode;
>>   	u32 val;
>>  =20
>>   	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
>> @@ -194,11 +194,10 @@ static void arc_pgu_mode_set(struct arcpgu_drm_pri=
vate *arcpgu)
>>   	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
>>   }
>>  =20
>> -static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_crtc_state *crtc_state,
>> -			   struct drm_plane_state *plane_state)
>> +static void arcpgu_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					     struct drm_atomic_commit *state)
>
> Since you're adding these functions anew, please use 'commit' for the=20
> name of the drm_atomic_commit.=C2=A0 Here and everywhere else in the seri=
es.=C2=A0=20
> You don't have to update existing functions, of course.
>
> The name 'state' is a bit off here and comes from when drm_atomic_commit=
=20
> was still called drm_atomic_state.
>
> CRTCs, plane, etc have state, but the update of these states is called=20
> commit.
>

Thanks for your explanation.

I will change to name 'commit' for type drm_atomic_commit, here and
everywhere else in the series.

>
>>   {
>> -	struct arcpgu_drm_private *arcpgu =3D pipe_to_arcpgu_priv(pipe);
>> +	struct arcpgu_drm_private *arcpgu =3D dev_to_arcpgu(crtc->dev);
>>  =20
>>   	arc_pgu_mode_set(arcpgu);
>>  =20
>> @@ -208,9 +207,10 @@ static void arc_pgu_enable(struct drm_simple_displa=
y_pipe *pipe,
>>   		      ARCPGU_CTRL_ENABLE_MASK);
>>   }
>>  =20
>> -static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
>> +static void arcpgu_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *state)
>>   {
>> -	struct arcpgu_drm_private *arcpgu =3D pipe_to_arcpgu_priv(pipe);
>> +	struct arcpgu_drm_private *arcpgu =3D dev_to_arcpgu(crtc->dev);
>>  =20
>>   	clk_disable_unprepare(arcpgu->clk);
>>   	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
>> @@ -218,35 +218,106 @@ static void arc_pgu_disable(struct drm_simple_dis=
play_pipe *pipe)
>>   			      ~ARCPGU_CTRL_ENABLE_MASK);
>>   }
>>  =20
>> -static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_plane_state *state)
>> +static void arcpgu_plane_helper_atomic_update(struct drm_plane *plane,
>> +					      struct drm_atomic_commit *state)
>>   {
>>   	struct arcpgu_drm_private *arcpgu;
>>   	struct drm_gem_dma_object *gem;
>>  =20
>> -	if (!pipe->plane.state->fb)
>> +	if (!plane->state->fb)
>>   		return;
>>  =20
>> -	arcpgu =3D pipe_to_arcpgu_priv(pipe);
>> -	gem =3D drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
>> +	arcpgu =3D dev_to_arcpgu(plane->dev);
>> +	gem =3D drm_fb_dma_get_gem_obj(plane->state->fb, 0);
>>   	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->dma_addr);
>>   }
>>  =20
>> -static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs =
=3D {
>> -	.update =3D arc_pgu_update,
>> -	.mode_valid =3D arc_pgu_mode_valid,
>> -	.enable	=3D arc_pgu_enable,
>> -	.disable =3D arc_pgu_disable,
>> -};
>> -
>>   static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs =3D=
 {
>> -	.fb_create  =3D drm_gem_fb_create,
>> +	.fb_create =3D drm_gem_fb_create,
>>   	.atomic_check =3D drm_atomic_helper_check,
>>   	.atomic_commit =3D drm_atomic_helper_commit,
>>   };
>>  =20
>>   DEFINE_DRM_GEM_DMA_FOPS(arcpgu_drm_ops);
>>  =20
>> +static int arcpgu_plane_helper_atomic_check(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *state)
>> +{
>> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state=
(state, plane);
>> +	struct drm_crtc *crtc =3D plane_state->crtc;
>> +	struct drm_crtc_state *crtc_state =3D NULL;
>> +	int ret;
>> +
>> +	if (crtc)
>> +		crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>> +	return ret;
>
>
> Return directly here.
>

OK

>
>> +}
>> +
>> +static const struct drm_plane_helper_funcs arcpgu_plane_helper_funcs =
=3D {
>> +	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>> +	.atomic_check	=3D arcpgu_plane_helper_atomic_check,
>> +	.atomic_update	=3D arcpgu_plane_helper_atomic_update,
>> +};
>> +
>> +static bool arcpgu_plane_format_mod_supported(struct drm_plane *plane,
>> +					      u32 format,
>> +					      u64 modifier)
>> +{
>> +	return modifier =3D=3D DRM_FORMAT_MOD_LINEAR;
>> +}
>
> Please remove this function. It doesn't really do anything besides DRM's=
=20
> standard behavior.
>


Will do

>> +
>> +static const struct drm_plane_funcs arcpgu_plane_funcs =3D {
>> +	.update_plane		=3D drm_atomic_helper_update_plane,
>> +	.disable_plane		=3D drm_atomic_helper_disable_plane,
>> +	.destroy		=3D drm_plane_cleanup,
>> +	.reset			=3D drm_atomic_helper_plane_reset,
>> +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
>> +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
>> +	.format_mod_supported	=3D arcpgu_plane_format_mod_supported,
>> +};
>> +
>> +static int arcpgu_crtc_helper_atomic_check(struct drm_crtc *crtc,
>> +					   struct drm_atomic_commit *state)
>> +{
>> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(st=
ate, crtc);
>> +	int ret;
>> +
>> +	if (!crtc_state->enable)
>> +		goto out;
>> +
>> +	ret =3D drm_atomic_helper_check_crtc_primary_plane(crtc_state);
>> +	if (ret)
>> +		return ret;
>> +
>> +out:
>> +	return drm_atomic_add_affected_planes(state, crtc);
>
> Instead of using out, I'd rather use
>
>  =C2=A0 if (crtc->enable) {
>  =C2=A0 =C2=A0 =C2=A0 //do checks
>  =C2=A0 }
>
>  =C2=A0 return add_affected planes.
>
> Seems more natural to me.
>

Will do

>> +}
>> +
>> +static const struct drm_crtc_helper_funcs arcpgu_crtc_helper_funcs =3D =
{
>> +	.mode_valid	=3D arcpgu_crtc_helper_mode_valid,
>> +	.atomic_check	=3D arcpgu_crtc_helper_atomic_check,
>> +	.atomic_enable	=3D arcpgu_crtc_helper_atomic_enable,
>> +	.atomic_disable	=3D arcpgu_crtc_helper_atomic_disable,
>> +};
>> +
>> +static const struct drm_crtc_funcs arcpgu_crtc_funcs =3D {
>> +	.reset			=3D drm_atomic_helper_crtc_reset,
>> +	.destroy		=3D drm_crtc_cleanup,
>> +	.set_config		=3D drm_atomic_helper_set_config,
>> +	.page_flip		=3D drm_atomic_helper_page_flip,
>> +	.atomic_duplicate_state	=3D drm_atomic_helper_crtc_duplicate_state,
>> +	.atomic_destroy_state	=3D drm_atomic_helper_crtc_destroy_state,
>> +};
>> +
>> +static const struct drm_encoder_funcs arcpgu_encoder_funcs =3D {
>> +	.destroy =3D drm_encoder_cleanup,
>> +};
>> +
>>   static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>>   {
>>   	struct platform_device *pdev =3D to_platform_device(arcpgu->drm.dev);
>> @@ -254,6 +325,9 @@ static int arcpgu_load(struct arcpgu_drm_private *ar=
cpgu)
>>   	struct device_node *endpoint_node =3D NULL;
>>   	struct drm_connector *connector =3D NULL;
>>   	struct drm_device *drm =3D &arcpgu->drm;
>> +	struct drm_plane *plane;
>> +	struct drm_encoder *encoder;
>> +	struct drm_crtc *crtc;
>>   	int ret;
>>  =20
>>   	arcpgu->clk =3D devm_clk_get(drm->dev, "pxlclk");
>> @@ -301,12 +375,35 @@ static int arcpgu_load(struct arcpgu_drm_private *=
arcpgu)
>>   			return ret;
>>   	}
>>  =20
>> -	ret =3D drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe=
_funcs,
>> -					   arc_pgu_supported_formats,
>> -					   ARRAY_SIZE(arc_pgu_supported_formats),
>> -					   NULL, connector);
>> +	plane =3D &arcpgu->plane;
>> +	ret =3D drm_universal_plane_init(drm, plane, 0,
>> +				       &arcpgu_plane_funcs,
>> +				       arc_pgu_supported_formats,
>> +				       ARRAY_SIZE(arc_pgu_supported_formats),
>> +				       NULL,
>> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
>>   	if (ret)
>>   		return ret;
>> +	drm_plane_helper_add(plane, &arcpgu_plane_helper_funcs);
>> +
>> +	crtc =3D &arcpgu->crtc;
>> +	ret =3D drm_crtc_init_with_planes(drm, crtc, plane, NULL,
>> +					&arcpgu_crtc_funcs, NULL);
>> +	if (ret)
>> +		return ret;
>> +	drm_crtc_helper_add(crtc, &arcpgu_crtc_helper_funcs);
>> +
>> +	encoder =3D &arcpgu->encoder;
>> +	ret =3D drm_encoder_init(drm, encoder, &arcpgu_encoder_funcs, DRM_MODE=
_ENCODER_NONE, NULL);
>> +	if (ret)
>> +		return ret;
>> +	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
>
>
> I think plane, CRTC, and encoder should go before testing the=20
> encoder_node at [1].
>
> Then comes the encoder_node test.=C2=A0 If true, do a single encoder-node=
=20
> branch,=C2=A0 or else to a single connector-based branch.=C2=A0 =C2=A0Tha=
t would=20
> simplify the overall logic in this helper.
>
> [1]=20
> https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/tiny/arcpg=
u.c#L287
>

OK, will move them before the encoder_node test

>
>> +
>> +	if (connector) {
>> +		ret =3D drm_connector_attach_encoder(connector, encoder);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  =20
>>   	if (encoder_node) {
>>   		/* Locate drm bridge from the hdmi encoder DT node */
>> @@ -315,7 +412,7 @@ static int arcpgu_load(struct arcpgu_drm_private *ar=
cpgu)
>>   		if (!bridge)
>>   			return -EPROBE_DEFER;
>>  =20
>> -		ret =3D drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
>> +		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
>>   		if (ret)
>>   			return ret;
>>   	}
>> @@ -342,7 +439,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, =
void *arg)
>>   	struct drm_device *drm =3D node->minor->dev;
>>   	struct arcpgu_drm_private *arcpgu =3D dev_to_arcpgu(drm);
>>   	unsigned long clkrate =3D clk_get_rate(arcpgu->clk);
>> -	unsigned long mode_clock =3D arcpgu->pipe.crtc.mode.crtc_clock * 1000;
>> +	unsigned long mode_clock =3D arcpgu->crtc.mode.crtc_clock * 1000;
>
> Here, mode is an obsolete field. The correct field is crtc->state->mode.

Will correct the field

>
> Best regards
> Thomas
>
>>  =20
>>   	seq_printf(m, "hw  : %lu\n", clkrate);
>>   	seq_printf(m, "mode: %lu\n", mode_clock);
>>

Thanks,
Ze

