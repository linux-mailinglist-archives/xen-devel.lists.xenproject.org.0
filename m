Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA5414B82
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:13:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192802.343446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2zJ-0002wE-He; Wed, 22 Sep 2021 14:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192802.343446; Wed, 22 Sep 2021 14:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT2zJ-0002sn-DH; Wed, 22 Sep 2021 14:12:41 +0000
Received: by outflank-mailman (input) for mailman id 192802;
 Wed, 22 Sep 2021 14:12:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT2zI-0002sh-1k
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:12:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fea10ca2-8cbe-40de-9b7b-ad2b2322457d;
 Wed, 22 Sep 2021 14:12:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-t3BeueurMHO_6OdA_ETaAQ-1; Wed, 22 Sep 2021 16:12:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Wed, 22 Sep
 2021 14:12:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:12:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0011.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 14:12:33 +0000
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
X-Inumbo-ID: fea10ca2-8cbe-40de-9b7b-ad2b2322457d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632319958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Du2wDA6nvKLVsZijKk1h7XmI403NREUTTlM8111wuVI=;
	b=mYVxBJwkDt4pOqsnSqDSV0SGAPgxZz9Faowz0RVaawJKO0+w0D2AlOmAghA+TarCVbgCbQ
	gl3mOYynCocPz71sjvjcjDKX6glkrYpKmfxQ4cCJBejSNNsD9AF1xi4Fw0cXEtWY/BvAVY
	vMsJ6drSnoKM227M6mTPKaXNFvnYYBE=
X-MC-Unique: t3BeueurMHO_6OdA_ETaAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTCgNlgqO0DCuVx7OJJmBE3Jm9Lge1A+RwJC2niDE0AbyMOdQUfHQnXf9bpUPbBR0VW1H0EIL9co9BOGV0m9ikah2KRuq4tHuzrY+Dvm5G5hQar6VVJiDwJgkLAJVTyx2SUKEa2oH0YJsIS1LnHb/ueLaXelVmwHES8PBpYANDHlKl2IkuhUbaDNb/Xax0mmn4Yt1/47KDzyknFuIj7rDtr+/YCc4zBUYes4m3wN9+y2UNhxGlTEamVHOG4pJIbvZk+ErHB+g+Odzpp87/cyyieVQVT5J00rdyQmrL8OOyKPfmLgQpt8I4KEQkn0Jgeome9s2k9lE3h9m6GUqKK2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Du2wDA6nvKLVsZijKk1h7XmI403NREUTTlM8111wuVI=;
 b=lOb32P4N4AKMARc4zc8boVtR+g/qmDgw4EPG7jbZpAcOSDl94r50JVwWvcDl5p4P1UhO6wT3ddfOIYmG9uUOHzJhjL4TyaeyRRTEp037t12Zwewn5h9M/Fkw2EyOSpn9Jylf7UwdL31lIvT5I2ppf/lUoYB9MOMqY2k2VwkgTxxhggjvEPCjsPGVg04LTFDnmi/ACuFbeakT7QQkVVrAG+3W3lnKqISC/Sg0WGoxVShttoeXUMZvWw3s4kSXqjq2hGEZ2h4Pj9YMHBsNXzK5Wk2vOwb4lmAzENFIOYz+RLnH4zS1nzgbb5JErubk4j8+hTgGv7uYilmSYBbCaFZOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] xen: fix broken tainted value in mark_page_free
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210922114432.1093340-1-penny.zheng@arm.com>
 <94F4D68E-DF7B-4613-B03B-05C1CB1154DB@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b4b59e7-d0b9-c64d-b90a-475c4152c4a9@suse.com>
