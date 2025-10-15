Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B7BDFDED
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 19:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143875.1477473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v95MQ-00060M-L1; Wed, 15 Oct 2025 17:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143875.1477473; Wed, 15 Oct 2025 17:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v95MQ-0005yK-H3; Wed, 15 Oct 2025 17:32:26 +0000
Received: by outflank-mailman (input) for mailman id 1143875;
 Wed, 15 Oct 2025 17:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v95MP-0004Rt-4R
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 17:32:25 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e835b9e6-a9ec-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 19:32:23 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB8086.namprd03.prod.outlook.com (2603:10b6:610:27c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 17:32:18 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 17:32:18 +0000
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
X-Inumbo-ID: e835b9e6-a9ec-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlYycByJAf2zjrBEoFWT/Nhcy0rZWnuoMF4qLBJ1x8MW7UOifWmsC69zl/skak++DEXZxPkkRtnRCxMQYgoAt2PGF1gVrpH3DuDltqubzmyqvtVtMp60RtEAOdRQNvlnau//zwVxru4hO0RH28CJNJBRTuiyk1hl48iedg4FaFRBiAZODliO4CAOTVQS6TMH4TvOfYF8tk82tQ/OizEMjlQS3L19HeC6fvOqnrYFeDyT3D+oNvD84rzGzMz+ktN+p1Ar9BC0/MjRZKrUfAOKsEoxErjjSkoNudVYx8hRdR8TUCkit92XNCplBeOpqIf6X0PBNPv45VYwile0LLEZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9aSygepkY2MI3bNhXIBPDB91Wrs0Efd3OT+F6W2EVA=;
 b=TmncI8oxSMdWyTnegerbe/OV4kKP/afuPAylG6XXkKe3vpi6Jg2zdyIUDIfDzN+fndJ0osbhDHkHpgk28FQglpzrTibHUqzKripXtHDfFGqzLHlxMCTr62G6R+9h54KnlbJnXe13JcP2Pj+KK9/ONLCiVAaDuo3T7+SX4ZZE0QoB8Sxz25QPusHIbsL0gBmLzdZZlGp9jmEIOXmE1EJ+TKbWUYAEjGOQtJzVT9Es+vRvYZ6CWql7BOhUqoKLPNKtOw0hBol9fneemy+RKCch6IEMMXE9fcC1ZrLvrihVlflaBsI4gP3/aDYbyzjrcOWlZmxSIS2o/GINMe1FhHQsaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9aSygepkY2MI3bNhXIBPDB91Wrs0Efd3OT+F6W2EVA=;
 b=XH30s5Ns3ld/gF93CjWRhX+z72wR2st4oYa/7i03UDSXdp+azjMI151qfmf3KNUXyaFXk3Dw3ga1MmnnANLpYucNWa9+NAXWqYpRxqXld2a/+Tj5lMyGDOhCKSOcioYf+PsJjGFFKacDYGB8sro3yZ+SFk6MuAYj9tSk4yoR2Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 15 Oct 2025 19:32:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
Message-ID: <aO_an64zYsdXBIch@Mac.lan>
References: <20251013211106.8720-1-jason.andryuk@amd.com>
 <aO39pb3L42ktBol_@Mac.lan>
 <d8cb0b5b-fbf6-4db0-ba70-f5a612e63cb4@suse.com>
 <a4ee443a-cf65-420f-9508-d7f34393316b@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4ee443a-cf65-420f-9508-d7f34393316b@amd.com>
X-ClientProxiedBy: MA2P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::15) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: fd64edf5-dedc-4584-732f-08de0c10ca2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0gzdGpFUmxJb2RncmFieHFtN1hXRk93S2RzSTI0c1AyWmpsWGpOYUMzdXA2?=
 =?utf-8?B?azJDbWFJaEtDZ1JDMzFWaU0yenF5UjB6czVJMjBsV3pMRldCS2M5b0FEY3Bk?=
 =?utf-8?B?SER1S0Fkc3luY2wvenFqNmF3N2Y2dVE4RUlCb2hCM1pVZHZjdDJNbmtaQkF5?=
 =?utf-8?B?alRpUlBmcWtBeUhRYUx6d1p3cVJYYkFnREQySUVycVpoS0ttbFFJWTQ5R2hC?=
 =?utf-8?B?d2NLK2VqL3RHNTZQUWNVMWNCaUUzeDBqVmNzcHIyQTJCUzNJY2FkSmlseWwr?=
 =?utf-8?B?SWVkZ3FtWCtaV1J1b2Uvemp0SEtSbHhTS1NSMFA5VnlvanlvOS9DWTZ1OUVN?=
 =?utf-8?B?OVZid1NDbmZZRFI1WXljYkNZam1OMjdvTTlNRzVKR2lqcTlIVEhYMTVNV3Er?=
 =?utf-8?B?RlIzQzdMZlF3R3NNcm13TDk5ZFVVTXM2ZFJiMHY0cVdncWFMNU5pUnpiQmYx?=
 =?utf-8?B?SEFESVBUanV2cXhWY1dOY2ppSHB2TGczNVIwRkVzdzdPQzQ1UEI2cis1Ynla?=
 =?utf-8?B?NUdSTG11SmJtY21FTlkwYUJOM1FDRVpNVHdNdk9SaGtTVGIrM0U0R1MvbHJz?=
 =?utf-8?B?V2ZTYnZsUUtPaWdnTFF2d1EvSjE4RU15QW5uaVRmS2JTVXFScC8zQnlIanM3?=
 =?utf-8?B?TWdHbVVVbmo4Y1pJbFVNcGtyT2pXNGpvcHoxQjlkeVpwckpLazhab3NCd3Ru?=
 =?utf-8?B?VTZBNFIrckpiMGUvaU9PaXBRSkhxVG4rcnNVc1BRRzVmZzZFdzF4eE1RdDZ2?=
 =?utf-8?B?NTFFcXQzcU5xaTJ6anI2elpHMmZ2Y1RuVURPbVhuZ2RUOXBaYkYzMjhHaFMy?=
 =?utf-8?B?bGtzQi92bWtZNExEb3RMS1AxSUtwUXhRK1V6RWRKSzA1dC9VL2ZpYVNobndp?=
 =?utf-8?B?a0swU1AwZUJpUEV0N290cWRHbzhHNHZ6UTYwaHoxdlpPQnRielpNczdCRmtt?=
 =?utf-8?B?WHI0UTBPbENGQVpoRjJQbk9tRjBScXc2TElNUmd1c3liL0dwalF3VWI3UU5z?=
 =?utf-8?B?am0xU1NIbFZuVTJOY3prRjk0M05JY2hnYTdsWGpGQis0NWNSalQ4akNNVVBk?=
 =?utf-8?B?bVpNU1pROEpjanl3VUtrU2lIQVVibFk2dkNka2hZemtJeUh1d3J1U2xQRndY?=
 =?utf-8?B?VFhONWk5OTZ1b0ZZWGFESGw2QkdkZVAwN0ZSVG11bTV0TXgzQm5uUTFEQ0Z1?=
 =?utf-8?B?Mk5ISnE1dk5kVDQ1OVdEWUdDRjc2WXBuWTl1dEdWeUh2T1ZtZnV1Yjluakhx?=
 =?utf-8?B?aEJKV3c4em1idm80bytWMFR3M3dvdHdJMWFZNk4wUVlGNGFoY3kzUCtWZEFK?=
 =?utf-8?B?cXkycmdSOE03MjRscEhyeGt6N2NqcjF4dHFZQmMwSDJuVUVhMkdKSEkxaFE5?=
 =?utf-8?B?NVRUdE9RaXp2a1ltMkVTWmVuTGlOM29lSi82cHV4ZjhuSkg2Y0FndWJXdzdJ?=
 =?utf-8?B?TG50Ritkc09VQllYa2FKVW5sa2NqZ2Y3VEhBT1E4V242MGxsbmFSZUdUS2k3?=
 =?utf-8?B?WlJzeTVIRmh5NXFJeGhZOE00eldzNzh6aG4wOEd4aHhuRTRZemhQazAwT2hY?=
 =?utf-8?B?czEwV213MXlCMmZyYnl3NCtTU200MjVQV2trOFMrems1NnczakNzbFVFc2JL?=
 =?utf-8?B?UGFXaXFKeXlCZ2lTTkRYdVprbmp0NFdCOWVLNWExWi9Ra0p4R204a0pBN2NV?=
 =?utf-8?B?RlZyNmJkRmxMNkNhdktudmM3Q3RHMEhIVVM4MmY3V0tzWVY1YVFJN3pJUjlW?=
 =?utf-8?B?dUd4MnlDb3FvbDg4RGttell3WjdUT3NHUzVuYlpEdnZTdmJXT1RYaEhFZlB4?=
 =?utf-8?B?aVZxSFJ4d25XbUF2YU90QmY5SU9uQXR2R2p4WDh3Rk5JRUkwMUdFRVoyRjhy?=
 =?utf-8?B?ck9vVHFGOXFLOHJIbHY0Si9FQ3BLK1NqOEJnRS9LUk9GUmhiMUZZUWFTcnFK?=
 =?utf-8?Q?x+bY3GZ1Eq1j8OO+3cYwAZERuK6EOb38?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1UwVFlOTmF4R1VLK3VjQjlqWUNWNUo5QUk4bHdZbitpREFhTkJRdUpISlVr?=
 =?utf-8?B?eWo4ampQTDl6ZUk3dnRYM2xwUEg5ZzNUMEhlMmpXa0JXcWN0eXdJS3lFM2Zw?=
 =?utf-8?B?cDRwZWlRVkEya0Zyd3dLNENpN3RSMm90YnhONnFLV0IweVZ2SDNBUitIVzZj?=
 =?utf-8?B?OENEUFJOaXQyZStTU0Z0Y0E2ei9aL2tTUjY4Z0hzb1Q5T3N2Qk1zd1g2b1ZO?=
 =?utf-8?B?aVFUcFRTOHNibDNTdkpZNDI0V0dvNkdEYnp6Z2lLY1B2S1hFYzdTRWk3ckkz?=
 =?utf-8?B?aFZZczFibmhFUFNiYmwxNmFlbDJXdzlYY0V6bFllSjhaUzhhTHlkVlFTTjJP?=
 =?utf-8?B?Zmo2V3c4M2dzN3k1a2ZkY0MvUXBIdkQ1N1dNWlMzQXAyRURISU9Jd29IbFJu?=
 =?utf-8?B?dkRhdXpLNVpNcjlqMFlja2szZlFqZTJJT2pncWEvQ21pcngyYkFienNqY3E2?=
 =?utf-8?B?ZTRBcmtMekx2RXF5ZzMwQnpzYUVpS25nenJmbWNFK0t5YndZSE4wNHMxbm9T?=
 =?utf-8?B?Y3EzSTc0djNRZUZBdTljY3JsUHdFcjRWN2RwRXl5TUJWMnc0Y2M0UHVGWjBC?=
 =?utf-8?B?a29neFA4UG0ySVhvSURrYWtyQnJnUXVlVVBxeVVRSGYxcFlMVDZTOFZORkxs?=
 =?utf-8?B?SWlORHBPV2o4ek9jT1ZVZHBxQzlHS2Zndll1ZkMyUzZaKyt0UWxubThDR0JU?=
 =?utf-8?B?eW05cW10S0JiUDUwRmVkbi9JNkRKUDk3L1dZZGJFdVlwTHFNRkM2dDBoQ2Rq?=
 =?utf-8?B?UitIY2JyMk1Ca2JjaWNKaXMvWUJPWGNBWTVWbFhoSHVtOVNwY2dFbEVPNmkv?=
 =?utf-8?B?YW1qZlE4d1ZmM1htd1RGSWdmTUsyRnV0Z0lVNmFSVGo1dnk0cGVSZ1BrOXBa?=
 =?utf-8?B?TnFTaGFHUUlDanVJdy9sQjYrSVV0Tzh4ZmgrTmV5cjdkT0hBZmlZQlJHYm9O?=
 =?utf-8?B?MC9pbTdMUVFnNFpYNG8yVWpsYnZ3S0hLWk1pV0dZMDFZaHp5WWlhOTZzb1Fp?=
 =?utf-8?B?UFVKQi9WL3kwMUxYdElXejNGNHVQSjFsR0cyVVVPU0Y4S1RUc3ZsOTNINEls?=
 =?utf-8?B?VnQwTWlYNHcxWlpxZnIrNlIzeTYyd3d3K1JxNFBUcVNtOUFDRXdlUW5YeG5l?=
 =?utf-8?B?YVo2R0VLbVhzdldqVnEyVlF5eE10dFV0LzNqYnViSGU2cGdRRXo5c3Q1dDQv?=
 =?utf-8?B?Q3ZqM3VHdVdPR1ZCUm95QW5rMHRZOEZscE1BWHovbFkzWEZjOEo1aVd0RWp2?=
 =?utf-8?B?UytvdHNVOHlkZEI2dERzekdtZG4vMEdMS1Z2OUxCTGVrVFA0bmRlMGM2eVJH?=
 =?utf-8?B?WGtrOHljZzQyZEhXTVR6Y08wbzBRbDRNekhGbVIreVJZazE5MFBmZzNtbU5h?=
 =?utf-8?B?cmdrYUpkY2xIUU5UVGZJUEpaakRObFc5eHl6VVlicUtraDNrbTBWMU1qRFdL?=
 =?utf-8?B?S282dG14NmFuRk9Xd0E4R3NCOUVGQ2ZHQVVOai9mNjl5ekwrV29WT21iWmda?=
 =?utf-8?B?L3lZemZ0YkVWWGxsTDkxZmhCQXphVHJvVlFUcjlqdXQ0cVdnc1pKY01zMFZy?=
 =?utf-8?B?a3I3dXZWSDVPTGJPeVpNYXpQV0E1ekhHV1NlRjhPd1BjdGNRQWNZV2lqdXR5?=
 =?utf-8?B?MXYrcG9zd2V4d2IzRWlzMzZZRE1BMHJ4ajdnOGRMZzhsaVpyMzF3Z0dzUEtM?=
 =?utf-8?B?UEltYXZxT0ViSms4blMrODRuKzUzd0x6S1BoTkZWdUVkRGh4U1owWjFrWmVZ?=
 =?utf-8?B?VDRwUG41ZHdTYzJ3Y2xRTVRnL1pDTzFIWitMaHpkNFhzaTBrV3ZMVlFhakFY?=
 =?utf-8?B?ZnJydHFjQ2NFZ29FOG41VmVhd2ZuL0ZPT2dVbDNKYVNCNlFXT2x6cWREeU1E?=
 =?utf-8?B?SUJxYXV0YkhrZzJGenBoa2dhdkFPYUFkYURDaFY1UVg4UXhORE5JN1M3bGRP?=
 =?utf-8?B?aXI3ZHhGUkRFOHRjOEVqeHRMTUM2amZmemNBZ1Zzc1N3M3JCRzRobDJteis3?=
 =?utf-8?B?S0NDWTF6NjdOV2F2aFFiSWVYY0pkeEhCZzZqRkEwY3hvQVBlU3RKM3FtZlJy?=
 =?utf-8?B?OXF3cnpFaklMYW5LZjNDS2ZiTElyR2JtMTJXMVhKZE1JOGdWMFZkZngvVDNw?=
 =?utf-8?Q?aQmidSGcjEmK0TI7eo3v+R0Dk?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd64edf5-dedc-4584-732f-08de0c10ca2b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 17:32:18.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WxLeCQ1NmWofS/ZF3st+CPglyhqAnvsN+gxEDjaQTg49e67HQ69B1LdlfjIEeP0YQ3NiD7n7fLF8TY8+ce94A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB8086

