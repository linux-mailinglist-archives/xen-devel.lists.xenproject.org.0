Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391B4769B12
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 17:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573154.897591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQV6k-00081b-VE; Mon, 31 Jul 2023 15:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573154.897591; Mon, 31 Jul 2023 15:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQV6k-0007zY-SC; Mon, 31 Jul 2023 15:46:54 +0000
Received: by outflank-mailman (input) for mailman id 573154;
 Mon, 31 Jul 2023 15:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQV6j-0007zS-OF
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:46:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77da0377-2fb9-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 17:46:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 15:46:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 15:46:49 +0000
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
X-Inumbo-ID: 77da0377-2fb9-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=db82hSSl1UDEeKTjexjnaVIrIEDHd5gQR+5hhXRK+KPt3ZSF8wZ/oHNGDOP2rEJQpB/TfqoUtzltMGl1hE8QbJG9Jz9QG0AqUhsxV6YQ4au3LhrDWhESFUQ0LUIEhgsxttrAonZ+ritW/7Zq+j1KoKEPCA1feuNhjuRUKt8Ch+vbX0dptTQ42Lz2bX8yCjQ8KaBNR2NMyF50/q/xp4UtQwknqhep3YrpkM77sHvRzlEg/hdUDAr6Go8jctpWmOXNRKV74N6WeonTIbWSBms3HDy6LLZIQn14AtWSKjM2MdKkIRjMOsNyzBwudSdrkCMsADnz1rfLZ4nFhjQdkn1R8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvnn/wqgCCgGq4bR//xeCgvLzQHooa7aIMr8XWnl0DM=;
 b=KRJIgoxaQ8O1TPIJOutUhW3EdgabYhBLXEipKvfmMxeBDMWxRTIDc9jYYYcRssNA+/Z1dCQd2hDaGmQ/IEdWYGAcqnS6lfl/tPX5XKg7z93dNREhVUE6CkCEKkSvfaHdzmkoh+Q6AWmY0LqiknjIz1jo+wJ77CgHXio7PtfAzMv+b7u1/VsZYDlaKWV9WFAjtgz9BdkHyEuWK3INybVErSE9FolORbDQH6VHloWiEsBb4A6A++jYFKdMiGTYwTjQ8kSJegvJRF3sZBj3SWOGfi8zPqzJl+7YojT1SC45r1W689Vs5TeDzC/hepUXbI9LEsae3TXkefZ96ZYwhMzJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvnn/wqgCCgGq4bR//xeCgvLzQHooa7aIMr8XWnl0DM=;
 b=X2CT3IuOJ1HPWnPjiIKl20ktJCYjZxIdDVmq6xjev+vD4Z+En4S6MMtF/3BSMqPyavQ0UQ6FzwI1qF1fp7OaJDlov306W+G9x5dRZUCMARZHCdYuUn82w7Ds59P74TDKNHIVXxud654SYBAHp28ai4goqyPS/guF5um8gnsFdDIxutEw8mKc53Y3Yewx0G1kmwCIVUf0nEtgSV7BWJw3TxcCcf9imXDTraQ6pzSAefUqDlL/BlZFNEvbdtFEx2B1w92lyMP/exLDjqdtiaN072sXTIK369mAaNyp7N3mW2JAzxJf6y0E9Br2hN1JsW9xUBAkOINrfVe915lazODJkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b6b0984-89fb-268e-970a-0c7eb19a4863@suse.com>
