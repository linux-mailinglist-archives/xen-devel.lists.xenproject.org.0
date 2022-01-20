Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B84495055
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259094.446903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYYW-0005YZ-AS; Thu, 20 Jan 2022 14:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259094.446903; Thu, 20 Jan 2022 14:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAYYW-0005W2-6e; Thu, 20 Jan 2022 14:36:52 +0000
Received: by outflank-mailman (input) for mailman id 259094;
 Thu, 20 Jan 2022 14:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWAP=SE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nAYYV-0005Uv-98
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:36:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65d1f4bb-79fe-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 15:36:50 +0100 (CET)
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
X-Inumbo-ID: 65d1f4bb-79fe-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642689409;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=g0mAIj/miRkXe2caaNAAPVIBGk7414vyJlyZ+Ry5c8w=;
  b=U3uOc1kyViPKyI/QUgYKZ/1EyZ/iNRFd4bbeSmOAYaJG9GXbA9p2Z2Ch
   hjcUD5r4feILRFd00basQZB/bkLwmmTBvKwogIJfEw4Q05wM2vcLUBmPW
   nv3n6h4C7j6BkHuatJc/FMU2jz16nTmnZdCI1fVkrZDL644INRr/UTiT6
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IPdmqKRIb6wZkvGOtwogmEURHx5OVdjDmZcQTie/T+Ulqe6wvdXOI8rvCxapY3sbqJw9Mox4t8
 eDEWezNfrf/Hs1QuBSxR7m6mqSzYlnFG6CPNSn023bQLSPwxeYE1C/K5CJa10hakPE6r+hDbqS
 OK/s1vNUbE0dfnhrxO+HgOu/Xr4e/inAyPQUNlUn+pHdzo0Gnah8+kABCk/l/J/HUBhMugYNmo
 aswt8tMWo1WVFZsqphNUvuVezqLaWMnO6SEpSfZzF1dDWSGhF7vdJFNpYYACR8inmwX+4jiiwF
 FxwmJB7g47SKfH5/jjWMGa0M
X-SBRS: 5.2
X-MesageID: 62812844
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:URVOB6y6GOOFO5RE8+p6t+fUwSrEfRIJ4+MujC+fZmUNrF6WrkUCx
 jccXjvTa//cambwKI0gPY3n9EpS6JWEm9JhSVBv+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRh2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9R81
 9VKjJO5cAF3brXMpt5GXSZAQi4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYECjG5q1pwSdRrYT
 5AUbx5odR7aWBpoYGwHJZMemeyGrHaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQpHObvhklVNNpFbNq8AGz8PHa3B7ICT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkuXFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNslIRiG2NPdXABb3nARBodtrxor6p5
 ilspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/J94Jv2EiehswYq7onAMFh
 meJ5Wu9A7cIZBOXgVJfOdrtW6zGM4C9fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iNyE7AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:VyhnkqiW9lazWFvIH+ZZrOAQ9XBQX0J13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhPY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX212oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iHnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegy2w
 2LCNUtqFh0dL5kUUtKPpZ0fSKGMB28ffvyChPhHb3GLtBPB5ufke++3F0KjNvaDaDgiqFC36
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,302,1635220800"; 
   d="scan'208";a="62812844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLIHEkL/fxBtPZoEbnsH3NUMvx9b6ryvxB4BsJaTwa0RdSTzDuK1pJHaibpPMyf+fnGBHj2E0oV92p5fOff0U8/RFeou2Q15fDt4v7xHgW7FE3o/peXY7n51zVXet4yYAi1Z1btREXSvGty+wWjY801bQyoM3btdrH+e9wcJ5V4WJVoYIPLbPecoiWfMBP3Pmrla62eG/f8csxrgoYNwAc/fa2ixMR0jr33spnOMMQzwfdT4jYxw5ObCdQrGKK35ejZj2hiQLdKHIXs7Y2mnrMaZFR7IYTmLFl1XtUfVqLP9BAPDvj6mB7av951fIfUwXCMgBfxunuKQCq9/nvjBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPu2S20TcK7BHu1sBS6A+eq0k1n+aL7CvPvQeM5bOZI=;
 b=kFKmnfzTXgmx1douI3iguIDPOix3FVmMSqjn2G5jk9HSlylf3cf9rHYC423T2LYIXwXXeApNKbGy3Qj1Uymsgjhl3Gb2kQk063aTzo8cI7MDJDpEd/2LryQ/DQFtuS+w48qnrxsdBQWdEG5PCsYKit8Qdy0A6U0x8MYuOScDUAFV6hhP1ndwk6Ltwp+oTCZ/0wx6ZmImbTg49JQStUrIdkytvmrY7ejqQAP5ghsWu6nSsIhNyrLbjFrSRoP2LvSeqqFDUhnKenxmlA4aZu5Q2XezF8ofe0mxLPtM5aUm8HuuCRe8Pf4gAKoJrc7YHKIctXB9Pt94GgpjEmRqV39P+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPu2S20TcK7BHu1sBS6A+eq0k1n+aL7CvPvQeM5bOZI=;
 b=lg1czPZAT7bOQ+pNZ96+11VaKmd4C+AL6KMedJXw53SAGhNoIgx1NIS7VTJB7OuLN0+XAKW0/cH6iCOwMGoieIhNcx9VN8Z/aiSjHkeLNur9Mpsrw46c6sPOvdnC/niX53G2H1thCW9u1oVitHVsNWXIHYGrsqKSeFsUqpQg7bg=
