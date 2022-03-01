Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3414C8E6E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281644.480073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3xh-0001io-Be; Tue, 01 Mar 2022 14:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281644.480073; Tue, 01 Mar 2022 14:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3xh-0001fQ-5r; Tue, 01 Mar 2022 14:58:49 +0000
Received: by outflank-mailman (input) for mailman id 281644;
 Tue, 01 Mar 2022 14:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP3xf-0001ex-C0
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:58:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1739bbe3-9970-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:58:46 +0100 (CET)
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
X-Inumbo-ID: 1739bbe3-9970-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646146726;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j6G4UMWqA/hPTRe/kzbfqxxngv/FBfgFnY0TcfNZOQc=;
  b=TeGAwFe1AjKt95w7+wZAV3a7QksftBvnY5COtwo29G3nsb8+11u6mqg1
   8rM12bL+dhP9FrCTupfJd0YMdjVq2Uw2WJqKbr4Rq17wft5h6SULSY5gX
   VlZYPKvTq0xG+z5rToSAkBBizPhpXnSj7tGRojZ+RltOz0xqIL+urG7tV
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65632347
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0hIU6qAbg6/KTxVW/zTjw5YqxClBgxIJ4kV8jS/XYbTApDh30DUOx
 mIcW27XOaqNZzP2KIwnaYiy8BsBusTSyYNnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhyy
 N4Uqs3uaz4KBfHRoucvYjgIQx1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4TQ62EP
 JZGAdZpRCvKPUF+OGgKNIkFsdmDhHynXB9Wp3vA8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0WNpbSvJrtiO06ZGI/jyaNFklHm59QYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb5
 BDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0gfBgybJpdIGa4C
 KM2he+3zMUIVJdNRfUqC79d9uxwlfSwfTgbfqq8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLamM3mPrNVKdghiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:Z7zTwKGoSyibvhI2pLqFSJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdsZJkh8erwXJVp2RvnhNBICPoqTMiftW7dySqVxeBZnMTfKljbehEWmdQtrZ
 uIH5IOauEYSGIK8PoSgzPIU+rIouP3i5xA7N22pxwGIGEaCJ2IrT0JcDpzencGHjWubqBJc6
 Z0k/A33gZIDk5nCPhTaEN1OtTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mHryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczBgNl1mpDr1L8Zqq
 iKn/4SBbU015oXRBDtnfLZ4Xil7N/p0Q679bbXuwq5nSWzfkNFNyMIv/MpTvKe0Tt8gDg06t
 M544rS3aAnfS/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvtn+9Pa1wVB4S0rpXW9
 WGzfusk8p+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wuK4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fqd2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLH3QIwFllu5EU5HHNc/W2He4OSITeuOb0oEiPvE=
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65632347"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrFlZPrzQvCrZ72GVgkAfE7Sxj2g0d0+GL9S5ISANXudc/x1AjJ9Z0AjcWeMp7qDb/0p6G1t5AHP4zOfz8Fw7/s1HCRbkzL96BniuA8EJfqgBYLjBFu1+fXiyKhI36RVHwwbEe3uRYqeHXLmP2Lgb4dd7r50K/fuJtmtRL14toBg90DdhtpD7GKEYOAGVTGzM6fT34byW82GzmkYd3KGU9VC3meTehUiFM4CsDRxDBBA6MwhzAzsoia9KJ68tvnwyRnnSwPHD1sPJFk68+S/H8W+vHdawOkSzTSPRdyFrvTT0z9+ataDkSRFyUeSNM+q2mQnRcSF+3sS7Jd++3ne6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6G4UMWqA/hPTRe/kzbfqxxngv/FBfgFnY0TcfNZOQc=;
 b=CAEbbmKGp5iKZs/cR/CPQhFXM1ieDrY5wRtqZUoM7oeeN8UkThy2+eh0Mo8D2ZTflD6Z5yT8kDVTjIQEwxUV/6cdccbcq3STZ990sB1jkOHA+O5hsr2aOHbYgIGnyxY7ezb/2CuXnnsiwkalXOw2l4WHRX031PTag3O0D5k6BEnjCysVj5dcIZDhxn955B3yM9e0I/uQKGU3pkJdwu7P5LNRw761/uEF7nG9JKUFK58xjuD4oXY4Isj3kDQR/zd8tAHxw2KuPmLIQW+cvSYaWQP2ywQyf+uaz45iZ5IOuSPIg2xIFcm6hLJ1LmAflRx1y/KY5Ehy1043kfi+77N88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6G4UMWqA/hPTRe/kzbfqxxngv/FBfgFnY0TcfNZOQc=;
 b=v1urMe3zog+GlIS+GwcD/9QE/ONM3j+ZCTjWxwxUS/aZ0kSnYnQdF4izWhgD7Dy7KRtNEO7L64XpAff2KESpDzcwi4mK1N/f2B8DeOj4y1gM1zdihWqGJmlamzxfsWXGc/wSeclVfOUVLL5gGVnJSU1YSdirvEZ4Vv5nmDq9WAw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Topic: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Index: AQHYJ+IV6PtRJY8p5U2wBnUH9jKzdqyj8n0AgAa3aoA=
