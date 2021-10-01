Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B841EC54
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 13:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200568.355091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGqv-0003XE-HI; Fri, 01 Oct 2021 11:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200568.355091; Fri, 01 Oct 2021 11:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWGqv-0003UV-DO; Fri, 01 Oct 2021 11:37:21 +0000
Received: by outflank-mailman (input) for mailman id 200568;
 Fri, 01 Oct 2021 11:37:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWGqu-0003Sx-0Z
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 11:37:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2c7f694-27c8-406b-a1cd-866dd8bd2377;
 Fri, 01 Oct 2021 11:37:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-Q0aPpbM0NW2zoeqh9t7IJA-1; Fri, 01 Oct 2021 13:37:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 11:37:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 11:37:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:20b:31e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Fri, 1 Oct 2021 11:37:12 +0000
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
X-Inumbo-ID: e2c7f694-27c8-406b-a1cd-866dd8bd2377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633088234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COHAO2ioaNtZiSiI2FN60iFBiB2A1fK4DC2JbR5HJUI=;
	b=mnQlXSGVnJqmGPdBcLRX1j/lBKda0fckbNA5YWaHQa65P01z1usWqH9rCkJZXBPDFS8rTb
	aDgyIlWVmwqfUd+aHhUrPNL9y8zzc2nQ/s7JFww4vHk+7UksMKRRnFS3yTO3lmRfyUSqbz
	+TJGlqEMIz0llJvN23rYBMQPHEHuT3A=
X-MC-Unique: Q0aPpbM0NW2zoeqh9t7IJA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwZFwwcav57pb8g3x+UgIXOPOLGtjJxTodXIk44S4jYn9lLxe14D+lzVesOY8LjnQOdSs73Zha3fblASlEZj1XU3srvkmsByNrqyVkJ2oSVoe33m/rrDvdCGXptGIpOCItdKFu1lHP/t+tznfMzTZksyqX1aBbZ3Nj5pbBsdj1cb4cCT+RIslyOjexV6nr41xYtJNZpHxci3jnzY6YCY5jyd285OOlImjCwoqpxzE9Vrq9DiVsJiPsfvBRTIbwRtnDt22piS/K3n/XT9OofC3GlxAHKQkIQNe2SABXnv/s120Zpqv7aAfuqAefpObIfq/Xu3GZnIM39mZI6tPUp9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COHAO2ioaNtZiSiI2FN60iFBiB2A1fK4DC2JbR5HJUI=;
 b=L/airL83yfv7ZKlwyiX3SqpHOyfVtvqQNA1sd5zxRNlDSYWidhWxqnGBiwsRjXE9otNxggzO3z/Dp3cL1BhWPho7NFderNuC5vZqMGlCFhPCM9ZiJyZ6qERfdmx4ueq/kkSrYi8cEEpTk5dJu5hu7v1HimmNJ+ncVTtv694zLnnaPu4syAymY3muqVp8h/wvrrtsFNzf6q8De07P//zwdY168Vn/BaoMHxLu/D9doKN7+u1Cvu/NNy7AhpvubajMBFLPcza7xJ2b1xjA26SB4rSi9oRPMfLOjgdjNvzdEuH2K5iSyzvIW9z03csX+gFB41KYd6up7TzkH7siARMb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: sh_unshadow_for_p2m_change() vs p2m_set_entry()
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ae8b6cf1-d1ae-8a55-7b88-7ef24db0c554@suse.com>
 <YVIo1sR283L/MUeN@deinos.phlegethon.org>
 <59b46317-e0ce-afcb-55d0-90379c4600e1@suse.com>
 <YVbvjKU/m8FZtRPX@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b89654d-702b-d335-43fb-8cd1b02a94aa@suse.com>
