Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67884045EF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 09:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182697.330421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOE8L-0004jF-0V; Thu, 09 Sep 2021 07:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182697.330421; Thu, 09 Sep 2021 07:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOE8K-0004gc-Sv; Thu, 09 Sep 2021 07:06:04 +0000
Received: by outflank-mailman (input) for mailman id 182697;
 Thu, 09 Sep 2021 07:06:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOE8J-0004gW-KR
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 07:06:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6439aa04-113c-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 07:06:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-73G9n_BsPaC1GMD3wqt7PQ-1; Thu, 09 Sep 2021 09:06:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 07:05:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 07:05:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 07:05:58 +0000
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
X-Inumbo-ID: 6439aa04-113c-11ec-b1a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631171161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcipelzzzmJgRBZUJpaz+bt87OOxbuC/mcjaojGC0uA=;
	b=U7YJ/CeFK4dsHOzMApr04d/sekIm9u/n61xgvsrt0n+zMNfNf3aE48W60JEZ+sPuY5cHWe
	SfxtDCG1apiWdSqBGkRmzUm0iZ3wOXIUAhmlk2WZ5JBgp7FyDo5SJSosGPB1x8vvmnSutM
	qAx0m5A+KQBfus4p89MmCaOLIIeinNg=
X-MC-Unique: 73G9n_BsPaC1GMD3wqt7PQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWca3Siq9mE4YcuD2+MIpVyNpKtSZdzgdYBE+3vdqfTKCG21fZiqPcKCn4j2xj7qvhJMsTY7vIrUgWtfZQ9Sh02VBmaXDEGFnI2FFJOm3twcBvU1ilbpl+wqnq9u4TJh514vUuSpD2suMUHkvzFfwS0e0KA4Lb9vic4w91wicEvMJEQ4ciG5nU9KJcpyZzSqMwRhpKrJYz3qmJ6h4HopOC5vcnKLMBCheE4WSHYC2PoYe/j1nrkWAMwX+3ImpKtrDjY72/NdJhy8YnKUfbvbM477uFEKNfzuyas121fWm4YhDPVR4Yjlly996GfwFLvtopcvl1/M2+U6pVQ4QZaDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fcipelzzzmJgRBZUJpaz+bt87OOxbuC/mcjaojGC0uA=;
 b=BYw/NtoQH1Bi4gtLlVsvnVqClUvgbXPzWOewExEhr4pT6t9Nhb/VhcFBXpKbK9B+rchbn4lYKyn4pyao4sg4WHsg/ynikpna+2Ga6Hi8pdBqTxK2dVKc+Mg3G4hGQ7jPNDv0LqzPDcT/jowKtC+OsevPNIWF5P/c1NlcGf9k/iuDJOI7F+t/W1z9yr3wdXNXFdhIYt7SMQBiGibSk0Qwt+3ZH4hrJ+DF5dCPoAUBOCjjWNeEuaKpIYT81xTE7w6vDKID1ZDUuzU6b/clB2pKcABcfPdLtqaHwtzD8CAoUBfpYNFNholhayWOyAyuQvv4K49W+JHOF+5BT6xoRnuJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210908095248.545981-1-penny.zheng@arm.com>
 <20210908095248.545981-6-penny.zheng@arm.com>
 <alpine.DEB.2.21.2109081654290.10523@sstabellini-ThinkPad-T480s>
 <VE1PR08MB521580BE54919E53282AE691F7D59@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c56961c6-0733-2245-ced2-61a33ddcd1c7@suse.com>
