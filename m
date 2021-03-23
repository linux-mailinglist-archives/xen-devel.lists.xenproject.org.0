Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947AD345BA3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100582.191777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdwp-0000dt-0t; Tue, 23 Mar 2021 10:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100582.191777; Tue, 23 Mar 2021 10:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdwo-0000dU-Tt; Tue, 23 Mar 2021 10:07:38 +0000
Received: by outflank-mailman (input) for mailman id 100582;
 Tue, 23 Mar 2021 10:07:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdr9-0006c2-1B
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:47 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce34c28-814a-474a-b18c-56b37af096c9;
 Tue, 23 Mar 2021 10:01:37 +0000 (UTC)
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
X-Inumbo-ID: cce34c28-814a-474a-b18c-56b37af096c9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=elgicdoLLjyAPG6mTxXmUlhWyWbTk4KjmQet+vnO69Q=;
  b=DZkitnqXKuZBiIC1A9HeW2mmWTxmekPiKQcU0Ii+3ainK8Rf2ygpK0Dh
   bqPLZaFZpnb6i8ltZagZGa/B5yxzQ5f6QuY4B+tGbjcelmW3fZje9HoDl
   Ck92fAWWsbMUyArW7W/hAEnMnYyn0yA7zm4mXm8nYpOlcZvJaS29ha7Hv
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DK49BHw+0b9sC4ZyTccq2A1VcLd2uJ38RZw+M7GYiGZWsQJZrYU9+IQlTPLx93pQg4SHNHvmYi
 ZhSrtiQTEnTAaPluhln1G1WFLXrChiT9uKmInCdIsgQW2FP84COtMeVuQBE2hwPz35GlfueSfQ
 KHrcem9qGl83v0RKMmjKMMH8pT5RBiNY+1uWBC2j/TkeP2RALVafPd1C0x32ljqJVeet9f4GIN
 mZDLQz4n1rZ+G/5RWYriaBG+ubMhziy3HU4PlWoDzpHVFFuMrVYxZ0/GRh65b42DXnyIh/zh5v
 e34=
