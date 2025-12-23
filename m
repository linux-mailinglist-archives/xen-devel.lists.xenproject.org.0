Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E461CD9531
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 13:41:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192579.1511730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY1hg-0006Pm-DQ; Tue, 23 Dec 2025 12:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192579.1511730; Tue, 23 Dec 2025 12:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY1hg-0006Mx-9R; Tue, 23 Dec 2025 12:41:28 +0000
Received: by outflank-mailman (input) for mailman id 1192579;
 Tue, 23 Dec 2025 12:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhFC=65=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vY1hf-0006Mr-6J
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 12:41:27 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0edb3d1-dffc-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 13:41:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8373.namprd03.prod.outlook.com (2603:10b6:8:32a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 12:41:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 12:41:22 +0000
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
X-Inumbo-ID: b0edb3d1-dffc-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ba+RymIu72/q6FRQAY3XyT2TxCRjxnoIIPyxWgit5i2AHNZLdeZbItptGvSPXAwDevNFKKECflmx0gCEz7zWuxvUAkat0tQiT5Bl439tdt+u0k+SBSIpwWJLSKN+bQQ8HCojGX61ggVtQ0y++b7LLZJvhvi8wucpiUba7PqDs9qu8m06LNiPYJbNJzHwLMYo/8FunUl2q/RvaQ+o55yIFXjv0iMztejwuBzAO5/5uzwhSsopriu7JiRwLPVkMgTjyCuYcUMJDvkFQO6RgqSJsAcUf5xIJcvRt7ilBI0ntxWL+0kD5yIhBgpjRct3b3atNJQlQZ2eZEgLu5g3rl/W1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O650c9BC/H70OOHHoYAtvyDGLtk5I6CFDLKt+5L+XpM=;
 b=eLR168EADmd22oIrFeirqFBaTu/JwmGlawz9rKFfnIYAuuynJjY/xnlmU/B0G2z3Cu+3jIbsiRbFFw6054dOTWYZTb7kezwB5GD6cFe6sgL9eYznhtbS4UQod0uuJeyCigeV995qcWgJxRBw7ysHnRnaSNyzLQU2e2a+bglZqfgUQu5PFgoXKhQFogXLGx5DdvEOcgf+B9mc0w+vLyi0hUgNjGYx8ls8rWOlfQ/JvPc7ZtS4yDX1TLax28c21tc4YEUTluy+0oB/GXaQGn0cXKoQFXaGIF1H3zJhZVoPs16ycscfmofsl4hpxbxWnuX66qPO3DTcNrwpjcMrPGSX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O650c9BC/H70OOHHoYAtvyDGLtk5I6CFDLKt+5L+XpM=;
 b=jl4MQcqn8m4jrOP6IlmbbkSJkonzfRLchqlFqa+iWJny6wKA0ScVDbDwBeOny9Hv9T1XxTaa8y0kVxjmsKj03HZjAuEr9UlK4tqYx7qJNpTHofU+kxUQ5RE8rDfD8mjU6vTa8rpnupyv5Yal+HRggFAkG8kp5NgV6tI0dxLCYxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b4141bb3-a428-4b2b-8492-033e5fa21555@citrix.com>
Date: Tue, 23 Dec 2025 12:41:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v3 3/4] xen: move alloc/free_vcpu_struct() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
 <31208135cc61a8c8e593a286d450c2ec7757d118.1766404618.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <31208135cc61a8c8e593a286d450c2ec7757d118.1766404618.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 95be0edf-47a4-4b50-820d-08de4220940f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2xpQ3ZGb0lHLzBRN1hJWC9XTjAvSUVSQXZQQ0U1UE9PdUVzWXBnTDM3Zy94?=
 =?utf-8?B?OURQZmoxVjd2ZUVZQnFObWV2WlZ5TkcyS29QQk1aSEsrR3M1dDJ4dmNUWW5Z?=
 =?utf-8?B?clFaOTdOWTd6blRYbWlnUnZOenBxSkFsTkx1ZzRaNC94c3ZKVzlZQmFDREZU?=
 =?utf-8?B?c2pPZjkyS211Q2RtM25OVWtnVnQ4K3ZUemVvWWhpaE1GZG5iYklYNnhWOGdT?=
 =?utf-8?B?RzEvd1YxK2ZmMUpZYWF5VUFFR29xQ2crcXhFeHEvZmFlRmtjUmhGSi9vZVlM?=
 =?utf-8?B?WmN2OXNLNkxaU3JHTTNOSkNhY1JObmFHWmhKT2NhWGRhekswMWdjQVdkbFg1?=
 =?utf-8?B?UWh0THVFRmRDT0ZScFVjVFo1ajNFaEpSRUJOTm5hS2E4cUEyR05MK3ByM1pv?=
 =?utf-8?B?K1JZdnA4Q1FYYUE2WGZxQzNidzA4SCtNQkpWRlBUSWNxV241djd3V0ZVNHRz?=
 =?utf-8?B?ZFJrN2NUL25vVVlFblN6YTBsc21USURhQmVBVjFKWjMzbXZ6RGRtSVV2Ly9t?=
 =?utf-8?B?TXYwaEpPM0lZK0c1eTNFNE5VcHkyVlAwdXpNN05hdWc1eDNzeW5CTHB0YnRV?=
 =?utf-8?B?ald2TnNzeVU3clBCT0ovNFB3dXZhUHhIZ25saEdxbHdMU2kxcDBPOEduTHRE?=
 =?utf-8?B?K1d6M1k1Y1QzaHd0WFdNRnZVbjByQ3ZNRGJkYkp0YlV3RkFGUGVneWt0VWJw?=
 =?utf-8?B?RmVOQVB6ZVd4cnJ1L0VKRGI0cGZwVCtPQlV0S3NUKzkwVnJpQy9uRjlkR1Bj?=
 =?utf-8?B?cTBuN2hPNUl1alNaVTNVeXoyNVk5RVlsWlJ4RFdncE9jVm1mVEdycHRqekNu?=
 =?utf-8?B?TlB0bElOR1dGWTRJdkpYN0lvRnI3Mk1lN0poTUFUWFlpbmpkU1JJTGc4VWlJ?=
 =?utf-8?B?NDVnZkRuVzlLRW02czF0RCt4aG1RZ2FBLzR3dTA2ZndGNHYvSmJRZEVvYkZ2?=
 =?utf-8?B?aDQ3UnJWdXEyZkdRWngrWkVoOGQ5V0Fhd0wvTXU5MlZ0dHN4QXliV2tuNjFY?=
 =?utf-8?B?MlZ6SEJvVWhOZ0xEM1lwa1FPRlBwbm1Zd1BnSFA2Tm9CdnNLZS83ZjVCdWJ4?=
 =?utf-8?B?T0wwVFlSQ3VxUVl3aGF3NHdJMlVna3ZRUkpCNk96WGZqb3BiVk5qL3hTWG9O?=
 =?utf-8?B?SmE4MDBMbDNmWlIvc3dkd1c3QkNqeU5HWkdEVThNU3NEeXlqaEZRNXhYM0lZ?=
 =?utf-8?B?N2pyUUZieGZWL1QzUGptUzlpNm5YUzBiWEJ6cVJaaTFYUWRqRTl6K1dNdjJT?=
 =?utf-8?B?K2FpcGNRa243MGcyTDcvWDlLanBXTE1veVEzWlpQcWxNVDdUcGxZY2JFMCtE?=
 =?utf-8?B?RjFmdnZaR20wemxSK2l2UXViZzk5ek1ZTmlUMzJUMy9BekhwMzlGbENOa2hD?=
 =?utf-8?B?MDM2bjRKY1YwQktDTHJ6K0wxVTdmS1h1SHZTQSswYlA5ZUJBcllpeG0vZkgv?=
 =?utf-8?B?VEdKVHFGRVRCMXFCS2o5ZmZONkpJRWlIdWJxVlRkYTBwbjFBTldPSDhlcS9J?=
 =?utf-8?B?WVdvVXBoblAyZks5LzVRR1U4bHpFaW9ZbUNvWmp3Tkp2KzZsNjFqUnJMQlV2?=
 =?utf-8?B?QnhsMndCOVFIeVJPQ0F5MTJCR1dVcnRJRnVwL0NqMzRBTGJNbHZzY3o2N2tG?=
 =?utf-8?B?RHErODhLY1EyNUdRSXBDeVJtMmV1bXdpRHZOOUxzUmZMK2RWWXpOZXljY0dp?=
 =?utf-8?B?alREZ2MyWk1vS3hzd09FRWQwTjFkWUJqVm04U3B0ZXA4Z3hJTmovazhhNWtX?=
 =?utf-8?B?UVRFbkFtMnNOZ21TTlZyRkdPSEUyd0c1QmZuOERFNXNRN3FacHpHQ3hWQm5C?=
 =?utf-8?B?SENudFdGZjNDb25kd0ZQVUNJMGhZVml0U25rTi9PZGVFWnVVc0pkeXFNZ0d6?=
 =?utf-8?B?WWE3N0xtVXZkU1g4WmYxMitqQnE0bEJkM1Z1TzlHSUdGUW5yeVA1eDdJZjZU?=
 =?utf-8?Q?l8Tf9o1vBFk2G0RwpRQiQ1LoUbP2nRLy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGxKbnpHM1pTNVo1OXE0Tk5kMGN4MzVvV3prOGcwSjhRRDRPNWIvTTZ2SHF6?=
 =?utf-8?B?WGQvRDJwQXJSeTNibnJEYUgxbXRobzhFZlRiN3NlOUZZWkZaeHlIbXNnYXhu?=
 =?utf-8?B?RmtPcHVjZHlkbDlwSzhOWXdQUDkwVkVZVGxiZnBMM3BzWjBycnlqSkZBczY0?=
 =?utf-8?B?OUJCazA2Zlp6ZCtNMU5rU1ZVWjV3T1hoakxvZWQ3MmJwM29PL0NJa3pxK2Zv?=
 =?utf-8?B?dXJHV0svRnlmakxkcXJXREpQOVNqZWZ6emRJaWpyVmhGMkcvUVRCL2p6MGJS?=
 =?utf-8?B?MUlyeTJjd2lBazBjL0lzMEVBMWZRbGZ6SzRQeHh1a29oZFhjVFRHaUdWVEEy?=
 =?utf-8?B?Y3Q4TmRybitac3VKVDF1ZTR1TldEU0h5SzA4d0kya1dRcXY1anhyY0VHUjVQ?=
 =?utf-8?B?UUgxVnJVVEtTSnJCSWZEVk5admZvRnFlc3lHTVpJdThJaDhISTV3UlRlY2FT?=
 =?utf-8?B?NW9KVHBJYmNQd3dmUHBaSFJoaStLRTVlSlp4VTVMem5OeklpanlzdktkcHNm?=
 =?utf-8?B?YlVOanhKUy9TQ3FRdUY5MkU1aVk5Q2lHK0FEZGVGOXNvMG16ZG5NMVIreGxs?=
 =?utf-8?B?RTVPMm93RlhyaFRLVVMrb1lIMFZYdXpmMkhjVDFKb2txYit5ME5KOTZzU2tw?=
 =?utf-8?B?ZUlaRWlDbVdxdEF0NXlBRUVKZXA1VTNVZks1ZCt6RVVoN1JZVkoyUXNJOUkv?=
 =?utf-8?B?WjRlSUp2K25Kak02czdRbFlYQkFwVTJ5dFIrUWl2emVzS3hWbmZyR0ozbU83?=
 =?utf-8?B?YzdoWUcraG1nU21CajdpWVVjY0E2V0JOWTFEdWNQVW9DZTcwS3JmYmhCKzhP?=
 =?utf-8?B?RzF1YmF2NmRETnJUQUxwc3k0UzRRaGRnTVcyUC94N053dkRRUER3Zmo4UXJE?=
 =?utf-8?B?KzFldFdXYXZtMFRGaHNuTGUvb3JDMHg0QWlvS3FiOWFLRXlPalN2NDZoeEtm?=
 =?utf-8?B?TzI2UlZjT1krclNacnk4d28zbFRSZnVJeVZQUUhORU1pblhLdWpTdUNHZUhz?=
 =?utf-8?B?Z2dMT2FmZlRhS1dZVUFqcDJSYTRGc2w0dU9LYXhoeWxvM25nM2wrOVlZWXBG?=
 =?utf-8?B?OUF5Q1Z4YUxLb2pxUzdXWVY2c2Z3VExCMWZHZEJvV2N2T3JmNGVzVkNaSDdK?=
 =?utf-8?B?T1MxUjczTjBxTHU5bGJqL2hsTE8vd3pPTFpmQThUOGFCeFBxM1lNeUNiSjFh?=
 =?utf-8?B?alFsb3BPTUw0UDQwUGxuRXVuTUJlY1BKS29nMGE0LzBNQ2hvanZBamVqQlMw?=
 =?utf-8?B?dWxIeExRZUMreVF4Z3BMaGxnUGg1SzVhOEc0T3c5TFYxMWJndEZZYVFOZnNR?=
 =?utf-8?B?M0p0VGg2Nk5CZzB5aFB4aUV3VTAwQ3hBdXFzT3d6bjlxeGhCd0tzbksrQm9t?=
 =?utf-8?B?bno1bENNeVAzWDFrME9la0V3Q0huUlNlV0hUWVhkSmtJWnYrQ2ZwQi9jdEJF?=
 =?utf-8?B?b0V3WHRCUWRnMkVXQzkyV0swR3ZWNUErSm1pdWpudUwxN08yS29zOGZ6SjRr?=
 =?utf-8?B?VUpjeHZqNEdFQ0xhYjlJQ0FCWjk4OUYvV1hneWY5a0NGN0swekV0OW5adEZT?=
 =?utf-8?B?SkpDWDFWNWE2WEx0MXNJazRPc0FNa2cxalo2N2hCTUk4enV5NmdHT0tmdzNV?=
 =?utf-8?B?US9HQkxYOVBVblBLWkpnbG1kUi9RSHBqU2x6V29NRkpiVGw4RGVCY2xiaTVz?=
 =?utf-8?B?QUthcFV0TGFSZ3p5ekNocEZYMWQ0NU0zaG9Xemt4aU9zeXIrblEwekQ5d1Y3?=
 =?utf-8?B?cnczN1E1S2pidDdvQkx1TUp2Tk5DU3lqRUdxVzV0MjB4NHJTN0dVRVdCVk5a?=
 =?utf-8?B?K1ZVbFZnWDBpVE81a3dCaTBHS1UwYUxOeXVNblN5NVhmMHpRakFzOXdSckFp?=
 =?utf-8?B?VExPaTQ0VEllNlY0Q3JIRmlCZ2daVHg0bjdLVHdNY0dMNUNSOGR1RVdBOTRp?=
 =?utf-8?B?Q0ZkeHF4UXhoTXF2YXRtTW9TK292dnBLY1o0VFBZQmJTWFV6RUJETnZ1WkF1?=
 =?utf-8?B?M3NzdG91K3crcVU2bXQ1cjE3Ry85c3NQV2xGMklUM080Wk5zSStoM2Z1NldV?=
 =?utf-8?B?cnRUSHIrTlN3bDJLbmg4dFdPVWRaRmVFVG5pVnhDZjBjOFpIYXQxN09jNi9B?=
 =?utf-8?B?ZyttNVUydUloQzNHZ0s4dmplbmxjZnBPc1ZDL3l4SzVrdUdkc01aYjBHS3hE?=
 =?utf-8?B?SWlsL0dKYUdRYzJPK1FMaFBPUjZib2VoaHpFemZrWVAwdlJwQ3pNa2R6dEIz?=
 =?utf-8?B?eGdoTWd0aC93VkU1TDd6TDkrRFlSbEFKdVl0OCtWY29mdEZ0Rlp4Q0xqY2RH?=
 =?utf-8?B?YnR1VUxJSHhYN3RwdEN2ZzUzcVptYWFaNmhXL21BUHNiVWhraldDdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95be0edf-47a4-4b50-820d-08de4220940f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 12:41:22.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGoMQqGsaiK75lorw36B1dZRMKkhKsfUpC4Yz8TT4h0AU5CNKbD10aQRva76lyTpelg+nJdZuDbS8OYcq4DE0NNnYDd7a8RvNeVNrGpBPIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8373

On 22/12/2025 4:40 pm, Oleksii Kurochko wrote:
> alloc_vcpu_struct() and free_vcpu_struct() contain little
> architecture-specific logic and are suitable for sharing across
> architectures. Move both helpers to common code.
>
> To support the remaining architectural differences, introduce
> arch_vcpu_struct_memflags(), allowing architectures to override the
> memory flags passed to alloc_xenheap_pages(). This is currently needed
> by x86, which may require MEMF_bits(32) for HVM guests using shadow
> paging.
>
> The ARM implementation of alloc/free_vcpu_struct() is removed and
> replaced by the common version. Stub implementations are also dropped
> from PPC and RISC-V.
>
> Now that the size of struct vcpu for Arm64 is smaller than PAGE_SIZE,
> MAX_PAGES_PER_VCPU is no longer needed and is removed.
>
> Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
> common/domain.c, as they are no longer used outside common code.
>
> No functional changes.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> with the
repositioning as per Jan's request.

I've found one error in the comment block, but I'll submit a fix for
that separately (so as not to mix it with code movement).

