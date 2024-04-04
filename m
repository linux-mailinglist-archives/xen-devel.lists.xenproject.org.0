Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21A898416
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 11:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700766.1094403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJTN-0000GF-Dk; Thu, 04 Apr 2024 09:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700766.1094403; Thu, 04 Apr 2024 09:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJTN-0000EZ-Ax; Thu, 04 Apr 2024 09:33:29 +0000
Received: by outflank-mailman (input) for mailman id 700766;
 Thu, 04 Apr 2024 09:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsJTL-0000ET-J7
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 09:33:27 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6236dd7e-f266-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 11:33:25 +0200 (CEST)
Received: from BLAPR03CA0130.namprd03.prod.outlook.com (2603:10b6:208:32e::15)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 09:33:22 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::7c) by BLAPR03CA0130.outlook.office365.com
 (2603:10b6:208:32e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 09:33:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 09:33:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 04:33:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 02:33:20 -0700
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 04:33:19 -0500
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
X-Inumbo-ID: 6236dd7e-f266-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSUqWUXTzCT+/j72IWesg9d1H3qPe+Xjpk2zOi+fbGD20dbiGrQAawqNa7wNTAadvS0AkFskCyUCHaiz5h5fkZ/h9Z6NqdkTALeewi6kzTqhjW12glr2H+QndarTh+kd6wjTtO/QDzaMqvpXmafPeMTjLXcuNZe4OED9N3E5C+anuITpDyaNfQimO2m9XpjqioKCgevcJLlgnEMpurmYCPWn0U0yTX5GeEig3DnoCrQLA+w1KfnLBcxY36Vl3LCfto+rima2uvWpUq82fqeh0HBoNBC8KhLCcsYBtx5bMAni1y9SEvnfOtFey2TkEa02Mq8p35btDtngfbisAUqKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7XVk3eXm6kIotJRQSDjHuPdgRvu9LQVIsHzosGwGUs=;
 b=cKmS9+jYcsW9Rruo2AFMI75aAf8rX0GfmlryIBmC2TrBiMI9TccIQ66aCv8zEYzdlhhuZG0Yk7cGYl10BxzxtyKckJYfQvezzAIZP2Ps3U2uw1zXXmTQpRlhz7CGmFoTzNrvOqo+tB1Zer5OHqK/8nD5xKaNacPZOc9j4Ifgjx6n2dqMphmOS7ZtjUXbrozxOHvEpxm5YAIcVOyKMOvdbqSoW/+apd2fUPPpm3GFBLn1O3eQ0uHzDgC0RtdSQNz2YA7rvL5dpNaGghG+2lMoI/dyCc1238jrFkcAZUlsrIdvO4CQ4zZZdV8ni6P02eVXlWXPhTifmsyJyL20wKOkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7XVk3eXm6kIotJRQSDjHuPdgRvu9LQVIsHzosGwGUs=;
 b=UsGi9jGK7cBn1KKWjGXR7rCshQbIPoN6FRn8bd4K6GbnOGEf4VvLwONBiJsI5c2l41Dt+37sugW6rJb3Hvp4bYHj+TXnnGQYPHZHBZRHR+WYd+Bzwm3EXk3V7cu2Gz7XswmUwWX2TxT+/V2Rqgefpcg/gOH8CDGhIuZ+Su/m1uY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a1d3a8cd-b83c-492d-a729-7d331f8e14cf@amd.com>
Date: Thu, 4 Apr 2024 11:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] xen/arm: Conditional compilation of
 kernel_info.shm_mem member
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-5-luca.fancellu@arm.com>
 <0dd4d824-068a-4975-a1af-e194337a64b9@amd.com>
 <80AC304B-270F-4EB7-85BF-78B55D5C454E@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <80AC304B-270F-4EB7-85BF-78B55D5C454E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e140e51-fed4-42ff-079f-08dc548a4504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VPFfZFOFt8hZDFuxT0PlFFiBuP040crAkOF7oVnBfcq4iOO5pjipD1wG55PxC2pYWpBOPdhypX+dCP6ciGdx1Zw/e7479u0J8BcT/XYkE4nFCA2/9C8im1Ro6X3oxenItRHt1mPsvpcMVW/XIlWiWhvIalUZy7F8WfZJ6VecpgZpeiPCBJp9dxDWNsgun03Sz6STvzGlK3MDH27w0qRBrCWxn/p0uWVnu0EMCaz8PQIYdUTPXW852q62xH4SvGPMQ1FLBhDnwAbSWE+CPWh4GdTMUZ4xYktjRbt4z3X2hOY7uWmAfAaHiUJvn+kapmEnM43laAqKX5gS1q5QcupwpZbOp8GjSIQsYOluekjiivAZ7Gab9XvyE4IBup8t/fKeIYiSZJRHVWI4dpmonoGLKuoZao6IB+afEnj2ezGd9jfBXUSTvNzJpTRK4czhdYEaJZOlOYcM+uCktT21Sx1n+/nvmh8XdZlUl3KR13zno4FRWEfTpxM4Ggk5W/XqGP9Y9PMbjdla3tI53ekM40uICAY3cFIRILGkAbhBjkl5cB9zYPDtnaxaFlMPAigwOY8F/pfhy31Mkvgr1ig+B56w5Dnr+Lg66SHowKkTihloDi+89Sett6HKHvO+mSXQX0x4wZ3l6Eeve9S0ZwtEU8qj1EBKe82Tc1BoJb7gQCZOyOvskI+PPBbJl6HTKoRe4WrkKLYn5mn+XV9R5r+Ww5i67D5/wRbdP20kHvWrtWnD7AowSiWOx4/X4I7xPkJ+bBGi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 09:33:21.7379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e140e51-fed4-42ff-079f-08dc548a4504
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391

Hi Luca,

On 04/04/2024 11:27, Luca Fancellu wrote:
> 
> 
>> On 19 Mar 2024, at 14:58, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Luca,
>>
>> On 12/03/2024 14:03, Luca Fancellu wrote:
>>>
>>>
>>> The user of shm_mem member of the 'struct kernel_info' is only
>>> the code managing the static shared memory feature, which can be
>>> compiled out using CONFIG_STATIC_SHM, so in case the feature is
>>> not requested, that member won't be used and will waste memory
>>> space.
>>>
>>> To address this issue, protect the member with the Kconfig parameter
>>> and modify the signature of the only function using it to remove
>>> any reference to the member from outside the static-shmem module.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> NIT: I always wonder why we have hundreds of functions taking both struct domain and
>> struct kernel_info as arguments if the latter has the former as its member. As you are
>> revisiting the function and modifying parameter list, you could take the opportunity
>> to change it. But you don't have to.
> 
> You are right, can I do this modification as part of patch 3 and this one? Also, can I keep your R-by
> here when doing this change?
You can do this as part of patch 3 (afaict there will be no need to modify the argument list in patch 4)
and you can keep my Rb.

~Michal


