Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E605719B21
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 13:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542416.846251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gne-0001dJ-EX; Thu, 01 Jun 2023 11:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542416.846251; Thu, 01 Jun 2023 11:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4gne-0001aD-BL; Thu, 01 Jun 2023 11:49:02 +0000
Received: by outflank-mailman (input) for mailman id 542416;
 Thu, 01 Jun 2023 11:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSga=BV=citrix.com=prvs=509a852a5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4gnc-0001a7-PX
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 11:49:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49dfb681-0072-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 13:48:57 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 07:48:49 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5711.namprd03.prod.outlook.com (2603:10b6:a03:2d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 11:48:44 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 11:48:44 +0000
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
X-Inumbo-ID: 49dfb681-0072-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685620137;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2uKlIzqwEkjSGvU8GxUjZI8/i7gemQqlgWMqB5xqL+g=;
  b=LKqSt9OCptkbv5VlzsYcdgGfFYM1qDcA5CN+UcFtH6k/fUTal4MHFlFL
   iloVfRaBIlHoY7VpsA5x7dP561WTDeT0uUZN8X3N1Iu3CwhFQoRPYRTv8
   jqkwWteXm/DKvWLNfxvgcJ75NYiy/5dQ4cJmrqcJ7ZLgCTTaUOiygh9l0
   0=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 110541804
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zmYdua4QAsNmEFtglyTKNQxRtB7GchMFZxGqfqrLsTDasY5as4F+v
 mIfXG7UafyONDH3fY0lYYXnoUIG6sKDyIdnTwBoqCs2Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 KYGNRMfLSq6pvOU/r78FfZ1g+gYI5y+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOKF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHumBNtCTOHQGvhCkHC+3TExCCIsb3Tn/PC/jlWHaf4PN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAEDvN/qpdhrigqVF445VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:88bUR6gD5KBn5KeAFWTkgmB0aXBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-Talos-CUID: 9a23:BAkVI2xXvmlpiVGPSK/5BgU9QN44UW+e9k7xMm2GBSE2V6SQZWSfrfY=
X-Talos-MUID: 9a23:EB93fQqBnMggQ0Zkf94ezyFPGdw1waSRMnoizcgPvc2fDB5cayjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="110541804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY6YFbMmpOi78Z+NrLKJkKGSEIPcHYjuVFzchglaZMxk9spBO4R1inFcL0CSlJtxYDvGjZzfxopM3I/Ikv3tcgXZH0uAQ6zven/Xf2++5kJn5gArZ9WFCOwZUY5oYSMb19EfHbl+qydkAa7bin1FeFL/LLqzwyHO3yC3pOg0jYdOOHu0is49gR63SxHJNFhkfUuaOQ655Rr+ksJarqqxcOzcku1WI6Tkzhpi8AykyHlZwpY7m3h3rAQ62gK2JQcvISnc3kjh5Y7wcZMyd6SQG6bovujPBltrHWvz5oV+XPWllzHRmcn/mFo1fr6PP+KPbWi57C789T+7WUG3ybalmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tToSUdSCbOvnHB2O9LkNMXWIiRBIIw5xDKVTTFw/dkY=;
 b=CiH6ZMh1Jog8RKLXBxgFntKK6eW+BcAe8u0ij8mNNdHTT7BiYxsdydwRNy4thWIOWDTyUI3U/go4iCEBeNsi+YLAVxqhD67H0HjBn+waNmQ1Mw1Lo4IqSs+3uyOlp/RGas8ZS71Qg3a8NvUEXeoQDIPoNSbYVbsr7JEYa+x+yqb8XTGvj/48ZG/ciYBiT5uMF5omaOu1tM2IVNuQ5jth8Rea8rYOR/2lKqTcidNXClJWbarezeFsPcyQtv+oznbT9zP2EX34nR/LB2Mot4lJrtX4DRttt5k5+njFVEHPhLsuEePYDsTm79iXY5M8AcerseorXU9uGMSgu5xTsnL8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tToSUdSCbOvnHB2O9LkNMXWIiRBIIw5xDKVTTFw/dkY=;
 b=xNqfTQPCXCuGlrg6dfhu42qoIRnWjNLHZZBgqefSjDUxePEUxTr9SDXndlMscOJmvSP/FNUX0pOYYQnh+LbcP5UtfiB5aA2lPrQK5Co/B+YIE/MNnarFDpHKizUqKkPOjMnd9p6601iwSUrXqFnSqU3OHWACcQHFUcIrILSfmKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 1 Jun 2023 13:48:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/vPIT: account for "counter stopped" time
Message-ID: <ZHiFliv3GV1aQnY4@Air-de-Roger>
References: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
 <355c5379-ea9e-582c-0131-816204eb3ace@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <355c5379-ea9e-582c-0131-816204eb3ace@suse.com>
X-ClientProxiedBy: LO4P123CA0482.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: c6cbb7af-584a-40bc-7505-08db629626d4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QMXTJ8n4fyFnZmLus/p96AWG2qM9xQSQ996AH1fGWeGlZ80nzU6GGsYOvNK8QjZaDiyiFRUalGspOPWXgiINXowGRSeNtuNdhjSgl0x0JZRMZDKW8YUgWn6Mfmfshuu3vAxoued6SQSxjPHqJaKAERmFZxrwCxw3UKHBzgR4YyirUiM1BglJXCpRKw8hogy5rM8YABaQAUZHSbXH4PcTyCdzKBHcjoBbNA0OTmgsoz6ETicSkiDpK8Nhfpn5foIH+GbdJFdTLlnmB6e4DHM/lX0czdRR5XpPhOckuvPQ2wQYbMkfcPwCPwYZUx0isWIajz8xA15RO4xyWtAKfGDlklu700e4uqoeYceek1LHOq2Qi2ulAFi8tv4P/Qg+WZ1vcEubY50qOc0DRs3v2ZlQ6XLugypu5OsveFvTd5VTl3lc2Xa8+qrN/7XetcpJ8SBNLsM2lOo+jPnnIpI7MvBaDQRDy69X7dm66jEmLxfUkydQNnSOMoNZWfws6GbTDFFv2lRhQBnoAGDtl0kEq6MG7THmWQCAIp/5pOQEU222WgHEd4khyna2mFciuRLWXSWaFpjiJiz0+uFzflyIhqfSHZLG4pKBb2/htFG06PBTwng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(54906003)(5660300002)(8936002)(316002)(8676002)(2906002)(6916009)(66946007)(4326008)(66476007)(66556008)(41300700001)(478600001)(66899021)(15650500001)(6486002)(966005)(6666004)(6506007)(33716001)(9686003)(6512007)(186003)(26005)(83380400001)(85182001)(86362001)(82960400001)(38100700002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xDYkpjRk5xdzVsMmUwVTJJeWZmR01HZUhRbWVyQnAxYUV3UDVLSzJ3YTFB?=
 =?utf-8?B?QlpTZnlheCtSd1h3cjNoOGg1ekFFSTVIWUFsS3BkdjdncnEyQVV3aERNelpL?=
 =?utf-8?B?UTZMOHI5SFI5bW9LNVFValBtL3kwVUlUK2k5WXBMeFBkZWpSQyswZXJ0dEtO?=
 =?utf-8?B?VXFOREJmWXUyZ0x4ejBaeklNaCtDclptRlFRa1FwcXdPby8za1hySnhuVG5U?=
 =?utf-8?B?M1hYZUR6clBOZGdrRlpEWmEwK2h2ZUdPUUVyaGViNXVNamozRTVRK1JGQi9M?=
 =?utf-8?B?dzZ1cTZhZEEvQUpIQ3FOclg2MEl5MVRRWTZtUWgxR1Y5Qkc2UUo0TW45aE5L?=
 =?utf-8?B?YzJsOEdpODZ0cHcyNFloTXVLK0FwVHgzaWhETjloeUhvN1hUM0NyVDZpdFFM?=
 =?utf-8?B?NDgreGNJR2NEYjFjUVR1L2lWZUxaSjRnVDBERnZ2NzczZWxKZW95OEVGbytz?=
 =?utf-8?B?MzV6cXduMjBOK0lxWjFHRklZMEc5MkFxSUg4eUEwUmhGVnk2ajZxcVlsYnky?=
 =?utf-8?B?RTRjS0hyRU8xanN5Q3RaaFVQdGRNTWxteEJvMmtXSHc5SXc4TnRtRjUxeHc2?=
 =?utf-8?B?YkVTaHVFRkY1VCtUL2dVTnp0ejUwVEhDdjFIQ241cnNVZVl6ZEFaMmdiOGx6?=
 =?utf-8?B?TXNTL3dURndxUW9JWHFVRE9obWtud1pqZHhaK052VG1mL0pZMlMybFUwUFc1?=
 =?utf-8?B?VGxRaXIvcFg3VFZhanpyUDljbER6b1oyV1VmRTk4cVFpSGxCOFpTSzJKK2Nw?=
 =?utf-8?B?eTdkdWhHdk4ra3dLREVwV1VSSkFya1JIdmtXa3dvbWxSVVE2Sy8vdnVLUmIw?=
 =?utf-8?B?RXZMdnp1Z01KK3BIMitKUlBaa3FraWFuY3VzQjVQVzhTVG1FNFBUUVcybDRz?=
 =?utf-8?B?elp2NmdsOVpLWXR0VmVpcGxaalcyVFNYdVV0eVJ0OEF3Mytsc0Z4NVlnV2dB?=
 =?utf-8?B?d2h6RmRvYXdVdGRMS3JMaHZHSmxOcmFyOUZFckJHK1UrNzQrY2lWRytSTmR3?=
 =?utf-8?B?R0F5U1YwN1JVYTFUM2ZhRm03aVk4cU4yTGlLdFZlanNzTWs1NGdFOGhMSCtu?=
 =?utf-8?B?MVRKWlZ3aUkyU3ZNcVJUZmlpN2lWVTNuc0JLcE1LQUNkVDRxQjhPOWd1V3hI?=
 =?utf-8?B?UHdWYkdGam42UmRJVUpCbVp0UjdVMXF2Vy9VNVE3QUxWQU1jck54UUpwZ2t3?=
 =?utf-8?B?d3Vsai9LRi84SnZ2TlVkZFpTMlJMUG1IaExKUTN3NWErTWxZYXE5K2JGRElv?=
 =?utf-8?B?cWR0OWZsT1o0UG5wdXRpRE9Tc2VPQ1Q2ZmZUVjZrUHpzUFhqWllHTGY0Nk1F?=
 =?utf-8?B?aTVXdjBJQlJuTXc5YUdOWkIxM3NWandKRVVqVDJaczVRUWFqeVYyMlpnaVQ4?=
 =?utf-8?B?L3BGbHZWd2tGR3lNeFlGb3NiS0NkQzZ1MFV2Wk9WVU9kcUFIMmcwZ2pSa3lu?=
 =?utf-8?B?a2dvY3ZvTGhxRytyckYvTkFuejJLZEJUblVUWW9xRGZTN3J4b1FBeS9DQ2g1?=
 =?utf-8?B?bW5kUzYrK3pzYlQ0ZlozTFh5Wkk0cG9SSHUzSGd2MGhVRUpBR0puZ0phK292?=
 =?utf-8?B?RWZUUHE2QnVVSk54TFg0RHFXTEJ2VVN2Tmk5QnU3OUt2TGJYdVRTenNMWnhp?=
 =?utf-8?B?cGdSVTI0S1VEaUI0RVhyN2FRRElrdTQ4Q3FDK05jSGJuRFBBVmxWY3I1K2ps?=
 =?utf-8?B?Y1FhM3FlSjRIR3BRNnVJQVRPVHRmenU5YVBkRG1rRXdxNG41eVNVWGNBbmRz?=
 =?utf-8?B?K0lFY0t5bENOcDdOZUxyR2Uvbk1ya3V4TFVOUDdoOU5ZbmtHL3gyTFhSaTA2?=
 =?utf-8?B?cGZidFdvTFVidnZUZ2ZsZjFtcG1ZenZoM3BuekowTHVjYjZEOVgwaXExUzds?=
 =?utf-8?B?LzlyRVFnYjdjQ2ZYTFBET1I1NzNmc2Y3OVZMdjVGUTd0a1AwVmw3bVhBUVhS?=
 =?utf-8?B?MmxCcTQ0cmN0OWFUTHhRaVpMVWUwVy8zWXhXcy8xaVM3Ums1T2ZYV2JxSkJo?=
 =?utf-8?B?TGNTTXJ2SGgxOXJEYVgrMjZOa20vM3MzSkVJM2hmS3RvS3lhUjRwLzZvR041?=
 =?utf-8?B?Ky8wUnRTbDh2c0pnSTRKbGlpMUFUVGRSVlVKQ0Q3d1NGdVY2eEhMMnI4SmNS?=
 =?utf-8?Q?8LeEKC5CypbiPBtiYUjOYu7YZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YUppIjDdt8pSh1C8Mygd8T2Kh84Dcn0f0tcNKaPg7K5+fVAVlFho2fWwE9fXuTf+Xa6+iP6Ne2mjRqQ4e4/tf7gB3TcoPHFQdyb7f9sz3n//5rhTzVudy1PGarOJUiVPYAQc4K24Cm82q7dHAMbK3gFsU6LuNo9wxEOJPkM3jrC61OKSk273YlsNIv1kRmFzWs/ghKsoUnc4jlSlp75W9wZramLGg+R6EKcXVGDb/b8Ql5zmwrNuP1KiVB2B5oRPuUjHWojQz6POF1qqX8j+HvhBUy7DLCfxoRQubS6OLQk9pbi0rN3P/73hl/5ZUeadZkL5G8gXo/tHq3XGRrBSGtuK20cCpD2AwQgsxgEOEnUK1rDOFPvu88Oo+1jG0YW+2TIWb5jXt8VCC+xTvKxhNBWD6jjVnnwuwN0kd9L8ZL2YhWXN3M0EQLeitNm/NcaVKccZbGL8eyckvSWdLRMIu810yb/HvTHItfnNh8LurTflMT1KWN56gDvFNL4OkpbsHs+edBXOee8sUPptVDQm22AKOfX/eZ8RPTD60VwWUMfcJBL7sbhPDr9fga4i2kurI3PL9ECG0KL0FeLgzue+HnjopNPezq+Xxv08N06uCLczs/gRoSkSi1sq3nWMmcBR/9NLWP6jvIrG96x8jIBmZc/IyKXVWSRFKtZHjCnQeVAnJ2XQYdcANu2k/Mjot1LxFv1VUC1ou4aaC1pFFBRkIz3O/zr9py20b8EwC7cAl+F4oS6ovneq25UWU3UZz/qVgaGUSpaUWsjfjfIcLDVjDE/0lOwAYzzYAGdXuuA7XgF7ljKghRkMcufIzQAFX0VS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cbb7af-584a-40bc-7505-08db629626d4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 11:48:44.1906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwA4YxXvRWiXnEBHU6fRfpeI3mauvxESxoDCFMxhBJMPwGMH1IdH4kEhjeJijA+7SE6LB3r1DNrq58jIZyPPUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5711

On Tue, May 30, 2023 at 05:30:40PM +0200, Jan Beulich wrote:
> For an approach like that used in "x86: detect PIT aliasing on ports
> other than 0x4[0-3]" [1] to work, channel 2 may not (appear to) continue
> counting when "gate" is low. Record the time when "gate" goes low, and
> adjust pit_get_{count,out}() accordingly. Additionally for most of the
> modes a rising edge of "gate" doesn't mean just "resume counting", but
> "initiate counting", i.e. specifically the reloading of the counter with
> its init value.
> 
> No special handling for state save/load: See the comment near the end of
> pit_load().
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00898.html
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: "gate" can only ever be low for chan2 (with "x86/vPIT: check/bound
>      values loaded from state save record" [2] in place), so in
>      principle we could get away without a new pair of arrays, but just
>      two individual fields. At the expense of more special casing in
>      code.

Hm, I guess we could rename to pit_set_gate_ch2 and remove the ch
parameter.  That would be OK for me.

> TBD: Should we deal with other aspects of "gate low" in pit_get_out()
>      here as well, right away? I was hoping to get away without ...
>      (Note how the two functions also disagree in their placement of the
>      "default" labels, even if that's largely benign when taking into
>      account that modes 6 and 7 are transformed to 2 and 3 respectively
>      by pit_load(). A difference would occur only before the guest first
>      sets the mode, as pit_reset() sets it to 7.)

I'm in general afraid of doing changes here (apart from bugfixes)
because we don't really have a good way to test them AFAIK, maybe you
do have some XTF or similar tests to exercise those paths?

> Other observations:
> - Loading of new counts occurs too early in some of the modes (2/3: at
>   end of current sequence or when gate goes high; 1/5: only when gate
>   goes high).
> - BCD counting doesn't appear to be properly supported either (at least
>   that's mentioned in the public header).
> 
> [2] https://lists.xen.org/archives/html/xen-devel/2023-05/msg00887.html
> 
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -65,7 +65,10 @@ static int pit_get_count(PITState *pit,
>  
>      ASSERT(spin_is_locked(&pit->lock));
>  
> -    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel],
> +    d = pit->hw.channels[channel].gate || (c->mode & 3) == 1
> +        ? get_guest_time(v) - pit->count_load_time[channel]
> +        : pit->count_stop_time[channel];
> +    d = muldiv64(d - pit->stopped_time[channel],
>                   PIT_FREQ, SYSTEM_TIME_HZ);
>  
>      switch ( c->mode )
> @@ -109,6 +112,7 @@ static void pit_load_count(PITState *pit
>          pit->count_load_time[channel] = 0;
>      else
>          pit->count_load_time[channel] = get_guest_time(v);
> +    pit->stopped_time[channel] = 0;

Don't you need to also set count_stop_time == count_load_time in case
the counter is disabled? (s->gate == 0).

>      s->count = val;
>      period = DIV_ROUND(val * SYSTEM_TIME_HZ, PIT_FREQ);
>  
> @@ -147,7 +151,10 @@ static int pit_get_out(PITState *pit, in
>  
>      ASSERT(spin_is_locked(&pit->lock));
>  
> -    d = muldiv64(get_guest_time(v) - pit->count_load_time[channel], 
> +    d = pit->hw.channels[channel].gate || (s->mode & 3) == 1
> +        ? get_guest_time(v) - pit->count_load_time[channel]
> +        : pit->count_stop_time[channel];
> +    d = muldiv64(d - pit->stopped_time[channel],
>                   PIT_FREQ, SYSTEM_TIME_HZ);
>  
>      switch ( s->mode )
> @@ -181,22 +188,39 @@ static void pit_set_gate(PITState *pit,
>  
>      ASSERT(spin_is_locked(&pit->lock));
>  
> -    switch ( s->mode )
> -    {
> -    default:
> -    case 0:
> -    case 4:
> -        /* XXX: just disable/enable counting */
> -        break;
> -    case 1:
> -    case 5:
> -    case 2:
> -    case 3:
> -        /* Restart counting on rising edge. */
> -        if ( s->gate < val )
> -            pit->count_load_time[channel] = get_guest_time(v);
> -        break;
> -    }
> +    if ( s->gate > val )
> +        switch ( s->mode )
> +        {
> +        case 0:
> +        case 2:
> +        case 3:
> +        case 4:
> +            /* Disable counting. */
> +            if ( !channel )
> +                destroy_periodic_time(&pit->pt0);
> +            pit->count_stop_time[channel] = get_guest_time(v);
> +            break;
> +        }
> +
> +    if ( s->gate < val )

Shouldn't this be an else if?

Thanks, Roger.

