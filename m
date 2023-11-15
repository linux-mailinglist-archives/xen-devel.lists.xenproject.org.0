Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488A7EC060
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 11:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633550.988454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3D4T-0006j2-Hn; Wed, 15 Nov 2023 10:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633550.988454; Wed, 15 Nov 2023 10:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3D4T-0006gE-Et; Wed, 15 Nov 2023 10:24:33 +0000
Received: by outflank-mailman (input) for mailman id 633550;
 Wed, 15 Nov 2023 10:24:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3D4R-0006g8-KF
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 10:24:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29219bdf-83a1-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 11:24:30 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9468.eurprd04.prod.outlook.com (2603:10a6:10:35c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.13; Wed, 15 Nov
 2023 10:24:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 10:24:27 +0000
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
X-Inumbo-ID: 29219bdf-83a1-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib1sxWhHu7sjO4NnycM631GH/lDQREK2t5qcQGpWUQvokzK2nSlPrTBoNGv0R0xbGR9Y8WF945lsOzr4MPpXYuAVY7xB9aH79EnBJ/TXuDcnF64xWM7ZFh7/4Ly80z7oqIPT9JaSK0bmRvtS+71pmm57SdCLsk3HwqRPaIhPY65VXRJWPO47YnJcni3AVemUgM61ZbZMEcnmNMZU3RnBY1Wdo5Hdak83QKcVBqzQMEJfKIgYfCYdipzjVwKNAJpftTbbrNPJ3jIJAjvTg2aHx44h/tmlg365NkcJwOoor8s1xe+55UlCgom560Ogach63RAJpBrzQE3HncPI2Uu6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2FVv9fr9XR75GmCVpbnT3Pr0kF7q9c4qjPidqUYGyU=;
 b=JEmnCVqblgjgCCx5ipr216vakPqYwaCt7iN5hGyL09RSdjTXsGP9SIZH0FEU3d1xQydW71KM5uCHAo/lJ+24SJKq9FOZWSl6JGcE8c1WuP4PFPjINJSKZ74ESHYdTa20WRGMSTcujZhsDs+jGeYjyOxBe1+/MXiKPffMcoM2HHKAu+Pu6abAa5gfUwnzKu8IVqms3ER7qkzSmDuPXBEvy/3C5NeFycHpLfN5viXucLLcF2/vob6RSxdGZELWPZZJV/qvUp/Eqpf0Ow8atYM2DwpclPOnDgf9k/DRcquulMPslgE45eiiWAdgOhMXViCz0UnEhOpRgNmmlF6L12BzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2FVv9fr9XR75GmCVpbnT3Pr0kF7q9c4qjPidqUYGyU=;
 b=QR8aWk3UoXa5gQzwURDlf779btRLnWqt644ED7M/yhVg+65Wmmvpz5F9pVuMGOvPVaruYoqS0Uyc52Wg3J48RLjtmNREVhW7xnOqCDZWnyhn3Qvdfx3DSqt59Kd3ppguY01ChXObiDyUZ9vAWamtxduHW7TNBD2gLPzYz1sYlwOtaLh6XsL0s6qapNAVaqYAkwHUt2znCVRFsSiwSaMcu2H3O+OoWWdI7l24rqKEU1944A33oWvkonq3r5BuaGlK8bJA5iAGmeivtQbK7kKLR7B1wtrd6UNNK/26RVmMWLCwAO4Pat02wIilWvvCzB0Z7LxlUr93aec0/A561n9ndQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <709c18fe-dd04-4501-bb81-09b48f9aa331@suse.com>
Date: Wed, 15 Nov 2023 11:24:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: remove <asm/delay.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c88a8e-06ef-4d08-9d00-08dbe5c50bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nbTV+ANdhNYbLAk5bmi1d5LFFSTmwEE0K2z9t5eB3/COE4391DNNCDNeFWvw36YMvBTYS95UNudrsuxgmRa9cxB4gHZyDk9iQdrldfD6g3IRHROhLLz9Gko3pJ3Dch34pkzyc7ge3qEw7u9QLXnLuxlOaQ41Wzvnr2eW8Dr9Cr2MCCcaUO8wOoEDqGfX1KFcmRVo2Pc+k3fbkc4l4qy38Ux7g7LFtULqzuZhiCCmXLlM+aHE7nB6EcgaJa4lMpsbruwdAUo6+OGv/FzpdC310/w+qkN6DFR30rRW4cf9+QHmtNmhHBhU+kHYsVfSQe1STz0VkrLICTGuHAnfMQCK+p0ykgAuE3oHUhOUASBL/ctAyI1CyhxW7cUdXL495sm8QZGdZegAWf+eOcf91U644nAqEjpsOMIKf+GcGat7ZE3EWwPmX3gU94YHxQbApaTzjeknnNX2obm16C/rwla3GX3Tr6G2NKMujyfRR6eQNKJriN+tAGKi2/AkZ736CNHPdykGdwEQORSHjNJhzlzX2XG9zVG0zBJp1iRVTzj8eupKzrch6uo6Yz0PHY0oR5nrXXJD9ZpqmS8Mi0esTdBOP/ctjWL1Cc/GmBvRmwkf7XUrKUQYxNPMLjFBoFnKBvcOV1D9FeUyihnNwDGy1XG8Rg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(136003)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6486002)(478600001)(36756003)(6506007)(53546011)(316002)(54906003)(6512007)(66476007)(66946007)(66556008)(110136005)(31686004)(38100700002)(41300700001)(83380400001)(8676002)(31696002)(4326008)(8936002)(5660300002)(2616005)(86362001)(2906002)(26005)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUlEVk9ZU1lDYXhHRlBNb3R5OEdyVmloanhvbnE3TmRUdVhvRmc0NEtERmpD?=
 =?utf-8?B?aXhaeG1zMUl2Z2xqQURKd2ZpaVJzOEE4SlhVY2pVYjhYdFRveXkvWXRRU3Ux?=
 =?utf-8?B?c0lHZFZpS1lzajJCNHBKeS83MW1xRkJIdFpPZTlxMks0bXkzbGVmbkNMQ2FL?=
 =?utf-8?B?V2hYdVpYazFpekdwVG9IMU13VnhLajNwVGxUaFkvc3hMQnFKc3dXUHVUNHZu?=
 =?utf-8?B?WDRyeHpxOVJWa2M3OXlwbTlBSCtsZDJ4QXZhYTM5MWwwRFNvWTgrendEeGg1?=
 =?utf-8?B?Z2tFYkRtRHJ0blVybVRBRlhJU09aeEVhZzJRMzFIck11YXNyaEkvbnRvdk5M?=
 =?utf-8?B?b0NocmpLaUtIU1N2SWFKOS9FeUwyUW1JUUo1eENCOVhxYTVId1kzcjc4V20w?=
 =?utf-8?B?TGZrRVV3REdYTHkwaUNidVRiL0RjelQzUGw3L1F3cmxZMjhWYUdyb1ZhQWF4?=
 =?utf-8?B?M0NVZUhOSzFQZTZ2aDY5eEJPOWdvdFlvYmFYSUZtN0JTcVRIQzEvekEwUjE3?=
 =?utf-8?B?RWE1SnR1Tk9JTnlGTE9MUWQwOTBFcG5HbzBGUWNzcyt6VjJMWGJ2clNKSXd2?=
 =?utf-8?B?dGNUa1ptMDlWNUgxb01jS0JMQXhlK2U5NElLV2lZMnJnc1FSVExSSEF0UzJ3?=
 =?utf-8?B?YWg2ajB3RDFXUG5uREN4VStrSGMyOGVQMHdHMW5sdUYzREZqaXdKVC95dDlG?=
 =?utf-8?B?NVo5clFIOUNDNUNiaUhYcTVaY3RNUWM4b1dFVkVHL0M1eUcveXljODU5bjhB?=
 =?utf-8?B?ZkZrN2dVOHdvdEp1dWdVcEE2bzJPMHhIRnRDSDE4eVl0YVo5UGd5WWFyMGpV?=
 =?utf-8?B?cnM2QXNKY1c0ME83TkYxcjQrSDlZeDRxeUtDSVVzdS9EbGduVjJyNlVaSzVp?=
 =?utf-8?B?M251L0RXQzE4STZhQ2o4MXdiYUsxUzdOQzB4TjlGSWlFUE5iZUJJcTVaYytF?=
 =?utf-8?B?anB2Mjd0UXV3MWVobXdRQjdCWFZjanpjWGw3YkUranJuNHhiU2xHOElxSVUv?=
 =?utf-8?B?VDZ1dnkvMCs2S2tnWmIrbCtCK1hvU1RKL1cwNWNzVTNJR0JuSkN0Ri9ER1h4?=
 =?utf-8?B?UXhkRyt2V0d1bU5BWHZ2Vkw4cWdKQ2ZzTWwwUlJiUU43dEdjblVPUjk3OHJk?=
 =?utf-8?B?cWZrMzlZakNUZ1ZKNTZicWlGaG5jUDBWL2JpV203OUprU3NLbjRLMU5nTmFz?=
 =?utf-8?B?YXZPUWp4U3lNaEl1NGhKSGtHZTFLa1VZZEpMcGRVcWEyVGEwcktjeUs1dG84?=
 =?utf-8?B?TGRQdWpkajdsazBZVVdFRGJ2TjJtWUE0dEtJMnE0SjRPc1dpVzFSbzJpbk4z?=
 =?utf-8?B?a1VtRHF2TmpFQWswN1BsUnE1aHVza0RxeXlCZHlJNjJrbVp4dnU5cXprQTVE?=
 =?utf-8?B?dUFHUGpEa2pyK3RVSXV4c2MrbXcrOWNRb2dXd0c0VXcyWEVtVEJxWThkR2hI?=
 =?utf-8?B?WkVJVGdFYk56YmZsUU9NUGIrTVpZQWhtQVFrZU5lTWNhT2pxcHcxTzJQdHBL?=
 =?utf-8?B?V1BHUHpnd3Z4aHZZclBaT3E3T2h4MmxKcmtta3VvVTZ5RVRQeGxFTlRsS1dR?=
 =?utf-8?B?ajI4RUlwVHlpZjhWdUdPbXo2dFhLc0xpaWtsUE93RVVOa0VKSmdWZkwraWZk?=
 =?utf-8?B?QzFWUHVTNFV6b1lWWmpFZnc1WWFIY0ZVcDIraUNjRm1IN3dEaURjQXpnQWJa?=
 =?utf-8?B?bU9uZVJPS1FNNndkQyt2QTlUc2VtYjdNQnZkSXpvVU11MXNHN25tZ2N0VVJO?=
 =?utf-8?B?V01YUjA0L01JQU5DbGNwMlhac1JEVUVqZVpUVnNQTGZrREk3VVBmc09KdTd6?=
 =?utf-8?B?azZkQkxiUnBZWkRrcVlMbVljYXB2WFdrcXZwVGlPdmNyenRNY042Yms0R3hy?=
 =?utf-8?B?L2ptcmovcFNwNFdJak4xQldLbzlObC9RZklmS25lcWFyTkR0WW5tN1BBVVlR?=
 =?utf-8?B?ZmhTV0ZYL2pvaHlkblFTcklySDBhdDR0ZTczbXZrcE0rWG82OGhEVTBoS1Bv?=
 =?utf-8?B?Vi9FTldaM3loQUViRFhVKzNWUUJlTnUrTWs2QUZHQnRUNEFZKzdsMVArd29j?=
 =?utf-8?B?SWh0NG1pb0JEY3FFS1ZoM1NuMk51Yi83NHRMbVZCZU9KeEVlMGxtTWcyTnpn?=
 =?utf-8?Q?nayEffykTxIo3uTl2SIHxNL6t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c88a8e-06ef-4d08-9d00-08dbe5c50bb8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 10:24:27.3139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUx6+ABB04yxH++A+gwoZAIj+/v8xZB+2w337FJs17k9S7pzGyp7+a3uui40jgy/bCXetYSx+kbMX60D6rn+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9468

