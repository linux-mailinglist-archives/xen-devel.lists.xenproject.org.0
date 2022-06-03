Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B553CBD1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 16:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341589.566836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8hi-0006JF-Rv; Fri, 03 Jun 2022 14:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341589.566836; Fri, 03 Jun 2022 14:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8hi-0006GF-NQ; Fri, 03 Jun 2022 14:55:10 +0000
Received: by outflank-mailman (input) for mailman id 341589;
 Fri, 03 Jun 2022 14:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOPF=WK=citrix.com=prvs=146533d13=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nx8hh-00064G-14
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 14:55:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27eaf85e-e34d-11ec-bd2c-47488cf2e6aa;
 Fri, 03 Jun 2022 16:55:07 +0200 (CEST)
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jun 2022 10:55:05 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB5180.namprd03.prod.outlook.com (2603:10b6:5:1::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Fri, 3 Jun 2022 14:55:03 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 14:55:03 +0000
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
X-Inumbo-ID: 27eaf85e-e34d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654268107;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xb4wXTKLdRW+CGigAx1RYDOF+sJKiU/boCHSprKBQdo=;
  b=W0ifJcu6K5nxOrU60SHa3+FXbuT8ULr9oKfE7vb6YMksqj6eSAogFJfw
   1TrIXLacg6MNw0UKjyn1cP7djS5ZFTG5AUNe+lt7mfXTkEfg90gXJAT0v
   ipsldXXW0MPeHWL+lpSUFir7wEJ2xlZq0Y3DknGwNRPi1wTSNdp6ff86B
   Q=;
X-IronPort-RemoteIP: 104.47.58.170
X-IronPort-MID: 72815668
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F41x3qLqoYzeZzwWFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENSgWQGy
 GQZWDiBbvzfYWDxeIokat+xoE8O7ZLWydA2GwZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3NYz2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I9Bvr6PTkRzBf2StutMfQV6KSQjLYQTrdcrIVDn2SCS52vvViK1ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMCFGvqSjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SOvKmAG9gL9Sawf8jn+wiFj3JjWLNuES8OyY5pzwkmgn
 zeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPJVGuw+rQuLmqzd5l/AAnBeF2EZLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:wRkxoa/91xR1h2S1szRuk+FEdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 yhz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlCl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFc1ccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiU7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri6knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdo99RrBmc4a+d
 RVfYDhDK48SyLbU5mZhBgk/DWUZAV9Iv/cKXJy+fB80FBt7QJEJgUjtY4id0w7hewAoql/lp
 v525tT5cBzp+8tHNZA7bQ6MLyK4lKke2O9DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.91,274,1647316800"; 
   d="scan'208";a="72815668"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGgvvyTvZAVMYKfOiWz8iFkYzctGxkLZOQO+pUpD5Y545Mx0BrTIDOps6ekmwIPed2BbGV9R7VRAakZhQk2kO21QwZ+A/2B12P8hP9NOxWKtp3M8B7YnlZJgC7DGCUuWpnKxv6dfgGBYdAlLwuh3VELJfIFm/Gj/OdBkYIOW1NZuIB4abaO7ptt+R+Ysqgq92BSkBkVptXl3UZlBFnZl+bx99ANZAHiNUIxjGfXERV67oTymBxACZh5J0KRuLbo9iWEEylZEtO6+VmYL6RzSMbYnvFtaH3xGBClVlnlblCV1y675R8LhWOoHfxYCFYlJe+QMnO8ZzD44WhTD3UdB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt2GE1XUFdHp3jNRGW69KKUoRxG/iDikG0bNOy8uIJA=;
 b=YgQJ20nBYofnyRD1ulFBifyJgxuWlvdW5BGQK/Ryg4oUdcaq+yE6ENFkxw5HAHnKbSQZ6AwC6Kqx4SgmLM69oZsLz7NgX7UpTeZX9ZDSfeHC8fVfRU1cSoKsH17zZZcjVr4pWryTsM6fbIoKpQ4rK3vpXqXiBC+QsFPCWTKk4Rh4fwu1tuYvBHxgQQe/bnJn4r58x3VktK+WRESxYNtciCaF2WHYG5J/UAXoJaJycgypAVDVJfvZIj/I4RXcKlfAOZDiivdta9oH15t7YlEimVmhCXUjYmZR3Fd49w3gMUe0yqkWzjNg0Dvm6FdHJu1dyK9L9HlbRWcmPp2mVFD64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dt2GE1XUFdHp3jNRGW69KKUoRxG/iDikG0bNOy8uIJA=;
 b=gr5Bf107Xd9pubGRSKmy7POjmgTi/HHozEDRKzuwzgqQctq11aUeTuIMGQIv2PXcTRauQP/0u6YO/b373bNEWsDGFyOAxw5GYrK063M/5viYo/QtcbYKmBmF9hDtdXRO1InPn/nnEO2OtQsG5pv8X/sfyURPwGGNaKV82hGiRDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Jun 2022 16:54:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC 2/6] x86/ioapic: add a raw field to RTE struct
