Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2286C6ED47
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 14:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166030.1492676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLi8Y-00013B-Sr; Wed, 19 Nov 2025 13:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166030.1492676; Wed, 19 Nov 2025 13:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLi8Y-00011j-Q3; Wed, 19 Nov 2025 13:22:18 +0000
Received: by outflank-mailman (input) for mailman id 1166030;
 Wed, 19 Nov 2025 13:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRf7=53=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLi8X-00011c-4S
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 13:22:17 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3e72f08-c54a-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 14:22:16 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7989.namprd03.prod.outlook.com (2603:10b6:8:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 13:22:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 13:22:13 +0000
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
X-Inumbo-ID: c3e72f08-c54a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEJp9XEX0TQZpIkFqLFwpHhqXQC11rYrLDNvxjrZ64gGa2t54Ebcje0mcWHQl1rPJFasQNT4rVz0paOsgY5fVlbmVCnembpug7+bEsn6q7Q8g+maBwUN1qM29FYNqyB8jXMtw9L1JjBTyRlbKRgpgus+9EDlxDkCI1oQASNxm2K3gn4KUMh2LYGzXSW4GigtRU1sejw6UIX8+G8n8PlOBGXcuR61Y/Wg6gEtkzv8wYMkcOv/h2Yv3MojTWy1XLSAQ2OKddCgbcj4gdh94blWJCozA0lS0v0lDtk/9Ke9KuBvdxbPS81t7v5Y0eYyr5pYiSZKcP2AxxW3vlhHWcd3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aihNnCGI4tJ8zoQ72ytyPTqMzPj/HcLyikTFHTHi3gQ=;
 b=ZgVQ+WUBwwrvMNqTgUeIfuXJ3QnbJMU4jdomOmpcThYGLMBNOj1xYyB9cZsXSu1FRcLswrCW+pgeR02pNJjyUmgQxRebGxkW7P9x3hZBBuGeQdjQMQ2v9aVGrdSpOoAZlaitF1CvS38DLjsNi8zSRlm6ab2xs0Na/mpjIPjH1E9hlbNYV6ECnXXWyFUBpoHFww3z8Vgmn3H5E2mM1QhiLrKtTkP+cEvHBzWVnrNOvSZ6asJvV2spckxPvAQRf2wJ84YwBv+zINGVxYif/gwUXlyDkEwB8DU09q3MSf9/Fb9b8tzk3t0649aOWsDCQYsKCqYFNITkXXNvyE4hJrOqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aihNnCGI4tJ8zoQ72ytyPTqMzPj/HcLyikTFHTHi3gQ=;
 b=KQqrnvw5omu8qgKLy6Abb15eVBozBqLVhmpOXo7zWo88rdO1yxDAySvjyCm3OyfjGVOUWAxWCOg7A4VFTDWhnz8OUnWHHjlF2HMPs2cmLZaoddatPZ1Ub2uDiFQ1E7mzbc9Y0X7VGtC6RhkXD3gX4eaAtCCf1jzMwVcNOhxjCvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3ffe11b9-db81-4930-aefa-e55d758645bf@citrix.com>
Date: Wed, 19 Nov 2025 13:22:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] error: Consistently name Error * objects err, and not
 errp
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
 harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 berrange@redhat.com, peterx@redhat.com, farosas@suse.de, eblake@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, zhao1.liu@intel.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-6-armbru@redhat.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251119130855.105479-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0326.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c1ebd8-acb5-4a89-379e-08de276ea6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1VFeFE4alBsRm04SVcweEhSeG5zUjE5L01pYXVqM0VLdytpNnNaN1NGa0x3?=
 =?utf-8?B?YXIrZURDM0dnaFZCTHd5STh4YlFvMGtBK0VNQ2UyYVY0aWVZK2pYdnQvR1h4?=
 =?utf-8?B?eHU2Uis2Rzl6OGJaMVhwTzRvb0dmb3JNVUhYYWx5dVpUcUtYS1A1aG5UWEVB?=
 =?utf-8?B?dXRVNjN0elRQWXExaUpWbkE4b3NxVzVMM2R0blRuSW82bHFob1dSVXJvK0Ny?=
 =?utf-8?B?ZXdITEtUVFdaT0Q1OHJhRFZwaWZoZ2NoUkgvek1QRlhRbXo1MVZRVXdyVDI5?=
 =?utf-8?B?OFdLUC9yQWY0NkxRbTRYM0kyTzNCaGVBSm5oa3hzNmM2YXl0OGZiODZzVit4?=
 =?utf-8?B?MmpRL0p1MzlVSkN0dEpWcEpUS2RDaVVpWUJCOStRRkI1UTlmRUVKL2J1dzlY?=
 =?utf-8?B?SzA0RTJMWWg4T2ZwazlRaFBBeXhxVDZUN0hCcFd2cVc1bXpKYlpRbElDSGtq?=
 =?utf-8?B?Z2Z2bHNtbDI3WkdDdkJwODlmSzE4TGlCcmZKWEJEdFJPN2gwTEdSR0ovK0hE?=
 =?utf-8?B?QzNLQXhtMU04NXFvYUFjUkNJTXdPVndoRXllR3drcWRuZk5OTkRja1FPMEVV?=
 =?utf-8?B?M3BOYW1xRXFXZVN5dGFrSUVjbzd1S1BNU1NqY0E0OXI3VUEyOGdoM3ZxVkpw?=
 =?utf-8?B?NGIrLyt1Szl0dmxQL3F4UjE4UlRwdEYrQXgzZnlPRmJxZE9FT2lhZUFFSXQw?=
 =?utf-8?B?eFQxTWZwZTBVNExBZWlKSzFSbXJxVlhUSFExaHUrQ25Xa0R1ZEg5KzhZVmcy?=
 =?utf-8?B?MnJHUEQ4SllYNTVOdHExd3RZVWRYNUdwczFBbVJqWkRXdGpFMXNhV1IvbXNS?=
 =?utf-8?B?MHJOTXRacmFNaG9TOW1DeHNXVUlrei9GbWhVaGF5Q01DUnYxOUpUdG9uUkpB?=
 =?utf-8?B?Wlk0YUEvbmJDd0ZJTVBXakdqY3dNRFg3dzRvRm1iNHdSYXMrZlZwVGw5WGpt?=
 =?utf-8?B?TlVFMWxmN2c3Ui9DRXh6WlR6dFYzN0R1QUtJSm44MFFwNkxVMnM2a2hCbjVK?=
 =?utf-8?B?dytVOGQ2MzdKZ2xJanJJTHphM2xFb3QwYnQ3R3U3LzV5Zmlqa2FQdUJIcjhZ?=
 =?utf-8?B?UkpPall3NWZyak8zWndYZE1IM2pSbDA4RTlCaEhYYWYzNVF0NUgwaUR3MDQ5?=
 =?utf-8?B?K0JUdmoxRDZJbXFuazZUcTNTZlpnVGtyKzNudHZHN0FMNDV4L2dpMEJSMVZ6?=
 =?utf-8?B?Tk90djdoWStPa1BmVnpMdW9seHZUNklUclVWT2NOeEt2VTNOSFNkMU1kWEtl?=
 =?utf-8?B?bC9WeUk0QnRJWVRMQ1lYLzZOVDV2S2JNcU4wWG4wQ1A3eExDRTg1b0Izc2Rm?=
 =?utf-8?B?MVM3T0NGV2dhTVlDdkI4NDVwMTl6L3JaNmN3MFU0WnhmSkhqU3kyVWJzM3FS?=
 =?utf-8?B?K2xIMGpmNVZMYXJaVGNzQ2xOdkQxNG5icHFHZVlYR3k0U0R6UWtSZ0Fxa0Zj?=
 =?utf-8?B?bEpaZ1hIdkQ2UEd4dDNKVFp2YStNQk9mSUhUOU13eU9ka2hjOHlUcEJYcVBk?=
 =?utf-8?B?K0ZkcFdLeVZoQ0VnMFR5S1d3YThXeFNKMitKempocFd1UENndk1MQUZRL1Z1?=
 =?utf-8?B?M21tUmxhcXRYNzR0UHNvdWxmMURYVU9HVGFNSUs4Vi9EV20yU3VxejFSUVlG?=
 =?utf-8?B?RXBNMTM5cmlpdEUrNkZ4cW5IVTVZeUcvOGhhOWVRVUpBWUdDR2lRUitDeFdH?=
 =?utf-8?B?UEFTM0VUZjRDYlZCdkZ5bUgwOFpmakdNZmQ3NlpQNGI0SDl3VnpPa2kxMlpY?=
 =?utf-8?B?ZHJHSnZFdmVZQklqRkx1Z2FsektHbVAwT3AwbTlMZWJQUXlVaUVYNU8rNFZi?=
 =?utf-8?B?NWZoVDZ4T0s3c1VHZVM3Y3RMeTgvUWcyTmhyeDEyUHFXLzRXUndhZVhVa0Vp?=
 =?utf-8?B?allNNmtRVHpjelMrT3NCYnIvdlVvZEtPNVh0NkxBYTZmcEZUaCtDTFRFMU9r?=
 =?utf-8?Q?amf2NRy23zoKE8eFNIXuOL5nbM46onOY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnFtWGVrZXp3bG9SWENBSWZ0TWRncGJpcHFwbWVDT0wxRVR5RDYvaUJTVTNh?=
 =?utf-8?B?Qmo0ZXhmdk0yVUlrdmF0S25nK056WEZOWENNZ2hpZytqb1RxZE50RHNFNks0?=
 =?utf-8?B?RU1sa0RLN3pMQWdrdzNZc2FzZDMrNWJtN3Btd0o1Z2hHNHQ1d1VHV1dmd2lL?=
 =?utf-8?B?Q1l6dGpmY3lEL1kwZmw3eTJWaGF5aitxYUVJTjNxaUJiNVVyTDBRaUsvVEJS?=
 =?utf-8?B?Mk1sdVEyQ0piTDVRSS9xU2p1UTBsSzVjeGp3QmlMUGhuaW5vdFNnczdhbHYy?=
 =?utf-8?B?aGtZdzYrZG4wUkZoM2dzdU5IWHBxbjRlSk4zOXc3bTYrcHNWUlhBbHEyRGE1?=
 =?utf-8?B?c0N6RGJQaS9weVJ3eUQ2RjZ6cGpJT3N2bjRMRE1aRkFkclZXa3Q2bWlxV2Na?=
 =?utf-8?B?QVUvTVlwUURiZjRKMStvTnZleUFOaDRnaGVjdTZxNWdNU0NMVERuWXRLZ2sx?=
 =?utf-8?B?SEZvaWdnU3VEWUVYS3dCM2R2cGVWZjlQdlQ3TmU0aUlyY3A1S0F2b2lzaHVM?=
 =?utf-8?B?YlY4RnZ2ZXZWS2xrc3hTREdsa2F0dGFUVHJkSDkzNStXOXdXU09jeTNoRzJV?=
 =?utf-8?B?Z3I1YTJPOGx6enNYSERETGdPVWxOUFl4Q2doeUZRRTVxWGkxcVA4NVYrLzBQ?=
 =?utf-8?B?d1VwdTR0K0NwUDA4VzdJQk1Jd3Bla0t0OW5HWXk4MlZmdi9tcEpVUG1ncSs1?=
 =?utf-8?B?RGVPMmgvSmtKMVR0OE9zUXFjeVhiaStxNGNRYkZMbkVXVlZmREVRczJIZ0RO?=
 =?utf-8?B?QnlMTUNJTGdRQlpOaWFCdHBTQnArcWRsNWxsdDZ6dEd0dnN0UFY0YjJiZlI1?=
 =?utf-8?B?NEdtdG9mdTk0a09mSXJ6eUg0QWhjb3I2UFpGOVNXRlJLWFIxUVptSFBYVTNw?=
 =?utf-8?B?WHlOWDN2U2ZDM2FlVVNxc1A2d0EzM3NBTWIzQTE2VUM4ekRscTFJVEdpc213?=
 =?utf-8?B?ZTBFaWNDaFhvemcvazVrRTQ3YjNnZkdLU3VtS0tKaCtyNk1XLzJ3Q3hkbTNB?=
 =?utf-8?B?aUZUYlJ2aU9OcitOQWI1TndVa3BWNWtCbVVhbk00V3oyMmRkZFNZY1JPeGF2?=
 =?utf-8?B?cHhLTDhndGJuZlAzSnJiUlRyZVk1NDFya0MzSXlFVVRWSUJRb0JyUDExcDFR?=
 =?utf-8?B?dS8wdEZmMHJOMUFPK3JwS2JKSzBQZTNXNVFIOEYrZnZMeTMyM0Vvb2FBNVV6?=
 =?utf-8?B?VjROZExuQlRLZCsybkV3dzRKbnVyaElrUmowL05OV2JIR29QaDNhR1huMDRx?=
 =?utf-8?B?d2ZjcGVlMWtjSGZXZGovSWJpK3hHL2dldlZGbUk4Z1V6eDhGVDZ1U1Q4QkRJ?=
 =?utf-8?B?c2oxMWc2OHNSUzc1dktLYmlHdlJGWlZza1FZR0Q1dUFhTTczaG54SFBoUndZ?=
 =?utf-8?B?N2hKQ1pKbUZSdEl6R0xaV3l0RkRiR3QwY2hkTXQyWjRLSm9weXBZcU1PRDl5?=
 =?utf-8?B?elpSeS9CdWJSUmdvOUtlbm5qRjF3MkJUaTZhUGJpM3JpMitOb01LYXFGcFEx?=
 =?utf-8?B?WnNObUhyUi9OVGZTUE1rVGl3T1BObU1FTHVXT2tTUzg0bG5Gd3Y5M2VWSTZG?=
 =?utf-8?B?UDRIK3JrdzZ5NGNmaHJnZENvYW1ac0dCcjVoeFFaaXA4QUp2WE1KSVAxRnJO?=
 =?utf-8?B?WCsrNGEzSkFYOENwWE5MN09TdzhYUnRXeUMwK3JRSkh4dWFDVGtpTE9Cc0w3?=
 =?utf-8?B?NnkzM0xrVHJueGQyOVJPQ0ZIUHptYW1OSXNjL0s1alduSE5yUEtKY0RQcC92?=
 =?utf-8?B?SFRHTWpTenpTUlNUVGROL0NRWm5kSGlXbjFkcUFVRzBmbGYyMmN4ZHZ1bXdF?=
 =?utf-8?B?UEJVcFRGMkdYbU1xZUJzand5QVhSZCtUdi9RbjJiYUVBZ3hETkhjSmttM25m?=
 =?utf-8?B?YzlvV1BBZmJTa1FYRXBmZ3RZU1BVQWFzUWx3SFp3Y3dEVTY4YjdUSFFHcEpQ?=
 =?utf-8?B?SFI1a0lERUhSbW5TUTRaN1JTZXpObmJGZHJTcDVIeS81NDJWcTN5cEI2cWQ4?=
 =?utf-8?B?Kzd6L2FYQ0FiTjFmUS9ZTGdGQXlFdXpHM2E0N3dNTTdvYm53SGl3UHlYbThG?=
 =?utf-8?B?aXB0QjZpWjcydENBUEIxeFR3cTQ4SGN5R3R5QWRlYW0yTUJLYk14U3ZuVzlv?=
 =?utf-8?B?L3lWU0p2R0lFME1RZ01FeDEyTlhIZGl4NlJ5ZzBwSmlwR2dPWURyeXFveUVy?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c1ebd8-acb5-4a89-379e-08de276ea6dc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 13:22:13.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IV97UAwBFJ6bMGnajwqCPvyrxiVdAL9INiK3J3Ly+fIs+JwJYzpYKB7epKIQfrg4h46BCho8oFqe+DnV8wUpOaWA1TG+Q/De73LxSCJ3j84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7989

