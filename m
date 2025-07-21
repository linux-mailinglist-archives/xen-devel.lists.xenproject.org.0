Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF35B0BFBC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051254.1419564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmYw-0000ic-Ao; Mon, 21 Jul 2025 09:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051254.1419564; Mon, 21 Jul 2025 09:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmYw-0000fv-7g; Mon, 21 Jul 2025 09:11:58 +0000
Received: by outflank-mailman (input) for mailman id 1051254;
 Mon, 21 Jul 2025 09:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2o=2C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1udmYu-0000fH-Vx
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:11:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2416::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be600b20-6612-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 11:11:55 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 09:11:51 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 09:11:51 +0000
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
X-Inumbo-ID: be600b20-6612-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+lkInVRGajcK2rvIlxSKCCowPFYv9gcz6aSXFvDDFmh1FLr8dfJQFPiPPLgCumbnMt0tJ3v/iFFFTlr2s3ILILgC9905PibXIfhfgOnGDATwBZ/GBYLZ9yBkPG8ou6/ZeuxkcvOgUd2Kx59cRUaacyp6cvaL5EHNVuYOZg9THeSZXzS1mleD1hP24SyRP0FHGu1BSM9fnM9x7kuNlpqZ0SIpPhzqtEA8TAcvTMPtiCG0OvXDRpkgrJRpADpNzXiTUXNiw/mOW+EOqEnVo7O1FnDQRtkj6W/GrIXR4nwU6CeyGli67b8mv6AU9rrI9QuU4mLkxCGd3SQu6nArg+7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWHRGZrbgIRWEsX2trQvE2MVl0q1MgsXzAZXLzguGrY=;
 b=m7X2/ZF0OnLUmMDivDiYBi+G6gmLs2qXz0vZiKKlitLgQVuQWLum3PapcJmPVAP8Ey2s10eN3zVBYvWfyrpY6QDCEavEmXRyAfI38DR64Xft9p/dvTTsduHh9l9HSWkY2yXpb/q/v1fR9biKn5oj4/qRFAVp6sERvInLvKsx8yK404IUFmshzKD4P9ymdWfW4ceDu6Gmx8Egc1K5x0X6EJAPpZUW9quueMFyQRBFlELbKsGAKJf3w79gXx0rCV5X4OIDixqEAe61ghNDXQx54uuec3J+Gg89kAsQulvldDqVOjp6yoB5S1MePDwqqpfTt3ChV459c4lM61+wCzkNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWHRGZrbgIRWEsX2trQvE2MVl0q1MgsXzAZXLzguGrY=;
 b=wW1N2Ci2xyJnytyyIk/u/VP6Asq+wJpCw3amM2lVSwtbXSqGM+j66D2NnB/HTi8o3mKxGOTtSuom2vg+KMPe2ynecayrlWD7biH3kymJfc5XtiLaxCys0JiitiYqu9yiCLwHLYlS1cB+tCG+oAdITDLbXzMiaFi6YIYdWVBywUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <479eb766-3b30-4680-9c5b-88ca71b82620@amd.com>
