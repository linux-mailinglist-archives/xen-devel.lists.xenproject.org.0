Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E107F742C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640664.999204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Vaf-00078X-Qe; Fri, 24 Nov 2023 12:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640664.999204; Fri, 24 Nov 2023 12:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Vaf-00075h-N7; Fri, 24 Nov 2023 12:47:25 +0000
Received: by outflank-mailman (input) for mailman id 640664;
 Fri, 24 Nov 2023 12:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Vae-00075b-PO
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:47:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d11d052-8ac7-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 13:47:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 12:47:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 12:47:21 +0000
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
X-Inumbo-ID: 9d11d052-8ac7-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6szqs3C3opcLwHvNV+KTY7nYwGtGFUQe+YDCq63gBQKvcEyiJjQkvgHvIzTI6kz39uS1rH7Y63KuH0RlTN2MJgzZP0MLs3PxhZr/+RTcICxQ+CqAoO2q6Wg87feiIyf2DLzkKCwuQqde97fltMAgQllCk6HSFqVtSHBr/O/Z72DfNU1cis4mKawjqUsRzLXjb8ifg97Ef6TGYiLvdqzzUJIAyhM46+rHZNBuOmuDsFSc1KVL+Gf0qRKVjR+7XBhTwSOkFmBUlqNYNCDiiqUWNoVE4XdxEldlMId2V8ojdVPafkVKTIJPmUZhjQq2GyysbKTzOQpkOGi4H3w4DOL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeF6dLSwz+mFiIfBIWs4Ze+QNXHHg4PqH1GD9i/IG6A=;
 b=mek5FIMGDBTnwcDq80Zw9arEIexFYv7Yq4Ob4zrLgqSId7o0HutNdG5as1Gqnt8o01lTlXELVvps/pzrczhQj9NYXiUVvV9a+R+xKWXXh0ep2xu53n7T/DCSmj/uAgkKsvGPV6weP02mOalF3h3sX3sP7dfUk/PbDFGKaxVVjLrQntzCWNkom95M0gQ4lyEzRRFvPRngjilRwJ/PjyMYB4qo2J0w4AhFNXmAS0QjrveNw4BnrcCN3DTfFsGbYWfyfVALpp1X/F80vYef2IemjdyjFMljTK6XcTkk6UaluCSnfTkzDGD/kqBCek5RAKCR2UX0EmOsIJshOq3zJR8ZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeF6dLSwz+mFiIfBIWs4Ze+QNXHHg4PqH1GD9i/IG6A=;
 b=v21OwbvRuKrfM0TV+HWn2gjCPdYVdPHEfhWcMHg4o4sg1EgLnR3sd3QIus5oxHQsKKHJ8IDcfn7B+rJtztt68nkykRePI0l/zuhXEAA3wUhxP61afGzRc7bp7ygTf0HL4XfTGilDzoJfeuUga26p3EkWGEqQjgF/ZOjbl+77W+j5satQV6D9t5OoMLS2MexHMDqnzRh/cu5vyECiXi2cdHno47LG/QDqk5NuFQ+BNYEZXUXyRpoqVxR/A8RqIyt3W02s+3txTdQmiWwzpf5C+ALYikM0WM6qNfNDxy7WMKnDjKJeUtd11BfI62jTuvFNiRJOUI0Dxwkoqg7SAlV6Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
