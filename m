Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4D851C256
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 16:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322166.543386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmcMh-0004V2-Ox; Thu, 05 May 2022 14:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322166.543386; Thu, 05 May 2022 14:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmcMh-0004S6-Lt; Thu, 05 May 2022 14:21:59 +0000
Received: by outflank-mailman (input) for mailman id 322166;
 Thu, 05 May 2022 14:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T22s=VN=citrix.com=prvs=11701087b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmcMf-0004Rk-Ve
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 14:21:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b67c7ad8-cc7e-11ec-a406-831a346695d4;
 Thu, 05 May 2022 16:21:56 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2022 10:21:53 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB4498.namprd03.prod.outlook.com (2603:10b6:408:8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 14:21:49 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 14:21:49 +0000
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
X-Inumbo-ID: b67c7ad8-cc7e-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651760516;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=FekeaUWBEPvsa1kauS8Lrvz0i2Fk/3Hn8bhVKZtxtdE=;
  b=RqM/MGXQ5doQxITtVIN6bLqEqdV50Q4xUFpqWoAdUq9PXUmcWwAZovsF
   6AT3XeozZIpJNkAuDibQxPz5OCftLkar8M1beHq7gUII5R/3Sui96NUCk
   sYF4naMwnuKVmKh9VqRutc1Mv2cNPUh9TjNd+Tl8N8oGBQtF7eqf20w8d
   0=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 70654682
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:idicdqiYzyTitl3z1BypOvv2X161fBEKZh0ujC45NGQN5FlHY01je
 htvD26EbqzfNzP0ft0iPNji/EhXuJ/Vz9RnSwRsqXs3Ey8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlvQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YS0XIZ2dl9kTbytdKz0uL6p42ubsfHfq5KR/z2WeG5ft69NHKRhseKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehWhp7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wrL+PZpszK7IApZ64bCHtmOZYC2f/pfvxqlr
 0SW8TrkDURPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzW6vXqFsxg0S9dWVeog52ml0bHI6gyUAmwFSD9pa9E8ssIyAzsw2
 TehgNfBFTFp9rqPRhqgGqy8qDqzPW0fKz8EbCpdFw8duYC8+cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtWuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:FG51960rgq1FmATMbQgXQwqjBVRyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8M3WBxB8baYOCCggeVxe5ZnO/fKlHbexEWldQtqJ
 uIDZIOb+EYZGIS5aia3ODRKadb/DDtytHMuQ6x9QYPcek8AJsQlDuRRzzrZXFedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0gU/LYr9PGuZr6aVpebiRXoTWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jc6r+4u/+25xfA3yv47ohQmvHm1txfbfb8/PQ9G3HJsEKFdY5hU7qNsHQcp/yu0k8jlJ
 32rxIpL61ImgHsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGppnYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuIoO5lbZvs3+9La1wUh4TsOscYa
 hT5YDnlb1rmGqhHjzkVjIF+q3tYpwxdi32MXTq9PblkAS+p0oJsHfw9PZv4kvoy6hNNaWsn9
 60VJiAtIs+O/P+PpgNcNvof6OMex3waCOJFl6uCnLaM4xCE07xivfMkcUIDaeRCdQ18Kc=
X-IronPort-AV: E=Sophos;i="5.91,201,1647316800"; 
   d="scan'208";a="70654682"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRTL7eEPp/pH1JOGaXI82hTPJz1Fvf1J/QI32WbabZM+BxEuydzceYYqpv/SUl3nbzNSwYFHzbC93h75qIHhW5CUIE9ebwvwyyNOoR1s/wga/n0jvpssaaMtnrFHZQ7pDvhYS4aCce+7YQoTEhts8KeYTRmG+K8Q/VOQNcMQHzbox38g+rNBeVUbGvnea91DIk4RNVxgZPUpC1oyRC/TNUc1K0VgQ366OkAQDUJAt0jVcaOe6S0zP/b0vMWRZzh5uvhnu7X8ltxNWbr1QlJivaUEzKVB/huMpYc9QBN1iPbsk+zqceINp4pLb7pMiF5ajSouxz5RR+VjTbsHqZqX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7MknCtDaFKJ46I5qllMrt5+TW3heupIj0BoyuJe41E=;
 b=jZOswFuX5NwWLWTngYUiEfb1utJZxRyLPAnsyJDUeZMYpP6CyY9XNmx3LCbIowxx4Tbzm+2bgUILLOkDN/l4HtA7IcuNH+5HN3vMsiQsOZNGAqvY5B+SZcBQvnZJkamm49kR6rwpMUhQnRBE6/L2/kAfA33gV6+n3hFGlBdOaKI7vDRbAik4SEmM2igfpgdTgWtoy9rgkuIA37bVGBtn/fqH7IUXANScQ3MpoP2f63Dl99XecxRfmsfemFa08Y8zJD6PTEEp97cnsV5A0AAlU35OfiabtpnRITExTLQdSL+bT/Ud4BiLU68rksoW68CkYPaHMwwzLho0rEFlQwjyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7MknCtDaFKJ46I5qllMrt5+TW3heupIj0BoyuJe41E=;
 b=GSvYv6+zO6THCRcuNxTdmtFgFAgpzflTsxFYpSSalruZj9DwJxkCQYrDk8Es/wNA7Hquatw8WKg8/vP3XJeFESkntHR/pTBoAtJ/pLgMiAvXKK3W13R8V0zwKNsPfwN5TCmRol+DCh+eW9xnC7o7UGQeK5k+JbkG8umpnevPlbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] build/xen: fix symbol generation with LLVM LD
