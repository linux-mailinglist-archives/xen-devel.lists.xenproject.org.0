Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F246CC509
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515941.799333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAz6-0003hO-8r; Tue, 28 Mar 2023 15:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515941.799333; Tue, 28 Mar 2023 15:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAz6-0003fI-3s; Tue, 28 Mar 2023 15:11:40 +0000
Received: by outflank-mailman (input) for mailman id 515941;
 Tue, 28 Mar 2023 15:11:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UojI=7U=citrix.com=prvs=444182d81=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phAz4-0003fC-3m
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:11:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3b5a306-cd7a-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 17:11:35 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 11:11:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5050.namprd03.prod.outlook.com (2603:10b6:5:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:11:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 15:11:30 +0000
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
X-Inumbo-ID: d3b5a306-cd7a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680016295;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2p2e8HrFgbPoVYDP3c4WeMtTY4AKovc2qqGIrFuDucE=;
  b=T1yVVzPnD3g1mr8atmBi3mF66+SrJN+v07Oc/GU/D8dDhYOl6fYKxPnB
   OjEejuF6mWKKIignu0fw0HFGX0vHqqf7lK+L4jEOLCmFXmJ7Bz/PoDT+0
   jT9u9lY3YXul9i/gUx5LVN/EU9ZMQyupURtz+Q0EILHhIOtD9E+M8xEZQ
   U=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 103398610
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w2hT5KrTClgYaL0fchhipmvsc6deBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBmHM6yPY2qhfNB+PI21oEsHsJfSm95qHFFk/i4wFnlEopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSlNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC02Zyq/vN+m+a+YVtt8oZ8AdfbBZIxK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKOEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqUx0Q3NnzR75Bs+XgbmjMvltWWFdsNnB
 BRO6jAwj/E0zRn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yx7KENBqFfftisWvQGmrh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:MdLC+a0cgDXWNZXxm387XgqjBQdyeYIsimQD101hICG9Lfbo8v
 xGzc5rtyMc1gxhO03IwerwSJVpQRvnhOZICPoqTMSftWjdySqVxe5ZnPffKlHbakvDH6tmpN
 ZdmstFeZ3N5DpB/LnHCWCDer5KqrTqn87I5Za7vhBQpENRGt9dBmxCe32m+zhNNXR77O0CZe
 ChD6R81kOdkah+VLXlOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPQf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcZcsvy5zXUISdOUmREXee
 r30lEd1gNImirsl1SO0F/QMs/boW4TAjHZuASlaDDY0L7ErXoBer98bMRiA0HkAo4bzYwMjN
 MU40uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pTVFb/l/1XwKp5KuZLIMvB0vFrLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpX+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQODl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7uSwlgF/NFQgF5vsukaSR4IeMMIYDGRfzP2wTrw==
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103398610"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgFLK3uUqSBa0khq5+Lxxv2cMdHgkqtaA42QfDAl52tvbAS2QX5hmVd6yNjP6mqxjqyxcR7A9cDYPA8FJ602dvIvhYTklM1fCigb+UbpS850lqGhfHHvVPlw8kFvHl3QuB6cUl0OgznVJxtXwMGywZQek3keIiEBAN8MdkPOKbq7WD6SJ8urG9VZjdY9NcCaUm52aGng7H+Mwh3+p+SVFpSths3lPZ2kAyF7xfLgeTF+x53ZEXROQfVELoT86gSSSqyeCSDVjBln2Tz+W7KYaiqzx2cZ6NzXtCy5q8wMAOg58JlGuUlZSoJjJrNz0THKUR8SLccuH53wpQsQJ6bR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAGZscfSPCjABFB6jEqDbtA9rUhJYf33PbYVvWvVqLU=;
 b=JW/oeqR0RwvCDTQ0Z39G3iJUAYYjWZqAIt/IKVXEudNlDrtesOVFReDUQKQzWrgPPIFh/5fcJ4BOETozv4O3UqYgJo4MT4VkesHGYcyoh+qIJgMojnNnzIKcYDuj7ziY2zSWjBjDZFzflqUtG2DtqAo2X9209DgICbQio+XJ1vuyXi7+NzI2E3Ph/+PY0DzbDweFk+HztcPxaGpmWfRjfTQPb7ifXbA6HuMLrYG3KyV9iRAYVSsgObhEpa6r7zUimkDEeJz4Zx4aFTE9dh0Q+N0u5k1a9lAEvwAU8tWFvO2QCSXF3wIW7zLti8tDVApTQvn8IxnZXPmwz/J4C4qgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAGZscfSPCjABFB6jEqDbtA9rUhJYf33PbYVvWvVqLU=;
 b=sDXSQccuU4czNeO/mj9/Tuiwf3o0FKmEG/hq+GTG31QsjNPjAGX57tDY7GsRTya/ddWaDTEW9+srbBFGzZ04kVQSqtFhUPMlR3SuIpaGsYOND7p2R2c3ODpOlcdGgL/rC96D7UYp0knCLza+BcFV1Og4YEIY7wwoULsG8KcBnbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1a2acd07-98ec-b23c-07aa-3ff2be825ac9@citrix.com>
Date: Tue, 28 Mar 2023 16:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/ucode: Fold early_microcode_update_cpu() into
 early_microcode_init()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-4-andrew.cooper3@citrix.com>
 <310d2d40-223b-5cd2-97cb-d9e40441c254@suse.com>
In-Reply-To: <310d2d40-223b-5cd2-97cb-d9e40441c254@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: fc8ed192-c35e-45f3-9a42-08db2f9eb5bb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ne4c8dCPEzEuu2LQrNc3SdB/Syr59B4w5N7z82NTHTNaLiXz79NNNxPzNhXTV6hKOKgukaLUn8uXRaULfBZLUX2l5fE74ulH8RYurv6xSCRxRHVPo5nASMIVDHO3YWY4e4Lzd30c0TxvnZSgf6CQOh9pQ04FY7/FbwpbaYavBZ7SCDc69xKx+4rtaMZvYNkoTUgmvmhq37vxGJgJZ8BrzUXfoIae4kGxFZpht7JYXwunpjoQ9Yxc4CsUGDrIHYxrQobVciXsvFc8C4/zU1aBhdAi/Ub+obSzboO54WPTsMRpKKivScu1B4hbFjxg0w5nfbG+S/ka+NbFAWqkI/SAC7KITI5lpAq1HvohvzhXCgh7YIPUYTescMMsKNuw023S9R5lTUbkJCeBmXGbjBNLos9hU4p+bXriOGoTEgJr51Xg7iPkuKJWtLNZATUg0+ttX3ANKUDjiDHvtOv0JwK7FsPJB9+cU9Z2f9DJlPjRS5NjO/pSMdMOrpPw1pGh/xQWqbdnnE3tZRg8H2oVj9rcfPruyEyIwuFL4SDTuSrDHEg1JrnNO0KIiei0vVjA0pU3FbLBMFlwPyT/FM71SRv9J6vooDlgFAn1+l7eORUhouuq2IZdVQhOtGejUj/n4a2C7U3CsCpdefhszOWQvYlG/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(31686004)(6486002)(82960400001)(86362001)(54906003)(66476007)(66946007)(8676002)(31696002)(316002)(38100700002)(4326008)(478600001)(6916009)(66556008)(186003)(53546011)(2616005)(26005)(83380400001)(6506007)(6512007)(6666004)(41300700001)(2906002)(36756003)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTR2R1NlQVFqcThhOTREL3ZhL3MrRUxOOTI5M1BXTnNuTHlMMjZBZjZJT2JL?=
 =?utf-8?B?dk5MY0NHYXZxelg2TG5EMWwvTVF5N0o1NmZkQTBLS2x4ODA0cXUxTHg4M2pi?=
 =?utf-8?B?U0FtNjVuTDkyOU1ETHpkdnA5ekVzeTFtK1kyYUNuOHE2WnkrVzF1M29kOUV2?=
 =?utf-8?B?TXk4WFVPVUxwWldUTEpIbVRnckF1NTloUFpJTkRkTkVxaUdvclBuY2hTdXMx?=
 =?utf-8?B?anNwVEl2c29IcVBqQUNDTXJ5RTdrNG1mTmhFajVhei94Y1BsSFZGZTdzeDBU?=
 =?utf-8?B?RjJMMjJmWmRWUmtMNnZOZzRUaFBSOUcrWEZYb21US0dOcHpqdmFQRlhSc04x?=
 =?utf-8?B?bzBHQ2phSkZ6UHpoOWVqUkpyeUJScmhZUkxidWlscjczT0lkWEJLZ2p2cGlt?=
 =?utf-8?B?MldMVWQ0SnVvbkFYeHhoQitIaDBPTDNUYysvdG5GQkR3YXo3M2V5YVBzSHlF?=
 =?utf-8?B?ZDErZldsazlyQUZoWUdrcVhtNUxxclVKb0dCbjdkWE1qeTMwc1V5K0JJSVJ2?=
 =?utf-8?B?MVNLeXBTK09GTWtQRFkvc3p2UjFpVjBwKzNjSTNCWTJPWDNKUDhsakNxdUhv?=
 =?utf-8?B?S0EvWE00L1dNS0cwL3Axd0hLSUxUMTFJSFQyVTJXUUZmVXc5VEdVY1l0Vzll?=
 =?utf-8?B?em9GU1VCL0s4aUdqZlJyditDZVMwSnJWWjRFYzhoWHB5RktVUERLWm85LzVS?=
 =?utf-8?B?bXNyYlRjM3FuWFl5M0l0UjJrSnNvVmdJS3pmaVZJYjYvaG8vREluYlR4cmJB?=
 =?utf-8?B?N2U1YjlEL2lVdmhQaVdmZ3Q3Y3VwNHJlR2J4V0JnK0NFQ2p2NmFIMTRjMG9D?=
 =?utf-8?B?YzNWZXBCeGxJUUFydFg0MWQ5d3ZudVl2UmFMZEZ1YWpxalBLM25wRlR2NmxD?=
 =?utf-8?B?eDdrVXorTkUraFN2MzhodUFnUjNld2Y4RGcwNEZJOGVQUmx3SG1FVFdOWkVG?=
 =?utf-8?B?TDBRTDlvNHVuRjQ3Yk15bFlPU0Ivb3hLYUN2blFzNThZRUZFOVEyWk5YOCtY?=
 =?utf-8?B?NmFHNkYrTTl6OW0za2VpYjduNUgraXdGRUJ4MEZxQml5akFlWmlCOWhjQ0dv?=
 =?utf-8?B?Sm1oamQzY244c3IwdUxMbGp6anREalVpOWFtMzRvSjYwMkJDTnA1bjBWRzQ5?=
 =?utf-8?B?SVlWUUV4YWJQRHZMN3RzSlpTQWZlc0ZYVUV0V1Y4RmZwcElXck8raHdLbUxP?=
 =?utf-8?B?aGFKN0hNQnlObWNGYW5ncXZlNGFwWnBKWHAyYVNDZ1R2eWg4cFpvdWZiaXN3?=
 =?utf-8?B?MUJPTm1yY3ZzQTI5YTcyeFVnclBSZUZXUFdRRS82c2IrMXJCUFRGUGcxMGRl?=
 =?utf-8?B?MERoeWdEQm54emI2clJlckJFVEVISzN1UTdvQzVXR2VwKzBLTmNwRXlBR2Zq?=
 =?utf-8?B?NmRZMml6djFzSjN0a045Y3RHVzhGV1RqMEVSVEMxNDIyN3IxbXl3RTN0NVVw?=
 =?utf-8?B?d1FadDgxbS9raVY1aFJZbzhMczVWM0VBc0ptaEY1Mzh6emxEaDVjS2xQOE9z?=
 =?utf-8?B?dGpnWWhCNHZYWnl0NFE4MjgyOXZ5VEVFVjU1WTlXdEp0alBmbERYeUROREMw?=
 =?utf-8?B?WmxtUXVKMytTYUI3ZnFnSnp6UUxMTXdFQ0ZjeWNiRUtWMW0wZHVuc3EzZ1dH?=
 =?utf-8?B?T3VsdDJZZzR0eGFPVnZLTDg2blJieS9nNFdyNjlVOGhNQmlaRFhNMHh4WUdl?=
 =?utf-8?B?dVJwaXgwWVFRcjlsQ1RNb2M1NEhUT01XUlFsQisyeE8zQW9WYXFiZ2J2S1RD?=
 =?utf-8?B?czNpTERQNUxvdnJibW5KSXg5dURiZy9RWHpMU093azNBeHJFTTlJZ1lhTS9a?=
 =?utf-8?B?d2hkKzdDMHRuOUZSMnFKa2hraHFoaFZpMi9UQVZPTTJjVnVHb3ZsSTlMZnNX?=
 =?utf-8?B?cnI4aTNTdEtxVjA0YU1DYUpkbU56SFZFay9rS0dtbUpwQThKdVdzNk1PWm9t?=
 =?utf-8?B?TGZrVmhHZlBIcVpscWJiL2trV0E4OHpDNHgvTTVDbEdCWldoRlQ4eFcrbHVu?=
 =?utf-8?B?ZkJpbmp0ZmRENnpuVklJeEIvSjFJdEJuUkw2U1h6N25iVnhYUFd2ZmJzbWxN?=
 =?utf-8?B?T1ExODMvczNPaitCeFhrdHdzZHdRTGNKMTlCQXV0eS9rNjRYaktBZUE5ZUlE?=
 =?utf-8?B?Y3M4SENlM1I0VldscU5vVld4T2NRdVI2YzdiTFF5OTF0N3JHVHUxY2dyRExk?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PsiFj5EKVVI30lN0MI0GOJJlHIJ/J8KHztvW2CRahOONX/1RAfIB/HS+Ut5YysvqepTgJFc/S6whnf64pNt0wO61NL16LST1Zy8tIE+yuab2IzaFRLl4HynDM//bjfD7CnlBjuOZnnrOapoCWwChyi/8r19lcCf+mhCAJpA+kdnyU0zMtSvsn0P+UvDr2LCr0ISbGfP74Fcet7TX7VrtUhAUvk0wP+C1tO20Mlx5Uz3CzvlzBgFVoHJ4Ay37frfylU+xVApSeR9neu9QKfzDw+/n0383zH2o7Ceww3RO/BzuB/bNsbeWlnZP+wu2QcY762b1xx7Wtyra+cTRFks89JJjc7RGqEot0Akxc6vi13CVUsKoPoKkrAJemAQu+31P9q69zDzon/tLVME6jwbFeh6Dh2mWhJ2Y/FR/KWV52S9rsYtvOhCyB2ljlK3gK/s38bTdccGaKL31VX0Y0a3/28N3XuNRwE+/gUhsrkn/N/AZ7IACJJRbet2IbMyH1R4tmx2uWvwRFBdxHih0N5Rl38qgvpqO+ejcG0Ybiwa3RU5v17ZBQ0EIwA4in2LA7rLGJNHA3bH/ZvBT8Q3cpU0Fa+UpHsDAjMlSpRrwfYzo+zbJX6hjQj/2rJe4rvg8COHElJZg1TV04ax/qeTW+CbabRmYiK25O/PV+BLd6IzQDiGj3AFlQXM5G0B0hUc7dFaE7BGQX5EGBubg7gDqgcNUnGQSAG+IpJrCOZrBmuJoDEnWNWQGN86Ttzl1fwoIZyghyXTJH2W3okr/2KYNfA8a0nGA7LJxlGatRIW2+k7jnwNiVjAYBtapkLGYJv4j1j81
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8ed192-c35e-45f3-9a42-08db2f9eb5bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:11:30.7075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMfNxNlH6J3fe+hj1EhGxQvj4znGjEY92/mG66ASlS/VIgSoErBZp5mGvRVfaXwBkNA/8ERGETqLPeFGpF8+NF5CqDGb5wX6Eu6moxJSvrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5050

On 28/03/2023 3:06 pm, Jan Beulich wrote:
> On 27.03.2023 21:41, Andrew Cooper wrote:
>> Begin to address this by folding early_update_cache() into it's single caller,
>> rearranging the exit path to always invalidate the mapping.
> ... this looks to lack editing after copy-and-paste from the earlier patch.

Will fix.

>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -868,8 +835,37 @@ int __init early_microcode_init(unsigned long *module_map,
>>  
>>      ucode_ops.collect_cpu_info();
>>  
>> -    if ( ucode_mod.mod_end || ucode_blob.size )
>> -        rc = early_microcode_update_cpu();
>> +    if ( ucode_blob.data )
>> +    {
>> +        blob = ucode_blob;
>> +    }
>> +    else if ( ucode_mod.mod_end )
>> +    {
>> +        blob.data = bootstrap_map(&ucode_mod);
>> +        blob.size = ucode_mod.mod_end;
>> +    }
> I wonder whether the order of if/else-if being different between
> microcode_init_cache() and here (also before your change) is meaningful
> in any way. I would prefer if the checking was always done in the same
> order, if I can talk you into re-arranging here and/or in the earlier
> patch.

It does matter, yes (well - certainly in patch 2).  (Although I see a
.size -> .data typo in the moved code, which I need to fix.)

However, both these chains are deleted in patch 5, so I'm going to keep
patches 2 and 3 as close to pure code movement as I can.

~Andrew

