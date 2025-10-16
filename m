Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6008BE4995
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 18:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144668.1478006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Qsx-00061M-89; Thu, 16 Oct 2025 16:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144668.1478006; Thu, 16 Oct 2025 16:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Qsx-0005z2-4i; Thu, 16 Oct 2025 16:31:27 +0000
Received: by outflank-mailman (input) for mailman id 1144668;
 Thu, 16 Oct 2025 16:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9Qsv-0005yw-Ir
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 16:31:25 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d5ba0f2-aaad-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 18:31:23 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by MW5PR03MB6959.namprd03.prod.outlook.com (2603:10b6:303:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 16:31:19 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 16:31:19 +0000
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
X-Inumbo-ID: 8d5ba0f2-aaad-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=es3pZMItNPEegeW4mSeR1oLEPrGZE67gTOF4RmQN3MXxw4/xF4pNirWt6ayROcnoPFlKQ6lQPIXx/j8ja4bhHm4nTWrnNIJbDrI7jc7LuXUiNUIXc1m+0joLuGKo8vVJ+wDEfGFewLHEdZ1op4CkOsrSXS54LOIqvN4+LQZ1OIehcOjesMZRAmhFYmzCcQ05VY1+2EkWy7yB/8LbDemuFmws/v6dBdFeInOGaEUrAFgBcgaMjzmMXE/Rz9sVtIV2dmxMKUNq6amznNsNo3FLaBbKJxR/rCU77eLFs19fgmofP4A8ALywRUYfV/IPjQnO7qIZzjM4fdZp1wE59w3dVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LobABZ87hhmtMsqlRnIARfW8fgWpTdatDylMJpeNkQ=;
 b=xUj7kVaSvzYOKAJoZEGkZg/l1SSjZEPF2+JDPLJxqq+XMRpl2WRM0ouOnrc7e7QwaWdxm3YBk5HaW0iEpoloKxu+nq9j4HTz+6wPtbMCm+l/O7KXntD39ZZuFN+d57J0eteHmXtiNpE9HlMp/PxbHGSLgIIEAtnJtbKPujVKbbU2mOkfanrqbGOmE6XYulBrs0fg6cHsI9pzQmECHqTeaRYcCxRt3yNBY1TWtBfEWXZB52PlNJKwZDvk+qfhjMCAxLY3NGi1wX5TBGKPPhxcWKFzQjOZ3fG8dES+oJYKxjLHR15K7RqtlEQ4LtvGxooAv++6lS1kSwZIFJWxbCP7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LobABZ87hhmtMsqlRnIARfW8fgWpTdatDylMJpeNkQ=;
 b=Kja++0wZib+dEOJMTwQy+NIflqpdTd4CftZVDeH0M2V/nJNkivNEVZOZTlzcpVVLXfr9zpDIuEn/9cHS2A3m4U4+lj4dZFYnzThojmDkYDGaTIHAeLRBQLIQxEwLzIjPFbmsFkRJx3ZCcFq/E1S0VSnoyuUNK6TOS560MqKEy0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 18:31:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 02/10] x86/HPET: disable unused channels