Date: Fri, 24 Nov 2023 13:47:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
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
In-Reply-To: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: df3a4efc-fe40-4d01-9e3e-08dbeceb8000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SdrZUaRJh+oJq2Dvxnpf+UEJEPLjKXzL1eaL7iOJy3ojPNBwEPoYzxxjUwXmffaove5XQNjtM6UDPupbnqEyXNHccuqR+29vwVQ244U9ebRgUYhE2gjhq4ko/KwM31jFmB9uvSNzKDkq79QnPRlvqfZV5S4GLu2AYdHKy6P4UdTQW5gQ4keUbo451kS9PxzWCySJcibcz2hCS6CG56YHoj6i+6KZLB3gz11qEZixPh8mDbGY8GZwm+d+E+xdDD05d6sr/iXetN2y9wRjsdffrzZQYBRHduZJO2vWIj2ptbVfaEofUUxWdbT6h0zWG76mGrADIvcqF4LEaI9Wf4g1E7F4icvej7wyAufxo/rDAoen6Lu9FsRcOnyt7zCotvtdWFRKjQIgsT7Mro7i6ftUButRpWEwRROG8o/VKM2urw73RF2uQ1ndRYs6NK/gyXZnL9er2CTJKurT9dyKW341JQdYh6REQQuG9/2QsMtcHWbZnhGQYFu9hOjFIhDAOQ6rb5Wlus4HUdVMu8jKKEYM1+BKi6N6j9EXds53PADrx3M1lfCLgvleERF8qAXPpj9nl9TYKjgq6jlHskEyh6puK0R5uYus85SCojJHI9pqXshBRQJDzUQOY3sL7PjfiE+oXD/yoN7tksCD1D1YaOA0DQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(26005)(6512007)(53546011)(83380400001)(2616005)(6506007)(966005)(478600001)(6486002)(66946007)(66476007)(316002)(54906003)(2906002)(86362001)(66556008)(31696002)(5660300002)(7416002)(6916009)(36756003)(8676002)(8936002)(38100700002)(4326008)(66899024)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlBUZjA4M054eDVTYzNDRTFlMkQzN3paSERNLzl5bFhrMUxvZkk2cm51Z0hq?=
 =?utf-8?B?NVpva012djVhK3RCY01nek5tbW5McCtLMGtKU2wyY2JTN2RUb2hxOEFHaVZR?=
 =?utf-8?B?b1ZRNTVzaFM1L0tjM0ZQOHRvNkdsR3BiNXFLTXlDRnI4eElnb2FCVkhYV1Na?=
 =?utf-8?B?b1A2QXJEdm5ZeklpQjVUZlhzUXA2dzliODIzOGNmb3VQRTFkYXhPWktob25q?=
 =?utf-8?B?TjBlQTc5T0VpaWpOOGVaU0dhSTdmMFV1NUc5WjZXZUxBZHNwTmVTYXN1VnM0?=
 =?utf-8?B?dGx5Zy9kOVlDS1RtQnJTWDZKcjdWZFNxMmVBekk2RmhkZGdSeUFYdVdyUEdW?=
 =?utf-8?B?RkIwWFdKWkdPSDRKekdHUjRSdmEwV2F2Sk1uaFJ2aVhFMlEzeVJiUi9WMy9O?=
 =?utf-8?B?NWpOZUFqYXFGM0lFQk9LRUs0V1BVUU95YWp2NjI1aFFkTlUyaGdyVEZUYVB3?=
 =?utf-8?B?cGkrUTBLaTFxcENkYWhYeVZNNWMvV3U3NGs5Z2lQbmJOM085ZmsybHNaYWx6?=
 =?utf-8?B?Y3dlWk9WZWFaK1JrS1dyc0RKTXpFQnNBQ3dma011SHgzN0NWZDZDaENuS1FO?=
 =?utf-8?B?cjBZRlRIWjE0ZjJKdmxNSXVvbW56clFXcHhqV21LWFpEWkE0QkhRcHh4R0hE?=
 =?utf-8?B?aEo3Nlg3L3NkdFYyWXBwU3RHZUF4V2JCVFNyWC9CbnMwV2E4TW03Uithc0Rp?=
 =?utf-8?B?emVseTAycFNSMnNlL1NDQXA0aTVOQnNNTWV6TlZweWo3djcyZzJFeHNaTVdw?=
 =?utf-8?B?czhoRzJBdmJJZFRsbUF0bzFmaVpSdzMzMkp5RHM4THRiVkU2SEpLaElSL1ZS?=
 =?utf-8?B?RFJ1K29KRnppd1lqU3h0Y3BtbFlBNGRMVUc2Q1VqRmFOalY4ejVacEw3enFz?=
 =?utf-8?B?WGZDSy9NdXZkN3hlU2RNOC8vYm1lU1hFcTcrR2xBNDJlQzV0T29iR1BvUGJT?=
 =?utf-8?B?bUEvRmMrUUw4dCtRRDA3ejJOaDdNeC93ZW1aMExnTjNFVWUxZlJ0R053czlU?=
 =?utf-8?B?akdtMFE4WVdLQVJMcXRPUGtvb3lVYlRpVXBjYk5EZU5wc2dicUN1aG1yS3NF?=
 =?utf-8?B?WFBuUkpWNm5raCtNRjgwTVIwa0ljSjdoSXlXNUR2WTNMMHJjKzA2STRCakpT?=
 =?utf-8?B?bXZMRTBMYTdNdXNFcGdscmF4SFZab3VVMXpMaWEvTXM2Vk5pRUtBWGVqRlk4?=
 =?utf-8?B?aUtqcHRUcVVtci9FU1IzQ3NBUFhMQWVCUXRBbmsyN3J5Yy8zTFU0ZjNFTTY5?=
 =?utf-8?B?aVBGUWt0OElJNjRKeUpadW5XUmp2UFcrOGkrNzRKdEgxM3l0a0dwRHY1VnV1?=
 =?utf-8?B?RVRoVHRaTy9KOTV0bzFRRXhzcE1YTmRubFhzcWJ2MHFxQWNRTGwxVGRXcUo0?=
 =?utf-8?B?ZkpJRkZiVlE5RjhRcFJwM0JYcHhIUklqSWx1V29rQ3phTUMvZ3J6K3lSYzhy?=
 =?utf-8?B?eFFHRmh0SysrMC8wKzEyWFFkUmx3ckpORXhDUHpiK1lRWDdKRXlRUXlHOWw2?=
 =?utf-8?B?QXNxakp2R0o0SkRkZU1iUDRNamNnUzRMMURwVmJkcC9JZExCZTg4OHZZY1hV?=
 =?utf-8?B?R20vUGFIbnUxWTFQd2VxMzdRcll0MlFna0dSYjJ3M3hWOUNNS0Vtd0dxUmlD?=
 =?utf-8?B?V0RYd2tMUXRMOHF3cVJmaUpyUytnSmRyYVVDdDI4REw5dEtmWmo0Zm8xTVB1?=
 =?utf-8?B?RmxrM2NXckNrQjZrZXpRZnBqcjlBaTcwN2FxZ1BGUVdBYXZmMk1BNzFtVXpo?=
 =?utf-8?B?NDVkRFhOaFBScG1OZFk2cmVJaGlJTnJBajBnUUVKay9udUdqWnpxZzhwelVk?=
 =?utf-8?B?ZndhVE1oSDZrMHM0SGY0YU9KUUtFVzVJNnh5VVBZQmhtV1JyNytnWVN0UUQw?=
 =?utf-8?B?bjNLNG9lNDlhc0lGdEhETFlEaEMrT2tLZk53RzhHeTh3YVhQdlFPc0ZlajU0?=
 =?utf-8?B?c2RuWlFEWjFjWkdqOHZqaWFXdXoyMFMvTzFnbE51dmVEdkM3M2JEaEo2azE0?=
 =?utf-8?B?K09vd3hkMzV4K0VVVG1ZWmtGMnRZMWtyM2t3b2YzanlpUVBuZDN6UTVUS3Qy?=
 =?utf-8?B?bUJTRStUQkFjakU1TndsZzJQeTRjR09ER3JZWDUwU0RiVzZaK1pwOERtOE03?=
 =?utf-8?Q?CIF1ob9R1bPoEBj/vE6Ogywxa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3a4efc-fe40-4d01-9e3e-08dbeceb8000
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 12:47:21.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/dAlZFZc/Ps+X5zp+uJJv1gocHKev6BqAm/JTUn8y88mgFyOeReO/sOyPu4Zo/QulNbOugHl8U2FUn6NiL90Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196

