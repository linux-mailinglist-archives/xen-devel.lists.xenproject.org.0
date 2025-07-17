Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0CB0947E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 20:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047298.1417742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucTlO-0007k0-St; Thu, 17 Jul 2025 18:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047298.1417742; Thu, 17 Jul 2025 18:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucTlO-0007hZ-QB; Thu, 17 Jul 2025 18:55:26 +0000
Received: by outflank-mailman (input) for mailman id 1047298;
 Thu, 17 Jul 2025 18:55:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfYL=Z6=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ucTlM-0007hT-Jm
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 18:55:24 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c6a5e3-633f-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 20:55:23 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7045.eurprd03.prod.outlook.com (2603:10a6:20b:292::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 18:55:21 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 18:55:21 +0000
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
X-Inumbo-ID: 97c6a5e3-633f-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0U9daxxskVXOXmmKtwMOUyd480OlwRAfPZvIkVMhFocI/iA/PKFXIEwDx0B+bJbiFbr1Ra5ksqRvXwUJ+IaBwk2lIPZ+lS2CccSqUNOH/NlNs6otuJQrCI3Rip+pbHwiw6RzfHnd7Naas7f6oa8UeLFdZEXODvFlcKH9QnjvgGn1P6dvrj5Lpg1v2y0cfZcV6AR/QPDFJQQymlL02eGdpYK3sw4/4Aa8pBIkQSHWReM/B81lZwe8UpLyV6s051rSaEtIoOJwwAp1RhB0JW/ou7bXXcoRcMIrnM11ymGtSjsOUevB2HLKKhrvMogbSgfKoln41eCwz0SiClqg7o1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fvBoBx2iVidOg5p2bIjKtFfYK1D16B9jy0rz0AK5/c=;
 b=IPvRjbmkntZCw2MdR6Igwl4cibmjmnLttkkx8cpc1lVeQdjx1nISP+R/MsTglPQ5SEGBxCzmzhxal/tWz0fS6paQyeYcPI6VZVMeAuGVK8JAfs9FjW6DayZTquJS8bTwd0KeZHf8JPc3m/t0EW5CVJ8K72LlHcCpmffQNF3fq9V+vkr6QhaJd8Str28FWixfBWMHF4rxMhwUoauJBktC+CwBK7Wru8LpR4PrchjU9Ml2p86QdiUXcpO9pJPHD8QdRrcmDNdXjke0xszJDPZ1QBaWjS6A1dSE7QsjecgjZPR/12JD/5AoP4qk6ajAnt/K0/6TJ6vrCxtFxk6/n7M0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fvBoBx2iVidOg5p2bIjKtFfYK1D16B9jy0rz0AK5/c=;
 b=KVU3mPLw6bmxG2yoweAhJ+Q056aE+whrhwxF22eulh3aK/dmlwfSGZq1kelS5nWMYNNuoVTiLve68V07h1l3dT0Hp+YWZSOd6Pl+WczMd4B6K1HNOWc3X82cYwIyjI4o0nB/UeEDEZnh156w51MF+Dk3M8GhTpFaRndoNKRQuJgIF6dpjO2VaFdwn1mbpnLE+1v6ySTJZ2mbAmWMzOmuzFOQt6RFnMhe01vw6gapzmbt1K68Vp4r9pa5oI7jLpgElmXHx4Q0edZ4GrXIOlBAoGkTHq2er1Dmr7ucYu6nGWOk/eJHO6+Rw2Z6xZZpbmyNeXl6DcFV0TOMBcgkjUGhvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <fd0ccbd6-dd12-47aa-a2f1-93d2ae1b24a5@epam.com>
Date: Thu, 17 Jul 2025 21:55:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250717130147.2842159-1-grygorii_strashko@epam.com>
 <d8778c57-c934-46d5-a600-dcdb2ca5ec26@suse.com>
 <72a6cd66-e811-4776-ad93-979b65e69a10@epam.com>
 <10e9c04f-7de8-4aa2-a555-0a5cb975e91f@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <10e9c04f-7de8-4aa2-a555-0a5cb975e91f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: e09c3ad6-5123-48da-4525-08ddc5637acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU9XbXNSTW12ejhkbVBhd1ozUE9YbWcxSndabUduS1ZHQkNQclMza2JDWUFH?=
 =?utf-8?B?MzdVMDlkRlk0QTYwWVdWdXVmNGZTdWlpaDMxeU9mdHV2NmFEZytXa2QwTDd2?=
 =?utf-8?B?SlhDeDYvWFZydDJTcVBSZ1ZoZWFzOVB6VXZNUlJnWkkweDVXbzBvRGc2MVpH?=
 =?utf-8?B?UmdZQk5nNTBNL3ZqS3l5Y2p3aFltUThtbHJzQkppbFpnRkVFYXBGTjE0eTh0?=
 =?utf-8?B?MWliMitoR1JTWnkweUNXRTFyTlZieEhkVE8xVUVqaWdPSHArR0t4UGUyVVJL?=
 =?utf-8?B?T2ZXRGZSTzdCelRtUWl2RlVnd2FNSGFZNFZCZDZvTVJxc3YwZXI4dVNxbjR1?=
 =?utf-8?B?Yk1tWDRrempyci8xU0RBSktKNFZNTmRIdzVKZDBqNWhjc0xyMFVEQTlFeklW?=
 =?utf-8?B?OXB2dTJHRnhqQU1haitmUmdZQ3hqelVuVkZtbndzUkZyZis4ZUVaZTRUMUl4?=
 =?utf-8?B?K2FYdWU3MC90RWFLR2RUS3FlK3lheUxYRlMzcTdZWTY0YlNRdkp4S0ZRRHIy?=
 =?utf-8?B?NDZCSWkyR0dLOUZDQURrcE9YMStSYzNzS09NRlBjdysrL1JiZ3B4bFdjTlRF?=
 =?utf-8?B?UHgwSlhvVEdwbERsL3cwYW1qWEp2dGpickx1VGVPYzVkNDlaMDJXSitKOWI4?=
 =?utf-8?B?NkZZZUkxak84YTBqWlNkNTNGZFdaamNaaVRna0lYSHZqU2lEM2gvaENuazRl?=
 =?utf-8?B?OEMwM1FGRVNnZFVWS2lHcjl1bndrWGpHNHRSMi9jb1pFQWMzeVIweVA4dnFY?=
 =?utf-8?B?cG44c0FUeU00b2lFWnVIQXVxMFFTMnJiU2cvQ1hYWmZlV1hpN3hyeXVsdEl4?=
 =?utf-8?B?M1ExTW1XQXduVHgzTGFtdzg0a0tWVUtEWXB1RjBzKzZBRTZxYS8rZFZlN1Yz?=
 =?utf-8?B?RnNaYTVKZ1BIT3FBU29nYnhhMVNMV08va3h1ZzV0M1pPak9XNVhqcitYUkVk?=
 =?utf-8?B?U0tVRkRiMFlaTGxjSEY0K2VUczY4UGlFWUxpYVhJUEJNbEVOVDJnb3hiQmxp?=
 =?utf-8?B?SDlQQ2dsNkRsN2dDL1RWVHhwanVvSVMvbm96ZGtEdmM1clkyN0JuQWpPQVJu?=
 =?utf-8?B?QmMrNy9oT0RpMzU2WENrT0toNWxqclcxbHJNRzA0ak9rYUw0cGRQLzZPZlpr?=
 =?utf-8?B?YVU0ckpDTjgrZ0Y3dHlvZlJTN0FDd0wyaStZMDBKbTA4T2Frc1dXL2tHMXgw?=
 =?utf-8?B?OFp3eGtodk9IQ0dwRy9HWHNpbkhwRnVrRUU2QXhtTkNKM0JML0Y0NEpyMGJL?=
 =?utf-8?B?VmFwQVRDM0FyR21uRUUrQStERGJLQ05LRllobE1Rd2lCbndmL1BUbEM2SUZI?=
 =?utf-8?B?N245U1k1VUoyckVqVjQ2Z3M4V3kvVnpBanN5L3dsZUQ3UVpTZnQ2YU1VcXIw?=
 =?utf-8?B?V21jb3RXeHNJaDlicVVVSG1vQWlBbmZ3MDBFR1V2L0VUYmVobVd1U2RiRGpi?=
 =?utf-8?B?L2hRa2t3d0ZVQ1NYRThsbmQ4ZkpoUjRBYnBkU3llUE40ZlNHZTFxYTBVNFlE?=
 =?utf-8?B?bjV0eC9NQjVxYS94UXl0N0phWVM3ZmVtTkJFWjlQZHNPSzhvS0wzMEtENmlP?=
 =?utf-8?B?SFhRNE5wdDVFQnFrMTY1V0FXcUhFYW1XZ3FhV3VyOUFFb3plUEJjSmZPT2lQ?=
 =?utf-8?B?NzF1Y2VockVWcVFPTlZtQ1dvYUs3QWtCamZOb1lpNjZUaWdkV0g3Zm5QdGRz?=
 =?utf-8?B?czRaRVRVaCtSRWVIeGs0dTdHTmhXd2JZQ01oTWhITnhGdWxJcTlia1ZEdXor?=
 =?utf-8?B?c3BOZjhjZHdjWWc0VjdsazdkRHA1NHB4SEtLRHpKVHNiczJjaXNaS09KUHRW?=
 =?utf-8?B?M3JtSUFBY2QyUFFFSXd0L1o3NGZoTkFsQnQvZGxMZ3l6SEg3OE1iTG1mM3ZE?=
 =?utf-8?B?MFNQOVdSRFBPM2tFeEtHaWlUUU9TNGpiS1FFN3hXY1RNRkt3d1paUTNPbkRa?=
 =?utf-8?Q?kDywuTyh1Uo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y253UUxYYkprTUlQQ2ZQMDVCRXNxTC93Z0QyU0ZMUTY1M3REZmg1eHBUZXNY?=
 =?utf-8?B?Y01aSHpRM1k3TDlrR2hlR3pna0dxS0MwVHQxcVJMR2NOdHhmb3ordDVkeGVj?=
 =?utf-8?B?ZEVUb29ZckpDc1pKNXpWYksyL1ZUN0pZSHh0L0I1MlBZVlpteG9RdFJvVTUr?=
 =?utf-8?B?Q09tSDNMOVJmQ0xoNWkwVUpmM3JzZm1zZVFZOFE5d05nLzJIS3l3Ym1YblEr?=
 =?utf-8?B?WWJ5WjMvZTNqS3QzY1NDbGVVYVlyajdnbHAzK0I0QUV5SStEN3VVdzZ0YjBx?=
 =?utf-8?B?RDJlQTB2MU9BbDlzQlQ3TVREdUowVmo2UGltVkFVeGd6S1I5REFhWEtyUlpN?=
 =?utf-8?B?YUVDYVJpWnFUR3lSYlJ3dmRJNHJaTEdKRFJKV0R3V1ZlcGpzc2dZMmFrL0Zr?=
 =?utf-8?B?TDhJdDZTQUV1SFM3L2VKKzhISGJZUjlYWTBORDlHNE1NY0lMT3NUdzltL3F5?=
 =?utf-8?B?eHU2eTFUQVl5R2pxSTlsaDNLcnpjNXBLMWZPRTFIVmZMd1FGRkZnNGdQS1Ru?=
 =?utf-8?B?ejh2L1JEYmNBTXVwNFpWYnUwUjRPaWNxN2g3eEwxakdqVGg4b0dGQjdkckxW?=
 =?utf-8?B?T0MvRGFleThPTFdzS1loRDNxOUlwNkJXTHBsaXBLVUNrQ2VXcGIvQmpHRnFV?=
 =?utf-8?B?MkZ1MEEzeDFDekl5VjBreXBxS3E4TEJBck5kQUxIeXZ0Lzl6bXhNNlZTZEw0?=
 =?utf-8?B?ajQxTk5uMlQ2bGx3c0YxcVF5YjJsUktpekxZNzBTbU5MNUc4N0VySGUxS2N6?=
 =?utf-8?B?ZUJ6ZmVVSDRFU2tPSTNYdEEwVVlYUHUyZlVhTmFNdzc2dlREaHRwTlJERU05?=
 =?utf-8?B?ZEVoU0ppTkswV0RyK3VpQkZpalQ2eXJSZy8zZUdPM21BdjdRY1N1WmxUNGFa?=
 =?utf-8?B?QlR4MjR1OEJmWnFlRXc5RHpVcEZaaWtNQ0p4VlY1RVpZNU9sTzllelB0OWJW?=
 =?utf-8?B?SUI5bGFaTTF2NVd5N1ZBVU5HdStWTm93NTVWK0dUdk13WDVFTFNJL1kvajZZ?=
 =?utf-8?B?SkVFc0Vlbnd0bmxWSTFWQlJsQnkxeFNEWllQdCtMbWlyUGJlTVFjUjQ5R1g0?=
 =?utf-8?B?WlBqREloQy9MdG9qelJveHVreUREc1pCSDV5bVhzSGNPdU9LOGFmUzdEeGFz?=
 =?utf-8?B?RUVJbWtVWlA2LzBDM2FmNlZHaFBpUGpYcmExM2tscHdWM2U2RHV0RHlMSDly?=
 =?utf-8?B?c3Z0SUhYNjBrazkwTmJCUFJCR2xSZ2dUYVkrRDlvWkVsZmJNWkxWQXpRS0V1?=
 =?utf-8?B?eVd3cFQyeXhxdUswWmRvSFphdlc0ektmcE1CcEFhSGdVN3dMMWdkd25SVm43?=
 =?utf-8?B?djdpYkJSTWs1dDZVR0VRVWw3UEh3OWY3RGVLSHArRXVHWER5VTlvNFZhdGhQ?=
 =?utf-8?B?VmVsSEtRdW5zTkw4Y3JlVVlnZE0zUmV5MmRZMXpSa1oxZ0ZrL3ZsYVJsSFh5?=
 =?utf-8?B?c3RUN2gwV0J6VXloSUFDZkhxbDdIc082U1BxM3h5dzlxOGp6Y0poL0kvVElC?=
 =?utf-8?B?QUhxbXBxeHgzYTV3WWZxYXF6U2FIVnZFVEIrUmVFenpFa0UwK2dVMmNxVUdt?=
 =?utf-8?B?aG52R3RLbG9LWDlHdHVTbWtoQnBvZy9ib1BobGd5dWEvd0FhNlZjM0hOcnRp?=
 =?utf-8?B?a0FsdHRVNkE0WEdJMTdJOVlqUmtvT2dNNEhMai9vTDcvc0IwS0FpOEpPSk55?=
 =?utf-8?B?bzU1WDFUNEZGa2ZsT0hxMW1hZjNlbnJFV1lwTHU5dVVTV2tBR3ZkcEdnSWZV?=
 =?utf-8?B?bmFEbkZleS9JamNuY0c5akRaWXVuZ0NyRVhTRHZVR3BrVmp3cVh0ckxSVFU5?=
 =?utf-8?B?R2ZaWC9UVVE4c1FLVVBHRlg1U1RHZ0RITVBWcnFjMS9COExDcUtVS0FrZHJ1?=
 =?utf-8?B?ZXlURmNJaXhhbHMrekpvOXNtdzYrSVdTdFNiQUNvWjJ3a2gza2FxdUdNNklZ?=
 =?utf-8?B?ZzBPRkdITlJjQ29PWmZWUm0vcHFXRmY1ZnlmOXQxVi9Qb2l3YU42aGlTcXBB?=
 =?utf-8?B?QU5xODZreERnNWxXakthMDRZLzFaZ2hZMGltLzFiSDNWVllKMFJvdytVc3U1?=
 =?utf-8?B?emtPM1lkWXB1a1pycmphaTZaZ1dxNS94VUpVYkRseUJnd0dkNHliNGZwelE1?=
 =?utf-8?B?UThmM1ZNeTc2TC92ZlVBL004M3FYalpqam1rVlJDdXhWT1BuS2VlazVEQjRr?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09c3ad6-5123-48da-4525-08ddc5637acd
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:55:21.1285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWRSBjRCr4AJsKNbaI4Y8g3ZviTMJvSxxLK4jsev2ZU/4I9O4bh4xZlQWzGX6a8dei+dejjT1H00JsoBUqPO1Zv24ZXUXvBxfpwlIJni7XY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7045



On 17.07.25 18:33, Jan Beulich wrote:
> On 17.07.2025 16:41, Grygorii Strashko wrote:
>>
>>
>> On 17.07.25 16:10, Jan Beulich wrote:
>>> On 17.07.2025 15:01, Grygorii Strashko wrote:
>>>> --- a/xen/common/event_channel.c
>>>> +++ b/xen/common/event_channel.c
>>>> @@ -975,6 +975,9 @@ void send_guest_pirq(struct domain *d, const struct pirq *pirq)
>>>>        int port;
>>>>        struct evtchn *chn;
>>>>    
>>>> +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
>>>> +        return;
>>>> +
>>>>        /*
>>>>         * PV guests: It should not be possible to race with __evtchn_close(). The
>>>>         *     caller of this function must synchronise with pirq_guest_unbind().
>>>
>>> Isn't this function unreachable on Arm, and hence a Misra rule 2.1 violation,
>>> requiring #ifdef around the entire function to address?
>>
>> Yes. It's unused on Arm, only x86 is an user.
>> I can put it under ifdef.
>>
>>>
>>>> @@ -1710,10 +1713,15 @@ void evtchn_destroy_final(struct domain *d)
>>>>    void evtchn_move_pirqs(struct vcpu *v)
>>>>    {
>>>>        struct domain *d = v->domain;
>>>> -    const cpumask_t *mask = cpumask_of(v->processor);
>>>> +    const cpumask_t *mask;
>>>
>>> This change shouldn't be necessary; compilers ought to be able to DCE the
>>> code.
>>
>> Unfortunately not, with "-O1" more code is generated as cpumask_of() is complicated inside.
>>
>>>
>>>>        unsigned int port;
>>>>        struct evtchn *chn;
>>>>    
>>>> +    if (!IS_ENABLED(CONFIG_HAS_PIRQ))
>>>
>>> Nit (style): Missing blanks (see other nearby if()-s).
>>>
>>> I wonder though whether we wouldn't better have x86'es arch_move_irqs()
>>> invoke this function, and then #ifdef it out here altogether as well.
>>
>> Do you mean as in the below diff?
> 
> Along these lines, yes. I guess personally I wouldn't convert to an
> out-of-line function. If an inline function fails to compile (and that
> isn't easily fixable), use a macro instead.

I'd prefer stick to out-of-line function, if you don't mind.
Inline implementation causes cascade build failure:

adding
  #include <xen/event.h>
  #include <xen/sched.h>
in irq.h is not enough.

> 
>> --- a/xen/arch/x86/include/asm/irq.h
>> +++ b/xen/arch/x86/include/asm/irq.h
>> @@ -224,7 +224,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
>>    
>>    bool cpu_has_pending_apic_eoi(void);
>>    
>> -static inline void arch_move_irqs(struct vcpu *v) { }
>> +void arch_move_irqs(struct vcpu *v);
>>    
>>    struct msi_info;
>>    int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index 556134f85aa0..b8d8f202119d 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -1851,6 +1851,10 @@ void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
>>            cleanup_domain_irq_pirq(d, irq, pirq);
>>    }
>>    
>> +void arch_move_irqs(struct vcpu *v) {
>> +    evtchn_move_pirqs(v);
>> +}
>> +
>>    static bool pirq_guest_force_unbind(struct domain *d, struct pirq *pirq)
>>    {
>>        struct irq_desc *desc;
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 13fdf57e57b9..ad6032fb2865 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -642,7 +642,6 @@ int sched_init_vcpu(struct vcpu *v)
>>    static void vcpu_move_irqs(struct vcpu *v)
>>    {
>>        arch_move_irqs(v);
>> -    evtchn_move_pirqs(v);
>>    }
>>
>>
> 

-- 
Best regards,
-grygorii

