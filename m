Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4489E0F55
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 00:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847132.1262270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIFs7-0005PJ-Vu; Mon, 02 Dec 2024 23:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847132.1262270; Mon, 02 Dec 2024 23:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIFs7-0005Mc-TG; Mon, 02 Dec 2024 23:30:31 +0000
Received: by outflank-mailman (input) for mailman id 847132;
 Mon, 02 Dec 2024 23:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iA98=S3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tIFs7-0005MA-4i
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 23:30:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2416::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69b4a4de-b105-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 00:30:28 +0100 (CET)
Received: from CH0P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::13)
 by DS0PR12MB8503.namprd12.prod.outlook.com (2603:10b6:8:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Mon, 2 Dec
 2024 23:30:22 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::b1) by CH0P220CA0011.outlook.office365.com
 (2603:10b6:610:ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Mon,
 2 Dec 2024 23:30:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 23:30:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 17:30:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 17:30:21 -0600
Received: from [172.25.146.163] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Dec 2024 17:30:20 -0600
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
X-Inumbo-ID: 69b4a4de-b105-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyVR5KfG0GjzSUNWcQgwP2d9slNjJIMEb6GkNl+fV7jFWHF2DLLvKv8FO+zAwSrrNdWuaRhwa6u+fk98HHnv7ZwEd8aWw0utFaRklcZfqQp4c1VROwhyN5HRefyzHVotQjCMBCgxqcScO8J09N+77SRthP8a6MgRfIch0E5ICW/z6qkANKArWCJ+bzAud/xdzn8c0XnE/EyZD759iDlCcYKCFbuKZdSxhTr4OUtZknqucrKIdY6NXtvdxALsCT7e9QxXecvX8Edj4xCKN7rjWpFIpGJEGzHVOq5Y/Wrq5J5v1Y8xHkh15zYhFkmg9bp8P/bOHLSQN3Mc77Zz1uWeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJBWXBIbNO36o0iRQCRlSmzN18HIFarj3mI6Kpjyx18=;
 b=Kt6xCJF4S8HFG93IYuq7wMXuiojVD8hVC1kXVeiJeZOnYgBUkSXSfFKYMtUN9nwT8W5jptioNgju8eqq1yEq/OTtPHM832dHmqWO/pDKsCIUCmLXito1fwahaORAqfgnt81dhP6ltp6e0V8G4AFnyiH1Zs5kJO7SCEnMxAFZxSac5dP41ytxHchX2h0vi1yKylQV/WjdnOhDeNFB3CSfjJ0Q2MKVsYuW/23gAcmBCi+fCyMTb73U8HyMJoZ6X+Mk2I0At0po4sU9HU361fiPVseQhP7Tcz7vssk2s1VpVTpvzXMWgxZxvDMme8jSEoRqFZkASbgVyXeuMFErMI3NuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJBWXBIbNO36o0iRQCRlSmzN18HIFarj3mI6Kpjyx18=;
 b=EIyRzU/xZaWMFJtCXCxkLLmOoR9lWMvK793OVoumwdklL6tfxRaHEk4kNhbdkGRpmDf8Q+5d0yWIZyR8+Ce2LsADY2+EOj44BkYPLlAEmL/OoANpS0+5ggs7o6WtD10OAsERUJpsOHO/gK1+ULAy4w0dkbrmt2813xYtYuz6eoQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <108b16b7-19c1-44ee-ab49-48b5fd63d87b@amd.com>
Date: Mon, 2 Dec 2024 18:30:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 2/2] tools/xl: add suspend and resume subcommands
To: Anthony PERARD <anthony.perard@vates.tech>
CC: <xen-devel@lists.xenproject.org>, =?UTF-8?Q?zithro_/_Cyril_R=C3=A9bert?=
	<slack@rabbit.lu>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241126171941.170897-1-jason.andryuk@amd.com>
 <20241126171941.170897-3-jason.andryuk@amd.com> <Z0imKGddLpvxAZEN@l14>
