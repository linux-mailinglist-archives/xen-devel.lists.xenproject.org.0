Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67F741EF82
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 16:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200688.355235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJYq-000340-Ew; Fri, 01 Oct 2021 14:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200688.355235; Fri, 01 Oct 2021 14:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJYq-00031R-BI; Fri, 01 Oct 2021 14:30:52 +0000
Received: by outflank-mailman (input) for mailman id 200688;
 Fri, 01 Oct 2021 14:30:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+lB=OV=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mWJYp-00031L-4n
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 14:30:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c18cb66-22c4-11ec-bdad-12813bfff9fa;
 Fri, 01 Oct 2021 14:30:49 +0000 (UTC)
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
X-Inumbo-ID: 2c18cb66-22c4-11ec-bdad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633098649;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ux5ZG5p8Rq1aWtqnGKE7zRihNadmfPytGMbtDhPUsEo=;
  b=GtzcdjuUDTZu5ssH4rNaCSINlWdWm2vrUtA9kezbL/RS8RRO6FBFElKf
   BTD0eOdPKlQjQZbzSn74Xydpz2KeyRo9sVfEnAbMCd64//gXjeBvR1cVi
   rNCSac5M6bkxCuLw+jTVlRnYtIKYueMdVDGzquCm5JwYDHs8T6K2Tl7xz
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lhFB2B95WOp6wj9X7X4vLofYa/wkwbdYPxLbQA7eraW+aLdfHV7ipGg72J2ENit0hsF0Vdwu/I
 +kNKfth9i16zdG5ceaWfn0YjWNGKYmda4BOC86dCrpXVOnQ07yF8JkvglnpLf/vJpDwKOd7Hzy
 IAL74kUvRR33ZUHpCzUhwS6aQwkq0B+dA7qYMfXN/HCK2OEG7wsvn6KmieLrrg6Ie55rPzIBJy
 hFphftuPGerGx3ZIAGluRexBbt52mPFvRgMVP8jyyAmX8m9NOw/u3JO4hf9/ld0Yl0wTmBTAQ/
 sLfv7eEpTRxfMCaMFLtdPQ19
X-SBRS: 5.1
X-MesageID: 54148693
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yHQFpagRRzmX2888enJDDtR6X161BRYKZh0ujC45NGQN5FlHY01je
 htvDG7QbKuKYWDzftsjPdjn8EgGsZ7QmodgGwJlrC8yQyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg29Yw2IDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1cuazzUFkQYJHsu6MRXAhnSA5CO5xZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauCP
 pZJN2s0BPjGSwV1FggIDo4up8ex2EugWhcbjnmeooNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAw4YHMySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOTvfm4kQi/QJRWc
 0gP/SwGoq079UjtRd74NzW6vXqFsxg0S9dWVeog52mlw67Z80CeAnMDSBZadNU8sMY8Az0tv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihCoxnbIIluYQyr62u1vAhlqRSoPhF1BvoF+NByT8s10/NNXNi5GUBUbz/Ppwb5/Hdwe9n
 FtDl8eP07shMZe8i3nYKAkSJ42B6/GAOTzapFdgGZg96jigk0KekZBsDCJWfhkwbZddEdP9S
 AqD4VoOuM870G6CN/cfXm6nNyg9IUEM//zLUerIJv5Hf5R8bgOO+CwGiaW4hDu2yBlEfU3SI
 /6mnSeQ4ZQyVfkPINmeHb51PVoXKsYWnj+7qXfTlUrP7FZmTCTJIYrpyXPXBgzD0IuKoR/O7
 /FUPNaQxhNUXYXWO3eMqtZJcgtUdCVrVPgaTvC7kMbYfmKK/0l7VZfsLU4JIdQ5z8y5aM+Sl
 p1CZqOo4AWm3iCWQel7QntidKnuTf5CQYETZkQR0aKT8yF7O+6Htf5HH7NuJOVP3LEznJZcE
 qheE+3dU6snd9gy02lEBXULhNc5L0rDaMPnF3fNXQXTiLY6HFGWpo+4IFG/nMTMZwLu3fYDT
 3Sb/lqzabIIRhh4DdaQb/SqzlirumMalv40VEzNSuS/sm2xmGSzAyCu3PIxPe8WLhDPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB+o4cHmL1MVCrINXwbpdtVfkU
 06D4IACa76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgLZkuCki1QKrdxIbgJ+
 +Z5tZ5E8RG7hzorLs2C0nJe+VOTIyFSSK4grJwbXtPm01J51lFYbJXAISbq+5XTOc5UO0wnL
 zLI1qrPg7NQmhjLf3YpTCWf2ONcgdIFuQxQzU9ELFOMw4KXivgy1RxX0DI2UgUKkUkXj7MtY
 jBmZx9vOKGD3zZ0n8wSDWmjFjZICACd5kGsmUACk3fUThXwW2HARIHn1T1hIKzNH7pgQwVm
