Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FBA725863
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544526.850370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6op9-0007BQ-16; Wed, 07 Jun 2023 08:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544526.850370; Wed, 07 Jun 2023 08:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6op8-000792-Tm; Wed, 07 Jun 2023 08:47:22 +0000
Received: by outflank-mailman (input) for mailman id 544526;
 Wed, 07 Jun 2023 08:47:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVY=B3=citrix.com=prvs=5155b7726=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q6op6-00078c-SG
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:47:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7bccd34-050f-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 10:47:17 +0200 (CEST)
Received: from mail-bn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 04:47:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM8PR03MB6262.namprd03.prod.outlook.com (2603:10b6:8:26::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 08:47:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Wed, 7 Jun 2023
 08:47:13 +0000
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
X-Inumbo-ID: e7bccd34-050f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686127638;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TXyktJokEBU34tivD1OmVlT5HWopySQGUrE14jMT4I0=;
  b=gvZTYL8WWNKINRj50cR9SJD2AJhDYOGNYdgFTM1Lh8x4mV1ua5uJjJSD
   //6ZJW8R/eoyWCDsiXwJxa+nFLjcbRmoPN0PpOe5lo3pWsASJgkF9WjFv
   dHg/PKv1XwCmgTj5e2ltu9p8ptuKWq9XdOxJaGRwLwztYMFbJrhHkTWjk
   M=;
X-IronPort-RemoteIP: 104.47.51.49
X-IronPort-MID: 111767837
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ORH4GKh30WFqFdHPOswiqBMkX1615REKZh0ujC45NGQN5FlHY01je
 htvDWmPbv6MZzT1KtBwO4i0/U8PsMKHn9QxSgdtrCpnRXwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4geBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQGdS0WbUzav9mK3eOxG8x+pvsiA+nkadZ3VnFIlVk1DN4AaLWbGeDgw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEoluS8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqiB9xNRObnnhJsqATU+1FUBxIfb2eQuue+hVGBCvB/M
 mVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht9H0AT1itpWFRHTb8a2bxRu4NDIJN2YEaWkBRBEc/tj4iIgpi1TESdMLOJCyitr5CDTh2
 QegpSI1h6gQpcMT3qD99lfC6xqzorDZQwhz4R/YNkq14wU8aIO7aoiA7VnA8e0GPIufVkOGv
 nUPh46Z9u9mMH2WvCmEQeFIFrfw4f+AaGfYmQQ3Q8hn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqm8ggZmCnSpSDK6wQ==
IronPort-HdrOrdr: A9a23:ZLEz0Kmv42/NV+LhxzWiD+dg5yfpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-Talos-CUID: 9a23:WKmBRG4PBcQTFV5zS9ss6hMJAcN5K0Xm8GqBKR6dG0ZWSZK1RgrF
X-Talos-MUID: 9a23:6qNO7QalctnjEuBT7njRuXZtO85S34+1FkcCjqpXmemdHHkl
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="111767837"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c311jBEhHZr0r9rubvkk0MH3h0Zy3m7pLajhJ6u4/1jHARfEIyFPl2Y3lEnBOCyngOD2sstTXwFzN2xb3QJsgdAlZzP0zj6hsx9cE5fa6hXk/TBjKcZBYjfW8PX1jBlEN7EUCoOpy+OqBJCZNyhOkngvlAR1n2084X40bLoiyISbFfqYfmd1tpMBIoxBMqd/v51V+3HxtKCKnDhfzJboVkWXdBL5g2EP3YyhQ+U4PNKGlNGM+wKLLlBdMEQT7FpCmVhsSgG9tAJpa86YBc8YqhpwQDTd/+Ba2KhMxqHI+ApEKg6ci+m/M2ui3X0DrX6zBaeXTI6BPRE7uWa1tMyZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R41ycdtGBp8x31As+gryMGntCQYt9c19C8Pfcj9qd0w=;
 b=UArUivx5uI4GXvJ/LjtTDKGeQPefMNaq9rpTwl3unAMFnexbrEIOMtE9vuFjROsQ8Fj5WAC5Ct9pcC9n310U0o3ssmHj6Sbeba97aDfuxs+L0D+uhfegIKAstRbKYROUyqm5ruk6Z8fD87Yfn/xKbrBjsNB+BkEVlLWcdCsQ/HVmq3x5zje2utCXG0AqRctLWaY5yb7gmdYelOOSK5FwqPywEYLQR0sGf9gNpu6QymZTIWKGQzJTTP6NWM/wH3ctBA6429nlLsNRWYZM2kfaB0M0Ed7Fs/Rsb3g6yNz9i4+0Oxh3w2x/IsuavvO5jQY2KyJywvAaISPsYDhpbMNfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R41ycdtGBp8x31As+gryMGntCQYt9c19C8Pfcj9qd0w=;
 b=H77Os8LfO5YyVNKOtgT0yviRp5+ZLJ2WoTBsJFm0fK9qFk3RCsThbaixlI/R741ixlROGl7XbUi93eT9wN2TSu4u9O+D6G02GuFiDK2i3OUdEn/YQz1wRL60J+IhTGwYvb31vPbKBQutDewZ7HoZ+w5odVrbKGE3Oo2z2h5O5wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 7 Jun 2023 10:47:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] livepatch: apply_alternatives() is only used for
 livepatch
