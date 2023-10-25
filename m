Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662727D66FD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 11:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622759.969866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvaJD-0006L1-Vy; Wed, 25 Oct 2023 09:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622759.969866; Wed, 25 Oct 2023 09:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvaJD-0006JP-TM; Wed, 25 Oct 2023 09:36:15 +0000
Received: by outflank-mailman (input) for mailman id 622759;
 Wed, 25 Oct 2023 09:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XAhw=GH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qvaJC-0006JJ-AU
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 09:36:14 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe59::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef1d8490-7319-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 11:36:12 +0200 (CEST)
Received: from DM6PR21CA0004.namprd21.prod.outlook.com (2603:10b6:5:174::14)
 by PH7PR12MB8016.namprd12.prod.outlook.com (2603:10b6:510:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 09:36:08 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:174:cafe::60) by DM6PR21CA0004.outlook.office365.com
 (2603:10b6:5:174::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.6 via Frontend
 Transport; Wed, 25 Oct 2023 09:36:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.18 via Frontend Transport; Wed, 25 Oct 2023 09:36:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 25 Oct
 2023 04:35:50 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 25 Oct 2023 04:35:49 -0500
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
X-Inumbo-ID: ef1d8490-7319-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLzaKy+8MdTG8FbxPVV7vw5fwE/bKcNYhEEsP4Nu+5TO0ZbAqCeGiMJHA341HOTmRn4MTCvm6ywkV9OF9jgLgAmLFLGmeymnIABjBoI9WKjGiP0x3PuKy3fYaXpj7CsUITtRlpiYw0kBrWG9ap20b07m3YYCXL0ZgbAc+qlrq25a3DMWtVzqLu8mPBeZqHn/NID2Eoy2vTczgMBDrcronvQMRG9UxurvzglK+vocpk0lS3+GOrClOccIw0hOyiH85sXA6+R8h/xzGt3dWkWnPjYfMirIQntTmwGwKg+tu+M6HXFAsodaIQgAD47c9JgQVyCLG2iaMYkavaf2AR+nkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1aPaP2xjV30DPdvW0t8Nsbv/u17umbQei6iGqDYhCI=;
 b=hWgutBfk8hJxR2/HCmtuWwBGlBHbyF6vzkYeTuAlaWmbWnLWmaTry0gQHW0yjCMNNA0MPj2JCD5ImdVHDZz6BpRQ0yP4yu/94DBCcdveKP6XyBj7PYZtLBLKWuIjbgwOtjp2bEpGOQLimUDAmgnkzg7xcCoTroJ9S5VCQipiXR5n0ogT4LM8FEM/N7etTClcHtYvDsBc0AMpSZbuRuFCYnARr/hMKYkk60iBzQ6GvRHpVPZkG2FWWnthM/AxIEomVnltPTV5QkdnMS1DdbGGN5AIKQ2YtYdNtFq4H70X7JIvX5BEI9JdJavl1sKSfbUhuvaZ4VTUHRlC6mv6lAr0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1aPaP2xjV30DPdvW0t8Nsbv/u17umbQei6iGqDYhCI=;
 b=U9Eabq4Nwkoppxc3ElbNMYMIM8F9cbNAbrTNK+bhDVdW+E4lK/j9r9XLQ6UhN+Vk6aHbobdis3WlXuV2XmfuXuKbrjl5q1WuXGfTnoOU4/0ZSmbxwX4fAhB6DXREzQ/pLpuVH6S4rzfbzPF4mhxpt8wXx81QDr57gNTijS6ylko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5bd44ff0-041d-4fc5-ad6f-c9e1158c474b@amd.com>
Date: Wed, 25 Oct 2023 11:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.19][PATCH] build: Allow setting KBUILD_DEFCONFIG in the
 environment
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20231025082834.31680-1-michal.orzel@amd.com>
 <9e646df5-a9de-545a-e827-951a161c935f@suse.com>
 <14ab687e-2d2b-40a4-9f79-3f547bba286c@amd.com>
 <4cb8a480-a587-22cc-2f11-fd9d6cc8c1d3@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4cb8a480-a587-22cc-2f11-fd9d6cc8c1d3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|PH7PR12MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: debf43f9-31b4-4d1c-96bf-08dbd53dd11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xRLYgKW734WQlLfZaZkQa/pNMTbiJoHz0L4qfc1LNjxGjGQg1h4UwV0YG8QlrPavcmcTSxBT8mRmv+Je+60VMBJ4OUiqwqFyzKjle2FnJ5tL6+tQ5/zsITiuoYWttBMeRzOQDPpudLQlTpVa0jVsam6S1Brt0SgjDs7k4zYX90wdBFyn87/O1ZwV+KL2nNAXTO8H9Y6BjxlnhUdmspb34KOhoRn1DyjGivoEsDI8uOrQhj8y9NrYcEH+6iiUpSsvEl4d8oECXEAaShiAb6KY6rYX9ZUyEbvxI3ZAlgqiqacn4nmKYEOWUuFp2GaCe8YuPQUmRHz1BonMiZtzIWCCHyZ5+Qgayrx7k29qlruDr+Piq/xPXuBw/ze2nd7j17tOUTNoVFiwBp+eguJQ3CASAWv45KidyiyrZY9WxkVQt3JGxqiA8S5YYLaHlID6FyWjvrDag/YwclmcZ0fT6uyTL0YzRskEso24+Z9MDajra940WD5ehK9X4a/Awvvg6ZNe9okyb96TKL+SaGjWzV14JPtRxWV+F4zkS22fUZhLywbr7kabXOkwc54MCEgeSsFM0NVnHrk+fJ9IPqLqBm33FRTsRyvHsQ+Il6jxYowxb8248eT0ixmmGjsocaCCcsrtRtrduFtBCYIg9MH5mGFe7YDjgLRfYQahC26xwo6r7rtdsNfHW0orW/GXtH7mhoU6XfUMITr1obKfPaW73gCuvJdyeMqcXtVBxTsItL+Pt74wGETEmNlAzeOHDUlqT8OjJ3n3T1BnswXHfwOvYGLjoH9/PeAnbCCjhAaCxl/Jg0g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(40470700004)(46966006)(36840700001)(26005)(31686004)(31696002)(44832011)(2906002)(40460700003)(86362001)(5660300002)(36756003)(4326008)(70206006)(8936002)(6666004)(8676002)(2616005)(356005)(16576012)(81166007)(41300700001)(54906003)(36860700001)(82740400003)(6916009)(70586007)(316002)(478600001)(83380400001)(53546011)(47076005)(426003)(336012)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 09:36:08.0218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: debf43f9-31b4-4d1c-96bf-08dbd53dd11d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8016



