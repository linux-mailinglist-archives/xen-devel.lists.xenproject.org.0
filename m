Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B31CB0209
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 14:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181740.1504747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSyEy-0001Bj-Hp; Tue, 09 Dec 2025 13:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181740.1504747; Tue, 09 Dec 2025 13:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSyEy-00019H-Ef; Tue, 09 Dec 2025 13:58:56 +0000
Received: by outflank-mailman (input) for mailman id 1181740;
 Tue, 09 Dec 2025 13:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/6M=6P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSyEw-00019B-KD
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 13:58:54 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f6b2584-d507-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 14:58:50 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by GV2PR03MB8511.eurprd03.prod.outlook.com (2603:10a6:150:7f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 13:58:44 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 13:58:44 +0000
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
X-Inumbo-ID: 2f6b2584-d507-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGvVqmjuJSXZE7DMMEMMYiKi/AHeom1qLK674kEVA2Q8W0xbq3n5N2lWPjESgSqg7QII7ThaxZvKUsElyaN4tk083WeqmSCt3jgRo2g83ptk+1oeDDuNoRqzPBcxGGMrFSbryVaDUkFsDQDLXOXhup+DaYdKGcVBPbquNKiof1r/bnYpTlrxO9nmGKk+Bhomc/peuBdTCSVu3/1fI8a5WthYu6txxl8xvXpMU6cFVAIhoG2ltgdyUpGLe8o5PU/IoLgpHPh67SXl7IskvLsWer0Xq/gQygNqbHqZDlPGqu4lzGs6cKYe1sWHVa/8nD+0krCAKRSeWPtOqfEoDZmvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UduimE2RWzeVjXUWvSUXs47ARNfQi6MylC4y3iwSBwY=;
 b=qzfuWnpE5r+LoVjPjFKb2JsVR9msWU5l5PoS0WjkheKEP0a7onYLUbR8sTtjqZYq4Ip2HRiNmM+cvdOPui2evbWpnC3acsPwfLBE9C1L0zvgCLgpkJm4FipRSJkqwvieTmOR0eYtZdh/jK9QevOVguKsmsYIblD6XO3PFhkJ547pfYGESMGciW/LZ2K1uSfVLR9PFRuFB4RAQ4aU424zqFH19TluJuRe6r7uKFgZRFO4d9gxQQvf6xzOstnQdWoiUmCurtgIWfEauWss/IhlSEg3iHadsyWu8nkMzX5TW3iA8yBIiWuLFn8exxeWWSHF3MPF7pvtix+zd1nSaMVWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UduimE2RWzeVjXUWvSUXs47ARNfQi6MylC4y3iwSBwY=;
 b=SOvAN/U3NtFNkDten7W5WovhJSVSI8P/anAsIISiXEJ1kbT1mrQPzJKFpOBecGnV5hdl1MO14glPw3ho+KxRqH5tmD6kEQPEWwWJjVtg2Lm0/gBvsnAfyOdMlVyo1S41Qm6pb6l39AJoGD6SfuoxjBUV25PdvZ3C5mUPqsqjNDxB3FPK6hPKiNt7vk/tfWozr3pGJfPlOgso6DEk7cnCuLaMYwRPVSwoRNdc/wEXul2DNQlD/p+R4R5fF7F4YRWnwMFFN325F8JbC8oiodOtTmQ/uGYeXdvkB3IcS9YH/mqn1ShHyQjKFcEXzCCNn2KrZWK1/XzN4zZXIX6xa589/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <dce0dfec-3f34-49a2-a599-44b6c2322777@epam.com>
Date: Tue, 9 Dec 2025 15:58:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-4-grygorii_strashko@epam.com>
 <c9ee4fc8-44c6-43e8-88eb-9041c51aed16@suse.com>
 <d025e3dd-ba2a-4a9d-af37-37570e690aee@epam.com>
 <a3dcfce1-4695-4064-a1e3-af09bfa04199@suse.com>
 <f0da7ce3-1846-4865-8e66-bc3e50f78390@epam.com>
 <85cdb866-0be2-4204-b106-f66e2b15f841@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <85cdb866-0be2-4204-b106-f66e2b15f841@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0026.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::22) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|GV2PR03MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: 600b05ca-f9a8-41cf-f8d1-08de372b1120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTJVSUsySzBxWGpxYngzK2NpVVBkS0duYU9RV1pjUkIzTkw3R3VwbjhXYndR?=
 =?utf-8?B?V1FuTUpDdWdlRHdOdlZXeUlYNmRkTFpoYXhTQW5YbXFFSzM2bzltMFdPUzZM?=
 =?utf-8?B?QWwwMXB5dU4yTlN3ZEgxd2FvT3hlQlFNNzU3YnV0NHBFVU5Kb0VhTWYzSi9u?=
 =?utf-8?B?SlVDOHJLck9zRHVML2ZjbzFCdjF1WjQveS80MzMwSTIvc08yRTh2QkRrRkJR?=
 =?utf-8?B?bmdGV0tSL1k4R2ZWVWgvSVAvZ29FYmJhOXFTbVN6bVZuemorekpsVVdrOGkx?=
 =?utf-8?B?RTU4VURsaURRRFdwRTY1K2pub1NvdjQ3L01sUWp5b0FiNU1DNGZJY3NOYS9I?=
 =?utf-8?B?RmNiOFREdC9PQllWQkhaVDVlS0N0UkU0Q3ZneHhTbVdkS2NMYVFrWEVyNkps?=
 =?utf-8?B?bmpnMzlacjFZYW9jWHlRbG84d1ZQbzdBVmFRTGk4bkdZaUxva2grakFURjQy?=
 =?utf-8?B?K3lQU1JjS0RLV2t4b2MyYXV1UXRVTW9uekdCTUkzYXRyUzBvcFdNZ09WWmxy?=
 =?utf-8?B?SW4xajNGQTY4NElKUHUrS2RkTTFpcXNvV0xVWk5iZXg2MnpxczM0bkg1dkxq?=
 =?utf-8?B?N2JJOGdHTU1IZ0VmUGtObzQvb2ZjYVVPQjFOL2dySXV1VnpHWktzNWwySVlw?=
 =?utf-8?B?aXY1aE5zMlNqTDlCdDdrK283cVRWY1gwVGNhVnQ3TXg5dmhhbnF5RldmK05K?=
 =?utf-8?B?QmtwM0NBTzhSb2NETVluajB4bjNBN05xb0p0WnVxeUlYMnFsQkNoTlBZbFFM?=
 =?utf-8?B?RzA1ZWlPMW1tTUVCOG8wdi8ycUNpZHd3dlpXTmhqdXNSSG5ZYWJoWHhUdk9h?=
 =?utf-8?B?OGFCOEFZNWhpeXJxWmtaektlWVRaT2hHTXhJOG5YRk9mdHJQbVgvcW9FcWpX?=
 =?utf-8?B?ejQ2cmxSdCtiNmNEVDNacFZRMHNUeXFjU0tvZFNuMTZmZDhTSTJVWlVkL1lz?=
 =?utf-8?B?WjdINW82LzdqVVAyeEw0MDE4NUQwc25IV2o5cXNXWHVXRlZNdkM0UnJnNnNH?=
 =?utf-8?B?UU9XZmRpNHJWU3BUb0t3TmZ2MXdqSm5JczhVTGtsNTVHMitBSzhHbkxNZW1I?=
 =?utf-8?B?Z0dHZFp0elVmWHlEU0dQbUJhR1pWeXpDNkozRk5ud3lnLzNPZ0VNSUpIU1dn?=
 =?utf-8?B?TmNCMkdkR1ZHZVBNWENzREkrYXg1T09mclkzQ1ZOZUpvekZMc1o3NzVHWTdj?=
 =?utf-8?B?cGkxdWY5MlNoRDZtdmNzT3kxS0hOdlgyK1NNWGZQNTRNUFl0dWMxSFZRcGNr?=
 =?utf-8?B?cncyU1dHRisyVE1oQmphaFN0bzA3NFRGVXZUTW53WGJ5K205NkVuVGJYc1l1?=
 =?utf-8?B?aDc5WVhobkxoQ0llQ0dUUlZMQWdIeFdFZm1reExqaTFXcDZobm51a3hEZHd6?=
 =?utf-8?B?dVQ0empRR3BRcFVQbmxiSXBvZGFHQURyQUI0NDI4UWVQQkIvaFBEbVk2NFlY?=
 =?utf-8?B?azVsa2VtQzZYcjVZV3MvM3AzVkp0Nlg4dzJYeW9ncVF4OFZITDRUQzQySDJy?=
 =?utf-8?B?c1VidktsR2FoZk13R1lsME44NWpzcWdlVkUyaG55b2tXT2lvaHhsT1p1M3Zl?=
 =?utf-8?B?elJFNGdKYlhra1dMYjRKaEhGWlFaQ0JrM1dpU1U0dWVpdFJnckhDS3l4alBz?=
 =?utf-8?B?Mk9oN2FNN0dqaWk0TEd4UjJMdXVjdXc3dUNKSXhsZTFXVTF0UVhheWtpOHpX?=
 =?utf-8?B?bEF3Y3hqU3RuVk9KRDNyTENnRFpDdzg0d1UvRi9SeWQ5OGhpU0JtaWFkaXNy?=
 =?utf-8?B?R2h0SG9ZUWx2djhPazdhVHI2N2NHZzJKcFBMVjZMaDNEWkZnZzZsaE5jMWNY?=
 =?utf-8?B?eFBWbzZyVWR1TXQ4VzEyVngvRGgxQTlobGpMUlBpeUR5dSt3bEpvVlh2ZVRk?=
 =?utf-8?B?Y1JBdmxvSWtXTDdzRzJQUWY5bitINVhDTWRRbk5saHUxako0Y2UzS0dEVzRD?=
 =?utf-8?B?S1FxWjFUU09LYWl6U3FsVkZQaGVHYkRtMUF1SzBpSnk2SEg1Smh2aC9ydjY0?=
 =?utf-8?B?L296ZW5ScHBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlFBOHVWN3dCRjBwZUhCb1pudEFyQnljb2lCU1Y0dVRxUTdQQmRiUWFvVWFm?=
 =?utf-8?B?WEhHRlZndXhRaXNubEFodWdqWEIxYjJONjM4dXc0Uk1VUDkxV3Z2MFZFT1FS?=
 =?utf-8?B?Zkx5ZlRaK3QrTXFYaWhMYjBMSHpNY2IwaUFZV0xxdldVUzkzbFpDL1hLdzdh?=
 =?utf-8?B?QUx2d3hxQ1hQTkpWdWg4ZzEzWHhQeU1xeTQ5OFlqamxyWU9vVDJ1M2xhQlBa?=
 =?utf-8?B?STNaWGN0TS8xWFFReFZzeXBJcDVDM2Q0amNXb0R2L3hxU0pvdVhNanlETUZB?=
 =?utf-8?B?VXVyVjExZlh1Z2JIK0IvRzVCNEdVc01TYklPQ0dOYWJyRlhpdGZ3c2Y3RU1U?=
 =?utf-8?B?b0F0MUNZRmdhaTZubkdKNVAxT0l3MTg3QU85SUhabWNMVkJtZWNTUzZhVmQ3?=
 =?utf-8?B?RUVNMW1vTUkzbTdrWDdRUGdLekVVbGNnSDZvK3FPbnJZS2kwWUszUng4eUZr?=
 =?utf-8?B?dHVyajl5VDdvK0xCUEl2cnh1MkkwYXhDS0g1UFRhTG1qTUlScUp6QVlpcWZ0?=
 =?utf-8?B?Mi9Ib2lxVGNIZVg2QndHRjAwZi91YnBvREVFWVJmYURJNzVMNlFOc1BKeXd2?=
 =?utf-8?B?L2pFSTBkZFlvQWVsMXZJdDZkeC93OXduODY1TnR6V0xlckRYUnIvNXBZYzVN?=
 =?utf-8?B?Y1MrREYxZ1hiV080VEFvc1l0SzZEcEZFNzlYUzV1eXRRN0krbndraURVYXVR?=
 =?utf-8?B?RVpDRk5KaEYzbGxTUWUxdkNsV09qZXdSSExBTkdDSzBnYzBhZThKMDBnMGJv?=
 =?utf-8?B?R0dqZm4xQ2IrTUxVVTYwanpUMzRSMzFHSkY2SUp6SGRSWUtUc1lZVGxJK0NW?=
 =?utf-8?B?TkExU00wQzlOZFYzZWJjWG4vM2tobU5EaFVVLzNSSElLSWpHaTdoc2xuTUQx?=
 =?utf-8?B?UHpiVEp3OFBIRk94VXlGRER2TU5XYUYrWTk5bDAxRFVIb1MyWElVaEJoZUUw?=
 =?utf-8?B?ZkhLbTdJM1F1dzZsTEk1anJhclZtS0hmcXA3STQvVmhacXk1Q1B1KzV1QUFu?=
 =?utf-8?B?REZ5QkdHcjlpMCtiTi9ZMlNpUWxQMi9aM082RUxwallEMVBvbU45YzhCSXJs?=
 =?utf-8?B?eERlbmw4S3lmREF3ZjMvR3ltQXlBaEVvTTYxakxkNFNFbUNwMVNwUU9EckZw?=
 =?utf-8?B?NTd2cll0bXJYVXVKcWEyYzVGeGFsTUwwMlZTNGlUUlc2NUExSnNDMFV4N2th?=
 =?utf-8?B?eHVQcytPMm9Sd3doVGJ6WmpON0lMWkFrYXJ2T3F2TzI3YnkyendZSVY3cHo5?=
 =?utf-8?B?VEZHdnlrT0wrZEd0VzF1R2hBZjQwcHBvQ1lrZlpZNCtiMmpremdhNmZVWlRz?=
 =?utf-8?B?ajFGRnk2dHJKU2Qwdld2YWlsbE9yU2JEby9RVldaWURqcE9ja2R5bUlQNkEz?=
 =?utf-8?B?QjNzVC91d0FXYW5HWE82ZHk3K0Rzb2NWM28ycHIrS25BNVk1UDlwcGVXVjMw?=
 =?utf-8?B?clJQWW9PcEI1M3dYeUdtM3pzc1paeFdaSEZYZTZpemZ5eDExSXl3RVVCSm44?=
 =?utf-8?B?dVZ3V09KZFYrTDhScVJTSHhKMkVIUHFqQkpyUXNCTW5SNFV5M0VkSjNLRkF3?=
 =?utf-8?B?SkRSMmZTaXUrYzRQdDRrUDc4OEZWNTBDY1cyclJvRVZCTHMxdWtQWUpVZm9L?=
 =?utf-8?B?ZEN0MWZaTVBJek52MUhLSVZ1NUJDRlVQZWdjeWo0V1g1cTZPNGpiTTFRN2U4?=
 =?utf-8?B?cXRzSTBMR1VjQkdaTGljMlAwTkp3M0lZdlQ3cDN3Y0tZLzVmMnlCbFBwdHZZ?=
 =?utf-8?B?SjBqSVpzZWtCOUpHZ2FaNC9obnVXc0lxRTR0ZldQRk1zUjhXUEFDeEViVGND?=
 =?utf-8?B?cG05dGJUQURmQ3haRGJnb2pabHFFdzFUUXhzZUZoTndteW1INFZyV2ZLTjYr?=
 =?utf-8?B?NHdmMnZWQXRxaUtvUUw0TTJJV0FYQ0VudGtiRkd3anFMM0pMdS91emE3SEp3?=
 =?utf-8?B?VTFxMWY5MGRHdWNQTzBxNFNNTzBsSUlhUEV6YTgzUWFOM1kycW95Q2xieVZP?=
 =?utf-8?B?cGgwemJrVDZvZkVJbW4yek0wZFZlVnUzMXZ0cDFkU0U1NFZHdEVBOGl4dTFH?=
 =?utf-8?B?ZUF4L1hTNXhvVW5GRWpDc3Ezc2ZwRTBBZFc0REVhaDRTSklTUGJ1UnA2RWRp?=
 =?utf-8?B?L2M5S3B4WmJGcFAyN3NJSTd6aHZRTzdPcGowWFI1Z21MdDQ4dGtJbmREQ0Nt?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600b05ca-f9a8-41cf-f8d1-08de372b1120
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 13:58:44.5509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/RNPnHpuE9LAZ+2xyPY0NuTXX0Xj1RedMY6XJFK/Ox8IDHnre4gjDFJFR28b6EMu2jrkzWdaJq2I695c/ns8GsILSCQdsLpoRFcQjHbIfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8511



