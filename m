Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9784B747770
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 19:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558568.872786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjSm-0002jZ-Vs; Tue, 04 Jul 2023 17:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558568.872786; Tue, 04 Jul 2023 17:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjSm-0002hA-T4; Tue, 04 Jul 2023 17:05:16 +0000
Received: by outflank-mailman (input) for mailman id 558568;
 Tue, 04 Jul 2023 17:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvOH=CW=citrix.com=prvs=5429f199a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qGjSl-0002h4-47
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 17:05:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eea68201-1a8c-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 19:05:11 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 13:05:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5766.namprd03.prod.outlook.com (2603:10b6:510:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 17:04:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 17:04:56 +0000
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
X-Inumbo-ID: eea68201-1a8c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688490311;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WziFgsL/Izmx8nMR387oIXKDLqcCWewMvvWHh1fJaKU=;
  b=NA7gALyIWTaU3Qu3WtGkpPi93lcbKXvhzotdCzwg7NUNl44LiVu/PXeF
   gc42EstkBMKg5O++2TCMTVRngR/lkOhnaQtGgpGAnu1zKGxPa4luI0iya
   UOBzj+yeqiKJu0j5r7GadnpPp9BkaRvcIk8ly7fQ3imHf5PHKGIEe8fWX
   0=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 114443071
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:54T6VavKuw+ddK/icS6Fyp1YqOfnVHtfMUV32f8akzHdYApBsoF/q
 tZmKT+AO/6JYjb3ed9yb9u29U1SscSEztdlGlFu/ypgFStA+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACGyyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEj0WZC+io/2K0ejrae53r94JB8LLM9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIa9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThqqI22wXMnwT/DjUrZ12anteFp3KeWsxfK
 1NPoS0Lh44boRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSQSN9mSfaxloesQW22x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:cA4kEqFAPfzrHiK9pLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AQXmGQ2tNrESt78IfFNas18fZ6Isff2bX81b0PHO?=
 =?us-ascii?q?pUzZKT6a8U3W784Nrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A69/HNg91d9NZpdY07HMiXE2Qf/pa5YWRJnwgrbU?=
 =?us-ascii?q?HpcmEKncrPBK3qh3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,181,1684814400"; 
   d="scan'208";a="114443071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxLDtPkxIHrtFHj674Cc2CDFiM9miPicsBbwI4Mw4mFWGCJBGhn6lAhNk+dsveFw974sUGWt/sLWlr15DBlXh9gOyHhR5PHdAe/6ycuga68jrbePB8LYoA+hpuUOD9BrICHLK1OHP6+otZe3d0gZO32JwzDOUBzqWniBE+g2JyGoxTHBuzc6ICiiU0d5BJq7b7hWRShrhYrJYfk2laso4FE5VkgpmVQJ3K69UBo9wZHENryUTl4Y7qSCNL2xW6NE12QgbTempKJbKeviqwleS0gcDGVLp/k4nUdi2bO340c5nGgMbxx6/RoXU0rb77KetRjNdU2QGhBLEduD6qgrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WziFgsL/Izmx8nMR387oIXKDLqcCWewMvvWHh1fJaKU=;
 b=Lz0AU5xqpql8iMoa3iTDrBVfqMBpy3uuePbnNvFrbrRCvpxzDMBV56OhpXPZj0t6WBHrISkeBfbPVpz10G1XXp7mEnd3Wv/4xK2QrygR3TMyXNRX+JNls7J7zKletD6MVxDLjG0/4ptqpoYDOkIxl+aeMosIF+fRxbQA6iGEOj/tucdfQelQeBfha5wlCK1zJLBn24ubXYjzqYNWvFjwcuI5btj0IBFBr2NVokS5VMx2R7x+h/gFdmcJTkV2wVQUe86BFkvSokpqbt4iohBrSKEjFF5LLPtrd1+2Kd/2HU0Za3XMEaoPl6TUIoO/k067WjzGJD/p+fc0Ty/yEkqqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WziFgsL/Izmx8nMR387oIXKDLqcCWewMvvWHh1fJaKU=;
 b=Op8DOg8sF1fS/35LRWqD2HSEH2nZLO2p/Js8fPKTAo7czzLFedIV5Fd0TRvbv4+qndHGPGfWABTyZPa6actYqJTCw38kqrBmZ2n00DP0hbGCLszu/6mwCgH86pyPD/Ec19fEbwvJRDBmDPHFPpJkIoV0b2WqpJzUKWp722Flggs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91a3c0b4-04b4-d1ae-e849-f9c23540e0ba@citrix.com>
Date: Tue, 4 Jul 2023 18:04:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/asm: Introduce a tailcall pseduo-op
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230630152057.2944373-1-andrew.cooper3@citrix.com>
 <e85c73ae-aaba-a649-6bf5-5528b4cf6e95@suse.com>
In-Reply-To: <e85c73ae-aaba-a649-6bf5-5528b4cf6e95@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0440.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f6dceb-56a6-4e38-e9be-08db7cb0cae0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FULov7VTcJKsbh15t9lZWr0R4Cg5IEukMjE/thc1hDQFx7lIf31USnmxH6Tou6xZR5GK25AV51qceBpBOx5OL/uuOad24bItejm5/CPt8qTcVJT72tKXOmVjGE/FS5VIRZo2K/Z+n9gpHD5iDfoZWmXz2efyn0R/IxMu9yW3nbzYFsTB2FXWQGYRLhbca5Qwm8+wobgpA2EcNdpjletwJ2I8Dl3v8lEZSijftnFUSsBchnuotvWQrVwN0Fj2fiUxi9uMmErc+VbNB4PN1L/5B8zhVuvfnloik8wY/Cs0MvYmxQ1uG4k85AIIrN+cdHPvB6We2b35S9zsyBoPzb+CPaI77y4HNVgkiOjZ8NC1cyZ8rHDDynsif6Y2mYW0v+EMCg17Ef6ymKErNhlR6k8Zlhcmb2aTFxI00SDqmiQv84W/Qr1+Hg6AQ+uLKf9hczlEr9Xa961dp+ZX3dJBQZQOnkw0hLHzKBmjx20XGLelf3EnpQuFCMoisODbEE0ukvbuCnzibLFkn5yiaMoxwEDz6QwHN5qTd5m/1UYq1uRqcXhFMBVik+/s51+S/O+KSmt04gzFzcz/rvUIDD8X5iWtuPOZKTaVw4usdVPPOSZbWTcepS6ep4AnWku2TGn2nDH8C7eM3egG6ZBt29L+noFRNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199021)(31686004)(66556008)(66946007)(36756003)(4326008)(66476007)(478600001)(2906002)(316002)(6916009)(8676002)(8936002)(5660300002)(41300700001)(54906003)(86362001)(6486002)(6512007)(31696002)(4744005)(38100700002)(6666004)(53546011)(6506007)(26005)(186003)(82960400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1Y3THJmVHdMenc2ZXRESFRGUE9qS0tUU1NmRVV1SDFyS2dkbllyYjlKUms3?=
 =?utf-8?B?dlBad2FuRmloU0x0Sk9yT1N3Q3pMYkxid2tmUUFaWHljajdiVlRxNGNVcHYv?=
 =?utf-8?B?YjRabHFGUXBjMzFHNlQ0U3VyZlRZTzVNVzZQWXd0Q3dPUVlBZEJ1R0xSU0hp?=
 =?utf-8?B?b0xCRmRVWWdRUG8ydHV2Z0Z4enFkUlR4aVhuUC9Zb0hkTUVFbVlKSkZ3L3Bt?=
 =?utf-8?B?b2dXeWgzMDZMZmxYcTczRVpzOUJ4YVdpc3A2NEY5a2ZnR2k4TU5MWU14clRO?=
 =?utf-8?B?MzcrYThzTlFxc3N5RlNtMmdpM2FVTEgvWkRPbEErajI3TWloNGtnajY0cU9x?=
 =?utf-8?B?Um5BamhvMUhoRk84OEdpZ2JaTTZXRkFNQXhuWmtHTkdNSmFwK3FEN0NhUElp?=
 =?utf-8?B?U09GN2NmQXZ5bUtseFBlbTlPSmh5dmg2OEdqTGpoLzNsUmFHanFkZVlzdTAx?=
 =?utf-8?B?VUFpMjdTeTZxbWZBN3BkMml0Mzc1bFB1d3B0cnkzV2J0dVpTbFZCSHJBVmNH?=
 =?utf-8?B?ckxSOGZoZUxGZHR5QWpKWnNKamtMYmFTYmtXWThqcWgrWFFvcjlXaXMxRy92?=
 =?utf-8?B?aWxybmxLZDh4NnlmMmJTVi9SUFBmWXFuazRtQTNWanRrZ0krUDBFV0lWUmQ1?=
 =?utf-8?B?TGlHYk8wQkZjekFpSms2OFlLNDh0Rm1LVWNaRTIwN2tkUUV1STdZZjZBdlh3?=
 =?utf-8?B?aUdLUXNFc2V4K3VLK0lxaDF0dlo2WW9TU0JlL0pyTStUY1BmUzV4ODRhYVJR?=
 =?utf-8?B?UU02MlVRRDlTWW1LaTNRS1BSaWN5aHJnaHZnWit0ZmFhdlV0RmJFbkdpQWxP?=
 =?utf-8?B?WkVPcFlocXRJU0lqSEp2SUV1Y2wvUnFGWTFLWTJ1Kzd4RUhKZmZxaGxPUzdo?=
 =?utf-8?B?QURrc29NQy9ySEswdHpwR1dVazE5TmpCeUJ2TldINm1qVmNuTURQdVdQUkZy?=
 =?utf-8?B?SDNHZU42cmtNMTEzbWRZRERvV0ZrQ1YwY3U0eWZZdnNBOGZMY0JTU1ZTVlgx?=
 =?utf-8?B?UmYrSUFDMlRTeDU3dml0WGVGa3dMLzQxQVcrWktQQWVvY2UwVEkwOWZ6SW9w?=
 =?utf-8?B?c2p5azFhdC9KUTUzKzA1VXVxeVJGWFF0anZKYlh6aVZVODN6c1FLOE53d2R5?=
 =?utf-8?B?NlhlbWNLUFRrczkrQzV5SFN4RTVLZWptakdwajZGYlllNVN4UEYzR1dRYTJJ?=
 =?utf-8?B?S054ZnE3eTRseW1WTllDdnY1cmFpeFhJMi9QdU9xbkFYcWM3bUlMUlNzMjRx?=
 =?utf-8?B?TEZTNUlDck9TUk45OVhzWGFJVVlnRnR4K3lxQVZTbHRRSnpLeVZITTd5QjR0?=
 =?utf-8?B?aDVzNGJaVzhJcmh5alhmZXZFQ3creThpazdoSU5UN0RPRlNVMEJCcGoxcGJu?=
 =?utf-8?B?cm9yYnJDWjBwTnkwWTlLZnFua0t2VFR1VUZ3TjhNR29ydDhTdUhIT2Z3Z1Bl?=
 =?utf-8?B?c0xCZHVwYWhac2lONFdXSWxXZXhRc0kyY1lJaEpnblp6MlBHdHIxUFZZZ2VD?=
 =?utf-8?B?NTQzMzYyNVJOMzBQK014bWZZL1pZZ0FlcHdRN3hDd1J0L3dqN3ppUVU5b1Zl?=
 =?utf-8?B?bDZ1R2JOUnpqYTR5Ym13cnBQSExia0VWTVZUSlBWSmM5d3JMWGE1eWh5emJU?=
 =?utf-8?B?UHJWMXhRYWJkVDRVUVBGLzdUYTZIYXZNZWh6RGV0ak82cXZ4bTIxeW9Ud05F?=
 =?utf-8?B?bzJncmlEN1kzTDNwaE55eG9ObGdIbDRYNlE0VXVYY2ZJai90amltekt3K2hU?=
 =?utf-8?B?TVo2dXpialY0U1VscHI1M2s0N3pPaElleXZMektMeXlCMG1IRGhLTDk2UEp6?=
 =?utf-8?B?a2QzZW5PVmxJMGg1eDR4MHVmN0tJbUthZUdiYWZyMGlCYmhyV1hPN1FBNEkw?=
 =?utf-8?B?SndjeWtaSzZUd3lFY0Zid2lHS1RjSVk3RGhLT2hZVExFQTVjUnFKTVRUejNN?=
 =?utf-8?B?NWZiQW5TMzhQMG5RTVJtR2t2VXI1OXNRNXFXYXBTZVAzOFYwb24wckVjaHBX?=
 =?utf-8?B?Q21DWXhFbVlLM2hQc0taMUxBMGtYOTA3MzZxd1lCdklTT2kzUi9PWEZpYlJJ?=
 =?utf-8?B?L1JnUWVpTWJZNGo1TVUyTVdReE00MW4wQzExTFVRaVoyTXhtaGZpVC9WRkta?=
 =?utf-8?B?SFc3ZUIyMEEreTN3RG4rOXdhOFhOdE1hd0dDKzNXL1J4Z3k5ZzRHVTl6OE1t?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KQO5SUKNNG7KKMGOan/7ZJdhKeUPzTSZL/cYGP29ze41xT1qpWZaHUNwyLaNY297pk3jjBmxGbOA+EyjWXIrZb9+j8KoVeBlbed5RP5xWaxyKYRvUQZWd5/lfh4/vXHne+VhOsIGtR7NZzAwCXURNORo3lcRQmanfs8bzqwGw0byU7SSqMXPX77gaZnfupdZcUP2fdNvGKU5iEHz9ztfe2qd5qhI0bLPlHiEGZ4gQazUad8R7qCtLVOb9akq07yk73cw9rv34wKKL1IBJuL6Mz5XBxD57sD4SStt5dBzllc7TAoVFDuF5Tqbb1HeAfG/69zHBd4PxMq0UlFbmEADxIZippJPKISGYMxiQQrU+tCTqZO14p2tCMq/38pcj0jPWgIoX4/J5kIwOGL2oSBylMypckJDUsV2ZTqOFGzz6fvinfsZmY1F4sXkpmY0GVz8Gs9fQF++kXggGcQwKm4sO5RFpApFkxfZTRWJdo70L0h0z3ozmy7Hnm2y/tvekBI8tGX44D9b0A/99l1rcch3IZ3mFzAnA48gsPzo/TcER1HaHe/bPuriOk0NaKOhywYfLl5qykSAyzakm4oHmn9CzfysQFXNbYy9Rf9r2kfjyr2njak6oKxUGtx6OSXQypsZ2oXGBCgq5zkf5ZHdGXbs9jZG8dSFsQkE98EkY9fCybtDzaYk3mzevp46dJyAy0Unx+mOlrvw9bo79W/A6L/kgACVE2SHOXDXI3C7Zph2UTk2vzAdA8IDYDPUnGUuP12JplzJnoswrJAJ305IUHVIvPS/esMaWUpRwa5KKpm3bY5Lu/8ploTyQqxmV4l7+RUC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f6dceb-56a6-4e38-e9be-08db7cb0cae0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 17:04:56.6307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xeIEKImwyhqZjeQOsqeUKwk87+E4bzWfwi3VeHHo9PLQ+urguV8jfiVQsheUR123E3fkkSi5WP34OLkfJOJTAb03pDL8DCZ7V+/30Gyylo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5766

On 04/07/2023 3:29 pm, Jan Beulich wrote:
> On 30.06.2023 17:20, Andrew Cooper wrote:
>> It was previously noted that CALL/BUG is a weird combination, but there is
>> good reason to use this pattern.
>>
>> Introduce an explicit tailcall macro make it clearer in context.
>>
>> No functional change.
>>
>> Reported-by: Jan Beulich <JBeulich@suse.com>
> Did I? Must have been a long time back, as I don't think I remember us
> talking about this.

This was discussed on multiple patch reviews, where I was introducing
the pattern and you were complaining about the BUG and comment.  I can
drop the tag if you'd prefer.

>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks

~Andrew

