Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496378692F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 10:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589810.921846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ5Hc-0001ei-UI; Thu, 24 Aug 2023 08:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589810.921846; Thu, 24 Aug 2023 08:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ5Hc-0001cd-RB; Thu, 24 Aug 2023 08:01:36 +0000
Received: by outflank-mailman (input) for mailman id 589810;
 Thu, 24 Aug 2023 08:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6NC+=EJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qZ5Ha-0001cV-TC
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 08:01:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f8c5204-4254-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 10:01:31 +0200 (CEST)
Received: from MW4PR03CA0063.namprd03.prod.outlook.com (2603:10b6:303:b6::8)
 by IA1PR12MB6137.namprd12.prod.outlook.com (2603:10b6:208:3eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 08:01:26 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::33) by MW4PR03CA0063.outlook.office365.com
 (2603:10b6:303:b6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Thu, 24 Aug 2023 08:01:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 24 Aug 2023 08:01:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 24 Aug
 2023 03:01:23 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 24 Aug 2023 03:01:22 -0500
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
X-Inumbo-ID: 6f8c5204-4254-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gke2Z7epIHH7I0Inn+v2ly7hZ7EQ/ksdTSFSScWrWAUFxySePfThVIG5c8EC5nErIiEYrRX4lshmS00EdwkZN9oZzHO8cEM5ZwI3u0wm+CVuiwYn7r4ojeU9khxD9kzhVRSY5g7c8Tn3h+WV5k9nJp6CoWJNq0MHEgR8dZkYTepmXppH6V1wQcirsnE2X6qJWewL/Xxfuk6beQ6GzWz+/f4QM+VRNtQ+TnF1wzhDaDRQrP4B6BfKG0t2sfZ2NnNF7EUN2pB8y6Fw0nxOiLHZGAJcPwPg1lLDFXLXIZTz9H9vhmAi7SxAFlgFrxSozyUHdfZCcHd+UTt0v5rgUfrXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGwgAU+CLtWwE5RvkkbQ5LLjcidE7aMXW5tCRlzD0Sc=;
 b=KjKEEpFL7Lnqil/znG5vrGgIGYzzvZnmXZMSHpvf9NWgt9/A+OIh/8jpEzybLlt9wSHjPOtfrJcJcadyNun0bi3NsyJt7BS3Bn32Eb9GVDtPYDnYmFouigpa+XFPo0bqMIs06bbRGeFyCJC3hcmi82nFOHu+pA2LTl06GinFl+JH2VSL/8a7i63fAaVSTXhpGw08KdN7XSH3tLpdVCVPjgDzJuZ9IoqvJktxHfS7mQgOiJ3aQ/Yznm1fyURBQRH1oXEsbIOBQFlp/zw0O217RMXQv1Wr8i/16Gozjwb0O2oSRt6uqRTg1fpX7lM1LAYq+NCmL1cWsTRPNCvtftfuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGwgAU+CLtWwE5RvkkbQ5LLjcidE7aMXW5tCRlzD0Sc=;
 b=GvneL3BYC2lXFehPnMZWIW9uugypCvhgvvreK4tJyerOALXOnpLLqgg/QngpSlI1mHX2h2SR8b2/bq4zyAHMhrbGsBxOsJe2ifoEg7aKuoo5pJWBJAf84vdFvSWh2ffs5PscweGdE4uZGg1GXwpn87E1aPrJTF0XyS3TYqAXJeE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <941f9188-6d59-12a6-9868-daa39b51687a@amd.com>
Date: Thu, 24 Aug 2023 10:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2] arm64/vfp: address MISRA C:2012 Dir 4.3
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <xenia.ragiadakou@amd.com>,
	<ayan.kumar.halder@amd.com>, <consulting@bugseng.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <140f450d4f4f88096158e54522fc2734367a90cb.1692807017.git.nicola.vetrini@bugseng.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <140f450d4f4f88096158e54522fc2734367a90cb.1692807017.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|IA1PR12MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: e6151ee4-c393-428c-609c-08dba478503e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kF9yYeGehVNNye9iGbePCQ0rZjW33oBjosW5lTxoYNnyEH6vpRvMthIqzx6SReOp22bXCYg1mGPVEv1Ma4rEy4iYNsiR7Rzq2NSrB1EVf/rV3B6gt5nBtRsDtRzzRN491JkqMvEM5hvUkh71vQzse0wJ5ahLsrMHyyeR8whhql9lEtS5a6FSKozvh2PsBSzdpNpT1kl9awcTLwNSKukM8Q2/CN0VIxfFZ9FIKqSPFUcJRdwCJZMML5Woqi/+7872LBao5S/z99dBsMkHmntYlFU/qcILII1s8HqsYw6sWOGPFkxLVq7qJvaFRwumpEEFVXSjShgmEggMcBBJrjch72a7pHmWVsEpFZ9/tfdwYpn227Q15ad6Gc5t39IFdu4VMxqa5cvZwIAPGuY0QjiYxwa1pTOh4MnCS4/SLScY0V/FyT+AxRkVnaL3GTWuaGtutMR+1uSIpKqycHu3i0sYALyPbHAy/0YKJrTmw/RPD3TYZZzi4eHVXO5iATqQYCNRgAN/oGcQIit4B4yv3jlcBWBJ4dwIETc5VU+rCPxpX4UQ662nJgovHhIu3gwPaNuSPqf2GF+h8uLA/JrXHeiJOOHlxt/JEjknLOwjrs9otmial8O1ITnjsfxmMsG26iNZ7HipCmh5FXDEPt7vh7B6AJ6aQ7b69NJQB0aeorGuS8JIRm2tPXqfEmJQNlwZtQtDOkMMNv3vezAb7Bblfvj5f5QhkQ+wY95J3wMyvAMs3mDYTVNhz8Qru4/xI9t3xR4cJEW0MqyGK+a3neVkux0HoxCMRY2y+WwR+I88ClPMWis=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199024)(186009)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(54906003)(70206006)(70586007)(316002)(81166007)(16576012)(478600001)(110136005)(26005)(44832011)(36860700001)(356005)(6666004)(82740400003)(40480700001)(41300700001)(53546011)(86362001)(31696002)(2906002)(31686004)(4326008)(8676002)(8936002)(40460700003)(2616005)(5660300002)(83380400001)(36756003)(336012)(47076005)(426003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 08:01:25.0009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6151ee4-c393-428c-609c-08dba478503e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6137

Hi Nicola,

On 24/08/2023 09:37, Nicola Vetrini wrote:
> 
> 
> Directive 4.3 prescribes the following:
> "Assembly language shall be encapsulated and isolated",
> on the grounds of improved readability and ease of maintenance.
> 
> A static inline function is the chosen encapsulation mechanism.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - Switched to a static inline function
> ---
>  xen/arch/arm/arm64/vfp.c | 78 ++++++++++++++++++++++------------------
>  1 file changed, 44 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
> index 2d0d7c2e6ddb..5c884380ee42 100644
> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -4,6 +4,48 @@
>  #include <asm/vfp.h>
>  #include <asm/arm64/sve.h>
> 
> +static inline void save_state(uint64_t *fpregs)
> +{
> +    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> +                 "stp q2, q3, [%1, #16 * 2]\n\t"
> +                 "stp q4, q5, [%1, #16 * 4]\n\t"
> +                 "stp q6, q7, [%1, #16 * 6]\n\t"
> +                 "stp q8, q9, [%1, #16 * 8]\n\t"
> +                 "stp q10, q11, [%1, #16 * 10]\n\t"
> +                 "stp q12, q13, [%1, #16 * 12]\n\t"
> +                 "stp q14, q15, [%1, #16 * 14]\n\t"
> +                 "stp q16, q17, [%1, #16 * 16]\n\t"
> +                 "stp q18, q19, [%1, #16 * 18]\n\t"
> +                 "stp q20, q21, [%1, #16 * 20]\n\t"
> +                 "stp q22, q23, [%1, #16 * 22]\n\t"
> +                 "stp q24, q25, [%1, #16 * 24]\n\t"
> +                 "stp q26, q27, [%1, #16 * 26]\n\t"
> +                 "stp q28, q29, [%1, #16 * 28]\n\t"
> +                 "stp q30, q31, [%1, #16 * 30]\n\t"
> +                 : "=Q" (*fpregs) : "r" (fpregs));
> +}
> +
> +static inline void restore_state(uint64_t *fpregs)
This can be const as you are loading data from fpregs into registers

