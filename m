Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9543B329
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 15:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216435.376042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMX6-00085H-Jh; Tue, 26 Oct 2021 13:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216435.376042; Tue, 26 Oct 2021 13:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMX6-00082V-FK; Tue, 26 Oct 2021 13:30:28 +0000
Received: by outflank-mailman (input) for mailman id 216435;
 Tue, 26 Oct 2021 13:30:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfMX4-00082P-Rq
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 13:30:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae53d591-5a95-4813-89a9-3bd486385101;
 Tue, 26 Oct 2021 13:30:24 +0000 (UTC)
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
X-Inumbo-ID: ae53d591-5a95-4813-89a9-3bd486385101
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635255024;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6p036b/5ecfVrdcgdMILWvunAmwmxkKBC1CR3vFOj58=;
  b=E4nk/i+l01ppNZIa8UmC0oiFz3BUysPSqUGoInTGoMiybwZx12J8I+bS
   TurqCfvw1jBq8jx76EdsEjrzkTiZ/ChSdzeTYpi4QTMQhs18IL0xSbpEQ
   bBeoVtIlhk0DkzizLd/asrqsdag2ubaQsykfWV6yBNhPWTwwZDCthujET
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RhLxx8hBuafBKc7eFqDPHncNl4IReHDvRQNYWfdwFQz8+Dg7BOKx/hBrtB4/5WL57pDCm+EpQY
 rw0cwOma8HhPFoNH5dshdRGxtWeHQy9hRrPrSD7u5nNtJgvRMPhiS1Qvfe6K4MkqMDkLz6OhIr
 0jCQXUn6WJ7aTw5zQr+Z+fHDesscHYbzmzwF+E4V+AJMUrKmGTLA0kncJ8dEtxGq5N0HjLNado
 kCyvl6u7Runxkm35n9PddiiPPPif0TjeAMG7O9VPXjDCV+TmTWo0hnFyTB6m1YSvaCl5HboXrW
 jZv1z1Ig48zCeHUTHGn75Pag
X-SBRS: 5.1
X-MesageID: 58003630
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rDJ0nKvOGbgPgFSXTk7W7pJwAOfnVHRYMUV32f8akzHdYApBsoF/q
 tZmKWCFOKuPYGejL9ElYNjiphlV7cOHmtBqGwtqriFjFygT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24bhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrbKqEQkVAe7wt6dNAkl7EBpXP7BU9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25AWRa2AP
 JJxhTxHQQ3vTyBVEXsuVpMvpdeI13zwb2J8pwfAzUYwyzeKl1EguFT3C/LXcNGXQcRenm6Du
 3nLuW/+B3kyHcaDxD+y12Ojj+7Cgwv2QIsXUra/85ZCilCJ2nYaDhFQUFKhuOS4kWa3QdcZI
 EsRkgIpqaUx70WtQsPKVhu0umOfvhUcVtxTFMU38AiIjKHT5m6xHGEEUzoHc90gu88eTCYvk
 FSOmrvBGztrt7GETGOHwb2dpziyJCs9IHcLYGkPSg5ty8nupsQ/gwzCSv5nEbWplZvlFDfo2
 TeIoSMiwbIJgqYj3qO35wqf22qEqZ3ATwpz7QLSNkqn8wd4aYiNd4Gur1/B4p5oK4KUTUKIu
 nQerNSP9+AFDZyLlyulTf0EGfei4PPtGCbHnVdlEp0l9jKs032uZ4Zd5Hd5PkgBDyofUWa3O
 gmJ41oXvcINeivxBUNqX26vI9wE1/DuKeumat+XPoseQZtKXQ2a7i47MCZ8wFvRuEQrlKg+P
 7KSfsCtEWsWBMxb8damewsO+eR0nn5mlAs/Ubi+lk79iePPOxZ5XJ9caAPWBt3V+p9ot+k8H
 zx3DMCN1wlEGNP3Zi3a4Ob/xnhbcCBlW/gaRyFRH9NvwzaK+kl9VJc9Ipt7IuSJepi5cc+Tp
 hmAtrdwkgaXuJE+AVzihopfQL3uR41jinkwIDYhO12ls1B6P93ytfdPLspmLeh2nACG8RKTZ
 6JdE/hs/9wVEmiXk9jjRcClxGCdSPhbrV3XZHf0CNTOV5VhWxbI6rfZkvjHr0Ez4t6MnZJm+
 dWIj1qDKbJaHlgKJJuGOZqHkgLq1VBAyb0aYqc9CoQKEKka2NMxcHKZYz5eC5xkFCgvMRPAh
 1rKWExD9beWy2L3mfGQ7Z25Q06SO7IWNmJRHnXB7KbwMi/f/2G5xpRHXvrOdjfYPF4YMo34D
 QmM5/2jYvABgnhQtI9wT+Riwa4kvoO9rL5G1AV0Wn7Mag3zWL9nJ3CH2+hJt7FMmeAF6VfnB
 BrX94kII6iNNePkDEUVeFgvYNOc2KxGgTLV9/k0fhn3vXcl4LqdXExOFBCQkygBfqBtOYYoz
 L556s4b4gCykDQwNdOCgnwG/miANCVYAa4mqosbEMngjQ9ykgNOZpnVCynX5pCTaooTbhl2c
 2HM3Keb3uZS3EvPdXY3BEPh5+sFiMRcog1OwX8DO0+NxojPiMgo0UAD6j8wVAlUkElKirohJ
 mhxOkRpDqyS5DM01tNbVmWhFgwdVh2U/kv9lwkAmGHDFhT6U2XMKCs2OPqX/VBf+GVZJ2AJ8
 LadwWfjcDDrYMCugXdiBR8786TuHY5r6wnPuMG7BMDUTZA1bA3sjrKqeWdV+QDsBtk8hRGfq
 ORnlAqqhXYX6cLET3UHNrSn
