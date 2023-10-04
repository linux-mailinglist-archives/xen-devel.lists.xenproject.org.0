Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172EA7B801B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612549.952496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1Uq-0002dV-JP; Wed, 04 Oct 2023 13:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612549.952496; Wed, 04 Oct 2023 13:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1Uq-0002bX-GU; Wed, 04 Oct 2023 13:01:00 +0000
Received: by outflank-mailman (input) for mailman id 612549;
 Wed, 04 Oct 2023 13:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8y1=FS=citrix.com=prvs=634504905=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qo1Uo-0002bQ-VD
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 13:00:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e62a129-62b6-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 15:00:57 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 09:00:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB4953.namprd03.prod.outlook.com (2603:10b6:5:1e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 13:00:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 13:00:37 +0000
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
X-Inumbo-ID: 0e62a129-62b6-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696424457;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=d9w+X7qvQ5vdr9Zb3AlhiAIbLGsCLy8I33C/T4m+TGU=;
  b=hyNgO4ZlphOFx0w3XYnF9ee2A08fmUcX1jDYsyxlTNlyEibpV63TNv5o
   Kcwim9SHuI9w1FE3z7mNfGdOS6g4+5IktSynJeR2bdqBA9uL7sF3T2FU2
   TNd3iRJXZ1Y66PSFQmgh9RI1ZySv/YfXLzd2cKuH6JFtMO2v5wkjMNtyb
   s=;
X-CSE-ConnectionGUID: B1S6hi4vTsi+4nfP7yzO4g==
X-CSE-MsgGUID: tJmbinblQoOEKIIZeKR3gw==
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 125025915
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:lJU8fKv58bAwAOyU9HDuirJquufnVKZfMUV32f8akzHdYApBsoF/q
 tZmKWnXOvnZNDD3fYgna9/npEkCscCBnN5hGlc6rC5jFH4T+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeGyyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAmk2MBCC2/yK27P4Fu9ivpsyPu63M9ZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt9KTuDpr6MCbFu72k4WAhwQX1+Cpt6UqW+fad98E
 Rcb5X97xUQ13AnxJjXnZDW6vXqFsxg0S9dWVeog52ml1qPR6h2xGmsAQzhOedEi8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMF7t/5sccshxTAZt95Fei+ididMTP6z
 i2OrSM+r64OlsNN3KK+lXjYhxq8q56PSRQ6ji3MRX6s5A59YI+jZqSr5ELd4PIGK5yWJmRtp
 1ABksmaqewLU5eEkXXVRP1XRen5ofGYLDfbnFhjWYE78Cig8GKieoYW5yxiIEBuMYAPfjqBj
 FLvhD69LaR7ZBOCBZKbqartVazGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:XM2N2qMVnfRVG8BcThKjsMiBIKoaSvp037BL7TETdfUxSKelfq
 +V8cjzuSWZtN9pYgBepTniAsm9qBHnm6KdurNhX4tKNTOO0AGVxepZjLcKrQeOJ8T1zJ846U
 9GG5IObqyIfCAK9vrS0U2aN94hxdWdmZrY+Ns2t00dNz2DtclbnmBE4j7yKDwLeODsP+tGKH
 PZ3Lsjmwad
X-Talos-CUID: 9a23:IWe6im2fwjigOiI3nXR7ZrxfMJkeLH3ckGnsOE77VWBncOKEW3jM9/Yx
X-Talos-MUID: 9a23:uY/rQggH1fGdbpNOcfFNocMpKOVt6aWoAkQ0lrIrmOilByFTAWySk2Hi
X-IronPort-AV: E=Sophos;i="6.03,200,1694750400"; 
   d="scan'208";a="125025915"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUgPHPVWy7R+31WWycQSU7hOTw9TinG/e5jKH1lE+pMB9H3yjImSF68Kvr1GPrIwWuJhLiKZPHDl/jRbkHRWvLVOafGXJpavFTreJcBCS/6sYfU0tN2fWOCmxm6Jgc7u2KHPXTVRSxRF004TuttI4y8Gk4XjWWuvzDY1XA7IpwWHDdyh3vp6yMd1iSz6McC+NPJPbGo1pT//Rv9K5PN58FUUxsK81gsUL1oyf2KvlEdW+1stDF+Uy07x/qGCxeqcprgDJGWxE0HJasZFCvdJqI9vPog9/lIMpsIR/MFua5whTTWrPoWmaJMetGjijtDdM7P/fKDu+06ScOuJ26h6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSqgwmQYedfnEbTVWUs6QNI2Y97dUEO6Y+dZg3TTgd8=;
 b=A7cbH71QlJEPwBlwwJv4A/cK2/99OtLge9BIeOGki9VJ/1BR3eDbzG/LdN02uAllQHF/w1b1J8hmeyZ1KqwsB/kuct9mUJ89ZuQmEQepXlEcS5FpgTpYtBg2qxjsQlfFveekXboX7fKkJzO6nqHMx19K0TMr/6FuDb+h20PvgcEhw0asC07UGIIpqriSBv8b2UaRmhN8OcVPJU1fRxdEpnoiXuzCWQp5ULLRYIWEi5WmfjcG+82bxeP0EvogvT1d68da1pATgrdVU8pfqDH/83o3xWAsUubSQQyXgLva8I9piwCOfVo/5W1q45olStQi78o8YaDenDbIyfX1CBTtKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSqgwmQYedfnEbTVWUs6QNI2Y97dUEO6Y+dZg3TTgd8=;
 b=lAo6E3hL2c20LMwPRfsvslDzWwPwkLFbrvs+N2mPQFHY7qmprhHYhJ64Xk8uAYayfFSlCXirjnQmPRAkHMX3DfFPOJIJ+FiclwbLsX0gvquPE+4CJWjZ45r+gh1QIFk2L2C3OSlGy2dQE4dMrXb8G0+Yz8LsZIAEWD6bsRxItIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Oct 2023 15:00:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
	henry.wang@arm.com, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 06/10] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZR1h7y2aazvEhtW_@MacBookPdeRoger>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-7-roger.pau@citrix.com>
 <CABfawhnHg3KrGP-hp4_Q8GvSf2nVSVSyK24HKqAGuWp_AtD8-A@mail.gmail.com>
 <ZRwlXls8xRyc8AX4@MacBookPdeRoger>
 <8ee8d70b-5b69-4834-b7e3-572e96effa5c@xen.org>
 <CABfawhn0vH6rS8-SJQJVZtto2HA61By1bCG3w9bJMJR3x+rXsg@mail.gmail.com>
 <ZR0gX6wyXLD_6nY6@MacBookPdeRoger>
 <30582a7c-f505-462d-9dc4-22efb5a0860c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30582a7c-f505-462d-9dc4-22efb5a0860c@xen.org>
