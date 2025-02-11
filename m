Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF57A30F51
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 16:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885664.1295475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thrvE-0007Ru-NS; Tue, 11 Feb 2025 15:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885664.1295475; Tue, 11 Feb 2025 15:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thrvE-0007QE-Kl; Tue, 11 Feb 2025 15:11:36 +0000
Received: by outflank-mailman (input) for mailman id 885664;
 Tue, 11 Feb 2025 15:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NMi=VC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1thrvD-0007Q8-3E
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 15:11:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2412::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79c083ac-e88a-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 16:11:33 +0100 (CET)
Received: from SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) by PH7PR12MB9125.namprd12.prod.outlook.com
 (2603:10b6:510:2f4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 15:11:24 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:805:106:cafe::aa) by SN6PR2101CA0013.outlook.office365.com
 (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.3 via Frontend Transport; Tue,
 11 Feb 2025 15:11:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 15:11:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Feb
 2025 09:11:23 -0600
Received: from [172.21.226.54] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Feb 2025 09:11:22 -0600
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
X-Inumbo-ID: 79c083ac-e88a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w199w/E1IzfFYdbIh2wr9lEZ6HjmK/fz35wI1+dyz6slXgJ+WW/Hopi5FuuVg50aqrf70TiFdQhw4NV3t8fxg3mt9kFygJeIOOwVS6QQOTj3TibWucRQVatdnjWswJpuhx2hHBCw7B/lOMU30eUJkeAXI1lLNEhplCKnxnFjsimOlidNKqQGikq9Z8DrITtjlyihiMtmW0awg4VxZWGHKMD+aYWbMO+oAvOpTd0rb6F+NjQkC/y2g1jhjKPl9iwxoiqeTNbR9NgIGLZ33dGtX3EsxB7LuUuEC+1yPvqBnIrpkxfoWL09svhZBCl7XW/pB5EltSgwkCx250fZ0i4ULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3JVTd78im6ZmH7v6neILydXzWSBVLEklfJjgRmabNo=;
 b=GCVh1bbAx46AH56iUBoc044Z9h8JpK2+tcXLB7dZze2X+hnTTdFvVkLDun95mTqJHzlxxcSOEn/NdXf5Cy86iH0t7z3ITi/k5rWTtu1LvHCtpUR8oKymz0gRqs9XhcQ7QxpE7UtGfAnH2CP0KJD82EGtZTzuDXQNbYtn1Hqw7gPTsrC4XJlc7JDEAOSCim9eMS/05EKcL8gR9tlWuxbzWTVBeM8uqO37GZ/6obQyusWX+PMqmrfds1W/KXJGwNWbGlnZAR+tWHax6/HgsvqzpuGi5VJ/8JxnaXiI/cajZaMGh9/IUkSZp3iz8eWfOTKKcS2WVfwhLOuh1BSzdlsf4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3JVTd78im6ZmH7v6neILydXzWSBVLEklfJjgRmabNo=;
 b=ZDew4Qq2WwY9vLuMO6+QLA8CXSpnNubwr8OqxRWY8kwhNyWnHgZBHReZ/Z+0vliS2YAjwsDIB+2ECndgHukWoW1sez+f/Nv8ce6hPkGC/QakycWrwd0EPW4qzBMC0NBQE84212lnDv1p2frvRHFCUhAz2TQjic6r9qzcqQUeT68=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d5f47793-badb-4d38-a62d-0fe47d6b1293@amd.com>
Date: Tue, 11 Feb 2025 10:11:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
CC: <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-4-Penny.Zheng@amd.com>
 <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|PH7PR12MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 950fc21a-8fdf-4bcf-d7d6-08dd4aae592e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU5GSmp5VHlzbVltL0FReUZxUTRyUTc2UkJZRldvNmxvVnhiU1lkcUw5TTVP?=
 =?utf-8?B?M2s5SlAwRkZwYWVTeStsa3ViN0xMTHJJeldReG5vUnk0UjZmMUlSbWlCdHMy?=
 =?utf-8?B?YVFkVGZhSCtpeFFOb0VkT2lLbEJZTWRtZ0J6aGNwWWdEUTRTSE54Nm5SSERS?=
 =?utf-8?B?THFDM1FkVmoxK1h4YXU4ZmlZbXl5dXFVbTZEazRBNHRhQlo2WjUxcTVpMVhl?=
 =?utf-8?B?cFMwRWpDaFd2Tml0YUFXZnBFTTRtT0syNXZXQkRYNlF4M1lod3g1RDIzTXVY?=
 =?utf-8?B?WElsVmpZUmoyWk96THFtU00waGhnOVhuMlcrZmxxUDdkbXBhakIzMktIdzlk?=
 =?utf-8?B?emJqSVlwekQ0NWFWZlNTRVd3SE5iWDBrUnpqT2J1dEhPdXA4T0YwQ1orQ2F4?=
 =?utf-8?B?dlR6VXU4aFdmMWpiNVc4blhDV3NheUx1VnA0Q2poZVRTTWZUb3hoTDlZRU4w?=
 =?utf-8?B?MGhSbUdoK1dEQjA0R3dqM2JxMTE0R3UveHZSWTRtbVpDek5wR1RXQ0VZNDJp?=
 =?utf-8?B?Y2N5b2V0c2dvTU5iSVVnUlpQQy9ZMnIyY0lUOGpndHFxYkVKckhOZnc1QVZJ?=
 =?utf-8?B?cGxOaG8vUHVudUFpQWUzU2IzeHRKRWQrN2dqSU15YVV2eUxpTEttWS9uQjVa?=
 =?utf-8?B?bGs1QkNNMkhJVVFaaDBrWEo4WC9BSmxlbzN4QmlpeDU3THF3RjhwK2VYUDBo?=
 =?utf-8?B?djZFbE9hQmkzS0hGMEF2RjFTZTdzU21RQVhoNkROZFVJWFkwK05ubjZFdlhJ?=
 =?utf-8?B?Y0svcTdGTE1PdHpOdUJ1M3hhaWszdEM3c3hJdlE1c1VTbTNyaTRpYUxnV1NP?=
 =?utf-8?B?VEEzKzU1TURxOXVYdXNIOGI2bFJtT1VZTmZvZ3lnaW9mY2M0K2FsenE4ZmI3?=
 =?utf-8?B?QlFjWjRBSXJqOWc1OXBmUXRjNW1la1dZQytIajJvQkJyRnVTWkcrRk91MTdQ?=
 =?utf-8?B?Sm02SDJHK01wem9tRXhkdDBZbStZZ3RiZWVHekVPY1NSU29rK1pySjgvMHpm?=
 =?utf-8?B?eVZadmFqV1Rud2xadmdzMTY0QTJaL2ZMN3ZReDRrMkVDT0JscDJLa0Y5RGYv?=
 =?utf-8?B?Y1dGamlUdW4yUEwvN0N2U2ozL09TZG9PenVOMGdJV0dDZXBKK0Q0SDFqeGRj?=
 =?utf-8?B?dm1GdW84eTJiNW1VZXJvMG93RmpIMTYyT0V1NUY3eDRRUm1JZTJ6a1czWWpW?=
 =?utf-8?B?T211ZjRPeVpDeENyTkRhZWNRRzg5Y0gyd2Eva29mcFQ4M2xrRmQyL1ZBTzV6?=
 =?utf-8?B?eFNPZ2gybk1JTUJiRUhNbWkwYjdyL3lLY09PT1lzS1g2SHFaNjdHcVpQblV4?=
 =?utf-8?B?eUt0MGNOaUpPcnlDdGdacnE5VnJibSs0ZkhPVCt3aXU4a2pHQkIxRkgwSGJh?=
 =?utf-8?B?NGVRZkVaaE42eGJiM3QzUUxLRzBiMnJtd2F0MWpWTkJob0pqV0ViaU0rRVNX?=
 =?utf-8?B?WDZ3SFZXampZWHhUK3I2OXA0Sm54YkgyUER6RG5wSmFsYnRxSUFDV0w3UWNm?=
 =?utf-8?B?T2luU2RIV2RNYUJxOXpVc29zNjVqcGJtRDFQNjBNV3hGMzh2S1ZZZG9TOTJG?=
 =?utf-8?B?dzRIUTgvQ0s2TFBOUXN0ZHhhQk5iSUg5Z0VWdTVWL2x1UFNMQ3Y5QVVqaGhy?=
 =?utf-8?B?WGtVTjBNMjhWS1dTdTVZRG1obFFZMWhNMVU2L2ZCS0RzUVlUaW5BTWNzVmFa?=
 =?utf-8?B?dnJuaDZoUElkN3FPcEpBa1pIZ0YyS25xTVFmOGZmaFBiTktJSjVnVUxXRkVn?=
 =?utf-8?B?OUZOMUhVL25nRlJNdkIwYm9jTW9GN0k0NTYyeWJQVUtJM2YxdFcrQThDbXV1?=
 =?utf-8?B?ZWNGeGJIeE4vMXZMR044cTkzY3JYTmZwLy9kNE5aVm91Slg3VDhBUHlnWHg5?=
 =?utf-8?B?RWJOcEdjWVhqNUtwZ2w1b1FOZWlpeHBlYUVmTUNQL1o4cDlBbStDY2c4T2cy?=
 =?utf-8?B?a3NSWEUra2dOeHhWOEduU3cwQU5tekxldTQ5ajlYK0NlNGh2aG5XcHhNV215?=
 =?utf-8?Q?TjOdGeDmF2hcpg7YTHi5FyIrOM8g30=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:11:23.6548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 950fc21a-8fdf-4bcf-d7d6-08dd4aae592e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9125

On 2025-02-11 07:08, Jan Beulich wrote:
> On 06.02.2025 09:32, Penny Zheng wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>> @@ -0,0 +1,64 @@

>> +static bool __init amd_cppc_handle_option(const char *s, const char *end)
>> +{
>> +    int ret;
>> +
>> +    ret = parse_boolean("verbose", s, end);
>> +    if ( ret >= 0 )
>> +    {
>> +        cpufreq_verbose = ret;
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +int __init amd_cppc_cmdline_parse(const char *s, const char *e)
>> +{
>> +    do
>> +    {
>> +        const char *end = strpbrk(s, ",;");
>> +
>> +        if ( !amd_cppc_handle_option(s, end) )
> 
> You have an incoming "e" here. What if the comma / semicolon you find
> is past where that points? (I understand you've copied that from
> hwp_cmdline_parse(), and should have raised the question already there
> when reviewing the respective patch. It also looks as if behavior-
> wise all would be okay here. It's just that this very much looks like
> a buffer overrun on the first and second glance.)

It's been a while since I worked on HWP.  I think my assumption was that 
you are inside a nul terminated string, and command line option parsing 
functions can handle end == NULL, so it would all work out.  A too long 
string crossing " " or ";" would not match.

>> +        {
>> +            printk(XENLOG_WARNING
>> +                   "cpufreq/amd-cppc: option '%.*s' not recognized\n",
>> +                   (int)((end ?: e) - s), s);
>> +
>> +            return -EINVAL;
>> +        }
>> +
>> +        s = end ? ++end : end;
> 
> The increment is odd here (again inherited from the HWP function), as
> "end" is about to go out of scope.

For HWP, I copied from setup_cpufreq_option() which does similar.

You'd prefer:
s = end ? end + 1 : NULL;

That is more explicit which is good.  I considered using NULL back when 
working on that.  I think I when with the current form to match 
setup_cpufreq_option().

Regards,
Jason

