Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G+FHKtf12kCNAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:13:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31CB3C7944
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276804.1562112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkVl-0000fp-HO; Thu, 09 Apr 2026 08:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276804.1562112; Thu, 09 Apr 2026 08:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkVl-0000dh-Ea; Thu, 09 Apr 2026 08:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1276804;
 Thu, 09 Apr 2026 08:13:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wAkVk-0000db-8Q
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:13:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkVj-000QdP-4s
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:13:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69d75f8b-2eae-0a2a0a5409dd-0a2a450bd062-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:13:11 +0200
Received: from [40.107.209.50]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69d75f95-bca8-0a2a450b0019-286bd132f713-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:13:10 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB7122.namprd03.prod.outlook.com (2603:10b6:806:338::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 08:13:05 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Thu, 9 Apr 2026
 08:13:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHofA7o4lKouj7X1ySxBCzeFgeCXsApTCQohxmvY9Vmb9thkqfI/nsBTAKUqq5WgDGltUGS2afPSNrv8rD1piWwSNcbrMC/SJm7rf1JY7yNgwHc5gV/AZ1+8A3ICkcU78VXLAJco2eEQrK71wvMGhbBbV9zjFpmfr8MFx2f3vPIrq3VCmb6OrZJnQOA1IHD0QKQNJZN3wLw4Kr/KOHFiHYigUucvtaJwvXxuCINzdEpOtmCuAjvAK2cb5yH21gUMwHmFFe4ktk9YR53d6/bKdm3BzVHnSqPa8dyaK8YvEklTF83GuFFOn73DRdxCNmjOBHoZiv2c7krin0LAcbEjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaoX9jGnhXkmSCpuDAE3cL2moGYtgRYSFZ+piolDyUA=;
 b=Ev6iEZaD+MWA3xzkpss1RT4/SYCSV6q/mJUsPJTqaI8xEd/5JDB0dVhv6YMdBKrvySmX0Lo8bw5RlavsOVsISeRAullcr7uNWBcSjQF1qzC+PX7o2CYKeFMOzpAoenqX01XXGWC+So0L/9/ZHufBO51zhqT8hSuK/UI/BKICGV2yXn6++2oKGfDZExEb7TNbmVttQmnShKQhpy+9469HrK4JHt3tN2lkywlSpnnnTR8mLCfFHdpeiWSyQ16D1LaU0HQHwB7n60lh6T6w1V88cR3nKwlSF4ilh5lOZjW2rCxS+HSmSM4Bosvqv9gPsJwh6yYsA92bEjqij/UvALeWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaoX9jGnhXkmSCpuDAE3cL2moGYtgRYSFZ+piolDyUA=;
 b=Lny4cL3odP1Kw2d1sKYGv3SS2EZ+ZiYZaHAMrWUQRzIIOD7dxXlDoM1qEFW92P9FTc9rxd5wSFsH+luYuQrexQp+6g1KWUsOqvDn4yq2Q3Clcw39Ti90UxG9ZgROsfpi1Xn7rkYRMsKBCR7n/KwrG9oJEEU3xXquXpq/BBxKYcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 9 Apr 2026 10:13:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 0/3] Lockless SMP function call and TLB flushing
Message-ID: <addfjkfzYtmm_flx@macbook.local>
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <94b2e444-844a-4d34-9c9f-de0b9e6e23b1@suse.com>
 <17c4e7b4-297a-4bf9-9160-659723d15e48@citrix.com>
 <b0f721a9-42ba-4e71-8250-83fcfcec2313@suse.com>
 <834d60b8-fec5-42ce-a6ab-a26ea9452ed2@citrix.com>
 <8b754178-94c8-448f-9ec2-26b6a23565b8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b754178-94c8-448f-9ec2-26b6a23565b8@citrix.com>
