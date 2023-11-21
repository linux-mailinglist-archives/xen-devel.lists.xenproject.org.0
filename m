Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1087F35C1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 19:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638113.994424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5VFu-0005mD-3I; Tue, 21 Nov 2023 18:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638113.994424; Tue, 21 Nov 2023 18:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5VFu-0005iz-0c; Tue, 21 Nov 2023 18:13:50 +0000
Received: by outflank-mailman (input) for mailman id 638113;
 Tue, 21 Nov 2023 18:13:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqtY=HC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5VFs-0005it-Hl
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 18:13:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5ed4f01-8899-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 19:13:47 +0100 (CET)
Received: from BL0PR1501CA0001.namprd15.prod.outlook.com
 (2603:10b6:207:17::14) by DM4PR12MB6566.namprd12.prod.outlook.com
 (2603:10b6:8:8d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 18:13:42 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:207:17:cafe::d) by BL0PR1501CA0001.outlook.office365.com
 (2603:10b6:207:17::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26 via Frontend
 Transport; Tue, 21 Nov 2023 18:13:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 18:13:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 12:13:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 12:13:40 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 21 Nov 2023 12:13:39 -0600
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
X-Inumbo-ID: b5ed4f01-8899-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BH9uWCTMphyIlh4PTJsdx+NSTg3Pv4NlGTaOKyzQjT6xMLyWinBjlaXT40WADtZQ36/Z9BqIDqccfhYoAyykOOWRqDq+7RDMFE2uS/9S11cw4aJGge8zZ9Muie+7VRaUDXn65l9Sshwx0t4YraUzPJULCf6LoGndIumOE2LvGojrHxeandophWVp7V8iUyuJlhKapmfq/8uXPIclgSa+cUMMDN2igKn1jYBwN2WWZ3SpMAQgJvyZEf/BH2vBgGBBtYGQOdXgxu576emXNVK3CQWDaSWklCHXGljCwaWJ6/o4OBqgj2WbO+UtTlw2VxFJZKqqCnZ5g50fOS/wsuwx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWvDDmf+MlGd3n6JlABwV6dqDBkeEKlElvoX0caSkUI=;
 b=XaCwpd73lQ47ZXxOurPeXqEaqLI2kE0g8bTdxwcXZTIy+m+cWKfOtkPJBC5GI7vuQb5uHgeDYHafX08HB/OclSS5i0ujY8ZnlMuX4bkkvsNMop6y01qurh3sNB5pBGBM6WwDL/eF22YYV+EglOTT3P2BwpR4K69eLw2hpqiqyAoa9Zy5a5Wj/6067G3aJPE1IeQolYah+DqowE+OyCofpbVs2JOd0PCP64Y0wrBwN4CkfXt3uP6SVt7O8kqpQMLNuGCv4Km+LNI4i19R7onG9BtivFNtZgVOduP1gd5UR8+VfnHyJ5UcLFmU+Lcow6Pum8KooBQTgDfKaJX2YsXS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWvDDmf+MlGd3n6JlABwV6dqDBkeEKlElvoX0caSkUI=;
 b=dl+XguSj8klN7ypi11kZMqI0YiSjFlIWhyovk4nrffH+MV02Q0UbapBX6npLPubWE0TU74X+7Q+LPhqUYKrW6TdCerr00RhC5SQ1FosfnPM3dkLfxphrD6RYUBX/SS7f8dUd7Oaq84KDuTQebAMmGePruZSrgWcBE6E/j7astmU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c32253c7-6907-4bfd-8a3a-9488539d19b8@amd.com>
Date: Tue, 21 Nov 2023 19:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm64/mmu: head: Replace load_paddr with adr_l
 where appropriate
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-4-michal.orzel@amd.com>
 <d015e81d-16cd-4e93-80c9-ba6418a23b1d@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d015e81d-16cd-4e93-80c9-ba6418a23b1d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|DM4PR12MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dac7d2f-3ecd-4c7c-6c1d-08dbeabd9790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WPR4JGmpcL6Gb9JdkL7YYZElVBlW3w5jCMEtm7YMLORi5hRHw7uv5P0yCIhemxP+Gdaxu2/X7YtUjtEFWWMBd7Vd+eYYOby7vAnVGsR8MbEP0qSng2EQkHCO8dsapfATdHZhdStfjqxNISizTKTFgb+nsCUncvLd5lP6ewYbgj8YwMh8RUePpXbQCU3j3Kl1PMvaZVO2LxV01L+36JeuZmCLyqBQfmA+t8OKJUn35FzXektamd3y4SuOkmvJPP00or1zXfGn/QxFh5NTxat77fOA8CIBg94BCcU55ZFV9JkLjRwpQlakoW7M6R5z9YbKEHrvnDgEIzvyMfOGQtrWIhw+iSHlICftIuL2FJlK5UQaZMKx4kBGhRl6rIKKQbhe2ALrILip0y+JC5mR+n1/ctv6Poro5+DrjCl09Ds3SlWn6Tj8JwiIxX3f7TtS8+vNsNbKzqCZijqY7eR7kg+SLnpK4tZ3219zggF5FOFmDvrh4VKHVFiiL/X0tvX2vHmxTCh9WbOI94v+e6z5mrUXeck0BJhazsPNmRpm5LjYYvOL4nEHiby5UKrOQEW92Fl5WWMMBS8i515yye1iArarDdpRod0omvWekpO2zSLFBhxzUqJ+du6yi6cRvyt1NQjfHisIdz+IxzTgdH1fD73LSlxT/6xsDhpyeq7OflHIK246w75GfRvaQ3++nCYFl1OUE2fpv9roh0F+utXGcidB4MEidoFmmIDMs/gTLjdNoJUgBquNYQYbYx4mbDp595a1li/tHpMzKL1T07Esw/b10RWNTweZcyltrErQrxqOvEE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(82310400011)(186009)(1800799012)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(41300700001)(36756003)(86362001)(5660300002)(31696002)(40460700003)(44832011)(2906002)(966005)(82740400003)(336012)(426003)(26005)(81166007)(356005)(40480700001)(53546011)(478600001)(2616005)(8676002)(4326008)(8936002)(16576012)(70586007)(47076005)(70206006)(316002)(110136005)(54906003)(36860700001)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 18:13:41.5131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dac7d2f-3ecd-4c7c-6c1d-08dbeabd9790
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6566

Hi Julien,

On 21/11/2023 17:30, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 21/11/2023 09:45, Michal Orzel wrote:
>> Macros load_paddr and adr_l are equivalent when used before the MMU is
>> enabled, resulting in obtaining physical address of a symbol. The former
>> requires to know the physical offset (PA - VA) and can be used both before
>> and after the MMU is enabled. In the spirit of using something only when
>> truly necessary, replace all instances of load_paddr with adr_l, except
> 
> I don't buy this argument. The advantage with using "load_paddr" is that
> it is pretty clear what you get from the call. With "adr_l" you will
> need to check whether the MMU is on or off.
> 
>> in create_table_entry macro. Even though there is currently no use of
>> load_paddr after MMU is enabled, this macro used to be call in such a
>> context and we can't rule out that it won't happen again.
>>
>> This way, the logic behind using load_paddr/adr_l is consistent between
>> arm32 and arm64, making it easier for developers to determine which one
>> to use and when.
> 
> Not really. See above. But there is also no documentation stating that
> "load_paddr" should not be used before the MMU is on. And as I said
> above, I find it easier to work with compare to "adr_l".
I guess it is a matter of taste. load_paddr requires adding a physical offset to
calculate an address, where in fact we have no places in the code where this is truly needed.
Seeing an instance of this macro makes me think that this piece of code runs with MMU enabled.
We could in fact remove it completely and the only reason I did not is because you told me [1] that
one day we might want to use it.

[1] https://lore.kernel.org/xen-devel/2b10267a-514c-4c9b-b715-f65c26d7f757@xen.org/

~Michal

