Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1F530C80
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 12:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335746.559932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4y3-0001CE-HU; Mon, 23 May 2022 10:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335746.559932; Mon, 23 May 2022 10:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4y3-000197-E4; Mon, 23 May 2022 10:07:15 +0000
Received: by outflank-mailman (input) for mailman id 335746;
 Mon, 23 May 2022 10:07:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/tb=V7=citrix.com=prvs=135606018=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nt4y0-0000uU-T5
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 10:07:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b4ae6e1-da80-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 12:07:10 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 06:07:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3923.namprd03.prod.outlook.com (2603:10b6:408:24::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Mon, 23 May
 2022 10:07:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 10:07:06 +0000
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
X-Inumbo-ID: 1b4ae6e1-da80-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653300431;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=NqAUvl91fvCKDZuL7Qmvt1rOH7sKyRS+JLSMsm8mKko=;
  b=UX1fc9KcdIK87+5Q7tVBkQSdrqEC7n80ss6/jjdmysIu7YfATxcwQEaz
   cOhHIZCG3/oCSvlnqECQMGOLUaJwtoq3qwW1Djo56G+fJwycLwCWFlaIR
   X/c1tstyOE3+hLeY+DPuaYCrUyQk22cagDleroSPRgR54/S3GHtULHPqv
   4=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 71926948
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OTQ33qBON9cGARVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApD1w1DAFz
 mZOWmvVa6nbZ2X8edlza4y18xsDvMfUm9c2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nj2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhPy
 /VCtYyraD13faqVyeQ2YUkGPHBHaPguFL/veRBTsOS15mifKz7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mbHM0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx1yOhImEIwL6TjfQU+lWP3CZz6aLKCfzUdPKJS913x1nN8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXOguuWwgEO6X9NZK
 mQX9zAooKx081akJvH/Qhm5rXisrhMaHd1KHIUS4gyX1rDd5QrfA2EeVyNAc/QvrspwTjsvv
 ne3mNfuCS1qoaeiY3uX/beJrhu/ISEQa2QFYEcsTwEI/t3iq4EblQ/UQ5BoF6vdpsLxMSH9x
 XaNtidWulkIpcsC1qH+8VWZhTup/8DNVlRsvlqRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGe0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:IKs4c63rAxr9nF6klEAwFgqjBS5yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtrp
 uIEJIOdOEYb2IK6voSiTPQe7hA/DDEytHPuQ639QYRcegAUdAF0+4WMHf4LqUgLzM2f6bRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNNaWs19
 60TZiAq4s+P/P+TZgNcNvpEvHHfVAkf3r3QRKvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71926948"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/v7u2ANbge2TsrpE/qhQvwSAWRhSTZkEgrxGQOISq+hbUUOOGhua+N/pmFHKhr9RcfK7b+x+gr3NtuyjPqMPob5HxdwGGCwcZiIwRdVagHusWkPDB+blsiztN/14QFrDJ/c7PbaumYY0bN5nyU1UbXgA9tHOQ3luDbS3MDK+noyKxjcWdsNoIk/y2h3F3g4WKq0HAj/IYbtjnsJnvB+rbhWMxE++H05PhSv7pM6SYUzFtmtU4YpyFEVA5xgwb9wmf7eqheX5/ShQRq7yADHk05VxuP3kZDtrQF7EBGQqqovfjV6C9aWjg6NJPXTzTU+nfiXVJTk+M6ke1GkYw3nGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26E/DV1roI2sAcBvSS0wmnSdKy704aSFtfjk3zOs2Ms=;
 b=ZStdpMKPAS+/mBxO+lHXPKYE//1msPbS1FKIb3rc44pJb3jBxViN/an3knV1BldkMtR8OY4ZCBLnLjZAEsB96mBn43zH3UJfO48+yIVv+fVyRby1+iyTvIXkVSQ1IA5vBeTpDTvGvvKWmvTQKqaP3iwC+YCY14TZQfvEcYeo32IXXxBPzXnhJMqBmZd+A5d+/ty4h8KcROEvJ9KU/vMYHDDeud1+whurufSPr7Qq7U4nv8NqBE+a8Kpx2lH7oCetZBHhHL8auIdOQc+EepVHaMkMVIx6hU9pvaDO9xyuqeTorvCJ5HW+CmLku+uwCN587PA30Qmpo7OIfFAZgiK4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26E/DV1roI2sAcBvSS0wmnSdKy704aSFtfjk3zOs2Ms=;
 b=cTk7u+1wo4M1BfqXh2eOV99G2HbDwGxsSdK3QQCjxKSXF7IezeWXB6qgoj1TOe16HccmUdpBWYq+HN5qpmaDuhC9PfhC9zs3iikmAzDobfWj+myHcRQRLxUxO2VIcTWu/nvFt6PTeWT774Yq6YIVUWXlKm+wxGf2a1zK3dWN2F4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 May 2022 12:07:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Lin Liu <lin.liu@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/6] xen: implement byteswap
