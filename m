Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6064E84D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 09:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464209.722588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p66P9-0008Ts-Bd; Fri, 16 Dec 2022 08:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464209.722588; Fri, 16 Dec 2022 08:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p66P9-0008QS-7j; Fri, 16 Dec 2022 08:49:19 +0000
Received: by outflank-mailman (input) for mailman id 464209;
 Fri, 16 Dec 2022 08:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p66P7-0008QM-6u
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 08:49:17 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83ca0edb-7d1e-11ed-8fd3-01056ac49cbb;
 Fri, 16 Dec 2022 09:49:14 +0100 (CET)
Received: from BN9PR03CA0120.namprd03.prod.outlook.com (2603:10b6:408:fd::35)
 by BL1PR12MB5063.namprd12.prod.outlook.com (2603:10b6:208:31a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 08:49:11 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::3a) by BN9PR03CA0120.outlook.office365.com
 (2603:10b6:408:fd::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Fri, 16 Dec 2022 08:49:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 08:49:10 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 02:49:10 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 00:49:10 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Dec 2022 02:49:08 -0600
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
X-Inumbo-ID: 83ca0edb-7d1e-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVloj9ve4VOF3H/eXz6ApSibnf/PKanTY+VQ+PgaDIgV690uv2/orjARehov1YpUpI1IISjSJCcMlHwnxL644BoZKTZazRqGqeHEgOsrmtYhr/AMe9CHOEDjjSCXSMv4oIwlLAjKRlkMplMUrtXlsMI/2xo8pBFoS950doUXoPCyS/nsUCP2sLSBt/TiHAAifnxgYA3ICCgFOIiIiGMEKxCN+5ova1Bc6Vgw1AGtpCDKAdVwxTq9ihiUoPlntR7+PgmEPylkc22EmfuNB29rv5Lbb6Oq4pwxjFONzzSa5DP4wiSSJXKN/DY3sXCSBKaNHdc/lugh68gOWz3cXifMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfpWM+bPEAeOjFmUQEZfHK53UeNgZ64B7Cs+Fv8PyBM=;
 b=Ff9cDVQM14P1r4MFhSkNhCvyMrTXPrPCYUmisuARGjSzOq0gswM43F5qaJuCf8NsEZY6ykfZxrtDOxI+uMmXNcV6rDHE4Qml2l4jUzmJg+I9FmnsSZajP9+m41OIQ9OVhtESGmPrvZRQylQCvKI5UXorpsKBQ4asrL2nLsnTFm0LQtV4fN5/Xo29Yo8edCxM3CZjZJKl2yU3AWvz9XxVFai2KtpLkgdih7eOzog4NSs06iweVYaEv5ybIhCwuliSHv7OMwutJAck6F3XVB24Z4RV8OjhW8H7B+cUE1ii08FGStBpCb756UHKd43LAMPDkhvnav2mMd8JB0Lc0tylcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfpWM+bPEAeOjFmUQEZfHK53UeNgZ64B7Cs+Fv8PyBM=;
 b=HEHImrT1ugKf/YkrRHVNzNS86136kVOaGKmAB5BT8WFFA73XDbdopJ0mo63RZCOBqzfkw1b8I8aNxfdR5+IDwscuoxunm8Y4h3oZusBsgkUmZVus69Ngp3ZbEdOf/x0Hm+BKE2oxpr1hoyuA+x6lldYPcWwhgay16ClyIjLBSxA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ac21d0f7-0441-8da8-6370-b9fd9ae159b7@amd.com>
Date: Fri, 16 Dec 2022 09:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] xen/arm: Allow to set grant table related limits for
 dom0less domUs
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20221214130833.543-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2212151335020.315094@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2212151335020.315094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|BL1PR12MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: b4167145-f06c-4ea5-cdb3-08dadf4266b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mrLfMNQF9/Gz991P86QcMqG9V8+BBqDw2oHpl3VSyaz90QHAh/XYb16K2RXBf3YDbfiVOyChIthy1mflpmigQbEhxp4S5Km/4PYaJVqpSpZBysbDu8eA0lclJxbVf9O4AcYim3j6cSKCGdl283GPbIndA5Mhmgf8czLAd5C26aYwOSbrNPFaWxJuy6SIza6s+GuXH0NUTud2gYAq39dLfgxx94hfXqhkSAbLMGTC2W7TxhlbpIqrx8z0dAK4kuIReEbbhxYANPeBEFhwvMHctIpeIhAJv/D6j7y6kbEiaipB++ca7UqFpmD4/Lk+xwfg3qGEeiTKnB4QH2oIWB48oieDEgUWfGIHXjxaVLgPqDBp/vCFVki/leV1y9jEOpvLoCqWoJYtWRsmCumM0eg8y+69xD8Zdz3kJSijqbHfHmAVzoZWQF40IXPTB4+errUq1zPL5Kg7zc5oxaoBYcfOzNt2HAFpe5sdyAQh534qeWQ0niDWhfIiB4HR7OrjS6RP6wCen02UCEz7BaSJvCBu2wsdZ22kkCS398uFr4XXD/ljx3uHOx8F+z1XAOuwjlra2hj0yAEWtv/8xfu74KPT15j0m8HQqGTh7xTu82ZdtFmNVuWs59SzKC786KrM4CboiF6Exr+lKMagEVPhq1sb8lLCzQHUs84yPvoDKIIsKDnX55eTCw0vtGxJEtORIuyvrXZbVCwFlP1ThaKnLBCoHhcn0DWWyKDZ1e7XiL/SOCbWYXxTj94hf35xHRUdZbw/fkxhDwRQD0EtzWV2iSK2Lmbj2GV+NzIqUSI+slMViYU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(5660300002)(44832011)(47076005)(31696002)(40480700001)(41300700001)(336012)(83380400001)(8936002)(426003)(86362001)(82740400003)(82310400005)(40460700003)(356005)(81166007)(2906002)(36860700001)(36756003)(26005)(53546011)(186003)(478600001)(31686004)(8676002)(4326008)(54906003)(70206006)(70586007)(316002)(16576012)(2616005)(6916009)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 08:49:10.9929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4167145-f06c-4ea5-cdb3-08dadf4266b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5063

