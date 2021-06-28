Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBF93B6684
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 18:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147921.273109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxtuz-0000y3-Ba; Mon, 28 Jun 2021 16:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147921.273109; Mon, 28 Jun 2021 16:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxtuz-0000vw-76; Mon, 28 Jun 2021 16:15:29 +0000
Received: by outflank-mailman (input) for mailman id 147921;
 Mon, 28 Jun 2021 16:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxtuy-0000vo-3n
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 16:15:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f384b09e-7bbb-4a53-a0e0-d27868545201;
 Mon, 28 Jun 2021 16:15:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-HQF5BtepMZOOfRQukNANqQ-1;
 Mon, 28 Jun 2021 18:15:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 28 Jun
 2021 16:15:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 16:15:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0278.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 16:15:20 +0000
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
X-Inumbo-ID: f384b09e-7bbb-4a53-a0e0-d27868545201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624896925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbJpNJLR8C8ufDmrtZTnOf4qQUfD4rly0HHSesBAlWo=;
	b=PMLI7Tk3GF0AGHjn/Rp5UfKkWLQSyduymFPTAXa/BxmZgfad2om0XLUNqjqfp+iMkYNidr
	jaAKKnZ6AtVC1H/v0S1DeNOv/2/p1OMUAzGZy5vkVRzNMSF5GLnADqyRYwo4sUWeS6OtWT
	E1IFUejUeQot1+mNEZZEXu1GWhafbVI=
X-MC-Unique: HQF5BtepMZOOfRQukNANqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BW3XZrb7GAcvRacdvJYmJAfkYOD4OVIgHzsE7QaQCIT3tU8F5z+8ocZibU2SNS9/xKs/qlCs22qUBG6gVb1pJXfQa0Pti7/zpG70o7nAWJoV3y8JC4q8vS7MMMj6VXWIRI57x+pAfO7cqCB8ABdgeee0cCYVsf7pjAnJnaomoMuw3/Cjdy+nw/ZRRa29ZM0r/akuWXQmj4s5otXZIOc7+ryctsvbdbciIyg8fU6Ov+zklkKwSuaVAIu58JSGIjEcmWwZyQ9LEYiWhCTY3BvzUrfNRPvT7SIZn840GS6PQgRQHS4uBAxeIRixnwiiICwNMVmjdX+EuxlDlWvWRSzdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbJpNJLR8C8ufDmrtZTnOf4qQUfD4rly0HHSesBAlWo=;
 b=mj2CmqCW/ynahqJSPGb2tcfT9wMJx21j/laxVOTxHnjnMH3vc5QeN3hKBGwzfytF6aLKGfCBaanrfF9eDOCt1lrtkBgjBC7x61Rg9UD3Gr/dbL6EOzNSdbt7OC4OAx2eg1bCqNkSpaeCXmSXtRVR57MtTbqX6dWe+D4ld+9hzrMv6CC1NHxb4esl/hoNFur9a5qTNaAosF7XVdvwEV+0yWESjlI/X9dJQ/4wPPPcRWNSQOYB/R2dzg4r10Fb+y9Vw/DI4+uQBSiE6WZD9dn/lbIovxH24LnKfyGRC2UJPutWrmZSXvHAFM7EzNAteG00TM9EDLbRTQHFGVYbcs89Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] fully replace mfn_to_gmfn()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <389f5988-4700-da3e-e628-1513e87eb56a@suse.com>
 <263f1b30-e33d-711c-ff22-64f8acad230d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9138e7a0-f4a0-db77-c09f-4fa6a45652cf@suse.com>
