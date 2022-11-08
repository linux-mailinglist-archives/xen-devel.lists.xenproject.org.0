Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE476219B6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440307.694458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRhY-0000Gc-GO; Tue, 08 Nov 2022 16:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440307.694458; Tue, 08 Nov 2022 16:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRhY-0000DH-D4; Tue, 08 Nov 2022 16:43:52 +0000
Received: by outflank-mailman (input) for mailman id 440307;
 Tue, 08 Nov 2022 16:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5nK=3I=citrix.com=prvs=3047eb21c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osRhW-0000DB-2X
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:43:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 832c8b94-5f84-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 17:43:48 +0100 (CET)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 11:43:44 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5549.namprd03.prod.outlook.com (2603:10b6:a03:281::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 16:43:42 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 16:43:42 +0000
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
X-Inumbo-ID: 832c8b94-5f84-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667925828;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uhIIdiQjcfRxGPj1gCZKs9BzSuEE2h3wWGssEhDisEM=;
  b=edSh1B4au7PMGdTx/5BCe4B56NwcSH0c1C2Cd4FBKVSIjzpAyuOwVkAi
   Fjxf9X0hmaDcAH7+sIUne7f0PpqTRXlGvbyU9bWInBd+rhXssFTJZLJzU
   55yDI0SaSyjW+wClOcXnX7BRkLZR4wdWHoymZbBF2Uh8hD2CGjaeN8e5S
   g=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 84405869
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oCy70a0/gZks4HKiLfbD5eBwkn2cJEfYwER7XKvMYLTBsI5bpzZVn
 2AeWjjXPayLMWD1LdAnOYjn9R5S68CExtFqSABqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJGRe+
 cAmDRs2NEqO3+KY7K2kDdVNr5F2RCXrFNt3VnBI6xj8VK5jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KlFQZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r82rOXwHOlCer+EpXn2LlQnVmIyFA+BTkJDgq8qN/oyUGxDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ua5QeX2+zr6gCWLmEeS3hKb9lOnNAybSwn0
 BmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kOYgnnS99iFOu5i4PzEDSpm
 zSS9nFm3/MUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswaByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:r81St668wtPebfaBKgPXwS2BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJY6
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWiSw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYErhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnvd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7kl6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklWqvoJBiKp7zPLd
 MeQv01vJ1tABKnhjHizyJSKeWXLzgO9kzseDlDhiSXuwIm70yRgXFoh/D3pU1wha7Ve6M0mN
 gsDZ4Y6o2mbvVmGJ6VV91xNfefOyjqfS/mFl60DBDOKJwnUki926Ifpo9FrN2XRA==
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84405869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkHB0k4AfccOIjp3/R4cOfRsXr6kyNVugl/4fFUJ6PBSsmWEuLhIq3GsFE8nYgglsX4h/h3tjlJHaPxA7CeZX2Bd453PCgBjAZl8HA1NkMn4kEy3nWkmAitRwXO7eXimQpx2ZiXxe2WHSmh92HEdPx/5SdfCB5AfhWBdRiluM/yJLzfJCuGltLEWgjxYyfOV2W+QW7s9WpO9yHu+MpzbtcmrOhOi8I2tNaAsO6aUEMigVK9lzHsqhdXeF5cMNF075qnJFaL6ttLoBT9YbH+Dr3+3jNO5Pxt3MsYL2etpA9j/33ngbYArRDJ+e/aRghVB248OuiuJdqqwH2l4fgDo8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAOnpEUk1S6xyXv4yVWt+017AJFu5D88A2OWknZHIkU=;
 b=JVEEiGY8yA2WHKhOSUkJpYGdgvsMxAORnluwi9wFiBtxXQHzbfyNQynYacCeg2kmK+ylNKMGmUfhI5PRmyQ1BKSW4DjeQmkOnogp9m3R7iaWo6jtbMWk9vcqT8F6/19OI6lSIWqGUeTP6q/oNIO1mVy2mIBplavuRg9yYXGE3F/9QFNUau8fds7HN2odVHb2noaANUFIPOz91PXzFUDQ5BwGYXn8oiqzXavm661cVUzuRYpeFWCZ7u+yxRAaduwX/VfB3al4EdA8FSgXIcOp69cmhdx7E2mapSog4w4iK9DanDcX//bBHADh6Uq1JplGRtOt6w6e7H+bO19E1irivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAOnpEUk1S6xyXv4yVWt+017AJFu5D88A2OWknZHIkU=;
 b=iBTZTwmtipFY1mLKcioOI4anUjUEnbeEsFkxprk3wlBb2B2TI19uT6HnjcgUO1c3ztxH9/SdqcGYw4s+mmIC6lMwd4pRDjC5NLHe5vRr1++NmkJ+70TEwgSPZwj5w32Xx8apZ20r4TysYqh9pvtFhn4QZJ2xhYheefiWfoOTuAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 8 Nov 2022 17:43:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Message-ID: <Y2qHOfemg/wrc07N@Air-de-Roger>
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
X-ClientProxiedBy: LO2P265CA0369.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5549:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a307e4-48ed-4fe9-21d0-08dac1a8651a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LqIf5pSAekzT1B286RYZt5u6Z9vCefztKr9T3SdiiklKlcY76WoCm9Xe/YK+o1j6wjHb6WixFWyf/tlIgTloq526PHqrQCsSVezM7ENz5PoqhFkErB+HTII8dUqokiJjKkpIHZpQvymmqic/GJ3gTpx6HeYDnhu16G28LjQAe38W1a6OQeqwXm4hhTPi5zN74r8FWSVNJ9965Oc6G0KvffeQPNihrFT/vbDSEjKG0T0/Y3L1U4zBorNdXoJYfntUvorTRBJCuVz5+b67BROXJGmMHhT1MnlGQ5cVupYv63khYACbYrFHMnkXIrWSexj7jJd0HgmxW6NBKqyqo5cBFagMUCiQDiGMRksbwXcKbKOTf9bBqq//qYyEBCRbvNMJ/Vo/oc0TmERsWKiPPd8NfgVrDp7ztj3FOCSqiq7uvUtVas5E8kURhoZ8Rh9ETXUlTGHG2hEKsOFaSlTVH3JqZADV3BelExplZ+kXdVX7NNhW4MkNMj2MK9J75UzGTQlLuoq0PMw+ldm9EMVM4tq7xrM9hrLZEenHSdjgHB+zj+xLfjwgMU1ZwnBbLwWKNa2YbeEjqQINzBEGBzRXdiQ+I5T6Ezf4IUqO+zz7GsT+Uv7XkX2qmUulkMroTVYSaJ5ISmfn4bMG4SpL2Vf91mgyhcB2oDSEYuH2Sr0HHevzcXZnvDckBPxzlMwvTVOwiDhj/+zPfZ0TNfCMuUarl9ol0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(6486002)(478600001)(86362001)(83380400001)(6666004)(66476007)(8936002)(5660300002)(33716001)(2906002)(66946007)(66556008)(53546011)(38100700002)(6506007)(186003)(4326008)(8676002)(6512007)(85182001)(26005)(9686003)(82960400001)(41300700001)(54906003)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTJyTFJHT3l3dUdEblFPM0lYc2dJbG9qV3h5dXpJdnVXQTcyYUpRVGtYaWNz?=
 =?utf-8?B?OGw2YzZ4UFhqbHIzS3pRcDB6R1lhNzE2Wk9wVEhIaDJlVzUvQ3U2anNteVJB?=
 =?utf-8?B?MlVJSWsvSlpBR1FIVUVYRUs3K0xaWThWcHgyZmhadXFQd0IrOUdkYndKSXVm?=
 =?utf-8?B?U3lxdmUvZ28raUg4OVNrdTZ1TnNpVEJrMHNjYlkybDVRenB4NXRMR1RONldH?=
 =?utf-8?B?UHlTZFpVRE5XUG5XY0NmQ2xOMkoyV093WnlScFk0aXJFSVFMVmp2TWJqbHNF?=
 =?utf-8?B?TFEyQ3NYeDBwaGJLZEJGMnFSdjZoWU9VaHhEYytGT2JQc1J0QXRqdTRaQTVJ?=
 =?utf-8?B?SEg1QjBVQ2c4UlB4L3E0WllESXRCazFOS1FadVZocU5oanBhRUYyb0R5ekdN?=
 =?utf-8?B?aGdxcXQ0Q2xGNThNeHdJK0pQRE85VlZUSUg4NDh6dlNUTFE1SU5wVjI2OXIy?=
 =?utf-8?B?WUZtTmFCRHNZanJoUHM5VThKbHRJdWdQTUxKRjNUTHM4aFZjKzlUQ3FBSHJK?=
 =?utf-8?B?eVdWV1BKMGtTa3dyRnJPNXVBVnM1Q0V5RnRmcmdrSXdRdHZsbWZHcEZ4elFD?=
 =?utf-8?B?RmtWWWVONFpOT083Z2hxVGlneTRHYm5UZDVFRXZGdFR0VDhiQitKOEx6a2Nm?=
 =?utf-8?B?ZWh5Wmw2cXJ3Lyt6dFQvaVVjbEk2QnMvbFpiNTRsaU1LdWJ4NzhvUkVXc2NY?=
 =?utf-8?B?Z3UwbXlMem5SV3psT1JNNmNMTUkwODlFWnI4R1dlbGVBbWJONW52a1pWVGxo?=
 =?utf-8?B?THFobng5SDNkeU1Nc1JCQ3czellHVXZaVSt5SXJhSWs1cmhWeUtkd3o1RytF?=
 =?utf-8?B?bkNoQ1JYWjJ1N0NQVXI2TWZUcDlZckxTUzdocjI5bVQ1Q0lhVDhaNytpRndI?=
 =?utf-8?B?WEhzaFVtNFFtb2h0Y3pHamhGWW81bUIveUc0R2dCaU5Dd3Y0cHNYQW5ZSDcw?=
 =?utf-8?B?Rzc0b241ekpzN1g5NnRRU216Nkw1L3Z6NDJmaEd2Nmt5dHBVU3pFTzJJcXk4?=
 =?utf-8?B?WXdUK2RTUHR0LytSV0ExZGFRRHQ0NzhxUGJDbEJ3OWxZajFMb2tnZ3dTR3VN?=
 =?utf-8?B?dXJ3QUo0Si8yOVFmQ09GMm13YUIrRlhyS003bjZYTWhyUHhSM2lzQlhEMVVK?=
 =?utf-8?B?UlhqRFI1L2huS0MyWlJTdUU5MHZsN0lNM2hzOFhNRVZDOFBnb3IzOVZvdmQ1?=
 =?utf-8?B?KzhnNE1zVDEvby9yUm5QR0RHSGJaTi9pRjhYK05wemYrMXI0QWNCbFNuY2g0?=
 =?utf-8?B?ZFlFVWxBY25GRDF3cENTMGppWUhibFNFYnhCR2xKUytSbkdtL3ovWUpZWFFY?=
 =?utf-8?B?VDBCTFRrWTNoOThQazlXUlFVYXltWGtTVlpRT1V0UjJIQmIrUU1RdjBFYVlw?=
 =?utf-8?B?UkJzeVlES1BjVXhSUmFqNGJaWjNxMFF6VGxiQWQyR0JYd3YzTkdNRTJ5d21m?=
 =?utf-8?B?cENEWHdFTmJPNHVYbFFOUm5Cc05KdC81N3VlcENiWjAwT1JLbTlDRzNvNEJT?=
 =?utf-8?B?NTRRVk1BYVBYejZUREk4eGpCYTNCTGhYVHJaRUZXNmtjNys1MXQ5amtDUndn?=
 =?utf-8?B?TmlyenB6QitrZlhjUzRiQmI1SUhjdU1PUWlJZnZESCs5YnhuQmFEdW5jZDNC?=
 =?utf-8?B?bFIxeUpKeTBHSjBLL2h2VTZGdVVGWnlUL3h1RlRCQjVuU3FsK2F0dWhkTlY4?=
 =?utf-8?B?MWhlbzhnZ2hYM05GWCtxRDJYRkNLQzJaaGNxbmlDZW8yS29jNDdqblZCRThM?=
 =?utf-8?B?d2JxNHMwRDZTM0x2aWdGWXJPNGk0Y0M3VU13TTBwallaNHo4N2lPeG5vNkRU?=
 =?utf-8?B?NXZkYkhQTEdGTnBIRVBlMThOdGtNcjBZQlBrQlJ3dVErdW5DckF5TGt4MkRu?=
 =?utf-8?B?YWh0Q3BJQjFaR0tPakZDMktZLzVKek95SzVPR3hOL2FtMm94VEQyWEdHVm5s?=
 =?utf-8?B?NE54eDRPeldMRTBxbXhHVENobWFKekhhS1N5eTRmWjhaUHVHdzdaa3JETVVl?=
 =?utf-8?B?U0ZtNnE1OGt1NmtZZHVBQ3lwekM1QUtsalZhcktMeThqcmVYL1NNRVowRWhW?=
 =?utf-8?B?aVBoRE56cWhFQXlSdEtQMVhINlJVQ3JQTm9XazhtNzYxZm9TaHRzNWU5Z3NK?=
 =?utf-8?B?M2xHK0RmNTRQbUFZL2RWVjV2SFh0QUJsOUF6dlN0eG1EaW45Y1Qwd2M3WlZw?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a307e4-48ed-4fe9-21d0-08dac1a8651a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:43:42.2474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7iaNpK4USVveHlRPf7UcDm6ocxCSpoigXf9ybxU/1LI6yTJF2gmUgLAMp3yCSobNGQrHvvpwQ9pMnqd0wz52w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5549

On Tue, Nov 08, 2022 at 05:14:40PM +0100, Jan Beulich wrote:
> On 08.11.2022 12:38, Roger Pau Monne wrote:
> > Like on the Arm side, return -EINVAL when attempting to do a p2m
> > operation on dying domains.
> > 
> > The current logic returns 0 and leaves the domctl parameter
> > uninitialized for any parameter fetching operations (like the
> > GET_ALLOCATION operation), which is not helpful from a toolstack point
> > of view, because there's no indication that the data hasn't been
> > fetched.
> 
> While I can see how the present behavior is problematic when it comes
> to consuming supposedly returned data, ...
> 
> > --- a/xen/arch/x86/mm/paging.c
> > +++ b/xen/arch/x86/mm/paging.c
> > @@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
> >  
> >      if ( unlikely(d->is_dying) )
> >      {
> > -        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n",
> > +        gdprintk(XENLOG_INFO,
> > +                 "Tried to do a paging domctl op on dying domain %u\n",
> >                   d->domain_id);
> > -        return 0;
> > +        return -EINVAL;
> >      }
> 
> ... going from "success" to "failure" here has a meaningful risk of
> regressing callers. It is my understanding that it was deliberate to
> mimic success in this case (without meaning to assign "good" or "bad"
> to that decision).

I would assume that was the original intention, yes, albeit the commit
message doesn't go into details about why mimicking success is
required, it's very well possible the code relying on this was xend.

> Can you instead fill the data to be returned in
> some simple enough way? I assume a mere memset() isn't going to be
> good enough, though (albeit public/domctl.h doesn't explicitly name
> any input-only fields, so it may not be necessary to preserve
> anything). Maybe zeroing ->mb and ->stats would do?

Hm, it still feels kind of wrong.  We do return errors elsewhere for
operations attempted against dying domains, and that seems all fine,
not sure why paging operations need to be different in this regard.
Arm does also return -EINVAL in that case.

So what about postponing this change to 4.18 in order to avoid
surprises, but then taking it in its current form at the start of the
development window, as to have time to detect any issues?

> As a minor remark: _If_ you're changing the printk(), then please
> also switch to using %pd.

I've considered this, but then printing: "Tried to do a paging domctl
op on dying domain dX" felt kind of repetitive to me because of the
usage of domain and dX in the same sentence.  Anyway, will adjust.

Thanks, Roger.

