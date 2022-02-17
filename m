Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9EE4B9E5A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 12:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274680.470238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKegV-0000ky-0B; Thu, 17 Feb 2022 11:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274680.470238; Thu, 17 Feb 2022 11:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKegU-0000iT-Sd; Thu, 17 Feb 2022 11:10:50 +0000
Received: by outflank-mailman (input) for mailman id 274680;
 Thu, 17 Feb 2022 11:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKegT-0000iN-8C
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 11:10:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4254715a-8fe2-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 12:10:48 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-lAeUG71uPhSUUFpIzCS97A-1; Thu, 17 Feb 2022 12:10:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Thu, 17 Feb
 2022 11:10:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 11:10:46 +0000
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
X-Inumbo-ID: 4254715a-8fe2-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645096247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kti0RY/8Y7Xjs1ngXd4Mmv7UV0LLB6b9gpzST5i0JYw=;
	b=YHg+qAZhh+7Fp8UUcERh8Nf1kVufi17MXEsbCEo2i9hAt+sJ4emP3Lx1XJ2hPw5lE6pjCE
	suYVnPC+kxe98Wl2BX9IeWXE3ua7RpcTSTB5CRWrHSsdmcQ8gtYELdIrsYLMDsRTWu/8CB
	EZEoUo8FAr1ki/Jr8Iu2hQy6UueZHm8=
X-MC-Unique: lAeUG71uPhSUUFpIzCS97A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nx5FNRxcAVndwj14fIeqzw5Ujs6FWuWQVyhx/aJcWaJHpYQhq3tfw6s9YI5a8iJOTWsCg7uO11NFqgM33Rc5yxhSxQ6OYBg0UK+FJkjU00R2Nb13RU3jcezAK1YYj5QLeUp81demjNibTcIZ9jM26ExSgulsSKNOuKD8xsge7Q7/dR421ol4GIg6rNgFx5/7BFx+02+lp88dC8kRuFXYCRQ8OnnJ64iQfom6lC4RWuvOBQrtQ5w5aJpqT6t+TNgBnFf6KRaNS6zRQexFUPEPGlFGyyxzSgjkBaLghrEw9tZ6NguJL2JkNVrCHIYXUsdk62cmhdur5WHpfqYSEi9fxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXodBuNaQM7i9evwYxPWnSfdDvuz6QkNlqIFHPxIVng=;
 b=hL+FcOzRTHiHzc5Kx9CVGrhDhhn9+MLLCa41tyL2uEir4eJJhQ4E4YI5zduo0zZV9e57yqT+p/ZPRmSBtCyFt73MY24XyKojnpZaJ09tV/e3hq52jB450kJRcK7cp+NOgiL6QaxMtQr5jFJFojxIgCqHks8NnSeJghEj4+WFtg03G2s9USS19qIFTZyWcMIeAodd+aA62Wvupv/YrXiHl47YVPSS2Cs0O8LKAvNs6JpV4xyaKp2Bcjsji98CG6zXhfuMzHJHcvEgiyz2jtStIt3ag33Yr3fn9G5deRt4HFseK840TIuE4IS/WycNXM9zGnEFmPQ0fCjPC3dqaW7Lgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d9c1694-402f-9bb7-f221-5201baa39326@suse.com>
Date: Thu, 17 Feb 2022 12:10:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/3] x86/Kconfig: introduce option to select retpoline
 usage
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20220216162142.15384-1-roger.pau@citrix.com>
 <20220216162142.15384-4-roger.pau@citrix.com>
 <b6dc1214-4f1d-f7df-50c4-d357a2380b30@suse.com>
 <Yg4kwK7XJJPNXUD7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yg4kwK7XJJPNXUD7@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0155.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33e480a3-2c45-41f3-7c62-08d9f2062535