X-SBRS: 5.2
X-MesageID: 39900444
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:oW3gKaFSjQIIjIkOpLqFbZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQacjHJ
 2H6cZd4xamc3IbbsO0b0N1I9TrjdvNiZ7gfFo6FwcqgTP+8A+AxZzbN1yj3hkYWy5S2rtKyw
 b4uiHw+6nLiYDc9jbyzGnWhq4m+ufJ6twGP8CUj9hQFzOEsHfSWK1Ee5mv+A84u/uu7lFCqq
 i9nz4FM95o433cOkGZyCGdojXI6zol53/8xVLwuxKKyqaYNVFKefZpvo5XfgDU7EAtprhHod
 h29lmUqoZNClf4lDn9juK4Ji1CrFa+onYpjIco/htieLYZAYUhyLA3zQd+FZcNGz/C84Y3EO
 ViJ9G03ocpTXqqK1/epWVh29qqQzAaGQqHWFELvoiv3yFRh20R9TpV+OUv2lM7sL4tQZhN4O
 rJdoxuibF1V8cTKYZwHv0IT8ebAnHEKCi8f166EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5YnXRaQTOvNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEVlde6qfl3OLybZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/vkhXVajpd/KN53KuuTXfO27HsuuLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmzzlKgAVZTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9bKLPjmaWrmHmu8Q/zniFUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+3ebOBllTYfzHB
 REr1p6vYK7RqbgixwKOpaCCCa3nnETrHWFQ9M3gauY//rofZs+E9IBQ6x+FQLCEjRvggZ0oG
 J/aAsJL3WvVQ/GuOGAttg5Fevff95zjEOAOshPs0/Ssk2auIUSXHcBZiWvVsSWmA4qYDJRij
 RKgugiqYvFvQzqBXo0gew+PlEJTGiMGrpJAD6IY5hulqnxdBt9SnqLgjKmmwg+E1CahHk6ty
 jEF2m5aPvLCl1StjRj3qHm/EhdW0+dc0hzA0oK+rFVJCDjgDJewOWLbq283y+tcVME2PgaKy
 yASyAVOBlSy9e+0wO1lD6OGW49/IgnOvXQAd0YAvfu80LoDLfNubANHvdS8pogCcvntfUTV/
 mDPyCSNzH1BooSqnqoj0dgHBMxjnYqkfnlgkK4qEe52WMyGvrULhBNQaoBL9SV8mjjQLKp3f
 xC/KYIlNr1Fl+0TNiMjZzzRXpkDDj4pGatVeEmqZxOp8sJxfNONqiedQGN7W1N2RU1Edz9m0
 wfSplq+bypAP4bQ+UiPwZiumcznNuBLEEXohX7L+83c1YqlWLaNbqyks31gItqJkWAoQfqUG
 PvixF1zrPgXyGZ06QdBL91CWNKaFIk4HAKxpLJS6TgTCGrffpE5ly0LzuUd6JcUrGMHfE1og
 xh69+F28+ReCyQ4nGcgRJLZoZP+X2gW8W8HUalHvNJ6cWzPRC0uZSRifTDxQvfeH+ccEQXhY
 pMaEwWYIBis1AZ/fIK+xn3bLf2rEIjm0ZZ+hd9mDfWq9Gb3Fs=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="39900444"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOKtNw58QdCQiPzStDBaWTYixloQZO3WhTzwSha0l2L+yqOqK7eLXwMClH/Sc8yoJrGlyOTL8skRLJlEswRFCVsX2cc+UkpHJNzGH7q+bMDspwMUCDrzkDLOHB1uoVdTPJxUPc3R7Z11D7bAaRJTzZ3ltCbmXsaVLWz/EF2WLOlu/YXLHYju71SF2LYfAsASq/6Tcdsj9uoEVspyX4HNxy0COdZeuKteDEuLN3XSO8oLLZzFgQniRPpnmFX4XYUX2CnlVtLHnE9YXZqhqxqA2DFmvudPO/kqroggalKwczInL7sffFEmNH4gHjyNP4ubfWTbekqm/IhhXBVLk16MkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sAstwZ3FZzzgYovYIPvWV/JpZRMk/Un8JhdEN4a52A=;
 b=I+LsnmI+QZuBTFfTCX1N51EhE8BeG0Ap/QAf/GtoYaY3g8XKKGbJZNCccGcpvhe0I1GU1EsVYZfLMD5AOpCZOT6nAkcfQ2DZ/doWubd5bGKU/CuJJJgAfh9JIrMEaK5eWPNEOUEVUNGjnEhkHKMvRBlu3d3QP2qrRdJGvM8JMC1SE/bEVk634mag7Y8QcY+hc7ee//pTz26/I4jDmlpG/PVOed388hsBi81dTGJ1Zq4q9dHNE68aQojhB0FXT9wTGRcthDZg7k0iaL9O7VfAh0Qpbhv1aXzDQz+cVtDngWZjMNpI1oHd0P7lN+WxkKxqs8RbZ7e4xQK1s/b8xz+ffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sAstwZ3FZzzgYovYIPvWV/JpZRMk/Un8JhdEN4a52A=;
 b=Ajs2cmCZbeBkD9V2vWhH4FMyo1DhToX0513zehcMUlAFgQrhqn3Ot5UUs/BD06FbwQ7VHH4WoRdiM3OGp9QaHhv6DVmkbcX8C0qMPOieZzdWZARkzga+TrHWd+oFKQQZrt5TM4QOsCCuLuwpLXSiMQxPMORYxcH81WZctuhaMzU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 19/21] libs/guest: apply a featureset into a cpu policy
