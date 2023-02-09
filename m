Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5B7690B28
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 14:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492477.762019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7SF-0002zs-3G; Thu, 09 Feb 2023 13:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492477.762019; Thu, 09 Feb 2023 13:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ7SF-0002xX-0e; Thu, 09 Feb 2023 13:59:15 +0000
Received: by outflank-mailman (input) for mailman id 492477;
 Thu, 09 Feb 2023 13:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQ7SD-0002x8-5R
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 13:59:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec2444da-a881-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 14:59:10 +0100 (CET)
Received: from mail-dm3nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 08:59:07 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5269.namprd03.prod.outlook.com (2603:10b6:610:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 13:59:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 13:59:00 +0000
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
X-Inumbo-ID: ec2444da-a881-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675951150;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Sy6v6H0WAeZN6YNYDw3vqNAuMQ3fl5RTcL9lcfZbgpM=;
  b=CT5y3BNLdLG4l3dEdKjiG+Sn/HwHAdgpXBdQWmiqoUCiUIFYH6gv9l2m
   wvEaGjNAgSWQkC/5JbMDns2pKv/jtXF0r6UhySjiR3QBhThAu1ZOUFDEW
   hoh/2ZZbKzI2cI/+2LPHClCVKjglZw10GpGc0SQQsw27NPymcopPqXOV5
   E=;
X-IronPort-RemoteIP: 104.47.56.43
X-IronPort-MID: 96274333
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nXaji6n3Ujn2u1MxE0J+D9Po5gygJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCmuCbP6OZ2L3f40la4znp0IBvcODzN5lSABr+yE3RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5A6GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dkpNAoVSQ6Cu/6/xu6nDdI8gu4xdOC+aevzulk4pd3YJdAPZMiZBonvvppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3jOOF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNMTuLkraUx6LGV7msRVzgsCkWHm6jnjmqEVtdBO
 mwMwyV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19EIMZTSoNTA9A79y4pog21kjLVow7TPXzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:HpEOMqqI8ccBSiRH2oFU/msaV5rdeYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VAssRQb8+xoV5PufZqxz/BICMwqTNWftWrdyQyVxeNZnOjfKlTbckWTygce79
 YET0EXMrbN5DNB/KLHCWeDcurJwLO8gd+VbeW19QYScem9AZsQnjuQCWygYz1LrBEtP+tBKH
 IFjPA32gZJfx4sH7yGL0hAZcfvjfvRmqnrZBYXbiRXlDVn3VuTmcXH+wHz5GZlbw9y
X-IronPort-AV: E=Sophos;i="5.97,283,1669093200"; 
   d="scan'208";a="96274333"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKY2mB6y8d1ZXxdljuxosgR2B1ccSUDJtB1jd4r1qz4k2vagXDy7OPhr+ENBljVg60M+fyXlrtD3Vhsc7e2PJOD6rJlMEXmfgeqEa3zyVwvMkFaA8J/auCmeCe0pkiHUEky46uXLF+v+83BfUxIT9HOh8y9T3xVhPp5hpv30zXyN1yBLDMbJBj+lcxFpKK7qfhVx0iEt++JIba8RSMyIhps3B3gh6/sitMo4j401hkOMh/IGgSIWESxSVhVGwI184yhaj0tzL2PtInZV2q/j6VlUFIOeyvm3+wp6+w9F7YBO1wCfMS+imSBWofMLyRaHndTN8BlFOyiKg1fo4LergQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sy6v6H0WAeZN6YNYDw3vqNAuMQ3fl5RTcL9lcfZbgpM=;
 b=AQyW0SyGtxZPbRcTJ17GPfUA6A+cYvHeZ0TdXhqIBCKienOHPxg14TEtlXK2tukPd0x908tXBXvPYenbF9dvvDaSlQS6XkAJY0yhKcFI7pTK3y6zBjlO5ZWXFr8Oa2+vp50UWHsSguoRsHgN5ErZOqwRop+IPuq4zeqWIdtMghMvrJQaWNRmAjISyPWFPJU4oU+Mp4Leh4KsKfmSxHGKmPgubTPf+NtV+mOfFiD+Ebxgpj8nOb1iz+V+bix9iewhWqH8UNaS4smjSIBcJruBdratPdfnfCPd5Y12nnaQqKp9dAajYSzXCxo4Fu/DtUv5P5GTkZmXRTVbbA7Mx1avAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sy6v6H0WAeZN6YNYDw3vqNAuMQ3fl5RTcL9lcfZbgpM=;
 b=R92fyLVODI03cdsyRkiDL1TsXOq2RPhD9R2Sj+ldtgfagNEztRzPHuDtiMCMmPND2qQBHTuVSIV3WHWGwaKAxsCn4R5tdUK8GIJLyb7uEMuBYQ8+A5z2POL8FEPjqn7gLOr8Qay+TxSSPYssONkb2gbV3AbVhJ5PGOSYCkLxUwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1c579c3d-6fc3-733c-90b9-d71c761c66d6@citrix.com>
Date: Thu, 9 Feb 2023 13:58:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH] libs/util: Remove unused headers in libxlu_pci.c
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230209121140.10982-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230209121140.10982-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0662.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe78ebf-cfc4-4839-9cd3-08db0aa5cb45
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mi0P+mY+bCO0uNcLcfTXuQszCUmhI+XiY4Mfhf3JZG889R915iTJrErJ1hG9ZFWi4tG1xEHcpHB+tYnJr9ycC4gZd9Vltj0EUG39Gpa3d4zrGm5ovac821UaG+4RRYtT9zi5AJhwL8048cjujpTzBRf3YfZ1AHUlvyXAYhV01Y0equ9ntlYXWJQ2XQ+NdFDozxRWDtF5/bQL2hH+Lf7S9t1vCfpzbZ3ZYuiXa0NSD2xFzHCiHXarhEtJpQYyytYmGvWmheYTvWHJLKO2aJLf/04FAT3zKGFKPbXRkWCUEVQ9ImIaOe+b3g0avdk9+5d3LLhKikq8LZR6vVaY46rdd1O4CnQF78YJ6gWus+7M0KCL419XrG3cbFqS+XPGrimfu6DT3lPvhkfBkHDxDPiKr6gQQL8VzV22jzt6GL+MuwR6idaqI2qSMNVD0ff5nQ2U0GNizPXVrtJF3I0tkqSlFORZxl5WQumdw6Ee1Ao1LF7zJCoA97kerGZQxeU/2E0LG/9N1iBButV//EIOiLvgwliZGBUI/n7B4/+rvogTcyp78xEjWMW6tWP2VBSUAIQSSYd635E8QLlNJWiENNHPLyBsTlCBUWP1s3l9bsgA4JLKkjCog6cWeCnVywStcE8dhVgYw6/Okc6ETjJOr8WQkWioa267W8f+MXSUHrW9+A6KR7MQQvtP241KdnvpZIFdTYYzMa5vwYHwy1f/xBxXM19Hxp2Bvgjss28+fU5fXr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199018)(36756003)(2906002)(6486002)(478600001)(53546011)(2616005)(26005)(6506007)(186003)(6512007)(4326008)(66556008)(41300700001)(66476007)(6666004)(66946007)(31696002)(4744005)(8676002)(86362001)(5660300002)(38100700002)(8936002)(82960400001)(316002)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alpLZlV3U00xMTdueG95M253dFRBVXMyV2VEUGJRTUdrNUczZmluZnJSNjNC?=
 =?utf-8?B?dU8xc0dxU2x3TGk4RHdlOHNxbWpEZkdTUFJhN2NKU1dEWWZ3cUJxS2VDYkZZ?=
 =?utf-8?B?WDQ4NXhWUFp3c1laOTVOcWJKOXdHQk85SFhVblZJMThaRlhFUWNCVndRTUdI?=
 =?utf-8?B?TVRtcVhSZ2RXdGxScUpmRHhWQngzdjJxRWtOcGF4a012cG1ud0lGb0x3a2lv?=
 =?utf-8?B?cUtlNVp5dEx0SThwRTRwV2FHbnBYK1gxWkRJcVF1QVdMTEM5eEpMeVpHQnpN?=
 =?utf-8?B?MjdWTzNNeDVIaHA5QWVVOWVteHF4K21Qd1NPa2hHWTBTUWlwN2NBNGF2MnY2?=
 =?utf-8?B?TFBodEhjcGxiZVVNamZkMGpYRnM0U3VsVENmeloyUzkycHY3Z08xTzgxazUy?=
 =?utf-8?B?cU5jYjlsL1RTK0FlejNDZHAyK1YwQWxTQUQ0cUVoV3hnalo3RmpGaTUyNTZq?=
 =?utf-8?B?TTdkM0ZPajNYbWRhVVZCRVBMRXliTlNncC9QODZPancwNE8rMW8rcFd5VE5O?=
 =?utf-8?B?TDNJRWVEaWhuOE05QmtLcFRNL29oVDJLTVBlc1ErYjhwWVNMM3kzWDFmaDlH?=
 =?utf-8?B?L1pVUHEzMEk5TklTMmNGa1Z4YkR3SG5QVVU4ZnFWb1hxTFhZSFZPbFBLQkF4?=
 =?utf-8?B?Z0owU054c1NPNUlXYzdxTVJNeENEZlN6eE9jam01ZFBwUzltRzl2YVJDNTlQ?=
 =?utf-8?B?WkIwU2hBRzJ1VTJ3aW9Hb2pVc0tEMVRCRm8wNXFlU0dRaWljRklVYlhGRmpp?=
 =?utf-8?B?T09USVhFT29DM0p4ZXoxc1RVeUpzTXlsNWk4aUQrNFlGK2N0RFhON1htWEFI?=
 =?utf-8?B?Q2V4MHE4bUozdjBHUXBsTFRKVXNFeGhJS3FQT0FqbUNSRitRc1d4R2dyNlUv?=
 =?utf-8?B?Ti9xcjc3SXJvTUhmNUZYbFVPeHJRUlRxSTF2Q0lpbkgrUy8yRlNXOHV4WHpH?=
 =?utf-8?B?dVhrQkVMNHYwaVdGS3dubm9BQmlXQ3RvblR2KzA4ZnBjY0JYRncxblFqOEhr?=
 =?utf-8?B?WDRIMkMxOFNwK3F2QnRJdis4MGM3djREbkI1VDVwNTM0NkdoR3pZdVlvWXdX?=
 =?utf-8?B?MFpQREhWZWVwdjBobnVzcnZrcmo4VytVeGxFYnN2UENjMTJ5WmhOeWo0MHZE?=
 =?utf-8?B?aWJkenU1UVlrS0cxc3FldmtOTTZrZVlXZVhXMDBlT2MxVUZybnEwRWNucmlB?=
 =?utf-8?B?Ti9TM24yT0FJVzlINC96VnZWUm1LaGpYbFU5WnZ3OGFEdU9tdXFTQ1VPYzNx?=
 =?utf-8?B?SDNhMFcrdElJMFFqQVdNQ25nMW82V25tSnR6NzFNMTZiV2xDQTY5ZW5UclVu?=
 =?utf-8?B?anhJOC9TM3VpOFplQURFTWdxVTFXS3UzYnRhRDZqU1U1K25COTk4SkFtZlE2?=
 =?utf-8?B?THdBKzlSczFJaTdldUgzYTRIa3VKTHlaRk14UXRLaW8xTE56cW9lUTNaSW1Q?=
 =?utf-8?B?ZURVVGRaejNtekF4RUFzd3hVclhETnJLZnRhR001RzJyaFVhV2lWWmNGZ0px?=
 =?utf-8?B?R2VhZm91cFFpVW5VQlZvbkZISkx4cC9TbXE3T1BaSi9oRDVOOEFuSDZ3R0w2?=
 =?utf-8?B?aU5Xc2FHZWUwVVhNV1FZdW0vekV0NmZOOERDLzdEMlpua0VuVklJTHFZLzRn?=
 =?utf-8?B?bnBRWmlkbHhQZ1hqWnFtN21vaTlZek9WZ3hWWlFnNUdWME5NSFpoODFNS0Jh?=
 =?utf-8?B?QUUrcW5YS2pNVllUMFRYQWlMREdrT2tVeVJ0L2Zoam0rNnA4YXVqaDdMaWk4?=
 =?utf-8?B?dzNuR1dMZ21mZU8wbERGNW9zWVlYTmxLNUZINkgremFXdXBCanRpTlVBeHd2?=
 =?utf-8?B?Vzk1ZnVxbGVQN3I5V1JxUHpoOGM5V1JrcWFKdC83OUVmNWV5SzM2QzBvaTNY?=
 =?utf-8?B?WjV6NCtFMGV4UUdWUytoZGNkN0YyNDhKdzNoWkV5MGFJcFF3RDNOSkR1cXlV?=
 =?utf-8?B?UjNjVzk3alBqM3lpTXlha1FKdWlVMVFmNHRIK21mV1duamVjdE5HWEpGazVs?=
 =?utf-8?B?a1dyYVBHdTBVYlhMamhWSFRSaXRjVXFrUXBSWk84R0YyS3J4cllFRnRQU010?=
 =?utf-8?B?RlhoWGdEV2dFd0FRYUtLVXYvdks2MFcxS1dML01wWVFtRVYxb2dkZ3JkRnc4?=
 =?utf-8?B?bWZPVDZHL3hJWjVoUnQ4WCtpR29yczNzNGloN2dlZ1JJOGhUYUQwbVFibkFP?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6pmtGW1ywirS5NAjdx7qBeokSgOvySs4rCPV8XDxAUVZg0LYDUp3Npa9IV9j/DJCWZdweLiqmomkk/ET38mHRvqGMOtVyoHaJe0+OKnLOiMJEhrdJcq5ZOrhO/eB7wf7PfJ7piZUSneImDxRZ1flWV5u68hCKa2qxm5OIUqA3I1JQWaHrFZ3Ux0cNfDy53WHQ9xTsdOijPyE4QGDvSORG15NP9/9H7DOcCn7Prb0NlafnNTEOLMKsfqrRaU+jRWsYD1s42ZSeBNYL39Cex60NcSzuZXDxTOudK4O9M+WCOhnlucgJD3HCiRc979tyN5LCkcJVKGYdyinWvoIULDZNRA8B88fJNraTScEFMKw+VaxbcR629U2Fa/wN1IMbcBf6hv/Zc7a084yt/ag2N9EDZG7hmwtB3W0Cab/VOFnCGAIWOkY+6LTVyVO70z5wN7iLGzX7OmGhSLLaGDu0uNUzxYIAgmY2j564QDQmFkhRIUshCwrq+KAn1hIPsPs1jW1lyW3dPbv8r8vH21sSv5kqsBBhcz2rywTwmlfgKr8+foca7BztQfCcay4pI8hvvcf/QCo3GZZDlxt8W1jzHhw5OwsxKlBY431+FJzFqEDNydLKrMO4aypt8RLYt9r5RiiOMqZU1AOyvQhqIqueuoRqMfCq6aChERKegTz6Sksfx2oDEVZIAneyVfpNEByCiyDY7IA1nFq+humCbci47/Jfquy8MQMeo0+a+sm56s46FlDZYoYXhlr0U7BJDri83LPmH+BZ63x8haRn/qYHainm3OA229ceaBg4w4niIWdOtDeXgUs1JZQeWDkgn/KMYno
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe78ebf-cfc4-4839-9cd3-08db0aa5cb45
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 13:59:00.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9ZQq5ZT7Oe4xP/vsw/QitWnzU8uo3fkyxD0yNunfxJKPNKTanblrhQOBbwymw3Bauf4AfUNrxUIY+g+gaR/FUtAFuTnYJhE4cMiZkWZl90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5269

On 09/02/2023 12:11 pm, Anthony PERARD wrote:
> libxlu_pci.c doesn't use any "xlu__cfg*()" functions and doesn't use
> any of the disk parsing functions "xlu__disk*()", so all those headers
> can be removed.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

