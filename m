Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85B96C68B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 20:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790665.1200486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slutS-0004iL-Hw; Wed, 04 Sep 2024 18:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790665.1200486; Wed, 04 Sep 2024 18:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slutS-0004ft-EP; Wed, 04 Sep 2024 18:38:14 +0000
Received: by outflank-mailman (input) for mailman id 790665;
 Wed, 04 Sep 2024 18:38:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+1Lj=QC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1slutR-0004fU-4x
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 18:38:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2416::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5b58020-6aec-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 20:38:11 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Wed, 4 Sep
 2024 18:38:05 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 18:38:05 +0000
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
X-Inumbo-ID: d5b58020-6aec-11ef-a0b3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdaFBcHurH0KhTNRjWoJy4BbSqUPiKi4kUZO8U8c7bKZzdyH7UmeW/dKgw42JAvvsJoyZH25Hu/cDtJ8N6wqFUgeo0lsB+6tGlEGfobmn7SAUMqFzTnX51x8SGkgwVMVdMhJbCMvsRKpJpei27zfAxLbw/YWSG4UX8Z6m8a84Oxt+Bzb0X6fzjLu7PYwIDO+r5Un+VuNiuanW/fnhgKmmooWIbZ+NU3K4ApLhNhMkMGtXGLhfb71v+/VrglGfDGOG6qpxTRcrrth8OqmyuYeXtLFEetM5ryo7PJZaLgpWej76YgZAk3qJYr2JMEoJ/CODGYz8CqkmpFYWcdyCiUztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq5PCXRk4oZ9l4kdELzNUqBNFuUhCZPwxQq+QAzrtu4=;
 b=cVBP4znEciDIuTAo38jWNw2S2T49qMdx0t5AlZWsAfFwCkQUQE07EkuN3hAnkrwL6bOxH75iOJQms96JTg8ESeCleR06XH9QjtMduEb59j9d4CzxaS3pdPRCXq6BZtKI2TdsqDevCjDgxRbgeQ8vcvZ9TKb9UUEb2Qmj0Du6qGSlqk5n/hlV8rIQFyGDwrwwCYsz2sgLioP+UOxLzotHrcg0j33cvzanjsn9EMe8vx6973Ilq1BGkBqJPtOgEUsgW9j/y5BRh6mFNckvZL2CVemH/5Vpo44+YGK6deQfeJNCIZKjTSAHYKx5KP4Unia1f1VxnvrgG4kdp2MddKqiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq5PCXRk4oZ9l4kdELzNUqBNFuUhCZPwxQq+QAzrtu4=;
 b=lntYjXGIrpLd3ygr35ImDXbzQNlK1MDEU1/iAbQp8sAcH7pXAp0B2ZZdTWxf3redXPahS0gTQcO1Zw//iPqEhpw3DfrxknpAgstnrIFolq6frkeSlz04NSNBJQOXVijKtw5rR4O4BpvY069lWy8KZq8PyxAo5+eVoUyK1Gd9b88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d55f3b60-3dad-40c6-a625-b261225aebbd@amd.com>
