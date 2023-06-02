Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA87B7205F3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 17:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543180.847917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q56eP-0007DI-8m; Fri, 02 Jun 2023 15:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543180.847917; Fri, 02 Jun 2023 15:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q56eP-0007AG-5f; Fri, 02 Jun 2023 15:25:13 +0000
Received: by outflank-mailman (input) for mailman id 543180;
 Fri, 02 Jun 2023 15:25:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7HB2=BW=citrix.com=prvs=510adbd96=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q56eN-0007AA-Mz
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 15:25:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7134f9b-0159-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 17:25:08 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 11:25:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6031.namprd03.prod.outlook.com (2603:10b6:5:392::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 15:24:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 15:24:57 +0000
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
X-Inumbo-ID: a7134f9b-0159-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685719508;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EP1k6Zyq1JNLUGbm0pR5zzeKhgySoWo0YJOroLp6HNQ=;
  b=eg3zepmKeFmMgfq9Txo4r3wxRMsyN7eugtoRq+HtUK5sg6Ye+hRygFDq
   q95y9x5rCKYaVkGFFsUrZUbx0dWN2U4IpyijPBojQkos6oJeA7pxHhP5/
   KwU+g7wxcQ7kgNYXV4nyYwwtS9MdWK508NiqWzMujVMuF5/QgLK2EMmYb
   g=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 111794902
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qMDm4K3P8iFU+Ac4CvbD5cd3kn2cJEfYwER7XKvMYLTBsI5bpz0Oy
 zQWWjvVPK6CMzDwKI13atvjo0tU65OEm4ViTAFspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmP6gQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEE5Et
 tUEERU0bhmZidru3J+rCftSv5F2RCXrFNt3VnBI6xj8VK5jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KlFcZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137aQzH+qANh6+LuQ7KM6oHaU2mAvSwwNXGW8p9C5iE2MYocKQ
 6AT0m90xUQoz2SiX9D7XAC9qVaNuxJaUN1Ve8U55R+MzOzI4g+fLmkCUjNFLtchsaceRyEsk
 FmAnNrrBDlmmLyTVX+ZsLyTqFuaISEIKUcSaClCShEKi/H8pKkjgxSJScxseIa2idvvED223
 DGOrwA5nbwYicNN3KK+lXjcijexq5yPUg407AzKWn6N4wViIYq0YIru7kLUhd5FJZqUU0KT+
 n0DhMuXxOEIEZyJ0ieKRY0lGbyv6OaYGDbdmhhyB5Qn8XKg92PLVYlR+zh/IE5BOMcYdTLnb
 UnftBkX75hWVFOyda5taIu1As435aLhCdjoWP3SYtdUJJN2cWev7CxoIEKdwW3puEwtir0kf
 4eWd962CnQXArghyyC5L88Y0LQrzyR4wnnBSJTTxhGrl7GZYRa9UqsIPlKIaaYi8KqOrQHR8
 tBeH8KPx1NUV+iWSjfW8pQaKBYFJGI7Gpnyg8VSeqiIJQ8OMH0oDvbK6a8if4FjkLVYkqHD+
 XTVcn9Vzlv2w0fOJgSDZnlgb67HVJNz63k8OEQEMU6z3nk/Ya6m9KoFa4YsZr4j6fBiyvhvC
 fICfq2oGPNUQC7A/DcbRZb4pY1mMh+sgGqmPSCofTw+dJ5IXBHS95nveQ6H3CIOFCusqcwmo
 7C6kBydSp4KXQdKA8PfafbpxFS01VAbkf5yVk2OOcVOdEj22IRtMSr8lOAwOcIXbx7Ew1Oyz
 BqbHh4CucHWv4IqttXK7YiftJugGeZ6GktcHkHY4KywOC2c+XCsqadCTeKJcDb1RG7yvqK4a
 o19y+z/OeYVtFZDrJBtF7Vsi7o6j/PFqqVG1A1iEDPuZk6yF7J7CnCc2I9Esagl7qVQuRayH
 FmO/NZaEbyTPYXuF1t5DCooaP6Sk84dnDb65O4wZk794Udf97OdXUJfFxKFkiBaIf1+N4ZN6
 eUuoskN8CSklwEndN2Bi0h8+2qFIXMBVKEmnooHG4KtgQ0uonlPZZHaA2nr7pCKd85BLEACJ
 SWdj67Pwb9bwyLqTX03EnTc2PtHsr4HshtK0VwqKkyAn5zOgfpf9AZN/Cs+VBgTzhRD3+95I
 GFtO2V8IKnI9DBt7PWvREipEgBFQRGcpEr4zgJRkHWDFhHzEGvQMGc6JOCBulgD9H5RdSRa+
 7fez3v5VTHtf4f62S5atVNZlsEPhOdZrmXq8P1L1ezcd3XmSVIJWpOTWFc=
IronPort-HdrOrdr: A9a23:Rmq1k6DklaeZiDPlHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3AjT3jVGneBoyeq75CB58ViFK8KPXXOWzyxjT5P3a?=
 =?us-ascii?q?dMGZgUrOtEUO96OB2rfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AJFFaNQ4Y3NwBDOm2fHG7K5nPxoxyvvSOI0cRnal?=
 =?us-ascii?q?FqtKNCyt2EjefjwaOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,213,1681185600"; 
   d="scan'208";a="111794902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h39MhCGAGYMAGXpcWVOS55J2q1fmx1OG3gEYzPTmRmZTBGmlQlv133e2knTjB1XjCx3vgwV0Jf0xZTGN8tLQQjZWLkyPwKiLxCg7r+nVfPLTmEDTvrlT431VIULrVQ6FiQuBB5U0mv6/Xl/z2VwWz7rmd6FNV0X1nplLlHmLYT0eyMa130C4mLYTn84EYLLRAwAAsbHFG0JGIUyeqpz6jKy0MtyBrfrz1f0WoZfEAxcwaVsX7amktjQT2xy2ieVatzAW+Txgz34S7y3hU8ecn+OwwsAT1FrbThXutRYimM0bkJSbuLJBZ6q2nH79s0h1d6ZLUjnTCQYiHCsRNKOxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3LajGo4297Okn1KZW3Rkwic+1OYWJqKC/Qozm2dkes=;
 b=SsYVGKv5Zfp7aU7qH42Va7eHPTw0qv3s+ta1S52X7kqUPCcxY4yAaSQjFenO5qwggrG39sU5XNyCdQNe9X+SLONfipO5yuGIKn6eWszKHfyvStVcizK94uZFXNDDisU9s9IUVIkxSeA11qB64sgdMxse5RMS5ABp89xL/hK6sowv2BO7x+bOm4WU1+mQwx1QBHRctIpCBjsKs8RaszRqRRmtvgxkJp+4GGDjIbzxkbNA+8AR1uCXPfdQcQ2ko/cuQG3e8jTvuEvWM4E31U1s7PS0K4nwuhIntT1rmQpgF4jKY23m0yd6OGHshhj5g5hT4x+w2Fp9l4jdO5nFVN9O5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3LajGo4297Okn1KZW3Rkwic+1OYWJqKC/Qozm2dkes=;
 b=OjzDrGniMrPZNEnGLFtP5duwkelI/4pvyySDhN7yMMjdUr5C1QFOZ/2dY2neMpW4dhYEgJia1dGXa+z3TTc8b5UnSTmJ+m28QiohuPM+0KW7cwF9JD9kBJj1fzYOOCvGEryaL9R7ij3nFQV9lffjsJl8NfvI4ZYJBzPeNf/7kQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 2 Jun 2023 17:24:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	christopher.w.clark@gmail.com, nathan.studer@dornerworks.com,
	Stewart Hildebrand <stewart@stew.dk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>,
	dfaggioli@suse.com, elena.ufimtseva@oracle.com,
	anthony.perard@citrix.com, george.dunlap@citrix.com,
	rosbrookn@gmail.com, lukasz@hawrylko.pl,
	dpsmith@apertussolutions.com, mateusz.mowka@intel.com,
	kevin.tian@intel.com, jun.nakajima@intel.com, paul@xen.org,
	Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com, samuel.thibault@ens-lyon.org,
	christian.lindig@citrix.com, mengxu@cis.upenn.edu,
	tamas@tklengyel.com, aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Garhwal, Vikram" <vikram.garhwal@amd.com>,
	Xenia.Ragiadakou@amd.com,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: Listing the tools required for Xen development/testing on x86
 and Arm by the community
Message-ID: <ZHoJxMWlOLT02yFB@Air-de-Roger>
References: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
 <ZHnV2lhkU1EkrQ68@Air-de-Roger>
 <9079757e-72e3-3a68-5e78-9130822003e9@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9079757e-72e3-3a68-5e78-9130822003e9@amd.com>
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 0569d1e8-6dc4-4bec-fa6e-08db637d85ee
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aXWZjlSStVzXI2WPtASXxXl5YClAfn/wcZzHIAqLBGXD4HxT9Qn2yj+X/kWu/k5Ac4rtoX5GX1mFpr5DdLHrGGFYwXuATDArfiaUBWKWRlCaelUxFBvK1OpCkkD+5/cnlCHHBn2lPlqOBlHxk+eRpnJsyCh2JlVHAEULHpfBBWuOkk36LPGAdQST1gOtJMl6D85H50OQLVoaWX0xML9rXBqlPyaxfF0M1nODnBmhJ+Hlu7hsXdvHG8uAl7bPqwn3pxG+civioZEZJtsjDBK6qjoS8yX9HLkyQtHjzU6J01yLz3/3pvUtbMAuOfOaroV9VrHeEoKn7CPoSFdO+PgUjAobj+/G+EL8ULWvwDQnATcGR8mjEXw8pK/LehtUqMGsE7BOkteW+S5YOlVd8eSaR9vWYPUeXvJWyCl3H1WTOcrRvfb7Kmg0qy/5sZJMVOCAfGwEo7WUIzm95gGeLAL1Q1zm7U1i/hgyswtljoOfT3gcypdcnaLsGljw5KsVGsShxVobrHwX+2mtuf6jIOCqalsIKCPOA0hmrM1diK2t3mQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(66556008)(33716001)(85182001)(82960400001)(38100700002)(86362001)(41300700001)(966005)(8676002)(7406005)(7416002)(26005)(6506007)(53546011)(6512007)(5660300002)(9686003)(8936002)(186003)(2906002)(83380400001)(316002)(66476007)(6486002)(66946007)(478600001)(54906003)(4326008)(6916009)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWU3Y1pZRVVPam5nMnloNG9GaHRmRktPRVRmS21BUFFyZjRhd3ZaWTJlYWtX?=
 =?utf-8?B?dWZhc3FtNW9SRkFiYktZT29BcXoxbWM5akhnKzBkRlg0VjlJMUVqNk9wV2dk?=
 =?utf-8?B?TlIyR0l5cVdIVHFMZUMrQlRlQjg1VXJMZkcxZTAwcUsyWC9jdldvcUN3bGlx?=
 =?utf-8?B?TDZFbVllaVNpeW5tTCtDSG5ZSDZuWk1xUWJxZ1Y4eWY0U2liMHZmc1NLQ3c2?=
 =?utf-8?B?U3NPOU5vK3BIR2dxV3g4dXcvUlVoYjZzYUYweEs0RlE4eUNVYTlzV0JrQmN3?=
 =?utf-8?B?WTdyOHdvQUZZUTdteDBJVlBlWnlDV0trUWNiMys5dVZienphd25rM3dxOFJo?=
 =?utf-8?B?ZjlEamVGbXBZb1hjYmwxMncvWjV3Tm4xdkd4MEFIYVphVEN1RGVjZ0ZBTUNL?=
 =?utf-8?B?bE9PbHVrTTNyWjIvZ1FORlRPdUxoS01MeUxKdjY4N1dzN1k5aEFJME9jeXoy?=
 =?utf-8?B?UGtHc1JzUk5hZ0M2clljMEhYNGp5cGVESytzUGZya3pkY2VqMGpOUHdKOHZm?=
 =?utf-8?B?WnJYZFArK2ZOYW1YeXB5OUc0aFlCUG9BQmR0V214UVBmUUJWeWI0MlZjL2F2?=
 =?utf-8?B?dW9JUm0vRnp1bFM1Y0NLQUdvRDRoalhkU0FTenFpZS9HVElhdm94ek1zeTh6?=
 =?utf-8?B?cU9HY1VldzhRSHR6cHhuVWhzSG94MU82VDY0SjVhVEh1Zk84Sm8yZGVkTTJU?=
 =?utf-8?B?czhCdTA4MVVCR2YvUUdJMFhkMEI2VFgvQkZvREttWU9hd1JTNDUvTC9EVDdN?=
 =?utf-8?B?QXBKWmE0YWtSVXlEamdlRmJwWWRWb0xKaElEdENoTEV3bC9ydnBTdUxDY2sy?=
 =?utf-8?B?WVYzemhUNlJZWmxMWkNCZW9EYTJGaVpxOUpNWU9VV2lIUlN6SW1HMGZVc3FB?=
 =?utf-8?B?RW5HTExFZlRDVVlldytzUkt2MWtpdFN1TExEUlorNkd4NjY5VFJkTXpyMUhE?=
 =?utf-8?B?MnMrS2Y5VzdHYjhJaGE5VDM1K0tVeHQzRThST09hM3hzeGdyMzl6SzE5czVI?=
 =?utf-8?B?UWZ0R3R6NUFUanpGR3BtM0ZoOXE4ajJTeUxOanVjazk5YUZiVHhOQ2wzSmZ4?=
 =?utf-8?B?eGF1bTZTdFpmYi9TVGNoZFhoOUFNK0RMVE5uZjJ0azFpRDhwZGNESzlreGNt?=
 =?utf-8?B?eEU1NTQ1Wlp1SUtIa3p4SDlBaC9jSWJ2NTRQZmMvMzU2UU9ZVElLN3kxUGFB?=
 =?utf-8?B?d0ZkdXZLMWJhT1pBTmE5bVZUQU02S1p0Sm5tWi9Bd0ZSM3pob0NmUld0ZlM4?=
 =?utf-8?B?aSthVmx2d0s0Vk1NTW9ybTRmRWsrSVQrbDBPZG9KQTliWXlIcTFnblBLdlVJ?=
 =?utf-8?B?b016RS9sYXVWamNHWXNCbmRBcmdJMjFDeklwYzV4ZzB5NUdpelBaUW1TU1lm?=
 =?utf-8?B?T256aXA1ZTk4cERBYTMzWlRLdG0rcUxKMTh1ZnErMEZLNWNuOUh5T05SdkI4?=
 =?utf-8?B?WHJqK1I5Yzh1U1ZEVVdvWHRMUXM1VlNPY3Zuc0J0bS9md1IrelA0RjgwZ0lP?=
 =?utf-8?B?RXhocXFXK3hTdVcydXkyUW16cjlwNDE4YmUvN3k1VGllYlRjV0VGQUtveFR0?=
 =?utf-8?B?dExXbXBRV0txM0FyZHdrd3FENS8vTTh5Y1ZWdkZEZzhSSGkrWHlBS0U2dWN3?=
 =?utf-8?B?Q1JpZXp4eWlwYlZlcG9yQzhjRlIxN2FzQlgrYlhUa21oa0pPSFlPeXE0OHBH?=
 =?utf-8?B?Rmd6U3dPT0h4RkhiUU4wN3d4R2ZvNmFzMXNCUTE3aVJ0cTBCY2xSVnFuTEhx?=
 =?utf-8?B?dDZHc1FOZkVQSlM4VVowMEdrZityNGpOL0RaYmZVbDdVQkdSUHMzRGY0Q2tO?=
 =?utf-8?B?dWtGM0ppaWRkU3FIUzNNSUpLdTVRRmRwU09SdHJZakd5UGM5SndtZmlBQ1pp?=
 =?utf-8?B?dEtrUkhTbk1Gd0RvTklTWEE2ZEw0TjBoazZZQXFjbTI1TUdpZTNvTWFhUzVX?=
 =?utf-8?B?RCtLOTdMVGNEYXBROTRCMENkRHFCYmdXc3dHL3M3SEt5MUdRUGtyZWZ5a1BO?=
 =?utf-8?B?L2M0T1FMamhQVjB0ZHFFazBlc3RJd1hHZzFuVm1MOWJraFJzeU8rbW9uMU5W?=
 =?utf-8?B?QkJ1RGtRMnJHMDdFM3lIUTlyMUY2T0I5VHR5UHFEUGhEZUxPTjdBY2ZvUGFn?=
 =?utf-8?Q?gk6kOwbmiT1AOJ9EhEt3CcOux?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?VFBBU09CV2tqTDRZdXBWOSsyUWQvbmM3MHk0YzBiTDYyaENzSSsvbFZiZ2VH?=
 =?utf-8?B?cWVzQVd2WFhvYXhzMmp5QXhJSEJySE5mV0FzcEFKTXAyTVg1ZGs5dG5kZVlE?=
 =?utf-8?B?QTRNNGxOVjl4bTB6MGtlbDR1S1E5NHlOTXJ5S0VCZklnZmx3OGJtYjJEQ09G?=
 =?utf-8?B?NEEwd1pRVjI2S1owNjgzR0IvNXVKYTBNQW5ia3pMcWdhU0NPM0lLM3g4Q3JK?=
 =?utf-8?B?SG1WcjZZODJuVEJ5ZWJRQkdMc2RtUjZEcTlDMnhjSUFYeW9DLzh1bExSbnps?=
 =?utf-8?B?ZHJGUzZyWFoybHlIZzJUYWphanFkZUhVYUFHQWE3c3NFdDFYcThGWmZBVC93?=
 =?utf-8?B?M2MzR056N0kyR3BFYThYUzBIT3dPRjI0T2NMeTU3WjJHd1pBaWVwVWx2T0JI?=
 =?utf-8?B?am9XelhjT2g3MEVxeE5uWExCMS8wdE84a0xLaHM0K2tLOWNNeEozbUVaU2RH?=
 =?utf-8?B?T2k5MlcvMWR6bFVyN28zSitNMCtxWlhTVnkxWnFHdTRjQ2o4RGVpV2pGMWdU?=
 =?utf-8?B?d1JhM2MwWmpjVFRqVHRJYnk2aDdKWWZkSHV1NkU4U1VQbzk5dWlFZXNUM0wx?=
 =?utf-8?B?czJudWN1MERwcWx3dnJYMFdBU0lmMnd5aTRKYndmTjQreUVlMFBsZnRjS0oz?=
 =?utf-8?B?dFgxMThFcFBkREpLWnBCZFl6SVpnT2p5V0RyV2E4UGt5bjB0K2xUN0tnTGpT?=
 =?utf-8?B?b1B2amJ6QWQwTzhaeWhZaHcxRHlOdmo0TFBJeVFDU1NrdFdaN2hZVTYyNVIw?=
 =?utf-8?B?cGpiTnVNTTdrZGhzaDVYQ1RXdmg0OGpZeFRvNm50NzNvSTMwQm0rWXF2N0lS?=
 =?utf-8?B?Uzd1YXZoWmtRbkJwOUtZUkZtREhEejhzN0pkUjZ4bmhiYzJrZHZkMUJqMnlG?=
 =?utf-8?B?a0o3cnRVNERiRG5XVGI0WlVzaXRzcGlqNkk4UW10VlhkYVE1dllaOGR2WTIv?=
 =?utf-8?B?RjhCbXV1TktCTW9Hc0ljUkdvNzBkeGJTOTZPcklmKytUSFVUWE5GRXUxTm1o?=
 =?utf-8?B?MUw0Q3IrajU2c2lhbVB1b1NuZmJDQnJ4YnJ4aU9CQTlNaVA5bU8zSW5MQjJF?=
 =?utf-8?B?RUxjbjVuMG1GSCt1Sk5SOC9QVHlSZ3ZFVEgxN0lua21USmZkcmd4Q2RTMGJu?=
 =?utf-8?B?K0pnMVR0WlVKbUU5YjhTc1dQblZ4c3RyR3hncTYzc0NMR0pBeHBhUTRoMDFk?=
 =?utf-8?B?TjFNZGFvUzNNcXNvcWxJRWR3dXhYVE1KMEJHc0h4bVQ0VmlyZng0T1BQZUhT?=
 =?utf-8?B?RFI4QkNBWmFKY1h5ejJMZ1VRQXVQL3RVWi95S1A4aUs0VlhGK0U2OU1CQXha?=
 =?utf-8?B?U056dUJmRE54WlBRS2dRTkkvUkhZS3pWM1I4cVdCV1JLZlVOMFlzOVBOdUFZ?=
 =?utf-8?B?eVdXQ2J0Vmc4NVR5Tyt2d092KzBIdGtGMFFVOEl4VHUxOWpKSFY4UjFUZWxy?=
 =?utf-8?B?ZHAwbmltSFNNUmxIZUE1ZVpBL05GZzMxMWxQOXJhYXdmQVhYL25aSXRZUnU1?=
 =?utf-8?B?MzBHTXYvZzV4QUJxQTRydksrU253UGhMUlFVeUREbXhLVVZLcnkxdlZXcGxK?=
 =?utf-8?B?N3RkNklyWTZmUjhRdUh4OG9Xc2N4U0pZcjFqV1V3Q0lCb25tMTAzQjVHVVZx?=
 =?utf-8?B?M2h2czNyWjBqVGV1R3IzSjFCV2NwNFBwNDNNdVJJd1BUV2pXZUJwRDJyNzdC?=
 =?utf-8?B?WU90ZXdUVFNVdHBWR3Zmb2o4eWtPYVNyRTd1bkt4cWZkTUJzQTFLZTZPOFhP?=
 =?utf-8?Q?2F3QftsHx+XqX4dFwO5L+gM+7ejbqJYldC0qjoK?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0569d1e8-6dc4-4bec-fa6e-08db637d85ee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 15:24:57.6141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOT5x6RmC46ZoGuXzOR3CiFOrC/nn5fX7GKYMbHzUzc7pK47PBe0noL6deUtYLPs6n4lWRC1RQErkdZClm31fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6031

On Fri, Jun 02, 2023 at 02:46:03PM +0100, Ayan Kumar Halder wrote:
> Hi Roger,
> 
> On 02/06/2023 12:43, Roger Pau Monné wrote:
> > On Fri, Jun 02, 2023 at 09:48:48AM +0100, Ayan Kumar Halder wrote:
> > > Hi Xen developers,
> > > 
> > > We are trying to better document xen project development processes and
> > > related tools. At present, we are targeting **x86 and Arm** only.
> > > 
> > > These tools range from bug/change request tracking means, compilers, infra,
> > > editors, code-review tools, etc which is connected in some way to the Xen
> > > development and is being currently used by xen-devel community.
> > What is the end goal of this?
> 
> We are trying to do an initial assesment of the requirements for Xen
> functional safety.
> 
> As a first step, I am trying to make a list tools which are in someways
> related to Xen development/testing/deployment.
> 
> > 
> > I'm kind of unsure why do you care about which editor I use to
> > generate my code, that's up to the developer.
> 
> I agree that editor, email-clients are something that are an individual
> developer's choice.
> 
> However as it is related to Xen development, we want to atleast put down
> some of the commonly used tools.
> 
> At a later state when (and if) we go through the list with a safety
> assessor, we might prune some of these items.

I have very little idea about what's required for a safety assessor,
sorry.

Will this have an impact on what tools are allowed to be used when
working with certain parts of Xen? (the safety certifiable parts I
would assume)

> > 
> > > I appreciate if you can let me know anything I missed or mistaken and the
> > > version currently being used (for some of the tools).
> > > 
> > > 
> > > 1. Code management portal - xenbits (https://xenbits.xenproject.org), gitlab
> > > (https://gitlab.com/xen-project/xen)
> > > 
> > > 2. Project description - wiki.xenproject.org
> > > 
> > > 3. Project management - gitlab
> > > 
> > > 4. Code review - text based email clients (mutt, thunderbird), git-email, b4
> > > 
> > > 5. Text Editors such as vim, emacs
> > > 
> > > 6. Code review history - xen-devel mail archives
> > > 
> > > 7. Code revision management - git
> > > 
> > > 8. Xen coding language - C89, C99, Kconfig
> > assembly (gas), python, perl, shell, Makefile, bison, flex, ocaml,
> > go...
> > 
> > Likely more that I've missed.
> Ack
> > 
> > > 9. Testing tools for Arm64 in gitlab CI
> > > 
> > > compiler - gcc-9.3.0 (Alpine 3.12)) (most commonly used version)
> > > 
> > > binutils - GNU Binutils for Debian) 2.38.9
> > > 
> > > emulator/hw - qemu-system-aarch64-6.0.0, qemuarm64 6.2.0 (From yocto, poky
> > > disto - 4.0.5), zcu102 (**need the uboot, TF-A versions **)
> > > 
> > > dom0/domU kernel - kernel-5.19.0
> > > 
> > > rootfs - alpine-3.12-arm64-rootfs
> > > 
> > > firmware - U-Boot 2022.10
> > > 
> > > 10. Testing tools for Arm in gitlab CI
> > > 
> > > compiler - arm-poky-linux-gnueabi-gcc (GCC) 11.3.0, arm-linux-gnueabihf-gcc
> > > (Debian 12.2.0-14) 12.2.0 (most commonly used versions)
> > > 
> > > emulator/hw - qemu-system-arm 6.2.0 (From yocto, poky disto - 4.0.5)
> > > 
> > > dom0/domU kernel - kernel-5.15.72 (from Yocto), Kernel-5.10.0-22 (from
> > > Debian)
> > > 
> > > rootfs - alpine-minirootfs-3.15.1-armhf.tar.gz
> > > 
> > > firmware - U-Boot 2022.10
> > > 
> > > 11. Testing tools for x86
> > > 
> > > compiler - gcc-9.3.0 (Alpine Linux 9.3.0), gcc (Debian 12.2.0-14) 12.2.0,
> > > clang (from Debian) (most commonly used version)
> > > 
> > > binutils - GNU ld (GNU Binutils for Debian) 2.40)
> > > 
> > > emulator/hardware - Qubes HW (**need details regarding machine, firmware,
> > > etc**) , qemu 6.2.0 (From yocto, poky distro - 4.0.5)
> > > 
> > > dom0/domU kernel - kernel 6.1.19
> > > 
> > > rootfs - alpine-3.12-rootfs
> > > 
> > > firmware - BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023 , EFI v2.70 by EDK
> > > II , SMBIOS 3.3.0 , SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen), GRUB
> > > 2.06~rc1
> > I do use an LLVM based toolstack, so that's usually latest LLVM import
> > on FreeBSD.  We do also test this on the cirrus-ci, see:
> > 
> > https://github.com/royger/xen/runs/5334480206
> 
> Thanks, this is interesting info.
> 
> For the moment, I am ignoring the downstream forks of Xen.

That's not a fork of Xen, just plain Xen hosted on my personal github
repo.

> I am only considering the tools used by the upstream Xen and the associated
> CI/CD.

Gitlab CI does test with LLVM toolchain also.

osstest does test FreeBSD guests, but no FreeBSD dom0.

> > 
> > I_n any case I think the scope to some of the questions is unknown,
> > it's not feasible to expect to list every possible combination of
> > Linux versions vs Xen version vs whatever guests versions a given
> > developer might be running.
> 
> I agree . That is the reason I am picking up the compiler, linux, binutils,
> firmware, etc versions from our gitlab CI.
> 
> It also acts as a proof that we are testing Xen against a known set of
> compiler, linux versions, etc.

OK, so the question is not what every developers uses, but you trying
to narrow down the scope to a specific environment?

Maybe what you want to do is create a specific container in the Gitlab
CI that has the specific tools versions you care about from a safety
certify angle.

Regards, Roger.

