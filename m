Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2851D7A7
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 14:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323063.544595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmx3t-0007QR-8L; Fri, 06 May 2022 12:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323063.544595; Fri, 06 May 2022 12:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmx3t-0007Mx-5U; Fri, 06 May 2022 12:27:57 +0000
Received: by outflank-mailman (input) for mailman id 323063;
 Fri, 06 May 2022 12:27:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmx3r-0007Mr-Qa
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 12:27:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f410b16e-cd37-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 14:27:54 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-xoQQ9-TfP4-mOPEjy5Gm_g-2; Fri, 06 May 2022 14:27:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6505.eurprd04.prod.outlook.com (2603:10a6:10:10d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 12:27:45 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 12:27:45 +0000
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
X-Inumbo-ID: f410b16e-cd37-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651840074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dyWkB4aRxEjKwy9UllWtQ8l0p1Mlsa1ZfrvkuDi0Ag=;
	b=j2JYpz1pUH4vTM90qXJowIpera/yDX3t+GqdWFQ8Fx9U2wwGiOChRbyrabLx7taW7X6Yx9
	Mbphv65Mdumu2nBtAWuX3TP5P5au4vybK6YEa6pKOeEJBWY+rslXtEdRFrP/sXo6mO3dHG
	+d2RttjAMXgWs0502N2qk4ot50z0hG8=
X-MC-Unique: xoQQ9-TfP4-mOPEjy5Gm_g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJ7b/dH2oQdIGd30uIUddeoKXCi9x6jkUZm71XKsYvqvTktcuIdE4174esXHUn2pEK0DrXQANS4sUsUsTJbJTHfPJ4IcNMbTl2X+c5ekumQXZCsZPb6y7BUodHOxplBHZe8+bp4XiJ5IBcFxnaVYn9exhYEW3YhH5FLgnULF63h/CkVVS9UT93JLuF5d06anjF/ZMCf/cD210LbfB5OzhGmJYyOgxrNm8+EC3NZBu28G7AHCGTPv/l60Z4kGRqLUTkoRX7N+a86Njh59YtkY03KurPkt1DShi2j4PhX3+U+vp6LN9/xs+G3JM1A8d36BinKNEZ5C5oxXbTYdVi1ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dyWkB4aRxEjKwy9UllWtQ8l0p1Mlsa1ZfrvkuDi0Ag=;
 b=OszG/VNJqrYXCH0Ee91tnXkfCIwa/VEUUpX2Mz/XGv2ifnTVNLBQy+8JNf5OC6isc/AmDRc1h7iPncu4UCXN93LK2HznDhZLb9tjcrNo0DwFIdGzUPG3sH51fKz+NScvYKaSr+9SbCKsDL80XxUBkpcaewJ/ERTKp5iSmT4PMw2Zd+XomfaZwC72XHN14dGtCov9K8WVDeiItffYJjdoIBPlX3pz+iR98wGvHBJeBgCLe6y6kDlRHUn7rokKSR3c+rcP/XTX30UQ2pCFykPtc2+mbaX/5yqvMYfLqRRY4s+F4RXVameMwip/Zocip4BYnL1RfyoF2ZY2/mpcK8MEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3dbdf5a8-1257-01b1-f61a-a39163be26fe@suse.com>
Date: Fri, 6 May 2022 14:27:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Wei Chen <Wei.Chen@arm.com>, Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220506055201.999277-1-Henry.Wang@arm.com>
 <20220506055201.999277-3-Henry.Wang@arm.com>
 <6a44bc43-c392-2eac-d350-ec87cb2c3ab3@suse.com>
 <AS8PR08MB7991DBFE189E7FC5E63C1EB392C59@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991DBFE189E7FC5E63C1EB392C59@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0032.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b556587e-8cd9-429b-6293-08da2f5bd310
X-MS-TrafficTypeDiagnostic: DB8PR04MB6505:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6505E5C631FD28C4118162B6B3C59@DB8PR04MB6505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8PYqv/D32W+ltMwYoDv840/m5kVj0cpAID4EN5SYlKRB8kXwSZP2WG985uddfI85y/44gm3xSpC/APi50lA/rpF2/9kGReEiesvdLPQggMePhRGdTJdp+yuNP5+85zv65g30V444aDENUhN7wWEZYmC8zHZVUjJJ4nI2e12j9taJdR06c+ZFbLB0l1sdIGD49peDgPO9ExDlKeIBG5KHNNzQY5/0A7/CjryU/yDXB4vZXF+n3xr9AL3cM3gCieiEGev/yeIwnOCV1/jUZfeXKsN+kQpU2NLbla2yh4CesOeeih7iaOz7wttA8L6rqLOBoFSHkRj69mAzf9jG4O7cxwaS8vHPQyt0kZ/0JY2KYxSvTjvl17Rryo2NSkraYMDawGWOLDzHdKGQk1kdBr4UC3K3tIidWNSYh0mUlEc0YCH3MFxNxuek5e9c8cnL04bvHVSok+eRWOdsxXZCxDaETAKPNNoSDKV0jNEUhXka8BtnHgifFbOx9kXzIp9TKr0h3GUrecq+3PGbj33bI5ZLXPkLqIa/jmLEOP6pB94g7r0KUZEiAJqqjGEzhI/AqQ0bovJkumeAx/S7R8+TxybhDcGR53/xT3lrqkMrNHUokJHrvDm3TUWh6Iq1vocTUgmAgqm8+0fdNYQb41JfoQYiPNDfZK7fA1qcVKzoIp5U11uptmXZzwi/Elz+xWMS8+2u2qEnlMEl6zGWk5PrZMIK7sin9fUEP6waVKkSqvAGXUzSnRWt+P2FAJ2+wUpTtkT1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(7416002)(38100700002)(6512007)(316002)(6506007)(53546011)(5660300002)(66556008)(8676002)(66476007)(83380400001)(2616005)(4326008)(86362001)(186003)(8936002)(31696002)(36756003)(54906003)(6916009)(6486002)(31686004)(2906002)(508600001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGFZWitYR21PTm1iSlRnOHZ0bGgwZXZwc1VaNTAzQWdzUHRVU0hRamdaOVJR?=
 =?utf-8?B?dXk4Z002Mk1LRkRvTUFHMERNang3UTNlRHVXaEJUTGVyb29keTRFYjA0RWVI?=
 =?utf-8?B?a1d3TDdma2ZEOWtIY3R1L0wzMmFOM1ZzZW9yV0lROEdDYjA3UllDaHVOcHlj?=
 =?utf-8?B?dzhUY0JuNldtZ3l5dnNHMjhKaUhkc1hwOXRMNXI0SWdzZmZmeUZPS1ZOYTNU?=
 =?utf-8?B?bzdVcWhDSFVlMlhvNTlkRDlLREFrM2Vyby9GQUpiVExacERQY2FTSElsQ3NX?=
 =?utf-8?B?QVYwTmNxTzM2NWg3QlEvK2hUR0VqdkM1b0pGZ2xta1F6cEx1S1g3SHZ5Q2tX?=
 =?utf-8?B?eXdJU1BvUGFuK0NIT3VjcFRVZ2g0N1BrV0ZQQWVSTlUzNGpxOEp2SUFud2lx?=
 =?utf-8?B?Snd1SmdTa1B2elBqbkJreUxQYTcrZXFyMmhNOGprQURaTHAvaXZtd3hqenE2?=
 =?utf-8?B?bU5UbkhOcVNsdVBTVmlaakZ5WXFacTBFQXdPdWRwOG5iTy9ubnd3bXpEa0Z6?=
 =?utf-8?B?SzV5eW1qUW43d09yK0JlUWIxdGF6V2ZTa2dHYW5NNzB5ZWs5RzNpZXRndzlU?=
 =?utf-8?B?eXNJN3ZCREJ1RjhBWitCeUk4MERSODNCZ3BmUmJGbmdyalBXY3Mwd0VoeDB1?=
 =?utf-8?B?NzZlbkpMRi9LWEF4U0M3Nko1eVozTGdSWE5tUGR6T3pnMG9uV2o1RjVDWS9a?=
 =?utf-8?B?MkMwNHpranVoNDJmZEVZOGZTM3p4bEFwTW9DcjVrSnozZ1R6bW05T1I5T2Fj?=
 =?utf-8?B?Ykx4UmJ2azlLaDhqd21zeC9pSlRjNFB2ZFdVYkQzNy9EbTVWdUdLRDVIQWZz?=
 =?utf-8?B?emFxQTJub3VWN0ovSXRHNnpqWWxTTDRWN0h0dmdHMlFXWnZwV1JyZy90WWJx?=
 =?utf-8?B?WEhtWTRpVjhJaTVwS0FrNUkxWmlMaG5BQ2hYMllaamxoTnhFNUo2aE9HcXJt?=
 =?utf-8?B?U3lFaUdoSzNVcjBuRGltcWF6TU5YWktrQ3FGQldabGtORFdsUVVMWUVLd2lt?=
 =?utf-8?B?QnFITDI2NVhKSWZ5SnRPVTE5SFNTbDRBL2E2aWN1VWVDTUQ0U2dLUVFuTVRK?=
 =?utf-8?B?ZXZvTjNmb1FmNzAza0JQVFVzZkNhaHV1a3ljbnZJY1kxTW10bTZkd1pYT01y?=
 =?utf-8?B?cWowamFOeHoxbUhxUE43MDU4OWMzaGhHY3kzcytqbHp3UWltM0NOV1ZaUzZM?=
 =?utf-8?B?d21iK2dJVGptUklQNGhFUEVxRUVOR1JUMVd5YmVSbUlRUzluL3JWaXhlSUI0?=
 =?utf-8?B?TWZpVy9GNmpXbkdlUHhZZDUrbmZlTk11UmgxNkNvZU1QK016cEsyQ0tOSkVI?=
 =?utf-8?B?T2p2M1dsR1pESTdMUW0xSnMydTNFYStwNVNseUNWZ0FFT0hkTm56SEZtVCtP?=
 =?utf-8?B?YjBmY05yMEZFZHBHd2toQTRjaE1ReTBhRVdyelNCcCsyMzJLbXlQNE9CS1Jr?=
 =?utf-8?B?MHJjUVcrOENRT0ZkRWlVR09FY1RpK1VHeXA0ZDZWdFpPa3hhQzZjb1k0Q0lY?=
 =?utf-8?B?NlFXaFBrUzRZNWY4WnBLRXlsRVV5b05wMkd6WE5MOW1hUG5JL3ZidllLV2ho?=
 =?utf-8?B?ZUdIdVRQeHk5cHEwLzZKd05iWXcvOU5IZjB3WUdWajRoUGlQTFFtNGxkYUk5?=
 =?utf-8?B?SGRjYzh2Y01WWmtBcEpXYnF1MjNLdWl2V0xSRnVCOXo3TUZWVTRiRHQvdmdS?=
 =?utf-8?B?ZjI3cDl2Zjd4UDkzU0Fsano0bVM1eTNxR0RBZGpxY25XNVIrRDFhbmMzS2lK?=
 =?utf-8?B?eS9jNDBReEtnUC9LQVVKS1ZXTG9LeFN1eXB3ZjB1a3AwN2JjOUU0TkplUnh1?=
 =?utf-8?B?T25SOEtDQmZvd21LUS9RajY3aE9FbW5pYUdEaERhM21iVDZjaXp3Ni8yRFJ5?=
 =?utf-8?B?cEgyckNhVGZGMVhjaTlzSlBORUUxTGdTY3FtSnpzekUyMEJweE55cFBORnNB?=
 =?utf-8?B?UVUvRDJKWGwrQzd3dGJpMjlPUWpKd010MkZUeTZ4c1dlVHVPK2xOS0hRUHg2?=
 =?utf-8?B?Q0xTVDF6dzJzaG9TekEwbmE5OFp6RFhrVUNpa2hqTkdzd2g5MzNSMWlKcFJl?=
 =?utf-8?B?L25qRnVqMm5xWVJtRmxkeUhGYTA1U01YZkNnNmprY1BKZi9WRy9QamZ3TURH?=
 =?utf-8?B?WHk5dWJUdmNqdWZseERlMUtqNUFzL1J4ZUJ2MHd6Nm1oU0dvbWJFTXVJaDJT?=
 =?utf-8?B?b0c4VXUxdmZ2ODFUMjRqdHVXdUU5YUNhOWx6OC9IUlY5cllCQTFpMEFuZlJU?=
 =?utf-8?B?NnZRdkhrYnQ3YXdneXJRekIyTTZ4TVpXU3RLU1VHODZlSTM4Mld2WTZhNVNJ?=
 =?utf-8?B?U1JSa3BJcnpNbnk4NzY2UmtseXJvcVVMdkRSWUNFWGJXZHVLS09kUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b556587e-8cd9-429b-6293-08da2f5bd310
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:27:45.7192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DcQzuEqrArQ166a6ea2R5H9Vc4RyvWVx2j1rj8fwCE1jPg2cKk3lvDUkVF6LHq8Li+VUhe1WjAYQiMd5OxNhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6505

On 06.05.2022 14:03, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, May 6, 2022 6:33 PM
>>
>> On 06.05.2022 07:52, Henry Wang wrote:
>>> --- a/xen/common/xmalloc_tlsf.c
>>> +++ b/xen/common/xmalloc_tlsf.c
>>> @@ -594,7 +594,7 @@ void *_xmalloc(unsigned long size, unsigned long
>> align)
>>>  {
>>>      void *p = NULL;
>>>
>>> -    ASSERT(!in_irq());
>>> +    ASSERT_ALLOC_CONTEXT();
>>
>> For one - what about xfree()?
> 
> Oh you are definitely correct, thanks for pointing this out. I will
> definitely change the assertion in xfree() as well in v3.
> 
>>
>> And then did you consider taking the opportunity and moving both to
>> the respective pool alloc functions, thus giving even better coverage?
> 
> Yeah I would love to. But sorry about the question (just for learning):
> I assume you are talking about code coverage, could you please kindly
> add a little bit more detail to help me understand why adding the same
> ASSERT_ALLOC_CONTEXT would help to a better coverage? Since...
> 
>> Granted there's one downside to moving it to xmem_pool_alloc(): Then
>> the early zero-size and error returns won't be covered, so maybe we
>> actually want checks in both places. 
> 
> ...after reading these I have a feeling that we need to add the same
> ASSERT_ALLOC_CONTEXT in the beginning of the xmem_pool_alloc,
> xmalloc_whole_pages, and xmem_pool_free,

xmem_pool_{alloc,free}() are what my comment was about. And "coverage"
was meant as "if the assertions were there, more [potential] call sites
would be covered". xmalloc_whole_pages(), as you ...

> while keeping
> ASSERT_ALLOC_CONTEXT in _xmalloc. I think xmem_pool_alloc and
> xmalloc_whole_pages are only called in _xmalloc and xmem_pool_free
> is only called in xfree. Adding the same assertion in these three functions
> is duplication of code?

... validly note, is of no interest in this regard, as it's (1) a static
helper and (2) would hit the checks in page_alloc.c.
xmem_pool_{alloc,free}() otoh are non-static functions, so we will want
to care about not only existing callers, but also potential future ones.

Jan


