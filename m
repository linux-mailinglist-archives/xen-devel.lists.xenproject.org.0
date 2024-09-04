Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6796BBF9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790179.1199872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp1S-0003g2-6b; Wed, 04 Sep 2024 12:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790179.1199872; Wed, 04 Sep 2024 12:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp1S-0003eB-3E; Wed, 04 Sep 2024 12:22:06 +0000
Received: by outflank-mailman (input) for mailman id 790179;
 Wed, 04 Sep 2024 12:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+1Lj=QC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1slp1Q-0003e5-HL
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:22:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2412::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48199b3d-6ab8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 14:22:00 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 4 Sep
 2024 12:21:56 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 12:21:55 +0000
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
X-Inumbo-ID: 48199b3d-6ab8-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVfVVu8SnAefEth8a0LBRlal0QU46hLCzfdXUnr7D+XR4aO/JJIwaPPxyZLjd3L1Y5pYuG1k9qGPmvp5yUf4GtynEo8EBtaV2AqXNWTtt7xqfT9up2sYbL868IrRxBuk/nOWulrWb/1F5Tv5A5MXzuq8bLGQrqp9e+Qnw2ikrcW0pF/o03BtoI1WdS9mHmmf8zdwB9fF2PdqYDHhTRPLyBgTZIM5Lj6sM8fjbeHXX6bNyHuQfyCX/k1nQn4TyaeMTxgPghOvCXBWw0F+uSYblfy2ofmbiPQO8xsXj8AzunKpf/aXkZ3OAPBuj4JxAhJtuACXS5uQleO30uaCwHIKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0BF8IkUGdY7VXF13/P7x+ou8TlmrhLswo3hwvoZCvQ=;
 b=jKyzNwY4cROzy/yra0asY5MTTAJITRBXd1ZDOT4N/J+7luYCoZzDpTdCfrRq0T5ck55I+7sq6zKiefE9fbCGepE78+tQxmj606sshwx6Q4nIMfEJGeMVbTuZr2ZQL02uusq3CuDp90dWojnjcQTcisQVVsCSENfzGQFJmUNupgjkNlnrFX2Y04Dby/wIkgdvSixMccDugS4OxGUHDdGwSWEkrsk1BousznA2qnQhC4eFnxs4ZfjsmJ67gMck9PWs1oAaLCOXWhDZ6kT1J3YEgVetJdkueSKkJSpWn5EJCY9oLN0dyfdSLR0KOhQp6GOIysdTfYir7/FaT66tZAqutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0BF8IkUGdY7VXF13/P7x+ou8TlmrhLswo3hwvoZCvQ=;
 b=T2ivTAM83vHyirIRS4HH43TxtxMC2ZHM7RBdOmN3IA267hPzG8uLdR6mAyOf/7snPI4PrBXVJzEA2f+JkfXeyFVPxGJ+Adh5CEJBTxV6UeCIzhxKY5jXfKqVOlBYuTzN8P987UBjFHxy7fIKakCv3v26mPtXid0Kq45CX5ck1II=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