Date: Tue, 1 Mar 2022 14:58:40 +0000
Message-ID: <5fae516a-17c1-0ce4-c46e-909a83c0e273@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220222114711.19209-1-andrew.cooper3@citrix.com>
 <e8b71b3a-55a0-31a2-b2ab-3b2470680709@suse.com>
In-Reply-To: <e8b71b3a-55a0-31a2-b2ab-3b2470680709@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6da19933-1718-43b9-710f-08d9fb93f8e6
x-ms-traffictypediagnostic: SJ0PR03MB6875:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB68757E4651D2CE921EF6C7FABA029@SJ0PR03MB6875.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KjtwmHeLV9esxaKbTQaSuGyQQiX3vDg65l0mxzibRvaTeCCy2HhGaHK9HU6lsg/ehVoNWgxqbnZJ3K+9l0KWqeXs6R/u/BUbESXjcfEVSGu7E7RA3DcJLcxJMRMNN3GdVwbwBIy+lbmTrRGv0v2iaB+N5VDJzaNCX9C488cTAtN5qmQvlb1ELC5OEFjEm8/qfG2FNgS6iVazuVNwsO5TbdciUsvmBfN6oWej82eZeIQn6rc+iCIm3Qj3IChwZ7J9eC8nDdWB7zE29lu6Z46yIPq5P8JtnkFOieKbAKn/Sn0ibPTqEGfvl6nKgrziSJ+6Hp9GmvhgO2ClxL/YdB+6EwPBR6ljnb+41nrzMMpR/LVP/r61itL/0aMvJhu7Kj/js5Oa9zNsNWWvyu4F2Hd7c7A4makG0/69caVaWetIoZm1IwSyOBj6dpwDY83VYxMYMu9hj/OLnVukCpAT2Imc7TCwouTE3xEMf4T+/BoTS0wV9rZ87Hhn4adslZujx8hyofmheouP3iLEdb+MhZhnQz1o02zSNLpGBcK8HT/4WJ06lv+0CXZGdnO3yZvSHDgTLlD98JmHqAZ2RnFFJxtocu5bAR14eCMMmbMFsPOxwx/rF/u0wGcZ6+1Yrcq8IlrJvDRKWyc7qN3yjnJ4kEeVNkxk6Mmbh9wq71TLmWBd4X+PDQXslHvrb66Fe3XwBnyIrV24t9rD0acPF5u1ByJ7yAM/B6Z12qj8FbtTKGLbXnCoLzkaksRe3PqE8Fgnz+/4geSu4I1Vpvnb3dPqadQQ9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(82960400001)(186003)(26005)(6512007)(6506007)(64756008)(66446008)(53546011)(2616005)(122000001)(36756003)(38100700002)(54906003)(66946007)(2906002)(5660300002)(66556008)(76116006)(38070700005)(8676002)(4326008)(6486002)(86362001)(8936002)(508600001)(91956017)(66476007)(31686004)(316002)(6916009)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEtnejUweUtheGtwQm5JYVlBTVJVK3ExR1lCZkNlRkc5eTVQeU5DaHRuMEI1?=
 =?utf-8?B?RzR5cDd3SGYvT3dSL0treDE0eTh6a2kzQU5BdzJaaUpTamhGL2dkZjhybmRZ?=
 =?utf-8?B?ck93M01NMm9HdEU0U3AyMVhtNjY5bWRYZVZGZWdPUzZ5c0MxT05FTE5aR0hD?=
 =?utf-8?B?UUJ3MVRCWWFyYW1UVmc4S3F6cS8wRmE5RE5VeDFGd2VodG9TR2c0RHlnL3V6?=
 =?utf-8?B?d1kyWnF4Zk4rbzNHemNDVzZ6RC9XRjVRNEVCR01rcXRFR1hydWxBT3lwdHZG?=
 =?utf-8?B?aVNES0hKOGFJWkl0MEc5QWt4azFJWnhWMnFMcTlIQURORFB5bWM1NVdGL21y?=
 =?utf-8?B?UW9qekpRK1hIei8zV3FiZ2dwRnZ6bzBmd0REUDY2RzNPWTJFS1I0aUphN0VE?=
 =?utf-8?B?Wm80dGpVTERMRGJ5R2pvZXI0Wk1MSWJPM1JycEsxOWs3blQyQjNmNzNiUWJR?=
 =?utf-8?B?UXZWNll3NE9HMzZQdURhaDRBdnhwSFRqeHFLdHdmd20rUFAxU3dHMWFoZm9v?=
 =?utf-8?B?NGFRUFlXQlZSdHFJTFB1aDFDMVo3MlFKYzJYelZvQnZjMkpIblZpQW1vQTY0?=
 =?utf-8?B?STd0Y2d2NXhXSzVHUkdxK0xXdFhrOGNJbVRSU3NTc0Vla2tkdkdYbXNTUjFG?=
 =?utf-8?B?VzAyMkZBQkw1V1F4b0dnMTZETWZUSFpodm5ibkxqKyt3UGJlc1Z3OHpiYzJa?=
 =?utf-8?B?a21LdEhRVHg3MVIvTklTZlZIZkVIZWswSjBYYXdnUDd2NzdDWVNYZjRDaDA1?=
 =?utf-8?B?OWpTeDdmcjhQTU5zeXdmUTBoUUtoOGpsK3V2Ulo2WWpaWXZXK3BlZ0VJV0lU?=
 =?utf-8?B?dzNnZTdqbVd6N2RqQ28wVGlEY3hKRnkwKzd4UXBOUVlWMURIbGloWDh1QnlH?=
 =?utf-8?B?cFJsNjViMjFCMUEyNnpuRFpkcUtoSHB0cWNuREtkWHgrVHV5N0lRbzN6VUk4?=
 =?utf-8?B?NkFOczRQSUJ6VjVJMEFxeGxGQnpVeWxPZUJyZUM2enFPV2VUUXlFc3JiNVJQ?=
 =?utf-8?B?Mis5QlhySVJ6Q0g2ZUdRTHFvRjJreW51NDUvOW9nbHhkeEVoektSbVB6RzZC?=
 =?utf-8?B?OVEwR2NPc0hFUEVhSUtPbWQvQkkyTHpTOUZXZzJIWEJIbGlPcFFBSzd6NXdM?=
 =?utf-8?B?bUd0ZWVyZHByN1R2a3hFVGZpRW1GZUQ1Z1VqYjZSWGtnR0xLL2hlV0JqV1BQ?=
 =?utf-8?B?UG9RbUp4MHh6YmZPYVRocnBFUGNsNFJpdHA3UGdTeHV1RER2eFVIVWdaTEtv?=
 =?utf-8?B?ZERwNDJSejZ1RzJOUElWNXczSzJ4Q01wbmFoYm95S3FocnNDNjhGZWdPLzlE?=
 =?utf-8?B?RHZiWThaZFRnaDJ6VGVPaCs0SmJqVHB1OSs5ZUFxRGpacHNibkoxM1lyTmhZ?=
 =?utf-8?B?azdsclBlRDluYVFRQ0t0V0VMb1NLU1ludExqa2tUb3BCOFFySmpXenZBOER4?=
 =?utf-8?B?SkNjdmZzY2JkZFZ1RDB5ZTd4SkxkSENMVUtVNFF6VUpxU3Q2blZHR3oxMWNo?=
 =?utf-8?B?TDE1aVV2SFNtK0lhUWo4K1VjUC8zb1orRzFmbVN1OTZZZnBSNUpsWXRUQkx4?=
 =?utf-8?B?REZmNkZUbUd4VzRETStveWVxeTRtd1paN3U3MWNtTmhpVU1aZGhZZklyQ1Y4?=
 =?utf-8?B?VkhzdVBrTTF1WElKd0doVmo3ZEVJSWhEMnByQnNoSURVMkQ2aHV5RmgvdkdR?=
 =?utf-8?B?bFVlQzdDTWlOaUdlcGRvOXRqYW00R004YTRmblFlaDBKZk9FZXFKSGpIWGZS?=
 =?utf-8?B?NXl0MHE3cHZ2NHUrL2FEMzdKeWVqR09ZSjU4UXo0Mmh1WGpqWFZMcFVmNWNF?=
 =?utf-8?B?Y1lsaDh2UnJ0UXZzekxSbEFVaFB2QUY3ZEY1a0p4ZmpldVRpNFdZUU5YL3lX?=
 =?utf-8?B?dzlMWDQ5THpMOVZwbS9yQTNXRGt6c0M4aitmQTE2SDN3R2dOR0pyODMyLzd4?=
 =?utf-8?B?Y1BGTTk3TW0xVjhiNVhiS2N4bmZDR3pWbUlJZlFYSi9hZG1nS1IvWFZBZng0?=
 =?utf-8?B?b1JFcHoxTEZJZkJxTVV5WitRK0RhVFlFWVM1aXgrTWdTcWUrMzJSQ3JvWWNM?=
 =?utf-8?B?ajBUdnQrcHRkeThEcXdwamE5aDkzUHdkQlNhVWYyZ0Vub3FBWDNpMmluN3NX?=
 =?utf-8?B?R0tVek8zMVh5bXNEQWoxMmJPb0cvY2Y0Y2h6eGE1WmswZzZsSFJSaFY5RWNG?=
 =?utf-8?B?QnAxTTE1Z2lZejdRK3R2TTVHVDU3QjdJeXAyb29oLytDdlAvWDJlRWRBV2ZO?=
 =?utf-8?B?bFJyR0lNaDNHdmJnMHJMY3dKdGhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <936D1C8243B1124E9AD37FD77DEE6455@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da19933-1718-43b9-710f-08d9fb93f8e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 14:58:40.3158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sD8ST2X8DW6hjGzip51hN5w/76LGD8TQqs3ODwfkNVlzgx2MZLZd1IMxsdNr2QiTkPaown86e2RMZ2LY0deXeo74c904j+aWXL7eFhxRx8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6875
