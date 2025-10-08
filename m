Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A55BC5776
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139832.1475062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VM7-0007UM-KT; Wed, 08 Oct 2025 14:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139832.1475062; Wed, 08 Oct 2025 14:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VM7-0007Ri-GZ; Wed, 08 Oct 2025 14:41:27 +0000
Received: by outflank-mailman (input) for mailman id 1139832;
 Wed, 08 Oct 2025 14:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tb2B=4R=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6VM6-0007Og-S3
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:41:26 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddbb947f-a454-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 16:41:26 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BY5PR03MB5169.namprd03.prod.outlook.com (2603:10b6:a03:219::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 14:41:17 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 14:41:17 +0000
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
X-Inumbo-ID: ddbb947f-a454-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzepo3xFE3CmsRz20Roz6LClLbYR2uln63G9oq1BSfts9YrLkdqZd58dlNwjY/Hxa7thRVaGAXo7gjwmQd/irMiVHVEDIlRY0U4x+QpyTe4JG4VZkYJH6x4MEH2YrNvrkTtbIB/36jajyIi/gD8tLNzeW/v2YXGrTyhnw1ztR8I8pczD+e1D1XjQ72zceAbQFuYJvsoJ824yNA3j8mf+mH9L5NZPJ3K32A8uIWQvxvur7PKXur3wvA/Ln0FWMZEikjSJCnOxdmstYrPxWzQqSgbHZJOb7TN8UizahTOaq+t1kFq5lRn8YzdSZHIg0QQOxa8u56FsM5lPya7HB4jSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xohly5CWNWainmTL8adCfTDxe2GHXPt+BRmH/FDh7gs=;
 b=x9ozAGlAp+WcHjdqNkbPCb1HkB1l/O8xMcgt/FWm/t3LQSy1NNIbGmNgbLzpVwESMKtzV0ZegbXxDwdLpRvpIXwdb6szJWQBGkuPlK/U/sxvmvbTENdzK1V5CuF/rfBzuf/lByYXkjpkI8X/mpE/H9bVo68nNFbHRTo1pf7A5ttn6aj1n8wrd3i1E1MfJolc1nqdsMt1wGnt07MGVSK4wyz0ELXOR3ZzWOy12zHNDPWUM2PycDpAIl6xSO9vh1NiyPMYe6CXW1ezdMa7cGyy3GpFaEspaFk1yayGSxeDY8IlKxifbktpKBOpm/l3QrhM7pa6p78X3/MvAf7+vfmqpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xohly5CWNWainmTL8adCfTDxe2GHXPt+BRmH/FDh7gs=;
 b=TNSyxhP8e+GP+GFONJMDdSX8WA+4xPpqblcCRbWH2cG5bSrH8A9uewMoTTTHIO36oTezW9zWqp8hcmlib1CXO5uHlyUnVv6DD/Tdu1CKwQu9GzqOlYR4zTFlqBAXJME5N4FIIWlodiUVDjlAL2r1gnNNrDmfneeIQxkJOoR3zzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH for-4.21 v2] vpci/msix: improve handling of bogus MSI-X capabilities
