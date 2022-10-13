Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA55FD5F2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 10:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421727.667308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oitHh-0001Tp-9K; Thu, 13 Oct 2022 08:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421727.667308; Thu, 13 Oct 2022 08:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oitHh-0001Ry-6T; Thu, 13 Oct 2022 08:09:41 +0000
Received: by outflank-mailman (input) for mailman id 421727;
 Thu, 13 Oct 2022 08:09:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3Eg=2O=citrix.com=prvs=2782ac179=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oitHf-0001Rq-Ns
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 08:09:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eff627d-4ace-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 10:09:35 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 04:09:32 -0400
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BLAPR03MB5474.namprd03.prod.outlook.com (2603:10b6:208:285::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 08:09:30 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::fef5:dc53:67d3:3498]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::fef5:dc53:67d3:3498%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 08:09:30 +0000
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
X-Inumbo-ID: 5eff627d-4ace-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665648575;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=8Lodtgi2+evD3WbDutl8AkkNdWOS/Z/26nDlSKdciN4=;
  b=gb8msSM6sQaCdozTYkNRrU4zCdI1EP16KBEGc5DOE9lku9h9+l7+JQEO
   VYLh1B4mVdOTGwG0y/NMTmx5UyunIHnfTcEDpe9TVP/idxUwOGNcOWQSr
   /2yy8KPr1/JdGnmBL6n+zFvOQPG3eO1S5GDUf+ujUDRQY4vMYaD8/Ep81
   Q=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 82641324
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Az42X+6CimYCSMBVWkefolCu1gh7EJpYLuyv04?=
 =?us-ascii?q?LjilXXVbZgPvEW2GDUMXjFqUIKe1WXHDttQOy/UMBlt8FzYagv8p5BLFtttQ?=
 =?us-ascii?q?SI+XzvexR355Il+lbzZkNAns2zVKXgEFEBi+gHxvlL2oxoe37FNuc7nW8h/4?=
 =?us-ascii?q?9hb+8tlzoQTc59gBha5l5fG5SehLr0aIfWB+0u35NDp7VMd/a3s3G+vI6FCJ?=
 =?us-ascii?q?+g1IqGYxtVmg9MREeieu/14rT2+A2EHKRxFvepusQjH9NaGu+0Lc2y+PZPji?=
 =?us-ascii?q?6g73XM6zLh9vrf10dffRozvjDkCZQEMwtZbAwWN0mjfIv75x9iAveTgewybT?=
 =?us-ascii?q?zZ9axOdsUVjNCJve+4Q5EYCi6qaVeIA62icYkWXxbZEHHBk+XObcKjYosopR?=
 =?us-ascii?q?Ze5Untf76F1Am9Uw97OE9mRheu2uCc0fIR5JyGUfQOmn/txmmoslnRfVEu4c?=
 =?us-ascii?q?FEVT5IGW3mFmuY36IlFDe3YSdxPtgzbXA3gmU4a4U7CHWKCDlvHgUGQ30Fbu?=
 =?us-ascii?q?CjFxlC54xJfRhBghLnAZaeQ2qQeY7YIllMFpTBJIFcfOgIzZSy5t2VKTGZnu?=
 =?us-ascii?q?8SsEsZAcKTgPrlzieNMaW6l1bhHXhTnDWGo3C/mVhRfIP8PTtJjZGPmR736m?=
 =?us-ascii?q?BkSSrliXKaNUJo/hGgE5LvXcGN47TBYQGxOAY0jtRtXkHSFNoEj8Sf4PpwOV?=
 =?us-ascii?q?MSHVsosSfgN9jUa60DoqeOYewSizEmc7qoZu3cZuhhjGvxy48N2OrUkspFou?=
 =?us-ascii?q?W982YJzyhqReR3+Zl7CyuMEBffnow34mFKPqF1LQXAgygS0cwmYiqdTeC31G?=
 =?us-ascii?q?UhpjurJuOOacI3Dl8BnIl24PrOAAfb7joN/AqH72sztQ8qd8aUt/ADIex22p?=
 =?us-ascii?q?dAfR2dA4N3BE07PhCw/Fvqaw//LEuV4Ip0bzrz/v9lKLNXfSSzJLOc1Mlggx?=
 =?us-ascii?q?Ehzuu44T6psy9LoETIXVICnAVHY+IEFs816mNpADEKW5/3Lqzrn8sCcZnyJV?=
 =?us-ascii?q?wqxrC3mw7rj8mCPHizYQ3Irx91SBoakfOsqWkzs0cQaS2SbrMA8nT/4+ofnc?=
 =?us-ascii?q?5/idlSqRA4K0MZqowIsglYBIUnNCidVwv+QwF3az4YsSF4f17iKIFszvwPsu?=
 =?us-ascii?q?BsXNdqAZE2viqhCNb8edSiGh4AC+957kRUDU/QmSNl85EIRLFoebFDg+b5n0?=
 =?us-ascii?q?eFa8DypCPjqvsV6IXIIgqOdox+9o2dBPZKsPMY5jnZXlYRAIjH2Yv7zYJjct?=
 =?us-ascii?q?WzapuCvw4Q05t8Xn4ohPRBV3ISj4VZwn0A13NybKGeqpQHqFQcl1juxBifgY?=
 =?us-ascii?q?iUE+F9Q+0zIVnwLCNOYf91yDRNAyyMKRrpDtBSly6ydbLrSgqX1tULcJ0tLL?=
 =?us-ascii?q?CqLPvHGw/yW+f175LHfX3tN1VVX+PL+tCi9t48ZZ3nccKX7CWgvbTan6PAz6?=
 =?us-ascii?q?EC/2S6A1OXZ21JyAtFDrN5ftCt3oj6xrwGDs971MclVjhZaM/c3p23gNVTDS?=
 =?us-ascii?q?8Q6JFRT60G/5wlxgvRq6Dl5XHPbiPvoEnM/LZmL66MJ6apOJF4EQJzgEENuB?=
 =?us-ascii?q?ilxrzI2ptlO/KiWBSj6tdIg2VSp6X7+4MSakJXQiCDtesrJ0FzAo0wjRP+ht?=
 =?us-ascii?q?aoX0a+iJ9V1tQ5RxYJQ9PZT64p9BtSIhEyYQpcHNcG1Aa4GAGSNRofGXGwTK?=
 =?us-ascii?q?p1fkNr6XYKMPzHNlcPXzqJBx0ZuTMmz88oLpIYR2VB727yMcFWZoWrPQN4ao?=
 =?us-ascii?q?byBVxm+CWowwuMuwKk+cyjNajOMYLwPqqaP4gS+AkvdI/j1z586VYX6yHUYd?=
 =?us-ascii?q?JhrW9/IokTVNUVeZNvtzLpCym1RfpYRPVvK/9kVVAYBgG32guVuKwyRtGaRZ?=
 =?us-ascii?q?aGCCLd+2JSw6T8YGUR91FEb+XR9IaIXkrm53EobaGYGq+mjrfLtIk1G60Iyy?=
 =?us-ascii?q?KETZKxWANX/qF2jDG1bdOpA3OA+uMkcgb3MU3Ya1b4TKY3NZahRHODvf3maY?=
 =?us-ascii?q?l4RTQY/XwuS4S+RJikPd+lDFr9rl/Pp7SCuph0lufdSgZwwBLnHU+yjTChrO?=
 =?us-ascii?q?tSQ+POto1Sx+Ni0atcCp1eMNGr/+vddJSiVsYoxbmSkJBjxbIp4m16KHgHET?=
 =?us-ascii?q?qIrxoKUq4JmmDT4lZVikgMwPSzP6GllBSk7j0fflCtYxSSKIN95VOjf9mfX3?=
 =?us-ascii?q?GvK6xHI+RZ+L3KC3m220nsG2ENunjTCMZKkTJWOhL1wU6rmWrvSQZKxmyucs?=
 =?us-ascii?q?PPHsZ8YdaFrbWBGRh9E9ukQoGIiB3lhl5Swyre4skm0ww07E6Oncn9HkNZr/?=
 =?us-ascii?q?AnBLdK2YqJ8RjgtNGejkwhMOsQUkN33dWD+jhf8RQwqlDO7q5LNlG28pv7sw?=
 =?us-ascii?q?CUdqq5nn+vn8tnpeaRwdOI4QLp11GmHOZ0fhPm98kbe8mTiczm2OnIRaee17?=
 =?us-ascii?q?HF2Upci7yLn9qSZViMYmLYe?=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208,217";a="82641324"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMQY47y+lgVM1Xny3YVJqYV3saUbKTKoXT/E+2ptMGQx2GS7brhR8S2yLdn6B81XVQ42CgxkIY3xswdT8ph27P2TyJRqXeord4BGaqJ4KH1CUQrS8DRMSHPXY5R2y3gMBMSuB4f7/1g1hJdFlJM2WRy4giQJjk+G33GM7USRKeSDbn+QWfGT6ULJuy3Zk1BOMD4J4d5mcjHoWk8G5BMk0zgBLzJNt2f7DY3zAfp+j3vJW90C0QnjAd38JhrgdXBNnIWDzgOkN/vRCPsJmGwqFqzu+yMmtcLKCd06mysXWyydiWlVzIhKzsjfkArvrqa9Vh8ZWO+hJS22pFVRrezhig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Lodtgi2+evD3WbDutl8AkkNdWOS/Z/26nDlSKdciN4=;
 b=kqHYzUeJ5BXZ18U1Lz0K3qZdB3B0rCjCloFuyuuycW36jzBqAxKxjk85IpGk/xgOLVL98+6T8ZgAVJUnGoJISgPekQt1i/JMfi42lUWQRwyZDd1SohjAUwHX7rCUNW+y3pWKZtIJEZuHVwdEZSQn1GKUIjQ4fKDpdsbOVP+8mJ1g0el4toiEWpLHaA1g/NQvsG6lDQm8oUwQsbtWwiQC09kx+k4qwyxZJx12a0uQjhE4BTzuyzWZl1vNnGzCZq26xE8aPkdEHpuO7WaB1P8E7r4Xl6ndyyWP4wOP1n9uEqUW9UchJ7oD7vXsU5T/zJeKMMpp7GBazqio+/Gemajerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Lodtgi2+evD3WbDutl8AkkNdWOS/Z/26nDlSKdciN4=;
 b=hnJjaf3oaLPU4sH7xfSfTLbMFNwvD0/0ILqqtDNsurz3zphr3XA98bi6BK2qaz5rMb3K74UDimH/Qa0jJzplnpulFiJLRga5atEw1Oo3BKE0uJxfv7w/utx+BDObBxeVsKqnqx3xHVWxNhACaQQpj6fS/Y69DCpRLzaNG8qeXPc=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17 0/2] Ocaml stub fixes
