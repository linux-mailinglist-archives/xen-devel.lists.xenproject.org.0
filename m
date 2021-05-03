Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63013371AB7
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 18:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121763.229664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldbbQ-0007sT-NN; Mon, 03 May 2021 16:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121763.229664; Mon, 03 May 2021 16:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldbbQ-0007s4-KM; Mon, 03 May 2021 16:39:24 +0000
Received: by outflank-mailman (input) for mailman id 121763;
 Mon, 03 May 2021 16:39:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iacE=J6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldbbP-0007rz-G8
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 16:39:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f09e520-f509-43f3-97ff-6d09ba35cfd3;
 Mon, 03 May 2021 16:39:22 +0000 (UTC)
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
X-Inumbo-ID: 0f09e520-f509-43f3-97ff-6d09ba35cfd3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620059962;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6o4/YU971fkkFNF5WnOgbS3fC1pIW6vMLXh4yU3wl30=;
  b=h5u6PS6JRh9A1Hlsj2tW4TBCe67FG8ATHJulcdfDsP7Q1o6Q9ZwdG1Bd
   oi2pSQwNP1AMiMMRNAW0vzUzKYfCD1crrH2KHjrT7zsfwjpjl7xew78+z
   je4hYPURk6ozQ7zS3BWTFySBSORQW3yNKcmBnzoBBp10XWFxFyQypf995
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: S8g/NRkGAjUvdslJX2++TghVwjrjaCleEyLtjgvz3rpvCfUDaqs4qwnfmygg8MafejhuokkQW5
 OLvkXpg5YI+ceJo1i4emoDz2K1Daowqzv4oCIkRnUjiBcFRvIQnC/9Q48/GfDSl/weJY4M080A
 kUXRm8W4G8DNfwtQ4J5JQzrrWjLIiyX3KsJtV5JEHYuL0jWcLo4ayGET3HfPJONzLzQaViyEAD
 haSrXuXYlFYLMcK2d2QEFOqDSApirUv/yjc0CFEzdEffGO3uKea/AUUs3DpWMXEiqeTdQm1Ft/
 mI4=
