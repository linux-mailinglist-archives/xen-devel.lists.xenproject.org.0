Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7775D7F5079
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 20:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639096.996059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5spJ-0001On-44; Wed, 22 Nov 2023 19:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639096.996059; Wed, 22 Nov 2023 19:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5spJ-0001M5-1K; Wed, 22 Nov 2023 19:23:57 +0000
Received: by outflank-mailman (input) for mailman id 639096;
 Wed, 22 Nov 2023 19:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbX3=HD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5spH-0001Lw-QC
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 19:23:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acee9b63-896c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 20:23:54 +0100 (CET)
Received: from BYAPR06CA0013.namprd06.prod.outlook.com (2603:10b6:a03:d4::26)
 by SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Wed, 22 Nov
 2023 19:23:48 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::b9) by BYAPR06CA0013.outlook.office365.com
 (2603:10b6:a03:d4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Wed, 22 Nov 2023 19:23:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Wed, 22 Nov 2023 19:23:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 13:23:46 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 22 Nov 2023 13:23:45 -0600
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
X-Inumbo-ID: acee9b63-896c-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hg6lLqOu13vJ/QgkURszhT+tty0gMHoBZ3g8SwXW+LNXa3l37dDgfYF8r3sIBnyO2N9/r0opyKfvviApsLMPHKP3kP4rbKpnvkvqC1PsMh4eIn/PG3hvN1b3tZxy7H7vx90gmips49DMsA7KF23iRr0tiajeMOpTIdPxmm0jojpASnDqy/I9VzGsSJIF4wPn7+XF3Go+UjKqW4xy+4s34bnSNhnrhZl2k8bn0yMkZRFW4Q4MiHhyE9fg4Knqb3oM8FUodxDxhjE+cLydFZ5N6lWlaAf+YxsrvaC+5Jq7WTSgD1J+yvf5rO7ijTWnJYUk2LrIg35EcMdeCa8STkjjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNpYG+a2kMrDUQObCCjTTDBLvgmOmmMMjG0iUbmmIis=;
 b=HPR7u3s+vyIxfr5uvYJgKJL3Srw6ZvgKztdcucVSgrWuo96sp5Lb0htnsOrA+am/vAs3F6wYq9LFAJP3Y6XJcVsnanRMou5hTBG9wrZ0O5ZSbA3exmC0/ZjKDyyVVjF3STTpP8EIV48rzLACceofr1yshhkIlO3k8V94x5fx9z6aBcfE/j4ENGufv3XYa5ysVYWj6rmtXn/wgmfs8uFKHGv8KeadN+snVWKTy0oBJfxftf45bNI6TqSVtfUZEaevD63RMa8GoA3ij5d+HmEZ6jHo3Dc/JL00WneuOlTaN/ScXCtnjmzMUrPM7LgzYbPSEeQZCrSNmIHRpwpflgPP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNpYG+a2kMrDUQObCCjTTDBLvgmOmmMMjG0iUbmmIis=;
 b=Ko3Id8AvciGe7291aHYMOxhKFgC4Qo2qHJcUeVOMH6gewTeDOwfqqCdUP8+JPy6k3Ttbuza7Q+sUo6ELVV2tnytTd+9yxLd6owGS0JAmeUm0Akw4WYOBGqTOgMFgAA5SKio/hXiwBxmINxQWBGccp36/prffp1sxP9gYQcM8PZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <13d384e4-852a-4144-8738-6692defebbae@amd.com>
Date: Wed, 22 Nov 2023 20:23:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Enabling more than one HVC console on Arm64 platform
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <amit@kernel.org>, Julien Grall
	<julien@xen.org>, "Stabellini, Stefano" <stefano.stabellini@amd.com>
CC: <arnd@arndb.de>, <virtualization@lists.linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0b93b4d-b3b3-43b9-bff1-54399311a977@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f0b93b4d-b3b3-43b9-bff1-54399311a977@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 486db3e2-0232-42e8-c415-08dbeb908d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1IcWLxcV41iIaOcCGcYJFWbn/RGOnRM8lnnXnqBpgsOahnGBVm9S/vvesrFfIgXxzREnUQzW1pat6RMuGCT9j7iQs/HQnm28GCClRmIUGXNXdUjQ3fRUsrU1Gw+hDaUb9nem/nBiLKt1ZAbaH4nIc8GLYADvfGBmSxi/fEnh5GRJ1Z1uUkzpL2FIkk7mhRr6x009/Uk5s0pYvK+zxajZX5ojFU6IFxUp22jBk2keKZQxrz/ns/P+sWMHwOUSgFdby/4yRmuc6V7gzyzhbZk2AIkA/rqZ3HffpVFgNNruQhgmoVsiubvS7zcZGRJkcN3rNpJpHgmxhRUQRXWPu3Kk6XybYemwq70Dbkwx4q7PR+6phoMKPpIjmtXA9IMFJo7PBW6/Ut/tEe4lEjo+83wN6v0T/KLH067UsBsEZqSY1dtN4ePRS08ujCGiTpZlMrkyGO0QQyB1WCmEBJ1CdZyihZKcwMJinKZwWdt4/EazqWeHL7DH5ezwsRrBmt+cKKZN+Wzp6v8EsShPlP7epwqtMuyzKjvaTGFpsJGwhbIuJnHzU0CNwS54YVzsmagbIByNeyOrAkcEynX+59oTKg+AvCSudw196GTwU24t3FGlyL3ziK0c7w6DQMJQroKMp00ePLO8m1u7uUaIT/sampDFrB4mtu3qMo9IWSJmZLhk595Ylj/8P//WbFb8elxcxvSx7IwBsPlfdkiXRuIjk/jM4PdnAkXhx736A9STvcmR7TppMPIDcLTEbxaQUDGZV0I2o1NYmgR2RYC7o4v/rloHRMiYoYoy2lBMF7k4SpVLJrT++O36FYTFzygrV821kwka
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(16576012)(8936002)(4326008)(8676002)(70586007)(110136005)(316002)(6636002)(26005)(478600001)(966005)(40480700001)(31686004)(44832011)(54906003)(70206006)(53546011)(2616005)(36756003)(336012)(426003)(86362001)(83380400001)(82740400003)(40460700003)(81166007)(47076005)(356005)(41300700001)(36860700001)(31696002)(36900700001)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 19:23:47.9925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486db3e2-0232-42e8-c415-08dbeb908d40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156

Hi Ayan,

On 22/11/2023 20:00, Ayan Kumar Halder wrote:
> Hi Amit/All,
> 
> We came across this scenario and would be helpful if you can provide 
> some pointers
> 
> 
> Linux running as Dom0 on Xen hypervisor with HVC_DCC = y and HVC_XEN = y 
> on Arm64 platform.
> 
> This causes a crash when Dom0 tries to access "DBGDTRTX_EL0" register, 
> it traps to Xen.
> 
> Xen does not emulate this register so it crashes.
> 
> |Logs - https://paste.debian.net/1298983/|
> 
> |
> |
> 
> |My aim is to avoid the crash and let Xen boot Dom0 even though there 
> might not be a debug console available.|
> 
> |So, I am trying to add emulation for |"DBGDTRTX_EL0" register in Xen.
> 
> 
> As a quick trial (may be not the perfect solution), I am trying to 
> emulate this register as "read as zero/write ignore" (similar to KVM).
> 
> However, I could not see logs to the Xen console (ie HVC0).
> 
> 
> So my question is
> 
> 1. Is it possible in Linux to probe more than one HVC console so that 
> Linux can put the same logs in HVC_DCC and HVC_XEN drivers ?
> 
> So that the user can always see the logs in the default Xen console (ie 
> hvc0) even if the debug console is not present.
If you have both HVC DCC and Xen enabled and DCC gets assigned hvc0, just use console=hvc1
to see the messages from Xen.
> 
> 
> Another possible alternative I am exploring is to enable trapping for 
> read of MDCCSR_EL0 in Xen, so that Xen returns with MDCCSR_EL0.TXfull 
> set to 1.
> 
> static int hvc_dcc_put_chars(uint32_t vt, const char *buf, int count)
> {
>      int i;
> 
>      for (i = 0; i < count; i++) {
>          while (__dcc_getstatus() & DCC_STATUS_TX)
>              cpu_relax(); <<<<<<<<<<----------- So this will be invoked.
FWICS, this won't be invoked given that in init call hvc_dcc_check() will return false
due to condition "if (!(__dcc_getstatus() & DCC_STATUS_TX))" being false. This is the whole
point to make Linux return -ENODEV quickly.

~Michal

