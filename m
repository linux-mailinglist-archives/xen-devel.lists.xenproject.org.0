Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A15675898
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481950.747203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItMj-0002mv-C7; Fri, 20 Jan 2023 15:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481950.747203; Fri, 20 Jan 2023 15:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItMj-0002kN-99; Fri, 20 Jan 2023 15:31:41 +0000
Received: by outflank-mailman (input) for mailman id 481950;
 Fri, 20 Jan 2023 15:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pItMg-0002kH-Vb
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:31:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85793393-98d7-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:31:36 +0100 (CET)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 10:31:33 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5412.namprd03.prod.outlook.com (2603:10b6:208:291::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 15:31:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 15:31:30 +0000
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
X-Inumbo-ID: 85793393-98d7-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674228696;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5xWWkPa50EhbsjIYsMVHqH9LEfGHOJQyq4+E2+vQpPo=;
  b=Gzv6efnIYPg6MN/verESqd6qm06732Oxkm9+V37wlOjsbkq4kCqsBUpt
   ENGc1LMwVk5jfws5Sa/RokQbVxCQ0jrUd23Vck+GNCQxaMn2xjdhwrNWE
   nrJxeGe2IBxSyAT25rf6PKeqCRm6d7qcygOW6U7jxnVcxhRVlcVmgpXzP
   Q=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 93953849
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:m03JiK5O2XJ2k3Io7CknxwxRtKDGchMFZxGqfqrLsTDasY5as4F+v
 jBJXGuAOP/bMWOnf4sjb9mwpk0Bvp7SmNAxTgE9+3g1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakR5AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 OYTKTACcyK6qsm154i6cuVntuF8I5y+VG8fkikIITDxK98DGcyGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0ooj+SF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNJReDjpqI76LGV7nA5IScJS12Dmvy4zWT5dvN+N
 lRM9BN7+MDe82TuFLERRSaQp3qJvQUdWpxTDvc94wGOzYLb5g+YAi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adgdz8HzXty
 DmitikggK4Si8VN3KK+lXjNhDimt5XSTgo44wzRdm2g5wJ9IoWiYuSA4Fza9upJLZzfQEOIu
 nMFgOCB4OtIBpaI/ASGR+MLG7Ol7uiEKxXThFduG98q8DHFxpK4VYVZ4TU7IVgzNM8BIWPte
 BWK5l8X44JPNny3a6Mxe5i2F8kh0annE5LiS+zQad1NJJN2cWdr4R1TWKJZ5Ei1+GBErE31E
 c3znRqEZZrCNZla8Q==
IronPort-HdrOrdr: A9a23:K6i1navfENVoShFthgU7BS/97skCEYAji2hC6mlwRA09TyXBrb
 HWoB1p726wtN9xYgBlpTnkAsK9qBznhPtICOUqU4tKGTOW3ldAT7sSmbcKoQeQfxEWn9Q1vc
 0NHJSWSueAamSS5vyb3ODMKadD/DDxytHKuQ6x9RZQpawAUcxdxjY8LjzePlx9RQFAC5Z8PJ
 2A5vBfrz7lVWULYt+9DnwlWfGGg9HQjprpbTMPGhZisWC1/EWVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHmn+CnxgTa32rz6Y0TvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zUcIidDqzGxvvM
 jHoh8mMcg2wWjWZHuJrRzk3BSl+Coy6lf5oGXoyUfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXNxXdhy7wjuK4HC2C13DE60bKo9Rjw0C3YrFuJ4O5arZvsn+9Ja1wUR4SLrpXUd
 WGQvuspMq+OmnqF0wx9lMfu+BF2R8Ib1W7qpxogL3X79ERpgEx82IIgMMYhXsO75Q7Vt1N4P
 nFKL1hkPVUQtYRdr8VPpZzfSKbMB29ffv3ChPjHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTZTm5uw/zjndBGGmGTj9wMBX4JZ0/rX6WbrwKCWGDFQjidGprfkTCtDSH/
 yzJJVVCfn+KnaGI/c64yTuH51JbXUOWswcvdg2H1qIv8LQM4Xv8vfWdf7CTYCdbwrMmlmPfU
 frcAKDWPmotHrbIEMQqCKhJk/QRg==
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93953849"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LusK9udmKbE9wvYzZ2RSwv8uBErnGx6VU7VJGI9oPb0pgNQSBs4ROB3IfO7dNyMoRMSo5GQzQkm/fx55QdwgvBhwhb6DuJJkuDnXAHlAbRRB4PxnaxMw+7D7yL/J0TdUSAn4qpnMsExTEzHF3iEO+imZOmkE6kyY5uGjQmQtT8oxw7VQyNkOiii9LfKXJxXMnw5Idmym5kYQki71c0n2pyrglWy5WnpnyNZMqzFW9oYqBVy1DVVMIAm0nXtM2Hi9967qPS0vZwElbMcBM15S+2wuf1hk1oA+VfBpIveIYV2tPcbL+u01I1++ddKl9gx4mB9gDAYektRgOBH+rzkLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xWWkPa50EhbsjIYsMVHqH9LEfGHOJQyq4+E2+vQpPo=;
 b=SlziT16DQWh5il4VGFiqUzdn+RSkq2GKvUkZ+VPxH55ufNJqWft1M0VOzAyy54/FQkZmzMx2RybHxrX6LfAXJEeE0vyGLOvAoqfFuRezpHsrP9WBWq2gFTCBLaz8LshoWCjnT+v7kGaWPZfSmg2/yAZDUyelGJV6QrvUsjTq4hNpe4BaxDA9BHhdrTniSrn5ZB9O0bgsNRF4NaE8cUv2+g/f438ho3hm4X1/LJ+NaF2MQOFqZxsxmG5Gzvs9vHEfWJiGMWuq0/KiJ/gJTa0O/Zu4jqzyLg/zymi5wXAGi/uSADUg1DB1z0PWDnJ5bF9UX8oowD8VzJvwC8RORfSi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xWWkPa50EhbsjIYsMVHqH9LEfGHOJQyq4+E2+vQpPo=;
 b=vIh05cDGOnrx2dkzy6/WNVS9l75eDajSoH41fYyOnlQvQeaYEiaToGuS0TcY4b812+/vO+YeOEjg7N/TGdf6+hGt4ibTAa86AyMaUwAyrZkkBxpFzyi/aLLNK2/ccGU5ssZAFCvO9jPPxHS+dVxpa1gIgXLm6PZYAYuPHvsfyQo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 02/14] xen/riscv: add <asm/asm.h> header
