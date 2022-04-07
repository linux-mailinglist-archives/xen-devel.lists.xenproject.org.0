Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D64F7C09
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300590.512809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOhA-0004MR-R1; Thu, 07 Apr 2022 09:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300590.512809; Thu, 07 Apr 2022 09:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOhA-0004KP-Ni; Thu, 07 Apr 2022 09:44:52 +0000
Received: by outflank-mailman (input) for mailman id 300590;
 Thu, 07 Apr 2022 09:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncOh9-0004KJ-49
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:44:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf6433f-b657-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 11:44:49 +0200 (CEST)
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
X-Inumbo-ID: 5cf6433f-b657-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649324689;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3n5OrzF9EKXOggYsoC6qEpeZQsYOh/aq0imU8p+1vCE=;
  b=epWAy0jS+O+5TnZxpJd8bjvBp6y6ON6KLToFbJEMJyyPo08Y48cq3t+Q
   cVh0lzpmxFz0bAAvZGwJt0+EINv19JkE7GaQ4VClWh0xVXqPZ42WMATGj
   Yl77pRPc0lL0PMIiO8DYoHr2dCuzkP+SkXwFeJGIzJTwEQHU/bhIypIFx
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68242955
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZErQiKIODF6c5ci/FE+R7ZUlxSXFcZb7ZxGr2PjKsXjdYENShjIPy
 DMdC2CDPP7fazHzL40laom+80kO7ZSByN8xTlFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY32YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IgSkrjpchwJB5TrqeEcdD1bTgBUAJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glg3JwUTKuDD
 yYfQWF2bBrpaiVfAVo8LLgjlb2OuCHFLwQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZxm0GazGEXDBwQVHO4rOO/h0r4XMhQQ
 2QW8Cczqak59GSwU8LwGRa/pRasvAMYWtdWO/037keK0KW83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LWEwl5nMcmm9z46znDazHgwWcE4oWBZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0v55p0xWG2DaD+qXNERz3phZPmqgKvVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i0DKCJM4oRPcEoHONiwM2ITRTNt4wKuBJy+ZzTx
 L/BKZr8ZZrkIfoPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9A9xPQKy72Qp
 xlQmCZwkTLCuJEOEi3TAlhLY7LzR5dv63U9OC0nJ1Gz3HY/J42o6c8im1EfJNHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:wvWT4qhWbopw249fFGHqH3KjP3BQXz513DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKOzOWxFdATbsSl7cKpgeAJ8SQzJ856U
 4NSdkbNDS0NykEsS+Y2njJLz9D+qj+zEnAv463pB0BPGIaCZ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqP+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+iemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l0dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNNN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 P52+pT5fVzp/QtHNBA7dc6MLiK41P2MGfx2UKpUB3a/fI8SjrwQ6Ce2sRA2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68242955"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBQuLIMyXHpYaixUuHqeBIWoaT94ciB6Zpu6ARAsJ/jKM4tIGLECBKGbEcr8YS1RK01vOlhHC4+1PgjV+2pbYzS57hG4rP0IUySoTbbL8q99Ao9/KcPPIvaNeQVU9Z6GQa/qDdfLuXZ4dNyUQbPAnwMsDwlkCl7cakD3hMcvWGpTFlySGDyKGluB1lgxeyEFlS4WUh1gkhWAB430DnZ/WlTMN/8BJhq6WwKlzXMBM0MkCh1PduKDA8uEoKU3SoKT3XrXGy4kYv22OGte7ZPBYJmACou8y1UPvQZdVmZXJeCTCKmZ/CTT8JNGq+yCTXOF2zRmcj5Wt3byVAAUT2ptsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j66CzFnaLl05peFo5LKAcYlaAD/N6oXFnRPL4ET/YAw=;
 b=hdN7JIF3YiQNYOpvexBG6wu6FlNGkMMJZkeDzOftZrmIIdX1Co1ML7+wLOgm6n7NGfsOOapZ5A+iISlwPO8AI6hZPt23zmDf2/QGwz/Tu9PbKXQhA25OiiSdC6w+oJzMl3Be35AinwbYGBbSN/HYYiCbj1scRLrgg22+7uhv55zlLBEPWX5JoxBLdm2W+WdLBT1u6lqaRiLK6Km/GRaCEVjruEcuxDHD3u1VBAWY2wjGSwJGmdHfRmA6LS2jFwn1aARuE78JOBWKmODzsxgsQf3c56awTIbHmtLh7wOsC35GAh4M0jmwmQ3R/5gYc5MGcZgE/1JsPQtPxhB+PWtnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j66CzFnaLl05peFo5LKAcYlaAD/N6oXFnRPL4ET/YAw=;
 b=DWcEKPUuu0V/1/8e9YmgeRJ/7uQnTO/yS8rnSaWtL8NpQMT8ZlkyKjI+CImTKM8SdNCfGFjML345QtAY5lPRbC1qJlUWcf0EOll9kpyKUm6y0HxdQrnqRn9764cyJFV43Lw4HO+qzgys8FhQIiOdTIjDuYMHkkHSMTPWFNujFgw=