Message-ID: <aPEd00xPCAc0hsr1@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com>
X-ClientProxiedBy: MA3P292CA0013.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::6) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|MW5PR03MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: dc871ce6-2b87-4ffe-3cf5-08de0cd16f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVZRRHJ0TnhldFo2Rjllc2c0TDFXT09SSXZsMjA1bjl4dGRXSHhNdnVzSmNh?=
 =?utf-8?B?Z1lmL0hxaFVmKzc0VzBnMjJsTmV5cU1RaEM1WGhNaHM3R3hkZk5EckZhN3J2?=
 =?utf-8?B?UXpJQ2dCMUVHQWE2Qzg1Q0tmbWo3MmZmOENES0lHdzZmVDJjRnRndkxSQTlB?=
 =?utf-8?B?SGZDQUd2b2Vwam9rbDJlK2Z3RHdnaWpaeWhqcDVLcUFTWFpDemhxTlplbG9a?=
 =?utf-8?B?OVFaWlg1WlZHVm4vbFIwMUwvWTNWM1dzRG9vT2JldHhYY0w3MEs1REg0QjJh?=
 =?utf-8?B?S2hseXA1NlgwL3lLK2ZsTjAwOCtLOG9qSXF4ZHpRUmtwa214bjRJNkxPU1lX?=
 =?utf-8?B?UHNTZDROTUVCMnlSOEtNZ1hFcFFyYmY1OG0rVUIwUjE4Q0FiOGppVGxtOFl6?=
 =?utf-8?B?ZjVtMDU5WTB6ZlpxbXdpVW04WW9zNGI1Ry8xS0c3cU5TWitnUVo5S3pNUFlz?=
 =?utf-8?B?Tzh6MHhKK1dNVUVGVDR6QUlmaUp4NXBNa3JwZjJVWU5vMzdOOUwwQWl3K0RI?=
 =?utf-8?B?WitTOTNML002Zm5UQkdYdyt1UGhYTG1VQlFLczdOYkZMMU5XbThTbXBFbm52?=
 =?utf-8?B?SlUyQ3NTdTJjWE0rc3EzTlBrM09SUUpuZ3lmS3dvR0FHRDV3dzYzYjJtQmFM?=
 =?utf-8?B?U0xTNDVPVVN6SWNXQmdxL1IzcjVZQUxTMWdFNGRDTHcwWVl4dzVxd0owcXEy?=
 =?utf-8?B?ZStqbG1HbnNQZ1FiQ0ZiMENocC84ZjZNL3MrYVM5T0lWK0g5d2VXZ25nMnVT?=
 =?utf-8?B?RGpITGZkQzRmcEdWNGtMQXV3dy9paEFlMS9WL2Joc0R0Qno4dnBWT2VFN2t6?=
 =?utf-8?B?MVdmWG5RMlluVU9EMU9wQWZUWGJTaGt4QzhIa0cxVlJ2V3I0T1RsVzF1K2lG?=
 =?utf-8?B?TkJXTHh6WndyV3UzdkpZMXBkd005L1UxVFVyczJwL3Uxc1ZVZUxKOUFFWTd5?=
 =?utf-8?B?VlJjTGZpdk9Od29mR1B4cVJSc1E4QVV2a3pQMlVORXVLNllMbUg4V24vaUJR?=
 =?utf-8?B?QTdJUkxyTk9JVGJwYXYwUllJZDErL1NmellGOGZSeUtzR0hZQlVWMWRkaFdv?=
 =?utf-8?B?WUFLSGx5eWFBcVl5TEJEUjNPSFVVa09QWmlqM0dSY3RGN2x2b04vRmEvOWFF?=
 =?utf-8?B?L05XWklpdldpRmFqSjBqQTEvc0ZTenhRTm5sUVFyR1g0Y25hQW5qS3FvdHlL?=
 =?utf-8?B?YWFKbVNTYkFrNEhCVklkTDFyU2RpbkFNS2laSnUzcXVWYk4yTng4RldtRTQ1?=
 =?utf-8?B?UC9HQTBzTElvb3lXY2tIWjNXYjFrVmNwUjBhaWpYZkdKWFlmcjZBZGRESDlJ?=
 =?utf-8?B?UFd4b3YzQk1FWkRoMkJrUGlTVzdRWS90dXQyUklIdmJ6dC9wQ09MYVlaQXVp?=
 =?utf-8?B?WGtVUGVtbmt3V2V3RUM5cXd0MDd1dmh5VG1MYkZOMGhaR252QSt4OHB6YWla?=
 =?utf-8?B?UG1CMFJVTmpuT3g5OUlId2NvVjdRRk1QaldIMnlFT1dscGh3S3A5aW5xMzJQ?=
 =?utf-8?B?cGdrcGRyVlYyRi84blR6cmJUNjRQRmZEdG95MHRPNytqM3FxM1hyVEFNRjVr?=
 =?utf-8?B?cUUwQmVNZ1Ntc3dHeEt4NDBwQURwU1dKaWhlSGJVYzRaU08ybnRDaEErNmhk?=
 =?utf-8?B?cHZJVEs5N3FnYit4T1JmNVc4cnZEM3g1NklrcjZxUTZFNEtRQXh4WXk3N2hh?=
 =?utf-8?B?enA5bDNidkluNjhibFZJT2JzdWNqTEVyQitRUFhyUWlseVFkenptOVpLRFBY?=
 =?utf-8?B?WDQ4T3QwU2ppZXNDNlUyMVV0OVViUHNvWFRUNlB3MnFwcVN2MXN6SVVCQy9M?=
 =?utf-8?B?QTZOcEVEcFVFR0pZTGtFZThUa05SdXkvanRTdnhFQjhxbkFtV1hQcWhwTHdJ?=
 =?utf-8?B?d3dRTHFYOFFFTFdyb0h1OHRvWGxkSW9IdmJrMnhZN2kyTlNmUEs5OExBaDJF?=
 =?utf-8?Q?7UfYoLumHhsgUpnMj74qgoqz8M0mjdht?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlVrZGlRWDIydVA0YndTNGVjbTFpTkZHZCtUdGJlMkhmTGxzcjcwRDZXZ3g4?=
 =?utf-8?B?L1NKbitCQWFCdDcwNGMzVXF3cGxvU1Z2Zm15ZmRncGRjVWloZmlvZVdnR05J?=
 =?utf-8?B?L1dSNWRYMWFxY29MZ210UUxJU2dyMlUvSzVaQXRySzhJbHB6eTdBd3E4aVBP?=
 =?utf-8?B?V2QvQlhZR1RCU3RhcW1nTVlqTlFkZ2dLVlN4QzdmbUdpblkrVVJmR054MWN3?=
 =?utf-8?B?L24xb0xoWHZuZVFjWHpxTy9XcVJVdEZYQk1RaFZVUTRucHIxc25WOVlSc1J2?=
 =?utf-8?B?dDdsSTdHd0NpUHVpYVZBdlZrbHFyV3ROSHFJU1dlbE40MkZ2Vm5nTWdqbFVB?=
 =?utf-8?B?RFlBN05uY0QyRXVyZ1VNMDBMZ25RbFlVOEtyRnlLdWpYSXZxYnQ3SXp3TFI5?=
 =?utf-8?B?c21JOGFlTm1hYWQxZUxOZVpBYSs1aHZFL3g3STU3bEFEb05pQzVUNHI2VFgw?=
 =?utf-8?B?YUN6VUd1SGtZUnQvamxaV2FRWk9JMHBPMm9hN3A1RVBPWFBpYjgvdUVpaW42?=
 =?utf-8?B?L3A2VkVZMmZvT0hZcm5iVFpSU3hZdkpURyttRlM2Ymo3WUUwczlBdlE1V0hM?=
 =?utf-8?B?OFR5bURKcG1sc3ZPZEtwdDZ1cC9FYWJkeHpOYVBoYk1RUVFieGJUNFdFTjlY?=
 =?utf-8?B?UmN4a0JFQUpOSFpsVjZFNjlQZnZCSXJSbUdGZTVGNkFWUVlRcVE0aW0vaGVI?=
 =?utf-8?B?SkUzbDhRYnhwYWtYZDBqM3ZiTUgrblRFTkhzRDUrekFtVnpjWXU1SER5VCtV?=
 =?utf-8?B?V0IrYUNtTmtnUTVmc2grRHpiQlRtMG5KTGpDMWlNd0o4blVHVWt3Z0JuRnFN?=
 =?utf-8?B?VDgxbW16VDVQYitvaytMZUdKTlZhZ25rckJUTXVBOWozOU5BMThSckptWkhs?=
 =?utf-8?B?Q1o4enNSUGtKQ3BrR0ZOWC9ieDE5SWRhVktVeUczL1F3QkovaittbDQvbk41?=
 =?utf-8?B?cm1WRERzWWpLTlQ2VVNrbFQzamVySFNnUXMxQUZXRTJHc0p3REowelgrV2ZT?=
 =?utf-8?B?SUJIcEUzRnc2UWpMUk1taVV3RkZkaXJlVm9jNEFCdGh6eGErRXhsUnNWVEgw?=
 =?utf-8?B?blNGMUVTcFIySHpGRzB2YTJ5bkw4aGttWU9TV3licmlyT0EwT3duQW85WHpx?=
 =?utf-8?B?clZsSjJvK2Fsc25FdHhweVhQc1dYR1ZNUEc1NVJZb25KMG9Sc1lQTTRSZVND?=
 =?utf-8?B?aEpqMEJhdTBVdEU2UWtqUjI0enRyVUpCWnhaTXNwYktuUVVHNS9CWURGSUw1?=
 =?utf-8?B?T2xRZjJ0bXZleUxTZ1pheXNxelZwZVhEYTB5c3diWk5kSmNUNEJ4dG1WVG94?=
 =?utf-8?B?V1NuUGRVSmhDVHljcTBMb0lIdUpzeFBHREUyRm4zUHBDV09NWUIrTjlxQUMy?=
 =?utf-8?B?c0RYbWp0UW9VR2R1dGVzbEZmWFBvQ2tyMTE5Q3JCS0dmQzRnRnNpOG5XSWE2?=
 =?utf-8?B?bmlwRHhONWs0VmhmN0ZCSytnVGwzWmhSbzdkMnJ0cFJEZ0NsaWhBRWx0aFhh?=
 =?utf-8?B?SCtFUStNc1FZTjJnNm1HM0srdVdyU3hTa3poQ2xsOGVDbXd0R280bE91RFdO?=
 =?utf-8?B?U3hnekxXd2ErS2RvYnZVOGZTcmhPZXgxVm56SVZQTzJiMmZGZjJUTWswOFBW?=
 =?utf-8?B?b0dZTVR0K0J6TThrUk9hMHNlQWxJOTJhaVpsbjJqTmp3eFlwUDNzMHFSN0Jv?=
 =?utf-8?B?M3U3U0hOVVBMYm1qajJTNm5zTHlJNGl0T0U2eGRYb0JncFM5d0J5UFE5UjVP?=
 =?utf-8?B?YTREajk3YzhCS05qYUxjTnJ3UUswbkFQSENMZDRKNXRCU015VzNTWUVrUkxQ?=
 =?utf-8?B?UnphUDhpKzN6cTlzM1BvYUg5cElkSDNUUFZGV1k0TzRMbTVSeDhqdElSMkxN?=
 =?utf-8?B?c01XSUV6V1V5cENPaDdJb2N1Wk5TWkMvaUxoRzdNVyt5SElEU1pxazNoVTdx?=
 =?utf-8?B?eHNYYXRUMWJ0VlBoZDh3czVERm5xZG9RdkxRMm9qOHcxWDI4UUpibktPQjVL?=
 =?utf-8?B?RHh4YVA4NndxMDlhb0sxeEN2Y2JaMVJYdGcrRWF2WVM0RWxjUm5meFJYdm1J?=
 =?utf-8?B?ZEp1OWxpRFl1aDZ5VlQ3TlVtZXByeHBmZnRPcGZuSCtQS0FZOG85aVhXVnVv?=
 =?utf-8?Q?oIlvlhGml9w+9eD/Fpri1RBWb?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc871ce6-2b87-4ffe-3cf5-08de0cd16f1f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:31:18.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PZAY3C3nk24D6K8bT6mfwx55Cqai0QKop7JfFTHnGw76jBgZ79XJaypfvOrxEcerRq05oifqVsOay+uWHtUyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6959