On 23.11.2023 15:47, Luca Fancellu wrote:
> Hi all,
> 
> Let’s continue the discussion about clang-format configuration, this is part 2, previous discussions are:
> 
>  - https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00498.html
> 
> You can find the serie introducing clang-format here:
> https://patchwork.kernel.org/project/xen-devel/cover/20231031132304.2573924-1-luca.fancellu@arm.com/
> and there is also a patch linked to my gitlab account where you can find the output for the hypervisor code.
> 
> For a full list of configurables and to find the possible values for them, please refer to this page:
> https://clang.llvm.org/docs/ClangFormatStyleOptions.html
> 
> --------------------------------------------------------------------------------------------------------------------------------------------------
> 
> Our coding style doesn’t mention anything about alignment, shall we add a new section?
> I can send patches when we reach agreement on each of these rules.
> 
> 
> QualifierAlignment: Custom
> QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
> 
> ---
> For “QualifierAlignment” I chose Custom in order to apply in “QualifierOrder” an order for the
> qualifiers that match the current codebase, we could specify also “Leave” in order to keep
> them as they are.

Where do attributes go in this sequence?

> Depending on how the discussion goes on this one, it could be an entry in our coding style
> 
> --------------------------------------------------------------------------------------------------------------------------------------------------
> 
> AlignAfterOpenBracket: Align
> 
> ---
> This one is to align function parameters that overflows the line length, I chose to align them
> to the open bracket to match the current codebase (hopefully)
> 
> e.g.:
> someLongFunction(argument1,
>                                 argument2);

