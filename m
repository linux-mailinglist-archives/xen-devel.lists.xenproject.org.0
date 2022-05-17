Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51152A69C
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331093.554562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzAp-0005jo-CJ; Tue, 17 May 2022 15:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331093.554562; Tue, 17 May 2022 15:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzAp-0005gh-8a; Tue, 17 May 2022 15:31:47 +0000
Received: by outflank-mailman (input) for mailman id 331093;
 Tue, 17 May 2022 15:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqzAn-0005fb-AO
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:31:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73b8a127-d5f6-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:31:43 +0200 (CEST)
Received: from mail-dm6nam08lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 11:31:40 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4662.namprd03.prod.outlook.com (2603:10b6:a03:138::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 15:31:37 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 15:31:37 +0000
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
X-Inumbo-ID: 73b8a127-d5f6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652801503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=E0WrwYD300/uBgj9TRjUZK4gWeZhaQHIkA6kYkkRO7U=;
  b=ONNpPHEh+F+1VHnMXr6wHMMkxhyvCMIABXRbeB8ZWmSUe0vcbnUQXzGA
   5+Y4YeUXwqCYELZazhEM4vcu2Tyxib/7tDeRq6+qzXl41C/c7/rstbS62
   YqJGDnV9lOyS+DSxttcf6VIq8Z7+DSN7exrwjR/fOKFYcbr6clSC2VZ6c
   o=;
X-IronPort-RemoteIP: 104.47.73.42
X-IronPort-MID: 71519856
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0ucnKK74BMT2PetWZHoDAAxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 jNJCmjSa66JN2rwe4t2ao3g8k8O657cytU2QQpo/i8xHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgXFvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSIdw4wJ6KRvNhaeD8GDw98Z4AfoKLIdC3XXcy7lyUqclPK6tA2UAQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfqRo4MCtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGQF8QPF+PRfD2776F1a77z/F+jpJueWROt8zhqHr
 E3U1jGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRoky0Vs9bK
 kcU0jEztqV0/0uuJvHiWzWorXjCuQQTM+e8CMU/4QCJj6bRvQCQAzBUSiYbMIB88sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP46TsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:rBtvN6+bdvYuyV0kstBuk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4aPLfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZd
 Ohz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlOl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFcxccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiV7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri2knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYds99RrBmcEa+d
 RVfYHhDK48SyLYU5mZhBgj/DWUZAV8Iv/cKXJy+PB80FBt7QVEJgUjtYkid0w7heMAoql/lp
 r525tT5cFzp7ctHMRA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71519856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7HUTINmUzRI39zzwUwcOCfy52++HaaJ+r17RQytoc78NkmlHosH8miHH2RjyKXizDUqTJgVUxYkl9OUn2dvQtA1c+pEzgvqZu3OU1gPWMM0v77fBbhO9AV3FQhr+olDExd3QYQKRue2bo02utswZCgaZal+uTw06bQ6QynTFp/gCv3sneB6zfXTOrNxTdmz6mfgfApTKs+097b2tEebEzx5eJuwlrBqReZ9UxJS3Pq9dpPMuEZXdOdSm4SgptiHxgqu4Pr6HvrUfydBkVhYTrnKEtQvW8UjbOMA5kuJNdb/vo05vvDB7ngRb4CirKLM6nYM68xW4ALU8xq88Za2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1YXIq3wwhUERf7uVRHsHYT1E5p+r61LTwXkwzyRWfU=;
 b=B+NK8Z8YvBGG6x4hYLVJIq0hyTkO+evUDvOcICcWUZzeldzv0hvWKPiJhHe2C7NtwxZ+kplkcoICeKRLwHT/TldbRD4wRCx1wZbzkdWETTAQjyoPEY1tr9XcmwBBUTjCjtvE8LWxH/lZGJxVWv7/lFPi7Iivprl3rN39U2RjCbpRSZnJYiegV/yx4bCVdIVO/AV8YomY3I/g/3DzF785s/lPGVN4rzR0GFdIT/7ZngZzKmqJkkYg7EMepsmINHrWA+1GvMzwear2nIOz9zGO5sLR+FEyEobEOfKVLzcXcKJFTqCb35pQi7qFOzXsZvWac+rwfl/LgWS/t/O2uv+aSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1YXIq3wwhUERf7uVRHsHYT1E5p+r61LTwXkwzyRWfU=;
 b=dC6VOu4PIg1vzdLAcegH7nWdDQWNzrnmqAab3EgN5OjdT3LyGzWfq00xjTLHMdUDVuzU6Npb8uLGTKgnHFagn4i8TE9liDKBAlvDcMfwtBmVNNh826EayyU6ls5N3Es9t0TN1N/JCWhuTbLIundWFTfhCDyVxjLxajjq71EBB3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
Date: Tue, 17 May 2022 17:31:25 +0200
Message-Id: <20220517153127.40276-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517153127.40276-1-roger.pau@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31f322d8-2972-4ce7-f783-08da381a5535
X-MS-TrafficTypeDiagnostic: BYAPR03MB4662:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB4662DCF85D3954520858E2B38FCE9@BYAPR03MB4662.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cxrbkII93kiVd3/tnbHXGscxtmm2PpmB0GFSeGVVxyUAnnMLjdDFUQz40TrmjDfCoUCCdiT0et9lzpcnAJwg7nbE79msKyoNKn+wHDwWu/X3aWzQfWK/jHT0yBiKdi7DeC68saB1UTAqHti8p0SUvsMK6nNBziG3e+5ThvSN3OApuuBBP+mtKbhfHHmyQO+WNETJ28D3z1zvrn+25jH1LKN5oeE+u+xpbfceFUnYpnhijCrnhzuvv5BHXsveSdkOoAEo2fgFPppUOET/UqlslPiPVwg3HzUSlBBH6uF1Qsg3fswrz2QcbNlCXCtefv7T/WYLIIv8Mizb2DBF+fpVawmjU4GvHNk94Jc7Wg9qFHc6qFUjd4NoEhT80EkTnIk45ycW1ggA1uLG68bxYxpcrp95CciEuHLCBO6vAfjxqG5wrhJ8PhJKQezwl00F5bZPAzmLHEi2vMc5MncB/1naxtMiQaFTPkWhiunuzln4N9WSqVJ5vkrBDdBkhnFK0Gsc+UgmpF4R3LotMkf2B/4z9GOKSptN/wO+B6nBOW1pUfh0RZq7zT+WZqve/8pO9Som3YxDuVw16M8KfpADo4taXa8+J35nZA0IxlVND/KaVv9j/Myni2JBZ86du9vY3PN0p+hglxQ6hwj4StYOsYGgtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6506007)(186003)(82960400001)(1076003)(508600001)(54906003)(6916009)(6486002)(26005)(6512007)(2906002)(66946007)(66476007)(8676002)(4326008)(66556008)(6666004)(2616005)(5660300002)(8936002)(83380400001)(316002)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnRhUXNGTmRrN29vWlNpV2h4RUI5TERHQlkyL2FNcFB6L1RiV0ZEd1VaTndo?=
 =?utf-8?B?R0VLa1RZMzRhYzFsMmlHRVhFRWFQT0NvMFlNMlFBZE9ncXQvcitYUHYrM1ZY?=
 =?utf-8?B?Mk9Rb2xCalQvM1BDeUlieGJUMkNqR3BzdXhoK3l6M2M2MExaQ1ZlbFpyYURm?=
 =?utf-8?B?RDMzWDdXUlNKN2o0emVmRW55bWlUMklyQnZlRFR3MHRTQ1l2azhZVEQzM09n?=
 =?utf-8?B?a05Da3Q5c3AzZG9kL1g5R2FTRmozb0k4Z29DbVlQRDV2d1NjZHh3STZpOGZi?=
 =?utf-8?B?UTZ3c25vMnlEVzJoRHpzLzkxZWpLNUpibm9BSzZwaVpLQkJ0aFdIb2hpQjBj?=
 =?utf-8?B?L29NVEZ2Y1VQTzZab2FLWGVDRm5xazhRYlY0OFNNRWRXNVkxZWFWMTA4T3RY?=
 =?utf-8?B?blhVaFFwTG5lb0FOeTNaUk1BZWwvZzE0WTBaZ2d4Mk9pUjFIbjV6cjNsZTQ4?=
 =?utf-8?B?VVNFRzdDdUVyNUFYODN6aGFwSGYybXRrczRmSkI0dG9WL1VML0R4WThtQkMr?=
 =?utf-8?B?RFBDTlJvS0V5WjIvT3psVHNwZkU3UzRITTdWQ1hzY0lKcFA1M3hOTTRzZzI1?=
 =?utf-8?B?Y0F6MFRlZlpXKzRpem03Nk1XWnlMWlgzS3ZtM0JvQ2RlSW5rWlRoRFBQOEJO?=
 =?utf-8?B?OUlWNFVoTC9pZFFrdVlWU1RtQUVaaGdVd2lWQk44L0x5OVBuQ0pycEJhY1dj?=
 =?utf-8?B?UzU1c2sySUtFY3oxdmRlRkp5OEJkMzhKdFFRalp6WVZtcEhlRUJ6c2h4Um9Y?=
 =?utf-8?B?L3hkSkQ1ZS9mbFcwa2JRL3NFYktQeGpTaTNVanNLWENBVFN3SWtwU085bUk1?=
 =?utf-8?B?MUNqb3BHNFpiR0dBNkxNNythc2l2dCt0Z25EdmJxUkRJaDNhd05iOGNWd3hi?=
 =?utf-8?B?c0tlaW4yeTZXZVVlaHJOSHpuNUpBMHR0MkI1dlRQNUlQT1FyTEZKN3pRVmFW?=
 =?utf-8?B?VkFPemd4cWpKVDRYRUhrUUJiWmxoQnJuVjlqL3VDRHhqdkpFZnFzWVNaV1lZ?=
 =?utf-8?B?ZDNrVkdsNm5WRlZlWFpNeFRHZE43OHN0cTRWOXQybnlzUDNrZWp6T0VLNzM5?=
 =?utf-8?B?L0V6bHFXZmlQdkxUOC9yMWh0OXFLV3dBRmVGb0pKdUUzRTZDR1FtelcrN2w4?=
 =?utf-8?B?N3hzUk9iR1FMQytYMkdkZkI5K3hCOTkvaEhnUnk0Mnh3Njg1c0wrU3pYTVVy?=
 =?utf-8?B?LzJudmFKR1E3aGt5WG9ybUdRbTdBNU1vTG5kQmtMMGduMVI3bGxuUnh2MVp2?=
 =?utf-8?B?VVVXc1lRTndwOWZkWHhpTVlwREd6MWk0OFYza1ZPUVFJMDNMZEVvYUtJM0Jr?=
 =?utf-8?B?NVRrUGFQc0lwR0dOdkJNWXNuUkxQWEp2R1lkMlZwMVM1WStLc0pjUHluRzdD?=
 =?utf-8?B?dzlQRlZSMUttVjBwSkV4aGg1L0VjNm5wUUUxSWZLMFJjRWoySzllL0JxNmtt?=
 =?utf-8?B?cWRnMXAyZ210aDdjVlNPK1IwalFPaVRiWjZtOEJ4KzlwWDY2OHJZazl2NGxy?=
 =?utf-8?B?RG5JT2YrNUt5dFcxRTdxMVVYMkFqQTgwd2wxQnNLaVlNTHdYTzlPaHc3RGw0?=
 =?utf-8?B?MmRibzIrdkV1YndCN0RQOWVMUXNUQStzNWlrSVdTdmdEK1hwQStzbldmMDFQ?=
 =?utf-8?B?U2JnSmJxd3diWFF3Tys3ZUdqMElJb0NFWjk3QkhLRC9HZHBFVUdRRjBCUDU2?=
 =?utf-8?B?cDVXdTVQQzJ5VEVzVW1idlNObTlYTVoyVXdCZThHM1hKbHlWcjl0ZDV1SjRC?=
 =?utf-8?B?U3d3dWNqUFZ5NGR2QjVyM2FGKzJncEZYN0VmZzBNdURnc0RPM0Zoc2M5cXJV?=
 =?utf-8?B?L1JOK2FCU0JOTzBBaW1DbzFTS2Q2enh6VGkzWm81ZW9VcWhRT1R5QWRtb2R5?=
 =?utf-8?B?S3BPZGE4OWZUQzRrSGdmdlorZVoyaGZycnhXMC91WGtIRXJpMkNObTNiekpB?=
 =?utf-8?B?c3BsVCt0OCthWWxldS9WMzJ1V0pRL2ZXWmhGRXgrdCtkZ3hxOE5Sdi94Q01Z?=
 =?utf-8?B?WEx2MSt4bndyanBGSkVTR0U2VE15OVY4VW9BUzhqOGhjdm5hZklhZ3FOV3pT?=
 =?utf-8?B?aUtldFFJQTJjLzFLWStqZDJOMXZJTjJuWG9LT3d5WXhaamNud1M3dWRRbWov?=
 =?utf-8?B?aE9GbElQTi9LR0l0WlVlYk5iZzNzWWd4MjgwTm9UZk9SK2ZFT0lzdXlKT3l4?=
 =?utf-8?B?K29Pem9vQVNIQjl3NFFNbXo0NHZqVlpSQmo2bVU1aDBWeEpEYWlrZ0dlYng4?=
 =?utf-8?B?ZUdrWjQwOWErU041Qk9yVUo5aTN3MW93MUhDNlQwQTFnV1pnWHE1TUdWNkNY?=
 =?utf-8?B?NDluOStLNE5JSmVtdERxT3JGcllJU1NHaE4zZVRsY2VWbkwyWEszRmpiN1Y3?=
 =?utf-8?Q?5vHBSxsBnm+PP8CU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f322d8-2972-4ce7-f783-08da381a5535
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:31:37.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTEborTCrfivrne5mPF34Uj1knyvI/bAjsSP7zMZ0c620xWqRth7ZDoKt30ZRKiytGcd0EWHQP+Jkq+rkRyjNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4662