Date: Thu, 7 Apr 2022 11:44:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] platform/cpufreq: add public defines for
 CPUFREQ_SHARED_TYPE_
Message-ID: <Yk6yiPpV6pM4GyGq@Air-de-Roger>
References: <20220407081828.38747-1-roger.pau@citrix.com>
 <1d05e311-d466-b729-ebd6-178554f67872@suse.com>
 <Yk6tW0Q9ROWABn4l@Air-de-Roger>
 <edfe5d74-9ff2-1fe5-7078-f72ee6ed4f5e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edfe5d74-9ff2-1fe5-7078-f72ee6ed4f5e@suse.com>
X-ClientProxiedBy: LO2P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::21) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6e3b81a-23ca-4233-c35d-08da187b3ea8
X-MS-TrafficTypeDiagnostic: DM6PR03MB5066:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB50660FADD63287AF00B2E89C8FE69@DM6PR03MB5066.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqkfc61XRalqKYhb1Cj3dEwr0SP5zs8zJCMZVM6stlS/3UBH/lXxbk6zXhvvNAYKupF2lDF33xTFRJkImYua4xQ3bJI0v+SyA6j6I8QVh6oI10d0kVnFaqs/oH5Qqg5q2ZOd2lTHu7PFnQA4VtdXL47Rv98tGj421hjqtkJ8Sw6IHNQGkaM2v9Qkmpwpmno5Qdvxi2GPtwwZXys3K6bqPtzyZNU+8dh/98rftv3lXpD0ajKgcOmOXNgNg8QYoym0tljq7adFuQTQ69l5UT8HjNtI62KBeVPUMpH56CVhY1M0bY6IeXaOL7VGI+sxRDgp3gOeOqNq47607N0Rt8L/bVGDyUaoMUkdoUvoOKqfZOvjUcuQz+bVKwNvt1WXPDcDIi0vogHdtx8qiWNlPBzb/uNaI49HTvY/DPHj4UBn+CfbjdAq6lNl3ksdjeXMfke8Kmph4x2pIikLGce69j0jDaLQN0gaGIoSLi1nmwESPQMA26l+U47+MTeFPMu6zOXtAaXNtOKSANyCxZxEFewA2xtya6BDiCuLFf79h/K2zdBVJvbmCJpEn9j+AZgDjTgOZSC+NoCUMbFKIVCbtE02dhvO+H8x8PRXKbuUYtKn1c67by6tn1K25K3zETVqAgO1K1FFQ1IFHjQVV1pLJTSgcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(2906002)(8936002)(508600001)(82960400001)(6486002)(316002)(85182001)(26005)(38100700002)(186003)(83380400001)(54906003)(6666004)(9686003)(4326008)(6512007)(5660300002)(33716001)(6506007)(66556008)(66476007)(6916009)(8676002)(66946007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZXWG9zVUJnUXgwSGtDR1FtWHBRUkpQUUttakZTa3luOFNuS0IzeE9ZZFNU?=
 =?utf-8?B?MVRwNGlCSC9XeG5sV2gwcUVvWGZjSEFrRFpad0UvdXZRaHlRc2xiUHhNV3Mv?=
 =?utf-8?B?RlcyaWVMdlBoMDJCOGViK0dJRWVlTHFJbktUaFZJb1Z5OUx0Z212U0V4Z0tX?=
 =?utf-8?B?NnM0V2pQZTAwYWxsWUhMejBHQmVDYXJhZDIyMWtyWHV4U2FQQ3R0Ymo0RHpp?=
 =?utf-8?B?aXlTQmlPb25JU0x0L0JrNFVUTHJsK3lmUmQ2K2MyeHF2SE5PcjdPSEc4aDlU?=
 =?utf-8?B?cVRXMVo5bGVsZmlmdTdJVDJtS2lRUDByL1FVT1NGSVU5MVJkM0RhMGJyRENw?=
 =?utf-8?B?OVFSRE05R2h4bitxYlpZMU5pQUxOMU9WR244R2FGakllUWNFcDh0dk1IMnEw?=
 =?utf-8?B?M1V0MUJLTmsyRnYxZ0hrVHFKbDg0K1U5a0crWDViM0o1TWw4c2xwTmtuaTha?=
 =?utf-8?B?QlkwZGpTaERTbHU1L20wWFBOeURPL0dmSmVtSWZCZ0QyUFNIbmZUL3hiTGxO?=
 =?utf-8?B?c1JQWitZMXVKRk9uaTZYWWozaCswOFFlNzVidytCeXZJdFBRQWRMQUVPRmg1?=
 =?utf-8?B?YUY4Ny9qUzN2Vnc2dGhWWVR6UXdZNElRSjhqZjY2NnAyNEswMUNiMG1EbElt?=
 =?utf-8?B?RTg4ZGJyY012QitsSHNtYjN6V2NoVjZIRnd1S1pVMVNxMGQ5MWFPckg3RXJa?=
 =?utf-8?B?MEhnRk1pL2Q1amkzQmJCYWRYYWIwL09EZTJ2dG5iSDFoK2F6bE5ya2NKeldU?=
 =?utf-8?B?L29OMWVMRWdPbFJ4NVl5a1pUT3JQY3U5R0JmUWFwZWRZYXNHSk5iZnVhUVVW?=
 =?utf-8?B?dnpkbWRlblpob3YwN21RdlJ3ODBreHdnZUNOYWhqUHdVaktVZ2hCUDM4b0Ju?=
 =?utf-8?B?UzY4UFpHbzdHN0psOE8zMVFWaEo2TEJTQlVac0JFUitIUmRVVFNWdzNJaTVY?=
 =?utf-8?B?cEhSeWlNbk4zVWpHK1o0cThFMDdxMXUrekhMVFNLQ1M2Ty8vbEFnWU1rZHdZ?=
 =?utf-8?B?MUtjQ0dZSngwK01DSWZseHg4QlBOelNrQXpKTDloRitYU2JlWllQeHF1ZTl6?=
 =?utf-8?B?ZEY1TzByRHYyQ2dldFpZd1BMTTIxOE9TdVdlTm5lbWxwSm5OTmdYQVN0c2cy?=
 =?utf-8?B?L3dGYkdKVG02QmE0NURTbk9OWXVKVm5ibG5maEZPdDdhY3dBZ0pWWE90OUc4?=
 =?utf-8?B?THIrcGl1QTJrdFNFU2ZxRitJVENvWllTcHJCNUFxOEwxeERKVVFiaXkwRk5C?=
 =?utf-8?B?RjZqR0ZEa3VrZ3VCM0Q0WC92aHRHNHg3bXhGVnMrTTdnMmlpdVYwTU9SQU5v?=
 =?utf-8?B?OGhheWN6cndxaTNFYlo1aXFPbDRwSWRsL0tXU2hlbEJRNWRNNmZuRC9Ealgx?=
 =?utf-8?B?UWlkQmNDU2JHMTcwclpiamJPamRHTDFCYnR2L3k2K2cwRVdXU0xFRm9qZHhU?=
 =?utf-8?B?TGZvcU5NakxtUE9BQnV2Tk5ZcU4wU1Ryck9SZHRFcFg2NGI2TWJuVXRrOFM1?=
 =?utf-8?B?dEZDUzFuNWRScmFLNUU1NmJiNi80SDMxeXU2VDRQRXNyVVpLM0VKbThERVJL?=
 =?utf-8?B?aHlZUU5MMkhFejhWMjRBWG1jU0l0RGFCV09IR2xvdk1ZMW1hUHIrWm1UaWNF?=
 =?utf-8?B?dXRmc0p3ZGVmNjlYb2NXUDk0WXVRbDlzVjRTTzBGY3Z1TkZsUjdBMHVTT29h?=
 =?utf-8?B?R09QNENZZmd1N1U4eFFxQVdiMlpWbU54a0VET1BNdWRCY29BaFp0Q0hvZDBC?=
 =?utf-8?B?cDNTeFI1V204L0k1eFR2dXdhS1JkWTFTa2VOTlp1YTJsSmhXTC95T3NTUkg2?=
 =?utf-8?B?aHlFOWIyN0lPdWJYTkJEdXlpZ3R4MlNIYWY4TFp2Y0Zta2dKZ2I3MlNPUG02?=
 =?utf-8?B?UVpPbXdlc2dtSW4yK2dQbmgrRzFFU3RhRnNRSnlPVDZ1MEcwaklMYUxMdWox?=
 =?utf-8?B?cTQySno5U0dndWY0Q2JpTXBMdzF0UlJDWXpxOGg4YXhJQm01b1NvNUx2Rkky?=
 =?utf-8?B?RHl6cjgvVlN6U1BqTDNOeHF0WUVhazVqbzJGc2xHbVBFdS9zaXUvd2xpLzZL?=
 =?utf-8?B?S1Q3T3Y1SkVZck9hY3pkQ1lDQzNxZ3ZMYTUwWnc4YnVBR0RWRVZrWUdBc2Vy?=
 =?utf-8?B?bG5sQVNINHRielh1bU5WaFhmd0VmVy9ZaUJhT3cwbThiNEloS0R0V04vdWtO?=
 =?utf-8?B?Zlk5ZE5IMThQUG1zcDE5VlRUY0d1M1Zpb2x4MFRZUHI2dnRuM0x4S3NiREMv?=
 =?utf-8?B?SlBaUG9wTms5emJvZEwvMzV1elhmbk5iV1dMN2k5ZW5ocmIzdnFzU1FRK2hx?=
 =?utf-8?B?TTFqYlNVczFROVNEejNCWjFuakJxS2dROFRIeUNCMmNYZ3Jud2VJYlNaMUQ1?=
 =?utf-8?Q?V8C/dZ9y4AGcg1OY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e3b81a-23ca-4233-c35d-08da187b3ea8
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:44:43.9825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWdKEXQFxpc/s5Onc3mz6h4D11dky2fU00DyYbR6LlUT8JCehR/UiNcRdBgh7RnHmJ/9OiGFnwS34NQCSj4x0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5066
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 11:35:20AM +0200, Jan Beulich wrote:
> On 07.04.2022 11:22, Roger Pau Monné wrote:
> > On Thu, Apr 07, 2022 at 10:48:50AM +0200, Jan Beulich wrote:
> >> On 07.04.2022 10:18, Roger Pau Monne wrote:
> >>> The values set in the shared_type field of xen_processor_performance
> >>> have so far relied on Xen and Linux having the same
> >>> CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
> >>> public interface.
> >>>
> >>> Formalize by adding the defines for the allowed values in the public
> >>> header, while renaming them to use the XEN_CPUPERF_SHARED_TYPE_ prefix
> >>> for clarity.
> >>>
> >>> Set the Xen internal defines for CPUFREQ_SHARED_TYPE_ using the newly
> >>> introduced XEN_CPUPERF_SHARED_TYPE_ public defines in order to avoid
> >>> unnecessary code churn.  While there also drop
> >>> CPUFREQ_SHARED_TYPE_NONE as it's unused.
> >>>
> >>> Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> with one remark:
> >>
> >>> --- a/xen/include/acpi/cpufreq/cpufreq.h
> >>> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> >>> @@ -78,10 +78,9 @@ DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
> >>>  extern int __cpufreq_set_policy(struct cpufreq_policy *data,
> >>>                                  struct cpufreq_policy *policy);
> >>>  
> >>> -#define CPUFREQ_SHARED_TYPE_NONE (0) /* None */
> >>
> >> I realize this is unused, but do we really want/need to drop this?
> >> I think it is used implicitly right now by assuming the value would
> >> be zero; this could do with making explicit, in which case we'd
> >> need the #define.
> > 
> > I don't think Xen uses it explicitly, all checks of shared_type are
> > always against a specific CPUFREQ_SHARED_TYPE_{HW,ALL,ANY}.
> 
> Well, I said "implicitly"; if there was an explicit reference, you'd
> have run into a build failure. But I did check now - all comparisons of
> ->shared_type are against explicit CPUFREQ_SHARED_TYPE_*. So I guess
> dropping the value is fine.

Yes, that's what I've tried to explain, unsuccessfully it seems :), on
my reply.  I should have used 'explicit' instead of 'specific'.

Thanks, Roger.

