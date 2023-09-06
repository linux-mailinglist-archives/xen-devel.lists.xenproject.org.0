Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856B9793781
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596364.930236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoI6-0007lX-Dd; Wed, 06 Sep 2023 08:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596364.930236; Wed, 06 Sep 2023 08:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoI6-0007jd-Ay; Wed, 06 Sep 2023 08:53:38 +0000
Received: by outflank-mailman (input) for mailman id 596364;
 Wed, 06 Sep 2023 08:53:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7I91=EW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdoI5-0007jV-7d
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:53:37 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc1885e4-4c92-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 10:53:34 +0200 (CEST)
Received: from CH0PR04CA0109.namprd04.prod.outlook.com (2603:10b6:610:75::24)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 08:53:28 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::4c) by CH0PR04CA0109.outlook.office365.com
 (2603:10b6:610:75::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 08:53:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 08:53:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 03:53:27 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 6 Sep 2023 03:53:26 -0500
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
X-Inumbo-ID: dc1885e4-4c92-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ag+RyM0wldVG18Xah7WlKhb6VNUqy0SY7UIhLE/FrLFEVXLd+aL5I1INEH3JPnEUFNfll3sf+lLPgsZ0Y7vSsqOomivkKkbuxPiZbEaUtn5lbuWhl6BMLKWdPphqldg47dglvl7v6uaLjIKrl4cOMm5q+9HhykX62zY/9AoCO6FRgtjVv4xOrMNG27V109ORtbisYNNjIIdQZKe0kkb645UQ0TCkDZqZIpgnjyRg5VrLhvpHKfjNsexT7fIcWKjd12kQ9QkYdMlkjn6xd+eNdX/yyv/Th3knEqRvi+mVPjmRirfsd8FSoy/6cGS3aZxkKXsdR7YX0R+taL55igo/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY9RtrUjxZdgvr8IDgaiUK9SF7yQES3ZNUlQi7LV1Lk=;
 b=npcQCCyMbjM0IGc2BWF36CATt0aUJPPVXd30POQ/JpWhmSEeevUREWf9pv2GIsH6F3owD0/q41jcdCUJaT+YCy1L/d6ZpfX88eAaUyyVmuXk2mkUBdYpdH4MFN8bujQVM7kQQETjqoXd+0FY8VU3iqESWbz/LcnBAD6ukIya8vI9OUbqXkXgisjrHCGh/mQWaXvZQeBqMdszAlaCy1f5mxLb2iA3ZnypYaD8c6wSZr4fbJPhT2x9pg2JV5FU1QLv7CT2ETRPddk9TRTJT0uaWWe2p+BeiHozAAolhG+trEJp5AJWN2owtkejxVWn2f1u/zhPi2xtFDnCbbydmsQuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY9RtrUjxZdgvr8IDgaiUK9SF7yQES3ZNUlQi7LV1Lk=;
 b=2XdSPPkxAvn9Gj9wvf4+Ydgb1D6n1xNMrdJNU06DpaWdKAndgN0bMQaqhNmzBzZeazQ3A2mRkY4e44xlO/tv1FEirjXoZg4BvhCUlLpAQ/+6ydI5QY02HHR3fNpxfnIRlHvNY0HYoCPRrTWW8KwDsSKw5URbC91pTkCDeK06S1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c0dbf43b-c579-4731-f25a-b1a7a008f1ec@amd.com>
Date: Wed, 6 Sep 2023 10:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] tools/xl: Guard main_dt_overlay() with
 LIBXL_HAVE_DT_OVERLAY
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	<stefano.stabellini@amd.com>, <vikram.garhwal@amd.com>,
	<xen-devel@lists.xenproject.org>
