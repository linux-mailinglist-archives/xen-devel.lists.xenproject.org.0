Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CD3E5433
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 09:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165273.302050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDM2O-0008WQ-CM; Tue, 10 Aug 2021 07:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165273.302050; Tue, 10 Aug 2021 07:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDM2O-0008Tx-8t; Tue, 10 Aug 2021 07:19:00 +0000
Received: by outflank-mailman (input) for mailman id 165273;
 Tue, 10 Aug 2021 07:18:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RCh7=NB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDM2M-0008Tr-V9
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 07:18:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39db1f2a-f9ab-11eb-9f5f-12813bfff9fa;
 Tue, 10 Aug 2021 07:18:57 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-HmKp0TIDMOOiaCEQrG0f-A-1;
 Tue, 10 Aug 2021 09:18:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 07:18:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 07:18:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:205:1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.4 via Frontend Transport; Tue, 10 Aug 2021 07:18:53 +0000
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
X-Inumbo-ID: 39db1f2a-f9ab-11eb-9f5f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628579936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwVj//RzOddqvZb5cR6/P+kiho83ywLEkFd3n3WXBSg=;
	b=BGloJLa1rZ9ABK1beMvqe+FYVH3sTAVRB+nT2bqwGa7GuX4TZUgzhOccX1BDsP5kVE36Ab
	RGmrcwCYykEaJPkmEsHzYV7aMRGKIImO5bfQtdP3DQX32H2C/svBcP1aMQMJ4gEe9Ue4Pz
	yRxlDRdzZtXDZpM3PndpZ/Kg+nVAGH0=