X-MS-TrafficTypeDiagnostic: AS8PR04MB8295:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8295D407205D7158219E4B09B3369@AS8PR04MB8295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rs4Ga+Z22w9cehFJBaf6mpE09+KI1GqdJgOrsw/r/esyzl9zFQbO0xsNC8xcw+XglPXDOfc+/FX/1cNwnEbHCAUrpJ+po4CqDR9oCiE9NMJHXUTLpITjqDZy4jnPj/JIiAU8HG5KQ4QePLimDmHThfh10TzEF00XvuYA0f98bSSWXtlOUXbyyxFMr2SENGBIl+yAjkoiSHNT86CxaDMT/a0R1wL9yDSictrkM1cuU/3zD69MDOLd9xr4lBrHEZkX7BJv/YRdXloMnNPZP1qSzIUhUUbl7xdjbBdtIuCBLlvSoECbslwfMia4gEyFRCNJikjAN15tBS7J0mF9Fd0rC8/RbBInsfcl115a5LiZXagkZUOrOSj5TpSe6KtIPhuBwLF5F4ZIErrRt8M5/7VVJJbsa903TwVin9K6SbNBsCJ1vNY+1+AxLkiRi42Yte6fHRjO76/CoFAPwbI//puEAXfXTLstsVITAHXR9/G+Q4zQsLuRc29TQe8JpUN7mxyxvUhT50x3RBHEJsTKkUg5mwfzkAgex3KWxveHnDhMuFaoEz44XLOqt2fVVLXJUSHuaGKgvhRN/lqG3Kh8a56GnfgNCw0voc8o7sf2Jss5Jnp9Dmx0F3EaBBpQhBcMu07jO/702KaHy58EhVmA1zcRtSfpaakF0jOedwqQItit9ATnS6gf9Xn3RS9OZh4tisD9n3J1wCPIlOaPhAFI6w3OF6tftuXD3K5Y7xox/+K74mmG5h4X8NgwAmCCVBG877ap
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(2616005)(31686004)(5660300002)(8676002)(6916009)(31696002)(66556008)(6512007)(2906002)(8936002)(54906003)(186003)(6486002)(508600001)(4326008)(36756003)(26005)(316002)(83380400001)(38100700002)(86362001)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q4bzJuWF9TpY8rgbKgAfmQ3EAW55p9r8Ya18x/28JK3HtGcbFhJu4jRoSJX/?=
 =?us-ascii?Q?5uy/90gu0rpApRaNmObsKRKplnExMPgXV6jLq3nqhqsrftGHq1C7Rx9fJUyP?=
 =?us-ascii?Q?DClfNxK1XoUsUI4X1qKMApZzVYE95aAUoEdcD1TGVDeU7d1AhXmuDs1o44bx?=
 =?us-ascii?Q?w+rI8e/qpxF8RoTUKLqS8V7dEse9mahoFwdjIyDZmPI3y4zVpLtnme5Wida1?=
 =?us-ascii?Q?qSOHTbyvJmti/+dDqZ5aqZaJF4mU9eip7n49yEQd/owiKdyRy03WGO5lUOJ6?=
 =?us-ascii?Q?cLVROMgWWksMdv47hfS668s7eky9tFG0lrZNF7nWyHBNW/p+cUBne+myQUNI?=
 =?us-ascii?Q?aW3RhT5v6HIe820QVLMGIVq30JANebA8I6pQhItR3RiGNMlkfB0yws6pLpN2?=
 =?us-ascii?Q?2VhhBx6FDV3G84yeILk4aTopgxd7NoQAGQi9afcEh8jOx1lM3gZqCLnUrkKd?=
 =?us-ascii?Q?hVQudZosfTE983NjE+Zwo6d2irjQFXIASjpxnMUdzC4CLdxURt2fzkOOHYGz?=
 =?us-ascii?Q?Tlc1sqasA2Z5AUq0iQFDDNLveY/+rwwu8t92z+jb6pyCksWA/TeCG9Zmp5EI?=
 =?us-ascii?Q?WpuDBDsDs7pSOCtiU5EmkTb7swTc7jMraWfNOojPuJdX5Ucq2M3X59GVeygV?=
 =?us-ascii?Q?DsFzp4i6me+xXtnpkGJTTKjhIWnVQ55MP0md4xcWbM5b4lj3d7L32fQpWubx?=
 =?us-ascii?Q?u46l34NojJqedjIolw84bJ2S1A5CyZl1T3vxD7UxkNnrRIg5wUySW//4ooU0?=
 =?us-ascii?Q?l6nh9nGeFTvdujHOD0TTHWodfe05AvuKiN4wpR1SlXWa7sMtsf1Wp8EBrngu?=
 =?us-ascii?Q?omY5MDKeARj4XJpvMAlYJLLpv+V2WbqUf7Bl6oPL6S/z6YVwhPCqrD8uW87X?=
 =?us-ascii?Q?rrRPunTcfW1M+GcDq/tAqXsOJ/o2Qg5VF7qzh6gHeoSKcvjeUXT1y64/EB16?=
 =?us-ascii?Q?sCQ+sjzjKzvJ5YTv9Oj/hQXR1rZUIEA1w9X2rJjeCj+BjGNvT5fqCO43DAO1?=
 =?us-ascii?Q?yDJZA2NAJaXF0WeIDhCe9c64R6kDL+wHVKp6iuC4ec6smnmhZS2iBWPE28Op?=
 =?us-ascii?Q?runbCKFOUGVE8MFZXPBJU/1IBMpNh28L4lhrChjk0+WF3KbQHmR/+iPeQcGT?=
 =?us-ascii?Q?f/AqGNOWrJdzFdiNKKKzxvMeLwcXtnvuSIkIgHEYLmA9bPP0T178szWrU3p2?=
 =?us-ascii?Q?NuhlhfJirRcvsOvDSjT4wvcDjAY1MYuV14ouF1jX95/BHFwgKrmfU1Emnnhn?=
 =?us-ascii?Q?nGLbljwj/HdQucyeaP4aTohxZBUDt+ng+Mb10CuV9gCI43wslXvcP0SQgpOH?=
 =?us-ascii?Q?t6d+ketovVv3bJcyCPpIF4drtl4/cDQZcsqptqNnHz6ebvicnxph/NFxguWB?=
 =?us-ascii?Q?k4iNYZATttBRE2amzmC1ukHXbFJ/PI/Kgp/h9y+0t07YQhEz7FZx7yjJvQul?=
 =?us-ascii?Q?qJpn5v7OwNlLKkFHxkBh4+5B8b25gBp9dLUWFKzgYeGH6CdXtZqSG6kpHqkG?=
 =?us-ascii?Q?TjbP/qy/didfefy0Hg+4SWEJyrCteaV1AgxKnmLjHOv0QRYMwVhVeZcJ925t?=
 =?us-ascii?Q?nc/tM1F84JcemgO4OHuhWvtP6G1v/c+cdvHX4fe9OwgzaNCiz8f3caIonHdG?=
 =?us-ascii?Q?WnA4Rj49lFKKMD2pVx1T6lE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e480a3-2c45-41f3-7c62-08d9f2062535
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 11:10:45.9029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sWq7qII1jweyLj7TIiBQbcA2/ej32AvNGiq9s6KtcZiXVQ4Rth8zSYt2S9rpc7X0JvN5HpUvL7kxt6TvhX23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295