Date: Wed, 4 Sep 2024 19:38:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
 <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
 <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
 <C845B4EB-2CF8-4B37-9507-4D575FC88AE2@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <C845B4EB-2CF8-4B37-9507-4D575FC88AE2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::13) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH2PR12MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: 204d6245-7356-439b-815b-08dccd10b71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkZkZmJJTHdENUZXdE5iV2NpdkFNTWZ0Qm44cFhwZkhLU1JyV2NKcGhjNzJv?=
 =?utf-8?B?OXNQMFJ0K29hRjVoMnhkNVRYc1RHemdBQldGUEN0L2lrVm5TcWZzeVoxVDRF?=
 =?utf-8?B?djJsQVRRT2ZwUWlMWEVWbXNsUmhkcnZwK1loSkViU3lydGRZZkhmaWpEak5F?=
 =?utf-8?B?dW5XUUlLZExCT0VTRmVmVUwzUUQrZ3A1MGlSNnY2SzlLaHFVS0RUK0k2bWlE?=
 =?utf-8?B?ZFhOa3N4dzQyQ2crTXpPNTM3dm5uR0JrMWhISnhBa3ZqQk1RbjJYdWFaNHpy?=
 =?utf-8?B?ODI5Wm9RSWtXTFE0d0laVlo2S1UyM2pnR1QxU2J1UUp5MFlWMS8rOU1JR2Nj?=
 =?utf-8?B?Y0kxbkxXQXQyMlF0RDA3WkwxeE8xc3N6Mk5QQ2drdGF3SGpZQVFpRzBuZGMw?=
 =?utf-8?B?eTlCOU9BSTFDQkE1NFh2NDZsc0NoNnJTbXVnZVpTNHlNV2Iwb20vSkNrT0hh?=
 =?utf-8?B?Rkg2aCtZS0tRMUFYOTRaR3c5b0U2emRFaHROWERSbHVWNFF1Ni9RTGJLa1Z1?=
 =?utf-8?B?QllnV0JTa2NsdXFhZ1dtbzUzMG9XNmRwOC8xZFFkVVJSbTJ0bnRjT3FxeGsr?=
 =?utf-8?B?TllFOHBlYzgrSHhuZG9nM0VVeVNlOWdRbGd3Wm15bzVkYzlrc3R5TzZMcnVx?=
 =?utf-8?B?eENjVSt1ZzIyd3pKK0VjTEFSVkl2K1B1VDVtQSswVDcvNU9xVTJ6UmI2TFhI?=
 =?utf-8?B?MTZqKzNjWkIzUlozQi9ubUdzeTlTNWFibC9mNXJPK0xUdWRyY0xGY1BPUG9T?=
 =?utf-8?B?VmRTTVN3MzNERFFya0VUU25EaDlwcGpmVUVDb3ordnhkMEt4QWRMNE9XL1Er?=
 =?utf-8?B?YjYvSmpCb3RocW5RNW82TmZ0eXJEYnJTVVUzNzVVRnNLUDkvSU5zN3NOdk9j?=
 =?utf-8?B?eWxSUitZd0NQTytVOUI4NnhPUGJlS2dhYkR6ZGxHMGRaL2hUUWJlbjQwamtT?=
 =?utf-8?B?WWRLamZXa0xWZVRVaVduVHdNU0pMamdYVjhwd0djVmJ4K29Fd2xFeVh4ekRz?=
 =?utf-8?B?alJ1L0RwVFlWeDBHc2JkdThMRkFUeFd4WldKNFFFMDBST3FUMC9nbVp0d1FK?=
 =?utf-8?B?RVV1T3pzV2hoMUF2OFEzcEkrODZXc2h3bnBJYk5INjFiNkI0cGRFME1tQXg4?=
 =?utf-8?B?TGNhYnhkUTNHd1dpdzlFWEVNZTVWZ0x3M3MwZGhJRWUvMVZHUmlDUHVYOVlo?=
 =?utf-8?B?VEt6cExTelVHdGpmd200dUp5a2xXbmNSRlB3T0g1VnEwU0VDTEZnQXZiYThl?=
 =?utf-8?B?RHlIRElnVkhCazJvTENhRFZ5MlQrWSszYzhCcDMxOFp1S0xuUVRaN2FPdGts?=
 =?utf-8?B?U3NaZFFVYzNPYUhZa3NDM0NJS3RJc2dHbFRkdGRxOUxhUldjODdMUytYWHZ4?=
 =?utf-8?B?d2dHM1dRTkZIa3hWa2xvVUxhV2d6NVdsSDZFVEVBcFBvbWJXUVJKSjNVeTFL?=
 =?utf-8?B?Sk1IZ3JsMklrNDFIVUdLbjRpOFBJVkM4ZXh5cHNYTkVqSFhOVDNHbkU4Sksw?=
 =?utf-8?B?NUE0ejRtMHBOZ0dPWUdBcFpjcnQ3TzFqbCt3WlVROVZDdlpSRHhKZTYxMGd4?=
 =?utf-8?B?UGFWdGRaclRWWkkvNjJYdTNKRUdnZ3dXNktvVk5OTTkzNXMyaDJKejVLeUpM?=
 =?utf-8?B?a1V2OURHOFpBYnVYSlc2UlVlQlQweCt3d1hlUU9GeGVqaFRzaWxMQmhzZFcr?=
 =?utf-8?B?WjI5dzhXdkxici9XWlNoemR0eTJIdmJacE5zSCtVakRlT1hPWFk1SG9JVnVP?=
 =?utf-8?B?WWlScmhIZVF6V3N1c2lkR2xwNmUzNFgyd3hPS3NlYkcySE85VFJ1LzM3ampy?=
 =?utf-8?Q?1LYYeoQqEuVytVvAm63g6HcR5OrDsRw+067tg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmhhZVN0Qm9nY3U2S00zN0llTVNKa3FNYmNlNi9VdVgxYWorbVNOYTJ4NENi?=
 =?utf-8?B?SGZXZXQ4NGt4YlhheXhjbDAwdHVlYk5BVTRxT0NnbnEyNmU3S0g3d1NsczJj?=
 =?utf-8?B?VnE3WTNnS1l3dzI5cXNEMndiRDdyaC82bDdJZUl4anVGajl2VFU2Z2s5cFh3?=
 =?utf-8?B?Vzl6dzZHTUdEdU54WVM3VzBFRVpYb3hYeEVIQ0ZhVDFjV0tEcWdmVzRlbnRx?=
 =?utf-8?B?YUhJRHBmdnJCamhEV0tjRFlVWkticm1STWM2MEJjY3BmWUZMbnRqM01wbkd1?=
 =?utf-8?B?U1lNbzAzdGxjalZudzJtcXRxcGVUR0FnaTZ4R21RM2dzTXJYT1I3ZVg3V2hZ?=
 =?utf-8?B?N3hKOVNrTHRkcU9jRlBpZXdvQjc5dTVhQnVtazdKd2FNcXNvdStvZ0tUR2or?=
 =?utf-8?B?cHFwdmcrbEg1TUhpU2ZteVNLL3JXRFpyR2ZBSmJKckhCajY4bC9IVlJmTTB5?=
 =?utf-8?B?T0xwZUFpSTdObFVnMmVMd3RFZ3BQaHJSZjVUWWZiYjA3cXhXVGhTV0pWV1Q3?=
 =?utf-8?B?WVRDcm13bXZ0cGRsUVR1ODJIN3NVRWVKd3Q2T0tGWElkQnBGT0hiZGVYM3FQ?=
 =?utf-8?B?N0ZROWZmUzJ6WUxxN2tvUGhYZ1RNcG5BdUprb2ZXTmVRQUYwMnptVitUWFpK?=
 =?utf-8?B?UDloV1hpWVBYWWZGM2lEZkVRK1FtQVdDeWpzTzZ4bDdYM0Fkckh0WlRUUmlZ?=
 =?utf-8?B?NGw2SFNuMTBZTjh0cjlFN2RRaVhGR1ZCODkvNnpWRStOR2dGVENkdXN0UFBR?=
 =?utf-8?B?Q0tacGJoVWczRTUwYTA3NmxEUWt4cVBDVnpxWDBlTThiSXdFRUNMYnVKbW1S?=
 =?utf-8?B?aHdBem54ZTFaa1pEdWp3UTRmKy95Mjh6eDRHb3pULytycUo2azA3bFJ0cXZn?=
 =?utf-8?B?bmlGNzRmR1ZUa1I3QzVnOHdHYnBCUGd5ZFVYcG5kQkFGVnFhQlVwRkhmWGFa?=
 =?utf-8?B?Zkw2TlZBVEl6b001K3EvQVVQT1hUSExTbXZCSi9mcmk2d2tGVlIzNzFSUVd5?=
 =?utf-8?B?Z3pPUnpkYUFGRUxsbllLcXFhQmlCRkhRbTVIakt4eDcrVnNONWJjYU1VWkV5?=
 =?utf-8?B?Unpxcno4aUJ6cE5HMTN6bTU5R2xnWDJDT0UrY2dkV25jZHZTenRzTzArOTZ6?=
 =?utf-8?B?QUwrY3AyTlJxZkJCcU9jVFRrNVRxL3BCcUxkTjBXaldlTGhPYnNhZjZsZXZM?=
 =?utf-8?B?Y0VHMFBsU3g4eWpKdDhrcXc0NitlZDUvUnZZQkpXZEtZVE9xMHZXWjNSc0RH?=
 =?utf-8?B?Z2JOVEpXMXRnemJMRG5Nc3FuMzIrSlZ2b05laXRCRERjK0lOT1dNR001UWFS?=
 =?utf-8?B?TnhUY3hLdXA4eXc0SWw5b25RVFp6NHozTnV0aGRsSlFpd2FRT1NDTnlWNDJZ?=
 =?utf-8?B?VHRHYmRlRlZzb01lbmFCQlh4N0JsQ3VtUUszS1FxclpCSk1ZaWFuY2F4Mjg3?=
 =?utf-8?B?cFQwN2ZkYjAxVTMyS3k0emlKNVBqakovVFRnbmdNayttOSs3MzVSQW41MFRB?=
 =?utf-8?B?c3hkbWJDUFRkNzdRRGZEeXBDVm5kZzVhMXh0bGVPb1N4elcxLzVkMzExaXYr?=
 =?utf-8?B?c09EN1lURE0xdjU4TlhmdjFmOVdmMTJ4M1J6VkVzMTdoNy9ST1hja3lKVUVr?=
 =?utf-8?B?TkcrdmFseU4yV3hjdWp6akk0UkN4eEdVY29FMThlWWpvcytzLys2VHBsQzRx?=
 =?utf-8?B?T0FVaHlPSDZ4RlVJSUptV0N4WDRhK1pZT25KdEk3Q1pQakZLbWJiN05zSkJT?=
 =?utf-8?B?VFp2ZGY0SVBIQjJkZ1IxUEVyNlZNOUxpYnBUaHpjcXl1L0tWeUtqZSs0YnV4?=
 =?utf-8?B?ZWQyYTVubGRWdGlMTWhlR25ZYnhmTUtBdjc0SmM4VEJSbHZ1TVBZVk41U3JV?=
 =?utf-8?B?allBWE1Ld2t6TCtXdUZSZnZSSEFQNXFCakpYVUFDVjZ4RWhpKzhTTW9iM2RJ?=
 =?utf-8?B?VlpZQ25YcStOYi9TR2hWR3N3ZnVOcys1bUJzejNLTGdhaWNIU09Ed01uVVo5?=
 =?utf-8?B?a0I1N3BTdlVSOWlBeTJkZUZnc1E4aTgxMjdobEg0aUhETnJOQndoVk0xMGwz?=
 =?utf-8?B?V2ljVFRxeHVsbDJ2MVdHeUtpTU1ORk9adGJKeW84ZVpSTXJxRjZNOU5xdWR3?=
 =?utf-8?Q?H4U0ctWNpvKJDZah2/Zv2ATUV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204d6245-7356-439b-815b-08dccd10b71c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 18:38:05.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYTQbB1d7cByOxFSzIw6NJyPL46gxiapwTe6IHuo/M0uO/EtTI1H65P/8Y+kKSuRA1jg721wC0pyd8058b1AMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199