X-SBRS: 5.1
X-MesageID: 44470930
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LDPpraNMCZG3hMBcT3Hw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQiDtRIACdD0FwWU1qBYAhEo
 Cd+8pAoFObCA4qR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+GLzGz2BACXzRThYoz6G
 StqX2D2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW1fRoymyYoAJYczmgBkUp6WV5E8ugJ
 3wpX4bTrhOwlfwWk3wnhf3wQnn118Vmg/f4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OskMTr6kCvw/NTOXR1x/3DE2UYKquIPk2dZFbIXdb45l/1vwGpuDJwCECjmgbpXdt
 VGMce03oczTXqqK1rdvmVp3eW2WGUyEhqsUiE5y7Ko+gkTs3Zjw0QCwssD2l8G6ZImUpFBo9
 /JK6Jyidh1P4MrRJM4IN1Ebdq8C2TLTx6JGGWOIW7/HKVCH37WsZb47Jg8+enCQu1G8LIC3L
 D6FH9Iv287fEzjTeeU2odQzxzLSGKhGRzw18B3/fFCy/3BbYuuFRfGZEElksOmrflaKNbcQe
 yPNJVfBOKmBXfyGLxOwxb1V/BpWDgjefxQnux+d0OFo8rNJIGvnPfcauzvKL3kFithdXj4Bl
 cFQTjvNORN5k2mQRbD8VrsckKoXna60YN7EaDc8eRW4pMKLJdwvg8cjkn8xszjE0wGjoUGOG
 9FZJ/3mKKyome7uUzS6X9yBxZbBkFJpJHpU3ZAox42I1r5GIxz/+m3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQEB8+4NHmZy18evmiDQZtZuqDr37aqRroISrIdHIBhHwTCEBJ43Sxwrn
 1YVQMCTkjDUhX0iauki5QQLPrFd8Z1hTqqJcI8kwOdiWys4eUUAlcLVT+nVsCaxSw0QSBPu1
 F3+6gDxIablS2XMms5iuQgOFhqYGCaaYg2SzitVcFxoPTGaQtwRWCFiXi/hwsocmTnzUkUm1
 fsNDaZY/3NH1pbtE1Jy6qCyiIGSkytO2ZLLlxqu4x0EmrL/kx+1uKGfYKf+WqcYFlq+JBXDB
 j1JR8pZi9+zdG+0xCY3AuYHXI935M0I6j2F7I4aYze3XurNayFnawLBOVv4Z5gLdzi29V7F9
 63SkuwFnfVGukp0wuaqjIZIyFysmAjiu6t9xv/7mS0tURPd8b6ERBDffU8LN6d5WS/GKrN/5
 V9kN4vvey/dk/2ccWLzKnLbzhFbjPfyFTGO90AmNRxh+YVsrA2IrzwFR3v/1tD1A8lLMj1mF
 gFKZ4LqIzpC8tKRYgqZyld/lAVj9yBI0sgjxzuDoYFDCQQpk6eG+nM3qHBprUuCHCQvQfcOV
 GQ9CtG4vfONhHzooIyOuYVIW5MblI752kn1OSed5fIAAHCTZAIwHOKdlu8eqRaUq6LBPE5qQ
 t7+ciBm6uyezDj0A7d+Rt9LaQmyRfrfeqCRCaNE/VP6dq0JBClhbar+te6iHPPcgSAAn5ozL
 FtRAg3dcRMij4rkY0x3GyTc8XM0z0YumobxypmmF7r0pWh+0HBEyh9QFTkvqk=
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="44470930"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkgsCsqSmrNmqC/DjJxVkHL3tHze3iiVg6bUuXx3+7X+hViTvZYXtFrKATOCw69fODooBqSatPGKntOzAE2gYBIHYHskDuttgMsyqBJgUza2UnNfkN5KI6n4RclULGnTtLW0Zm3G7CpbqM9KEX1rSEApqzLy1YI5w9KQYHRD9ym34cN2pXWykeFy+g6s8OwmQXTdrVDyqmq+l1MerEBDmYniAlrQj2eaADgltO28oP5tFftT5aIpN40zNFoi0e9tRt58uoahvPUaflHtMU8lN9ZDAf+hQJ83YGSbyI2D/HDykJOCRpXnOaqmiQGt3oP66pPD6VU2/Nmqh7a+pCYuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2WKKilRHeQ1aKc85MkKclO66P1DzP9xS2Lh9EV+1AQ=;
 b=ioxlohnLrW9SV9sG0q7bXugz5noIJGDt4LMPQwMXRBgC1dipyvDNpSR1zM/CKfPs2nq/ldHkWRexKYMaIh4JGykFu99ljQeC5AQNvB+kMqGaOTJoAemmUlNP6TkA1LZA89ud9sRoDN0/UI3ipn2YfcSHtR+P4zS2lmfN6wGNiJP7c4UpJvdv+6zqVRdvnpHTwsSaNh2wwmA7bKPjjTHND3Mob9MkEQ6DT08qDacxdjqgD+C2od3ETPv1Zn0TXmuQWQ4dNWQ7lpTyo8ZnpQkLd8nBTpL3aAJPgBNFkaOxw8bd6TT7MvYDyD04DJ4QcKh3V1VqQ6zWnb6ZEKzCGrSGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2WKKilRHeQ1aKc85MkKclO66P1DzP9xS2Lh9EV+1AQ=;
 b=g0+ujk7K3IYrs8FVpRRaZWwavoVuTwEG9G9cWvD2xw3B9hsZcRq68neLpBUd7fRryDroGTGV3KA2ROufPA6VIIQ83qJBFS9QA9AnFOBdaYhcIvEwUOpaY9CnfRe2nBA/jBm2w1Q+atmfP98mXMkPiEJM6x9mZq8vfxq62w13Dr8=
Date: Mon, 3 May 2021 18:39:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 01/22] mm: introduce xvmalloc() et al and use for
 grant table allocations
Message-ID: <YJAnMAmob1Y5myp4@Air-de-Roger>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
 <69778de6-3b94-64d1-99d9-1a0fcfa503fd@suse.com>
 <YI/e9wyOpsVDkFQi@Air-de-Roger>
 <aeb6aa8e-7c90-be22-1888-21b7b178e1d1@suse.com>
 <YJAOm+rmKb5gbYJq@Air-de-Roger>
 <340fed73-973c-feba-074d-8bfa6eeae6d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <340fed73-973c-feba-074d-8bfa6eeae6d6@suse.com>
