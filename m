Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHGJB0cHxWnn5gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:15:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACB3331BC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 11:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263603.1555503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hk3-0001KE-NU; Thu, 26 Mar 2026 10:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263603.1555503; Thu, 26 Mar 2026 10:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5hk3-0001Hf-Kg; Thu, 26 Mar 2026 10:15:07 +0000
Received: by outflank-mailman (input) for mailman id 1263603;
 Thu, 26 Mar 2026 09:43:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vneethv@linux.ibm.com>) id 1w5hFt-0004rY-Op
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:43:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5hFt-0082OU-3H
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 10:43:57 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vneethv@linux.ibm.com>)
 id 69c4ffd0-2eae-0a2a0a5409dd-0a2a4504cef4-36
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 10:43:57 +0100
Received: from [148.163.156.1] (helo=mx0a-001b2d01.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <vneethv@linux.ibm.com>)
 id 69c4ffdb-c823-0a2a45040019-94a39c01cc36-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 10:43:56 +0100
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62Q59Wqg1479684; Thu, 26 Mar 2026 09:43:19 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d1kxqmkhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2026 09:43:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62Q70AQB026695;
 Thu, 26 Mar 2026 09:43:16 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4d275m292g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2026 09:43:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 62Q9hCts51970526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2026 09:43:12 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59BB320049;
 Thu, 26 Mar 2026 09:43:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3A6C20040;
 Thu, 26 Mar 2026 09:43:11 +0000 (GMT)
Received: from [9.52.196.90] (unknown [9.52.196.90])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 26 Mar 2026 09:43:11 +0000 (GMT)
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
	:message-id:mime-version:references:subject:to; s=pp1; bh=GQ61ku
	hdrfqFul0L2FFBXSHRCVEg6otwfwoaX1TK3/E=; b=avrMFIfOdugi4S/4hndTN+
	CLl/8HIMGz5Y/Oum5eOm3OxGCkgJK5eRyIT5itUmQlmpPCJa5rd7cEhD70kd89Vx
	sIkj70/bP26p1m99XZIqnezWszE2fOzkNLz1UKG/M+ZIpYxEchD1eZtuvPGMylcs
	oeHmw2eVFKJjsgFq0pWIzHhgjEoKzXSvm+Q3IfGfuYz/X6Rtw3ddqbg74qyboisW
	7VhJFSlPA/npMVSA1RxAqkj0qgcs/ITsZmLD/UBiIHDv6wpIicKFko9HHa1mxW7e
	FX0uQjKv616F5kTpsv6tLKCb9nFCwCPKBw3DJM+rLF0pILZ/li0SeQnt8POSnByw
	==
Message-ID: <e232e227-b022-40b7-ae9b-085398172aaa@linux.ibm.com>
Date: Thu, 26 Mar 2026 10:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] s390/cio: use generic driver_override
 infrastructure
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
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Holger Dengler <dengler@linux.ibm.com>,
        Mark Brown <broonie@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux.dev, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
        Gui-Dong Han <hanguidong02@gmail.com>
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-10-dakr@kernel.org>
Content-Language: en-US
From: Vineeth Vijayan <vneethv@linux.ibm.com>
In-Reply-To: <20260324005919.2408620-10-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: lM9ihgFyzDaKKK4hT6xbAWnBu4HPvbko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NyBTYWx0ZWRfX2in2v/sm6fVn
 1EOEfnIWW9XHJhqTtN1dackcJvrGoIn6RYtzj2jaFpMYQNlaN3XxkuZ6dzpRGfvaZaU5moxAo8x
 trr+PwJfEqlepekJSKPo1fy9d5o6sgA5m683HkjOswpiKaLB0x2ZC2oGeSCAtUXbWtftJWxMU93
 r9db17SA3IR04n61jqkqo5Bm6YDmBdYR4V4J415d1oOQfmhBzzcsrs5XSBy2lSc6eI3Yyn+zNJA
 fVQxRgkOI9yEBwUOLE+1Bp0urJ3SQpsL6Mxqh1jqv0YqiavIDSQ9i78PTJ+7C/RudgHS8T2aNad
 w9soTfL5Lep9UESaYSAmOjYsSO5EEkxvuZXANkgGYCQiRzjVScD+Gyn69Rf+vvAYsxJQFXrQuWu
 UQoghhH9HNEe1gD65ozDrx3Bl3HFNi5z9FxZxdctIbC0r4+GoaXzUaZ2fC0g/Uri9kPCKMvcMLh
 7P5IIMyCHlQF+nN31cA==
X-Authority-Analysis: v=2.4 cv=bLEb4f+Z c=1 sm=1 tr=0 ts=69c4ffb7 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=rH2cy8X4UbemT2jZliAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sWD6kkjX1ahK5tMWR5AN0EWZ8NVBfHg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260067
X-purgate-ID: tlsNG-ebf023/1774518236-BB8979D1-322EEF9E/0/0
X-purgate-type: clean
X-purgate-size: 897
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux
 -arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,armlinux.org.uk,linuxfoundation.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com];
	FORGED_SENDER(0.00)[vneethv@linux.ibm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	FROM_NEQ_ENVFROM(0.00)[vneethv@linux.ibm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 71ACB3331BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 01:59, Danilo Krummrich wrote:
> When a driver is probed through __driver_attach(), the bus' match()
> callback is called without the device lock held, thus accessing the
> driver_override field without a lock, which can cause a UAF.
> 
> Fix this by using the driver-core driver_override infrastructure taking
> care of proper locking internally.
> 
> Note that calling match() from __driver_attach() without the device lock
> held is intentional. [1]
> 
> Link:https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
> Reported-by: Gui-Dong Han<hanguidong02@gmail.com>
> Closes:https://bugzilla.kernel.org/show_bug.cgi?id=220789
> Fixes: ebc3d1791503 ("s390/cio: introduce driver_override on the css bus")
> Signed-off-by: Danilo Krummrich<dakr@kernel.org>
> ---

Thank you Danilo.

Reviewed-by: Vineeth Vijayan <vneethv@linux.ibm.com>

