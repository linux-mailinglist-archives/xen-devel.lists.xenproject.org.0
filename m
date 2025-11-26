Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D41C8B5C0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 18:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173326.1498385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJkj-0003kE-LI; Wed, 26 Nov 2025 17:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173326.1498385; Wed, 26 Nov 2025 17:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJkj-0003hZ-I1; Wed, 26 Nov 2025 17:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1173326;
 Wed, 26 Nov 2025 17:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOJki-0003hT-DA
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 17:56:28 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a8720cf-caf1-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 18:56:27 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7282.namprd03.prod.outlook.com (2603:10b6:806:302::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 17:56:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 17:56:24 +0000
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
X-Inumbo-ID: 3a8720cf-caf1-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAjbNxDJS/5gCDkVH7Qm7g8wbWWTQVi/BaN6pWua/bOZjai0fwP2X+bVh3t5K5Ji86jWJ7kv8KeBSzq4qlHzYu0yX9coPpAZVOy+MKOvvPNxtRsgk9Vsv2F2EQsSsXqf3l2bj0pbmHbgPCAGBJ5jdS+6ZUY9toI2EskbtbYn8DJMoNPaviUhXdlCrQOZbn6rJ5GXw/+bjYi0/mtkpAFxBlkw8ipB7Zqvl4GjG9XciBUQMM1FztgK5z4BTcpbDHWIrJ06xy2gTDThGfVxEC2f4ha62jjfB1o/2zsOvt59zm96PXSIW2m873UehTTU5BxQ5B1fcqwAHS9+DjwwhPq/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db9E0UhHHX0avoxIBa0aaEVVFiDQUNRvZvsUs3TtZ5c=;
 b=gfSroiFqeXRqQtTfAmNvPv4QzDxkUNfMfFluXnijj+gnSbYu3mHbvLjHtVQoDbQ1EutSb47p+AGyoIqVmiQPQwdOyRfCPs39Q7EqbxlE32XHlQW7N1jgt6H/DFPIqZqenRfBMytCVBYvzQtqT0LTosbO+I/CVkItfaFHYdorVDTr2ak/waFQG0JDoWlygrhZgCvd9PhN+Z7WgLJ7G2jqGZL31XT2Yxr4BzENV1Lq1LNsfzKjkX5T6yysTNYG7wEyMozdD+tW7UBZwHZPFz3Tvw5Y2rCnxCtgFeKYkoKYvBqqCqAm8KLbHHdFoGEtw0CYiOVJPGahoh43RupW5s8Hkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db9E0UhHHX0avoxIBa0aaEVVFiDQUNRvZvsUs3TtZ5c=;
 b=ZOVo+mtizaWKQaPNRxcnkH79oCjiS7GLLaKF2KxPBSvLAvkT4CPJGD5BUrd1Nd+xFfM1X1ymZkWlE3yD356CUJDCLHKHeli+bYtmFyT+QR0LzD8EBbxVUXpJV7jic2INNnGT/dl5pqpv1Z4fvs0rcDUN4lCSQ/Qs1eMTYdpfqh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d13547b3-15f4-4814-8bd5-1f5dfb96fc39@citrix.com>
Date: Wed, 26 Nov 2025 17:56:21 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86/amd: Fix race editing DE_CFG
To: Jan Beulich <jbeulich@suse.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-4-andrew.cooper3@citrix.com>
 <52fd793f-5bb1-4e14-a64c-b431b0ae83a6@suse.com>
 <f2101ed6-470c-4d6a-88dc-d2776010c346@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f2101ed6-470c-4d6a-88dc-d2776010c346@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0039.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::27)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 6545ebb8-0607-4bbc-9575-08de2d151d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDNwdkdpTFE0U2dmN3RlZWRuUnptSXpWd2pwdEFCak1mN0pGRHp6bWtHMUxT?=
 =?utf-8?B?QjRWR3NuTG1VdEwrN25TaThqQXlldmMzQzlRYnNycnFZK1NuOG84S3ZDcGRm?=
 =?utf-8?B?OE1yVmJGZWJJMU56SDg3bU5YbzA3V2ZwNEhDSjBjRnhNaE1xMWpOTW9NM2hO?=
 =?utf-8?B?d1cwaWY1YytRWmx1SGxjeVhGNXluaUhNYzJ6ZnI5UHBudGhhQnM3WWIwTnUz?=
 =?utf-8?B?NjYzS0JkbHV1M1FUbzUzb01HZGtyNUFaVmlTenRMWWVFc3VxUXMwdkpjZkJC?=
 =?utf-8?B?c3lIRHB2TXQxZlJFN1BCK0pZa1REVmZtMFlUZzhja0RwMG03MllEKzNFZTJM?=
 =?utf-8?B?cTc1SSt1S08vRTIrc1JMSi9yNjdza2o2dUFTTEg0NklTUDlqaFZXcXh3am9V?=
 =?utf-8?B?WVYwd05KczZGYzlJZzdITHl3YkMzSVRqK3ozaHd2Y2UxT2ZtWFpwL0laWCtQ?=
 =?utf-8?B?YmxHd0c1SHdmTEdEOTJjUHhZN0pjTE1KR3E3dG9pWGhTTFJjRFRzbWk1QUlu?=
 =?utf-8?B?U3Y3djRiMVZGaXE4YnAzeFdwdmMzcnRDS1hKNHdsT0RqQ0tOQzNZc1hoSFNk?=
 =?utf-8?B?S0FjRTR3R2xMTTRydTk4ZkNvZW9MNWtiYmMzMUlWbFJNQzh1Y21tN3JvZnF6?=
 =?utf-8?B?T3lmMVl2M2NxZHEyaUswejAwWDgwZk5ROEdiclBmdHcrQ0hmSG5mVG9Jbm85?=
 =?utf-8?B?TkhYdEJBT1A4MUdYbXNxcFllaFFBNkk1dmhaNHMvTVgybjBpbFd2TGNocHBR?=
 =?utf-8?B?S0dtbTZjQ3pkOHU5Y2lRYlBhMHI1TDlHNENWRmFaSXU5d1oyRXpqc1duZDNr?=
 =?utf-8?B?TzF2SUp2SDRpYlRoNHA0YmdKTDMzZTJ1UHNPMkJWeEFVb1U5UXJ3MjcveG1P?=
 =?utf-8?B?UEF1a3dhZ2V4bjNNWUQ1Mk1VRTdCeW9wbjR6Ly8va1d6d0pwc25QS2hVZmxp?=
 =?utf-8?B?dC9panRob0tyZ2JmenVwN3ltS3o2eEc0Y1IyVDJ6Uldoem5qNE9ScEhTL0sz?=
 =?utf-8?B?cFdoNHBLZEVvZFN5d0VtZlZBdTdJa09oYjdES0JtZjBHK3ErcnhIeU9TUFUz?=
 =?utf-8?B?NlhUaXpqalJlYXZYczVrby9rOWcrVUhGM3ZhaVNzcXB0SmRQTGgwbmVUWVR4?=
 =?utf-8?B?YjBHSEQvVFZuYVdtSDNvMitIWS9EL1J0b09xcHJRcWJXdWxpV2dDcjRLQ2Fs?=
 =?utf-8?B?T2hGN1pqZC9WNEx4YmxzeU5RcXhwVldQdzAwejJodHVBTlVPWXpwWUZjMmNx?=
 =?utf-8?B?RTc0OGdNdWtGVTJaYllISmM2QjZPZWRMa01xd3dIalk5VjhENWFLYkVRdVFK?=
 =?utf-8?B?RkduR1gyRlJGdTNQMXRkUGFLcVIzV2Zkd0QxQ291eHN3WE1QNTJjT0Nkd3R6?=
 =?utf-8?B?UFVIRHFLdzRpekh3UnVqZ0NQeXEzS2REOWovYnhIQm1nSXlYdDdjd1BoVSt6?=
 =?utf-8?B?b2lVbG1EQXJOazhPeTRnUERJSTV0MTg4QktDaU10czk2Y004M05pREFpd0N1?=
 =?utf-8?B?MjI0enA1OC9ROFBvZ0RMR0VZOUIyU21LM3dxNmVqd0J5QTF5ditPK1F4UGM1?=
 =?utf-8?B?SXB2WTFpNGtDc3kwang1UTN5cjE3UWYwenRweTk2MGhCTEhOWUhkOVY5TVNq?=
 =?utf-8?B?czI4dFg3MHkzNGZRNUczZFB2dWJxMkEwcnhZTFU4YlFHVW0wOHdrcThCOGZR?=
 =?utf-8?B?bVlVQXhtTmdoTVhZYThVVnUyY0hhQmZuL0FBSm1YejVIdXcxaTFybXdjcUQ0?=
 =?utf-8?B?d0Y2RnVKUlFYNUFjM0M4MVEwU1ROL05LODVoTjIzb25jYzN2M0RHZ3JCbmdI?=
 =?utf-8?B?aDRNa2svZEF0eTdkZGZOOTExak5TSTVzN1pOc1N1cWVRUnFzN3o4SnB2djl5?=
 =?utf-8?B?VVBrcVhuZ0lJdmlQZE5CS3NPbFpoZXFLaUlSN1A5Vjc4NXhYS1M4ZXYwZVRM?=
 =?utf-8?Q?SVUZXI9Gh4i+KpQYS6n3ty9VeEOfFUGV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXZVakVOdVB2M3liWnpQZkNodGljZkh1aFdpeWZIVCtVYUVCMWdYdFlrWmJF?=
 =?utf-8?B?T0hkc2IyU2w0Y0JWYUpjZFczMFRyZURxWXMwN2k0WGVtRiswWVczeGFueVFx?=
 =?utf-8?B?MW03WU1qQjlzb3oxTjFQbGtlM2pYQmwwclhtV285WWpEc2d4VG5UWUpnVS80?=
 =?utf-8?B?N0Rpa0xmY0EvVEx6WWxGM0RHSlg3VjhRUVdKVDNzZ1RvZDBYVjF3djRHTUx1?=
 =?utf-8?B?RnpIbVBWVFpYT0VncDRzMkNSbkZmTVQ5VUFURzY3aFJvVEl6YXNYQ2F3aTZK?=
 =?utf-8?B?MU44Tkh2akw3TVUwODNTWk1sRnEvNzlrejBjRE9Xd2dGWisxNXRBUy9jdzJ5?=
 =?utf-8?B?ME83T3VqM21hMzdxVXo0QTVRamtNM0paUE80UFpyYXVQYUVoVmxUY3A1TkJG?=
 =?utf-8?B?M0RNZlRzNWlrQzRtQXdNaUpiNDNQc21YWHZsVTE1RzczV0I3TWJVUXh4UVdu?=
 =?utf-8?B?SEFsbzUySDZxZHB3cnVLTnVobUxJbHNJUGJFUUNYNkZrQ3h4Y3B3VllTdHdT?=
 =?utf-8?B?Q2tjUWdodk9JaUp2UU5IbS9QbENwNHpyWHRwQUZ3cGx0Sk9MTjc2cDlHOHk4?=
 =?utf-8?B?WmU5YlphZFJRK0JXWW9UU3FlQ3FBaVl0eERtN3hjWlZXaUpyQ2o3cklTL0NG?=
 =?utf-8?B?UXEwZWN2RFNCV0hDN0RCTVU0ckREWmtxNG1Mb3BsV0tzSWE5alU5OGFTRGxx?=
 =?utf-8?B?cXpWaVhLSWY5UERzNVlrNlpuelNySHBmMUl4OEE0ZHY2QUJaTXo0dnVpNE9t?=
 =?utf-8?B?bHNIQlg5SHRURElVTkZqWHhRUTBkZXFYalQzTEtKeXpSUzdUVVJFQXRSODN1?=
 =?utf-8?B?VTFNSGJ3bEtjcmMwKzMwdk44YVFKdElaVjgzYlVHVjN0Y2IvSXBpdkp5OFhS?=
 =?utf-8?B?R3ZhNmVmQ29vbWUxN0dVNUhPdkRaOE94aGJ0REdMd1FxRFZaQkVhUHlORERF?=
 =?utf-8?B?TDlnRkxNd0w3M1hWZzMyUnNnaWNHM1d5ZDRwRkNpRDNPZWh1QkRCUWN6Uytm?=
 =?utf-8?B?MnFhSHI1ZFJ3WEcyWTU1REUzQVdSWW82SDVXMEdrY2hVdWF5Y2I3RFF2dG5H?=
 =?utf-8?B?QXBKRkc1S2VobUpKdHhTYTBJUmt3K0FqV2t0b1VhNHZlRlFMckV6R2FPUEtx?=
 =?utf-8?B?WERmU0ZLdjd5czJ3aytwek9XZXBkMkJ2TVRXbHlNckpQODVrSjgyM3JoYnQy?=
 =?utf-8?B?eStLc0c0NWFlZC90WTBTVlpjNTZnNmdBc2QvYzRqWU1UUklESlF3SnRZV3Jq?=
 =?utf-8?B?M1RDdFBvYlJMUVgyMG1aeVBiNTI1WlpqZDVVV3MvTlZkSnduaDEwc3h6ODNx?=
 =?utf-8?B?Q2daQ3NpTmpwempqSlBsckhJQVJiMjZLeTgrZ1V2enFLWk1DTlBrZXFKUHNa?=
 =?utf-8?B?ZldrOVFUQnI1SnNqYVA5Qmt0OTNJQ1VkVVBNeVFTd3MyM0szM3pEN0k5Z0tI?=
 =?utf-8?B?WkwvOXZYK1Nydng3MTc2T2tTSVNMdE5hZ0xZYW9zcHlvWnBhZFNBeXovdG5C?=
 =?utf-8?B?UEZocEZUbXBGalN3OFMyQmNHbzhoaFV4K1U4cXQ1amF6S1hJdWJHTC9EZ2Y3?=
 =?utf-8?B?b05yN010Y3FWOVo0WGJUZk5wQTNDRHR1TWRGdHFWN3ZReVN2SVpTVXBrVHp2?=
 =?utf-8?B?R2NzekhBYitJRTRYNHVPM0g3dHU5d05KM21uOEVvWjZSREpvN3h0TkNhK3Jn?=
 =?utf-8?B?Z1gvZ25jZ2ZzN1M1cEFJMkNRSDd5MkhNTzM4T0FZLzhrTVNYVG1pVjNSMXA4?=
 =?utf-8?B?VFFZV0xpdnNnODBmYTVlR1NlcGdSWGptS0lTbEpWTyt0QTlkWWVETFQycWNK?=
 =?utf-8?B?QUYrS0hEWmNJQ3RiWHNpdjA5bXI0UGV4bDFSRWdadFBEd2Nsb0JscUpBNGxw?=
 =?utf-8?B?REY5bklsMzZmc3dSK1I4MnZmZHRzb2lyQWRkZzU2bjVlamtOVm1RZjZnMkJ4?=
 =?utf-8?B?RDRjNmpVMEFuZEt4cUowNnlKL3Z6Sk9uSmwyU05GanMvYmE4RTh2U2NsRDFU?=
 =?utf-8?B?bEx0TmREMHZTY3pyQmNCL3hDVFNKNSs3M1dvL2RqelFBRllaQXlvamRXNVJV?=
 =?utf-8?B?aXptSGJidTJodVVwVjV1c0ZsSXpxckdLZGYxTmYydmNIU0NpZmN0SFVYWHFX?=
 =?utf-8?B?VkN0cEorYmdOV012NHludG9JNnNGVGJOQU04MjdHV3VwS1NFSmVpZk9QQmg0?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6545ebb8-0607-4bbc-9575-08de2d151d40
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 17:56:24.2726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/gOabhcRYJdm8WZTUAM/0KMC1KbHo1lQFzyjYgiAGBSnvlukIQirYX42Wi7sr/8sPxx981HM0U427GkH9UKZrjQnqdbdL/88OFkYjEk44Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7282

