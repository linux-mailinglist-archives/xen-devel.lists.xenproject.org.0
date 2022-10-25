Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3536A60D116
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 17:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429943.681299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMHu-0001Lt-70; Tue, 25 Oct 2022 15:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429943.681299; Tue, 25 Oct 2022 15:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMHu-0001Jq-3u; Tue, 25 Oct 2022 15:56:22 +0000
Received: by outflank-mailman (input) for mailman id 429943;
 Tue, 25 Oct 2022 15:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onMHr-0001Ji-Vk
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 15:56:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e545d6c-547d-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 17:56:17 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 11:56:13 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5723.namprd03.prod.outlook.com (2603:10b6:806:118::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 25 Oct
 2022 15:56:11 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 15:56:11 +0000
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
X-Inumbo-ID: 8e545d6c-547d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666713377;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qhDVEQCqv5MoZEpLjYCa+JM2j7X4cMiI1Nt8svj+FOw=;
  b=ZxDhrNk9aMAQFE2WaDupo7OUV80dmgJnBqoIcRx2gqtClOSMFQhAepjk
   Mfz9GkAUCo7cWCS27f1EaGaQ7lZtxIiRzIsQLudjIiDnDV5eEiqVAv/Uy
   yl6J9c/2u0cCG/TYPQzG6OaP+Qn5eurqOHAmTWPgI8QfS7wADQ0fQK0G2
   M=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 83092869
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZmoSTKMQ8YO/F0vvrR2UlsFynXyQoLVcMsEvi/4bfWQNrUoggzBRy
 GMcXzuCO/eIYmGgfNx0ad608BkD6MSAmoVqTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayo5WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eJLcI/cNFIkJ3q
 9M5Mx83KRGPisOd+efuIgVsrpxLwMjDGqo64ysl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF+RTM+vdfD2v7lWSd1JD3N9XYYJqSTNh9lUeEv
 GPWuW/+B3n2MfTPkmLUqCLy14cjmwvKR98yEKyHpsdrjVaBzV1KVjQMVgWC9KzRZkmWHog3x
 1Yv0jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wwufHHlCcTdHZ/QvrspwTjsvv
 neLld70AT1ksJWOVGmQsLyTqFuaISEIKUcSaClCShEKi+QPu6k2hxPLC9pmTqi8i4SvHSmqm
 m/X6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHY1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:ep8W1qoPBjMAcxSQSLqrXcgaV5uwL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCAIqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP8f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aiSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7svVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wU9HdwGOtt5Dt
 //Q9RVfYF1P7ErhJ1GdZY8qOuMexjwqEH3QRWvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83092869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJFLYY0WfGyJLqG8/M+Mf2qDYbG1c0dpdMF3H1d+MJhWtOzD0oOUGuUTLuFP8zX3iYDsffOVl6yYYY+9dFEdCdp2BbLS/UYUBl2ObxFdHNH6x5+334ZdHcV2bW7nx5ZUw7VDdSvchSdGJagTWoMIi+HaRP7+Mj5sVq5Il1xgZKtwpFiR4Rxmd/dP2tWs3GZh7XHULIJt3f3aDCnEREf5M5Dnjw8Gw4DKI/G5XXWHiqu8Raf8oCfr4VK1ZZhyIPkSq46+QNgx8bwKhC2dUOpxWOF6g6GBZScv0zMXO/B5miEePWr0WQz8qbJ9hXeSpaiJNyjpby8mamg8bfqxw1ex9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZDuQFHlEQoie/vc/suoG/q8KQHPnYsiOMUIrMzgcAo=;
 b=gFbNKCR4Hf8/lz2jpryJd+BqLbhY7atZ2Jjh23oYj2Bl1mVMr0WujcnZ2FUPK6KXQk+q+ri+zQ27kr87XUQHwyJvNwvDpfjSaW0ylj4OJcZC+0FOw2I5AHCI6pEvDA2GuJKI6Q1ZeZZqxZLpXffvo/6L1/H6Ms4CRiOazKfNFe+oZWswo5135Bks+4hCHug8LPK3LFIQtv4SGz/0K5Ku8hBRfxWCp0xGQ/7/NJVD7OK2mkCuiO7LlipDogVliH3DLKcciwfVEvuTbqszh30lvxQPE9xjMTeH65ZZxsGxrE2EssZ1n7SN8JCeOa1w7vgPpW/96KvzuvYkQevQFnT5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZDuQFHlEQoie/vc/suoG/q8KQHPnYsiOMUIrMzgcAo=;
 b=h+GI2eYRazEGLinpFc7JTzd3yUlIp86u2OB4FmGs5t7PYri5BQikiB+UVbpDiEXEdM+LL8TTera7pPqwBLHZuA1bE7IvpI2Kj/Rf9LXs/Ldnvhsd+pyl16z+Ekn+ggPXofCaE1N0fKweum0EmgbJywSyrYybWBxEH/y5+oD4jeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Oct 2022 17:56:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.17 v2 4/5] pci: do not disable memory decoding for
 devices