Use the logic to set shadow SPEC_CTRL values in order to implement
support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
guests. This includes using the spec_ctrl vCPU MSR variable to store
the guest set value of VIRT_SPEC_CTRL.SSBD, which will be OR'ed with
any SPEC_CTRL values being set by the guest.

On hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
policy so it can be enabled for compatibility purposes.

Use '!' to annotate the feature in order to express that the presence
of the bit is not directly tied to its value in the host policy.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Use '!' to annotate the feature.

Changes since v2:
 - Reword reasoning for using '!s'.
 - Trim comment about only setting SSBD bit in spec_ctrl.raw.

Changes since v1:
 - Only expose VIRT_SSBD if AMD_SSBD is available on the host.
 - Revert change to msr-sc= command line option documentation.
 - Only set or clear the SSBD bit of spec_ctrl.
---
 xen/arch/x86/cpuid.c                        |  7 +++++++
 xen/arch/x86/hvm/hvm.c                      |  1 +
 xen/arch/x86/include/asm/msr.h              |  4 ++++
 xen/arch/x86/msr.c                          | 18 ++++++++++++++++++
 xen/arch/x86/spec_ctrl.c                    |  3 ++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 6 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7e0b395698..979dcf8164 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -550,6 +550,13 @@ static void __init calculate_hvm_max_policy(void)
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
         __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
     }
