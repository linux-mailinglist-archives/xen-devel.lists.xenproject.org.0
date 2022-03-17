Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902384DC3B5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 11:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291475.494693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUn6F-0008Ie-A4; Thu, 17 Mar 2022 10:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291475.494693; Thu, 17 Mar 2022 10:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUn6F-0008FP-6B; Thu, 17 Mar 2022 10:11:19 +0000
Received: by outflank-mailman (input) for mailman id 291475;
 Thu, 17 Mar 2022 10:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUn6D-0008FJ-CP
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 10:11:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94dd9ef5-a5da-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 11:11:16 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-SBjhr-97PGK2YMIcidY4cw-1; Thu, 17 Mar 2022 11:11:14 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU0PR04MB9276.eurprd04.prod.outlook.com (2603:10a6:10:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Thu, 17 Mar
 2022 10:11:12 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 10:11:12 +0000
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
X-Inumbo-ID: 94dd9ef5-a5da-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647511876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+madevhF2zZVgyj8oCCWeGB9AspF0VxYF+fSbePcGM4=;
	b=B0iVapEk6WiSu8BC6yz5I8GZX364FBYPEk0JZfqy8z1nPK1HuGx6+uPIzcQw94yfIetiLl
	OjZGaD/SDCM4cOdKXy0Ilpr7TNysoZ4j07lcT/t0VvFbeh9MGnglfQq3rdFx4Jhb+fgLOw
	dQKPTwiWU1WW6DeG6jQ6hErLRGF7Em0=
X-MC-Unique: SBjhr-97PGK2YMIcidY4cw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvssoNoR5hga1JwA7riNP78oY7HqBKTUV3MUXqx+MtIbEYsnn7gg1SHA1PYAY3R5ejAXx0vYRuotHZBVMQrtOwHLbPR4cPPVpxHW0qVWMyTBHVDLSCvyiG0V17xiISoK8U8dkPY/GgEgcU20ZUn1+Q2bL+ggD6GC5IX3LnFYyXCUfu1ydoBs83dpbMbTPfjbzr3edaQ5PeTP71r+2DGpr+otBuNIDGWyh+foDqnBj3PeSBRXMfatbVkfTyl/o5fwFSwGqzm8aq//wA7CVtiR27shz7b9y8+b/SNpOcWm8+7oCk+hC0qRQJptNry1SWspxV0eTGbjaNNKMprlVLKeiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciXfkNKFsYPy2ZFbOWkf5THmn8+TOYjlAZNARB2E6k4=;
 b=YdnaP2uRf+fLpytym/HZGm9nPF3TK7JizVbxtEQm3bNG+WPHchBtjOm7RJUywLHmxsQ5w29BkAfSnVg8H5xJp1eh9kQWtVxoiNPv6EzEXxZscClt+eMALKRGTSc1izhTI4rrFpSl0qHXylHuA3EYhmluVwsW3D7tM++G3RzdQfxhyzIxU4i4UM4uR1gynJNMTg6ZNZS5ula23vlSr0lIM+YizI0GEBz1KGiTgW0QkQZV0T9Xe7UfqDab8fWO/ECFgH+ei9MWfNpH/pNEUaXM21Q3Z7TNMEY5G5D9ah0TVbByl0B7cW0XMAVT0ok2uUtJT4CNID1k7r9jVfd73cpORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd743f1e-b3c1-5f46-66e1-f72272aeb04a@suse.com>
Date: Thu, 17 Mar 2022 11:11:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: Jiamei Xie <Jiamei.Xie@arm.com>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Bjoern Doebel
 <doebel@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03798b67ec3a892a302e6be5d87ea676e6376036.1646837462.git.doebel@amazon.de>
 <5cdd27addcec926eb48fdeab08ad3371e7c3fd7c.1646837462.git.doebel@amazon.de>
 <PH0PR03MB6382E2AD10AEF1BC48C55093F00A9@PH0PR03MB6382.namprd03.prod.outlook.com>
 <VI1PR08MB3056A7F7E5DC1DD68212A57692129@VI1PR08MB3056.eurprd08.prod.outlook.com>
 <VI1PR08MB30562C85CEF556F385DF695F92129@VI1PR08MB3056.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <VI1PR08MB30562C85CEF556F385DF695F92129@VI1PR08MB3056.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::38) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c94ed3e-8f42-4e40-2c5e-08da07fe76f5
