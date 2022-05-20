Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B54552E4EF
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 08:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333509.557349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrw4F-0000eG-LG; Fri, 20 May 2022 06:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333509.557349; Fri, 20 May 2022 06:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrw4F-0000bg-I1; Fri, 20 May 2022 06:24:55 +0000
Received: by outflank-mailman (input) for mailman id 333509;
 Fri, 20 May 2022 06:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrw4E-0000bV-C7
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 06:24:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f29c293-d805-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 08:24:53 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-o7bhSYRwP4WUtylg8lVrmQ-1; Fri, 20 May 2022 08:24:51 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8817.eurprd04.prod.outlook.com (2603:10a6:20b:42c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 06:24:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 06:24:50 +0000
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
X-Inumbo-ID: 8f29c293-d805-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653027892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yvV6XaqRyg33fLdED6d6S29/wXFFo5+6nKAJQOkLvI=;
	b=jmcnnFfcaVJ4GxD/YnvpzTevJITrOSgJt+Ee/mmdarAKVBV147WrRfhwlND63dZFMyU/VO
	EWi5tvLlkJlTwS8PsRab/k6bmMuOr/YtuWqcjSQt8XmLPC26GfDNplmbhlFye1jt/gp+M8
	6EW0dsgcI0LHSFpJ0jBEO0J1iiTvTvs=
X-MC-Unique: o7bhSYRwP4WUtylg8lVrmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+D+QmOIPtrvK/TMt17aQ7g7ympV3NMSuNBJ3WSGngyXl8bcBEhYJPT/guY4v9Gp1hDsjtIWQL+smVXfE46YACDNPyL+iPYvPcjK7LXh3B2RIBQpDhyx7RxDI7bOGtUOcuhytvi0EKe3DD7K5D+oppPjGOwE9Yz5wN//H/YEdrf5SfqESPFpXGUJHhvw2u9QtWW0u8K7KD4BS5Ql1XxP+J7OBo0VxsXTO+kNU6l9aWwIQYv5BHr33TyFGNueJ3RU8GxKzkKuqBp7VIkaqw4Lcv3K4ETtp+3Cfa13m0BiLCTLY9LgWRU59Bp/ZTed8t2K+EDKR5IjFqXK6pNJiKYiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yvV6XaqRyg33fLdED6d6S29/wXFFo5+6nKAJQOkLvI=;
 b=RjAjRN5eIneuOcbGFU2kkpVaYPn4K6zy2S5hNymMvLrvXk9q7wcVCA8EqZdyj47tCFf/xKxrfb6xkL6b98jpp/LK9jc0hdabagpeo2Uos0qi6am0YH6GXtFHbZRnd7GYwJtM8tKwl6BEmoL3Y6oQOuIkVHstPriJLqZ8/9u9hZ/XltIHW0+aBW+bc7WrPxrgxzV40CDGYXOvvbKiLrQV5aIDjj8S5TVrCzh2iNVVADo3tlT9h0x8PVXvs1ubLu7++gEz+LCluC5ghfw15uO4YSpjgBwy64rsIrJgVpw/twNhIJNAzRAb7p1RKfMFWH+qL4g2kJBWjKwPRuL9Kl8MXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcf54bdb-e588-430d-e2db-30b6fd4280b7@suse.com>
Date: Fri, 20 May 2022 08:24:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Grant operation batching
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YobRWXY/xVli4UUf@itl-email>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YobRWXY/xVli4UUf@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 623e8493-0adb-4c4c-089c-08da3a29718f
X-MS-TrafficTypeDiagnostic: AS8PR04MB8817:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8817AFE316D2E882D2E12B0EB3D39@AS8PR04MB8817.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N4oSfEZ0Kx/U0Zxj/qx88tsnSnejRuRt8Vee1ie1dC+grfRo9pszQbUzQPMrfb+JtBYSTBMZPkI9F5YkflSiH2je0K7XwgFJ8y9CHruCaTFKr4dRRm1H6s6fON3UjP23+E4Bo/xDdP/a2zyTcyGgI1/cIm4PmvDY+NlHJk0MGB6Yzp4ZSwRzPqqlAAXXPUAd+PmdceTn2g77WqGSSnKj86Q2z8P6ierejUma1+n+MIjxQv0nCnU5X/5d2F4vqS8fw8qtMFs7FTZI/IL8CLm7tDelHX2Z83snrQFWbuX7ekOtok+uvZJxpDX3cO0wSIuaXqVQjhwKo3GTRw6JJXmAkK778C7Y1NJm8hSe9wLefiupsT9J7iuhnU3NSCF/iRFggcoFcMcT65k0FHjmMNDSFAGN+QOs8Jo+ZSRuL7kDRyGyzYOppS5GTRnlOSYcbHSo1J7bGTA4rMuNoUVNxHEdt9gPHgGt19xNBT3QIRY0iuudG1wGk0xMo10Fs+caHuhxMPGFi7uPWiueV7Stcj9alUCOmn9cC0DDQK01/l5jyGkIK97u1HMYs5hCn9uKb89ktUm7eaWov95o+lZ6s98oXXbj58orzeW9BGV6uA2jRZ2ZBZzwwhEs8L6kn49rmY4fakdQEHALvLhRS6fNrT6XDZfbwG1AtbXaJNZRPZD3OesHVxvxRhF7UypqJX708sZm0CNY55tv1Zk11E9Hpd2styvVI+QMfZfFXjWQskddbqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(2906002)(508600001)(316002)(3480700007)(6486002)(31696002)(86362001)(38100700002)(66476007)(2616005)(66556008)(186003)(6512007)(26005)(6506007)(53546011)(4744005)(66946007)(8936002)(8676002)(7116003)(36756003)(4326008)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxUTE9HTk1QMS9qNXlmVDJDY3FEdlBzODcxZDlETEFrR0s3R2JCS2FDaFY4?=
 =?utf-8?B?SSt0WXZMWGYxeXpzVUNUSWF6K0cvaE9Hdksvd1doaHVjVXNabU83Vy81eU1u?=
 =?utf-8?B?aW1Yalo3QzMwZTAwTUVndnd4czA0aHZtUDI2SjlVaFRGZjZOaElQRWM0S0dJ?=
 =?utf-8?B?b2g3YzV3bXY1VlZFTzAzN2kzQ0pHRi9mVHQ2aUw5cHZpZHBZQTBxTUFzV2N2?=
 =?utf-8?B?TmJWSDY3YVdnK29YZEx2eVpJMnFPQzFQTjhZSkFFdVlTZWtZaTkwaFU1RC9N?=
 =?utf-8?B?WitjbXdyY0ZNdXZZNjRkemFKMGU2NGV1d1EzakJRRHNnbEZwdWVMd3haeWFP?=
 =?utf-8?B?QzJHd0FpWkwyTHZPTXNMNDZUQjZ3Q1Y2RU5vcVREZlV4OUNsVGNiaG80UjdQ?=
 =?utf-8?B?eUJlVWVZN2VwL29JRlpmell3ODFqSlpxS1BjWkF0NXJySTNYSEh2TFFQaFNF?=
 =?utf-8?B?amp4TzlCM1ArVWxSMFFxUDc5T09uaFRLUlhaTVk5NHVoS0tKcXJtT3dDSENl?=
 =?utf-8?B?WWxQUy90UFpxTjdwdlNPS0kxZXExczZzakZjYU1mQmhOSWZyL09iMERzOHEw?=
 =?utf-8?B?SEtBaVF0WDFmdVRDRHg5Q3RpMmRXdmt0YXAxRkdvRmllSGtIL0VsMnNobU1N?=
 =?utf-8?B?aFFGcEM3QUZDb1Q1d3BYeEw3bkhpaUJuOThkMUtzM081VkdWZ1FjaWI0RnhB?=
 =?utf-8?B?TTBvckFmQ1F3UEVsMXNGdU9GL1hnLzFRMGo1cVpOWVhucDlJdDVhcURaeC9G?=
 =?utf-8?B?TDMyQ3JBK2tIWGpmOHBiTnpUK21kQ0E5elliOFJGMjJ4eDFmTWtoR1VCNTZC?=
 =?utf-8?B?RU01RVBrR0dieExUTlJ0MjVFTFJjQ2s0WEd1Rnc0dFRISEtaRmR2UTZJcnhJ?=
 =?utf-8?B?K1pFWlpMMHlrS29XRXhGdmsvSzVRaHVoSEhzcDMvQWlMYnVhUEtBeCt2eHg0?=
 =?utf-8?B?N3hCaVJZU2tYN3pEWTg4U25iKzQ1Z3FTK2E3TFo0Z2J1QzVJd1oyUTMzMTdx?=
 =?utf-8?B?MXpPNkJlWEpxNG1qV1BLTE1NZXVjZGdnbElWaEkxU1hsN2FycklyRTFxaGNr?=
 =?utf-8?B?d0dNajJmWFU4eEkzbTk4MEpDSjFURG9UWFdxblYzWEZtWE04bzNrQWZZMlJz?=
 =?utf-8?B?T3E4WCtrRGI1Skt0cHRkWWdyQzBHL0FUeHJHa0ppTEVoUC9ERXhhTU12bnQw?=
 =?utf-8?B?Z0lON1RzelVOV2ZGNi9KQmozTzlIdFB4S2c3WGJISWdXUVNrNFFiTFRhaldG?=
 =?utf-8?B?ZHZhZDNDQmxOaDQvRjVOV0lUdXV3aGh1MlF5aVdDTG5mWHEyZ0tuLzVNNFho?=
 =?utf-8?B?d0Qya0FmemY5ck5namc2TXR1amo2NjdhOWFmc1FCaGZFejVMK0Q4ZWJXUHFB?=
 =?utf-8?B?TWtLUzRNVXBSZTV5cFJ1azlLOWtJMVI0Z28vcVB4SCtyU0tNOUVRdUlhMERx?=
 =?utf-8?B?bzhmVmNUVndnZHExRldYNVBiNHprR29QNVlhTjBiUDI2QUt4Tzg1UjJ4dnM4?=
 =?utf-8?B?TzdCTC84S05ka2JiNkdnU1pVMGc5OUdiVDhBZ3p2NnBSYm1PbFpQVXZ3ZXhv?=
 =?utf-8?B?TU5QNjQreU04WlpFeFFUTjJzTkZZUVBGamRMYytqUkhLRTdleGZuVHZ2L2xP?=
 =?utf-8?B?dWRJcXByU0EweGIwMEZGc3NUSHMrSGI4U2xZQXVPcnJ1VjdjS3dXUi9MWEZ1?=
 =?utf-8?B?Wm5jdExjbk9rSEtnaEN0ajdnQ0dUY0JUZFdjZkJhNmQ3ZFlJVThDSVZqY0ZZ?=
 =?utf-8?B?N0hvVFZkWGIya05MUTdtU3F4RmdWcTU0aGY2MkttLzFCZEpXN2JWa1JRa2s2?=
 =?utf-8?B?UnJyMTRJaXBaZlNvSjdjVmpqaThJVEUyeThqby9iSDdmNlVtMDRVaHEwU2oz?=
 =?utf-8?B?KzFKYjl3azZOT2hKYXgzb0ZHUzNGLzAxNGVuaE5SU213T2pHY05LRnhFelJF?=
 =?utf-8?B?Zmx1N1FycUxtQ1llVUJjTFZiZjFZZVJjYmF1TUQwRGpwd0d2TEtJOWExeHhJ?=
 =?utf-8?B?bHNVeTRlMmxNaER0TFlBdnJraFBzZ3kwUzh5VHIrYXM1cUtYZEdaeitaTzJC?=
 =?utf-8?B?NDl5Wk9CYUFSUDg3eUNoamcwODN0b0FXUGRjZmk1VmpibTFVb0dDdW41M3c3?=
 =?utf-8?B?VzNIUkxjbU8wdG5mWjgvZG9lUW9NaC9KQ08rdnp6dmtvcWxqeDJjbnBNTzJa?=
 =?utf-8?B?NGFzOHFtSlpNMm1Nb3RCZ2N2UFlaSUZMbWhQeC9FMUxlNGtBSVQwaEl0alJZ?=
 =?utf-8?B?akRKQUI3Q2VTRlNGa1MrdjEzYitCbTJrdDcvZG5GRU9mYUp5c2QrRDR0Yzlp?=
 =?utf-8?B?R1ZGM3d5c1kwTG96TlJId0laT28vQmZHWG5BNU1SVnFKUHNYVzlOdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623e8493-0adb-4c4c-089c-08da3a29718f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 06:24:50.4303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: en9OV00sOEExuFQzQYX4Zg1v+WtufkXvPJ+sT/iuuVBNc8RxH4vhm0Xvpz07ILjntheb51ZBH9CkXyaeW/yxoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8817

On 20.05.2022 01:22, Demi Marie Obenour wrote:
> It is well known that mapping and unmapping grants is expensive, which
> is why blkback has persistent grants.  Could this cost be mitigated by
> batching, and if it was, would it affect the tradeoff of memcpy() vs
> grant table operations?

Which backend driver are you thinking about? The in-kernel Linux
xen-blkback already batches grant operations, afaics. Such
batching is helpful, but the main cost is assumed (known?) to be
with the (installing and) tearing down of the actual mappings of
the guest pages (into/)from backend address space.

Jan


