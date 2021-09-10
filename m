Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A896406891
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 10:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184183.332751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOc1B-0007vb-7u; Fri, 10 Sep 2021 08:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184183.332751; Fri, 10 Sep 2021 08:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOc1B-0007tg-4j; Fri, 10 Sep 2021 08:36:17 +0000
Received: by outflank-mailman (input) for mailman id 184183;
 Fri, 10 Sep 2021 08:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOc19-0007ta-0y
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 08:36:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dc45235-298e-48c7-a8b1-570f8dc50fea;
 Fri, 10 Sep 2021 08:36:14 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-MAJFzGm6MaayGsie9RA_lg-1;
 Fri, 10 Sep 2021 10:36:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 08:36:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:36:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 08:36:09 +0000
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
X-Inumbo-ID: 4dc45235-298e-48c7-a8b1-570f8dc50fea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631262973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZUXn54cWZ3j2p/0IrNe7n8D3YP75eKJVHxyNlkK+s=;
	b=FteVXUC7xLQMA4iXwlgN/Zj+ix9hOYbtywHve3oUWQdr5524i16dAW9UTX9NjOAXPWS3KE
	rLU7nIzShn2bFxM+2qvNbBsbLeTUU7xwk58OUGM5H7GB7ONhgTLsdcBKzRvVQyt3beEWTS
	PghKibrbJ+ICvGElnPPrT7u+PzSbO+U=
X-MC-Unique: MAJFzGm6MaayGsie9RA_lg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TX2TvLRuNQcvTw47cIP+CpeY6PWaownceDaROxluRLJkFs1iFdQE+G+BbJ6vnKVSGHJRo+9yfvyb4vLGNB9+rSu0iQVPrJrPD/gEpBRXWkd/VzEYyPWYkSIlf19Tg03W4adpqc8+W8XLDRsJk53wHGuYWzdQlo19TmINvZS9TIGVxq/UA46azYoPckZHDuG5BcvqoWUOTnLs5fZ+NqIIsyFG28fwfm0fXI9geTJLw9wwiSX6RgE6hnJLTqiUykyYHYw0MsneFIEpD/uPc2adU25CbFCrNhfHbPJlRjTReaIHOUEq52pP0XjbPoaBcyCimjWBGhHFjqklNoHcqo7GDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TZZUXn54cWZ3j2p/0IrNe7n8D3YP75eKJVHxyNlkK+s=;
 b=no4z6rQyjfZdy6h7ubZhD8/YANvBpdBh40P1J9dC6ZAGyA3f9n2QmvlCxuzG2KOi0BydIElnqyZ/eDnKFQr9wyr5wratX8S24S1w51YScBwK3yuiWlGJyQ0mYtdqLu8Cfio2B5vrcqQIzLt8CU1lQJohHHu2UOxehoTVBz473hiOHVuMTrjYgGu718bRi0JJ4kC4wh0IehB4AJReyPge0AAubO6cU+1HzTb8ZMidAKBIdHrpBLNVFBxFI/RRqRFHupIivBlvQ19V35XZbqkqXYrBwT3vwkRZI3DBCLQkn0Eop32HSdTdbpWBOQLHN+gF58N+DgdqLZB7RI9+DJEBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/3] tools/libxl: Only allocate 64 bytes for RSDP
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210909163441.44418-1-kevin.stefanov@citrix.com>
 <20210909163441.44418-4-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da7fd9b6-6bd7-3bdb-1f44-8ceab73ff809@suse.com>
