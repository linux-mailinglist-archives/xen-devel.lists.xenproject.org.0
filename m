Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61050BF0021
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 10:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146030.1478517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAlVQ-0006Na-2X; Mon, 20 Oct 2025 08:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146030.1478517; Mon, 20 Oct 2025 08:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAlVP-0006La-VA; Mon, 20 Oct 2025 08:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1146030;
 Mon, 20 Oct 2025 08:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vAlVO-0006LU-VD
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 08:44:39 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d75b9a-ad91-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 10:44:37 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BN8PR03MB5105.namprd03.prod.outlook.com (2603:10b6:408:d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 08:44:33 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 08:44:33 +0000
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
X-Inumbo-ID: 01d75b9a-ad91-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBFAAxYaFXo5W6CvZx/DZpJptSVEwF6V2m2AKisl9R/ftBISnl5QRNxQdgjcqVyd85wokt/6O+LniiLU4fZ6p4mNtL1T6E8D1ylycdGcg+hKhDzgR5qJsiY/HYR5BW9ilZE4KqV/2I1a8q/jxQTeAtBCD0HWwvDnpXbF2mbKh5HcPt2DVU0ORYfquPQdYILtlm9HViZXVHhRf63wOlzrOIISpAHe0sgZXkUWs+B2/PmLtHcSmjN//ALErDhAoRwvaNCx41cxJVzbxCAkPwDFksnW1Lxf3bZCnS3DcsHQsVM1nP4zmZz3+MhFnMDo6myT0QpA50hl8P1N6OvNz14jaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6y6fC2D3pRQcEtFl24XaertPUovKtXxTty5LotGOpc=;
 b=PmexT2AaJOVJLkN1pk2vhsnT4T0/rs/tAfJ//0GNKtMJPIwk97PfRHAXo6U1cktrd8sQwfBSURTbKF+jqwYfd/EX9sZo3UU6TM2Rmjwkx8MxswYUzDozN8chH35nHApFV2N1lWKnocA8uPsBAmDXuzdwxK+B4K0KbMb+RF8X6HccuGAywX8Od/o0X0/CaejDV4ybSAXSxrmCruCLn5mEqF1Df67m/L0AFt76Ysif7eGyulLU0DjdK+BHJ43Cab961fRHVlku19vex84aDugrjD2JCcs88yEWiTtTb+vdQnqVrhjBZNtD1vfGBtMHLDyutCmF25WUDXcDl8ml1QFYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6y6fC2D3pRQcEtFl24XaertPUovKtXxTty5LotGOpc=;
 b=iTFgQcq1QtBHfXwCcved865QZYhSfN10469ZQdIecjsAPVymAdpcdNM0Th12wGCPixpIuRE62O2Hi1HxvfOpjoZwISqjVG9Au7jEFkePTJKVUEod/NTEih+OOFwwdzEOH+aJ5koRlbnVgtH2Ldodgh6yOfjORVzu2dqBSbuUmL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 20 Oct 2025 09:44:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] x86: make Viridian support optional