On 17.02.2022 11:34, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 17, 2022 at 10:07:32AM +0100, Jan Beulich wrote:
>> On 16.02.2022 17:21, Roger Pau Monne wrote:
>>> Add a new Kconfig option under the "Speculative hardening" section
>>> that allows selecting whether to enable retpoline. This depends on the
>>> underlying compiler having retpoline support.
>>>
>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> There's one aspect though which I would like to see Arm maintainer
>> input on:
>>
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -38,10 +38,6 @@ config GCC_INDIRECT_THUNK
>>>  config CLANG_INDIRECT_THUNK
>>>  	def_bool $(cc-option,-mretpoline-external-thunk)
>>> =20
>>> -config INDIRECT_THUNK
>>> -	def_bool y
>>> -	depends on GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK
>>
>> Moving this ...
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -146,6 +146,22 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
>>> =20
>>>  	  If unsure, say Y.
>>> =20
>>> +config INDIRECT_THUNK
>>> +	bool "Speculative Branch Target Injection Protection"
>>> +	depends on X86 && (GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK)
>>
>> ... here despite being explicitly marked x86-specific looks a
>> little odd. Since the dependencies are x86-specific, dropping
>> X86 from here would make my slight concern go away.
>=20
> Right - I've added the X86 because I was concerned about GCC or CLANG
> also exposing the repoline options on Arm, but that's not an issue
> because the compiler tests are only done for x86 anyway.
>=20
> Feel free to drop the 'X86 &&' and the parentheses if you wish.
> Otherwise I can resend if you prefer.

No need to resend just for this.

Jan