IronPort-HdrOrdr: A9a23:o8WnBK5lAw7bFDJzaAPXwSyBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdgLNhRotKOTOJhILGFvAB0WKP+UyEJ8S6zJ8h6U
 4CSdkBNDSTNykCsS+S2mDReLxBsbr3gZxAx92ut0uFJTsaFJ2IhD0JbDpzfHcGIDWvUvECZe
 ahD4d81nGdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn5y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXoIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6V9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF39tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc8a+d
 FVfYHhDcttABCnhyizhBgs/DXsZAV+Iv6+eDlChiTPuAIm2UyQzCMjtbsidzk7hdYAoqJ/lp
 f525JT5cVzp/8tHNJA7dg6MLmK40z2MFvx2TGpUBza/J9uAQO5l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.87,184,1631592000"; 
   d="scan'208";a="58003630"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I07bkqjXEm9UWCAdGxzYGsLWs/8Pxd4/8S7hvFyv1O90loaCpLnJjPUKViTu4r3S115YWMSFyQrOoDm7ep6YeH4lwxct97ktGWQzsmVYKYIMTVU1SD6sjsE33DeuxfZCkd8wD1mzl9UFiZdABG4AS83YbZFlc9wGLGk/2H7HP5mc8RFqrFehWbEeakqyA1ajNU3oOn+kXNm6lUUCFu9nk2Ke1/Uuxmf1XC+sncIRqNhhqSCDz/1PPoXB7+10VzPadOzxjfc8B9FFpTpQtC4jnjUPs4xe0MW4EPFI7DvgPnuZb0DcW1ZzmB64Mk48pt/87y1FluivLMkH78O5e7TPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EQ6jAIADUx+fOskjNBtbeFd2h9AWqCawEeH5Zn4EMc=;
 b=ZKru4ZVg0fnq1tmqy8L088nQaPIEyJMZlFLxPO/LAxSepDcJPFclCzFx1lZbAsRfm0cN7G/Kvjy9n3zLsKmX2QYHmlInd5jWGIZogJHFWUroX1PxKQeY2L2s763nHwXJ9thp3DxzcTEyIC/bSQJVFy7rbjjdR74Gs5PLAT6GFcmSVu/i1dQy8KpfXSx9z3qCgHjoLHe6OCv7gQ38N92hI4E79L3Dl7PlVBEVruOYjkwqQmGjmn3mLyg+45yucMHJROhdnekw01rG/OEg8iHTR7mkmjlAqmt74+RqvTuOnGRgct+9OmYVh52xCUDaX9ExliGERyII597Z6OxTEJW+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EQ6jAIADUx+fOskjNBtbeFd2h9AWqCawEeH5Zn4EMc=;
 b=ZJxNjVbYy4wE4Bn8m7MgSQLzCUxTJkYOOHSiMTSFiGe3W2HCrEyzFdDqLVR6wEH5B2T+LF7hWx5YfPM0qnaL2RlL4s/SJAzUbR9kutntXQwLGCtVVQ7fkXvXZy70rCiOo+zcSKBaEvb3uEbMCW4jCzBRAivEG2AjnMCFh8TH3iE=
