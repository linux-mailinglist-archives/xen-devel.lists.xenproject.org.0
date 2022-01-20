Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71C4951ED
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 17:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259126.447025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZs8-0003iM-PA; Thu, 20 Jan 2022 16:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259126.447025; Thu, 20 Jan 2022 16:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZs8-0003fe-M0; Thu, 20 Jan 2022 16:01:12 +0000
Received: by outflank-mailman (input) for mailman id 259126;
 Thu, 20 Jan 2022 16:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAZs7-0003fY-Jk
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 16:01:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d62a80b-7a0a-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 17:01:08 +0100 (CET)
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
X-Inumbo-ID: 2d62a80b-7a0a-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642694468;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cTw1zsN7jmzZAxYij+BPNCQVxiVpNLF84N10/skpouk=;
  b=CcVKxPti82rol4N9D9yrNvRzO8LgZdfZXiXS6xtJysU4rcbxOyt3u2PA
   o7GwuZXgMIj7PqUWOldjXvf1ztIP1UubZZqi7DxACo7E4QK/2JKS2WlCt
   GZ+Fx7454Tisgea0WyGIi6yMfJ7J2OXaH1+gCbEmhc3AfJbf7HINlw6wi
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uKPX6JlmlQmI4aAnwWy/zP2cyjwfEIg/95vS6vKyDVoNH/CsyZQfpQQkbSAEYNpLOdAiGt0ab4
 uYFXu87cK7Ah+tJj+MNmE1wU+UC6FEs/NqxczqN4TpM7aQS2VRKjImLFWtQsgtZERmg8wk/MJW
 6umP3jPoejP4bZ7nLkgQsBnckvZNR0qvKPbFReK9ZURg0HJMZqjRX+4WA3b3wFmPQ7RQ6eo/EE
 uU7TQ4Tsw1t3gRHRLESpmZw9R/SOZPGCFf8AO5B1cBj1GX8KLkNtF33BKlsJ15h4bHJ20TLm7h
 ngGoYec9t5KppJQBW7NnPige
X-SBRS: 5.2
X-MesageID: 62412617
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DtwmVqLeQAGYMOoLFE+ROZIlxSXFcZb7ZxGr2PjKsXjdYENS3zMAn
 TQbCG/QOa3camOkf4wjYInk80lSsZbSm9ZgSVFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5w7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Rrfwvx
 thkhKftE0AvMIvLwP5HUElxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uv4MBhmlp2aiiG97QW
 PYjdzRWRSiDQDFPPE47V7A1hMCn0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdwWKjCCKszctYIcKVOs0zgbV0PDXsy/MUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalq1kqXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj70hu+aTNT8D2BN1bQ9xawcRGp+ZgPQ1
 EXoY+DEsIgz4WuxvCKMWv4RO7qi+uyINjbR6XY2QcV7qW3yqyL9IdkAiN2bGKuPGpxYEdMOS
 BSL0T69GbcJZCf6BUOJS9/Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWTqL89Aj+5D7n1ulAv7GMGgpzz6gOX2WZJgYepfWHOUcPsD5b+JyC2Mt
 Y432z2ikUsPCYUTo0D/rOYuELz9BSFrXM+t850OKLfrz8gPMDhJNsI9CIgJIuRNt69Uiv3J7
 je6XEpZw0D4nnrJNUOBbXULVV8ldc0XQasTMXN+MFC29WIkZIrzvq4Te4FuJess9fB5zO4yR
 P4AIp3SDvNKQzXB2jIccZii89AyKEX13VqDb3i/fTwyX598XAiVqNXqSRTiqXsVBS2tuMpg/
 7D5jlHHQYAOThhJBdrNbK791Eu4uHUQwbogX0bBLtRJVl/r9Yxmd374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjCCv7isNCTc8m6y+qN6Ub6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SL0JUdtqBJwbMF6wK6V
 ljWp4tfMLSNfsjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 bZzscEb3AWzlx42P4vUlStT7WmNciQNXqhPWkv222M3Zt7HEm1/XKE=
