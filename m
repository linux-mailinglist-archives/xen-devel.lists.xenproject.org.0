Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8123622D29
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 15:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441036.695284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oslkA-0005Qo-Km; Wed, 09 Nov 2022 14:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441036.695284; Wed, 09 Nov 2022 14:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oslkA-0005OK-Hk; Wed, 09 Nov 2022 14:07:54 +0000
Received: by outflank-mailman (input) for mailman id 441036;
 Wed, 09 Nov 2022 14:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40hA=3J=citrix.com=prvs=30514606d=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oslk9-0005OE-GO
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 14:07:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e563645e-6037-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 15:07:52 +0100 (CET)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 09:07:49 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 SJ0PR03MB6342.namprd03.prod.outlook.com (2603:10b6:a03:390::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Wed, 9 Nov 2022 14:07:45 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 14:07:45 +0000
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
X-Inumbo-ID: e563645e-6037-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668002872;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1h8lzpwMN164Fb52sttFjOrxYgGV3lzyi40IB7HY0HE=;
  b=bm28ALAtnSiKsMU1GhBZnODWm9tcFWL9Sk1O+YjG+D75k2vdZbBHJBBr
   TBi8YMUVaXBDTr9HSjEkPt0jVkjQiMIV6c54QjCwQWwAz6YJMzvQ0fnvk
   J1QL20AJ6/9adsD+jEMbKqqGMxdoAayqOnkgiHBNwxzBoDWdioupkqTWj
   U=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 84494976
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bNzzLqxUOCzfIwzV0zd6t+cJxyrEfRIJ4+MujC+fZmUNrF6WrkVUx
 mVKC2CHMvuLYmDwfownbom390JX7cCBzIUwGQFqpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPaET5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV1O2
 aJFEzlcVzzZjcaSx4+0UuU9t8t2eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMsuFTuGIO9ltiiTsVPn12Ep
 2vAuWD4BB0bO/SUyCaf82LqjejK9c/+cNJOSOzkp6E06LGV7jIUCxYmRQakneGopRKVAN5YI
 FAxoiV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcWSDowx
 xm2ltXmLTV1tfueTnf13rudsz6aIyUeKm4GIygeQmMt/N3LsIw1yBXVQb5e/LWdi9T0HXT8x
 m6MpS1n3bEL15dUiuO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:Ams2baGk9xcxOdj8pLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv8nZKz+dRj8EC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="84494976"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRuTPzbmZ9jy0tuAH5J01kpqE+pRGIRNeFaQSYSKrKPTIHKQsOAGob2cqyqpkJ3LohyweiZajiUPnJ5ZJRzes+7unS+l3YvHfBZpdXZdFZVtNkZOcTTb3ngLJJoDbcxF3BCSkcyOlPrDGYr0RE4RytB3+u/e4PaU6BgGHapaJ0JWbzeHZr2ZFMsi8HOQ7Y8hElV1fiL5Z7wjj6gfbGYLN1yNSBzglCbKWm9XFl9p1/uTo+cDop1NBkqaCCE6DBUCa1whPhS2DRmTd8WkEonbPbtzzP7o5mihqtJMui8c1zjkHIlQ6wCSc11ECdUnuj5WFDZXtZGTTL2uGYeLXrdHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1h8lzpwMN164Fb52sttFjOrxYgGV3lzyi40IB7HY0HE=;
 b=GG49UXklXpWb44ddqVAQvDZeH/xwAnEUtQOV+h2lqkkv3YPjoMsaGO5r3SKmKmC/PXtHhYH5BJrZsaxfbgOwcDFwn02Wrxr5rR2v9EUtjOSZBw1yiihK8I4/jcEDCtYmb1q4UyrUjsK00DVsxmfUIEXxf0oUK9buBXnFetsQDaRqo8u0cXpV/3RYmTx87gAzyj1FYmyz6znUlTLjrUxavigYcXRR3jjsYLnWUlN9tbX1THu00HwLpEksWzL23xK4fJQLNffH4I36HDkvMLMs+U8HyZoyw0p7I8vCU8BZ1NqxkDMt+Jn9/yguO8PbjursER/coNiTlUxc2QFAogdptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h8lzpwMN164Fb52sttFjOrxYgGV3lzyi40IB7HY0HE=;
 b=MnRQ9wE0tu1Fg9BiGRZNUj3NwIqwPeVQVe1tMI1/y12YuxtX7BNHRRjT08KT4kvjVVZPyQmjgzQGgxNPnDKO8QhyrHbfh7CAo98iI9JqtR6Fop5euKv9GAKLMWk+Fo3Bq7cZk59MNdTrofe+yfFVx5xSUUCbvVQjSD3TzobY/Xo=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 13/15] tools/ocaml/xenstored: set uncaught
 exception handler
