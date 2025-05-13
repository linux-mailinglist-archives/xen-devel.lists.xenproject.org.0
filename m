Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839C5AB4C20
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 08:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982528.1368882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEjIh-0005QR-PP; Tue, 13 May 2025 06:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982528.1368882; Tue, 13 May 2025 06:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEjIh-0005OB-Ly; Tue, 13 May 2025 06:39:39 +0000
Received: by outflank-mailman (input) for mailman id 982528;
 Tue, 13 May 2025 06:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgbk=X5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uEjIg-0005O5-4h
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 06:39:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2413::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08d8e49b-2fc5-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 08:39:35 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 06:39:32 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 06:39:31 +0000
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
X-Inumbo-ID: 08d8e49b-2fc5-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyxyruE5TDPU5Na3cue7KkhT3hTyH4dm8i4dxy2ulzzR6VlNaa2hn8hQ9HrhjeuKCRWZ9OZmXu3NzZ35ql0tQ9wo3P6xycQhu7359QBWWX2F4D53pHCvAb3aSGVXR69tL5Duynmj6n4s5lu4ltb/RsOp0Qhj/DJqPKaSIjg++X1W1Vi33G58NlSv3XyvfkTgBaJ5X9gz+sq3/YOWyJdRTDdI8yk1vq/OGvvXm00ntvdLKPfxTi3hpyrSv0wEzUDy2XwYAGBem0Mei5H/Aa0CZcvSHf355UoUP4OIP7g6ar93wAbiUctNQr3g6TdQyzeSMRD2mEzF5zpG65pd4g5MhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRyg2/1oL9i9Set3BGWd07g/6+fRgawHIG2cKRoIQjQ=;
 b=EvjFtEjOQ4q8DhqeVzcdhb/pUp86rCLX3S9g/LDjJeOuiTt2ZjkQaYd0HUwfdMJ6cIHjdZn9IZAmq4DMWNxFQiFQnPF8Zxqwy4fj64hux4E4Asx1/pYoqL2LcCaKytpLJ2Ld5EMNZM3whTtZzRdNFDTppBMrgCc5wQaHJbX0DmA8EdlQ+IyJXJ6hg7R0HGPkiEsVe/FPHm1zTbb5qWfz+t1yoNBW/0NoJLPM+DG2Q0OpaG0GFuMkxZBbd8I7kUnf4gGsmlFSL+3/BA8/5s+FPjgP1T7gX+Ct3uEYjFMD7PakFZ+r3ixCtWuxw3khPNzTZii6Q8CyisItsa5GQPxMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRyg2/1oL9i9Set3BGWd07g/6+fRgawHIG2cKRoIQjQ=;
 b=hH/1Wv7jOZVzPFfO/4WjBM/xj6qrycwUNLlJ8DYdrrGXkJK7hGIfNYs6Ggn50SfaPVUk6RRJl+jOQOLhzREvAq1FfwRbt6GjwKdxL70SWR7qOhXECZnTquBA6RjkTpZ0fCUU4cdel/U1nhOJM2DvoPu4hPrtsP4nHfbw3wqR2FE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <79190663-92ae-415c-a104-29117d084e62@amd.com>