Date: Mon, 31 Jul 2023 17:46:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/3] xen/ppc: Relocate kernel to physical address 0 on
 boot
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
 <0802fad2743526da4fe49f0225e14161464f192e.1690582001.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0802fad2743526da4fe49f0225e14161464f192e.1690582001.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: bd806d23-780b-4de4-6416-08db91dd5a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FawtxtySCmpKsD+9M59fdZ6tuqixLzapZQgufimGKX1m9697uRmFrE2Bo0pp7IRn8qf6yENXkbRggoqORaaqFQKtdUrVJKC/mv9ilOTqFvdGJnZyy8HuSChRcr3St91XEWPlP823eigSjp8y4rBhoIi8M7+zjeapr6gBexg/dCzN6oz3Jo2tqryMnm6YXwUlJZHSRNO6/LW3ve8R2gD/iAsDhjb4lYI492/LdkW/LZ+06VZ4NZlj7fK0KA5jlMJu/aAStBDc3PYFjwJD+H0atjg52CgWwDFojVhebVa/B+7esddpV4oTPfs9ER97npWftj36aImLzPjF1B4duQ0mD0nuML8rpk2UuoT6Aj6w+gLNztSG3AVSkkIxYfoQ59hZTxUmOEyfOoZC1GjrtSpY0rtePHVLrnIE5ZZMEmA6C3W4HN0nfqFZrlsb0M8dd9nWizYBcS6o8jIWOte/40XzCfCG+x4eRGqZh2SluA8bvcxjGWxYUQrz+yYcqpuppTEEQD2biWfVK1yovuCFIoYrWPxQvcYXfV20SU0hyNkkuv16AP40HqS5olke8xzUUB6Oi0pQW2s+QcbtU4y3xcPH6OAjSt1si09WxpmWrrUzJKNJq+fMBMd/vGSItXHqphr7wAr9nsnKoenq+G237bHTaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(66476007)(86362001)(31696002)(8676002)(31686004)(8936002)(316002)(4326008)(5660300002)(6916009)(54906003)(41300700001)(66556008)(66946007)(38100700002)(478600001)(2906002)(36756003)(6512007)(6486002)(6506007)(26005)(186003)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmpyUG1zZ2pZK1hGL3YrYmF0UkN1ZHBoQ2VCOFVzNStpdElWSG1nMnNJQkRv?=
 =?utf-8?B?MWdYWXpCY2lHZmc2MFhwQXY5MWtTMFIyR0h1ZXNEalhzZ1ZPQklrQXdwRDhF?=
 =?utf-8?B?cW1rbVZuOVYyaEhDckxuQXpCZGtJYkoyZ2xzbk9oT2ozZWk5WE84Z25wdXAw?=
 =?utf-8?B?MS9nY0hpTUY3Q1hBOUxUdFRWdU1VYVlUb2hKemxmWi9XWnpxSk91NWROK3ZJ?=
 =?utf-8?B?QTFuRUprRHZtRXdHOExZZUJWRVd1bS9OWlFiQ3Z2SGwreFJ0L09CVjNlT2Jh?=
 =?utf-8?B?T0U3cENZUmd3eFUrNzZ4MDlQcjA5N2QxZC96Zkx3VUhoVDVSeDZsMEVvWUNK?=
 =?utf-8?B?aXlmTTdTaWt2TDRzZ1oyN0tSLy92aXZ1UnRZVndOOTN6dG1KeTBYZGlBSDVy?=
 =?utf-8?B?SVJmN1JONzFXSWF5c0hBZThZVzhKZG9Dazl3dEFpQmFZZXBHdHI5MG0rWG14?=
 =?utf-8?B?L3FCVWJIWWZTMWlNUGtaaXdJVForOUtHM3hIRnAxciswY1hZMHNuNUwycks2?=
 =?utf-8?B?VHdBMTdQL1pPVHhjVC9FYzRmTTFna1NJT3I0ZEpjUGxMbkVlSGkrWXJHTkMv?=
 =?utf-8?B?MzVmMVI5SklZMGtZcG9aUER5dEVuQVd1V05jKzFmN1o5UmhBNXRid1hZd0tk?=
 =?utf-8?B?QkRuc2I3eHREeWVqUzQzd3pQUDN1OGhOckNvTzBXMDFVVlRPcitra0hNWHY2?=
 =?utf-8?B?U3NRZy93MFAxT05qZDFNVDVsaGdoeVc2dVYwR0FFOGkzRzBCVmZkTmswYWFE?=
 =?utf-8?B?bmVvK2JyYlU2ZEJOdWZvRlp3NmY3NWhpUmRBZi9sRGhqaWNmT3h6WlN2VVk4?=
 =?utf-8?B?bDVtZnJZUGVaUDlkejZaWUhra2c0YWNXVjBvMXN0NnJ2ZG5vNnVGRXQ2WEYw?=
 =?utf-8?B?Z0ZENFRZcUlmZEFuNEc0L2ZrNFlXOFBZKzhOZWRkamFkZlU2VXkvRVROT2wv?=
 =?utf-8?B?QldYaCtJamRKZnJ1eVFWS2VuMEJBT3BJZ1h3eFlNdmxpZGk1bGNtWjBROG5i?=
 =?utf-8?B?RGhTTFRpWk0zOENQVCs3SDRGdFYzMWtCVS9hdm1HR3laR09iMDhlQnF2ZGNo?=
 =?utf-8?B?RWFmYkIxUVF1TWpxUmhkNXRpNDEyOVpUS2NOOEdwWjgvSmdGeEdxOXhuNG43?=
 =?utf-8?B?ZC8rUDcvVmRrZzN6RkFQdG9oQktpZnloYnA5bzZFYUZzUlRzeEV5Wk5jS1pK?=
 =?utf-8?B?emU5VmwrL0NMMURodFBzZW9wRmRoK1VDVHR0eDVGN3RrNHB4N0RvRU9WYVpR?=
 =?utf-8?B?VzE4bzBwbkl4bTJjN216MkdsOVV0eC8rNE4zZEJWZERLWVJ0WWVzOSt3SXRL?=
 =?utf-8?B?WWgybjdNQnhQOUY0VHFHM2pJSlcvWDBIYWVYTTNqMTFWN0xQc25DbVQ2Rzcr?=
 =?utf-8?B?SmFMYXVHVEQwNktLc1hQY3BSOEh6ZC91U21OalZ6QW81Q0pVWlk3dEJvMkZo?=
 =?utf-8?B?UFYrVUhYMlVyWUFreWRTeFVISmdqVzNQSFlrYkthSkNObFBqWUlHQ0FQRFpD?=
 =?utf-8?B?cldqYldnb2drWUxwQ1JBY0NFek5BMDlSV0xqajh4cityY0FRTGh4bENuNmpL?=
 =?utf-8?B?L3JvUHI1UTh1ZjUxM0J1UWdaTUJiLzI1bGk5UVpPZjlLREgzSlQvTHpNWG5j?=
 =?utf-8?B?VjI4eWd3MmI1bEt0b0kxZHdITXhZZmljTHJiemFQbmVrSXZUdW4xcENsUWFT?=
 =?utf-8?B?SUl6eVFQZ1hLa204MUtPUEx5YTRIdzZpWk83OE81UU9CR0J0YmZPVW9teC9v?=
 =?utf-8?B?V2J4MlgydDFKRHVkZFRxTnh3akwxcWVaTXVOcTFEN0hSaGs0WHd6VXlnVXYx?=
 =?utf-8?B?ZDUzV05TUmpab1A5bTIxbVNxcHF1eXQzdHlnV0hLbG9lWmFnSnFZR2pWWTcr?=
 =?utf-8?B?MDBQeFRMbGVKNWRYUUtvVHBGTHB0aEdNRWZreUhGaXNKTURiM29IQkJ4VTZp?=
 =?utf-8?B?dWNNeE0zdE5xZjBsdU1xZ1ZtK29aQXZENXVyNTRhOGxXdThrL2dlWE1wOU5K?=
 =?utf-8?B?RTg4d3hWMXZIOGdMdE1uaU9SaldVVUc2cDE3S2IvV21rV2dvT2p0cWdJUWZB?=
 =?utf-8?B?cnZYeHUzQ0pwLzVWeUc4bXJWczZzczhXV0lSd0pGRXdycmROdGtVck13Qjg2?=
 =?utf-8?Q?bs58ecnTRhF8AZCOGkYnadPkC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd806d23-780b-4de4-6416-08db91dd5a4a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:46:49.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PIfKdLTV94C2qCUL1p73FGlB6FFBHPelLgfsbILj4rskswbbXU7GKd2QdxpcHrgN8ROXH9Ix8VB0s6qx3N8Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

