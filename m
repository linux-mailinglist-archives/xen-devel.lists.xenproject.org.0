Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB54D2EC6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 13:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287783.487972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRv8T-0007wS-Cw; Wed, 09 Mar 2022 12:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287783.487972; Wed, 09 Mar 2022 12:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRv8T-0007tM-9G; Wed, 09 Mar 2022 12:09:45 +0000
Received: by outflank-mailman (input) for mailman id 287783;
 Wed, 09 Mar 2022 12:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRv8S-0007tE-1X
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 12:09:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccd38dec-9fa1-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 13:09:42 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-WNUHplxVN1mzsui9a4_ggw-1; Wed, 09 Mar 2022 13:09:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8892.eurprd04.prod.outlook.com (2603:10a6:20b:40b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 12:09:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 12:09:39 +0000
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
X-Inumbo-ID: ccd38dec-9fa1-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646827781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43CBGkhx7StwR/bMCXqT2YSeEoImjRJwYH5Z++BxDOo=;
	b=jYMrxh+Rk0EqOhj3Mb3O1CHICnNgjlApKbARKV9QmfSm3QoZqy8ukgcg8Is/ztE3kxQqX5
	ij5sP6YPdu+wR/x3We1L6LLFe579x6UqaI28E35uZEZBMWb+Cco2CcRZAdMS6Wb4bzXMmo
	sPNxf7SLR3ZXTl84jBC19kldN1kDSZY=
X-MC-Unique: WNUHplxVN1mzsui9a4_ggw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8HEBCiWUQdM45wBC9N63DycFPRUSSNaXfaBTn4LDDuq6I5y+iqsl4EEOQsPgQuPQ5hsk9yzv141d0u8hi8CnDPyUC1kNC43N5TylxvGOtXWXOgA9l8golLkC9lEBv0Xq0rirr/B2WmGvD4bLAx8fQ0PnkSBIgORiUfVWqGnIBSDp3sQZVg38EbhfFzDWGZZELPuK2jiRWv+sCJeZUzaOh0AFPY3Zcc5egYvljy0teaoZPKS97We32gRBELPAqASNqZiS86BY979CcUxsOmMv+dppzGESpCcgCPhhTCg1XDIcTHAC2e7/yByMQhVr689EtuYk8bYVZH2v07yuSZCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43CBGkhx7StwR/bMCXqT2YSeEoImjRJwYH5Z++BxDOo=;
 b=Jiz+mtDgLpYmV7i/idwejsXITNDC09rjCfqKneSGWzY6zUdAcGY13sTtoXDIQV/84xHR4rKAtVfcKpWwUnE7MNaFUaIGbDk+6BsOuvRw9ng1N1oI0274MVgT5aF+xOGGDe0tTvK0rH43o6DHJmM65Zu42nlnYCUkwI8WQ7L/Qxq/LrGgjhhjV6XM6EsIvXxf6ADCjp6IkowSZGcqDgna0m+Fko0u09XE5GGTv/ZYuNqmApFl6QPlG68H4NtIffDB/YAjXtPzhQgB+Iuuqnqc8ow8aRyzlW/bAF0JERiXnzBw27CuhhitdrIauIZwMr3HY3VO+ydwF3Q0QNsuckqdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5655afd7-2116-2a9d-4c34-4e7031e39df5@suse.com>
Date: Wed, 9 Mar 2022 13:09:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] xen/x86: drop dependency of XEN_SHSTK on EXPERT
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220309113441.22746-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220309113441.22746-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fa8314c-2a77-4a81-839a-08da01c5af73
X-MS-TrafficTypeDiagnostic: AM9PR04MB8892:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8892AD8E2E8BFFA4953101F3B30A9@AM9PR04MB8892.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rcYQ85eDlEQhmFpNslkA0kl80DzigQwrSo+170qh5tnek6ROEJqi2SlB1DxiQvwQABg1wM5vEYxw7b7nQzizCEEUfc+XbY3Y0Ktn2Qj4pBXSLJbFnTlqPQsxZxVxD6tCFQa4FTesZJj033Dx3FVldTGWn4pyQuLyKMYw/s6F11Z+aaamZ3n2KNcxQe7vNTSidxwFRr83Q8qiv91H8obaDkGyLK5w9OBBdcN1coXr8DqivYJPpdnw9XwoY/AUuocewnM6iwme/WoVOcICuB/acgZ2AMY0pk8BajQIIHNQ9CTRwsaNamAXjHRJf+fxDaETZZP0vBUOcdbihRynoeAidyQAo5Uq5CZZzMamo8bBLRP00xdUq+FopQiOl/+BVku6+SMmZutoGwzMMTpBNrUdaQPZZfqFsOegO1Mer//3i0lnZy0I1+tT4BfsK+JvaAIHv5h6kEaXGNG11g0k4UlfQ6VCb/WPfwZas7ihpGaeVgAy5DG08F/nUYEIge9KhcOdcVwiYW0WhAqTlCm9OPBFHq40+PqwqCVySO6xAHrSMBagR4sdBqjCHTLcu7DcxYYfzD2UOHHrJG6GYX2Hqy83gRSXWvHwdmcJkGK6t7XNpdAOXG49i6FR2fW4V6ro4bJ7u17Plbw4sX/WkcZYY6BDy4g4NwYZaOGbPEFsXXIjIyp+50ZowjmOzyWfwrTbnJuAOyJ4MncxD5eqrr6K9qvG9EcESue3DiHF/5VQORY/cXW3EdQZHb8A7ngyN7HAkqRJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6512007)(508600001)(66556008)(38100700002)(2616005)(4744005)(53546011)(26005)(186003)(5660300002)(8936002)(6506007)(31696002)(86362001)(316002)(66476007)(36756003)(31686004)(37006003)(6636002)(54906003)(6486002)(6862004)(4326008)(66946007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1gxVHpmNVdlUldPODBtOGc1WGluVXpuWEpaeWQrUkxxekJIRTBIL1c0Umx1?=
 =?utf-8?B?OU1Ld1Y1bi91MFphR3dNc0FqL0RTT0VhdmUrNVJmUzh2UGlFa0doWUxReldJ?=
 =?utf-8?B?STRFdGQxank4cWRxSk5ueldibkcycUtxTVZKVlBHVDE4N2xhbXpZL0V3L0Fl?=
 =?utf-8?B?cm5zVFEyRW9McDBLSXdFYStqbWZUbzMwK0pjcEFRcDdFRVlid3V0bG9RV0kw?=
 =?utf-8?B?OWJBVzF3M041aGZOTnNEVFBYazN4Q0NBeGkyNlE3WnVBOXdtOHZWc3hMWlFl?=
 =?utf-8?B?bW8vMkw4aFlQZHk3VjUyVGl5OWdPeFZYVStheUZNeERTZzRoMEpjbWd0QWtX?=
 =?utf-8?B?eFRoTUNSWDIyTFFuT0NyT21iWThTY3N5RjdvYUkrR3kwTVllQmF2dUE2bmFp?=
 =?utf-8?B?RU1DYVMwZEVVL2t6WHd0U2tpeVRjV3pwc3ZmcFF1NU1VaGhKamIrY1BoMnRL?=
 =?utf-8?B?WitjeUxPWGlTRFVvRGFJQStpbUl5QXdRT1NGOThyOVVQZnErZUlDNUhRK3Nw?=
 =?utf-8?B?NVcva3diM21DUy94K3FOM2hSTGNtMGJ2c09QeEJyWlhnazBPdE9MMzRhaU9O?=
 =?utf-8?B?NHJvanlteFN0cDc5YVBhdGtyck9NQWdqaEs5Nmc2bHJ2eVBiWmVjZFI0ZktM?=
 =?utf-8?B?K3k1cXVFTXo4NVp6YmZrdXlVQzA1eG5aVS9ZNXhRUU5qRXBkU20yUE5rdmM4?=
 =?utf-8?B?VEVISGJZNGRZWEFHaDUrUGliYlVQL3JuVzkzQUp1c0Z5UUJKTzBtMExYUFVm?=
 =?utf-8?B?c2JneU1ZZVVQSHJUSjNyZlpPY012b0hlYmRUSGw4Wi9XelVKWjNlNis5RXhi?=
 =?utf-8?B?ZHNKL1BjOG8vRWRwSEJYeTdxSiswTG1BWmVhNFlmTHpycEZodVMxUjF6N3ZJ?=
 =?utf-8?B?dE5lUy9iam8xeCtETnlYTXo3V3dQTjJRKzkrOTFlWDRaZ0xOMXZKMFYxaVZZ?=
 =?utf-8?B?Z1lhMTJBYW5wdnBLUFkrR25uYm85Mk0ydGY5R2tRQkdVUDF1YUY0WEgwVGhy?=
 =?utf-8?B?a3JyVVV1a0RoVEx3RlQrMU1FbUFFZm9KQ2loaUEzdEcwd1pBOHcyOUozQVp4?=
 =?utf-8?B?a3dPdWNlTC9jRmVHSDJVa2c1VXpVbklYNDdFKzhuYWNIb1pJZTdyaVVsYkht?=
 =?utf-8?B?ZTZSYlJIaUFNWnRYWU1WWVRFRDhvdDU0akZPZEVCWHFBR09KQ0FjdThMN01M?=
 =?utf-8?B?RDNmYmliTkF1M282cmFsYnpxYlZjNStrK29SQjVDN1Zndm5JUHBTVDYzQjll?=
 =?utf-8?B?TDkvc0tNOGV4Q2dtYVRTN1pqbVlvbVR5RDEwZlhYbGFVcGlJL1VYdlowako0?=
 =?utf-8?B?cUFQZkNhVUdIYUtHTmlYRExIaHNmMlBZM3B2REtDMjNqRVA0a3hhc3dkTFp6?=
 =?utf-8?B?QzA2OVkrb25vSDdBcktMdFRFRnF0aTl4TVNZTU9tcGN5ei9KcmtaRm44QlA3?=
 =?utf-8?B?QTdyOHhxcDRyODFmbG5WWWJvOXJzM0ZyVVpwKzY3SldWVC9FZkNGUG9wcnla?=
 =?utf-8?B?bTh1S3hDQjlyY2YxYmR6S0dnSmlGYWwwd2NZMWJJWWU0WmxCclJFaGZUVHJa?=
 =?utf-8?B?ZDkxU2svYWJtTFVVY0UvMXlaMUZjYlZMYy91ZlBiZEdyalJxcmRoYXRsYmM2?=
 =?utf-8?B?N1dVR0p5TFpib3ZLT0ovUFFWR0xUdVZyRnp2dGJjOEZoQlpqcm1JQVpSRkpo?=
 =?utf-8?B?THV5M0VpQVJ4NlBDVUk1UDBhM2cyYWkzaVM3S0xGREZscSs2Q1NaTjZpamFj?=
 =?utf-8?B?eUcwdVVVZmdUL1lUSFAvT3Jzc1dVVE5NY1M3Tmk2UkZoZW1lTDNicnJOZmU1?=
 =?utf-8?B?ZEJGNk9Bd3pTR1dRa3dveFRyc3NMM01SQ29rQ3JpVXduRjFKbUlHanZkZ2Qy?=
 =?utf-8?B?MVlnYzVzZStKOGRLdWF6eWViQjcvam13NHpZZDF3SHdMTTRIRjljc2RVd1pS?=
 =?utf-8?B?aVNmMGxXUk9WdmRhczBKaEVTSTVoS0o3K1p6UDB5TnlkTHYrZStoTldIM1BR?=
 =?utf-8?B?UlpJN09xUXRnU054VTJQOGh6ZnVKaDdJaXlPMTVhTU5iNDZhNm83RTJNTGhZ?=
 =?utf-8?B?eTlyN2lQZTRFM1l0MjBRR2RZRUNpMjFlbHA2MVhTbHk2MUlyN3IxcUFoQk5z?=
 =?utf-8?B?dFZjR3pRYVdBeGdlSXlJQTNWSGkxTkVqMlpKNzhla0dEcHppdWV0WGp1OEJP?=
 =?utf-8?Q?ZiqsFXC+6BiASO5Ry9EtcQk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa8314c-2a77-4a81-839a-08da01c5af73
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 12:09:39.1520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KneK7TF5swo2L29HyipFzBsTFe3KpkTIXbXdsKjR9cw2yBi4oO5LnIYnA9CY2aWaesSC4AUpfTZibMk/Fn8bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8892

On 09.03.2022 12:34, Juergen Gross wrote:
> XEN_SHSTK should be on per default now that it is supported officially.
> Only let the prompt depend on EXPERT.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -117,8 +117,8 @@ config HVM
>  	  If unsure, say Y.
>  
>  config XEN_SHSTK
> -	bool "Supervisor Shadow Stacks (EXPERT)"
> -	depends on HAS_AS_CET_SS && EXPERT
> +	bool "Supervisor Shadow Stacks" if EXPERT
> +	depends on HAS_AS_CET_SS

While I think it's better this way, if others thought the dependency
should be dropped altogether, I wouldn't mind.

Jan


