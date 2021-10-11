Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587EE4293D3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206272.361799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxbm-0006XS-Q0; Mon, 11 Oct 2021 15:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206272.361799; Mon, 11 Oct 2021 15:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxbm-0006Uw-Mh; Mon, 11 Oct 2021 15:52:58 +0000
Received: by outflank-mailman (input) for mailman id 206272;
 Mon, 11 Oct 2021 15:52:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxbl-0006Uq-J9
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:52:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc976dc8-5fa2-4814-a06f-36254b4d9acf;
 Mon, 11 Oct 2021 15:52:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-h9E_ol5xOWC0ISPcGEPNFg-1; Mon, 11 Oct 2021 17:52:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 15:52:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:52:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:20b:2e::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.27 via Frontend Transport; Mon, 11 Oct 2021 15:52:53 +0000
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
X-Inumbo-ID: fc976dc8-5fa2-4814-a06f-36254b4d9acf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633967575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQ7aU546pp2swaBeI4HIFlTAidPrhKbOuXp0X3mWU3Q=;
	b=WuY+6ql+gXCCis8xB6tALb4CEhHKV8XMR2LrRmQAC3+MhmmO6RQXY96EMiyUbKNahrrjRg
	fnhrINWK0bJF6IYGSn7JpoAk0HpqlCYOU2E6weIVDLUUt4wCUDVGidiOKBAEgQ4xGcfW8n
	XeXtQppiYHnRaUkhfWIpgHu3jfxiHUI=
X-MC-Unique: h9E_ol5xOWC0ISPcGEPNFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSBm6zTRtWYEU3kkZFaZDOKBN86EyKzK+xbW0xzxgQQVeOZB++iPN6tSC+qfAEtfgSv9rG65GrutzbuBi5uDw10r512mx72lwmG634OtnyTvQq6xWeTAA4pZlub78nwHIzqQUVkIhH8yybA0sF1aE58KruXl4ShxdeHURL9ApEBb29ZOzSmOrmHVZ3/DQdtG0HcNXWJB3PiSZZ3Px6EdvuohE8taAHGur5U+GmRlcadSX4uPDKkGevPB8eD4UjCJxZOUCPjP4sPRZcnEYgZMfsfWNEBHLDy33XZ/ZSA0eFJtZVG/viRoRbUDsmOIixLh8eqLWP0m9x6kDyVhdZH/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQ7aU546pp2swaBeI4HIFlTAidPrhKbOuXp0X3mWU3Q=;
 b=lGJt0L4i86b+ZTO/BUmS3hh7UNRJFc9nzUQcEeOUN9tYa67fLDwMz0u6Hxy835dPFek19ShMSnnsUJXQcQDnLu/CiCHFjMsqSMYb63i2+OcO7gP2ZOsXukWOByvapnYRJ5fIx5BsytRJ59O9A3lCrExlzBX48VcZpG5GW4kG8uZ+k8tYcQCuCl5zbY1vHiOcW5zb4S7Y3ZemyR8xYnCi70/G91FIcIACKu234UdkHDFKDWg/6Ld39FKrjSC48lAqR7IL/uSb+QaxhOLmnMpqz4DG2uGtECY/z4Mys6UBFhsWu1XCR4p+3Z0pu4mstqMWhFwaGGT9DTzYDJplczsSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 36/51] build: generate x86's asm-macros.h with
 filechk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-37-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b435e13c-8915-5cb4-720f-1d8470c5fb70@suse.com>
