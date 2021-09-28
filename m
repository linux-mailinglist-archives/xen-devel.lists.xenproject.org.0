Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0691541AA40
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197760.350986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV84l-00054y-Es; Tue, 28 Sep 2021 08:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197760.350986; Tue, 28 Sep 2021 08:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV84l-00052e-BS; Tue, 28 Sep 2021 08:02:55 +0000
Received: by outflank-mailman (input) for mailman id 197760;
 Tue, 28 Sep 2021 08:02:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV84k-00052F-5u
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:02:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00f13cc1-b607-4581-851d-f343c70a64a3;
 Tue, 28 Sep 2021 08:02:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-ZOKMQGZ6NnCNYE3hEZA3fQ-1; Tue, 28 Sep 2021 10:02:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 08:02:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 08:02:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0087.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 08:02:47 +0000
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
X-Inumbo-ID: 00f13cc1-b607-4581-851d-f343c70a64a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632816171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJ+GAgX6lMi3+SGbOZQeDp+v2NYvbnqOGkWbw3JziM0=;
	b=DfL9x7CqGvaay7CqNU93ETOQNZiu31OLi2OxsqzSIxFs36Q/cBAh1eEcBGV7L6ot4itzu4
	AymA679TWOIyt8r7M3BZycFgP9TQrkKXBX64GwYNwMzz+34JkuhZ3HExKC7sblRGCR09Yd
	PcElzu1I1qTxOYP4w7KPVOoqzExjAB4=
X-MC-Unique: ZOKMQGZ6NnCNYE3hEZA3fQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co9mx8ssVjqdmgKHsRjroauvhQ7MsVInIRbVqQURlWpfy3Wjkma2EKPcPzqM3Y14HnZzaj/5yL+h3UlrP+BVVIIKd/ulXyoI3coQNsHkGdD3mJoC9/MSkM4nS9Hu90wPdtQyzI8pAiuY/fwI78qLMrXyO8PYasbZE7ANl4MkaTpwQ63zxk07wonYdam8/m2gGNjyfVhknSkKWv0KookoUvrw3ARfoh5c6zn4wL2EQ/W4odMugKgzK+cE+BnyGYiMYsMaIu1C3Iz9aO2vYCONgjh7WLSBYHdYY3Xru16QXGIBc4BFKk09TPZBHp4Xxvh2QgilI5gslwd7ZAUGqa+qdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5yIna5NmEvZ/z/3EqYACdFIw5rgfUtwrjEFkAr2ZH1k=;
 b=XgW1KD/4t+2VcwieySn3g67ZbWsgYo34zXA9EbFKjZ+nLPb/mVZTeQR8NKGMeR1oKITCLWG3DtXCUwSjThyYrx2W8mSpM/NfR0w5OVN9OxZeprmEBh/2RUYjMisrQnVXsNb4iRT8Jg+JvowYpLdoQPyXZxU/4IBtcs6/W2ParHt6FomXZGo7MqS6qf4cpn5KUZzSQdnbORuwetj1DZ/Us/5eo2jXjaprUnkknusTCJNgBl+94tVnP7lGFscDvUidusTu9YViYp6IqgjkYFHGZjvMGBqyGGhbbFv3FcI7BiRYrglrUkFyejElHQGg0Hc0/+sZ5mUV7HXSNPAapV3eyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
To: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
 <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <a295cc34-9cc0-468b-c85a-2e5d1238d9a3@suse.com>
 <DB9PR08MB6857EE6294A1062EE0FAF0289EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB6857AB9DBB66A4E02140987B9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109271420560.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857E57847E38C400F6571EA9EA89@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109272159590.5022@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f872f421-dddf-7fde-34ce-210ddc55a87f@suse.com>
