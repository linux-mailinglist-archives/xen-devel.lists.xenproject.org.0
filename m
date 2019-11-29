Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64410D2EC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 10:05:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iacAh-000244-Tz; Fri, 29 Nov 2019 09:02:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=572+=ZV=atos.net=marc.doz.external@srs-us1.protection.inumbo.net>)
 id 1iac76-0001NN-EP
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 08:58:56 +0000
X-Inumbo-ID: 7824f34a-1286-11ea-a3e0-12813bfff9fa
Received: from smtppost.atos.net (unknown [193.56.114.176])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7824f34a-1286-11ea-a3e0-12813bfff9fa;
 Fri, 29 Nov 2019 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atos.net; i=@atos.net; q=dns/txt; s=mail;
 t=1575017934; x=1606553934;
 h=from:to:subject:date:message-id:mime-version;
 bh=aP6wjTRvVnEUCMS3supgEVuyf8Y2vvUxUnMrNsyH9rE=;
 b=2c/bRDiDTaeyRXgEjK/A6+anWSIljekONXyQK++kEtn6+AHRogu1yisa
 U5YZF34bErWL3kwg5ewiHqkpbWOS8fZhBoJak+/wwL8vwR3szpSVC8iGb
 cBIFDZDQJbtE0F9hLs7+lkNwerdLFYZMupFtnpNXmbLbo4vFj+8R6A2Oj 8=;
IronPort-SDR: o3C3V0ULpcLktkTzXZGSWUjJoITjQ7QxBl9EoIZ7HHuQSqaYXSu4Bo4tCG8FjINleL9vNQFemb
 hJBURlOwMhPBA3it9vo3zpTTnZAgGGleWnMxC4A8+ay8tQWq0KhzXLSo1GvQBe6Qw8qaEawoNs
 czgNobUP+bgF1qcEDSZAwF9XzH0x6t+0rPcy73GF7DAJa/IRhHGM1CHrjzMOwEGCN4eUhDIj/K
 Pjqg7/lmgF5bz3l0J90Sa63DSkkVN8sczlRGfLPXMGgn7NT1IBuz37jyppIl8h3FZ1l2osXW5Q
 MVPbt5Xvx9cekcLOhzXxAJ/3
X-IronPort-AV: E=Sophos;i="5.69,256,1571695200"; d="scan'208,217";a="5926101"
X-MGA-submission: =?us-ascii?q?MDGjkJyGlv/e/SLoTAu8n5THaPwBx5dl1tSH1j?=
 =?us-ascii?q?/V5AO6RyuaarDEdXYc7DZZYzWh1oEEU2f4+bavzQYhdXTisCj/CyMwSI?=
 =?us-ascii?q?MAJLIJCNQpS9PsIJuvgmQh4R8GHxuE5Wlw5ADGlUXa10LyhumuA/PbcE?=
 =?us-ascii?q?y5?=
Received: from unknown (HELO DEERLM99ETXMSX.ww931.my-it-solutions.net)
 ([10.86.142.46])
 by smtppost.atos.net with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
 29 Nov 2019 09:58:53 +0100