References: <20230906083614.25315-1-michal.orzel@amd.com>
 <0bc7937c-e051-ceac-d9a8-2c6afb1196c2@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0bc7937c-e051-ceac-d9a8-2c6afb1196c2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 49eae7c2-20ea-45eb-28af-08dbaeb6bd42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CPuVGTmdqfR1j1p+2OY4rJDD/7oXVrnVJhqH7N+74DxBY335D+jIWX33pbEfBbUqoUeg3QTomKZtWDRD9n59ozqNBtpXlSBd7nhRDnLgHhFRiP0OjcC7zyqLJmY34pIh3DaM51yreoO5PIM2yE+AeGbZkzmNqTeV1SpBcKsA4JPUndjpMr4RSbVS3DhsR2pwGENOVPgqupuLasKP9U2GKcBz6bpoV1AV0EC1lA5520BjUp8Mj8t4XA6rGUVNiMzk7VNBRH3us3V1IJaBReKD0dl2tpvt856qv9m+cbUe1mxqZ5/YvHNJFnFRlGRiPatF0Qeoswfgw6h5xelPXpDJNw+JHBUUnpQaRQZrHYbtdupbLsrXGk+KH8QKx+u8/pc9fkuLMjg3G6l2WkERVX7FJsgyt0fvdGcGvsEMqxMAmxwEono7qjBV2EOSIZ9TZ0H426885L7F8T5xsXQSgpd2boHG3JEjLv7DFRcPn7G6YhOjSrrUUpOa3Ja3vrW9sWEho5+WHaKbYDFlPQAK0doJM4Mvnkfj3jNRbTiR6G3Y/LxcqaILLnGj4iAoUlyiqSosvR1GL3NFxpq4eY/G278/sr8hBcDVZKPzErtZzr0prq0jf8mcTsSZBMEocQPZuKDKu9kMtMjaUDE7sOzxuafXfaMD+eBpqEiOtoJ295ekd5u4E4Ux748AJ37Tv0pKoeu1PkJTvIlfiKacO3iG+kIuvziLuty6bxkvyAj3DGA6UoEb0COus6AY3A9okZSJ/dRVtMrSfIZGS6aStlRT1nmNKV9oQHLxvzHq84j27IUzgqGaBldkB8xLQEQPJVGp9XK9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(6666004)(53546011)(83380400001)(426003)(478600001)(336012)(2616005)(2906002)(26005)(44832011)(16576012)(54906003)(316002)(41300700001)(70206006)(6916009)(70586007)(4326008)(5660300002)(8676002)(8936002)(40460700003)(36756003)(40480700001)(47076005)(86362001)(31696002)(81166007)(36860700001)(356005)(31686004)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 08:53:28.4630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49eae7c2-20ea-45eb-28af-08dbaeb6bd42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802



On 06/09/2023 10:42, Jan Beulich wrote:
> 
> 
> On 06.09.2023 10:36, Michal Orzel wrote:
>> main_dt_overlay() makes a call to libxl_dt_overlay() which is for now
>> only compiled for Arm. This causes the build failure as reported by
>> gitlab CI and OSSTEST. Fix it by guarding the function, prototype and
>> entry in cmd_table[] using LIBXL_HAVE_DT_OVERLAY. This has an advantage
>> over regular Arm guard so that the code will not need to be modified again
>> if other architecture gain support for this feature.
>>
>> Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> There are still other parts of dt overlay support in toolstack that would
>> want to be revisited in order to use guards suitable to be used by other
>> arches.
> 
> Since from all I can tell this will do
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> But I still wonder: We agreed to leave libxc alone for now, but was it
> really intentional that you didn't adjust libxl.h right here, but instead
> ...
> 
>> --- a/tools/xl/xl.h
>> +++ b/tools/xl/xl.h
>> @@ -138,7 +138,9 @@ int main_shutdown(int argc, char **argv);
>>  int main_reboot(int argc, char **argv);
>>  int main_list(int argc, char **argv);
>>  int main_vm_list(int argc, char **argv);
>> +#ifdef LIBXL_HAVE_DT_OVERLAY
>>  int main_dt_overlay(int argc, char **argv);
>> +#endif
>>  int main_create(int argc, char **argv);
>>  int main_config_update(int argc, char **argv);
>>  int main_button_press(int argc, char **argv);
> 
> ... made this adjustment, which imo isn't strictly necessary.
I'm not a toolstack expert but I decided to guard the prototype as well
given that quite a few of them are guarded either using LIBXL_HAVE or arch guard.

~Michal