Date: Mon, 21 Jul 2025 11:11:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1753084737.git.hari.limaye@arm.com>
 <3326c844f49a94228c1d79fc1afec614691d4a2a.1753084737.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3326c844f49a94228c1d79fc1afec614691d4a2a.1753084737.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: aa74126e-b306-4b98-74bf-08ddc836a081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVBRZUtGdkswd1QxNWpZWDFXVi9SNXRuaHBycHdBbGdVQ3NqVm4wMjBkYWtR?=
 =?utf-8?B?aTFuUmJvZ1NCZkh4RFpOeXpXcUgrWWlFTll6eTFlbmdELzNXL0tnazhEcXpm?=
 =?utf-8?B?VVg2dHRzdnpabHZmQnBzMkJTcjh0UmR6eGdINXB1UDlzYnVaWVFjYisxV3kr?=
 =?utf-8?B?eERmZ3l6aXprb25WTVo0VHVlV2RQWDRORGxXMDhkNU44SjZ5a0NqYjlpRTlw?=
 =?utf-8?B?eEVaVjBjemgrMVY2SXMxRHllQVB1WTJ2S0RJdjE0VUVRUlErN2t0TlpFbmVP?=
 =?utf-8?B?clRtT2VpOEF0dHhpUWJDdlVPS2pmVUloeXh2d2ZaWmQxR29MS0xLOW9jOFh6?=
 =?utf-8?B?VDRYbUhtdEFVSTZSMi9GMDZ0RitJaEdScVRDRFZZbUlwdGQyb2h2bUpuM2J2?=
 =?utf-8?B?YkNnQzg2bkF3WHBTWS9wak9Rd29paEZPZzJCdVlmbExOeFY2L0lhQnM2V3My?=
 =?utf-8?B?TFdLWlpoa3ltVjJtU3NER1dtbkdlK29RdEJOKytRZ3owNlZVTFlvV24yMExr?=
 =?utf-8?B?WGwxMXZlZnpEblFtSzJhZWdkaUU1SHgxUm50VTZlUnlRQXVSeHhXaThPZXIw?=
 =?utf-8?B?SFpRYW9wdFBDRis5eDJCQU9aQXBHaldnbW43SmhOZHh6T3pWZVlGaDdTMFV6?=
 =?utf-8?B?Zll1by9sOTBqZDEwMzlTRGl5MnJDKzNQazVKZENrYWxRVFR3RUxtRWwrVmxU?=
 =?utf-8?B?ZTVhbVAzNXBFekpabi9MN2owZnZMSzBoY1MyNGxrWDNsTEp0MllqREpqR0E5?=
 =?utf-8?B?RTU0dG9ENHc0Q3JibnBYRnpSSWtqdG5UTWVqTTJCWEwyckhHRGlTWXVBNmMz?=
 =?utf-8?B?Z2xtNCtZT0YzMUFIS3BWcnAzL1pSNXRYNGh3NjdYMGU5b1pGaVRpK3ljWGZX?=
 =?utf-8?B?a0pxVlNtR3lzZnpEeEcvSTJCb0NsZFVia1NPZk4raTdoNzBZUGRKdi9ZYVp6?=
 =?utf-8?B?TGE3dU1GbUMyY05WRE43Y0ljZ2hSWnBCb3p1YzQwcTM4RW1GRSs0dkxBQXZ0?=
 =?utf-8?B?T2hJN0pjcjVybWxGdklPWjdHWlh2T3dJZExOVU13ZTVSbHVWMlBwOTA4UU03?=
 =?utf-8?B?RHhmNHBhT0lhVHhDekdHNjgxSm1JbjFYSWxmUEFSakFkUnFZcDk3cUxlcnJ5?=
 =?utf-8?B?ek9JZWpvVStINGtYS1FhZG9CbXhISHlUZ09oVmJxRkw0NVpqWkxTWTk2S0RT?=
 =?utf-8?B?emM3Z1JFRjFlak14U2ZmRTdsc0duN0RxemdKdjlzRG9zU3NhM1VXcWljMzZT?=
 =?utf-8?B?NTRnUWxjL0hNa0IvOFVUNW1CYTdSNXJJei9iQ1ZjTWtKNk9QMmRDekMyL21a?=
 =?utf-8?B?MnJZUHpyNUpuek5iWHkxNkpMbGhLTGVvajg5QXk1WFB4UUNBeFdUazQvUHdq?=
 =?utf-8?B?dzdFcGtLdEpKWHZkNXhZUnFaWlJaUTQxbFluSlljWEdEYWtqQlVBQWJYK1dn?=
 =?utf-8?B?N1F5MWRham8zejV5QW0ySEo2d204bmMvVlF5NFh3b0RiWlZMRDBUTHIyaEdE?=
 =?utf-8?B?aG02d01lbFN5d0JncFdLTHBMYmVSSWh4NE5pKzNQWWZkRjZCUGpma2dZQ3hS?=
 =?utf-8?B?L0RMblpsZkU4Mnl1ckV4UDFiMDdaNFRRSmhkcmJrckF4RWFZVlVhVnFHRW11?=
 =?utf-8?B?VmZxcG1ja0ZFRmZXRDV6ZnA5QUdzeDhYT2hvYlNUNmh4RXowNTZzeEF0YVVH?=
 =?utf-8?B?UjBnNVFDc05lbWtHZyswZms0R0FTcitGNkRQaHQ5LzhxZWVKK3JWZXdxMktX?=
 =?utf-8?B?UGlJQ2NJTGdJUGEydGZmWWJoTlV0aFAwY3prc3NKNU1BUkpZaDJmZTdYV0pZ?=
 =?utf-8?B?K1JHVFh0SFFIRGVnNXZldWYwd3dnMUplczNRTkV1NDRYdkxEM1dydWhuZGlx?=
 =?utf-8?B?dkllRURZYU1xQlJISnNPUlRoMjVYeVArRTRZNmZHNUNsYm16VjdMVmVIdXRw?=
 =?utf-8?Q?tu9WmW8k/kw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0c2bkJVVzBKVGI0a295RHdpOElPSjFtUU9EZHU3WFluRXRRWlA1Q1JvSWtT?=
 =?utf-8?B?d0xHamJjRzlBcVp6cHdBd1JjWU93Q0JOblc4cXZDaDVPTFR1cHNjenY1VDJR?=
 =?utf-8?B?aWY2RVNLNVNmMlJMR2JFczRJbUxLbGlkTVdwd3VocXFvK1ArNXVUdEUrNnZv?=
 =?utf-8?B?L0Z6bzBXdWoxMXhFaVhubEVaTTlyd2lSTmpCWUltL0V6SmswaHN5T0pTN281?=
 =?utf-8?B?M1VkYzVIN2xaOS9nZGwxK0hCeE1VcWh4RzNRSjZGWlNkVkt2Wm4xekltaFE4?=
 =?utf-8?B?VC9OMnNMNGtxalBWNFVoaDRicnRZTzRYRklkVFRoMURRbGZhMnZHaG5qaFRX?=
 =?utf-8?B?RlJrdWhmWVlaWlBEV1hJMWIyTjhsTXYrNXlhaXVoNXRDSTFTTW94b0YzZjFP?=
 =?utf-8?B?dkxjeDVlUlhSZFJibXdrSXVLYmg3RUlNU1V2bUNPSjhKUStUTFAxd0pDbGds?=
 =?utf-8?B?dE5RanFQZk5vRWR3UUYxVjZnTVB4enMzVVg1QzhtdDNTY3ZvUVBFaTA2TlRn?=
 =?utf-8?B?Q1d5N3MwTjA3aWxFcDhNUlZHVk5zTDZnRjdPUDFHeDBXdHRENys3N0ovZStI?=
 =?utf-8?B?SjdkNXp6OUh6cHgrc0lpckMzM2pBK0dxYXNQQ2NaMkNRRXVCL2szN2V4eHVs?=
 =?utf-8?B?SGYyem0za09KNDZzSjJPUXoraUhHR0U5eFdEbWtzWFhzbUppSGs2dlJHL3FM?=
 =?utf-8?B?aHJwcDRlNllRVlowVlRFazBzWjNBN1J4RW9Ha0NYR2Jibi9TM3NDUWc5by9E?=
 =?utf-8?B?bjRkZTZRWVg2RTJlKzFvbTc0UUZKelpnR2hoQjM2OVRNK0xOVzhYakZGa2wz?=
 =?utf-8?B?QnRVdzFHMW5Xd1JidTU0Nm41NjNaQnFQZ2FZdUhqMHhhWStDY1FvWHBlb2FT?=
 =?utf-8?B?MzFsakxTeXBrY2NjdENNaDJuUSt0N2s2VGhzYm40ZlRBSGVGeVhhN2VqK2Zs?=
 =?utf-8?B?QWUrRGNpQ2VGK0ZjVFZTNnc4dzE5RWpEK2pvR21mcnVlYmplSGdhdDhMeUEr?=
 =?utf-8?B?Q3Z2TU9JZUtXbEVOQWNrQ0RrTE9qZWNMcEIzb2U0UGVqNmNoaDIrT2dkWHNp?=
 =?utf-8?B?VDBqd2c5Tm5RRjlkT1NPRU1CUm40ekxuZ081Q1FXN3V2dmNpaXg2UC9HZ3hQ?=
 =?utf-8?B?V2ZXNTIrTUcxaDZGdExvNFFyaGdPaW8vRU41UHFOcXBnVW9vM01rcWkvdFNP?=
 =?utf-8?B?QjdvVld0bndLbnQ1cW5IZEd1OTRjWG5XWDZPY0RXVlRaOEVsd3R6bS9ZWkh1?=
 =?utf-8?B?a0YydVFRbXVuZTNnOTNrdVE5aUtqWU1KMkxFM0tnOXorRitYTWlPM2NvTU5M?=
 =?utf-8?B?RmtlOHFUUHlhVUMwcE51L1VISWNPbWRHWDFMa0I2S2pYQkMzbDBTelk4YStK?=
 =?utf-8?B?RW91UDhoQnVBN3pCNEhBcXcwMWtaY1FVaEluTDk0ZGlVUUlYVXNId1VQZHh5?=
 =?utf-8?B?blJNQ0dhUHpxcXJmdUc5NnlMU0RKZGh3WXJHSE05ZVE4MHpYWEFoNzNkaEtt?=
 =?utf-8?B?NDAzQ2xaYjZZT0UyRmYrWjFLTVduTWdYOVQxd2pjaU1UdnVycWY3YzVwQmh2?=
 =?utf-8?B?ZGd3b1JDWmpoeTl1MzBmVFFYVUxBcWRHS3ZiVHp2RTlXS2JJVVlWV2FoWCtj?=
 =?utf-8?B?R2FHMjRneEhYaGZvQm14amc0ZDRVUGpKZ3ZRVlhjVS83S2RJVGdwd3Uwbm9L?=
 =?utf-8?B?NFE3SjZWc0FzT1U0aWtYa3M0SXdma3N4RVMrckttWVNiK1pTZWt1dHhHRHcr?=
 =?utf-8?B?UjFPUTFob3lydkF2VnhRL3c4YkFMcHh5bkFEMHh3b3hoT0wwUGpXVnZVUVFh?=
 =?utf-8?B?dGZMaXFvVUdTVUZiOURTaEVsclNPQ2docVdSeXJFSXJpQ0VsbEpmd3hBZThK?=
 =?utf-8?B?ODg4RktwU0lJNWNZbnF5WWlPcmtrb2FNV0tjN2lSblhaRmpPUXNBdk95Y2pi?=
 =?utf-8?B?bkNubVNNdm1UcXlZWUxLTXBlVVBSY3NST203b2FuS21pN1c1bUpsTHh1eUNZ?=
 =?utf-8?B?Z2xMU2lNY0krb3g2MFlYYW8zamFVMmJ0dlZQSTFRZWpnRlE4RGExVWE0ZU5a?=
 =?utf-8?B?WlF3WVFxZHZJN0ZkenZYWUM0UnVDZUozakNyOTlJOHZFYWUzY3JhV2FnV2w4?=
 =?utf-8?Q?d8y70+gCNrz/E83pvN1cuXfm5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa74126e-b306-4b98-74bf-08ddc836a081
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:11:50.9645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JVmhyLXur+ioNxNGTqk5/RA6ouQBCrLqMjyWFK0uDLW3kkGbYxvZ+AQ9MyS70zo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539



On 21/07/2025 10:31, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement the function early_fdt_map(), which is responsible for mapping
> the Device Tree Blob in the early stages of the boot process, for MPU
> systems.
> 
> We make use of the map_pages_to_xen() and destroy_xen_mappings() APIs.
> In particular the latter function is necessary in the case that the
> initial mapping of the fdt_header is insufficient to cover the entire
> DTB, as we must destroy and then remap the region due to the APIs no
> providing support for extending the size of an existing region.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