Received: from DEERLM99ETSMSX.ww931.my-it-solutions.net (10.86.142.104) by
 DEERLM99ETXMSX.ww931.my-it-solutions.net (10.86.142.46) with Microsoft SMTP
 Server (TLS) id 14.3.468.0; Fri, 29 Nov 2019 09:58:52 +0100
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.104) with Microsoft SMTP
 Server (TLS) id 14.3.468.0; Fri, 29 Nov 2019 09:58:51 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T66hUMByZHEw7cJ3quwOwzlkSiI6NYtmEEs7HBCYvNpdxK680rgcMPu00YU3Oj6wP8NE15UXwM8PpBSKPYD/e+tm7gjZSCd+IxzVho+i6fg+apDET6A+VBok+YSGXtCzDktu6eE/itT1kyC4QG8eyDhOy3EHSE92UUh2sB9jM3WScqnhYFy3ziAVy//5YSUPAfeSLPmsf5/JpKKQ5M0CEK69Bv2q9khMnIMZKG7PseHuxqH1yTUqszacgu7kfHLDXLg0cFFUibge0+MruftFbwXAP1m6bfQQwqmPCtCLeNWPe2wPkvRkyonJBNF1G79GhdqPz9FiH7m4eFpNycXVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aP6wjTRvVnEUCMS3supgEVuyf8Y2vvUxUnMrNsyH9rE=;
 b=OrRS/Qocsj6Ko4PmVBOXaBfgY59ZttCB7iX4At9P9h4ulqhe3r/y+bx7nxuNDmhOgEtbhWJ9KVrT05RfCupNGSzkBZv86CEZOs8jAUVaJ6sRfI+gL+yrMROL20Lm5Ymg7hF5J+NVJ6URTFiLJFpqX7NfM4xdZzp4ui+X9hwzFUwiakZp8WR2Wj64KBDtmbFObCnkXUjIYSRqe3cV0UxtBjGJH2MbUYbTxs/gZ7CnHa0iBOV39nOq5I8KNmlHwykrn+KKfFoSAxtkt6t6NDyUymLinn2edOZS/0kXpJqcwzaafpiHadlbobYPQTNsOb1ZmbCTRC9+3UYlrhXpdxgRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from AM0PR02MB4385.eurprd02.prod.outlook.com (20.178.19.77) by
 AM0PR02MB3604.eurprd02.prod.outlook.com (52.134.80.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Fri, 29 Nov 2019 08:58:49 +0000
Received: from AM0PR02MB4385.eurprd02.prod.outlook.com
 ([fe80::51c2:4ab2:32c7:3981]) by AM0PR02MB4385.eurprd02.prod.outlook.com
 ([fe80::51c2:4ab2:32c7:3981%6]) with mapi id 15.20.2474.023; Fri, 29 Nov 2019
 08:58:49 +0000
From: "DOZ, MARC (ext)" <marc.doz.external@atos.net>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: bug suspcion and proposed modification when xen-pciback failed
 to map an irq (-19) to a domU
Thread-Index: AdWmkKtK1mIfCnPYTFqu2ZiOwgqUvw==
Date: Fri, 29 Nov 2019 08:58:49 +0000
Message-ID: <AM0PR02MB4385A7921A8F857539C71241D3460@AM0PR02MB4385.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marc.doz.external@atos.net; 
x-originating-ip: [217.115.65.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd3fc17a-a005-49c2-47eb-08d774aa59f9
x-ms-traffictypediagnostic: AM0PR02MB3604:
x-microsoft-antispam-prvs: <AM0PR02MB360480A5B6C6B801BDE64FBDD3460@AM0PR02MB3604.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(366004)(39860400002)(346002)(189003)(40764003)(199004)(99286004)(966005)(76116006)(14444005)(71200400001)(71190400001)(81166006)(81156014)(8676002)(8936002)(14454004)(7736002)(305945005)(256004)(5024004)(7696005)(74316002)(2501003)(478600001)(30864003)(66946007)(55236004)(316002)(66476007)(52536014)(26005)(66556008)(33656002)(5660300002)(6116002)(86362001)(3846002)(186003)(66446008)(64756008)(55016002)(5640700003)(6916009)(9686003)(66066001)(6306002)(2351001)(6506007)(6436002)(25786009)(2906002)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3604;
 H:AM0PR02MB4385.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Li4xqLM4Hz7/weMct84SXluv9HQbDphgCvSnrqiS9ognJfUH/Z0LMYMcxY/53wPJC2j5qRGS6kV/qa8lQIL4lkl5UNZuRre6RWcD65ph6cgD8nySyYODUacHuuO9+RBtCwZuAbcoHngfB59HHRuUtj6dnU3n5X6aPl+V5RrekAGpDvlZrFwoh7luaAUUBbo5m/MPHF2xFA32/+0jlZvJav48Hxwy4KwZdAL7uoSzZwvGzHq61GvggHpSHl4vdzmjvoP3j0c3JKKllfN/X+6scWkE159/KoQ2Uq6MqQJ9fKF4E+1W0FDYGpYyb+oWpdor0kIYPjqbXE/LcbhfKOGDKECGZm6gg2XVuFNfIjtwEmocVYhWg7Kj8oZruGIkXp7Qg2sJRc/lZqf0sP0pvaX0pd6Z/QmbgOly2KywW8SmzBMOmn68TCcsIoqmHiC+uPRc
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3fc17a-a005-49c2-47eb-08d774aa59f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 08:58:49.7658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: et0Cjm9hQMQYYXNHN5nV11Wj2jors1d5Mr4xMlUeZXe1Ja1NNfoOaEE4lUbWeTzs9kU2pJinYy7WFoyQVw6pvUGqWvAhBpYjgMWncfmCfn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3604
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Fri, 29 Nov 2019 09:02:38 +0000
Subject: [Xen-devel] bug suspcion and proposed modification when xen-pciback
 failed to map an irq (-19) to a domU
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1971571481967054354=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1971571481967054354==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_AM0PR02MB4385A7921A8F857539C71241D3460AM0PR02MB4385eurp_"

--_000_AM0PR02MB4385A7921A8F857539C71241D3460AM0PR02MB4385eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to paravirtualize several instances of a minimal Linux solutio=
n with xen. Guest OS have a PCI passthrough access on  the ethernet interfa=
ces.
I use a pvops kernel 4.4.122 , xen 4.11.2 and an x86 platform. My hardware =
platform doesn't support IOMMU but I doesn't need hard segmentation between=
 OS with this platform.

I got a bug when the Ethernet driver configures the MSI for a domU from a d=
omU.
pciback 0000:00:14.3: xen map irq failed -19 for 1 domain

Please find the bug description and maybe a solution :

1) dom1 is configured to use 0000:00:14.3
in file /etc/xen/dom1 :
 pci=3D['00:14.3,permissive=3D1,seize=3D1,msitranslate=3D1']
and kernel bootparam include "iommu=3Dsoft"

2) xen-pciback is loaded in dom0 :
> modprobe xen-pciback passthrough=3D1 hide=3D'(0000:00:14.3)'
> xl pci-assignable-list
 0000:00:14.3

