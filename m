Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999684B202F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 09:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270205.464414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRI5-0006tw-9I; Fri, 11 Feb 2022 08:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270205.464414; Fri, 11 Feb 2022 08:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRI5-0006qc-5a; Fri, 11 Feb 2022 08:28:29 +0000
Received: by outflank-mailman (input) for mailman id 270205;
 Fri, 11 Feb 2022 08:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nIRI3-0006qW-HA
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 08:28:27 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93551dfd-8b14-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 09:28:24 +0100 (CET)
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
X-Inumbo-ID: 93551dfd-8b14-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644568104;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Vhj8SGZE811stmy2pNaUJ07OaNJtdj5vIuyQ5ReJE8Q=;
  b=KG78mBsvwDPJAyeqzOxgLhq+unkUAwyGmICvQHOe52hpyHRpQ0GzOHqw
   VWMRFzcq+1MutGMSYl22O1XkUHORg1EAbjCl3v8KmEriOcvMOaQOGL2mJ
   dGlPpdGgG3OoftABRKSGQPeofa/YUjVThcXeFM7SZ8WnkB2Dqe9JEiPkc
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6xMvbttvqKLb9I+rpKZo2zJqYdzfS4jZ5kU9gCyO6/9OW2Rd0lXuyaa2DfyAuX9A5GcfUloY61
 WFzZvQftHv/BXY0UapCGxGMsTo9GOfdCBLxmyoYqKaZBK+ETOHZvbEtbCEIPcHUOuQJLVpgGgn
 JIDYL7BHaAQYZ8kX1iuYOv/kM3MNm+V7VN9IC0WEH10yU+sAP8ZplXKHXSMB5Han5VP6OlAt7o
 45Wwb+diRky4o5tE4YPb8uLB9Ipxkaya58yeve/6VQpRUaBOZObYhuAfJJRQe8wTC40c475/yR
 qD92Dxko7luNMxUvC32XEUNc
X-SBRS: 5.1
X-MesageID: 63999212
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4nem9KmLjOu16kLMUCMJTALo5gxWIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJODW/QaPaCMGT1eN13PY/n904H7cKEz9BiSgc9rXg2QSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Ncx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Nxtt4PralopB4vNvsAACkZ5EwtAEqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glr15EfR6+ED
 yYfQR5lVT/lZT1EA3A0KZgE3+DxqyX6VxQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfTnSLgHoMJUrTg8uVthnWcw2USDFsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdxSYomHfnUMcYvxRNcknsV6syoDqzAnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb7zt6cowGGxFAfpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpyP5IN8PumwnfC+F1/ronxezM
 Sc/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5XUm08CDIUToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3gp
 xlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:udo8d6ipj81/BeW7cgd+OacScXBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUZqFh5dL5iUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHkondotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="63999212"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+ak/mGk77ZtzO66o8bW2plIlyxQLPHuxL+zwFFb7BjPCbzwtq3m7/ZcAeOXchrP1jhWx3qlbOa5BFO2Mro3GDj6JQpcWBplBu05tB4UqtxW8MroRlzS3CR/cas8r8pj0OVMeVg3DR1HTSbW+Qv3zn72DkuZ+f1H7j6B9abVgVIL1/wiyoVPD8UukBOU4DKwO4zWyQWwYvFw1Y/6Lkk9C9H2ABICh8drivDdZ/j/ASEZBY9fYezGkvRV1FyfNX8cOdyy9ZoM4Mz2xN9KzibsLx5FI9oGbveXiP0e+IEFdvsJlBP4knedIP7XvxTTQ2S+FvBRgGbxTEVVJ4wO4dxV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3xRSDw9VHcQZ0WCaVPEyvGTc+1tW1q+fKCin7xhoH0=;
 b=Hx2Q6GPoyIkFnMbEZeHLQVubDaC4pJm3Du/E7B/3QxPdO8wbl7uhYLNlJI/tfeGf6pbgnH6fnyvd0hrsPhfJhLnBA5GkLsh2nearYjSNuPs6r2J84wY5nz34BRSVvxRmJEDcgRJENeza6fpHjAagB2GaJi1Mr7sML289tWNb+cN+aEkq/iQgHQG1KhSLgj48LcMh3JzTaCPz7M1ubMyAt3gjhtFMnZpt1WVQrGFgcdt6ey5kFBZro0H8Jmk21kVZK7cp5TvlJzb9qKLmC8NmytTKkRoCCKen8MHqZBd2Mi17SIp0wE5ohJcpHsam2mTPFORH7lwAxlptH6N2exVLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3xRSDw9VHcQZ0WCaVPEyvGTc+1tW1q+fKCin7xhoH0=;
 b=OUi/d32kqgHrrFi3rSVR6YOmhWuk/joiKJwhMv7OAw54M6d52pOcIqJendeKOqzyCaX3rDOjYzlRlkzMOxp4PRN+bFw0y/zKVLA5WKEPkuzap8KjQ3+umjUGSX0tapaRVR+g7Tbst3kbKkq7kkr0GRVayfQqka0CopQZ2nNu738=
