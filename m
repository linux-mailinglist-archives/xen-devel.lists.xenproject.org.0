Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B629874ECD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689857.1075236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCj5-000664-43; Thu, 07 Mar 2024 12:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689857.1075236; Thu, 07 Mar 2024 12:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCj5-00062y-0L; Thu, 07 Mar 2024 12:19:55 +0000
Received: by outflank-mailman (input) for mailman id 689857;
 Thu, 07 Mar 2024 12:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xW6h=KN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riCj2-00061A-Uf
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:19:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe89621e-dc7c-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 13:19:51 +0100 (CET)
Received: from PR3P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::19)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 12:19:46 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10a6:102:b5:cafe::5d) by PR3P251CA0028.outlook.office365.com
 (2603:10a6:102:b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26 via Frontend
 Transport; Thu, 7 Mar 2024 12:19:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 12:19:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:19:43 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:19:42 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 06:19:41 -0600
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
X-Inumbo-ID: fe89621e-dc7c-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMY9hmf6oX/3ohGTUzigcPu/mg+by+CTQ7UM6KxUaU9tduuCqPePMxx43Ab7ByKuR9tfPgmwS6X3DCOOLIx/Im+7Ymq0vjqN3Zc6ETJMAuLbudRBl85C8IFBKYMuTCN8YsOpN1UCczcvdKAxfKzWN3gp2IfurH6jmLugj0L0OuYnKBP7NFHkmk9VG2zkVU2X65Y9FLdzZhvz1NCi9nvpjpCRdEAvax2ksZj1YWN7+dR35R+8Fc85ED9WWkCnW38oiIPeBZEF4pMILsHcch7fDHrezDY6dhQuP+AyHNE7KwLqC2Qdjj+VVTZSKL04ArED15bhHUHL/ILoaZ5u4Hw7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0gcwpiaF4ajbC6fPVDyeiKq/4opE2bwQfKz6n50CTQ=;
 b=GRnLqLsltyQcv7FFQM4f2jasKXgG4JDcGuV8+FNkuOkvH0FTOoplhAWqYuyMI0LR4jhJOidiOyFhMoff1QzX1VOGW3GnnoxTfB8IuBplT1QCvsVML/j5rG+9N2shM9PxYYRk4FS3Z2K/5dpVFJ6eGKsmDjh9lw6ooI5mYZYMXALnSYe6XN46q7QUI5GrtxG9fiRCnXDcYHA1sPwJd9FgssQt6qR4MF37UM/5tfGhk0RGEx57Noza/uwyscquOjkIB00bfwUvp3oZVfwtDfNSpsjvJVJdp10p2ClQKRQiXj23EygUeWwAB1b9fOlIgHP837kq3FvQK1xiy8Ws3/tLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0gcwpiaF4ajbC6fPVDyeiKq/4opE2bwQfKz6n50CTQ=;
 b=h6T4MHdgoHGzxGa/MYZMEWY70IEe24by8t1FbDtuAIha0pk/nYi/TYS08aozUWgEL9EodsU5Q4/a4MFYCEdOTmAV7wqFMkTLwANVxDGg7TcR9RcFbtq8g4tp+EypGBGx2O0W0N53F+bejtJbsr2mO+XnlCd/mQ9h2PeoxQcYP5E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <87b4f7fc-29a8-4201-83c5-afb9169a222d@amd.com>
Date: Thu, 7 Mar 2024 20:19:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/9pfsd: Fix build error caused by strerror_r()
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20240307103847.3710737-1-xin.wang2@amd.com>
 <8428e980-ac88-40bb-8334-d52deeb52bb0@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <8428e980-ac88-40bb-8334-d52deeb52bb0@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a97465-f791-416f-1636-08dc3ea0df4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ueSOFoVkIpCSe4vSMAxdW/hWKLPfrwsGA1lJMa5R4398LW9F+YVHmg4FUHtq2p8ZVVx82IfL+QXLUeBsJTc0BaZJQIqC/n4BUs96RVa9CzAIbDNJ7NuVwcLxdcqoJx0Qjygs/C/J79kYJ1gz9Ev0v/EA3his06euQdbFRjz2G66/OR5zQKjqCSQCirUQ+lqV7IIIg2i5UAAS7zBOYqmWwhyPybSyov+vvT/gOdK0heOp+geodilz9pX1m2gtRdDyk1MiLTvw5PxdGVlmyyJvR/JnBbAuUos9Hcwws/t7BnhajClP3RLrNT8kdKfcSITk2spd/Rk7iqHbkwAwZ77tlC71n5UMwe3I86aceaMdoayZJHhJJPEPlXCsEoZDE7bC7fo47IXbNrMBhHt7LhLOdwIYEeq10uhHlH6Z+KbWGq7+lV3nL7Wqzb/x4BoNoMFmAlFQOk3u8mqiTgFXYvkfJ870T2CbvoVJklzRumobJAlfrTHk1xhNyVc12C6VvSwW4EsbEQcZhLDZK+geOHIjl7oyIwLF6Yqr9FomwKhUyHeAx8j7lF/N9DmqKxTHyD8BOk0f8qNAQwbl61uN7RJzRlRFdpk2xZTvOcsys/kHImxQgFcnws1l2sUi4eVY9I+5MUtrBchtjAi5fraSlXTZ+cd8yo/e2yDll69u61sKzrLBrgAVo4kut/M57vo9nbK39wIwT6/diVnXLwu1Rm9i4Icg9HmJwMliKvrWsWs0mn3V+Pzvu6HUuo+VCQQQWlYf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:19:44.1112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a97465-f791-416f-1636-08dc3ea0df4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044

Hi Jan,

On 3/7/2024 7:04 PM, Jan Beulich wrote:
> On 07.03.2024 11:38, Henry Wang wrote:
>> Below error can be seen when doing Yocto build of the toolstack:
>>
>> | io.c: In function 'p9_error':
>> | io.c:684:5: error: ignoring return value of 'strerror_r' declared
>>    with attribute 'warn_unused_result' [-Werror=unused-result]
>> |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
>> |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> | cc1: all warnings being treated as errors
>>
>> Fix the build by using strerror() to replace strerror_r(). Since
>> strerror() is thread-unsafe, use a separate local mutex to protect
>> the action. The steps would then become: Acquire the mutex first,
>> invoke strerror(), copy the string from strerror() to the designated
>> buffer and then drop the mutex.
>>
>>
>> Fixes: f4900d6d69b5 ("9pfsd: allow building with old glibc")

I will add this tag in v3.
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

> albeit there are a number of cosmetic aspects I'd have done differently
> (see bottom of mail). The one thing I'd really like to ask for it a
> comment ...
>
>> --- a/tools/9pfsd/io.c
>> +++ b/tools/9pfsd/io.c
>> @@ -680,8 +680,18 @@ static bool name_ok(const char *str)
>>   static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
>>   {
>>       unsigned int erroff;
>> +    static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
>> +    char *strerror_str;
>> +    RING_IDX strerror_len = 0, copy_len = 0;
>> +
> ... here explaining why strerror_r() isn't used. Unless other comments
> arise and a v3 would be needed, I'd add
>
>      /*
>       * While strerror_r() exists, it comes in a POSIX and a GNU flavor.
>       * Let's try to avoid trying to be clever with determining which
>       * one it is that the underlying C library offers, when really we
>       * don't expect this function to be called very often.
>       */
>
> while committing.

Since I am working on a V3 which will be sent out soon, please don't 
bother :) I will
handle it from my side.

> Anyway it'll need a maintainer ack first.
>
>> +    pthread_mutex_lock(&mutex);
>> +    strerror_str = strerror(err);
>> +    strerror_len = strlen(strerror_str) + 1;
>> +    copy_len = min(strerror_len, ring->ring_size);
>> +    memcpy(ring->buffer, strerror_str, copy_len);
>> +    ((char *)(ring->buffer))[copy_len - 1] = '\0';
>> +    pthread_mutex_unlock(&mutex);
>>   
>> -    strerror_r(err, ring->buffer, ring->ring_size);
>>       erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
>>       fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
>>                   erroff != ~0 ? ring->str + erroff : "cannot allocate memory",
>      pthread_mutex_lock(&mutex);
>      str = strerror(err);
>      len = min(strlen(str), ring->ring_size - 1);

This actually will fire below errors on my build env, hence I separated 
them with a different variable.

tools/include/xen-tools/common-macros.h:38:21: error: comparison of 
distinct pointer types lacks a cast [-Werror]
|    38 |         (void) (&_x == &_y);                    \
|       |                     ^~
| io.c:695:11: note: in expansion of macro 'min'
|   695 |     len = min(strlen(str), MAX_ERRSTR_LEN - 1);;
|       |           ^~~
| cc1: all warnings being treated as errors

>      memcpy(ring->buffer, str, len);
>      ((char *)ring->buffer)[len] = '\0';
>      pthread_mutex_unlock(&mutex);

I will follow your style in V3 if you don't have any specific comment on 
the error that I posted above (plus also not strongly disagree with my 
approach in v2).

Kind regards,
Henry

> Jan