Date: Tue, 28 Sep 2021 10:02:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109272159590.5022@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0087.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e745ab6-24ed-4575-7fff-08d982565c47
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590402EBF00BE5C706AFCBA5B3A89@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oKbwNKghoHd7K7fiQJre5uaZ1G8FlvuAumdrNgRg1Wt0uuRnzkglugi9jibzCD6OLcAJz1zOyKEHb6nF0Zs330N8eeYjA7nRnq72nvfMIak9lumzSXMqXs3F/5RKCgRcsJT3jftL0CJuk7KeMbn+ReX4m6uXf9VMils/Cb9NdhnVKnU40FpqG2XzzTINW4LAzKeVwWzl2AnF58Ei8SXkFyvx9pW5fPmIa1DQnkWQqjZZHnhrregh2IBt5iEMdQwS9kRmXkOe/Kb+SgZx1qsPr4SYKt0l0H+SEyzTXYeybfcvK7n90YB2HCV9WQOwS+P9gu/UV5UmIBZCJS5ezrM97Y4HqN1ATbd8HgSmILtmB/2Uzr6OqUdoV9FdMc6/5y6NlBin9wTYKJeS+yO1aOuVGP93jQ91f6t7LloXk+D/F327d7m0Cq6g9D5J0kaB1GFywimTdLWa1Ek67nJHbdLecM5yQL1KDlO553AuIh1hX6KbImFWP7qg2xKr5cH58kQiwqruEPSSBcYQcpI20lKa2lkO3IiX3fv1HbGPPGZpxPDz86M31WzBdQlpKGae4xTgsbvA2Oa5HdgbEku8eRYw3PHIbMzPPTxpT5WhwJWUdPLkjv7LAHwkkBzNlwHviraTEP2dk8U4A393IxnY7utvaGx3dwL4C5PS+++p8UqkaCeRibMRZWVGaYFmLydZib5nLUMi2181Zph9neLRV0ZDPY4mh0VdVxLOEXTv5P/f9oBRf1s0Bsb9wfY1ZI1vtbv0fZYWMhOsuv46VgpMpXiFwisc8p0rFQv2/WEe+0xSfAC+n4laqXtzrLn0Nek3GIQUM9bAn6HpOzhyK1SAC8dsCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(54906003)(956004)(53546011)(5660300002)(38100700002)(4326008)(8676002)(2906002)(86362001)(66476007)(6486002)(186003)(83380400001)(66946007)(31686004)(2616005)(26005)(508600001)(66556008)(316002)(966005)(31696002)(110136005)(8936002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0zVg27jEYq4vhGIHqyB7SwgN5FqbwKNZwrHbRal9TCGZJRgfvMWHs3e2/nE9?=
 =?us-ascii?Q?WDEo+wRB5lmWsP6JvwBqqAoyfOuRqPPxL0D8CsHvMyudMpCZ+/GmRqq6kzDw?=
 =?us-ascii?Q?baz5Db456vV4oggHvySwIBEvel2/ske5OZeTjjEKBv3dDqvYq7miQ8YvgY1B?=
 =?us-ascii?Q?SAVbsCayLZndonzkONH0+oPRBp6pRhtdYk2Hi3+jd2l8QxswzmaTkSbWfirt?=
 =?us-ascii?Q?fCq4XVG6P20kKN25FFCAw+CAqTPHHC/5i8ZBny4VxB7F//jLJ8Vhh909SF26?=
 =?us-ascii?Q?G0Jk/rmtvdMGAVSsJ3qSNkviHT5ppsPwFYGXSs+89MRlzkDabl37lUoU31nR?=
 =?us-ascii?Q?uGfBmkIQC4YZQ+QP8lcVMlBgxMO2YgT8FdM3dC25Wldp2jXchsXdmZXtqmkp?=
 =?us-ascii?Q?An5zHxM9gWewNGOjKbOODcuassi3SYPcqkwPcdL3A0jDj/k4bCy0XFyx3flV?=
 =?us-ascii?Q?Ewu9DgLV/mzX0WZ9QTp6ffQ1OGQd8GZoyzRgnH2tMHv8JrNfHjRBgFK077Ek?=
 =?us-ascii?Q?0x+7WpbYtxVw3cLmYHkyHsvieAJ+VrcMAWNr/99uFq0mMqrganyn4dbPY7vX?=
 =?us-ascii?Q?x0yqGgiUlKa8PE11oJ6RG9g6pVabEaIpootUpn4Tn4j8yf1Q6nzrXrHux5V4?=
 =?us-ascii?Q?Rl4VkJW0HkZjnKeJGQgZTM0YF0TJeSvx4C7+yBLcQdhyaRRujZhMlcgi5+zX?=
 =?us-ascii?Q?HM0wg5oyZsBBtbZuLb5qUU/1JWBY00PkCal0Pt219xtjYOv6ZIZTC9B5Tjeo?=
 =?us-ascii?Q?aLCvVfP/5VhzAiGUdPDqHSNGWF69PofbKZtGYRcvFKgq0eyfWj9LceQJe1BM?=
 =?us-ascii?Q?Hm12wzcxKBnhlesEUxCqS9vGKz7mvDJ1yNmIE4ak/eWfPvqCq7/z8nuN8kqS?=
 =?us-ascii?Q?p9jNoIZ/+sNjOlFlcF6xywCnCSio5ZHTQPm2j8zly5/XGnsnc7pM+XkrZslb?=
 =?us-ascii?Q?rUvvFT7XIgOOkPwGetshZZRqG/r4GkIchPWtbvvo5jem2phXFe/1gyytXroM?=
 =?us-ascii?Q?cWpmUKvoxaOrIeT2Kls7CO/n+s3SZiPVv4+jIviDh10CR3XcDXunI5eCYIzW?=
 =?us-ascii?Q?1FuwPaDj2VMtbqhj1QIwdxY8bgqmz1jEEnFEqQ+tOaxmS60QLv8xnaHBpG13?=
 =?us-ascii?Q?adV/wiBgEYqti+3x+u2e1zIlGYRVG4Wb+1lA+wdjn3mNmi1G5rixQbR6QSik?=
 =?us-ascii?Q?b9XOghIprMTVxQZyekV4VdyJL13Z9+HmxHgOMcvKcdPObSMlrjVvDOGW1vOa?=
 =?us-ascii?Q?AfnnjZcjM+BoYpHj9zy941LIt5RJzNc509yjm3G9GVB6oUR64W6Q3cMmkYoJ?=
 =?us-ascii?Q?6Lr0+15Xpti7g1PP9PPuh1ky?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e745ab6-24ed-4575-7fff-08d982565c47
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 08:02:47.7593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehfa8JSxIGY4nAHfzeZPjek/dMrSehCr/tLLo/MSDsu05OtBsrNIfQ5qxZMhvaDHcdGtAiA5ghEwcFiwqDBzwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 28.09.2021 07:01, Stefano Stabellini wrote:
> On Tue, 28 Sep 2021, Wei Chen wrote:
>>> -----Original Message-----
>>> From: Stefano Stabellini <sstabellini@kernel.org>
>>> Sent: 2021=E5=B9=B49=E6=9C=8828=E6=97=A5 9:00
>>> To: Wei Chen <Wei.Chen@arm.com>
>>> Cc: Jan Beulich <jbeulich@suse.com>; xen-devel@lists.xenproject.org;
>>> julien@xen.org; Bertrand Marquis <Bertrand.Marquis@arm.com>; Stefano
>>> Stabellini <sstabellini@kernel.org>
>>> Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for no=
n-
>>> EFI architecture
>>>
>>> On Mon, 27 Sep 2021, Wei Chen wrote:
>>>>> -----Original Message-----
>>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>>> Wei
>>>>> Chen
>>>>> Sent: 2021=E5=B9=B49=E6=9C=8826=E6=97=A5 18:25
>>>>> To: Jan Beulich <jbeulich@suse.com>
>>>>> Cc: xen-devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
>>>>> <Bertrand.Marquis@arm.com>; Stefano Stabellini <sstabellini@kernel.or=
g>
>>>>> Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for
>>> non-
>>>>> EFI architecture
>>>>>
>>>>> Hi Jan,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf
>>> Of
>>>>> Jan
>>>>>> Beulich
>>>>>> Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 18:49
>>>>>> To: Wei Chen <Wei.Chen@arm.com>
>>>>>> Cc: xen-devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
>>>>>> <Bertrand.Marquis@arm.com>; Stefano Stabellini
>>> <sstabellini@kernel.org>
>>>>>> Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for
>>>>> non-
>>>>>> EFI architecture
>>>>>>
>>>>>> On 24.09.2021 12:31, Wei Chen wrote:
>>>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>>>> Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 15:59
>>>>>>>>
>>>>>>>> On 24.09.2021 06:34, Wei Chen wrote:
>>>>>>>>>> From: Stefano Stabellini <sstabellini@kernel.org>
>>>>>>>>>> Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 9:15
>>>>>>>>>>
>>>>>>>>>> On Thu, 23 Sep 2021, Wei Chen wrote:
>>>>>>>>>>> --- a/xen/common/Kconfig
>>>>>>>>>>> +++ b/xen/common/Kconfig
>>>>>>>>>>> @@ -11,6 +11,16 @@ config COMPAT
>>>>>>>>>>>  config CORE_PARKING
>>>>>>>>>>>  	bool
>>>>>>>>>>>
>>>>>>>>>>> +config EFI
>>>>>>>>>>> +	bool
>>>>>>>>>>
>>>>>>>>>> Without the title the option is not user-selectable (or de-
>>>>>> selectable).
>>>>>>>>>> So the help message below can never be seen.
>>>>>>>>>>
>>>>>>>>>> Either add a title, e.g.:
>>>>>>>>>>
>>>>>>>>>> bool "EFI support"
>>>>>>>>>>
>>>>>>>>>> Or fully make the option a silent option by removing the help
>>> text.
>>>>>>>>>
>>>>>>>>> OK, in current Xen code, EFI is unconditionally compiled. Before
>>>>>>>>> we change related code, I prefer to remove the help text.
>>>>>>>>
>>>>>>>> But that's not true: At least on x86 EFI gets compiled depending
>>> on
>>>>>>>> tool chain capabilities. Ultimately we may indeed want a user
>>>>>>>> selectable option here, but until then I'm afraid having this
>>> option
>>>>>>>> at all may be misleading on x86.
>>>>>>>>
>>>>>>>
>>>>>>> I check the build scripts, yes, you're right. For x86, EFI is not
>>> a
>>>>>>> selectable option in Kconfig. I agree with you, we can't use
>>> Kconfig
>>>>>>> system to decide to enable EFI build for x86 or not.
>>>>>>>
>>>>>>> So how about we just use this EFI option for Arm only? Because on
>>> Arm,
>>>>>>> we do not have such toolchain dependency.
>>>>>>
>>>>>> To be honest - don't know. That's because I don't know what you want
>>>>>> to use the option for subsequently.
>>>>>>
>>>>>
>>>>> In last version, I had introduced an arch-helper to stub EFI_BOOT
>>>>> in Arm's common code for Arm32. Because Arm32 doesn't support EFI.
>>>>> So Julien suggested me to introduce a CONFIG_EFI option for non-EFI
>>>>> supported architectures to stub in EFI layer.
>>>>>
>>>>> [1] https://lists.xenproject.org/archives/html/xen-devel/2021-
>>>>> 08/msg00808.html
>>>>>
>>>>
>>>> As Jan' reminded, x86 doesn't depend on Kconfig to build EFI code.
>>>> So, if we CONFIG_EFI to stub EFI API's for x86, we will encounter
>>>> that toolchains enable EFI, but Kconfig disable EFI. Or Kconfig
>>>> enable EFI but toolchain doesn't provide EFI build supports. And
>>>> then x86 could not work well.
>>>>
>>>> If we use CONFIG_EFI for Arm only, that means CONFIG_EFI for x86
>>>> is off, this will also cause problem.
>>>>
>>>> So, can we still use previous arch_helpers to stub for Arm32?
>>>> until x86 can use this selectable option?
>>>
>>> EFI doesn't have to be necessarily a user-visible option in Kconfig at
>>> this point. I think Julien was just asking to make the #ifdef based on
>>> a EFI-related config rather than just based CONFIG_ARM64.
>>>
>>> On x86 EFI is detected based on compiler support, setting XEN_BUILD_EFI
>>> in xen/arch/x86/Makefile. Let's say that we keep using the same name
>>> "XEN_BUILD_EFI" on ARM as well.
>>>
>>> On ARM32, XEN_BUILD_EFI should be always unset.
>>>
>>> On ARM64 XEN_BUILD_EFI should be always set.
>>>
>>> That's it, right? I'd argue that CONFIG_EFI or HAS_EFI are better names
>>> than XEN_BUILD_EFI, but that's OK anyway. So for instance you can make
>>> XEN_BUILD_EFI an invisible symbol in xen/arch/arm/Kconfig and select it
>>> only on ARM64.
>>
>> Thanks, this is a good approach. But if we place XEN_BUILD_EFI in Kconfi=
g
>> it will be transfer to CONFIG_XEN_BUILD_EFI. How about using another nam=
e
>> in Kconfig like ARM_EFI, but use CONFIG_ARM_EFI in config.h to define
>> XEN_BUILD_EFI?
>=20
> I am OK with that. Another option is to rename XEN_BUILD_EFI to
> CONFIG_XEN_BUILD_EFI on x86. Either way is fine by me. Jan, do you havea
> preference?

Yes, I do: No new CONFIG_* settings please that don't originate from
Kconfig. Hence I'm afraid this is a "no" to your suggestion.

Mid-term we should try to get rid of the remaining CONFIG_* which
get #define-d in e.g. asm/config.h.

Jan


