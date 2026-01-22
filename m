Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID4wMP1gcmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:40:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEA06B83D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:40:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211701.1523189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyf4-0007NP-N3; Thu, 22 Jan 2026 17:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211701.1523189; Thu, 22 Jan 2026 17:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyf4-0007KN-Iw; Thu, 22 Jan 2026 17:40:02 +0000
Received: by outflank-mailman (input) for mailman id 1211701;
 Thu, 22 Jan 2026 17:40:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viyf2-0007E8-W8
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:40:00 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e6734b7-f7b9-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:39:58 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 17:39:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:39:52 +0000
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
X-Inumbo-ID: 5e6734b7-f7b9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS2qglNtDpuVnA19PDpS1QLOa6lpx28TK34771zuVvuQFc/QNtIvmf28UapqByUIy53xCd/zaWbqUwfGIbUv29AfC1OCH1QjWrktoHhBaYYu2KqU7chknf/P2Y8lZQun/cdAVaxMSPUKq4r5yLVC0yGp/WC90abtunp/ivzPb/e5RFS6PaDnhRcRlZjf5AJ1zXRkupWm/fnz2WXOoqqog88CGpjXCLW88n5wDXoVKCCoX6ZnHEtfSeTTptqNRDhJOV8I5G/YWUx1nElocYhCXJdIBuaayS7kspMCtS7/HV4I26+cGs79/kmSd+gbydi7KMTQlTJDG3KhhMK1tiW+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBwER9b45odcluja2CMRmJt8e2G3orBXFTuueEpDCBA=;
 b=Bj2un0MGnmlWscYij3khevmVxudZwx2Ay37d/mtXzL2hBMLHOkruklc/cFhbv8tFW4Edev9A7lPFb83rQSt9Rx2PYg4MOAuNM/rEFNQLAxHmCfFuelVSl/GnN5/Vty7Mp5VYmpTBYC3O53ixfg3GV9SMIvpqyl4e4N3ooJ94SnWUTZs9+mENjhS43WXep5Tq+92B+xpiBzReTiPk4/wrPCIWV9oyQrxML2zPTjYP5MVboszqjsHRyjGQg/NXOsOQMKlMupb50LjEA/ZfL29DfdnY21IZyiC1m58NnUgVssNwjspqRIIo3PJKVJHPzU+BWYVCvlvCzx3nwxHHvdS7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBwER9b45odcluja2CMRmJt8e2G3orBXFTuueEpDCBA=;
 b=z5qUqD+seotZYVP285VGxU23uOg4+g0iPes/NT4rmmwArN+s6M8yjodRh6Hn3teTw1HVJA4zuEm39Oc9d1i8WTRRw6KromSg1lkhxkavL16N4+yaQrgLoytfq0VWDYgqJlSm/sgwOaCm2andAZsK9PksJPmQaVn8NoiguHBUB2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] xen/mm: limit in-place scrubbing
