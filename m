Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A23A93FDD7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 20:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767098.1177676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYVXz-0005f8-Jo; Mon, 29 Jul 2024 18:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767098.1177676; Mon, 29 Jul 2024 18:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYVXz-0005cy-G1; Mon, 29 Jul 2024 18:56:39 +0000
Received: by outflank-mailman (input) for mailman id 767098;
 Mon, 29 Jul 2024 18:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVSF=O5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYVXy-0005cc-84
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 18:56:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4656d26b-4ddc-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 20:56:35 +0200 (CEST)
Received: from SN7PR04CA0212.namprd04.prod.outlook.com (2603:10b6:806:127::7)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 18:56:29 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:127:cafe::c6) by SN7PR04CA0212.outlook.office365.com
 (2603:10b6:806:127::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 18:56:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 18:56:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 13:56:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 13:56:28 -0500
Received: from [172.28.183.80] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 13:56:27 -0500
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
X-Inumbo-ID: 4656d26b-4ddc-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDMopCobvKJO7V3IQDekX3czO4ee+hDdvQV0sTr1S29yGLlbXcYRVd+nirpgBR1wAq6+szCMvJ269fF9wSf6yUom609oI+Jypk0nuVRY+uRnaMmjdWeo5aeGwR/bcHPY/VpVuauxJSUoMqtwSX8GjMlXKAHRsgstSed/6SQwOMulMjBo0OYWXT1jpbMlK4o3qf+HAuwvZaxPP7/WpHDVHP68VKYM2G2kM5z8i4lQrDq3bX6rdVCmfmh4UVdksRoiVkkSbgHHwj/tONcprQPjOHyIqKhQTnCGrPLnbNQo7guYD71HySchAgSQXAClbpsuo2kCJHxTGOOOmEUK9qqPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T88bbNJu3PbBdyPbHFKrw8RU47CY/WC7OGN+CqH8CWo=;
 b=d/nPFSeIepbhqSBbZKktdE058HqaoaUswclMtgXIzss7FJi2Q33smKthxn73CfsLkOMD0MsOBByKIlE5M3zfYDKWgNsE+Qu0TdAG4HjC+LWQNFdLge6Gefi6cptNI3Z2jtV7FEcPTqf/W1RWmIzLAPyJ51AldxlE5f4qgI3aicQdQbgbosWHPyyNp/4vA8lL2kqS4KZJP54ElPt12Q5jaZM48iRBtbA031Ksob3j0uVu5pEAvnTEooGu3zbe0doHNnuYmlLGJn3Q9pVcRmWiIL0mOIctnjTcuwzQkSgVGnDnK2ZO5lS0+Uz3ufjsCsqJ4MDton7MJXIUdfG+seeZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T88bbNJu3PbBdyPbHFKrw8RU47CY/WC7OGN+CqH8CWo=;
 b=WOdjM5nSL8UxoDMXYBsISu5UIDM6pnwVog0qWTMsudO+Zr367u60BDML2ENAnO+1YJ5uaAZ9JI/v3PB2cr/JO00H7UTm7joN590JmgjW7Rxaln4H67ESKSC4q3/mjai6BobYM7jsdzMeIQgtbqpz06d8JFeSh+deZLnhIpP38Zc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5d015d47-0ba0-4a3d-861e-2c7712d9a97d@amd.com>
Date: Mon, 29 Jul 2024 14:56:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen: add no_instrument_function attributes
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-2-stewart.hildebrand@amd.com>
 <baa57ab0-60c9-49b0-9601-09bea081ddd7@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <baa57ab0-60c9-49b0-9601-09bea081ddd7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ebe96b-4511-4239-89d2-08dcb00027c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUROcklzTG5hMHg5ZkVWZ1F6UHBGL3IvTnF4ZmxjbHF4cXhpako3WjJhYk8x?=
 =?utf-8?B?SkZVQTdXOXRDUnpuWHgweWtibVI0ellwbDF3L2traDg5MThjTVJmN2VIQ1F5?=
 =?utf-8?B?cGpMMmVJeTN5YVB5SWtvNkxNbkFTRjVHeW9iZEpJcnRpVUJ6RlQzeWJjY3Z2?=
 =?utf-8?B?cWUyNmo1RUZlRDIvTUtITkRDd21rdzJhNGFzSWJ3U2dsSjl6QnlxYTFSbld5?=
 =?utf-8?B?NThXL2JjRWg1TG5XTzYwU2V0UGtDc2NrbGtQWmxxRUVlRmdQSkhvdE1sYmdL?=
 =?utf-8?B?bHRaWVVWR253NFQ5Z1pMdzVxVFlIb2R5WjVwYUpxM1N4eVE5RkYwODROckxR?=
 =?utf-8?B?R3RRRjVFTnkyanhINUNqZC94MnNMQWpkSk9rR0l3cEtMZGx1dW1mMjZrNTNw?=
 =?utf-8?B?VGwxZFc2amJHbmpSRW91bnQxMlNVZG5sbjU4VDFvanFuS0E0ZTI3TmFVQmFw?=
 =?utf-8?B?ZXBpYTJ1Rjc2eWhWTEQxNGg1QUJVL1pVTWRuY3dCUVgxSFFNay9OcWV4QnQ0?=
 =?utf-8?B?NTNZNm5MdnVIdmZIMExOcGZJRXlUMVNNME11bDVPWFZXaUNFOXdzRThXZDZ3?=
 =?utf-8?B?RjB3RmVjZk5CMUdRRnN4ZWQwNVMwZW1aYnNBNUZXZmFhVkVCTEs1SEs3N01N?=
 =?utf-8?B?TmN0TllyTFlncXQ2TUV1TWY0cnhvamtSbGpYTXg1dXJzS1RwNVhib3RYZE10?=
 =?utf-8?B?eUhIVnc2Vy83Z1V3QlV0N0pTZ2dxQjJmNW1pQ2FVK0s5WUZzRVVEQitKeDZ1?=
 =?utf-8?B?Qlc0aFJMRW11c1QvWFpxalpnSmFuN2RJVnFja2RIZ0xnWjRzNzNLa2x3cnBk?=
 =?utf-8?B?T3NURGp4TnlqSEk4OC82d3BWbUF5Q2FOdnhTQjBHUm1zRnVWeTBNQlhlVldr?=
 =?utf-8?B?RDVqditNbTVpcUtkKzJhelpyQ0xDeGJvWU1KS25nS0JqRzJhVWxhUXhoTVZC?=
 =?utf-8?B?YWxqUUVNTDJXWm0zWEZ1bTFjYkdodFFJQ2NpcXVGRE0yMURpeTZicFZzV0J1?=
 =?utf-8?B?M1hyQ0ZFV1MxRFd5bUZ6M0lWcDJPT29MaFZqcHNnak5BU2lZNVpUMWFTNm5p?=
 =?utf-8?B?dlAxN1lCbzRGQmc2RXpETllJbjlUTDNKQ1QvTC85ZEVFS05mWG5reFpZSVdm?=
 =?utf-8?B?N3o2SmlGRVpNVFdnUUozSFJCQU93M0hvTUxuZEpLMnlKdDMxMkN4Zy9QS0s4?=
 =?utf-8?B?dm1paDUyT3JLZ0tNU3J0ZXZEV0pNK0M1T3B1eGs1V2lnM05ESmRkSVNTRFhC?=
 =?utf-8?B?OVdKZHlrK3BYa0k2TElhSW92REtYeXBiTTE4ZmlXcjhyTFpOZHgrQWNUdTdK?=
 =?utf-8?B?MmJOUFcwdHpUR3lGMWpFMkRmVVhKd0lnODE1QUROcE55MFQvUXB2MlpyVEpM?=
 =?utf-8?B?aC80enRnTVV0TGxpSEtrL2J5VVdjSVNYM3JuSTJ2aE5zdmZ1ekRCeFRyREtz?=
 =?utf-8?B?SXluNGZrSkMyejFSMjQrRXlCVFliRC85OFZTU2g3bXlIdHNwTmxuK3YxOHBv?=
 =?utf-8?B?ejUyTG9hQzBiZjJJczJWTysydGlVRTdUa2dLd3d1QUhXSGNBOXF6NG1OWldT?=
 =?utf-8?B?R0ZLa1hXSGhFbDY5eHZNaW5DUDhXT1QreEoyYmdiTjZ5WmF6akV4VTYrZ2lo?=
 =?utf-8?B?bmFmdU5hNUp6T1lXNm5SZVpxRE1nMkhNaHZ1RmtUNlhXQ2txYkZ3Q3FVVFdL?=
 =?utf-8?B?SDliTEVtWWdGaWNkSG5sR3ZoYllSYnBSQWV0YVAremNQOU8zcm1za0FTbjdR?=
 =?utf-8?B?ZTFHQ3k4WGo1U1llcFh1NUo5cGpEZEtrSExvVXV4ZWtrY0ZsUEVNRm5NblVX?=
 =?utf-8?B?L0NuL0NwQmtpWEtmNDBoMWlFUzhob2lHU2Jkend4c0VnaFRyMjFtNklQamlm?=
 =?utf-8?B?RWpLbDUzYmZON3JOanptc3hKdk52ejF0bTRQblR0dkRVZEEwYWlXSkxycVBH?=
 =?utf-8?Q?KektCvell7j5QRPcNqNnnnxLGqZBa3uR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 18:56:29.2314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ebe96b-4511-4239-89d2-08dcb00027c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966

On 7/29/24 10:55, Jan Beulich wrote:
> On 29.07.2024 16:24, Stewart Hildebrand wrote:
>> In preparation for using -finstrument-functions option, we need to tag a
>> few functions that don't work well with such instrumentation. If we
>> don't intervene, we would end up with linker errors such as undefined
>> reference to __bad_cmpxchg.
> 
> I can't spot mention of such a side effect from the documentation. Talk
> there is of function calls being added at function entry and exit.
> Nothing is being said that calls to other functions would also be
> affected.

Oddly, it seems the compiler fails remove the implementations of the
affected functions from the object files even though they are not called
in the generated code (because they were inlined). I can mention this in
the commit message.

For example, if no_instrument is omitted from __int_cmpxchg, feeding one
of the object files through aarch64-none-linux-gnu-objdump -d yields for
example:

0000000000000048 <__int_cmpxchg>:
     <snip>
     16c:       94000000        bl      0 <__bad_cmpxchg>
     <snip>

Yet, __int_cmpxchg is not called by anything.

Even more oddly, this appears to be the case for both clang and gcc.

>> --- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
>> +++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
>> @@ -5,6 +5,7 @@
>>  
>>  extern void __bad_xchg(volatile void *ptr, int size);
>>  
>> +__attribute__((no_instrument_function))
> 
> I guess it would be nice to have
> 
> #define no_instrument __attribute__((no_instrument_function))
> 
> in xen/compiler.h. I also don't think these annotations want placing
> ahead of the entire declaration, but rather where other similar
> annotations would also go.

Will do, thanks for the suggestion.