Date: Fri, 11 Feb 2022 09:28:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alex Olson <this.is.a0lson@gmail.com>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
Message-ID: <YgYeHSm1RO03yy/t@Air-de-Roger>
References: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
X-ClientProxiedBy: MRXP264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5e299c6-7f2a-44ac-2a29-08d9ed3874b5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4057:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4057C1FEF377C04795920AFB8F309@DM6PR03MB4057.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LnEpPQrZsTMnlg9dLQL2FhmdJAKmOIjeBOMDUGmPZ9R01O+lKcafeytD/PfXyRLQLGH8k3qDVaaNxQ8lqDhLRkbLTA4SYsYe+Xbp1egKJLVj9mYVVEvewTo62eyJbzWbSVqebm6Pa5P5pKZ5Yo85XXL6iqOwJhsbqsi1A68f9BBnT+BJrKlozjEcbWfhxWxWXCoOW5JgPqPCM5KIFKNiG+qPHQmBOT03DrgBwrSjkB3pfdr3G7f3ADkbd3M0uFTw//YJq0dRy+OoyDwHVj80Ss0OR6+Dzwn/7eTjls8tDRkc+B4WLTWc3GOtt0HWO/LmmM+6X7EXjq+OL4znzLYqAR/og77AzQIQdZ1olgd02OvYUGhONVyMZKZSImfrXKpUuz8y34qY2MTu9u7j1sR9KhdEllwTJ3Vmvo8qefZL9/2XsLubHUDR/Vu7zEtx6LQI6h1jCwRMIvLs/oWbCLGcPySpaPFcqgErcGrz1O33eDGo5XWSikdg2xJAoysV8TJZ1w7awfUl8XYp7GjcK2MbTRBgjUjUfLRw9iaGVcgANxgkz0mKVowE5RElvVOiJdSZflZ81jwRQk/A+Pw8Df+nYQHQ6SWLeOHV6+zZ1UbKANtHvqBQxg6xoybpewVPBsI1ayLlukUMFr+Vbf4cZFB/RA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(66476007)(66946007)(82960400001)(4326008)(8936002)(6916009)(8676002)(85182001)(316002)(2906002)(66556008)(6506007)(86362001)(9686003)(6512007)(508600001)(6486002)(186003)(26005)(38100700002)(83380400001)(5660300002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJtbXRjOVBaN3B1Z2lHanl1WFUySDVVQXZiS2pNbDFNbVF0eVRqd2xPeUVi?=
 =?utf-8?B?NlZhaDlyL09qby9Sbzl3dlY1ZjJqLy9jVlZBS3gwNWpqblZ3aXRHbVFpU1lO?=
 =?utf-8?B?RVE0SEIwMm5WdEtmeHBWVnF5RFprbTN0ZXNPRSsvQ3NUV3dnZ1hwTXE0RWxh?=
 =?utf-8?B?N3NjQnR6OWpzRDdmMkxGSE1DTG1MK0k4SFZ1aU43TGVWSHV6UXl4elNCYjI1?=
 =?utf-8?B?QUE3a2JDZzdTd3crdWRwR2tkak9hQXIyaWxyRXR4TzlxeVZHd2hYRlBZQmR0?=
 =?utf-8?B?REw3WU1UejFsMWNoUWZCQXdQSEM1VUxSa0xNOCtUMitEQWMvK05DNjgvUUxo?=
 =?utf-8?B?SEt0TmVyYzlqcHM0UDdkTm9xaEQ4YXVBWk1rZmZuZG9aT2craDV0MHFIOEkz?=
 =?utf-8?B?SGJuVlNYVHRwSU1DcXJxS0VxQXNJN09RVTlYVmRYVjZlUklIK1FNZzluN2Nq?=
 =?utf-8?B?elNrM3Y2TWEzN0J0TXBoWm9VNFhJYk1UcytRa1hSZXBQKzVQVEpsVGJOUTFx?=
 =?utf-8?B?UXkvRXpNYlUvdzFWU09TMDZmanF2dWdpN05QdmRYWmVuMmExVmhoUlhLOW52?=
 =?utf-8?B?N1dpSnhlWkk5Mk9wNEhzbk1keHRxa25aN0lweFNOM283NUE2eFlXVU1Fb2dP?=
 =?utf-8?B?dHl3WDlyRGE1ZXlwaGpEa1BqZ1I3RFVUZzJVSGZYRVhOWGQxSHVYeXUvM2Jv?=
 =?utf-8?B?RTZkWjlqMWdBZnBnc3gwL3RReE1zcFZLQ3pDY0hMbHJxMjhIQVN3RXhVOWdN?=
 =?utf-8?B?a2VyUUFMTm1PaUIyeUFYVElDMHk3QW5lRTVZZ0c4SkJZb0ZkMDZKRldBQk1s?=
 =?utf-8?B?S0lTbzJKdjZXVm5hb0ZQNEhIUFlFdEFoTlV0K05VczRiTnVDRkdHUUtJcmJr?=
 =?utf-8?B?K01tL1lYYkhzd3IwSFNBeUlLaVFiVm9IeWorMVMvNUdDWU9WaWU2cTMyb0xz?=
 =?utf-8?B?dnd5SHQrYTN6Wlc2bVQrWjlCV2YzVWw0WkpObDFvdGNKeGVWVGtJQjlEQ05o?=
 =?utf-8?B?c2gzN0ZDT3hEalQ4MlhnUTlYS0tsbFllQmZtcktaVlQwSUdoUXpXSElIbFda?=
 =?utf-8?B?YWFKVVgxRnVEbXoxVlFhMUg4bzRtR1l0THVRN2ZmaytvL2cwdDFmUjZYTTYr?=
 =?utf-8?B?WXhZTHdxSjBkOHpJMmRYTUFsdHY3c21pa01lZWJVYys4ZHVsMnBEMjVOdTNH?=
 =?utf-8?B?ZCtSK1V5cEJCeDd6NXZnQllVY0NweWlNV21seHFZekgrV3RNMml3VEhUVi80?=
 =?utf-8?B?QjhLRlFKMXIzaVVDTDlBM1FtcVdwdmNtbTVwUDdGNFlNT3dPU002WHdjQW1M?=
 =?utf-8?B?c3lPcUxTNXRWSEx0Q3JmbDFkY3VTM3ErRnd6ckxucUxKVmduNGlUMVVpOWda?=
 =?utf-8?B?NlZSblJkK3MyQVpMZjJvNWZXdGpHVHZRMStxN1Vqakx2ZTJiejRkQkdKWFNP?=
 =?utf-8?B?endwaHc4UWpEVjdqYmxRTERrL3IxTHgxSlhXWmR0M1NrQmtwYVdaMnJYaTFN?=
 =?utf-8?B?Q1Bsc3hIQVFaQlJXbm56OGVYS3Jjd2xJa3NxQUdKNmQwTkZpTXNjWHMxL1px?=
 =?utf-8?B?a2g4T2hadE9ScWsyYWUzUmRIWlhldkM2VENrenJnQWRvSXE0YktBc0JxVzZ5?=
 =?utf-8?B?dSt6UEtjMTI0a05aZU10MzdjQ1YrSlJ1WmVNUEF6aloyTEdPZm5uUEdMN0o5?=
 =?utf-8?B?bzJzZ09abE1UNFg1T2VidGdDNnZHZFRCVENWa2dXQWVOWkcxVlZuMW9IcmtV?=
 =?utf-8?B?MURQZ0xqQnhQeFhKdXZNSkl5eDFuVDBiMFcwUDhNVzR0U0VhNDI3dnc2cXkv?=
 =?utf-8?B?cFlMN2tUeS9TLzZIY0JvNnI2NE9Gb3NiSUUvWi9lWDRjUUhiMllPU1FMTWI2?=
 =?utf-8?B?NzZLaGlkbGlVeFZHZGJHVU9Ob3lpcjZvbThMV2VBV1BWZGNvYlZDUFlMUzdN?=
 =?utf-8?B?aWNEeFF0QTFNK20ycFJEdnZWMlBqWG9XTTNDYkZwWDhpeHkzclR5Yk9Ydmk5?=
 =?utf-8?B?NGtldklhU0ZBSXlZeFluZnJSM2VYWGFUT1VnaVhldjU5UGYvTGVPVWhtOEEz?=
 =?utf-8?B?QkczaDZpR3pYZTJJY0FMdXBndG5RUFZtOHdLcGFaTjBZR0VqeWFudGhaQXU3?=
 =?utf-8?B?di91RzFEc2g5MG1iMUlqbVZkMCsvRU5GZXhXMDI0ZDF0UzUwMDU1QTlxQ2NX?=
 =?utf-8?Q?XCvqcedPCst905zbYz29ShU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e299c6-7f2a-44ac-2a29-08d9ed3874b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 08:28:18.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bM+DNpBRQgNtvGOYQ7raym1Uh6qT5BN12xU2bTr8RLgxEwIhE8Y5FjfYGYMRMkTCJZ2Hrog7ANCd9nEWlplaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4057
