Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E01440885
	for <lists+xen-devel@lfdr.de>; Sat, 30 Oct 2021 13:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218761.379336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgmQC-0005xk-4W; Sat, 30 Oct 2021 11:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218761.379336; Sat, 30 Oct 2021 11:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgmQC-0005vT-1M; Sat, 30 Oct 2021 11:21:12 +0000
Received: by outflank-mailman (input) for mailman id 218761;
 Sat, 30 Oct 2021 11:21:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4cL=PS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mgmQA-0005vN-1F
 for xen-devel@lists.xenproject.org; Sat, 30 Oct 2021 11:21:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f89ef690-770e-4cff-9b09-9d50a47bb8f8;
 Sat, 30 Oct 2021 11:21:07 +0000 (UTC)
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
X-Inumbo-ID: f89ef690-770e-4cff-9b09-9d50a47bb8f8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635592867;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6tpULM4ZD1M+wixY1TQGNkm6mlHW/JJWzfgQUhduvMg=;
  b=NJol3vGs/CkfH5eHAsW2FRedpx3fCGutjbTVxk5O6WsdCU7Q0tNW59PM
   zBn/YQdt2mgt+5mLX1FsicqaOYxOXd45NC4BlOJ7B+v16hX02tFCElvRc
   H83P4ndFCPm+qm1JZSBN+tW511t0DWshyZDdEI2YploCReeYQhYQ5fQs9
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v2R6uMXalIAMQYJ4EFPs7ugp4dMr3OHgreGRSlq1OaFYAf5qAXyGJJmmWJ2hXrAo8o2Cvrn/Np
 eQ5ZiUlL6A34JG92CvW3XSPiPyxKP6+WTsd+237VUgOCbBhM8bBXxaLNK6/eVsqnnHdK/bHR3T
 EM89pucHnCbC0FjvMGvdIT9NPZSkWrMg7lpqivs2MpIwvowWz2BX1oTHQ4ycPyjl9QESd0G3hp
 sUqikMNN8DtfsHb4GXpddaZjSnAaiEIPcfbLznyUjdeCZJ8X2qqyl0QYEmxojs55M6f66faVar
 K6ZzM+LRYOf4npHfLF2bJn20
X-SBRS: 5.1
X-MesageID: 58636649
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1sVfn67Z9gbup8bFdjmVLgxRtKvAchMFZxGqfqrLsTDasY5as4F+v
 mAXWW/QaareZGOnL9Agbd6z9EtSsZXXnd9rHgpqqys3Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2dYw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 o4TmZOWEisTFYbgk8gnXhhmNxhMIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWdu3Z4QQae2i
 8wxSSpBXjb+eAV2IFI4OsJnwaCDn0H4SmgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW5v3ysrhMaQ8BXEeAx9EeK0KW8yySzC3UATzVBQMc7r8JwTjsvv
 mJlhPuwW2Yp6ufMDyvAqPHE9lteJBT5M0coPnEoQi1ez+PIi604oijCT+hHKZyq24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodd7BFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gMv1mSx28za67onAMFh
 meJ4Wu9A7cIZROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTuwzRN2wP5nY
 87AGSpJMZr8If4/pNZRb7xEuYLHOwhknT+DLXwF503/uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikH1ivBnFSnCPq+Y7dAlSRVBiXMyeg5EHJ4arf1s9cEl8WqC5/F/UU9E890ijvryTp
 S/Vt44x4AeXuEAr3i3TMS0+M+yzBc4XQLBSFXVEAGtEEkMLOO6HxKwea4E2bf8g8ulixuRzV
 P4LZ4OLBfEnd9gN0211gUDVoNMweRK1qxiJOib5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzLxyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPtntdX1prJcwgB1J1nxbgymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj36XMl/LeDVkkObRCAhDYEcelwOYIhh
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gd7mEtfZZH8CzPt5MDdYtpBBUAmP
 zuIifeQnL9b3EfDLyI+GHWlMTCxXnjSVMSmFGM/Gmk=
