Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHoxFM/njWkm8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE2612E785
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229151.1535153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxd-0003O0-Dr; Thu, 12 Feb 2026 14:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229151.1535153; Thu, 12 Feb 2026 14:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxd-0003LV-AS; Thu, 12 Feb 2026 14:46:29 +0000
Received: by outflank-mailman (input) for mailman id 1229151;
 Thu, 12 Feb 2026 14:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqXxb-0003LH-BZ
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:46:27 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b919311-0821-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:46:26 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7838.namprd03.prod.outlook.com (2603:10b6:610:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 14:46:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 14:46:23 +0000
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
X-Inumbo-ID: 9b919311-0821-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yep6waRSrAL8Y+l0hvQxhnPU7z2AhQ//zWParBUFdMtXWKbz5rpx0G/1YGRck4EnQ7O4oP+YfncgnuwIseODEtqfGhOMPvYWVPEHo1SHJ0x9alDD0y3BvgKcOhNwmqvooQjPoWk89E7MYCFABYpfinP3CdSE7ln+oiwhAYir73doMF6HejsMHis3dbuTCE1RRa00q3z8qtzFEPgtJ5P4QeLCcpjJXkUcciCe6UO7jXwgNFVmM99rvjbHWCKqKnhIi+/nsInyH/W7CBulGoPBl3xXFNVCvctiYnZ2FcP6cVLbtlg7Fk6M0tA1WeF7o8GNOabiV+6r9K9LKRmSCHjtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UW6B+9cYW4G5mCYCzNimGpYVsiMYj4lwqwsPF+7T8EQ=;
 b=PJDeAOS0tjU40da7vDHlT7lnOSjBWlRk9Hato8h2lsYSncZl/7svd/hnLv+D+PqQBEIaqAeVZ765xop+6peIBMoZyuN8PaDm6Wxgmdg88EZ7JGVjusW/3bCymOo7SmgnzSTM4uHTsPCSB+87nOgb1IS5KL7rF34yhW58ZwtROxCymGt9HjcI7iaqxTOtaUOSKUFt3yJVVFwA4RDzxZb3pYFfRcFLhYp1/Jr0T32PiJLsyRjMdPweXtLQvk9diAbtSzcHFV0jbT/0/dOc9zTFQzn8+we8dbvpwtQPIdgMMxaW59z9ovJ6Nj+8sxYLqwpfObLdX35vcCN9YezrSnfjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UW6B+9cYW4G5mCYCzNimGpYVsiMYj4lwqwsPF+7T8EQ=;
 b=yRAbvg5ccdWaS1L6w0cptk5/m2MAi9bchJjjoft1t1ox9BmjI5YFJYwaQpCQldk2Yq6GZcmeCTCK0EySfg0gC75yxyzOATNkzBGlaT30EYqGjLhDoKZA/luWG9+1UXm+Wln3f2Joftta54mxG6ZdQcBwDMkWnfr/dof9kJsn5us=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/5] darwin: expand cross-builds to also support x86 and testing
