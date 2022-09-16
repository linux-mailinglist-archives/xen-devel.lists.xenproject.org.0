Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A295BAC13
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 13:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407954.650645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ9Fe-0001zw-2z; Fri, 16 Sep 2022 11:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407954.650645; Fri, 16 Sep 2022 11:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ9Fd-0001xh-W8; Fri, 16 Sep 2022 11:11:18 +0000
Received: by outflank-mailman (input) for mailman id 407954;
 Fri, 16 Sep 2022 11:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHCK=ZT=citrix.com=prvs=251a9f4e5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oZ9Fb-0001xb-V3
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 11:11:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44123fe6-35b0-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 13:11:11 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2022 07:11:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6331.namprd03.prod.outlook.com (2603:10b6:303:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 11:11:00 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%4]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 11:11:00 +0000
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
X-Inumbo-ID: 44123fe6-35b0-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663326670;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OU37DuF8CE5gZYsrPaBua4T6Ke11Qs1Gjn8sBbCjCU0=;
  b=ZVcqYz0XXYWYyvg5UBy/GlXB6xZrComAZbSMUJGgzugFcYg2ZhTabwVN
   bdki/Rs3JSIc1HYr4a2zlTxFSiQQaauo+ptzhqqRg0dlQ6a+z5R0PtSaY
   OxECmvvx265EKKEbA4qLX/+/RcorlFfvnrGOp1YNuRSx6UOJwIBLBJl9t
   A=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 83195730
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7NL5rKyR/TMdPndYqCF6t+fzxyrEfRIJ4+MujC+fZmUNrF6WrkUFm
 zYfWmrSPvmLZmf0L49zaIXi8h5Tv5PRz9VjT1dr/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Uox5K2aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1OVHs1YJY94tx2DGRIr
 dAzKBI0UhGc0rfeLLKTEoGAh+wFBeyyZcY1nCElyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCSvNWQG+Tp5poJui4TX5BZ237X3dsLcZ/SBRNlPn1ber
 WXDl4j8KkFBbY3ClmHdmp6qruzugwzcabsZLpmHqM5lg32P3kVMLBJDADNXptH80CZSQel3L
 kUO/yM0oKsa9Uq1T8L8VRm1vH6FuBEHX9NaVeY97WmlyKDZ/gKYDWgsVSNaZZots8pebSAj0
 1aSt8/qATFpv6yYTTSW8bL8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXI9SrYx
 jmLqG00geUVhMtSjqGjpwmZ0nSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:PHUJZqvnv27CBKJr5GtDa+fd7skC7YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVgUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZrzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDn1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9EfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZzyHtycegH2w
 3+CNUZqFh/dL5pUUtDPpZxfSKWMB24ffueChPkHX3XUIc6Blnql7nbpJ0I2cDCQu168HJ1ou
 WLbG9l
