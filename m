Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54806F6945
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 12:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529682.824344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWVH-0000X6-7U; Thu, 04 May 2023 10:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529682.824344; Thu, 04 May 2023 10:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWVH-0000UX-33; Thu, 04 May 2023 10:48:03 +0000
Received: by outflank-mailman (input) for mailman id 529682;
 Thu, 04 May 2023 10:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x2gh=AZ=citrix.com=prvs=481e65374=roger.pau@srs-se1.protection.inumbo.net>)
 id 1puWVF-0000UQ-Aj
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 10:48:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 218ea07f-ea69-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 12:47:58 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 06:47:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 10:47:52 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 10:47:52 +0000
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
X-Inumbo-ID: 218ea07f-ea69-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683197278;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=P2pHireLaG86uQAbiKAmSpJCeImRzsJeRL5SrU7VkXo=;
  b=YjC3AvPc9ea1/b/1RFlXEA/etTN77BnKqfSye7OSQmh1LugZVItk4Qf+
   g34pjIrTtTKOJqrsbrYn0kfEYg2O2wtLt+fFVDgoI2Af0OZHa2rf57uGq
   ezY9sICuVOfRJkv7WP0eQWKUmabjXoEMrrnOAyjJ2KwaxGrCwkpz427Fj
   A=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 107169153
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kRsbQquMo9JJrpona8siKVQos+fnVHBfMUV32f8akzHdYApBsoF/q
 tZmKW6EafqPYzehfNpybIyw/U8A6pTQzdFlGQU5pH9hRCtD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKGyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwExxcTBusgNqM5LuDd7R0nvk/HvTmBdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4W9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAN1LSuzhq6UCbFu7ySszDExPBAaCo/ylu0W6QOAOD
 UEN5X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uVSs45SfHqyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:EMNG36oNWObjVr1ly/DdNQQaV5t9LNV00zEX/kB9WHVpm5Oj9/
 xGzc576farslgssSkb6K690KnpewK7yXcH2/hhAV7CZniohILMFvAA0WKM+UybJ8STzJ846U
 4kSdkANDSSNyk1sS+Z2njELz9I+rDum8rE6YiurQYJcegpUdAd0+4TMHfjLqQCfng8OXNPLu
 vl2iMonUvGRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuC+laDPY0L/ErPhTMbsYuWqbGiGpsHbJxrtHof
 92NznyjesKMfuF9x6NtuQhknlR5xCJSb5Lq59Ns5SZObFuNoO55LZvjn99AdMOGjn355sgF/
 QrBMbA5OxOeVffdHzBuHJzqebcFEjbMy32CnTqgPblmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKNZKPHHRlDlUFbJKiafMF7nHKYINzbErIP2+qw84KWvdIYTxJU/lZ
 zdWBdTtHI0eUjpFcqStac7vyzlUSG4R3Dg28te7592tvn1Q6fqKzSKTBQ0n86ps5wkc4Tmsj
 aISeRr6tPYXBzT8NxyrnjDsrFpWA0jbPE=
