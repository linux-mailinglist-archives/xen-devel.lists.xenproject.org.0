Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951917C4B05
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 08:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615219.956502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqT71-0007L7-DD; Wed, 11 Oct 2023 06:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615219.956502; Wed, 11 Oct 2023 06:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqT71-0007Hl-AA; Wed, 11 Oct 2023 06:54:31 +0000
Received: by outflank-mailman (input) for mailman id 615219;
 Wed, 11 Oct 2023 06:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiMa=FZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qqT6z-0007Hd-Ta
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 06:54:30 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04091429-6803-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 08:54:25 +0200 (CEST)
Received: from SJ0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:a03:3a0::20)
 by CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 06:54:22 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::a6) by SJ0PR03CA0255.outlook.office365.com
 (2603:10b6:a03:3a0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41 via Frontend
 Transport; Wed, 11 Oct 2023 06:54:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 11 Oct 2023 06:54:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 11 Oct
 2023 01:54:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 11 Oct
 2023 01:54:20 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 11 Oct 2023 01:54:19 -0500
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
X-Inumbo-ID: 04091429-6803-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jz2hobgeXMtJhgpIaKO2JVLxwV9aDcCEnjZnb2QyGUkp1QqxuqyKH+7dv925kgs7/37QAhrRJ6ySZH4D4picUMENrKs3GPmg98Z7Bb/z7b3WtCk2YV+MLy63vJsE/07sQsMMXwlpu942U3EimYIq0KqFITQEKvoI+jb4ZXJNbEramHvAWwNnnF+iwywA8kaEGCAuT/3gt+izXhrqzX84/1ocPuypOrD7ig/wT7ldKQ4mZ+IaEWYmsjyeVpTrQo0/tbd48ctjr7u16mh+yk3YxQ4cuYsgZpw+dWdHMXL4nXVS8zmDJSYHWHFuP94Q4c2OztRvf3iaj7BuulLFHygOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pP0Hy1gwjMcPU/hEs2ED01hHsHpiu72y//2bD4YicHI=;
 b=gLXAoBAGcxMOGlCsDeDs6Rkg1FgBhbiSq/UqRyYAyeRfHGQQAPgkj3JzYxLb/sAkwuG6jsi16Dy/itX4dPFDlhrLgOyKyroZpEJCuHeza5U9dTaaXs1SKRlTL+IW2JvK1Sh6HM2WJqHFmoWyhVRSMDQPd93tahD1LOHGHeTiQIEzX+GNHoZTFhMyNzggaZTPQjjN/SRVkixzmRjs2bnB+PlKITDXWLamN2KEsKqJxT+Wmvb4eYI+q4skPSTIOp/Rps2SgYoRLhRL2VYqKZgBxLOpiQWWtPWVQ83br/w69X+ffYP5hyKmAi/bm/kS7xf936thtKmV3V0vyk6NCyq5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pP0Hy1gwjMcPU/hEs2ED01hHsHpiu72y//2bD4YicHI=;
 b=nJcpd1FXmesmSZ2q9jw7oSq2bjyJpbJ58dc8RoKZQ/33uG88eY83vsn6w9J69VPI9QKbP6wP1JK9hcwbLI0rvsP+yUDDRkjQqyGSpNV0X0a4QBGFLgrhvyn1IT6NLOQiX6PBgfYZB3PX7iERbopR9+z5lM1QSHrSeDXhAopDFpI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <75bb3d92-af1c-4165-8ebd-1c17590361cb@amd.com>
Date: Wed, 11 Oct 2023 08:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Validate generic timer frequency
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
References: <20230928123435.2802-1-michal.orzel@amd.com>
 <d406c4c6-07f7-442f-8bef-8ba42308ae93@xen.org>
 <4894d46e-97ab-434f-b637-d516db6564ea@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4894d46e-97ab-434f-b637-d516db6564ea@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|CY5PR12MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa4f18c-0973-4076-63b5-08dbca26e5b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vOKQ0CK47o2DODqAjf4jHrAhypNYqMipoD9owPnDyD3pik5cGlNN3t9wEEb4jGMgyYGdVhW9vvIp+17h6Obx99HamH9LZouz2LByK6U47q/XOouZdGq8VFDVYvpGkD4M+Il/S3D4iRuXlwQsUshHia71l4GLo6Wki1wVywHHDsawAjOdV0Qx3usPjwY4fqGgF53G9odYCFZZs1+uYsLXVqWkvTXcsfXSNcHgP5oKRgRQY2T9+pMqoeK6riCH5xajxdngPC4C7m7MnDqg9iYTsgIiH8bMNHYTpoTdTHvwMFr9EJXhx6V4ASoSlNhdMn4sBHAoEuXqIifaIB37nmsusv80qVMlxygH2XGWuDV39tMjwuuAEhwEJX4V6b4GIQMr1P2vpO4/gCxaJYQrV+vN6Id6F2hE5MA+zzmZpKLgPz5E+G8ybiSAstejCclH2Y8J8f5F94MWpiRA7enwE853j0r7vl6bzXFVdlYf75I1k+t/1lkuA8fVQkQcttp+NhX0DsQ2Tpaskx3Mf1SW63zXY28ACPryh1HmKjJNSiF3Yqm6Oby0tFlydluwd9/5dlI9+jlwyNXFbN4h+fxoEeU1WoEUCadt0ayzamrTqIQKYDWDJ4rTO+MCqwii3RgWdBDPGE91Eg63iF6LWjUMQOSPokpzzI2SV72PRfn2ZpYamHrzmPbClXMDdDQmMP3ehzu8zXOWcKGixVjC7Hz7XG0LFhRLgGYRUsZuAO9zHmTWXJ2TObn2vmvvsiuxljgtf9uU2pUtu44b+Ps/n4sGpJkTsE9frOgLb+239MeIuAfWyMONnOFvhnh3pO2EpajOsO6uG3W4SfhEvSIxO3EVj3AtlQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(46966006)(40470700004)(82740400003)(53546011)(2616005)(426003)(478600001)(15650500001)(336012)(31696002)(47076005)(2906002)(70206006)(8676002)(16576012)(5660300002)(110136005)(70586007)(54906003)(4326008)(8936002)(83380400001)(26005)(40460700003)(36860700001)(44832011)(356005)(36756003)(86362001)(40480700001)(316002)(81166007)(41300700001)(6666004)(31686004)(41533002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:54:21.3219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa4f18c-0973-4076-63b5-08dbca26e5b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550

Hi Julien, Henry,

On 10/10/2023 16:48, Julien Grall wrote:
> 
> 
> (+ Henry)
> 
> Hi Michal,
> 
> On 29/09/2023 08:38, Julien Grall wrote:
>> Hi Michal,
>>
>> On 28/09/2023 13:34, Michal Orzel wrote:
>>> Generic timer dt node property "clock-frequency" (refer Linux dt binding
>>> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml) is used to
>>> override the incorrect value set by firmware in CNTFRQ_EL0. If the value
>>> of this property is 0 (i.e. by mistake), Xen would continue to work and
>>> use the value from the sysreg instead. The logic is thus incorrect and
>>> results in inconsistency when creating timer node for domUs:
>>>   - libxl domUs: clock_frequency member of struct xen_arch_domainconfig
>>>     is set to 0 and libxl ignores setting the "clock-frequency" property,
>>>   - dom0less domUs: "clock-frequency" property is taken from dt_host and
>>>     thus set to 0.
>>>
>>> Property "clock-frequency" is used to override the value from sysreg,
>>> so if it is also invalid, there is nothing we can do and we shall panic
>>> to let user know about incorrect setting. Going even further, we operate
>>> under assumption that the frequency must be at least 1KHz (i.e. cpu_khz
>>> not 0) in order for Xen to boot. Therefore, introduce a new helper
>>> validate_timer_frequency() to verify this assumption and use it to check
>>> the frequency obtained either from dt property or from sysreg.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Going through the list of pending patches, I noticed Henry wasn't CCed.
> Is this patch intended for Xen 4.18? If so, can you provide some
> reasoning why would want it?
Strictly speaking, lack of "for-4.18" prefix indicates that I did not particularly aim for 4.18.
However, I find it useful, so I will leave it up to Henry to decide if we want that or not.

Benefits:
- fixes the invalid logic the consequence of which might result in inconsistency when booting
  the same OS as libxl domU and dom0less domU.
- prevents spreading out the error condition (i.e. rate < 1KHZ) that can lead to e.g. Xen inability to schedule,
  by panicing with proper msg
Risks:
- early init code, no critical path, in case of an error, panic returned with proper msg - no risks AFAICT

~Michal