Thread-Topic: [PATCH for-4.17 v3 13/15] tools/ocaml/xenstored: set uncaught
 exception handler
Thread-Index: AQHY84hRz9ZwhCZsU0y+SHd5jJpHJq42ojKA
Date: Wed, 9 Nov 2022 14:07:45 +0000
Message-ID: <E1A2D840-94A3-481B-AFA9-0CE3B8EA2FD2@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <a370618057664382fe9e6e503e0dc0be8818e5ce.1667920496.git.edvin.torok@citrix.com>
In-Reply-To:
 <a370618057664382fe9e6e503e0dc0be8818e5ce.1667920496.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|SJ0PR03MB6342:EE_
x-ms-office365-filtering-correlation-id: 6b22b8f5-da58-4bf4-b25a-08dac25bc6b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 W078qkxDmZrYKOxDXtdhC9NmetQcoCcm9Sn6KcqDUSwkcAx35MYpQbMp4+znNRezAFHINT61HzDIs1H2WQMthRH/+DJGszWu6poN8sc0ds34QR5lAZxD4ZWU3PH1bXAC/XDDQxHvLOqhSovpxMocP6Io5csksU4LSUN0RsaRu7nVU/GNhUhJfc5RD2YHgWUXexgUvgEl/apVp58zvxfZstdTsXxhgfFvRhszfG0/rGYXErDhrahWMfQshuLE17mGc0qEKIGYim5ECIv60VGsptSacc/OOLMsu+gyH9CPIFtmWFgnp8vaHL2pZlJ6u7qTJ1eo0keJ9/X6uuzUuk520vdii5n9W/35/fpalze+IWaDSlP5m7L1ACtEAbXoYQXBZ7j3hhzVWVi7alJ8jfKqQmGFtqrlUB8AwinmCraSJJpbYF2cMK3QG+xGk/Twiez4vkxpC9IoO3DB9UIizpgMVJGGeYiF1waMlA7rpYM7Jb9xBsrRro23EGlxa0B66HeuHoKsJ1RPXQ2AEETKF97r1471igqRgo20r++2WBUoxGkGNTAgYdTOaQ0vWF7Gy51eU5HyiFjHjVQhRhRX4wfWkHSdvovMuxFk9imsEip12mr9L0gMHsmAH64BNtRpviL17fyp3TrEci8GH0fYFhyQVVs6v9sKk067yxxaarAJuneu0akYqSiKOH796+tGHDismX0eXXmcyYzQDqd0YdQLfX99ROcPzkoOdjqPEVg9nT1fnLBZJfzLX7/hpDjof5ORQ4tTN+GpgGSkMWx2awx2bqqXTqqB4+PR4UpumkdjNeY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199015)(36756003)(38100700002)(122000001)(33656002)(86362001)(478600001)(82960400001)(6486002)(38070700005)(83380400001)(44832011)(2906002)(66574015)(186003)(26005)(4744005)(6506007)(66556008)(91956017)(66446008)(66476007)(107886003)(8936002)(5660300002)(6862004)(64756008)(66946007)(71200400001)(76116006)(2616005)(6512007)(53546011)(4326008)(8676002)(37006003)(41300700001)(54906003)(6636002)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0VyejhkWUZaWGxsbTFxb3drNGl3ZFY4eGxOemFSNnI3WkZhN1hwU0YrVnpt?=
 =?utf-8?B?aVNJcmVlUnd3MlFSWitjT3VLMUZYbUlhVmtEdDVldTlWdHdnSkZvVGJFNFhp?=
 =?utf-8?B?d0duRnhBQzdKWFRJMlJzWmFTVi96OVZnZFp3NTBkaXBsV3NRRFNHVXplUFJr?=
 =?utf-8?B?ZHZYMzN6U25SRm1LOHUyajJvdmVLS1cvSnE4TVpXeGhkQzNMNTlYMWFOY1ZY?=
 =?utf-8?B?V2VqWjczVXBlV1F0OGlQM1htQVR0TUZvRndWbWxQNGdlcXlldFV1ZXp1Sy85?=
 =?utf-8?B?U0xhUnErQ1RaSGNtcEZydU1MZC9uTjZxS1hlMG1lL0dqRXlzTFBibm55a1p2?=
 =?utf-8?B?MkVhNjNPL3NmOVQ0c1M4Q3B0OWVIeGxvUTN5aVp6R253ai9DeEJTREhDS3Zo?=
 =?utf-8?B?WnF0NjRwSFZiR1g1bHByVDNqUmlId0szZ2JBRG10M2lhWmM5QzR1VW9lbHor?=
 =?utf-8?B?OVI5SGFqNGhVUVdkZ3ptWjI4b0l5a0NDV3ozZENIakEvWHdaaURUdk5mcVZY?=
 =?utf-8?B?Qm5MTEszWXRBbk5oTlBoK3hBbVNOdUd0aU5kUmtrZ3NJblQyblZlbi9kSWZN?=
 =?utf-8?B?UWVlaWtXQzFVQmZwZVBIK0w0cmtoZGRrZEVCWU1wL3E4RE1MRHltNXNoSGFF?=
 =?utf-8?B?SmVDNlBvRXhIQVFGdldYNGMzN2JGb2FZazZOSlF3L3pBL21IVk1IbXZpUlZC?=
 =?utf-8?B?ZUpxVVdBTHQ4R1psRGxpUE9QOGUyNndHOFhtLzI2ZGRTc1ZHckY0ZWJrcmQ0?=
 =?utf-8?B?eUVBZXJ4clMxQlJpT0xDN0lnaFliZ3pOeWRDSUpuU1RqdmxQQ1ozWDJ1Sy9M?=
 =?utf-8?B?c2lLQ2ZGVytYOWh5WTBocXlmSUVjOHRWV0JIWW9mVEgzUG9CcUMvamtxcWpp?=
 =?utf-8?B?NTBpKzErenUra2s0bGlMOVhjTUpia2NyMG9IMXQvVnoyQkxSUmY5UjZWR09G?=
 =?utf-8?B?RDFPYmU1WFMwT0lacVJ0MytUUFRpRXp1VUszZC9oTXQyejRIUmtJM0JWUmU2?=
 =?utf-8?B?eUNMQ3greVNsRHNRME83cEVKN2FMUVVSSWpid0JTQ3JPRUtCbTNJaVR4U09r?=
 =?utf-8?B?R0dieFl2V0YwdFdFbVNKQUlETUlFdTd2c3JDa3lhcjI2WURHQWsyM1JBTk5F?=
 =?utf-8?B?VmJmSUFjbE1TcUpIcElEUHM1eTZicVdRb0NIZkpJeVZITDdmSGxLdDJVcEJk?=
 =?utf-8?B?YTh0aStPSGt2VzVSME1EVi9lYWROM1pxWUNmWiticWtrQzBmNmZ5ZGJMUzc3?=
 =?utf-8?B?MzZ2L0FNcE1JdG9aV25ESVE1VTV1WXZUUGdmcDZtT050dXpucFlYV0ZJWmNm?=
 =?utf-8?B?UzVabENLSGVwZFREK1pGQmRKTHhhRG02YXNLdVFZdnFjenhPQzFTODdIUGVm?=
 =?utf-8?B?ZG9kMENmK281dlhKQ3NDR0JIUE5iUUp1VURrV0dLcFZwSW9TR3JRL2QyZVhU?=
 =?utf-8?B?elNwYzRZTE53NUQ4VUdGcXZaRXF4aG9lc3FKMmRkNkxDNStTU3JIOW55ZEJ2?=
 =?utf-8?B?WVZKMlBlMTNsTXJCK1M5T1ZCdWRxbGtGckJZcm5VcGpWVDRZZFYxdWVyS3Zo?=
 =?utf-8?B?RHVrMGRoMmN5dFlJT2N6VWpOcXRnV1RDRlU4bXdlV3A5RjlTZ1pwdXYvOVND?=
 =?utf-8?B?Vk1sMEQwdWozYXV1VnUxTmxpZndSdkRxZ0N6akZPbEFOVVVOOFBQbEFQaDFO?=
 =?utf-8?B?Z1NnYVpxR2FyMmo4Zk0yS084WTlwMS9Dejgxd0RWU29hY0FmQ05SdTQ4ZnE2?=
 =?utf-8?B?MDVmVERWN05vTHZtdlN5T3N4ZldXY0xQUHRpekROM21rNUViZVhwNnBLSENh?=
 =?utf-8?B?TEQ2d0tBRmxVa2NaOGptbWlHMmhFb28vSFhYVEJIdkJFd25NWWQ0ZnhCWWVl?=
 =?utf-8?B?OHJ4aWg1Y0NXYiswVEdDaEY5NHBGb0VRUzhCSWdwbHVxMDFGa2xjcEI3aTFp?=
 =?utf-8?B?MW9aQkpyNm9JTVk5UGsrelpBSFkyU2dOVEpyYWZtT0xvMTZuVjkzSlkxZnQv?=
 =?utf-8?B?K0tFVy9tZVkyb3ViS1RZelBrLzhNUXRMTk10K2FVR3lkbzhVTXhPRjhCT2Z1?=
 =?utf-8?B?bm1nSzJzd0lhM1R2RmtaOUh0bE10N0IwaWNSVnVRZzh2bXZzZ2JBRWlhUlc3?=
 =?utf-8?B?MWpRSHRkOHgyODZwa1E1SWgzaXVRMEhyMkM2Z09TM1VOZkRhWGFmdGtrS004?=
 =?utf-8?Q?OkPZrY8uIICbdfu78QD073Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CA299ECF8BD98408E7FA8CD918FA70F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b22b8f5-da58-4bf4-b25a-08dac25bc6b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 14:07:45.7799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /b5aIkoOsPjjbrn6lzYrQ1DNmHGg/+XYCDZq5M2Tsf9ksWZQUmf4voZlQQkZecX6c9iKydHxwxmT2ZnNaZc5WYUNrvDvPlWIDPWe0in2Qek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6342