Content-Language: en-US
In-Reply-To: <Z0imKGddLpvxAZEN@l14>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DS0PR12MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: b87a0d54-1543-46fa-ab77-08dd13294a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGdrTnZCYTdpcURQaUEreVViVVdOdXYrd2JBRUM4MnJMUnBNc0tRd1kvamJv?=
 =?utf-8?B?NTQyNWlxQlRDdjhxd1JmRkRtMVVieWtPUEVDVStVVXpwYXIrbEcvQ1pvSE9Y?=
 =?utf-8?B?SDQzTWQ3VXZyU0dIM3lRTnE3K3lSc01hajZXaXM1dWVrNjhrOUYxRmU1VWlC?=
 =?utf-8?B?SFpZTEZwUFlvMUtuS0RtL1RWSmFPWlpuQkVOcldheCtkS2VPL2VKK28vVXZ1?=
 =?utf-8?B?R1dUVGNNREZaRWMrcHUzaDQzUVdxL2c3K3pxaTdIaVhMcXA2bUZ6ZWd1YlFI?=
 =?utf-8?B?QzBnNi80YXRiNlIzbllualk5YXFwU29sUVFlaWNZRWlrL3ZUZDBsZFlUQlYr?=
 =?utf-8?B?eWxjS3VHR21oTkhOM3hyd1REUVMwY1RIK1cwRnVYalNLNkZJakxqS1haVElk?=
 =?utf-8?B?RkRSR1NnbTdzbkE4WHowaEJpZlBUQ3RZaTNrWUYrajN1eGdPc1BkWTUwME4z?=
 =?utf-8?B?RE5KdnFzMTBpVXdZYjgvaDdqZWVuaklYdWh5bThHT0NLeEhwbUNKTWQ1S0Jn?=
 =?utf-8?B?eHpTUi9oZkVreWdlT3F4V0lteVQzVytHUXlQVjJrcnR0NnNWb0wwT1hGOFIv?=
 =?utf-8?B?ajQ3NUIxUzR4NmRpQWNLeEFiZFJ2eUJwNUJRSnQ2aDFUVmJ3R2d4YjRaVyt5?=
 =?utf-8?B?Y1lhZ1JSU1NaUzA0SndkRzZFK1dGYUErUHNnRFNWTENSeHY0WXR1UmdLMlVs?=
 =?utf-8?B?WTlPdXgrTjFxR2d5OXNOUUtCdjFTNWE0TDVuK3Q0dGducGdEdTRDSTBZckhl?=
 =?utf-8?B?a1hnNGpIS3liZ0dLaFJlcStZNlJIMGY0L2FZMTNiQ1MwZDV6TlFvbnRCTHVl?=
 =?utf-8?B?UEpkQjNkNnYrSWxYMTBLLy8zc0h6eGtBblY1Tk5rTGFPUThWdms0cDQxR0xa?=
 =?utf-8?B?L25IcGM1c2Rpc2EwTXVQOXA0MTJzZVFubkl3VlVzdkd2R3o3dGRDZWtPTnQv?=
 =?utf-8?B?cS9wc1Nlb2RYQmQ2OVdKVGRnTWFIVVIvdHl3c1BaUFlsR0ZYRFcrYTI2Um14?=
 =?utf-8?B?K0ZSTUpaQUQzMzBZYUJUNEtrNnAvQWs1SU9waEtZandITlY2RndnbWJkRXBT?=
 =?utf-8?B?N3hXUHJLaXhwRWF2NHpTN1E1bkRqV3BaZ0tNeFhBSXh0QWlKTEY4ZjRyOGlu?=
 =?utf-8?B?dWluQUtoRFVvZHRmYWdvNWl2Z3FURzQrRk5FY0pNbVVhQVcwTTUyaUxyQU1M?=
 =?utf-8?B?aE43eGROZ2p1cGZWTXRUcEF6Z3ZiTm0vWVpsdDNSb1lJVTNXNTljVXE3UjRR?=
 =?utf-8?B?dUdFRVN1UVc4K3hnVmJBeWZBQ3BoWHNCOFNBSEdkNFBOd0t0OWpvVGRidzEz?=
 =?utf-8?B?MXNKc3kvck9XMXAvWGs4SUJRU1lTc3drUVo5NnFkM3h5RXFGR3hhcUhxSDlu?=
 =?utf-8?B?TEhRdXdVejBBZ2s4UFRKZWlhck1penhyUjFOMWNVbWJYTEtwVW8zWjYrU3Zv?=
 =?utf-8?B?cGhPSTF0Y0k0dnFLMUxkT2NEWXBCcUUxQ0hObHJBMnVwdHlGVDRGZzJiSnZU?=
 =?utf-8?B?YUZzWHFmTFAyNmxncVVQNVlIMGF4VDlCcVlDdTRSYXZIVTRBT3NoN0IxcTlW?=
 =?utf-8?B?QzBqdlV4MXNvSWVtQ09vb3J0TERzUFltTHNCTnhPTVNranJDMTFEQWcyMFQv?=
 =?utf-8?B?bTVtQm9lVGI3YjZLVUtOcTVuTlRNM21lMXJuRkoxc01iUFdjdW5zUDJqRzU5?=
 =?utf-8?B?bGszZnUxTy9DNjFqbFhsQVErTThzaElBd2RCNVFhSUladjI5MlRrR05nUDJW?=
 =?utf-8?B?QmUwL0xteGY5TTNocnhIamQrc05PZStSNktML2oveFZsbHVmY1hrbWxJK0Rm?=
 =?utf-8?B?YzdJZUVsRnhnY2FlK0I3YXJjOGVHeG5Zb2lCbEZ0eStLM1JkM1BUR1FueW5w?=
 =?utf-8?B?MTJmMkw0d1Zqd1Fld0FzMXNkNXRlS25IRU9KbU5nL2NRSmxoSlg5RmZ6SkZH?=
 =?utf-8?Q?7Ebtz+sVBupG4VcJF3eZxWWbVaRnma1m?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 23:30:22.0820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b87a0d54-1543-46fa-ab77-08dd13294a89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8503

