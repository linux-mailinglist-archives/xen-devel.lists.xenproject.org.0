Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDBC4B8454
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:32:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273856.469145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGfG-0005Ad-Bi; Wed, 16 Feb 2022 09:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273856.469145; Wed, 16 Feb 2022 09:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGfG-00057h-8Q; Wed, 16 Feb 2022 09:31:58 +0000
Received: by outflank-mailman (input) for mailman id 273856;
 Wed, 16 Feb 2022 09:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKGfE-00057Z-Qr
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:31:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47ca2a67-8f0b-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 10:31:55 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-43aNQJFkMeGe5ldx6NGTZQ-1; Wed, 16 Feb 2022 10:31:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Wed, 16 Feb
 2022 09:31:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 09:31:52 +0000
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
X-Inumbo-ID: 47ca2a67-8f0b-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645003915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c79745g9q0twoP/jWmR0sZSP30p4U/aPeUSqit0aOCE=;
	b=WLjjAbQARMd34cRN4whuJqjT93mvEqZxZhrYUQkas2AF5sVG7wmLGY63ATzyJPyL57xUdT
	3th5qabRFbPugDXJLvx2rSI2aS/LAmH9gQJRUeHUjwF0qezAhVBYHs4xqemPpjT04mR2ln
	+3kPuhQFtlmHEEGTY1eCxlNqDp1g3X0=
X-MC-Unique: 43aNQJFkMeGe5ldx6NGTZQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OegDvY3c0ZkB7qvZM+IwiS4/tRZZT9dhLj/D5eBt6nOSiMVJBZt4xHDbsYOl+HCoiiJ9P7Huy5i6T1KH0+txDWl4CyFt6diVzWbGKY0yoaUL+Gy3ctdxiBQk3ofSj5Tl/uybbZSUjLtbNn6wqLw7qe/zLwDYPc3ZVFRFjaXO+Dten2T3h6XRr8e6Yy/9VbVTDBRT23z1tI8T0ecXhaDNO0kSJ96U9AvhBJTjWr57WFTyCdb7kx9eS6dkkZVuEwo3KZrBN8eB/D8PFInMgWgDIitAn0Mynuw1DBA7FgC9bKUBhmIXGj00Dfh6T76/g3QjbQTHDXWu8SpVL285SOW0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P30MjygsaVXtlrX+n1Cq0GmO52L4wdwdMSAOZo9PDnk=;
 b=eeeVAUQ803bpaqXrEF6Yue3H93aixCXHyujzb2qQNamz0Glsu7vk0lClfjIzmc/VWHdDYCsDlYODVbZ3vIJK/2PeTtIugoz99RdTmr9ThaVSa3NWBy6Yv6hVCwmy3UTC566x9/tNsuMJ4HAxBIeid3iVgpOrsMXbRbLi5G12zh7CRWG7Olcd2X+/J9IVC5uZwCYBYeXUBz/8f36nKfPwDk8EAE0TaxdPMERTQvRAtjlOdp8yKeYEhidBFeZtv1lEF9L9k2Bix8IDLm7uDfLajtz0GQMZ0bY20Du0Abh0ln8uNnBZEZ1qz7R8S9f+PHX56QDHsYSuLISa9It4lvA3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
