Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D036F672F
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 10:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529630.824217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUEy-0004hF-Nk; Thu, 04 May 2023 08:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529630.824217; Thu, 04 May 2023 08:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUEy-0004eu-KF; Thu, 04 May 2023 08:23:04 +0000
Received: by outflank-mailman (input) for mailman id 529630;
 Thu, 04 May 2023 08:23:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x2gh=AZ=citrix.com=prvs=481e65374=roger.pau@srs-se1.protection.inumbo.net>)
 id 1puUEx-0004el-0y
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 08:23:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1b0bf3a-ea54-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 10:23:01 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 04:22:59 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5648.namprd03.prod.outlook.com (2603:10b6:a03:288::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 08:22:57 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 08:22:57 +0000
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
X-Inumbo-ID: e1b0bf3a-ea54-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683188581;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=29Hbv4zczTPm7mmZsDXiWwpgGywep53NlU2KoFia+Ks=;
  b=XrJzlUvCo6vvUIUJoLsrSsAWQ2H9SpUE1uKe5tXz8iJoYFNN34K6t/RR
   2/VSH7RQgNSf5FIE+1+V+cAIX0Y79TZv9CHVf7mfM9aJmU2VSv6cf2+Zp
   Y5MgnAA016zTwKdenjs9tJJbS7hoZCSzSmpwqHerADbmp8P62LmkHWbz+
   Q=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 106585431
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6dUlkK/r8W4Wagp5riJCDrUDpn+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mEbCj+Oa6uPa2Omf90lbYu1/BgF65PTz9M2T1Bpqi48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklw+
 94KJSEoZyq4isCn64n8YOlCppoKeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpjNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXw36rBd5JTdVU8NZxuFmul0MdOicPC1qqhuCSgF+YRulQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBQQ5b5dDm+dk3lkiWFoolF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:6rr6Jqnatn9OM+lMf8vqPmuC1QvpDfIW3DAbv31ZSRFFG/Fw8P
 rDoB1773DJYVMqM03I9urvBEDtexLhHPxOkOos1MaZPDUO0VHAROsO0WKI+UyDJ8SRzJ876Y
 5QN4R4Fd3sHRxboK/BkW+F+g8bsby6GXaT9IPj80s=
X-Talos-CUID: 9a23:xSSJzGAwslYYNi76Exdp1lwZC+UsSEbQ7mb7GAiSCUhJFpTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AYgLQ2Q8pptk3vgv21uLeMoaQf9xQ55n/J04/q4x?=
 =?us-ascii?q?YutijLAd6KhGAtzviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="106585431"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLK373GUcwahTfMmf8XAGl/Chmc8ERWlGZKXxUorWPyXaMdFA5Rx3eNptNvB1h9GXBYcytJXjSDCyLSLX4iISARWSLI9PL+Nxs47XindI7ulaJgKIHNyZRfwdrv0KmTKDQUSd0MWUQ3J/4cgqP7TPr7UmgB0Uwmb0XiOAxtL0SP9vU7fihfWoOk3DvCV4yCWhDBBWog14+QvCsMBIXM0CDSb2VTAdr6Cy7yw1NdSKijUq8ujQ8Zu52GMQAA2WmhaGzMYjlmnesEUwUq6Ys/LIMSG2fHstkluodKEgB6zKMDIjqVFoYU7ykbxxDPDiiznit0HeRt/fhoNoWdlo2ZL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbwPc94iyHwUkqQgtzgz/Y6XXp7gSahAMvglzZG4bls=;
 b=YYFL0bvnQMYA/gCvQiDKB7myLKs2SIqcJIztkU6pOH+lXr/dqTZ22iz7FuTpwZumhY45XirT66qomCgBb0Mua90cWdItmTpkxoJIO1cl73/e9JCzUNxB/PtRb4JHArBUgO9RCI231hn9psQ50Z62MRu8hD8kkN4XTh7XBBTd1d2eOq5NJLkrAwgN1HdbPRCE6oV9vWVl0V1Hx6UmS/qvgFAMki/2O/XI7s9yve1cq6kbhUQs1soLCmGGmoO8NrYKPxkOzhQKHQDSw5ymNeWKO65p197rczE6f32GQEGknWQAl28zlu//cbWOw3Y8chKcuQV+Is9ukES0Rp6IVtvzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbwPc94iyHwUkqQgtzgz/Y6XXp7gSahAMvglzZG4bls=;
 b=QzcZfixCFnfr+RoJCK5gMRlS3sQTqIahoRn5/gCM8xs4nJbf78xGV2kyQfa01mpvZgNK7ie5YBvrostieVdldUTRTPmC5rASpdxgvMhj1ezOz4++B1OMIevUPEl+YJCtyYAIIHz6FVAtkZYn/aPRS0p0Dv34YzLZaDE9gq4oFsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 4 May 2023 10:22:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/ucode: Refresh raw CPU policy after microcode load
Message-ID: <ZFNrW5a/aY7a3KTs@Air-de-Roger>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
 <ccf68f0f-6fd7-a9a4-ef72-03999d11035a@suse.com>
 <b655305f-293e-a0dc-ab39-36b0c9787433@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b655305f-293e-a0dc-ab39-36b0c9787433@citrix.com>
X-ClientProxiedBy: LO6P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb543bc-21ef-4fc9-0d87-08db4c78c439
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xoiLXjy6P22MRQka85m4N4n3qTK0mpjyxch2PkmakTJF0xDNC1YuIscRAa7/SGbReZVKKis65RlsS8LlsTcUsTTQkxBkVmIpxAMDI69LFar19YYslQfnkmjAnSOkWE8QHY4i0hm/pJc3/QUuA7+l4MyNHJx5iSjgiQKDjaKDXeuzZGGLtTC2C7Q7qacBUYPwoJUuHTlo4LPnV6mxhG+EnfTn8dFcPfafi546PJa5ZOK7X809nRf5j7WbMFy4x7O5tALV8OpUbOrpKuLd/ta5YrnjRFlGtwNeZjgUUUapqHKrzT4MScLPF2lVTV4dFQc3BJVZ7jRAxswkd7Oet0CpFjOKnGMEfqLBI2DsjKI7PtlHY0pQ5ZnIdLc9pgLftJcnt52jb4HrnuV2p1CJdqD1f9bDT33GJDQsU+twn60deduFFk+43VgTbsG4ltn2QC27gBsT/qj0+Bi2YJcZTsfxFhsuRQfT9proW0w4EtS0aKWgrm7MtBUZyh2O4e476xIVzVsWMjcaBy0G0gVdaoy7EJ5CeVl5MKZtpSnyXIHiV3HWmAqtO5yfY5Hqt/RfzZW4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(66899021)(33716001)(8936002)(26005)(8676002)(9686003)(6512007)(6506007)(6862004)(53546011)(2906002)(83380400001)(478600001)(186003)(4326008)(6666004)(85182001)(6486002)(6636002)(41300700001)(5660300002)(316002)(66946007)(66556008)(66476007)(54906003)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1NmSFFhQ2JUKzRqcENaVWJIdUFtTTJTUVhscTFCZjNRcFBjeEJvZ1kzM095?=
 =?utf-8?B?a3ZXSlQ4QXg4TitKaXZQT0c0MjlaUVRpdmpwQUdPY3AvWFdtSktvdHRqY2da?=
 =?utf-8?B?SHdFMmFkS2Zlb3hSdXNNT3dpMnYxbmhpYVZNVnh3Q0JxemJsdTVHNTB3WHpD?=
 =?utf-8?B?OFhBTzhYWWhtQnBoTDFCeUN2cGFBTDNMWHdmeFpZZkViaXpnMW9sNk9veVRG?=
 =?utf-8?B?YVR0SnZhdVA3dERNRTNZQXdxa0c1NHFGZDJvbnd1Z3dMVmk1YXFRdVpxeXFj?=
 =?utf-8?B?NjM0dzVVTVJSSy9Lc1JXZ09FRmlqaHhSMjZnK1R0S0tVVVB1WnZOL1VpQ2lC?=
 =?utf-8?B?NngvVEtubHp6Y015SllMejJ2TnBzYmY5dXNKR3dzY1BxSWpPZmh5U1JyeFRI?=
 =?utf-8?B?ZVIwbXFKc2krQTU1YnpwUXJvNnFSeGVUQ3JCQ0ZGNXhHaGp6ZXcwUHlTUjJt?=
 =?utf-8?B?TWRQNkVzcXZhS2FPRzhOa0VMcGx4ajBTSU9UWERGY2xGMmtSNXJmRXlucXBC?=
 =?utf-8?B?eS9kdXBoTWYzY0Q5SkRuTW1rcGZ1QVUxVmtveUc2dHh6SThYa3NtYWRsVnM0?=
 =?utf-8?B?UEVZUTc3TTdnbFY0M3JYWmZJU05DSVpSVzJKanliSFY1aDl4bmZVNitqSWFl?=
 =?utf-8?B?VGdIa2FEaThkYjdoekpwaWFwWEZrd2JNdlFXVzA2V0pOcmVKYUY0SlgvM3J6?=
 =?utf-8?B?LzBTNTdXMStIWS8wOGNvZnVvei9iOGtkQUpXL0d2TlhRVjhxWWVWTEdKSXk1?=
 =?utf-8?B?L3d0TW9JOHRqYm4rOFFkMzFMcFBsemRLS3dFK0tyd2NhSFB1K2sxWFkrUlRh?=
 =?utf-8?B?U1gxK1NCUGJ2UDcwZE05OWFQVU14NnlFQ2t5RGlrbUE1RTVKMW9UUmFZVlh1?=
 =?utf-8?B?ZzRHUVhSaHVQcXF1ZlJJVWhsV3dpUTFMMFBGdzl4WWMyRElwb0d4RXM3NkRE?=
 =?utf-8?B?dm5tUGUraEVLVHhybU9pR3V5NjFJYUVJTUR2WDYxd0hDSG1jcDJpRTE0ellt?=
 =?utf-8?B?enVIRUtPTFFTRHl3SjlXNWpJQXBDMCtOR244ZURoK3RYUjRpSk5kS0pJTDly?=
 =?utf-8?B?Y3Z5R0dOWkdhaUZGR1puL01XVFJiQUJkRnVLdTVuNUFDVm9VTGU2c1hzdmNG?=
 =?utf-8?B?V2t3eXA4ZTVQNVhCQ1ZsNmNRdG1hTmsrN0JXV0tjbTlvWXNveVRLeXQ5aUFG?=
 =?utf-8?B?WXUxZTRiSERmLy9NOWIvZ1V1SG50eVR4aFpmYUM3UUhxWFJwaDZqTW5TSHhs?=
 =?utf-8?B?aWVsZ2FmN0lPQ3o0U0xoUktSN1BmaTc0RUFNT0hWRytJOWIrWEdmMFZyT3Nx?=
 =?utf-8?B?YnFnZDBQME02TkNpQlExS3hEaGlZUnlJQUsrTHRwQ2JLMnk1c1NjSzZHRDlQ?=
 =?utf-8?B?eWJKTzlaWHRkM1Erdy9iNG42WGZFUFMwM3REaWZlY0t4eGMrc0tmR2dwNUJJ?=
 =?utf-8?B?dGtpQ0lBdjRLdCtxUVQxUEhCZjNVNG5SSWZQU2pUNk81R3NhWkg3d3U4UEVB?=
 =?utf-8?B?cjdjb0dWMGhRWGVIZlNEeXB3a0xuZ1dERGNxMzZGZW0wOFhoK1pLUitydXlM?=
 =?utf-8?B?UnVmL3BwNjhYZGNUVndqMWhBRnN0WW5lWk4ycVRpdmJ2TlBHMEkvb0dGS21J?=
 =?utf-8?B?VkxBbWpjbnU5b0Y1Z1NtK1EycUZIdlpLRUFOa2lBaUNwU1JuT2dJV1VNa0Zt?=
 =?utf-8?B?ZmROZm55REpvc0grNm85QitmdlVlZm00cWdHMFRSL3JuYjBqUmxPOFJjRHJ6?=
 =?utf-8?B?VHFqWkp6djRUYW1yOTM0aDh6bU0zbWVrNXViZytobjFrMjg4UGF0NWpBZTAw?=
 =?utf-8?B?c1Z5Q2hObGJWWUFFNWtPWHJkNXlVbTRYOGNtQS8yNitYTTJZSjZpTnRoY3hs?=
 =?utf-8?B?NWtNUkNjNk1QUzUxamRGeGN4bERpQ1hZUmxJR1NWdUp4UXdvSEM2angzSy9s?=
 =?utf-8?B?dWpvT0pyT2NYeVN1RGlPQnNldk1obzRUOS9LK0o5cFA5MzBkVlN1anZKQ2xO?=
 =?utf-8?B?eWpXZncvOWtpNzJXYlVvMTdNRWt1blQxTmdSam5WbFhCUkV1M3Z5dW1ZcVhS?=
 =?utf-8?B?NzQxQnYrVzZ6NzZnRGRXZ1p6TXFwVjQrK01seWw1eXR1MUdsUGd4K0FFci9X?=
 =?utf-8?Q?7cgHu1TSS6pbN8Rmhv1I6aqvZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ATQJZC+NXqsUJTIB/C93uEsActuBsUDUI1H9PtsN43fczgFz9LN2mYkuMECjsCK+ntQu99Bg2mgZqjj6ZzmfXv6ZMN0HgW3/uB7hGrvnTugY/ljwfvg/EzpzLF9kAT6ufUigxFjs2ROi+LQZrq/7K8MZlnRsJsWujd9TcWWe1AsTNlZuHtsybrgZSxbLzyHKUkJkHTFCkTPiqfrgxHe3POV+uqEppxPL3Pv2CqHBWiGaBo2KSnKwZ93bgHp3IYsfVxMN902tfmuEjak1kq2DfWu6GP2pBW97NG+msxTz73khSYT07N3c1C5qSyS48j4298qA0u8dXivlyb9AuCKW37ezDBi28zVk+8/XXXj1Z9mKxLQRkk9aL6FRPO1ViBVywc4un03fNjWcCWqPNLypYIicAHlQ/hzx5njUZqK3JFpYs8I32wXVh+k99QgAae54jAvVuLEDSs+3z0aDUk0ngmyJHQGcBHlQ15nEKqJIJ5XJVrMKeGQo15zCK2ROTWBRDIc3v4y2iLYnm7GFqsxzvTxNExJJ+jiDB8zo5Hmz+RVtIAUIXcDKCMkYgP6VGU8Tp7rqGR0ffk8jjSuJNYzsOKxozf/ToB7fOquhryh29xo9kpJx117tmqS3ppvmUAQQFitFdfe+3zUtePuzrBAlSYy6HfuoByqtF/nseMOp/84/hRDw7fFjXVzd8JVkgd8qzG2dpx00TU9RJthIzpgQV4Jm5pDLZKEomdRrSDRtrM97nljFmrMTcGDKXK4S8+9URZ36q5LkkvGCUMLM/yFwN9XDpKrD5d5RlmBHKnqEs41BGS0w9NXnmhfz9ORPVaZI
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb543bc-21ef-4fc9-0d87-08db4c78c439
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:22:57.6547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zft3jmgwPQVZUK+nupfBR18LSv2muX4ZRF6JLqM1wXg1t6es59eUvXPkk3m2JLIMq/pc7XiK29miM/OBqMLinw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648

On Thu, May 04, 2023 at 09:08:02AM +0100, Andrew Cooper wrote:
> On 04/05/2023 8:08 am, Jan Beulich wrote:
> > On 03.05.2023 20:58, Andrew Cooper wrote:
> >> Loading microcode can cause new features to appear.
> > Or disappear (LWP)? While I don't think we want to panic() in this
> > case (we do on the S3 resume path when recheck_cpu_features() fails
> > on the BSP), it would seem to me that we want to go a step further
> > than you do and at least warn when a feature went amiss. Or is that
> > too much of a scope-creeping request right here?
> 
> You're correct that I ought to discuss the disappear case.  But like
> livepatching, it's firmly in the realm of "the end user takes
> responsibility for trying this in their test system before running it in
> production".
> 
> For LWP specifically, we ought to explicitly permit its disappearance in
> recheck_cpu_features(), because this specific example is known to exist,
> and known safe as Xen never used or virtualised LWP functionality. 
> Crashing on S3

Printing disappearing features might be a nice bonus, but could be
done from the tool that loads the microcode itself, no need to do such
work in the hypervisor IMO.

> >
> >> @@ -677,6 +678,9 @@ static long cf_check microcode_update_helper(void *data)
> >>          spin_lock(&microcode_mutex);
> >>          microcode_update_cache(patch);
> >>          spin_unlock(&microcode_mutex);
> >> +
> >> +        /* Refresh the raw CPU policy, in case the features have changed. */
> >> +        calculate_raw_cpu_policy();
> > I understand this is in line with what we do during boot, but there
> > and here I wonder whether this wouldn't better deal with possible
> > asymmetries (e.g. in case ucode loading failed on one of the CPUs),
> > along the lines of what we do near the end of identify_cpu() for
> > APs. (Unlike the question higher up, this is definitely only a
> > remark here, not something I'd consider dealing with right in this
> > change.)
> 
> Asymmetry is an increasingly theoretical problem.  Yeah, it exists in
> principle, but Xen has no way of letting you explicitly get into that
> situation.
> 
> This too falls firmly into the "end user takes responsibility for
> testing it properly first" category.
> 
> We have explicit symmetric assumptions/requirements elsewhere (e.g. for
> a single system, there's 1 correct ucode blob).
> 
> We can acknowledge that asymmetry exists, but there is basically nothing
> Xen can do about it other than highlight that something is very wrong on
> the system.  Odds are that a system which gets into such a state won't
> survive much longer.

Would it make sense to only update the CPU policy if updated ==
nr_cores?

Thanks, Roger.

