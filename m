Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7E74749E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558480.872618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhU8-0005ED-O3; Tue, 04 Jul 2023 14:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558480.872618; Tue, 04 Jul 2023 14:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhU8-0005As-LI; Tue, 04 Jul 2023 14:58:32 +0000
Received: by outflank-mailman (input) for mailman id 558480;
 Tue, 04 Jul 2023 14:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGhU7-0005Am-2f
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:58:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cd5b9c0-1a7b-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:58:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7287.eurprd04.prod.outlook.com (2603:10a6:10:1a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:58:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:58:27 +0000
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
X-Inumbo-ID: 3cd5b9c0-1a7b-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpW7+gYYXnrZQmFckHZzpUKZzKl01gGtmaFdFelErASWJbLHX1+4L3iU2K/iMCt6v+6p1YC8JumRj64hJsRzf1WcwNnalA9pgK8hvu3UufKm5j5E2GE24TGgskhZ+rSu+AZJ1qfLfMW4RP5ZXGWpdTOaa0jJwgKC+C/tOxdg9f1yZSZ8yXB+XwsewTjI+KeCJPGMwHqYIFnGibBtwrWphvPjSFJ1g5CUxGOfwK6t/gg41nW19Sm2lXgOqf6etJxL4ZYQLAfX2XMFjakNAQuvgiE22587k7AGgfBg3ZchxxL4BTBcEfrTHW+tUTi3NR456Fl+gx5r76mxNdjDJ7WxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9jJ7pFCGUg0kAolaJLhlV6C5YYLvflxrUyGM+T3uJU=;
 b=GLAAjucG6y7Yl4YbRoP5o5p7eUauxGI0GzFUplb96IqwEjp1eUaHM5S1nnsv6OxGv1MnzW5q9q3T1QTNlb4DFuY+yYOAz5+VXIR46tcyTuBab6eJDnvZuF7LF2vM1HUSZ9l1l+c7p9mf8wwvt/MLwi6LMXiMLitA3orZo3eKS90ano2JvaljWXNt0NjaLhluDgvs5w/zY4yP+u9QN0eFRe2UsCATOzp/G8xnQtRVXEHt/eOOfhxdTtILcQVr0J7KHa0W9fHJwm4Q30Fii+9Gmm5c2JHqVdWK9q5eugq2g3dd8iGrCrBRLNT6p23cj8SKZx0j2InkbGn+ido5KtGWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9jJ7pFCGUg0kAolaJLhlV6C5YYLvflxrUyGM+T3uJU=;
 b=uCFiIxssNsOyP2V2vt7ruVuOjV86n6z2J9qPkt+kDKaxmqiCbOtF13o42Gz1Re0tks7+5s5d61yVKJ3+aMZe9VX/DdzCnaftESTlE8O1xRoWC325FDFmII1VDwPAxejDWrhpQo6hlq9CYRdaVTVww29Z42afGRlSrtuLaY9mEA+jTdEvw2sRozs1EMaQJaG9fu6TnrreahW+AEL+YnpljkzQOf7XsFYSekMOpAyfPIY4oxcIK44S47TRFPQflHJzxmSlw9qJVLeCNPxSBu+9BeoRO5V+W0q9KJcTMeUSBC3T5MAUdQLx7wI+j6s1HIe0GXbApO7XBfOxzxMuavP3BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27e570a7-f247-0de1-9289-c604db442c9b@suse.com>
Date: Tue, 4 Jul 2023 16:58:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v6] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <0b0d9a5614daac653b3bfbcfaa29a9b4c11286bb.1687793572.git.nicola.vetrini@bugseng.com>
 <df8a0c82-5f07-6a9b-e24d-7550387fca27@suse.com>
 <d73da8f3-2a76-7c4d-dc7e-82a86bfec3ea@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d73da8f3-2a76-7c4d-dc7e-82a86bfec3ea@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: e306d0d7-d3a6-435a-d295-08db7c9f1f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R6T0CCUgI/BSTjlIS0nWQzdmEOeTutaG6DA4OArL36V4U5SRICD3CBEtoTvy0pH57V5pyWBXd/He2nU/GE0VytkkzsYz6hiMcwUM+Bs+z0A/DueDza22EBG8UQhhv9tta0MxY9yLt2bSOv1i1xVCI5bJSpSzwuI9NP4f/mT1yZ17fKKgdjF2Y8K45jFCRHSOVQkJO144RnV93nwTsKHJ6JHMP5LoWkdYzSD/dv2FiFdSrTSF8stICGJz1WLxZC/twmdEVLthhi9jnASUjTy/GOGkqoUDM9aESl9xr/JfEi+fC8XeUr3fdXrtZMiXBr7hdhvTVPM5lzlJqBNplXGojFEZQRabI82D+ZzkYVVCgmUDlCyL/+IbxBEvN621LxH3hpyl8piFJhs/dCsCn3TKZdu681WV4KcsV8+ZCyBdWIufS63yQkUKHcJO29vEyYmJqRyzT94gpxckxsUtHtPY8oj6ZUgsyHCdw7tR8ivmCCzYesGNbOaG3Rnf0yqUG/7/vnUpdmaIv4jQqUwBmYRHwS0ZPLyG8pZvD+15PUWfGELnlFU4cCkFHRYSuwUuNAkpDUAPz17wCtSv0afR2rSsRPK3fjJjB3zmIu8MUxeGbWRPXP6QNS5hz377ceQksLTU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39850400004)(136003)(376002)(366004)(451199021)(2906002)(41300700001)(7416002)(5660300002)(8676002)(8936002)(36756003)(86362001)(31696002)(6512007)(6666004)(6486002)(478600001)(83380400001)(26005)(186003)(53546011)(2616005)(4326008)(31686004)(66556008)(54906003)(6916009)(66476007)(6506007)(66946007)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUhyUjN3bHJLRFVoOHc4NUEvdE9YTWRlclZPRzVjaThRREZkRDAxQmRWVUlj?=
 =?utf-8?B?czQxS0FqU1hpY2FnRXJkZEpmTkJrS0dQU2NlMkN5WHVmRWVlSlpMUGpkTXBt?=
 =?utf-8?B?aDRXUTNTQ21LTWFlNkpKS05LZnlXUExERUFUYlRXMmZJbTRCM3BiUUJoRXBn?=
 =?utf-8?B?a2lQRytOUXZsOU9IMEs4ZldZeDU2VTJYK0U0dW5JTXdudkFFRjhJU20xRUtZ?=
 =?utf-8?B?LzNPVHBVU0x0allqK01RTmg3QmprVzVWelcyQWJyNGFGZ2ZyL0NCZkR6aDcv?=
 =?utf-8?B?eWhPRUxuRUh4Y1dkNHFuNFJVY2NkS2hEWHNyem81eUlqVmVySjJXajl5THkw?=
 =?utf-8?B?cnJqQmNzRFkxUDRJNUpxN0VDSTc0REpic3hmSXQyRUFOaUR3MXBvNEFJekRJ?=
 =?utf-8?B?azNaczhwMnkxZUIzZDRDWm5Ua2lTWEpWRWtpTzB6SmpIUExkdVBvc2tTRXJT?=
 =?utf-8?B?VnBjUEQraUsva0Y0UldQVXZyYWgrMG5zWFgvWlBKajJubk95WXJUaWdZK3VJ?=
 =?utf-8?B?SlUxSGFmUzB1TW5oZ21JRzg4OVVqQ29KUG5qL3kxV3VLa0FFUVNTcVlaWENK?=
 =?utf-8?B?cDdZSzhMQlhHS1VIYjVyMUxYWkRUMVMybkJiQWlTUnVkWFg3U29Rek95ckxt?=
 =?utf-8?B?MjR0V3VEeERoQytZVzA1MFFqSHlvZGdnTWVaN1ZKdnZUYlZxeExybUQvSXA5?=
 =?utf-8?B?bFdvU1dGRTYyTHBmeWcyVlQ5ZzgreDdFMmo0eVlZRGpOSXlaZzlKb1VicmVw?=
 =?utf-8?B?MXY3eEoyTnUxSlg2OUo1YktpTFdjWjQxbzByK1JHOFNjdXZxNmF3dmdnTkZy?=
 =?utf-8?B?T20xSVhMSFcwMzJMd3BVdGVjeUROb3luYzNLWjM0dElla1NydEoxb3hYZWRB?=
 =?utf-8?B?RnJYNzBGWi9ZbVlHbWpLYisxeE9vNFBJbE00b1JlNmVZUnJLNmN4KzJuZWNn?=
 =?utf-8?B?TzZPellRM0dmWkpwNFhpRkhaeUo2OFJsb1NYNTZ3Y2V4WUlZZkphK1YySHN4?=
 =?utf-8?B?N2c2T3pWdUlVbGpIQlpKZURZVjA5QUgrT0p0NkVsQmhSRjM4VXc4MnBxTlR0?=
 =?utf-8?B?VlBLZjBSdjdiaUhkMmcwSmVxN2haL0Y0TWJPYkgyL2JIamRIYnJaTU40dWJa?=
 =?utf-8?B?ZGpTeWpjOUJpUDEzT1RldVpsZzJMWmJYbGpJb3l5a0xZSURDSHRFbnQzQmxw?=
 =?utf-8?B?WUc4SlRYUUZTS3VhS1kyOXhpVUZ6cytpUHlrTmQwSEZRSlR1WEgxODg3blhh?=
 =?utf-8?B?cFVueUZBTTB3L0FTcWo3YTVKQTRLOExHTHE3VDMyMS9CejZITW9lQmV4aWt4?=
 =?utf-8?B?dlJNUmVIcTNRV09EVnZUUTNUQTZCSlBQODBoWTdxOTVqZEI4bTlkUGVOY0FS?=
 =?utf-8?B?U040d0hvTEhiTDRyWDU5dmU2SGpnY0R0SnQyWUJua3FINzRQUmVvYUJJem45?=
 =?utf-8?B?eExJaEdMbTFNT3NBTTVwQTlvNU1LT1BlVXRZY2ZzMXIzdXdDcFliSUVnVXYy?=
 =?utf-8?B?aXlNMkthcGc0U1pIUVpvREx2VzFTaFdEcU9HSk9Tc25zUDlBMmY5L2NvdElG?=
 =?utf-8?B?QnNJMEV2dDk2UkNaUXZVRkIzeWQvcFdpNmxhRW03VXpRVnRyenY4czZWNGpO?=
 =?utf-8?B?MG95c3ZPZk53UjVnNVBQKzJpdytxcy9senFjKzN6elVZVVJKb0hmdGZuOFdJ?=
 =?utf-8?B?NXEvS1dPNGVlcVppNzV3cDBzRUM4ZjRuUWJjWHp0MVhIa1lwL1pab2dtOUNt?=
 =?utf-8?B?ZHdxckF2bXdMUFUyQmErdWxnNlk2bW9QcXZ4eFFTeVVtZUsvYVArV2hoaWRu?=
 =?utf-8?B?ZFZhM2ZpdGFTRmFBOGVqNnV6b0V1aDYvM0FKU0JCc1Rwb3JvQ0gwSmhJeXc3?=
 =?utf-8?B?WmUyZzA0aUg5cDdEYmlVMmh0ZXovRXd0REdUUU51RDdPcEVaamZRcTRBbm1w?=
 =?utf-8?B?bGloYVA3WGFod1laZ21XbnJ2TFNoLytQM1BhdHRLT2dIb1kyUWluRWpmSDg3?=
 =?utf-8?B?cC9jOUdGS3Mzbm0vejRKWnFweTRVdmp0R0pQWm9TcHlRaW9vWDd5MjlMOC9i?=
 =?utf-8?B?N1N6NFZSb2dvY0tqQmlSSUhMUFh6ODc1VjFsc0syRjkzOVkyMzBoN1VSWjRE?=
 =?utf-8?Q?4XdzH0Z2yQ4xrJNXvHOEqRHcq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e306d0d7-d3a6-435a-d295-08db7c9f1f7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:58:27.4040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3xt7dDpOyLCYyD3yQE+4RSMQrHMdwggb7hpeNOzSDI2OX/wts7lL3ysDXLd4ROm0ZN64gMJEKzlocnJQhUHjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7287

