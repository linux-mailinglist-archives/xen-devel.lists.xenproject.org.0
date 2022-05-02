Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35022517254
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 17:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318955.538976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXlZ-0000Yu-JC; Mon, 02 May 2022 15:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318955.538976; Mon, 02 May 2022 15:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlXlZ-0000Vu-Fn; Mon, 02 May 2022 15:15:13 +0000
Received: by outflank-mailman (input) for mailman id 318955;
 Mon, 02 May 2022 15:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=deGg=VK=citrix.com=prvs=114a22fc5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlXlX-0000Vo-9v
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 15:15:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a681fdcb-ca2a-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 17:15:09 +0200 (CEST)
Received: from mail-sn1anam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 11:15:05 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6427.namprd03.prod.outlook.com (2603:10b6:303:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 15:15:01 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 15:15:01 +0000
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
X-Inumbo-ID: a681fdcb-ca2a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651504509;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OaumsH4pUpLILf8R8+QY2ja3cVE+FYRIFWkVkZ52DAM=;
  b=aPJ+2DP1Sdu1FKG+utH+oJVSHVVtolvLAGwx2eK2Uj4VS19k6M0ViNim
   mjni0cpd4wrRfY+/ZcTxKr5nWeuztPAVYg97pX0Maty+8aiZO3FEKQQ6g
   6ao+UEdUNqFNhRNcaawfg27pLva5maCcvKsHHDuh2+oCCBb68cMxUJFKc
   c=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 69784172
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2oHZRaifANDKvLQzZJYhOkFSX161AxEKZh0ujC45NGQN5FlHY01je
 htvXW3VPPneNGryf4h+aI6y80MAscLRzdVqTAdp+C83Rngb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlvX4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSE5IJ3ote0vaCVzEzFFZvNP5uTbPVHq5KR/z2WeG5ft69NHKRlseLY+o6NwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIAegGhYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUG+Q3F+fNouQA/yiRYirjcKZn4YuebSNt2tG/G/
 DP23WPAV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWs1dA
 1wZ/DI0qqo//1DtScPyNyBUu1aBtx8YHsFWSuQ84QTVkK7MuV7FWS4DUyJLb8EguIkuXzs22
 1SVntTvQztyrLmSTnHb/bCRxd+vBRUowaY5TXdsZWM4DxPL+unfUjqnog5fLZOI
IronPort-HdrOrdr: A9a23:3CoNHqGmbTs7eHLTpLqFdZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAvhHP9OkPAs1NKZMDUO11HYSL2KgbGD/9SCIVyCygci79
 YGT0EWMrSZYzlHZK7BkXOF+r0bsby6Gc6T9ITjJyAHd3AQV0gs1XYONi+rVmlNACVWD5swE5
 SRouJBujqbYHwSKuC2HGMMUeTvr8DC0MuOW29POzcXrC21yR+44r/zFBaVmj8YTjN02L8ntU
 zIiRbw6KmPu+yyjjXcy2jQxZJLn8aJ8KoLOOW8zuwubhn8gAehY4psH5WEoTAOuemqrG0nld
 Hdyi1QSviaRxvqDxCIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8O1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh4LD3xHklXqvoIRiKqbzOSI
 JVfYHhDbdtABmnhknizyZSKIfGZAVxIv+EKnJyyPB9nQIm3kyR9HFou/D3rk1wiK7VdKM0md
 gsSp4Y8o2mbvVmGZ6VV91xNvdeNAT2MGLxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.91,192,1647316800"; 
   d="scan'208";a="69784172"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmefgUnPdUg2jrsMENZr+3G/6yq/vRPnbMyuvnNujZA7tl5Lfq3WRLlHeJBTm2ETesrRT/Qaj4Ae74DQxQ+l3IUOh3z6GaBkLoXnOfqsUrX8t6IH8H0O4TlNVImN+0p89xS24YC6usAczTWs06RZc4MAMfaPEasSB7gKQx4TaZ53cSJ9zxqZm5RDczB10yvsffkluu0U//T91ppypUv+kXPMhIgpbOsUL9OixiLGb6weiKJp5VUY41tUXeLtEViIYj9t1t2K3n82dOhtvbXw51j+gwuBUwuDFZeNcFBMi4uPzoo6SQtoL6FkyE6MUSACRmvkwAjOZKPc5EJv6UiSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIPzE6MBBJPrVnJjFXR5mX6/4Oe5Ot1ATMBz3yMGkyQ=;
 b=Yt8oDu+fWNunFoETUjdpMEsfhlTD0GZxAClgdyaKxJiNHhezJdzJxKifz+s/PFGcxqHbmaZDIc1cn7qhsHoZ/wWVzdWVwCaUeghSoLM29rz+5n9X8A1qAvqp+S09NrZ5qIi+nMrTDcAhglbZ/UvY0R7A6vlUlVzAjpS9AUwqoWwJBQPvME92YGUpL2RcCVsYsqJJs3GC5yw1+p7f7vUtKoRIAvmbkNtxvfewT642Qp29qA5TlbHChbBi8iPJ6K8ToS7Cq5btXZsjKiZCAf+CRcGP4QtAa3U0E1y+xPb1KLjvUXE4MTjvEBXh8eJDXBl7BatUIrkNSYEaTpvXPcVXDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIPzE6MBBJPrVnJjFXR5mX6/4Oe5Ot1ATMBz3yMGkyQ=;
 b=ojnqzbrruy2HY2cpNIBCdZZ5IlXRPe/r5m6eTN7L14WcNypvotYpxVEgGsMC14ivLjXkwLMnA4feQ9s+XMZAuZCpYPAMXH4W5X34MSxFmI06im/HqqhqiMCn6glDE+9FeOYLuwGoO8EaO/TYc/KMQm4Sddpjlcg/2ah7GLEC1cA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	iwj@xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] osstest: update Debian Buster install CD media to 10.12
