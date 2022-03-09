Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA84D2F9D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 14:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287834.488070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvwZ-0001jJ-Kk; Wed, 09 Mar 2022 13:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287834.488070; Wed, 09 Mar 2022 13:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvwZ-0001gK-GK; Wed, 09 Mar 2022 13:01:31 +0000
Received: by outflank-mailman (input) for mailman id 287834;
 Wed, 09 Mar 2022 13:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRvwY-0001gE-2n
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 13:01:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 085deb7e-9fa9-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 14:01:29 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-MBHgqm86Ng6zHfiG9q0ytg-1; Wed, 09 Mar 2022 14:01:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6757.eurprd04.prod.outlook.com (2603:10a6:20b:fb::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Wed, 9 Mar
 2022 13:01:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 13:01:25 +0000
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
X-Inumbo-ID: 085deb7e-9fa9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646830888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQX5kbC3fuZVqVj9z99ObU3Hu1iNiLCQjM5+eovw6fA=;
	b=CI5WoN9jt4NjTrsV1nJqctLWwb7uePGOShL9QGgZJB94fCb4nO+m2FiXMYwvVfG5JNVgrU
	S0jvdWfJ+7/VkQ4z+am0el0ALHOTqLG2si/7o7FT2kxBLashAspWtRGKHAg12D+rUvGtTB
	3e9vlYx6UBE+UEMSzfYMQBUkYnUP3LI=
X-MC-Unique: MBHgqm86Ng6zHfiG9q0ytg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Skjn/SlC5qvvkrb2kysyMMoPKr1rtH52oifecTQ38mGk9gtzcssDY2c9uz240Dd3SCzYpzZzSSUNhUp+4JM99CWFCU9inHz7wSpxTF1db79ZNzpFfPpOpZBrjiNefglUc5cJeKm9f3tjSU1uHEj07EKOqwwDrsQmF6Ss+ByARq3S5Q+qaVNL5AnvTZcA+1TvYzpoEd1KSnSrSthk/D/we11V+6RiU4FvfrriT3ODWdeqG9CAo7iC6nhDUb0ryWdsxHqeDIHui1CeztpJlxHZ9cXmMffMLEw04yr6x3XYjLxetuN7VXWFGtVLM6ewmrJOcPCtdQY0eHHc0C5Swl4s8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zv6pipt6bohpm2pccPj4I9JydfDlQq9W59tUKYPRG4=;
 b=Nr0x0eblPpZ714p1sbi9C+BDDVxIbir89nLrLc205ISZXgxvD1rZz7V2WFxjBx5TFy4lWz3rFPro1QgDg3RjzmVO1QK2r7UcDklVv+1KNGkY7D2SEwTOogN+SoD8WPKcpZnWKgMbnMoWR5w/xX6Il8tF2FKh5oMW7JZg/F2SdDsI36VRRLhB/xtHPPcZHMbgAfjse9pn5FqfDjUMWZd6zVqcmMCcaSowest19ZWliVRXXA46TtbZqnrYLi1H4Cj9JwIykdDze1gfrlVN6H1OGxUQylHoy36pqRxiHKY1yMiXTo5qxZfRSI/t9wH5RLtEira14sRlgtEePsDve1W71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5dcc752-20e8-91f3-54b1-f356b33c9721@suse.com>
Date: Wed, 9 Mar 2022 14:01:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] x86/CET: Remove XEN_SHSTK's dependency on EXPERT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220309123936.16991-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e86c8267-dae6-4c19-28cc-08da01cceaf9
X-MS-TrafficTypeDiagnostic: AM6PR04MB6757:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6757132C39FCE6E3C5A950A3B30A9@AM6PR04MB6757.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IzqjJ4AoQbgNcO1u2MTaLvEfUWVidLBjZsvuVLBBEpNqAdu0mEa/3Oh3zahPRaOXPqg4pdK5bcmDb5J6RHMUtHMsSZ3isLEoNrKNDex2bHgpQamOuOaYPiavs3l6S8kbW3h+MIwRzWbbRHrk7gX29lvH/X0JYqqt6dmvNgx5Frzp2T4DL4eRntLpX5G5Voy/RVJ7jnc1VLdueJwleWwHCoMXCisBvUcAGmAbZnUA7QCxBdN/1aGdqV0mvd3OXtGypMDk+p+C8IqGZGrru0lNCl8DIpESgIGusIwGXIWTUv6L46bQeoGMh6p5UzJ57r46dUSzXqCFso4yNVSOgXQAnbyOI/Odj9FCFCtcjZRmCpZ5icwAoEbllF6vLaP0flrr26w6neIzEleWZ8yyVCUZJ/PAjMEG8Fx8HlFVBQ2alRllQB8ApAvt+MLJPN63BQL8IWOCh9C4Orf/YoHRnjXDgcbGQu/yU3EONZWiWhyrWLVLBY7aZVNwf2ZBvva2jzBzbfWTcQ3CJwwD9yCCPltI5LW8GlApuU5jZAC0FZhnM5qm1qq60fG7VSAbZDl5jDvwsf0SjveEUD90twvF5hANWQCs4R9+bIXUojL13GWnt6uVlLlA/jhjJwLrVlLdAJVBUrHZJhX7yU3fnI2SJqIfYW5Yz0YxPhAYGqcG8HMh8Imzzf9hjaIciNZa102RdbAI9rnXZbNEIfK7rJrWRItyy+iysvvWkaSCkbqwbb2a2mzHi+h6/bvuRAvQK0P8t3j3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(5660300002)(36756003)(38100700002)(2906002)(4744005)(66476007)(66556008)(66946007)(316002)(6916009)(508600001)(54906003)(31696002)(86362001)(6486002)(31686004)(6506007)(186003)(6512007)(26005)(2616005)(53546011)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3XzXAdQJhxeQKVJdD7eOPefhazjqMyjH4wg4GRZlDTUNZdu5Kyc9IkUfATyx?=
 =?us-ascii?Q?hxe4zt10Pevlln9PUjHrwEsnqcEwsRBCUa/h8Cqm/9sRp3ofMoY+RC7xRfps?=
 =?us-ascii?Q?F6AIaMC3gl7t2ortVdxd+y6aywPZeHLncEWL4NrbPrcQL2vHXrSD7kle5LBt?=
 =?us-ascii?Q?pXlrc77jKoQIBHSBo3acE0Mp2zqdHzWjmBoUaOnaKD6Wvtha/l9czjoOxvKV?=
 =?us-ascii?Q?5pyPHwvrMbcNGAukx9AM2zrHKJ5IGDJ8gpZJrmjpUDsSqy56KHYQiX8LSYoo?=
 =?us-ascii?Q?XOJm7MdzPiQgtOAJH9CWcTg0DQ7mG97Gtov7iOyB7fwl3SAh7LErpSiiYk5t?=
 =?us-ascii?Q?ADR+JE8JtCb6NDyECBvwDKBbia0CbvlPUkrN4QRcYetE75ExN7HECAMZBNi6?=
 =?us-ascii?Q?Eykjan7+C9xFi4Z1WOYOlEpDPRYta1aBalXAk1DIIbHWdLUR5wsmd1ZOtGg9?=
 =?us-ascii?Q?KB3NTDmRa9njzzUy04C7EG/F/kK9RAGivdzfUd8dQRsqGflhK6fS+HRkmzgg?=
 =?us-ascii?Q?X5abw5c5DuF/mBU+AWEpgxeWE2aYqGkqUHL+yuUoN0CLATyq11Z+XvSWzIHe?=
 =?us-ascii?Q?AZPv9830O/ZHW5CpnJDhpvJPRnPSxSedD4QaNgykmD6wZb+XdoGH/Sq6wfjY?=
 =?us-ascii?Q?cVsyRoOWBN2exhglI2lsbhzxwJJoOiy2DXB5g+Mk8RGGBfUeecd0RzFocTHT?=
 =?us-ascii?Q?o/ZkYKwQyXcVYUUDFZpe+auyPxoloxifkSwYrpAR7OZ9ZohtBXCiLsEM8UWr?=
 =?us-ascii?Q?CddHFk5snBxBcr9N1zGqu9WuxFU9TaqPbJ9y2AX9fFXmII434sBIr/D3bCcu?=
 =?us-ascii?Q?s5hungfGC8NZrAgSRHUuOZZGw3ReeWRH0ifPZwe7O6iINIC7ELahVPNOV8VO?=
 =?us-ascii?Q?/0b4LdEIavwkkVw3w+iFAf6l+KpFT4npjJUXQLSgWZSE8czy8GRfc19iPqve?=
 =?us-ascii?Q?kAuwVJlfYn/es2P/SbUansJj7k33TZQGTcviJjYP3VPCno7YXBLEjk8R9sdh?=
 =?us-ascii?Q?egPJyTAUqqdZQ05SrK+6FrRqR7udd2570mmAmB0IjovtzZJdp6fC9P6k8iAv?=
 =?us-ascii?Q?QMRXH7eT8BHGs9aaiddK9d3X54/+vEhbHiAGieZbru3lwY+nIJPVRiP8ghkY?=
 =?us-ascii?Q?JZImURjvwH1WcjCRrT1mzh7zS0StLySymz53DaZz51u4eUPfGzqbDtnEZnEC?=
 =?us-ascii?Q?kObvvYnvCZhpcOxmb9sOMRUhLbEk7DO7ZtlEcHcRS8azzexXVCtfw4NsD7gC?=
 =?us-ascii?Q?c7oIMWhbWY+gSTheFpqcz3OfB5Cnm6/RKXtgHXYEnm9B6WAY17GQ4T10u4Y5?=
 =?us-ascii?Q?OJ7oMbV7sHidj359eMtddgkosIF52XTepqX47dozLvE3kfjZqHUddNFoPsIU?=
 =?us-ascii?Q?hv82dZMdDZyf+rpYR7MymXNgcJAek3LtdaHHql446W+tw4WoDTclBXL5pjt4?=
 =?us-ascii?Q?ZevXCCYn0CZAGc4G2bNM/j1qykRQmpDX0nRQtOXntgZ6meIRJ7RkqSx0Ptip?=
 =?us-ascii?Q?+OQJ24cdiVFSvWt35uFtGdwzBdUzqzsUOzrLrcjGUdlVNU9e8QOb3RmUtOBS?=
 =?us-ascii?Q?pX3P7Wn1s+TmdS3L762tquDD3go1qDp++DFOiyXiMI3WMTGMKrOg3YtjteB3?=
 =?us-ascii?Q?OQPUavDmKo+UTlStQpV3R8Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86c8267-dae6-4c19-28cc-08da01cceaf9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 13:01:25.5218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rm1kvp5354OjBIrWR8EamvNOfnRU9kVptPW0Uhq/YevwzMIYY7giPZmrUiRE/eufOy5ttnePw1jwSzwAp2yw2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6757

On 09.03.2022 13:39, Andrew Cooper wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -117,8 +117,8 @@ config HVM
>  	  If unsure, say Y.
> =20
>  config XEN_SHSTK
> -	bool "Supervisor Shadow Stacks (EXPERT)"
> -	depends on HAS_AS_CET_SS && EXPERT
> +	bool "Supervisor Shadow Stacks"
> +	depends on HAS_AS_CET_SS

We'll need to settle on whether to use your or J=C3=BCrgen's variant.
As said there I'm in favor of his, but wouldn't mind this
alternative one.

Jan