Message-ID: <YpogwwKnxDjCc1xs@Air-de-Roger>
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-3-roger.pau@citrix.com>
 <3b14d173-b0bf-f8e5-70c4-2c9a3085bffa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b14d173-b0bf-f8e5-70c4-2c9a3085bffa@suse.com>
X-ClientProxiedBy: LO2P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84f4b351-2141-45da-19a0-08da45710a7a
X-MS-TrafficTypeDiagnostic: DM6PR03MB5180:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB5180874FFA38076503D7A7D28FA19@DM6PR03MB5180.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xTGN1pZf7PGjwwxLUSxdhTh45Xu7a7zwoox8c4fkQ8rEEtJsPSPPb7wprf4nCIu+XJJBA45foPnhcR92bv1VGGelBwJ8Ssk0nuvV4dqMPfPk85kvFQ8vm+S9hrvhpCLYMcyZLvBy7tpUx1kvcgc/2nsDB+3R62OVF1rbvxBGnJGcO+9YlhaYvh0GacUDPlj5HZx2R5OUTHxKVkTLTqC8fkaRfHxQPdjjNwCnJVft+oiUoXD7WtXYBSkLp6G073OH0u6/nzXvJN6gpz0pUqbU3IF2kNPRSH0XgX6+xXCFNmCeqWdoV3uO/euSr7reP1RHJnnxo5+VH2NIRjoCLTl7qdOY1KA7QDRjU75O/EjT1kqkH2bNT0O84BX7TAgRHylvuHgJt1HL/FzGs2nkQX1wtPZbnX46DffziuBhygSNOtttjKnVbthGu4xD3DmZ/avRy922RYl5iTRYjTwfLzzJNPY65iSRYAH4jf5OFfXXIR87/GRj+A66OtMaHAS/gYY0U2NmGTJiWoh8wXkh3dYhynqdaQ1IhfCLFarRJ7DJbCDNvxUROhNLeGgqVrAj+w7TTbE8i+sYK20hiX2sUZ9CQX26ELFk4AGhZt/c9ScPPHkwk0HIHzGnRN6z9TWMHqCyvLywRD27dwu83vR2Hy5WXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(6486002)(83380400001)(6512007)(85182001)(38100700002)(53546011)(6666004)(9686003)(26005)(2906002)(66946007)(8936002)(6916009)(5660300002)(33716001)(66476007)(66556008)(186003)(86362001)(8676002)(508600001)(316002)(4744005)(4326008)(6506007)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjNXYzV0aWJ5NXNBc0t4ZmZhSEIxdVFYTGhBZnFjRGhzUWUxYjRuL2ZzV1pK?=
 =?utf-8?B?WEQweTNsaSsyTlZFQUF2aGw3S2dGb1lVSW16d3hTY0RZUCtGOUdoL0NtbnZ6?=
 =?utf-8?B?SUZGeFlFSDhMSlA1VHhLSkJlMnNxaFd5U2NJZW1JSEVJUWZ0YnMyTnpLYVl1?=
 =?utf-8?B?Z0RLOEEvak9USzBld0xpS0lEUEZ2NjlvK25KUndSNlRDSU0xOVBtQkRVK1Qx?=
 =?utf-8?B?SzR4ckZjNytSZDkxUU5IN1JIM0VQenM2WG1qaFJ1NzI3SFVsMGtNcW13MGFT?=
 =?utf-8?B?QzhTMytHdVNqU3ZPTWVCT3FqanRLbzhSeFRlZWxmaU1aSGoyVXZuZUZXVTJB?=
 =?utf-8?B?UWVpUFVyRE9wSG1CdmxWVlordWU5ZUl4VmYyc0c2eEd4S0I5TldFZ1pMTEtt?=
 =?utf-8?B?WG92REJXMzdGZit5cXlNWWppS1RqVkRJWHNnVFd2NzJUL0RFY1NtWlNyTDhn?=
 =?utf-8?B?eUtXTVhXb3daenl4OTN3VVBBOElVZVlvaTVOYThldnpaN3ZHQmZwZ085M2Iz?=
 =?utf-8?B?ZXRFRDFpVHZoVjJJYUVTbVpXSDdGcUpLU2hLeFViekR6bFc1NFJnTjJ6L3NS?=
 =?utf-8?B?QnMxcGI3cG9aTVIvV2dHeEVIZ2FQclI3K2d0WEM4SE4rT2pDK09WTTlNbTlz?=
 =?utf-8?B?bE10N0UyWlU3YmU2ZDFvRkVxeU9HendUSHdlODdhSGtnQnVGeDJXeG9odzVj?=
 =?utf-8?B?UCtMUU9JckJQUkQzTU5sRDl6a1V4azBFOUVBWmlFTDRMdHUwUFV3UUFKNnRC?=
 =?utf-8?B?RVpuSnZNUDNJM3pMby9VRXNiVFFwV3djc3ViTllMNDI2UGZVYkFZNWQ5Q1U4?=
 =?utf-8?B?L1VaWDFmOW80T1pyNW1ZNGhUbmltbm1QRjlwbDlFczhRRlMyMUNxd0dMRTg0?=
 =?utf-8?B?cXp5QVd6TUlmdUxRVFZ0N3V3Mk1oYVluSWg5TUh5c3ZPWlN6d2c4MldZNzhZ?=
 =?utf-8?B?eVlHaG1NczlOY0tzV2VQMkpwNUlsQVEzMFN3YmlKd3ErT2VoWHR1bUIyRDVO?=
 =?utf-8?B?ZGQzb2NNSW1MNnQ1T2hMQVNoZkUxazJVV1hMeGo5V0E3Rk8zVzlaNU5mL1V5?=
 =?utf-8?B?Mm1VOUcxVWJ0NzYrMGk5WGZUb2hhZlM3aFpHRHZzWHdVOFQxZ1JlblJOQTNx?=
 =?utf-8?B?T1YwRVhFYUZOQWJpeHBIRFN5aEwwbHBDTEIySFlRWlJwN05tUFpVR2N1dHJI?=
 =?utf-8?B?S3RoR3RZUUZveHNGVUx6ZWtUOFlIZE1MNVNuWmhlekxzVUhFckFMNHRrRzla?=
 =?utf-8?B?YTVMYWFLSjg0ODJzMlRQVUpmR2J4eGtSWUplUzFPd2s5WW5uS3RCYisxUWJC?=
 =?utf-8?B?eDhPcmVoR2dncGVJNWhvNkwxY3FIMmZtbkxreFN5VlNnWXhwaU52TWFwM0I0?=
 =?utf-8?B?QjFaZHEyY0tLVHc4bUVhTjBHdlJidmxaZUdyWFBuUHRmanoybU81MzJtVVBw?=
 =?utf-8?B?S0dSTzdvU3dsd203T3p3OWdGcUJoWVFibHRuUldIV1RsTC9OL29tVXM4VUJG?=
 =?utf-8?B?czYwbERiMXZ6MWppN3Mrd1pEZktHR09kUThmTGNVcFdGditoV3ZWMUJ4MzVX?=
 =?utf-8?B?V2hZMTFTQXE4QlFwOUJ2cHA2a05sT3BZQm9MM1haN3lGbkFBemNNaGRNNFJW?=
 =?utf-8?B?dUpnZ2JRRkUzNEZibUc2aU53Q2JVZ0NPUWF6S1lyc0pvc21UdGU4NVEvK1U5?=
 =?utf-8?B?ZDBkOFlyQ1pZclprMW1wZUdmMVo0WnJHbUFSS2lWQzc2dlR2QWhJZU9PTm5F?=
 =?utf-8?B?Y09PQkJhZ2l1RXhRd01kVFdyYVFML0pLbFRUQ2tRZGxXWjRlS3U2V0NtUGpV?=
 =?utf-8?B?YzMwMzJwdGRmVHU2Y0d5aGR6RGJncXNvNCtRVytBSUpTcTM3bE4rb2FFeEl3?=
 =?utf-8?B?YldObTlLYmo5cml0Rkx2UjlnY25IWmhrbUJXZVkxNEZTYlhiNUY2NFpkNVAy?=
 =?utf-8?B?NE1rYUQzajVRZFlxTm02bUlDajRqRldjdGMwZ2dmSDNjem00cWtGTk5vamdi?=
 =?utf-8?B?NHdRc3JCZFNXY00wRnFGUkhjSlNhOEMxanA0WXJmZ3M3OVZLam1mWTNCamVS?=
 =?utf-8?B?QXh5RGlRMVJOcE15Y28xTnYydnF1bG5YVUtjTlVxTHFCRVNOSkZjNW9KZFhh?=
 =?utf-8?B?N2xKVFl0eHdKcHBCKytRblRlU0ptd1h5MUZ2MGlSd2IvclVZTUI0WUxwMDlq?=
 =?utf-8?B?OGJOSEI5eHdEWHFlL2JrSEpOa0JKN2RnYVVzTWVFOEpobUZtRi92MWZRMkl6?=
 =?utf-8?B?M1l5RmtyQ3pMZTRrY0JKSWlFY2NIdHJNWnFiNDM4VEk1UDYxVGlGK3RhMmtP?=
 =?utf-8?B?L3MxQTJGWHBPYlVoQWtMTjNzcE9tdy9ORktBRnh1S3FmSFN2WkxLQXcyQ2xB?=
 =?utf-8?Q?SKKCNSmQBsicEw/8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f4b351-2141-45da-19a0-08da45710a7a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 14:55:03.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zvn9pDXMSk6wDZ2WCULowT+EP7GqOoRmSPPDdfgumW0uR/KuDl1fTw1Lzu23hZiEROkg28MUXxyjRO1n7xCglA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5180

On Fri, Jun 03, 2022 at 03:24:37PM +0200, Jan Beulich wrote:
> On 21.04.2022 15:21, Roger Pau Monne wrote:
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Once seeing the purpose (in a later patch, I suppose) I certainly
> don't mind. We do have a couple of literal initializers, though (see
> e.g. the top of ioapic_guest_write()). Do those still compile fine
> (warning free) even with old gcc?

Will likely need to test it with the gitlab CI.

Thanks, Roger.