Hi Stefano,

On 15/12/2022 22:38, Stefano Stabellini wrote:
> 
> 
> On Wed, 14 Dec 2022, Michal Orzel wrote:
>> At the moment, for dom0less domUs, we do not have a way to specify
>> per domain grant table related limits (unlike when using xl), namely
>> max version, max number of grant frames, max number of maptrack frames.
>> This means that such domains always use the values specified by the Xen
>> command line parameters or their default values if unspecified.
>>
>> In order to have more control over dom0less domUs, introduce the
>> following device-tree properties that can be set under domUs nodes:
>>  - max_grant_version to set the maximum grant table version the domain
>>    is allowed to use,
>>  - max_grant_frames to set the maximum number of grant frames the domain
>>    is allowed to have,
>>  - max_maptrack_frames to set the maximum number of grant maptrack frames
>>    the domain is allowed to have.
>>
>> Update documentation accordingly.
>>
>> Note that the sanity checks regarding the passed values are already
>> there in grant_table_init() resulting in panic in case of errors,
>> therefore no need to repeat them in create_domUs().
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  docs/misc/arm/device-tree/booting.txt | 21 +++++++++++++++++++++
>>  xen/arch/arm/domain_build.c           | 11 ++++++++++-
>>  2 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
>> index 87eaa3e25491..3879340b5e0a 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -223,6 +223,27 @@ with the following properties:
>>      the default size of domain P2M pool, i.e. 1MB per guest vCPU plus 4KB
>>      per MB of guest RAM plus 512KB for guest extended regions.
>>
>> +- max_grant_version
>> +
>> +    Optional. A 32-bit integer specifying the maximum grant table version
>> +    the domain is allowed to use (valid values are 1 or 2). If this property
>> +    is missing, the value specified by Xen command line parameter gnttab=max-ver
>> +    (or its default value if unspecified, i.e. 1) is used.
>> +
>> +- max_grant_frames
>> +
>> +    Optional. A 32-bit integer specifying the maximum number of grant frames
>> +    the domain is allowed to have. If this property is missing, the value
>> +    specified by Xen command line parameter gnttab_max_frames (or its default
>> +    value if unspecified, i.e. 64) is used.
>> +
>> +- max_maptrack_frames
>> +
>> +    Optional. A 32-bit integer specifying the maximum number of grant maptrack
>> +    frames the domain is allowed to have. If this property is missing, the
>> +    value specified by Xen command line parameter gnttab_max_maptrack_frames
>> +    (or its default value if unspecified, i.e. 1024) is used.
>> +
>>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>>  for the DomU kernel and ramdisk.
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index bef5e905a73c..29b2f3e1faa2 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3871,7 +3871,7 @@ void __init create_domUs(void)
>>              .max_maptrack_frames = -1,
>>              .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>>          };
>> -        unsigned int flags = 0U;
>> +        unsigned int flags = 0U, val;
> 
> val should be uint32_t
ok

> 
> 
>>          if ( !dt_device_is_compatible(node, "xen,domain") )
>>              continue;
>> @@ -3940,6 +3940,15 @@ void __init create_domUs(void)
>>              d_cfg.cpupool_id = pool_id;
>>          }
>>
>> +        if ( dt_property_read_u32(node, "max_grant_version", &val) )
>> +            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
>> +
>> +        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
>> +            d_cfg.max_grant_frames = val;
>> +
>> +        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
>> +            d_cfg.max_maptrack_frames = val;
> 
> We need to be careful here because max_grant_frames and
> max_maptrack_frames are defined as int32_t (signed):
> 
>     int32_t max_grant_frames;
>     int32_t max_maptrack_frames;
> 
> I think we should have a check to make sure we don't cause an overflow.
> For instance:
> 
> if ( val >= INT32_MAX ) {
>     error;
> }
> d_cfg.max_grant_frames = val;

Is following ok for you?

if ( dt_property_read_u32(node, "max_grant_frames", &val) )
{
    if ( val > INT32_MAX )
        panic("max_grant_frames (%"PRIu32") overflow\n", val);
    d_cfg.max_grant_frames = val;
}

if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
{
    if ( val > INT32_MAX )
        panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
    d_cfg.max_maptrack_frames = val;
}

~Michal

