Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2032640740
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 13:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451952.709748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p15aT-0007N4-Fv; Fri, 02 Dec 2022 12:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451952.709748; Fri, 02 Dec 2022 12:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p15aT-0007J9-Bv; Fri, 02 Dec 2022 12:56:17 +0000
Received: by outflank-mailman (input) for mailman id 451952;
 Fri, 02 Dec 2022 12:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeCl=4A=citrix.com=prvs=328e240bc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p15aR-0007Gw-SZ
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 12:56:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2566e4f-7240-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 13:56:13 +0100 (CET)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 07:56:10 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5696.namprd03.prod.outlook.com (2603:10b6:a03:2d6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 12:56:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 12:56:07 +0000
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
X-Inumbo-ID: b2566e4f-7240-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669985773;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BKQ+p8BGGv7q7i6z6xN50JA/qosByxuezwxF9nuRF6k=;
  b=iHrNSIeYwS/bVGO4Xi7F2hjdedmFPwSa0gpU0oTPGdZ0NGtnYXZd4ejs
   /8QsRVGkQQnC7fZ5e5xQxHraAF3XeHyCV0sEHEs3DSiXpouObmxmGWCqP
   IFDo84QMwZwb5zTGJ5U2+wvI53N4+q3HRTS2J8cXAeQjqPkYhKNMmV5u+
   Y=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 86255423
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4eDtaq9OK2FO5ku63rgTDrUDzH6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 DNNWzjTOP3cNzHyco8iYY3i9x9Xvp7Vm9Q2GQpv/H08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6gR5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkloy
 8RfLHcERCqDuM6px52DTMwwrPkaeZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUvgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCNxISeDkrKUCbFu77UwRMR0Ub2qA/PCHkGK/YvJFK
 xNFw397xUQ13AnxJjXnZDWxsXeC+B0BXtNKVe0z7A2A0ILd5grfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOLWpg9P8Hzbr6
 yCLqCk4l/MYistj/6em+VHKhRq8q56PSRQ6ji3VVG+46gJyZKa+epelr1Pc6J5oJoGTREiMp
 3gAls2X6sgBCJiMkGqGR+BlNLit5u2ZOTzGx1B1Fp8q9i+F5HKoO4tX5VlWL0BvNMEGdTb3Y
 VT7tgZY5ZsVN3yvBYdoZ6qhBsJsyrLvfekJTdjRZ9tKJ5N2LQmO+Xg3YVbKhj681k8xjas4J
 JGXN962CmoXArhmyzzwQPoB1bgsxWY1wma7qY3H8ilLGIG2PBa9IYrp+nPUBgzlxMtoeDnoz
 us=
IronPort-HdrOrdr: A9a23:Dp3kx6DJoxeoDdflHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="86255423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRMwtSvzGPtkCXMIek86pT5ymlH0nK8lEntmcCYIGRpa1o/I6x8DIauvLUUJCfvjOy6BL0Hd+n6h/qLXjRRZMXku8lqDk3QX2DYf40C35fUS5uSg4QRwqP7/QBL667GTPFmZWfcq8OR13W1vFMgYBxaaErmszYk6GchQLX2Fy8aYaS3w2Jj2FncLn122v/NyCLZV/Ubpl98NzKS4tKp6O2ynZvkBAlNrpNP//1vcn6mLWN/vsnEdnN2y0iJgi+VslAuK2yEfChZK9OXvYQSIUc1ozJaN9KdV2uAgeh7m/gNTBmJpS0qyl+3aFW5OLnOrswSO6eQ4rE0b3Ses1SXIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKQ+p8BGGv7q7i6z6xN50JA/qosByxuezwxF9nuRF6k=;
 b=aqTush+d1scFVmZ2uE8WCFYGtq7ZR+yCH1V/ejHefF9IE+GMaw5aExbLuhsoO8fdaqdXfmA6jXqBBM6nG2204JmRyxKg96/lR/OFcf812Rltt66E6jd/7R8BYLQ7wl4JMqHe2kQefh7igYS50cfdyO6MwrymxlD1wKo0R63/+Wi/4f3UqwsHJbXq/rDYS68RiR+39Nypdl+/BSYvdraHe6LuYh6pmrARg6GctMNaFb1AjuBc+L4fD/EEQqw+VPf+bUEKDcmXoZHgyLNflsjvX4sl/uE+BdDS9tOvIdeHtQewgYOghgwVOxvK9mC45WlrpHjH6Qe4/mnOfaQkG9CwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKQ+p8BGGv7q7i6z6xN50JA/qosByxuezwxF9nuRF6k=;
 b=c5RT9qo309niDoVkwyPNUcHhvjLErN3cY2JWQFU+44NrRAofp18/yrboti5JpW6jvpjjX7dGjRTXt+hm1C0b4Ycxey+f3kk8S12B6w2zFo/+UtRwOlY3ApmSLh8Ac0aL6Ksxae53MLbScXpN5slNuIS0SRdztTgMxZ3qYkScxHI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "stefanos@xilinx.com"
	<stefanos@xilinx.com>, "julien@xen.org" <julien@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"bobbyeshleman@gmail.com" <bobbyeshleman@gmail.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"connojdavis@gmail.com" <connojdavis@gmail.com>, "wl@xen.org" <wl@xen.org>
Subject: Re: [XEN v3] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used as a
 rhs operand of shift operator
Thread-Topic: [XEN v3] Xen: Ensure "xenheap_bits - PAGE_SHIFT" can be used as
 a rhs operand of shift operator
Thread-Index: AQHZBkqx2u9PL/EPM06idthUV70i9q5ajkuA
Date: Fri, 2 Dec 2022 12:56:06 +0000
Message-ID: <1a42f92a-81e3-eba8-6831-900414e0e809@citrix.com>
References: <20221202123559.33143-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20221202123559.33143-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5696:EE_
x-ms-office365-filtering-correlation-id: cfa5a2cc-0144-4c7a-9bfe-08dad46493e0
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LvN83Jchz9ombUZNcWCOm6nhrC71ctEhE/v4bRN4CnSDOdC0egODH8Ran36AEQAr7Fe6IftTXzbmgMt+FzY6K82HKSH02nhCCha1WChYTdLgKv/rjqkB8knzVpbLP/0mSPQ1aTey4f2ENHCbECJw8tgDMO5CK8Ur2ui6jVJB6zeooEwJ7TqRXqqh1DwBa8UQH9toamO/L/1djcnDvCd8KegIvozw+vIPYXUbi/CWdAz9oxlpqRdt3f22cLiloZjB+zRKvKkd3UuPDfuD8L4EWGsQWrnQqFl/5o/r4d9lGmnpw4oG16I2dig5Ufi08f3FE4fTY0dwUSrhC/X4ZflR0/k27QM2+aHF6GgeU35MUU4LkQBMiOl5z8/sGbxNrnXTUavCQZQlhIHsucTfAUlyk2NIPD8NHzHXgACyaxpvrjS4mja+RgX1lKKkIewaRP1dF3duWJzHz3YPGuMO5NbFyzeyk+ha8s4tPDi771zQ85YatvCezZWjuGBiJfWFQJJiVF5LEPf5yp41g4cE7nzzU53Npw1tmXXifptKBasGoVxsq/N8Ofz8sFc1Y9+gK2xvnDUDpAudkSwh5l4wwEByCOMxs6R6HjSCoebTX6bIH0r3ZQVL8h7PkfcsBvn2Nn8j6XgdbNna0EvV285gBX+7seonCY66rSnbPeOopQJpRyF5GTtI+7lj4BZPHwjtcmkJTi8+rNmqAKt657WnPn6b0qTtXWt3TAdecwT06ytILu/NIezMJbAHx3fPP8YCdNKLLiZcEwKKStcT1aPZZNEE3g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199015)(5660300002)(4744005)(7416002)(316002)(54906003)(66946007)(76116006)(66476007)(64756008)(66556008)(66446008)(91956017)(110136005)(36756003)(2616005)(41300700001)(8936002)(4326008)(8676002)(38100700002)(82960400001)(122000001)(38070700005)(86362001)(31696002)(2906002)(53546011)(6506007)(71200400001)(478600001)(31686004)(6512007)(186003)(26005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXowcjBJS2p4NGpWNDBmb3pRWXhXaytKSFRKeHVNVkdJM2UxbUp1dU5qay9E?=
 =?utf-8?B?M0t3eWVDRzM5bWsybkJhTkFrNnArSHF2UGlmOGpaVGloN3BCNGg4ejN1aEpD?=
 =?utf-8?B?QVNPeW8zcStqTXlyZmthNnhOM3NPcmREVkZNMXNCSGtMaEw3TExaenBnYTF3?=
 =?utf-8?B?TDFpdS9mSk5mZjNnT1FWcnJLcExXWkd6SXdvRGd4d1JjcFNRQlVnZkNndW9O?=
 =?utf-8?B?M2VOQWtjZE9IYll0aVc4MXhsSUNOZTlXTDBVQU5hVDBhU2Y3YWZVTVlVTUZT?=
 =?utf-8?B?YzI1L1BpY1Q4YTB5SUxEZ3dyd2RMK2owNEtxWGdYUnpyZ0hteURhVGV5eG9Z?=
 =?utf-8?B?L1dkRDJ6UGNyZSszN2RGSkNjRUdrVkRFRTZCbkNmWFp0TnMyeXo4MjZjRjd3?=
 =?utf-8?B?SVZMRlI1Tkp4Q3QvQU5TQkhVMVg4Qk9qQjBQNXBjNG9xTXVMMEVjVHN0MlY4?=
 =?utf-8?B?UVkxczI4TW9qUkJZeVZtaW5pRFhSVzR3VngrNllNM2FHSXNvMjQyQWxDNzJa?=
 =?utf-8?B?bjdTTnlvNm9EUlNzTVVqK1NOUC9LbEtvQlFsYytCeW83RXp5eE54Qi8rN0RN?=
 =?utf-8?B?c2kza3pkTXpHdnFQZ21LcGQva0NLdE94dzVxaUdrbHpXclZ5aHpLOWNZekFQ?=
 =?utf-8?B?RGRGOGtiUndkWVVjRkttRzdaYWtHMXVEUGNMUTVyRFNTTS9QSkJjTUpPd011?=
 =?utf-8?B?TXhGVXlSZU96Q1owMERsUExvODJhbHVEKy9sNkIyUzNTTUt0YWpkVHdvSkxO?=
 =?utf-8?B?b3A1U2JDeXdLT0lXS3ozRUU4dVBBcXVtclhyQ2xTMWNDRUtmVHlVUTRBaFF3?=
 =?utf-8?B?SXFsZUpqRGdoRUNERmVKQ3F0aSt5WjJ4NmQ2RFJYbmVkN0pPL2xhYm42UXpN?=
 =?utf-8?B?L1RkRGJBcFIvY09saG1Vc3dsNzVMc2hYRkl5dWNEUjZqVWtTbXd1TjZWWENm?=
 =?utf-8?B?MXFjaDhlNUhtWjM5QXNmSVhrL0hYVDYvT0dmMGp6NFBTa1FLV3R6QUh4KzN5?=
 =?utf-8?B?TVJERU9YMFdBWHJNQ2VKQU16OTlKQkZ3aUp6MTlSMEgzK0pwbVJCd1JuY1hF?=
 =?utf-8?B?aGZmWU1rMzhCYzFpL0wyNHVxL3pUTi9WVll4NVhjdDJvQTRTdk9JUHY1QzZl?=
 =?utf-8?B?ejBXWWFYZ29pY0g0TkIrbmhURFN6QVBFSWhyOEtpdUVxT2Q0YXplMDkrdVFY?=
 =?utf-8?B?RGd4LzlwSk1zVzE5RVRWcGRTcTdZcG41cG9HbmIyMHNkVzdJNmREZytOd0xs?=
 =?utf-8?B?aXViZTZsOW13UkxwT3BEbUgyaS8wKzZZU1d2amUxQjNRdklyVEJwQ3NIaWRL?=
 =?utf-8?B?OWgvbXR3RFlISnZ3YlRJRUFoKzVsREUvRGVWdSs1d0l5S2N2Z2NCZ1A1TE1L?=
 =?utf-8?B?a1ZjZ1cwQzg4bnJ2WFh5WC9hZXBnRStKZHA3TUZ3QnFxYWR5SmRDS0xua0RZ?=
 =?utf-8?B?SWtFdXhQR28zZEdWaTZmRXgyTlc0QWNSSmdoM2RKY2xJOVVwKzd2S3ZNNGtw?=
 =?utf-8?B?dkYwS0JIZG5GOEJJcHVkTm1CdCtjWVZqb0ZKZGJhYWJ3d0RaUnI2aEJyODMz?=
 =?utf-8?B?WXd2bUVLQkNJYlJVeHV2T0dZNGYwTEVzU2UyNDhMVWIwL3VzV3NpektMdDh1?=
 =?utf-8?B?UittR01wZ05QVDRKTldaL3RhcHY5aUt3S3MwYzExZjRTcUVHSWJBU0V5dlZS?=
 =?utf-8?B?Y1ZFTUxKQW9tVTZmNjE4TG9xbW1BNVpITXVoYnhkSWxHR2d5STBhUlBKVUtn?=
 =?utf-8?B?R1ZibFR1YXhObUR1Wk1xS3kydGZmZ0hnR1ByNU95eElhZHZyZ2NLSTJ2WDBD?=
 =?utf-8?B?QlMranJMMGI1QWFIaEFtOU13b0YxeWsrOEh2Y3o3ZWpkMDJMeS94a09ZQU9D?=
 =?utf-8?B?eUxZdWQ3YXpiMXZ6N0JoU0VpbUtPSy9GTUVIL3VsUGtlYTF0TS9rNWd3MEkr?=
 =?utf-8?B?SFNYRjFkbDR1N0hSUVczdE9MTEM0a3lvaEoyNXZiRlZpcm1PY2Ezem4wZnFw?=
 =?utf-8?B?L2cwOFg0R09COU4xMEp4MHRHbnk4RGR3dlJQVGRLUlZjS3R5TjN6MllidXln?=
 =?utf-8?B?Y1RaOHhhMFd5QU5vZ2Fad1ZYT1RKZWJvbnI0WnlKZDNueUJuY2NHc1JwWW1o?=
 =?utf-8?B?SGRBQThKY0lFN00rcWtXZjJ5b0t0Y21jVVExekUwR1E3dlB4L2Zsc2lqY281?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <252B8D80159D3B4883DACEB2C9AFCD1A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?cmpvOGdSU3ZZSG4xWG00aWpNODU1MzZoajIrR2thSG1LMmZIVlFaRnFlMzQr?=
 =?utf-8?B?TzZoMndFZEZ0SlVOdWlQL3RHNWh5eUUwT1pzcHlTTE9qZFdNZERuZTh6WUU3?=
 =?utf-8?B?UVVNUmo1d0hqSEFsZWllMVVFV0xRb2NrdEpGb3ZHVmRaOFZkZmtxeTAyNkxm?=
 =?utf-8?B?ZDA5dTdlYnlmSDc0dFJBdGp6Z0drV25hblYyRkgyeWtyV3VJSGQyWmdKaHZs?=
 =?utf-8?B?citJdnhLMUNsRjRyYzgzMVdwZXBwMmVmUFcwUTNPQzlpTkk2QkZ1ZDA0c0ly?=
 =?utf-8?B?anhaZ1UzUEI3ZVlYcnc2QU82cE96MlY3bzBic0d4bHVNd0VkWUs3ekZkN0dm?=
 =?utf-8?B?VXJuZTNVMTJTWXFGTVYxQ0YxN1ZHMmVRNWI4dHhjbUlja3JqQWR2VE83bWxr?=
 =?utf-8?B?SFhCZEdTZ0dNaG5ZRUdERlZMMmt6R0F6ZlYzOXg0bFNPWTVkT3kyblVTM0ho?=
 =?utf-8?B?ZnJoU0V1VTlYM3BaRFN0eGl6M3ZFQmpDZ3pIdHZwRTVLemlFM3FKaXFDR2dZ?=
 =?utf-8?B?ZzhXRE5uYWNKT3MzZnQ1ZWlmL2VEaHBPS0JnUG1FRXk0S1FxSFJiZHJRTlZj?=
 =?utf-8?B?TkFURGY0bk1MTlNHcFRaR1F0anIzNkx5TVc2SGtZMW1vUGdnSElMcnh6bVpp?=
 =?utf-8?B?SzFxSGg2YVQ1Y0tYckxZOCtyOXFkWm9PWDFlMktZd0lwYXdweEpsMmE5S3Mv?=
 =?utf-8?B?Qys0d1FyamRFdXh2bGtoUkgxZis3UEd4dTlPcUt3QjNXRElERk9udnNTNElP?=
 =?utf-8?B?c3J4MGptWCtoRDl6WnpZbnMxT2hOeW9Sa3BoalhyY2JUcDNYRXVwdWRuamYz?=
 =?utf-8?B?b1U4NENWQ1ljeUhoOHFoZG1vQkpsbGUvbVgzSElzYXhlNjVSbkJWWlR2QXVB?=
 =?utf-8?B?YmVxSEw5Nm1TR0hMbHlielZYczJRTWtNQWlhbURGQlpMTkVEOWFaRitUSlBX?=
 =?utf-8?B?N0RzN3ZpVzI4b1dKbkdiWGZjdWkzN2NQVHJJS0hleVhGWXVyU2ZVYWRyZUQr?=
 =?utf-8?B?ajVqU3ZPS0VTd25PM1doM1dwSyt0OVFhczBDSDRuc3JFbHJUMmtaQVNkT1I1?=
 =?utf-8?B?Wm55L1NuY1A5MC8rYTFrcGtxVnpGVGp5R2Q0UzFwNlZ1UnRab2NLSzBvUXVv?=
 =?utf-8?B?KzlWRDNPZld1Vlc2K2VOQXRYUWJVZVdsa2FxMllOM0k1MTdHVVdDTHhmQ2JW?=
 =?utf-8?B?a2NEZmNzUDc3TEs2bE80WUxJWFpqUzdBUzlDVUZNQ1IwREljRi82T084QjJP?=
 =?utf-8?B?TlpTUEdIckw2LzBiTHR4dGdjNGh6Q3JZOG1yaU9TaHRrTHlhcCtXKzNMZmFE?=
 =?utf-8?Q?kuwu24bhU5NXNdJ5EZ5p6qPgKN0qrW8b9s?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa5a2cc-0144-4c7a-9bfe-08dad46493e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 12:56:06.8666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMNjVi7uqjw60o8U3uhEu4ZVZj0YS/m8uDOK4IVzX5v3BQcp0ciGRmC5HOJkXJuAKKVSTYl0bz8/ivQh4nRe6u6ohGWxf5O+GMbVFcndyqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5696

T24gMDIvMTIvMjAyMiAxMjozNSwgQXlhbiBLdW1hciBIYWxkZXIgd3JvdGU6DQo+IEN1cnJlbnRs
eSB0aGlzIGNoYW5nZSB3aWxsIG5vdCBoYXZlIGFueSBpbXBhY3Qgb24gdGhlIGV4aXN0aW5nIGFy
Y2hpdGVjdHVyZXMuDQo+IFRoZSBmb2xsb3dpbmcgdGFibGUgaWxsdXN0cmF0ZXMgUEFERFJfQklU
UyB2cyBCSVRTX1BFUl9MT05HIG9mIGRpZmZlcmVudCBhcmNocw0KPg0KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gfCBBcmNoICAgICAgfCAgIFBB
RERSX0JJVFMgICAgfCAgIEJJVFNfUEVSX0xPTkcgfA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gfCBBcm1fNjQgICAgfCAgIDQ4ICAgICAgICAg
ICAgfCAgIDY0ICAgICAgICAgICAgfA0KPiB8IEFybV8zMiAgICB8ICAgNDAgICAgICAgICAgICB8
ICAgMzIgICAgICAgICAgICB8DQo+IHwgUklTQ1ZfNjQgIHwgICBEb24ndCBrbm93ICAgIHwgICA2
NCAgICAgICAgICAgIHwNCg0KSnVzdCBGWUksIEkgdGhpbmsgdGhlIGFuc3dlciBoZXJlIGlzIDU2
IGZvciBSSVNDLVYuDQoNCn5BbmRyZXcNCg0KPiB8IHg4NiAgICAgICB8ICAgNTIgICAgICAgICAg
ICB8ICAgNjQgICAgICAgICAgICB8DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4NCg==

