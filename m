Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393BE5264E8
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 16:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328557.551612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWSi-0003V3-LX; Fri, 13 May 2022 14:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328557.551612; Fri, 13 May 2022 14:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npWSi-0003Ss-Hl; Fri, 13 May 2022 14:40:12 +0000
Received: by outflank-mailman (input) for mailman id 328557;
 Fri, 13 May 2022 14:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npWSh-0002St-Fi
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 14:40:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95d73fe9-d2ca-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 16:40:10 +0200 (CEST)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 10:40:07 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2448.namprd03.prod.outlook.com (2603:10b6:300:9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Fri, 13 May
 2022 14:40:05 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.016; Fri, 13 May 2022
 14:40:05 +0000
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
X-Inumbo-ID: 95d73fe9-d2ca-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652452809;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZJIhEbKwC0snLP0Fbb2ih5ZHCzihUeyvRQ0BGHT2gy8=;
  b=ie0Dry3vWl5DdxOa+qhjH0+1Bv2w9ma5/S93mmTrR0ylOkhdqZPsKlRD
   YLegK8sWzGuc1Bv9z4LGgcln4SMSJthqekDQqTxfu9elKvlh/kRGzJmfq
   QIg4Eor6Ay4XNZgOLkzoL8g9rTU4c4xZVIhC3ZSNO0ftKVCKXot1NE7JV
   4=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 71270941
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vz6CLa614cic1detBhRvGAxRtFvGchMFZxGqfqrLsTDasY5as4F+v
 mUZXW6APfmLYWbzKt0jbIu0pkxT6pDUmtJhSlNqqis8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgWFvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSTDis3eaL8ld8EaF4FCAR3Op9bo5HYdC3XXcy7lyUqclPK6tA3VAQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YAgF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IB8g3N9PZui4TV5DxNk4r0Gf3pRvK1eP1ExHaio
 yHfpmusV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma/RNB3O
 0ES4jApr6U56AqsVNaVYvGjiHuNvxpZXsUKFeQ/sVmJ0vCNu1rfAXUYRDlcbtBgrNUxWTEhy
 l6OmZXuGCBrt7qWD3ma8994sA+PBMTcFkdaDQdscOfPy4CLTF0b5v4XcuteLQ==
IronPort-HdrOrdr: A9a23:fi67Va3SAEzlonbLJf2MRAqjBS5yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtrp
 uIEJIOdOEYb2IK6voSiTPQe7hA/DDEytHPuQ639QYRcegAUdAF0+4WMHf4LqUgLzM2f6bRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNNaWs19
 60TZiAq4s+P/P+TZgNcNvpEvHHfVAkf3r3QRKvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.91,223,1647316800"; 
   d="scan'208";a="71270941"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8AzFF4VDpnzzvZ5xctK+c8MrPDalgqk16bm4d4bxvHFtEEbRRmtoEVJiJM2jIdHsclfyY9AOA1jNIh1gk4krhGZogYiNaDw4ipbu0x6nWtMTBjjATH5w6xo5o8Hr1KhGe8GIl/pmWAVQg70Msce0auKopjx0HaZtLc8Ji3zpSOmBeVAiSrp9YIDFYmib2QHsKXHjuF2VdFOrSfJZu8VgNEUtLu4dBy4IlFK+9Obo03k+C+RZGGxpfmt4hVCAy7A2pc7X7ZK6d8Kinfrrrk3e4C4sVy2siUpzObaM3pyY08YjE0HI1EN75LCrmcGsOk17PIZdRmjrtZxALiyc7yWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWgBO5xpKQai5Se+hdg6PjkOYmQz29aCA/m7AfbHJ6w=;
 b=oEfEPxVuXMANHkBy3uTyZjmU/aKr7UsXNUvIGfZclVhqN6Yb1EWk2IKJCsYw/TjCg7XDZvA0Z09wGv7I4OrPwgnlCkILh4sQlDJKVTet7Ciwwne0MQkVAod9dudOWWUvAUA8mLl+Jcp/spjdKnHeGzHMwptDh6r76w0w7s3s76O3JEM3qo+ovI6ZgnHrmmOO7gjpBiAGKpd6JhKpaonqMEEyxJJ5r0RZ2cV7AqkwtwIWW5qznzW9pClpFUxo9fvR+atPtiTpIV8d6lT3ygvEl5Pw+nj4EnfJ2QAUpv7lQi8iWmNuZgiYqOphbqIWNMSxjibUkfziDclDKUBjnGDvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWgBO5xpKQai5Se+hdg6PjkOYmQz29aCA/m7AfbHJ6w=;
 b=it95/28VMLzvoRiyZ3Q6TGAn1OtnAWByFh8r+PRFd8GUAajKd13miM6rm8XuG1wX/N8LFWBLGHiBSWJMSx1PobyE8CqU7nCM+N8h5E0TRUtADQGzT7XBssbMl2koh5TatUwhsj8WT17OAYixLrT8IOhOVAjkmO1oJntzw5JHdIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 May 2022 16:39:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: [OSSTEST PATCH] ts-xen-build-prep: Grab newer NASM version, to
 build OVMF
Message-ID: <Yn5tvd5tw6f+fKwf@Air-de-Roger>
References: <20220513133534.88564-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220513133534.88564-1-anthony.perard@citrix.com>
X-ClientProxiedBy: PR1PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bcbff28-aedd-4253-ea4c-08da34ee771b
X-MS-TrafficTypeDiagnostic: MWHPR03MB2448:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB24489EBAEF395FF5B3BBEE5F8FCA9@MWHPR03MB2448.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZaY3UH79EibfQyHvHi1RGJESJZsRktfD6XN0wxPLAF4vlehHb2sHyGf2z73rhXE2O7kaHCo8MjXxt/g/IJTvIdx5+IS2mhMhcfeZ0Hr5TShbKONpE8FNG41QIQPXg36TBim0Xt9hj1jCFO+YnOAn7LeqNr/VtLJd3aquOa7fjDe8A8oF0umAQMCgRbym2I/Sh5oTKLni/NOHDep09f2D7Pn0xBKYvd5DWiqvV4omcBBY99uKuyFivyuKvSNw9g6Fg//o2WEWBSsEiu3JEI7uHCQw49J7GARYTPQEFfKug8vjibLz56Geokr+AiVat+Lg5G5G0xvkc95jdF6/DTbkPcZM+9BG4wFHnl8/VLcl07QQ/PRVnUugHq2k7re9vjJyxvy8sYUYG34KR1l9znxCp3XEHlxYJ9hjXKwvX4A3MFVxV4whTDO3vAhSYWD+6CjZn/yqFLQ8obusOBUB/2Cu9zI1yljwtS711wCchYH0zmTKNSFMVMBGL4eQ6fSyLe7smoxxuaszNp6Wfo0EtMBbuwB73SdZp3s0oAfBhaP5DtaOiR6sgcAO+bEjpsPUI8mA3sxdvMmk7i95c2t6ZdqSxrf9fJgaPfSrse46Ez3Z9AMJ2cu5u2NJx1CWvN3IzVW6qZGFgZ3fKZC1BAXMwWZF/FP47IR4mzX0nu3gDFZ06ZNhJ2V8BgDF9GyvDGtOzNDpLTGrGmi1mVo0c0HPWMwfzQMHiYqwBZZAsgpF6yhcsbg6Cs0sdjR2jAjYR679YsqnW3rwpZsCbZ9h0uDVOtw9Sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(33716001)(85182001)(8676002)(6862004)(508600001)(2906002)(66556008)(66476007)(66946007)(6666004)(82960400001)(6636002)(83380400001)(4326008)(6506007)(26005)(186003)(9686003)(6512007)(5660300002)(6486002)(966005)(316002)(38100700002)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0VjRFYzWkhocHhHV1IrcHFDblZROWgxdlRzOTdmd0dMbFhZZ2c5SzAvdFFw?=
 =?utf-8?B?ZTNlUjV1TlYvRkdDTGhZcnFWY2lHa0VqOVVId1JUaHdsRno2SUtLN1JGSmRy?=
 =?utf-8?B?RWhNbEpiOENiaEw0WXZLYmJPeWFNL0wvRkxoS2N1eTkxTTd5VStTMldHVEV2?=
 =?utf-8?B?SWRuam1MMkVUc1F5TTUzWXc3dGorWmVEQUpmRnVtVmtNU2p4WG9JbzFFcWY2?=
 =?utf-8?B?cFNjV0VOeHppYlI5SzNlTUROTlZWMkVFZFJDWXQxd0ptWlFPUThjdGI1Ni9y?=
 =?utf-8?B?VmNXY0JvbXVMT2tWY3ppSWVpUHdYdGVPdDVmVEVLZ1h0c2hYczZacnYxajJN?=
 =?utf-8?B?a2Y5L0lma2JJa3l2a2VIU3YvazhiN05HeWlUZnBLN3pmTm42VVlGR3ZoTTh0?=
 =?utf-8?B?T1JBWEJzbDJMR2FjajJKWFk2aE9NaFRLc2lmMmxuRHYxUndMOHQxVWM1MGZG?=
 =?utf-8?B?MmEzb0I5N3VHcTdRK1VmMzlrc2xYMGxJaVNaSHJXNUxIaHgvN05vaW9JVWZ6?=
 =?utf-8?B?Y3NtRDlyV1pGVTU2akRpcDlKcCs0UmFRbFJtQnBUaEp2a3BhQm51WUFGNXBy?=
 =?utf-8?B?VlJMNk91V2U2K0V0cTVoc0NnNjU3QnhKMUoySnFodHBNUnAxajM2LzRhT0NC?=
 =?utf-8?B?WU0vL3hOa2lET0xpMHk2Qm5qckNZSXFJWVl5dmkvelNnbTJRTmUwK085Z3VZ?=
 =?utf-8?B?V0JZenRIWEFSM2JIdFNseExYNmI0RW9wUXFxay92Mnl6QzQzSHkxbDRUSXdM?=
 =?utf-8?B?Z0pVeDloQUI5WVp6UkQrcytsUkdTQlJSY01KQmZnbnNwcjdrZTlVbjVORGRN?=
 =?utf-8?B?WTJYS1EwZ2x4V2FVTTNURVM5QmZ1cFArNUZ5ekQ3NkJ3emFSSjJlKzRkbkw4?=
 =?utf-8?B?QWx6ek5Xc0lhdExmUmFCS2lMNWJmQ2hCYk5SWjUwVmNWZithWTFUYS9iZEdW?=
 =?utf-8?B?MWE2L2VFZ1diNnNFU2tPUEtnUkdZckhRYzhlQ0ZHRzJjZGZxSXJZakY4aDlw?=
 =?utf-8?B?N2RhaEUvZXl4OU1TMHhwTlo3M09ETk04MUU1OGVSYndBaDdONnYrV0tLK2l2?=
 =?utf-8?B?ZENqZ2kzdHJCUkJvZEtncGJqVHhpdDB3eXoxQnBPZlRLNmtRL1RhUTFSejE1?=
 =?utf-8?B?cURjUGtUWlBwSWprY28wYjBOcENha2M1Y2U5STU5SnlrbDVua25hZERIWm9r?=
 =?utf-8?B?MGZyUEFLOTlMVTZKTUN6RGlSQVgxeUZtaDVXdlN6SUFnL1NFcjZiVDNNUzBk?=
 =?utf-8?B?WHJ5bFd0TEdRSGEvSFdBWTRzMFpJTnkySVpya2FmQkFLQzJkOStXVnhuSG5a?=
 =?utf-8?B?eGFYV0tBTWpvQ051blJqNjRjVkM3RmcwK1cyMDh2NS9BOGVkaXpwcUtJNGl4?=
 =?utf-8?B?bnBYNjFjQUdlNkxuMlp5NjRvdnFRNmFkcWxZWVpFbVYrYW82S05kTVpNTzlm?=
 =?utf-8?B?VmYxcU1MSm9ndkJrd1lFWmhBOUxDTnd4YWJzaGJkeWVpSUs0YnFFaDVwZHB0?=
 =?utf-8?B?U2RQZC9XN0VMMVhCVHZxT0JJdE0vVnFJTEFJa0c3Mmw4RXFIZDVmbm84cGJD?=
 =?utf-8?B?b3dNR1FkOUN5OFV5QjJFS01WUFBqMHFNcEdsQmwzZ0FRdEdpRTNIaEpOaWN6?=
 =?utf-8?B?Zm1aMU9SdW5YcysxV2xvY1dOYmNCUytJTlJic0swclRPVzhHc0NNbHd4ZUla?=
 =?utf-8?B?KzNNSGdPQUpkUUNreFpnK20ydlpoS1RiYVhoNnhsSTVUYWt6ZE8rVnBkakt2?=
 =?utf-8?B?ZVYzdHlIUnFKZW9uN2tjUlNWWXV6ZDFFaDdrWlF5U3hKK0FVN1o0RjY1akFp?=
 =?utf-8?B?Q2t4aEpzTFovQ3NGczE4T2NIZ0d1Z3R4NlBmbTRDVy9ZUzgzTHhScGNZNGpm?=
 =?utf-8?B?LzJicTNVTVhJamN5Zko2cUN0QjFQNEV0QjFPVzZ0Y2FIV3Jzb3VkQ2FxbXV6?=
 =?utf-8?B?UGVxNFN5ZDZqZEE2YnVuN0hTRzh4Zkd3Y0VkRnlEZGpVS0MzVjArbVhwUjdQ?=
 =?utf-8?B?djlVOUkxSGM4UGJBM1U0R1Q5b3UvUjJ6MjVmQ09nUWY5N1NrYXlwSkdjN2JS?=
 =?utf-8?B?bk1lUG5FWk9xU05ja3VRK2k3SDF6cXVzWm9oU3Z6YVdXcDA1YkRqcTBVajAv?=
 =?utf-8?B?SEV4dWUxYjJ4Snh4d3QrdHp3TjdJTFRtcktGWDVqUmtnY29lZDM5Sy9WV2Jn?=
 =?utf-8?B?ckZvZTRhYURteXBiRHNhTVRSZ3lObWYyWEI0UmhDejdRdXJtc3JSdTR2MzZr?=
 =?utf-8?B?Z2NBTmZ1U3dPQ1NrVlBKQjBkaFkwOXRSRmNPL3BlSnBxeDBoNnYyNjc3WWdO?=
 =?utf-8?B?eHNZeWhSc3Ayek04VnJyK0ZUV08yZG1iYUlRVWw5anFTVm5IQXFkZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcbff28-aedd-4253-ea4c-08da34ee771b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 14:40:05.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7tj61wZYWCCCvYiTxYDYgGIgACugAIVQRh+wtexXROCU/D4R9wwNGJlSxyCEips7mzzYhCcMCTdY/b/PWuyEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2448

On Fri, May 13, 2022 at 02:35:34PM +0100, Anthony PERARD wrote:
> Recent versions of OVMF now need a version of NASM that is newer
> than the one available on Debian oldstable/buster. They want to use
> NASM 2.15.05 [1], which is available in Debian stable/bullseye. The
> need to use a newer version started with d3febfd9ade3 ("MdePkg:
> Replace Opcode with the corresponding instructions.").
> 
> There is no backport package available but the nasm package from
> Debian Bullseye can easily be installed on Buster as it has few
> dependencies and are already satisfied.
> 
> [1] https://github.com/tianocore/edk2/commit/6a890db161cd6d378bec3499a1e774db3f5a27a7
>     ("BaseTools: Upgrade the version of NASM tool")
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  ts-xen-build-prep | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/ts-xen-build-prep b/ts-xen-build-prep
> index 67b3eae62155..38d4a8e79451 100755
> --- a/ts-xen-build-prep
> +++ b/ts-xen-build-prep
> @@ -250,6 +250,15 @@ END
>      if ($ho->{Arch} eq 'amd64' && $ho->{Suite} !~ m/squeeze|lenny/) {
>          target_install_packages($ho, 'libc6-dev-i386');
>      }
> +
> +    # Use newer version of NASM, for OVMF
> +    if ($ho->{Suite} =~ m/buster/) {
> +        my $nasm_pkg = "nasm_2.15.05-1_$ho->{Arch}.deb";
> +        my $nasm_url = debian_mirror_url_suite_arch("bullseye", $ho->{Arch})
> +                       ."/pool/main/n/nasm/$nasm_pkg";
> +        target_fetchurl($ho, $nasm_url, "/tmp/$nasm_pkg");

I think this is likely too fragile, what will happen when the package
gets bumped to a newer version?

I think we need to store a local copy in osstest and install from
there instead of trying to fetch from the upstream Debian mirror.

I guess we could use something similar to DebianExtraPackages?

DebianExtraPackages_build_$arch_$suite nasm_2.15.05-1_$ho->{Arch}.deb

And fetch those using the some_extradebs method.

Thanks, Roger.

