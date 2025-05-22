Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17543AC06DC
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993197.1376644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI19G-000739-Mw; Thu, 22 May 2025 08:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993197.1376644; Thu, 22 May 2025 08:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI19G-000702-Ju; Thu, 22 May 2025 08:19:30 +0000
Received: by outflank-mailman (input) for mailman id 993197;
 Thu, 22 May 2025 08:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ayyk=YG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uI19F-0006FR-2c
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:19:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f403:2406::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a4851a1-36e5-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 10:19:27 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CYYPR12MB8940.namprd12.prod.outlook.com (2603:10b6:930:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 22 May
 2025 08:19:22 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 08:19:22 +0000
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
X-Inumbo-ID: 7a4851a1-36e5-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BisBPan5gIwhPtCeTwo3AVJ6peS+Sva24HtjD7SXhaWpRzSHpVQmLHNtDd/UDgx6m7U5r1VUrCTFL7CQBfAW5/KZcOgTqQ1mp8b1SUcBVTeZCmzwTp5xTewFu0Gt6hQpOosdcWjROKbsdEwE2rJ7LGCtEe+Ijr+llFp72r0XHhSehipuAFM8jI1AIkThI6EJm3NtqVD9szZ+Ts1CjiSbAmoiR8KwNk1k3fctZ6cUmLWNRIa42PvIQq+YBDEK9az6nM/QclGhOzs1qfVoCZpUNjCDN1a5royjIUB3OYsXedTWDseevqnIZYDv2jQP/MfNzNsClVloQnTUaA0kPr06Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLOkqDNf69QhHHgjWOU//VCf3VKO5hIug8BBi2sn3rY=;
 b=xMr2AKm6fu43dh5pylSgKF3NGCaM8xaJGlJ8oLP3jbvgAOlS+LPgMaKIXo/J6hPoR66t02IH0mHn2RlcT2b4HxVqv3MkYBocCIKCqLzNRPKE/KN+Ba7yKmOnlBEVbeLMbzFDc+Bv0gU521kmBvBp1b6JUxCY3THHeC5nyaiA3/rbHk4VaFBY3XDf2j4U6kGZwhmmBCU95x0Xt2/R9PwSkNDYZ9FPuf+ZCx/N1JrsjQie/cOx/+noheBRbGFVU50N0RdtAjeBdK5gMkrPFsrAzIL0/FuPCZEdivlgK/HFsaYaIhVKwisMTq49cLUCYxILfBpYw27CkGGPDL5bEcyDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLOkqDNf69QhHHgjWOU//VCf3VKO5hIug8BBi2sn3rY=;
 b=xEpo75fxSkf9+GJHifrdJu1kCJ2NJPEl+LmM2YxIBGjUgCzhXnkNx9tF8YYpe5uJOd4M72Ux6pbmFIw0djz2jWgsRgllCiiXpdfV0TSvl4hc5mS39/n1yUgqajjje7SH3O38V3RmqHjJLUKXkBC3ceOKIl38dHjohQ8m39fVwDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <66db0b1b-c62b-4b84-9c01-12b1f93cc86d@amd.com>
Date: Thu, 22 May 2025 10:19:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm/mpu: Provide access to the MPU region from the
 C code
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-5-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250513084532.4059388-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CYYPR12MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6ff4fe-4602-421d-db55-08dd99095b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHpiQ3JzcDBLSE9VZzhaVCtzcG9XUWpjWDByQ0ZLclJkNlFyU1JrbWpWbFBF?=
 =?utf-8?B?SEw3QWpOY1VoaGEwdlBDWGtiUHhwenVtelQ0WVZOSUQvT0RYUk9PSC85bmty?=
 =?utf-8?B?THJUNWV4Y0RTY1NIRWRyWXI5WFJzUm9KN2w0RkxDTVE4Q1FlSW91U0pmcm1L?=
 =?utf-8?B?QTlBTjJFTEJKL1Y3bzEvTmQ3YWY3Z3F3K0hmemYzRUtNZFFTYSsrcHVTbklW?=
 =?utf-8?B?NUhidlF5VnlsVFFzdUJaVFdRcFpEVnl2eTkzWUtwZ0IzN0diN080WEFRbFB0?=
 =?utf-8?B?cUVOQWQ3VThIL09ISE9lWWdhRDIvbC9pQkhmRlplOUJiWjh4YmU2d1FXM3Bq?=
 =?utf-8?B?Y1NOR1dxR1Z1cGQzNVBuTWh3bHBpVWhHWEh5OWhBOUpMSEd6ZGtCNEIrT3Vz?=
 =?utf-8?B?TUhYQVArRGUwOTN2aHlzUlA4a1R3MEpwaVlUSWhUeHFTM0thWFhDUGJHai8x?=
 =?utf-8?B?VVFmc2RZTVFNempCNzZucmoxdGd6dkRCRjBhSUhSVS91d2kxd0JLMTJPMWMr?=
 =?utf-8?B?a0o3ZFk5cVFLQTZLbkhIRU96YVZEWlZTZGs2d2h6TFdRaXl3UWF3MHRvbnlO?=
 =?utf-8?B?T2ZoQUdGTEdBdk9SSEVmK1lLL1Z5ZkpXTjVyemFvUmJ5SUE0bVdCNlArVlht?=
 =?utf-8?B?OFJncUdGUEM5UVROaGpjNGhRMjN0UnNlWm5PbTc1RU9EWEphL3pVSlIwMlQ4?=
 =?utf-8?B?czJJUFlibU5TVkkrVkNCL0FwMUUwUVJrakFiUFFKNXFQSEE0WjZhN2xqSUxy?=
 =?utf-8?B?WkU3MmRLU1pRQlhON1VSRWNCYTJZR0JRYTdHUm9XRzd6N0ttMFcxVXRWSndM?=
 =?utf-8?B?TG4yb1lwb3dSOVRVNDVGTTNRdHRwR2wvd3J2Y0VBREpyNVhLTHBLMDAxZ0Y5?=
 =?utf-8?B?Y1I0b2R4TjRRejJtY1JHbUdiWnJ2YkxZOWs2bkJjRnJENDVoRms2VXA2UXhr?=
 =?utf-8?B?Q1QyeCtJMkIvRklQR21qc0Z4WGRUbE1oaDdHb2ZhaVBrZklFMkhIOUNqaWFY?=
 =?utf-8?B?YmVIcmZiS1pHT2ZwbDZ6bERpbjc4UXFHTll1V21xbEtTZXkwWWt2R01DOHl4?=
 =?utf-8?B?MXBhbUhXdTNTQ01leE8yVUhRWWk5K015RUhQZWxvbG1xN3o1ZmFxa0RINHdq?=
 =?utf-8?B?c1pZcVVJc2FjN3ZSRlE1WVlvQ29IdnRuMmwvVkxDSlZLRjd6OWtUMVAvdW1W?=
 =?utf-8?B?d09JYlJTWlhaengwRkZWekZBUkxKVmNUcmxHQUJBeENUTkxJL1NSU2FmNUNo?=
 =?utf-8?B?ZWIyczdNd3NCNjdrZ203cDZPdW90RVlpdUR1YmdaZk0ybnhWSEhoQkw0K29I?=
 =?utf-8?B?STdDcmpoZ3RTYmhjL1lIOUEwVkdjQi8wdVhPOGtCY0F6eTI5cEk1ZU1hQ2FZ?=
 =?utf-8?B?MGllRHMxcVkvbFRIOXRtdlF5eFVSc2JRM3VYbU1DY3F1bEhTYTI0OVlPNjF5?=
 =?utf-8?B?V1MvTkY2Sm4vVitEZ29ZdXNVZVdTNzQzZFBERStYTWc1cWVRT3Q2RXdIL0E2?=
 =?utf-8?B?QU4yV3ZCY2lpdWtQMUh6UFlvdHlUaXYrd0crS3l3MGRjN2N5RE5UN295anJm?=
 =?utf-8?B?VGUrL0U1VDRUeUNiNnV6a2Q5OFVRQSszdDBqVnBiT2JpL04xc1BOUlJNY0t6?=
 =?utf-8?B?d1lyenMrZ1Z5NGluVkFVVVFIZmhEUncxbWxBdXA5WkhxVVVSWS9hRnZKRVVs?=
 =?utf-8?B?eHdGL3M1TllyS3I2c0RIZ2FHazIwaFp2cktORkd1ZVI0ZWNRdGsrODA3dG5D?=
 =?utf-8?B?dHBKUC9pVSs5enovYjcxTjNHSHVxRXhXRFFMa0lIc3FweGMwd0tUTCtnY3hv?=
 =?utf-8?B?bXNGendWTEx2UFp2aTdrL2JjSXFjV0VSbEg5Z3p3bThPQk16RVhobEtBUnBo?=
 =?utf-8?B?Q21wVlU2ZmtwazlLQ3JEK29WMCtHTklSamVsQm0rQ1daR1BFbUhyYUhXb0ZH?=
 =?utf-8?Q?2ki4rKlWB7E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REtzTXJYNVJYVHNkZndBRG1XYzF2UHZiZXVhaHpMQmI0clZMR2NYcFZGWXRi?=
 =?utf-8?B?eDlqVGFDcWNtQ3Mybi9FbEZjVmQ3RHBTUVNqZHU0a09RMVUyVVc2OGk4R0hh?=
 =?utf-8?B?VXdoeHl1RVRBWHlCQVkvTDFEZ2I0QlNiUG1mUExIY0RoMy9Hc1NXVllXeGs0?=
 =?utf-8?B?Ry8weTJwc3daT2tCN0dFa0tKTVk2WGdMZjV5UjhGQ3BYQlFLM1VCcEpxU2tT?=
 =?utf-8?B?aGNGbTF1MDFUelRaSUhKM1FDcVk4aGo2OGF5UDJLOENtSlU0MjlYL3VvQW41?=
 =?utf-8?B?U2NCTjIzOHdwUllxWi9rcFBmRmlaVk8zRUpvTTFkaGRiVHlpaHpvcCtwSVhy?=
 =?utf-8?B?TG1uekR0RGp3V1hPT3Z4OWRGbTUvZlc5YWZzMEMycFlhYkxrQmxuK1dOT3Mz?=
 =?utf-8?B?b1hpRFZOOW12M0hxOHY3RzIrSFBQQ3FIQ2RRN1k1TkUwZlNlWGpsR1laVVg3?=
 =?utf-8?B?bFEwSDFiT3Jubll0eG9qb2psNm90MjRJNFhIRlpsOHJVS2lJY2FEOUpuMHNB?=
 =?utf-8?B?RHlTYzJrWWFXVmRvRTZ3WFlaUjVkblBVNnB0SFhST3J5aFR1RXN4M0g2T0F3?=
 =?utf-8?B?Sk8rYWtCblYwSCtVZC8vbzRkR3JPZWtvY1hJbFRXb1NwSTRWNEJMM1lFb0VQ?=
 =?utf-8?B?dTI5OFYwN05abnY5TytqNlZ0NWI2WnFHRGtLSjYyZ3IzY3VPQUttVVpCbk1o?=
 =?utf-8?B?djdROEpDUHB2dkhTbDlQVVhQN0I5YVB4SGQ5N08yV08zajR2TjZ2WXRvK1d3?=
 =?utf-8?B?bmZnM2RWd0NMUHV1enIwSVRQam5IT1EzelY4KzN4QlBpdFBEVzVzQkZmTzNo?=
 =?utf-8?B?MnJsUVZ0SE51M0dOaVJvMXBGU1BGbmJEcDRzbG9nK29hWU8xM2dLWUxoRUd3?=
 =?utf-8?B?SG52RCtyUjU2MlhvL1V5Wkp4eTJQMy9vR05WbklkbkhEQlh6RU53UlBLTDc2?=
 =?utf-8?B?Z1ZNLytxSWNqZW1uQ2EycllzT1hZVjZUNWZudnU0SHFDUzRMR1czQzduZkI4?=
 =?utf-8?B?Si9NekZqc0RaNzk5THB4cUljUzRhTVQ4QVVoakd1YzdXMFdGdlIzMDVhNnZC?=
 =?utf-8?B?Z2RYS3hRTEl2NzJjN1dCak0wR2ZvcnZSajNDZmxYd05DVmk3TzBja3hmOW5O?=
 =?utf-8?B?QXRaaGc0NFdQb3FheHFjcXZROEdkcElQZUxYb2ZOcGk0Q3FWTDBqcEhSd3FC?=
 =?utf-8?B?Ly9aVXljenlGSnNvQ1RqUHNUK1NSeEFYMnNlaXRLR0dmbUZqaWZZYmk1UlZI?=
 =?utf-8?B?bEI4Nk91RnJVY1U4Y05zRDlEQ3I3T3Z4M215KzBZSzA0T2c4cHZMTDRaZWVj?=
 =?utf-8?B?UkpnRE9KSm9nUlZPVW5WZmNpUURKZXJmLzN0cDJKTHFrYWJackRJbGozNWlh?=
 =?utf-8?B?cW42ZlpsTWdCRXRMbTdHQ1kxT0JlKzVUWHZKVzlJQWUrWU5jdEdlMWhybmt4?=
 =?utf-8?B?c1N6RzNBdWNGTlRCdlQ4d2xjSzJqVTVBSkNWRnk4eGtHZGRmVXNPSjJEOGlx?=
 =?utf-8?B?dEgxN2hOdXp2V0IwRy84dWhKdUIzTStuc3pIZmh2WnZmbHBtNFRvaEd5QW5F?=
 =?utf-8?B?MnltM25JZkZGVzBGcDcrOEFQcEV4dWVSMXo3U3JBYklsWTNOT3N4SEZRVnc4?=
 =?utf-8?B?MFdkNXA5ZExXbWtrQ3hIcy9FWXZ6bjV2NlVLYklMclErNUVRMU1OdmFxbzhu?=
 =?utf-8?B?N21iQzNHNnFGWDQxaGtXWVJSdldHUnJCYU4wOWg4SVRaVFVieDI3K3ZhSGt6?=
 =?utf-8?B?Tkh3S1RYNmw4TllFR1NlMkVLTDJrelcycHFZNWd1NkxaUjR2VGd2b2NHa3hy?=
 =?utf-8?B?c1duTDJSNDhqOExyNG04c0ZnWldwb2V5U3R5Y0NCakRrSEtiUmhWd3VJK3hX?=
 =?utf-8?B?LzJ0OU9yUWo3VUc0ZnRKYUMwcXBmYkJmL0RINk96WHR6bTBPb3VsZ0lrQVVJ?=
 =?utf-8?B?S2NCWHZ5aVZBOHpOTXNKL2NPSDZ4ZFdrckJ4K2VoeUZtWitvYzc1aTRBUHc1?=
 =?utf-8?B?MldqMCtmb0JQbDN5V2dPUUIyWnYxL21ZcnppNFQxUFNsc3VUb3RoNmxPR0lo?=
 =?utf-8?B?R2dQYXIzR0RtYTMrb0t2Yk4rZHlLR3hQRkQxU3hqNy80c1lxZTJ0L2FveDQ0?=
 =?utf-8?Q?S64vq41Z5OMdTdhAhQU75EgvT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6ff4fe-4602-421d-db55-08dd99095b21
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:19:22.1136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0KM4ON+aumnWuwVi1Bb//tr143PnIaPm8bSt1frEjA9bE0dW//vNYVAQZ6BH1mI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8940



On 13/05/2025 10:45, Luca Fancellu wrote:
> Implement some utility function in order to access the MPU regions
NIT: s/function/functions

> from the C world.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v5 changes:
>  - move MPU_REGION_RES0 to arm64, fixed typos and code style.
> v4 changes:
>  - moved back PRBAR0_EL2/PRLAR0_EL2 to mm.c and protect
>    them with CONFIG_ARM_64, changed comments, fixed typos and code
>    style
>  - Add PRBAR_EL2_(n) definition, to be overriden by Arm32
>  - protect prepare_selector, read_protection_region,
>    write_protection_region by Arm64 to ensure compilation on both
>    arm32 and arm64, Arm32 will modify that later while introducing
>    the arm32 bits.
> v3 changes:
>  - Moved PRBAR0_EL2/PRLAR0_EL2 to arm64 specific
>  - Modified prepare_selector() to be easily made a NOP
>    for Arm32, which can address up to 32 region without
>    changing selector and it is also its maximum amount
>    of MPU regions.
> ---
> ---
>  xen/arch/arm/include/asm/arm64/mpu.h |   2 +
>  xen/arch/arm/include/asm/mpu/mm.h    |  34 ++++++++
>  xen/arch/arm/mpu/mm.c                | 119 +++++++++++++++++++++++++++
>  3 files changed, 155 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index d3c055a2e53b..0fed6c8e5828 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -5,6 +5,8 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#define MPU_REGION_RES0        (0xFFFFULL << 48)
> +
>  /* Protection Region Base Address Register */
>  typedef union {
>      struct __packed {
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 409b4dd53dc6..2ee908801665 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -41,6 +41,40 @@ static inline struct page_info *virt_to_page(const void *v)
>      return mfn_to_page(mfn);
>  }
>  
> +/* Utility function to be used whenever MPU regions are modified */
> +static inline void context_sync_mpu(void)
> +{
> +    /*
> +     * ARM DDI 0600B.a, C1.7.1
> +     * Writes to MPU registers are only guaranteed to be visible following a
> +     * Context synchronization event and DSB operation.
Isn't it misleading to people reading this code that does not match when it
comes to order of operations?

> +     */
> +    dsb(sy);
> +    isb();
> +}
> +
> +/*
> + * The following API requires context_sync_mpu() after being used to modify MPU
> + * regions:
> + *  - write_protection_region
> + */
> +
> +/*
> + * Reads the MPU region with index @sel from the HW.
> + *
> + * @pr_read: mpu protection region returned by read operation.
> + * @sel: which mpu protection region to read
NIT: I mentioned that in the past that I find it a bit too much duplicated
information in the comment. It could very well be:
/* Reads the MPU region (into @pr_read) with index @sel from the HW */

> + */
> +void read_protection_region(pr_t *pr_read, uint8_t sel);
> +
> +/*
> + * Writes the MPU region with index @sel to the HW.
> + *
> + * @pr_write: mpu protection region passed through write operation.
> + * @sel: which mpu protection region to write
> + */
> +void write_protection_region(const pr_t *pr_write, uint8_t sel);
> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index ee035a54b942..46883cbd4af9 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -8,6 +8,8 @@
>  #include <xen/sizes.h>
>  #include <xen/types.h>
>  #include <asm/mpu.h>
> +#include <asm/mpu/mm.h>
> +#include <asm/sysregs.h>
>  
>  struct page_info *frame_table;
>  
> @@ -26,6 +28,35 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
>  /* EL2 Xen MPU memory region mapping table. */
>  pr_t __section(".data.page_aligned") xen_mpumap[MAX_MPU_REGION_NR];
>  
> +#ifdef CONFIG_ARM_64
> +/*
> + * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
> + * and GENERATE_READ_PR_REG_CASE with num==0
> + */
> +#define PRBAR0_EL2 PRBAR_EL2
> +#define PRLAR0_EL2 PRLAR_EL2
> +
> +#define PRBAR_EL2_(n)   PRBAR##n##_EL2
> +#define PRLAR_EL2_(n)   PRLAR##n##_EL2
> +
> +#endif
> +
> +#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
> +    case num:                                                               \
> +    {                                                                       \
> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
> +        break;                                                              \
> +    }
> +
> +#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
> +    case num:                                                   \
> +    {                                                           \
> +        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
> +        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
> +        break;                                                  \
> +    }
> +
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*
> @@ -36,6 +67,94 @@ static void __init __maybe_unused build_assertions(void)
>      BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>  }
>  
> +#ifdef CONFIG_ARM_64
> +/*
> + * Armv8-R supports direct access and indirect access to the MPU regions through
> + * registers:
> + *  - indirect access involves changing the MPU region selector, issuing an isb
> + *    barrier and accessing the selected region through specific registers
> + *  - direct access involves accessing specific registers that point to
> + *    specific MPU regions, without changing the selector, avoiding the use of
> + *    a barrier.
> + * For Arm64 the PR{B,L}AR_ELx (for n=0) and PR{B,L}AR<n>_ELx (for n=1..15) are
> + * used for the direct access to the regions selected by
> + * PRSELR_EL2.REGION<7:4>:n, so 16 regions can be directly accessed when the
> + * selector is a multiple of 16, giving access to all the supported memory
> + * regions.
> + */
> +static void prepare_selector(uint8_t *sel)
> +{
> +    uint8_t cur_sel = *sel;
> +
> +    /*
> +     * {read,write}_protection_region works using the direct access to the 0..15
> +     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
> +     * only when needed, so when the upper 4 bits of the selector will change.
> +     */
> +    cur_sel &= 0xF0U;
Here you use &=
+NIT: you could do that at the definition (but maybe it's clearer this way in
your opinion)

> +    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
> +    {
> +        WRITE_SYSREG(cur_sel, PRSELR_EL2);
> +        isb();
> +    }
> +    *sel = *sel & 0xFU;
but here you don't.

> +}
> +
> +void read_protection_region(pr_t *pr_read, uint8_t sel)
> +{
> +    prepare_selector(&sel);
> +
> +    switch ( sel )
> +    {
> +        GENERATE_READ_PR_REG_CASE(0, pr_read);
> +        GENERATE_READ_PR_REG_CASE(1, pr_read);
> +        GENERATE_READ_PR_REG_CASE(2, pr_read);
> +        GENERATE_READ_PR_REG_CASE(3, pr_read);
> +        GENERATE_READ_PR_REG_CASE(4, pr_read);
> +        GENERATE_READ_PR_REG_CASE(5, pr_read);
> +        GENERATE_READ_PR_REG_CASE(6, pr_read);
> +        GENERATE_READ_PR_REG_CASE(7, pr_read);
> +        GENERATE_READ_PR_REG_CASE(8, pr_read);
> +        GENERATE_READ_PR_REG_CASE(9, pr_read);
> +        GENERATE_READ_PR_REG_CASE(10, pr_read);
> +        GENERATE_READ_PR_REG_CASE(11, pr_read);
> +        GENERATE_READ_PR_REG_CASE(12, pr_read);
> +        GENERATE_READ_PR_REG_CASE(13, pr_read);
> +        GENERATE_READ_PR_REG_CASE(14, pr_read);
> +        GENERATE_READ_PR_REG_CASE(15, pr_read);
> +    default:
> +        BUG(); /* Can't happen */
I think that MISRA requires adding break even for impossible default cases.

> +    }
> +}
> +
> +void write_protection_region(const pr_t *pr_write, uint8_t sel)
> +{
> +    prepare_selector(&sel);
> +
> +    switch ( sel )
> +    {
> +        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
> +    default:
> +        BUG(); /* Can't happen */
> +    }
> +}
> +#endif
Please add /* CONFIG_ARM_64 */

> +
>  void __init setup_mm(void)
>  {
>      BUG_ON("unimplemented");

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


