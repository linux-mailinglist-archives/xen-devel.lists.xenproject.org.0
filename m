Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB45874F5E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689882.1075315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD6x-0000YQ-Qn; Thu, 07 Mar 2024 12:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689882.1075315; Thu, 07 Mar 2024 12:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD6x-0000WG-O7; Thu, 07 Mar 2024 12:44:35 +0000
Received: by outflank-mailman (input) for mailman id 689882;
 Thu, 07 Mar 2024 12:44:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xW6h=KN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riD6v-0000W6-V9
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:44:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e88::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7155abc5-dc80-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 13:44:32 +0100 (CET)
Received: from DS7PR03CA0202.namprd03.prod.outlook.com (2603:10b6:5:3b6::27)
 by CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 12:44:29 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::a9) by DS7PR03CA0202.outlook.office365.com
 (2603:10b6:5:3b6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Thu, 7 Mar 2024 12:44:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 12:44:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:44:26 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 06:44:24 -0600
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
X-Inumbo-ID: 7155abc5-dc80-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Efe5HahjTkY8+5D7nmhm+VG6vfxltcEwlvw8IkYtoI0FUrXvN6Hs/9BIT/926KMGGvI+wyrtHJwtobIbs4S1z/pY4zy+4SAAW3jQVM3YowePgOvpUJ83pYTgCItQkc7hgyQAxFQu6rG4M44bYgpFNueylxe4E5pQUoif/+6tqLSXcOrNts7THfnjgGbgiPZuI0LVyU6wUSvmNfF/HgAdxc0VAM5bskfFielOOSio/sEHBW0frhF++Lqzx3ELpTt3vJikzSd7292FnOcKSNSjS90eSSDx4APEkmqfz1FeeBY3zH/qFC4YYUa+QMsP5VuCE8bxZekMtUtOS4HFrsNPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1tEW7MOkAIHsGVkrducJxUr8jRNcyh6yysEubrAtEo=;
 b=L73Y0C7f+6EOWtYZiCUEWJQsSPjlYohoqFxzdj5gbZpS8pPo8uijDotI1r+xmknXn3cG/fd1jVBnA1WW816+aokNRFZKgj69bQpTFY7XS4Z1RUJJZgIJgeP+KMUStIR2c5Uyj1yR5hLzYFdsrN+t/B/36I2VK0mWDSL/F+OItilsWT3SRoqKFbAeDVxGy3Cv9FBmjvkxWyTSjxpPlYYXJKfZ4ZUZXeopAGaobDXKP97dpfOOjfAe0W2OxIL5QCaEw786KgQ2+qXwh+JRchOT+ofmDrjliTmMZXIRoDAoqnLqu7JbUwCMdhqMFGGIRj7ufEEos/JqNBNKWFrterqlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1tEW7MOkAIHsGVkrducJxUr8jRNcyh6yysEubrAtEo=;
 b=OY9XqOA/ucq5GGNfBsCD7s6TGgeQtY91F2fhET9HNsnufFadOVhH8dyJoeU/CN0hZdzflHnlP5r8cckxClK6fMBCaW4+LXpgNr+wk2eKtL58qHZpyzB6KURP3LGyffGJhTW7dfqa7BdQXYoRTRoNuzJkJv3wTMkn3o7Qzxrf1LE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b2e5f20c-11ef-4254-8216-f3e18ff9ad34@amd.com>
Date: Thu, 7 Mar 2024 20:44:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/9pfsd: Fix build error caused by strerror_r()
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20240307103847.3710737-1-xin.wang2@amd.com>
 <8428e980-ac88-40bb-8334-d52deeb52bb0@suse.com>
 <87b4f7fc-29a8-4201-83c5-afb9169a222d@amd.com>
In-Reply-To: <87b4f7fc-29a8-4201-83c5-afb9169a222d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbedf34-4c17-4912-4b34-08dc3ea4549b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JoLA1M8DrXAm3sUAwWibnHT3PlpmNrO5+6D6tkXPqOB+VEkvNEy/8Ii5Rrc9DWAf1o+WxPoqzEfW46SnKDCt/cKNaSInNBiU46rjyoVZ7/b2GA3C5cZzQa1hEDE/cQc2sIvG0SoGQanzNRXuNAhOHjDA9q4nt3IqZ6wt2F2JD9j59T4rsmUAOjTIVpxWWLCnIosDvWokEZjzWsr65vhc9pK5L102rm8yVN79e0cuemRuPJj4Zm6/qLNo1MHhVBV0lHxl1DaWoPiEayDk5mb2sab+rZ7opG1GG0AFn4p5w0JP2oHK8z5oxaPc+Jz4twyxt6F3VXVPeqXPfTETFHW6PvQHe2AnQpDOjGwgIxlfocuze9yMwrsIxMN57XLD/XhQxc4ef9ap2muK9t9CI2TyaM5yEdly6dUv+WmQq7o38CFFruXCXwBdfWq5BcHRYM77UC9uF3CpF3+SLZjxfpJ8ACAMowAgOl6l4qrwAl7hPcOFoiNKwMA1d/MfSMUbBsifRTO5WaT40SsE67sX8sWINgDTA1OYlQnIbp4ucmYrICBRF+Q8k1q0DJL/gQcCl6J4MGdFfAvmyLecYILAgsQ6S9VMJDynQPftA3l60ThdihuV3wTZCFN4omWDwBg4rDJV0zs0PmOb3BP3NaatbcLcCXQIeJ/WqSbur71nbg+VImzUMR57lOHXeozpVftXCpVT2uhPmpL6ratT/s8L7gk2BMqJqYDx0PNqwbjiyVbwSeGVRTwJc/e4G+vVaPwrZbCY
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:44:29.3852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbedf34-4c17-4912-4b34-08dc3ea4549b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067



On 3/7/2024 8:19 PM, Henry Wang wrote:
>>      len = min(strlen(str), ring->ring_size - 1);
>
> This actually will fire below errors on my build env, hence I 
> separated them with a different variable.
>
> tools/include/xen-tools/common-macros.h:38:21: error: comparison of 
> distinct pointer types lacks a cast [-Werror]
> |    38 |         (void) (&_x == &_y); \
> |       |                     ^~
> | io.c:695:11: note: in expansion of macro 'min'
> |   695 |     len = min(strlen(str), MAX_ERRSTR_LEN - 1);;
> |       |           ^~~
> | cc1: all warnings being treated as errors
>
>>      memcpy(ring->buffer, str, len);
>>      ((char *)ring->buffer)[len] = '\0';
>>      pthread_mutex_unlock(&mutex);
>
> I will follow your style in V3 if you don't have any specific comment 
> on the error that I posted above (plus also not strongly disagree with 
> my approach in v2).

In fact I think
```
len = min(strlen(str), (size_t)(MAX_ERRSTR_LEN - 1));
```
is better.

Kind regards,
Henry

> Kind regards,
> Henry
>
>> Jan


