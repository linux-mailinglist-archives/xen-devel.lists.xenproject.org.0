Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370076E47E2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522080.811253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO5J-00084L-Fj; Mon, 17 Apr 2023 12:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522080.811253; Mon, 17 Apr 2023 12:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO5J-00081N-Ak; Mon, 17 Apr 2023 12:35:53 +0000
Received: by outflank-mailman (input) for mailman id 522080;
 Mon, 17 Apr 2023 12:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poO5H-00081G-Kd
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:35:51 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 624ab6a3-dd1c-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 14:35:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9651.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 12:35:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 12:35:48 +0000
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
X-Inumbo-ID: 624ab6a3-dd1c-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAQSlWeem5oJUiOqcg42b1kKjkRZQQFZHBQYR7yQIFIdCgqXKxPCHtsf5LM5MGHqcdkMoVfFPSmnHD30eT46lmjWkHaFwVIEHnOxlWOmD3K+iNrEuc3fpdoc+ZsHCOPnU3wCYt3YdejIvEHS/nFRag+dIJmGpYV5f/FIkqMiiA0bussgAk/RKL8oUN5GsZVAk9fg1lrzE0xymmlOYhvlGoLi7P0yZJpq4jfGyMhhcl03YjC3kAuaB/jTn+elAhUxXaGHKXeEfkdNZB5gNQABRK6gPsxhstI5hQwY3E2VmZxkCqXZeB5WmZm1aytyJIXzejazy734zti/2yMuPC+1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGvUqX/dgB60Z74TjItC0AZ71tF3trodq1AxDIYlSX4=;
 b=ePSDiAz6PLn2FuuBOec+M9+trfQuWoKNIwh5bQJ2V/MHAH998cCOI3/nTNTaXK68WmfRuHJ7Gej1hhw46QkQJoKhBinQRqblMq7ILVYA+/7Z6dYlclMAnRKEpcMkLyGssqDtCsEDXKfS5xm0gKFhQ8hs36sVtnDV8DD2DAgu0Vhn8Y1qM0Ihkfy1a7qIe8sbbRzYTE0CqnHPdC83VIMjko5zwrPJOssBmGXIHoe5LS6c4O0E1WRSA0bZXXN/v+8TL/Ef/1D/POEXC+Q+tC57r6Cfr52uytqL/ldAlovwdg9bcGhqBnvSQlMidw2l2uEDGPa76n+XMaTPFh3uAVjseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGvUqX/dgB60Z74TjItC0AZ71tF3trodq1AxDIYlSX4=;
 b=Cc32AY0BxnJ6au6xsbWL6toLmpIsrgY8TqRKiUPaGy/PCBwa0t8/G3x+4nvfwOVYUeglMOBcLojnn5syask1vlzcDkhVdMWus7cTwmHLS1tXpbaX6h7DdasKIlj+qmWfHkQEtea5WIli3eKaZNgRaRG6DSkSPC973+HetA21POj/ahHBac8rVdnZkz0OWzgr0B3D0Z2elgVCv7belmh3wILRlkYym1EvkgEFEnXiPoesv3333nlIdK3mq9ZKxCkJovHwYccm009ajPuelXSpleqpOxcci0Ypzl8Wa6xSksMnYUAqwakq5w4jrLj34O2/YfjOJ+o2QPiFVnJzq8jqNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b1f3719-c8e5-8a98-8325-d907c160d81d@suse.com>
