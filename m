Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7554AD5D4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268122.461910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO5W-0004nc-H2; Tue, 08 Feb 2022 10:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268122.461910; Tue, 08 Feb 2022 10:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO5W-0004kb-Cr; Tue, 08 Feb 2022 10:51:10 +0000
Received: by outflank-mailman (input) for mailman id 268122;
 Tue, 08 Feb 2022 10:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHO5V-0003ap-Eo
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:51:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05943f13-88cd-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:51:08 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-5t8rhl1xMmWVFiYYt5Iraw-1; Tue, 08 Feb 2022 11:51:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4546.eurprd04.prod.outlook.com (2603:10a6:208:75::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Tue, 8 Feb
 2022 10:51:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 10:51:05 +0000
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
X-Inumbo-ID: 05943f13-88cd-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644317468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmVqmvyWgB1BcDZOu2+pvCuRp8JYnwUvy5N26TGMCsY=;
	b=TcsXH1vXcITI94BAJjmeHjaVt+AFyxv53/KfwVGVCRebHLg9gxv4CCFcmRtciK8EeKdXfR
	nNHfab2IALGcyxcVS+WICR1t7jXXTtHBxvLdXpptPYAENpEmBaMk2WtwzgwliOtTLwuFxb
	Mg1F4WAlqLw9g+vaF+8VgDcBVmuY9uk=
X-MC-Unique: 5t8rhl1xMmWVFiYYt5Iraw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNZiTbTuTBDIpLD+0VNYgHGSwHId3lp/ZeTt2vSOWLAkektcx/DpmDhzaYm1zhBbvlfB1QNBifi6Ruf0JcMqyAPnZneCY2iUeDg/ZqWb/yMCcwkFSwK1ivswmI72HuvYcipGc25qEL5BB2gW6SpGRvkdsfG2hQcvLjstSxjI6x7CMIdskbxgnZPw6aPmhXeaZvR3HH2raD7yT9eav3ePB8vy8XMh2IIEH4rXYvjPSZeJxMKL2uPVSPp+/iDNFyPQ7gkjXesmDm8BesFVsiBG3r3RsWkzf1Ti508VwhR+cjapILAo4SluEBNGB1aL0/8ooWHWENjYy7vw/Y2Z29rZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVKN6yO42bbFFeWXodLK+XrYr1FH55QB74wAca7cttc=;
 b=cn7WZzNfZ2qYjpO88qs5ZeboyVzjzNwibaV/dkAxA6JE8argTvNjNRPpx2MLKPT+YLs9F4TkxtWskOP+u/y+6zrSpWlFHsKQze1bDFJaVHvr+JokEDu2CyNBXQLQOBSh1CX5SRMO4OnEeydMlLPglsP/X/Xlkcpk1HIbccaBdzZkhwlPBlbpTz7+sSUftAjNaBiuRIFmzqdFGBUj7DbBc3bGwJlP30qpkxoXHdPqn6cZYqO1jssBcYnhPNGqbofAl4jNiZmUJk7SUf/5I9p83vPP4xY0VFED9QEOAbsk4QE9V2mcmzPlDa5vU9dcAG4p/BoLDGPw3faj4wY/sh/ggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1680d537-fb6d-c589-66bd-f845b8280308@suse.com>
Date: Tue, 8 Feb 2022 11:51:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/Intel: don't log bogus frequency range on Core/Core2
 processors
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <419db65a-a6f2-f812-d51e-7a23d065d460@suse.com>
 <YgIv3O8ojoDK+wiR@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgIv3O8ojoDK+wiR@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7b14ffa-6075-4eb4-b38f-08d9eaf0e7cf
X-MS-TrafficTypeDiagnostic: AM0PR04MB4546:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4546B36DE5B4C5F5D55E1F59B32D9@AM0PR04MB4546.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5W9Z5E67IgSPXM6putslXVe2/UU+hapOD+JvderfAcOp9d2n9jEmKBh3ZdmzjR75Q7jSJnQTYRuqKcrB39q4jNUe4MJbZCB7zD+Z0PuHy9ZgB3nXMGsSQXhDLnKg57Q8n7ytorAGPmlOhu6B4UVcUD/QxMG0tAJXEqEtJQveoNiTJ8Do/A78lFt5lwUGVB1NwD+BRcR44fwQ30IT4El6cb+JBbbgztgh9PvtMMpyj+P0DonmM1rXhl6QcHchfSr+g5zDr0tKVZpfKrd14VhOaPkmpqYQXPFYr9FqV9ZKfenpXSAuPIaw36rygZ2H1u7Mj7RXGw6FQFQK7KysE7DmiN4jg7tRkxOp5RcMXU3a+ZJlqGIXMjK5pKN2i3+SwgnVESUXR9CjHxhMXaDp7HiRM4Ctrx0JJte5FKeOGmOjR4MqAYkARoWK0YJ47JUGKU08+N2mZQXStHzzPdHK0hv1I8W8AzdY35f70u0IX89GSOko3p7VFRWxuCf3Y8Nq9mJD/jMNJBUBM/iwAls8KppHsSeCbxzgZvfUZqdFZ/2doQ9GJGSguPcbQ4K3TCj073Udig+XM4tsuqfOAKEqdicniJGCuLNF0Q68RcQlajNkOKBi4wBCkfAPj6an8iW1Yw90nATAkq5mLMoTOvZNOhh0MnBUGEZB3opHfN5liCykzvvZAhyW1B8pBBar2TMIo2W4Nxm6zueunTWpEf+XcL4mY35x3efN0IP7eUH158xlz6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(508600001)(36756003)(86362001)(54906003)(38100700002)(31696002)(6486002)(316002)(66476007)(186003)(31686004)(66946007)(6512007)(6506007)(66556008)(8676002)(53546011)(8936002)(83380400001)(4326008)(2616005)(2906002)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q2KbO2GU2pob4iz3v8L3AV1mE671aFJHDcDr6+A5njG6DMwJ7lkWEmlrP6jo?=
 =?us-ascii?Q?plcCG9+rMmF9jUBtCJqVo8J1JQv4xtuEkNETCAxYEhdfSoT00aM68asIv05O?=
 =?us-ascii?Q?vKQSNUf9gn/2gLUs3r9qzFwRfgTPt/G3sK+fcc1IH9x+DwJGk510Tp1XkNCj?=
 =?us-ascii?Q?ZMPhLmhSoYIpCFwc4JTxHcL6hR9Lt1ihDSiysjE5KIa/wGz+ttx7FBGK4ubL?=
 =?us-ascii?Q?IwrKI8oDdH111sw9+cBzEhxJaWcOHcxk7WKau+ZcEpfoOAGhxUMSpxWZq41R?=
 =?us-ascii?Q?93Nlv6NcEchKBjMSXfDChfz5pbWle69/Fxzw3ILEuHCXIPmXy9qTwyJcabCE?=
 =?us-ascii?Q?alLnC4WIx7TQ2ciZLp7eMDBuIzdLE3OxrPbjffBWGdRWnnPsBBohHZa1YbrH?=
 =?us-ascii?Q?wX4HqmnwXAZGeQ+umA/aGCcz5tP96OWnWeRwQHYXHBqAphrgpsw/K6yAT5b3?=
 =?us-ascii?Q?jlXTBGwn5ULvkNkZE1mw8bYmBdnKf2xQsxsGVixPFkNVKs4NVys835DaIEFX?=
 =?us-ascii?Q?H7n4XyjtY2s9DYFYBNdr2TPToyqbaLLA2Lf2ArT+3AZ8UWHL12n/lxl0N1y6?=
 =?us-ascii?Q?aC5sOsDkY1JxINcJ8HtazpS/yDQn/DhnFsLLbCIUEerimvMGiKGGmv69bWdV?=
 =?us-ascii?Q?cWUaJhNKrs3wSQ/ugNHwBDGwTLQ2jjG4Cugz/6fvmf8E7fLiBk9tGXHLjRTU?=
 =?us-ascii?Q?9oRFxqG6rWuAv/K40ANvZsvRRqVqQDluc2Xw9WFKHMplmrHEgvwLFiOzctOz?=
 =?us-ascii?Q?X/sEb7dwSG7qsMpNWkCynynXdBet1Gdk/rn43snRfFTj1GzPdmZodLksW3pw?=
 =?us-ascii?Q?RAKVfrpYr6zBCTK13pt1OYp5ATnqnhr0+vf4gLdEAgefMCYqcZXwwWK7jyoO?=
 =?us-ascii?Q?9HE64Kdk0czoG+PAR6i2u9pkqBqX81P3BwktT9RZsfKMQQVgU2e6OFLxVxx0?=
 =?us-ascii?Q?itygXjqVQFrbbcz4U4k4CnwfdcorN8ezBmRyhSR8W2K18INYzggppOA1Ehc7?=
 =?us-ascii?Q?T1y9qyy1jVcEnKRUOjVOz6W0S+4qI06esyZzyrdiVS7K6FAKLJefzrB7biyJ?=
 =?us-ascii?Q?AiuepNSjtJMTOyo0qMd5ejcVWoys3u6Z6Nob08Xe6FtqwJc9qLXotbQcbibb?=
 =?us-ascii?Q?3FgJrn61NVfr5Q8AW5lyfXyJcQ6DGW5CNWz9O73pjbQlCTSOFwXvDQ3a9Esq?=
 =?us-ascii?Q?lhNLQ3bWMERTKjSqCc6DX4+91vRIbqbsj/124RwSj43j+WjYnmxRvKXboSHJ?=
 =?us-ascii?Q?JLXb9pdy6vC/fkjxnFxfDtwJI7PH5YZM+B6+d+FUwOaO/qREPWuvrLzbJfM6?=
 =?us-ascii?Q?hQBNxI4r2hqLzTAc6pO3/+wldAP3UxPRrOTd/zUSCN1YXn3FxLDQ75q7wsgr?=
 =?us-ascii?Q?0JR6Stp/LK3ZtfQTQeAvwOmampbAvsOQYPts92AhowRmHxTca7xPe/XtrazC?=
 =?us-ascii?Q?BB55jvCj7G1NmRvUix8oi45ypaRPOGAC+w4nPc/hA20c8BqWeAiUi5VUazw/?=
 =?us-ascii?Q?D5v9+gw2OKfbfp5Dl4wNNFwcd+e56ruGHPv0tB70d0AczLToF4VaxABFKQor?=
 =?us-ascii?Q?tfhWTg7OiIs47uvfp+n/VnWWPYH+BrcRMMVNLLWPFyVyZyTc/An/h6Qtn6X5?=
 =?us-ascii?Q?ZMqZFQvS40+6xI6Tve+QIBw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b14ffa-6075-4eb4-b38f-08d9eaf0e7cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:51:05.3710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz4qG7L9SzCEw1Z/3vI/IwAwtnLuEQMjybglsF3XFLxOBegoxXOKQBe7oqMSOot1FcnJcbT/oMB3TxvbQrHf2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4546

On 08.02.2022 09:54, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 04, 2022 at 02:56:43PM +0100, Jan Beulich wrote:
>> Models 0F and 17 don't have PLATFORM_INFO documented. While it exists on
>> at least model 0F, the information there doesn't match the scheme used
>> on newer models (I'm observing a range of 700 ... 600 MHz reported on a
>> Xeon E5345).
>=20
> Maybe it would be best to limit ourselves to the models that have the
> MSR documented in the SDM?

Well, yes, that's what I wasn't sure about: The information is used only
for logging, so it's not the end of the world if we display something
strange. We'd want to address such anomalies (like the one I did observe
here) of course. But I wonder whether being entirely silent is really
better.

