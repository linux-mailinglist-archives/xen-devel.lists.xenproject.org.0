Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E09B69E6B8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 19:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499141.770179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWxT-0007mW-FK; Tue, 21 Feb 2023 18:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499141.770179; Tue, 21 Feb 2023 18:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUWxT-0007ko-CV; Tue, 21 Feb 2023 18:01:43 +0000
Received: by outflank-mailman (input) for mailman id 499141;
 Tue, 21 Feb 2023 18:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUWxR-0007kU-BF
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 18:01:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d74dd0-b211-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 19:01:38 +0100 (CET)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 13:01:27 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7282.namprd03.prod.outlook.com (2603:10b6:806:302::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 18:01:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 18:01:25 +0000
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
X-Inumbo-ID: c8d74dd0-b211-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677002498;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1iEVppZakVn10DsySyvc6X2JVosMVkZovMLPCSw6KVA=;
  b=V2DKDqrFIoydjO3faXBWg8bGe9InA63Qit5oqrMrlIbakxuAKIxqfk+s
   /+tF2E97BOG4oiWV6OwHJiiiMjO4IHpYiq9nUq9I7YhBK0z8P4hqeR/q0
   nBzjGkxs4ZIUfaqMyApwJm/vd/+Qdx/W7mQZ+JqAEqjuusWUyGwvaQjGr
   E=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 96776293
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2qgdbaIQZDg5fXx7FE+R5pQlxSXFcZb7ZxGr2PjKsXjdYENS0zcGy
 zYbUGiAOfqPYjTwKtgnO4+z9E5XuZLTnYRgSgRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5aBloQy
 9tbIQo3fwmbgPnpwa+SDclF05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eew3ykBthDT9VU8NZHigOw/UwaNyRJRHyGjqm80HOya9ZAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpY9U8uMg7bTcjz
 FOOkpXiAjkHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRt3jX4iIQ6jxaKS8k5Fqew14fxAWuon
 27MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgXpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:aR3GT6rLFRUfa2Vm6/IJNkwaV5oUeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc7Qx6ZJhOo6HkBEDtewK/yXcx2/hzAV7AZmjbUQmTXeVfBOLZqlWKJ8S9zI5gPM
 xbAs9D4bPLfD5HZAXBjDVQ0exM/DBKys+VbC7loUtQcQ==
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="96776293"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qrg9HzcvCR5sYEz+cFn+WNtRdKm9xHhA4ejSet70FEC3350nJTu+JRYfigY2ozcc5ktbOYl346p9VwulFgBe4+UOv+9PNkzJkTxRDOXcZzAyCTfz1NO0Gtjb/5UsEQb2SYG8o0Rxe8gqKj8oOXusob5OblNmkEhmu6es2kEkgVO/Ri56awPSwljhcwdTBP8UC1nLZgGoH+8Pqc1SkUozZppukn6/j9k3n+1Z/uv0TWqoaRrFODK8WllhMIJ4CVjZncD2JL8SBgjN1HSQBIsVccfWWiGzm4FMfH5aFpAWCoj4UjQPW2NYnlr9aDY2zKZN/9lDlsKVMbGpSIzDY7kRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m58ciIlzrfjpoV2Px9JAXbSkrfk6mNVMkGqGPg4Tvec=;
 b=kSwjUMLAUbm/vKDcnOW0HrDXdVvGaHe1RjxMfZyXMvvObIAJSPTW/1OQNstkFRFoleLbIPkvlqM3rK0mLXfii3Npm7oRVjq8Ocx2lXV/4aKJVyebol6Wc8aesJDLIWe6IeHUXH9qPHlowxhJIc2yEGaegBQrBJ7ZOXeUsd+FA2v2/mVAo8XQtsRbGogp7zx2F5hXEosln4R4L/e7zggrfe2qIqYSkh0COfIaflFNNiIQPKgHN4xviudodOl/VdwzzfsJg3J941tpHw2S6lp8yU4U4Y2X75wv87QJwhT8lAV+3OFaW5os8k5Vg4jPjcXcXwifyVx3Vudb4KnWi4/2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m58ciIlzrfjpoV2Px9JAXbSkrfk6mNVMkGqGPg4Tvec=;
 b=m13iVHtzxmG3jB6xynkD5HbvFcaQYzwt4TbCEAxVscv7EmS6jfKq//m+6LI6FfAul1SIMFqIqAf6v4H6dSY38Ycco/8V3AG6FHYouVwngM0+0blp6TYFZNdujPfUhzdRZyeE9h8NCC+e4u1V+BB5OhxAceaOkrnbLdpW1tJ/MHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7ec61260-0fec-25e2-6fa7-ec1d86e8067d@citrix.com>
Date: Tue, 21 Feb 2023 18:01:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH v2 6/7] automation: Remove testing on Debian Jessie
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <20230221165542.7642-7-anthony.perard@citrix.com>
 <04e6ccb1-919f-671e-6d70-15a74e01bbb4@citrix.com>