DQoNCj4gT24gOCBOb3YgMjAyMiwgYXQgMTU6MzQsIEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9r
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gSGVscHMgZGVidWcgZmF0YWwgZXJyb3JzIGR1cmlu
ZyBsaXZlIHVwZGF0ZQ0KPiANCj4gUHJldmlvdXNseSB0aGlzIHdvdWxkJ3ZlIGp1c3QgZ29uZSB0
byAvZGV2L251bGwsIGJlY2F1c2U6DQo+ICogZGFlbW9uaXplIHJlb3BlbnMgc3RkZXJyIGFzIC9k
ZXYvbnVsbA0KPiAqIHN5c3RlbWQgcmVkaXJlY3RzIHN0ZGVyciB0byAvZGV2L251bGwgdG9vDQo+
IA0KPiBQcmV2aW91c2x5IHRoZSBvbmx5IHdheSB0byBkZWJ1ZyB0aGlzIHdhcyB0byBtYW51YWxs
eSBydW4gb3hlbnN0b3JlZCB3aXRoDQo+IC0tbm8tZm9yaywgYnV0IHdoZW4geW91IGhhdmUgYSBm
YXRhbCBlcnJvciBhbmQgb3hlbnN0b3JlZCBqdXN0DQo+IGRpc2FwcGVhcnMgeW91J2Qgd2FudCB0
byBrbm93IHdoeS4NCj4gVGhlcmUgaGFzIGJlZW4gYXQgbGVhc3Qgb25lIG9ic2VydmVkIGluc3Rh
bmNlIG9mIGEgYnVnIHdoZXJlIG94ZW5zdG9yZWQNCj4ganVzdCBkaXNhcHBlYXJlZCBpbmV4cGxp
Y2FibHkgKGl0IHdhcyBiZWxpZXZlZCBkdWUgdG8gYW4gT09NIGV4Y2VwdGlvbikuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPiAt
LS0NCj4gUmVhc29uIGZvciBpbmNsdXNpb24gaW4gNC4xNzoNCj4gLSBhdm9pZHMgbG9zaW5nIGNy
dWNpYWwgaW5mb3JtYXRpb24gZHVyaW5nIGEgZmF0YWwgZXJyb3IgKGUuZy4gZHVyaW5nDQo+ICBs
aXZlIHVwZGF0ZSkNCg0KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5k
aWdAY2l0cml4LmNvbT4NCg0KPiArbGV0IHByaW50X2ZsdXNoIG1zZyA9DQo+ICsgIHByZXJyX2Vu
ZGxpbmUgbXNnOw0KPiArICBmbHVzaCBzdGRlcnINCg0KVGhlIGZsdXNoIGlzIG5vdCByZXF1aXJl
ZCBiZWNhdXNlIHByZXJyX2VuZGxpbmUgZG9lcyBpdCBpbXBsaWNpdGx5Lg0KDQoNCg==