Date: Thu, 12 Feb 2026 15:46:13 +0100
Message-ID: <20260212144618.43200-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0020.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::10)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bcdf6f-2692-4519-5edf-08de6a457dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHpERWRUdzdrSDh4UG9pUU1OazFBZmFDSHVqcC9HNWZkMlpLQnhxem9IQ21D?=
 =?utf-8?B?TUFwclk0NCsweGRmbFY0dGZEL2w0TytKWUFGRFZjd1RQNnpJanpveEJvT0o2?=
 =?utf-8?B?Wjlkdzhsc2dWWjYyMTAvT0k3MjZYZG9rSDl2VUV1NFFJL3IxUGwrTk80Rlow?=
 =?utf-8?B?aWlleUI3WUtUOEFnZSs3bWMzZ054UUt3cy9rTlMwUGZYdWlCRFFFamVWd3Vx?=
 =?utf-8?B?UXEwU2Qvak9oYkdJdGdvNlV4SmZuSjhPM1E0aUJVTWpHWkZGVFV1bUZjVE1P?=
 =?utf-8?B?bnlRZjMrTnVma0sweE93RkNxaEw1RGZtY0FoOUx2VndsNU1ZWktQbWlRdC9B?=
 =?utf-8?B?dE5OTktzZFRFWE52TVdkL2VwK2xydTVyY0tMZko5ek5qWUYwUnBCRHlleU5H?=
 =?utf-8?B?WWNNRjgwNkRGd0h6VkNNZmNZeTVLZjR1RDhRZVVaL3U2RG01Rmd5eDN0SE1G?=
 =?utf-8?B?bmpxVk1kdDVxUG84WG9Za3UyMUVHVjhsNzdMNmZiY2VuWnZaWEpuT2dtNUV3?=
 =?utf-8?B?WXA4azdQc1F4d1FaSExSam85VkhudFVIazRXMVd6a0VQZWlIbkRNV2F1RVdn?=
 =?utf-8?B?VlVGUTd2cW9tYWxEd0wvV0Y0NWpWTFlsYlV5V1dmNi9xVVBPcmlaSWhjYmkr?=
 =?utf-8?B?RFZrUXZnbnNOeXdJQko2ZEtiaVlGZmxWWlREdXl2WjBwTGg4RXp6K21JcFcv?=
 =?utf-8?B?K25DRTlhM2lPbm9vNWw0VWNQdWU2VVB6ZnVVQTZORWc4QkU1cWRIS21aNW15?=
 =?utf-8?B?OTJUd2l4UGpuY1JIOU1NWVdWTTR4cWpLWVlLL2FUcXJiVllveEZlUGY1YlFW?=
 =?utf-8?B?TnFMNDZTSWZ0VFhZN1BkYVJ0bHBmbDIydWk4clVIb2x5MnA0TkNSc0Rnb2ZD?=
 =?utf-8?B?aGNHcDRPcy9EUjNKRUwxRW1YbkFvY2FQbzRGVkpLd0dLbXdoVWRBT2xhOTN4?=
 =?utf-8?B?a1UrcUViSkFJVlBUbVJhblF1MmZCUVNUd0FqR0V2UUI3NDY4REQ3Y1BRU29R?=
 =?utf-8?B?MkpQRC9XZ2hVenpDWnc3enNPRGZPUndJYWRZbzE2a0dLTE1KTC9nVnpwUlBT?=
 =?utf-8?B?cW90VnZUWUNCeUdMd05KY3IrNzlMczBhMlprdlZYbERGSFc2WERXRmhhZzV2?=
 =?utf-8?B?QXZQZXZsK1E0Y2pIK2tWWkVFQWlrUys1Wk1EN0ptYXRxQVI4QW9EL25WanZr?=
 =?utf-8?B?N081bDFYRFdGeGhOemVaOVQxNG9GVkQ2alFxMjdRQzluV25SZ1NzMGJRWVJ4?=
 =?utf-8?B?R1lDSjkyRkpEdGUrakdKWXpRdzAzTzkzNGpxTXVSZ2xIZGdES3c3emNtU3dl?=
 =?utf-8?B?VTRZeE5RZ0VMaFNrQUlxcjdvYlJFRlZMbFZOU3JqMExtMHh3NzhLTDRTcXJz?=
 =?utf-8?B?SXh4MlBRb04zMHgwNmN1Ny9TdjZ1YlU5YlM5a2RRSmhLZkFhWnVxcjkxd21n?=
 =?utf-8?B?ckhDR0N6RFhxVUoyd0YreFoxZUVjb3ltYUo2QkZuc3FPZ2xlZGFCUWNBaHFy?=
 =?utf-8?B?eXhyQ0NucGVCSE02TFJRYkFsbnNzei9NNE5aelBQQ29naVZvbkY4czJXWVIw?=
 =?utf-8?B?dDU2aWF3WURVL08vMWlUZmNxL0NlWVBkb0N1cEcvc0ovL211MDlFcndyRnZR?=
 =?utf-8?B?ck9CamVIdW5abzJoR1NpS2FLUytXaVFIdTJwYngzZjQ4c2RRa3dZRk1rdXpS?=
 =?utf-8?B?QS92MEhUcnNaRHVpZFI2bTBvbXp3YU0wQ3ppeHBkUG10WnhZd0k4aXhzb2VO?=
 =?utf-8?B?NW0rZUZIVWhDNUhZMWFObEpNNThxVFFLYVl6MlhGRVVZbnRGamNnMnJDNlJL?=
 =?utf-8?B?eUY5bGV3T1laVHZNSXUrT3VlaW1SbVZPMHNjQ09ZU1YrdXJNVjYyVmhWd2VV?=
 =?utf-8?B?VFdkNkZkNEQwMDdzazgxVEdoSCtQMk1JdGorZ280NzZJT2hhbU1mUzRSUVZn?=
 =?utf-8?B?dXRWWFphelZvQWYxRktFeVkrajJ6K3NWRG0wcHpBZ3NhdTVGRGRkWE9qRVhq?=
 =?utf-8?B?enpzajFpWDdqckFaZ0pGZXFXTGdvMWMxeFJ6bC9GWldzbDVwaUN3bUxzbnV3?=
 =?utf-8?Q?lRmG9m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmxJUEtSRHJUTk9jWHdaclJleVhST2V6aDA4UmtnNFBuUVRHZlRRcU0wQU5Y?=
 =?utf-8?B?bm1QMENtb2FnaGxRcHV2ZENxRkN4a1pBcHJ3OTAxOTlkNjlMbFlUeEc0dXpR?=
 =?utf-8?B?eDZTdGV3VlNpeWV4endDWTB5NFJ5WVdJSGpaQUZ3SmxpeUF6RFhxTmZRS1hR?=
 =?utf-8?B?bjkvU3B3eVN1WmtaWmxDVDJxMGdacEhLM2F2c0V1VnNtWi9zNFVLYnd0MHVq?=
 =?utf-8?B?bkVtQ1A2V0RHazVKVkNSUUhRelFPZ0o5UFk4ZjIrbWFwRGRLbXNNazNOalFG?=
 =?utf-8?B?QkQ1SktHa1FsdWJtZTZvajhkNkt4Y3JjTkdRZ1VFbEZnVGdidFBnd3RhWkNt?=
 =?utf-8?B?cFdyWlFIeWRmNkFnWXRhV3BuQ2FsS1pzSVM1cU9EZitwTm5Eby9ZR1Z0Snc4?=
 =?utf-8?B?ckQ1K1FyMkFmd0hNbS96Y1U5ZWs4eTV2RFVaZk9wMVBBd2Y2QWhxOVR1Tkg1?=
 =?utf-8?B?NnVCaW9hRll3NDdzTk8yblFiOUZuN3QxQjlMRk5zUDNUeXJXQTYyVm1qb2Vu?=
 =?utf-8?B?VXprMkNCODdqMWU2VTUyV1JzWXFRN1dNZ0VHUEN1OVg3dDBZaTFiVmNSbkYx?=
 =?utf-8?B?U3kwdTB6RkdTS2VZS3RDSzBlNUNwVXNZdWg1akxnT253WmRhRUgvR1RKSkVi?=
 =?utf-8?B?V0VEb2RRYmlHaThLREtMNFdDZlIwQ1NldW1xYVVNTVJRWm13UVpFRWxHMXpS?=
 =?utf-8?B?dk5ab2t1MXd4STlzaGNhVFE1TG5CTVZEbU9LZE9vOTJDRjBLc3pQV2ExdUtU?=
 =?utf-8?B?ZGZVYm5oVWhSaHJ6U2FiTkpSZU1nWEc4Mm9xc2lvSXRzZXRRYm5xbUhEZ3p5?=
 =?utf-8?B?UENVZHFGaXhlbUI4VThBWWJHMlg0Z0JsVERCamYwSEsyMmRYcWNvLzVnSXp6?=
 =?utf-8?B?S0lBV052RVByQWpGVzFYT1QxMlo1WDZNUlpPZm9zTXlmYjFxK2lodWhoaEdx?=
 =?utf-8?B?eUpPSjZ3SGlEZzQvVjhJRDdCRStPdEs2K3pnNndWYmVSb2U0MGRsZU05ME03?=
 =?utf-8?B?MGl2VmpZOFpnUGtQMnFrRW05YVRGM2xmeUk2L3p6ZW9rbENOUE9LTzREM1RY?=
 =?utf-8?B?T1NrSVZIUjNodHViZnEycjNWZFh1bjBxbUtraDdoVk1HSFhBd1NNbGxFZ1Nm?=
 =?utf-8?B?eWMrR0J0dVFmbW9KTENEMGRJOXVQYXJaSWQxVWRXQVNTQ2VCN3B2ZmZsU2Qx?=
 =?utf-8?B?ZnZFZkpSYy92UFVzcnliclhUZ0xjWGN3WXlUTXVET0VzK0VkbjdWczJqNktV?=
 =?utf-8?B?ZUdrQlNSb2d0ZEpWcCtacmtNVWJHb29sUDNOQ0hkSStLTDhhMVJsb0UwdTRT?=
 =?utf-8?B?T3JiVWFxTDJzRlYyUGxwQXhMSmlHeWhzQXRhQ2FWQ3Y1RDNHRExqRE5yRnBl?=
 =?utf-8?B?MS9KNjRxR0pzdDZ0bU9sRmwycjZkaWRpeDlOWXBIbERJUnp6NUMxNHRkcjJS?=
 =?utf-8?B?K0R0Mkd3M3FRaGgvSUhUY0Z5SFBuM3kvcjNHNU9WLzBSNmpwOVhWbE9lL0ln?=
 =?utf-8?B?RDZwN05WeTlNaVQwUStkM1FURVhMNi9nbkFqM29FNmEzSDVnMFJtbXphRGZ4?=
 =?utf-8?B?TzdYdmF4WXJRYm1PRXg1NlBDM1NRWmZySEFyeWVRb1ZqbEUwK3JreXpzYkpy?=
 =?utf-8?B?dnJjWW1VTm80K2ZHRm9BYVcxMHgySERKT0lVZmdqNzRDNDc3WWFrVS9mdlpT?=
 =?utf-8?B?KzhXa0NGaTV2L2UyZkhUQ0hYTEtyU3JPNHRvbkJCU2lLR1BKOVhDSmUrUnN0?=
 =?utf-8?B?VnN5eU5GRU1rclM0SEpTVWZ1dVp3MlZoLzhUYzh1ZG9NRFlKRUFFYzhkbHRT?=
 =?utf-8?B?NzlHNnNVS2FsaThldW1LMUhaWk1uL2cxQ2NPdk8yUHVDT0J0MTRlSzBNM0hU?=
 =?utf-8?B?elZ2NFBxUlRwcWZSN3FwbzBERktlMzdJazBTVkJZOGdGRXRKMXdtYmpqdnBH?=
 =?utf-8?B?am96TlB1SVg2UjFRRDBva1UvV0ZuRWNXVWdBWVFqbE85OXhGQTFRUWNyODd6?=
 =?utf-8?B?a09oSGRNY09mMzU4TG5wWjlIM2JaN1hid0drSjZ4WnJlRUo5azJrZW81NmJR?=
 =?utf-8?B?OVVhOUFlRDRkbytnN21QQzludG9LRTRHK2YwS2h5QUVlN0tQS0h0TElmR0tI?=
 =?utf-8?B?WW9wdjJQWlpmVzRBUnRXMktyaElNS3FmQ014c1hBaWV3Qnp0cGFvVXpPZ0FE?=
 =?utf-8?B?VnY4YTl0ejRja1VWK3JwT1lkMW1JUmtRczRWTWZObi8weVc0NWdxbGFPWVBE?=
 =?utf-8?B?YXJvbmVramY0bG5wZXJ2alVQV1ZDQVgzdndBaUhpNERxeTU0SXlzdUlZNUk3?=
 =?utf-8?B?UDJVbC9JOWVoM1kyakFBcEVub2xKZFIzaTg1WlpEdEkzaTV6Tk1IQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bcdf6f-2692-4519-5edf-08de6a457dfd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:46:23.3694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tlPZwusdPVG5Bhq9barvQfEC51Xw7TjFmM+aj3TspcI8e+D9E44bhdy/nJf+h5bZFYMOBuqCyLzUyckUHT3LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7838
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BFE2612E785
X-Rspamd-Action: no action

Hello,

This series expands the recently introduced Darwin hypervisor build
support to also allow cross-building an x86 hypervisor, that's done in
patches 1 to 3.  Patches 4 and 5 introduce some Cirrus-CI testing to do
cross-builds from macOS, plus it also introduces some basic smoke
testing of the x86 builds using the XTF selftest, just like it's
currently done for the FreeBSD builds.

A result of the updated Cirrus-CI pipeline can be seen at:

https://cirrus-ci.com/build/6723050642604032

Thanks, Roger.

Roger Pau Monne (5):
  xen/x86: always consider '/' as a division in assembly
  xen/tools: remove usages of `stat -c` in check-endbr.sh
  xen/tools: fix grep reporting 'illegal byte sequence' in
    check-endbr.sh
  cirrus-ci: add x86 and arm64 macOS hypervisor builds
  cirrus-ci: add x86 XTF self-tests for macOS build

 .cirrus.yml              | 51 ++++++++++++++++++++++++++++++++++------
 xen/arch/x86/arch.mk     |  5 ++++
 xen/tools/check-endbr.sh | 18 +++++++-------
 3 files changed, 58 insertions(+), 16 deletions(-)

-- 
2.51.0


