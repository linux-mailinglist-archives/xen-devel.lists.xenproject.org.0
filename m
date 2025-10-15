Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE5BDFC11
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 18:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143804.1477413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v94ij-0006pI-D1; Wed, 15 Oct 2025 16:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143804.1477413; Wed, 15 Oct 2025 16:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v94ij-0006mg-9U; Wed, 15 Oct 2025 16:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1143804;
 Wed, 15 Oct 2025 16:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v94ii-0006ma-03
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 16:51:24 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2516a165-a9e7-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 18:51:09 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BL1PR03MB6039.namprd03.prod.outlook.com (2603:10b6:208:31b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 15 Oct
 2025 16:51:02 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 16:51:02 +0000
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
X-Inumbo-ID: 2516a165-a9e7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXaUbP7hIhkIXP/Kl/f0Qv9NODUZDkrO1zCz9TT61NaD7xYW3dvctG/t2keopLHEgTkLdEXgFu+xCLfFsjh7eydOQ6j+EMRS8rAgzu/DTNWGtzuzjDVWvjakIrj2untAkfc583QSJYvJEaRaStrcDbAW0mu5ffwaXBWDAFTCXAPFPrZtv4DHPZ4UPwUlRRI0QncmFgqKnTZBik1lbqXwvvNUhqIRcb6zWxGlEalhyBT5PnIdY3ZMjAd9t0sy5bcoUYaB5TQcs5wleVntWzdHTGuJ6xHWytnl3DnQTNcuDNdx8uREZ8u8EDl2uu+KboqJSiChts/MwZtqJdVGA76BnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bp+tPf4BDoHZY94wIdWQ3IwT984ZwcNIl5mPeuyaJt0=;
 b=uN1Rpp+2aNA0VoxuLTtqQU2TLrG2TiYvLF2nw0ypuryl3dOu+xjPytS2apWHCSls8tfrw3P+mBEF+W+NsNljNrtLpqeg71JKOc2iXUfL/DO1W/mISTYKn6EGZmDYvnaCLMggy+p7NJHCw8+6ciPfdiIv1y5DWm0KDLNa6rX9/33iZN7uroqLNRtKVplu0WODdUsZcdJvOjrLSPyc7FGpNFIhDVkUtfTDneNczUOzoScpTQkDb3J/nS+BLqkLt+tqSp66g0m9BAWNHGrEQXr3K57tt8XlA9CU81tPnkWn0WOmSGFbtVc9XdwQ+tjYMf6GIjTw1hGF+OMoumWaV7cVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bp+tPf4BDoHZY94wIdWQ3IwT984ZwcNIl5mPeuyaJt0=;
 b=oRj3qz5Ot8UEm0h9COQHnvYAh13+kVo/1SP1gmdA/FuBFW0Qq9fGxgBZd6i+YhwwF4yidPJ54IkZ1IwNr6QdqwPL+MPSEc8aH5G27ptQWUTmu3h0vAF4dQwFHCshAhfipp7sHUWp4YAsVLSxjhDNrQmQv2dd44m+ZizNM6v6VUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 15 Oct 2025 18:50:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.21 0/6] tools/{lib,}xl: Coverity falllout from the
 json-c switch
Message-ID: <aO_Q8n6_fgRFgaQN@Mac.lan>
References: <20251015134043.72316-1-roger.pau@citrix.com>
 <87f5c526-8491-433c-bf64-027d5635b13f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87f5c526-8491-433c-bf64-027d5635b13f@citrix.com>
