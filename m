Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1417B64B9D5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460895.718933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58Ci-0000aX-He; Tue, 13 Dec 2022 16:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460895.718933; Tue, 13 Dec 2022 16:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58Ci-0000Wn-EZ; Tue, 13 Dec 2022 16:32:28 +0000
Received: by outflank-mailman (input) for mailman id 460895;
 Tue, 13 Dec 2022 16:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeL=4L=citrix.com=prvs=339e21e18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p58Cg-0008Sb-B5
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:32:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b96f8bb1-7b03-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 17:32:24 +0100 (CET)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Dec 2022 11:32:22 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO3PR03MB6791.namprd03.prod.outlook.com (2603:10b6:303:175::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:32:20 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:32:20 +0000
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
X-Inumbo-ID: b96f8bb1-7b03-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670949145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kFQ6UCqPmnuqJ9WmouCTU+CbLPqWzGus9jI8R/AS+bQ=;
  b=BZieA+n6C1yUvjA0EhDgYFK+haU9ve24Dy846lEmJWKnhHmdnYw9ZQra
   jrAh6ObNlvJABjN72fboxy5yV1rDKkwIXl9/6xSADsuD8EVypG8HpgPiB
   bbJt19Ln2sWrAKx9wRk1y+GnZ2rSiSN/tLxamPz6hQw004ePksFSPKAp6
   c=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 88160297
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GDoIMqn/uYSQJvTWtQFFIk/o5gxUJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWmDTMvjbZWSkKYt2O4ng/BkFu8CGndJgT1Nr+H0xEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5QSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c06KBQObk3TvsuRmYOHEMJBguAkPvC+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3ieewWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzXOiBtpIReLQGvhC2WS8nVE5NjgqbwHk+cOAjUyvcIxhA
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN47sokwTD8j1
 F6MlvvoAyBitPueTnf13rSZszK0fzQUJGkqZCkYQA9D6N7myKkxhB/SStdoEIauk8b4Xzr3x
 liisywWl7gVy8kR2M2GEUvvhjutot3FS1Az7wCOB2a9tFomOciiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:rYUF2aqRXin5aHoiD/eFFXkaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.96,241,1665460800"; 
   d="scan'208";a="88160297"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fG1VzlQN9LwuLlw9M/WlTSdHPF59H9BQAmJW4cYH/qIrLTqvzgISFyINU+bO54JSdHb1NVpbzl4THRaUDP4SDfTovWkT8DcAqQgNs2eNi/8gz5JqvV3ZiYeOh6iABplaZesHJgFeHZ3CkGmtkXdgcNGvrR/UBjxGB69/vqDSuZIBDG71vuGfNYRHBlHaGf4+yKByGPEUd69FTb1rwTtAaN8nA7NQ+pq66PYqElg1A2aHC+6DOeU0iJc5Y2JfOr9aK6PSgrxeshwII1C5paCKG3Lp0u6QpREuWvBqg+WebpxCdrlgX30TdDRZWXfPFHNTOu2RzmhoZV4TEEdmUDEX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pOZwwS0tJfftDQXUS/cr3DkGL4CfPBmraxxIz5hRpk=;
 b=H38MuZJZXVRER+a2MqtY1nW5mXJewGGgAQuVJHVbdNfxcGGevBY7CYPHI2/GjfiXePlFAtKEDQFDqEnsmVMjgi7LnsUV/VX2C8KMj01uAgmK5T2byJbbQssEQ7AYfCP/te+0LlwOAOxSI1fL0kTsP/6k+MuwnengQ10j0ag8nYrtB2d22NY0qQjl8QopCnxXEenEgIIkbQT6myQKS/JDgBJ2Cm0lSxd1iDLt2HsdveWvMC0206DRd6ai+6vVNVc5Lr0g+sgzUelRrbe50+XfUPDMypPaeONG8Tv8Ak7i9bcoTzrIGH6qYOTgigtq53eKWFxApcxiP5uKECAo4vSP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pOZwwS0tJfftDQXUS/cr3DkGL4CfPBmraxxIz5hRpk=;
 b=NncEd5VGMjgmAM5DBqh19h402gVwBTwB17LIUyXdvy/68XioqHweex/QYWJPowRQILkoIk2Asw89JPE6EyLEA2CaT7OkTjknw6ye6MZCieaVGrvgA+q2CYwZKZd+YeyBs1BY1PP4169aHQ3p+eQATTW6aRmBSMehwyfIYSuNhls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/3] x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
