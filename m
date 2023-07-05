Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A55747F76
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 10:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558824.873248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGxkE-0000yk-DD; Wed, 05 Jul 2023 08:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558824.873248; Wed, 05 Jul 2023 08:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGxkE-0000ww-AL; Wed, 05 Jul 2023 08:20:14 +0000
Received: by outflank-mailman (input) for mailman id 558824;
 Wed, 05 Jul 2023 08:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGxkC-0000wq-Ox
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 08:20:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0ae07f6-1b0c-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 10:20:08 +0200 (CEST)
Received: from DB9PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:10:1d9::20)
 by DU0PR08MB7811.eurprd08.prod.outlook.com (2603:10a6:10:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 08:19:38 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::68) by DB9PR02CA0015.outlook.office365.com
 (2603:10a6:10:1d9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 08:19:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 08:19:38 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Wed, 05 Jul 2023 08:19:37 +0000
Received: from b44fa89475cb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5374CC0A-280D-4627-8542-F03FB84132A1.1; 
 Wed, 05 Jul 2023 08:19:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b44fa89475cb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 08:19:30 +0000
Received: from DUZPR01CA0264.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::20) by PA4PR08MB5997.eurprd08.prod.outlook.com
 (2603:10a6:102:f0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 08:19:28 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::ed) by DUZPR01CA0264.outlook.office365.com
 (2603:10a6:10:4b9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 08:19:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 08:19:28 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 08:19:27 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 08:19:25 +0000
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
X-Inumbo-ID: c0ae07f6-1b0c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H65zncuAIbrAHpYAL+6dBnTEBxkAPNMlypNJxrtcj5E=;
 b=UeZLKvlu5LJ5x5649HploYTKDbWFlQu+Uy4cxEUjlSAM44RzXjzKFtMKLwNzmEocJAXFhkC2BLEfavXXcgNQ2A8h8diIW7qcQCm+Yn9gSnKk/PjUSFmS4+8yidsFAhaQQhbA8PehJ7qWe2W19ewvOtLu36Z+azhmlvWLybp0d+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55ee9fd851c434ab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3fL1ytcgOFVWMD6Beo5g54fsDE6+9kq7sZ8iiewoHg938N5CMlSgDj8iXnKefqB0fNMpRBXrUIbqheICEp46MmETQ0ips+BRnoMGCl26EVR8bY6lGanoJxqLpppWnJTRRd7aTPiXyIXuWKDaFfY4nh8AV8JjhhXw7qgeeRP4SUYiwRKQggWcQA/cXldfE+awgLw2MK1iS+1AmPA0I5hCnF2c0gLbszo/QphRtsTZlwGCA5Uc3+VW44z0MQxnZEX0EanB/ozBTV9oimltamdUi4YBtgH226rIcWaE8j7IzgQP6teniMwoVlDo5Ifhhkz+DpcS81CzemggPABDNjang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H65zncuAIbrAHpYAL+6dBnTEBxkAPNMlypNJxrtcj5E=;
 b=iZM+zILE5k95PjisUsfxtqCiD6kGLpENoqz+Eyd0X4SGmmE+ULIpphwQvGMOViSt1U9E8qieX+R9gieMVh05A6epES9Fe+BjYKTP5OrkVmlrQp2PtHAjv7SxO7rYO8VURFFlbISk1NO5ywUCi7T3BqXM6RvVq8OtI81eP3p9PW3GA9qNb1GW6axTutDw9vc5qYyfKnmTiB/W62jm96KresGGV21VPX86qrzq5GB0HgnzYuPyuQSdS/XkN99kEFMi96w/FNPu/9JVdPq5ztOPluG2c/g+TH9M/dPxvYPh/AAgKQy1iL4uITCqgY4VipaaUXAzaDOCERxWZlpfyd6jrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H65zncuAIbrAHpYAL+6dBnTEBxkAPNMlypNJxrtcj5E=;
 b=UeZLKvlu5LJ5x5649HploYTKDbWFlQu+Uy4cxEUjlSAM44RzXjzKFtMKLwNzmEocJAXFhkC2BLEfavXXcgNQ2A8h8diIW7qcQCm+Yn9gSnKk/PjUSFmS4+8yidsFAhaQQhbA8PehJ7qWe2W19ewvOtLu36Z+azhmlvWLybp0d+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <06760592-ab87-c6c8-83df-e9204fdedadf@arm.com>
Date: Wed, 5 Jul 2023 16:19:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 11/52] xen/arm: mmu: fold FIXMAP into MMU system
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-12-Penny.Zheng@arm.com>
 <1be18c29-511e-27eb-0970-adaa1c74ce82@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <1be18c29-511e-27eb-0970-adaa1c74ce82@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT016:EE_|PA4PR08MB5997:EE_|DBAEUR03FT008:EE_|DU0PR08MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecacef2-2809-4f9d-7c2b-08db7d3092f1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FytR5ABOjMblgM41p0DmG+a7ETKMoD74boiLbSwja2VwIqhzGt2IEYKB8qVmTHajN/0rSw1W8RueeH+XZkv4v/Mu509vwZAOafV/652/MrCKNYmOpfGHogPF5pQbewxZH1WSW/Kyk1SDb5LDqJgaIrmb0MJfz1MV0zQPhs/FGTN/KOAAfHNHfhWAHbWUxmSxJAKjeeVXYXKyVaHQDApscNF6v4D+ei0oti1a1pL7a91B6tkbQBsqeOdaLXB0pZk8e+NTmKPU9so8Jn0TXckG46A+j8jTejwAM4UPehHuQSk5LWX4NnqqG8cFe73QM0FDaz2Pv5T/Y3ow//Q+DZ7atTeHpacYoFn6eHdjWLVOwuV0OfoahHus23hkjzqDnvef7OZNwMoY+zVTtpRGtb01KkJlGsg58DMKu7Mt5uBMGJfn+l6spsVlcMdJCPEGIlNkLGaMplxdPD1jEaui+jk2EF9pEthFgDF8jDiAmeDtJNpnpEBek9JkzGmGE/2LGauAmvp9VtSjyq9oA2+Ig2Ut+T9XfCpAunTGPdhE97D3ppLw0lgQJAuUur4zAFwSVFsqIyuECamfIQw41ODujp9ge96SqhaEHIxxfHHlUWudKUqjIdSHM1to2M4P6Aqd5kKql13w3Bt34GJDNGtCVbwBKHcrBYyGfyXUcMoOlY8jnf1m+6TgDgYPLlVCviAd6yLM4g0SOXKW2HoqIWRKipZ1aXjF7XovjRQQGQdksIgO9BS5hD30P0ilEYc+qnQA/JHMAbmAoztTSDp7dVQNr861vtv33QMeEVlLO22VlzL2veNOZNQyECGe4Gl50zvvowrYFqNnBzMyGzYMfrRlB7RwGQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(54906003)(16576012)(44832011)(53546011)(186003)(26005)(86362001)(31696002)(8676002)(36756003)(2906002)(110136005)(31686004)(8936002)(5660300002)(41300700001)(40460700003)(478600001)(81166007)(40480700001)(4326008)(70586007)(356005)(82740400003)(70206006)(47076005)(2616005)(336012)(82310400005)(83380400001)(316002)(36860700001)(426003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5997
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9000dc77-78c0-44f0-bd4f-08db7d308cfc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9zJNNDQWNGBN2OiVLTTxhiEzb/zhQSFyKbW4QntNpdIDlxg9LjHcy7vIb7T9mzb7gqvXOu9eWdU7QV9ikVKpGo+WK3CC+kpBIaCCN55hnLOfXbzUhZSvGFXZpPq8kEl/SoHq+nmztZu+JXqkw/Mk/jfds63VB8b4IntMKjle5XAW8kV+v+o05c70m3wNhGetnYaE0qHl76ccKsUInwWXUWhk2R1USJ0Y+0RlbwzTvndgmB+L+6YLOkzT6aJU+BZ3eiOkM44w7hw/chqvsNx4EfNqmkxygU8SLsfeHzoEZ4TXNtOFKf2FRBpm60J62R+9Ux0/P3nc6ks3b0VnhN/Qig6uBSzImb4cBkqr8ujqrGF9HzTZ/KAe/Qr+6KiXB+awcjTfoduf0ZZL/gBlxxE2/vTblUWFR3GLEhIIs1njPzijJHFV0/7Uk9TIlbR6sdDO1yGa3Hfla2g9RvvEvV9ZZ8jt1dSAJsPpwtcJYGDZm/SUbwJVlR68T91lMXQ+BD83FmGiPY5kNzMernKZfSjn284FeQXnMcrM+t0SydFcHBBj/3gLgDXl4xQybLW6UfXIEw6NlcA1mE3Q4ezEFh7pSCZ1xS9iJ3DSQ+4T1IN9eNmfNg5Nrfl5vKST0nUuhKhD5EiJT+3/jumv2HhNhIwa8ILr9Icj6bzYbRUsz3atlchoCiq4EOZaJoV/2vkxoPTHVPbWs6a+18eea/wNX8/oU1Ew5j4eEZzN+/J+DgsmJHVdEF6W+PxZIVNzEG/4A0nZ+qGqVOSdjR8uSUtZuwJrrh8HAszwWDaZM8FDr0MUoZMDL2+Hi8dV2BdZ0gUVXH7p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(81166007)(316002)(70586007)(70206006)(40460700003)(16576012)(82740400003)(40480700001)(4326008)(186003)(26005)(53546011)(478600001)(36860700001)(31696002)(110136005)(54906003)(47076005)(82310400005)(336012)(31686004)(2616005)(426003)(83380400001)(8936002)(2906002)(5660300002)(44832011)(36756003)(86362001)(8676002)(41300700001)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 08:19:38.0258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecacef2-2809-4f9d-7c2b-08db7d3092f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7811