X-ClientProxiedBy: MR2P264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::34)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf06cd30-c278-4a2f-900f-08d90e51feee
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29234CD7AFE3F38A4F3968F48F5B9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKPDdCduzeXWKIy1dPB1QqACBwscMrK91NSeH/lQu4tB+7yALtFYu3k7fxW9bu7K3dYdgXdUC9p8pizja5EW6jXa0HMnGc3rGSyQ4VkZ/pYzm6DWbJ9T1ZY4h92rbRpcfH8s4nXnPCLtOT8oXcf36UYHs2uUgZL55huHiHh5Pb7WV7oVZk6sEHR9d/VYi6aBC8Q1TRlys7F0yy8M38LUdzO2YdkQOXgBh9J8AqXg+VyhNhIlOscUZqT0o3aTE1zp69VovswA7mm1EcSStMPTyBE6bLw7vJvKXVYHu6H2c5oo666Qvht6gf2/jRo/ki+w1QLU2xb3X+auIaBB8DcSf9+E3TuacwnWBCILc7quabqQK2fJVrkpMhd8hZbLAd5BZvXnML2BuBAmsoSRu0zkc07dVkf1eP/JuWOFEdglu2CgdIqf/02qzww3RfrZvnqxcdWlhZKcE7jynf85wgxXA1xMIH8Ewtu3OLkuvm6C+zsMZXHqXRFJC0dcO0Gl6acAxTkfHcIOuRZi83tRdTmjIiGDxo0+MyNAxAGDyrCAqmMCtZ2Ev27C50zkvT9PadS8sJ7odf+AvPB4H2/Q72x5HqSPSf83rOPX+w6bByMIrdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(136003)(376002)(346002)(366004)(6666004)(316002)(478600001)(8676002)(8936002)(54906003)(4326008)(6486002)(9686003)(956004)(33716001)(16526019)(186003)(2906002)(5660300002)(6496006)(6916009)(66476007)(66556008)(38100700002)(66946007)(53546011)(26005)(85182001)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEJlTmtVa2szUWE2V2R4a2hZYi8zS3MrbEVFY0o1MkFMUkc1S0M1Vmw0aGVn?=
 =?utf-8?B?SEdFK1Q1TWFIeUtIbU9iaUFYNDFFTHAvWWRkSWdzam1WNkordUp0WGo3eHdn?=
 =?utf-8?B?dXI5K2I4bHpKRWdFa01EWUZxNXk1a1Bad244N0JaUVI5ejRTbldFTHVocnZs?=
 =?utf-8?B?aHVackxzVzNjUm03bVp4MzNMMUhmWGszNzdkQzBGeEFTbW4zNUhiT2ZjZTRh?=
 =?utf-8?B?d28yQlBaeWJmaWtEaTMwc1FzVnVvSU00V0puWStTaGh6SWdwRFFFWDdvdElM?=
 =?utf-8?B?S1dmaHVGemsxKytzSmM4UEFVVlp1ekl5WjlGVnoyY3BKK3JDZUJ3YlRIZUNS?=
 =?utf-8?B?Y2d1SUlWNmg3clZpVTU0TSt0amtFbFN6KytKTWxENXh0QWxMdC9wMkwrRVVY?=
 =?utf-8?B?NGhSa214UGZwa2hkaExsSGFFQUxIU3dUblhaWW8zN2lDVlYxL0VyWnRLUStE?=
 =?utf-8?B?R3hmMVJQZlFxV2o5QUpRRXQwOUZVMFp5Z2t4dHcrYTZUc0FOUXMvR0F3dmFJ?=
 =?utf-8?B?azFpRFR0cjRYMlFFN2dUMnBaZ0J6VjFRMUVMeTdYR2JNUVBjVElWV2xRd2hy?=
 =?utf-8?B?TTdqWmhMeTJMZlRZZXpYTE9zeWFNbW9nTExDbG1xZEFvZVlNVEJkb0Z3VjVJ?=
 =?utf-8?B?c2pVNnI4MHF2bnQwMWd2ME1SR2pHTXQwTmNFY3E4bVI3VldZdjhXM0pKak5L?=
 =?utf-8?B?S3BPcEQ0S0pQWUJPRTh6U2wzS054ZmxrUEpRZjZvTTJmeS9MSE93UlJPbUZE?=
 =?utf-8?B?U3A3bm5xRGdTZW1VMWVFN1J5UjhTUTB2VEtRR3MwaVMrZlZBS1orMGozcUdR?=
 =?utf-8?B?VzlLenNTRHJXdWg3TXVCcnRxc295RzlXb2tGL3QvdXlTeTZXTnRINGRSUG00?=
 =?utf-8?B?QzJtRitIN2FVRm9iSER3NzBIK3dUT0V6MXczc3BpN2F5L3NmdVA1TXNUbS8r?=
 =?utf-8?B?ZkxvWUd0K29xdW0zbXRIUEF0MmJ5Ulh1bUhQWnYrMWtydFo1TGIvNDBkUzBV?=
 =?utf-8?B?Q01UaVJ1RnVERVFmcG05djVVdHhqNjR2RG1UVnNtbG1ZQnNpYXFXdzR6NWhH?=
 =?utf-8?B?bnlnNTRrcEN0ZjYyaGdMdjkrZmlaVVJlajFrZ1RELzBzcVBGVGpNc1o0U2kv?=
 =?utf-8?B?MW9lV1VnbWJuVno0TENiS3lFZG9halF5REY1WTVwYUpoV1FBMk5MTEViWlJw?=
 =?utf-8?B?RUxLSS9JWUxLV1BUdFlrME10Y1gwRFZ4b3o0TnRvcjlyM1BHZjEyTGdZa3dn?=
 =?utf-8?B?dkdoSkdYNGh6RkpESmV5ajJZVXEwK2dqQk1GeUxuN2lZRUlkaERyYjFhT2di?=
 =?utf-8?B?bWZwOWtPY1FzUmI0NDdpTzBkZ2srTWlqVVA4NjJpbHRtQWdZczVwTjh3ajh3?=
 =?utf-8?B?cHRzTnlyZmF2L25ib2FxcU9vUU0zWGVqTy9OelhRUUpmLzRFMGJ1RzhPL0JI?=
 =?utf-8?B?bk4zVGpnb2ZGc2tsV0ZUc1dYMkxIRnhycHpBNVJ4eVRwc0tXMHNXWTVrYzFj?=
 =?utf-8?B?Nis1SWVITFN2WnVXSURISHdNc3VlRWhCSFAwM1l0ZzdRR2RRTHZnUHZQSWVr?=
 =?utf-8?B?MHFudFFvdjQxZ1RVcVo1Qzd3eWU5QkpleHdPUDN1aFBxSWErODArUFN0bHFy?=
 =?utf-8?B?YmxHYzFnd0NBeThxUnBWcmRDK0lFbERSR0ZUT1pwb0s4anhwV28weTl4WFAx?=
 =?utf-8?B?YzBjVDRRVjRRSlpNRG9VRFZWUDhxTjFmWWhWeU9vUTBEa3NkMnUwRXpLRmxT?=
 =?utf-8?Q?ZgEX48hjgxtymTXpGoaXQwJuo10W0k91n6rNXcs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf06cd30-c278-4a2f-900f-08d90e51feee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 16:39:18.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwBzeqZTkydkZM8GvvVrtBehqwAE8fE20l8aFPQjKQnDl1gzSUKnKmhmFqL95uKj0sGYPKsd+gvrknft/UHHgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