Thread-Topic: [PATCH for-4.17 0/2] Ocaml stub fixes
Thread-Index: AQHY3mgg1a/e5606O0qRvG/7p/Seyq4L+WuA
Date: Thu, 13 Oct 2022 08:09:30 +0000
Message-ID: <C88038C4-CF04-4122-BA4F-C8E515B7735C@citrix.com>
References: <20221012182552.26866-1-andrew.cooper3@citrix.com>
In-Reply-To: <20221012182552.26866-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BLAPR03MB5474:EE_
x-ms-office365-filtering-correlation-id: e5811de3-cfdf-4c22-47fb-08daacf24123
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 G1HDxxa+n7mq90K9baQ8FM9uNw5wETHArImgkvpDGn0QPGeh/GadmAfnhY0XBXqBpBsKHmeXmDUQ3b/DxSKCWYG93q0kvlnRJ8Ewy1Fe3J8cDIlGDapJ0qD0Jvof2vsOct57GodJSr9JNYGUmUc1W7lkFwS718B30ZQrgW0DKhC7FwJR2EQNt2UZ57f2TOhOc3/QP/ZgsFNkveLZbsVbXSQh16j5raxYI/R3NdOp5G5kgw+LvbnUEKS+wpl3RjrbYcmMOWTygrUvWNX9Iftyk63yN7GKoW0HELd5GH4qbjEA+lEXEYE7DuYrj7zQ3NTNYra1JDHN0y8FkxeKNrkMA7bJ2HgBYk6+HaI436b0OFSryQjH/ocEbVxj+iUSkkUgUW1omFkd3gz1CdN9bbE3M/MR7B1Y/JovNBES6b5yfXKxN70pFzfM+nJWQ9MJGIL/1nky9TCNBzZyFxUKenxseUgwyQEXfmlQNOHJ8UDt7R+4/qpsE9oVfLQ91wtZZ/p+whCLbwJ0bLnMdCMFykR5jLjS8S7iJJ1sX9F1Vpa3d2gON7D2zJT5pR0SaJHLAO9DDvPRoeB3DJY5oV4NqX+HGRZWj1qfuH0xFGaSjxt2xCZHx7KPtmDG6z/QXW+9eE5FKrueQ8DNnteeIQ2q4TwfuQ/ib5yWuXc7JPg7FMWwj7eG+6IIBKVM9tiAFXduikxdI7gUOQmGTQbcVYdMb9n5Bmaua1HRmIVUekzgzm5EIrGKFy4hhDmrmtkdpURj38TgqHyu7j6pRzMFSskI14zDtNO5goNMrUIWksXNCXa67lQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199015)(4326008)(38070700005)(6486002)(71200400001)(37006003)(54906003)(82960400001)(478600001)(38100700002)(316002)(6636002)(186003)(66446008)(91956017)(66476007)(66946007)(66556008)(76116006)(64756008)(8676002)(122000001)(53546011)(4744005)(5660300002)(44832011)(33656002)(26005)(83380400001)(6506007)(36756003)(41300700001)(6862004)(8936002)(2616005)(2906002)(6512007)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmVHN3RLKzFWWTlabWNaY3lYWWdYYllJMnFBeGJ4aGMvSEM1WUNibmNNVkpW?=
 =?utf-8?B?NzNnSDM2aUpDK2EyMkdZd0craVBDTGdjYjRWbFZ2VkNCbm1zMURab3hSSnlr?=
 =?utf-8?B?bnY1NSsyL1loMFVJREtkd2FNRU84QjZYOXFZajdYaXVxZnVzd0k5L29qVU9l?=
 =?utf-8?B?MTlqQ01KRXpyRFRWM2trSzVSdC9OWXRLNXU4V1VqREtMQ3dNd1paT2gzRGFy?=
 =?utf-8?B?NnZjU1pHMklpTTdRbzAwZjV4dXV4ZWsvV1E0UWNhQ2pROEZhV0RJQ3JtVmJY?=
 =?utf-8?B?eGtTamtRWWpHdy82VlBIWk51aXcwb1hHeGYrblkwMHdBZ0o5WWIyZnpKcFE1?=
 =?utf-8?B?a1dIbVpRWGs1Z1VMNkhVUXNMbkhNU1grejhrUTRSWnZQWXh6TjU1Ym9TTnNy?=
 =?utf-8?B?MC9rL25yV3JFWFBGK2gwdmlDTy9OU1VMaStFeUpocmxLeHJUQlg4clBKRSt6?=
 =?utf-8?B?V0xibEY4RHN2djRPYVpUVFUzL1RJcWRqNks5OVdzbHgyb0ZqaGhWUVp0QWY1?=
 =?utf-8?B?Zm5QaWFaNFBLR1BNSllDZ2E0SGs3a3I2b21qM1NvZ0Y2VFRpbCttNkQrMnlV?=
 =?utf-8?B?cDdmamtlYklxd2U3dFdLckZPNE1BQWJBNGNSeGs2WmhCdm5OMFhWelhtL0dO?=
 =?utf-8?B?TWxiTU80TzFGVmdGS2V4cEQ4VlpVeHJZMURNMkkxeFl5WWdDblpXZmluQXhx?=
 =?utf-8?B?bjVveXRlaW5naVJKY2FmNDIwYXI0S1F4Sm56SFovTEJLVjVRR0xaR2NBOGtr?=
 =?utf-8?B?TzVVc1hJZ21QQ0Ywc3E4OE91Y3JsYXhhb1ZzeXVVSzEzc1IwVjByZ25DUmJT?=
 =?utf-8?B?SVEwSjFIVHoyeXI5dUo0K0JIdWR2UUg2KzN0amRSZS9Gb25vR2p6Q1lSL3Ba?=
 =?utf-8?B?aWZDV1Z5N0dxU242eDlLbEp3V0pnUzF2OUc4SnlSejRLQ0pQVTh4MWxzWkFV?=
 =?utf-8?B?SFpuUUNoRHFiQnRsdkRDbzE4c29ld2RQY3lsVnFGa2kzNm5Kd0JtL0JzbEty?=
 =?utf-8?B?MGtCaUpnWjBMVnRnQUlDb0VkNk1pVVcxck5mV0UzUXdMSS9Fb1FmL1JBbWpw?=
 =?utf-8?B?Y2RKelZ4dVREUC9sRFR0VjhxVDdrczVqUWV6aEtlY2ZLMjgxbjdFN1paMnpH?=
 =?utf-8?B?cDRvU05DVkV6M01mdjJKbkdrcmFUVVc4YlpDSGVKbmhzNXpTK0ROZ21jZjQ4?=
 =?utf-8?B?d1VZKzB1TndSa3hpbUJKeG1rRzZCR091eGE0QzQ5OGRiUnV6d21NaDlmVFdJ?=
 =?utf-8?B?NWsyVklzMXBpUlFNL01rSWdPYVl0UDRMWTQ0N2FQQ01PNVIyR0VkSm5BZ2pw?=
 =?utf-8?B?UkFzZ0h1RHNkTGduQ0x0V1pBMWNZTzZHQ2pkUnl2R1hxQWdoakFnR05ZNHNU?=
 =?utf-8?B?eStlWU1QY2RHMkMrcDByUlFFWmxhK25mMFR3Ny9aTkp5SmdGbWhOTmNWUlQz?=
 =?utf-8?B?K2dTdzVjNTBBRHJkSHNxaGNkNFc1dUxqaW5xdndhRWlUVXdpRHpMYitYWmxC?=
 =?utf-8?B?NXNSZ2plMjRVUTBWK0tmZkx6RWdzYnc1cjgwVzdpOEU4c0JSZmZvVWJaRXNy?=
 =?utf-8?B?dm9meHk4blhzaFIxT2l5TDBXWG1ScnVKOEw3RmxMbmhiVG9DTnJDTmsyemNn?=
 =?utf-8?B?ekZxcHNWcDlFTDRxK1M5M0VSVTJVQnRBdGZsdWN2SWZsT0RSMHdsQTVuUGZU?=
 =?utf-8?B?TGF2Qk9QWm03aUtaMUZiYWtSSUNVWTVJLzRHSjgxWmZhVWJVeWhidno3SGlj?=
 =?utf-8?B?aGx6aitFRXhldHRrYTJHdFdRTVl5RzNhY2RaZU1PRFpPcXFETCtYVjRoNHpG?=
 =?utf-8?B?K3oxSUtOZXlaMzd0K3d4aHJ2ZXlUM0hvTnhCZWZqYTV4NzAzdndCRXJpRWsx?=
 =?utf-8?B?Si9xanQ4MlU3U0lPS0xKekJoRUFjZ2ZLN1FId0dhTzZiNHUvNk55NjhmcENk?=
 =?utf-8?B?WmpYU2oycTU2ZEgxUkZkMmU3c0dua21wR2dDN1FSYVVydCtkRFJkVjFrVlRn?=
 =?utf-8?B?MWNBcGtScTBNY2VsV1V5MWllOGVKM2xOcGtvL0x2eHhRcEgvWEJzK0ZjVVZV?=
 =?utf-8?B?K29iTnVNSzMrUWNkdjROcXRrNUY3djdpUHM0TGlobFBsVnVJaG1UOE1PUjJS?=
 =?utf-8?B?VjRWakxhYUVQNmdHcmRUZXhHaGxnZmtRVy9lTENHVWFTSjJrcnl5R0NyNXNO?=
 =?utf-8?Q?pBmn2Tjvs4kMi5MTMTOOfyk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_C88038C4CF044122BA4FC8E515B7735Ccitrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5811de3-cfdf-4c22-47fb-08daacf24123
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 08:09:30.0615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CN28ziKc3bgeFC15sFwFaK4tbF+tCJMRk9SNNUPkdMmIuxcJp6JgbAEUS22S9cj2OhvIEa/f1Hn7N73pkw5xzr/sEe1JZHU2lGzzTNunzWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5474