Date: Wed, 4 Sep 2024 13:21:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
 <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0197.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::22) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: c5271ffb-82cc-4b86-4a4c-08dcccdc2a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rlp2V3k3SklUNTl1Mm5YMjNDalFiK0lsYlNLaXVmMHVkVXJSVlJ3Syt2Rjdo?=
 =?utf-8?B?T2lwT2tmaXFuYWNSRytXNkw4QlRvejI2RnViVWY4YkxmMC9VSFdoYnEyT3k1?=
 =?utf-8?B?bWpHM1BnLzBSWW11R2xTQXAzOGJRUVVEOTRISkMwTDhWdjFyZzZpejBhdFZP?=
 =?utf-8?B?dGFheGV1SzFaeFBTdExnaUZ6MzVHeFJLTjVWUVdTVnE2bkd1YzFzZ2VJT0g4?=
 =?utf-8?B?b2hLMi9hUTVNOXlUWGVXUlFBYUgvQzc3aUhqY2I5eFI2UXlmc2puZVR4c09Z?=
 =?utf-8?B?Nit4R1JxWmg4Wk5VVGlnNVJYU2phZFRCNVB1cERrVHp1UjZuOVJQSEQ2bzJr?=
 =?utf-8?B?M2lQd3g3LzJYMjF4UEdTbk15NUM4aThEMmVjdElHeURBMFVjUzhUeUFKdEdS?=
 =?utf-8?B?ck9BbjVXMG9Ucno5Wk5qSmIzSVhxNGRHOXozd3BBYnBhTGYrWDZqZXh5V01G?=
 =?utf-8?B?bG1sWDZIdXdoUkdjSmF4TFZNVi9FcVpVT1BZbmI4eXRIaCtDMHAzREozUWQw?=
 =?utf-8?B?SlZjVCtrZ3NtOENFVStZTnJzb2U1VGNGZ0ZwTzJ4c2ZQSnFuZG9MNzhINnZP?=
 =?utf-8?B?TzRTeTlkZTFocGswTmNDeTB4a1loWVJpYVN2NVN1TDBDcnQ1L2pQdnFxSW5y?=
 =?utf-8?B?VSsxRERUejB1RVlCM2lXeW5SOGc3eHpxM09wOEZuZk5IRW9ENzVnR1B5TXBw?=
 =?utf-8?B?NzdKQXB5eVNucjNNRGswbEEzOUx5YkZoU1Rjem1JNWdaSHNoMXpMb0k2TkM3?=
 =?utf-8?B?OFlvUjh6aFZzK1lsV2VaS09FRk01R0ZqSS9VRkVVbWFUNWtBOHFGWVJOUTdo?=
 =?utf-8?B?eExtTzcwRDJDY2I1c2hSNFM2UUN1SmxuMCsxSUJDT29naXVTQlFydlJhVWRx?=
 =?utf-8?B?cVZiQjhmd0pYeDNOemxLekx2VzNNUWQwYkV6VzcrajRqc0dxanhPcFNrL3BE?=
 =?utf-8?B?TXdVOE56eEFEN3dtSCtDK3JRY2xJUWpoa1laOHRiOWY1d0hZWGlSZ05SejJB?=
 =?utf-8?B?d05QN2QzaHR0cDhnbXZNaGwrQlhhM01IbzhoTjZZS1ZoSkVMSG1HaFhaWXlH?=
 =?utf-8?B?MmVTaFc2YkJlNndmOG1WTGorRjZiZlZXeEIyWk90aEZkTVVpVEgzS2tBdjZY?=
 =?utf-8?B?UEpIQ1BsMmVpbGRhQy8xUTFyQ0c0b1p0UGN3RWZ1Q1o1QjNhRWVRMGFjeEtP?=
 =?utf-8?B?ZTZYQzViMzgxSGpHS0dsRlFCOHVRN3pmOEFQa0ZSc0l3Q0x0SW4wNTh3YVNH?=
 =?utf-8?B?SEQveTMzMTRTc2dyWUtZV3RrRnNUSksyRmZYQmV3VDFiNkxIN1dKemtDSnF0?=
 =?utf-8?B?MnFueUh0VCtZUHRHYmQ4NE9QNnZzdytXZzdaeHRKVnFrb1VobVQ5ODJYZ29S?=
 =?utf-8?B?U0FWbFFvNzlHZkcwWm1UUU8yOWM3Q0xyQ1RYbkIzY0w5WVNHUTVkMjhkOG1K?=
 =?utf-8?B?S2J4eklvbktlR2F4OEgwTlM0elRFbXQrWWx2UmRNUGVKakQ3RkIzVWtUK1Ri?=
 =?utf-8?B?UHN0dDZjYUswTUVEYkl3czBITDdzOXdrSmVadmhxM1R6R3RzcUdiSnpDOXJX?=
 =?utf-8?B?cDBreFo4M2VUajJLbzVEUkkyUXlydUJuL2h6VzBIOWV5QnRnSmNhdlluWTNn?=
 =?utf-8?B?elpmVldXNkZwb2hRa1BQOGMzbWo2aDRkNnhveUFZc0hISlNWTEovUEVRYzBl?=
 =?utf-8?B?bUUxOXFGOWU2dVFrTTBpOVB2MTNOSnplTlhnbDM0RGZaSU1KaklYMC9hNWlV?=
 =?utf-8?B?ck5DUGV1UmFBTnd6Uzlmb201RlpEc0t2cHVBOTNUT2JhYXFJeUlhZk10VG5u?=
 =?utf-8?B?UENCYXIzUjFld3U3UUk4dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFFhVWxMR3pFemg4YzVLMEVOVXVpMXA2Rng4WkxTc2x4NWQrYnliVitoNmNE?=
 =?utf-8?B?M2VVWFd2S0VvSTZLQld6OHFyUlVXbm96VWlnVXVuZDBJQlJkQmx1anJKQllq?=
 =?utf-8?B?cHdSRFBrS0NrNXZxSEh5bnhmd2YvOE9CQ3hrZFljZ3NCMkVST0luMXVTSnpm?=
 =?utf-8?B?RjF2V0VBbDZ5d1JUaVBuOFNFNXBaMTE2ZjJUNUJhZ0UwUDVEWEhKcWZhNHFp?=
 =?utf-8?B?SmhGR0x1emNGTFNHU0VLLzJ2MzJTOWl6WC9sYTNkUUtpdFdKNEQ3TnFsTW9y?=
 =?utf-8?B?UW44V3BwL29abHlZNm9sT1gwQURUVUhMUi9RTHVySXFWeTNHMUlJcWJGVXRD?=
 =?utf-8?B?bkxYSC9RejZBYlNoUjBSQ2xjWUc3VFd4OEhqSXV1MUYvSzg0SHdYeVFIck1m?=
 =?utf-8?B?b21rSkJkaVlmb2kveHNSTFFqYUJOVE5hQW52aE10ZUFZZXJQeEFHSWJPNWw0?=
 =?utf-8?B?SlpCL0ZwbjIxSW1lZy9GTU5ZSm1DaDBUUFFWSm9FdkRTT0ZxMmIwVW9UQ29h?=
 =?utf-8?B?YVBOQ2pzcmVSamZSRWJjQ1daOVhSd01uYWFjWkY0dnhyRGtGdlpxd1lROWVP?=
 =?utf-8?B?bzFoUk54NEk3OEZJWVpSYVpVU2diWDBkZ0tjYUhyeFMwVWs1bGhqazRrTC9T?=
 =?utf-8?B?Z3YwbVRCbUYrc1A4Uk0zbFJxUXBZb1I0NVdrcUdoSXJEc0xNZkZ6eUNDeXpS?=
 =?utf-8?B?ZTdFWGtyVXQ3YXlKMFRkTURsVGVKc0MxM0FPYlZCczVmNzQvY0FoZHlxMFkz?=
 =?utf-8?B?WFFHa0RXSVk3d215SUxCNXRmTnhKandBY29kWlJKYjZDeVZHNlhlQzlFQlpi?=
 =?utf-8?B?d3hoSHFObVJHdVpwSHVzVXpwVEFwcVg5Q3hOOFJzSTRDNHVpWGVxZnVIcFNy?=
 =?utf-8?B?YkdZMFc4L2YxQ1dXNWx5SnlidEpSaUFPZ0gwSURiTDNlOUJnTjlGNmFLQm41?=
 =?utf-8?B?N1ZERWhqOGE5bWpLc2VyZEhKdFNCZExNVURhbGhUaE5TM25hSHhrNWwydEFw?=
 =?utf-8?B?aWVRR1hSOHMvRkg1RGFqOFNtQlR5Yko1SkQ2dTN6Mm5hY3JDS1F5dXRseDhP?=
 =?utf-8?B?RkVCNngxZ3UreFVMVS9CVkRWcEFHYlF1ZjhYb29YYUFrOUo1NnFQTjRHRHFp?=
 =?utf-8?B?Y3p4Nk5ZM1I2T1lBcWRNNk1seHROeTYxQzRCb0dUS2ltSTFKZ2FYVER6cXRH?=
 =?utf-8?B?RkVXZzkrVGxSZ2hHVDN2WHlmQWhpYkhnSjdqQzVBM2dRNGM3S3BIV29jSU5z?=
 =?utf-8?B?TWFDaGlkS2VMbU1nUGcrbHJlSGNPajR1MEwzWThOTW5lNFVpU0JsZi9YRlJF?=
 =?utf-8?B?cVpIZzdkaWF0ZEQ3Z01VdW5YamlmbUwwK3p5NURadlNHT09Wckk2VXFkeExR?=
 =?utf-8?B?a2hKTnZiZyt3YVpsa014eDJCYjNGY1hmYzBjUEZMUkpQVEhhTEJXZE9kY2Ft?=
 =?utf-8?B?RG4xbytiMW5QUDBvLzJUNlFrT2xuZzkwa3RCZWJUei9HdFk0TXZoQ2ZyL0Mw?=
 =?utf-8?B?SUlPVzhOQ1plK1E1TVJzemgyb01sTTh6REVBN3pzQ1JVRG40bVpObjg0L2NG?=
 =?utf-8?B?czJJc3JWcERmNmx0QXZhSDVyMnhKc3JoQjdvWHVwN0J4YnlwVzZVMmpleHJw?=
 =?utf-8?B?SXhMSDVFc0lUaUNiWHN4SVFzN055YmMxVzVrTEtSTnVJU1JxYkh3VEcxNzE0?=
 =?utf-8?B?bmp4RnM1dU1mS2RKMndTaFFBemxiR2N4RU1OY3FQTEZFYW1kdm9JbHlNOXZD?=
 =?utf-8?B?S0J1RFU4Yjdob01tVXExd3FpOUgveVhyRWZMVUxuZGVkWXIvbEl1amkyOEhh?=
 =?utf-8?B?SFRMVjlsNlBORnRvNlA0eDRvN1QvU1dJUStsYm5rUFU5WVE0STRLZVZnb0Ir?=
 =?utf-8?B?OWlBQXlGd0tZTXJkcVdyWCt2eWJQVFpqcldDV0N2QWZjTGhxUTN4SDBoQzBu?=
 =?utf-8?B?NnBZK1ROd2hjbUkySXBXRDRZbzhVU0VYZDhHQ1BrTWExZmk3RGIwUm9BTVFw?=
 =?utf-8?B?eG5SQlFBUVlFRitMUHZwVzVvbmw3UjNtdXRPRzNwSE1IakN4U0lacytOZ1Vj?=
 =?utf-8?B?TUZSYUVsdEZrb2pNUkJ0Rk9tTzQ5WnhaVGpWbGc0OXhFTWI1QVZOUVhPcnF6?=
 =?utf-8?Q?T7f1IgBFPKMRUtYTb/SRSS//z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5271ffb-82cc-4b86-4a4c-08dcccdc2a50
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:21:55.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymC+7As8W5s6SDsENvP+u54YHm+63MyqhskH2zSC5bzYb9OebwEO/DWMJUM9BA/ECBFzXuh7WQ/NoS2rJFax0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447


