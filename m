Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9740C6C1183
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 13:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511866.791227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEJ1-0005Tb-3P; Mon, 20 Mar 2023 12:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511866.791227; Mon, 20 Mar 2023 12:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEJ1-0005R8-0O; Mon, 20 Mar 2023 12:08:03 +0000
Received: by outflank-mailman (input) for mailman id 511866;
 Mon, 20 Mar 2023 12:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K00X=7M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1peEJ0-0005R2-8S
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 12:08:02 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da54e2e6-c717-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 13:07:59 +0100 (CET)
Received: from DS7PR03CA0225.namprd03.prod.outlook.com (2603:10b6:5:3ba::20)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 12:07:56 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::cd) by DS7PR03CA0225.outlook.office365.com
 (2603:10b6:5:3ba::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 12:07:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 12:07:55 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Mar
 2023 07:07:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Mar
 2023 05:07:16 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 20 Mar 2023 07:07:15 -0500
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
X-Inumbo-ID: da54e2e6-c717-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKRHfmNwe/ShABzLw4YKDHoWFC4X0lGxdsTmpsJxx3cCratyaal9vTlndRfsw7DYB0Nr5k/8OuZJWZmO7tg5opn2v5z4fShYoKMpxVCIduujgR0AziWxcxrP/6pjVK+2H3XgkBOPYO67NW4M2r0ogSQalT31syBsyG4eH/xBsaPe2UIVPt+y8nWhFJDnaawQn/DbYXlimaAaRS9EvZQXH4ckJ1W9eRQg3HbtyKv7/ozdiElVWj5tMIJD+uPxUnfEdwYzX3iwWU01qQZXRT3uq6bLwXSGbPS0OteJaL3Ota3s0zs8Y6PshKzqSfjN9xu7bA2yPq4ZegPXo2lWErpxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcJfHW7V7WCx4Bghj5Ua12hi3VvRDijDqJLLw2enHlE=;
 b=BknAOm16mkaedBkNVqG0dCPQCfKT6KjfKiwuSU/BJv+KBAuSq/19pbjsbgsOCsjhUPxnpyMwi4SK01PwFpOSbOBgVSmaofg59y72d4emH+Z+mA7Li91KwC5uId6AML9cO/grCccwCYjiNxeIdsUOJtCEp15vdH4c4zrsaVkycv3zoG97iObASBrLQYlfRsfybK+ncgtmkoNNMxvxdmy955a1M/7wV01v4RR01QacLWDv+c0PGWCyguckL9VsC5CRqNhL65bC/DGulwm2Nuec4oBexEut11Q2Gch44J4eNfCt6u8OzNOlxSTv/FQKWk8TzleT0ovyARsTcK0qkpTRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcJfHW7V7WCx4Bghj5Ua12hi3VvRDijDqJLLw2enHlE=;
 b=2GLuAM/6Ee2TpIKPcoSoRqfEumpM8Xy1bUzNlQ2ubSsGKwmnh8Tujf9mrXzSFjjzp/zMDwzDXqK4PdHvxYDJEUOIcUb6RU6vvzyn4CnOk63do1joEejDCKISkaRbYBNoTxGO9XfJRKrBOa+pNLA1VBbTjOAANQARUepmhaZqrI4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <66a3b439-478c-64c9-c713-b3ce6d3b779b@amd.com>
Date: Mon, 20 Mar 2023 13:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] xen/console: Skip switching serial input to non
 existing domains
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20230320081935.18367-1-michal.orzel@amd.com>
 <39426526-c576-e3e3-4cb2-d3741d447bdd@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <39426526-c576-e3e3-4cb2-d3741d447bdd@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT057:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b416e4-2169-4115-f7ff-08db293bbd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h4/DHCgN3UIBFwLVmQ8JyjsO++dL3/KvcYUDRQOR2iJQxgo7BxSJnzIrMERW0x3CJiui0sYZVs0zO+z603bpj0/yTjIOOdV1AFZ+UbvmgX612jE54vBuOUXkm8Phcm89ax0EDZiveW1j2yYzsYInr/8nZn3NARlAWbFJV6f+lUzEMeNBMGToaCAPO7N7CkQnt0XBpeBXyUZme7Gci8Lw2Z8aqOf05o1eqnxud7UzX0nYc8n+58uLCiey7XsqMcFKvhHIwjjb4csSzatT6MOuuZB4oxke4+qQIQa9uR8ih3i/b7x8NmbiyzUAnCxV/VLcr5ITHHnXVbMbzjtJbYqASDA2l5S9NcUtmVSwd9DYHB3oQCyKkipwFSS18kHHqerT6HMdu0ECNpN9/wKaEbukVBhWUaUJS0uYY+1dC6YaqlUmLS5D5vtK2ogGW2oeBdbftHwXHSrlnmVlilC4YFPNCL8feByFoZ1vYjYHojQMnJOrg5IVzx1mCvLUUwjW8RxClE6n3MJ8lKvO6hq/mBIUnOz1xAYyldYvACkU7ctg8+clYYOZKaTZM5sia2fe1J7BB6ikf5LNC6LX2PUI+aqMLG3R9OXbfAmh8yuUR3/7psSwuLzj0vflrNABq7yO2eUR03JAWY4DQr5FWQS1JyWMrT6cvNYb6xqBOt8d164aqSIESzKFzLL/lSiVS9wKdMxu87cnbKobdtq7PMGVet1RxGL0CHrHynEfytd9ulLgvAMmPQrxJ0YN2BSqNRoNPycJCwWKNXMoXo7bFcTIabFblw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199018)(40470700004)(36840700001)(46966006)(8936002)(5660300002)(2906002)(426003)(47076005)(31696002)(86362001)(83380400001)(36756003)(40460700003)(53546011)(26005)(186003)(40480700001)(2616005)(336012)(44832011)(6916009)(8676002)(4326008)(316002)(16576012)(356005)(41300700001)(81166007)(31686004)(70586007)(70206006)(82740400003)(478600001)(36860700001)(54906003)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 12:07:55.7564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b416e4-2169-4115-f7ff-08db293bbd45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803



