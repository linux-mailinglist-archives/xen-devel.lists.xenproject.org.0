Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B5FA1DAD4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 17:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878094.1288265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSMF-0005qk-Du; Mon, 27 Jan 2025 16:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878094.1288265; Mon, 27 Jan 2025 16:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSMF-0005pP-BI; Mon, 27 Jan 2025 16:53:07 +0000
Received: by outflank-mailman (input) for mailman id 878094;
 Mon, 27 Jan 2025 16:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8109=UT=linux.ibm.com=stefanb@srs-se1.protection.inumbo.net>)
 id 1tcSME-0005pJ-Kt
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 16:53:06 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cb02da4-dccf-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 17:53:05 +0100 (CET)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RFuupL017907;
 Mon, 27 Jan 2025 16:52:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44e0yybkpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 16:52:49 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50RGqmTQ018563;
 Mon, 27 Jan 2025 16:52:48 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44e0yybkps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 16:52:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50RGHWxC019445;
 Mon, 27 Jan 2025 16:52:47 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44db9mq59p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2025 16:52:47 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 50RGqkcI24248902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2025 16:52:47 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B962D5805C;
 Mon, 27 Jan 2025 16:52:46 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A96D5805D;
 Mon, 27 Jan 2025 16:52:43 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jan 2025 16:52:43 +0000 (GMT)
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
X-Inumbo-ID: 2cb02da4-dccf-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EpGiTx
	OESvwKogndESBTq4vX3ZF2JdGIo7rXHsC3nlc=; b=oyLO/kSgBZUMbLQuT+jemU
	QkjxHOXeJ5cwatS1zrDS89kRtVmsTCStqK0w+PK7tEH8IIAEMfZdGiTLSowWqrP2
	S+5AAGf0bQmPNHs+1nDhzO4oNGSZmLzuHssItO3pzE85LVWl8E1WYjBjAZn3Am+p
	O41ihD36wTt97sJ4i8HDnGEBL4tW2ZAvxByOKrkzUI/gheqPzpeMty+qkFErhF+m
	gkIp7OPcA1N7SEKIZoU0fiAeqEbAHLzCEAAzBTs294pDkfxLlVlloeg3GKxnReEj
	S/Vc9uWZRRBWsuxejQ7QbCP5mDG3dWm2l4shzLrtrhzxziskbvWMJZbHaV3mtuGw
	==
Message-ID: <bb2e0834-6423-4a82-8acd-ab387f2eda6b@linux.ibm.com>
Date: Mon, 27 Jan 2025 11:52:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] hw/tpm: Have TPM TIS sysbus device inherit from
 DYNAMIC_SYS_BUS_DEVICE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>,
        Anthony PERARD <anthony@xenproject.org>,
        Gustavo Romero <gustavo.romero@linaro.org>,
        Jason Wang
 <jasowang@redhat.com>, qemu-ppc@nongnu.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Bernhard Beschow <shentey@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org,
        Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Paul Durrant <paul@xen.org>,
        =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-9-philmd@linaro.org>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20250125181343.59151-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eDIefgyraSxWlHY4Qn6Zz-blAjgw2c7f
X-Proofpoint-ORIG-GUID: 4Iayg5JfcxV1D9ZLu3hYjCXEw3ZkMUOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_08,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270131



On 1/25/25 1:13 PM, Philippe Mathieu-Daudé wrote:
> Because the TPM TIS sysbus device can be optionally plugged on the
> TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   hw/tpm/tpm_tis_sysbus.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
> index ee0bfe9538e..4f187690a28 100644
> --- a/hw/tpm/tpm_tis_sysbus.c
> +++ b/hw/tpm/tpm_tis_sysbus.c
> @@ -133,7 +133,6 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
>       dc->vmsd  = &vmstate_tpm_tis_sysbus;
>       tc->model = TPM_MODEL_TPM_TIS;
>       dc->realize = tpm_tis_sysbus_realizefn;
> -    dc->user_creatable = true;
>       device_class_set_legacy_reset(dc, tpm_tis_sysbus_reset);
>       tc->request_completed = tpm_tis_sysbus_request_completed;
>       tc->get_version = tpm_tis_sysbus_get_tpm_version;
> @@ -142,7 +141,7 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
>   
>   static const TypeInfo tpm_tis_sysbus_info = {
>       .name = TYPE_TPM_TIS_SYSBUS,
> -    .parent = TYPE_SYS_BUS_DEVICE,
> +    .parent = TYPE_DYNAMIC_SYS_BUS_DEVICE,
>       .instance_size = sizeof(TPMStateSysBus),
>       .instance_init = tpm_tis_sysbus_initfn,
>       .class_init  = tpm_tis_sysbus_class_init,