Hi,

On 2023/7/5 06:12, Julien Grall wrote:
> Hi,
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> FIXMAP in MMU system is used to do special-purpose 4K mapping, like
>> mapping early UART, temporarily mapping source codes for copy and paste
>> (copy_from_paddr), etc.
>>
>> As FIXMAP feature is highly dependent on virtual address translation, we
>> introduce a new Kconfig CONFIG_HAS_FIXMAP to wrap all releated codes, 
>> then
>> we fold it into MMU system.
>> Since PMAP relies on FIXMAP, so we fold it too into MMU system.
>>
>> Under !CONFIG_HAS_FIXMAP, we provide empty stubbers for not breaking
>> compilation.
> 
> Looking at the end result, I can't find any use of set_fixmap() in the 
> common code. So I am not sure this is warrant to provide any stubs (see 
> above).
> 

Yes, you're rignt.

I think we do not need to provide stubs for set_fixmap/clear_fixmap, or
even for virt_to_fix(), if we change the static inline virt_to_fix()
to the definition in mmu/mm.c

>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v1 -> v2
>> - new patch
>> ---
>> v3:
>> - fold CONFIG_HAS_FIXMAP into CONFIG_HAS_MMU
>> - change CONFIG_HAS_FIXMAP to an Arm-specific Kconfig
>> ---
>>   xen/arch/arm/Kconfig              |  7 ++++++-
>>   xen/arch/arm/include/asm/fixmap.h | 31 ++++++++++++++++++++++++++++---
>>   2 files changed, 34 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index fb77392b82..22b28b8ba2 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -15,7 +15,6 @@ config ARM
>>       select HAS_DEVICE_TREE
>>       select HAS_PASSTHROUGH
>>       select HAS_PDX
>> -    select HAS_PMAP
>>       select IOMMU_FORCE_PT_SHARE
>>   config ARCH_DEFCONFIG
>> @@ -63,11 +62,17 @@ source "arch/Kconfig"
>>   config HAS_MMU
>>       bool "Memory Management Unit support in a VMSA system"
>>       default y
>> +    select HAS_PMAP
>>       help
>>         In a VMSA system, a Memory Management Unit (MMU) provides 
>> fine-grained control of
>>         a memory system through a set of virtual to physical address 
>> mappings and associated memory
>>         properties held in memory-mapped tables known as translation 
>> tables.
>> +config HAS_FIXMAP
>> +    bool "Provide special-purpose 4K mapping slots in a VMSA"
> 
> 
> Regardless what I wrote above, I don't think a developer should be able 
> to disable HAS_FIXMAP when the HAS_MMU is used. So the 3 lines should be 
> replaced with:
> 
> def_bool HAS_MMU

