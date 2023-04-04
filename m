Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F46D68A0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518061.804214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjOW-0002M8-0R; Tue, 04 Apr 2023 16:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518061.804214; Tue, 04 Apr 2023 16:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjOV-0002Il-Tz; Tue, 04 Apr 2023 16:20:27 +0000
Received: by outflank-mailman (input) for mailman id 518061;
 Tue, 04 Apr 2023 16:20:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjjOU-0002Ic-E3
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:20:26 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98cfb28c-d304-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 18:20:23 +0200 (CEST)
Received: from mail-bn8nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 12:20:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH8PR03MB7305.namprd03.prod.outlook.com (2603:10b6:510:251::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Tue, 4 Apr
 2023 16:20:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 16:20:17 +0000
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
X-Inumbo-ID: 98cfb28c-d304-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680625223;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=acb0Vjzb2vomYZXvOLj89NVgZUGBCCnPCoP9oO0tFqo=;
  b=GIFvxWaUrEDLx4U7ujAV2SQrFIkan9GMvBbMBaMIVj9hBIUr0Hu9sQfI
   kZ+f56ZWUF9lnq9SxrxzU6wrJ0qTgLFTkR31QXg6oVgm+wUh8Q8lAvmfT
   DpFXawoi43FFuG4qK0na0GBqRr1umZABtfn4NWUPrycYyRqqWijQQHI1c
   0=;
X-IronPort-RemoteIP: 104.47.74.42
X-IronPort-MID: 104214592
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X9E+nq7zTnfhVXQFo/FnBAxRtBjGchMFZxGqfqrLsTDasY5as4F+v
 jRNC2+CbqyKNDD1f98lPtuy9U8Du5XTy4JhTQI4/CBkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPawT4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 MYSGiwEXgC6xMmc5L2QbrRJrcRgBZy+VG8fkikIITDxK98DGcyGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MkEotitABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpOTuTkq68w6LGV7nEiJQIZUEbmmuXnm3PmUv5eA
 HUmqhN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc6SDkr/
 l6PgdLyBDZrvaGVSHSS7bOdp3W5Pi19EIMZTSoNTA9A6d+zpog21k7LVow7TPTzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:WA1izqzdTowErJzoXHlsKrPxw+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBapTiBUJPwIk80hqQFm7X5XI3SFTUO11HYS72KgbGC/9SkIVyHygc/79
 YpT0EdMqyXMbESt6+TijVQUexQueVvmJrYxds2pE0dLz2CHpsQizuRfTzrd3GeKjMnOXKxf6
 D22iLIzwDQO0j+Ma+Aa0UtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZozU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUqZ1TChkF5nAic0idkrD
 D+mWZvAy1H0QKcQoj6m2qt5+Cq6kdS15ar8y7lvZJIm727eNtyMbs/uatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAfqqOYmwtRrQcotQ0rbaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3bYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZ3fSJ2MB2/ffvhChPjHb28LtB4B5vkke+H3IkI
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="104214592"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiXHEQoJ7gUssHZa+/QRf6pnqZ9f0amGUC3btt+EemYAQg0/mFVrNh7hf0PAz8PX6znV4FMGKQ60B5AXwq9Lb6qEVL5Gw8FtFnmg5ae+aUQjqf0Gvh8GmvLh1JOa8GQD+4kxhlPOgEaKG+fJbWOhi2Tk1YMe79gdJvn/nbs78J1BrjjJiENARpdoSdmnwDpTveILtZtftUTu+1n7zba6XuArYKEIFfDIM5yTm+NJaq2Km0/96JdDfNkH+q2a+XBnDQUrlwsStlefo3GO2B3Qa2rOdP98DkEfRVmL6H7/hf29A37YGrGt32zL7Ql4MY9U9G0/8lD+KapQpiH/1hqFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj4gGm4oTx0u/+xZtcHtoeuCVzi/i1cnClh6OAVuhZQ=;
 b=g9iZNjydfgTds69Db0ukoTAOMb0VxG6QXO+v6DSQn1vQUCGNanuiQNQpWb4cAUh9lK/eAClwmiBJ0q48gn96CE7d6EYyzuc4oeWIYDH3bwqUf8JcaimFX11yaPXlwSr97p+iPORd6qM80mEDp08nuq6PzeIbo88I7q2xenvOjA5cVVx+xn2GRNdvgn11JTO4WpxD4Wfjuvae8GdVBBO1UQSKNcHG0p+LEyGCESKul/THwP+CkLCd4jynOF6cHsg1gcrFsQm/o4EzFbGgxlfixGdUN6Z/XRwd2KOaF5GFdw110WBTKSJuh8zYD6SxqrOsgdEHULmGclaDwMJo6Dil3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj4gGm4oTx0u/+xZtcHtoeuCVzi/i1cnClh6OAVuhZQ=;
 b=eHBzTi2uAY7MMIL1PhD18PK+hbEHHXKJUeiLi/aUuNkDQznEDBEbLSVyLR0Rc6+T/S1qESO1lYe4zdz2+a1YD0jwEi6V5bhr6ZqEam3Z5Nf7FUlnjlQQ/ya2ljb+jzSooOQqducGoTZtzehzQ9bjt2rhu8qcn5O0E6LGQjLc/sE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <697cec91-0f58-9f50-33db-d2d92d321267@citrix.com>
Date: Tue, 4 Apr 2023 17:20:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [xen-unstable-smoke test] 179929: regressions - trouble:
 blocked/fail/pass/starved
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <osstest-179929-mainreport@xen.org>
 <fbe7ded7-47f6-caec-dabb-6978d9e2a192@citrix.com>
 <17e95e93-a3a9-962c-1563-f9fc526320df@citrix.com>
 <20d41dd0-19d1-47fb-92ab-4de458ddd56f@perard>
In-Reply-To: <20d41dd0-19d1-47fb-92ab-4de458ddd56f@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH8PR03MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 8659ba86-3a78-4f89-3a25-08db35287a8d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p4haAepPlMwkxv5bNNyATxxsKfJ7L1sqIiuAC9N5eMmsuM0EFBjJ8In+wuR4WtYQoLuvu2mX/itemv54TtYp4XLSJ1PaQT2AgEczfMZxRnDrZZiPaEkMNSRM2+AyZvZscEUcUQxGYNmlbEVWoCIFcOpNDXQ0+OmJLHsYtLfSV1IOggbAIJHV50dJZi1GNaf1tlIjfLDhmpjp543D2Y9ML4t4yurTfqmvn86yGFk5IfOvSWzOu9L2LzdHmOIs3FGIZd+H22mo3AhYn8onpFX1t/iiQAWTVgl9JgyHGTokRi8K1f/yfa6v9gOA7M5/+lGzdQlEYtBo0JKGRexIo/aw38JBfFmwSwo025yCNK+y/OWD/t2rA8M8QWVEq4q8CeAVNSJP9W3XAw2ROGsg9QtDCUdHMVmCxG+oas+oMXp37Zw3XoNhSO9zHKQ3UvHd9w7L3kZVSwvEgtr1tMiwOMra+VjsJ7vaALbD020oC067kkQUAvC7LeKzRLbYGW+vpt3oR99gFGhljFgikn4pNI0ySqdELJmxLZo/4ZoVdta2Ff0RcKVNMhQP5iOQW+RGkKDUamo1NSb9DegxevFoSWV4iJUP0qh/yRH3Ldun8mQdnP6uhIG8S1U3uwYGrggJDqYbJlgc3qRUvpJ6MxUMvWQJOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(26005)(478600001)(15650500001)(2906002)(186003)(2616005)(6512007)(6506007)(53546011)(36756003)(6666004)(83380400001)(966005)(6486002)(37006003)(82960400001)(6862004)(38100700002)(86362001)(316002)(31696002)(5660300002)(41300700001)(4326008)(8936002)(31686004)(66476007)(66556008)(8676002)(66946007)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmI1bmxsVGU1c0pIL3ZWbUF3dUh4VWhkMlFGYnJwRjF1MGJmQldWRUNMV3lL?=
 =?utf-8?B?S0MzaGlXTGMwNE1TNlhTUjViRkU5VW1GM1lSeUpzQ2dIZDY0ZW8vb2VKZ3N1?=
 =?utf-8?B?OFVWSGZEdzh0cnl4M2U1Q1k3VlBwZWp5cUNuaUhJaTZldUFJUnhCeGtoemlC?=
 =?utf-8?B?ZEgzOWFyejdNTkx6N2FPMHFsYmpQRXRVUXAwUWoyVm5rbTJqTnVIV3kzTTl1?=
 =?utf-8?B?MnJ4VnQzVzJ3S3dxaFMzcW1SUng3RndtY2pLRkdmemhwSTUvYXptOGF4RVNu?=
 =?utf-8?B?RVBlQnUvWDE5Vm04TGVocFo1TmpZZ2lrQllENHcvTUNGY1VHOFVsWFpEcHFL?=
 =?utf-8?B?ZkRXT2JDOG1ZRDEyRFRTSjl3L215MnFPeG5RMm1LY3cyblpDQjlKaUlERnAx?=
 =?utf-8?B?czkxczlwaVR6YktWL1J4ODQ0MUtPSWhRcDMyN0owNEtUcFM5alZtbWxrNFAw?=
 =?utf-8?B?MVlZOEQ1WjhDM1BZaGgzY0tnUWliNFZ1dmdtOGxGRU9yR3MxZTFJamRlNHpZ?=
 =?utf-8?B?R2l0VDdhSTNFRDNRaGlGV1FrOW9ub01BSktoeStMTDA2Rk52UG9Td1lsM2Nj?=
 =?utf-8?B?T3hzbjd5dG5sd2dXNEdEaDFjVDM1dWI0VHRpMkwydUVpWmRDNTVrK09ROWpz?=
 =?utf-8?B?bHJzNmI1emxJU0I5YUMxc1hLWisva2pobVphclJySVdhdlNFaC9NQTJ5Q1E2?=
 =?utf-8?B?MjRlMStrVVJETWIvVGhjV1pOajFvSXNSVTVZdzFoUmg2M3czVHkraUJYU08v?=
 =?utf-8?B?MnQwVlJUNjZmdW5CWUpZSkcrbFBmN091SEVhRnUxOURtUk9BMXpEMURqWXF1?=
 =?utf-8?B?VnNIMENFM01Qck5uSTVjZnd1akZ0YzZQNWhGelJ1MkpxSlY5YmN1Zjk1Yys4?=
 =?utf-8?B?S0RUMEVQY09ub0pYZkUxSDVjb3lQVUZlTzBvQUM4QVQxTFJLVGlwNU9wdFFm?=
 =?utf-8?B?TjFYcEpVR0JHblNJSk5GU3AwVnFXdWJxZTd2dFpmcVZBN3FkbS9rN3lZNjh1?=
 =?utf-8?B?Qm9PalNzWDNIcXROZmVOcC9yalhhZ0RzbG1RekxmUHY3YXAreWxwNWVDOEgv?=
 =?utf-8?B?eFVseVJkOU8vU3dkVjJEQjJ4Ukx1Ni9WS3ZWMlVFS29Cd0hiSEVZTHZUdjZC?=
 =?utf-8?B?T0c3c1J4QW1QL0sraEVLdHFJc0hvQmlCU0lnV3JyaVJDVFpQZytFdTBSbXFI?=
 =?utf-8?B?QS9ENzVWV3kydUZKak1WV1h3cTZTTFdhYWgxY0hORmNuMmc5UDJNZUVhWllr?=
 =?utf-8?B?a3VKVlBTU1pBYU56R1R4ZlliNm05WW1rZEkyaFNzejRhUmFPaXM2cy92ZXdt?=
 =?utf-8?B?dXpodVg4TU9yNWhtSjFoakg1YTZ4aHdqaEUwckx3SU9MTnVITFlTemhhT0E5?=
 =?utf-8?B?WStUUUdHUWY5L2JhY2VVVGordVkrYmNKeldSdTFmWlIybDZzN3hCWVMybUg4?=
 =?utf-8?B?ckprMEpSRVlWbHRVYUp1djgyUmRDZktNczIycTJ0Nzcxbmc5SVBIUG9UcUlh?=
 =?utf-8?B?d1J2ZVZJVDFCZUtJTG5vWlNqb3NvcllLb3U4bXZsb3hCRzUrYTF3N0JRRnRJ?=
 =?utf-8?B?emFCVXRKSDRtdDZNZmFJRFR3aWdQdGc0RkkvcXNqaS9jZTNPZTk0aktrZFdW?=
 =?utf-8?B?YjAxY0ptekd1bmIxcjNnZmFGVE51dW5TVzNlMGFSZ09OMitpWE1wUmZnMlZY?=
 =?utf-8?B?YTE3NzBVUFJvcEhYdmVpdFNPaDlBaFozQ1JoU2ZFY2d1SzdGaGt1TlJVSk8y?=
 =?utf-8?B?RTRWYmxVR3FDZllGYVVhNVQwU3RCZ0d5dzN0b01NU3gwdlNjb1lqci9TdlhC?=
 =?utf-8?B?aXlFWnlsbmtpRnlaNGZwYnROdWpXVFBTMTQ2SnR3cGVEQk1HaFdFTm5lMXBt?=
 =?utf-8?B?aXhYUEp6Z0pZM0FXZ0l2VmxMUGNINlhINFMyQ1h5VjlqeFNHVm8rTFpkaUZQ?=
 =?utf-8?B?TUdUVkc3WlBQbFI5NStDWGx0Q0NVYitMeEFsNjFYSU9uQ2l2cEltM0dvTVNz?=
 =?utf-8?B?d2U2TWRuZmJ5K1oxWEpWZ0phWGFTeTJmSysyVzJlajdFdVROc0FPL1lqWWox?=
 =?utf-8?B?VHlKZ2hmLy9mb1lrVllSVUNDaGNHU0hlK0lxN2lBejZaNFppT3dZYjZnSGlF?=
 =?utf-8?B?dHhNSkZhOVB5aThQZVJoOVhpcUh2cTI1OU54SkU2Y3pZdG1tTzdzMCtjRzJN?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	phkGOa41YsSDAtkUI7cpdr34HqbCnw4wLy2A99ZrFZI9/dTj3aT3XZOOnEKMKCzX9RaQxAnA25jxoH1bXMF9yiy31nXuovAY8WmLF8LDokbQpLcWtmMuIyPPwaeQSFep8eq1YEesGJs8J8gjSTeOcNwdiMMkLajsB4ibEtZ7W6wP88WKZWXRkmXXZAcSy+EFHBJ42XDPsAOcwW4oi3yQDfJ+sVUPnRXrPbFHFFKwPozB2/xiTeoGvSvjT3prmWEd4SDT6vwTmuirIAmg3wInxhrxGlx7INlWufVRLurqu2w6Ob03pSduW3FpmD1gKStYL3e/W4ihXnFHc3fiKDi0+6os0eLMwA0xMtPxRlZzmn3LiMy2qsbpOxQTIt57lECjlaRQQn4ncrZZX3i+7Yy/96ctUFtf2cUn6oK7Kst/da6BbymigNEuNJxMzUnCEtP+zOvTUTvDqUnYYM9znwkg8c3mFtApD0C1H6F06oSkRt59GngXblNC0J4eYQQfGDCl+sz1sY9pvmnY044aJFvAeGP3CCiv8Y2pq3TORLpS0vxpAo4cYUmbpLhnESLEDz+F0Ok9iauJGYbLa11VJeJ4Eblcl94NP0vKKfaSU1+8IfptKnBKj1OhO5l+TuApf2BINAxooRFzAaSuHc7XtkPx8pKKu03RXO1qalQYfimpgMnME5CoCNetlgpQg7fm1VdFPBkB1koQwVsU36+AHeyno4qJdVPv9GPmCB8YOtXQtsTzjZR+7TPowSrWP/bXeBxAlzquTrpgRNbwfY21euWae611iQrLbB/OHA8v7Xt7wjup3KtHnH90H3C81ULq6c+/7n+UrZ8QsJYSG94r7LpUfA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8659ba86-3a78-4f89-3a25-08db35287a8d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 16:20:17.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/HM4adQ7hPrS1jTS0Dt26pvhHSBjIArHqWrA6+A4RFDMpzsoMOyiW2CQEBLXTBeIR8QayIKJ/7S8CYbjTCIhWzf2tw63CH4pPEHsrrWOcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7305

On 04/04/2023 2:51 pm, Anthony PERARD wrote:
> On Fri, Mar 24, 2023 at 08:37:06PM +0000, Andrew Cooper wrote:
>> On 24/03/2023 8:28 pm, Andrew Cooper wrote:
>>> On 24/03/2023 6:58 pm, osstest service owner wrote:
>>>> flight 179929 xen-unstable-smoke real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/179929/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>  build-amd64                   6 xen-build                fail REGR. vs. 179926
>>> Bah.
>>>
>>> make[6]: Entering directory '/home/osstest/build.179929.build-amd64/xen/tools/firmware/etherboot'
>>> set -e; if ! /usr/bin/wget -c -O _ipxe.tar.gz https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz; then \
>>> 	git clone file:////osstest/IPXE-GIT-FORBIDDEN ipxe.git; \
>>> 	(cd ipxe.git && git archive --format=tar --prefix=ipxe/ \
>>> 	3c040ad387099483102708bb1839110bc788cefb | gzip -n >../_ipxe.tar.gz); \
>>> 	rm -rf ipxe.git; \
>>> fi
>>> --2023-03-24 17:06:51--  https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz
>>> Resolving cache (cache)... 172.16.148.6
>>> Connecting to cache (cache)|172.16.148.6|:3128... connected.
>>> ERROR: The certificate of 'xenbits.xen.org' is not trusted.
>>> ERROR: The certificate of 'xenbits.xen.org' has expired.
>>> Cloning into 'ipxe.git'...
>>> fatal: '//osstest/IPXE-GIT-FORBIDDEN' does not appear to be a git repository
>>> fatal: Could not read from remote repository.
>>>
>>> That's OSSTest choking, apparently with the same LE root cert problem?
>> Given that there's plenty of content wanting testing right now, and no
>> chance of this being looked at until next week, I've reverted e1d750844
>> (which was just a single hunk anyway) in the hopes that we can still get
>> a useful weekend of testing
> The certificate of the HTTPS proxy has been renewed, and osstest has
> been updated to use the new certificates. So that commit should work.
> In other word, osstest is ready for a revert of b5cc3c25a242 ("Revert
> "build: Change remaining xenbits.xen.org link to HTTPS"")
>
> Cheers,

Thanks.  I'll revert the revert.

Fingers crossed...

~Andrew

