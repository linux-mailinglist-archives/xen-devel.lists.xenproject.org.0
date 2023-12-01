Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70BD80042E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 07:54:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645295.1007388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xP7-0005X4-TL; Fri, 01 Dec 2023 06:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645295.1007388; Fri, 01 Dec 2023 06:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xP7-0005VT-QU; Fri, 01 Dec 2023 06:53:37 +0000
Received: by outflank-mailman (input) for mailman id 645295;
 Fri, 01 Dec 2023 06:53:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8xP6-0005VN-RY
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 06:53:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58d2bf62-9016-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 07:53:35 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.16; Fri, 1 Dec
 2023 06:53:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 06:53:32 +0000
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
X-Inumbo-ID: 58d2bf62-9016-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npOXPcBYe2zyUzS7NyyhKnW+jx5ScvG0c5qlX1Jc5G/CQkwPfSgBXAYLYtmAgqXEahf1HnLaxSG4IYmStFpTnC4/aFdAQj3xJPREwHHH5D1mhpi/QdYHSyw8a/AMyrvd16r6BX1mlriML9w8p2cWseEsBzezeBqP3DbjthmaR+2clPgBQ0nT+YAq1YBxyZLBTqyHkD4MeOTANlpq0ZyH12Tkp/zuB6w5Z0ijmUug+1jzNyey0tp9u/BiJD2OTF2m+CdoU9p+CRCHTqtZ55PBbOJeD3HcMGhgvwgLpU2Jgi/GkzSti10xcziBRIHVZvIsnw/YAjUwuARZgvqCVyoJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzzuqxxERtQVIkGyM3BZuvqflx9ygw0vzrQJgR+3w3c=;
 b=eVq6b//Qyqlt3fH/Xv7+yy/ssF9QIOdqpqv+T5H5uQDq4TDx5JJCgy6b7qYPclxmiL7UnEg13RKJkOnR2QPSC7id5LYXRGVCI8QkIgWC+tX9UyZECEqKs8IxVNXQzCo8cWT6if0y5Qvhibkzqu6rov0JjoS3TQmteYG/xDVQHvQM6QAgubvhOojmL4lpoP1GNdrOX5O/Yueos+R7QWN40LZBO/KZ67apbD/W0he9B6/gSuqa5AkV03sFv2Mzf8i1enBQb9UqEngD4oKgmJ81VjLq9O8lkJNcPqkiBN2qXJiyoFdxeL95mX4YFLg97sL5YC7RV0nXLjZQdN5TuCbTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzzuqxxERtQVIkGyM3BZuvqflx9ygw0vzrQJgR+3w3c=;
 b=PqBaPTfMJBkP/c0xBeXp3izsluAQLTBwdfg2VEVhpW79Pm9p1tG1R7lfiFC0OkMyd2N3PTq7ZVan26hZgZGpN3C4eJbNQgvpOQeBFXrmWqdXTdeIJfybm1WKJbiHlKCpU5gv6x8pGUewiYb6xdOC6zFpyq2dDHwwpeiheplVXn/3p8aEPAaAXUyIJ8ZBbZ+N4yQPfEZwNlPHIxo8FrBEePzs40RIIhZMHPDbO/RakiKsuU34JjAJtbNbAKVFLv2izjmG7Fit4/qi1M2OQlX2u+K4wH5rjfU3Aai8VFL05Th70fhYOc2J296reMUxWi/DRc4f5d3WnkhQyOINOEaA8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0a4f187-4e84-4e0d-b478-6d8437a0b644@suse.com>
