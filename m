Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC+7Fayy4Gm8kwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 11:58:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F340CA8D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 11:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283185.1565462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDJTq-00082h-Ik; Thu, 16 Apr 2026 09:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283185.1565462; Thu, 16 Apr 2026 09:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDJTq-00080Z-F5; Thu, 16 Apr 2026 09:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1283185;
 Thu, 16 Apr 2026 09:57:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Christian.Koenig@amd.com>) id 1wDJTo-00080R-Mg
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 09:57:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDJTn-00DPfk-Vt
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 11:57:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Christian.Koenig@amd.com>)
 id 69e0b29b-bab6-0a2a0a5309dd-0a2a4502b608-8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 11:57:47 +0200
Received: from [52.101.85.0]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Christian.Koenig@amd.com>)
 id 69e0b299-af86-0a2a45020019-34655500d31b-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 11:57:47 +0200
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV5PR12MB9778.namprd12.prod.outlook.com (2603:10b6:408:300::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 09:57:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 09:57:43 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXXlVG1dQJLXjVrgGeZZq6HbdbICRjcBy69j7Rv1CieE0ppJVrUfy2Tr4T6sGD+LWaapRqDQc4spYq3kDRrb7OtINrXzNiLJQ/h3cPdzYoH9DCtAMU71z99WYgjTIFH56qq+st2RHazWl60PlE4vOsI5CQD7r8V5ojqElnh5P2A6tPJckELRq2jnitewB4KWvznNm6ue32J0prMijXxh4L7btAHV+oy934qN3V8ZAiBh7KfBImdQYdNhkQiqODigBRTWtnwziMLyKszstGUk59gEG1gxb1hGMupibgJq2FjEvb5y8qjP8gWiDtWm5yIZJmnijQq391tbcKucHVa57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsN0idFbzoo5Al6u3mb1og5Of2nRQw6pc/2+X8L36XM=;
 b=TUI2cjQOM/gDb7sTRpphCyoJRB0ZXhZYFrBcBg20ZAMZ7rXTmisGmrdK1yMZvz8UXpRE3vKirVSpLpWGRac3AfPYF/ho5D6IQ8DaBe5gLujf51NPJvE1OvCxAAChlKIejJRVnM4UdV2+NXjdtXuxAkkHAB2B/jp6nS/h70Ub1Hc8tJyk/90PwU0akoaVtnl+KidwzD5jS045gIeGANqLsVBYyQkXNYuzHMZKlOwVPrNfV/Fmp9v+dgQa2oggfOjTBw8z29Ne2igMw1xBJ+ICANfBooaL/iLVFsuIEm9a1TRwUueFsuar98eYinFZaWrV2YD48eVPd/R2Y83X2Ol88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsN0idFbzoo5Al6u3mb1og5Of2nRQw6pc/2+X8L36XM=;
 b=CyJJqhpzXmn2+iu5KpqNT3BVjwHOZ6ThAgEuZaUHQlhyHnR4XH223X6/vdB3/l3h1tRc8zCa2Wz99gTvY3jhGEMRupohCIdKHXNifUXF+oijjHwcURfKAekhgZjuUpOxV/O9aR6orUEa5G4NYbDfcL5Asi8/5q+o3BkUrPJR5ZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b8d04414-18b5-40f7-9ea2-88b30ff5bea0@amd.com>
Date: Thu, 16 Apr 2026 11:57:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Pinned, non-revocable mappings of VRAM: will bad things happen?
To: Demi Marie Obenour <demiobenour@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 linux-media@vger.kernel.org
Cc: Val Packett <val@invisiblethingslab.com>,
 Suwit Semal <sumit.semwal@linaro.org>
References: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV5PR12MB9778:EE_
X-MS-Office365-Filtering-Correlation-Id: c51b83ef-8ffe-43bb-880d-08de9b9e9a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ptIBcFwCh7uxp3YWoK17/bPQie2C69dn4TvYoltDKzWKEoIyDd8AqL8BW58hqMoG8gVr0MEhLZr0gie9rx9Sb2S+1cRY2ZzDijFmxMIVWq2yWrNtDcoV6RmgYN453Q2QpDmMYQJnm/O5N/QhfIV+gZ2waYUJ++lCC2/P6cVqug/7AxMh0hlt5q914MtRaww/We1VIC+qpLVaV+evn+SHAEhM9DAsv4I3fyMHtFeNh7TaFZrblkyn0IOhW8+qZ40Y1aVczI7VWZ1Ck9blxKK0ycVcBMlWSwRQRMoqFnabldpBtaHjZxEDEQLTPA3LlFk4+QTByDkzGi7Qo5kAeNH1TRo0YPfiapxFyLy9bbypb7LnvBfznSP48p+tCcBEBeptKF8XFbCSiVFe2M0wg4uzqEUzD6AdeKbqEmpjgRkPsbYbhXHM5qAVR37AXXWjGKUOP5Yn5y9NEsVIhJZVxYt//mI4Zc+8Gcm1Q4pGhldEAGuSC0MTd3YWhlNij46VCgT2zlMb2h/wT0+rlw1KEh4n9kHMVqlQ8OuYruHXDwWcqb/fukPk2PUg9csUiQbvmacbx+Sk7JSAP+w0r7vVnBhmKAiIMVWybFFZeBgWZF/55s0H+AHz4EVPG7i1uDXRYbgTt/Qj0FBgEVcfFg773uozZ+cY+5ActPYajWkiO2a2cOSDrzRRY9viA62p9HmMfeLmIfD4lGqNyJwjcPqTxePepqSsXdlwZRXJtAVLmUcVU6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0NvTi9ON0ZuZTY3aDhTYy8xNHRoVXJCTlpkckJHeFVJYWVDWDVJcG1XU1VK?=
 =?utf-8?B?Y082K1Q5bXpiT3RNVHVUSnJRbWdlYzZlVkV0dXl4VHMyRUJvRmNaelY3ZFpJ?=
 =?utf-8?B?Uk1RQldWTlJmUXhQbGtYUTI5V0lYaWtFNGM3cmEvanFnbWNySGp6Yk5QQmtU?=
 =?utf-8?B?ZXBtc0Fnam5lSVB0RWI2eVJCM3RqSHJ4WDJxRzVNTVczZDFaNGhaWUpkNmFr?=
 =?utf-8?B?Vm9wWnBCYWVTN2l5YjFWUE1iK25RSklCZ1pYb1hjMkxMSk5CcE55eE5GR1E1?=
 =?utf-8?B?QlBSSk5jVHdXMjROaUNrck9iT2xwZ0I5dUZaL1BRd25KSUc4WHp1YlByRGwr?=
 =?utf-8?B?a0pNaXYrUEExcG5XbkJUTHVUV0JzMnNCT2o0U2FHZ3lzZ3BhQWw3dEZnNGZ4?=
 =?utf-8?B?aFVYWWRESFA1a2lSd0t1NURQME40ZGdtQ0Z5a2owRGtKZ3BhZ21KUC9Wekly?=
 =?utf-8?B?UkZrSU5qSWlOUGRBdDdzZXY5aTdoaWx4WGc5ZnUwb3JvcGowa2lNcCtDenFG?=
 =?utf-8?B?MVk0YWFFQjgwWGF0VUJVVlQ5Q2oxTm5ETEpXSkhYZnR6RVdJNjJBaHpQS3Uv?=
 =?utf-8?B?Z0lmYld3V3hZU3RBMXo1bXlUZDZCWnRmV0tXY3ozb3lETmJsOHdpbUF0YXdM?=
 =?utf-8?B?NmN4STE0eFk0M0lCM2JXb1hYL2tDOHZzWVVSbjdDeDR6TmQ5OW5HZzJKa2Nl?=
 =?utf-8?B?UXV6WVpjUDJPcHU1ODRtcTZQRThIa20zZE5jaFdPZG1MK3cxOGtXd2owdjl3?=
 =?utf-8?B?NUtsN24ralFqcU5vQVJFWFZpSW5TdDc4aml6SXR6N1NVNmlqMTZuSFIxQmJi?=
 =?utf-8?B?aEJzQ0NCdXRDOW9mNm1uQjI5M0NXb1lXQmppNldVSEVYdXMxNzlVUjN0NVNM?=
 =?utf-8?B?a2dwL2ZHU1FTYU9NdkVkV0N2Rm9pL0ZUSEJsNVcyeEJTMXdQcEhQK0YzYVlQ?=
 =?utf-8?B?WWV4cVN0bkZQS3hNWnBGeEtsV3BYekd4RG1WMW1GUTJUZmJhZzRlekdjYktX?=
 =?utf-8?B?bDZSTW5KajR3TEJMOVZ1eUVTT3pXRGJRU1FwRSsvMmpMMkI3R1B6R0gzNHVQ?=
 =?utf-8?B?UzhNWUo1aUhGRllya0ZYS3BTQ3FITVQraFdMclZXMFNyUU5VQ2VOTmdVam1k?=
 =?utf-8?B?akhVRHhPcWNoS0hhdklidW44MTdwenBvL3c3ZytmVXozUVRzL1MydHArMFRq?=
 =?utf-8?B?QWxTZXdYWWttS0ZHclFSOTVwYUFITkc3Y1ZCWXA0MjFrNXcxd0RNR0RNQ2lm?=
 =?utf-8?B?ZVdnVDZqZUsxb0xlWWNldkFOVC9CcGFWY0diSUxhejFLayt0dnR2WGY3bzd2?=
 =?utf-8?B?Z0VvSUVQQVdlV3pRR2lZekx0Rm96VW5KWkhwTEUzMlU1UnN4Z3VpT2dpTmpV?=
 =?utf-8?B?emFTbUVzZVZ5b1RDMTlIUFpZeFRlcHNsMFgybG5XZGNwbElnWFp6cHpsbm5U?=
 =?utf-8?B?TktZdnV0VmVmWDhXZE52NkRJNVppdFI4aC85Z2lSQzJSNnpWTllhcGVpejNJ?=
 =?utf-8?B?cmJ2eE1EbEUrM210b291b1Fkak9uS3NtR28xbk1uWjBxRGk2OEVmNnF6Zm5W?=
 =?utf-8?B?MDRNS3Vac1BjYWFkRWQ2S1ltRVhTeHMxSmRYZFcwTG5QaW13SWpkRWZGYzBz?=
 =?utf-8?B?SjAzSEtINmIyUEhwMUVhY3hFeUhNYlJ4d3dtK3Yzd3BRRis1bFcvMFZOOVRk?=
 =?utf-8?B?SThFV3E1SWVFNnBpalVmZDlTOU9RUTBITXVtZUhsVy84d0grUysyZm5TQ3g4?=
 =?utf-8?B?clBjdm1CYXQvOTZRUnVFei9YTi9ZcWRrQmpNVGdDak1zYTc2b3VObytsTXBn?=
 =?utf-8?B?Umo2cGQ3UDVpd1BlQUN4YTdaZUJ4WVNBV2xONEhiUk8vNE1IKzVITGdMNmZB?=
 =?utf-8?B?MmQxd1dJd3FVK3hoSGthTHQrU1VSYVlHV0Z0aHh5UE9mRC9iWUsyZHFnUENa?=
 =?utf-8?B?NDVWNXFvR3dPR2pwMjFxay9ZUGFTdDlZeVBrVXBnOVl2ZXF4cVdGZ1g4Nm93?=
 =?utf-8?B?ei9udmVWYVVuNmQ1YjJJZk9JTDJ0ZUkwTllhOTBsMFJCSDVnMzkzK3cwb2ds?=
 =?utf-8?B?OGYxb2p0NE95c0V2MzZIWTBzR0hISjliaUVVYjUrWXdUcnVpamdrRzdRSFUv?=
 =?utf-8?B?V3czVHZQc3BLMnV6TER6UG1PRW5vUlNJbU0zRjNnSFVBYllKMy9teXR4N0ky?=
 =?utf-8?B?RzM0MnppU1lBVnhCNnVnaDB3ZVpVU21Ob3VGTUdieVp5Wnh6NHUxMlVsVnRo?=
 =?utf-8?B?eExWUkVvVm9sd25kcnByUFBLdE1JOTlQTVJ4eVZpYVQzOWxubXJ5R2NJdkdv?=
 =?utf-8?Q?CVEtoCP9Vo79hTusMh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51b83ef-8ffe-43bb-880d-08de9b9e9a68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 09:57:43.2392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cypUYnP/gDSas/DR7hgdKggJ5QncsdlARt5R3FHs4O8mNuvGgY/xETSqkiCuOybC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9778
X-purgate-ID: tlsNG-720697/1776333467-888CB161-4CED2B33/0/0
X-purgate-type: clean
X-purgate-size: 1951
X-Spamd-Result: default: False [-1.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:dri-devel@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-media@vger.kernel.org,m:val@invisiblethingslab.com,m:sumit.semwal@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,lists.xenproject.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B43F340CA8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 01:27, Demi Marie Obenour wrote:
> Is it safe to assume that if a dmabuf exporter cannot handle
> non-revocable, pinned importers, it will fail the import?  Or is
> using dma_buf_pin() unsafe if one does not know the exporter?

Neither.

dma_buf_pin() makes sure that the importer doesn't get any invalidation notifications because the exporter moves the backing store of the buffer around for memory management.

But what is still possible is that the exporter is hot removed, in which case the importer should basically terminate it's DMA operation as soon as possible.

GPU drivers usually reject pin requests to VRAM from DMA-buf importers when that isn't restricted by cgroups for example, because that can otherwise easily result in a deny of service.

Amdgpu only recently started to allow pinning into VRAM to support RDMA without ODP (I think it was ODP, but could be that I mixed up the RDMA three letter code for that feature).

> For context, Xen grant tables do not support revocation.  One can ask
> the guest to unmap the grants, but if the guest doesn't obey the only
> recourse is to ungracefully kill it.  They also do not support page
> faults, so the pages must be pinned.  Right now, grant tables don't
> support PCI BAR mappings, but that's fixable.

That sounds like an use case for the DMA-buf pin interface.

> How badly is this going to break with dGPU VRAM, if at all?  I know
> that AMDGPU has a fallback when the BAR isn't mappable.  What about
> other drivers?  Supporting page faults the way KVM does is going to
> be extremely hard, so pinned mappings and DMA transfers are vastly
> preferable.

Well if you only want to share a fixed amount of VRAM then that is pretty much ok.

But when the client VM can trigger pinning on demand without any limitation you can pretty easily have deny of service against the host. That is usually a rather bad idea.

Regards,
Christian.

