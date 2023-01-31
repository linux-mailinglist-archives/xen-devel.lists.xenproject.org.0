Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C70168271E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 09:44:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487441.755044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmE4-000757-Cf; Tue, 31 Jan 2023 08:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487441.755044; Tue, 31 Jan 2023 08:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmE4-00072C-9P; Tue, 31 Jan 2023 08:42:48 +0000
Received: by outflank-mailman (input) for mailman id 487441;
 Tue, 31 Jan 2023 08:42:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMmE2-000726-RN
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 08:42:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ae54432-a143-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 09:42:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 08:42:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 08:42:40 +0000
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
X-Inumbo-ID: 3ae54432-a143-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz67N8T/SrEV1gQ7eGK/t2+x2W3qa+bx7VOp83KRsgopLHvVLd7K2ZfSwhZ8WTYGuZub9sRfIXh3VxeVV1xFiR005uonbVJtXLlpXck/vlS0g4iCXfuouIdtth4HP0p33NingqMzXpAI8nj2mNYRev80PIJK69eB6VXUPPlH1OU3VMSdsa+85GpzspRKsOgN/EfnlQ4DI0smglGp6mzKeAz3al5WGaGY6ONH6Y81BUb0xSBNH76ltyy7BT3RY2bw5TxF8hAWXKByBCFg5Cx8AmJwh4CtKFHeu0qfTZE9UYjYti+O8xYMs7jg/vf3ppNjJUun321f/THZl+t5kyHqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqJZpumkOVkB1VVPHvU9hNvqmPP8gt0FgzEtAdRZ6EM=;
 b=LKfB+Fh2ZEzzvjUeqGVkRyy2VW16xiSNpA6qfwvq5pnT9y5IXucR4SAhvs7R7ngIncNspHtEhHh9of7hI7HucGkNi6IZF8A56NVcWIvcTk9zotaKnT2zfVDJdmFnzUi7dw1MRqvlKr6F1Pt1tBdzUIeJ4g91GP7sW1pdjjYYvXXsThmifNWtZoONjRctxrTBFXag8Rp4Q9BUG8aWumlPjLjNq8hbdQLy7X+S50ACFA5EvT6QLQeAowlAbCwhk6Cn/m8vGfbYhYsOXUeohkdyG9M/96Um+pUNzpdFM4SuKdHY0eaCuDRe8q/MhNA/+4YVGTw4iQqFrPm8j0BzxRXxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqJZpumkOVkB1VVPHvU9hNvqmPP8gt0FgzEtAdRZ6EM=;
 b=1mNS6JxlBnLeIj0upLdKXCEnxb4fDMLNRZlAs2blUvq6xsSeNI0HOOe+PAoTMLQQSVZSklaFd89HC9nyCrgBlgGdLtAsieeZhg9O4EQwDMsar8EQ3p16b6DKczBc6DH53jy00t7QJGu8Ujpui8yV7Pt4bdbUvDdBZsHZgLWa7yUDFPSqUX6KEeTDP/inrj4QkMcpHXUx7jJCgi/IXoIRvdhcH25LJ7fZ2RKkKYCdBTUObXSUwABPDLTQZvCCxI0ODwxfkOGi5qir70MQtepZYJ7wf5gRZM6J8u88HbpewUkMu1FQ9iIQzkJIYuBTf978X8lDqNOEtM45QFESxf4NiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42feefa9-d969-4d13-e1d9-4b68635013d9@suse.com>