IronPort-HdrOrdr: A9a23:DkqNQqoj8FuAruANPpq8wXsaV5u8L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFZSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHJXguNbnmBE426gYzxLrWJ9dPgE/f
 Snl696TnabCA8qhpPRPAh6YwGPnayGqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD09jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU911rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxzr5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtgrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGYgoBW+q3oYp0PJGbDfqBb0fbllAS+3UoJjnfw/fZv3Evpr/kGOt95D+
 etCNUhqFgBdL5OUUrRbN1xNvdfMVa9NC4kBljiaGgPJJt3SU4llKSHlIndxNvaMqDgn6FC1a
 gobjtjxBgPkgTVeJWz4KE=
X-IronPort-AV: E=Sophos;i="5.85,339,1624334400"; 
   d="scan'208";a="54148693"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M97n2Xb4Gxs+wS7RYIMshAiZEdA8kERcT8tSyB3TQXqy2FdKFkruKYjHFr3enAy7KbYDE++KYpxewJs7dUy5YAm2IQ3BZbtlPeXduZ2Mrtywr3o2cdFfxcKtL689vem9cFt39gPPiJOQfV2XwX5Ur1KcGpyDT53T/HTQa2WUI+Hho7bsPaJZNibfoMU+R2RxIsjHZ0VdrYEgrOR4Tg2sXhWlHIZwGENH04h9iKck9xKZcwmCKn602UVXa3Db8CSrjE1aSd8ivjAfnkFAxd0K/h/G01T5/jNAYWiBlYC7azcXzysWUrIIb4eimwGcZDGTn4ZsGyecgdQ3k/9Gznfnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu5lfKqc/MOtq0lV000NQTbgxDYRjVUN3tPlvMIgE4I=;
 b=n+V/pu4bnnxu0jqw3bOJOLKQVh3l076Q1d68YQytSUWDS1KaitOTQoJSxkdLr8jxJkB6J7cr61o3IfCejMj++1vRJaApeE6oyPj8UlQ6isbGBr6wWP61kqgNlkZqKcPMPXEUXwJZHxUn2NAknevd63nRR4DLQuhcxECHtmcNu/RGRxFHPuRARLpnG9RVQ6cYEzhDcn6fS/Veof1k+RTkZfZdIZZpIHWgOnHOyxcpeo0m/nIGaWJZv/QCtc95xEpmZbAAEuG/fPDOdd5l1CrdQqu+VieRB3BuVfzvYmyc465s8ugx2EwG8PN5X8yENCOc+43IyhALbU1eQXugE/ViZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu5lfKqc/MOtq0lV000NQTbgxDYRjVUN3tPlvMIgE4I=;
 b=vULegu22qhYX6QN6dEJw215Ln6E0I3i0ROAhH6od2oWJVi0Xo7EBn74GkDV7MbvoOrkWQLlxSF3wcbxCyEWuKnCBnmJiWsE/UJn9w1Ra39JzuH7sME+Jh/9lNitc2VqFya8f0YRQmmxQrVNgKb3DJ1JeAUKn8Uqh44FkjZwuxrM=
Subject: Re: [PATCH 1/1] x86: centralize default APIC id definition
To: Jan Beulich <jbeulich@suse.com>, Alex Olson <this.is.a0lson@gmail.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Alex Olson <alex.olson@starlab.io>,
	<xen-devel@lists.xenproject.org>
References: <cover.1632512149.git.this.is.a0lson@gmail.com>
 <85b59046315b8a84afa8538aacdea92b19200faa.1632512149.git.this.is.a0lson@gmail.com>
 <d899b058-a201-e2f8-35d2-f0e59ab4bab3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d63a0e7d-7f9d-0dcb-0ac9-8995e56698b4@citrix.com>
