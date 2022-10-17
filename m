Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDA1601B87
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 23:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424623.672191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okY0w-0006jg-J2; Mon, 17 Oct 2022 21:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424623.672191; Mon, 17 Oct 2022 21:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okY0w-0006i0-E8; Mon, 17 Oct 2022 21:51:14 +0000
Received: by outflank-mailman (input) for mailman id 424623;
 Mon, 17 Oct 2022 21:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okY0u-0006S4-CJ
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 21:51:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cee7734d-4e65-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 23:51:10 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2022 17:50:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6595.namprd03.prod.outlook.com (2603:10b6:806:1ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 17 Oct
 2022 21:50:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 21:50:44 +0000
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
X-Inumbo-ID: cee7734d-4e65-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666043470;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=R7edvmSZZq3qVoN3yhQXeokM7ol1GAXlsxTkm2pEaxM=;
  b=Lx/PsjG+KbtGvpYscnAWkahfiCD8NDG448QERZaN+mJDJgKzzEMo35Uq
   aJwR1xmpvz8Gm6Q5mywIu2pWC+Py8TBtH3ibd4vj+Mdo5Ccwygj2dlhz7
   p9Dz22ztsqaEdp5Yb9chHVgWPoVYIAmeBkwPhTx1vuWBizIoF/ZTlWDRd
   Y=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 82927419
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:179yz6x09kFfFckN8eB6t+fExyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 TdNUWuCbqzZYDHwe9lyOYW//E1Tu5LcztYxHQA9/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3bdIOGd36
 PwhNi1cdkDdrfK2yeKrY7w57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvTi7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+VzHmkBNtDfFG+3txA3EW0y3UaMhA5XEWSsdqniVajXfsKf
 iT4/QJr98De7neDTMT5XhC+iG6JuFgbQdU4O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBJTFpqqzTdnub+Z+dtzb0Mi8QRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXLHjX3z
 yGPvTIJrbwZhs4W1I225VnCxTmro/DhRAMv+h/eWG7j6wpjfZOkfKSh812d5vFFRLt1VXGEt
 XkA3sOZteYHCMjUkDTXGbtdWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4cuC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:VYtSy6HteNi6BY9mpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.95,192,1661832000"; 
   d="scan'208";a="82927419"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCKJIi0GnrfLhTmVgP6N6UKXzmBNHtgONUv6ht9uESPnA/AugSVnuTVpa9dJVN6IUyLBsqBfq+Q8T1cT+BhtR1cFO1K6BSKd7G7Zdw6YdugeC1DF31VwDDUCOaTCZ/9EIwk14tnsZbMfqY4J0HcWx0tRmR8D35ZzOg9gsmjYJ/HFtv8K0nJFGBUMCdmcktt+Ih3V5JHbIl453ezzt/detA5ZW2WnmMwBo0aB9o7FunWTbzrKc0Gvwt2WRl5rZqaSsdn5jMNd2tMcORmxBTJv5e5BMPjzjBrl0li0oL47tnLhunllew06mQp3L0yt8Lz4hrD0dcHpinNrjpysWAjqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7edvmSZZq3qVoN3yhQXeokM7ol1GAXlsxTkm2pEaxM=;
 b=SO7WZOgXxXauLcyqxRzdfAUqHfi3vUGklEhgHh42kP53kCeeQmTxf9bzYoh6KN9JsmsSBV0S3haADJeFbHsr0ZJig2mRxDkMgAoxCnymNSHTv/SAgARCfZRv8l+k2m9AhCre250t9/CkyF8A6+zBir46q7Fitu5O47szVqJe6+O+qpRl03yFrhH1a7BxbYBqilNAw3OclDeSymiALD3QMceT+Ff9/b9zeebwg0wjbEJynJsfyJqLSzwWNZe6y+aX/EW4lpeifrd5KCLodVWiyY1AcwhhFyDHSI07+Q1XUeXldL5iy3EIUXsiuP7hTiH9kCw1A8aH0KyKccW/hcl7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7edvmSZZq3qVoN3yhQXeokM7ol1GAXlsxTkm2pEaxM=;
 b=Yni05VXbANBsYIKOmDJRmY8pknFnV0jHFvkXYWH4ZJ+7r8yTUJJhCiCqZTdNNZ4MVXXY2liXtAu85/nO10LJ4lU5WqlA7aAEdX8GB2EQ+Lf3SWKtG1U5qlPlYh7GZ78mFbxl+rpbureVoeFNbr8GJWrQiZeVSwn0nWUreD7t2t8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY4lyBiWnfx+vnUkmAUdSmWjh5Xq4TC2qAgAAU4AA=
Date: Mon, 17 Oct 2022 21:50:44 +0000
Message-ID: <cadcee69-e51b-99af-78c3-ab4a0e2e42d9@citrix.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-3-andrew.cooper3@citrix.com>
 <0456d318-731f-8df7-297c-19ecde06ed96@xen.org>
In-Reply-To: <0456d318-731f-8df7-297c-19ecde06ed96@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6595:EE_
x-ms-office365-filtering-correlation-id: 240486ec-303e-40de-98bd-08dab089a48e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QKYM2JbKV2EBwioCs4wuMPiHn8bJqgy+SvKHigyJChfPcSqOOA5lwanltybXA8A4jOnusIl0pUWF5vhlImOE0Awpkc7SRLT70R9T/jqx5T/z/dz8LOo2hV8WBGZdwd5B57EBDF+ptUhKPQtBFVE73LM7bxCMOxT6eN4xpmlzAO8RhQIVS/Op+MKv4O5/cS87dX5ITvcr6EEKjU/z2P7cma+HLed94AqCl961eFQswJL8ViHsIESxPpYjzDO2remumJjNkHkVeud7S/wmkFp+KcKRk7QIOhAPAeGrtVoU/TqfCDk4voia44Ln04F6ZsGBA1v9dw1PRSAgVNFYbXmjx2Fptyr20KujyzFTMi9wXdPlOv3FFgvSQ2RyoVlJtkJfbOWk5EExoU/6/ug+IVjbyMEDJJ4c24HxXF4mwgsK+gsFm3Ma2l93KGzDogyJpY/9ach7xM5mFRqNgdEsDTLbyuoRaH5uKRWbopJMS6WwwwhI0JrycgsFB4k7OAm0gnbT+lHk48kkRvgZbUCuW8boLyNkcC9GEAiP4252mgseM3VBeO7XVv5RTKZLsR94tV3EzSv8c3y7AogZIZhOpsx5JzbDm73raN1kAYKQsC8XfZKqBHaNm5yJ+kONRQ14Gfj9FaUWIvVcptvQYPPrM9JVWlGQqJ3pA58qn6NczOTG4axTinpo+pYEZtTfHMlAxF2ALNIAELljjVz8j5Q6n152KEcR+gpRGVPStd5Ak1JuMRT2xpIFRGGKuOlJCF6e+sQodAGNeiDKhjKTlmX6HdrZySDkQVy/PdR12vc4fO1b2JDQgZLK+j/kOkU73KhFZZoyP1oyD8a2TYI/mza7FTGR3g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199015)(66899015)(186003)(31686004)(2616005)(2906002)(6506007)(26005)(54906003)(5660300002)(316002)(53546011)(6512007)(86362001)(38100700002)(41300700001)(82960400001)(110136005)(64756008)(8676002)(91956017)(66446008)(66476007)(76116006)(66556008)(66946007)(83380400001)(122000001)(4326008)(8936002)(31696002)(38070700005)(478600001)(36756003)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkxZMUhNRnl6Mnh3eU1DSUFNRTI2MGEyK0ZNbkdHV0I0ZlAzNHh6S05ST2lu?=
 =?utf-8?B?RUpocUE1MFZEaUIwYVNUZWY2U1huRmNyVmZneXpEbmtMYzBnRSt6dEQ0K0ZT?=
 =?utf-8?B?K2NXSHBRWnFxMndxZGQrV2RxajRZUzgyVVVHMlFNTit5MnZYWSsrS0NaN0Rx?=
 =?utf-8?B?dFRtOXRjY2EvVEplelpLeHVoYXNaWVpFQXNuaDY1b0JsbFVSeHo1TnUwU211?=
 =?utf-8?B?QmdQbUJLZlVVVzdIaVdPYlpyMEZqOXQ2WWg3MGUrM3VHK2NIanQ5eDRmcWpt?=
 =?utf-8?B?L3lFcXBMVW1GcWttQmFMbmJ2RlBDcG5paEVUaFVwYWR3MU1iSGRncWtNQ0Fs?=
 =?utf-8?B?dXc4REZwVGJGdHhxcmwzRWhqcWZTZVF6ZnYxdzV3MFZlWE5sY01Sb0RwMWg5?=
 =?utf-8?B?aXpLWjBYb2k0TEh4V1RKcG8xS2RPOXFwWnh5VXVMOW4rV05uYk1oSzB4b3Z2?=
 =?utf-8?B?N3pFZy81cFVIbGhpMVBFNVA0TjBreTdPWGkwazllRlBKVm9KMDdxT25VQWRn?=
 =?utf-8?B?OUc0clpHV1BwZ1dVd2tvazFWM3BzV2dVeldXdXhQS2l4UEpKNTNQb1dJdjcw?=
 =?utf-8?B?TkZBU3BYa291OUU3dGdVMW9EdWtxa1FmVk5Xb2ZXb3NYQzV0SE4wZFlwL2Uw?=
 =?utf-8?B?NEZRZUc0aVhLZkk1TzB5bEduZUx3d1BwYllrQWVtQkc0ZmN4RnU1RndWR3Fp?=
 =?utf-8?B?L0dTaHpXL01xaXJqbzZpL0ZLOGhKWUJOQUFQRHVZTDFrakpacWU1VGVDL0hp?=
 =?utf-8?B?RGtwRmgrK1VZeUtMRzlmMVJSWGtiSWlSWWxZT0diTTlsK20yZTFscGMvNTgv?=
 =?utf-8?B?VmcxNzRueGhCY0RuTnJmMjRFVVh1TnBKLzcrc0lMa3IrUU1zcmVXVit4YWhV?=
 =?utf-8?B?cEZ2OGI0MThzNTFwZGNLR3FZVW9YcjM2WGhiTXUyc1hsZ0JJSENPREdUUU44?=
 =?utf-8?B?eGVDUjhwSE5Ga0FrdGpQY1dlWXd3UFI1SjQvdkhwOHFwRXFHaWxYcllLWUVv?=
 =?utf-8?B?NElsYTd0K051WkhQWktPNFhSNkJIb2xYK3Blam5sRXl5RnNKdjFhUmptMlRR?=
 =?utf-8?B?UVd5bE0vdjk1ekJyVklHVEVHUitWVnJlZkVrYVFORXNRbklJcFMvWC8rQ0Ey?=
 =?utf-8?B?bVMyTFlpc3lhL1pUQ2czUWp3VWRGN1VPN0lYWTBpK0J3ZWFTaG5oajFFNWd6?=
 =?utf-8?B?RlRjZUg3SUVaTWVHOGl0eDlXU0NSMDlQM3BuNzFYK1J4MzUzMGtzcGxYWThY?=
 =?utf-8?B?NmFjNDFPOFRMREk2b0hoay9NWE5uL1dRTy9qT0R5T2FmeGNTbnVIdFY4Rklh?=
 =?utf-8?B?Z1R1b1prVnRpSmNmMzRBYTBIemxoaDZ5Z3lNMGhoMzRWanJTNXVGeE1jZk9t?=
 =?utf-8?B?NXE5R0lKNXMxTUVCN3Q3bDFxOHdxTDY0SzVYWWZOeXk3c2haL3JrUVc1aUlF?=
 =?utf-8?B?VUtRajhTMi9sRFIxVmIyNUdscFFXRjBIbStRaEpELzJqWUQvNC9NNDJZOUZo?=
 =?utf-8?B?c1RnZXIyb3lzeTZwN0tvZnZvMldRUC9uOThrNXA1MFNpNlJjd3R5YjRWOEVI?=
 =?utf-8?B?RHc1M2lBZUFOT085ekVTTGdEVlQwb1Q3Tm4xT2VXTGtNVmlFZVBQanJXTXFN?=
 =?utf-8?B?ekl1elJaOGtsN0psVDE1ZXkzQUt3NFBEdUJMeGgyREFnaVlDOFJBVFRTL21S?=
 =?utf-8?B?NlVaRVZRQWtQMWFYTFRhVWdSLzFZWkVZYXpET0dLQmdxUHBrVEJzUThQQ1M5?=
 =?utf-8?B?bklJZjlKaWRLTGpUcFU5cWo0U3VSdERnWjhBNUZKaW4yN2RCNjUwRWJ6YTJG?=
 =?utf-8?B?Tnoxc2NiRjk0M1pqaGd2aVRwbHVhTHZpUjY1bXN3S1BUQUpkQ2Y5WEpOQmhT?=
 =?utf-8?B?SUVtellGSTZ3V3R5MTh6b2hwZTJ4bGxNRmJpYisrNUlTV2lCTVcvejU4V3FZ?=
 =?utf-8?B?ajFlUzZ6S0FPVWN5a0QxWGlieGpUaXdSYWJZNko0NE9Od2QrRXd2dUhUZFND?=
 =?utf-8?B?VmNRT0N5dXZQQ0RRbHhLNGpzRWlMbUh6VVlucWpJTVE5UzQ0bFJ3RmRLY1JW?=
 =?utf-8?B?R0ZmVm04ZDBoZWZkLzZkYW84YkhnT3JLUS9hNkRxQTFqZ3pnTXZCSklCYzJ2?=
 =?utf-8?Q?7N1iQoD2yMrp4CDvFVEJ1tILb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BE2ABBAF372AB45BBD751FE5A076C5F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240486ec-303e-40de-98bd-08dab089a48e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 21:50:44.3694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrtYH91+RDf/5gG2luTg32AAaDa+38B0MtBFUu9i/8Lshf/spiNE7e80lLw8KqTR3wSTN1TN9Aeh7AU3k17SYF6lCo5CpNmn40418mXkuZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6595

