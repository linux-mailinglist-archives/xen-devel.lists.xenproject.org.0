Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7604B8BB8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 15:44:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274180.469548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKLWt-0004j5-Kv; Wed, 16 Feb 2022 14:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274180.469548; Wed, 16 Feb 2022 14:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKLWt-0004g3-HP; Wed, 16 Feb 2022 14:43:39 +0000
Received: by outflank-mailman (input) for mailman id 274180;
 Wed, 16 Feb 2022 14:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKLWr-0004fh-7t
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 14:43:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1de4989-8f36-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 15:43:35 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-Xsx89txWMfi30zhvZTjDJg-1; Wed, 16 Feb 2022 15:43:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4627.eurprd04.prod.outlook.com (2603:10a6:208:74::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Wed, 16 Feb
 2022 14:43:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 14:43:32 +0000
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
X-Inumbo-ID: d1de4989-8f36-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645022615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEqaFPcMnLRpPtrqqKwl5PootIdzOxCejeffTEfXtMw=;
	b=bbTn4CEwNB/3FOavdkb4Wao9jm40dzbXg/6iPirOEU1cIABRS0LSBBLA8t9w+Qb4jfBknA
	QnaLMSmOgY/+hGBAZmI9To/WFG9INqOycdmN3DxAUEMkGYMKUEqbDsZhq3jg+iBIV3Y5rD
	b1JrsZ3QRedMbqRh1Gm2GyuU+QtzDeg=
X-MC-Unique: Xsx89txWMfi30zhvZTjDJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrxKd/7njuxBF6NdZAyphSxdBZOo8brXd9vBXe3LRlNB46Bnzz6MInnkI2S7WkNlt7qAkIt9wBNzYdFF4Gpklh1eqdulcXp9lbPPpAUjnU+gX58ybq9M8IZ6TDqW83dtWQHXnt2wVOoOYuxgGZioSmML90kN/A+ha/h2opQ3Ty16wRMlZe1ZG0CFhFy3lQXjkOhY4H8R6OOLio1edcxEXHva50mu0EokXgOeS3EPHOm/K3M/Wu2i2nOLdHQUPdoa1Oy3BT+fQEuxvZjep6VpUDzt8/Qv0/rojoZKS0cHwM/g3a1SdkBv0Tye3fbhKGh3JwWLoBVnNRsPfPRNg1PeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukggLmPAsPBBymEjnVYTANgCficoCzGImsSNJK0N/wQ=;
 b=IQ9o5Y7Btra93lNcZBajzab9qV4Q59OUNn7WSsaOaoB63wEhnWY5axntBf/7aYX/POrnm7tqC44x5virOw1xMQ9t2EE1Z+ez+ikhIHAl1v6ITgD78unyCgGGMIp+Pxt4JrIXLb4ZbgsNJTMiRiHtJngP5HCEpmpUcTPmdixNzIc8hdsPLz9D9YEq1uHD5rbTXXL9ig3iruIqGXMvcVz835o819OhofiBKrWWopewnPtiBZZlQ6GqQvCCq0SB8+zbApV/pn/9oFSNfVYs9qMa2JWo2HSczq5ld2ww0nfDdwz2uykvSPk3ofcA+JiGW9mrzyHY/TjF8oEwAcoAIAjoMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99ffa08c-8482-12d2-0ca9-eccde97ecac3@suse.com>
Date: Wed, 16 Feb 2022 15:43:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] lib: extend ASSERT()
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
 <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
 <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
 <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
 <FEF187A8-0A09-4D50-A0E5-F46E014DB3E1@arm.com>
 <63811bb5-cce4-d542-461e-a24926f01b34@suse.com>
 <0BF64A25-F218-404A-8547-4896FCB27E2C@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0BF64A25-F218-404A-8547-4896FCB27E2C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40a2fece-8637-4939-fa14-08d9f15ab471
