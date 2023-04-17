Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C7B6E4BBF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 16:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522215.811429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poQ3Z-0004LP-GC; Mon, 17 Apr 2023 14:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522215.811429; Mon, 17 Apr 2023 14:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poQ3Z-0004Ix-DJ; Mon, 17 Apr 2023 14:42:13 +0000
Received: by outflank-mailman (input) for mailman id 522215;
 Mon, 17 Apr 2023 14:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poQ3X-0004Ir-Kd
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 14:42:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05360382-dd2e-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 16:42:06 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 10:42:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7196.namprd03.prod.outlook.com (2603:10b6:510:247::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 14:41:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 14:41:55 +0000
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
X-Inumbo-ID: 05360382-dd2e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681742526;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y8jdEVpiojtZlwow2Je50nscY+z6pm980Qmqfz8vV1c=;
  b=C80jNoP5hwhwzAE+USS/SwyBz3QS910Iu/gv8RQNYA6dXTKEs/JHfhr4
   7PQP/vJyUbKAZ8gV6NXEV8ZBOZMRAAcJ03XUXUWXpQKASU79oZNqAI0qi
   K+IRsvLXQXpgCEqpU9I6I5IQ9SP3NvzPRoZ8W+myG/oAHRdV0HohY5zbs
   I=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 104599947
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Y7t1ZKmk3W4Tufy1hoMVgeXo5gxEJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLW2iGPv3bMGb9fIgiYdu2/UNQ68XVndVkSAQ/+31hEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5QCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 bsTIxsyQkzdvPL1nqCgWvdDmO0pHda+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieCxWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOHlp6873AL7Kmo7LxkVage4rv2DrE+PZe1UN
 RMGwgcCsv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRjssz
 FaF2czoAT9Ht6ecQnaQsLyTqFuaKSUTaGMPeyIAZQ8E+MX45pE+iArVSdRuG7Lzicf6cQwc2
 BiPpSk6wrkW08gC0vzj+Uid2mrw4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1XdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:ELHnRqO1ZBYdvsBcTsijsMiBIKoaSvp037BL7TETdfUxSKalfq
 +V8cjzuSWZtN9zYhEdcLK7VpVoKEm0nfVICOEqTNKftWLd2VdAQrsM0WOoqweQfxEXnIRmpM
 VdT5Q=
X-Talos-CUID: =?us-ascii?q?9a23=3AHtui2WgYQJzmLfrw6yCS3iNAzjJuNXbW50j8fxG?=
 =?us-ascii?q?DGSU3WqaFV3CO0alVjJ87?=
X-Talos-MUID: 9a23:cWHe1gqlxP/u+e0ORQQezxZmN/g04KuqMmYMoKs5sNfbJxRdFyjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="104599947"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MT91D2zWamebBEEv2k4CEYzADAy8JVyyfP8Kh0A9FZkRgu4ihAu80fs7rHyUxdL3CiNsfqJdgy73gvQCI0NQ5FSQRHtE/85Y8dN3O6YkDv7rUdCNKn8Lh3k+hGE03KvxfsPRCJ8CF1nLmWQUwbBrg0wdGG8Gh4Dgi9v9WACjvIipYdIFvpyxyqw8sQBPKp8jbgbaC7NaQ2EHMZoXyn4tHO/89AtXqaZGT4V6ES8PFKgtwJOldpjEG6FFcQOCZ/trpJX4wKRz+Fiej3kbqB1J7rfRTS3k1iiMuUuuJaGr4unDKGC3UU603WREbnqlVGbV3aDpU8raKiME+QqbpurRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8EAtqB0DW9e9+Dy70SloebbvPxYikdcuoygh95MPUI=;
 b=bFyp+lvh1j0z4BnTkz+CCmbNhw65vrHw50oDL4992EFlZCN4k3yt5rdPpipHDNMWVxzJ01zdUCf/gUHZ3lho/xJIm7MptQ+MqAWwqhwL/jberPA01po03SsFbK1EUl2F4Pqzgj535yqgNDfP/qS2Orfkw/gncdY8Qis8JoZghjIO0VSE5czvBnp6pnExcKob9fhqVJ+/Xa4KQEAj489WTA6SCrTvm67rciYQ3UHLdIwzbkNO3stAzUrTydIFfrj8a4Mr5vijmjrUzTxV9Fg/gPLHz9t4LNCqmMK9r238PZmesnj/4sDVUlB15zC8UXqBjDzOzvmQWmAMh82fzHJiYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8EAtqB0DW9e9+Dy70SloebbvPxYikdcuoygh95MPUI=;
 b=w2BXfBE8CDH5iQzfYWMMcZVHDBMrHnvmKL4A5lUeCqTEugjFGAZIL3EXOZKJw73jLlbK9rTn2TvbDa91h50SQKG14aeoIv5yxgbe2CSxpTVN4IW4k31/EaEOMpPGKkDvS0m11p6IlRSIxeTkKH3azVpAF1jSmaej3q2jYYcBs3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <22179eac-4fc9-1521-2a83-2313b8c44a2d@citrix.com>
Date: Mon, 17 Apr 2023 15:41:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417135219.3776777-1-andrew.cooper3@citrix.com>
 <d83288c5-6247-ef7d-b9ba-8bf24c7831ac@suse.com>
In-Reply-To: <d83288c5-6247-ef7d-b9ba-8bf24c7831ac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 284f86f0-96a7-4a15-9195-08db3f51e3b8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/lUW0EJ0U7czC5iJjMHcfrfqitMaIVqvUeJQRkuF0SO4pWUeQr1nwHdL5Fo7ddGAig9vnGCfgrKhD5acEaV8RYSf/EKnkOPLZe72BJi72GKLO5hsLEXcoJXJbU3eU5G2C9GCQ5wB+z8m0L3kbz3P6tIJF53HF5VfZ/sdIjT7i+fBUTnE/iDwmzL9UpxO2AKx314UwEKJggvOj/73+KwwNlTU7vIc22IBuxcRxcNO2CA42tugW3LzJAp/3yrN6b7aUDpp4dqeiPICR2DP7rbt9bYBIc62kwt77xv/ASQ5yiXhfYrK7mk1hUwvoFxdEPzo6R1WBxI9suHH3k1JEnJCIyxNTYyrDRQDovOgFJ1tcZN0A3rfLqN5Yc9pA4bHTMSVfWyo51T2UKAdyPtZ6pMsfNejthA3UTFRa832JcW8th0zFutiqNUK4Vp/eHrEJcgFgtQ6hSuKOKTrLtCIlvT2RYLfZEx7FEv/+I6Gq5jRSUDBCMKJ0+k2ShvWGIal0UfRv6pezzCA+CRqu5xowC0J12RL2EJJ+JQl/StbeE04c0HTgP5TwIvQt7nnLcxmWiOrHqejU1xJF68L3W5LqVk5rjzfzyUUwFO3x8XQ7suEFgpR0RiKISlgtU7UHwq4BYdoHFV2MNyYS3cdcGkfDXmQcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(41300700001)(82960400001)(66476007)(6916009)(4326008)(66946007)(66556008)(54906003)(186003)(2906002)(53546011)(36756003)(26005)(6506007)(6512007)(86362001)(31696002)(83380400001)(2616005)(31686004)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2srNU5yanRnNVpBamMrMld0YTJYOS9uK3l6ZDR3aUxuWjdaTHdwbUs4M2hv?=
 =?utf-8?B?czk2WWJ0VFV5SXFrK1Q0d3FBVEVPeVA1WGxHZFhNemg3d3d5dTd2Tm9ZQ3hR?=
 =?utf-8?B?NXVNL3Jpek9EdkJlSE9pdzFCVUEwa3JaS1orWTRETGNuWGhHd3BYQVJYMnVn?=
 =?utf-8?B?TGY4UFljRnAzdFhwV3FGWUQzYk1kdEFnZWNnZ1BiR00yQ3pRMy9lZEJQUS9Q?=
 =?utf-8?B?dkxEZ1RvcVlVam5MeHIvem5neHM0a0h2TmV4VzE3dkQ1VjBlSlp4Mmx6K2Vp?=
 =?utf-8?B?dGZFUzhaNjJsM3R0dFk5aGorbUhWVlg3alF4YjBqUDlUT2NyTVBoU0RrMVBu?=
 =?utf-8?B?aWEwRXU1RUN2OXdwQXF4K1BMRk1YL014c2ttNWNIaU8rNXR0TDlNU0kyRFpp?=
 =?utf-8?B?bFcwMTVMN3JlY3RnSGNhWDNhZlowcU04QUJ3Z1plQlRBcjE1Yjdma1g2Skww?=
 =?utf-8?B?M1g4cml6S3lmd2hIM3VIeC9UNUR0ZXFMQ2tFdU9sTnJpUzBobnhON2JtTmZE?=
 =?utf-8?B?ODBpTHNOblhxZERpZUd3K0VyWkZtRmFpSHhXUTBwclYrY293MVlMYkdtOWow?=
 =?utf-8?B?MWV0ZjlYWExTNzN6dUw0ZDN5bVZkaTZPQStObkdmOHMxRitTSHI5UHZkRlFO?=
 =?utf-8?B?VzFERTlFQWcrTjZBZXZzME04V0J5QkZSMDE3Nm90djNSWFk2OFVLTkYxYlc0?=
 =?utf-8?B?akxYclArN2pCZlMxVXlKSHRrYTRsOXZ2TUtGWithWHNTZmp5UnBWSVE0c0hv?=
 =?utf-8?B?K0V2OUtzcm5iNmoydE1jaFhzMlc1ZWJyZXZsNXhYc3NRcXhEZ3RabldpOGRG?=
 =?utf-8?B?MURtMlBzcEdYNzJ1dWxCN2FtdXE2U1dvQ1pzRW5DOEtGNWcwM01KcG41dEdD?=
 =?utf-8?B?N2tBaGU4cWNZSVYyRGFjV3dCT1BpZjNaN2hiSEtHS01JTUh5TGNyd29CWlda?=
 =?utf-8?B?MVpjK0J2SmZHZmZ5YkdYS1hRQXFaZC8yQ2paQnBXb1pHeGdJTmcwdThKNGgy?=
 =?utf-8?B?bC82WDNaVkJ6TWxSNnNVdGlWUkZWZHVGb3FDdzBXWUkxbFZGdEVSV1ozeW9L?=
 =?utf-8?B?RWdYQlZ4NkF5SlJ6Q1hsUGZaTjBYOVJkNVcyelYxUXAwbURqNnRyT1VXejZa?=
 =?utf-8?B?bzhKV1FCd2xJM3crOGp3ZG9odU5RckZnRHFYUGpIbGIrM2xmeVN6QnhDN3Rk?=
 =?utf-8?B?L1NGTnluL3Qzamw2Tkh5YnBvSGZZWXlJbk4wSG1NT20zcThscTliQ3ZOV3Jj?=
 =?utf-8?B?OTgyM2d4MXh3VDBlSjRCQjhrYzJOYXhIOHBqankzVUhDaXU1MUpaelpWSWI0?=
 =?utf-8?B?dWlWWFFxelZDeWVjWk9aSDBJZERJbzJuQWFobEx0bmVQS3N4eTNOQVViR2tU?=
 =?utf-8?B?bTdTOWFxVnJ5YUxvN083bDFaallveWJBZDFGU2U5R21wV2sySWRGQlVGN3Bw?=
 =?utf-8?B?VjA4UzFrWU5OMTJEcWhGVExBOUxnSEVGdHJCa1psa2ttK29iaWEyaklRcU4y?=
 =?utf-8?B?aWRId254bFB5OEhTM3dtbjFsRENRN2tCK05INUdtU29vVW5VQ3BIZmNvWjRF?=
 =?utf-8?B?QjBVWlAxUk1iWHB3aWQvV01vaXVGNGs0bG42emZhZ2ozUng5UHRkQTJZYVRF?=
 =?utf-8?B?eTY3eHQ5Tkxoa1F6NGtxM3ovaEJZQm1aNyt4ZWp2dXMwbDJ0bzAzNW03SU5M?=
 =?utf-8?B?dVJObzFHcEs5em9zWkpuc0tBVnFnSU5pc0ZQT3lleXFGdU1hVXUzRHh2Yktn?=
 =?utf-8?B?WHhOZU1UcW5OM004UFlxelZPTXorQWpucFVCQW9wRkg1NlFoZFdER1hrKzhC?=
 =?utf-8?B?UzFmMDR3ZVJpVzZoN0pMOHIrcGpTMnpEZlRGNUhUYXJ4bkRJRVVsY21EdHJR?=
 =?utf-8?B?c21mMG11V3dPbEpmQWZXdzJqN3JZVEk1ZkNrWFFiVEtkdFhtZ1prNVQ0WVEv?=
 =?utf-8?B?RVVwQ1NDczdWM1pOTnZNZUF4WmRUSlhWeWJTR2JZbTZ2cncxdnRmQ3dSVndn?=
 =?utf-8?B?TkxPSm80R2k3UFdtc0UyYitmdUUwcnI0OVVuVW9nWFI5Y1R3V20wZFVkaERh?=
 =?utf-8?B?NzlSdUJVUTdJQi9DL29YQSsyNUtad2ZIRWhuR0xBZDJKV2ZmK2hvWXJpL3Ri?=
 =?utf-8?B?Q0IrbkVHbnR2S2RMVysvT2ZXa2FnbjhtaGFSQ2RHbzZVUUg4WC9zR2I5MG1u?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UzSR/JwqHyWSfdt3XmxhSFVw41C4J8frxiBtQljfcwT2yjAtv9jGvPtOh1f20NH0w28iz6Y0WjBnrn1J7EQyhqrOmTQfavKkr9URvSH3fmq0ZBgebtKO13S2MjcWFFnN98jpvpfa5FBTgGAUXZaQRaWGX1LTjsFAuLzjsEc67R7sZbXbW6IjBqCfZhZ2eay/AEWidEmt4ECp4edIJJVsVeP/s3/Xnar+10MsmRnElbi3DEEkCmb/0HRKuZIwJqtDdx/a6umyZnrvhpIK/ixfFN+hg7tAx2h7OOn2ftx2d1XkKn/DpOx4WGSajPotHFUNtzOuW0gMV5+asCafnkA9FUVfanT+Q5sI6jpwKCej6by6vPnQZLJgTVpHE/mS5Yb8a0HDUkifR51XBYHIliJmlQx2drXvUIB75wn8+Kb/o9SrBHGyYdYI7e9K3QwzAvhfZBNgCnOpTnNj7b6Yuf28AEZMcyYBck/oSShjqfHLVR4blg62wRGMduzdIxNj8qZaPnXObpeErkz5C5BtJS9Am6AwYZXos/+S8SxVj5tKTfIfRlT+SlNmAACggFqXgBF2PhpgnPgS++5LEro+NktpLGx1wk5jxzfEzz9bHaqs6UMnLZ/TXTFFXjrTx5QTDrPwSPADKdic+dzmLB+u7QEm8Sn8vYq/WgB4SE1s/9UPAzOT+ZBFs+oJt/9VBlIQkqHocKlrlo2JsT9G5fONi6Uvm3up67D8VlS0eU+ovSWE2o7sro52vPs80K8QL96Jhve0DcKNnjFWNiwwox6rTwCGqmeGufrhbpRQDLARr5VbKxd3Zp2u13fZM16bAU0ZS5zQya0HH5XVhTw7nR1hz6oixAVWRHVyf/TS2XNaT5xIaik=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284f86f0-96a7-4a15-9195-08db3f51e3b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 14:41:55.0134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ngoeb0k84XwvN1l/kt2q26cjngm6pCkyKCUwPOjww+RLakJ6VdSZh8y8VTl8P0EIAydmwHihnt/sS/zzNmqoF6JJgmhXpxiJnXQa38zB8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7196

On 17/04/2023 2:59 pm, Jan Beulich wrote:
> On 17.04.2023 15:52, Andrew Cooper wrote:
>> Right now, trying to apply a livepatch on any system with CET shstk (AMD Zen3
>> or later, Intel Tiger Lake or Sapphire Rapids and later) fails as follows:
>>
>>   (XEN) livepatch: lp: Verifying enabled expectations for all functions
>>   (XEN) common/livepatch.c:1591: livepatch: lp: timeout is 30000000ns
>>   (XEN) common/livepatch.c:1703: livepatch: lp: CPU28 - IPIing the other 127 CPUs
>>   (XEN) livepatch: lp: Applying 1 functions
>>   (XEN) hi_func: Hi! (called 1 times)
>>   (XEN) Hook executing.
>>   (XEN) Assertion 'local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu))' failed at arch/x86/smp.c:265
>>   (XEN) *** DOUBLE FAULT ***
>>   <many double faults>
>>
>> The assertion failure is from a global (system wide) TLB flush initiated by
>> modify_xen_mappings().  I'm not entirely sure when this broke, and I'm not
>> sure exactly what causes the #DF's, but it doesn't really matter either
>> because they highlight a latent bug that I'd overlooked with the CET-SS vs
>> patching work the first place.
>>
>> While we're careful to arrange for the patching CPU to avoid encountering
>> non-shstk memory with transient shstk perms, other CPUs can pick these
>> mappings up too if they need to re-walk for uarch reasons.
>>
>> Another bug is that for livepatching, we only disable CET if shadow stacks are
>> in use.  Running on Intel CET systems when Xen is only using CET-IBT will
>> crash in arch_livepatch_quiesce() when trying to clear CR0.WP with CR4.CET
>> still active.
>>
>> Also, we never went and cleared the dirty bits on .rodata.  This would
>> matter (for the same reason it matters on .text - it becomes a valid target
>> for WRSS), but we never actually patch .rodata anyway.
>>
>> Therefore rework how we do patching for both alternatives and livepatches.
>>
>> Introduce modify_xen_mappings_lite() with a purpose similar to
>> modify_xen_mappings(), but stripped down to the bare minimum as it's used in
>> weird contexts.  Leave all complexity to the caller to handle.
>>
>> Instead of patching by clearing CR0.WP (and having to jump through some
>> fragile hoops to disable CET in order to do this), just transiently relax the
>> permissions on .text via l2_identmap[].
>>
>> Note that neither alternatives nor livepatching edit .rodata, so we don't need
>> to relax those permissions at this juncture.
>>
>> The perms are relaxed globally, but is safe enough.  Alternatives run before
>> we boot APs, and Livepatching runs in a quiesced state where the other CPUs
>> are not doing anything interesting.
>>
>> This approach is far more robust.
>>
>> Fixes: 48cdc15a424f ("x86/alternatives: Clear CR4.CET when clearing CR0.WP")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> One further remark, though:
>
>> @@ -5879,6 +5880,73 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>  }
>>  
>> +/*
>> + * Similar to modify_xen_mappings(), but used by the alternatives and
>> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
>> + * responsibility of the caller, and *MUST* not be introduced here.
>> + *
>> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>> + * Must be called with present flags, and over present mappings.
>> + * Must be called on leaf page boundaries.
> This last sentence, while wording-wise correct, could do with making more
> explicit that it is the caller's responsibility to know whether large page
> mappings are in use, due to ...

The meaning here is really "this doesn't shatter superpages", and this
was the most concise I could come up with.

Would ", i.e. won't shatter 2M pages." as a clarification work?

~Andrew