T24gMTcvMTAvMjAyMiAyMTozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBBbmRyZXcsDQo+
DQo+IE9uIDE3LzEwLzIwMjIgMjA6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBGcm9tOiBI
ZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+Pg0KPj4gVGhlIFhTQS00MDkgZml4ZXMg
ZGlzY292ZXJlZCB0aGF0IHRoZSBHSUN2MiBwYXRoIHRyaWVzIHRvIGNyZWF0ZSBQMk0NCj4+IG1h
cHBpbmdzDQo+PiBpbiB0aGUgZG9tYWluX2NyZWF0ZSgpIHBhdGguwqAgVGhpcyBmYWlscywgYXMg
dGhlIFAyTSBwb29sIGlzIGVtcHR5DQo+PiBiZWZvcmUgYQ0KPj4gWEVOX0RPTUNUTF9TSEFET1df
T1BfU0VUX0FMTE9DQVRJT04gaHlwZXJjYWxsLg0KPj4NCj4+IEFzIGEgc3RvcGdhcCwgYXV0b21h
dGljYWxseSBnaXZlIGRvbWFpbnMgMTYgcGFnZXMgb2YgUDJNIG1lbW9yeS7CoA0KPj4gVGhpcyBp
cw0KPj4gbGFyZ2UgZW5vdWdoIHRvIGFsbG93IHRoZSBHSUN2MiBjYXNlIHRvIHdvcmssIGJ1dCBz
bWFsbCBlbm91Z2ggdG8gbm90DQo+PiBpbnRyb2R1Y2UgYSBjb250aW51YXRpb24gd29ycnkuDQo+
Pg0KPj4gQSBjb25zZXF1ZW5jZSBpcyB0aGF0LCBmb3IgbGF0ZXIgZXJyb3IgcGF0aHMgZG9tYWlu
X2NyZWF0ZSgpLCB3ZSBlbmQNCj4+IHVwIGluDQo+PiBwMm1fZmluYWxfdGVhcmRvd24oKSB3aXRo
IGEgbm9uemVybyBQMk0gcG9vbC7CoCBTdWNoIGEgZG9tYWluIGhhcyBubw0KPj4gdkNQVXMsIGFu
ZA0KPj4gaGFzIG5ldmVyIGJlZW4gc2NoZWR1bGVkLCBzbyBmcmVlIHRoZSBtZW1vcnkgZGlyZWN0
bHkuDQo+Pg0KPj4gRml4ZXM6IGNiZWE1YTExNDljYSAoInhlbi9hcm06IEFsbG9jYXRlIGFuZCBm
cmVlIFAyTSBwYWdlcyBmcm9tIHRoZQ0KPj4gUDJNIHBvb2wiKQ0KPj4gU3VnZ2VzdGVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPg0KPiBUaGlzIGlzIG5vdCByZWFsbHkg
aW4gdGhlIHNwaXJpdCBvZiBteSBvcmlnaW5hbCBzdWdnZXN0aW9uIGFueW1vcmUNCg0KT2ssIEkg
aGF2ZSBkcm9wcGVkIGl0Lg0KDQo+IC4uLiBJbiBmYWN0LCB5b3UgZHJvcCBhbGwgdGhlIGV4cGxh
bmF0aW9ucyByZWdhcmRpbmcgaG93IHRoZSBjb2RlIGlzDQo+IGZyYWdpbGUgKGUuZy4gd2UgYXJl
IHJlbHlpbmcgb24gZWFybHkgbWFwcGluZyB0byBub3QgdGFrZSBhbnkgZXh0cmENCj4gcmVmZXJl
bmNlKS4gTWF5YmUgeW91IGRvbid0IGNhcmUsIGJ1dCBJIGRvIGFzIEhlbnJ5IGFuZCBJIHNwZW50
IGFnZXMNCj4gdG8gZmlndXJlIG91dCBhbGwgdGhlIGNvcm5lciBjYXNlcy4NCg0KSSBwcmVzdW1l
IHlvdSdyZSByZWZlcnJpbmcgdG8gdGhlIHRvZG8/wqAgSWYgc28sIHRoYXQncyBhbiBzdGF0ZW1l
bnQsIG5vdA0KYW4gZXhwbGFuYXRpb24gb2Ygd2hhdCBpcyBzdWRkZW5seSBkaWZmZXJlbnQgYWJv
dXQgaXQuDQoNCldoYXQgaGFzIFhTQS00MDkgY2hhbmdlZCBpbiB0aGlzIHJlZ2FyZD/CoCBCZWNh
dXNlIGl0IGxvb2tzIGxpa2UgdGhlDQphbnN3ZXIgaXMgbm90aGluZyBhbmQgdGhlIEdJQ3YyIHBh
dGggd2FzIHNpbWlsYXJseSBmcmFnaWxlIGJlZm9yZWhhbmQuwqANCkluIHdoaWNoIGNhc2UsIHdo
eSBpdCBpcyBhcHByb3ByaWF0ZSBjb250ZW50IGZvciBhIHNlY3VyaXR5IHBhdGNoPw0KDQo+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4g
LS0tDQo+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0K
Pj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+PiBDQzogVm9sb2R5bXlyIEJh
YmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPj4gQ0M6IEJlcnRyYW5kIE1hcnF1
aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IENDOiBIZW5yeSBXYW5nIDxIZW5yeS5X
YW5nQGFybS5jb20+DQo+PiAtLS0NCj4+IMKgIHhlbi9hcmNoL2FybS9wMm0uYyB8IDQzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCA0MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMNCj4+IGluZGV4IDY4MjZm
NjMxNTA4MC4uNzZhMGUzMWM2YzhjIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5j
DQo+PiArKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMNCj4+IEBAIC0xNzM2LDggKzE3MzYsMzYgQEAg
dm9pZCBwMm1fZmluYWxfdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkNCj4+IMKgwqDCoMKgwqAg
aWYgKCAhcDJtLT5kb21haW4gKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+IMKg
IC3CoMKgwqAgQVNTRVJUKHBhZ2VfbGlzdF9lbXB0eSgmcDJtLT5wYWdlcykpOw0KPj4gLcKgwqDC
oCBBU1NFUlQocGFnZV9saXN0X2VtcHR5KCZkLT5hcmNoLnBhZ2luZy5wMm1fZnJlZWxpc3QpKTsN
Cj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoCAqIE9uIHRoZSBkb21haW5fY3JlYXRlKCkgZXJy
b3IgcGF0aCBvbmx5LCB3ZSBjYW4gZW5kIHVwIGhlcmUNCj4+IHdpdGggYQ0KPj4gK8KgwqDCoMKg
ICogbm9uLXplcm8gUDJNIHBvb2wuDQo+PiArwqDCoMKgwqAgKg0KPj4gK8KgwqDCoMKgICogQXQg
cHJlc2VudCwgdGhpcyBpcyBhIG1heGltdW0gb2YgMTYgcGFnZXMsIHNwcmVhZCBiZXR3ZWVuDQo+
PiBwMm0tPnBhZ2VzDQo+PiArwqDCoMKgwqAgKiBhbmQgdGhlIGZyZWUgbGlzdC7CoCBUaGUgZG9t
YWluIGhhcyBuZXZlciBiZWVuIHNjaGVkdWxlZCAoaXQNCj4+IGhhcyBubw0KPj4gK8KgwqDCoMKg
ICogdmNwdXMpLCBzbyB0aGVyZSBpcyBUTEIgbWFpbnRlbmFuY2UgdG8gcGVyZm9ybTsganVzdCBm
cmVlDQo+PiBldmVyeXRoaW5nLg0KPj4gK8KgwqDCoMKgICovDQo+PiArwqDCoMKgIGlmICggIXBh
Z2VfbGlzdF9lbXB0eSgmcDJtLT5wYWdlcykgfHwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICFwYWdl
X2xpc3RfZW1wdHkoJmQtPmFyY2gucGFnaW5nLnAybV9mcmVlbGlzdCkgKQ0KPj4gK8KgwqDCoCB7
DQo+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7DQo+PiArDQo+PiArwqDC
oMKgwqDCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogVGhlcmUncyBubyBzZW5zaWJs
ZSAiaW4gdGhlIGRvbWFpbl9jcmVhdGUoKSBlcnJvciBwYXRoIg0KPj4gcHJlZGljYXRlLA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqAgKiBzbyBzaW1wbHkgc2FuaXR5IGNoZWNrIHRoYXQgd2UgZG9uJ3Qg
aGF2ZSB1bmV4cGVjdGVkIHdvcmsNCj4+IHRvIGRvLg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8N
Cj4+ICvCoMKgwqDCoMKgwqDCoCBBU1NFUlQoZC0+YXJjaC5wYWdpbmcucDJtX3RvdGFsX3BhZ2Vz
IDw9IDE2KTsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJmQtPmFyY2gucGFn
aW5nLmxvY2spOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIHdoaWxlICggKHBnID0gcGFnZV9s
aXN0X3JlbW92ZV9oZWFkKCZwMm0tPnBhZ2VzKSkgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZnJlZV9kb21oZWFwX3BhZ2UocGcpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHdoaWxlICggKHBn
ID0NCj4+IHBhZ2VfbGlzdF9yZW1vdmVfaGVhZCgmZC0+YXJjaC5wYWdpbmcucDJtX2ZyZWVsaXN0
KSkgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZV9kb21oZWFwX3BhZ2UocGcpOw0K
Pj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIGQtPmFyY2gucGFnaW5nLnAybV90b3RhbF9wYWdlcyA9
IDA7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJmQtPmFyY2gucGFnaW5n
LmxvY2spOw0KPj4gK8KgwqDCoCB9DQo+DQo+IC4uLiB5b3UgYXJlIGhhcmRjb2RpbmcgYm90aCBw
Mm1fdGVhcmRvd24oKSBhbmQgcDJtX3NldF9hbGxvY2F0aW9uKCkuDQo+IElNTyB0aGlzIGlzIG5v
dCBhbiBpbXByb3ZlbWVudCBhdCBhbGwuIEl0IGlzIGp1c3QgbWFraW5nIHRoZSBjb2RlIG1vcmUN
Cj4gY29tcGxleCB0aGFuIG5lY2Vzc2FyeSBhbmQgbGFjayBhbGwgdGhlIGV4cGxhbmF0aW9uIG9u
IHRoZSBhc3N1bXB0aW9ucy4NCj4NCj4gU28gd2hpbGUgSSBhbSBmaW5lIHdpdGggeW91ciBwYXRj
aCAjMSAoYWxyZWFkeSByZXZpZXdlZCBpdCksIHRoZXJlIGlzDQo+IGEgYmV0dGVyIHBhdGNoIGZy
b20gSGVucnkgb24gdGhlIE1MLiBTbyB3ZSBzaG91bGQgdGFrZSBoaXMgKHJlYmFzZWQpDQo+IGlu
c3RlYWQgb2YgeW91cnMuDQoNCklmIGJ5IGJldHRlciwgeW91IG1lYW4gc29tZXRoaW5nIHRoYXQg
c3RpbGwgaGFzIGVycm9ycywgdGhlbiBzdXJlLg0KDQpUaGVyZSdzIGEgcmVhbGx5IGdvb2QgcmVh
c29uIHdoeSB5b3UgY2Fubm90IHNhZmVseSByZXB1cnBvc2UNCnAybV90ZWFyZG93bigpLsKgIEl0
J3Mgd3JpdHRlbiBleHBlY3RpbmcgYSBmdWxseSBjb25zdHJ1Y3RlZCBkb21haW4gLQ0Kd2hpY2gg
aXMgZmluZSBiZWNhdXNlIHRoYXQncyBob3cgaXQgaXMgdXNlZC7CoCBJdCBkb2Vzbid0IGNvcGUg
c2FmZWx5DQp3aXRoIGFuIHBhcnRpYWxseSBjb25zdHJ1Y3RlZCBkb21haW4uDQoNCg0KWWVzLCB0
aGlzIGNvZGUgaXMgYSBiaXQgbmFzdHksIGJ1dCBpdCdzIGxlc3MgYnVnZ3kgdGhhbiBhbGwgYXR0
ZW1wdHMNCnByZXNlbnRlZCB0aHVzIGZhciwgc3BlY2lmaWNhbGx5IGJlY2F1c2UgaXQgYXZvaWRz
IGluYXBwcm9wcmlhdGUNCnJlcHVycG9zaW5nIG9mIGluZnJhc3RydWN0dXJlLg0KDQpBdCB0aGlz
IHBvaW50LCB3ZSdyZSBhIHdlZWsgYWZ0ZXIgdGhlIHB1Ymxpc2hpbmcgb2YgWFNBLTQwOSBhbmQg
Q0kgaXMNCnN0aWxsIHJlZCBhY3Jvc3MgdGhlIGJvYXJkLsKgIFRoZXJlIHdlcmUgbXVsdGlwbGUg
ZmFpbGluZ3Mgd2hpY2ggaGF2ZQ0KbGVhZCB0byB0aGlzIHNpdHVhdGlvbiwgdGhhdCB0aGUgc2Vj
dXJpdHkgdGVhbSBuZWVkIHRvIGRlYWwgd2l0aCwgYnV0DQpyaWdodCBub3csIHdlIG5lZWQgYSBj
b3JyZWN0IGZpeCBhbmQgd2UgbmVlZCBpdCB5ZXN0ZXJkYXkuDQoNCn5BbmRyZXcNCg==

