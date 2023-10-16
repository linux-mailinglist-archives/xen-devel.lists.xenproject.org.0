Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A27CABC0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617671.960497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOlP-00031L-GD; Mon, 16 Oct 2023 14:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617671.960497; Mon, 16 Oct 2023 14:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOlP-0002yJ-DP; Mon, 16 Oct 2023 14:40:11 +0000
Received: by outflank-mailman (input) for mailman id 617671;
 Mon, 16 Oct 2023 14:40:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fZZ=F6=citrix.com=prvs=646b5f8ff=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsOlN-0002vE-Qz
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:40:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5604f1a-6c31-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 16:40:06 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2023 10:40:03 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by DS7PR03MB5413.namprd03.prod.outlook.com (2603:10b6:5:2cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 14:39:59 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518%5]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 14:39:59 +0000
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
X-Inumbo-ID: e5604f1a-6c31-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697467206;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FTFOINn5MJ1cpQG0nEOk7aYXM2FdGiOKNJkhRdC2J08=;
  b=TTIVEX2TD3+MEl5qdSDMoNh9eSNQjFoUHJkD+ygPZ9ki49y7jT5N6XKY
   TXQB3ZrE+JvgLsvaOUFQWgT679JtAleb5x3XQhtSEBHS1uLRvslAVFF9V
   WM3QaHWop99Fb3zVntAXHKxb1teR+4d2i48WkzmNIt+8u3N64vzNUMixK
   o=;
X-CSE-ConnectionGUID: Fq3RIl/lTM+8a/qjRztFlw==
X-CSE-MsgGUID: VtTW5Ia/TmyRVP2xWDgRrQ==
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 125711680
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:aJfqDa6m9cYCvwjqvNYqywxRtLzGchMFZxGqfqrLsTDasY5as4F+v
 mNNX2yBPquLY2Kkftgiaom09R8OvZbcx9Y1GQprqCFnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgS4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 +VDEhEJKRS/oqHmyfWiSNN+muonM5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx36kAdtMROXQGvhCvkGv+TEyAVoqUEqBn8HjmnGSVOhFE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml6qfS+RffOWECQRZIctlgv8gzLRQh0
 VqMgtXoGS0ptbSTQH2Q7J+EoDWqIy8XIGQeIygeQmMt4cTnoYw1pgLCSJBkCqHdpsbuBTj6z
 jSOrS4/r7Yel8gG0+O851+vqy2ojojESEgy/Aq/dnKo6EZ1aZCoY6Ss6EPH9rBQIYCBVF6Ds
 XMY3c+E44gz4YqlkSWMRKAHGuGv7vPcaTnE2wcxTt8m6iin/GOlccZI+jZiKUx1M8ECPzj0f
 EvUvgAX75hWVJe3UZJKj0uKI5xC5cDd+R7NDJg4svImjkBNSTK6
