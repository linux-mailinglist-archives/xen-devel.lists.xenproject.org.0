Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449A350A0A0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310170.526853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWkw-0005Yk-UU; Thu, 21 Apr 2022 13:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310170.526853; Thu, 21 Apr 2022 13:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWkw-0005Wa-QA; Thu, 21 Apr 2022 13:21:58 +0000
Received: by outflank-mailman (input) for mailman id 310170;
 Thu, 21 Apr 2022 13:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhWku-0005Gk-Mb
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:21:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 029bfa40-c176-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:21:53 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 09:21:54 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3649.namprd03.prod.outlook.com (2603:10b6:406:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 13:21:53 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:21:53 +0000
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
X-Inumbo-ID: 029bfa40-c176-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650547315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3IGNZ+VfL0mt0x6amMhXSerxu1UgLXEzTKuf9OnMG/4=;
  b=Pbr2AQzLjRK3mzr6SgeNiYJk7Ti2dk5qwIUCeG1zIcCUruRrMRsMbw77
   k6hDzqU7ZPtNIhUALuxjiCy3KxRGMj2JKCQrZKLfyw6xEx2SoEXmeQKXA
   Zfy/a+e41XPXeLNh3gxjBSxzSAvbMrh5LhPNU07spNH6j/+AxonhOFzB1
   8=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 69628147
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wEJKo67y30ubgqHYVcnBbAxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 mofXD2FbvuDamahft5/a460o0wPuMCDm9RkSgo5qiE1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSfRgFwA7z9id8aaDV6STw5BbRCo43+dC3XXcy7lyUqclPK6tA3VgQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YGjF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2MJ9gjF/PZoi4TV5Fxo8IrnEOT0QebJTsBHkR+6l
 lv6zl2sV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/e5VafD21dFDpZMoV45IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:GmGl06vsuTN3uPJTRbBOB2uv7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPMs1NaZLXLbUQ6TQL2KgrGSpwEIdxefygcZ79
 YYT0EcMqyOMbEFt7ec3ODQKb9Jrri6GeKT9J/jJh9WPH1XgspbnmJE42igYy5LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUsEPpZmfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="69628147"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuSE/ALZgipOcoubIbKMxWWpUa/cMFsdouIFYVcITL/ios4ZD9CfHQLLCyfUnwL8g1CEbjatrvOwdCEfuFpWLrVIATX6uTz6t3YCB2+kqOLs1CFbotSNBK0HGO5jfMZUjNXVHwnte5KXiAPU6bvMBjFqdwfT18I85mfwOUXekX6ePCOCBI1wkQT0QrUb0taYp8r2qulx/kSeIV8CDInoeXuUiLhIJ6FcCYv9LKgwmcInzgf930bN9D359U9WAkWYd7RNJcyucucqcbuGo+/a3bdF+BLovOVCWAsvW1+2Pa8ZY0EZE99m+wZ4V6DDB9C5bfLI1Qxmim1aX98D6uTA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MplFUaOgPEc44piH8DIO1e3W6kPo2BvT4PdjJ9GUhPE=;
 b=jVeVuPjKTczt3lAsHs4Bpkw04JWa/WkcMeHXl7i4erFkPyLo8OXzA8QYjYfrpIFC2OGR4Vw3KQf3BzWXH4i5Rk9EatoT73GM8BJOp+1cM3pJUjkahXpnHwO5SooRaiK1BEaAOFkK9Lr4J5kp5xEITgcis783B9xk/Py9KlQtasPuh6+vaB0nIKYXJ0j74FszmRs9uF9ZJ7jaEjoX/zwhkphA4nQSN8QwGEv+J/gmQX3KiSVLSY48riYqlkl0E0RFTIZ+FEQcmFp7R45crmnxGH1UhCkMH9vkI5Q1SIqzTsd6lweOP2hiRVEk+5NFpX2De8KELWnjLsJFbDp5jFyOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MplFUaOgPEc44piH8DIO1e3W6kPo2BvT4PdjJ9GUhPE=;
 b=ib4J47h2/pybrx8wO+E5fzgg++JuNGHDUjT4lY1TlCEtx2lRmkPjFnp08D3QG5sWCCTVhnEIC661TCn3WosTTPQTDavmoDBaeD1ku2JT3QjxVT1vh662KDBm5ZrdEdY8PAQJeB5vWuZHZ1tXMRlhel663R/Z2EBqt7vOxf1J5ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 1/6] x86/ioapic: set disable hook for masking edge interrupts