Message-ID: <Y1gHFmKzht0KYR5/@Air-de-Roger>
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-5-roger.pau@citrix.com>
 <46a361ba-121e-a054-da59-512e0fb6eb70@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46a361ba-121e-a054-da59-512e0fb6eb70@citrix.com>
X-ClientProxiedBy: LO4P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::7) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 31cbbd66-5066-4211-a134-08dab6a16fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8e7Yn8yc/r+U4WOLxhRfMfaZYtz/OwTOHD4UEvtvjFKYO8XLRTeieccca1j7+1g0R4FRbxLqpuLcMm6GEsmlndMYbVmG/s/gD7E0Z++sDSPTDvE43jod5qkdLrtHHTbYrVrSu3snxJWh/NVACln4FT/DsujbobSa7xhMMIVEkXKNpu/G8GwW0QR7OGRqPe7etRFSxU5AKjKieJOPBAFZYShqh7Q2F2bbmMazmS0yV2Jyz2KbD1lPNb/+4oQrz/i4N69yJRtpMVNI8ZToDcsJJljZgmFIdqF0YMfAg2CIoYduW9v2AvbivgDNGYMrXVFWIwbrq78lnVa1amY6Gx+2OG6c/yRrvAZpmk/JqcSxGENIn4OMlFVGIhgtKlKLgxTizB+c3yXLMmoloQu7ImFH8eFfoRfl82N5cJabWt5vwmURWh7WwrNTYDfy9Q8bJoqUO3gn7PjtlZ+w2Ecjp38ABAhpU66XXfeXxE/FgP9q8Cyy+0KornWnj3gATQba0SHfCr1uF/B7dJ6jPoSBIsHLgvSrQ+TDnbolUHc1oar6VN4KU1F+KDnCAz1dU+9MSeguLWgGl9uJzvencq5e4SkvxIz0bjNzP2Oo79PdYa1mrZpqzoM2h1L5NjQJXFe/iUgUy3xh3rqvDwiMG6TIHSmR6Oz1TNcaJ0oWzK4FLAzk4r2LnWXWqXWQSSMy8Y5S4O/VS/zuc5XaqlEB6/vYOQKSug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(86362001)(83380400001)(6506007)(186003)(82960400001)(38100700002)(6486002)(2906002)(5660300002)(33716001)(41300700001)(6512007)(6862004)(8936002)(4326008)(53546011)(6636002)(478600001)(66946007)(316002)(66476007)(9686003)(66556008)(8676002)(26005)(54906003)(6666004)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm5wYmlneVM3NEpyTDNJUFFJUE9Mdzk3VHhvWlVUV2FxMmNYL1pjWVloRDE4?=
 =?utf-8?B?MmRtUERONmtTTndsUnp2QWp3bXZyb3lNTEhLR0R5dXB0NVhpRUl6bWhoOXZD?=
 =?utf-8?B?WW9idGgwSGdYTFptUVBBcDh0Skxvc1YyeS9OWWtJZ3QrOGdzRXZoa0JqS3A5?=
 =?utf-8?B?cEpnQ1QwK3RjM3YwblFUYythSU1WaGhEeHpUaHNjVjNBR2phdG9ZclBhZndq?=
 =?utf-8?B?WjM5aXg4bzNHYU1iZVJsWjg1R1RkZE4zRU5kb1RiMy9aNkFzaXdCSGxaYjd5?=
 =?utf-8?B?Y1lrdk5GZ0dYVjVMR2hCNDZ5YTdwWEZGc1U1NVRCSG5oMU04R3k0d0V4d1Rs?=
 =?utf-8?B?RGI5SlRRbGdmaXhZWXgrNzIrZzVJcm14TEFOdTcza21JL2VwenpwMVdMM1Bs?=
 =?utf-8?B?TnNOa0Y2ZWphUDg5b1dGMlNiaDdPM0sxc0FsYXdnV1ZRc3FqRXZtRzlidktv?=
 =?utf-8?B?Q0lFeG5jWkRhNm1uSS9LRnhJTjNBUlREUytSWklhRXpCcytjUUpxR2hyaVFR?=
 =?utf-8?B?RnB5Q0xNK3Q3STFobnMzcEFBVmEvWWRLZ1FYSmw1aENSWmcwUGhWRGREOHlQ?=
 =?utf-8?B?N1BpTVdNZE9aWEtKbjdzd1RjOThjZy8rNlc2ejI1SEVsUkV6OEhITnRmSXd4?=
 =?utf-8?B?TnZ1Y0N5eW9leWtmU1VZd3dGTTlFeWxvTUhobWdLUGZDOFVhZUltdTI2VC93?=
 =?utf-8?B?SUovWlhpNkpDT1NTWWE0VGFla2laS2lJaTUvQXNRVEVtcHgzczYvODlKU052?=
 =?utf-8?B?NUZLeWYrckNhS0VNN2dneFRmQUxQRGQyeHJHUUowTFNlZFkxZTBCNnZaTlNz?=
 =?utf-8?B?cVRPVGdFUVV2bXE1R1dHWmtEdWgyOVdVWC9ZV3ZHU203WUhVUHF3WTRLTVJL?=
 =?utf-8?B?cS9JSnI5TEJKMXBvc3N6TTBTQUo0dVFNRWJVQUJad3N1c3p2d0dkYlJ2RHI2?=
 =?utf-8?B?VXkwSEFaS0d3ZFZxVDNlNjRSRWpaanNYN1g5MDZ6dzVnNmR4STg3cDJ6Qm5N?=
 =?utf-8?B?N3ZXQThUYW8vZ2lmS0VwR1dYVnBtNjlaQmlseE14OEs1clpWbnlibjFObGhp?=
 =?utf-8?B?OEQ5Z2dZVXpWNW0zQk9uaVpPa1NHSEoyL2lDTDcyS2V3cWNUNCthalBkOVJx?=
 =?utf-8?B?WHZmYjcrM1hsRjk5bGNHSGg5Mm00elBFUVpsMkNUVEdINVRMMzU4M05CTmQv?=
 =?utf-8?B?VFNXSmdXRDVYUS8wblRRTllDVmY3WjRGQmV6Z3Y0b3ZKcWZUQmhMdmRjcWZS?=
 =?utf-8?B?V3dieDd2emUxb3M0aUxXTVZqTlF0eGs0VkdsZGxuZ3VJWElITzNCT0JBWWQ5?=
 =?utf-8?B?c0JGdnJ5bzJMdFlVT0s0Q3pQT09FVHZEeDdWWnNXQmd6akpYcC9mT2hpWFBK?=
 =?utf-8?B?ZEs5RXR1aWZTZDczdzM1VXVwakJMQlRISW5BMmVJVUhvWXhnemppTUYrR0tT?=
 =?utf-8?B?Z0llSUR1TnppSUM1THY1QlJVMnJZT1BjeStWUlJLbnZsYkgwK0VwUFBibGgw?=
 =?utf-8?B?aUE4RTJtSGU1TWg3eUQ2cWhyZXFUMzNqb21SUXVMRHlmNzlnNkttZ1JTT1dP?=
 =?utf-8?B?REJSVk5SZzRSeEw5bU1SUlMwSzFTSjAzaWxFRVN2M21iZ2ZZSitlUEZvNUFk?=
 =?utf-8?B?NUsyb09JSno4ZEtNT2xYT003czFwdWZiNXFvS1FaaVlTelMzTENWMmlqMDNM?=
 =?utf-8?B?U2lWdDZldGQ2SVdTUTl5bk5xd3FIVExVeEFjUnZVK0t3ZFZmN1VUcE4rVWR1?=
 =?utf-8?B?Zk1xa0tpaTN1SUpjdGRKT1QxNE5BeStkV0NRdkY3ZXVZUk5YdjdVR3h0KzEv?=
 =?utf-8?B?RzEySHRUN1RGZ3plSnlEM3NNS0Z2WWhpblJwYkNmcGJMRDljb0FQa3BBT2VK?=
 =?utf-8?B?Z3drRkFOdDBzWXBpNWRoTkJXbzJ6OVFRd0ZScUdtTWFtZ3BiWWNnNlozbkM4?=
 =?utf-8?B?UFZoRE9vOWNma0oyTXNnM3N4YlZQNEpLYWU0WWdIMVFEUTJoQjllRzh4K1V4?=
 =?utf-8?B?QVkycy9oYVo5VUppeTc1WWFLOGFHMk1hM1hraHBNVTRhQ21zVXpaeXA5cXpL?=
 =?utf-8?B?YVIzYmk1dU15d09IWGFGKzdTUndGRzBDeTRySnBsK1ZNVVVDSkZvWUdUR1U5?=
 =?utf-8?B?TVBCMWJROG5lR0QxajJvYVg3Z3E1eHJqVFdsR3cyeXlhVkxDUThodjc1QmZq?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cbbd66-5066-4211-a134-08dab6a16fe0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:56:11.5577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioquddsLDVWqfujB+nzu28DHkUva4M10MY7F6EMttwNLmbVtWdIX64kHjq/UYWt7qI1gOdJggp/0PwhszxSACw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5723

