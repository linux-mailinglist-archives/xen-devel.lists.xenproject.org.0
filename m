Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B5743C4B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 14:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557473.870829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFDgd-0002dA-1W; Fri, 30 Jun 2023 12:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557473.870829; Fri, 30 Jun 2023 12:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFDgc-0002bF-Uo; Fri, 30 Jun 2023 12:57:18 +0000
Received: by outflank-mailman (input) for mailman id 557473;
 Fri, 30 Jun 2023 12:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFDgb-0002b9-Q4
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 12:57:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e79bc5-1745-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 14:57:14 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 08:57:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6984.namprd03.prod.outlook.com (2603:10b6:303:1cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 12:57:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 12:57:08 +0000
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
X-Inumbo-ID: a1e79bc5-1745-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688129835;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OvQyzouAcbWCbWPG8rr54QMvT9WvRRMyZsc98WjFizI=;
  b=VEkwp5g0RhdE+LmxlMncSPEQcwC3NWbYmnxIGdf9bLMkKJuLrqoacArj
   6qVw3gTbz5WlPsTPzdAxgcQ1ESRJId7SKb6n0Uh9w+uXm9b510o3pg2c4
   x1BVxzosNAyf+etMFyBr+31kAKAoVVww2C3gb+n/KmQIiWpMMXYl7idCz
   E=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 114049141
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gupfTKs2/XnpNMCmfspKfG4Sv+fnVI9fMUV32f8akzHdYApBsoF/q
 tZmKTiHPPiPamLwL90iboSwp00AupKAx9NgTwc5qy09Fygb+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5AGFzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwARIEajmCgrqNzOipeLc2u9kcHsbpBdZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xaLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTkrqI72QHKroAVIA0zVkCymNq9s2uBCsgPA
 WIawiUr6qdnoSRHSfG4BXVUukWssRMbQdVdVeEn7gWE0oLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj/6em+VHKhRq8q56PSRQ6jjg7RUqg5wJ9IYu6PYqh7AGB6e4adNrBCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:D/oJU6Og7uaADcBcTtCjsMiBIKoaSvp037BL7S1MoHluGaalfq
 +V7ZcmPGDP+VQssR0b9+xoW5PtfZq/z/5ICOAqVN+ftWLd11dAQrsC0WLq+UyEJxHD
X-Talos-CUID: =?us-ascii?q?9a23=3AulQASGmkTPI8ckMdtkZ4hsfEuynXOVT/xXP5Ikr?=
 =?us-ascii?q?gMmozWo/LE2KNx5FrkfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AiWzvZw8sxfwRZrTnRxcCheWQf9dN4L+nMWMJqLA?=
 =?us-ascii?q?56tPUHwJ+AziYyzviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,170,1684814400"; 
   d="scan'208";a="114049141"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzuDzJxqitlVwOqncwDrnB63WmpS8YZi9iZyygoTGyCdas+/CntUttWVLgvsidvWaSTv26bbj5i6btp5XmhBH66k9YmUVv3hTiD6/YMWHG9gSmsIHUbwMpZUXDhOL0uHAYrhfuCgHFePuaQ4aXji6iXGsPszEJZukLMHKdOG4B05WzQNGONz7T3SAWY62UAmtV9pEmDNtM163YSl2Q7CbKvovdfeQGjLQozVvQ19sG+oWoKFcWpRbRaI2M3LiqMV/oH8UiG4ma8FKsrn1cahuUvHvbbS+zttpULeU6Fl/r69Bw3RWwWfFUhXgjH2MBXEeYKNow+BPq/iNT3F2xom2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvQyzouAcbWCbWPG8rr54QMvT9WvRRMyZsc98WjFizI=;
 b=IKXDplO9waZhRZ0c+zhtGOUK1pG/EeVOc1VMm8raCPH0/iVLqzbEDDHWhd1lUOrrhV0HKSlq++P1JYP4B68D/Qautihv/FQeGl/NVux40ZINftWnxaEvTTebyeNNSBktSCD1u11DM9GtV/L434or7f/3jzVQ0PU1Q9wvW5psjWIPpZVqd/FB2m3V6HF56xGbmWDTmOTmJTyuBGhx/R04DJ9pChm/KoDlHJhw+gwdh5WiTy3EtX6PHp9ANnDXPr3CY/JMiUokj312N0oqyiI3DR+dvAn8Rke+btfEnSc+3UtVUl6lgK6vAk+dE0BfRwpjpWCLpMe9qZoVXo183ezdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvQyzouAcbWCbWPG8rr54QMvT9WvRRMyZsc98WjFizI=;
 b=YH7hJOH2Ue26iPKNs7mkO6eiVaR3+PsHMr4L5QqLPXuAI/AxXFbOhMHmzLyZySRiA7f/s5gsxRfwUr7w8j8x7KvxMNvsfMI2NEBBz5aFeWkRmGevSI8leJRtL+mkRaTosGy0c9wd+yNKzYiAmiEKR+k7raKIpCiZJ6B55teWJfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <35b638ae-782e-f0e0-3962-2936f617b9e4@citrix.com>
Date: Fri, 30 Jun 2023 13:57:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] {x86,arm}/mm.c: Make populate_pt_range __init
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230630124509.730368-1-george.dunlap@cloud.com>
In-Reply-To: <20230630124509.730368-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 061885d6-2f05-4af8-1ce9-08db796982e2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	McCOxKYNrETl/fElnAK0kxxIpMfGrrjXyksnjmAjguCErImQ8ZPLM1lYJTypt9+ePk4lexUvXXFtVVTPL53K2Ogb4gyQ0QpSxQmS9elpP9pnwX6+Sgkw5oVjoeIJCeQCaEbk7P7QRJYyekBDwcgh65fy5LspyyUDWkYWCc/ws29HgNvKo7nfO7BMTu0jYct8EXVozqOCMSNsNWgSfnq3sYgx+EkmhYX7kx87FArvjrHP7PaiGDdEfzHUKLZHo0eUokPEoMwH4Xr34auYBtMLOew3L5c/JMmpnCtdgTTd6SuGxcSIUf17wsyIx3bhwQE+Wpdrhkk0aYFgaxgjePOi0O8NrtMEV24Qp3bkT4jJyckwuGmrscJwI2WSrsKkuXsxAdDv+q9MnMdAnt7AEZkF26tsWxgqDuB4nULDTdkbYXt/7vnFbZGNY74wlcofv539gtIOjTWJh1TV9ap+jJ4jIN7Rzf+t+n95aF44c6sP1LxceKWbWjgZ/dcU0ZmShMen7JiO9iboHMx+cPvdCHnDiOAaDXTP2vvAuQZNR0Mm1TGMeABgwOVNdRnHPUqEInCUbe2iiun0uzQD04MGtbVvDoHeO8lNFdxe0ru+bmEPi1iyIv399GaM9eP0nYxq7OC8p5phCifdEyK98eqEzwajVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(31686004)(86362001)(54906003)(8936002)(8676002)(5660300002)(31696002)(26005)(6506007)(53546011)(6486002)(478600001)(66946007)(66556008)(66476007)(4326008)(6512007)(41300700001)(316002)(6666004)(186003)(2616005)(2906002)(4744005)(36756003)(82960400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTR5dmx3S25iNlVKK2V6YllpbE45OEthSXRCL2JLZi9JUzVZM1UwdURENlJj?=
 =?utf-8?B?RmhQS0VQR0pNcTFDMUhhTGg2M2FVQ3d2RE5yWlFFbjUvNWcrV1QzZ2ZUTThW?=
 =?utf-8?B?RFpJU3gxb1cxdGlpUHRKVTRudVUxVHJmcDBPcWFBZmRpcHVoVHdzVnpWbDZB?=
 =?utf-8?B?MkJlSTVXdUxleVZBYjcrMHAzM0NDMkNzQkZKc1h5d2FlMUxjOGY4c09lSDNU?=
 =?utf-8?B?QVpScVJMT3ovOU5oS043VmUwQVpHRHNvWkhFOFBZZnAzeVRNQUF6ZUZvWkpx?=
 =?utf-8?B?bWk2Wkt2dDFkcjZJUmJyVDVhL3o1K1hjTU5nNVJNdjhjNmF1MVprNnJyVnlF?=
 =?utf-8?B?MjVCV3NHb3NWTUJ3K3RabGgxZFhyOWRqM3VIdU5oUTNjUFA3RzZhL0dDdDlt?=
 =?utf-8?B?Z1MvVkJKM2tsVHRxUWlYcGtVVmNnc1MwaGN6NWkxVFdXUEZFN2RRNHZTdVdU?=
 =?utf-8?B?UDZqZWo1b1o3b1FmR3NvMTBKeko3Vk5TZGJUZW9qc01oRGNVOFkyYmRxZWpG?=
 =?utf-8?B?YjhPL0p6OFc1RndGWHZqNUVXS3Fqc3BSbmNPNURuZ3Q4UzFaTW9TSlp5bG14?=
 =?utf-8?B?alpCek5XNld3bVhCaEdrSGQvWEFaWExIOTN3WXA4V3BGWVJibVZHR3BFeno2?=
 =?utf-8?B?azJ4OERxZ3FyMkFNM0xMWTkxTWcxWmM4TU01U1VTWE15TzVuOGhvQVRvVHBI?=
 =?utf-8?B?S1hVWWNpa0tQREpvMXN2cE9jcE4yU0MrVWh5QkNtLzVtbm5Ga0ZzYTNtd1pX?=
 =?utf-8?B?QnFwd3dVVUhRd09qYm1FYlpCcW1hZEtzcFZWTERmU3F2L1RERTY3ZGZVY2d6?=
 =?utf-8?B?eTdnTWpqT2VMa3lLcFFrRjdrWmgybEtNZGRDYUFacmpJd3NtdWJzSkkwTVFj?=
 =?utf-8?B?RGR2aWdFOE83TGZRRWRZdEdvem1FdEE5WHNSZldQaldkYXZXZmFGaEJkUTUy?=
 =?utf-8?B?UnZESjVHTDcxNmpBZmRlTXpvR0pRcXdzcjJpa2VFd0dEczVnRHlMdjk0aFNI?=
 =?utf-8?B?S2pKbjBkRFczVG15c1NDMW9tNXhCaS9BU2pjT1RYaTFyVlJuYmJPYUhTbUcw?=
 =?utf-8?B?UHBrRWNQYlQ5UWlkYU9EWi9SdXVaUW94enBpcHJRQ2NpOThRKzFsU24zTGlP?=
 =?utf-8?B?SUVZbHU3dWcxaFEvS1htSHdxTVVjMVhOTWRocnE5SGQ2TzhXT3lPKzEvVWx1?=
 =?utf-8?B?T2dKb2tYWEMxS3c1YmhMWlFUNWNLVlBVaVpnbHhnbGxiVnNXSkhTRHZOOWd3?=
 =?utf-8?B?cHpQL0kyeDlZOTV5UFVaQVRqdHZTRk9VcUQ5TndvclFkaEhCaW15MHdPaURP?=
 =?utf-8?B?RmpSYVFtSFExSWp6RFhzNzV6RmFOU3RBWW5aWGxVNERCcFhld1hTTVFvcFdu?=
 =?utf-8?B?N0xHWU1qejdabGVabGp6dkFaK21aSGdlRlFXNEppcE5nRjRLUU9idkJJbUVR?=
 =?utf-8?B?Q3lqaVkwRnFqODluVjgwNEVhWG9xcng5QklrUjdJRTlsN3J0aC9FRkdWRlh6?=
 =?utf-8?B?YStncmJzTTRZbDY4dXdmRGNVYk5uejhiTzdyWEtJT0J6bVdNNC9vK1dadld4?=
 =?utf-8?B?ZTdCRHRJUmhtc2puSUxHQ3dNQ2NyZ3RiVDFLNFBhUkd0L1RmQnkyTjV3L0p3?=
 =?utf-8?B?WDRxUklLQjl0bUNMNlcvd0pZN3hlLzNGK1pEYXVWL2lLZk9peTlNcll6aW9S?=
 =?utf-8?B?VmNTZ3ZkeXUzcWg2U2NmZ2hsS1E4YWJPbGtON0VSYWhjdCtmRzhNbnMzK1d1?=
 =?utf-8?B?VEZPNS93d21NRkkrNTk3b3dnSFZuczN4Q1h1OHR4dVFtNFd1WVMvREp3c0ti?=
 =?utf-8?B?UkxjNWR4aTBxNE41bnBsdjB4ditSUUJEYWcxOTZlMXRtK2ZSNGJZck51aGp4?=
 =?utf-8?B?U0NXTkJrUHpaUnY0RWZ2bzBjZ0p6YkJWRjFIVko1bjZ4MGd2WXlzbENvQ2Vl?=
 =?utf-8?B?U0RmcStXcTRIWkVXMHo0Rlp3WlhhTXhSTUlZN241eFg0NVhIeUJjZkl4WmxW?=
 =?utf-8?B?dHhKVkdFQ3czK3FKQ0dzNXp5d0RKbndiUE9Qa3Z2UFlBVnQ5MWJQTEZBSzV1?=
 =?utf-8?B?TUFlSFR3L0NQWTNIZ1lvbldNTGdhb1pMS1hLU0FoSm04Y3JZb2hjaUVYUjQv?=
 =?utf-8?B?VnJtbWZoSEJZVU1oV0hhZzdkNDhVTE9zMTBZbXo4L0YrRFAwSW5CblBHNm9r?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z77OQadCiOwQG+Oq3RjBWuHyjVTPLh0zd1pdMzAvSzcFArpHvMqDywLmy9QxhUOyKyRe87vuAQ6TcJVF+JpXJj8KqoKchsuN+nNwc1do88o75Nfgy4huOeodGFRq6Yh5eeGvr6ZHboz3wGqy2Y59M9WYUWIPfN3JpmOB/rO/HCINbM65Hdw9gzW7zOYIzj4nApcTWq9LnMsDWSxKOkgSr+aWjhiXnS7DqMGyrP5azhqeGQk+35398CyMjGeTI6Qhmnb711q9MKgSdMFhOqHnXkBoepFH5cTiT+cpa31/K13rdDWUTK8yXfQ1f91uHz5o4I+FBb/a36desrHSOA6UBOjamFMMeOKCy6oXIyeRdjAngJpv/zcgLcvC5bsXehtNZhWDCDK8/HAbwxPVqFXSRIErRDdixpPGjELofCSYKvsSfVS9hR0SKeCbwu8K8NtAlh3yUd1e8ZvtFQfKBUpCe5/0BYwtHHN3ivUiI+EOJpL7wUVKu58MqXjHfSjZ/jjmmg4axO21wNVGOD7mrxW8SA/6SE24RTBcFUTuAsm0AN1DTdXNa0o/QVeo+6yGJvalSfK+OnvxiRJiSsb2tggCP+w55PAuv36GOrHfU3eg9fkV4b6++qb05gft8PO2oHBqrVHQC66yBTZvY3BvGbnpQuPQyXPL2F7tJ6P1hoENDyaCgZvkODAYyAEKbilIh3EWRAUEZgPd6JMWqBwG3VQEekjY8d7qQdKkv8Chcxrghr3kO73oljC+4RfyKJR6YZhLvEULsjPOe7XWJbGAI4KdbtK7A3J/2b1GOhxFNzDblJD22GvUKSsEr4bBZRftZ7es4D9Mem8i69bLB+apAXwAEjeHq+J5HPqf89gZL9maLfZ6HCVAaZseQlfWl98D0cjc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061885d6-2f05-4af8-1ce9-08db796982e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 12:57:08.1081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C3UDSDVJ6qXC6jS4XRHtpyJmpVm7uEgI3uSnzVmQOdcohzs5nikCgmhn0wmRCTFCuxxazx5X3gj8vbNdLBXCTyiz3C+loJCXcteeJie7bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6984

On 30/06/2023 1:45 pm, George Dunlap wrote:
> From: George Dunlap <george.dunlap@citrix.com>
>
> It's only called from another __init function.
>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> This is a random patch I found in a branch named "xsa345-post".

I have far too many branches like that...

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

