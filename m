Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7583BBF0F9
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 21:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138357.1474086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qZX-00036t-AQ; Mon, 06 Oct 2025 19:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138357.1474086; Mon, 06 Oct 2025 19:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qZX-00033W-6p; Mon, 06 Oct 2025 19:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1138357;
 Mon, 06 Oct 2025 19:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v5qZW-0002pt-2v
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 19:08:34 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9ac1cbb-a2e7-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 21:08:32 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SJ2PR03MB7070.namprd03.prod.outlook.com (2603:10b6:a03:4fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 19:08:20 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:08:20 +0000
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
X-Inumbo-ID: d9ac1cbb-a2e7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzEncMpAeY7/uRfwJpWQJeqWLQ+EAoLjSLEE9o+duHZYcsKYYLq/ghdOUGlL/nDLdEDt4oBGIpN0MnGYggNRkLkj99DFfhrW9dnzugB7g7GhFBFAu5nttWxotPZCe9sZcm7L5UiEIHky+IvhBc5QoH7ik58xSJswog+Fe6T2aISjXfV5nFBRH6ps6qJtXdqdjPOFv4PxipPyCMxcaF6ku1UELrMAS4s18+at+2x1f8CEJ4YuvOvST/sVbOA0ADibypraQtr43HY9/cDmIzlb4DBmaoXIAPNhmaE2eGD1fxCgV9KT9fOtJ1V6JPvPke5S8Ma1oSBPAy5ruxC9n8TKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vFcN2QMxwcipk+6OB83Wi6U3RmXFjgvYWFVZpPtwg0=;
 b=p3w7TJnQJ3BTcaJ7cVk+K+cfGe+qgXWoldGx54yD218lq668mw5XFkao5tfp1e0Exx3XuCzDO6M+ZHfzpGFojZBb/7dbShSp7gMWi45efRPr9mQmhOVd2Q/MWKd8HCvzYDRb+gdGlBGpdlpol6t5joDSneJrMh9jEyYlpnGZFlU5Cne04/rq3uwINBO7Vx4CRsC7uy7qCeRHyurVTlPq+uTOHH82acRGtTfS52/jt4QR/Yf+2+cg0uoULbhIzbZEyb5H7r9XQmM2d/JwIcx8mIKl01FbtgNNnJ4daZHl8O62TwWK6u2SCmGhfSM/obbDyBmd+HzJj7IidcNfH49TCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vFcN2QMxwcipk+6OB83Wi6U3RmXFjgvYWFVZpPtwg0=;
 b=NO4et2qJAWaEx3MlnugufwXbsl3hKWlI0UAhK0NDHz3vS4zaws41BepvacwyQKSU9WWW0Gf9K86IiI+qpiazRQ0ZxEGfr4xgp0rEAHFHI1idxfzXiI0v2PHBLoyuwamOVbNhxPGiaFYFl6u4oS2uiZ5+aTQtlLOe/4J3SKDMDnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.21 1/2] cirrus-ci: install libinotify for FreeBSD
