Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622EE6F468B
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 17:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528703.822188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrUf-00006N-8Y; Tue, 02 May 2023 15:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528703.822188; Tue, 02 May 2023 15:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrUf-0008WF-4I; Tue, 02 May 2023 15:00:41 +0000
Received: by outflank-mailman (input) for mailman id 528703;
 Tue, 02 May 2023 15:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptrUd-0008W9-BS
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 15:00:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1859a13a-e8fa-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 17:00:38 +0200 (CEST)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 10:59:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6422.namprd03.prod.outlook.com (2603:10b6:a03:396::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.27; Tue, 2 May
 2023 14:59:36 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 14:59:36 +0000
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
X-Inumbo-ID: 1859a13a-e8fa-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683039638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+/IIFwM9mnWmeO4C0VHoB/T3RUCbmQJsbpPxY0Jwn8s=;
  b=K+DS8ZHoYp6DDybyjkg8ZSqwZ99yL5MHBazHsL/qV/CBrlUzmbOpABlL
   gBH7w0ySIRJR0WbzKQvY4EKhnl4LNxyklIZ6pZXAnG/sVHpNPYR5I1wQ8
   X8BQTQCdnmt0BwPgWj40UgSjf8t7Q8dO26QTgK4RZpMRCY23Yao4+wORL
   M=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 106348824
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kFtgX64nnShQk6lwj2MnBgxRtBjGchMFZxGqfqrLsTDasY5as4F+v
 mIfCG+HM/uNamPweYggaI6z9UwH7ceAxtFgSAA4qCk8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0T5geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mt
 sAHOis3NUm5p9mb6r+ZdPBSuZwjFZy+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOSF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxX2gBNJCTuHQGvhCukK+lisRNj8taBiFnumV0HGXX4tDJ
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9URX5NkcHbC4ACA4aud/qpdhrigqVF44/VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxtwWzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:LIa61q+QX2xnH6lGeZRuk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4aPLfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZd
 OhDo0tnUvSRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTvj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qm5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwaZUaAHQ5UYMtMx1lP
 sj5RPTi7NnSTf72Ajt7dnBUB9n0mKyvHoZiOYWy1hSS5EXZrN9pZEWuGlVDJADNiTn751PKp
 gnMOjsoNJtNX+KZXHQuWdihPSqQ3QIBx+DBnMPv8SEugIm6ExR/g89/ogyj30A/JUyR91v/O
 LfKJllk7lIU4s/cb99LP1pe7r3NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0ZoJno
 jbWl8wjx99R6vXM7zM4HR3yGGOfI3kNg6dj/22pqIJ9YEUfYCbcRFqEzsV4o+dS/Z2OLyvZx
 /8AuMQPxbZFxqfJW945XyBZ3BsEwhubCRsgKdcZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-Talos-CUID: 9a23:SNOc2GGd6PwXxL/KqmIkyFEGAfp+K0f991r6Lm2GEFhWEL2sHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Ab56vpQzNBWCfRjotdy5cuSO+nwSaqJ6xJRBKk6s?=
 =?us-ascii?q?kgPTHCxNgF22ipTDuXoByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106348824"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbwtbursVbivaWSRocTQd0LWVyUWKuLyvPfQVNEviZ6tSY6nT+/kH5mJeb0qXZX5RLXPdIFsUULjMnxQIZ7WXr0LamjxGdt3KDVfAH7kEhWgm0nOXE1+zknbftxwRn9vEXDhAo+yYHpX1ZlrOkgSo0bPKsQ+DcoGi9mWCF9mbcABrdLUSi8MUtp955nkqN0vxWB5iQ7lqydQUiLNybGZ7lUN7WWwb5TJtJQdrgjmWwqWj46fHdWUhD7kLOybNdgJS5kqACiwo/ofOMEn4EHo2mh8C8CV4HlJqIFkbmdmfgpqZVF/u217myAxVwkOGe037NSBnx8QF7dIO2jfqYlTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN0wmpmoxxOBfT7pEjwKaFozddVpe6jQy1KrqXoAqWg=;
 b=KVR4zCHGoqwdPbQgxyo4P7iflX9oP+UT/8atSEFBpJSeN+SpdrqgxDrMOL/p5isydOvxBTKaRRLuXBgG/KPYMBOemcglpSZoSP9OsOMM4P+uzzPTvCyGRb3dZAFQ9IPhYDpjkcrZVovLgRk5gUeoDvstuaP7W68COEOr6UjUMrWwiHyBi4KBmONdU0uD9vJGRcIVVDsPhmAehZH/t8G92ynOfce7kp1Ftip7EMjfPz2gbsl+Dkcy67Hjz1CCF6Yb17i+C9CeXOyn84GpA0VxEgGtch9vrOG4P4QqoIGysgttzDYurs46Vjd07WKX7zPVohFtLTqGPzzAgXbOJJbjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN0wmpmoxxOBfT7pEjwKaFozddVpe6jQy1KrqXoAqWg=;
 b=KTEO/NvQDZtTb5IP+/TG4/YmiGxP8SVAs/Mqh/etOL/PIp/ZoWrhO7aCnUjElg39U7MCxSjxd4uEl68cNKC84ZmX5jLmAYgwAdpKhG+kbmHqvWqd75y4LE48Xss+1BLniu1NoNZHfKaVLcQ48HGP5nUstyvRFGf+vgC9K+FsUtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] x86/head: check base address alignment
