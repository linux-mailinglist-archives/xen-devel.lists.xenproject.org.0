Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A56411526
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 15:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190874.340692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSIuD-0000Gw-GS; Mon, 20 Sep 2021 13:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190874.340692; Mon, 20 Sep 2021 13:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSIuD-0000Ev-DI; Mon, 20 Sep 2021 13:00:21 +0000
Received: by outflank-mailman (input) for mailman id 190874;
 Mon, 20 Sep 2021 13:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSIuC-0000Ep-4a
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 13:00:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdf356a6-a1e9-4307-907f-b1bb91f20489;
 Mon, 20 Sep 2021 13:00:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-m2DUg56nNtqyRi0Urbb30w-2; Mon, 20 Sep 2021 15:00:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Mon, 20 Sep
 2021 13:00:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 13:00:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:207::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Mon, 20 Sep 2021 13:00:13 +0000
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
X-Inumbo-ID: fdf356a6-a1e9-4307-907f-b1bb91f20489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632142817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/dP2tjFQBapFgCs14B5EAZuDuxp7XkMmschxcMQy5g=;
	b=PE2VaSRiOn6w2yCVUAYdpaLt8XKvHUbHiUSjaccT6VHP1PMWA6466SBtXRHGQrIAGcH1zU
	hbZLxfVv8dBYyHQQDoTH1hDVWRle6BRL6NhNfaua72R+rdzQzDZy2+VCCo6+8Ene5wzW2k
	TVDdHCeyAONrIxeoJ1pV+DNj65QqL9A=
X-MC-Unique: m2DUg56nNtqyRi0Urbb30w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/wjWg50xm8U/3kMWzge3y+3OkMS/lc4spV2lC1zw1yztAiVl0j68iRJT9kkT4mDQ1ffWV0FqicyS1zjXM1fFspzXcdX63RQcobHUH2/UZL2jdpkfR93OnfXaMTgBKmhdpmRYWaMBhS5UcF01+lGJ8Vg1xo2fTNELE2+o2M3P2qN9JCAyMXwSDHOBaWo9TYeDZA6dTLoqExKCDKYpKP5wl+Uavy2SipB+2ndtkcRaSNGjhDptSEls9TBaxUhWDWC2FpFT8DUdPMXB2/6VqCcMQIatnvj/QF+5rwPQEqS405DUf1sHyvH5Jec5R4jaov99AOHlBbTgrc/zvB0kfqLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hm7m1lFQkBWcIUn8FkgnqbFp/XgM4RikeEDzakOZDEw=;
 b=Fzop+7iHlJaUnwsAMZrr47nLOjmeJMHXxPOA7j9nEqKt47evvQtNp6dZI2JaxUh7jOqV/Ct2kaVa6gdDRYF7SgZs7hU/VHf8riEkxLi26+8AuUTmKqY/c5+HwBW1sN/RV/AoH3LSWybbClnRSL64gSfY4TJWMaVNY7SgXdOOH+PRlKkd0HOISBckhg229Se+VD/JVeRv8sJzfIkp/pIHbt51qWxnzgpdGrxocvB6UI52ZIQFgv/8M0ZiIApf4YIr0tlkXdZ0Qpff7ZewQ83npwzT7A3DL71bot9+IcMcmDQAecKy2Dhog5RaiFyM0ELxKeJh11844+UtCNSRiFpycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/6] x86/trace: Reduce stack usage from HVMTRACE_ND()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-5-andrew.cooper3@citrix.com>
 <ef2df9df-df4a-8f8a-3f69-88a027ba66eb@suse.com>
 <e116bff4-9080-1629-221d-f2ba3255d03e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f52efb10-7762-9828-e8c4-ce2d00acdff5@suse.com>
