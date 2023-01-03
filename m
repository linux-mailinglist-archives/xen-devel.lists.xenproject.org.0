Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A765BDAE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 11:09:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470533.730068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCeDx-0002T4-9t; Tue, 03 Jan 2023 10:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470533.730068; Tue, 03 Jan 2023 10:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCeDx-0002Pg-6Y; Tue, 03 Jan 2023 10:08:49 +0000
Received: by outflank-mailman (input) for mailman id 470533;
 Tue, 03 Jan 2023 10:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cMja=5A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pCeDw-0002Pa-0j
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 10:08:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b29dcfa-8b4e-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 11:08:45 +0100 (CET)
Received: from BN0PR04CA0186.namprd04.prod.outlook.com (2603:10b6:408:e9::11)
 by PH0PR12MB5608.namprd12.prod.outlook.com (2603:10b6:510:143::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 10:08:42 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::7e) by BN0PR04CA0186.outlook.office365.com
 (2603:10b6:408:e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 10:08:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Tue, 3 Jan 2023 10:08:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 04:08:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 02:08:40 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Jan 2023 04:08:39 -0600
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
X-Inumbo-ID: 9b29dcfa-8b4e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQlAG2TdtiaLrntgRqveCMe6JhTH4SsrbrdG2OFGTR0PnkcFEhX4hioMc5kqQd/MjniP5T5wjSNGL5gasNyfSulBdRzv9YTCgQAB0PeG2b/rNDxt6RvOuqg+oT622TFlKUFw+Mvf1QJq5ISZpFy3XJZ/Jqd9lMyOhdU6We4isuxdCUTho563wBqtFYYw/HN9o2/QPljt4J7yjdR/HLXcg8hC21EfmH6hS81/qvsubUOwfgh6bVMseYY12MaF5TQRDiP0JMSLpMmcTmRGbNO7MiNHfLM8JH5kwOTjBnVYBpK8z2tWH6Pe+DtyL2R6pHOU10BhpPn0vdj74OFEtJ+d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFbfQOi4RZr5UwQVShC5LQVMlBWdSbMPdaMTF/RdxIM=;
 b=aON696qhTVIuXYB3sZEhlUyLh5i+sltmNKN0TpC1P2HnZ7MlNVC1XZL5BlTZJTLcHV+gp7mlrIj31POmuV+EVPHRmQOopbk2UL3mw/7RG/gVGnN5ysffsAupo0nCfSJ7xQLq4DXwyHhtwDCbDJmxLVTcKOE45cFnxCAbOASiNYSMpn+huXQEorJj6hseOZNogcM/J92WG+FC1d7RiPjTZPPtsvrTBIKu60uDM+UVW5lccz6V7U404/oiIVXGMtpIJ2Zd7zrXrzkYo0rP41jVDmPNRuy2UM5s2pi8z6GudV0kPPWMtg7/1N/euUsaHIeq01+YyCf6rjvhmx95MqW+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFbfQOi4RZr5UwQVShC5LQVMlBWdSbMPdaMTF/RdxIM=;
 b=bia2XultJv1WyD2zxHUxT3wBf26RWLYO1QCCBWChdtyXAt/X9FHMfeUIRctuidPRFOH0x58x0NR9vzIX8LwO0iV6Nk3K8nbN9abF1U4tVM/qNaTlh10hZYGEZTQMZWiTKDeXs6C7oQYQOhKj+rjK2+mYQSQvL0PT9Rt94UFwHko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bd99a2ef-5e31-bc38-ce64-ad7372112cab@amd.com>
Date: Tue, 3 Jan 2023 11:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm: Print memory size in decimal in construct_domU
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	<xen-devel@lists.xenproject.org>
References: <20230102144904.17619-1-michal.orzel@amd.com>
 <2ddcaf95-03f5-81fb-3091-316b99201a1c@amd.com>
 <562770a6-2933-43b8-326f-3bb6d8e0ce61@amd.com>
 <adbaed89-3327-c339-3e36-0a0243a3ffd2@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <adbaed89-3327-c339-3e36-0a0243a3ffd2@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|PH0PR12MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d014c4-b8ac-4a02-1a26-08daed727de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJynHSJnSPEBvzbxghtpDupzx9m9Qee+q1G70VG1EtoMAmrWrGOfp0Kd0HRcKMQfHbHlZWZPU2LwnmXIeyyI8VC22z5PN0v02sge4e5tO9m67pLhi+NGYF8GJP9lWEvcgog5smDgaSIFazlJsCCAEKcJYwxuR11RMDSdkX+f2Wq8f2yAEGA6m5Sx4mhhdl+TVEQa9zbOFv6uxTkchaZsGQsgzN61QfeH1WCSHzMrJoXU/fLcAddOkjn2k8QgMhwmWxwPIrV+U14KJrGVBRclJbV36laKw5ZX6kQnxhl048R6Gj1R5cgCdbr8IHYIL2gtMaRpexPzHEY4X5MRIvMEi/rrIaoSVYkS01q2cYULM7upLNHTMFIbC9OYeic4cmXeHCH1RAsIqcCfNFeMSCcSf3StkdS6Yq9tGHwiMXtl84Q9uQlCViEZtyuG49Is0J5ULWLTlYH69DOb8Dm97JJbEBibEQegin5qn6r33V4KLdIQBr0Vl1BmiXVTwePib7EdeExISxQZ9BwgFZR4hylpg4zyn2MeYRnFpImMWzoDAqe0VLgytr3wjUSw2dZbN7lXlH4r4AN5ACRsvLFWTd3TdlPIcmo9gZJ36LHIRLwO+Zgj4bMWlrGcmNGdKGz5rrJRETl9EaL9oTeRqZSPRjuktRNueYI3GGNcL7HPVD4lLapyCiFDAu93I3XsdGioAzR+rAzZBMQgQMFDEr5LXBVgONqiXUV+u2AIdpvdias3DCWLydRuGpuW5isxP+cmG5+QdI62q6uMPS31/HquIftlvM5Qr20+J94E+3Cad6B0c7A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(81166007)(2616005)(316002)(16576012)(26005)(356005)(40480700001)(186003)(478600001)(40460700003)(82310400005)(86362001)(36756003)(53546011)(31696002)(110136005)(41300700001)(336012)(2906002)(8936002)(44832011)(426003)(47076005)(83380400001)(5660300002)(82740400003)(8676002)(31686004)(70586007)(36860700001)(70206006)(22166006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 10:08:41.9499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d014c4-b8ac-4a02-1a26-08daed727de3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5608

Hi Julien,

On 03/01/2023 10:56, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 03/01/2023 09:39, Michal Orzel wrote:
>> On 03/01/2023 10:21, Ayan Kumar Halder wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 02/01/2023 14:49, Michal Orzel wrote:
>>>> Printing domain's memory size in hex without even prepending it
>>>> with 0x is not very useful and can be misleading. Switch to decimal
>>>> notation.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>    xen/arch/arm/domain_build.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 829cea8de84f..7e204372368c 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
>>>>        if ( rc != 0 )
>>>>            return rc;
>>>>
>>>> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
>>>> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n", d->max_vcpus, mem);
>>>
>>> I will prefer it to be printed in hex format with 0x prefixed. The
>>> reason being the mem is obtained from device-tree domU's 'memory' prop
>>> where the values are in hex.
>> No, I cannot agree. Refer to booting.txt documentation:
>> "A 64-bit integer specifying the amount of kilobytes of RAM to allocate to the guest."
>> Also note that in the provided examples, we are using the decimal values.
>> All in all it does not matter the notation, you can provide e.g. "memory = 131072;" or "memory = 0x20000".
>> I find it a bit odd to print e.g. 0x20000KB and decimal is easier to read.
> By easier, do you mean you can easily figure out how much memory in
> GB/MB/KB you gave to the guest? If so, then I have to disagree. Without
> a calculator, I will find quicker the split.
I guess it depends on the size but you have a valid point.

> 
> If you want to print in decimal, then I think we should split the amount
> in GB/MB/KB. Otherwise, we should stick in hexadecimal (so add 0x).
Ok, I will then just add a prefix.

> 
> Cheers,
> 
> --
> Julien Grall

~Michal

