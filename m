Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC633A9CD2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143244.264061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltW4h-00062x-HH; Wed, 16 Jun 2021 13:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143244.264061; Wed, 16 Jun 2021 13:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltW4h-00060I-Di; Wed, 16 Jun 2021 13:59:23 +0000
Received: by outflank-mailman (input) for mailman id 143244;
 Wed, 16 Jun 2021 13:59:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltW4g-00060B-BL
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 13:59:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b34d71d-1c3f-428f-a4c3-1dde60135ef6;
 Wed, 16 Jun 2021 13:59:21 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-kNc61U6fMT2YWwDBVlcP0w-2; Wed, 16 Jun 2021 15:59:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 16 Jun
 2021 13:59:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 13:59:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0153.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 16 Jun 2021 13:59:15 +0000
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
X-Inumbo-ID: 8b34d71d-1c3f-428f-a4c3-1dde60135ef6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623851960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XUfjheHrqtrxHC7G41jU7BZSbA3Dgop0b7LfYa4UFUY=;
	b=gP/nOj/PrbQc1IfyvVcumJsFNNsZElrusGkrBA81x1f4Y/vH7l7vXrLHvnW3TrMgAUOdeT
	zvuS9tXIk+2OuKv0KXe1O2oUswDypSVS/9Q7h9YDjPekFMgFxuuu2wGGrs0+Gz50cHAKGn
	Iw2SYYtfqXs1kPygDCQuDiHuES1DIJw=
X-MC-Unique: kNc61U6fMT2YWwDBVlcP0w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2aMciyO58vpLw/AhOczfLoXNDHRDqe8y6+S2jeB/1QNLq5azpipVAA9ARcFsh2hsMlxDLnV0XtcIiphrjTx0kVkW7StnZhITpJUgdSuiXweVpBT3d2NJieJqITael4dOEuqir/Lu584zjvvhRlHChd1yZrbx/nmKup5mKQnw6MZAMEyRJRjhHiTqnlBjDIt33XLGiE6dJG39gMdrfHZXLQPZlhFLxbnEU7Wp8WaHMhxb0RSlP9Pqt/l3CxXiIxwEC1cGZk6YFfpcsoFAmFeciCrNV10JNZmXiu2OkjolE1W2SLh7WU8pYwjsDSz7O12ZTMl1SgOozyz9wx+vf3CPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJuPjcrNXkrHMc34KKYfciYUx2XknK5hLSr7ZRq4h4Y=;
 b=GZV69zm4jwMIA3bJ/B/BDrK1+M0OYqao4R6gJnKWCaYMKsCRwuzlmDV37jmVh+/MhXlzlfxJouclbqNNWq5NWfrmIdGEp623wp0yPwIqymrIgGJzoXtjOCN+jrbTnG7gVvlA2o+/bgwyJUUkk3u88JOcbgN5t1/uKZ4J1R8606ZY/lbiRVc71KdRh7Q9Og/Gq659n+XJXAKdiEQT0dPK467zM2h58GRGu+Xxn7uD6vsdqvSnp2Yzl/nSgMl9gyJuPgIMbhihB3gWVDgVrjcJ+XDAziF+dhdUw/iStXVS/bYM1lQatAZ7Xv6PUPGdWKBfBobdqz1dUYXVlQIbh7ELhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/5] tools/tests: Drop run runes
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <20210615161905.9831-3-andrew.cooper3@citrix.com>
 <c59dae19-2a88-9449-468a-ab22d38fd0e7@suse.com>
 <4a57467a-36ea-bd5b-7e6a-ed0dfaa33314@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8fbb2de3-b2be-e767-346b-29df378eb8a3@suse.com>
