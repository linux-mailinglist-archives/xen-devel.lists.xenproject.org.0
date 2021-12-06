Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE546A142
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239360.414873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGnB-0005Qv-8J; Mon, 06 Dec 2021 16:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239360.414873; Mon, 06 Dec 2021 16:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGnB-0005Nv-4j; Mon, 06 Dec 2021 16:24:41 +0000
Received: by outflank-mailman (input) for mailman id 239360;
 Mon, 06 Dec 2021 16:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muGnA-0005Np-BB
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:24:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 026ee43c-56b1-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 17:24:39 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-cAKXeXhmNgqWsKsfVs4-AA-1; Mon, 06 Dec 2021 17:24:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 16:24:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 16:24:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0403.eurprd06.prod.outlook.com (2603:10a6:20b:461::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Mon, 6 Dec 2021 16:24:35 +0000
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
X-Inumbo-ID: 026ee43c-56b1-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638807879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EGC4bhYg8Cm8dTR5PZqCzbg4FNGIQQt/WhIZIz7lAA=;
	b=Lmx329QVRxE7oWTXtt8CNCdmB62pdyrRnrcEccWInk52yySfKpYe4BhodCyWOOCgVRgEqS
	T8kaQcqy4pw8EdS1c7qi9FZFh5IozZmdZ8Ni93vl0lGTHnPYxZRQ8ZimfbeDX1E5+Iku/i
	r2900HB91Fd3CVNGwu6RK9b95PLMg+M=
X-MC-Unique: cAKXeXhmNgqWsKsfVs4-AA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnxE+LWTFrVP1zRLLw0bkPsblVNW4Aw69vTKIBzpjV3DZwFFMWW1tCCXqMu8PX4jSxiWVBmBQ2kc9e6XD3ZYn6feSw7ns6n4H7eBafZsQ3PgIVC5s9vHl7ovkLIREB6PyTI/aUud2FuIifVofiTrNHEpnKvkZm90H7xnE+q3+9Y+7CyNHGWaVfX0lkupMhMRWnTxe3gtYyLItR9rWgabud6ndzDP+dyOr8ML1eaxy0R4AdKZT2C2GLs1aHztvaIwu315QoK07H4LhU+aeFoeXpUNt/qL7KjqBr6OFYDAABXNs7nOIE7MZZe4R+Sa670Jm5vyLhjTq83aYbgj/V/Ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EGC4bhYg8Cm8dTR5PZqCzbg4FNGIQQt/WhIZIz7lAA=;
 b=MGl3sfDAuDykz6LwdIqNwEMGOkW7uoxsLt1C9BZwMqsINDO6zdJM90lxnQ/qewXNiVqPdGh0oTzL2rKohgP0RpZIhaObk7Rd7rk2WXblPky6qfoxyj+Zt8406ranubplG+v3XjnjsUNGCidNNOFB3Jm9c6U3FJR3iXb7jfTY3DRqFf67orbckx2eyjQFBR1UDMP5ntGjPiNfJJV63gIEdAA0zkkGFUEC9occyYVimTpi+k9QBIgOz8s9mvKLatntMXIGx/AZQ6SQj+q7VshKk4a89MnvabFc4ypA6Ku/hKWHVdAQRXGcpirrW3RMJwf1IJDSkMvG6Dz5sOFiRr+JjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a708488-efff-114f-0693-c9772b5ff9b2@suse.com>
Date: Mon, 6 Dec 2021 17:24:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
 <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
 <e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
 <53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
 <5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
 <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0403.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d216a99c-0909-4bbd-e6e0-08d9b8d4e4be
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3775118EA1F9FA615DBFBBC9B36D9@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PbATuyrCyMtrdksX/bFvsqpAkU+awR8Z7RWBjxrB+4ayetIsnVkBjRA+C3bA6pXGw44SWTlPXDwW97eng3L8+EM0IA+5rEock6QZcVhiajTBPPqhIFqDdwE0+N10zPfh2O64+eCeYGxUjvPYc6NTxaElzfLn2UGl3Yoqc4Q+pqle2Zu8/vRsEdCrKSZer9BkysIZM8d0W8rAN65mv9Eyc+irwSkOtc8jIRDqmfPGVbcdkxLq6WWFyMTf90gVX2lve/sR78wlSWH+b+byolyvm+H2ZbfYJ5l3nN+s1Y2DjP9VZcebl2GR+UyFqlCMqTEBANQjSpJdpGf53lq9H6kT9qkxKk04CbnaQ6+y4OpO35eE5/gd2cc2Yy6sLiZKfrr0ZulaY51BafroXqDBjXsJ2kynmMoconWqYruYk8pDIfYppyyNEjWfUMaAzJDguCE15ClE1G7Ln9g1aUgHUI0FiGnLDJkOGNwMGER1k3lLcThuh1I104YP/7EJE5sM6UiMZHf8wmL8QQtfr2H1OG7XCFiCRlkcUgVHMyH8Zudt50/iIdmqFbXNEEvbIP09A/a9eCe+xVOJ4iNeNOSLdP8+iWKJGypGHnRd4jow0rdndHqGK94qlITPlwt/4Ieto/HE/J9GpEM5v7jcGJ9CtnQ8rSq8By63nJX13ag9Sd4hXhrV3ZazjSBXjyghRYnQj644ybtxRfbu5+886lKDycHzQMJrsM9DAb4Qa9OPX13GMYAFA0srGKJDGpWwGRVXUyvu87Cn8Sn7iZc0Yzw4ApJG7XaaNauRZzb8HNmNIgqOva+FeLKxSjSNmP5YiCTyGUxRvTpWaDtxnOXa6QpO/njgTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(956004)(31686004)(8936002)(186003)(6486002)(36756003)(8676002)(2616005)(5660300002)(508600001)(83380400001)(38100700002)(6916009)(53546011)(966005)(54906003)(66476007)(2906002)(66946007)(16576012)(86362001)(66556008)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YytCbFF0MU50czQ3YnB3czNSUXVNUHRlTUJSOFNRRHJjK0NkNGlSNDJBRFhN?=
 =?utf-8?B?SUJxV0YvakhJUnNibnVWYWs1ajFGMDJ2Tm1uUGg5YlV4NUZkVVlqWW9ZM0Mz?=
 =?utf-8?B?TmtzSzA1UHlybHdzV21OOXJnc21FVWNJRG5RVUpFS25IbitnOHJZTTJ5M0Ja?=
 =?utf-8?B?TEowQStsbXBnUFRPTy85SWpNZHV3VGxjYUhIVjFuemtadmo5aGFDMjB1R212?=
 =?utf-8?B?c0RjcHovRjUvTE1LcG4ySnZMNGltMFlubHlUL3AvNjVFbWZ0SlBGMUVRNUlC?=
 =?utf-8?B?aUk1UlpoRkE1OVRDdFpZVW15d2dEYjQ2MjZnL3VjRWtqWFlncFJPSlA4SGhn?=
 =?utf-8?B?Zm5xc1I0MEZKM2lwQ1p1TUFRYm5YMHRScmRVbS9NNGxhdlpRUTNUOVRWeUN4?=
 =?utf-8?B?ZmUyS0lUQ1dYSFYvbXRjMTdiaHhkRkQrcm5OYkFxbHhnaGFYL1FidzVFZW1W?=
 =?utf-8?B?eHpDcDRlbEFDSTFZMDhzUEptL01DU3ZJTHRYU1dQNXRCSXJaeWtZQlpGOEVs?=
 =?utf-8?B?RVdyRGhUaklEamtGczJucDRySzlGTmlRVThub2FUYjJlbWpZRkRTeWRrT0Rs?=
 =?utf-8?B?M0JETW1kTzYxQXZGbzNkUkxNRXcvN0Nnb25mTnNGZmhkWTNma3VsTUt1SGVx?=
 =?utf-8?B?TGtZZkxJY2h6TmdqRmxvc2plL2REYklLS3ZMWU9iYmdKOWlxdjlkakt4RGM0?=
 =?utf-8?B?ek9YOC9RdTV3WHhlbk9kdUFHRnN0YWN3cEFldGpTSi9MRnlLNEZhTEFka3I1?=
 =?utf-8?B?ZTBiTSthRUhXNkl0dTg0TUcrMnJZMklIS2JGRXhjYTBwZGFvWWYybXhnL1Vk?=
 =?utf-8?B?eVN3YnNTWUZSZHZxOGMyZlRQRCtab1FnMDlKQW9saXlrR1VDNHJ5OWhVOUpp?=
 =?utf-8?B?RW8vMHVHQWw4VjRXUWRKK1JDMTJYUzc0eTMvZlYwVHBPZUE0RXNLVVhwYmxR?=
 =?utf-8?B?RmMvSmZGWWx2QkVPalVUYWFxQVlIQTlrbHpwNlVlY0VZWjE3ZUgwWnVDYzdH?=
 =?utf-8?B?UjhtL0ZSc2k3VHVhQ3JyelgzK2JxdGovbTVZZFRCdW9IaC9MQTEvdklWaFVX?=
 =?utf-8?B?QTVVWHY3amE3R3p3U1RIT05iMnp0aFRRa0xrZUx1NkJkU1pWcGl4aFhxd1Bz?=
 =?utf-8?B?NTByQmlHQXJMcUpmekRkVFZzcks5VTZjeUVWRmh0aHR5UzJWQVd4Tk1vOUI1?=
 =?utf-8?B?M0k3ZUswNjRXVVZvYzc4ZGdwbDgwZ1dHRk01Ny9xZjZLK2ovRnQrQjNkbEhZ?=
 =?utf-8?B?Tlp1b1NBMXhiOVNnQWZRL2x6QjBGMWVsVnF3RnowQW5UcEZ5STcvZS8vNThm?=
 =?utf-8?B?SXdLQ2ZjRFdUVjRaZVdWaHR6R2ZFMlJBSG5sUWxRNkFObUxNWU9SSURGVUpO?=
 =?utf-8?B?T28ydzBoNzUxcXY0MU04Q2RobTJ2bnBuQlk0SllTdnFyTmFqUDgxVHQ1ZWlG?=
 =?utf-8?B?WXdMeTFVVzRwd2FscHpBOHpwS2Q5S0ZqZ1Z6YnA5bWl4akpMR1d0THdpYVVX?=
 =?utf-8?B?anNiSFVIRHFkbTZQb2JaYTNSeTBNdWlZWVVtZlN1UmVDaUlteFBpeVh0QzVx?=
 =?utf-8?B?UGlzblpVSXdHWk94M2NieDNncS9XbFN6T1NrcmVMVSttOWwrN0ZvTElHOEd0?=
 =?utf-8?B?a2owSDRYTVpQR0oxbmRMdytHMTJOUjczNEE4QzVVZnZtNFVsd0V4T0tzZFFW?=
 =?utf-8?B?ZU5TSllRVVRKc09ZTUpnaERkN2k1bUJxRXhHd3FEckRXZnpoNGIvVVpyc0RR?=
 =?utf-8?B?TDdFWDdKdTAvb0haMmluVGlqckJXNGNldWdMYm9Ta3I1UFFCQ3ExdWZBd2g1?=
 =?utf-8?B?Q213N1hnWUt2SEhxWjBMaEZKb29iek9vVGdXV2MvRlUzbWpwTlVreGVHYjRZ?=
 =?utf-8?B?Q0p3UC9hMFMzMVJ3Qzhxa0ZkZEcxYXhJcElqU3M2SEN6eW9nUDdPSndmcVlU?=
 =?utf-8?B?Yy93OEpsRU5VMENjVlpNSy9OdVNkTFhwRC9JYTVaemMvTC94eTFCZHQzQmRG?=
 =?utf-8?B?S1dmemJPS2t2Vm5rS0pmRWYzbk9kOTZHc0cxek0xZEUxNENFVHZwT2EyaDMv?=
 =?utf-8?B?aVIrMXlvczVOZ0Z0NmJFM3hSNXZJVGM3NHBHaFRqODAvV0RYWFNYY1RxLzU0?=
 =?utf-8?B?R3o0TnV1cUlGSzZMdUc3STUrNU4rZmtoK1puL2pOMzhRdWdidzdacTdaUGNn?=
 =?utf-8?Q?r5ert6OnSYpucHTplMnhcss=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d216a99c-0909-4bbd-e6e0-08d9b8d4e4be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:24:36.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGfThXlIkic8RqfDwIHBxn2RD3oiTWYinK1zzwhukvSS81QK/F7G6zyc0FJFu2Koln/6cCZCvQQTFj5ee1VDlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

On 06.12.2021 17:21, Julien Grall wrote:
> On 06/12/2021 16:12, Jan Beulich wrote:
>> On 06.12.2021 17:06, Julien Grall wrote:
>>> On 06/12/2021 15:06, Jan Beulich wrote:
>>>> On 06.12.2021 15:28, Julien Grall wrote:
>>>>> I am not going to ack it but I am also not going to Nack it if another
>>>>> maintainer agrees with your approach.
>>>>
>>>> FTAOD I'll be giving it a week or so, but unless I get an outright NAK,
>>>> I'm now in a position to put this in with Luca's R-b.
>>>
>>>   From the check-in policy section in MAINTAINERS:
>>>
>>> 4. There must be no "open" objections.
>>>
>>> So I think this cannot be check-in given two maintainers disagree on the
>>> approach. That said, as I wrote earlier my condition for not Nacking is
>>> another maintainer agree with your approach.
>>
>> Hmm, I did address both your and Ian's concerns in v2, admittedly by only
>> going as far as minimally necessary. I therefore wouldn't call this an
>> "open objection".
> 
> I believe my objection is still open. I still have have no way to verify 
> what you did is correct.
> 
> For instance, the tags in patch #2 are:
> 
> Link: http://lkml.kernel.org/r/20191104185107.3b6330df@tukaani.org
> Reported-by: Yu Sun <yusun2@cisco.com>
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> Acked-by: Daniel Walker <danielwa@cisco.com>
> [Linux commit: 8e20ba2e53fc6198cbfbcc700e9f884157052a8d]
> 
> The tags in the Linux commit are:
> 
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> Reported-by: Yu Sun <yusun2@cisco.com>
> Acked-by: Daniel Walker <danielwa@cisco.com>
> Cc: "Yixia Si (yisi)" <yisi@cisco.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> 
> * The first two matches the original e-mails
> * I couldn't find the 3rd on the ML.
> * The Cc could be ignored
> * The signed-off-by are I guess what you call "mechanical"

Am I understanding right that now you're complaining about me
having retained one tag too many? So far all discussion was about
too few tags.

Jan


