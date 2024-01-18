Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F8831BA2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 15:41:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668799.1041254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTZf-0005Jt-Tp; Thu, 18 Jan 2024 14:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668799.1041254; Thu, 18 Jan 2024 14:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTZf-0005HH-Qx; Thu, 18 Jan 2024 14:40:55 +0000
Received: by outflank-mailman (input) for mailman id 668799;
 Thu, 18 Jan 2024 14:40:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkFQ=I4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rQTZe-0005HB-F6
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 14:40:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93426be5-b60f-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 15:40:51 +0100 (CET)
Received: from SJ0PR13CA0120.namprd13.prod.outlook.com (2603:10b6:a03:2c5::35)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 14:40:47 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::db) by SJ0PR13CA0120.outlook.office365.com
 (2603:10b6:a03:2c5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.8 via Frontend
 Transport; Thu, 18 Jan 2024 14:40:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 14:40:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 08:40:45 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 18 Jan 2024 08:40:44 -0600
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
X-Inumbo-ID: 93426be5-b60f-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzXmB6W6YtAlwrFJnQ5LzcyhFLjeNnEUTqHaHrnHH2ByPgkUUpYGnfWk3fW84J+8PjmYg1BBL+iFqUIg2pHbQdA7I9aQZzUou1X3t6Wt5HKK6JN6Z5+AjIpzZho2ZwX7raudmpZBk58O7IdXgPMWfJTC0uOQdeURc3Znxy664R2Ijoh0pK5IpXviqbIK+BHlD+mdXwxZFpM0t02G+TUNRlUfth1v+Rzyt05bPNgfmNF8dp1jqR3FrLc//59cAyl7hY8CMudye6J6pXNEY8+UA0B4e9kuyoeP99W6OlgYjeCy92L0t+b30eH3Nq3nXokTBdDq6WywwKCfKL36lL4CJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIR727PwCrXm63AcgfLEjxquDttB1v/yS0/QIU8wo/s=;
 b=JvWa7N1Dly0qax2fx70JPleURxjQj3tq3ips6yyRHbgAF9i3qGVTANpeDiX/HcKAbicgbZrFjd5jujfK/1zWzsfUjwFdfti89oRgdiqjxGUV2atMqNrbdT/8KduG48GeQoJ2fXVX6W3KljNa4iFpzCPHFaHucz8FEv6HFmTCpsWh0UvglK1czIG6f71u2T94U8EcM0q6vrEosCBVP+/y04nTgh/67irhH2ynGAVGaM4ZpBymhjpjghwbAD73sNf4DN1A64VAKFd4iN0bht9Nfvo8/WonG/Qjh5TLoEuAAWcEpah0ilVoXkaYC+LS7jF5q+Cb0whVpw/FqTUVJWMD9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIR727PwCrXm63AcgfLEjxquDttB1v/yS0/QIU8wo/s=;
 b=eJAUAhZpdXplNdIW22bM0HsT/TP+h/MQYagoD4sQlaA5lsUQrONNhWt3sYOSwvn10zKbMQvqT0Txy4RPzGfTpgTnznPBM8UoLx/j9DTsgvYKw2Ej3JeGf6AjJwEU+syaxiFcXAtaT4f10hyTCyrbGHzFNMSqJFwJ6b5A4Qmzr6I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e471e7b4-6558-43bb-8fbd-e067943779e4@amd.com>
Date: Thu, 18 Jan 2024 15:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Javi Merino
	<javi.merino@cloud.com>, <xen-devel@lists.xenproject.org>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee81e88-734e-4141-a976-08dc18337565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yj0IQcL+lRF4HI+1N7VQ9/prCrJArQx6mWux+4Vki0BoXDQibyg8IEFEdNLTlxdVoEXbVGH9Hfer9VGpP/EQmiNPqIpQbkzOk0TMOwNkQdnQGJUpt1PFsCqQraVd2Gz0x1d0VQuuPqSEbIXhHWfC+2RPPMji7ZS/K8sHYeC67OYHR0lf9gibS/TX/MwzADst01BCsjorqlE/Ltmb2UTSqFbauFsTyAaHaIELpmiVX4qHaPgDB2gdqocg1sZSojyjwsg84zStjIoscSemmOCy/tpahNbDAHrgE3kEUYd3hQmD2IAre9rpc/6XempvHHPNA7GozSbzi9lN1IOJGJR0pgZT+cycTY5vtF24qqzk5DqOxghsol9qEhVaK6eHu4nZNOQNCkvPpr0bLImW0vUAGQSAxUMUvuRBLy1wYHPLJhKs5cgcP/QRs7fuPyubpLgFWE5HSeFMAKyyW1+TMYjA7VmN5ov3R6Xzwcdx3KPfu/ATpxe4uRaV3al57QP8ABWR30j9asKTmrVDvd23nZmujpB71mvgmESx0SMCKkwUJqsLjzf4FUB21q27jnq+hdUIHRhxXl6HjfUr0fwmwrftwhAjYHkZuBMtVt6gLgQ7JP23w4V4s2lTIacUEnXNfHUXIgz+to+5aHLyoJjjmHC+oNlSzwNzUm1VYMA0efwpJbPxJ0MgRZxT5ibsj7+gm1RCzdf253lWQKvXyOUjSgF70axuErWiCyvfOh1C90Qf/EtyOYRL3rvRZq/fWqUWMaQrJ4/f4PUhM5pZdW6hrJkAZkdtYl5jBF8Vt018kGMoviBZdH1YJuiRPUQKHpR2QKp2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(70586007)(54906003)(70206006)(36756003)(6916009)(16576012)(31696002)(316002)(478600001)(82740400003)(4326008)(8676002)(8936002)(81166007)(5660300002)(2906002)(356005)(41300700001)(44832011)(26005)(426003)(336012)(2616005)(40460700003)(40480700001)(83380400001)(53546011)(36860700001)(6666004)(47076005)(31686004)(86362001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 14:40:47.1138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee81e88-734e-4141-a976-08dc18337565
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072

Hi Jan,

On 18/01/2024 14:12, Jan Beulich wrote:
> 
> 
> On 18.01.2024 13:06, Michal Orzel wrote:
>> At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
>> under the hood) results in a crash. This is due to an attempt to
>> access code in the .init.* sections (libfdt for Arm and libelf for x86)
>> that are stripped after boot. Normally, the build system compiles any
>> *.init.o file without COV_FLAGS. However, these two libraries are
>> handled differently as sections will be renamed to init after linking.
>>
>> This worked until e321576f4047 ("xen/build: start using if_changed")
>> that added lib{fdt,elf}-temp.o to extra-y. Any file listed there without
>> *.init.o suffix will be part of non-init-objects for which COV_FLAGS
>> will be appended.
> 
> While this is true, aiui COV_FLAGS would be empty for anything listed
> in nocov-y and all of the prerequisites of those objects (iirc target-
> specific variable settings propagate to prerequisites). Therefore ...
I'm not sure about this propagation.

> 
>> In such case, the solution is to add a file to nocov-y.
> 
> ... libelf.o / libfdt.o already being listed there ought to suffice.
> Alternatively listing only libelf-temp.o / libfdt-temp.o ought to
> suffice as well.
> 
> Since you apparently observed things not working, I must be missing
> something.
As I wrote on Matrix, I'm not a build system expert so it might be that the issue
is due to something else. I managed to find a commit after which building the libfdt/libelf
with coverage enabled resulted in .gcno files being present. This commit added libfdt-temp.o
(same as libfdt.o but without sections renaming) to extra-y, hence my fix.

~Michal