Message-ID: <aPX2bbm2Zaa9o1hs@Mac.lan>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
 <DDH3W3VM2ZDJ.PMFSGBWBTS0S@amd.com>
 <9248eda6-cf9b-4fdf-ab32-66e777585f65@gmail.com>
 <DDKPUZKA0UHL.2WRO9M23R4G3E@amd.com>
 <a7a2b126-489b-4bdc-ba0c-d0c92f8df822@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a7a2b126-489b-4bdc-ba0c-d0c92f8df822@gmail.com>
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BN8PR03MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: fe781176-a31b-4e08-90ce-08de0fb4e3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGM5VDlqcUN0SU5XL3RGUVFpWjR0bTB3R29weVk1cVV0alE2b1pFYVIxMDhN?=
 =?utf-8?B?R1F4N3duZkQ3bCt1enlIQTV1RjlsTGxRVjhxUVNSTFJ6enlMMXVkNjJHZHZU?=
 =?utf-8?B?dUh5c3hHT0IzcVp5Uk90VytJcUdmV0tZV1d1Qm82N3ZWR0Q0QzcrdUZDNzlw?=
 =?utf-8?B?am1NK2l0eUV2UHl4R3ZKTXpOZXdFazFlREQyT3g5RWVrRVpHNVhIOFd1SWlh?=
 =?utf-8?B?aVlDSFZLZitJMHlpZ3VKcVh1NHpaREpsSHJMc0tJZXRONUdCYURKdjg1dFIr?=
 =?utf-8?B?NzRMbENPaGg4UDhSMGU3cEhIMTN0UFJpajlGT3kyb0ltYjRXemQxYU9jRUdY?=
 =?utf-8?B?NHV3R0ljOVdKVExURTk3L040Vi9ud28yei9nWm9seGM2SGthYmVRdEN3UjBJ?=
 =?utf-8?B?enBKSU54MFU2eS9iSk1ZVlNrRHFXYUV4R01ZRXlYdnBubjBlemdRaFdLNm9W?=
 =?utf-8?B?WExxdS9UNGs4Y1VxL2RTa3NqOXZrM0FTM2FmTStaSnRtL1ltQisxbnpmamlL?=
 =?utf-8?B?SVp1R3czc3lCaUZDZTZSNmdzd1pycVpLVnNvVmdPbXhpT25sdVM1d1l5em8v?=
 =?utf-8?B?V25aSDFBZkJBUWVLZ0owRGRFdjh3Y1FIdkExaVVoMVU5bU95YklpSkV0bW9h?=
 =?utf-8?B?RVNRZUpHRFlTL3FVRkFXUmRIdkFQc25YYTFlMUszR3QxaFYyOVRkOEFXQURi?=
 =?utf-8?B?SU9IQW15alRCVlNjRHN5QjNTaWlHd3NGdE1JUUxpemQzVkx1K0tqb1FhWGZ4?=
 =?utf-8?B?NlBKNkIrT1E3ek5FZVJZNGtwNWtoU0hBcy9BdkZqbUZVVk1UR3pxcU1iNWwx?=
 =?utf-8?B?RWxZMGg5UVBHaDBUeFdNWk9VWVRvSkZqVk9WR2dOTitBbTFjUGV5azllb2d6?=
 =?utf-8?B?OTNhRzdmbzFsclpmbldHUkRiMG5LVUZZazU1SHEzallwYlNnME9xcGo3azkr?=
 =?utf-8?B?b1VNcFhCQ1daRFI1QlJUaXBWZ0JkMlVlZmpMTnBweTg3aWFod0pBcmJpSG9h?=
 =?utf-8?B?VW9ZaDZmenlzMHBnMWxmTnRIdWdmb1JKM2pFYzhySEV5bVgwSUhxblAyaldi?=
 =?utf-8?B?MlgxNE82L3k0dnpWK3hSNkhSOE5oWGFtUkdPN2pMRFcycXRvZWZZNVg5S0xZ?=
 =?utf-8?B?TXFKWjkxUDY1K0tGYTZqb3dINTA0bE9vVXgrZU40anRLTVFSKzhldTc2MFZT?=
 =?utf-8?B?NWpyK2Q1ZlcrT3JMbndQNnllNmZXZDRoajlwWUM5OWowcWo3SjB6NE8wbzFM?=
 =?utf-8?B?N0JVbk1tUlA1MW1yVE9abWVBc3pCaTZ4OWRPeHgxcGdEcmtaK0hMbmRLdThG?=
 =?utf-8?B?cFExU3lscFpHbXFJUGZ6WjM2eHhkVDRiZWszWHBaTnlXRi82K203UjllZC9y?=
 =?utf-8?B?aGt1NzVOZUF2aFdCbk0zU29SbXYvWkFmaGR4c1dxWDE2RXU2WkdRV005UzVy?=
 =?utf-8?B?M1VtZm5ka2I4QU9WdkloQitzRmYwT3hPRnRrc09uTDh2eWo2cUg1VGladFQr?=
 =?utf-8?B?b0pidWpPdHUyR2VzbzVxK2F5RHcvOUdzbHlJYlpOTENmZDNpeU03RHp0OEwx?=
 =?utf-8?B?RkkyTVZhYllYdHJZMzdURUMvbjRNMTZKYm0wQkZoS2prZG1ZcUFNdGdsZVhy?=
 =?utf-8?B?eGFXVzRTUkFYVUtLcGkvQlhybWxieGM5YU1HRFEzbXc5U05kUG9kTHlkOFBj?=
 =?utf-8?B?bmg5WUtwaHhqblA4bmpOREZKbklMVmplMjN2aGJIQ1hpSmFlWDllb0VBWnJI?=
 =?utf-8?B?bGNpanNWMVZxK0FNSTdFYmF2VXZud3M2TE9ybUlhTlEyQUhOdGpQU3F4MWxJ?=
 =?utf-8?B?ZmdDUUlSV1NjNTd0R1FXbEtnYnI5SFRrZSs0NFpNSGJQQjB0c3RtMzg5UVZx?=
 =?utf-8?B?ZFR1N3FmdWh6SjJ5TUxPRGJEQ2ErQkJYVVUvTStOTjNYZEpyTDZEaUdIbWQr?=
 =?utf-8?Q?AhBDIAO3NlBkgr3TkF3258k5RgUEVqdC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SC9XOERJOHBkd3hTRkNsZEFuWklVSHpiTEI4QTdzWnRIYlVSU0kxWXJMWlVZ?=
 =?utf-8?B?Nmp3L0U2TVVsa2xzd1hsV1o4VTdZWEFUYTd4NGNLdDBEMTJJb21LSTRPYTZi?=
 =?utf-8?B?bURVbFJPOTExbjN0QUFpanhUVHlwbm1BVVFheXI1L0V5emdVS0R6Q1o0Nnd2?=
 =?utf-8?B?ajVUL0dndlhMVEhITkpoUjJWdXZLUU5vTU42NjAyRkMrbHNML2llRTk2enow?=
 =?utf-8?B?NE05YnB4T3B5NWFHWExFOE96T1Q1UjNET1V1eU0xNGx1VlpyK2NzRjBWMU1h?=
 =?utf-8?B?ZGw0NU5iK1lzK3Z1QVYrVWhoM3hjYlRZYXlaRmhnMDdxR2kvbUxLRVdoWTQ0?=
 =?utf-8?B?YnpkNkFOeFdOOVhydVIrVnc1aUJGTTFTK3NNQkFVUXFabjM5dVB6TGJ5WWtS?=
 =?utf-8?B?VWNQUFNBcWVtWlk2eFp2aGgxM0RVRklUSGFnNmxLbC9sSjBwQ2hUT2FmVzFV?=
 =?utf-8?B?cXNZT2k0SGJLaGJjakpiK0ZsdXlSYy85SDZjRG1qVUMvWkN6cWJvU3lBUzNB?=
 =?utf-8?B?cmpRejZlWkUwbmJvNnZXRE9nZHM5VTZEcnluT3gxZDNOdytra3gzRmlHMUt1?=
 =?utf-8?B?Y1VNcFZDSVMrR0JjMGVUdldGcG9XZndQZkV0UVA2bk5QcjBxMC9IQ0xkVWFM?=
 =?utf-8?B?MHhuSVUxMGFjRHlML2UzcXlWd2lYWllWeDJiSnVVRU4wQ2s5ano0MFZmeHd4?=
 =?utf-8?B?UkV5V3dxRTBzNGMzWHQ2Tlc2M0t4MTUrekRoT1lHSUQrckorNXBxODdiV2w5?=
 =?utf-8?B?VDhBMFJzdWprOEtoNDRmOHgySXBHZmxRbjdrSjZIa29ZSFQwOXV2Y2c0UlFk?=
 =?utf-8?B?UzBBNHV0UThjTVVWSVVISVh4WGpoMGVOb1Jsbng2QVYvK1JUOWdHa0tkZ2V5?=
 =?utf-8?B?Q1U5MXlqUWVqeFlrS3pMYnhsRGFZNzNBNjh0OFJ3QlFZYTJyMkFlVnAxR3kv?=
 =?utf-8?B?NFNPekhBUDZMcG1ZK2xYK3YwRmpiNGt4d29QR2VSWDFJKzJqREdCSnprY0ww?=
 =?utf-8?B?ckFySGFESk1DQi9CeXNKcDI2OHB3M2lYeW0yUlJRS09KQU9hd2FTaFV6blFM?=
 =?utf-8?B?Tm55SXJsTzhMRmg3OVJOT1dERlltUHhvbDkxS0lDUXdLdHJOeDBNczZnWkNi?=
 =?utf-8?B?YnR1M2I4aXBmNklvQ2lOaWVHYldsMDgwRENFb0lFdWlkemUyNnZQZWhGYlFP?=
 =?utf-8?B?ZDdlRGJpTldvWFMzWGxMbG5YZWNTeXoxOHVnWU54Q2xwVTJkV092Zm0vNTY1?=
 =?utf-8?B?VXl5YTdQeDVmRkRLKzg0SnQ2RjNRUGVySjJmNE1QTklyWExwY0ZpdnNJWUV0?=
 =?utf-8?B?VDlHY0VFTmk4MitPYnN1WHVwTlozQ3F2bTNyaTVrSnZ6aEl0S2plVGdzTTYv?=
 =?utf-8?B?eTduZGJ2aHlDcDBIUEYybThveEgzbDg4RDBJcjhiOXpudmR0ZGxpR1pVRW15?=
 =?utf-8?B?dlZ3K2tMQ2RyMkNybVhQRnllYWZOc202d3BsaUI3WjcrWmdRMGlwRzVhWEhM?=
 =?utf-8?B?bkNJUlRIc3pIQmVzUGEwZnBTMDRXUXJuckh4OU1kQnppN3MxQXcxMEg0NUpi?=
 =?utf-8?B?eXVpRGFEeHlBZDIyU2YzVG5jZXlKa3dXS3pSeElSYW1jcWN2M2hhWlQ3c3N0?=
 =?utf-8?B?eEFVYi9ZN2xrV3JtU3hLQjd1ZE1mRkJUS1dXeU5UVjJCUzA5L3ZaeHI0bEY5?=
 =?utf-8?B?T2ZYWkI1d3FrZkdQdklWVjd5SllQb3RVYUZaVkxSR0lWazB0aVpCTllaUWRF?=
 =?utf-8?B?TWRBTGxCaWlmNlZDdmhaN29NL1BEMkFNVDRCT05YMjhRQnlmUWUrUkJuMzF6?=
 =?utf-8?B?TlFmSkxOL0YwV1dUZTJRUmJKNElKMXhuYXlDbmxNRjZkRjRheFRRUW5TMTRW?=
 =?utf-8?B?RTBSbXdMazcrTS9RMCtxdXE0MjVDZ0Rvc0pUVVlJR2pocy9KcWRYTkFoY0Nu?=
 =?utf-8?B?a3hvT08xT2FpU1creGdZTUo2Z1orYmNCbzdmT3hsUkxKSjVsSnBTZlhWb2F6?=
 =?utf-8?B?US9jazM0ZnpWbmlNRkl2ZHhHcTM0Mi9nbzJnYllidUREOEtWWEdEQ251TllH?=
 =?utf-8?B?UDl3NXBiUmxpbjFSQmxiejJHRk1rcldzTFJYTktwU0dYZ2pjRGFhUFJnMWtQ?=
 =?utf-8?Q?mNZq1i8zP8j/Dkw/9Ks6TK73f?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe781176-a31b-4e08-90ce-08de0fb4e3f3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 08:44:33.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uS354yAu1wnIPUrSkeyGoW6t/ijX0ZmrId3bSH2vLnr5W4/Fmcw9S2giCXwkSybpz1KcHxtwV+/gom3xPd5sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5105