On Mon, May 03, 2021 at 05:21:37PM +0200, Jan Beulich wrote:
> On 03.05.2021 16:54, Roger Pau Monné wrote:
> > On Mon, May 03, 2021 at 03:50:48PM +0200, Jan Beulich wrote:
> >> On 03.05.2021 13:31, Roger Pau Monné wrote:
> >>> On Thu, Apr 22, 2021 at 04:43:39PM +0200, Jan Beulich wrote:
> >>>> All of the array allocations in grant_table_init() can exceed a page's
> >>>> worth of memory, which xmalloc()-based interfaces aren't really suitable
> >>>> for after boot. We also don't need any of these allocations to be
> >>>> physically contiguous.. Introduce interfaces dynamically switching
> >>>> between xmalloc() et al and vmalloc() et al, based on requested size,
> >>>> and use them instead.
> >>>>
> >>>> All the wrappers in the new header get cloned mostly verbatim from
> >>>> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
> >>>> for sizes and to unsigned int for alignments.
> >>>
> >>> We seem to be growing a non-trivial amount of memory allocation
> >>> families of functions: xmalloc, vmalloc and now xvmalloc.
> >>>
> >>> I think from a consumer PoV it would make sense to only have two of
> >>> those: one for allocations that require to be physically contiguous,
> >>> and one for allocation that don't require it.
> >>>
> >>> Even then, requesting for physically contiguous allocations could be
> >>> done by passing a flag to the same interface that's used for
> >>> non-contiguous allocations.
> >>>
> >>> Maybe another option would be to expand the existing
> >>> v{malloc,realloc,...} set of functions to have your proposed behaviour
> >>> for xv{malloc,realloc,...}?
> >>
> >> All of this and some of your remarks further down has already been
> >> discussed. A working group has been formed. No progress since. Yes,
> >> a smaller set of interfaces may be the way to go. Controlling
> >> behavior via flags, otoh, is very much not malloc()-like. Making
> >> existing functions have the intended new behavior is a no-go without
> >> auditing all present uses, to find those few which actually may need
> >> physically contiguous allocations.
> > 
> > But you could make your proposed xvmalloc logic the implementation
> > behind vmalloc, as that would still be perfectly fine and safe? (ie:
> > existing users of vmalloc already expect non-physically contiguous
> > memory). You would just optimize the size < PAGE_SIZE for that
> > interface?
> 
> Existing callers of vmalloc() may expect page alignment of the
> returned address.