IronPort-HdrOrdr: A9a23:7qgjeaukNlej0fvAqzoLqV6w7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: =?us-ascii?q?9a23=3AI/ixWWpyGPbF9AEC5w595k7mUe48KUf8yDDUH2r?=
 =?us-ascii?q?7WW8uUb+vW0O+/Lwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AHIFNagxiMWyYd7BONJvw61AdBaqaqJqyNH9QsJx?=
 =?us-ascii?q?Bh8yVDxJIYSeioDuNWLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="125711680"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7Sb3Ce9Zyg7WdaLfqVWE1OO97KV5HIaVzMjUaNnBPEzxRmchD6fVa2SI1nZzG/lYKv/SvM0vw4yL05pJvALs56CyXnjk5BgGFf42oOItR8Y70ULlmWvsfrBfe5a0j6YfJHJ52JN3qSeOv+OcdMQTFM9uX24hqXcctuP/0r9vr1niCB08bG3r1lCG1T9m3oAAudqBGIJqpbFLq3UtOXUx2Rb9sWSTWZJ8ilcLK6fDRro+DznfAS6S+xiEAubsYwHlNeslJQTlIuCZW7oMnK1CqAls9vFxCd5/ekq4ni5CwSCKStwaimVNTZGLwkOwuQqOweTJQIA3JbAl9czBErc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsGCoAkeC7OmbU/HP9RcjDahdCKqVEdbh5i52RncR5s=;
 b=BdZwl9uR1opwcH2t8cRyIN1hph9TqnaW0MOzekp6Xe9dp+Fx3zK1xSjHokW+eEcQUYKWtaZJmzDue9V5W5iW5Qv2MPlKVIJBmHRK+e2Thzjh5kSe1DzjOSxwme2k0x29yDtY9QFfC4xkvMJv1HxsJ2IWFUxp81uKq7mWhZyTDcPCpgIiOuGfCvqWAAgSdN7EEkCQfYq4qgk0QjPKPZI3Cm5nDO+In+WB4lp2D4y77gWiEEoR2XDSJZDVQ5En6Vq0z/71GO6/e0zVJvPb91QjhKDPcx59SyF6vH428UYpVPSVNyCYXlT7TB13MZL4tRK/jas/DKUHPIbaBduz+KnheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsGCoAkeC7OmbU/HP9RcjDahdCKqVEdbh5i52RncR5s=;
 b=eimRk/7GIEIBUVTFRonrWZz+eNhbDg+zMoJ0tbgcKoC+6w3oIWjZNWzD4ejjD3Mrye1hJ2SpD7367gY7ud/6z+vfAPVNGaiVVhjEqJ4+82ZWZoqJyKZvLduiG+Nk4TPUj9YzmYKCJCDyzTaeogwU70W6QFMiMI/aCfGTKqEl3uM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Oct 2023 16:39:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] domain: expose newly introduced hypercalls as
 XENFEAT
