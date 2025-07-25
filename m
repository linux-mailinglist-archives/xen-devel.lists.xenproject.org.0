Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0044B12102
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058170.1425858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufKTr-0008Ug-UJ; Fri, 25 Jul 2025 15:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058170.1425858; Fri, 25 Jul 2025 15:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufKTr-0008TS-R3; Fri, 25 Jul 2025 15:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1058170;
 Fri, 25 Jul 2025 15:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufKTq-0008TM-Js
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:37:06 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:200a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c9d360-696d-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:37:03 +0200 (CEST)
Received: from MN2PR06CA0005.namprd06.prod.outlook.com (2603:10b6:208:23d::10)
 by SA1PR12MB8117.namprd12.prod.outlook.com (2603:10b6:806:334::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 25 Jul
 2025 15:36:59 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::a0) by MN2PR06CA0005.outlook.office365.com
 (2603:10b6:208:23d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 15:36:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 15:36:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 10:36:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 10:36:58 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 10:36:58 -0500
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
X-Inumbo-ID: 35c9d360-696d-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6mJ6YSGi63hEP/4dgCuDqqVrYvwsD32FymFYJEjb8gNKcglSlnedAqQ3xv+a4eLuP59qRiA77a6MrEovEHyTAyxSvlz7BKd2SUDnauZFkNyYorDUBEm2LmJvc1u3R88ZCqAc2tLc2EP9iG85mskX8St6F6WQ6yNGKDGmPMrACpUO+jctHF7f0wB15TUzL6c8yXhhmHg/BPr9vNntBBwvbrWUGBhl+gBR54v/yjwb/lAu4ICiWgpDGoMorhtZLAUGopT8rxEZojk8lllBvjr4sGBlAK1oJ2q82GgKv8nliO2znK18bWy6j/f9lH9sNRpwTj1ZUzJiF7IZdTTj+OoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4xbNpy8wB7RT9jebbL8ji5ymdlE+KHsdiPHpiYa0SU=;
 b=nB4gmOAHvJDBDLsTs6VX8U2DP2ALr2mKn32YtgOhd+iWOQG/1Fv5Mi4SkY8znVS8wuclB8SC1haHD+ueTrbgcMvXD7CkyO5UmSlhSjSFSdCEYrO+R3uitbmEbWNZJJMCvYrWSqDbGohJUVIIKIXoLmbOX3xk0CUpb9mfv6mo/hCXrJSs9MfAE8j8vpSZVZdB0EqrMkEzxUo6h1nRfBLsMQgXob79zshDJ0UapgBKyHHYoBEqRz+CvKlIU5C6WwBEoXsBelLkeAagYZ4442/HxlNPJgF2Mz2mB2IoCysrLq4BAHipT5KYQc+SovYAcrXtlRROWWjrbv3VNYdqpgT7Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4xbNpy8wB7RT9jebbL8ji5ymdlE+KHsdiPHpiYa0SU=;
 b=p5Sih1slHwN6ZivYRUBbbbxZIDlNUCqtdBc87wEi0jjyOgqvWImpCoGsMonYQD0PT/28ANmy4fc08TLf7hupHHQ183r7VfhbPcFs3y6yNDF4KfGq52syiieo3Gvdhi2KeNowi4UBJaH7DhglT8ZgsfdsoLVHMsjgWvyF0GH3XzA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fdd11879-bf58-47da-be61-c54869a7f993@amd.com>
Date: Fri, 25 Jul 2025 11:36:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] tools/xenstored: Add get_domain_evtchn() to find
 evtchn
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-7-jason.andryuk@amd.com>
 <0f63f37d-112e-4267-b4a2-8ae740b2b3b2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <0f63f37d-112e-4267-b4a2-8ae740b2b3b2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|SA1PR12MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cb2025-e848-40bd-5d4c-08ddcb911841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTJLb0hiTUxGdFZDNEcrT2JaNmxwZHB3RUxMVWJ4T0pVMHQ0b2Q3WDM5MDZl?=
 =?utf-8?B?MGFMcmtNVWNYcy83RlBQZG5GUEh5SWRyTHpDZUgzaU5iY3ZDRlRUNDFMdkhm?=
 =?utf-8?B?VlVDTmtqUTNaYlp2RkpOVThjVzgyYWZwVjlMYUlTK2kxNFpLZjI0ZzFIdTF3?=
 =?utf-8?B?TGwwbGFRUzlVSzRnbHdTTWw0R1R6ZFJaSkFmRkQ4ckM5dkJzVm8vVExqN3dP?=
 =?utf-8?B?b1NWZm1iU3FtSTdXaFpBVEtmNllkVVNDL0NRRnZRaHZTNkk0OEhjTXZ0UTJN?=
 =?utf-8?B?YXFVRlBHdU4yTDNPelI3Q3I1ZFJxMmt2UDhSYjJiUHdVMXA5bEZ0ZVROd3Rp?=
 =?utf-8?B?SzFnYjFEc2VaMGJ1cmVlSk5aZ3Rab2M4bForcStWYnF1MnlzM2hzK2Nta2lG?=
 =?utf-8?B?UUFaNWtPdnh0elhYaVozZWlEUWk3a2hhK1pmdVMzR1VSc3YzcXhCM0FRSllY?=
 =?utf-8?B?UGI4d0hyMnI4bDZ0dUlHaXJydVFsZHV6RThPMHFjZFNKQ0NzVTQzSWtuR1Vz?=
 =?utf-8?B?TVhKQnZzMUNrakdkYm1GWnZZMjRwaVpOQjV1VE1QTWdQRHBKK1VwMUZWQ2Jn?=
 =?utf-8?B?WW1UVTNVTlVRSU1Fc3BwMEh0bHZadEFwc0RkckJMZ2tOeVY0UEZEYk5xcnNT?=
 =?utf-8?B?ODBrOGw2MHZoZnlOejJ2TUMvd3VWZEtnUXVGSVB0aDdBSTRSV2p3angrU2RP?=
 =?utf-8?B?NHNEV1hzVmFyWHJ5dndtUVV0ZUlxYkp5SGtsWHFPMGtRZVpXY3Ntb1JNVngr?=
 =?utf-8?B?Q0FCVkRyOXdkZmtwaFBwYzRBaEpNSW5rZ1JCU2VoSm9VbTlwa2YxeEg2M2dw?=
 =?utf-8?B?Y0k4MFQrZDdBVE8yRHJRQ3J4cmxEV0dVMXRDTWhqOUd0ZkpDVGlWZjV2L29P?=
 =?utf-8?B?V21xRWFJNEdOZ1BsUFpLT2NzaUF4ZTdxQ2Y0bkJVbS9jVGRqdklVTHc5cnBv?=
 =?utf-8?B?MHdVd3phMzFRZ0ppbHBDSUlrL3BzS1psbFdiYzR0MyttM20wd0RMQjNjRFpZ?=
 =?utf-8?B?TEt4S1R2eDIwU084c0hmZ1daa0ltOWE0M2lVM1dLWU9FYTVrWFBHT0kyRmM1?=
 =?utf-8?B?WElSaHA2MmFnUjNON1E5czE0L2JqU0o1bHlPTXk2QjNiWThuTzgvemd3dmw5?=
 =?utf-8?B?dE5BQ1pleElGbytOMWpDVmRzRWxNZVcrUXJvZkEwNHhFdjNaWDhYMkFFcE1r?=
 =?utf-8?B?SDhzYW9LOSt3YlRTc0lOb2prTnJ1bFhQMlpFdEdLTVBUQlNHRlRBMnRQQkVa?=
 =?utf-8?B?UHdUeW1KclpVbjNHQTN4em1iV1BLejVaQXRWM1dXaDhvV0k3OG9XeUZsRXRu?=
 =?utf-8?B?SmlxNHF4QzVtdkRaM0kxaFNiODRYY3JuRCsvK05MSmxJSXRnbFBkcThNOVVz?=
 =?utf-8?B?Qnk3Y2JrSjIzUXJCQTlCMW5XZmw0QXNRR29Mc0xDWkpHUVRHVHc5WUwrRzZP?=
 =?utf-8?B?dllBK2s1SG9KNnlTNFdaOW93S2FwdEg1U1hWUHRiRzdFb3BNT080RE1aT2dn?=
 =?utf-8?B?S0tSZmtScGdLMFp1QTlHUjNtV1d1Tkk1N1kzaU0yQjIvSElHZ1l3cmlobTBC?=
 =?utf-8?B?d2U5QlB4a0FTOVZXaFdza2RTdEw0MDVUNmNVdjZ3TzBOMlJYQVFzRGJkaTdt?=
 =?utf-8?B?NVdhQUtuUGhYM0NOL1pSNmxZc0E3MXZ4RmpCTWt4ZXlpS0txclRaRzBua2R4?=
 =?utf-8?B?LzhoU1NCeW9VdGVkWkJGZVFYN1VkV2FLTGhxWTVuZVFVTFJWMEpCcTZGVURh?=
 =?utf-8?B?Vm01YTgzQi9ncFBaUEM4SVhXL3JOdmVyVDMrblFZK1RUWDg2VmVqRUFsSllm?=
 =?utf-8?B?RjFGZXNYQXpvZkh0TkJFN3VBRW1HbnBnYWpHZE5WZXZTaThzQys3TGZucklO?=
 =?utf-8?B?WU95QXhsbit0ZGZLRzB4YU0yK0ZkSG1VMkJ2d0kyWk1yVm0xSFhyK2tjTWdy?=
 =?utf-8?B?UlFjVlpqRkRhQi8zUEd4a2NrNFNUTlQ0bzI4WnUxQ2RURGQrZTJmT2J2NlZK?=
 =?utf-8?B?RVV1Y2pIWVF1Q0NBYWZ0KzJicGVkM0hPVjNXMDFMdm1GWDJsaElDcGdoajNY?=
 =?utf-8?Q?sU301b?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:36:59.3694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cb2025-e848-40bd-5d4c-08ddcb911841
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117