+    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+        /*
+         * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
+         * and implemented using the former. Expose in the max policy only as
+         * the preference is for guests to use SPEC_CTRL.SSBD if available.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * With VT-x, some features are only supported by Xen if dedicated
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5b16fb4cd8..db8f95ef7c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1334,6 +1334,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
+    MSR_VIRT_SPEC_CTRL,
     MSR_AMD64_DR0_ADDRESS_MASK,
     MSR_AMD64_DR1_ADDRESS_MASK,
     MSR_AMD64_DR2_ADDRESS_MASK,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ce4fe51afe..ab6fbb5051 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -291,6 +291,7 @@ struct vcpu_msrs
 {
     /*
      * 0x00000048 - MSR_SPEC_CTRL
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
      *
      * For PV guests, this holds the guest kernel value.  It is accessed on
      * every entry/exit path.
@@ -306,6 +307,9 @@ struct vcpu_msrs
      * We must clear/restore Xen's value before/after VMRUN to avoid unduly
      * influencing the guest.  In order to support "behind the guest's back"
      * protections, we load this value (commonly 0) before VMRUN.
+     *
+     * Once of such "behind the guest's back" usages is setting SPEC_CTRL.SSBD
+     * if the guest sets VIRT_SPEC_CTRL.SSBD.
      */
     struct {
         uint32_t raw;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 01a15857b7..72c175fd8b 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -381,6 +381,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
                ? K8_HWCR_TSC_FREQ_SEL : 0;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
@@ -666,6 +673,17 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             wrmsr_tsc_aux(val);
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        /* Only supports SSBD bit, the rest are ignored. */
+        if ( val & SPEC_CTRL_SSBD )
+            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        else
+            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         /*
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1408e4c7ab..f338bfe292 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -402,12 +402,13 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
+           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cee4b439e..5aa3c82fc6 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
-XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!  MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
-- 
2.36.0


