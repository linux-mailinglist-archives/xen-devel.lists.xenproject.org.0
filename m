Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4E8431712
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212073.369818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQh1-0004U4-UC; Mon, 18 Oct 2021 11:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212073.369818; Mon, 18 Oct 2021 11:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQh1-0004Rx-R4; Mon, 18 Oct 2021 11:20:35 +0000
Received: by outflank-mailman (input) for mailman id 212073;
 Mon, 18 Oct 2021 11:20:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcQh0-0004Rr-4Z
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:20:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4e39178-8db9-4949-a496-d1805436a860;
 Mon, 18 Oct 2021 11:20:32 +0000 (UTC)
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
X-Inumbo-ID: b4e39178-8db9-4949-a496-d1805436a860
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634556032;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+PpxqIBmpSYx4p5gA0OY+PQaWpWDoOllj221jJ+5rHI=;
  b=IHtqnBxUWu94x4lp2CzHnHMg7h0Jh3dChwNPWsyozV8zkWLEhZW/gx8s
   6C0jC0vlBUv8MxWmMy67ntrkvR7LgwzS5JV+GjWuv4IQ7Dzj8JxdzyCbB
   8lYpCbSwASaJvuoYhZr1cm6AhuH70bXnM4yIatwkHrnzs+hFtKSJKoPRi
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J+9a7fkDSHlHMvDhPveA7cpB6qPxXznd9DfnDw0EX/WfFWoftYR/vStqBzQm9IAarzl6kHOpRA
 P87MVcugIBqmET6njZJ2L3WnN1/hAY9FXCIx7xXYhOB9B9Em754pJN4Ph46VNegSxcLq+FTih8
 0geBo7et+P1ta706t9zb2UR/8TOmhnskPR1+FPBH1mdC/ETjUiGytZkgqi4N5fcHXKe87g2/xN
 sXMeOVJNYNDvV8yiGtTu/Qj0y0PL2R8nJzpyiWnUGQoyY2Vajmt9EnmQlvxyjlkvINBmBcF8wp
 lvIAr22or0PHBXvR1lg6y1Wk
X-SBRS: 5.1
X-MesageID: 54986632
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sfEls6LE6v6C8HTyFE+RC5IlxSXFcZb7ZxGr2PjKsXjdYENS3zUPy
 2IWDGqHPK2IM2ChKN0nbYiwoEoGvZfXz9dhHANlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140Eo6y7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Xx8Jv+
 tdPv6e+WF5uDqqRgc8bSElxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuY4Igmlr3KiiG97YS
 dokdwhEXi7DXCZrEVgYF6gAs8230yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjd0PgsmC2vBwWYNRBSqoK71yU4azPsy/MUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzL9W3qaED5OUdHPHVeFVJUvLEPtalq1kqXJuuPBpJZmTEc9dvY+
 DuNsDQlz4saicoGxs1XFniW3mry+PAlouMzjzg7v15JDCskPOZJhKTysDA3CMqsyq7DHzFtW
 1Bfw6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sMvGAjdR01bpxVEdMMX
 KM1kVkAjHO0FCDyBZKbnqrrU5h6pUQePYWNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9404DCbKjPnSOrNd7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4ACi7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:ytVZpqDYlTBRnnDlHeg3sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dCsai6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsMmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZTbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczOgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxeokPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesXMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO11GkeKp
 gsMCjg3ocVTbvDBEqp+1WHgebcEUjbJy32AnTr4aeuonxrdHMQ9Tpv+CVQpAZGyHqRI6M0kt
 gsCZ4Y542mePVmGp6VNN1xMfdfNVa9My4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.85,381,1624334400"; 
   d="scan'208";a="54986632"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0c4SlDj+sh74yafBKLG1EdN/OclO2KCewJEA7EBd6PeEZuLyrvlHiLFPTY8ZCqBMpZFXJJzYNkqT4Jta/gyo6SGtVzEf3NA9c2AkdHH6nqjFdUiNVq0uxkltQPmfyxof2LS6CJ/pNu9jJfhl1gHJHAKnszxZhmLrW3m0/4X0lOMjaPG87V2rPoWb3L1v8iUMg1WsGBQGYtemAGiTTLkk7wz6nHc/TL9klsu5MDdox+Z5q12CIlpPh6mMrplj2CMD+9w14y5D0lkAxx+QdWW0TNpTGEOe38ydawgRtxG/+3LcEpH/NXnIunU6LoJwmRm1RMgYTQ+HD+ub/K4JSITZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PpxqIBmpSYx4p5gA0OY+PQaWpWDoOllj221jJ+5rHI=;
 b=kbuT1EgvDZd4LgmggbREUoi8gA9ZryNoeDqdgXPB5TC/QmV9R2zUQ4WFMeBnTZ+tXAw0WVHhumpjLpUpwNQWaakX9ujt87fiuF59gjruW+ACfBdzc8d+QaleXFyD1wCeE4wJMFOkclGKA/mfWlgwEMZnc5xr9MTvs3DsJJhq4GvOiEU89TT8ehbYTU2TNDglVqNX1tkfgP3S5XBYxkieGdoHmOCpo9IpwMtLmTlXnYb7fSy8nQ4GfB2Lg61p3sBSOvM6ioPrJ4ZDgY0LHtsscWXHlgO1KYPa9mB0N8r8+FRk0VUoP5zPVF2BSOr/BOiWlrySS2gdWhwq8u5Mq51PTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PpxqIBmpSYx4p5gA0OY+PQaWpWDoOllj221jJ+5rHI=;
 b=CECM997RJbWTQk60/BOFF1AEkSxI64KcQrnvNQJQTxaZCdPpDA8xqGuJmvJZrWodIZWITS//mECk074TxrKh965NOXCieEfyy9jU0BTukbhtBpIzY+28uO39z2vI4Jb46A/NTGaZcK8ZpteA+9y5gA0fK6uV9OdxLZ5m+qn5PnU=