Message-ID: <ZS1LOYtL09_PoVAr@macbook>
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-3-roger.pau@citrix.com>
 <b8c03b77-d4bf-3be7-2090-e76e6849b085@suse.com>
 <ZS0z89xtFzkmK8_d@macbook>
 <2cd47d7f-00de-3409-c21c-561c92a5c42c@suse.com>
 <ZS1CIFA1FoeGHONZ@macbook>
 <de39a4a1-bcb4-b0fd-e18f-2892c428c8f6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de39a4a1-bcb4-b0fd-e18f-2892c428c8f6@suse.com>
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|DS7PR03MB5413:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f268ee3-efbf-4c5b-a404-08dbce55c5e9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j8Rn4veyTcOFP/07DLyeju/zAn2rw0oQc3dTWL6cYYfU84yLF0X0gJmlgGufSgInA+rdFHMdbHXq8pqBdHOGl2neYmfV5OWNb6t2Dhlb0hdBqt0ofVdqkPi2ixd9qRr1X3yQkVrua08fDPj4BCyErzvnKWe1gQgTxiVnT222DdbtTB8SbY0KBKwUVQ9KgB72cc6TvCp7/g36P2P5vjfuccxwX2k86ftIzrlb/5eqgSBBgcmsg8/JaIXreNT5jf/TrPpN3Jwz3hAnWBy+y0EocM3GVZa+Rup+lieERprA/KGQfMAfYgKbSids1TjTLkk3FAEL/gZb16M4L1CjDR3sLZzITwNdqdqDebWyCeuKOrxUuP+C/G5cy3yj+8buE4ZEbCKu6hOOUCtoHMWPnAgyavzvP2igy9+C3h5qJ0bcdPCzMo4u7R9Wm2UuskxQZp5AuUOgHIlW4hFjBrC1dtJVpb0NZQcYqsG3edemY5N1oIb1DnHvARDoKzhvPMT9kW3eBqX3v/i7uO9RJq2kFoVk7HL5bLCC6UKuaedECEWGfXMjMQCe0xsn1hkfn7Gvzjae
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(9686003)(8936002)(6512007)(38100700002)(26005)(82960400001)(478600001)(6486002)(8676002)(4326008)(6666004)(86362001)(2906002)(5660300002)(316002)(54906003)(6916009)(66556008)(66476007)(41300700001)(85182001)(66946007)(33716001)(53546011)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW9kQlZBRVRRQU5maXRKQ2xEdlptOWtLRDJhOC9GdHdhaUZNL3hYUVJqOUt0?=
 =?utf-8?B?YUgydmxoWDQrWWk3QjFvR0ZMNVluL1FwdVRjVVorN2g2eUJYb1k2MUN6TlpF?=
 =?utf-8?B?T09pVDZEakZ3bWgwWFFYdWVldDZDUGlBQ3NyWU1UTVZWVkx1blNvR2g4WVZD?=
 =?utf-8?B?ZjBzeW56TjZhSWhpcEdIbjZEcjh3SFRsS2lyODhjallIbXYvdnNSTnZKeWlw?=
 =?utf-8?B?U0VsdEFuZXM2eWNsZ3VnZjExOHdsL3lOdlNqR2lSTzFXaWllUGdKZUFmcVdt?=
 =?utf-8?B?SFduOHJFdytUYVRRWkV0N2ZFYTh6V3Y4NElSZGhaeTl0TDBGYkkrYXNBOG5p?=
 =?utf-8?B?cWhhbEw3aEE1UjJqSTRYUlpEdjFMYUVHL2tqa3MrWGVIaUlFNmw3cW1LVzlQ?=
 =?utf-8?B?TFJ0djFUVGRWc29RTkRSSnBnWHluZElJbnhYSUNOQ3ZTOS85MWxYMmNNdnNT?=
 =?utf-8?B?akFiTzNEZXl3a0ZUNzAyVUo5Uzh4STNSS1pJL2k1Q1BaU3ZWVTdoZVI5dW1t?=
 =?utf-8?B?akMwUklDT2tOL3k5b2k4bStzWktndVdxZEVtRWh2REwzdk1mUVU2SWJuOGI5?=
 =?utf-8?B?YlVrcFBwS0ZKL2kwendKaXpYbW1FdWh6ZnRaMmtKNCtkb0d4WnIvTklhSG1v?=
 =?utf-8?B?TEwxNjlCai9CRFhOanpZWTgvWUlWSHBqU2Y4VGJ3L3JyUU4zM0NDRW1GcXhP?=
 =?utf-8?B?dmVubXZpNlNuSC9udG5sVGlsVFdJM09VTlorVlNXR253NzlyZmNnVjFxSHNH?=
 =?utf-8?B?cHJrNnJneXBSNXlSN0Ntc2JPazZmc0VFQXlkN2FOczV0SmFzRm91RXpHbGov?=
 =?utf-8?B?MExXTnhMc2djK0w2SjJSam96VkFIZ000MSthaWg2N0RDbkxLdzFhMDZWeUcr?=
 =?utf-8?B?UEpSWit0TFEwUVA0cDJJR056ak5EUk5PWXFTY2hVaW8rYVl4eFNHeXN2ejRr?=
 =?utf-8?B?ZnBmbE5Sc0VoM2drbm9ZMWlwem5Sc3ZnOG5neG81YkdXVkFpQlQrS0JZYS9R?=
 =?utf-8?B?eDcxNWZubkZFRXkwNWZWMEhUMGRHeklCaEtNVU1WQzlLMmtvcGQzWDQ2SnYy?=
 =?utf-8?B?QWlGSjhNdG9uTnkxL3REMFZqdjgvekt6M3dpZ04xakZHNXNzeEdtdkZMenF5?=
 =?utf-8?B?WnltejFGL3VTRkZFSVU4S1M5a3g5dGwySHNzbCtZTXErV0dCTXdrdTZqcUx3?=
 =?utf-8?B?MVBBTkZuem1rT2w0aHdLZmxPa3hVOGxkVGZLQUpCRThoMXNFT2duL2dUaW9W?=
 =?utf-8?B?MmsxNThVM29KMDFMbkFWalptdkJ5RkZaOXl1aUtTYTVreXpDUjdTY0VaZkNz?=
 =?utf-8?B?N010U0ozRXZDdnlqL0NicjNObTNNYU5QbmJVSm9zTEdGaFRWQm9DSkh5ZnYy?=
 =?utf-8?B?Zk80K2JETVB4YTZyRmZzMStueVpBeWNTaHJKL2xZdDNldEdIdDh0SlBhWmZn?=
 =?utf-8?B?enc1ejNJd1RyNG43bXo0NFMxbUxmYVZRU1RPNUJUVlVxbkJ3OStvMEM0cGpr?=
 =?utf-8?B?Tko2ZDhJMW1sT0F6UEdoYWwwU3hKNHVSOWNGZUJRa3hZMU83K1dDRzl0SG10?=
 =?utf-8?B?bVdXSS9QL3FHZkxMYUloNFlHU1NyRmdIaUVCRFErZ2R6aFRDVjIxcjI4eHVX?=
 =?utf-8?B?ZXJpL0RuRGFUMGxqZGFsaElRUENtbGIrWFJGV29tUDY5L1EyUVE2SGZMd0hF?=
 =?utf-8?B?UXBrcmFISlhrdHE3YzVsNStVZms0ejkwTVgvaWc2Rkx5T21Ga05qQlpia0o1?=
 =?utf-8?B?VXJWRFFlZ09wZEs5ckZPdzR2bmdhNUJTeFJEZjkzZnY0UEpPYlFFNVQvaGdK?=
 =?utf-8?B?d1VESmVSSzZOZm9JMEpCbHl0cGRoMnFZZFZKcVM0WGxwVmlhWVRvODhvVHox?=
 =?utf-8?B?ZW5EaFJEeFNHVHNSeFp5U21aNWRFaHdnNjRZQS85cDlNNGNzQ0FSdE1GN1Zi?=
 =?utf-8?B?ektYUDJXVVh5ckZSQ1dpOTlUWm85RHF5Sk9tclU3UGhlVGFTODNqRTFyTWNE?=
 =?utf-8?B?ZmtKcmt5S01JaEZETjJKZFZuV3A4Mm1oMmZkU3c0SUF1aUxGUlo5TzVLTWtx?=
 =?utf-8?B?UUpSbkdzSnFuaEo3Ym5XYmJzUkZGbFhVYjlFK0JDblhPM1JpRi8zMlVtM05Z?=
 =?utf-8?B?Y2hGNE1CUTRKMTJxb1V1RVpMcjkxT3d4U2pvOVBFOU1naitySitCamtEQ053?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UCjz/0W49D9lKIRZawBHxggkdU5/GbqLVIX7XHgKT5v+HTNyg45DhtjCs7LmYH/YzCsP+fc8gPEYr/CMvMF4id2jZQSLv3JTM19jeuJJFkPUhiG1vghNGdlWuC84+/tIPfIhSkr0QcWWvcbt6yFPMHc3JXFP7j4p3ZbbjL9GAa1zxbtsQl1ODjyS3wYZh3hzRmpHuPnxMK6V7URbBRGGYhHQsxEARnD2h4NMcgRwMMHQifjxGnoT3T2NdEcdtdADDtccsp1lqg+F1tiUWL82JDV6a958SsuJXYoSXfB0JwETzk2fpdKbbr85XIAD7DiRuNPGr3Xs5m1rfaAqj03Ey/PSFPODa3pBfs9jQ649N8N3fnOSzfCMn1TdFWC6PDrBd6b0ySuArryBCtueoUog9JD+mTWhWelSxfk30LBWADFBndiNHxT6FMrpLyKxhF4hECRDwKMEVVlcyyciR6mFrJm163o18IP14Ex23k6YzU2AnGHuBPnpVyaABhfMfsB5SZQ0sZpbgf62Bi4prj5SVbgQiQ/hn8/dQ4HqjEa3PK9/UlX8TUoc5kVcgAd6CMVY1fUz+enW/wReD5ltLo7+DGWT52t90STmImWMD/rbdCM3Tl2tFFctVEdWO5DNl82mgP6vGGYZcUX2AhZ9tA1doYxnxMkPO5PV0XqY+0ploNM9zf0asAN3trnNzwy7F8gLlK8y3iPbhJIiXWKqzJvCxEJk+9QM81oiqDKu+8oLSAgSIyXInOrYmDapqgc+y4q7Haa5/pOGx1bUfuyhnIFtbW0UO6NcfYhwk2ceTJxJSOC24hM5L9NLlwK7ZjOLq+EqAO3LH7+8pOsT+bLB799m8pmfxP8ApfbgSr9Y2g9in5up2zdfb0UmaA54fkMKB+1RVFlrk+QKzZDushaaCBUKTGDTQX7tOJywo5PBcbCKBKA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f268ee3-efbf-4c5b-a404-08dbce55c5e9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:39:59.2823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDAy7ZlBUCmbaxO/2OgdoDUPjglexJoBqXrK8Gx9VJjFtWlUC01ipNA3Kvsggqvjz2AQ3/2shNL89Fkvd0Zkdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5413