(xen-pciback is not loaded in dom1)

3) Xen debug terminal print that all the PCI devices are linked to dom0 bef=
ore and after xen-pciback probing
 ...
 (XEN) 0000:00:14.3 - dom 0   - node -1  - MSIs < >
 ...

4) no error are detected when I start dom1
> xl create /etc/xen/dom1
or with
> xl pci-attach dom1 00:14.3

5) For each Ethernet device I see the following call to the hypervisor
 - xc_domain_iomem_permission
 - xc_domain_ioport_permission
 - xc_domain_iomem_permission
 - xc_physdev_map_pirq
 - xc_domain_irq_permission
 - xc_assign_device

none of them update the pdev->domain or the pdev->domain->domain_id of the =
pdev element linked with the bfd 0000:00:14.3 (devfn 163)

6) Xen debug terminal prints again that all the  PCI devices are linked to =
dom0
 ...
 (XEN) 0000:00:14.3 - dom 0   - node -1  - MSIs < >
 ...

I guess that this is normal because Dom0 will allow dom1 to configure the d=
evice (IRQ & DMA) thanks to xen-pciback. Could you confirm me this assertio=
n ?

7) When the Ethernet driver (igb) of dom1 configure MSI. xen failed to map =
MSI irqs because map_domain_pirq call pci_get_pdev_by_domain with domain_id=
 1 and the device is linked with domain_id 0
> modprobe igb
 igb: Copyright (c) 2007-2014 Intel Corporation.
 igb 0000:00:14.3: enabling device (0000 -> 0002)
 igb 0000:00:14.3: Xen PCI mapped GSI23 to IRQ25
 en_initdom_setup_msi_irqs:xen map irq map_irq.domid 3, map_irq.type 3  map=
_irq.index -1 , map_irq.pirq -1
 xen_initdom_setup_msi_irqs:xen map irq map_irq.bus 0, map_irq.devfn 163
 pciback 0000:00:14.3:   PCI_CAP_ID_MSIX
         pci_seg_supported

There,HYPERVISOR_physdev_op and  PHYSDEVOP_map_pirq  call map_domain_pirq :
 (XEN)          map_domain_pirq--> call pci_get_pdev_by_domain
 (XEN)          pci_get_pdev_by_domain-->
 (XEN)                          domain->domain_id 1
 (XEN)                          seg 0 bus 0 devfn 163
 ...

