Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CE3C73079
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166628.1493148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fg-000233-H9; Thu, 20 Nov 2025 09:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166628.1493148; Thu, 20 Nov 2025 09:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fg-0001zd-CF; Thu, 20 Nov 2025 09:09:44 +0000
Received: by outflank-mailman (input) for mailman id 1166628;
 Thu, 20 Nov 2025 09:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM0ff-0000Wn-Om
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:09:43 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6548358-c5f0-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 10:09:43 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5072.namprd03.prod.outlook.com (2603:10b6:208:1a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:09:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:09:41 +0000
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
X-Inumbo-ID: a6548358-c5f0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvqEzQQE/tXzbWUMyH9NoZ24Au6t/lP4787+plUMNo4PiwsfGV4CnFq1QNM+uS7rLHUlDpehnXU6zUSFdACLqgNdI9aR8RMBXqdNCBmS09u5c7yOl1AFxFAaLv9QmDEWWzaalgXADG/LOB89AEITkTQm75z5bwoT9HeBAOJu4d0yrLJXLSHnl/J/lN/EHDTHgRGLgPwPdV0RP8MlHzBkpf4EN7Bci2kDWXzGx6qWHkLqf9qg8pV8NT9rgyLlpt4SMt46vThOZqWLo/7i9UypuRuL098ZoP2OlbUXU+teq0EAeCkLTFhhFPVRabEwUjWQhics7D8EmxYNQ0DGMh3Hjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBn0wIUSagCcNXuxdruRc9da5j6+arDekcJulY68nFw=;
 b=T6rfh7nTS0cFO2U34ZTUpc0b4KD9dsZu2ksFz3A7/qD/OOr+3dtihA8zQANk4mVH0rryFPcOn4p6K8iCHgCSR2RhpP4NTyl8WlE99oX30C0D6FrLYSVwpTnd48wCwSISDsw1Y/y3n1Y9evmO1u+WRqx5LqusEUj+RwklgJs0AwDi5xD/HYwr7CBH64NaBN9j2ppMf2dvig94o3HHxMh1dWevAoxcF364+aBWrr67WbuHncAMV0vqAczSo2PTN++sPmJRKtK+FfqAfvmokumgyLowWmuMOFtPNbaeONG7ZU2zXHkY9mgCrIKO0N3ZrDvlfWSgvDiSIxT+exXuPmbgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBn0wIUSagCcNXuxdruRc9da5j6+arDekcJulY68nFw=;
 b=XN5sURsaIW4R5P5RKsQWSXZN1Zez8sZ5LuM22GuL0UuEql4LeQtlcJBOCjLliLpCNCfb1uxrlTWs2pmT/PATeC43dJ0mOhxBX7OLWsefmBq3BYRbveshp5PGVITKuncOWtjkWxZU3b4DfKjDeu7aWMAikrqbGwrm0fu8Y5P/roI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 05/12] x86/io-apic: purge usage of logical mode
