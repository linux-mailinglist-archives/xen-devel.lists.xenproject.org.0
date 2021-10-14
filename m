Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3D42D626
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209165.365532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1max76-0001zN-QP; Thu, 14 Oct 2021 09:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209165.365532; Thu, 14 Oct 2021 09:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1max76-0001wi-M3; Thu, 14 Oct 2021 09:33:24 +0000
Received: by outflank-mailman (input) for mailman id 209165;
 Thu, 14 Oct 2021 09:33:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1max75-0001wc-8V
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:33:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3177714c-d756-441e-a3aa-527f7eb6e002;
 Thu, 14 Oct 2021 09:33:22 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-imHxwpxcMRukbdHObBO4aA-1; Thu, 14 Oct 2021 11:33:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 14 Oct
 2021 09:33:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:33:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Thu, 14 Oct 2021 09:33:17 +0000
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
X-Inumbo-ID: 3177714c-d756-441e-a3aa-527f7eb6e002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634204001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yfAWO0mgGXRLRjSdL+G/R1lOhK/9ZNYPNz6qqMV3IHk=;
	b=e/BvTYTaDl64vNYloN9fyWpQRQK99dT46eFrqPOkRKAZsjGAXMCw0mQ4ualD9saSV/187d
	pgf1mioxu72hpTrf4YslIA6eCMCXoazEX/DIc850C1s6GrJS0oYg6+wm4G19etsmrD9gRQ
	cHsvN3Mkzer7U9Uc4aR0j3d2HWi9rIM=
X-MC-Unique: imHxwpxcMRukbdHObBO4aA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ftls8K9lDhuvFWRZ/0oIcoDDpNXLDOhAYXO5N1M58BaCUhUaEV1Sn8WlZVcSZskG9QGjymYUMdgr5EY8Sg3hD/sBSMQqQ0Ypd/giWelVcLahCMHfVVLEYPaxsZStOz8pJlIR3iTyRXIP3PwNFe6GHeFYPA+AkU5pGsj93snFKdOtpV8DOa+Hij7S2RrHvvLVbz1TW76AAQoJ8gHuY8JrAPbbp/P1CTP4aQCaHJVuGPY5R2xbSxVGoXigWKPIA+5WqlNhzxHDJvv2fO4QBM2l9ugeUcwoaw4Vb546kHxzuZzcgy1K9eo5sV+wAJ788Vgwz9KY+o8jeOumeDAnFUOL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfAWO0mgGXRLRjSdL+G/R1lOhK/9ZNYPNz6qqMV3IHk=;
 b=V6S480btlv1koPQSSJq16EO6Q9crTc6OWyySRVxrVx1QoGhF+k5/SX1PAu5+IUpakXiaEiNKn00ppneOiHSCH7jImQAQnZu44hqYBUUAg7hbPb8f5Rb3DViA21Y4ukJ5RPiZiTa7hz9wxiHccvz5itB0sgx1wSmJa43ELz/hIWLF8d6NBtrg2MXC8KozWw2EwuGZQlfm0/8uGaX57chYX0hcsB+oiUaWkQYwYUvAfru7x9aUTaCw/SoiepHKAGGXqnmoF9J/ShHAz4qo8HIAzWb0UAwluOqslvurErpbftY0hC7QNW1dzffAzFVTOMQdgmM+EHXVynXv8b5s9ynX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 45/51] build: rework cloc recipe