X-ClientProxiedBy: MA3P292CA0004.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::19) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BL1PR03MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cee4fc2-59b1-4d44-839c-08de0c0b0608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWhLYzNaSTNBMVBDSkdJZ3JCalVNdWtRazFESXNYYUIvaW5WNG1ZU01ybXBx?=
 =?utf-8?B?VGtWOWxJeFd6NTdTbG1XOEdaYUhnVGpJbHJLRmZiYUFqaXZNWWQ3cXJ4Rk9r?=
 =?utf-8?B?elVLMUZXaXA2MWRWZWlTVVE2UGRwR3ExSW10UVlUQ1ZidVFxaisrakVrWjhO?=
 =?utf-8?B?eGZ1NzBUYWh6bGpoMmQ1ZjkzY05QV1RERVdWSSt5TnRQTW1FWWFJN1BwZTBw?=
 =?utf-8?B?V2d0S0hSVlJTekxoUFU5MVQwandRR2VGYmZrSGE1dEFrS1N3UERyYWY2R2M4?=
 =?utf-8?B?TVE0MFFiaVVNdHI2Ni9zYWNLQlhUZ0NGdjJJZDFJQXMzRENSajBLMVNEOFNq?=
 =?utf-8?B?NnRXQndCdGx1NkYvWHd5QW11Sm84UytRN1VUM2NMMnpRYkpEdEpjaEVBaVls?=
 =?utf-8?B?bkwrMjJHNHZLeHFiK1Y4OFJXejRnLzlIZnkyZkVCbHZKVXN6cnpoWmtUOVVW?=
 =?utf-8?B?R1ZMWDl0bzNTSkVrZlVSK2ZRWEFHZUVIdTkvV0lXUXZtYWZHTzJWZ2NqcUxY?=
 =?utf-8?B?aEpacTZvZHhmeW0vS24vMUJWSXF5eHQxdmoyNlVjVDJjUVMzZWhKZ2d3SjVL?=
 =?utf-8?B?WUo3TDhJOEpmMXRxVWtsSjhMUGtFZnNlVEV3K3B1c1hTcUpOd25tak5QWjNI?=
 =?utf-8?B?bXZaL1VPaUswSGYzRDQzT0I1UXpuU2hkTnlDeEhQWVZMa2ZId0NWRjFUUXhv?=
 =?utf-8?B?VUh3amF4dG8yd2VXbGJ3bk5ucmhvMDR0MVRNQU1sU3h2VVM2dWUzbWFIZHNH?=
 =?utf-8?B?YkNRUEQwemZjSDQ4Zk9nUUdBaEdiNUNqRksvZUhTTk9IU0s5bi8zUnZiRE1l?=
 =?utf-8?B?K3dDT3B1ZUFQaUNycDNBcTI5TDFPTllDbVVJSktOTElCOGJhZ0JFR0NoeUJL?=
 =?utf-8?B?ZEViQzk2RjVFZmY1TldDY2E0dFpVazhRcjNoSkRNNjd6SVQ0dDI5ZWxmL25s?=
 =?utf-8?B?cmNYVXA3S3d1VFk3NTd4alZnL2tSVWlKL2NoWHUwMmRGaWQrRmc4VlBDM0FB?=
 =?utf-8?B?cTQzamdVbUg5SStVYmJMUHo5eXlORFIwMm9qWFdnUExNZHRoUllQQUVmOW9n?=
 =?utf-8?B?bDJqM2U2RnZXeDVvbnJYSnNPWHV1MTNBZG55U1JDWVVoRGpwVHhHWXNUcllB?=
 =?utf-8?B?Z2cwQ0tOMjdpT3FqVkpRY0ZiMGVsSG9pZjNCdzd4YmVwbXJuYnpEVnJnUGNi?=
 =?utf-8?B?d0xiUkZzREsxc0tFSHFHbEFpdkJNVVZkTmdqYWNLdk5WeTFSU0I5VWZaZW5q?=
 =?utf-8?B?aWdMb3J3bjF5UGVqblg5UEJnMWlpOFdVeXg4aGkyekNXc3FYd1Q0YmZVQ0Ny?=
 =?utf-8?B?dVhDV1p6bld5L1VjVmVlVWJocFhKWEFKaW9zaThsd1ZMZTB1eFB3cGRuKzJi?=
 =?utf-8?B?TkUzU0l5SGRoa2FmOUxuaUxKNC85MkhBOERkK2ZyVDU2WVRiSWdqcHBRUXJO?=
 =?utf-8?B?TU16NmU1UXQ3VExJVGtKYnlGRWw0STEyQTgyR01LbGtQYWhNVkZaeXJCUUpy?=
 =?utf-8?B?blViY1g3S3FTTTZUYlp0VzluT2JzSXVWWndWVGN5RXEvWTdPcWhPQmFjV2pV?=
 =?utf-8?B?ZWU2V1IvWVpWL2J0Mng5TEdqNTN2QldKS0E5a0lmTnBWQ0hoVUZYa2NFVTFK?=
 =?utf-8?B?MlVGOWF1ckFEUlNwbkU1OUNTQlZTUzhRM0F0MzRtam1zN2ZmamhBZ3lNQ21P?=
 =?utf-8?B?bmI3TUlhZDd4MDB6STBxZFRscU9URlBmcXJ0cVhXSmF6OGRFbjVGL0E4NHcy?=
 =?utf-8?B?clBnRm5Ma0hIeEZ3enFVWXNNdnFUSkg4M0JMZHhXWXNLZitGWVlJQUcxYW95?=
 =?utf-8?B?OWlTZzVUV0xIOFNnbzV3SVl5NDA0eisrNVVUNWJKN09tSjJ0WHRHZHZaV3ZI?=
 =?utf-8?B?YUlLT3cweVdPRlFYMlpXcEFid2NGM203OWZNOCs2VHc5YVB2Uk15dGhzRFNu?=
 =?utf-8?Q?068GLsCNqvhyUh7+o01WtknXmC/fYpPb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXBVQmFFcFFQWjRrRGl3RlZTSVNsN0pOUUZuSGRHbnQyMWI1Z25ESEpHUHBD?=
 =?utf-8?B?WFJGTmhTZExqMHpPTFJGY28rNVVnUUZuMVJoZTNDUWlERnhvckJiMkI5TUhn?=
 =?utf-8?B?RERJazUwaVR2OU9FbHVTRGZwRDFaUVBKTkN5K21sbW1ZS3VkNUlvVDJwMk9P?=
 =?utf-8?B?Tk9PcXZhYnBkei9vcmN5T1hnL3ZJM1dxM3pJSlJKamFkcllNRnN0WkZ2UUdj?=
 =?utf-8?B?VjMyd3RDd0NSWm84S0xRZE9EbXBTUGNLc3lTS05sVVhTRHZFdUhFS01EeldD?=
 =?utf-8?B?NVFORjFRakFidkJIRVM3bENadGdhN1R5QmtzUkpJVndzclZtYXMwQ0MyWC9H?=
 =?utf-8?B?Umc3WFk0c3lSYTZ1Y1EzaFByc0Z1WlQwUHFuU0VzNGwrN1NGams3SXc3OURK?=
 =?utf-8?B?Z3h5SExHdmgvZmF3eVFBMDFrVEoyZmU3cDFZZTRPUDRtRzVrZjFSNW5Zb2tK?=
 =?utf-8?B?NmdLZksvTzRnWUNuelA3Q1Rtc1U0bjhGTjFhNmhQUSs3YVJQODJLc1VLczdD?=
 =?utf-8?B?YXk4RTlzdWIvTjBTOWE4OHVjRE9QRHMxQUNwK1h3UmZER3JMazEwdlFoOFBY?=
 =?utf-8?B?WGwzbzI2bGpIZ3VNY0cxdjZMaCtpdVljcVNrMDJwZURtWXVUSlQ4ZlBiUUtp?=
 =?utf-8?B?VDZiYnJaTkloV3RQYW02K0VYWFRqSndkSnNWckZxL2xBd3BOVUczYkJoeHc1?=
 =?utf-8?B?ODh5UXo5OW1vN0poeGtiM21jRHltTGszaGcrTUtlNU5QOGk4R0pYd1Ewcncw?=
 =?utf-8?B?THdLMkhtREk0c2hFaG8rcUkrdjZ6Um4wd05vc3NmVEdpTmM3K08xL3IyRWx5?=
 =?utf-8?B?NXZieGROS2wvM1VMOVBXTlMvcDlBeTYweDlzakV0Uit4aHpQakFBcFVBQ2R5?=
 =?utf-8?B?Zk1Mb01OMU50ekZkeWFPbkVXeDlsU1JjZForaTUxUm1UdEtGN1QzdHRyMEkv?=
 =?utf-8?B?MWtjMDBEaXNnUzNNTlJTV3AxRGRxUWY5a1U1dVNzS0U1TDNsOWNsSEs3SkR5?=
 =?utf-8?B?OUpNekQ4S1diK2Myeldkd0dyNXNkSHBieUtOSURUamRVL3hUYXNQN25yRlpw?=
 =?utf-8?B?VHB0QS9ZNVRkcVFTWnNjUENiaWFiWnhLL2FNY1ROT3dtY0lDMUdkenoyWTZt?=
 =?utf-8?B?bjA0aGlneXFnTHNyT3dydUZWLzY1cFNOQkpEUE5zRWpOdWtsLzNsZ1d1eDg3?=
 =?utf-8?B?MFhYWkNVZ2NkY2V0UVhnZDdOMytaV2QzSDQzR3F2UUlQV0NJTEN4TC8xYkEx?=
 =?utf-8?B?cGlaQjBjM08xUlJucXVlSE5qbEJNL2xjdzArcE16cEdiRHFVRFBIMGRxbVc3?=
 =?utf-8?B?amU1eXFqRGJPYjFPblVqYTUrazFNcC9kTGlBQzlCeHdnNEdaSkJLNFB0Qy9Y?=
 =?utf-8?B?TEVaYnFqVkc5Mk5sUm5mWUsrSXZIQXJtSlhhbUxkNVVsd0dmS24zZ1UxUWdN?=
 =?utf-8?B?MkJNWXNPRDY2dVgzbTNqWEpacHQzSWNDQ1JrRDNqYWQrRmxCWXMrL01pQnFQ?=
 =?utf-8?B?OTdEaVdDRG4wT3oxRXFlellFR0l3Mm9kVWQ2eWEyeWV2MTlwYmdZYlhTL2ht?=
 =?utf-8?B?STAzazEybXJicVhtOFFQT0pKS3NuVEdzUzRHRzB6T040QzdjLzRnU1lNMDhv?=
 =?utf-8?B?K0V6MnZyeldUYkdjVkpFWnp6d2lGSkNGejFjd2JIdUlhMm51citKWEpZS0tt?=
 =?utf-8?B?ak8xZHVaUEFiaHVrYWVQUGJBZVVNTTlEWVVPaytxNjc4MW9WVzErTzFQd09J?=
 =?utf-8?B?c0Y5MUV4M1RZNUNibEl0Y0d1SFpuMnJmeEhvQUd4bkhpVnhpZ1g4M2hWakgw?=
 =?utf-8?B?cDBNL1Z5eXFVeEJCVGdPeVBiTHhxTkFMak4vcVhyL3lyOXhvMHhrQmc0ckFJ?=
 =?utf-8?B?SkVHbTR5QlFWUkFnZnl4bFlYQTM5WUNpY1ZPcWJVL1p6U0w4U1EvamlkbjV3?=
 =?utf-8?B?MWh6N21MaW0zbHVHVllrUitobVE2V1BtQWVJRzhQQUQ0VDdVR01nRFpjbHhZ?=
 =?utf-8?B?R2U0WUU3RHYxdVVvakllczRMRUNSRDdKU1ZXR1F6Tm9YYWhYTXdBUE8zM3Rs?=
 =?utf-8?B?a29hOGtVMCtVeW9ocGRiYWpJblI4UHlDRlFCaHVITFR0M2p0OGwvbnRsQnFu?=
 =?utf-8?Q?V/wSl9MCagZx3HAXyGyR+B0nz?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cee4fc2-59b1-4d44-839c-08de0c0b0608
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 16:51:02.1289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbh+IVvrd8k07vxWiwYyRL8KwpI2oKb2W6cO1/rHNLhOh2MmdEMfOTrKTC97DBEW+wEirCCyE3+Y/7AGDSqSLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6039

On Wed, Oct 15, 2025 at 04:04:06PM +0100, Andrew Cooper wrote:
> On 15/10/2025 2:40 pm, Roger Pau Monne wrote:
> > Hello,
> >
> > The following series contains fixes for Coverity reported issues after
> > the switch from YAJL to json-c.  Those reports are from the internal
> > XenServer Coverity instance, as the project one hasn't been switched to
> > use json-c yet, last patch in the series switches thegithub triggered
> > Coverity build to use json-c.
> >
> > All should be considered for 4.21.
> >
> > Thanks, Roger.
> >
> > Roger Pau Monne (6):
> >   tools/{lib,}xl: fix usage of error return from
> >     json_tokener_parse_verbose()
> >   tools/libxl: avoid freeing stack rubble in
> >     libxl__json_object_to_json()
> >   tools/xl: check return of json_object_object_add()
> >   tools/xl: check return value of printf_info_one_json() in
> >     list_domains_details()
> >   tools/xl: fix possible uninitialized usage in printf_info()
> >   github/coverity: switch to building with json-c instead of yajl
> 
> Other than my query on patch 1, everything else LGTM.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, if no one else expresses an opinion by tomorrow I will apply
your comment and commit.

Roger.

