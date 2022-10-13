Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B41B5FD8A5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 13:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421911.667626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwoE-0003Il-NI; Thu, 13 Oct 2022 11:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421911.667626; Thu, 13 Oct 2022 11:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwoE-0003FW-Jq; Thu, 13 Oct 2022 11:55:30 +0000
Received: by outflank-mailman (input) for mailman id 421911;
 Thu, 13 Oct 2022 11:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/C9=2O=citrix.com=prvs=278604417=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiwoD-0003F7-4M
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 11:55:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecadfd4d-4aed-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 13:55:27 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 07:55:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5056.namprd03.prod.outlook.com (2603:10b6:208:1b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 11:55:17 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 11:55:17 +0000
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
X-Inumbo-ID: ecadfd4d-4aed-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665662127;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8u+d48JW0gObJNKEvqc6+r8rrVdSLe8x6z5eIv34PUI=;
  b=H0+SYpYVmIBcRQ9ZZAdFVHmKunpwI2XZ4fTiFudwvHJk44wTt4bpknBA
   36qLuZPoSd0LnBtRaNefqQK68noKf+88/2zFT68DAEClDZmcFFJE3Kh9W
   fTpTGoh/ZxZr8xkZmeYAEyl2vCFO62y5dlPe6J69xW7KmOKUDpTkHAHRl
   I=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 81754575
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xcKsv68JOQsL0EWdtcPdDrUDmH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GAZWDqOPf+DNmLzKo9yaY23pxsB65/SyIVhGVM4q388E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5wdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0qVtD050y
 dMyFGkyM0iMtu3q5aCBRMA506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVqy3x2rKQwEsXXqoYKeOE9eNTqmSTz20LNCZNcQKU+fam3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht8ztLSxitvuSU331y1uPhTa7OCxQKHBYYyYBFFEB+4O7/N11iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:5Pyb0KlFP/U/8esmn9Lux377NuXpDfJP3DAbv31ZSRFFG/Fw9v
 rPoB1/73TJYVkqNU3I9errBEDiexLhHOBOjrX5VI3KNDUO01HFEGgN1+Xf/wE=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="81754575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOWXsBWzbp5Iyn17n/34qVpldq+6r9kPHJXERKQHumrMJ4jEKfBEGnmg9A4gpXjJjZpu/yaa7K/QPwM8x2MEMdVR912Bzx3Tjah+2jLK4sKe7hd4zMY2lraiyNh0aufLzqHmwUM2JR9vR0fxHkTlyK6RmZZARFobDe4Iq+rD12W4+TxchiH1roWY04wcbf3S356b5B8FAEY7ye1Un5l6gb30AXS7rOrRAOoGDPNhjNIzrSFqwzZ5adrNeO0xNI5vKpbi9YR/ofgtttEj82X3Z+3BGhEuionuvL9WoErSqHrQgkx2b+QPQ8YnWnPKTW5kM+O1z10PtD+plDECtNfSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+9bIMeg5CieGeW6gIMgufaEzLGlL6trWJlt4/3nnsI=;
 b=IoAaQTzSkC4UpA5KNndRp3oEPq125tW1soHKA7ZWfo0x/DJJLdKNXwLIH8zKguejBR6OmraiktcBybQYeMtwMXDg3pabUfXtX7zIje82YViUGNXZ9wdBqjtF0fYpaH/9+wwm1TH5a05N+wW8Che9T2ZhmqujhZzTabNwZYLs5Z0QHv9GdJTiMnKlZSqSyzBws3L31gRpAoce6khybiIgoocRdXD+u92fZBx0nmicxygEAKjEajrYztZ7XI3HWbZ2fVUe5MA7wXz06dp2sFHHYgWlgddVD6Y7Bb3baJQssUKrHhbJvbItAOINbK+7EXFF9xc9nLov+kx2CSMahfv0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+9bIMeg5CieGeW6gIMgufaEzLGlL6trWJlt4/3nnsI=;
 b=oE63eADB7ANy+qui8j8mWaVI75GMi/xpWkvbea8JEc3trtePBv/BvJTpJKRNS/nsgovoCZDrVlpQF2b98U7x/OGeb8lNShKQrsVkBeiPIb0UnMd7qOtskBjTp1pmJ9G2FDHwBp/+2hc/mqyOQKT4yBaABnWFQridDKzQ0jtRT2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Oct 2022 13:55:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/5] x86/mwait-idle: add AlderLake support