Date: Thu, 20 Nov 2025 10:06:30 +0100
Message-ID: <20251120090637.25087-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120090637.25087-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0025.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ad9808-3aca-42ff-e935-08de281489be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXYxNFdFWUFIZGsyQ0ZraVhVYkdmMlhFbURXRzFYQitCdS9USlpRNkZ4L2Nx?=
 =?utf-8?B?ejJVK1AzbHNvRUs2UEtLTkk5dzFpQnBGL3dQYkZmSElLVEN5YmZEL2NmS2Rp?=
 =?utf-8?B?cjRPSHBQOGVZT2RMVktTTEdlZTFtaUJxaTROZmlYSy9pWUxRU0VCbXZMSE5E?=
 =?utf-8?B?UEFad1cwTlFDR1NwNEUrZHlBeE5hbmpXOWtHOENLUlNGOTBleFpnNTZGallU?=
 =?utf-8?B?MTRocEswMEoyajYzZHl4c2pOTk8xWXI4VG0ybUFJaE1YcmhrNGJ5Q1F1TGt5?=
 =?utf-8?B?V3FBenNWUklKSUw3NWIxckppZEduMHdZVmJBRTlnTUVSNE1NZFZKZjJiUS9i?=
 =?utf-8?B?eG5OaEVrb0hkR0Z1K0JON205aEVCRTJhenBFSjF3cmJGM0swVkQ2V3dNRVpl?=
 =?utf-8?B?SFVPK2hYaGluTVBQdGNxRDlYTUJmMVRUcnE0UlJiSnBtZURuMTkvUDJ4YVkz?=
 =?utf-8?B?REVLTXNUM2pYWXNwazRzTEo5bFFabXBZRHl6NFpWZE9Hb0t0ejRNNUtKWXE2?=
 =?utf-8?B?MWcrdnNxbGltOVhSbkMycXJ6WXZJa3VlMElzMk9SMnlrSXJDbGhCUHE0c2xW?=
 =?utf-8?B?NTJhUGNWWlpQQkRhU3lxNGRObHpsR3FtT0NKUkN6QjdhKzJYNVg2blVPenJh?=
 =?utf-8?B?RXV3QXpWK1N2U3pSRU9QNm9KRWhtZHl6RHRDbi8wZWxEaFQyWGFEcDNkQllG?=
 =?utf-8?B?VFMvN3N4aGxSSDBuQVJwUERHVXU4cEorMEMyNVBqNWQrdkpEYnBXSVhUR2Fm?=
 =?utf-8?B?OWtubGd0NGJQdDRuMDlWdEF4djhZaGd2YUFpeWk0Mkg1WGRyTTFEZnpTckNt?=
 =?utf-8?B?eW13dWdVTyt2eW1qMzlmeWR4REo3ZW05aE9qL20vc1FwMFhDT1ZEekNna1J6?=
 =?utf-8?B?dUVaSnpHd3RadzdqQVRHckJndVNiT2Znb01FZ0FjSDFlSnZxSEJNQTVteWVV?=
 =?utf-8?B?cnUyTWxCZENqUi8yLzBVdEJFemF6M003VGN6dzZ6Q3gzTER0YWZaMVN1cnpn?=
 =?utf-8?B?clVDNzNEcWF2cWlndHJNSEw4allSclBscDN5bjNoWTBzOCs5cHZ4NDZ6TlpO?=
 =?utf-8?B?ZHJxT2dqWkhRd1lEZ2hZOVkyK1loZ1J0TTQxOTZDajEwQWh2Y09hOU5UbkMw?=
 =?utf-8?B?UjV4VmFWSXdTZmt4eGkveEVQNnp1elhNZll3VEs5U1pHbUhJRXJVWGxzL1Fo?=
 =?utf-8?B?L1VVZVFidlpxWkZMWmR6VGFqVGRFTzQyMldDUS8rb1E4TE02TTdoTGVuNzY2?=
 =?utf-8?B?UnpweXNwR3JBNVYwTjV1d2s4S05WRE5uSXZGb2R2cFZtYUpBb1hsTGtVM3By?=
 =?utf-8?B?NGI3cWp1SlNBOTNPbDN4M2o0QzFYcHpzRm4yVUVmZmRxeE56NFh1Nm5nem4z?=
 =?utf-8?B?ajk0bGpXd0dqbU1FSklHVU4va0lSNnNVSlJpUzRNMlVwM0s2d0V5S2JXTVFG?=
 =?utf-8?B?Vnl3SGdlTFNHVFI2Q09mV2pOMXVrQWhiSk9KQkt4MU02Y1NkYzROcFBMN09t?=
 =?utf-8?B?cEpGeEdURE9QY21mcXJ6dWYwakZ3bGpXRWdoNWJlZ1NESTNkcnF4VFhha0xa?=
 =?utf-8?B?WEhWN2NLMkdXNW1iRjcxYlMxYTNleXowLzN1L2xBbTAvUHlDTTBnYjF6MDNT?=
 =?utf-8?B?Q1Y1cFg4MTJ2RGlOQ01CZHRxU2VvZktQTUFseWdtWjN6YmFONHJqUFNlV2NF?=
 =?utf-8?B?QnhqWTkrVjRxTU5QZllBOW9aZDBrQ0RYcDdzVTBXaXdRbWRMUlA4UjRyWFRE?=
 =?utf-8?B?all4aE5YK09TcFFYWUxyd2QydTN5bm9zQmhMaFJPSEMwNURRR1RtNytmd3Nq?=
 =?utf-8?B?MjN0WldwbkdRNXdZMjJnTHlrZ2pQVjk1N2hTOEJJWnlRcFQwMm1BWVo3Ni9H?=
 =?utf-8?B?ZWFLRDNGc1FpeXpuV2ZteFN5KzRZbWFQemJDMDV4Zjg5c0kxVGdHVHQwa2JN?=
 =?utf-8?Q?XaI7bIOcfoFFujR3COAVYxvUSCTvqwvG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDJ4bXNnT0p1RGxWOXgyeWVkTExPbWYvUjlRZk1ZWW1RK2U2VzdTck5qTkl5?=
 =?utf-8?B?b2loWkcyYmpVdkpjbkFCRUhuVlJyYUo4OXVVYjIzQ2hNd3lUWUJaV2VIWWRF?=
 =?utf-8?B?N2JKT1h4c3lpZmswU01FRlR0eG1wMHRBMjRUZnEzNlgrWXVJNVUza05MMEZZ?=
 =?utf-8?B?aTE5bkhpYU8wTHBUd2V2eHZMQkpMR2h1UWNGdVZsMHdCUXJ5bUN3NUs4NkVK?=
 =?utf-8?B?ZTFUeC9QVUpRZ1kxczU3SHBrbzc5d1JCZFdFc01VVGF5N0RQMFdyd2hvQUYv?=
 =?utf-8?B?b0NxNWxNYys4NUJyT2phWUNPbzMzQis0TlUramNvWndxVnhzVzA3anplVHpa?=
 =?utf-8?B?TlA3QkdyQ294a0hxQ3lWMDZzTFpEQ1Z2OFRPdGJuMktlRW9hUWVQVE1hcVhZ?=
 =?utf-8?B?akUyTVFBVURHc0xnU084VlV5bVovOGFpdGJFZXBEWmtGbkUyQ0xMWmJrVkRk?=
 =?utf-8?B?bFoweCsvRlBkVEZGM0lQZDYwWVROb0I2OWhEWXNDS2J0aXRpUFEvVjJicG1q?=
 =?utf-8?B?OUFNYUNEbFhiT2V1b1k1bm5yZTE1TkptRWpqdlZRWnF3K21WOFcwZW9oakNP?=
 =?utf-8?B?Y3UwVEl3ci93STd1NG1YOW5qS3I3eXhKRHN0cHZHeUdnT3IvZm4vRkVyUVFT?=
 =?utf-8?B?Z1dyQm1xRjBydFhvd3BkUjZRSjgvekJha0J6Qm51M2JmTTNyRnZST0R0NGZO?=
 =?utf-8?B?ZWxFV2Y2YnhmV0FWd2ZHVDdWcmNUUzlBb1NCNkVVeHdBQUhkMkU3T0p5UGRK?=
 =?utf-8?B?UmZmbTVBVUc1eG9QTHI2OTFZZlpBanFCdHArc0xNKzRnWnRWbnM2YzJUWnNZ?=
 =?utf-8?B?WW5CZFpYS0s2TExqU2NLbVFqTG4yeVRhSG1JTC84blBjNjkxcDJyTE9vT1Jo?=
 =?utf-8?B?MzBaZVc0bCt2dHRwS1I4eDZuaGlyOHVKWWovKzk1U2IwbU5hN2w1ZnZLSVZL?=
 =?utf-8?B?bVM1MlZpOWxKN1BHdmVrOWJPN1FEdHVSSkl2KzA1Wm04MjJ3R1lQVGNZMmRy?=
 =?utf-8?B?N05OUmQyZys5eEp2cFZzOHNQSC95OXdRM2I5Q0VQVDFHQys1alhkbER5WkNi?=
 =?utf-8?B?T3oxVE0wNkZXcGdOK0dGMzlkZTlUMnZHNU45MUo1ajF5Q1d6blhHekpwd2sr?=
 =?utf-8?B?cEpyWmRrTENxVFFlU29BbWpFdFJadFV0alc5VTBqK0MvTnZJRFZJT2JUUDAr?=
 =?utf-8?B?bkJYYndjM1Q0VUJwajZYUGNkdC9NR0lQa2NmZktiZGk5VnRpeVUxRnEvKy9R?=
 =?utf-8?B?ZHhxY0ptT0p3LzBmYm1jVmlZNzk0Z0NKRFhJOVZIK0tia0FqU1lOYlR2WFdh?=
 =?utf-8?B?QlpWbXFsL05IZk9ONnNDNDYyaHhZckpGbTBwTXNsZFJvQVJnS0RzbmhYWThT?=
 =?utf-8?B?bnNOM3hjUHlPcThqOUcwNHhxWkk1N0J4KzVCZ2I4OWd4SG9JbzF3aW1Cd0lG?=
 =?utf-8?B?bzEvakt6UmkrUEo1azN2dGQzaE05eExOZEdVVW93TDJNRVZWajVGWWZJNitV?=
 =?utf-8?B?SmlMZjdTTG9zdzlBWWlkWEtuekl1TmQrS242bUdWYnVhbjhOcm9PNXRvb1Ux?=
 =?utf-8?B?ektpTVk2bm5qeXVSTDByU01IQ0laZENKaWJvdEMvQ3N5bUtMRkdzS3FKc1Vh?=
 =?utf-8?B?YjZQSk5BdXBjN1hhRnM4eFhWajJmc2Vjd3lQNDZWUUY2b1NINXd1MDhIK0tG?=
 =?utf-8?B?bnZiOGw0TnNxYlMrdi82WjQyRW4rdUNJQXlXaUg3dXRrZjRzek1kY1VQc04r?=
 =?utf-8?B?MHdzYU9hM3d5ZU03MWhmRlMwL1ZWaDFXYk5GajR3Z0pmKzFua2czMlkrbW41?=
 =?utf-8?B?SGhEUDhrUVZQU1F6ODBXYTZKU2JObVJaM3Z4U0lKcGNmblpSeGpITGJmWXA0?=
 =?utf-8?B?VGc2RXo4dU5YZW01dXJoMEkwdlpSNnRIR0xSSVZHK0pNRFlKRGlETDh4WE40?=
 =?utf-8?B?cVFjNjBPR0ZnekdkcGNwR014Z2dweEdwVmlDZ1JTK1NsVEdiVDY1WW90VFpY?=
 =?utf-8?B?cXVxejZmME9CVEpBWmVscWZHSUhWZVNTcFBDUHhjZTk5K0F2TzN2SlJzNGFh?=
 =?utf-8?B?bUIvRElzeWcwV1BUemVSZmNzTTJvVnRzaFFraHJPcHNMVDJ0dXhnWnBPV0tL?=
 =?utf-8?Q?4armV9B8biJGP6w9sJc2bMXOE?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ad9808-3aca-42ff-e935-08de281489be
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:09:41.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SanoW39GGlGvFcMvVPwKihEthr5cMwUdG48chmK/WJjhJHMdxk+P2Ad0lgu/2JPJl6lS283ZctavkKx08WgsDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5072