Date: Thu,  5 May 2022 16:21:37 +0200
Message-Id: <20220505142137.51306-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0121.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e2d960a-0f95-42aa-81c6-08da2ea297e7
X-MS-TrafficTypeDiagnostic: BN7PR03MB4498:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB4498D893F69B813A664AC0548FC29@BN7PR03MB4498.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gkf6eW2m4rMsFoh+oCMtwBe+8cQgMBAil/ItSSWzByt0rFSXCVluH6pNpMZFCzLRM5Dv4O20aGfw1tJqDIjzKIrmqni24ZPBjxGiDT/jeG5ZVtbxBoMgcFfttdcJ/EUE/3j4p1eEJyjpjcDk2CpW82j2/rxVK2pJjSZ56mRKtrNZf6cRxgW+6YlFCMjPWumk55Z2gAJqlIHLmIc/uZcldmIjErBltKhXTsPRAnO8NQNwjsJSXEiJruCgrpLMPfch4+/SHL59aTzpbnKnMF6oZCX4QH5SyGBWw/kbdxJHfFkqIm6qfQamZLeIiSD7+pRjscunF+jzX51NSnU2VPL/N3EBSPUUFEKU8Y1NBB3xWZgi0bZ3sGgZ0JVX9txUB1llek+u1HkwwvBw+hftL+n2eCgphrEXkbzTge6JkOyXKRDYi0LO6Prk4XEH6qg6OuDQ3C0A0QzYXdeZ/sCmiOmRvzlseifv+syPfnVIDCQOOO1pu0L31+NDVDU1qcw3ryAsncmCOeE3qu9s1NnPFY5HpTBOtoIE4p88ISQhFlSM0E2xhvOFjaX3CB6YvLrtQk3e96vnOe1pVsLn1JJ8wY9pjOsiMbHe5gLqyZcJzjS1/yU7ASsonNxKYp+hEb9axqUKa8P9cJ2LKixZq+PucVz2Pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(4326008)(5660300002)(8936002)(1076003)(6486002)(6916009)(8676002)(6666004)(2906002)(66476007)(508600001)(66946007)(54906003)(66556008)(2616005)(38100700002)(6512007)(83380400001)(6506007)(26005)(186003)(316002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXhQdTNmVHY0SW1wQVJVNWtta2k3cHJnNWtZQkJiZkxEaFhXYVhIbEl0cWRF?=
 =?utf-8?B?aTZOeUFUOHpGbHBRS2VNbGZLRU16ZnFmekEvYmZiejYvRWltWGZacjFDcDU5?=
 =?utf-8?B?djB2ck5ENHdJZDlhaExibzV3ZmF5RGVQakdFbG5STkg5WjU5OWNzeGh2V0F6?=
 =?utf-8?B?LzlmNVJjTjlrOVlkSWhWeWREeHhTY3E2ZEdIRWRXVDFudWdhMkdBRllxMlN3?=
 =?utf-8?B?c0RXSDBlYVBxM0NMaVROMUJwaUFBUkVkLytpblQ2SFM1RzlNcW9iNlJqUEVZ?=
 =?utf-8?B?by9LWFVPdzc1a0dHV01Tc1RBcHBMZFhTeE56Q1RvZ1BzMFd4bHc0QWpSVTZy?=
 =?utf-8?B?ZEhBNXhaRThDYzBXdUhibHRtOXlvNUNBaFVHMlBVUXpJWEx5aFFwT0w3WnYz?=
 =?utf-8?B?Zk1OWThFUDBaMHhVbHVFZFhMNVpUTkxMb0cvRUhUcEZuTk5EUmF4TzRCT3NZ?=
 =?utf-8?B?WStQYXI4ZUE5aUhvbVBWYndvK1dacTRKcDYwUGh3M0FRRWdjeWFKNDUwOFVP?=
 =?utf-8?B?S3g1RW52bTRWZ05TTmMwRS9TN1JETWpvMXZNSGUxODF1eFh6ZDRNQnVKTXBP?=
 =?utf-8?B?eUFwSElZelQ2OWtxM1I1eitkT3FMM2crUVU0bk01UzBwYUxSd250aVpzbFB4?=
 =?utf-8?B?UytRdE12WEZOdlVhYit2dHZiVTFhQ3Y1TTFlODhsRmtpRlhiTWpRMTR1LzZJ?=
 =?utf-8?B?eXJGMm4yQmQ0WHBGdGo1a3JFbDlSdHlNRHZNRWQwbkNTcHhJODNLeHBwbTJ4?=
 =?utf-8?B?RnhqeFVnajVPM0RyQzNuYUxFT2lJU1Rqc1hVSVJEYUs0Slp4VlF1OVJ5NVY3?=
 =?utf-8?B?c2FSelltYm01L09IM1hObE1FRExhZVlzdUtBZUVSZUUxUlVjaVl4QkNyNFRw?=
 =?utf-8?B?NUZDZDVoYTN0RlF1Mm1wOXBCV2htdTFKQ3JsUHkwT3RMOWdkSkExSHdHWXVF?=
 =?utf-8?B?YUpQQ2hXR1R6aHREYXpldHRqRC9mK2UyVWhMQ0llU1VDUVlQQjBlT2kzTEsy?=
 =?utf-8?B?eEhTeW85U1VHVjdpK05rc3BqU0wrNktnS0V1Z3Y3a0V4QXpmY2Q4NlRsV3o3?=
 =?utf-8?B?ZkpIWmF4NEpkVXJGNnppRXc2Y21QT0Y2YUtCTElnNDh1SmVRNUQra0p1S2hp?=
 =?utf-8?B?ZFBWTXRBMEJjU3BBU1JZNDV6ZVRtdDBFaFlwN0NzMEdUcVQ1QlRxTUpESGtl?=
 =?utf-8?B?KzF4N3pETGJsUmtET0kxSnJtdm1XTTlseFEvaWF4Sm9wUnRabFpaeHh0YzVM?=
 =?utf-8?B?YXJYSmEwMXIwUjJPbTJ2eGdpY1RXOTN6Z1laaFVwS2o4Z0FqbzMzeElXbWRY?=
 =?utf-8?B?S2FTeW4yZVh2Z3pIMG56U0xtdGhHYndKUU1BSWJnOEZKVTB5QTVaUVBLeWJv?=
 =?utf-8?B?dEhJNUNKZWNqWDlzR2ZQcTBvaEJadGtGY0VsZDZ5R1lGdU56emxzckVrQ2ZN?=
 =?utf-8?B?cWE4ZGJJblN3Q2J3SG5MY016aVNucElBWWN1Vm1BemYrbDA4aG9wWlF5b2Jw?=
 =?utf-8?B?SUY5N3hVK2NHV2E5M0t2bjlCSUFIN0diQ1c0RFFBWTFVT3R1KzdYS2YyZDdI?=
 =?utf-8?B?MW9ORm8ySXYwVU82ZGhuR0tSSHl5N0ZlR0Q5alFWSUg4REV6NzBZOTZGeWFw?=
 =?utf-8?B?V0FSb09Dd082Q2R0MHVtSkVOa2tUQ3VjeURRc2JtU0l3eHMybnFqRmd1cTNY?=
 =?utf-8?B?ajl0ZVhqakJtT1pwNFFiZVI3NHN3WXZyUjJqSTZsUW5nNmcxODdub2cwV0RM?=
 =?utf-8?B?YlJkS25KVXlqZXBTcUZkNzZmL0pMYk1rUXViV3lWSUNhdVIrbWJHRnB3N1Fk?=
 =?utf-8?B?SkkxMzc5ajJxOFhnN0RzdUpiMm42QzQ4UDlDcDVjS01NZlN5RjIvUVhPejli?=
 =?utf-8?B?eDU5NTdaZG0zalNldS9yTUdITWZyTWh1N0FhdHMxazVxdUdZUHNwODdSMGFC?=
 =?utf-8?B?L2ZTaUczQ0NGRUNERWFkZ1hTWXNVV3M4YWNnTXRxRkx5WjlEQXdxUHM1TzVB?=
 =?utf-8?B?M1dKQmpaYXBpOHE5endwY2wxU0JQbkk0bno4d09LcGFPU0M3QjB1OVBldzhn?=
 =?utf-8?B?aG9Fa2NSMDZrYXI4NU1ITXR1dEd5S3JCU1QzSVhMbDhob0s3K0xjWSsxRVo1?=
 =?utf-8?B?d2dmeldaUVpOaEVrVW5pZzVDMUU2RWJhcUhpZ2dKRXdVVVl4Q21tN1RmcnJq?=
 =?utf-8?B?c1FjWEkwSndzbmVzS05pWUxhQlZCQUNXc0ZERGNPbHZQaW5nUjRHMDZocDZ6?=
 =?utf-8?B?ZlBpMnBPcmhHMXRIZWFIZ2licXVQNFlXUlp0NGlycXIrc0QyaHJkRzY1b01r?=
 =?utf-8?B?aU1VZnphc1hqLzJpMzBJR1dJQnpJUXZWVHBxYU9oMzFBSmVGeC9MeWRRZGJY?=
 =?utf-8?Q?GKyUZGPhIRyK7XeQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2d960a-0f95-42aa-81c6-08da2ea297e7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 14:21:49.6801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjbili7scbL6DcbTHaj51zBCZMtEZjABcjYQgxalOP3lQJcpI56M1827N+FnjEFT8QKAwJwO8dAgdPHtj16IZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4498

Current LLVM LD implementation will turn global hidden symbols in
object files into local ones when generating the .symtab of the Xen
binary image.

This is different from GNU ld implementation, that will only do the
conversion (or remove the symbols) when generation .dynsym but not
.symtab.  Such conversion breaks the processing of symbols done by
tools/symbols.

Use protected symbol visibility instead of hidden, as that preserves
the symbol binding while not generating GOT or PLT indirections that
are not compatible with some of the inline assembly constructs
currently used.

While there also make the visibility setting compiler support
non-optional: compilers not supporting it won't be able to build Xen
anyway, and will just throw a compiler error sooner rather than later
during the build.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Kconfig                | 4 ----
 xen/include/xen/compiler.h | 9 +++++----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 134e6e68ad..a9182fb13d 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -29,10 +29,6 @@ config LD_IS_GNU
 config LD_IS_LLVM
 	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
 
-# -fvisibility=hidden reduces -fpic cost, if it's available
-config CC_HAS_VISIBILITY_ATTRIBUTE
-	def_bool $(cc-option,-fvisibility=hidden)
-
 # Use -f{function,data}-sections compiler parameters
 config CC_SPLIT_SECTIONS
 	bool
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 933aec09a9..c144b17217 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -125,10 +125,11 @@
 #define __must_be_array(a) \
   BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
 
-#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
-/* Results in more efficient PIC code (no indirections through GOT or PLT). */
-#pragma GCC visibility push(hidden)
-#endif
+/*
+ * Results in more efficient PIC code (no indirections through GOT or PLT)
+ * and is also required by some of the assembly constructs.
+ */
+#pragma GCC visibility push(protected)
 
 /* Make the optimizer believe the variable can be manipulated arbitrarily. */
 #define OPTIMIZER_HIDE_VAR(var) __asm__ ( "" : "+g" (var) )
-- 
2.36.0