Message-ID: <ZIBEC/bwQI440Mze@Air-de-Roger>
References: <20230606172307.38857-1-roger.pau@citrix.com>
 <37f6c3fd-5b7f-ddbd-b4b7-c72a797531eb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37f6c3fd-5b7f-ddbd-b4b7-c72a797531eb@suse.com>
X-ClientProxiedBy: LO4P123CA0572.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM8PR03MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: c5eb0a4a-0c58-44cb-310d-08db6733ca1a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uk+Crflws05x7cbPC+SEw4V02cNPf3c+HO9Fm4mjPFItprDeHeQ2oykokPb9eJUU0yXF1s6ojE5RZZqDFMt8kRFDUYOHTT7wCy5l9ZVxMIITodxzExJYSmzwEykYW0uUPHnapH2dxP+luyhM5y+O01dZVkwmbV3QCFb0jKrRZmbK3PDNzU3+GbKbVTjLY3X0drlbaZgjJ+QUPeve4G+gjsnOB2q3xJM/xD8xXqV9yVNx5YrSExyIdBXuYlBG0ld7HCjYnGvP0HTayh+WnS7PFO+KxlGOJsfYrk4N8kyrZyVfMotV6tXBjKTjSGYb62euQ+hfj/FxKZKK+CULv8qSuSRpdEKDYB+dcdOHJ7gHSEh2JpAIjBA/GV6jTUWP8PvyLLU9sJ+0YsDRcngJB4sIm4mMDEtUzUDwENqhwrLGZ6W9wIdy9k2aIW9HHkwFyJXacIyIJi0mKqjiPrptUVhu4RXfDh0U6vSo/Hi9lNOivt1vhLH4sR0Wg3egQn1jtZvmYQ4+zJ2xyIwiMWcY6b0Ag0olZn8WxHYbDsEJVvwLZD1s+ckDcZzWTXHszpSMkemx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(6512007)(6506007)(9686003)(26005)(186003)(53546011)(33716001)(6666004)(4744005)(66556008)(82960400001)(2906002)(66946007)(66476007)(6486002)(8676002)(8936002)(85182001)(86362001)(38100700002)(5660300002)(54906003)(478600001)(41300700001)(316002)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJ5OVVRSHlpY0ZmTWhLZFl2SC9IQ2I3WElXUElmWGsyNElRM3NNdGg4L3kr?=
 =?utf-8?B?TXhVQitUOTB3T1BUSFFmWjVqQVdOVTBnVzVoTnF6SC9HRWUzeE9NdmtKcDRx?=
 =?utf-8?B?NzJqTlFEOEQ1K3NDT2FVcWVLTDg0dU0xejNyWENFMjVyalByOWFacHNKcU84?=
 =?utf-8?B?RWJhdGFsVXVKMXNZS2pFQVI5eDJORXdkbkRna2ZxcDhVTFNVbkdsdGU1ZnFk?=
 =?utf-8?B?L1JHdGRBV3V3NVppZHRHR2V2Szcwa2M4Wk5DV1J0TnhReXNPek5td2VLNDVp?=
 =?utf-8?B?UGVhdm9vMUk5SUJzYWNReWEwa0laUUE0dXhTUU40b3ZobVJFT0ZPQWVyek5G?=
 =?utf-8?B?OU4yWTlxbjdjU0VFbzZZU1l0N0kxV2hqS2V2SUs4S01tS3poK2pFL1ZMQ2gy?=
 =?utf-8?B?aU91OW41ejZzZnJzU3puYWZwS2xWT0JpUEtKdllNQnJSRW9MeGlod0ZNM3Jt?=
 =?utf-8?B?NlJ6UWdSSjB0MzUvdDBWN1BwZGNTN2t6bUhMOTFpcDhSRCtIQkZhMURiT1ZX?=
 =?utf-8?B?SklIQ3lCWDl6ODBrWkh1SEI4dVp5ZkFjUnlBUTMzMHluNUpuRWxPalBrNXNC?=
 =?utf-8?B?K0N4SXk5NmgrdlBYaHhiUVkybzFzaDFacElpamsrRWgzMzlTcmFpZFR1ZzFX?=
 =?utf-8?B?RjNlczJDN1ErNnpJb1l0QXZBcjBmdkljNmJpVTZQVnVZZ0pGblV1ZGxMWmp3?=
 =?utf-8?B?NmNNcFI2UTU1SVhSUC9pYUFxMWthN2pKMVd4VTA2bzcySDBSVEFJN0srcDZu?=
 =?utf-8?B?YUtnbCtwdjdnaDVrNlkxM3hKb3ZHQUErekIrekZIY2MxaHFjTTMrZE5adkVq?=
 =?utf-8?B?QVpkQXgzMzhiV3BTbittVm9oVFc1SVpUWFV4VGN6Qkk0aURXeWU5ZS9yZVMv?=
 =?utf-8?B?VHdQTzBISDNVdnlhcU9YbldoZmZpVmltQWMxSWM3a0V2RmJsajlXS0NzY0l1?=
 =?utf-8?B?cGgxWGJJREx0NXFiV2M0VUlaSkxHUk1EQS9uUnUrTnFLQTBNQXNLbmFaNGdS?=
 =?utf-8?B?eC9UWU1xc1E2ZDFpV2RhUDRsdWtGMWxSZUgxcWhxRzhUVysyck5XT3NaUi9y?=
 =?utf-8?B?SmV6K3NFaWZzcVRWS045ZWFJK0RNamZ3TlVmU0haa1BLQVduUXd4WFhmRW56?=
 =?utf-8?B?SitMRyt3bUYxMHROMHZGeG4wSmFzbG9mME5nd2FnOU82VE5DWVNCZ0NsL1JO?=
 =?utf-8?B?OVJsbmN1b1dKZVpScmtNRjY0eFZ3ZGhnbTlRSU9ibEJlM2N1Qi9URHVDNEhM?=
 =?utf-8?B?T3RSTXBTVnRsblJJazhTbWphenpWejd5Q2NUdjR3YStXdnBnY1dSSC8yeVdw?=
 =?utf-8?B?S3V2UUVaRHBCWXl3MlkvNHZLdVJUcVpBZW1zaHE2OE1wSVZkNGNrZlk3Mkxo?=
 =?utf-8?B?bWZkTU00YXB0OWc2V2lGUmVwc2ZBcDJtd1VjeDdvRmlaSForQWM5b3J6UDV3?=
 =?utf-8?B?cXhmUGJjb3o2cFpsRldYSXVXY3VDUTNaZVhGZEtSekFBSEQ1aHJUR1RKREtV?=
 =?utf-8?B?bjRMSXhxRGl4dVAydnBnQVpwNytKSHVVellRL2hpK2w1bDlqUnpCTFlMbjU5?=
 =?utf-8?B?akZLY29TSHpRQStGOHFudGgwYjd1aG94M21ZaFE5by9xTUhqMUgrc0VMdzQ1?=
 =?utf-8?B?T1M3Wis4dTdwdmYzY3F1T0xRUUovMzFrdVZ2UjZnN3I3Q2ZrNkxRS1Z4WjR6?=
 =?utf-8?B?Mk5NVjdoMENaS1FSNmhwRGM5WFZwd1ZDR0VZM1ZMbDVYa3lUUVp3UUNjUm41?=
 =?utf-8?B?LzZWQTdXTmVkd1JGL09NM3kya1p4SUsvWktEYngrTDB4UjZ4WUIyMGlVUHMx?=
 =?utf-8?B?MkJrS2R0S0NLWksycklpeDE3bkdYUzlaTTFxTTdOdHA5czkwS0xvcDVRWGZO?=
 =?utf-8?B?MjZwRmw1Q1luaHJYR3VzTy9acEh4bXlZb0hkSjdFdFRpbmdXWENHQnBLSnBH?=
 =?utf-8?B?dUJvZ0dyUDMvTFpjcEp6NGtYbGpxWkV6eFRZb0ZESExRdTh5U3diSXVnSE1k?=
 =?utf-8?B?UnV4dXNseGVtUEljVWlCWnRQTE4vY1AvcDJQNFk3WmVJUjRMRzJCdlFxYUNE?=
 =?utf-8?B?TWVQOUNMZzlhbEJDMVFWanJDcDllQXp2d0x6ekVqOFdTbGFnWEVjNFZQc2xN?=
 =?utf-8?B?blV3bGZCRWcvQWxJcE01MCthTDk3cVlBMVZtSW1IUzBQNXJvLzZrOTlPRWpZ?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dLTvocj63fXBSAyVnPmYPs5pijEhv9q6We3hqlSyTEOxWtqt0ac1rrgmlKRe7/pDFIn6/ZL5yybXkKA+lvVY2Vmk1vWrW/FPgNx7idOVTzJtJJaF/xspho22PT/ScKsP8Tpq/XfBr4nbiL/9M8wB6Zt5OX9pRwclFBQPWh18ZrtNq8V/Vk8YfmvRSxIDwGlc6HWBQ0adjv3BxPzUzhLtGWcHO6RkMvkKpyMIHUQtANHiOVx7Slbo8JQnm+3m1l/6jF6ZRRl69JhdA4/5qgwRYg0CVGkXlGk5Jz/eR3uqSur6E7rqT+QfsSRCpWUE+RNJW1pbIhNNqN2nuYW5Esu+3V6/BJl4XDpqZayyF8gbPzUYGfJL06R5NIYvBtPll6gmuHeTI3OwjI3uiNRqWWIWbQ1n6rhVMnNgIHBDJY5DBygn6yf4CpXm19iBJqQcFasT0ieXp7I7YQBRI1E0F68fkOs/MMmA8bXAXFgVXpZjFVQvuVAGyvUOqobdp9NdOmsgrLrEsfiHKC3kVTNIdGQtVvFgCxyZLwykO0y3oU8e5uOrzS7rSEQhY8WOM8APY5em8RKhcaVqvKPd921TYvBtAPEp6nkrAxTAoxXDl2YBT/K0YYEOfuNn58UPeWtFOFr9pg7+KP+mUE+w3KMvszpe/t1AoqA8GWiJKlSt41doAIHzwP4q9n8Pv1zN87ZcUSQ047zqWxE8fwlI1Kc+AtaT2FaZ+zGb78ivxiS34oCIFD34dMAR7Gm8JDpidouqhSLAcVBMU6l6zkkNojf/0yuxtc4yE197PIHoQoYeYy4e69oEgYPJWG7fT/zDZmh3/1EJXa9hXwt+7Xp9/je91j1TZ3zHvhRX/dJP0DJ9YhuIWLHtjkp2o7YpXEZ2pWiBeUsavRaPxDGuwFeVtadD4Lw3+A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eb0a4a-0c58-44cb-310d-08db6733ca1a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:47:13.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgrvZM7NVK2xzeUV0YYGKnY5PeAEum9jqj6NlP45EiaROz1o81cF4lKW/d73hL7a8SvDiotLxEwsp5EGsPQbPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6262

On Wed, Jun 07, 2023 at 10:14:35AM +0200, Jan Beulich wrote:
> On 06.06.2023 19:23, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/alternative.h
> > +++ b/xen/arch/x86/include/asm/alternative.h
> > @@ -24,7 +24,9 @@ struct __packed alt_instr {
> >  
> >  extern void add_nops(void *insns, unsigned int len);
> >  /* Similar to alternative_instructions except it can be run with IRQs enabled. */
> > +#ifdef CONFIG_LIVEPATCH
> >  extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
> > +#endif
> 
> I don't see the need for an #ifdef on the declaration. We avoid such
> in a fair number of other cases, keeping the code better readable.

Hm, yes, we will get a linker error anyway if attempted to use without
livepatch enabled.

Thanks, Roger.