The IO-APIC RTEs are unconditionally programmed with physical destination
mode, and hence the field to set in the RTE is always physical_dest.

Remove the mode parameter from SET_DEST() and take the opportunity to
convert it into a function, there's no need for it to be a macro.

This is a benign fix, because due to the endianness of x86 the start of the
physical_dest and logical_dest fields on the RTE overlap.

While there also adjust setup_IO_APIC_irqs() to use the target CPU set by
the assign_irq_vector(), rather than using TARGET_CPUS and possibly
creating a mismatch between the target CPU in desc->arch.cpu_mask and the
one programmed in the IO-APIC RTE.

Fixes: 032d6733a458 ("x86/apic: remove delivery and destination mode fields from drivers")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 46c2a43dac6d..3c59bf0e15da 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1037,12 +1037,14 @@ static hw_irq_controller ioapic_edge_type;
 #define IOAPIC_EDGE	0
 #define IOAPIC_LEVEL	1
 
-#define SET_DEST(ent, mode, val) do { \
-    if (x2apic_enabled && iommu_intremap) \
-        (ent).dest.dest32 = (val); \
-    else \
-        (ent).dest.mode.mode##_dest = (val); \
-} while (0)
+static void set_entry_dest(struct IO_APIC_route_entry *entry,
+                           unsigned int apic_id)
+{
+    if ( x2apic_enabled && iommu_intremap )
+        entry->dest.dest32 = apic_id;
+    else
+        entry->dest.physical.physical_dest = apic_id;
+}
 
 static inline void ioapic_register_intr(int irq, unsigned long trigger)
 {
@@ -1109,7 +1111,8 @@ static void __init setup_IO_APIC_irqs(void)
             if (platform_legacy_irq(irq))
                 disable_8259A_irq(irq_to_desc(irq));
 
-            SET_DEST(entry, logical, cpu_mask_to_apicid(TARGET_CPUS));
+            set_entry_dest(&entry,
+                           cpu_mask_to_apicid(irq_to_desc(irq)->arch.cpu_mask));
             spin_lock_irqsave(&ioapic_lock, flags);
             __ioapic_write_entry(apic, pin, false, entry);
             spin_unlock_irqrestore(&ioapic_lock, flags);
@@ -1140,7 +1143,7 @@ static void __init setup_ExtINT_IRQ0_pin(unsigned int apic, unsigned int pin, in
      */
     entry.dest_mode = 0; /* physical delivery */
     entry.mask = 0;					/* unmask IRQ now */
-    SET_DEST(entry, logical, cpu_mask_to_apicid(TARGET_CPUS));
+    set_entry_dest(&entry, cpu_mask_to_apicid(TARGET_CPUS));
     entry.delivery_mode = dest_Fixed;
     entry.polarity = 0;
     entry.trigger = 0;
@@ -1432,7 +1435,7 @@ void disable_IO_APIC(void)
         entry.dest_mode       = 0; /* Physical */
         entry.delivery_mode   = dest_ExtINT; /* ExtInt */
         entry.vector          = 0;
-        SET_DEST(entry, physical, get_apic_id());
+        set_entry_dest(&entry, get_apic_id());
 
         /*
          * Add it to the IO-APIC irq-routing table:
@@ -1806,7 +1809,7 @@ static void __init unlock_ExtINT_logic(void)
 
     entry1.dest_mode = 0;			/* physical delivery */
     entry1.mask = 0;			/* unmask IRQ now */
-    SET_DEST(entry1, physical, get_apic_id());
+    set_entry_dest(&entry1, get_apic_id());
     entry1.delivery_mode = dest_ExtINT;
     entry1.polarity = entry0.polarity;
     entry1.trigger = 0;
@@ -2137,7 +2140,7 @@ int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int a
         cpumask_t *mask = this_cpu(scratch_cpumask);
 
         cpumask_and(mask, desc->arch.cpu_mask, TARGET_CPUS);
-        SET_DEST(entry, logical, cpu_mask_to_apicid(mask));
+        set_entry_dest(&entry, cpu_mask_to_apicid(mask));
     } else {
         printk(XENLOG_ERR "IRQ%d: no target CPU (%*pb vs %*pb)\n",
                irq, CPUMASK_PR(desc->arch.cpu_mask), CPUMASK_PR(TARGET_CPUS));
@@ -2334,7 +2337,7 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
         cpumask_t *mask = this_cpu(scratch_cpumask);
 
         cpumask_and(mask, desc->arch.cpu_mask, TARGET_CPUS);
-        SET_DEST(rte, logical, cpu_mask_to_apicid(mask));
+        set_entry_dest(&rte, cpu_mask_to_apicid(mask));
     }
     else
     {
-- 
2.51.0


