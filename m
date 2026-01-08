Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B1D042B8
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 17:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197797.1515220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdsXn-0002to-IQ; Thu, 08 Jan 2026 16:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197797.1515220; Thu, 08 Jan 2026 16:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdsXn-0002r7-Fb; Thu, 08 Jan 2026 16:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1197797;
 Thu, 08 Jan 2026 16:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdsXl-0002r1-91
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 16:07:25 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d1c4d9e-ecac-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 17:07:23 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL1PR03MB6117.namprd03.prod.outlook.com (2603:10b6:208:308::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:07:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 16:07:19 +0000
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
X-Inumbo-ID: 1d1c4d9e-ecac-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4ZAEUQsOYsDguIQwjdnGotz7MFBB9a1yjDVw9DXNFS9Wy+Por97XJd/Vb6tmDbPU5VXau3UxC5hxRxA+csHpDqE/L/RYPTKajIps2ypimQZeDDAI0C/8y5bJ4WqAY5dBGJdp3u5bM6uDMpWuagIwbg4mpiZ+yyI3FxOe/Vulj+Yi/1E1cr19r/noTEgIkHiWEinmMsfKjUtjZG4TdoGXJ4q1VS0E/orrlhXwW7oLVdA4JHtygd12SyWmNJEs3joTH/mxn+DCXdeAnLWKNUnnT87E1WupBZ2HYbhVIorhXVlzP3Rf72wZ75oLix+sleOil1hZ9rTxDaqLUSFBxJsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwirbyfjPRTT1gO89bqLL7UWtwqkXp/BAHbyOm+22/c=;
 b=ExE+M8BVgDsnJu/fNEJpVG3RCRKX8kyP1CTLZViRLxckp7UdwPO6viRq0uMwrgPJV78ibTU9mK87JexV+Evc4PjQmdCoyL4BzGPmQhvTb5c3GjCRfz6+Uj3GY7WH6mK/wdQo/k7216RtAbeW9BX4DFpMp+uU8qnLIWz8pE517ZeuD8tgcsXvbtcHv/DR2kkAmUPSl+D+XaeFnAJWJbbGokE/6ZGPwY1U15I7E0qCfiZFzSQTpmZAnJW3Xdp24/YrHPwKzQ2qQAv0lwW/EZvYmk1B8eOo+yHP3roGVMDYAkQ1LA3mdPO5I1UQhn/kg7o1i4jI+XG+wQAr4MAbk4AaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwirbyfjPRTT1gO89bqLL7UWtwqkXp/BAHbyOm+22/c=;
 b=BnIuX2NojN0ZYSpEtuwV9IAOBMZRLpQAtHXonRCsJG7yJlGVOftSRqFbCiMByVSQwLFodPUfIDnHeHA9GrzrD3KbIMN7+wwlCokUnENYY9tgFJnGi2oMIgDZziEIBdPh6zjEHaiZVlE7swX+ZlPo1e0Y2ltvPCKfKilttdLSgkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jan 2026 17:07:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"committers@xenproject.org" <committers@xenproject.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: [PATCH][security policy] move past team members
Message-ID: <aV_WNB6D8l-3xhCt@Mac.lan>
References: <b93fd713-c24b-4aab-a24e-1b69b4c7e233@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b93fd713-c24b-4aab-a24e-1b69b4c7e233@suse.com>
X-ClientProxiedBy: MA2P292CA0021.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::13)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL1PR03MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6bb274-279e-4a03-006c-08de4ecffffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1hybkU4R1orVk9MUzFwMVJHeHV3UzZ5cGNiSCtMci83TU9YUmlXb2tOZ0cv?=
 =?utf-8?B?MDhwTElLZHc2T3BocjdNTS9oWVhUNUFtTjArV2NacTdHNzdMblUwTzlZei8x?=
 =?utf-8?B?N3dLOFpVWGVaTkdzQ1BRS0F3YnlvUWkxZG5YdFpmR2JtZUhoNzFxbUVyeEo5?=
 =?utf-8?B?dUhrRXBUQzVVbGJ1NHlSMGFoYWxHaXc3MkVmK1RTMUI0R0JjR0hOeS96WXpm?=
 =?utf-8?B?S250a0hJQmdSWHBUV21aNTZWN2xYMHhLZGNUT21LMzF2NjJCanFsclVYbVJO?=
 =?utf-8?B?am9XNTJ0dkozTkZRY2lIeDJxcDF4bk82YldYUUd1Z0sxbVpxRFZIaUV6dTlJ?=
 =?utf-8?B?YVhFMTI4aXlpUHZ3a1pxQkJyN2JwZ29oR0s5WHdNRHE5UDE0Vkd1NHd1blQ1?=
 =?utf-8?B?Tk5wZnBnMjhYQU12dm1SbWg2Yi81eW1wZmpxRG16THlZN2pZZXVuRnZXayts?=
 =?utf-8?B?QjdyU3JsNHM5OEdaZnhjY2k4RnUrd2hteG5iZDZsc3hMdDFtU0ZzM0JiNklO?=
 =?utf-8?B?T3diZHpDc2R2RmZJd3RDL1JhcElOR2RqbjdZN0RXaVYwZ1BMYnFydjM1cmxx?=
 =?utf-8?B?eDhZYjFtZWtidkQ1SjhpQWYrbXorRU5oRjV4cTBrRWlQYnhJQ3k3aWRQZXdV?=
 =?utf-8?B?QWk1QnBpQldKK2hFK0ZiQ1hSYjY4d3hOWG9CbUFuOE9NYllBRFRBbXVUbGRI?=
 =?utf-8?B?RmxRbmtLWFIvdlZHcjBsV2JVTHpwdzRyOXR5WS9zYWpObXZ5b1ZuQzZrRm44?=
 =?utf-8?B?b1BkL3o3WDdmdVhKNnJ6RDJidXNxaUhpRjN2dmg0T0FoNVpXbmI3a3Vsd3Ni?=
 =?utf-8?B?Lzg3M0xyZUlIc0lEcGhQRDlXd2srWEpqOHdmc28zV0hzYy9MS0p0VjVkZ3Y0?=
 =?utf-8?B?YlZSMENCN1hzNmNsbE1BWWw0SGpSVitNUDdrclNEOHE0TENXNFBJSVR5dmxz?=
 =?utf-8?B?dE44Zm9YK2NKeTZGd01LdzZUR2JRNGVEbm9scGcwMzkrTUZWRVZpVW81bTJD?=
 =?utf-8?B?b1l6eklpeGx4RzJRanZDMTBvdHUwaWxEMkVKbE9GOTFTTEtCNkhpS3NGYTZk?=
 =?utf-8?B?MnB5bTYxcHRzc21tRndYczA3NUhMZ1RiVWhSS2puZEF4Q0VQV2J6SE1BUkNG?=
 =?utf-8?B?MThCNE83L3JQOGJGaFdlbGZIRjY3bmpWRlFCQmxaVzRERVk2QTcwNzBUWFdp?=
 =?utf-8?B?TUVFaXJHa3RFZkdteUk3dzZtYXNITXFLUW1LRmpVenVWOEw1NXQ2dXpUL1gr?=
 =?utf-8?B?RTVUZEJKcnh5cm85M0RqWDh2em5aRlRaYngzWG02Uld6a0Zkdm4vYmc5NzJ3?=
 =?utf-8?B?VkI4TlFEOThBTG9QK29Ib1NBYTRjdURmY3RsNnlUSDJMSWZBeUFwRERJeVN5?=
 =?utf-8?B?UUVtVmtRZ0tIcEN5YmNyZEFvbVI1bjNhOE9HN3c4a3EvVGxJaXBUZStrc3dL?=
 =?utf-8?B?S0RvTkVqYnVTUi9GdXhROEVJWTczcDNIN2dicGlsSTdKcUFOaTB2b3FpUnY2?=
 =?utf-8?B?SzhuU3BvT2hqZ2l0SEkwNENnVDNjcVZEU3NIc1VQOEFNWGY1WGdnbG5pSW8w?=
 =?utf-8?B?NWtqYUdrcVBZamloWEt3OGlJRDFoVkQ2czZDRXNUYUxZc3hEdk9YT1I1VEha?=
 =?utf-8?B?bndGUm1ua0VVeDN1SXg0QjYydDR3bEhvNFc1ZVdsc3pRRnFlZ1pXQTQveVZI?=
 =?utf-8?B?YTVBTmsvZjY2RzZKN1pjZmp2Sk0vL0tPYTNTRmQrNGZvUUZyUm1tRWEzTHZS?=
 =?utf-8?B?VXo5K3BIUHNPU09leW5pdDJRaUtqZFNGV1hHVEc1eHc0b3VBZk1TZzBRY1hy?=
 =?utf-8?B?MmVvVFkzZU1MeEk0UzE3czVYeGZTSHVSRDdZd01ISW5RSXdxcFdNMmx4UWE2?=
 =?utf-8?B?aWFQVTN2RkVmZ2l0QW9uWGhPYnFrdmN2RXFaQlY3MDUybmJ0TjFuRlpIUXJZ?=
 =?utf-8?Q?ZltczPErIyzSQ2I/t5Xr3jL6aGKJG7xk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dThKSWplZk5MVnZuUVdFMkNja0ZnT1pNa0V1RGxLbmlxNjQzWTY3Y2x2NUVm?=
 =?utf-8?B?ZVo4WTllKzBLc0pRSTUwRjNJaXBzY2pNSVBOdmFBZk93Y1FxdGtJNUd3dTRC?=
 =?utf-8?B?bHpCQjBBOTI5ODlvZVYwY0xJR1NXTGtDbW1lZ0JoRGsvaXg2R3R5WHlZdnJG?=
 =?utf-8?B?SGVYVDJjUnFVRGw0WHAzdVpRSlpiQnlKelZ6RFIrQ29YSjduUmtMNTllUjB4?=
 =?utf-8?B?and1STMreElRYVJ0SFlYMENLSGttc2NtL0VkMFgxT3RRYy9pOXM1ckYwTjN5?=
 =?utf-8?B?T0ZGc1gzRE5STkR2N1MzOEdTTUsyQ2VVWHJPN0xxSFAxbW1qbFRFNkNYaVpv?=
 =?utf-8?B?TDQ2WW52VFIrMXFRN09wQ0tRK1VqMk1RZWpycVJKV2wvY20vYjZuazZyZ3VQ?=
 =?utf-8?B?TllNcjl4ZmhVSzNGZ3ZxNEkvY3NKSTZiK3d3STA0VmRkZjRNZU5ZTW12bjM3?=
 =?utf-8?B?RzNmcnBNL3VyeHF0ZjdPRjRSek5ON003b3dFaHhHQUo3QWRmRkFINnhlcGpQ?=
 =?utf-8?B?Yll2MHlNd0RiOVIyWGdCL2JOVVE2TW1WdUtKenVjYmlyTENqaUdYY0JnMlg4?=
 =?utf-8?B?VGxCZ1JSMllhQlN1bmhGTGRSQTByTjFRVVhoa3puRGxFNXZPUHdQVWlhMVFv?=
 =?utf-8?B?MGtzTDJ0SkJWZzBZSEp4ZlVpQjBreXlJYlFzZ2xBNW5SRVlQRkJUWEVLVWlD?=
 =?utf-8?B?WHVlL2pCMU1DSE8rYk9sWDExejlDdDV5SUJzVWhPdG9ORmhzdG9LY2hTUnlC?=
 =?utf-8?B?WGRwRXJTNmlMNlBuVWFoWlVxSHdpcjFCVTNpS2JSU0lXZUJYdmJjYnJib2h2?=
 =?utf-8?B?dE1XUm85S2dpZGVtRjBZTEMwT1pPL3d0Q2pGQ3VxRjBXeEV5VzE1aXhHWVF1?=
 =?utf-8?B?dlRueTVYU0xiS3J3TjhQTGhjNEZUUDdKV2dtancxT2JZcjFleGN6d3VJR25m?=
 =?utf-8?B?ZlczTG9XQkkrQm1sclVEY2o4WnNGb3NxelNNRFhzajFBbElxM3JINk1OUGY5?=
 =?utf-8?B?dG5jUUlCNGd4S003RzdpZXhXUzRYSVAxd2x2ZnRBRkJBVGlvV0R2VjN5UW8w?=
 =?utf-8?B?aldXTzFzemtwb2pUL21jTldYM2piaWZQZC9yVUZaTTA0TEIwcGpzL0NFQVdk?=
 =?utf-8?B?SVRBcFN3UUZDdXIxTFNtQkI1YmI5TjgvM1RpMGVhcGFCUTJ6WFAxRlZEN2oz?=
 =?utf-8?B?SmtuTytqbDJHZGZBMUsydFhXSkh0a29xeVJqdkQ1ZlIzSENXQ1pWRVVxNlNx?=
 =?utf-8?B?aXBrRzdZRHEzT1FEZWhLdVFZR0VUZDdVSTZnbU1XVEl2TnZERmhTOUhUeUU1?=
 =?utf-8?B?RDNQOXZ5bWRCbVJLbzBRdVpjMmtmWEpvcWZ3b0NHaXhoblIyRzJEelcvcGRR?=
 =?utf-8?B?WkpXSFdmSW9KaG0yQnlRemFsdHVNT1pYakczUmhSWUlrdEFvQ0UrRVBaS2FW?=
 =?utf-8?B?MEtjSWc4bER3NXFKNWZERnB5cVNudkp5OWRrQWJQakZ0d0xrZDFKRGNBUXh0?=
 =?utf-8?B?RG5DblY1Mlc4cERBRkVQcER1dDhETmkxVjJ6SDRFNFNXYmRNcmtWbGd3OXRm?=
 =?utf-8?B?RjdpRWtDTXB3UDc5NXZ6cVBWUVhINlFoZU9mVFRhTkR3MDF5Q3UxS3piTGlI?=
 =?utf-8?B?QktVZTRyV3psMUQ5ZU1EMlF0QzY5dTZaVmNidUFRT2hsYldnSWxTT01wZzN1?=
 =?utf-8?B?OGlQdSs3QXZvRE84bDZ1WTk5OHF0TFQ1bzdyZ3RwNHYxWjIyRkZTd1lCRUt4?=
 =?utf-8?B?UE94Tnc4YTdoYTBTNVhCK2oyYmJFQlNLY3V5OUhudkQ2UUExdXFsWkkvL3Vl?=
 =?utf-8?B?bnFQQXRoRW5iZG40UitYN3ZPakNhV3Z0cVQwaGkxODEvNU1weGJUaUtjTHAx?=
 =?utf-8?B?THRnZmp2RmZwRHlZMTBocmZaWFMwcWhuaTh3SXZ5NmU5RXpnY2pjWC8wcXl2?=
 =?utf-8?B?OHVXaEVVS2lYQzYySWhvOXBkRGtYUmErR2pBNVN6OUJlM0JkNndZaGlEK21h?=
 =?utf-8?B?RmU3QnVnMSt1RlpzWmROT1Z4TEtzWW1mb2kwQ1ZYallZZVlkS2h0Y2ZqRE9L?=
 =?utf-8?B?VzZGdzY3dDE4S0g0Yk9udFlCMWxSeks0Z1orYjhlNGxCNXN6azdHNDB3eGJN?=
 =?utf-8?B?ZWsrcGxvN2ZYT0Q3ek1PRldDV3c5bnJFanF2QXF4ejJ3dUEvTngrMGx2cU1C?=
 =?utf-8?B?dnQvYURPWktlWkxYS1VpSCt5UTkyOXZzNkc4TnJZYk8zS0dZWVJJN1Bjay84?=
 =?utf-8?B?dzJVbW5KRk84ekVLNzNmMzN1Z2x4TDI5cjhjQm0ySHlKNkI2QkdrVUZHYjRE?=
 =?utf-8?B?MlBvWC9XV0ZFV0dETFc2MzZJcnVwSUVsUDRPU2lCSnhIM0pnNE5BZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6bb274-279e-4a03-006c-08de4ecffffc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:07:19.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmmXpP+Gng/4j6e4yU/bL8GGRewcHD8w7NBL4SkTV2NGlXEBPu6Qs17pv1U8Xx3hl6e2OwMeqM9RmZ3BG5bEww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6117

On Thu, Jan 08, 2026 at 04:47:21PM +0100, Jan Beulich wrote:
> While this information doesn't appear on the rendered page, it probably
> would nevertheless better be accurate.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

