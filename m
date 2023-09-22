Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330207AAD04
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 10:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606790.944825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbmX-0003AD-99; Fri, 22 Sep 2023 08:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606790.944825; Fri, 22 Sep 2023 08:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbmX-00038X-6K; Fri, 22 Sep 2023 08:45:01 +0000
Received: by outflank-mailman (input) for mailman id 606790;
 Fri, 22 Sep 2023 08:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CgRi=FG=citrix.com=prvs=622ae25b4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qjbmV-00038R-Ew
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 08:44:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dad78a4-5924-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 10:44:57 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2023 04:44:44 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SA1PR03MB6322.namprd03.prod.outlook.com (2603:10b6:806:1b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 08:44:41 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 08:44:40 +0000
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
X-Inumbo-ID: 4dad78a4-5924-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695372297;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KjBjDba3erFVcBbC6GrhhaZtQhLdQdmuryJdWpdAShM=;
  b=L4m2ELAuQzEqnw+ZzFut87rdpDl00dUp+zXV/SlvwHhXX5UT7U1uoOBo
   oh/SxI6icB7VpDrshtKoKq2AwIZsTuK3EilSZulZnUAZitxaEKjS2gYHX
   1++FlME5ZLHT+q4ga/zc4mzjmIV/ivGICVrmQTOAftd03mEOeRQai/igM
   4=;
X-CSE-ConnectionGUID: sVg+TC26Tuy6IQTqnrW4og==
X-CSE-MsgGUID: O04VoYTHRF+UnroIR4aASw==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 126231977
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:K0wy96uCJq3KEZ67JrIxtdcmHefnVG9fMUV32f8akzHdYApBsoF/q
 tZmKWqOOquCYWv8edF+bYjnoU4BsZHTxoViSVBl+yg9Q3sU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5A6EzSFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMw4CLSyo3byK3aPla9BQn8I5E5XsM9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtxIT+TpqaECbFu74TRPNhonaXuBj7qEjFS5eugDI
 mUv5X97xUQ13AnxJjXnZDWGp3qDsg8ZSsBnOeQw4wGQyYLZ+w+cQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAOMWIdbDUYCwsE59Xuqps6iB7nR9NvVqWyi7XI9SrYx
 jmLqG00geUVhMtSjqGjpwmZ03Sru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGo3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:gWZA4a0/PZzwAch0dRk6bAqjBIUkLtp133Aq2lEZdPU1SL3gqy
 nKpp9w6faaskdrZJhNo7690YO7IU80jKQFhrX5ZI3SOjUO21HIEGgB1/qb/9SIIUSXygc679
 YFT0EUMrHN5DZB4PoTi2KDYrQdKLHtytHKuQ6n9RhQpPZRGsRd0zs=
X-Talos-CUID: 9a23:nH2cXmE4rFliaws+qmJ8ykFXJut/LEHA3SnxGnOhD3xWFLqaHAo=
X-Talos-MUID: 9a23:MoMcIQV6cGKBuzvq/Bi02A9lBftI2YrtNUYXlrQ858CtDjMlbg==
X-IronPort-AV: E=Sophos;i="6.03,167,1694750400"; 
   d="scan'208";a="126231977"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/MdO+znmlC34vmjsbL4SCm8SQ+cFTNKkrvN6NXFwn8FAc82jV1OGmZKNmsxUwzqQLTVHAsyRli42BX7n1Tailqp6NKKmjyz1+D5FlGxg7/hyH/m3ZfIsP3GkmB6kmEk3R1PEQQe5N0lojPz2TMwdgN6yL+JjwS9ks3qXxFnR9WW7M1YXDrANetPbwcJ+b47BJu89ytXR6Gu/k+Wvf1bqHEzmqpBsS9NQ5eBtvWGGWJePq0X63bnhwTYjqgCgXVWU6lnwCk2IAzQAUGi21Z7VJu5LeXz/6qDXKBJWUCw2bNskIjvMtf9CnD3QV/H+DaT58Ck9nEEXhv4AciwSiT8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm2K6mwwlFjE8Ke+CWTxB2i5nH8w8q2XvV6lAJdIbPg=;
 b=F6XGbIUSqPyCpJrQQV4fTaHLjOjmkXF6Ohi7cdyXvGhr+TEwI2etrmHYYWpsK47VC+1BF3SWrND34WWRXiDb3JhokBUd221MkO2qKkAAgYrxsJI5Jf8q2/3DWJnUMClo+pcj2ASjtVP6rhTQEImyVTEwxflXTHzmqUOit6bZaIDFmODPzJZUWcqBz1QwZdvGPS3ZkD4rlVBt4B6/b7HfaNQfrSSD0CBP7I1wofqnfb5pz8hrrnKzKTIzKcJ8PdF3TkueIj2bKThae7Zc/NiT3sOngSB7V4HeW47pO8x/uoykuHZwxBdbnrLZ8mXBs9VDpnBFA7E+JXdZh7Y33yPCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm2K6mwwlFjE8Ke+CWTxB2i5nH8w8q2XvV6lAJdIbPg=;
 b=qMchSinv+YqHhphWVdO9NB0efcsLCFcs94Yxs5T/RyKvgQcgQk7c2BIQAvzL9MUtvQBfmdC+9zfXG+JLefcOPhzVqlft4l7IgM82WoxpxCebdV7gjLTIf71957mlrdwUOaBuGVVQWso9HMuRTYnnFg93+YevF3mjucoGh4pm74g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 Sep 2023 10:44:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
Message-ID: <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SA1PR03MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d2eb87-7015-4197-a97c-08dbbb482936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FlxL6ERoD8LXuoZZRx/7kg6TIeusLbDr/BJs93AcvmcoyPU6GrnJxBBr4shMg0Bko+tnWNsQx/aHx+m5dQ6gcpetWvoq3PXKvZun6mStiKtENPCuKtD+pND11Ak0iIHebv3Rd+cl4tOf2Kngya+BorsixG9YNjlx+OGRITr+ezAd3hudoqOR5mrMAldcWYI4BQFZEBq2EifF5IFM0JPwrM4rH+43KiNfyTBr/4FlYoqSldC6tLkGaxb4/OF3oFGvSPC8SHsz6MrxcvHLKx6vvuqjh/VJAP5nfD39D0kHtskxZDKCKLrjAxqsScNQ/aM9qzxb8v+j4z1BwF7/MRHfX+oYqrVIUFeAqAgp5e2AWTVlpBIR/2VgbWW3zgWZNoSBSIYWXxU+uZ7VeXHdLGooPfspq0NL7aScEL6V8gDdRPi/MAW9f8R3DeXIyCyqN3bJvEdJC0QIoa0qOmGLBmjpyYNm8Y/IwoiTQoqO3zCAr9+5A7GnqsAWks8oufFkVGWdkDrPd6wjkDLexrZDbzNJaumjCsQWmX/tnnT19AIv8sjUOzf+5h+adTOcgu+YnFYU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199024)(1800799009)(186009)(38100700002)(316002)(6512007)(41300700001)(4326008)(8676002)(8936002)(6486002)(5660300002)(478600001)(66556008)(66476007)(66946007)(54906003)(2906002)(6916009)(86362001)(6666004)(6506007)(82960400001)(33716001)(85182001)(26005)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3Vta09XSE0zNnBaTGJEbXJteVA4OU1GMGp3cndIS1FYSEUyUGxGNVZOYzBh?=
 =?utf-8?B?eWRPTFRZMGNJdXVpTGRxb0FLRHZpellVWldJTUVGYnFZOFJTY2hYZXlSSFdW?=
 =?utf-8?B?ZFNLUy8wL1RGMFdFVUJVaUVxN1BpWWs4amJlRjZjaitpWTR2Y0l0R0haeElR?=
 =?utf-8?B?eGluNXpjK0g2RUVTT0F0TkdtVCtVTENEdGhQUWFLdUxqSUFtc0JYcHhJNlpT?=
 =?utf-8?B?R0xEZm1xVkJvVVF0bUJNRmhIZGd0RlhrMExLNXYwZEh3OHlNVURMZ2plSXRZ?=
 =?utf-8?B?ZkpuU0VRMGZRa2psS1JabjFKcUxEWldWZzJzL3pVM1QwVHBUUTZUcEpjbHJE?=
 =?utf-8?B?OVgzL01DQmNTa2hVbC9lSlgveVhDSkQydGNtR1MxcW5WOEx4TEwvNTdwazZL?=
 =?utf-8?B?ckFiSGxKUGZvZVlZNzRBMDYzd1NobFA4aGw2Mi8yaGxFUnl2S2tBY0J1TE1j?=
 =?utf-8?B?YUNGajUvUExQYUtrRUxVTmFtZ3FrdXd5dE1obmg4UUtaNDlFUGZUTit6d0Jm?=
 =?utf-8?B?K0JPeUJnM2xRYlhzSTFGZGNMYWM5WTEvVUlQNEhEOTBna2ZET2k2MDZTbUlk?=
 =?utf-8?B?clUxckRpb1QwWklhVmNjbjBrbE5rN0tEdmVkTFpmYjdCamR1ZHBVdWd6TDRy?=
 =?utf-8?B?VDVKWENoWmNLTS9vVXh5bENDamkzbmdqYThobTJ2dFBEU0xaUzF0VWpEZkMw?=
 =?utf-8?B?WjZrV0JiNTA3eWVJUUVaUlU5L0ZnbnpBa1NYc2U4RnFKYXgvdVlCczNaSFpv?=
 =?utf-8?B?bnNLV1hWZ1lZdHJCdEJlTklqUzNaWEtyQVNSbzRaQ1F3bm9jRU1lL1ZDcUht?=
 =?utf-8?B?RnIwWlg2b1hxVkpVZGdwQ09rTlBWUzFHVE8wOGRlZFRGQ2J4d0x6ZkVhUG5Y?=
 =?utf-8?B?Wnk5YVFBY2g5L2t6c1RYM2NmamxwenJacGRwdHJUQzdXQkhEdzlTaXV6MnpB?=
 =?utf-8?B?S203ZU1YQzhMR3hTOExVYkY1Y0tSMldGNC9WOHA2YXZoZ2ZwVDJWUDBPcS8v?=
 =?utf-8?B?a3VsaTNjUEEvQ2NmQWw5dEcybzhYeTBWUFgzMkxZdGVCTHdHdWtqN3Jpby9x?=
 =?utf-8?B?Y05HQVFvb0d6UEoxSXhQSnRvOHpkTElwbStENVdaUlBtYjM2Tk45SCt1UTVX?=
 =?utf-8?B?NUxCMG5uKzZ1OVlzSS9meE80NDZFcmZmK1IwYjNyaFo0WUg3cjZvaEx4OFMw?=
 =?utf-8?B?YlVFSTNqWVhuSlVJOURxS1Z0ak85TXZVdDE3elhGZktKV3I4WkZqVlpQQmlQ?=
 =?utf-8?B?b05JV0FpeUZlclJCaUJVb0oxQU9nWW5zdURwVmVnQkY1WW5sTlgreE54cFNq?=
 =?utf-8?B?VTI5bkVBZVl0d3lHdHZHNytYVlBZQUc4aHc4V1JtOE0xOW9QVjJURityYlNx?=
 =?utf-8?B?dW44RmxCUTJOUzE2cmZ0OWlqOWJyYzZ1dkJCVmVEWXlEdURGTlo4QW1qbWh0?=
 =?utf-8?B?UW5zbXZZWVNVUkhweDBUWlBLYnRUMU5KSDh0S2FPTWJ3cTVwdHNhcHJTUms3?=
 =?utf-8?B?eFlnNnNZWnlLbytpVElDWEluTWxwL0pDczM3T0xUMGlMc3ZJbCtRelpGT3pI?=
 =?utf-8?B?OHZuc0swanFQQnRheG1RSjMrZ0NjaElPeVBjSWU4bXNrVlpPeHRGSUtEWThK?=
 =?utf-8?B?VlBoYzJTd3Z6ZjVEWTZVcVR1L25lWE9CZjh6WEtmVkduWjZZTlo4UklFWUE2?=
 =?utf-8?B?ZWYxblhBVWljckl6Y3ZYclZiaFpCOVpMMkZ4WXlXemtYY1Y2eURBSmhZdjlS?=
 =?utf-8?B?aWpIQVVVdyszUkNOZDRhZmkvZCtqeDNvRHdSNldpd1cwd25neVlzbHMxTjNR?=
 =?utf-8?B?cEU3eFZESlE2VG9qbklFZWIxVWpHM0JXRlhma1JqZmE2QUZZdlFLZDlSdHI3?=
 =?utf-8?B?Sm5iaTMxK1hqS09mV3dvNXU2cnZBMjZaM1hwOVFaMlNnR1drN0Vjayt0a3Bo?=
 =?utf-8?B?SDN0T2g1a25rcVJiK2NtN1E3NTRNclRPb3NHU0dPWEJDU2IzZExKaFl6TXls?=
 =?utf-8?B?Q1FqWkl2dWRuUUxYV2J3V2o5Qm5Kd2xVQUk3M3J3UC84ZUJzN29tRzdsdE1J?=
 =?utf-8?B?cTdjOWVpM1NxZ2gycFU1ejJkMjZDZml6TkhlOHBqNEFwVnk4VGFNbGJTOFU5?=
 =?utf-8?B?aGRTM2RuZFNydEMwa2JkbE95dHVVcGNKYnZsTzQ0dkdqSXZTWFJ2WXZrUWtH?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jg+nRJxGAhTKfJNQFrtXe6O4Fka+BJZ7f4msdKJU5Ja7KdFG2250ZlxaBqMulGQkvvNvH80XE2UEGJCvuzRoSuNVuCUatrvWeCFd1B3Jsl3V5xH1eZ16xe3mHxBqPcxPwqnaTCDIgyp85aBOcjhohSIqhexhG03Nxi8S1WXql7vya5qM9Em5ZbUwMQD4IHzS5g7lWyoHq/DD5oFxxbeEvtTfUVuBhRf2a7J2wC7uAFdNcjsHzO9toPo+1AMijbDcvm+Te6C4MWCmUVec9CYUxC1slJK4rJbqIwGn1wMPHy5v5gIpP1PbQlHrm+fgxzukIw+vhs16TEnKwNA7QT/+8IXj2No4RXJKj6F6U7+/GzDTLlK42dgpsJIhlLROogO7qoh7ak4dqwFxWJcPvX/gtvrjHyLKps2iE+MhTtu/R0AybVdJ9nKBabRHXVxWsYZFNYHMEKH4vI0vKaftPBH8qCLwTMo2vuyDfIHdgyTRtbjiikJopnxuD+TNioebMJNmwvn4i6Cfk3TVFc37yXYJSCM5PrXDc7WD5w/lzkT0tk8K3DRQC6DfJyEvZtc/8nSkjy3q9SE7vLdXWfd1gaXchg6h/Xk9gcaNO0sV2Oh5NTG4CVoMeqm9mG4Q95BaDc+GXGjRq5k0F+A3W+J2jOCPr+LxbMHHCEVc3Y1N/UZggzAw4+COfJS6AwUJqK68hR6YnkPZ86xQms3GfRKD7o5tKwghsIrZooN2uUHMzWH/bN4h9liKtAP1qqm0DRb5GRX9UrsUPlaDwme7GK5eOoeV7hzfTIuM7+IxCe0lIkaz7qnn8qdBvwJ4x6QFXE7y7V9u
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d2eb87-7015-4197-a97c-08dbbb482936
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 08:44:40.9310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qj6840Q0uZvp2HN2rl6Xv9l6b3e3NkPKN6/U26ReF6gbSR5QwxZpjt2l5N6F82i3fgLeq8dVwparfo5BfEBEZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6322

On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Skip mapping the BAR if it is not in a valid range.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>  xen/drivers/vpci/header.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 1d243eeaf9..dbabdcbed2 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
>              continue;
>  
> +#ifdef CONFIG_ARM
> +        if ( !is_hardware_domain(pdev->domain) )
> +        {
> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
> +                continue;
> +        }
> +#endif

Hm, I think this should be in a hook similar to pci_check_bar() that
can be implemented per-arch.

IIRC at least on x86 we allow the guest to place the BARs whenever it
wants, would such placement cause issues to the hypervisor on Arm?

Thanks, Roger.