Date: Tue, 26 Oct 2021 15:30:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Message-ID: <YXgC5QB2MDZlZeEZ@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-12-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06343ca5-e1ad-4086-5044-08d99884c0dc
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-Microsoft-Antispam-PRVS: <DM5PR03MB27770C0986C848F9C137AEBF8F849@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sMqO1b3sP6d1sxpkynBwPS0+nUeB58w8iptdbj8Ti2DeoEKpDpTOsBdCz5jCvc+IoXElMngI4ovIkSIfAVxF7tVu0FJpWo5a2nt/TCUXPeFbUU2AqFpVDt4skbfTDyiWO6lAvrb4Myejeg/oJ4Cok2HKeP+iZ1I09FTWShdPO8QP5kxWzDHiRBa6db4m4jL986+0/2attLX1DHRULZsec/px8o32CpmWcI2ZwRuWA5awrk5+AAEEfSMe6cLBJFsVWYQZewPjeqQ+UUwS+1JDX30QnzOtv+/Of5dmI/6Tq43LA/Dyofg6l5hqKuYJNu6Fo2fJ7aHJGm8k8mtg8uzT5HF2G07CIYZ/alPODOHeQVc860urTcMTq7++T7+ynAzsLEADjHNW+Q3L6F4ImzVJF4W1kj1SprTIP3mzgte69iByrd28CcEdF1hvKngnrew02UBFmb1WqjnDcIIAzGmFZmg8sQaJgPXifNF/gLv7p4UxFNCkcswf0F3zgtDgQDkC/X5GPO0zemBc4lh9QWclsr9gHrKsQwshePu1WKLMQSDJGbREb2y3wS6LId02yZrNK3qo4YV5fBJDaeCMNQfkbZYFdVpD51ZX2Bx+RPopVpXoC0AJ4KP6SdXrZkmSWER63C9awAbtu8I+6UfvV084VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6486002)(9686003)(82960400001)(956004)(66556008)(66946007)(66476007)(5660300002)(4326008)(26005)(38100700002)(6666004)(8936002)(508600001)(316002)(2906002)(6916009)(7416002)(6496006)(85182001)(83380400001)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmJMbkdZZ1ZBamlBVUNTQ0I1UUNDejl1RUlOUWNnRU5EKzVUMVIzbDkzOVBx?=
 =?utf-8?B?d3FzQVczWnNOZndBR1VBWmNtbzd5V3dIdTJ3V3dzRjY1d3ZlYWFLWWRWblFp?=
 =?utf-8?B?V1JZZVNmUEV1NE5TcTl1aVdxUDY5eW9OWm5WaURjSUg0ckdMeUZlYkZNS0J1?=
 =?utf-8?B?ZGVXNHQ3T2p5U09kYWV1aUxlcTVjSFc5VENDaisvL3R0Qjg5ZkpKbnRaTzdO?=
 =?utf-8?B?UlNHNXk1UVdXUmFWRk1zUks1eDZXa2JDVitkUzNta2taN3NpRlRlNHdKbVIw?=
 =?utf-8?B?aDFqdlZmcjdNY0V1SXVmTDhZb1RyQmNIc2h0cE9QU3ZTQ0NXRTMweXY0ek1P?=
 =?utf-8?B?TlhQbkNQTmpGUXBCcFMzSHJYbDBIOU1BYm00TjFVYy9XMHR6dTZQNnFzVHFh?=
 =?utf-8?B?SnlpREc0TDMyQTFrOVkzVE9lZm1EdXhTRkNrSUNrbERTV1k0bzNCMkR6bjQ1?=
 =?utf-8?B?cU4xNDg3RXdtOGR4VGN6ZXZINEVaR1U4NlRuc3NtNFBFcURCcVBWL3d1S2ZL?=
 =?utf-8?B?eVovTy9qZ210VUF6U2JKSDZrUEpDbUFQQUR3NzAyc081NG1DVVJ5anI0UDZo?=
 =?utf-8?B?YkN2MlVITUxsNWgySlB2dGdCd210TGsreXpJK1AyOXFGcWRsNHJUemhjVzl6?=
 =?utf-8?B?VTJxc05YSnVsbHExZlFobTZUd2dJb2hwNW9Td1RQaVpMWTZNbGcwWkIyL0Iv?=
 =?utf-8?B?emh2WmpVWUlxQTR2MFNDZUd5Q2NCRG9KQ2dtNjdwVnE2Z0hWZWpCMDlZVUhi?=
 =?utf-8?B?T2ZpRHIxUmRSbHY0bFpVUzFvRDRHNUY2NXkvK21nMm0vZkZmM3V4VWFkekxu?=
 =?utf-8?B?dldqZlV6OC9oTlBESk9HYzFoSVRJZkhXVUxseUlJM1RldEsrWUppUUhYNGdr?=
 =?utf-8?B?eHBwSVVCUlRLbU5GcHV0WU45OEtYdnYxMmk5djFWYWE3VG11VkZMUkxqejRr?=
 =?utf-8?B?RHYySjhNeUNmTlZKK0FqNjRxQlZrR1ppcjF5N3JicXpuMzdjMlA2Wk93OS95?=
 =?utf-8?B?OGNLN1hSOFc0c1lRYktwVmZOTDAxeEx0N1RpbE9MdXh1YW85RjA4YlI3ZEZK?=
 =?utf-8?B?VGtTa1dPUmJrc2U2cisxOWVPT0o4VGcxTGdncU15RWY0MFVROUJla0c3WlJm?=
 =?utf-8?B?eFZlV1drcUtkbWZtK2hVS3h1VDY0TjdDSnlVV1lvQ2tlYUtCN25abkpZeTRs?=
 =?utf-8?B?L0hGN1QzbFh2aE5Hb3YvcTJPWXB5b0JCemF5VEplT05MSWRzNXYzL0FvbjQz?=
 =?utf-8?B?V3RvYUEvTHY4Ykt6OW80ZC9BYjVsOTV2b2g4VDk1N1UxWHNQMHZJdm9IdXZw?=
 =?utf-8?B?encxTHhERWlBWmtnczRPUDdLSkZWU2JCdmNrN2RsRUZXMzdKTUhCMi9sb20y?=
 =?utf-8?B?cEhpb21yRGhxSGlTSHhMUWtoNjc3VFA5ZnptbVBmdCtxeUFhR0xjcXhiWlpN?=
 =?utf-8?B?bmdYNzVwQ0VjQkx1ZG56aHVmVHlJM0hNNkFpc2F4bkp2VUpPb2xxaEtYbldS?=
 =?utf-8?B?YUpPcUJmeE1IQjVjMkFlQmswMlg3S0lLNzlhMlpMRjR6SFJmUUdzbVFGSm9z?=
 =?utf-8?B?SStYUU45S3JoQWNtT0RKeklIeE9hQ0RWT1JNREh4ZWlUVGo4SnZtTG5SN0ll?=
 =?utf-8?B?UmwyT2xCZHI4TStaYzI0VkZQOFhVMHdTT2VpVkRLVUFaS0c3OHpLRjlKQjVQ?=
 =?utf-8?B?RDlGVTloRWdHUTY0QlFpd0JDNS9MdXcrMGJXV2dpYkpVVDhLK0NzdnNGaU43?=
 =?utf-8?B?S2JENmxsV3RscGhab3pmR1N2VjdRWlFxdDE5ZjNYMnZ4U1dhRDZBMXZ5SDRU?=
 =?utf-8?B?NjNMMjNZZERTam8wZE9YamFzL0UxTHFvYnp5MkFkY1RmTU1Vcm5xTDRwVmdy?=
 =?utf-8?B?R0VYdmxUK0VjOGFNMzdWOWpmRXpOWFFjYkZHN2N0RHZ6SFM3blZvT2NaVWpn?=
 =?utf-8?B?M05oM1d3Zk1HVGdQcUNMWUM2WFZQUkh0aTNIOXJqT2daNnVWYUxEdHhXVW1u?=
 =?utf-8?B?Ri9CeTgxZ2hCNW5TV0dnSUNKamY3ck9xUlc5R1F3elc4SzdGekwxbXFzUDNG?=
 =?utf-8?B?aFdXemFxb1ZkWnZDMGFiREJoQ2ZZMitnWDlmMmhwNFg2SmVSRG53Uk5YaURR?=
 =?utf-8?B?UTBDQTZXVlBycFVQZGZnUGw3eHArS3VGV3JhS3MwVFZJemZMaGEybmE5ajE1?=
 =?utf-8?Q?QTkV9k3YKiYRkI86UMw/EHw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06343ca5-e1ad-4086-5044-08d99884c0dc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 13:30:19.0186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8nSSveaZmWMc06zpB4oSCafWlWl9ODOMebiC4Tffe4zdbZPfSVemN5xEv4Zp6CxhW2PRqrek78q1Udt9ZcwKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:23AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are three  originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 3. Emulated host PCI bridge access. It doesn't exist in the physical