X-OriginatorOrg: citrix.com

On Thu, Feb 10, 2022 at 11:27:15AM -0600, Alex Olson wrote:
> I'm seeing strange performance issues under Xen on a Supermicro server with a Xeon D-1541 CPU caused by an MSR-related commit.
> 
> Commit 322ec7c89f6640ee2a99d1040b6f786cf04872cf 'x86/pv: disallow access to unknown MSRs'
> surprisingly introduces a severe performance penality where dom0 has about 1/8th
> the normal CPU performance. Even even when 'xenpm' is used to select the
> performance governor and operate the CPU at maximum frequency, actual CPU
> performance is still 1/2 of normal (as well as using "cpufreq=xen,performance").
> 
> The patch below fixes it but I don't fully understand why.
> 
> Basically, when *reads* of MSR_IA32_THERM_CONTROL are blocked, dom0 and
> guests (pinned to other CPUs) see the performance issues.

You only mention MSR_IA32_THERM_CONTROL here...

> For benchmarking purposes, I built a small C program that runs a "for
> loop" 
> 4Billion iterations and timed its execution. In dom0, the
> performance issues
> also cause HVM guest startup time to go from 9-10
> seconds to almost 80 seconds.
> 
> I assumed Xen was managing CPU frequency and thus blocking related MSR
> access by dom0 (or any other domain). However,  clearly something else
> is happening and I don't understand why.
> 
> I initially attempted to copy the same logic as the write MSR case. This
> was effective at fixing the dom0 performance issue, but still left other
> domains running at 1/2 speed. Hence, the change below has no access control.
> 
> 
> If anyone has any insight as to what is really happening, I would be all ears
> as I am unsure if the change below is a proper solution.
> 
> Thanks
> 
> -Alex
> 
> ---
> ---
>  xen/arch/x86/pv/emul-priv-op.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index 7f4279a051..f254479bda 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -970,6 +970,18 @@ static int read_msr(unsigned int reg, uint64_t *val,
>          *val = 0;
>          return X86EMUL_OKAY;
>  
> +    /* being unable to read MSR_IA32_THERM_CONTROL seems to significantly affect
> +     * dom0 and thus HVM guest startup performance, as well as PVH VMs.
> +     */
> +    case MSR_IA32_THERM_CONTROL:
> +    case MSR_IA32_ENERGY_PERF_BIAS:

...yet in the patch you also allow access to
MSR_IA32_ENERGY_PERF_BIAS, which makes me wonder whether
MSR_IA32_THERM_CONTROL is the only required one.

It could help to post full logs Xen + Linux dmesgs.

Is this reproducible with different Linux versions?

Thanks, Roger.

