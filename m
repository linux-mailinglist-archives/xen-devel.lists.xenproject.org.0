Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4777241B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578335.905783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzOw-00027p-Ln; Mon, 07 Aug 2023 12:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578335.905783; Mon, 07 Aug 2023 12:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzOw-000258-J2; Mon, 07 Aug 2023 12:31:58 +0000
Received: by outflank-mailman (input) for mailman id 578335;
 Mon, 07 Aug 2023 12:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qSzOu-000252-Rq
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:31:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 630392d6-351e-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 14:31:53 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2023 08:31:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7438.namprd03.prod.outlook.com (2603:10b6:510:2ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 12:31:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 12:31:40 +0000
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
X-Inumbo-ID: 630392d6-351e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691411513;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LP8wyWrP4TFzd4iy6/8U99CvGxFEkXDV7f7kaAenj2Q=;
  b=ISPMVf8rswJxrPm739SJz4MsGP1t0OM0W4WVOeqZp78Bipk81JMQWWwj
   HITcu9Wjji/6Jm3OmyG2TEVrk7ogw7GCP9BIQHUWhiW7UepujcZQbhtee
   1OMYIkkDcly6k9iY/fHNDCaEdjHV2Yk9OuY4HX266mS6+D6qEu2jV5234
   k=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 119148616
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uU0twqwQxlW9Bc1op9l6t+dwxirEfRIJ4+MujC+fZmUNrF6WrkVRn
 DFMWmnTb6mCZzfwfN4kPIjlpkIG7cfXn9dmSAZk/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPa8T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUV+0
 s03cysGVA/Zm9Ko8pafWOdxiP12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMpuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdNLSO3mr6ACbFu7+FQuTxcYWhyBvqOFikXmddMAA
 WkL9X97xUQ13AnxJjXnZDW2rXKJpB8XXJxLHvcz5gCLy4Le/gmCC24LCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcJYikfUA8Z4t/siIsugQnCSNklG6mw5vX3Ezztx
 zGBrAAlmq4ey8UM0s2T4lTvkz+q4J/TQWYd/R7LV2io6gd4Yo+NZIGy71Xfq/FaI+6xS1iKv
 HEA3c+E/u0KJZiImGqGR+BlNKGk4feMdifVjl9mE5Ai8CmF8nuvO4tX5VlWLVZgNIAHZDrge
 gnTsAdd6YV7NX6mK6RwZuqM598CyKHhEZHuUanSZ98XO5xpLlbYpGdpeFKa2H3rnA40i6YjN
 JyHcMGqS3EHFaBgyznwTOAYuVM2+h0DKarobciT53yaPXC2PxZ5lZ9t3IOyU90E
IronPort-HdrOrdr: A9a23:GzLACa8eOQ2NZvKi2dhuk+EKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVcqKRcdcLW7VJVoLkmskaKdjbNhX4tKPzOW21dATrsSlLcKqgeIc0KRltK1vZ
 0QC5SWY+eAamSS4/yKhTVQJ+xQu+VvvZrY9tv2/jNId0VHeqtg5wB2BkKyFVB3fhBPAd4cGI
 CH7sRKijK8cTBPB/7Lc0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfMJ8H
 TDkSb++qK/2svLuCP05iv21dB7idHhwtxMCIiljdUUECzljkKSaIFoS9S5zU4ISLXE0jcXue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgFP4yPaJDg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn93d7VTBtn/3DE6kbKqdRjwkC3bLFuIYO57LZvin+9Ka1wax4SPbpXWN
 WHD6nnlYlrmB2hHjzkV1JUsaCRt0QIb2q7q3c5y7aoOhht7QFEJhgjtbwidzE7heYAd6U=
X-Talos-CUID: 9a23:j6BjY21oyUvbbs5s3BYbDrxfPvACQ1KG13zqPBWkOXhbbJmHR0KewfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AEjT+4A5O1Vk9MRCAtJ7t7A9nxoxW25npAk4C1q8?=
 =?us-ascii?q?Z4fWEPnReOmi3qSu4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,262,1684814400"; 
   d="scan'208";a="119148616"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvbz0KS/YxkCDAlvhsrIALRiQqEfaBGNJLUt+bMNyDFzVl6dJkPuGUy1Ueku7E9t4iKIYQ1pAzHkreT7fm5VoIl2OPK5w6PJptRSLFS7HomHToXIyowp+G3Q/dCLVk/Ay7zIk7pPMyj1NU0kxBA4tKBJO5HFhzAwQso0h5vHI0TepOl8oTClp7eWsmIZt+Ar0l9YgJ4rYxBhzjY45AI6gdsH8Vw6cedOiADOyDxWRAUvufXpq1txTqH+DVGcxYCr8mtkyrZ6VhiIdscC2nSws1sq6bc02ay5qKAstqEE+XZOgyr9/fYOKGXWp7Njnl5/pRuLQN/2OZMU4gCaXbM+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7p/gEpThY1ch+U/eJJhsdFuuB+Q1peLfyB3S+sdRIw=;
 b=kjWyRVLQYu3TXoPzedhjonlvCaZ11SqpbYL7Uvg8dikm1Prj3uDnV1379SxhLm541M1dghF1sb98YOGCXQATb8mYODhd1Ey4fKg0oadW2YYyOyobaULvgLyf0qOLvOtGPgKwEQcA5Jdc1In/EcFxDY7rK4qpHNtMv4dXWct2wAbymwRe1TFmdneWJz0m30UvtKHJIJbt9Ryevl8JuxlGdemtEIPeFsEMTzNy8E0vdqAbIN+VtlMOP2AtM7o5ZJ2UpmRsCtvRZEyLr9tExN0vlz9Ur5V/qQawH1JDh5668ggjqZJ1OPufyiPXgN1QRMaRHKtdJ/1nLY+64GQko3B/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7p/gEpThY1ch+U/eJJhsdFuuB+Q1peLfyB3S+sdRIw=;
 b=WneqvsVTgsT8xFYZioYC5pwsDfiw95Bljez3Mwx4HuKAVojOxNObxr+SDJ88qg2IG6pq9KwdnV0njGD7gTxsizy9zzCfOQyftR+zBZTb+aksIg1CmhRSBhGO6LKskSQ9ZfYNuY9yQkCt/dpnPH0md+twC+QEkSfaKBhzPeOA3X8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64ec2572-348a-2c6f-d354-2747659e4666@citrix.com>
Date: Mon, 7 Aug 2023 13:31:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [BUGGY] Re: [XEN PATCH] x86: Address violations of MISRA C:2012 and
 drop bool_t
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
In-Reply-To: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: f96a6771-e4cb-4f87-dca0-08db97423fa5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N+DzVbkBvlLWkCdyoDDeYVi028VXbcJ01W0Ts0CRK5dwTIrW9ly74y3xFJsau7qiCnjNHngyvMjzvSqgU1Km/8ol2WZxCsgiUEqtcW76qbOZXmrfsHCgA9FkZ2FSSFxF0x1K/QGoTbw1EbT7dApY188F7DB9lvI+j/QpPZB0ncLmEYwroBtxs5h36ak4EIoeOl31x7EibRt7YHVFB+gIT/kmaOGKzQ4uOpxruVimR9c4H41tB4FvVux1PKAIl1MxZ9CS8P8OPHhCNUlyz7kS6xhBaUdUaLo56bIzpk1fumKVH/Vpcl8V6yTbwY7vNa80U0Pl+cfvkNGV5s3r5qBQgHgWUyM5C7eiHKReEcDVrcXMrkuvduOoGbO4c/ZwfrxjvSK1M6h/4NgtfTkEa8m3wJdju87dkZAntaBs/ipyyA3JRvKNicuBAlT2Dyxo4GQWuvcSW9HoufVNWxdGUJFZ28b7zDmwj0kgzk8OUy7e3yZN7LTKVq6XBPUt1dQEJLEu9cpGZ+F+tYEdq569sAYpFmI9x0ixGGG55DXIAQujJXIYw53VS1gfZPruRca+zXzivTqvH6G5tHYvy5+E+2eYNEe7IKY+pBH1sGeRa2MGmBjUU8Z4xcCDUEQL1/Q/EubtZR+fdqghBAY0F7IMkyx9kA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(86362001)(478600001)(54906003)(38100700002)(6666004)(66946007)(6486002)(66556008)(66476007)(31696002)(53546011)(6506007)(82960400001)(41300700001)(26005)(8676002)(8936002)(66899021)(2906002)(83380400001)(7416002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGlIVHB6dDYweWJYTlRCRHBJeEZFYTc1djR2aVRROTdpVC9MRys1WHE3Wk45?=
 =?utf-8?B?RHJuL2plSkRPQnV0TnBWN1VvR1dRSmVEM3BYdGRML0pBSTcxbDd6WTdIMm1x?=
 =?utf-8?B?alFYaEtsWGRLanp0Mk9nRllldG02RE1JRjVjWGR3bnplaW5GdUltcHBhZitT?=
 =?utf-8?B?b0sxRGFmYUFvRWJ3QVUyNkNSbUpTd00xM3ErTVA3TzdERXNVU1NKTk1jb2Rl?=
 =?utf-8?B?VGRlT1J0akl1Qnc4TTJ3ZnNyR3RvTEhEdDlQOUpGalAvQTFKb1hrWHJ3S0o4?=
 =?utf-8?B?bm9KRDdRWGFPdjhOa2xYVkpyWnhaY1JHb2pwZlMveGlYdkhvTm9HNFRxaHdo?=
 =?utf-8?B?TWlGU25CU3lBay8vZ1R3K01aaGlxRVJyejdYSGdTbnJKUjczaVI0b3labFpK?=
 =?utf-8?B?M0tKN3lxeGYrOE42elIvZGx0akRLMlJtYTc2TXh6eVV1bTE0Y21ybnNaYTRt?=
 =?utf-8?B?MlkxeTZNMVJqcEpqYmh2ekYvOEZYK3RlampIaUsyS1lObFNqK1BnMXUwTXBH?=
 =?utf-8?B?aHg3UFVKVjc5cnlQWE1XaFl4MVluSmxGNi9mTWRFZFlCY0dHa2ZiK3duMi9V?=
 =?utf-8?B?OVBxdUJGTDJLRm9ld3hKRTlJZTBNMnhYSzVzOHArZFNFVFkxMzNDR3Nwc2h4?=
 =?utf-8?B?SnQ3YVBTRHhURFJWZjBBUHU3Q3FENGI0UXlQNDNhd0NLc0NtZHFKR2d3REFN?=
 =?utf-8?B?ekNqZGIrYmJiQi8yR1pSTEpwMWtobnpwY3luOFA3bVpOcnUxak92b2pKM1hy?=
 =?utf-8?B?SkdGS0pWODBPSWtCYTh3aHV1MVVlWVdLZUhLRHhyV054aForSHd5ME5OS0F2?=
 =?utf-8?B?L1BjMUxzMnZUa29rNjI3eWxWNSs4eEVRQnp2VkgxMVozeVZEMzA5aE5SdEh2?=
 =?utf-8?B?ZVBoWVJ6WXNJZWcvOE1RZkZZWVBPTi9DUHB0Y0hzR1dPMGlJWEdmUGQ3TFFW?=
 =?utf-8?B?c2M3VkxjMXR3UlV1U3RjVHgvWmlyRm5Na09MbXFqVEk1ejZiU09LTm5sRWRU?=
 =?utf-8?B?VHVOalBiYVVzNzlVTkpJcCtLMlUxVWZUVkIxVm5vbzhjMjRyVTBmbW1TcDQz?=
 =?utf-8?B?Q2tlVWQ2cGE2U1N4NGU2dWxmRUVzdHNLMGZZcjFnU282eVJQMnpTN3cvQW5z?=
 =?utf-8?B?TUxJaHZPeVpadGVvbHE0dXpsZ05lSkVuVmZ0WHRTN1dVcm8vWEluZVNTT2dl?=
 =?utf-8?B?TEJHNTdUVGplcUxkdVFFNWp4OXprNEhvcFpFb284QU0xbkZrQmlLUHFlVkJx?=
 =?utf-8?B?NkpHV3UvMUJiWHpkenRnMU9ab08vVXRGWmxLQW0waXlhU1ZPNG55dHpYVlJi?=
 =?utf-8?B?d1ZBbkNKc0F0L2wzdkFSVktnYm9mSmNPbVlXQlhqak9LNnZFQ3hRN05nTGxK?=
 =?utf-8?B?aTVENEpmRDlXWFVhR1lzcG9DOE1SNmhQMWU0WWVlUUF1UDY4a1JPWUtSOVJv?=
 =?utf-8?B?QU84cUNjemZhU01EcnZjM2htbDhER3ExT0tqSVlwbnR6dEl3YXBzVjkrNVhR?=
 =?utf-8?B?OFY0OXMvWEZ3aWFDdjZ5RmVzQVdVdHQzd2xSd2JIUkI2YWtnVzhXSzVOdnZB?=
 =?utf-8?B?WFVuWXE0M3VXSEw0T0dtUVZJSFg5UmtDNzVNU2hTd000NXhVYkgzbkR5YWEw?=
 =?utf-8?B?YlhPODMzcFZJNEF0OWtoalRvNFRTa0pFcC9XWG4wSE5CVXdyV204ZmlCTG85?=
 =?utf-8?B?OHNDZ2xkWWhTanNKM1VjVndoam9FdVVpRUlTdHBBZGJpeUhDeC9aQktEN1RG?=
 =?utf-8?B?QWhRSkRFcFZEcGFDUDNrODVJMUl5RHE0OXd6VjU4dWpyUGxGVks3ZnBOV3Bz?=
 =?utf-8?B?cnZYV2hRV2REMkNoakVDTm96NmxGWllOdzRiOUJIUzFLNTRBaENIQ1I2Y1BS?=
 =?utf-8?B?TVFKNWxHRUtvRzdLUWVQT2FJcnJvL1cwYXhaNVd4bWZTRTdyMzlkbXNEWkxp?=
 =?utf-8?B?WklwbEFWWjZ5OTlqK05BNnVzMGJsWVlaU3J2Zkk4aVg2T1pHQlVWV1hSL3JH?=
 =?utf-8?B?Vm00UzB4ZkNBYWlJRVpGVWRIc0tETmxDdG9wdjJzeXpOZGxvQUtKWmQvK0NB?=
 =?utf-8?B?QlNKTG9IeFpVZ2pSM1FGTXMrdXpOUEZBTlh3WFZhWFNJMG5xV0dmeDlYRlFs?=
 =?utf-8?B?ZDl5SGcxVDFuYWNOQktxTTU5OHB3L3NGSC9aZDR1MFJVeUNwbGd0NFFBWnRI?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JfzVagdXjrHA+6iVSLWbP2RtVvVnowkbhcR1HjPMvHgWXcy3tzHhJR9lxOjjOjXjsFeglE/WqXWL804BtiomeEg51NdNALsrlQeo0tTzJN15nPwGtX6YG2uRn76deFGYR4j1PHW/IxUlSQG4aQumk5q+dT+j5qs3UpfoOnVGyd2Xz3P8dgZgZBRVW1nY47G4xonqFcPvE0Oi8CtoVFDtgOp0ytsCYgO6fMrmNmA4V8peq3KdRqFSLBx4FCwivrRe2Ki3hZ+EvzxVR/d0JhtcL1FzNr6dfq6VVnLFd4Ip3YVI4V8vwGGzqp6RrLsWcE3q09HFSSShfPKN7WfSJ6oYy8bfP4/YnQVvvjsaqI6nJHV9izAxg4uQ1XHDSSspO5RlSZ6x/yp4xySg8h/sdyLXyNct8cBLV+zkKtp5tuGpDleRilf0gn/T86wfbaoBZYs2zHFZNN0Z239/Advqvk4ycuogfFQc/uSOrOyUbDze8ppUL7ocXz7tUXBPgTdQCMLBPQiHu5mKYWxNX6ncfk6NBCfhqgeU2SYMydGZcjSp6g0EP6KXAdvUM27NreKz2yUdpi3jPNHyfEn+P6I6FQ62HhRCCLCJN4Wd7VLM6x1u2IFDsnrB4M3Qipa/7MW0uyLEX22EmZ69cY/zmxGdntqOo5Z+8lZuYE35LuCNVxWOyRhgPRZwF+rSl1dINHhH0HblL8MTDuD2Zojc8gGuo5+QCoemZSIVXvPWblUm66eNlhAzkzctLTje3fRqXwZsepE4hjSDZyfrJRjzxNKnIfRw9coVlcMU9AvgHzdhD76TObzXNPpJ+5LRHxVDuBhHiSTA7WP6Jc4n4IlxdExRO2fenDJed6VXth9kLzNpwIPs/H6SzgkMhDea6sFVPF6fKKHdoZCWWGy778OW9mBpmfSBWw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96a6771-e4cb-4f87-dca0-08db97423fa5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 12:31:39.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpV09CZb7Z3RoxxvL+oddpGmw046M2izzS6Rc7/w4hw7sDWjl8+oIFNqQOgojLtK/F/KTIK/Mikik93c0tAz9apcmsR9G2UH7OsRKAkULC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7438

On 04/08/2023 3:11 pm, Federico Serafini wrote:
> Give a name to unnamed parameters to address violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between object and function declarations thus
> addressing violations of MISRA C:2012 Rule 8.3 ("All declarations of an
> object or function shall use the same names and type qualifiers").
> Replace the occurrences of bool_t with bool.
>
> No functional change.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/cpu/common.c            |  6 +++---
>  xen/arch/x86/include/asm/processor.h | 16 ++++++++--------
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index cfcdaace12..5f29148416 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -26,11 +26,11 @@
>  
>  bool __read_mostly opt_dom0_cpuid_faulting = true;
>  
> -bool_t opt_arat = 1;
> +bool opt_arat = 1;
>  boolean_param("arat", opt_arat);

I see this has been committed, but you do realise you've created a new
violation of 8.3 by failing to change the declaration of opt_arat to be
bool ?

Please everyone be more careful.  There is an enormous amount of MISRA
churn, and it's hard enough to deal with this when the patches are correct.

~Andrew