> topology, e.g. it can't be mapped to some physical host bridge.
> So, all access to the host bridge itself needs to be trapped and
> emulated.

I'm slightly confused by the fact that you seem to allow unprivileged
guests to use vPCI in this commit, yet there's still a concerning bit
that AFAICT has not been changed by the series.

vpci_{read,write} will passthough any access not explicitly handled by
vPCI (see the usage of vpci_{read,write}_hw). This is fine for the
hardware domain, but needs inverting for unprivileged guests: any
access not explicitly handled by vPCI needs to be dropped.

> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v2:
>  - pass struct domain instead of struct vcpu
>  - constify arguments where possible
>  - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/arch/arm/domain.c         |  1 +
>  xen/arch/arm/vpci.c           | 86 +++++++++++++++++++++++++++++++----
>  xen/arch/arm/vpci.h           |  3 ++
>  xen/drivers/passthrough/pci.c | 25 ++++++++++
>  xen/include/asm-arm/pci.h     |  1 +
>  xen/include/xen/pci.h         |  1 +
>  xen/include/xen/sched.h       |  2 +
>  7 files changed, 111 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index fa6fcc5e467c..095671742ad8 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -797,6 +797,7 @@ void arch_domain_destroy(struct domain *d)
>                         get_order_from_bytes(d->arch.efi_acpi_len));
>  #endif
>      domain_io_free(d);
> +    domain_vpci_free(d);

