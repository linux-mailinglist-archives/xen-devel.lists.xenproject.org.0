Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F189B4C8C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827484.1242103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nXS-0005BK-MP; Tue, 29 Oct 2024 14:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827484.1242103; Tue, 29 Oct 2024 14:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nXS-00058O-JZ; Tue, 29 Oct 2024 14:49:42 +0000
Received: by outflank-mailman (input) for mailman id 827484;
 Tue, 29 Oct 2024 14:49:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y6yv=RZ=quicinc.com=quic_jhugo@srs-se1.protection.inumbo.net>)
 id 1t5nXR-00058I-RK
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:49:41 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0393011f-9605-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 15:49:36 +0100 (CET)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T91Ow1025858;
 Tue, 29 Oct 2024 14:47:56 GMT
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gsq8gr78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 14:47:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TEltNx020912
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 14:47:55 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 07:47:54 -0700
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
X-Inumbo-ID: 0393011f-9605-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwNS4yMjAuMTY4LjEzMSIsImhlbG8iOiJteDBhLTAwMzFkZjAxLnBwaG9zdGVkLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjAzOTMwMTFmLTk2MDUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjEzMzc2Ljc2MjA1NSwic2VuZGVyIjoicXVpY19qaHVnb0BxdWljaW5jLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wv4O0Y5GVDH3vUrfYUR55hgvLmKzOGrUOAzL5LkrYY=; b=QS0t9JAUBHqWH02u
	dNtVrgHN86w5CLnNDffItzpLyqgQwNrWLXukh7717iCujg+qac7U0LQNgx8UjmfO
	pNppyLoV0BiCWiWYeQfbQSkEueNjqhpwe3ymQ/5JtmI+7D7lNEAuLZkjWYt7Bad3
	FIWANrEtgFCEbNhs18Z88h7B0VJOTTZcagFhIXvQ7W0zo2pKEUeoAojfMPClCC3w
	++dX6DXZS2K0/yun7AKEtrTTvl9CbZw4Czd+v0b3ypA1OiaF5hQ72P40HQv1u1dm
	mFSANVwhc7kKC3bU9wQWN7RlliJHoMkvZAvlxYf4h1W0oqtV7QsYssccuvYBrg1q
	QDJmNA==
Message-ID: <5dd216a0-0c99-6dd5-f06d-60c7c6da1b31@quicinc.com>
Date: Tue, 29 Oct 2024 08:47:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 3/3] drm: remove driver date from struct drm_driver and
 all drivers
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>,
        <intel-gfx@lists.freedesktop.org>
CC: Javier Martinez Canillas <javierm@redhat.com>,
        Alex Deucher
	<alexander.deucher@amd.com>,
        Simon Ser <contact@emersion.fr>, David Airlie
	<airlied@gmail.com>,
        Hamza Mahfooz <hamza.mahfooz@amd.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Simona Vetter
	<simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        <amd-gfx@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <nouveau@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>
References: <20241028185141.3756176-1-jani.nikula@intel.com>
 <20241028185141.3756176-3-jani.nikula@intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241028185141.3756176-3-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1zozjE_Cu_2BsSxN4CNnC4fCdn0_-mvH
X-Proofpoint-ORIG-GUID: 1zozjE_Cu_2BsSxN4CNnC4fCdn0_-mvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=982 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290113

On 10/28/2024 12:51 PM, Jani Nikula wrote:
> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
> 
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
> 
> v2: Also update drivers/accel (kernel test robot)
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

For QAIC -
Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