Date: Wed, 16 Feb 2022 10:31:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] lib: extend ASSERT()
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 313251b6-f1f1-4ea6-f2d3-08d9f12f2a08
X-MS-TrafficTypeDiagnostic: AS8PR04MB7541:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7541446888B7B9C64703A38BB3359@AS8PR04MB7541.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cK1c2WbXl7h7EXvjadXxtJnO4H9K2j9XW70IuhU11vR1S5lCnyVgQDpDgxh9jNq02ST6Q3NjMCf5V2X4OwbnhrgJk581URi8FHoXQM2G2mHWuyu156qz7Cn/AI8yWJFB9M8EJ4ilhlHFTWeppPMK1tZfTpXdAVluXG4uUB535qcD3K9c4jGR+sGIiXQs2IFl9dnVYyyOiAF8XMBOopEyJV1AotuCWCDO1gnpVNJESHN3FLx6rTh2VRTv9BZss7vdop2Eidy9eZK4xxoLjZTXUZV0nr6mPPJ+vt1acs2TMUispRtd5MNKbcuhoHXQFTSUmf0KZLV1MNCcCGPErpsDq9S9TCNSkwT8vIyWHqYQlDucJcrIQUuei5qtMWM5OfFRB68nt/egQJ8JGH3DIB0bNXxXKAQese75kbcGZxeRBYziuFDCxUt9kJVar1x4v2BpwGs/X8be7zOupB0g5Z9CkncY4HgtTt/ahaub+fvuWRMyW24YDu2mhZe1+nSMGdA2XzPlSFi168wz5a2wXBa2kGeID+NS8q67xRXAR7d5zl6SCzZZN1f1kAETvw6+9lqWo+pJEho0Tp03OUKBpUaFORyJ8M2oWaT9VkAsbdulW8EQjoNKMg81jgaPs/HxPEGHMAuhDn3Wawuceoal6FNN7Zt/wZL9kR2Il7xrUMvcktYBlVcDPjpGnI+TMnaxYcvFSDaTzPmbK4Ugf+E5Hpanh/WODufXxMQRxFXJfIDWrYpdJd2YE53ijf9oehYqPw+Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(186003)(316002)(36756003)(38100700002)(6506007)(31686004)(26005)(6486002)(53546011)(6916009)(54906003)(4326008)(8936002)(83380400001)(8676002)(66946007)(66476007)(66556008)(2906002)(86362001)(31696002)(6512007)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TiairKT7D4R0hpa/lq78O1coyPJLoSs6SWG0Kj/0XJkp1iZJU7IpypDzpj9X?=
 =?us-ascii?Q?OB4qXJNi4fgVnlYPg2EOrqiFSnd/csgK2961vpYRJlyx8XQxnfrE4719h3lM?=
 =?us-ascii?Q?bQc/ZVsjlN1Kdu014/7lbEy3UXDmk+TDpLuAcPHgz6hXMYKzY1JP/TMuYVHx?=
 =?us-ascii?Q?sLuQbUOpmetCrVDYRuVg+Jj12X/fgSk1PN3fmFqOCpV8gE/ffDC/5AZQ0PVw?=
 =?us-ascii?Q?WXRlhAoU3nlP71c6Fj/WoEXKgWIp6KQ+qoJKkFA/y78lwLNWc6rM6In/Wdxu?=
 =?us-ascii?Q?pQtgEVCMCk1NLsSeHApaZ6mPr9xcxxZGeDqsx1HxYoDa5p8+te7S0MFp/+2v?=
 =?us-ascii?Q?4my0FXrHgS1KeLby0ksHK16UJveZP6qqgAGgOX6hM4S8xbpFxkc+6c4h6qRB?=
 =?us-ascii?Q?IliLHCFjxF++zTnTOIu2m7SsYpvq+ulvEm9AYeSWzuUyrUBKLIzJV+Ng8ozp?=
 =?us-ascii?Q?pgohn1AlvidgRZ65IHnrGHoumonWnpfPdr/QS4BSwgQHsGbEqTkn8s3QrE3P?=
 =?us-ascii?Q?PcfJAZKq+EV4DN/57fhoQOgb/Buz6Ml0+N1oSCa1ttwLInWvHP8FPu4giFgx?=
 =?us-ascii?Q?egbFz05Fx7YCrqlYp+5fUY6Si7FfEnCN4uqg5L77Qr1vggOW9OE1k5cW1d8D?=
 =?us-ascii?Q?cA9qonyNAk0tnwkaB1npFFhoWWHlJlSanOwgjYiwd/21n2Ubncu8slOeVkJc?=
 =?us-ascii?Q?VUw9QmPB+N3H4W0goX6C1sN3I99TY0rPjefXqqZH+dANkehnwhdEugO3W3ij?=
 =?us-ascii?Q?fl0AikiaftiA19LqetMo3sbkYzdv4C6yYqzUs9DsJTlIgfjduW1cCLPFMdPc?=
 =?us-ascii?Q?R6sDEXBpcWrXSp5eoFV702YS6BYZr35hL3p60USC1oAah18tSwLWycuvhyBB?=
 =?us-ascii?Q?tlY+I6Vz44JEixgtxTMrBvW5lvPuml4FEXfAXCiilRSfn1ItXYVZ1DmCDUVq?=
 =?us-ascii?Q?8gshg/zDVRuDWpP02Qs3uTl1QMJeHaU5i8Mb+xTTqpjnYVd+tgRFZnjpaldp?=
 =?us-ascii?Q?MczHHZy/9Ai+M5QWIoNp1k5+Zecfac5zzjyLWJrGGtO7R7L2+9uju+JEf2AR?=
 =?us-ascii?Q?BQCYj+a+rcAVJ7tBjhgo1IuAptYwYlsEUgoITgfQNkQzO222Z486nQejZdMp?=
 =?us-ascii?Q?rRKAnSFYH1Cwzh1aPKuoCx/cDJD1Xp3BuGpmn1h/R6dTUTN9bLEQO2QiR1So?=
 =?us-ascii?Q?IzFJpxhRYp+M9Y8j+NCH0asx2k6z+vYPIvyDS/+lN4VLeA0HXOLY+I0GQstX?=
 =?us-ascii?Q?GNOX3Avt8WJd/kk1qPz3yKKYyKt03HejbnQ4HjO7csrCvZl45MC9pmxcGWZ4?=
 =?us-ascii?Q?KNFgAUYFacCYjGIg4VXTDZRlech79yWI0PBRvmAyWxzCc9w3qb9tcbqcwv9a?=
 =?us-ascii?Q?kwqLHOactTN9TubQiLmF51XrjsXsUqjRSnrEYqsNLH3aaA1kcSKSQQ25nrqE?=
 =?us-ascii?Q?o9DNOdCyLn+Ypu5sF2lmQvk8msPGce7Y3DEwRajaCIIWycknb2ieEJ68/voL?=
 =?us-ascii?Q?fOCUXGvMKNJh6eGR4KP+x5upsHI3xVe3Iw2nN2leBMMhXDaDjXYNL++qkz+z?=
 =?us-ascii?Q?lnS8a8pcBKdGRoNnESAtA6CXgZoE3PEABKpVsFxYiBhDs8jp5ZtXDdtDDStK?=
 =?us-ascii?Q?HeRssCTgq5dZal9A4JT8o/Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313251b6-f1f1-4ea6-f2d3-08d9f12f2a08
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:31:52.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElfZps58EBn0MCxadf15B3DqxXQgsqsggeQqaSvJ/wnFKMAWdoVIlhHvUamHH88dG+FifGy8IUk/a9QyGJAHAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541

