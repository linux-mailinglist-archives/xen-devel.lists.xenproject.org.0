Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA1C0D290
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 12:34:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151520.1482054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLTx-0002YI-9m; Mon, 27 Oct 2025 11:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151520.1482054; Mon, 27 Oct 2025 11:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLTx-0002Wm-6b; Mon, 27 Oct 2025 11:33:49 +0000
Received: by outflank-mailman (input) for mailman id 1151520;
 Mon, 27 Oct 2025 11:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vDLTw-0002Wg-1Y
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 11:33:48 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc4f6006-b328-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 12:33:47 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5287.namprd03.prod.outlook.com (2603:10b6:610:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 11:33:41 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 11:33:41 +0000
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
X-Inumbo-ID: cc4f6006-b328-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2QD8twNkeNDoet19gln7qV+tPgMMzUhDfIDULTns0v/HPefj3BFnMwNYbGL7KDxiCn/5K9sqX7/kc7KCbj/YZ6dyIZo2s+A0/maoE0Iq7zdJN89qKCZKov8ST4FUN3Qz2Cv13MVxc/Fu4ZzN2mM0lRfSaOyN7eiqpZ42l9Wic8M2Mjzhc02CTyDosp4LQrit1I4wemqspgNgTGZKElYWFor+oaqkYKRpHrJ+GH7CrQePJMLU2fe6qRCWINRZpCMHHw1Wl1YNaiD3pM8217oWByv2c30EO+Cw+rJhujLnhIp+jyFRRE+gtrLkGvZtpBcHY85FzW5nY1nCFfXv+WumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x+48BY8Y19X6DkNc3fenIfDrpmoHJjRz71Yrta7NV4=;
 b=oBAtSEx/zI+bpf1XkJyxU4OBAu8VUUqDIA6rvI1WWtDUc0fZEBh5/V1xwSDGcUBx7Ae8CBNioA+CA8Ojv+EHtYysZQUgVrklv9BA3T5tf+hecv9kMnWfEeRq9DJB8Pv+NgKigL8npW5KHZQVS6aZEErUwMUBDbDyMwTH4V+yNh1xV9usXOq1Hxg8FIFVsLHqm2IAtb1qKPbiRWrk2EeZwkXxoyVAr8hXEyFQER0CHon1tyO/tACyk+zQ84jqajJYjOZRxzJ66rV/acOFmnpWWQizWbrbr/LFwlrmIdvpZRDGk6SFDFawyfjYE3WbvvQV4jLbDHP5mVnmVsJRmez7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x+48BY8Y19X6DkNc3fenIfDrpmoHJjRz71Yrta7NV4=;
 b=xKuZbr8e16tsl8vhlPZYOpx7jYbZjT+z/pMHQPkBW8GPYoIuen7iRRdA1F/RCRYClekDsjz3GVYpZCh3GNDTZjV+TsVciHuRXYIr2aOMdcIWCPb+b6xoRfqRicqUXad0u8HCq9NaEEevNtaeuVuWbECW9fv9/y9J913DyYMgY9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Oct 2025 12:33:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aP9YkLo782XbfMQM@Mac.lan>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <545d98e0-755d-471b-84c5-54f129a5aece@suse.com>
 <aPt-B5R-FwJpQbZR@Mac.lan>
 <6428217d-b5f6-4948-aff2-b007a6cfcfc0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6428217d-b5f6-4948-aff2-b007a6cfcfc0@suse.com>
X-ClientProxiedBy: MA2P292CA0016.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::14)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: c5888c9f-c4c9-4cb1-581f-08de154cad95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGpmQ2FialBrL2pwbXpaQzdVS2YyUk4zYUUzVW55OVNEUHJjL2cyMjFuVXdT?=
 =?utf-8?B?MG02RENDTFdNaUFQUVVDUjNKN1RMS1U0VnR6WXVDM1hlaCtubDhCWTRpZkFm?=
 =?utf-8?B?cHFhZGhqMzNXa0s1dUErTkcyN01ua0g2aGpKK1I4d3Z0U2V2aUhvM1A4aFU4?=
 =?utf-8?B?Tk5GaXgyeWdaeThXOU9RbzhMeENMZE5qUkFjL3ZiZDZYQnBWSE1xOWIxVmZh?=
 =?utf-8?B?SHhxVXhMTWNzblpnYlhQMHREZ0lUSjFoYjQ2MFBybTJaSDI0RXF0VmliaU1S?=
 =?utf-8?B?Y0JDOFhGS1BZTEpwT1pXb0ptbmFMMFh0TU4xMlJ2ZEMvemRQQ3NFSEtXTHh3?=
 =?utf-8?B?eGdoaHZXdUEvZ0xYV3JWVFZGRFhERldBNWZCckR3aWxrVU5tb1JFaHowaEFL?=
 =?utf-8?B?R2dXRHM0OEl3cU84UytGUGRaTlEwMnhxQUVXa2lkVFFQUFN3UlUwTjE2ck51?=
 =?utf-8?B?NE41RWhEN3dWUHVTL1NHRnZrTGxEaUZUdmNLbkZTNTVvSHRqMGZxcFNoWW02?=
 =?utf-8?B?ZzF6akFCVE5wNVVNbVJDN09WOVlzSEk0N3RQV1JKcFkxRkM5WU9PQzNmTHNw?=
 =?utf-8?B?Rm1vWnd0N05xSC9NVWttc1BFaUVzc0VwcmRjUXB3MkNjNmR1bm1uRTJJR2ZG?=
 =?utf-8?B?VnRHSUlLdVZYRlJxYUFBTWNRemxXc3FEMGhqeng5c3F1VkNGdU1jdVVCUmlW?=
 =?utf-8?B?RkNSMHNkd0xLVkYrVGF6VC9BWHA2SEhUdlZYc2M5MDZFN254Szc3QmFFT0tn?=
 =?utf-8?B?RkhtL0ZzL0NoemVGai9wK2kySEJDbVJ4UTM0RVErdUJRcEN3aGRTZzd2dmZZ?=
 =?utf-8?B?MGNtR3VzS2dUaXZlcjBNaE0vL0tIWTRaZzhqMjBhelZ3czQ3Z1hUV3ZmTEo5?=
 =?utf-8?B?THFtTlNyRjlhZlQydDRRTmdDeG1qeWxSSFVtVG8ycHAxdXJvdWhHOGs0MC9N?=
 =?utf-8?B?MW8xUVNmREZOc3MrSTFNcitJUVR0SVJWTTFQb01SUXhZRUR1Q0RtK0orWUc3?=
 =?utf-8?B?MU5ZWjhxSkVOS0dJS3U2bjBGS1RtVU04TmNHVWFmYmYxeFJPY2VCN1BoVldR?=
 =?utf-8?B?MTlxd2pDNUxzTEovTzhwcThpTzhWUkZPOTQzNEUyNEFvZXAyZWU1RW9IWmE4?=
 =?utf-8?B?bHZGMzBuUitDeEFKK1hSWFZpUHNxblJGY0xUNzNCMWRZNVRaa0lJempDYUJH?=
 =?utf-8?B?ZUZ2MkdlUG1OSWg2NEhlNnNsdm9INnBQOXJibnZ2b2wyb0pDRkVtNGpyWGFh?=
 =?utf-8?B?dXlObkxCWWZ6VjFBM1ROOElxdmdVRkdMcHZWMjQ1REh6RW1aYmUzRlNDSTd0?=
 =?utf-8?B?eFlMaWp4bStjVUpISVU1NmZPODBTb1M3RnV6TUlzVDJXUkZlK1ZIR3UwR2tS?=
 =?utf-8?B?VXFVUm43dHhWV0U4ellNL0Z1MmJDK1NpaEs2S3JRVnlYYWhvUmFlR3BQTzlk?=
 =?utf-8?B?eW1naWJaRWQ2ak82bVpOMjFCanh6TUliWisxaGQ5RHJYTG9qRU1NU1pCenVU?=
 =?utf-8?B?dFhzeE9VTWNzV3dWcHlTSEt6UDNQRU9CNUFKK3VBd2ZGYzBKemhFeVo3RVNX?=
 =?utf-8?B?MWJWdmc5R3hlRVhvOG9SL01ueUFkcldKZmNsK2NXMFk2cDczTDdRbFlCaGNH?=
 =?utf-8?B?MmpTNU1mSVd0ZlVCcXVFd0tjNWN4ZzRNd1pwM1BscUpCVGVlTlJNV0kybHVl?=
 =?utf-8?B?dXJPZ1B5UHNLeXRoaCtCN0cyNkdXVnFiWjdBMWdyaUxWZ25ZcFo0NHRXWmpX?=
 =?utf-8?B?NlEzRUlhWGVCZHR6ZHJKc2xDUEpySnBFbkE0dmdsTVRWTjk4Yjljdi9oaHBL?=
 =?utf-8?B?WE45TlI0bFhUL3VOTDkvMmlyTTczaUxsVGdaWS9OTTAzRzRJeVh5SUY2Rzdz?=
 =?utf-8?B?dVQ5ZmZSQnh1Q2R6NjBieTlDL1Nhbkpxc3Z4YUJqalZ4bDRkQ2tnN0hnT3dF?=
 =?utf-8?Q?ZXW3W8kJ1aDHxCxDL8f+YB0jbYlD2WWf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODA2VzcyRkZwbC9ESUttS0ZNd3hIL3NhdmFiUjlZYWpiTFpOV2xpeEdRVGc3?=
 =?utf-8?B?dzNsUERBc1kwZ0plRmtyWFVWNWpuTVZFWXNYd1ZVcEtXci91ZnpML2NEOXZu?=
 =?utf-8?B?bE1zVHlNSzdlNE5NQ1NZTFJqcmhQN1VraWM0T0RLZG4vR1FwcnJnSFN3NHQ4?=
 =?utf-8?B?bWlKSitsQW9EM2wxWnZhVXVZbzhudXpaYlM0dmRCM3Z2MUltTTI5RitwaUlY?=
 =?utf-8?B?RmlKWVVZei96bncvWnBUOEYxQUw0TktBYUtGS2s0R1o3d2JYbEVBRHZxMWlS?=
 =?utf-8?B?NEZFY2lENzZIT3FQc2NpWFZ3OHBFTXQwZU9HRTUwelNFR3hlT1hKbkRkNXVi?=
 =?utf-8?B?VER1QjJlNnliVHJrV3ZpUkFTMDZtVzJQZzZvaWU1cFZDcnRXVUx6cWRRcWJk?=
 =?utf-8?B?VzZ4VUVoaWVOU0p1UGZla1JxRmpVWHRVUStJSklGSFZuRS9Yak9YNlp3eTBE?=
 =?utf-8?B?ejFneW9TMTNRc1ZoOFc0M0lQamZCUmxKNWQyKytiU1NpUWRWUkVYYWRzMEQ4?=
 =?utf-8?B?VVNZb0JPUjE5bVYxbTc1d2tvaWx6cUVWbHZST3htM1FMeG1JOFhuWDIrMjJa?=
 =?utf-8?B?VXlUNTVGRkpBTWw0emxOOWlqdmY3SlM5NzhlQzhGQzJkWjFESU8vNnpHU2xF?=
 =?utf-8?B?TlE4czNKZGRLVlVJbTNvQytaWlNHMVBwQ3FEQlBLYW8xRTRHZExPMnlnVXdW?=
 =?utf-8?B?bUZOTUdadGxKc0dnNll1WURoU2pTRlBsUmt2STFRcHRTVS9ndUFsNk9VaS9B?=
 =?utf-8?B?dDhYdE5GRzZXQ2hyK2ltTnZva2dPQklLdms4bW40VUdmeHpHb2lVaDRKK2po?=
 =?utf-8?B?b1NSNkJndnBkb05iL005RkxyenduVElLSWxncHZGM3BCMmR1aDRienBUdlJp?=
 =?utf-8?B?aGRrVXZ6Q2xHSG5KU0dIcFFscXRZd281UjB0NVd0c3IxR3hPUTVtOHJkZnN3?=
 =?utf-8?B?YlVoeXkrSVVGMlJrLzRJUE5QTlJ3dmJBU2tmR1FuYWh4ZDNoaVQvQnV2TllX?=
 =?utf-8?B?WitEU3FKa1hyOThTRWVub0FVOWxVSmdib2ZpTmQxcE4zRVNpaTVEQ21CekFO?=
 =?utf-8?B?aE5xR1ZtQ2dlMjdzMGpYRXJ6MGpmVi9KbGgvRG1SNTlnL1krMlpYUnUwS0Ix?=
 =?utf-8?B?WHYwRkIwTnhVd3V2Wm5aam5KQm9HTE8veUVYbDU4RmpjenJQdWhFZXJkbW1W?=
 =?utf-8?B?MTFmT3d6V2lLQ2hpRW56cFNLOHZtclRnSUNnWk5oemlxUjZ6cmc3Z0pJdGVN?=
 =?utf-8?B?RC9oMDJnelltckI1TnBVOUtHWldSRUdnTm9mVG0wMjNoOEZHaW94THY1OWRa?=
 =?utf-8?B?aDhJdGliYkowNi9OQUJiUUJjMitWMmhEZnk2bVNGb053cWppVXJNNkdMeHZ2?=
 =?utf-8?B?Zy8wZzdiZlJxeXpSL2FYQTV4dEFQZm9DNjF2bGJxbWVXbE56NHowcXhxSkx4?=
 =?utf-8?B?TlF4V09VVG83TTVaYUw3U21sL1ovN1hzZnlOK0ZlT2R5dktaN3Fua201ejdi?=
 =?utf-8?B?OFNIYmczRitnNDQ4K1B2QmxZcTR5UmQrQVEzdjkvNmQ2QXNva0RFN1lzeUFl?=
 =?utf-8?B?bzRYRFZ4YUpJZmVjMmhwckdLWXdoLy9IQm9vZ0JBd0w5cUpqRmF3c0c3WU9M?=
 =?utf-8?B?Q2hFNkYrS0Z1d1hFa3hKdW5wWExTdlpyYWVqOExuMkNQVW1JYkhKSXBxdHpW?=
 =?utf-8?B?K0lOODkvSEt2Y0Q3YjMxaGRjZndHTGRNTGZsNzhydmJ0T2dhZU43NmVNRm5n?=
 =?utf-8?B?ZzVSUG9PR2hibUZBUDNDaTViS0doMkl2STJZUGZrMVdPcUxYRlI2dDZJZW9u?=
 =?utf-8?B?UXFiazVtekEwQ2ZKdnlNOW1ZejRvRG1KWXVOQWNuUFFkRTNZeDh3WWxod0dn?=
 =?utf-8?B?MHhsYVhEeFVSTGl6VzF4NnZlendvY211ZCt3cUh5VzdtYWdCYUROdVdqWk16?=
 =?utf-8?B?cmlqQkNFdjU0UXYxVktJMk1PMTUrbm8zUlBKcjlnd1JSL2FFTUh4QTRtZFZC?=
 =?utf-8?B?eDdzdm40ZkFUczBWRm5yM0tRSE5PbEtHcDlmTUtRb0NXK0V2VWRRaU5QV25q?=
 =?utf-8?B?Y2RmakozRnl6VlJYQm8zbFd4MWJvWjdtcHNQVHM2S3lRdGVRckJqY1lTYnlX?=
 =?utf-8?Q?jAMiW0N3XD4e0ICPQdOdXbu/P?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5888c9f-c4c9-4cb1-581f-08de154cad95
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 11:33:41.3048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2zNj6W+KGFLRxtsBAiLENBjOd0jeE6v5NabevMeCmUHwRMaf+zJyMZgUsToFjMQCj2el9MdhM2kY1K1LOXCgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5287

