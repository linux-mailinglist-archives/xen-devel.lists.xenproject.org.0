Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MVtIHR3w2ktrAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 06:49:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315AE31FF4F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 06:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260797.1554472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5H6r-0004ps-Qc; Wed, 25 Mar 2026 05:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260797.1554472; Wed, 25 Mar 2026 05:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5H6r-0004n0-Lh; Wed, 25 Mar 2026 05:48:53 +0000
Received: by outflank-mailman (input) for mailman id 1260797;
 Tue, 24 Mar 2026 12:59:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dengler@linux.ibm.com>) id 1w51Lu-000693-CL
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:59:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w51Lt-00D5Pu-Og
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:59:21 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dengler@linux.ibm.com>)
 id 69c28aa4-5cb7-0a2a0a5109dd-0a2a450aec56-32
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:59:21 +0100
Received: from [148.163.158.5] (helo=mx0b-001b2d01.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dengler@linux.ibm.com>)
 id 69c28aa8-1772-0a2a450a0019-94a39e051568-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:59:21 +0100
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62O9UV8t564224; Tue, 24 Mar 2026 12:59:01 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d1ky02vr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2026 12:59:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62OCedC1011824;
 Tue, 24 Mar 2026 12:58:59 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4d27vk1pae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2026 12:58:59 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 62OCwtnj51904902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2026 12:58:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8811920063;
 Tue, 24 Mar 2026 12:58:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD0782004E;
 Tue, 24 Mar 2026 12:58:54 +0000 (GMT)
Received: from [9.52.215.154] (unknown [9.52.215.154])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 24 Mar 2026 12:58:54 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=pp1 header.d=ibm.com header.i="@ibm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ej3Isx
	3J43WHcbqsXFspxuLWGfpG7XzaDk8RnET7IuY=; b=Su7gQstz3B6aM6PFBG8uQh
	x01IvkgpF4akIkC2Yv8b74FadNo9e27ekRxXsakT3p1TARe7CZAY29h53xxd8wz1
	F4kZz+lkiD78vGhCs+laxqnB5u9xFRGK/Tsh6twYP7thvfsNIeWAGdP1jRWjsBE2
	2NrTa+0v/b8PhcVeJOs61gs29vpCXXnXjqWi5QPV0rxXNiDc7IpzG9wKPCFU1dJu
	hyIdXPUJ8IHi1NA9903kpVA7KAIe5DifhKuhpq4v9lSgLr3r1ewpvKEptBjvZ2uB
	zO3ARjeDVnRRo3nNzvOHwsDydcL2Hd5OJrLdyn0FWx65JkOT58sm1iZ5/kZyz6iA
	==
Message-ID: <43139b81-2d3a-407b-9ddf-bd42aa70f780@linux.ibm.com>
Date: Tue, 24 Mar 2026 13:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] s390/ap: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        "K. Y. Srinivasan"
 <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Mark Brown
 <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux.dev, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-11-dakr@kernel.org>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260324005919.2408620-11-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMSBTYWx0ZWRfX6N1fBrtwZrfl
 aNao0Xhwv2iPArpXTciFzlHehJzd3FqyuyxByqEu+FLvzIew8kt3PjWdYdZtO7Ev/dzu1juD33i
 ULiVxPJi+Eu3Wm01+pD7w41oOcB6CO0eS2PR+DcOqwrlrsqbZgbqKoknbOSccN4kN1AdGDnpSh4
 giT9HWCMECWpapxDaYdMQ/IXQp+iHi2011iYdnklc4+iAjB4tA8YcsPMKFTESeLitzfCKx7CeYa
 F5bfAZ1prh5bHCsbzFtvW6c4E94vHNefJ4W5xyDv5bTOpwX5xpUV089SzGXBpTCh2Tn6j/1RJAy
 8JrNkM5IZMTuuFxodSI3N0ItWWwaPezBykvTmfdz5CNBYNkZhJ/G7w4qUg5Kyf1QOlPIUBtuFZ0
 TaNFvnH1pIhI71CTLphAPYyjG3E9oMOG+wVPVi77oKaFO89fYZRslVgre89UqkZSjDGRx3OB3Tc
 tkfYq5p7x6UpUVDBiYg==
X-Authority-Analysis: v=2.4 cv=JK42csKb c=1 sm=1 tr=0 ts=69c28a95 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=JtdtG7AWE7AhTqZWL1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: umcwOVG9OGh_DW7scW8FgcsJPpy_MgAT
X-Proofpoint-GUID: iDlj1Pn5DnrzHKXcEcJoAVIWEUdMu_KQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240101
X-purgate-ID: tlsNG-4011c0/1774357161-5389A900-E87E4E88/0/0
X-purgate-type: clean
X-purgate-size: 1500
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux
 -arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,armlinux.org.uk,linuxfoundation.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dengler@linux.ibm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FROM_NEQ_ENVFROM(0.00)[dengler@linux.ibm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: 315AE31FF4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 01:59, Danilo Krummrich wrote:
> When the AP masks are updated via apmask_store() or aqmask_store(),
> ap_bus_revise_bindings() is called after ap_attr_mutex has been
> released.
> 
> This calls __ap_revise_reserved(), which accesses the driver_override
> field without holding any lock, racing against a concurrent
> driver_override_store() that may free the old string, resulting in a
> potential UAF.
> 
> Fix this by using the driver-core driver_override infrastructure, which
> protects all accesses with an internal spinlock.
> 
> Note that unlike most other buses, the AP bus does not check
> driver_override in its match() callback; the override is checked in
> ap_device_probe() and __ap_revise_reserved() instead.
> 
> Also note that we do not enable the driver_override feature of struct
> bus_type, as AP - in contrast to most other buses - passes "" to
> sysfs_emit() when the driver_override pointer is NULL. Thus, printing
> "\n" instead of "(null)\n".
> 
> Additionally, AP has a custom counter that is modified in the
> corresponding custom driver_override_store().
> 
> Fixes: d38a87d7c064 ("s390/ap: Support driver_override for AP queue devices")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Tested-by: Holger Dengler <dengler@linux.ibm.com>
Reviewed-by: Holger Dengler <dengler@linux.ibm.com>

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


