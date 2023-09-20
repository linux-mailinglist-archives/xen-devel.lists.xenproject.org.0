Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E76A7A8CAA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 21:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605940.943587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj2go-00064E-3m; Wed, 20 Sep 2023 19:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605940.943587; Wed, 20 Sep 2023 19:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj2go-00060q-0Y; Wed, 20 Sep 2023 19:16:46 +0000
Received: by outflank-mailman (input) for mailman id 605940;
 Wed, 20 Sep 2023 19:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wrp=FE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qj2gm-00060k-3b
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 19:16:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e59255-57ea-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 21:16:42 +0200 (CEST)
Received: from DM5PR07CA0107.namprd07.prod.outlook.com (2603:10b6:4:ae::36) by
 SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.31; Wed, 20 Sep 2023 19:16:36 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::49) by DM5PR07CA0107.outlook.office365.com
 (2603:10b6:4:ae::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Wed, 20 Sep 2023 19:16:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 20 Sep 2023 19:16:36 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 14:16:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 12:16:08 -0700
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 20 Sep 2023 14:16:07 -0500
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
X-Inumbo-ID: 39e59255-57ea-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqO80CXtnzygGBmGh3xihMP49EoFez6DuIHQnIz2avsNwcKaQSrUf0teTHoLVVgM3LPqh0M5GOXb3pLKQcDuQErx4eoO/k07juSqwpJOIQ2NL7SDk+jANDX15Fsd0PQYGp8i8YJ+4t+Ri59WTvuSnHFda8xB2+T4lvPS73rNFRb4VNEFDl2RtkfrvacMqUL5Vq8QKZj7EgcPUdAUcyRqEONRjxiIVOoKh3V+d5im3LI8l+0hT5ug3HCjsuVUPBZH9X52yv9cooEYaLsMfMfDfSRzEkTedrjIoUkJ0AsfrDc0n9Agc2NT/QgY4Lv5urO2rNJ9mlutWDSW7SGxVro2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ckBs+Zta/aFzOpiZrgS/9p0qOXINKLnaonKuVI205g=;
 b=bbAlNKxBylmObE+d0fHyvYO9c2VCVBJ6gmTJ9N0/kSTI4MXdTIU9wQTxU3/6igEyy89mo3Oi7a+sBtfopJ+ORGvm4n86KqIPRfCFJ/9RgHAhu6aWADsdIehCBin5L0WtbN9o5OR9kq24zcKmIKlW8XysFqOdujXgzDmR1LC2o8fO5w7wk0W15sklQGTZjSVl32HgUhuHY8mQu9LZWo15o2bCnJMAANGgFg8vFZwaILanc5BGLfyC1/wg/N5YQYmATWSMuEkeQA20NbCEXdIJW1rjABjxq61QCRKiDMXmIjPIF/7xYtAqD/in6yzYLSNQ6T0T0ptXuF46BNJ7QEpWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ckBs+Zta/aFzOpiZrgS/9p0qOXINKLnaonKuVI205g=;
 b=AZb05DPPRpllGoK4z7SuhM2Z/aNn7Q6tBaZcood36TeyIsGb4L28onZFcfThNeA6S85Wus+wOtTfNZ4BPLOynSPL7vikUq6CmaIaDuJrvt8GcOe8cpszbRDWmavgFxP1Xu8Pr0InYTGFvRasLILq+82eetFAWoQVoUPeQwqZA+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0ee1b11b-17d8-0d53-6836-2c09bc083fd2@amd.com>
Date: Wed, 20 Sep 2023 15:16:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SJ2PR12MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 417b1c75-b509-446e-dd87-08dbba0e1bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QE/if/tcqDbLgMQXCWLHfBA7Bwm22NDBsc2+Zbp9YlmDT/g573V7OH5KLz9Lh/N5QcQHTppUcz1DuYvYgCCGYpcYwdBorDHgzyc90Lrm6sm0PzqdPBaJkEP//jp1a2X6smNo4WJSnKsPjOvTwTIcqaW64NjhypksOPd91sTuJhtzokIIj5Rk1v0zN38mJNK2JllRjG5aqSHL8WSJaJAZlXLpKuzdWbxryWXwyki9bYWfhe/msoFfPciY60G0gCQSD2/CXBh8nSadrtP/lrGzotyBA4oJG0X6CbO1nShWoR8wRo39jlvGS4ZeVZm0g7Nx+/JJ2/lkOuG3AJpyMStDOqsUbgS2CM2jhbyqYZ4xt3zSeqbx5hDdO7qBzwbOB1mRpczHidNd6otUSigWhCKoTlEdm2IgysfxCqb7hVmfLpX3wAjsNDauC8nLetIQj6PYFmJMF67krj+QgfWOQzJsYZyhEdTMVhyaIwY7cRru/nRvjzY1EH20Jf9ALVE2hXmTgtPuuuboNioVRl5OSQOc+pzEX4hPX/Y84wDkpOoCXBAMVhgrPrQ3WNkDMq3F0B2XUkm6sCPC4lwncz+2M3bNxixKv+lxwVBvtE4Hy93b+edGaQos2TjCbZnkbNzj1Kn2iNXGVLTHipoS2HqrjJFcvECsvo67fwUr96aXf4/k9Q4uW0ekJEeqV5BKO85QI+Iun/E/pvJXVQ8cDrUGCbx3K+ioyKK7xX66yeKz5RCwobcZHMvWUOfRjsX/SE8ONBiEd1KkVKUmzvf+EM3UYJT19xJWjKyHipI8q5dzCnwRBbVBq7uqj8QmbaowBJ0n+vKl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(186009)(451199024)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(36756003)(16576012)(70206006)(54906003)(110136005)(70586007)(336012)(26005)(426003)(6666004)(83380400001)(2616005)(356005)(82740400003)(81166007)(86362001)(53546011)(40480700001)(36860700001)(47076005)(31696002)(316002)(40460700003)(478600001)(2906002)(7416002)(4326008)(31686004)(8676002)(41300700001)(8936002)(44832011)(5660300002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:16:36.0667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 417b1c75-b509-446e-dd87-08dbba0e1bc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927

On 9/19/23 11:39, Roger Pau Monné wrote:
> On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 1edc7f1e91..545a27796e 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -413,8 +413,6 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>>
>>      spin_unlock_irq(&desc->lock);
>>
>> -    ASSERT(pcidevs_locked());
>> -
> 
> Hm, this removal seems dubious, same with some of the removal below.
> And I don't see any comment in the log message as to why removing the
> asserts here and in __pci_enable_msi{,x}(), pci_prepare_msix() is
> safe.
> 

I suspect we may want:

    ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));