Date: Mon, 17 Apr 2023 14:35:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/3] xen/livepatch: Fix .altinstructions safety checks
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
 <20230417121357.3738919-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230417121357.3738919-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdf34b2-44e1-43e4-6aee-08db3f4045c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4dphuPQBTHOI/JgzE4FeH7nadqCGRCiNOREbjWBfE1OVB2U+1FYlrI7BJEPdK6vyx1uMtd1GL6qi6zQ6SrJWzIf26oNDQwmJLyuaWOQ5V6MVb9QbLI1UzLueQXvVhPJC0L/dJhUI8V5FKITlD2K5/WPjL3Tbzwuudz5EZlQ+BvzufT9Q3JrzMI1ZQxmZR9CDrsxg3LaVITmr+ge87UdYyJr73VMdkHpPYfGorp3I029y855REF9VZlA2JlFLoRNZxOg/twKMHA1pnf42vuojQJqu9viLtdqf9GhTgdD2pNdip8D0bgutu11cvK5BPXhyPkVL/j081tSpX+3dP3X7xlCmEufpbKjzVZClXuCAytSd+6QWvCETShbJHwiYdjk9NH1xYf5MASdW4zJpf/Rj0SgwQYinAnmhFajTTAH2rriLoJx4d8IPEM2Cvw995mUtLgTfMwPHqG+9OdvhUgqdkcmkWaREnjUMBuGRiNi+qQkNBXvC0kOkAo3MCiEcXqjDaogYSoR9Gynogi26/epES6xo9Qe06CMu9vzayTcvINhwjGHa7JTvMv0zlrX1+HXWqmqqj5yBjZ0xdDyTUqQ4mFyWRXOWomW3Mbtw01TEDCR9HeJIMo2nnTtmr59jmfoFTgyYANdM2i6oif9mWb7WX9PXw7q+LeMRfTnPsGe8x5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(5660300002)(6486002)(6916009)(66476007)(66556008)(2906002)(4326008)(66946007)(36756003)(86362001)(8936002)(38100700002)(41300700001)(478600001)(8676002)(316002)(31696002)(54906003)(6506007)(6512007)(26005)(31686004)(53546011)(2616005)(186003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFVBalFCUDdjZXlHd2pUQm5vODRFZEIwR1YvckluWnptRHVHRWVFUzRQaXFj?=
 =?utf-8?B?dW9BVEkvOWtDbWJTV3RqZ1FkdXZLWXkyWE5wMlpqVVM2TFhCS0E4cFdUeTBL?=
 =?utf-8?B?M3FjQThLMWFIblprSzNQWHVTb3F6ZVZYWFUwMDJjMVkyWDZDeXhhbkRPaURS?=
 =?utf-8?B?QWJhTzBsRmw4NmhldHN4NjdRcG52TDhnaXJCUFNIajhvQ3dad2svRWNlSXZ1?=
 =?utf-8?B?ZS9rNkpBeFV3WHc2eHBHcFk5dXhXd2trdEQ4K1hrOEJoQ3dBcFZyd3N4bjFU?=
 =?utf-8?B?YVBaUUFzNXdaZUZOZmZmNzZVZFI3SjZHTlM1bzIxT3gwczhEbVVQNG9jajQw?=
 =?utf-8?B?YmQ5djJvOFRHRWtzd1JiTWhMeHNPWVZWQnhHdHVUSm0xNEE1REttY1NFZWVI?=
 =?utf-8?B?Y1BNYllvOFYwWGQzbHIyeHVKbzJDVmlMbmQvTk11ckVNNE8yVThsQ0NlVDZv?=
 =?utf-8?B?Qk5KMkl6UEpHSTJsYndCTjgyZ1VVV3ZBTWZaZ3ZqQ05FTmJETkxOTTJhUjZT?=
 =?utf-8?B?NVlOb3oydFo4UE5VSEVQL24vVUp1UGlaYU9uNkNlMkp1dHRZQlJHSkxOMWV4?=
 =?utf-8?B?TDdVR2JTUGRadW5lRHR1NDg4VS9uY0VHZElWeHFNVlRSblJjcXVEalpQMnkr?=
 =?utf-8?B?cVFRZnh2VlM5Vy9nK1RaMTFuN0duTktyaTBadGpIeXV2UjZGUUtZTmhnaEdj?=
 =?utf-8?B?R3VXc3dNWHdXSnpid0ZNZnU0bDdtY2laekFqVU5wSWhFVzB2U2MyUlNqcnJX?=
 =?utf-8?B?dDR4Mmt3ck42aUJPS2xGWkZTQ1Bab1dTZkpiM3lQeE96dDdKWmU2R2c4ZHd1?=
 =?utf-8?B?cWoxMldDeS82VGZzRzlyRm1NRnZLOGhQM2F6MUkyRkR0NklpT1dDNy9aZmpK?=
 =?utf-8?B?RFJDODFTR3piN2pRMCtLYzVMYVA4dW4yTkxQOHo4ME9nZkpzMXo3eTAvTDhV?=
 =?utf-8?B?M09uLzhLNDhtSnl3VDJUTStuZWNFWXorL1pYOG9CdlBiWTU2NnBpRXhJekd0?=
 =?utf-8?B?T25wZUl1ZzY5aVBBQmtYTTZ4WVhZcnBjUTJ4UWI5SkY2L1RwMkpIVXdobG5p?=
 =?utf-8?B?S3VEb1N4S1ZkNmdMdHZaRW1QRmlub0N2WTdRQTdkRElNL2w1TDdZWHNGOXFq?=
 =?utf-8?B?MXNsZXVEb0ZJUURhaGxiSkJqOUJZNEM4Q1FHMEQ5YXJwNFg0cEtmNFU3cUlk?=
 =?utf-8?B?d3NBSmlUbW1QZ3BwVDBNMitwdmJwR1FJb0xGanM1bm56VHpIVjF2MEk1YlpF?=
 =?utf-8?B?TEpqUTJoOStyNWI0RmNsSXVwRzRDNitzU0VqVTE1djBVQ2hNeGFUclNlcVlP?=
 =?utf-8?B?bmVzbmxZSWQvNnZCa1VkVHJoMFpiSmVyU0s2ZzNZR3UzK1Y3Um5vWU5wSHNi?=
 =?utf-8?B?R0Y3Y1E4NFN3bHpHZmllajlPYktLOVJFTEFRcFFLZlJNN2Z4SGgyTmpBTi8w?=
 =?utf-8?B?eWttY2RDZFpCM1FJbW04MjE5dGl1aDZLMm1ES2xub0RKNEFkSUdPRTFBZ3F0?=
 =?utf-8?B?YkZjK2g2ZjVuOWE4cVNDUDFYVHJnZTNEQkpneUcyT0tXZ3NiWVdEbGxUTUJG?=
 =?utf-8?B?RThuOTg4VFkyVlo1NithNTVwVmpKbE1WZVYzZ0hWd1FRMmx1RzZRLzFyV2Mw?=
 =?utf-8?B?QVBpWGk0VVBqZmh3VitvVEE3SWFTcUNaNXhJR1prTGhDKzNzSHc2Y0I2Q3lQ?=
 =?utf-8?B?RDZvRmM0MW1qL0lrU01nN001cWdkU1p1dWI4dm9SSDFYODNQMGdWSFMyU21F?=
 =?utf-8?B?YlFncTRXd1o5RDFaUlN1UlhxaUg0RW91OXNtL3VTVi9oTGw4K2YyL2I3U2JF?=
 =?utf-8?B?ZnNOZjYzdE5ZQ3QreFRSRjJIbUhpbkFBbVRRUVJWQ1pVRHQvekpmMTJVUkc2?=
 =?utf-8?B?TEptRDhDNk5zRkF6QUVSRGdDcTQyMGp0Si9qclpWK3Q4ZjFHaXRGMlI1S1ZF?=
 =?utf-8?B?KzlNRXRDQW1IUlc5QU5SUTNtcCtUK0pPeGJnOWh4Rkp5cm5LOGZGaE9EOVQ5?=
 =?utf-8?B?VTA5Ky9qT3gwaFd4VWo4M25HSEdCY3N2VUlzSC9wYzhpM1dXbVRmamNxcTdM?=
 =?utf-8?B?QTJIT3pRWXEwb1JmdmtneWNZTXZiLzJOeFg4SU1TNW1sZHo2RWxmVkJUNXB2?=
 =?utf-8?Q?SEM846oNvfspXajkCbkrnX8BX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdf34b2-44e1-43e4-6aee-08db3f4045c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 12:35:48.5504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkKKtFTHDtMLXbhb66LlB7jWxTbUJMm4DJGEcX/aDnOsEXXGDGj4sJHz0PJTct7sHdGQFbeGMUIK9QLcsgdudw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9651

On 17.04.2023 14:13, Andrew Cooper wrote:
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -803,28 +803,84 @@ static int prepare_payload(struct payload *payload,
>      if ( sec )
>      {
>  #ifdef CONFIG_HAS_ALTERNATIVE
> +        /*
> +         * (As of April 2023), Alternatives are formed of:
> +         * - An .altinstructions section with an array of struct alt_instr's.
> +         * - An .altinstr_replacement section containing instructions.
> +         *
> +         * An individual alt_instr contains:
> +         * - An orig reference, pointing into .text with a nonzero length
> +         * - A repl reference, pointing into .altinstr_replacement
> +         *
> +         * It is legal to have zero-length replacements, meaning it is legal
> +         * for the .altinstr_replacement section to be empty too.  An
> +         * implementation detail means that a zero-length replacement's repl
> +         * reference will still be in the .altinstr_replacement section.

Didn't you agree that "will" is not really true, and it's at best "may", but
then also doesn't really matter here in the first place (suggesting that the
sentence might best be dropped, to avoid drawing attention to something that
might at best confuse the reader as to its relevance)?

Jan