X-MS-TrafficTypeDiagnostic: AM0PR04MB4627:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4627CCB1E623162825FFFE39B3359@AM0PR04MB4627.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LhmGAOEepRFVInL30Iw30yoKkO0bzJQRJr7awUBPy6YxkB+d1pQL5/AbHK1jjYUkkbqApfZ1A9ct27Eas4mmSN36K/ZEB+E8UYdYvs5v+pnI9embVAPFVtqvKKWEHnNx/LRS/poYlM2mioPuuGo2rz8FLvCEPLRksmhSUsIm1o7E5NJ3P03cFlOmE7ePLTpxz0SPT7TW1DnFMC/0jOvlf549j879pmWep/ZX+8fu3QvhrGoFxBSK/0Xn9yLnBwSGyv+4MjicQw4RzXcWbyZlBscmPD3HBx+9TsZ2uV3tcH/g9clrts6XzLp1p7s1Ub+zYPaLqZ4r3ZXuunaaJ16TMFEN3uqe7MbDS3an+p3KPfRGriKsnrpVtNZL+mQ945GM/rRPyTc7qyvw++FcH+VpbvKUf9uBEnk1is0aNdNrJT0FGPG7pqboeq2h8PaByxfEOLB99ajYet/2Hvpopg2C9l9/MnS5o8Kq9++NggvtVV4HjS28C5B/aOeLz2GurSbC+33LZKvdB5zHkpXmnyTyQkeUZsC2AJIonIRub6t9O9boN66e+/lJDUMJAJVWWFQMEtnPxDb29/o1zcK+IDZLc4FQZX87nYWqaMvEwmCli+/TaqFfD5SiE1gRMm8hYOgZyyUb4GxKj3QY3Jf8IG0sn15bq3SfeDypJPhdZ08x4K4USwWxpo+INh7an+4kC4yH9GH+tGJpgLtLpo6ZG59yVK5pM7TE6AegaNHirXbBWXKozBgsTerKoGYBWbmUjRqw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(31686004)(26005)(6512007)(2616005)(6506007)(186003)(66946007)(38100700002)(8676002)(4326008)(2906002)(8936002)(6486002)(54906003)(36756003)(6916009)(53546011)(66556008)(83380400001)(508600001)(66476007)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bh2xunCSnkOSCl2MWRkE3TwlBt9C/nfCcKPdKzls8hv/aC74yAiorx/xjYqu?=
 =?us-ascii?Q?R/wcNCaFAx7CHCPUltNq9TKF06kRoGmiBfzr50EeEyUctJk/W9yaFfkTEq4Y?=
 =?us-ascii?Q?ItrGPO7dG11vakQs7DHcGeivFdSEMvmUTLoRt6lDPeMiACpaYY7pd8T2k0zG?=
 =?us-ascii?Q?HA5ibiShAWzoGjBKJ5H8o+dJw9wzFtOE+XRE0BpOJPN/GdNoQU6VlTJsB6GU?=
 =?us-ascii?Q?leeQrnjh3HfF2VddXWCOt50QAg8/lhNhjBUDdmVoZqFG7GRjx0X6f9Z4flMO?=
 =?us-ascii?Q?ZSGKMIv7Nfa8M3JGPGnybPWnZCN1KCXSZEbkFWlYTTqVBJ/TUozDLQ/SEHKC?=
 =?us-ascii?Q?8k6h5uLfngs13b9G7Jl3VjQyq3eMqhQy09HTQguaR5Yi7JnGzJ4QY8FotiCK?=
 =?us-ascii?Q?IBHgoM4EggYjbTkUY3fDuZa9jOwrB3vyrb3fNURfWtroqJAhFbcMPVOA/4tm?=
 =?us-ascii?Q?0pKO0Ct44afIsmGcsAQj2ZNP4YgkD0ZesP0D6tvwrDOA0eX7pKCBO4BRAP20?=
 =?us-ascii?Q?3rPFUVUWzOTEQJ9DwDt4cPbcbSPJZ2/eAZnAfXEERHrAOTAzYln4ppGsk5Fd?=
 =?us-ascii?Q?2bfG2Ikx3dBLSZHbw9lqjbu8DzIQhEcJ6isf1yMXhVPNrwSbd0kLgUuJaIMr?=
 =?us-ascii?Q?x+8MdQzjcwUNkyqZ8UJpxQbxUVejhsBwwvjMa+1SXAhD/mVy9MpFzqtSB3iC?=
 =?us-ascii?Q?v1UpcmT+9w3MUUGU6hxPDiU6GbUxKDwwFdOO1MLM/1ZrMnWLwv49qA6PQp9K?=
 =?us-ascii?Q?3UirCNTbClekSjqA6NNxh8rzj31SQuC8KSIe49ivElMsDozl9Qk28l6gcuxq?=
 =?us-ascii?Q?FHVDnmBp0obUZ/85uOpixGVbI4IDGN3sG9OpZtucKv/B2XRYpLr9E3hd4r2R?=
 =?us-ascii?Q?AZ52F53CwAQQLsKQrCu0EuEUaJn/rkMeMRORVHZ7j/5cQRR4rEgCy5txxssW?=
 =?us-ascii?Q?/DyIr8jmgy02/BXWYmw/Y3mPI7HuU2qZRVI8f2AFf4Pz8AVXc6JFUGC8ZvG+?=
 =?us-ascii?Q?6Ezv/RCgo03OZdw7EolMnUi+T85xerQd8ZloYpPV8JCV6675w4xpbLpFlun6?=
 =?us-ascii?Q?lwPiOzEeAdS5WXUmEDR7FtPHCIPQlDGnFc6XDGgIIsO46KMq47dAJgvbsKZX?=
 =?us-ascii?Q?xYasMTSjb+ebSdsc6BpdceUCOGZzuCsEPi/dNOKVwkRSo3qEMtjpeMdtZi15?=
 =?us-ascii?Q?95PmldnsGTjO6Nvf3qZe6R0ODLR1YVZ84QTjHYg2BbvDNg7peNxieBDqFhAc?=
 =?us-ascii?Q?9ZZSzeZ2eEWD1A+Tw8PLBGWgpFjInottJ7+XQbzNAqpLJJG6RKNeGX6+XkHN?=
 =?us-ascii?Q?05dnNxcFYdUAKAxDFYEQ5r5d51aGjCl40Xn6syq3Z/xyBCd3f8lwaEPsvRcW?=
 =?us-ascii?Q?raYaw55zjlwi3U/RQ1O3+iPehjZzURSlYOLFAvfbR4he7XUr++BDIDg940Kj?=
 =?us-ascii?Q?K9weP1Z6Fug4D00RgI9GnMTIBk2KtE2w5BBlpFCyFk94M3yahSPwyyh+se7O?=
 =?us-ascii?Q?qneO4myKhudr14jsp54jfABkZQisdbOmW5kesRPkSG2UXKCyiD2F4ttE4Fp/?=
 =?us-ascii?Q?6G2jP4PEtF1wmFjAQk3eF9NirpQjz1h6N25yZDuhyEi0jdRf7ChItXYcdvcn?=
 =?us-ascii?Q?gR1lzsShvvgZNfh/7uhT0EA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a2fece-8637-4939-fa14-08d9f15ab471
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 14:43:32.7292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmQIpLVMANkobZRPxi1LEoM0SjdO8a4nanysCfbNy0qvtWkaVuhT8xz4kfSCpCu6E++7Ku2hrVtTw/u3UfdBLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4627

