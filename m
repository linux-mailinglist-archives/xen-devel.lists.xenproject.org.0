Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395A4845D9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 17:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253309.434414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4mSY-0002N9-0S; Tue, 04 Jan 2022 16:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253309.434414; Tue, 04 Jan 2022 16:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4mSX-0002LN-Ta; Tue, 04 Jan 2022 16:14:49 +0000
Received: by outflank-mailman (input) for mailman id 253309;
 Tue, 04 Jan 2022 16:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4mSW-0002LH-1I
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 16:14:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f10198e-6d79-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 17:14:46 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-TojKpBgVMmqZS5yz9pl6nA-1; Tue, 04 Jan 2022 17:14:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 16:14:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 16:14:43 +0000
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
X-Inumbo-ID: 6f10198e-6d79-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641312886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYjKGKCN6fMcSsHIdRt7BuOqFBEsa9p/5Y3LjtP7mvI=;
	b=R766OAx31Y2W34Vq8HZRRFzjOOy/J7+y45K3ICKOUfLbP6Ky4LCwFoftTxNYF+DEshcIOS
	EH69JiicMWVwK6/cNq8wV0k2WwNMows9excI3F5jHr5mX4BNFEC4ng6QX0iIVz7J9IPVKm
	MAiNVY0iZMa+XAAHCvT+k14jmwKvw88=
X-MC-Unique: TojKpBgVMmqZS5yz9pl6nA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/jhykKiY+BoIu0pjhE/1xmkgW/NHFU8cxox125o3kDAXXaIIm2hdUW4LS8fvtALnqXq9610jC3QBmmNrTfAhd+9iF92wTDtX364yBHEFB9DtJq+laf8z0SRwIe5E4rpXerx4vqRpi0s0SBaVGCBf8hNX7aO+6yA4Ovd9QkFbolusvFfLZoidERMAw0tsK8aVztEqa4t+lNMTYS7+0XMMybzaY4PtHCzNQ5Sf/YMxEPrQkFSRlnBreLD8XGOyhRDUDRFXfLzGfeUl6u2m2G/z/t8DesAjfZ8Ex/uvD5+cJPN+DGdMvAZqLp7yi3EdkF8Ldr6D4lD8Cwj2McgOJYZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYjKGKCN6fMcSsHIdRt7BuOqFBEsa9p/5Y3LjtP7mvI=;
 b=D91CW9F+BX/fF87YJXRSb0EA9WrRq+igyC/Z+5DTYp3nmP2Kn8XTi6JTEt92oXBDe06f56DmqXjKwoIjErQ291wvmyFKB2Yj7glIDuCcBU6om67iaOI1BbIlD+MG3xXydnaNMCB1Vj7FxsmARjeLJvGVu5hQlBMVWhWuh9c14vkQAFERXDMJLkKd0XJtzduT9hE/PDtVRKkfX8HmWCrOeCQfGBx2fHWaLwF+CEP5I8IIiPBgbHWlZtOnpzdNagBU0jpJY2yVSi4THnMKi99nH74E4jVLfx8tYFge6NV9oov+CgwhqfDcl1yrbx+VMHdhay6GfWdTL0a2ue7bn0BbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a30f0ed-c431-89e6-b91f-0f4d3ac92309@suse.com>