>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -435,6 +435,26 @@ static void intel_log_freq(const struct
>>          if ( c->x86 =3D=3D 6 )
>>              switch ( c->x86_model )
>>              {
>> +                static const unsigned short core_factors[] =3D
>> +                    { 26667, 13333, 20000, 16667, 33333, 10000, 40000 }=
;
>> +
>> +            case 0x0e: /* Core */
>> +            case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
>> +                /*
>> +                 * PLATFORM_INFO, while not documented for these, appea=
rs to
>> +                 * exist in at least some cases, but what it holds does=
n't
>> +                 * match the scheme used by newer CPUs.  At a guess, th=
e min
>> +                 * and max fields look to be reversed, while the scalin=
g
>> +                 * factor is encoded in FSB_FREQ.
>> +                 */
>> +                if ( min_ratio > max_ratio )
>> +                    SWAP(min_ratio, max_ratio);
>> +                if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
>> +                     (msrval &=3D 7) >=3D ARRAY_SIZE(core_factors) )
>> +                    return;
>> +                factor =3D core_factors[msrval];
>> +                break;
>> +
>>              case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
>>              case 0x25: case 0x2c: case 0x2f: /* Westmere */
>>                  factor =3D 13333;
>=20
> Seeing that the MSR is present on non documented models and has
> unknown behavior we might want to further sanity check that min < max
> before printing anything?

But I'm already swapping the two in the opposite case?

Jan