On 16.02.2022 15:35, Bertrand Marquis wrote:
> Hi Jan,
>=20
>> On 16 Feb 2022, at 14:03, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.02.2022 14:57, Bertrand Marquis wrote:
>>>> On 16 Feb 2022, at 12:23, George Dunlap <George.Dunlap@citrix.com> wro=
te:
>>>>> On Feb 16, 2022, at 11:42 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 16.02.2022 12:34, George Dunlap wrote:
>>>>>> I am opposed to overloading =E2=80=9CASSERT=E2=80=9D for this new ki=
nd of macro; I think it would not only be unnecessarily confusing to people=
 not familiar with our codebase, but it would be too easy for people to fai=
l to notice which macro was being used.
>>>>>>
>>>>>> ASSERT_ACTION(condition, code) (or even ASSERT_OR_ACTION()) would be=
 a bare minimum for me.
>>>>>>
>>>>>> But I can=E2=80=99t imagine that there are more than a handful of ac=
tions we might want to take, so defining a macro for each one shouldn=E2=80=
=99t be too burdensome.
>>>>>>
>>>>>> Furthermore, the very flexibility seems dangerous; you=E2=80=99re no=
t seeing what actual code is generated, so it=E2=80=99s to easy to be =E2=
=80=9Cclever=E2=80=9D, and/or write code that ends up doing something diffe=
rent than you expect.
>>>>>>
>>>>>> At the moment I think ASSERT_OR_RETURN(condition, code), plus other =
new macros for the other behavior is needed, would be better.
>>>>>
>>>>> Hmm, while I see your point of things possibly looking confusing or
>>>>> unexpected, something like ASSERT_OR_RETURN() (shouldn't it be
>>>>> ASSERT_AND_RETURN()?) is imo less readable. In particular I dislike
>>>>> the larger amount of uppercase text. But yes, I could accept this
>>>>> as a compromise as it still seems better to me than the multi-line
>>>>> constructs we currently use.
>>>>
>>>> I see what you=E2=80=99re saying with AND/OR; I personally still prefe=
r OR but wouldn=E2=80=99t argue to hard against AND if others preferred it.
>>>>
>>>> As far as I=E2=80=99m concerned, the fact that we=E2=80=99re reducing =
lines of code isn=E2=80=99t a reason to use this at all.  As our CODING_STY=
LE says, ASSERT() is just a louder printk.  We would never consider writing=
 PRINTK_AND_RETURN(), and we would never consider writing a macro like COND=