On Thu, Oct 16, 2025 at 09:31:42AM +0200, Jan Beulich wrote:
> Keeping channels enabled when they're unused is only causing problems:
> Extra interrupts harm performance, and extra nested interrupts could even
> have caused worse problems.
> 
> Note that no explicit "enable" is necessary - that's implicitly done by
> set_channel_irq_affinity() once the channel goes into use again.
> 
> Along with disabling the counter, also "clear" the channel's "next event",
> for it to be properly written by whatever the next user is going to want
> (possibly avoiding too early an IRQ).
> 
> Further, along the same lines, don't enable channels early when starting
> up an IRQ. This similarly should happen no earlier than from
> set_channel_irq_affinity() (here: once a channel goes into use the very
> first time). This eliminates a single instance of
> 
> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
> 
> during boot. (Why exactly there's only one instance, when we use multiple
> counters and hence multiple IRQs, I can't tell. My understanding would be
> that this was due to __hpet_setup_msi_irq() being called only after
> request_irq() [and hence the .startup handler], yet that should have
> affected all channels.)
> 
> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> A window still remains for IRQs to be caused by stale comparator values:
> hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
> Should we also write the comparator to "far into the future"?

I think we can possibly live with this to avoid doing an extra MMIO
access?

Thanks, Roger.