On Mon, Oct 16, 2023 at 04:04:34PM +0200, Jan Beulich wrote:
> On 16.10.2023 16:01, Roger Pau Monné wrote:
> > On Mon, Oct 16, 2023 at 03:58:22PM +0200, Jan Beulich wrote:
> >> On 16.10.2023 15:00, Roger Pau Monné wrote:
> >>> On Mon, Oct 16, 2023 at 02:35:44PM +0200, Jan Beulich wrote:
> >>>> On 06.10.2023 15:00, Roger Pau Monne wrote:
> >>>>> --- a/xen/common/domain.c
> >>>>> +++ b/xen/common/domain.c
> >>>>> @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>>      {
> >>>>>          struct vcpu_register_runstate_memory_area area;
> >>>>>  
> >>>>> +        rc = -ENOSYS;
> >>>>> +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
> >>>>> +            break;
> >>>>> +
> >>>>>          rc = -EFAULT;
> >>>>>          if ( copy_from_guest(&area.addr.p, arg, 1) )
> >>>>>              break;
> >>>>
> >>>> ENOSYS is not correct here. EPERM, EACCES, or EOPNOTSUPP would all be more
> >>>> correct.
> >>>
> >>> I don't think so, common_vcpu_op() default case does return -ENOSYS,
> >>> and the point of this path is to mimic the behavior of an hypervisor
> >>> that doesn't have the hypercalls implemented, hence -ENOSYS is the
> >>> correct behavior.
> >>
> >> Besides that other ENOSYS being wrong too, I question such "mimic-ing".
> >> Imo error codes should be the best representation of the real reason,
> >> not be arbitrarily "made up".
> > 
> > The point is for the guest to not take any action that it won't take
> > on an hypervisor that doesn't have the hypercalls implemented, and the
> > only way to be sure about that is to return the same exact error code.
> 
> I don't follow this kind of reasoning. Why would a guest, whose code to
> use the new sub-functions has to be newly written, key its decision to
> the specific error code it gets, when at the same time you expose
> feature bits that it can use to decide whether to invoke the hypercall
> in the first place.

Because we don't control all possible guest implementations out there.

AIUI the point of introducing a way to disable the newly added
hypercalls is to make the interface between a Xen previous to the
introduction of the hypercalls vs a Xen that has the hypercalls
disabled equal, and that requires returning the same error code IMO,
or else interfaces are not equal.

Thanks, Roger.