X-MS-TrafficTypeDiagnostic: DU0PR04MB9276:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR04MB92768FDAC9E6C9D137732088B3129@DU0PR04MB9276.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6mE7cAaG9+juDrhvee9eCJh0el9YLgbMgMpCVA8Gg4nGDkkeKljgHt1BUliUC5d2/AtdgXyuaQPCti7+3ODboJbTW6oIJwLoWw1YMvK1KvhWA1CGdd0n0bxFxp0fI60pC137HHgh5IjES3mx1r+2lYDAI9BlVcbxjBFs3+BSzsY1/5i512xrgY3msSVvemcjeQ703eH0TB73dXYD2ejidRl06nJY2C5VTgACan9htFsAy081lkAcVYBXuOR/6AkCZW1ysqSmd0hHns548s1biQ8VY+PtHC921dC+04auNjsK5rOJ0n4mqxVMaH39pjw/Mzi7x3gNVgvJgdTgVSrhDBS1Fuv23pZn+rJ2lCrmaaVqOIMEba5fWXzdnaDbW5bvhuk7l0VYqEW6mBEUQUhuTBtzU6WvSPrDE3FIVidJ8ef7SdGE4vhus+wvHJ94u2Yad3//ENh/imi0ZttsVvdIn/FHVzg1ukG0O2DVh3XAHYf6/6qqRXt/vkcZ7L+JGlXpNyhOf+SNIO6TigZKzjeR4uLqmL5ZIk+yV4HI1uCctD0VHzW63VReEhDNUvLz4Dh0raQkd8+Fxb3wtWsxXKYs5yRmPOZbliY/3+A9HyGlK5fFIIgJimfZW1izBQAm1A4DnbtyPRXjXWrLo2IKjtcIEWXs6Dyl783PnQHvvQ5I8MKGDlNFd5EV1Z9Ciee10jSxccNcu5gwJV56EfMNV8CA2PfU2b3J+33/nEjl+svGlEw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(6916009)(54906003)(6512007)(31686004)(36756003)(508600001)(6486002)(31696002)(2616005)(5660300002)(2906002)(186003)(26005)(8936002)(8676002)(66476007)(38100700002)(4326008)(66946007)(83380400001)(316002)(66556008)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xJg3m85zJqkxLMbGVo2HKnZfvCQkf6nlNHlCvnG6kZv5Uc3DkJ78eYtEuy0X?=
 =?us-ascii?Q?cpbQFhyh2LGM6R5SiHg40CpVMeI8Kcr02YKmt6BTCvTwJnp+5jgMGBC83B7s?=
 =?us-ascii?Q?9uXFCVnuuSwt5o01ad37WBw8cEIAohmKEg0yZi+kKR1KccqZLpn8uBWzlLwl?=
 =?us-ascii?Q?yYJazkSdkclVfeMLGj1ShFBX9YDJe+sCQ3Hf8PqrmSG0Txj0BuTLd7GYwq0m?=
 =?us-ascii?Q?S0H5SRGV1xi4T74RROGmdFLiw9bHDCMTJIkAjP74kS3kO0iFRmYiSbzsTaso?=
 =?us-ascii?Q?A1sO8V26yFs95UN6Hv7V4VEU5fn4mIAH/xz/Q/nACQ59HKU8we4fzLsQH01e?=
 =?us-ascii?Q?UiJYkOi8bj06PxxJKny2SRpzrl6EZqI1grprlD9Y2uhiQMPvfqy+sT7JjdYR?=
 =?us-ascii?Q?IDPHl+g1BGr3gPfoQUm7iFKxYcYvwde11EtNHBkmBHmdBrtdpXA5j7ehy6Zs?=
 =?us-ascii?Q?yiYOB/j72DNp9UVmsXUXfcuVSjL9zfkRiaKzJAtonhEpHnjqsdz833QeHmXz?=
 =?us-ascii?Q?j2aOXAlkq79t7TRa4dGADjmnZE/5XwUaxywj2OgQATxRCq5i3/7BuZdzt9xF?=
 =?us-ascii?Q?vo8+ZhYAjBER120pM0Hxyt77P45OHsWuQ1OWYuzo0oipNPh+zUkktcQT/FRD?=
 =?us-ascii?Q?W/9XJcZ28J4nLML1lRsnglqwW4jTKdJJyl09hzVv2q/eG2xnLXCDTaOcSi/h?=
 =?us-ascii?Q?bzfNmX0dathyJreeliVMgGdtospEZLE+sxpq70bNq/9J8brglwu1ArjrZ/YE?=
 =?us-ascii?Q?wdNVfR2eIOcv1B+IIH2Yp7VzHRDtUGI4DdRHvavIWJYWWNldL2rdrFHbAHRq?=
 =?us-ascii?Q?7xyijEHadW9mju7UynTLXa9MTMk9BsULUGN9i0M09Kxut62YdBOdV7rL7xsO?=
 =?us-ascii?Q?Y022YLSHe+m/Sj8XEoeEIpLCNhtJ08psJ/y4YS8g79hGwK0gtS9FDoAISbHS?=
 =?us-ascii?Q?keAIT4nN5tMMIL12gKadFPMs2cuPBRO5FuyCkqMRTlwESrc/F8k6MInkKUKU?=
 =?us-ascii?Q?bMfuSnSf4gQV+1rxOEu1h6J3olmnD0zcVGNoIDJinchIf8X5kfecm9CI5Ykc?=
 =?us-ascii?Q?JlaBsjbIxi7Zueusm2TDrgKcyjL+aItLjxK/kXL7XJ+dYsRBnlOtYHXeLiB2?=
 =?us-ascii?Q?yDaRj+yIwYD8XkO1Il5WFT8j+I5Fsg+wek2/7NVlceO1U90KLlqgx6bpYykh?=
 =?us-ascii?Q?KpnmTsHWdyvDMD0RIPwSG7+JSVCyF/RZNYT3ZGDAvKUKylO6EwEas+zlRe51?=
 =?us-ascii?Q?PQzsMRDbbvwzWo5IdVy8k2OCeVUnB4ZI/hehLCe7OoEAVJx6Ol8WJ3PpOsXc?=
 =?us-ascii?Q?0yQ4nGWFfdIeQzxUosCWg5JAarcVK54SwiuGLKgaxvq2Ysnr535XMwnWsGbU?=
 =?us-ascii?Q?csrCEPNwMkHjartjqv0AYlfHSDrUiShs8k1BIhlud3KqJzmKb7ahxKE7qudZ?=
 =?us-ascii?Q?FOycwBBmLnqj0c7h6/hSJ48va8sS0KQL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c94ed3e-8f42-4e40-2c5e-08da07fe76f5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 10:11:12.7400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbQPxO11jkirwibjF+Qq1MpjUUYWAaFKK5h/VR33X11bSHXy9/85KRut261b3avnDFhVT2MfK5A/LUKsFYE2XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9276

