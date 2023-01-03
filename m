Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EEC65BD4F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 10:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470511.730035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCdlu-0006Mh-Gv; Tue, 03 Jan 2023 09:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470511.730035; Tue, 03 Jan 2023 09:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCdlu-0006Kw-Dy; Tue, 03 Jan 2023 09:39:50 +0000
Received: by outflank-mailman (input) for mailman id 470511;
 Tue, 03 Jan 2023 09:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cMja=5A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pCdlt-0006Kq-Cf
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 09:39:49 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 687222b4-8b4a-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 10:38:42 +0100 (CET)
Received: from BN7PR06CA0072.namprd06.prod.outlook.com (2603:10b6:408:34::49)
 by SN7PR12MB6862.namprd12.prod.outlook.com (2603:10b6:806:265::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 09:39:42 +0000
Received: from BN8NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::49) by BN7PR06CA0072.outlook.office365.com
 (2603:10b6:408:34::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 09:39:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT085.mail.protection.outlook.com (10.13.176.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Tue, 3 Jan 2023 09:39:42 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 03:39:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 01:39:41 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Jan 2023 03:39:41 -0600
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
X-Inumbo-ID: 687222b4-8b4a-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbDtK9IN8dJyVC3JAft+EUdIKXjvw1pWdfjiTScHZYPs09NGXc4D8aJ5YCI4qOAoUg9EL2x4OEhE8CsG9kTYhh6xz3WOwQ7k263D4MYei7WkteBqNNSkZqAPrr/tz829tONYuYrdoV8hJgeAN/ahQUmCIWEUaf763T0l3oIFNMiK6BQ2++94wi14ffKsY9eAZp3gTp1UkWFyPW+3dLqzOboEJXmJraMTYPo/g92G2Bnoi3IeL/dI7w/eDCgoJVHs79r0rtCYEBQltGg6w60zCOhPhqfHZOWBTvdvOMlXt3tqZMcgXXWO2LhFLBZXyPMqnoZqzBU/cZjXlS6/4EgSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2ya0maJOkqbjYxQwcP9WS/1jwK67qwB1Qca1G3RDtk=;
 b=F6F11XGXRk69Tld0eJOrFiyWaWOEXOIK6UQnTP1QzEHJi7yQ4QNc/Zs489G1VNOEUN2pAKEzqGcHuMzGBmDKZTOTLbyXXvQ9q+52gwA5ex63hvERzB1PKLskX/HTgP9I8n4uKismrNQaJnhMAsX2KGcoWxsLTrPdH2BeJm6IGnGGz70Epn9a+0IDTlc0FzZM5VSgoutzvS1mvz0W0lGXHkm20x4FW0uYg5HSAn8PUPxgYZDSZyrznXEJnbfl/J2GTKmtLLUpxeqC0ufqQDXN1T82H3niroedVHXO8P8STpwWaW651FP/Jw0RvOMW6mmALUfUybxELJnFIlvMuLhA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2ya0maJOkqbjYxQwcP9WS/1jwK67qwB1Qca1G3RDtk=;
 b=KnP0mEITVSQ5oY11j3KQuwkwgnWejGpt+sTKzPu7dcD/gZ2XQuvAXJmVsP+5LCHn1rpD+mzoR9NnLT0st87XJEU1wdsanAYUzG/SX8hfzXr/ZlF1HU1jM4Apn1pRDk6+jUPHeM/q8x6bB0Ur0pIBMxhtmNHcOmRbFbo0R7QtXjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <562770a6-2933-43b8-326f-3bb6d8e0ce61@amd.com>
Date: Tue, 3 Jan 2023 10:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm: Print memory size in decimal in construct_domU
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
References: <20230102144904.17619-1-michal.orzel@amd.com>
 <2ddcaf95-03f5-81fb-3091-316b99201a1c@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2ddcaf95-03f5-81fb-3091-316b99201a1c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT085:EE_|SN7PR12MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1305de-deb5-47ba-ab1b-08daed6e70f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gD462IFkFzA3j870YILR/JGoo0/qrYGE9HS1pCVwXfmKCuxBFxf06d+/sNHC1l3iCRjO8h2+2KsnGSMp4CCJZfG8KpN9AuqyM3QzUYVyrwwsS3G2WcyZw17NsVQxKs8ytdZsTzgyIzdRgBpSvsta3SOsy/4FM3q8c1Dg/8CJG7nAszj+CKji32V9+gSVBYSqxG3oozjgSj0nJtXUNjg68w2AMpzitNd3xovbVFc7ae6optf9v3EFk8n2U3VQOACY+OuWuPyjfq56tEoSXZDWtyle8RW1Sd/VTb4Nv2yQXI7DE1Adff1taVVsaaWSJ0jVoySPeYqdkNxFYcNx2aZEQQ/OQDi7O2HvYBopaSXH9Syl8jrhQCsCZ1ac2EcyAFL2Ob0Axixy0vFCgIgoBkBJIoEEICtRnlsyDopQN6U4ecfD/av8UwH+5+DdoL5wg2ATmWPwhtYiM0z7tEASITjydQQRXkie7mWHgNfhC14Ia64bGJZNtZLt9V1DIdRghKOcZyqdv3WcONvUkF/kuZLvAU/9mfscoVXessWD+D1MuH5xXy12qYPnp6/r59xGeZQY3GHqCHkQqRW0HzZTfTGdVuY+tmgRLC5gorf6jsg9sYEIFgQOP/uJRV8GBgW+tXpwuZuMVEktyb8MrT83BNg8WBxH+sQGLmTXuvV2PlgD4ox45NxjA+hCcEwFr3X53krDxyUkvq2ZEDlS8g6RIt0/eWqSxY50BmhAicID22KFwZ6MERvQSjJys48Fqw1lil2JlvRq/W1ZMsxVQ+qucpP5lHQqQVSiLFyHEtMtsJ3aTzE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(70586007)(44832011)(31686004)(5660300002)(316002)(41300700001)(16576012)(2906002)(8676002)(70206006)(8936002)(478600001)(36756003)(36860700001)(110136005)(82310400005)(53546011)(6666004)(2616005)(186003)(83380400001)(426003)(47076005)(336012)(31696002)(40480700001)(82740400003)(40460700003)(86362001)(26005)(81166007)(356005)(22166006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 09:39:42.3473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1305de-deb5-47ba-ab1b-08daed6e70f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6862

Hi Ayan,

On 03/01/2023 10:21, Ayan Kumar Halder wrote:
> 
> 
> Hi Michal,
> 
> On 02/01/2023 14:49, Michal Orzel wrote:
>> Printing domain's memory size in hex without even prepending it
>> with 0x is not very useful and can be misleading. Switch to decimal
>> notation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/domain_build.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 829cea8de84f..7e204372368c 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
>>       if ( rc != 0 )
>>           return rc;
>>
>> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
>> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n", d->max_vcpus, mem);
> 
> I will prefer it to be printed in hex format with 0x prefixed. The
> reason being the mem is obtained from device-tree domU's 'memory' prop
> where the values are in hex.
No, I cannot agree. Refer to booting.txt documentation:
"A 64-bit integer specifying the amount of kilobytes of RAM to allocate to the guest."
Also note that in the provided examples, we are using the decimal values.
All in all it does not matter the notation, you can provide e.g. "memory = 131072;" or "memory = 0x20000".
I find it a bit odd to print e.g. 0x20000KB and decimal is easier to read.

~Michal

