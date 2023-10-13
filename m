Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2187C847F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 13:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616498.958556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGT0-0004UP-JV; Fri, 13 Oct 2023 11:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616498.958556; Fri, 13 Oct 2023 11:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGT0-0004Rz-Fl; Fri, 13 Oct 2023 11:36:30 +0000
Received: by outflank-mailman (input) for mailman id 616498;
 Fri, 13 Oct 2023 11:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lwD=F3=citrix.com=prvs=64352611f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qrGSy-0004Qh-8n
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 11:36:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcfe4efa-69bc-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 13:36:26 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2023 07:36:12 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7057.namprd03.prod.outlook.com (2603:10b6:806:35a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 11:36:09 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 11:36:09 +0000
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
X-Inumbo-ID: bcfe4efa-69bc-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697196986;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hjMi742zGkCKyVMRhfMShA3vAEv3sUn6WS5rpeaoxRc=;
  b=QhBU1GT+b9NH/w2URpI5rJ9R1KMWT1RZNyOGvbwIqcC81cF1LjFOhzgU
   zG9Q6Gynbc/gwZtqKJ3K/MW9LGGH6tLwBQRUyL6O66TIhotE3kvMUKODh
   ckP5u9/DAR/WuiUX9lPxth2kWDBS0LCHSNABGJUklC3e/8pE4jueXdtGv
   w=;
X-CSE-ConnectionGUID: 6WXBEp6SRauhWYDDEr4BWg==
X-CSE-MsgGUID: SP0peSFsTHWaHA2TmCFXVQ==
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 128248712
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:3qaXqqubm0ifhaRvzQGA8d1rfufnVIdfMUV32f8akzHdYApBsoF/q
 tZmKTrTPq3ZNGP2fYtzbo+39RgEu5KGx4dqHgBqqi80HisU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeHzCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdg89RD2b2dmMya+7ddhAquk5cOPUM9ZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60bou9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtJISO3nr6QCbFu7/VRLEBAte0CHgcawqmfkZ9d0B
 Xwqw397xUQ13AnxJjXnZDWxpHOGtxgQQd0WDeQ+7AyPzYLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y6
 xCHqjIvwYoai8Ej3r++u1vAhlqRSoPhSwc04kDcWTuj5wYgPYq9PdX2uB7c8OpKK5ufQh+Zp
 n8YlsOC7ecIS5aQiCiKR+ZLF7asjxqYDADhbZdUN8FJ31yQF7SLJOi8PBkWyJ9VD/s5
IronPort-HdrOrdr: A9a23:gA+brKGoIY7cso8VpLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-Talos-CUID: =?us-ascii?q?9a23=3Aw/UzmmgsXLOukkKfoZL1jFVz+DJuLELt5lrIfXS?=
 =?us-ascii?q?CAHtpd4y5ZXKKpIlbnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Auj0hJA5Ds/cjZt3BVvlRBqdAxoxT2/y2BXsjiqk?=
 =?us-ascii?q?mhMCkHHZMPhyzvAqOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,222,1694750400"; 
   d="scan'208";a="128248712"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+Wr53o8djTvUjdanVrjXlnu9hQE+I6zvyqty3Vq+UNgvKEQ7Mc2RnIDJZWd1JXSL8B/s1dLd+t8ek0h7aA9RlTvAArfxZWhNPW9TmNcQTBQdOOOSlD2LtCiqAAhd3kOqgssnMv73QQPZTjtDk+DOuQpse7mDTCFoPGu/1QTYEepPzw4Pyb+N01Z2GhEzTw+Xg3ZLHAtu5frZFxZh8vfEbUFRAYuD6jIcd93wTbL6bpkAyoIVzQozcS2z+v0JapDqisA9CRNNtBW84sawkPsHh6GHYiwYZEppospdzhCYOb4gIW1kFqdfQfgdlRvGX4MbRLr/77zi7SouU9nd4HQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8Mkb1dxJSxWyiRyjTHtU5xXSWm8UuOAXHZy9DWqhnM=;
 b=D/6JoH82Zi0NBNM7Li3xTZVBoewJ/hrPvlqUxDO+co1m27CxrdOZgrAqvBc77DfzHOoUz23z+tZ+IKZiCCMoC1PGQ65C/QsWOu8eKqdTUh2NKaFrEATdbSkm9YapPiVInghW21IQIlm5pnQ7Y3Wit7DbG7Ck4Xv74Ps5be7Nw5hfUZmXpZbMnNAfEsOxfaveSTKqSDgD67pb0qy/DF/bVqPmSr5MLO3Jr9TZrOnDS6LPRdvUlP+Jko0HomkRDsgGrcDkDQgsRESagAMqvQ1WHeKPWxxaYoqC1oI8H5o6Fx+IW/iPZLRdKdUt9f4bixLx+FoBxVGj2vGzgtKg2Da6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8Mkb1dxJSxWyiRyjTHtU5xXSWm8UuOAXHZy9DWqhnM=;
 b=nAMze2fWGMPcHjEXutTz7HYZGlvi+wYrZpUhcKQlbrv9cCvuFC9NKa48d9sL8ulSBQWWbGh/brVzEKH6A7AoNwl3zK6ojItbBx9XG8t2P+ECFuXWLuW//1BRJI3DLgwntcwKy06LwjZb7danw83G9uiE/8f0qeHblX5jE9mzJ28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Oct 2023 13:36:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.18][PATCH 1/2] xen/x86: Add family guards to the
 is_zen[12]_uarch() macros
Message-ID: <ZSkrohpG69OU8M8y@macbook>
References: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
 <20231012172601.22600-2-alejandro.vallejo@cloud.com>
 <06c4df56-8118-4f11-843a-7e4ae81f2464@citrix.com>
 <652928c3.170a0220.37d5e.7636@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <652928c3.170a0220.37d5e.7636@mx.google.com>
X-ClientProxiedBy: LO4P123CA0215.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbcfe17-7f53-414b-073c-08dbcbe09810
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kk7CnPISXdaGJEPOoM05ooAqsdYx1FqK9RUUSKSn01aiZcBALKeM3ui6pe0I144p2vEA7qE+4CgTAixR0BaKVCMtZDACCjRsgjR2Yb2Kd/FJkcl3iu9aXf69EY4SnMMxxAwwJeP77H5ak+gyDqEN3eIt4uI4fdHds5+j8oZ+IG6xiDpjdZlWlzGl7OGyH88ZuxFzpH8ofhO7HbVxWAf2EjFUsmtL73DfXUxGr6QEHMfEnPlr8WE0jKo8WC6CLHKwNcmEEdLDV36oEdPD+DdvVrbsGE7Z7a3TTNCS+Rsn0FuOPpXoQ9whO3ajcr/qGg1DEKCIwrtdlQ8r3dCoQ+9llaVpz4EO7/sU0f5NOk7AGEeHdVX9erz8l/fzxcx+bnaoObXixuUS/6utTgvao+28DQGnm25v+5Rxsc8lDKm1BdMu8YcVp9JNqkAGZyM5weZC8VIXIEH9XKI1kfPvEMZ1y931ejhMx2R78FYPJHQqEjtFenTl/Tq6nUuKjQ+P+s+h8KfLEZd98MOE2yk2/N96QnWGbWeL3p4ilPjC5KuutfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(366004)(346002)(376002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(966005)(66899024)(53546011)(6512007)(9686003)(26005)(86362001)(85182001)(38100700002)(66556008)(83380400001)(6506007)(6666004)(8676002)(6486002)(82960400001)(478600001)(6916009)(8936002)(33716001)(66946007)(4326008)(2906002)(66476007)(41300700001)(54906003)(316002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0prQXFlYTNhc2ZJczVLT3AwVmI2VHR1Z2VpNVJpUEtPdm9kVWU2TnY5Q0Vu?=
 =?utf-8?B?TzAwcVkvMEVzM3dUL1RMRU1EUTlMTWl2WUpPMTBKMndBOVhXSlh3c01hMXc1?=
 =?utf-8?B?amtUbGIraTYrYkpWOFVjdXpvV3hkOTc5VlN0VFM5Mkd0WURjTm9SbENlZGQz?=
 =?utf-8?B?NVBtYmdpcC9uWU5iQUNhK0RLcU53ZVdjNy9aRE84QUNrU1JTZjI0OVZsOVlu?=
 =?utf-8?B?S25OL0t1RG51VThkMmh4RURmUE9vRFREa0hWSmpCcHpEOFdWMGVHVlp2c0tK?=
 =?utf-8?B?eG5tMWNETTZYMWNsT3pHMHRIUDVvaFZNZmh2MDNGU2lMTTFHOHNGRGpQbktT?=
 =?utf-8?B?dFpCVjRKOFc3ellEWjZxUXdMUHdBbWRVMzJnUlhCWVBvMkdBeHBVOXZjWXhL?=
 =?utf-8?B?ODZoK1RSN0FNUm5sTjBTdDRSUUU1cm4wZDVoM1BaaVVMbjJPc2lHTE5kNCtR?=
 =?utf-8?B?UVdaUzlQM3NlRWd0TFJ0SXZHZTB0ZEw5azU4emJ5ZDhHRHZtenNYV09XT2li?=
 =?utf-8?B?VzhQT3ptRTY0cFRSRkRVVUV1VXU1QjFsbytncjJKM3E2YjhOYitDajJTM0J1?=
 =?utf-8?B?L2IzamY2ZzcrbFAxVkRmRzJhZzlwMzNvR3BjK1lYbExHb0xNSzJXTEhxUmZp?=
 =?utf-8?B?QjdXS2c2dE5ZZmU3R0toRGNnS2JSRERtSEh4MGtwNUpHT3h1NG1Sa01NNGha?=
 =?utf-8?B?YTE4STJjMElJWWs3VFd5UjVVWXJLMUtIRDM3YkZxdGdQZHVpUmVoSTI2Vksw?=
 =?utf-8?B?WlF1TERyZGgrUnNBeXVvQ3FScEpsMENOdHorZ2w1SXdOVW9ORnlWRVd2M3E2?=
 =?utf-8?B?aE5OTGk3M3Rwb05wSEEzVjRLSHhXNzhqek5PMXlMZXhVdVA1WTJqTWFlQmll?=
 =?utf-8?B?UEQ0RzJXZ0Nhcit5SkFVQlNWd3BvNHdVZXEySEl6S1JWRFNXcTBMMVhaRTRr?=
 =?utf-8?B?WVhSSnRJbzFrRnZGOFlxaFUzUkNsMW9Wa3VFbzcwbEQ4N0pUMjE4b0NISDZ2?=
 =?utf-8?B?eU4ydUNXT2Uzay8vZ2FjbWZNOFg2SFVvTWJia0VZSWU4LzVQQSsrQ040RmxX?=
 =?utf-8?B?cVRYbS9jUHA3MFVpVkZOUDhsbUNoMmFacyt0bUpLYUZONXV3aDNBNXp5dmZt?=
 =?utf-8?B?WGJCVExWVmxUdUxXM2doNDVlcTNBWlNSTkF4WG0vNjlRazlNcXNLN0NRayta?=
 =?utf-8?B?QkFDQmwyL2llSnlnZzYwdUFzWFFUTkxxcUhkMlVaRVJKcnVFdTZQZExMOXFQ?=
 =?utf-8?B?cENwdEpMY2tWdU9hV3htV1Z5VE93UE03SU5yd0hTVUN3YkxjV2UrL3ZrTUhV?=
 =?utf-8?B?cGhzZkFqbnB3RVo0M2s5dUgvcXQ4b2pmNE5ORXMzbkYvK09ySGlWenhSN2NF?=
 =?utf-8?B?NHhFR21iUy9LVi9DV2ZEQlNCUzlQSlhCcmlTc3hEZnJKSUlDcHhleWI0elpP?=
 =?utf-8?B?V3pvM1V0cFg1T0RJaWx2MmxjWE1zVWdHUEFRdm91R3BaRUVFcjYxMG5qajJq?=
 =?utf-8?B?dWdsK0czWUU1RWpFbnRPbTFqOUFZUGtNbmR2ZFRSN2pXYXRMaDREUGdMbTlE?=
 =?utf-8?B?VWxRaWVrOTl5Y1hBbkltUWJ1NXdjOENiS3djSjVlMjJpV1V4NldEbVRkK2Mv?=
 =?utf-8?B?QUwzYzZSanczL0o5QXN3eit6dU81b1E0bHZYQ25BK1B2VC9UejNacXJaQzZD?=
 =?utf-8?B?elArK2ZLZWQ1Tm9uc3Q1N2xDRUxiUkMxa1RaRm1pbkpadDVqYXRDSW1nQ1k0?=
 =?utf-8?B?YjI5SE1GaFRPNVhsVkkwaDJsYUxsSWtxNHFudDB6OTFsSkJOUmJYWnJ4dW5w?=
 =?utf-8?B?N0JjY1BJc0ViVHkrU2xwbkg1aVhoNTYzdkJzU0xQMmd6bno2RDdPbDdCd051?=
 =?utf-8?B?bGcvOC9lUVZYMTZ2aXc0V045ZEMrRkMwMHdSQy83cXhrM1dzR0RHYllOMmFy?=
 =?utf-8?B?bEp3NHdWd2JKOW5YWUN4TUs5WmllalpaTGtUSVQreG1ZSjAwUTZmT1ZvbVhk?=
 =?utf-8?B?U2lpNkpJSjBvK2p5ZzdYWkJHM29oaDdERXJFTU43WFhjalcrd0hwaDRvZlpC?=
 =?utf-8?B?c2VxN2c5ZUN0VWlqZ05JcTVhZFdhb0ljcFh1WEtpL3ZXbTZIWG1adWpLam1J?=
 =?utf-8?Q?AWRYnyvoGt8rYsqZYNk0e1rs+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F7mIJRLByaUDjyqUxQCgwtP6l0ysJKMM//rZg5csjjp/syvjNkKeanuivKpgIE3tb30umGeGOTOV+yKa6lZ1O/7yz+yz0zg/CifsA+tSTmdXPrM/ljuuM0mwA6JqJ74Xnja5SqnuQGzMLDInZ0IwMDt7kLgpgkcLwWpVJNqoFHhvHtg+NB2hYH7wXIV5LVT5PBZ0UX1zSKibq2RAxs0q4ZptdpIAGfldKgEFc5g1wGuN0njpXyRBzPm5qG6CQdRFauuVj/ggszGbaGjSd/NNjN0E3+Gt1py3NGOg6z3fFp0olXEG7VXHxnA860hzqJu8CZ1KvO9ZklJ/eC7/se/HW7S5x3FMUL9Z97rQGZm+1WlK+5F8CqGU4zSfS06agTxFa16lNwoDmUUxXC0g0uny4o33IX2wkAlzQAqUOBYj4y1ePfloNZ8x4rJahfO91roBnJblsGSfQmN0Ec9unuv4BH0148lKzwmUYO2+CQ1dzc+SSB9a4OtP8lDCELsHzSQgdj6HvbvZ3G0ltCveyvk+FI52t6BQVbvGsvN4uOpqifHAw6ugODFaBzEkEoIf4PGJv6M1jICbfjPeLfPa8QKwXUHz8INFCUcFJAhypVZT5Xl6kuDbqRkTDPxzxk7qZ3AF7XPRCQS2RPkU7mV8kVPdgEtIxDsFpCinbAbvAeZ4zv6wOc2lOZsyxiplG+i8s+xpPPeYyRBewkRteilTXYF5rB9rxu6DxB4+c6Jmvp3NW416uNcEymN2yqOcwmVAshmy2X5bmrBRFSQQlrUuWYRsHfbNnI+qM2ex3M/lA0mp9IPH5oNjrYq0gCEds3HIYsxF4Ym1XLvRZ1p0SIfwBG5myJ8LxV6CH464ZIQsJkxHO2Tdljp8AfoYnVjrvKx11aSj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbcfe17-7f53-414b-073c-08dbcbe09810
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 11:36:09.0310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TsNEYG/apT0oMwMc3yo31OnjZJ4zwJhxSmmWP+gqb44cIkp4Iq63tg/1pNXZnndS45THjmVHF3g4O59Rwl3xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7057

On Fri, Oct 13, 2023 at 12:23:43PM +0100, Alejandro Vallejo wrote:
> Hi,
> 
> I'll just remove this patch (and amend the next) in the interest of having
> it committed early. That said...
> 
> On Fri, Oct 13, 2023 at 10:14:45AM +0800, Andrew Cooper wrote:
> > On 13/10/2023 1:26 am, Alejandro Vallejo wrote:
> > > It slightly simplifies the code that uses them at no real cost because the
> > > code is very rarely executed. This makes it harder to confuse zen uarches
> > > due to missing or mistaken family checks.
> > 
> > I'm afraid I disagree.
> As it stands, it's a matter of time before a bug of this form creeps up. Particularly
> because it reads very innocent.
> 
>    if (is_zen1_uarch())
>       fun1();
>    else if (is_zen2_uarch())
>       fun2();
>    else if (is_zen3_uarch())
>       fun3();
>    else if (is_zen4_uarch())
>       fun4();
> 
> Particularly if the bodies of each conditional are big enough that you lose
> track of the family you're dealing with.
> 
> > 
> > It's bogus to do a family check without a vendor check.
> I can get behind that. I didn't include the vendor check because by and
> large these macros are used in vendor-specific areas. Would that appease
> your concerns? Whenever the macros are used we're in glacially cold paths
> anyway.
> 
> > By making this
> > change, you're separating (spatially in code, and therefore cognitively)
> > the two checks that it's important to be able to cross-check.
> IMO, It's no different from separating the heuristic from the vendor/family
> check. What causes definite cognitive load is (as a reader) having to
> remember what particular fields must be read off boot_cpu_data in order to
> discriminate zenN, which of them are co-familiar and so on.
> 
> > 
> > > diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
> > > index d862cb7972..5a40bcc2ba 100644
> > > --- a/xen/arch/x86/include/asm/amd.h
> > > +++ b/xen/arch/x86/include/asm/amd.h
> > > @@ -145,11 +145,12 @@
> > >   * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
> > >   * as a heuristic that distinguishes the two.
> > >   *
> > > - * The caller is required to perform the appropriate vendor/family checks
> > > - * first.
> > > + * The caller is required to perform the appropriate vendor check first.
> > >   */
> > > -#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
> > > -#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
> > > +#define is_zen1_uarch() ((boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) && \
> > > +                         !boot_cpu_has(X86_FEATURE_AMD_STIBP))
> > > +#define is_zen2_uarch() (boot_cpu_data.x86 == 0x17 && \
> > > +                         boot_cpu_has(X86_FEATURE_AMD_STIBP))
> > 
> > What leads you to believe there aren't Hygon Zen2's ?
> The same argument that a Hygon zen2 supports STIBP. Having seen neither HW
> nor docs all that's left is divination skills :)

There is at least one reference online, from:

https://www.tomshardware.com/news/amd-zen-china-x86-ip-license,39573.html

"THATIC* was a single-generation technology license, and there are no
additional technology licenses," Su explained, though she did not
clarify if the decision not to extend the technology transfers was a
direct result of the trade war. That means that the technology
transfer, which provided THATIC with access to the first-gen Zen
microarchitecture, will not be extended to allow the Chinese chipmaker
access to AMD's Zen 2 microarchitecture."

* Tianjin Haiguang Advanced Technology Investment Co. Ltd. (THATIC)

So I would expect there aren't any Hygon Zen2 given those claims, but
again that relies on how much you trust tomshardware.com.  The article
seems to have been reviewed by AMD as some changes were requested.

Regards, Roger.