On 04.07.2023 16:53, Nicola Vetrini wrote:
> 
> 
> On 04/07/23 16:24, Jan Beulich wrote:
>> On 26.06.2023 17:37, Nicola Vetrini wrote:
>>> Redefine BUILD_BUG_ON_ZERO to avoid using a compiler extension
>>> that gives an acceptable semantics to C99 undefined behavior 58
>>> ("A structure or union is defined as containing no named members
>>> (6.7.2.1)").
>>>
>>> The first definition includes an additional named field of type
>>> char.
>>>
>>> The chosen ill-formed construct for the second definition is a struct
>>> with a named bitfield of width 0 when the condition is true,
>>> which prevents the UB without using the compiler extension while keeping
>>> the semantic of the construct.
>>>
>>> The choice of the bitwise AND operation to bring the result to 0
>>> when cond is false boils down to possibly better portability.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> The code change looks okay to me now, but I'd like to double check
>> towards the testing you did with this change: While it is clear that
>> you will have checked that the tree builds with the adjustments, I
>> expect that would have been with a compiler supporting _Static_assert.
>> Did you also check with an older compiler, using the alternative
>> implementation? Plus did you also check both constructs for actually
>> triggering when the supplied condition turns out to be true?
> 
> Besides using the build pipelines in gitlab, I checked just the macro on 
> Compiler Explorer using gcc 4.4.7 and clang 16 
> (https://godbolt.org/z/1d6vznxcW) and the construct is behaving as expected.

Great, thanks for confirming.

Jan

