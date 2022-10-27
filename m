Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB076101D0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 21:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431188.683880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo8hB-0008Q8-Co; Thu, 27 Oct 2022 19:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431188.683880; Thu, 27 Oct 2022 19:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo8hB-0008Nt-92; Thu, 27 Oct 2022 19:37:41 +0000
Received: by outflank-mailman (input) for mailman id 431188;
 Thu, 27 Oct 2022 19:37:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmgS=24=citrix.com=prvs=2926947f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oo8h9-0008Nn-8R
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 19:37:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6c010e-562e-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 21:37:35 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Oct 2022 15:37:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5335.namprd03.prod.outlook.com (2603:10b6:610:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 27 Oct
 2022 19:37:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 19:37:20 +0000
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
X-Inumbo-ID: cd6c010e-562e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666899455;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=f1BXe0ubGZbIk1FGJFtnHrxTWNaUlcWBAyux02VQSfg=;
  b=INXqkuDw+dSVdBa0jXsmw7f/1nq4u4L/nRmuEryaTjA/5dRWfO73BTdL
   1EWAhOy9ux5gI6HCXxyXgNT1ErtMSpRK9AZfL4W4rUDF5wLC4GdNPgUrt
   vkjlvkemf6cuQC1U9rI4axmbJRZGhEANWaezQ8h5r33kUyp6IMbN56J7w
   E=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 82759317
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/79RFK+w+Wu7GNgWh6OiDrUDd3+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GUeUT2EbPuOZDOhedh1YI6z9E4OuZ+GxoAyTFdprCs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5ANmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vxqLTxK/
 OA1EQlTRT7ehsys35nlT/Y506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeLpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efx3ymCdlLS9VU8NZAsQeZhXwOLSQ2RHKUmtS7lWKeAMtmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpdMYrssQ2Tzsty
 hqFks3kARRgt7qaTX+S7LCJtSj0Mi8QRUcAbyIZSQoO4/H4vZo+yBnIS75LE7SklcH0EDe2w
 z2AoSwW3LAfgMRN3KK+lXjLmympp4TJZgct6x/LQ3m+6QdkeI+iYZfu4l/ehcusN66cR1iF+
 XQBxc6X6blUCYnXzXPVBuIQALuu+vCJdiXGhkJiFIUg8DLr/GO/eYdX43d1I0IB3ts4RAIFq
 XT74Wt5jKK/9lPzBUOrS+pd0/gX8JU=
IronPort-HdrOrdr: A9a23:R++vBK3icO3b1UXeqLwjZwqjBQVyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4OxpOMG7MBDhHQYc2/hbAV7QZnifhILOFvAp0WKC+UypJ8SazIJgPM
 hbAs9D4bHLbGSS7vyKrTVQcexQpuVvmZrA7Yix854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+wg+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRhOerRfb8y/T9GA+cyTpAV74RGYFqewpF5d1H3Wxa0O
 UkZS1Qe/ibpUmhOV1d6iGdoDUImAxekUMKj2XozUcL6PaJOA7TQaB69P9kWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5z2JSFcZ4JsuZkZkIP8jQa4UqZZa8FJeEZ8GEi6/4Ic7EP
 N2BMWZ4PpNa1uVY33Qo2EqmbWXLz0ONwbDRlJHtt2e0jBQknw8x0wExNYHlnNF8J4mUZFL6+
 nNL6wtnrBTSc0da757GY46ML2KI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw/+2ucIxg9upBpH
 0AaiIqiYcfQTOeNSTV5uw1zvnkehTCYR39jsdD+pN+prrwALL2LCzrciFfr/ed
X-IronPort-AV: E=Sophos;i="5.95,218,1661832000"; 
   d="scan'208";a="82759317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cv0Dl6JeifO8wIv9FSF/cIqpwukC3IkodiYf7RxIue8hP4zAyw6L6Ki2q4knZvoePPeoXpz+kEFQSSUteNwKAlHYRUKY86IUQ2Vn2r/2CS/o/8VtrVVWsMK6ViSyNti05TB4RqvxaOrW7YtPAAMEyUn/72XCz4IPMPKPHjM4D8ewt+E/UKokFkNfxGSyfGE21OhYGoajf/H7WyBsz7/o8CZSvMZw3hQWmY4vQ5A8Osb3q5lKvT1Wb4e1B++DD2flDP0HlVOik6D0qykXkA9hSrQvGY/SmEnRaWfL8vU8UJdmbRbGnobxvTILGDw/bWA3N0WXbEMh98iKq/lsPKWEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1BXe0ubGZbIk1FGJFtnHrxTWNaUlcWBAyux02VQSfg=;
 b=gsRGPsrl+ZH/1oGuroNQqh6WJGwTZdj3iRMPcyORFohe5DW8jugEsJGPKx3s5ZRHlEgGHlks7be+EcwS57YTOFNtG+JQKRBGQohD9fO0w3lF3+zFHBOUwwKpkZzSnmebtYlzzod/KuUlG01+BhN1yjSYk/svZ8mgRcanuy7dz08MTFyXkPyUKN+/pEyOJt5tarEuUDxzRwwsC91fTinF0ocUdP2KSplxH4U6Icef84czNUZRD+gYCoybDkA3+FH5mNeqVa2lNV9gYm9dy6JCyxhQhA/JWhnsExWx1gkr7/F0oqH4DN8272BfQx9YQVuQMtyBlDkPnhSEu6g52j/kWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1BXe0ubGZbIk1FGJFtnHrxTWNaUlcWBAyux02VQSfg=;
 b=vN9aNIi64w2V3COHX6Z9wY546POFf5pojj8CYFjTqyjnVsWk1Rm/x1nqyXuZrA7ulB3Ne9T8IrV4WWb8zEQ2MMw+EJ2y4jwQIi2lwdy3h8yqOIpNS2U9EhvTK61vYLV5630pAdE6aB6WX+DDxPZxmCpRdrCiHgV1Aqd6wBTHl3M=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	"trenchboot-devel@googlegroups.com" <trenchboot-devel@googlegroups.com>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Krystian Hebel <krystian.hebel@3mdeb.com>, Daniel Smith
	<dpsmith@apertussolutions.com>
Subject: Xen vs Trenchboot: TXT AP bringup
Thread-Topic: Xen vs Trenchboot: TXT AP bringup
Thread-Index: AQHY6juH8lNOUE9lmEK2XF+extU0lQ==
Date: Thu, 27 Oct 2022 19:37:20 +0000
Message-ID: <6ccbcaf7-29f4-6477-2f1f-0aa4de64e8c3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5335:EE_
x-ms-office365-filtering-correlation-id: 3dd94bc2-e973-4c2d-0756-08dab852aa29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ts9O9Q/lQqFLnnklC5fh2Crbmq5arNWDwe4gyvlI2Ygs/Bo2tiyFbKQzpnddJo9CJCfVuX13RstgzP7QtfPWPtso2ANd348zetMgO2cCYyK8AFaAGQB3gV6Xs9r3B7EslHAIf4jLxRlOUEjRErenq2GwPy+bWsC4iWUv6eo40WRDLK9dZsHrBrufAm83rbb7p94QnoXpDJYaEO6hSf0s9PWIbmrgnbDkzP8VNT7lWz/SrHGZWlcWH0ZpDWiP1Agp3OVG6rvsNFb7y1kK8wVOG4JJpIZvFC/7to3sMWkFKMr5M7RAW2tb2stso5iX4OCGCGGrBmn+a8AASNbIL7Za6wmAIowlmeDiH6u8XMNknNseWAdL1TSHEIuKlUq9R++lfimI1c8ekz4aKvqDvII46pXOlCpTIleFOxE0MQ+zTIfwr147TT0+pVnGuQFa1mJixfrQjq4/q/aNvXdKCryz9wwvH7PGnPuwopRI8MN0fDeNT+tNo7UQGDgXI70R3kcXalS8ehUAIw3ZGBG0vljLBa5jDRypYf8lPb0osgOclPrsJEZBrh4MJaIO9pmmDNDJbJROVhOCmi+95L347c7nC6ODsThnLJxQea4OSa2JyHpVZ++OEDbHBfHXISnk9/kw6ffjWv3ufEKQvS/JQgkLyp+DeeXQzpC3QL6OtvEUAHSJ8koojNiTeMRyK64OfDZQN5jFMQpUNK/k5UlXohgswLnNqB/VfzBx76ZDnqiIIZvoKLHryQbsOaKtS7/xXJK9K0V0eNhaHOWPNu9/L94l3nmnGCI7RC1T5zEcQ8lNx6u5q+wSp38HPuoAmb3dzHNgtFX0kzwW5BC7/lHPj5g9Zw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(66476007)(316002)(110136005)(54906003)(5660300002)(2616005)(2906002)(4326008)(86362001)(6506007)(186003)(8936002)(66946007)(36756003)(76116006)(64756008)(8676002)(26005)(6512007)(82960400001)(66556008)(66446008)(83380400001)(91956017)(31696002)(41300700001)(478600001)(122000001)(38100700002)(6486002)(71200400001)(31686004)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1dmVG9aWHJ2aGRLK0ZrUlNqMENNNDZZQzdwdkFSQ0xtYzg4bU9oWll6VFRa?=
 =?utf-8?B?VU42ZkpHWVNzTFVaTVBQTi9aZXIwUnFiWlZMVHJhb0ZENVdNTHI3UUY1cGJF?=
 =?utf-8?B?cGZtSzVxaUxMemtjNjRxYU05VC9wcmxKbURiYVhuc1JMM0FsUlNYemNKQThQ?=
 =?utf-8?B?T2RxaVk2MUVUUlFIandWaHJsejVKamc1b0plUXNwcDBQYVhOTzZsN05VMldR?=
 =?utf-8?B?SFBLSjdPRk1uWUZZcm9QTy8wME1sWklWcWw4UnlzN2YzWTVPUnpETHZHMFJq?=
 =?utf-8?B?aEZQN2M5d2VWZWZvM0dWWGtZODdtYU5HM0wvMXIvSFdkM3hLNVIrNVM1bGFR?=
 =?utf-8?B?VGgrSmlIL0s5M2JzNDhTVTVlRWdrZXFyVWUwdXhRNHpYRTc4ejFvZE1VOUE0?=
 =?utf-8?B?VUtEcllrUUxRYlpDSUt6cjNqL3AzNFRQNDBoTkZHajZiN3VoUU5hM2VvZzRX?=
 =?utf-8?B?cHlFNVhoV1A0cm5HbGVEUkxlVlRGaFZESTVPR0lUYkM2aFZscFRUSVdUY3Ev?=
 =?utf-8?B?VWpnYnpyWlBYNE9SMWZ0TWxLcU0yQ04ycmZqcDA1K0wrMWFQMWd1dEV6QUdq?=
 =?utf-8?B?RFRyR0pVcDViUHpwMjRNSk53QkkvUlNoYktGeERNS0pzc2N1YVFFVnhJTkJw?=
 =?utf-8?B?UnpiR1diLzJOWVRhZ1NZWWg2Z1pRN1Nhb2RuWGhqdTd4U08vQVZSQVlJMTky?=
 =?utf-8?B?ZEZ6Z0tvTDZjQXNWN2NDVXdJTDAyTy92UlVxODFNTGNIZFhHU1BnbGk3QVNO?=
 =?utf-8?B?cEx5bjVOWGFnc1hnQkwyRmxnR1hsSXJlV1NrdEVEa0JMU2VzWFdwem5YQytR?=
 =?utf-8?B?bVk4dmsvOHA0TDFJNkRwQm1ITXRoamhqYWg1aVhTdUx5bHQzU1VFMzZQcTRj?=
 =?utf-8?B?bUgzOUIydFBtUTJ1c2FpbEJLS0ZCVXZnQS9MaytneVRSMkpEdEVUM1ZzNXQv?=
 =?utf-8?B?TzdaZXhVYk9HNStWVElwSGpic0dzck5ieUdYNm5BOUZ1UjBialB2aENMZlJ2?=
 =?utf-8?B?ekUwQWorcGpweFhHYjdXeEZOZnNrVTlod3ZhdE50YmE4UFhQQWRSeG41N0FM?=
 =?utf-8?B?NU83ZGhxS29pai9jaXAxcUFOOHZrR3RtSjlvRkdVMktpQXAwOUtoOXMySUF2?=
 =?utf-8?B?TFVHOExNUjRCb2ZTbnhnTXdUNTN6eFlKZEtib1dWWnpZWHo4blZVZmtyNVpp?=
 =?utf-8?B?dmc5WG5ZSmJUQ0Uvb2VHSmN3aFBTY25CNklZc1Z1OWMyZzUxV3UvNzUzTWVq?=
 =?utf-8?B?cmNrazREOGVGRGptemxqcXFFa2YxK0ZjTmN0LzZUeEVwMk50dkdNRWVGT05a?=
 =?utf-8?B?NnNucjZiTEZROUpKTU9rZHJYS1o2L1F6bGkxRXNVaHRuMWg4Y1pxSGQ0YjFE?=
 =?utf-8?B?Mjh1SmdCMWh2anJlVW5UUUp3U3dqSlo4QjRRYnhBZHpEdE5Lc29xd245T3Q4?=
 =?utf-8?B?U0RrMFdaR2dkR2hFR2RadnNFWXJycU9pcmZ6WDRFa0pSTFNMWk9ueXo2MmJq?=
 =?utf-8?B?c1FnSlRGd0lIdmp6NXFnYU9mRWpIdWZQZUwwMnFic3l0K3dtNmFqbzkzMzNB?=
 =?utf-8?B?KzZsUkozTG1rbXhZNUZEbEtPNld1RjhDZUNNQ2hwUkZwN3ZaajFmNzFGVUsy?=
 =?utf-8?B?OG9odmpQRnA0MC9HRk4ydXV6QzhtQkJNVXlxWEtjd0k5Q25hcFJhNE1jdFJW?=
 =?utf-8?B?U2FKbVZuSld2c1NncTdKbDZMaU1UeXlIYlpSYnBCWGRYRkNqZENZYkg0SEhI?=
 =?utf-8?B?NnZnWE9CcjFCTlFBazR0Zzk1RmVtOTBMMWdIRHpXTTBudVVVT0tmT29yWFBx?=
 =?utf-8?B?TFM4OVpwbjI1SkJWZ1RITW51WDFwSFl6STNwbWV3NU9LS1VrendEZDhzaHdG?=
 =?utf-8?B?NHM3MGFSRlZuL21BNWxIWkYybG0vUlFqSTFGVlZqRlo3ZFdrSkJyTk0zWDRK?=
 =?utf-8?B?MkpiT1MwcHBvckFReTVibk1DcWdpdHo2QVJxR1F3Zi9VaXFrN1VQbXlNR2h1?=
 =?utf-8?B?MkNoZklteDliOWV4cGovbWpKVDBvTXM2TGQwV3lkcEdRcGJ4UFRNYXgxRHBk?=
 =?utf-8?B?ZSt3TmlaQ1RBT29BZWt6NUk2eU9Lc2JLRFZUckV1WXBLVVkyTDI4cHpkTm9a?=
 =?utf-8?Q?Ce5lKe79LzxHRrREqC21iI1Pk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AA083771A7B9A46B04629610E2DBEFC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd94bc2-e973-4c2d-0756-08dab852aa29
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 19:37:20.7366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iueD6xWFfgk+hVMLwmoeHEGs8Pqnlz9EkRDXvMzfc9woEGk+YDlyx6mmyZW4JVbO/o4Hum7pchmcWj4WLZefSeX9Qw+IjdnoRPfJXEQWE5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5335

SGVsbG8sDQoNCktyeXN0aWFuIGlzIHdvcmtpbmcgb24gdGhlIG5leHQgYml0IG9mIHRoZSBUcmVu
Y2hib290IHByb2plY3QncyBwbGFucywNCnNwZWNpZmljYWxseSBnZXR0aW5nIFhlbiBhYmxlIHRv
IG9wZXJhdGUgd2l0aCBUWFQgZGlyZWN0bHkgKGkuZS4gd2l0aG91dA0KdGJvb3QgaW4gdGhlIG1p
ZGRsZSkuDQoNClRoZSB3YXkgVFhUIHJlbGVhc2VzIEFQcyBiYWNrIHRvIHRoZSBCU1AgaXMgY2F1
c2luZyBzb21lIGZ1bi7CoCBBbGwgQVBzDQpyZWxlYXNlIHNpbXVsdGFuZW91c2x5LCBhdCBhIHBv
aW50IG9mIHRoZSBCU1AncyBjaG9vc2luZy7CoCAoU0RNIFZvbDIgNi4yKQ0KDQpXaGlsZSB0aGUg
QVBzIGRvIHJlbGVhc2UgaW4gMzJiaXQgZmxhdCB1bnBhZ2VkIG1vZGUgKHNvIG11Y2ggbmljZXIg
dGhhbg0KMTZiaXQgbW9kZSksIGl0IGlzIHN0aWxsIGluaGVyZW50bHkgYSBwYXJhbGxlbCBib290
LCBhbmQgdGhlIEFQSUNfSUQgaXMNCnRoZSBvbmx5IHNlbnNpYmxlIHBpZWNlIG9mIHVuaXF1ZWx5
IGlkZW50aWZ5aW5nIGluZm9ybWF0aW9uLg0KDQoNClRoZSBzaW1wbGUgYm9kZ2UgaXMgcHJvYmFi
bHkgdG8gaGF2ZSBhIHZhcmlhYmxlIHNpbWlsYXIgdG8gc21wYm9vdCdzDQpib290aW5nX2NwdSwg
d2hlcmUgYWxsIEFQcyBzcGluIHVudGlsIHRoZXkgZmluZCB0aGVpciBvd24gQVBJQ19JRC7CoCBU
aGlzDQpzZXJpYWxpc2VzIHRoZSBBUHMgYXJvdW5kIHRoZSBleGlzdGluZyBib290IHNlcXVlbmNl
Lg0KDQoNCkhvd2V2ZXIsIHdlJ3JlIGFsc28gdmVyeSBjbG9zZSB0byBzdXBwb3J0aW5nIHBhcmFs
bGVsIGJvb3QuwqAgVGhlDQpzZXJpYWxpc2luZyBwb2ludCB3ZSBjdXJyZW50bHkgaGF2ZSBpcyBf
X2hpZ2hfc3RhcnQgbG9hZGluZyAlcnNwIGZyb20NCnN0YWNrX3N0YXJ0LCBiZWNhdXNlIHRoYXQn
cyBhIHNpbmdsZSBwb2ludGVyIGFkanVzdGVkIGJ5IGRvX2Jvb3RfY3B1KCkuwqANCkV2ZXJ5dGhp
bmcgZWxzZSwgZXZlbiB0aGUgcHJvY2Vzc29yJ3MgaWRlYSBvZiBYZW4ncyBDUFUgaWQgaXMgZGVy
aXZlZA0KZnJvbSB0aGUgc3RhY2s7IHNwZWNpZmljYWxseSBpbiB0aGUgY3B1X2luZm8gYmxvY2sg
b24gdGhlIHRvcCBvZiB0aGUNCnN0YWNrLCB3aGljaCBpcyBwcmVwYXJlZCBieSB0aGUgQlNQLg0K
DQpBbGwgd2UgbmVlZCB0byBkbyBmdWxsIHBhcmFsbGVsIGJvb3QgaXMgYW4gYXJyYXkgbWFwcGlu
ZyBBUElDX0lEIC0+IFhlbg0KQ1BVIGluZGV4LsKgIFRoZSBBUCBib290IHBhdGggZG9lc24ndCB1
c2UgdGhlIHRyYW1wb2xpbmUgc3RhY2sgYXQgYWxsLsKgDQpHaXZlbiBzb21lIHdheSBvZiB0cmFu
c2Zvcm1pbmcgQVBJQ19JRCBpbnRvIGEgWGVuIENQVSBpbmRleCwgdGhlIEFQcw0KY291bGQgcHVs
bCB0aGVpciBzdGFjayBwb2ludGVyIHN0cmFpZ2h0IG91dCBvZiB0aGUgc3RhY2tfYmFzZXNbXSBh
cnJheS7CoA0KVGhpcyB3b3VsZCBhbGxvdyB1cyBpbiB0aGUgZ2VuZXJhbCBjYXNlIHRvIGJvb3Qg
QVBzIHVzaW5nIGFuDQphbGwtYnV0LXNlbGYgSU5JVC1TSVBJLVNJUEkuwqAgKFRoaXMgaXMgaG93
IGZpcm13YXJlIGRvZXMgQVAgYnJpbmd1cCBhbnl3YXkuKQ0KDQoNClRob3VnaHRzP8KgIEluIHBh
cnRpY3VsYXIsIGlzIHRoZXJlIGFuIG9idmlvdXMgb3B0aW9uIEkndmUgbWlzc2VkWzFdPw0KDQp+
QW5kcmV3DQoNClsxXSBUaGVyZSBpcyBhbm90aGVyIHdheSBvZiBkb2luZyB0aGlzIHdpdGggbXVs
dGlwbGUgY29waWVzIG9mIHRoZSBBUA0KdHJhbXBvbGluZSBhdCBkaWZmZXJlbnQgcG9zaXRpb25z
LCB3aGVyZSB0cmFtcG9saW5lX3JlYWxtb2RlX2VudHJ5KCkgY2FuDQpkZXJpdmUgdGhlIFhlbiBD
UFUgSUQgZnJvbSAlY3MsIGJ1dCB0aGlzIGlzIGFscmVhZHkgaG9ycmlibGUgYW5kIGlzbid0IGEN
CnNlbnNpYmxlIGFwcHJvYWNoIHRvIGNvbnNpZGVyLg0K

