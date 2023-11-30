Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765F6800372
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 06:56:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645165.1007369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8wUz-0007rg-CS; Fri, 01 Dec 2023 05:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645165.1007369; Fri, 01 Dec 2023 05:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8wUz-0007os-8n; Fri, 01 Dec 2023 05:55:37 +0000
Received: by outflank-mailman (input) for mailman id 645165;
 Thu, 30 Nov 2023 21:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/tn=HL=linux.ibm.com=farman@srs-se1.protection.inumbo.net>)
 id 1r8ouU-0000iK-3Y
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 21:49:26 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 526a9500-8fca-11ee-98e5-6d05b1d4d9a1;
 Thu, 30 Nov 2023 22:49:23 +0100 (CET)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AULeDZS027517; Thu, 30 Nov 2023 21:48:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq28arjre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 21:48:52 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AULglYD002887;
 Thu, 30 Nov 2023 21:48:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq28arjr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 21:48:52 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUJhQMe029858; Thu, 30 Nov 2023 21:48:50 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrm0y2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 21:48:50 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AULmngv13828844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Nov 2023 21:48:49 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F13CE58052;
 Thu, 30 Nov 2023 21:48:48 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F86658050;
 Thu, 30 Nov 2023 21:48:41 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.61.95.112]) by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 30 Nov 2023 21:48:41 +0000 (GMT)
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
X-Inumbo-ID: 526a9500-8fca-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3Lkv/02q48e2jWfrLkO6fctRZOAuJaxGyH4fdQWyo74=;
 b=Z8j3SiJoFgCBPPyg5iDaUlsJsboZQYhHZhQ/LoTMST1r78wFU8m1R06sJ5BSv8lRVYRb
 zdzOM64m3u1M54Dt2eJDNnuNfvUHViaxPTuf1S8xZXZap7aL83BZ5TM2XEL3MuFSKQC5
 VD9ArDJVODobePvT62TaDdnHvZn0bIHtYeKF6DIwlezQf+qFTJ6VkL9dOQru1TqlEDOi
 Ia5rg6qPY/IBdVBfvOY1MEiWurDCD5G9wJkxyQ7XD12QqfiRmQeLCs1JcAfacuAlVlso
 eJNxsB8Obgz7MsFBJxjno31QAspoKCWlAtg/0r6dBBNXFkfiX6qx8MLNl4KtoeFnPTN3 yg== 
Message-ID: <05f53a0e5d65287fa9fdf03ca67e5cf186b8d858.camel@linux.ibm.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
From: Eric Farman <farman@linux.ibm.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
        Fabiano Rosas
 <farosas@suse.de>, qemu-s390x@nongnu.org,
        Song Gao <gaosong@loongson.cn>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Thomas Huth
 <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
        Marcelo Tosatti
 <mtosatti@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Andrey
 Smirnov <andrew.smirnov@gmail.com>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Kevin Wolf <kwolf@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Max Filippov
 <jcmvbkbc@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Paul
 Durrant <paul@xen.org>, Jagannathan Raman <jag.raman@oracle.com>,
        Juan
 Quintela <quintela@redhat.com>,
        "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
 <berrange@redhat.com>,
        qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>,
        =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>,
        BALATON Zoltan <balaton@eik.bme.hu>,
        Daniel
 Henrique Barboza <danielhb413@gmail.com>,
        Elena Ufimtseva
 <elena.ufimtseva@oracle.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Hailiang Zhang <zhanghailiang@xfusion.com>,
        Roman Bolshakov
 <rbolshakov@ddn.com>,
        Huacai Chen <chenhuacai@kernel.org>, Fam Zheng
 <fam@euphon.net>,
        Eric Blake <eblake@redhat.com>, Jiri Slaby
 <jslaby@suse.cz>,
        Alexander Graf <agraf@csgraf.de>,
        Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,
        Weiwei Li <liwei1518@gmail.com>, Stafford
 Horne <shorne@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Markus
 Armbruster <armbru@redhat.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        John Snow <jsnow@redhat.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Michael Roth <michael.roth@amd.com>,
        David Gibson
 <david@gibson.dropbear.id.au>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Bin Meng
 <bin.meng@windriver.com>,
        Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
        qemu-block@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>,
        Peter Xu <peterx@redhat.com>,
        Anthony Perard
 <anthony.perard@citrix.com>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Eduardo Habkost
 <eduardo@habkost.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
        =?ISO-8859-1?Q?C=E9dric?=
 Le Goater <clg@kaod.org>,
        qemu-ppc@nongnu.org,
        Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Akihiko Odaki <akihiko.odaki@daynix.com>,
        Leonardo Bras <leobras@redhat.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 30 Nov 2023 16:48:41 -0500
In-Reply-To: <20231129212625.1051502-2-stefanha@redhat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
	 <20231129212625.1051502-2-stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 425_reiecxV4wDHgNFADyvMsZGA6fbvk
X-Proofpoint-ORIG-GUID: L2MIErO798SVE0kwCrDtReSEksriyd8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_22,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 phishscore=0 clxscore=1011 impostorscore=0 mlxlogscore=827 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300160

On Wed, 2023-11-29 at 16:26 -0500, Stefan Hajnoczi wrote:
> The Big QEMU Lock (BQL) has many names and they are confusing. The
> actual QemuMutex variable is called qemu_global_mutex but it's
> commonly
> referred to as the BQL in discussions and some code comments. The
> locking APIs, however, are called qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread().
>=20
> The "iothread" name is historic and comes from when the main thread
> was
> split into into KVM vcpu threads and the "iothread" (now called the
> main
> loop thread). I have contributed to the confusion myself by
> introducing
> a separate --object iothread, a separate concept unrelated to the
> BQL.
>=20
> The "iothread" name is no longer appropriate for the BQL. Rename the
> locking APIs to:
> - void qemu_bql_lock(void)
> - void qemu_bql_unlock(void)
> - bool qemu_bql_locked(void)
>=20
> There are more APIs with "iothread" in their names. Subsequent
> patches
> will rename them. There are also comments and documentation that will
> be
> updated in later patches.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Eric Farman <farman@linux.ibm.com>