Date: Thu, 21 Apr 2022 15:21:09 +0200
Message-Id: <20220421132114.35118-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421132114.35118-1-roger.pau@citrix.com>
References: <20220421132114.35118-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::9)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 161fdfa6-5af9-4ded-dfd1-08da2399e645
X-MS-TrafficTypeDiagnostic: BN7PR03MB3649:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB36495C921D6ACD0CFA89F1548FF49@BN7PR03MB3649.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bGhWpL3wjHR52MNL7jnHfNnqzjjuQg7qlczAlmzRalkN3+Ew5ngFNFks9yy3VSwTfbBsrpsOFDy6iQApMk/InP4FDXQkdtqUSeoXTQmGaXfzjVDU0Vfi4XtGLq35/cmZjpc5ulkZc9smBFr/MhPDKMwPptedHHyXS/PRoLS0mIG1WOoVjLmcK49KpqwkyhfA45n98TtQrxwTGH+pUJct6TRJJjTQcWxSg1tgH/2sUpo+pVJb9JYofmX1QQ6TOWNo6roQvaQ+XMSNJnXYhF5udHPaTBXRSxaaeEfnIBJPm5Nhp9vHlfii8TVU79l3EoYyUuueYuO8JVFOb1ct7BSYvmzL9/3uhy3hvmx/xJgJo63GACWgl5vIsLsZwXvq0UjIvWQJ0miP2MB7UIyFzR6y7su175Ewsa8oFaPo5gqzigTzTPPrbVbHqK4v6l6e1m6ALBVgQejoRu4EpD/1UB+yoAosWWRfSFgxqj5j3xQRebL+Ei8LNgClEbhWvSswxBSR8DnxT4OnllOFJaLpcLX7LswA7atwJSYj9L1ZC9IyHPOyUVLI2tahoUfh0wWNCr1KzOS/VD7E5Af9V3DmvQMQdp/kJSC99KgBG7qakFwL98tuuRBPKS16RlDQAHnJlsvO2B5BUpm4RCO9J5F+gL6Sfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6666004)(1076003)(6512007)(316002)(26005)(36756003)(54906003)(6916009)(2616005)(2906002)(6506007)(8676002)(4326008)(83380400001)(38100700002)(82960400001)(8936002)(66476007)(66556008)(66946007)(86362001)(6486002)(5660300002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wi9vbk9lNnZub3hKZkd5b2pyaGNONGVoeUxVUFNwUDVCajNQdVIvWis4bFg0?=
 =?utf-8?B?Zm9SM3lQOGJBZWlYR3hzZnBqMEpNalJxRlBaZWRNUTBYSkl3bXRxb09MeWY4?=
 =?utf-8?B?OStFam9TOFcvRC96YlFpYzRDQnVIdEtQcDB4WktCWGFFYXJ5RUpwT1NHczVw?=
 =?utf-8?B?Q2Z3bVJJVHJEbkloVEZtVzJobm5aNkt1cjhmVjl6QnhqMCswS2h1NzJKYmVp?=
 =?utf-8?B?cGNVbm1oVlNGVXlLUDR4cDdKYXVrWWsrV2gwTkVaelR5dEZGbjZaS1VHcC9M?=
 =?utf-8?B?Ym9zVitHMzV3WEg2OEV5ZHV3SnR6a1AxOWF3bjlWUVFhbElPaW9WUjczS2Ux?=
 =?utf-8?B?aExUbHZ1NXI0ZW1MTjZWWjVaTVAzNXl1M01sUERjbmRGWTFIUHRUNjZrV2pR?=
 =?utf-8?B?eVVKRkFHa0wyWWZrN2l4YkJBTElZSU51RmVmWnlySkFmeXdiOXhweFE5TktB?=
 =?utf-8?B?TGF6TzhrSVRGRURFZEtwNjVGQ3lXSVlGN0dWaXVWYXZ6UEQyS0diV0pHck1I?=
 =?utf-8?B?bDlmUGQ0bmwyTVVWVXBraFdXbVNodVo1NWRYUWJQaTlzemRaeTl6SDVVV1kv?=
 =?utf-8?B?dHdjRWNzUEpvK3RIa0VLd2swY3diTkIzdUxwaTRIUUhqQTRvL2tTcE1TRHdt?=
 =?utf-8?B?TDd1VVB3SjkyMDk0MzkzZC9FMnFRUXlabE9VVWI3d0RMeXY0N0h3c1hTd01T?=
 =?utf-8?B?RFNSdm8xQW5hSkxPdy9BTGV2NkQ5cXpMdWdBT2dCQVBPM3RBSFYyUkpYclMx?=
 =?utf-8?B?NFVyT1NnZEcyKzIvQ2dwQUhlTEJ3WWE0ZjhiZXEyK1hHUWQrWlVvUitKdEFH?=
 =?utf-8?B?b2t6UURZNzFTakc0NmE4MEkvNERUVUc0SlI5UlRkdTBvSXVTaXYrK1lISWx1?=
 =?utf-8?B?ekFqNHIzOEs1dXdudWZOS281K0ptYXNCYmsveERSN3RNUDZwUWFDT3A2RnBK?=
 =?utf-8?B?dFMvOXhXR1hWdkszOFNJRjBQbUVmVUZMZFc1M2VQOG53Znh4dHdvTVI3NlFX?=
 =?utf-8?B?WDdBM1ZRRHBISjh4OXhnNU1XQTNpOHFOeFBraTQzV0FEb0dMQzdvUGdhNDNv?=
 =?utf-8?B?ZTZRZjArM1JHejkrVjNDR050d1A1Rnc2TWszTGJwMHE3UTZiK1hoR09OUHJG?=
 =?utf-8?B?UU0yZW9QK09tYmVvY0loeFhTbklmSlQwV2JNeU5NMWtjbEFlWGVPeDF4aEZZ?=
 =?utf-8?B?bFBjOFlhK2FsdkxEUUJrbk4xQlJQT3ViYXNBMTBDaFlFblIvZEZ6QWpTSXU2?=
 =?utf-8?B?dFQ3S0hqWlZRRXZabnRpMVpPaGtiQU9ZN0ltV04xOXpIK09KQWJFaTZpQjE2?=
 =?utf-8?B?alNTeno2QzdhbGtMa3lkMFZLRituRXl0bGVER1J0Ykt5ZDUzUFlkQnRJUlFO?=
 =?utf-8?B?bkE0MzQxbDB2ZHZhYkk1S1BCQ2FvbWVpNjB5QWdyb0huNm14N2dmSHFGWmdO?=
 =?utf-8?B?Q3B5UUxFdElMSk0wVjFvMTd3SUJIMytPTE51RW1pWlZzQVNWbUdEYnpuNXZS?=
 =?utf-8?B?M213WnJmaVlVYkFQYjlrZUNVU21rQTMvcytjcG9PSSt3Rk5Wdjh3dTVtc25t?=
 =?utf-8?B?SC94cCtreDJpTGhxUWhRUUpMb2k5Z09BYnRod29lNzBRejMzclAvR0xzSjhh?=
 =?utf-8?B?NEh5YnVFK2FqVVJ2d2NLRzc5M0JuY01jVEZkVEx4VEpjb2lWTU1EckN2TCsx?=
 =?utf-8?B?RlNHYWdJaDV5RU1aOER4UTcveFpSMVJjNk5TYU5ROUR5ZitLdzdWcjlQU0lm?=
 =?utf-8?B?eExyUjZtUHU5QXAvaC9Fb1hQT0NsZVdnZXh1NFFhc0hYR1p2eTdRR2ZkYmc2?=
 =?utf-8?B?N0pxbTM2MVBNYU0xMUdKVTJFRDFUQ1FNdFVKTDBWb3FDTzgwaXpLZUo2RnNK?=
 =?utf-8?B?TFFRa0d1YjBjMFY3bDlZVW5HTVRLTjVUcXRrZWl4eTVlZU8zckdzYTM5WkJZ?=
 =?utf-8?B?RWxDQWpKY2ZKdkJVSm41QUVPa3V3RTdMU2FCYkhQVWpnelBURGNHRW51WHVG?=
 =?utf-8?B?WGhpblZGMXU5dUNxOHZUZ0p3U2dkWlRLQTV1Q3BaV2lrYUlZQnIzM2UvLzBu?=
 =?utf-8?B?ZVlJV3p4WFovcnJsejVFcStnNEI0ZGdRVllOUWNPbHR1RzVTYWp4T0lEK3Nv?=
 =?utf-8?B?cTZoM1ZDVWZydldLUzdSOTFFVHV5SGthN2RkYmtnWmp3U3M5aDlnU3BKelUw?=
 =?utf-8?B?Y2dmZnE5dUllY1RhYnM5SXV2NWFTeDJEdzMvcDQycXlKQzdFK0dOMXZZSWxq?=
 =?utf-8?B?V2NKazB6N1h5ZjlCYm5Ca25vamxpSEdGZ0Mva2xhV0JBZnZOK2ZOOTRsdktp?=
 =?utf-8?B?RkdmVjRTZmtLSENZUEF3TXZZRkJLUWttclVtRnJUZVNEM0E3bEd6dEhVSHFq?=
 =?utf-8?Q?zWWbFLyg938mPSiY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161fdfa6-5af9-4ded-dfd1-08da2399e645
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:21:52.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cF16NhysOp9sAQaW14Y9M8OnJ0cZZzvZfHBSZhN90sdvHr8XAT1LHWF0re7NKCI9jGJ8M2UCfbWzJ1CdvPneyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3649

Allow disabling (masking) IO-APIC pins set to edge trigger mode.  This
is required in order to safely migrate such interrupts between CPUs,
as the write to update the IO-APIC RTE (or the IRTE) is not done
atomically, so there's a window where there's a mismatch between the
destination CPU and the vector:

(XEN) CPU1: No irq handler for vector b5 (IRQ -11, LAPIC)
(XEN) IRQ10 a=0002[0002,0008] v=bd[b5] t=IO-APIC-edge s=00000030

The main risk with masking edge triggered interrupts is losing them,
but getting them injected while in the process of updating the RTE is
equally harmful as the interrupts gets lost anyway.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c086f40f63..2e5964640b 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1782,7 +1782,7 @@ static hw_irq_controller ioapic_edge_type = {
     .startup 	= startup_edge_ioapic_irq,
     .shutdown 	= irq_shutdown_none,
     .enable 	= unmask_IO_APIC_irq,
-    .disable 	= irq_disable_none,
+    .disable 	= mask_IO_APIC_irq,
     .ack 		= ack_edge_ioapic_irq,
     .set_affinity 	= set_ioapic_affinity_irq,
 };
-- 
2.35.1