Date: Fri, 1 Oct 2021 13:37:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YVbvjKU/m8FZtRPX@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0100.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60b98803-d5c0-4a5b-0236-08d984cfcf64
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3389E7ADA0371C0FFBC33CBCB3AB9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RCZ7HAkhiguD74ryGOVZ0LV+twxGkdlBdRi+KWPSKRPyhwD/uFcs4ZB6PgX/XKZyRj6pIu6QiEcpW6JiMKOo+02AUBpnmVcWlBB4nFR9uwNjCoVaD61U9ZtwDZA7/K0tMe6bLV+7QIskmJpWwkn7iEg105S5j8qLeNWEUO08JRgVOMlFEDvZmEbYU6stzM8F1Q9AD2Wl6U+Bl0z3ILWbLJG+UFCMJv4WbFM6s3zeFUl9sgtUpNV7DOj3pP0YX7klWFsAyxu2xSljfogOfiqWufJyevZqCDtUUNRRrK+n3zRzOR83CmOeu9t+pLfKJpcbYE0qmM2nMeNld25r3KA6R2Xccx9kyAMj+3bTWY6GMCI/o3fwfGbHQ+ndmWyqx0q3YH1MWDTeTXug572HczgXFikLUu7Dxkh8//03tlAjlUIOfHFKz0ATbN6fnpxdqwsQImr/Q0QgLsCHir+1QlGpWd0LQW9psmRO/ADP/2BG0mSOUx1Wpx2raTMspg+n3jJI5fsipk6NLZP+dFxPItBAAKbBRPzfkGQ9kdnfeJ0dP52fI/CxXLQJECWp14PKahu74zEzuGo7p6tC7DeR+7Xlc+AoCnPHPNIXrrVaIEnCY2cfdIzxXQ+DYUstgz8tpjgS+YKSfNhUy63fntRFcRumjgGEvDHFliQMGCishMiTbKbAkRNGSiiON5HRf3g7RDXAqlAPRjJejOPqKzmnCg6nQmCDQzYGzBaB/gQx1OyKEB/WsgmBqV3Wkv5N4HUvMeoQ48r+saebnBi5XSd2tIG7tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(83380400001)(31696002)(6486002)(36756003)(53546011)(26005)(8676002)(8936002)(31686004)(186003)(66476007)(66556008)(956004)(5660300002)(2906002)(38100700002)(508600001)(6916009)(2616005)(86362001)(16576012)(66946007)(316002)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW04M3VYeXkzblQ4a1RoVzJQdjhBdk12aE1TVVY2eFhUUTNRdWtBVnBvckpF?=
 =?utf-8?B?U2RqT3A1YWMvaWpCUi9ubE1rcms2ai9sWUNwdHpVeks4L051dCs2emZhWWY3?=
 =?utf-8?B?MTAyc0tLeWt4NDUvODZhai9XTklZbU5PN2VxRjZOMnBpeWNLdVhnRVBzbGhx?=
 =?utf-8?B?SWFGMGM1VldaTlhKeHFsR3I5NFh4cXhMYmcwcml5UEg1SW9PRTV1NW5oUG5u?=
 =?utf-8?B?TXBPNzJ1cE53blJ0VW9RM3o5RHBxc1RpMkNuQ1VVODFWR0FNMlBDeFVINlg2?=
 =?utf-8?B?c01BOWlhVUt3emRXTWtuR1RFRzhSVkRLa2Q1L3psRzhOWGJPL2xwS25YVExS?=
 =?utf-8?B?YURRV3JLWTJnN0tZRllSRitmdjZJaGs4blFjTDlTNEx2aFpOellOdE11SWRt?=
 =?utf-8?B?TkJaL0lEcVFnVHJ3d0Zsd2JYL0EzZjFZSW5JNmFaUDZlL0lOMnI1dnUvOHFn?=
 =?utf-8?B?T2ErVmhSKzh2ZlQyS215SlZESmtid3htYzdmVWFZWmNXYkF0NGtENjZGc2U3?=
 =?utf-8?B?MU4rY0hPSEVGWnFLa2hBclVWbWFlQjNRaVpQMFVBYmN1UUl4OFZCVkNSUWpC?=
 =?utf-8?B?MU9QU2t6UGgvMHB5RjFnZ0dXcWRSYUtEaC9zWFMzcVZVS1dGV3NVZXBTL3dX?=
 =?utf-8?B?emJuK2dXbkRvck5QYUN2SlhOM0lkVGdxcDFHeW1vMWNsMTBDanc5dE5BMjNX?=
 =?utf-8?B?WGNBbkRZVU54NlN5M245M0k4SGc5aEsyQ21FN1ErUUVYd1ZybFRqL2dDckdp?=
 =?utf-8?B?aDFiWGFDakgwUDZ2Ry8wWXh6bGxPV21YN0R3UlJveWE0czA4Yi9wMm01NDh3?=
 =?utf-8?B?NUlmdFNPQjRxemFIOFByUmJ0RkFGaEo0NmZQb1UrVVVQM3RlN2ZEQys0cUxH?=
 =?utf-8?B?bEpmcFFnemxSTFlwOXJwUWx1cWFjWHBid05IK2psT1grZUVqRjdoOWM1RHg3?=
 =?utf-8?B?TE1zekhPZ1VHcFk4MG8rZ1l1enQ1WnlpQWRJZW9wblZwUmdEaEk0RVJMUlVZ?=
 =?utf-8?B?VDVzNmpvWXQ0dWZIWE9aa2paWVRuTEdZTE1HMFlXejk4dEQrZkMrOTVmZ0U2?=
 =?utf-8?B?VDJIZ1MzNGZkZktSaXlTTHE1RXJDS1VCVmxpVzl6Z0NWK04xWlRIRXU4S09r?=
 =?utf-8?B?M2Y1amcvSWU2eHpNTjRxMENXdGdFS2E1MENTeSs3bXk3L2lncjVFQUpjZWI5?=
 =?utf-8?B?QVpRODJCc2hlbzNjVG5TbTgyckF6T3hxcXpGN1l6ZStlWUR4MXVDazJETUc3?=
 =?utf-8?B?UmJTbjFrUlpKOWorQk0vdXB5cHRHaXdFUGczSjcvbUgzUm94QkNXQU8rK3Ey?=
 =?utf-8?B?THpSTlhSSUdJdHJ3TnJmT1ZTOXlyVnUzc2svWnczMUkzSEY2dE1HUDFaVk0z?=
 =?utf-8?B?NW9Nc0hicC9vZHB5S2RYYTJaU0dWZVBwNjRKYkkwQ2R2bHJLa2psMDI5OFgz?=
 =?utf-8?B?YVVsVHlaaURJMWd6czN2dUhBQlVjUzBGK2FmeTBsS1FoOWg1eVdWYTNjTnly?=
 =?utf-8?B?cnJUSHhlNHpob0JnN1Vkc0FmeHR4Qm16ZW9CY3pUUWtYL3I1d3A1c1o3THpt?=
 =?utf-8?B?N1RiVWh0TWZzN0JtTkN4c0xWdkJTQjA3OFI2MFB3c2RUamxRejUrY3V4VlR6?=
 =?utf-8?B?Z1VVNmVhR1lDOTcvM3hxUFduS2l1cnZTZUZaRkhuWnI3dmtuanpwVVg5RmZu?=
 =?utf-8?B?Rmk1RHpweVU5ZWF0cmU3d1F4Ulk4ZWVwWXBHTlJqUVVjd3dObnFESzlEeGlk?=
 =?utf-8?Q?F7DsrAer4k1voSMEDvJpCR2lD29Xx14eCBkoN8i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b98803-d5c0-4a5b-0236-08d984cfcf64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 11:37:12.3199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TcWfrSHm0sBO+bjyytBSITdyyck2Sh9hoxeKOcaVlRKyazs53dWgsFTDktd2jI8vDerA2bRA2TvlPHL6YNoVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 01.10.2021 13:22, Tim Deegan wrote:
> At 07:59 +0200 on 01 Oct (1633075173), Jan Beulich wrote:
>> On 27.09.2021 22:25, Tim Deegan wrote:
>>> At 13:31 +0200 on 24 Sep (1632490304), Jan Beulich wrote:
>>>> The 2M logic also first checks _PAGE_PRESENT (and _PAGE_PSE), while
>>>> the 4k logic appears to infer that the old page was present from
>>>> p2m_is_{valid,grant}().
>>>
>>> I think the p2m_type check is the right one (rather than
>>> _PAGE_PRESENT), since that's the one that the p2m lookups will obey
>>> when causing things to get shadowed.  But the extra _PAGE_PSE check
>>> should stay.
>>
>> Actually, having transformed things into patch form, I'm now puzzled
>> by you explicitly saying this. Wasn't this check wrong in the first
>> place? I don't see anything preventing an L1 page table getting
>> zapped (or replaced by a 2M mapping) all in one go.
> 
> ISTR that this couldn't happen, but I don't remember exactly exactly
> why.  It may just be that the p2m update code didn't have that path,
> but it's a bit fragile to rely on that.

I'm guessing that this is what the vague "potential errors when hap is
disabled" may have been referring to in that pretty old commit that I
had dug out.

Jan