However, we don't have d. Using v->domain here is tricky because v may be NULL. How about passing struct domain *d as an arg to {hvm,vmx}_pi_update_irte()? Or ensuring that all callers pass a valid v?

>>      return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
>>
>>   unlock_out:
>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>> index d0bf63df1d..ba2963b7d2 100644
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -613,7 +613,7 @@ static int msi_capability_init(struct pci_dev *dev,
>>      u8 slot = PCI_SLOT(dev->devfn);
>>      u8 func = PCI_FUNC(dev->devfn);
>>
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
>>      pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
>>      if ( !pos )
>>          return -ENODEV;
>> @@ -783,7 +783,7 @@ static int msix_capability_init(struct pci_dev *dev,
>>      if ( !pos )
>>          return -ENODEV;
>>
>> -    ASSERT(pcidevs_locked());
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
>>
>>      control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
>>      /*
>> @@ -1000,7 +1000,6 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>>      struct pci_dev *pdev;
>>      struct msi_desc *old_desc;
>>
>> -    ASSERT(pcidevs_locked());
>>      pdev = pci_get_pdev(NULL, msi->sbdf);
>>      if ( !pdev )
>>          return -ENODEV;

I think we can move the ASSERT here, after we obtain the pdev. Then we can add the pdev->domain->pci_lock check into the mix:

    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));

>> @@ -1055,7 +1054,6 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
>>      struct pci_dev *pdev;
>>      struct msi_desc *old_desc;
>>
>> -    ASSERT(pcidevs_locked());
>>      pdev = pci_get_pdev(NULL, msi->sbdf);
>>      if ( !pdev || !pdev->msix )
>>          return -ENODEV;

Same here

>> @@ -1170,8 +1168,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>>   */
>>  int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>>  {
>> -    ASSERT(pcidevs_locked());
>> -

This removal inside pci_enable_msi() may be okay if both __pci_enable_msi() and __pci_enable_msix() have an appropriate ASSERT.

>>      if ( !use_msi )
>>          return -EPERM;
>>

Related: in xen/drivers/passthrough/pci.c:pci_get_pdev() I run into an ASSERT with a PVH dom0:

(XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:534
(XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
...
(XEN) Xen call trace:
(XEN)    [<ffff82d040285a3b>] R pci_get_pdev+0x4c/0xab
(XEN)    [<ffff82d04034742e>] F arch/x86/msi.c#__pci_enable_msi+0x1d/0xb4
(XEN)    [<ffff82d0403477b5>] F pci_enable_msi+0x20/0x28
(XEN)    [<ffff82d04034cfa4>] F map_domain_pirq+0x2b0/0x718
(XEN)    [<ffff82d04034e37c>] F allocate_and_map_msi_pirq+0xff/0x26b
(XEN)    [<ffff82d0402e088b>] F arch/x86/hvm/vmsi.c#vpci_msi_enable+0x53/0x9d
(XEN)    [<ffff82d0402e19d5>] F vpci_msi_arch_enable+0x36/0x6c
(XEN)    [<ffff82d04026f49d>] F drivers/vpci/msi.c#control_write+0x71/0x114
(XEN)    [<ffff82d04026d050>] F drivers/vpci/vpci.c#vpci_write_helper+0x6f/0x7c
(XEN)    [<ffff82d04026de39>] F vpci_write+0x249/0x2f9
...

With the patch applied, it's valid to call pci_get_pdev() with only d->pci_lock held, so the ASSERT in pci_get_pdev() needs to be reworked too. Inside pci_get_pdev(), d may be null, so we can't easily add || rw_is_locked(&d->pci_lock) into the ASSERT. Instead I propose something like the following, which resolves the observed assertion failure:

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 572643abe412..2b4ad804510c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -531,8 +531,6 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
 {
     struct pci_dev *pdev;

-    ASSERT(d || pcidevs_locked());
-
     /*
      * The hardware domain owns the majority of the devices in the system.
      * When there are multiple segments, traversing the per-segment list is
@@ -549,12 +547,18 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
         list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
             if ( pdev->sbdf.bdf == sbdf.bdf &&
                  (!d || pdev->domain == d) )
+            {
+                ASSERT(d || pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
                 return pdev;
+            }
     }
     else
         list_for_each_entry ( pdev, &d->pdev_list, domain_list )
             if ( pdev->sbdf.sbdf == sbdf.sbdf )
+            {
+                ASSERT(d || pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
                 return pdev;
+            }

     return NULL;
 }

