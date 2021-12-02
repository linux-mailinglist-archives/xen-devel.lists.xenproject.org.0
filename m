Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5A46678F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 17:04:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236844.410773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoZE-0005br-PO; Thu, 02 Dec 2021 16:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236844.410773; Thu, 02 Dec 2021 16:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoZE-0005Z9-MD; Thu, 02 Dec 2021 16:04:16 +0000
Received: by outflank-mailman (input) for mailman id 236844;
 Thu, 02 Dec 2021 16:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tajg=QT=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1msoZC-0005Yu-LA
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 16:04:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cf9582c-5389-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 17:04:13 +0100 (CET)
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
X-Inumbo-ID: 7cf9582c-5389-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638461053;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hth0/2PAAOOA44hPfWHgtHlrA5qqYJv97X/Y+J4K0Gs=;
  b=cvDVICf98P8kVKDJx2JM4xA4g3eKI3RKT/Y4xQ+/1FVD1ntdxUCW+j0T
   F1pX9pC6Q2A+YIO/ixBC+nIK8dSiDOG/7aNfNAb+RHxn99N7gCLg3fV0F
   Di89oM4gMXVB6UUHTABK5xgyp2iZ/99GuGKbA5ClGKS9Mcep7kMZX3XgS
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3746URqyojUjmfs7YxvaEaobORD0RJSrMHFN5nViKj67OT+E3Ld0ldCYNPNWaFLQiZ1FdDqoet
 j0v6WjVZvrljGNWEmGDJ2+scoeZ7aXLdnT0JUrhhTfshcAj72WYCsxbTPoDzCZ+xtP7bm6rexN
 z2mep8qH2cou5pY7ebDDbvdkXBXTUnvEva0mKFE87njQxYFjnYvIDn6K1gaeFSM9oq20lVtln0
 oRUmSwWPME78B7+W1JKlSTc+Amw8L0DqDxmP2IYB95JKpnjkoPCExTF4W/wGkhpY7e59zzd93/
 pRp4j1M5Qz/Y13/8hGpsfRA3
X-SBRS: 5.1
X-MesageID: 59519128
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9RWAPKhl/p0PlWL668a9lz4SX161jRcKZh0ujC45NGQN5FlHY01je
 htvWG7XPP7cYWT0KNAkYYy19B8O7J/Uzt8xTgJs+yoxEC4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1/i66bTz8xb5Tcv98DThZdAhlsEpZJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t150XTK+EN
 6L1bxI/QE/wQRtCIW0sCaljrdyHtCageBxH/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru4GDREhwcctuFxlKt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT80TirLW48Vm94ePsdqtI5QC0Sx
 HCykIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEgnpU
 JsswZH2AAUy4Xelz3flrAIlRu/B2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGI6VgBv8MMZiLxMMebhr5d7exxlsAM8vy/CJjpgidmOMAtJGdrAgkxDaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBnX82r8JIOKbbYSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74ixZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:mEIP8agc/3hLjQHCrbVOAd4MQXBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.87,282,1631592000"; 
   d="scan'208";a="59519128"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3RxzlBFY/e8fvTVxyVf2mFJwSr6sReynhDmOe1wS7Jj5lbxHHHXDsWmkB5aCQydng79BIlWmrHzPiyhG6newSby0DCJAwB71EDY9bjP++h0QCsyJE6+3XOSF7SA+4AEwiyaDv/ZJRllDzANhrZOHwMvGq/KZnMJhpfA+w0x/SofObWke42GNvvQEsjuNGvdxsVNBpk9Vsn/4l9ykK4Vk1mJbV7Z3IdkqBVlOh8H+U7/LSWLAu/Elbi656Snz+JRmYKAwRfD55bePA+iMrUj8LttYgJe20934B4Z2O0ZUgaSpRFbyO22JctGU/NZWJOQWmNmz3AmkmdZeiVh7fiBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huTq0B8c+9emGBJtc4hecPo/BN72dZ43ec+/AEbYe2A=;
 b=A1dl3jh3oexz2u02kUBql3fUccVdtqOzCsWDVHejK09JHbflRWIbmVfT4rQrjJKwdLlIlsu3BM+NsxgttwWpJhCKP9jrZcANWsjOLNqe/pIkOIO5pKrJoJ6N4hHsZx99VbrjjqTDDhh2dvsiI7lQyuqEnedbhaIP+vUJ1HpsF01BuVyLIbY6ejrnOhf4PrO6tDeZagk7UyHIixPBp/QQt4YXZFEV+vZcSV2iXk3JeyWLGeZuR0LGmncW/hlzf7tI1Q19l7TxD4yyyLQfIjA2QiIuxNLW4R5ZCR/WG/toaCueKSBGt/Z3ynCnzzM2/b3fD8SjIrQPYaSfbDMDa3FyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huTq0B8c+9emGBJtc4hecPo/BN72dZ43ec+/AEbYe2A=;
 b=nAf9vtz8gfWpug2eMxeABFf9WNs66DPRtGtlQm4W/cktTQOJ5HBeazSgQ8XK8XfkDpB8Z1FvwCMmZDEQDEHCC+GrYsMFtb6cKMiino/E11KQ7GxdBWar2Aq+k1vR+O+CnzBB9/cmowYxfpaOeioKZ0GQruKyeBjdPdQPqLILhrA=
