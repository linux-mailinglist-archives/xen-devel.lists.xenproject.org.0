Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7C36AACDA
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 23:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505501.779552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwZ-0001Be-Vq; Sat, 04 Mar 2023 22:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505501.779552; Sat, 04 Mar 2023 22:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwZ-00013t-Pl; Sat, 04 Mar 2023 22:01:31 +0000
Received: by outflank-mailman (input) for mailman id 505501;
 Fri, 03 Mar 2023 00:54:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqmn=63=wdc.com=prvs=4197e97ac=wilfred.mallawa@srs-se1.protection.inumbo.net>)
 id 1pXtgV-0002ez-Mn
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 00:54:07 +0000
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e270ce86-b95d-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 01:54:03 +0100 (CET)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 08:53:57 +0800
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BYAPR04MB4934.namprd04.prod.outlook.com (2603:10b6:a03:4f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 00:53:55 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 00:53:55 +0000
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
X-Inumbo-ID: e270ce86-b95d-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677804843; x=1709340843;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4eNobiyhoFbqJlsE+MTxvbag/3B2CLFBsVLoCpKvhlg=;
  b=RSdyZ9dbpkfClhSL1XAtU/LKgli3s2EWVVD5y8gwmmuV4s7SFxIYqhby
   WK4lyFDVACCgEwR7DO76E7P0DC8rKy1mQ3sxFVMVYd4ofCOvfqFJzY7WM
   i2jy/CT1JFzrojdjU1a+WNJTV6s+7z9Sa5+/opsdFige+1yrzbf6Qn/kL
   VpZ+XVh1LB5MXhv1XZ07DmpUePn9SYLhJ5SwD+KnUR4HHt+4BAl7upObH
   M9m//7pJQUHRCz+/7dAFWJ20/qbdPOjrCfuW6o1dpTDyRXpMBlauFgW8c
   n5vD3WoqA4pmYVzPwwY8ZH9JSSmQOjRN41LyAr0Vj9xBl3IptzCVREdmD
   w==;
X-IronPort-AV: E=Sophos;i="5.98,229,1673884800"; 
   d="scan'208";a="224680800"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1palbOdluLYgYzjjZleIwpdCgUElHntRMUaFmubIqgFeQAG9emsXSYJzlhzHqe3tznFefDsVa9tR3awoS4XFAKbRPVALp6YvAnCsHy/IclRHl/k2Jiyubr/b9Pm6+BoaKjSaK5KCXEm7BNiCorRDn52+FDjTaJBuG+PV+Py5FrT5HYdOCOWBcDXT6yNvoGfJzQRVbjwxQOUKUnfRUsS2wV4HUQ2GfwP2RQoa1z1mwVF4BIq4CSI6KsI3GiBpOzsm0qTeLBn+jIaERL22pEoL+ynA49VxjD+ElNpkf+C+XkjIVqdIhEqXAA6SWrIMUPgcYrl2TtEZuonSN/KyDlVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eNobiyhoFbqJlsE+MTxvbag/3B2CLFBsVLoCpKvhlg=;
 b=cPPRql7HEE6Q8adTsiuqbY39U2ZCMw8enNneXxcAmS1GgZYseb1jUjiQ++7bypVDZHMXsOqYmcJ/P6EhzuX1tVaWn082QG8BJceI9xIfuuo03XJZb6sdk4FBy3+IYsLImr4hggRJRKDxUxvNeU2fhsQQaDuz3fn5+slcglg6M2JErm209VDb9kOoeHZT2k7rv2kkwtgJqZm/Cie2lDDG6q224GRtp7ZKsdKcN3xsvplTYBKdFPk01dM2wxljlbpweeYsMIum6wIwUwscQlEyX14tlCt5BDzzNjHopQViHLPvcA46zlhAAhQcP9vR05vBGZyY6dYzycYvHjVPZyZuXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eNobiyhoFbqJlsE+MTxvbag/3B2CLFBsVLoCpKvhlg=;
 b=ibC+tIHl6P6oKmQ32ubANqAcONzd9cI6pnUrAIeBlUCVx8Fc7+/GjEmo7QFvqb/nfNQ+piIYcMKY7MPf9ghRSMEPqwoqUuXI7kLOfkMJlPDbyZE1yYUS5eLO8lMrnODNd5sgQf4IARyl15VaqfFVnBjezJW2ZjVIbZvgvQP2IHg=
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "berrange@redhat.com" <berrange@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "armbru@redhat.com"
	<armbru@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"libvir-list@redhat.com" <libvir-list@redhat.com>, "reinoud@netbsd.org"
	<reinoud@netbsd.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>
Subject: Re: [PATCH v2 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Thread-Topic: [PATCH v2 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Thread-Index: AQHZTSSyQDAKEMOkqU+AobWcDZi/ka7oOvaA
Date: Fri, 3 Mar 2023 00:53:55 +0000
Message-ID: <0925cfd4b40401ffcc9988219b5945c02170bb13.camel@wdc.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <20230302163106.465559-4-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-4-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BYAPR04MB4934:EE_
x-ms-office365-filtering-correlation-id: 38445a7b-7164-46b8-a83e-08db1b81c3e7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZAdALU5OmDHOmTckS9ubzm1Fy7ZWiI7iYzDzOm5EkJo6JUwMOnKNL+GcPhEh4E/JYhbVCjK1fIOpi69s64X+RMiBmoK7jDnHNFadHPVKZwc6fb5ITHounjRitpY9+ch0JkeKJlv1EY/xWAykTOSoeyt818t9lO65JWmGHsGbhHelbeXLRcFVenb9dVlFR/Caxer2tQlA9fIH5U56pOvBFEJQvcY8MWkqeEB/63ARzmrdRqS7dw3hW1NWHLoix8APoxffmd2YojF1FCf7VCy8lchA2Tis50lSLQ0Ra63tqxhy25sZRb2guUAI5Rb2s2QFPJzSValx7pUogeFVnxNn9z0bkgQVZPc2rqM0xhhkXY59+f8+mbYPs0Y7tGYkq7YYcLepEH59m1wN6yP/wEIWvA3rhhO22aW0ktkLgCdwO3cE6TFgjAb4UmeYn0Se71gSx1cKWKOU/qW1wvvu+P1WjGMxYdOEcXNXQjDpYXURdG8UnVWfx2BI5ckjOJCMOdBmPDz/sFJqWrFdwuD5+fLidlDfGyEsSxLrIYCNYvKP7yBqsgCRecuNItw/rj+6Pc0UHJ9up0rAvFdckPnG3A5A8izm3Te/vz7M0BklxvT8da7A9rr2ajU1SOV/Yp97zjJpVFEhBF3mA8YSc8DM7O3OjXeBaDGRlCtTMzJuIXJ7X7jZFvkUKTWDsVjF3jsYy6ufpYm2UgVUKI0jnYGKSpka6A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0963.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199018)(4326008)(86362001)(8936002)(36756003)(66946007)(41300700001)(66476007)(64756008)(7416002)(8676002)(66556008)(66446008)(2906002)(5660300002)(44832011)(82960400001)(38070700005)(122000001)(38100700002)(71200400001)(91956017)(478600001)(54906003)(6486002)(316002)(2616005)(76116006)(6512007)(110136005)(83380400001)(26005)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTE4TzZ3NW1HUExEelQweFV3VnhhOXQwZEk1QmM4S3RoYm0xVm5NWWJ1WFpv?=
 =?utf-8?B?QjNaaHdTK0tPTkhkelFTcmN1WWplWDJ0SGVMZU40V3pQdHcxSlgreGd6RUdo?=
 =?utf-8?B?ektVT1NlbnY3VEp2WjRLN2JtWWJNRmlNODNLQW5YbXdKWUhMWGRxTm5SZEYw?=
 =?utf-8?B?eTQzWEt0dERZNWRnV3QzY3NMWlRzVnBWaVhWb3NjbWFmR1kwbmJyQy8vb1ho?=
 =?utf-8?B?eCtOY3ZaUHptSElZTE5aSjByMTJESFNKZWg3cTRHVEVlUm1jb05BTTFWZ05m?=
 =?utf-8?B?ckRuZzNabTVNUVY4SmxJcDRIR2UrMVRPRHVwNkk3WGV4UGdxZG80bTRPaW5M?=
 =?utf-8?B?T24zekUvdFhiZEpyeEkvVUhueVoyYkRWK0NaS0VhWXZJQ1F0bnkzQmtMZDlD?=
 =?utf-8?B?WnFOenZJSC9Ub0JHaVdqdzFGNTdDWVFaWmppWWhHRElydk14KzhiNElUZ1dI?=
 =?utf-8?B?Zk4xZ0ZQY2htOXd5a2V2dFptVkhZdHdGWlhOWkZxamdneGxjaFlYTVVPWXM1?=
 =?utf-8?B?RmhqYzJSai82VFJaWWdNSk52azNjOHN3R3RBeWg2RU9MYjJmYnpPc3kxanIz?=
 =?utf-8?B?MlQ4NmJaWFRzVi8xUzVFS1pxb2pXUlRtYVhXSnBtSXlkRGlIM3pWaFBoMVND?=
 =?utf-8?B?bnpTZy82M2JaZjZobzhkeWdlWEluT3hIZEU3ank4SmRNS2hPT0t0QnpiNFFJ?=
 =?utf-8?B?RGhuZnBHYURRTnBYcDJRWTFaWU81ajczOThaaDJ1N2twOVZTanFUcFVlMWo3?=
 =?utf-8?B?YW9rRTlJTFg5TTJhZHRwYkwrbElkMHVkRVNVdFVkeTFZR1Arb0JiQXE3UW5q?=
 =?utf-8?B?aUtmY0JwdkV4V3BVTEdEd2hnQkdOc0JCdWNGQWIySFk5Sjl3SlhLN3FMMlBp?=
 =?utf-8?B?eDJCZkJWNjJsdTdLTHlyKzdZOWg3eWI5NUpFTVorc0U3b0JxaFNockRRdVJH?=
 =?utf-8?B?RWdtU2FYWHMyR2tMUmIrV2NWOERYeEh6bzg0bjFLRkx3ZW5jeFBxdGd0SU41?=
 =?utf-8?B?bzRsVGlmdm1LT0puMlZIUnh0ZFlwN29FOG1ZR21iK2ZhbGdsRGk0RUJjT1pB?=
 =?utf-8?B?cW9xcTlJRFU1dUs5NnhSdndhYVRjbC80Vk8rNVN1bEUzdld2YTNXV3R1anpM?=
 =?utf-8?B?Ny81OEtXdEFQY3BONXo2cVgyRWxld1Q1L2dhU1NKMzNxb21TNllYYTdDT3lR?=
 =?utf-8?B?RzNqbkJnSTdXYldtdlZVWkJEc05BZlM2YVVvUzJjWGo0Vkl0ZTU1cUJ2Z240?=
 =?utf-8?B?QWlYbXdYNyt6S3pOeEtoNVdVclJ2WDZNemdFRWdSUldzK2xZY1hrWGxRTy9K?=
 =?utf-8?B?emxjY3V0Z2VPU2l1SEowbFgvSWNSRWlmRU9DblpubnBKR0N5OGFHTVlmbDJB?=
 =?utf-8?B?eUpLNXRjOWt4SURCeFAwbm1DNHp3SUloR0hnMVNOdmlVTG9pZEovQkhueWVZ?=
 =?utf-8?B?ZFd5eDAzS1BCWUpibDlCWGVSN3lIWTZmZnJjdzVISTlEWHE1MzFGMGx4amFI?=
 =?utf-8?B?RjFnckxyaEF6ZVEreDdsbGN3SjJFSnJMdjdyQUloamNacnJtdVlxcjBuMVBL?=
 =?utf-8?B?VGZESzNPV0Rhdm9QVGRwNzJINGNUVlJ3YldPcE1xWGxUdkxDYlBIaUhydnZ6?=
 =?utf-8?B?KzJOT0xidG81RGpONjFmS2cwdDdRK0ZSbkhmS0NpajBKc2V1cUdDV1ZQaVVO?=
 =?utf-8?B?dnZxMjFseEtwR3lDdHdnUGpqSHNIV2p5U2x4eGljWTlKSlcrK0krMjlhYmR4?=
 =?utf-8?B?UzduMzg4dXUrQnBGQ3VPaVZHVGNNaEN6T2FlSWpEOVNGb0cwQVRDMGhtVnkz?=
 =?utf-8?B?MEFsMk5NMzB5dmZ1VndrT2ZCd3RQR3lBdmZyODA5aTczelZVbWQxUWpiOUFB?=
 =?utf-8?B?MFdQb012c1BSU2hwRmk4L0ZTVzZOYi82ZEtweW9pd2VnMUNOQ0tLYkM1Q3RT?=
 =?utf-8?B?alZOMDJkd0EvNjQzUE14WEJiQnlRYTZYYXFqTGFBZGRoRU5waWxvRlY1b1dp?=
 =?utf-8?B?L0dzbDN2THl4cm9sNEhjcGsrVWN6cm4ydGhXaEZhTEdpeXpSVlVaZjk3Yndj?=
 =?utf-8?B?eWNkdFYwSVZEcE9uK2xybTFRS1lVYTROMXRFM1RKeEFJQk9Zc3B6cmdZb0Qv?=
 =?utf-8?B?OGVvL3psUkhtQlpxYnc3eEFVTzJTSXNXTWk1aWxRUE9FM1I5dmErazY0bnVr?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A458CD3A2FA3114FB0689F5B5B8382BB@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gtIckpHT3mkLoYgwtjrvsSwnUo0iwcApF1JlY4Cy9570MJF5p4Y2uEK7x8W/rXfCMaAGEQZhc9m7w1tv+yaidN8S4a/zWKx6wVeqA+ZfWW+GiNqBQROnA2SMPqyv4yCZzUKjVsM4XP7doXOTuqoD/Btpf4cWHSg5G+Z0S/l2AFMEMQI31qnG35xRnJ9Zyl+oLXsxNI9uirertjXRmQsXP9T1Pt/1T+Oyh7ubApkDMGSrh/t5PxGYKEj4cXT1U1n1eOEQP2ClNsQw//Luu1sLsGZZHa9FHW14UBkA2ZYKGN9EeRYAH++V/gfAnmDRkuvDh5Z2bxblPhoJSpRU6zHOFKqnduaZYh/AWyZEBmb1ReQNwAmGhWZKZ0tUtaAPEuLP4J1C9+rqMe68g4bCf9CJDDPpWUWDaTaXRtUFbxC9Z01z3ynZyBuIZ1BTaLGpB8rtXo5ZrIlNFUxGOrBcwnmq+zB+1hbfhj5Z7jvBNATff3CAhM+FVNaf7DJ0/K8G2d18JeYs6y1Nom3tCsEX7uNFb/76JlSPN7SpSJOTGhqYw9HcQGqs6mCv1P93TFS66GrU7N0VAysqYV9hsGPHBFs29jti5L3hSIxuBIugJrdgNAnpwxhgM7+hSUpIqMsJ4XLxGAwkCdjetkfFDOhFHD5ka/zxfiTOrmlZEMgPKsN2LWV/vF7rnc2HgxYHc75994MZvBmuQ5F1ZOARd/64ubXgRoets6Bi5FlFkkFXotwYhi1eJ5P9HR0JlyF+eL9k8oTDn7ajPpw7t16JBaeWP2NaJfrfG2eis2lHpFhP8q+p0q9/ykMfCPyx5LdnakCvUXJkAJ7kk5g+a145fnFS0Ybv+vcQHHAwhcqVqCUR8D9V6nmuu4Zl2dGPn39kKcHo5U4EcBojUIIGkxMocZHPSWS1MhLTxBY5UZARV1IO4fMWax0=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38445a7b-7164-46b8-a83e-08db1b81c3e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 00:53:55.4371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69H328rLx+zwPUg/A9AmTPg4dW8SX3KAa6NoHKlXpKmQQaVP47KmeawwfwWTUtXLKjVUyzUkIyjnEdrMlZhh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4934

T24gVGh1LCAyMDIzLTAzLTAyIGF0IDE3OjMxICswMTAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
SGFyZGx5IGFueWJvZHkgc3RpbGwgdXNlcyAzMi1iaXQgeDg2IGVudmlyb25tZW50cyBmb3IgcnVu
bmluZyBRRU1VLA0KPiBzbyBsZXQncyBzdG9wIHdhc3Rpbmcgb3VyIHNjYXJjZSBDSSBtaW51dGVz
IHdpdGggdGhlc2Ugam9icy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIdXRoIDx0aHV0
aEByZWRoYXQuY29tPg0KPiAtLS0NCj4gwqAuZ2l0bGFiLWNpLmQvY3Jvc3NidWlsZHMueW1sIHwg
MTYgLS0tLS0tLS0tLS0tLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNiBkZWxldGlvbnMoLSkN
ClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0K
PiANCj4gZGlmZiAtLWdpdCBhLy5naXRsYWItY2kuZC9jcm9zc2J1aWxkcy55bWwgYi8uZ2l0bGFi
LQ0KPiBjaS5kL2Nyb3NzYnVpbGRzLnltbA0KPiBpbmRleCAxMDE0MTYwODBjLi4zY2U1MWFkZjc3
IDEwMDY0NA0KPiAtLS0gYS8uZ2l0bGFiLWNpLmQvY3Jvc3NidWlsZHMueW1sDQo+ICsrKyBiLy5n
aXRsYWItY2kuZC9jcm9zc2J1aWxkcy55bWwNCj4gQEAgLTQzLDIyICs0Myw2IEBAIGNyb3NzLWFy
bTY0LXVzZXI6DQo+IMKgwqAgdmFyaWFibGVzOg0KPiDCoMKgwqDCoCBJTUFHRTogZGViaWFuLWFy
bTY0LWNyb3NzDQo+IMKgDQo+IC1jcm9zcy1pMzg2LXN5c3RlbToNCj4gLcKgIGV4dGVuZHM6IC5j
cm9zc19zeXN0ZW1fYnVpbGRfam9iDQo+IC3CoCBuZWVkczoNCj4gLcKgwqDCoCBqb2I6IGkzODYt
ZmVkb3JhLWNyb3NzLWNvbnRhaW5lcg0KPiAtwqAgdmFyaWFibGVzOg0KPiAtwqDCoMKgIElNQUdF
OiBmZWRvcmEtaTM4Ni1jcm9zcw0KPiAtwqDCoMKgIE1BS0VfQ0hFQ0tfQVJHUzogY2hlY2stcXRl
c3QNCj4gLQ0KPiAtY3Jvc3MtaTM4Ni11c2VyOg0KPiAtwqAgZXh0ZW5kczogLmNyb3NzX3VzZXJf
YnVpbGRfam9iDQo+IC3CoCBuZWVkczoNCj4gLcKgwqDCoCBqb2I6IGkzODYtZmVkb3JhLWNyb3Nz
LWNvbnRhaW5lcg0KPiAtwqAgdmFyaWFibGVzOg0KPiAtwqDCoMKgIElNQUdFOiBmZWRvcmEtaTM4
Ni1jcm9zcw0KPiAtwqDCoMKgIE1BS0VfQ0hFQ0tfQVJHUzogY2hlY2sNCj4gLQ0KPiDCoGNyb3Nz
LWkzODYtdGNpOg0KPiDCoMKgIGV4dGVuZHM6IC5jcm9zc19hY2NlbF9idWlsZF9qb2INCj4gwqDC
oCB0aW1lb3V0OiA2MG0NCg0K

