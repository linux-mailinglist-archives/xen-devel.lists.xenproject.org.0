Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D306ACA9874
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 23:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179553.1503021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vReU1-0000x1-4X; Fri, 05 Dec 2025 22:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179553.1503021; Fri, 05 Dec 2025 22:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vReU1-0000vB-0X; Fri, 05 Dec 2025 22:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1179553;
 Fri, 05 Dec 2025 22:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vReTy-0000v3-Vf
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 22:40:59 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7735e541-d22b-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 23:40:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8389.namprd03.prod.outlook.com (2603:10b6:408:367::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 22:40:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 22:40:55 +0000
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
X-Inumbo-ID: 7735e541-d22b-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSSoAUMdOk23kGc0zGGyLv+B2OyncO0hJ9XzxO8SW1JQKO7Zm4qJZV2QRqGxilrMUVZquhx6FkG8C8QBcieJDvi89vUOhNbxMOSZk+FXmCOB/AVHru1zQace49lBofYaaAXvSyaRSzpHzCdHXdh36TR/BHrEWyUUQcP1yKOffrsUxmuvRMvt4ps5AyV7MSXRo9pB6Iz23XOZ7jmYH1NEeaBj7HDQgNBEM31yOxvHkEuYVSMLqsuTE7VrCCNuSHylCXYzTej/Fn7FYM1f0o5yHvRUuY1Mn44Sv21T3Dqw2VWgJ9DNBHQegHMr8Egumn4l0me3q8UsSTtd6rcDLj6u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZ6uq6GbfqE6EGq8dAff81b0Aa9e/5u9BEovV8qNXcI=;
 b=uphkXNiP90QFUOFYV8HzkMilB6pjcaaQ3kk2Kl7A++WHcnA254Vt1dio/2YMaSwGTWwDpG7M591eXXUlDj5Iil5tko7xVte4fQWgAipb1MU7oq0hIAZeU4zDkCayZU3kKGAP5GzYJ4vaocOcCCrqciNvlLG2372zmQd7mlFREnHdfeN/7l4luM+zDzvpH4CSZoR/z/2SjPEQroYRhy4nVF9VN6esLNHIuw2P88XYLnN2W6f5xzBrgBqGuwe/fpbnMK3uDY5piiiHYTdPjIcYzWYv8bsTHsZrwWMP56GupLgdcLnQnUDx/uL25MlBASechsmNCKDWIlnlrrYTzizCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ6uq6GbfqE6EGq8dAff81b0Aa9e/5u9BEovV8qNXcI=;
 b=fWx2wsyRFBgXtYoS1PjP17wbRTKUL52S1eWWk3rNRMUdnJyfaKZxmnedYCfJAXU17sbgjgZqE+K66rgnBQ4tcpzRwyQi4QwkVQ/cGtjFWqo+PtTKfErtork0fNKSyIW8C9NGiEVVyP9pvT1iLyyDLc2ZilBKOBYlsEwGzgM/uCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8dce8443-5a97-42c4-b867-27b83415b3d1@citrix.com>
Date: Fri, 5 Dec 2025 22:40:51 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20251205222813.277164-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251205222813.277164-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 75bd134c-36fc-467e-03e1-08de344f59f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1NDL0QxSVo4ZjErWFJyNmQ0UEJlK2o0QU1rTTAzd2ExS0RrLy9mRXlUNStY?=
 =?utf-8?B?d05ZZk9VZ29wNUFoUStMN3lYZkRud1pSWUQyV3NpSmlaWmltanlRVldJam1z?=
 =?utf-8?B?V3UrUG1tVERpbzdnNG9TVStSRm50UW9yTGVNdllqSDVGQ1d1ajhHd3ZJZStu?=
 =?utf-8?B?ZWJsTUdieURzWEdwRFBxT1c4NTBKM2FhWnZyZ1d3OFdQT1hlemgyR24yWXha?=
 =?utf-8?B?K1JsWDVZdjVoYS9nK3ZlL2Q0S08yeWVBRW1uSWpFSVprQjJFeWtLOG0zUDhs?=
 =?utf-8?B?MEZKL3pXTVZmVnlBVkZXVGIwZkJHZHI3c3lwbWhWSnBKZWVtUzFVREV4WnFF?=
 =?utf-8?B?eks1N2JZN244WUtST21pSWlocDRibUJsUURVckt0cUFxWWR2OFo2SHNZbDA1?=
 =?utf-8?B?cnBnWjlyaXJ6UktXc1VqRmF2b1VJVGIzeTdoMmxCNzYvdU9iZ292eW1NZUpw?=
 =?utf-8?B?dXRzcW5wUkxyTGd3L3cvS2FOU3lqZHJrMDFTNXJTWXZTNVQ5NjNISEE3K0pY?=
 =?utf-8?B?MVlSTEEza01WTjV1YlA3QkprUElkWkZDemdQYUVlcmprWTZHdDNkWkIxRGQ5?=
 =?utf-8?B?VnYyRml2RC9hTE1ndTJTSzBGQVNvcnJwNitUNG1qOGoyQ2twaENzVDYwWWNN?=
 =?utf-8?B?VFlwWXppMUdQWlM1ZXNlTmhFd2NIbkR5cnBNK1pyQmhCbXBuVGJBWHF1dm0w?=
 =?utf-8?B?Tkw2bkZrL0RROGN6Ry9SSHNtbldPR3luYXpkUlNEU0FtbS9IZ0ZsR1Q4aDAx?=
 =?utf-8?B?dnlmTlgvTWtwUUswNnpjeExUWHJ4akp1MzVMME9lMUh5ZXRzcEtuZnlMb001?=
 =?utf-8?B?WG1JQkpWNVF4YXltOU45OEw5ZVZlS00xTFNYdXlnWU5LVks2c3hFaDQxRTVQ?=
 =?utf-8?B?emx0R2RLSXoxZ1pRaFVmd2JNbXJWTUFtcWpYMjVNZXQrNUIvNjF6VHlXaTY5?=
 =?utf-8?B?S3RaRlpuU2NRSjk5a1hUMlo2VDJMSk9acWh5YkdPLy9xY1krVXlXMzk1dmIv?=
 =?utf-8?B?WjlZOFR3MUJyTFkzVHZQNlRMcGxTVHhBK1M2a292dDlEc3pUcTUxRW1oUXZy?=
 =?utf-8?B?TTFvZmpMZ2lVM3p5TDdsbWlUWjZSd0x1ODhmY2F1OVRHMFNNNmMzckVRVjJZ?=
 =?utf-8?B?eFlJOWV5YVhzYU0zblp0aDNGaGZxVVFkR3Jpek9CNUIzWmZZbDFGRGJwMFVw?=
 =?utf-8?B?dDFma0tqZWNhOTFpTkhKaTZkcjZmY3E4SHlJSkllL29OcFpXVURSZjNvYnpw?=
 =?utf-8?B?T2ZER1pZQnBydDhJL0dyQnc5MTlYN0FHSUlndkVlRUpsN0hjRXJwdzc5OEZP?=
 =?utf-8?B?TllJeGsrUDJjMWgrVlZJV3VyY0x1UXdRK0xQbUczRjkwRGY5dGZ4QUJoL295?=
 =?utf-8?B?RHZabWVCaS9qL1dSaVFoVWxNQkJ5OHExbVowVUhSWHNrcGN2eHpKeXpmV0dl?=
 =?utf-8?B?MStvU0J5eWJlK21mOGllM0xOZGRvMUM2V1dXMWtlNlBkWUhFRC92M0ZnckUv?=
 =?utf-8?B?R0hiN3BlZzZUNGZoYVBRZko5MzNXZjFnV0N3ckNGNjVlOGduY2xwWU1HV3Y5?=
 =?utf-8?B?dGRsektZQkhYZFVnY2lQTFFjRnNHUkc3R3N6WTRIamxzeG5XWnNTV1k0RHlB?=
 =?utf-8?B?OVEwSFZ1OEVOb0c0NWpNUXBuMVFyZFp1Zmh4MkZUazFPY2pWNEZ1Ym9YYTJ1?=
 =?utf-8?B?VG5TQXNEOTgrRWF0T0dqNzFDd0xPT2Y5dE94M29vSVhHWi9WaHE3MFZoNGQ3?=
 =?utf-8?B?Rm5RYlN1ckdBMWwzN3NpWU53RDNoSk9qa01vK2g5NVRoc1BjY2lHK0l0ZTBj?=
 =?utf-8?B?d1UvNDNwRFYzUXBSdEE3RkUyNlgwcHlpaWpicy95OEpQQUFCcW1XVVBDUHpP?=
 =?utf-8?B?Q1lLeHhmVks2ZEpGcDAwaGRUeVhac3BRdTZJRlBpREJudzRRelEwb1pJWEJK?=
 =?utf-8?Q?rryO9EfV9Cqx5SsEfSZtjje6fJjfSPs7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkNiZGhuWEV5RXpYZHozMlpJczRYMVZGd3V3N0NiaWUxUWtqaGJyM2REMlZ1?=
 =?utf-8?B?dkVYdXpzYVVSRkJEZGVvTmxVQlRzYmRsQWlDeWZFWVhnQnZvNUZtS3dqM2Fh?=
 =?utf-8?B?Q1phRUNIalI3MVlFZ2h4N1ZpaTU1dXBsZkd1ZmcvUHpvY2k4WnpldStvaTc1?=
 =?utf-8?B?azVKWTF1bkJxMXprM1lwNGwycVQ0VVA0RkE2NWxRQ0Z1VHNHdEJJV1lUQlNK?=
 =?utf-8?B?dWV6OGpNWlFnUGQ0N044SUNncExaKytBMlQyV2hPY0YxR0tNWnFmb1haL1ds?=
 =?utf-8?B?V0JlcWRrMzIwZkIrS3hWRWd4b1hEOHZSUHlWMVF6b2N1bXpEdnhBcUx5bXU0?=
 =?utf-8?B?WERrMDVOUXlWYkRiTzliRTI0eFZGVm03NWlReTFXVEdzSldKeGJSdmdFZnlw?=
 =?utf-8?B?OUp5N0pWYU1FREhvamh2NzFvOEhXZ2xNLytxdFJLQmROT0FVdWtTcjgwRDBR?=
 =?utf-8?B?L0o4R0NKVkJBS3BSNVVwNTljUWlkS0c0ejl0OVBwMlU3bEF4ZnZpaGFiQldp?=
 =?utf-8?B?T0RYTVRrQXZtQzJmV3ZTS2dTdzhmbC9oRDgrYWhhdFJ6c1RZSmpFalBYejdG?=
 =?utf-8?B?alZOZWoxUEwvdFM2YnZpaENuZndMemZKeVJPWjZJM0NHeU16dk1VWTdndm1n?=
 =?utf-8?B?ZWg3bUtXWHV5SXdoVDJQOUIxSW5EcFlHNGU2K2t2Wld1cElseTVmcnZreTdk?=
 =?utf-8?B?MkFSOStBbTVERU1vQXFZRlB0dmV4QzNTRlJMT3d1d3pCSHlWMEZFWTkyV29z?=
 =?utf-8?B?Q1RBM1BOY2k5Um5wTndCV09RWElBWmZiMG10bHBsK25NU2xtLzM5TWRLZGI1?=
 =?utf-8?B?YzRnWGxuUDI3aUxRRFcyaHNCN2NYcnZuSUVqTVVQK0tRVEFzRktXOW1sMERN?=
 =?utf-8?B?Q2Q3TkZGdmFoK3hoMnpia1N4VEFiNVI3R3RGdCtUclUzdXdYUFNDWWs5d2dq?=
 =?utf-8?B?aXdZZUhNWW9HVDRtT0Q5N3lGeGJ4a0E0bmtwVjFTcS9pYXRNMXlaNHVMYTMz?=
 =?utf-8?B?UmVtcS9vV1J4RXducjFwV2gwZ21DYmdOeHBtOVd0SzZDaFd2U2QxZzlGZ1Iw?=
 =?utf-8?B?eDkxMlo5dUliQlQ5Tkx1alJEWGwyd0prTklLMkFoeFRWMVlnMjd4UXA1Rktz?=
 =?utf-8?B?RWc3Tk9pb2MrRVUwWi9VdkVPZG5hM2M4VThCdHBzK3F0ZFhacFhwMlhTQmpx?=
 =?utf-8?B?V1RrRktPUG5CTWNuRTlPNERVOUZjSThOeGhzZzcwdkY0OWVlNDdENXQ0VHBU?=
 =?utf-8?B?b2VTZnBXL0dLZStrcEs2NUk2UGVjdGk5OTlpdFRrUTFIOWZTdXZkYjhudGUy?=
 =?utf-8?B?QmhsNFRIeUZZdFltcjk0K1EwL0lCSGlCV2R4R0NhSTcrd1FrS2o1YWYwaGlj?=
 =?utf-8?B?cDJ5Tm8xcHZSa0VWeUo1bDI0RjgwcXpYUktaYTdyMkEvU0F5bENESGJIZ2dZ?=
 =?utf-8?B?aGZjWTlDZ0R6VGJtYUtpRzA5anVlNldlS0RackJ1aDVycjVJUkcreU1kY0k1?=
 =?utf-8?B?T1V6U05XRmRVdWxQREhUMGVTUE5TQ0tRNnp5ZUdXSk9EVWxJaWMzcXBoVTB4?=
 =?utf-8?B?WXlsRWhnM1pzcDB2SGM5blZiNW5TL1QvV3lnN01DbmVrK3Q0QXo3UUt3bmov?=
 =?utf-8?B?Q3RLWmtBL1h6L05xTnhrUXhReHQ1Vkx0S2tPMGw2MTdBVk9ib08yWjVlWmxr?=
 =?utf-8?B?WHByTklHbmhjb3J6Z056R2pTWkZxdkpLRmFNc1lrUFVuRzNWZCt3Uks3eG54?=
 =?utf-8?B?aFJReXFEdmUzSlZnNU1KR3pweDhWU0JaMmlkSlY1b05kZUxSVm9IdTdqZWJ6?=
 =?utf-8?B?MGwwaTVYaU5STElMSm90U00rMW9VVHdDQlQ3VGZPTkZ3UTZTd0NBRitzRUFt?=
 =?utf-8?B?MVhibGgvMjJFdVFaaEx5RXdjWVl3UWNXV2JkczJmVW5lZmxmWkR6RnNqRXBv?=
 =?utf-8?B?dWRGdjhhNXJKY1dQVkI3czZSRElkWFlvbmt0OWhMRVIwQUVPOEFhUjgwWmFK?=
 =?utf-8?B?RzIzcjd5cDNrZHJnSzhMNGRvUzJsY2xPRGx6anE3aDI1d2ptaTVGMEtFUmNx?=
 =?utf-8?B?ejZySUJxYnJsN2hsdHBOTnQxNFFUYVBvU0oxMU05YXM4eUVJSUh1VmxkUHlN?=
 =?utf-8?B?UFA2VHBWSjlsektqazFLYTVuT2l0RlNseXVFdEMwb0h6cWlKTHBzOXZ2NkFS?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bd134c-36fc-467e-03e1-08de344f59f8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 22:40:55.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3L73KHyGaLp/tkWbcnnQjDUYZ2tNfs72RFeYmyzDZRPIfuTxWee0zxb59xsBwNbhI8LmG+o0Boqf5nb/Ef1Q/4kwcImfInSAaUlIK7J6Jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8389

On 05/12/2025 10:28 pm, Jason Andryuk wrote:
> When linking to create xen-syms, add --gc-sections to garbage collect
> unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS
>
> We need to add KEEP() to the linker script in assorted places to retain
> appropriate data - especially the arrays created therein.
>
> Something is off though.  In a test where memory_add() is unreachable,
> it is still included.  I'm not sure, but I am wondering if it's the
> alternatives somehow keeping a reference to it.

Yes, .altinstructions contains relocations against the origin patch
site, which will cause it to appear to be referenced. The same will be
happening with a bunch of other sections.

Hmm.  We are surely not the first people to encounter this.

> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> With --print-gc-sections on defconfig:
> ld: removing unused section '.text.__bitmap_full' in file 'prelink.o'
> ld: removing unused section '.text.__bitmap_xor' in file 'prelink.o'
> ld: removing unused section '.text.__bitmap_set' in file 'prelink.o'
> ld: removing unused section '.text.__bitmap_clear' in file 'prelink.o'
> ld: removing unused section '.text.bitmap_find_free_region' in file 'prelink.o'
> ld: removing unused section '.text.bitmap_release_region' in file 'prelink.o'
> ld: removing unused section '.text.domain_has_ioreq_server' in file 'prelink.o'
> ld: removing unused section '.text.compat_kexec_op' in file 'prelink.o'
> ld: removing unused section '.text.in_atomic' in file 'prelink.o'
> ld: removing unused section '.text.radix_tree_next_hole' in file 'prelink.o'
> ld: removing unused section '.text.radix_tree_prev_hole' in file 'prelink.o'
> ld: removing unused section '.text.radix_tree_gang_lookup_slot' in file 'prelink.o'
> ld: removing unused section '.text._nrspin_trylock' in file 'prelink.o'
> ld: removing unused section '.text.xen_compile_host' in file 'prelink.o'
> ld: removing unused section '.text.vscnprintf' in file 'prelink.o'
> ld: removing unused section '.text.wake_up_one' in file 'prelink.o'
> ld: removing unused section '.text.xmem_pool_get_used_size' in file 'prelink.o'
> ld: removing unused section '.text.xmem_pool_get_total_size' in file 'prelink.o'
> ld: removing unused section '.text.xmem_pool_maxalloc' in file 'prelink.o'
> ld: removing unused section '.text.xlat_start_info' in file 'prelink.o'
> ld: removing unused section '.text.elf_sym_by_name' in file 'prelink.o'
> ld: removing unused section '.text.elf_sym_by_index' in file 'prelink.o'
> ld: removing unused section '.text.elf_get_ptr' in file 'prelink.o'
> ld: removing unused section '.text.elf_lookup_addr' in file 'prelink.o'
> ld: removing unused section '.text.serial_vuart_info' in file 'prelink.o'
> ld: removing unused section '.text.pci_find_next_cap' in file 'prelink.o'
> ld: removing unused section '.text.free_hvm_irq_dpci' in file 'prelink.o'
> ld: removing unused section '.text.mce_barrier_init' in file 'prelink.o'
> ld: removing unused section '.text.mce_barrier_dec' in file 'prelink.o'
> ld: removing unused section '.text.mce_barrier' in file 'prelink.o'
> ld: removing unused section '.text.apei_read_mce' in file 'prelink.o'
> ld: removing unused section '.text.apei_check_mce' in file 'prelink.o'
> ld: removing unused section '.text.apei_clear_mce' in file 'prelink.o'
> ld: removing unused section '.text.efi_halt_system' in file 'prelink.o'
> ld: removing unused section '.text.get_vvmcs_virtual_safe' in file 'prelink.o'
> ld: removing unused section '.text.get_vvmcs_real_safe' in file 'prelink.o'
> ld: removing unused section '.text.set_vvmcs_real' in file 'prelink.o'
> ld: removing unused section '.text.set_vvmcs_virtual_safe' in file 'prelink.o'
> ld: removing unused section '.text.set_vvmcs_real_safe' in file 'prelink.o'
> ld: removing unused section '.text.domain_set_alloc_bitsize' in file 'prelink.o'
> ld: removing unused section '.text.watchdog_enabled' in file 'prelink.o'
> ld: removing unused section '.text.unset_nmi_callback' in file 'prelink.o'
> ld: removing unused section '.text.sha2_256_init' in file 'prelink.o'
> ld: removing unused section '.text.xxh64_copy_state' in file 'prelink.o'
> ld: removing unused section '.text.xxh64' in file 'prelink.o'
> ld: removing unused section '.discard' in file 'prelink.o'
> ld: removing unused section '.rodata.xen_compile_host.str1.1' in file 'prelink.o'
> ld: removing unused section '.rodata.elf_lookup_addr.str1.1' in file 'prelink.o'
> ld: removing unused section '.rodata.apei_read_mce.str1.8' in file 'prelink.o'
> ld: removing unused section '.rodata.efi_halt_system.str1.8' in file 'prelink.o'
> ld: removing unused section '.rodata.play_dead.str1.1' in file 'prelink.o'
> ld: removing unused section '.data.rel.ro.local.fetch_type_names' in file 'prelink.o'

This is for your safety stripped-down build, I'm guessing?

It's certainly a good start.

> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 527872a6db..e3ad58f688 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -98,7 +98,7 @@ SECTIONS
>  #endif
>         *(.text.__x86_indirect_thunk_*)
>  
> -       *(.fixup)
> +       KEEP(*(.fixup))

Why do we need to KEEP() this?  The references here are the other way
around to most examples.

Although I note that removing .fixup is on the cleanup list, and would
this problem too.

~Andrew

