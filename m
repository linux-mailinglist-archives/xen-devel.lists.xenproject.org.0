Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3F8039EC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647152.1009914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rABcI-0007Ly-Dq; Mon, 04 Dec 2023 16:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647152.1009914; Mon, 04 Dec 2023 16:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rABcI-0007JQ-Aw; Mon, 04 Dec 2023 16:16:18 +0000
Received: by outflank-mailman (input) for mailman id 647152;
 Mon, 04 Dec 2023 16:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y+Gv=HP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rABcG-0007Hy-DJ
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:16:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e89::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71e52d88-92c0-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 17:16:15 +0100 (CET)
Received: from MW4PR03CA0110.namprd03.prod.outlook.com (2603:10b6:303:b7::25)
 by SA3PR12MB7924.namprd12.prod.outlook.com (2603:10b6:806:313::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 16:16:09 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:b7:cafe::76) by MW4PR03CA0110.outlook.office365.com
 (2603:10b6:303:b7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 16:16:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Mon, 4 Dec 2023 16:16:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 10:16:05 -0600
Received: from [172.27.137.28] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 10:16:04 -0600
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
X-Inumbo-ID: 71e52d88-92c0-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipfg1Oa9AQP+JysetJ1xpNy61o2NXLcr++sTCwXUrx0TcoJs67sszfnEigSbTRFH1NCABc5a0mRL5sX1cC/ten7dEppnyRt9xE9SzxWNoN5RerIJQLCsTGZ90IVjyyKCi6wCrM6zt84mWjVXW89gj0i+TLf679j1e77b35LTEFMjQ6YpVBHlBhth9CWyrvyvm2pu1fyCRAphs7Xicy4PiM7icLExpWU6GdObpFYAIl0UVUEAtvz8FU3pPW0wUlUP8oa4DapgY4VtgYF2PFog1QU967aR7k/UduwgJ8aQiweg2L15TMJsklzxQrekpgOojqV82RPGF4xmyeq8x6s0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WWyHuCzZCX1QFVOEv+VPJ7iAgNzOwSmkPflLsMLbqs=;
 b=QXxo9J7+6CpxOxNp2+mlKjhbvlzxFkPklmHozvgmw729ZxnjQa0grnM0vZWlPL1+P/pZ3l54NDLS9gHWUCJIF3glUryZIGrYRiRIvCzhCSKP1Mhb4AzNlh52wPTDUwP6rm0NyAh7Ks+THye0+aMwx3RP6WQI1JR8vwWjg7SP9CSszNngEpXSlmXhYvPU74qhgds4GlY5F8UjowQIC6mJCHrRcW6WjClJRDpVIJg6o1mc3lAhymaAZvr892HgL8yfyVlogH6QSbDK0qjfGY9Mg0m1Ia4Wlk9NctUlIcDK9ZHbUEaZP4qgnlAqz5foViQe80HZNbMFpjeY3vUnfhckYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WWyHuCzZCX1QFVOEv+VPJ7iAgNzOwSmkPflLsMLbqs=;
 b=R2mbh5UeqKihm06L2gJ957/LIDUw7bL4ph/+E7qz6qH/jHJuzeoCorwc5HO6OcM5h06azPCg3cL4/0clqZBiLGP32B6b+XxBTKhgf0icDMXFf8FwpeROTtcTKMESSZy8SHGWHna6rZSG60ijD01T5233x+EsN70cUYrh5ZO/FHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4920dfd5-38b2-4122-8108-508aa643ddf6@amd.com>
Date: Mon, 4 Dec 2023 11:16:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 16/17] xen/arm: vpci: permit access to guest vpci
 space
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-17-volodymyr_babchuk@epam.com>
 <5bb1afc3-6de4-4b78-85a4-2610f5f1d001@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <5bb1afc3-6de4-4b78-85a4-2610f5f1d001@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SA3PR12MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: b58e54a3-565d-404c-85e2-08dbf4e451f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UQpC6LBFg8sm1WdUItIbik5I8frog8xdReDz6GyNxQh5VwDZw5FC50noNNp+eX5po7mko/5XibUXWHn9yJj6rzDK5l86cYn7cIagy/CmqfZaGaA20yZauFtd7O1NidqWRrE0RV7WOy4RZhJFuA798SdOkO/folk0mAar1o7/hJJwainQc0pF/e3h7kmZlVzm2fFMgEnFD1Wom/1IVafNwe2QInxcI7LSBbpBZRutNf6ACrekhSRSvJyEXQoWb+X1RSgjuJr3UqKuWL6xlahG8aI5qbnbWWte0KjJuK1vR/QBDHEvw3yx/3T6w5xI67S0WKBFmANZ/pAdI/0etXAYwCnMgb018n6J9lDc/yiN1Arab5re6YQckPMSLuXNE355gp4kgL7Ivl6YUic74D1yxmDF8KpUilkpm0Vg/Fr7bVNha9UUywCrvRqWMfH/HraPYOHIl0buAqmghFh+AI7pt59xtbactZC8ZYjUf8xn7fGuYNZod2oBzJqlzahFpKxzunOQgP7oc/jkCmgmFNN9AdR6Q6xF8YcMNU8XWM1OWpOT7+aD3wtS1FG8pknjpUiBhAXL9u4WFIkW68W+ZUEYciuOI+1GJhtTsbGjGj1470H1tId61IJ74aiVp5WP3jOpCuhlYlvIGXmP0yEoZYULir2XLLinQXGjwDZCpzEVnsl8QV06LBn5JXYH7aE5AQVTVw+yK9dSooJBj3YGtypvj6mBHW0BTe4aCWuhu6WAybAZvCYNL6i+SNWX4vWjgU0w34Ynf/Wh8WjCovtHYLBz66JRFTPZnBnsztSjVizB9/Huv8X33U6bnC8ygoJg9ITW
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(82310400011)(64100799003)(1800799012)(451199024)(186009)(36840700001)(40470700004)(46966006)(2616005)(83380400001)(426003)(336012)(82740400003)(8676002)(8936002)(4326008)(44832011)(86362001)(53546011)(47076005)(81166007)(40480700001)(356005)(31686004)(26005)(36860700001)(40460700003)(478600001)(54906003)(16576012)(70206006)(70586007)(316002)(110136005)(2906002)(41300700001)(31696002)(36756003)(5660300002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 16:16:06.5948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58e54a3-565d-404c-85e2-08dbf4e451f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7924

On 12/4/23 03:29, Jan Beulich wrote:
> On 02.12.2023 02:27, Volodymyr Babchuk wrote:
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
>> @@ -711,7 +714,6 @@ struct domain *domain_create(domid_t domid,
>>          watchdog_domain_init(d);
>>          init_status |= INIT_watchdog;
>>  
>> -        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
>>          d->irq_caps   = rangeset_new(d, "Interrupts", 0);
>>          if ( !d->iomem_caps || !d->irq_caps )
>>              goto fail;
> 
> I'm pretty sure I asked before why I/O mem caps' init would be moved, but
> IRQ caps' would remain where it is.

You did. Sorry about that, I made the change locally but forgot to propagate it to Volodymyr. I will reply here with the updated patch.

> 
> Jan

