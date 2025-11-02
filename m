Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D839C292F8
	for <lists+xen-devel@lfdr.de>; Sun, 02 Nov 2025 17:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155186.1484715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFbL4-0005c6-SZ; Sun, 02 Nov 2025 16:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155186.1484715; Sun, 02 Nov 2025 16:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFbL4-0005aU-Ox; Sun, 02 Nov 2025 16:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1155186;
 Sun, 02 Nov 2025 16:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gezY=5K=oss.qualcomm.com=dmitry.baryshkov@srs-se1.protection.inumbo.net>)
 id 1vFb78-0003OD-Hs
 for xen-devel@lists.xenproject.org; Sun, 02 Nov 2025 16:39:34 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8136aa0f-b80a-11f0-9d16-b5c5bf9af7f9;
 Sun, 02 Nov 2025 17:39:32 +0100 (CET)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2EeN6r377528
 for <xen-devel@lists.xenproject.org>; Sun, 2 Nov 2025 16:39:30 GMT
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bg9j8ev-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 02 Nov 2025 16:39:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8984d8833so79091941cf.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Nov 2025 08:39:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-594282be8adsm789469e87.51.2025.11.02.08.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 08:39:27 -0800 (PST)
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
X-Inumbo-ID: 8136aa0f-b80a-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vsudp5PRE81p+UL97II9GrFo
	Q82PxOzVdfpShaNANXY=; b=MofBD+FvgCKPFuq3/UZeyNcPO7m4lbnHivOxOn7h
	/9eQpsVBicILU9Wyi7oVMysvN7k7Mw9FwfT4cK38MU7Xn9j/1v/0p6/Jf6+/PVhO
	gWjMNLjyOeisd7CIbEtHAh3y7coy+AFabvbvPQNy5jnA6RaGEUMgR++iZmAmLSpe
	FcF9U8T7xzAOGwsxol6eOhhJkNqSmZlDbcZrzrZiAZn9Ez/KyqbMLuBybNFobZGt
	AKrAXmbeaQ/JJrjNAqJO71reaAmJEanyzsfP6lFJkKGi84AHIyY/ZHYgjIvjNIlD
	VzG8fDkGWx/j74iJT8C/kUi3FZfSjsTjW7BgeK1e/d4lMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762101569; x=1762706369; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=e1kiyWwrcs9IZIN4yFCnbj7URBhs4dSiZ2l4mXOrSznOPuFvTTdELf6XCVzk02xyzT
         CFaQY/FDtzdAy1+mp0d3e6Kx94+0tZMEJ0gEzkdZlQN1wTijKAPhUwnJ0xbnblYcemBB
         vcdR3xkfCMAHfGeCGaMMsqNfyLF0Owl+Ugf3AA+ayHqAw0NFpINTKZ6q9AsOOPEwsxs8
         qbdM94YWMCYRmQOzFCU2f94RoVFfRFYGMljagdWPU8S3HPW03Vcr3rv8zVyyzGqrLtxi
         IxvVRgVJvfdWvk/x0Jwq9wfLExM4irX10Xk9vPsHcRzlOUQYJXncfd2/UcveRMPR5vY1
         upmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762101569; x=1762706369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=LCZH61YsHO2aapwZvPoacqICGYPKVn8Aa+ZIC4IrQOoySSN6noJTZlUmyrJIuquD5O
         vnsCK82nGp8cQjldj4o/BOnOOrpPSGmSpzSNlv1LKI7On3+bhY/Lx7i8OKqiykWv5j0d
         VXyCPHI+1smstZB1Znvl4YRU7T7T7jPPf7E0DDf1aFu7bSdzKwLzcllrkzZFVpx0eHDr
         +ONxQ65+VYRR/2irvbxVSsxdtm53HZ/VrspgvHlqOZOr1Hl2/z5AH/fIiuHr9p7FleNf
         20CBNIuQvT2M7lB/Z+d4/wpxoReC5K7Jnics7dLEVjvgAV1bYIFuEcGt7HEiWJtNHzrT
         Y/3w==
