Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCA972CCEB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 19:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547399.854768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8lOC-0005Sp-3c; Mon, 12 Jun 2023 17:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547399.854768; Mon, 12 Jun 2023 17:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8lOC-0005Pt-0a; Mon, 12 Jun 2023 17:31:36 +0000
Received: by outflank-mailman (input) for mailman id 547399;
 Mon, 12 Jun 2023 17:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8lOA-0005Pk-8M
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 17:31:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7d56778-0946-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 19:31:32 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jun 2023 13:31:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5268.namprd03.prod.outlook.com (2603:10b6:a03:219::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Mon, 12 Jun
 2023 17:31:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 17:31:19 +0000
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
X-Inumbo-ID: f7d56778-0946-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686591092;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QnV3GNNVwDt2pCBuJIBGk4MLavgKO6NBMhBbVzbsKUU=;
  b=JuSSEKNF7vgWPYyfzauzPivLNfGH6twlOwKZu6fAPZ2wgAkqrtEVbaSG
   wFtNSgA0qAfMYlZqPDIJO6oOUUBBgrLaVm9n6uXQOPXWVblq+rTikS0hu
   vC+xFkMSKKsBIpmj/Cn/YJ72fqHnhTT0674MytsxsvtUDYz2UeVkHgd/+
   g=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 111826059
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8rbh9a0I8NzqsUWX1PbD5RNwkn2cJEfYwER7XKvMYLTBsI5bp2cEz
 mdLXT+Cb66LYGb1f40gPt7jo04AuMDQz9FmG1BrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJnP6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJ2oVy
 qwkMW80TyuBv+evw+KCaeN+v5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1UZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiAdJISuXlp5aGhnWW+nVKM0c7DmeEsMaXo3ehWN9fF
 0sbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLd5wubD24IVDkHdtUisMI0QhQh0
 liUk5XiAjkHmKKRYWKQ8PGTtzzaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yuiqSE/g/AZi54N3qDip1Tf2Wvz/97OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lQ9lFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:7mM40a4oZ3MHkUpPKwPXwMnXdLJyesId70hD6qkXc3Fom62j+/
 xG+c5w6faaslcssR0b6LW90YO7MBThHOdOkO0s1NSZPDUO2lHHEGgK1+KL/9SHIVycygc379
 YDT0ERMrLN5AhB5vrH3A==
X-Talos-CUID: 9a23:7yweVm6i7o6yrrxdjdss0kVPJZAZayLk7UzSG0qhCjZQa7eHcArF
X-Talos-MUID: =?us-ascii?q?9a23=3Av0b8Vw3It0IDOGokkYqVb339gTUj5pi3UXtXvM4?=
 =?us-ascii?q?6hNi7GwVJJDSQjAiwTdpy?=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="111826059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6L2OYD0mK4vQWHgekvT2tRgYlx6YHz6V71qk2iLWZW9+43VCwRbbooJSXfC17HCh0USvZkY/5qWquS6UY4xaEaNVsu9Phke4UUVRQ7SUvSDYPvDZoLgj9BpYWxleKgMDwFVehpO5RcWBEekgkojj3LAGjgl30AWEXMsP6y92BVh4PikFxEkXXMQm57U9EcE/e15J/uzgavi2+JVTM8YGiWwUYqs8nuZU6VCnjLYljfcB84a5F3xVJbr/GpxcqSYHTMDUGmxwJeqIHW83amlfJ6No9o34J2rQuGReeh67kgsmyocB7f+08xw874N6Otfs92WhgHAcnQeNWCS2S9cPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TS8ynNx8FLzja69ZFZyk0fGzx6gKqj7dS1MuKlAK+Ns=;
 b=Ur6zXII2v6B6Tb9f8HA/VaYC2Lc5+jpIU0r/lGRa8MINcy+xkoP0KxXdclKKnaeitpBmPQ7SdwdnSY9VKz/auhj0xfDkza13YEXqVgSWHOAIymeUe+TKWbHO533xemCSpFGie2wamRkRcI5R9HQXh0UsPl8E6XmimfrxtbIZRvg+Q4lFFi/t2eMaxfLrYUbz5WCt0vF+tQe5UZlVjDVvsWIJ+0XAnOLGyDUmWy1AM5oMghM1mUWiCQagkzqvheTEz9IGlgUwCqWB4Gu7KQXj1G2Z27RhZJJ19gZdAhQLVp4hIOwItrzWFUrAeDlp/hpZ32Yo2cm/gkT2id7KupX/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS8ynNx8FLzja69ZFZyk0fGzx6gKqj7dS1MuKlAK+Ns=;
 b=S9bbjSEFIlbrO7mKV0IYj11FagRFKjL2ihnkR57UbZAQ4eEaAMYosDfCVf5bUust7UGOVilJXZFB7FQ9ejB56c1OJ4kEdi15GMANTCpCMnWSwo7RYNlhniOxWOZ6vHMTn1mVdZCOPp2wKZui8OmAjCXz6ukVGgBe5JHaj+/Tsko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e8ef6274-1165-cee2-2718-542bd5218a05@citrix.com>
Date: Mon, 12 Jun 2023 18:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/4] x86/microcode: Remove Intel's family check on
 early_microcode_init()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-2-alejandro.vallejo@cloud.com>
 <711f2a44-7e2f-3e79-dd04-34a049210915@suse.com>
