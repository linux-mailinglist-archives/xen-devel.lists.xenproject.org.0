Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F37F5162
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 21:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639148.996129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tef-0008N3-GF; Wed, 22 Nov 2023 20:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639148.996129; Wed, 22 Nov 2023 20:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tef-0008LO-DO; Wed, 22 Nov 2023 20:17:01 +0000
Received: by outflank-mailman (input) for mailman id 639148;
 Wed, 22 Nov 2023 20:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF1Q=HD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r5ted-0008L7-9j
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 20:16:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e89::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14425af2-8974-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 21:16:56 +0100 (CET)
Received: from DM6PR08CA0037.namprd08.prod.outlook.com (2603:10b6:5:1e0::11)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 20:16:51 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::ef) by DM6PR08CA0037.outlook.office365.com
 (2603:10b6:5:1e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 20:16:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 20:16:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 14:16:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 22 Nov
 2023 12:16:31 -0800
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 22 Nov 2023 14:16:30 -0600
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
X-Inumbo-ID: 14425af2-8974-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxyp7lRYM/KubtxE7jnHCiILCVe75GCeSHpaXooBbMKYN34a9oVxvsHcx/vMqP8mPcz28dxBjeRwCnRiKfQu73k6SS/21G9EEoHutpj+8mjKyawOWBykJVgv+FPjKIuVdAEUMI/qo0iTy7qIe5SmYEUFblP5V5rBraqDewfzV6RI6koCSylpZAhQPLncEfzPsmnt9r1cmvWd/tOaNat5tpLjLO2d4VYjakO1aYNycWzzYy+QZwMMSO+9nr6TyrC9y+qdbud6JHckL5d6YRN5ScICK5D/EYcPGLxdBMcJz5LB7yRgRsXq4NOBmWwt9xubZLK89qfmWz6Y62ZZN9dRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwLj5iaY+kpPnGMvF56MlxZ08zsJdWZ/yt+YAtwIdE8=;
 b=ib6uFo2ZWYyCXJ3wDTVhVpVbAh3DCQgjOLu02EvRjStnTpc79/s0qtPlbWTR1QWklfiRQ8exThVzXKmzX6wjzAsixBQ3siAS35IeZXPPZOJ3DLTdFtG9Fj/ONXFgqzrTw0jdWn1ebpasipGaV+nea2EHo1iqhhudn4cYRAQT70Xev/cVnfnZI504JI7ZW6M44pzFa0oOg8Myzcr8FvJCO0+dXJbtApsFCDUysXwlKKcqtCajn9VOG2H5P+TnHEnErgO0G84kl0G6fWPPAZAR15YqhdWYZWrTMeEWsb7/pcbKZ95dCfoyz0F6DIcdcbefzXSfAVuIr2al0g631CFVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwLj5iaY+kpPnGMvF56MlxZ08zsJdWZ/yt+YAtwIdE8=;
 b=j8R5ywSsPA+5OJhDlmvC38P8STlvp69rKNqFOK0wS/OAPi5tbT3boJlVVeWet7TxSYNbwDjheX4+iKBxDriPEObA/k2g+JM3kJD8HMZfq0qQh815ZFbuYEUKqC4ydJO9mSJAV+ydt1SWiibz1QB6fl1CG8RsMrLI9bFqqw+BNgg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a28239cd-e94e-4e0e-b415-a7ae32befd40@amd.com>
Date: Wed, 22 Nov 2023 15:16:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVdfRQpGFSU1OIkh@macbook.local>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZVdfRQpGFSU1OIkh@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: 87298c5e-94b1-4cec-c36e-08dbeb97f693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jcN/nCkwqoTMXDTMMKTqqsr968GX2N5vRQcuEeefcc7LAaWLH1xGmnpK+VxFi6cN3oRGq/d4arxZCNW1fgAzG7SfkT3kXllJlzDph0WRix5GDOCvhHFOsQ5Sd/ZYO6PUIi6ekFOgmCcwyO+LdGx9q3FhFNrulIa8XGEyFBMv/dRK3tOT+p+7qgxbEECZNas+3pKFdApk3d9Sula4/CAlqQrcbqWZkI+Om2+VXU8F20POlKcsePBWDropYUoPLnOHdSLaqyWVqBatqjQ//e/z9r2ah5EP/s8btPk0Etdmv4gPwnc9IYopaX/Ii1SKF9+oi5MqX3alYGH5um6etTNR3Z63aNB1apZkWmiODsedxvicv4u9VBSzd5Hqvr9jVRIY90S8tXSMBnxwnMRyiQEFEBth5UL7hObvXrefB5eVJn2MNc36Y4TlgaZmJHHpl2RW/kGC/G+JEV8yM/a5HpBt9MVzpd3Ob2kLtT5Sc6vD3bkqnBa6MEOwcUjcZY5U3wRxYcU+WatSMnLcgg5v8johy1p36/vjKoRT+GGw9ljGahKgLXQFbYbKCwooXES1MwJg9/nigMfSA3jeLaz/q7RX6L76jleZcT93SoCQ53ahwJ10e72AqB1GqThJkSmAJJvMozxGxfFbzndadLe5hobxZRxrzi8rjktzNDuDpJ/DCkjp8puBninZC6H5GIP/0ZAYi7+OKnhim4IDHtelzYSAJkDvC92U8PY2U19DC5p3jtJH1KfRg2BmMKQTLBHMaXXPnyHrKSO6XXJqy2W33Q+SjkRVPYbQENDj4jd0CkkvqC7nvDzY+zoDVL65ZVCmueEg
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(82310400011)(451199024)(186009)(64100799003)(46966006)(36840700001)(40470700004)(83380400001)(2616005)(53546011)(40480700001)(26005)(82740400003)(336012)(426003)(478600001)(966005)(31686004)(47076005)(81166007)(356005)(36860700001)(70206006)(8676002)(316002)(8936002)(4326008)(30864003)(44832011)(31696002)(6916009)(16576012)(54906003)(86362001)(5660300002)(66899024)(2906002)(70586007)(41300700001)(40460700003)(36756003)(36900700001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 20:16:51.0181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87298c5e-94b1-4cec-c36e-08dbeb97f693
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001

On 11/17/23 07:40, Roger Pau Monné wrote:
> On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
>> Introduce a handler for the PCI status register, with ability to mask the
>> capabilities bit. The status register contains RsvdZ bits, read-only bits, and
>> write-1-to-clear bits, so introduce bitmasks to handle these in vPCI. If a bit
>> in the bitmask is set, then the special meaning applies:
>>
>>   rsvdz_mask: read as zero, guest write ignore (write zero to hardware)
>>   ro_mask: read normal, guest write ignore (preserve on write to hardware)
>>   rw1c_mask: read normal, write 1 to clear
>>
>> The RsvdZ naming was borrowed from the PCI Express Base 4.0 specification.
>>
>> Xen preserves the value of read-only bits on write to hardware, discarding the
>> guests write value.
>>
>> The mask_cap_list flag will be set in a follow-on patch.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> v6->v7:
>> * re-work args passed to vpci_add_register_mask() (called in init_bars())
>> * also check for overlap of (rsvdz_mask & ro_mask) in add_register()
>> * slightly adjust masking operation in vpci_write_helper()
>>
>> v5->v6:
>> * remove duplicate PCI_STATUS_CAP_LIST in constant definition
>> * style fixup in constant definitions
>> * s/res_mask/rsvdz_mask/
>> * combine a new masking operation into single line
>> * preserve r/o bits on write
>> * get rid of status_read. Instead, use rsvdz_mask for conditionally masking
>>   PCI_STATUS_CAP_LIST bit
>> * add comment about PCI_STATUS_CAP_LIST and rsvdp behavior
>> * add sanity checks in add_register
>> * move mask_cap_list from struct vpci_header to local variable
>>
>> v4->v5:
>> * add support for res_mask
>> * add support for ro_mask (squash ro_mask patch)
>> * add constants for reserved, read-only, and rw1c masks
>>
>> v3->v4:
>> * move mask_cap_list setting to the capabilities patch
>> * single pci_conf_read16 in status_read
>> * align mask_cap_list bitfield in struct vpci_header
>> * change to rw1c bit mask instead of treating whole register as rw1c
>> * drop subsystem prefix on renamed add_register function
>>
>> v2->v3:
>> * new patch
>> ---
>>  xen/drivers/vpci/header.c  | 16 +++++++++++
>>  xen/drivers/vpci/vpci.c    | 55 +++++++++++++++++++++++++++++---------
>>  xen/include/xen/pci_regs.h |  9 +++++++
>>  xen/include/xen/vpci.h     |  8 ++++++
>>  4 files changed, 76 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 767c1ba718d7..af267b75ac31 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -521,6 +521,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      struct vpci_header *header = &pdev->vpci->header;
>>      struct vpci_bar *bars = header->bars;
>>      int rc;
>> +    bool mask_cap_list = false;
>>  
>>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>>      {
>> @@ -544,6 +545,21 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>  
>> +    /*
>> +     * Utilize rsvdz_mask to hide PCI_STATUS_CAP_LIST from the guest for now. If
>> +     * support for rsvdp (reserved & preserved) is added in the future, the
>> +     * rsvdp mask should be used instead.
>> +     */
>> +    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
>> +                                PCI_STATUS, 2, NULL,
>> +                                PCI_STATUS_RSVDZ_MASK |
>> +                                    (mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
>> +                                PCI_STATUS_RO_MASK &
>> +                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
>> +                                PCI_STATUS_RW1C_MASK);
>> +    if ( rc )
>> +        return rc;
>> +
>>      if ( pdev->ignore_bars )
>>          return 0;
>>  
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 3bec9a4153da..b4cde7db1b3f 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -29,6 +29,9 @@ struct vpci_register {
>>      unsigned int offset;
>>      void *private;
>>      struct list_head node;
>> +    uint32_t rsvdz_mask;
>> +    uint32_t ro_mask;
>> +    uint32_t rw1c_mask;
> 
> I understand that we need the rw1c_mask in order to properly merge
> values when doing partial writes, but the other fields I'm not sure we
> do need them.  RO bits don't care about what's written to them, and
> RsvdZ are always read as 0 and written as 0, so the mask shouldn't
> affect the merging.

See discussions at [1] and [2]. I'll keep ro_mask/rsvdz_mask, add rsvdp_mask, and expand the commit message. For another data point, qemu (hw/xen/xen_pt_config_init.c:xen_pt_emu_reg_header0) also has a similar way of masking bits.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01398.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01693.html

> 
>>  };
>>  
>>  #ifdef __XEN__
>> @@ -145,9 +148,16 @@ uint32_t cf_check vpci_hw_read32(
>>      return pci_conf_read32(pdev->sbdf, reg);
>>  }
>>  
>> -int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>> -                      vpci_write_t *write_handler, unsigned int offset,
>> -                      unsigned int size, void *data)
>> +void cf_check vpci_hw_write16(
>> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>> +{
>> +    pci_conf_write16(pdev->sbdf, reg, val);
>> +}
>> +
>> +static int add_register(struct vpci *vpci, vpci_read_t *read_handler,
>> +                        vpci_write_t *write_handler, unsigned int offset,
>> +                        unsigned int size, void *data, uint32_t rsvdz_mask,
>> +                        uint32_t ro_mask, uint32_t rw1c_mask)
>>  {
>>      struct list_head *prev;
>>      struct vpci_register *r;
>> @@ -155,7 +165,8 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      /* Some sanity checks. */
>>      if ( (size != 1 && size != 2 && size != 4) ||
>>           offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
>> -         (!read_handler && !write_handler) )
>> +         (!read_handler && !write_handler) || (rsvdz_mask & ro_mask) ||
>> +         (rsvdz_mask & rw1c_mask) || (ro_mask & rw1c_mask) )
>>          return -EINVAL;
>>  
>>      r = xmalloc(struct vpci_register);
>> @@ -167,6 +178,9 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      r->size = size;
>>      r->offset = offset;
>>      r->private = data;
>> +    r->rsvdz_mask = rsvdz_mask & (0xffffffffU >> (32 - 8 * size));
>> +    r->ro_mask = ro_mask & (0xffffffffU >> (32 - 8 * size));
>> +    r->rw1c_mask = rw1c_mask & (0xffffffffU >> (32 - 8 * size));
>>  
>>      spin_lock(&vpci->lock);
>>  
>> @@ -193,6 +207,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      return 0;
>>  }
>>  
>> +int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>> +                      vpci_write_t *write_handler, unsigned int offset,
>> +                      unsigned int size, void *data)
>> +{
>> +    return add_register(vpci, read_handler, write_handler, offset, size, data,
>> +                        0, 0, 0);
>> +}
>> +
>> +int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
>> +                           vpci_write_t *write_handler, unsigned int offset,
>> +                           unsigned int size, void *data, uint32_t rsvdz_mask,
>> +                           uint32_t ro_mask, uint32_t rw1c_mask)
>> +{
>> +    return add_register(vpci, read_handler, write_handler, offset, size, data,
>> +                        rsvdz_mask, ro_mask, rw1c_mask);
>> +}
>> +
>>  int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>>                           unsigned int size)
>>  {
>> @@ -376,6 +407,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>          }
>>  
>>          val = r->read(pdev, r->offset, r->private);
>> +        val &= ~r->rsvdz_mask;
>>  
>>          /* Check if the read is in the middle of a register. */
>>          if ( r->offset < emu.offset )
>> @@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>  
>>  /*
>>   * Perform a maybe partial write to a register.
>> - *
>> - * Note that this will only work for simple registers, if Xen needs to
>> - * trap accesses to rw1c registers (like the status PCI header register)
>> - * the logic in vpci_write will have to be expanded in order to correctly
>> - * deal with them.
>>   */
>>  static void vpci_write_helper(const struct pci_dev *pdev,
>>                                const struct vpci_register *r, unsigned int size,
>>                                unsigned int offset, uint32_t data)
>>  {
>> +    uint32_t val = 0;
>> +
>>      ASSERT(size <= r->size);
>>  
>> -    if ( size != r->size )
>> +    if ( (size != r->size) || r->ro_mask )
> 
> Hm, I'm not sure this specific handling for read-only bits is
> required, software is allowed to write either 0 or 1 to read-only
> bits, but the write will be ignored.

See [1].

> 
>>      {
>> -        uint32_t val;
>> -
>>          val = r->read(pdev, r->offset, r->private);
>> +        val &= ~r->rw1c_mask;
>>          data = merge_result(val, data, size, offset);
>>      }
>>  
>> +    data &= ~(r->rsvdz_mask | r->ro_mask);
>> +    data |= val & r->ro_mask;
> 
> You cannot apply the register masks directly into the final value, you
> need to offset and mask them as necessary, likewise for val, see
> what's done in merge_result().

See [3].

[3] https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01412.html

> 
> Regardless of the offset issue, I think the usage of val with the
> ro_mask is bogus here, see above.

See [1].

> 
>> +
>>      r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
>>               r->private);
>>  }
>> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
>> index 84b18736a85d..b72131729db6 100644
>> --- a/xen/include/xen/pci_regs.h
>> +++ b/xen/include/xen/pci_regs.h
>> @@ -66,6 +66,15 @@
>>  #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
>>  #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
>>  #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
>> +#define  PCI_STATUS_RSVDZ_MASK		0x0006
> 
> In my copy of the PCIe 6 spec bit 6 is also RsvdZ, so the mask should
> be 0x46.

Right, mine too. It's probably safer to follow the newer version of the spec, so I'll make the change. For completeness / archaeology purposes, I just want to document some relevant data points here.

In PCIe 4 spec, it says this about bit 6:
"These bits were used in previous versions of the programming model. Careful consideration should be given to any attempt to repurpose them."

Going further back, PCI (old school PCI, not Express) spec 3.0 says this about bit 6:
"This bit is reserved. *"
"* In Revision 2.1 of this specification, this bit was used to indicate whether or not a device supported User Definable Features."

Just above in our pci_regs.h (and equally in Linux include/uapi/linux/pci_regs.h) we have this definition for bit 6:
#define  PCI_STATUS_UDF         0x40    /* Support User Definable Features [obsolete] */

Qemu hw/xen/xen_pt_config_init.c treats bit 6 as RO:
        .ro_mask    = 0x06F8,

> 
> But I'm unsure we really need this mask.
> 
> Thanks, Roger.