On 19/11/2025 1:08 pm, Markus Armbruster wrote:
> diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> index b93ff80c85..3e62ec09d0 100644
> --- a/hw/xen/xen-pvh-common.c
> +++ b/hw/xen/xen-pvh-common.c
> @@ -101,7 +101,7 @@ static void xen_create_virtio_mmio_devices(XenPVHMachineState *s)
>  #ifdef CONFIG_TPM
>  static void xen_enable_tpm(XenPVHMachineState *s)
>  {
> -    Error *errp = NULL;
> +    Error *err = NULL;
>      DeviceState *dev;
>      SysBusDevice *busdev;
>  
> @@ -111,8 +111,15 @@ static void xen_enable_tpm(XenPVHMachineState *s)
>          return;
>      }
>      dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
> -    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> -    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    /*
> +     * FIXME This use of &err is is wrong.  If both calls fail, the
> +     * second will trip error_setv()'s assertion.  If just one call
> +     * fails, we leak an Error object.  Setting the same property
> +     * twice (first to a QOM path, then to an ID string) is almost
> +     * certainly wrong, too.
> +     */
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &err);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &err);

To your question, I don't know the answer, but I think it's far more
likely that the original author didn't grok the proper use of &errp,
than for this behaviour to be intentional.

Surely we just want a failure path and abort the construction if this
goes wrong?

~Andrew