Date: Thu, 22 Jan 2026 18:38:54 +0100
Message-ID: <20260122173857.83860-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e94c30-da8d-4001-e808-08de59dd3f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MG10VzdweXVuN0xiMTE5SnNFUi9CcmJTdTNDTElwRjlsMjJMWEt5cGF3bGpI?=
 =?utf-8?B?YVRIUWlMVkE1RnFoV1NtR0tOOUJZdWtJTmgvaElGYWtkSVU3ODVGODNTQ2Yx?=
 =?utf-8?B?ZUlwM2J2S2FJdWkvcUZpL1lsQjEzd3MrSXh2NGpJbWV0N2g1M3IrZk9xL0VP?=
 =?utf-8?B?NDRUbENFS0EyYmFVSHNvYlN4ZC9MMWZTa2d4NXNxVVdhcjBtUWV2SWF2NUtn?=
 =?utf-8?B?YjkyM0kzM2dNVUdxQ0RZS0I5ZVlmUGFKTkRFa3V0aXhaV1loR1NYRFhDMzd6?=
 =?utf-8?B?SWJKaVRtRHNZemdxUkszb05SVC9FTzNWT2Rod0lINzMxcFREbkNZZGlJeEUz?=
 =?utf-8?B?R2tjYXhMQlE5RWV6TXF6bFd0U0hUN3hjWm5wVEtBQlZNUUFLSHZhdmwvSkIw?=
 =?utf-8?B?a09CdWh2c0dqNm1HalhmcUtLS244Y2lYRHFsaTVtVmZRalQ1NkluVDBoNXo4?=
 =?utf-8?B?OFlyQkdESEgwdEVxdmlEcS84TzVqV08xdEpQcEMwWWVrakhBTlVJeEVaL0Iv?=
 =?utf-8?B?SmdRcGRXNWpQZCsyMVMwS25sSzB4Y3lXWmJ1SFc1MnJISDFDNDJxUHlCNld4?=
 =?utf-8?B?TDlHbXVJVmlnalFTRXprMkFKU2dpK3h2em0zTUdoUjNOdk53Snh2cEdaNisr?=
 =?utf-8?B?MVUycmdlSEhmSzZpS2tFTTFPazUybDlmalNrTDAyNFk5eXlsdm9PQkx5Zktk?=
 =?utf-8?B?UXRteWNKR1lLTUtnc1VpRkhSSkxha2JQbDFJYlNIYjU0WWljdTA5WWVMandG?=
 =?utf-8?B?U01KQ3VRRldJekdjMXUzUUZFbzU0L0lKTTdiOFh1cE5Pa0VVR3FMWUpmWENZ?=
 =?utf-8?B?R0JyNTBVVmRIZUx2OFVER1o0Z29pVURXODU1QWFER25ONVQrVEVkWlYvcGlh?=
 =?utf-8?B?K0JvRE1BS001N1V0ZEhrQUFNNjg0ZUxvQW5QSkU0Y0NBRG0xRXY5Ny85aTBO?=
 =?utf-8?B?bHk5UnYwWFRKM2RZYVZVL0taRXNQZWlCbEIwQjlJaE1ySWtNeWplSkszSGNY?=
 =?utf-8?B?MXR4WFFZUVJpTWxoeE5QQWFxTmRkTU9GREUxS0dydDd0V3ZQejA3aVpGeGU1?=
 =?utf-8?B?N2ZwSkxwZ0lpdXhrUHZYNGRSNzgxSTZOUmxJMG5rd0ptWU5hMFlJWEg5NENF?=
 =?utf-8?B?TDA1YXRJQXlEeG1ranc2cjFhTFJxMVV4SXcrOE92ZFlKbVByNGVvc2dtRkc5?=
 =?utf-8?B?bXNiZWJwOVU1VDZUMlZvVWRvZlhWYUFKQWdqemtGMzBhaEJIVnBmU0ZvVEpz?=
 =?utf-8?B?QjB1VXZTTFpObW1aSldHazladFl2L29Da0ZMSTViWmpxclJneHFFQXkxL1E4?=
 =?utf-8?B?L2o5RktuTnRpME8wNGR5N0F4b29uVjdvcmRDQWtVMk5MRVdJSzNXdUlIMGlx?=
 =?utf-8?B?Y28wR2Noa0ZFQjBhSy9ZRjlWMW9JeEhRRVNOaHNNbmFwMGtDL2N3Z0NGR05u?=
 =?utf-8?B?MFhvdHl0aGFQejNZamsrT3ZSaVR6KzJCUzBWaVhRU1Fma2JDUkVKbWZDdlVN?=
 =?utf-8?B?L3hSS3ZPcjU4TEVYbi9vZlFiZVB6UWxkSUtzZVFUVGpqbURKUFdvT0tvampp?=
 =?utf-8?B?ZEIyb2N6bkFPNlRQbWxSUGg1UzFjNmlZU0hIQWE1a1l4ODlsYmJNcTdGWVVi?=
 =?utf-8?B?TU91YXR0K0dZd04zWXJmWERuTGRLM2pBWHdVcXJVVXpxQ1UyYTU2MEVRM20x?=
 =?utf-8?B?b29qNllhbTRXdjVVZ0syaUNVZndZNTdhRzROa0hwbElHek1JMExDOEtCNVI2?=
 =?utf-8?B?b0oyY0lMTXR0K0UwejhlYVh1VHIvdjM3NnRiQjZDcmpJV1Yrb05BcGtwMlRa?=
 =?utf-8?B?cmVEVFlVMGxCSU5vTlVHTWlycHNIVFNqb3Vqa0FrM3BTdFZTYzFxc3Z6WFhQ?=
 =?utf-8?B?SDM5bUpXQUQvR1VOR3p5YnNtZ080N2hEUjRUUmpRaWlSaUNoYjZmN3U4dnFI?=
 =?utf-8?B?RTd4VHQwOU5YVVkrL3ViU2J4NXIwbEt5VG5SQTZOMFUwcXJ6a0pZU2paQUoz?=
 =?utf-8?B?T201QkRtUG1RdUtTUjNwZnl4aERiRDB5QXhCTHRKZDZ6ZHMzZWZkeG9RTGZi?=
 =?utf-8?B?UmpjcnppWFgvLysyT3BDeW15dDduaTYycnBKbmVDZ3YzT3E0QlgrWGo5bUlP?=
 =?utf-8?Q?enI8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUlGTEhYZjkzTGRPRzVqdVc2akVxTUg3TkZjUUNOajA5R0k2UkRFK21LZkVr?=
 =?utf-8?B?UThOelRRN0hPTUFMK2kxZVF3ZWovQkt6Z0txU3paRnYvVEo4cFJZaWR1djUw?=
 =?utf-8?B?MFFvWXJnSW55dkd1bk9qU09IblNrU0pFdTl2UnJMbUhDZWxqMEEyalU2Qlho?=
 =?utf-8?B?UkkvTm5weElQUkt0NnVDMW41bmpWUm9yVEVrY0wwN1RvR1ZuTzdkaXpFUnZH?=
 =?utf-8?B?aXpKQzhBNHA0ZnpoY1dVcURTYzArMWgvMnRpYy85c3pLMjBDQm1SUldhMTF4?=
 =?utf-8?B?YnpvVTlWT1ZZc2FEa3BUN29RYStJT1RhU1IySDBwbWZMNjIrd3BIanUycGZh?=
 =?utf-8?B?NVVWMFdTdnR3TWVrdFZuaHFvR1RhR0hZNmpaTkhWaERmNU5QYk9rODF6SjBS?=
 =?utf-8?B?WHkzbmM1NTIvS3A4UG9ERStkcEt4ZjJwRkNZVmVnWkNhNUVhakpyOERsOE9i?=
 =?utf-8?B?UlVyU1AwZHNIN01lNGxQeG1JWGxLS1hsTUFXT0NLKzJlM0h4NUhNYW5lc0FK?=
 =?utf-8?B?Y0dVOGJZWWRydXdhNStQWll4aFFXdUZBeTE0cjk4czRFMVFBL2ZrYVo5M1Np?=
 =?utf-8?B?YldjT0p6QzFVRG12Uzc1K1BuNjVkSDdhaGlPTUkxYmJEL25pUFNNT2NScXUv?=
 =?utf-8?B?bXlrS05UMUhnbmJvTEgxTkM3aXQ0N0JPb2Juc3JFZXhVYTZUOUZMRkxKMHdX?=
 =?utf-8?B?SXIrdkh5YUVLR2FkWFU5NFpzdG5lczRWVmhvYUR4OHJERWhMVVMyUEd4VVFO?=
 =?utf-8?B?NStFUEFwc1pRRGF3KzVxK293WHkwQmNQSUIyaktGSm52VklIVStSK3o5bDRv?=
 =?utf-8?B?WmRBc2NlUitqY0syOFg4dDlSeUZnUmFmYjFPZUVLWG1CRit3MURYSnMwM0NV?=
 =?utf-8?B?eFdNY0IxQmFBYmtobE5CcFJkS3d1TW5WdjE3TWptYUJ1NFVxeHNYRGZvcFRD?=
 =?utf-8?B?aytGL1NwcVR4Tk5aaGdIZjVhUUF6TmsrcG5TWFI2SC9VcUhyVlNRK2dEZTlW?=
 =?utf-8?B?OFFxOWFCTjJ2ajllL3J2aG9YNE9DdXV6NVJEMGpadWVZUDQ4cktucW11dmFu?=
 =?utf-8?B?Vm5Mamhma3ZjWUFIaHlYMldJWURBcG40dWhyN2htVUpVSUo5OGdwT2l3d09J?=
 =?utf-8?B?bTVyT1RzdmFkYklzTTloMUcwZWdReWd1ZlpMY3R2cDZaRE5uRE1IdDZZM3k5?=
 =?utf-8?B?Y1ZNeWFJb0NaSFNzK1F2ODZwMForcmxlUlI2aWE0cnZNTEdPRnFFY2U1UlVw?=
 =?utf-8?B?d2JWMjJXeUVLR0V5bzF1V3ZvWGxzbENkdnZUNE4zTi9UUmVsQmd1UG9RQ2FQ?=
 =?utf-8?B?TzZKY2l0aTlSL3VnSnZuVDlMQ2RuM1pZanY4L216Z1BOcklwekI1WTg2QXB2?=
 =?utf-8?B?NTNFbE92NXFpcVI5Z2tWbzFQdGh1SGJqeWNtY1N4MGM1TXFkekQzcGpHYUxS?=
 =?utf-8?B?MFJ5b3dnNk5YQkF2Q1diM1hmY0dWMmduL3R1MEMydU9Rc2VZOVVRMjhuV2pz?=
 =?utf-8?B?U08vdDVnNnY5cExUdElzSEdOaDhaMGY0bWR6bG1sOVVuSlRnai9kRnd0UDVZ?=
 =?utf-8?B?bC9seXdIWW5oN051L1V5bENJTUUva2J2S1c5eEUyNVpUUVNGMy9pRU9tS2NF?=
 =?utf-8?B?V0JNdG9FK1F5M2FFb3NxWE16eWpWYVc1aXhWaXJqT2xJTzhzU0V2ZTgrbk41?=
 =?utf-8?B?ZnFjYUlwbmRXN2xTWE5wNjhQNmhDQjN0NUVlUmJUcm5kRlJ1aVFEUDY0aVlD?=
 =?utf-8?B?cmZoUW94Y0FSZStDMTQyWlBBRW54alpqMDRFalpMdUNzWTdHbWdsZ0hxS3ln?=
 =?utf-8?B?blRvVVFsZFFheGNRU3VwcG94d0FSdmFKZlFmUU5wUGFZby9ZY1NuR0V1bGRU?=
 =?utf-8?B?NmxNY0lLNnhINXRiUExDV00zUUlTdWszWDlyK28yY2FsVHlSWVErbXdleUFH?=
 =?utf-8?B?RS9wbnVaQlRGaG1HMlhwczUxWWp5Z05KcFpZcFpFWkkzRlE5UDRLTlJFQjRo?=
 =?utf-8?B?T2ZqYUNiZ3kvMU41THQvd1VFQmJsZ1NKV1MwU2hHbmpYR2dqL1VUNFQwVjRB?=
 =?utf-8?B?K012TjFOVHJxZDdwWjRrcXdWVElHQWNjVTY2bHRYd3hsRGlYNGFWMVdkWEtj?=
 =?utf-8?B?RkFsTTVVNFhSZEJIbzMxT0FVWkJBeUtwSFpyYmtIRUpkU080b2xVREdFejFO?=
 =?utf-8?B?b0VBQzF4SENLL0MrTWYrdUhONG5JRXZiOTA5YkdReDUvVThxeis4Z25CQWZQ?=
 =?utf-8?B?cG9NVWVOVU1BWEVEdm9nMFRkTUpjWnphZ0NubkZhNDQ2blBhcnFmVEVJd2F6?=
 =?utf-8?B?T0FkS2I0UkxxSWFkaVpWS0hGMlFzMWNZcnh4OW9Dc1ZVeVlzL2hFdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e94c30-da8d-4001-e808-08de59dd3f57
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:39:51.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DI5tTwnQK8bdaad7XdRjhNiJbf24/8uzCPyWbbsFgHffSHALIHYrWYuBqf5jrgIfyO4vSA6snxxDNMI6Ied48w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6512
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.893];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2EEA06B83D
X-Rspamd-Action: no action

Hello,

In XenServer we have seen the watchdog occasionally triggering during
domain creation if 1GB pages are scrubbed in-place during physmap
population.  The following series attempt to mitigate this by adding
preemption to page scrubbing in populate_physmap().  Also a new limit
and command line option to signal the maximum allocation order when
doing in-place scrubbing.  This is set by default to
CONFIG_PTDOM_MAX_ORDER.

Thanks, Roger.

Roger Pau Monne (3):
  xen/mm: enforce SCRUB_DEBUG checks for MEMF_no_scrub allocations
  xen/mm: allow deferred scrub of physmap populate allocated pages
  xen/mm: limit non-scrubbed allocations to a specific order

 docs/misc/xen-command-line.pandoc |  13 ++++
 xen/common/domain.c               |  28 +++++++++
 xen/common/memory.c               | 100 ++++++++++++++++++++++++++++--
 xen/common/page_alloc.c           |  30 +++++++--
 xen/include/xen/mm.h              |  14 +++++
 xen/include/xen/sched.h           |   5 ++
 6 files changed, 181 insertions(+), 9 deletions(-)

-- 
2.51.0


