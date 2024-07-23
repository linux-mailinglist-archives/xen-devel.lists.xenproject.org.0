Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE693A243
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 16:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763256.1173519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWG7d-0002hB-M4; Tue, 23 Jul 2024 14:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763256.1173519; Tue, 23 Jul 2024 14:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWG7d-0002fP-J6; Tue, 23 Jul 2024 14:04:09 +0000
Received: by outflank-mailman (input) for mailman id 763256;
 Tue, 23 Jul 2024 14:04:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1nq=OX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWG7b-0002fE-VP
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 14:04:07 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20617.outbound.protection.outlook.com
 [2a01:111:f403:2407::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c5ca54e-48fc-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 16:04:06 +0200 (CEST)
Received: from BY5PR17CA0010.namprd17.prod.outlook.com (2603:10b6:a03:1b8::23)
 by DM4PR12MB8473.namprd12.prod.outlook.com (2603:10b6:8:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 14:04:03 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::5e) by BY5PR17CA0010.outlook.office365.com
 (2603:10b6:a03:1b8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Tue, 23 Jul 2024 14:04:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 14:04:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 09:04:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 09:04:00 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 09:04:00 -0500
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
X-Inumbo-ID: 6c5ca54e-48fc-11ef-bbfe-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHU7s1o4bdW389Q3hqtTDyRdZ/w+6f76QxDwozczer+eg7VDBfNm8pvKGz5errx/L5r1Ip01qyail8iyEUVvjrQPmUZkn7yWN2woQQUs3YkyNzFf2Z4ggkxFYLiomED7AZx5PuloHYXgj1lLdAYb5GFFO8GCNFwblyhJ26ahqCeIeaOedGWbidQumSodvZsy1jcwgFw549juH5CcvCdKGgkJyt7BuHFakbhfG1WjOtQk5durgADB26gIBU/94o95LvUQMQLB7jXbCJnma8k2C4j4fC8l3tbDph1tg6rEgMMtrfxJMGIrrK6rFoMdHhkj/y5PrPOug1wiIVJyS4dzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir6ivoKbjG2ShFOVatRVaHGKi7y0x55A9x5bEqif6r0=;
 b=daVN16DL6tGu+Nr2RL5zMXc04gBhwMMejYeuRIr5FkxLhrNyI4r2ZkxIZ1UgEnTe28CJocW8o8GBXXPiWV5ZRS9wmkzTGKsWN97IBWrBG++axhRL+LFATpigNEYmizB5jreP/YRVfEfA/de06dB/G/SIWulxAGaicpUO/cun/fUDCB/chGfyKWKJPnIkeYxyhb+cZUrdWqW6ClqhTAMHoDIV+nrYQzypj/ExJ8y172aQU1Tg4fnnhd5uMG4xUPByTGNPQjd5wEJv5cXjlDNGZZ3wa1+fRKmXiVVER37NJrfMWAQsK6cwa584nu6XGfo7cIoLSJISquyV/9mkUrigOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ir6ivoKbjG2ShFOVatRVaHGKi7y0x55A9x5bEqif6r0=;
 b=ew/tAHDAIdg/jwoCuqarX1j1uwUEMernq+Lhc0ICQxlyi0RLzUIcHXFd2Oa40OoRob5HFFnqypMb/qurkjrjAddqR3EHAPA/lW6u2sUKur2PbkBFPLIrPh2WwP6W+c8pPdgoIyDTh82hn3MdceK5B+D/Qc7RMREhw7y+GW0p100=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4ca9d1c0-2be3-403b-bc03-3fc4a05c702f@amd.com>
Date: Tue, 23 Jul 2024 09:40:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tools/libxs: Track whether we're using a socket or
 file
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-5-andrew.cooper3@citrix.com>
 <8cbe6c8c-1401-4661-9319-e174ffce7461@suse.com>
 <d6cc1f6f-fd37-4911-b3a4-59915727841f@citrix.com>
 <6cc32731-8346-4839-8a59-9a613505ae20@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6cc32731-8346-4839-8a59-9a613505ae20@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|DM4PR12MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: e433854f-e885-47e2-959d-08dcab204ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXZnVUFTaG00RUxjQTZ4MWV5RzFGby9XWS9BcUtIUmZVUGdMa0JkMXN4MXV2?=
 =?utf-8?B?Y1VoeHNUcGxkdmlkaHoxWkduQkNaMXpXalVUckQzS29uRzczRVF1Y2c5bFBX?=
 =?utf-8?B?emY5Q3JEYkViNUp2QVN0V24yUGpDL0VNWWd4OXArSHltVktFZ1ZlQy9WTndC?=
 =?utf-8?B?dklHaHd6Y0N3UDNaa0NqZEZQSjF0QVhDd3FRVnZEVEh3MDJVbmJ4bWxkK29V?=
 =?utf-8?B?WGFJMDBVNWg0cElqVFVBVVFjYjNsMDdnYnI1ck14TmhQbHMxVEpaNlZ0aWVh?=
 =?utf-8?B?VjEySkZFTG94V0JXcnZkam53Z0tFN2d5cnhZQkNmaytzT2x5UnhOLzdwQWRw?=
 =?utf-8?B?azJnQ1RPQVhRbWxmUjRMZFVMRGVYM0QydTNmcXpnSEhUNnIrU1hPOXZFYUU4?=
 =?utf-8?B?MUVrTHdNTk9qUnMxdGZWdlhjM1VKVG5VQmRibTVoMFAxbDBVZFpoSDY2Zi9i?=
 =?utf-8?B?b3BXRTMxc05hS2pjQUxzU05hd2F5M3d0enpndmZJRUNqYk0zdTRsNHNUT3JL?=
 =?utf-8?B?UmZIc2U1MzZHcWl3TXhidi9sTDZweUNQcmlzSHRTVGVWWkVuS0tHUTFLWEQ5?=
 =?utf-8?B?dGwrcGM0VEU0V2FYWlh0SW9kbUF6aVBPbmlrcG5zSEFYNU5kTkRNRStXRHc0?=
 =?utf-8?B?Yy8zRk1Kdzg5V281U28rUUpVbGdVRXM5TGhtTGlJVWt5cXhLVG1nKzZsV0NP?=
 =?utf-8?B?ZFJ6bVYrVHJSM3hFdzlkOEF2NklBeTF2VSsrMGFXV1gvN0FjaVJJSTlMN3hE?=
 =?utf-8?B?UmQ2RG1sZWVNajhNWXBoR1N3UnBpVlVVRzNSY1ZrVUc5ZWErNWpkMFN1cG5m?=
 =?utf-8?B?eUxCak9EcmEyTkwyMTZiWlRzaVIrOVhlbVlCaExvZ2pXTjJiQU1tT05KVGVI?=
 =?utf-8?B?TnJsa2ZjckVlVmY0RS9aNllIZmpKNkdrUmZZZm1LclgxQzdGTjNEZW1BcFRS?=
 =?utf-8?B?b20wQ2hXUEJyL1hVQXA5WkY1c2VzYTZqRXgveHFFd08ya3pBc2hCWkwwdWZx?=
 =?utf-8?B?ZHEvdlhmbXZMeGNpNHRZSlJSTy95TFlBT28wR1M4V0ZrSDhsQXFURGZlTTdK?=
 =?utf-8?B?VGNIWVFLUEV3N0ZsUDNBVjJwMS9WZmZaYXZxdG9DMmhNRTlRUk1JY1NzVzYx?=
 =?utf-8?B?MXU1akE1WS9CQzJxc2lSa1ZaSkN2bTIrVGZrQUVpRzcvNmxOQXdyNFdYN1Vz?=
 =?utf-8?B?em4xWEl0Q1o1bGVaaUEzV2NGUCt6aFZrZlRVWVF2blNpZG9WN1FMcWhtMVVx?=
 =?utf-8?B?RGY4YTFIbkNyS0I0TmhzbnFEa1Vic3g4SVF5Nkc1RVlYOVlzZWF2Z3Nkc0pm?=
 =?utf-8?B?bzA1bUcxdG1jU1NGeWVSWW9PMlBzYUtjRzBPdDdiTWpiZDFnQ3lqRDgxSkQw?=
 =?utf-8?B?WVlCRHQ3WFB0K3lKRXNwSmtqYkZWaU0ySWNxS1pqQ3ZOU1YrTEJONW1sUFU1?=
 =?utf-8?B?a01kU2Q2SUpKemxyRFpvaCtQSEd1YTVzcEdsNCtDRkl3Mm5DSFBnSWgwYWRV?=
 =?utf-8?B?S0d5V3JkOTYwMm15ZktYV2g4dE84NVhHZHBHb0MwUFVZYkgyY2J6SUNCcW9p?=
 =?utf-8?B?N3IvK0J2d2F6V0g1SmJseXE1emRublR3YkF5RjdodXNkWXgvQlU5Zm9mVjhm?=
 =?utf-8?B?TGc3djFYMm9ONFlnMW5MQjUxUVp2ZkNQWlpFdEVRVjlxVmt6SGVFKzdHS3FN?=
 =?utf-8?B?SnFwaXZISHFiOTROWjhucFRVUVdwN3RIU3ZMTFNtWWo0U0RwTENzV0VSRHZ2?=
 =?utf-8?B?ZkJrRkZ0K1Q5akQ0VnRja0FtMDRteHZpd3pkOThaVTJ3YWorcUw0VmlMUHg3?=
 =?utf-8?B?bHJ2UThEV1BXYWZRdW9qY3I5ZGNnT2V5SVRPV1ZhSGprdEFvVFhqUWF2eEQ0?=
 =?utf-8?B?M0xqbTAxaDRtclU1WlcxdG5nTUdQRWJ3emNweEdpbXcvQnBmV2lPS2ZOTkZ3?=
 =?utf-8?Q?DwVNjqIvu5CXJg+OqMOdV0TZvnk7L/5v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 14:04:02.5472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e433854f-e885-47e2-959d-08dcab204ed5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8473

On 2024-07-23 08:08, Jürgen Groß wrote:
> On 23.07.24 14:07, Andrew Cooper wrote:
>> On 23/07/2024 10:33 am, Jürgen Groß wrote:
>>> On 18.07.24 18:48, Andrew Cooper wrote:
>>>> It will determine whether to use writev() or sendmsg().
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Juergen Gross <jgross@suse.com>
>>>> ---
>>>>    tools/libs/store/xs.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>>> index 96ea2b192924..f4edeb05f03b 100644
>>>> --- a/tools/libs/store/xs.c
>>>> +++ b/tools/libs/store/xs.c
>>>> @@ -65,6 +65,9 @@ struct xs_stored_msg {
>>>>    struct xs_handle {
>>>>        /* Communications channel to xenstore daemon. */
>>>>        int fd;
>>>> +
>>>> +    bool is_socket; /* is @fd a file or socket? */
>>>> +
>>>>        Xentoolcore__Active_Handle tc_ah; /* for restrict */
>>>>          /*
>>>> @@ -305,6 +308,8 @@ static struct xs_handle *get_handle(const char
>>>> *connect_to)
>>>>        if (h->fd == -1)
>>>>            goto err;
>>>>    +    h->is_socket = S_ISSOCK(buf.st_mode);
>>>> +
>>>>        XEN_TAILQ_INIT(&h->reply_list);
>>>>        XEN_TAILQ_INIT(&h->watch_list);
>>>
>>> I'd prefer to set h->is_socket above the current
>>>
>>>      if (S_ISSOCK(buf.st_mode))
>>>
>>> and then use h->is_socket in this if instead.
>>>
>>> With that:
>>>
>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>
>> To confirm, you mean like this?
>>
>> @@ -297,7 +300,9 @@ static struct xs_handle *get_handle(const char
>> *connect_to)
>>          if (stat(connect_to, &buf) != 0)
>>                  goto err;
>> -       if (S_ISSOCK(buf.st_mode))
>> +       h->is_socket = S_ISSOCK(buf.st_mode);
>> +
>> +       if (h->is_socket)
>>                  h->fd = get_socket(connect_to);
>>          else
>>                  h->fd = get_dev(connect_to);
>>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