On Sat, Oct 18, 2025 at 09:21:37PM -0400, Demi Marie Obenour wrote:
> On 10/17/25 11:52, Alejandro Vallejo wrote:
> > On Wed Oct 15, 2025 at 7:58 AM CEST, Demi Marie Obenour wrote:
> >> On 10/13/25 06:01, Alejandro Vallejo wrote:
> >>> On Wed Oct 8, 2025 at 6:04 PM CEST, Jan Beulich wrote:
> >>>> On 30.09.2025 14:52, Grygorii Strashko wrote:
> >>>>> --- a/xen/arch/x86/hvm/Kconfig
> >>>>> +++ b/xen/arch/x86/hvm/Kconfig
> >>>>> @@ -62,6 +62,16 @@ config ALTP2M
> >>>>>  
> >>>>>  	  If unsure, stay with defaults.
> >>>>>  
> >>>>> +config VIRIDIAN
> >>>>> +	bool "Hyper-V enlightenments for guests" if EXPERT
> >>>>> +	default y
> >>>>> +	help
> >>>>> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
> >>>>> +	  efficient timer and interrupt handling, and enhanced paravirtualized
> >>>>> +	  I/O. This is to improve performance and compatibility of Windows VMs.
> >>>>
> >>>> What is "paravirtualized I/O" about in this context?
> >>>
> >>> Hypervisor-assisted IPIs, TLB flushes, etc. Or so I understood back when I said
> >>> that looked ok. I see there could be confusion with Xen PV device protocols,
> >>> but as far as the user of the help message is concerned it makes no difference.
> >>>
> >>> One could even remove the examples and leave it as "... for Hyper-V guests. This
> >>> is to...". They are truly inconsequential.
> >>>
> >>> All that matters is that (modern) Windows won't run without it, and that it
> >>> provides some indeterminate hypervisor-provided assists to try to reduce some
> >>> virtualization overheads.
> >>
> >> Qubes OS doesn't expose Viridian at all, which is why it wasn't
> >> vulnerable to XSA-472.  It still runs Windows guests just fine.
> > 
> > Can you run Windows 11?
> 
> I haven't tried it, but it is documented as working.
> 
> > I don't remember which, but I do know some versions of Windows refuse to boot
> > if they determine they are virtualised and don't see the mandatory parts of
> > the TLFS.
> > 
> > If 11 works, maybe Windows Server?
> 
> Windows Server is more likely.

FTR, for unrelated reasons I've tested Windows Server 2025 without
Viridian, and it does work, albeit painfully slow.

Regards, Roger.