IronPort-HdrOrdr: A9a23:sdewH6sLk2ylaNoAwB7w/yR67skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9RVfYd1P7orhJJGdZY8qPSMex/wqDL3QRSvyAfcZeg600ykke+E3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62412617"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbP2SkeFafZQsN6on8+wHreW14MawwC3ajup+5SMU96kBdPKMNl8H9iY4zVVy9VyuEHgHu5VKnjF+JkGZLnqlYUrhZKoNSME+ttaP2r4MU1mXXRYUDAx1EMxdQXHOhmFHz+lpjMEbJLzXzAaVyp8AMu2qKxAim/IXxu9OIaO72/zCix7Wb2EDLCnowKzXTQ/f+SEcm/99i5U0PLjelICGmWCkiP/RvlzMvJ677eOcOSMXfPOFcnvEJj6MBw4GYaeNLM9bTMucfRMVJI6EatQIsiNRuCBQREJVrvc47D9V0cxAoSLEKRLzMwjEkl2MFtC9iTOmWf3ZPoHsi2yVCZLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCOzx3Q42NLL6YhcYCShH92PjaeweN6rFj0ZfG+Yixw=;
 b=S+uKRyf6VMkLXBoR7X+gbf7jDt3RU6mgcVoTdcR7TfZUZwjkPvfcu+G0QrVANtWoIZsyEDkX/iUlcadtDbET8W3//GnNd6Eaj9UAWdSAitdCEuPU08oX4o1+6+bgPY5pe1PHKZTEHjvM4sVV79u51Vdcqe8uuJFgtifEr0Xauid55Omzn2YJCJU7mau3YWxpOFK9kZJYSqDmeFP5F2qk+HQkKr474gAHpOS13GSp7QLIbPkyT1pgsXE/v6Tei6BI/S0Px5Jr4/gelY0KNiabzvjezRVLN9GxCDjDFoMrTLuNIQOLojAnUFZrJuvx4E7KTxye0ap8qpOoyXgUopUmFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCOzx3Q42NLL6YhcYCShH92PjaeweN6rFj0ZfG+Yixw=;
 b=jGR+XV2FPrpPcPC80vvs5kO5BD6PzIF+4kPy6UFcAB6/NoCXfpON5y52lq3JP7FACIOlij2+68bhtkLxMzU7jOoHP/u8thvl56r+vxX5uJHCc9NxnwaXbd++OsPE6LDqtYf3GYUHtZxGarLMrG9E3KRu2mVZhMEkWQx4uEV6nUM=
Date: Thu, 20 Jan 2022 17:00:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC v2 5/5] x86/mwait-idle: squash stats update when not
 actually entering C-state
Message-ID: <YemHNOVyqGwZ7/eC@Air-de-Roger>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
 <b9270896-efea-3e81-99fb-685fc5b708be@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9270896-efea-3e81-99fb-685fc5b708be@suse.com>
