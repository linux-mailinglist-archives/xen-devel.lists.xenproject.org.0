Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A2F818429
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 10:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656615.1024909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFW7E-0000cX-RW; Tue, 19 Dec 2023 09:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656615.1024909; Tue, 19 Dec 2023 09:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFW7E-0000a6-OT; Tue, 19 Dec 2023 09:10:16 +0000
Received: by outflank-mailman (input) for mailman id 656615;
 Tue, 19 Dec 2023 09:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsdm=H6=quicinc.com=quic_acaggian@srs-se1.protection.inumbo.net>)
 id 1rFW7D-0000Zk-5O
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 09:10:15 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a0975c5-9e4e-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 10:10:13 +0100 (CET)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BJ6YluC012920; Tue, 19 Dec 2023 09:09:57 GMT
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v360ygdcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Dec 2023 09:09:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BJ99ukN014060
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Dec 2023 09:09:56 GMT
Received: from [10.110.16.10] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Dec
 2023 01:09:49 -0800
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
X-Inumbo-ID: 6a0975c5-9e4e-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=DfapB36I7rlWJic239LlbVizH1OKeq54QKe8ntTwzD4=; b=gv
	4wpIxQQ/mEQLayMcgcGVNwSjWWmi4LsPCLBomJ1/t1iesmLOYqnprgEH01dtrH7p
	JAQEIiqSPwv6t8DCvd3l6q3AkRiKSC3pEp/QMLFCuDcum7tHLRTACGwJ+NZzzvDL
	E6l2C3PCqglW1CEOC95eIrJxhGXkS+qed3Lj/XtDhluuq8ABRh18A9gptkIy8JAF
	cPy3i3gaGy8IFyp2A4O2u5Qn3iBd0U+WG/ayT7Ti6noSRjkYhZooJsLDFQp4RCxW
	96nua9micnYksl2yAmZPvGnx63PYb7Ct7cwAN+cHSMGmTqAUwUunXuUKQVMbJF9z
	Fmhydsh6h9ciP7fiBomw==
Message-ID: <dbb37337-1552-410e-8231-7619aacbf887@quicinc.com>
Date: Tue, 19 Dec 2023 10:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] virtio-gpu: Configure new feature flag
 context_create_with_flags for virglrenderer
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Gerd Hoffmann
	<kraxel@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Dmitry Osipenko
	<dmitry.osipenko@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>,
        Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>,
        Alyssa Ross
	<hi@alyssa.is>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Alex
 Deucher <alexander.deucher@amd.com>,
        Stefano Stabellini
	<stefano.stabellini@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
        Honglei
 Huang <honglei1.huang@amd.com>,
        Julia Zhang <julia.zhang@amd.com>, Chen
 Jiqian <Jiqian.Chen@amd.com>,
        Antonio Caggiano
	<antonio.caggiano@collabora.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-3-ray.huang@amd.com>
From: Antonio Caggiano <quic_acaggian@quicinc.com>
In-Reply-To: <20231219075320.165227-3-ray.huang@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lCdra24B1r8SqRQXtG29GWOoez15d2dY
X-Proofpoint-ORIG-GUID: lCdra24B1r8SqRQXtG29GWOoez15d2dY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 clxscore=1011 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190067

Hi Huang Rui,

Thank you for this new version.

All patches which I did not sign off are reviewed by me :)

Cheers,
Antonio Caggiano

On 19/12/2023 08:53, Huang Rui wrote:
> Configure a new feature flag (context_create_with_flags) for
> virglrenderer.
> 
> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> Changes in v6:
> - Move macros configurations under virgl.found() and rename
>    HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS.
> 
>   meson.build | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index ec01f8b138..ea52ef1b9c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1050,6 +1050,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
>                            cc.has_member('struct virgl_renderer_resource_info_ext', 'd3d_tex2d',
>                                          prefix: '#include <virglrenderer.h>',
>                                          dependencies: virgl))
> +    config_host_data.set('HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS',
> +                         cc.has_function('virgl_renderer_context_create_with_flags',
> +                                         prefix: '#include <virglrenderer.h>',
> +                                         dependencies: virgl))
>     endif
>   endif
>   rutabaga = not_found

