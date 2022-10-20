Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32609605908
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 09:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426257.674580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQLO-0002Zy-10; Thu, 20 Oct 2022 07:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426257.674580; Thu, 20 Oct 2022 07:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQLN-0002WV-TT; Thu, 20 Oct 2022 07:51:57 +0000
Received: by outflank-mailman (input) for mailman id 426257;
 Thu, 20 Oct 2022 07:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2Es=2V=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olQLM-0002WN-50
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 07:51:56 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f6e34fe-504c-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 09:51:54 +0200 (CEST)
Received: from MW4PR04CA0041.namprd04.prod.outlook.com (2603:10b6:303:6a::16)
 by IA1PR12MB6137.namprd12.prod.outlook.com (2603:10b6:208:3eb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 20 Oct
 2022 07:51:50 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::be) by MW4PR04CA0041.outlook.office365.com
 (2603:10b6:303:6a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Thu, 20 Oct 2022 07:51:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 07:51:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 02:51:48 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 20 Oct 2022 02:51:48 -0500
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
X-Inumbo-ID: 0f6e34fe-504c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdNyf8bBvYQgst2ng7WtrJuC+aZkgMSF5S+ahbGfEZG7uXCQaPmFaQ3dzLMvPJFVBM6zz2aFa9xB+tzUoClAbZ0BiWeRZwrh4vidieOcztlHf9BGsbDFk7kj9fuGWN+3ZfNaATRR6zNlErNnIBByyT1Fpu+cbwxDhjeZf95Y4Udl4qaz8xRUKMar8OFPfM+lU43XxPfGSnALuxjgrNh6hK4PqrUikGiTOfBZueDeMPYPQENOQCEChSjFxYhku2XcZB/ZExcXCFtJkn7RmnQILrNkp+DoEovH+h8fsgPUGPWTQ1aTm4od6luk3bkfbRY0EaKonn2dRJLFYqZLnzy19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fM8zzqzuMoh1+GP100enU+ugyyRDaAt84n9V5tfnmv4=;
 b=fhTN5oySvtn5Ehxb113aTusF/mU2Qydw8z9C7uoG+e5EFyVWpd9LCKaSp+mupc2Ur2xsNzMhQaDlHNqsHVhlSD/9IwbHIUpLa7Omrr2m5/3I3ZMGWXOXS44MgaKoMk8YCoWRd4M3iupM1v77f38HIjK9/qU7Ec33PwQg5BRbCmM34iuADvHmxwJWYHLX9WYwt6iw3IhvkYPFmJnGTEAZm0Ws6K5ABho/Wfp3WhWanrcHn+QKe7achUnh+TlDYBw2rakzUHMHQJl/IEVLVHRxV7utvEdAMy4oLOy1iJMax0qN294bdlJroqlbUJ6bD43KfAjM2/EXCkwMwKUItUk7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fM8zzqzuMoh1+GP100enU+ugyyRDaAt84n9V5tfnmv4=;
 b=TdBnW66aFH3SBebKo79RzSLONpP3HEqvguyUdN73amhJN+S5nATzGeseR84Fkd9bqgREFTOA5S6kkeimwBXMZm/7rqbexYlE1GOvsJ2rlZF6vqTiEQEZglcrAEoa+ZYqp+jnUqEuVM67WvtUSWH6pUGA21prn/NTIq442t5lJBc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e0e0d4af-54e0-6dee-2f01-99bb5d31d346@amd.com>
Date: Thu, 20 Oct 2022 09:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 05/10] automation: Add Arm containers to containerize
 script
Content-Language: en-US
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20220927094727.12762-1-michal.orzel@amd.com>
 <20220927094727.12762-6-michal.orzel@amd.com>
 <AS8PR08MB7696D8C9D2239CC9ED2FE08F922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <bc41f3a0-27ec-8bbe-a087-125acc20df2f@amd.com>
 <AS8PR08MB769676050B41BCEDCA3F2891922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB769676050B41BCEDCA3F2891922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT021:EE_|IA1PR12MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cede87-7aed-4521-9a3a-08dab26ff218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zod3hDDzlgEAp50k0iyvCoWa0uEovbDm7TXvnCe2zmlL4r7BUnpm8jnZH9yzsJLH2tkYBT3cfxJxXz9kQxOnOfxcHLgEU2KDMRtDj4Sqk2zKzyHYHeLitYqHK/Gdi0c5f1IFqxL0qAMKCk8uhiQZR/mMXuyVv9aodhWL+Ab1uG9FFCfkxtiNMk2xgh3nXnKl77h6VixE4VHVVJBOycKOw9c/KbXQI5ozCr37Og3iI/5T5kKg/Oy4pi1PAfwwUhnRlwmhHV0T44qjD3zSiHtvpi0PsqeMPcmJNLjappwM5wuhXycOok3KbMaQ6SdaxGhi06tAkJ3RNrhIHwdE4XU8ZwFu7BvxT7Z7k76A0B9FKmg71UMUa5MNjfbRzGeE7kBbY3mUTXVCkGYyXD3N3Cex7qLqbUrLMech6shZQnqAtdHdbzW769ypmXvpjECVTLNjXdSkfmCpuhSvJAEtuHesA7fEGFtcBxwLIfRmH0LBiwtQq8tXOmEA3OBJtpO9WVUBZtDXGph/NdBVFzSKzRDlGZRz9wYoic2U4BkVv48paxQkeBHF05ZDhdO9Bbtq5ih+fAEkI8LMBW/2EvfCb1Q50tikBkP9AnYRbVHlhGutG5dvxrHeqlFhsOCfCZFR0NndasnxyfAOVA3IMjFzwET4/la6/c1whbTDqy0cLYWK67jB6IJBwNmUrW2xwtoN4EueALUzBkzI4zEAfCDpdSXbIjdw3IQK/RjNKp35a7+izzlIF9WMCnrCAeAyGpUwgfYdHWXQHF4QxadFYm+G4pQFlDWTiB5qfe/AFNLySYbk1swRThUe/KxRcNX02OYauKohYQ+F2+piHPOQsw0cZooiatSw7Y06leie6tJTT6Y+dbA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(478600001)(53546011)(336012)(36756003)(83380400001)(426003)(26005)(47076005)(2906002)(5660300002)(186003)(8936002)(41300700001)(356005)(2616005)(81166007)(82310400005)(40460700003)(86362001)(40480700001)(82740400003)(31696002)(36860700001)(31686004)(316002)(110136005)(16576012)(84970400001)(44832011)(54906003)(70586007)(8676002)(4326008)(70206006)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 07:51:49.7596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cede87-7aed-4521-9a3a-08dab26ff218
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6137