X-IronPort-AV: E=Sophos;i="5.93,320,1654574400"; 
   d="scan'208";a="83195730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HA23yyHpL3AyHo89WEhFyzxBxS+KgL9EjJ6v/Gv4QyYkrmjNLsd+jbl58SA6zt5WFFDVi/79ZgPRqf1tjRlGN8yW9QbEFQOZu2DGFLQacYfx6cfDmGthg2QUZaiF0Rg417sfQdG7HpqgbSkL+lgBDNFYuCV5UU2n2VcMUlEHsfGiuko4WF2rUohC5+Fj6aeRm5lPlCdjaFQ/pPFuhm5Ypv0KRHkJ5/f2yvcgcOih/C8f11X0w+USDYmBHAbfs1OonGjI5PlZrNdwHqjR5yKRNVZB/F/1D32P6jn+hdJJ7Wpjrjno+2s+CQSmz9jTZFFXTnWL/rxZSG2Aq1dBuUH6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qty7lOo/og7DxEbfingkjqjBkl9lH2CWGtqkUTY5N+c=;
 b=bvqitQs+c3Lzt+KF34GkOg3MZSgKq1hQxXPK9W6BskbNjGrYv5+utkCqbQbT/APRc+hLbBShXgJDX3zUv9Z1zaruhdJFAm4cQ3FBMyMvek6PLrSVEDslOOyz+Ucyoq5MxuJFK8MxA29W8lBiwGDK3z00XsosBieUHXzGwWByBidG6cLnsglWNplmQcRd9Z8g6hRl9dOSBc8UvfERwQQxatfS8TsAxKHurXTVKfomE9g6mWU3MfzMlGufDC4gyYapjXaVEPp+Jds9NpFodruiKUdWRVf3TWP+7ZFc0f6VgCxTg2S5VqtKEoiSGbR9XD+xDN5d1k1T5VP39yNozfsO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qty7lOo/og7DxEbfingkjqjBkl9lH2CWGtqkUTY5N+c=;
 b=xCVRqVKMNW55AYKqZd7hvUsl+FIM2oVL7P5elfeCxeHyLtpRsh98TBR3y8IuMr31gouRtdp0KJWxdEOl08q67JGotp3It7uS/SU77SZf3wrqBjPU2Sj6h6XnsitOm2dWFNFEbePtqQ5YfhAyNwBhCQjGA3SmuQEQubMQ46ZmgkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 16 Sep 2022 13:10:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Default reboot method (was: Re: Console output stops on
 dbgp=xhci)
Message-ID: <YyRZvyMBzAzCBUdd@MacBook-Air-de-Roger.local>
References: <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
 <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
 <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
 <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
 <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
 <2697981f-8ae2-d3e7-1a6a-046927a66246@suse.com>
 <YyRHiV/HHisshYJl@mail-itl>
 <92a8ad2a-9b9c-b147-c175-0a9b4dab4821@suse.com>
 <YyRWCpM+s+JNNmbV@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyRWCpM+s+JNNmbV@mail-itl>