On 20/03/2023 12:17, Jan Beulich wrote:
> 
> 
> On 20.03.2023 09:19, Michal Orzel wrote:
>> @@ -483,15 +485,34 @@ struct domain *console_input_domain(void)
>>
>>  static void switch_serial_input(void)
>>  {
>> -    if ( console_rx == max_init_domid + 1 )
>> -    {
>> -        console_rx = 0;
>> -        printk("*** Serial input to Xen");
>> -    }
>> -    else
>> +    unsigned int next_rx = console_rx + 1;
>> +
>> +    /*
>> +     * Rotate among Xen, dom0 and boot-time created domUs while skipping
>> +     * switching serial input to non existing domains.
>> +     */
>> +    while ( next_rx <= max_console_rx + 1 )
>>      {
>> -        console_rx++;
>> -        printk("*** Serial input to DOM%d", console_rx - 1);
>> +        if ( next_rx == max_console_rx + 1 )
> 
> Part of the earlier problems stemmed from the comparison being == here.
> Could I talk you into using >= instead?
With the loop condition unmodified it would not make sense as it would be impossible.
However, because of what you wrote below, I will do this together with other modifications.

> 
>> +        {
>> +            console_rx = 0;
>> +            printk("*** Serial input to Xen");
>> +            break;
>> +        }
>> +        else
> 
> No need for "else" after "break" (or alike). Omitting it will not only
> decrease indentation, but also make more visible that the earlier if()
> won't "fall through".
> 
ok.

>> +        {
>> +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
>> +
>> +            if ( d )
>> +            {
>> +                rcu_unlock_domain(d);
>> +                console_rx = next_rx;
>> +                printk("*** Serial input to DOM%d", console_rx - 1);
> 
> While I expect the compiler will transform this to using "next_rx"
> here anyway, I think it would be nice if it was written like this
> right away.
ok.

> 
> Since you touch the printk() anyway, please also switch to using the
> more applicable %u.
ok.

> 
> With the adjustments
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> One other transformation for you to consider is to switch to a base
> layout like
> 
>     unsigned int next_rx = console_rx;
>     while ( next_rx++ <= max_console_rx )
>     {
>         ...
>     }
> 
> i.e. without a separate increment at the bottom of the loop. Which,
> now that I've spelled it out, raises the question of why the outer
> loop needs a condition in the first place (because as written above
> it clearly is always true). So perhaps better (and more directly
> showing what's going on)
> 
>     unsigned int next_rx = console_rx;
>     for ( ; ; )
>     {
>         if ( next_rx++ >= max_console_rx )
>         ...
>     }
Makes sense to me so I will do this assuming that you agree on adding your Rb tag also
for this approach.

~Michal

