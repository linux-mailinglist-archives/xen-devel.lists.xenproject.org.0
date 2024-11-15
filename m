Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD69CF887
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 22:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838418.1254422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC4DO-0001Tx-CN; Fri, 15 Nov 2024 21:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838418.1254422; Fri, 15 Nov 2024 21:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC4DO-0001S5-95; Fri, 15 Nov 2024 21:50:54 +0000
Received: by outflank-mailman (input) for mailman id 838418;
 Fri, 15 Nov 2024 21:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DylP=SK=quicinc.com=quic_jjohnson@srs-se1.protection.inumbo.net>)
 id 1tC44t-0001Lo-RJ
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 21:42:07 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73e346ee-a39a-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 22:42:05 +0100 (CET)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF9ZiSk002915;
 Fri, 15 Nov 2024 21:41:25 GMT
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42x3t9hss4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2024 21:41:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFLfNwS024141
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2024 21:41:23 GMT
Received: from [10.111.176.23] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 15 Nov
 2024 13:41:20 -0800
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
X-Inumbo-ID: 73e346ee-a39a-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwNS4yMjAuMTY4LjEzMSIsImhlbG8iOiJteDBhLTAwMzFkZjAxLnBwaG9zdGVkLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjczZTM0NmVlLWEzOWEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzA2OTI1LjY0Mzk1MSwic2VuZGVyIjoicXVpY19qam9obnNvbkBxdWljaW5jLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFhCA+NOYuk8bYXlsYuRwz8vDo6+kwMYACTSSoIzGGw=; b=W4A/Q+ovpyTMIbbC
	w26T8oqCxB9r85d4RPZa3xoW41U9P08tasWS2HjZmNxLpaZMCdFv4De8U/XKX5Ii
	IYkJQKbRx4TJT1R6RWAIOAzblwPFrJTsVeQxbxKt5riUTGA0w8UBwMCVbKDwIQ7g
	ISsGkWeC4L59nJ8h778Lvk5M5KO69ajgOUlmV45tFrqZ9KACxjzP5FKJrF5phUNk
	aUYstcB8qCqhT4tXQvyeXJH2o0NfIC4Lj+vL5uwKkItKv88Dh24rsZEt/oRxzZ85
	xxLIYdyHoTcBgqiu7oL6S1NEplQ2R7qnhAkPstvLz+c3IgBTmuIVftLZa5BkbSxD
	OJNvxw==
Message-ID: <3ac480f5-549b-4449-baa9-f766e074c409@quicinc.com>
Date: Fri, 15 Nov 2024 13:41:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
        Pablo Neira Ayuso
	<pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix
	<nicolas.palix@imag.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang
	<haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell
 King <linux@armlinux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle
	<svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
        Oded Gabbay
	<ogabbay@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo
 Vivi <rodrigo.vivi@intel.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand
	<shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        James Smart
	<james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>, Kalle Valo
	<kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jack
 Wang <jinpu.wang@cloud.ionos.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Xiubo Li
	<xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Josh Poimboeuf
	<jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes
	<mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
        Joe Lawrence
	<joe.lawrence@redhat.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King
	<linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner
	<christian.gmeiner@gmail.com>,
        Louis Peens <louis.peens@corigine.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao
	<naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
CC: <netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <cocci@inria.fr>, <linux-arm-kernel@lists.infradead.org>,
        <linux-s390@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <intel-xe@lists.freedesktop.org>, <linux-scsi@vger.kernel.org>,
        <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-mm@kvack.org>, <linux-bluetooth@vger.kernel.org>,
        <linux-staging@lists.linux.dev>,
        <linux-rpi-kernel@lists.infradead.org>, <ceph-devel@vger.kernel.org>,
        <live-patching@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <etnaviv@lists.freedesktop.org>, <oss-drivers@corigine.com>,
        <linuxppc-dev@lists.ozlabs.org>,
        Anna-Maria Behnsen
	<anna-maria@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S_kpc-fxOeYei4jGvmu7Zy3HQH9VEGzh
X-Proofpoint-ORIG-GUID: S_kpc-fxOeYei4jGvmu7Zy3HQH9VEGzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411150183

On 11/15/2024 1:29 PM, Easwar Hariharan wrote:
> On 11/15/2024 1:26 PM, Easwar Hariharan wrote:
>> This is a series that follows up on my previous series to introduce
>> secs_to_jiffies() and convert a few initial users.[1] In the review for
>> that series, Anna-Maria requested converting other users with
>> Coccinelle. This is part 1 that converts users of msecs_to_jiffies()
>> that use the multiply pattern of either of:
>> - msecs_to_jiffies(N*1000), or
>> - msecs_to_jiffies(N*MSEC_PER_SEC)
>>
>> The entire conversion is made with Coccinelle in the script added in
>> patch 2. Some changes suggested by Coccinelle have been deferred to
>> later parts that will address other possible variant patterns.
>>
>> CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>
>> [1] https://lore.kernel.org/all/20241030-open-coded-timeouts-v3-0-9ba123facf88@linux.microsoft.com/
>> [2] https://lore.kernel.org/all/8734kngfni.fsf@somnus/
>>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v1: https://lore.kernel.org/r/20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com
>>
> 
> Apologies, I missed out on editing the changelog here. v1 included a
> patch that's already been accepted, there are no other changes in v2.
> 
> Thanks,
> Easwar

How do you expect this series to land since it overlaps a large number of
maintainer trees? Do you have a maintainer who has volunteered to take the
series and the maintainers should just ack? Or do you want the maintainers to
take the individual patches that are applicable to them?

/jeff

