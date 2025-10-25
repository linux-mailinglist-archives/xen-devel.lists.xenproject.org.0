Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C3C09E92
	for <lists+xen-devel@lfdr.de>; Sat, 25 Oct 2025 20:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1151215.1481897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCjJE-00022o-P2; Sat, 25 Oct 2025 18:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151215.1481897; Sat, 25 Oct 2025 18:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCjJE-00020X-M6; Sat, 25 Oct 2025 18:48:12 +0000
Received: by outflank-mailman (input) for mailman id 1151215;
 Sat, 25 Oct 2025 18:48:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSsM=5C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vCjJD-00020R-A9
 for xen-devel@lists.xenproject.org; Sat, 25 Oct 2025 18:48:11 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23fcc456-b1d3-11f0-980a-7dc792cee155;
 Sat, 25 Oct 2025 20:48:05 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 CH0PR03MB5988.namprd03.prod.outlook.com (2603:10b6:610:e3::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.15; Sat, 25 Oct 2025 18:48:01 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.013; Sat, 25 Oct 2025
 18:48:00 +0000
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
X-Inumbo-ID: 23fcc456-b1d3-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZmkRA/VRMdqKgqNjZ1QggOUUKEyV+a9kJgjn6k+UzR24W08rtGdEzBlps6xuib6iWoGhijozM5TSMnin4lvIieJb9DlkbkikX+SZBy9dSPk/F7iCyqmL1X4GIY34/iuJdEWjOXMcu5FWi5/+We4wNyBxBTNF82rRZT2jFWsQEnRoXseKWnJcTxCcHSGGa44d9YqBDK1odYPlr84fQFivEjq3Ry8lR1X1oJnD1cuckqVIrSlwDitB+FKijNPZExRZD89ctbnxBVmK3DvNMzGq8jGfRx6DzfJ6TAO+8TzvEVHdND7jtKgHLGtzi3UYS6vcrKAHzY3vYeMr8lmYNJfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2YZOMGoAecLwEcYCX+Z6IfXrcGFzExwVl+rR4COTHs=;
 b=NQIIqK5kwqHR1DJG3JleOniAu5g057fwxibAG+tJqPCYr8eVH7a2pTPmVSUGZubbmcz4HNewm3dloDbuUX26prC2NO0mD31qzButTjnsC4bSixoxEDIZ7IawTIHIYWBXkGUc3TyU9pCYZS6+ys3Hq6W40S7Jc4czp9lrjNWMmiQ2xo4lhJqQtOTVbRDSz0gh7xZZjEafMN1G/mJZHqbKICRRJKRtWdKS43I8CpA3SE7/XjFlLF/xwCxfEfLBv0o2r+LmUK8EiszMWeaFKW1gdQDjY4EueX3q4DrRxldV81I3on+2C2DGAKjnZzrKDus94JgIOtRNzLK0hhaqSShq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2YZOMGoAecLwEcYCX+Z6IfXrcGFzExwVl+rR4COTHs=;
 b=vzcTsSx7hmCM08Be7kcB8wAl3DziC+jb4DcOWz/fWKPPaTRz2OYAT6fquj8H7M+HCBfcnRIxeEx1F/PNoIpSLnLQteIovk84ej7WGbG0fdyEduPMXaSTmPAkxOE9n9SRXA27uMrBazph0+9c5zwrEH/t3qljvTFkoq+m4G7zmuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b15b6ed8-11dd-4d03-9c82-979d99af2867@citrix.com>
Date: Sat, 25 Oct 2025 19:47:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Support LLVM raw profile versions 5, 6, 7, 8, 9, and
 10
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Wentao Zhang <wentaoz5@illinois.edu>,
 Matthew L Weber <matthew.l.weber3@boeing.com>
References: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
 <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
 <c7397bc5-574d-444a-a8cf-e76e95ec20fd@citrix.com>
 <CAHFNDNhMCe--4z9CL49Yk8Rf4FA+G7-7VozJfhLcVESaByU7qg@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CAHFNDNhMCe--4z9CL49Yk8Rf4FA+G7-7VozJfhLcVESaByU7qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|CH0PR03MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 36020da0-f156-4cc8-3de9-08de13f705bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWxSZGIrZGFqN2F2UWlob0tIZ0w1dm5xYWdleUNmcGd4bjVLWStyaDk4eS9v?=
 =?utf-8?B?S2hxWXhnMmY4Q0ZoOXFMTXI5MzdQTlF2R1J4WTYwNnd5QkZjem5LUm5YMklB?=
 =?utf-8?B?V2VBenhlajhaUkh5SWNMc2hNY0sxVllBTFQrc0ZuYUFXYk5yQWdaRy9DOEJ3?=
 =?utf-8?B?bnpKNUxGdW1jZkhNTkdsM3VRT3VDVzhCWjRUQmZYQmNURWxSY2dnTGovWmdB?=
 =?utf-8?B?Y3RVYUJadTRCWSt4OVIrM0Nqek1aZm9XYmJqa0dycWpDNEhpNlg2aE9oS084?=
 =?utf-8?B?aEpTNGROcGVTUFBoa3lwMk9zSUZveDcwdlRvUm1tdEt1WGI2aVJZRXNPcFRN?=
 =?utf-8?B?dzNtaHB6Vm55VllnenR2cHEwUzdVT0pLZGN6dTlxQWxWc0k1d0NLU1NjTzVQ?=
 =?utf-8?B?bVpHR1N3OEhNNEFRWjR1MGt1YW9qeWJEK2M5U3ZJQTc3WGR6QnVXRnp5VUZL?=
 =?utf-8?B?cnBlVUMvRnVzOEhnaE1jSlB5TWJYa3QvaXlDMWJHT0ZJV0xyZUs1SDlaM2th?=
 =?utf-8?B?NC8xYnRhWWRMK3ZJZEdnTmloQzROVGFHaXRpa2pQZjBiNy9MR1VKbUtvMisv?=
 =?utf-8?B?a2hYRlZxSDJFVUxmSjhPd0dubTdiSEFHT1V5L285djB4WjR3U0lGY2xOekZQ?=
 =?utf-8?B?MTBBUHdRVU90bmM4Q2JMWkhKcTZ0QTRNRGR2b0NIUk5JWmtvVm5Eb1duSzVz?=
 =?utf-8?B?R2tkdzVzckVkR01qMjdhemNiUXNTOEFOdzJTRkRUcUhEVzFMUk9SNlRHSU16?=
 =?utf-8?B?TVhtbG9xbzhXSmhYZklKU25YbzRLUHZjaUhvT2Y3cEpLL3loSEFSRU96T083?=
 =?utf-8?B?M2tVVGdRUjdmdHdnK01BT3NBT1dGWDl2QUVwMFB0eGhQdmpaUFBIeHIvVlV6?=
 =?utf-8?B?NkRGZ0lzSjB1ZmRVYXFTakMrUjNFVFBiZ1BCOFhzRWp5SDRrVEVrNW9lMzlH?=
 =?utf-8?B?aEYzSjV1TE9MaHl6MHFCUlZ2ck1FMzIyd0hhWSthSDdxVHJEUmxDTS9TVGxL?=
 =?utf-8?B?ZUZBakdIenV6WUxPSWZ0MVNKdk43SFdtVVhYdWp3T20rU0dQMjh2REVPak5r?=
 =?utf-8?B?amd5WUFTNWgwOTcxZlBoSUZaYlExZEhCaFpPN1NHU0RTU25BRzNUaEc2ZUoy?=
 =?utf-8?B?MXVLMXFKdUk0bGtOLzVsYmcwSkRWOW5EVUNsalNNRjhxcWJXVXU2MDJJTkJt?=
 =?utf-8?B?WnJ6bVlsWG9BOGhCYi9tN2IxbzNIRXYvTFNmSStFNmQ5Nzc0bWp0dzVwMTht?=
 =?utf-8?B?VFF1eDhMUStIcnVuQkxZZUNuY25Fc1MyMngvVjdxaGxEbFd3T0NIenc5NUdG?=
 =?utf-8?B?czBwME81UXlUOGpkUmY0ZzNKbDF1Nno0cHYzMS9SSjNyRTBSU0E1bnhIam5D?=
 =?utf-8?B?YVc3VmlVbzZnSm9jd0d2Nk10NWFPbjFmTkNWZmMrSzZnUTVIMUJSNW9vSDYx?=
 =?utf-8?B?WkZPWUxVQ3orR0JWM28zYXBHT1FUV0Z6bTQ0bHhwMGQ0dlMvSWIyTm5DNGVi?=
 =?utf-8?B?a0JTQmZ1VlFnNDJIMG1wNzBBQ2ptbU83VWtwKy82RFA0MkE0VHlzWjdhakp3?=
 =?utf-8?B?M0ZrNzhKaWhGb2lDaFc3cm1zVWpLcjE4R1JQcmgxV1JTSm15Uk1keDF0NW56?=
 =?utf-8?B?V2JraDdhYlNZb3djUFc3Zlk5bjhpRTFKeXNmVFlNODVCcUhMYUladWpVOGNR?=
 =?utf-8?B?QnRieTJYYzFiUWpHcnlsNlRURU53ZEYrRUpNYjAvNkg1Smo1SlRNQ2VkUUxQ?=
 =?utf-8?B?N1BtclZLNmhoSDhwY3BEQWM2SElsTDdXam1vOWxMeTYzYkpLUkwybmdoYmpU?=
 =?utf-8?B?WDkxMHkxNHBKbEdzQ1I1WWMvcmlleHRIUGNMNFp0R2VZTDFudFhxZExJdHBS?=
 =?utf-8?B?QnduNUhtUVVKNWtXb0tiOUluRWIweHJkUUdrVmtNMDRrWmo3Y05ub25kT3c4?=
 =?utf-8?Q?tWAgCoSQpKv2DgGLQQZa5Tf4Q1CA9FQ+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUJRUVhSRmt2NVlHZ2UvU09aZHdYT2FZMnptMTlPY0xxWGRiNnBGWjlqbnVI?=
 =?utf-8?B?Snk4YlBpazdTVGlHTE9PTjJXamZnSmhDT2dQbGdPOEJzTjQ2a2xzQ3VTeUp5?=
 =?utf-8?B?UW8vek0yN3pNRmhaaEtVUXNza0w2ZHBYMWYyZHM2a1dIT3BlOHpYQStmU3Mx?=
 =?utf-8?B?SjJXWks0bmlQOHduVWVKbmRTbkV2UXppTHZvTEFjeFpmR2FYVVdwUTN1QkdM?=
 =?utf-8?B?YXJrLzRBZ3BoSU1hdW0wVzJHaGwyR2pXcXh1WmozUzAwZ0hnL2ZKSjlKekxN?=
 =?utf-8?B?NU5pNjRpZzhrZndSUHorM1BmZ25xdC91UjlnTDRqdlJPNUJGbVVvd1ErSURt?=
 =?utf-8?B?dWlGV1FMNDc3K01GNWFGWWxHTTJ5QUR3T0hTS01WQll4bllCMHpBMHZ4N0t5?=
 =?utf-8?B?byt1VnpZN1gzRGNoZ2c1L0gyZFI0Q2VQTXNHT1RxWEROUm5DOHNEdW9HR3Y5?=
 =?utf-8?B?MFd3dWpaSlRBYXFKcnMvZCtBYlhUK0VEK0NWZTAzeE1sZTI3ekNESVFtUkk4?=
 =?utf-8?B?QWZ1TVFrdnUwZkdQUEZLOXRabTAvcGtOU2diMGNIUmVIcml2RDRUdWNYaEo3?=
 =?utf-8?B?UnV3OUd5L0E3aFJVaGhmK2VkcGovMU1IcG11eVI0cDZUUmo4RjVqbnJlUTBL?=
 =?utf-8?B?QjRxS09KSkJyQ0xkeDZJUEJLblBQNzUxc28rb1VRRXBrSkc3MFpacDRJSTZw?=
 =?utf-8?B?SFA0c3FBb2tpY1B0amFQVDF5SHVqbGQ2cFkva3FvSWswUE5DTVJPSW1LbmFQ?=
 =?utf-8?B?N1FKYnBvL3RxbEN3M09abE1ZUDBNWlhQQlRQZ0J1SlREUHEyVXRySTVwUnhj?=
 =?utf-8?B?OHpNZE5vTW9lckV3S3ZTV21SVlFLeEEwYmlKWWphOW9SRnlZWXlRcGd0SW0x?=
 =?utf-8?B?eEhTby94eUtMTFV4U1VxY1hzTmtuY29PSFFUMm5KZHFZcWYvUmlRZFVXVG0x?=
 =?utf-8?B?blc2bFhJVXZPT05yM0dydTZwS0FXeVo2Y2R1Ulg2MGN3U0hDd2FFdThCcG5r?=
 =?utf-8?B?cU8xYXpDb3JMZTVCbmVHcTRLLzNWcjRrVkZZcnIwWmJNVXU3U1NJSExZSWlp?=
 =?utf-8?B?TU1qS0hRejl6TnhrMFdWdE0xTjQ2SnhxTDZFL1gvMXlPejBTeFZjd2RRVUs3?=
 =?utf-8?B?eGZBdWpTVmdydFVhV0RqUXB6VmVCWk1OVStSZGkrTXlKWjUvSkxBeTIrdUcz?=
 =?utf-8?B?a1M5L05xN0JnaHFmTm8ydUtFVVlkM01nMk1BSDVURlFaQkFRVmdBT3ZNcE5J?=
 =?utf-8?B?dnJUZjBibTJkeklISU82YVArRk1ka2pFYi83WEJoTFkrU1haNjF2RUdBNjJO?=
 =?utf-8?B?QXhYRi8yaHFvbEw2OEJzVmdNQW5BalNhRHZNTDYyTlUzUU5HZW1oTzFkWUY0?=
 =?utf-8?B?SGF0V2ZBa2ZrU0lrcFg1bHdBQ2pBMHZxMFlRRWV0aWdqRkl5VTF3WVpoVytY?=
 =?utf-8?B?TitOZFczS0xDNUhGbTVNY2pCMXF4VFhSMkVSTTM0Y2ZDVU16WUZVeER5OXAw?=
 =?utf-8?B?WWF0MEFaSWVIZkZXRkZXK2dsSWNla2ZxcjR1Q1dQMHF1MTBtNWVlNVRWK0JR?=
 =?utf-8?B?SGZFek5SbC9GbGpiWFJta2VIdm83cXNFNzhQYzRmWnBWc2FBZzRMSVJEQUNT?=
 =?utf-8?B?RTJPenVDSDM3QkR1MzVqMTZTYXJTaEVKVFZSOVo5MEdTUWduaHBoL29WOXlG?=
 =?utf-8?B?R3Q3djVMdC80RGYwQ3ZJNEQ0anhoWjRnV3RCcWRtdndLWEJ4U2NMRmxSNHhK?=
 =?utf-8?B?R2lmYlV5Zm82bTR2RkpPc05Ta25xWXl5V2p1cXk1Zldjb1F6bnRPdDRUMUxR?=
 =?utf-8?B?MUJqZm1Zd29YRVczK3QwOGdETFRYSGFmd3NoR0dpWG1oSnRFd2hDZFRHYUs2?=
 =?utf-8?B?elh0ZXVhVFNzQ2RVUkpqNkd2VjRUSmpscTNCSEFiQWNOaVFQZlIwcHBYYW1T?=
 =?utf-8?B?SGY1SkpjZDd3czNIcC9zcTk3cUQvTkJ3WFVaWEc4T0tsODNPWVhZU0NEeWc3?=
 =?utf-8?B?ZGlHbUpueEl3NjdpaFdsMlJTRGRnMERjZTN6RXozdHVXcU1xMjBVQndGOXlI?=
 =?utf-8?B?TmlJcGVoY1JSS3VIekN1Y2dha1hWREhtZHB5clJLTkpHYkJ4MlFoRGhhdklz?=
 =?utf-8?B?NVorODdBRk54WDY4WUxoZit6U3RBRERYbVJYSldpdllDL055SFdVN1drWndt?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36020da0-f156-4cc8-3de9-08de13f705bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 18:48:00.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tv8zHGSzXJH0eBH91VnDiGWH43DeP1P0QcqFmi+7IxRB5EUikGj1avWczNb2SFtuGiOmAiXASpHQsFaTIo4soIspERHCeo40Pa0moqSKHPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5988

On 25/10/2025 12:38 am, Saman Dehghan wrote:
>>> +        .padding_bytes_after_counters = 0,
>>> +#if __clang_major__ >= 18
>>> +        .num_bitmap_bytes = 0,
>>> +        .padding_bytes_after_bitmap_bytes = 0,
>>> +#endif
>>>          .names_size = END_NAMES - START_NAMES,
>>> +#if __clang_major__ >= 14
>>> +        .counters_delta = START_COUNTERS - START_DATA,
>>> +#else
>>>          .counters_delta = (uintptr_t)START_COUNTERS,
>>> +#endif
>>> +
>>> +#if __clang_major__ >= 18
>>> +        .bitmap_delta = 0,
>>> +#endif
>>>          .names_delta = (uintptr_t)START_NAMES,
>>> +#if __clang_major__ >= 19 && __clang_major__ <= 20
>>> +        .num_vtables = 0,
>>> +        .vnames_size = 0,
>>> +#endif
>> Because this is a structure initialiser, everything set explicitly to 0
>> can be omitted.  This removes all #ifdef-ary except the .counters_delta
>> I believe, as well as the .padding_byte_* fields.
>>
> Is it undefined behaviour to leave struct members uninitialized for
> local variables?

They are well defined as 0 when using a structure initialiser.

>
>> The resulting diff is far smaller.
>>
>>>          .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
>>>      };
>>>      unsigned int off = 0;
>>> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
>>> index b126dfe887..42550a85a2 100644
>>> --- a/xen/include/xen/xen.lds.h
>>> +++ b/xen/include/xen/xen.lds.h
>>> @@ -81,6 +81,24 @@
>>>    .stab.index 0 : { *(.stab.index) }         \
>>>    .stab.indexstr 0 : { *(.stab.indexstr) }
>>>
>>> +#if defined(CONFIG_COVERAGE) && defined(CONFIG_CC_IS_CLANG)
>>> +
>>> +#define LLVM_COV_RW_DATA                                   \
>>> +    DECL_SECTION(__llvm_prf_cnts) { *(__llvm_prf_cnts) }   \
>>> +    DECL_SECTION(__llvm_prf_data) { *(__llvm_prf_data) }   \
>>> +    DECL_SECTION(__llvm_prf_bits) { *(__llvm_prf_bits) }
>>> +
>>> +#define LLVM_COV_RO_DATA                                   \
>>> +    DECL_SECTION(__llvm_prf_names) { *(__llvm_prf_names) }
>>> +
>>> +#define LLVM_COV_DEBUG                                     \
>>> +    DECL_DEBUG(__llvm_covfun, 8)                           \
>>> +    DECL_DEBUG(__llvm_covmap, 8)
>>> +#else
>>> +#define LLVM_COV_RW_DATA
>>> +#define LLVM_COV_RO_DATA
>>> +#define LLVM_COV_DEBUG
>>> +#endif
>> Newline here.
>>
>> But, there's no problem stating sections which are unused.  I think the
>> outer #if/#else can be dropped.
>>
>> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> I can fix these all up on commit, seeing as it's release acked for 4.21
> Thank you for offering to fix them up. Let me know how I can help or
> if I need to send another version.

This is the version with the fixups I suggested, run through CI:

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2118913271
https://gitlab.com/xen-project/hardware/xen-staging/-/commit/c06dadb80a1e4058c7cdef4144a7e4c4799a38a7

However, one further thing I noticed.  On v2, Roger asked you to express
struct llvm_profile_{header,data} in terms of LLVM_PROFILE_VERSION,
rather than __clang_major__.

If you want to start from the version I cleaned up, and then submit a v4
addressing Roger's feedback, please feel free.  This will save needing
to fix it up later.

~Andrew