Date: Tue,  2 May 2023 16:59:19 +0200
Message-Id: <20230502145920.56588-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502145920.56588-1-roger.pau@citrix.com>
References: <20230502145920.56588-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9cb7df-081e-4749-bdf3-08db4b1dd84f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	znNSzi0YaNR+2YRay7gLbnh3QPiNRcEiwCY1djwkr9c6rmmRlUFKznkRLTXZHYr7Ws/ENDA6ho/qC8IKOsJe+l7tl96oeiL+mBZ+b8Bm+YYYB9m8s12NGQdZaF8lna1pB8h2oklMxkizh34BE9EZcxrppTjWytJJBZpIrJ5EV7qzfrhvWcZlYan2Q7jwuzw8+qqdUj9rFveypsaC/TSKCvhkNR9Mq9SIBN59IT2Lbbi0bKBBq02V7vWIG8Ywli8vF4zkJwa8RFrB4a5d2ALoOH8uMMIfImJCNdsLxyfAatu5Tx3gqq9ERj4fx19JhzZbtRAkD1FWFwLkttPbQ6VIuwgw8Kxjlb3wrn4MmmbhHXKEbKZ9y3NAEAxl5mbpxEYBp5NCYRZgSIkUu5Wenljf1YQysitzgNYIVgCuwLfhPebkgVyDpAIqbT50j9ydHEsPoWOdlThMtal10ErAnONo2BvIIuHN7Dd1wAQW9mxtLMUvi5kvJJ/BPT/B6cCwrKj+8T7DB9+G23a16L6zAVFU1f8juWUE41lZHcWZEUsdYGqXbuzKXK7AwVVvIu312Z3j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199021)(2616005)(83380400001)(478600001)(186003)(54906003)(4326008)(6916009)(66476007)(66556008)(66946007)(6486002)(6666004)(6512007)(1076003)(6506007)(26005)(316002)(8936002)(8676002)(5660300002)(41300700001)(82960400001)(2906002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEV4VUJyMVMwWHUyWnQ1elJXbWJQZlR0eitZbWo0SVVsOUMzTE1qaWRwL0I1?=
 =?utf-8?B?bVdvUTF1TFRpcWwwb3FqMjNBZ1VjOWd4MEVhd2hueFB6SkpCVVpPaVFkUVA4?=
 =?utf-8?B?YjdwWlJtcTBhV1UrSm9VQ29DNHI4YUQwaWpxTDV1Z0I2QWZ5RlRRZUlwSlpH?=
 =?utf-8?B?RzZCTU05YUdINlhGOFBtV3lkZDJXYUFYU0ZoZy8vVjh1ZlVLMGNya1lSNjVF?=
 =?utf-8?B?eXRpcG5HVUY5b3liWDd1VmUwbVVZTEpkVUltbURMdVBrNXJZZVJxWG1kbmxG?=
 =?utf-8?B?Nk9uZ2NRdXk5NzhrbWlRNDdHeTMzaVRENHp3NWwwMUttUzdLNzhaZzM5VjRD?=
 =?utf-8?B?NnB0VEhFMi9MTmJoYXlVbXorYnp1NnEwUmpuL1BUaEx4VlBNeFBDMThUaGts?=
 =?utf-8?B?OU52dldkOG9tdVB4eUdRUWtlSWdtV29TTXA3Q1hSY0dURjVYN0dGb2oxc1p3?=
 =?utf-8?B?dmpaVEg0SkZ1Vko3a2UwY2hITmFSRENIcjlCRGJ1WmlwQTVvdjAxc0FCZ2pk?=
 =?utf-8?B?SzEwRWVJYU1KUElWZ2N0aGo0VitrRVAyMkJOcFZ4dHJNNjNKTitYenYrbWtn?=
 =?utf-8?B?QXBsMUhKVUFpS0xRcWhHUmRNbzg3a055RVJJN2djZVBqM0FsUjJ0UUFLNnBh?=
 =?utf-8?B?ZU0zTG1NYyt4clVTOUlPZFptSUtOTnVpMTJmM3dUOVlCcnE2Q3R0YkNCemp0?=
 =?utf-8?B?OE9YenB0UitvWjI2azVkTWkzT0g0U3g1U2E2NzNEU2taSWxLY0lDa0dTZVZx?=
 =?utf-8?B?YzVMU3lXYTArK3lTc0k0ZFBPb3J4VDJHNnoyMVZRTmR2NjBmVllRSUgrSC9P?=
 =?utf-8?B?OTFBeWZQRWdkMjVyRlp4K25LT255ZGZLckFEcXM4M0ttNS8yV1dpME0weUZh?=
 =?utf-8?B?b0ZOWGk5eU1Id0p2V1BYbGF6TDRRUXV4RVlETW9zK3p0aGJDU0FzSFpFYXNM?=
 =?utf-8?B?SVN0ZlJ0UElWcWhxKzFoZ2VLaGh0ekJ5eVl3THVMWjBYb2p3SG05OE9zanVa?=
 =?utf-8?B?cGpmdmFVMWZMRkhrbjR0a09iVTlyYVpDMGtiNG5wdEZDMlFZR2dOR04vZSt1?=
 =?utf-8?B?T3czS0s1SEQzN2FrckJCczNHMy9VdjdIYmVtUnluOW5rQmpmS3Z3dVFqb2k5?=
 =?utf-8?B?SEpXZ1FRdlJjWS9uUGFCeE41VXZHVXdBQjZCc0FVd3ZCa2pDSW9VK1VBWlNw?=
 =?utf-8?B?VkdQclNmVGZLNGJLNm5VeFppWWR3QlBhSDU2SlQ1TGd5N3VpSlVzQ21UeERK?=
 =?utf-8?B?dHZqb0xwMmlyL0tVNVRxQjZWV2FNTVVlZHliYTBHWUZ2VTl1YSs5Rlc3cWNr?=
 =?utf-8?B?YWRlaUpXS1AzSXVmVjVlSUpINk5JOTJUdlBXc254U3BMOHBUUGhVYTNXaStY?=
 =?utf-8?B?dkFnL2xLcStJV2FuZk5TZFd3VnI1dW9wbEZZcm02R3h1Vm82ZmQrTDEvbHlB?=
 =?utf-8?B?T1BPeGdDSFBsejM2QXU2N0ZmVXJ5dlp3WUZyS1FWWVJRLzcrSHJZS0Y5YUhq?=
 =?utf-8?B?Q0FOaTJlZk1qU3ZaU2hoaVRmejNCdTdpUjY4OTBsVTQ5cHE3TTJRNDJzdWQx?=
 =?utf-8?B?aUh5VVN6SlJ1SFIwdWg5SkZyWURBSXIrRG5qRys4Y0JBRUdtVmdHVjBXNXJv?=
 =?utf-8?B?dU5sM2lqN1F3ZU5FT0ZUakdMSE9EMjVXOVcxcGJienRwMWk2N1hZcEFzRHN3?=
 =?utf-8?B?ZmdmSDBuOXVHTE5nWjlhbkxWclNGWDFySnphK1N2T3hkUC84S21zUmhTdEkx?=
 =?utf-8?B?d0k4d3kwU1hwUGdrZXppT0dSdlNQMVBlYXhHcWZTYkszQ0ovcmpvWFFPaWdC?=
 =?utf-8?B?WFFoTHRaditZMlpLQ0IrNFRRSHJsNERnendNTEkxZThZTWJZMHMzRlcyNWZl?=
 =?utf-8?B?bkRNVnNibWI2bnYwMloyMnN0by9qNFZWaXJMYzFNTWtjU0RYeEdUUElnakR5?=
 =?utf-8?B?OWpmNzBsU1QvMTUvWjZOZ2kzZ1NMN2FzZVpJdzA2SkpIcHF3bG1hd0ZVVjJa?=
 =?utf-8?B?cThGblVEZ1FPRWxvdytpMzZVVG1oMUhzd2hiNkZTM1RpQWlZRlUzWGp5UEZI?=
 =?utf-8?B?aGdTZnh2WFlOQ2twNWpUSjFDdmQ3UUluYmx5QzNhY3d2b1k3U0RzZG1hc1p0?=
 =?utf-8?B?c2dZdjJ3YVVUNnFOWmpQS0pPUlRJNDRPajA2YkJjQU42RDR6eStUeDNqaXRB?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1jYcfwCL3Xf/ZX7ZhOwangIto81AOQzK7G2EiUX4xfKqpXh09udMo1FPr6HrqukmQ22QI3Cj1sos4uZSwardb27UnPvwvWYOuk3qdWFUPeeZCi5WONONOL3VgW5YWvCnlZwZ2wjfxa+8dRGMabJHFTY/6uBmNy7KUe1HGSpjWon0MmRPe8oebHvcNR8Po1ikebjWqzd9KZ0kWpkjay1pZazNh2jOFGdSTaSQnZbCQpxayvx0c1rux7RIQof2piB9APEl+nVC99NO+m54FmRY+dtq/O5nJ6vnNT5O8QtmjahdV/S05cynI4RzTu/JSd0NGx3ajTxfwaSPS9EDXozqPrR9yG/BOX+ffkRX42+9UrGajTQUyRPtzMbeCRhkw6/Wxcxrl3fcyPmWkBDsTu0uOGYF/pcvIAuZTCIZQYTY35GROR39655zEGYTwhs9+z0mL1RTsTiF8jIHxx1hs1Ylh9cUZ+fzNAPnJQ9cGuuNX19aSLfZjsCrdmt+D5c7ygYgqyEbiScPIwbsgp9jenSapYgv0+TNjHwPJuUldGUCAcpX/sKHIgzlGGrinRU9BXr/QmPXlDSBy+XqKlYnT6748wDF7ckzwR1zoVlC2ddj1sy7mb23V4TRLfJT4QBDcnIWtlmOz/Sa00ArLz92EdzBJH6bSKjaxBbEeYQPnMNLSlT1vo7zekjQUMNpgm2zoGp8++ngNF423sQG68S2/to3LvCoBRkBpMaxPSYwSuiezO1n+dqE7c7gK7+6aGPII+DPZG2X6RZRdiCeKMjwGk+5NQV6upRYLoLYhNXJ3nBJCA3iE4ZNwzh2yOu4v1N5vX1M
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9cb7df-081e-4749-bdf3-08db4b1dd84f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 14:59:36.0102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS2arztY9VNnVnduuTDlLji6U7vS7RZbsvczys27UrhDF/XImIj6fUXNrieAxft+Xi/epUqhYf5J1S9Y0DsYOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6422

Ensure that the base address is 2M aligned, or else the page table
entries created would be corrupt as reserved bits on the PDE end up
set.

We have encountered a broken firmware where grub2 would end up loading
Xen at a non 2M aligned region when using the multiboot2 protocol, and
that caused a very difficult to debug triple fault.

If the alignment is not as required by the page tables print an error
message and stop the boot.  Also add a build time check that the
calculation of symbol offsets don't break alignment of passed
addresses.

The check could be performed earlier, but so far the alignment is
required by the page tables, and hence feels more natural that the
check lives near to the piece of code that requires it.

Note that when booted as an EFI application from the PE entry point
the alignment check is already performed by
efi_arch_load_addr_check(), and hence there's no need to add another
check at the point where page tables get built in
efi_arch_memory_setup().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use test instead of and instruction.
 - Add a build time check for sym_offs correctness.
 - Reword part of the commit message.
---
 xen/arch/x86/boot/head.S | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 0fb7dd3029f2..b9c9447df9df 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -1,3 +1,4 @@
+#include <xen/lib.h>
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
 #include <public/xen.h>
@@ -121,6 +122,7 @@ multiboot2_header:
 .Lbad_ldr_nst: .asciz "ERR: EFI SystemTable is not provided by bootloader!"
 .Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
+.Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
 
         .section .init.data, "aw", @progbits
         .align 4
@@ -146,6 +148,9 @@ bad_cpu:
 not_multiboot:
         add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
         jmp     .Lget_vtb
+not_aligned:
+        add     $sym_offs(.Lbag_alg_msg),%esi   # Error message
+        jmp     .Lget_vtb
 .Lmb2_no_st:
         /*
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
@@ -670,6 +675,15 @@ trampoline_setup:
         cmp     %edi, %eax
         jb      1b
 
+        .if !IS_ALIGNED(sym_offs(0), 1 << L2_PAGETABLE_SHIFT)
+        .error "Symbol offset calculation breaks alignment"
+        .endif
+
+        /* Check that the image base is aligned. */
+        lea     sym_esi(_start), %eax
+        test    $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
+        jnz     not_aligned
+
         /* Map Xen into the higher mappings using 2M superpages. */
         lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX + sym_esi(_start), %eax
         mov     $sym_offs(_start),   %ecx   /* %eax = PTE to write ^      */
-- 
2.40.0


