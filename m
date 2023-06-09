Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FB72A039
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 18:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546217.852918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7f1Z-0006Gm-FJ; Fri, 09 Jun 2023 16:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546217.852918; Fri, 09 Jun 2023 16:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7f1Z-0006Es-Cj; Fri, 09 Jun 2023 16:31:41 +0000
Received: by outflank-mailman (input) for mailman id 546217;
 Fri, 09 Jun 2023 16:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7f1Y-0006Ek-3c
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 16:31:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1987a4fa-06e3-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 18:31:37 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 12:31:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5602.namprd03.prod.outlook.com (2603:10b6:208:284::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.41; Fri, 9 Jun
 2023 16:31:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 16:31:30 +0000
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
X-Inumbo-ID: 1987a4fa-06e3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686328297;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PFvtRfI3tyycNh0Y6ibUz4HAkPAtJhDaFaYJLCNFRw8=;
  b=Ss20PG8Kqms9HcdVAi3a5Hrr1JwB3jYoGMidazZ71OOtsKaisEQurqsW
   bWuZ6LZ7zKdtl7gnWRlB45Yv4WdFSN8rtGdo49FsOXusbMRHnH+JPEAFV
   OndgISZuSWBHpmP4c8Tw/zStFDbxqi0ljhIwOXSdPy252RpgYByOihlPT
   U=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 112655484
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZojgJaK290LD5xuZFE+R45QlxSXFcZb7ZxGr2PjKsXjdYENS1T0Pn
 GYYUD3SPf3bYGumfN0iOd6y905XvsDTyN9qHQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5YAVBIr
 /I/JQkDYzGDgsSK8p+8Q8xj05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMlWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqhBt9PSO3knhJsqEW2gVYLNAdJbwW6i9Sot0uYBIpQO
 0NBr0LCqoB3riRHVOLVWhyzoHeA+BkGSddUO+Q/5EeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kOYgnnS99iFOu5i4PzEDSpm
 jSS9nFh3vMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIsxqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:pm4Ig6g8Ytm6qXpEGwdAmQaRhnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:0hwvvm2AMth1tpa0xY8RsLxfNcAUdCfT63rpLUKZCWNPdI+4Tla19/Yx
X-Talos-MUID: 9a23:ZVEWcgodvOJmfE7HV34ezylHc/1w377xMh4Mu7gXhsyianR/KzjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,229,1681185600"; 
   d="scan'208";a="112655484"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek6j03lnfIxA1rUV5mCJk5Px8APNshe89MNKV8/BUhuxochG6P++9qemxb/hglgRgm+MljnEq9ZWk+MYhdK0SyJLUr+0IqdUwgfgCMYFS+do2CUJUOD9D6/hptgBPJ+KOgL4KcQZSvRDKyBOUOPzdsBnTIXvBH9nCZ9cKm5iShk8fqjZawXkCsAoL2hdgNvG/GsJNi5hVQLmDDCwtE2J6R5zakH4f9hIGrnJUWDEDjqGkdCUwexsdxT0VWAvUG5J3D7nnRBMaOXCm2agTnblbRKpTJDdbSv+L6Ibpx1uw7pXXEYRa8raXdVGSCPL5w39E2umQBmTQ50slj4FfF/WWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GXKUFISuOzwzr28Y+RztO8dzbl/qmQbueQtx8ybKJk=;
 b=Q0hflLDRd26AfEV4qqoowdK7msCkBVSOKqYa9zM+RyrMVBS95g3Zhn7/dzRpUTNQaFRcZhoaJyfosADBAaYqkjAMNXETSGofSPGU0zKSs6LZvgVyezI7Ilpgeq0WX/9bi5uc2SpSlYW4T3SMZEQdskoAgNJq61OcfOrhBT0VkYbT6oK0Zn7rtpwp8IDQ8KvF4lpYrBqMV7uMMoSMqzlgLSZ1E8uGBcC2YKYyuE33o9lq865hwqIJksAfexzM4gZhKkD7oJu3FBpv0+JrREygNEfMP0Fem+8crVn8nDAoIPfKhyWFdBQJPsPfI/+iDGve5Gn67lY0OsgJVdo5bErDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GXKUFISuOzwzr28Y+RztO8dzbl/qmQbueQtx8ybKJk=;
 b=UmEXM6wAD6OiBM6K3WfYKamfLYLPJRmyOsOQDVQ9dq8CA+NgDmz+btZ18IZOXUUotazZ3E7RlDycvrYqcWOVBxrdqfuuvix6b8RmqLfDyLhfzVB5y8zL++fx2p/JIJ8BK9o9jRycbHOTSNAV7N9sEQ+Zv6At83RzRbuxeWUob5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <600bacc4-3569-10e8-0c09-d6b855c0512e@citrix.com>
Date: Fri, 9 Jun 2023 17:31:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] CI: Add Ocaml to the alpine containers
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230609160244.2638438-1-andrew.cooper3@citrix.com>
 <2dcb05a1-d408-e9f3-1108-a155dc3312ff@amd.com>
