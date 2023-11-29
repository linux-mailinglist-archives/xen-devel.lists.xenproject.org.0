Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AF67FDB04
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643987.1004551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ML1-0008Q9-Kd; Wed, 29 Nov 2023 15:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643987.1004551; Wed, 29 Nov 2023 15:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ML1-0008O5-HT; Wed, 29 Nov 2023 15:18:55 +0000
Received: by outflank-mailman (input) for mailman id 643987;
 Wed, 29 Nov 2023 15:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uyrv=HK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r8MKz-0008Nz-6O
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:18:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99156709-8eca-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 16:18:51 +0100 (CET)
Received: from DM6PR08CA0018.namprd08.prod.outlook.com (2603:10b6:5:80::31) by
 PH7PR12MB7233.namprd12.prod.outlook.com (2603:10b6:510:204::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 15:18:44 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:5:80:cafe::42) by DM6PR08CA0018.outlook.office365.com
 (2603:10b6:5:80::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23 via Frontend
 Transport; Wed, 29 Nov 2023 15:18:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 15:18:44 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 09:18:43 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 29 Nov
 2023 07:18:43 -0800
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 29 Nov 2023 09:18:42 -0600
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
X-Inumbo-ID: 99156709-8eca-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3qgOteLwBj+fBYkiEmJ5ck8+Sjd1vMOLPoxtmDhdd6+CGnTJjeQFChVdwJWQpnbDGBejmUBt1Huciq2BEfukVaDdJEB2Wb0X7+k3saj0cyWyFZsfNkwR35TDPoZumaYEupRjRrhmMCGGqzSeC2896eLOcE1ow65BleYxS0GE4Q01xExUfBXi5kT0p1OtZSqDj3+sr4p+WAWlFIpXlo2zxbO8JGLLq9px5GxlXvgKDf5J2M0OZQi608LLvtnQHRNIB5Ug2RVHJMZVkuXcpUGET22PAUYWY+cdjAqpjzthJcd2u9tRKhWEwdyYNpElZq6TQWkZybxaNcUIzxSlRHrtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PY9T0xiVUsJgQdIidQTvO5WL+UqtL44IjgRZtpJmfKo=;
 b=aUmOUKAOVVkOMXeYV0zZhojhGWYFv96LKzlDAe08a6VuFPSKhePcgotLMQqttJwJtXcrq0XXCFf8eJ2tKPjh8Q9b4xQEXcFxhQvrxt7A12bqfNbR2PmqABoZX1Mr1g9G6S7IjBPdMoouSUH7lSFJY2YVu6DGopvSpO6chpu8gdcs1+6sQfQ/gFFYAYDJ4vpQuTay0tWuXyw3GdU2XxMjBwRpvI2+zOCVFX25iVASDDmIGVtclR/vVB1G1GVNlRKpFEDcy/XOPWhTjy8JEFAkvpo7aBwphAtUsLpKaQ5s6XDLk4Y83/JcA0uMzOYlrcSgyvAbN0wtj3KRr1R6d4F91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY9T0xiVUsJgQdIidQTvO5WL+UqtL44IjgRZtpJmfKo=;
 b=sPr2MJlKceTGCoRPEyOiSkNW41/zGfX/0wEFQh8f20JRc5JvtokojsQFPzUwQVcaUQhUMyfR0sm5asRmhylDFcuSWOCl1FqxtqSIJWf/ouZT9iyIrxWMtk0PpMcynpn0tAx6gHky/COnvveB+paPSREDxalEln1fUZkbFCcJ5k0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d493f9e3-ab17-4662-9e7c-d313f4ede033@amd.com>
Date: Wed, 29 Nov 2023 10:18:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] xen/vpci: header: status register handler
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
 <20231128194427.2513249-2-stewart.hildebrand@amd.com>
 <ZWcaiqrg9ZMn6JFC@macbook>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZWcaiqrg9ZMn6JFC@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|PH7PR12MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: e7952f3d-2a0b-41c9-5e60-08dbf0ee79f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I/NHQwzI6AG90RGTNEvauSnoi1L56Gzfq9NMoTjAimdvyjlK3q8s7j4an2zEyKnd+T7raUtQ8SFftxEH3XT+QDwfVwEaoldvJq6/ys+6hb6m1u7N/OauzCo0YQN3eb/rQvumElGgWsDU1FTs+bk5KWcbGbm83q+RIjMEIFSZ6q3pwzQc9SWSzWgaupr0sx9DMkG6+1U0veQq+HbgvihZXELb8e2rS8Dm+WQbRXL8fPXzz9xS8oEUrBHtzDrtaWxXZS2dmJhef6pvA127MpF2HPm96SUqR001uNlkDwW1Xi7wpIKDKymSKUUoOoQQksJ4cdZY6xi7alizZNAqMb1Evql3A6KOBo0J0n73Rjd5GLlZ+U/CR0/tJfKRQT5TZ4Oi3KkpYzGI2ctQc8Xi4wKMygeMKWlegq3NG8dvx0nQyR/MoNp0nd7K5dE1FhUY5zzJXR84b/Y9NzpYVBnA9m0PCSYfP/qZ53cQ8J75qizjZ1UINPXc7hPJhD0Q0w0e2m9Tx2spk4m72BtDyEld7uvtYCs6wcWLs8MMJfq/qPFvATTzbdV/ydQBA0GnKQY6pUP2MwmA3y4h1Itau7VrzOUar1ExwhX/URlqYfDNXyUnyjXkpuWaCppikcbvby7qUOWCnzGl6ko3JpvWXXpVZWwpXqoVMjpD/4q715kuBMym9Htylfz2Qrmrth+QrQHk+zWpI4ZoDOWbLIF0U3AdSdiY1E5P7TZVffYMY+09lPDtvGfadwBeDga07ubO0Q1pTaUN+HZl1yrh7qpddWxFkRh1iAFsFy0vYGG9/OGQ6g0fBgIY1hUv2Z/7ItFrhbIJCssM
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(46966006)(36840700001)(40470700004)(6666004)(40460700003)(2616005)(426003)(336012)(26005)(478600001)(30864003)(36860700001)(5660300002)(2906002)(83380400001)(44832011)(966005)(53546011)(70206006)(8676002)(70586007)(8936002)(19627235002)(6916009)(54906003)(16576012)(4326008)(316002)(356005)(81166007)(82740400003)(86362001)(41300700001)(31696002)(36756003)(47076005)(31686004)(66899024)(40480700001)(43740500002)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:18:44.1020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7952f3d-2a0b-41c9-5e60-08dbf0ee79f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7233