--_000_C88038C4CF044122BA4FC8E515B7735Ccitrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBpcyBhIGdvb2QgdXNlIG9mIHRoZSBPQ2FtbCB0eXBlIHN5c3RlbSB0byBlbnN1cmUgb25s
eSBjb21wYXRpYmxlIGZsYWdzIGFyZSBzaGFyZWQgaW4gYSBsaXN0IGFuZCBub3QgbWl4ZWQgYmV0
d2VlbiBhcmNoaXRlY3R1cmVzLiBUaGUgbWFjcm8gY2hhbmdlcyBhcmUgZ29vZCBob3VzZWtlZXBp
bmcuDQoNCuKAlCBDDQoNCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGlu
ZGlnQGNpdHJpeC5jb208bWFpbHRvOmNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4+DQoNCg0K
T24gMTIgT2N0IDIwMjIsIGF0IDE5OjI1LCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPG1haWx0bzpBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPj4gd3JvdGU6DQoNClBh
dGNoIDEgaXMgcHVyZWx5IHNvbWUgYSB0d2VhayB0byBpbXByb3ZlIGxlZ2liaWxpdHkuICBJdCdz
IG5vdCBuZWNlc3NhcnkgZm9yDQo0LjE3IGJ1dCBpdCdzIGFsc28gMCByaXNrIHRvIHRha2UgYXMg
d2VsbC4NCg0KUGF0Y2ggMiBpcyBhIGNoYW5nZSB0byBhbiBBQkkgd2hpY2ggd2FzIG5ld2x5IGlu
dHJvZHVjZWQgaW4gNC4xNy4gIEl0IGlzDQpzdWJvcHRpbWFsIGZvciB0d28gcmVhc29ucyBhbmQg
c3BlY2lmaWNhbGx5IGRvZXMgd2FudCBjaGFuZ2luZyBiZWZvcmUgNC4xNw0Kc2hpcHMuICBTZWUg
cGF0Y2ggZm9yIGRldGFpbHMuDQoNCkFuZHJldyBDb29wZXIgKDIpOg0KIHRvb2xzL29jYW1sL3hj
OiBGaXggY29kZSBsZWdpYmlsaXR5IGluIHN0dWJfeGNfZG9tYWluX2NyZWF0ZSgpDQogdG9vbHMv
b2NhbWwveGM6IEFkZHJlc3MgQUJJIGlzc3VlcyB3aXRoIHBoeXNpbmZvIGFyY2ggZmxhZ3MNCg0K
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICAgICAgfCAxMCArKysrKystLS0tDQp0b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAgICB8IDExICsrKysrKystLS0tDQp0b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDI4ICsrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0NCjMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0p
DQoNCi0tDQoyLjExLjANCg0KDQo=