Date: Wed, 16 Jun 2021 15:59:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <4a57467a-36ea-bd5b-7e6a-ed0dfaa33314@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0153.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6ff09d4-ac48-4788-9f98-08d930ceed7b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB377688BDE7D1F53233D84E66B30F9@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HJmTPPii+iKdYhnqpGoM51itKbrJuxSOZCt9VoyKj1xZSYVnGGep25Nn/gZC8OrPNoX9kKsmCCgHpxmopLoPyh+W3DnE6miR87dXdrXqk/W81djIEh/xEnj89jdn3PnsqicjKNkH4T02/o3ekEvNwh6lFO1/cRWOxyEshZqMZaIZ0rlD+JTUapTdCC4YffNAmbjVlgWP2cxIaFnOjyaXHxCdVGfPkEdROuZlpNWHY1by7YhxZejXSD0PkUcSHQR71Zln9gbUreL83WspCoiKcbSJn+MHCh7dRCQR4R6ZnglX0VR22vFV58QrklF/39EbtnIw3duo1Ck8cMzlsSZU5XZDXgnDVaZPQxYfQlxRMldg2EbFPCQcO+Cxo5TlOg8YZgcerhQmKvjFM+6g01ROjXlAweJXVC2mmPgCWeufoV552FqY74YCqL98JXHKicXkvEj9dvSfq7HEkwjloXb2RDHY1tMygRfRJw7r7n+umeCbWYpbFIe++3V+Byrxxk15A58iHW/9U+30I3CZXTsDP8/RFERN6irAdELhLf6jzeZu6I1JVVWLyNRM3N07szVpmIdy5XPc24EEEYXSG9bHUzjHBej7+WKXiJXTcav60FvkCyFZgKKwdI65XGNj+qCtQCRb5Kw85yZTN4ovvA/Pu4gmDQXsHDI/Pj44/Q4pGZvKmpBHZzJzTP19hiwuWf2m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(39860400002)(396003)(376002)(36756003)(8676002)(5660300002)(26005)(478600001)(186003)(16526019)(2616005)(956004)(6916009)(2906002)(86362001)(53546011)(54906003)(66946007)(8936002)(66556008)(4326008)(66476007)(316002)(31686004)(16576012)(6486002)(38100700002)(83380400001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3xvAytkzO8MaRlMZn2/T8O5asiGm0t/7JhrzNYiqeeFiMuwsI1argwIs9pLS?=
 =?us-ascii?Q?hOZUNsgXPVJVrRonL4FrATrtRVaURhLz10oPXS64wlpxg0Yt8HIc7hpj2kcL?=
 =?us-ascii?Q?9vG8Jh3rfFcrWdDxwqNXTvnvpPZVgUw30Dmb83MsCjS7A79pyHwkUCWCgrU8?=
 =?us-ascii?Q?zJYTYpG8RKwy7zrJnEDNSEscmj1lQqP4zFfQn5JtSy+X//qPp3K2VivAwIJT?=
 =?us-ascii?Q?daSQeBx4+Xl4Hd2szQorOoX1ZKFjbymETt8RXkNSUmBHr2FTilb+ehHcUK1n?=
 =?us-ascii?Q?dAaMgVUkQ9FhZlk0TdyoIfNJiO1B/nPBmplJOUnlydZKQkeCcG7Em9cb7jFH?=
 =?us-ascii?Q?GJxGYNU0BoeedTeTwWOkkqfsqHUc6aN7sNEZ0lbuaa4l6PlF7Gm1cBGsb848?=
 =?us-ascii?Q?V7BrRG4ozkUojcxvq2FILwKl9RnBYbyRre+i2xKSjQ2FO9RtZ9E+7wy0TKsv?=
 =?us-ascii?Q?R1X+x9xB62EP5cZosMbPMzcHT2c8ns23uK3WAMVWJpMwixiKEPaTOfEp19MF?=
 =?us-ascii?Q?k/pphPwTLwNLu/LR3exfiUxrmGaLYnDmwJVSQilsi/nqppXMXOZbdPdtL8R7?=
 =?us-ascii?Q?q2BbkNGy7aJ+DPe+qNs4phgDMWB828ieBPm0VqTkLpDT8AiY+BnDmPpbV3Sn?=
 =?us-ascii?Q?w08vu6WANe4deFVd2pkNLMcc6C04QlZou105QnnURwIYXEA+ANN9F6bh+YUv?=
 =?us-ascii?Q?ohHeQmOBsdnQIJlDUqnQXz5COh4M93rUgMmf4VPlQbUWvcmuSW23Y3VHiD5R?=
 =?us-ascii?Q?Z3IO7jBxzpkxnTcXya23C5Mft75/L7+nHElwb7LMhqKYHYZsbvb2mrSoG4E7?=
 =?us-ascii?Q?bB3SPRmFcwZt7gqs1A/f2KnUzHyLd2QfT6ntjOqvYXnm1C5yEA0nu4D2e2k9?=
 =?us-ascii?Q?s0reXFfz9PrUySo1W2jemw46zMIDdqElhG/YYE4xksnaDE+/uCw+p2tLuuZN?=
 =?us-ascii?Q?K2UTFkARRz8qTMGv8JLfwD7KQSr5rrOy5QdFsmtMCP0t2rTUKm7c0athBKUc?=
 =?us-ascii?Q?Ni5GEDHuG215A1shtycZl1kDWeuU28o7jMkWT0040aYN2ZlDFfpnSyAgwOKq?=
 =?us-ascii?Q?gHJJ+RIQTSBMgXknFEG/rMrdqw5E5eYj7qTSrP8kJvQdEWGhFkn8y8LyoM+m?=
 =?us-ascii?Q?x9qr4O9lop3nBy9pz1F4xFZxaKLEOma2F3q+YlJr2tWF4AntWOm36byRy+DF?=
 =?us-ascii?Q?w6cyEnL9CZz3UMYibFRrlPcOCuuzZGm00dxD3NOCxqRAHWjMxXQxTVEyZlKw?=
 =?us-ascii?Q?0TG3R06Ls0ByB7IRFDPgxCIh70MYBTHOlLKke2yey1655jBsnE0iAuCdM0in?=
 =?us-ascii?Q?c1wvJaxyB9WYvKyLlORuoRfE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ff09d4-ac48-4788-9f98-08d930ceed7b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 13:59:15.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc4TAJJXcdNesg4N70AIfAXBU7n2OWz7Q1mCrS1Jr+yJry9HcfQakoLRRmzptvYNgAaaX22jWG/yhTgoNmc/vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 16.06.2021 15:08, Andrew Cooper wrote:
> On 16/06/2021 07:44, Jan Beulich wrote:
>> On 15.06.2021 18:19, Andrew Cooper wrote:
>>> --- a/tools/tests/x86_emulator/Makefile
>>> +++ b/tools/tests/x86_emulator/Makefile
>>> @@ -7,10 +7,6 @@ TARGET :=3D test_x86_emulator
>>>  .PHONY: all
>>>  all:
>>> =20
>>> -.PHONY: run
>>> -run: $(TARGET)
>>> -	./$(TARGET)
>>> -
>>>  # Add libx86 to the build
>>>  vpath %.c $(XEN_ROOT)/xen/lib/x86
>>> =20
>> This is not only incomplete, but actively (specifically here for my
>> own frequent using of it, but other tests I do run occasionally as
>> well, and then also that same way) harming things as long as you
>> don't introduce an alternative way. Note the top-level Makefile
>> making use of these rules, and note also the run32 companion here.
>=20
> Honestly, this makefile is borderline impossible to follow.=C2=A0 I faile=
d to
> make the install runes work, which is part of why I deferred the
> unit-like tests for now.

Well, yes, it's not pretty, but I lack ideas for a clear improvement.

> But I'm taking this as a strong preference to keep the run target?

Yes, and not just here. Any test that can be run directly in the build
tree would imo better have such a target, so re-building and running
it can be invoked with a single make invocation. Having to re-build
the entire tools/ in order to then (re-)run one of these tests is, in
particular, way too much latency.

Jan


