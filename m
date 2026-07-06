Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s+sHFXiuS2rIYQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 15:32:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901887114F7
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 15:32:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fG+3SByw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f8Qmg3YK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355376.1610142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgjQy-0000EX-Md; Mon, 06 Jul 2026 13:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355376.1610142; Mon, 06 Jul 2026 13:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgjQy-0000Be-In; Mon, 06 Jul 2026 13:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1355376;
 Mon, 06 Jul 2026 13:32:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1wgjQw-0000BC-5X
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 13:32:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgjQu-00AArv-Vf
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:32:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4bae58-bab6-0a2a0a5309dd-0a2a450cd734-48
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 15:32:24 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4bae66-f399-0a2a450c0019-cddca8835ef4-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 15:32:24 +0200
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxD4H366706
 for <xen-devel@lists.xenproject.org>; Mon, 6 Jul 2026 13:32:22 GMT
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891us4ef-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 13:32:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-84696ed3b24so4843196b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 06:32:21 -0700 (PDT)
Received: from localhost ([151.243.38.149]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d82382sm3762898b3a.49.2026.07.06.06.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 06:32:20 -0700 (PDT)
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
	b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=; b=fG+3SBywJZ4CROyC
	EBkvPSthGbsziZkeQ7K40QVe4l60fKx8Uz2ijBpMSp1CBVrM+HI0Qd48bpu+Nzhi
	b04ix3wRfk0Y6Vz8Brg9AsqOEADGYxOTg6YXVxaP6tiB5K+NL9xWmAIQdcSDsoja
	45b2aDZ3euian4+uXjzxtwYvwI7wgwpW24xN4DoAEA0dPPY4VKGbbtifFuvCkpGD
	W08lRaoc5vSPjy7BTnjfbHHH1tS2o+s/64gN7WIJ9Qc5EPV85CK276mNfFiZO5Kz
	6EK8MGQwRIYJLD/vCqeLfFfNvZBogj1cBhA/mt27j0jVSHDY5xiaxoDqHwFtLlDE
	9x26Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344741; x=1783949541; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=;
        b=f8Qmg3YKFDGFOlQ1azgIAN9b5B7N09CgemefHw8hdBcNOk/PBT3er2uVAKGFKsFfTl
         mmprXF4kkTixnSCujVlRCs/4NGSwpVK7hdJJXmJY0plZrm4SfkyEs5QX4UU63f5IeD6N
         VQf/4LWCCmNlIJY7l6j9v1svjHYwtv31DbvW5ZvLfJaSmTJdzBLS50nGxxwtr5jjYSf3
         /0na50d/WEjo7orb7HoC+70gekFsRAXxib8qx3g9Q13Gxasx7xuVWPQJKZY5QPSw/xzG
         BeBuXZJvntOSvGP+cXAmPhf3cQcHkfLoEmI3XONUavIThrPbZbnfdtYvsLEgjYDa1+aE
         hzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344741; x=1783949541;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0A44HOo06DPQTnDCUPqJ4UMJjyqFyasJ88lIL5lLZ8=;
        b=UocxvNpfJiweTpoOVTEl2ZrdyslqaVMhI8G62f87yxLhKFhuHGk1r1JYnQHvypPHKI
         Ip+DzPYTJKiaAhAUgWcaunScZLidSQeE4PgyIGFS2AgV/riNuu8OWP95VRXt0ZwVRojm
         voiFP8mxMg/qsqR9mr8Zu3lQjB/5xjr1WcwfooRwuh3AxgAaF/DRwR9jnEFAou5Mm3wS
         Vv5kUYvwT/yVa7dpqCuoMd+VJo/Xi11hUDtlT978CHrdH8Mk0vpCdwpq3UYk7g4ftkkq
         +Co9tC0M3L4t1SenkPcJVnA+VsgmHJzDghEPChUFGQkW0MB5jV3LgEemNx+4TjH4sJXC
         Jp+w==
X-Forwarded-Encrypted: i=1; AHgh+RoFWWbX0GY0lJNKo+zVVo4QZNTnkTfDGYik7iGNy9VcxoeUYzTiwlPT6X8NdOvR5gh7FKkDqYklXDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywv/2GIB42UCWZbNgUXrGT/m0cWgEwVcjhh4BN2UflJvRFqtn4t
	nlzjwp2KFi149jgPm3NbmqPrv3IvA0ERFwtBBcmSndJiNst8e7q0efkB3L9B7cVuZ+rnEgf6Gmm
	B3HwE2kyj1Xe1xJ0t0+egblaPQMLLBCf5gUg4L8xIMJntu9bK4EmRCD0Ug+JeiHG8Kv8j4g==
X-Gm-Gg: AfdE7ck/N5V6yEV3jNK9Lig+RHetiXAEnoVf1YlwjVTAHSPAF/5DiYFf6wiiCvD9MFK
	qPh1j6HNbknRfRZmT1qt0cMVf+NseO5YDlrHfIhvKtXiljiJ5y0RLjUyIwC5CWHpZz2N3Qz/6xi
	txOJoC3ECTxRy+qwIn144d6j2BMlZE+9Ol4G4YvXLLRf2QPDwbq2Sj4WECvEiAg7j2fC/aPGCS6
	Pq+GhnW8KTbLBKoHIKZb6hJV88XCkVOAPtkKa3yu822ZWr+PLDlKiE2mvIB7d0nZzJvZYr3wdV4
	goUb9Ej8cK83bLSWnKyYT8+lso1xtyCjN2E/Hb0l4Mf9HuV4Z9T8IVOPPqrApQKaibL+g+vA+aQ
	lYP8v06RBT3D7pzY=
X-Received: by 2002:a05:6a00:c8d:b0:847:8f8a:a055 with SMTP id d2e1a72fcca58-84826bea1afmr615699b3a.17.1783344741263;
        Mon, 06 Jul 2026 06:32:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8d:b0:847:8f8a:a055 with SMTP id d2e1a72fcca58-84826bea1afmr615631b3a.17.1783344740650;
        Mon, 06 Jul 2026 06:32:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:32:03 +0800
Message-Id: <DJRIY04KAKRH.2XJRADHKJ4G55@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/9] drm/aspeed: replace struct drm_simple_display_pipe
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-2-b4e1ca053623@oss.qualcomm.com> <4e35e133-364a-4743-9ca0-f0799bdf28f8@suse.de>
In-Reply-To: <4e35e133-364a-4743-9ca0-f0799bdf28f8@suse.de>
X-Proofpoint-GUID: jLQiyAkUiU10C8ObXqKI8EJd-iehcnEl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX/dSZblGZShjo
 QdZPJxPc74a+EviqbOJknGUtau4JetIuWzvTVYSL61VX4B2RXAihruiF7U/SFK0bUf4NoCmEf4S
 /b1ZoLshFlgPvY5gCvp3bv2U6NLRJdc=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bae66 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OF-i8N8vVdU2NhfsQ9oA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX5GnpPUye+G+Q
 jf32T4n0fR+PT0H235NLU57124bW2Qinm6uSfs+taBHZXYx2DMB69Jt1UEBZnNmxjWNTZNM0uNo
 S2NPokjALJRjZL0QP+O96s7eH8EdLdJNUc1N5odpQBRnqa1N/wacIPAtk8CnBRoIkrjIkyvfD8A
 ydaXCZ5mMer9BIhZ7CLaZ17Z3YVRc18TVgwBt7ivygDkR70DQSdfq3tf/zpw9nmymUJqdNqCzkx
 Iq24ufyYeSyYZjtm0PTDE6++HP0s90+vXPz/0NDzO2eCV3hz6wyejZCIotWwUBZIs1EjpeMvI8i
 Yy12d0GDHHlw7eKtuJD3xvU1jLXkfGn0cQ6qpanXH5002FxBDLnqGsAUfsZYBSbdiqaAIlWeCb4
 B6lIO/fGhScHS0f5tjgwh5MRh6dzRhfLumltIM3svaXJatSAwy667t6+OG6WgdtBXT5RRvYf3i2
 BsSIqXA7ZCUufiKgITg==