On 28/08/2024 16:01, Julien Grall wrote:
> Hi,

Hi Julien,

I need some clarifications.

>
> On 23/08/2024 17:31, Ayan Kumar Halder wrote:
>> Define enable_boot_cpu_mm() for the AArch64-V8R system.
>>
>> Like boot-time page table in MMU system, we need a boot-time MPU
>> protection region configuration in MPU system so Xen can fetch code and
>> data from normal memory.
>>
>> START_ADDRESS + 2MB memory is mapped to contain the text and data
>> required for early boot of Xen.
>>
>> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
>> Registers", to get the definitions of PRBAR_EL2, PRLAR_EL2 and
>> PRSELR_EL2 registers. Also, refer to G1.2 "Accessing MPU memory region
>> registers", the following
>>
>> ```
>> The MPU provides two register interfaces to program the MPU regions:
>>   - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
>> PRLAR<n>_ELx.
>> ```
>> We use the above mechanism to configure the MPU memory regions.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/Makefile                    |  1 +
>>   xen/arch/arm/arm64/mpu/Makefile          |  1 +
>>   xen/arch/arm/arm64/mpu/head.S            | 70 ++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/arm64/sysregs.h | 50 +++++++++++++++++
>>   xen/arch/arm/include/asm/mpu/arm64/mm.h  | 13 +++++
>>   xen/arch/arm/include/asm/mpu/mm.h        | 18 ++++++
>>   6 files changed, 153 insertions(+)
>>   create mode 100644 xen/arch/arm/arm64/mpu/Makefile
>>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 7792bff597..aebccec63a 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -1,6 +1,7 @@
>>   obj-$(CONFIG_ARM_32) += arm32/
>>   obj-$(CONFIG_ARM_64) += arm64/
>>   obj-$(CONFIG_MMU) += mmu/
>> +obj-$(CONFIG_MPU) += mpu/
>>   obj-$(CONFIG_ACPI) += acpi/
>>   obj-$(CONFIG_HAS_PCI) += pci/
>>   ifneq ($(CONFIG_NO_PLAT),y)
>> diff --git a/xen/arch/arm/arm64/mpu/Makefile 
>> b/xen/arch/arm/arm64/mpu/Makefile
>> new file mode 100644
>> index 0000000000..3340058c08
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += head.o
>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>> b/xen/arch/arm/arm64/mpu/head.S
>> new file mode 100644
>> index 0000000000..2b023c346a
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -0,0 +1,70 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>
> Coding style: /* ... */
Ack
>
>> +/*
>> + * Start-of-day code for an Armv8-R MPU system.
>> + */
>> +
>> +#include <asm/mm.h>
>> +#include <asm/page.h>
>
> I can't see any use of the definition of page.h. Is it necessary?
I will remove this and ..
>
>> +#include <asm/early_printk.h>
>
> You include early_printk.h but don't use it.
this as well.
>
>> +
>> +/*
>> + * From the requirements of head.S we know that Xen image should
>> + * be linked at XEN_START_ADDRESS, and all of text + data + bss
>> + * must fit in 2MB.
>
> Xen can be bigger than 2MB. But rather than hardcoding the limit, you 
> want to use _end.

I  was wondering if we can XEN_VIRT_SIZE here , but that would lead to 
mapping of a large memory region.

So I guess _end should be used here.

>
>> On MPU systems, XEN_START_ADDRESS is also the
>> + * address that Xen image should be loaded at. So for initial MPU
>> + * regions setup, we use 2MB for Xen data memory to setup boot
>> + * region, or the create boot regions code below will need adjustment.
>> + */
>> +#define XEN_START_MEM_SIZE      0x200000
>
> See above.
Ack.
>
>> +
>> +/*
>> + * In boot stage, we will use 1 MPU region:
>> + * Region#0: Normal memory for Xen text + data + bss (2MB)
>> + */
>> +#define BOOT_NORMAL_REGION_IDX  0x0
>> +
>> +/* MPU normal memory attributes. */
>> +#define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
>> +#define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
>> +
>> +.macro write_pr, sel, prbar, prlar
>> +    msr   PRSELR_EL2, \sel
>> +    dsb   sy
>
> I am not sure I understand why this is a dsb rather than isb. Can you 
> clarify?