The above matches neither of the two generally permitted styles:

    someLongFunction(argument1,
                     argument2);

    someLongFunction(
        argument1,
        argument2);

Then again from its name I would infer this isn't just about function
arguments?

> This one can be a candidate for an entry in our coding style
> 
> --------------------------------------------------------------------------------------------------------------------------------------------------
> 
> AlignArrayOfStructures: Left
> 
> ---
> “When using initialization for an array of structs aligns the fields into columns."
> It’s important to say that even if we specify “None”, it is going to format the data structure anyway,
> I choose left, but clearly I’m open to suggestions.

You don't say in which way it re-formats such constructs.

> I don’t know how to phrase this one in our coding style
> 
> --------------------------------------------------------------------------------------------------------------------------------------------------
> 
> AlignConsecutiveAssignments: None
> 
> ---
> This one is disabled because of feedbacks from Stefano and Alejandro about some weird behaviour on our
> codebase.
> 
> This one could be phased along this line: “Consecutive assignments don't need to be aligned.”, the issue is
> that in this way it seems that it’s optional, but clang-format is going to remove the alignment anyway for
> assignment that are consecutive and aligned.

Like below if there's no way to say "leave alone", then I don't consider this
usable. Imo we want to permit people to align when they think it helps, but
we don't want to demand them doing so.

Jan

> --------------------------------------------------------------------------------------------------------------------------------------------------
> 
> AlignConsecutiveBitFields: None
> 
> ---
> Same thing as AlignConsecutiveAssignments, but for bitfields.
> 
> --------------------------------------------------------------------------------------------------------------------------------------------------
> 
> AlignConsecutiveDeclarations: None
> 
> ---
> This aligns declarations names, same considerations as AlignConsecutiveAssignments.
> 
> --------------------------------------------------------------------------------------------------------------------------------------------------
> 
> Ok this is it for now, let me know your thoughts about them, ideally if I don’t get any reply in two weeks (7th of December),
> I will consider that we have an agreement on these configuration.
> 
> Cheers,
> Luca