Message-ID: <YotcxufG467QSLab@Air-de-Roger>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <89b15afe026a84748ac0d9ca28e8608085454e78.1653295437.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <89b15afe026a84748ac0d9ca28e8608085454e78.1653295437.git.lin.liu@citrix.com>
X-ClientProxiedBy: LO2P265CA0449.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12731ba0-a62e-4bf5-0ebf-08da3ca3fdd1
X-MS-TrafficTypeDiagnostic: BN7PR03MB3923:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB39233F602960026C417A08CB8FD49@BN7PR03MB3923.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	srPx0JmQgOXK8ohO2y8Xu8YH1K0g6RI+PCQq6NmAlMKuXrzN3AMDjWj2DHwde13m/tZT+UjanPIXgFTXUHynEoK+Lqmzui4zIiW/qjOC+5Z6zqMf85ai2GMWklDmu6+yNP0wwLl7vs2DTC5DnErCzuh0K+PimKoBDvQDaGdbMqSwBqAtojjEKro4ndpgpkofHkFQOv2DKiAt5g/IQtoZfszZXcsXEWZO+Wc99Pveh5bO3fL4eC4d3wjP+P2KQhNG/e4ZRDlxD77jB6pjL4pBQC5yhDbiQ0pl670by4b16woVj3fa//r6Fy6NQEG6sFQoHBv57o9BW+SxSXN2VB61hA4pGeIsLJouV/lKSw5n3nUWL0MjWiky+AGB2BIz+7z+Pvgr8fmAnzbulqwMOSdSYSKccPNakAYzblk4oYuNMqtOQHr/4YhZQU7aMg+71KTFoK1ozpLz5P8UH7hs73dK0OeL3e1RU4Z1UDATm1N2USE77APUU7p+teD8Y1rKpmn2MpUw2+Jlt14586JpraFg9ICwDYDhNdK6bS9IwPeCvUyKDMc9i9NbRbrZckjt731KE3TGY6hYxBg9oY94MUgzOUefT+99sSBAw1ckjydrI1mt7o4y2UadfUtQnVcUgBcV4zhnTjY7xC2uF1andN2p5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(82960400001)(9686003)(6512007)(186003)(8936002)(85182001)(83380400001)(26005)(33716001)(6506007)(6666004)(2906002)(66556008)(4326008)(86362001)(66476007)(8676002)(66946007)(6486002)(54906003)(508600001)(6862004)(316002)(38100700002)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUZSWFdBTGxXSXlRVlhvNG5wbGE5YmpjY0lxM2FzVEtxQmtXQ0lPUVdLSWZo?=
 =?utf-8?B?RXp2Z1ZWRktvcHhXQ3JrTHQ1dm1HRldNaGJ1VXdJazB4QWFmeEZCOTRXZWhj?=
 =?utf-8?B?dWRUOUIxa3puZkNVTWRnTm4vYWZtNzRRaDZ6b3dGYUVSNEh5YTdxVlpleEtO?=
 =?utf-8?B?SG9vL0hBN1pPRyt2LzhXQVZ2UjJpb0JNRVBPVVYrTDBENG9jQzZHOUNKSTFL?=
 =?utf-8?B?S2VTRTNGd0Zta2c3bXhNVHZVWldCQTFVN2dRQ0pwblpXNjdiMEtiQ2FKSnlu?=
 =?utf-8?B?NFpFU1NuWklsQ3cyVE16TWdzczlDN1BzYVNnTnBURXREdlRLYkhYS0JwR21w?=
 =?utf-8?B?Y3BmbTF4ZnFvV3BXR3VoVkR6UUFDTHRRSXhweHhJQXRVU1JwQ2dBemJhT0Fm?=
 =?utf-8?B?ek5pOXNaZkdhNzFNMGRSMDZyendubTJNaE41aXR5UWVpQ3VhQThyY1lnTm1y?=
 =?utf-8?B?RFBMN2czdXZaZGREaGRrTHpScXgvYVUyL1NtMXhJQUtoUDVrVGdpbXBvMHIr?=
 =?utf-8?B?akFiK3R6cXpxcWhXR1JVSkczTjNTMFVka2Q2UjIzb2dvL1lqWDZ2RzJYcEYx?=
 =?utf-8?B?K2FnemgrdStaZzkzdzMrKzlSb2hkeDE4dTF4dktBa2lBUVMwRFE2ZTJmSGJw?=
 =?utf-8?B?ay83RC84ZTVBOUh1T1JXMDYzQUZaTmJIRGR6Z3JjWEZncEZwR0kyTnRlWEtP?=
 =?utf-8?B?bFRMNDhBSS82cEdPaXRHbHZlMUJ0UGswUlVZSVkyS0d5d3gvLzk4a3BJbWo5?=
 =?utf-8?B?d2hzakFGN1VweFlCSUR0ZVlqbnJDWkUvemRBWUxUcStMbU5GUU1tQk11T2JP?=
 =?utf-8?B?VDBKZFRHRm0rWGhJVU93QWtiL3BsdkFwL3RoaSszVnhPbXVFUWZQdjF1VS9S?=
 =?utf-8?B?a2tqdWI2RzRTb1dPeFBWNHNmUTNQVS9IQ0tZVWJFa2doZml4ZXFRWVM4cVpO?=
 =?utf-8?B?QVVGdDB5UWdXSmJWQ0xla2hxSFR0QVdycDFyNlQzWXNWaWNMdzU1cVJFQzVU?=
 =?utf-8?B?SkVIYThWaStPRWpkNTZGenFaYU5Pbi9iUCtubmxMMy9wZ1RVcjVkQ2Jtckd1?=
 =?utf-8?B?NnQyZjhiZC82UlJiTlRsNjlXTjN3a1ZRTGczdkhxeUpDUlUwSFpVaEJCVExX?=
 =?utf-8?B?M2lGc1J3ZVFPczB1SmtDekhmZi9qWkhaSWlRR0VreGNjOExrWStCY3diZzUw?=
 =?utf-8?B?L2ZybndvZnFmVzM3T3NqNmhYM3lkYlJaR2N1SUE5MjVPTTZKVGtTWDBhRnVK?=
 =?utf-8?B?M0VZb3p1ZXVvSmFtckl2MytzWWZtdXhSTSt4WnJ6UnRLdVdLcHJlUWNIZE9x?=
 =?utf-8?B?M1VkUVhoMEVmZ3ByV28yWENWMnU4TElVTU5mai9UU0RhN3Z3bXRmQVdLZWM3?=
 =?utf-8?B?SkNVbk5zL09DYmNaS21ZYnVCUGlXVHc4SzhBZmo2TGhKdFhRU1RCS1BCY1ZD?=
 =?utf-8?B?ekJMTExoWWxwbVBnSng3OW5WVzNPaGg5MWhCLzlmWWdvRVd0VDdnaktiVWMz?=
 =?utf-8?B?anlKWGNUcDJ1eFBKdklYTFc1UFhwU1BsN0V0QlRVdlp3aW5JNU5wSkFGdGVU?=
 =?utf-8?B?Q1l5eUlqQnR1VVhTU3FKVUxIMHBydGhyM3lwUWdIeFJqQ0dtWG4zdWpxVjZ0?=
 =?utf-8?B?RnFKOFZMbXlsb2gyQUprcFgvOWFSVmxubkYxM29JQzUzOExnWDRkQ21ZUS9R?=
 =?utf-8?B?UlZQZUNvaUFic2RNRWJDS3FWMi9rOXUvY0FtTFFrUFgrTEl1R0VpRXo3K2Iz?=
 =?utf-8?B?S2tBaWo4dmxiR3hSMU4yRHpCRUUvbHgvaUFuekxNa0VrWGUxNGQrQzF0alhY?=
 =?utf-8?B?S1YyMkVGUk14K0RhbUFOWWg5N1J4eXBBTUV5d3o3ZmdsRll4bWJsS0JjMnRV?=
 =?utf-8?B?RkVPT05jQ2FvWjBTR1FlZ2x3WEVTVWJzKzM3TVhJbU9IWUVVcCtEdVlsYW10?=
 =?utf-8?B?QkxUWnl2SWhHb25nRXZSNEZ4MHRvUnA2Y1ZvdGVPNHo1eFAxcjVwM3B1WHVI?=
 =?utf-8?B?d1pHOXo5L2JLemZMZ3hRLzdyRTltdTkzeEhYTFpZd2R5TU40Sk1oWjQ3T081?=
 =?utf-8?B?b1c0UStBU1MzTHVyMUxLejY5TE9XSkkrUHlLN1hVYXY3RGk1VTVxTnh0SlEz?=
 =?utf-8?B?ZXNGeGtUQy9iNHI0ak9tV1FCWmYzL082aEU3UlNUOEhYQk9XTUpLcis5RWZ2?=
 =?utf-8?B?VXlNR0Z5cVJxaHlObWNlNitBUVVwZ3FnVE9nSncxRVVCVDNsZVZuNEExcmRo?=
 =?utf-8?B?RzJYVmpFY20rZ3pHOXZVMzBWTXJNYUhxQ3Y0YlM5djNFSXhFaVNqNkVxdWll?=
 =?utf-8?B?YjhvdzFLR3NEem91YlR3MjgzNGc0NG1pdW1RMGl6NEhHNUZKUENFc0hOK2I2?=
 =?utf-8?Q?kQR7+3E8MnAsilrw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12731ba0-a62e-4bf5-0ebf-08da3ca3fdd1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 10:07:06.4049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kk71R3jyPwCrI91JcKqFdtyDLSfPWNWiXyL5illFzAokO1Rnjjf8SON01PzGuSHYeS5EjGTvn/jVZ8NDEDCbLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3923