Date: Mon,  6 Oct 2025 21:07:56 +0200
Message-ID: <20251006190757.72757-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006190757.72757-1-roger.pau@citrix.com>
References: <20251006190757.72757-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:408:fb::14) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SJ2PR03MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ca0026-88d8-4193-e3a3-08de050bb672
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3l0T2ovMTZ3TkllY1loM0VvL3hyZDhzc3YzNVgyVFlWbFEzL2VCd3FFZzdU?=
 =?utf-8?B?UmhJU2tGc2ZUOVp3WHJYTlhOdUYzSm5JZEs4Ykc0SC9lTjR4Q3pHVjNjdVRU?=
 =?utf-8?B?dmNWMllEU3dtNjk5SDFtcTJ1YWhYOTF2K1djRXdTc2FHRk9lbjhXb1ZnUWtS?=
 =?utf-8?B?dGRMbHgvbCs5aERNQVF4b2FMd0c3RC9tRm5iN0ZlNTRoYlVaWkFjcVFNZWNG?=
 =?utf-8?B?QWk4ZDRSMktDb3pINjFxOU4wOUhuK3dVbFN4akVoa0h0U1ZxVW1YSk5uYllL?=
 =?utf-8?B?eGREN1pqSGxjciswL0RjRWpwR3VFZGEwMlMxeTVXdnBQUmFuYnZsUDFsMkUv?=
 =?utf-8?B?a0FJWU5TOHVvd0NYYmJFd2hzMmVjaVg0NzhLY1RXZUQyc25kRUFTcGVja0Ev?=
 =?utf-8?B?bzlpYzI5a1V0TFZZWmtYTmVlRjVtZ0czK1NxWlpMSE1yR1dRUWxiZTI5NWdN?=
 =?utf-8?B?ajJCMU5rd1lTaXQ4dmI2SU5TbTA5VUZUbFIwTm1ZUDN2UFJTRTJPRUl1aXBN?=
 =?utf-8?B?NzhMU3RiSlpwV2I1TkJlSko5a1BCQVlQR2w2Z3NaRUk1YlAyWm4vZnBkVURM?=
 =?utf-8?B?Yk12N3l0K1hRWktPR1NqWUh4TGljY2V3V2VCMmlXbnQ1dXpYcG1PbkFwNGov?=
 =?utf-8?B?YUhCeHc4cHRaNm44czJ3OWxnTkJINUVOdi9IbGZWOWprMlo0eVc2MjA4aDli?=
 =?utf-8?B?RnJNTWF5SWkxNEd3U3d1NWdwQlBZLzVvYmQ4TkpYSEVZeTh3TlpUTnlSK0xQ?=
 =?utf-8?B?OXFOM214bHA2dzNZekxrSkV6WEtjck1yTjNrSjJKVFZvdzkxMFRBTVF6WkpU?=
 =?utf-8?B?eWM3bzVxc3M1UFhoVUdYYm9icGE0bmhhRVdYSFNLZUZ4UEpuZWduN3Y3V3VV?=
 =?utf-8?B?azdITmdKTG94QUpyTjJkRzBMMDdMc2V3RmcwWmRkdWVqcXBJWWsrWlJnWnJm?=
 =?utf-8?B?YzhQRG5pRHFzcGFNb0ZKNEozbEVJTEsyMzNjYzFUczdpUTBaZFVZQWRqQUUz?=
 =?utf-8?B?WlA0VXhXTGJkMTVLNXZVVWtBRld5eEpoQTZjQkxQczI5VmVzWnJ1RU5NWTU2?=
 =?utf-8?B?TkRpRThEYjZxYVQrWTM1dkVmR0luaThnUXU4ZkRXSkhSNDU2d01LSWFiOEND?=
 =?utf-8?B?N0p3S3hPWlRKNkJVSnMwSC84VFp2bWphbmFFckRLWmRjYkRkRktKUDZaTURZ?=
 =?utf-8?B?dTdxUFFObTRwbFhQYzh6dGRzSlJ6V2p6MkpwOXNvTG5YQ0ZXSVpZU2VtSEVO?=
 =?utf-8?B?TTdvRDl3QVpTQnoyZmIxdVlXbHoxY2tMZ3pGL0ZpTXNMVGtpK3JtVGVLSWdV?=
 =?utf-8?B?V1F0TEpxd0NHWnY3ZXRjblZDYjJ5cEtKRFFLb0gyNEhHTS9aWnMzb09kdVc4?=
 =?utf-8?B?YkRTM2cvTmw2WWJFTXlwaSsyNGF5NjVDOG1tbWM1a3llaHg1dnFtRnljUFhR?=
 =?utf-8?B?dE9aN2Y2aVU5MUdHRGhvNWk2bjJOK0pFZ2pkaW1QMXpWZDdzdXpZUlJaV0x4?=
 =?utf-8?B?SDFLQ29ybUw2SlprczYwY3JFcVFHRWFqSmFMQkVSTlZFbXA3LzJoanlLK0tx?=
 =?utf-8?B?azRyanJ0YVI1VHdjUDV5UFk5WjVVOUJ6U0hXc083WTZNMm01KzNOL25Vb3Zt?=
 =?utf-8?B?K2R1ckZ5NWZ5VWVqZWNCN2huTlVINEY4Mjc2U0UwV0kza0VKWkFDd24yanlG?=
 =?utf-8?B?Rzc3ZVk4SWFvdDNjNXBjOTZLSGtsbk9BZERiTG5GRFVKSWtYeTlRZWtrK0ZP?=
 =?utf-8?B?azgxbzFXY3Vac1ZicWdlZHNJOGV3UlloUFhBNkRKUHN4alpqLzFIR280a3FM?=
 =?utf-8?B?Q1Q5ZGdFYVdleVhKSjlWUWN3c1pDeEVWNjBqendOeG9rdGU5T2pGbzB1ZVV0?=
 =?utf-8?B?MUlkWkRmRklNRkRZdnNWc0RmMXNhd1M3MmF1Yi9pUW12b3gxeS9ZRy83b2gr?=
 =?utf-8?Q?kXHnDZ7I8NBNuQNq5Dn8XRkuFyMZkMHt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eERUVWEyOUE0R0FBTk96VGdwVHl6OWprY1BtZ0dNTFVaRE84SFJBY2E3R2dN?=
 =?utf-8?B?Rk13SmNabHZJL0twU0hhOE93S0tWQkRFNTlIRXR1TkY0RVVtSlJyR3JlaVNi?=
 =?utf-8?B?Q29qdjdIc24xeHV2c1F1WndxT3VGNEZsNGUzSk9sZXlWOFZiMUtMNStVaDVy?=
 =?utf-8?B?Vm1KaG9jNWpFeWNRcWRJTzVIVnhsMHVWRWxxU3V6azBMckp6SG4zNFQ2ZUs0?=
 =?utf-8?B?SFJVTFZhNUNqYVFhRkp1Sis1Wk9FU0QrWDhwaytUQVZGNzhJbVIxajZ2RkYr?=
 =?utf-8?B?QnhqNUlHNTVjb1dEaGNwYi9GNTFGSy94TFVkTHRjbk82eXRYRjU1ZjU2YjY2?=
 =?utf-8?B?dXJHalUwSGR4VlBmMEh6SVJqbnVDQnVIa3NWVzhCQU14aVBCcmZrM1h4L1R3?=
 =?utf-8?B?amxKZjNCaERhQlYyQnlLY1IxZjc3UU5uQ3NaQ0hlRFhHN3BBY2dHYUZaUXc3?=
 =?utf-8?B?Vk5kU0xoclJGVzJHZk1rV2daajdLVWczR1pBTGxGRGN6aHBzOUZIZWdmSWVr?=
 =?utf-8?B?ZzNKbHZQcWNnRCthSnl3V3BiZ1h2citFdStHVDNYc2ttTEc1QVNWVHhna2RB?=
 =?utf-8?B?MmptVmZWbXVuMUpzQnh2ZkJCaTh2bjRmQ3lYYXhHQ2lWSzFhaUJ0QVNneUJ3?=
 =?utf-8?B?TmpWNGh2UCtBTU5IQkoxUmJDV1FmcnRIcXdCTldvcmdiVzVmaWRPaml6VEZL?=
 =?utf-8?B?enU4K3Q0cGdJUHhKdGNGWDk0L1RzS2czVHM5RlVPN0RUbERldWRlSjQ1ZmRi?=
 =?utf-8?B?UGpCVGNWRlA2czN0TDhoRjRMTHhhYmRaTFp1TEFNTHRHZGdjbGR5SFE3QUhR?=
 =?utf-8?B?SndkN0t6VG9iSUs2VEhwbFJXaWtFOEFXaVpHTFp2c3BYQlFzMWxGUHc1RkRN?=
 =?utf-8?B?Zm1KRzFvNGM5MjY2ZjVBR0NnSE9Ubk83RFFYK01oRDlZWFd6THQ1RFRoMU9K?=
 =?utf-8?B?ZnpjRXU3amJvVnJHSCtnMTJPR2EyU2J0M3ZLUjFPQVd2V0QvY3ZvaldONlpS?=
 =?utf-8?B?UktmZndTMzVJc05SeEdvVGNrQXV5d1drL3NyL3FRaUVicDArb0tBd3pLblVk?=
 =?utf-8?B?c1p4U2U5TGZndDZwZUFXVC9VeDFxS3pzUkUrMlhKK0RqSFlsTCt1dVpST3Vx?=
 =?utf-8?B?QU9ZblFOeWcrRkRVanBpOGt3VFVmaHh2ZVQ0Y3VDN2hkcG1TWnVCTDVyN1NQ?=
 =?utf-8?B?RVNtUEFBZGticUxZTWsrUGNZWFBFcVYrUUFObHRBa05KNTNEcUtKZkhtTDdO?=
 =?utf-8?B?YjY4VDhkVlRDYTYxMnFUQjBaTFJoUnN0RDAwcGdac3JmR3ROYk50TjRuOGRt?=
 =?utf-8?B?d3p2aG9QWGozZTJFQ0xyREdmdWlCWExGT3lYME4vdk52WnQ2UDA5VXhGMG5l?=
 =?utf-8?B?VTk0YnRHRldIQ0VRcy9iSkZTeFpwWjFjMFVlVHdPWnY2ZExmNW5ZSlBYSXpH?=
 =?utf-8?B?Uld5SXJGd0lJVmw1azdnZHhpVnVzNitOdXlINy94bk9wTWRFdFp2cmVrbDF2?=
 =?utf-8?B?VkZKMGgwM2NIVWUyUXkzRmRzWnk2RUJTeWx5Sk9SdmlhRjdHcEM4K3U3MHRD?=
 =?utf-8?B?UjF1aGF1bmk3aFphREF5aWdNSWpzQ0FlMmZWT01tbHlLRFlKRmNlR09ZVnVu?=
 =?utf-8?B?OUIzaDh0aC9yc2sxZjUwU29RTldFZ1o5WlJrUzlwUk9YbDFqZXVoMmFQd1E1?=
 =?utf-8?B?TVV2U08raEM1YjNSakxweVZTZnptQllXbEFLbElIM3pGZ0hTU21aZ2dzS1Jm?=
 =?utf-8?B?MEZNRzdQanBiZWRMcUtCeWVYSU1obXJjVCtZZ0YwcHNGQ2VJYmpnbGRkSjZB?=
 =?utf-8?B?cXZSVUh3UjNTTTZVNnBQRWkzekVGYStGZm5DVENTakZaZXZ0VXdBemxid0pa?=
 =?utf-8?B?UFFnUHB5QVE5UXQvZ0hXL2JseWNnM012VnpOV3d4c1B0eVQxbmc0UFJNY0Np?=
 =?utf-8?B?VCt3ZDZScnRIVzBweHgrc0NjL1hybXlwcEJFOGUyK1M3QjZ6UVpZRzRwVzM4?=
 =?utf-8?B?YTJiMVQwd3VRaEJZY3RHSnBoZVNEeGpGUk40WHR3ckZsdHY5SnhUNWlhMnBt?=
 =?utf-8?B?TFp3UUFnNVFqNnBHUTlYanJwOFVjRXkzZzhhYTdmZElrb00rT0dxMmR4b09Y?=
 =?utf-8?Q?wkzTboWwGFVV1dt6zavDnPCHQ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ca0026-88d8-4193-e3a3-08de050bb672
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:08:20.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2uo65YndNDkGa828DgiZTrfebI0fW4qTDrAs9KvFBRoufs0h3pfpIbh7kSgv+I0molZuLzBrgMmmTdO4NBhEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7070