On 17.03.2022 11:00, Jiamei Xie wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Jiamei Xie
>> Sent: 2022=E5=B9=B43=E6=9C=8817=E6=97=A5 17:17
>>
>>> -----Original Message-----
>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>>> Ross Lagerwall
>>> Sent: 2022=E5=B9=B43=E6=9C=8810=E6=97=A5 1:12
>>> To: Bjoern Doebel <doebel@amazon.de>; xen-devel@lists.xenproject.org
>>> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack
>>> <mpohlack@amazon.de>; Roger Pau Monne <roger.pau@citrix.com>;
>>> Andrew Cooper <Andrew.Cooper3@citrix.com>; Konrad Rzeszutek Wilk
>>> <konrad.wilk@oracle.com>
>>> Subject: Re: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-
>>> enhanced functions
>>>
>>>> From: Bjoern Doebel <doebel@amazon.de>
>>>> Sent: Wednesday, March 9, 2022 2:53 PM
>>>> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
>>>> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack
>>> <mpohlack@amazon.de>; Roger Pau Monne <roger.pau@citrix.com>;
>>> Andrew Cooper <Andrew.Cooper3@citrix.com>; Bjoern Doebel
>>> <doebel@amazon.de>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>;
>>> Ross Lagerwall <ross.lagerwall@citrix.com>
>>>> Subject: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-
>>> enhanced functions
>>>>
>>>> Xen enabled CET for supporting architectures. The control flow aspect =
of
>>>> CET expects functions that can be called indirectly (i.e., via functio=
n
>>>> pointers) to start with an ENDBR64 instruction. Otherwise a control fl=
ow
>>>> exception is raised.
>>>>
>>>> This expectation breaks livepatching flows because we patch functions =
by
>>>> overwriting their first 5 bytes with a JMP + <offset>, thus breaking t=
he
>>>> ENDBR64. We fix this by checking the start of a patched function for
>>>> being ENDBR64. In the positive case we move the livepatch JMP to start
>>>> behind the ENDBR64 instruction.
>>>>
>>>> To avoid having to guess the ENDBR64 offset again on patch reversal
>>>> (which might race with other mechanisms adding/removing ENDBR
>>>> dynamically), use the livepatch metadata to store the computed offset
>>>> along with the saved bytes of the overwritten function.
>>>>
>>>> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
>>>> Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>>>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>
>>> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> Tested-by: Jiamei xie <jiamei.xie@arm.com>
>>
>> Cheers,
>> Jiamei
> Sorry I forgot to add the scope I tested in last email. I tested it on ar=
mv8a. It worked fine and  didn't break arm.
> Tested-by: Jiamei xie <jiamei.xie@arm.com>

Yet in any event there's meanwhile been a v6, so I'm unsure of taking the
tag over there.

Jan