Date: Tue, 13 May 2025 08:39:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] xen/arm: exclude xen,reg from domU extended
 regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-6-stewart.hildebrand@amd.com>
 <3caa25d7-9faf-4099-a0a2-f7014c01e1ce@amd.com>
 <56975c31-a088-43bf-80a5-65da6cc00221@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <56975c31-a088-43bf-80a5-65da6cc00221@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 29adc267-236a-4b3c-860f-08dd91e8eaf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGl6VHNYY2FnUTdKMGlwdTN2SVdnZG5rV3p5OGVEQmdlTTNNMmRqNzBzUkhU?=
 =?utf-8?B?NGhDaENHQWc3RVZiUG1DbWNlbzU1VDlwWVZkVXhWL1o3aEZOVlRGUHNaUXhJ?=
 =?utf-8?B?a25EdGsycXRlRVRyRHRZUFF5SFhCR1NGYXJwY0M1SEtpVExWdFJPaU5mQkVv?=
 =?utf-8?B?TDBzRmplK1hGUjZRaGtBczk3Z0lWUXNxeVpxNDJ4dXdoRU0wVFpWR0J4N01S?=
 =?utf-8?B?ZzZOdXlEODBxTXR1WS9ZeTdsbEJUa2pvY0VqaTFMYTl4dHIzOWcybzBxNjFP?=
 =?utf-8?B?VFpJQm94M2pjWXBBZytzQmdCc0pBL1R1QzlLU2xRSDlUSXErdTkzbUNzcVBv?=
 =?utf-8?B?cUI1b3JMSG1IdS8wZ1EyVmx0ZUNIaXFuM0dObEJZMUwwbVNma2dHR0lVR2NZ?=
 =?utf-8?B?YVB5N01QMmYwbXhhQmV3VGhHOWV6VlNyTy9ZUkp6bDhJRTBHT2ZjRnYwdmpP?=
 =?utf-8?B?SHcyQmZRR21qbmpqOVBHTzFqSGlwMFVZNzAyWmlaOFFyUHdCd2RzcldpeFF1?=
 =?utf-8?B?WXJkQUp3YitnVW1sTmNVUHJTaElpdVJzS3gyVm92Q2FTbGYxVGJKaEx4UEU4?=
 =?utf-8?B?b0lTZVUzczhSQ0xrUTBNc1BzVmtHUHlSODVvNFlKY3VZT3psMW41ckZNKy9G?=
 =?utf-8?B?SHo1d0Vac0xZaHNDaG5aOGFYUVFtNCtWV283UXV4ZGcrbjAwMDUxcm9BeFVC?=
 =?utf-8?B?RGk3QWR4VGMwVXBOZTNRZURxNTdMREhzeDhRVEZydnFNNDFxWFdvQ0FZM2ZY?=
 =?utf-8?B?M2pnRnI2YWhET2hyZkxqdVJiRCtFRHdHQjJydFEvTmFucTkvbFBSNTViMVk2?=
 =?utf-8?B?YXJoc0YrbW5sUHdMd3VRQnJDeW9iaERQcktuZzVxaFVUeGVla2krUU1PeUdT?=
 =?utf-8?B?VnhUclBzcTlsOEgwMHQ5MDh3d0pyS1BrUStXaFZhZkNxTkxVZ3hpRVl5ZUR0?=
 =?utf-8?B?dUhhZ3Iyb1hQWi9UVjZBeWxnQ3U2eWFRUndkdTUxbXFtUnRuVVZJRkFkbkVi?=
 =?utf-8?B?UjBkL3VNSFdHZXYzREJLZWZBQlBoZDdkcU00c0NraWU5eTZJU3lRY2JlMWJG?=
 =?utf-8?B?YlBiMzhjUER6RTZWbVJvMjhrbVZicVBaZlByYmZMZ05MM3dCTTcxMnAzK1lX?=
 =?utf-8?B?b1FicUp4RzMvTklOWkRuYTNjQWl3c2cwNmVoRHF0cjZmSmJMVWlRQ01raWJ0?=
 =?utf-8?B?aGt1cUhyNmw1UG91RlZzOE1vclpLWlVKdWVYZ3c0c3RvcWI1LzdjZUlTblhR?=
 =?utf-8?B?RGhGaitsa1ZIZWQ4QjZ2V0Y3OTdEc3lUZTVUUXcyUVlBbmZ1aGNQeWdNaU5a?=
 =?utf-8?B?UTdvdXE5NEJOTFI2TkpKRlk2TlJ3Q3YwTk5EdEdGWVFHVFFmajMyTHZ1MVhx?=
 =?utf-8?B?cnpMcHhZV3pzTTFMc241LzdRNVd3cytQZkdwN3B6N0Y3bUEybkZwdjBEaUFU?=
 =?utf-8?B?cDRBU2dubFIvS1dKNTdaT1BsUG9zN3NEd3c0UzAwdjdqRFFZazYvVkx2a3pN?=
 =?utf-8?B?b29UeG5GY0c4WU1zUmVVUjNrM01nenNHOUV6UW1nUGNqNlVjZ21qVlduRFBx?=
 =?utf-8?B?SVhibnprOG1lWG1MelVFandDSi9QTzE0dzI2U1o1TEtNYmptVmFWazZTTWZy?=
 =?utf-8?B?TTRyVlpCZk5CSVBZZWZYRUxoSHhrTHZVeHFCUTZxSkNvRFdFMlpLcmQrVTYz?=
 =?utf-8?B?QzN0ZjRVUmhyK2FtTndoNzJiUXVwQlBHeG9FZUkrZWxKRkxSOEpxYTRMVnVC?=
 =?utf-8?B?UUs5S3l6WlBMRjRLcGdjYkxkWFNORWJ5U1BnajhDTG8rb05BdW5aUXBqV0M2?=
 =?utf-8?B?SnpQaXhvOTcxc09hTm90NUt5SFU0UHpVdmN4d2p3NXRMR2hvc1ZnU3JPUkFQ?=
 =?utf-8?B?WGcxc01VbXg5Vk9lb3FDREExeHRJZ1lUVlc3SWFpb0pFOExsMTJLT2JPRTc0?=
 =?utf-8?Q?LcOjddxpogo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ny82cXhrNUJjR1Q5RXl0N3UzZU5IUElmWWVxbmYxUk1iMVFweVRkTmVrdVBj?=
 =?utf-8?B?U21aYUJDVi9VOXRaa0t1SFJPcm8rZXJHNTc2MElmWTByQzlKU2I1K1luNHBN?=
 =?utf-8?B?M1hSakJKZXJYQVJxK0pVbUZrM3dsUFdyVUxhVmVmcWtySHRYVVRKUVNhbktR?=
 =?utf-8?B?WjlqMGR2RGlPL3ZzQzVqeXVzUVNVdi9qc0NqS1BjcUo3aFF4N3M1SzhMZmZ2?=
 =?utf-8?B?cFJWRlRBaFRjS1VCVHdndlhQSDFYY29zd2hpWUZhc2tjeUYrYzEybm5jZS9M?=
 =?utf-8?B?SVdpNXQ5VHF6QkQrVXpCZDgwSCtLdFJXSU1kWXpodHRNMEU1bDBqOTArSXBK?=
 =?utf-8?B?eGdqWlFQSldycTJuK3lvTU50Z1VYSXJIdXY2QWg0bnZ4dUY0Wk5zWkMrWDg1?=
 =?utf-8?B?cGozYXBGMTVlT25ZRUhrRTNJY0V1QVZsMHQvVHhnQjZ0MEZLZFhvSUc3Uis1?=
 =?utf-8?B?YVVScFBGVnhXOXJIV2JLS1pwWk41L01nbThtbEE1Z3JrK1ovS0JmSnpyS0xZ?=
 =?utf-8?B?NUpiSlhGVEQzYUdGbG1EY0VQSWFpbjFSd1owanppMDRsZFJqYys1M3NQbFN1?=
 =?utf-8?B?dDk0MFNiTHdsKzlqY1NqWXdzMmlJN0tTK2hTVE1LSzhlSTdleFZvTndCQ2t2?=
 =?utf-8?B?Z2ZHZXBxaDJnVktvTk1DRHhTbW9UQityWlNxK2hWbTB6ODlSOGJseXgxeFh4?=
 =?utf-8?B?MGJyOVFaNCsvU1dIblhMYnZ2NTN0bGFrUWNITzFybDdScFE1M2xNNTN5bkdn?=
 =?utf-8?B?eG1DejgzNXd5QWJWRS9DbXRjSk1zYnZUVDZQZlZ5ZXdqa3dhWDFiYTgzL0VY?=
 =?utf-8?B?VFlYWUtMVVNGSU5IaVhac0JScGVxZ1MvRjJVN0h2M2lncFBranpYMmhJenl4?=
 =?utf-8?B?QVlWZWhaczkrWWw2UXVZaGNRRU5mV3p3ZlFBU0wrZHc3Wll1cXJMU3I5a0xX?=
 =?utf-8?B?TEErRU5YN0dpbEZFWFZkQm5xczhYSTlsSFZkMHBoVVd5YkFUMkRkaFNPSEV1?=
 =?utf-8?B?K0FxL3ZOS0hWQmF5ZlRhSlpFdXlCMXNJT0NDQkFqaTcvdDVURkErQXlKVklN?=
 =?utf-8?B?TmNTRHl5b3VrNWpXa3Rwd1ZrSzRvWmJTaUM3MnlGZ2pkdE9ZQnVqU2U3SC8z?=
 =?utf-8?B?RGptRmdMNlhVdEY2RVRDVUJiUHhFRUhHT0piL3c2Qms1ZkYyem1DNjRPekF6?=
 =?utf-8?B?YzQxa0JNQ1BqUjR4VjMwTTZDV25sdk9HYncyTVJWK2JkNGt3TUdrMEgxc2J3?=
 =?utf-8?B?eFFneGprMGpxYllyV0tINENqTGg4ak9UZWtIU2JDSHQ2NjJ3Z2IySlBhWGlm?=
 =?utf-8?B?b1c2UXV1R2orK2U3eEExTVhWYUlwMUFPTmlwZjY4VkczQTk4ZmlnWlN2M05P?=
 =?utf-8?B?V0hTR0J2UFNFc0xZcHRIQ2pIeWRuZ1pQS1IrRG81S2owYlBrbkw2Z1hpdUFz?=
 =?utf-8?B?dVFxeStQSHBrc2RwVmo4MC8yMDFzRnV6QTBtWkhhdkxGZ3dSTG9hdnlUN1lB?=
 =?utf-8?B?TndDbldkNVJaSVRzNkt3YVJtc296bXNZUHRyLzdmOUk5c0RVTFMrOFBveERt?=
 =?utf-8?B?VzI3S24xQi9vbXVIMHBDVjRMUFA5QTB4ellsaGhhSndHNHlXZ3RXN3dYVjYw?=
 =?utf-8?B?Zm9NYmNUYmIxbHgrbC9VaDg1dTRrU1ZkaS9KVXhFU3ZsVlAxNXZhcHJkTjRl?=
 =?utf-8?B?UHFUV1pkTzFtd09yK1g4ZUNEVnZFVVZYbXk4TUdBbEZxa2RrdndEVjZpcWZk?=
 =?utf-8?B?UlFXNGU4Um5KR1Zha0R2VXFhb1I2c2x2V3hFNE5HSlRJM1pFb0FjQ0RQQlNT?=
 =?utf-8?B?K042SUpWeklBazBaTzhrUmxZZWMrSmQvUGNCaDg0NG16bGNBS2JmbkJKN3Zy?=
 =?utf-8?B?M3FBczdJcnJaWm1WVVc5Z0pvb3FsYlNoWmJXdTR5VVQ0QWdzVzdsMGx0RWtH?=
 =?utf-8?B?SEI3OHlNWG05a0JCQUVkbUtNYnhDRFBlcitiNFN1UVJrVTQ1RVpPbW5tNS9u?=
 =?utf-8?B?N2lsRUFPekFFdmZqTVJraDR5bkIvSmErdHdiYTNsSUJLanhPQzBMVVl6cnV3?=
 =?utf-8?B?N3RFK0RTb3VCcVhjSms2UnNQdlZIbEphVGNzWFJUazRWbVg0ZnZXNWJtdnpj?=
 =?utf-8?Q?Q0Bo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29adc267-236a-4b3c-860f-08dd91e8eaf9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 06:39:31.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sS20SNgzVQFXQnI3pHM7nVnkRiepRjwdKhvjs8e5hpPrvjn1So2YYPeol2pqcWz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116