On 25/10/2023 11:26, Jan Beulich wrote:
> 
> 
> On 25.10.2023 11:21, Michal Orzel wrote:
>> On 25/10/2023 11:10, Jan Beulich wrote:
>>> On 25.10.2023 10:28, Michal Orzel wrote:
>>>> At the moment, in order to use a different defconfig target than default,
>>>> one needs to specify KBUILD_DEFCONFIG=<target> on the command line.
>>>> Switch to weak assignment, so that it can be also obtained from
>>>> environment similar to other KCONFIG/KBUILD variables.
>>>>
>>>> This change will activate the use of KBUILD_DEFCONFIG variable in CI
>>>> build jobs that so far had no effect.
>>>
>>> I'm certainly okay with the change, but the above sentence looks misleading
>>> to me: Yes, the envvar was ignored so far, but isn't it the case that the
>>> envvar as specified in CI matches what Makefile set it to (taking into
>>> account that for RISC-V riscv64_defconfig aliases tiny64_defconfig), and
>>> hence the specifications in build.yaml could be dropped (until such time
>>> where truly an override was intended)?
>> Well, today riscv64_defconfig matches tiny64_defconfig but it can change. Otherwise, why
>> would we need to have 2 identical files? Looking at the latest full build series from Oleksi,
>> only the tiny64_defconfig file gets updated which would be the clear indication that what is
>> specified in the CI matches the author's expectation.
>>
>> Also, I never mentioned that this change fixes something. I just wrote that it gives a meaning
>> to a variable that so far had no effect.
> 
> Well, sure, but if you e.g. said "... that so far would have had no effect
> if they didn't match the default anyway", things would have been unambiguous.
Ok, I can see you did not provide any tag in which case I will wait for other's feedback.
Then, I can either respin the patch adding sentence you suggested or leave it to Stefano
to do when committing to his for-4.19 branch.

~Michal


