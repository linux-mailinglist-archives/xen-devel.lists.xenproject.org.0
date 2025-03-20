Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5FEA6A8D3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922317.1326178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH5u-0000zb-NT; Thu, 20 Mar 2025 14:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922317.1326178; Thu, 20 Mar 2025 14:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH5u-0000x2-Ko; Thu, 20 Mar 2025 14:42:02 +0000
Received: by outflank-mailman (input) for mailman id 922317;
 Thu, 20 Mar 2025 14:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJiu=WH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tvH5t-0000wm-Gr
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:42:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79c1d1e5-0599-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 15:41:59 +0100 (CET)
Received: from PH0PR07CA0044.namprd07.prod.outlook.com (2603:10b6:510:e::19)
 by LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 14:41:53 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::bc) by PH0PR07CA0044.outlook.office365.com
 (2603:10b6:510:e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 14:41:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 14:41:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 09:41:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 09:41:51 -0500
Received: from [172.24.79.67] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Mar 2025 09:41:51 -0500
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
X-Inumbo-ID: 79c1d1e5-0599-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHB+2KsglvCLLOhwGeeUcByAS71qsmNgxAbNPRZMzZkaS3vD5rHzFw63PDQasfCRZkf1+sMrtdYvuRuF+CQi18+2cSzvCowrzYe0fNWNctG+ElCpLkDGtMxUBQwKXi1zffpziTfDt6dsyPJTGKYIXRimS8pY8z7BcGeqDyxkqsL3LLP+pSV1HrlauB6y78kKS4gPir4hVM7oo63tPVvZXz0+uhCip27ybn4UP5rKZiQAky4Gpeia7lrb7a31irKBvc6iHkYLeP8vBgAR49RHgRRKdOt8VTs8J9Pn4WNp4g2Jh/cx2tiB4WVKwgkXEJm//D+RmwWeTUxK68oGyvO6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lit5FYt34/fMOegMMpetsvbD/eP0pP1zDU5kMObxm0=;
 b=tQWKmjwvZhcgOKbCHI2P49rFPJ97s7Tky0LkorSrkPZhvG7J6ODpHoWIC3fhrK/fNCjgUwLO1S4eR0/SXeuWZgsz2itNOHwtFdcyRaGM4USntRYRttKialn2G6xjlexOOHtB4kAEIoWD//oSSa4U/F59YrVwSH9CVFp+Gi5Q/9Iwi9U742YKQQsoyFHmhQbjUxLvY84ftnGSPQGLz1UzAYnT1cEjTdyKVSjSqX06Y+i6BIqDoBvZnuJQosxsjBmHQNrTUON2eji2M7qq1RLFGcp1Wjdv6qjRXEQUxuRtQ10mNrnbD7z/9uAW/7+byqIW3djO2koyXg2aEtH1t/m9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lit5FYt34/fMOegMMpetsvbD/eP0pP1zDU5kMObxm0=;
 b=x0ngjN7WR/IkgkteY0I0GqVLsnPgIoTqWUHT5XzD6XWRp0qPMSckl4P0F4iNTamOL4tncVpHGtXMmBHBT2dyHGj+0MTfzW1JQX+AiPLtrPZH3RxvCv9P7FuGQw+nNVpgvfxrnaiHUriQgDTLml/1O2jb/cPdBUU+FZBnGmGdrD4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <262a6cca-9abc-4ca2-8766-d7927f524a40@amd.com>
Date: Thu, 20 Mar 2025 10:41:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 1/2] 9pfs: add fstat file operation hook
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<minios-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250320074924.8080-1-jgross@suse.com>
 <20250320074924.8080-2-jgross@suse.com>
 <c8cb581e-7d6d-4f0b-abb5-f94f0c50fcac@amd.com>
 <ed35e0d0-898f-4e74-9a7c-24871d0d606c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ed35e0d0-898f-4e74-9a7c-24871d0d606c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|LV3PR12MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 262c71ea-3081-4048-07a0-08dd67bd5ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uk1BdVF6UFZBUEFSODMvaDNFYzlFR1BpdDVDdWdZUjhuM2I4TkZKSGE5c0Z0?=
 =?utf-8?B?QU1BRG9CdWFZM0F4T1R2YW5kQXdodlY5aHFIbFRFM1paN1A4SmFDT0dDUDUw?=
 =?utf-8?B?K2pKUXlZT2gxbFhpZzg3WDJrRWNvS0RPbExsMmZwcUZsMEdJK0l1U0xrODJw?=
 =?utf-8?B?a1dUeDZKWnJXZng3OXJRQkdDTFppWkwreWdMWmErSjdIaE9GZlhtQ0pUdi9O?=
 =?utf-8?B?TDRRaDBReHZiMDlSSWx0bWdxU2JsSnY2VGJJdDJoUURHblZJWGhCc1A2ekJ4?=
 =?utf-8?B?c0NWZGkrdjVPaXVQVm1oYnpUekN0VHpJN3piVmNFaDRjLzhxeU9yZW1DNlFS?=
 =?utf-8?B?aS8zY0pjT2VWK1N5NGxlOEVuZFVOY2VWNVJGRlRsMWthOUZGZ3BnN2RHbU1q?=
 =?utf-8?B?QXF1Qk1CanJ4V0NhWHJNelNoVktuRGpKQWZCM0ZWaDdRWDZoRHRwUUZwcVh1?=
 =?utf-8?B?WDJYeDlzRnNaQWVLNUhhR3RMZGtaeG5SamJOVm4vUVBvOW5BeC9Jd1QyRkFK?=
 =?utf-8?B?aDM0WC9tZmtzNEViZlRVZEZKdTV2Qmg3ZlpRRE11VXJmZi9SeUU0MFRnb0ww?=
 =?utf-8?B?eVVTTjRoTjlXK2xDcC93ZFdBWmJSWlVidm52VzAxdWtQbmZIMmhXeTMvU3g4?=
 =?utf-8?B?aGhLcVdwTjFjSktrMzU5aTRGbGxYaC9qSiswSXg1NlNPYzVtTjNLV2JjSGkx?=
 =?utf-8?B?dGNFcmVtbnZPNmJNQUxmNEFUQThjQmNKMkN1ZnRxWGc4ZG40aHphV0laM0cy?=
 =?utf-8?B?Qlk3OWxXK01uRldYdVl0TWRiZ0I1b1hhQzFPcTg3anEwUXhoSGw1NFptY0M4?=
 =?utf-8?B?ZzlTNlZldlZRREVUZDBzWXQyamhMSVNEQVpkYUI4ZVcvSTd2ODNiRC9ZSUo4?=
 =?utf-8?B?V285RTZFQWRaR0EvaFVqYmNjSHoyblhleUN5ZUwzQ05sbXVVMEI2UDlESjlw?=
 =?utf-8?B?eERZczdPc010TUZ5YkU2cFRlY01tOHdzTEpkN0lXcWFsUndkVlZtSXEvV1hl?=
 =?utf-8?B?SGJmZC9jcU5lc3J4cngvOUR0OXZudXg4MmYvQVByWDA0d3h5MUpzQnV2Q3FX?=
 =?utf-8?B?VmE3QUxVazY4RU1pNzlBOVFVcDl0NWNPbjJvS1lmSUxIem1kTlZ0bzhrakhk?=
 =?utf-8?B?QzJoNEVrV3NSVDFNSHdkaFA0Q2VLbVN3YS9heUZ5Q1B6SWE5WnkvVVVSeHdt?=
 =?utf-8?B?Wm1zNjhUa0pxRDV1eER3U05MOE5aRXdXK3M5UlBmeWRVUHlUQ1FHZE4rdFpH?=
 =?utf-8?B?ajZrLzhGOXViS0F2cHRJaS93L3hhZHZ6REdEL25MbzAzcGIwU1ptaGRLdGhM?=
 =?utf-8?B?UEtmc0tWeENtc2VFTFZia2h1ZklsTE9UZys1MWR1Q0NwVExsYmxYT3FKRUFV?=
 =?utf-8?B?L1RKZVJBTGtURDNpSW9wU0wyclRlVUtvejV3NThGQ29CcGpsQTBpTlk0RjFr?=
 =?utf-8?B?ZFBSQVp0L1BFbk1MVjBkNlhwU01tQ2lRd1NUazhhVkxRUjBWZFVJNlR5RWdt?=
 =?utf-8?B?cWVYTmZES0xEYXU5KzZKbHIwdlF0TU9RU3lOYVcvMk5CUDd2bVJYeWNZQ3p1?=
 =?utf-8?B?NWRsMHM0ZXA5K1hBQUJjaG0rWW9VZGpZb3kraGREMnJRNFFJc2M2WmtuaExl?=
 =?utf-8?B?NnJ0S09zbElTZVpNQWtldDh2WVp1TVVaMkU2SGZjb2ZZalVscjdPQUpIbnVM?=
 =?utf-8?B?UjBZaVNiNWFaMEdDZ0tkcldHa0xJbHhXQk9rMUI5d003aC95UmxhL0hpYnZS?=
 =?utf-8?B?cm53M3doeXVUYU1pZUJaT2N0WG1wRjNvQjdyNXhzMzhNSlhqRU9XcFFMeEJ5?=
 =?utf-8?B?Y3BpTnBvbVR6aWVWd1NSQjZSRzFFcEgya1VjRVpBR0JxblZXL3Z2bXM3ZHNG?=
 =?utf-8?B?ZEpQTEVMNUJZSlFBazdvZjhWcUh1WVMyRnVoNy9KTWJneitFNW42UWx5a2dv?=
 =?utf-8?B?c21ZVnh0Y0gyK0NmajNUZmVuQ0RBWE1vK0VHaGtlWWFxdEdxdnlpQlh5NEt5?=
 =?utf-8?Q?fef9LgSpD97C4otp7lcVUfZxpOhjng=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 14:41:52.3990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 262c71ea-3081-4048-07a0-08dd67bd5ab5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214

On 2025-03-20 10:35, Jürgen Groß wrote:
> On 20.03.25 15:28, Jason Andryuk wrote:
>> On 2025-03-20 03:49, Juergen Gross wrote:
>>> Add a file operations fstat hook to the 9pfs frontend.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>
>>> @@ -950,6 +952,32 @@ static int write_9pfs(struct file *file, const 
>>> void *buf, size_t nbytes)
>>>       return ret;
>>>   }
>>> +static int fstat_9pfs(struct file *file, struct stat *buf)
>>> +{
>>> +    struct file_9pfs *f9pfs = file->filedata;
>>> +    struct p9_stat stat;
>>> +    int ret;
>>> +
>>> +    ret = p9_stat(f9pfs->dev, f9pfs->fid, &stat);
>>> +    if ( ret )
>>> +    {
>>> +        errno = EIO;
>>> +        return -1;
>>> +    }
>>> +
>>> +    buf->st_mode = (stat.qid[0] == QID_TYPE_DIR) ? S_IFDIR : S_IFREG;
>>> +    buf->st_mode = stat.mode & 0777;
>>
>> I think you want `|= stat.mode & 0x777` here.
> 
> Indeed. Thanks for catching this one.

With that,
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