In-Reply-To: <711f2a44-7e2f-3e79-dd04-34a049210915@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0471.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: 259e6cd7-a057-44b9-7f0f-08db6b6ad54b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dHQngfpQSw4DmHS7NrlERQNq0dgvUdzAiDQ8c6TXcpD/QkP0TkvwoxqOjDWeDKd84gCsQ7H1wAO5dgqUTjD5C13gJskWjzeS26XBmg7GV7a++Epuvtw18NO6Hr+rZ4coUry7a4yZtJoTDOwv3FFH3vtv6YhbCoN6qNFsz/AzEiHqAWICl4eIdYbD3nkzu+XnkWMQQzYtJkzx7x3MNEzwfk4XNKPTb+cNC4y+EWO69LYKJdZndTM/cFOWtQJsyqnV2if7g5m4Gs15RzX/XgVYfnqmkSY/X/J4cJTRDohUln9Q+jZrsKP2xID1Z9uu2XvcqCrFpOkphAnv4SnWGa3gCSgID3f75fRI7uHW2BP7dL4ay8Ug5yZ8EU16l09m2HA8wQlYWLyUOufUMwHDXzJ2l8u2RlKR/Cfg08NUNk/WDetBPwobKvN981Q3MCUKzXODY46jAPGRGxKp6TSsWnrYG9GZjkQ2kOnDiSHyUqHr9O1xlAji6wC14uUd45A0V170iuDfTDAQOeT9T/HBvk8fxR0PXl/dc9i86TLvUGukRJezr8bLl67BVkz5ygHb0XlFjBJLn07VihXoKd37VV8x4L3gRna6OzwZohez+zqNpVK42XmehD4et4yzgWXD5B7aMAlwhxxm4Z46hcy8aVMsmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(31686004)(83380400001)(82960400001)(4326008)(36756003)(316002)(66476007)(66556008)(38100700002)(41300700001)(6506007)(26005)(6666004)(6512007)(53546011)(66946007)(2906002)(6486002)(86362001)(5660300002)(8936002)(8676002)(31696002)(110136005)(478600001)(54906003)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWIwWlc5ek1KTkpvT1pjeTFPczlVK2QrWkphSTlSamF2Mm16TTN2S1MxQ0h4?=
 =?utf-8?B?ajQyTlRSRWZIdGRDR1lVQXdSV1loNWk5VWs3VS9YVFhJbFRMMWg3TDVmOFQ1?=
 =?utf-8?B?b0RsZWNhWWJ0cTB4MDRpOFhnN3dWZVN6T0VWNVMxTDB4WkJSVnh3TThHTFBv?=
 =?utf-8?B?R3NBc2tZdzgvdUpRak55NXZnSUJLcVcvVFFLNjVkVGUrc2hqOWV3QXRldGVF?=
 =?utf-8?B?OU5yWXplWmRVWXJCc1RRRjhtU1pJTmg5a1dmYURWUzRJaXZkbW1HdG56b3l5?=
 =?utf-8?B?ZFZSS3gvaWxkUmJaSG51djRaSWZJOWxsL216SEU3REFINkR6L3JrMGc3Tlph?=
 =?utf-8?B?RG9HbkNxb04vaUc2ejRFTFlHMkl3dXExRnBjZXk4TDNqTUE4MWQ2S2dMa2xk?=
 =?utf-8?B?Wk9MZjB2ZEdCZTJkNzkwWTZlZE9aQlhwai9ST0pqUEtRUFM4UFljd2hKM0J4?=
 =?utf-8?B?VERmd3kwVWJoWHVTQVhoWWFtY01DUzJwMXhhVDhZYXJac0I4bldVS1hiNVRV?=
 =?utf-8?B?UXhtaUc5VnhEU1ZEakFYMjlDblUzbUdoNnJ0Mk9nTkp1cjYxaVJzdGJldUtN?=
 =?utf-8?B?NFY0czZZbW5kVjg3Wk5RR3NpS003c2NHMVpweC9UTXZybVBFR2RJa3h2aWh4?=
 =?utf-8?B?dVd5NkZMSGpkd2xUT3RVNVNKVlNSeDVjdzVIV3FuTWgxZjN6Wjc1OTNETWl1?=
 =?utf-8?B?azQydFBYOXRTcjhWWEhqMUc0ZWgzbWV4QmZtcVJVVWt0bW5kQnJRdEZHRm1w?=
 =?utf-8?B?UXB6VWRncTJZbDRHNmFZNDE4STBzZzNLdkgrK203QnZNVkRYSzdpcEZOV0Fl?=
 =?utf-8?B?Qk5qRXQvVmVTRlA3ODBrd1VtNGdmQ0pURUgzRHZBRTU4U29IV1R6RXFBaVZZ?=
 =?utf-8?B?K0xOYndSWkRiaXpMaU44WEs4MGN1dUpXVitka2x4czNHUUdmMWp6ekRXNmp5?=
 =?utf-8?B?eGlkdU9EbzJqYyt0WEJUbDZOWTRqZXVtWUUybzZoTEY0bmVpNTdwbG9yb3or?=
 =?utf-8?B?SlRaSFF3bTN6UHRHeTdLRm1SbGplczN2NHAydW1NbGxRRk94Y1hhTW1PcnlK?=
 =?utf-8?B?bEk2YVRaN3VBSlZvS3B5K1YvOTR6Rk9Jczd0Y1VFY3V4QmcwcjJjZ3YxL3M0?=
 =?utf-8?B?RzBDQnNEWUI3MWhhSzluMk9xSHpMMkpOL2taQXpTanNtM2hhMGpwKzNKNU0y?=
 =?utf-8?B?M3ZxTXVKbFkvRDIxUmJxbW9qemRZV0x1eENCTTNWdmoxMVQ1YVQwcDhGWkF5?=
 =?utf-8?B?c1ZnMDVTc2N3MXNhUXpUWVVpVDhDUDBDZHkxTnpPTXZwL0RTZ213Ykx4VGl2?=
 =?utf-8?B?VmY4WEg4WUhlYklMZjlLVHJOdlhPb3VHWkRBMlpKdUwvSnpUU0V3ZWlYOHdU?=
 =?utf-8?B?S1dFRW81cUhBeklOVkUwam4wdUZ0MGJndXhNNTFMSERkSVZDaW1jRXJ1bXda?=
 =?utf-8?B?NXhGTXVnNmxUcmhoWE1KWjR1VWhvUWtCYW5yYzJFU1NkT3VKTUIxQjVsbjdj?=
 =?utf-8?B?OUgyWVhNY01ybmhQVVZMYkxMdGJlbmNHOE9iSjQrYW81dWliOFNyR0dJZ3c5?=
 =?utf-8?B?SXFmdnREc2paQStmVXd1YUExZzcrK2g5bk4wZjJKVUFGL0xqblpBbFVpQ2xo?=
 =?utf-8?B?ZlBLU0J3dW11cGFpZzhSRFJVbTlkZ1IvSzk2Yldyd1Y0L2NUSWxubjhUZWtr?=
 =?utf-8?B?bTdkeTVJWlpheTRoeStrU0lUSE1IMWlDc1oyOWdML1EzcHppVk5uZGlwZ0NN?=
 =?utf-8?B?SDk5RitYYjA2dTcyMC9ZK0FzTVRSREx6WnJXVFB6aUVvTnRWYkVQOVhlU09Q?=
 =?utf-8?B?ck1GSGg4MkZjRU80OVVOMG1nMitWemNvZDV1ZVg4OGlqSEZIZ2tqeXc2R2VX?=
 =?utf-8?B?dTNRREFWMGJMZHdIVm9TTDBQYjEyN3RmOGRzb3E5b1piVEdhVHpBaFZDYUdz?=
 =?utf-8?B?TmlTdHlsZVNnUHZJS1pVWFovMGlZdUcySWxtL2Q3aEZwRWN0alBmSzR1VkRO?=
 =?utf-8?B?cDlLcFBDb09oOGFuT0hLdmZIcTVHOEpWclJLWm5OdzVja3ZYd25ackJLeUlR?=
 =?utf-8?B?eGZkNlR6MTY1cnpEUWRBTFYxVGk3REdmL1U3cnY2VkhkTHM1aWc2YnV3M0VH?=
 =?utf-8?B?NjkzRlZSNGxYYzdiaGx5OURWOXVmWm56cFUvSXBiWVB3ZDZLM1phUmI2VmhN?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GCGRMFEcnKsFk645jZhvf08u5DhbYvw6RtE8wexZIGwdP1CKEwN4NBS0WftHWOJUnayaJr/kR1f1ueRZGyOIHljabF7qdqtGDsqVjyjN+H252IBTR/fliyY1cjskRmILTo6BPh8udz5J89Y6BnPZ9EKJfIdUe1Gm32cEfQpRY+8h2a1cnMRRlc9Ed9mdNIW+MWaQA6SYftLv06odf1546X9pGVMXLtGzgXATnxX8VvAStb2dk0LMLF7B8Cq/FIjXE0iphtZ4zEKE2RE+Xg8UWSiJH4kvnyMdBWDzi4t/3AuMHfY3pXXH08djCkMP4L++m9Fr6aSX5IL51iRPdHth8JW+ywRaPsK08FASK1pkliy/xMTY0+iDfm8ndwv3cEMPZKCgyVID4FWRbjkDMWZLPC8NSIghra/I6AkeNlyyXt5FRfxjmw+PIHlalvGS5U2nXiTX1t+Wud7RaQ6iV8aonP/M1fFf4yS7ytV16JUImj1gC/4RK5y1fsWGELCEc6Uu3bkNJcUGwU6S/MPR8mulLhDVP5csDUpoA9+GaiKy8zenljm9XKBYFdTfZoI1uhsRJB8ot8pMcQ3stEXUBUuurjQ/CqPgBnvGIXZE7u0QRpbGV++IUZyAEALfm7Mj7VaIzhYu8/j1fybRG+zAwJYUuUYwJ24LoyYlgjnTlMELyc/PG/hfFZsPAlMdJk9WGpPTEcgldglqNYRvUmwVA3Kge72LaSZprqwwnDBq73gj+q8y62VvvknPvsF6uOFqtCJ4NbVYpe/OXgZdgQ23qhve+sDi40R5dw395IiqgIyfpmaSPe571VeZXfFlam79zAHiK6naMDF8busVRySJlamsNjmDTwVyKfqWJj3/pQHcDcE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259e6cd7-a057-44b9-7f0f-08db6b6ad54b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:31:19.6578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCRintmhX07HJDOY2qYzI2zpzGhpcXnZ55D8hCfpaCSwyGuIUdv+Rl7LF0F3oZpFDOgHANfsffQ/7x7OTi/MsOs3USm0OzfEGdHGFvCTn0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5268

