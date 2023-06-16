Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA7F73295F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 10:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550039.858917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA4MZ-0002nv-RN; Fri, 16 Jun 2023 07:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550039.858917; Fri, 16 Jun 2023 07:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA4MZ-0002lA-OQ; Fri, 16 Jun 2023 07:59:19 +0000
Received: by outflank-mailman (input) for mailman id 550039;
 Fri, 16 Jun 2023 07:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsPZ=CE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qA4MY-0002l4-LN
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 07:59:18 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aec4c086-0c1b-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 09:59:14 +0200 (CEST)
Received: from BN1PR10CA0023.namprd10.prod.outlook.com (2603:10b6:408:e0::28)
 by MW4PR12MB6803.namprd12.prod.outlook.com (2603:10b6:303:20e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 07:59:09 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::a1) by BN1PR10CA0023.outlook.office365.com
 (2603:10b6:408:e0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27 via Frontend
 Transport; Fri, 16 Jun 2023 07:59:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.30 via Frontend Transport; Fri, 16 Jun 2023 07:59:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 02:59:08 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Fri, 16 Jun 2023 02:59:06 -0500
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
X-Inumbo-ID: aec4c086-0c1b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihUvspbxNOcxtIi9Y5s6bHj+FR67qHO6lT5nzoP/iM9AxqkeVSx/RYrwT3mJH7n3SXeh+KzrUwJurkfeKYpzyhNx6LQI31kQ69eK3K6npsO2xeChH2EhsHk26Pz9KqnUV7VejjE8oPoqO8LhKMwNMiQwsv3WRqiw4XwkHus2IMH8z+BJVjqVQi610mxwQiBSmyEWazItQrkiOkhihFEp8RvLJjEuX2+8IsNoCZRuqYBp7pyYfazxerB39Ipjvhd0yrj/2VChlz5RrUjUl4DBRhnyKFsXEpX8Aa2FUYzNpsKEbhg02IT+C7xdimuUfyXdL//HpOXUYLySrAKorvwgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZaHSpr25C2HE1KvWI0eK5BbPCCE5r8n20DlrLwBkBY=;
 b=ngMSmbZOYxRgvNURcFYPzlqtqEgvzfHWHMxChVtD3poHr5nWJ/HwPdH4j+bv+NFSXATcuOtsl2xXrhoQ0M1Xpp7Aw3lLSmncSoD/f6p0pKgFZaCHdielQKPrczEKJnIKEsf/HyWmM3/vlto1LscgRmgcsI2IG1Di62yI3VHE91V/3fmYwu4Z88IqKH5yKxmXBby83AszDJITvjWMY5HHSjpeCst6wf8crzp+w3kRofTzucKR6i3A6OaKREzcDnlii2aeGuoCmA1Hgf1c1leZRQKYiqhZIwk/1zvAoFlOkHrb4xcDc82HroXVaLJbwm5HZrlWFLYdOZw+LB7yizKLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZaHSpr25C2HE1KvWI0eK5BbPCCE5r8n20DlrLwBkBY=;
 b=bU/iWHthB4rer3mNowCIMRcm0nl4LW6vMujbJ4VEjIascmGZa3F3SCUhMqwIKs9B6fyUivjoMNv+wg3ZEz21Wg7DstMirBcz1hBSMtu11kgspZDkzodzUx4MxYxPUS4+Smp9xkR+c01AXYz6Rnz2frNAtLh2HUHIPR3OS7ginnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9590af0b-e40e-6996-0dc1-00e065d62187@amd.com>
Date: Fri, 16 Jun 2023 09:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN v8 1/5] xen/arm: p2m: Use the pa_range_info table to support
 ARM_32 and ARM_64
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-2-ayan.kumar.halder@amd.com>
 <c48d763b-4b58-69f1-4cce-2f9855aa8ee0@amd.com>
 <e7ffc49f-721a-7397-63bb-465f4c98a4b8@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e7ffc49f-721a-7397-63bb-465f4c98a4b8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT105:EE_|MW4PR12MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e3a363-0a94-4677-96c3-08db6e3f909f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4cIhi3CfwN3XoVTk6PmDK2svJmbceDcO0IrfHvJeHqn1TD95co9N9kokDAW0SwwwhSdqXLqb6kTb/TKaYOeNTckN8PGzlLWRGCbncMLiYCAdeS8PTeweK0sN/33e14PClAm2kUjOvFejxuCrstW1KaPAkweVNJ+9wwZvkKs0bL/pDgXLB6eBJVdPHJD4tne4nFxKxN68bbkya+oC6Qirggn4NRNQ/vBUqnYjhL7U0J3zBx6WwQYKfMwc5sggkCElNikjtWcnzUjuzwsiT4PohWyByEocJFkhGBWFcL4egLB0GFaEu+5QxCYodS6zFnOK8ERLEAd14rcSdFStrNtPVLBQ17MttrGALLgThoKPNLzXjml4sdeONgerfVbyFqm6kiSTOLJPQzg2StVkBAaXbBT2tbUzzNLLbnDDG9Er7eolVDMbrWywCozG9LS0NrSlDal67TP/7mEp8ANYMAEBFHWI/NFOUcKQzWOV0u5FAQJt+EI1VkiT0krEDq7+2SE5NONeoFXJCKSA0BccqnBoSapgYP6rUA88+uks0ZFxSHnP0an/w8S2o1sx2trDqD3sWPh5OAEXFYuN8zX5voleDhhMoyR1bS0bXZHGgszvryhXRS9k05D4CrMcx6nK007L8HGQvscCSsVGdk+wUc/SfXK+uQijtFBPjUVPbKdzZ/3DV4hgEhV1/XDZnfBYSEfio3xNixo/Elk/EBWgCSQ6S1pzfXb4p8EuAozKnSdXtSUOlIxXmPbbptpnT9jsRIH49CVESYjmXfGKS6CJDVuvnJ90DYCZquKC2qwJIACv2T4xNkoyhodxf210jYsWL8iV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(53546011)(26005)(36756003)(186003)(478600001)(40480700001)(40460700003)(2906002)(4744005)(316002)(336012)(41300700001)(44832011)(8936002)(86362001)(7416002)(8676002)(31696002)(82310400005)(31686004)(81166007)(356005)(82740400003)(5660300002)(426003)(83380400001)(54906003)(47076005)(16576012)(66899021)(2616005)(70206006)(70586007)(4326008)(110136005)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 07:59:09.1117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e3a363-0a94-4677-96c3-08db6e3f909f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6803

Hi Julien,

On 15/06/2023 22:32, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> I notice you posted some comments but didn't add a Acked-by/Reviewed-by.
> Can you indicate if you are happy with the patch so long your comments
> are addressed?
> 
> If so, are you OK if I deal with them on commit?
I thought I added my tag but clearly not. With the remarks addressed on commit:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