To: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-46-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be6b4b2d-2b18-820b-43ba-e8e800d97517@suse.com>
Date: Thu, 14 Oct 2021 11:33:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-46-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52b28439-593d-4dff-8f31-08d98ef5a764
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71519601F435418669961645B3B89@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SmzqLbWAIa37Pmhe7cTckQmM0s2Bsn7QXQD0cGBnNsqW7OCWPImpGYUeS+kxfq1xpN8gpjWygV02spN2q/k/C3HZrIHHd0hK1OE+27PIkVpc5leyriisBwEXmwz2pfIxsczo+pMjMQwTXv3PVFF0KRd8ciIthKeM8X1DW+7QZRIp887IHTsDObIPGePrKdaRYSjmISvzo5TLMmfRiaBya5neVpQqFwCgn7fIaOlXPBsbsv8KRBsqU8QxFeigMaLDfwXDHKwpGqdaGr4VHvM10qpWpu7dpIbiCoA6RYGFxr0pEcR89pNNnasCbmE+XRSyE/zzbWqLDlHO2A+fYCvmuRUy8oi4r0w2C1ON9mEtFkbfWzY8Ub1GGfV6M+7OPSbh3CxGRHfONSrW+hFQSuB/fgIzTMdnx2PS9OlRh01ArFLWvMyReaBXAOeukf00LFQrnEzTw4cZNIQbiDi8BEPJka1Z4hZF0gM0Kg4liDEqM1m4fc92n2K7vYTNajmiRj+wR3+HpTVoOf6ROWJs90FQZ2MDbQ2HXDhz2R3vQKVHoMEvE2D6OGfr+NbjMxMoOuFjx0oq9Azkr752grRGVy4kzthibE4fdH2XBP6YNCD9IDpLH7VpBro5O2ZD+TgBap3OgBEoBqm/k8xLIgjgkh0s24U7UFbWp9hyMhqHXT3qlmrg2ZpCDFCa0hifiI8jNLY73bcFi5Ropg3CJL1PYb2Wim1S/U3wQyQdx29ejzB3YT+ukmbXUIXPdw+wbHfmcjnH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(54906003)(4326008)(110136005)(2616005)(16576012)(31686004)(36756003)(8676002)(86362001)(66556008)(66946007)(66476007)(53546011)(956004)(2906002)(31696002)(8936002)(38100700002)(5660300002)(316002)(508600001)(26005)(4744005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDZsYmxoamFFQ0xxalNDVTBvWldkUkJreXF1Q0djL3Rqajgvam4vaDhiMG43?=
 =?utf-8?B?MTJsZmpieEVwNms3SHFybGlYSGdXTzFLdjhiR0cyd3pWTHNxUzlnYlVHcU5J?=
 =?utf-8?B?c05uQUZZbk1wbzN3RWc0ZWZOTW9ua0hsTThTb3NMSGcweE5KZ2U1RUpsNjFk?=
 =?utf-8?B?RFUyUEE4SUQzc0gvdGhNQ0F4aDBMTlMyVGJYRUJKemFrelNmSlhKM0QxVDVy?=
 =?utf-8?B?T3RlYUEybU1wZ2ZXVUo5OG9oSXBqK3FCUjc2dHFXYmlvNjB3QVNVS3JvOEMz?=
 =?utf-8?B?TmtXUXA3bnkzQW1RVDV6dy9qVk5uRnJNcXJ5OHU0R29VbU8waGpJWXg0L1pl?=
 =?utf-8?B?MVQxUE1vOGxkYzBnQmlKSXpkUUM3N0JjNnRCOTNYRHlmemI0NUQ3N0pESFZE?=
 =?utf-8?B?SUhQZExhT2VwTXVUMlBPTnZCaHoybTcvRytWeXRvaUNSdjU4Q0NJUlY0cFFh?=
 =?utf-8?B?b0dQVnVkR1A0VzVsMVhCaXlLVDY4M3pIa1JNUUdqQ0RSRVpjSVc5d1pYd1N4?=
 =?utf-8?B?YUpZSkhOVnQySHJNU0VwVkJHTlVwMnFjMnpjTWgycFhaenJPNDhiN2ZNVHJa?=
 =?utf-8?B?dEpjTHhDVFMya3VKYnE0WGo4WkJWVWlXYnh6b1I5a3RNeUF3SnBKNzVUdW8x?=
 =?utf-8?B?M09kZ1V6VTFDdTU4aXluS1FUQzdjRVVSWWt3VXF4UG5iMEJuVUdGSmd3TzhX?=
 =?utf-8?B?U3ZZaUdxajBvRzlDWUlYbGtiUTlZUHprcTdVSXhuakxIZlN6WllGSkxDOUs1?=
 =?utf-8?B?S3RDTnRZb2dOMGo4OUR0ZWdsUjBqNjBIdmtPOGlOQkttSk1sL3pWNFpMRUV4?=
 =?utf-8?B?d1JBUEI1eEJoTlMvTkhjeUk4ZEdFTSt1YjNOVlZDeVMyWkpWWVVnRmEvQVQx?=
 =?utf-8?B?YjVFOG5Sd1dNZFdiU3ZNckZkUmpheW5jUHd3b0phK0kydVNFaGJQV1NUeFJ2?=
 =?utf-8?B?WXN5Wm5pZzVjeDYrN3hBUzhiYzViVEJCRkpWbW9VTmhSekNaejNjNWQ0SWlk?=
 =?utf-8?B?ZkxRVWpXVEVuTm5aWlpBUEZwODRkNjYrQjFCcERvTm5OSFV0SmhPNnd2VzNU?=
 =?utf-8?B?ZmxBdXJ6d3NReWVjTGNWTy9TaFJXRi9yZ2RaT3pXaEJBVEVwRGF2K3JYOS9L?=
 =?utf-8?B?MjVDaG11UkczUFhYNTNtejhhalZCV0hQUW1NMmZjd3VKLyszZWRmb2VCdVlL?=
 =?utf-8?B?N0R3eGpIR0JNQkJldVZERktPSHQ5QjRXMm9tVVNZVjh3alAxNEZ4V2Y0QjR0?=
 =?utf-8?B?OGxVU1ZMTjhQY3RNYWNvL2NEaDgrcHN1M3RGYWFQKzNWUE1hcERnTTZhWkhj?=
 =?utf-8?B?Z1RaMzRxWit1NU1xMXlHTzEwSTRGSExwQ09KQ2NadEtuT01BeG1IdGFxR2dF?=
 =?utf-8?B?MkV2RDV1cXRrbFRTU20zT2NYM1VFUWZ5M3JZWEVRb0lzelRDU2RLa0JRTDRI?=
 =?utf-8?B?TXpqUitINGdhdVdLcmhLT3RObklia0FydjhWdU9rYUN0d1BkL01PR0hZSFVB?=
 =?utf-8?B?MkZOV1J3SitqMG5BcFpDbFdWd2pveFdnUnJ4K0VqekpqZ0hlYkVFamtwdkU5?=
 =?utf-8?B?RE5lN2RYWGRtNk9GS0RsL0ovc1dMYzZvYTkzTmFaRVlHb053OENMMXJ3bDA4?=
 =?utf-8?B?em5OYjkwNyt1ZmJxa05CVElrYUNZWFA5dEdkMk5MdWtMQVpkUW9ZODdmcHhG?=
 =?utf-8?B?dUFGeWdsTGhQUWhsN0dPWGJBRnREN1F3OStTUWcwVnNQbHJ3Sk9rdDk5QU0v?=
 =?utf-8?Q?9qhewY+Ws0XDIB+slf82jUiXknjyeO9mabaofQe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b28439-593d-4dff-8f31-08d98ef5a764
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:33:17.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0B9rXHB6dDFpbawbXRA8LRObkX8V6thol/3ktpSBEp61w9DLMkgUQNHxb5+b2Q6TBuaRVZLVZygDGabYycnYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 24.08.2021 12:50, Anthony PERARD wrote:
> After folowing patches, the recipe doesn't work anymore.
>     - build: build everything from the root dir, use obj=$subdir
>     - build: introduce if_changed_deps

That was some 20 patches ago - shouldn't all make goals continue to
work at every step?

> First patch mean that $(names) already have $(path), and the second
> one, the .*.d files are replaced by .*.cmd files which are much
> simpler to parse here.
> 
> Also replace the makefile programming by a much simpler shell command.
> 
> This doesn't check anymore if the source file exist, but that can be
> fixed by running `make clean`, and probably doesn't impact the
> calculation. `cloc` just complain that some files don't exist.

Not sure whether that's acceptable - Stefano, iirc it was you who
introduced this goal.

Jan