Message-ID: <Y0f8n/HXErhx0tN0@Air-de-Roger>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <f1ca24c7-0031-7ed7-d4a6-a5686cc7fcf1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1ca24c7-0031-7ed7-d4a6-a5686cc7fcf1@suse.com>
X-ClientProxiedBy: PR1P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fc26ca-2a26-4c8c-c65d-08daad11cb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KFtXqmg+BWg3cdae8Oi1GoavBRC12J6sfoqcLo2ZRf+c1wg8wsiVZhMqT1i7T895Ao3J5l7iAn89J6fAPz2baChfYqsNPfkTRW5lnB3OtVSsOYXTmitZhJ50D/ZmlVRF/ZidyKgEbv+t0EOGr00UwV2Mq2yyL3p4V2ub8DbMk3XOPGJSKFMG9qgGhXTkvHYyWyUfVpMp5aLE2QI1WeiW6U+cYcsnzgf2ZXjMpn+yxFBYKIZZbAcmvE3f6xq/krzHVO3uoHzz9WCP4pNixiP5dC4hgxHarIpIawkAlFocQ08Xan3by/6SqbhUoGsYXyCAXN2I+iLhcH2SPQ1RL4Y7XwIwUPm28g9BR5bwb5pR76jMl/a9KppBdwPXGb7QMyqFkvVxH8V+X2bAAbus4yxqmXiT2VjoFztG1QRLSeE/hUMkGheEb6+8EZc766kYi4bKdqhrdYBPpJgwSflmchbmi6u4vNM95BXjLo1GdTRcc1oaPKa8LIwU597YuENmjY5hUbCOthodFaOcQGKz+PyvW4v9oA9n4UCVrWv6/hB/DXG6kX/C/xMoTvTcRO+8bVVKNlJRZiranMF4AiQRO1mO+wnH0TQybTuBV4hruGWOq8FSVpsa/eFnl5IOP1vr5CsT+maG8s3n9aCUrM6AY0z221LXfCayzxDihn+r1FkUjEalt7BC90BjAihW83yV5aPqalVVTf3xPy+XiS0ygSaXjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(38100700002)(82960400001)(478600001)(33716001)(6486002)(86362001)(6666004)(2906002)(26005)(54906003)(6916009)(6506007)(85182001)(8936002)(6512007)(186003)(66556008)(66476007)(8676002)(4326008)(41300700001)(316002)(66946007)(5660300002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXhseW5odmUrcURtbUlYVEJrMlo3aVMzeko1d2k0cFVHNUJqNWxGcUdkbGw3?=
 =?utf-8?B?S1FxdCt4UTM4UlhYOC9oaHp1bStWbCtwQW1qVU4rU3J5L1BCVTBlT0RRdjJ5?=
 =?utf-8?B?NlF4N1Qvb3BCVENDaTNuKzAyOXdiY1hkYlVONDBsTDZsOGxRT0pacmhuTzlO?=
 =?utf-8?B?OHh6M0h1WUtiUnFxMEF2UCsrbDJjL0pEZHBVT0J1OTVQVDVrUlRYY0JNNUhR?=
 =?utf-8?B?dmVacURtbzF5eEM3dlBzUWE0N2w0VzZzVlpyRFpkZHVUNkNKekc0bkdJV3Bi?=
 =?utf-8?B?aThiaDlQWnE1UVkzYkEwMlBhOE8vSy9DOWdpNE5wNndzWDJGN2Rwa1A2a0Fu?=
 =?utf-8?B?K2Y0QzV1S295aGk4TjVxNXhDNzNvSUtPd3k3eGxXSllQYjBWc0QxWU04bytW?=
 =?utf-8?B?ZWd4N0dEYkJyb1QxVmF2eS9SSVJvSmZEV2FHbjhOVG5DSmFGa0F5eDlOK3Zx?=
 =?utf-8?B?RHJkZ2JxSS9JMkNUdlBDMnoxVjNpazVEc25vTE5zZkRhNDA4VXJUWC9rcWxs?=
 =?utf-8?B?bTdiKzh2cWY4THF3dHg5c1BKSTFLMW9ZUGFVUWxvYm8zcFF2Ty94UU5KZlZs?=
 =?utf-8?B?NHdmbUdvMWprVFBCSTZ4NWRtTmFlWmZ6V1BxUmcwWjhiL1hTdUhVeVFEc3BC?=
 =?utf-8?B?Vkttd1VsWlhyRWJaQ2pvOWxxakwvZ3E4TWlyN3BFaTcrbEJtWnZvdGdPZ1Z6?=
 =?utf-8?B?MU9PNmlsZGVnYkRmVFZJU2NYQ2kvMXkvOEJsQitzZVlyODVzSmhUL0l5SWU2?=
 =?utf-8?B?WUNzVVNHYUdxWjFrVFFrc0hZaWxscGlxa0MxMDlBMHhvR1ZIaFc3dFliSUZT?=
 =?utf-8?B?Und1MDUveGxxYll1RHowU1NLS0ErNW0zQ0gvTW9RT1Q5dTQ0Z1hMWlQxdS9x?=
 =?utf-8?B?b1U5M2h5SGVCRk9Yb2NjUEJxQm45VGRjNndYSGdRRFlTWDZ1aDhtVndRc1Av?=
 =?utf-8?B?M3J4Z0ZBWW5vMFRXM1kycFRoVng3VS9wMXAzTnR0ckQyRjNScjZyT2V5VGtI?=
 =?utf-8?B?MVQ0RFVVTThha0lLM3ZxK3hnY0hmZlpydHU2SHNEeHBIdjB5VlNUSGpMcElj?=
 =?utf-8?B?N1crL1dSMFhNemJVNjY3dXNxRmIxNWNMSVNWUXVmRnV3QXJ2Nk5sNE9VeFNH?=
 =?utf-8?B?Y2JpOVVLYUtYNnN0YXZnck1GejU2RlNPZldTTS9UUFIvZVRjRE44QmV4M1U5?=
 =?utf-8?B?dVpaNVFnZXZYV3hyeks3MTR4TENjNXlrMHBPYitSYnd6dFdwWjQ2eHQ4RlEy?=
 =?utf-8?B?UDNlL0N6SlFmbUFsa1E1NDAwQStaYnlkbTV4cGJuY0t3UkxEbzVlZG5tak5Q?=
 =?utf-8?B?cG5CZTB6M0UyMWJYelhrbkh6OTBPVDlZaTZnbEdXUUJxdS9nM0taVjI0ZndM?=
 =?utf-8?B?VU9QWE5yUVdoZEJyTUpOYXZJajZqLzMwRFg5OURuRnJncWdXRnhpQXUrODBK?=
 =?utf-8?B?MG9ub1pPaTB3bkhVTjBuSE1KdzAvLzRvbG1JREZieFROZHUvRGdiZFhtZUdR?=
 =?utf-8?B?Rlh3SFdkdFM3eEE3eUI1bTJkZnhZSjlpam9kT2NaOHR6Y2VzSjVXK1dMYTlz?=
 =?utf-8?B?Rmc0QmRNcTNPYUdibDFYVFhtNnpFRi9aSmNUYjRpU25nYzYxczFFUC9CL3p4?=
 =?utf-8?B?ZDZFNFBmTW4raTNpNno2OXhvVFc5akV2MzdmK21OL1N4YVJLV1lvY0t0KzZt?=
 =?utf-8?B?UWxvdFJCdkYzZVRUNW0wbTdXVkYxOTc4RERiS0ZKbnR1RWlCaHhRNnIzLzFV?=
 =?utf-8?B?T2VTVGwxQXpoYnNxRGdNSXBlL3dlVTBCWTNSdjRWYXpUYUNXMTR4djkrenlW?=
 =?utf-8?B?aXFhays3TWdXT3lURlAvc2FkVTNJODZ2VWtvQTZVaDF5TmNmdmRWUmplT1BG?=
 =?utf-8?B?cVgwQTFlNjYrRjNXTTNZVWt3T3VLalBMeFlGcnlvcFRYbFZBbHFuYkZib3pG?=
 =?utf-8?B?Z2VFYlNaVExTL0ZJTk1YR0dkaXJnckFpdXZvakhZVlhVQmlnZnZXWXFUUzJy?=
 =?utf-8?B?Q1ZjV1daUXU5MXFBZVVheHlwRlJTMzZ4Zk11S3VhcWN3TnVPS1lzSEV5RzZs?=
 =?utf-8?B?eFVydGdTcmw5VFZxUktRcnluam1DMG1LK2hKeE9zU3NEN005QU8rckFzcnlk?=
 =?utf-8?Q?nyT+PtYEmIiKreTP+hi+msTwR?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fc26ca-2a26-4c8c-c65d-08daad11cb83
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 11:55:16.9462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cLGPwNCAtdilxbF1NEhZiVDRXFWhuL6OFpPsYyk9/Go9GjSDA4ruAoBkUtdHvH+1eMJP+/V4PQAbQw+gc1GgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5056

On Thu, Aug 18, 2022 at 03:04:28PM +0200, Jan Beulich wrote:
> From: Zhang Rui <rui.zhang@intel.com>
> 
> Similar to SPR, the C1 and C1E states on ADL are mutually exclusive.
> Only one of them can be enabled at a time.
> 
> But contrast to SPR, which usually has a strong latency requirement
> as a Xeon processor, C1E is preferred on ADL for better energy
> efficiency.
> 
> Add custom C-state tables for ADL with both C1 and C1E, and
> 
>  1. Enable the "C1E promotion" bit in MSR_IA32_POWER_CTL and mark C1
>     with the CPUIDLE_FLAG_UNUSABLE flag, so C1 is not available by
>     default.
> 
>  2. Add support for the "preferred_cstates" module parameter, so that
>     users can choose to use C1 instead of C1E by booting with
>     "intel_idle.preferred_cstates=2".
> 
> Separate custom C-state tables are introduced for the ADL mobile and
> desktop processors, because of the exit latency differences between
> these two variants, especially with respect to PC10.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> [ rjw: Changelog edits, code rearrangement ]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d1cf8bbfed1e
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