On 04/09/2024 19:14, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
> Apologies but I can’t do a full review yet,
No worries. :)
>
>
>>>> +
>>>> +/* MPU normal memory attributes. */
>>>> +#define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
>>>> +#define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
>>>> +
>>>> +.macro write_pr, sel, prbar, prlar
>>>> +    msr   PRSELR_EL2, \sel
>>>> +    dsb   sy
>>> I am not sure I understand why this is a dsb rather than isb. Can you clarify?
>> ISB is not needed here as the memory protection hasn't been activated yet. The above instruction just selects the memory region and the below two instructions sets the base address and limit for that memory region. After the three instructions, we need an ISB so that the memory protection takes into affect for further instruction fetches.
>>
>> However, a DSB is needed here as the below two instructions depend on this. So, we definitely want this instruction to complete.
>>
>> Further, refer to the note in ARM DDI 0600A.d ID120821, C1.7.1 "Protection region attributes"
>>
>> 0.
>>
>>    ```Writes to MPU registers are only guaranteed to be visible
>>    following a Context synchronization event and DSB operation.```
>>
>> Thus, I infer that DSB is necessary here.
> I think this was a mistake from the author of this patch, in my opinion there should be an ISB
> after setting PRSELR_ELx, to enforce a synchronisation before writing PR{B,L}AR_ELx which
> depends on the value written on PRSELR.

That synchronisation is enforced by DSB.

From 
https://developer.arm.com/documentation/dui0489/c/arm-and-thumb-instructions/miscellaneous-instructions/dmb--dsb--and-isb 
,

```Data Synchronization Barrier acts as a special kind of memory 
barrier. No instruction in program order after this instruction executes 
until this instruction completes.

...

Instruction Synchronization Barrier flushes the pipeline in the 
processor, ```


Why should we flush the instruction pipeline after setting PRSELR_ELx ? 
It does not have any impact on instruction fetch.

- Ayan