On 12/05/2025 21:55, Stewart Hildebrand wrote:
> On 5/9/25 02:54, Orzel, Michal wrote:
>> On 08/05/2025 15:20, Stewart Hildebrand wrote:
>>> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
>>> index 7a6cd67c22f1..1939c3ebf7dc 100644
>>> --- a/xen/include/xen/fdt-kernel.h
>>> +++ b/xen/include/xen/fdt-kernel.h
>>> @@ -24,6 +24,7 @@ struct kernel_info {
>>>  #ifdef CONFIG_STATIC_SHM
>>>      struct shared_meminfo shm_mem;
>>>  #endif
>>> +    struct rangeset *xen_reg_assigned;
>> The purpose of your newly introduced xen_reg_assigned is to keep track of these
>> ranges so that we can remove them from extended regions. The concept of extended
>> regions exists only for Arm today. Therefore I'm not sure why making all these
>> common i.e. entry in struct, rangeset allocation, etc. The other aspect is that
>> extended regions may be disabled by the user and you would still allocate
>> rangeset and add xen,reg to it for no purpose - i.e. dead code.
> 
> How about an arch hook? E.g. see work-in-progress/untested patch at the
> end.
Still, this is only needed for extended regions and your solution a) does not
mention this fact at all and b) assumes that other arches (let's focus on RISCV
for now) have a plan to use it in the future. If b) is true (I'm not sure
because Oleksii did not move this code to common), then making the hooks global
while extended regions creation logic still being under /arm does not seem
beneficial.