Date: Tue, 23 Mar 2021 10:58:47 +0100
Message-ID: <20210323095849.37858-20-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0126.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d14b9d14-0391-40b2-09f2-08d8ede29d6f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49699F6F752C3E530DF89C3E8F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RTkijCKJ1KFTtE8o9PKnBhvssfJyfO7/cpwRLa5J8yvfBPQ8YkqZ+o/2AxWZuFoIGu3KajxME3ooQj7kAcbgEXS2hxjMl3PtghpU4ExZgYYSWTauTjdYTxF5rwwgoS16pSv9Wvu9qvU6N1ltDVNnXIbspBV5AiEfWwTrVI6tWF1xq9khhK7mtUZVXwTRiCl0ObmzxS5wnxc8pmRbO7KZuG/GhHUqsV5dmxEVNCy27rBukBNA44nDJSc3B3dcJSrG2sLr/Zv5awdKZL+Zr3mMWDF+rRXWZkTHDR6Amky2FjKZP6eSoOkAfTxFNGVBqenYxuUWFdy9QNqkAIOSY4L2OUv6Xl97EIg1+cx/PPE+qaM+nKOGM6MSmEx43TuunzBmyAFVw+a9uKGD8sZjBDCe9iw9h08RBI6AoO6eGw2kxgArm1FjWJRh8WmtVES/B8pCChEOIEmnqRAOrLgpN2naIKtJYBgmV84qJwo35a8mAnT3DQySZBqyHPsNBw+6g112DO7cwrZb3ATLF757aSm5K2ZtqV5EgVtTf4OLOmif3J+IX0s296Ie7ja4w1TFf6faEwRE5bq3FHREUKToVRSFUQSZdS3c+HByjSTNJO8GDPX5EWrird9jrasJh2ocSVUVTsSqi3EgrNh7SjzXJpRtmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEtNMytaYWY0bUdLbXUrUWZzRk4rQXFzeVNGcHFYcEtyYXBNSXY0U3pQWmU5?=
 =?utf-8?B?MWdLOXdwSEhjUFdFbkFxTnlUdjFFclNldmhVWUpVSStaRXdtdmQ1VjNuRjVm?=
 =?utf-8?B?VENSclBRUm5ZOFhtOUZFWlkzZXpOSFpHcW9LaWhxanVjZFlTQkV0bnB5RW1N?=
 =?utf-8?B?TDRVQ1dLbFkyV0orNVZwTmRmbHAzUy9NS3FsSVhXb2VlVXV0YlNCaEt4OEZL?=
 =?utf-8?B?T0ZZUkhCUzlhZ04ySzJORjVnM0VDbkJHaTJ6NFlRSzJMTWlaRTJzNnJOOHhD?=
 =?utf-8?B?UHVKR09Gay9mOGdZQzF6eEJCdjFudHFQOFR2THlXY1NYTThNOVYwNlQzdjJz?=
 =?utf-8?B?NURxRVpWWGFwV2NVeVA3ajFxZHJWZzlPTGVPS21TNWVxbUpGNXAvblRGaHhV?=
 =?utf-8?B?eEpJYXJYSUlUemJzNk40U3c3a3VjNFhONEpHem9hWU80R3lUSW05cFZHUWo3?=
 =?utf-8?B?VDRkL2NmUlJseTFCeGdLVzhoczkvZFpNWndzOFh5ZTI1YlBIMFdYSlp2SnZz?=
 =?utf-8?B?Tjc1V01sQzQ1RU4zN291ZHhhbkJUSjVtUkFWSlIxMTNQdVFtb2ZqWmlwSEdv?=
 =?utf-8?B?MnlqOEV1N0NCaDNFbnA4cjB5ZGhvWFo2RnV6V20yQ3llcmVDeHd5ZlhsSjZC?=
 =?utf-8?B?MkF2WTZNMDlheVRDZXprbXI5UW9YZ2tyS1QwYklNRFczSlRnUFg5OFVLaWl1?=
 =?utf-8?B?bElZNWhuQnp3OGJ2SnpSdGg1SjdKNmEwYkxVMTRJUW5EMjVqMURnNEhtbFhO?=
 =?utf-8?B?cXcyY3ZjeG5UeVNjVjNrbjBXdnpIU0Jub0pWcXY4ZXgxa2htbFJ6KzkrV1RL?=
 =?utf-8?B?ZWRWcGI1WWxlRDFWWmJiS0tET1FGVk1Ibnh1aUhJRzcyQXNmUVkyZlIzL1Mx?=
 =?utf-8?B?dVA2RmIvOFd3NmFTenFyUjZZSW91eERNdDVXRXFFTE0xMFYrdE5HMElDdldn?=
 =?utf-8?B?OHpYQnBvd3VKdFo0UERsc0l0Unh6bmQreUxpVVJMditKaHhrbmswekNUZitz?=
 =?utf-8?B?VXNoVHFVU3I0MWN0ZE5LVU43bmllQm1NR3AraGNLelJOdUVPSmc5czdwZzFG?=
 =?utf-8?B?eEREcDZHZG0xV2tVcmQxOEViNlV1MVpubW1LN1pzR1oxK2NSck1iWE9sc3ln?=
 =?utf-8?B?V21OZ0FudnFub3FydW1IT3lIeW0xdlhoMEVqQ1V6VVpyN0V3bHQ0MjJGQnE1?=
 =?utf-8?B?QzFNdTRZZWRvUFl2WWVjeS9oT25KbENSdjlUTVE3dmRPUVVOR0dST0FlVGZO?=
 =?utf-8?B?VkFtMjJ0SXQwNk8wYUJFdHpDbnFhTDlUM2YxcnhmQ2dubFV1L3Fwc0pVU1FE?=
 =?utf-8?B?SzE5eGg2d2pZMnhZbGlHRFZVMFVRYUpQRkpKeUlGa09zTzNtVnJpVmtIM1BF?=
 =?utf-8?B?bHdkSDkvSCtDWk5yKzlFSkNVWjh4SW5zUTlHOGF5d3hDUXNPbTFwbWMwNUhN?=
 =?utf-8?B?eTVXYnJrb1kvVExzWWg1dnhKR1BZV2pYeDcxbFUvT0hjcm9Mc004OTJSSTE2?=
 =?utf-8?B?V1hPUnFvNHdMcGFIMTZiQisvSVQyR1pXOGE5QWFHZmdQQmlGQ0ZZWjhONEQw?=
 =?utf-8?B?cGpOTUwycFo5SHdjY0NXLzZub294THYxc0drYXl2bmN0YW9kQmowNUZlOE85?=
 =?utf-8?B?M3VOQ1hoc3NtbWgzUUFvYWt2K0tSMTVxa1FmbDBuanpCZFZLNC9zem1ucHZ2?=
 =?utf-8?B?ZDNJbHFMOFNIT0x0eGdLRkRSRWZBVkZZYUdudmg0d3l5cVVxdGpRaWMxOFpW?=
 =?utf-8?Q?OlXTAiIgLZczEw4//k6vho3dMJGsCKRmd+TnB6q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d14b9d14-0391-40b2-09f2-08d8ede29d6f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:01:23.3851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeDoZ/E7oFk2udtTDTughx7lpIwXtbR5DlwlcXptKtz3yBpdFrW39UgbLZt2mnjUStF1ySzMQNZVxnbgBenWGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Pull out the code from xc_cpuid_apply_policy that applies a featureset