X-Proofpoint-ORIG-GUID: jLQiyAkUiU10C8ObXqKI8EJd-iehcnEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137
X-purgate-ID: tlsNG-d25034/1783344744-90110D51-9D742938/0/0
X-purgate-type: clean
X-purgate-size: 9441
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:tzimmermann@suse.de,m:ze.huang@oss.qualcomm.com,m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[suse.de,oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 901887114F7

On Mon Jul 6, 2026 at 4:31 PM CST, Thomas Zimmermann wrote:
> Hi,
>
> common points from my arcgpu review applied here as well. See below for=
=20
> a new other things.
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> Replace simple display pipe with explicit plane, CRTC and encoder
>> objects. Move callbacks to plane and CRTC helpers, with vblank handling
>> through drm_crtc_funcs.
>>
>> This removes intermediate simple-pipe layer and uses standard atomic
>> helper wiring.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
>>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 +++++++++++++++++++++++=
--------
>>   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
>>   3 files changed, 123 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspee=
d/aspeed_gfx.h
>> index 4e6a442c3886..a34811564c0d 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
>> @@ -2,7 +2,6 @@
>>   /* Copyright 2018 IBM Corporation */
>>  =20
>>   #include <drm/drm_device.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>  =20
>>   struct aspeed_gfx {
>>   	struct drm_device		drm;
>> @@ -17,7 +16,9 @@ struct aspeed_gfx {
>>   	u32				throd_val;
>>   	u32				scan_line_max;
>>  =20
>> -	struct drm_simple_display_pipe	pipe;
>> +	struct drm_plane		plane;
>> +	struct drm_crtc			crtc;
>> +	struct drm_encoder		encoder;
>>   	struct drm_connector		connector;
>>   };
>>   #define to_aspeed_gfx(x) container_of(x, struct aspeed_gfx, drm)
>> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/=
aspeed/aspeed_gfx_crtc.c
>> index 7877a57b8e26..3294795c31c4 100644
>> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
>> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
>> @@ -5,6 +5,8 @@
>>   #include <linux/reset.h>
>>   #include <linux/regmap.h>
>>  =20
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_fb_dma_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -12,20 +14,13 @@
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_panel.h>
>> -#include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_vblank.h>
>>  =20
>>   #include "aspeed_gfx.h"
>>  =20
>> -static struct aspeed_gfx *
>> -drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
>> -{
>> -	return container_of(pipe, struct aspeed_gfx, pipe);
>> -}
>> -
>
> Please create a new helper
>
>  =C2=A0 struct drm_aspeed_gfx *to_aspeed_gfx(drm_device *drm)
>
> that does the upcast.
>

Will do

>>   static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
>>   {
>> -	struct drm_crtc *crtc =3D &priv->pipe.crtc;
>> +	struct drm_crtc *crtc =3D &priv->crtc;
>>   	struct drm_device *drm =3D crtc->dev;
>>   	const u32 format =3D crtc->primary->state->fb->format->format;
>>   	u32 ctrl1;
>> @@ -79,7 +74,7 @@ static void aspeed_gfx_disable_controller(struct aspee=
d_gfx *priv)
>>  =20
>>   static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
>>   {
>> -	struct drm_display_mode *m =3D &priv->pipe.crtc.state->adjusted_mode;
>> +	struct drm_display_mode *m =3D &priv->crtc.state->adjusted_mode;
>>   	u32 ctrl1, d_offset, t_count, bpp;
>>   	int err;
>>  =20
>> @@ -139,33 +134,31 @@ static void aspeed_gfx_crtc_mode_set_nofb(struct a=
speed_gfx *priv)
>>   	writel(priv->throd_val, priv->base + CRT_THROD);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe=
,
>> -			      struct drm_crtc_state *crtc_state,
>> -			      struct drm_plane_state *plane_state)
>> +static void aspeed_gfx_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +						 struct drm_atomic_commit *state)
>
> Please see my comment on arcgpu for the new naming of 'state'.
>

OK

>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>
> Please use=C2=A0 your helper=C2=A0 to_aspeed_gfx(crtc->dev)=C2=A0 to do t=
he upcast.=C2=A0=20
> Here any in other places.
>

OK

>>  =20
>>   	aspeed_gfx_crtc_mode_set_nofb(priv);
>>   	aspeed_gfx_enable_controller(priv);
>>   	drm_crtc_vblank_on(crtc);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_disable(struct drm_simple_display_pipe *pip=
e)
>> +static void aspeed_gfx_crtc_helper_atomic_disable(struct drm_crtc *crtc=
,
>> +						  struct drm_atomic_commit *state)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>
> Another upcast issue
>

Acknowledged

>>  =20
>>   	drm_crtc_vblank_off(crtc);
>>   	aspeed_gfx_disable_controller(priv);
>>   }
>>  =20
>> -static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe=
,
>> -				   struct drm_plane_state *plane_state)
>> +static void aspeed_gfx_plane_helper_atomic_update(struct drm_plane *pla=
ne,
>> +						  struct drm_atomic_commit *state)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_framebuffer *fb =3D pipe->plane.state->fb;
>> +	struct aspeed_gfx *priv =3D container_of(plane, struct aspeed_gfx, pla=
ne);
>
> to_aspeed_gfx(plane->dev)
>