On 31.10.2023 15:28, Oleksii Kurochko wrote:
> <asm/delay.h> only declares udelay() function so udelay()
> declaration was moved to xen/delay.h.
> 
> For x86, __udelay() was renamed to udelay() and removed
> inclusion of <asm/delay.h> in x86 code.
> 
> For ppc, udelay() stub definition was moved to ppc/stubs.c.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v2:
>  - rebase on top of the latest staging.
>  - add Suggested-by:/Reviewed-by: Jan Beulich <jbeulich@suse.com>.
>  - remove <asm/delay.h> for PPC.
>  - remove changes related to RISC-V's <asm/delay.h> as they've not
>    introduced in staging branch yet.
> ---
>  xen/arch/arm/include/asm/delay.h  | 14 --------------
>  xen/arch/ppc/include/asm/delay.h  | 12 ------------
>  xen/arch/ppc/stubs.c              |  7 +++++++
>  xen/arch/x86/cpu/microcode/core.c |  2 +-
>  xen/arch/x86/delay.c              |  2 +-
>  xen/arch/x86/include/asm/delay.h  | 13 -------------
>  xen/include/xen/delay.h           |  2 +-
>  7 files changed, 10 insertions(+), 42 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/delay.h
>  delete mode 100644 xen/arch/ppc/include/asm/delay.h
>  delete mode 100644 xen/arch/x86/include/asm/delay.h

Shawn: As per the diffstat below your ack is needed here. Recently I did
(silently) time out on two sufficiently trivial (PPC-wise) patches, but
this shouldn't become a common pattern.

Oleksii: It is normally on the submitter to chase missing acks.

Jan