ISB is not needed here as the memory protection hasn't been activated 
yet. The above instruction just selects the memory region and the below 
two instructions sets the base address and limit for that memory region. 
After the three instructions, we need an ISB so that the memory 
protection takes into affect for further instruction fetches.

However, a DSB is needed here as the below two instructions depend on 
this. So, we definitely want this instruction to complete.

Further, refer to the note in ARM DDI 0600A.d ID120821, C1.7.1 
"Protection region attributes"

 0.

    ```Writes to MPU registers are only guaranteed to be visible
    following a Context synchronization event and DSB operation.```

Thus, I infer that DSB is necessary here.

>
> If a "dsb" is necessary, "sy" seems to be quite strict.

I can use "st" here as I am only interested in stores (ie MSR) to complete.

Now the whether we want to restrict it to inner shareable/outer 
shareable/POU/full system is a difficult decision to make.

May be here we can use ishst (stores to complete to inner shareable 
region). However ....

>
>> +    msr   PRBAR_EL2, \prbar
>> +    msr   PRLAR_EL2, \prlar
>> +    dsb   sy

This should be visible to outer shareable domain atleast. The reason 
being one can use the SH[1:0] bits in PRBAR_EL2 to set the region to 
outer shareable.

Thus, the writes to these registers should be visible to outer shareable 
domain as well.

