Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3u0KM71LTmpmKQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:08:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369977269ED
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:08:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bhLue+T1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DQwjMry1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356997.1611501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whS0P-0003bk-Pz; Wed, 08 Jul 2026 13:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356997.1611501; Wed, 08 Jul 2026 13:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whS0P-0003Z2-NQ; Wed, 08 Jul 2026 13:08:01 +0000
Received: by outflank-mailman (input) for mailman id 1356997;
 Wed, 08 Jul 2026 13:08:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ze.huang@oss.qualcomm.com>) id 1whS0O-0003Yw-8Z
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:08:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whS0N-00A2AC-Hj
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:07:59 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4e4baa-2eae-0a2a0a5409dd-0a2a4503c8ce-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:07:59 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ze.huang@oss.qualcomm.com>)
 id 6a4e4bad-ec1a-0a2a45030019-cddca8831d24-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:07:58 +0200
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668C39cA2605301
 for <xen-devel@lists.xenproject.org>; Wed, 8 Jul 2026 13:07:56 GMT
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5ar46-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:07:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-738e5b5ef68so201778137.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 06:07:56 -0700 (PDT)
Received: from localhost ([155.117.96.35]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-744d6a3ee7csm1525979137.2.2026.07.08.06.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 06:07:54 -0700 (PDT)
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
	WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=; b=bhLue+T1HZS6Z1yl
	0SK7piGEP/m4bSiAAlhhNU1mTl4FX62J6rU1q96kA8aMseiY9ZWto/Dd+0Miw/MA
	mR4PyKQbN0+ZHEnUBucu6zOkAfsXEujfYWmhI1l4vmbj7e2jH7cR7VwXg/Z3crhN
	8NMEObbUbI6ULX1L6+S8JWxbOZ31JSqX/EATTSay9ArAKJaG68hvW+2EcXMK96to
	NoyER+PjRKSJ3ycZpb7+FNwNa/8pI5bYh5dQkZYYYmwi0kkWyLAdJpvqie26YbNn
	Nx4kVOvaFr1YQ5T3Dorvfj4wI18xfQdrLiWC94ltSqRHDt3vqchC2u6ywJgry83Q
	kdthGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516075; x=1784120875; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=;
        b=DQwjMry1HPFIZNbNe9wIqLV+j9GoNkbbxEkKvpLR1Wwi4l9hZO1SPcnwg/VQLn0Dvg
         xeeB4UJE51X4V5ojUNefPa2TSvtBW5W0TbxBDfACOApjqQDTjl0jDVUToWTOVhSjlPzN
         FYYoNBSxeOyIVQqPeVyAQFDwYfDSmPrQ24S2JR2ZzB1NO51Hr/2BLAJp6F+UySA3Oa6q
         zNN8BBDyl5095NAnEbAo8sicD15C0Ly0Sr6E3MCWRRoGGL3SvNBZ9MQZ9U3QoMddIDjU
         PR+CQ6UfJLbEzQWNtO33q7ik/gqy1Y6BGCx5v7piXo81MjzcHLPJiOOlbFcGlAaRZLaw
         Ww2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516075; x=1784120875;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOOq+NNu+tyhPReYKnu6wDK3tTFUATf17W5IdwFPg9M=;
        b=EGV0ouaeVIWb4tyV/mC/1Vs2qDqSppUe44qfGnCXMf7OkRrdAOS0dYZExmK8gkArKR
         N9BRTm7KxEVlqvOUsJJ3SRkr+bVCF7ZMI3rTnoU23Cz4q2Z4qKj/1Nlk385P78sQX8Yb
         k2mK+er8zGSI4l2J7s14wK+z3+WKgtB4DFDScEOB/P697oGdXQVCrP8QRWG+5UBSZifq
         +lwU3f5n9NI06bbFbZcTieS3G5CshY+4sIBlj2vRjKRV/al1k6gsf8nuUXgi3yQZSWLS
         HoYqT9B6nyh8zMRNRfXAXjFfvA+SWn5vNMB2EkoIf1HiiRslKwbAFvEizo03GUX4OqD1
         KKBg==
X-Forwarded-Encrypted: i=1; AHgh+RrBywg0TO2XUkbuiBCl5ZcKe9rdEBFDZ8ohSdYJjZRYLPkKGDs3H9rbB3fOvOyjo86Wbp0lXcSNJCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXGim9yOvCK+FnVaFPCIyiXUCznBsLQ88Qej4f4bcg4m/sdJRd
	r3VK7hPHnYFX6xoVRqASToJeGclYVJVOiCcxKDFm8KLQ5zxn0sft2mkDevBubsSjmSnuOhT4rR5
	eRM8rUlNWtEzFUlpJLrJlCgJi+sl7Ds7Rh7UYDVziWzKox1AnLEgBoRiYztlz24WeMzh9ig==
X-Gm-Gg: AfdE7clzJPVvSyp/O5OItS3jO6YPqbu06zb4PtFpQN2HTMXuwBnNA1x3MVt4LQItGAw
	JUUivNAazN3DYH6g66iwImD1wWNstVt9J/8NIsKgzYAoRBGVpi7/r3Qvbi0zAHhrF/umd4lIcAL
	m9PvO+nOdWhug5GM7meoaJgivkhkGy9lUZZNbIsspyeLGSM6zifP8gUeSeELhjNhwmr95nXLYKl
	jSXa/hakfkulERdq+zgvo+hnraK0uw0Y08DqMepZT+SwilwVnBP+o0eER2cGDE1MeBDAVvttjTr
	pVgnvq7CJJzrUdmClPzD0OLGuzXJ7w5XmJaT+JE16qVI+Pxc7Rx1LAn9iAEFfMwzEwHV9zOphp9
	1UKWqs0ysfFXPjw==
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr1130785137.29.1783516075442;
        Wed, 08 Jul 2026 06:07:55 -0700 (PDT)
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr1130755137.29.1783516075014;
        Wed, 08 Jul 2026 06:07:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 21:07:33 +0800
Message-Id: <DJT7OBVIB2J3.N6UA6SLKJXZB@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/9] drm/imx: replace struct drm_simple_display_pipe
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
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-3-b4e1ca053623@oss.qualcomm.com> <1c84099b-6f0d-4655-9aea-015a821b50db@suse.de>
In-Reply-To: <1c84099b-6f0d-4655-9aea-015a821b50db@suse.de>
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e4bac cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=lv_lVlItrp0lmarviNkA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX0xGqHSPLsT9u
 YE7ZwznnYhnC3XnZXoAa+gfYdXx5hhdvKRPt881PbirPhRW9ddH2FW1su3bqb/QoKcLvaQKjiJ6
 QzDWCdWj11pfXt/NGxvwEcQl/1f0Fiw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfXzr2+FlMl6a9H
 rZ2YBcA/hMC5KcWKHJb/5tc1MGyfNB16l24kIx+NnqKYP/v1T/xNwRN3N1bWLG4eQq0d/ePttS1
 T1l8y6v3L2jqVQF4UO+3CB17beDPPvEvrbiWjTjFojNAEefAfE12WN5wgYLjLhvtgP6pMkqTNHE
 qTf2ShWjOcCG1lGSOaFcFV8B8pdeAw3FmGBWfYX51n393LbmR/s+xu7Un8VEoHI8zY7XybZClRE
 GkA0KKb37L3xhlxsscntWl1TG/HO+1KURTEVuSC8SJ7IDJ60SAN0m61elJmvfKZyz/ev3YIArFa
 mxVWXQnj96XTUXGWhHAGuAZ4NtEe6sJyeGHdaKNVixw5Gedfry4tLYZ+J5AKY+NIxWTNPb0kKFm
 aAXWJXmlZkuvkvZb2DLh0osUh4lJAhEjO5KtfAt5zfG6P2AdRxzM5NIV4RpG49grJBaaZT6ZlLd
 7NFBR3iHk0d8IWiXYFQ==
X-Proofpoint-ORIG-GUID: 0wEkXYlLHEbR_ohys0anzlX5odyNJrTK
X-Proofpoint-GUID: 0wEkXYlLHEbR_ohys0anzlX5odyNJrTK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080127
X-purgate-ID: tlsNG-33051d/1783516079-BC9825D1-CC6B1BB4/0/0
X-purgate-type: clean
X-purgate-size: 330
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:tzimmermann@suse.de,m:ze.huang@oss.qualcomm.com,m:abrodkin@synopsys.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linusw@kernel.org,m:hansg@kernel.org,m:lanzano.alex@gmail.com,m:oleksandr_andrushchenko@epam.com,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[suse.de,oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[ze.huang@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 369977269ED

On Wed Jul 8, 2026 at 8:44 PM CST, Thomas Zimmermann wrote:
> Hi,
>
> the imx driver is well maintained IIRC. I'd advise you to split off this=
=20
> patch from the series and send it out separately. That is more likely to=
=20
> catch the attention of the driver's maintainers.
>
> Best regards
> Thomas

OK, thanks