On 09.12.25 14:44, Andrew Cooper wrote:
> On 09/12/2025 12:24 pm, Grygorii Strashko wrote:
>>
>>
>> On 09.12.25 10:59, Jan Beulich wrote:
>>> On 08.12.2025 20:21, Grygorii Strashko wrote:
>>>> On 08.12.25 14:44, Jan Beulich wrote:
>>>>> On 28.11.2025 16:22, Grygorii Strashko wrote:
>>>>>> --- a/xen/arch/x86/pv/domain.c
>>>>>> +++ b/xen/arch/x86/pv/domain.c
>>>>>> @@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
>>>>>>                 goto undo_and_fail;
>>>>>>         }
>>>>>>     -    domain_set_alloc_bitsize(d);
>>>>>> +    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
>>>>>
>>>>> You mention the change in condition in the revlog (but not in the
>>>>> description),
>>>>
>>>> The updated chunk was based on snippet from Andrew [1], which
>>>> used incorrect condition - I've changed it and noted in change log
>>>>
>>>> [1] https://patchwork.kernel.org/comment/26680551/
>>>>
>>>>> and I'm having trouble to follow why ...
>>>>>
>>>>>> --- a/xen/arch/x86/x86_64/mm.c
>>>>>> +++ b/xen/arch/x86/x86_64/mm.c
>>>>>> @@ -1119,26 +1119,6 @@ unmap:
>>>>>>         return ret;
>>>>>>     }
>>>>>>     -void domain_set_alloc_bitsize(struct domain *d)
>>>>>> -{
>>>>
>>>> The domain_set_alloc_bitsize() inlined in  switch_compat() and x86
>>>> PV domain
>>>> always created as 64bit domain.
>>>>
>>>> At the beginning of switch_compat() there is:
>>>>
>>>>     ( is_pv_32bit_domain(d) )
>>>>            return 0;
>>>> [2]
>>>> above ensures that switch_compat() can be actually called only once
>>>> (at least it can reach
>>>> point [2] only once, because there is no way to reset PV domain
>>>> state 32bit->64bit
>>>>
>>>> this is original condition which says:
>>>>>> -    if ( !is_pv_32bit_domain(d) ||
>>>>
>>>> do nothing if !is_pv_32bit_domain(d)
>>>>     - for inlined code is_pv_32bit_domain(d) == true, so
>>>> is_pv_32bit_domain(d) can be ignored
>>>>
>>>>>> -         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
>>>>
>>>> do nothing if (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page)
>>>>      - inlinded code should proceed if this condition is opposite
>>>>        (MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page)
>>>>
>>>>>> -         d->arch.physaddr_bitsize > 0 )
>>>>
>>>> do nothing if d->arch.physaddr_bitsize > 0 (already set)
>>>>      - inlined code will be executed only once, so
>>>> (d->arch.physaddr_bitsize ==/!= 0)
>>>>        can be ignored
>>>
>>> This is the crucial point: It being executed only once isn't spelled out
>>> anywhere in the description, and it's not entirely obvious why that
>>> would
>>> be. Yes, nowadays it is. Originally (iirc) one could switch the guest
>>> back
>>> to 64-bit mode, then again to 32-bit.
> 
> I changed it in 02e78311cdc6
> 
>>
>> I'll update description.
>>
>> Or can add it back as !d->arch.physaddr_bitsize to be safe and avoid
>> confusions?
> 
> Please update the description.  The function really is singleshot now.
> 
> I'd expect MC/DC coverage to complain at leaving the conditional in
> place, not that this particular codepath is going to be on the top of
> the list for coverage.
> 
>>
>>>
>>>>> ... this 3rd part is going away.
>>>>
>>>> Another observation: MACH2PHYS_COMPAT_NR_ENTRIES(d) is looks like a
>>>> const, as
>>>> (d)->arch.hv_compat_vstart is always 0.
>>>>
>>>> grep -rw hv_compat_vstart ./*
>>>> ./arch/x86/include/asm/config.h:#define
>>>> HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
>>>> ./arch/x86/include/asm/domain.h:    unsigned int hv_compat_vstart;
>>>
>>> This observation isn't directly related here, is it?
>>
>> Yep. Just found it while investigated.
>>
> 
> Don't be deceived by that.  pv's dom0_construct() has
> 
>      HYPERVISOR_COMPAT_VIRT_START(d) =
>          max_t(unsigned int, m2p_compat_vstart, value);
> 
> which hides the write.  I've been meaning to fix this for ages.
> 
> In fact, I could also submit the inlining of domain_set_alloc_bitsize()
> too with relevant history if you'd prefer.

Sorry, didn't get it - you wanna take ownership of the whole patch
or part of it?

In general, I'm ok.
In the later case I'll need to handle only domain_clamp_alloc_bitsize(), right?

-- 
Best regards,
-grygorii