Date: Mon, 20 Sep 2021 15:00:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e116bff4-9080-1629-221d-f2ba3255d03e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM3PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:207::34)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1f2677e-b903-423c-fb81-08d97c369600
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484886022AA98C4F1888E85CB3A09@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hHR74gDvMqrVQ0NIJ7tSt5gKGxy93eFjH75MZHOgv+6qxMyzSKgleOb1gB/8NqfjM9ez0qPB2u3u7wyCl/qDYJG4boZo3kCADeffTJOxIbLUkE+BeSgwbaX5wy5l0bJpxwvAxrdR3RwUEhrL0W4Mzg/EGQIjH8KwzTIRCnDMmDfxmH5UfrzGxBP0rippjIe27vHgNJzvi/e9etMKYxOoX6rcP2JaMF4Q2B4XvVLZX4PgYjnrx2l1YfTF3sgNuqrzZpZqneIBd0e0kaxE5CAFqPjsIPwBltjIsSTPj8PVf/6/v9Pj9UUWhfXsOAJzmS7UbYbPvx9pyVmvVEEL9ONvJkJFojC1YFP6fLjm2T0dBzwy6BSyCduVKcsDyg4xqBZS3IbgRvN0fAHLjWoFBSrjDB2BXy29FmrHAMs8K/aiiEjWC8vJfDc2TTURYglQF5FlkAg/YIoPXYIlMLe3Wpvtdy0bQ4VGvoUdLD8ZmstSqoo+uhizTRFhgRSC4nDyLm7+ycTdpB2whNRWYCBbYxXHhQBKECq320Z7y1AYBPku2jg6A5m2o2jWYe3sQsH6E4cJdjYorg+RUj1FYX4tM8SMs4jkqlNbLBFTYN2jAY0cbWFlGPMUOnLlcK5PNKMGNjAFtuv6mgdVbKUehfkKtdyl8tAcPFmB18DewV4Y5RimpNRuT9GZ1qsfuDdCE+Bg13sM1zrlG8gZrFremNPxRKSFnlZ1GugvXKJJ4UrxL87KNDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(5660300002)(316002)(31696002)(66556008)(38100700002)(54906003)(6486002)(16576012)(6916009)(86362001)(508600001)(53546011)(956004)(8936002)(26005)(186003)(2616005)(66476007)(8676002)(36756003)(4326008)(2906002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VNT7I5U53YX+gI9TXUIWNMfJmqgw2xhp3O02LtNfmt4mhxODrvCPME1pgvzQ?=
 =?us-ascii?Q?t7Vw1RhwaDsBAnc5F9CoGzQDYBKvuJ+BYC0DGnucXuAy3yULMIZ0DKw4poO4?=
 =?us-ascii?Q?ACB+KGjTOunTpxnkSwmnXu9RHz0buan+i64fPenx2SCA3spp6bTRED9DhcND?=
 =?us-ascii?Q?LZ7PDnDxp5OM9elBpb+446fA8jooA/Vi6qLw/9i6BfzCN8UpImPm6TWny0h4?=
 =?us-ascii?Q?RfQe2/8qDM0A2cXX1C/rnJ/ABWXEs3mVGSlLNflKBNL3nPri4NWJU7Mycj2P?=
 =?us-ascii?Q?8HPLB9aFXpgXtX8T9CTKarryC3clX/pHb5xfRg/wNqjqUMjVwc8bhIbeGeGb?=
 =?us-ascii?Q?oOP/Hk1QNKhvIOfJ9icLCXrnGzkounMBFXTQhgimoY/0tOGWHc4Mvo0VVlYM?=
 =?us-ascii?Q?eZWX1j0fU1eefhJn0psSur/V2KvtL4QdqMenlOUmhIw28QOlEoNSMncYZC7H?=
 =?us-ascii?Q?kJW2yYzTyQW92IvrmuxoS5RDZ9xPDnW7IgN+4QfkOV07hkUB3g+D3PrkK9Av?=
 =?us-ascii?Q?zQtwKqHtomWOVVBXUtnTth/w90VVAyIZbAacJTIDuKdEi1jW2RNa0wKL4oNk?=
 =?us-ascii?Q?x2BbOeA3bFvjxet8hPdgi+NpscH4Q35N6cSHoHvf/ELzyC7dE+A83LVbd5X0?=
 =?us-ascii?Q?vNeDkPBqkRGOPJ2bldpdc470/KxhHlERRttUv4l2UGd3Q6vW3gqAlvGsEbrc?=
 =?us-ascii?Q?zIKOPpA5PWN1frzbiUinNBcxggvq7rv4jZsWcbSqqxbxFpgXEzBq2bAAoF9D?=
 =?us-ascii?Q?2e95uRW7xR9LxfuB2G5d2Hd+TMIi/12obI6skB3fBb2+wS13QTLZ/bShCFwA?=
 =?us-ascii?Q?ibDBff1gBM7qeo9g5CeixFjMAeWW1E1gPBl+7Fc995CWC0hzEKX7PcuvElj2?=
 =?us-ascii?Q?tb/e5X5YddjmnzYgm6JLa9yDH7dIyoz1nVxjl0UMlo1PIeImp4C5xDtlrMfr?=
 =?us-ascii?Q?J6c0CIe7srfJiFwGo5JDKhh56UbPsh40vOc3BC7rLw0Nj9r6FoRbqy1IbR4Y?=
 =?us-ascii?Q?P7F2jdBysErGvzhixAZG0DZC5yFFv455YUjWd99bSknpKt089fQCljgkiiGE?=
 =?us-ascii?Q?7lz07nYZz/PGUq3bykosaB4KQlph3l/v9R/3QLY1VOrLzUHRNqtBsbgRKPBc?=
 =?us-ascii?Q?cwSACCS//zqwT2iqakFY1/d6044KkiEhlufaVEEjr3rMJupI2nCjpisCr0Kw?=
 =?us-ascii?Q?+RpqZYDOSfkNvISy7DpRy7wG0ju6/rm6BSkT5pfbMA9Pxb8IyjqQUKK0L6E6?=
 =?us-ascii?Q?ovzBTPxjv7gMZR4lcxwZui/3DQ3RJB85cHOf2LX9HYLrt37bQvSXoZiyG8cZ?=
 =?us-ascii?Q?W52e9RM5FfTZDTkFnc5jZ33a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f2677e-b903-423c-fb81-08d97c369600
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 13:00:13.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hz8JSNBmv5VOwo/8qjDJW2HrrUzcCcy9W0warBG5rjNnCoc09UiuYXdBK+aVG6hkAPbwsHlPMn2LQ1nEhm4AgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 20.09.2021 13:02, Andrew Cooper wrote:
> On 20/09/2021 10:05, Jan Beulich wrote:
>> On 17.09.2021 10:45, Andrew Cooper wrote:
>>> It is pointless to write all 6 entries and only consume the useful subs=
et.
>>> bloat-o-meter shows quite how obscene the overhead is in vmx_vmexit_han=
dler(),
>>> weighing in at 11% of the function arranging unread zeroes on the stack=
, and
>>> 8% for svm_vmexit_handler().
>>>
>>>   add/remove: 0/0 grow/shrink: 0/20 up/down: 0/-1867 (-1867)
>>>   Function                                     old     new   delta
>>>   hvm_msr_write_intercept                     1049    1033     -16
>>>   vmx_enable_intr_window                       238     214     -24
>>>   svm_enable_intr_window                       337     313     -24
>>>   hvmemul_write_xcr                            115      91     -24
>>>   hvmemul_write_cr                             350     326     -24
>>>   hvmemul_read_xcr                             115      91     -24
>>>   hvmemul_read_cr                              146     122     -24
>>>   hvm_mov_to_cr                                438     414     -24
>>>   hvm_mov_from_cr                              253     229     -24
>>>   vmx_intr_assist                             1150    1118     -32
>>>   svm_intr_assist                              459     427     -32
>>>   hvm_rdtsc_intercept                          138     106     -32
>>>   hvm_msr_read_intercept                       898     866     -32
>>>   vmx_vmenter_helper                          1142    1094     -48
>>>   vmx_inject_event                             813     765     -48
>>>   svm_vmenter_helper                           238     190     -48
>>>   hvm_hlt                                      197     146     -51
>>>   svm_inject_event                            1678    1614     -64
>>>   svm_vmexit_handler                          5880    5416    -464
>>>   vmx_vmexit_handler                          7281    6473    -808
>>>   Total: Before=3D3644184, After=3D3642317, chg -0.05%
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Thanks, but this is buggy.=C2=A0 There are direct callers of HVMTRACE_ND(=
)
> which need adjustments too.

Is this really "buggy" and "need" and not merely "incomplete" and
"want"? (Just for my own understanding in terms of what I may have
overlooked.)

Jan