Date: Tue, 31 Jan 2023 09:42:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4] xen/x86: public: add TSC defines for cpuid leaf 4
Content-Language: en-US
To: Krister Johansen <kjlx@templeofstupid.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
References: <bfccbe22-e5e4-40d3-aded-639d812bfa08@suse.com>
 <20230130174459.GB2001@templeofstupid.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230130174459.GB2001@templeofstupid.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc099da-34e0-415d-8967-08db03671c78
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	90k24KNMGOvWHJnt+vnye8XFHwrcnjr+ICPxI8NOuzPIgqxouZ+52CR6fDwnshMxiy2awhGOlEfqnvw1eLZORQZ0z5RRgAp0Sj7azP0EQFrQtXthtDqceY9y8omPAX9VCNjdVF9Vz18Gv9KpqVI48mWey6IMV+wj0GSHQ5cXmkgglyE8Evgff1uIuBh1J2XzCJ3NRUtR7rJZFwjbVVJ6ON42vCLQQ7oweHqh9sOBBVD6QtUKl0dJQDxBAgha+EngZlkIKVfrkHS2oGo3iXJsf5W+A3xFAl3VSDPfB/KyLxhQnr5bDz+VyFX2LcisxMgSGpKlbTe+bW3aaQ/k06xgwM4mifWlYp0hkB2i4LJRPRaXQeO3vqjfARHVXmkR+LuuR5+KF7jWjxZx9NHrx+sZ5IObNdA3g9T1UZGCUnj0yOhvN01JGrNavPctkSI65WORCKDmKNDfNXWlH/pK2XqkbUJD1LNTKIhgVyRZYdeUWIRlIwSXdkbxpRIUDe81haupWIfsbJvpEiHSR0A49cQbQ/CxxRVaxsbUFjMfE9u3akXV0KsCWp3K0auatQhdqrtHCFQmnWJrHb51b726FKQszjy2s186JJERgnQmFCM5IctJe2tBXrhnjGkuAatjD8UHadpZrTo7T9YG1t/sLzT3292BbNvyj2w76Xwo7G3xs7t2sX48g6+pf1jzRyRb4eFqIORjtWW5Ixl3I464+bXMSpTn6GJJfP3cJXLs6nfTLhn94ByACpxno6aR81JuJbb2gqTuDaZpdSV8EcysKpEg7tPOoUrbw9UfzYfQZpzSiTptbAYDLP8Aj8G/Qm+B0a4u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199018)(31686004)(38100700002)(66946007)(36756003)(2906002)(5660300002)(4744005)(316002)(31696002)(66476007)(41300700001)(6916009)(66556008)(86362001)(8936002)(4326008)(83380400001)(2616005)(26005)(53546011)(54906003)(8676002)(6506007)(6512007)(6486002)(966005)(478600001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzlnUiswblkvdjltaUs4cllvTkhWTktCRVllTHh2NmM5NDVPY0dicW5YWllm?=
 =?utf-8?B?VmFVK1M4KzhTR0RNeFpLNytsR1RsbWUrRHg0Q2NUL3dEU0RTbytGenlQanFl?=
 =?utf-8?B?c1FSdTdTUTM5b01ucklHbWJaVmpPaFZLalZ1bVhYT1VZdlV5dERqZUZHYkth?=
 =?utf-8?B?TGhic2pJa0NDUDhIQ1pLWGtLbjFTYWpQazgrK2V1MWR5c0J0VlpwZGhjVTZk?=
 =?utf-8?B?Q2hkRVRjZXREREFUczc3SU9JS0d4Ni9CRnUwNTl4V0RTRFVYSkRwOHJ3a2tn?=
 =?utf-8?B?cHhGaWhjOERSbzRpQVRFWGVjZThKZllTWmZERGs3ZkVxa0ZlTlhvZ1F3TXRO?=
 =?utf-8?B?UnZYUXQzeFBUOHV3c2g1RCtmc1FBa1dXaWhGYkNrQjBVbm01UjErb3VPRURp?=
 =?utf-8?B?SXVLeTZpZS9NL1RJTjh3d3pHM216YlB6N1F5b1JrbUxPV2xiMmw4TVlBRkNj?=
 =?utf-8?B?bW94bkJudXh4aUs1K1Rxdlh6S3g1cDZzMFJ6N2kvNUI2enRLN25wT1BzSldt?=
 =?utf-8?B?VElKcmhWbU53TEpHaHc3TFBQOUtKeFhkQnJkY0ttVk0xQTFZMDVnRGtrZWRw?=
 =?utf-8?B?WndjRGpvMkp0R1ErdW1LVnQvVU9WQmNTVUJNUWJwN3paMTJ5ZGRoRFkzQXAz?=
 =?utf-8?B?OE1rd0hQTW5SaUp2dnR0RjRWVXBRSXF1MlJPd3FwUEFra3JzZGFRdEE0ZTVR?=
 =?utf-8?B?VFVhUFd0Q3ZCZVNoVGtJN0E0Ukh2OTBpLzZPREU0WHNFbktBc1Q1ZDdiTmZS?=
 =?utf-8?B?N2QxcmZ4Yk0wS1RQcjRldWxTU1laa0prYkhGZ0xHSWg5Ty9WdjNrNnBiK3FR?=
 =?utf-8?B?Vk9ZU0JLODRWenVhWEhmUStjWTgxK3BlT3hiU2JBbzc2d3ZIZlRZSUlzUEJ1?=
 =?utf-8?B?Tm8wNHNCQzVaRWhsZVZZdlJySFR1WllTL1VML1dqa1RVWkd3RkltMXorY1Bk?=
 =?utf-8?B?UGhteHlTcXo1UmlqT3phRVp6NUdJeGhyaHBzK0JhNytpQnM4b25VQmMxYWQw?=
 =?utf-8?B?ZDFTdHFlaW15aHh5UUIvdGtlNTNNU2FBR2NxTDIwSEVwNGhxWU9XekxMRHp4?=
 =?utf-8?B?UG5WUmE0QWZrTVBvLzJJUlFjWFVaWis0UzFIeTQxWFpwblVjSDlLSW8rQWRI?=
 =?utf-8?B?UUlkSWRiN096Qit0SzJMUmswanNENU9xU1g2eURBUjVKcnhseXBqWGZGbVBN?=
 =?utf-8?B?RHdHeGlQYmpNckhjMkJlVzg5R1NYelFoSlV5ODYzQjlvdVg3ODg2MXp0Nmc4?=
 =?utf-8?B?aTdTUU96TzROSHFrckVXenBZWm9NN01nWUJ4cUxwMG53VFUyUGk2aExYNnNj?=
 =?utf-8?B?V29RTkk5MXJ5dE5paVZ2akpxZG4rTWM4Sjd4K1d0RUUrWTJyb3ZZT2tVTjJX?=
 =?utf-8?B?b05aYXQwZEloRXBUM1dqR1J6bHkrQTlRVUZFZjZ3RytPT21pRUpNUjB2Y0Iw?=
 =?utf-8?B?TCtuTG9QMCtiNmMzenNzTlV6NU45V0pVcHNmSWxHUUlGbkdsekQwKy9vVWxo?=
 =?utf-8?B?Y3FYVjNwU3lVYkdiOENueE9XSm5NL2RFdDBNZExQUjhDQWZ0cWEzMm95YXg3?=
 =?utf-8?B?ZksxWENtZytobkdwT05xbDJCZzlBUW1lby9ZZHdGdzNFSTMzZGdTa0NaV2RL?=
 =?utf-8?B?aThIeHVabEZ6L1RvSUJsTXNnRmx4T2Fob1lsTi81dFltbXA3MGt3bkRPVFB1?=
 =?utf-8?B?OHB0cVowM25BU0xpaGU0VXVNdGticVc3ZFBFQ3lhU2RzT3RaSGVOWkY5aEI4?=
 =?utf-8?B?cFdCcHc5NkI2WkNpcURKL2xTaFRmQk5uUHVQZUw5dEZLcFBneS94UWxPdWsv?=
 =?utf-8?B?ZUo5d0swWU1SdU1vcmJxZlRzMXMrTUVIY3IybkJjRyt5MVNBYk1DMXJnc2RO?=
 =?utf-8?B?Q2ZyNVZQUnR3NE15NWdzMjE3QmRxL1JxOVFVd01aaEthUFdrcFdGMWlzL2U5?=
 =?utf-8?B?UzlRYnk5bjZ6RkZ2czhWRnE4clBEU1dUS21FUHBWYkE0Z2QxdGxkaXV4STNq?=
 =?utf-8?B?UzVsZlhYRzBLRDNUblp6SEpVaVVUQmxFVy9nODNxTy9LTTZMT01iSXZ2UDBC?=
 =?utf-8?B?ZmwwL2h4MXRxaVJqZWczek9tL3VSZ24wbmJEUDhYU1ZEcVpNZ0xrR053cTlD?=
 =?utf-8?Q?KXkjLZLzUAd/a375RH8e5oZKb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc099da-34e0-415d-8967-08db03671c78
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 08:42:39.9264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaGKbnYMg9vLZlINRMqu04PP80ueNVx32CTVKwDYw7izJFi5pMmeDEi0DiRl6dA0gdR/QCWFvU1GkQzCps6OtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

On 30.01.2023 18:44, Krister Johansen wrote:
> Cpuid leaf 4 contains information about how the state of the tsc, its
> mode, and some additional information.  A commit that is queued for
> linux would like to use this to determine whether the tsc mode has been
> set to 'no emulation' in order to make some decisions about which
> clocksource is more reliable.
> 
> Expose this information in the public API headers so that they can
> subsequently be imported into linux and used there.
> 
> Link: https://lore.kernel.org/xen-devel/eda8d9f2-3013-1b68-0df8-64d7f13ee35e@suse.com/
> Link: https://lore.kernel.org/xen-devel/0835453d-9617-48d5-b2dc-77a2ac298bad@oracle.com/
> Signed-off-by: Krister Johansen <kjlx@templeofstupid.com>

As said:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