On 2025-07-25 02:41, Jürgen Groß wrote:
> On 25.07.25 04:28, Jason Andryuk wrote:
>> Add a helper to lookup the event channel for a domid.  This hides some
>> of the differences between dom0 and stubdom xenstored.
>>
>> It highlights the different meanings between get_xenbus_evtchn() in a
>> stubdom, where it looks up dom0's event channel, and dom0, where it
>> looks up the local event channel.
>>
>> The default return 0 will be fine as any other auto-introduced domain
>> will needs the event channel populated in the grant.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   tools/xenstored/domain.c | 38 ++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>> index 1241f8c73e..1c52254ba8 100644
>> --- a/tools/xenstored/domain.c
>> +++ b/tools/xenstored/domain.c
>> @@ -1251,12 +1251,41 @@ const char *get_implicit_path(const struct 
>> connection *conn)
>>       return conn->domain->path;
>>   }
>> +/*
>> + * dom0 xenstored (posix.c) uses get_xenbus_evtchn() to lookup with
>> + * XENSTORED_PORT_DEV.
>> + *
>> + * minios stubdom uses get_xenbus_evtchn() to look up dom0's event 
>> channel
>> + * from the command line (--event).  The stubdom's own event channel is
>> + * returned directly.
>> + *
>> + * Any other existing domains from dom0less/Hyperlaunch will have
>> + * the event channel in the xenstore page, so lookup here isn't 
>> necessary.
>> + * --event would not be set, so it would default to 0.
>> + */
>> +evtchn_port_t get_domain_evtchn(domid_t domid)
>> +{
>> +#ifdef __MINIOS__
>> +    if (domid == stub_domid) {
>> +        return xenbus_evtchn;
>> +    } else if (domid == priv_domid) {
>> +        return get_xenbus_evtchn();
>> +    }
>> +#else
>> +    if (domid == xenbus_master_domid()) {
>> +        return get_xenbus_evtchn();
>> +    }
>> +#endif
>> +
>> +    return 0;
>> +}
>> +
> 
> I'd prefer to have 2 get_domain_evtchn() variants, one in posix.c and
> one in minios.c. This way you can avoid the #ifdef.

Sounds good.

>>   void dom0_init(void)
>>   {
>>       evtchn_port_t port;
>>       struct domain *dom0;
>> -    port = get_xenbus_evtchn();
>> +    port = get_domain_evtchn(xenbus_master_domid());
>>       if (port == -1)
>>           barf_perror("Failed to initialize dom0 port");
>> @@ -1271,11 +1300,16 @@ void stubdom_init(void)
>>   {
>>   #ifdef __MINIOS__
>>       struct domain *stubdom;
>> +    evtchn_port_t port;
>>       if (stub_domid < 0)
>>           return;
>> -    stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn, false);
>> +    port = get_domain_evtchn(stub_domid);
>> +    if (port == -1)
>> +        barf_perror("Failed to initialize dom0 port");
> 
> s/dom0/stubdom/

Thanks,
Jason