Date: Tue, 13 Dec 2022 17:31:03 +0100
Message-Id: <20221213163104.19066-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213163104.19066-1-roger.pau@citrix.com>
References: <20221213163104.19066-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO3PR03MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe188e2-06ed-478d-a611-08dadd279af2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LeSFaoEnyywJ1vmy26yWSm1EnGtuokBua718gL6RRYoi55Yby7yezxlSJdT8ng+Bw/tEj6dUm4mcvPGIYde42xPa9C2NWvK+Y411F7bo5pomv/NthOuiQ0LWtBPgEv0LBDuh3Mz7cuyMMKIOlFn00RByxoDsNmw3T0z/I8BznAYEkbdMO978i92qqVZiJu5go+STyYdAHkgH2CEbZ2XAtvCfKzqZBvucDGDJNHlqcnaOY3jafw5A+R9qOJ44RysLVc8Tllgb3gC2aEpFEce9M7/zO46fFCBSjL5ZbjkqDtywjMvlZlFj0HdFnqv6ieHwyhyUKvbhYoU+KAtRCR4ze+WEFPBob9W8jAljXDlM3J+TeY7TFL1ITHI+E8kEkGL2maH8JLNbFO0T9y+wXzJvEhPKgvRTKSMDlIVUJL8Wa8j+zlFkpxKxrCezYDcp/eO38+Y6mWGZrgV+fxJQjat9mJLpubzF8bLTAQliMiwfyKUW9Hhg1dMl6UOHjlVJWDH7cv72JEmkRSnd3ITKXrf1r+Nj/LFn7raTAaBLV4JNTzfdXIXo1MHE53Yj6UM+Ohp3n9YkJGWxamx5jSO7Fzmw5nD6LzHaHFFSjljjnQyTKZshlG0BJISc1gb2gNQ86XlBBNhd8JUOZifGIQ/k+IyzUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(38100700002)(82960400001)(5660300002)(86362001)(478600001)(2906002)(6486002)(41300700001)(6666004)(83380400001)(66946007)(6916009)(6506007)(66476007)(316002)(8936002)(4326008)(54906003)(186003)(6512007)(26005)(1076003)(8676002)(66556008)(2616005)(66899015)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUs0bUdnZENkdnlXbDJhNk1IK0lmMnJVMWdGNVdkVHoycG9SMHBBelZpMVJD?=
 =?utf-8?B?OTkvQjhkdmxqbUMwS2VSeU1PcjNwdkxzUnRaV0hqRi9JZDZBRExvZUQyNFMr?=
 =?utf-8?B?UkdXb0t6ZXQwcnJRamlDT003bnlYdlU0RkZaemNEdWt1eEgyMjZpTlpDeHFR?=
 =?utf-8?B?YkNlb3VpdUZZRkJKckpJNEVkdHEwK0d6ZFdHT0xvRktDUXZhK0cxNnJwTnNJ?=
 =?utf-8?B?NjFmZDR5a1JybG9RaVJ4QkdibHRVeWc2UGFiNFUvZzRKTlRxaXVZNERLenho?=
 =?utf-8?B?cy9SVWYwaVR1eUk5VERJanpXMG12S2djcGZPNFpqQTFQOExqVzVIUy9MWlpQ?=
 =?utf-8?B?bG0rSktPdjllcEExbEsrQUI1Q0tRam9VRXY0emw2T3FkL3NhTDZZRnVwMkZh?=
 =?utf-8?B?cnFPeW9pSzh0L0dzVTVIM0s5ZnM3QzNhTlgrWU83RXNkRXNxQkd4eUpEOGFn?=
 =?utf-8?B?bnhieXpsZ25ZK05DUEpBNXdXNnFGY2Q4anNUcjgyb2ZOdkFxSjBkdzU1RTVK?=
 =?utf-8?B?RCtRU0JjM01HWGpmbDYyWHJmNVYxb2JDdXBiZEFMaFpQTHZSUEw4eWNIZllY?=
 =?utf-8?B?SnlPMUFmdFhwOXBCYkpzQXBhWlhtb1RtMGk4TWFCWVZqdFhqU1BlS1gwWlVu?=
 =?utf-8?B?TURETXYxaE92NWgrT3p6SFRRc2s4Q1V5S1lvNDZtdUQxVzVZSUw3S1dnVDBX?=
 =?utf-8?B?OEt6L0c5MjFKaUNHdE9wTDlacWE5THc2WlNvdk1VSm5CeGVSTXFncFlESDhK?=
 =?utf-8?B?K3ZHYVVMa1NQS2ZNdnhZcGNsV3R2RTFibmJNMHExMCt6RVMzYlRUaHZNVFg3?=
 =?utf-8?B?MkxTRGRqVlFPUXBDMkUrNW5SL0pUOUloZWVKUVBPdWxXLzVHZkJ1NGFwSEdW?=
 =?utf-8?B?cktZYVNtcGZBTDh2eWlZMzNwM2JxZDBoTkphS0tTTTNWL3JiUXRuYnI2YmpZ?=
 =?utf-8?B?VFNPV2UydXlaL2JNSkZrOW45NzRhM0V1MmZoQWkvZmxITGNUeGJucWlicnlx?=
 =?utf-8?B?N1I2cWNZNEsrSDFRY2ZYN2RVZmhnZ2p4SGQyb1QyT29aM1hMd0F1TlVFdytK?=
 =?utf-8?B?Zkk4U0d4STZIeE9PcUZYQnc4eXpKU0dmVkNhSGhCQUdyeUg1WTUrSFpjYS8z?=
 =?utf-8?B?NHUxaHN4UDNXOUFFUW40eThMR0pZNW55ZFZJWGc2OEpObmhvcENqR0QxRE9D?=
 =?utf-8?B?OUJHN1RPL2JjVUdHbGVNTTZ1cVBRcXpNVzY5cngwSmYxeVhoYldveWVHOWpQ?=
 =?utf-8?B?bFJwVE5XWWdSWlJUamNNSjFCaU5ES3dkWGFxUkdkRUlaOUs5K2cwNExZejFO?=
 =?utf-8?B?Y3lUeldFMTlFVmVXTVQ3ZEF2bHVDeEE1OENJYjlhbmJNYWwybDJJMHlIS2tE?=
 =?utf-8?B?ZStwMkJEUTlGVkpLSzFvTVdpSmNxbkJCZGFZb3JhYk1SbGl4MXp1OG9lUnJr?=
 =?utf-8?B?bVhPdzExeXVqcEU3THNsYUxHVElyY1JqT3JRbWFzeUg5azY5b2l0cHVzcDdw?=
 =?utf-8?B?SXhFTFJKYnFlSFh4RWhlVWgxOGpYMnFsTlVyMmZZamw1K2tQNTNIU1lTL3dK?=
 =?utf-8?B?YXMvUEx5emZqSHBMSnBFYmUxOVM4cnd3SWtCWEllVTlHQVZtdE5pd0s2OEVM?=
 =?utf-8?B?YmswaVNMR3lwRERJdXdPN1VKSHNUQ1hPaDlCaDRHdTNFczVpeGtLRTlybHRK?=
 =?utf-8?B?WmtKaEc4VUtqazBuZG82bjYyMGs0WlowZ2xGYkEvdmx6TW5ZZWJwUExISzVB?=
 =?utf-8?B?aHQvNjNZQVI2L0xzWG13MnJHYllHRHFLa2tEeDlBeUxUaVEvQ0xvYWpiaVAy?=
 =?utf-8?B?OUJQeFpvdDJlMW15K1ZxNTNTUmxFZnZiekhERThUOFEveTM2YzNYRm9WektH?=
 =?utf-8?B?N3k3M3plbGE2ejIxL0tabGc5RWhTSVE3NUh3bXFlQngvK3RsRHk2MmZOWXJo?=
 =?utf-8?B?MjgvQkZmbzhySWIrV1d2WjVYK0ZUYjJiRlB5aTJJNU1vRWRwOXlqZ3RUZDhm?=
 =?utf-8?B?Sndaall4b2VoWlhaQTNOSzJYbkROdG9NbXJSMEk1clZZblJWRGFpcHhzYVZN?=
 =?utf-8?B?U2x3V3ZvZXlqT1cxVmFrcEVDd2ZtRzJrVFhNWGFSdTh0VThXUDB6a0V1T0F0?=
 =?utf-8?B?dEJ4end4WnpvRGpZYldOZnNmbldWSnBocDcyNjNKVE9sRy93UHJhQVFwS295?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe188e2-06ed-478d-a611-08dadd279af2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 16:32:20.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beDoLpPcgWhu9OR4AMudKyoebG8FVtmmT98Dz7W4vI785c80WBgImFTtQr7X9amGKBFNzl/QK5mK5ZYWCTNhnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6791

