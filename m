Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6077108E8
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539483.840401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27Ji-00074Q-7Z; Thu, 25 May 2023 09:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539483.840401; Thu, 25 May 2023 09:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27Ji-00071u-3M; Thu, 25 May 2023 09:31:30 +0000
Received: by outflank-mailman (input) for mailman id 539483;
 Thu, 25 May 2023 09:31:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q27Jh-00071m-Fk
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:31:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe13::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecaa2593-fade-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 11:31:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7043.eurprd04.prod.outlook.com (2603:10a6:208:19b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 09:31:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 09:31:25 +0000
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
X-Inumbo-ID: ecaa2593-fade-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia345a1+gL+X9cnlb+2pcNPA9HfCDKqOXywG6Bk9BKAxGBRhCTDkn/GKbx7HhO5BkMrEac1JS9GvIfHn1wwPE+UXIbCxsija5vzPJ0O1D5Mq4EKkUTzvHEjhvf2uZ4kN3wtsPwnj10swDT44hqsML+hcvLVpIkqbG2Ory1imCB3RLtxBrGHmpVjA9WJo9xIXQLYN14mfElEzAi6dQqkuyOXS0Jg0UNDf1Mkt7ZR+BHzRrvSbwaFKin3jundPuhPujriCEwsWUHa56v44DplI6WC10ajE9/LL00XJbWm0VyGfDTrvcC6PGlUWEA5SUyWy5CPoopVe6L2/AXBmNAmi4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KY2ydO/NQVS4BYUFFczmONTLzCJLHomyYln0F7WV8c=;
 b=aStlLGmXYJO1Xw2vfPV6pZFX2vNkYyAZB4YL2Eu5Bxw7Emp7IdmtLdZw1X0Ljjdpro+yo1GnmfH343j3inPaoIrr4zQmxvdmBfnTRJZzZljptwaf2AxcDljlJHB4EErYuSGgGnkUre1mHy+kCq/OssH86ziRkdsd14rSNd0I+BvI+r5K4LYBk9JtdJreNK6hT883H1DRFHG9xlbR5Ue6dwxStP7gGY892EPKebTXVrm3d/iSUZ2psjiCFidaDGSJums3T0L1StllZSi4ZJQQJQi8k75kEuslryltbtsZduWm2w4V8muUROF98B4O9ye5iIPHqV+jottS39h3qXMPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KY2ydO/NQVS4BYUFFczmONTLzCJLHomyYln0F7WV8c=;
 b=PrZCIlhQ8H3K/lg++pKCFuZ4wokQRmE770kaextXNKJXT3jE8Kkx9rNLa40uttGgA+sC063kLAfe1507sXwd55cVe6pkgtO+dsB0rE0suSpnZOwGWOEFs9ichlYVVzIW00DpNmhpTYKQD7zS5Ga5i87dSFK0dFIG0Jx/Am7soI4PxBZn9KMPTd5IUgnDe03JSGNG7mtxDVO2R6Jc/06H7IuqL1ctrobjeA2lyI3ikNj50sEILsUYW6Bn+RwrlvodcFlg1xYyTAgnNCjUmdmpUYk5R+mzdcZP0EHP0KF6tgSmTUworUUAqwxzslgIytUT72n9ha3BvS0VLt28hDLOXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a2e6371-97a5-397d-ca1a-247b610b49d3@suse.com>
Date: Thu, 25 May 2023 11:31:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Peter Jones
 <pjones@redhat.com>, Konrad Rzeszutek Wilk <konrad@kernel.org>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20230524160558.3686226-1-ross.lagerwall@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230524160558.3686226-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: 47cefac9-c554-4532-8a88-08db5d02cf2f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xzrecXDw0dci0oTr3gIYdPQayGjgE3Jt4SbzyWT2nc8HgI2l1tphpKKHL3EWyFbhQgOb6DZ5e++/p+mbcJrkEqoiBR02mqD9FfBIFElDm4tO19G1T47KbHhObCn0OkHyX8FJyxzk9fA6UefbZq8q2+0vPqGPh6aQgC77eE9xgyJa5Nl2jmlGcY38PsrBMMsvGNlKED1pKT3VckeMGuXeqhfj0pPV3xmssLj2BfwVHi+T2QSaA18UgmSnZdQ2OIJs5b84e02PEYQXf4frfTrWzn2iQEGktg0EtW0asO5VQn6CvCQhbhCwk0MGPmDQxPqBYX1HCXcuK20z89bWsLVcD7jORIZlWDSBLTkBlRiSaTD09Ey9bqg/CpbYRDnhSaFEFZZlKxsKBVoxLjxKR9zJ6N7/uYVpXGXjkGbaAi3EzLja0HbOh7DHWfFFlmkdk94F+6Z4/QlSQ/auJCXhYioIdUpL1uHTxFakF2z9EX/zsOZRf+qbyySs6AfOuyh6xE7CbljQ319ZiNYjaoIC6O9vumG+xW8oK+gwfFuK1JmKVaC55Gc2jx1TV0Fcvmp7qOztBY8NC1LhMTt8eDfEnVXplYp5UwsVKIU95VDelWCiMan7uKTV2LJk+qR0v1tdrttzvnjc8EfMjTyjBZg6ou+2Sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(66946007)(6916009)(4326008)(66476007)(31686004)(66556008)(54906003)(316002)(478600001)(6486002)(41300700001)(186003)(86362001)(53546011)(6512007)(6506007)(26005)(8676002)(8936002)(7416002)(2906002)(4744005)(31696002)(36756003)(38100700002)(5660300002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEtDVGVVUW9iR1pjZ3V2NnlscnF5aU1vZENWaThjSEtXOGRFZlhLb0pjUjV1?=
 =?utf-8?B?KzkyanQvK0N4L091ZkJUeDY1MnRjd3B4dllmRWxYT3BHNldsVExsVDArbUMz?=
 =?utf-8?B?aHAvVnlXendpMW02cTNrU3FrTUJIZnVHM0JSY2pyUERIRE1LdlJyQzRvSGxH?=
 =?utf-8?B?SmY1SjQ1M05DMnpoQUVMbjdZZzhyZXQrd2l0K3FGeVJUU2VDdW80ak9jYnk4?=
 =?utf-8?B?T2N2ZXJONXk0L2pFclltSkdsdFNIUmR3RVprbERnR0NPcUk1WHZOYTY3OTgx?=
 =?utf-8?B?OGdNc000MU9qUHhiRnlScEF1U3lmdEltSkhSUmxpbGZTdHo0emZCNGNBUEFt?=
 =?utf-8?B?TUc4NlRvSm9kMDNNU3JZUFhmM2t3OTZPTVZ6NWVmREo5d0I1TDk2RWdDem5v?=
 =?utf-8?B?a21MMHl3Ynd3R21tbFB0ejNLSS9MbjFpcHFnTkFiQjlVOUpzRWZQR0dvVFpH?=
 =?utf-8?B?c2NjdkdOY3R3bFV4eGNCOE5RVUVkUnZFQ2s4TTNUcVFYWkpPYmpnSm8vZC9W?=
 =?utf-8?B?aWRORmovb0dJdnh1TGNNWGZSeXFVUGNNNFFMOEtORjNKd3hqczQ1OFhTSzNC?=
 =?utf-8?B?cFVsOGozRWZYVks4Zk9GNTY1K1lIQUk0YWFhc3lyNHloM1UrVnpRVFhuNUFD?=
 =?utf-8?B?empzYjR6cXV0M0JkRUFxaENzVFJSY1ZJNkd4NEhaYXZHbksyM29tSDJwWGF6?=
 =?utf-8?B?NVFHMng4NkhqcDBmYXY5N2VDRkYyVnN5MjVWeVMvL1AwZVJPZ3BNUkJvc1pi?=
 =?utf-8?B?bU4vQUJqZXdjUVJlZ0JUZHZZakkydXRmWnlrWitaamZiTlBlRFZvSjhZdVYx?=
 =?utf-8?B?Q25LR2JsbFRwb24randhUCtacUozQXljNk9rMXZ2UlRYVW56WDVmaXYyLzZX?=
 =?utf-8?B?amZRcW5LVmhNSnlmVWhXZmI5SXhsaGpaNm5GcTExWHRNejZjdjg1N0JwY2xS?=
 =?utf-8?B?Qld5aFZGcnhqelpoNzd5QzhwSmlTbGgvL2s2enpJSWJUaUpaTFlLZFhManhq?=
 =?utf-8?B?MWZ5ZEwrazRuUjl6bVNqSEhwdURTRUVNeGhGUGN2bWo5aVJFL2ZXRXh5Rjlu?=
 =?utf-8?B?OERLMFFmVUp3YVdaTWsxZkZ3ZVNwd0hlQkM1bEZXVTlsZjMvV0VSdXFLa3dy?=
 =?utf-8?B?R3lNWlJjNUQwRG5UZS9xMXAvRWxNNlp1NDk5YmZ3aG5MK1BTTGhnNjdXS01T?=
 =?utf-8?B?aFFRSUw5WStqWnVRL0lLakZ4SitoOGJuYjY0V29NbXNjMFgrbmkvTVhQOW02?=
 =?utf-8?B?VjRxTVZGVTFZOHpCcStxMS9vY3A2dkVUM09jZVRZR3VoMU0vSCs1bVNEdzYv?=
 =?utf-8?B?clU3aDNtbE8ya2RDNWNoeVVwT2g5R252MlJZRE9OUFR4ZUUvV0RLTU00WjZK?=
 =?utf-8?B?NXorWU5TWjhnT2g0WnAvRkZjY3ZxK295Q3lDbUJsU2xydWhneUF2MHNIK0Jw?=
 =?utf-8?B?L0pLbTQ4MHI2bFB2L2MrMGllZjdJL1p2K1c0bWlvMnJMQ1dkSnMyVWRMS2R0?=
 =?utf-8?B?ZXg5dmdUSWFWWXBXSVNTektNdkJmODMxN0o4NVU0VnZQOURrQ0tXQ0kzcUdx?=
 =?utf-8?B?K2MrdU1WeG00MWFDekNFVzEranY3YUIrS2ZTR1JpZy92UVhtazBJMmpZWE43?=
 =?utf-8?B?YzMxWXNadkcrZkZHbnk2T2x2RXdqa3JUTkhQa2lFOFRJSzRDWHRPaTJOOWVM?=
 =?utf-8?B?YXVlTWpwRUtieWZjaStVMlJGRWZaV2Q0R21udVA0azNwbURRMW9laWRLdmNC?=
 =?utf-8?B?ZEpsTndZZXdxVFU1WElabHRqRzV0SHN2TURqSk9nSU80N0x1dExnODVkSmFS?=
 =?utf-8?B?RysxSlAvRkRkelEwcnJPVElFaTY2QmFzMnM1bENmTmtVcVJGYkdkQWRKRElH?=
 =?utf-8?B?NHI5MWJsZ3gwTEtlT0JRU0RMbm9leGw1N3VUczREZUd1a1ZZT0xYQm1iOWZL?=
 =?utf-8?B?em5lMFRNcmJ1bWdha1orN2t5eldMc2xJWjI4TGh2d011YTVQOERJUDZqWVdo?=
 =?utf-8?B?Q0QvRk9EUGlIZnkxVnhQQklTZ0VBUXQrTnI0QWlHbk85UkwzMEY0NDFRb3FC?=
 =?utf-8?B?WE9wNW1TMGM4amRzMXFGaFpSUGRmcE1lQjllbUpMbDJuV1pYeEJZUktUcnFq?=
 =?utf-8?Q?gD6dYKjhKf+m8RZZXaDhFUrfq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cefac9-c554-4532-8a88-08db5d02cf2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:31:25.2392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0UNId4DA3RnHWL+Rod/craTmySJkpdzQiaqLPiEc+4IpH+YaslOVGIrWKDJu0hJtk9ee3p3vMB1UemOe7xzpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7043

On 24.05.2023 18:05, Ross Lagerwall wrote:
> --- a/arch/x86/xen/setup.c
> +++ b/arch/x86/xen/setup.c
> @@ -772,8 +772,14 @@ char * __init xen_memory_setup(void)
>  	 * UNUSABLE regions in domUs are not handled and will need
>  	 * a patch in the future.
>  	 */

I think this comment now wants to move ...

> -	if (xen_initial_domain())
> +	if (xen_initial_domain()) {

... here. And then likely you want a blank line ...

>  		xen_ignore_unusable();

... here.

> +		/* Reserve 0.5 MiB to 1 MiB region so iBFT can be found */
> +		xen_e820_table.entries[xen_e820_table.nr_entries].addr = 0x80000;
> +		xen_e820_table.entries[xen_e820_table.nr_entries].size = 0x80000;
> +		xen_e820_table.entries[xen_e820_table.nr_entries].type = E820_TYPE_RESERVED;
> +		xen_e820_table.nr_entries++;

Surely this can be omitted when !CONFIG_ISCSI_IBFT_FIND?

Jan

