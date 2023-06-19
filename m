Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAB8735C29
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 18:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551224.860643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHhZ-00064i-8E; Mon, 19 Jun 2023 16:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551224.860643; Mon, 19 Jun 2023 16:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHhZ-00061j-4a; Mon, 19 Jun 2023 16:26:01 +0000
Received: by outflank-mailman (input) for mailman id 551224;
 Mon, 19 Jun 2023 16:25:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FHF=CH=citrix.com=prvs=5274193ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBHhX-00061a-0z
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 16:25:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f673cecd-0ebd-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 18:25:56 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2023 12:25:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6380.namprd03.prod.outlook.com (2603:10b6:303:11f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 16:25:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 16:25:50 +0000
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
X-Inumbo-ID: f673cecd-0ebd-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687191955;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EiemhYoKQ0xWVX2gpF1mFvdi4n+Se24VDaR25nGUHnY=;
  b=KHlFBqMV+nmot6CLoM/8jV7P94SYRawItcZSkEPIaQwOY0yQB1Hlq3XV
   FqwplwpdDP5DpW4UKkdYioheUlHUJHzOjRyeTq0UDiaIFzu5Wkey4A7bW
   0WhRShNeHY0t2odvOmE4FG2hO3sy9v4iWZKClJCgyU2h7E6qwo7tLjC6d
   g=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 113371475
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YMvoUqtSVDEz/GSbmKrdsXzSu+fnVMFfMUV32f8akzHdYApBsoF/q
 tZmKWiDaarZZDD0et1xb9+x/UJXv5CAnIdiTwE//igwES8X+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGHxiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBQAIQjzEotmN7rOcUOldmv8nFvnaI9ZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIO9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThraU12QHMmwT/DjUwa2C3uaHkknW4Bc5lE
 F4L+wkrtIgLoRnDot7VGkfQTGS/lgUVXdNLD+Qh6Qal0KPM/wGDC24LTzhMZcYnssBwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty8X7rYgplRXJZsxqCLKylNDzFjD2z
 j2QrS4xwb4UiKYj1a+24FTGiDKEvYXSQ0g+4QC/dmC46gJ0Yqa1aoru7kLUhd5bN5qQRFSFu
 HkCmuCd4foIAJXLkzaCKM0SGJm56vDDNyfT6WODBLEk/jWpvnu8J4ZZ5WgmIF8za55dPzj0f
 EXUpAVdoodJO2enZrN2ZIT3DNk2ya/nFpLuUfW8gsdyX6WdvTSvpElGDXN8FUi3+KTwucnT4
 aumTPs=
IronPort-HdrOrdr: A9a23:8Sk5j6nVeIXLKOYA8z52D17Y9dnpDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-Talos-CUID: 9a23:BJRbCmMGs0hZ0+5DdRli2GJTP/seXHz61nfhP3S8M1ZYV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AfKDULAzYio45QheOUNrHd1l4nhGaqIKQM0wVycg?=
 =?us-ascii?q?egM/aKRZLKSicrzGuYrZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,255,1681185600"; 
   d="scan'208";a="113371475"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMqNgQe7fOapJAr2jcvA3yB4+CwszqLWWuGE625xaUj/1y8nMvOP+0Q+T9gWtAGAxHxDltQ8rQB0a8Jl7zJQu15JpTRgFNLLHFLDluyJO82F1+AZ0PQmDEthcIXE/6hUezoOK96DlFqAHnBn8S0XE1Yew8uhP2aGwvH1Sr7yjL2sQK8i8kqvlNoJmLYJ5Z/0xBjmHPOtaLcIHLhU1I0kNhiTz3RlRVpjqGg5o3CPNX6LgTqIQ62R/kddy6QxD/9tztDu+ZU0CmMRrcb3g71Du5xqhLQ96zNXVNoQp2UWQBEyXJrgZyN9rTk2ELcaDR8OjeMM9WUYcvX2AcxsY2T+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egKced1f2NuQf0bgJFS3VB67VW9MLqwjW6JrKLQLihM=;
 b=Os9qVJCjAPNloHHhJBOQHsHhomv379C4/fHSLsEZBGjC8WFu/J8j2OAA4QEs7cvGmOCtE9HUtUo+y39ANtQFotuAM/4A68/mHzRYbPGtiZW867be/7Xt962uVTXmsnXUyk4OpDiMg7xMDqUYJg1bl/2UzDBrHGAUSAKv01Lwzq/xQMoD/FmX4BF2LseZjPy3i1nykI83pc0u75nzYCfxsRpJPb0SQqohklMKmopZFc84GCDQ0icJ2RhYNHyQ/NpOaUO3JhVMyL7s59j0Jn1MZqDl+bLz2UvY9NDCBkljDd0yMPukjBzSDk6fFh/l9oP+g8WnDvkKIUIm2XksH5ijOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egKced1f2NuQf0bgJFS3VB67VW9MLqwjW6JrKLQLihM=;
 b=AIVQ2ONRU2TUCFzX7BZLWLDkrSdhDXi+xSeoMWh0xZbM0LUmjufPPB45l2cqbX0r/6Eo2A4p1TOIlGPU4LTljATOoD47ezzNxpaYo0CrIrR5CBubKprWxfHAgRz2FK0f3zzguVBvAEuXhBeIr38SSZqMqtDX/RM3JS+mMk3uR2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9258a65b-c980-9b0f-e704-c51d83db4ce8@citrix.com>
Date: Mon, 19 Jun 2023 17:25:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
 <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
In-Reply-To: <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9df8b6-2d51-4f62-477f-08db70e1d86a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kzyUH36Gx7/msMJmGAeUy66mLozuMxo6SGNFTzWxSK4AR1Bt8xRzQKr9nvVZdRJccPwMMe2ZvV0ecsaDKKOdsMNRp+TBp63ecPfs6C7S1kwb4m2OfugpY9hOYTTdYkFYOvz+EHg92GfmIyrBHvJ1GguU83BPD+lNT+s3z+uxfNJHdCVucr+rglll7fO66S6LESd8S31/DmT1yfxGiaEKvrtoZTscXTcF5rVOaeZ0XiRuMHb3PxLArRGnyxIOMVUF87be/zOreObbZ4OO05CQ2B2LM52FXgSZ21mJNlYt84pW1vaq19GsxIYIm4br56Yn3QELUORkM1xNU1ucQJXyE8VY9S0J6tfloslHVtfQBu8g6Mtle93lLOY+/s6Z/PQd4dBPjvnkUtT0xGJ+jE8qsARNZg4MK9wddHVCmBmPaaUtd7X3274vGKUy9o98d/X6L4xc0FsMKZqmHA5/Z6NkQlC5GCL2JezamuuGVlHTr4vi06v256pQf/8stQeaXO6XDXHDpUeF/2LtJpP5SPmuFNSPbORVnNZCDjNdTf9U9IUrY/7Q8nCf0ZalQpBcF+VSysCxbq0QA2/TY26uEJT1Nhf+nr8aQKhc+N/sUQfbrpFjt30LdZvkpOd5mE8Ln10U9Wd5p1n3PPVYP3jlAyIhvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(4326008)(54906003)(478600001)(53546011)(6506007)(6512007)(26005)(6486002)(186003)(6666004)(36756003)(2906002)(8676002)(41300700001)(8936002)(66946007)(66556008)(66476007)(316002)(5660300002)(31696002)(83380400001)(38100700002)(86362001)(31686004)(82960400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0w0UkQyQXBWTm91MURMaE9lL1V4TlozUUl5aU0zKzZ1cHd5dlVBS0lXR3NB?=
 =?utf-8?B?ZHliRkJYS3lwR21SdUF2NkpuRFNZZnZ6eXlFUUJEb1BnTGNEWVhlNHhqbHFN?=
 =?utf-8?B?V1p1VzRtTVpXSVBFQUd4clF2c245ZDlJSHdMMmkwT0VJVnA0ekxIdnIwMkUx?=
 =?utf-8?B?S2hpTGNGWmFqdHdIQlI1UXh2c25ZRk1kY1p4TkVmZmY0UWMyMExTeG53blgw?=
 =?utf-8?B?bzAzeHRpWThMYjhYN1UzVVllOE5zQ1hnN0Z0Y1FYZVBsbE12bTdFdExkM2dU?=
 =?utf-8?B?c0pmRmdBNjRlU1pTeXRpT1N3RnFzZEcwQUdsTmYzbTNXZjh4a0g1OW5ub3ZR?=
 =?utf-8?B?blNoTnREMHJBNG5Nd1ZtWXBEYmhlUVBEMTZVcm1uMEhINlZZOUFqM2E2UlN1?=
 =?utf-8?B?ZUZpOXN5UXFnd0JRWlkxa0daSzI2SWhXclBCM2pMay9URTdpNWQxZ1lWcjRi?=
 =?utf-8?B?WUV0NUkxNmY1d2x2UzRpVjRjZlpQTUcwM0p1NFFINlQ5Y2U4L2xZUU5ZMnZB?=
 =?utf-8?B?OUV2eW5xTERISmQ0S1VhelIxeVlvaC9uT3F5UkY0REdtUWhtb3FkdzF1aXl0?=
 =?utf-8?B?MXZJZ0ljUFBQSGpJVnhyRnJkQjJ1WHdveWpLQmFXeWNZaWUyQWdhTW1rMllX?=
 =?utf-8?B?RVRjN1hzWkI4TTBBay9qVXJKdUIzeU5jM3pmQ0RpSmRCbGRYczArNlN1Z0hM?=
 =?utf-8?B?N2RpTzg1RGRpNEZ3UzdxWnhMSXBPTktGK1ZVYnlkbTF4amRKSEhydkpVbktK?=
 =?utf-8?B?cTNINWtIU2Z0dlJ4ZUlhakpIUjd2QTVOcXlkc05pU2JwZ3Y4bmh0LytRbXFG?=
 =?utf-8?B?YmxONWRzTTlmOS9JMXEvTTM0dVNoSHJJejdOVjVTQ29wYkZocExaOTdmWVgz?=
 =?utf-8?B?cGF5Nm4xMXFmS3pUN1B2RGpYZmVObHR0SVFQLytNZHNmZ0llM1ZKVFpwMnpv?=
 =?utf-8?B?MXo3cVJmV2ZXeXVtNi9NSG9UOVJSWUt1cnlqWHp0eWNLMThINnZCelZ6KzNO?=
 =?utf-8?B?cGR4TzErcDlRU2RjRFdPVDUrUjlkOUExSWFqZVMzeWxkZ1hiSXpkSzNaN2Y0?=
 =?utf-8?B?bjNWc3ZUMkdFSnJiUWRjZWZGZENPcGZyTWNBOEhvd09sYVpWRE02L1BPWlVY?=
 =?utf-8?B?QzMvVDRvNGFCbDlMbHNKdWIxbStXS0ZkUGk5cmg2bXVZYXBmRE5LS0RXb3J0?=
 =?utf-8?B?cTEvWlYxTnpEWmhEeGhsYUV4cjBiclBmOHJ2T1lJRlduTW01aERoUTNCSVcx?=
 =?utf-8?B?LytYTSthc2dLS2s0OVRFQVNtUGdLTjdvWUNoRUdwRFFsSmFyVWNCREdZWWs3?=
 =?utf-8?B?elNkZytWMUp6QXdUbit4MzAwK251bGpRQjB0aVJVbllvSHhMM2kxOElkMG9l?=
 =?utf-8?B?bjFMdkZyblBjV3JtbHZBeHZaSGo3cHl0N0pZT3FZS0hLMGFFM2JNUmxibDdu?=
 =?utf-8?B?MlcrRHF0U1hlRTdXc2lUUTRHZGhBLzE2TEhQdUNhSnZPUk00dXUxempaM1pq?=
 =?utf-8?B?blBhenZpTHRWRi9oNzdiOFZaYm5ydmNaNlVHSDJwRE5Galljek9menNNbnUr?=
 =?utf-8?B?NWNNSWM4UWpIQ0Zpbm9WZ281M25aVjJiNUx5WnRqdGlrclJnWU1ScDFTTUk4?=
 =?utf-8?B?Ty9veklZYmdaSWQraUkyOTNscHlWL1ViN1VmSFFMSWpydXRUNFhsc05xbDgw?=
 =?utf-8?B?c3g4RktUYU0xdzNkcWh0NFdwdWJ3aitIQjNVbDIzZjdjYVhmVGtmY1NzK3Er?=
 =?utf-8?B?RHF5NkpPUXl5b2dCaXZnd2pYdWJrd1duMmFJZTM0eFQ3TStLZitJclRINnFm?=
 =?utf-8?B?eWUwRUljSStLN1U4bEw4YjBoVjVYd3VhZ0grYU54bTRJTU9BVzFSS3VYQmFa?=
 =?utf-8?B?RFh1a01VUWpXWlpvSU5RdVBTQlpYNnJvRnF4NTNSZXBlaXZZYXlrUlRGSkFI?=
 =?utf-8?B?MENIZk5RWGZZNnhBY0N0dG0wU3FqaWkveGpPVVhyQkdxS1NGTVFFNlNWeGlq?=
 =?utf-8?B?dmFsT2tFejl0VHg0bnZ5eFFLRmFVOXlBMlBZeWNoSFFyS0JldmRuT1hMWTJz?=
 =?utf-8?B?WnFweHFlRXpTVUhPK3JVMi90b1N3K0lsd2JWQjhNY1lRY0JlS0JRam1yM3o2?=
 =?utf-8?B?U3U2ZEtvTTZhN1p5STlxcXBkK0RQOHJKUWdEYUdiODk2aE1Ed2VKV0ZJVHI5?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pZ69/AYmTZXAgiwEIzTiSQ/U43r4QY0l+zyC3qCvY6njGpYRYqIWRdOXvdd9rLdDqkjuG5zr+Hwu2C4ouUQs48v6ds8T8Rs7sWDb7KHvFED6/p2YTktyzO17aIdm+JcnfbzGR253KXqy888t0uG68gtC9/rGAwsA2F9Y4IL3sDzPpmPvSQQf71BPB/VSF0TnNaY5G0XWxGs0Dm3B/AmBCDPRx8DBeJxAEgm+8q32Qkj35XLIMX1Jp7MS5w+5RipnD8JXLpXee2rB/j5scXmBM91gxzDt6TOqjsnTqtIh78RXWtg9jKSK6sRjVhxJalBLeBgUqb1pm5SnvTocAIY8U2l6R0dbzgH2MYhujXCsVZ6ZVcv9zugKHDKbEj82suHDD+mur1ahi7lqTScXnLjRfhPN2IUQa280Bfeoe3aoizkOuCIKG1eE2rlL403JAY12+Wdjr61Chw9nVh2xPag3aCBYkknvKVmJjQ5fydA2lFp1gNnWHEes6BWIJ2kFjfveOymSb20eyQq/Osoy5GPoeDY6DLOu4cyePrL8lZ/KORoFLk5125mynRbu6gBs+sDTMex0Fv/OYNcQ2eY0JblSHbkeO/VK/6koa3t3WSqUcJ9ver4V7IfXTt8Z0Q3Zso0rN1U4ZYu9L+6Iba7MaDFyVCHKMuwn3BLSVK/yuf+r7apGcvKq2PlGOOtHehmaErjY/sfDhVh1Vo/DDInz9WUfS+iXyGH9WV7IpxSZNi7hH/B1hKXbBc0/PMvWLVVLyM7iiV3Hacxcz6nKBhMMqYrAN6Wuum34eRpR/LaLp1OBW6vJ1FCa07bY567BHzkU+0FuzYnbzgkK2wHC8UgiqgnYURFmzOPBv2VN+d4x3lMFMbSlE8ohwMS7BYeW7++VRuIm2ncKbyVM1AqAB7jX775RGVkfS4xhEN+H4pASToVFhTs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9df8b6-2d51-4f62-477f-08db70e1d86a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 16:25:50.6870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZw2yMA2sNhRDMBl4BXqRvXCoylYTjo6oNsWuxQKOI1lHzZKtY00toI27XkWbkJLoUv8TF/4d1tCbtwnuALO4/OxTivqtVrcUiBNleYp5jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6380

On 19/06/2023 4:49 pm, Shawn Anastasio wrote:
> On 6/16/23 3:24 PM, Andrew Cooper wrote:
>> On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
>>> Add the build system changes required to build for ppc64le (POWER8+).
>>> As of now the resulting image simply boots to an infinite loop.
>>>
>>> $ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
>>> $ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen build
>> I think the first of these isn't needed, given the config ARCH_DEFCONFIG
>> default.  I'd suggest dropping it.
> It seems like the build system expects an `$(ARCH)_defconfig` present if
> you don't manually specify a defconfig target. I see riscv64 has a
> tiny64_defconfig and a riscv64_defconfig that are idential, probably for
> this same reason. Would you like me to take the same approach of
> duplicating openpower_defconfig to ppc64_defconfig?

Or just rename openpower_defconfig to ppc64_defconfig ?

Is there any reason to keep openpower differently?

>> If that's not feasible, then fine, but if it is, it ought to be the
>> default.  Which might be as simple as saying "or later" somewhere in
>> this text, or might be a giant can of worms that I shouldn't open...
> Originally the help text for the two ISA config options ended in a "+"
> but that was deemed ambiguous. Would adding "or later" to the help text
> for the two options clarify it sufficiently?

Yeah, that would definitely help.

>>> diff --git a/xen/arch/ppc/include/asm/page-bits.h b/xen/arch/ppc/include/asm/page-bits.h
>>> new file mode 100644
>>> index 0000000000..4c01bf9716
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/include/asm/page-bits.h
>>> @@ -0,0 +1,7 @@
>>> +#ifndef __PPC_PAGE_BITS_H__
>>> +#define __PPC_PAGE_BITS_H__
>>> +
>>> +#define PAGE_SHIFT              16 /* 64 KiB Pages */
>>> +#define PADDR_BITS              48
>> Is 64k the minimum granularity?  Or is 4k an option?
> Both 4K and 64K are supported by the hardware.
>
>> I ask because Xen has some very short sighted ABIs which we're still
>> working on removing.  There are still quite a few expectations of
>> PAGE_SHIFT being 12.
>>
>> To be clear, we're looking to fix all of these ABIs, but I suspect it
>> will be an easier lift to begin with at 4k.  (Or perhaps the right thing
>> is to double down and just get them fixed.)
> Interesting. Given this I'm inclined to go with 4k just to reduce pain
> points during initial bring up, though supporting 64k would definitely
> be desirable going forward.

Maybe keep as 64k for now, with 4k as a backup if major problems are
encountered?

I honestly don't know how much of Xen's common code is non-4k-clean, and
this is the best opportunity to find out.

>>> +
>>> +#endif /* __PPC_PAGE_BITS_H__ */
>>> diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
>>> new file mode 100644
>>> index 0000000000..3340058c08
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/ppc64/Makefile
>>> @@ -0,0 +1 @@
>>> +obj-y += head.o
>>> diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
>>> new file mode 100644
>>> index 0000000000..e69de29bb2
>>> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
>>> new file mode 100644
>>> index 0000000000..0b289c713a
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/ppc64/head.S
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +.section .text.header, "ax", %progbits
>>> +
>>> +ENTRY(start)
>>> +    /*
>>> +     * Depending on how we were booted, the CPU could be running in either
>>> +     * Little Endian or Big Endian mode. The following trampoline from Linux
>>> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
>>> +     * endianness matches the assumption of the assembler (LE, in our case)
>>> +     * or a branch to code that performs the endian switch in the other case.
>>> +     */
>>> +    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
>>> +    b . + 44          /* Skip trampoline if endian is good  */
>>> +    .long 0xa600607d  /* mfmsr r11                          */
>>> +    .long 0x01006b69  /* xori r11,r11,1                     */
>>> +    .long 0x00004039  /* li r10,0                           */
>>> +    .long 0x6401417d  /* mtmsrd r10,1                       */
>>> +    .long 0x05009f42  /* bcl 20,31,$+4                      */
>>> +    .long 0xa602487d  /* mflr r10                           */
>>> +    .long 0x14004a39  /* addi r10,r10,20                    */
>>> +    .long 0xa6035a7d  /* mtsrr0 r10                         */
>>> +    .long 0xa6037b7d  /* mtsrr1 r11                         */
>>> +    .long 0x2400004c  /* rfid                               */
>>> +
>>> +    /* Now that the endianness is confirmed, continue */
>>> +1:  b 1b
>> .size start, . - start
>> .type start, %function
>>
>> Lets get the ELF metadata right from the start.
> Good point. Following the example in the Power ELFv2 ABI
> specification [1] for function type annotation, I'll place
>
> .type start, @function
>
> in the ENTRY macro. It's not clear what the difference between %function
> and @function are in this context (my toolchain seems to accept both and
> produce the same ELF metadata), but the latter is more idiomatic in
> Power assembly. The same goes for its placement before the entrypoint
> vs. after the last instruction.
>
> As for the size annotation, I'll follow Julien's suggestion and
> introduce an END macro.

There are reasons why this doesn't exist/work yet, and that's a swamp
you swamp you absolutely don't want to wade into at this point.

Just leave the raw annotations for now, and they'll be cleaned up when
the bugs with the various proposed options have been fixed.

~Andrew