In-Reply-To: <2dcb05a1-d408-e9f3-1108-a155dc3312ff@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d7c940-dee2-4236-398c-08db6906faf1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	je++ScT5MbGuCJk3IjkB/XqdHvB4f96x0jGQiZFv/bYD+CDKHeFe6sio+2pareq1F4FTZCYizsZ9uWKc3XXPB9My86b/glSB6t1QvnR/Z03GtgyQYlN7tVq2H5pc6zLN94QEFjpzT6p5l8BxGIcuqAMACt9eu/hw74V3vO3jRuyZmG6Kws6wyZm/GikdT57zqeEzexY2pPqcbZCBJ5K0BaAilc21K4yIDAV6VAMV1xHQhpjLX/IpQ4upAjyc/DE6GLn5oRYLecMu7QScn+ScJxbi6n2qapu9Cx4B986b8yQJoerfiVqc2njbHpD4XmtoL5vUqfiFBFPIVGuTg6YkYDo/TQ9k7naliIurxlo2KewBTO43blDyV4eMR7Lu4rx5M20Dgs4Q+siMlrynUq14LMmyF3U/jFyApRmWDTSnGNC6WRidc7EwlCyrqBbIUyva82DT5o5q0NYKPCtnQ5clF+TlrX6/ByBCkX2PeUE5icoSf/XPJbWmY/3t+aqUZVXWtPBXVI4sw5UGghurBVh83066fvKlZp/XJt6jmRB/UKJIYGADA3oRMeqP416u8CBZrPtU0p/hUzoNnY5bEFfbObW1oAYrjDBJXFnVe+NQYHgNhZ0PRnnqmr0GfBDbBxCmfNQVWEcBCxX8xtCSSVBStQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(31686004)(66476007)(66946007)(316002)(66556008)(107886003)(966005)(54906003)(4326008)(86362001)(110136005)(478600001)(36756003)(31696002)(83380400001)(6506007)(26005)(6512007)(186003)(53546011)(6486002)(41300700001)(5660300002)(8676002)(8936002)(2906002)(6666004)(82960400001)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9IMVBjRWJFd0NoRlZQWkM0aWllN0c4R2FlblVWN3BqWFE3cGEvYUhwc1U3?=
 =?utf-8?B?RUMyRWhuODRFYlE1TFJSajE5TnR5NnFxcFRja0szRkpIdDNubFJwOEluTUpx?=
 =?utf-8?B?SVJpM0d5NWtyQU1zWGg1dDE5ZVFYT3Y0QkJwTUx3K1hCeDlDVXM2Qy8yK0hT?=
 =?utf-8?B?R2ZvSVNFZ0xISkpFMVQ1bHdZR080TFgxSXRNVzdzaE5YenJLUmFCTzFNeXJu?=
 =?utf-8?B?RytzK1p5QWo3dG5LZVFjSTF1NXVrSisrZ2hRbjh0STE3TnpXelc2L2FYWkF5?=
 =?utf-8?B?Z1FwU3BVVVNrL2dGcTRmSFRvZlRrbkZZdGswOUJvdG0ySXU4NUN5Mk5Ed3F3?=
 =?utf-8?B?bVNqK2dpekN0M29IWDYrbzNUM1NkRFhoVWZiOTFuTExybFVDc3VvOC85N21h?=
 =?utf-8?B?b0RJU3Z0N3JKTGp1K2c3V0dFeTFSM0NmaGcxNmdiQmk2WFk0eWRyeDE2N0py?=
 =?utf-8?B?NzhkbVFIT2NidWtwU0ZDUlczWmEzRStvaDdzU3dubkpYMmZxS3MyTmxGNHFI?=
 =?utf-8?B?UFJleGw3YWw2TkVGM0NqYWtMa014TDUraGFRTW10WU4xWWdnRkNBZk5sbmk4?=
 =?utf-8?B?ZWFOOVNDTFE3a25rZmVncjRTS2lTYS9HT0J3UG5pLyt4Q2RyMjY4L2VMbXhw?=
 =?utf-8?B?RDFyanRPWnBGZXNBWjk1VHdScDY0aVg4VWF4M20wa25pTGZGRlBkb0o4RnBN?=
 =?utf-8?B?NEV2UmU2U3lkRGN4RVNhbDNhZTM5djBOemM1ay9NNjBxUHNjQlorWFBMNFNa?=
 =?utf-8?B?MlNzZjkrZkxZOUF5bitMM0FVU2loMjdIUThTNzF1TjRldXN5bHFMYmhFQzRZ?=
 =?utf-8?B?dUdLYjI2eHdWL1EvOENKYU9xeGhFU0ZERFhkaWVMTC9RVFN0QUhPdGd4T05O?=
 =?utf-8?B?Y3RNN2t0S0YraWJBQmFTZ2RwY2VsTmxxV1pXNE5MdSt3akJPN1NZcUdoMW9p?=
 =?utf-8?B?R0JaQjRDRDBHQTM3ODhsbXFna1lJc3lTZU5EMGVSai9xZGEyRW9iWjV1dldM?=
 =?utf-8?B?aXFTUXQwV2RLNnZ0am1jdGFVaFdMdFVSSXF1V1lud1huUkJsSWxPMEMvTlFB?=
 =?utf-8?B?TkIza3hqVDhmRndvOFhzNHlPTHNJSVRSYmRoVEFUNVlTQlpzMmRZd2ticGoz?=
 =?utf-8?B?RTg1d3I5YTNReXJRWmpUWjc2eU4xT3IrM0xKWllQM1F6TTM1V1YvbVgxR21G?=
 =?utf-8?B?STRsczJkTjlEVDB1SjNUWTFSOE1IcmJaYTkvTG9jUzdCQ3NxcXRVZzNrL0p3?=
 =?utf-8?B?cUlXbkU0a0FLS2t5bnI3QUZ2My9Eb3R2bk1BSjYwbm9hMkxDY05maU02TUVv?=
 =?utf-8?B?RTFGVm1NaGl3VVBSZDdwazE4RG9mSkJ1a0NsdHM3OXBEbW5CY2s3c3luZFJu?=
 =?utf-8?B?enE5QjFpekFZTXFEOVFvRVhUQXlxNjVzckx2Y3E3UE45Wjh2bS9FS0E4VElx?=
 =?utf-8?B?UndPanZwbnhxNjJFR0Q2RGlFcG0zZDkyMWNIcXBORWZvVVp4eHBab1pTODBz?=
 =?utf-8?B?cG1ObzBQanpDbVpXdVAwTm1TWlRZYy9pWUdzSWdzbFJMUnRmTUpjaUIydi9h?=
 =?utf-8?B?aGU5amxRaUV1VTJSVDEyZnA4WWtEVXFPT2JoVE55UzFKZ3MxaUp1UkNoZzZn?=
 =?utf-8?B?QnlYT3JXS3JiVFJJVWdka0xrNkVpMDBGS2prNmR5U3Rid3pwRm1ZdzEvWVJz?=
 =?utf-8?B?emJvMEJtNkF6MXA5UktFWnJjYmRQVUJyTFU4cHlIMHZMYjJUVVJwK3F0YkRL?=
 =?utf-8?B?M2VhZHAzbU1NNkFGejRKcmhNQk1naVB6VHFCV0prS1JYcUVOOFNxU2VzUDlK?=
 =?utf-8?B?Znlka25ORmJFOUZKQnB1VnNlcnVDUkI3U0lYTmE2SlJGTWRrVHlRaitwZHhT?=
 =?utf-8?B?Umo2NjVDS1dzNUU0N3ZTK3dUMndlSzJCaUw4ZDAzUDhRanQrZWFvVlBCS3dl?=
 =?utf-8?B?cTJWdHRTM2tkcHBYQ0RSOEVvMHl2WXpTRmE3dVZwcTJLQ3NZUWhXV1NKbUZp?=
 =?utf-8?B?Q2xBT2VHRmlTVmNsNnFrU1RkZHE1UlV2Z1M0NHdsVWtaZ2lsUy9xLy8ySm9M?=
 =?utf-8?B?SzQ3NjQzTWkvOFNjd0pHcHF4Ny85NDBQanNET0RxVUt2dDQrMWhuVEtaZHgv?=
 =?utf-8?B?OUtXR2dXdjB4NHpDa2YvZzlScUlOTnFjTElrZ1ZDbStRZGd0aW85VzQvRFdu?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E2ga1yC4AOiM/aVSTOm6rw/RmUDANjZqWJopztCO5OsvJWWcV79VgmG2jylfeaY9DO54/eVWj8Cwz4L6Srrkf4MhSFOxce4ValLBZx6AX56yvVAuqsOM6aOksUnijvH+7nGT7AhNADhkY1J06NOs4ie+n5+dH06rARmllZFkvmKxZ5bx5fhNcfeREaiGyQx1crhaqKzXnqmxh2bYdv+rGuFHuwOTG0Fux6VkRMRHGUBVGP9PPJoixuVa6g+dZFerEfmGjSUMb38tpEfZUS3Fbr++0FnNdBSPEkmvrnqJ3RaX4HpslHkIof+34ESn0GIYoaznYQaKTXg2xAYkwesMCmkMGFV/aKDMbn332pf7T+ikDCkZzr9VjV2mQeQ5OXhdci/SylaVs7IwvkMcDFPm7Tga44BlpCg5RFC6KWQ2zxFZWESx+RCQDdEp+crJgWEj5vPonGDKDEUz1F3bqZ2PfVo3UJFRyypvw2Lqa/NRjJFNhNrkcAbwSmygZckqs5NYDbnr+CNs0cZf/6zQ9l90TIPPeYW0XYzlod9CmUdGBDWVE8lFjaaLs1+mvwDnxGoh+58+EHGMxOvlouOhG1W2dIhuEkD7OKxtB1a/tWnybzkQlQzkkN10CHMz3EgYxO4JRBeHS9hR5iYMGpD9GPZDn6r/TvmFDYpDH+PocFy3StpkU+IfigHMfdLTPq/FQLUbBt2Vhiflqbic8FqylRb+9YFFWVppGyHRNtT1JZBOXM+p9RjK3nTtBN2aVNJzcioDL2jmbdWhLBob/ruFJ+MhTrG1XhPj9LsGMwBG2qMBmFULFn1bFQIQWIfAi9OmT2xI2DStPXwBRoTUwqOrP99GbQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d7c940-dee2-4236-398c-08db6906faf1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 16:31:30.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/cNbJMgQINFk/uh/L/bamfDKjUv3u561/iiv6hU8BonnHA9K7knGezVqdYQ+mNjAdO0H6g2TbW59Irnb6CbFmsGSF0PFivRxtwjcgPXYgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5602