Unfortunately the device is already mapped to domain 0 and pci_get_pdev_by_=
domain don't found the device ... So map_domain_pirq & HYPERVISOR_physdev_o=
p return -19 :
 pciback 0000:00:14.3: xen map irq failed -19 for 2 domain

I don't find any hypervisor syscall able to assign my device to a domU. xc_=
assign_device is cancelled because iommu is disabled.
libxl_pci.c:1137:do_pci_add: Domain 3:do_pci_add --> call xc_assign_device =
 -> hypervisor call arch_do_domctl--> iommu_do_domctl--> CANCELLED

To solve my issue , I just need to replace in map_domain_pirq in xen/arch/x=
86/irq.c
 pdev =3D pci_get_pdev_by_domain(d, msi->seg, msi->bus, msi->devfn);
by
 pdev =3D pci_get_pdev(msi->seg, msi->bus, msi->devfn);

With this "fix" in Xen, dom1 can use the ethernet device and its MSI that I=
 see in /proc/interrupt

I use a customized cross-compilation of xen and xen-tools for a customized =
mininal linux solution thanks to buildroot. This solution has been built fr=
om scratch. So I'm not sure that all the xen components work perfectly. How=
ever, everything seem to work with my modifications (CPU, ethernet, memory,=
 disk, interrupt ...)

So is it really a bug ? or just a configuration error ? maybe a parameter h=
as been forgotten  in /etc/xen/domU ?

Thank you for your help


--_000_AM0PR02MB4385A7921A8F857539C71241D3460AM0PR02MB4385eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>Hello,</div>
<div><br>

I would like to paravirtualize several instances of a minimal Linux solutio=
n with xen. Guest OS have a PCI passthrough access on&nbsp; the ethernet in=
terfaces. </div>
<div>I use a pvops kernel 4.4.122 , xen 4.11.2 and an x86 platform. My hard=
ware platform doesn't support IOMMU but I doesn't need hard segmentation be=
tween OS with this platform.</div>
<div>&nbsp;</div>
<div>I got a bug when the Ethernet driver configures the MSI for a domU fro=
m a domU. </div>
<div>pciback 0000:00:14.3: xen map irq failed -19 for 1 domain</div>
<div>&nbsp;</div>
<div>Please find the bug description and maybe a solution :</div>
<div>&nbsp;</div>
<div>1) dom1 is configured to use 0000:00:14.3</div>
<div>in file /etc/xen/dom1 :</div>
<div> pci=3D['00:14.3,permissive=3D1,seize=3D1,msitranslate=3D1']</div>
<div>and kernel bootparam include &quot;iommu=3Dsoft&quot;</div>
<div>&nbsp;</div>
<div>2) xen-pciback is loaded in dom0 : </div>
<div>&gt; modprobe xen-pciback passthrough=3D1 hide=3D'(0000:00:14.3)'</div=
>
<div>&gt; xl pci-assignable-list</div>
<div> 0000:00:14.3</div>
<div>&nbsp;</div>
<div>(xen-pciback is not loaded in dom1)</div>
<div>&nbsp;</div>
<div>3) Xen debug terminal print that all the PCI devices are linked to dom=
0 before and after xen-pciback probing</div>
<div> ...</div>
<div> (XEN) 0000:00:14.3 - dom 0&nbsp;&nbsp; - node -1&nbsp; - MSIs &lt; &g=
t;</div>
<div> ...</div>
<div>&nbsp;</div>
<div>4) no error are detected when I start dom1</div>
<div>&gt; xl create /etc/xen/dom1</div>
<div>or with </div>
<div>&gt; xl pci-attach dom1 00:14.3</div>
<div>&nbsp;</div>
<div>5) For each Ethernet device I see the following call to the hypervisor=
</div>
<div> - xc_domain_iomem_permission</div>
<div> - xc_domain_ioport_permission</div>
<div> - xc_domain_iomem_permission</div>
<div> - xc_physdev_map_pirq</div>
<div> - xc_domain_irq_permission</div>
<div> - xc_assign_device</div>
<div>&nbsp;</div>
<div>none of them update the pdev-&gt;domain or the pdev-&gt;domain-&gt;dom=
ain_id of the pdev element linked with the bfd 0000:00:14.3 (devfn 163)</di=
v>
<div>&nbsp;</div>
<div>6) Xen debug terminal prints again that all the&nbsp; PCI devices are =
linked to dom0</div>
<div> ...</div>
<div> (XEN) 0000:00:14.3 - dom 0&nbsp;&nbsp; - node -1&nbsp; - MSIs &lt; &g=
t;</div>
<div> ...</div>
<div>&nbsp;</div>
<div>I guess that this is normal because Dom0 will allow dom1 to configure =
the device (IRQ &amp; DMA) thanks to xen-pciback. Could you confirm me this=
 assertion ?</div>
