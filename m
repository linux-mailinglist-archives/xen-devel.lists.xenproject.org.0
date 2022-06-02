Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B075953B739
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 12:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341067.566246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi7Z-0000SS-9Q; Thu, 02 Jun 2022 10:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341067.566246; Thu, 02 Jun 2022 10:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi7Z-0000Pr-4t; Thu, 02 Jun 2022 10:32:05 +0000
Received: by outflank-mailman (input) for mailman id 341067;
 Thu, 02 Jun 2022 10:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn9h=WJ=citrix.com=prvs=1458da55d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwi7X-0000Pl-GP
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 10:32:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bed5f2a-e25f-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 12:32:01 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2022 06:31:34 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH7PR03MB6920.namprd03.prod.outlook.com (2603:10b6:510:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 10:31:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.015; Thu, 2 Jun 2022
 10:31:20 +0000
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
X-Inumbo-ID: 3bed5f2a-e25f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654165921;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Lc3kxqnD2oflSsw3jGzA+zmnDDdB1/FZ/NgnMK5gZQ0=;
  b=SCbXRH1/zhVLVKlxaYN+nH078HxVBsUwINAZ+DL2m4lVBmS40es0j0gG
   NEFjuZ/VBOj5riXcxF9VY3hYIJmXt6ce7Y2A6HouR6+OBA6pxD+2o9T+j
   EtmGot8FL3tyA8uPA2iDI30z2yyRywR3wt7XgMiHWHA0riySH8FkghPyh
   w=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 72053464
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4Thfb6/CLTcJRhriPZppDrUD8X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2YYXDuCP6uJYWP8Kd9/b46+p0IEvZbRnYdlGgprqyo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw34DgW1/lV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYe1aA0XEJ3XofUmST9WHD05Z6lI4oaSdBBTseTLp6HHW13F5qw0SWsQbcgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHviMvIAHtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGcA9QnJ+/ZfD277/SYgwrazFIDucJ+sWuhM3UCfv
 Ujk4DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHlVgC8iG6JuFgbQdU4LgEhwASEy66R6QDJAGEBF2RFcIZ/65BwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPfo5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:2rM1e6H7QgglRrp6pLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,270,1647316800"; 
   d="scan'208";a="72053464"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8N6Ye6JVHfNrr/whHmE4gHIy756KU3FrVT4iEE21OIKYBlEztdycTZ7Vn0Lc8UxENUgiPnQmBDyzlcO4M5wmeOSfyJzetT3GgnPxFQN6Tyf6ZdXQP1fdn+OoUTLSDBD7gMtdC8ThguYiy9yzBHtPHgrsR0IZRenSPSIHxAkxH9W0AoHH6/F/UU5HNmNvIPt8wTldvwZHeun5i9r2lQQgLrkfVRf/OQl0aQ+V5F62zZ/fz+BPBf3eC9XSYmp6E2ZkJwUhns9s72mOP+kXDDmuPzXDksqR4l2XcHbieJQbC7BJBwYtFlXI4edyx1U5NBAdZpKynw1BQ96SIU4aQHMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm/Gu6zBTbrxRbWMO7xuqnRaXgDDNwDJdD6WtnkOX34=;
 b=hq6EZ6KpL5RQV7w7tl2b/RWLjLdNddww/FTw7K9Exmj7QRE2PeZ2UzG5Di0T5I4v2c13ZHOpHgSOjHzk6FOzlR/wPyHnQc1Id1Ir/Nu+UJEOz4AzZQ9BxQtP+1Sigpt2/FNI+7heaoiILw5CyOiBySvdi9EtTDxz97OP5o5vBte8+OzqA+ucmE11B88qRrfzlzdgLBN99SSOmSjMInT7XPlS8RQVbMgXW7AFSsFqx5QaGZ879spT7rtEhsd3VRgGjzpJtZpm0PMbnmRZ07BltOAB+Vofvv+rPVWsPO5Q8TQ2Nr/oSV8nkQW5UYNGX5YSQtYCgVRofD/Ic/ZpV4zXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm/Gu6zBTbrxRbWMO7xuqnRaXgDDNwDJdD6WtnkOX34=;
 b=PXGRagBkEt6peAyXAiODraMX003zBEE45H5mtIQq4/CcdQIW3Jevc5g6rpvVaRYx6dC4JlequPIQjFweQAYRAEenhyK0bTr3Y6igc3KSZVZmtyR9JM9AFfJxytKfZBvpWUxfXIMY/b7uK/eR1cLxNfaIqFusqo5Ksqiaw2VNIJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Jun 2022 12:31:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 12/15] VT-d: replace all-contiguous page tables by
 superpage mappings
