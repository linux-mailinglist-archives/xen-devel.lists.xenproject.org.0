Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE9C9229E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 14:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174859.1499796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyj8-0005R3-6N; Fri, 28 Nov 2025 13:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174859.1499796; Fri, 28 Nov 2025 13:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyj8-0005Ob-3b; Fri, 28 Nov 2025 13:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1174859;
 Fri, 28 Nov 2025 13:41:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqkP=6E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOyj5-0005OT-WD
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 13:41:32 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f24cec9c-cc5f-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 14:41:30 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS2PR03MB9929.eurprd03.prod.outlook.com (2603:10a6:20b:646::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 13:41:27 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 13:41:27 +0000
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
X-Inumbo-ID: f24cec9c-cc5f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQqGlSOeYDNuLoNmVjqPdlZz4W1ud/lC+GW6S9Xj1cXBEYoTNZFL6htHZPJDlnngRY8HOOi8zisM162dL4bsZ6eZB13/J75klNoAE2HyZpQ9nF84PMyouc1zUdHs+gqEoaGniReOmTb7wZnAPAJiULyQKD+rriHuyRaTzx4UWo6ZTqAj7kxeAmBMIez5eoVV0MEdWkGl2LlBpmdm8W68WTDDbDv8i4SxqTOCA0ra3ONhmZT3eS/ccJxb1mkZS4ImcD/kdrgMmiDWXc6ap2Z1RKTS/4+vDVEtxgqNytAQ//Wr5jKkAUzS5x/cziLbKPiei38r+2AuImlYNmybsQfzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzoxoM9J6gp4BN/3M8GU7oAmfY6x/NtL+3wFAeqvHDE=;
 b=qYlMhE4Kl8AXD4PNQJRLGoaSmq73P5X28JWPgyd6DgjmMu2VdIe6bW8PmA3NmnCWu2oZLEQVlk05AcG5SXNfNqHdoIYvkyfn3cU+Ve83JrmX8AUVOXT4lHEMBaEL3wx7n54+TXwbPGALpsE0Qghx0L61enmFIrsJDE+1E3+shxHhO5xKggevyRHHhE+rQwXa6doYfaBqxpVD1PadzxeJ73I1kzT8dAlQlf7HIlhTCC642VD/4nSA1fHC1jA7Gz75oAVsClh7ls01/lnCJlAIjJf/BmO1X4xNQO+CRqGGQjl1rrnRZTVxGcx2jJwQ6dCAm3VmzGR3KWfRsxxG/Ivjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzoxoM9J6gp4BN/3M8GU7oAmfY6x/NtL+3wFAeqvHDE=;
 b=OH/dZlkLWyQP3ZhH/YKoD+r/xaVSw34fCNj8gFik2ZbHLH6riLuiqfMvCPakFQbF9Rs40z4cBnDsok6bCx/LU35r2PJUcIOH6DHJD+O1664P/NkTH7IOX7cftWwQpAwinMiqUoydC3DYVsP9jtHR8Gtw3Bwkuf2nerPtFm3Ewoq+i5D1zdrjoww6wOhG0BuUabF6S3LxoSvX0kMivoZgUHS/e+puY6o+PP79SvtpWUfNEh3Od9W1woUNO+UHope5kMEGyRw3DJWBRUoU7LH3ABMCyVPKHjCy9Sn2GsG/3FCzRCtBqxmaQ2ZSKAGyE5FwXPQjQWUsb1shLPCIf4RS6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0e355293-a4f9-4474-aea3-e9575cfd209f@epam.com>
Date: Fri, 28 Nov 2025 15:41:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <0a66c71356e8d6ea788022438d7a73dbff8aa5b9.1764243466.git.oleksii.kurochko@gmail.com>
 <fbb420d8-499a-48f9-91d0-06469f265ff7@epam.com>
 <467b9a77-6e90-4877-be8f-59deb72d1827@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <467b9a77-6e90-4877-be8f-59deb72d1827@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::11) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|AS2PR03MB9929:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acde34d-cb41-4bd2-22cd-08de2e83d43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUR5NitjSEx1YUNqUkFWWEJzUkRtdlprR1YvSjl1dm94VXRWT1VsTmYvY3k4?=
 =?utf-8?B?WXFtTlpwNXZKOHozeUcyRFZVNnJqNlpoT1YzVzVJK3QzQTFqM0ZUcFMxZUd6?=
 =?utf-8?B?N0ZUMW9uUXBLcm9jZTFvZW9OYmxabVlOMGw4eFJvTmxieHVOMnJJQWh2NCt1?=
 =?utf-8?B?S0F2cTByZU9VQWk5Uko0VVM4dkFhZ1JlMDlteHplQzZoeXU5WXgyQ0pYcUww?=
 =?utf-8?B?QVhsWm8rRlN2TG9tL3BkZVBZRWJsbFJvdGYwNWZ6blc1U0MzQmcrOXNWZXJP?=
 =?utf-8?B?amR3MFRENmZlRm5lelhZTytZKzBpNVJLbW1MMldMa1VmaUM3VFJkRzBhci9w?=
 =?utf-8?B?NTN5RkNwNVhjanN3NFRpdWRYTllYalRyRTRCcjJCb3Z3TUtWWGQxYVBZaVVi?=
 =?utf-8?B?VDIwZ3FCVW5UbC8raXd6NkhtQ0ZxSlQ3aHJFQnJicWhDRVMwdmRlbkdBQk5m?=
 =?utf-8?B?SXpNSkJRY1ZxRU9vYzhYSnBhalBacXA1c2JhMGsxd3h5K05ZKzZzUjVZSlVJ?=
 =?utf-8?B?dDc4SWwyOFVRMzM2M0xhR21LSlNZbm9yNlRYK0dtVnI2NTZXZiszTTdBdnQv?=
 =?utf-8?B?eVJxVkUyUC9VdjIwbWlZcFJpZ1hPbThJWlFsL0ZWREs1VE9FTXllUk1RSGJx?=
 =?utf-8?B?V3pnSEhacXhzRWYvc1F3TTJsZFkrTnMzQWZRN29wVHlJQndlSmdiL2dlR3U3?=
 =?utf-8?B?YXFid1cvUzg3aVpkZGsrZFkzeGhjSkFVZ0dGWStDdnRZd28yd3hSVjFENzNk?=
 =?utf-8?B?eFg0bko2RC85T25hdWVSOGVVZVZxdHZiaUxDaWhxSWV5ZTdrQ3ZCalBlTkdQ?=
 =?utf-8?B?VU1BYytnZ3lZTis1TXBNcHlHZWN4cU0xMEN6LytKMzdJbFlpbWhVOUoxVzE3?=
 =?utf-8?B?MFNQVVgxbVByNU9ZK3gydTJwemlTS3RaYlRWTHduN1FhMUVCcEZtNURSWmpk?=
 =?utf-8?B?d0xJT1k4alNmb1ZLcjNOTFFBM3RlRFRVanR6dmlsbFBkR213aDVIeGlENnlG?=
 =?utf-8?B?Y0dNSlgwaDgrS3BGUXVrMGdZZGlFdytDekRJKzVXTm4rL3pIR1hoQTZFOS80?=
 =?utf-8?B?RzhJcEY5L3BmZWRpK0x4cFVzMFZRZlQ3V1lZOGkzaml2Kzg0eHRaeG9idmxK?=
 =?utf-8?B?M0hKL3hIYk53eUYwWXpkQ09sR3hCOHlFTkNNbnpTZ0VROS8xaDFwNERodkEy?=
 =?utf-8?B?ZFVRQVJUOUVMWkJsU0RSeEY5Q0VDTjVoeFV5YzlSWTFIS2U5WVk1UWl1UzFU?=
 =?utf-8?B?cnhqME85bXlDZzUzbmxsdUN2RGNYZnRudmtDUjg5SXhUZUNic09jZEo4TXNZ?=
 =?utf-8?B?RW5MRmdjUDdkQTNzV3E5ZFZod0JXVEIvUi9TSlpMUlJZZjVSdW8rRndkOXhh?=
 =?utf-8?B?KzN2d1dMVFpScUJQOHdNVFJFdFNBT0lnN0dzMUUzRWsranlweEl4QnByQXp6?=
 =?utf-8?B?WngvYlBqT293eGl6WVVSTEQxWVViWlVZRUZjcExPTU8xWlVFMDhtT2NRRjln?=
 =?utf-8?B?WGt2L25wMW1vL2pvYmpaZGJFSTFKb3NVQW5lQkFRSkFMbXVDL3Q2V0pBbmVG?=
 =?utf-8?B?M2JOMjhqeVdMUVNkbGZmTDZvUThJUitZbkhCNE5sUllYSFdPbi9RZU1FUUU4?=
 =?utf-8?B?Uk9RaE4xRjhuYXFBRTJpeHdtWTI1QWhiUnBCdm8vTW1iS0JBQ2MxU3U3Zjk1?=
 =?utf-8?B?cm5WRytjSllJUjVYd250RFI2dWlIbVFicks5RkVtY284aDZVNU5DcERyNzBl?=
 =?utf-8?B?QysxcHVob28zWWp6Y2lvTklTQXBweXRodC9TSjdFdEVmVW5RcGhoR2ozTEx6?=
 =?utf-8?B?bnhlOGFOMUJZZmFWVUdmdTFENFZyczJtUlAyVGxNZ2ZlbDlJYzVPY3czQ1J0?=
 =?utf-8?B?a1pEd0QzTTFDcGFuZEhVLyttbk91aW1rcm9PUWFGUUYza1l2QjRheXgvNnZK?=
 =?utf-8?Q?1fleZgHXC6gkIgGGRMaQhAjY3eevy4kI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFlNUmFYU0dCSk9kSURtMWFqWUdkQlFCVjNrWHAraERVRzVGcFRNS2xXZWNn?=
 =?utf-8?B?UzVvU2M0SnU0SXRTUm8zVURvOU85WFpGQW9KaVkvSHNZTGFBdlgvWTRwVFE0?=
 =?utf-8?B?Yzl6V2s5Y0pyN00xMENJSkxEQVFOdWpDMzJIOE5MakExRDlXSVZSVjA5eGc2?=
 =?utf-8?B?d2xzK0lWRlRHblZkbkFCenRvcnUrb3A0Z25YcFJIRDdMc1lFWjBqUWhUQkZF?=
 =?utf-8?B?a3I2ejZYaGhvU0RxUHBaVEZaWnRyMXlveGZtVVJxcEwyY01MMXNaNFJtY3NY?=
 =?utf-8?B?QVo3V2VXdjlXYVhWMHNKR1pYUUw5VEg2bThKcGlXSWMrT3pzeWluM0JJckV2?=
 =?utf-8?B?SmllN1lNOU1KbUdPcW81eHI0dXRFT3pkZnpZTE1hMWtuZ3BuYVF5SXNhRzlE?=
 =?utf-8?B?U3dnTS9yM240eDBPeFlaOEp4UGhpeEFRWkFwK3VnNk5RVnU3WWQ4MlJqV3Rh?=
 =?utf-8?B?ZHB0eUQ4RU92blBPc0pVNk5tL3IzM1RhV2haK0lZMkhNZXU2WGVONGtncTJO?=
 =?utf-8?B?Qm9OeW1mYjNtcmxqRVIyYUkzWUNMT3hYV2N2MFNEQ0ozUW9ISUw4dXE2dHJw?=
 =?utf-8?B?Q0QxZHJhdXNlVVAyVnBONzZocW9PM2xGOXQ3MTMxZTNMeUpiQkd2OFdiRUQw?=
 =?utf-8?B?S2p1b3FjMW9DUTNUcHRZTys5OXNEaHRkaHU4cExnL0lKZTNSMjg5c05NZUJK?=
 =?utf-8?B?b1RBL1pMZjBzeTd6aUVublFaL3IwTE11S2srZU1sOC9vd2YzMUg3SGFKRUFV?=
 =?utf-8?B?S0lOT3JNNEJkMkxJNHZBKzlBcEZCSzhsNk5WaG5JWjBmMG16NjdUSGZoSHZW?=
 =?utf-8?B?bjFUT2twY0s4cWRXLzU3a3BsSG9OVzdIRlhQUEhuQ3R1QnFzZThoRUhXeGIz?=
 =?utf-8?B?dGRFMzJTS1ZhWlJWZVJQTk1MSVRQUHlXZjlhZG43eUNaWjdVU0JEYW8xb0ti?=
 =?utf-8?B?alZCVFE2ZDl4dDBjdTZWMTdZQVNVUEpmMktOajBkRkNXaEZaa0RPOW1EaXNX?=
 =?utf-8?B?TTg3R3pSNHZZM2NrOEdPa2lrOVZJTkk4MEpIMGMwNThKdkFuVWkwa3laOC9Z?=
 =?utf-8?B?YkI1Q3o4cFdLOUFRckgwYUg2RlQrNlkxcTJ4S2R2QkIxMFVTMTJZMjJ5SWxl?=
 =?utf-8?B?KzVtMlRLSFlOd2xTRzNTZWNIdjNISXBza2JRVW1ySENSUmlBSEJGa1lzRGM4?=
 =?utf-8?B?Zkd2UW94SkdEWmJnQVRVZzdqUDN3bWJSVk1TN1czUXFmdE1IWGlDdUErWXpE?=
 =?utf-8?B?cURsaWRBeUlkQWN0WW5DWUVpVjFFZFl6b2pZSTF3a1pUSzZrdjF5ZXo1MWE4?=
 =?utf-8?B?QW5hWWRtV1pNMHlDZjEvMHIwbXNBZitZVTJHalQxR1hYbkVBMmc5SkFDeXVS?=
 =?utf-8?B?NWtaY2lRcXRML3VnRkl5eDlJSkVIZ0t1VlQ4bFRNV2xJWHdkWHdZeVpNdTBr?=
 =?utf-8?B?SWVyUmcrTHFZU3lsMFNuVVIwRjFWR3Z3VERLVVNVWTNQNHZmT1Exb3lmazkx?=
 =?utf-8?B?VS9MUVEyMEswYWRlTllWWm0rL3hCV3kvRVl2YlB3ZkFjVldXOHVFZ3NDRWor?=
 =?utf-8?B?YjBqQjBSRFM3NktSTkpSVDFoNUwvZHoyQWFoNFBvMVo1a1dwOW45aGlUdUVK?=
 =?utf-8?B?Wmpwb2FpeDUrSEJ5ckhJbUgxbU1OQXo5cnZhQTNjRzdGaVJGZWx3V3F2RXht?=
 =?utf-8?B?ZXlQRlYwd3VqWG5DY1UwazdydlRHeDFGemtDTFNoV2kzaHNFSUcvWDA4N1Vv?=
 =?utf-8?B?REU5VlloWUt2ZHNlcWVNWG0xRnFKb2h6R1VIODdJU29PVmt1RFBjWC9xNU5B?=
 =?utf-8?B?YlB0UTdnL2ZqbEUvS2g0aVJYSnYwMXBLcWZXUTNVRHc5Q2tXOXBwWWlrNGxK?=
 =?utf-8?B?QnNtV1puZjhVSFA0b3ROYzVSMWtCNDJpVjQzbW5jeSs3eW1weDZ3eWo3Tnkx?=
 =?utf-8?B?dW1zQnFzbFJDajFscVJpU3IvdExBWmQ4N3BPTEN2c0NUVzF2UFV1M3Z2OVpI?=
 =?utf-8?B?dEIwQW9vbFJLSStUbUo4MklZK2ZqSVFWcC9XRTkraG1KaGFRNkd3b0V5NTFz?=
 =?utf-8?B?aG0zMHM3cEt4dWVObmJwcGorRmkvZThiSzVMMFFyT1k4eGtOWDZ1MTA4d0pa?=
 =?utf-8?B?bzlxZTN6b25ZSjFLUEpzNGNSZFRNVjJvSlJZWWRVcVF2VmtaNkZRU2hlaU13?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acde34d-cb41-4bd2-22cd-08de2e83d43b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 13:41:27.0741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PH/D0T0wmxSUgn36ev25tW6MaLpzU+ivjlTFvzvOmPfhUMLl3hPC96G4thWqXZz15zSjRi739tBrAIkoAqtv8EWPsg6N69mLH3j1on6mRqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9929



On 28.11.25 15:19, Jan Beulich wrote:
> On 28.11.2025 13:11, Grygorii Strashko wrote:
>> On 27.11.25 18:26, Oleksii Kurochko wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -799,6 +799,28 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>        return arch_sanitise_domain_config(config);
>>>    }
>>>    
>>> +struct domain *alloc_domain_struct(void)
>>> +{
>>> +#ifndef arch_domain_struct_memflags
>>> +# define arch_domain_struct_memflags() 0
>>> +#endif
>>
>> Is it really the right way to
>> hide part of common interface in common code instead of header?
> 
> If it had multiple uses in different files, surely it should be put in a header.
> In this case though, with (even long term) there being only a single use site, I
> don't see why we should even bother figuring out which header would be an
> appropriate place for it to live in.

Thank you for clarification.

-- 
Best regards,
-grygorii