Date: Wed,  8 Oct 2025 16:39:23 +0200
Message-ID: <20251008143923.2557-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0187.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:376::19) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BY5PR03MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: 09559e48-1015-4d0a-1227-08de0678bcf0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHdkaUswTlNSQ0NKdnpHMzZWMzJnVGZ6VDlUQ0tEdlVQVlkweFRPZnlVdk5n?=
 =?utf-8?B?amNIQnJxVVRvRWd1WjBIVzNZcXdpY1M0OHBnZ3pMd3Nnamd5QkN0SHd5aVRB?=
 =?utf-8?B?T2ZTOWNCL3pzVzViaGcyT3hSSmp1a3o0S3FCQm4ydzd4RDY4enVlVVFqZ3Bx?=
 =?utf-8?B?SS9yNnYxVy9tMTJrUlhQY2J0Y2UyZU1uMitUS2gxZzRCVnZwWUZHRCt1RUZO?=
 =?utf-8?B?amNHcjVWajloMFFQOVlRZ05yNGRBZXJvTG5razNBVllHTFBFVWJtQnhIUjFw?=
 =?utf-8?B?VUJ6SkpIdUR2YXlrd2NnVm93eC9vdXpLcU13eHJJbjFlS05yZGM0cEhJQU9V?=
 =?utf-8?B?VmFFSHhtVWVIMS85ejQxRmhneTRvVEcza3hoM245RlU3SkhUS3E2MTZtMGRy?=
 =?utf-8?B?dzYyWkRyc3NYb004RUVkKzZwMUt4N0ZIaWVjNXVzck9qdGlxRDh5ZE5hL2do?=
 =?utf-8?B?Z2lKdzNkSFRVVGlVTkxBdU9DV2RJU3hBMnp4bncyS1k2dHJaOHVHaDdIUWhF?=
 =?utf-8?B?YmxCWlVxSkFzS0tGR2VqaHY3ME5XbnB0OU11UDByRlN6MUVTblhrU3ByZXhC?=
 =?utf-8?B?UExhVnRRa0RBakdRakdjTEREb1NubmxlM0VRY29aTFJTUklITWg0SE1ob3FN?=
 =?utf-8?B?U1JwQkZmb2ZHclBjRTdIWGxlV2xnY2dqRkdSTXFsT1JnNmJMdnFYczdoN0FV?=
 =?utf-8?B?REtQc0xXUVM3Y2FKdG1hKzRMUWY2bHZXdklCMkVpVGNZeWpEZE03cmV3NVBL?=
 =?utf-8?B?WVQ1SGUzTmZtSEJXbXB4NHZKR29tbVZmZWxaUUVqbS93SXR4SnVTakM4YWN0?=
 =?utf-8?B?aVBBMVZ1WktFdHBncnAvSmcxc0ZTMm5rQ2FQT1AweTYzZ0kxZDdVUzhOMThn?=
 =?utf-8?B?VFc1TDZ3blhMdDZ3ZjhjVDVyTmpyRXpvMFFOaWdpcUxWc2pXUWZRcG1qdjBX?=
 =?utf-8?B?bnR2aUR5cFl2M3JRWEFzZ1ZnQVBJM2xGRDRVUlNtTXJGV1NLazlxbUVJK25W?=
 =?utf-8?B?RXVHR2pYYU0wbkhYZmVnZThsbWRSdkRieFdPNUZIY1lEdVNTdk9pTDNSazl4?=
 =?utf-8?B?MEllTU9lTGtBaDg5NE55WHVxUUZZdkVhSDJ2RVBuQk9qM055ZXNLSVh6N1g5?=
 =?utf-8?B?ZisxQlVxbWRWeGZucXM1cWRFSzNVQ1FSWTNENm9aOGlZWkplSmNBYllHdFZ0?=
 =?utf-8?B?VVZVOWxubjMreGZaT1hlenpLZ0poUWVzbzlRTlh3Y3hkWjFMUzNxekRsNkM3?=
 =?utf-8?B?cm1DcVhYMDc0QXlzM2NRTmZQTmY4SmVQR2ROTlpVeWU1Q0Y2V3l5ZXRqRjBq?=
 =?utf-8?B?WmZiMUVMK2dKR3NOTXFrOGoxZHZtQU9WTVFqZjRqQ1RXMmRKb25HcGpCZ2U1?=
 =?utf-8?B?K3phM3Fmcll2S2xJZVdNdm9LOStRanhmQXNaZjNQU0djSVRMVUExVERhVE1n?=
 =?utf-8?B?bUtQcjVEREcwSG5TbC80S0FGZFhkQTliNnlEWnNQTlNKSUs2NmVZVFlaVUxv?=
 =?utf-8?B?OGxNYjJ1LzZTekpjTWZORnhRRlBqam9FVEJKWW9VbVAybmNvaGhlQ3R2am8r?=
 =?utf-8?B?SENLQzROTGx5QWZON21SL01jcjAxTVB4N1Rtekp4UDNrM2Vya3U5cmMramFU?=
 =?utf-8?B?OTNqZkR2NHc3ckxGa1R6ZzcyYk1DVzF6MkVWSDhuZDQzVG8vTk1mMTNyWHQw?=
 =?utf-8?B?a29LdkxKLzJnS3ZBVzdEWTdmZWZhRXN4eUxkbEVFR0tDV0Z1cG9Qck50cFpw?=
 =?utf-8?B?VkxvTzZnTUlZa2pZcHhhSDlOV2VHV2x3TUtnV0VDYlIwUmxpZGQxNFcxaW4z?=
 =?utf-8?B?S3d4eWV4dGpsK1Z1ckF6eWpXYUxsTGFTUTViL0hMNE9EUjZSUTlNTDRPM0gv?=
 =?utf-8?B?ZGhMYjNIdVdHY3BLZkhVbTdDRjU4d3BUWUtEQzlpWEc4TFpIUE45WUNWWExR?=
 =?utf-8?Q?dlnllH4tGDR6TRgS66URiBvNcDF5Mg3R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0picW5SOVI2b2VtdjR5WTBiV3NXY3ptNHBlTmM0bFFSQlkzRDVGalNZb09i?=
 =?utf-8?B?L2JTY01RRjhoekJmMlNqVTMwZlcwaXpUWSsxNFlJKzVCbWZndWIxMGVGVTdO?=
 =?utf-8?B?S1EzNE1IdGFQTmpiZUptTHNmKzFQOEhteGYzU0NEOEVqYjBNME5ISnhoN1p2?=
 =?utf-8?B?dURjY0dmYjlUTUt3dGNkcG5xa3c1d3J5MHlqS0QwMWVBblRFYzhWUEN2OW16?=
 =?utf-8?B?Zm5iNlNWS3I5K041ZklQYWIwOFkyVGlsTE4rZjdaTlU0TUEvQ0JPM2lwemlo?=
 =?utf-8?B?d21uZVUvbURndGRvOGhKYUJXNEFYZ055QXRleVNla2tieS9DMDc5RWlCOFVW?=
 =?utf-8?B?L1lqNHZGYTJWK3V5WSthM204NGxSSnF0U1YyclRIdUkvR1F0NVEyMW55NWxT?=
 =?utf-8?B?clpaQTM0NDhPMXdubm82YUNpSm5HN3dhUWYzZ3c3ZXord1hlYW9XbUdEcEkz?=
 =?utf-8?B?OG54OG14K2JDbktrNlNtOWJkNVBqUElkaUV0a3RxRDRoZFp2RU9KTU1kdXVY?=
 =?utf-8?B?VWpYL2FzK2V6UUxWT0ovYlEvdUxEQ3l6U1Y5Q0FrYXpTaGtOTlBvaTBucW9B?=
 =?utf-8?B?M01NTXIySHpPRlRaZENsUW5SZ2lsUS94YlJ2dlBHSzBOek1WSmtQL2lueTZj?=
 =?utf-8?B?bzJ6S2lFMTYwYkRIcktTY3dHelpFUCtDdWI0RVo3bFBKdm13MGpuR1p6MkhM?=
 =?utf-8?B?R3d6TG9pdkM5YlFtdmMvUExYTlBmaHJuSlNPaUxLQTZYTlZOUEJKMVI2T2FF?=
 =?utf-8?B?ZUE4L1JqWGVoNDc3cW5JNC9qbE9RRWtKSS9laWpoVktuUFZ5ZHpzQXl0MWFi?=
 =?utf-8?B?WUV3WXJVKzMvalA4OUx4RmVxNUM4WHlEdzVlR1NkUHB1cC9HRjFIQzhpQ0dZ?=
 =?utf-8?B?emd1S003L3RqbVljS01IeVMyMmdTa2tqOCt6V3RZWDk2WGZ1M0x2TW5haU00?=
 =?utf-8?B?Ny9GaUVhRkpzUE5KaGVxQ1p5TVIvZjdVYk9KNloyNCs1UGhuaUVBSHptMFZN?=
 =?utf-8?B?T25wdGticmZQVDNZMVRQOHoyT2xDOWl6UEw2WEk4Rm1BUnF2Qmt3aXNkOEEw?=
 =?utf-8?B?cVgyby91K0xraHRFalNsUjlsdm5YM1BaRkp5VVEzNTJyN1VQN0p6WU0xL051?=
 =?utf-8?B?RVJUTFVxUzFvQzVJeFloRHVwY0ZwNzBnMVgrWm5Na094RmJlcVowa3p1VGFZ?=
 =?utf-8?B?YkkvT3Z2OU9QK1NlZXZYaWMyVFhQNmU5QTRaZTY4N3RDRVFCL0xMNExxV2dE?=
 =?utf-8?B?Si9DRzBFK0orRzBzc1I2WHFpNHU0Z0hSNU9PdStwRWVYTWNmekxnSDBYNlIz?=
 =?utf-8?B?MzMrdWZ5TXZOOG15TzdhTGx5NGh2WlJnV1NpUlFlQnU5a29JR2FQRmZ2c20v?=
 =?utf-8?B?RUtaTWV5Y0pRYXB0dmE0YlNyQnllREpuV2lJVUhQZ1g3ek0zbm1scDlpVUJn?=
 =?utf-8?B?bGlNaE5NNFhBa25VNmpKYzhxSytqVzZMc3F0ZUMzM1NRdHNabjhJVzNuQ2RT?=
 =?utf-8?B?c05yVzRPMWN1NGtQa2RCRTh4b1RYMVlIVXhlcUtpaGtCVytsYUpTZ0hjWWIz?=
 =?utf-8?B?YU1nQUNEdThUWlNXTHA5M3dlZ3puM0hRWDN1YldOSXlGSUljTnNaTTVoZnNi?=
 =?utf-8?B?ODArb21sc0c3TU0zeUYxSXZLZ2k0K3J4amx3Z0ZKQSszNEtIMjVOVTlHSmEz?=
 =?utf-8?B?NzB1SjJpRDd5ZkRpdVhUbjhXVzkrWnlZeHRNbXF1RTRXU0pVcUVKczkvY21s?=
 =?utf-8?B?QnkwN1B5ZjV0aUcremtqcjVOeVhtUm93SEZGVitxZE1UK1N4U2FJZWJVY3U0?=
 =?utf-8?B?blM2dG4zTDZqYkJLbUpBUENkM016Vmk5STVQRkc4L2VOd2kwdHovUndkdVBv?=
 =?utf-8?B?L1BhWTJrQU0wK2NVN0M3YWg3dGxPaDB4VE15V21reFByOWZrTXpJdnFEckpI?=
 =?utf-8?B?MWxyNENZc21RWThidjVZaVl2a0FVTEFhK1E0Y3RGS1BhUkRiSkhIS1lvbmFI?=
 =?utf-8?B?V01sU2dTV0tBTVYvTHBQK0plK1h6ZEJ0RXEzUjZ6cFZVNzJ5NkFDVUU0Ympi?=
 =?utf-8?B?Q2J4VlphSzljd05WekUzVVdGb29sK1ZISjJPeWZUZTFhMStNVGxwYnhuZUlZ?=
 =?utf-8?Q?LedczMDokqOdWTPGl7uGZ2plg?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09559e48-1015-4d0a-1227-08de0678bcf0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 14:41:17.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BCmVmVUcpqcsZQpVoc+R946V/tHWtCs8DoRZRhzKzlqEhSOGdFb15DomE2opXnRaBXyyagUwpJJh8lYODhMDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5169