Introduce a small helper to OR VMX_INTR_SHADOW_NMI in
GUEST_INTERRUPTIBILITY_INFO in order to help dealing with the NMI
unblocked by IRET case.  Replace the existing usage in handling
EXIT_REASON_EXCEPTION_NMI and also add such handling to EPT violations
and page-modification log-full events.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Expand comment.
---
 xen/arch/x86/hvm/vmx/vmx.c             | 28 +++++++++++++++++++-------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  3 +++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3898f92f85..dabf4a3552 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3964,6 +3964,15 @@ static int vmx_handle_apic_write(void)
     return vlapic_apicv_write(current, exit_qualification & 0xfff);
 }
 
+static void undo_nmis_unblocked_by_iret(void)
+{
+    unsigned long guest_info;
+
+    __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
+    __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
+              guest_info | VMX_INTR_SHADOW_NMI);
+}
+
 void vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
     unsigned long exit_qualification, exit_reason, idtv_info, intr_info = 0;
@@ -4164,13 +4173,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         if ( unlikely(intr_info & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
              !(idtv_info & INTR_INFO_VALID_MASK) &&
              (vector != TRAP_double_fault) )
-        {
-            unsigned long guest_info;
-
-            __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
-            __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
-                      guest_info | VMX_INTR_SHADOW_NMI);
-        }
+            undo_nmis_unblocked_by_iret();
 
         perfc_incra(cause_vector, vector);
 
@@ -4536,6 +4539,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
         __vmread(GUEST_PHYSICAL_ADDRESS, &gpa);
         __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
+             !(idtv_info & INTR_INFO_VALID_MASK) )
+            undo_nmis_unblocked_by_iret();
+
         ept_handle_violation(exit_qualification, gpa);
         break;
     }
@@ -4580,6 +4588,12 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_PML_FULL:
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) &&
+             !(idtv_info & INTR_INFO_VALID_MASK) )
+            undo_nmis_unblocked_by_iret();
+
         vmx_vcpu_flush_pml_buffer(v);
         break;
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 03995701a1..eae39365aa 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -225,6 +225,9 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 
 /*
  * Interruption-information format
+ *
+ * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
+ * field for EPT violations, PML full and SPP-related event vmexits.
  */
 #define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
 #define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
-- 
2.39.0


