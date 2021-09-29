Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3941C048
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198775.352447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUd7-00040n-5K; Wed, 29 Sep 2021 08:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198775.352447; Wed, 29 Sep 2021 08:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUd7-0003xt-1R; Wed, 29 Sep 2021 08:07:53 +0000
Received: by outflank-mailman (input) for mailman id 198775;
 Wed, 29 Sep 2021 08:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVUd5-0003xl-J8
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:07:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5655cfe2-20fc-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 08:07:50 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-gMy4twG1MF2-ga6iUtEQNQ-1; Wed, 29 Sep 2021 10:07:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 08:07:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:07:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0130.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 08:07:44 +0000
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
X-Inumbo-ID: 5655cfe2-20fc-11ec-bcdf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632902869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+B5/iZO428rZrFD5p7xGraQznxRlLXoSw0d8Pfv2pnI=;
	b=G1nVrXn0FMJnj0SG9R7aGDzE5WHMSv4oz+aclr29GG60Yzw5BxNQz+8y8xxuCdXHrYlR72
	Z/4m6wSnznQoXKq3DDArjLRwcEADRrgwnGZ6zcUqy3dhFimnRqKlJY5Gwq4dI7Uu8Ln0ef
	h3yr+Gu876X2YtS0EdlKgqEc06xiDpU=
X-MC-Unique: gMy4twG1MF2-ga6iUtEQNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MM6JalX8jC8z7VolZjLFbAW3SNq9iKY9zJVkR0KxxyRmh+5LFLM1N/eI6b10Zb4orA1pWnOb28n59HfqDVY50Ayn/n+JtEdCpQQbymUG9fcGx9JtlNBfzLz9ZcqN0lBdgra5t+0wDuILe3eprYM3ghPHPV1COTy0SuA/gukRzVYrs5qa97ZkyLc6AGBj08TXATtnlkKkUKXmQoK4VJ2PwyyHdW4noxqw+Zje+YTvDJdnxY3+sP60atW/ezo0+Jdhz3qC1RjvxlBtBh8pPIKW9ELV/fTrsbKFbqcj0rCQMMKjZ8hHyH6jXyaWxz+Lg+MVnBvq6E/sCn83Y9EpKyl/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+B5/iZO428rZrFD5p7xGraQznxRlLXoSw0d8Pfv2pnI=;
 b=EkdW0Wwmow0aPFmuaYtMWg7JxCbqYXMc3IWCyfJP4gIYxDRQwxCGw3W1fQipIJGypD+u4HadlNdCCwE1JCqMQJudq79kfU3kRjwsQNO5HikX0nUACme35xDikqB89JjxUEiTuvxmiKcj4ec6XMuiDGDM73M2cI0fgcuv9gorh4zVj8bvM8u24QYHXyuq4FUyhX4FV9p6JZhwHgYNX8WAP8vUgDnLqXUZublOGsYLlpPKZKoM0Bcrgfz5xOTr71LqZNytkKonoCQCF+om5G53odh1wKwnCfktHNTs2zTc9K+Swk+H1lZsAcaAhrhYAJ5U6VRDSuykkF+KDDfs0cZSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/traps: Fix typo in do_entry_CP()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Bobby Eshleman <bobby.eshleman@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210928210014.27954-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3408f175-d71a-267b-515a-972b3ed8c4e8@suse.com>