X-OriginatorOrg: citrix.com

T24gMjUvMDIvMjAyMiAwODoyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjAyLjIwMjIg
MTI6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvcGNpX2FtZF9pb21tdS5jDQo+PiBAQCAtNjI4LDcgKzYyOCw3IEBAIHN0YXRpYyB2b2lk
IGNmX2NoZWNrIGFtZF9kdW1wX3BhZ2VfdGFibGVzKHN0cnVjdCBkb21haW4gKmQpDQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaGQtPmFyY2guYW1kLnBhZ2luZ19tb2RlLCAwLCAw
KTsNCj4+ICB9DQo+PiAgDQo+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgX19pbml0
Y29uc3RyZWwgX2lvbW11X29wcyA9IHsNCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29w
cyBfX2luaXRjb25zdF9jZl9jbG9iYmVyIF9pb21tdV9vcHMgPSB7DQo+IEZvbGxvd2luZyBteSBp
bml0Y2FsbCByZWxhdGVkIHJlbWFyayBvbiB4ODYnZXMgdGltZS5jIEknbSBhZnJhaWQgSSBkb24n
dA0KPiBzZWUgaG93IHRoaXMgYW5kIC4uLg0KPg0KPj4gQEAgLTI3OTQsNyArMjc5Myw3IEBAIHN0
YXRpYyBpbnQgX19pbml0IGNmX2NoZWNrIGludGVsX2lvbW11X3F1YXJhbnRpbmVfaW5pdChzdHJ1
Y3QgZG9tYWluICpkKQ0KPj4gICAgICByZXR1cm4gcmM7DQo+PiAgfQ0KPj4gIA0KPj4gLXN0YXRp
YyBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGRhdGEgdnRkX29wcyA9IHsNCj4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGlvbW11X29wcyBfX2luaXRjb25zdF9jZl9jbG9iYmVyIHZ0ZF9vcHMgPSB7DQo+
IC4uLiB0aGlzIGFjdHVhbGx5IHdvcmtzLiBCdXQgSSBndWVzcyBJIG11c3QgYmUgb3Zlcmxvb2tp
bmcgc29tZXRoaW5nLCBhcw0KPiBJJ20gc3VyZSB0aGF0IHlvdSBkaWQgdGVzdCB0aGUgY2hhbmdl
Lg0KPg0KPiBCb3RoIG9wcyBzdHJ1Y3R1cmVzIHJlZmVyZW5jZSBhIGZ1bmN0aW9uLCB0aHJvdWdo
IC5hZGp1c3RfaXJxX2FmZmluaXRpZXMsDQo+IHdoaWNoIGlzbid0IF9faW5pdCBidXQgd2hpY2gg
aXMgdXNlZCAoYmVzaWRlcyBoZXJlKSBmb3IgYW4gaW5pdGNhbGwuIFdpdGgNCj4gdGhlIEVOREJS
IHJlbW92ZWQgYnkgdGhlIHRpbWUgaW5pdGNhbGxzIGFyZSBydW4sIHRoZXNlIHNob3VsZCBjYXVz
ZSAjQ1AuDQoNClRoaXMgZG9lc24ndCBleHBsb2RlIGJlY2F1c2UgdGhlIGluZGlyZWN0IGNhbGxz
IGFyZSByZXNvbHZlZCB0byBkaXJlY3QNCmNhbGxzIGJlZm9yZSB0aGUgRU5EQlIncyBhcmUgY2xv
YmJlcmVkIHRvIE5PUDQuDQoNCkJ1dCBJIHJlYWxseSBkbyBuZWVkIHRvIHdyaXRlIGEgcHJvcGVy
IHNwaGlueCBkb2MgZXhwbGFpbmluZyBob3cgdGhpcw0Kd29ya3MgYW5kIHRoZSBzYWZldHkgY29u
c2lkZXJhdGlvbnMuDQoNCn5BbmRyZXcNCg==