Thread-Topic: [PATCH v1 02/14] xen/riscv: add <asm/asm.h> header
Thread-Index: AQHZLN/mQOdIReGXikafzlTdFxmXvK6nbsiA
Date: Fri, 20 Jan 2023 15:31:30 +0000
Message-ID: <610308ac-3440-e84e-02ec-928f0652e9d3@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <621e8ef8c6a721927ecade5bb41cdc85df386bbf.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <621e8ef8c6a721927ecade5bb41cdc85df386bbf.1674226563.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5412:EE_
x-ms-office365-filtering-correlation-id: b8c99169-2b1d-4d5a-d25e-08dafafb6733
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QFkWWxL1kZS8fExE8G49q2GhJB86xvB7J2yC3t+jGsi9oDpCb1k9ybNJyiHdkjjZoeVaRQwKNkecPa30jvdxKlo9Up5m/d2vVp3YQ+/5xz7mtyyu7U3+UkZZA5+LL9H3fJt/svqNp6wke9d6El+Qm0lRPGSYeyzHV9s780AzXNo5UXlgHi3uGem+NR2eZJGGZLEZCv1DfT0tf7dHUN0BnylWEthYbH67PUxK2hR1uRdbGrIqevPaJUBCFpf5tztl8ys++KurnWoXbyfRRddoiyoCPqbHH9x1HaZ2PWBwl2bB2cNgAz594zjOinz9Vl5t3dfHFU7VZw+ZWfXEFj6vm3f3Igu39iCG3fXHR0KDfFFj+L7uS4Dc9LuGUhs69gOsxXydeUP37GNJn/IJeGlhzZ+wQ5BLSIhg9LcF0Zdqg8pB4ZTvtLoPK/tI3vRiUX/jA54MESJBfScPXgK901+4FElq6IaVd60hr7xqJ5CZodivoO0kFAplbfldwWQ/cofXxxW1LUhb5RLzHjYfDpXp1d8ajHqB3Dggux4gURbAeR1cr1mulgLUo63+wtyqw+TMgdT6mnVbEWvTjUuBVuvqlIl+BGNqcrEGvOrExCxSQUTuUWqNuAwCcxe9GRJEkr3ZgpiTFjg/0ZtGUpNK2NSs1XjF7uQ3Cj94tBI+zby7KRMJ9rBRAX5js/BqLNFCvrwuYrUSdaywDD0pI99qwGLmfID+IDNyXv7HvajzKYtav4UbI5s8+aWPZODlkQGYqvRbQIpcDjDRV/30unFjCwpbkQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(5660300002)(8936002)(31686004)(4326008)(66556008)(64756008)(66446008)(66476007)(8676002)(66946007)(91956017)(76116006)(71200400001)(38100700002)(31696002)(122000001)(53546011)(6506007)(186003)(2906002)(6512007)(110136005)(54906003)(26005)(6486002)(36756003)(478600001)(316002)(2616005)(41300700001)(38070700005)(86362001)(82960400001)(558084003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3UrbjQ0U3VFZko3VnMzbkZkUUlwM2p4VzJMUXlKSkxxNDBmSTB4M0xpTU9L?=
 =?utf-8?B?KzZHclhWZjhwVkRNaFlIYTZyTDVRWXk0RkRkWUhOeVRtVXpDQ3RjanZaL1NO?=
 =?utf-8?B?TUtpQUpIb00wY2hGb2VvUERxUzUzclNmc3ZRK3NnTGR1RnJMNXhncnRKZUI3?=
 =?utf-8?B?U0NaWG55c0FjNk4wa3hBVVRKeEV0V2JoSStNYXRQWjBKNGFFai9iaGZtcHBQ?=
 =?utf-8?B?cU5vYUEyeFp1M216Y2VLQWNQUUdvdGU0eWNxVHliUFZndzdQOUZ3aGNUQlVT?=
 =?utf-8?B?ZldvVHdsY2ZBN2U1TDZkOG1xeEdkZ3lCaVkwUlJxTXBhQ3FxQWZUOUV1WTVB?=
 =?utf-8?B?dkdsQTRvL0ltZEpwdW5ocHBrNEJKcUlZb1R3enBnV0ZlZXE5NnkxRytEeGd0?=
 =?utf-8?B?RGRZM0tvT1R3TERtTndRVys2YldPNmhNR0ZKQWlsSW5RZlBQOHEyTTE1ZVdO?=
 =?utf-8?B?RC9RbkJrRnR4cW1DZURyd3RiM2tldWcxZU1JQXhscE5UYUFQd0RqT3U2VHgy?=
 =?utf-8?B?NUlPRjFDaE1YL0tMeEFMY0hiWlZtSDZKWDh0SU5lT0szajZqeGMvUWdSUEgv?=
 =?utf-8?B?dCthWjdFNXJqSWxSd2tmSFlqbERJTm1hU1FDNGxIcVpwc3l1ZXFyS3NybDh0?=
 =?utf-8?B?KzVka0ZRNTNadUkwVWp4aFZXNEJUZElhVjFvL3FFQUpaanJsUEdUekdqdUR1?=
 =?utf-8?B?UmxJSE5SVXdzYnF6dEh5aERzR1pYVlFUWlVHZHIzNFZWUlJjVlJQMDZ3T3ZR?=
 =?utf-8?B?ZmgrOFM1STgzdldPWDZlenNlZzF6TC9SRUFhUjRwampPaVh5aUtBUUx2bEdH?=
 =?utf-8?B?enNQWTlyRFluUkRNekowQzZXTTQwK3BVOWxiNmNOWUk4OE5udE01dlRZT3ZD?=
 =?utf-8?B?NmpQc2dRQ0phajlicERyY3poQVlPTXRzWDU5aXVEcEh2bUVxbzFLOWNxOXU4?=
 =?utf-8?B?ZEpWdEFVbG1CRUhCcTlCTFNkWVJucFhlUi9vb1JpYmo1cnM0WFl0STFjOEFs?=
 =?utf-8?B?ZzZVNVI4dUhhQTAyYkVsQzRmU1VORjBzVFJDcUhjYklCUUl0K2dkR3U2VFpl?=
 =?utf-8?B?RnlISGwwRGdESlp3MWt1ZWNTV3VFMXo5SEROWkI4VFMvenpyY0tVdEdXcUNo?=
 =?utf-8?B?cHM0ODYyeHoyckdoZ2tITm80ZnVqb1VPaDhTdlV4MkpQOVNEcVBoQnhPMk9O?=
 =?utf-8?B?TWsyWlpjYWJZSWRvNmlSMytxZDRxWWRjNUFJTjRQRjlnOTVIdTZQNVRmNXNX?=
 =?utf-8?B?VnUyNHFobENmYUJId2JMZTB5S0g0YlZkVUNuNGxKenFpTml1UThnZXlndmRD?=
 =?utf-8?B?NXBJaUVJWlBxMFhwSks4ZWpLUnZoYzNtK0RkMjZJenhhVXNQMDVwN0hkS3pC?=
 =?utf-8?B?Q3VVak1FeUd6OEFWSUlhdzZwdEpBQUhSdXlNVTNBaFRFcEk1UzcvNDB2UFc2?=
 =?utf-8?B?aGN0Wi81M0hHektMcjNGNnBMaGJyMlIxczQyL0wyeWMwcW40aSsxTG80UkNy?=
 =?utf-8?B?dzBTd2lYN0FETlRkR0hlL2tMZDNyL0xqUWF6M1ZRL1BJSGRkM3oxR3ZDQVJz?=
 =?utf-8?B?NFB3clZ6KzVCTk13WGl4ejlNRUwwQ09sdTBPK1ZCV0U0UTIwT2loOCthMnhn?=
 =?utf-8?B?bWg2SmN3eGdORkVmdk1hbytieG5NNkx1eVNzM0poRlVxNzYxMGd4V250NDRn?=
 =?utf-8?B?K0dqdVd5UW80NDVNclJtVEUwMjJxenRRNExaU1Fkb0M2K251cVBFU3FWUFho?=
 =?utf-8?B?eTBlMG9TaXhaUGFpU3E2anU4RGtIakNlK01CNEoyOGhwZDBXenNpNk9TV2Rq?=
 =?utf-8?B?WkcwTjFFS1RJb2o5Z0dzSjBNWndVR3U2eU10cjRHTWRSTWdqU1RhVyt3SVAw?=
 =?utf-8?B?L3dWSnpiVEE4ZjBaQ1VsT3d5UUdDdTcvY09TUjA0aHBZNHJhQ2NXby9COUZ1?=
 =?utf-8?B?bC9oUVdOSmNFVVFjeGowTm9sTDZGZnZidzdROHpubEpiL2V0M2xsWTIrN1Vj?=
 =?utf-8?B?MWtaSVlyb2tsYnBpKzY3VFJFQVlYdVcxQnRyNEpPMTh1UC82S1hRcC9QaTB6?=
 =?utf-8?B?bDZ5UTYzbGpSQXpWcU9OOTlGK3pJZTFzWmpMR3BuNzJuTzhhWi9CdnZUNi93?=
 =?utf-8?Q?WLq1YSp9D+oBKjoORhO3vLtRT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <691BF11F7EF20547B1B6B44D1CA62712@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ucznwz8MNYXbyOvFxtvwMAp5bOlAerPMAYeeOhgaOuFvCVVYVVMR3yy1HkQ6woXyYAMmaWxVLCfqzzo+LFUXe6cnuqY2HipBOk2x5ceWPT7B2d8/Uw3DQpfIpOt7HM49MTyS0UN6B36ZueTFaw6/p1RDy7IcWRq24iAObPDVHYAsvJBhywC8TKM55S9JZZETwTwuOXVcjBkzpMjRhbluTC+V7/ZIpQHGXdS37wv/O0LqnEtOh/YoxkIFBQwd6DSH9fMCoL6qyB4MpwM92jWyx9klHJnGZQKWYoyBtMuxIzEq9JWcCGwBaoqhUbEOU1MSaIDkQkB/w/yNJobe2fN/grJJbAG5d/6zgnrq/afKTcJWjhEOGYc2bDUlCDeYfzAoIQaHoF3z0Xi1V6URh0Hz6hMGUKtZppCiyiD/sbmOPiiqIIptcKqhnU3k8arRNq3fmlMB3ij7edNlSoVtNuVUr5iwcHMxxhdsgAiX8t7cl8XuJUqsEn5xkSGdnHGz9QbyOYW09SXxwiXBhnoD/kwLATW/OWnT1fmSI54hO2PDR9R1QA5rFiaFHFG9Ui7rwCNRGCIOK1XBQ8d/tDGGEo7jD2vUCRuhzXjpC3BmvHYCjmDZ3sd54U/uy8J3nXCnEHfJ840KbErzS9pxI50yzYWIFh6pvXZB1AUiHMx5FUzdI743JNiIKfL4PxU24zskaLlig94Bki9BxznyDPs6Bjekd1e6a5lxajmbx7hMnb+XzQr4cOuZkDMngiKtFRcguolsT3mqfto6u9SOGPyQyZP454juzl0IQ4B9yp8cw8HHI7x3s6HU0rAOpvWhdEIjHj+Fg5hF4qiAUm1sEO2X+fdCeM8amr5+mlcOGtqrhbWfnW/1AsW+xh4awO0SwJ6R8Jn6nIRRfzKZzHenrbJX2SqKGg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c99169-2b1d-4d5a-d25e-08dafafb6733
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 15:31:30.1374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xY5AcjoS56qWKi6xX9wIo1X2NtjhWHEGT6/5FH8Rqmfsr2cXDFWB7IWNyvS1ye2IlB/Bbov7Vf4yrlzkRbL7ddTsG6AJTSNT4CoXOYdtLz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5412

T24gMjAvMDEvMjAyMyAyOjU5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4NCg0K
VGhlcmUncyBzb21lIHN0dWZmIGluIGhlcmUgd2hpY2ggaXMgbm90IFJJU0NWLXNwZWNpZmljLsKg
IFdlIHJlYWxseSB3YW50DQp0byBkZWR1cCB3aXRoIHRoZSBvdGhlciBhcmNoaXRlY3R1cmVzIGFu
ZCBtb3ZlIGludG8gY29tbW9uLg0KDQp+QW5kcmV3DQo=