Date: Wed, 22 Sep 2021 16:12:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <94F4D68E-DF7B-4613-B03B-05C1CB1154DB@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0011.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4c5bfa9-70db-416c-428a-08d97dd305f6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59021FA2DE61B8B5DD06283BB3A29@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TN8VZ8bWV/FbkgCr7OqHofu8q5188/GG7ONfTrr1hu6fEO4IjW9GYrC/yJkRdipdBfyCp3XmhUZ3TOshHOVGPgymRznU66TgQavtJwXwIhsVtevYMT38HBjLKGcMTg+DQRvUfiGP+6UEji/IMnRK0U/IKTGHSMeOIDW3H97ECooZpGAQb5MwaIwY7lyMu1F8zs842W0FTta0aaYc6kk9lFpxaASlWE2uADQcoIEHig62Fa12fOEWWMWzKcq/sX+c/jtLDegeljYSy66+mJSH5hBlyIwVIlLNY9ykoXYYLME5l46KI4nRHUuS5XdvubcVJ/lnjIM2645yFBcoL7w+gkMSWu35lTO2ol0G1pX9p5A7XM+5K+/KWHVH4i2csqVZxPau7IOmFs4P7K01iX6aAWTsc996zpxgbG+XimkGrs9mK0/oygoDGYgqpNBF1CtpbLN1d8/ETv1ME5QmkA9xWLg4V9WM220AmYXjOauVyQ9+nohC9jw0u0nN7Zrnv2WxHFLaDL60G7qqvokbIH4lWTKX+NNwV5jDITFRpLIzj0oCyj63yyNNblOtCwlx3qKqwQL4q4uuNzXKPSbPtgP/v6j/QoFGYsYKs/VyuIRo16SLW+anHO2hojC+Zatua71QvCO/MpLy7aEVjJYPwg68QUpv/GnYDdavO6KM8mRWU7N4CicpJ08KpWizTfZ2s4SdeUpqTP5r7qqLLmoG5/qm2z/ezkAL5+WpHBZKugMMh1U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(2906002)(31696002)(186003)(8676002)(86362001)(16576012)(66556008)(66476007)(66946007)(53546011)(26005)(316002)(54906003)(5660300002)(956004)(4326008)(6486002)(6916009)(508600001)(8936002)(2616005)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3AwMUVVMHNPRUl5MVhrWWUwd3BMU1FhNlJDNmlYYXQwNHpqaFNZN2REc1B2?=
 =?utf-8?B?ZG5peTB4cXpIY2hJNkV0RmphUVdLaGhPTzNyK2o1MlphN1B5T01XbmJXaWdM?=
 =?utf-8?B?eHdGQjlsaTdjM1I0aUxqZHhkb3VjQkhsZUo2UW4zTExKTlQwYVJHMXo2cS9D?=
 =?utf-8?B?bGVxWnRlNlZwdmFZaGl4N1E0R2JURHoxSWprR2V2ejRIQ2Q0dno3OEd0cGhR?=
 =?utf-8?B?RFBha3hyRFpSNC9EYkIwYlAzblJZY0JNcWJwUHN0M1NoSGtPZG5IdlRyVEZX?=
 =?utf-8?B?QlJPdk9ydE1LV21XNjhTczZZZUtnQWdyWjBOK3gzQXV4UTVwRWwyZWxNYVJU?=
 =?utf-8?B?WVMyK2Q2bjRTd0xMYzB0QXc0a3M1UEVDS0R0ejNLMkV6QVpIRVFQYkNkdTJ4?=
 =?utf-8?B?dUpDQ2R5ZTdTSVpBR0orMExUeFE1amhUSG15ZEhMa1JaOE9yajlxejZnUXhO?=
 =?utf-8?B?OS9ERm9QcUxQWVRFKzdHYVdXcWtPNGRoeGtLMEV6QUtqMEc4NVJ5V253aWJ6?=
 =?utf-8?B?ZFc3WHh0VG9kdUpqeHFOdXpRYTNlV1BBMW1kdUZwWjNMcm9VVHEyZmtQV2gz?=
 =?utf-8?B?MEVxKzVtcXJsS2NVSDRteXMrY3lSa1Bndm12T1Z1NG1lODVVYnVEMFhucEkr?=
 =?utf-8?B?WXY3cm5aT2k5cEEzb2s2aThnSTNGT3pyaXlweWpNNmMyUUpaTEZocG12d09u?=
 =?utf-8?B?ZTZEQi84SW5udE12R1REL05JQ2dhVVJZTlhTSXRBUnkzTDRjQ2xpbUtEeGJl?=
 =?utf-8?B?eEp1VXJjZFhxbDdXeXo1WHVoQUc1WEhSbytPamhzcit4ZlVhYnZ6S20weGpL?=
 =?utf-8?B?SDFnR0V5ZmhxY2h5QjBTaHNrTUFCZXpidjVBUGVHQ1RvaFBuMUM5YzErV05w?=
 =?utf-8?B?L0ljd2pqc2pDTGxWcEhFMzcvU0dDSDlyZk0yTWplK0gvVU9tNFRFMTNWREo4?=
 =?utf-8?B?eHpCVzRCcVRweEZZSm5vdVkvWHpJdmFFMEhPbXdQNkFSQ21EY0kvSDB1UlE2?=
 =?utf-8?B?SG5jOE9FZVIyRHZhdzlWMzBOT2lmRGlUYkJVS2FmUjdWUnRaTm84anM0L0k3?=
 =?utf-8?B?cEtwZHl0YkI0RzNYT3UyNnNoamJuZkpub2liTTZKUXdZNDFib3VSQURFbXB2?=
 =?utf-8?B?d0luV3ovTytUbjN4RWdGSHVJbVlMWjliM2s4NUNyR3U0YjI1ZHVPekNQZGNE?=
 =?utf-8?B?YW9DNEVJU1Z5QVVBeVAxM3M5OThtQ0ppWGdPV1BhM0dRUXFvNHhUcFdVUk5x?=
 =?utf-8?B?NlNnMFdyU29mcThvRG1GK1hmQWFLalQxVFdiZDhzWllDK01lQk9TelFTY214?=
 =?utf-8?B?VFhiakw4V0tNZGFTTUg4WVlKZitUemppdk9pUE01VUFVTGlRWTR5UHJMMnV1?=
 =?utf-8?B?WnRMbWttM1FEZzhTK2s2aDJZQlJxN0JGZ3J2NHB3RXhHYktFRDY4QlFuVHlI?=
 =?utf-8?B?cUk2L0tSWGwvN2p0TTNjbzlCQ0JNR0tNdkVqK1hoeXJ2bzRtS2d4K29vcDJ2?=
 =?utf-8?B?OU5wT1RWSERBa3ZSYm5NYlB1S2xISHRiRW1xWTB5MTZYM2E3WnBQNFlaTldQ?=
 =?utf-8?B?M1JvUUNLRWdSdnVQNUJQUkZnY2FBeDZlTjlGR1ZXaDNPTmdlVGJhNXFQQWZi?=
 =?utf-8?B?U041ZDlBcGpCMFRuckdSMXUxc0NmMC9NTzhRMENTTlVUNEpVM1pwbTZCQzh2?=
 =?utf-8?B?dFA5VjVIUTdBaGEvMjFPQmtXM2VxTXdyVTI4RGlWcU5xWXNCcFZFSG0rN2s1?=
 =?utf-8?Q?pbblWvJgJ9sGACgpj0JUjQW9N+QyREDi8/RpCCG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c5bfa9-70db-416c-428a-08d97dd305f6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:12:34.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iU9ZJ/ENGoCkI/Zyg4qD/ukSYizFULxftCp9wF3Rps6jntfwQvbhW50tK5FPv3lNwTOwyXmTKzIBcax/iLLfaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 22.09.2021 13:48, Bertrand Marquis wrote:
>> On 22 Sep 2021, at 12:44, Penny Zheng <penny.zheng@arm.com> wrote:
>>
>> Commit 540a637c3410780b519fc055f432afe271f642f8 defines a new
>> helper mark_page_free to extract common codes, while it accidently
>> breaks the local variable "tainted".
>>
>> This patch fix it by letting mark_page_free() return bool of whether the
>> page is offlined and rename local variable "tainted" to "pg_offlined".
>>
>> Coverity ID: 1491872
>>
>> Fixes: 540a637c3410780b519fc055f432afe271f642f8
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit I would have wished that ...

>> @@ -1433,7 +1437,7 @@ static void free_heap_pages(
>> {
>>     unsigned long mask;
>>     mfn_t mfn = page_to_mfn(pg);
>> -    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), tainted = 0;
>> +    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), pg_offlined = 0;

... this would have become properly bool as well.

Jan