On Mon, Oct 27, 2025 at 11:23:58AM +0100, Jan Beulich wrote:
> On 24.10.2025 15:24, Roger Pau Monné wrote:
> > On Thu, Oct 23, 2025 at 05:50:17PM +0200, Jan Beulich wrote:
> >> @@ -343,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
> >>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
> >>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
> >>  
> >> +    clear_irq_vector(ch->msi.irq);
> >> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);
> > 
> > By passing cpu_online_map here, it leads to _bind_irq_vector() doing:
> > 
> > cpumask_copy(desc->arch.cpu_mask, &cpu_online_map);
> > 
> > Which strictly speaking is wrong.  However this is just a cosmetic
> > issue until the irq is used for the first time, at which point it will
> > be assigned to a concrete CPU.
> > 
> > You could do:
> > 
> > cpumask_clear(desc->arch.cpu_mask);
> > cpumask_set_cpu(cpumask_any(&cpu_online_map), desc->arch.cpu_mask);
> > 
> > (Or equivalent)
> > 
> > To assign the interrupt to a concrete CPU and reflex it on the
> > cpu_mask after the bind_irq_vector() call, but I can live with it
> > being like this.  I have patches to adjust _bind_irq_vector() myself,
> > which I hope I will be able to post soon.
> 
> Hmm, I wrongly memorized hpet_broadcast_init() as being pre-SMP-init only.
> It has three call sites:
> - mwait_idle_init(), called from cpuidle_presmp_init(),
> - amd_cpuidle_init(), calling in only when invoked the very first time,
>   which is again from cpuidle_presmp_init(),
> - _disable_pit_irq(), called from the regular initcall disable_pit_irq().
> I.e. for the latter you're right that the CPU mask is too broad (in only a
> cosmetic way though). Would be you okay if I used cpumask_of(0) in place
> of &cpu_online_map?

