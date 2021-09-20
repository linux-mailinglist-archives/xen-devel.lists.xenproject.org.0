Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A024110BC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 10:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190296.340128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSERc-0002dm-Ju; Mon, 20 Sep 2021 08:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190296.340128; Mon, 20 Sep 2021 08:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSERc-0002bM-Gm; Mon, 20 Sep 2021 08:14:32 +0000
Received: by outflank-mailman (input) for mailman id 190296;
 Mon, 20 Sep 2021 08:14:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSERa-0002bG-BU
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 08:14:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d743f36b-c10f-47a7-a785-b20200901f7a;
 Mon, 20 Sep 2021 08:14:29 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-wSrTziYuMt2trocxUB_AVg-1; Mon, 20 Sep 2021 10:14:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 08:14:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 08:14:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Mon, 20 Sep 2021 08:14:23 +0000
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
X-Inumbo-ID: d743f36b-c10f-47a7-a785-b20200901f7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632125668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWErE/ky9SiU6UZ0auj0vn+oHlKF51mWPkEyZNXviko=;
	b=jgOahPfayqm4uPnCNzo4nd35OrYMfw7RiMwCe4ozpSETliRri/m0TrfgZucgWdxp3EHoYd
	Q/GX4VzpqYFWOioVJwnyUA4rhpC0467K7Rr3ZV1YwvfdNQmG2dH6gMHj+6/MRHkihlUO7c
	mO1A2CQ/dW8kH1AYITozKwzNjVxf7kQ=
X-MC-Unique: wSrTziYuMt2trocxUB_AVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI6FqHoutxeCVuMjMGgQ8qco3tviAV/3VW7tTkcdzWGde6dEg7HbkqeuV5Mch4wmitjFnWiTcVGf7e9v21k69IErMbEbArepdOSIOwC5gNwzVQrDxlIaWS/zPyjc7g6yHTHHzlvm5iFnbbkva96pgM4yzvF0Y14JFaeBj6AAN9CsNEQ1n5kZfW+LAdPM/BdE5n2o9+PQSLypcNSfptlJw3Bmwi7pmpq5BK1QvHTfgOKflk2jWgQW3bL24dn8k7l5lfadRuLATY+dyKVmq14HzCqRuE+YzpGheg3jCrusaxezLobYQYxtWYQctqkt+urQ2srpmzfl2gIUklDA2Hb7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TWErE/ky9SiU6UZ0auj0vn+oHlKF51mWPkEyZNXviko=;
 b=J0j53cAfjT6bkgBN+x72uTePCZCHIdxtNTkKdYrdroBpehdkN+D3yS1HA2JN42+WEHgrW55/JRnV0D1ZSTKXSCsCwGm9MFk8biVxrfdKxtubH6IyH/0bEhi3uUsJgplHYuEXVsMnxYwk1d1rJKdBnovhyuk910RBrKo/ePeo+M/269idToDZl3uvvXidLrnyo3wzL+uBe206aMcnFe885jtS/OgQF7CEPGOF5cIwnN7DzIz6fHs+l46IyRaMaKmpM3X94NyBb3wjARrJbvJCLBnmL+H6J75r2JCxoI+IXpF4Bj6c4iqEN9m76Oqs2ccw2MoPlKCZDCZmm9nnOU8IsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/mem_sharing: don't lock parent during fork reset
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <c21708c84c850ff8c976a3934099c54da044e7d9.1631802816.git.tamas.lengyel@intel.com>
 <52b28c4d-1cf1-6c98-e1dc-1e0f7b2f768c@suse.com>
 <CABfawh=B3zwfroiu=pPY5BTCMBkapYEGXixkRg66aXLQWxwU4A@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd4b342f-8a90-7643-9232-02c08cf14f93@suse.com>
