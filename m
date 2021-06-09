Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C393A15F1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 15:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139388.257771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqyX3-0005vF-7j; Wed, 09 Jun 2021 13:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139388.257771; Wed, 09 Jun 2021 13:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqyX3-0005sp-4Q; Wed, 09 Jun 2021 13:46:09 +0000
Received: by outflank-mailman (input) for mailman id 139388;
 Wed, 09 Jun 2021 13:46:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqyX2-0005sj-6V
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 13:46:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c6fdfe0-5c6f-409b-ae00-0fe700dc4e61;
 Wed, 09 Jun 2021 13:46:06 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-YkWM81_MPFCGO_XLIQFRBw-1;
 Wed, 09 Jun 2021 15:46:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Wed, 9 Jun
 2021 13:46:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 13:46:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0042.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 13:46:01 +0000
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
X-Inumbo-ID: 3c6fdfe0-5c6f-409b-ae00-0fe700dc4e61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623246365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1RCBhkH3bKk0wnN0QyKqFvRVsI0s+BU6zZsur0WPRM=;
	b=FlTyCycQgzrE8yt/3mCCLccAVWUHupnSV0uoUF6Kr2h3zfKwWCWZtEY1AQv41HqeHiSNAh
	gEADEFKD0U6coAP9iwbRSvn3uAnl2NOYKDtS3+uBwgrsa9H2yeeVuFl3R+7va9CtGG+JaQ
	XmMSxc8FiFdPC71MBnXzqeI+zAjQhDA=
X-MC-Unique: YkWM81_MPFCGO_XLIQFRBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGERnIUKFKkNZUopgQL/pxKUtqF1B80+NjdTFvixelpJLkwmbQHF0tD96P7Bf87tGLku0vRt7Y2oDbzQr1eM76ZPNl/PDPrrxI+CtEMpm4Siydb4YqAngHOy6XW0N25M04PfU7zzdc96IzTJXYpjxyWyCP5y2nqBTS9aJyiqhXLjeNy7QPqkGjISbOLEaBm9M+dII7vWaRxnfiH96ORpI5oiISDNoyxtktDL5+NOzV2mrXMm3y1w+gcpfk9ne7mvFHqNKy04g0gv8bYg+6YcDeU82F/lC+8aJTZyDy3iWle0eyKpIyCAbOyQVuM0JK6ndIkWgQnzayyL8nzmMfWWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1RCBhkH3bKk0wnN0QyKqFvRVsI0s+BU6zZsur0WPRM=;
 b=LS8HP+aAzuiCNpYg4v7m+Kqh4FFqyNhtgqaqt+H96+dek5TdfQvElsTuv+CAT07uaUtoch1w/1tY0xc9pRD+SEqFPDkpa6i0cOGJByCL8e7n6V/NlsXFU16/2nVO0ohJn3374cCIS/VSo0ReI/zJEcZ50o/g8eiMwzZhwtEcy//CfceHxLccJQfQq0xmUVt1/F39J4m2YPth346trdXfExuX2jLoq61fG/FqlUNNujb5Hb7udfBISz/g3nZfDlgjn1KKmsem24wjmQY33Y2uBZPBWmfMbEtgWDIfioNAQxl5N3Yw6q4ZwVLK6RG2v5wI9+93fG6FFK90bJd/kcAcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
 <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
 <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
 <20210517132039.6czppjfge27x4mwg@tomti.i.net-space.pl>
 <ee89a22d-5f46-51ed-4c46-63cfc60cbafc@suse.com>
 <20210518174633.spo5kmgcbuo6dg5k@tomti.i.net-space.pl>
 <51333867-d693-38e2-bd1c-fce28241a604@suse.com>
 <20210519124846.go3zyqzojsaj35in@tomti.i.net-space.pl>
 <c55f44dd-47bb-8e60-c1a3-446c561d6740@suse.com>
 <20210609131818.pkpzbzi7p5x2fu7i@tomti.i.net-space.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8380715a-f26b-eccf-a8e1-42db29b6ce6f@suse.com>