On Tue, Oct 25, 2022 at 02:57:57PM +0000, Andrew Cooper wrote:
> On 25/10/2022 15:44, Roger Pau Monne wrote:
> > Commit 75cc460a1b added checks to ensure the position of the BARs from
> > PCI devices don't overlap with regions defined on the memory map.
> > When there's a collision memory decoding is left disabled for the
> > device, assuming that dom0 will reposition the BAR if necessary and
> > enable memory decoding.
> >
> > While this would be the case for devices being used by dom0, devices
> > being used by the firmware itself that have no driver would usually be
> > left with memory decoding disabled by dom0 if that's the state dom0
> > found them in, and thus firmware trying to make use of them will not
> > function correctly.
> >
> > The initial intent of 75cc460a1b was to prevent vPCI from creating
> > MMIO mappings on the dom0 p2m over regions that would otherwise
> > already have mappings established.  It's my view now that we likely
> > went too far with 75cc460a1b, and Xen disabling memory decoding of
> > devices (as buggy as they might be) is harmful, and reduces the set of
> > hardware on which Xen works.
> >
> > This commits reverts most of 75cc460a1b, and instead adds checks to
> > vPCI in order to prevent misplaced BARs from being added to the
> > hardware domain p2m.  Signaling on whether BARs are mapped is tracked
> > in the vpci structure, so that misplaced BARs are not mapped, and thus
> > Xen won't attempt to unmap them when memory decoding is disabled.
> >
> > This restores the behavior of Xen for PV dom0 to the state it was
> > previous to 75cc460a1b, while also introducing a more contained fix
> > for the vPCI BAR mapping issues.
> >
> > Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > AT Citrix we have a system with a device with the following BARs:
> >
> > BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
> > BAR [0, 0x1fff] -> not positioned, outside host bridge window
> 
> This needs a bit more explanation (even if only in the email thread). 
> The first item here is permitted under the UEFI spec, and exists on
> production systems.  We've got several examples.
> 
> The second has only been seen on an SDP, and is hopefully a firmware bug
> that doesn't get out to production, but we should boot nevertheless.

I already saw the second on production systems, as is what triggered
the change in 75cc460a1b.  I might not have seen both in conjunction
on the same device on a production system.

Thanks, Roger.