X-Forwarded-Encrypted: i=1; AJvYcCVedO7OBrgPoaXqzM9ouYI3ATNH88myrYarN7iRP9v2KV386uVCbIk0luVxOliWziLBmOt5HR/0Ujs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzga9mr8nft76R2EyohzG74VwtTYeogmrFEtxRcCj/jcKpj/eT0
	14kj8kWf1gYuhU6vTTYWa5byvO9C6mkGcjDO4ukFwHw55sOpECgw7gBIujI77i907ozRpW7SrYP
	c3YdSiShnNTkePFt/zNnFY88RzGH3pSKjPiGcZvHmPsFPa3Zb+aIzG93fkRwA0aZXpLWQxw==
X-Gm-Gg: ASbGncvWF3j/cygSTDexraHgCWd2UMRS2DFYNN31c6IIbQuvMjCTBKNuDKTLQv2/NEL
	w1A9gK/YQsuEH/SS2txyqB3t5nGs82W65DW+mlCl4jmClCG4XjIW5RjXQliMerwH9L9UPV1vNZE
	+cwx85vrRhxZpD6Tvw9RRf5H6ZicxYPqYfv3cuL7xn7zMDP9Cq6244j8DJy205ps8B9kqMu+OYi
	ExrlsBmBdCgQrr+y2qT+aee42L/bMMKlc3c5FMo5/hxudeSV0vnGEmcM5oGlpnRIGqcD7ixVakc
	Q06yUzje0zH34UcAHUqJcPSABHY1fHx0J9iT2afDKLD6Nzg1ZE7gL75FIinCD0WDsJPgtsUBSl5
	yLpYAccf4+ctYmokg9Jv096bzfNXn7GlfRnSwxc0yJW9FMDivZW2UXg9QGPoAtX2jdpnhwf9RnF
	sIhSCqDdrBxIR5
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57411091cf.54.1762101568690;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDCWJDKPzqxu7f2En5m/zHiJp5IOVrgHqGPH6qz1rOivQAZXaoWbSK0Fgiw9Mg8qUeB+6cA==
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57410861cf.54.1762101568242;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
Date: Sun, 2 Nov 2025 18:39:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
        tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
        xen-devel@lists.xenproject.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v6 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081918.79786-14-tzimmermann@suse.de>
X-Proofpoint-ORIG-GUID: cajfqfOLeswAMmPuhLRi3XM4KinP2bdI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NCBTYWx0ZWRfXwV3LjpEJeYFW
 BHt8rtRfblKzmlXaGzSDcXYffMIGdrbJCKIz7TPB0HD4szi8C1YgUDWYftv3+pZm4syhmSlqVYg
 atL6TVZvmMGUDp0Rbd+w4xcD9bU9VpcaWScSzGStbDzCgrpm5e0gKNcOTwuktjTKEUHEXfGknyC
 HMTuWatKGRdcuq5Qch1iX8ECk1zRofRLZL5IH9JvkJDGzX6NbafeLs7Xf44y+OpbEis5KmLWoXP
 Gwi1F9UcHXCRcDwIzGqzE+E7FsOk6PeVnHMc0ecVU8oAhWYxnpG8h5k0ID37RiPcyGX2lB4AhnW
 nTK3WG2/Tz5N0AsNOD7bQ0lYFNZ/nSmmbFX7GJ5kuw7OcH9yGD1p8YAzFaVWVGgLK0mwbfEp6r1
 iTy9FSf92SCmdt80L90GGiFpKLzsrg==
X-Proofpoint-GUID: cajfqfOLeswAMmPuhLRi3XM4KinP2bdI
X-Authority-Analysis: v=2.4 cv=TaKbdBQh c=1 sm=1 tr=0 ts=69078941 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=4vBwfh3hQKJL6CJddaEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020154

On Thu, Aug 21, 2025 at 10:17:20AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Alignment is specified in bytes, but the hardware
> requires the scanline pitch to be a multiple of 32 pixels. Therefore
> compute the byte size of 32 pixels in the given color mode and align
> the pitch accordingly. This replaces the existing code in the driver's
> align_pitch() helper.
> 
> v3:
> - clarify pitch alignment in commit message (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

This broke kms_getfb@getfb-reject-nv12 and kms_getfb@getfb2-accept-nv12
IGT tests. I'll submit a fix separately.

-- 
With best wishes
Dmitry

