Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA5456F72
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227899.394288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3lU-0000KI-6b; Fri, 19 Nov 2021 13:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227899.394288; Fri, 19 Nov 2021 13:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3lU-0000GY-3K; Fri, 19 Nov 2021 13:17:16 +0000
Received: by outflank-mailman (input) for mailman id 227899;
 Fri, 19 Nov 2021 13:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo3lS-0000GL-NB
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:17:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0208525f-493b-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 14:17:13 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-Qzj-QfNhNkm5_Zd5VJvx-Q-1; Fri, 19 Nov 2021 14:17:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 13:17:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:17:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 13:16:55 +0000
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
X-Inumbo-ID: 0208525f-493b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637327833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HBWMlAbJXX8nB3i1kv6nCtJbzI2EMPzyOPUbQf45WWU=;
	b=a3zXRkOM1SR/U/2Du9V9aHO+t1f4N4svzOr/8Mi4il1V3hLJ4P9MDtJ4i6OxmF9uHvWYfP
	k6qPDthxYt/BsWoXtisbNVdiCr/EdILfTPVzLA7vEYXiIb3qqopFjEARlqHvfFWAhyLU+F
	s/DegDGh5f2EjlTbUCAnCTT8St6rHbM=
X-MC-Unique: Qzj-QfNhNkm5_Zd5VJvx-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBknChNIYyG9tAHezXaL55IJEiK9VKie5f4sPDxWi0fUlvtPb8igwslDuP0Y7NWPEcnRrpE5K9UImgI3ambp/blWf7qhu7b9s10yXM3p4qg3Ch/vAzRjKtDgaj/CgMtTI2WvEACfIwNFJwoYwdmeleADVvMNaveSpPyO2YyPExr1FN+mnKhozoOy9mMSgJHGhZZm6iM5SmTi75vwO69OZ1jnfertPVsS/mmOw41EaDs/RZaRpLg+mHcjgiy91KkXR8oy03e0FW203dhW2//88ikOwG6+Udyb3tp6K+xMWBNf+p50gwSvy0rPsQ1aJWgyjeWlalH3qNT+wHUiWnHhIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBWMlAbJXX8nB3i1kv6nCtJbzI2EMPzyOPUbQf45WWU=;
 b=inTnNbsz0S7UIHjepdf+I1jyqz7mwgnDHlK7L00SMPjdNDv5yJYDUxod0EYbnzsgjiDzDiJYcc2arECIpuOKSeTAHf7nbtOEbklyZB340Irj3DNgxB6IGisenw2OPnhkTsXqKXTJ+GZXxgDXlMna/aMHpKCGslmLTkolAwP0CZE4rhDqtY6sZqrjHwbP31vlgrMXG5wMDRE3bjJO5CLAx1OMqqHfkLR3zSSrGR1a2bNhyH0HQwyB0bpjYxA7NTslp5JJdvKpsAw2HwtQ+YZwWyD8O2PL+cPyZVc1a8ydl6Z/2xpITMSqgmkZFUa4cjJhHcBIpbZ4QJb7KPCsTVilyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a7f4c3a-7162-8cd3-0879-2f87572f0225@suse.com>
