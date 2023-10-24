Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30727D5BBB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 21:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622589.969570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvNKT-0004ig-8H; Tue, 24 Oct 2023 19:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622589.969570; Tue, 24 Oct 2023 19:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvNKT-0004gx-5j; Tue, 24 Oct 2023 19:44:41 +0000
Received: by outflank-mailman (input) for mailman id 622589;
 Tue, 24 Oct 2023 19:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FS8+=GG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qvNKR-0004gr-5m
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 19:44:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c32e09b2-72a5-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 21:44:37 +0200 (CEST)
Received: from CY5PR15CA0136.namprd15.prod.outlook.com (2603:10b6:930:68::24)
 by DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 19:44:34 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:68:cafe::dc) by CY5PR15CA0136.outlook.office365.com
 (2603:10b6:930:68::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.34 via Frontend
 Transport; Tue, 24 Oct 2023 19:44:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 19:44:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 24 Oct
 2023 14:44:33 -0500
Received: from [172.30.200.120] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 24 Oct 2023 14:44:32 -0500
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
X-Inumbo-ID: c32e09b2-72a5-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsqPCxP5UZXvLV0aN+Tues5wqGR65hEcco90RxANJImF8p/W84KW6uINfkCMxXh0fMx1ppYnDIsC5x44pE7WUoHsCqCfGno0ZBxlS5CWLZ8+75eBEy02BPlzpVYd5XTlctLbAyOT257ryUzj+qjcXV7izh7lzwm5zPM22H6nOBpjv515HCLFbGxXYmyFWzMPKmxBFMzHL5OyGjsuIsYU+ec+NdnsUah/GgIAmcJ4DHAgufbH01rodE/4tv90a4XJFK8hppoeJjC8OEL7Sxlw5j+tE6xGZGFW46SLshRc9q52dzX+B98XOoJZnAOA1QDsrWT1Gijay9/xLoQb43KYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkPEFbLCCb2u6fSIy2cDaLpf2HhiawQtoWBdFTj1h+Y=;
 b=h9zfOVn4RvQptK8DArZ+utZscg9kfb1nZ6oFR4ZXijHztKUrlG22pSPs7Uko+mFgAnGBNWOTKn8XsT4GtWC88qMtgmItKUB1jBDtz7Bw3EcDYg+CD5gygqVEy3DxsVg487AQQC0gktKLVl2UpmUW7M7ABca1CxNHFhNSa4+pS+v/iFC7Hh+F3dPNBdbPYyCwv6tScQReXtJ1hBjJs9dnR9uxJ2ovmGuWIOco14oYUFfvMOCQiXZBh8B+BEtPfy1SEYY8hsxKg9PNHDy0w5/QYnuFobdHl6t9DsMopvjwhB54fFglQIUdEFlsZKiemSWaMiEr46MHuJ/boooI5gHVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkPEFbLCCb2u6fSIy2cDaLpf2HhiawQtoWBdFTj1h+Y=;
 b=SsJUsOT02oSK/AjH8DHAdYK2+CDzJtfDm2yxnUBS5WzhPH0GQuscm+O6htOMwpNoqRHnOnu0A9FrQcOu7ceeSDa35AgmX1ndaFyDZk5PYG24bbryqblHqV7jGXxtcZOh7r3o5gE4+JUj0JHGfbPmac0dxJM4zrd4ioApqzTHYLY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d0ca7ff1-497a-4d54-a3c3-1eddad573717@amd.com>
Date: Tue, 24 Oct 2023 15:44:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/17] xen/arm: vpci: permit access to guest vpci
 space
To: Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-17-volodymyr_babchuk@epam.com>
 <137af760-91be-21de-6033-8db1b8b7ef6e@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <137af760-91be-21de-6033-8db1b8b7ef6e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 8061be66-7734-4250-0cdb-08dbd4c9a5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j3tJYE8e4KH2AjJ6OVTiZNE4OmX7ozkXqLJpAPHznUBn2L51TwRXIGcxADDHJ4BxN6rIJrdKyl/HOq0Kd0DBKsfVaesJKYteBfswou0MxxJTH6moRYQNNSg5eEsVpM5+D4Ck46+xiuTGpXH+4wP5CxpfobdiV7Hee4W+gHMEUU9/b6xA0X6sDkSh09fe3cS4RIASzbgBmPHny8rgS9NakiMme1X5Ec0yn1bmSpDsi0rWFBIq/8T62mNf5bINWB/8KAVZQoj5T4YVojJBy+ui+8VoRQ+b8JR6BEzQ85HsKmc03wT67i0pi5xwcS0G2owPTFGpt8agJWNWmoTVVyVdpURAqWqV05JBLAlTDDWSUpeDa9cab3S/2LLKEPK5o2HGr9R4e/QVNn2GIHZEjPb+OTirfqsTWpsXQmRSk0TRyENPefEaNYBIWpCjerKxqnPONrIFWQ96OyXCjA1sbwv1WH1cur0NTJgO7HP6iKHwt17kgwufXOB+NQQaGZAbVfbVMwF+NDFCXKZnwl5czPqEagkT6K0WsOmu7/lq+I1Cm3YHlTuPQ4/4Cz4EUZ3SFRRmxq06QAWpkI7Q9JON90MCM+AVA7CwaUW9iQgXD1L5MwDpEs5C2pdKp7BfBI3sVQNISe011P3kUtznl82BMf1JesGTVIOpIM1bpPmwiWhqTDD028+GKbcBbbVcISMbutJkLrl/VY1mTbI4C6Rr9uRbm73JB3F00j7bc6XejFbapT1d77JEjVTmMO6Rr4filgN9zfieQdGbg/2skHaqe5Giz2l1Yaeb+I3yJAe8pW4oFCWS7d6r/byYk9Kns/zVQXk8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(8936002)(4326008)(8676002)(44832011)(41300700001)(2906002)(40480700001)(40460700003)(5660300002)(110136005)(53546011)(82740400003)(356005)(6666004)(36756003)(81166007)(36860700001)(83380400001)(70206006)(47076005)(2616005)(426003)(336012)(70586007)(86362001)(31696002)(31686004)(54906003)(26005)(478600001)(316002)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 19:44:34.0302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8061be66-7734-4250-0cdb-08dbd4c9a5fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889

On 10/16/23 07:00, Jan Beulich wrote:
> On 13.10.2023 00:09, Volodymyr Babchuk wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -695,6 +695,9 @@ struct domain *domain_create(domid_t domid,
>>          radix_tree_init(&d->pirq_tree);
>>      }
>>
>> +    if ( !is_idle_domain(d) )
>> +        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
>> +
>>      if ( (err = arch_domain_create(d, config, flags)) != 0 )
>>          goto fail;
>>      init_status |= INIT_arch;
>> @@ -704,7 +707,6 @@ struct domain *domain_create(domid_t domid,
>>          watchdog_domain_init(d);
>>          init_status |= INIT_watchdog;
>>
>> -        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
>>          d->irq_caps   = rangeset_new(d, "Interrupts", 0);
>>          if ( !d->iomem_caps || !d->irq_caps )
>>              goto fail;
> 
> It's not really logical to move one, not both. Plus you didn't move the
> error check, so if the earlier initialization is really needed, you set
> things up for a NULL deref.
> 
> Jan

Good catch, I'll move both along with the error check (and I'll coordinate the update with Volodymyr). Thanks.

