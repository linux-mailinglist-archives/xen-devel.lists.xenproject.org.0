Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD9C49354C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:16:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258721.445903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5BY-00024B-UU; Wed, 19 Jan 2022 07:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258721.445903; Wed, 19 Jan 2022 07:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5BY-00021e-QA; Wed, 19 Jan 2022 07:15:12 +0000
Received: by outflank-mailman (input) for mailman id 258721;
 Wed, 19 Jan 2022 07:15:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nA5BX-00021Y-Rz
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:15:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88deb65f-78f7-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 08:15:09 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-GYKxruwTNa-wCG1JeZtGsw-1; Wed, 19 Jan 2022 08:15:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8351.eurprd04.prod.outlook.com (2603:10a6:102:1c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 07:15:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 07:15:05 +0000
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
X-Inumbo-ID: 88deb65f-78f7-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642576508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3WbpwSGDEL7bbFVKcC0OXzFkI4gtVXjLCNtFpo/m3tY=;
	b=IlC8sRHk9cWOVmNxqM2mwMStCNSWbdC42FL/i5asNYCGAclpx8AtaIcEG7te1Lm0cQWzOg
	btDjGUF7xpKWLpiRvQpuZMoBa+WtMaRqe7iCQNmTsm4MVXW4F04YA+d0LAfgFuHRXKZMUt
	srZ1nGYU8lMxzcLZU6AdSGLmchjO+HA=
X-MC-Unique: GYKxruwTNa-wCG1JeZtGsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ69vmF5NY/dtMhyKUlnyVlGRtuOcNrhPVjhk7EXc0cv7h3zB0PQheIMH4V/gjVSWjOEWV0EjDJ1cCo5TEWsM54oQuTrZK76TL+dI+HsbHam6VgkfFThmd/MUIikoHia3Oz0uWlutmtXui0xJss+cMycQ06lzrokAqJImcwEEza32o5DfUEtVdMOGHrMmNjTOWTZ8iG8c9ps+VOHfajqiSSOlcgshdU24gJpCIKKhKHzjh9xjbCYJlTPwfcZwuI+dux0O5EX50TLWT8z+1N0N6djlSjKc5f1avw+uEZIJdXYQJjVSpU30SB6n4cD62h5ELhfoljp57lOk/t1AMGsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WbpwSGDEL7bbFVKcC0OXzFkI4gtVXjLCNtFpo/m3tY=;
 b=Tq+m4rgl5KtZZBHkTLYbhthcgbSqreY17YsUlafNWjXuY2QnAFDyd6V5j+whqTV+e/HmXdMcTJUKVUmaZZNCLAZ7nOkJx7QuNKluNZn36Xnq/Fl/WzVm6aEZsC6e7/FA6zOEY+XaJnP+3dx7iYNfCsfqT+ZT0Zyz6tI5x5B9FJXWpWBgk4CkuJI2qTlTq54h4Q8dVhE0FkH9NTuFHTejaxFLyW3hPEmN8O+5TOi0V1c+96LCLGtisemKJdbvYsb2jiblTI5fiMyKup8HCyU7/U9nt02q9heyhBBe2IVdlE504R3ZXZHN31JgFpxaAg3blxZmDjrPRSZsy/Sz9MMODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad334ab7-d829-bb02-7562-327a72e834da@suse.com>
Date: Wed, 19 Jan 2022 08:15:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/Intel: use CPUID bit to determine PPIN availability
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <239d8868-0c8a-b512-a2bf-3e91689a8218@suse.com>
 <e076f39f-7364-b9a2-ba0c-fd84e7f19ab0@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e076f39f-7364-b9a2-ba0c-fd84e7f19ab0@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a03f69a-7534-4ea1-6e7e-08d9db1b6a9d
X-MS-TrafficTypeDiagnostic: PAXPR04MB8351:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8351BCBDC28F4310754ECB0AB3599@PAXPR04MB8351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YAsn8gb48rDFTq2zpRWNlPSA/Gm9MP54ZA+uz9HUbWlSa4zOochIPzXy6/i1mMhhThAN+f9dd+/jPiopFU1CblIPDAweUsT4yiBC5es4O4GQ2CxhxNOthILKOWffg7g+9CLEdIhHUfoKWBvPTwxji9sUilut5fhY/t+GhZm49Cg9yToQitj8iX0mcx97j+GfPKfKzkHh/jmPal9MuoTVkHgftG+fNUhOW2mUKlQZS5Vb15hhA8ewM/qDWv4t4jQsbPdumgpRymzZhIZ3RgdZlLTfQU+3sVOwDLCozNoEpphccu6M1BwM4VISz5VLhqsp0Yjd5CL67tOaHqQ8A2QhvWMXD9431z7cRWL8Zd06D+aQmHeqjK0SHlvzavEaE8QNQpdyvCmgqg3XcyCQlzeUICZtbz6q67H4NpkS/S5wKhw4vu3QHals8wADcQHgfzaEwzmOjouAdcxkoXuwND41Paw7SkJRfPU2z950DjjYlZmR9zQuBQbwr3J46/OOg0GnTlmAZmAYRvcP0B6j3y8ZFgzD5ewqCT0mEOYg3whg/uNMP+u//eqME2B+RqJeYG1vBG0BGZ9QgtsTK5ye1rNnRikM7G5eXj64NSDRoGcYZ1NRJP6lVIB6/d/ZtFnO2CGsTOyZ4br54i+kb1kC4llV+DwNiNIJAcyifFJwupjvWatozTIOSRcRL/tgKm+gahVjL4l5Id9CcryLzFy2CtO19fwwDfvFA9KaYuBO9HsIy0ZInSt19cD0k3ZSSYJbZ1+S2zO0nPmioekH9HiOQo7QtSORdxNcQAtEZwlVzYLr7p7p3OLMutPptAeGmg/XZz+Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(186003)(31686004)(6916009)(6486002)(508600001)(26005)(31696002)(4326008)(54906003)(4744005)(966005)(5660300002)(66476007)(38100700002)(316002)(6506007)(86362001)(53546011)(66556008)(8936002)(6512007)(2616005)(36756003)(2906002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUgyNkRsUmlzVFpETGZPQnBzUVlUMG4vOUFNRVhPb2FEMTJyVzZxaGhKOFhn?=
 =?utf-8?B?UHE1TFNGeWUzUU9JaHVOYUxGTEJzMlJYb0g0V0lZVGtNclRoclhaL0RINEtM?=
 =?utf-8?B?ZkQyR3RWR0dWQ3FpdHlHaGMyV2V6c0k4aldkUDJ4ak5rQWVsaTdGbVNMK1FG?=
 =?utf-8?B?SkYvQkpDd2tta0hhVGQyNlRqa1A4dG5qYUxiL3kwZXNWWnJKeWVrek85eTYr?=
 =?utf-8?B?Qy9ucFlub1RxR1RsYkJ2dENhM1BTeE4wSlNUQkl1OU1zR3B0VkIzRGd2cktx?=
 =?utf-8?B?K3pMK1Q2N3VzK0NCWEhueU5xK29qejVqbTR1WllZTTBKV0dxQ05IamRReG9E?=
 =?utf-8?B?STU0VGNmN2JrREhBOWY0TDZnTGxaK292YTE2MVBaVGJRZ28rUjhIci90TmtQ?=
 =?utf-8?B?T29RVFN6QjNSMTVnTjZBN2xvSVdpS0J4d0xtU1p5dnZaeWNSTE1DRmZ0aGUz?=
 =?utf-8?B?TXd6UU1QQW1pMmttNUNFMjFjM002M3lZcXJjaXYwSTRxbFJlSTdVcUNtMHJQ?=
 =?utf-8?B?Q1dJVWdNR2JRRlp6Y3NkRUhUb2h1TUluRTVaSzVwTGk3ckQrNUVTR1B0aDB5?=
 =?utf-8?B?bGhhaHNvSE4zQlBBMDdLaUUrWlh3Q1Y3YkNReEJSVUJxeHB2MCt3QkNUYjFr?=
 =?utf-8?B?b1diSkpYR3p0TFE3YXdYbi93ZG5LbzRLd0E3Mm9xcmhzWWh4WU9DSHY1K0NU?=
 =?utf-8?B?K01wVkx5aDBaWVhkYVZEdXJERllNUmEyZ3kweXVFeUZ3SWg5bDdiRWNsdFZa?=
 =?utf-8?B?eTBtT1JzV0x0bDZOSUUzdERJdWpYTEZ0OXdTMC9tM2F4MUJUNTBqVE9EQXVk?=
 =?utf-8?B?RmdHbHhtd1NPRVJZL09ZOXRYbURQMTlzNUFGblFPalp5UnRRaHQ5UENFK095?=
 =?utf-8?B?djFhQ0wrdFp0ZDVreWZ2WlBVTkxRZVhwSHhOazg2eGgxTHNvazhoa0xCcmph?=
 =?utf-8?B?YWJOMzJCTjd1RWRWVDVpcFlwUFlQR1pNeFArbmtQbU5WNUtkczIrSnlJNlVZ?=
 =?utf-8?B?OTlIU3pyOVZaR0pRQzJWd3YzTzRXWGFoc0QrQWU0N1pSekNkN2VjK2ZBUS8z?=
 =?utf-8?B?T3JQdlVMbFdjeFlZMS9tWC9McTNCVVRRbGpLMUVPdmNHaTk0QkUyQUlzOFI3?=
 =?utf-8?B?a0dkbklCdTZDQnVycnpDNFRGa0UzT3NMbGU2Z0pSQWF6OW5Fb1JPRHlBUzYv?=
 =?utf-8?B?eXVVd3BDRGdJTU00ZUdaN0dEYzZhQit0UHE4dUR2VldpbFdKUVl3V2J6dzlh?=
 =?utf-8?B?VmxxWEFMeFhieHdlcnFUOGRERnlpVUhtUEdSek9lNW0yQkh1cERiY1d3TkNh?=
 =?utf-8?B?RlA4Z0huWGUrc1c4Mk5WOEcyd1lxMHBSQjBMTmlISjMrU2M1V3lTRmdEZTM2?=
 =?utf-8?B?MW4vRjJ3SUs1OWJSQ0RzeG1WOHRZc05LMUlzRHdrZlo1VmVGRVRMMjdkSTdF?=
 =?utf-8?B?d3R5b0hWV0tZdHRTTEZWVWlsa0ZCK0NDRzE4bFNibXZOVnFUQXBWTG5sMG1h?=
 =?utf-8?B?aUdGdVIzRWxQR1pNaUFhZTZoV2pUREdUWHFmeFBzYkxPMWRUeXFpNlFqd2hv?=
 =?utf-8?B?WXFLSnJJd2cxalJ6bno3TFh2WFJQaGFSSlZDY2Z0bER6TkZvbUJZMDFaMVdr?=
 =?utf-8?B?QnRvd25LT2RCTXNzaFVxQ2ZsUG91N3p6dlBxVFl2UTF3Wm5wczllRzZCVlQ5?=
 =?utf-8?B?RFNxOHhMNTV2aGJidi8xRnh2QW5UdFhPRVBtR1VwYU5CZG9WaGNPYW9aakla?=
 =?utf-8?B?M2xMSFJhZVplSGhsdjBRNXA3YUhYbFJVWWlXUWZkTkNoN01wQnJabmxOeit2?=
 =?utf-8?B?eE04ZjNqL09FTk1KenEvOVBmaWNKWnQwQSs5NzEydi8xRFppT3NwR0ZrWmtz?=
 =?utf-8?B?SmFLZGZsWWRQVFhtWjFhZWc5MnNvU0c0THd3SWhwcm1kdGZkbG9MNEFoZUQ0?=
 =?utf-8?B?eVFwY3VlTUFsYytMRC90YllyZjBqYTZ4dUtNcjcrcVFPOGo5VklaenY0V0Rq?=
 =?utf-8?B?SlZKRTdLRW5tWDBmTDAwcGZ3eWNva2RkOUFzN0h1U0xPNFIrOVByT2U3c1hV?=
 =?utf-8?B?S1pqeURZM0lKTUJHaEdZdmRIeC82UEJCWE5mVGVUdWVHR3FySGtlbUVHaHZj?=
 =?utf-8?B?TnZkNU9IUUx2TGlNNlo5M21DNGtVcFhnZkhnY0FGdkkxZy9MWkFJVHpCYjZz?=
 =?utf-8?Q?MCluzR/8usCw0l6WTUzfpQs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a03f69a-7534-4ea1-6e7e-08d9db1b6a9d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 07:15:05.6413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goQGwDu8lE3tFg0RhtpR+88fbmk+fy5eT6ZiMh00cmqoG++4usfe8piPNfuYncLc8vGGbhresJWrYkwt6TIVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8351

On 18.01.2022 21:28, Andrew Cooper wrote:
> On 17/01/2022 15:30, Jan Beulich wrote:
>> As of SDM revision 076 there is a CPUID bit for this functionality. Use
>> it to amend the existing model-based logic.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> https://lore.kernel.org/lkml/20220107225442.1690165-1-tony.luck@intel.com/T/#u
> suggests that Sapphire Rapids also needs the model specific treatment.

Well, I can go and pull in their a331f5fdd36 just to be on the safe side.
I have to admit that it's not clear to me whether that older commit is
made obsolete by the CPUID bit check about to be added.

> I agree with the "only-expose-on-error" observation, so perhaps we ought
> to make these details available to the hardware domain in a suitable form.

hypfs?

Jan