X-ClientProxiedBy: LO4P123CA0593.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9cd071-507e-42b9-1de1-08dbc4d9e708
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mg5w+a9k1lLS9HbiotH5N8fsZqtilsiCaEYPlnehDJMwsooWoX0/s2DQfEJWTdb5VbOjm4h1XOIgSbzrwgf6h3Pduqwhw1tK7v6Ye2D1waMgtGHcUCrCwIlpDvmNHnhTGtd+bnGFtF3cTMWlsIMWMPopK2Udzt5oNcbY0b+Xcl8VrDKioWpZEyH2VcrrBxx2dt33lKy4LkQ+iiBbS18MCdCxBR6noo3Z8cDqBgtuaAbl72SL3OHkzjOcial0owBzqFwub74n/gLFY2eTEfuHFn6y6wqrjMZmN1Eoeo9lTh3jtNKcMctLUQX5e95oIuro9c12BgSVdz2uFF1EBE8/QCcsg5nhmYqCPac4a0zS/LABupn2HCeclBGciEOXGv7zQSryMPFv621NOEuwWs75kSWj8cs4nvJjSpjUqtfxKbUOJeAYGSDurZZ+F76EYiyyYLHIoh9V+W81xkcMxPn30GOlK984EyF5A6JUgudl+uJq47CjBSQ+8MtY5NXMkGEZn0idIH3iFjJ6+JPu3wS4URZYt5N6nBLXgpxZLq1dmw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(84970400001)(6506007)(6666004)(478600001)(53546011)(6486002)(6512007)(38100700002)(86362001)(82960400001)(66556008)(33716001)(83380400001)(9686003)(26005)(2906002)(85182001)(66476007)(54906003)(66946007)(6916009)(5660300002)(41300700001)(8676002)(316002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlV0MTlsOUx3bm9sL1p6QlVTVVYyaDAwTmJ3NSsxQW1jemV3ZUNhU2E2TzQr?=
 =?utf-8?B?bGtPUE9INVpONkZsR0ZMSkxxdDFkWSs3b2hWcUo1dEV2QlNqQ1gwNzdsMXBv?=
 =?utf-8?B?dTZKclVLWmdkd3U1c0RpV1pDcFB6a2RGbTRWblB6YXNRWTJPS215TEhkOHFW?=
 =?utf-8?B?b21HdEdQWDVSNVB4NTF6VHlhVkR4K3RXeDZ2R2ZhbzZ6WGtIdkxDOW5UYkVX?=
 =?utf-8?B?b0N2RTFrM0lSbm9wYjZma3FVOGpnVzZkMTNVQm9tTHRIVFcrV3oyaHh0Nmdq?=
 =?utf-8?B?eERqcnkyb2V0T2xoaDhTR1hWL3NIY1ZjL1JvZ0tja3pmTDU4ZTFvR0wrcW5l?=
 =?utf-8?B?T2pVb05kL2JDY3dEWUF2eWtPbUJEcUhLNjRjTGdRYkc4WWlHTWZBZ0lhdzQ1?=
 =?utf-8?B?VXpXNEYrbzAxWDdFK2t3b2JGUU4zRVAvWDBFR3BCZGZhL2JuQ3VmTFpYNDVl?=
 =?utf-8?B?YnVYWC8yeVNMNXVGNTgzS2xoamlIcGRPRnFzVzk2cFRTQVhBaHJCbTlONjBX?=
 =?utf-8?B?V3BtU3hTZ3NFUHdWUHl2UldjaEVGYU1IaWVyMEhFSUE1WnMyQ3BGbWtXOWZv?=
 =?utf-8?B?UlBvODcyVFZrVyt1cXU1dWp4azBRN3ZzWHliZEFjcXhpRTU3RmlicWY5R2pP?=
 =?utf-8?B?ZEIvZHp1cmgwMDQvNjF6eVdlUlhqL1VJdWdCRlJ0dnRaVWNUbWlWZXdHSWg4?=
 =?utf-8?B?UjRGSEovWStyM2tmNHdLWENCcCs2RmpRdUVLQ0Ixa0hTdEFJU2hZQlh4emJL?=
 =?utf-8?B?RCtLbjAzME1ObldqODZrNmxUTzk1N29TT1RncjlxRFpGbXh5MVJSZnNiRU5F?=
 =?utf-8?B?eHo3UHNKWi9XemlwZ3VqRWlLcjd2dlpvbXhPVmJQOE9rdW5rekU2U1hYYTVK?=
 =?utf-8?B?SXBISlYvL3NYSUhCYlNoaWRRMGR3VEs5V1dUQ3pzRmFOdkdReVBYeVM3QWFz?=
 =?utf-8?B?dWtBU2U5KzVYdmplK3Z5WnJjUzdsSnU1NTJ5bkVGTjArN3A2cHdkQzhUWGsz?=
 =?utf-8?B?RVdoWkdGWHNuU1N6SFVaNE1ONmNGSmc0OVVDY2tTelRkL3B5dC9haExKeDF3?=
 =?utf-8?B?REFIeWJlcnhxTDQ0bGptRk5hRkRJSmVYUXg3Znd3NWgvckNBZkFtZVduWVhQ?=
 =?utf-8?B?UXJib3pOMk9yUWwwdkg0UVBRR3hPeFFhdUEvVHJYakZIR25TVm40UlZjVmlH?=
 =?utf-8?B?NjV2VmFYZ3dCdXhTOFAzVDRiR0tTV3JQQVhXcEUwUERhaDRYTXA5TlBxTWpZ?=
 =?utf-8?B?cVhtWStKcEZienkwN1hKSnFMUy8zclIycGQ3dTN5NjZTYmNXWTFJM3JXUlB0?=
 =?utf-8?B?eVVTR1hqOEVPcEpReG9yeG5DNURnWHgxQUdKTGMrUjZKRzlRUHB3Vy9kdk1E?=
 =?utf-8?B?eDR0eUVOckhBNXNqZDBGQmk4bzBVeHN2TUhZVGZ0Y2dPM3ZvWUJQcjcxcUlh?=
 =?utf-8?B?ejlncEI5UnY2cU9nQjNaSW1nblhvQWRwbVlBZ0Z5RnV4K25JSXM5ZHczS1Jz?=
 =?utf-8?B?ZVFZTXBmazRxNDQ2ZnFlRW5ONlA5Smh5R2QyZFNuaXozTENwV1FzK3FzU3I4?=
 =?utf-8?B?RHgySnJmZFRBUXlzdFR4WXlYaHZKL2hRTU84YzRMZFpHMzZ2YVFTaTMwV2FS?=
 =?utf-8?B?R0dkenB5WG9CdWlTQnR2a2U1Q3BQRkNCSUNpWmtzLytqY0gxb2NSNktsUWp3?=
 =?utf-8?B?bGhabGFqWkVHRWY0ZWxLK0FoQWdzd2wxZUYwV2swM2cyWmp0R0IxaUdXbkIw?=
 =?utf-8?B?bC84eU82M05TVHdpTXc1c1FYNm55a1hFRkFXT0czaWRFekNnSjNGVDdTUDh1?=
 =?utf-8?B?TjVOME8wTTRja1VYVGl2eU9kVEJIeTBVeUpyRndJaEdhUFhmTFV6YmROZzlo?=
 =?utf-8?B?Z1UzOUd0LzNVeXArT2NKZTV0VXJKc3VkZGsvQ1dGbitSTzk5dUcyUjk2azRN?=
 =?utf-8?B?aG5jOFhLb2EzK2o0d1R4WWpCMEtkdUk4NXQ0dzQ3aGMwMmhXMk1yTEU1MTBu?=
 =?utf-8?B?ZE85NEl4bi9tam1tcU9rQ0tPWERQZ0NRTVNFcVhxNVpQTEN4K3lraVJIUW1z?=
 =?utf-8?B?YjE1c2t5cENJNlA2eVpXZTRMVjVYN1VmZzc2SCthNlVlVnM1ajlFTzdQWG8v?=
 =?utf-8?B?M004RGp2OS9zQ2RZMUpSbTVZbUpjQkZsMXVrYWZtZlMxdGlHUzd3NFVBdHpS?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nABqL0SS9SdnegQ4nc0/qLyV4FU59chnxtmJDZTN6Utlftv4NdW2YDXQNxUpKKLwuLig/kMgPLdyoOvowSe5CgoqwVCBtpowTFmMVWGT3d0ZiyqoCjXrhVvN0Oos6gRcPF0XnqZ1BSkbsZ8fnE4xloj5QOoQsyj7Ofu7ymx/1O2LuU2GZ1dIrT4Ab5jAHncDcLe72wj7CZv86tC7xyEc195RQECwA6K9dsUsaKepfcQ4T2Vg1AWGyy9GQK8GVk7Bnn73WXgk2WwKvtPa1gy0RPpJLKmFLQa3DXY7RbgNTIZ9H+NjW9CyGijhziFTHm9gntALGmAgNgVxuoin5RHf2xM40246WGnhUY2WmezFWKjI9Rs9Um8MXUvnE/p29GM17SMP1fRf2Ohqpn9BUUpXn4Dd9xYmIHCTxVzFQg4QFXsF+OJf8nBLQzksP6gFWVJLrLcIfkUPPE2zBvrqRRIYQHbqWOJ52eK79feRdooN9eSB72MPcN+zwTnphcMN0/4OYgC+xfVkxTfWoB3H/VUFAWtmaITgDQikYefk6NH3qQkVehqPklRhivWLJJQHKEcQLsuUx7K2LlnxUBFa4wyPqr4qh8KvgWiVB6awQy0LZajuj3l8dHmzz9NrsXoHqNHg5NH7rifjR+bEZWLaZHEIie8iI54pz2GQaewsidWm6zEa+23sUqM3v1KjFeVusQxWinf+Q3UiQxELa4LFGE73/WtD1fBEurKqJOi3q9wNH0NQS5uNA4hlDwJT8RuxAjGuNJNs3OIHrm1uQu7rdtH+5Wl2H90E5SUgfQFDfvqNVSuh7OfoNnOBXMHyh5BD9Qd64/4Yl8hhtQYHIrzwwgVHcgE1K1JzCeUlqWXlfI12nE6twqK0T9mXEJPo9jBJz8fMDzH/a+DKGGn3cGDd8q1teBcL2dVd6gvqZv2eOOSVP5A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9cd071-507e-42b9-1de1-08dbc4d9e708
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 13:00:37.2796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/TfcCFPgMAzzBDbwsvfSaANqRl2i6pxN7gf+tdqM4tNIY3V+rwddAjlLG67Jm34m1pqaOpBSMTFdN6OU2gZjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4953

On Wed, Oct 04, 2023 at 12:01:21PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 04/10/2023 09:20, Roger Pau Monné wrote:
> > On Tue, Oct 03, 2023 at 04:25:58PM -0400, Tamas K Lengyel wrote:
> > > On Tue, Oct 3, 2023 at 11:07 AM Julien Grall <julien@xen.org> wrote:
> > > > 
> > > > Hi Roger,
> > > > 
> > > > On 03/10/2023 15:29, Roger Pau Monné wrote:
> > > > > On Tue, Oct 03, 2023 at 09:53:11AM -0400, Tamas K Lengyel wrote:
> > > > 
> > > > Tamas, somehow your e-mails don't show up in my inbox (even if I am
> > > > CCed) or even on lore.kernel.org/xen-devel. It is not even in my SPAM
> > > > folder.
> > > 
> > > Thanks, I've switched mailservers, hopefully that resolves the issue.
> 
> It did. Thanks!
> 
> > > 
> > > > 
> > > > > > On Mon, Oct 2, 2023 at 11:13 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> > > > > > > 
> > > > > > > From: Jan Beulich <jbeulich@suse.com>
> > > > > > > 
> > > > > > > In preparation of the introduction of new vCPU operations allowing to
> > > > > > > register the respective areas (one of the two is x86-specific) by
> > > > > > > guest-physical address, add the necessary fork handling (with the
> > > > > > > backing function yet to be filled in).
> > > > > > > 
> > > > > > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > > > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > > > > ---
> > > > > > > Changes since v4:
> > > > > > >    - Rely on map_guest_area() to populate the child p2m if necessary.
> > > > > > > ---
> > > > > > >    xen/arch/x86/mm/mem_sharing.c | 31 +++++++++++++++++++++++++++++++
> > > > > > >    xen/common/domain.c           |  7 +++++++
> > > > > > >    2 files changed, 38 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> > > > > > > index 5f8f1fb4d871..99cf001fd70f 100644
> > > > > > > --- a/xen/arch/x86/mm/mem_sharing.c
> > > > > > > +++ b/xen/arch/x86/mm/mem_sharing.c
> > > > > > > @@ -1641,6 +1641,24 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> > > > > > >        hvm_set_nonreg_state(cd_vcpu, &nrs);
> > > > > > >    }
> > > > > > > 
> > > > > > > +static int copy_guest_area(struct guest_area *cd_area,
> > > > > > > +                           const struct guest_area *d_area,
> > > > > > > +                           struct vcpu *cd_vcpu,
> > > > > > > +                           const struct domain *d)
> > > > > > > +{
> > > > > > > +    unsigned int offset;
> > > > > > > +
> > > > > > > +    /* Check if no area to map, or already mapped. */
> > > > > > > +    if ( !d_area->pg || cd_area->pg )
> > > > > > > +        return 0;
> > > > > > > +
> > > > > > > +    offset = PAGE_OFFSET(d_area->map);
> > > > > > > +    return map_guest_area(cd_vcpu, gfn_to_gaddr(
> > > > > > > +                                       mfn_to_gfn(d, page_to_mfn(d_area->pg))) +
> > > > > > > +                                   offset,
> > > > > > > +                          PAGE_SIZE - offset, cd_area, NULL);
> > > > > > > +}
> > > > > > > +
> > > > > > >    static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> > > > > > >    {
> > > > > > >        struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> > > > > > > @@ -1709,6 +1727,16 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
> > > > > > >                    return ret;
> > > > > > >            }
> > > > > > > 
> > > > > > > +        /* Same for the (physically registered) runstate and time info areas. */
> > > > > > > +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
> > > > > > > +                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
> > > > > > > +        if ( ret )
> > > > > > > +            return ret;
> > > > > > > +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
> > > > > > > +                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
> > > > > > > +        if ( ret )
> > > > > > > +            return ret;
> > > > > > > +
> > > > > > >            ret = copy_vpmu(d_vcpu, cd_vcpu);
> > > > > > >            if ( ret )
> > > > > > >                return ret;
> > > > > > > @@ -1950,7 +1978,10 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> > > > > > > 
> > > > > > >     state:
> > > > > > >        if ( reset_state )
> > > > > > > +    {
> > > > > > >            rc = copy_settings(d, pd);
> > > > > > > +        /* TBD: What to do here with -ERESTART? */
> > > > > > 
> > > > > > There is no situation where we get an -ERESTART here currently. Is
> > > > > > map_guest_area expected to run into situations where it fails with
> > > > > > that rc?
> > > > > 
> > > > > Yes, there's a spin_trylock() call that will result in
> > > > > map_guest_area() returning -ERESTART.
> > > > > 
> > > > > > If yes we might need a lock in place so we can block until it
> > > > > > can succeed.
> > > > > 
> > > > > I'm not sure whether returning -ERESTART can actually happen in
> > > > > map_guest_area() for the fork case: the child domain is still paused
> > > > > at this point, so there can't be concurrent guest hypercalls that
> > > > > would also cause the domain hypercall_deadlock_mutex to be acquired.
> > > 
> > > Perhaps turning it into an ASSERT(rc != -ERESTART) is the way to go at
> > > this point. If we run into any cases where it trips we can reason it
> > > out.
> > 
> > In order to avoid possibly returning -ERESTART (which should never be
> > seen by hypercall callers) we might want to convert it to -EBUSY and
> > let the caller pick the pieces.
> 
> I realize this is a matter of taste. I think EAGAIN is a better conversion
> for ERESTART because we effectively want to caller to try again.

That's fine with me, but could we leave adding such translation to a
further patch?

I would rather modify Jans code as less as possible.

Thanks, Roger.