Date: Mon, 28 Jun 2021 18:15:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <263f1b30-e33d-711c-ff22-64f8acad230d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0278.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d42a8f41-7963-4d54-44c3-08d93a4fed2d
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630444A42DE574C897372821B3039@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vmkm3N4dLLpisqUF+5/1AjEF3ehOxk9rwV6tOpqwg3+NBu8dGf4SYXvvrTSpPwNO9rOUEEByShmti16fT5H0V+kHTi3Ehz2PgUrkVIQCPXYk7XA+TKl9xhnlBJy4Mfj+aXQiVU3WAnhBcwhs5cT78nQqzXjn6wwD08BWIIMwmzSAfo3einqpQuZpl6mugQ4qE+7d9EOTTqVYYxD8RPsc+wpT4KG9t+ZpTo1GBA3uF5pI4uPssias7qNLRZqCE4KBXajpMybQvOfQhONxxndInRVvr951u/g0IyrxnGaRJDiRGTg5PkEPywpLr12qmxoeQSPwwCm6cxXD3RNaFBWlU0VMMiJ7oAu3JZxM20kH3EQbHC1+PzGhel/PS2czuPSVa3rukgFxU2y3vPNL1jpnb2rRg/0hm7djYozG015ilnW+/yE+fyoYrvQgbkk1Au27TSyCSz7gP2Soloj0lZJND0KMN1QSmpQC8C0L2N6drvoknCUveCckZlIZYRuJMT5WCxDLdP9eo05wzQmJXJ9f2UQiV3omSRCQLAhOD/1M4n57l/z5WvbR5IEcHi+KnXZIkCp3EKHQuTaSJ7BKfbKd6Ge+BIhyVu9pVXmpcGwt2nIcDAp08+mn8GM5wRgE7ScYVk9yfwptjcpz+L9gRjNUB5Rztoeij5AGyhq6AxnJJpWQ4A8K17xhtKJsBdh+eKju8FjVPm1w0TCgC37RAe6gXvk22zrBVpVKnKUhcx0ZiB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(346002)(136003)(39860400002)(38100700002)(66556008)(16526019)(86362001)(26005)(186003)(66946007)(53546011)(66476007)(36756003)(5660300002)(6486002)(2616005)(2906002)(4326008)(4744005)(16576012)(316002)(31696002)(478600001)(31686004)(54906003)(956004)(110136005)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2JGQWVsSEYrZkMvcThHaVJkTnYvWjRUOGlNRllsdE5zUGtZd09TYmZwUmNT?=
 =?utf-8?B?a1lxSEtSaEpCWWRYdWQrODRzNzU5WEpPWHF1SDZPSXFBK0hkNHZ2VmdXN1ZI?=
 =?utf-8?B?RXpCcEY3SjBKU0R3RUsrWTE0U1JXVE0rWnNlc0NhbUVlL1NHdUJ0aTZjQ01Z?=
 =?utf-8?B?ODgxdkdXS2dnaDRZVldiUFVzQW5LekQwZjN2VVBvakx4R1l2RHFnZFBIQ2Fu?=
 =?utf-8?B?MCswLzBpTnZWYjB3aVpuNEpPTW9UQUdSUVNhL3dML2cvWWlYeUc3a0FLNGR1?=
 =?utf-8?B?cmJzemV6NlRGS05qQTlJNXcwZnlBYUIrK2Fad2EvU2p3QVVSTjhEbW44YnhX?=
 =?utf-8?B?ell1YWIxTk5xNVZxUW9vUCtPVFFaUi8zNmY5VGFza0JHK001NVZQc1hBZGZF?=
 =?utf-8?B?K1NObk9TTjRrZmlsTmlWaFlMcGp2SFFpeXg2VkFrNjF2S3YvMGk0QUswYTF3?=
 =?utf-8?B?Y1JGOTdBQUt2am9Qb2EwM2kzU1UyQXIwTlNUUXYydzV2WWRSQzRaNW9adEtM?=
 =?utf-8?B?M3BxVDdtZnJtMmtZYjJDUklxc0JWNWpDSjF0K1JXOXh0M2kvNUZwNUZpSFho?=
 =?utf-8?B?MjVQVU9Ed01YN1phcXl3NndtVDdjTnRZRXFoM3JFQ0dsZDl5ajVQN0VOS1Zs?=
 =?utf-8?B?aFdhNVFZSUdqK3BGU1B6VncwMklZcEpYK1F6NHpEQWVYOUpoSkxWNHJJbFZZ?=
 =?utf-8?B?cjJwWTNzcGhwVFZXdStVcEN6OGkyZzNmQ21zY3FZNldOaGw4MXRIUGYyUnhn?=
 =?utf-8?B?TFNpZmt6WGU3a3NSRmMrY0F3TENlUkkrMStkTGE2c25UbzhuNlg1aytwZjNw?=
 =?utf-8?B?WEFoY1VtemlOdUZjWkNrOEM4YXY5WnI0ZlI3QXNaeVAxR1ZhaCtLMFVTRm1Z?=
 =?utf-8?B?eVZzZytyaERTWlQ0UDNCUWVDUFdGOXhjc2lQWjQxY0xtN2NiNWR0VnB4alp2?=
 =?utf-8?B?WFJmOUxsQ3ZQTXBlOG5SOUF6Nm5RZE9pRVpzWjNubThvVGluR2s1R2ZHTkhu?=
 =?utf-8?B?bGlIR2RIajRCWE9QVE42cGw0RGo3TVc2RUMvMXVVRktrNWhnS1JFS3RDTkh1?=
 =?utf-8?B?bHFVUFNQZzVkU3JmREsrNkRtc0xGK2ZMY2xTY3EyRDRmMUgwWkJFc00yT0Yr?=
 =?utf-8?B?ZXB6OHBCYkNyZElyV1BWZEJnRGlFY25OR1pLM2dXdEJSSUdtaXAzaVVkS3NL?=
 =?utf-8?B?RVdzZE03R0RNaWhwdkpQaEZnUVRDeXpvVi82SE41RldwZCtPRFZLZDRldnFx?=
 =?utf-8?B?V2JnQkdsSDJoNzQ4aGNRa21XTks1cWd0VFNzVW84Sno0QVVjOWRWSzVMZE5z?=
 =?utf-8?B?eGpRNE5WWDhCc1pqMnpKajNmZmtyRzk0SFEzdUlFUWZjNHNxOSt6bklXbldT?=
 =?utf-8?B?d2s0cEcrMlQ2OUFYT1JlOE5kWGhDbTlkb1pGTGRseGhnNUlwam9qUm4yQzJQ?=
 =?utf-8?B?TTZNR0pWazhSQTNUNnZaRFk4NnhFMDUzY2VXd3MwZWQ0NW1Db3RTVGxtR2dq?=
 =?utf-8?B?bFZ2cWNEQlowZFBLaGNJY3ljMVh4eUNpejloWUNxaERadUFIbFdGbllkMUZH?=
 =?utf-8?B?U3dSa1BwRjRDTjVWQXNkRGdkdUJrWlh1Tlp4eWY1ako0MWVHTFZaNzAzWjh5?=
 =?utf-8?B?bkc0TWUzSzVXL01udk9CYVVvMStBc0JXdHZFMkowcGQ1RGJVaGkwLy81Q3gw?=
 =?utf-8?B?akpWK3ptK2krOCtuS1gzbVE2QWwvaVB1dVdoZnpZc2dGZU01N1VRWUhQSDRi?=
 =?utf-8?Q?QlXgb/VWv23ndsjE0Sco7FwQmqdgwfFva7XmT5k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42a8f41-7963-4d54-44c3-08d93a4fed2d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 16:15:20.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gt2n0Iuln6pmM+ObSDM44RlSMtOtDuvckdo3j8kfEIVIHYSHGDiSAL0gKKqb3O4ZhBZ0sIgMRga10mp3+PJE7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 28.06.2021 17:42, Andrew Cooper wrote:
> On 28/06/2021 12:52, Jan Beulich wrote:
>> Convert the two remaining uses as well as Arm's stub to the properly
>> named and type-safe mfn_to_gfn(), dropping x86's definition (where we
>> already have mfn_to_gfn()).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but ...

Thanks.

>> --- a/xen/include/asm-arm/mm.h
>> +++ b/xen/include/asm-arm/mm.h
>> @@ -328,8 +328,7 @@ struct page_info *get_page_from_gva(stru
>>  
>>  /* Xen always owns P2M on ARM */
>>  #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
>> -#define mfn_to_gmfn(_d, mfn)  (mfn)
>> -
>> +#define mfn_to_gfn(d, mfn) _gfn(mfn_x(mfn))
> 
> ... surely this wants to be ((void)(d), _gfn(mfn_x(mfn))), even if it's
> just a latent bug right now?

Well, Julien said he plans to get rid of this anyway. I'll do here
whatever the Arm maintainers say is wanted. Julien, Stefano?

Jan