Hi Jiamei,

On 20/10/2022 09:13, Jiamei Xie wrote:
> 
> 
> Hi Michal,
> 
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>> Sent: Thursday, October 20, 2022 2:59 PM
>> To: Jiamei Xie <Jiamei.Xie@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Doug Goldstein <cardoe@cardoe.com>; Stefano Stabellini
>> <sstabellini@kernel.org>
>> Subject: Re: [PATCH v3 05/10] automation: Add Arm containers to
>> containerize script
>>
>> Hi Jiamei,
>>
>> On 20/10/2022 05:00, Jiamei Xie wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> -----Original Message-----
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>>>> Michal Orzel
>>>> Sent: Tuesday, September 27, 2022 5:47 PM
>>>> To: xen-devel@lists.xenproject.org
>>>> Cc: Michal Orzel <michal.orzel@amd.com>; Doug Goldstein
>>>> <cardoe@cardoe.com>; Stefano Stabellini <sstabellini@kernel.org>
>>>> Subject: [PATCH v3 05/10] automation: Add Arm containers to
>> containerize
>>>> script
>>>>
>>>> Script automation/scripts/containerize makes it easy to build Xen within
>>>> predefined containers from gitlab container registry. This script is
>>>> currently missing the helpers to select Arm containers, so populate the
>>>> necessary entries.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> ---
>>
>>>
>>> [Jiamei Xie]
>>> I wonder if an default container for arm can be added. For example,  if
>>>  "CONTAINER=arm64 automation/scripts/containerize bash",
>>>  set the default CONTAINER as "registry.gitlab.com/xen-
>> project/xen/alpine:3.12-arm64v8"
>>>
>>
>> It can be added doing the following:
>>
>> diff --git a/automation/scripts/containerize
>> b/automation/scripts/containerize
>> index 0f4645c4cccb..b395bd359ecf 100755
>> --- a/automation/scripts/containerize
>> +++ b/automation/scripts/containerize
>> @@ -25,7 +25,7 @@ die() {
>>  BASE="registry.gitlab.com/xen-project/xen"
>>  case "_${CONTAINER}" in
>>      _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
>> -    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
>> +    _alpine-arm64v8|_arm64) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
>>      _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
>>      _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
>>      _centos7) CONTAINER="${BASE}/centos:7" ;;
>>
>> The question is whether it would be beneficial. After all you would still need
>> to
>> type CONTAINER=arm64, whereas at the moment, you need to type
>> CONTAINER=alpine-arm64v8.
>> TBH I'm not sure it is improving anything (?).
>>
>> ~Michal
> [Jiamei Xie]
> I am not sure about this either.  I added something like below f to run it on arm64 machine.   But it  didn't take "running container for a different architecture" into consideration.
> 
So your question is not about adding default container when selecting CONTAINER=arm64, but adding
a default one when running on arm64 platform. Right now, the default one is debian:stretch
(if you don't type CONTAINER= at all). Do I understand it right that you would like the same
behavior when running on arm64 platform (currently, it would also select debian:stretch)?
So that when executing:
./automation/scripts/containerize ...
it would automatically select alpine-arm64v8?


> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -18,6 +18,12 @@ die() {
>      exit 1
>  }
> 
> +# There are two containers that can run on aarch64, unstable and alpine.
> +# Set the default container to alpine for aarch64
> +if [[ $(uname -m) = "aarch64" && -z ${CONTAINER} ]]; then
The output from `uname -m` for arm64 can be aarch64 and arm64.

> +    CONTAINER="alpine"
> +fi
> +
>  #
>  # The caller is expected to override the CONTAINER environment
>  # variable with the container they wish to launch.
> @@ -41,6 +47,11 @@ case "_${CONTAINER}" in
>      _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/suse:opensuse-tumbleweed" ;;
>  esac
> 
> +# Containers for aarch64 have a sufix "-arm64v8"
> +if [[ $(uname -m) = "aarch64" ]]; then
> +    CONTAINER="${CONTAINER}-arm64v8"
> +fi
This is not needed. CONTAINER can be selected on the first check and let case/esac block
to determine the full path to container.

> +
>  # Use this variable to control whether root should be used
>  case "_${CONTAINER_UID0}" in
>      _1)   userarg= ;;
> 
> 
> Best wishes
> Jiamei Xie
> 
> 

What you are asking for can be done in a simpler way. The following is enough:

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 0f4645c4cccb..4e7e8bb48e3a 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -18,6 +18,11 @@ die() {
     exit 1
 }
 
+# Select default container when running on arm64 machine.
+if [ -z "${CONTAINER}" ] && uname -m | grep -qE 'aarch64|arm64'; then
+    CONTAINER="alpine-arm64v8"
+fi
+
 #
 # The caller is expected to override the CONTAINER environment
 # variable with the container they wish to launch.

~Michal