Date: Mon, 18 Oct 2021 13:19:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86emul: de-duplicate scatters to the same linear
 address
Message-ID: <YW1YW8HJr6ttyd84@MacBook-Air-de-Roger.local>
References: <cf935e11-27c8-969f-9fb2-a5c0e85ccff1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cf935e11-27c8-969f-9fb2-a5c0e85ccff1@suse.com>
X-ClientProxiedBy: LO2P265CA0289.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2996230a-aadb-414a-bd47-08d992293a0d
X-MS-TrafficTypeDiagnostic: DM4PR03MB6190:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB61907604DC4AC3233E7606108FBC9@DM4PR03MB6190.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8SXMaBU9tm2BP7B1Ckdl/uVg9LMapf3nYjfxdZdr7hyhubWh3EHvuvQTCf4QQQu7aU2DLlG9RPF0CM0Am2D4BJ9rEjqLGaJ3PhkfHNBwdgBK2OFHzlZXQafpXHYFTfmbaO6xlxVoHSEn/OtBWZSqI45triwbjnpKFRVcBhM9tfihH0Q4LVkVMUdSS6yf2IFLSnL8OZ+bVlE2spTKaSGZC4+ew+onGwijtr8204sYVlur8q/pZlmmsHKw+Ge9nekUBOrGf2DTzpuh+DKN/0Uu9F1iYnZqqjLOlQvuiT3gAcRn0+NEXjy0bgTNbT1sCZ5iSxw8y3YEliXohkFG0fXULLa5G3QUKrKbL8GiOVwy3FZ85gp4mxnANhfPWNxyQLVk383a/xjFTwm9CmzpC7sxByjFxXXPviKblXr06/Y16KoQxQuTaZYjhoRnidWfHxQN/f78FyOevjN5ITqWYYAK+UotyD6r2RTlh/4SBeqoKD+UBSdEdw5UfPZKOnmDg1VBGkJ+X5kMgpeh484iHZqJgegYa+DuG9VJoEvDTX5T0P6s7bKNd0OjoWLgH9kVkCV8bXnFJB4Kyvs8EUL4ttBY11baFhe4jDzaCJBVZQZBTA7nDEY6HXqKhwkWATnlghZPO3IIIoB5+MiX9+Nv63f7Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6496006)(82960400001)(4326008)(956004)(6916009)(4744005)(86362001)(316002)(8676002)(8936002)(5660300002)(6486002)(9686003)(26005)(508600001)(38100700002)(186003)(6666004)(83380400001)(66946007)(54906003)(66556008)(66476007)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzcxckUxKzBOUG9YcS9IWmpXSWZodnpxbDB6bVAxcXA0azdnSG1RR01ma1VW?=
 =?utf-8?B?TWR5R3V4YURmQm9mU0h6eTBZck9QWU0rcDQwb0p4NHpsc2E5NzhLaVBLa0k1?=
 =?utf-8?B?N2x4NlAxd2RTZXBLSlZMaUVPL1UxelJWcHBHdHVla3hjL2xWcXduc2Z0RVVv?=
 =?utf-8?B?a0FMSHpwNTg0TGw3UTdHNmxpZ0hEcjh5akwrdzh6VEJLU1Vja1kwbDZxRVdK?=
 =?utf-8?B?cWY0czNUYWYrR0hUWGtpT1ZSbUI3NVlqdy96QWdJNWFhcHRNTDhwWGdLNWk3?=
 =?utf-8?B?N3huN1Q1alQxOU9QbTB3WFlIT1cvNzNyUHZHQzF5b1RsM1pkRWs3enhsSEVB?=
 =?utf-8?B?RU5MbFZLekp5YnZycndiblpSZ3d3aTdZOTd5UVNEMGlRNTM2SjRveUt1ak5V?=
 =?utf-8?B?TUFZUXQ1OWg3SnZQQm1Lc29zTktMcFFydjJTS0lOSnZBaTgyVVhKbHorV2JY?=
 =?utf-8?B?U2ZRNzVQZUFlcWorVWI3Sm1SVituSUtDdFJCNmFUU1g1UDBOZ1Q0YXVWbS94?=
 =?utf-8?B?Umpad2thSGRtRCtUM0tUYXV1cUtrZVpJMW8wa2hiUFBvQkNFMERDRmVtMzJG?=
 =?utf-8?B?MGpId1o2ZkpmQkgrM3JER2RBQmRpSzcwZXFoSlFpd09WOEVxVk4xb2NsMkFQ?=
 =?utf-8?B?QXAvZ3M4NnRuYVBrSTFGeXMxbU42QVFjdlRSZ0xMS29kVGVwVHJFblVZL2FV?=
 =?utf-8?B?a293TWRhK2Q2QkZjMjR2bHhIZEZhMG9mL0VqeFZHZ3pjTWNzRDRUVFlDVXFy?=
 =?utf-8?B?ZStJdUI5NDBCeTRadVdZLzJ6WnJWMjZIOHR0K25XOHAxNHBNYXkxc1BGTEVD?=
 =?utf-8?B?aW5obmpDbjB3b2xZRUlvUzdadzY5dGs0NTZMcVAzbk1rRHZkV05VV1BBWFUw?=
 =?utf-8?B?MlFudnRKcWlQMGRpbUJLRktYMmI4WG9UeU5DU2NSRFhMSVMwVFducUo0NlNT?=
 =?utf-8?B?dVZiYWVMMTMvT2IvdmRDOHgva1RkQzk5c2tFRFBDUkNuSUZRak9uNndvOFJn?=
 =?utf-8?B?blIwcGQza042NFNXUnVsb2N0SlRJQkRkVy9maitJSTVMamtBdVVpKzh2YWRT?=
 =?utf-8?B?NU81N21XT0pOVWhHQlRBMGNUNXhJN3dPOUFlczZHMmx6djU2RjNKM2N0cnkr?=
 =?utf-8?B?Q3lRd2ZsWG1EQ0U4YUtNdkxiUGFCeVlSalc0U3l0ODl4OFkwMnRMZzRMeFV6?=
 =?utf-8?B?eWhKNGo4NnVqY24xY25la2h6QWp2SDdvQ01FQ3diV2JSd29FUW9MU1EzL1pU?=
 =?utf-8?B?MGI4ZkxMQ21wTlJ2enQ3VU9YL2hLUjE2RVR4aktsaExGZlBzalBDNDh5ZEda?=
 =?utf-8?B?Qm4vb2xselpsY0pIbktyZ0xzWFRzRk0vRDFaUTVRQk1MdjZjV0wrbmRCRVVX?=
 =?utf-8?B?S0NEendNcnNzeThZejdPbiszTzlFWFI4ZWU2Z1duNURsZEloN3BYMVpBb2Y1?=
 =?utf-8?B?VmIvaWtxaEdsWE1lVW54VWk2ZlYxMDg4Q1ppdldkRnVWbC9DTm9MUWRDc0x4?=
 =?utf-8?B?aHMyUlR4eHNrek9tZnNpYlI2d2NNQ3RMSWdZMFkxejQ3MEY4OWdLYloyd1BO?=
 =?utf-8?B?TGphUjNBZ2I1Z0gxNlFnTDFlRjA1UDZIbWVmM2dJNXU3b0wxMW81RW9qSlFM?=
 =?utf-8?B?YmJldmhtb0ovVXBMQnRSdnRXYnZtUjlCaFhva3VUcG91R3VuV3UwN0VtTHlX?=
 =?utf-8?B?MlUzV1lpSERSamY1NURDdHVycTd3SDlQYmNXYkZBVVN0akhRYVZHR25RZzdG?=
 =?utf-8?Q?vCdNtoAbE8AL3TxoMBMw6VV215Vi3Galf5VnnZP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2996230a-aadb-414a-bd47-08d992293a0d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:20:01.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vklGlnDDMBGfT4ROcWqz+Tp/7I5d2/O4FQQvFh4en87lVVuqRqlmc1sOer6w1B58+kkr4aG+161vfOTe8GSyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6190
X-OriginatorOrg: citrix.com

On Thu, May 20, 2021 at 03:34:28PM +0200, Jan Beulich wrote:
> The SDM specifically allows for earlier writes to fully overlapping
> ranges to be dropped. If a guest did so, hvmemul_phys_mmio_access()
> would crash it if varying data was written to the same address. Detect
> overlaps early, as doing so in hvmemul_{linear,phys}_mmio_access() would
> be quite a bit more difficult. To maintain proper faulting behavior,
> instead of dropping earlier write instances of fully overlapping slots
> altogether, write the data of the final of these slots multiple times.

Is it possible for a later (non duplicated slot) to cause a fault
ending the instruction without reaching that final slot that contains
the written data?

Thanks, Roger.

