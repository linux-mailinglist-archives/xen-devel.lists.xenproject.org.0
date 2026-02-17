Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJYmHDVVlGl3CgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:47:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2DF14B8CF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234899.1537999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJXN-0003HO-OR; Tue, 17 Feb 2026 11:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234899.1537999; Tue, 17 Feb 2026 11:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsJXN-0003Fa-KR; Tue, 17 Feb 2026 11:46:41 +0000
Received: by outflank-mailman (input) for mailman id 1234899;
 Tue, 17 Feb 2026 11:46:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeWO=AV=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vsJXL-0003FH-Mf
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:46:39 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50f8f817-0bf6-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 12:46:38 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5356.namprd03.prod.outlook.com (2603:10b6:5:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 11:46:33 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 11:46:33 +0000
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
X-Inumbo-ID: 50f8f817-0bf6-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3pRQ7/4M7GZqdtAnGF7JSlIZEV5KH3QgrGZyyNqpT5VeDgoIy4r/D+EOdZRS2sikDS2BY5ZuVDqJVhgdHkj4JRSKxxTLPQe67UPIi0sjXqsKdTQKdQoCRdwAjmWltYb1I5kHzFsmb/F7D/3Iovrmogl75JwBrgoi5H1+USgLetP9fEAECLiLmBOC0KdhJ6Qg1MOmohBkseCdMeuV1nmeKCr8XrtusmwFZpTi8q1ZY9ikkFauRmFhSIind7whBe7fAvwkZUO3z7+TeruQpHvogyLHfWyxWBSFVt4sC4qscPWs+gTxCL9k7ewCmP2QUNyusK6dPn1/KVeVNH2eJ0WtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfJtv+7XdWLCg/34XrCgwfQjiDHKj1mcC2sdr0a+cjw=;
 b=Fbzzxz+8KOQBFa40xzzQPCSsxgWlefoWtMXvh79egXMrNfWSb+An1d4u0EKTIHGapvmmSGbgd99PFDViE6uwjTk/mgDKdh3So/kQ4uaB1ipmOgtOE7eXMBhu2X64cSHS2xIHGuqLVb3SJXQiProeueJ7oHotRATCZPeZAm4ZENSDk2cBOnHBVPvZ0/3bNggBYpYjPBNw2DrIKfrVhFSCjPbvEyakD5knMyHG+O0a6PaT3qUDbNN+7pfOfNkG82xc/kmlY9l/hB5N7Pv3x31gEs3nWngmtIywE1JRK5wI1jHPgcGoQ3dz6QW5OhIPiDIXZAGYue5sSfAce/glpNT6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfJtv+7XdWLCg/34XrCgwfQjiDHKj1mcC2sdr0a+cjw=;
 b=LHP6xuR6BhrKXCpnEHdKNe3FzvE/gGhfBM09uSdCx0uBmXBP0ksokUIE3q9neioi+ZmaZn4XHQzHT2rb85jFi0ZPGF1ALgjGKLmHJTbAKsFHztsBc34dPLZqcMV+sQlP+9ewIqHBjRUZD168uQ1tpfdCSsna//P0XyJ3zNuZjxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 Feb 2026 12:46:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2] domain: skip more stuff for idle's vCPU-s in
 vcpu_create()
Message-ID: <aZRVFVXYKzQmt3Q8@Mac.lan>
References: <c0aef909-b294-40af-8d24-033b28450338@suse.com>
 <aZRLMePmm8ehD94H@Mac.lan>
 <a0e47cf7-91f0-471e-b6b8-6554f496190f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0e47cf7-91f0-471e-b6b8-6554f496190f@suse.com>
X-ClientProxiedBy: MR1P264CA0171.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: 94da567b-533f-4a93-89ef-08de6e1a32a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3hzZUJWUFc5OHlZM2tJYXVLak9YV1pmUFF0MlRxQldxMkpETVdHSmszOWNh?=
 =?utf-8?B?SUZJUVBRaVpKOWdnZVhVNFZUbHdhUTVISXNvOE1UNStxb2xPRWNsNm1udkMx?=
 =?utf-8?B?WWQ4ZnFPcENVYmNON3A3S24yWGlzd0djZ0xkL3U4UExZUldsTDExdkZWNEFY?=
 =?utf-8?B?RVVPa1VNNDBIVjJnS0twRGpZYnRUQThwT3F6QzlXRTh2V3VpRC9hWkVIVnAv?=
 =?utf-8?B?SmhHK1pKcXMyb1JCUWZtVlkrUVl1Y2t2b0tFM2ZrZFRIY3BvOWNnU20zQUc5?=
 =?utf-8?B?dW9JbHdFWjFXUFZpQ00rYTdwUXc2QzJVQ3prTG5rZXVoME9RMXloTERjTk5U?=
 =?utf-8?B?cExpSUJsdmVmWEVpYVpMUXZGN2d6UnZPemhVaS9pQjBmZDFPSUFOWjZRR29G?=
 =?utf-8?B?cVBCODVCRWUvUjRYOXN5RW1iTEllMU82SEt1VVh4VFVrejlzQ1VjZkh0M0RB?=
 =?utf-8?B?Mnp2Zzhjc2JBVlVhUFRBUXlKbWthMHJ1MWlrUW1wTnpMWm14K1h4UnZnQXVj?=
 =?utf-8?B?WCtCbHA3SDdDYkx1NTRJOUIyOFlmYkhqVVR5cm0yeWNyOWkzWk10aHVwYTFP?=
 =?utf-8?B?c1piV3ZiUDZnTHJWV3FOUTdPSGEvbFYwRXQ2bmVrODE2VFVuWWZRNHRNeFdx?=
 =?utf-8?B?bzJUdXp0MHI3c2tCMEd5QUtpWDh3Y2lJV0kwMjA0alJsN0dPOC82N0ZqUXF2?=
 =?utf-8?B?aFRlQ2RTNTVSakhJV3pXdTh5QzhaME0xYWlZOHJxV3FDOTdmNmpXVTFlNGVh?=
 =?utf-8?B?TG5XZ01PcEs2T1hiaEhTN0FEQzB6K2ZydTYxcFFEbElIaGhtejBXRWhEOHJu?=
 =?utf-8?B?TVRCZ0o1WWJydXE1OTQ5a0hYWDFCSWRXM1FvV1lMRXNTTG1BcEU4QlFCWXVX?=
 =?utf-8?B?aDBNMW1mZG1Ka0hvL1JHbW1obHV3RE1oRWliNStOQTZtQ3hVc1o0UlpmYStT?=
 =?utf-8?B?ODdKQTVyd0cyRklmWkVZbWtzM1puR0VxdVN0R1ptdEpIZXhRZU9lVFJONmFM?=
 =?utf-8?B?b3F3QXpERzdtWE81czVDeWNMTEJrd2lQOXcwWXZqaXpCY1l1Vm5ickZmMVRs?=
 =?utf-8?B?QjhJVDd3U0d4SEhMQ2dIY29XUVJrOXFVbEwyT2R1Vk1GRXZDNmNjQ0ZsZVZw?=
 =?utf-8?B?T014UmJidVpSbzhjREYzVWQxaVI1Y2dteUFkT2x5RWxZSHZ0UkVsdE1UNFQ5?=
 =?utf-8?B?SnVhR1pWTjZ5c3NIdDBJVndoQVZvNnk5SmpVNlcvV3BBcjhVQzRRdXhQS2F5?=
 =?utf-8?B?S1c1Wkl2TFRZaHFDMEk0eXdiYnR0bnhHQ2kxTldIZ1BvQzYzK2lRRWdpYkF3?=
 =?utf-8?B?aGsxSkFDcnVkbmdCK3QxMzVBWkpLeWNEL3ZzRzd3NCtaaVpFYUdjQnJmTTFH?=
 =?utf-8?B?WnRIemxwZEVOZkY2aUlPUU5FYTRhWkk3cXgyU2lEbU5ibFBTWVA5UFZDKzIz?=
 =?utf-8?B?WDRNeXV0MXZ6OWNFd25ZbnR4UlZlcXZNODgxVFlDOEtNK3JzU25GWTlUVUVW?=
 =?utf-8?B?SWh0TWIrS1RDeHlzb3dOaHIxYThOV0NPbWtZeTVCS0owbW9UclpzWTE0SE1s?=
 =?utf-8?B?Um95cmhaQS95STY5QjFqSnR6VUN2clpMaEhyOEpESDNVeGl6U0pXaWJVY1dZ?=
 =?utf-8?B?RnN3dlp0UE83dVk1Mlg2WjBrdGw1cnFEcThUM3JvOE9LS1N4TkpTNUZvR2hn?=
 =?utf-8?B?Z1c3cE5QWEo4RTVGbm9sb3paMXZDUnVFdkxLWUErazhNenJvWWJvRjRudlM3?=
 =?utf-8?B?NWY0UGJpejVOcHRValFBVDJFYTNWalh0UWhnVGxqbndQcE5RaHpLRmZPMzYy?=
 =?utf-8?B?UjFhNTY0dkpvQUNQcmhKRi9Ca2UxZDF1ckpyaTR5Z3M4cUpDKzU4SlY5RVRt?=
 =?utf-8?B?d1FnMERvWU5NOHNBYk9abUVDU2xISmxvQ0dBRkFSYll6NVNXb0lIYVQyTllD?=
 =?utf-8?B?UFV0cmJKSEN0aXhvOGdiUHIyakorRXpMek1KR2hvZitOOEh1NHBKYlVxODhO?=
 =?utf-8?B?VnF4d1g4bVZJWnJQTHhuTldKblRHczhiWEo5ZDM3T2tjMm1SSlRxUklMZk1i?=
 =?utf-8?B?QVNaRmtrTTRtU1FIN2lMREpqTGZ6MzdET2twUS9BSWFRcVlFNm0yWHhxaVA2?=
 =?utf-8?Q?GHBs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3FXV2lDMmtpL2RtYjVpWGozbkp1UEt3WUczZzFKS1dOSEJrWG94SVhrV21P?=
 =?utf-8?B?bWs4RWxMejBVYS9uZUJTVXNvZmNhRVF1eGZlb01BbmREWnEzTEN2SFZoWkY4?=
 =?utf-8?B?SGVldTRKaE55YkZiejJraXdydVVERE16ck8xTkZXZmYraHFIa2VSVmVUUy94?=
 =?utf-8?B?WGlHWGVCNHMvQm8yY0V1a3BZWDU1RGdOWklGTEFTWHEySkZqR1AxRG5aQ1FR?=
 =?utf-8?B?dS9aNTRKb0tBWjFOV1c1bUVTZklTSy80alIxR1pQV2FJMk1yeENxSTY4VVEr?=
 =?utf-8?B?d3hmcG9CSFBJbWoxTmV6Q0RsTlUySXJTUXpPbWpPS0xFTTRnVDBGd1hZeTRl?=
 =?utf-8?B?VXhxcHpJenN1cW1YSnVEVEdoVDJxTCtVOHRhcEFoRlVzcExKMkZrRGNRU3F0?=
 =?utf-8?B?cFdDaFVBZzRQdkNIdVBWZFVjS1RIK1g2NVJRUEJQRmFlQ3JtSW1RandoekdW?=
 =?utf-8?B?azJyZDVXMkZ5cnJkSm81M3VrK1FYemdDdHpoSGtRWlkzdEhKdWpsRVkzZkdn?=
 =?utf-8?B?V2ZjT054cDRsTk04S0UrOVljNU8wRjRoa1JzQzVWd1JJOVVMSWR3OG5oOWlF?=
 =?utf-8?B?NjJaWmFRRjUyWlNxeWEyVjBGbVBreWJFMlR3TWpnd1dYNEhxY3JJV3dwRVNG?=
 =?utf-8?B?WlNuRUY0ampFMlZ2WDR1Yk9GTWxEWFNEdW03dXdnZHZsaEpWK1FzQ0I0eW56?=
 =?utf-8?B?NWlpbmlBeEttdlpsQkVnZUU5VVA3K3JHOUdPVVY1ZjVUd2hURzZ3M3oxdHN6?=
 =?utf-8?B?K3BtVzlLWEg5c201ci9PTXE5aGNwZUM2WmFiano2dEpmTHlpTVpDcnBMcTgr?=
 =?utf-8?B?L3NWVzlFUG1JL3lUSWxXR0FWd2xKa3BKS0NJSG9VTTRaUDlYRkp6Rjdabm96?=
 =?utf-8?B?SzNnUndGcUs3c0Ixa1ZORjVOVE82TnJGU0ZRRis1RFBMSnhGenI0Y2cveDZj?=
 =?utf-8?B?Y1d2eEZlNnd3T2FyT1MzMVRWSURCcTZSbzh2SWpCNHQzQ3lyMzdzYVBCaTBv?=
 =?utf-8?B?TWhVS1ZPQ0hySU9pY25jSWhQSjdjeVFSc01OeFpndVVmSXZHTGw4VkNSZmIw?=
 =?utf-8?B?cWh5QlFNWk1VWTUwajZEYUFsTld5WUNsTlJlZnZyOFB5Y0dUY2dLRFI1ZHVW?=
 =?utf-8?B?VnNsMzBuQ2JpNkVTUUh1djgzWmxmNmtKQWZuY3lENUZCYWkzMUI2VUxLLzJq?=
 =?utf-8?B?Uzd5cFZEVW5qMEZQTnZrVUx2ODlSdWhwbFZvcnhQekdXVkdVdS9hSFJDcUcy?=
 =?utf-8?B?cC83VGFVVDA0N3E5cUNVRkZydzdLT0ZubHZRNTR5dHdIK3VXL2NoeURuOVJi?=
 =?utf-8?B?c0NyclFoRG1RQU5RMEwwbVkzcUVBNHJVR1I2Szg0dDRNcTVYWk1IN1o4MmZH?=
 =?utf-8?B?alRiaGI0RW5nczVIMUZLNDZoWDVGLzhNUVh2RFdhYTFRaW5UYkQ2YXBONjlP?=
 =?utf-8?B?dWpUR1pldWpDS2N6RnNseWJyQ09QWVV0a1FUcWxraDcwUjBSYzBzcCt1Mlpr?=
 =?utf-8?B?Z3J6T2pLcTVGYnZESEVpc2Q5OVZiTkZrblNlUjdWUGh4WWMwVUZFRlhhNVpT?=
 =?utf-8?B?clphUGpUZDlieWI0MGU0UVM2VWZkMG1ucnVNTERYckpPcmhjYlJxRzd3Rmpz?=
 =?utf-8?B?akVUVDNaYUNpT2tKRDNUUlJMOHpHOUErUjJ6djQzZFFkNUNnN0taaCtRQnNQ?=
 =?utf-8?B?M2hSNHJDN0RPQUlWUFAwSDFRbHA1bnpSdFY5UzI1ZWQ1S2J6MmdPRlFJdmNE?=
 =?utf-8?B?OFZaTlBCKzh1eVIwMXlTU1VPak94aXRnVFBSQk04NTVMRXQ5bTJoVno3a0Ns?=
 =?utf-8?B?U05lbmNzaGpiVXNXemVHOW5FeEc4S3JuY2RVRllhdURGTkhOaXBhK1crWmxH?=
 =?utf-8?B?a2V4L2s3Y2hYb083MjhiV1lnUFVKQTkxQW1RYlMrTGhOVkw1c20ycEJNZEtr?=
 =?utf-8?B?WHhZekxXcXVULzVFVnE2QmhUN29RQ0t1eEk2Mm9HODhHSTViMmUvZXg3RXRC?=
 =?utf-8?B?RVhBd1UrbGM4enpJR01sVW5XeCtvV0pNR1VXK1NuTGxrdjVFK3ZxSGhWZm42?=
 =?utf-8?B?UzRBeDNERG1IVURYNGpXMlRWV082dmF1VEpGeEN1dUJRbm1YbmRabmJSa1lE?=
 =?utf-8?B?RmhHTlRqTGMzZ05JREN3Y1dLemRUUHFuT1djdmMxV29sbzk3VDBEcTJRZHRx?=
 =?utf-8?B?RXIyNnRqSG1jOERkVGtDVmI5OFlyWXFvYmlBdWJDeFY5eWhTNWVuMlMxbEZ1?=
 =?utf-8?B?bnJ1dTRtR0Z0OTAwSUhiSU1FZmM2VEo2SG81bUxCaUhic05YOWVtVXg5dTlj?=
 =?utf-8?B?aHdlS3pVV2hNRkxNd3RiSnZBc0hoRDZsZFBHT1dhVE5FN0JjR0pKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94da567b-533f-4a93-89ef-08de6e1a32a9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:46:33.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZOE689iSU5ayCHjj3MM6Z5lQl8zKBNjCS7H6ulQzTlEFxdULxI4W4N2zfUVAU7e9c14rPOOq2u9iXScCxukow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9D2DF14B8CF
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 12:17:35PM +0100, Jan Beulich wrote:
> On 17.02.2026 12:04, Roger Pau Monné wrote:
> > On Mon, Feb 16, 2026 at 04:54:30PM +0100, Jan Beulich wrote:
> >> Nothing hypercall-related needs setting up there. Nor do we need to
> >> check whether the idle domain is shutting down - it never will.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> @@ -516,7 +516,8 @@ struct vcpu *vcpu_create(struct domain *
> >>      }
> >>  
> >>      /* Must be called after making new vcpu visible to for_each_vcpu(). */
> >> -    vcpu_check_shutdown(v);
> >> +    if ( !is_idle_domain(d) )
> >> +        vcpu_check_shutdown(v);
> > 
> > I would possibly leave this as-is.  I agree that the idle domain will
> > never shut down, but it's possibly best to needlessly call into
> > vcpu_check_shutdown() for the idle domain rather than adding the extra
> > conditional for the common case?
> 
> I'd prefer to keep it conditional: Calling the function for the idle
> domain gives a wrong impression, plus it may be the only one where the
> shutdown lock is used for that domain. We may want to make lock init
> conditional in domain_create() as well (possibly with other things we
> needlessly do for idle or more generally system domains).

I've been thinking about this, and I'm not sure whether it's the best
approach to avoid initializing locks or lists for the idle
vCPUs/domain.

It's certainly good to avoid initializing stuff that consumes memory
or other resources, but skipping plain initialization (iow: setting of
values) of fields that are in the respective structs seems dangerous
to a certain degree.  If for whatever reason we end up with stray
calls from the idle vCPUs/domain into functions that use those fields
it's likely safer to have them initialized, rather than tripping into
some uninitialized pointer or deadlock trying to acquire and
uninitiated lock.

Thanks, Roger.

