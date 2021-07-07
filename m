Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB53BEBC2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152599.281898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19xd-0005kd-NS; Wed, 07 Jul 2021 15:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152599.281898; Wed, 07 Jul 2021 15:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19xd-0005i1-JH; Wed, 07 Jul 2021 15:59:41 +0000
Received: by outflank-mailman (input) for mailman id 152599;
 Wed, 07 Jul 2021 15:59:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m19xc-0005hv-7a
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:59:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5525f194-df3c-11eb-850e-12813bfff9fa;
 Wed, 07 Jul 2021 15:59:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-QLyJFtqOM6my51NchyPAEQ-1; Wed, 07 Jul 2021 17:59:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Wed, 7 Jul
 2021 15:59:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 15:59:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Wed, 7 Jul 2021 15:59:36 +0000
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
X-Inumbo-ID: 5525f194-df3c-11eb-850e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625673578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwTAhm/zOhX+bPlP8KYW1EGlb9P7+x6ck8dBRYjYbGU=;
	b=mXoNz4PHIwxJ4YnrQS2gvWJ/AtCzEd+qOy3bPgolkomHurjn0xMZ17pY77gdvaTsqmqYuj
	hhxT0dVXJ4kKSjpmjabEAOanf5nwKR7y7PBTu5dUsQe/o6MPokmCVrZgdyQrUeXj4FF/ml
	Y6G/LBfrhzx2VF1jPENNCiWVi4aIpZ0=
X-MC-Unique: QLyJFtqOM6my51NchyPAEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHwefZvlAC6k/XYrDG4OwsiIsFNKtG988+IQau1Vv7Ny55fZxsjW4tFhsqFdZSbuVAo6LtcXnY7yy41EqY0FCgHW24RIq/JetKPgGcIfx7ho8ZuABN7NxCIlZUDamNjyVZYVs7DatcUSzislYsUCgnpiP8LyYIga6XQa8XIj+pEERU7XWvZr9rvxKpoxmKqfNEJJOSbZvcJzbEH6e5HXNOEdcMQ6nHV9LnUDRf4s4Wk7fFe45Gz7ebxbeLKgMrR1kgiblFQMQiTUhBdnJ9acb5SuCGrCl6hZuulwitEVb3ih038wBMJn4BYpqrqFXAARAX3JGmkMQGT8XXWweeSTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwTAhm/zOhX+bPlP8KYW1EGlb9P7+x6ck8dBRYjYbGU=;
 b=jpcPV2stzGOMwqHInVyFitfusWC7PUWa937f8NbDqM7SGupv5AyG5cjd+HhWGaWWXK/Ym86FUckaH2EcXyvicjWUTxMZMTJj2khX4IMXWFfZl0Lin9pFgDcqKVxEeAvWCE59PLvABu0WNwRL9wi0+giUs0c1v/H3RGyogfgdzMzp7VgguUqEKueJZAD9Tp3eHVW86E3Rimpxsl+cKl2eEvnZBh4ATb74PdcXM/Vh7c3lEcjGZ/BiCmjDpHHHZuWxwSskiiQ8fHLe4/h/sEAWFom9BW398z43pTQ43iiQo8rIANx4Xo3wyM/t7tt2OkTdOkLPOG+O6ekxKVL/wGJDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: A possible pointer_overflow in xen-4.13