It's a nit, but I think from a logical PoV this should be inverted?
You first free the handlers and then the IO infrastructure.

>  }
>  
>  void arch_domain_shutdown(struct domain *d)
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 5d6c29c8dcd9..26ec2fa7cf2d 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -17,6 +17,14 @@
>  
>  #define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>  
> +struct vpci_mmio_priv {
> +    /*
> +     * Set to true if the MMIO handlers were set up for the emulated
> +     * ECAM host PCI bridge.
> +     */
> +    bool is_virt_ecam;
> +};

Is this strictly required? It feels a bit odd to have a structure to
store and single boolean.

I think you could replace it's usage with is_hardware_domain.

> +
>  /* Do some sanity checks. */
>  static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
>  {
> @@ -38,6 +46,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      pci_sbdf_t sbdf;
>      unsigned long data = ~0UL;
>      unsigned int size = 1U << info->dabt.size;
> +    struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;
>  
>      sbdf.sbdf = MMCFG_BDF(info->gpa);
>      reg = REGISTER_OFFSET(info->gpa);
> @@ -45,6 +54,13 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      if ( !vpci_mmio_access_allowed(reg, size) )
>          return 0;
>  
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v->domain, &sbdf) )
> +            return 1;
> +
>      data = vpci_read(sbdf, reg, min(4u, size));

Given my earlier recommendation to place the virtual sbdf inside
struct vpci, it might make sense to let vpci_read do the translation
itself.