X-ClientProxiedBy: BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fbbc370-b968-4fe4-c1c0-08de960fd350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fTxlOSeC6C/kU1/A8fpC4Nwtacf6Qbm3Kso5kBEMXIOPhjTbP6suf/sKT6Q7ddRq9NAy+0/J1OoumPIzZKPZiLU6fJW4vi//LlSHcDeKpSrfd8p9dUAFp+ttgI86KWKsAYY9Av87gJkHvEPRs0RJVTFAPlAe+ahUQ/audnC8v2QP8KOMa8JSAqWbgqj5R4KRVDjMrsGL0gmHsVUl5qju7h68NpcFjLKfBAl5DcZaZuuutTw7SbqDKvXJZroINcCmT9sl44A7FTq51FXfvTymhVABSEBhHfkIfjCRsxSQm3gSMGBNXtq20LptZZ0rz81NRy4CEFEyBT5Tby1pwLTCaNorgJmIhwI93quK+tMgSetVQ1wiGqzsS/QzGlmBIyW2zM/3tw+kf6jytfo8WOxth+Frvur2VBMvnnVv9CQITwBszWmP9ReJ53jqRADwyQLKtqB81OTu9u1gtadciDqr00xxWN3MaUFQ6oMhcGcZaxfh9jPO3pI2yF+/i5VNacAaONx1pHcPuzMegynFqI+DTYC/aaeAVTJhDK6Hs01S1yft+140TmTTjusHA5uoOphv8M2VsAaNuBsxc1IqCkUfdD3r2b6TjMtLAPanctmz0O9M1cyJUDGcAC0MriRqgeal9mFXTkF0+lvxjZlcA+1W9Jq+2uGVzb45Hd5PV9UaclHrlA0VMs2i4Cga9sZLQ8HjqNhP2awycMt8usGNnyEtHX4Aed0YteWwNLtwDQ/W8wY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlZob09EYVFMb1RoaVVpVU9zakxnaFRIV1hnaHBaWm55VDRjbVhRRUgvSGdJ?=
 =?utf-8?B?UFdjUm5BalZGSVFhL2VKTk1kZW5nOTh3cEJZVVR5QjFod01DL0w0V00yK3Bw?=
 =?utf-8?B?clV2WFFucWlGRm1uKzZaeWVUU3dhdUJ4L0pxYlE0QklmbE9yVkRSUVYwcTZr?=
 =?utf-8?B?dStVd2lRS040bFZSaFJDbFlQNU43bGtxWDBRQTR5MlBWcmFVaHNHUzBQVHIz?=
 =?utf-8?B?SzJQcWExWWNKOXI5UW5HUVF6eFFTNkdjeUxtemc4OVlScGRlOVB6aDJ3aHph?=
 =?utf-8?B?dGovaXl4Skh4VkR5c1AvemQyTnpwdjhlZnFVUDNuaXA0YUo1bGpETlROaVRu?=
 =?utf-8?B?bFUyTTRTbkp3bG9WekUvMkFORkZEeHVGNzVCVFpmbjJINUN4U3hxSDZsZWFa?=
 =?utf-8?B?ZXBONjVIZ05OUTJMK3RDL3NpN3VqdlNXR1krL09EQmdMZDErVjU3clE3NXo0?=
 =?utf-8?B?aEUrN1crTFBjYjRtajgxRko0Y29BRzlzQnJxV1VoMk02dDBKemJZVjBGNms1?=
 =?utf-8?B?eW1uR2VCU1F2OGE0aGJzLzFELy9YNzY2R3lHTDQvZzVOdGNZTUhuNis4WWxi?=
 =?utf-8?B?cnhMdTJ4bHEwS3pjdmFpNUZBNU9FOUl4b1J1T3FiNXF1d2E1bDQ5SDM3SDc1?=
 =?utf-8?B?dXZIMlZPWUhFdXpEZXpWL2k1VS8yeVY1dWw2N2U2ZUtOOTJoeVZGWDFpMDZH?=
 =?utf-8?B?aGh4OGNNT1VJS05BMU42eXpPMUx0OTJmSWNZamd5YlNEV1FRYmtsMUI5VDFx?=
 =?utf-8?B?WDMrQzErMGhPT092bHVVY3V2MGx2dHVodGp1eit0cmNWZGVpUXhpNk1YT3JG?=
 =?utf-8?B?bUZnK0ttVTJYbGNrb2drNWVmbUxhTVp2QWZCSjI3SUtQaFdMbWg3V2g4R3Nr?=
 =?utf-8?B?bk4rK2E1TVFza0JHT0FtVEUzTkJQYnRvcFYvaWFLaU5mTUlxMEF0T0t4cUxN?=
 =?utf-8?B?MXRhcys4RGh5NFVteUJTOThNVUlpeERPbkY5S0ZaRHJWYUszM04rN3VEaEky?=
 =?utf-8?B?MytWYXp6TGIxR3J3NElqVGxDZUtRWDdPNlluaDNLT2MyVWE1NDl2cG8zT0dq?=
 =?utf-8?B?SHNaK2x5aEozd2JoMGtHSDFTNEorSGNaQll4aDZIZjZJV08wazZJOGNCOWpU?=
 =?utf-8?B?Q090b2tTdGhFSFpwSjJES0Z5Q21TQ3RHODZQdWZMZnZnVmxSQ2c3M3FwdGVQ?=
 =?utf-8?B?ejl3TjJSOFdPQ2xFNnVPYWJCZHEvc1ZaY3RLZXJ3b21laTlwMTdOcTQ0Qm91?=
 =?utf-8?B?UjdCVmVsL1ZYclFLY1lmRC84NWRJRnVPTWlOYkxaTFNxYjVBZUVScDNCaTNo?=
 =?utf-8?B?WE9VRERhMXJ4L1VHcW1KdG0wUll3TUhNeHdyZGJyU1hRNUw1QWgzVVJmS3gw?=
 =?utf-8?B?ZktsZXl0bkVtL1NLbURFdDJkU3NsalBQUklETWsyMFJ3VUVjRmRuVDJMRTR1?=
 =?utf-8?B?ZkdTbXJ5ZE9wQnVVQ2RnRlpQZ0w1bjRmajFQa3hyNFFGZG1NY3ZkelNHc2tQ?=
 =?utf-8?B?aUtGR2cxd3JpRmVWL0ozT2ZuZjBZcmoxQ1RWM0NJcUZlaTFtWmdWdUp3dE85?=
 =?utf-8?B?bnlTQnVTN2MzZTNSNy9rTm1HekhsMFZlbk5vWHB4NW5KUVJZVjNoaWJmaEVW?=
 =?utf-8?B?VS9CTTFuTUV0VzYrMm5kNmhxYWh2RE5WcWN4aDdBVFZ6cCs2TkphY2VMVWVC?=
 =?utf-8?B?YmRFTzhUUVRsTDNteUdKSFBIWG1jWTcrWEl6WEM4LzBYOGRzNElib2U0SFJJ?=
 =?utf-8?B?Q25DTjgxS3I0eU9ZVUVYbTZJVmRKUDZRa2ltb241QnZ0amI4M1crc0YyVnBt?=
 =?utf-8?B?MjJnM3RoSHdvU0IyMW5VWi9UNDBHaENKWHJLcjViQmE5STFyOU1xSFk3TXlO?=
 =?utf-8?B?TnRPUXZZVEN5alI5cXF1c2FXS2owZDg1ZDVmd3NGR296bnVOQmVaVkZ4V0tD?=
 =?utf-8?B?LytIVGErb2hMM0JxcWJUaUttWmdXTUdFOTc3WS9wcjdtV1JXVGZ3S1R1dWdv?=
 =?utf-8?B?bU01cnBRMlg0d20zK2hHZTZYekJXcElXZnZqRlJaYVNQZEhla0pNTFVhQXlT?=
 =?utf-8?B?REM2N1hBK051QXlJWkZLVFdyQTBoYks2dEJ0OHdCNzYreUN5cDl6dHlhazJS?=
 =?utf-8?B?amZWcHc4SVVpUWkvVS9aT3ZmRm9RYzNLQnpTZXp4RVV5aGtWWlFwc0QzWDUz?=
 =?utf-8?B?YWFqaU9hczR3aUd5cGJhS25qWGluY2cxMW9RYmQ3emVOeEdqcUtaajdjUDRD?=
 =?utf-8?B?RnJUY0xlMWVDeDJNZ0t4N1BidzQwQndNVTlnYW9IR2llbXFDWWNsMVJhWXBQ?=
 =?utf-8?B?S2dlbDBiVENuMTlyYTF0cDcyUTJvQWpWTDliUjJaZjZ4ZkhhYnE5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbbc370-b968-4fe4-c1c0-08de960fd350
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 08:13:04.9689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zAabFKYP3cREYM/PH04qSSyxo6P8DszY1Q6VlIkuCMXwXA6vSqvyID9BpZoKIjz4Cd+0ibINZ6hzFPsN7b72g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7122
X-purgate-ID: tlsNG-42698a/1775722391-16B482A1-41AE7CFF/0/0
X-purgate-type: clean
X-purgate-size: 4753
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D31CB3C7944
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 01:57:00PM +0200, Andrew Cooper wrote:
> On 02/04/2026 12:57 pm, Ross Lagerwall wrote:
> > On 4/2/26 9:49 AM, Jan Beulich wrote:
> >> On 02.04.2026 10:40, Ross Lagerwall wrote:
> >>> On 4/2/26 7:09 AM, Jan Beulich wrote:
> >>>> On 01.04.2026 18:35, Ross Lagerwall wrote:
> >>>>> We have observed that the TLB flush lock can be a point of
> >>>>> contention for
> >>>>> certain workloads, e.g. migrating 10 VMs off a host during a host
> >>>>> evacuation.
> >>>>>
> >>>>> Performance numbers:
> >>>>>
> >>>>> I wrote a synthetic benchmark to measure the performance. The
> >>>>> benchmark has one
> >>>>> or more CPUs in Xen calling on_selected_cpus() with between 1 and
> >>>>> 64 CPUs in
> >>>>> the selected mask. The executed function simply delays for 500
> >>>>> microseconds.
> >>>>>
> >>>>> The table below shows the % change in execution time of
> >>>>> on_selected_cpus():
> >>>>>
> >>>>>                     1 thread   2 threads    4 threads
> >>>>> 1 CPU in mask     0.02       -35.23       -51.18
> >>>>> 2 CPUs in mask    0.01       -47.20       -69.27
> >>>>> 4 CPUs in mask    -0.02      -42.40       -66.55
> >>>>> 8 CPUs in mask    -0.03      -47.82       -68.39
> >>>>> 16 CPUs in mask   0.12       -41.95       -58.26
> >>>>> 32 CPUs in mask   0.02       -25.43       -39.35
> >>>>> 64 CPUs in mask   0.00       -24.70       -37.83
> >>>>>
> >>>>> With 1 thread (i.e. no contention), there is no regression in
> >>>>> execution time.
> >>>>> With multiple threads, as expected there is a significant
> >>>>> improvement in
> >>>>> execution time.
> >>>>>
> >>>>> As a more practical benchmark to simulate host evacuation, I
> >>>>> measured the
> >>>>> memory dirtying rate across 10 VMs after enabling log dirty (on an
> >>>>> AMD system,
> >>>>> so without PML). The rate increased by 16% with this patch series,
> >>>>> even
> >>>>> after the recent deferred TLB flush changes.
> >>>>
> >>>> Is this a positive thing though? In the context of some related
> >>>> work something
> >>>> similar was mentioned iirc, accompanied by stating that this is
> >>>> actually
> >>>> problematic. A guest in log-dirty mode generally wants to be making
> >>>> progress,
> >>>> but also wants to be throttled enough to limit re-dirtying, such that
> >>>> subsequent iterations (in particular the final one) of page contents
> >>>> migration won't have to process overly many pages a 2nd time.
> >>>
> >>> In the context of a real migration, both the process copying the pages
> >>> out of the guest and the guest itself will be hitting the TLB flush
> >>> lock
> >>> so reducing that bottleneck may increase throughput on both sides.
> >>> Whether or not the overall migration time increases or decreases
> >>> depends
> >>> on many factors (number of migrations in parallel, the rate the
> >>> guest is
> >>> dirtying memory, the line speed of the NIC, whether PML is used, ...)
> >>> which is why I measured a more controlled scenario to demonstrate the
> >>> change.
> >>>
> >>> IMO throttling of a guest during a migration should be something
> >>> intentional and controlled by userspace policy rather than a side
> >>> effect
> >>> of some internal global locks.
> >>
> >> I definitely agree here, but side effects going away may make it
> >> necessary to
> >> add such explicit throttling.
> >>
> >
> > Explicit throttling is much more important for the already existing
> > case of Intel systems with PML. With log dirty enabled, a VM on an Intel
> > system can dirty memory an order of magnitude faster than an AMD system
> > without PML.
> >
> > As an aside, for the same test an Intel machine without PML is still a
> > lot faster than AMD so there is probably something to improve in this
> > area for AMD machines. 
> 
> AMD have PML on the way. 
> https://docs.amd.com/v/u/en-US/69208_1.00_AMD64_PML_PUB
> 
> There is a mis-step with how support for Intel's PML is done, meaning
> that draining the vCPU's PML buffers is extraordinarily expensive even
> when there's no action to take.  (Specifically, the remote VMCS acquire)
> 
> A better option is this:  When logdirty is active, any VMExit will drain
> the PML buffer into the logdirty bitmap before processing the main exit
> reason.  This way, you drain all the PML buffers by just IPI-ing the
> domain dirty mask.

Seems like a good and easy to implement optimization.  However we are
already too fast when using PML in the sense that the toolstack cannot
keep up with the rate of dirtied memory :).

Thanks, Roger.