Date: Thu, 9 Sep 2021 09:05:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <VE1PR08MB521580BE54919E53282AE691F7D59@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8869094c-bdea-4b83-e6dd-08d973604671
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233640B35BF823F4FC75F63BB3D59@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nX6WsE7Uu6iMOt8GAVYUmArep2xMhywO6re5zxaAF2dy7XXZrngE2yZivkIuJhilA3/6sWnT8vEw/ORRAIX/0RRwdJgONGfel8Qf61TcOrmmO8omZN63sR4BvOpvZj/CAnfa+ILI8E1wm9FwXnP3Y9HIxFmkhEqGzkai9pLCDozxT40xlCkhjsES4DWGAkTo6odhKQvIl3YJgKlnxNaeB9X7U9N4hX7p49w/Hgdr8bsKiWiaW2N9/5zjmB+byvg9m2e5/AuXEIDvXYPpARSnRlaxQYdjlfUOwlAH0/e5SW/AWOutrdebGI9xeTAlnNpoxgRZIiEFwHpiX/H9+UAGD2Wg7KSv7JcL2N73N8k1i65M2j7uzGVeBl0AL05CI4+uo/v8Vxby+MVG+qXI0I3P0pz5H2zgDj9TIyxXMTKbiz6uXl03tWwBp5nUntdFtusaTkC3tZCEgbPuSuXA/3kaJmcMg8LYNRvDYMkPaYcV5wG+xRa1y0x+NRgzxbXlcxH2EmCCl3qJkgF9YPlkyBvQsykUhn9o5eUOpJSTlof8hAl2+SHWz6jnXed9RYuFPITrJS+T8+YFTccFquO1MxvxchqUFDjjodJraVVSQij7lV8YZZX8Em0ZevD58HQ+K4BykF78yrFyO/qju6/zCIAehftxvYle2/acJo4oQ8lTrvV/vDLbykhwn1vhFv58YbZ5enx0U47voky88YUuE5OYC5pM8m2hY/0byII0H4LgSB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(366004)(39860400002)(136003)(53546011)(8936002)(8676002)(4326008)(16576012)(6916009)(38100700002)(186003)(83380400001)(4744005)(2616005)(956004)(54906003)(31686004)(316002)(6666004)(36756003)(86362001)(2906002)(66946007)(66476007)(478600001)(66556008)(26005)(5660300002)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0ZIQ3dCdTdIRDJUS2dMVWZ0NHY5cEI3MC9HZnhwb1RmM0RtN1dYRHNZcHky?=
 =?utf-8?B?ZDJuZHQwSkk3NTJseHFTem1QY25ZR3lUWCtvK0pBSnFETGIwYndCTFl2UE1x?=
 =?utf-8?B?SElZYlZDQi9rc0RIenpweVExVXgvcERjYk5tbFdtWkpsNkRmRW1QWGxHeU5O?=
 =?utf-8?B?dlEvUnM3L3B2eXdIOUlteDhvRUMwT3o0ZCtUS1p1VFo2dDJmOGdDRS9QeVpD?=
 =?utf-8?B?ZGFZVDlBRW5RZUVvb2xJblc1RTdTbk80anhvS29KcTV0dU9MUmFXWi90czAy?=
 =?utf-8?B?dHd3RlUyYlhRK1V2NDM1T1lmcktkRnozVFR6R1FmclA0dGZxNzJDMEtZTzds?=
 =?utf-8?B?dTlPQkg0YjJFUFRGYWppTGdqZlRnZzhxb3Q4U1Yvb1dVcm41UEUzWDFrUjA5?=
 =?utf-8?B?SkxxTnlSR2ZMc2lIaENkYXl6QzRUVnFhTDRFMzI0bkp5ZHBuVkMydnVKQk4z?=
 =?utf-8?B?My9rQlh4cElZcHByOTBmSHlhbVByb043dmNib2pIdDg5cmlrTW5jVFZUY1Zl?=
 =?utf-8?B?WE1rOUZSVVoyaFkzUGxESGoyUW9LL2Q1Umg4K0Q3Tm55NE5GdHpJeDVSc1I5?=
 =?utf-8?B?L1pBMGFlYXl3NFlQY0psNWJhZ1JwTGFjYkkyNWxhdEVWMTRMbTU5OGx1aFJJ?=
 =?utf-8?B?a1QzbmNONmdLenhlc3I5YTlQZUpxN3Q3SjlBUUNzSmViYmh3THlaZG5zK1N2?=
 =?utf-8?B?U1pDbVQ5N2pvaGNPa1lTTUlEQnoyTkN1cmRmWURLY3loMGY4dFFXeVVhYnNr?=
 =?utf-8?B?SXpYa1JSSDRhMVlHMG1wcVNmSnF4S1U4a2oxZ2ZVTW5Lcnpna0ZxaVRUVzh4?=
 =?utf-8?B?V0hkejg1YlR6Zm9RVU9XSWVGM1BRakcxMFhZVHhHWW8rRXlqdU15RTJSeVdN?=
 =?utf-8?B?RC9oZzBuQ2ZUS0JYTUI1c3RXMmNmVWwvRE1ncHBzVlpKdXZDWFRuTDBWK2ZS?=
 =?utf-8?B?Z1Q0NEVFU2lNMDlvS0FTY2kzTHNVWGVyOVcyZW1DekNlby93cGJURHhsVnZ6?=
 =?utf-8?B?ZC93NlBiNG9GVExSY21xY3BmNUZsKzZYOTJISDErWnpKZlB3K1kzZFl3d2NB?=
 =?utf-8?B?U05DRE15T29ZcHNYYnBVa29CbTRzNko5K3BoRGFWN3dYUUV2bUp3ZTFWYkY1?=
 =?utf-8?B?QzJEUStyNWhuU1RWN3ZsM0gzN1NwdFhETzVEUG1TN2k2WkZzUjB4V3BaNCtD?=
 =?utf-8?B?QVZoeGtoS3lsaG8zVnJ4cTRPTHlVdUw0SlpwTGJ4Z0dQR3BHVXcyVUVzcEtH?=
 =?utf-8?B?dnZjWHpDQmY1b0FTR0VPeDVCRnBoRmlGYlQraGdhNW5GQ3EvZ05qeXhMQ2xI?=
 =?utf-8?B?OHZDS3YxNWNmWE9MR3J4YmhTWEd1RHdiU1p3ejkwemUrTHNJbEhpck5jZ3Qv?=
 =?utf-8?B?dWVTTFgwTlEwUzIrek9HSGk1M3E4aEtFTWtxUmJpakdPRkZvaTllQVN3d2Rz?=
 =?utf-8?B?TGNRNXh4S0Rrclhudmk1Rm82bmQ0eHBJc2ZXTkg5U1VNaTNJenBUcys2YjE2?=
 =?utf-8?B?N2gva1JhZHhYNXRRcXNzcVhHR2NsanRwOVFxbTYvaW9LenhWaUE2UzlMYmoz?=
 =?utf-8?B?UU1PRFJMSVE2UCtrTTRxTnZwT1ZhQ3dDNzdmSk9SWDRoY0VyWTF2ZkJhR01o?=
 =?utf-8?B?UDhuMTJETHMvUFZXZEgzdTVxTm1TMW9mbmJ6SUhlRDhHd3NKQnhwWkpwWUhM?=
 =?utf-8?B?cnA2d0Uvc1pwM1lSVnFZMU14U3JCd3BjN2hYRmU2L041MHNVbDZmUVJsMy9Z?=
 =?utf-8?Q?h0bqU9Ik9XYw3eqXoa4XPd4wMD6K+1QHNB3+xFI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8869094c-bdea-4b83-e6dd-08d973604671
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 07:05:59.0957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhvkbFOyuz52TyT4veLNV+MP7c5aq5csnXEq6HJ02EH5PGkpuw5oKJhXGbqz7pkMe23d18wx2Rj85GDbWg+4Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 09.09.2021 04:20, Penny Zheng wrote:
>> From: Stefano Stabellini <sstabellini@kernel.org>
>> Sent: Thursday, September 9, 2021 7:58 AM
>>
>> On Wed, 8 Sep 2021, Penny Zheng wrote:
>>> In order to deal with the trouble of count-to-order conversion when
>>> page number is not in a power-of-two, this commit re-define
>>> assign_pages for nr pages and introduces a new helper assign_page for
>> original page with a single order.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>
>> The patch looks correct to me, however I don't think I understood Jan's
>> request to the previous version of this patch, so I can't tell if you addressed his
>> concerns.
> 
> Would you like to take a look at whether I address your concerns in this version? Thx.

I will take a look, independent of Stefano's reply to you. It's been just
yesterday that you've submitted the new version, so I'm afraid I have to
say that I consider it a little early to ping for a response. I'm sorry.

Jan