On 11/29/23 06:03, Roger Pau Monné wrote:
> On Tue, Nov 28, 2023 at 02:44:24PM -0500, Stewart Hildebrand wrote:
>> Introduce a handler for the PCI status register, with ability to mask
>> the capabilities bit. The status register contains RsvdZ bits,
>> read-only bits, and write-1-to-clear bits. Additionally, we use RsvdP to
>> mask the capabilities bit. Introduce bitmasks to handle these in vPCI.
>> If a bit in the bitmask is set, then the special meaning applies:
>>
>>   ro_mask: read normal, guest write ignore (preserve on write to hardware)
>>   rw1c_mask: read normal, write 1 to clear
>>   rsvdp_mask: read as zero, guest write ignore (preserve on write to hardware)
>>   rsvdz_mask: read as zero, guest write ignore (write zero to hardware)
>>
>> The RO/RW1C/RsvdP/RsvdZ naming and definitions were borrowed from the
>> PCI Express Base 6.1 specification. RsvdP/RsvdZ bits help Xen enforce
>> our view of the world. Xen preserves the value of read-only bits on
>> write to hardware, discarding the guests write value. This is done in
>> case hardware wrongly implements R/O bits as R/W.
>>
>> The mask_cap_list flag will be set in a follow-on patch.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Thanks for adding the tests, this is looking very good, just a couple
> of cosmetics comments mostly, and a question whether we should refuse
> masks that have bit set outside the register size instead of
> attempting to adjust them.
> 
>> ---
>> v7->v8:
>> * move PCI_STATUS_UDF to rsvdz_mask (per PCI Express Base 6 spec)
>> * add support for rsvdp bits
>> * add tests for ro/rw1c/rsvdp/rsvdz bits in tools/tests/vpci/main.c
>> * dropped R-b tag [1] since the patch has changed moderately since the last rev
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-09/msg00909.html
>>
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
>>  tools/tests/vpci/main.c    | 98 ++++++++++++++++++++++++++++++++++++++
>>  xen/drivers/vpci/header.c  | 12 +++++
>>  xen/drivers/vpci/vpci.c    | 62 +++++++++++++++++++-----
>>  xen/include/xen/pci_regs.h |  9 ++++
>>  xen/include/xen/vpci.h     |  9 ++++
>>  5 files changed, 178 insertions(+), 12 deletions(-)
>>
>> diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
>> index b9a0a6006bb9..b0bb993be297 100644
>> --- a/tools/tests/vpci/main.c
>> +++ b/tools/tests/vpci/main.c
>> @@ -70,6 +70,26 @@ static void vpci_write32(const struct pci_dev *pdev, unsigned int reg,
>>      *(uint32_t *)data = val;
>>  }
>>  
>> +struct mask_data {
>> +    uint32_t val;
>> +    uint32_t rw1c_mask;
>> +};
>> +
>> +static uint32_t vpci_read32_mask(const struct pci_dev *pdev, unsigned int reg,
>> +                                 void *data)
>> +{
>> +    struct mask_data *md = data;
> 
> Newline, and possibly const for md.

Will do, and will do

> 
>> +    return md->val;
>> +}
>> +
>> +static void vpci_write32_mask(const struct pci_dev *pdev, unsigned int reg,
>> +                              uint32_t val, void *data)
>> +{
>> +    struct mask_data *md = data;
> 
> Newline.

Will do

> 
>> +    md->val  = val | (md->val & md->rw1c_mask);
>> +    md->val &= ~(val & md->rw1c_mask);
>> +}
>> +
>>  #define VPCI_READ(reg, size, data) ({                           \
>>      data = vpci_read((pci_sbdf_t){ .sbdf = 0 }, reg, size);     \
>>  })
>> @@ -94,9 +114,20 @@ static void vpci_write32(const struct pci_dev *pdev, unsigned int reg,
>>      assert(!vpci_add_register(test_pdev.vpci, fread, fwrite, off, size,     \
>>                                &store))
>>  
>> +#define VPCI_ADD_REG_MASK(fread, fwrite, off, size, store,                     \
>> +                          ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask)          \
>> +    assert(!vpci_add_register_mask(test_pdev.vpci, fread, fwrite, off, size,   \
>> +                                   &store,                                     \
>> +                                   ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask))
>> +
>>  #define VPCI_ADD_INVALID_REG(fread, fwrite, off, size)                      \
>>      assert(vpci_add_register(test_pdev.vpci, fread, fwrite, off, size, NULL))
>>  
>> +#define VPCI_ADD_INVALID_REG_MASK(fread, fwrite, off, size,                   \
>> +                                  ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask) \
>> +    assert(vpci_add_register_mask(test_pdev.vpci, fread, fwrite, off, size,   \
>> +                                  NULL, ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask))
>> +
>>  #define VPCI_REMOVE_REG(off, size)                                          \
>>      assert(!vpci_remove_register(test_pdev.vpci, off, size))
>>  
>> @@ -154,6 +185,7 @@ main(int argc, char **argv)
>>      uint16_t r20[2] = { };
>>      uint32_t r24 = 0;
>>      uint8_t r28, r30;
>> +    struct mask_data r32;
>>      unsigned int i;
>>      int rc;
>>  
>> @@ -213,6 +245,14 @@ main(int argc, char **argv)
>>      /* Try to add a register with missing handlers. */
>>      VPCI_ADD_INVALID_REG(NULL, NULL, 8, 2);
>>  
>> +    /* Try to add registers with the same bits set in multiple masks. */
>> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 1, 0, 0);
>> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 0, 1, 0);
>> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 0, 0, 1);
>> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 1, 1, 0);
>> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 1, 0, 1);
>> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 0, 1, 1);
>> +
>>      /* Read/write of unset register. */
>>      VPCI_READ_CHECK(8, 4, 0xffffffff);
>>      VPCI_READ_CHECK(8, 2, 0xffff);
>> @@ -287,6 +327,64 @@ main(int argc, char **argv)
>>      VPCI_ADD_REG(vpci_read8, vpci_write8, 30, 1, r30);
>>      VPCI_WRITE_CHECK(28, 4, 0xffacffdc);
>>  
>> +    /*
>> +     * Test ro/rw1c/rsvdp/rsvdz masks.
>> +     *
>> +     * 32     24     16      8      0
>> +     *  +---------------------------+
>> +     *  |            r32            | 32
>> +     *  +---------------------------+
> 
> Might be even better to clarify which region is using each mask:
> 
> 32     24     16      8      0
>  +------+------+------+------+
>  |rsvdz |rsvdp | rw1c |  ro  | 32
>  +------+------+------+------+

Will do

> 
>> +     *
>> +     */
>> +    r32.rw1c_mask = 0x0000ff00U;
>> +    VPCI_ADD_REG_MASK(vpci_read32_mask, vpci_write32_mask, 32, 4, r32,
>> +                      0x000000ffU   /* RO    */,
>> +                      r32.rw1c_mask /* RW1C  */,
>> +                      0x00ff0000U   /* RsvdP */,
>> +                      0xff000000U   /* RsvdZ */);
>> +
>> +    /* ro */
>> +    r32.val = 0x0f0f0f0fU;
>> +    VPCI_READ_CHECK(32, 1, 0x0f);
>> +    VPCI_WRITE(32, 1, 0x5a);
>> +    VPCI_READ_CHECK(32, 1, 0x0f);
>> +    assert(r32.val == 0x000f0f0fU);
>> +
>> +    /* rw1c */
>> +    r32.val = 0x0f0f0f0fU;
>> +    VPCI_READ_CHECK(33, 1, 0x0f);
>> +    VPCI_WRITE(33, 1, 0x5a);
>> +    VPCI_READ_CHECK(33, 1, 0x05);
>> +    assert(r32.val == 0x000f050fU);
>> +
>> +    /* rsvdp */
>> +    r32.val = 0x0f0f0f0fU;
>> +    VPCI_READ_CHECK(34, 1, 0);
>> +    VPCI_WRITE(34, 1, 0x5a);
>> +    VPCI_READ_CHECK(34, 1, 0);
>> +    assert(r32.val == 0x000f0f0fU);
>> +
>> +    /* rsvdz */
>> +    r32.val = 0x0f0f0f0fU;
>> +    VPCI_READ_CHECK(35, 1, 0);
>> +    VPCI_WRITE(35, 1, 0x5a);
>> +    VPCI_READ_CHECK(35, 1, 0);
>> +    assert(r32.val == 0x000f0f0fU);
>> +
>> +    /* write all 0's */
>> +    r32.val = 0x0f0f0f0fU;
>> +    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
>> +    VPCI_WRITE(32, 4, 0);
>> +    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
>> +    assert(r32.val == 0x000f0f0fU);
>> +
>> +    /* write all 1's */
>> +    r32.val = 0x0f0f0f0fU;
>> +    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
>> +    VPCI_WRITE(32, 4, 0xffffffffU);
>> +    VPCI_READ_CHECK(32, 4, 0x0000000fU);
>> +    assert(r32.val == 0x000f000fU);
>> +
>>      /* Finally try to remove a couple of registers. */
>>      VPCI_REMOVE_REG(28, 1);
>>      VPCI_REMOVE_REG(24, 4);
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index 767c1ba718d7..351318121e48 100644
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
>> @@ -544,6 +545,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>      if ( rc )
>>          return rc;
>>  
>> +    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
>> +    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
>> +                                PCI_STATUS, 2, NULL,
>> +                                PCI_STATUS_RO_MASK &
>> +                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
>> +                                PCI_STATUS_RW1C_MASK,
>> +                                mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
>> +                                PCI_STATUS_RSVDZ_MASK);
>> +    if ( rc )
>> +        return rc;
>> +
>>      if ( pdev->ignore_bars )
>>          return 0;
>>  
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 3bec9a4153da..96187b70141b 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -29,6 +29,10 @@ struct vpci_register {
>>      unsigned int offset;
>>      void *private;
>>      struct list_head node;
>> +    uint32_t ro_mask;
>> +    uint32_t rw1c_mask;
>> +    uint32_t rsvdp_mask;
>> +    uint32_t rsvdz_mask;
>>  };
>>  
>>  #ifdef __XEN__
>> @@ -145,9 +149,17 @@ uint32_t cf_check vpci_hw_read32(
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
>> +                        unsigned int size, void *data, uint32_t ro_mask,
>> +                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
>> +                        uint32_t rsvdz_mask)
>>  {
>>      struct list_head *prev;
>>      struct vpci_register *r;
>> @@ -155,7 +167,10 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      /* Some sanity checks. */
>>      if ( (size != 1 && size != 2 && size != 4) ||
>>           offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
>> -         (!read_handler && !write_handler) )
>> +         (!read_handler && !write_handler) || (ro_mask & rw1c_mask) ||
>> +         (ro_mask & rsvdp_mask) || (ro_mask & rsvdz_mask) ||
>> +         (rw1c_mask & rsvdp_mask) || (rw1c_mask & rsvdz_mask) ||
>> +         (rsvdp_mask & rsvdz_mask) )
> 
> It would also be helpful to check that the masks don't have bits set
> above the given register size, ie:

Will do

> 
> if ( size != 4 &&
>      (ro_mask | rw1c_mask | rsvdp_mask | rsvdz_mask) >> (size * 8) )>     return -EINVAL;
> 
>>          return -EINVAL;
>>  
>>      r = xmalloc(struct vpci_register);
>> @@ -167,6 +182,10 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      r->size = size;
>>      r->offset = offset;
>>      r->private = data;
>> +    r->ro_mask = ro_mask & (0xffffffffU >> (32 - 8 * size));
>> +    r->rw1c_mask = rw1c_mask & (0xffffffffU >> (32 - 8 * size));
>> +    r->rsvdp_mask = rsvdp_mask & (0xffffffffU >> (32 - 8 * size));
>> +    r->rsvdz_mask = rsvdz_mask & (0xffffffffU >> (32 - 8 * size));
> 
> Oh, you adjust the masks to match the expected width.  I think it
> might be more sensible to instead make sure the caller has provided
> appropriate masks, as providing a mask that doesn't match the register
> size likely points out to issues in the caller.

Got it, I will do the more sensible thing, and add tests for it :)

> 
>>  
>>      spin_lock(&vpci->lock);
>>  
>> @@ -193,6 +212,24 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>>      return 0;
>>  }
>>  
>> +int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>> +                      vpci_write_t *write_handler, unsigned int offset,
>> +                      unsigned int size, void *data)
>> +{
>> +    return add_register(vpci, read_handler, write_handler, offset, size, data,
>> +                        0, 0, 0, 0);
>> +}
>> +
>> +int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
>> +                           vpci_write_t *write_handler, unsigned int offset,
>> +                           unsigned int size, void *data, uint32_t ro_mask,
>> +                           uint32_t rw1c_mask, uint32_t rsvdp_mask,
>> +                           uint32_t rsvdz_mask)
>> +{
>> +    return add_register(vpci, read_handler, write_handler, offset, size, data,
>> +                        ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask);
>> +}
>> +
>>  int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>>                           unsigned int size)
>>  {
>> @@ -376,6 +413,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>          }
>>  
>>          val = r->read(pdev, r->offset, r->private);
>> +        val &= ~(r->rsvdp_mask | r->rsvdz_mask);
>>  
>>          /* Check if the read is in the middle of a register. */
>>          if ( r->offset < emu.offset )
>> @@ -407,26 +445,26 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
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
> 
> Nit: might be clearer to name this 'current': it's easy to get
> confused whether val or data holds the user-provided input.