Date: Fri, 10 Sep 2021 10:36:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210909163441.44418-4-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0180.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b961846e-8ad0-4962-3873-08d974360a4d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB702481AFB5D9A3EBBAD2C5D2B3D69@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CIN/bCP+Aebax8f5DHg+pOwWwL/ugj3YBdUxKaRYbOEgve/1N9YUeg2f47YNFd+502UFQWu3wPOtk7qCMOUgp8NOKsf12twKpgykm7f3yOn2mptbngzEZOrCyyHpK7ukQu7G/gok6qdS+epAqpwhjZpw135yONPCz3Kj5wisi8hU1mcSKXN3ZyQYsAti6MCRoYp+HUiBtEvw9a6zI8JUeqJdH+O0Zs+FelyJbB50T9Kp3PZUhrPNahvWeM5lOpCvpk4mtMLs8mKqMHigKy/naIzAtORZSJ7JH+OP0OnPmp0ajxUQse/QkLpq2DWYCkltsj3hwPYVyP5kS/JkDbIDfQgUm0VKzW1HONbrGE3W2Z9npWciIFcKiLpLciWXrm42ZsVWScI0k+FWxriDGH7lPnQGJgX2pLpxneVT76so0nUvz1iQzTg/3K+2kkmfRuMUVvGBry5gKTKE/SnXNcCMnoU0ywjmhhlTmfn871wDJ5GkiXUpo5q4T5gz+p4YtfZ36YxG9r4C99W+WVQqmXulfNRCh6ZIS2Za9ztCB4fvyjo+Yzmux6cu536s4uZlcOjF5RGa5H2Vm+qb7zphusYJ9d+MiJqGdOnzvU/BrtEONpggnJNrCHt/ZEKL8iCpnlq6jADh7StTnWBUYAAN78w2hikdzrNkNcZ/+aPQRvsYQcjRFogU4n4BNLXrd8fc/ORWVSnYFnRTXPXnx4b0Z0hH3jLuPud+VxAuzL5JFBE4w1kBr+fFeA44vIu5fj36ALb1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(39860400002)(396003)(376002)(53546011)(38100700002)(8936002)(31686004)(6916009)(4326008)(956004)(478600001)(2906002)(66946007)(6486002)(8676002)(26005)(186003)(5660300002)(66476007)(66556008)(2616005)(36756003)(54906003)(316002)(83380400001)(31696002)(86362001)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGcyQkwwZFA1cW1KaDZrMUFlRm9xaVhkUmkwV3JMOXhTMjJDMkllTzM4dDYw?=
 =?utf-8?B?dFJianlzeS9LdzZYUWtQazdyMmtPMmtmSnM0RDR3TVZBcWRGY05QMFBtOTZ6?=
 =?utf-8?B?RXRUTFhPVTRzSVlza3VFOU82b0lTaFE3cWRKL1JQenRTU2hmL0xjNCsyQU5i?=
 =?utf-8?B?VEt2RDZsMFNvcFlnNS9aelhzYUdtNmN6ZjhUbGlrTnhKNEhNSndLMlVZeU5n?=
 =?utf-8?B?ZHJmeW84VnhaemluR1FYdEtwc0Y0OFJOQWtXblNPWEpqaVNtT0ZpZFM3cTNO?=
 =?utf-8?B?cFlwWmo3dGNOdDkyWVQ2NXdQcWMrVk5HKzI3akVFTlpEUTBHUTlZNDd6Yk9D?=
 =?utf-8?B?c3N5ZDd4dFFOdlJwOFI4QjF2T1RQRVBTMkhWVkFBaTRCVElZUW1TcWtQNG9C?=
 =?utf-8?B?UVBOTk1ZYlMvVnJVd2ZIMFI0WE8xSjdmRWhORVlQSDdVRTVhc0oraVlmemFw?=
 =?utf-8?B?d3A2Kzc5THFRZ2pVTmJTSkRPNkdNek1iUGduV29qeVhRWXdlclZKNVZpQ0Vu?=
 =?utf-8?B?NTZkNnZPY2hZc1NyOW5ZVUd4S0wvWHBOMGJoUEdYbnFsRzhHNlQxUHdEQ1Zo?=
 =?utf-8?B?K0ExeVVvK0pQajRVR1NpcWE3YnBCZFRkdzhFZUFLQnRTZzZvcGFma3ZXUndB?=
 =?utf-8?B?TklHNXIrZjFjV2l1YjRxKzdoVDNwVzYzbmZVSUhtcUwrc09PTmlIN1NNOGhi?=
 =?utf-8?B?Z1hVZEhUUXRuYlRycmVJMUJodzNmWDRoQkc4d1FLeXVSUnNHR3dUcGVDeG9y?=
 =?utf-8?B?WTdoYmZLT3I1RExieVpYc25BSkZNR0I2Z0NTY25haVZ0NU5rWXJXQXNZYlFm?=
 =?utf-8?B?NHpZSURBT2RvYlZURnRsQlgvMWVpNHNackFMSXZwK3JMa0wyTDU2bGprbXBJ?=
 =?utf-8?B?WkVGVjV6Y1h4MENiZCtpK2pGUE05TFNUOFo1SFZKK2szQkl4ekt4S21BVzFI?=
 =?utf-8?B?THFHcjdISEl6cWV1RXozVjdXbDB2ajdvUnh2aE92ZGRtdG80a29oeDVPM0Rx?=
 =?utf-8?B?SHlrNVlOSXBiUXNUbldweXhsQXJlRDA1WWVITHNhUnA3dWo0TDJQMG1ra3dV?=
 =?utf-8?B?YWZ0OXhiaXArSDlOT2dPc3JJYkF0Nk9mYWVNY3VYMnV0SGFFd3J4SjdFQmpz?=
 =?utf-8?B?cU9wdjQ5dk9CcDBiRzNORExrNU1KWVZGRlMxQkJ2c2VBcHJXNnNZRlZrNWJX?=
 =?utf-8?B?WXJzN2JRNG0vT2ZKOC9KNTZWWkpUUDB1OExwQ01EeEcwTlRuRnZRNVgzUjg2?=
 =?utf-8?B?NlNBOE5DNWRnTUF6Nld6ZC93ZWpEV0ZCZ2N3RWMrYkFzUGFOYWdvb2J5NzF0?=
 =?utf-8?B?SU9TOWRHK0Yxb3ZPU0VlSTBIcVYvSFBQNE9GSHd2WDcyc3Nkam1ocHZZZktv?=
 =?utf-8?B?WEM5R2MvY1d0bjBBLzU5RDM0amFSb2dDZE53cWJtZ3doSklFZUFxRHJlUzRl?=
 =?utf-8?B?TFZDVEhIMTRWQUo4S0JockJKcGtsZDNhU1hDWDY1Wm9nK1hpc2ovYlVVQjVi?=
 =?utf-8?B?ZUI4NWdCbjh5eG9RTGR3QTZValVFRndYYjRuck9WdlBraDJCNjQrY2pRZTRr?=
 =?utf-8?B?Y0NBVFB6dFhXYzFrdkVRVkRHV05GLzVGMENYblJraURJNlFJKzNNWHlHUVhn?=
 =?utf-8?B?SUhBdHdkekJ1M2ExY1FMb01vSytNbmNKN0l6c1lQOTRpMWpHK2U2NEpVV3Rh?=
 =?utf-8?B?anIrRm1KdlY5d25aSzNEcllsdThaYXhITzlUVHRaWHBpN2RsTXR4am8yTDNT?=
 =?utf-8?Q?0vQcov99c/VcEgnEJJLHfHKNRAYCaRAbYibdRGc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b961846e-8ad0-4962-3873-08d974360a4d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 08:36:10.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEET+VEqUPFOghXmA0uUr3hXB3JH/LniST4eCsGSsKce2M3PQ2hhql5maijbWy5I/nJkWtkIlJJR4DSG2dxx3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 09.09.2021 18:34, Kevin Stefanov wrote:
> RSDP's size is 64 bytes and later in the function, its buffer is
> hardcoded to be 64 bytes long. Don't bother to allocate a whole page.
> 
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>

Purely technically and within the constraints of the present code:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
However, ...

> --- a/tools/libs/light/libxl_x86_acpi.c
> +++ b/tools/libs/light/libxl_x86_acpi.c
> @@ -183,7 +183,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
>          goto out;
>      }
>  
> -    config.rsdp = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
> +    config.rsdp = (unsigned long)libxl__malloc(gc, 64);

... this is the 4th literal 64 in the function (including one in a
comment), all of which are meant to represent the same abstract thing.
And none of which look to be really correct:
sizeof(struct acpi_20_rsdp) == 36 according to my counting. While I
don't mind using 64 (for the time being), I think this should then be
via a #define, which would be accompanied by a respective comment. Or
else via sizeof(struct acpi_20_rsdp).

But of course hard-coding the size isn't really forward compatible
anyway. It should rather be libacpi to specify what size the blob is.
And then it might be safer to stick to allocating a full page here, as
the actual size won't be known up front. Or the allocated size would
need to become an input to acpi_build_tables(), so that it wouldn't
risk overrunning the space.

Jan