Message-ID: <YpiRdYJP5f65pRYG@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <b3126189-2fec-ec14-7129-7897cde980a8@suse.com>
 <YpiETolItQ7FvcsG@Air-de-Roger>
 <749f47ee-9258-c3a5-fab2-125c1bdda845@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <749f47ee-9258-c3a5-fab2-125c1bdda845@suse.com>
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 241c946d-df31-406e-fd7f-08da448308f5
X-MS-TrafficTypeDiagnostic: PH7PR03MB6920:EE_
X-Microsoft-Antispam-PRVS:
	<PH7PR03MB692095D5A0EE4A1160D776478FDE9@PH7PR03MB6920.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b1Ja1WqyVqXb8W+5UBMeWJQByZrUi0XUmH3vuITJmCPj+31/z5NVitAWM58gpcwQbEsJmXNzl92Tjx21JiyiWgDgX01a2dLW4czHcM4JGSOd26Bmvy5lkOzoTGWq4o7jaA5qlIW9r3oooGA7Az2PC6c1oBKIfAnWijtBOnjqKoQzgcXV0mWlVIqNQze2aI22KEgXYHYmuMvRJxBE7jN5cFbPqq9koSaE71SJ2iOZZGFj3wCA8ksiTRn0Q2nFBbEThKod1yCvmbHQg3kv9GzRiqkfAFFxRPQKqGgaUSv5TWld3ih4hqC69IWhlwACabltHTDuQznfBcUvc6IuL17u6kSV44xDRyhrR9v9212eeedvtgK6Or5YkQdaNyg515xu+B4X6UIT283Cdq9rv1LgIMBeBygpbbMPWCGDSlpqFcow454OIbk1vB2pVbwHdUCHDub89Jp7h4dcaiQ5hAblSDBgsdoYmku5G1KoaNBI/ygjEZNLv+FRnCQpTp+Hf7efWBkiXWrx2uW2jhTrtWhII1v6hKcUVLM9TUkAtCP6H/Wy473W0zMPLZ4x/bTibYhHSKm23pPzGeX8Rre5XYX7xP8ny2l2x0HGR7Kh9/NT5sFVjQqY4jbr+DZffBIcZyslEhrImjX6yIvEvmdQ8fSRYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(9686003)(85182001)(6486002)(26005)(6512007)(33716001)(53546011)(6506007)(86362001)(5660300002)(82960400001)(6666004)(508600001)(38100700002)(186003)(8676002)(54906003)(83380400001)(316002)(2906002)(4326008)(6916009)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjVKNEV3ME9uYXNMMFlaNVNNVUc1ai9DanBUMHJ6UFF5UTB6TXlCcTZIUHZS?=
 =?utf-8?B?ZlpJQ2dZRTM3cWpRTnhwWDVnV0JHTnRxRWFlNTFqYUxDRnFsdk9tVzcrVjlZ?=
 =?utf-8?B?NjIzbEI4Z0FNNGpCd3dTMzJQQVBWbTZCaFlRay9IYjlseWJTalIvS3UrRXNW?=
 =?utf-8?B?c1dxeHFsQkdQVEJWWVJyaHVHSHVIN0cxaXB1bnUvd09LQ3JXcUFxRGJRUDdu?=
 =?utf-8?B?UDRrUVV0cEgzbGl5akVTSDE3SFN4QjRFc0J6Y1l4OVNCeTJTazIxc2h5ZEpB?=
 =?utf-8?B?U3EvUEpPSU1EN3d1L1Z3emFRZEFoaXRRbE9SOHNsNm16OXdmYm1lOExyc2RJ?=
 =?utf-8?B?dldibW15elA4azdJek9LeTNTNnptZms2S2RIdHR2R2VGY1czQm9lUlg0a2ly?=
 =?utf-8?B?d21BZGZvNDhFNStCd1k2ditldFN4N1ArNlF2YUZvZHVmWldJL1VGT2ViamRB?=
 =?utf-8?B?VE5hMG43WkRZZjMrSGxCdkJSVHBkbksvSnNhNjhYN2NDalRnKyttZ2RCQ3ZB?=
 =?utf-8?B?WFl5TU9GTGNqdzVxVTRpRHlBQ05zTXZ4WGF4Z0EzTkU4U3Y2V0w1TW0zZVFZ?=
 =?utf-8?B?bWtpbmxpMlFuanVNNnZlanNmejhSSmVUNlRYb2lTMVlIVVBLQ3gvV0ZjNTNv?=
 =?utf-8?B?bGJJczdMb051a3huQ1BqSGtUZktRQXovWnpySG9rVkZwQW5VckJlc05XaW13?=
 =?utf-8?B?bHVIM2RxelNHMHdoY3o0UTgyYStLL2lYRkxITzBMVm9TaXU4Z094ajhzTWxN?=
 =?utf-8?B?dDVZVlQ3M0psOXhZQnpUemlaS1BxUmFxUGY4YW5ycjRFTHF1VWJxdTZnT0ZB?=
 =?utf-8?B?SmhhVkFpWk1qc3VkNStuU1lsNnZJeGpyQU5STmxqNi9MS084SzVhRG9Ja2dU?=
 =?utf-8?B?TTVYdzVlUVN3eWNUTTZnbGtiTnRSNnlGZ0gzQ2RMMUc2QjIxUkpBV3NpMXhx?=
 =?utf-8?B?dGpJeURjQVJxMUZWUkZsWXVaby9aSldqWGxCWGJaUVNGSUJ5MWNuQU84YmNB?=
 =?utf-8?B?Y0xJUFg0d245M3RXRmJ6Mk50cDJ3aVBRcmV2RFMyTWkxbTkwYnRyeUZxcDF4?=
 =?utf-8?B?V3FVRnpCU0piZXVZN3pteDZVSy9ZTE0vakZ1Wjg2a2Zzb0lBK3BKNzY1d2wx?=
 =?utf-8?B?ckl3aTV3blFudCtrNjdaS3MzdlZTMkJxZXZ3aEdYVkpJbmZKZTlRamtUWlhp?=
 =?utf-8?B?M1B6RU9HcW90R2dhYWpHSERjclVZbGFlMHhvWWhiNGRDVjVweEJHUUhZNUM2?=
 =?utf-8?B?OTI2M3lZRENiRDFUT3MrWjhEc3UrUHl6K0lYanpHeU5KeUFjUkVmZjV2UER1?=
 =?utf-8?B?NzVwOUhuenBDcEJNMGFzODFJTWsvcmJZakZXWGhXcnl0WGIxUmFNdk50NDZJ?=
 =?utf-8?B?TzJ3V3AwUEY0SG4ycThqcVNwRGNabGVISENiekJ2UnlEUUd3VHdhcXJzenB5?=
 =?utf-8?B?N1JjQzNBSmJzZE1lakY4R3NLckgvRFpBWnd0RkZHQThhM29xRWxPSUNBem53?=
 =?utf-8?B?aFphYVVEbm55VXRINXhkdFFZYTJFUmFYWE9mdWJiclowTmJTcFB6Z0JWMXBQ?=
 =?utf-8?B?c0d4TmtaT2ZOQVFTRm56QThha3BVZUhaMkczT3hxVmxOc0UvbjUydGl4N1Zj?=
 =?utf-8?B?a0U2NFBJenVjSS9UQVBtTGkwL3Z1ekZ5bXArSFVWMldWQ0JnRHR1NlNORks4?=
 =?utf-8?B?dkQ0OVY0bHNFZ1o0U0lDb3A2dVVScnJnVHA5Y0dMVVc5ZXllWUN5M1R1dnVr?=
 =?utf-8?B?WDN0SVN1NDMxYzVzZjFWVkZ6VzM5dDJ2Ky9OZ0sxYW55Wld4WE9aVUdWdUNY?=
 =?utf-8?B?OTVNNlFITEdyWk1sYU1hNS9qQUNPckxTcjlXSFFaSUxMeXFUaCtvUnkrVWZY?=
 =?utf-8?B?a0FTbU52U0wvUkQyb0JyN3k1Z0tRcWl6cmx0aXdmeVZ4NE4wVXJ5UTlHT0RO?=
 =?utf-8?B?ZXFJckZqN3hWbnkxdllmVDh3WDJSTDJ3b3p3OHJpVTJ0OXAwWWdEcFZqMlhW?=
 =?utf-8?B?M1M1NGF4Q2l5UTB5M0psSnJwN0FYa1VzeHRoZnhjNmRWNUt0MWJlZitzaHdk?=
 =?utf-8?B?NkZCd1pTbGRWYnNvcHlUbGhuNjRVbmc3Z3FQR05pb1U4K0NsSFdTVDQ3Qjdo?=
 =?utf-8?B?TDlKamltMUJ0clpuc0dlTVRPTWdxUk41dStTdUd6YkEzbGNJeHpKWEgwNUxa?=
 =?utf-8?B?eEl2M3BwM0hVY3lpTCs2OW4zYTY5U0xvUXovZExIZENZYThyNlhtamlrUi9z?=
 =?utf-8?B?aWIzTjB4K0d2RnJjS0ZueWlFV3NOOEE2R1JWZ2VubHEzSGZJVHFPSkZJUGN2?=
 =?utf-8?B?SVVuckR2ZzRlL2l4SExhUTZtNnY1SDBKK25UQ3VQMG13NllNek8waFNJU290?=
 =?utf-8?Q?+Oo46YdwEoXpyvBs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241c946d-df31-406e-fd7f-08da448308f5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 10:31:20.9183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwCrbPQ4Z/Rwp2WXvum0CDPppsWSNc2osq9uWT/b3tJYA643lz8ScwI2lh2NFSL3oHnfx3gBJrbaBSD2N0n5Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6920