The name 'current' shadows an existing global variable/macro. How about current_val?

> 
>> +    uint32_t preserved_mask = r->ro_mask | r->rsvdp_mask;
>> +
>>      ASSERT(size <= r->size);
>>  
>> -    if ( size != r->size )
>> +    if ( (size != r->size) || preserved_mask )
>>      {
>> -        uint32_t val;
>> -
>>          val = r->read(pdev, r->offset, r->private);
>> +        val &= ~r->rw1c_mask;
>>          data = merge_result(val, data, size, offset);
>>      }
>>  
>> +    data &= ~(preserved_mask | r->rsvdz_mask);
>> +    data |= val & preserved_mask;
>> +
>>      r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
>>               r->private);
>>  }
>> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
>> index 84b18736a85d..9909b27425a5 100644
>> --- a/xen/include/xen/pci_regs.h
>> +++ b/xen/include/xen/pci_regs.h
>> @@ -66,6 +66,15 @@
>>  #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
>>  #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
>>  #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
>> +#define  PCI_STATUS_RSVDZ_MASK		0x0046 /* Includes PCI_STATUS_UDF */
>> +
>> +#define  PCI_STATUS_RO_MASK (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT | \
>> +    PCI_STATUS_CAP_LIST | PCI_STATUS_66MHZ | PCI_STATUS_FAST_BACK | \
>> +    PCI_STATUS_DEVSEL_MASK)
>> +#define  PCI_STATUS_RW1C_MASK (PCI_STATUS_PARITY | \
>> +    PCI_STATUS_SIG_TARGET_ABORT | PCI_STATUS_REC_TARGET_ABORT | \
>> +    PCI_STATUS_REC_MASTER_ABORT | PCI_STATUS_SIG_SYSTEM_ERROR | \
>> +    PCI_STATUS_DETECTED_PARITY)
>>  
>>  #define PCI_CLASS_REVISION	0x08	/* High 24 bits are class, low 8 revision */
>>  #define PCI_REVISION_ID		0x08	/* Revision ID */
>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>> index d743d96a10b8..8e8e42372ec1 100644
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -37,6 +37,13 @@ int __must_check vpci_add_register(struct vpci *vpci,
>>                                     vpci_write_t *write_handler,
>>                                     unsigned int offset, unsigned int size,
>>                                     void *data);
>> +int __must_check vpci_add_register_mask(struct vpci *vpci,
>> +                                        vpci_read_t *read_handler,
>> +                                        vpci_write_t *write_handler,
>> +                                        unsigned int offset, unsigned int size,
>> +                                        void *data, uint32_t ro_mask,
>> +                                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
>> +                                        uint32_t rsvdz_mask);
> 
> Instead of exporting two functions, you could export only
> vpci_add_register_mask() and make vpci_add_register() a static inline
> defined in the header as a wrapper around vpci_add_register_mask().

Will do

> 
> Thanks, Roger.