X-ClientProxiedBy: LO4P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|MW4PR03MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: d0eb739a-546f-4665-dab5-08da97d422c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xgwUYXGwhcU3AdxENPxR6IVRY/yLWBNLuqLmXk/Ncg2MoVTwv1gnuDm23hNVC3zZN/c3UfKN6Erzc13s8TXld4YkfGTX7Wej7a8wiL19C/FQPgursxXr0S6K0TE1SGFBjBc3l6Jflo8zwiUaUr2ihS2/7q+dgTQDjEeZykrNTFsBGkOArYE6JYTVNBoeV/t48JXBADJwD8ZmaMkRN4gB09BymdijUwYOdXWNXB9VBrdBeDgDMKM0cNn7UsyQtk6f5KtI61n0hj1F+TcgdEjj1Dfwzy4fq594HigrTDNrv7rG98gllR0tkAAk/0KaS1LJKUvvhUFSEkzVQ81QyBsZm0+ohF/vfjSu1UmD1Lck2xHL4DrFOc0eDjrweBCIksllg1XSqTr+c0t8868DWEPCiTFq6nLNcrhmN4Rk3l4+6PF1PUKzCpp/T5Rx8NVKpaR+s4ZpOIP8D/65Mm1a7AAeofENmYC03v3FhNTQEYHaQ4S/0cM/ailz6p+skAkhWUY61xwIb4brHokuruo8Y7S79gNHYRlM46SqQpMl67+p3QcHyy9i6rpNtjeeZIdQ7g1e7gAUoWE05lhvhkvrnk2aOSzR+Vb+LqAKibVVsXxY6aM0fLssv7NNhpDUF6GfwYoqiArrbVBi1vB9/s02HOvqMIysFSwq83kvm3mbYgDgLQGf803xIZMvGGuQJ8TYKPS5vaJxsFFpb2wLgoANssF3zQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199015)(38100700002)(6486002)(66556008)(316002)(54906003)(4326008)(85182001)(6916009)(41300700001)(82960400001)(2906002)(5660300002)(66476007)(53546011)(6666004)(26005)(8936002)(478600001)(8676002)(6506007)(86362001)(9686003)(4744005)(66946007)(186003)(66574015)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2tteUhDWVNDNnJxMWMwZjhPNVlraTQvejE4TXhCYVRLUWpBOSsyR3VZUVE1?=
 =?utf-8?B?YlA2elZKU0pqbGhHZ25iTG9lb2VFMU5oaXBQT0VrcnY5bnYxS0VkTFdxSWtu?=
 =?utf-8?B?Rm96Y3B5UHVDWDdlYUZDdXRGZGR0cUFNZHBPdWhLdlIxbFcwaXROVmEzc0Uv?=
 =?utf-8?B?WHdkMkdrc0N1ZWxvWlVOMUNBcUVxVzZhQVVvcWY1QUtlc296RVJiWHdDK2c4?=
 =?utf-8?B?d1kwR0FYL2FKbWQ4bm85WHVlUEhUcmF1bzR2NDlocjBwaFBNenY3bFBkS1lL?=
 =?utf-8?B?dytSeCtHLzlvekxDc21kLytlZHlaNW04emtscC9Qc2Y1WXdFbjVlTGpqQlNh?=
 =?utf-8?B?VEhsNjI3Y3VsOWtCV3EwZkl2MktENlhaREhWcjFaallqOHVLWGVoRFE0VlpH?=
 =?utf-8?B?R1dYM1NxcU9FaTNHOWkrNGJLR2dCd3NidldZRHJMRi83dS8vUTlZUmJMODZG?=
 =?utf-8?B?RkQ2ekFhUWVUQW5GN1oxVTF6U1poOVpTVkMrSkRmd0JreS9ibUtXTnV6ekNV?=
 =?utf-8?B?WlptejFuTDdqK1FLRkFPaDZWN0dkenJTZEZabzhZSk43bklVMkRZY2RISmY4?=
 =?utf-8?B?SXNCM3kvTVVrTGdIMEthK1NiblRyTVBINzV3dVRGZHgvUkZ4dWZDVTVEK1Nu?=
 =?utf-8?B?emN2cTk5VEtCRzc0VzBKc080OWhJbUNPbVZpRHY4YURpL0xJcmExWmhVMmZU?=
 =?utf-8?B?Q0dGK1k3NkpqOGVpaE9ZUDNRbCtqTDAxZXNRbnVXQktPVEcram1mSXE2V0g2?=
 =?utf-8?B?ZjYvZUs1SFlKWC9mOXEyZEpqUzVOaTJzdzBJMW9jbllXQVNUQVdadG5uTWl0?=
 =?utf-8?B?eFZYREVZVmpmYU1MN2lDQVVWdERYRFFXYkRzeXNBREN1cGlnWWorQ3N4R041?=
 =?utf-8?B?SHBQSjFBY1pzVjBacGNQTk9OQW1XOVF4RU9UUXNkZG53V2tKdjg2ZE1obWEy?=
 =?utf-8?B?WWVKbnh2cmt1SUx2ZE9LT3JzUkNWR0pUWXJ1UHBHbDk1R0UrSGVNQWhZNjJq?=
 =?utf-8?B?M0xnL2RwaWtKcUJvLzNUZU5RNDh2K0kyaHRuS0dmSmpTSGlpNG14WWRsMld4?=
 =?utf-8?B?U000WGkvYTFSaUwxTE5rSnVIandIblNkRWkxNVlnM3VRNFgxS0szVmRRdWZn?=
 =?utf-8?B?Tm9TVThUV0dRdFlwcE82aktiWTJoVk1ibEY2dytZQU5RdjdzWHNQbk1qTGcv?=
 =?utf-8?B?YnMyQnVvbnNQb2txM0RmVWVibTRpd3RRZjFwY1BJQ1lBck9jWGVGN05KOUtI?=
 =?utf-8?B?ZDRDd2NKUG5ZNWdWY1Q3OTI3MXE2VUZmVjdIS0piWHRrOEFPU2I1ZXhSN2ZI?=
 =?utf-8?B?Z2Fmb3Avd2dzcGhjM2lqK0xBd2FSRlhZS0sySlVTdEJIa1Biazk5MDJoNU5S?=
 =?utf-8?B?azR6ZHJ5WmhEM00zV1doRDVKY2liNUVBVWRGRjdqRUdWVDBQeE0rcWFtWVBB?=
 =?utf-8?B?ekRkclNvVE9YWHpBODNucEpKc1NsUmIrZVU4ZGZpQjYvY2hqZWM2NTQxbzI0?=
 =?utf-8?B?eDJPZURXLzg5TTg2UTNlYytBbVRBc1pDQm9EY3I5S1hNZXBHSUNBRzNwaTBE?=
 =?utf-8?B?VmlVMndHQzNvSDVnZUp2WmlHNkdCb1VqdjRKQUdGTDJJT0FMT3VRVFVGVGhm?=
 =?utf-8?B?ZzFWZDFMaFVKOWMrUThDamxnV2hpV0xqclNWN1phMDVGWUF6Q0FlM1ZEZDhB?=
 =?utf-8?B?UVJjQnFQUHJuYzV2QnN1VUtNUks1d2o0VzljM3NlODQ2ZFpQTVNxMTZMa1d5?=
 =?utf-8?B?SXRkT1BwS21IdTl1R3AxNEhjeng3aXFZQ2QzRFNvbjZmdkFhM041MHBNNFRZ?=
 =?utf-8?B?clVXbjdpb3VyNU9wWXJhYW9HV0I4TXN3TVhvdlVNUHNNMVFlSys3eEowRnV3?=
 =?utf-8?B?Um8weHlvWituQVNFbzI1YS82cVRPVzNoZlpYT1ovTkJyeERQR0RockhEOXli?=
 =?utf-8?B?Slg0YlBPZm1TeHFwa1E5d2xxM2Urc0xCTTZ3L1NsallqYTN4bHJOU2M5MjJR?=
 =?utf-8?B?cVU4VCtHU3IzeGpXS0RCRjdsS0RYMWxvbWRLcGdPSGlqdmhXUFRMQWtrNis1?=
 =?utf-8?B?K1BNQ3B0Z1VqaCtmSGZ5SDJhQzM2aDNKZEdHVXBOZG83VzVldXJ2cXBuTGUv?=
 =?utf-8?B?SmpqR2t5bytjSGtuVC9ZR3JOZGh1MmcwR2l5b1VVZWhPNmRndXlodzdBNTRj?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0eb739a-546f-4665-dab5-08da97d422c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 11:11:00.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAly+sYEgLkcIXHst7bHywd3JgLTFSym9ZuWLBkV4nc70K415rtB0pVETxn98ppvPyvWdiKYwg1FrfAbWhovQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6331

On Fri, Sep 16, 2022 at 12:55:06PM +0200, Marek Marczykowski-Górecki wrote:
> On Fri, Sep 16, 2022 at 12:28:46PM +0200, Jan Beulich wrote:
> > On 16.09.2022 11:53, Marek Marczykowski-Górecki wrote:
> > > On Fri, Sep 16, 2022 at 07:57:59AM +0200, Jan Beulich wrote:
> > >> ... this leads to the crash, which effectively tells us that this is
> > >> likely yet another system where one needs to override the reboot
> > >> method (e.g. reboot=acpi).
> > > 
> > > At least Linux, but also XenServer uses reboot=acpi by default (even on
> > > EFI systems), can we make it default in upstream Xen? Issues with
> > > reboot=efi are rather common, while reboot=acpi just works.
> > 
> > But rebooting by means other than the EFI runtime service has always been
> > against the spirit of EFI.
> 
> I'm afraid firmware developers (apparently) haven't heard of it. Can we
> have "works by default" behaviour?

We could make it a Kconfig option and set the default to acpi IMO.

Thanks, Roger.