Right - just looked and also the interface is different from
x{v}malloc, so you would have to fixup callers.

> >>>> --- /dev/null
> >>>> +++ b/xen/include/xen/xvmalloc.h
> >>>> @@ -0,0 +1,73 @@
> >>>> +
> >>>> +#ifndef __XVMALLOC_H__
> >>>> +#define __XVMALLOC_H__
> >>>> +
> >>>> +#include <xen/cache.h>
> >>>> +#include <xen/types.h>
> >>>> +
> >>>> +/*
> >>>> + * Xen malloc/free-style interface for allocations possibly exceeding a page's
> >>>> + * worth of memory, as long as there's no need to have physically contiguous
> >>>> + * memory allocated.  These should be used in preference to xmalloc() et al
> >>>> + * whenever the size is not known to be constrained to at most a single page.
> >>>
> >>> Even when it's know that size <= PAGE_SIZE this helpers are
> >>> appropriate as they would end up using xmalloc, so I think it's fine to
> >>> recommend them universally as long as there's no need to alloc
> >>> physically contiguous memory?
> >>>
> >>> Granted there's a bit more overhead from the logic to decide between
> >>> using xmalloc or vmalloc &c, but that's IMO not that big of a deal in
> >>> order to not recommend this interface globally for non-contiguous
> >>> alloc.
> >>
> >> As long as xmalloc() and vmalloc() are meant stay around as separate
> >> interfaces, I wouldn't want to "forbid" their use when it's sufficiently
> >> clear that they would be chosen by the new function anyway. Otoh, if the
> >> new function became more powerful in terms of falling back to the
> > 
> > What do you mean with more powerful here?
> 
> Well, right now the function is very simplistic, looking just at the size
> and doing no fallback attempts at all. Linux'es kvmalloc() goes a little
> farther. What I see as an option is for either form of allocation to fall
> back to the other form in case the first attempt fails. This would cover
> - out of memory Xen heap for small allocs,
> - out of VA space for large allocs.
> And of course, like Linux does (or at least did at the time I looked at
> their code), the choice which of the backing functions to call could also
> become more sophisticated over time.

I'm not opposed to any of this, but even your proposed code right now
seems no worse than using either vmalloc or xmalloc, as it's only a
higher level wrapper around those.

What I would prefer is to propose to use function foo for all
allocations that don't require contiguous physical memory, and
function bar for those that do require contiguous physical memory.
It's IMO awkward from a developer PoV to have to select an
allocation function based on the size to be allocated.

I wouldn't mind if you wanted to name this more generic wrapped straight
malloc.

Thanks, Roger.