On 2024-11-28 12:19, Anthony PERARD wrote:
> On Tue, Nov 26, 2024 at 12:19:41PM -0500, Jason Andryuk wrote:
>> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
>> index c45d497c28..3160966972 100644
>> --- a/tools/xl/xl_vmcontrol.c
>> +++ b/tools/xl/xl_vmcontrol.c
>> @@ -42,6 +42,16 @@ static void unpause_domain(uint32_t domid)
>>       libxl_domain_unpause(ctx, domid, NULL);
>>   }
>>   
>> +static void suspend_domain(uint32_t domid)
>> +{
>> +    libxl_domain_suspend_only(ctx, domid, NULL);
>> +}
>> +
>> +static void resume_domain(uint32_t domid)
>> +{
>> +    libxl_domain_resume(ctx, domid, 1, NULL);
>> +}
>> +
>>   static void destroy_domain(uint32_t domid, int force)
>>   {
>>       int rc;
>> @@ -82,6 +92,32 @@ int main_unpause(int argc, char **argv)
>>       return EXIT_SUCCESS;
>>   }
>>   
>> +int main_suspend(int argc, char **argv)
>> +{
>> +    int opt;
>> +
>> +    SWITCH_FOREACH_OPT(opt, "", NULL, "suspend", 1) {
>> +        /* No options */
>> +    }
>> +
>> +    suspend_domain(find_domain(argv[optind]));
>> +
>> +    return EXIT_SUCCESS;
>> +}
>> +
>> +int main_resume(int argc, char **argv)
>> +{
>> +    int opt;
>> +
>> +    SWITCH_FOREACH_OPT(opt, "", NULL, "resume", 1) {
>> +        /* No options */
>> +    }
>> +
>> +    resume_domain(find_domain(argv[optind]));
>> +
>> +    return EXIT_SUCCESS;
>> +}
> 
> These four new functions in xl_vmcontrol.c needs to be hidden behind
> LIBXL_HAVE_NO_SUSPEND_RESUME, like the whole xl_migrate.c file is.
> Both prototypes for main_*() are already hidden as well as the new
> command in xl_cmdtables.
> 
> Or alternatively, we could probably have the command been present on
> Arm, but I don't know if libxl_domain_suspend_only() is going to work.
> It looks like it only depends on the hypervisor. I can't find any logic
> that would treat Arm differently, besides the presence of
> LIBXL_HAVE_NO_SUSPEND_RESUME.
> 
> But best bet would be to hide those four functions when
> LIBXL_HAVE_NO_SUSPEND_RESUME is defined.

Thanks.  Yes, I'll hide them.

Regards,
Jason


