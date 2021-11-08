Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935EF447C95
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 10:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223143.385701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0gk-0001Dp-Ry; Mon, 08 Nov 2021 09:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223143.385701; Mon, 08 Nov 2021 09:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk0gk-0001C8-Lp; Mon, 08 Nov 2021 09:11:38 +0000
Received: by outflank-mailman (input) for mailman id 223143;
 Mon, 08 Nov 2021 09:11:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk0gj-0001C2-6l
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 09:11:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dee72ccf-4073-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 10:11:35 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-tojzbmjRN0erJigf6xuMbw-1; Mon, 08 Nov 2021 10:11:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 09:11:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 09:11:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.16 via Frontend Transport; Mon, 8 Nov 2021 09:11:31 +0000
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
X-Inumbo-ID: dee72ccf-4073-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636362694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6vlWBu/CNNNbW2BL64wmgwjIzji96cUhvGRs/XxUoXA=;
	b=kuUh8PmDuP+wbC4qTUD4SXo0oF2dCpAxSr53LPV0hXOBB5uFicLQnltZmy7M+5KdK0JUSk
	slEe4QnsBuVoMyJM2/IxsANWBG8BxJf5/+TWbuFXVbIcwR273IOfABAmUStupy50cSszRn
	I2zJfmY0aS54sRE5U4loomnjteAOHOY=
X-MC-Unique: tojzbmjRN0erJigf6xuMbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oghhPHjSMZxwZilkIBSiLKuyZRkORC1lk1KUfFeG5144NzflSWppS4XiotgbGnpHR9AxAzOb8QTCY/JSiViS4pDYoaCa67xSyilErXue9MZ0ztdb0xdGc/9icmPgcKEYZkX7hlHCCG2DqaEMTnC+82yF7G7AARrCFTZjIzE2RVYmOnkeO0wEH2R/64Ve3WGviU2NCmpJUmyjolREONgNGkP59E0vb5VMJERMHt4Cxmiw+yB7LqItogH5rZCgQ2+cica/nc6Lfmlgx3zkYt1xtop5R5pH8c1wvdfOeD0iteR/d74tixqEK9ts23lcnY/KCxLCkD+td/fnLaQYw6p+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vlWBu/CNNNbW2BL64wmgwjIzji96cUhvGRs/XxUoXA=;
 b=eO/97pxz8Wloi4oebVMW8t/qSSXU5YrVn8ips8D8+0plJIcKhYyvO7Joa77XQmjlERfi16yO8ZLf+Hw8d4Gg43GmPpt/QeM0IEFD74SHTGOOuYc/qS8F9X9b8X+WHRJkH+gEFQqS5r1p9NibkBf3WmrAQAjD8z2z9sl6dlBB8bkWCdhBRprU6DNxtgimpLglFZQ1f6KrTcr1JpX9aDztmbkKOmO4P1jXPaQlxIHmlN8AIiQXHUKgQFZcxOfrPAa+qfGlOsHc0QednOGBrlHeN0qjYCsaRKgx14yMo3cgzFSYjTkMGqEZi03jXEkF0tEZKMebdjFigB98DNI8XpmYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41f3c740-dcb3-c58f-a937-8326d59002a5@suse.com>