Date: Fri, 1 Dec 2023 07:53:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com> <ZWjIX0Jo5gW5SEDr@macbook>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ZWjIX0Jo5gW5SEDr@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6ab619-7955-4ba4-4bcc-08dbf23a3af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pckJVSd/96AGJV1QDY7tAjwpZ+1/SH+dqFhZ6MnE7zY3bSX7nw2cqPKeCM4MUGHBzqjS80USG+a1bSPkBZInS1GdJv1Qpa5KEG0udvBhkNmY43NRzmLQLQprTszG2E+xDN6e9nJO6AhzmhPygIHnaJXOrci9zMS3vrvrAFcuRghwhVnuc8N8nGNzAbfjVxiIqlBnu5p7Syv2fzaEr+tN8psz936ThgNSIBBpjmgSPN9nwQr/mOBjN3dSVqFsNIboxzhN3WGy5v03aDIcbEaD5HRI7xEa5RH5l6tw1i73mUF09vqmIwzoddtRPAMa/BoxSSplJXfs2xK0vkCWj9cZiFbpjfho8kYUWifAb5x5a4p9aj7c2H4R/hgB8TP6fJR/xWtvd6esoyKTjfJPYx5FsG99ufO5FyAjhJ2WrORVmFv3B+KAD6G7oVIdnKxG+Xj+qcGHd3hVc4fXREutQnnBxGljpqskB9DRGlqXI1cDoiKW0yh0O9C5kBHmaIGUFZymjQlpEXsqS967plgBOnopCuqk3zFr264m7REQ7VEEsxK1WAPdV9w1PBr8bz1vgdQ9zsCCBdgu8H2Nt8k8CZIVYVEHjBWQ3t2cUYR9TT79FKxTHHv2bItceGEnMj66lI/AU6rNNhxU6BlNpTouYcyrbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(38100700002)(2906002)(36756003)(41300700001)(86362001)(31696002)(8676002)(508600001)(4326008)(8936002)(26005)(2616005)(6486002)(54906003)(66556008)(83380400001)(66476007)(6916009)(316002)(31686004)(6512007)(66946007)(53546011)(6666004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dENZbEF2MDgwekZOaXZWRkF6eklVakxNVDZPVWxJQ1pjRnlDNXpoQyt0N0JD?=
 =?utf-8?B?c3NwUzBNNXkvbnA2K2NtbE9rVUR3ZCt4UytHbDZOaEs2cnNVeWZmL2JveklF?=
 =?utf-8?B?d0s0SEpIQWU0Wk51VkNZVjJBWTllaTJ3TUVCZWRFWHFxOEpncDJUYnRpZVF2?=
 =?utf-8?B?bTkvZ0d0K1BUaGk4V3NDdU9wTTdVQzdsQ0IrZEpvVWl4MG9HMW5rRnYrQ2hZ?=
 =?utf-8?B?dEZWUFRtWHNKYnJQT3hpTVRHbDczOWRjYlJVekM5MExLNFRlMGVuaWp1RDZR?=
 =?utf-8?B?NWE0RWZJTkJQQVY0OTVwQXhUcW9oczhLR0kzU0N6TXpNSndwVSt5L1lWanhY?=
 =?utf-8?B?eFJoY2VRcks3NVlmZkhFaVluRTl4dVl1QndRL3crbXR2SGd1eU9tSEo4S0lM?=
 =?utf-8?B?RUYzMnpiSHpZcU4yd09SRWQrZ2tpNWNpRTdrcnNsK21BNW1OT0VSNUc4N2pr?=
 =?utf-8?B?amNGZFNWQWRMMk1jeFJONHdnOGt6QmVOT3ZNZnFTM3J6NG1VTHQrOHFMcDRs?=
 =?utf-8?B?S0VvN3NCNnZEeUFZT1AzaXFWYjg1OTR3ZDJHQWNvSy8wZFZvaE9KbkQvZVpq?=
 =?utf-8?B?RjBubzVxa0dwR2tyRmlVQVNuMExpM0V0TmRSSG9QbWtTL00zWlFnN096RlRn?=
 =?utf-8?B?bVZObXIxdUwzRVdZY3o3ZmtSNTNCd0xaU3NtdTJXZFdSNUpXZ2RmSzZWcnhG?=
 =?utf-8?B?SWg5OGNmWkFpbzZuQVU2QklCdGhGTmg0dWFXTWxvN3RQNEx2Tjh5WVV1YjVU?=
 =?utf-8?B?bERPV1NsVkcrYzE2Z0tRQXRPY0gxNnRuK0NrV3E0Z0EzNVZQc0NYZEsvcnZ1?=
 =?utf-8?B?eHpsd3Azakh1ekUzNmJ5UXZEcHRJMUlIK2ptYS9Wd2J2S3dsYXhLdzV1Y2Ft?=
 =?utf-8?B?Mi9XcTdwd1NEeU1waTRUclhHQ0owMkwvcEVYdFJ2VVdOSVBBTzBnZjI5bUxT?=
 =?utf-8?B?NUh4UWNSOWNlUHlvS3NTamd4d3p3ZDIwcTRvNkowd1dMOVRadjk3c29Bek82?=
 =?utf-8?B?NTdtRTQ3cnNrdFVWSDZrK3BSQUFLK28wMWxBbkVTaDlUck0rbFBVRFZJSytP?=
 =?utf-8?B?RDl3MzJDUmhZSTVkNmtobmVlVFZVR2owNjJwUis4TWxsNGJLRlliajA2S1Ni?=
 =?utf-8?B?a2FYNWdTR1JhZ2gyZlNaZUtsb1E5MVBZL0dneEdCWDE0T1R3WWtMeUFKNVp0?=
 =?utf-8?B?Y3lvUHM1VUdMQ0cwMUVBRGk1Z0xLWFowdEgrMnNOQkF5L0tLOHhiUmlvUjRF?=
 =?utf-8?B?SnhMK1JnZ3hMTFZVTFJkS3c1S25FT3YvRmcxZ0xQRnB2R0phUGRaYkFKaEF1?=
 =?utf-8?B?dW1yc3dpaFMwQVdnb1FHcHgwS2dGSnU3ais2ZmpxSFRGVTZmRkQ2NE1MTExI?=
 =?utf-8?B?ODlOazhYTWZobUhJeVlQVjVDZTdXM0h5cnRkOGhlbUtBalJxdU1xTVEvU2pP?=
 =?utf-8?B?czVPaVhFUVE0R3Y5MktNQmFiSStIZnZ5QlcycWNCK3R1UWdFVzdmSTk0bFJk?=
 =?utf-8?B?UkRHWDRSTzhNUnJYV05sSHViMkhPMG0vYXBvTTNJazN5WUIxcFNvTkQ2RGxV?=
 =?utf-8?B?ZDJwbzZVR3dXUm9qRUp2UnFzYjEyakc0OVF6WWJyTXFGdmw0eDJnSVpPVTZF?=
 =?utf-8?B?M3pFSzgvazRGZGc0TDhxanYzNUxhM1ROSU5nRUxkeVlGVHlxdWtSN1lFL251?=
 =?utf-8?B?SnhBYTM0azNia1JLT05PK2ZEbzNVeENaTi90MVlxNEltSGFBSDBoS1RsNjNp?=
 =?utf-8?B?TnlsbVo4VHRrYzcvZlF2eEhBczZWRm9JUDRsUnFlQkZORGhZRGh6Q0NUWjQ3?=
 =?utf-8?B?dE5tQ0srYkdERVNMVXMxSk9mbDE2WnExcWlpNTQ3bjVubWl1a0hoQXpUMFQv?=
 =?utf-8?B?V0lOS25RM21iOU1NMjlwc3dyNDkzaHZtZDNTTUk2WlhNSEROZ0UrdnlQRGlX?=
 =?utf-8?B?VS9KZWxkRjhqZm42NHNvSTA4blMyWmF2ZktmUDhZb1N5ZkR2aGtManNLcFdz?=
 =?utf-8?B?T215Um50K0lNZWRmaW1Ha0NuR0kxTlRrcTdJZlJwdVk2aXhSQVpMcHRac1k3?=
 =?utf-8?B?NFF5bzZ0c3Rpb1AycHJVTTJRS0xyVGdvdVhORnRMdFlhN3gzNTVjL1owTWNI?=
 =?utf-8?Q?O6+Sy/VTyVMB9LPuZDstBg4BT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6ab619-7955-4ba4-4bcc-08dbf23a3af7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 06:53:32.0800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Qda4cGjut8eFCixZJ9kyFehSe9HpOb26vRhwuZhaf+8PEVK7VcYpkSGurBofLAt5MRxgswpurK6lCpfYEwJow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770

On 30.11.2023 18:37, Roger Pau Monné wrote:
> On Thu, Nov 30, 2023 at 05:55:07PM +0100, Jan Beulich wrote:
>> On 28.11.2023 11:03, Roger Pau Monne wrote:
>>> The minimal function size requirements for livepatch are either 5 bytes (for
>>> jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
>>> that size by requesting the compiled to align the functions to 8 or 16 bytes,
>>> depending on whether Xen is build with IBT support.
>>
>> How is alignment going to enforce minimum function size? If a function is
>> last in a section, there may not be any padding added (ahead of linking at
>> least). The trailing padding also isn't part of the function.
> 
> If each function lives in it's own section (by using
> -ffunction-sections), and each section is aligned, then I think we can
> guarantee that there will always be enough padding space?
> 
> Even the last function/section on the .text block would still be
> aligned, and as long as the function alignment <= SECTION_ALIGN
> there will be enough padding left.  I should add some build time
> assert that CONFIG_CC_FUNCTION_ALIGNMENT <= SECTION_ALIGN.

I'm not sure of there being a requirement for a section to be padded to
its alignment. If the following section has smaller alignment, it could
be made start earlier. Of course our linker scripts might guarantee
this ...

> While the trailing padding is not part of the function itself, I don't
> see issues in overwriting it with the replacement function code.

If it's really padding, yes.

Jan