Date: Wed, 9 Jun 2021 15:45:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210609131818.pkpzbzi7p5x2fu7i@tomti.i.net-space.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0042.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f615c4b3-39ed-497f-fdf8-08d92b4cebac
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472B9DB4DFF9A3D46EA5A19B3369@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GRopGlcA2QI6RoRzULLuiPxWg9p46Zuw6fjaCFHxLGrU+jcRXeKOFSWZcndL4reQEa89nugLkBf91uCH5EZfbk7+fUAP5cdvcEP9RfYPTYCXaP2z5kk7YuVLIvmuEYTRfJbCigg9fIVQ1mSA6SXq9Jl0HOGX4wsJOO/2SmAI2Cvo0xpE+oqynpjZ1O8TJaIyp0aprz9y78ttWfiQ1UYILoB8ifhYFAd4xIrpwAfk/TL7nhuIYaMyUuhkRJeM8kf+f1jxY6XRPWURO+ANDxNnjK7sABcGwFQGslktmh7p8z7ZdO8g6jBAzqoVVbSRLtPDLJTBN7IPAUnFfq2KOE0eQhwxFUVhcImpYrs9CmZyRFYrqYQhxvcydtz1wwEOiu01NwO5XuvHLE1yM1NqZxTEvzx/+KvZpKaOA36QZ3ncBa5LiUK46YTIOQPSD6+bylQnUMJ4mvqzIXZXEitNP++Y2s5APXafzYTbun2rtHQWKxc67fp4lqiVoMUkBGBc9J2FALnBKsHaegC4fOBjRd116COSA3EZYxH0X5hSBA1cAJFNCQ3FeB6CtyTbPXaTrIAbZ7fXHCkcKy8EcdQ6JEOpfOA3seVMc5iLi7t+RA+ymt/C+3ukxI/QdFNkxU4zlRXl4+ZQ1SWlHzDtIztKIzdN6XBoyb8ApIhwEY+HtI0HjCRc155Wd1M1o+feqgebMLL3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(39860400002)(136003)(376002)(66556008)(31696002)(66476007)(478600001)(16526019)(186003)(53546011)(6486002)(16576012)(86362001)(4326008)(956004)(36756003)(6916009)(26005)(38100700002)(66946007)(316002)(5660300002)(4744005)(2906002)(2616005)(31686004)(8936002)(8676002)(83380400001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?dWlndnlpQWpuVGtHRVBkTno0THJUVkNxTXpUV1FvN1JmMS82aU5NRHFNVUda?=
 =?utf-8?B?cFJuSEJwRDdvT1Y1a3FsM2o1Y1hIajd1ZHpSbUIrTEc0REtpeVdMTzBTRlNN?=
 =?utf-8?B?YldQV1JtNTMvMTkwR2pqNzJsNXBjekdNYUw3ZTZvRGlhK1RkZkVyenQxUHZU?=
 =?utf-8?B?Z2c0a3ovd1hzT1Q1R01aakt3T21JRytGYUdMOXVjYlo4YkJnRHVEL3JoU0V5?=
 =?utf-8?B?bG9JMTRiU0x5WjNJS0RNRng4dm0ySGxMTmlJOHJtR3AwUlE4cFZFZE42aldN?=
 =?utf-8?B?WS9odzJVWlZmZnZyM0RZUkNac1RkaWNVemtITlo2K29qajJhRTRmbXppL3p1?=
 =?utf-8?B?Z3lkSFZKM05QZjc3M3dwZDhTdGlHWm5YNy9ZMWxqR0JTOFBXUWk5UmlZOWN3?=
 =?utf-8?B?SUQyLzJ3MGdwUjFKYUVXekxqQndXa0tGMlJzbENJVEJiTWJ5SlFpZlRrR2xX?=
 =?utf-8?B?Y3N1NHR0VHZKK1dvYmVSL081Rm1pRVNyOVVxeGMvNzljSkd2Rk00dkY2cXdo?=
 =?utf-8?B?Z2x5YUJTUzdQT2tLVC9kN1hmRVRPaEF6bWh1SXQ3eFovRXh5aW5ibjVKcWc3?=
 =?utf-8?B?WEY2K3VWc3ZzOVN1Y2gxMm9OMXg1VjIyZHFtQlN5cUY0SkVWbkRlK3RIby9H?=
 =?utf-8?B?d2FNQlVqLy9oalZYNUVZYm5ucDRNZ3oyNjFkTmtzeTMxRjNOOUFuZytBbnV6?=
 =?utf-8?B?amw1T2dac1VoTGhSQnRqRWJjTmtiY1dNM0N4RlpuNGhyLzR5L05TSjNHZStT?=
 =?utf-8?B?eEJod2YxVkV1VW05UXB6QmlsTUdkZWtuSS9YZkVLUUFxVVdTcHpDLzJDMDNM?=
 =?utf-8?B?Rk4wdjdpYWYvZjVMVWJUUTlMYUVQeWs4emM1NGRuR2wrTmRFVFlZV3VxRnJO?=
 =?utf-8?B?S0dzc3dqYUhodi9TSDBvSXRUY05xbStHc0N3SFc2QlMwbW9tWm5iSVpQMDJi?=
 =?utf-8?B?WFJBVkRsbVBhbllpemlEcG10bFFMaXE1ak1lbXE4d0VCcHh1TitGbThpa0d0?=
 =?utf-8?B?TXdkYXU0MVJ5WVlZbjg5UnlwVHVpeUdjVmZEYXExQjlCbzNMTWRRR1U2MmdD?=
 =?utf-8?B?YmRxNXRSTGhOMk8zN0plVUFsM09OZ1B6Y0YrdDBvajdzS09XZkJTb3Yxd1Ft?=
 =?utf-8?B?VFJ3RzVVWGQyQVpsc2RaSGhFTzNBa0tOcnFnK25ocnZNUzBoTXpielcwR21H?=
 =?utf-8?B?ZkJLUkF5ZTBLNkxBbTNpTGdZRmxuVlJQN0pWTlBLZTAwUkRkZ2dvNVhBMy9C?=
 =?utf-8?B?alUzN3p4VWhvSjlTWVhTcEkyOG83MDdhQkhIVzdBSndVa3h0V3Fsbkk4YVls?=
 =?utf-8?B?bFlDbkJNK28zUHZGVXIyb0RqdElNTmpjaFJ6TWFqUEVTMk9MdFBkSnFId2Yr?=
 =?utf-8?B?Ykd2elZHNGRTSU5WNjJ0TkU0bUVEbG5kTEE2TGZLaG52V09Lby9lZ0tCZ1Bh?=
 =?utf-8?B?aXhmaUxxdFBjQk10TE5mMloxeXJPeXROeUZBNU8yQmZ0OTZ3MWpDQnZQRERO?=
 =?utf-8?B?ZW5OajhzZzFLdE01U0VzWG9WKzdPRmljaGdLdWo2NHJmb0VZUEx0cjRhekJu?=
 =?utf-8?B?b3BhOHRmU0RFMWZ1K2p5cnlKVGtxTHQ1U0pwK1A4ZzJBV3pTTi9wZm44Q3Yz?=
 =?utf-8?B?VnI1a3pqajBPaktLa2haZzFsYkxQVXVZb2krRFlPd2pzVlNBem1aaml6c21n?=
 =?utf-8?B?cUN5ZlhwK1B0a0FOdEFRSk51MUZBM21DNllIQ1NEaXVOVkdkTFNWUTRwTmNX?=
 =?utf-8?Q?nsDEMuYW7yx3xov/Oc77FW4ZTzlZp/f+D5ocf3e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f615c4b3-39ed-497f-fdf8-08d92b4cebac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 13:46:02.2217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/8CPiVQDKpy0CvmqX8Xqz5hZ4zavYwdoXM9rc2Nnaq13MhcgLj/MaNKuDCEuIlxOOIqk/TO0lTgewZO2mx9BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 09.06.2021 15:18, Daniel Kiper wrote:
> On Wed, May 19, 2021 at 04:35:00PM +0200, Jan Beulich wrote:
>> On 19.05.2021 14:48, Daniel Kiper wrote:
>>> On Wed, May 19, 2021 at 11:29:43AM +0200, Jan Beulich wrote:
>>>> Also not sure what to do with Dwarf debug info, which just recently
>>>> we managed to avoid needing to strip unconditionally.
>>>
>>> I think debug info may stay as is. Just Multiboot2 header should not
>>> cover it if it is not needed.
>>
>> You did say that .bss is expected to be last, which both .reloc and
>> debug info violate.
> 
> The .bss section has to be last one in memory from Multiboot2 protocol
> point of view. However, nothing, AFAICT, forbids to have something
> behind in the file. Of course if you ignore the data at the end of file
> when you load the image using Multiboot2 protocol.

Well, debug info can be ignored. If MB2 would work like it does today,
then .reloc also would never be touched. Feels a little fragile, but
might be okay then.

Jan


