Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA769A926
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 11:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496999.767931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSy83-00062e-34; Fri, 17 Feb 2023 10:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496999.767931; Fri, 17 Feb 2023 10:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSy83-0005zk-0K; Fri, 17 Feb 2023 10:38:11 +0000
Received: by outflank-mailman (input) for mailman id 496999;
 Fri, 17 Feb 2023 10:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSy81-0005ze-2z
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 10:38:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28e1f44c-aeaf-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 11:38:06 +0100 (CET)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Feb 2023 05:38:01 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5480.namprd03.prod.outlook.com (2603:10b6:5:2d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 10:37:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 10:37:59 +0000
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
X-Inumbo-ID: 28e1f44c-aeaf-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676630286;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x5NxroGGI8Keq7tP8qcB3vZgI8nQYVvg3WrvcPA3Cn8=;
  b=AYzbFIYLJwWWV5EmRk3NHZ3lWHYz8NOLQbuFnzavgUZHK7nS1nglEowM
   UoyUVclfSUFKwDegWJ53qZLgvwF5JWMMwMgs4FSL8K++xrk43xAZCne74
   US1sOWMWWp2zf6PjbqDYfuoSWf56cVQFSYr4tQIb38qehJMb8Dn8nQPjS
   8=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 99872934
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23://cwO6i7XeU0oKT1YdjWu3LCX161QhEKZh0ujC45NGQN5FlHY01je
 htvWmqEP/zYM2D9copzPY/npx9QusOExoBlGgpkrHxmFSsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gaBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQnJysWShWhmNnq76vrQao3t9oBKfjkadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGyarI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RezoqaQ72wH7Kmo7FyEpfkC88aKAuxCndtx0B
 U82/DACsv1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebR4A2
 0KNntjpLSdyq7DTQnWYnp+LqRuiNC5TKnUNDRLoViMA6tjn5Y020BTGS485FLbv14KvXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94aRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:WjOt0q6OQQaki13LLgPXwPXXdLJyesId70hD6qkRc203TiX8ra
 uTdZsgtCMc5Ax+ZJhCo7+90cu7MBbhHPdOiOF6UNuftWHdyQmVxepZjbcKrQeQfRHWx6pw0r
 phbrg7KPCYNykCsS6wiDPId+rIGeP3l5yVuQ==
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="99872934"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGrPnsLjUE4X7wDSpLkOc3vMbMNcclQXJW2Be7TnLeXl0Q6L1HzsfRRU6Z2/bg5TJjMCR+N+56mKyX1U7vvOWgYwYKdx1eeunGKfvpVbMJNOVMppC+goNWKUtPIXceicQDUsrvki7puE5mXhY18RUSd6rCuTrpGN+iQLenFfCFsicCcT64TBKkdt15rplf6GgaIqAuQCLt+SRmwB9z+vT88FQxb7t2zOA+M3M/pndJUcvYwOOxG7EWQkKn9JHEpb0Iy2sOc6pr8O1rSV/XsPOojOXYWpHStKL9XGztVqyXZ5CtP5uJksGW0H35onv+HtXms1ZbtmAbgnf4krknIajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxNENVWF8iIo6WjdZsWWx3T8vnzZOKV0t+7laPKuVoo=;
 b=HwOkLmkQlecLt0MdHvUpUicc/jE4mVrIm+em1KIQeYacEOsuMp5zluoxfO/ng6BoUD6MMltRbNkfw+i8dp83zdV2pT4LL0a0fgonu5WjCPYikJwchW9mH+Q3B0QIW2msUz3CpQBeToICP4Y2IRrg6vpwSao0CqfE4nIiFiAyXF6No3Sb9h9jmS6Hb8vJ8QCZ0JAmG7ytgpJk5YCQ6q2JsWf8SSZM2mlEfaveOsPqYkvm4LBMpZVbspTNZ9wWXvwj4zohIspX3EQt7Obxp7ukahej78y00li2V6+zuwaxX2pWKUC0DMe5b7qqAWGDtdMd21M4nQA192pIz2vSupGL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxNENVWF8iIo6WjdZsWWx3T8vnzZOKV0t+7laPKuVoo=;
 b=uC/wp6zBNjt+fbmjLhpckP3qASFaklPZXPo+9rU2bFW8SkQj+LkVFy3xPsdLvAoz3j4pN+j/mCT31ati8VomxaxmtjrSkR62s48zVQwldC0S6W3Fl9ZmSFUC54yPED/iYgXggS7RYXKWXV01T1RVZPLNc9a2RS879iy0pmHfRX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7c062574-4c00-e0e2-cd65-d37dbdb91122@citrix.com>
Date: Fri, 17 Feb 2023 10:37:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC] xen: Work around Clang-IAS macro expansion bug.
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230217001914.762929-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230217001914.762929-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5480:EE_
X-MS-Office365-Filtering-Correlation-Id: faa66a92-cb4c-4c92-c7eb-08db10d30967
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ckBHTbePXlNpqv81e6ctccanV8dGFM58y7PAD5lNQzamaQuVko+thnDqH09dwkepKfCPKEQJkW4tyNWRNpM4xc7h3IM+st53FAtRGfoTDTUQkn74P9IPLcitihWCs2W43UG2OqggaMvPbxthzL3KrkByxsP7MMya+FVuggHMsI8RMEkZlEvgn88nhKUp7i0p0G4i6xpGUL959l9pOKDLmbGxfgCZQ7jOiVQPAEtamTZG+mS/2svnbr730AAkJUGp+RZKIc7ZKtbJvyK5SzFTRCnPDrc6O8csuJ3XGU3aojbNTgvWZgEHEVDwZFEsuOdGJ7XvVv6werl/zzlKUTYENEwZ0GXfTS9OtCV1sw2UHyGnd8S028H9ZEdW/RSMOVArDbN/aS3QUad1Dh99AqxiUFy7S/BlC5PrH/zUoINsONae0sBLX5J8dkzjiepiiD/ItAeW707eDqTS8MIOjsJGpO2xzzW7CdbctLPt31ZSUIn1A0WO2/Qv1aniitPDMIunGcNYLUxyz7mG7fgf3Yj99hGrK0LI2IbkxxN+m2rL3LpBeF7nRRU/213UWbq0zsQ+KfnLXHE2cLtQD7ktOy/mx6mE7tJCqB9ECj0LNN6pXB1NdMvokp8hKWx9/yo4jiQO8PcwziGq2AsdlyaNVL6Pdqzqn2d1lmK8QRatfzxjwSWqqsyCrHmhpsoffJUf+9LP/2+MRiiHjGmvHlpfwUxhHvJ1hMssWIxK3bhnFYpAdAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(41300700001)(6916009)(66476007)(66946007)(8676002)(66556008)(316002)(4326008)(8936002)(5660300002)(6666004)(2616005)(53546011)(6512007)(6506007)(186003)(26005)(478600001)(54906003)(6486002)(966005)(4744005)(36756003)(31696002)(86362001)(2906002)(82960400001)(38100700002)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVOSTNoemZRSEV5WGJjdnF4YlFKdURSWFNZVGxnMTViY1A4T2pVTGwvR0hP?=
 =?utf-8?B?TE53OE1XYWhsdk5Odnd0b2dxbkZzK3ZSY21FOUpTNzBsWFlISkQxV1QrTmxm?=
 =?utf-8?B?aEdxdWhaSGtsZ25zQ2hWSThiRkNlMkxLNURDdUlpTkVhWUFmN28yMk1wb3dz?=
 =?utf-8?B?djdscFhoblpORUU1ankwcHo4QWVVRG8yUkY2Z2NBV204aHkrc0d2NWVkTlc4?=
 =?utf-8?B?T3R3RWlSWVltL1dwd3RTQlNPYzRidTR3OTVWbzAxRXNqYnZHa0YzajdzRGtR?=
 =?utf-8?B?T1NPa3I3VzJHSXhiejUxa2dqS1N0WDUxbkF1MGtFb3ZpM2p1VUtCRERrSHB1?=
 =?utf-8?B?MEFPRUNNYk9OS3d3dzBZaE9VZkp2Vlh6VWo1cS96TXhZRFV0azR5QWNFVlRO?=
 =?utf-8?B?VVpkano4NEVHQW80L290VHRkazdQeVVjcGVvM3BQZTdaZVdBZHhRR2FSUDRo?=
 =?utf-8?B?b1dNOGk1NVFzTWlIS0Q2eUpvVmxjV1BZbytVTzRBWldSb0pWcmJoZjFaVkw4?=
 =?utf-8?B?cXYxc3Z6OFBoY1JkWEJXb3VSZi9DOERsUXoxa0s1OGdLN2JXaGs0QUZKeVdP?=
 =?utf-8?B?YjVMTFJTZHhtYW9SVUM2VjNLMDBQbStLRXdxWEo0cGpTeHFmVm1scUdLTzVh?=
 =?utf-8?B?UVpYYm1BSWJiQVZlakhsSkdIbHhyTWUrL2U5dXRMNDQ5RUY3Q0E0SWlDSlFH?=
 =?utf-8?B?R0diZ3l4YXg2QVdxNVgzaFZFVkhBMi90VEtmVUM3RmszWVRkbGdnZFR4S2M4?=
 =?utf-8?B?WlVZenRIOXZseTJxZ3ZUWTVlZ2pkK3diZUZ6R1pidjEybmpBa2lsL0NtSUlE?=
 =?utf-8?B?ZHppaDdmYWREOTEzZFg3QVVMa2ZiMGVKRmY3cHpRUXhvSi9LR1l2cXBaYlg5?=
 =?utf-8?B?S1RiMEI1Q1kyWEpnWjYxcG8rYysxQnY0UUtOVDNPbXdyUjhqN3AyYXI2V2FN?=
 =?utf-8?B?Q3lqWUEvbkNMN3Y5RXhieTlNOXprNzNKN2wwc3FvWGZuS25ITkhLZXFPMmRk?=
 =?utf-8?B?YVhlQmE1VVVyOGtPZzJjK3NySHF0L2RwNlhIV2hCT3FtU21jZHlydFZWYy9V?=
 =?utf-8?B?ZGdlS0I1S2pOb3FNQUUxRnppNWhuN1JGVTBuTUZObE9aYXBrQ1hwRnZlK1pk?=
 =?utf-8?B?aDJPOWdOQ0ExeXZRRm5YYjVsTEtRcDRtTGZIakxDSmFqb204OG90c3pNbjFD?=
 =?utf-8?B?eTJrY29DRy9YVDBXRWh3cEY1KzNBZ2czSmxMWVVYR3ZzUUFFN1g0TW5wWmhs?=
 =?utf-8?B?TGt4eFRDbWVmNWt4NFBDenRhdlhwZmJtaURycjRJZnpqYXVKWGFGWkxSckVq?=
 =?utf-8?B?UExCdDY1bXlJWllJb25GeWdrUURwYzhHU1N3WkJ0RjZPMlVLZ0c4N0JQdmtC?=
 =?utf-8?B?TkE0YWJPOVorR1lmaEw0YnVJTm5aQWV0R0JUZjM0bytKVDJBVk10bmY5Vm9x?=
 =?utf-8?B?MVAvbXpveGgxUGpFNzdrTCtEd3pnODlLdTZISXhiOW11bjNPVzhlbUdpY0NS?=
 =?utf-8?B?bHpBVTl2aThHeEdVQkk1Q0dvMTV4TGZVZENMN0FXSnNDYm1BL2c0clRxVFNt?=
 =?utf-8?B?dVRHZmxGRHNGRHFlditLVGh2MGdXeVJ6UG9HL2VJWUNTbldnc0RhNzVobG5i?=
 =?utf-8?B?UlJMMWZSV2sxTURjaFpBUXlRRDhlcVJhTTc5YlBNZkRlUm10ZFZyVU9YcDdM?=
 =?utf-8?B?N1MxMUNHTFc3S3hTWDRXMmpTRjBJR1hmd3h3cFdwT0RRS0NCOWhTckYzdHBt?=
 =?utf-8?B?TC80VDR1Qk5zTC83M3JGaTYxd3pxSVMzU2c5dDU1TVZYR1k2eEtjTXNla29Y?=
 =?utf-8?B?MXpOemo4a3NhZnVEWnpNTE96WXRmOHdRUGo1aWdHRlh5enZYUkZMK3FsT1Rp?=
 =?utf-8?B?YWhzVnVxdU5sSlg4M2FBZ0RGU0ZVK0pxU01oeWl0dndkTExrM1hRMVE0Vmt6?=
 =?utf-8?B?aGhPRFh5ZjdOam5XNC9TRTZuWndZYmpjMHhiUFdVZnlQUGg2QStZWWhFTDRn?=
 =?utf-8?B?djVaUVNRYUw4cGtHRWlwYk5hL09pNkRsWXhQc05ES3FIZ3l4NkROMnpQdnhy?=
 =?utf-8?B?S3h4TDFUdnY4MmRENkk2MjlHOVhpN0FDZHI1RSt6aURjSGR6WUR1RDFKb1p6?=
 =?utf-8?B?N0U4UFMrRnhvNHdtak1nK3d3MVdmbmw5NWU4SUg4MmUvVXJ6OGIwOVorME5D?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZwictesZvUdJMCJYDm+GfNTj0Db3es4KtqhoyPjNhOAhtes1SnBg2aEkeDsZWHU0jXFPTFpb+iyJvBsYp5uoToF1XJyZjuJ6pYTTv4IPk2EcFdwjFJPaZliFi+3gVcE/iiuafCAIV7J72u/v9uhNF0hu1+oBxTBDwixF77d39Kw8YvLzyU6vlFIxlygN4BfH2IQw6qV1KOdZ/ou7xmMl0HUbf0ZmPIjpV5K9Nenyg+RxsAtQ+M2MTX5ztW4q96zPH5yxtZmRm1n1GTLiFqhukOvTV0VmopkchxR/6m7MUfdJOu3V45fhd0EK9bw6HLmzbEKBCq5A8w0dMujqur0zS+PxMuwMPTBB27Amdd5MfEw1Dr2Tpbgrju8hJ2TEnT5gj0F2+DzLgpiRXUDdLgi62sMLll/sm5wjOwMqkyZeWMmxKVnutGHBuge4TlNlfk61MU5gGEvVHVxIuIP0QR5FcdX6qAnyT9AZTNe1M0a3ZqDwrcZSM6wivOdQCqkBDgAXYh7DwB+1Btyu4Mr6eRF1miAFdbn/X9QcRQJj3BlleEN6H+q8YafAADxiFtTqEGoZdyfeqMJCsJnGgoXauiMGvcflSwA5DH8ZHCQ22P+dpXhNGDLiOswsj2L1mZ9sdEMQ4lW8my7nmRF3cpMO7jFX5w9qal7m4bpc38LY7dIZj3/M0tCo8ib7j51uA+7bUcxi0GG7Pxi6Jl2EEW54LAxO8K1REKErNWmrTie3VZaEomGbj/QxobtVlAuTHSW9OaOlTefSGviKMh08Su2u2Agq/cRAwOLvSgnIBuivrjuK56a6BoF6UB/NY4njc2ZHfgSuTPQCQ9ut5KGIC3sX0y0gPA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa66a92-cb4c-4c92-c7eb-08db10d30967
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 10:37:58.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hyj+kOAVL3sQCbJsfwbg/dBep9u4g68gY1JytDgzIFkHWCGn3S408u4nwF+7+rMfozGJzJhIsMfRBQ54vmbIWlS8Al0LoBoNuw77Z2qacYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5480

On 17/02/2023 12:19 am, Andrew Cooper wrote:
> https://github.com/llvm/llvm-project/issues/60792
>
> RFC.  I very much dislike this patch, but it does work for me.
>
> Why the parameter name of foo?  Turns out I found a different Clang-IAS
> bug/misfeature when trying to name the parameter uniq.
>
>   In file included from arch/x86/asm-macros.c:3:
>   ./arch/x86/include/asm/spec_ctrl_asm.h:139:5: error: \u used with no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
>   .L\@\uniq\()fill_rsb_loop:
>       ^
>
> It appears you can't have any macro parameters beginning with a u.

It's worth saying that I can't repro this in more simple setups, so it
likely specific to some of the gymnastics we do in asm-macros.c

Also, I was hoping to try and sort out the macro such that it had

.macro ... uniq=\@

reducing the internal complexity, but I couldn't find any form of that
that GAS was happy with.  Suggestions welcome.

~Andrew

