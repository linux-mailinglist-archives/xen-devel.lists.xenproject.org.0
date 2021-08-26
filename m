Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAE43F8769
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172989.315654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJESY-0007tc-3c; Thu, 26 Aug 2021 12:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172989.315654; Thu, 26 Aug 2021 12:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJESX-0007qA-VG; Thu, 26 Aug 2021 12:26:17 +0000
Received: by outflank-mailman (input) for mailman id 172989;
 Thu, 26 Aug 2021 12:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJESW-0007q4-50
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:26:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdd21c5a-0668-11ec-a9f7-12813bfff9fa;
 Thu, 26 Aug 2021 12:26:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-e0W3pwtSMcqsCerqXpIuvA-1; Thu, 26 Aug 2021 14:26:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 12:26:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 12:26:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0015.eurprd09.prod.outlook.com (2603:10a6:102:b7::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Thu, 26 Aug 2021 12:26:10 +0000
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
X-Inumbo-ID: cdd21c5a-0668-11ec-a9f7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629980773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fr+xiIW5gsMQWJe07vdnAvt2jbWi1NGre8SNZn8xkYk=;
	b=CIr/7LzP3mlZyQzihIehYzp8nOu3S+Fda8MdjwAFt4ex1zoW/O1yvVuqvM43qa5DolA46r
	+KuGAxsVw5zw4Uo5Aa/2dqvm7o6YBBsSf+DfNSaRNNFs3mFvkf1oXgIE8K8L/d9iyQQKTh
	0WSUCLAd9g/Ku4iQSUSeMwiDzH0GCZk=
X-MC-Unique: e0W3pwtSMcqsCerqXpIuvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSDH82o8p6F7H7tC53Gz6jgAoLr0qryyPkqRggPLLRgLBtwbLNzFmqIzH2O3JBjypApwMHE8hf/3NJ5wm8c9Ndk61fo4p+rE9JURU26fNYzxAKyDCD7Pl9fxvicsR8DVYFjEMVJwcQYgcFHAce17jLcpHw+r4EmXhpfTf7xqrMTTOK44QShES/HWhkd+uY0KK80+7Jb0MkdMRWtORjp6WpxTmnJVPU2FMquNpBR4whHzTc6V/quf3dkVOsXnOtrup1O5H4Cn30KTANXSRB82uXG/Yuh+i2AbwcruXtsTu8scm5vm2vfpOcoqbX3ahCYo0eoQNfUbss+pkLOuMCXi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUMf2oJZu4O7aqddxSDdsmynusLi89OLN4iA7Qnlc+8=;
 b=SWm3DzYHJpExACavziPxdBrEu7O9a6d914d1bXngNeSrMEpGxFKhFhZTk/JBHDCahrLxLBxTX4zvOpBjn/QPY1Aea/HwJZwf3GKgx2JBglwI54brzyBAXOMTyka6tPSqB5seJf9T8P6TxOxy/8PLZF45OqmP2+owwITcOAQsOvJ0h3gt9vNCphY6R5htrEB45hw/KeE/ePFbHHi3b86CGCeKOayBiL77FfdFF7kaoNjCZGxM8lgmXwFm4rmasFLb391kg86gcKZfJLD320WTvoMyx+1DQ/anzqd5/yZ8++3LfQeMem2GwIxvGpJ1vQln3LC7tWpxmsLvaq2nbU99Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to NUMA
 system
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-27-wei.chen@arm.com>
 <35a57b18-4fab-522d-f39a-de21017abe57@xen.org>
 <DB9PR08MB6857FC8EA8C0D324426408709EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <d7ea4260-aec5-efb5-32e7-7f73d6ee206b@xen.org>
 <705eae88-2cb1-f3a5-3190-dd4ed553fe36@suse.com>
 <DB9PR08MB6857D887C97A40E20F66B4069EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aba80d06-562f-32ff-51f2-471dbf2c9afa@suse.com>
Date: Thu, 26 Aug 2021 14:26:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DB9PR08MB6857D887C97A40E20F66B4069EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3PR09CA0015.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86545f92-a04e-40cb-ff86-08d9688cb02b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384BE94311B98FCF68B0E6FB3C79@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fLZxoPLnhDYc+ejnJNIYCDSrpTvNinEOpwIIvXk/AY7MtvR4y+AZuoDE1jnVCv5pXP5SVrAoldd6sEjKLnz1K+QwfCOanzpn7IiZtbMa11A+GG6boRMJDRK+x1cVwB0TQP2pMJ2qc7uGFeazpRjWzZbZt3SkNHaGH7N1anRq7weVW/bV86El2GbH951sUHSQ6ivJ422NFjhdJFg3KMlwVGCjYjOiFl2xmSbxcZ088J73s668w/z960RvQN94oZdBlxX+VF7oBnhhKYNyVCzGV7N6XO5bZWrOwbgpCFymRnXgQsikjPhkZd0iQhdex3yrEApOfWOz3GVs4QU1p2q04TMYAwtI6ImuA0z/MyZQFNgJZ66Xi72tyNGbqXPJA7P9J5ppG7ziZ6avkTToHXdZxqmj7xC8gBjiR4sbY34fVwlpxNy+HFGyNeNVONq5ZicGCy3zHqsFPVZakUcOzEjy1aFGGlmKh+g4zgwwXwPEHFtiRMbBE28MD38BntLas1nh82Y7nCfwqzbhZHWmXruSpL3jvFdBdmclSju7Q84AUcIOo1wdHz2fvJ4zmgZGZNgT0mvmaOLMHPH6sVMMV2W+n+fllhFyHoD1aE+J5oO0FB2aGuDQxcySS/WdXT7ScnFz+P5NWfWB5IGHc0jE+7TtZe7aZO96kCP7Mh7M8r7bz+R7cxYXj6bxcIPnTvulZ6jsFDmu11FInZZicu13r5nFFEhtFhOdRzFi6i2QR65o5qU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(376002)(366004)(39860400002)(26005)(4326008)(6486002)(2906002)(2616005)(8676002)(478600001)(38100700002)(31696002)(8936002)(54906003)(6916009)(16576012)(316002)(186003)(86362001)(5660300002)(956004)(83380400001)(53546011)(31686004)(36756003)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I29uK2U8oVhzBu5GaV6HBh1kJuIJGb+3vh79nopaM+VujszCCMDcSm2XPX+6?=
 =?us-ascii?Q?XTo19ldcf6ZDWH7I8Fweo+i6QGVfImM7wfLQXEjq7KC22py4d92kh2OODJ4n?=
 =?us-ascii?Q?/h4pFBP+36+fPxd24QQey4q/wfzMnQirvxuXm0CBP1lxqMj+QXD7CzUR/EA6?=
 =?us-ascii?Q?E9GrWbY6ICJCQV2xuClQ5qeNbFpl8rONXpHHtTfK4UikfCwotJs+33CQDTG+?=
 =?us-ascii?Q?kM0O5e9gJwRDlQ7W/1UzHfe9twyg44AmxPaBYBBO7/Bardiy5okcmKXRTkBe?=
 =?us-ascii?Q?9pjeXGyKY7t+GHNLbd3sZCxWQbPZpQis/p+Hjvihfsx2wZndXDg+9j+T9Pmj?=
 =?us-ascii?Q?nOzQ0BIdPM3YhLORQk/6MUiGusbdKzY1qoGgZtP42pPECwn/tGpy4rbzqy0S?=
 =?us-ascii?Q?iSOqSkg2IFM7jF+HHXJnOiJyXNITR9B6NIg0+e5GFCIjHls6NZo7f2XlBl9P?=
 =?us-ascii?Q?xM8gc6G/syyd0bfaLG0qDzzH8fNNB+OpWwhH1UKtZmaitE5Z+2ALe2/iXBr+?=
 =?us-ascii?Q?YMQorqRAV6En0QYVU3zc7OFkz9EBe2Of7lYqSC2VtBUeWdEYxVET2yftvFUf?=
 =?us-ascii?Q?rcIjfM8ZSzSMfOYxwbIcIspKS0yJVJqaTyxmBhdrtknbb4g8gb5p91MkYAxv?=
 =?us-ascii?Q?I6cF8mRiRfkssdIToTgaaG7reoMtTraoyJUv0+nE4gdpIroesy1JorVFV1/l?=
 =?us-ascii?Q?uKLnGO6nApUOoUZ8QplDpG026nUmZFePwJQCGBDNA+Z/oaJNdGoNQvCEOUkA?=
 =?us-ascii?Q?vMoOmR1FVtbaBhN4yzKb7M1HfVx+NeWCtxcNkOf2Ph2DkNOejpQhbxaj1DBL?=
 =?us-ascii?Q?Y9n+sP8pg5T/yDDISUUpzjkds3QgHrZmNwhk+7vyt6Vtn1dyz4f5F3xrxOBH?=
 =?us-ascii?Q?777HA+iY3mOHQcocB+dcUNhjnPQGlMExr2tyzv3cLT5Lmq6U0f87bhMUk72I?=
 =?us-ascii?Q?SGDp1Bwkoxz9LMpf6ttYoSvTKPnA5fVYFvjYbgu5ToRaWBejrxhxurWUXwsD?=
 =?us-ascii?Q?XSZzrQCSeeyNTxPt0hlTBmBlKufCSl46Opwxq4KHAmJhy8uqG8TeoVkbgAcb?=
 =?us-ascii?Q?Zs2udKLfyhtdTDGwt+1uNxhh0yGieOTPKweMRPZ0sqLEscth7yk4CfxbU3j/?=
 =?us-ascii?Q?c0AsIJsdTIl/WyOTbznEJW5hB6uQPUE092TfeJNYRI0jV3Z+FOcc1deZkbdG?=
 =?us-ascii?Q?CTvaFZ9eUA3Jh9Kab6K6Axf8tXP/RM97jWOVBbQnGNo9LA5h9VyMjJ6utaP4?=
 =?us-ascii?Q?fnX6SF076KXDaeKtjY3sRy0B3Czm9YjxcX/BJ+WxVkBbWFxdJPMHbA1C4oGC?=
 =?us-ascii?Q?v+VlI8yOzvHvb5vtIu+LEFZw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86545f92-a04e-40cb-ff86-08d9688cb02b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:26:11.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6l/DraFSq3ehvASR+kUvjm6bY4KEgdz7KuCh7tKqfzkmi0/MUiCix6zClVQd7FraHmGPupZqgIXUNh1CCeacg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 26.08.2021 14:08, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2021=E5=B9=B48=E6=9C=8826=E6=97=A5 17:40
>>
>> On 26.08.2021 10:49, Julien Grall wrote:
>>> Right, but again, why do you want to solve the problem on Arm and not
>>> x86? After all, NUMA is not architecture specific (in fact you move mos=
t
>>> of the code in common).
>>>
>=20
> I am not very familiar with x86, so when I was composing this patch serie=
s,
> I always thought that if I could solve it inside Arm Arch, I would solve =
it
> inside Arm Arch. That seems a bit conservative, and inappropriate on solv=
ing
> this problem.
>=20
>>> In fact, the risk, is someone may read arch/x86 and doesn't realize the
>>> CPU is not in the node until late on Arm.
>>>
>>> So I think we should call numa_add_cpu() around the same place on all
>>> the architectures.
>>
>> FWIW: +1
>=20
> I agree. As Jan in this discussion. How about following current x86's
> numa_add_cpu behaviors in __start_xen, but add some code to revert
> numa_add_cpu when cpu_up failed (both Arm and x86)?

Sure - if we don't clean up properly on x86 on a failure path, I'm all
for having that fixed.

Jan