Date: Thu, 2 Dec 2021 17:03:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 08/18] IOMMU/x86: support freeing of pagetables
Message-ID: <YajubFeUclKtpqV2@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c12fccbf-82f4-1259-f69d-a6ad8d78ea15@suse.com>
X-ClientProxiedBy: PR3P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 541d0817-d18c-41b6-58d6-08d9b5ad5b2e
X-MS-TrafficTypeDiagnostic: DM6PR03MB3945:
X-Microsoft-Antispam-PRVS: <DM6PR03MB39451551C232784A078C82728F699@DM6PR03MB3945.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXSjmzVZ7/MllNMGNijXZNOnGA+dHMZb9nr43fq04UIrb3tlElHCLSENH0Im2kE4q5W/KOibUnTHi9eofngvjN4Xh1DGSbhC8FL5w1CnNkmUwFWostorRTYOqPlj/guIfR/HFFmAAUhhNsw6hbg/jBdWfevXwSpALH6SYWNW1/iKg6PRitwjveEgK5rr3nf1VsJmNfLlhVCN3mEaJtO9tHBouBBWHuzyW+1Vvy9S4nTAiAkrwsQHK6YSbgM9FCRhg39mtr1xMCLIoNHFhM4Mx4IQYHWqDaBfPz79RujUtLyUTQOwZbxc2MjZ6b9X3KYdxKWZS8833Kdu0X71FN8ceIDW5GTP3yTnP/zViTYyQylL0fY2SgLHUUSKu/z9h3PgwAymww/ICnWrenKkfvqmK7UIGV6h5FNP18mb8pG4OoB/x7hpYOJSTHoc+fva9lpFpk/t4kle/xPb7FRftozZERQe1XGz0wSOuBp1HAGT7jfvs+y985nwwT44xeokrDAGCN0LQ4P0t6k3HdtFn1JOB/g4kj98KtcR5tl+F9qzxY6SwZOSns1MT0fo3CjzTKsSyXBG7W4jVAK2c9ZTfFPeelOZ/7PLvVop06Oj1kHF02W5mNN3WgT1DSBK+CiDXFWUmOyxFBzFd5Q0hNvVxgzQyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66556008)(85182001)(86362001)(6486002)(316002)(4326008)(38100700002)(66476007)(508600001)(186003)(54906003)(8936002)(33716001)(9686003)(82960400001)(66946007)(5660300002)(6496006)(83380400001)(2906002)(8676002)(6666004)(26005)(956004)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGVnY2Z1WVFSVXBrMThqb0w1bnd3RDRSc3lFU2NtNDZXRlc0MHpmTjZKM3h4?=
 =?utf-8?B?T2o4a1owSG5CKzlXdXhVNlpJNXNtSDBPNDRvNVBPbU43L1R4VnhMRGdaQkMx?=
 =?utf-8?B?eHE3MGtzTFdnNFJsZHVUS1hhVWtPMzZvdmduOW1NZWlPU3JEUzJrMFJCTHhI?=
 =?utf-8?B?WFZUdVJWQURVNjM0SlBrZ0N3cHZQTXBBd0N6WjQ5M2MweE5wQ2RabDk0c3VT?=
 =?utf-8?B?ODJBOVplMVF0Q2xURFZocnpNQ1lwbll1MmN0c3NqU2dYdEZTeDZESC9SeHFk?=
 =?utf-8?B?SGJKeUlPckRPZ3FyWGkxR09zWkxDeHp2VXdBcHp1eW1Pa2s0N0ViYndha001?=
 =?utf-8?B?Nkx1VThYak53UTI5NzBoL1E0L09pWXJ4N0RLS2N1S1NtOXR0M2hkaE45UmdK?=
 =?utf-8?B?SGF6WFJMOVJFQ3FpdjF3cWVNWk9kdStFUWJma1BBeFFHMVl4Y2JrYzdXWXU3?=
 =?utf-8?B?MldUb1Y4ajFGdlIva3V6NFFmcWdaRmJJQWphZlRpZkRweW92RURZTnc5cWpa?=
 =?utf-8?B?Vm9uYlJaY1lYYmNCQit5LzhpaEM1ZTMweDl4QzBQTDFEdG9OaFlTUCt4Vm1k?=
 =?utf-8?B?emhKTUhEVjdhVHlIYUV4RFpuNXhpdkNHbmxpQjNGQ0dEMnlIZEljSDFyVCtM?=
 =?utf-8?B?aHZpVzRpV1QzV1JMZGhsWU1seWtuVXhYdVVMSW9Pck91NDZlYnk5Q2FoSVJv?=
 =?utf-8?B?VHhtU2hqdWhuNFhZcld1R2hTRlRKRlB3UGl2Q1VOS25CTmpzRWh0azIzWVNS?=
 =?utf-8?B?amgvUThVVHdJZkcyK0NXMXpyS0JZaVRpZHNNUTA3SDNSWHFXZXVlQVlUUWpT?=
 =?utf-8?B?QVJyUEdDdzluWW5ZWHNLVnBYZXFLcCt0TDM4N3dreFJIQzZ4UTdQZjZzZ3d0?=
 =?utf-8?B?UlFtSTZJSHNyTjkvY1JaaUFZZEVMZmluMk5jVWJ0TGF6Z25JaG43QlQ4dXFX?=
 =?utf-8?B?TXZOV1FTczViRS9jbUZaOG95akdQUVRPZHY5TExnUDdFWXRNRWZtZm9qUHIx?=
 =?utf-8?B?ME80Tmt2eUhWODdxK0t3WUxEUEVLNXBvMU9QcnhyMXJSOGdZRzFveW0wTDZx?=
 =?utf-8?B?TUxzR1hOWWJRT3pWdTdsY05YaUVJNFhSQXJGZXBFeW93ZzhJUVBpaFNkZnk5?=
 =?utf-8?B?UUN5TWJFR25yTm9nalVlZWdHYTJhaXRHQmhxRnh3UU9QbDhMTUpYQ3VWZnAx?=
 =?utf-8?B?NUo3TG9SbnZ1NTFNY25HRWE4SXQ4Rm5xUkc1ZER1T1hvV2pycVpnSG9OMERh?=
 =?utf-8?B?VkFrQjRNQ3lpcHhod1FNRTJGMmNtaDdtdHVvb0hwK2p2R1ZmaTczUTQ0Ynhh?=
 =?utf-8?B?Rkp3bEMxZysrS1B3eXVXRmZZelUreEE3MlZDV1ZDWXBLV0c2ZUo0RnpqdWRk?=
 =?utf-8?B?QmJtdktLU09VWmMvc3VWZHozVnZKN1BibnpYMW9JQ083NHhlZEI5QVUySG9x?=
 =?utf-8?B?U0ZHUkdRRnk5WkZYakRCQjczTHhVbVBUUXNjYkl3WVZlYlV5MzN6T3NkUFFX?=
 =?utf-8?B?TjlYUkRIcWtZVEhUMWdyNStLRWFIQVFvbWRTeHFUNUlYT1dPck4wMHdxaWl5?=
 =?utf-8?B?SmNkSmxMeHlyL2FaTGQyK0l6NzROZzJVaU4yZWh5Q1lua0czVG8zUzhTblNO?=
 =?utf-8?B?b0QwN2ZQb0srSWcrMkUzTUFqRWRQMFNyT2ZHWnVYMWhOWGk1VFZEcGtSK015?=
 =?utf-8?B?ZGlRaEFoM3lvajBPN2pkZDIxcEo2dE1leHFwNU0xM1UzKzMwU1pnSktIZitF?=
 =?utf-8?B?NDFRZ1ZJcUpFYjNCWWlnQm9zNkNyZ0NzeE9jTEhTbW9TaktMZ1FGSjlPTkwy?=
 =?utf-8?B?WCszcGVEOHJTaml6Tlh2UktVL094Njh6MUJjR0RETVRsTEpuZFV4V1VIUXJQ?=
 =?utf-8?B?QTJUdUxUb1UvNG5teFFyNlBrTXhMR2hBTm9JRUQ2a2diRWZZclFEdFJPbzNK?=
 =?utf-8?B?SlR0b3RpcjgzRm9vU1NycXZjZFV5YzZ5cVlwZllKZnJvRXRZeHJhQmUybVdU?=
 =?utf-8?B?VFROZk51MnQyVE1kV2JPaVNlazBEUjEzMVI1MU9Oc2FCYkN4MGdCc0wwa1E0?=
 =?utf-8?B?cmEzZHl4Z0gxUlpORlp3OThBMlJMTC9rRzBFaTBsbk9UOFlITnUrR085OFJN?=
 =?utf-8?B?UHlHNUp6M2RNMjJMVU14dzFMUEVLT1ZpQTdQVjJnTU1yTTVubkFPUGZ0TzJ1?=
 =?utf-8?Q?0SKkSz1QHNV4yE+aNerwyHU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 541d0817-d18c-41b6-58d6-08d9b5ad5b2e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:04:01.5788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmgHBMcEdn4gzOVvEpZIJjZYNwf2q8qWOHF0MuzUxshtbjX3iZnXS/uaZw4XCEuIAJJfxaGriEyOeN30YkUdeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3945
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:48:21AM +0200, Jan Beulich wrote:
> For vendor specific code to support superpages we need to be able to
> deal with a superpage mapping replacing an intermediate page table (or
> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> needed to free individual page tables while a domain is still alive.
> Since the freeing needs to be deferred until after a suitable IOTLB
> flush was performed, released page tables get queued for processing by a
> tasklet.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was considering whether to use a softirq-taklet instead. This would
> have the benefit of avoiding extra scheduling operations, but come with
> the risk of the freeing happening prematurely because of a
> process_pending_softirqs() somewhere.

Another approach that comes to mind (maybe you already thought of it
and discarded) would be to perform the freeing after the flush in
iommu_iotlb_flush{_all} while keeping the per pPCU lists.

That would IMO seem better from a safety PoV, as we know that the
flush has been performed when the pages are freed, and would avoid the
switch to the idle domain in order to do the freeing.

Thanks, Roger.