On Wed, Oct 15, 2025 at 01:14:20PM -0400, Jason Andryuk wrote:
> On 2025-10-15 08:59, Jan Beulich wrote:
> > On 14.10.2025 09:37, Roger Pau Monné wrote:
> > > On Mon, Oct 13, 2025 at 05:11:06PM -0400, Jason Andryuk wrote:
> > > > io_apic_level_ack_pending() will end up in an infinite loop if
> > > > entry->pin == -1.  entry does not change, so it will keep reading -1.
> > > 
> > > Do you know how you end up with an entry with pin == -1 on the
> > > irq_pin_list? Are there systems with gaps in the GSI space between
> > > IO-APICs?  So far everything I saw had the IO-APIC in contiguous GSI
> > > space.
> > > 
> > > > Convert to a proper for loop so that continue works.  Add a new helper,
> > > > next_entry(), to handle advancing to the next irq_pin_list entry.
> > > > 
> > > > Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
> > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > > ---
> > > > v2:
> > > > continue (not break) for pin == -1.
> > > > 
> > > > I added the next_entry() helper since putting the expression in the for
> > > > loop is a little cluttered.  The helper can also be re-used for other
> > > > instances within the file.
> > 
> > Would this intention ...
> > 
> > > > --- a/xen/arch/x86/io_apic.c
> > > > +++ b/xen/arch/x86/io_apic.c
> > > > @@ -1586,14 +1586,21 @@ static int __init cf_check setup_ioapic_ack(const char *s)
> > > >   }
> > > >   custom_param("ioapic_ack", setup_ioapic_ack);
> > > > +static struct irq_pin_list *next_entry(struct irq_pin_list *entry)
> > > 
> > > I think you can make the entry parameter const?
> > 
> > ... possibly conflict with such a change?
> 
> I changed only the parameter to const, and the return value is still
> non-const.  So I think that will be re-usable.
> 
> I placed next_entry() immediately before its use in
> io_apic_level_ack_pending().  It would need to be earlier in the file to be
> used more.  Should I move its addition earlier?
> 
> And another Minor question.  Roger asked for ~Linux style in the for loop.
> But in next_entry() I have Xen style:
>     if ( !entry->next )
> 
> Should I switch to:
>     if (!entry->next)
> 
> ?

IMO for complete functions newly introduced it's fine to use Xen
style, I don't think we will ever import anything else from Linux to
this file, we have already diverged too much.

Regards, Roger.