> +{
> +    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> +                 "ldp q2, q3, [%1, #16 * 2]\n\t"
> +                 "ldp q4, q5, [%1, #16 * 4]\n\t"
> +                 "ldp q6, q7, [%1, #16 * 6]\n\t"
> +                 "ldp q8, q9, [%1, #16 * 8]\n\t"
> +                 "ldp q10, q11, [%1, #16 * 10]\n\t"
> +                 "ldp q12, q13, [%1, #16 * 12]\n\t"
> +                 "ldp q14, q15, [%1, #16 * 14]\n\t"
> +                 "ldp q16, q17, [%1, #16 * 16]\n\t"
> +                 "ldp q18, q19, [%1, #16 * 18]\n\t"
> +                 "ldp q20, q21, [%1, #16 * 20]\n\t"
> +                 "ldp q22, q23, [%1, #16 * 22]\n\t"
> +                 "ldp q24, q25, [%1, #16 * 24]\n\t"
> +                 "ldp q26, q27, [%1, #16 * 26]\n\t"
> +                 "ldp q28, q29, [%1, #16 * 28]\n\t"
> +                 "ldp q30, q31, [%1, #16 * 30]\n\t"
> +                 : : "Q" (*fpregs), "r" (fpregs));
> +}
> +
>  void vfp_save_state(struct vcpu *v)
>  {
>      if ( !cpu_has_fp )
> @@ -13,23 +55,7 @@ void vfp_save_state(struct vcpu *v)
>          sve_save_state(v);
>      else
>      {
No need for brackets
> -        asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> -                     "stp q2, q3, [%1, #16 * 2]\n\t"
> -                     "stp q4, q5, [%1, #16 * 4]\n\t"
> -                     "stp q6, q7, [%1, #16 * 6]\n\t"
> -                     "stp q8, q9, [%1, #16 * 8]\n\t"
> -                     "stp q10, q11, [%1, #16 * 10]\n\t"
> -                     "stp q12, q13, [%1, #16 * 12]\n\t"
> -                     "stp q14, q15, [%1, #16 * 14]\n\t"
> -                     "stp q16, q17, [%1, #16 * 16]\n\t"
> -                     "stp q18, q19, [%1, #16 * 18]\n\t"
> -                     "stp q20, q21, [%1, #16 * 20]\n\t"
> -                     "stp q22, q23, [%1, #16 * 22]\n\t"
> -                     "stp q24, q25, [%1, #16 * 24]\n\t"
> -                     "stp q26, q27, [%1, #16 * 26]\n\t"
> -                     "stp q28, q29, [%1, #16 * 28]\n\t"
> -                     "stp q30, q31, [%1, #16 * 30]\n\t"
> -                     : "=Q" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpregs));
> +        save_state(v->arch.vfp.fpregs);
>      }
> 
>      v->arch.vfp.fpsr = READ_SYSREG(FPSR);
> @@ -47,23 +73,7 @@ void vfp_restore_state(struct vcpu *v)
>          sve_restore_state(v);
>      else
>      {
No need for brackets
> -        asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> -                     "ldp q2, q3, [%1, #16 * 2]\n\t"
> -                     "ldp q4, q5, [%1, #16 * 4]\n\t"
> -                     "ldp q6, q7, [%1, #16 * 6]\n\t"
> -                     "ldp q8, q9, [%1, #16 * 8]\n\t"
> -                     "ldp q10, q11, [%1, #16 * 10]\n\t"
> -                     "ldp q12, q13, [%1, #16 * 12]\n\t"
> -                     "ldp q14, q15, [%1, #16 * 14]\n\t"
> -                     "ldp q16, q17, [%1, #16 * 16]\n\t"
> -                     "ldp q18, q19, [%1, #16 * 18]\n\t"
> -                     "ldp q20, q21, [%1, #16 * 20]\n\t"
> -                     "ldp q22, q23, [%1, #16 * 22]\n\t"
> -                     "ldp q24, q25, [%1, #16 * 24]\n\t"
> -                     "ldp q26, q27, [%1, #16 * 26]\n\t"
> -                     "ldp q28, q29, [%1, #16 * 28]\n\t"
> -                     "ldp q30, q31, [%1, #16 * 30]\n\t"
> -                     : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs));
> +        restore_state(v->arch.vfp.fpregs);
>      }
> 
>      WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);

Apart from that (up to maintainers if it can be done on commit):
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