In-Reply-To: <04e6ccb1-919f-671e-6d70-15a74e01bbb4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 3439bd40-2015-4c12-f602-08db1435a5a5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZPPCrTnA8zR+nRtSx1J3lQrINTf52gkPIzm9J9ZCDhIzmkY613c/lRa55GTWLYLxswK+bO28xoZnf8s+XcUzVgb7kkXjPC4GwWW26Lpu1KNqv+nOLqE8Y8xRByMfgl+Uh5Kp9fXJuKF0c0mvQ1K7GAXZiUSaCQP48LQjVHb8+K0bKTC6TKzaiTWxsDgewd/812v03XtcIk9lAnN/VZNDbdun0KO7e4C/w3l9Yx/w9qHuryBRCRFHf4Hrhenmxiyrfg17LXE8xIQwovzPrA/lktCKQGeV1Bl5tHj0YHs7TjjarPXtqC3lq9ITQhC3G+DNeZx+efRQi2qE+BlXChUkdzjr/EoBqvnlY60rB/OMIEE61L2JOn6nyzQ6sbdAkyAZeti0WGvMeXhjruXDAhe1qAXxGkLdLSXbT6u8GnPbC8J6LSMrTKqxqm9RGNsQx6EPvbCXP0VwisT6H+h2ttGkcxjDn1NMYrsw2pXYIhZRjJ+m0SWguv+a0IztYiclHdS88tEdEmaVjZ94Ho6VBBzNT+XHF+qoVyMm7x8xh+Qyar/nfzT8UKlh7mwFMPhwJuBWf/iMM9ahSAUP32aemR3tz79vimdJUgaEZyxdybGusra9t8+AqCXk8jyp5BVYsYDx8MrISQYEiT2K+47le/XFpusnADlDUaysrXcr1leohLnkAi404Ya9emmEtTKjXimaAy64eexg2Khedu3s4TYjQ3I0UZmjEM8lypP6BNRtQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199018)(41300700001)(31686004)(86362001)(38100700002)(5660300002)(8936002)(2906002)(82960400001)(4326008)(8676002)(66476007)(66556008)(66946007)(316002)(478600001)(36756003)(6486002)(54906003)(83380400001)(31696002)(6506007)(6512007)(26005)(53546011)(186003)(6666004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YklQcm1qa2c1R2ZqczYvOU1LbVp3YkxYaVRZNHBhR25Zblp1UGxtQjBPMFFS?=
 =?utf-8?B?ZjZNcENTOGs5MmlIcVhHN3RkeFpGUEhsWXNLVFdZNm9NcWhpUzZ1QTR4elVL?=
 =?utf-8?B?ZXErTWQ5L3B5dldQZHczV0d2MVlnZlhMRERmc1g2YlpJT2xFV1lDMUtzUlk1?=
 =?utf-8?B?ZGV5TVBoUVlQV1o4blpQaU9abk5jWTZ0eFRwYXN3WmcyTVdkV1VBS3FWUlUy?=
 =?utf-8?B?QkxJeHFDN1lQTWpwa1lCSWpJZFpSdXhzblFjL040ck91blQza3BlZHRQZHk5?=
 =?utf-8?B?bm5GSlZwQTVkeGhpdk9PMm9vR2pSb000T0g5YXBGNTVRa1FvL2d3U2xtMzNo?=
 =?utf-8?B?TCtJNXkweDlXMmVIa0FZUnZ5T0ZrUDZPd3d1T3BvQzZGYVlzb3c4SG5QS0JK?=
 =?utf-8?B?d2pJbFc4ZFlneTlaSGo5Q0lwdG5IOFJSZFE3SmN4cGhudjZLTzFYNlh4ZHBQ?=
 =?utf-8?B?VlYzeFVGeitGUjc1QUpWOHhTeGN5akgzVUR6bHZTTUdYN205Y3hRZ2lXd1NF?=
 =?utf-8?B?dk4vWFlzQUFRSU9Obmc0N0h3a1dwLzdGbG1aSXFhR1hhM2dkVWMvQnVQZ2d3?=
 =?utf-8?B?ek9YT3dMZTZyU3pXU29FVlNNMjlDMjJKZTNndzhJWVpqZlAxdWtFUFFKSHM5?=
 =?utf-8?B?NWpES3o5alVOTnNCZVdQSk9UNS9UVTczbTExYlVna1psRnFPTlB1VHdDcWJt?=
 =?utf-8?B?RlAzUzlKRXp3Zjg4V1ZpbFZCSlk5YlNtY0FEeGpoMHUxRHJsUThGRForb1FK?=
 =?utf-8?B?eXpSSGFDYXgwVXp2b1ZqN05ZbktjeWV5T28wQ3l0aWFzTSt5WVR3V0VQUlg5?=
 =?utf-8?B?RVg2bWV6NWRiQWVOL2cyTk13cmJIcTRtMG1BWHlVM2hJRmlyNCtDQlpUVlNR?=
 =?utf-8?B?bGYwbW52V3BKeDlqd1k5NGdxRnJnREVQTmp5Y1JKUytXMzlaVVpRREUxODgr?=
 =?utf-8?B?UWh1YS9uV3ZOVDFpRkE0M3NJMU1FSTVZeWtOcjd0T1VmS092U2lXcllTRHJ1?=
 =?utf-8?B?M1pZMUhXVDdJZFpSOXlhL0x6Y0R5cE51U3lkWUVyL2s0NWZmUVdPVFZvZllK?=
 =?utf-8?B?K3FzeVhVUWg0dllpUUpsOHlyeU5TZjRGdkpwS04vWlFXVnJ2M0xyS2lOYTZU?=
 =?utf-8?B?aGM3a0xscHN4dUUzYW5jeHBESEdvb1gya0QxZi92UzBhMnBCV1V0UDA1Rmhi?=
 =?utf-8?B?alA0eGQxVlFXc09ZV0FRdEd5RVlSSXpRajBta21qSzROaU10U2Q1SmtuSTVH?=
 =?utf-8?B?cmJjWkN2WnA2RDBMNTBNdmwwN092NVNIVkVRVjhkSXhlOWZmUzBhbmFCWnQ2?=
 =?utf-8?B?OCtRODlPZW9tNTA4ZGpwSENzRmJpTWo3NWs5WEc3SnpVUDY3RExxVnI1cm1P?=
 =?utf-8?B?OG1ZbHhjMzZhQ3BETDFJQk4xTVY4R084d0x5MGJCSFpRKzBZYThWeUd2bk9N?=
 =?utf-8?B?UkcyeXlWSkdldEt6STVLdXZWTy9ueUJibklGWjc1d1YyU1dGSkgwR3dLb2NJ?=
 =?utf-8?B?aisrVGhiV1J4cWlBSFpkMk1rM014cmovZnBCRkw3b0dLVzhsbUNFNlM4UWtN?=
 =?utf-8?B?MzRieEZ5M0Jkc212QXNML0hqYmRGeXp5QXEvSnRNdVc4eGxDRWhNWTNKMVdB?=
 =?utf-8?B?aERqNi8xaWVxWWpjVEZZdGVKeEhhazFnQnpGU2NiaWlwQkFrN3h4TkRsa041?=
 =?utf-8?B?T1ptSkg1WCtIb29EVzFqRGlDL2FKeFhqdjUyakZ5dXRZdmxUeDhkdmhFMmxS?=
 =?utf-8?B?OXB3RkdSN0p2WjVjWUwycXBxWHhkei9WVXlNT0Y5ajdON0svNmdFM1ZabVJ6?=
 =?utf-8?B?cW1RWUYzRk5tVWFDelpMOGQwcmdkZzg3dzVYV3JYOFlWVlpYQTRhdHc5T3o2?=
 =?utf-8?B?YlZlSzBEZUtTVXZwUldINDZwZ1dMT1o3RG5UWDVjbXNtWW1QT2htRGdpend2?=
 =?utf-8?B?dDBzdUpwZlZKNlU0bWNUUU1OQStOY3hDVklSeVhSeTdGUFpDMkJHcHpoWGlj?=
 =?utf-8?B?TTJFd3dPNE1IZnJhdVBCVnROeTVENFVWcEM5MmV1bmF4Yzl4REpxMW5EN2pY?=
 =?utf-8?B?OFAxZmJSa3Awd0ZOWXhqaTdybDlrZHlGRFNtUXhYUHl2emw0WDQ0dUZmbk41?=
 =?utf-8?B?UVZMR1ZqWWFVaVplVFhTWjd3dVduWTFXc3FnNmUxUEdUZlZBaXR4OFVycHZQ?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FGQOXAJ7Ml1ik8482yyGnIBjeesCT846kK9hl4wuDLeDv9z+eN2wETRl3m+kbQWZt7UJaw0XvqQPp5PDrEZrA4lv560vteIr/lZ53y+Ymc4I+9gTkRo/ueBjxPbSZ0NbddDMsKlU81ZHJu1LaYH3Kt1RHRK2l0eqPjAobEXMKVMKa9PpSJlsje6AhYqTKxpfRzK5b0mmUJMshJLBQ8CUEfOt3zADTjwfKD/SayTXILfcsUYCF6DIuk/uTQYhn/1LypoZkSNO/oXcmp3qERVCZqQjYdX92dkhquVW0JYi1Hqvs3pB6moJ5+91PutToqwP/EXQwOkJLac0pHJln7VB2+YLiAW2eMIm/Fo156yTK3c3gyTmIZbV6hiSwYllQ+CfqIqEt3xHGMFvAVvRgmCj0T0jlDHJc0H3SbHfiI3zU13AP/NEyNKMvKwbPvjadrqmRsBbvNaeQZv5Eu77EjVIUZLVV0G0H4bLCGE/GQNFTqxtOEtk1n83x1T1K+p8DW1+5ohCS5n5mmBZO+QKCWAxoavDSJcqpndsvh3i4bwchHLTegesGjX3MREWUb50Oz+4SWKRuflFyjeaKGGN5BSw+JlDLx25GMWRW8nVGaUJD+/+xZovbWujAFCF8H8VvpYF1Va1IfdSJroO2FPW6cEABLuFItAjHH+F7JVKg3iqCnHBSCFDO5oLkbIDnc/n8RfV81XpZvFKyWRsK3hXnGBEP4i/nLJkz/9YHdqdWFetCTve0pjTx7Z/sb7ZmRtDXvaxi25HjLMl7q0HTo0RDmdFxKqzJQBfFEP/fX5Qf/IFZrItEPIhTcKvehlOLKRHS8rZwmMi7KVyeFB1JKDPxHeA1w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3439bd40-2015-4c12-f602-08db1435a5a5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 18:01:25.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o5BIEbGSQIBL07wkpMjQ2NlGByjL2sUeIESDiY6Gt7c0SpmQXSW6FGrBR0gQh52ApNedcQG3vAewNuPRV+3TAguBxgK7YXoUEbEOnFQIWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7282

On 21/02/2023 5:59 pm, Andrew Cooper wrote:
> On 21/02/2023 4:55 pm, Anthony PERARD wrote:
>> Jessie as rearch EOL in 2020.
>>
>> Even if we update the containers, we would still not be able to reach
>> HTTPS webside with Let's Encrypt certificates and thus would need more
>> change to the container.
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> How is this interact with the other patches in the series?
>
> I presume we do want to take patch 4 and rebuild the containers, for the
> older branches.  And that's fine.
>
> And IMO we should be dropping jessie testing, so this is almost fine for
> staging.
>
> Except, jessie-32 is the only x86-32 build test we've got, so I think we
> want to replace it with a newer container before dropping the jessie*.

Further to this, I really don't think we need to have a 4-wide matrix of
{clang,gcc}{debug,release} for just a 32bit tools userspace.  Debug
clang+gcc will do, and save on some testing cycles.

~Andrew

>
>> ---
>> Notes:
>>     HTTPS would fail unless we commit "automation: Remove expired root
>>     certificates used to be used by let's encrypt", that is. Patch still in
>>     the series, and fix Jessie.
> If we're dropping the jessie containers, do we really need that change
> too?  Because we really shouldn't be playing around with URLs on older
> branches.
>
> ~Andrew


