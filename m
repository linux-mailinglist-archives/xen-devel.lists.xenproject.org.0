Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8815705221
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 17:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535387.833070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pywbl-0008Ts-Eg; Tue, 16 May 2023 15:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535387.833070; Tue, 16 May 2023 15:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pywbl-0008Rs-Bg; Tue, 16 May 2023 15:29:01 +0000
Received: by outflank-mailman (input) for mailman id 535387;
 Tue, 16 May 2023 15:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pywbk-0008Rm-1G
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 15:29:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fc8d2d7-f3fe-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 17:28:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7364.eurprd04.prod.outlook.com (2603:10a6:20b:1db::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 15:28:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 15:28:54 +0000
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
X-Inumbo-ID: 5fc8d2d7-f3fe-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SV2lATIUiHijZOUMnALgI20oFD2NvxMFCU1PVhjoqu0CvkAc8YC8h88sY81IFT+hKCdxc200yOzR6z3gl02qqentiSlrTmzOVABIJBRmQ51sp1bQAM7pRNFkaGxCcUUcXT8o5zjuB9dqBvpY7qf1m3zRJLVb7zuY0PjjS54CVth+GAuTS2SltiWHG86qxr/lH0HB+oFM4trTe/aGmv/jlpXFP/HtTEjK6z0e8MbQu/gO1ZIb4HoDjejYA3qqdGkoef+ljCSC6qyVBm6Ri1Vi5rDf0Jr9sTVh33CYm9exu0jxUSpDqfHB/Ewc4qgnAKbx/rqKgOo/vfjZUF3WrpZkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4RnTQGIwyBi7nihRbezGj3BETawT/XGOe3PTDLectU=;
 b=LsCXpLgSt8WJMGfo7g6oOc8DovG4txEdQceq5Jg1bt0EEBjFbyGLIFIO2zj+j8BTNr413IvB1DHw+19W6j59mstucm6H5Rh7J8s384KUfLy09XUUai2530sjo2/PtVmvbdeZKqMs7aRyQ0RdEunXBFx3rc2KL5KnQ0Gh/RQsJlw7+bjaAeYm3VeIaojsx2WZ68FMz2fZS8W7H+COw6bK142pLQyqZ80f/8G9GS8RELOuDvNiEBbFTSIdx39Ctl2R+X2yqajZosE51xTJet+PBAzsVcpr86Hoke8t+FbO1QvIep7XQYu28SKfRpTFwiZI3VzHMiWG4F3ocxn49nzpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4RnTQGIwyBi7nihRbezGj3BETawT/XGOe3PTDLectU=;
 b=35PAU6e4KDZk4zlHtBKgXAFvPa6mN2u/i0uTaBTbdKkK7qkqXzJoRwgnoE7YpZgt9Mugplq8StYFIXILRh6QJHAhp2gw7FcF0YzTJxf83lEs8yyJZ2emBt90OK7fQqCU7knzfVJ98WWFMjzh7+IahuWtUqqgjayNse1rw9zEJsg86K/DfmobPeBRjscmn46prrKUUwly5WLCywlPPRH7QpTg4he78DBjabb7Zyu8xFqhXKMh1dsG/Ntg/SJJEn6gbvY/NgrJkamdl9png/PCTIAZpZfDIQNDs4coWHFRBGgejA8uY1MnZd4ew+2skwefGBeDyVB6PHDJwGQA+VCkAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <172e9ee5-4041-2646-d793-2e06d3212b57@suse.com>
Date: Tue, 16 May 2023 17:28:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] docs/misra: adds Mandatory rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Bertrand.Marquis@arm.com, julien@xen.org,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230511232237.3720769-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230511232237.3720769-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 95088de4-1c60-4080-6067-08db562241e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jnS4aemAkZUy2S8mRJI9eiJv4OsCgqnRVFhmGS2r3jxUryETlkbqDw23bWPgd0Rm9rXiLHRgwEKXNzoTOEqiLx5IBlLL81Hu9e6xVWx7EqsVlmFX1w40RgXvuOARHYU23rPFudyfD/RhCsIxV/jBuOeiypd2tlZGoh9WzNWlhXNo2KLLn+YZ1+IfkW+/JSL+Cx366Yeq+8SDQytMFPfXT7y1+HjH6M3nfQDWYyLMZ29OuVB/O8xsDWX1YE5ikoOA4xDIrtokb0NN0rE325RNlnCCudPg+y9dtnsX2WOB1R9suHZ7zRCtIEVMeEUC+DjnryPKaRwSkG2ooq+LH+uz61QW4poCFeLFp0BxSNLWq8f2pzkeFpbVWfnlm/M+hthdDe+77R1BXEzVQeY1kno6QGGuANnlJZ8UujXYBFghVyTTxL0s3hL4jO/LcU5JyFssQXchDj4aRKPg5XHEUxrRx8ZuB66/h3fAt9Cdoft3YWwN1oNPdGMFLx47km4C7COrmwKRe3yJZnH9m+BlRMLY2tWFs+4wVAUHR+s3DPY+2I3yWtGQ5op+c4AV4HPjvBrzEXhdNV5OrFIKkRvjvsLMuNbo939ryYICqj3I07K80CKqrEVNrgDG1yy1WAI7JyAWvVMGBgbbKpsM7e0KSE1G1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(5660300002)(8936002)(41300700001)(4326008)(66476007)(66556008)(8676002)(478600001)(6916009)(2906002)(66946007)(31686004)(4744005)(316002)(6486002)(6512007)(6506007)(26005)(53546011)(186003)(2616005)(36756003)(86362001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkRnZExuTUVoSUk3bUkrNjV6L294b1hzZE1hSEg3d081cVorUzdHdGdsOXVV?=
 =?utf-8?B?WHlsY2krcEdVbHpjRml2Q2R0VnhBclRrVk9VdCtJTnNaalQ2N2ZvNmlsbjRU?=
 =?utf-8?B?QStJSGtEMVFzLy8vSWY1bnljREhvYWpLVVJsVk9YcWs1NE5FOHJkb0tUK0Yx?=
 =?utf-8?B?K3J1OXRiUkpKdmdRUWxKV0FlZFo4L0o1YnBQVE9pTWEzUE1RKzdWYVlxRVNr?=
 =?utf-8?B?VGJtZmFFRFhIcitucGovVGF6b1JoSzIxNDNwTXVwaU1Sb1BlNkpkU3BaZTZ0?=
 =?utf-8?B?ejBRUUpsczBVOTc0YkZkRkFFaGoxbkJnVGJSc21vWXp0aEZVdFBlUmtZeDBY?=
 =?utf-8?B?MkZNaDBTL0txWnM2UGR4eWFYbGNNbmtsM0JqeXR1Wkk5YXdNTmZEZm9BNzlI?=
 =?utf-8?B?cjloQ1B1TVRUeFpBNUY0NFdDSkFiMnFyZGhzTm4yY1hMUXBHUWdqQ3NHVHJ4?=
 =?utf-8?B?V0wxRGlLWWhQTHFkZWx4VFFTcWZsOGFVeDJhWHpMUlErNk1DdzVQU2dNS2t2?=
 =?utf-8?B?elhKK1Eza1Qxc0N1c0ZMYzZ5b2hiNXhvQ3dXSGxMT1VkZHB5K1UxYXR2NXZQ?=
 =?utf-8?B?ck05YkV3NnRuYmREVmpJblI5ZHhiM0JmdlFPRDhCRDI3SUU4YlJnaGJWZ3Zk?=
 =?utf-8?B?SkFabmNEZDJmR1poa0xYazRVeGt3K0hBL282dE9OSzVHMEpIS0ZpekQ1Qk5a?=
 =?utf-8?B?YVdjakFUcFVVWjdXRS9QZGpuMXNkSFpYRlZlRExsOG83OU9raG1MbnR3Nnp6?=
 =?utf-8?B?OXZLcHpYMmJ2ZHhYcTN5WmF5eWVQd2FsOEZQd1oxK3N1ODJuek5sUjRXWE1T?=
 =?utf-8?B?Rk9GV2pLdlQ3cUEyeXdCY2hrUzBrNGdhQ2czb1dBbGJEUHd2bHl0MXBOaUJ0?=
 =?utf-8?B?Yk9ZekwwUnNHOG9ZVVVvUThwcHlFUlI4ckV4U2pwbStaUGRBS3VzVGFNY2JC?=
 =?utf-8?B?NUM0a1M1TmZGWDZ0K1B5SWxqbkZCZXdUZ1Y3eFBHbEVhU2RPQzlVODNQdSt2?=
 =?utf-8?B?dmZZcXdLRzFmT2RSK0dJY0RvQUt1NVhTYk1POTRWN1RQL0JvVXJhKzRFQzRP?=
 =?utf-8?B?cWcwSmdsMkh1QTVrdjdEQ1VwOERXbzNWL25CdmVHcGkzUmdDZndLTVBmZWNt?=
 =?utf-8?B?ZmozZnJSa25uSTRpbmR0WnJtYTVxQW8yeEVCNnBKb0tkTFlPN2FXSE1oeVhM?=
 =?utf-8?B?VHpVbGlGV1VBUUdqTE1Kb0hXaWRpZlJZUCtUVXVLTjJ6TC9WNnhaZi9ndU1x?=
 =?utf-8?B?dXVvY3AyZXhNLzZlb3pObmJQTVhFV0lmMzhsZXAzY0pCclFpN2NrM25HTFZh?=
 =?utf-8?B?aWxVZzAzWnM1bEp5a0E4TGd5YkZSREorSTFFOEt5TjdvMjIyVHRsWHdhQ1dY?=
 =?utf-8?B?RUIzRExSZ1UvbFdGeGx0a0NFKzVTUEEvQm05My9uRWg1dnM1bWxyd3dwQWE5?=
 =?utf-8?B?Vk80NzVpTXIrd2RQSTVieVVwK2JacklzanZ0UEdZZlZiUFFnT0ZWY0VqdU9E?=
 =?utf-8?B?T0Z6allieEo0OHdlclk4aXJHd3F1SGt3RWRTc3dhQVhVTDZoQ08wS3lHdmpW?=
 =?utf-8?B?QkVRWlM2eFBqNGhWUklKMXVQMWVqbnM0YlN0OUhWYUJYRnkzWW10dFZHNVlX?=
 =?utf-8?B?YnBnbGFyK0FzNUJ0dWhtZkdhVmYzc2ExejNlWmRLR01TakR2K3RhbkJHaDM5?=
 =?utf-8?B?SGsrVWh1cmNmeEUzcFhRTUROQ01YckdRSVQyOWV4M2dVNlEzc1lCZ0xOMmtP?=
 =?utf-8?B?cUFIS2s0WEJrNXM2ZE1oRDhoaHNBL0lKczhwenhYYk1ydVhQOFZHV1Rub1A0?=
 =?utf-8?B?TlF1OVdwZzM1RVFpWjZ3cjJ4LzlMc1BZejhCQTFSWDB6c0JOcHM5SlUwbnoz?=
 =?utf-8?B?cllqcFF3WkdweE5CeHRtRG1Ia2Z2b3U1WERDdGdoa05mOTlsYVV0emh3QTgr?=
 =?utf-8?B?QnVZOTUzVFV3NUQzMWNmQnN4QlQ0ZnNqUWVlNjJoV3hVdDltNGJwK3ptZU9n?=
 =?utf-8?B?c0NVOFoxUWU1RFc4MDh6QnJ2M2hMdGo2WE1jeWNPbVlaZU5KLytBZTN1M0dG?=
 =?utf-8?B?ZzBqSmNLMTQzekROZ1dqbUV4SUVyK092cjZVenlBdVVnVk5HcGNVZEprSkY5?=
 =?utf-8?Q?xVwjWWe8jWuLh/m9/l2ZPrEuh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95088de4-1c60-4080-6067-08db562241e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 15:28:54.1615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64hcUgUqol8vNO7SawwWE1qVDHW2my4GjK0BsN87BkX58/O+41OvIDor4QIWggSmkfcf69C2iC4oRYyndkQuEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7364

On 12.05.2023 01:22, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Add the Mandatory rules agreed by the MISRA C working group to
> docs/misra/rules.rst.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Slightly hesitantly
Acked-by: Jan Beulich <jbeulich@suse.com>
primarily because I don't see the point in enumerating / discussing
rules we're not affected by (as long as this list is for the
hypervisor only).

Jan