On 26/11/2025 4:55 pm, Andrew Cooper wrote:
> On 26/11/2025 3:07 pm, Jan Beulich wrote:
>> On 26.11.2025 14:22, Andrew Cooper wrote:
>>> @@ -1075,6 +966,112 @@ static void cf_check fam17_disable_c6(void *arg)
>>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>>>  }
>>>  
>>> +static bool zenbleed_use_chickenbit(void)
>>> +{
>>> +    unsigned int curr_rev;
>>> +    uint8_t fixed_rev;
>>> +
>>> +    /*
>>> +     * If we're virtualised, we can't do family/model checks safely, and
>>> +     * we likely wouldn't have access to DE_CFG even if we could see a
>>> +     * microcode revision.
>>> +     *
>>> +     * A hypervisor may hide AVX as a stopgap mitigation.  We're not in a
>>> +     * position to care either way.  An admin doesn't want to be disabling
>>> +     * AVX as a mitigation on any build of Xen with this logic present.
>>> +     */
>>> +    if ( cpu_has_hypervisor || boot_cpu_data.family != 0x17 )
>>> +        return false;
>>> +
>>> +    curr_rev = this_cpu(cpu_sig).rev;
>>> +    switch ( curr_rev >> 8 )
>>> +    {
>>> +    case 0x083010: fixed_rev = 0x7a; break;
>>> +    case 0x086001: fixed_rev = 0x0b; break;
>>> +    case 0x086081: fixed_rev = 0x05; break;
>>> +    case 0x087010: fixed_rev = 0x32; break;
>>> +    case 0x08a000: fixed_rev = 0x08; break;
>>> +    default:
>>> +        /*
>>> +         * With the Fam17h check above, most parts getting here are Zen1.
>>> +         * They're not affected.  Assume Zen2 ones making it here are affected
>>> +         * regardless of microcode version.
>>> +         */
>>> +        return is_zen2_uarch();
>>> +    }
>>> +
>>> +    return (uint8_t)curr_rev >= fixed_rev;
>>> +}
>>> +
>>> +void amd_init_de_cfg(const struct cpuinfo_x86 *c)
>>> +{
>>> +    uint64_t val, new = 0;
>>> +
>>> +    /* The MSR doesn't exist on Fam 0xf/0x11. */
>>> +    if ( c->family != 0xf && c->family != 0x11 )
>>> +        return;
>> Comment and code don't match. Did you mean
>>
>>     if ( c->family == 0xf || c->family == 0x11 )
>>         return;
>>
>> (along the lines of what you have in amd_init_lfence_dispatch())?
> Oh - that was a last minute refactor which I didn't do quite correctly. 
> Yes, it should match amd_init_lfence_dispatch().
>
>>> +    /*
>>> +     * On Zen3 (Fam 0x19) and later CPUs, LFENCE is unconditionally dispatch
>>> +     * serialising, and is enumerated in CPUID.  Hypervisors may also
>>> +     * enumerate it when the setting is in place and MSR_AMD64_DE_CFG isn't
>>> +     * available.
>>> +     */
>>> +    if ( !test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
>>> +        new |= AMD64_DE_CFG_LFENCE_SERIALISE;
>>> +
>>> +    /*
>>> +     * If vulnerable to Zenbleed and not mitigated in microcode, use the
>>> +     * bigger hammer.
>>> +     */
>>> +    if ( zenbleed_use_chickenbit() )
>>> +        new |= (1 << 9);
>>> +
>>> +    if ( !new )
>>> +        return;
>>> +
>>> +    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) ||
>>> +         (val & new) == new )
>>> +        return;
>>> +
>>> +    /*
>>> +     * DE_CFG is a Core-scoped MSR, and this write is racy.  However, both
>>> +     * threads calculate the new value from state which expected to be
>>> +     * consistent across CPUs and unrelated to the old value, so the result
>>> +     * should be consistent.
>>> +     */
>>> +    wrmsr_safe(MSR_AMD64_DE_CFG, val | new);
>> Either of the bits may be the cause of #GP. In that case we wouldn't set the
>> other bit, even if it may be possible to set it.
> This MSR does not #GP on real hardware.
>
> Also, both of these bits come from instructions AMD have provided,
> saying "set $X in case $Y", which we have honoured as part of the
> conditions for setting up new, which I consider to be a reasonable
> guarantee that no #GP will ensue.
>
> This wrmsr_safe() is covering the virt case, because older Xen and
> Byhive used to disallow writes to it, and OpenBSD would explode as a
> consequence.  Xen's fix was 4175fd3ccd17.
>
> I toyed with the idea of having a tristate de_cfg_writeable, but that
> got very ugly very quickly
>
> The other option would be to ignore DE_CFG entirely under virt.  That's
> what we do for BP_CFG already, and no hypervisor is going to really let
> us have access to it, and it would downgrade to non-safe variants.

In fact, ignoring the virt case for DE_CFG makes this generally nicer.

~Andrew

