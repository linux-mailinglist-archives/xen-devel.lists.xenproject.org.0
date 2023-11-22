Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3DB7F3FD5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638487.995046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iLo-0001Oh-6b; Wed, 22 Nov 2023 08:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638487.995046; Wed, 22 Nov 2023 08:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iLo-0001Lp-2x; Wed, 22 Nov 2023 08:12:48 +0000
Received: by outflank-mailman (input) for mailman id 638487;
 Wed, 22 Nov 2023 08:12:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbX3=HD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5iLm-0001Lj-ND
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:12:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea26ec85-890e-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 09:12:45 +0100 (CET)
Received: from SN7PR04CA0062.namprd04.prod.outlook.com (2603:10b6:806:121::7)
 by IA0PR12MB8255.namprd12.prod.outlook.com (2603:10b6:208:404::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 08:12:40 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:121:cafe::53) by SN7PR04CA0062.outlook.office365.com
 (2603:10b6:806:121::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Wed, 22 Nov 2023 08:12:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 08:12:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 02:12:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 02:12:39 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 22 Nov 2023 02:12:38 -0600
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
X-Inumbo-ID: ea26ec85-890e-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC7nwJsXsTGktogV+tEz+8rH8o8zWpsQM6g4sXmdClc99gTRHKkTIBUwMuRY9AGWZT4aD5/kIsiruq1hPLwAQNrWs5ssd88bJ8BxAXhaZB9HBF8jDMAuqjfcc/tfx5ByMFZq4uOgjOt54+X5VikMuwNRHV9Y5uMXogJmizlBEYJl7HRI2gH+uljoGaJ7W4Gdxs1PmdNHSeCoEStwpuO7jqjZO7hhHJrJjaxljALQOJi+h8KWYCJCy9Re2ryNqh6D3HCweoMyb0OD9ispNXn3nbNOOeRWYUlAHHoCe5ZMn5qYHluQgM3F3cfT8dsk6pjiTGx/H6mKEDm2/swBv2S10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8ERJNeRfxxQwgauL22aQuOgUX8ltsqn+hFYwIHtRYI=;
 b=Sd7DJ2F11tDGqlHWKMufkMQm33FR0BdZTZjbJr7xmS7fVFwWLiqYDb0ma2fskB6EiS0KLgw+YwI8mrBNFEaZXDX5IOiLdU1FFExaD74ukE9w0cPNyPopVwCdXdi4m2g7M/WqkgH4wPWhcsagdMF/0OZYnGdctF1n9My/fmNbynSmXAQkQigujITPumFGx58IAZfzC2o748dvsjFUeoD6Qr0PXrtohuPfEMRGM4y9T5VLmtnatlorQ4Gmzhd2pXGIR9+mKT9E4cwpXhVxpSjy32T9fc8J+rPWVoTfmN871iTSe/uW+NWI1ktsds2IfT3MN1xKT5tBg5gHI5APfspYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8ERJNeRfxxQwgauL22aQuOgUX8ltsqn+hFYwIHtRYI=;
 b=NJWNayR6LYaX5XjzlHkiyO4+pgu5c+yGqTAmOs7khLply4obIoAt3MV8WhMqKy+cEkyAGtG7QqYXi7SpPGh6QOBbyC13JtvW1RZZm0acrxwlk5YAduh77Xz0OcfyWqf2uzV4cTVYaQ0H1yICIwdsE1DudcKJeWS21r0PtZO1a6s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d7e76b58-d6ac-4b89-99a0-5cb77e4ffe31@amd.com>
Date: Wed, 22 Nov 2023 09:12:37 +0100
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
 <c32253c7-6907-4bfd-8a3a-9488539d19b8@amd.com>
 <b2706623-15bf-4ea6-9742-83a199ecf4f9@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b2706623-15bf-4ea6-9742-83a199ecf4f9@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|IA0PR12MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 168f90b8-ebec-4ad3-0764-08dbeb32cb8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jUuUUxNJVV9E5Iwq8gn4i/6BrRFSlntIR6DOU7FVVJxWcqeaD3zkBNeFT8SCVD51/liaz/NzswUyeR1yplo7laPNZr0ho/1jM3OK0ttMPTuXECjvGuPRtGSuEERQMnQSMiXyd1idoMiO1IgoV74oUr4UUMiVl0GCpwATxRTu9IYbpr+cnabspZvvfaXNpd1b2CjSVE5qrbhjDmT5Tboc+xj141BVA7+89MvQ5i2/vJUXxx1te84Gchh0eSOsrYXsRwofNSBGwv0nzp2Rl5cAESP+d07DQHbSfbLZuY4QB4ETrQoe0E1wZXixR/LPovPb8d6VSmrZFzvmuNY4nkTB1CLqjD0rClZEVtbIHQG8l/FpSB9LRf9ZkOWXGYzorjGP2eKlXAwPqq+LqxVmoonrsFEqHXN7M+QTtZ7oWI6se6NMKteIcl7oT3Vg7nQmsZTnFC+j0g/n5A8lpuVe4avY9sMHUn3HU9KJA4R2YZfHcbCEGaaFo2OPlovhA6AldSRNKj9HaQodjvDrAXlBeyzkTF+mFLkbWVSxjF4WOybg8F92KZRfdVdVnG5XY3GF19RCUtWFBQVAXzaqFa70OO9y6fPTeI26wFmvWnL00ZWsZ1Ttu+p1Tb1WMUjltcGL1X0CG8u7PKhs9ao+vw51Ze1rqYQ1DJqRSt7vHC9p/6+zY+A6LpeV1z+U12Nu5znuxpIaO6JRJRDmfN3Rq5vGwFVP8bGA3Eunj/aFJlP3w+l1pguc085q6O4Id6nY1KJ3pjuXda5yrxmKfdgg4OErIVWGAYrC5mCCJ6JvB5pvtSSelkvhPlGJkVuVDt6TAwPbug1D
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(186009)(451199024)(1800799012)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(5660300002)(2906002)(44832011)(40480700001)(41300700001)(8936002)(8676002)(31686004)(4326008)(16576012)(54906003)(70206006)(110136005)(316002)(70586007)(40460700003)(47076005)(86362001)(26005)(478600001)(426003)(36756003)(2616005)(336012)(83380400001)(81166007)(356005)(36860700001)(31696002)(53546011)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:12:39.8472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168f90b8-ebec-4ad3-0764-08dbeb32cb8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8255

Hi,

On 21/11/2023 19:43, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 21/11/2023 18:13, Michal Orzel wrote:
>> On 21/11/2023 17:30, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 21/11/2023 09:45, Michal Orzel wrote:
>>>> Macros load_paddr and adr_l are equivalent when used before the MMU is
>>>> enabled, resulting in obtaining physical address of a symbol. The former
>>>> requires to know the physical offset (PA - VA) and can be used both before
>>>> and after the MMU is enabled. In the spirit of using something only when
>>>> truly necessary, replace all instances of load_paddr with adr_l, except
>>>
>>> I don't buy this argument. The advantage with using "load_paddr" is that
>>> it is pretty clear what you get from the call. With "adr_l" you will
>>> need to check whether the MMU is on or off.
>>>
>>>> in create_table_entry macro. Even though there is currently no use of
>>>> load_paddr after MMU is enabled, this macro used to be call in such a
>>>> context and we can't rule out that it won't happen again.
>>>>
>>>> This way, the logic behind using load_paddr/adr_l is consistent between
>>>> arm32 and arm64, making it easier for developers to determine which one
>>>> to use and when.
>>>
>>> Not really. See above. But there is also no documentation stating that
>>> "load_paddr" should not be used before the MMU is on. And as I said
>>> above, I find it easier to work with compare to "adr_l".
>> I guess it is a matter of taste. load_paddr requires adding a physical offset to
> 
> I agree this is a matter of taste.
> 
>> calculate an address, where in fact we have no places in the code where this is truly needed.
> 
> I added adr_l only recently (2019). Before hand, we were using
> open-coded adrp and load_paddr (which was introduced in 2017).
> 
>> Seeing an instance of this macro makes me think that this piece of code runs with MMU enabled.
> 
> Fair enough. But how do you know when 'adr_l' effectively returns a
> physical address or virtual address? You could go through the functions
> call but that's fairly cumbersome.
I see your point but we already use adr_l in MMU code. Also, recently we accepted a patch from Ayan
for arm32 that does exactly the same - load_paddr is used only in one place in MMU head.S where it is required
(I thought we are aligned on this subject + I shared my plan some weeks ago). Ayan's change together with my patch
would make it obvious that we use load_paddr only in MMU enabled context. That is why I struggle to understand why nacking this patch
if you let the other one go. IMO this can create confusion for a future developer \wrt which one to use.

~Michal