RET(condition, retval) to replace
>>>>
>>>> if (condition)
>>>>   return retval;
>>>>
>>>> The only justification for this kind of macro, in my opinion, is to av=
oid duplication errors; i.e. replacing your code segment with the following=
:
>>>>
>>>> if (condition) {
>>>>   ASSERT(!condition);
>>>>   return foo;
>>>> }
>>>>
>>>> is undesirable because there=E2=80=99s too much risk that the conditio=
ns will drift or be inverted incorrectly. But having control statements lik=
e =E2=80=98return=E2=80=99 and =E2=80=98continue=E2=80=99 in a macro is als=
o undesirable in my opinion; I=E2=80=99m personally not sure which I find m=
ost undesirable.
>>>>
>>>> I guess one advantage of something like ASSERT_OR(condition, return fo=
o); or ASSERT_OR(condition, continue); is that searching for =E2=80=9Cretur=
n=E2=80=9D or =E2=80=9Ccontinue=E2=80=9D will come up even if you=E2=80=99r=
e doing a case-sensitive search.  But I=E2=80=99m still wary of unintended =
side effects.
>>>>
>>>> Bertrand / Julien, any more thoughts?
>>>
>>> I think that having macros which are magic like that one which includes=
 a possible return and the fact that the macro is taking code as argument i=
s making the code really hard to read and understand for someone not knowin=
g this.
>>> Even the code is longer right now, it is more readable and easy to unde=
rstand which means less chance for errors so I do not think the macro will =
avoid errors but might in fact introduce some in the future.
>>>
>>> So I am voting to keep the current macro as it is.
>>
>> But you recall that there were two aspects to me wanting the switch?
>> (Source) code size was only one. The other was that ASSERT_UNREACHABLE()
>> doesn't show the original expression which has triggered the failure,
>> unlike ASSERT() does.
>=20
> Sorry I focused on the macro part after Julien asked me to comment from t=
he Fusa point of view.
>=20
> The usual expectation is that an ASSERT should never occur and is an help=
 for the programmer to detect programming errors. Usually an assert is cras=
hing the application with an information of where an assert was triggered.
> In the current case, the assert is used as debug print and in production =
mode an error is returned if this is happening without any print. Isn=E2=80=
=99t this a debug print case instead of an assert ?

Depends on the terminology you want to use: Our ASSERT() is in no way
different in this regard from the C standard's assert(). The message
logged is of course to aid the developers. But personally I'd call it
more than just a "debug print".

Jan


