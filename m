Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6EE800438
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 07:58:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645301.1007399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xT9-0007R1-Du; Fri, 01 Dec 2023 06:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645301.1007399; Fri, 01 Dec 2023 06:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xT9-0007Of-AT; Fri, 01 Dec 2023 06:57:47 +0000
Received: by outflank-mailman (input) for mailman id 645301;
 Fri, 01 Dec 2023 06:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8xT8-0007OZ-EZ
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 06:57:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee1648d5-9016-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 07:57:45 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9007.eurprd04.prod.outlook.com (2603:10a6:102:20f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Fri, 1 Dec
 2023 06:57:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 06:57:42 +0000
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
X-Inumbo-ID: ee1648d5-9016-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUq335wpTn2w0yKipmRKsVF4ACPSkVJGpMJC4hlPVNPO6WE4bflyy/i/J+8RRhKkO0BhXqIiMuXRzqTWlPiZ12Dn+UIqzUZRacKyktMbmeNQPTFvfdUaoIl6mP3KdOxesIkop08gz/Fv8A0vGBJFWWeJlSjHr68csgbpYA4NyWZWoZJaJJvLU8vU4v8YALXjx5kyXmqJPSBQQqPxm+RABgQVd8iv4oFhSlGteFQqgpHgAcpk0K9E1R1+3LXtFSKLRksErX0ilIKu4hxZOp/9DTQfk79oNrOxv4R3xt9JkX9Kgs7d3M+4NLOarTWCC2UGsxVbx7IS5d/iIpuwTsshuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTHCin6LCqZkD/5YtzrRRO7ZzJMyRE/XA4cJOVrdYYU=;
 b=iFCN5KxOdjZf2LI/tld73kKEKndgTzZdQFyorjqFeh4KjvM9fadB5DuIkZNF82gAh7MFQQOmbaoTqxw68fvL3tF+kF+3tITIJ7EjF1XpZ11X9dnMfklDYiDH3ToqkBpN6obvVN0xTwb3JU9FkFvJEwG8OlUbyJNRp4lXzxy5DzRpRE+/7zk0IUmc3b9sxLOpJdFB9/8zbtdR/JNSGkUa9V3ERFw5o//qJdLxEzh7fDZ/Iwu+KDn3Zp5LuyQztBuaG295lI3JPWTcVY9gL6qTsuEpm9gNynqOia3Tjnash8P5c+ahXV3sbqwOssnk6ASFtyjsoFRvkGlNSNwtmkzoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTHCin6LCqZkD/5YtzrRRO7ZzJMyRE/XA4cJOVrdYYU=;
 b=NoqXWYSCN/qb7LpcbozRqEwb6NTVRdnp7OCBqpC8CYzShHKysQd95d1dh3vRR1tD9T9flZ5zAiInAX7q5+OE/5Zh2dIlQit9/WZ/VBj270fkHNfJrad+fSLkPHePuxLjxTmJBnUNzX8yEXW7GVJ9upGf2AqJEmW+P+IHzqupEq5HJZJPLprwernXculKtTbLegx0ukXkkB+KlDXNGzoqk2KGGfhKqywn1w8/+mXEQ+5s8oGtFWVLJAX+8vDhcBzwXKmv7G6Dv2I4LKq4EG9X5+UCuhfkMysKJSreSw5j3S9wnPzm5/OgpjcLzBcUIx7qcfBE6M0bxsqqIVCVx427fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a2dff64-9fd4-4812-8e5b-de489ed1e74b@suse.com>
Date: Fri, 1 Dec 2023 07:57:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <8be3763f-a4b6-8962-9183-a2a9c3509726@suse.com>
 <a92b1717-965b-4767-8f11-4c3a4e03418d@amd.com>
 <4cf3d507-a76a-43b6-81c3-bee960e811f1@suse.com>
 <cebd5aa5-d000-42c5-a224-dfc8775f5ba8@amd.com>
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
In-Reply-To: <cebd5aa5-d000-42c5-a224-dfc8775f5ba8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4bab27-9ac6-45fd-32c3-08dbf23ad072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PbnoX18xzagmHLiAyNiS6WqsVayZWpOtDAe0n14GFLF5WsK8/wvFKlzXTDFdyRWLZ+91iatCnvx0y2pK8QxvmODaaQ1uhDQb7OyrHRaxIa/aDvpOxrkgtTmI/OSLBt+PQEb7jern2eS56CvOOMXK4KnTYmem+KhxP+00jcdM3yeEI6vkeegyKttAVcs7AAIWomXV1Ti38+2617cOHVTBWaUXVMVHc4Q9CN86diA1lw1RtyqRcCPZlUlwXxbD4DNNp+M0Z8QFIVGQ3ladQP9JUIOMhpe5PEtjvOVm+r6jdZkAbCZknNpq12EFa0Ty4Ljx+4G3tRevXsFRTy4SevlwHzLdh1q2YcVoHIGADBz7BeHVuPu8rT3Uut1V6ocI5Db/EAnyhyOkJ3hKU3ZtD8T8pjYUTqsktAONFomemNphucYP0iJ4mzyWlVuPnv7NCfGJxrEavivytco/gC5x7BAXbR+tLc7keGr+9cYkzioozX7/FWWh2fPyla6nAu6wjbUPvHfZrXNGSEBHCH/aOwxZJE+R/BNja8hBmDw8Fj3UJgZDKoAIXpIIGpxFchbfDBHGZMQwemzP5ZLKVwlkD4fea98C7hf3S0mJbCReTDEH4046lZqv93Z+wIOpztbsiR9EonkUd2fmFbM0hc/STQLVNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(4326008)(66556008)(66476007)(54906003)(66946007)(6916009)(316002)(8676002)(36756003)(8936002)(7416002)(5660300002)(41300700001)(86362001)(31696002)(83380400001)(2616005)(26005)(38100700002)(31686004)(508600001)(6506007)(6512007)(53546011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z21vOW85WE5kUDY2U21Kb2ZTbVA0cGMrS1FNcnM2YUpzb0JJVXFUU3Q2TVcw?=
 =?utf-8?B?Rmg0cjBwbzNvQk5UWmdsWlZaYXNDTTdXODI1c3F4S2Jhc1gwSlhDd3NQeFVv?=
 =?utf-8?B?TURyUGJzSS9mdHZnb3BOK01vWGw2NnFXbWV6ZFJDYUV1b25Rc1NaOHZGTHlZ?=
 =?utf-8?B?eVFFVGIzTk1FbmJwakJPTDRWQ1Vid3J2S0NZcDlYYjJiakNZUTlWZUF1eVpI?=
 =?utf-8?B?ZTRoaCt0MFNIUnJTRC9jeiszd29GTjBKekRnSG8rNEhrSGdpano5VnNMUGwy?=
 =?utf-8?B?UDZUZDJTNHlxUkFnVE1YT2prdDVpR3JUN1BoTWM3emJNdEZuRnhtV21Xb0hO?=
 =?utf-8?B?STRnS1o0bkdNY0RSUUtGZktFVUk0bUF3MnQvcnBEQ3U5d0RQNWczTlkzaEky?=
 =?utf-8?B?TTdqc0xVcXZqUjIvaXo3bERiMG85dlBhaTdSYmFlc0NPUTRGYXhqaTJWaStG?=
 =?utf-8?B?emE4ck5uLzJoemNDRHBpVm9qVWVkS2hMN1NIV0RiWUsyaVh2TURxMTIyWkJp?=
 =?utf-8?B?RitONDB6anRkL1RsVDFndDZDWXJCalVqWmx6TkFxL1ZsMXkrUVowbG9qdXFZ?=
 =?utf-8?B?MzFQVjRHekpyUDFFN2VQaUNnOXIvM3ZTcUx4Q0xFSllsV3N0MDFudythZjdI?=
 =?utf-8?B?N0hVZ3dkNEN4d2hZV0NhSWNFSFhINkFvVithVjdqZEVEOFgyQkY1WDEyNTVt?=
 =?utf-8?B?am1zNDB6dFF2QWZLaWxVa3ZIUUdnMmlMN1dYOERNZ3lCcThrVXNEMVROcDVB?=
 =?utf-8?B?OWt3YTJldU5VUS9RbDlnL2lJVmVldjNyckQ2MUFDNVVpMUl0Z2xhM01HS2ow?=
 =?utf-8?B?QnBRTkpVRnQ0WTdmb2RrQ2dabk1HZW0xemJxY3EzYUpsOGN6elNDL0tVdmJl?=
 =?utf-8?B?ajhiSnBHaThaUmUzSWxsS1RJNXhtbVF4eHpUL1JnRklqOTg2OFJBWnFHaHpl?=
 =?utf-8?B?Qll3MzROZVlhTnA5YUdwNkNtUWN5eXhnL1FTdVhEc0I0Y1EwdzgrcmhmSk5G?=
 =?utf-8?B?d3RTZXJTQmpUZlhobkdRdUk4SThHeUtjRkZXUVNBb3JIMEQ1Tnh2SDJ6NjlI?=
 =?utf-8?B?dWRWK3B4SkdESFJzazh6ZlRaMnpMVGp3M2pwTm0xaWJQUnl6RHZ6bVpBaEt5?=
 =?utf-8?B?S1h2VVF5REFGYXpjcDRrdUtQVnBmZmEvSmNYWW5wMUxEaGtmUm82S2g5U1JF?=
 =?utf-8?B?MldWaVpZODBDNmsvSDFnbWZIS2VSZnROQnFueExxSjFCUE1uTFY3UGdKSlA3?=
 =?utf-8?B?cSsxd2c1c21iakFlK0M3KzdaaW8wZ0FsZGlsZjM2TzA2T3BKY1FJSUpxdXFO?=
 =?utf-8?B?eE0wRUNXRjRKUDJvZEkycTA4VFNnZnA2blpxZkR3RmFCZUhiMWU1dVRhTlB6?=
 =?utf-8?B?d3BBdUxIOUVWRk45VFR0WWozOThGb1BGOFlGaFF3YjlkNzFBR25ZUWw5UmRQ?=
 =?utf-8?B?Y1J6YkJXM2lMSFZZNDNxc3d6Tm5mSzlyaEZSYURZMmlURmNudmRjRFpxbnVF?=
 =?utf-8?B?Wk1LdnJDSWNUUjF1N2JwMHlmRlBsMzcxd2lhWVFKQ0poTGpuQmZXSW1wOWdM?=
 =?utf-8?B?VzJVcGp5TEw5V1FXempnbklRQWkxblEvREFSNi9ITXRaanp2KzB4b3NmVDZz?=
 =?utf-8?B?R0tiWWFmOUhwOWhtM2FiVzhJdTNKcnhIYkxTTDllR0xETllzOVJWZU5IVUFE?=
 =?utf-8?B?MGwrZ28wTWVMeFUxZkNpa1o3OGNiQUg1OXVQWnBoeU1HSlVwc2VGUWswUkFZ?=
 =?utf-8?B?UUpxeElsRUFXREsxOWk4U2N4aS9ISmNuOXNlZ2dGeFBXOGZlKytzOHpESy9v?=
 =?utf-8?B?UFpNQXpTTWFLR2tFSTlNY3YyUG1OU3lPbGJxREJsL01zZWlTYkoyZXcvbTcx?=
 =?utf-8?B?YU44cWhSbVgzaWdOWk9kTXJLQk9qRnB2d1V5a25jRDlRTmNVTDkxZC8ybWNJ?=
 =?utf-8?B?UXRUZExmUk5Zc00vZkhGZnhPcGFZczY0RVYxSWtJeTRucTljQUI4Q0cyYzRR?=
 =?utf-8?B?V0RPY2JoM3R4NkVNbVh4UVh4akRJZGpEaGRuem9weFkxeENkMEdpU1E4NVFt?=
 =?utf-8?B?TWVyS3cvTndGZDV2TFNxWTFpN015Q09FRWlHczR4bXh3Y2xTRnQwTi8vZ2wz?=
 =?utf-8?Q?WknZw5Brdyc50WFpReSX2iN/s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4bab27-9ac6-45fd-32c3-08dbf23ad072
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 06:57:42.3344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4GFAGKO7kBO9Xx7ZRZQmodYEjrGYvD5L4IDXGHkntRPzEhBZcK7F3L5Rp1HEMm6hsUTUtmaQXFGmHHGNi1LeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9007

On 30.11.2023 18:06, Stewart Hildebrand wrote:
> On 11/30/23 03:33, Jan Beulich wrote:
>> On 30.11.2023 03:47, Stewart Hildebrand wrote:
>>> On 11/14/23 04:13, Jan Beulich wrote:
>>>> On 13.11.2023 23:21, Stewart Hildebrand wrote:
>>>>> --- a/xen/arch/x86/include/asm/domain.h
>>>>> +++ b/xen/arch/x86/include/asm/domain.h
>>>>> @@ -503,6 +503,8 @@ struct arch_domain
>>>>>  #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
>>>>>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>>>>>  
>>>>> +#define arch_needs_vpci(d) ({ (void)(d); false; })
>>>>
>>>> See my comments on the v5 thread on both this and ...
>>>
>>> So, the goal here is to return true for a PVH dom0, and false otherwise (for now). Since dom0 can't feasibly be full HVM, and is_hvm_domain(d) returns true for PVH, how about the following?
>>>
>>> /* TODO: re-visit when vPCI is enabled for PVH domUs. */
>>> #define arch_needs_vpci(d) ({                       \
>>>     const struct domain *_d = (d);                  \
>>>     is_hardware_domain(_d) && is_hvm_domain(_d); })
>>
>> Looks okay to me, except for the leading underscore in _d (see respective
>> Misra guidelines, merely re-enforcing what the C standard says).
> 
> Right. If I'm interpreting the standards correctly, it looks like a trailing underscore would work, seeing as we haven't adopted MISRA C:2012 Dir 4.5 (yet?).

Adopting the respective Misra rule would only affirm that we should adhere
to the C spec. Us being free-standing (and hence no runtime library involved)
may have been an argument towards more relaxed treatment, but imo never was a
good justification. And yes, trailing underscores is what I have been
recommending, but some of the other maintainers don't really like them
(without, iirc, indicating what else to use as an underlying naming scheme).

Jan

