Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38C7D390B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621499.968020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvhY-0006Xv-6m; Mon, 23 Oct 2023 14:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621499.968020; Mon, 23 Oct 2023 14:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvhY-0006WH-3n; Mon, 23 Oct 2023 14:14:40 +0000
Received: by outflank-mailman (input) for mailman id 621499;
 Mon, 23 Oct 2023 14:14:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvhX-0006W5-84
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:14:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f6facb5-71ae-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 16:14:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8830.eurprd04.prod.outlook.com (2603:10a6:102:20d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 14:14:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:14:35 +0000
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
X-Inumbo-ID: 7f6facb5-71ae-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVIhtCHb5YHlSAiFyMnqVb5ow6UHTxc324ECiQ0ROcUe9p7tvKhZfmNIhWl9eOxgYCPXLs04y7l5xtFnZ3rT7VwERQRz6M0FZldzy0JLinhg1mNnZy87yv92ClMFym5g/1KSq9uUDxX6zMQoJ5ls0yTkW7RBjYvcCtFEBIAG2jLanlf0VGZ5TH2881b0TUSUBDGuY1tk8FpDEDJBF8T86AWkgAderPxKsDhjeCJBBS9scuXFIuZ4ralZMAAdlUIl7NnllSUVQe9lNqI9tx6mRNUmdyOmlJ2NTbASRhx0sjkHSjKmmpvQIgOVYJ6heQhL8QMYOt5m9BNQW3NoyKsqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKkrasVKTla8K2noSDagJeQ4zBLt3sPyI9dO5Gg/sUI=;
 b=OMgj9r4+r3zN//6tD0E0HLCSDfaRAstpV4bwY2hJEI5Ib/YANm+vK7JAHuPQxuYQidLFj1M1FaRLWWOaUP3jdQ+5NpbtUOZT2puXTKLp21FRePuThDSER5e5Y1ggfaOu5tLMzPeYmxHTG5mg/vgqyhhXifuOmfQeTW4qNA3Ri+6YukZaaNQXz+0+xHcjJ4of75KIyWbZgv8Ux9m76Szk/SJz2UWObTRyjgBPKjbpxaP81EPrRL0NFeNRbTUEtYrUKdeVektNwqpNob4KB5XAFVZ69yww+Jq12jDg1jpwcoKSZmaYccK48rC0BVS9ydag/4iWJIKOE1+ozA2PhVadxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKkrasVKTla8K2noSDagJeQ4zBLt3sPyI9dO5Gg/sUI=;
 b=QIcg+ngxgDkzoLFkDUH1VrsDaB6QJCjk8IDD0LJJXO41QdD6RVHgtunVDyC3e0Moe8NeTIKyuIrRbEowts0NWsmLP7NTYb4/pAQSpmZiMUmbLPGqkqmrSSAkDFXT3ZJTQMfe1E3kbTbLjXc+utGP7xsRgLG8PRoY1Yv4cLCuygRVMHYmzgL3V41qQ60QG9cklh4xkrXmeF/9Gvr8GnUujX1UlL7QltegTBpXO7r6zFMm9ayvrvb966KNkJbO91TgjlDx49b4NAASbu3TnI5ma6RIs5d5AGQnXpx81VeDeysUBe8znMdjGA/C5Ii0EdxeHENb4t+Tq6hDLoF3UU6u0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e618032-7330-27ac-5f84-a9dcf7210876@suse.com>
Date: Mon, 23 Oct 2023 16:14:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 3/7] x86/domain: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638486.git.federico.serafini@bugseng.com>
 <95f9938db062ac2ef10e10790fd12a987eaa90b1.1697638486.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <95f9938db062ac2ef10e10790fd12a987eaa90b1.1697638486.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0cde24-36e1-4434-8bc7-08dbd3d262c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	626wHGm0BeBVOrx1MGMP8Sg6+DNhnxD/1kxTZPt60jcqvslm7SZF0gCj9/3yfsCAYamanaphBJMAffNgdmzPH2yIxFhJ1iGl5+RruKrItk8OZfb+Q4ZfXjtuJb3NDaWhruxbhEiAzIHKkALFpge06Sk2Q+WQljjDtJWJ2si5MATE5EcHC3s6gIQ5DKGRDpbAtJft6TXCy/2+YlOkA0akQUdg8VsM45Rj5X8hi49MjDI2Zo3q1Kul3gAFxeRrbElK3XxXkOGgl7nOEyZlUZQVQS3netLinrbyZ1d6gygG8MwQS5vIH1cKYmQSjq5NUDogA5tIUvN2XP1/1OTFPA3+iPUJ4lhVQ2lbIscOv6vugCU/3DJtJqbJkZKQQLgfd6ac1rEJwDVj5nFEz1C0fdrYnNYVs5C1QtihQYhQ864Qxj8lUddqx8MvUsr8jHy7LlXhF7OxABUzhT1/pyKjlxZdQiS2ap283quJp3NYx3LMBqvwVkOyVttW0EE3xzePA5XrqYIgft9fTsVtjjldldCrWTwVxAMh6V8VHb3Eq5kOigWb3nxxOAfIizcuV8LRBV74tKOWlHqxn7gKfujOvKLSVwdcE0qQMQ3U2XxS0sYDuyafUBwcrZbElBrUuTPXGHHQUaq4e6yAKasb6MRXdDuvqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4326008)(8676002)(8936002)(41300700001)(2906002)(5660300002)(53546011)(6512007)(6506007)(2616005)(558084003)(31686004)(86362001)(31696002)(36756003)(38100700002)(26005)(6486002)(478600001)(316002)(66476007)(66556008)(66946007)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEpGdkpyT0g0NDNDNmdac2V6TGYvYU9qRGRCZkxVSlhJNlV5Tkl2M0hMVktR?=
 =?utf-8?B?dUxBSitJSy80YXpGSU4rTW0xY3BUY0FyOFp4bmx3cThlZTFZOGJ5dTJFbXNT?=
 =?utf-8?B?cFJDRmtYYW56ZHpaR2pGa2VXTnRzK1ZsSy80LzNGY1VoZ1pyQ3VTVG1kRnJF?=
 =?utf-8?B?Y2szRjBpaWF6U1ZNN3ZDeGsrUlVud3F6Um5jUWJMbXhKRHc4eDdmb0l3Ny9V?=
 =?utf-8?B?VWlyMXBLN3BGSGNYMndYMFdxelc3RzE4TkhTYXZhNkZ0eHhkTW5oUWYyY3No?=
 =?utf-8?B?MjdtaEFNb0xaalJESDR5TVNUbHFIZ3kxa1g5Q2RRd2NSYi9MRGlKOUs5NjJs?=
 =?utf-8?B?S3JYZ0VRZ2EvNUxFTXMzNVE5MkRmSTVEUWVDRXlENGdkUHJZcCtRZnU1M1R1?=
 =?utf-8?B?cm85SlpXbmJqR3NJeE1IcEI4TG1VRWtSV3M2blVaNVh2NDV5RVN3WWFvS0N0?=
 =?utf-8?B?eFhWWGUrM0Z2QXlFZDZXdzNPTnRiN3UrNjZTNEd4RHFZWnVzMlIwQXhVUHFG?=
 =?utf-8?B?dmErMnFwMExjZHFlb0xDeTBxUWVTVHh4NTZTWUhFS0p5cHJEVDROc05PUldt?=
 =?utf-8?B?TmN2ZWl1WDBndVBkMk4rY1ErNmNmR0E0Q1RNaFVvUzFnZ1g4dWNsd1hPc3Vv?=
 =?utf-8?B?NE93NHZ1NDQ2MG5qK04rOFNuSUsxUjI3UnFDbWpVOHExT1NZNmlLQUNlSlQ3?=
 =?utf-8?B?bzlqdlc1clExa3lTc2RFMmp3eHg1a203VHpzOVhZRVd6djBiSDdYSnZlUlpI?=
 =?utf-8?B?T29oek5ZaVR2aFRRa1J1aTFVQm92c0o5VnZ2VHRVdUgyNWpFazVOSU52VjUr?=
 =?utf-8?B?MURURFZCL0tIUEM4TWV5cjBuM2dheG5DVWswR1hsUC93OSs2bUVNUllmekJl?=
 =?utf-8?B?QWx0MEJGeGdGOXlvTGZrdkdNOWwrQ0EvbzU0NktkTmt4b01VLzZSeW5OSU0x?=
 =?utf-8?B?a1o5TUF1elVVZmljbUVKT0ovOENWdVByNEl5eGFFLzhKNDdSSjA4M094cGY1?=
 =?utf-8?B?Nmxva2xpSXRZaVBGRktoWDE4S0haeXRDTGZBcGJPTmZ0M2lsWVg0eU1ieHRx?=
 =?utf-8?B?ZzI5UDl2YmVaclNoSUxvd2RFQ1dNenpVeTdORlVnbDV2Y0pKN1lTblJxSXJ1?=
 =?utf-8?B?Ti93bkFnVklPTWZydjQwNnl1aGdudnU5UUJYbHhxN1gzdjdITXBiYTd1STZB?=
 =?utf-8?B?MGlnWUltY3hnTmE5SGtrMW5wL2UzWFd4U2ZjemczYm1LNi9mNGRlaDlURzhG?=
 =?utf-8?B?Z3V3VjdhcFpQTldFM3N3K2dwelE2TjR2Y0gxVmFvSEhlL2FseVBGL09Wb0ZJ?=
 =?utf-8?B?bS8rNVRYd1FpM2xsTDhDZE9iTnJjYkd2R0VuR0ZBMHJNYWo2NkwrcENVeGhm?=
 =?utf-8?B?Kzh0YXJDT0VQMWh0NUVWZWlIVm5LVzdOcHVUYlJnZmQyOGNoVURHQnhZNTNu?=
 =?utf-8?B?Y3QyTkJkM0JNdW50T3lVQ3VMbWlmVnRUd1BEanl6WHBaOXduNmg3U2ovQ1h3?=
 =?utf-8?B?aTdPYVNFV3doN05IWFFBNTlKUk1MOVZtb0VnSno4cDdlVE5WYUlqZCszTi9t?=
 =?utf-8?B?VXI5aFU3S3JxbkNMZzJtSUVMYWxMM25Id29qdVFhUGdqZmdIeEdydGpXcnYv?=
 =?utf-8?B?L0JhM3BsaU9VVW82UmI3eGowYU5rTkRlOHExUXVWazZ6ejN3V2NxekhiVEdq?=
 =?utf-8?B?R202cmk0bU9iVThTVXhDVHVqLzVjbmkzOWYwanl0T0hadG9iMGJkV1JoWkor?=
 =?utf-8?B?dVNZMWFxRTJiK05lcG94TXp4WXJjK3FUbG1oclJnbUtaL1ZmLzFpaTJod29B?=
 =?utf-8?B?ZWZKbHFQN2h2WXdRTDNFWnloUG4rbFkwRHUzK2tNeG14dXBTZmxZWWkzRTM2?=
 =?utf-8?B?akhrUC9nZFlxckVaU1djUmcrS2tSSit0YnA5L083dVJsUUJQTjBtS0VhK0FO?=
 =?utf-8?B?N0N6V2Vuc0FMMkVFTU9aUFJBOHZETUJJRFdVaHZhK1dvS1loRmdmNmt1bDY3?=
 =?utf-8?B?WGk3bVpKaE9HV241Y0ZYZnpiK3Fac2xpYkk2ekNZUVJ4RW1OblZ5enAxY3Fr?=
 =?utf-8?B?d2MxbHNpQmdUTVUzS2tOV3pGUFFNcmsrTHA1VncxVURGWkVsaWdSYk5pM3dl?=
 =?utf-8?Q?MEltN9MyQCXH2+qzY0jNQLlY4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0cde24-36e1-4434-8bc7-08dbd3d262c0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:14:35.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8YFKfWe13vI6qOVc9GQrc9u/6efVqzh29fL99FVgAnDtUXgw9YX2Dv05Sjqohz/eCdQcFkHpSTdjNIhGGYQhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8830

On 18.10.2023 16:25, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