Date: Mon,  2 May 2022 17:14:48 +0200
Message-Id: <20220502151448.19578-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0381.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 064136bd-22df-42c8-6bc4-08da2c4e873e
X-MS-TrafficTypeDiagnostic: MW4PR03MB6427:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<MW4PR03MB6427F4A1461F9AFF8C98D25E8FC19@MW4PR03MB6427.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DfRukVokpEN4gpKdII5MGc5EU95S8cNZkE146p/26qLdrDYeEgzoqnnn+hT3f9HlbTqRpPBGcDEljow5N9u9zvD+dFxbGRBWDbDZtgUD8n/0lZdIaaWVsK2+FlNkiQCbnaGRsDApjG+1e+3lxYAif7JLmkYTFNsAi+B0ABkY9KAYSGg1HtuvXyBMSSzpIlVFixkNXla3FOXBQZu7gngsSv/0i+5B0a/sfxlSkb5GPunn/piMB5dvfMrq8qKMJm2KI49l1+aDCAk0jpiV350q2Mo2/b16BeaUL0feDU2eUDkrij4OY/h1/m6GpEv6fO4OhVOXiXa0/ZP4gj8e+XKdyM6Uk7YVD+u21zv3JQVvZX/ZwSkR3rU/7+WR8xR6viHUyG83nw/RJIcwt/fE+Mo5t10a1IE9NPdHbTpyN3jtSOscJfnOaNVME4qjJ1bvuTFNZsvFiqfs0fOIfiXqSc+hTtj9Av1jf5B3FoIczUb1EH4fEOvN95Nml3ZzuOjUGW6vT9NNRPXCTym6LQeLvy0wFkNBEoYMNNASGHrQj23tx0fwb29Qspu5e/5shU1cZcgky9x2EjrqIlotZWzgvDVApzuV2USkY83Tii8uKt6WQPL6KXj2EnL1dkCyp+dOAo7gnrVny0rqyTnUkniW7H96IGHqQDxkG/EwUxVfNj6bGyQquexFRHigFo1HubT2aUwct1UJKnVrzzr5LvvEbd3mPrYh5AAJygSQ/w3gSw6viIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4744005)(6666004)(5660300002)(6506007)(8936002)(38100700002)(6512007)(19627235002)(2906002)(26005)(36756003)(15650500001)(2616005)(107886003)(1076003)(83380400001)(186003)(82960400001)(508600001)(966005)(6486002)(86362001)(66946007)(316002)(66476007)(4326008)(66556008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2U4OEJSQ2lobzQ1Z0kzdlNwQnJRaE8wdkMyNWdDQzFqbmNmQW1PNW80MGs4?=
 =?utf-8?B?ODhpL3ZNMUFmRHZuVHRvcC83ZTk2d24zdU9DRG9uUTJxRWJFTGNqS2R1bDRy?=
 =?utf-8?B?Qkl3TUJucWdVMEdiTUwzV3VqME5SSk1zaHJpWW9PbXNlUlY3Q2prTjZZZUh4?=
 =?utf-8?B?WGEvcFF0K2FjSTN3RURrcVFoalhKMEo4cERob09GZUVoTHNOM0o2cmJDNEN0?=
 =?utf-8?B?UXBDeXRaTy9GZmJZWVpaOGNKYTRqUFZQQktXZDQxb2JrU3VzWkhaVktYQyt0?=
 =?utf-8?B?V3o4eG01TnhCaGRsa1pwQ21SZnBLclRLV2lCUnJldkFJUnlyak83SElGclhu?=
 =?utf-8?B?b0JTckYycnJ6ZWNrOE45UkRRejVuTXh4NGdNYkJLcWZJV0V1Y3ZaVFpwak1U?=
 =?utf-8?B?TWZHa0ZHSGNCbldDTkVMYnFtWk9PV3pwNzQ4MUZ5L1BXbFFiNkdFbFRpb1Ro?=
 =?utf-8?B?dmFOaHN6UTVpWWJyWHpMbHdCZFZtRnJraTNSL0I0ZW56enRUNVI3cjFqU0xX?=
 =?utf-8?B?U2c2VU1zeHI5aDRFK3hvZGlpaGMrRW5JcjdhQzdjWUNoSCtFbnpvcTR6Nllh?=
 =?utf-8?B?MG56eTE1Um53QlZPeFlvcEhJK2hJL2dzdkdIWGtLSTMxVDRyZEJxTnQxZlp1?=
 =?utf-8?B?RmpqZjI2ZmtxU1phZzZhMTFvbThGTWdtQVhjeUVHSWtPS25QNDN2MmZVei9a?=
 =?utf-8?B?bThPWTVYM1RTUHRRNkhRZ3NaSVZ4NVpndGhxa0tVSWJYbm8yV0VWcHBkc3hZ?=
 =?utf-8?B?ek1scXZDUGJVT2ExSnZNL2xmQ1gvcWZrNytsT0lDN1hrYmd5TFBkV1RXV2JB?=
 =?utf-8?B?Z0VWUTNWU1lNRDN5OUxkTm82clIxbzhLT1BCZGEyVG8rQWJzT2c4QVJQUmIv?=
 =?utf-8?B?KzZRazhmaDl3cGU5WTlZU044UFhaUU95VkVZNjVvREJRT2pEdk4wMkk1RUl4?=
 =?utf-8?B?dndJUnVpeTdnOU5KOEkvSEZjV0F5MlorZE9IWWNSb1JiWEZUNkxWVWtKYXk1?=
 =?utf-8?B?Z0VRRTB2cVViekhzYll2WkgrRVlyNHMyd0ZLcGErcEtCSFloUFBCendrbDl4?=
 =?utf-8?B?VGRDUGRhb1BzcDZxMU9ZZ2FoSjhQNzFRdjBiTm1nS3FTS2hMRDltTWNCL0dr?=
 =?utf-8?B?dW9IejhQSzh1ZG92QXl6KzM3bjlXNGZJSVBJSjFMeGdOcjZuQlJ3a3BlendF?=
 =?utf-8?B?cEZFRkdJRFkxZGVqUEZpekk0ZzQxOEplK2YxM3pYeVpDL0FYQm12RXA3WkhU?=
 =?utf-8?B?OXhHZmNhT2xqK0llL3M4dzRFN3psNjBlNHRjYnBRR2RzSmlSWUx5cEN2ZU13?=
 =?utf-8?B?Y3ZMNllXamR0SGtMMHB5OVg4dlAxZ29Wdlo1YjJZMzdtenl5RFlsVHBSQWJv?=
 =?utf-8?B?RE82MklUNGdIOHVJUnFhem9NVEFBUHppSVpEZkw4UjdIWnZ2QWo4UjJVOVZ6?=
 =?utf-8?B?WGVRekhYNk0vbGFKUjU4ZzBhMkFvVGpCSGZpMTRVUzgreGNmSEZQOUhTck5N?=
 =?utf-8?B?K1ExdGx2NE5tSmF6bmlsZkgwNGZBMGtNeHphczJkbkdtM2JTNFBKSVg4SVQr?=
 =?utf-8?B?TUpaY1J3ekdtNitvMnhOT3ZMNlYxODZtUzFzbGZHam9oK3FUdWx5SUlhUXhr?=
 =?utf-8?B?N0RlMVVuOEk3NklVMGlJbEROVXFaQlBGYzNjVVVkelJiNll3TXd3QmVNL3h0?=
 =?utf-8?B?cGlHZVF0T0xiSlU3VGczVzJ2ZzR2MEI1dTFYTmVTdVowTXExRmdWaVpZMHpo?=
 =?utf-8?B?TzlvUG12Zk9Kd1ZVN0tkeHJjSTJ0MlhiVlpvdTM0VmZNUU5FMmNteThMSGFG?=
 =?utf-8?B?cmNaNDVCOWFwZkVnbVJhMjMvbzFJUGc0VTNnS3ZwaVJPRUtnSmlVSHF3Vzdj?=
 =?utf-8?B?YTJxamNkbzNzdWx3cjg0alJBVGtLZnZqT0VOb2JzckZGeVBzSjlJeTY5V0xx?=
 =?utf-8?B?Wmd2N3pzanhFNGlIWlRNWmwzUXozMjd3TW5QSVJOK09VNnh2bFVPTTU3dEdw?=
 =?utf-8?B?R1hDV2FIU1lTMkFCM0FiVGxnWmNhUENGT1dIL1R6dWxXSGw3UEdOWEpQczE3?=
 =?utf-8?B?QlBvMnVkck9XdG1rQWFTMm9nQ3Rud01URVl0cXltdExxNXlEOSsvU21iVFBj?=
 =?utf-8?B?UXB2V3RMRkI2Smt4dmhxVEJmK2tmbW9wbzhHQitmM2pUbHJmWGFVQ1N4K3dP?=
 =?utf-8?B?YmtzR2Nrcmk2ZWl2amFMbTNueXNuK1FNYk5mdk9sUERHeW9VQmdMaFJZV0E3?=
 =?utf-8?B?VzVuK0JURXlvU0UyVnl2Q0YrSHFkSEJxdk5YUEVHVEpnUUQ1RXZ0TmV3UXRF?=
 =?utf-8?B?QXRCUUlNSGZGend2U2lvR1drUWJvRmVWNkZHeFpzYVM4UkVGMUlYQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064136bd-22df-42c8-6bc4-08da2c4e873e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 15:15:01.5682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kO9/LK/dkU6dcSNXHT2j8tgvoO+tBaq4c/wC30ux68FGVrQp2eE+VXy2g6FaVMp/wZjeO+9YHQHD4CPDVxQoSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6427

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 production-config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/production-config b/production-config
index 9d2e7e0e..95d663dd 100644
--- a/production-config
+++ b/production-config
@@ -101,8 +101,8 @@ DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/2019020
 DebianImageVersion_wheezy 7.2.0
 DebianImageVersion_jessie 8.2.0
 DebianImageVersion_stretch 9.4.0
-DebianImageFile_buster_amd64 debian-10.2.0-amd64-xfce-CD-1.iso
-DebianImageFile_buster_i386 debian-10.2.0-i386-xfce-CD-1.iso
+DebianImageFile_buster_amd64 debian-10.12.0-amd64-xfce-CD-1.iso
+DebianImageFile_buster_i386 debian-10.12.0-i386-xfce-CD-1.iso
 
 
 # Update with ./mg-netgrub-loader-update
-- 
2.35.1


