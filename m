Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818FB9FB910
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 05:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862999.1274504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPw8u-0005JI-DD; Tue, 24 Dec 2024 04:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862999.1274504; Tue, 24 Dec 2024 04:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPw8u-0005Hm-AP; Tue, 24 Dec 2024 04:03:36 +0000
Received: by outflank-mailman (input) for mailman id 862999;
 Tue, 24 Dec 2024 04:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VW/X=TR=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tPw8s-0005Hg-Ty
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 04:03:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f403:2613::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b25266b-c1ac-11ef-a0da-8be0dac302b0;
 Tue, 24 Dec 2024 05:03:34 +0100 (CET)
Received: from DU0PR03MB9199.eurprd03.prod.outlook.com (2603:10a6:10:470::22)
 by PA4PR03MB7309.eurprd03.prod.outlook.com (2603:10a6:102:102::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 04:03:27 +0000
Received: from DU0PR03MB9199.eurprd03.prod.outlook.com
 ([fe80::3650:95ff:7db7:a5fe]) by DU0PR03MB9199.eurprd03.prod.outlook.com
 ([fe80::3650:95ff:7db7:a5fe%4]) with mapi id 15.20.8230.016; Tue, 24 Dec 2024
 04:03:27 +0000
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
X-Inumbo-ID: 0b25266b-c1ac-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0eokMpPJBvXHvzxu6/mc/LyNgJVJZOUo6dgA/eNiV+475fcWVKuF20qDnOkiIDn0nuax/2xNgntY4eDAgesKIfSvihOcWc7wxonGSO0Yqq+QgiHUSEIIhFzCZWX2X5/+qLFP+H8NnqpLT8eTtnpKhGmTHTBVKguIsNpdwwfpbvCphvOdnRrBJHQI+2WNZY5RYcjqEReXH1+oxeBDIjEdtHHQKyt9vpcy1Wxk4kIYeoTSIOibXn0Ne+gNSGekwRWAHPqvSK7YvY0gBR+zv3UqPQNIrggArE7O1JRkM1WwkojpcAc6A/sqramK1yIT1MGNwxSzHUdkbDVCKv2Fq0pbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxkUq2uyOraVRvPAP3nPyzvXgvL3W9dc+EYuJ+o0yE0=;
 b=hLfXuMTfHkbZHWxSw9B0/WdoIB5lCnv/jEz2h1lKTwGlzyUwYksO36r0hZu6lMDK+6aSFK84wwfbMsuvXg6leQjpG2WbRBte+nUhBqSi4pyalcWJzPRwQlUzeokPsbxRHSsitx9m/4phdeDFZIiPUD48DBm9Tjf5WPSIiUoqIx7AUZPuDjbLpGtp3p6PRNs9bEyHMxKD4u2DeW68QVHcU1kwcltrAwfdVurxLaCmZm+iDsJCrBqBRQE/k2pG/3rKxHg2wNoj52j4al9sP6jfbTfaiA8lYeJg9RsfZzEQULfnTE2MySE79OAX6H67HI1NgkX2wyA4MTYlCrr4vwFPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxkUq2uyOraVRvPAP3nPyzvXgvL3W9dc+EYuJ+o0yE0=;
 b=bxvqOtQ4nEkr1Uk7246tgZ27MWBztagNOqqZZ5AxjXjWyoqiFhjnhR9mygRmifomNayXBb5kXvLMiW9EX1ik3B3wwzPkV+8i4pxb3qcd8zagq14HDuLAmF0Rm2WuQwTsiYCIQj5X96Kl4+gJ53PzDPK5TJTuQbNnkkkEG5AEu8hi8b9H/02X1v4p67ex/1kJwGuAnAk+FojY/8/PkQTuJCvuWHpkpqV34PQp6NVmMDAxNA2XbKJERWl18mw5RS+g/HJC/nh8tZH8s+Jl5mnz6hPMksIokgtsnSYkQsCHF4Q/dsFYQYRuesVnrsAlTFqo2IlLtb+50BDuDADywvKTzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <bdcc438a-3921-4f82-81b1-f58d4bb97443@epam.com>
Date: Tue, 24 Dec 2024 06:03:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <9003a677-e78b-4cf8-b890-c6cf432d5837@suse.com>
 <858496ff-b8da-4dd9-abd1-679dc4f67b30@epam.com>
 <6182abbf-7cc3-4075-9f13-55ebbdef6aef@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <6182abbf-7cc3-4075-9f13-55ebbdef6aef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To DU0PR03MB9199.eurprd03.prod.outlook.com
 (2603:10a6:10:470::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR03MB9199:EE_|PA4PR03MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e1bcf2-6bf9-4922-74c0-08dd23cfeb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG1Da1YzTk92WDlhVkVVSnVDb0J2SnJRTm12amM3SzlmT0lvWXpXc0RMUzVV?=
 =?utf-8?B?NVROK1FOZDVMZ1lsQUgzcjlmOTZROWZJeDBlZUxmYkJKTnBBejRXNlZocThM?=
 =?utf-8?B?ZnBISGIrWkNMN0pIZnRjWExQN3BmMzdOeTdoN21oR1U4VUcwV0NsL1hsbFFK?=
 =?utf-8?B?UXUzSmZvSEtaZEx3aUtVeFV4aVBwNnJ5RXRJODE4VFEweGFCVUt5NFZQOW82?=
 =?utf-8?B?bUYrV1lYb0xZaHpVd205enlmakFqOEpGZkVSWndjNXFVR2ZtQU5CeC9ya2xt?=
 =?utf-8?B?VjdNWU5tdnl0a2swVFdWdC9vT2s4VWlBWjVWcGtTSG9vakdLZUtNR243ek05?=
 =?utf-8?B?N0FrQlMyeHZTeXN3V0twS3RaZWl2QWNHVldJWVhaeVZqWkZ4d3JuZndkbkZB?=
 =?utf-8?B?K0Q0YWRKWCtGN05hOHBWS1lOdWVZTTVOK3J5VnVXZDJTTk1CSEZTVGJSMTBs?=
 =?utf-8?B?OWRaakZjOUlvaVpRNU1iSUkybTBGTmZCd2VCVU9JZDFUWlE4ejFyckUvRUxn?=
 =?utf-8?B?bTQ1b0pzb1dxbkJacmgxZUo5akRBZFBYS0JwOE9xSjNkb0VzVzZOU1FGU05r?=
 =?utf-8?B?UmhyK2hOb2pSRi9YbjM5NlpHMTRQTW5IVGFYRGJWTUMvSURrUURuaEw0U0Va?=
 =?utf-8?B?aUhhbzVnZWI4aW9pZHdLSEJmNU1uOEJUVUMrOXpnazBIVTNwT3FoWFZEK01o?=
 =?utf-8?B?VmV4bmF3ZVpvTXY1ZFZZWlpESVZtemRrVkx0bm1SR3BWN2lyaGNTUDVqLy8y?=
 =?utf-8?B?Mjg3U1d2REhFMDZDU0JZTkY3VkpOaWxJV2t4YStjaUkwK1dXMFVIMS9tTjVm?=
 =?utf-8?B?d1R5eGJqT2pJR3dnUTRsTm9VUWFKQmJCOFk5YVBDUmtZcGNpZDFZeERDeTlw?=
 =?utf-8?B?RWorUUJmMWkzS2ZwRm45U001bUxobWQ5WjBsTjR1aW93M3ZBd0RmeEFvNFp6?=
 =?utf-8?B?eTdGdFlzVWNIUGJVUk9iWk9TdmZNMm9LYkl2VHd3Nm96Z2NoV1diVTc0NHR5?=
 =?utf-8?B?SDJyNzhlYlBKY3hxNmE1bnYzenJIZDZJTTFuLzBpVDZqYjdqa21HZVhzaEly?=
 =?utf-8?B?eHdmam5kZXFLTDJUVnppRktZVEVkZGpUZWJjQ0tnRVZqc0UyaEd2ZmYzUTdZ?=
 =?utf-8?B?cDRsbUFEYnh3dlB2QmYyR0V6YmpIbDMveU9ob2FRSDQxb09jNnExVFpxMXc5?=
 =?utf-8?B?WjNVOXhTSDJhcXZvQ0ZBWVdUcjNnU1pVQ2UwRDRJcmJFSUlaT3ZoWmgzSVBy?=
 =?utf-8?B?eldyY2xjUERsZkVNd0JpRmNjeHpCMEpjaG5TNm9QMUgvcGwzMm9NUjM0RlRF?=
 =?utf-8?B?aGc3Q3BMR2RwMkY4UFpvdmV6b2hZNGR4eXhZNTRENlByY3hpTXo5b0VTV1hk?=
 =?utf-8?B?VWQ2RlBwS2xHb2VCODZ1eHZ0cXFtQUZRYmpLTW9RU3VGdFpldmx3NEVlT2I0?=
 =?utf-8?B?N1VLd0JHMlM5Uk91U3FidjdyeXMvQWE0SGpZbE50NTFhWjVlTFhKUDZtV2cy?=
 =?utf-8?B?UVZvWldzVER4WFRIK2JaMS9lV2RVY1NsLzh5Q0lLbW1BeHI3aDJ6YkdwdFlR?=
 =?utf-8?B?OVFFSzVaODZTSFBKUWFrNE90b2lNQmtOdVVETmlycm1qOWVtTklDcXMraXp4?=
 =?utf-8?B?NHJDM1p4cVdsQTYvanYwSkxVTmsvb0NXdjRxcnVLMWNBSDBtUHZsVnNyVWNT?=
 =?utf-8?B?KzJnWk1UVWJKNGNyWnA3ckErdVVXOWR2Rllmbk5QS1MrUXhGQXNQdnF5US9E?=
 =?utf-8?B?TkNLL1ZHZWlwaWRmenk5c2dPTGk0cEhvWUVsZFdOTnJtYUJReDhTMTRIODRF?=
 =?utf-8?B?N1h2cmt2ZHhSOHE1Q2prK2pBY3NMZUhzU2hHT0lQdkF6QjdHRGJzc1pHREIr?=
 =?utf-8?Q?8yhAK+hTPZoKT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB9199.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bitDTXRQQkQvTUVZbnVqRWFLdGxyUjRENmdLSDhaVnZXNUo0cENudm1ETFNJ?=
 =?utf-8?B?R0duZVZ0MjE0Vlo1Y3UzVWlNY2tlRjFPZWpFOHdRYVFKdmtoTlE5Z25zWVVD?=
 =?utf-8?B?L3N4emtmVzMxNmowalhHeWcwNVZxNnBuZmhsL2YyYkIxbEtNWlZwTmhDLzZi?=
 =?utf-8?B?ekFka1Q2ZEN2VnpqT2RDbkRrT3pmbERSRyt6Vkx0N3BBejR4OXVhaGU4clR6?=
 =?utf-8?B?Qm9hQjVET0l4RVFFbmtiOCsxekRlY09yZXFnWW1MYTdZSjZKdkJoR2FQRFpH?=
 =?utf-8?B?UmdTbFgwV3RaVjJCT21DalBKZGd3U0phKzAxcVIzeUNGSE1KV1FxeFRIS1VM?=
 =?utf-8?B?enkyNzQrZy8yMERRSlRnMEIvQjZCbWp1Q3ZKNWJVUmV6cm1hTklUNUM4UmVv?=
 =?utf-8?B?RVFiM0NNQlByZ2d1dVBFaUwraWxRdWdNcFI2L3JNcGM2VUVYMzRYaVprNXR2?=
 =?utf-8?B?bVJRbVZXc3Q5ZEhjclFkRkxjbVg2Zmh0bzlZeTY1UjNXMUlNcUgzSG9sSjQr?=
 =?utf-8?B?R054Uit4bGZ4WmdkSUlhSExsMTlQSEgvY2tMR3M4U2ZOTjRBT1JobzZPcjF6?=
 =?utf-8?B?S3RCSE8xNUtjVC9VTUZxYm9aNmhNaG9hdTdxWEdTR1NGUFh6TVlMakNIWWFo?=
 =?utf-8?B?QUlFQmFVMElybk53UVNPdk1ZNDBIUFZDVnhhd29odXFHYklZMmtoV0VNWXEv?=
 =?utf-8?B?WGh6WkV0WHV4SXZpSXpzbVdaZDFzQko0dUlHcWcyMDhOMm9lcTdFSTNBeTVO?=
 =?utf-8?B?Z1ozV2s0WU55RzFVNDFTL016dU8walZNQnJ1blNqU2hSNStOb0RweE1ZdXBZ?=
 =?utf-8?B?bEdQTVMvK25uTHcxWDhsSGl5T3duWDhLaFdZTDNTSTgxOENuMFhIb2xDOEF0?=
 =?utf-8?B?bDRaUzB4VTBRZm1GaXhXODRxVkNwc3pTQmNuNEd6MEpCNUd4OUxPemVBODlQ?=
 =?utf-8?B?SUtpYitYRUhpQXBweWk3cVlMOU5iODZYdmtCVnpUcTJjYWtvODRoWVAxbSts?=
 =?utf-8?B?UVpaZ0VWRlJnTmlhRUFVM1pXV2RZbWQ4SGQrMGE4emRDanRrdFArVXVjU3hy?=
 =?utf-8?B?MGdGa2dEQlBTb0EyM1BwbDIvZW05NFdCbS9LYkxJTHBrVXNSbmdPa1JieVFP?=
 =?utf-8?B?SHVGTkxCN2szN25sb0trOFRxZGZFa1pGMXpXWFFlWDlLZnUzNmExVmcrc1Js?=
 =?utf-8?B?cjF2dnp2R2NVU2NyaEZtcjdvNE04ZE9zTktScDNmVmhTRVh0cUtMcm4zeG8w?=
 =?utf-8?B?bWFVMWhrZ0xya3Q0L3hBRmE1V0Y5NXUzVDJMR0JuQTIyMXlMakdDTzYrOGd2?=
 =?utf-8?B?YWlHZ0VTSmM4N2cwclBRTnZWeStsK0RpSURETmVxSFhvSCtJd3FRcWd5L3Fy?=
 =?utf-8?B?TlpFZU93VkxwNm9UOUxzTVlpaG44REdlR2Jla0RJUXJYS0d4T2ZQOENwN1NB?=
 =?utf-8?B?YlhNdDJtTFNUZlo2cGZHaWRFc3hpSkZtMGR5ZTN5UlB2bW4vV1p0TXpJZmpx?=
 =?utf-8?B?QXRTeklHSXowWXZGVmdHQ0hic3h0bEFPN2RNTXpsUU83Z2ZYVWRMUXlMZGFt?=
 =?utf-8?B?cGRQVHlWa0VUMU8yaVlzTUdZLzlBMDMvbTdrUkIybWw0VEg4UkJvbEVhWlJK?=
 =?utf-8?B?NVpWT2JmNWlrNWptNk0wZjJuZWhaakJTV3lNcUxYWFRMU2dQK3paUkF6dEl3?=
 =?utf-8?B?L3R6Q0l4QStxYVNkZE5yc1JzZHFUOWVHblhUVXVkb3prQ1cveUF3Vkt4MjlP?=
 =?utf-8?B?Rk1rWUx0S3lEK0lsU2d3cWRWa01kTE9oQU1uSUZZaHVTeTdXdWhyaGk2VWFW?=
 =?utf-8?B?RU1OazJEOStUdncyTklPZGdKM1p4M2xNM1NkVVZ0cFBMY0t6RVFVN0UzNm9o?=
 =?utf-8?B?bUl1Z3Zwdmd6YXdLR0lhY0R2WFdHNkg0OFd4Y2plNzRuQWYyZThHMFVwcUhB?=
 =?utf-8?B?aEVFS01rR0d2cjhINCt5RUsyVGdqUXdGY0dOVUptNy81YmNoTmtmcmMxRmxp?=
 =?utf-8?B?OEVwZXhjd1hXNE5DaDgwdlkwVjZQNkg0OWdVQUpuNStwdDJOU2J6eURNYWpX?=
 =?utf-8?B?VjZNaDBBSTg3K3JmT3czMklqcXVFUzlPaEc5NWpVK1pIeWNYRkR3bXVmWmox?=
 =?utf-8?B?V3FnVEpmYWRidTF2QlVWZHpETCtsUldkY2ZGR01GZmlDVWJQMzdBbEJQc3pI?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e1bcf2-6bf9-4922-74c0-08dd23cfeb7d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB9199.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 04:03:27.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 459CFsSCPfvWh9IcL05rNnt+awr2tXI/hx8eTRy5tKq4Jo+ylSQRiFBktqTh/qzpxRUUP3/MVO+GBx1125MBRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7309

19.12.24 09:55, Jan Beulich:
> On 18.12.2024 11:00, Sergiy Kibrik wrote:
>> 17.12.24 15:02, Jan Beulich:
>>> On 17.12.2024 12:47, Sergiy Kibrik wrote:
>>>> Allow to build ARM configuration with support for initializing hardware domain.
>>>> On ARM it is only possible to start hardware domain in multiboot mode, so
>>>> dom0less support is required.
>>>
>>> I don't follow this. Late hwdom is supposed to be started by a (minimal)
>>> toolstack iirc.
>>
>> Yes, on x86 it's started by toolstack. This is not supported on ARM.
>> However dom0less can already handle hardware domain initialization on
>> ARM, without much of an additional changes.
> 
> Yet that's not "late hwdom" then, but "separate hwdom and ctrldom" or some
> such.

indeed, "separate hwdom and ctrldom" more accurately represents what I 
was trying to do when using this late hwdom feature.

   -Sergiy

