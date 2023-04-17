Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA36E4211
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 10:06:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521818.810728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJst-00031V-O7; Mon, 17 Apr 2023 08:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521818.810728; Mon, 17 Apr 2023 08:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJst-0002y6-L2; Mon, 17 Apr 2023 08:06:47 +0000
Received: by outflank-mailman (input) for mailman id 521818;
 Mon, 17 Apr 2023 08:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poJss-0002WH-2j
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 08:06:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c918e2f7-dcf6-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 10:06:42 +0200 (CEST)
Received: from mail-dm6nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 04:06:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6237.namprd03.prod.outlook.com (2603:10b6:a03:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 08:06:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 08:06:38 +0000
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
X-Inumbo-ID: c918e2f7-dcf6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681718803;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OUke1WhuNpdKg04sRkmMFR77LiGMnXi3wD+oAOhT3HY=;
  b=bK9fNrR7UAH3saW6uPQXTIQL82XezP9idyX4LChymGKecrqv+w5/EmJb
   /+9lwI4HcfHTYi6Jqvu3zqrxPe8v211IrQShhwDrULTZTHgYnsxPxZwJt
   ++hPjGDZ5tPGLzuNCZYeEfec53+oZbvTG8x97B6D2bpPC59fgXX8G7ZAq
   c=;
X-IronPort-RemoteIP: 104.47.73.44
X-IronPort-MID: 105674623
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZrWSFqL+aqEHnuOeFE+R85QlxSXFcZb7ZxGr2PjKsXjdYENS1zcGz
 WNJUTiDa/jeajf0f9l0ao238U8EvcKGm98yTlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gVgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4rAHl/5
 /dABAxcNA64q/i22ZaSFbJV05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSPpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxX6lB95MTubQGvhCp3qz3jcdEQUvZAGXh9Ccu0uyBo14E
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAcAvd/qpdlvigqVFoo/VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTygbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:dzHrA67YtZ8xgtD1BwPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: =?us-ascii?q?9a23=3AKTR2kGnSIif9+qQilfO6G6pFa+TXOSHc1EbCKBe?=
 =?us-ascii?q?UNTczVoa5U1+J3Io7yPM7zg=3D=3D?=
X-Talos-MUID: 9a23:Sy9OQAukxMFBzPogf82noxZCLJxm+ryXORoht7wjisyIaHNXAmLI
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="105674623"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2ZOC/z08FGJ546JAlCk9EJsTYfSmSH7veEm4xeUWgQewceODDdwRd0LOzkebyBHiY8jPs1f8myD+fw0ptGJRwl/KNZOXo9Wn5GYm+j95Jyf3BIOXW+roQaLrD5+PHpvnBzbVbCefD2+BGfpfRV7vt+2KyPgD4hc2tEUywCIv35PCrMt3foP+NXlb8RCtGeyGvp/9EL6SQelkNTYpigfWjKzIAUY+dbcDMCTfNzy54cBHLy7+TK9Hq8KJXM0CahqFEefeShjY5Nr3gC5igAC9FEO8Un0OtanBwa7HucNHC04UPriQ3ymyCKeIvFUaC2HU66S5B9Iy9ZJ7L9bLwvHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUke1WhuNpdKg04sRkmMFR77LiGMnXi3wD+oAOhT3HY=;
 b=jatGBhXujNrIUwwGgtZaxvznLfZZ6uPZdgtWSnx+b1QO7jVf78Wnmc0PSZ8TgkYZB6uQnpZ+XZXrDYuq6naJY8qFLToqtaMp5SVlzMNssbRzlr8nm1oNO6onS2UGBjf+DILl0xQ9XfzaKKPVYZLP3KD3s1jmV3IB6uAfd+gbwmUjJZSlSg5rOi47Pg/7s7bx2RGBi5dgONbBlwUJzxuX0z1Z4nejq2FxB96HXkSTQQRVlitCO2FBIATu85RkaJEM8k9KJ/cMbr5BGlIXq3S/qSQt4vI7Y+ZVgqHsGptR3ExfJlmDB/atHPv43QLHDkV6yyoZS6RhZtSCDCNhuyR/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUke1WhuNpdKg04sRkmMFR77LiGMnXi3wD+oAOhT3HY=;
 b=DfqKQovGT6qcdFTuf56AHF8pfLW3E0xdD8EQcxGtQAIqsOfONIJHTSNzkCxNR9bEemUhE500BnRK5mB4SE8C30D9eIY51vPdnZj2pjlkQiAQu2T8+HDvMt21nluY4HrpijfImahsN4qpgLC7M8ns257u2vEaWsgcchDSdcdCz0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <08aea229-4b84-df51-715d-5ce6a0151023@citrix.com>
Date: Mon, 17 Apr 2023 09:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: switch split-off files to SPDX
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <b7f3c088-2b80-b965-f307-4a31d72eb89c@suse.com>
In-Reply-To: <b7f3c088-2b80-b965-f307-4a31d72eb89c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: adbd9509-f8f0-4cc5-6db3-08db3f1aab4e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dUZVE3GRTbXOcs5eneZneS5zReMAWP/z9ARmYGP7u1gTYALuonUJ1EKRxs5uu4LWDnXJ1RSIkFZYtUQItK4y///uaI9HPr3Yf393zeXX8pMxJY00UnX9t9Kl4x4kplXnPZxUHw8D9PXfT2Is6pPkM69G03J7StiIusZ5D9JMTYlHgWUN0+nGqb/pwwz7kAZt9Eh9HXesdxTl35HJpVGZ8cmBlTxmwMEVPqyohSRUB/+m6y2dvxLjuEA14iPzdr2/awax6Pqq6ovBpAYZH/RIGNb2k+AYSaK8cXilZMZVnaZPV0Ij687s8ahSMQsFSDjm0xzyiToNgEAj/lu7lUdlKSTyeM/2BEiOyLt4DV2RhK/yPs9VkHP06wQaxsSR9Dl9n1iUmQTMu/8J2DhdkPoCkzmEJULoyE3qnQS+51wU1rkyFr7Nt6PWVLFHViGtOmdb5+p673jZq7pOa4TokhUq0gZMQeNKjD8VbjLsabq0w8TuxnidhWzSWCLbQQGYzWZpZWeGmE7oOOdh/YcjVSv1kbdkvPkgLXdH+DTGsEgxyuTuHLy0NqJ4D3utws2+5hc265cVMnIPrnvRaE0yiD9Oh/L9hTYERi8F08UDloOUG/fBZYu/4S7VJYl7svFGHzQvlluzoom1wicagVC4ihBrbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(6486002)(6666004)(86362001)(478600001)(31696002)(110136005)(2616005)(36756003)(26005)(107886003)(6506007)(186003)(53546011)(6512007)(82960400001)(38100700002)(66946007)(66476007)(66556008)(4744005)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUpuQSt5emVWU2dpd2dlQkJOK3hZUVlpb0ZGbDJ0a2Y4Q0dsdkdGRVJBa3po?=
 =?utf-8?B?cmIvdTBRdEt0UmNGb2EzdklTOG92SWlITWhJY2wycnRoYnBpejZ5RkJaLy9M?=
 =?utf-8?B?aThWQXN0ajBZd2dBbk5pWE1JaVcwc2tRclU5N1A0UUtNMkpQVzdsTnNFYVNr?=
 =?utf-8?B?ZzhEV0pQaE1xcHpsSkY3V0t6RFVCU3Btb3ZwdnpFdHhaWTFwcWhsTThZMzc4?=
 =?utf-8?B?c0toc0FOUzY0QytJbVhiTmlBbkJQS2pMWFp0WmRqTmJVN3NubVJtR0laaHJp?=
 =?utf-8?B?Z28weHMxVnpwQmxYSlpFTUdEK0lzblMrVEY4MDRFUXZQQ0dBR0U5QnRyYlYv?=
 =?utf-8?B?T3E5YnVEa3JZWjA4YjFqYjA4TWRqWGZibkpoUDJub3h1MU9DR2hwVEJLZXdz?=
 =?utf-8?B?aXBSUmdwVlZtbERuczJLemVySGhTSktxQ1ZBTjc3ZzNnVGlmdlZJQm0wTTFF?=
 =?utf-8?B?K094clNxSmdPb0NDaStiRVJLR2NIY3RJT0tTTnBaRmlKM09MeTRxZWlCdktu?=
 =?utf-8?B?N3ZZQWduSDR6WFF4Y2JsbzAvQnNZYXVOSndnZ2lpQWJZRXNKeXdoYnlSbUgx?=
 =?utf-8?B?a0g1bFdHN1h5UzBUR21qM09qeDR1OGR4bzBPYXlpSE1DRnZQKzZ6dXdJaUlz?=
 =?utf-8?B?ZXI0Q1MrU3FlUzl3Mk1PRWpIMjlHQW9OUEc0dVUwRVAvMzRiTGJrZmNhUm5a?=
 =?utf-8?B?dFMyWnRPSVZ6NVlLaFdhS01qanBaT2NRVUkvNkFlTEdlTU9TZ1R4SmtCU3dq?=
 =?utf-8?B?VE9zYUlsZnplNzEzcWtyRUU3VGpmV0RucXhEaGZwSkprVGhxSDFjRE9ZbmFX?=
 =?utf-8?B?SCtOc1YxeG10NUY4UmRZdHNvOEsrVXEyazZKT0J0NDN3M29ZRElQVHFyeTJI?=
 =?utf-8?B?TlZNMlplQld4OHQvWTRVcnJ0cmt1WU1GenNnOGgrc0dhUW1ic1crcXhRREZm?=
 =?utf-8?B?RVczZWVlT3dJRUVqVlZRL3VRbitKdXBJYXNlWlV2RndTRmIzWmExUWhvU0Nr?=
 =?utf-8?B?SVpqZXdJaDZjdDIvSGRXdkgzQ2FCRDdzcldBaWN6cjVOckdXU2pnYkQvOXJw?=
 =?utf-8?B?cDQvNnpQYXRiN1hhMGhvTkdKMXBGSlF2bGxMYzVRdEtBNktodHQxdms5TWpZ?=
 =?utf-8?B?a1VsU2lEQWY3LzRGYWFnRDAyYUc5TTE1SDA3VTBGZWIwWkVXNTdaRlh5cjJX?=
 =?utf-8?B?Tisvdi9vTUZMTUN4d05YL1UzenduYmFHT3M5b25uZG1BcG1Qd2FES08yL2Zp?=
 =?utf-8?B?LzhyZCt3RGdDQ2l4eGtsbFYrc1ZvSWRxS1VrSTZiN2RDV20wWk9OS25uakt5?=
 =?utf-8?B?bitQa3NHa1lKOTE2Qkw2MkRSMkdzUlVrUzJBblRMQkRqNlpBN29EYnNsSXFx?=
 =?utf-8?B?VjUvekI5Rkh5UlVUSE1wZ0Jkc3NrMllnUnVoWTRBYktRWTlNek9HOGNwb1J1?=
 =?utf-8?B?T2Z0ZEE5VnJ6T1JhNGd2ZGRtSEhEUzIybUJuU1Y3djBDUHEwaWl6NVU3MHZy?=
 =?utf-8?B?c0QyR1FxWDBrNnJLQTkxc0RnVGQyMXYxT2V2dlQ4TEFOUTQyYTlwMmYrOEl0?=
 =?utf-8?B?RzVNMXJrU25pclVQbm1kaUdaWnNFa3YxVkovQmpOdWlSUHMwVGZpYldOaEdU?=
 =?utf-8?B?blRNQVVPd0FLVU00WmtZb2kzcHJYWmVWM1dNUHFBc3RyY1ByM29pMExFMUJv?=
 =?utf-8?B?cGIrZklZbTdpR0EyWVF3ejRFcnlkWC9Mck92NWtsNmRzV0NiWkdFTUtocmxh?=
 =?utf-8?B?Z2REL09DYTFJLzh1ZWdGQTJRZ2sxUjNQOHY4aGM2MEV2NE95YTMwRFVHbytY?=
 =?utf-8?B?RnRmNUxXeVcxTzgzRHU3Z1F5MHFIbE5wbmJVanBUekxyZUN4em9kVk8vYVdC?=
 =?utf-8?B?YkFTUHU2dTdMbFRaNnVJNlNxQzg2TkVObzVMajBXV2hreTFaUk4vN29TcGdZ?=
 =?utf-8?B?eDVzOUhVdis5YkFFVWo2UUtUQmNTQUNubnNSaUw2OXFsOVI0cEhBU0l2VlBx?=
 =?utf-8?B?VHdlUmpZUlNiVVVsT1ZhQ1MrZlFJd3BaMGJsNVNOcVpoenF3ZzhyaUd3dDZT?=
 =?utf-8?B?RWZ0VkZ1T0tJRjZKem82cjdYcytKa2N5aGlNalNmeG1UTXpVdEpBb0sxR1lS?=
 =?utf-8?B?UEJ6Y0hMcGpUakNFUzlQS2tja3EyUEZjdmNMUnN2VjhyWGFPWkgyUzYxWWdq?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ipkZcEImawqUBT6EocKcHHHtARvGOkVUjnI13HScZv4n/z7CMZISfvz5bpKRECMeMV6LQtAdesoQwSPeRYBtP6NM9KDy2EXbRAqU28VFatDIY+8HvNNZQ78fEpn3OLLCIBqAZyCpw6m4MvFa67QEyyYCaa9N1cu38CdqOYzbSbpIOYVL4brL258DrWThYQnPWCqMtypQCwhf1T3asRpMJsquv73iahzgKFLuUSqgeyI5iIObHUeeGRaNdbXamrD8R8VoQqpV/KzZ0Zr2PJN8Ds5njF5HWk1QSf4Oe61jto6rZEM+SzEfX1cD9pnJ/2hk2DTeJWl5v1Vd01cAwtt+HZpR3iqoMN0qeeddbK8jnpWOPsLVOxQAd7/TE/Z3kADZpBb6A3HQdcV96W5kB8qCy5opmEjPQGLzfK4MWtGQte/8eFaGOf0CoT0vTLgriiNQWl9GuVVBML/tYlh6OAS4UtbO0euEkBnfxq8C1bFedNonCApKmUpucfp3+Io7u+h++btv0sBdxAcAb5MRGprvy/BaHScybowvhoO0CJm+YQGtI2pbz0ITsTtirW+VffafPd5AuxaVZ6cdErgHmRPjkJnzgk1Dnfe8Ua+lIz5CkhjLfdcdfnAQruceBj5JSAzRvuWmpIUUNd9e49aN31rDaAwnDykyoMl7hdIYvLLY9i4C2xLOuxkCqJLDsmzq4sfLvq9RiDM8or6xnpCAsD4oSKwGNipUnFu0kbk3i1EUkJ58gpvIveD3UbfIalXwgZrDQvt7/NxrNus6iN+zfkfMROcltCKYSJimDiWew+cY26SClrImA9xpy18SeKLAM5YF
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbd9509-f8f0-4cc5-6db3-08db3f1aab4e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 08:06:38.2514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2Ift48F7wSdj4AK5Svv7+80RSIVWTxri97yjG0HdUagGXy9oTh3zbLAOxObhm864IRE5UoZAuBVrMeP/PAZzGlExZEbByN7dwoE+socJXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6237

On 17/04/2023 8:56 am, Jan Beulich wrote:
> I should have remembered to adjust the splitting patches accordingly,
> but I forgot. While making the adjustment also correct fpu.c's first
> comment line.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