Date: Tue, 4 Jan 2022 17:14:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 2/3] x86/altp2m: p2m_altp2m_get_or_propagate() should
 honor present page order
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <2e5c460b-9123-bfc3-d5c8-0922f7b2e667@suse.com>
 <CABfawhmo8Rrhu985cr2z2hEXrikD6c1CQSNvv+PbmFy+mUS_XQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmo8Rrhu985cr2z2hEXrikD6c1CQSNvv+PbmFy+mUS_XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82849ee1-4880-4d5e-03a9-08d9cf9d5162
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4608D9944968F8DB3ACCC294B34A9@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lSzd9ikqa9NBdvcvElLAPFcTC9+hFclwjCM4D7j4MG3bCF2t4MoMfWTUk8N+xaWJg70twQizGkMZMSVHCqXU29Dbc9XyUOCxoVOkQ9pxE1CLDH5lyq2IRoKbqphxdqPEdL5COdx/7wDU3dmOREEQSA5fV1Itff3+L9Y6SaCyVN1OdbAYXeAeCuxJHJmzUr1EGlJ5I07NouUtY45IKgU/OWz6GWJZuePBkAqVWXzecN/pzAhXy27cYAcOc1tqzwXhZRxzG6A8+6DgNjT5zKmIMoLI30Zv7RipfNwb3N8BwM71zVL5OHeBS/YZzwhoWEFmjha0fp4lLoxzaGODXjJy2AO0oWxnXSDfnp0BZkXJFUPPHJBslzvykDr9R3HYqhviYUpnueqn2WUD3jrIERw0Ghev7i2yTixCHoDTKgB6dsZFsl/DeaO0q30nCdp8scl9wo4IOAK3NXuNG6/QS9usTKNhdqspHeXjN+pU5DRUFiJVyclmrGASHObKywunF3pK7AxtPYev0QJXseWgLyYi/oMJds6rJT3urjROAK9OaYKOBp6o9yyTsXAf/N96wwkQr75Lg7t6m/5iEXTIPmg6J14DqhlI6uu+XpNfON+BRs730yhvnjuBZLo2cUETEZ+N/n/r32guoX9BiWx3t/tsSzTJs+xLKbHpHXqpB3w67WpAB0UfVeG6s76FI/Y1sdjDf1xZZN/o/SEyLrUDi9ozMAWEQoQz30bhrPsk70LdqSM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(66946007)(36756003)(31686004)(66556008)(54906003)(4326008)(2906002)(2616005)(6486002)(8676002)(8936002)(31696002)(186003)(5660300002)(6916009)(83380400001)(316002)(86362001)(66476007)(508600001)(38100700002)(53546011)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzQvSW4xZTFBZ0RKQnRBMHNRMVY5ZldwNWpkaEtpT29WU1ZYakw0SExTVk5n?=
 =?utf-8?B?aGVOSlFDeUZmaEdNSk1TSWIwOG9kRnFWMWpnWGYyL0NmbHhveVdHZDhHWGVj?=
 =?utf-8?B?bzN2bVdPWWc3TldCNlJXeWFOdzZBZ0g0YVBPSDVnZ0NNWkhqS3FNbm9EY2x6?=
 =?utf-8?B?RjdDTEJ2RkN6WFRTV3RtOGswcHRaQmYvdGZmTFc1RS8ybThWZlo1OE9TeHNJ?=
 =?utf-8?B?NHZqa2p0Lyt4Z1hINlFxVDF3di9Bcmc1ei8vdjc0RTJWRXJ5V1pPTmRXYi93?=
 =?utf-8?B?TUcyWUFLN3NrWkoxQUFvU1h2Zm50M0FjMTZXTDlGcXJZWEhYZlRvbU1paGRR?=
 =?utf-8?B?MENWRTBLVWtoZDAzNTk0NVVzWHFkeURrQk43WWE1NGY0SzhhVk1XNFpsU2Vy?=
 =?utf-8?B?TmRxbVppWE1LOURQdENYVlcwa0Qwc1BJK3hRWGo4cS81NXZicWpqMTkydTNO?=
 =?utf-8?B?bFg0TkZ5eTV3c2VweDNwb1V0RUNobjRWOWpucVN3VWJGZlgyTlJtUGsvWXh0?=
 =?utf-8?B?WUU0cEZRRHRIcjRhWXpLcFZaaDFYTVhKNnN4OUZZaktFTkVJalY3NFBVMFAv?=
 =?utf-8?B?d0tQeHl4cGtCclFHVGp5MXg0d01weDNOeDJ4eFV5ME8rTHJ2eW5xUjczYmls?=
 =?utf-8?B?NVNjeVJ2Q24yMUUvY2ZDbHFIejY5dlRGZTZndnN4TDh4WU44S3Zwb1RyOVZN?=
 =?utf-8?B?blprVGpFNnFmbzRyWW1kM1JVU0JlRnkwa0FyaW5qZ0J5Y2xaVGVDVmJ1NWJo?=
 =?utf-8?B?a1FsU2s5WVRRMDlLdzcwYk56T1RKVm5NdEFxMW9hRUJaeElCaU5ZTUl4cmdM?=
 =?utf-8?B?MDc2WGpvTkN6Z3pxOWUrT3RHN0NGQzVDckpmWm1ZREdsQTdSQ0h3VnRkMlEz?=
 =?utf-8?B?ejhLWFRtNnlDMDVHSjJ3TmpiaEZsb01LZXgzWEdhQitJVHo5VDk2RUd2TVZo?=
 =?utf-8?B?ZVhtVWZwMjhoK0JzbTBrWWlUb3o3MndSdndNNSsxQTU1bVpQRDBpT0xSTVZ0?=
 =?utf-8?B?VUNwLzBWRDhjWUQ4TTJHK0d4Z0kvNWRjWStjZkhScU1IN2h5UlRTZjZCWFZj?=
 =?utf-8?B?dENvTHNzeWFhYStrZGNnaXVCdUh0d0s1N1hJV2NVN1RaNFhMUXlKVE9wWHFj?=
 =?utf-8?B?cStNaDJqUFV0R2Z0eEFkYTYyOEdNTGt3UzZGbG5BM0tIdUhUaDFSSFpmc0ZP?=
 =?utf-8?B?cmwzVHFuMFpIWlhGM2pLcWRoL2hkaXd3QkozTDFZZlloWkprU2p5WVhrUnhP?=
 =?utf-8?B?U0J3VHpybWxhdnhnOFdWUXlBQlJwVVVxWGtYSW03L3lJdWRua0ZTTlh1eUR0?=
 =?utf-8?B?UHMzNDArVEhMVnFVSTN1OW43Zk9pY1N1SlB4ZXl0T09Ta3dqa0loSWlsZG9q?=
 =?utf-8?B?VUFBam9BSzlXZERmNzY4cnVNaGtGQi96ZkwxUTFDRVFVWGF2Rk5yZDF5ajFl?=
 =?utf-8?B?ZWM3b1lEQW5nQ3RUL2dCaXZoRVFHY0hiZGtXMTNtdEZ3WmlISjlTQXNvaHRW?=
 =?utf-8?B?RlU1MjMrSURTMmxYTTRXVW5PUGJ4SmdEL2ZBR1YwOXFSVzdRSVRkZVh2Ynp6?=
 =?utf-8?B?cmF5REczc01OanR5QmFPRjFpM2pwSElPenFPUGs4TC83NmZzVG5xZ2plVElP?=
 =?utf-8?B?QTVwa0pib2RvVk16ZTViaTMxYWFQdXRScmFPUkxUUlNmbG1tK05tc1BMU2Vx?=
 =?utf-8?B?cW9EbDBaQkk0UmZBQUtLNlpmb2hkZ0ZJOXk5ZkcwUEFla1ZmUUM1Q1dDZEwx?=
 =?utf-8?B?MFdUalRuRk1IQnhqUDNXSjN1aFNObzJHYWp2K2ZGQ2ZMYzhRck96YUNmeHFO?=
 =?utf-8?B?by9zeVJKU1I0UHNmclNROFdhZnAyeUZFcWRHUnZhV2RNd3c5Vi9nNXE0ZmZK?=
 =?utf-8?B?UlVGTzdacmVId1lzR3BoakZibjdsUW9EL3EzbjhsOFZOcmttUDR2TXBta0cz?=
 =?utf-8?B?cVBDZ2o5V3cxYitmeDdrL29kMHpQTlB0QVVTMVlRbGpBeERIalJyK0pxY3VM?=
 =?utf-8?B?empjLzVtWC9rYmNBNmFZUXU3Rnp5TTJVYWo2eUlQT0dnQ3B0b1gzNCs5L0tk?=
 =?utf-8?B?NWJSa0E2YUVadW4xN3hkNGlQVk1TUFJCMHhpTGgwS2dTWjNhcTU0RTBsWG9x?=
 =?utf-8?B?UllSUUVFU1dQd1RkK0kzbXhJMlYzT292eWMwdXkyVVJtTFFrUkN3R1lWdHVB?=
 =?utf-8?Q?1P+4/4EYm7Zfif7DbzUlalc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82849ee1-4880-4d5e-03a9-08d9cf9d5162
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 16:14:43.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMfRLXeOBE0bcg3v81dTgx55nfEK4RrsIvV6xy8qQy37fruwEGMPArDW3VfFCnG/QqQR0jy5L1aYz7xjBjzc+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 04.01.2022 16:00, Tamas K Lengyel wrote:
> On Tue, Jan 4, 2022 at 4:48 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Prior to XSA-304 the only caller merely happened to not use any further
>> the order value that it passes into the function. Already then this was
>> a latent issue: The function really should, in the "get" case, hand back
>> the order the underlying mapping actually uses (or actually the smaller
>> of the two), such that (going forward) there wouldn't be any action on
>> unrelated mappings (in particular ones which did already diverge from
>> the host P2M).
>>
>> Similarly in the "propagate" case only the smaller of the two orders
>> should actually get used for creating the new entry, again to avoid
>> altering mappings which did already diverge from the host P2M.
> 
> I don't really understand the reason why you want to return the
> page_order from the altp2m here. The only check that uses the
> page_order following is the super-page shattering check for XSA-304
> but that's done on the hostp2m. So you would want to know what the
> page_order is on the hosp2m, not the altp2m, no?

From what I see I would say the XSA-304 action is on the altp2m,
not the host one - the p2m_set_entry() invocation passes "p2m",
which gets set immediately prior to the call to
p2m_altp2m_get_or_propagate(). This is also what gets passed into
the function. It's the host p2m only when !altp2m_active(currd).

> In either case, in all the setups we use altp2m we never use any
> superpages, the recommendation is to boot with hap_1gb=0 hap_2mb=0. I
> never trusted the complexity of superpage shattering and its
> implementation in Xen as it is very hard to follow.

Hmm, interesting. If you're aware of bugs there, would you mind
letting us know the details? There shouldn't be a need to use
command line options to make altp2m actually work. If there's an
incompatibility, and if we can't get that fixed, perhaps use of
superpages would want suppressing when altp2m gets enabled for a
guest? Right now, without this being enforced (nor spelled out
anywhere in, say, a code comment), I don't think we should make
assumptions like this. Hence the patch.

Jan


