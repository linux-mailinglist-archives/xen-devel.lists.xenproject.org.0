Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B627D4F03
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 13:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621856.968711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvFi4-0005DB-Ae; Tue, 24 Oct 2023 11:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621856.968711; Tue, 24 Oct 2023 11:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvFi4-0005Ae-7D; Tue, 24 Oct 2023 11:36:32 +0000
Received: by outflank-mailman (input) for mailman id 621856;
 Tue, 24 Oct 2023 11:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDe1=GG=quicinc.com=quic_llindhol@srs-se1.protection.inumbo.net>)
 id 1qvFeH-0004Nm-Js
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 11:32:37 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06e94ad9-7261-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 13:32:35 +0200 (CEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OBW2x9030510; Tue, 24 Oct 2023 11:32:26 GMT
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tx4tv0vqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 11:32:26 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OBWP59014241
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 11:32:25 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 24 Oct 2023 04:32:11 -0700
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
X-Inumbo-ID: 06e94ad9-7261-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=SDdDuTaN4SoAWEpM2HKbvwWC/AnVWG6bKPnln/BNFPM=;
 b=Nbu7HyH4d39Kp0iB+z//t5OAGEFCvePvI+VCVMlCc+A7pp3g8W6L2lEyt7AwENfe6nHN
 BrYi2YgU5WbLlrm6dE8GwNVxLUxPgxkTC7gWf3vqjhSe210N6jeS+HZjP5aN9yKaMW+0
 gE7Els2Ns4ZmsjMkSSrnufM4WwKkLJlV1QSsCJuYhmoMNj4MbZNivxoc4gFAB9nVe/RY
 /mgRqddLohVGW71+h2kfx/u2OWkX3hK3IyGkqFd8guImMqyUoOGknoNDjFSKRrtaN84p
 j3u7VrYEz5a6kTH7TL3iJQlF8qKQqVWyxADB7qLLYF6pAU1a3icvvfco/5ptP25ft3eO Rg== 
Date: Tue, 24 Oct 2023 12:32:08 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
        Beniamino Galvani <b.galvani@gmail.com>,
        Peter Maydell
	<peter.maydell@linaro.org>,
        Strahinja Jankovic
	<strahinja.p.jankovic@gmail.com>,
        Niek Linnenbank <nieklinnenbank@gmail.com>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        Andrew Jeffery
	<andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        Igor Mitsyanko
	<i.mitsyanko@gmail.com>,
        Jean-Christophe Dubois <jcd@tribudubois.net>,
        Andrey
 Smirnov <andrew.smirnov@gmail.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Subbaraya Sundeep
	<sundeep.lkml@gmail.com>,
        Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting
	<kfting@nuvoton.com>,
        Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki
	<rad@semihalf.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Alistair Francis
	<alistair@alistair23.me>,
        Helge Deller <deller@gmx.de>, Paolo Bonzini
	<pbonzini@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>,
        "Michael S.
 Tsirkin" <mst@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
        Laurent
 Vivier <laurent@vivier.eu>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang
	<jiaxun.yang@flygoat.com>,
        =?iso-8859-1?Q?Herv=E9?= Poussineau
	<hpoussin@reactos.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jason Wang <jasowang@redhat.com>, Jia
 Liu <proljc@gmail.com>,
        Stafford Horne <shorne@gmail.com>,
        Mark Cave-Ayland
	<mark.cave-ayland@ilande.co.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Daniel
 Henrique Barboza <danielhb413@gmail.com>,
        David Gibson
	<david@gibson.dropbear.id.au>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
        Weiwei Li <liweiwei@iscas.ac.cn>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        David Hildenbrand <david@redhat.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger
	<borntraeger@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Yoshinori
 Sato <ysato@users.sourceforge.jp>,
        Magnus Damm <magnus.damm@gmail.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul
 Durrant <paul@xen.org>, Max Filippov <jcmvbkbc@gmail.com>,
        <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-riscv@nongnu.org>,
        <qemu-s390x@nongnu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 08/45] hw/arm/sbsa-ref: use pci_init_nic_devices()
Message-ID: <ZTerOM9bc5B8v/cc@qc-i7.hemma.eciton.net>
References: <20231022155200.436340-1-dwmw2@infradead.org>
 <20231022155200.436340-9-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231022155200.436340-9-dwmw2@infradead.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6lyweH_CTZsJksaiA7mOerkNhl-G0ehZ
X-Proofpoint-ORIG-GUID: 6lyweH_CTZsJksaiA7mOerkNhl-G0ehZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_11,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 spamscore=0 priorityscore=1501 mlxlogscore=713 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240097

On Sun, Oct 22, 2023 at 16:51:23 +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

> ---
>  hw/arm/sbsa-ref.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 3c7dfcd6dc..582a28ce92 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -691,9 +691,7 @@ static void create_pcie(SBSAMachineState *sms)
>  
>      pci = PCI_HOST_BRIDGE(dev);
>      if (pci->bus) {
> -        for (i = 0; i < nb_nics; i++) {
> -            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
> -        }
> +        pci_init_nic_devices(pci->bus, mc->default_nic);
>      }
>  
>      pci_create_simple(pci->bus, -1, "bochs-display");
> -- 
> 2.40.1
> 

