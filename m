Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F8BB2AE4B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 18:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086198.1444403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo2pV-0004xd-O3; Mon, 18 Aug 2025 16:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086198.1444403; Mon, 18 Aug 2025 16:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo2pV-0004vY-LL; Mon, 18 Aug 2025 16:35:29 +0000
Received: by outflank-mailman (input) for mailman id 1086198;
 Mon, 18 Aug 2025 16:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2jcs=26=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uo2pU-0004vS-0z
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 16:35:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5531994b-7c51-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 18:35:22 +0200 (CEST)
Received: from DM6PR02CA0156.namprd02.prod.outlook.com (2603:10b6:5:332::23)
 by DS0PR12MB8018.namprd12.prod.outlook.com (2603:10b6:8:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 16:35:17 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::7f) by DM6PR02CA0156.outlook.office365.com
 (2603:10b6:5:332::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Mon,
 18 Aug 2025 16:35:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 16:35:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 11:35:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 18 Aug
 2025 09:35:16 -0700
Received: from [172.28.207.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Aug 2025 11:35:15 -0500
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
X-Inumbo-ID: 5531994b-7c51-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w672Rkwg/MCUQBHNWjxRZ9l6H5uqOSQFJgHYCqUC1iomIdkm+Tr/8S+Wy/1fbYf5Xra2Bf0v2nsjvuPi5UJsNebsipTU7Rk1I9/akMjdaKwhb6UStqlQkfd8M8wbv1kKtd2WQl4LwPcVwawJSns8fzs/I5prZBn39cD+U3e0GvMOTZzn5hbTOu5yaK6itFy47jwr69VkFvyIO3LMpa4uAvf05gV6mbVbW+AvmxoB77m9iGYkTQBShmyz9tKhRhOUjZA3QwPQxFa9yV55BTp5/nyxKSIaPeuAfCZtZCb13IugxOkmrv2RFxpMBTTPnZotZ8+QAU5ivvzwXCDL3gZNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWpSyxHNYwQx62CGBbVD6f3nPwEYF6Sx7plO0XOibH0=;
 b=sBclYwuGbcw7WXCGPXxDGc1sglWJAj1ySFBT5pM0LZG+/qe7xl4etzxxcb09y6AiUzfoXR+XzFpvi9MhTXPS8Dk9JHti4EKklWuMNubTKJ9op7lRbzGiN7g/pI8d1l7EPek1nbPrOZ8WfV4F4hdmNLVhwnG9LWIknuLIQDsQ2QroecK6UwTO99e/g5I4gr5s74WzjFLZe5RMekz8o+yD3PSX2fQ3cAPlc/SS+resGCzCV77xC0u4t8wf037XlDyb0V/O4ZvlAlSfqyQUm604hhJOpVOUt/gkmfJxsXw46JP+Vvjc/IcaG1S0qe3KoYrioX3Cc3ccYscRN2XvnAXBpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWpSyxHNYwQx62CGBbVD6f3nPwEYF6Sx7plO0XOibH0=;
 b=tgY12RKrkBjtt4rooZyC+i2MYfmcyvXgg1Y5LrsTOq/8Rc/z6Xa6PlUKsT5NHZ9iqcgMxbiIhpsI7EQaTfkjsuO1zmDnPXCNNseR1xABcA5OMLs5SdVYXJ8Noj+67jf55iyz8P/YEbLUT28glGLtm8C9TmliIaOTCTebyw/+vHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8e1efc16-2d82-4d7b-8fad-6af223d1fb6f@amd.com>
Date: Mon, 18 Aug 2025 12:35:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xenconsole: Add connected flag
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>,
	"Alejandro.GarciaVallejo@amd.com" <Alejandro.GarciaVallejo@amd.com>
References: <20250807015606.4427-1-jason.andryuk@amd.com>
 <25745d45-d506-4277-8ccd-302cd1316707@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <25745d45-d506-4277-8ccd-302cd1316707@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|DS0PR12MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 3191ca6c-be64-465b-bcd9-08ddde753714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHl1ZEJyazZadmFnemoxdlZQdGMzNlNZZjR1RkNyY0p5OGxaMjg3RkpReTRT?=
 =?utf-8?B?aVFXWXNWeTBqZk5uanlqSzd6WG5Da3FJanRuSXlvemxjNjJRV1pRVDMrUm5l?=
 =?utf-8?B?YXNVOHcxU2w2UjlXRlJkNHVvcW1DQndGQXkwUHBqczE1Nm5JSi9NS05hajJz?=
 =?utf-8?B?UU1XV1Yvcit5SVlHWjB3M2Q2MnMvaHhxaTRja1dRLzNBNFR1ZUxLend1U0dX?=
 =?utf-8?B?ZG1IdnJOVTlSVVBiYUo2V2g1cENQZjd1N3RKK0pQSElySWhhWllVdEw0bFVq?=
 =?utf-8?B?dWgyeWlSYXBPcFd6VzVlMlFpN2RDaWpUakh4UUdBOEh2MldCQk53Y0RseEVK?=
 =?utf-8?B?NGRmeEliM0Q5dEdKdU90djk1Y1FuSncvbENPb1pHb0RBbHJ6SlhCSzVFQWl2?=
 =?utf-8?B?ZDRYaUVjUkp3cVo4K3Z5ZUFHeGZjMlp2Yk5MeE1pbjRaQVhQL0Z6VUlEMnh6?=
 =?utf-8?B?RmdFd0lhYm00ZWJ3R1JJMTMxVm5BbFpjRm5HaEMrbFkvK2l0RWhMZ1hRTzBX?=
 =?utf-8?B?clduUHB3cDMzYmU1dUU5aEVsQ3V4QlBTcTkzYSswREtGZjVEbzhTY1Rqanl1?=
 =?utf-8?B?TDF0bHN6Y2RRMnlNeUF1WWhzVEVaaUVEYWZIVEJ5TnBWaE4reHU5NzFoajB1?=
 =?utf-8?B?KzBlbFhYTVhYQkk0cjhHMFNjN0FOdkUvQ2ZaVmR2VUhRNi9TenBUZFRZOWJk?=
 =?utf-8?B?TlVub3VzVlU0cmtzcWFYNFdBdjIxcTJYMmo3U2kxWnY1bjNwSjVSK0FNL0JE?=
 =?utf-8?B?MkErL0EyUVZxNlZ3dTE4TEI2UFFQcnJndUdVMWZrZlZoTHZ0aGNydGRnSFha?=
 =?utf-8?B?NkVpV0w4TStMNUdQajFXeWd3SnpwdnMyaGNoZE9kSUFETmZtWk45cVpXeUJp?=
 =?utf-8?B?NlQxdlZUUFVvK2tNYlF6Qm52QlBIakFLNjB4NURSdEEzSXZQQ2JXRklhQzhJ?=
 =?utf-8?B?c2R2TG5YVkxScCsrU3ZObTI0bnAxNDV0dVMxaUFtMlIrUksyaytOZWJRb2tn?=
 =?utf-8?B?Q2ZNbHFEdTU5d0QrQ0hjNUFZZDVSOVZrM0FlNUVockNMUDR2QXNRT2xGTWdn?=
 =?utf-8?B?V2t1QUZ1RXlLN1RCVW42alJVaVhzL0lMalVibnlGRWlaakZ1ZFJVYWt2MmpP?=
 =?utf-8?B?elZZSUxEQWpZNHcrc2drMEdyb0Fmc2pRajVWUEtOSjJTczVIMGhzQVJ0cm4z?=
 =?utf-8?B?ZktOMGFPMzFNTnhxejFHTWpKLzJSUjhISllYWGgzZnowMTNqVG1rU3BNb05u?=
 =?utf-8?B?U2tKZ05SajQ3YXlucHNKL2xobTZSYmVOWTZLVnF4M2lwc1dOalNLM0JLYXBK?=
 =?utf-8?B?TncxbTJ4MkxzRWFuZFBPSS9SR2VzK1l2NkxoOHlKUXI5dUJIb3pkbjEvTWdL?=
 =?utf-8?B?WW9BVVNzdWRaT2V0czh6aGh0dXRtL21qcm5KNVIrelJFZnQ4Q0tvU2VXT2FN?=
 =?utf-8?B?QW1QWnpEWTFpYU9TQzV0eW9ZdjhDMmQ2dmRDK0VYeitOa1M2VTBBNmdpdita?=
 =?utf-8?B?VVR4M3ViNGJUN0YvcmxzVEN4VTJSWmN0S0hZYk5rR0gvdnRjWUh5RkxKSmVT?=
 =?utf-8?B?NGR3cWNTbmdFanN0UkJFcjdpRlZCSFZ3UHc1Vmgvd2F2VHpIMlJxNlB3QmZ4?=
 =?utf-8?B?OXkxOW5ISzZ1YTE1QmgreWROQXB3eW1iWFdMTlFxWitYdTVFTEREUGJPdE0y?=
 =?utf-8?B?aGc5MnNoUkptYlNKRUFBbDBpeFFDNkc5am5RTVBqeHBFZDNuSmVEVm9RMGpP?=
 =?utf-8?B?MTQ2ZDg0NEZUM1RlZHpia05FYkVYVVRjbHdQQU5maVhlaUlaT0d0Tlh0eEZi?=
 =?utf-8?B?VFZKMnljUFcvT1hSeWtHaWhiUVEwYkNwaEhFNlBaZGFxM1JLUnBZSmlTTXdD?=
 =?utf-8?B?dTB6WHN6TFgxUEdyZmVLWDJOMThLdUlUbHdEbzFwK0laTVYzbklzZVJVL2Ft?=
 =?utf-8?B?VnFUNGhvUUJIb21DNXl6QVF1TGJRd0FidXJVK3ZwZWU4MmxoV0hKUGtQdS82?=
 =?utf-8?B?dDhQSWhBdG1tNzRWRmNYYVJObGNBdTJuRmZVZlRQZ2hXTHF6RUlPb0ZEc052?=
 =?utf-8?Q?roEB/K?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:35:17.2301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3191ca6c-be64-465b-bcd9-08ddde753714
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8018

On 2025-08-07 03:00, Jürgen Groß wrote:
> On 07.08.25 03:56, Jason Andryuk wrote:
>> With hyperlaunch, a domU can start before its console ring is connected
>> by xenconsoled.  With nothing emptying the ring, it can quickly fill
>> during boot.  In domU_write_console(), __write_console() returns 0 when
>> the ring is full.  This loops spins until xenconsoled starts emptying
>> the ring:
>>
>>          while (len) {
>>                  ssize_t sent = __write_console(cons, data, len);
>>
>>                  if (sent < 0)
>>                          return sent;
>>
>>                  data += sent;
>>                  len -= sent;
>>
>>                  if (unlikely(len))
>>                          HYPERVISOR_sched_op(SCHEDOP_yield, NULL);
>>          }
>>
>> The goal of this patch is to add a way for the frontend to know when a
>> console is connected.  This patch adds a new flag to the end of the
>> console ring structure.  It is used for the backend to indicate that it
>> has connected and started servicing the page.
>>
>> The two values are
>> XENCONSOLE_DISCONNECTED 1
>> XENCONSOLE_CONNECTED    0
>>
>> XENCONSOLE_DISCONNECTED indicates to the guest that ring is
>> disconnected, so it will not be serviced.  The guest can avoid writing
>> into it in that case.  A domU can use console hypercalls and only
>> transition to the ring when it is connected and won't fill and block.
>>
>> Once the backend (xenconsoled) maps and starts servicing the
>> console, the flag will be set to XENCONSOLE_CONNECTED (0) to indicate
>> the backend state to the frontend.
>>
>> The connected value as 0 will be match the default of a zero-ed console
>> page.  Hyperlaunch can set the flag to XENCONSOLE_DISCONNECTED and let
>> xenconsoled set to XENCONSOLE_CONNECTED.
> 
> I think libxenguest should set XENCONSOLE_DISCONNECTED as well (see below).
> 
>>
>> Old domU hvc_xen drivers won't check the flag.
>> New domU hvc_xen running on a new xen/xenconsoled will work properly.
>> New domU hvc_xen on old xen/xenconsoled should only see a 0 for the flag
>> and behave as if connected.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Adapt the title of the patch?
> 
>> ---
>> v1:
>> Remove evtchn notify call
>> Set connected later when there is no error
>>
>> RFC v3:
>> Flip flag values so 0 is connected.
>>
>> The other option would be to add:
>> uint32_t features
>> uint32_t connected
>>
>> New domUs would check features for a magic value and/or flag to know
>> they can rely on connected transitioning.
>>
>> I think making XENCONSOLE_CONNECTED == 0 side steps the need for
>> an additional features field.  As long as assuming zero-ed memory is
>> acceptable.  However, this only matters for a hyperlaunched guest -
>> xenconsoled will normally readily connect the console and set the value.
> 
> I'd like to consider other cases as well, e.g. a console driver domain.
> So any instance creating a domain with a console ring page should set the
> flag initially to "disconnected".

Setting disconnected for domain creation is fine.  Looking at 
libxenguest, there is also domain restore.  There the console could be 
set to disconnected again before domain restore.  Again, this should 
work and xenconsoled would set it connected again.  I originally 
intended for a single one way transition disconnected -> connected.

Alternatively, restore could skip setting disconnected and just assume 
xenconsoled will promptly attach.  Restore implies a toolstack is 
running, so there isn't the indefinite time period that is involved with 
hyperlaunch/dom0less.  But I guess an actively changing flag accurately 
shows the state, so that is preferable.

>> This assumes that existing frontends are not using the flag space for
>> some other use.
>>
>> Removed idea:
>> Send an event channel notification to let the domU know that xenconsoled
>> is connected.  Xenstored does similar, but for xenstore, the xenstore
>> driver owns the event channel/irq and can rebind it.  For hvc_xen, the
>> hvc subsystem owns the irq, so it isn't readily available for rebinding.
>> This is not implemented.
>>
>> I had the idea for the kernel to use a static key and switch writing
>> from the hypercall to the PV ring once connected.  It didn't actually
>> work in my short attempt - I think changing the static key from within
>> an interupt was wrong.  I fell back to just checking the flag directly
> 
> You'd need to do the static key changing from a worker thread instead.

My static key idea has an issue.  The flag needs to be per-instance, 
primary console and any additional PV consoles, but the kernel has only 
a single function to handle all of them.  Either the primary console 
needs dedicated ops, or the the flag would need to be checked in the 
function.  If the flag will toggle back and forth, then a static key may 
not be appropriate.

Regards,
Jason