Date: Mon, 8 Nov 2021 10:11:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] xen/xsm: Complete altcall conversion of xsm interface
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105135555.24261-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9e44ea6-f2a7-40f5-fbab-08d9a297c176
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46063DDF1A16F23D0CBF6A34B3919@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3hdQ6dxCAVFj0abbOFYse+A3BRAfXPoxfJaXYjQKpfSi8JaeagMV/9Z53POtbKtWWeCe09mrwNJHh98YkEyrjc+sXZsucY9MWbSpRzbAcJ7lQg9k/XWzG6iZ+AfntJ3qmujnsKJU4MSS10IzerTO8k//Rlsv7MBK4o9Wxau4uQX0FxRs5W3vXak75lK79fm/3NNqCs1XDsRg1XqiP1BEMHSSVPYz77ma7teRHywZToY0H4S0BLZpeDxLJ0OqxX90Dml9KN/3quoZJBTuvon439CsSZhTYM69FYgYjMSdi9PNtt+rkcb9r4WkbEVs4jpxK07ZhuVzIasj59FpcPVTdVVim0w592aqzJO9ccE8LRoFOI2MDS62mrSIwzogXAtghLYxTNfrJogQtusSzQyosjpg4WQl0wLsQY9yvhuA5c0gcoAskN5lJxk3IZoLkDfdLmajYqTNKE3cUdHm3mFESLaeXSku/xB6IqOX7t8JpRQvNTBUS4qoDfTv0ynRQscQYTsuyGzEWUKJAKF7J18mLs6h4tsbzgbXVvhRozCzK812TebIS3Bwp2cTrmt7Em5wYfz9QReceOJk87rXaskDZUz9XGMzUQJRffbp+SUU2+3+cXwFcNqQ46fJcCgnVFPlODqMsnqLU0UXeVuo9yasOXURgAaiPD3kSeZhkXfpY22oMspxVnJw4U9fIFCT9kgUypSSw0+3TrDshlRGXrYck6HdUPGGJAsMNS7W2Ox69nDLKtc7gjJ/u9qC+CN/ZjWh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(8936002)(6486002)(6916009)(8676002)(53546011)(86362001)(186003)(2616005)(66476007)(66556008)(956004)(36756003)(31696002)(16576012)(316002)(31686004)(66946007)(54906003)(508600001)(38100700002)(2906002)(4326008)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXVBVzczR1paZVhoeXF4SHFreUEydU11WnBuNUZzeEJtSGRlY2dCNExGek1w?=
 =?utf-8?B?OStaQ0Q3cjh5RFF2T2VEUDd0Zk1tUmRsYUdhZkJueU1HL0x6TytxRkhDZ1N5?=
 =?utf-8?B?UG5QNFg2OTJORFpYYlVOVFM1RjJqSjZsL0RpSTB0L2Ird1grMGtOZjJVNWV5?=
 =?utf-8?B?ZUpuNjVpbkszdllrMFBUSFlDZkNUdzlQNzROVUM2SEllWHFQS0JOS1E1N0lD?=
 =?utf-8?B?WmwvZGZEYkx3VDlGdXZueTVnQlpYMnJuVVRGby9FR3N3bEtIMnVPaFhOSzd0?=
 =?utf-8?B?cFFzVDNNZWd1cy9Ua2J6WDVIV3E5aDZzT0JIQWRqQ0pJbUZKL3JQU1huaEI3?=
 =?utf-8?B?NEp3N250OVN3Q09jTyswRk0wbXpubW1LUVZZU2d4ZW5jQmQ3QnJaQTJETDIr?=
 =?utf-8?B?MFdLM2VFdFl6TFJnMmZ0U2xDeDZuR2lVMVkyci85U2dHVjV3VTFremYrQ0lU?=
 =?utf-8?B?SHpzd2ZRQm8zRkxpTXEzYjMrQ091V3huQTlnT1k2SjcrK1Q1NjBidVBBa2JV?=
 =?utf-8?B?VHJkZSt5ODI1dTh2V0hIOWlKSE9BUlV5bm1UZ1RXeDByeXBtdElBb1dpcmRP?=
 =?utf-8?B?QXBQTE1COFRBL3d3NjNkZ3htSHdySUU4bVpDT1d4U1Z5bm1BT3BCWkFXNGwr?=
 =?utf-8?B?UWNsTkZ0OU0xalg0ZUdUY1pnb2hzMWRITFYxRldJUXd5ak1jamhSbThibXFy?=
 =?utf-8?B?eUNPR2EreEU1aFhpV2VKZnF3NVJkN05uSldkYnQxZWR1YWlRdjZpeko0U1R5?=
 =?utf-8?B?a3hrS3dRK2d1cW92ZExnY3haMEtXLzlkRCtuc0dFbW80U2dXcmVJQ3l1Wk95?=
 =?utf-8?B?UHFxV0sxOGRDMnZ3RHE5VUJvU3ZJU2FBblFVbWdhVjJ2VWVQYjAxVnhZcTJE?=
 =?utf-8?B?N2ZSSU1FZXVGQkp5eG5xQkNhd2MrMUl4cUx6aUxWaVM3b1V3aUFra05OWVVX?=
 =?utf-8?B?UFBLVm5NMWFQSmE0bXlLbGdaaDkvZUFzTmtGSzIyeGJLcUg1RTNwQktMRFJi?=
 =?utf-8?B?RWdUQ1RHdU5rb2hMYXZ0cHdEempzZnJCY3JaMzBlUElUdGw5STJVSFlkNUlM?=
 =?utf-8?B?UDRBYUxpV21GeTd1eTNVU3ZpbEYva2NNQ1FpeXI4L0pnYVFpSVBranlzR1NJ?=
 =?utf-8?B?YzlNSCtrSW1rUytqbERGVzlHYzlVV280M3greXV4QnpoMGVBajBqeElMOEdJ?=
 =?utf-8?B?Q2E3ekxWMXFGMHFLTDgyREVZYzlSTk9LaXo4VVozVEdZQitZL254cXlUOE94?=
 =?utf-8?B?Vzk5dG9lSUtRcHdWWFdiUW5sWFczbUNQanFzcUY4TXB6MXFuTmRLODA2OVI2?=
 =?utf-8?B?am51MVZXbFJJSTRtN2w3SmlhNllPTC9DSSt3aWwvZm1aNXY3NlR3cmV5R2kz?=
 =?utf-8?B?ODdvVkxJZVBodU1QQ3lzSElaanRqZjQyRGt4VEhqZnB5MzZVWDVmdGI3TC9R?=
 =?utf-8?B?MHlVL2VlNEVlb0YrSU5kL1lmRnZnZW8xVHB0dU1CYk1zYll4eEtpcng2S3pl?=
 =?utf-8?B?bVVmQkR2UzRZUGxCRUpNbzJqL0krSGNVTGZFUjNuOXhuTzBVTElPamNQcUov?=
 =?utf-8?B?T1NQc0p3cHJQakxsOVpydHRnaHpRZTl5dEh5T3NWWVdVTmczTFl0SlJXTXVm?=
 =?utf-8?B?Z3BvcExzMWJTWjkzcnd3WDhJUUducjZiRjc3Qk0ycmlwRFdCR2grdEtQSzZ2?=
 =?utf-8?B?Yk1IejFxbnRXTVRuME5qazRNcGJwTlE4Sm1naWlqVXlLT2hNLzhnMkR6YlA0?=
 =?utf-8?B?dll0K21YMzJiK1lWYUpqVTdjc0tVcEppSklRMFZTMzJNU2VGeGlkSm9uVlkw?=
 =?utf-8?B?Qmk0QWU0VXpUMDB1cWFERHZaRWVHUCtBLytoSkFXNW1WQ05sQXgwNVhadDBt?=
 =?utf-8?B?UFJPQ0VVYjJWYnVrT2Iyb3UveFphNTZwRTdQVlBDL3E4cnAzQ0xBWUtlc1ov?=
 =?utf-8?B?SHIxZ2M3bVdORGtNenBqOEtZUUpZa2lqeVNwbFZTeUU3ZFhIajZUSWpaeW5a?=
 =?utf-8?B?TXBRajluaktVSTRiWlBsbnVWKzczMzRyMW1YNG9QNkkrbGx3VWg2MFFlaVk0?=
 =?utf-8?B?U0xOaThCdjd3WW0yeHBVZVhTZmdaTmc5NG4rOTJDM3BiR1FucXdEdWZEOVF4?=
 =?utf-8?B?cys0emhJaWhlajdoRFJhczdEVHZhVFdmV3plTldUS2NrSjBCcEdhVGs2dWo3?=
 =?utf-8?Q?cFdkCl3M1rhsuesP7sKzTV8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e44ea6-f2a7-40f5-fbab-08d9a297c176
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 09:11:32.0676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19Jg9z/+Ah+6qIOCiwShZRj9L5nbh2qa40sB79mXGhLdSY+7leEmHWCms66fHoRhntxSkj3XSH3+2kvb/Cl/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 05.11.2021 14:55, Andrew Cooper wrote:
> With alternative_call() capable of handling compound types, the three
> remaining hooks can be optimised at boot time too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> 
> I'm on the fence as to whether to declare this as fixing "xsm: convert xsm_ops
> hook calls to alternative call"

Forgot to say a word on this: I'd consider Fixes: appropriate, as the
commit's description says nothing about these having been left out,
nor why.

Jan