X-MC-Unique: HmKp0TIDMOOiaCEQrG0f-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8tSK3IrNOyq2mbrntlW7myGdEhPOCE80OIL+ErqdxA+loxSddPdRGbGBVhrVsUDsLzEosYjOQVW/ZUkRTSZSHzZb0T87Wx6zrwgSc+yH5VfyUTNcJbjRN1iQB0CBn1UQIH3ZO9zV0Wko17WCxN4Ip+ymgrwH7eqcnxoROahSPU10YG4PO4nEDSYgi654ZyNGsOl8VtedOhymC6FdXd8rzCLteR360bNQG77JjISbG6BOhz+qz4m44EB+ch5dEUAbixFhn8fSEH40YAjKIeL6S21T9BmDJyEMksvwxUNzZnopW/YtrZZnZNno5IEFn/TntgxGankB/GaOZi0VriXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwVj//RzOddqvZb5cR6/P+kiho83ywLEkFd3n3WXBSg=;
 b=Bj+4kHCXuRkfRYalM1aVhd2x0kIbf3xbhQ25mBBWtNl0f4gHQi5E9KL4oReOUy5bgN2WZgj//S9TzHUFimNI1H1I7XGhRq4tfgiFEiu71BMQXDuHOFLI+BWHTt5f1IEN/EhW2/qbUo8pQbfF7xu82GArd3HHbA1H+0j+5IsWYpjGlotLj96j4LBzWtiwCEtEbjPPn22mMqFfSICf6wk9po/xIpu8LKJWj4+lbH+UBrSQCV5YO1javF06F1InQyHZ6g2NxqJ6QXM8k7flM/wpGNz+D/2Bn3rROggrH25EU+SPTd6uH81PbPLkQyyZGZUoEdOsi/ejprAFuhe2JCiJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] xen/bitmap: Make bitmap_long_to_byte() and
 bitmap_byte_to_long() static
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210809144114.21077-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dde02199-a1df-752c-de22-411aec17b3bf@suse.com>
Date: Tue, 10 Aug 2021 09:18:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210809144114.21077-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR07CA0001.eurprd07.prod.outlook.com
 (2603:10a6:205:1::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e94bcd5c-db74-4274-1ae2-08d95bcf1c0c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68646F5C727536B808AFF40EB3F79@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+F6I/ncr1Hkhc0UnAgyDgV0nm2ilhP0286xJYC+vCgIb/lO/psdn9siW4mc/hYHT6teLmIF5zuBk4APyjRPdJRISF+oyJoU2JnpGrm69CRiNMRc3ZxRh8gSL2ivyErQXcAz5G8IA6/8r7oBbrA1pPh70MJKEKcnHA8BHDQyolY7DvUY9U4AHH6WVNNRNeQvTI3VYlil5yQ0XkOGxcNMnWZ/vXug97E7oR+Uy8MKOOarQ5ToPIfgc2VKCvkfkmAYA2Y4qBDV3axEkUkrfVh9XoKtTxxs1qbxVy1T2lVNiWiIRryH0Go54h76DagFotlTeLcFcOKy6p8+6xzN1ZcC7icHN3ewQ7Tf83dxCuEds/0qfHtuvigcsh/3iDio7jVhKNiQgEHBpcp2YUErDlvxLDX0iUZgCZF69DPgLzBqO9718YLnG5wxesaLfyCresu2xX8pyDizi2spEU26ZIaOOaEJCJLR6nFq95g+dn94BRaLEmIoa5LqmYLfd4Ha9S0jEfmbez6W/ko3wGKTlMD/5zLimS7cip00r7+R4HF1EQHyKGlEhEsb4QYKjGubb/Y80PAJlUNo/4qXk1YoUIb3W14Dc7lG2EWTFmwCRWeErMLKP6km2giIG4EUX5MJy2hlI1erHFYj39+WvhZutv7XKdykWWjQC6FoAcqW1Sa0qTDHgW4VEMU9TGDZDhfAA2TMrsY++O+lTw3Ed/pFQUyhoM8JtEYWM4PGqp8eY0fDX45o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(66476007)(186003)(4326008)(508600001)(66556008)(6486002)(31686004)(86362001)(66946007)(38100700002)(31696002)(36756003)(54906003)(5660300002)(6916009)(16576012)(316002)(2616005)(53546011)(558084003)(8676002)(8936002)(2906002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S29CdXJlMXNZa3VYWGVHUnBCeXU5UGtvcHhkdlRMdUZ3UDR2c3BpN1phaU8v?=
 =?utf-8?B?a3ZHSCtad2hpMDBadEpSLy90T3k3Vlp5WW1FSjFqVVFOYVU4WmU1bXI5bUZ6?=
 =?utf-8?B?NzlRblhBRlRoRmRyUGVMME5aY2hTV0pMNExNYjNaditrL3BCVjh5dlNEaDM1?=
 =?utf-8?B?ZDBSdTF3RDlOYkZRamdIMTNvbEMycWNETTRZVERVL0gzMkdUc0sycmlvKzdH?=
 =?utf-8?B?dXlYYnZKaWZFZEFWYUZyeHU0UjFLekxGZ2U0QUJqQjJ5QUlqQVcvUWVkNTZS?=
 =?utf-8?B?STVXNnVTM2lwZHhndkM3WVVEWElzY0J6bjlPVXEvR1ZyQzdSK2xnTWdSVVk0?=
 =?utf-8?B?M09jVStVaXhjN1JQemY1dW1teTVNNnBMWldnTWMvUHNhQTdVTldxN08vUXhu?=
 =?utf-8?B?VWJ0WjFHNHlQZzhlT3VpQ29Ca283eGRjNC9xRlRVOEgyd0JBakxKeVlEUzFO?=
 =?utf-8?B?bjRNLy9rRytTWHVIZ2Y1QWYwNk5YaGRMUmx4OStNTk02bFVaWS9UUUFmazJE?=
 =?utf-8?B?MWRYYlExeUN2cnhRcml5azJGeTRDV0xBYmlMYktFRG1lZ3kxTmdRcUJHci8r?=
 =?utf-8?B?RVJIakI4K1R5RXhEMTArakNCS25GUjQxdEZBK081VDFQNnNKNkYwbUFFY2Nj?=
 =?utf-8?B?YStoZjNqQlRrSjBtZk5uR3h2MEMyc2NKcENMa1BVSEdRVUt5eHBVUTc5Vy91?=
 =?utf-8?B?TzVtcC9WU1hUbXBSbFpiTUhoOTdxUnhBemk0UUo1c2diNnFYc3ZnNjNGMjdh?=
 =?utf-8?B?NUZwdUtOZU9wZEdWYWVlWUg3TVVoUzRZMTZOc1llK29YYlY2NkVocVdJRDNm?=
 =?utf-8?B?NWRWNnlqL0E4UHdFdEliU2RiZGpyUU5ZTlhMZGRxYlFVVjdwVUlDUGNSWWFG?=
 =?utf-8?B?VlhEM0UvdEV5bGlMOU9ReWpIbElBVEJGKzMxTWtaNE41dmlWMk1jWWI0cmNo?=
 =?utf-8?B?Um5zNFY5U3J4azEwSnNOeG1SSUpHSy9kZG43NmtTeWVOeFplQ29kbDQvTUt0?=
 =?utf-8?B?VDFTbjF3eXpaS01SUldjb0hZc2NYemh3TXQ3UlVhV0NiVlFleDNVM2htZmtl?=
 =?utf-8?B?dnByenRmbmIrNHdhV0toMjRMTGEvRWJlUTVwSWQrNnhwOElLcUhTOXI4RVgr?=
 =?utf-8?B?SlhYbExsbjJjMDZSWUF1dURydFVtbSswWkt4Nm9GYUsrYjMyMDVBdnpWSFdh?=
 =?utf-8?B?VmFUcitFcHYrM3JCd3hpYitQR29WNjBWRmVJZTVJZHlRNnlGaVhxKzlLUnlC?=
 =?utf-8?B?YXJvVEdZNk5CdGkzWTdmRnAwWXRBYzZOVm5qaGRPTFFETDdrai9GM29LckZX?=
 =?utf-8?B?bVBBdXVHQVd5UU9kK1ZLd0J1ZjJBcjhhL3FlSFNycGo2eUlpWGY5eDJnd25k?=
 =?utf-8?B?ODkvOE5BOFYrOFNjQ2srV2I0dDdmMENEQ3RUcW5XRnU2bWJGZXhyQnVPT2VI?=
 =?utf-8?B?d3VJWFdzL29wVWJMRXN4Kzk3bXdWRmtaaDV0aEdNNklmd1F4dnNickpjUDE1?=
 =?utf-8?B?d0tZclRtbjF3RjlHc3hrd0JIdmJwSThNTEdlbXR5cnpVUjNRVmVBYWw5RXVR?=
 =?utf-8?B?S0g3bzJydUt2azRxaFIyRW5YaEovTTh0aXgvQmFmQi81VDhpNVRBNlE4TG9J?=
 =?utf-8?B?a0tYWURBVFdYVmxxR2dEanZ6TjhIa00wZUsyNW1yZjQwYmMxV09ycFNiRzZF?=
 =?utf-8?B?Q2wrT2xFRTJCZkhBaU9CT1FkRVowM1ljQU5BYVM0V1JhMUluZGt3MHNPV2hu?=
 =?utf-8?Q?6oBz0aSpabTu0kD+iD3YVYw4VcRy2eTgZaZgTjZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94bcd5c-db74-4274-1ae2-08d95bcf1c0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:18:53.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZ8bXXQrE2P7kqj959haPYpedxDKP9dpB2slSwKGSC4TKHtqd4NahBI3o2GNkhTKedXrZbA3LwNDNCRHa+cqyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 09.08.2021 16:41, Jane Malalane wrote:
> Functions made static as there are no external callers.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


