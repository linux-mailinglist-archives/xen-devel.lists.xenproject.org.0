Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1166B4CFF4C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 13:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286012.485326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCwp-0002oI-De; Mon, 07 Mar 2022 12:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286012.485326; Mon, 07 Mar 2022 12:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCwp-0002ly-Aj; Mon, 07 Mar 2022 12:58:47 +0000
Received: by outflank-mailman (input) for mailman id 286012;
 Mon, 07 Mar 2022 12:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRCwn-0002lr-Qi
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 12:58:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5227a73d-9e16-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 13:58:44 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-UDV3kI88N5yFk-z20cRzUg-1; Mon, 07 Mar 2022 13:58:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4692.eurprd04.prod.outlook.com (2603:10a6:208:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Mon, 7 Mar
 2022 12:58:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 12:58:41 +0000
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
X-Inumbo-ID: 5227a73d-9e16-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646657924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fo1Xv3aTC0Dr8YQc6ay8PVni0sHLeJ9IKSxJHRpcaHM=;
	b=ICM40SNIT0mKA08KPrvXKh3T18kLC1G9cyfeenHSDjmHSo4fzGMl+BuxHXfX2pqdr9MX9X
	FCSFBCZ9aahDQUvWpLM6Y4Ay52Of4J1VxGoqB80OxBC8/4OuVkFzERKJL6hLUePd4jBp8v
	0FA+KsWhjNudiJNFi+wkE3nvGaPwuA8=
X-MC-Unique: UDV3kI88N5yFk-z20cRzUg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayhOQ9hOYv5pNoh0dsH+2bHRwf8JBvKuXwtC7R09CqVPu4kF94TE01ZAcGCFt15HthMubvpgKi7ckofqq7wm4q/UOo4xHYlqyUmA+Rry2Z+F5Vkw7cnRsO1iToLy4Sv8W/eRQKgTkKkasc4wFRIwzGAEyy1DG6O0nb9Iyz417qLaJoE1/gDsDBNH9LN3zXWiiJtdlHRXax+QlkdVKT4kyHxAtCz66b+wD3xwVfoMFCwhqWuy2b4ckAITgGnkgtKbKfPHYttItiMuMjCDhv4zhJEgMpU6HMc+zif8IPeUk8PSDcp6j7yww0BMEFVYDuC/bnIHjGnxEsUJqANPtlHhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fo1Xv3aTC0Dr8YQc6ay8PVni0sHLeJ9IKSxJHRpcaHM=;
 b=YV7BUBgMGCoRvQg0ZMlgLuWzZAgnWmGbZR6hdOzCIirWHfHIXFdK0nfGCtDG7nK6XY1p6fLoKrNH3def9QgnkzLyAp177uaM+d1y001QN2As+Ny/hTqdn/a+XYBOIX1RDRbY6KaQKWcseGjiy00dMtMy3O7Aa7cnnH44NoNHSFPjJLx2AwMqSTcSyuQnc6/BU1DAtT7f8Qd2XdWIfm7efsj3J5TnSWbpBHBL5ZU5DPVaeIKf01RAjh8PSvW/Lw1BgJwjJ18L1GCDc7KZ7Os5FMfeAYJjkMNh8P2iAcV26x5BSghjr6gGNYiXpp8FDi+pS7K5g7fz0hfiirBTvn9GtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72480195-fca2-ac6b-f592-e3f3fc316a9b@suse.com>
Date: Mon, 7 Mar 2022 13:58:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: fold sections in final binaries
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
In-Reply-To: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0105.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b77f5b-47ba-4e2f-00e4-08da003a3433
X-MS-TrafficTypeDiagnostic: AM0PR04MB4692:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4692DF225B0F7A9DCDD67C0AB3089@AM0PR04MB4692.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hOfxZnnTyXBUsuRNkmdQOI720SDkQ45G2aqSyj+IHIRn1lNainxFkWxmCxGyPtG69w4mr9020OzHGnFlhlvBbVd8/aGBvPbZRNjC8DE0zQa/ALl4iopA/YhXEAnkmmr3uZkyTOkOAWlNdy9YfeUZHZHWsu1Nzz4DX9sHnGfRYHiViiQXNPb5mXiYVJBbykastMj0lY4eHHnIVne2px205L9V8ND/Efz36X48qUUYKPsdmR+9g8C1Dl1pluW+hGI++0+jIPAQqAq/nacLPxG4JcEDAZrmoAr1P95y5sWmE6eQEYnC9ITC6cpMyhGXtiNviZxkE8lLjtQEdphq8csbi18ITIVu5WuR1heUqZiS1acvg9LNfRcCNYLPchrFE7t10B8UL//3dpJVswen82gzmw2umeJwEcUDfeHi38otJ4UYZ/3NWSgx0Tjd2FxaPDl+LZn5oiytd4FEXEGZeErHoJXmx+rvuSqjHZ4JQjWPtSkmLBOmdxHlBrZKQ7PRhtH+4opLfiiVObQ6eyVqdZQKdpbVoyC9jnpG+CctcyNePggJ2X1evubf7nuwNcBNiU4DKGbrHVn2/fnIrOkUSrUgcz/TX1bfeqXPc4XuirbH22tuT7jJY7xeTppQtq+2L+eN6+QnipgH8+aZoOlpGfZa5ygPXEIbU7nyIaGSHyDHIb52+LA7NndgYA2xfAEU5OMWrccH5JypY7jVxgn/UMGhXrES0FN5LhlFr7uxj4FAPMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(26005)(66556008)(66476007)(38100700002)(66946007)(186003)(5660300002)(2616005)(316002)(508600001)(54906003)(6486002)(6916009)(2906002)(6512007)(53546011)(6506007)(8936002)(31696002)(4326008)(31686004)(8676002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW9ReDNhSXhQS0NjZ2tsYURzaWFKZXAySklSTjNLZHZFWUJ1RU1YSDhMeXEz?=
 =?utf-8?B?Y1VFaXlsbTZlL2lKQURqczJPRnhXbTJYbFdHVUs2Ty8zRjFJYVZDYlU0ejJp?=
 =?utf-8?B?UERKZnBIYjlCRW5DQ3ZNY25SenRFUWsvVjc3QlJCd2M2WFRkTXNxVEtCdVFZ?=
 =?utf-8?B?ZDVrWTRUdzM4Z1dZbDFndnBKb3hWcmpFYm5YUS9YL1ZsUWtpR3g1SEJmZitX?=
 =?utf-8?B?ZGFibmhiUHptenhkRDhuUlNxWGZkek1ralpmNDhtdFRNeGNtcEprcFRmR2NK?=
 =?utf-8?B?d2lQTHpMSS94NGtwMk9nUnpHYm5Ea004Z1BTYkJOcER5RGdPeStVeUVHSkNw?=
 =?utf-8?B?a00rSVBwMktIamU1NVRGQkRMZzZVZjd6V1NNcjZYSkxLWXlacU9hd2x0bEU0?=
 =?utf-8?B?Rjczc3RvM240dDdvS1JQVjFoYWlrQXhxOEgvRVhXTzVmcU5FbG0wUWRXNllB?=
 =?utf-8?B?bFBmR3VZUTlkQlRoYldWZC9pUDR1ZnovTXNWQ1BOdTFtVGk1azNIZTVNWTVE?=
 =?utf-8?B?YzdLWE9zUE00SXQ3ZkRxWjRucDJaS05rTUJoSDk0Q2FrNVBnQ1FwaElrakV6?=
 =?utf-8?B?UHFqNTBUblB3YjIrblNUKzFZQ2l1VU5HSGxHREJUMEFvRkVGakpKR0FBcWkr?=
 =?utf-8?B?ODhmb1JablVuY21Ta3IxVldNUTVkS25ybXNlQXhXRkNtM0FFeHhYT1FPS1RB?=
 =?utf-8?B?NlUvYUc0bk40WXhDNWNMODh2VGRITDJQMld1N2ZJN0h2Z2I4bjYzNmQ5K1Yv?=
 =?utf-8?B?dFo2a0tYQ1o4aDZ5by8wOVNhNTZ4YWExQzllb0x0UERMd1BnZ0grMy9BYXVz?=
 =?utf-8?B?SytVOEJySnljUEtXazFGcHpVaVF0ZVhNeTIzMngxTGJQRldoUUNqSUVlN1NJ?=
 =?utf-8?B?SmJncWhXZ2tTT1orcTZqZGF6YkRrMER3ajJZRXhaeWRBTXFvbDBQWlc3enRr?=
 =?utf-8?B?bzVpZTBWQzFRanpWeXp2Sk9oZjcrdzZHVzhpYXRSVzNyV0VkWldva0phNXBY?=
 =?utf-8?B?YUhmNFpWUzFKakdKbndlV1FzZ0xoNmlIV1JvTnlocnBaU29FaEU5SVNwY25V?=
 =?utf-8?B?ZGtKV21LTkZXc1hkcnEyRVFHTDNrcTVIc1BWRHNlTEpWaWplMERuNXQwRVRU?=
 =?utf-8?B?L2NILzE5citSVHNQRmY0bTNFMTZLd2dENWRZVUx6b2xtL1Z5L3g4TENOWXRJ?=
 =?utf-8?B?cWZaRi82WGMwb01WTVJQTEE4OWM2RVVTWUhmNFJSSDJWTjk1Tk1YRmQyZFpI?=
 =?utf-8?B?V0Y4eDJlQkhhSDZNYit4bDV4ZUc2ZVZZZmRrMHA5bWJBVjJyNXR4N3ZnYUxV?=
 =?utf-8?B?OWVGSkpBSFVUY3NzeEZrU3lZR00zSkZkRUJmRUFmNE4vZnFVeVVnTllZemN4?=
 =?utf-8?B?anE4eGgya3pzKzZtcE1Pd1NMOFZ0ZXhoVlZ5NFhUc05maDZrK0ZQcVlJS1J0?=
 =?utf-8?B?VGhFekFPOTkzdDVqY0s4TFhKeW52R1hicmZUdlJDVC9uYk9LQlowSlQwWGxX?=
 =?utf-8?B?d1BzQUo4bUZZVjhZQnlVR250YzRmUzBIclBFWVA3dWlvZ1pLcDBzQUVobzdU?=
 =?utf-8?B?MmtXaXJxME1wc05JVWJwelVuUzVRUytPaUlFUXREcjhOY2JGVjc1eHNhb0Fu?=
 =?utf-8?B?UEtrR3RwMTBKK2NMZzczM3EvKzNrNldBeWloWlhzQjhubkRmams5Qy9oQUVy?=
 =?utf-8?B?RU54UGgyVTdWcUxZNDJtQkhMMjdMd1lxank2bnFWV1BrWWlsdUg3Nll6Rkdo?=
 =?utf-8?B?d0ZhS1ZHVTN3SGdNRzYxSE91bUx4ZWxBR3RCQ3Y0akxmUFU5SFB1WnhjenRF?=
 =?utf-8?B?b210Z3hWbnQ5Vnk3eVc1YWg3SFMvemJ2ME96ZW5uTXpNSExWK0VKOXhXQjlV?=
 =?utf-8?B?am5XZnVGOUcrQTdYMVgrQ0I4U2E5R3I2N21odllTVHNTZlhEdjBYU0svWms0?=
 =?utf-8?B?c01XSS9nMUEvZlhPczR1c2VSRm13bjNnWlBWbWl5SGF2cSt5bVZ4YmoydVE3?=
 =?utf-8?B?Yys5b213d2dEQmd2VDNIUlc0M0pOR0ZvN3JOTlVlYnBCU01ZMGRSQmRrTUVv?=
 =?utf-8?B?bkU2TnFESVFjQllod3E5dnhVSmFNNDlaMk9xbHVCN1MwaGE1K0NickJwdERU?=
 =?utf-8?B?OVZvbFozdytMZHdpdWg5aVZ1RVNrT21ZMVVMQjY2VGh5dnc5V1hRMmFvVmVZ?=
 =?utf-8?Q?ATIYM1SLgazdcv0tXncYerE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b77f5b-47ba-4e2f-00e4-08da003a3433
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 12:58:41.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGUOLFfg4TmJB5HETxsU8nCh8XswuZ5Pg/KqSb8Pnm6Sx51tP54ZTgzupSohCh+gfeCQKr1D8iknF0b++PPrng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4692

On 01.03.2022 09:55, Jan Beulich wrote:
> @@ -258,9 +259,10 @@ SECTIONS
>  
>         . = ALIGN(8);
>         __ctors_start = .;
> -       *(.ctors)
> +       *(SORT_BY_INIT_PRIORITY(.init_array.*))
> +       *(SORT_BY_INIT_PRIORITY(.ctors.*))
>         *(.init_array)
> -       *(SORT(.init_array.*))
> +       *(.ctors)
>         __ctors_end = .;
>    } PHDR(text)

Sadly there's another regression here, with old GNU ld: SORT_BY_INIT_PRIORITY
is known by binutils 2.22 and newer only. 2.21 uses SORT() in respective
places, but I have to admit I don't fancy adding a probe for what we can or
cannot have in linker scripts. Yet for now I also don't see any alternative
yet ...

Jan