Date: Fri, 19 Nov 2021 14:16:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-7-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39e04a88-8519-4db5-a159-08d9ab5ee45a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB547067B29043897811F1D8FFB39C9@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r33ns/Fa6r7t05J+iL0SMoyjcD8GU1Y7Bck+3tW/65xN15PBP/5JOCL3Gwuibt4Hu5e70JvbKMk++uqFF8tN/mvFivFuubf4gVRJJuvzjwl0poe4iv3U3SVreITjjHda7n/j4695qAZ1Kxye8wCveT0P+K3Oy9XEO03rFHeFWBVsoK0YqmILaV+NcaD5KJLU3oweMHlpTtWSymLuVI0hJJQKXiK50KRDUQPF8afIU1GDv+jvF0hb8BrsCfrvZ7GoY82pQ+JES55/EB0FevG1VeRtVEMP5vUZ3fA2VQz9J/3PoedzkeYXVXHaaZiM39Y4Qn+pW0s91vjD9Jtm93ApGyvPcOchRGNrpvs0BkE+l30MKexvw+gwga5VpjK74N9Pa1CqDD9DfjtIt+fXrPlHQkow7zcTRj9mwPhAcFTYgpPLnfDRXLS0H1o0Cv8HBDDIx39gahVlh88DIbzMyLoDkAnnckooEYovU8rnUV7O2SRXbQ/2Ick2FXb1HhyFltt3WtlCKHcUVNBYO/WHhPQUj11+Njq2AxglBFChr7tA8t68h7JK6BzYpZGES4HMLvt6ifXLN5T4EVmJA1j/dgTdpDglNLfqa2qqVsZfDGOW8v2wn0DRGs6z8Z5Xjz6GsL/Y+11NMnvI42xfmr4xktIgHn62jTte4+3+9rdel7S05mi8dMtDx97UbZK3GKWXiE15ODD+DHzVcG+qKvhJzlWm052NWRjjLelGAWtNJ4xQbo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(956004)(186003)(2616005)(7416002)(26005)(31686004)(8676002)(8936002)(38100700002)(36756003)(4744005)(86362001)(6916009)(508600001)(83380400001)(6486002)(16576012)(316002)(4326008)(31696002)(2906002)(66946007)(53546011)(66556008)(66476007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmkvSy9adThKN2tPNTg3bWZJZFNhaGM0d252b0pTTkE4OHNEbmpqQnFicFhv?=
 =?utf-8?B?ei9YSHZ2OHVkY1dJU1pSNFlldnBiTUl4aVNHdGVwY3MvZ05qYkxJai9ESklP?=
 =?utf-8?B?QWhURzJMYnBnekc5TWhhOThoRytqTkVGZGhyMEZTODlNTE9rYzdUTDFmR3Ny?=
 =?utf-8?B?UXRScktXcHVMbjBidTR6Yjd2MFJzUzRZZ1RBRVZPaVgvK2hOTTVVVU9zdHZE?=
 =?utf-8?B?TjRmYzNqVW9VOGFKc3Q3ZzRLSXV6Y0Y3M1FxVVdmd2NKQUdWeHN2dnlIWmpM?=
 =?utf-8?B?QlEvaXJOWXN3WjM5eTRhQllpdGxPVGhUODhJVE1HTVI3Z283U3FPR0dxMyt3?=
 =?utf-8?B?Q0xJdzNyVkU1NXV4WE1uaDh3WXlVUzg2czRDTGxKaU00OFo0WjNtMGRDWXNI?=
 =?utf-8?B?dWJkSG9DUDYyOVNPN3dRQUtvNTZoazFTRkxzOEswbDg1MEg4WTd5ckZZeWdN?=
 =?utf-8?B?VUdTV3BxUS9pcTh0WlloQmFhd01vTk5teDd2aW1jSm1ZdTB3R1NRcmpsc2Ft?=
 =?utf-8?B?ZEtnTnEzNFlRS20xMFRQZG9FK0RHYzBWdTFyTDhhNmpOczBGRXB4djdkUTRn?=
 =?utf-8?B?dEpGVDNxVklBZm1DSkg4M3dFemlJaC84bnVZOTZWWkJCNlRRa0ZOQTVEZytj?=
 =?utf-8?B?N2s3cjdmREJSTGl3ZFFtK1NwbXBLWlhPc00yczdxL1RsQnh2RFgvcGk3bTNC?=
 =?utf-8?B?ZGhyRFJNbjFTb3UvU0tnQUJKM080Uy9IRkp3TzYveUFyWmpRTnU3TWtCenhE?=
 =?utf-8?B?YWZreFpXdm9lTjMzanVFeklpMnZRVjl6Vk9WUFpjbEhWakptenhlVmlxRmp5?=
 =?utf-8?B?YUtYRnVaZHNkSFpzU3ZOZWlmZUFHQlJ0bFlsbTFOT2lWdEV5d1o0VzlyU1ll?=
 =?utf-8?B?Z3FCUUpLYzNGU0hlZlIwWkJxa3M5OUpOVTdZYkRRQVFnb1NHazRzUTlTM3Uy?=
 =?utf-8?B?cmY1NllmdVpiVDdRTThvcE9XOVlXa3BhS0o4TGZEQkNja1VnMldhRE8xZEo0?=
 =?utf-8?B?d1V4a2Y1eHF5MG5CcU40dTQ0OXFIMU9zN1loc09DdUJkNDY0SWkrT2w4eFI0?=
 =?utf-8?B?WXdMcXhZcHN0dXp6MHZHOElKS3c1SVB5WUorRVpsdUp0Qnlhd2Z3YmdYSGZF?=
 =?utf-8?B?UndMUEJkSXRaekpFT0VzbFRFQytvTmpUNWtLL3REMUpQWUJEUEljVmZIMS9y?=
 =?utf-8?B?dGlnOWhlRFA5Zk4yMFYxbHIyczZZbTRXOW1PTy9VQUl5YjFOVzgrY2JiTi9G?=
 =?utf-8?B?NFFoTXRSR25RWjh6QXVWNWk5bTRKd1J5Zm5KcEZkbEUzZ3dGOXc2YVV2L2s5?=
 =?utf-8?B?OFRvWE1jQzBRNTREMk5nY281NXhod0ZlZHk2RVlaZy9Gb25wbWcrRFNmSW12?=
 =?utf-8?B?Z2ZRNC9JQjJxczJVOUVlTlJ0WkUwM05mOHRwUmJsa24zaFZjZ1pPWGNCZzNq?=
 =?utf-8?B?bnRRS3hZaWxiaFBvdFFabEN2TUJicEVHZktIMmlqSERrTzZ6c3lIWUcyQUpk?=
 =?utf-8?B?NHQxc2lwbUtvSEJPbEx3VXlzbVdqOXQzeFZaZTNVMlFqdE9vNzZnV0VPNnVu?=
 =?utf-8?B?V2hHT2pZNTNuYWVTSXZldXNrZmtSeWlncmU1aDlmMkFpeSs0TlltT2VHa0oz?=
 =?utf-8?B?aVpGbk1FODNTNjRrV005N1BTc3NjVUcxSGN4eWNLSEtsajBTb1lYbDFicHd3?=
 =?utf-8?B?VHVWU3J5aXpsVk5qKzM5dVZYOW5yZnJURy82cGdWRUtSbHgzd2pKS0tlMUph?=
 =?utf-8?B?K2ZQaTQ4VVF0NzJjYVYrN3Y1VUpjY29ybWlPVnB1dGlUQ0pYMjVUaXZNNzZu?=
 =?utf-8?B?VXUwUWcyeXgrNlVRZzhidkIvWGZ1ZHV4UVRlbFVsQzRjbDlwOGN1MC9uK0w2?=
 =?utf-8?B?VDBLcU15R0RJSkRzd1ZMZVd6c1dLS2lIbER5Y0tCTVMvcXpQMjhSb2FWbnk2?=
 =?utf-8?B?Y1laZ1BpOE4yY2tQMU94azN2VFBBTVhNamtud1ltVmJyZ3RNbTJOcXNtcUhX?=
 =?utf-8?B?dDNZa3A1SkhDVU51dUpIZ0lWNFRwOHprcUxDN2FxK3VHaGxrK3J3Ym1WckFm?=
 =?utf-8?B?cTlmaitXS3N0OFlIUDJJRitpSVh0YnVCZGFZS2NlQS9FdG9QWXFWajVpRzB1?=
 =?utf-8?B?NWVBeHNJYWIxOXdnOHVTWGszaVZVRGFSWFRnenFCRDB0NnNTNy81OVVvV0Zp?=
 =?utf-8?Q?IqZeyClDZpdP0ICCnN9/GyY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e04a88-8519-4db5-a159-08d9ab5ee45a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:17:09.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXkMwGBN1/LAC2JkfUsIIrkTB34bdfL4esE4xD2tRqhPvMdbIoPajTcYy/+AKUEip06QP64pxNr8CiXHAUWxWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> @@ -95,10 +102,25 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
>      spin_lock_init(&pdev->vpci->lock);
>  
> +    header = &pdev->vpci->header;
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];
> +
> +        bar->mem = rangeset_new(NULL, NULL, 0);

I don't recall why an anonymous range set was chosen back at the time
when vPCI was first implemented, but I think this needs to be changed
now that DomU-s get supported. Whether you do so right here or in a
prereq patch is secondary to me. It may be desirable to exclude them
from rangeset_domain_printk() (which would likely require a new
RANGESETF_* flag), but I think such resources should be associated
with their domains.

Jan


