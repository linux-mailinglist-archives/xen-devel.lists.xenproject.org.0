Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEAD4452F9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 13:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221514.383265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miboL-0008GL-C5; Thu, 04 Nov 2021 12:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221514.383265; Thu, 04 Nov 2021 12:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miboL-0008De-8H; Thu, 04 Nov 2021 12:25:41 +0000
Received: by outflank-mailman (input) for mailman id 221514;
 Thu, 04 Nov 2021 12:25:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miboJ-0008DX-OQ
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:25:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 514c6de0-3d6a-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 13:25:38 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-a2_y9Y_9PZ2gRlFkXpJTEQ-1; Thu, 04 Nov 2021 13:25:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Thu, 4 Nov
 2021 12:25:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 12:25:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0286.eurprd06.prod.outlook.com (2603:10a6:20b:45a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 12:25:32 +0000
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
X-Inumbo-ID: 514c6de0-3d6a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636028738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1WfbRWjZHG5PbM9FFk92+xJ8AVB/z5YNIg62yAl33Y=;
	b=DV6xE7GMubw+z6lcpJwdYQpDExCxik9hnT8dK2ZxsRpbvUe+kR+NCCVCBSZvX96OekfkFY
	mhwU+jVP7EjpwgirqIsZ72O79VhN27Q4i7TK5QyDh5Hd7EUBkFVcSx7gUIQwFicW6WmzmS
	SKrdPp94H0Zkwxjxzj0heV8z+vAy6Uk=
X-MC-Unique: a2_y9Y_9PZ2gRlFkXpJTEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMxRn275xd66ufF2a+C60q3vlDnNSHzPGucxmvduzV5dSxd1nZ+qAqUniXI5RkNR5Ey0HNnNheQx73djqCBx9dWWK8Lly5YByQJIpYX2n4OOc67peyxcqiHpQ2Q/Z+qwnxKW+MDfHXX7ebsmWhS4lDEFepvrx7ffh3bv+GjkUfKK9sjFGIO9/on79fedP+IOcF2VVyMBKxwhQTpbb2CRLW0qYpteALEumHNd+xmCuONK6PU77e9Cfv0Jh71+UHCbgDPJX1G2P/h+AgiOZH+uvb/LugEuNvEhNieaOi29p4SFr/LtzI/itcFsXkSJAmlZqwfUEjYbDXGXOrmXP1H1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1WfbRWjZHG5PbM9FFk92+xJ8AVB/z5YNIg62yAl33Y=;
 b=JsirQPa3KSRKiAdlSw4UttGQjqP6UtGt8dKEmM+AhEnRTeen+8TaLr9n7cpATyiQDlmOjHYfWqaPphatRYWkc/F/XiB3yYcOEK2aFZxy2jqKm3u6XCyakWEncPFLPzwdeTYId0sCtTF8avMutMiYtGBfcYvbPKhkl5kD28xICMGz+TYFEFq2QaYJ0CsQGdcTSRuwkL0fIWGwXqWlGEuH/WXUBSXmvEqXN2OSKfIJ2CUE3jxHUJ6MED+6VMeujnuJlS7Co98SCDn+w6cjogoOyddSRogkNMLdMENyC5xQJ4bLLbeFTARVtu85BAme4PhcHJ1ZKoeqK8CxWTnIkXIZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ae2c1ac-b220-a5ab-920b-244590ae3ef0@suse.com>
Date: Thu, 4 Nov 2021 13:25:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20211104104834.10977-1-roger.pau@citrix.com>
 <24963.52610.316896.770905@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24963.52610.316896.770905@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0286.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c21c4a-343c-43a1-c815-08d99f8e32df
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43515FFC1B77C30B19E8A200B38D9@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZO8Mt5ZZYILtfwfxUf/Fzaw4yDfVL9pMMc7gm8CAeiU5FRPzHWQeP2KW45gTUGzNmqzh2SlhRv2qUGO9CmsySlNBCTCekdFWIyqIVS40t14SeZMoapZ/e1XXLhf92nfQcRIqii6hR0mgO/x8Oey/AWLSsWVUx8aXKbLxt0WVMs0yn7a9uFz+sAKnQESjwLFYvrCjd9JV2gvU7Cb9z6LDCC2w1EVsC5l4bqlMbAHyGAc+1SYN4j7vlBix646xCp6fNXF9VOWo+ujjHBYFYEj/K/u85vKXFYDZB2HQ7jLe94RZM/hn8C28wZpOG/yNpNRuvY7OoU/+8JVI12FUW9FuYLoPaCOr13HhOmCdmOFZj+l1EqyEGplfRCeFk+uKN6OhPCB7/veTDPweWFnsjNvsCine3uf6i7zTIWcEimxv+a6XkH7RUsZoLngln2ZpNqmgyRvNB4YTlTsEIcrpuT/goo5FpYB673zQXMDfWC6y9mHWgFtnj7nGrdJLl9Zc549ol8iRZWTFfAb1OY+yWiQKIr9LugRQDe2iDHd/M1zgOhrH3wusK2Ey0vkdroCHR5HldL6h9oW4s/CrBw/RcfaRGeP1Nc9dkSEHgXNTWwqvOtGQ98OyWAIbir+U5czUffEkSYeRwe+9ndDrkV4QuVADJ4/qG55VLQq+0DHt2N9CNjuKv95X1ToB92cWhSrG5kZl1qDzU3rN6bzjnQEnVe6uiLfmmZpc3MaM5+GPF5m6G3dPJPdahi212rKjei4fduNoLw/OQyViMTjWLsZsySMfwiOcKdA/AdmGiIB3EPrGULwRqd1gh0Yj32uinYRfbXdY1vyVnt4K8UvCytEL9g2R+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(966005)(8676002)(31696002)(26005)(7416002)(86362001)(186003)(5660300002)(38100700002)(36756003)(508600001)(83380400001)(2616005)(956004)(66476007)(316002)(66556008)(6486002)(66946007)(54906003)(8936002)(2906002)(4326008)(16576012)(31686004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlFtUitLa0JBZVQxYURIaFR3THZnb21jSHdLaDFBWkhQUVhRKzB0K3RsTHE0?=
 =?utf-8?B?SkQvd1EwUGlJcjRvN09JdXhlTkVNWDh5YlZSQTloRTN0K3FyY3dTSmxEeXor?=
 =?utf-8?B?cG1lOStBS2ZFT1JhOFF6UjVpd2s5dkkyREdrUFZBNjg1WUlwemVmUmpsclFZ?=
 =?utf-8?B?dHJWbExiYzNHSklYcS9ZdmtUUEVWWFIyQXhCWU10azZEbXZheWR0RVpRdjA5?=
 =?utf-8?B?VFNsaTFGV083cUxkbjJycUxTR0M2VFZHNDdLbW5yTjJ4aTFpSHpWYjNpU3Bk?=
 =?utf-8?B?TmJCejVsNmxJVFcrS0JqMEpkZWFZeGYzdEIxU2pQam5xZkRncTVheWJVQks2?=
 =?utf-8?B?VVFJTkphT1hNWmozbExQU1UvS1l5Wi94RCtmYVAyaVIyaGcra1F3L3hiMlpa?=
 =?utf-8?B?M0hFRlhWTEprejdNb1htQXpYM0xHTWY4eWlNQklTQVh1VkJsVEZzYjVXT1Ny?=
 =?utf-8?B?U0ltOTJZZVNNV3p1RDFCVWZSNDZFU2RTaGZFbVprT2NNWDIveEE0RW1lUkVU?=
 =?utf-8?B?U3BaTVhJcmpXcUZSYm55cnJiRE02YmdCaTJ2cVRnQW9FTjNuYy8vQW8wN05l?=
 =?utf-8?B?WmxpRHptRFFnblN4UEZaUDcrQ0RVZ2NhZEZFTHk1eXlDeHN3NW84YVRxaTdF?=
 =?utf-8?B?Rm92QTZveWdwNGdYZE9rM3Nkdnd0d2V1c3ozaGNCa005N0dwQkVuUm1keWdV?=
 =?utf-8?B?MU01Y1VURndaRCtpQjVyMlNrNlkrUjdHTDVoOGkwOG5CZktQc2kzNnpNSTd4?=
 =?utf-8?B?WDlHM2xLbk55NmxhU1ZlV3RvMS9vaUpJZDE4VEk3cTNUVG5jQjROZjk4Qm45?=
 =?utf-8?B?c1NNQXNNbHNHMFgzYld3VVUzeUVPMzVHTFdpbzJQNnVxVUJiem81Y1FQc3dH?=
 =?utf-8?B?Zll0N0pZeDE0cmVwVGQvRlBxU09mczlTVTRQelpwS0lCTWlmeHkwWTA0dmRs?=
 =?utf-8?B?bDU1VFJzZjVRRFdTRmFOUm0zN2sxU3VSenFxMWpRc3lWQUNnajBxZVVuNFZ4?=
 =?utf-8?B?MW9VSlZYUm1EaXBiWnJ2ZGIraWFKSjRWUU5QVHljSVE5T3dic1U1Ly9YMUti?=
 =?utf-8?B?ekRGQzlGQk9vbll2M3YxMFN6Mk85Y1E5Zk1FZ0RlNHE0WTFnZnpnVVZkWnk3?=
 =?utf-8?B?UlcxK2dSRXY0SEt2N0t2WE9mbWVhUzRZZWtpc3kxZVlaMWtKSzJGdUp1aXFK?=
 =?utf-8?B?djd4Nlg2ZkdtS0wzVVpLZ09vODlKbjlhSlhSMGF1b28yWHBRdjF2VUYzOXdL?=
 =?utf-8?B?Yko0WW9TbW1rQkRTS2FWZXRNQytYanBhS1NLc3pieENqcDMxOUpqUU5ZRWFS?=
 =?utf-8?B?NU9nNGV3VmtjUXdHRDRNVVhTVGNxcnE1OTkzMHZCNDd1dHJncVNSVnBCcXRh?=
 =?utf-8?B?eTljajN3TnNxYjdQWFdkdVFMcWRsaWVydmx4bWNuQmxmNzhReDk2RDl1OW8v?=
 =?utf-8?B?aWRmc3BSTElwVTB3ZkdDeUFNekUwVXVWdVc5cGZDTXVKUmtkOXN2NTIxYkFp?=
 =?utf-8?B?bFhCMExvc2NzanF2Y1VsZVI3TS96WHZkNkJNZ0hSM2NTcENkeC9mZFM4UDRo?=
 =?utf-8?B?WUFsUUM1L0YyUXo3akFSZmRJVHJGWnR4T0l5cjlPeS9aNXorK0VDV1c0d1Bu?=
 =?utf-8?B?a08xOEFXZlZPOG9sU29jNGdia3NqeHJKdlB0OE9XSFluYjNFQTRweC9hMjN4?=
 =?utf-8?B?TjU1TUhCR1djMUFrKzNGR0owMmdUcjB6c2psMEl6ejhzTEQ3RHNkMk9wUHJP?=
 =?utf-8?B?TVpnWWNEQUUvSlMwNEViUWFNanYwdjNZSjlpdzJlcjJDL1pkeENUVE1DWVVQ?=
 =?utf-8?B?YnFDZStraUJuZ1pWR3VkOTd3NitLekY5bmFiMWxucnI3ZkRLaWxVOWRvV25p?=
 =?utf-8?B?SUhneitQcjZnZUs1cXhsNnY3VURzZUtjeGJaZnJpWnFMcHB1aTNlemxPSWs2?=
 =?utf-8?B?djgydy9WUC9FZmFJUVVZRmMrUlAvMjNZSVhxSGVERmlWcUxHd2publlubVlv?=
 =?utf-8?B?TFNkUEYxdEpmenVJY3NVbkc2YkQ2RVZsblN2MWdFNzhtYkxyNEp5Y1FkdFB0?=
 =?utf-8?B?OEdpQ1c3cmhsTFNRYVJlTTh2RTlpSmU5VVZSRDErL1J3RWZOMEpuWmZiYnZh?=
 =?utf-8?B?SmEvZzJhcmNrM2U5Rlk5Sm1wUFFEQ240VXljTmV4OEd6ZzlrR3d1M2htWXZ1?=
 =?utf-8?Q?OrAh0A5ib0toM6PrnXCXxaQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c21c4a-343c-43a1-c815-08d99f8e32df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 12:25:33.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyB0JsZtL2B8nL+qjUvK1Hq7obr+RkvhULEaCBhAN8QqhPxLz8ZzNA01HyL5enb0hdR8UpD9RuySoPX3jbEgvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 04.11.2021 13:09, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
>> Introduce a new domain create field so that toolstack can specify the
>> maximum grant table version usable by the domain. This is plumbed into
>> xl and settable by the user as max_grant_version.
>>
>> Previously this was only settable on a per host basis using the
>> gnttab command line option.
>>
>> Note the version is specified using 4 bits, which leaves room to
>> specify up to grant table version 15. Given that we only have 2 grant
>> table versions right now, and a new version is unlikely in the near
>> future using 4 bits seems more than enough.
>>
>> xenstored stubdomains are limited to grant table v1 because the
>> current MiniOS code used to build them only has support for grants v1.
>> There are existing limits set for xenstored stubdomains at creation
>> time that already match the defaults in MiniOS.
> ...
>> This needs to be applied on top of Andrew's:
>>
>> xen: Report grant table v1/v2 capabilities to the toolstack
>> https://lore.kernel.org/xen-devel/20211029173813.23002-1-andrew.cooper3@citrix.com/
> 
> Thanks.
> 
> We have discussed this wrt 4.16.  I am minded to grant a release ack
> for this.  If anyone has a contrary opinion please speak now.
> 
> (I think committing both of these would be subject to maintainer acks
> for "Report grant table v1/v2 capabilities", which I didn't see but
> perhaps I am missing.)

Afaic that patch looks okay (albeit not really a scalable way to express
things, if we were to consider further versions to appear), but it wasn't
clear to me whether Roger's reply was meant as an objection, a direction
towards doing things differently, or merely a benign comment. Hence it
didn't feel appropriate to give an A-b just yet.

Jan


