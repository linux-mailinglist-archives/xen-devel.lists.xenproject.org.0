Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F94802D24
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646589.1008994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4Lq-0005xi-6b; Mon, 04 Dec 2023 08:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646589.1008994; Mon, 04 Dec 2023 08:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4Lq-0005vO-3X; Mon, 04 Dec 2023 08:30:50 +0000
Received: by outflank-mailman (input) for mailman id 646589;
 Mon, 04 Dec 2023 08:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA4Lp-0005vH-GQ
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:30:49 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c442eeb-927f-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 09:30:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9749.eurprd04.prod.outlook.com (2603:10a6:10:4ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 08:30:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:30:44 +0000
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
X-Inumbo-ID: 6c442eeb-927f-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3wUA0Gttmc8rXIIChAYt5KNbjeLyqgo7zEBDHA+LYnKqS44TafKjBumWBcsoNcRTy+MVQAwHomn4nfr8c3Q2bkYFBf6l9pFXRIH8bSei+E8ve5vJjSRMcgexH2Sefj4dR5rcSdHR31EbJVSig7ji0Kq1POEnEroFuCipvlG8dlrBEf6EBQKS8GR+bboritfVIZDwSa1v5/8rlKuLKi9wIxuUI+0LYHPlXez6hjgg/BljC2wBaKAYUrBF+lam7f9b+i7AvQ0a6cEmVJ6qsMW/CbRgc10aUih99sU9R8NDxQesC3jj2VVoEVNDYv5VEz5SV2T2hiyD5uYVSOWLuAYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIfMEqiGeFIWeBM6GC9hwAQl9t51sfAiDBlYpbS0q0I=;
 b=RRwoLzvBW7m1WlU2ghyU+EgN64ABQ1l5H0Ot6IUEUVR4UQUHlDW1Qre9zhLHyWWnEUHNZ+vAk54EKWLCZ1oAnC7i2vYinzQPlml3feQHYTWTl2VXwQU9VVGS21RaWS6lGQIBSUKk61fud6IYsemYpj1XwaaanH4WSXJbp1Uepx9EG5OMqiuIx/kwDh4G3HlLflYjufzg5HpPo8Z9RnZVFyD8TRbB/p0CBB1/bpA8BUcsCiwf+fLm3vhQ8rJcYyz7zAEwgdYPmJgyHrCpQSGyJrqwAlZgl3IFC2zNXUo3+Oym4dTtZ3mvjqf6LfW7rwSKHIFW5BHVtjP2uuNMFW858w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIfMEqiGeFIWeBM6GC9hwAQl9t51sfAiDBlYpbS0q0I=;
 b=xWgQGYN15JjExd41dHobF1Qly4IhOZ6IutJ4zjZdYNm9w/hqC7l5uC7eDIu9S1kHcrdAkePq00LJrI+wnU1LzbJ4frAPdU+v/69qDZ0rYd+t4QeiTx4DPnhOkG6mZu7aXhdP1DElqZMSFCscSk04tzRNje+ggP4RMMaogyWPoeTH+ZoIePHjz2rgYItn11BeKNhJgiUNZTcKgfcuSAeaoXBxR5Nv7/1by2mhYNsBvEsY0qT5Gr+cQrLviyRHC2oFU4rsqDH6BWnqkHp26W+GLrU7+rrGhjgcUV3VOALwX1IbUtQ7iv7MpYZ7zGrL20jNodCaVVCnkYgObLDgo12c0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11ee03e0-9de9-4179-bb4e-4ea2510122ef@suse.com>
Date: Mon, 4 Dec 2023 09:30:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/17] vpci/header: rework exit path in init_bars
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-7-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20231202012556.2012281-7-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7277db-a8dc-4426-8822-08dbf4a34eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Ybuf/lyKD4TQJhQy1eWuIoZ9fthlzq+s6FOAGYsjEHrMqfrLKfXi5N7jtVu6sPBq9JVlGLcdVaJjLrkA4JpiKcj51IXlYsMZkwIwGr6FjiBJL4Qxm3MQlYPqzHpARwJh1/Z9GyJqK0HT4sluFiEvz04EpiPqtgfm2x1GZRnHy41fF5UkA2CzBMoGEsFZASTJQyks/5BDFNubFM5jD7LfSjlHks/itCQGARJCnNgZQgo8xiPoUpU4pnqUkbTMeHi/X6VIYE4Bsv0U7uR+QWvmTwpcFEZZ3Ns8s4644U4laMqixGqCeYgppQGhPDyGosowCskFGi7SxbKqoCOfQqEt5jHlUzuEN1g3i4UN2VZUVWoUvs1l1KoDvLyvu278vi3RA/1GDlEmKCJr1Rra+MVcDqA5nVawn80X34+m+5MCduEgXhPkfJcV6bNQu2to7CiVmrzogUW9ROVOL9sZi55biIxtfXWJ29IC+8yM4nMY9LVP9c0ycA/rfBeI9Vdtw1LNOo/a+hKygY6RE9VN4a1x+1cxDqr6ktGKtgdFft65zExd5L+iQUzPoWoQfdo84OmUDBVQspzeQSOsQ0gskMaLoVpg0rzdnXqQgcqkmY+Ec5Ze0LkucVC9mkS0+QNd4hBg3PAZVFg7NjZNgbUMb4K2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(36756003)(41300700001)(5660300002)(2906002)(4744005)(86362001)(31696002)(2616005)(478600001)(6512007)(6506007)(53546011)(83380400001)(26005)(6486002)(38100700002)(8676002)(8936002)(4326008)(31686004)(6916009)(66946007)(66556008)(66476007)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGh5bjJYZFphTkgrckU1dUFFMG1Hb0I3NXRNdUduYVE4aThBUnNhOEYyT0lM?=
 =?utf-8?B?cjliMk1INFNHSExHb3Z6Qzc3aVI3QjNUZEVqNEJaSFBhUHRzcWJUQW02VnRC?=
 =?utf-8?B?MjI2VjJlNzR1Mkk2VE9wOHNWWFpVMENYblRJeWE4Ky91SHNRWUtYSXduSHBS?=
 =?utf-8?B?MFJTbERoZ012aG95TzV5WjRUSk9YTEJIbjAxYzhUdkJibDRlL241UFZjNUQv?=
 =?utf-8?B?dnAwdmZXemZDenpOVUxwWGN1QnY4TXVoMkNqWWcxRXpGK09RTGdUOVFmVTNl?=
 =?utf-8?B?Nm5pL0ZkVGZzQmJCVjZkeCt1THVpY0VGZjAzUTJnYmdqa3BUY3J2Y1BybEo4?=
 =?utf-8?B?Y3FuVFJ3cnlyK3Bxbkk2VXhqMkhVb21ManpSbUxKNmJnanNVNlZxdkY4Q256?=
 =?utf-8?B?Q0hrdFRZQ3lIZHRiQTNWS1pYR3ZXZHpqek01cnRDZG9SUGpjaGMrWkVyWDVN?=
 =?utf-8?B?ZHRuZUZjVHdYd1dQYjJFOVpKK2ZYQzl6NC9zeWtXWnczdFUwMGlZYyt2ZUd4?=
 =?utf-8?B?VGU1c1Z2bkx3UUZ4eDNRQm1JRmlva1d4T3B5WmtaRDZIRWo3QlZQM2U5NzFj?=
 =?utf-8?B?a05aa0xiNzlib0gva1YzL1pqME5McVVzNXU4Ym16bmZtTE03WFhpYjlOYmdN?=
 =?utf-8?B?dHVUOTRvdHhQUVV3NGtaZ1BKbnZScU1MRjlSanJzb1pGdG4yUERVdEJkSi9B?=
 =?utf-8?B?ekRuL0hDWXZ3WXE4ckFCSWxDUHlUYlVWdkNxYUNFR3VMMjNUOXloOTBLTndx?=
 =?utf-8?B?K04rem8xSGliVHZiNnh5M2FmazFIUzYzQkliZGJYWTE2cnIrNTgwK0lYNHUz?=
 =?utf-8?B?TjRzZzFpaExlUm5zVk51S2ZDT2JHQTZjK1Uyb3RtM1BJbkJ1dU9vTS9tRy9G?=
 =?utf-8?B?YlNCZUREUHFsano3Nk85L29VVDZtUXN4d2poWVY1MEV5SStwdVBGNHFzZzBu?=
 =?utf-8?B?R1dycXBrKzhGRFN0VmlRZDdmRUVJL0svcnZaRUhHL21PQzhnZGhBeXFzRUpM?=
 =?utf-8?B?aUxtR3JIVHV5Nm5vTkJqcG9obUtLaXJieDY5bG5IRkF2ck9XeVptUUxaZmVT?=
 =?utf-8?B?MFVsWm1Rd1VtVnk3K3B1a1JTRGQ4Q2EydDZ1T2xaQ2FRMmdyZ25rQjBZNUk5?=
 =?utf-8?B?bFRJTHJPQ1lHT1paMERKYVh3djZPVDdPUGgvbmlJS3lTamZoVjRVbWY4M2Ft?=
 =?utf-8?B?djhOOEpaNkpUK0NkbFJsay9kUjJyUGFrMTJCdXNicjZtaHNtTEVNWkNTNWE5?=
 =?utf-8?B?TDR0NjB3QXNJRXNzUEFmd3RnSW45THBLN2J6Q1ZzbCtQT2tUenZETVkvc1Zv?=
 =?utf-8?B?bEdJendyOUFmOFNPOFdsTEZtdHZ4aGlBRnBNbmhyYU9nZm5hTWMwZGY3VTdW?=
 =?utf-8?B?Y0RkT0xmSjdPUUJPRm9kaTJMNGlxQ2N6OE5KbFp0U1JlU29iK2k1Wm00QStU?=
 =?utf-8?B?TXM4VDcvS3BkSGxESUFXeDV0Q0N0MkFoaTF6TnNCQTFZNDJrVzdaUTZQL1I5?=
 =?utf-8?B?bFJQTjRTaWFCeTB6eHZnaGJ3V0JVVTlXMXpYZmRUcDJyOXZjQUVSd1RHMTkr?=
 =?utf-8?B?Rng5YURSUEN4d3plb2hWVjBiRU0vcStZSXBIOExKS0dkN28vK3dvWitMSVpB?=
 =?utf-8?B?M1VWMnF5Z3czVFhmVzZrUExuVkNqUWZpNTNWQ3gwQ09PcW1LRW1jVC9qeEFv?=
 =?utf-8?B?NGljWFhRa1BGU0JkRmY5cGJXalZ2R1M1SFllQ0p5dlcyZmhVL21MUjNjRkVK?=
 =?utf-8?B?cHFvRkI2czFvbTRLR05TaTRZZEVNVTBsNm9tTGpMbVE3SXp1ZC9QeFlPdmJS?=
 =?utf-8?B?Q1U2cTk0bkR6dEpiYTNuWk5rdjYrb1hnMVh4UmVsa1hieDdjZkh4enlZQVJB?=
 =?utf-8?B?QXA5SUJXdmw3RUszVS82SGpPMlN5K0EzbGo3SFAyekVyd2c1MDdvK0ZFdzN4?=
 =?utf-8?B?WCtJSGoyRy9PY2t5UVdHSGVSZUJZUG54LzJRbHZMYjlyWklYVXRMVTJuMkYv?=
 =?utf-8?B?aUJmWXdXaTVRODFXSTRJVFNXN3ZGWGdMckRhWHJLdUhqUWF1Mlp6NEt6ZDk4?=
 =?utf-8?B?TFBMSVBTQUNQdWhRYkFwTm9kZndEeDB0c3VzM1ZpR2xIbmlnRXJIcmJkRVV1?=
 =?utf-8?Q?Aum4FSNEmYivxz29cOV6fd0aB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7277db-a8dc-4426-8822-08dbf4a34eca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:30:44.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olE0Q2uTQVpyvSTh9p0frXxuRy/zIm6wTJ4AGQDFJm84C9eqbhezzmAAUhts4FCf8skUmoN05CDziz8lV85XPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9749

On 02.12.2023 02:27, Volodymyr Babchuk wrote:
> Introduce "fail" label in init_bars() function to have the centralized
> error return path. This is the pre-requirement for the future changes
> in this function.
> 
> This patch does not introduce functional changes.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Nit: Tags in chronological order please.

Jan

