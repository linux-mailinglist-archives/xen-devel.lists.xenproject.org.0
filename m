Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEIsAti92GlVhggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:07:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD213D47FA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278517.1563323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB7pc-0002n2-G3; Fri, 10 Apr 2026 09:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278517.1563323; Fri, 10 Apr 2026 09:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB7pc-0002kd-Cj; Fri, 10 Apr 2026 09:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1278517;
 Fri, 10 Apr 2026 09:07:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wB7pb-0002kX-3P
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:07:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB7pa-00DrTV-FS
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:07:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d8bdc2-e002-0a2a0a5209dd-0a2a4509b3da-0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:07:14 +0200
Received: from [52.101.85.14]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d8bdc0-bf79-0a2a45090019-3465550e2a0c-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:07:14 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB4929.namprd03.prod.outlook.com (2603:10b6:408:79::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:07:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 09:07:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOEk2Fp9bY/8/1u6rM5b94pQuLpZ/9T0QjsVtzTEvWlqLJ2W7+aj3smjqwSwlD74XzhjnEhSlaP/BE0252svbLXY+AyQaMBMU5fDpSFoKHe/+bIxthX8ohcZz0wV+R2D9KTtZ1cOHouaFKSorX2se1LL12XpVtOv6XxLu5shkdr92dzV56BoSdH4Ff4EUeeKYPOwtRRbtjcn1M1JCgqJUA/cu1ehphlgE0iZz5q6iIn6smgrZoMNdzRKzvdnGN/84DdBh24olezk222rYXpT5/SRSvBLknWPJEYOaZXQJ94Y5aC6takEpt7F/CO8nV/Lh1rgHAFf3C4246Ctt1S09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR0eXDP3KKu5v7nSYOsLac7/IFD+WKU6tkHsfvJOYOw=;
 b=AD0tgAN5+4Ad08KbTZeUXCCGO+iVuIatqgc7pZdAjm6zfEPlncWl6xJl6cBScXoGeB4dVLxOG+yOqyAZmftJ97zdkDXwoAXqlMny1j3Ux/7Uurk9omr3bPUmzBwq8xgLJTCs+1n2PI10pAh0tmXlPseeECWhcOOAdBF+iDyECmncOd70OvdZxhbW070UcXfN5qcWUcE6LDI2spSBAXbfZnYG3+wG1FKK5HyhhPMJKr7H0Ljv0Vh674EZyOXSqH+0Vz30LrbCBGF3M28Pl8+ZI4JqRdryEuz3MtRLG0jPrBwJTVbOo5/4kT1ZPKxFv2G1EvGzGu3Lz4F2Dyqwh1fo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XR0eXDP3KKu5v7nSYOsLac7/IFD+WKU6tkHsfvJOYOw=;
 b=oC+/FywypHj1Fa7i4zEqchi+SJVEmFVm0GLp53KVWII+5IGueH1/8QzsPjIVSqwreWPKddu072j7/D/V5JQ0igYAdsVuCk/bJLlzSpmGoi/29+Qrg8oAklBNL8yIgrnUijrWpz0tcCGAmRzwpvpThTdeXBymMxeikVOPIjauPaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9f10cd81-9193-4cf5-b8cf-427b918d7a98@citrix.com>
Date: Fri, 10 Apr 2026 10:07:06 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] arm/its: Decode BASER cacheability field before comparing
To: Mykola Kvach <xakep.amatop@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
 <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com>
 <CAGeoDV_S=hQwKyc1aa-X_NZbB2n+QzxUfXpNDcvFehPi8h3adA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CAGeoDV_S=hQwKyc1aa-X_NZbB2n+QzxUfXpNDcvFehPi8h3adA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0654.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: d840c2a5-10bb-41c5-e8db-08de96e08c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	POdOiZc6e9PFtAAtnoaSxIlOvdVM2Byp+GdCc1PrC/4s87VRyAGO2QlQaPW8EGwub5e6eG6RYpkK1OBpaqA/xp79W8J/SlHsLl42+fgD9v19fmdaTLIS0GqgidYJPTj/J3MhmFn2BEFPe2gSolYe63wgOaE/fYxD/BK0qdwSazwj1dL4rZDqQiuTlLWaLfVVJobpYmYvOxhKrOiNear1yTVkGJj/dlIaOATDF1lhy7/aCRFy8Boe979pIDCEcldmW092y7ozNHsRwirBMAHOETFdv8eEZByZCT2uglMmwwiNbmuzEKtxV+hsx1CWWhEyKw8A3+7EVYKKxHaFWJ6Ba65LNL3ek0v4C0G/gEGWbNBNGFtMI+U7zb+YrYRRU7jwdHKHcqoLl70q7V4O46BlPlt/mAhapMOsn90BPOnlGhI5jb3jwotNkHqrPgM1+80HNB6LPMuGlW+4IRX5D6ktabfoC9T7padk+/ThpouQHhQzQOlHLRHSZw48eTk3uLv/y1a2InZv0v7mVcECofnL6Kd6AKHS18YYuzG3HXABLFPWElLxRoIwdzRGSoLbAQkYFeQeDlCH3RGIR5Nxe0KCJF/D/dKWwJQCA/fpvkmFceC4xQXG2hibnHr/9YRHbP1qFS3RcsKhR3yeIZsvfdK38d9mxX9OpBlLJrYLhDJUH2ifoDQ9eFhHVUNQB0EwW0s8XDRXxIilvuOVtZksQvrXSTr/iLwb/GY5xdseFSGrS6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3BPUitrOGxYY3hyUFdPV2lIUDhTRVI1bkxPN0gyUW9HOUZFMUppc3VRNFF2?=
 =?utf-8?B?SDVhT1ZIWG03QmExNXo0LzlFa2tHbVBWR0hvM2RFTUJadWVuN01tcHpXZXZx?=
 =?utf-8?B?L0pSMGVzVUJQb2lmK1lpZVgxMXhVNy9WbURjOWtpb1dnMTRiZ3llblk0TFBl?=
 =?utf-8?B?NS8vSG9BT2tranp1UTFPNTVucnJlUVR2K25ZWkhac1NaU3VHYmE0cWxZTHNB?=
 =?utf-8?B?QmF2V1ZxcFUrUmRaZjFYUlpwWi9jM0hKb3c0cXNFQWFqR21NaXdpMTdtR0VH?=
 =?utf-8?B?SmtTZFhZKzFRdEVObENjaldoU3loYVEzRlQrNjMyaDJmUGFlNmxTYlB1dzBI?=
 =?utf-8?B?eVg0VlZpN0Jvc296c0JRdHI4Y1NTS2V0c3VmK0xlcGVBc2h1UUdrZyt3SkJ3?=
 =?utf-8?B?akRLUHA4N0JzTFFuMUZObGFNQm01TFhMKzE3RmpzRFRzekxVNjh0RHdaQ1BY?=
 =?utf-8?B?KzlNR3hHMEhJaTVuRHRsemx4L3N1ck1zeWxhdzJjMHVrQkhxaGQ3Q2VQd3VZ?=
 =?utf-8?B?SllhRmkxQnJKQkFqWHRhQjRaRGY5WkNXdDhDcW9IdjJIbWZwWFdjMjRvaG1Y?=
 =?utf-8?B?ZXZOaHl5QXhHYWUycTFGaFpFRFRZVjdrTFhUL1hzSlZJM0pmdzZ3dTFiTFdp?=
 =?utf-8?B?Zjh3YU9kc1pnOGxRVEtQZGFJYkFvdTRNU3ZzSmNncmo3Rk0vcUN3Mi9td1dD?=
 =?utf-8?B?eHFqVENuci9uaWo2WHI0MGNHR3l3aTBnMnhIay9aQ2hieWh4Z2Z1V2dsYllS?=
 =?utf-8?B?ZGZiVVByR1JyeW5zYjJiR0pVdk9ORStyZ3VYS3VXVncrd29jMzNLRkVyb0JD?=
 =?utf-8?B?a25IaS96M1crZS8zQmVIanMxMlpRVEMyTEZwdGxLUkNvMWxad3FLRS9wRVRR?=
 =?utf-8?B?bnhjT2JvZDBNK2cyU0VxTjN3ekdTMUFzUldDZ01wVHdLZk0waHJ5ZldKTTdU?=
 =?utf-8?B?b0Y0aUNzMnRMUVZISUh5NzRBNEVMbFBqeU9LQnRtTUFQNXVlYzVsMDkvTHlQ?=
 =?utf-8?B?VWkwaC9wRXZXZlo3Vm5lTDNLM3V3NW5YYW4rZVdpMndmZ2x1VzdCUVdDY25V?=
 =?utf-8?B?ajJxbk5MNjlxcHBVVjFCVHBHL29aeFZaUFZHMTVaN3hTUWxDNFB0NzdlSnFX?=
 =?utf-8?B?U3VEVzBWTFZlS2JOc1NtbHVVcVEyVW5ZcnJ1L05qTFJ5Z1JHUGxYOVRkRita?=
 =?utf-8?B?YWp1cXRpK1lyM2FzWlF5QTdXQ29aVitZVU5RRUgrY0RhbzU3UzFmYmVpdFRK?=
 =?utf-8?B?SFlyYnBJVzg4elcwSmVIQkJTZUZUd2YrTGZQYnpKWWJ3SFhWMFVCd0FsZ2FO?=
 =?utf-8?B?T1daVDQ0L0lhMlh5ajJtTXRBRHdad0diRkcySDAwSnJ5NGVKc3RxdTFMclZQ?=
 =?utf-8?B?RElaTHhJRFdKTUhXMkk4OUQzUjdoM2Q1MmNCc01BUHRrRlducVV4SDQ0VFRz?=
 =?utf-8?B?aktJVkFKUHNHY3J6YW95WmZrd25JWW1QOFEzMjAwNzRvejJyZnVNRVE1dUs4?=
 =?utf-8?B?R2tiSm0wRjJtM0VXdkZKKzhPUU1tUGVnOWU1cFJ4bEZSOE5PWFJzRWtoTzUr?=
 =?utf-8?B?eHZjd2xncU5YYm55YmZ0YW9wZjZPTXBUNVdRdk1GRXpHN3REVUx3ZDI1N1h1?=
 =?utf-8?B?M0VBd3RLVnYzdnQyYTZrZG04Z1k0empRODlZbDhmS25QWk1XbGZ1VDZuYndO?=
 =?utf-8?B?TEh0TFhpY3R0VEtsa1l2WG5FRGhCVVNuNEx5cXJvQ2JLYUVXTlZWeWxmRjFN?=
 =?utf-8?B?VVFZaWpGdFRodlJ1YmlKK25EWmYyckFjbVNTOHMrby9OcXNJWko1bjBPTit3?=
 =?utf-8?B?L1NaZXU4NExvQUlEYVZCRmFZN0NMK01HdmtBU2dncklNZFEyOHdrNkVVWU45?=
 =?utf-8?B?L3RwWG1id1pqc1BYNFVmVm9wSXlmb0pmLy9NVkZpSzZCZEFNZlZqaWtPODhm?=
 =?utf-8?B?a1pqdU1sNHZTdFhBYUdwcUJIWmZuN1ZnQ0I1M0ZRRU01RzdtcTk3Q3ZpTFYr?=
 =?utf-8?B?a1NNaDZWQjRuUS9xVlhGcXVkWXNSUFR4SUZVa3dxSVYwY0NPbVNSNmovMEZa?=
 =?utf-8?B?NzVFZ2xzSStrWGwveXhMaTdCY01LK0ZSejNpUTVQRUhPZXZpY3AvMWFVbFpD?=
 =?utf-8?B?STlsSTlJUTJIaVdZTkUxT0VPUitRZGhNOTQ4dHVrQUxPSlVvc0x3K1VuNlpE?=
 =?utf-8?B?T3JKeklhWmlvY1lSbGttam9XYU9oTGhiKzZOSEtnV0JPemJ2S0E5SEZwaEpw?=
 =?utf-8?B?VG5STmw2cmZ1WkhNcmVFQUV2QTlNMlVteC9ZL211MXFBK1VOaTdaMDNzNEw3?=
 =?utf-8?B?N0lSd2g0NWc2NE81SEp2WEg5a2t3SzB3b2JQS2loelI5VFRMTWJvNzQwOHk2?=
 =?utf-8?Q?MNO2MlMlCjDSEM6o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d840c2a5-10bb-41c5-e8db-08de96e08c39
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:07:10.3541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+Lc49jINlNqJqGGiIVND8n0SUUOSTlhGWXZe46WW47iBuLU1f7ltVV20YtAFENzdep2paRXNWDEY6iTHED/YRqQT6Tiq628AcUEKw6tD1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4929
X-purgate-ID: tlsNG-bad1c0/1775812034-2F34C152-4119E3CF/0/0
X-purgate-type: clean
X-purgate-size: 1178
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:jbeulich@suse.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6AD213D47FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 8:08 am, Mykola Kvach wrote:
> Hi Jan,
>
> Thank you for the review.
>
> On Fri, Apr 10, 2026 at 9:40 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.04.2026 08:09, Mykola Kvach wrote:
>>> --- a/xen/arch/arm/gic-v3-its.c
>>> +++ b/xen/arch/arm/gic-v3-its.c
>>> @@ -496,7 +496,8 @@ retry:
>>>          }
>>>          attr = regc & BASER_ATTR_MASK;
>>>      }
>>> -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
>>> +    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
>>> +          GITS_BASER_INNER_CACHEABILITY_SHIFT) <= GIC_BASER_CACHE_nC )
>> Are you aware of MASK_EXTR()? This is one of the cases that we have it for.
>> Really all *_SHIFT constants should be purged, as they can be calculated
>> from their *_MASK counterparts (leveraging MASK_{EXTR,INSR}() to keep the
>> code readable).
> I wasn't aware of this macro, thanks. I will take a look.

As a general rule of thumb, where you've got a _MASK/_SHIFT pair, you
should be using MASK_INSR/EXTR and delete the shift constant.

It is is ~half the code (visually), and removes an entire class of
errors (mismatched constants).

~Andrew

