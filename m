Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDB074F830
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 20:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561862.878446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJIUg-0002RA-Kr; Tue, 11 Jul 2023 18:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561862.878446; Tue, 11 Jul 2023 18:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJIUg-0002OF-H9; Tue, 11 Jul 2023 18:53:50 +0000
Received: by outflank-mailman (input) for mailman id 561862;
 Tue, 11 Jul 2023 18:53:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e9Pp=C5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qJIUf-0002O9-NY
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 18:53:49 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43fbb3d7-201c-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 20:53:47 +0200 (CEST)
Received: from MW4PR04CA0208.namprd04.prod.outlook.com (2603:10b6:303:86::33)
 by CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 18:53:44 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::47) by MW4PR04CA0208.outlook.office365.com
 (2603:10b6:303:86::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 18:53:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.44 via Frontend Transport; Tue, 11 Jul 2023 18:53:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 13:53:42 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 11 Jul 2023 13:53:41 -0500
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
X-Inumbo-ID: 43fbb3d7-201c-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAxJ1AFu+fLKtlTYYczF1KEIosAnsqDhRrmT8EdXpneSo9vUtOcSHcQljsrqKJB4tNY4YD7jy09f2d7FZthTX42dzUBZie/kxAo2MqQKdQLcav7Zk4xWwPWXuS+28Cp/QxF8NYdn1fvnbBBZUGQOALCed9Ez4SQNX8VtW2CpEkCt/ielfNTYddyz4S30sSUXG3U6+KgF8u8J7IXgGfCmpNzbrUcq713Ml1THzNkdmSKuSv+P+P68+QFXhGL9xa1TgWkWkTMWh2D6T0bLYNLvFj/FFjEFuO8/GL0jUPakXHVuFzs8G8dwxnJfE5bkTFmrKlYTsGtGbLvewTmBooNNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H3bOjTKZb5489DnRXo1iL//HFnO6Y4ttyhtW93iCPc=;
 b=MFHSXuOSS1NkNp0UcO1WwWVxQM9o06tS0XX2MU3JLULLEcglso11QuAqmdHN6OaHPhHjSJk1Vw9poSBIXhsgWaSxsAdoSlfVZmPNzynd5fcHgRfkwjdc0nTKZsGlszCTW+CmuN5AKK6vI2damNzyV3crPoidI7tyPXbUvAjt1sB26zg8Ncq10bLxjr+1Jd5iX9veDK9lefJ58ejghuIVR6jl/QeQj3CMFq5qPuDuU9XkAK0CkYhcso2jNtZRXk+PNGeO6T+eIxrQdnpQSJINiV0BssInK5sLNOkwl2PCcfzbFZK3JyTbkPE+zvwsHTWvNyZRfvIFdbq53UnQweD/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H3bOjTKZb5489DnRXo1iL//HFnO6Y4ttyhtW93iCPc=;
 b=h3YhoTKRcMgkeS/cgfaXfDo9/PTdd6cmDQbmBup115H61bQAk2DEKbUP6jxeFcuuIgxvW0n2G92hZMlGCqEGXJDvcTw0Vj2NLMjuUGONCVdp3BUjWA0b+m+kz9QZd1VmElUzWLP3jzSh9VWryvJVEs1oCChEAgO1xJvb/eNr4G0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9c152ef0-9264-4034-344d-10d535a06c13@amd.com>
Date: Tue, 11 Jul 2023 14:53:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/arm: pci: fix check in pci_check_bar()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
References: <20230711154648.729567-1-stewart.hildebrand@amd.com>
 <ZK19fKfVCH4Od6B1@MacBook-Air-de-Roger.local>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZK19fKfVCH4Od6B1@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT042:EE_|CH2PR12MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e68123f-82f3-478b-def5-08db82402690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5PlRZjLSyOhKAJ1ykjFQBZ2elgidvlw1+fcHS1u5QYlVa123a9mrGtEvyO7Woaf7WR8Ji2LlEHDgwXbSU83xp936XjfC8SboZJp1HQmA9b9BmRW3rHbqFFVDYcGAelL/lfSj5qZfDZIpWGJNXhloWzdJq3BxLyrrwKM8nrjexmSRL0Vx8boAxsDzh7Ti+3GF3yD5OuaclHbi2f8WPYgeyWaacpU6VBdYVhaFTb3mgmLB18mAGiqAAz1C3YcV9QPm5Mpk1waUmLDXdtQKJOCoqewo0FUcdu9/Epi+KYZGam/UUaeVjrnzhJEmU5nY4IA3nhAoeZ2tnu5P444u4aBqKBlubs10AIrVJc4EL8XBRttPdIDiB0N69pIFMUuk0j5EkO0o2jm0pY+mHyzwoPWzqfmGl9PHkfBWn7Mne1bvoM3lpMrtcT6Li/ibbPawjmeQ4uD/DkO830L46AMEbtwgB7WfSGLE2EjFLHnmSm5dlzOOzMFnZU6C5sR8JMZhgXbGwLe5Q+f2nXrBK/AqqWlSSQ+ob5vuVE3lvhaB6Z4NDCZcTPBc95eL7IKTCGfOwteSPwlmLMiTaJTq3g0l9RqZwJKpYlMhCfVouzS1Lmo+0DIQcf5uk3VjJw483DnNgarUrARQZDBfB/7Pvhkq9OPlNnQBaHFcugJyIfckDJbuSkREKqRUNx+uBWgynXs1myGmhwznUlBWgVIJZmpMmheS5HZHImOqKhMxfQwG7YsCGRN5UcVXTKc59pncHBUrITJbJPLAeBY2d5+MwlAd1XL2rCpdL4HE9rISvhxNLAdgZw1AWztTfZWOP4R1oNDMcmQs
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(31686004)(82310400005)(4326008)(6916009)(478600001)(36756003)(70586007)(41300700001)(16576012)(54906003)(316002)(70206006)(86362001)(31696002)(2616005)(83380400001)(53546011)(47076005)(26005)(426003)(336012)(40480700001)(186003)(82740400003)(356005)(81166007)(8936002)(2906002)(8676002)(5660300002)(40460700003)(44832011)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 18:53:43.7884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e68123f-82f3-478b-def5-08db82402690
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280

On 7/11/23 12:04, Roger Pau Monné wrote:
> On Tue, Jul 11, 2023 at 11:46:47AM -0400, Stewart Hildebrand wrote:
>> When mapping BARs for vPCI, it's valid for a BAR start address to equal the BAR
>> end address (i.e. s == e). However, pci_check_bar() currently returns false in
>> this case, which results in Xen not mapping the BAR. In this example boot log,
>> Linux has mapped the BARs, but since Xen did not map them, Linux encounters a
>> data abort and panics:
>>
>> [    2.593300] pci 0000:00:00.0: BAR 0: assigned [mem 0x50008000-0x50008fff]
>> [    2.593682] pci 0000:00:00.0: BAR 2: assigned [mem 0x50009000-0x50009fff]
>> [    2.594066] pci 0000:00:00.0: BAR 4: assigned [mem 0x5000a000-0x5000afff]
>> ...
>> [    2.810502] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
>> (XEN) 0000:00:00.0: not mapping BAR [50008, 50008] invalid position
>> (XEN) 0000:00:00.0: not mapping BAR [50009, 50009] invalid position
>> (XEN) 0000:00:00.0: not mapping BAR [5000a, 5000a] invalid position
>> [    2.817502] virtio-pci 0000:00:00.0: virtio_pci: leaving for legacy driver
>> [    2.817853] virtio-pci 0000:00:00.0: enabling bus mastering
>> (XEN) arch/arm/traps.c:1992:d0v0 HSR=0x00000093010045 pc=0xffff8000089507d4 gva=0xffff80000c46d012 gpa=0x00000050008012
>> [    2.818397] Unable to handle kernel ttbr address size fault at virtual address ffff80000c46d012
>> ...
>>
>> Fix this by changing the condition in pci_check_bar().
>>
>> Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to pci_check_bar")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>>  xen/arch/arm/pci/pci-host-common.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
>> index 7cdfc89e5211..e0ec526f9776 100644
>> --- a/xen/arch/arm/pci/pci-host-common.c
>> +++ b/xen/arch/arm/pci/pci-host-common.c
>> @@ -406,7 +406,7 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>>          .is_valid = false
>>      };
>>
>> -    if ( s >= e )
>> +    if ( s > e )
> 
> I think you want to adjust e to include the full page, ie:
> 
> paddr_t e = mfn_to_maddr(end + 1) - 1;
> 
> As passing start == end should be assumed to cover a full page, and s
> == e won't be possible anymore.

Yes, I will do this. This will also increase the accuracy of the subsequent is_bar_valid check. Since can't add directly to a mfn_t, it will actually look like this:

paddr_t e = mfn_to_maddr(mfn_add(end, 1)) - 1;

> Adjusting the check to drop the equal is still good IMO.

Agreed, since e is still inclusive after applying your suggested math.

