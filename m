Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DFCB27E45
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 12:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083237.1442869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrhY-0008VH-IB; Fri, 15 Aug 2025 10:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083237.1442869; Fri, 15 Aug 2025 10:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrhY-0008Ta-FU; Fri, 15 Aug 2025 10:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1083237;
 Fri, 15 Aug 2025 10:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KPM=23=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1umrhW-0008TU-MS
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 10:30:22 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d82e08a2-79c2-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 12:30:20 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBBPR03MB10319.eurprd03.prod.outlook.com (2603:10a6:10:53a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 10:30:16 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 10:30:16 +0000
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
X-Inumbo-ID: d82e08a2-79c2-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMjLmdApv2JgaOaGHQZSgQd118tWfwKU8kwS0UJ7yG7lyy6mV6wIQkGf4vsB6onXR1itnbLUh3ZTHEwkBl7X7rqj6r0E/vlqfVCiCNY5Xrqlk2EXhpEgvVm2fc366CwfYVDAZ/F4qTM2Catc0ykefJE0psNaUdjC7avhwp/WJ0t4Y9G9YWyDTHecr4c8TOZK4NjgB6ozh2P2VcjbVQvkDmW3eVcH/XGzIdHhe3k+xd6vk9pZeQUj8eocpLENXTUHxtLyKsUxENRbJp29eiEJNlK4qwARXWugBO8cQCxQMIFlv9kltSfXF9nyxMm7SY6CW6nVWHCLza1ZvuTUnamRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLjt83miRImh6TpQfMmlfrFQ+IKwp92JkOS2CL55pH4=;
 b=cDTO48Wg+uavhgDAjBTFVezq4XSOn0zeC1qvHe3uggwsnCbv8r2jxgLac6iaTRArxThBMlAI8k42DIcpXrjFFARfsBE64j7MnCXv11XAK1GtcSEa3ZomUKC8IygGYY4+1hTuaUoUs122vIqFfO3BTpH3EPTnBC9ZakEawJQ1nU1iFkiK0BBwRzHvlLnUSQniBtlqUHAl1vnc2GDs/Y4MvZU5P/qZaTZlAC444dBl0e6BUZdQZ10HQf7faquusgdB+x3S7l5qo+oxpSdrbYLCLMl25mpJwL09hA8JJfex+xjz5p9HpGdWOkJDTmsDfol1kUaQaDWiMLAyPLLQayS30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLjt83miRImh6TpQfMmlfrFQ+IKwp92JkOS2CL55pH4=;
 b=Fq2R5C4G5kA9e0ExUNt2augEQ6WdPmP4w5U97ITW1zTsgkksHaAabPDEkNEhipVQ2a0ZxA6+KPWcHltcbYNfa+3bOTqCLL7DWcvKrMXJf6gb0OKFdqgOjIk73CDYI4kb8lVzIiRSSdmj5EDZR9qbK4TiOB0asTuDD0g2gRhOVFbtXk4dAWqejFYprfwRMXv8awccqglDWXuJ6gHlaxJY1Ol58KlWc118hAXVKKl1Ok2pzWQMjPhpEbxIp7F6ZiEZG3LwRvu8nswh5lMDJ/X2i360w6i2kFWVQo9bh+lsVQiEUL4LDRvlleTirS7JxoDQeFEWzVqrBU5Nzd+JlV2O0A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs/misra: fix sphinx-build issues
Thread-Topic: [PATCH] docs/misra: fix sphinx-build issues
Thread-Index: AQHcDbJCdYlsiZdfl0mX5ViIXi0+6LRjZcaAgAAeAoA=
Date: Fri, 15 Aug 2025 10:30:16 +0000
Message-ID: <b8aff698-fbc8-4fc6-a616-fbe14c7538d7@epam.com>
References:
 <fb809a94e8a50bd3a59aa47ee1832c61af8a9f40.1755241166.git.dmytro_prokopchuk1@epam.com>
 <99171678-71a2-4cec-a6dc-343993108a37@suse.com>
In-Reply-To: <99171678-71a2-4cec-a6dc-343993108a37@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBBPR03MB10319:EE_
x-ms-office365-filtering-correlation-id: 66f9a84e-24fc-4c36-f641-08dddbe6b9d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RUJ1U1c5RjBHanplU0puRnFlWlAwOWo4d1dUQjBpbGVTZWxydkRqc2JRTnND?=
 =?utf-8?B?V2N6M3J5MjNSZ2ZjOVNqbENoUDZWQ0lwVjhPZ0U3YmU2MXdoVGhYRFg1cUJT?=
 =?utf-8?B?SG9XVVBYV2l5L2poMzF1MlpZdnpSK213LzloYWIyOUpLdTc3blU1aUxkK0xE?=
 =?utf-8?B?MStodnVqRC9CMUduMTd6d2MwSjVvRmphV1ZIL2k1a2tDdDZubHBkWDVOWDUw?=
 =?utf-8?B?dnJlbjZOT2U2N2tNSUxSTFhNR3JtbFJ2T1B1Nk9qdGpnQkI3eUY2d0l6cFBW?=
 =?utf-8?B?MytVdW1uSEV4QWp2SlVzY3VOUUdqbVhNdmMrckxVNlJhcnNCSHVDQXVLU25N?=
 =?utf-8?B?dVlXTDNuek0ybjhCTjVydzI1TUhNQWk1M3ljL1I2THdKY2hZVDhwZnBEakJv?=
 =?utf-8?B?c0lvNGNvU0JSR2xpcUZTaXcrbTNKK3kxTkl3U05iVWhJMndEWlVHeXRNcjZV?=
 =?utf-8?B?RzZ5S3JSOW93b0JLbUJ1QU1JYlVQdzNqOVZZNEt4RTlPeWRpaVV3WVNOM3VL?=
 =?utf-8?B?a08zMzl1UkVVQWd4aC8ydmlsVTc5SFd4WWlsNUt2eEkwQXJoOGsvNG94SnV2?=
 =?utf-8?B?Yyt6Nk1RNUtjZHFIcThhc1Z4cHRPYXkwVzJoVERZa1hyNlFZcGdjb0ljd3NN?=
 =?utf-8?B?cVFyYlFjMUQ2c290bVFzZ0RLZk9XL0FnRENLc2YvcXNhaTlYSVkzNWJhNkor?=
 =?utf-8?B?cTcxdTVUdjdzQ2ZXNVF0ZVBOMFQ4ZGlkMUlldEZQb3dnTWxNSXBHV3E5ZlNQ?=
 =?utf-8?B?MFpMNkFlODlEU2paVVdDUHBOU1VnNmlabXdXT0JGc1Q1S3ZVN1hXc0tET24z?=
 =?utf-8?B?Q3p5WlVBSWdZdE5qWlpKaG5KL2ZPTWZzZWM1TnRndy83K1pvU1h6cHNLaU9I?=
 =?utf-8?B?NXRRMXBTV0tZYWQxRTYvKzd4cDRRWmExYTJEam9Wc1FKZjdBazlVdGg3MVpV?=
 =?utf-8?B?dC9Td3Q0czNWSmFGN2NTbHZFYzJHc3kzU2NyNHdXeW1QZ1pyMDd1bG81MDdk?=
 =?utf-8?B?OVN0UWYwNnBpU3FtS3pSUXFtV3VGeldOMWU5NklnR0ZPWEdGRm5BSjV4Z2Ny?=
 =?utf-8?B?VDhTT0VkeVJyZ1hKMTJpMjRsUm95eWhjWFJQL1Era1NqaUF5ajY0aTY3L296?=
 =?utf-8?B?T0pWREt1UXJIdG5yc1ZNMmVTYkxkdGhLQ3NBQzBqYW0rdXJjdTRUY1V3aUV4?=
 =?utf-8?B?UDRUNlpwOEFOK0lwaFJ5UEpWbGRSb2UrVitQczdIaS9uSURtczhjY3k3OWVq?=
 =?utf-8?B?dGtYVGthMzFyS0lDMW5xbGpWZzIrbXF3eEZYQ2JVQmlBeTB2bCtmcEZ5a0h5?=
 =?utf-8?B?b2dLS2RBTld6WjZzTmhvL2x4YVFucDNqVHkrWm1wK0JZT3B2ZzRTb3h5YW1X?=
 =?utf-8?B?VENNNFAyRHhKMVAwYllyc3F3VXdST1dWQk4rUjBzYzBHa2h3NTRiNVhpVzht?=
 =?utf-8?B?MnZ4ejBNRitXaFlBTjRTK28zSm5OeEkyRHE4Nks5MnQ1dDVNa0tabWNNN2dN?=
 =?utf-8?B?YUlLaWs1UkpPVWswVnhaZUFzU1grZDJoUHM5SnV2L1dmYWtGM28vdFBaNW44?=
 =?utf-8?B?alBpakx4MVRRRGppUER2amVYRnhNSUh0WUJUTDdSTm4rTXhoR2xnaWUrRVhX?=
 =?utf-8?B?bEtUUC81bzFhVXBTM2NsQ3M2SGNQZDN6ZllGbm1laWwwTzI4eXhJdkpSbTlH?=
 =?utf-8?B?T2ZwcUFmaVI1c2FYK29hd0dNa2JXYWJkNm5DbDNBWVRJN0pra3AvNStLaldv?=
 =?utf-8?B?OGlzUGRiL3FmWHd1VFhqZmpUVHI5R1ZmcXNvZDN5azN0c0Z6STZnNE82MmNn?=
 =?utf-8?B?Qlh2L0JkWDhWTm5OUkErVGh0cUtQeG1GSitZTExJc3A4QklEYWhQSFhsUHRP?=
 =?utf-8?B?WVJvQ1VHS2N6Z1QyMk00eG5oOHc4NmZaV3M2VkoxT2JGQ09zdTZKVFhCd05x?=
 =?utf-8?B?QmNUODI5TDlURjlVUGQ1MFpaellCQndJR3ZrRUduUjQwUW5xdHIrRlNOS1pj?=
 =?utf-8?B?OXZ6elQ5OGdRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZU5ydnBkZkZCUGI0bG04cFFLdWNNM2hzQkFrUnY1VWlYWmdDNXd6Q0hORGxY?=
 =?utf-8?B?eXphSlgwYTR3Q2w2ZnlFUThZYm1iTVpQQjdIVE5LczIzODZHeVVyWXZBejFM?=
 =?utf-8?B?UmhIdzE5WUNhdGxNaGxrK2MwSkY1OFA4aTcvZEdHUS90Zk5jQ2N2TGdnZmE4?=
 =?utf-8?B?Vi9hYXlNeXFQS0F2aDVmQlRWTmVVNXUyQTRlVUxXYkJwMFNjL2lOaDRURGFi?=
 =?utf-8?B?cm5WMHZPUkxnSUxFQ0Vkc2t6ZUJiSzQ5Y0xPV2RtajgxSEp1ZWdJV2Z0S2Jj?=
 =?utf-8?B?bUFrYnJCclU4aE8wbWQzQlZHTERYbkRNdlRiNW11NUxiQlJsL2R6ZGVwdjJp?=
 =?utf-8?B?M09BZDIvTm5nVHRIT0xmOE1ZVzFIQU1XM2t2TmJvMTVocHMxVzRTMmVtWEdi?=
 =?utf-8?B?WVc4S0x3dm5kbThiRDJ5cWp5TlBaSER6VzZhMlBwVmJtMVc4Rm5tRTBUaG5T?=
 =?utf-8?B?b05jcTBzSW0vOWFOb00rWVQxeEFvYjQ2UzhPNWxacTZhbWZzSlFzZ0U4MjdC?=
 =?utf-8?B?N1FNZ2FTT2J0MnlZeGlDOFJTMnltM242Tkl6WHc4Nm9OWE9xK3JtcVMyVTRv?=
 =?utf-8?B?QzlEM2pTMlFla1E5STIzRUZFZklhbHY4QW9CSU43VUtxMkRZSXZrZUMxOHNz?=
 =?utf-8?B?bENRamtRR3lQc2krZEtHSWlNem84TnEyVVNYMWVRWURRdEk5SkRwZGRSM0Zp?=
 =?utf-8?B?Vy9iOG5PT1FZQW5FS2FFY1gwbHBod254aG5OczM4aVJEUEVFV1dxVEhCSTMv?=
 =?utf-8?B?dW1BaTEvS24yTVg1ZE1sMDNudlZ0UWNlWGV0dVRuaG5wM3ZoTVFUNnFvYkEz?=
 =?utf-8?B?dEc5SG8wWnJHbXY1WWthU1FlVzdUenhVUElBNWx1dHo3TjExTHZ4eFBuUExR?=
 =?utf-8?B?aENkYXpJUU9mdmwrcXJBOEQxTDBISWEzeitkRHJvZDl1Tm11cjhsY09zRnVJ?=
 =?utf-8?B?NUF5MHhYdWVHc0F6VHdSK3ZjR2tRNktqdWl0aWh1R2xkdFF1dzhyUmZ1Y0tO?=
 =?utf-8?B?NEQ1T2ZEYUlWQjJYK2UyNzhQRS9NSWVkM2FGUm1jWWVwNWNtMHlacy9lQ2h4?=
 =?utf-8?B?UW44TEowVWdNeW9aNy85ZWlKVkRkck5oektBT25HTGE5ZEpCU0pROHBuTDFD?=
 =?utf-8?B?eHAwVmNkOVdSUStIbDZxKzdRSjJpV3JKN1NjaHJDM2p2aGU2QjhDZ2V0T1Ni?=
 =?utf-8?B?Ny9ROUE3RzZ2dmFvYmREdkdtZDZzQjNPTFE5K1F1TWhpcXZXS0QrMVBtZUF2?=
 =?utf-8?B?QmkzaXZ3cjFWclNOT29JRTMvUHVSbkg3eFVlcDNoQUcxWDJjMVk5L2FsQm1C?=
 =?utf-8?B?ZUtJYkFLM013QXlsV01zZ1FUVFdWY1dqQkVFZTVKKzM3TlpRMS9UaDFmcEpV?=
 =?utf-8?B?RkRRS1MrcFhNblpjdkZrNVowYy9XY1dWWmdtcmhiOEUvbFNLbnhaTytEbVRV?=
 =?utf-8?B?alBUTkhaaTcvR000aDEyWE9kZ1BSS0VyWVVqVmswT2k3dWphL2FXSmpBOExk?=
 =?utf-8?B?WkowRVZyenVLTk9XVm5QQXY1MUV4dVNFYlVMYXNFY1JGUXphSUFYN1ovUjFW?=
 =?utf-8?B?dVdUeldyQzlhNm55YnJhSmMxVGduM2JnY3NyZlFGNEZvcjZRdlFtZFpjbEhV?=
 =?utf-8?B?RC9nQmZmZGJVaGVNOGhTMWJ0TzlOeWJKU1daRjFMejAzck5pMUVZSWlmY0F3?=
 =?utf-8?B?Sk5DUUxRQ3BMQnFFZWY3SUxkaXh3NFpmM1F6VlhPSEpwNGJucWF6MFprazJx?=
 =?utf-8?B?QUlDME9IWXl3N3ZhUHF0R0o2ckRIcTM2MFlUanpsMmtNM0RjQ242bjFBL29w?=
 =?utf-8?B?QlRYVm81c29VNVpLdzJyK3hrbnZsc01ZRGxYaTM0S0JTMWFUajYrYmdGYVh0?=
 =?utf-8?B?RWJkSUhhOFFhRER5ZHdCS043YlJSZ3M2cFptVHZ5c1prSi9PR2diVVNLQlFU?=
 =?utf-8?B?dnVmQWhYUHFkL3h0cEp6S1BnZHk3cGJxYUhwNVkyWWZHemRkdlp6MUZaZS94?=
 =?utf-8?B?WFVlRW1iTzNzQ3FXbTMzMmtCL3VCM0t5cTVtcXlURWFKbUJERnQ5SUtDWjJz?=
 =?utf-8?B?U2QyNG9jY0d1UnFDNE9xQk0yNjhtTGhJRUxodVlvdWRXWWVEMTU2RkcweXQ3?=
 =?utf-8?B?bnN3eUVBaGpUWTZ0R2QrclVVUm5BOHY3UEJzZG40OGJqNUI5UWVMaHV6VTNJ?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0BD61196D72C046B00CD08C0A2D598A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f9a84e-24fc-4c36-f641-08dddbe6b9d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 10:30:16.3241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUEfBKFLJJj3QJjfQ5XVbpyZ+6FCJK1cQloB2zn7gg/Q1qNq0mSrba3i/LOkbFAlcJxjLsBoyTWeLzSW1o0o6Arnd8NIZO0FCDEMY+EEVqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10319

DQoNCk9uIDgvMTUvMjUgMTE6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wOC4yMDI1
IDA5OjAwLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9kb2NzL21pc3JhL2Rl
dmlhdGlvbnMucnN0DQo+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAt
OTUsNyArOTUsOCBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0K
Pj4gICAgICAgICAgdGhlIGFic2VuY2Ugb2YgcmVwb3J0cyB0aGF0IGRvIG5vdCBoYXZlIGFuIGlt
cGFjdCBvbiBzYWZldHksIGRlc3BpdGUNCj4+ICAgICAgICAgIGJlaW5nIHRydWUgcG9zaXRpdmVz
Lg0KPj4gICAgICAgICAgWGVuIGV4cGVjdHMgZGV2ZWxvcGVycyB0byBlbnN1cmUgY29kZSByZW1h
aW5zIHNhZmUgYW5kIHJlbGlhYmxlIGluIGJ1aWxkcywNCj4+IC0gICAgICAgZXZlbiB3aGVuIGRl
YnVnLW9ubHkgYXNzZXJ0aW9ucyBsaWtlIGBBU1NFUlRfVU5SRUFDSEFCTEUoKSBhcmUgcmVtb3Zl
ZC4NCj4+ICsgICAgICAgZXZlbiB3aGVuIGRlYnVnLW9ubHkgYXNzZXJ0aW9ucyBsaWtlIGBBU1NF
UlRfVU5SRUFDSEFCTEUoKWAgYXJlIHJlbW92ZWQuDQo+PiArICAgICAtIEVDTEFJUiBoYXMgYmVl
biBjb25maWd1cmVkIHRvIGlnbm9yZSB0aG9zZSBzdGF0ZW1lbnRzLg0KPiANCj4gTWluZCBtZSBh
c2tpbmcgd2h5IG9uZSBmb3JtIG9mIHF1b3RpbmcgaXMgdXNlZCBoZXJlICh1c2luZyBiYWNrLXRp
Y2spLCB3aGlsZSAuLi4NCj4gDQo+PiAtLS0gYS9kb2NzL21pc3JhL3J1bGVzLnJzdA0KPj4gKysr
IGIvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4+IEBAIC0xMjQsNyArMTI0LDcgQEAgbWFpbnRhaW5l
cnMgaWYgeW91IHdhbnQgdG8gc3VnZ2VzdCBhIGNoYW5nZS4NCj4+ICAgICAgICAgICAgICB0aGV5
IGFyZSB1c2VkIHRvIGdlbmVyYXRlIGRlZmluaXRpb25zIGZvciBhc20gbW9kdWxlcw0KPj4gICAg
ICAgICAgICAtIERlY2xhcmF0aW9ucyB3aXRob3V0IGluaXRpYWxpemVyIGFyZSBzYWZlLCBhcyB0
aGV5IGFyZSBub3QNCj4+ICAgICAgICAgICAgICBleGVjdXRlZA0KPj4gLSAgICAgICAgIC0gRnVu
Y3Rpb25zIHRoYXQgYXJlIG5vLXJldHVybiBkdWUgdG8gY2FsbHMgdG8gdGhlIGBBU1NFUlRfVU5S
RUFDSEFCTEUoKScNCj4+ICsgICAgICAgICAtIEZ1bmN0aW9ucyB0aGF0IGFyZSBuby1yZXR1cm4g
ZHVlIHRvIGNhbGxzIHRvIHRoZSAnQVNTRVJUX1VOUkVBQ0hBQkxFKCknDQo+IA0KPiAuLi4gYW5v
dGhlciBpcyB1c2VkIGhlcmUgKHNpbmdsZSBxdW90ZXMpPw0KPiANCj4gSmFuDQoNCkdvb2QgcXVl
c3Rpb24uLi4NCkknbGwgYWxpZ24gYSBzdHlsZS4NCg0KRG15dHJvLg==