On 16.02.2022 10:25, Bertrand Marquis wrote:
> Hi Jan, Julien,
>=20
>> On 15 Feb 2022, at 21:00, Julien Grall <julien@xen.org> wrote:
>>
>> (+ Bertrand)
>>
>> Hi Jan,
>>
>> On 27/01/2022 14:34, Jan Beulich wrote:
>>> The increasing amount of constructs along the lines of
>>>     if ( !condition )
>>>     {
>>>         ASSERT_UNREACHABLE();
>>>         return;
>>>     }
>>> is not only longer than necessary, but also doesn't produce incident
>>> specific console output (except for file name and line number).
>>
>> So I agree that this construct will always result to a minimum 5 lines. =
Which is not nice. But the proposed change is...
>>
>>> Allow
>>> the intended effect to be achieved with ASSERT(), by giving it a second
>>> parameter allowing specification of the action to take in release build=
s
>>> in case an assertion would have triggered in a debug one. The example
>>> above then becomes
>>>     ASSERT(condition, return);
>>> Make sure the condition will continue to not get evaluated when just a
>>> single argument gets passed to ASSERT().
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v2: Rename new macro parameter.
>>> ---
>>> RFC: The use of a control flow construct as a macro argument may be
>>>      controversial.
>>
>> indeed controversial. I find this quite confusing and not something I wo=
uld request a user to switch to if they use the longer version.
>>
>> That said, this is mainly a matter of taste. So I am interested to hear =
others view.
>>
>> I have also CCed Bertrand to have an opinions from the Fusa Group (I sus=
pect this will go backward for them).
>=20
> Thanks and here is my feedback in regards to Fusa here.
>=20
> Most certification standards are forbidding completely macros including
> conditions (and quite a number are forbidding static inline with conditio=
ns).
> The main reason for that is MCDC coverage (condition/decisions and not on=
ly
> code line) is not possible to do anymore down to the source code and has =
to be
> done down to the pre-processed code.
>=20
> Out of Fusa considerations, one thing I do not like in this solution is t=
he fact that
> you put some code as parameter of the macro (the return).
>=20
> To make this a bit better you could put the return code as parameter
> instead of having =E2=80=9Creturn CODE=E2=80=9D as parameter.

Except that it's not always "return" what you want, and hence it
can't be made implicit.

> An other thing is that Xen ASSERT after this change will be quite differe=
nt from
> any ASSERT found in other projects which could make it misleading for dev=
elopers.
> Maybe we could introduce an ASSERT_RETURN macros instead of modifying the
> behaviour of the standard ASSERT ?

Along the lines of the above, this would then mean a multitude of
new macros.

Jan


