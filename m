Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D65B1DF15
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 23:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073811.1436636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk8cA-0001u6-Ls; Thu, 07 Aug 2025 21:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073811.1436636; Thu, 07 Aug 2025 21:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk8cA-0001sE-I2; Thu, 07 Aug 2025 21:57:34 +0000
Received: by outflank-mailman (input) for mailman id 1073811;
 Thu, 07 Aug 2025 21:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P7F5=2T=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uk8c9-0001s8-7w
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 21:57:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2418::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 836364b9-73d9-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 23:57:30 +0200 (CEST)
Received: from BN8PR12CA0027.namprd12.prod.outlook.com (2603:10b6:408:60::40)
 by LV9PR12MB9832.namprd12.prod.outlook.com (2603:10b6:408:2f3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 21:57:25 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:60:cafe::5) by BN8PR12CA0027.outlook.office365.com
 (2603:10b6:408:60::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.14 via Frontend Transport; Thu,
 7 Aug 2025 21:57:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.0 via Frontend Transport; Thu, 7 Aug 2025 21:57:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 16:57:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 16:57:25 -0500
Received: from [172.29.241.50] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Aug 2025 16:57:24 -0500
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
X-Inumbo-ID: 836364b9-73d9-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ok5UyrXDt11YRB5y/NaPlRDuYQ5SVBScu886zkeKFuCytZBgoRn4WW9ML8wKvPc36eV/xLZc5Nx9j9bwXTfBH/wjUXTHGdgiq7LqgrDlv+9wdfUxVhPYxW+kOEeppNT+TWpgOBdToTsW4VA1aeuilfx1emg4oRhcKz3/cmhxH8ktH9+0UpzQoGPqiCLnoXiBpD83BO6EXeuibZfcXNV3tXXzJYDNwGn05jqG7YkdJpIDoIbwWu9kGmFS1St/u1alVM5S7ZcuF6n/mLqyHg7aBjdOaRtMj4Mco+rcJfCQYBWtii5zLfHNqK7JJrpUWGfLMUWpkgqlB2aA5HzJGyaykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RshG21jZ+iIkiAyrPOkEh1PHxL9Lb1bwV1Ux5hVlX/g=;
 b=iBU2njBorvPZneBoe8jLGVF0+vK9dP4dxvFb+nYzM56RVPCjRT6jyIiK8WjbwiRc8FjFFIKttVzDXqsL4WDKGjOvlo0rQ5TwN+mVSTO/unDo7Iupe/ShNK/OrX4FctJ7NNxa3pQrrCkc9ClPsaX4Sh4b+UIhLB05Ocfw2i+zGwj18xZg6yPDyAxxJwU8JfDqtASUzJswIlp5tMoLZLOrX7DVUZq4uFfHJYSpGChUycmR+MJyu57jODqLGk5dgjgWJmNYxWWtFscXr23OzrawPTNpM8NnYszUmlEoRuSc1i4ittRXVWdf71Tog1RPdtDiPy1Ihw4HI9y7I6WPkFguhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RshG21jZ+iIkiAyrPOkEh1PHxL9Lb1bwV1Ux5hVlX/g=;
 b=klIgvE8h8JszDVLjseUsV0MHrMfD4VpkiBYYfJyFFxMBg7fPF7NF2mqtogWdv6pIcgXusUeYAmcBOT9nL8kSw1Mq6FdJh8b16dFkgUuOI2N9/Z0KvCsslI1oQd9eJPGsq7pN00WKNm3LvON8OQVMQy7baWbdshVNYCV0RyFTbgs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5d8d1880-242b-46c7-a5da-7b1c2437f66d@amd.com>
Date: Thu, 7 Aug 2025 17:57:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xenconsole: Add connected flag
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250807015606.4427-1-jason.andryuk@amd.com>
 <25745d45-d506-4277-8ccd-302cd1316707@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <25745d45-d506-4277-8ccd-302cd1316707@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|LV9PR12MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: 927f826e-7bcd-4332-56a8-08ddd5fd6543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG5BaXN6eDYzNlIvN2ZXb2tFaFp5NG8ydThqbUVZK0UwMjNoemNzNXQ0cVp6?=
 =?utf-8?B?cUFGM3d1QVhyVnhHYnNnVjBudytZcFErWjdTQldxcGlsR1p5S0huTVVtamdp?=
 =?utf-8?B?TzhrV1huakdCU1dkWDN2aVNpNmJNcWdVQTlKZGNOSXpQOHhzdGdhT0l2OGtx?=
 =?utf-8?B?UGs3bmNTQjQrWEZPOVFhQ09xLzFVS3FuTE05NFp2RjZ5dWlrZG8vdHNMS0oz?=
 =?utf-8?B?b2JMYWk1R043b242SWRSZGNkWHNZQkhVMHAvVzVCUUJLQ2E1VklsSVJQNE1E?=
 =?utf-8?B?NXBGQXoySVc0YUNsQkNxOUorZ1BldFJuVGc0M3hDalN3OWRLdkY5MTdwdVVz?=
 =?utf-8?B?Q1FOWnlsbERkeTBYL3NsWktGMVl5MGh3em9mRnd2SitBSVFrcXVlNW9LZDJk?=
 =?utf-8?B?c3Q1NTl5RC96bTlZZlA3NDdVQkZCQllCWjZsRXNMVjhhVE92QlNQKzBib1g4?=
 =?utf-8?B?V2JIcDdwTGs2b1pTbTVrc3Rnc2ZPeDZjbDJyYU42ejc5V3V5aVhKQ0tmcHlG?=
 =?utf-8?B?WVQxRk96Q1FEZktRTzJZL2JvQU5Od3k0NldhVVNxS1BJYzBDQzJNT3g0bklR?=
 =?utf-8?B?MlM4OFBaUWlaNXMzbVdBcm5kREtrdjdsL1EzNUd2dE9RWWswblgwNDNwVy9O?=
 =?utf-8?B?RkIvSTN5RzY0RS9YTTM3azgrZE41MDZ1cE91NEY1WmdxMGRaelAvdjc0Y1JD?=
 =?utf-8?B?N2treThuNEczUDUveVA5Qi83cC9hQnpBVUJIQ2RTSFk0YThSUVdnaDFBYXho?=
 =?utf-8?B?WnBtMzQzL1kzZndDdHY2TVpudXozVXhGSFZsQjZreEpqb3pvNE9sazkyL3Ax?=
 =?utf-8?B?c2E1MTFBelF1bHR5TG1NOFlTOUQ5YXJmeG5yWEk5bzJjRmYrS2dMZ0RGeWxs?=
 =?utf-8?B?bnFCZEtWaFVVM2xPR2xBSGNXREhCSFdXNjZzT2E2M3F6Q1FyRmY0Ty96eE5w?=
 =?utf-8?B?N1IrRElGS1E2QmlydXU5Z0FYTVprZDE4ZC9iSkErZ2F1dlNzUXhhbWtBNnhs?=
 =?utf-8?B?UlB3WXU0TzVMWVlGc0V3SjhoRHZPVWlYRXgwaG54elpOZURRZEphYnBSS1JU?=
 =?utf-8?B?YVZtMW9pWUhQbjBsOVh5czlVa24rbTUvQTR6d0M1SHZidmk1MzZMVE54M2Vz?=
 =?utf-8?B?VE9Yc1E0a2tGRjdadVgwS3ZNKzJORFBOM2VSbXZqb2YyRXJ5dmtPWm5na1lG?=
 =?utf-8?B?SmRnRnNmT3A5aTJUWjd5SjRnNGxIbmZMbUtHT3dDcnpXcnlXeUMzM3QxczZm?=
 =?utf-8?B?VGljT3YwY3JBT21qeHZ3eWxtSmtsa1VTb2dOVmw0R1hpdnA2eXkvRmlwNkgr?=
 =?utf-8?B?cEtzOTQ5ajFJdW5HbFN5bjMwREZ0d2tPVExBVnoyM0NkV1MyMm9iR2Jsa3ZV?=
 =?utf-8?B?RldDT254RTlYSlJ2NmppRThzN1k1WndnWS9TTzY5YzdyMXhsS3l4OVF2T3o0?=
 =?utf-8?B?cUdXMHYwMDBZRjlmejRyR282Qm1iL2xkaWg5VUxRaTNFMlhDUXlNUWdKcjJx?=
 =?utf-8?B?WkNqU1pHMURZZzJpQ3NlUmlrckVwM3k3dCtUSk9QaFJuckEyOG9kTEZKMHNM?=
 =?utf-8?B?aU9CSmVkelRHM0Q3eUZHK1d3NEtHdTJPMUJoSHNZRHY2ZjFwNHBlU0VHbUgv?=
 =?utf-8?B?Z3VZYXhCWVdxWmZ3dEJxcWlUYnluVmtOcVhpNVg0d1gzakY1QVIvRUxSQmV1?=
 =?utf-8?B?SlJBK2tNVnlOa2p2QnR0MjBKY0RnbENHdGgyWG1LSWxUOFVWb0x5ZnREUU9a?=
 =?utf-8?B?aHVhMThXYkxIbFpOMEVpUExNSklUTWNLb0MrVGQyRXVtSkhDUFNsNklZQ1VF?=
 =?utf-8?B?QWJkYnB5YTA3a2R4bmNHdFk4Vzcwc1VFNjN5eG0yTDVLVnNvVTBBU2NsZ3lZ?=
 =?utf-8?B?ZDJiUXlSWjlDSjJDd04zaE9XOGUyWEdmWUJkKzVOQkhJcFErcW9LSVVqZk1G?=
 =?utf-8?B?THJMY1dHQUdjbElXN3RoZXk5MVQ4QUxiTkxnVmFUR1dzTXhWWFREeDROa1Ja?=
 =?utf-8?B?TUYwamp5eTBJSStlM2tWTnZ4SDhudEQwbjFDbmk0c1JWZ1VVcWU1UTU4ODBo?=
 =?utf-8?Q?gGMPPV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 21:57:25.8389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 927f826e-7bcd-4332-56a8-08ddd5fd6543
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832

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

With Jan's naming suggestion, it'll be "xenconsole: Add connection field"

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

Sure, that makes sense.

I don't have immediate plans for this, but I had the additional thought 
of placing the event channel inside the page like we do for xenstore. 
Today xenconsoled uses xenstore for the ring-ref and event channel, 
thought it tries the reserved console grant first.  With the reserved 
grant, and the event channel inside, that dependency would be removed. 
Xenconsoled still needs some way to know when domains come and go, and 
it depends on xenstore's @introduceDomain/@releaseDomain for that.  So 
it couldn't be completely decoupled without some other mechanism.

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

Thanks.  I'll investigate.

Regards,
Jason