On Thu, Jun 02, 2022 at 11:58:48AM +0200, Jan Beulich wrote:
> On 02.06.2022 11:35, Roger Pau Monné wrote:
> > On Fri, May 27, 2022 at 01:19:55PM +0200, Jan Beulich wrote:
> >> When a page table ends up with all contiguous entries (including all
> >> identical attributes), it can be replaced by a superpage entry at the
> >> next higher level. The page table itself can then be scheduled for
> >> freeing.
> >>
> >> The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
> >> for whenever we (and obviously hardware) start supporting 512G mappings.
> >>
> >> Note that cache sync-ing is likely more strict than necessary. This is
> >> both to be on the safe side as well as to maintain the pattern of all
> >> updates of (potentially) live tables being accompanied by a flush (if so
> >> needed).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> ---
> >> Unlike the freeing of all-empty page tables, this causes quite a bit of
> >> back and forth for PV domains, due to their mapping/unmapping of pages
> >> when they get converted to/from being page tables. It may therefore be
> >> worth considering to delay re-coalescing a little, to avoid doing so
> >> when the superpage would otherwise get split again pretty soon. But I
> >> think this would better be the subject of a separate change anyway.
> >>
> >> Of course this could also be helped by more "aware" kernel side
> >> behavior: They could avoid immediately mapping freed page tables
> >> writable again, in anticipation of re-using that same page for another
> >> page table elsewhere.
> > 
> > Could we provide an option to select whether to use super-pages for
> > IOMMU, so that PV domains could keep the previous behavior?
> 
> Hmm, I did (a while ago) consider adding a command line option, largely
> to have something in case of problems, but here you're asking about a
> per-domain setting. Possible, sure, but I have to admit I'm always
> somewhat hesitant when it comes to changes requiring to touch the tool
> stack in non-trivial ways (required besides a separate Dom0 control).

Well, per-domain is always better IMO, but I don't want to block you
on this, so I guess a command line option would be OK.

Per-domain would IMO be helpful in this case because an admin might
wish to disable IOMMU super-pages just for PV guests, in order to
prevent the back-and-forth in that case.  We could also do so with a
command line option but it's not the most user-friendly approach.

> It's also not clear what granularity we'd want to allow control at:
> Just yes/no, or also an upper bound on the page sizes permitted, or
> even a map of (dis)allowed page sizes?

I would be fine with just yes/no.  I don't think we need to complicate
the logic, this should be a fallback in case things don't work as
expected.

> Finally, what would the behavior be for HVM guests using shared page
> tables? Should the IOMMU option there also suppress CPU-side large
> pages? Or should the IOMMU option, when not fulfillable with shared
> page tables, lead to use of separate page tables (and an error if
> shared page tables were explicitly requested)?

I think the option should error out (or be ignored?) when used with
shared page tables, there are already options to control the page
sizes for the CPU side page tables, and those should be used when
using shared page tables.

Thanks, Roger.