--_000_C88038C4CF044122BA4FC8E515B7735Ccitrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <FA20C552991C7246A56013B9B5606770@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250
LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiAxMXB4OyBsaW5lLWhlaWdodDogbm9ybWFsOyBm
b250LWZhbWlseTogTWVubG87IiBjbGFzcz0iIj4NCjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQt
bGlnYXR1cmVzOiBuby1jb21tb24tbGlnYXR1cmVzIiBjbGFzcz0iIj5UaGlzIGlzIGEgZ29vZCB1
c2Ugb2YgdGhlIE9DYW1sIHR5cGUgc3lzdGVtIHRvIGVuc3VyZSBvbmx5IGNvbXBhdGlibGUgZmxh
Z3MgYXJlIHNoYXJlZCBpbiBhIGxpc3QgYW5kIG5vdCBtaXhlZCBiZXR3ZWVuIGFyY2hpdGVjdHVy
ZXMuIFRoZSBtYWNybyBjaGFuZ2VzIGFyZSBnb29kIGhvdXNla2VlcGluZy48L3NwYW4+PC9kaXY+
DQo8ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6
ZTogMTFweDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6IE1lbmxvOyIgY2xhc3M9
IiI+DQo8c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm8tY29tbW9uLWxpZ2F0
dXJlcyIgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0i
bWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDExcHg7IGxpbmUt
aGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiBNZW5sbzsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5
bGU9ImZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vLWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIi
PuKAlCBDPC9zcGFuPjwvZGl2Pg0KPGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtc3RyZXRj
aDogbm9ybWFsOyBmb250LXNpemU6IDExcHg7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFt
aWx5OiBNZW5sbzsiIGNsYXNzPSIiPg0KPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1saWdhdHVy
ZXM6IG5vLWNvbW1vbi1saWdhdHVyZXMiIGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvc3Bhbj48
L2Rpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9u
dC1zaXplOiAxMXB4OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogTWVubG87IiBj
bGFzcz0iIj4NCjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21tb24t
bGlnYXR1cmVzIiBjbGFzcz0iIj5BY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbSIgY2xhc3M9IiI+Y2hyaXN0aWFu
LmxpbmRpZ0BjaXRyaXguY29tPC9hPiZndDs8L3NwYW4+PC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxz
cGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1jb21tb24tbGlnYXR1cmVzIiBj
bGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L3NwYW4+PC9kaXY+DQo8ZGl2PjxiciBjbGFzcz0iIj4N
CjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNsYXNzPSIiPg0KPGRpdiBjbGFzcz0iIj5PbiAxMiBP
Y3QgMjAyMiwgYXQgMTk6MjUsIEFuZHJldyBDb29wZXIgJmx0OzxhIGhyZWY9Im1haWx0bzpBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tIiBjbGFzcz0iIj5BbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PC9hPiZndDsgd3JvdGU6PC9kaXY+DQo8YnIgY2xhc3M9IkFwcGxlLWludGVyY2hhbmdlLW5ld2xp
bmUiPg0KPGRpdiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+UGF0Y2ggMSBpcyBwdXJlbHkgc29t
ZSBhIHR3ZWFrIHRvIGltcHJvdmUgbGVnaWJpbGl0eS4gJm5ic3A7SXQncyBub3QgbmVjZXNzYXJ5
IGZvcjxiciBjbGFzcz0iIj4NCjQuMTcgYnV0IGl0J3MgYWxzbyAwIHJpc2sgdG8gdGFrZSBhcyB3
ZWxsLjxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NClBhdGNoIDIgaXMgYSBjaGFuZ2UgdG8g
YW4gQUJJIHdoaWNoIHdhcyBuZXdseSBpbnRyb2R1Y2VkIGluIDQuMTcuICZuYnNwO0l0IGlzPGJy
IGNsYXNzPSIiPg0Kc3Vib3B0aW1hbCBmb3IgdHdvIHJlYXNvbnMgYW5kIHNwZWNpZmljYWxseSBk
b2VzIHdhbnQgY2hhbmdpbmcgYmVmb3JlIDQuMTc8YnIgY2xhc3M9IiI+DQpzaGlwcy4gJm5ic3A7
U2VlIHBhdGNoIGZvciBkZXRhaWxzLjxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCkFuZHJl
dyBDb29wZXIgKDIpOjxiciBjbGFzcz0iIj4NCiZuYnNwO3Rvb2xzL29jYW1sL3hjOiBGaXggY29k
ZSBsZWdpYmlsaXR5IGluIHN0dWJfeGNfZG9tYWluX2NyZWF0ZSgpPGJyIGNsYXNzPSIiPg0KJm5i
c3A7dG9vbHMvb2NhbWwveGM6IEFkZHJlc3MgQUJJIGlzc3VlcyB3aXRoIHBoeXNpbmZvIGFyY2gg
ZmxhZ3M8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQp0b29scy9vY2FtbC9saWJzL3hjL3hl
bmN0cmwubWwgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7fCAxMCArKysrKystLS0tPGJy
IGNsYXNzPSIiPg0KdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSAmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDt8IDExICsrKysrKystLS0tPGJyIGNsYXNzPSIiPg0KdG9vbHMvb2NhbWwvbGli
cy94Yy94ZW5jdHJsX3N0dWJzLmMgfCAyOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tPGJy
IGNsYXNzPSIiPg0KMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlv
bnMoLSk8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQotLSA8YnIgY2xhc3M9IiI+DQoyLjEx
LjA8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1
b3RlPg0KPC9kaXY+DQo8YnIgY2xhc3M9IiI+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_C88038C4CF044122BA4FC8E515B7735Ccitrixcom_--