>> +    isb
>> +.endm
>> +
>> +.section .text.header, "ax", %progbits
>> +
>> +/*
>> + * Static start-of-day EL2 MPU memory layout.
>> + *
>> + * It has a very simple structure, including:
>> + *  - 2MB normal memory mappings of xen at XEN_START_ADDRESS, which
>> + * is the address where Xen was loaded by the bootloader.
>> + */
>
> Please document a bit more the code and how the registers are used. 
> For an example see the mmu/head.S code.
Ack
>
>> +ENTRY(enable_boot_cpu_mm)
>> +    /* Map Xen start memory to a normal memory region. */
>> +    mov x0, #BOOT_NORMAL_REGION_IDX
>> +    ldr x1, =XEN_START_ADDRESS
>> +    and x1, x1, #MPU_REGION_MASK
>> +    mov x3, #PRBAR_NORMAL_MEM
>> +    orr x1, x1, x3
>> +
>> +    ldr x2, =XEN_START_ADDRESS
>> +    mov x3, #(XEN_START_MEM_SIZE - 1)
>> +    add x2, x2, x3
>> +    and x2, x2, #MPU_REGION_MASK
>> +    mov x3, #PRLAR_NORMAL_MEM
>> +    orr x2, x2, x3
>> +
>> +    /*
>> +     * Write to MPU protection region:
>> +     * x0 for pr_sel, x1 for prbar x2 for prlar
>> +     */
>> +    write_pr x0, x1, x2
>> +
>> +    ret
>> +ENDPROC(enable_boot_cpu_mm)
>
> Missing emacs magic.

