Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62347029E0
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 12:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534692.831977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyV2X-0006cZ-Pf; Mon, 15 May 2023 10:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534692.831977; Mon, 15 May 2023 10:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyV2X-0006ZR-Mh; Mon, 15 May 2023 10:02:49 +0000
Received: by outflank-mailman (input) for mailman id 534692;
 Mon, 15 May 2023 10:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdz=BE=citrix.com=prvs=492993889=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyV2W-0006ZL-Bw
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 10:02:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a35fef78-f307-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 12:02:46 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 May 2023 06:02:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5237.namprd03.prod.outlook.com (2603:10b6:610:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 10:02:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 10:02:27 +0000
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
X-Inumbo-ID: a35fef78-f307-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684144966;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ba3LveGlMFeP7ck9gTdobzK5ke7fvb5sP6oy9OLcNhk=;
  b=aJUDSEzpsxJOYMYI8TJ7ECqsxTtn5CGRY/FmsWRjaDjpi7amn/jbKj5i
   Fj415aub1/DdpHwBEzvPJyU62gnK4VmBa8fLOAHa0YLVE5txK+gbFMudH
   f+Cpu+aqoqz+VMcIsNHyaJpoS/LWkMVPT1F2IoqMlqEWRsMOsOFC6SNEE
   g=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 111500283
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lvhSVKsvyq4s9P+WYTsHlnFq0efnVHpfMUV32f8akzHdYApBsoF/q
 tZmKWGHOPyDZjOmfNAkOoq//EJX6MXRnNMwSAdsrCw1QntE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKHyiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFylKLTeHrMePw7/nTrRw2dV8a8XhBdZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIK9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThr6My2AfDnQT/DjUPCQC5osO71nSdePt+J
 3Ep4XMFsbgboRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2iw2VSN9mSfaxloesQWm2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN3GJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:pujAFKFshwgryuoOpLqFk5HXdLJyesId70hD6qm+c20wTiX4rb
 HboB1/73SbtN9/YhEdcK+7Sda9qB/nlKKdgrNhT4tKIjOW2ldARbsKheHfKlbbak7DH4BmpM
 Jdm6MXMqyPMbAT5/yX3OHSeexO/DFJmprEuc7ui05ICSVWQ+VY6QF9YzzrZ3GfhmN9dOsE/F
 733Ls1m9JkE05nHvhTfUN1ONTrlpnwjZf7ZhxDLwc/gTP+9Q+A2frBCh2F2RVbeC9OxLpKyx
 m4ryXJop+7tu29yFv632vehq4m/ufJ+594HcmRjcpQDCvqhh3AXvUZZ5Sy+Aotpf2p6hIRsP
 SkmWZaA+1Dr0nJe32zo1/W1xL+3C0I43vvoGXo+0fLkIjCXTcnDMgEuo5DaBve7CMbzaxB7J
 4=
X-Talos-CUID: 9a23:PPdqHWGOsLu1RZNOqmJY7QlXPcQOV0TewSvUflPnGDkuRLesHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A5A3WbQ0u13lHShAWJobWnxUsajUj+vj1CkM3k8k?=
 =?us-ascii?q?8mOqtFCBNBizEpyina9py?=
X-IronPort-AV: E=Sophos;i="5.99,276,1677560400"; 
   d="scan'208";a="111500283"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATKe343yC73LJmNEoktf/Sr8vAm1WADcOFYDYL5xDc9cihbYayO0uHm5hZKk0SlxeFF+wAGCDNbPbCfnPbu4FL3m+LaXYPRucNSKbh9l0T8MCwlFh6DJPIxum6qnauo7TyidQHf3Ci+mVsabA96VgalxnCvPk94H3BokRfJqw5DKoPHe58P/kv/RQRTgfiUtGoXewazv9/BmNcsRAdEJn9iCewamYDb5JPECTre2wu2IW3g9/4J4yV/atstye8IkGvkFuEMW6zPn56097HU3Oq5lGwqSIPhpoSNmJ5MOhVI5PkycNZ4vduE+Y0SvZO9i9sZiP26NGf65mILKjkrKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyxrH1OZgCGkCuGj3opBlUiDQhuFXBUTBu1Jug+qvqA=;
 b=KhZKyYhcn7WzwqTlwiLCRSY6l6chBpJbQJy+8j0alLMjkl+D8x4rkNWXUv2FTFaHNVFhe0l/KoRi3dfRGXaq99IjYmIR3OuCRhAma996YxWZB6M4DIq7qjkEXTgO6okxv4SiiPOYFsrHthR+EZ/dCaojnuRlju4Bj2AJ9BlvfOtgnVQor+sJ83PKhM4+knfWTGGfQuQjeP8dEMvvzUZj+zYVN+m435Lyz0e4/XIrdsYtlatrArKo3/ANcePhHGwW3HH14yomavUbxEZf0NCRbqdBOw1B8vxSMRCwYh0H3aQhOQUzLjwf5eMD8Mf7Bq5jUzeS7rEhY1aliksDQ7iQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyxrH1OZgCGkCuGj3opBlUiDQhuFXBUTBu1Jug+qvqA=;
 b=HEge8/A1kB6/jmXbHa+wQdGcclNwDdQR5JZD9P0eVSAR/um2qthxuDTqFrTq3Pw3/pGxrCb3L1reENXMzrqtoRc/R5t6KFxUxU37nYIKcGQnPn45VY1aya+Vy3fhaR8jj5xZt6m1IfKdXdxiu0TUJ+BMTEMZh1wQW+o0Tdn0WwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e2ea24f6-fe4e-d7ae-f663-71f49811e8b5@citrix.com>
Date: Mon, 15 May 2023 11:02:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/cpuid: Calculate FEATURESET_NR_ENTRIES more helpfully
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230512124551.443139-1-andrew.cooper3@citrix.com>
 <687ac0c3-9364-f03e-8f7e-afaf985618aa@suse.com>
In-Reply-To: <687ac0c3-9364-f03e-8f7e-afaf985618aa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0349.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5efaca-ea36-4fab-2f45-08db552b7cfc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yAjq2EjgudU4IXYMfiseAQqfV/tJJBDwnytVJW2CntBOs9vizTSJm/zil1qrDnESruoxW3M5KUOhoIuxv4iRuIQgAP1tJbhWlZPnJEB/qCkvKqCHIYWM6TfeE1WGtIRV3PI0GgdRYWxXqx3HhMLw8KuIjRN6s0tlcJIsILgO0Mp7/yDkIhgB+QlMk0utDQq9GUm5ppSRmTmiSs+Kpe6DLxW1C7GI+xUrsYLj86ciuwp15s1KgxrX8tLHm03mAA6t+NuJCbfG+PVgQO+5nz8zz5EgSXWhqeOtPXJgbpkP9LEIq2YLVjQ+aTXejjxeUj5j4QfTH8Z5uwHCjYjW3ZqkyfFlKMqZ/1FHGGevcBeyV8pkaqDfi8AWokjPoXJ3AvJrmzIrdkGOIdEjNQwY+d8IzEWz6FsZwxzu9GPFVQXdMg/Pz+JvhbkE/mPF+rXzbRvT1vmJbTKKrF1e9nU+IKEGfZ2+dXbeW5YQ8nf8iZJCBv7tPyIOr3K28UCYtxD/e1zSaxmx8Cm+tr2cjXSaUyiNzBYocjIugih8uXfEQNlL5RaHnzn3h97btpl4bWKZUI8WeSixsNS4y8jrWAcPmDf1Uzf7f2cu1XMOlQLY7vRHgPAk3xr+0+ReJQX6oti+YK1VN31DUFIBklffAplBKM3r6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(36756003)(86362001)(54906003)(316002)(66556008)(66946007)(66476007)(4326008)(6916009)(478600001)(6486002)(5660300002)(8676002)(8936002)(6666004)(2906002)(38100700002)(31696002)(82960400001)(41300700001)(6512007)(2616005)(186003)(53546011)(26005)(6506007)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXlrK1BBL0JGU1p4YlphTTVVdDRiQTJHS05jZU9FNjB2cnlNaHpzVXNYYkVE?=
 =?utf-8?B?aXE5Y1lEeC8wUUNjb1FkcG1Oc3dNODgzWU8rV1NNdFlnVHVVUitCNktIRFR2?=
 =?utf-8?B?aTNXM2xUTWp3UVg2QklnYk5WU2s0MXRYb01VTU5lRCtaSDNCUUFXYjJJcnRa?=
 =?utf-8?B?OXUwUWF5WUJjQTVubFM1b3o0Q2QyQTdDWUpycEtKaldTdDllejBsdVQvNzUv?=
 =?utf-8?B?TkZWTjRDUzlwNmp3bWFNbnZjcDVLWThFcG1sK0FMNGRKcEE0bXljTVA0Z1Nn?=
 =?utf-8?B?ZEphd3ltQVorSGlxVHIrQjkxUmtJbCswMUx6SWdEa3hLUDdRQVJieVVpRWJa?=
 =?utf-8?B?WlNjS1JMVEM1WFUxY0pvSHA4cGg5a3l4SVI1bzVtSXp1RGZkQTNkNG56dFZn?=
 =?utf-8?B?N05FRm1VQmJDMEMvZFNJMlJpMU01Q3NBam5EUmlIVjV4T3FGa2g3V1ZBelBT?=
 =?utf-8?B?QVl4SEZSdVdRRGZhelNYTHJwSFRxTE1zU09ONE5FWFMyVmxlUE96cHdZL0lZ?=
 =?utf-8?B?YS8xY3Q1NHdXdG1XZ09JaWlUb0dvTSs0S0YvOUZMWkFQWWZnS1c5MDJYL2Vk?=
 =?utf-8?B?QWJjVDBzQk5HcGhEQkJzWGVWU1dYa1craFYwcm01TitLWE5zTlpRaTErd1M3?=
 =?utf-8?B?R09ZZXN5ckM2bFUyK1BnWFZidExRR20zUE9FMjV0RyttNGp4TWVJZ3BNdjZn?=
 =?utf-8?B?WmlLWnlXTjRBbDU2VkxMV2IxVWZubjJjdlpRLzFSMytRb204TWlielR2VDJy?=
 =?utf-8?B?NTdWTlR6RDNpRUZvYzY5S0lsU0U3RUtXa0tmLzhVZzZld0d5T1RuN3pZdnFy?=
 =?utf-8?B?OXpsalVZWW5uQzJMQVluaUx0MU5IV054Ny9lMHBJLzFzV29nMEpyd2kxMFRB?=
 =?utf-8?B?RTA4Z09oMW0rRy9MUDNQcXR3b3U5SVJZdngrTW5QNHBRNU1pVUJNa2FJb0NW?=
 =?utf-8?B?YzFSQ0dJZHVjQXBYVTI3QlQrNDV0c3JxcW4xM2hxRU5JOHlHeUdIZ0RwUkJs?=
 =?utf-8?B?aWFIVTRNYW9zdE1US3ZCaWcybGZJaGhWUlZKVjFRVnpkaU5xTzc5Tkp5c2Jy?=
 =?utf-8?B?UiswOC9VcGJYSndtblNyektDZzIxZkpTQXBRVHgzdmFxbUxwaWlxZ3RuZ05w?=
 =?utf-8?B?N002ekYzQnA0cU9oNzlmYkhWaEprd0xFZlZmekFaeURMcmx2QW9TUndxTVVE?=
 =?utf-8?B?NTN0MmhOeFFSZnp5cHErUTYvdmwzeUtZWUNXYzZiQWdiSUhIVjhXbDRGTXRS?=
 =?utf-8?B?cWI2clcvek9QNWhvTHAvYmZvZjk4eDhyUG92QWpZSUtCZlBDOTdYR3ZhZ2tF?=
 =?utf-8?B?aEgwbEJuM0ZhTzJ2M1E3enhiMm9vZXIyMHB4aE1aRytmcUo3TFlIb2E1TzF6?=
 =?utf-8?B?Q2NLY3RUYnlJZ3lMSUNHMkZOYVhwNlBQTDJhYVVUY1B2RElqZ2gyTnU2bVJq?=
 =?utf-8?B?NE9VbUROTE5yWnhLQk1XUXdweXMzVVhUWitFL3l1ZmxIMWRhOFY0TXNURFdl?=
 =?utf-8?B?ZHg4aEZZcExHeEljWnQwalMwbzZtT0pKTlNRQ3VNa3ozT01CVTFFd0g0UC95?=
 =?utf-8?B?OXlmSk9ib0xWdndDYmFGMVBYUTlaUytpYWRQRjJOeTRlTVFGV1hWdENLVUFP?=
 =?utf-8?B?b0s0enR5KzVXMkoyOEZuQmlWOWgrNW9scjE0M3E1aFRDbFdmTk96QmY5RGRH?=
 =?utf-8?B?eFhnLzV5b1JTeDdSSmNBN1hIZXNsaEV6eGp3UVhSdnhUY2dXMWdyZkRFN0Jm?=
 =?utf-8?B?SEY2c2xlL1ZMYUlaZ3NyMVlraUhiRU1DTjgrcEZWaUVUbDhlNW50QmxoamN6?=
 =?utf-8?B?bW9SMnJZQS9mVDFQcVd2dWJiS1o5NytnRnltNUx6MzBrVFlBcUd3ei9EMGVy?=
 =?utf-8?B?ZXlzQk9FckIxbUNpRDd3RUFXZllLNEQxMWwvMTEyK205eTJ4SW5IdUU0bUQv?=
 =?utf-8?B?UjJCUnJ4MnhZZU5PT0xHelRPTjkwdDlnd1lsY2h4NnpBZkp4eFk2ZkVTdmU2?=
 =?utf-8?B?V0ZSNXg2T252MkNmczVKS0FzRndzdFgrQUREbUJZN3lzeVhsRXU4azlxc0Ry?=
 =?utf-8?B?dnJuNlJHQjMrYUgxbVQ1NVV6bmFmZnlod3RTOW5aWXlLWHJseFcxbzJoTzky?=
 =?utf-8?B?aVdEbUZBc1ZCdXVWOVE2R0dVL3N6MDdxNGRSWVFUdFpCQzhVS21kTkhzeVVx?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	usvemT35RM7SqHNbQY8oYC4l6eN7tav3ntKzHlrl/V1SDZELQReHQ7Qb8BCQJdtuxDMYFd1PjRHoNCQXaF4aU0rPBfDn0F4tGlbzkj8qiMifHT6BCU8pmq8vKs6baaUEtXNwpGv3Hx82Q3XsFJJf7ryWYy1PvUtUcyZsmRDIDVnOIz4+6mlqqdp9dvGTKqy29wLCR0x4KWdID+IHrJNsirdl/Cyz5axLphKVAyhsaiIX7sC+sWU8o8YL6HgNaTCEQN+X4do9I73CrMGBY2q4ggygib0hcVW5L9QrJ1T03qSix1qDb5brXtZTYCMpi0qzc3ENZBX2NmZaOEP+c6fz81bb5oJDWBz2r21DDFILk9A+HqkB7z3jQWdU6b+S1d0RmWqi+8bBgdEG9utrlAXmqGZ+FgW8zaHqB6T5G20Xsz9+p/rMpSYHaYQ4/Zpi3RxwcEZPSvIHrKN9kaJYBf0s+8a6JhCknLWckBy+Bop5p/WjxGtFBFodxnW9JUmEPq8nmxjfhxR+ONGNXhB+YojGuZ/mJGKdudSrahrLJ51SDj8nicpc8RXEIAO33ME30ASm16uK0eVbcLZqjVwM0lJlrW5xzzJtiEIOHvT+o/DhF1qSY6Bj5JN8lxGVeTb7OBU/U2zkRG3gaAEf4QmTau5mX2BlaiAtIroDdQ1CYXo5uCf2jhzsWWcDCWuBZ0wB0EAv+FJYqFio3WnTk48fIJKO9WfxAyNJhVWtbF+dquUxqbym4MXGr5iB+aYURMd+V6li/3aF4+0v1z59a9DT/Zg+wkCdYbOjAkxlEuJFCJSQRWPNkZ995LUvBBbZs1TPy2Mivlx+kmE2qtqukP/egOyYGQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5efaca-ea36-4fab-2f45-08db552b7cfc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 10:02:27.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D23SuBeZHGULwGFLI0k3vfdcZ5w2OhYYhzgAEmBe8ErKc0YkEvTgQ6RUog0PtVWVDWym2Mdpy1W1BJDnJvQUdcX2FbIa6bBMgy0OuQCgeCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5237

On 15/05/2023 8:46 am, Jan Beulich wrote:
> On 12.05.2023 14:45, Andrew Cooper wrote:
>> When adding new featureset words, it is convenient to split the work into
>> several patches.  However, GCC 12 spotted that the way we prefer to split the
>> work results in a real (transient) breakage whereby the policy <-> featureset
>> helpers perform out-of-bounds accesses on the featureset array.
>>
>> Fix this by having gen-cpuid.py calculate FEATURESET_NR_ENTRIES from the
>> comments describing the word blocks, rather than from the XEN_CPUFEATURE()
>> with the greatest value.
>>
>> For simplicty, require that the word blocks appear in order.  This can be
>> revisted if we find a good reason to have blocks out of order.
>>
>> No functional change.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> As far as my Python goes:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Just one remark further down.
>
>> This supercedes the entire "x86: Fix transient build breakage with featureset
>> additions" series, but doesn't really feel as if it ought to be labelled v2
> Thank you for re-doing this altogether. I think it's more safe this way,
> and it now being less intrusive is imo also beneficial.

Yeah, now I've done both I do prefer this version.

>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -94,6 +118,15 @@ def parse_definitions(state):
>>      if len(state.names) == 0:
>>          raise Fail("No features found")
>>  
>> +    if state.nr_entries == 0:
>> +        raise Fail("No featureset word info found")
>> +
>> +    max_val = max(state.names.keys())
>> +    if (max_val >> 5) + 1 > state.nr_entries:
> Maybe
>
>     if (max_val >> 5) >= state.nr_entries:

Done.

~Andrew

