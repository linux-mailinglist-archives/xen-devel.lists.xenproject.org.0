Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB13512F5B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 11:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316321.535211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0E3-0007X7-4r; Thu, 28 Apr 2022 09:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316321.535211; Thu, 28 Apr 2022 09:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0E3-0007V0-1K; Thu, 28 Apr 2022 09:14:15 +0000
Received: by outflank-mailman (input) for mailman id 316321;
 Thu, 28 Apr 2022 09:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nk0E0-0007Up-IL
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 09:14:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f3f88c7-c6d3-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 11:14:10 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 05:14:07 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH0PR03MB6195.namprd03.prod.outlook.com (2603:10b6:610:d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 09:14:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 09:14:06 +0000
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
X-Inumbo-ID: 8f3f88c7-c6d3-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651137250;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IwvRMP6DtAWNEV9kp43n0C7X/1f/5JcMB6GfBpfSERo=;
  b=h9uyAlsjXARnrcff5HfN7CTW+gEAAOjDFpBmeumJmIXLqyOewfSVO68l
   kax2L/sWz2kBPQkLH7p8ZiXoG4Jfx6YLle+vAdoOu2xACpQe9cLPmK6+7
   eWIJlcAtMpMArUmi0mVDn+2S7bNfdg2Yp1mRY5YEVuo57uC7AoF/c6CK9
   A=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 70001656
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D5U/Jq7wNHJvHX8jCZFhjQxRtDnGchMFZxGqfqrLsTDasY5as4F+v
 mBLCG2PP/uDZTT2e4gkPdm280lV6seEx99hSAo+riA1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjU1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSccFgwGbeXoN8nCSYCIw1+ZpVN957udC3XXcy7lyUqclPK6tA3VgQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfibo4YGjF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA8ArM+/dpi4TV5BB4juTLAf/5QYaLRN1FpVaoo
 m2c0musV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJ4Huw88wWA4rLU+xqDB3hCQjMpVTA9nMo/RDhv2
 lrXmdrsXGZrqOfMFyLb8aqIpzSvPyRTNXUFeSIPUQoC5Z/kvZ03iRXMCN1kFcZZk+HIJN05+
 BjSxABWulnZpZdjO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:Z2u+VajV1TR0blR5nbnsVdrh63BQXzx13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hoAV7CZniehILMFu1fBOTZslnd8kHFltK1tp
 0QDpSWdueAamSS5PySiGfYLz9J+qj8zEnCv5a6854Cd3AIV0k2hD0JcTpzX3cGMzVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xA+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlXAnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxOIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh57D3xHklX6voIRiKprzOSI
 JVfYDhDbdtABinhknizyVSKIfGZAVyIv+EKnJyyfB9nQIm30yR9HFou/D3rk1wiK7VdKM0md
 gsSp4Y8o2mbvVmGJ6VV91xNfdeNAT2MGPxGVPXB2jbP4c6HF+Ig6LLwdwOlZGXkdozvdMPpK
 g=
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="70001656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InYlIov7E74igbQIPOkBEAfi6PRKKuFOLLdOQtPM3z8zvBy/HIQivJ3xw9Ds+HpQ11mzeJvs9PxFUiqZ7edxQRwgPjsHKpgnAxRMCxuod/tVkjz9nhGCJ0ETCz7t+q9ICiyIZpcw1s6NjqQ/WeFZ5KzqxfImWlPF4sDs7EQJdGN3mOuVaU1gHaajWGdAjnKWqDLdhIOZc0+Q1gpfWzSz2/3w9ewh+CEJgyDoEzV+XMvwWeWms8x0Rk/IjupgeAz6T6pzLOoeGwlKvSZLkvwqRR8cj8gIUTPw4XzDaN2XR7gBulsUPW7FbeoOZ1dVoJgM/ojNeynVm6OoVoO/vy3Jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMPpJobdVmI2GMEWNIesnqX4dCzhlyU70FoN8rwdvNA=;
 b=g2a3JQ/xn3K4joAXALuVdiYcwvs31vqAXY5T9mB9cnfofuc9RPnkYbfeaHaVmVp0QGnxYI+j0n1dUVXwvd7wY+P+KiU+3IHGAeCNb8GXBqlPYI/SwmuQTeN5v+tqaBedmJVH68WUzBfpRw3HUOexzVuWP1X5r/p0IH+AREJI/FQrEROg1a4z8/oFzvElpDvh4/ibSEWxjEY2hZw50KmEMPndVYtpcNOm0AEKIeJYHqqi5l6svWrXIDzZ+bPnt509Lkq4uuJrg0Ea+nVQjI4G/4Zi7DVV/2JbXqwvqhJ7NDhjmAsK4BbQa/TUZhdBRDMobxA8coQO6w6oPSQA5TIejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMPpJobdVmI2GMEWNIesnqX4dCzhlyU70FoN8rwdvNA=;
 b=Xy9Q7s3n3SPU9cbymjNMuYAGQ2Hwm52w8gBM+1VfjSlIO1wPP4YQ6AZbGSr1spnomHenmYqkpgUP00yqb0did2WcMugMP+FmvujTjcSn0SkFPukdDbGf77Dfp8vE1/TL+9kKRWtTWM0sxpt70q1z9fbyBpLjG9SngRBRxVq6QY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Steffen Einsle <einsle@phptrix.de>
Subject: [PATCH v2] x86/msr: handle reads to MSR_P5_MC_{ADDR,TYPE}
Date: Thu, 28 Apr 2022 11:13:59 +0200
Message-Id: <20220428091359.90431-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 714333d7-120c-4529-eed1-08da28f771f8
X-MS-TrafficTypeDiagnostic: CH0PR03MB6195:EE_
X-Microsoft-Antispam-PRVS:
	<CH0PR03MB61958CE38BD06C64778F2A7E8FFD9@CH0PR03MB6195.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QlvPaZzKC8F1ry4h2Zj0hEYSM/Q+cGKE5+5b+CBTz6Eog7G1jiOvwgErV1XTwKs49AQSi1twW1TNA/s5+XP5PLN2TuNRxeb993jl/zYT71QInCnd+vUO52rnt2fvKcB+5eEBhYOqJqQEolRPmH31tn1o99qRQB/TUNzzzjKIq6IYxgcwxlFYZ1CqOBt4XGJpe2Pz2aP4P0SPRIPAO1GofV7o1HretmE3m7u5j+0jc74XbgqSwV2JbygsGwDmt9kmpGSc/RWI3LPGqCTpRVuUL9m1NuwhDl5X+OT35xMstbw/HejOtMSNPymc80IpoX1tL+BRiQihBn4h9OqNO8wM5w9mt+rvU5Kflo8DrGN652DFmgBJbD5/OfFfCziSAFRhEKnTtfhtb7SL4tm7QhTleyC+LuqKzf8/GRYxqCxzogdUK/Tv5ZbkQruEoKIBiy3kQRGjIgc1VdMYkh0phM9zxHcoUdfuPNKj/Cdty/+hOXGX5F3o5YZt3mAcu6MhKPCVNo2Ns1kQHSBInd9Y0BwMLYOTdG7fyuu7/drVj3S/dtgro9Q5gim8lOf7mAaxgUhTF3Inf8RQQt7IvyIDdB7+N8A5LWooX35nGGvN93ED7yIR79ZjVUTwNc+BXhPCBMun3kbAcC0ZPCC1C5UgIxAtFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(66946007)(36756003)(5660300002)(186003)(66476007)(316002)(66556008)(83380400001)(8676002)(4326008)(6916009)(8936002)(54906003)(86362001)(2616005)(6486002)(508600001)(38100700002)(82960400001)(6666004)(1076003)(26005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azZ0NXZyRTVJS0MwVDFwcWFKejRGN1I0ZERpNEVLazYzOE00T2tiRE1OTFc4?=
 =?utf-8?B?NGNKRDJDOFNvaVpIeEpFTXlNYTRVM2ptNXZ0ajBVT1NNeTlUa29Td1I4c0xz?=
 =?utf-8?B?ZnloVjBrbUJVcytmWHI2dnk0U0ErdXhvV1ljRzY0bVpuQnlYQzJKOHVjM1g0?=
 =?utf-8?B?RTRxaTU5N01hK29hRmlJUjIvZU5ZbEplOFZ5UVhRVDl2MlYybTVBWC8xMCs1?=
 =?utf-8?B?UXMweEtSZzhZQXpOUVZWeU9EWVgrZWJ6c2wrU3kxY1UxYklIS2IyUnFwSk9u?=
 =?utf-8?B?dmhTWXAyOHhJcGFTMnF4RXpQYlNONXJlS1ZMSi84TGp2M3YycEV5T0FYOFAr?=
 =?utf-8?B?R1A3Q05HdUVMR3R4QVZhdXBkVUMvRXovWk9nN3ViMjFxMDAwR1dvcE1rMjFB?=
 =?utf-8?B?MGJyTHMwVFZaei95Yjlkcmw5U0JlbVF1eHQyVFRNYXlJd1pGWVk5aXRhbDJh?=
 =?utf-8?B?V0NKL051amtyRmdsR1hSa3VYaFVYRDJUQWdhaDBRWldkakJoZmhOcFVYUkpm?=
 =?utf-8?B?c0ZMQm5JYjRSWVFCbnYrM0RRaGtlZlcwd1JkNDloalhicUI2T0dNdjBZalpj?=
 =?utf-8?B?WXg0Q3FEUnU2WWhjb1Q1Y2p3akxmMFVZVFNad2dsTHBYaEhmbzN6SE8yZ2NJ?=
 =?utf-8?B?a3E1Y3FzYVlSZnZhazNDMkxGZ2JObDEvRytBTzRuYjg4bUhBd2cvUXZFU0M2?=
 =?utf-8?B?K2Z0RVRKNW8xeVp5VmpSb3c3RytsT3IvTjFUdnhZSUpxWVRFUkxBNmt6VTlG?=
 =?utf-8?B?MmUyYTJ3OW5YSVRKSlFLZ1JucCt0TG94WnFFRU84bkY4bEE0cUNTanNqblV4?=
 =?utf-8?B?VzB3UGNHdEh4VVJQSS94cStVT3Ivak8vT2xlWmJtRmc0QVgxNnIwZUV0aTJI?=
 =?utf-8?B?R21DaWkrZlFiTEdyc0Z3Q2ZGVFVWWmlhUTV0MUFpdk00L01Sam1PeWlabFkw?=
 =?utf-8?B?WG1oZC9Hd2ZHV1N3UmJvSWRLMzhIbUhGRXllODdVUWM2OWpzZDZEaThhRjU0?=
 =?utf-8?B?VWlSeUV6WllYd0JESXVkTEQ1NGtyOVVtbkJvZGFRUWV6M3pwMXpkYmZncHhu?=
 =?utf-8?B?ZndMYThUSWVlZTRKd1RyTmVrc0hxOFBFYSs5WmIwV2xjZUNWOEZ2Q1d4TlNr?=
 =?utf-8?B?NGdsRi9EWEpFZHc5Sy9xeFBwSzBab2toakdtVVlQM2FTWU0rcGp0RWJqdGFh?=
 =?utf-8?B?Z01nVkRSVnYxbFNRZkM5Q0N6OTVzZE4xOXJjcHMvc3daTE5Jd211RUdDd1BL?=
 =?utf-8?B?Y3gzZjA1cjZsUlc4QlRyaXdGeFFnalRzRURSNHJWWmVsa2oyQ1dkWDU5a2lr?=
 =?utf-8?B?U3hKb08wTTNwYy9hbysvRXVzWW5DeDdaVWZ1eVVyajlWRWNwanlBQUlxVDhS?=
 =?utf-8?B?eXozYTFQL2U2WE1ScWM3UzAvOE9oRnQ0NDEvWSttMDAwUm14bmtrUU0weEt5?=
 =?utf-8?B?eGM4K21oR1Vzc3h3TEhBYTZ2Vno0SXlKVWNmZ0hIcmwzUnZ5M2FaV1JYNktO?=
 =?utf-8?B?OWFIa09QSG5pNEJYK3JIOXA0enNvcEUxcTFaRU45ejl2bWRzaVZQYk1WSjd3?=
 =?utf-8?B?K2VaZWVSb091TTJEMW83bG41SEoxdkFKbnFDcW5pNGRoQll4WGx2SVpna28y?=
 =?utf-8?B?ZTM2a0F2ZmVxOVREMm5xRUJvbWNKc1FQY0hXcjBYT0Y0WG1wOVR1cTNTTytZ?=
 =?utf-8?B?d25RWDZrRjRhQWtzcE04RzB0MGdrby9vdTJOOWp4NnJOVFRxalFlam5rZHJP?=
 =?utf-8?B?SmtES1hMendkTVhrbUtrUVpieXp0MTVlck1xVUdvRW4xNkRONEhPTFpacjNm?=
 =?utf-8?B?UE5IMkVQZFo3SGhQQ3dmUlpkRWZzZmZCQ1Arayt4bVU1TmhrejlCUUp3Q3c5?=
 =?utf-8?B?NUx1T3JWc2x4dTRsaDhxWUEwMktDOWgvYXJsQnBabFgraXNVN2JKTXJ2Mzll?=
 =?utf-8?B?QWV6MEphb1Fwd0ZmYXNaTE9OV2VLOHEwVFpKU1JGQmhSTDNHZlluWmtUblpT?=
 =?utf-8?B?TFhBZGJDSTByYi9rLzdDbU9jc0lJdnhFTmI5US9ROFp6amxpTFlkM3huSjVu?=
 =?utf-8?B?Qmp0eG82aERRYnQyc1RweDQyRHl3bXNNQXBzbVF4bUlFY1RISVlUNm4zME5G?=
 =?utf-8?B?TTAvTFRzd09obHNGMnc3S042ZFpVSE5DWFlEM2t5UkFFM2tnU3FUeGRSc2xu?=
 =?utf-8?B?d0dEYWw2ejRIVEsvM1dkTlhVQW92eG9YdlhWbXBDN1A5aERGWFI4ZjZBQUJR?=
 =?utf-8?B?MlZON1o3cWJQSmd6ektDMXhnVHdkTlFzSlVsb3JvSlU1NXBFdVQ2bHVjZkp2?=
 =?utf-8?B?VTEyUXdhNkc5NlEwemdYTld2bFcrU1dwR2Z1ZmlZb2RaNWpxVHpyVlZUWkcv?=
 =?utf-8?Q?mImLdMtKhmN5L1Ms=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714333d7-120c-4529-eed1-08da28f771f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:14:06.1768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zmmczr8d0axC1js9/iPCJ7XX0563NorCGX+7JVvXak470nREfz8Op7Tj7okKBtwrHhfixfbsauVPi5yq50NVuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6195

Windows Server 2019 Essentials will unconditionally attempt to read
P5_MC_ADDR MSR at boot and throw a BSOD if injected a #GP.

Fix this by mapping MSR_P5_MC_{ADDR,TYPE} to
MSR_IA32_MCi_{ADDR,STATUS}, as reported also done by hardware in Intel
SDM "Mapping of the Pentium Processor Machine-Check Errors to the
Machine-Check Architecture" section.

Reported-by: Steffen Einsle <einsle@phptrix.de>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Implement in vmce_rdmsr.
---
 xen/arch/x86/cpu/mcheck/mce.h        |  5 +++++
 xen/arch/x86/cpu/mcheck/mce_intel.c  | 16 ++++++++++++++++
 xen/arch/x86/cpu/mcheck/vmce.c       |  2 ++
 xen/arch/x86/include/asm/msr-index.h |  3 +++
 xen/arch/x86/msr.c                   |  2 ++
 5 files changed, 28 insertions(+)

diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 535d0abf8f..7c6df6df7c 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -169,6 +169,11 @@ static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
         if (msr >= MSR_IA32_MC0_CTL2 &&
             msr < MSR_IA32_MCx_CTL2(v->arch.vmce.mcg_cap & MCG_CAP_COUNT) )
             return 1;
+
+    case X86_VENDOR_CENTAUR:
+    case X86_VENDOR_SHANGHAI:
+        if (msr == MSR_P5_MC_ADDR || msr == MSR_P5_MC_TYPE)
+            return 1;
         break;
 
     case X86_VENDOR_AMD:
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 50198e0c29..63fedff418 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -1008,8 +1008,24 @@ int vmce_intel_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 
 int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
 {
+    const struct cpuid_policy *cp = v->domain->arch.cpuid;
     unsigned int bank = msr - MSR_IA32_MC0_CTL2;
 
+    switch ( msr )
+    {
+    case MSR_P5_MC_ADDR:
+        /* Bank 0 is used for the 'bank 0 quirk' on older processors. */
+        *val = v->arch.vmce.bank[1].mci_addr;
+        return 1;
+
+    case MSR_P5_MC_TYPE:
+        *val = v->arch.vmce.bank[1].mci_status;
+        return 1;
+    }
+
+    if ( cp->x86_vendor & (X86_VENDOR_CENTAUR | X86_VENDOR_SHANGHAI) )
+        return 0;
+
     if ( bank < GUEST_MC_BANK_NUM )
     {
         *val = v->arch.vmce.bank[bank].mci_ctl2;
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 458120f9ad..af30811afd 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -150,6 +150,8 @@ static int bank_mce_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
     default:
         switch ( boot_cpu_data.x86_vendor )
         {
+        case X86_VENDOR_CENTAUR:
+        case X86_VENDOR_SHANGHAI:
         case X86_VENDOR_INTEL:
             ret = vmce_intel_rdmsr(v, msr, val);
             break;
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 3e038db618..31964b88af 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -15,6 +15,9 @@
  * abbreviated name.  Exceptions will be considered on a case-by-case basis.
  */
 
+#define MSR_P5_MC_ADDR                      0
+#define MSR_P5_MC_TYPE                      0x00000001
+
 #define MSR_APIC_BASE                       0x0000001b
 #define  APIC_BASE_BSP                      (_AC(1, ULL) <<  8)
 #define  APIC_BASE_EXTD                     (_AC(1, ULL) << 10)
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index a1e268eea9..d87317e989 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -283,6 +283,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         *val = msrs->misc_features_enables.raw;
         break;
 
+    case MSR_P5_MC_ADDR:
+    case MSR_P5_MC_TYPE:
     case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
     case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
     case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
-- 
2.35.1


