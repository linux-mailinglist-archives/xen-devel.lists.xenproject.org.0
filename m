Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B677C3CE4F
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 18:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157215.1486100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3y0-0001p8-0m; Thu, 06 Nov 2025 17:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157215.1486100; Thu, 06 Nov 2025 17:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3xz-0001mv-Tp; Thu, 06 Nov 2025 17:40:11 +0000
Received: by outflank-mailman (input) for mailman id 1157215;
 Thu, 06 Nov 2025 17:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oVY=5O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vH3xy-0001mn-8u
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 17:40:10 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a34dde8f-bb37-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 18:40:08 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM7PR03MB6467.eurprd03.prod.outlook.com (2603:10a6:20b:1bb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:40:05 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 17:40:04 +0000
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
X-Inumbo-ID: a34dde8f-bb37-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKUO/woZbew5nZKYwjogJ3CImFEfLvCE4NNFiygZ1zeAhFQnYghk4pScRvq0/yp+4rE3YwmqpeFTwap52vq4KTUSYsCdA8/lOazCy8NO0Y791P/Yxf3zfM8zSprHEKLsO0KzXoeJ9L1nCoMmvqYZsCZvX9YbfOpsaZWENsRF1ggjyWyeYRnxUKa3UNqyivua6odYFvt/j4JyzNPLPEUWsp4HCvp5cqLfwKyZdZ+mZiZoKacOwK7veB7eEOD0B8NIluWArfSfLyVmxRChHzF3TRSJ8yyIUQURo/KNIHvekGtA1lM7H4xXYWpVdlwkHNa/CN3ydpf/V//JEvCZyoTc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTQ2226jWisS5m7AmTVSJ+r9i8KqXvixAE71IYtDgAE=;
 b=uXfBnMf2BKpk/11RF69Qp/4EIIK+bC00UZpBfcKqYTOtkpmDRt4MGJXeKnBlCzAAq9IoxA4MP2XR8eL7AFwnTimoj0R4Wc8/K22XrO7EsWcyUpybqnmflMlwVmgjBDHTXtFlg/dhGKUBoAV6oU8YsobP1pYtMq6O1bfuRqfwx4QO5y/SEbeqDA7SDXAldx7V+HZlhqVdbw8aOVH2C3sdSf6TVaYAz08LDBfoYcxnky/f6/kIwlPDEUquaEHfLzpuvwko813LSNQ6+8qooGoLlTld90F0F4eKFhkjL0VI4yxO5O46WIlohBWYvnNfyy+PM896GyUyT/3tHt8+stRK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTQ2226jWisS5m7AmTVSJ+r9i8KqXvixAE71IYtDgAE=;
 b=DJCWbGXDVRe5+R4sH4RjXw4ZhwoP+gTlgPOwTDp/BBn0jTN1XUOUxlhr4aUeon+fEPFkoX43vXttrsxuOtAOO8dH+p9nwi5OvySzjcvQohafnR4dMyX26o/PbJQx3srBy9T1GjJqlRNBaIFZtAq1yB3QEVHMu3pk86c3k6VCViTMKJnIYAPmmqG2OULdgeMesaatzKxIp4tVaeDUn+PmnTDJEUVDn0ndS6ZWxzlt/W85fAg1UNNlXrvbQQfXbJ/ob97gLNSN1y3XpT58oRoaknqCyN/F6zSQOdsYLqR0Z1N41SLF1bOKHyavLfKq9NhG+EoMPFSQvC7tLuYgp9OnvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <01ad9a85-ff61-445c-97d4-076f9a81b649@epam.com>
Date: Thu, 6 Nov 2025 19:40:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20251031212058.1338332-1-grygorii_strashko@epam.com>
 <434d9ce4-e5e1-453d-84b7-e21e66d0c5a3@vates.tech>
 <b012c6c3-fb8d-4336-922f-f40bc43eb2b5@epam.com>
 <0217b1ff-2c33-43ae-adbc-d665c881473d@amd.com>
 <ffb2ad53-c150-44e3-a0b8-7ed3473886f6@vates.tech>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <ffb2ad53-c150-44e3-a0b8-7ed3473886f6@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM7PR03MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 04218e34-4ed2-4e34-fb20-08de1d5b8537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGJIUUs5N2V0bEZDV09jSTUycFZyZm9TUG1oWStQZzV1dnJXRkVxTGZpeCtl?=
 =?utf-8?B?L1VYNXVlMUluSFN5QzdyamhoNWxXd0dJOGN2NURLZ3RVMk9welRtM0V1REk5?=
 =?utf-8?B?OVkwTmU0MHdhTGFQb3Vuc2l3QzlHd2xlQTZLd0dGaGJvb0xVbTYrT0p3ZHlR?=
 =?utf-8?B?cnM0N0FNM2xSVzg4aXF3UERNNis3aVlWVVp4SmJHQVM0ZUNKdlBhdjgrWTRz?=
 =?utf-8?B?c2dUQUJjMHJDNlFyUU9HdFEvMUkwWVh3L1ZaTTJ1b212UVMxN3loNnplODFn?=
 =?utf-8?B?UXIxc1RzSVlOUWxXYzd2SjJSM25IaWxzdUZkNExTa0wwQzE4ZEx2cWNxUjk5?=
 =?utf-8?B?Vm9ONlorM0E1UWJ0cXVqTllhSS93blFrL0hWUkhPcjFTTHZSYTgzTjhxZlYx?=
 =?utf-8?B?TnRuSUVqMytLYzhMeHRCSzRwTkYrelB5eU9sSmN4TnM2Y3ZNUC94RW5POXph?=
 =?utf-8?B?K0FsaVFjSHIxTU5URlZRTjFZcXZUNDVwQkFsa2Rrc0FrbS9DZDNKVXdJN2Fu?=
 =?utf-8?B?NVJvaG01OXNDbE0xSnVoT0pIQzdiUU9Qa3R4aUJsVlZ2OW1GajMwbzhveGNh?=
 =?utf-8?B?SkRORXhvZ1orRFRuMk9ReXF2TFI2ZWVreThDaXpTSlpxc21sT3dOUUhLMkpK?=
 =?utf-8?B?emhXbFlLcDU0WWZSK2pKTmNpK29GS04zSG13VDFncEJPclIxMGtKVC9SYWl0?=
 =?utf-8?B?S1pjTVhOMThOQnJPQkM0UFJNSlVXeHB6ekQxWGtYQlVOQWJLS054Q0NGL3VE?=
 =?utf-8?B?Y1RtYlkrN0dVRGxidjQ0b1FxOVcvTVY1dU9RaHJ3aURpM0FDTXVxenpCcGI3?=
 =?utf-8?B?bXdvNC9TdGM5SkdzS2lpdXY4c1ZSTThjR0FPVXdZVHoxdVk4eTVrZFRXV1R3?=
 =?utf-8?B?TlRHSDBlbTR5S0ZGb2wzcEgrbEl2SEdsYnBEYVR0Wi9qMk1KV1RQMmlQZTd5?=
 =?utf-8?B?SGpIVkxwNUhkQXIycjdxQkFKNXMySWs5elZzYnc5WDZaM09SOE8xWkUrSHJH?=
 =?utf-8?B?ZCt3Vjg3MStacEUxK2ZyQkF1ZlZJVW9iOGpHZW9hZ3ZkQ25qbEtuMHcxeWdt?=
 =?utf-8?B?WlVGRDQ3ZlcwZjZHOXVmS2VhTkhTWXA3V3hPdndRU3h0MU01UDA3VUFIZStI?=
 =?utf-8?B?Y3E3VUl0ZTl3RlppcUdoQUJkNCt3bzNPZWQ4MjQxVmdILy94RlJTaHRrQmlB?=
 =?utf-8?B?MXI5Rlh6UjNTbHlXcFF2L2FlbmRwYVBEd0N4cUpKNDJ4OGVYRnF6eG1WZXlz?=
 =?utf-8?B?OWRsdFZqNERLa1kyblFTZ0c4bVYvUjFaWWZSSGxaNVI2M3RMSXFvYlZjZWNh?=
 =?utf-8?B?Qk50Q3VYaDJ5dHBtMUhpaG41ZTFkWDVlRFhSa1RxNGlnRGFSbE03dW8rZHlh?=
 =?utf-8?B?czVIejk0ODI1OG1aenlwSGN6TXZpOGtJTTVud3BpdjNqalNKM0lNZzRwNjBx?=
 =?utf-8?B?VWo2bHFzK1AzcGtCUndhbXQraUVyMXlyN1A0ZkttSmt4QjE2ZU5GWUFncHRQ?=
 =?utf-8?B?QWJsY1pabFZFdU5lUUR2UlZheVU4dER0bm5KQzZ2SGhlcmlUNmowb09DakNt?=
 =?utf-8?B?ZzR2c25LUFM1eEJrODBPNzJCWVdkeldaNC9aUHhWRkxXamM2UCsvU0svZjVa?=
 =?utf-8?B?S3hPbG9sZWs0NlVtL0FFMWtLY1ZMVk5sRmZIOU1zdmVXZVlydDZ6eE50NzJT?=
 =?utf-8?B?eXNyOUtKZTlYYitQL0g2M3BrSUdQdlFWWm5VS1FKK2IrNGpSd1haYkVkNHRk?=
 =?utf-8?B?RzhqMjRjMkhtQTA2VjRuUkJxcnYzZVo0Q0NBRXAydzI5UENndnpQRXBHcWNt?=
 =?utf-8?B?Z3RyUVNMSUpTQVJkamd1Z3JOcUhUUnY3L2EvSm4vYmtId0pheU9MVW5COGpu?=
 =?utf-8?B?ZHFTbmZXYmRwU1p3dmdhei9rZFhuRUdsMTlVZTBnVXg0RGdmcC9QM1MvMkZH?=
 =?utf-8?Q?XgDQ3o3rPB545q6iI2fMkbI/VVOOghji?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFArWlBYaUwyM2ROMlZSc1FjOHhFL3o4MXlWSzNCVW1idUVBMkpCU2pKOTBF?=
 =?utf-8?B?UXM0WnJLU0F6a2hZSk9YdTd4b21uQThaL0FFNW5FRFMzYmhXT0JOZHZZeGlm?=
 =?utf-8?B?UVRYMWMxOG5wRzEwM0RxcThFRDd6NmNRZE1zK0RZOHZMTkdSSmFqS0wvWHFl?=
 =?utf-8?B?ZWxvUjNvWjJoRmg2NkNQeHJDZmhOWkJrVU9Cb01YSXVFTHZuV2h5ek5KY1M0?=
 =?utf-8?B?b0Rma2NlZmZNRW5EREt6bHkzclhiZmVnU21ZZUROZmt4SWJrWTlTSkgwMHln?=
 =?utf-8?B?UGt4ZnkrY0xSS3ZvSmtVaUdwNFFvWnd4RE5sem1yY1NycVJ0U01lVTdYVXUr?=
 =?utf-8?B?dml0YXFEc2dEZjZ1WTltOVZZR0JkR2hhdHp4NlB3R2FGSTFtWi93cmdCOGh6?=
 =?utf-8?B?MVJKOVJMQVJyVktkajYxUVdlM3oySUs2NVBrR1BtUnZ2Uis2TTdYbzZGRVlZ?=
 =?utf-8?B?OFJzS2Z5Q3VsdDhRSVphbkZ6S29YQlQxazNQSXQxeFF6TmFLN0JNVE8wYnZV?=
 =?utf-8?B?WCswczZTZ3VRcU12UHoxeGtqT0hkZFcxa3REMU5PMkp0Mnc0M2N1N3BIYW1N?=
 =?utf-8?B?UXlib1lWRXFkeXN1MGNiRnBjek5kbFppUFZ4RVkyRlg1WmRtR05PSyt1T0hG?=
 =?utf-8?B?aVBLNGV3MlZYckZiaDFLaHUrZ2F6VGFObXU5YWdoRGQ4RjIrT3A4SmhwMlJv?=
 =?utf-8?B?Wi82NVAwSFBIdWZjcWFDQ3JmZG9FZXJURWpQRnlmQldtSkxaU1RBUlBjbXdZ?=
 =?utf-8?B?SU5ZM2x3S1VJUm5uNDYrR2RGUSsycTJadkFLTkg3N0dJc2UwM3BIZkwwRDE3?=
 =?utf-8?B?NkMrTVRWWWVaVk5QUFgyM0lFeEVpNkcvazBmNFh2VzlmMTFQcG9KdGdHUmpt?=
 =?utf-8?B?Y3lnN3BnZ3NaT3VKM1JTcXZNRjNPRXZSdGJmMytNb1ZxZEh2TEdoUFBFZEFw?=
 =?utf-8?B?NWJyR2Y2M0FrMlZnS21LeEtXT1Jlck9DRndLM1FjUHp5VFp0Z1JXb2JQdHdm?=
 =?utf-8?B?VUIya3BlOEp3Y3MyekNualVtUU9rRm1qUHlXWWtUWWVYaWUzVVczTjJkbklr?=
 =?utf-8?B?bjlzR1NLc21yc3R2VUlBdTBNcm1GbXRoYWZuWmQxVlMvTzhVR0VFZjd6V1Rz?=
 =?utf-8?B?ejZHRlI0Mm1jbXI1Rm5hSjBieEQwcWtRVjRNNm1URXZwZTNBM2dPL2FlTjdl?=
 =?utf-8?B?Mk9qeDhGd0RDMHpkVTcvQU1Ob1d6RWtQeW82NGJ6ZEdOdlgxNStHMkNqdEFT?=
 =?utf-8?B?dkJVNlZReFRxaGV0RS9xcDk4TENDcndRbzhYYVk3dnBWQTd1aml0RTR0S0Zs?=
 =?utf-8?B?amlWeW5sTXhxSHVZWFQvNEx3bjBINnZCTlQybk43SDVIYzFreC9vSEFBWVJz?=
 =?utf-8?B?YlpScjJoby82V21xbW1iaEp0MUZoS2o2d3BHbUZKU05hL2xyQnFoR3BIOFZP?=
 =?utf-8?B?SURnNzhmTWVXdU1MRzJ5emJja2t4TkQxcE8vdkxyYi9RUnpZOGZGU2hlWGtY?=
 =?utf-8?B?cHBLRVUrSCsvQmVRT3VuQmpnSlFFaTJ2OGI4d2FBQmZjV2lublk5N0FJbEd3?=
 =?utf-8?B?eS9QOGZtSjFubnNhV3RJVlpkaFhlMkNNK1JPc0tPRzM5VjVuODlad2RPdFht?=
 =?utf-8?B?UVZmRWVpc3B4RUJ5QVRWcngxMHlDNWx3N1N3UHNQU2p2Y2xWVGtncitoTmlW?=
 =?utf-8?B?VXV2SU5PaUh2c1d1My9IR0RvUXpRYTFRaGtOaU9LdXRtK2JrdGZsZzc2R3pz?=
 =?utf-8?B?bTBJb29HZnh4ZTRhUWg3aEkxN2NMa3QrRGs1TTlCYkpLWWI2c0p6QS95RURJ?=
 =?utf-8?B?UGFVeGtoTVFsbkh4enZGRFJnSzlYdUMzVlZtalhlYUxKcFpuRU45cVNualk2?=
 =?utf-8?B?b2NnUTFkYW0veUZxNnY3OVg1SjlZVktyV0NvU1BncGZGOFhWK2x4d0ZKTTc4?=
 =?utf-8?B?cTZCU1c4QThlYmkvbWhSTHZOM1Y3ZlAyMHRCV09ZOTFGYXgweEFoWE9Xd0ta?=
 =?utf-8?B?RnV0TXdxV2p3WHN2ZkFNWERvNkVwMXl6bzhkMFp2MFdrODZ1eGpDYkt2dlJl?=
 =?utf-8?B?cHMrcjc3THBlaGxiV0hmTHEwTVNIZWFnVCt0Rk1uQkIrZWZzZkdYNy9ZVlFr?=
 =?utf-8?B?U1VGZlNqbFUxWGFGOGVqSVNLbkV6K2dVdU5aemRvRU5ITm1EM0RGQU5MMno1?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04218e34-4ed2-4e34-fb20-08de1d5b8537
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:40:04.9441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fE7is13DFAg3HkXDbsTGlM3MFc0o6AtA9Fk5RTD2/XQskPorn91I5iU8wRODE2RKvkyuuikHiCjc86M6gausFb15uinfbxS7UvnYgbNFanI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6467



On 06.11.25 19:27, Teddy Astie wrote:
> Le 06/11/2025 à 18:00, Jason Andryuk a écrit :
>> On 2025-11-06 11:33, Grygorii Strashko wrote:
>>> Hi Teddy, Jan,
>>>
>>> On 06.11.25 17:57, Teddy Astie wrote:
>>>> Le 31/10/2025 à 22:25, Grygorii Strashko a écrit :
>>> Can try.
>>
>> Yes, I was thinking something like Teddy suggested:
>>
>> #define raw_copy_to_guest(dst, src, len)        \
>>           (is_hvm_vcpu(current) ? copy_to_user_hvm(dst, src, len) :
>>            is_pv_vcpu(current) ? copy_to_guest_pv(dst, src, len) :
>>            fail_copy(dst, src, len))
>>
>> But that made the think the is_{hvm,pv}_{vcpu,domain}() could be
>> optimized for when only 1 of HVM or PV is enabled.
>>
>> Regards,
>> Jason
>>
>> xen: Optimize is_hvm/pv_domain() for single domain type
>>
>> is_hvm_domain() and is_pv_domain() hardcode the false conditions for
>> HVM=n and PV=n, but they still leave the XEN_DOMCTL_CDF_hvm flag
>> checking.  When only one of PV or HVM is set, the result can be hard
>> coded since the other is impossible.  Notably, this removes the
>> evaluate_nospec() lfences.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> Untested.
>>
>> HVM=y PV=n bloat-o-meter:
>>
>> add/remove: 3/6 grow/shrink: 19/212 up/down: 3060/-60349 (-57289)
>>
>> Full bloat-o-meter below.
>> ---
>>    xen/include/xen/sched.h | 18 ++++++++++++++----
>>    1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index f680fb4fa1..12f10d9cc8 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1176,8 +1176,13 @@ static always_inline bool
>> is_hypercall_target(const struct domain *d)
>>
>>    static always_inline bool is_pv_domain(const struct domain *d)
>>    {
>> -    return IS_ENABLED(CONFIG_PV) &&
>> -        evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>> +    if ( !IS_ENABLED(CONFIG_PV) )
>> +        return false;
>> +
>> +    if ( IS_ENABLED(CONFIG_HVM) )
>> +        return evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>> +
>> +    return true;
>>    }
>>
>>    static always_inline bool is_pv_vcpu(const struct vcpu *v)
>> @@ -1218,8 +1223,13 @@ static always_inline bool is_pv_64bit_vcpu(const
>> struct vcpu *v)
>>
>>    static always_inline bool is_hvm_domain(const struct domain *d)
>>    {
>> -    return IS_ENABLED(CONFIG_HVM) &&
>> -        evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
>> +    if ( !IS_ENABLED(CONFIG_HVM) )
>> +        return false;
>> +
>> +    if ( IS_ENABLED(CONFIG_PV) )
>> +        return evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
>> +
>> +    return true;
>>    }
>>
>>    static always_inline bool is_hvm_vcpu(const struct vcpu *v)
> 
> While I like the idea, it may slightly impact some logic as special
> domains (dom_xen and dom_io) are now considered HVM domains (when !PV &&
> HVM) instead of "neither PV nor HVM".
> We want at least to make sure we're not silently breaking something
> elsewhere.

first of all idle domain - I've tried to constify is_hvm_domain() and even made it work,
but diff is very fragile.

Diff below - just FYI.

-- 
Best regards,
-grygorii

Author: Grygorii Strashko <grygorii_strashko@epam.com>
Date:   Fri Oct 17 17:21:29 2025 +0300

     HACK: hvm only
     
     Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d65c2bd3661f..2ea3d81670de 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -567,17 +567,17 @@ int arch_vcpu_create(struct vcpu *v)
  
      spin_lock_init(&v->arch.vpmu.vpmu_lock);
  
-    if ( is_hvm_domain(d) )
-        rc = hvm_vcpu_initialise(v);
-    else if ( !is_idle_domain(d) )
-        rc = pv_vcpu_initialise(v);
-    else
+    if ( is_idle_domain(d) )
      {
          /* Idle domain */
          v->arch.cr3 = __pa(idle_pg_table);
          rc = 0;
          v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
      }
+    else if ( is_hvm_domain(d) )
+        rc = hvm_vcpu_initialise(v);
+    else
+        rc = pv_vcpu_initialise(v);
  
      if ( rc )
          goto fail;
@@ -2123,7 +2123,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
      vpmu_switch_from(prev);
      np2m_schedule(NP2M_SCHEDLE_OUT);
  
-    if ( is_hvm_domain(prevd) && !list_empty(&prev->arch.hvm.tm_list) )
+    if ( !is_idle_domain(prevd) && is_hvm_domain(prevd) && !list_empty(&prev->arch.hvm.tm_list) )
          pt_save_timer(prev);
  
      local_irq_disable();
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 79c5bcbb3a24..533ad71d1018 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -126,4 +126,8 @@ config VHPET
  
        If unsure, say Y.
  
+config HVM_ONLY
+    bool "Only HVM/PVH"
+    default y
+
  endif
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 839d3ff91b5a..e3c9b4ffba52 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -236,7 +236,7 @@ static void cf_check vmcb_dump(unsigned char ch)
  
      for_each_domain ( d )
      {
-        if ( !is_hvm_domain(d) )
+        if ( is_idle_domain(d) || !is_hvm_domain(d) )
              continue;
          printk("\n>>> Domain %d <<<\n", d->domain_id);
          for_each_vcpu ( d, v )
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index e126fda26760..c53269b3c06d 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -34,7 +34,7 @@ static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
      p2m->default_access = p2m_access_rwx;
      p2m->p2m_class = p2m_host;
  
-    if ( !is_hvm_domain(d) )
+    if ( is_idle_domain(d) || !is_hvm_domain(d) )
          return 0;
  
      p2m_pod_init(p2m);
@@ -113,7 +113,7 @@ int p2m_init(struct domain *d)
      int rc;
  
      rc = p2m_init_hostp2m(d);
-    if ( rc || !is_hvm_domain(d) )
+    if ( rc || is_idle_domain(d) || !is_hvm_domain(d) )
          return rc;
  
      /*
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 05633fe2ac88..4e62d98861fe 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1425,7 +1425,7 @@ bool p2m_pod_active(const struct domain *d)
      struct p2m_domain *p2m;
      bool res;
  
-    if ( !is_hvm_domain(d) )
+    if ( is_idle_domain(d) || !is_hvm_domain(d) )
          return false;
  
      p2m = p2m_get_hostp2m(d);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ccf8563e5a64..e1862c5085f5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2158,7 +2158,7 @@ static int __hwdom_init cf_check io_bitmap_cb(
  
  void __hwdom_init setup_io_bitmap(struct domain *d)
  {
-    if ( !is_hvm_domain(d) )
+    if ( is_idle_domain(d) || !is_hvm_domain(d) )
          return;
  
      bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3764b58c9ccf..b1fb67b35d0f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1214,8 +1214,8 @@ static always_inline bool is_pv_64bit_vcpu(const struct vcpu *v)
  
  static always_inline bool is_hvm_domain(const struct domain *d)
  {
-    return IS_ENABLED(CONFIG_HVM) &&
-        evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
+    return IS_ENABLED(CONFIG_HVM_ONLY) || (IS_ENABLED(CONFIG_HVM) &&
+        evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm));
  }
  
  static always_inline bool is_hvm_vcpu(const struct vcpu *v)