On 09/06/2023 5:21 pm, Michal Orzel wrote:
> On 09/06/2023 18:02, Andrew Cooper wrote:
>> This gets more coverage of optional parts of the build, and makes it easier to
>> trial Ocaml related changes in the smoke tests.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Hacked up manually to fix the Ocaml bindings for arm64:
>>
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/895162017
>>
>> but this aspect should be done irrespective.
>> ---
>>  automation/build/alpine/3.12-arm64v8.dockerfile | 2 ++
>>  automation/build/alpine/3.12.dockerfile         | 2 ++
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
>> index 3f1e6a3fc6df..1be3bf780509 100644
>> --- a/automation/build/alpine/3.12-arm64v8.dockerfile
>> +++ b/automation/build/alpine/3.12-arm64v8.dockerfile
>> @@ -28,6 +28,8 @@ RUN apk --no-cache add \
>>    make \
>>    musl-dev  \
>>    ncurses-dev \
>> +  ocaml \
>> +  ocaml-findlib \
> I can see that in your CI pipeline, this package is missing. Is it then necessary to be added?
> Asking just out of curiosity because other containers have it installed too.
>
> Apart from that, I can confirm that containers can be built without issues, so:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.  It is necessary, yes.

I missed it the first time around, and deployed updated container to
rerun the failed job, rather than pushing a full new branch.

I'm unsure why the opensuse containers have ocaml-ocamlbuild and
ocaml-ocamldoc too, but that can be a mystery for another day.

~Andrew