On Mon, May 23, 2022 at 05:52:17AM -0400, Lin Liu wrote:
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 933aec09a9..ae029afa14 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -185,4 +185,28 @@
>  # define CLANG_DISABLE_WARN_GCC_COMPAT_END
>  #endif
>  
> +#ifndef __has_builtin
> +/*
> + * Backwards compatibility for GCC < 10.
> + * All supported versions of Clang support __has_builtin
> + * */
> +#define __has_builtin(x) GCC_has ## x
> +
> +#define GCC_has__builtin_bswap16 (CONFIG_GCC_VERSION >= 40800)
> +#define GCC_has__builtin_bswap32 (CONFIG_GCC_VERSION >= 40400)
> +#define GCC_has__builtin_bswap64 (CONFIG_GCC_VERSION >= 40400)
> +#endif
> +
> +#ifndef __ORDER_LITTLE_ENDIAN__
> +# define __ORDER_LITTLE_ENDIAN__ 1234
> +#endif
> +
> +#ifndef __ORDER_BIG_ENDIAN__
> +# define __ORDER_BIG_ENDIAN__ 4321
> +#endif
> +
> +/* Indirect macros required for expanded argument pasting. */
> +#define PASTE_(a, b) a ## b
> +#define PASTE(a, b) PASTE_(a, b)

I think it would be better if byteswap.h included lib.h, rather than
moving the PASTE define into compiler.h.

Likewise the __ORDER_{BIG,LITTLE}_ENDIAN__ defines would be better
placed in byteswap.h itself if possible IMO, since it's not strictly
related to the compiler.

Thanks, Roger.