Date: Mon, 20 Sep 2021 10:14:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CABfawh=B3zwfroiu=pPY5BTCMBkapYEGXixkRg66aXLQWxwU4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2507cce1-885b-4590-c2e0-08d97c0ea7e1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2703E878404948B6A964CC92B3A09@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aRhU/bAny9uwymExqWCiVKp1DG/UTyLD0D4h8w3zTxVk512lv96cPHXXGBJb72cXzB08NTOkL7Zjvci7+jsQ9UHW8xdRTg+BwCQOZ00AN5364FhULloWSC3HSAqSq0qdYyieJke/+GLTtYFmlp7kvh+z05yvRGhuky78k9FUdcbF1VDC7tPsJ80kIHl33NmT1X7/YXVnOSmnq1Q0S7bES0ldtc3X+Fe0ctveZ9gaMos6ucGa3CtSJXWjxnog6O+ywnh7z1kkf7WBD9DC0MNggl3cUY0OliG/Wkfh0yUVD1HLe5tLjanfFpUXgKISw1AYSM9GbyloN2YKwHTVxtv3UVwsBxpHbZFa2MGDG83Is20zmjWDN1onBLxiieVKX3jTkfUa+C8NZXs1UbKpC6fS+OxcaAqaNjwXbDtjyT44DjcdXKmTpxenLQ3vg8QRsIUkTiw4LJPxa9B1j1bmI+ZIikIiKZCgMakZEPR7KThKlu8kHtvGKQPBGcWavPFAEYqQF/3M22A1M1rF0MzO68qE2DkJIf1RQBR027n0iXZMs9/3oXzemnUQyO2SCOz70a0Ioii+ej9SPVOm6ujS5igOoF8Qsed8gElIwQoA7EqCcML6l0IrcIbzVVhMJ/HbcaovZqyGIFh/RoDxkMPIqZZo6kbQyo+4dZK0ii303ad4370h9esiwqt7Iip149r8G4I6kFGt7tca0tAjXUjcTVmd39UH1e7BZ/7PCpnY9EpiqWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(346002)(39860400002)(366004)(36756003)(956004)(31686004)(2616005)(5660300002)(4326008)(16576012)(31696002)(66556008)(316002)(8936002)(186003)(54906003)(38100700002)(66476007)(6916009)(53546011)(8676002)(478600001)(86362001)(83380400001)(6486002)(26005)(2906002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L01ySXFNTFc4UE9oTGZaQkhvTWhaaVMrQ0l2aVhTVTV1eFpSdFRBWmhZNDdR?=
 =?utf-8?B?Q3JQRGZwVzZ4VlhhYVFrOFB6TTFkYVh2L3o4cW0vbjhaR1Arc3drcWFXelps?=
 =?utf-8?B?Z2NORGw3VWxPWlV3SCtHaWd1WVdtY21PSUdISE9IUm9DYmdnSFNRUTdUazhY?=
 =?utf-8?B?WDhUcTVlVzVUeTRXdUJSK3haZFROR0JSWlc3VDUvU1I0UTZoSW9VR3I2V3Ey?=
 =?utf-8?B?ZUgvZ0granJBc085emFiaFFlUno0R0t3bEtmdU1xcmpaSUU1bU9ORHhDakJ3?=
 =?utf-8?B?N2hGSWVZanZtUzg4b1VCL1p5Y1FhckJ3NU8yL2RJVVZjQ2tUNWFrVDVlWDFJ?=
 =?utf-8?B?TTVEM2NmanRHMWhLSzhXcmtBTTU1ZTh3UisrRWJsTzZrbGlGMFBjckltalFW?=
 =?utf-8?B?elVUSFgwMHZFcXN0L1RLNjk1Zjk1djJMYkV4QUM3MVNRYW9naDk0MWx1SFNF?=
 =?utf-8?B?MkVWTTVMc3hyS0Z6c1JEYWtaejBqVU9hR2FsVHlwMENlRWxLQnZBbTVHZGVx?=
 =?utf-8?B?ZHdZakMvcVA5NWRXNDZKcjZzR0l1ZThxdUs2YjVnKzUxUUF0ZHlUQnZMWG1O?=
 =?utf-8?B?M01NMlRPUUtxMFU2RDZCV0ExMkVpcERsa29CRThlTHFuY2JGb0dyNlRDbVR5?=
 =?utf-8?B?TXVrRThJZ2ZSZExSdlNYdFRaMU8yK3lBN01TeFk4T3VyV0d4azBta2Zlcmtw?=
 =?utf-8?B?OCswME9FdlhxRGlHMk1oSkdubHlYRFoyS3krdVJpNGZZVzgwV1dUQ1NyV3My?=
 =?utf-8?B?TTdwdFFqZU14WTRldjZsZURFOTF4ejdzK0UxQVk4MWFUcnp1WmJVeHFwdjBr?=
 =?utf-8?B?MFNoL2hwQjc3aGNaQU1jTEI2Yyt0ZTBCZEl5bTNYSlpGRWZ2Z3hLOW1DUXdq?=
 =?utf-8?B?VnZsVXRFVWxiZExTcFlzQzVoSk45dzJoT1Q5QVIwWUprMTZyTHJHTC9lTmw5?=
 =?utf-8?B?VzRUR1NmUWJRMVBSTW5EaVozQXpFOUY5ZGlicDVlMG5NZHIwZmZxSGhBaThq?=
 =?utf-8?B?blUwdkgrKzNuaUZPbTZ3L0QwRGRrRW00MEdoQkYzdGN0MWwvbzFlZDZLSmRF?=
 =?utf-8?B?cjUrK1pKbzMyL2VrcHQvZW9FVzBaREpRdGwxUWR4aDFvUnBUZFhZeldvMTlF?=
 =?utf-8?B?U3gvQ2ZDZTEwZ1IvUjFWQTdlWTJDSjhFUStMUnAwT3g1amFnTGxmMnlFZVVs?=
 =?utf-8?B?TzZDZGxNV2dyM3dEcnZ1dG05dzFWdE15L2V0TXJWbzFIdEdLY2h6OENJREhi?=
 =?utf-8?B?WU9CODRwK0ZuVVE1VlJKeWh2ZXlFa2I2VXpnaWMybmRjcUtDY2RtMGFuR0JX?=
 =?utf-8?B?aFJTYmZDZTdVeW14cFpOTW5hSU1xUUJlVkg5UFM0TzBhTnM1cDJnL3ljbnJ3?=
 =?utf-8?B?NUdMRGZ4Nm16Uzcwcjc2NlBKT0oyNGcvby95SjBCSVlaZ0l3bVI1Nk1DK2Rw?=
 =?utf-8?B?aEFnUHhDbW5WT2JsSkJNb0hoblg3T0ZkTEJwV3RRVFZLelAybm9hanlteFhB?=
 =?utf-8?B?dDU5T2hsS0JubUlCWVhlTE5VcU1UaldHalhoS1RONU5Mc0NoS3JQdEZMTWFv?=
 =?utf-8?B?SFRkK0JWcHlZV3hjT1ZxWTdhMVFFRWZFVnhOQ1R6SEc0QkhHU1RZb3Z1RUNv?=
 =?utf-8?B?Y0hQbE45NjlHb2FmSWs4Mzd2K0Q3N3hTRzIwN2RBR29iSllXYlhZOFpyanZh?=
 =?utf-8?B?YnJyREd0OEpCRngydjVnQUxFMkVWbFdjN2hWT1RFbzZ6RnVrTUJZeUVpVlRj?=
 =?utf-8?Q?WTOCw6AUJTc7RH/VvmSU7SySy/FhvwWCAB3i91T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2507cce1-885b-4590-c2e0-08d97c0ea7e1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 08:14:23.8622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8e1xbRb8S9yikHoi7PmTSiHfbgMlTDkdgZRHeN4q/K/kvvAGN9M8G0SsPjQmgEy+Zpjhs2qzKIBO1b8pfcJgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 17.09.2021 16:21, Tamas K Lengyel wrote:
> On Fri, Sep 17, 2021 at 3:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.09.2021 17:04, Tamas K Lengyel wrote:
>>> During fork reset operation the parent domain doesn't need to be gathered using
>>> rcu_lock_live_remote_domain_by_id as the fork reset doesn't modify anything on
>>> the parent. The parent is also guaranteed to be paused while forks are active.
>>> This patch reduces lock contention when performing resets in parallel.
>>
>> I'm a little in trouble following you here: RCU locks aren't really
>> locks in that sense, so "lock contention" seems misleading to me. I
>> can see that rcu_lock_domain_by_id()'s loop is extra overhead.
>>
>> Furthermore - does the parent being paused really mean the parent
>> can't go away behind the back of the fork reset? In fork() I see
>>
>>     if ( rc && rc != -ERESTART )
>>     {
>>         domain_unpause(d);
>>         put_domain(d);
>>         cd->parent = NULL;
>>     }
>>
>> i.e. the ref gets dropped before the parent pointer gets cleared. If
>> the parent having a reference kept was indeed properly guaranteed, I
>> agree the code change itself is fine.
>>
>> (The sequence looks correct at the other put_domain() site [dealing
>> with the success case of fork(), when the reference gets retained]
>> in domain_relinquish_resources().)
> 
> This code above you copied is when the fork() fails. Calling
> fork_reset() before fork() successfully returns is not a sane sequence
> and it is not "supported" by any means. If someone would try to do
> that it would be racy as-is already with or without this patch.
> Clearing the cd->parent pointer first here on the error path wouldn't
> guarantee that sequence to be safe or sane either. Adding an extra
> field to struct domain that signifies that "fork is complete" would be
> a way to make that safe. But since the toolstack using this interface
> is already sane (ie. never calls fork_reset before a successful fork)
> I really don't think that's necessary. It would just grow struct
> domain for very little benefit.

The point of this latter part of my comments wasn't to suggest that
fork-reset ought to work before fork completed. That's fine to not be
'"supported" by any means'. What your change here does, though, is to
add a dependency (maybe not the first one) on there being a ref held
as long as ->parent is non-NULL. That requirement is violated by the
error path I've quoted. IOW my request isn't really fork or even
mem-sharing specific, but it instead is asking that the code in
question please follow a common, safe model (as soon as at least one
such dependency exists).

If there are pre-existing cases where the wrong order of operations
is an issue, then adjusting that sequence in a separate prereq patch
might be better than folding the fix in here. Whereas if there isn't
any other such case or it's simply unknown (without extended audit)
whether there is, then I see no issue folding that adjustment in here.

Of course - you're the maintainer of this code, so if you think the
adjustment isn't needed, so be it. It's just that then I can't give
you an R-b, so you'd need someone else's for your change to actually
go in. (Of course you could also convince me of your pov, but for now
I can't see this happening.)

Jan