I've had the luck to come across a PCI card that exposes a MSI-X capability
where the BIR of the vector and PBA tables points at a BAR that has 0 size.

This doesn't play nice with the code in vpci_make_msix_hole(), as it would
still use the address of such empty BAR (0) and attempt to carve a hole in
the p2m.  This leads to errors like the one below being reported by Xen:

d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area

And the device left unable to enable memory decoding due to the failure
reported by vpci_make_msix_hole().

Introduce checking in init_msix() to ensure the BARs containing the MSI-X
tables are usable.  This requires checking that the BIR points to a
non-empty BAR, and the offset and size of the MSI-X tables can fit in the
target BAR.

This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
EPYC 9965 processors.  The broken device is:

22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)

There are multiple of those integrated controllers in the system, all
broken in the same way.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Released-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v1:
 - Introduce a DEVICE BUG prefix.
 - Remove extra newline.
 - Fix typo in commit message.
---
 xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
 xen/include/xen/lib.h   |  3 +++
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 54a5070733aa..4ddcefbcb274 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
     if ( !msix )
         return -ENOMEM;
 
+    msix->tables[VPCI_MSIX_TABLE] =
+        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
+    msix->tables[VPCI_MSIX_PBA] =
+        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
+
+    /* Check that the provided BAR is valid. */
+    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
+    {
+        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
+        const struct vpci_bar *bars = pdev->vpci->header.bars;
+        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
+        unsigned int type;
+        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
+        unsigned int size =
+            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
+                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
+
+        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
+        {
+            printk(XENLOG_ERR DEV_BUG_PREFIX
+                   "%pp: MSI-X %s table with out of range BIR %u\n",
+                   &pdev->sbdf, name, bir);
+ invalid:
+            xfree(msix);
+            return -ENODEV;
+        }
+
+        type = bars[bir].type;
+        if ( type != VPCI_BAR_MEM32 && type != VPCI_BAR_MEM64_LO )
+        {
+            printk(XENLOG_ERR DEV_BUG_PREFIX
+                   "%pp: MSI-X %s table at invalid BAR%u with type %u\n",
+                   &pdev->sbdf, name, bir, type);
+            goto invalid;
+        }
+
+        if ( (uint64_t)offset + size > bars[bir].size )
+        {
+            printk(XENLOG_ERR DEV_BUG_PREFIX
+                   "%pp: MSI-X %s table offset %#x size %#x outside of BAR%u size %#lx\n",
+                   &pdev->sbdf, name, offset, size, bir, bars[bir].size);
+            goto invalid;
+        }
+    }
+
     rc = vpci_add_register(pdev->vpci, control_read, control_write,
                            msix_control_reg(msix_offset), 2, msix);
     if ( rc )
@@ -686,11 +731,6 @@ static int cf_check init_msix(struct pci_dev *pdev)
     msix->max_entries = max_entries;
     msix->pdev = pdev;
 
-    msix->tables[VPCI_MSIX_TABLE] =
-        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
-    msix->tables[VPCI_MSIX_PBA] =
-        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
-
     for ( i = 0; i < max_entries; i++)
     {
         msix->entries[i].masked = true;
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index c434dd5f16e4..c4ac4823920f 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -60,6 +60,9 @@ static inline void
 debugtrace_printk(const char *fmt, ...) {}
 #endif
 
+/* Common log prefixes for platform related issues. */
+#define DEV_BUG_PREFIX "DEVICE BUG: "
+
 extern void printk(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2), cold));
 void vprintk(const char *fmt, va_list args)
-- 
2.51.0