On 12/06/2023 4:16 pm, Jan Beulich wrote:
> On 05.06.2023 19:08, Alejandro Vallejo wrote:
>
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -854,8 +854,14 @@ int __init early_microcode_init(unsigned long *module_map,
>>          break;
>>  
>>      case X86_VENDOR_INTEL:
>> -        if ( c->x86 >= 6 )
>> -            ucode_ops = intel_ucode_ops;
>> +        /*
>> +         * Intel introduced microcode loading with family 6. Because we
>> +         * don't support compiling Xen for 32bit machines we're guaranteed
>> +         * that at this point we're either in family 15 (Pentium 4) or 6
>> +         * (everything since then), so microcode facilities are always
>> +         * present.
>> +         */
>> +        ucode_ops = intel_ucode_ops;
>>          break;
>>      }
> There are many places where we make such connections / assumptions without
> long comments. I'd be okay with a brief one, but I'm not convinced we need
> one at all.

I agree.  I don't think we need a comment here.

I'd also tweak the commit message to say "All 64bit-capable Intel CPUs
are supported as far as microcode loading goes" or similar.  It's subtly
different IMO.

The Intel microcode driver already relies on 64bit-ness to exclude and
early case (on 32bit CPUs only) which lack Platform Flags.

I'm happy to fix both of these up on commit.

~Andrew

