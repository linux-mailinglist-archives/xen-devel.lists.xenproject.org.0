Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C667E886
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485714.753119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPxD-00015k-C2; Fri, 27 Jan 2023 14:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485714.753119; Fri, 27 Jan 2023 14:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPxD-00013y-91; Fri, 27 Jan 2023 14:43:47 +0000
Received: by outflank-mailman (input) for mailman id 485714;
 Fri, 27 Jan 2023 14:43:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsEI=5Y=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pLPxB-00013s-RO
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 14:43:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe4496d6-9e50-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 15:43:42 +0100 (CET)
Received: from MW4PR04CA0143.namprd04.prod.outlook.com (2603:10b6:303:84::28)
 by PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 14:43:39 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::97) by MW4PR04CA0143.outlook.office365.com
 (2603:10b6:303:84::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Fri, 27 Jan 2023 14:43:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 14:43:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 08:43:38 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Jan 2023 08:43:37 -0600
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
X-Inumbo-ID: fe4496d6-9e50-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpUW46YQGXG3tIRT9kvgnue4WJqubBAG4+fe0TlIu/xU70zXCAaRMM//Ab7jAnczrzjr6H2OKhtBVYUJNq5JHyll8mLQl+eMKaZkMr7zzxXSkLJTDq6m6905kDQsR19iTMqjaK2ellbTKl3/PwbYFUY4Nv9m4AItwQnsH5uOL1j8vEahX9TW1vtwyHhwCJDOppG9rY3wxjR3CB2pVv/udSYq+9krLKhdp4JZOHxiKR3T/D5gjf1tFj5VP3mF6arI+/41VEkdv1pH24hFCBNWUlfyWgJUnw65Dfx4zVF2yr/zSZ9cqxqz3xY5Y3bt505e4bL7INgt9VSA1zHbHEa/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7ge0+vYmN+Gld9693vJ9njAWboUUQHvcT6vUQfNbgo=;
 b=FS8N/ukHWjNUUL2uNjm8cjem6qIF9sS9s/Dz5bMoR1gc++P+Mhc57Vgq4FmgAvCa8A2M6WDuLxGTsExWw33LsseQ2TFEZe2qAiLTdiWeNTKmoiDoazcfvQ6i7x73gVKL0YLgHv8YnUIhb9+B5Z3iF9Qb7fSOgIVUgfX8+4Z5gHanja7dGGKfWLhM3t3RVOyuL9yi19Mv9Z44pyPT+CfFn6RtfC6YvO7UN0lBjDitSKMUnTqvoTrMqM05INogSrNtZkmLqic1w7N5zGgW+xoqaYIw/4EaVdqrc09O+scZ/5ixa64BbAx4WHtr7ZspToSe9ZrvoKAFqq9fFVSnfZj6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7ge0+vYmN+Gld9693vJ9njAWboUUQHvcT6vUQfNbgo=;
 b=FoOg7DsQUrRouW8uLdvAFYzks9L0FiWkJaX6bF0QN8ObN2QiiT2/iO2Sl1wHHdLw+/rP5PWc8zZ0cU4aPdIv2fNhATTK2Hl+/zDma1HtFajjkeHfiQZeHzbWIFpr+yiaB8sfeq0ASEdfSuMerCKiEPKuxoNyukPN4uwtvVakWok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fe470f53-5cf5-138b-40e7-83c111ce225a@amd.com>
Date: Fri, 27 Jan 2023 15:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 14/14] automation: add smoke test to verify macros from
 bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Doug
 Goldstein <cardoe@cardoe.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <ed819dc612fcadbd04b4b44b2c0560a77796793a.1674818705.git.oleksii.kurochko@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ed819dc612fcadbd04b4b44b2c0560a77796793a.1674818705.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|PH8PR12MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 41db0996-34b9-4a36-5a8d-08db0074e122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5VK1c2vlBK7rBCS2w1mZjAybI9/0Rd4lV0Wk08JTufmHuIg28p1g41AF+xVl6x3CVSBktiDVYihwqt+VU8/fp+Sb8EX0qSLP5XPUHqluhqO870oU+urwQi0KV+thqKvtVoebWJWEnZR0JIt0VN+OZeZMnYdvgY95G6jIC1BMAuOuga6YSilPTUVOMEGuHYgAEvV2MWE1YpOn72XhZrNk6jcRckw8A+VHy4FRB1STNcxuxwQd1zv4IJJKQzQWujvE50QFT9v/igqmsT4ERUk5RplXuYjPyX/fhhza865KYP/dXGilhTDZcmsDpsbWfIEiqOi90M8II1M9ZxyDv4W8QhFjiILLR7gQXq7g74ldIMkKuhTdDyYLKYwOwqa9x41w9BCiq9DdcDF5KCbCWpZ7m8vbHb+vfALaOMiP/SLSI08SSwq7fcIU1Y5OkTSGqeIAUHK5Dc/qnyQ43sBSIK+GVaLWQPVA3tZKAfPdqwFoxpCEsajKrrKqA217huZR9LHskO4/cs8lCORPrXNezkko/STvzrXLkeDyt78I/wxjvGtg8MWm/17UaVuCwp/r/m5a2T8cJ+1W6w989Uf0wQDTuFGhlswg73FDKxx9FZk4RX2c7AUKlPM1/06jFka59sqpPfrc0NVPlk+ppDZGAqknBjdwNb7a4UzXwOb1eMtD71AyYp8IhcqWR0v3wlKAygqqke+dRFUm5HgEGRHG3Nji9JoUo2wusO+cKWJ0sKkGF1tdxcDndPvSWrBobxcbnp5cFzsDfzKomH6phwkbnIOa9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(31686004)(356005)(2906002)(44832011)(5660300002)(81166007)(4744005)(8936002)(41300700001)(86362001)(478600001)(40460700003)(83380400001)(110136005)(36860700001)(54906003)(16576012)(82740400003)(316002)(82310400005)(47076005)(31696002)(426003)(336012)(40480700001)(36756003)(2616005)(8676002)(70586007)(4326008)(70206006)(53546011)(186003)(26005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 14:43:39.4982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41db0996-34b9-4a36-5a8d-08db0074e122
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351

Hi Oleksii,

On 27/01/2023 14:59, Oleksii Kurochko wrote:
> 
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - Leave only the latest "grep ..."
> ---
>  automation/scripts/qemu-smoke-riscv64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index e0f06360bc..02fc66be03 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,5 +16,5 @@ qemu-system-riscv64 \
>      |& tee smoke.serial
> 
>  set -e
> -(grep -q "Hello from C env" smoke.serial) || exit 1
> +(grep -q "WARN is most likely working" smoke.serial) || exit 1
I think the commit msg is a bit misleading and should be changed.
FWICS, you are not *adding* any smoke test but instead modifying
the grep pattern to reflect the usage of WARN.

>  exit 0
> --
> 2.39.0
> 
> 

~Michal