X-Talos-CUID: 9a23:HSXPBmOGgQ/9Au5DYwU21kU7HfgfVnTl8SrIO3KkO1tkcejA
X-Talos-MUID: 9a23:gWY1lgaZhzLXH+BTuHjMgGA7ZZpR4aGyOUsJiqdXncSdKnkl
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="107169153"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyE0bEIhSSgQlHvEicsCEs/EetezhtA7zqB/+8kCAPR9bUDflY8CZzdqkKsptx7/UgI42uHPE8mgeeT3gjTVf++fBGJ/tNuFh7ooGSiwuTq2WLS4bP7n7s4lU+cLhZ/dgm0hunjyKhJZMWutH9HBMtC1wcL5Nd5CoXZfKLhfHitnXn+PVZ7XJscCMVvTp/dAFKdCw6hr+UxzMMiyUqYGxJLXz+J3Ru4KRdJEHajGOlZO5bbQ0qqM/t5rrWH1BkhF77NYNQzRKzStTKh3g+hjZpLoq/8/dxVPN4lU+2mbfoVDiNA9cAXV6aOAFLsLVQoyZTTVZfo8C59tinj/DfAD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfmadrDjcYOWOSGpeJtM2ZYjcsHOQEl/UXhaGNTYSgc=;
 b=hjiMeRxuIbQwqW/RaJ7Yiqb57idMXX9wV9ncKoq16d86N6oa3vC42dNrZ+CJCIQ6kjHIEMDVYpvEJmoS1ySCuL5ryH2yMjucpC0fFzNHTZnVDoFd6VrSNRWCZq7PaHfzY/AGaNLqzzAEFbEgTvT+SHQVt5awdl5WeWZ9cMxMRvFNV+XmIzSgwzZR9Y4l2d7H/9Sch+qcZwszy5ZUZcDbf0M4ohr+OGgmiQlqDK0u3Rssnj6L+ehNxubgJisxr9qXwjNwPMAB+QQicOo10tdbowN9ZhxDTOM8EVZXW9aGvWStL2cYDQ+g8yO54LKPC1fCiLQWviVI4Au66WmC59tZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfmadrDjcYOWOSGpeJtM2ZYjcsHOQEl/UXhaGNTYSgc=;
 b=BxhZ5i8vCEXKX/jypZ9U4oPKEHhltRxTUgGxJwiy14Eq5IoogJyEa2plZ0YTF8rOcYtXjvvTm+UDbthAkieZ0UIUtYNSirRJTm6oqzC0IsrOebwVnJxFl6P9M4BFuwQK2y17gysHJC1Q66hDMvosiBVDD0gnYIIsTI16TldqR5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 4 May 2023 12:47:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/ucode: Refresh raw CPU policy after microcode load