to a cpu policy and place it on it's own standalone function that's
part of the public interface.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  5 ++
 tools/libs/guest/xg_cpuid_x86.c | 94 ++++++++++++++++++++-------------
 2 files changed, 61 insertions(+), 38 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 07b8bfc08aa..a830fac1d12 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2639,6 +2639,11 @@ int xc_cpu_policy_topology(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
                               const struct xc_xend_cpuid *cpuid, bool hvm);
 
+/* Apply a featureset to the policy. */
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index ce4a4a1a436..96b969342fa 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -450,46 +450,14 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( featureset )
     {
-        uint32_t disabled_features[FEATURESET_NR_ENTRIES],
-            feat[FEATURESET_NR_ENTRIES] = {};
-        static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
-
-        /*
-         * The user supplied featureset may be shorter or longer than
-         * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
-         * Longer is fine, so long as it only padded with zeros.
-         */
-        unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
-
-        /* Check for truncated set bits. */
-        rc = -EOPNOTSUPP;
-        for ( i = user_len; i < nr_features; ++i )
-            if ( featureset[i] != 0 )
-                goto out;
-
-        memcpy(feat, featureset, sizeof(*featureset) * user_len);
-
-        /* Disable deep dependencies of disabled features. */
-        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            disabled_features[i] = ~feat[i] & deep_features[i];
-
-        for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+        policy.cpuid = p;
+        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
+                                            nr_features);
+        if ( rc )
         {
-            const uint32_t *dfs;
-
-            if ( !test_bit(b, disabled_features) ||
-                 !(dfs = x86_cpuid_lookup_deep_deps(b)) )
-                continue;
-
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            {
-                feat[i] &= ~dfs[i];
-                disabled_features[i] &= ~dfs[i];
-            }
+            ERROR("Failed to apply featureset to policy");
+            goto out;
         }
-
-        cpuid_featureset_to_policy(feat, p);
     }
     else
     {
@@ -1230,3 +1198,53 @@ int xc_cpu_policy_topology(xc_interface *xch, xc_cpu_policy_t policy,
 
     return 0;
 }
+
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features)
+{
+    uint32_t disabled_features[FEATURESET_NR_ENTRIES],
+        feat[FEATURESET_NR_ENTRIES] = {};
+    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    unsigned int i, b;
+
+    /*
+     * The user supplied featureset may be shorter or longer than
+     * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
+     * Longer is fine, so long as it only padded with zeros.
+     */
+    unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
+
+    /* Check for truncated set bits. */
+    for ( i = user_len; i < nr_features; ++i )
+        if ( featureset[i] != 0 )
+        {
+            errno = EOPNOTSUPP;
+            return -1;
+        }
+
+    memcpy(feat, featureset, sizeof(*featureset) * user_len);
+
+    /* Disable deep dependencies of disabled features. */
+    for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        disabled_features[i] = ~feat[i] & deep_features[i];
+
+    for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+    {
+        const uint32_t *dfs;
+
+        if ( !test_bit(b, disabled_features) ||
+             !(dfs = x86_cpuid_lookup_deep_deps(b)) )
+            continue;
+
+        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        {
+            feat[i] &= ~dfs[i];
+            disabled_features[i] &= ~dfs[i];
+        }
+    }
+
+    cpuid_featureset_to_policy(feat, policy->cpuid);
+
+    return 0;
+}
-- 
2.30.1