FreeBSD QEMU build requires libinotify, otherwise the build fails with:

./qemu-xen-dir-remote/meson.build:2535:15: ERROR: C shared or static library 'inotify' not found

Install the package and add the /usr/local include and libs paths
explicitly as QEMU configure options.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f295c8cb0a02..55dc9b39092a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -11,6 +11,8 @@ freebsd_template: &FREEBSD_ENV
   environment:
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
+    CONFIG_QEMUU_EXTRA_ARGS: --extra-ldflags=-L${APPEND_LIB}
+                             --extra-cflags=-I${APPEND_INCLUDES}
     CIRRUS_CLONE_DEPTH: 1
     CIRRUS_LOG_TIMESTAMP: true
 
@@ -51,11 +53,12 @@ task:
   install_script: pkg install -y seabios gmake ninja bash
                                  pkgconf bison perl5
                                  yajl lzo2 pixman argp-standalone
-                                 libxml2 glib git python3
+                                 libxml2 glib git python3 libinotify
 
   configure_script:
     - cc --version
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
+                  --with-extra-qemuu-configure-args="--extra-ldflags=-L${APPEND_LIB} --extra-cflags=-I${APPEND_INCLUDES}"
     - gmake -j`sysctl -n hw.ncpu` -C xen clang=y defconfig
 
   << : *FREEBSD_CONFIGURE_ARTIFACTS
-- 
2.51.0