Message-ID: <ZFONUdkG2ow9uckX@Air-de-Roger>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
 <20230504102607.3078223-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230504102607.3078223-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO3P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 333eac7b-4255-4466-9617-08db4c8d0286
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lalpm72umfoLNCdnLYxChu+iOrMwi4REhaK0gnrPZ4pP6H0OvG75pLcGiBCkx/jPUkh/gHtBgiQVFbp0XOgSElgib3FPypWaSi3LOMQ9P3Kgecq9Rlo7WBkCvdYdzEgtfV1QqPOY1daTZ5p0lvKRDtRsWjrNf27ReBtnqAumDndUzsaKdeNhgfmCZ3wnROhumeAxHWMp+jsH7Y7oBVof+OKIUfE58q8XSV1nFSvtqqEmSYEzoXtOrYJS9lzlIWabFnQJNyVyxKpJ58Q343L6MoJHFP8NjYfZavPGtghYhJiTEYncJgyU8yjpAApuDg7KBmTGxJ+ruSfq3xm7ryFhCU2JNEA69EsLKyb6qzLHVS06RrJj6an9mrCR8qVibMCOCZ+Jcf7ZkYOvKTAiAKFGV2M8tepa1fBi8V37hdwe/jrjenlpdWy0FDLA0V9yWIUqQJ2pRZuIEyc/VhPfUAdymEMFRib1wVh5EE0isfkyJbjz6UUs/escDSJtSLi9t5e2ysQQNsblgJkWt0WM+IerPL3UEKksylBW6QbXKNSsmrg/8rWc61RwSlY7qSGqDPs5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(478600001)(8936002)(85182001)(316002)(6666004)(8676002)(4326008)(86362001)(41300700001)(6486002)(6636002)(33716001)(66476007)(82960400001)(5660300002)(66556008)(66946007)(6862004)(38100700002)(2906002)(83380400001)(54906003)(6512007)(9686003)(6506007)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXZqcHBNbG9LYSs1MHJxU2VTVnhTRU1vdXo5QXFlUkVkdGtPU2RycEZwczdD?=
 =?utf-8?B?TFVWMFNQMm1ITXMzbjQrWGdnRDJkU2VoTjI0dUVVL3RiczZFWTQxUkFYMWg3?=
 =?utf-8?B?TFYySmMxcytxZ0FZQ2E1WnhvTEsrbVgyTHJDckdEa2J0SW5jamtrRTBFRk83?=
 =?utf-8?B?N2x5dDF6QWVEb1RFOTBZZmQ0NDdXRVJxTEoyOVNwUHEvdXZRUjhtV1AzWGZp?=
 =?utf-8?B?cHNUT3RNUnFhWXA2b1JMV1pJVTI5K0JpN0NpYTJQWnNmNzhzMlR1K0tYTFg4?=
 =?utf-8?B?bHkzRFZIT0lvQnFWM3RTRVd6bGNIbmY3bGpiZisvV1V0WDJMYUtxY0x6K2lr?=
 =?utf-8?B?TndUSGs2ZnpST0NpQWs1dCt6WitTZDN1NFhHcWZ0Nkwzei9OcVhMd0duZ0Ns?=
 =?utf-8?B?MWh6QVhaR2FWRDlxaTJ5WnhSVW9HSnpjaVNNM3NlSEswUnNzT3Z2b1BzSmV6?=
 =?utf-8?B?TnNHL2NDYWRzejI4MXlveHFEWDYzLzNyMWFwMklsRXdZUUEyTzNlNkNrOVpk?=
 =?utf-8?B?dFJEQ3B2dVZIL2M2U1EySnNzdkVSTjlWdTJrU3ZZamRuaDY4RkRlT21NcjlQ?=
 =?utf-8?B?am1uSFpNNmFoeVNwcTR1T2U4L2kxOGdQaDBEeWU2ZGp5Z016OG5YakRDUnU0?=
 =?utf-8?B?bXhrd3d3R3JtWjdtYkY5WFNmOUFEMnBjWlRpdXBrNlpqYmVxTzB0cjJzSXBD?=
 =?utf-8?B?TXYzY2gxOUszY093TUhvRXh5KzQ2bmVXcWIrRzlwVWNJanBxdnhFQWlRbGhD?=
 =?utf-8?B?bEZtT21kOXBlbjdDajhCenFkOE1EL2RwZGVmY0x5eHFZZ3Mzd0ZrY3VLandB?=
 =?utf-8?B?TjlHWm1SOEV6Tjlqd0FvaVFJd2lmemlOYytVZEhtcE1KRnc5YUtNM3l3dUNp?=
 =?utf-8?B?SzJmNUM5OWwycXlhUGh3YXlKTDZYZ01sa0V6ekwrWEVXai9oWDNaWHFVRFR4?=
 =?utf-8?B?dUVFZGFkaUw2SFJEYTBzQlAxNjIyTXRCazFZWnkyWUxKTU93MTJTUVVwTkRi?=
 =?utf-8?B?aGs2bE5rSmUvSnZIU0hLSGZORUhEa2F6czF5RUFUOEpOSVNkN1ZtRFF6Tk9z?=
 =?utf-8?B?SllyV1Badm5SSDJPM3B0SzZ0cHErK1NLZjY5YUduRnZLbEFyZEhiZnVGU1Z5?=
 =?utf-8?B?bmhKbzVxMmh0UE56aUZQWkg1TzZSenkva01lcGJlNmRiNU5yYTlEOGZYRExu?=
 =?utf-8?B?N212TVU5QTlRalIycWMwU1NCMkdWUjZYZUxXV0pmUFZuQ1FvZFBDOWN0YTRM?=
 =?utf-8?B?RjFweXNpUDVSZnZWTEhyS2plNE9Xc0R3cEUvNWIyTUNTZ3FGQWZ6VnJ5UFdW?=
 =?utf-8?B?dVlTaXNHRmI5Y1hFYWhWbnFUencvNW05RkU4cWdsQ0M3WGN4ajdyWS9WQVN1?=
 =?utf-8?B?KzFmTjVEK0YwWFBJQU5yaEpaMkxESWJhZnc1V0h2bXhhK1h4VUR5cXN1TnZC?=
 =?utf-8?B?MUhBakNUTkdwS2VCbTVrN1l3djRSaE5oM3EzYjB3UXhmeUZ1b29xL1c5L1hH?=
 =?utf-8?B?SHZESUZWUnBQUGh2TjlSeHJOdlZnbFhwRjRwaWNabWFxb2IyUXVwNmx5UTNl?=
 =?utf-8?B?WWdhNWluRnJlUW1vN05WU2tTVUlDSUYzM2lLN3JMdVcwNzgybUMvNmlSTVAx?=
 =?utf-8?B?RkZUUU9lVmZ3azNoQkxHeFNaNVExMjhobFpITlZSWFQ5REZGUG5KRHhyeWNj?=
 =?utf-8?B?bmRRZlp3bXFFb2Ztdm5ybzRJUFJnQyt4UU1wTzN0YXVzZ1pZOFRGZ1FqVnNV?=
 =?utf-8?B?K01uZmlqa2tScTlRQjNOT1Z2NEt4S2d4UkkzYU4ydk9VcXNEL2plSVdYMUli?=
 =?utf-8?B?K0VENDZJMERqMGRVU2Mvcm5zOHBXK3RNTWlteUE4R3RGU0FRcW0xYUdabWJY?=
 =?utf-8?B?KzVVZVFXK0ZJM1ltR0xxdjR5dGpIV09Bb2ZIbDJJZTJkNkRjeTYyTUtyUzRB?=
 =?utf-8?B?U2FoQkxTcEsrU2FvNzFPRVE2bmpiYzErbiswcVEyT0VCMjM1WTdZdmd5TG1h?=
 =?utf-8?B?T1EzYjFTRDdHWTVVYlc4bFRIU29MQzJWdmJIWmVyOTJMTHNIOWpTY09FRk1r?=
 =?utf-8?B?OUl0dmFVY2FpWWt5dDJiN1VTSFk0SGtzSmVyQ05lM1g5M1NuWWtHMFlOaDhP?=
 =?utf-8?Q?eSNE9M+O620YEo+DKNV/Bw4ty?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+r8kOmlHX6NVnQsCA9WOPBpvmtk0A0RMM4CS7uHUjcFHid43L40Rtwfz7Ny8v1N44pkXWGXrS1HybPt6WXa7sW09Ekcw/NvJH+TZLOysOKv5pNuEewpwD/O3W1pOS0nLe49jRdi8AlHfKNuErgP5H13rrn5qVIn05BR0p2rfatW/eYGBFlkaVehOmLXO1vKGwD2hAlplJ3wvyzHGfPoDZSUQls/cW+XiTNRIhcpqZewsx4eZyYMzd8aroaXppIHhvomN98EWDbpip9d59a+JpXT71mBuzZSniTnNC4NJ92t1uQLZkv+9IyCOyBxgzhCe9FKhk6TSYI4Y3X1OyPz3diRjE/4YJDj5U+PI6Vv3NzvDt9hKsnGuADk4WHl0Sd77gIhDbm94uhP2IinVkXcESCRvF2RlCUJZA9dzoPmqRkPXdhIjglPLkptNwISeHm1cCDRz/cy839Q7qLc5oSgznqg8oN/0OvCKcmP8oIbGCwzaV1OuMbqLcrSc92SBIWEuIy2SkudJD9aQLsjKmhgYzVPk0GDFIcfrgsv4oLomPhVEpV8kcvlscvSMbrqPxWGV6A9FidzHN3ePG7CHHSq6Mi9/dt+NMQKOzfnxTVnDeG4xDcGnsGcQc1sH7It4dTdzULfCG+Oy1v74WadWjXJ53lupVVbQ67UJzY4FDbqstsWNhSHpf5z6GfMrfnOqj9K2VL1c3ynXaNFJrgJ8/XFjQ4Lym1wFUOLnQaao3W9kTD2cSE1GPwBxNo1v+gKbRSR0/9BogGL48ZcuS38vVqlw4hVv2zxBA1IFhpeX8Tf7Pt7U8s+cO48B0p5HDBectyiZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 333eac7b-4255-4466-9617-08db4c8d0286
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 10:47:52.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG02X4l14x0SYl8pLGqZKr8IhmSJhYd6/GLCOXTvarYhEhk4GLTeGN1zgSRrpqhiQ3+z6fq1scAfxnmMEBCK6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6192

On Thu, May 04, 2023 at 11:26:07AM +0100, Andrew Cooper wrote:
> Loading microcode can cause new features to appear.  This has happened
> routinely since Spectre/Meltdown, and even the presence of new status bits can
> sometimes mean the administrator has no further actions to perform.
> 
> Conversely, loading microcode can occasionally cause features to disappear.
> As with livepatching, it is very much the administrators responsibility to
> confirm that a late microcode load is safe on the intended system before
> rolling it out in production.
> 
> Refresh the raw CPU policy after late microcode load appears to have done
> something, so xen-cpuid can reflect the updated state of the system.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I'm not fully sure it's worth calling calculate_raw_cpu_policy() if
updated != nr_cores, as it's possible the current CPU where the policy
is regenerated hasn't been updated.

Thanks, Roger.