On 29.07.2023 00:21, Shawn Anastasio wrote:
> Introduce a small assembly loop in `start` to copy the kernel to
> physical address 0 before continuing. This ensures that the physical
> address lines up with XEN_VIRT_START (0xc000000000000000) and allows us
> to identity map the kernel when the MMU is set up in the next patch.

So PPC guarantees there's always a reasonable amount of memory at 0,
and that's available for use?

> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -18,6 +18,33 @@ ENTRY(start)
>      addis   %r2, %r12, .TOC.-1b@ha
>      addi    %r2, %r2, .TOC.-1b@l
>  
> +    /*
> +     * Copy Xen to physical address zero and jump to XEN_VIRT_START
> +     * (0xc000000000000000). This works because the hardware will ignore the top
> +     * four address bits when the MMU is off.
> +     */
> +    LOAD_REG_ADDR(%r1, start)

I think you really mean _start here (which is missing from the linker
script), not start. See also Andrew's recent related RISC-V change.

> +    LOAD_IMM64(%r12, XEN_VIRT_START)
> +
> +    /* If we're at the correct address, skip copy */
> +    cmpld   %r1, %r12
> +    beq     .L_correct_address

Can this ever be the case, especially with the MMU-off behavior you
describe in the comment above? Wouldn't you need to ignore the top
four bits in the comparison?

> +    /* Copy bytes until _end */
> +    LOAD_REG_ADDR(%r11, _end)
> +    addi    %r1, %r1, -8
> +    li      %r13, -8
> +.L_copy_xen:
> +    ldu     %r10, 8(%r1)
> +    stdu    %r10, 8(%r13)
> +    cmpld   %r1, %r11
> +    blt     .L_copy_xen
> +
> +    /* Jump to XEN_VIRT_START */
> +    mtctr   %r12
> +    bctr
> +.L_correct_address:

Can the two regions potentially overlap? Looking at the ELF header
it's not clear to me what guarantees there are that this can't
happen.

Jan

