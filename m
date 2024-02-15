Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C595E855A1F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 06:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681222.1059863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raUGs-0008Js-As; Thu, 15 Feb 2024 05:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681222.1059863; Thu, 15 Feb 2024 05:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raUGs-0008Ge-7a; Thu, 15 Feb 2024 05:26:54 +0000
Received: by outflank-mailman (input) for mailman id 681222;
 Thu, 15 Feb 2024 05:26:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RjNl=JY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1raUGr-0008GY-0F
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 05:26:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1acbc87-cbc2-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 06:26:51 +0100 (CET)
Received: from BL1PR13CA0394.namprd13.prod.outlook.com (2603:10b6:208:2c2::9)
 by SA1PR12MB7150.namprd12.prod.outlook.com (2603:10b6:806:2b4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Thu, 15 Feb
 2024 05:26:47 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::19) by BL1PR13CA0394.outlook.office365.com
 (2603:10b6:208:2c2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29 via Frontend
 Transport; Thu, 15 Feb 2024 05:26:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 05:26:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 23:26:46 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 23:26:46 -0600
Received: from [172.27.131.30] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 14 Feb 2024 23:26:44 -0600
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
X-Inumbo-ID: d1acbc87-cbc2-11ee-8a4d-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY37+ZY0yvxYqFDLS8Qi3Wl42jClpieRu+pd677bL/zqlNHi7Rbp5wxvj5AuPgtLYx7Bv3QQqRG5dqCGStI4o4SrF49bbfG7yy3Oy9mc3qtLW3gSyfd6273oU/w0sZpPPvwniNfRS8KgH0YLsaQ3FB/Z1s9XD8VyperxOop9J/ve0emG1GeGA1S/rn0Is6YClBUlbfsEHB3BnG7jrJvVd4iTALGrRUtFRzk2b5VhdT4bevZo3qLo37fcVWOs5wNvIhc27zGZ7Uy/FaipbiYuZczStVEuKGpZIZS4oqyY2RFf9vOvnpJDE8UOMUt+pRNAUlLy7dxUzMYI34IbtLSmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGcn4dr4r7yoZtaNsJN7hiO4rVa2xVLAOV1RLsTcJwo=;
 b=DD6rywfTSn1aGTrV+5hiQGg5lV45xUriqI3JfzHHJnLKouWiVt5eywOZHmJXqh9OBsfFtZK27SvgvlKPxom05leLviISh/Y/AQ2/XGEG7dx0I9cNTDF2R6nSMmNb5T69WR5dXCqyTOPY3HJO59qw7gekVwhQONKqjnp1lldpoeuAZx2cnOvl0z1NUyDM8t+sSduuFHouQFuHbY++JdvUFbg0YeM4c4RXfCpwJsDO2fui3Tw1gwzLiw6Ep9ZM4fPfl0Hlly50jQQ2EVjIKwuQ20nsVaNyrIWHKb63jQnXAcyguH8HbceK72jElWcdEIIfHwFsZ74+BdOp+lM3Xx54CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGcn4dr4r7yoZtaNsJN7hiO4rVa2xVLAOV1RLsTcJwo=;
 b=0V6Qy8ZA2IrgPINUUjlvKXfzGp0L1IDautNpyWyalAoVh098D6KLoQcVCxwabgf5OsmC/Yxt9DryUvt0bF6GZIs1jwXE2p6dQdymQsiCgpQQPmSMUDBTFpYkDz6DDIGk3wDeRteaFWIRKh6e9NYshZugC9dCbYcT5ef0Dmb50s0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8b6fa7eb-cead-4758-b9d8-d1b4bf8b4c77@amd.com>
Date: Thu, 15 Feb 2024 00:26:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <123f4cc2-8fc7-4e2a-b44c-78a81b3a1a3e@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <123f4cc2-8fc7-4e2a-b44c-78a81b3a1a3e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SA1PR12MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: e85fdc8d-dba4-4de0-247c-08dc2de6b429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k67mp/fBZdMl0WwPXZ7VPSJxOQbYyj/Kdm3KlxSYXxcUnU+HqwRLSNQ4YWOv/9v5lxDaoHY2HKZFmM58i9ql/EorosL9D5E5fpOx1bI2xu8/wL8sDMxdIuf4IdM1oAv47Y8TWd5r3mWVAiGH16EvQ3BsXsHpSFWmpE16qi5Q+rZVWxQuViHhJYAH05DzmRrNpZQmak88KTS0w1aeFT8bied1XLywA8m0OiLrK/RxZHq2+r0vsVwFFBV6yYC5h68DMLFrDBC4ciTUyraCA2xsMeJYulVJXaubg2tQ1COb+/tN1SOnOQIRbS1Ky296pQGbUqttcEv0vol34o6J3ZBZqq5nn+O6EAPZnbVfk0dsmq/i6ST6KZSIYPomxeO5RJOSJbJuHe7ZbsxfQRIkHQsVq4pW9FVN4JEjtv5FuveDtS2AVN9BZaStrVnQt6JxLUtiAzOZgmqFxTLAwGUksAA7qBW0ekr4yIro1AoDhXT8r4/a0t1vpA9UX+KQIWcO0T8+HrT8ShnlOrTLfTsZWkyq0yFu5ss6jxoFFTH/wK0l7lQemEXb353ncKTi42jEo5O9TlfABoAcaJS+v6uZX4iAw6UauaGf5FeOCL5Rj5gR3hbk+Y7VZ7DuBxXVAZuY9hvvy6wY3Mm3mPhH92Ufnn4mNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(1800799012)(36860700004)(82310400011)(186009)(64100799003)(451199024)(46966006)(40470700004)(54906003)(7416002)(2906002)(478600001)(336012)(426003)(26005)(83380400001)(356005)(2616005)(44832011)(966005)(53546011)(81166007)(41300700001)(82740400003)(316002)(70586007)(70206006)(8936002)(8676002)(110136005)(16576012)(36756003)(31686004)(5660300002)(4326008)(86362001)(31696002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 05:26:46.7622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e85fdc8d-dba4-4de0-247c-08dc2de6b429
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7150

On 2/14/24 06:38, Jan Beulich wrote:
> On 02.02.2024 22:33, Stewart Hildebrand wrote:
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -123,7 +123,9 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
>>  
>>      case MAP_PIRQ_TYPE_MSI:
>>      case MAP_PIRQ_TYPE_MULTI_MSI:
>> +        pcidevs_lock();
>>          ret = allocate_and_map_msi_pirq(d, *index, pirq_p, type, msi);
>> +        pcidevs_unlock();
>>          break;
> 
> I'm afraid I need to come back to this: This is the only place where this
> patch retains (moves) use of the global lock. By moving, its scope is
> actually extended. It was previously said that conversion doesn't happen
> to limit the scope of what is changing. But with allocate_and_map_msi_pirq()
> being happy about either lock being held, I'm having a hard time seeing why
> here the global lock would continue to need using. To me doing so suggests
> uncertainty whether the checking in the function is actually correct.

I understand the concern. I've gone back and forth on this one in
particular myself [1]. I've tested it both ways (i.e. as shown here with
pcidevs_lock() and replacing it with read_lock(&d->pci_lock)). In the
analysis I've done, I also cannot find a need to continue using
pcidevs_lock() here. read_lock(&d->pci_lock) is sufficient. Let's be
clear: both ways are correct. The only reason I left it at
pcidevs_lock() for v13 was to make sure the code was doing what the
commit description and notes in the cover letter say.

allocate_and_map_msi_pirq() acquires write_lock(&d->event_lock), and
accesses to non-domain-specific data fall in the category of reading
__read_mostly globals or are appropriately protected by desc->lock
and/or vector_lock and/or cmpxchg.

I'll change it to read_lock(&d->pci_lock) in this one particular
instance (and update the description appropriately).

[1] https://lore.kernel.org/xen-devel/3c1023c4-25fb-41f1-83eb-03cbc1c3720e@amd.com/

