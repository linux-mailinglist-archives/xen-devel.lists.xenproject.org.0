Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB2CCEF68
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 09:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190504.1510940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWVo4-0001P6-KB; Fri, 19 Dec 2025 08:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190504.1510940; Fri, 19 Dec 2025 08:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWVo4-0001M4-GT; Fri, 19 Dec 2025 08:25:48 +0000
Received: by outflank-mailman (input) for mailman id 1190504;
 Fri, 19 Dec 2025 08:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vWVo3-0001Lq-Nk
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 08:25:47 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e68123c-dcb4-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 09:25:42 +0100 (CET)
Received: from DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17)
 by BY1PR03MB7899.namprd03.prod.outlook.com (2603:10b6:a03:5b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 08:25:38 +0000
Received: from DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3]) by DS1PR03MB7871.namprd03.prod.outlook.com
 ([fe80::3a7e:e6ed:f8e9:9fb3%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:25:38 +0000
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
X-Inumbo-ID: 4e68123c-dcb4-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFd3cstNbBUsNiJbKmNtI9RgUPnb1YaZMpVWtHV+95leBLqqmkC9Y+Swr4WWk+Qv2tTVSkyYPcZxy4NT/z1ufpnaN1ZyT6yNyaZwdSmLcdNO1NbjvOe7V5m5mlwW+/E52BU7rD06eP9cJbMLyHAmfy0etgn+eK7SgHbtb6eChP/j0mu6cxS5HzdeczjkOoZTnyvL6id/JoiI3wxg2RRf/iIFRLr53uq4LhCN+PjTUTokQTaf6EAIGR1GbJn6KTZHr15c+g5xche6sPaXKW1oEm+K/FidXh3jZg8+qEvcULoF1vHovAE7DXocX1LDfmG/TxuXJyavioSdJDGHiw/Mtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdMWSC+J53QzSvvE4bBRTh6OFu3VTpewRJYFzoJiYss=;
 b=CQgkiS1SEQG+7wKEyv+fwGHvYuxqTWa0TPdzW/AaDOi5aQtM7tPCC8siZLLeGSKJiolQLUa83ev8qLm85SrDHKjb/xJShicdtQkEjiqUBTGvqyWvoRx5za20jhKG4U7XMouYhDfv0uWrz/wKDmqpMjaPSS4lLXMoBczOmJ/f0MrLCvoG9ggpL6IkKWNKcJjIR0rBMaIgwYPqZoMrKfYMQzy4ypMRl/eBZkXXfusQFl7+pNCBuyeB5KhFLX3PvbSm/uOaMKu1+EdrsNGur42uCyVmtpI8ognHGnfgsqlcFgC744IkGCFcAGkMKdhtHn73SIJnOVkz53sYlA3MyzDCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdMWSC+J53QzSvvE4bBRTh6OFu3VTpewRJYFzoJiYss=;
 b=C1ZQLg2kniXPOcHRhIb6mV4a6wzeldN7ANyv6Q3pkuHprLWEZ+eJP8jM53PPcT1mz3bLhAMLcBLTgZ9PwvdTspFcHeRcEH0TtrUfe8jRUfqclcPBsNUFLTIYe9ognTnZhjhySZxmnJG2HlL0SqJEn95FGMYLhQYu0DktZDV1zV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] libs/xg: allow caller to provide extra memflags for populate physmap
Date: Fri, 19 Dec 2025 09:25:32 +0100
Message-ID: <20251219082532.43673-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::23) To DS1PR03MB7871.namprd03.prod.outlook.com
 (2603:10b6:8:21f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PR03MB7871:EE_|BY1PR03MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f207e5-4278-4b94-9120-08de3ed83082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWcwNHlwNUZWZ1Z6eWZyZDcyc2pTd1IvUlJaWEF3QzlTeE54L2JlMHJOQ2Vl?=
 =?utf-8?B?djZCdkNxSG9YYUhSdXVmL0VyRUI3RnVKaTZkS1VxK2VYdzlCYnZ4SHJ5WWZ2?=
 =?utf-8?B?UTJ0MXdMa2xlcGQvd1lWeHc0N2s5MGk5WWlVQk9DYmloS2IyMk1oSVZhMWNX?=
 =?utf-8?B?RTl4SmpIeHNRWW9FNDYrYkoxaDhiUmhnZ0FrVVBmYmdmcmpaVUdxbUJFV3NK?=
 =?utf-8?B?Uy9HTzNjbnV3K2VISmJXV05xZ2FwRDROY2ZBNCtqTlBDTEFJNCt6WEplNkNM?=
 =?utf-8?B?dDVVZUYvd1RMVk9rQndaMmp2RnlFZjI0MXd4RDI3aXlUelo3dStHUlh1Wmla?=
 =?utf-8?B?cDBhaUVxV0dzcnh1M2E1RjkyZWV2bmFHQTd3VUdoOVdHUzZDdGp1L0o2NlBK?=
 =?utf-8?B?amliU1I5VURxTkxrYUJ6Y3h5UGtKWXcvRG1sNDF6U3QrbzdTQU5qTVpDbEFj?=
 =?utf-8?B?bkFNQjFLL2dtc3hEZkxFd0R6UGVsckk4ZHZTTENCbjNuMXVVQkFsNWJWUlg1?=
 =?utf-8?B?by95dkhUakFlV1dLVHM3KzFIemxieUtUR0JsMWc3cVFZZ3RsbEE5NXBTais0?=
 =?utf-8?B?enFCN0NreVlaaWRsMXc0YXQ3aVh4dmduQzhjUkVybHFldEN4NkxWK29iWjM3?=
 =?utf-8?B?NGMvOE9jZ1l4dEs4NmZxTk1Nc1pFdHRyNmVndjR1MGx6Q1BVaDlrdnhFQVlH?=
 =?utf-8?B?YnYrZWczWkd6SU01NkZJaGdnRHUvM3dHc1l3a2V0Ymw1MFJMdC9sbzlqazFB?=
 =?utf-8?B?MVRjVldUcWlUSHJNcGo0RVpobVdSKzR2QmtxK1ppeExMSmgvV1AvaG5wS0lR?=
 =?utf-8?B?cGVGL3dFejRkZzNDcU41eHdiZkpxN1ZmVnVVV3dIbkMyWjBtZnQrRHZvU2VY?=
 =?utf-8?B?Mmhpcy90VkgvZnhNa21xKzJDOUZ5NFpEdnRpNmxuWjJaWmFkRUlqVjZpVThK?=
 =?utf-8?B?d3JWR1ppTUVFc0VKMFZKeHc2bHJ3dWIrVlVZTkZsTDcxUVRtcTd1VFhZRm5N?=
 =?utf-8?B?blZRdmVKOHRLRGJCekNqVFc3b20vQ1JSRjROT0NjSlZkTkhVQ2wzd01CY1c0?=
 =?utf-8?B?alBybjFLMWVTTWdyZHNFdnlEVUoxd3FwTGR0ZGx2eVJWNzM3ZTZkWHQvWFNm?=
 =?utf-8?B?WEN2c0cybXVQRFlYRkdEOVFaSGx3RGlVbjZHN2JuR1VrV3I3MFhHWG41TGRC?=
 =?utf-8?B?ZVFRQmFwV2Z0SmdldVVhRFVlT0ZFbjFHUFhOMWhUV2NGTVpmengvL012YmhI?=
 =?utf-8?B?NVZueTF1Wnl1ditQUHdnREIyZm83MWtVZ3R2Q0hRS3REdHpUZGQwN1gxVUxM?=
 =?utf-8?B?b1pRNm1sYndWZFV2YnFYcG9yeG9RNVhHUUtraURvTGtDck51L1J2UDFuR2ZE?=
 =?utf-8?B?TVlKclVKaUZVWVBieVJnUHhmYkdlcFJhZ1pRNlltclpoVnB3ZENYL3BjclA4?=
 =?utf-8?B?R0pWUWozMHAzYnJqTHIxRlNqQ3c1NVRBQjFZSjFkL2MwUS8vVnBhZngvcjl1?=
 =?utf-8?B?Rk9DUXhWd2plVVlxUVZ3S3N2UkI2V3R0Nk9abE1SdzJDLzRkUjIybWhibG80?=
 =?utf-8?B?U29xa0dQTW12TS9sQ2R1bWdhcG0rYXhBcUxjRnZGUzA3VGlUbWZuZktybEF2?=
 =?utf-8?B?YmlVRlkvdWl4ZmxrT0NmaFpWSE8wTWRvcnVMT3JZN0x0NU5CdmNkVWJuVktw?=
 =?utf-8?B?QUYyMUdzU04xTDM4eDRwNVA5bUplN3kvUmg3MlZUbk5icS9HOWxPY3pDQUdL?=
 =?utf-8?B?SS9WanJncFBITDhvcXJiaFIrWk9jTDBrd0lXdlpJTFRURU1IWElYUFRQRmZw?=
 =?utf-8?B?VCs5U1NNZ3Erdk9WenFiYnZ2bGIra09xUTFaVUhIMlJNbkY5SG9TZXhJSTNN?=
 =?utf-8?B?dHNLRlFpMUlOQ1ZQdjQrWFk2akpybHNpeVVWaHNObllOQmtXd0tIQk40cENw?=
 =?utf-8?Q?AZgLzuOs6YZE0O8BC7DEH5waDf7gGLnp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS1PR03MB7871.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWNWa1RGTjFzbVpSc0xzQWRMQ2kzaHRqTEk4RHcreFBEbWswVmwzakoxOVlz?=
 =?utf-8?B?U2RKeWgyQ0dHMUliTW93QVRhOStOeXA4MTFJbko5MkVQNzlzOC93a3VtYnU1?=
 =?utf-8?B?YlNQb0hYcG9MdmdLVXJMR284STNGVjJ5a2svOEhuRWYyU3d2TzlubGZrZDAz?=
 =?utf-8?B?dmxpQlp3QzcwdzI5dkRUcTZnU0RKcWVzbnQxd1l2RnB1anpZQThIeTgybFFL?=
 =?utf-8?B?cjY5a1JZY3g2N2ZMVlNEdEtDN2YxZXprK2pFVEZ0VHF2NkorSUZ5Mk5sSDVO?=
 =?utf-8?B?UFh4THlneVF1QkdQeFBROWk5Zjk3aldzQmJaU1ZDeDN3ZCtIMmxPM25rZDJn?=
 =?utf-8?B?UFpxZHc2VVpFVXRsUjRjZ3I4ZEdzL0hsYnd5N1p2aUhWVnh2THVIWUNUbTNq?=
 =?utf-8?B?NjRXbUV2TnV3Ny91NVdQWEVrS3BzSjk0cnNXRjBnbktNUGN2MGM0bS9hNndP?=
 =?utf-8?B?bWw3WHhkZ3dKVUhzTW5HMyt6eThqTVptbjJTUjE2d1B1VTFMdWRHMDUyaFpp?=
 =?utf-8?B?bENOSVV4Skh0VlJhNjdQM3BPQUJKOEFXWXJyTVhGcDJCT1R1MXl0MGpvTjhD?=
 =?utf-8?B?d2NoMWVhc3JManQ1MEZqa0pBRWFKZmNoamhaSWxTR0tEdUVzazJmSDBVTnlM?=
 =?utf-8?B?SURNNFhrV3k5cmJtOVVYZlhEL3lvcFozREUzSnlNK0ZwbFFremc1N2tpSlE5?=
 =?utf-8?B?QlF6TWVCNnc0MnZPK3U3cERyTEZ2ckVUTG5Ob0o5R08xTkk1SklyL0pQencw?=
 =?utf-8?B?QlhxS0E1dGdUaWR2ZkpCTlJyRGo1T0w3MDE0a1JtMGp6M2lZd1BJZjVyaDBU?=
 =?utf-8?B?b0taa0laWCtoM2x2TThhRjJVcHUydHRPN1FCdTlaNXk1N3liaEtuTGRid3dt?=
 =?utf-8?B?a25za1FINExZZWlrOUFYOTl4WEgydGt5UHkzbnJtaXNzaDlCeXhDNmFDenZK?=
 =?utf-8?B?SjFiVEsvNXNkOGliM0t5TnVnSmFEcmU0SWNBdkRtRCtKK3hxaVNIeTRzaG1i?=
 =?utf-8?B?L3hLaSt6QnRPY1crT2ZjM2JEMndlRXowM1NDU0lJc1VIbkdZMG4wbkN5T2Z6?=
 =?utf-8?B?QXpZdjc1c3ZJUnFCcllPYnhBcmY4dC96anRIdWZDNGcwRzMwbU05WjE4eXpG?=
 =?utf-8?B?OWFZZm5BbjVYVUZicStHMEZQWCs1RktvVTQrT0FWSURoZ2Y5RHZWNEZtb0Iv?=
 =?utf-8?B?RHFEN09yTjhLTWQ4WGZCSjBnZGVGeHpOMlRrcXphVUVmU0plak9maThvNjBq?=
 =?utf-8?B?WXE1Wjl0VlNGcE5iRVlib2ExRzZlZ1ZnYkk1OHNrYldpSkYyTS9veXZ2dnRm?=
 =?utf-8?B?bmtrY1h6dndJU2hZb0xtczY2REd2YzlIWFRzUXZCcjIzZFFBL1ZxaVllalh1?=
 =?utf-8?B?RllWa1JlbmJqcy93YStoTG4wS1BRaVpoRi85NU1HdmRRdkpoTmtKc21GZEFZ?=
 =?utf-8?B?azRWN0Y5L1p0bm5QT1JuaWpEVmpZdDBzODZESjZNalA5OUYvNGF0WUpyTEQv?=
 =?utf-8?B?cHZySlI4SVR0ZjV0WWVma1QvZG4wU0gwSE5UYXdIUzFKeUJLN3cxdzE1bHR5?=
 =?utf-8?B?VFdFNFk4M1NNSGJ0UFpTZ21CdVdZVjl5YTJiTTN4MGgybEg3bzYvR2xMK3RS?=
 =?utf-8?B?N3JxNzczR2ozR085cnJycjM4dEVPZS9KcXl1WlZPdkRWTncrZHdXU1BsOXRU?=
 =?utf-8?B?UkoyVGFKZ0RUWXVSS0lUMkhBZGgxZER3OTloL3Iwek1ZRUlCLzMrajQ0NStl?=
 =?utf-8?B?VE9pMWFYZ3RYelpySW53MjYrR1B2Yk1yQnpwQk1NdTlwUmRTYzNUWXFlUjND?=
 =?utf-8?B?N1lYM1QvQU5JS2txUE1HOVBmUkJtbElhOEQ5MzJJL0RxN0hsRFNHZnZpcitx?=
 =?utf-8?B?dVhwSUN1Q3ZrM09BeElOMHBOWEFXalhiMEp6SHF0TW1UZWhUZnhTV2x0bngw?=
 =?utf-8?B?UE8zcG05VGNidjJCYTVIT05SUHcxMWZQdjhRRmtTR3RZM1pYVlVPY2tkNXlk?=
 =?utf-8?B?K2Nyb2hxTHBuOWZZMEdFVmZ0Q0Y0L1d5d1F0QmV2cUNGMWU2VnNnVVRJUWJY?=
 =?utf-8?B?NW1KbUpOQ0ZHSXNsRERmaE5qOVQwY1cvQk00Nkhzb2pBay81QU9pYXNic2pE?=
 =?utf-8?B?S2s5QkJHVG9BOEkvQzFJRnhZcVBmRkViNSsyL2llZ1lBSnJhYjdZeDdrdm4v?=
 =?utf-8?B?Y1JKWHV6L1JFVEhCckFKM1puc2FJbzZxY2VyL0h4bHkyRVpMVXM1MU5rQWh5?=
 =?utf-8?B?MGNLbXhHWlFGWndJT2lZdksrNmtBZ1Y1ZXcvMkZrQnVXOEJTSmRhbzlJUDBp?=
 =?utf-8?B?T3FvU0JFREZDZUdaZDNvUy8zR01vSUZaYXZ4ZXgwdi9nTEl6TXMyZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f207e5-4278-4b94-9120-08de3ed83082
X-MS-Exchange-CrossTenant-AuthSource: DS1PR03MB7871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:25:38.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOWLlm2wyAww7EfXFSwRikKYF7ibitUtlPnoRxDhdJb9QZkbjiPV7d6lL0Kj8x8jkRdncKsuIBwnh6+nu2CivA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7899

Introduce an additional memflags field to the xc_dom_image and
xc_sr_context structures and use it to pass additional memflags to use when
populating the domain physmap.

No meaningful usages of this new field are added as part of the patch.  The
only know usage will be from the XAPI domain builder, which lives in a
different repository.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use XENMEMF_get_node(0) instead of open-coding 0xff.
---
 tools/include/xenguest.h             |  8 +++++++-
 tools/libs/guest/xg_dom_x86.c        | 13 ++++++++-----
 tools/libs/guest/xg_nomigrate.c      |  3 ++-
 tools/libs/guest/xg_sr_common.h      |  3 +++
 tools/libs/guest/xg_sr_restore.c     |  9 ++++++---
 tools/libs/light/libxl_save_helper.c |  2 +-
 6 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index c88958faa9a3..7c3b8b098352 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -242,6 +242,9 @@ struct xc_dom_image {
 
     /* Number of vCPUs */
     unsigned int max_vcpus;
+
+    /* Caller provided memflags to use when populating physmap. */
+    unsigned int memflags;
 };
 
 /* --- arch specific hooks ----------------------------------------- */
@@ -611,6 +614,8 @@ struct restore_callbacks {
  *        specific data
  * @param send_back_fd Only used for XC_STREAM_COLO.  Contains backchannel to
  *        the source side.
+ * @param memflags Optional memflags to pass in
+ *        xc_domain_populate_physmap{_exact}() calls.
  * @return 0 on success, -1 on failure
  */
 int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
@@ -618,7 +623,8 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
                       uint32_t store_domid, unsigned int console_evtchn,
                       unsigned long *console_mfn, uint32_t console_domid,
                       xc_stream_type_t stream_type,
-                      struct restore_callbacks *callbacks, int send_back_fd);
+                      struct restore_callbacks *callbacks, int send_back_fd,
+                      unsigned int memflags);
 
 /**
  * This function will create a domain for a paravirtualized Linux
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index a82b481a123f..268936efe25b 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -1260,14 +1260,15 @@ static int meminit_pv(struct xc_dom_image *dom)
     /* allocate guest memory */
     for ( i = 0; i < nr_vmemranges; i++ )
     {
-        unsigned int memflags;
+        unsigned int memflags = dom->memflags;
         uint64_t pages, super_pages;
         unsigned int pnode = vnode_to_pnode[vmemranges[i].nid];
         xen_pfn_t extents[SUPERPAGE_BATCH_SIZE];
         xen_pfn_t pfn_base_idx;
 
-        memflags = 0;
-        if ( pnode != XC_NUMA_NO_NODE )
+        if ( pnode != XC_NUMA_NO_NODE &&
+             /* Only set the node if the caller hasn't done so. */
+             XENMEMF_get_node(memflags) == XENMEMF_get_node(0) )
             memflags |= XENMEMF_exact_node(pnode);
 
         pages = (vmemranges[i].end - vmemranges[i].start) >> PAGE_SHIFT;
@@ -1354,7 +1355,7 @@ static int meminit_hvm(struct xc_dom_image *dom)
     int rc;
     unsigned long stat_normal_pages = 0, stat_2mb_pages = 0,
         stat_1gb_pages = 0;
-    unsigned int memflags = 0;
+    unsigned int memflags = dom->memflags;
     int claim_enabled = dom->claim_enabled;
     uint64_t total_pages;
     xen_vmemrange_t dummy_vmemrange[2];
@@ -1500,7 +1501,9 @@ static int meminit_hvm(struct xc_dom_image *dom)
         unsigned int vnode = vmemranges[vmemid].nid;
         unsigned int pnode = vnode_to_pnode[vnode];
 
-        if ( pnode != XC_NUMA_NO_NODE )
+        if ( pnode != XC_NUMA_NO_NODE &&
+             /* Only set the node if the caller hasn't done so. */
+             XENMEMF_get_node(new_memflags) == XENMEMF_get_node(0) )
             new_memflags |= XENMEMF_exact_node(pnode);
 
         end_pages = vmemranges[vmemid].end >> PAGE_SHIFT;
diff --git a/tools/libs/guest/xg_nomigrate.c b/tools/libs/guest/xg_nomigrate.c
index 6795c62ddc28..9790d2b4a844 100644
--- a/tools/libs/guest/xg_nomigrate.c
+++ b/tools/libs/guest/xg_nomigrate.c
@@ -33,7 +33,8 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
                       uint32_t store_domid, unsigned int console_evtchn,
                       unsigned long *console_mfn, uint32_t console_domid,
                       xc_stream_type_t stream_type,
-                      struct restore_callbacks *callbacks, int send_back_fd)
+                      struct restore_callbacks *callbacks, int send_back_fd,
+                      unsigned int memflags)
 {
     errno = ENOSYS;
     return -1;
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 0e419c3a96a0..f1573aefcbff 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -295,6 +295,9 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+
+            /* memflags to pass to xc_domain_populate_physmap{_exact}(). */
+            unsigned int memflags;
         } restore;
     };
 
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 4aed5cf4acb1..e148fc594a73 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -141,7 +141,8 @@ static bool populate_small_superpage(struct xc_sr_context *ctx, xen_pfn_t gfn)
     xen_pfn_t mfn = gfn;
 
     if ( xc_domain_populate_physmap_exact(
-         ctx->xch, ctx->domid, 1, SMALL_SUPERPAGE_ORDER, 0, &mfn) )
+         ctx->xch, ctx->domid, 1, SMALL_SUPERPAGE_ORDER, ctx->restore.memflags,
+         &mfn) )
         return false;
 
     /*
@@ -217,7 +218,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     if ( nr_pfns )
     {
         rc = xc_domain_populate_physmap_exact(
-            xch, ctx->domid, nr_pfns, 0, 0, mfns);
+            xch, ctx->domid, nr_pfns, 0, ctx->restore.memflags, mfns);
         if ( rc )
         {
             PERROR("Failed to populate physmap");
@@ -901,7 +902,8 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
                       uint32_t store_domid, unsigned int console_evtchn,
                       unsigned long *console_gfn, uint32_t console_domid,
                       xc_stream_type_t stream_type,
-                      struct restore_callbacks *callbacks, int send_back_fd)
+                      struct restore_callbacks *callbacks, int send_back_fd,
+                      unsigned int memflags)
 {
     bool hvm;
     xen_pfn_t nr_pfns;
@@ -918,6 +920,7 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
     ctx.restore.xenstore_domid = store_domid;
     ctx.restore.callbacks = callbacks;
     ctx.restore.send_back_fd = send_back_fd;
+    ctx.restore.memflags = memflags;
 
     /* Sanity check stream_type-related parameters */
     switch ( stream_type )
diff --git a/tools/libs/light/libxl_save_helper.c b/tools/libs/light/libxl_save_helper.c
index 65dff389bf8f..64bdeb3b32fd 100644
--- a/tools/libs/light/libxl_save_helper.c
+++ b/tools/libs/light/libxl_save_helper.c
@@ -285,7 +285,7 @@ int main(int argc, char **argv)
 
         r = xc_domain_restore(xch, io_fd, dom, store_evtchn, &store_mfn,
                               store_domid, console_evtchn, &console_mfn,
-                              console_domid, stream_type, &cb, send_back_fd);
+                              console_domid, stream_type, &cb, send_back_fd, 0);
         helper_stub_restore_results(store_mfn,console_mfn,0);
         complete(r);
 
-- 
2.51.0


