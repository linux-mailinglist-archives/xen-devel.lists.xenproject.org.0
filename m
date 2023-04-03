Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF726D42B7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 12:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517373.802595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjHrG-0004ZK-Mp; Mon, 03 Apr 2023 10:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517373.802595; Mon, 03 Apr 2023 10:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjHrG-0004WB-K7; Mon, 03 Apr 2023 10:56:18 +0000
Received: by outflank-mailman (input) for mailman id 517373;
 Mon, 03 Apr 2023 10:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGRT=72=citrix.com=prvs=45084431a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjHrE-0004W4-FJ
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 10:56:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 244edc6e-d20e-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 12:56:11 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 06:56:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5189.namprd03.prod.outlook.com (2603:10b6:610:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 10:56:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 10:56:03 +0000
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
X-Inumbo-ID: 244edc6e-d20e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680519371;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5JZGi8/1/yb6/qdgogTjC3obpQIKi7kNJk4CnzYviYY=;
  b=Rw6v1ajTSibklxpKTuSyWOQ/56pMUVf1nASbYcmRXnVQ2ypzgvJHUxBK
   MUBfFgK8fRjMAkXM0Whii14YYBkjrNGCzniDOzQ73XQlupIEsm4wCXwkp
   AvAwr3axKTBWwmk8BKm1EpE9MK+Zn2Fwzw4qD7uLmvA8Z7yBxPrUZjCgR
   w=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 103474203
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sy9aWKtGLD34cGRB3kIilS1r4OfnVHtfMUV32f8akzHdYApBsoF/q
 tZmKTzUOKzcamWkL490advk8R5Tv5PSyIJgTgZlpCs0RX8b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcj0nZzuIqvuP8L/mS7kwuYMDLsfCI9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgraI13AfLnQT/DjVPD2GnvPK9kHXvZPNRD
 XMk4Ckkv5cboRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC9
 HWEgtfoDjxHq6CORDSW8bL8hSy2ETgYKykFfyBscOcey9zqoYV2hBSfSN9mSfexloesR2G2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:bgSiy6yApGpvZvMI2d8+KrPw+r1zdoMgy1knxilNoH1uA7Olfq
 WV98jzuiWUtN9vYgBHpTntAsW9qDDnhOdICPAqTMqftVDdyReVxeJZnPXfKl/bexEWrdQtrZ
 uIGpIWYLfN5D5B4voSizPULz9P+re6GN3Bv5ak8564d3AJV0kdhz0JbTpzancGJzWv9fECZe
 ChDz181l6dkN0sH6GGOkU=
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="103474203"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofzh/HacUYVN6GmR/MBDtmIrO9ju3Y/Oo+PBlrBXc+jFxq8cjxSj4pn93q6MXIb01xPo+nYhT0eLVwE40oyZUdT8hp3EJCo6w7TjVdyq2MhC8WZHIJbrA4UhDQt4Qiw6jRmMJy4i4rhmqNXAhvVR9s+zoXRjg4mPF4EGwYwtJrNm0IpEnWcWhmC7osYXPN0Y9vLiuIcJqDQYNe4JfmgXqaOIbbJSH/1azSkN5jx4uf+VLaYdxiCPkE2vF87fHo2zyAIXdc1oiUR2J86UIWuoQEkEHPALXhpRUurbSJu6jZyDWIg0D/sR5dbYT5FIEqbT+6JmyhOMLwoLIqBTJ7cgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TRfRo/vwqJdd2nOP6GwL6ag6RGk2ZLD1LhaZ3gY2CE=;
 b=BNM8qhWvgePd+lyTkhUFo4sV0i3QRTXtIzIqwp6Yp45sEh7orI9+O2SX81L5UsEWqLLhqaQ0FLfPh0Ma8i/QN1MflKPsZvZOgh73vzKrT81PNU1TxVkIc3DVPOwT+D37hgxgyuUAlzKdqAgQCFhRsct7AF3QluMeNM1Mnhy7TiCW0E7bhrTIxiC7LezbFrvkbQ0cplm0xszuvtkApZXVhIGV+A+OYnXi61WWNx+FY0sbg5ApyPkYdijJLPniH8/g7TqOQJb15dK8Ds2/7TklXOsF0/6vhGRbntnT4fzdavksxvGk7C3UlS+62T0pV2y24cDgk+MOYPLolNlERizc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TRfRo/vwqJdd2nOP6GwL6ag6RGk2ZLD1LhaZ3gY2CE=;
 b=Tq/7eomAFhkjPnepLuC6STCn4toyzFzY/neLfMxiIXKp44XhGASpAFknGAGGUAIFtyokmvLCG6SGSccKKlOQhUlOMh/jEbxUsoj0Cop057/D8Ym4fj7ZVIMAGD4Jn51m8elo3m20x2M3Tyt2C8G9lzwrWMFzuBoxSNKSInCWUYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <14d8128d-6f50-99e5-ec98-366318e7be1b@citrix.com>
Date: Mon, 3 Apr 2023 11:55:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <ZCVtcR5u/14/WmCU@Air-de-Roger>
 <9108a58f-da8f-14e4-de88-a7c8c8abb0f7@citrix.com>
 <ZCWgHxCL4yXD6CxC@Air-de-Roger>
In-Reply-To: <ZCWgHxCL4yXD6CxC@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0419.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: a83456b1-91d3-4a5e-d8ae-08db3432049a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WKET558DhG3LAHR3wU7lGBV+1SAVaLYHao7LDDHgU0IaG7Kny7h3thRyhQsgopErFW5++UfDHuzZltFmLKdX+nyuAEOBuFTdv+wtHhBXcAmCN2rdyrBrj6eYf0LCo48YxjZFimIIcaHJA9c30f5o2ZzRU04NohvNSjBrExjXhC5+MdYJGsUYPjcF5LMTQ2bU4TMpNJX5Th2p4mtFtLHP1PFfZLzKqGsm9e4URVC4QwtrVcmKiXBFWjaSQFPbIq9LIC4Baz3PtEYNHn8gkqaVcpIvhHA8I6P/0zqkFr7I4qshP1/SpFaI5tXlpsjsiF4ENJYr8A5wJzU/38mlHGHRwX4iZrA+Aw8CBvrU9KjK2Vjjh9Ru4TAtgBe5AHfSi3b4TRSgBXWRek6DFIcNL7F2hFtLuRGOZ7ZRl6DK/T5mWzCfVqsGZzfrlg62CbL7cNZ4Q+plB6pxip3qGBQmoJZVUQerG2hEPQPHKh9Zz3/7VjHxy4RWCii0pSGmtQOKOmkbJaIj+sf42qLYLJ2dqPcitpSfqHaWwy9x7CmdPY5AOooi1x3MxiGPkru1ZCZHM5k7jgHsjpn6DStpfxhbzVGL6k/Z5Q4eORwXm2gD9oQzTwqAqbYe22ozIT2YVGJAhiXG5U8erzNf3GOOUgXz6mGQ7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(31696002)(86362001)(36756003)(2906002)(31686004)(2616005)(6486002)(966005)(53546011)(186003)(6512007)(6506007)(26005)(6666004)(4326008)(478600001)(8676002)(66946007)(66476007)(66556008)(41300700001)(82960400001)(5660300002)(38100700002)(6862004)(37006003)(316002)(54906003)(6636002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWhlTnQwa0d5NFpBOWNud1pQQjBmQ2lhUEdLSE5vaW0wQ3JqL2s1MkJmZ3VX?=
 =?utf-8?B?RHc3RDFHLzdXMldadGdHWE1EU3ZWZVpJTVVEdXdsZ0doQWM5SVNmTkpGTm9l?=
 =?utf-8?B?eWdIK0l2RSt3Vzkxemo4Slphd3dqUWdSWHZnSit3SXc1V1UwYnVXejZXYnZx?=
 =?utf-8?B?dFZIbmlDN0U2dGErd0pKUXg1c1V4TUlXZVE0QU1Da2tuZnBHM1pSRjhraXd5?=
 =?utf-8?B?dW5xTk53NmErZ25WVzF6VmVTLzlUYnNBVkc3QnREUTcycG1uc0hSYVJyRmNw?=
 =?utf-8?B?Z2RvMGFpc2xLbms5WnZPd1VGQU83UUdPZzBnTVYvOW5qVXlBL1MxemNNTWM3?=
 =?utf-8?B?RUV3Rk84WjkvN0pvWGllWWJFMVdFVFRwYTZmNVN1R0hJdElGZzlPYjM1dVpn?=
 =?utf-8?B?RzBKenhnTVFKTDVSMExMb0hIc1k5OUUrZXBGbFROeHBKYWpIeTVTYzNxSTAv?=
 =?utf-8?B?S3dBNDlDRUhBSXJobmxBVHgvVHVGMkFTY3c2SVF2VzRRc2N2REdZRzJCNVV6?=
 =?utf-8?B?K2tIZ2ZlK3ZKcHBvb0l3RUxOVVRJcGRTNk5GcFl5R2FwM2QzVmcxTUtYa2Fi?=
 =?utf-8?B?Vmh5SGFKUWw0b2pBQ01CeW9xVTU1QkVXSk9CR2xWM0Y5QndZQXRHeFErZW1y?=
 =?utf-8?B?aG9yWWh3WkRFUlFFYVlEblJ6YVgvTXh4azkrak16NnNQcEEydnlmUXA1Z2xL?=
 =?utf-8?B?MU4yaE40ZkJBdzFUNFY0UU9ZWXFtMUpDSFJWZ1dHOFp2L1Qrb1JDV3FuMVhT?=
 =?utf-8?B?SmpMWjVsQzRidXdtdzkxaGVpR05BbFlMMzlBMHZSVjh1bzJJSSt6L1Zhamsz?=
 =?utf-8?B?S256Y2dkd2dzZlp5WCs3eGsyZ3pQMWhZNGJVTnBROGk1eVVkZWUvLzNodWxU?=
 =?utf-8?B?SGk1Y0lKK3htRC9Bc2NYY1pIeXEvQnF0eVpjck40UWcyYlo5V0VKT0NXb2Y1?=
 =?utf-8?B?QnFiR1ZEcjBzZU81bGJWL0FBVFJkRXhrSFE0OTkxRVZ3QkFIbGZwbnpDSTQ2?=
 =?utf-8?B?bnZ1d1I4VTZzcndhNWJCVmxUWFlKK01RVlFkVU51dHgzRnZJbkpNM3hYUGtj?=
 =?utf-8?B?VkpvVUVTbENhUFB3dFhCMEcrK1pLRkFXRXRkYmtKVDBBZFVucVBrWm9OcnpM?=
 =?utf-8?B?elh2QjRpOFc0eURLclJ1TGE1MHRRTThQa0JpTUpGQktNc1ErYjFOOHhDOEVT?=
 =?utf-8?B?UzlxYUF3YlRRZlQ4RnRhM0VuVm9qR2IwU2JzL1FHL0pYUHFUTmNOTWtXRncr?=
 =?utf-8?B?SlFwa2wzWDRVUmVDSDcxYkFqN09KcXVTOEh3OGZqSnMzdUhqdytvODNZRG9u?=
 =?utf-8?B?dTE4U05Jb3JkRjh0Y0daNkNCK2cyM2JRdHYvSSswZ1dkVnFXSzlnNnB4bFI0?=
 =?utf-8?B?VjZNSXZ6NWJEcGpaRWFLcGh3NjlPVS9LVG56ZEp4ZDA2czZlZTdHeWZjZFAy?=
 =?utf-8?B?OFg5bjkvcTJEZkRJVEZLRVVkMGNKL3hQR29rbXZ1cE15Q3JVUThJM2hycFk0?=
 =?utf-8?B?Mk5CSjNLSHI2dnNUM1FWMm9BR2FBa1ZkbkRyRVFMTHZlK2ZDd3Z6Q2lXb0kv?=
 =?utf-8?B?anVYTGdGNGVhc0tQQitiWEhwS0ZORnJtTWpSQVJQbXJWK2p3RHIvK3JiU3Bo?=
 =?utf-8?B?eWVadmFBMDVTUUp1a2xyUWh4TkFYWGhnNzM4a0hRUGV0Wi9xdGZUdnUvRytK?=
 =?utf-8?B?dTRjQTBHVjhGMGlSTjNtTTBZWFUrNXRONG1xQzlzVXk4cVpUbHlKT1k2V2ti?=
 =?utf-8?B?a3BZM295eUN6eDBHNHpqa3UyWEZreS9jSFloRHFsbkYrdXExVUcvMG9YcVQr?=
 =?utf-8?B?WmRTaVppd0VkVzRjMmR2YTFZZnpNTFpscjBFaWtuVFNVay9rQTc1R0RlNm81?=
 =?utf-8?B?VStreXFSQndlUGo2WlR1MFlWTG54dkozRENDR283OU02a0M0amU5MGxEaXIr?=
 =?utf-8?B?ZHV0NlE4UXpRNWt3N3BBTEh4U3B3MjQ5MHJabWNDYlNDRmMvaExpT3d6TUVK?=
 =?utf-8?B?VEkrV2V5VUwwRngzMVMvYXFoUFZRZlBLZDZxYlZEZ01OTms3Z0xoZHpITDJn?=
 =?utf-8?B?OWV4UWs2dStMZWJxdEdYZFVPV1J3eERVblBBakFFTWxvTkZvOVdpYmMxNUFC?=
 =?utf-8?B?bkxJaEVzU2w1SUVFalJJSUFYVmJpeTFrVExQYU0vTFArZFRFYTkycG9lNk56?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hfK0S/r0XySNmPS4uOIIA3mT7D1QjH3tZKU02dGRHbZdQe68FSdWAUBOS4fgydaIaaF3oaAyXazrSZa+Dpy6yWVZu47cum3/uEYUhELPCMr6Rlq2X7BMRQct3Sq92mOwfi71p0hKVRPVAOkZl8okZDXbEkRf4I4Oi3rzMCeuOpg5cwQZFk8eyxvdKfwR1gZ9G4Z88Yjun/GwG5HJI/Mqb2z5m0EirUF474oSGJqyXVLxj5//r5etdxcqWqOAbZ7YS5YTj+b/esH3bNky04giIM6+atkY9WEl8qyeoBg512pAjDabVHYBqCsLYwxSGpur4g4G7Vzrm3mA9h8guyduGn0OXRj3z1q6w+l1i+COL9Mc/6awgMPoEtCNie5cPaWn4ZUxM00P7xNoe3GGkv8na68+NQRh0H14ZpUzb2+dtBQY+tIq5pkbXheOEJcu27Nlu3G1qp9SiZ0wZW6Amil4L4DKJKp/yWWpzomLKtHVFhslC1W3roCY5Rt8yG0uPzPxFk1RU1s1tpdJJcT3c+8cZBFWt+OPb7KMZYHgaEQvnw7E/fu9K7DhKKcriCXO4LQwhFihCXAO1uYX4m6pFCAPu82TqKZq51MxVEbMXG2pWBYQHVQB5Sj2BXImaVpRHdK49ShGbw0C9QLs6EHemlB0xWfFsL4T7xOS+FS5fID3vzvSbfCDyo74UEnk82Io+L/sdQ3fhL3uGQUHp/onsBm8BOCw/+KcF6Fnl7NoQcBQEnasVyVXy6it8qt7xx+exNDh7tCJ8G9UIo6IfOhW75AUg7OoKbKKuPnKIlRy/dcDbt4xSNjihdIxZr1dq7GkHdr5
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83456b1-91d3-4a5e-d8ae-08db3432049a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 10:56:03.6252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: on0nacmmeG8eE3LQhdSgBim3hrqnk1v9S9ghITwPhJkYZYjoWMEcKoSAdNvTH+nksFjpzwP7kBhgf2G5oBWYVTIMkL8XesDtUF1sNwNegMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5189

On 30/03/2023 3:43 pm, Roger Pau Monné wrote:
> On Thu, Mar 30, 2023 at 01:59:37PM +0100, Andrew Cooper wrote:
>> On 30/03/2023 12:07 pm, Roger Pau Monné wrote:
>>> On Wed, Mar 29, 2023 at 09:51:28PM +0100, Andrew Cooper wrote:
>>>> tl;dr to add MSR_ARCH_CAPS features sensibly, cpu_{featureset<->policy}() need
>>>> to not operate on objects of differing lifetimes, so structs
>>>> {cpuid,msr}_policy need merging and cpu_policy is the obvious name.
>>> So the problem is that there's a chance we might get a cpu_policy
>>> object that contains a valid (allocated) cpuid object, but not an msr
>>> one?
>> No - not cpu_policy.  It is that we can get a cpuid_policy and an
>> msr_policy that aren't at the same point in their lifecycle.
>>
>> ... which is exactly what happens right now for the raw/host msr right
>> now if you featureset_to_policy() to include MSR data.
> I see, but that's mostly because we handle the featureset_to_policy()
> in two different places for CPUID vs MSR, those need to be unified
> into a single helper that does both at the same point.
>
> I assume not having such pointers in side of cpu_policy makes it
> clearer that both msr and cpuid should be handled at the same time,
> but ultimately this would imply passing a cpu_policy object to
> featureset_to_policy() so that both CPUID and MSR sub-structs are
> filled from the same featureset.
>
> Sorry, maybe I'm being a bit dull here, just would like to understand
> the motivation of the change.

That's pretty much it.  Forcing them to be one object removes a class of
errors, and makes the resulting code easier to follow.

(Based on having tried to do the non-merged approach first, and deciding
that it's not code I'm willing to try putting upstream...)

>> Merging the two together into cpu_policy causes there to be a single
>> object lifecycle.
>>
>>
>> It's probably worth repeating the advise from the footnote in
>> https://lwn.net/Articles/193245/ again.  Get your datastructures right,
>> and the code takes care of itself.  Don't get them right, and the code
>> tends to be unmaintainable.
>>
>>
>>>> But this does mean that we now have
>>>>
>>>>   cpu_policy->basic.$X
>>>>   cpu_policy->feat.$Y
>>>>   cpu_policy->arch_caps.$Z
>>> I'm not sure I like the fact that we now can't differentiate between
>>> policy fields related to MSRs or CPUID leafs.
>>>
>>> Isn't there a chance we might in the future get some name space
>>> collision by us having decided to unify both?
>> The names are chosen by me so far, and the compiler will tell us if
>> things actually collide.
>>
>> And renaming the existing field is a perfectly acceptable way of
>> resolving a conflict which arises in the future.
>>
>> But yes - this was the whole point of asking the question.
> I think I would prefer to keep the cpu_policy->{cpuid,msr}.
> distinction if it doesn't interfere with further work.

Unfortunately that's the opposite of what Jan asked for.  What I have
done, based on the prior conversation is:

struct arch_domain {
    ...

    /*
     * The domain's CPU Policy.  "cpu_policy" is considered the canonical
     * pointer, but the "cpuid" and "msr" aliases exist so the most
     * appropriate one can be used for local code clarity.
     */
    union {
        struct cpu_policy *cpu_policy;
        struct cpu_policy *cpuid;
        struct cpu_policy *msr;
    };

So all the cases where you do have d->arch.cpuid.feat.$X, this continues
to work.

The cases where you pull a cpu_policy out into a local variable, there
will be no cpuid or msr infix, but these cases already have no cpuid/msr
part to their naming.

~Andrew

