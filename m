Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B3577D37
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 10:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369349.600719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLrG-0001HG-AV; Mon, 18 Jul 2022 08:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369349.600719; Mon, 18 Jul 2022 08:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLrG-0001FP-73; Mon, 18 Jul 2022 08:12:02 +0000
Received: by outflank-mailman (input) for mailman id 369349;
 Mon, 18 Jul 2022 08:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDLrF-0001FJ-6Z
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 08:12:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c58286a-0671-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 10:12:00 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB7075.eurprd04.prod.outlook.com (2603:10a6:208:19e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 08:11:59 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 08:11:59 +0000
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
X-Inumbo-ID: 4c58286a-0671-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZjFMSXg5F1+1ahkXzdOSosoVDP0twpGpIwgf0MoeLMyeDd5O8+DE4VGP0ZEJhQW6y9Zr7d7MD235fG5Mebzb9kSja0NjnJdYgUMQigbaO5CWytaU5wl9EUs5IxLVZiWwlaT/kZ4ZLSDlVQj8GDBdBBpw1aB/g8ogOqTdtT/qDt6D0CvPCPL1NJwBJKmsbwug1xa/8Qe2rjPPVSzx+HAOd8jb5/kkHdHE8/AuHO1vjZJu0TLzfr1puXZyCkpj7gI4bcS5+KHjppao6uJzzEDq+t1GwVxDZbPcSUq3ZdJfDu70TRpUonGX0Nfk8qIwhcL6fqwbU1qlNbaCg/77toytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ez4zvXKIRz4UVCemwKgZOWU+3bA+TSO69mayaJv36OA=;
 b=GiKcpPidMUbgU0s2ptozYGmFM3+3pPN5pdSGPkBVNShbzlZPdHfb40gkC7ufyZ8a7Kffw2Jh3iD82LQ0L+eIn0cxSRviObn1J0utm716pBDrPsBtx4gTFr5J0IfE4IYE+0Zm196rcxQBZmnZIk1uTU2vVsOC8n8EJ7D3H7Ghk3d0r0iwbotx6zif31+YdcrcK3Do491H4Q5Q7IdsGqbp4Dkjttyt00UW1m+DC/vIVNCTOhqls/f8Rhhw8KHWOVhJ/5+5/Dm/IJFN5TIVpqPJTPt3/vmBph9lELwVaIKEmYqNtbuQee8VC6tRN7cixapGjEx90MPlMEFgZ6AwMoQN2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ez4zvXKIRz4UVCemwKgZOWU+3bA+TSO69mayaJv36OA=;
 b=2W2tLLk12UBgqBdzV4m3hNfzh8NvtTWkrerJhOy/wgmYUaxQJUVTwQ2QM4yw1xdejhgaIIf8+u6xrG+8VxVmFBNuOkeqQZn0W9x4VL7eMQ0XzOyaZOwfFgrxubVjUyhPFvnOehYgw/G2vb5IpirkdyfwEoEhi6c1a8aWj7dPzkURcHrikHDn7VkVN9YX9lsqNYit8Q5hpsjHiPLL+avMwdcRSjFCshxBQWiTqRbPejTFx+EdennKHi3rhMmxMCW+JB1eXvbRzhkUFhcCLyek+WnQmBlZBV8FpKyPafM4xWTuQ1W3kZmSznq+wK8WqWXY9UTyzTFvDCZMrD6oDPFnGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b008e368-7712-14f8-82fd-ac300d8704d0@suse.com>
Date: Mon, 18 Jul 2022 10:11:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] xen: page_alloc: Don't open-code IS_ALIGNED()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220715170312.13931-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e912e69-feeb-4f56-e982-08da68952fd1
X-MS-TrafficTypeDiagnostic: AM0PR04MB7075:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CRKb1Mp4jM3TLmMJNfiUnGK3EpRoNDQu/8fFwSMe3YbvP7L7WtyHWzbDOfQVTCwmbKiRQsFlTFLioFAG2n6ivtipKHYv0oUzejDaj3OJBD/sgKYk516SbFdxTNny9g8bF/VnakMEiXeri1WMLRAoSAxQEBk7TGJp0G+tWCcwLu4dMqrFzh67ugP2ZCIqkEnOlXn9xM4iVYEVbCF3OTCO4EPdQW5o81Oe4ZtobYdVJTBClFg2YKgrR/RydEIGC8K+gOVz7Yb8nK3xIkGpl2j99YDKvSD0eTnQ/7z7BX/5357kzyQvBZiS6Tk+D7VXYZdRXKkYsUpNhEmp3nTOHnB561DDtF1ank/2iUkB6s2uXxUdiVy3gBfRLiFWgVbxPCgEGJA4XGIXS86j4M2KMMnPLJxHSpxuZGSMwuor0VLj3qIBKhfb7eg9hD0ENWYD31/waw81plMrsPA8iJH0oYkeOAcqmSbijQkK6gvz3dPUZxP/HYU6BdhvigABwUNllnRRwsAp1ImfyxJvrAYeArQ+2SLlJIisPacUH0Kp7Gg1rTitkLC/tWAuHPSMFGgUzBHJRji6VrsTNFO8aS3930ynsXf0sy0PdfioaodewcRCDBNT/bGchF3JbcPmQ78jUmQNdpeiLwqCVQd9JaGjlO/ktK6Vn7nvFRo5e69YBZ1y8tE8MlUpsVlYMV/YjSJpNZOmDf8s5nrP0KE7Ua5Nc/nJuePDWmbsh+e7yL6fRnvxhUFhATihqsPo5MjaKoqWIiJqb0ofyK1RB1PhNJjFjlOoPkasUeRbRkW4ceM6LnJDaKdlfc2Eq60Qr8h8sjzhdaf9WXWcyCfROPce6b0mmA1ym1q2BZEr/Q7yTOU7J9fF9X4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(376002)(396003)(39860400002)(6506007)(53546011)(41300700001)(6486002)(478600001)(26005)(2616005)(186003)(2906002)(5660300002)(4744005)(6512007)(6916009)(54906003)(316002)(8676002)(66476007)(66556008)(66946007)(4326008)(8936002)(31686004)(36756003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmFOckoyeXNkZDloVFdzQ1lxNm50ZmN6OVlpbEllb3RJVllPWWNxSnBXc0ha?=
 =?utf-8?B?Zi96aWVxT1RjMFAySGxtZ2hDWmtHYnJnVnRoOVRRS1N3TFBJWmM5SUhKU3ZT?=
 =?utf-8?B?RU9WSllqakYvQjlkK2wrU2ZDUGFmTlpnUlVIWWJxUlU0bU1SMys2Z1ZldWNZ?=
 =?utf-8?B?WnFBWTh0OEFBMEt4QXA4VE1nRkt0c0Z6YUtoSUVUbDh0TE9TUURSOFEyV1Na?=
 =?utf-8?B?Y0NiR0lldFpHeTlkd21SQzI1dGdISWVVZStPZGc2OWZIeEsva2p6emFoa3lU?=
 =?utf-8?B?YkZSUy9uVEJ5Y29hdHJDNkJXWXloczRQTUM4dUZBVjM3ckFHYU1laW5PQ0dD?=
 =?utf-8?B?L1NONVpRMkZnRUJMZWxETGJnOGdabGI2L3psenRjczhjN3NHQlY1aGZtN1hY?=
 =?utf-8?B?VVYvakdLTE1vMW5PL3lLUE1SNlZpWVh3d0swSTZNa3o5b1lyc3kxWEc0MTZ2?=
 =?utf-8?B?YXpoUG5sOUpOQ1FpOGpJaW0zamc2RFdwSTRmdGMycXNYTTBEekdla3hoS3dB?=
 =?utf-8?B?b2pYUHhGZjBYaW5XcmwzSVlvMWplYTgxYzdPd0NHZmduUWlpU2hpYjRvaVJv?=
 =?utf-8?B?VlExVmhwMUNyWnd6Z2dIZy9hUG02QjE5WFlXb1I3alFmTW1VU0FJU2lYUE1V?=
 =?utf-8?B?eW1qNlQ3TDllYjdDc3Y4c1M5QlhrRkRKc3RSaUl1TXNUcmsxeVpaOHJic3hi?=
 =?utf-8?B?eFNHS0lxZ2Q0am1ZdjNXZFF1aTJyU0VRSnl4OCtjNEVkUUIzM01tMFFpWUh6?=
 =?utf-8?B?SS9nbmlWTGNuclBIWjdpL0paMmJ0WW5RQjFpcWF0NzhHdzMwMUpmaFQwSkdU?=
 =?utf-8?B?SlZSTG9pUzhxS0M0VVZyeGZVYVREaXdjcFNSd2pDb1ZjSFVXYVV2SlNWNHBY?=
 =?utf-8?B?TmJlbWloNFFubUVjZldPcG1tSUlRQjFqZUgxdU1TQmF1NlhydEE1YnZNcDVF?=
 =?utf-8?B?OTA5cjJJaHJCRFhXS0p0QXdLZ1BXMCszZHJCVjhNaS96S3dqSlpCT2Uyelox?=
 =?utf-8?B?WkIzL0ZESSs5QzZaSmVMZzRMZXIrdXBDdDNYUXFiODRFOEhGNyt6UTlPMEEy?=
 =?utf-8?B?elpQaEJYK3dNdmdQVU9jSTlybVBmQ1BOLzhrWm0xWE5wTFNqaGJ2MVhMZCtz?=
 =?utf-8?B?OUJ5azRVQklvZExPYms3bVAvTUQ1WlAwVmpjY3hrSmcyYVFDZFVXd2tlMzZW?=
 =?utf-8?B?bE1uNk5WazhwcmFLK3hBN3QxQXdCSnRGR3JxaHhmRkNwaEE2eTZMSE9wYnBL?=
 =?utf-8?B?cGtqREN0ZGUrd3pIWjBtc1pqZFJtZ0pYK3hkS3duMjU5MENaVUdhdDVwekpm?=
 =?utf-8?B?ZjhXV0FNaVZUSlZZd0JmT3BRY2lsaktKNW5zb0hHZWFTNjNqNjRDK0hJc25j?=
 =?utf-8?B?YVlrRW00WHhCdE1iUmdLem1DY3pTYzBRVk43ZVUwRDZVQWs4S3l4VjY1OGlM?=
 =?utf-8?B?R2xZWitGQ25pQkx3SXE3bWg0UjAxZ3EvdjRlemJFR3p4Rm00dXhQZ2orcVBD?=
 =?utf-8?B?ekNvZ2ltL3hydGcyVGF6OFp1TzhxTzdRdjlNNmNYSFN5SWp6SjlCUnlIUUY1?=
 =?utf-8?B?S0RwN0VURHRhOS9KS3N2dlBNeTZmbVgwV1V4SUlKVkcyY2Zzdkg4VVE1RkUy?=
 =?utf-8?B?WUhQQXNsUlJKNW9lZnFlbU9ReDl2Mm1nRlUwNEdSQ0pYcVJ4Wk9haVFveC9S?=
 =?utf-8?B?R0prL0wyenUzVVdjWVBrRlZaZFcxY2ZyM0phR2tjM2tFblBIVmdvRjdxQXZC?=
 =?utf-8?B?NnhzVWxDRmQvWnZpNUh2eFRnTWNSc1dMSGpsT01DUStXa2FVdzNYMzJvWVFI?=
 =?utf-8?B?ajBiejVzdWRpQmJYcS9PaVVyRDJrckFVMGNXY01TM2lFWUh6WmRMYVZnZGFF?=
 =?utf-8?B?N1ZyWE5CUWYvUTdmTkJOVHk4N2I5MlhXcUhYUVJhK0RlMjBQSEdZby9Hc2dE?=
 =?utf-8?B?U0lCOVZBU2k1WVNkRkZjbUh0MlpBakVKelVCRVMydEpNNWcxWStIMmNTelVo?=
 =?utf-8?B?MUQvRXU2eTJNWEFBNlhSUTd6bUxNbFhsdkVBZ3l5eGhySHQzV2pLTXh0VVI5?=
 =?utf-8?B?dWZpSDVYSFBoYjZZdTA1UHpWNXI4ZnlsOUVMWTFaZFU4ZHk1bTlzdVVYUkFN?=
 =?utf-8?Q?3vQ9fx9pKPpDDWbEaA6Zyy9ZV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e912e69-feeb-4f56-e982-08da68952fd1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 08:11:58.9766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fbau7P2cgtk9wb5nVBWRDbTa4FEeI+76TGQNpstQYLH6XQI5r+GGKqKtHD2034pgk5N8cHP1fUA4lbTejhEOSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7075

On 15.07.2022 19:03, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> init_heap_pages() is using an open-code version of IS_ALIGNED(). Replace
> it to improve the readability of the code.
> 
> No functional change intended.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