Using cpumask_of(0) would be OK, as the per-cpu vector_irq array will
be updated ahead of assigning the interrupt to a CPU, and hence it
doesn't need to be done for all possible online CPUs in
_bind_irq_vector().

In the context here it would be more accurate to provide an empty CPU
mask, as the interrupt is not yet targeting any CPU.  Using CPU 0
would be a placeholder, which seems fine for the purpose.

> >> @@ -472,19 +482,50 @@ static struct hpet_event_channel *hpet_g
> >>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
> >>  {
> >>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
> >> +    struct msi_msg msg = ch->msi.msg;
> >>  
> >>      ASSERT(!local_irq_is_enabled());
> >>      spin_lock(&desc->lock);
> >> -    hpet_msi_mask(desc);
> >> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> >> -    hpet_msi_unmask(desc);
> >> +
> >> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> >> +
> >> +    /*
> >> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
> >> +     * actual update below (either of the IRTE or of [just] message address;
> >> +     * with interrupt remapping message address/data don't change) now being
> >> +     * atomic, we can avoid masking the IRQ around the update.  As a result
> >> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
> >> +     * keeps setting the new deadline only afterwards).
> >> +     */
> >> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
> >> +
> >>      spin_unlock(&desc->lock);
> >>  
> >> -    spin_unlock(&ch->lock);
> >> +    msg.dest32 = cpu_physical_id(ch->cpu);
> >> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
> >> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> >> +    if ( msg.dest32 != ch->msi.msg.dest32 )
> >> +    {
> >> +        ch->msi.msg = msg;
> >>  
> >> -    /* We may have missed an interrupt due to the temporary masking. */
> >> -    if ( ch->event_handler && ch->next_event < NOW() )
> >> -        ch->event_handler(ch);
> >> +        if ( iommu_intremap != iommu_intremap_off )
> >> +        {
> >> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
> >> +
> >> +            ASSERT(rc <= 0);
> >> +            if ( rc >= 0 )
> > 
> > I don't think the rc > 0 part of this check is meaningful, as any rc
> > value > 0 will trigger the ASSERT(rc <= 0) ahead of it.  The code
> > inside of the if block itself only contains ASSERTs, so it's only
> > relevant for debug=y builds that will also have the rc <= 0 ASSERT.
> > 
> > You could possibly use:
> > 
> > ASSERT(rc <= 0);
> > if ( !rc )
> > {
> >     ASSERT(...
> > 
> > And achieve the same result?
> 
> Yes, except that I'd like to keep the >= to cover the case if the first
> assertion was dropped / commented out, as well as to have a doc effect.

Oh, OK.  Fair enough, I wasn't taking into account that this could be
done in case code is modified.

> >> @@ -991,6 +997,13 @@ void alloc_direct_apic_vector(uint8_t *v
> >>      spin_unlock(&lock);
> >>  }
> >>  
> >> +/* This could free any vectors, but is needed only for low-prio ones. */
> >> +void __init free_lopriority_vector(uint8_t vector)
> >> +{
> >> +    ASSERT(vector < FIRST_HIPRIORITY_VECTOR);
> >> +    clear_bit(vector, used_vectors);
> >> +}
> > 
> > I'm undecided whether we want to have such helper.  This is all very
> > specific to the single use by the HPET vector, and hence might be best
> > to simply put the clear_bit() inside of hpet_broadcast_late_init()
> > itself.
> 
> I wanted to avoid making used_vectors non-static.
> 
> > I could see for example other callers wanting to use this also
> > requiring cleanup of the per cpu vector_irq arrays.  Given it's (so
> > far) very limited usage it might be clearer to open-code the
> > clear_bit().
> 
> Dealing with vector_irq[] is a separate thing, though, isn't it?

Possibly, that's part of the binding, rather than the allocation
itself (which is what you cover here).

> >> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> >> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> >> @@ -551,6 +551,13 @@ int cf_check amd_iommu_msi_msg_update_ir
> >>          for ( i = 1; i < nr; ++i )
> >>              msi_desc[i].remap_index = msi_desc->remap_index + i;
> >>          msg->data = data;
> >> +        /*
> >> +         * While the low address bits don't matter, "canonicalize" the address
> >> +         * by zapping the bits that were transferred to the IRTE.  This way
> >> +         * callers can check for there actually needing to be an update to
> >> +         * wherever the address is put.
> >> +         */
> >> +        msg->address_lo &= ~(MSI_ADDR_DESTMODE_MASK | MSI_ADDR_DEST_ID_MASK);
> > 
> > You might want to mention this change on the commit message also, as
> > it could look unrelated to the rest of the code?
> 
> I thought the comment here provided enough context and detail. I've added
> "AMD interrupt remapping code so far didn't "return" a consistent MSI
>  address when translating an MSI message. Clear respective fields there, to
>  keep the respective assertion in set_channel_irq_affinity() from
>  triggering."

LGTM, I would possibly remove the last "respective" for being
repetitive given the previous one in the sentence.

Thanks, Roger.

