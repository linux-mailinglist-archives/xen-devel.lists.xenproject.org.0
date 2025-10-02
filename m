Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E4BB411C
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 15:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135838.1472780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4JVn-0006KD-MS; Thu, 02 Oct 2025 13:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135838.1472780; Thu, 02 Oct 2025 13:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4JVn-0006IM-JQ; Thu, 02 Oct 2025 13:38:23 +0000
Received: by outflank-mailman (input) for mailman id 1135838;
 Thu, 02 Oct 2025 13:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddTC=4L=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4JVn-0006IG-0I
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 13:38:23 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ce73239-9f95-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 15:38:17 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BLAPR03MB5412.namprd03.prod.outlook.com (2603:10b6:208:291::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.15; Thu, 2 Oct
 2025 13:38:09 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Thu, 2 Oct 2025
 13:38:09 +0000
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
X-Inumbo-ID: 0ce73239-9f95-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCSUfAwmTJked4XawSaOlECqlJdGJx9Z2rPm8jwPa3IxjayHrph1phN+GqdLp/qTOYC49Pzk1tQvLEDGVHKMtwIt/TpF2tPWCq5qEJRk64sL2RZq+1GkjxIaDme3MROmJrrmWx1+gB/sBJuYyoR5nC41TkCOHv4bnSXW5o9GPIpUfnH2sVU21haRPofNW1OR+Tr1sXYzl6K2b0tqJ+m/hBdDjGTHSOargA56Ndsd4KNnteEmATL29lZjKacDO/QJ8u6l2SqZe+4+PTKZhOejbPYswx0CKxN5S1JgaeJhHeWRS41KUBy+n+jffcmaz5CMvwBc0BGX/7WTGUCnYQbPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN4LzuwdATMPQ4tZr8o7m/22nFdC8D8qv2XbUiMaZjA=;
 b=Q7ElG/VZMr6yt++yPfXI93qoim/82UGp3kwSeCpgN1RY8GNdhG5+qLgajuYqfLv3SuLUK5xf0/iYuc8MryUNdnE8CT6BYeaSab7WjJ5eHhByi+a5BrOAw1HcehYX4u/pqjufFzjnCoCFPLHSBRvbC/4hsPZHYnYfPf70Ssh9iM1HjktgmYAvbx8Qv3MbYLKHohrPn4NQKFEMSNrSH6IbSzmyeAze2ipgh9Wcs9GSq9Y5prWz2ZMmogP0eeg5b+tDmcsihLmzRNPmMr3bLxdYn5NfVSHvIpykaTBowwZKNbcq1V0Mo96q22i471ofXV/HgcT+lTI5p35ctPDxqJ2q1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN4LzuwdATMPQ4tZr8o7m/22nFdC8D8qv2XbUiMaZjA=;
 b=FC0mwvAPNgEv/rRefl2rme6y1eNTglFpdVNfoC8x8ekfeAtO01c4vef4ERq6hl20BKRXjsy0ylw4jtJa6Njaa/MdIsnrQp7dA9MSc8/YnaC1ZLrOKIIPcr4P/QCumuB47X8j8d8S3KQ525PbAM+iGTFTKKrb12ZEkfTTK7CpSPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Oct 2025 15:38:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port
 E9 hack is active
Message-ID: <aN6APR-CUc9xRjfM@Mac.lan>
References: <20251002102200.15548-1-roger.pau@citrix.com>
 <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BLAPR03MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: f6909c22-f300-4bd3-a8e4-08de01b8ecaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1MxL3JLTEtlNnVVRzdmaEljSWt1a09td3grUm84TURyTlNuU0VoVjNuVDBT?=
 =?utf-8?B?YzQ3NUZROFp5cjAwc2Rsa3pzZ0Z4bVdYa1JxS2tiYVVsZUtKQTRmOGR1RDRy?=
 =?utf-8?B?WmMranVqYWJjRlhEWXRpNnR5Nk45UWU2WmVCV0tuWHdBTHRRUXRlYm1HY2d2?=
 =?utf-8?B?dDBXVVYybkVRcFpJbmZ0WkE1Znl5a1lkdFRHVEgzZEZXRUdEK2dnVFpCVEVl?=
 =?utf-8?B?ZC9janU4NmVQMUxjaFczNHFOYy9uNktjY2NkdlIzb2VLTGJxNTFRVGMyRlBn?=
 =?utf-8?B?eVJ4TWQ0YUxLdDBVbHBoR1d4TExrOGliMXQ0NU5KYmk1cHh0K0pPRGtxaDAv?=
 =?utf-8?B?OXFTNWxFQzhkU01lZlB6QVpLMjhWcmw4OUlDWjhlY2NiRlQxbmpmcFJCSVRV?=
 =?utf-8?B?N1VaallUZjFvek1rVjhCcDhGcmNOVG1sS1B4QnlzTUVyVXVtUFQ5dmZ1cG9S?=
 =?utf-8?B?dUFubUIzeDN4bjBmb0tiOUc1Z3VrTjRGYTFRSzFkRlZkVkZHSGQwMFh6aito?=
 =?utf-8?B?TVhCV2NVNVlKckFZRGMzNHAzdFJVSko2Slg0NkpVS1FxT3BIRUs5bWZ3eVZt?=
 =?utf-8?B?OUg1ODFxMEg3elJSRDNKK2dDY0UvZjR1SXdMQUpjbmVNVXJLUytvTjQ5QnVu?=
 =?utf-8?B?T1NiNktiSDRTbzRPcFBrSTczL1B3bHplUjZDK3lYSkJsS3hsczY4NVpsVHVy?=
 =?utf-8?B?NGwzS3FUNHBlWDQ5a3JBZ2F0L0VCTTJHRXZkbVlwcEdrR2thYTVZakt2Y1Vo?=
 =?utf-8?B?ZTh1czJ0NnQvN1JObkFWS3Fsd3M4MFloYTBmdEk4K3ovenlGT1N2bjhLdFVF?=
 =?utf-8?B?MWhhVURxSVk1T1gwaTdVT3VuWkM3Rm0xUkxlcXowV0RsdVY1WUZEOS9jK3dl?=
 =?utf-8?B?eHN6WTRUM3dxT2VadStVZ0NJdVJueFpWd1RSY3ZsL2ZTeS9vZ0czSEhUSjJL?=
 =?utf-8?B?SnJtTWtKVWRIWHFDVDNhVTVLY3N5ekpLYjVycjczMUJhNk1XT0VrK09YNS83?=
 =?utf-8?B?VjBrV01vQWtVUnIrN2tuZ09hTlRJcDQxTTdYWnR2Q2ZvcGttS0NreUh6ZGds?=
 =?utf-8?B?cGVIRHlSYUxRWTE1enVlUEJnN01OelVtY2t0SkwvZERYVkZmWEJQWWhmYm1G?=
 =?utf-8?B?bzBVRFlCZ3NHYUV0RHZ6L1g4QTBtMUhlZlJlY293a0lWb00vVURaRkZoTzJn?=
 =?utf-8?B?Y2FrK2cyUDlQU0h5a1pLV0JCSFg4Y0hTRWpoUmRNWmZCQ3VFWCt1UVZuT2F2?=
 =?utf-8?B?Lyt4MFZ1SnJtVEU0V2ppZFlDWFNXaWJXYklxdUp6cWF6N0JIUVQwM0tKZlpx?=
 =?utf-8?B?K1dZaHd3dDdqcSs1eHlpUDV5c2l3NHNZeFFHc2NJVno2Uk1HdERIdEhCSEds?=
 =?utf-8?B?ZkRwVTJaQTZIMFpkVTRBNEM3YldYcWJ4b2Zkb1VleFpsaFRKd3ZUOVlxcVRv?=
 =?utf-8?B?M29wVmdCZlhDc0N2NWhwSmN1OTZtcTcrR25aVXkxbkVjYWZEemE2RmxOTFI5?=
 =?utf-8?B?bzdiV2ZuNlExWXVoUmZPWEM1R2F4MVNoSWE3ZHhxU05oTjdzNnc4VDhON2l1?=
 =?utf-8?B?KzNCWm0zbVNiei9qQ0d0dyt4bStUYlBPVUlLbmNVY1NNbDZnOVE5dFJweGg4?=
 =?utf-8?B?TkFTbkhPY1k0Wm9NT1pWSnE1SFZyYWdVSTBQUlVpS3J6aVlqK2thdk5zejAy?=
 =?utf-8?B?dG9Ua3VpSXJhUzBTRFNhTlhvMGJLa0Y5bzhPWlRGSVUrQ3UrR2daeFduQlB2?=
 =?utf-8?B?VzYvZWJ4UkVBaXVSa2lSYktJb3VUSE14Mk5JYVRwUSs2N0YvNEhmOGJvSXVW?=
 =?utf-8?B?R2dsdDRtTFpneVBSSVQ5WFh4VHJLVzVhakRzY2FyTEZFZ1NPOGVmMEJUZUF3?=
 =?utf-8?B?eG1NTnpIY3ExMmhSUVE3eUFnaUgxcTFvUWtRa1dRZ2VnK2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGxhbGN2ZytMY0orSEpzeE54UU1GMnFPajVoa3JDU0NxcXRBM3VuR01uY05P?=
 =?utf-8?B?cHFOcm5scExldm1relJKSXM2d1Bta29xZlFBcUc4eUR3MkkwVFE3SHhLSVVJ?=
 =?utf-8?B?S1lHM2d3aFkxbFZzUTVGb3g1c1E5QzdUSjZ1SlR2QnZIeE40UGVJcE5XNitm?=
 =?utf-8?B?OENjSE9SUFk4N3lLVHg1RlNFeEtodEJGZjgyNlM0K0FEMitXWUJld1RGYVlk?=
 =?utf-8?B?RmJ1M1NBSHM5OENIQXBLM01nRDlneVU4VjRSZlNHQUxrRXNYZXVtZkNFMVBB?=
 =?utf-8?B?SXMvT1V1WGJzbkV3TC9leDcyNldOTDZOWG9FaE9OQzVEcjAzNmlMeTd3eTJR?=
 =?utf-8?B?SDcyUi9kUHlFTEJ6eUN0WW1MUlFRUS9rdkZ5c1J5d2xkNzZvU0VOY3o0Yzds?=
 =?utf-8?B?QkdleGJHM2VJR3ZXTEZTSzg3OXQyT1JGTHBsd245cHYzeTRFT0NnSXEzVFNo?=
 =?utf-8?B?b2IxM0p0bitNL1FwVHArU2N3ak5HbC9kbnk4ZTJYUWx0cW1YVE1TSXJobGRl?=
 =?utf-8?B?YTZtaXdCTXFqUHJINTZPNFBIUWtMRjFvTXhlNUVac2dtbjQrZ2ZsanQ0Rk10?=
 =?utf-8?B?SWNHaVluOHNkMnl1VWhORE9MdmRJdDh2R3dKenFJdDBTT2JSS3k1ZzQrYTcz?=
 =?utf-8?B?V2V2NUhiTlI3cGxzeWREWjhBQ3Y0Y2xJR3VIRFBJbERmbWVaSVByT0dZbGI5?=
 =?utf-8?B?bkFKTnN6ZHRlUGptclRXM2J5VCtxakNPUmRiZ0piVDZNRytidlZIV2F5S3Ix?=
 =?utf-8?B?dlpHd2VOS3JoNkNRQmlCeWo5d3hxRDgzanZjQzFkNDF0NzZpN1B5dXJkMGU0?=
 =?utf-8?B?MWhuZkNPZGg1RmNuR0xRMERPckxudXNEMGR2YUUvbk9ZdVJyZXBpVUlGL2NC?=
 =?utf-8?B?ZE9tQVVwRG0rSFl5ZklSQnhpME9tV0p0Z0lqYXhXOTNod3FsUkg2bUhiTStY?=
 =?utf-8?B?bFF6ZXF6Q2loVU1mTVQrVTBLNFhoUlR2UlpWUUcwTlh3WlVVMXd3Y21CRHFl?=
 =?utf-8?B?d3BvYjdBMHZZQ2J4U3VSVFo5YWp2TTBHdFYvTzdXZUZ6K3F2TTJoVDlac2lE?=
 =?utf-8?B?SU1HWE1uUUZGaW93elBadmc0NEZ5MHpySHVKMk9XMS9mQ3hxWnpNY2tic01C?=
 =?utf-8?B?ZWF5TTh0R3RUU2s4S3FzdUdZRmE5UWtRK0xWTGE4RUUyelMzQWh0eHNpdkds?=
 =?utf-8?B?UzBvK0ticjhzL01tODc0TjZBRTZ6cDBEU3hJdS80SFJGYWtWSHgvMkhyWStG?=
 =?utf-8?B?WjUvUzZsZ0ZCaW5vZ05KaGRVNzRxcWo0a3NaNk5QRlpLZ2U3TUJiVmlYVGtF?=
 =?utf-8?B?RFlrcVFjRTBGeGFDMDc0Ym9KR1VzcEhQUjVHSEVYWGh0UGJ4eUpjMmdsV050?=
 =?utf-8?B?bXBhcTlYSkpEU2VMM1FCdEJhY3Rudzh6NGwwekF6VDJPU3VHMndiN3JsQnF6?=
 =?utf-8?B?TkdPMWhLbGtVWU8zeUtibW1yYVJpa0JRWTZRM0NEcnlLcEFRN1REcmgvWExm?=
 =?utf-8?B?QjFVTXFrTTVLYnZxWkduMEhESXlrOFlMeFBTNm96T2ZKTDM2Mm9nNG1nbmtx?=
 =?utf-8?B?TlFpNzYyYzZlVVBIZTRFdDZad1Z5UHRGNnY5M3BsZ2xGUW9NdmlJaTducTlu?=
 =?utf-8?B?L3E5ZVp4WnpiYzFtRHN5d0IvRmNYZTNXYkZ2VGxNRG53UUZJU0YyT2h3SjdM?=
 =?utf-8?B?UUtzVnpvVm9ZTW1TNmY1UWpLa3I4c0RYY3V2ajQyUEtQRWxVUTBEa2EwZUZv?=
 =?utf-8?B?K25jUSswOVA0bmp0QkdUVEJyeUtCY21PaW15OFoyY3BORWYwL3JqRTRsRXYw?=
 =?utf-8?B?OWQ0RkNScURoek9hMERzUnMrQzhQdTZSWk9DVGlkSm52M0l3ZEVZZUFWOUU3?=
 =?utf-8?B?YnVrMENsdkJoWGVhT1BHbVlpbXprU0dOU2VtUnBYaDFuV2tRZEtOc0xrUkdG?=
 =?utf-8?B?QnpGeFBKclBDT0psc3hiMW5WYU1VdDlWYlVrSlh0S1NRemxvOFcrdXQxYStw?=
 =?utf-8?B?bWlWbzNMNi90RlNPazNUcm9kMU9JRk9ZYTY3MzJFdUxIN0xpSDdQYWI5NlJq?=
 =?utf-8?B?TjBWQmVxSzFlVURUandPSnE2aFhlcUZSQU8xZE1RWWs3OVNFZUUwL1AwMkl4?=
 =?utf-8?Q?OvK/LU+gBeeseu48riSoXXYQw?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6909c22-f300-4bd3-a8e4-08de01b8ecaa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5223.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:38:09.6428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGp1G9P8Bs+mTkYr45bbZiXOc/OC5HfHoXDKrWlatNSh5MFlWD11eGzR7DjdF1GNzEEr7sUgKWOheJrxXfiyQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5412

On Thu, Oct 02, 2025 at 11:37:36AM +0100, Andrew Cooper wrote:
> On 02/10/2025 11:22 am, Roger Pau Monne wrote:
> > Reading from the E9 port if the emergency console is active should return
> > 0xe9 according to the documentation from Bochs:
> >
> > https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html
> >
> > See `port_e9_hack` section description.
> >
> > Fix Xen so it also returns the port address.  OSes can use it to detect
> > whether the emergency console is available or not.
> >
> > Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> That's been wrong for rather a long time.  How did you find it?

I came across the documentation above and I didn't remember Xen
returning any value for reads, which sadly was indeed true.

This was because I had the intention to suggest Alejandro to (also?) use
the port 0xe9 hack for printing from XTF, which should work for both
Xen and QEMU.

> CC-ing Oleksii as you've tagged this for 4.21.

I was told that bugfixes didn't need a release-ack until hard code
freeze, which is the 31st of October?

Thanks, Roger.