To: Rroach <2284696125@qq.com>
References: <tencent_4882F9152B24798C8A395FEE6E9C3DFADE07@qq.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0215ab77-a128-774b-db73-691b5e7884bc@suse.com>
Date: Wed, 7 Jul 2021 17:59:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <tencent_4882F9152B24798C8A395FEE6E9C3DFADE07@qq.com>
Content-Type: text/plain; charset=gb18030
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f67f5a62-2c0e-4492-e7a1-08d941603802
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66723AE61ADDF040467F4B60B31A9@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cyy2T3YzTeG+I0mVGw4PtwzhUuN85WTOsQDUeJsRQeATCVZWVvjTfxlIIB9LnZrdyTj311EvZbQE7YqgC7eNk9qsVcJWorRQ9BYvxFO0dzI7PeiWJExtUf63IoKm4FyNRIlup3UTIGpZiHsQqF0uiuRtGShctDwKD5riHncIw/GCNG1EnPosKESm/Gs7YLyT94HV+kC7biK+93Vy7ioRHPMYjcUhE4ln11eAw/YK70pXwzvnIqhRB8N9C0yxEA0kqqRjlXMcGsTN+Z+62ZRFfKW8wf2wZOpzkMfQo5/DuYLRR9hlec34Za51ZEggf39kQ0T1QnxHDfio2P0ThDIOdrpkRr/ei31cahYtwSRP0sJbUeaKosGp9IdG+dP+Wg8GlFmqbmTmPytf5RrTWcD7adVKs8y9HcH5iD3zC/Au7Qy0KU9Ncd3OCiz5MF5bogC0bgzj9Ge5VvY6mfVS1/OG0StV4psoXnO225SULkKQdy7eij3UBtcYEXcqCuNshNAACB9RevHRJjd/i1+D9vb8MTC7wa3r0J42j50QeAlJCoSI/xLaqPakdLWzEfc9e6Md9i98V/ynQkO8hOReeTKNLI14gsLz5LDYTYgdNdloF8uK2amqJLhy3so3MtUnJHom4BlHBMqgE4HeHJff4bF/BMv8ujd3OHwd4ynWCW2Amox7ghkW6ht/mFuszEaCrRylyPiIrFiERXZQBFUVJZPz26UTGVsnbyoKKRDe5+SYGhc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(376002)(346002)(396003)(136003)(38100700002)(31686004)(8676002)(36756003)(5660300002)(66556008)(66476007)(956004)(6916009)(478600001)(8936002)(4326008)(31696002)(2616005)(186003)(66946007)(86362001)(316002)(26005)(16576012)(6486002)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?GB18030?B?a3RBdmhwSlBsTmFvRXdQY2dzTi83WFJPeWd6NUliOEo0KzF6VHlueGZkVWlo?=
 =?GB18030?B?L1RPeXlDRVUyTzlFZjRwaS9XYVdFWG9UMk5XWVh1cm9rMUV1M0IrREVubUNr?=
 =?GB18030?B?UlJFZWNZblJiZDdXbjBsTGN0VzFXNkRoVXhndFFLNk5QN0RQK200TTNReStM?=
 =?GB18030?B?aGYyWjF4UzdNMG85TmZGV3U1cFpmY1MrNVV1SC84d09jdDV0VGo0cXF6SGQ3?=
 =?GB18030?B?K012eXF4dDVVZWNmaXNOUzhDcjUrYnMrTzNJbVdmajZ0YkdLSUhkbGFaMWow?=
 =?GB18030?B?ZVBJMTlHRjVZaHZiWmc5TGpNbjB3ZlVBUlNVVE82L1EvUnZqQzRWbENqYzNT?=
 =?GB18030?B?cTVMblNuTDFIbExtbzNSdk8reWw3RWw3dnNNdXkxblM1VXJNMlM3S2F6RGM5?=
 =?GB18030?B?aWJTQVZRdWRjK1FxZm5aeXg0T1U5QkNvZGpFei9XUXpweDk0YkQ1VXJ2ODVl?=
 =?GB18030?B?V2dxT29KUnNENi9QaDB1UVhwWmhpU2lIeXhpQ3dra0NyUXdJM1Y2M1lTNENa?=
 =?GB18030?B?V0cwajVDZjZvR0FRclk3NU5ybjhZdjgxNUZ0bHAyUnY2M2ZjdklzQW5GN01m?=
 =?GB18030?B?ZEhPYTN2U3MzT3JXb0xFN0VMWm5wWFdibTRsK3VqcGt5Q0VLQkRBc3RQRWF4?=
 =?GB18030?B?dDF2RXFTeVdodlJsQWxSRnNXTEkwRXo0K2dJMUNrenM5WFN2bCttL1pWOGRV?=
 =?GB18030?B?L3lOMkFqVUdqWUZxSUVybVRNSlE1WHRxaGg1eWs4TzVkZVRPckRWRTFhVjEz?=
 =?GB18030?B?dk8yNzkvOVY2QUpzSDIxUUp6SWVUS250aE1WM2luc25iaEZsNlpiR0Q3NGky?=
 =?GB18030?B?UGU3Z2tBZnNYb0l3eWlXeWw5QVpXUHZncXU4RTJTZnBpNU56cndKWWYrSGVO?=
 =?GB18030?B?Snc1MmdYekxCVXBYRFo5L3lzNXhWVEFycUdXNXlvREllRkhMMWszL0J4U2tU?=
 =?GB18030?B?K1BRVUJnWFFvR0dOUXUvb2VteFFRR3N2emYvbzZNUTZ5d09BWVR6RXpvTkUw?=
 =?GB18030?B?b3pLTElIWXFwd2ZHUzlBK3lQd1k0WFVjWFdvZWFSTlNHVWF5clRMakxselRR?=
 =?GB18030?B?T0xUTnFrQVlXZ1N6RkVVZ2JubU14cDN1QU84RjBlVjUvWUdVYW9BczdNNUpM?=
 =?GB18030?B?UEJPR0tESGtSakxPRUNWSVhSQ1dQYzAxZXYxb0EveHpMTkFYaDdRd2JmZHFk?=
 =?GB18030?B?THp5bm1rRytDYzlaMnpIRlE5U2c3UWNIMkNqWGRQRmFSOEpXQVdYQ3B5NHI2?=
 =?GB18030?B?a1o2SE1ucGw5OVBadjBEbTdraXBicUdiZExYWGZXbStrYTRmeTZSRWQ3cmNj?=
 =?GB18030?B?Wk1RNmJXRUhkbjk3VDhCUlVDU3NJcHh3QUVrU2ttZTA5VXBodlN1RUdmQ1k3?=
 =?GB18030?B?MVFJZTRRdDRjS3IzQWZWODRWeVRlYjZPaHFYUHJqSEpjZm56VXY5eGZJY2du?=
 =?GB18030?B?amxOWTlaRzNiWTRzOUdLMWNRS2NsTFgzais5Rm9PdURubTZGSDhKNVlZQ0Y2?=
 =?GB18030?B?R2t5TTczSUFNaXFVY3V5M2RCcENIL2tOUVp2bzFFZll1czB5dzFpekN1TFZo?=
 =?GB18030?B?TDRJdllnZGp1RTNOZlNybmJTdGV6enlBZ1gzZnp1UW9NU1FHMUNPLzdpVitu?=
 =?GB18030?B?b1JCREl6Z2Vlc1JhN1Awcm5QU0ZvRU5sbVNqU3RXYUNSbHJWSE9nVzkwQUJL?=
 =?GB18030?B?UDRnWFdtRlRuWEhTNkxNV3NjRnlsZHRaOGR1MXlhbnFkaGY0dzJwVGRZNiti?=
 =?GB18030?B?QnprZHhwTDR4VjVqdzNkUjNFRHM3Y25KT01sVlJWWHdPdm1sd2Vy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67f5a62-2c0e-4492-e7a1-08d941603802
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:59:36.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SflJYqt7mgf6n5QdPhPaIVfRFp5bC90aa+f7e0/LMw9CgLddhjitiH3KUuMFoYGf9acwqfyJqAx3c30ao/AcOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 07.07.2021 17:54, Rroach wrote:
> Hi, sorry about the late respond. I tried your suggestion, it works. I'm kind of surprised too, since such problem should exposed long time ago.&nbsp;
> 
> 
> I looked deep into your suggestion. I believe you were right about it, since p - ctxt-&gt;io_emul_stub &nbsp;won't overflow and the pointer overflow is likely to happen &nbsp;in&nbsp;&nbsp;stub_va + p or&nbsp;ctxt-&gt;io_emul_stub.&nbsp;
> 
> 
> Andrew's suggestion works perhaps it the long variable allows the expression to store more bytes,

Xen (as much as e.g. Linux and I think most other Unix-es) assumes sizeof(void*)
and sizeof(long) to be the same.

> however in long term it may not be a solid solution. So alternative should we take both of the advise that using
> + &nbsp; long disp = (long)(f) - (long)(stub_va + (p - ctxt-&gt;io_emul_stub) + 5); \
> as a fix patch

I don't think so - we try to avoid casts wherever they're not strictly needed.

Btw, to record you in an eventual patch with a Reported-by, would you mind
providing your real name and maybe a less temporary-looking email address?

Jan


