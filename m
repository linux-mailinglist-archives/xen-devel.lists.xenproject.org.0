Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C2752519
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 16:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563199.880284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJxHC-00012z-Ea; Thu, 13 Jul 2023 14:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563199.880284; Thu, 13 Jul 2023 14:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJxHC-00011J-Bw; Thu, 13 Jul 2023 14:26:38 +0000
Received: by outflank-mailman (input) for mailman id 563199;
 Thu, 13 Jul 2023 14:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJxHA-00011C-Sb
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 14:26:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 443622be-2189-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 16:26:35 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 14:26:31 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 14:26:31 +0000
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
X-Inumbo-ID: 443622be-2189-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUCZJxGC0za5SoRGoC03vtKU/OcVZd15bodirs4zuV0tFSatitavYNDKdCCeP3uFsLDANeGNWSxIsmGyUQzsnCUdQxIfVx1FOux6timHyAFlVuTXyJidulGPlqGyR1HJg4GDvyh1ClO+lUXTti4P21nstZgY54+b98LWJD7msfkuY8TnmwGvyCnm2Gsw+qfEMH2Ut0zZ4LOU235jQOyHOcqRySi/roUBJxZPsy46jIYx94v8ch5VWUPgA9fuhhjQasmyeutJnxxVrHJgrOQ5MH9RPMfGU+MiyD2T57N6i0sbED1fO+wDfxXN3oEgWeI0qhMziBgYqkH+0sDJ/OEyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cng//jCHET8mynMMMnrbIUc34ilas+gWD2Q8e9FqTvI=;
 b=hWHVHoyBtiUJfIOazCE3lYs7R1QkWCg8zB1s5xbmBHMQ2sDlM3mXuG76qttTYZraj4RT8nr1vXOXDH9PnUX9t7e/WtuRFSvI0gTn8E9gaiJ/R7DMZR5cE1eK3F3xMheHMKn8sJSZYca5MatTH9oIt/eCxLoYFAN2c7+wL2n2BaIUYwQi+fVKGqhyJxwMZKOkXKSZbTxDZmnqqSd2V0mWMNu02tgm383YpmPZTdhBBRPS3lNjTfBHw9BaQXCncqJGyLy1A35Io483bNyYqWeIJYOdjRv8dJivJiRqyuRIANNi34PEj3+oAS9gQr+3R+FmoRRiSh+aDwmOklEaOZF7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cng//jCHET8mynMMMnrbIUc34ilas+gWD2Q8e9FqTvI=;
 b=IfglZBInLT2lDcXoe+Q/Eayi990YU1hnW/OTg7OfPxB2NL3eiYt0tErvdH2sjp/4r19C4QswFutv4S+avqXX53w/gaSISjhimPmIpnOlxlZ3KHVMeQRUdi7U3GaAzNftjTCh3uS0qj9773fBHoXQ7aGdV94Oynev+0xwQUSnrA/iapGCAeqWcLZs9/tk35Eoyu0jejq/lSt5yQFtM80nSLWOnJ0CQ1kIBs7iTz7XgZue+dMxDSHL554ynbm+5SUNW53L9QDco7xm0gOmllNdkOAE2zxiQzX+omRa6+5rVgonFtqjaHcRH4EiLGLL37B/wAXah8RzMlnJQS63hS1nCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <200693a2-267d-16c8-61f3-3047dc8967da@suse.com>
