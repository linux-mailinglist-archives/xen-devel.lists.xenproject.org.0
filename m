Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A6F41EEA2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 15:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200619.355158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWIdu-0001Kx-81; Fri, 01 Oct 2021 13:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200619.355158; Fri, 01 Oct 2021 13:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWIdu-0001J8-44; Fri, 01 Oct 2021 13:32:02 +0000
Received: by outflank-mailman (input) for mailman id 200619;
 Fri, 01 Oct 2021 13:32:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWIds-0001J2-65
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 13:32:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f33d6df4-22bb-11ec-bda9-12813bfff9fa;
 Fri, 01 Oct 2021 13:31:58 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-eEybLmrtNRSCgdrLTXQ-xw-1; Fri, 01 Oct 2021 15:31:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 1 Oct
 2021 13:31:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 13:31:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0266.eurprd06.prod.outlook.com (2603:10a6:20b:45f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Fri, 1 Oct 2021 13:31:54 +0000
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
X-Inumbo-ID: f33d6df4-22bb-11ec-bda9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633095117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YhsLwXJe7nzHQDzW8lEmGU2YmeM3dFTlymztpAfcM+A=;
	b=nMrUwo3mHTCdWsQPU1dx6O3LtCv9JNlimyUfFWWfdzseYnzXS1UV9vuH3cKLnRYvcPKF0i
	isqON15Blnh10v5PsvCt2m25AWfMbY09APj+peHeZ9FrQYsE+oh6gBznl3ndSOHeh4B/DL
	VjkOYv8CNr7ZOd5PsGCKQm1LS/Jujbo=
X-MC-Unique: eEybLmrtNRSCgdrLTXQ-xw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6jkLYBS0B+81meqnqsJN8Eyoek7Fcu2Ve4gXec2sY8GwKg4jlDwQcoQTiZcty0gzJPEewiPvyjlorJAxHk3jkIF4wT+tUh4wl4vjUT7Ot/juL9DPZIJF14b9yafaU6ePIyyFQaxcCu5kw1oBJ7LExK338RccngqvQJQXMoKI+qfw57FXla16oPhbvC2eALqjs4Yj5wvQKNQSg2lglezN9FzbxLepopbFL1VHk+geT/Y++fBoHrEYdouPKMlkI+APdRgawz123wyQXmRfB2YXo0K1a24Cet7WeHWKTMLwAylOtHn4qwl64npeuqgLAlJzzx74cQ7DQv+T1+4UMpk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhsLwXJe7nzHQDzW8lEmGU2YmeM3dFTlymztpAfcM+A=;
 b=kLfhVSpNJ6RhDEHGtkw3BmjO2ORHDoSJXtEmGDdqRk0ESxmCLVBln37CXSinHwQndt06bj0fwfJJfmvAh9VEMAy1NCCNu8v553F74NUt9m8y3TCHEeBq10u7kIB+CmtvPvri7Rl4tDNn0j8ZvoeOTeOww2zYWxax8ajGlGDWC2EkrN90Hqrf6d4BKhsf7WGvvUmsWKICYtYmA3ZTzCyg6nIvhRpPuYdIecgbtQncyljd9CnTro9aLIhqK6JlGDC9HhAvI3BaWN9EvzMAdCEFgjf7NG9bCoxEpM9+z6ohIrQMf8IxVgNG2hr8NXPB6kTmDWOJH9eYsFiOVt2U1oCjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 05/11] vpci/header: Implement guest BAR register
 handlers
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-6-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0a965b2-321d-31c7-4d6c-2a010ba52112@suse.com>
Date: Fri, 1 Oct 2021 15:31:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930075223.860329-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0266.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d36d07-70f9-48f9-2987-08d984dfd5ba
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5471F1F5DF43A7BE4F2C34FAB3AB9@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mvR/+99kdnx9oIaVNpgoIXon+qtArW3Cvzf1d+orea96FziJjWDZHHb/ezjQn2Pa5U2E1wfOYS6O1NDUkUCBzlbs2oeuu3gmYlyteNApDHdwgsWyAmrJ9xo0rOdaZzpHNs5bLHZQIfpGrt2wv1W/7JY4/MSdnX4n06KmhWFBDJnY4zKIFJ1Om9jSz/QJgXtRPNW3xDtM4uQ3o1wC+9bJvJWCI14w43i7p9hY0HZg64kcZU1fbla4ITuGfedpGSfduMeglgnJbqtqJXwkrnsmSEgXwN42EOoLGA88effULL2e+6yIb5zygy0MyWCaxNHtkISQk3mxu5O96XKKuQJ/dDPKDB7/Ay67RvlLX5lGpFYW4jNkgWFTPkNqAdyycv47/gVnHq9gOli1q2ryeenngYf+cFYgz0q4ijMEqXLK1eFbypT+JesTclCN75cIGaYN+777sNOM0RPTz4DbfKKSa7gax6HDjv73nf7Q+LG7DidSChqtC1SNtYI2J+bqZRnP6CH1f1LtuBezE6WCPnE/8ajsFLigaYzt9BLT6OFZDyPRqS997Y08Yf+OKfWdOuEJXsQ++uNYUjtl8pSszfqYXGccGygDw6m0HiZwvar71/8ycsCzAtkpf0qdYl84TcE+Ptfra5pxD+DzJo3k7R9PnrAAK9wXfvGS6Inv65RYmC7lh9GfNSH0s+HBrREg7YPNFyYi98U9g0QsDhQKUaZ5gzzqpxghXBgTE6IzJwOhiwHFdtlsVNBh8tHY2yeZPg0Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(2616005)(508600001)(16576012)(38100700002)(5660300002)(316002)(956004)(54906003)(86362001)(36756003)(4744005)(6486002)(4326008)(31696002)(8676002)(2906002)(8936002)(7416002)(66476007)(66556008)(66946007)(6916009)(31686004)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHR0UG40NTlXN3k2NEt2Tk1oSXd6WUZSRXhXS2wzUlZjUExHQ1pZOE5OQkI3?=
 =?utf-8?B?VFdYUlMyaEE5cmJRUEFyQ24yTnh5QnFQaUNLbk5oa3M4TzFyRUVlQWNSTWJk?=
 =?utf-8?B?ai9hai9aaE1sRmlRcTJacnZpdUF1anNMNEp1RXVYK2ZUVWJBTVA1SEpNVE5k?=
 =?utf-8?B?TnRjUnlHNnlxUno0blVNTmtHb1dIQVdSTDlhaS9vUjE4UlM4b3hObTRMVUZC?=
 =?utf-8?B?NVBzNWdtNEVIU1h2Z014eXZXeGtveHdMN2kySUVxVlVKa3c1c05nb2w0M1lM?=
 =?utf-8?B?aHJ6bm1iOVpMTlBOOGNUTEhoY1dYV3A4OGVuUkVPbEN0YWFWTzgwSlplUTVu?=
 =?utf-8?B?b3ZwU0o2SzFibFh5T3EvNithWkpSUTJWMUJaUEYya1FuWEVhWFVQUjlteEc0?=
 =?utf-8?B?ZG9pYWx4dDNBWmUwSkM1YmhMbmpSUFQxdUdiM3VUUDhLWCtoQ3Vab2lWRkNR?=
 =?utf-8?B?K2RUQzhnaGxPM0MxcWVWdGUxdTZIdzNoTUovY0FyTmZWNzRHVUZud2xsc2o5?=
 =?utf-8?B?aGptZlhWWUZRM2YwbmpyWmRJV05ocDBSdDhWT0V1VEZPSlVmemtOOGkwMEdE?=
 =?utf-8?B?NUZ6RmRuYk5ZRzVvcnFWL1NidG0vSVJ2M1ZPT2pNbWxpd29mVSswdVJmajd6?=
 =?utf-8?B?UWdnQzZhN1pwT3NGVktualY3ay9VTk5ObGVhbU9CMk1vb2VEU2dMbk5UWlJo?=
 =?utf-8?B?ZzFLRTVQSU94WElleFNCd3kxa2pkMEtOWEhqVjFyZmlwNDFIRUgxdXFway9C?=
 =?utf-8?B?ck1HSFBLYkhvQk9ydXlYbXhuL0U4cGQ1YXNSZS9DUEtKVjNwQXFhVTdNb3p6?=
 =?utf-8?B?Vzc5Nm43a2wrUGFVVU9jQjF0TTdmeEVrZG54dFZYUWUwRkJFS2FKYmFkNHRj?=
 =?utf-8?B?RG9ZcXM3TXdsbDRHUy9hQXB3c2wyVVdjQXRKOXVheXcvTTRCQVJNRnZqekdK?=
 =?utf-8?B?K1Q5NmhFakJYMmZKL1dIcTJiMTFZVHY4NkE2alBLT3VGTm9QTitDQi95WjA3?=
 =?utf-8?B?V3VERllJZDFQVTJsSXU2SXhxYWdKTExjZEU0NFlhb1p5QnZWRVlIUTR6c01R?=
 =?utf-8?B?T1VFRWtTUFJ1S2FIMTQrSFNWMGZjdlIvbkdNK1IwQlVXaWN5ZTBwcmY2WXpL?=
 =?utf-8?B?eFJDOFlqZUljMnRLWFNUeERTQzZycmQxOG5ZelhOYkVaQkJEK0cvVmRKNkVX?=
 =?utf-8?B?L1dscTd4SU1WVVBuRmViTllZY0dYSXlPQkEydHRyS0h6dVIvS25ZTEpsaFhX?=
 =?utf-8?B?V1IrRXJ5ZEJVdWoyK0VzQm1ON2dWaXNYcndocGJ6Rm5vLzZYN2dGYTNsSWdB?=
 =?utf-8?B?ZGVmb241dkc2Wm1WTkttbWtrMUJDeW5NT1JqUjJidGJiR1NuS2xNNUVNUU95?=
 =?utf-8?B?ajIwejFKUmJVbnNNU0ZOMTBDWTY1U0pkbUZDWlVXL2tORXozMEhaZTNEdWcz?=
 =?utf-8?B?eGRRZ0kwQlhRZVlZMEpEOGpRTU4rS1V3dWgzOVV5VnZmNnFmVTVxRHlOUHJU?=
 =?utf-8?B?UHpIRWJkMG5MRlZON01wWVNLRVF5bm1ORldPYjZiQTRlYmgyMXl4SjlpbFBE?=
 =?utf-8?B?NUExYnNibVd5eTU1T3ZSQ25zaUN6cWNPbDB6azQ2R2pPRmpLWWRtQ0VhNVFx?=
 =?utf-8?B?V3pzaHFXU2h4Y1VkRjlLWkZQYzZmY3JYZ0Nabm9zcEFsNE9zS2wrQXVGeXB0?=
 =?utf-8?B?bkpEazVSanBxWldwUUphaTk4Y0ZQVndmUXB0VzZ5SnNid2JEbVl1bWdsRVFI?=
 =?utf-8?Q?NIV5F8fZ1b628Vn25/3kpR+3xUiBZhtZGmY4V4U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d36d07-70f9-48f9-2987-08d984dfd5ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 13:31:54.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccDzjdfIKaSOGtk/aNUtm4pGrHqhsXQd3TV7IkTP6c9MTWebMY5ycZt3mrf5ZYKBJqY6N0xcGQau9GVMQXpmPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> ROM BAR is only handled for the hardware domain and for guest domains
> there is a stub: at the moment PCI expansion ROM is x86 only, so it
> might not be used by other architectures without emulating x86. Other
> use-cases may include using that expansion ROM before Xen boots, hence
> no emulation is needed in Xen itself. Or when a guest wants to use the
> ROM code which seems to be rare.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