IronPort-HdrOrdr: A9a23:HraR9aGgIJ/IIjHkpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.87,195,1631592000"; 
   d="scan'208";a="58636649"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mll9BnUoqrMnYSSkxMOupgQPnlrh9KRa1YjOoQ3P4JiOqLWD62Otf5J1MloIVbQPhMnIj/RD1d0ZThDDOJFd2PoPE5g6hBVJ/i0lE4csdiYp5HALH/PLQtF/+XM8rrElnU5JmmE2r8F57s74GmIEzQRtMz5JQBxMclzhMcVeE3057Yo2DdlGpGi9RQ8KeaAfW+vGuoHzmEnSSowN6jK48t9kO1un1jdHyQV6I764x+YbaggK4E/gN1tuRl+yzNiWkiIQ2Zj7ouNae5pcIWnHh55AbOo5QyErf98M4LarCvU3ODcqvgfeOWmkWGxXXnpOvB0dA7ne86HE2C84EoTr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eL9d3AAwjismmBUI/evhcZFncUj6y6jknF/XdMOfg6M=;
 b=SHN6KAc0y56wCDihIDTBrxa99QQhSquiITBJCuPh7vIn9bTfgxrZLmGND30OpBx3Zluiohf594QYrCHsB4iao41IYT3Zlr/TP8sGcIsXQKy4PQDLgUidmxNiDZB1CCLcls1LMUSCK6s3kKQqmczaCKYstTM8u/4nY4vGHbrRXnCfL22WquaaLryeHSw2HTsiW/OWq0jtkXM98vVTV6rDaWySSToHC0SkgUaUtiWG2K9Gb98MlvdnqU0obO+/R/QM8EeuJhj0jMF2mc5+iHNQplgPprLD97AHSMw9MSVB4zHmruM5i94ASOsGOW/DMIlysEjWkf2QoBP76Kfk57nMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eL9d3AAwjismmBUI/evhcZFncUj6y6jknF/XdMOfg6M=;
 b=Y/wh1lAQU4lGPbofmyydPhxd86M+BJXbgQbTbB4cBrVDJLYqVTagzdJfOUU9oE0wSRhkcvFI8A0sw+l3WXf7+Bzjgr/dq/PTjL1Z2j+a8ZLpd6+wDHFBd69uXNJ7YRw8KgLYDkkxTEO4G+/la5drHse9c/oVBZyUmwz2Fm5Aev0=
Date: Sat, 30 Oct 2021 13:20:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, Edwin =?utf-8?B?VMO2csO2aw==?=
	<edvin.torok@citrix.com>
Subject: Re: [PATCH for-4.16 2/2] xen: Report grant table v1/v2 capabilities
 to the toolstack
Message-ID: <YX0qmTXBD3jSXjBI@Air-de-Roger>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
 <20211029173813.23002-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211029173813.23002-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::35)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d185b53-f1a7-4f5d-e773-08d99b975bfb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4058:
X-Microsoft-Antispam-PRVS: <DM6PR03MB405843FC1697546CD520DF3B8F889@DM6PR03MB4058.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J6K+LudxGhpkizwajrSo+lXBbE/PsT32z0ILFEI8TaNgPLPTxqGd9Z3/iy78YnsbB2gKfe7p8Cuie8bT6+YQ+1VZlJd3bcpr8kxLnvdmIwevxSmMFLfGC52j5Xa8r8vsT9oxb8eOT8ePfFTkL2UR909GsXFuksoNbhv4gOIKKMFKLRqQUGN5fRAfOCNSd8mC8jL9F6WS0sjsdDeoXTaYCjl/PtTdrBXXpOoRhQs+/0EgZaRkcgaXFF+cmi3vuqB6DGu6Nt9TjT24WHl2vcIuodIoZ/RL1eEuj+/sH6ZOXv1+/rPTpQgunMXxaYZeAxqQrrRku4JJOc+JCw4oSOKCz4Hjn1xyqf+9gnUucX6Wgs5r14S9xoosHyQ102vs5230foxuIqz6yL8wVkoAjkjAog5AICmK/M/Xl0U6NliBHw79kUQ+hajNLUj3C1AvzwczsZ8reNq5V1HlTDxPw4EV/YYpuRp6jijeB7JIWsLtmLP9M6bXLJR39ERmOrdgyun4vrZkHVBPn95d3eyeznh1Erk0TSL0iLFOmo8jf1D/FOoXd0ZU6F2Ox5C8JGm/GUZ6NzVpzTpcYSQ/9ALzXpBjGULB6Lq1QTGxxrLMtTb05Im5wtums0IEjYcc1WWc1W3SodfuEKPsX9+g/Xjy6Wn01g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(2906002)(8676002)(54906003)(186003)(6486002)(508600001)(85182001)(316002)(38100700002)(26005)(66946007)(8936002)(4326008)(66556008)(956004)(66476007)(83380400001)(86362001)(6666004)(33716001)(4744005)(5660300002)(107886003)(6496006)(6862004)(9686003)(82960400001)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBUR1V2TU1QV3d5RU1EZlVwNllBL0Q4dSt2NjZpNTdQVUxtR2UyVzVhQ3N5?=
 =?utf-8?B?MDk2cnhIdFRUS1dOWTM5bXBzcHErWDRpN0RVSjh2eEU2N0VNZ1AzVUZSYlBX?=
 =?utf-8?B?NkFLdzM3OVlRZytUTWpTenUwMGtiWVBzV3dDNU1za21Ea3pCUGtnbzBkYlVB?=
 =?utf-8?B?dndNRlF4SzNxRlNkTDA4MStLYkdCSlBpdUhmUGRSZDFOL21IZThmOWpnNnhr?=
 =?utf-8?B?bjV3VXJiMVBBZWtIcDlGMSs1bmhINHNYMUZWWXk0azZ4V3RGQ1A5ZlhkZEtn?=
 =?utf-8?B?TmFFZHh4UklJZDRTUTF6cWxwK1p1S2FxdjZwOUdTNnVhVCtvQzJSSi9wcVAx?=
 =?utf-8?B?akJ6Z0J2N3JDK1VjWG1mVXRpM0ZWMFZRYytCRFhpbUI2YStrSDkrRElIamNE?=
 =?utf-8?B?b1piRmlxV0F4bWk3UXZhZmVPb2NsM0FpdnZFK0ptb2NsajE0cENoaEJCSTBi?=
 =?utf-8?B?R1JRWGswUGJwc1RmTWxwQnBvKytkRHVLeXVscktIdWVGcitqYnZDTlgwQ0oy?=
 =?utf-8?B?Sk5SWEZxYi9aQ2VQSnR4ZkErVkk2Nm5xY2IyQTZGL2tmS3lmcnRGcmRrZWx6?=
 =?utf-8?B?U2lTeU9EajlPaTZIZDBsUURTa2VaZHNHdXNlNHoyQ25iSjN5RXJiZHZISFhG?=
 =?utf-8?B?LzNTb0xWcWlEZ21xQnVoNGNFenZPb1VEQlFDTnhsWG0yR3NqdENUNHNPblRG?=
 =?utf-8?B?eE5jbVRzRVVobGlzMWlxcEw4ZTdXNjJuc2FuL2tnNFJqeExiczd5VFFqaXhX?=
 =?utf-8?B?d2VsVWxZbSs1czRXdWRrVlFPTVJUWGszUUxVaFBkQTFQTTN6ODFYS0RCZjA5?=
 =?utf-8?B?cGU3cDdQNHRQR3ZKbklsNnhwQno0Vm1kOTF2c1h2L1MyVzBmODNITFRDcUVV?=
 =?utf-8?B?WjRFVjQrTWtJYSs3Qkk3bGtrWFcxa2haWHJENHE2MGxGbHNodVZiS1BQeTNL?=
 =?utf-8?B?MDZINzJXNitMdWw5aG5NRjBCODJIY2Z2NW5ubEZ4UnJsaGFSNFhaZldKN2Uz?=
 =?utf-8?B?a2JDOFpxMERkNlFNS3k1SERFbXdZNmlIUFRMWGlubkd0a3ozUGcySTQvM3lW?=
 =?utf-8?B?cjFRb3pLbnhoYjlncHpNaktqbW5HMGpQSFNCN0laeDRNdWY4SU1YaU9iRzY5?=
 =?utf-8?B?Tjkxa0ZHUm9iUVhISXF4b1ZCbkppZ3lzeExOTlF1b3c2WkhTU1RhYVdiaExC?=
 =?utf-8?B?cmNTNi90L1BMWUxMOUlkYXdyYm4vWVRoZkx0emllTVU4cGZ0UXZqWjdKeFBs?=
 =?utf-8?B?bFdDNFJTZ05vMGlmQlJnV1Z1RTJHejhZRmtzdm1BUENpdFM5aEZOR05qQ3Bz?=
 =?utf-8?B?ZDdrODA3dzVabzI1bkM1NGd6TlpzeEV0ZkN0RXlNWDNid1pLYlNCOG9lOWlO?=
 =?utf-8?B?YzVxNUxuSy9ZTHVTeGUreXl3djNKb2RFOWxXaGN6Y1BsRFE3M1BxUTFiZ0pr?=
 =?utf-8?B?MGJkQXZGTzJtNzNXZXNBdG1ySFlzTThMelkzd0VZMS9oUUo4ZzRxbys2cU1S?=
 =?utf-8?B?YWhDSUFHNHNPWmRQZDc4MW13YXZJb3pmcytCc3BYTngrUW1wcVpHNEhVUTlT?=
 =?utf-8?B?MGNkalhzdVFzV1V6Y1Zhd1d6T0xUZXVMVTNsVzJuNEVpSkhlMmV4UStwYlN2?=
 =?utf-8?B?TEFuYWdUVEVGVE8yYitVaThvUWM4dGY0NEtQSFJnS2huSHdWeHZIUzNLVVBj?=
 =?utf-8?B?Q0RNNEJqYllwckRBaEF6Y3ZObUg5d0kzRmh3dzRwMTgzd3lONjd2RmhQVldP?=
 =?utf-8?B?a3lhL29HVUMyMFpWL21Ncng0VWgxc1VRdGJOT3JVL2lWUHBzTWZXdldIS2Z0?=
 =?utf-8?B?V3IxcDNpYklKSWI0bHYzU29BeDVzR3BlekpiTEloOXhQRGI3ZmFEWlZDdHdI?=
 =?utf-8?B?VmRTWjdNZVoyQUZoVDJacVFmdjNpOXgwWit6bHEwcmZENityYVZ3V3NVYjJa?=
 =?utf-8?B?UlVBcDZEQmhtaHZUZ3FBQ0pDak9sTmt2RVlsM1hja2ljZGNyQkQrNkdYbU5t?=
 =?utf-8?B?cnk3UzdjRFBIM2FqOVhmTzlZN0lYaVo5WnlXRXRpYStOZG85aEVXNVRwTlpO?=
 =?utf-8?B?YmVMdC9LMVZNN0Q0VFdUanZxalRHS1hDSkRGTWQ1VUFBLzNQTlJoOWQ5QnRj?=
 =?utf-8?B?VVFESmpGZGFQYU96UEpscnMrT09zdGlQd240a29PM2pSVS9MemN3VHdndWZZ?=
 =?utf-8?Q?cuWt8tM6QJlsBT4XYiflLR0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d185b53-f1a7-4f5d-e773-08d99b975bfb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2021 11:21:03.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6l4DrIFb6KDLolPdJYTIsh8bL0WGdFbeE4zzY6SEScPB0s2AQSkGMbgRDTPNbNg3pJaIsDmgOANWm0305Xscg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4058
X-OriginatorOrg: citrix.com

On Fri, Oct 29, 2021 at 06:38:13PM +0100, Andrew Cooper wrote:
> In order to let the toolstack be able to set the gnttab version on a
> per-domain basis, it needs to know which ABIs Xen supports.  Introduce
> XEN_SYSCTL_PHYSCAP_gnttab_v{1,2} for the purpose, and plumb in down into
> userspace.

I did consider exposing the versions supported together with
max_{grant,maptrack}_frames using a new grant-table dedicated sysctl,
but maybe it's fine to expose the version as a physcap and fetch the
other two separately?

I certainly didn't look much into this, maybe it's pointless to expose
max_{grant,maptrack}_frames. I think the toolstack will need to be
able to fetch grant related limits on a per-domain basis like we plan
to do with the grant version in order to assert the destination host
supports the current limit applied to the domain.

Thanks, Roger.