<div>&nbsp;</div>
<div>7) When the Ethernet driver (igb) of dom1 configure MSI. xen failed to=
 map MSI irqs because map_domain_pirq call pci_get_pdev_by_domain with doma=
in_id 1 and the device is linked with domain_id 0</div>
<div>&gt; modprobe igb</div>
<div> igb: Copyright (c) 2007-2014 Intel Corporation.</div>
<div> igb 0000:00:14.3: enabling device (0000 -&gt; 0002)</div>
<div> igb 0000:00:14.3: Xen PCI mapped GSI23 to IRQ25</div>
<div> en_initdom_setup_msi_irqs:xen map irq map_irq.domid 3, map_irq.type 3=
&nbsp; map_irq.index -1 , map_irq.pirq -1</div>
<div> xen_initdom_setup_msi_irqs:xen map irq map_irq.bus 0, map_irq.devfn 1=
63</div>
<div> pciback 0000:00:14.3:&nbsp;&nbsp;&nbsp; PCI_CAP_ID_MSIX</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  pci_seg_supported</div>
<div>&nbsp;</div>
<div>There,HYPERVISOR_physdev_op and&nbsp; PHYSDEVOP_map_pirq&nbsp; call ma=
p_domain_pirq :</div>
<div> (XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map=
_domain_pirq--&gt; call pci_get_pdev_by_domain</div>
<div> (XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci=
_get_pdev_by_domain--&gt;</div>
<div> (XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; domain-&gt;domain_id 1</div>
<div> (XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seg 0 bus 0 devfn 163</div>
<div> ...</div>
<div>&nbsp;</div>
<div>Unfortunately the device is already mapped to domain 0 and pci_get_pde=
v_by_domain don't found the device ... So map_domain_pirq &amp; HYPERVISOR_=
physdev_op return -19 :</div>
<div> pciback 0000:00:14.3: xen map irq failed -19 for 2 domain</div>
<div>&nbsp;</div>
<div>I don't find any hypervisor syscall able to assign my device to a domU=
. xc_assign_device is cancelled because iommu is disabled. </div>
<div>libxl_pci.c:1137:do_pci_add: Domain 3:do_pci_add --&gt; call xc_assign=
_device&nbsp; -&gt; hypervisor call arch_do_domctl--&gt; iommu_do_domctl--&=
gt; CANCELLED </div>
<div>&nbsp;</div>
<div>To solve my issue , I just need to replace in map_domain_pirq in xen/a=
rch/x86/irq.c</div>
<div> pdev =3D pci_get_pdev_by_domain(d, msi-&gt;seg, msi-&gt;bus, msi-&gt;=
devfn);</div>
<div>by</div>
<div> pdev =3D pci_get_pdev(msi-&gt;seg, msi-&gt;bus, msi-&gt;devfn);</div>
<div>&nbsp;</div>
<div>With this &quot;fix&quot; in Xen, dom1 can use the ethernet device and=
 its MSI that I see in /proc/interrupt</div>
<div>&nbsp;</div>
<div>I use a customized cross-compilation of xen and xen-tools for a custom=
ized mininal linux solution thanks to buildroot. This solution has been bui=
lt from scratch. So I'm not sure that all the xen components work perfectly=
. However, everything seem to work
with my modifications (CPU, ethernet, memory, disk, interrupt ...)</div>
<div>&nbsp;</div>
<div>So is it really a bug ? or just a configuration error ? maybe a parame=
ter has been forgotten&nbsp; in /etc/xen/domU ? </div>
<div>&nbsp;</div>
<div>Thank you for your help</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_AM0PR02MB4385A7921A8F857539C71241D3460AM0PR02MB4385eurp_--


--===============1971571481967054354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1971571481967054354==--

