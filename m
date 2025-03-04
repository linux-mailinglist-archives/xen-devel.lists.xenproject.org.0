Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF6A4DCB7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 12:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900970.1308958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQZm-0006Lu-DN; Tue, 04 Mar 2025 11:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900970.1308958; Tue, 04 Mar 2025 11:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQZm-0006KA-Ad; Tue, 04 Mar 2025 11:36:42 +0000
Received: by outflank-mailman (input) for mailman id 900970;
 Tue, 04 Mar 2025 11:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpQZl-0006K4-A7
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 11:36:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:200a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee5a5298-f8ec-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 12:36:38 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS0PR12MB6535.namprd12.prod.outlook.com (2603:10b6:8:c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 11:36:33 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 11:36:33 +0000
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
X-Inumbo-ID: ee5a5298-f8ec-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4HAm/QCZomX4ufpzSJ//dnXyHAztogZrutJj4njaIR+rqB53YCEJ6DONv+x/TM4RWlZHzQjlvZQCRY9NOSdiVjpMhnYFvbCeXuwIRcskZUZOMe23WM7bHGrOnrjTiiC2xaS09tmXd+HZXg3vrgLnfklDZov2P+8XPcbTxZeMchRFNelx+glUvklU56XqQvdZBZKVyJwgpg/fpDbj6xmCRZLxp8DZyRCVUTL3i/RXgFUnU4OM8DSuhgi/e274RyLxQVSoPfVi2sXbkEGrHEhgetkYwUgb8rwA4z2bRTPnWRJsq49zjaeRb+8QJC7kSOtpEuLYs/19dgQjIeRV9F6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXEoohGIxcxD0z6lw6grT+nxAnpaG3x6Xy+lOgYd1cw=;
 b=VDn6y5XWtHGwnQl6hH/VcByixdwEkDdMftz/Nc07H/TyTM9T3sdlMqDabTc6+g9aN/cChovlLHHw99ZSMYq1tb3d7nFyPXY6FVYN0z1Y+wWQ3txHfi5eQgaVUmwJM6SerYPJUINcOqny0APe/Yqy5aEXPbWR2tA+KC0tW/TkNMHayoK5o3020I0Td/LybiLWi4JjBW0KN90GKq0xaSJ+MpYieNShUrjtPmzuyzivJkbf5tVl4mNrLR5VAana6ztSwSzlHag/8Ej+ZEsKpRxny6NQ64GemJELUxtMbjHOikKv6dcpcQ5PjAGijbK/segjtdskx34yoj3souySGAgmlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXEoohGIxcxD0z6lw6grT+nxAnpaG3x6Xy+lOgYd1cw=;
 b=sD1s/yzPRrSFhTnQHjr2t0j9pvhTV+qDTrnQ++UFOm+KqTS68ux0j5UtoWmKL+aaxtSITLl1wIsi/HWVN5gbl9z++6xqcxXuyT6p0HsEZyJakqRynB2jKOXcPUVFSxmkbJlwBpy4vi+mW7mqA4mAzBux39lY+838zJw+SdWNbI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3c0b7b53-b556-4ffd-80a8-09b0307b7a23@amd.com>
Date: Tue, 4 Mar 2025 11:36:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] arm/mpu: Introduce utility functions for the pr_t
 type
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-6-luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250228161817.3342443-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::31) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS0PR12MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: cf289b36-de4a-4e7d-e27e-08dd5b10d062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dENZdHhEU0pvc2JEajNaZnlWelNVWVdoOVhXTTFGUTAyNi95b3dMQnRtU0Zp?=
 =?utf-8?B?TjZCY3BGUU5DcmYxcjAzRExnbG5NaDhrRzRaOVpVeG5iR0tDMlcwN3VhT3hy?=
 =?utf-8?B?Z3hMRU5HTEE4TlBXWXd1L1ZYb2J0QVNaUW9hQjU5MjF0WmhmV0hUNDFqQldQ?=
 =?utf-8?B?WXF5OWVEZzZsMVhCUHBsV20zaTg0NERaVVhlM3Z3UitsM3lBblNHbHp2RnpT?=
 =?utf-8?B?LzVMRDN1d3YySVFETTQ2dysyT2VlWmhKS3hrc2kxbGkrREsrRTlNR0F5K0JC?=
 =?utf-8?B?N3orY2dGVVRGTTJ6M0JkdkJSTm1UaFUwT1BUMkhubjZEUGJ5RllWRkNWT0d3?=
 =?utf-8?B?ZVNZcENsSTBjd1lOeGV6M1h4NFVmNWNwcWdzRDJhL0N0QmlwamZmbWhYckRF?=
 =?utf-8?B?Z3BhRjZlMnE3MzNDb05TMHpXci9sbk50NVY2R2x5K1E0dkhsOGhUaktQV3pR?=
 =?utf-8?B?UEhDSWs3QzdpMUpFZ0czNEFvRXIxVHQwWFRERFI2UGpXZmhRUXBPVDlhM0M0?=
 =?utf-8?B?ZlZ3dnBCNDdyblRIUzkwMXdUUEpQRFVRWjNFYkVPVDFtaTI5aVp0dEg2MWpY?=
 =?utf-8?B?a1RCT2FhV3laa3dJVzd1TFlncGVpK0JiWUhtU1V5Y2ZWMVNPNnZ5N3BZN1Qv?=
 =?utf-8?B?UGk3RnVLM1lJamlleEVTdytKcnFRTGltZVIwOEJDTndOMXRWSVFlVmJndGtM?=
 =?utf-8?B?MHNnalEwdXVGTlEyVy92MmU2aVpRNFVsTDVvSk1WL3AwVzBrbWFlRjdvbUt1?=
 =?utf-8?B?SzdFOXowZ2VNNDZPNEZWQzloV0hUT1ZWbkhiSXVOQnp0bzVsVXZIRVp4K05U?=
 =?utf-8?B?WW9vaHVaY2dBWUk3ZExRM09TTSttTXZ6SXNjaVZRb3JUVERhTjFhbHJhbEJP?=
 =?utf-8?B?Umk1cHgxQW5rRmF4TmJHWmNRODlCdzU2dzNod1J4ZW1JRnVtWnptZ0g3ZDlX?=
 =?utf-8?B?OW9hK2xxVDhrcnlCUEtqa0hUVFFsUWFTbmFreUZZMXJJMU1idjRyY3puNVpi?=
 =?utf-8?B?cDkxMTkzbjVLSzB4bVh1TVpXOXRNM2FpSFkrYUNyR0NUWU56cklTTjJsTytO?=
 =?utf-8?B?b1cxcGtQL2k2UVVWL2ZnTVZ3MFpVNjAyUUJDcFJDM2tjUmtyTEQrajVjMmpk?=
 =?utf-8?B?LzNXVHFWL1B2TlR3ZS9LK3daTmFRNXdOVmJ4b2htbElmd3IwdVRhUGdNYU12?=
 =?utf-8?B?N2NqNk9qM244ZmJjSks4NW9rbE01ZU9qbjR6c3VXNThVUy9TbEdVTDVCN1Zq?=
 =?utf-8?B?dWRmZy8rZjg2WmZqcmRRVXMzWk9jREw0QmUxNmE1aVFveTZjRGdIa2NhSUg5?=
 =?utf-8?B?YkhuRWc4Y0ZweTNNSk1pOU13TDRnbDJUY2UzeFhVQkZUZmdRcEZRbkxYUmRh?=
 =?utf-8?B?bDhMblEvWHB6Q1lUZjlBYnc2ZjlFSWoxM3pUcXNhVW5pQk1CdVdhdEhSWDFp?=
 =?utf-8?B?NjVVMVp1alpURlh1NHI0c081NUZFcFZQRHE1VEV5anpML3VmYUhWNUdBZHB2?=
 =?utf-8?B?VXBUNGMyMVB5UE0ydE1GVWZNK2dCRTVkTEtpN1lpRUk3VlltL0E5Ym9wSmlN?=
 =?utf-8?B?ekNLVHh1cXpEenhWRlpQTG1sQUp3Mm4zUklpdXdpbEtOQVJvZDJycU5BTkJm?=
 =?utf-8?B?c0szaGFDU0M1TGErSVJsYnJzWmZmRThoRnZyelBjVjhZVFJ6NTJ2UEkxSTVC?=
 =?utf-8?B?RjNIWnB5Mm9lZ09sRkxxUjZZalNXbm0zQk0wZXZUS2hibjJVR1ZHSWlicjc5?=
 =?utf-8?B?aDFnaWhIeXJadDhtZlh3SlhtTHVDdG9aWXlPR0pGUnM4OXpDN2E0K2FsTVdv?=
 =?utf-8?B?MkVtMjZhdXIrMERYeEppVjNteC9aQTdQdHBkaTMvMnMvcUlJNVpjdThYMFVT?=
 =?utf-8?Q?iffKSmhIVhgUv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEczWi9EMnM4OGZ1VWJUSlhpTnBlVjM2d0tVb2VidlNaNkxlQXJmNUlGc0hx?=
 =?utf-8?B?OXRWUzNKY0pDbzFDU2xBbnBYdHRDd1djSHJCbkd5RkdTK1I3bGF2eG1HTXhR?=
 =?utf-8?B?azNOZjdNbUlKUStBM2h4UE9ZWlUrakg2eE9KYVpYZmhadGF0THcvSVVwTWlk?=
 =?utf-8?B?NVE2QWNZWWk5WlhyM0JxMFV1cUs3UFNvdGlUSWZKSXZZTk1NeHh3VnlsdzNU?=
 =?utf-8?B?aU9lZ1NENnNUOHBYS2RpbFdjS1Zma3lzRFo3TnRUeFozU2preHlNOEo0Mjhz?=
 =?utf-8?B?a0xuQ0ZQMk91dVFDRVVQQVlmU1ZRTWs2cVAxam9jQXdoOGVTWE5mSVlFdUsr?=
 =?utf-8?B?WVFkOUVnaWlRWUlLVGdFQ2pmUjNWMjZZRUpYVUtvWTNGeFFuRExpZkdqRm9S?=
 =?utf-8?B?allScmNzSm1MRk8wb3d4QTB4VDA4MXpsMXAySmQ0OGNqQlREOHZPTnpFbHBJ?=
 =?utf-8?B?YWRudDhYQ3dyQTljbkowZW85N2ZmQnFiaTVPZ0U0RGc5VjNIYU1GQ2Y0Z2xt?=
 =?utf-8?B?MS8zc3V6N1BEZXdQVng3cDZ0TXBvdSsyc21nRlhQcWEzZUZXRldnU1l6SVZH?=
 =?utf-8?B?WTBqVHk4OHJtd1R2azlKSXlWaCtLNTRLa0YxVjhWU1VGaHcwSWkxRjQ0ZytH?=
 =?utf-8?B?WmR1N0JRUFlXZ0ExUVFPZmR0eEJncjFMUUtGZ1pQTXFBc2NFWGVuTUJ5Z3hE?=
 =?utf-8?B?YjducnlXSG02SzYzUG0ya1luNE1EZStXOHMyTlRRV3V1L3NLQXlFZ3F2d2hD?=
 =?utf-8?B?ZTFUdWNIZWFYbnMvVE0xOVRZNksraHVlTmFtRFFqeG4vM1lNa0VTN0tnNFhH?=
 =?utf-8?B?ekw5NEFzb08ydUNiNE5PK3JhUWRXQzV4NEQzeHNURVA4MFBpejVQR0g2cUZo?=
 =?utf-8?B?L3NXcmpWMkVxaXFZUnRZSzJJTDJPS09YY2JEZis4NUllWEg2bG9oZ0x5MlRT?=
 =?utf-8?B?U0JDUUFxdkhrSzFDclB3WktLNWJEdFJWbkhqNnZibTRBYUE2WDBsamNuQUly?=
 =?utf-8?B?S0p1ZmhMVFRTMUljMXdGcHRkd3hYSHB4SCtFMG9sMEhNZFZGaEhlbTJId2I3?=
 =?utf-8?B?a25YWmpQanE2MlN2OVk0TTBvR0tWQ3ZIalJ1enhoTk43Smp3Q3NVSDVncy9I?=
 =?utf-8?B?Y0FjVno4VnlzalAzWko1d1RrMTFNRk9scUtPMzBWMG5EUkNpS2Q2Qko0cWo0?=
 =?utf-8?B?WnFWamE0VUswZlluV3FJSkV5K1p3em5qM2hLbU1vVVdML1BJbmhOVWFMOHdj?=
 =?utf-8?B?aHYzU01zb0RWc284QlBiYWJQbVdYSE45TGlPampUWExjRU4vNWRWb3U1eGRO?=
 =?utf-8?B?TU81bk5NeXdMeElmV0tIOWhLcE56UkMzQkNoWkk0V2V4NG40RXVJRE5SQzZM?=
 =?utf-8?B?dHE1TSswRGNCZXVJN054Y2VuMGF0S3hwb0tpOWhyYnQxUXMySzF2YzU5UUtR?=
 =?utf-8?B?VUVlZUxxaS8zejljajV2VDNmbkJrc3BlNWNBMVZIM3VBcnIwK3UyaXAvcG9I?=
 =?utf-8?B?UXdBWHVpMGs3UEpmelB6aEs5OGFINDJlNERvbFNzREo2OEQraHlRdTUvUzR5?=
 =?utf-8?B?OUN4UTBVdGlJMnFSbFNQS1VuS001WC8wRXBOY0REM0F1VFB4S21OVXZ1MkZn?=
 =?utf-8?B?SzVmWER6NHFqQXkrc2l1L0xMVThTV05TSkM5dGR5RVpQVHMwZGtEdzFEWXlX?=
 =?utf-8?B?OVNOZ0NuRjI2cU55a1h6SXA4dnV0dzNqSUlHbDMxQk9vRHVqUk9VZmg2NmtO?=
 =?utf-8?B?MWw0cC9pdDQvaXVMRU1taGFPN0FSaFl2TExjV3FPcndsaUU1UGFaaTJmWTZv?=
 =?utf-8?B?cFd3V3hpanorSEFhOGk5djNDSWUyQUU5b24ranE1b0FRQ3A4UlAyQnJGNmNz?=
 =?utf-8?B?cWJsYW1YTURqcG5rY2MvNjYxMEY3NVhXdzVFYXliWllLVjRNZTVzb3RuN2pl?=
 =?utf-8?B?cTkzdGxTcERmM0hrVjNmS1A1dlFaSVBXNVdYby9PekRQM0NGTTVFOStpaURD?=
 =?utf-8?B?QXlXc1lNWEtQWDhGYmZUbmN3Yzd4bUlaQzU0S2pGNUFkMVAyTHdPRHZ4M0dl?=
 =?utf-8?B?TUsrd3VpSHc2M2JFT0JxQ1d6ZU91MFJoc1VvWUtHc0Z4dG9sTk5pbXI1cHdP?=
 =?utf-8?Q?nyFoUWysimlwp0w3WGLPkKq0+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf289b36-de4a-4e7d-e27e-08dd5b10d062
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:36:33.2009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjftvgKqJW8PquGVgEKusihJUJjZbWpnbvAKhW1dqnjHyru0B1fsAj9nW+UzguHzIS0LR4zQHXniq6Olex0beg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6535