> 
>> Also, what about direct-mapped domUs? We don't seem to take xen,reg into account
>> there.
> 
> Right, we ought to take xen,reg into account for direct-map domUs too.
> This is because, even though the domU is direct-mapped, xen,reg can
> still set up a translated mapping (gfn != mfn). Also, xen,reg doesn't
> need to correspond to a real device, it can be any arbitrary mapping.
> I'll send a patch.
> 
>> P.S.
>> After recent dom0less code movement there are some issues that I reported to
>> Oleksii. Long story short, we shouldn't be making the code common (e.g. static
>> mem, shmem, domain type) that is implemented for now only for one arch. If the
>> need arises in the future, the feature code together with callers can be moved
>> to common. At the moment, we have some features being in arch specific
>> directories but callers in common code and #ifdef-ed (making the stubs
>> unreachable). That's not great.
>>
>> ~Michal
> 
> 
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b189a7cfae9f..f099e27d846c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -929,6 +929,31 @@ out:
>      return res;
>  }
>  
> +int __init arch_add_xen_reg(struct kernel_info *kinfo, paddr_t gstart,
> +                            paddr_t size)
> +{
> +    if ( !opt_ext_regions )
> +        return 0;
> +
> +    if ( !kinfo->arch.xen_reg_assigned )
> +    {
> +        kinfo->arch.xen_reg_assigned = rangeset_new(NULL, NULL, 0);
> +
> +        if ( !kinfo->arch.xen_reg_assigned )
> +            return -ENOMEM;
> +    }
> +
> +    return rangeset_add_range(kinfo->arch.xen_reg_assigned, PFN_DOWN(gstart),
> +                              PFN_DOWN(gstart + size - 1));
> +}
> +
> +int __init arch_cleanup(struct kernel_info *kinfo)
> +{
> +    rangeset_destroy(kinfo->arch.xen_reg_assigned);
> +
> +    return 0;
> +}
> +
>  static int __init find_domU_holes(const struct kernel_info *kinfo,
>                                    struct membanks *ext_regions)
>  {
> @@ -973,9 +998,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>      if ( res )
>          goto out;
>  
> -    if ( kinfo->xen_reg_assigned )
> +    if ( kinfo->arch.xen_reg_assigned )
>      {
> -        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
> +        res = rangeset_subtract(mem_holes, kinfo->arch.xen_reg_assigned);
>          if ( res )
>              goto out;
>      }
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 7c3b7fde5b64..8d6bd2dd77f9 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -16,6 +16,8 @@ struct arch_kernel_info
>  
>      /* Enable pl011 emulation */
>      bool vpl011;
> +
> +    struct rangeset *xen_reg_assigned;
>  };
>  
>  #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 2c56f13771ab..654575612744 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -146,14 +146,6 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>      int res;
>      paddr_t mstart, size, gstart;
>  
> -    if ( !kinfo->xen_reg_assigned )
> -    {
> -        kinfo->xen_reg_assigned = rangeset_new(NULL, NULL, 0);
> -
> -        if ( !kinfo->xen_reg_assigned )
> -            return -ENOMEM;
> -    }
> -
>      /* xen,reg specifies where to map the MMIO region */
>      cell = (const __be32 *)xen_reg->data;
>      len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
> @@ -196,8 +188,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>              return -EFAULT;
>          }
>  
> -        res = rangeset_add_range(kinfo->xen_reg_assigned, PFN_DOWN(gstart),
> -                                 PFN_DOWN(gstart + size - 1));
> +        res = arch_add_xen_reg(kinfo, gstart, size);
>          if ( res )
>              return res;
>      }
> @@ -828,10 +819,10 @@ static int __init construct_domU(struct domain *d,
>      domain_vcpu_affinity(d, node);
>  
>      rc = alloc_xenstore_params(&kinfo);
> +    if ( rc < 0 )
> +        return rc;
>  
> -    rangeset_destroy(kinfo.xen_reg_assigned);
> -
> -    return rc;
> +    return arch_cleanup(&kinfo);
>  }
>  
>  void __init create_domUs(void)
> diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
> index e0ad0429ec74..3e577e4dbe10 100644
> --- a/xen/include/asm-generic/dom0less-build.h
> +++ b/xen/include/asm-generic/dom0less-build.h
> @@ -61,6 +61,10 @@ void set_domain_type(struct domain *d, struct kernel_info *kinfo);
>  int init_intc_phandle(struct kernel_info *kinfo, const char *name,
>                        const int node_next, const void *pfdt);
>  
> +int arch_add_xen_reg(struct kernel_info *kinfo, paddr_t gstart, paddr_t size);
> +
> +int arch_cleanup(struct kernel_info *kinfo);
> +
>  #else /* !CONFIG_DOM0LESS_BOOT */
>  
>  static inline void create_domUs(void) {}
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index 1939c3ebf7dc..7a6cd67c22f1 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -24,7 +24,6 @@ struct kernel_info {
>  #ifdef CONFIG_STATIC_SHM
>      struct shared_meminfo shm_mem;
>  #endif
> -    struct rangeset *xen_reg_assigned;
>  
>      /* kernel entry point */
>      paddr_t entry;

~Michal


