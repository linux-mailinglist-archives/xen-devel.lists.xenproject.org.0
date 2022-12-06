Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44350643FD2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 10:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454534.712055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2UDA-0007xX-Iu; Tue, 06 Dec 2022 09:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454534.712055; Tue, 06 Dec 2022 09:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2UDA-0007uy-EO; Tue, 06 Dec 2022 09:26:00 +0000
Received: by outflank-mailman (input) for mailman id 454534;
 Tue, 06 Dec 2022 09:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WiLW=4E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p2UD8-0007us-Em
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 09:25:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc783140-7547-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 10:25:56 +0100 (CET)
Received: from BN0PR02CA0045.namprd02.prod.outlook.com (2603:10b6:408:e5::20)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 09:25:52 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::f4) by BN0PR02CA0045.outlook.office365.com
 (2603:10b6:408:e5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Tue, 6 Dec 2022 09:25:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Tue, 6 Dec 2022 09:25:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 03:25:51 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 03:25:51 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 03:25:50 -0600
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
X-Inumbo-ID: fc783140-7547-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmMHWnAU5ulN32EflgjcDCvA99B7G17GUtRwMrVgsrh/nbCc4a/5anzHKIOAsZayHC05ssMModfF6GHJCrePyR2b9i79GT9n5zgug74qtf5aoW0vvAqIExppokKMia8x25OSXXEsgQKv8JmVxM6FSmXgdV5fvvxlm8DmcLjLKNeQmCTmoFGrjgrnbovrBO7luJ3sWzNlcibmVmRj0kpaqY8qxq2pIRkeTqgedk90eampD0H2qdWFNHuU8Li6KtSzfRyxZyDJgGzY3T7Lpx8yoaBc27BMcXuzCW/3hZTaGc+zDkQSXvzz4BGDeFCrdLIjrYUjvH144YGRUHXeLADXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buATqeLXomRaHJbmFn68VCG6QjCL30fcfI0q/aUJGak=;
 b=Ub2LNwfYc6RQhMa6FCTic1FLPDr259pjPWLj+VzjZasM+xyKpwwRGoJ0v62H8z9nBvhUDXKXbb69igtWSN/5td6AG3v2j4CvXnVNKDFtNWKVpbfwLnKeySLu8NeBi7+21/VDEV6dApwzmJDYoLpnCxkK1DuXdwxvTGsRF5Xgh3yVEYBq4peTNDBB9jLHCQtm/tXk+tAv6zfQqPwAZ0a4RG59GAh+q4XTAXbpAyEiCKIgxPmALrEcZCmOTRf3kTHcRnA9TjzZgqSItAa8+ClCP+SfPjdPMZv7ekjdiz1Y4aMXaYve5rl7kuquIr4HEpElv3p/FuoMe/DrMSUlZ9veNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buATqeLXomRaHJbmFn68VCG6QjCL30fcfI0q/aUJGak=;
 b=bOUmlnlPxDcD6mOWD69Vj0nkEudANP1yuuSK8Ov6h70TmZAFFeAyvvNyCfsNdV74nE82yi1pa9HySJp1a7FfzMSGIhBooB5RrzDJqDP0VaTxOyP1HENUWGww+UHEwfnQSacJLxQDObw4iq16ORfdzUAKfgabmrQ05w5s/PHtjK0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <806fb37c-37fe-d27a-4b44-f97c0f80b8da@amd.com>
Date: Tue, 6 Dec 2022 10:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 10/21] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <d08de970e285221cb9a2e4dd0dfd4bf07bfdbba2.1669888522.git.rahul.singh@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d08de970e285221cb9a2e4dd0dfd4bf07bfdbba2.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 597a56d2-9649-4d56-6544-08dad76bdea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RjT5MwPV29L/VRQwGM5Czn1b7EPy5DJ/QgwPVPXfJfAgjIbr/VDV2bpY7upPVOOeVoC+YtI40rjJy3c9WHg4NDkHlfUGpXuj0Rk80VEi1B9MeTv2qiCWsqOOBcqhw+wFRSfwi01oy13SFOZWSfb5HhUlw3r0p/rTztgncbSy3gtZ/9kpBHZ2RHV7SsjYPiQuPJ4VbCo6YFlodNM0vTWL9/woWzAWCp9p2jpW9VbIkuQVVB0p2Oq50aFRiRTb0ehpiEsRqQhgx53swRea6yjbzw6gc3d4KvRI1XJdv3GUMSjXNdoIsFMfYlFleFtQ4ijmMatiAtYD1jEgbTRBM70PqaTaqWVTHyPrWlIsIQ+cVJSJO/KXVPbFipUjccbuMeKSB0i75trcJvZsNeYKYmtmMg5Zuf0bj5jyyk92zk58WpGDZpDk6lvILoO4pPOZjTh602UY+hyjVRIEFFtdMaIAdL6EPnPnx2kMoEtKCCfs+3V6wfQ5kpB7Dq6CBf80NXTVzeQbyQcaExZSkaFr95ICVaRaMCi6vDzXXmWTAd0R2N+ba2xVYj58hhSKl521GPAVjFHhfii3PMkEjDKv8Cd3sR4M4b+bHQxfaufOmZcBuXZLrONCoKCkeDVrd76OwSMCnWWyjT7wQ8AKiddHn2DFVWOpK3VjDjHKDLenMsvc0so1s7liMSAw0DrnlLJ3r7lWkfEJp1E8KXTQE1ag8O8bIUqBndBaRFvmNJC1cI2A+O67PTGLV7qI5py4IS9k+99g74OHGerlELBMbaa0EC8KFluvrjrEbmXbyN0nCTH4YEgoyH3PWuiyW+HE1LAye7nz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(54906003)(110136005)(44832011)(316002)(16576012)(8676002)(70206006)(4326008)(70586007)(41300700001)(426003)(8936002)(36756003)(5660300002)(83380400001)(47076005)(2616005)(82740400003)(336012)(356005)(81166007)(186003)(36860700001)(40460700003)(31696002)(82310400005)(53546011)(86362001)(40480700001)(478600001)(26005)(2906002)(31686004)(36900700001)(43740500002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 09:25:52.2731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597a56d2-9649-4d56-6544-08dad76bdea5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148

Hi Rahul,

On 01/12/2022 17:02, Rahul Singh wrote:
> 
> 
> CMD_CFGI_STE is used to invalidate/validate the STE. Emulated vSMMUv3
> driver in XEN will read the STE from the guest memory space and capture
> the Stage-1 configuration required to support nested translation.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/drivers/passthrough/arm/vsmmu-v3.c | 148 +++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index cc651a2dc8..916b97b8a2 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -44,6 +44,21 @@ extern const struct viommu_desc __read_mostly *cur_viommu;
>  /* Helper Macros */
>  #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
>  #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
> +#define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)
> +#define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
> +#define smmu_get_ste_s1fmt(x)       FIELD_GET(STRTAB_STE_0_S1FMT, x)
> +#define smmu_get_ste_s1stalld(x)    FIELD_GET(STRTAB_STE_1_S1STALLD, x)
> +#define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
> +                                    FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
> +
> +/* stage-1 translation configuration */
> +struct arm_vsmmu_s1_trans_cfg {
> +    paddr_t s1ctxptr;
> +    uint8_t s1fmt;
> +    uint8_t s1cdmax;
> +    bool    bypassed;             /* translation is bypassed */
> +    bool    aborted;              /* translation is aborted */
> +};
> 
>  /* virtual smmu queue */
>  struct arm_vsmmu_queue {
> @@ -90,6 +105,138 @@ static void dump_smmu_command(uint64_t *command)
>      gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
>               smmu_cmd_get_command(command[0]), command[0], command[1]);
>  }
> +static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
> +                              uint64_t *ste)
> +{
> +    paddr_t addr, strtab_base;
> +    struct domain *d = smmu->d;
> +    uint32_t log2size;
> +    int strtab_size_shift;
> +    int ret;
> +
> +    log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg);
> +
> +    if ( sid >= (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
> +        return -EINVAL;
> +
> +    if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
> +    {
> +        int idx, max_l2_ste, span;
> +        paddr_t l1ptr, l2ptr;
> +        uint64_t l1std;
> +
> +        strtab_size_shift = MAX(5, (int)log2size - smmu->sid_split - 1 + 3);
> +        strtab_base = smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
> +                        ~GENMASK_ULL(strtab_size_shift, 0);
> +        idx = (sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS;
> +        l1ptr = (paddr_t)(strtab_base + idx * sizeof(l1std));
> +
> +        ret = access_guest_memory_by_ipa(d, l1ptr, &l1std,
> +                                         sizeof(l1std), false);
> +        if ( ret )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
> +            return ret;
> +        }
> +
> +        span = FIELD_GET(STRTAB_L1_DESC_SPAN, l1std);
> +        if ( !span )
> +        {
> +            gdprintk(XENLOG_ERR, "Bad StreamID span\n");
> +            return -EINVAL;
> +        }
> +
> +        max_l2_ste = (1 << span) - 1;
> +        l2ptr = FIELD_PREP(STRTAB_L1_DESC_L2PTR_MASK,
> +                    FIELD_GET(STRTAB_L1_DESC_L2PTR_MASK, l1std));
> +        idx = sid & ((1 << smmu->sid_split) - 1);
> +        if ( idx > max_l2_ste )
> +        {
> +            gdprintk(XENLOG_ERR, "idx=%d > max_l2_ste=%d\n",
> +                     idx, max_l2_ste);
> +            return -EINVAL;
> +        }
> +        addr = l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
> +    }
> +    else
> +    {
> +        strtab_size_shift = log2size + 5;
> +        strtab_base = smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
> +                      ~GENMASK_ULL(strtab_size_shift, 0);
> +        addr = strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
> +    }
> +    ret = access_guest_memory_by_ipa(d, addr, ste, sizeof(*ste), false);
> +    if ( ret )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
> +                                struct arm_vsmmu_s1_trans_cfg *cfg,
> +                                uint64_t *ste)
> +{
> +    uint64_t val = ste[0];
> +
> +    if ( !(val & STRTAB_STE_0_V) )
> +        return -EAGAIN;
> +
> +    switch ( FIELD_GET(STRTAB_STE_0_CFG, val) )
> +    {
> +    case STRTAB_STE_0_CFG_BYPASS:
> +        cfg->bypassed = true;
> +        return 0;
> +    case STRTAB_STE_0_CFG_ABORT:
> +        cfg->aborted = true;
> +        return 0;
> +    case STRTAB_STE_0_CFG_S1_TRANS:
> +        break;
> +    case STRTAB_STE_0_CFG_S2_TRANS:
> +        gdprintk(XENLOG_ERR, "vSMMUv3 does not support stage 2 yet\n");
> +        goto bad_ste;
> +    default:
> +        BUG(); /* STE corruption */
> +    }
> +
> +    cfg->s1ctxptr = smmu_get_ste_s1ctxptr(val);
> +    cfg->s1fmt = smmu_get_ste_s1fmt(val);
> +    cfg->s1cdmax = smmu_get_ste_s1cdmax(val);
> +    if ( cfg->s1cdmax != 0 )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                 "vSMMUv3 does not support multiple context descriptors\n");
> +        goto bad_ste;
> +    }
> +
> +    return 0;
> +
> +bad_ste:
> +    return -EINVAL;
> +}
> +
> +static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
> +{
> +    int ret;
> +    uint64_t ste[STRTAB_STE_DWORDS];
Do we really need to have an array here to represent the complete STE, even though we are only interested in
the first DWORD containing S1ContextPtr? We do not care about other DWORDS and also in arm_vsmmu_find_ste,
you access a single DWORD by doing:
ret = access_guest_memory_by_ipa(d, addr, ste, sizeof(*ste), false);
instead of:
ret = access_guest_memory_by_ipa(d, addr, ste, sizeof(*ste) * STRTAB_STE_DWORDS, false);

So to me, we could just do:
uint64_t ste;
and we would be covered.

~Michal