Understood, will fix

> 
>> +    depends on HAS_MMU
>> +    default y
>> +
>>   config ACPI
>>       bool "ACPI (Advanced Configuration and Power Interface) Support 
>> (UNSUPPORTED)" if UNSUPPORTED
>>       depends on ARM_64
>> diff --git a/xen/arch/arm/include/asm/fixmap.h 
>> b/xen/arch/arm/include/asm/fixmap.h
>> index d0c9a52c8c..1b5b62866b 100644
>> --- a/xen/arch/arm/include/asm/fixmap.h
>> +++ b/xen/arch/arm/include/asm/fixmap.h
>> @@ -4,9 +4,6 @@
>>   #ifndef __ASM_FIXMAP_H
>>   #define __ASM_FIXMAP_H
>> -#include <xen/acpi.h>
>> -#include <xen/pmap.h>
>> -
>>   /* Fixmap slots */
>>   #define FIXMAP_CONSOLE  0  /* The primary UART */
>>   #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
>> @@ -22,6 +19,11 @@
>>   #ifndef __ASSEMBLY__
>> +#ifdef CONFIG_HAS_FIXMAP
>> +
>> +#include <xen/acpi.h>
>> +#include <xen/pmap.h>
>> +
>>   /*
>>    * Direct access to xen_fixmap[] should only happen when {set,
>>    * clear}_fixmap() is unusable (e.g. where we would end up to
>> @@ -43,6 +45,29 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
>>       return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
>>   }
>> +#else /* !CONFIG_HAS_FIXMAP */
>> +
>> +#include <xen/mm-frame.h>
>> +#include <xen/errno.h>
> 
> I think they should be included outside of #ifdef.
> 
>> +
>> +static inline void set_fixmap(unsigned int map, mfn_t mfn,
>> +                              unsigned int attributes)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}
> 
> If there is an interest to have a stub, then I think we should be using 
> BUG() because if this gets call, then it would likely crash right after 
> when the user tries to access it.
> 
>> +
>> +static inline void clear_fixmap(unsigned int map)
>> +{
>> +    ASSERT_UNREACHABLE();
> 
> This one might be OK with ASSERT_UNREACHABLE(). Yet, it might be best to 
> use BUG() as nobody should use it.
> 
>> +}
>> +
>> +static inline unsigned int virt_to_fix(vaddr_t vaddr)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return -EINVAL;
> 
> This is a bit of a random value. This may or may not be mapped. And 
> therefore any user of the return may or may not crash.
> 
> Overall, it feels like we are trying to just please the compiler by 
> writing bogus stubs. It is going to be hard to get them correct. So it 
> would be better if we have no use of the 3 helpers in the common code.
> 

Agree.

> 
>> +}
>> +#endif /* !CONFIG_HAS_FIXMAP */
>> +
>>   #endif /* __ASSEMBLY__ */
>>   #endif /* __ASM_FIXMAP_H */
> 
> Cheers,
> 