X-ClientProxiedBy: MR2P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e58f6a60-1af8-4650-5cc4-08d9dc2e0c0a
X-MS-TrafficTypeDiagnostic: DM5PR03MB2636:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2636E01449CE4E08C67726078F5A9@DM5PR03MB2636.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /guUIf3CJCG5lxGtVHatQbGtioq5d4f7/7Lx7JGGJ7W8ytKY227Invl9qdsjkFu9oHOwmRwLmovwY9/Ng6I+wIJSCud1wkRrtZMvJ42QUhulaCex/n8V2tjBt0jPI48luYobUxM8aO3u1rRAoxvKON6EAOccxv+iVIBNyo8h4C5lavMVK1DIBiN4R0Ylbi2ovbBoqktK8H/MuqwbHVHpdPXT6BcCPiG+1hcEj8ryd55ZTW6lQOL9hylWSWpS3vvW0QNt2JD/Ut/cPSrSIQ7XlEj7B45RYMjQ4thktoxteO3t6N/CRMENKozxIRuiLCyr4vSfif8AC6BnafQjPmUDGC2PMeRWWTsXqGt1OzPTPclnVdUnw+qSQWj++/Ift7csTsrSM6sZrOAtpnz4UTPLi5KVKUUh6yWMPM8+048MHh0WE/lBIrmXOzV1Dhn1I6Jc/O4/SFYVLAnT8Cs1LIz4SYdbVu50UCyJbAhJqCBlRK8yn75rYunAqn3132lwvRw5i1orOxmSZBpdZWAHoVZDw2Jz/71lNyA4Hdussj44+XyIAHT3f1dhOYm9TK2Xg9hr8ASCRA1ikav4RuXhKM0KWokeUiLdfjMKEkBnJsaxuE4dJQaVU4/z5M1A47EUiM1gRuhP2l3vepay5zT48lOqUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(186003)(6512007)(8936002)(33716001)(316002)(15650500001)(9686003)(66946007)(6666004)(82960400001)(86362001)(26005)(66556008)(66476007)(4744005)(4326008)(6486002)(6916009)(54906003)(83380400001)(2906002)(8676002)(6506007)(508600001)(5660300002)(38100700002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVdXL3hWRWJCNXZjRDNmZlBYL2dkdDNIaTIyNVBWeHlJMHBQcTRZZDhmTHFt?=
 =?utf-8?B?SWZab0FmMkh4d2FqSlFvVktIakZzbUFjbFlYeUZoR1cxY0JRTU5ZRGZ0R3BJ?=
 =?utf-8?B?dldJRWltdkxIUmlzQ2pGUjMxNTNqYzRmeGYySzZaTDhhR1RxQ2JBYldlUGY3?=
 =?utf-8?B?anUzbkJyZ1hMemQ0UEZaall2d2dXMUlQcGJITWlvV3JDR1R6OWgvYlVhdmhz?=
 =?utf-8?B?ZmFmenZzNWhHcE5TRUFGOXhVaW5CdEduVWpFVnEweTBhcVlUZGgvTWdlczhm?=
 =?utf-8?B?QWZRQm9GL2NRRkNVK3BPdkF6Q1NuM1YrWW5aa1Zma2JBK2tnVysxUWxINUxz?=
 =?utf-8?B?TG9zSFFxaCsrVHZmazdCcU9CcmVQbE5yZXRZUG5tdnNVSzgvOGVkL0Z3ZzQr?=
 =?utf-8?B?Q2FiajlDdjZ0WTFuQWpEemVOUXlxN2RaN0FQUnhqSnhaVDZ6bUVpbUp4VzRM?=
 =?utf-8?B?UllnQThmNUVZTlE4RExwTVdpN2tjRE55eVR2Qnd1YjF2TUwyVHo3YVRoUVB2?=
 =?utf-8?B?WkJSN0RoSFY1YjZIUmR5ZVlmV0s1RXg1MkV4ZlovR3hhcXRObWFJNEJ0MTFq?=
 =?utf-8?B?WFUybnI3VnVTZGE0dmVYcVVINUYzKzBROVgrMEIwdkZieXNZMnhYUWdiUG9V?=
 =?utf-8?B?TEtsNlVibUMzZTZQYTVIdjVUUkNCRkdSYjVtNGh1bGJkYkt5dHZ4dnMzOXlL?=
 =?utf-8?B?VmNwT2lzQWp3dVNrRUVKS1JvbWd0cTRXaGNvNy9IOGk1RDkrN1oyVDZRMWt1?=
 =?utf-8?B?U2NhMjNIRkx4MjVNUmJzdlpvRFkzWGVFd3c3MW5tN3RkWjU3dklGdGFxYnVX?=
 =?utf-8?B?aUs0TUhNaWs5cm5wQ1ZaVGhDSjltWm4xUVI4VGJQdnhKUjh4b1ZzL2xqUEdk?=
 =?utf-8?B?NlBpeFRDQkhEaDE3TytwdzZNeWVKYzBTMmNlRHp3WVNVUlB5WEtmbVVQcTRy?=
 =?utf-8?B?VEhQOTBpTjZrR3JOTkhjYlp2NFdtMHFQTXBabjllTVpuZERDZHJGallyRktQ?=
 =?utf-8?B?ZmVYSUQyVU94WWZDRU0zYnVoTndMdTRDaDNxWDA3U0JKYURRSDNxVEpYeVgr?=
 =?utf-8?B?ME9VSVFtSFdOb05CYW9hZktubDFwelA4ZU5ZWTB3Z1JtcERvYThiWTVlYWhs?=
 =?utf-8?B?L2xDNWxtWnJvMlpvdTJzSk5jWDU0S1dNSHphQ1B4emNRZHZWaW8zSUxiMFNp?=
 =?utf-8?B?ajBSTDA4dVl1QzlPRU1jU2h4SVFrSWVNNnlZVVk0NW9LTC9tVEsvZlZrMStH?=
 =?utf-8?B?VDR0cDdXWFJnU1lzQ1ZUMkJ0anpuY2dXb0dZeVMvMEZGNmtEQlBlaE1CRTVS?=
 =?utf-8?B?RWl2VFZPSXV5dmdkUTZDcTFVcWRlOUdxdUJ5c1FrVFY4ZGRhMkxES0dacHpC?=
 =?utf-8?B?TFo4S2lKVEUwcHlXOHZiTk9mcy9WVjl5WkRDOW45c2hjSW5tejV5TEJ6S25O?=
 =?utf-8?B?QUJGTWNtdGl3Tmw5OHZBMDZOYjFPd2c5eXN5RHpkMXFHSm1yaUpJQTVtUnFj?=
 =?utf-8?B?YjhsNUFnbURRTEVYWCtKbGFMTkpSaHB0bTZGZmVDemRBL1FmeG5zZEw2cDIy?=
 =?utf-8?B?K29iV1YwdHVlK1JMaStDMHEvV2ZMbjAzTGVTS0dTc2s4b3BjZkpSRFRzUFJo?=
 =?utf-8?B?ZGc2Y3JzTU9hakV6RkJ1VTJRbUJ4ZURHcTM5Nk1Lbk4xa2c2dUJES2dYMXVF?=
 =?utf-8?B?M3BISEU4TDA0cjYrSHV5MHZRMHF0QWNNQmUrd094azBQVXlwMmRjMmZCKzVh?=
 =?utf-8?B?VjNHaFlvWDBZTTN4NklkU2diUHQ2NW1CWVZxQitEK1lXeC9TU1l2L0JvbnJZ?=
 =?utf-8?B?bjlTVjRCSytLcVFFTTJYTDA3REFLOHhVQjlTdjlaQ0VHb25aSmN3QmpRUFRI?=
 =?utf-8?B?TU1jVzQwalZQMHNhOHBvTFllenVIc0FwM3hxOUliVGliUlJQcHozRzFzUEpq?=
 =?utf-8?B?MndvNE9SNWgyOEZrQ3k0QlF3bk4wVTNkUGtrSXVNb2dDQXdrWjRHOXN4bVlx?=
 =?utf-8?B?ODgyT2dMdVJaUDVlSnNoSG9ubXpFTFdoMWVRZVllNFpCM3JWWHY0Um4xZkNx?=
 =?utf-8?B?a3lLckQ1ODd0Q2NqeW90UUY5aWVFNEdWNTJNMFBPdG1pOThYKyt5U2hseGdr?=
 =?utf-8?B?cEJiM1AxZllIS0cxSmZ3MTd1elpVZ0JTUnJrMjhibStlUjBmRjZ4b3B3MW1z?=
 =?utf-8?Q?VAoxVPh9qLyIlD2jP5VyujQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e58f6a60-1af8-4650-5cc4-08d9dc2e0c0a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 16:00:57.9028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hR4e9gKLKJS9Gea0S2En6JDRAKQ8bz/Ck9tzk7JOsxG0xfGxF3bHZFX3KOPPWwtNAvAifMfFCz36+NVEdtB+5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2636
X-OriginatorOrg: citrix.com

On Thu, Jan 20, 2022 at 03:05:12PM +0100, Jan Beulich wrote:
> While we don't want to skip calling update_idle_stats(), arrange for it
> to not increment the overall time spent in the state we didn't really
> enter.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: Arguably more of what follows could be moved into the if() -
>      thoughts?

I would move at least the restoring of the TSC, but I would be fine
with moving everything up to local_irq_enable unless I'm missing
something.

I think you could likely also avoid the call to update_idle_stats so
there's no need to fetch the new tick count.

Thanks, Roger.

