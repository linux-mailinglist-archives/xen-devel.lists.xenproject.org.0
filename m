Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EB46F6CD5
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529746.824473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYsL-0006yv-Am; Thu, 04 May 2023 13:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529746.824473; Thu, 04 May 2023 13:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYsL-0006wY-7o; Thu, 04 May 2023 13:20:01 +0000
Received: by outflank-mailman (input) for mailman id 529746;
 Thu, 04 May 2023 13:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puYsJ-0006wS-Qc
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:20:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c9f4431-ea7e-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:19:57 +0200 (CEST)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 09:19:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6567.namprd03.prod.outlook.com (2603:10b6:a03:388::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 13:19:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 13:19:49 +0000
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
X-Inumbo-ID: 5c9f4431-ea7e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683206397;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9RTdJ5ycvxry+uYHLjAUjcrAJrpCvO6544pUQYTLnho=;
  b=hpeHy8iM8vFfadR26IN6N3UhmqCBsP1cV+ukEwQRkBPgJnMhz0mnb/fO
   5UTJAk9Jw8Z9pN8FIMFf8npneqfpFvgP11wJJdPEfvYc3sSLuNinwBDn7
   hFwAUP+xu6Jj+LZ4njKgJ+FxwBCtB9e3bDqjVeHwf3qK2N3+FIrJQE/mg
   4=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 110304341
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1AGOHasJJBfMiMb7xEctD6ZqLufnVMFfMUV32f8akzHdYApBsoF/q
 tZmKTrSPq6MN2Gjed53Otvk/UMAu5GHx9E2S1c5rio0Qi8b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKGyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLGEcMDu7xPuP3b+mcNs0mMAHBZa2M9ZK0p1g5Wmx4fcOZ7nmG/+P3vkBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/6xbLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTgraY22wHKroAVIBQzbHG9i/WXsXKBAexxC
 0EM5zEDl6dnoSRHSfG4BXVUukWsugMXUpxeGusx5QWJ14Ld+QPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESIYN3MYbCkICw4M+cD+oZobhwjKCN1kFcadkdD0Xzrwz
 jaipTI7wb4UiKYj1a+24FTGiDKEvYXSQ0g+4QC/dmC46gJ0Yqa1aoru7kLUhd5bN5qQRFSFu
 HkCmuCd4foIAJXLkzaCKM0SGJm56vDDNyfT6WODBLEk/jWpvmWlJIZZ5WkkIF8zappYPzj0f
 EXUpAVdoodJO2enZrN2ZIT3DNk2ya/nFpLuUfW8gsdyX6WdvTSvpElGDXN8FUi0+KTwucnT4
 aumTPs=
IronPort-HdrOrdr: A9a23:qegiyqmS5nY/5xCUUqVTIKaKi4jpDfOtimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WBjB8bZYOCGghriEGgG1+ffKlLbakrDH4JmtJ
 uINpIOcOEYbmIKx/oSgjPIderIqePvmM/HuQ6d9QYVcegAUdAD0+4NMHf+LqQAfngiOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYpILSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzS/Bky/JlZAkEuDzYJLiJaIfy/wzdZ9vfqmrCpe
 O84ivI+f4Drk85MFvF5ScFkDOQrQrGo0WStWNwx0GT7PARDQhKdPZplMZXdADU5FEnu8w52K
 VX33iBv54SFh/Ymj/hjuK4IS2Cu3DE1UbKq9Rj+EB3QM8bcvtcvIYf9ERaHNMJGz/78pkuFK
 1rANvH7PhbfFuGZzSB11MfiOCETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 DPM7hulrtJUsgKBJgNTdspUI+yECjAUBjMOGWdLRDuE7wGIWvEr9rt7LA89IiRCek1JNdYou
 WzbLqZjx9BR6vDM7z/4HQQyGGyfIyUZ0Wd9v1j
X-Talos-CUID: 9a23:zX/l9W/d3GWxeuE+LmOVv0pFC54OSj7E9WrdPnWKUXhtbJTKFFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AC/DKmQzkcXT1JFyZzi6k0C1OxK+aqK2LMWoLu5k?=
 =?us-ascii?q?ogPW7bxJeGzqFkS+aeIByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="110304341"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGbnkgxIKmZIO18QB4usrN37TLLNi5R4ewd+L/XJ1KauANr92jd7ufze4bTO8z9vLOPvaVnYo1nyaZN1k0RALLu4kBhTSM3xPks1oNoa1BNmnLNczcsBANU3c13w9OSMrSXIKL1DZAWSTsLnOG4xTBY/D47MvVsr+fwOBPbXPyaBmuoVDKtlSHBVlYS3tYtGhBTnQ2NgC/pz0Zp8ByOKIXl1G+OAh638uzT6oYxVXboVSJZLvpzbR5wcw9zRR+2cNoxfPZB+8mOtgK4wAldEX2fT7LvYvYvTGnR3550zRKnLYWXL8Bn9PWl0qYSjKgnvOncEDFIHXuimhUZ+Hn+Z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDyUL6c239KtTq3SoHXH9sj+wF/BRaLca3LyaXl6eQ0=;
 b=kUpNUk+r8j9TP+e9Nlx2hZTXnQlEnCSXkcpBlZY0IQI4bwZu+QdUHIjaN7TrbwHcCJlejRJEERwjIgDbt0NK+iQWqVXXr/jrB6upoZJM4csl8dBChxnXmfcX0jK1r33Sw+Q6UKMiqLjhLHy9Tn8bDHjiX+Og3wJfDPGw4pX28q6shjIMnh050unNKBWt4W9MQcqLaK/zpjUNnfq5nHgo3K6s0PQO6eF3g4X606aNaZnExgIN9yudi6cm2eHOBycaToITthVSTlltRQkjPFFSW8NizbG32K3c1tWfQ2GBp2XhsGSIanfRGTDjCMxJ7L2GDKy8Be+IYC1qY/X58aRB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDyUL6c239KtTq3SoHXH9sj+wF/BRaLca3LyaXl6eQ0=;
 b=lN5bY1Bg8+SgVcT6duhAU8rETNXEJiC9pgq8qRx2Q2r7Z6cj4eZ1DDRcvUE/SCEeDilH8LfXgdUWYfcU7nR8zO4KVRq5i9Jo6ZTMLs1QGYaVSrOJ8eZbV9f03izjKW0KVaaMY74xjyoKFTaMlhkiESOFV+LclZtrre+4EmeLKjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a349cf91-b103-7177-1f1b-743f0894f517@citrix.com>
Date: Thu, 4 May 2023 14:19:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen/misra: xen-analysis.py: allow cppcheck version
 above 2.7
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230504131245.2985400-1-luca.fancellu@arm.com>
 <20230504131245.2985400-3-luca.fancellu@arm.com>
In-Reply-To: <20230504131245.2985400-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 993d094f-69dc-4235-f82a-08db4ca23cb6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sWyjGs6+IxeRdoK97ahpyEhNAFJ00bkb4UcdkwjzK64+61WqZfZE4EoaN+8pjTH/HRnkRzDm6DKiFC7xZ00C4nF+UyCbbeHhqrRClR+6uhmnpJAKg5R7dH7/e+MnO0WQ0+1Cgn9HnSIZNmBDDOCkIx6sOKC7udOmoAII6oLGQZCIpn/VTCk4PUsyupM4ltPidimz+0UbI+s3/btbLBoUWgmCfiRc6pp6NB0KZV2HuGpcMuBiLy0Qg8zWYFSgyFrPn7bXFYNUkNnvN3FfNZYC43STknOuUrcuQsu/MZ0fVFc4muUlktw+KBH1mWM224A2Enkj5a0CPXcweeFL1D5uisR1PcnsmfViFclfmjov/9l3xC5ZfTRPjcITb6cOQiQYsc4mDxIznC3NZU4gbnyXdQlr7Z89RG4899hJ+XwITLAOycOxzoRSsMSjUP6Phrhl07oBms4oqwd2cBsXp9bu3iesALDvthA//sqZugqZZngqJMsewsEzcjnJgUcLUQ2ZMqMK4H4Exv30ACsCETFJOG1e+L5C3ENNb/dnPQPCt9ebDLzSuBSWLV7jnMjxmSAG0rKVN7eUZFqsRxy4Fgk3+90lpjDU0TAr1a0o3YAhrx9s6xg5Hq3gOQvTt9kE6CnHfEvTzIoykoA14sEtAgxrIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(316002)(82960400001)(38100700002)(186003)(54906003)(8936002)(8676002)(6512007)(53546011)(6506007)(26005)(5660300002)(86362001)(6666004)(2616005)(31686004)(83380400001)(2906002)(31696002)(478600001)(66476007)(66556008)(41300700001)(4326008)(66946007)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEhOTlIwendhTzJBbU44NngvQTVHQ1JmeTVFeWY1aWd2R29zUDl1djAvVllP?=
 =?utf-8?B?WUR2Ty9GY2pqT3FJNTNlVENLZTh6MThORzVZUmhDVzRaV01yNU1lcVk5QjFo?=
 =?utf-8?B?b3pSbXZDd2V5a3A2STMzcWNjMDkvRFk0SnVRTndPS0c0NG02djZ3OGRETUZs?=
 =?utf-8?B?K0lJSmdrTVcrenROUXl0N3BGQ0xsWTJVUm1mNFhrRzJYcFd6REh0cWJhU0M1?=
 =?utf-8?B?NWphbEVFVHZVTWwrbCtSRTZISUZsY2xKQU4wbHAwNkdTYVIvKzlmdjNZbTdU?=
 =?utf-8?B?a2l3TzBIWkFpbEJoSG5hWS9PRTd2bjVqSHBBcE1US000blpYVVM5RU5JdVps?=
 =?utf-8?B?NzVCak4vYVY5a29GVWQyZE9hU3g2N2tVTmpWS0lLajBneHAxWDhJRWZicXhs?=
 =?utf-8?B?NTBYQWRQNGRjeWRqaDlVSGNiNlh0V0xacmI4ekhER3pYU25SYmhoUFJXTU9X?=
 =?utf-8?B?eVNsam1MNXNSSE0xbndFcGMrVmdHNTNCT3h2Qml2TzErUFlBVndOQWdTRjN6?=
 =?utf-8?B?TUtjMU1Gd1BER2RWNmVzNElYSEx4bHBibjZBQXc3MkJUakxxQm9yMm03QXp3?=
 =?utf-8?B?NnVTaWZiWDhjM25IVVhOMnZMbFkvSVkzWFJaZWhsSmlmSW93aTJDSml1R0Qx?=
 =?utf-8?B?Ulk1dEo2dEtDbTZPb2dtN1I1eHpqd2RtYlIxK3JyQ296WlkvMzJhZEM0YTkw?=
 =?utf-8?B?N3FNZ09MTzVFSFZLbFFMeGJkR3ZNZWdMbkt0WHN6bHNwUkJ0MHFhVHdGdmR1?=
 =?utf-8?B?WHJGYTFHUGpMMVVkdG5pTTRRaTBFSEtrdjlOaGFRaG9zZEJYSFJkem1GdER1?=
 =?utf-8?B?MnV3M29YV2ZkZ0ZtSzdDZGREdWxPQklUTUhpSkttcGJ0a3VQVTdST2RPTWow?=
 =?utf-8?B?S2NzTEpuSkVpeFVPb3hNNWw0YkZSeGx5TWl4VkxjWDhjZFUzOEVGQ0VRa1hi?=
 =?utf-8?B?dE5jc09iVFlFTldsczE5RFEvT3VBbjlMN0cvSmpDUENDOEw1QUdkUkYyN3lo?=
 =?utf-8?B?TG9uU1BmOEJDK0xFTm85WUo4RWE2RE1ENElUQ0ZoSE9zKzYxNUU2LzI0UVc4?=
 =?utf-8?B?eXBPUTRSenZnZWFpM001YXVwQ0xBWlJvbkIyREtsbUc0bHdyOTFLR2Y3QURm?=
 =?utf-8?B?RmdXY0NvNGVKS0sydi82SkpXc0I4TDRtY2VHOXczenlyT0tTVlR1SjlTYk5l?=
 =?utf-8?B?YU9DT0JVYXgzN2x2TU1IWlJHMU5TUXJocFFwM01UaGd3alFVSU9TYWg2QlBR?=
 =?utf-8?B?dXN2Q0hXWHNCOTY4QlVNa0x5VGRWY2JBU1VqRVVnb2xZYytxdnFxQVFHS2JU?=
 =?utf-8?B?enUvVkRQNXJnMXNWZis3bEpoaDZ2NE9wMFhDQU03UkNYSGtiLzEvYW1jd2FM?=
 =?utf-8?B?WDVmdXJnU1dCSGU4OXEraGRmbFBCdEo1YjBKdmdwZ0dDa2NaMTJtU3FXVmxR?=
 =?utf-8?B?bWlwWlROYWorbW9vMkZScnE0dzJuckxzQyt2NVJWNmtpWndHNVEzTFQwWlc4?=
 =?utf-8?B?a1B0d2dQRmN3QnVGalBYTUNKRzRTcnEzU0RJOXZEdk0zc2QvR2lrQzBNcUk1?=
 =?utf-8?B?UnVGdTJ5YmU2TmZtQXhyamZCellac3ZXSlhSSXVCeFRvWkJqaXNqajJIakxk?=
 =?utf-8?B?cGhCQjFsOUpaZ0JpUDUySHVWcTNOQVpTYlE1MnAyOEtvV1RvN1lDczFidTdS?=
 =?utf-8?B?NG5ST2N6L2pTcGdGQnZZQThNckN4WVhIOVlVM2drTXF4VXhjbWRBd3dRWE9N?=
 =?utf-8?B?MXBIbEEvTFhQcGNtcnB4WUdyVXlDcUpnaDVsZ25RT2ltYzluc1FmYzU3b0JB?=
 =?utf-8?B?c1ZsRmZCLzhGTzhSQVpkTEhSV2ZqbW5NWWVIYXNCTThEaC9JeFpZVkJhU2xj?=
 =?utf-8?B?aE5QWkhnbEpGVno0VWF6enNtMXJYemZZSzhuZXhCZ1BwQ1cvRm5zcFlJNUF1?=
 =?utf-8?B?ZWdnZGdSNXlOM1QwTTArc201NHdPY2tOQ2NGT2JXeFR5RE5KK29yUlFzUDJJ?=
 =?utf-8?B?VGxYbTY5Y24yUVlNYVh1ZFM1WW9yQ1k3ZE5OVkExbmNTTzBzM2lIUGFTdkMr?=
 =?utf-8?B?c05GQ3djOS9BQmdocHo4Ylp2RDExekFLRlBIL05LWGYrbFV0QWdUUmFhUUZ6?=
 =?utf-8?B?QS9oOU40WU5SZWlWOEV6MTdWUGw4OVNramhGVXJZTGtBUnF4TVVEbEUxWE1D?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZWsz7fOQUiZNXlWS3EdbNnkGHKkgwK1+LE3N5dCrYFFZREr7O4Bwxbymf+Mb34Hi7kz5Xkxcrj32s8LL1iETJ5QBsRrbG/lylHINrdHjX/pRiX0n+w4Y64ctRJb26VRRYlCOcDPqsb8mLJzdKmQwTi9VhIYa785PYX8KIExvRMieol1Vfp0pNe350nWZYuC6SuNpvBIrjPWxjvjfB1HhUTXA3tNl6IzKWuevjQdM4XL4S+BE4ixNvoAHAiI8yMNSYcxD4oTBHvoWgA5aA/Oj1vpHOXp9O3Kt/pJa0q9T6xApbwDeA+C+HvtSaJ70OUGREEHbC++aeSqONji6msW8ySsxULGEq68svt1BhtLaScLB81RXV538LodlWCmY24uOzZNRJ/80Puh4xd5MlU9agLBZUHzMxCtMGb+midiKbz3CqHVJ+GWoIJJ/lwvu2L89/G0b0499K/QB+WBLRpOoIAoIIeaR8NxX9o7nNapyEhHNyajLlJ03qwpVnbPOt1hKv5I5bKwF5YFfZjYODdaEUUOk8i/ohfgXm+XD7gw5EjyJt6jzzjBIYOQ8vjqOW9jZJ81rZFYulsYIDjC/BpAxMClVdaJhaEIXOkN6TT5c1er6zlNR3h96zo1msQWlLZh7T3uTPnkwv+4Lx4FTBagI2sgHjYjsYtasK8pNOvVq7n7bILllTda+runPj/zl2YQ2Fk3UJZ9E2oLC8gPcTHY2InVvdw8Jt6ib+hTeJAbXCv7ij22p9aupdeZKjSlQWrvrMHnzafbsQlNN3vrMmAg2oksTmaMTNXOJiaRiNqLciJLtryypsbBAhJQtXuNT814BsyrT2BKD6zWc/vW99nPHkG92EI1J/tHQtccST5dJcCrG2RtBXdPbg965urWwN+EB
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993d094f-69dc-4235-f82a-08db4ca23cb6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 13:19:49.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCxYHKv4zLQCc7BYi1h6DB1c7FEK8kxa+1D2GegS/V7xq2+JGvFlZst/0QFKMjxrd7zhfsqAZNS8QZkW4kTVKco3qtCI6PtSpSNvpAR1u7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6567

On 04/05/2023 2:12 pm, Luca Fancellu wrote:
> Allow the use of Cppcheck version above 2.7, exception for 2.8 which
> is known and documented do be broken.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/scripts/xen_analysis/cppcheck_analysis.py | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
> index 658795bb9f5b..c3783e8df343 100644
> --- a/xen/scripts/xen_analysis/cppcheck_analysis.py
> +++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
> @@ -157,13 +157,25 @@ def generate_cppcheck_deps():
>              "Error occured retrieving cppcheck version:\n{}\n\n{}"
>          )
>  
> -    version_regex = re.search('^Cppcheck (.*)$', invoke_cppcheck, flags=re.M)
> +    version_regex = re.search('^Cppcheck (\d+).(\d+)(?:.\d+)?$',
> +                              invoke_cppcheck, flags=re.M)
>      # Currently, only cppcheck version >= 2.7 is supported, but version 2.8 is
>      # known to be broken, please refer to docs/misra/cppcheck.txt
> -    if (not version_regex) or (not version_regex.group(1).startswith("2.7")):
> +    if (not version_regex) or len(version_regex.groups()) < 2:
>          raise CppcheckDepsPhaseError(
> -                "Can't find cppcheck version or version is not 2.7"
> -              )
> +            "Can't find cppcheck version or version not identified: "
> +            "{}".format(invoke_cppcheck)
> +        )
> +    major = int(version_regex.group(1))
> +    minor = int(version_regex.group(2))
> +    if major < 2 or (major == 2 and minor < 7):
> +        raise CppcheckDepsPhaseError(
> +            "Cppcheck version < 2.7 is not supported"
> +        )
> +    if major == 2 and minor == 8:
> +        raise CppcheckDepsPhaseError(
> +            "Cppcheck version 2.8 is known to be broken, see the documentation"
> +        )

Python sorts tuples the helpful way around, so for example

v = (2, 9)

if v < (2, 7) or v == (2, 8):
    # handle error

does what you want, and far more concisely.

~Andrew