Date: Wed, 29 Sep 2021 10:07:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210928210014.27954-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0130.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e94ca02-46a8-4588-5a23-08d9832037ef
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176C4EEF0DA81EB839960D3B3A99@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KV5jTFTUUifStb4Gz0mmMJIphXMQoI8+FeDPVz5NuyVzRWk45TxT2wLe53aQViD0g6yIkmAl30eOFjwe0ZJy64xX7wRrjL8ja2iCgX4uHVU2w0OirqBdiX3LuH5EdEPZ9+wwNsO0D5fCEUfpHD3AU4EaTyNYw1bdaEFgAIYc37lA7jo406ZUY7Bvt214nYqBGA8N/L02tGGf1N+LEhlh3Kuwv6YZ7MKScVETBU5cSIKEdeABb1giEpI1/lD/G5LQSXDpcBK5wKdkrEAaYakG7/XuE/AIUWqKrF9/BqKpZA09sXx0ZlG4bBFNRwLLUIFYA/myxaCww27QIpHRqk0iHhaYIcGE3Nrr+KaIf/l11Zk//5Wy3x5JVeVsesryUxbXkv2gJ0Xwpte7kxVSHNKvTjvILEi92C3+2/6KhAbqhRPIfwr70ojemGlL7uznH/SCPHy/5O4FRsFb3/rNta2yo5AlIW3JS39pLMBpgNAYjfF8pUMCZUb7D2j04voLzHK/4IGGFj4pk7Ca/FnDFe4O/P6sWRH5/Ij0Oi4NaF+1C42Vk595/rwDXEJeG75AUdyzOTZZZEdIdax9mzDNArOvzO21qOUgcrtPxou31gau8daRgS23GmB4nJcAQ6EzLJqIoEOeP0YdtYBI7sofm41kutoYDrpWTw68f8FFVqP2InImpDrjPn6mE0cfH4I1Xxq8CHqAxRnmm4uOS+YMG29cfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(54906003)(4326008)(956004)(316002)(6486002)(16576012)(38100700002)(66946007)(8936002)(2906002)(66556008)(66476007)(53546011)(5660300002)(8676002)(4744005)(2616005)(86362001)(186003)(31686004)(508600001)(36756003)(6916009)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnVCUk5JRVJUR1UwSXozMGFRaVBMRTVGd2dOUDhXNlBXQk90RE0wcEhiTDhP?=
 =?utf-8?B?NHU3Z0Z2bGNCM21EYVpSS0VwQzZlRFc4cURENkltT05DdmZGODd5OUovOVoy?=
 =?utf-8?B?OER2RVRaeVY1Q0dYa2tNUWpoT1NJbGlPVzNrN05xbG9pRjdCLzdCV0dWYVdu?=
 =?utf-8?B?a1pnY0haL21QamQxV1dETlR0b0Z1ZHV1dFBxOVFkcXd6N0U1SzNzdEhTd0ZL?=
 =?utf-8?B?dmNaNUtjUmVnQmZCT0R1ZXZBWGtDRm5ob3dkdUNkbjg3bDdXL1VQbWZVZ0kv?=
 =?utf-8?B?cXpCMmxqSGlsZjNkYklIcU5XeEo2RVRoc0Y4SGRmN0NDLy9xYk13UWo5MFRB?=
 =?utf-8?B?L2RxVjN6dkdJTTZxemNJRVdPaU9SVkVocFVHWDVNcVc0N2FqaDdUMGFKL3kv?=
 =?utf-8?B?d25yU0g4aDJEQlBOTUFYQXFqK0p3NVV0YTlDcjZCSGdGMngrbnhtV09SdnFX?=
 =?utf-8?B?aWkybXJLWFFzRi9pdzU5SG4wTnUyVU1BclFudjV0eXlmUGpuVUYza2F1MjB3?=
 =?utf-8?B?UTBlN0pjRXhkNFlSZnZIOUJtN1M0ZVk0RCtyYmlwa3B5cThucFpWakVsMThF?=
 =?utf-8?B?OUErVEtMT0syNlZiUkpTWDQvcEdGZSthYWJMQzdQWXlDbG45RkJaQjMrSk9q?=
 =?utf-8?B?TGR1Zmc3Nm5yTzRDZTdiaXpjTnpOQWl4SG1ZelYycmVyWHo0TDE2SDdLNVJU?=
 =?utf-8?B?R1RaakpMYm9tZlZQZDR1QTZTTHFHOXhUbEg1RWZmdEJYQTh2dGlTQUlIK2dp?=
 =?utf-8?B?VnQwSm1RWUNuSTFzbjVWeCt3Y29qZExPdG1EWW9vTkV0cURCbWkrNWNJdDFl?=
 =?utf-8?B?UW9ZejQwZ0MrcEJ3UXVMcjFVVG5UZm1RSVBrcG9IRWNsc1EwY3JZcHJOTGZn?=
 =?utf-8?B?SGZCNHNUd0ZOdVJ6Y09NYWhGK0laeUJxVnRsaDZZVjcxNHBLbUdVd3hNdldh?=
 =?utf-8?B?WmFMTjg3YTc1NnlZKzFXSk1vWFU2WHJQQ3dEd25nd2J1cjdjK1FYVzRFMW9o?=
 =?utf-8?B?MjUvWDZNNGFRMjZCTzlaeVV0MUtCc0tyNC9iWnVxNXNWeHF6dnRON0Zqakgr?=
 =?utf-8?B?WlYrdG14NTFjSHkwcGQ3VTYyTkVLazliRENNb2EwZmFXc3dUcU5ETTg0UlV3?=
 =?utf-8?B?QnIvSEdpSGxQS1BvL0RyWHlGbmpyS2VPdkZHMkJhM0tEWTl5K1RneUdNdnJp?=
 =?utf-8?B?eDRabWpjdFpOY081Q0U3OERCVktYVFRLOWtVWFZkMmcveDdsYXRJRGFqOXNo?=
 =?utf-8?B?U0N0cUNkUHd3OXVuL3NqZm9VU09BQkZXUzlSWXlWTjhFbG1yOHFOd2dYdkFL?=
 =?utf-8?B?bnpMUklKalhNSHREU1E1bnI0WTh2MjI5RVZsWXllZmZ4Wm01V0cxVzFwWE1k?=
 =?utf-8?B?NDFudFZ3bnRRTFUxVlNPT2hhNVNoR3NleEFHeEQ5dmtLZHA0eTFBL2VYcWFB?=
 =?utf-8?B?VExhRERWMnRIZDlTdk96NXZLd0F4cFk4RTdCV01vUzNueXVuNUlDMHIzd2Y1?=
 =?utf-8?B?cVpKYWlLSDkxcFBVTnpuK1RVSnR6NCtxQzM5ZHkxK0N6VEM2WitnZjBrRFNR?=
 =?utf-8?B?K0hZR3JZZkxIdFp5MHhkQ1pFS2tTUVdXZlZhVWlXWDJFeGpvNGNyQURFL0JQ?=
 =?utf-8?B?bkUwWHNXRWd1bjVpVGRiNU8yMmgrNFB1K056YnBUa2hnWlBQNGhTaXIwWWha?=
 =?utf-8?B?aHozVkRyeTJURFQ1S1cvSmJuUGJLZS93ZDhRU3Rqa2U4K1NkQ3NoZVNTODdu?=
 =?utf-8?Q?+lM3m2uQdU4Tgu1VDpro+Jtadbfu4HIxf6BF7qz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e94ca02-46a8-4588-5a23-08d9832037ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:07:45.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIEmFoSMPtm1zGEwNYhv4Wz1duI6gVOePkfKN8GjCaoSOZ4Kg/MjSVHuA7foYIaicnzmzmHf8vSOPfAelzb0Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 28.09.2021 23:00, Andrew Cooper wrote:
> The call to debugger_trap_entry() should pass the correct vector.  The
> break-for-gdbsx logic is in practice unreachable because PV guests can't
> generate #CP, but it will interfere with anyone inserting custom debugging
> into debugger_trap_entry().
> 
> Fixes: 5ad05b9c2490 ("x86/traps: Implement #CP handler and extend #PF for shadow stacks")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