Date: Mon, 11 Oct 2021 17:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-37-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0035.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30a25e6b-5ba6-4887-ecdf-08d98ccf2fc0
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606BD510DCD8891DE7D666EB3B59@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+s9xsMResTA32JzvWBmj2eYUSbjOt7pCbKgEVpUE1kInm8ARG1UucGSpWVoZgazv2BixRPTnRDDFePZv593cBKej6XNjo9pqvx5UrYWpxTirOmxdk5kDbpArn3lkxWy44AghbpbPZPH9jCzI7Ox7pqtedRROcpZODgtreixV756rl3MOkdNBKNAzuPw7KPvymjEca5Vllq4mUdhd0oQ9GKppR6esNGTL7RsQF9xN/3abaarfgirrqhb1kRAH0LrPSs5P9Pkx0kyuqnRvegKCNzERZ8uj2GwtR3pnUCyyR2BMDrWAW5bmeJWq0+Vep6boRw8H00cKKG462rk2h9lvFGmm02QeE4kmEr3arekcJCSzGoqF3IGX7hPRZBXD5Sg+Miu7kcbmCLuIAsrATG0uXmwSUm4ZGwgNxmNfmkoOKFrc+e5Mezd00NNWmmWM67tvUA+hfS1JWtTsCM9vZKebXiQyBsdRrp3puTWP5hbo3RN7J7J/J2WLnvEAhl/mktg2AnZqWAwKioRLTfY+6hucR/saLQe/PprXwkPBjHWSGVM7yQV6RJowjPz0xYLulZtaVaeM/D8VfaNZVsVv+ehILTgbd1XeoEpi/cNMh1WHxEa9hlFE3WTQs2JPRo1ukr8cQC5BMw6VOd/JyOUyZRMizpRBksd53Rg7PUyvy7U2KNeOz86TyjW5eenlUNMs1uu4RwNl0hBbb9Jj1wwejUZlBHXYnwKgLanh5TO5pU/RwSE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(86362001)(186003)(53546011)(4326008)(36756003)(316002)(16576012)(8936002)(5660300002)(508600001)(26005)(956004)(2616005)(6916009)(54906003)(31686004)(66556008)(66476007)(38100700002)(8676002)(66946007)(4744005)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDBta1EzSU5ycHNpcUNqZitPNnc5TnJhUVBYK3FBVWx3cnFEWFlETk52Q0x4?=
 =?utf-8?B?SEtGcU5UYlRHOWFNdVhBYmtGM01vbjZXMTZtQldrMGFXbHFmdUVpRW15Um8z?=
 =?utf-8?B?QUR3TWF5VmF3MHROejJIZ1hDYXY0MHdmZWFBZE13RzhPYzBLSE9HcDhrckwr?=
 =?utf-8?B?WEhPS1NiNFl5VDZJRTd5UzV2QU1PZlJGdkZJOW9yVlZYRUcwblpQUmx1Y3lx?=
 =?utf-8?B?SWgzTktYd0dQWUh3V3htSzJxbnVRaDB2c0JxVTdzY2FCU0VKaDAxK01hYkc3?=
 =?utf-8?B?S1ZjeVl6c01lR3JWRWhRcVFKVE1CbUdVUk5rVDJHWUltUEVJZ3NNOEJxMlhZ?=
 =?utf-8?B?TFhYMHQzdys3enZsaVR3ZUJnSVdTbkIrRlBCanNWRmNQVzh3WW9Pd2RpcnA3?=
 =?utf-8?B?QWUrMjkvU1UzYjRBVTZLSG5pTHBjcXRXdDUwZVN3ZWtvcmF6OEdwRnp4ZFJ6?=
 =?utf-8?B?WVlodFhseFF6bHlqRjFNa3RUM2d3UDNHUUVWWXJUZExZcE84RmJhdWowcUJF?=
 =?utf-8?B?cExyejU2V1FXdDJXdmNIQ2NBeWZPc0czQUFMdzJodXZzT1J4aVR1VEI1bU1q?=
 =?utf-8?B?cU81RTZPS3NmRFBhQVF4MEtaRWxZUDk2Y2VmLzhWK0IxY045VUpCN21KU3da?=
 =?utf-8?B?WjVpSWNhckJBcnk5UW8xaGU1OW1sVDBoOUdoQy83dzZXbmpkZFRSb1J4Rngv?=
 =?utf-8?B?cnRMUXMwZkR4eks2bVB5WFNEZEJYS0grMXBRRUlsaENRVHFqekRVbURMM09t?=
 =?utf-8?B?UzNLbVdMYjJFV0h3K0hzR2U5K29YOGkydUdQR0gxeEQrUGg5Q1U5VWVPVEdB?=
 =?utf-8?B?Z09laXkxODJqQk54UHJFRkp1ZUM2ZXprcnhXRHBlM1Y5aEhmN1hUaVVwMk9V?=
 =?utf-8?B?YURZc3dPSkVMNGNCV3JGL0RqTTlEM0hmdWJUUExpVkdDOEMrbVFwVDU1UXhN?=
 =?utf-8?B?aytBMGhGcUt1RStCQmVBS0E0TllJMlBDb0tXR0E0NnM4eHYyWG1DbDRvMVEy?=
 =?utf-8?B?RnhrSng3T1ZqOE1Wak85WFY5MTlZYlR2cFBVTkVaMi9QazNZY1QxMDMzZDB0?=
 =?utf-8?B?bXdVNk4rU0tyT082TkdLL0YzNGhxc2RGcThpaEtoeHZkODhobFk3dnJEL1Q2?=
 =?utf-8?B?VC9qVWJOejYwMHZUYUVQSHI2Wk00cCtUUytWeTBUbnRBbmdURzkyMHdxUDR3?=
 =?utf-8?B?VnVNYlJnbHZNS040MWxrQmZsalcyWFhXak1OYUFqcm4yMG9CRzU3SktiNHpZ?=
 =?utf-8?B?Qms5WldRZ0cyY281R3BKQ09WZS9RbW5NRnowZFlPWERzZCtmRS9tekhGTXVn?=
 =?utf-8?B?MndXNm5IZWZDK09rY1MyZS9SR1U4RmEyaVZ3bVhFekFoSk5CTFgvdEdYZkto?=
 =?utf-8?B?Mm9ELy9XdHBibmIramlmSk01dERFWHN1NllHTVVqaDBBa3lyc3ZtMHdtVHRM?=
 =?utf-8?B?Y3UwaG5UOVBGNzRGOVQwenhJb01BZzJ0YnJRbHZrZHBPVy9pS1N4U29OVEVG?=
 =?utf-8?B?OXN1TFlXeSt3bXMrenREalJIeFlLTU5UNE96YXovNXRxUFFIQ0NLUTNSUTlH?=
 =?utf-8?B?OC9JVlNVRmllbnhSdDNnZ0dMRGNpRXQveG81dU1FcFVBbTdsNlJ6U3lWWWc5?=
 =?utf-8?B?Wi9xMkc3Z1V6Uy9xMGRzcit1TnRZMW14U1NiZjZua1AxczkxSzhhdEcxVW1k?=
 =?utf-8?B?K3FIdDBpdGg3cjFZc2lSNzRYSnpMS0R1Uy84MWgxS3ZmN1NwWHViMmkrQnp2?=
 =?utf-8?Q?PRvF5KVFpFMe4o+YTyTlk5jpaoyJGNGdQH8bE1P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a25e6b-5ba6-4887-ecdf-08d98ccf2fc0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:52:53.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5JbNCsw+xExvwWGTnntpMmrSjDxGj4VpraNHiFhTe5VDglDMR4vxvSTLqovWiVIzCeETMYumtF0pNEhOz2/gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 24.08.2021 12:50, Anthony PERARD wrote:
> When we will build out-of-tree, make is going to try to generate
> "asm-macros.h" before the directories "arch/x86/include/asm" exist,
> thus we would need to call `mkdir` explicitly. We will use "filechk"
> for that as it does everything that the current recipe does and does
> call `mkdir`.
> 
> Also, they are no more "*.new" files generated in this directory.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