Date: Thu, 13 Jul 2023 16:26:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
 <86702f86787ee7b963b131c4b2d6db463eddc1f3.camel@gmail.com>
 <3e4c673d-1b8b-15ab-629f-27a9f687b37a@suse.com>
 <83f67337cb69fb8cf2aa5d56b8a711384cdaa5f0.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <83f67337cb69fb8cf2aa5d56b8a711384cdaa5f0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 75170be6-e412-4fd3-016d-08db83ad270e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RAp4HSZITkNDXxwOaAtnGz7sSW4MNboE2M7Ujq3AbHcIXBFPsZbr6OB7HL+sBjfIuAW8Lwqp65t9KTQHt0RhIvmdwlPNS3f94Q9R9TtGJxbqsRq/IAnbJGO0SABSvXpIGer50zc1ppQJfee3cB4CiL3PMD4jNev64E5VaI7YyB1qgvsUMZ1g+o0nIKb9mqUUq1OYPR7arKwW1py0F7+pzF092Ey1oOMnukcNNh4Iif+UW4Qlh5FmGqJ0/WHa/RehDf/nRKUuBQkToFWWRFlg+4mV39D3/gTyqTwW3oqHI52IfzBLLR/zLojPOMiZImykI7BSSLbC1JtDX6ZE2Xn8OipBYuFE38rqICwfcSwBLfB5ws9PrWPRhYV097tLvEEO5aCu5eFhMpB1+U4FAMfmIG5w5iwbMItAjUA+SvPxCpjxYD72R1I/axKbNGDv24Xyx3CEmnR8952VM9XopJYemwE2NNYJkICuFmnHiWTj5be2Gc+FKcvxTqzJ3WxmwUZEqbkAIJ4MjqZ3IkzpTlNmjkOZB0+z6CJkzCtB5cDcXqQtgLELEbmOeWcRaPlnVY4SHy/PZu65fSKTRW0EHN09I3wHFD3EbmAm1Gtu6iupirFQcVGGor2TFVYz1oBkxLBcjnNfOPnCRRWsNrfaxr/yTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199021)(478600001)(26005)(53546011)(6512007)(6506007)(6486002)(8676002)(8936002)(5660300002)(316002)(2616005)(41300700001)(31696002)(66556008)(86362001)(2906002)(4744005)(31686004)(186003)(38100700002)(36756003)(66476007)(66946007)(4326008)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0txWnQxU1RFWVpFb2RXbkNLWGkvbXhycHk4ZStJNTRFK1hlc1dJZG1IRFZT?=
 =?utf-8?B?YkE5QnBmdnp3aXEyUVQwYVp3OU92dHAwcEVGU0Rkc0pJVnZKN1VrbDhrVnp0?=
 =?utf-8?B?N1A3NHYxazhhbE5IUFRUMjgzd3Bha0pVbk5pd2NmY1NZMjdEOXN4ZmMrNVJz?=
 =?utf-8?B?N1hsdU1UVUZsRkhqT0FaQktWeTR1NGN6bDhkajM2UW1iWXRUMDBmUHRzV01q?=
 =?utf-8?B?NHRoN25IajVFSGRWbHNLYXRSbGtzMmlBZ2FkWUhodFIwWHB2eUFBYVprT0pr?=
 =?utf-8?B?NjZmdStzTHBEVDhOTFR2M0lqQ2d5M3hUOWRoWkVsV1NZUnljUzB4NWdiY0lw?=
 =?utf-8?B?MkZoem1XNDR2N01EUUpiMjgyTUFiandMa2JWU2VWREtpVGd2VktkTWJna3VS?=
 =?utf-8?B?TDA3S3BIYWtoRXoyaUVYWXdnQXhUQVZRcmlKZjBkVmFNam1XOXZRZndCc3E2?=
 =?utf-8?B?b1JueUlYTXBhNnpXbDRyMWE5NGdjSmhQMEx5ZlVraVp1YW9iVUgvOWFjL2pa?=
 =?utf-8?B?aStEY2JvRlo1Z2pNaGlvWTlFQy8wYTE4TmMrU040em11UXgyYWtaZytxV1VZ?=
 =?utf-8?B?MCtEUEtWVHg4NzR0MjI5Q3JycTlROUFFY2tib2dLcW9QclRwbUNJdE9Zb0U2?=
 =?utf-8?B?UHBhZ3pNdTVyTGlnQzhNeUlyUDh4NWJaUURnSzMyVGorRW1CczNWb1drVDBR?=
 =?utf-8?B?Q2xtcnYyQm5rY3luaHk4YWJjZXphZGZDM0dKSWJXaVZxMDQvOWNWQUFVbzZa?=
 =?utf-8?B?VlAwdWxJd25EODZnSExqY0dMQ1gwbUJvSXQrek9NU2htVjBlZjhBNytTcGdP?=
 =?utf-8?B?K3gyODh0V2hCc2M3YTdQeTdLV01GMTZGRnBVbG1Wdi9ySU1Rb3g3NlJkbnFW?=
 =?utf-8?B?elhaWFU2NFFuenJrVlNRR2RsRkt5Z05HMVZUR1RvbFdWRUtDTXdLK1ZDUGpm?=
 =?utf-8?B?L0lWb1E2Yk8xL0ZqQ3M0WUZydTB0a2FMYzNQWVl4Rk4rM2R0dWdUanp3Z3RC?=
 =?utf-8?B?UURWRzd3YjVXVHFqM2dUQzJuZE1XMzA0M0t4ZnE4dHJObnRzSjFJRVRwa3hG?=
 =?utf-8?B?WHV5STVGVmdUNkIxdFFlb1l1bXhLTGE3S3l2YUZ4Yjd4cjJpaHR4Y0ZhZDFV?=
 =?utf-8?B?NXlsZEFkKzFzNTgybmZ6UFJsUUt0bmZvVmJmRy9nUzVFbWt2aFljMWpsOGpD?=
 =?utf-8?B?emlrNFo4TGRJYTMwUmQxc3RPWGFNUHZHN0RPYkx2bHFsQTI1dkpPbFB6RzZS?=
 =?utf-8?B?MHJaSStweVpSdXVlOERJN2xPLzJldW1OWmgrL3I5NTViNXNsSXNPd0JMdVNT?=
 =?utf-8?B?Y2pCMkpCWUwxN3pLYzVDNHcxblpoUy9lQjBUSXVLNHluaEVZcUZ2eFlqcW93?=
 =?utf-8?B?dmU1MFlDc0FmeWxtNmZqYVVVN05aZW5GU2xzLzRCNWphVFpnNmhrMlYzUGJi?=
 =?utf-8?B?d0pZQ3JtVjJxYzBxMm1WUXBUaloxdWU2ZUNjblVnR1dvVXhkSVRYSmxUakU2?=
 =?utf-8?B?VVc2WnRueStTUXZVci94b0NQeDFjVHZrN2g4S0Vvang5Wmk4cnpEMTZhZmk2?=
 =?utf-8?B?ck9jbWkrSkdIdDlsbXFLN3REMm95ZFdoV1ljQXpqZjBmRk9pWXlKbytjNVRM?=
 =?utf-8?B?VDZVMjFxMmJBSHVudEVQSjh1dmJiVnBKUm1LRFdWN0ZTMFQ1V3dwSVBBKy9G?=
 =?utf-8?B?VWsxbkFCYllSMjNrb25hUEZoNE5WRndRTlUvRjFUM21lak5kUTczTzViU0hM?=
 =?utf-8?B?NlJvNkIvK3RMM3gxUmZ3TWhFYzN3eGZiaXFuRWM2aXMxRnc0VStDRmVrSUlw?=
 =?utf-8?B?WndHVVR0YW12UVJSOTdIelpBYk93VDBMUDh0TDE1VXZqdmZiZ3lvNmlYVVNU?=
 =?utf-8?B?THNybDR3MXJUeUpOLzFDcFJmU0FjL3U1SWEzSGl5R3pxcFVYQ0pqYzN6aG9k?=
 =?utf-8?B?UENpaWxwZlVuNjZtN3Z4cDZzcmFNK3FoT1Q2aGFDTFFyd1E5bDQ3UFhYZld5?=
 =?utf-8?B?clM3cnhySkJlUDRVcWdmbE1iSjdIK1BKT01NYWpod1MxNklYaGFTbUQxeWtV?=
 =?utf-8?B?YnlWN1hOakxLbGxoaGg3TytYdjZubGpUQjgvWmtlSnlSOXZ0Uno1a0t2L2hh?=
 =?utf-8?Q?QXwID0DGdK3tDH/zwkn0nm2Qg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75170be6-e412-4fd3-016d-08db83ad270e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 14:26:31.1941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ej1Inrxm16XLmbANM9zUlp10TK5TRg0AxnWs9LOtJ6OTw2hI++VxEBDLqorY4JbyjEobwSD2JOszfmUTzETAWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355

On 13.07.2023 15:36, Oleksii wrote:
> On Thu, 2023-07-13 at 15:27 +0200, Jan Beulich wrote:
>> I don't understand. My earlier comment was affecting all checks of
>> uart->irq alike, as I'm unconvinced IRQ0 may not possibly be usable
>> on some architecture / platform. IOW I don't see why the check in
>> ns16550_init_postirq() would allow us any leeway.
> It looks like I misunderstood you.
> 
> Do you mean that on some architecture IRQ0 may be used for ns16550?

Yes, I don't see why this shouldn't be possible in principle. As Julien
said it can't happen on Arm, so if it also can't happen on RISC-V and
PPC, we could elect to continue to ignore that aspect.

Jan

