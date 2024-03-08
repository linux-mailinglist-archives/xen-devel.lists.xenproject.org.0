Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A25875F5D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 09:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690144.1075907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVVM-0004HR-0m; Fri, 08 Mar 2024 08:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690144.1075907; Fri, 08 Mar 2024 08:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVVL-0004F9-Ty; Fri, 08 Mar 2024 08:22:59 +0000
Received: by outflank-mailman (input) for mailman id 690144;
 Fri, 08 Mar 2024 08:22:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riVVK-0004Bl-HE
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 08:22:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10f30a83-dd25-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 09:22:57 +0100 (CET)
Received: from MN2PR01CA0049.prod.exchangelabs.com (2603:10b6:208:23f::18) by
 BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.28; Fri, 8 Mar 2024 08:22:54 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::73) by MN2PR01CA0049.outlook.office365.com
 (2603:10b6:208:23f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 08:22:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 08:22:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 02:22:51 -0600
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Mar 2024 02:22:50 -0600
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
X-Inumbo-ID: 10f30a83-dd25-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK5JKkWX6i6hZH2Qrq/h3ifb8OsNqCBc38YMXSassGTXzqmPHq/IOoTcQI6bdt1ZPLdIPLNc2oaW8fJYMaakfwHVmd72dE+OdGBmvcAmLm0vqN5qgJHPPEOl0XqudeX76mnufKj1vUTwV+z3GBzOAVx/UbdYxZz+PqXsbuTtiB2MC1XPloKlEK6OSnpz2//KT4J5JhfMnYo3/s9mmUS3v60glV3E+EZPKyQaMAxkLJZoLkX3Tc6x2JCu4WObcCWs8AS689fOCu5DCFbmmD8NIFl/BUzJG5+KI3naYkZqGUOr+hvhPzKXi0k9e+zKuHkrWD3yUrTdD7odBresLCGTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qu6lGHsbzTEZviLMY0r5d8+iU6TwWvIkPVdFXGaqUvI=;
 b=RzzusNbRhvOV189vopjF0pro/U2Mvs0Ddj/SHqkRIFr2WMqAwQP8lc6LoZofXijm1kjpUl4kZ9v5j865ozoyz8VzD4YDqKaH6nPSZsd7NbdYPDXuOrzGhQdr66vKpBPlkEdisjwqx78LvlU/fjTZr23ipztfhuW/Iqvo+BY3g7GXxTMbpc6UalZ+EYs+3desuYonoKj77UbDyR6UXfGELYZG2mLum7NNyiOvFhQ+EBlamV0ZHW+3vBfuBW8Fpqfj2Bx1EI2/IeExwqhyNuMoWxYtDT8RRYMCwQSyTZmHpqN5t4yT+13tZ+biINDyXYbZVyKX1kKIxyvlx9HjgReYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu6lGHsbzTEZviLMY0r5d8+iU6TwWvIkPVdFXGaqUvI=;
 b=CLTu8jdQNxs0Rv0B8XKvuWJFF7AP3EQJQyUr4IGQNjYenFGK7Ztlmczi2LFmjwIOyEHlFgjucVoB+VKiQFFBUqEUM3fndZpZthqRwxXDdYuYjdoIuuXqFbSM2IAIUzdG+z/Gh9eYBhVCdVElospGaGOMMaT7wnJmSwJeMcUc7BE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2e6dc9e4-5283-4c4d-8d40-b00861ea8020@amd.com>
Date: Fri, 8 Mar 2024 16:22:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] xen/arm: Rename assign_static_memory_11() for
 consistency
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-2-xin.wang2@amd.com>
 <50342ff8-ddc7-44a9-9166-9755edf44782@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <50342ff8-ddc7-44a9-9166-9755edf44782@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|BY5PR12MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: acb5ad15-0323-4663-a6ac-08dc3f48f38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SkoxyEEmcqEJHfBOrctScs7KperppsL7D9ep7/aZZnuqQXnQCgUIieLYEp1l/9xm+iMnSQB29Drk53HCkohr58MiIrns4FpVvEdixIuZ/+CQ7Ewm7269tO1sfFNUqAXwaemCeOED88uN8iZ3jycKBDLTb0UadJTcFWaqQC6snK7B4prOiCsUD1K1l2lPcTVh+9XnwfRjVijE6COiS46RZ3AMw/6/FgVBP8ntkhU15Oz/rB05xtBKMMvsuBBA/8lwb+C8xPiKyn/se80ff4p11oiHFYeQkZiJD35l2IRi+OQQHbWCxa2r8U4kWdUTxkR9/iV67ju9AKkSINyI+x6RkVzGb8TmpXWZBc0EMptmdJv2XFD0Xph6bEsJfGRn1aRrP7RtYanEGmkSO6FOFtZDpb4ED62B19kjkten+n7T+nsMz14cru/FmL76JoN0OQ6uXKL7mOWDVq/sJ9YqvrXZU/vogKIjRtc3rD2s9sVrjOd35YlS+oV+IuexV3DlA8o3F0HncE4HiVtpUX1Oy1irgManFzCo8NKMY41f57HXy+CT6DWENz2a85zY/dXKLZcEjaK45hNwKWaUnaJTn1nwhKCSzCcalEqvIRwbbeirg+wsimP4x3UghCxUdrq1RBW918W1+5R52Iy1zEnUTZD7avqff/5HMXh7JQcojcC3S7sysbv9CPnNgPaoF9fvcp5/2rpb8k0Z1tvFQP2IoWzLQw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 08:22:53.5772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acb5ad15-0323-4663-a6ac-08dc3f48f38f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178

Hi Michal,

On 3/8/2024 4:18 PM, Michal Orzel wrote:
> Hi Henry,
>
> On 08/03/2024 02:54, Henry Wang wrote:
>> Currently on Arm there are 4 functions to allocate memory as domain
>> RAM at boot time for different types of domains:
>> (1) allocate_memory(): To allocate memory for Dom0less DomUs that
>>      do not use static memory.
>> (2) allocate_static_memory(): To allocate memory for Dom0less DomUs
>>      that use static memory.
>> (3) allocate_memory_11(): To allocate memory for Dom0.
>> (4) assign_static_memory_11(): To allocate memory for Dom0less DomUs
>>      that use static memory and directmapped.
>>
>> To keep consistency between the names and the in-code comment on top
>> of the functions, rename assign_static_memory_11() to
>> allocate_static_memory_11(). No functional change intended.
> There was a reason for this naming. The function is called assign_ and not allocate_ because
> there is no allocation done inside. The function maps specified host regions to guest regions.
> Refer:
> https://lore.kernel.org/xen-devel/20220214031956.3726764-6-penny.zheng@arm.com/

Emmm I indeed had the same idea and thought there should be a reason 
about the naming, but at the same time still misguided by the in-code 
comment on top of the function saying "Allocate static memory as RAM for 
one specific domain d." :/

I guess I will either simply drop this patch or correct the above 
in-code comment (which I am not sure if it is worthwhile for an 
independent patch). Anyway, thanks for the info!

Kind regards,
Henry

> ~Michal


