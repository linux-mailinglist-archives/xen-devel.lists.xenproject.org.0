Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9223B4A9ABB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265606.459021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzIy-0007zr-TO; Fri, 04 Feb 2022 14:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265606.459021; Fri, 04 Feb 2022 14:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzIy-0007wP-PT; Fri, 04 Feb 2022 14:11:16 +0000
Received: by outflank-mailman (input) for mailman id 265606;
 Fri, 04 Feb 2022 14:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFzIw-0006jM-Ny
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:11:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fa80da5-85c4-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 15:11:14 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-FDwd5hQWMrWm5dppO4Xo1g-1; Fri, 04 Feb 2022 15:11:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8615.eurprd04.prod.outlook.com (2603:10a6:10:2da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 14:11:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 14:11:09 +0000
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
X-Inumbo-ID: 4fa80da5-85c4-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643983873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXqhIx2/MHFJxsI/48OJ7e6xGK/hEy/VZK/YNYBaj2E=;
	b=Le5XOZ0Rz5NyeKt1Zwnl343Em6v/EFhngOlF7/KGnRVBWT72UQFr3TkwyVRzeipk+a4J6n
	4Y84k+uuTh/RB9RejwCoEtuD+ql31xXIp41Px9X2YW1XhUpqow1zYkyEMwVIuGjuHt5Jsc
	STOBn2c8qrLexyrZEGcArh/JkfOlhu0=
X-MC-Unique: FDwd5hQWMrWm5dppO4Xo1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOTdsBDW0fmjGxh30NUYg5Fotka5Cq97UuijY2a/1dapSADmS9L4l+MSWR0CZOCw78fE0Shd02Pvm+laGGBDBPzz4Fr6xQj1n4rz6P9RVLIYS5I4Mvn8QfFkg1HFPBbYWLHHyHopiZTAyL/Gk0gRacrNo77bM5406fRFiSjREkmeQujXeF9SHAm1osiOi/Bt0OuvxMhd2u1YRFylq4yu+O2TVnf6BM+fVqwjtMcknM8ehYOHOtyx7QIyxu8kirTxTIiZ5ynBu8grfXAVPItUoTbDjLbO3lDztc/u4QP/ODkrEMUITxGWY0/ra7JpDmrH46F1AZHynvnlvqM/HigE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXqhIx2/MHFJxsI/48OJ7e6xGK/hEy/VZK/YNYBaj2E=;
 b=jI/oiVd804xd9Fix1OTQBzP4p2GJ6uNJq6PaELPTP9YUCsjRfnFTf9vIY2LynJkn7CWBP4YaGzN5c+NwEuINDQQqzfQBs7mXjYY/GS4Te8c3kdmpebcXVWMXokOkQ3bC0mzkD867a8jnboHo25ntRI/UuQKA2XPXFwScGaboJrHQreBeC0Lnk3O6okHvzZX5pbG7Qs+41oaqSrfDRCIzYWOsidqKUaD6sWa1SyJ9dqOLqDs/8PNgzuK3CQqILYneG1hFwcVrZeHMciT1q9TNe6ojRTTqpkf/7nJKy8gQERnfU2y3/FUS9ry8VcrE1Gj6/KFpBJpSxgqybMl3gxjqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6f091ed-4fa3-e292-9a21-a780ec90ee09@suse.com>
Date: Fri, 4 Feb 2022 15:11:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-5-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220204063459.680961-5-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c61b4ed2-5fd8-49a9-ccc5-08d9e7e83168
X-MS-TrafficTypeDiagnostic: DU2PR04MB8615:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8615A0750D05E16F8D984798B3299@DU2PR04MB8615.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s49ACWlJPsQmV+Y7nF3RV+evBb9u2f8EoHn6GPk5nlHwmX/M7j3//6q5rv9VVZt1fV6Js3/5Z4BRznktVZIpg4VREasfXGyw8InLyLP8e6sfzhMeMGJ6gHuBvdNrI8kQ2dqOiPQ2t6idNF7ku/kIyaVhG6Trm+TfVqW9jJ3Y0k/VUfLrgt55Ueq1DGQiKB1tOQg/bFm6pAcoCX7tAohaDqmrxIcT39k31JNnm+F1O3Yaf78f4W9xaZ2WSM/r3iR/PnvbdCacaRuKXT4DcnuQIJZTZGTBuH/s9JyfDBlptHntEZ8mhLOPnVAiKn/mjSgQKaY9rZLqkZP/GhMfK10SNizSlK/kOvTWzvd9lu8VcLFFNC4ECqkhFSnzMAh+uY5i1m1iEhsvPk6QVmvQqp6IGtWHaI8lSy+D7Cf6+/3ywN6xVAK2s4xj57bGcsCKMIeNN3DSDoqvn2sPQs3URmV9VWnhRF0QLIvv+9NTpfD+U/4BFDJJzH6RvhZO9yP+G0hbSDfOjAeufDn0noRUKdkFUKacVmTxWZIxRwbjslEeMFTcSAQh+b3XQf+WSCxsDTflzjolVere7iaohkNrPbvv4Wu57FrS4vxQkKsONfCsm4fgnGXfer+bP8bgPiaO/r4eq5GwMBepwZJ9CqDi/AkJedkbUdjDJrK1JdBBgubhKqtINhPFeOFKFvDFQaCXHgpvTsy0ygc2Pw7KtV6E2I1Or/vml+TiUTHD0kmOcMzwDzq6S9N5iRpyxaKzu4vxcfai
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(83380400001)(6486002)(8676002)(38100700002)(66946007)(5660300002)(4326008)(66476007)(66556008)(8936002)(2906002)(6916009)(53546011)(316002)(6506007)(7416002)(6512007)(6666004)(2616005)(26005)(31686004)(508600001)(186003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVZDVGFYOGxIekplbHg2bVQ1WnY3L0wwM2p0QUZFcHJPQ3E1OHprY2pKS1Br?=
 =?utf-8?B?V2thbGlPSGZDRkNncjVRN2tUS3RaVDlXcDdkTkZMQmpDcFJMelhMSkhwSWg4?=
 =?utf-8?B?R2lIQ3crcVFwTXA2Qkk3RlhpcTVSbjB1SDZZeDlEQnlQbFlVVENYMXhpenV5?=
 =?utf-8?B?a2EzRWtWYjEyNGY5OUkwdlZjcGJKZW9lRWdXKzBoLytmaUhRT0srTE00dll4?=
 =?utf-8?B?QjVrTEQ4NDUvVERPWEtKbklPd2RvSWsveG1teTREQUI0NEJhUEc5NmtSK0xT?=
 =?utf-8?B?UHRsREtmSi9kVFZFUi9PRlhCM2tjYWRnZ0hQR2FMMTgwWERPb1dFK1MxZlpy?=
 =?utf-8?B?a3JiTGRRMUZUTzBSUnM1aDFJa1FQelhIaXFTTlhUbkdWMEYyL2hEZE9rZTlP?=
 =?utf-8?B?K0k2WDNCNWRWdnJ1R0ZVU1NxTG1sdWx4eWtqUFdESUEzYkdYV2hBeVJDUWNV?=
 =?utf-8?B?SENYZEVUU01DeW5uWFdnRFBDQmNEVmxVOU9zQVBaT2dSRDRLcFg5K0FIWTA2?=
 =?utf-8?B?NW5RT0Q5S0VRWFlyYTNiZXgrS2gySkJ1QTVjNXdEandsVEQ2MHdQV2VJdGVn?=
 =?utf-8?B?NWJQYjJzZFNVeUJOU251QjJ2bFB3ZnEvektMKzYxOVQ1YUdZZWtFQ0dONC83?=
 =?utf-8?B?S1ZwdU9pYjN2TmdUdjU1VCs2aUZRYnltbk9oWGtxQ0V6aUg5bWNuOVlLZDZz?=
 =?utf-8?B?cUJqZGJ3MWhDbXl0L2I0bERkcDVncEU1Vnd0c2hyQVphbTB0Qmkza0JqNjB2?=
 =?utf-8?B?UExZMzRkUWFYNzRlNmlMblhXdENDeGZJVU8wUkNvUW5KcXlqcE9OeGxaenQz?=
 =?utf-8?B?VUR1SW95anl0M2Rib24zK0hkMXJ2dW9EUXVEcXJpaFU2RFN3V09PR2N4NDVH?=
 =?utf-8?B?TEpHOFowWHlXek91MkgvQlFsRnVBUEhLZ0VFQTdjRVZlNGJXc08rYUkwN0hF?=
 =?utf-8?B?TjFVeExZUENsM2l3QnEvTWNhbzZuUm9PeXVIelJuSTI4WmsxR0NRdTI4bXJU?=
 =?utf-8?B?SVQxZUl6MXJlTWM1UXJJbGFIVHJYMUtCeXlZdktVSnF6bEJBcEFUbU1xOXgw?=
 =?utf-8?B?NkRpUTJwZytBMkRYRm1XdnVMRk9FTEhraWVUQnJPMWdTZWhiWTVycmx6U01X?=
 =?utf-8?B?MnlacytWOVlkQU9DZjczbW1LYmwwakxsTDdmczdGTU5vaTFOMnpxQWNFaXNv?=
 =?utf-8?B?UjZpMHIzdStvYmdIbXI0bmtjWTRiNXhQN3pZMVBZUmNQYUFrdjNBVThla1RK?=
 =?utf-8?B?dW9ZVWZwZC9IUWxodStFa1lPSHNQRjh6Qy82WUdxNDlNeWEyUElsL3Zha01E?=
 =?utf-8?B?MFJTbm9SajdLV1VCSkg2MDluSndHSllrcVY2ZjhZUDBwOG5TZDVSS3N1amtF?=
 =?utf-8?B?cU5obVRoUnlKR1N1MStFbzVocExZVk81NWhybU84QWZSdXlwejFvMFJGc0xG?=
 =?utf-8?B?L1daNXkxU1VEUkgwcVNSeDJ1VFlxR1ZYaXVyNHc4SEl3WmhmVFNCNFJkV2sv?=
 =?utf-8?B?eGZmRUVJUlY5ditvZFIrVG8xSlRJYVlCd0NjdnA0M3dRWEVqNDQ3WXkyOXhk?=
 =?utf-8?B?dFp6M2NTQW9vRUlQeWtQV0p3OUNSVVI0ckkwU3E4SUJIaWhVeDRBSks0WStW?=
 =?utf-8?B?a1NiYytQbE5jaFA3R0cyS2NOWHhlRjk2MG9wSEF2NXZxRzZQbWhPMFZJdnZV?=
 =?utf-8?B?bFZTWVlDR0RVTmp1b21uUjRybDRKRUJqQ3EvRnRDNldFZmhjbFpVVHhjakVm?=
 =?utf-8?B?eitpQWx3SWxaeGFnNTFMSnBudWRWT0p5T0szQ3pIaDVRQ0E3Vkx1WDVqZFpp?=
 =?utf-8?B?bDFRckQ5aU45aHpnWTRkcUVYVW5MMU9CN2FTRkFoaHdIbmdUMHFWcW9ycUZD?=
 =?utf-8?B?OGFldm0zMUNTM3N4TmkzTDA5ZnlVOGVXQU9sbHJPbldGYUJkeElRYk1oTmJj?=
 =?utf-8?B?Z3ZIMUFyM0FWQThoc09Eci9hM2FEODNHRVk1SVNTTy9zQmZNb2FGM21Ma3kx?=
 =?utf-8?B?MFAyeTFrQUJTZzA0OUJYNDZkY0JRbVBlb1ZVLzJEK1MrQUVwQmh5VmdxOG53?=
 =?utf-8?B?ZlBsRlduaWVYMjZrTFI5RjVBRFRXQlJnc1E2VmFJVnk2cWtYVVdPdmFWNCt2?=
 =?utf-8?B?S0V5RWVtcG1JMTlXQ2owWis3MkpIV2RPcmhNS29RcEQ1MGpaaVJIR1I3TWNK?=
 =?utf-8?Q?iNEsf31j0nVwS8lNdWa0ZKQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61b4ed2-5fd8-49a9-ccc5-08d9e7e83168
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:11:09.8422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHkwEl5c9R4iEYFDArrehkUFkDmuOSvFxdHq00FaA3PcfylDUIXMsSh1x6i2lJv5tYjyoVPH9vRkVAeaFcOEnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8615

On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> A guest can read and write those registers which are not emulated and
> have no respective vPCI handlers, so it can access the HW directly.

I don't think this describes the present situation. Or did I miss where
devices can actually be exposed to guests already, despite much of the
support logic still missing?

> In order to prevent a guest from reads and writes from/to the unhandled
> registers make sure only hardware domain can access HW directly and restrict
> guests from doing so.

Tangential question: Going over the titles of the remaining patches I
notice patch 6 is going to deal with BAR accesses. But (going just
from the titles) I can't spot anywhere that vendor and device IDs
would be exposed to guests. Yet that's the first thing guests will need
in order to actually recognize devices. As said before, allowing guests
access to such r/o fields is quite likely going to be fine.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -215,11 +215,15 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>  }
>  
>  /* Wrappers for performing reads/writes to the underlying hardware. */
> -static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
> +static uint32_t vpci_read_hw(bool is_hwdom, pci_sbdf_t sbdf, unsigned int reg,
>                               unsigned int size)

Was the passing around of a boolean the consensus which was reached?
Personally I'd fine it more natural if the two functions checked
current->domain themselves.

Jan