>      if ( size == 8 )
>          data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> @@ -61,6 +77,7 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>      pci_sbdf_t sbdf;
>      unsigned long data = r;
>      unsigned int size = 1U << info->dabt.size;
> +    struct vpci_mmio_priv *priv = (struct vpci_mmio_priv *)p;
>  
>      sbdf.sbdf = MMCFG_BDF(info->gpa);
>      reg = REGISTER_OFFSET(info->gpa);
> @@ -68,6 +85,13 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>      if ( !vpci_mmio_access_allowed(reg, size) )
>          return 0;
>  
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( priv->is_virt_ecam && !pci_translate_virtual_device(v->domain, &sbdf) )
> +            return 1;
> +
>      vpci_write(sbdf, reg, min(4u, size), data);
>      if ( size == 8 )
>          vpci_write(sbdf, reg + 4, 4, data >> 32);
> @@ -80,13 +104,48 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
>      .write = vpci_mmio_write,
>  };
>  
> +/*
> + * There are three  originators for the PCI configuration space access:
> + * 1. The domain that owns physical host bridge: MMIO handlers are
> + *    there so we can update vPCI register handlers with the values
> + *    written by the hardware domain, e.g. physical view of the registers/
> + *    configuration space.
> + * 2. Guest access to the passed through PCI devices: we need to properly
> + *    map virtual bus topology to the physical one, e.g. pass the configuration
> + *    space access to the corresponding physical devices.
> + * 3. Emulated host PCI bridge access. It doesn't exist in the physical
> + *    topology, e.g. it can't be mapped to some physical host bridge.
> + *    So, all access to the host bridge itself needs to be trapped and
> + *    emulated.

I'm not sure 3. is equivalent to the other points. 1. and 2. seem to
be referring to where accesses to the config space are coming from,
while point 3. is referring to a fully emulated device in Xen (one
that doesn't have a backing pci_dev).

I'm also failing to see any fully virtual PCI device being added to
the bus for guest domains so far.

> + */
>  static int vpci_setup_mmio_handler(struct domain *d,
>                                     struct pci_host_bridge *bridge)
>  {
> -    struct pci_config_window *cfg = bridge->cfg;
> +    struct vpci_mmio_priv *priv;
> +
> +    priv = xzalloc(struct vpci_mmio_priv);
> +    if ( !priv )
> +        return -ENOMEM;
> +
> +    priv->is_virt_ecam = !is_hardware_domain(d);
>  
> -    register_mmio_handler(d, &vpci_mmio_handler,
> -                          cfg->phys_addr, cfg->size, NULL);
> +    if ( is_hardware_domain(d) )
> +    {
> +        struct pci_config_window *cfg = bridge->cfg;
> +
> +        bridge->mmio_priv = priv;
> +        register_mmio_handler(d, &vpci_mmio_handler,
> +                              cfg->phys_addr, cfg->size,
> +                              priv);
> +    }
> +    else
> +    {
> +        d->vpci_mmio_priv = priv;
> +        /* Guest domains use what is programmed in their device tree. */
> +        register_mmio_handler(d, &vpci_mmio_handler,
> +                              GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE,
> +                              priv);
> +    }
>      return 0;
>  }
>  
> @@ -95,14 +154,25 @@ int domain_vpci_init(struct domain *d)
>      if ( !has_vpci(d) )
>          return 0;
>  
> +    return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);

I think this is wrong for unprivileged domains: you iterate against
host bridges but just setup a single ECAM region from
GUEST_VPCI_ECAM_BASE to GUEST_VPCI_ECAM_SIZE, so you are leaking
multiple allocations of vpci_mmio_priv, and also adding a bunch of
duplicated IO handlers for the same ECAM region.

IMO you should iterate against host bridges only for the hardware
domain case. For the unpriviledged domain case there's no need to
iterate against the list of physical host bridges as you end up
exposing a fully emulated bus which bears no resemblance to the
physical setup.

> +}
> +
> +static int domain_vpci_free_cb(struct domain *d,
> +                               struct pci_host_bridge *bridge)
> +{
>      if ( is_hardware_domain(d) )
> -        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
> +        XFREE(bridge->mmio_priv);
> +    else
> +        XFREE(d->vpci_mmio_priv);
> +    return 0;
> +}
>  
> -    /* Guest domains use what is programmed in their device tree. */
> -    register_mmio_handler(d, &vpci_mmio_handler,
> -                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
> +void domain_vpci_free(struct domain *d)
> +{
> +    if ( !has_vpci(d) )
> +        return;
>  
> -    return 0;
> +    pci_host_iterate_bridges(d, domain_vpci_free_cb);

Why do we need to iterate the host bridges for unprivileged domains?
AFAICT it just causes duplicated calls to XFREE(d->vpci_mmio_priv). I
would expect something like:

static int bridge_free_cb(struct domain *d,
                          struct pci_host_bridge *bridge)
{
    ASSERT(is_hardware_domain(d));
    XFREE(bridge->mmio_priv);
    return 0;
}

void domain_vpci_free(struct domain *d)
{
    if ( !has_vpci(d) )
        return;

    if ( is_hardware_domain(d) )
        pci_host_iterate_bridges(d, bridge_free_cb);
    else
        XFREE(d->vpci_mmio_priv);
}

Albeit I think there's no need for vpci_mmio_priv in the first place.

Thanks, Roger.