You mean it should be

END(enable_boot_cpu_mm) .

/*
  * Local variables:
  * mode: ASM
  * indent-tabs-mode: nil
  * End:
  */

>
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index b593e4028b..0d122e1fa6 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -462,6 +462,56 @@
>>   #define ZCR_ELx_LEN_SIZE             9
>>   #define ZCR_ELx_LEN_MASK             0x1ff
>>   +/* System registers for AArch64 with PMSA */
>> +#ifdef CONFIG_MPU
>
> Can we define the registers in mpu/sysregs.h? This can then be 
> included only where it is needed.
Ack
>
>> +
>> +/* EL2 MPU Protection Region Base Address Register encode */
>> +#define PRBAR_EL2   S3_4_C6_C8_0
>> +#define PRBAR1_EL2  S3_4_C6_C8_4
>> +#define PRBAR2_EL2  S3_4_C6_C9_0
>> +#define PRBAR3_EL2  S3_4_C6_C9_4
>> +#define PRBAR4_EL2  S3_4_C6_C10_0
>> +#define PRBAR5_EL2  S3_4_C6_C10_4
>> +#define PRBAR6_EL2  S3_4_C6_C11_0
>> +#define PRBAR7_EL2  S3_4_C6_C11_4
>> +#define PRBAR8_EL2  S3_4_C6_C12_0
>> +#define PRBAR9_EL2  S3_4_C6_C12_4
>> +#define PRBAR10_EL2 S3_4_C6_C13_0
>> +#define PRBAR11_EL2 S3_4_C6_C13_4
>> +#define PRBAR12_EL2 S3_4_C6_C14_0
>> +#define PRBAR13_EL2 S3_4_C6_C14_4
>> +#define PRBAR14_EL2 S3_4_C6_C15_0
>> +#define PRBAR15_EL2 S3_4_C6_C15_4
>> +
>> +/* EL2 MPU Protection Region Limit Address Register encode */
>> +#define PRLAR_EL2   S3_4_C6_C8_1
>> +#define PRLAR1_EL2  S3_4_C6_C8_5
>> +#define PRLAR2_EL2  S3_4_C6_C9_1
>> +#define PRLAR3_EL2  S3_4_C6_C9_5
>> +#define PRLAR4_EL2  S3_4_C6_C10_1
>> +#define PRLAR5_EL2  S3_4_C6_C10_5
>> +#define PRLAR6_EL2  S3_4_C6_C11_1
>> +#define PRLAR7_EL2  S3_4_C6_C11_5
>> +#define PRLAR8_EL2  S3_4_C6_C12_1
>> +#define PRLAR9_EL2  S3_4_C6_C12_5
>> +#define PRLAR10_EL2 S3_4_C6_C13_1
>> +#define PRLAR11_EL2 S3_4_C6_C13_5
>> +#define PRLAR12_EL2 S3_4_C6_C14_1
>> +#define PRLAR13_EL2 S3_4_C6_C14_5
>> +#define PRLAR14_EL2 S3_4_C6_C15_1
>> +#define PRLAR15_EL2 S3_4_C6_C15_5
>> +
>> +/* MPU Protection Region Enable Register encode */
>> +#define PRENR_EL2 S3_4_C6_C1_1
>> +
>> +/* MPU Protection Region Selection Register encode */
>> +#define PRSELR_EL2 S3_4_C6_C2_1
>> +
>> +/* MPU Type registers encode */
>> +#define MPUIR_EL2 S3_4_C0_C0_4
>> +
>> +#endif
>> +
>>   /* Access to system registers */
>>     #define WRITE_SYSREG64(v, name) do {                    \
>> diff --git a/xen/arch/arm/include/asm/mpu/arm64/mm.h 
>> b/xen/arch/arm/include/asm/mpu/arm64/mm.h
>> new file mode 100644
>> index 0000000000..d209eef6db
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/arm64/mm.h
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>
> Coding style: /* ... */
Ack
>
>> +/*
>> + * mpu.h: Arm Memory Protection Unit definitions.
>
> The file is name mm.h.
Ack
>
>> + */
>> +
>> +#ifndef __ARM64_MPU_H__
>> +#define __ARM64_MPU_H__
>> +
>> +#define MPU_REGION_SHIFT  6
>> +#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>> +#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
>> +
>> +#endif /* __ARM64_MPU_H__ */
>
> Missing emacs magic.
/*
  * Local variables:
  * mode: C
  * c-file-style: "BSD"
  * c-basic-offset: 4
  * tab-width: 4
  * indent-tabs-mode: nil
  * End:
  */

>
>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h 
>> b/xen/arch/arm/include/asm/mpu/mm.h
>> new file mode 100644
>> index 0000000000..f5ebca8261
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>
> Do we need this file?

In xen/arch/arm/arm64/mpu/head.S, we have

#include <asm/mm.h>

So, it should pick up this file.

- Ayan

>
>> @@ -0,0 +1,18 @@
>> +#ifndef __ARCH_ARM_MPU__
>> +#define __ARCH_ARM_MPU__
>> +
>> +#if defined(CONFIG_ARM_64)
>> +# include <asm/mpu/arm64/mm.h>
>> +#else
>> +# error "unknown ARM variant"
>> +#endif
>> +
>> +#endif /*  __ARCH_ARM_MPU__ */
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>
> Cheers,
>