Date: Fri, 1 Oct 2021 15:29:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d899b058-a201-e2f8-35d2-f0e59ab4bab3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99d2d192-42a5-477d-5849-08d984e7efb0
X-MS-TrafficTypeDiagnostic: BY5PR03MB4966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4966CDF53532BC3A0134A557BAAB9@BY5PR03MB4966.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBJZTNWxQEBt3XNfC5yjAlStZz6WC0Qbpk5xs08oinOx90OLsLsJsFz2wdjBp8MeE1SYJkqPjG9esbJbeeIChGvBcF26gpNoeFnezrGYhjEh602UMiwI2MpQf0pdNsZ5jUPrAtdeH9Vh051Mh1aL0Rs6N2m8pSdUO05/6TRLty5cbzxteG1znS1mQgSJoBktuHuXHICf8QRq5k49dMY5p6sMe4RTx96kw5TsKpkuOcZg6t1kQV9XMh020RcGlCLcLXZpYWNPCy/CJe4OLevGqJ8GNdVaVfIYo9ZqpKQuv3AjgMVpWO7RFkJDaxJJkfC1d0BFwpYUr7nfkLQNvV6P44n7IwZIipTXGRNnhtOl10Xm1tYWXjpovMZgwwtJDpzOhsFk1l1cMec5ZHudWM3PYFQaRw9dLCC13Fdl34a7OjFj+I1Vc5ewz9fsIGH/SCyxzxA3WV7iN6gcHn028Fi6y5yGJQmI577wmBp7SbatLtxAhS+s6k4M4TRHFz3fZ4ABPgUIgleIxak2gHxWE6sColmIBgZYU0rNZu1X4khNg2RKx9BCxVUdUeekwfsp5ZVAJNgxnTOQ6SFsG8MXhj1DeLiPF3gpYy/SMdfdSkExJwgVzFNA+Heu4Bk5gQxJm5ROOUHvY3nO1ISYa2fZZTiBSeNKihSQwLL2O2bT9D9BzeAq0r/XupMX/E6Reu3FStgd8WDAtbyq5IcyGsusXPuVoGpohWSsFjIbDBxxR7ohEQOMSuNfkcGC5aaEow6qaX7n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(31696002)(956004)(508600001)(55236004)(2616005)(8936002)(31686004)(38100700002)(36756003)(5660300002)(54906003)(4326008)(83380400001)(53546011)(66946007)(6666004)(8676002)(110136005)(316002)(2906002)(186003)(16576012)(6486002)(66476007)(86362001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHhWbjBuaXFJZzRUbm51cWxsVG9md3ZaRkhiNmlzM3FJN0wyU2xHK1JEVUJ1?=
 =?utf-8?B?QUFwakJqeVdqZ1daTHkwQW5HWVpQdHJZWHJ3OUJTcEU2aVc2cmpTVjcvK2wv?=
 =?utf-8?B?QSthZ01ZRHRkMk5tOVREVk4yZXJyUDdkOGl3ZTJIQ3ByeXppR2RFV3YxRXVR?=
 =?utf-8?B?VjYzaE9PbUk2a1FFNzcrc0h2MVI5MDRZc0E2Q3kyaTJkeEc3bnpzODZ3RE1p?=
 =?utf-8?B?L3pURVFlQ21FbVpVSW5tQUIzOXF1bk80TUdGb0VBTi9zajBnMUx1UFlrYzRB?=
 =?utf-8?B?MjA4Yk1hdnY5SzBNVUR6WDBETU1LRE04emhtcnphRXJISVo4VzF0eFlUWjhZ?=
 =?utf-8?B?U0o3ZEFuclZxOUZLOCtBL2s3Sk5WL2M0TTJ0clJpb1FiQk11b21TdWhuSE8r?=
 =?utf-8?B?S0QzdE1icmxBMmwxU3VIb3psZy81bW5wdUhmUEJUdkFMVC92cXVMa1VMNmpX?=
 =?utf-8?B?NWs3SEJ6SVhwTENhY0RFbC92bllhSUpUVVE0TWxSYkN6QnozcXQzQmxvTHhv?=
 =?utf-8?B?bVgwcjZ3K1R0NXJKTm5FNjlndVF0VCtsZG13ZG9JeUU0ZGpWMFZGK2c5NjZN?=
 =?utf-8?B?ckliWXFpUkE1SE11bVlqV1FuR0JZcFR2ZDZIdTk1aVkrVUFNeENpOThUUXU5?=
 =?utf-8?B?RDYzUHVmdWkvakJ2bTVmV1FYQnM2YmhZMXdjZXFxRHhrSllHK1dMcUFoaUo1?=
 =?utf-8?B?S21xaTJhZGRDRDJhdGMxSVhkKzRnL0VIeGhqWE9EMDB4MWFQZmkzSHB0SVFQ?=
 =?utf-8?B?UEl1aTR6Rit0Z1cyYVFvQVprT3hjNGt0TWRnSWY4N2dwbVhnVFBmSWZvbllq?=
 =?utf-8?B?TVFjQVhvYmtQVG1DOCtrVkQwN2VpZFV3bG4zWUNYNWF3RHo3ZU1YNWZJb0hr?=
 =?utf-8?B?Rzl0MnErZkEwc0lYekxBQU9KNFNUMWRvL1dlYWNKSzJGVjQwdVBpa2xuNGxY?=
 =?utf-8?B?TGtVN0dQN05JeDJYdEwzakNEYURxd2l3YjdOQTEwNWhqUzVBZkpCeFFWS1dm?=
 =?utf-8?B?NUZ1VllJbGdDclhpcFl5dVpCemtjcVBBaTVTbzZpdTBBV3R5Qk9CQmVSZ2Iw?=
 =?utf-8?B?NEJiU0xvWjN4YStQWHhyS1dxK1RtMk1LQ0lNZ3FtSElLYmtHbzZMNFZTd0RT?=
 =?utf-8?B?SHlnSTNBcXZiNFR4U0lDcDhOd0NNNFAwYmpUSjZ4RlgvalJ6WTYxQ1JoQWRM?=
 =?utf-8?B?cnp5STZ2Mmd4Rk1VYTcyelh5a1dqcXlsN2x3d3hMUzBveFM5Uld4aEFUUmNs?=
 =?utf-8?B?ZDJiUEZtZFVicVVrdHEyVm1Vb2RDRkFvUEozbWVkb1NqcmRHTUhiUDdDOFIv?=
 =?utf-8?B?ejgxUVRWM1N3eWVvZkdKdndWVDZsL2NOZGZ2VkVuS1NlMTVGT0t1TC9yYnB3?=
 =?utf-8?B?MHEra3dmZm81YTNPU3hNNFd4WUFxaVArOVo3R1FySExRVUdmZWlKVXVLaWdi?=
 =?utf-8?B?aEh4VzRQbU5yMHY5Nmw2QUQ2eGRxMTdtMjN0RXZOSGxVQ2FlSUZIcHBVUE1U?=
 =?utf-8?B?eVNNWkZZRllJYmtPbnpXRWd2WjNqSjFUcklnRFFNT0w4ZTgyeEowN2YyeDVP?=
 =?utf-8?B?LzRhbVdaYVlXMkRFSFl6OFhJMURuYkYrRGhWZU1ua1RIeFhvdmRoM0RyT0RV?=
 =?utf-8?B?N3FuUVRGV242UE5KcHJIRm5aZ1FNRzQ3U3hNRDJ2VUl1MG9hcHFEQVRkdFdN?=
 =?utf-8?B?NVZwYnIrOEtIaTNWOUVLQ3p5MDVlWGtJMWJscUZEZm9waUF3dDh3b0lyL1Fx?=
 =?utf-8?Q?N3HYQHZHUM6um0vSiIiyXKGLb5Ywz8MnTncv0b3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d2d192-42a5-477d-5849-08d984e7efb0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 14:30:14.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8G14BTS4nGz/BVVwbZUXqT9Ff30lSekRrkJHs2Z/0knL04JZyiBwlC3+dKXha29XzD1S1yK6bD+UA+wsDss3s5tHnQxI1AP27WafXIFLOHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4966
X-OriginatorOrg: citrix.com

On 01/10/2021 15:19, Jan Beulich wrote:
> On 24.09.2021 21:39, Alex Olson wrote:
>> Inspired by an earlier attempt by Chao Gao <chao.gao@intel.com>,
>> this revision aims to put the hypervisor in control of x86 APIC identifier
>> definition instead of hard-coding a formula in multiple places
>> (libxl, hvmloader, hypervisor).
>>
>> This is intended as a first step toward exposing/altering CPU topology
>> seen by guests.
>>
>> Changes:
>>
>> - Add field to vlapic for holding default ID (on reset)
>>
>> - add HVMOP_get_vcpu_topology_id hypercall so libxl (for PVH domains)
>>   can access APIC ids needed for ACPI table definition prior to domain start.
>>
>> - For HVM guests, hvmloader now also uses the same hypercall.
>>
>> - Make CPUID code use vlapic ID instead of hard-coded formula
>>   for runtime reporting to guests
> I'm afraid a primary question from back at the time remains: How is
> migration of a guest from an old hypervisor to one with this change
> in place going to work?

I'm afraid its not.

Fixing this is incredibly complicated.  I have a vague plan, but it
needs building on the still-pending libxl cpuid work of Rogers.

Both the toolstack and Xen need to learn about how to describe topology
correctly (and I'm afraid this patch isn't correct even for a number of
the simple cases), and know about "every VM booted up until this point
in time" being wrong.

~Andrew

