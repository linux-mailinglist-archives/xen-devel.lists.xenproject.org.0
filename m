Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340D084668B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 04:30:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674778.1049942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVkFr-0005xK-WF; Fri, 02 Feb 2024 03:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674778.1049942; Fri, 02 Feb 2024 03:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVkFr-0005uo-TN; Fri, 02 Feb 2024 03:30:15 +0000
Received: by outflank-mailman (input) for mailman id 674778;
 Fri, 02 Feb 2024 03:30:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rVkFp-0005ue-Rb
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 03:30:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ed78fb9-c17b-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 04:30:12 +0100 (CET)
Received: from CYZPR05CA0020.namprd05.prod.outlook.com (2603:10b6:930:89::23)
 by DS0PR12MB7559.namprd12.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 2 Feb
 2024 03:30:07 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:89:cafe::17) by CYZPR05CA0020.outlook.office365.com
 (2603:10b6:930:89::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Fri, 2 Feb 2024 03:30:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 03:30:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 1 Feb
 2024 21:30:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 1 Feb
 2024 21:30:06 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 1 Feb 2024 21:30:05 -0600
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
X-Inumbo-ID: 5ed78fb9-c17b-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7eRCLc3E9JBVUpiEhfvFp0esr7gWFfyr7lPlqBfz5R1SvWmRGcF8THVK0Afp1QnIyohgMllUTQyBZd+j+DQnTFmU6KollX5UerdQ/HYPG/lfqrLuSNFQ5qkBo1wd1GPdsAFvuv7SccUlO/ecwRSQhalNOUTYFZiHw8zF9CPngthLTz+ieTbJMUv4Cui0ISyj1C2ssigS1OJ1i94XJ+HtpYqEbHjJ0YFMMeiw2+efxFOR5U4hYPWv9Ih/5GLYhwdisY5KXZbnL9pBgAdfIGrHNOp7PXZw4LVDhykZZt5uJWkRHKkOBJTS59qBurp5nkPdbtQwCntjwRFuUfd6kLCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6WFUKV9+5WrvLvThFZR31umrBLy7SAfqc1e6Ju/6XM=;
 b=iWVHX8sQE6YvKeTJSSI330KXUUkIUiBCnXGXEwYgHUVfXcKNkTJCMUcCVg4+QMa+UpFGTTNoHjTOjg4oM+zAPZy8e/ZWWlnMvfkVmC+ShSfKWevbGrV3d8i0OD1CxSb4txlALBuL//gOzV+fH26SJp5zR6rfYuTH+jcRQRnilnIGcrT5IQg2wDhG6X8B3BKkdDsxtD8s4plJQVDNS3gL9SOuVod0tZOijl442B1D/kcjkCUpSb8MkAj0k7DZCa2CJp3SiS++4uecAxWdKWnju9cm/7adFwIw+kCrj+0eBsR3sFzV/JHfkwAcaqO9NX5j0El3f38AMPBbTzLxvkPLAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6WFUKV9+5WrvLvThFZR31umrBLy7SAfqc1e6Ju/6XM=;
 b=HHuKH9pEZp808sHjrvT7izCd3tlhwQL18qDfJ8IJD33ODCx2N3sKewzEng8rEZahitN73IpdTcyGRyG6eqh4rzHRrzmI+IZIn5NTjsHZS6M6HJg8AAtAiqC8tavGhKZwwDvg3XkZeEK6h/KNrnX31zGO1133Go2OvcEphWsvEYM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3b6af1cb-c234-430e-b92a-2479b42de184@amd.com>
Date: Thu, 1 Feb 2024 22:30:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/15] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-12-stewart.hildebrand@amd.com>
 <ec947a93-3026-4119-84dc-09785fab8f7f@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ec947a93-3026-4119-84dc-09785fab8f7f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|DS0PR12MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 3806993a-290d-4001-0523-08dc239f40f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X8dexJi6QM+RF3vURXIr26hFIG0TgCXCmPxNqyY4evCZ5aVhNGgp2RMWMzcRQkOc4/6gX3l5EjqrNHP8aQZOwK8bngTFGkDThv/+Vf70jyvROT6z63L8yZ5uOWrUoubKGjtKxBx+eG/g4icoj8x9NVxELGZX2FnYzAEBt49d0k1uZFDSILaTbZvJOsKWTG/1nAHOi4HqHBI61hr9qDCDOhqc+3Hyhtt4syg90Z9kSmzPNQY2I29aNT47WoE6e3Rd4OnFXmKvwpKmTezipUxPIiD8UX5ywygYNBEK5PdxsytBkQXgwMOiIL/ggVOSTVjiY+ibSAxmQLY5SwQa/R/teIjTVfUn5vObjOUHxImBplELEI5UXW9N/NUSTp6BqPAdfpqTqsV9E4B1a/CaQVf0Zzpc2ynmBHq7EjRnNI3xl9Y9RQH3kpni/8eMUoS0N/CRXEDFtrj1b2HYIWQl56OYojezpKq86qmcsNfVhU+dkPLMg31xNEwCbOY27HF+WpbjcExXh8xpABsD8Xri1l3yQnzc4cKY3/R8BHlUEPLgV1I2yZ43punhGIau20n68OjbTfAU60J7lQQeyG7herXNV6K/C1oUhs2dwWA8GBPikpG4MfVnOQTlH8Olw4g2HWTPIMIH94XU6K0dlod7h/jvPq5q41S4KJbsr1isw2FDjHxV295VqGfldvIAjL+GAzGJG7OcDWVXhzaLl/sSXcQRyuhWjYfTuxyAdPV+CpRYpChhO7ODhV1peEiPMB6jDU7vOUMycbZRhgBXs50mNUQaoXZCgwTlcJudYbbNjt/0iy089A/yaZ0wxIOn8/OKl5Gh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(46966006)(36840700001)(40470700004)(41300700001)(83380400001)(47076005)(336012)(26005)(2616005)(36860700001)(5660300002)(81166007)(8936002)(44832011)(7416002)(54906003)(8676002)(16576012)(478600001)(2906002)(82740400003)(70586007)(70206006)(6916009)(53546011)(316002)(4326008)(426003)(31696002)(36756003)(86362001)(356005)(40460700003)(40480700001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 03:30:07.5074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3806993a-290d-4001-0523-08dc239f40f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7559

On 1/25/24 11:00, Jan Beulich wrote:
> On 09.01.2024 22:51, Stewart Hildebrand wrote:
>> --- a/xen/drivers/Kconfig
>> +++ b/xen/drivers/Kconfig
>> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>>  config HAS_VPCI
>>  	bool
>>  
>> +config HAS_VPCI_GUEST_SUPPORT
>> +	bool
>> +	depends on HAS_VPCI
> 
> Wouldn't this better be "select", or even just "imply"?

I prefer "select"

> 
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -40,6 +40,49 @@ extern vpci_register_init_t *const __start_vpci_array[];
>>  extern vpci_register_init_t *const __end_vpci_array[];
>>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>>  
>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +static int add_virtual_device(struct pci_dev *pdev)
>> +{
>> +    struct domain *d = pdev->domain;
>> +    unsigned int new_dev_number;
>> +
>> +    if ( is_hardware_domain(d) )
>> +        return 0;
>> +
>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>> +
>> +    /*
>> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
>> +     * there are multi-function ones which are not yet supported.
>> +     */
>> +    if ( pdev->info.is_extfn && !pdev->info.is_virtfn )
>> +    {
>> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
>> +                 &pdev->sbdf);
> 
> The message suggests you ought to check pdev->devfn to have the low
> three bits clear. Yet what you check are two booleans.

I'll check pdev->sbdf.fn

> 
> Further doesn't this require the multi-function bit to be emulated
> clear?

I consider this to be future work. The header type register, where the
bit resides, is not yet emulated for domUs. I have a series in the works
for emulating additional registers (including PCI_HEADER_TYPE), but I'm
planning to wait to submit it until after the current series is finished
so as to not delay the current series any further.

> And finally don't you then also need to disallow assignment of
> devices with phantom functions?

No, I don't think so. My understanding is that there is no configuration
space associated with the phantom SBDFs. There's no special handling
required in vPCI per se, because the phantom function RIDs get mapped
in the IOMMU when the device gets assigned. Future work would include
exposing the PCI Express Capability, including device control register
with the phantom function enable bit. I say this having only done
limited testing of phantom functions on ARM, and by faking it using the
pci-phantom= Xen arg because I don't have a real device with phantom
function capability.

> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -484,6 +484,14 @@ struct domain
>>       * 2. pdev->vpci->lock
>>       */
>>      rwlock_t pci_lock;
>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +    /*
>> +     * The bitmap which shows which device numbers are already used by the
>> +     * virtual PCI bus topology and is used to assign a unique SBDF to the
>> +     * next passed through virtual PCI device.
>> +     */
>> +    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
>> +#endif
>>  #endif
> 
> With this the 2nd #endif would likely better gain a comment.

I will add it. Actually, I see no harm in adding a comment for both of
these #endifs.

> 
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>>  
>>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
>>  
>> +/*
>> + * Maximum number of devices supported by the virtual bus topology:
>> + * each PCI bus supports 32 devices/slots at max or up to 256 when
>> + * there are multi-function ones which are not yet supported.
>> + */
>> +#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
> 
> The limit being this means only bus 0 / seg 0 is supported, which I
> think the comment would better also say. (In add_virtual_device(),
> which has a similar comment, there's then at least a 2nd one saying
> so.)

OK, I'll adjust the comment.