Acknowledged

>> +	struct drm_crtc *crtc =3D &priv->crtc;
>> +	struct drm_framebuffer *fb =3D plane->state->fb;
>>   	struct drm_pending_vblank_event *event;
>>   	struct drm_gem_dma_object *gem;
>>  =20
>> @@ -190,9 +183,9 @@ static void aspeed_gfx_pipe_update(struct drm_simple=
_display_pipe *pipe,
>>   	writel(gem->dma_addr, priv->base + CRT_ADDR);
>>   }
>>  =20
>> -static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pip=
e)
>> +static int aspeed_gfx_crtc_enable_vblank(struct drm_crtc *crtc)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>>   	u32 reg =3D readl(priv->base + CRT_CTRL1);
>>  =20
>>   	/* Clear pending VBLANK IRQ */
>> @@ -204,9 +197,9 @@ static int aspeed_gfx_enable_vblank(struct drm_simpl=
e_display_pipe *pipe)
>>   	return 0;
>>   }
>>  =20
>> -static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *p=
ipe)
>> +static void aspeed_gfx_crtc_disable_vblank(struct drm_crtc *crtc)
>>   {
>> -	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
>> +	struct aspeed_gfx *priv =3D container_of(crtc, struct aspeed_gfx, crtc=
);
>>   	u32 reg =3D readl(priv->base + CRT_CTRL1);
>>  =20
>>   	reg &=3D ~CRT_CTRL_VERTICAL_INTR_EN;
>> @@ -216,12 +209,75 @@ static void aspeed_gfx_disable_vblank(struct drm_s=
imple_display_pipe *pipe)
>>   	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
>>   }
>>  =20
>> -static const struct drm_simple_display_pipe_funcs aspeed_gfx_funcs =3D =
{
>> -	.enable		=3D aspeed_gfx_pipe_enable,
>> -	.disable	=3D aspeed_gfx_pipe_disable,
>> -	.update		=3D aspeed_gfx_pipe_update,
>> -	.enable_vblank	=3D aspeed_gfx_enable_vblank,
>> -	.disable_vblank	=3D aspeed_gfx_disable_vblank,
>> +static int aspeed_gfx_plane_helper_atomic_check(struct drm_plane *plane=
,
>> +						struct drm_atomic_commit *state)
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
>> +}
>
> Return directly.
>

OK

>> +
>> +static const struct drm_plane_helper_funcs aspeed_gfx_plane_helper_func=
s =3D {
>> +	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>> +	.atomic_check	=3D aspeed_gfx_plane_helper_atomic_check,
>> +	.atomic_update	=3D aspeed_gfx_plane_helper_atomic_update,
>> +};
>> +
>> +static const struct drm_plane_funcs aspeed_gfx_plane_funcs =3D {
>> +	.update_plane		=3D drm_atomic_helper_update_plane,
>> +	.disable_plane		=3D drm_atomic_helper_disable_plane,
>> +	.destroy		=3D drm_plane_cleanup,
>> +	.reset			=3D drm_atomic_helper_plane_reset,
>> +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
>> +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
>> +};
>> +
>> +static int aspeed_gfx_crtc_helper_atomic_check(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *state)
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
>> +}
>
> See arcpgu on a possible style improvement.
>

Will do, thanks


> Best regards
> Thomas
>

[ ... ]