Date: Thu, 20 Jan 2022 15:34:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/5] x86/mwait-idle: switch to using bool
Message-ID: <Yely3M3XMSw4bJVM@Air-de-Roger>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
 <79cc9a46-15b1-b2ce-e462-7c46848a86fe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79cc9a46-15b1-b2ce-e462-7c46848a86fe@suse.com>
X-ClientProxiedBy: MR2P264CA0091.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a47257c1-625a-4251-e148-08d9dc21ec29
X-MS-TrafficTypeDiagnostic: BN6PR03MB3282:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB3282244DC22CFFC0809D49B68F5A9@BN6PR03MB3282.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBodrt+l3P/fVueBp+nAM46WjwQeIneckI90s2cVR6MbHyozZzq/8bCKwZFUcVMYl78YL3JEovrbR/zvprm1YB7FQtTGgES30HtNkbRRX6IZZ5pOE5nOgZ3mPnVJjB+saMgnuYvA8OCQWYYcEWp9qYjCKJNJv9hRXftZsxRoUFsU5rBSOZ6p9IKz+fd+InbwVu59BSskyigwvv5yDHKN+Nzi/FqZ1/sTC6BvcMaWOlqvd6qfldwyTBKtp8vBDczjwVPBmexorG1RARxc84OGKyr5M3eO8KVrGOKGblR3DObL8el6BWDdS1FetIhQSsadHYhbtvYxYC70MuiTrn9UXICApwtPOPB3M0/sZLmVyRuUyYrxQEX6PZuJ1zA7BigcA6eYBXmTc8yh+4TgefjI7trL4fLYkAjiAISe5v4vwE2iWNEEbjzrgNZEFp4QPQx7WujbSlkQtPRSLaCxvhUoH9zpIubgv75mVgS/A4aa2iZD8YHuw7kQOOlwR+PwTRvr50fCtDDVxv5fzshNQ2Ho9ldWUAMXrvAmdXKzue46wgLwswJ87XI1g5yrmY+hy6g6z9cWATTECtLnZUgdmAeJ0ojPLNyLr8stQHfhBt92q4f1oml94uCGQ/oxbb/849pQMfaNuUEEi71ZSOo1Q9+05A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(4744005)(6512007)(9686003)(6666004)(33716001)(316002)(38100700002)(5660300002)(4326008)(54906003)(86362001)(66476007)(66556008)(66946007)(2906002)(8936002)(508600001)(8676002)(6916009)(85182001)(26005)(186003)(83380400001)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1IzK01EcnJHWkpjOXpTdEtLOTlDbnp2eElqZmMxOVpXaVRrekZOM0EreG1q?=
 =?utf-8?B?a1F1NklPczNmV1dxYjc5eStoRWpCZE9iRCtISVBlMkZqVzM1ZHNtcEFuM2ty?=
 =?utf-8?B?c0JMODB1K3lJWEl2WWRHRHR3YXNTOWo0QzBmdW1Nd202MUdtcnZEVTRFS2ND?=
 =?utf-8?B?Z0IvM3JidjJlc2QvUzRBaWdPUGpaREhkNHYxeHJrRXBDY01IaWMzcThtZUQ3?=
 =?utf-8?B?akF5SkVGT0dmRzdZWHpzWlZoRTlQY2V1a3BmUUsvdXRoUksrbU9wbmw4anJw?=
 =?utf-8?B?Mjk4QnhkZFUyaEpsQnF6WWFmdFVqVlpEVE4yYUtqdHVxZlg3dVRJVVZhLzBm?=
 =?utf-8?B?a0l3dldSd2pYQVdNMzA5VGJhb0RZUnArSHpqRTBxaHlwVE9MVnFZVDZBT2R4?=
 =?utf-8?B?Qi92a1VYSmM5MVpiN1dYQzQ1OXhwQW9zc0FDcjB4eFRhOXl2dXoxZzR1QmRR?=
 =?utf-8?B?MDRDRDNGVmJHYzlBZ25PdDFOaFJ2OGZEZkRWbDVZd0w3MGhoN3hReDR3THJu?=
 =?utf-8?B?ZS9jL1llRTJudkNtVXFjVDdzeWZmL3pyRVQvY3pXQVU5dlZkMG9OakE3cUda?=
 =?utf-8?B?RHY0NlhTRVdNb3grQzZJRmNTd1ZmLytzQitwTm5XTEFneEg3dkxua0ZuY0xk?=
 =?utf-8?B?UFlrQUpFSmphdW1yZTh1ZkorbnpsU2pXeFhJa1lkdjhMakJLenAxSXN5Y1pI?=
 =?utf-8?B?Z3dSb0pKM1UvMS9NWXEwR0RlNEErUkI4S3RjVFpiTi90WXlwRnVLYk15U2pq?=
 =?utf-8?B?N2ZFb1RiM2lvbVRkWkxrd3hjWFVNdDJGTjlMMERRUjFEUHV5VFdqVVZORldo?=
 =?utf-8?B?VkVDWHlZancrd0tERzl0K3lMd2d1dU9lQ1hBR2NUNzlqTE9HTi9qRnZSRTZR?=
 =?utf-8?B?QmxSa1lFbVY4U2VoRGdQTU5nRVVjb29OV0dCTmE0YS9QL3FWVWwrT1lnaXFP?=
 =?utf-8?B?aHF3anViTHZFQ0FvR0gxU2pPZk1nY3pQMUtib3NIRUxOWkZxL0tYalk2QXFa?=
 =?utf-8?B?eDBmUUtIajBmRFpOc0E1RXdmd2NoSTdUL2ZRUy9qdUwxaFZOTDF4bEZva1NJ?=
 =?utf-8?B?THQwZkJ6UjJ1N2pCTzJXQWpSaXBXYm1qWi90RHAvb0dtbjNUSnRQdWQ2SXYx?=
 =?utf-8?B?WG9Ic2pwUlJBbVVGdE9XTXdLbFIvVDNaT1J6QWpiaGtDMmMyVHRFZlV0dS9H?=
 =?utf-8?B?QUZHN0hZVVdPZHk1Z3RDL1FHbVBlNFh0cUJIZG82L3ZIeWFPaHEvZ1JZRGFm?=
 =?utf-8?B?bzU5am9ndUlFRXF3TXNtNDdqQkxnZHZ6bHlROWtiQWl1RFMyb3p3dnVaNmVp?=
 =?utf-8?B?b09LYUVRcHVHZm96NExSbGpWV21LbmQ4SFFzUDVWRFZJNHhnZWVyK2F4WTdR?=
 =?utf-8?B?TnErbDVFQ3A5UjI4Z2lVRklZMUMwbjhjNkNQdzNrLzQyKzkwZ1ZwdHVGNVp4?=
 =?utf-8?B?VUdLTlBja3VUTHYyZUkvc3pMTVVNOWxLU3llTGRBYkhDWkZxUWluR1pJdmJk?=
 =?utf-8?B?cTBySFFtclpzd1hxTXFvVXJ0R2xLK0piUVZWMUNROGwxMkxCRGdKbWU0OERn?=
 =?utf-8?B?ZEgvWHRiaXEwaFFaa2NjN3NTQnE2c0d2aHV0UGNIY1djVEJzWDJjeW1nL2Fx?=
 =?utf-8?B?Q2d3NzZZYnBFZkR4Tjh6dEluQzdnTkNtV1FGVndUcXcwV092cmI1OWF6cnNF?=
 =?utf-8?B?WFFxSllINXd0WmhpQ2I5Q2lxZFJCdEpKWnJjSkRkQUxRN25QMEFJMVBscnpi?=
 =?utf-8?B?Q3hHWDZRQi9VQ1lBNzlTV1JBb2wrQmkvdm1QM1ZzOUdzR25laEw1VVJ4UFNk?=
 =?utf-8?B?bkhiWWdhZENtWnJVczlTVEwwRFRVRXhXNU9ZUDh1MmFOeTNGeTJ4N3JucDRN?=
 =?utf-8?B?Q2FHbzBaWlkyUUZ5RGFmdkx4ZVc0eWxkNUJVbjUwKy9EbGl3ckVuZ3BzSFpO?=
 =?utf-8?B?SVROSGNNYk5kcGlUZ2l5MktXWG5KSkVzYWtsK2tmTGhKSi9GcFBGTTBoYnFv?=
 =?utf-8?B?QUwyaGxPdXRMK202MXhheXhUcyt5SmxPVVRQUTRZSFJRMXRPNldpZ0p6b1M5?=
 =?utf-8?B?a0hTZU9vUkZ5TEhGMC93Nm5oWHhhdlA1cmlZdGZRWVFkOFR6SHUvWWZ2endk?=
 =?utf-8?B?M0Q1UnBEWkRKc2lhcTJsQ2dpZjg5a29iU1RZd2ZjSFBCZ1NSK2o0TGlWTC9C?=
 =?utf-8?Q?Ilz1odhmgNWculF1sFd1yZY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a47257c1-625a-4251-e148-08d9dc21ec29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:34:10.4772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYWLzlxfDQPIBorHDoKybD0Flrrs2uZnWnDIAvT6/RK3/KiLR6CHScxr+I7bNNllNg3FEKhiYZVbGpl8cuxZlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3282
X-OriginatorOrg: citrix.com

On Thu, Jan 20, 2022 at 03:02:14PM +0100, Jan Beulich wrote:
> When the driver was first ported, we didn't have "bool" yet, so
> conversion to bool_t / 0 / 1 was necessary. Undo that conversion, easing
> ports of newer changes as well as tidying things up.
> 
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

