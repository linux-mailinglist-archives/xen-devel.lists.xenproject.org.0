Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D5D874EF7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689864.1075256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCpP-0000aK-1E; Thu, 07 Mar 2024 12:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689864.1075256; Thu, 07 Mar 2024 12:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCpO-0000YI-Uj; Thu, 07 Mar 2024 12:26:26 +0000
Received: by outflank-mailman (input) for mailman id 689864;
 Thu, 07 Mar 2024 12:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xW6h=KN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riCpN-0000XW-9a
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:26:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e88::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e91493ba-dc7d-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 13:26:24 +0100 (CET)
Received: from BN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:e4::12)
 by MW6PR12MB8757.namprd12.prod.outlook.com (2603:10b6:303:239::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 12:26:20 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::66) by BN0PR02CA0007.outlook.office365.com
 (2603:10b6:408:e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26 via Frontend
 Transport; Thu, 7 Mar 2024 12:26:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 12:26:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:26:20 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 06:26:18 -0600
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
X-Inumbo-ID: e91493ba-dc7d-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELuAjBX5Iktx29iAdpILthbGM61whPuIDgZa1SLeTLafL3L4CAkD48bbNFLZ9qJLaQyqc7vz74FpxOsA9wwDJoulMynWvcGKmCOFGZ0Kije2X/FX+kxMY/YJnlrweXq/nITsBBX853w95usgZU2dnY/VnM1foPK3YzphKHxCWDn/aT6xBnn0IUne9Ku8cjswtIvBYGoyIvbqB5t9M3mvmzWtMevZhIzf5TxrJUGLII+HPp5KWrQqGhZoo/7A3mtk69G4yTbBeoWKV3zDvbKkAplSmNwKhXPVIr6lr599LDQ+mh2aXvuPBbh6//sK+oLR9YTHuAnM6KjL/g8e378Csg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wOySSNZ3bdO+GZF+3nlrL9FW8KPKKFgpVKKiEZRwe0=;
 b=DyirWL8cewCRNE3GXpGi4WgFNO6tFZNhB0AQwtUhmO0vaYPaGrV4LVLX/5bKoHLbaH37veuxeS6jh6muukGRsNNSqn05LIv7zMQmTlAPVC1jkyLVAfG1b1NYhQxitIQ1wlqNWSC3czJONcXesojylG11Atk9K8GsatsSssYF8/lhFxZa+mDjNGik2lwFI+cU5YtaaodSnvt3LHKjIL0mZRskOfzYSoE3rsyQqbRAH8F/y1QyCzernTZcyxefGJ1zNmM7J4YD879wLQ4IcKLdTbEEl/hIjRiRSACrGnaRV2miAcHEmWIQjMfvxtXvQHpvglHI6ovBImz2+io7anQSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wOySSNZ3bdO+GZF+3nlrL9FW8KPKKFgpVKKiEZRwe0=;
 b=RNUk46SCQ+AyATyRHcCaW7gNzl/2Rjr4AxsMaXCxHljG/a7QPtU+ptgbaNXUf8jacbHygd+93D/inbV2WeyTqkpCBim2iPKSKxG8ffSMY/ZL4DivvfMeTyxctONMTv3u092S72A8aISaviKQl9sPXvCqVo5SHHXQ+bS7VuehyDE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <65a2cd92-2a7c-43b8-8257-13115b6f7fd5@amd.com>
Date: Thu, 7 Mar 2024 20:26:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/9pfsd: Fix build error caused by strerror_r()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan
 Beulich <jbeulich@suse.com>
References: <20240307103847.3710737-1-xin.wang2@amd.com>
 <833782ae-9699-492a-9d18-2644873c97c7@suse.com>
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <833782ae-9699-492a-9d18-2644873c97c7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|MW6PR12MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5b16ae-5d12-4ef4-a6a6-08dc3ea1cb89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x1owsk/JymdHen1UyY3T9DVX2ScWl0bzA+NqJdnUCosb7Z5jeMKjUHbLqFtnCCB98/F+F768bbPWEAPyHc77IulFLQhWumUmkG6vLOJwNpg4h81c0v0VS1jwr7EPmlM1nyLwMSew/32jAH37pQXQGxeGaJ+WnsPDAttvx9SD6vDzJFnSryGQIFWJX5kGy38Y5+YWklbnO3gPt1TxDDfrCg9Y47dcZn6S3a4RaFytQsCcEte5tBPxnj+l6njnpFz9Klhor7xuHNE7aRVWqUWXdbTnLdU24xRioNVq58G4sXjREDwKf0OROijq8bUU1MhcLfu0yKHUrp+nf8H5n74PmfDgSvvcHUdr8OmfJyTLX+QWONvXROOv5JHHJv2l8shTaaFA4qYlv5WfLv1SB8h2/4gd7SkmsFu8Ewysn7cQOG2lI78knj9LbtVIEzXy8UEFkHbjExeYD7roLbXBRJFr2Sgylgbo/fkpRB+g1/mpV3iMgnSRjKh6m5VHB2agqouCFEi1iBL5WI6CS4IQUeyQ8HHoCgWJ27dwcNL/jiRuRhP8EwVLPGoTsi0R4nYmI8mDMub8Pm99FC/G+QAPC7iQFwecqxP8PDgACya6/N8w7ddNlFI15Au0Mu6tPdIo9GNt5kg9Vb2d0S8ZgnS61StK84aShqgGXv9UHtciCSEjH837W+prn0n41qh6Toe6D8u4HxxTvJW3n9/3QnQQHjUIMdcEAKYZ2ITZ1YObgcXVflSGTQVQ85dNQQTVRiQDdUOj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:26:20.4751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5b16ae-5d12-4ef4-a6a6-08dc3ea1cb89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8757

Hi Juergen,

On 3/7/2024 7:24 PM, Juergen Gross wrote:
> On 07.03.24 11:38, Henry Wang wrote:
>> Below error can be seen when doing Yocto build of the toolstack:
>>
>> | io.c: In function 'p9_error':
>> | io.c:684:5: error: ignoring return value of 'strerror_r' declared
>>    with attribute 'warn_unused_result' [-Werror=unused-result]
>> |   684 |     strerror_r(err, ring->buffer, ring->ring_size);
>> |       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> | cc1: all warnings being treated as errors
>>
>> Fix the build by using strerror() to replace strerror_r(). Since
>> strerror() is thread-unsafe, use a separate local mutex to protect
>> the action. The steps would then become: Acquire the mutex first,
>> invoke strerror(), copy the string from strerror() to the designated
>> buffer and then drop the mutex.
>>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   tools/9pfsd/io.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
>> index adb887c7d9..2b80c9528d 100644
>> --- a/tools/9pfsd/io.c
>> +++ b/tools/9pfsd/io.c
>> @@ -680,8 +680,18 @@ static bool name_ok(const char *str)
>>   static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
>>   {
>>       unsigned int erroff;
>> +    static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
>> +    char *strerror_str;
>> +    RING_IDX strerror_len = 0, copy_len = 0;
>> +
>> +    pthread_mutex_lock(&mutex);
>> +    strerror_str = strerror(err);
>> +    strerror_len = strlen(strerror_str) + 1;
>> +    copy_len = min(strerror_len, ring->ring_size);
>
> Hmm, I think we even _need_ to cap the string earlier.
>
> A string in the 9pfs protocol is a 2 byte length field plus the string.
> In case of a ring larger than 65535 bytes this would mean the result of
> strerror() could (in theory) overflow the string format of 9pfs.
>
> Additionally the string should be a _short_ description of the error, so
> I'd like to suggest to not use ring_size as the upper bound for the 
> string
> length, but a fixed value defined as a macro, e.g.:
>
> #define MAX_ERRSTR_LEN 80

I can use a macro-defined value in v3, sure.

Kind regards,
Henry

> Juergen