Hi Luca,

On 28/02/2025 16:18, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Introduce few utility function to manipulate and handle the
> pr_t type.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h | 36 ++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index c63a9e6e5455..3a09339818a0 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -50,6 +50,42 @@ typedef struct {
>       prlar_t prlar;
>   } pr_t;
>
> +/* Set base address of MPU protection region(pr_t). */
> +static inline void pr_set_base(pr_t *pr, paddr_t base)
> +{
> +    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
> +}
> +
> +/* Set limit address of MPU protection region(pr_t). */
> +static inline void pr_set_limit(pr_t *pr, paddr_t limit)
> +{
> +    pr->prlar.reg.limit = ((limit - 1) >> MPU_REGION_SHIFT);
> +}
> +
> +/*
> + * Access to get base address of MPU protection region(pr_t).
> + * The base address shall be zero extended.
> + */
> +static inline paddr_t pr_get_base(pr_t *pr)
> +{
> +    return (paddr_t)(pr->prbar.reg.base << MPU_REGION_SHIFT);
> +}
> +
> +/*
> + * Access to get limit address of MPU protection region(pr_t).
> + * The limit address shall be concatenated with 0x3f.
> + */
> +static inline paddr_t pr_get_limit(pr_t *pr)
> +{
> +    return (paddr_t)((pr->prlar.reg.limit << MPU_REGION_SHIFT)
> +                     | ~MPU_REGION_MASK);
> +}
> +
> +static inline bool region_is_valid(pr_t *pr)
> +{
> +    return pr->prlar.reg.en;
> +}
> +

This is common between arm32 and arm64. This can be moved to a common file.

- Ayan

>   #endif /* __ASSEMBLY__ */
>
>   #endif /* __ARM64_MPU_H__ */
> --
> 2.34.1
>
>

