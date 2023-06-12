Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93172CEC6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 20:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547418.854797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8mgC-0006dU-J2; Mon, 12 Jun 2023 18:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547418.854797; Mon, 12 Jun 2023 18:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8mgC-0006bF-GF; Mon, 12 Jun 2023 18:54:16 +0000
Received: by outflank-mailman (input) for mailman id 547418;
 Mon, 12 Jun 2023 18:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8mgA-0006b9-Om
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 18:54:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84c8cf2f-0952-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 20:54:12 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jun 2023 14:54:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5388.namprd03.prod.outlook.com (2603:10b6:806:b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 18:54:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:54:06 +0000
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
X-Inumbo-ID: 84c8cf2f-0952-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686596052;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XKJZos6xzHf2mUp5NU43EDeLA90vPUA4QJ5yeY80ucg=;
  b=hVJZ1PuNxHde1h42u/d/AEsU3jflTIdryUivIhgUaIGVHv+flcjydcmp
   XxFOYlIi0PJ/qPVfxWtHG9f3TLa1RKP/MWia7H7yy5UCPPwJmiZK27gQQ
   +LpALwLTxJV8u9ZH7Qw8QB5EUefRPXoqthS4gFTnkR7HTXxx2y3YZvQjY
   Q=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 111834543
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zDrMrKtsTEJYGXxB5G2c0ubDkOfnVJZfMUV32f8akzHdYApBsoF/q
 tZmKTrVP/6MYmShLYx/aIjkpBwBvcTXz4c2SgI9qSoyHylH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGHzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdzcGUxOOjdKM8ej4cc4w1/t6b/jOM9ZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThr64x3ADPnQT/DjUwSGb8j6mVi3eaBegYG
 WEqyzQDo5oboRnDot7VGkfQTGS/lhcYVthZFeEg70eTw67Q7gSeLmMASSNNLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcGRwYY59jooKkokwnCCN1kFcadkdndCTz2h
 TeQo0ADa647iMcK0+C+4grBijf1/pzRFFdttkPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytaVUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:GmWEy6gQOLiTKyacNgg9yYWxbXBQXioji2hC6mlwRA09TyX5ra
 2TdZUgpHjJYVMqMk3I9uruBEDtex3hHNtOkOos1NSZLW3bUQmTTL2KhLGKq1Hd8m/Fh4xgPM
 9bGJSWY+eAaGSS4/ya3OG5eexQvOVu8sqT9JjjJ6EGd3AVV0lihT0JezpyCidNNW977QJSLu
 vn2iJAzQDQAEg/X4CAKVQuefPMnNHPnIKOW296O/Z2gDP+9Q9B8dTBYmOl4is=
X-Talos-CUID: =?us-ascii?q?9a23=3ADfARo2kQF8SzsGBrVqrHdJjNhrXXOSLax0rTLkW?=
 =?us-ascii?q?IM1czC4ayFQ6voeBVtsU7zg=3D=3D?=
X-Talos-MUID: 9a23:7NEqVgbsAbxC4+BTkSLRwx8yGMZRx/qUT3Igr6QYlse2HHkl
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="111834543"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNRDGejQqfdnbZgcDzarsgEmJYP7PnMWLvdFar38TNMsMEvEP8408T0U510LPYWXXcA/vaqk4i66Ynj3MLwqeOWtCQkemaNmkKSSr2GUDFWKeC1K+6DpDz4Eot4SlB5vCDDnLG2ZZeculTIKd5IKFOSC2ASyseMM7aLuehZHpoAY2ItGU0Z9HD4M3Sq8ZxkHLlKnC/mNs6i1mz78QdycBBw/i4Rc+gZbgyuRzEPDWKNdwJg7KRIVIhbPL/F20v1jjT2RsPuSolu9mCMyEaD4rkt16m+Pozci957nhxJWDqWOBkLTkvvQTH+neI/Wotn0JQIk5VuKSip7pwCLLe0Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3Q7nhQtr694EgkD/pDvIC192oY21WJHh472Uk9wKv4=;
 b=HFm4HcaKCdHiwGng6UeHKSqzyJiLukHmaK4ykMqcU7X7GTr1SiRLaVSPKA9oobPZNM9F/uJ9Mpk/Zw4UQjQkrnOdUrUAsRrFUOrvPzwJToIPmdwK3cKVz0bgrpdj6K936zGv0fPfxDECpot0dENeWSsutpl52aiZjReK9lHrzr04hiMFVI51qlVyDX9il9nBw5TtFHLkWywvIQFSlGLmax7hEocA7rtuU/8NxxeqU8+N7WgNB49nx992lrjG4yfuDixgCyVh57p71hqqdgulGZEQ5sPGViigOGgEp2N7FpoEQeNYnfUowmKAvVKSfIie7duAOwCmSgg4jvoMIsfIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3Q7nhQtr694EgkD/pDvIC192oY21WJHh472Uk9wKv4=;
 b=f7LDzr/0RenETIxioJIsvf+flUwwhKXX+55k4bnzCWGyUqG3k7FpHhJES44zMuEczRJa1lYz1w1USay6fdbrN5Pe5uhAzrBu3jI72gPNYpUF578+0vpouH0qUwdMz4gEtYmIPbKP/lfAIVKv3mVnHpqcEKUim3GbC7dosHJy6Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <adbd3826-dd34-a386-ef3f-e964ebb2e270@citrix.com>
Date: Mon, 12 Jun 2023 19:54:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 4/4] x86/microcode: Prevent attempting updates if
 DIS_MCU_LOAD is set
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-5-alejandro.vallejo@cloud.com>
In-Reply-To: <20230605170817.9913-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5388:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6dad16-0dfc-43e0-f3f6-08db6b766585
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CAL8fk0qwm+ORORbvKPQfEj+cmZgLwSTBAsGXQguN93yq/huIdn7wBuB6fPQoGtcU2MODIw51A4wf3aQE8UI5DNHDvRDV5L8hNBh/UNpFmShbZsOwWRbGKSzc2ZyQxESEzQiq+/7SRBXIViprNEw3KXu/4x8hpK8uQfBFO4SILHYri1+ULwUi+/YOPk3P9tpJgsjJO9xNGHhwAzvfq5FYuHbbrpkVg16KNDhlSQmkF+lhQbDyMwOBy1U5sZpTh3MK1JVCt6+nxocoKKfV0dZFA0gvJs+zAn1V+/8TYNOy5u/mkJRaXqrZVMTe5l+NFaBNakdl6s4cLXp9uVJmGoGnRx+LFoggTQEI8eToDfYqWD6hxzuQSjkJdzLTEaSbCyzaqOSBFsWk+4IqpcPMGZkMjKbPW9TpATDyNYYluh5nMZ2rxN9YFP3BheMc2mx2tp7J+nNVJYvNDFtEwqUlLoZ+cog7GSHfx6iZmZpENsQstJ68EPQpzccWIgfw5kKisHy+VT7nBi2NEvhg6vhGL+RdFpv2ac1Tagw7xwmk2IqaBbxiQPc+oNMwIVNX4UAg/ZX+0h5s8Qlapuw3w4EkBZ65vkao4Uy7WxRjg2FHYZh+L/+XD0SceSrEJ//8un4Cg0bC8KKnOq/SMSAC4HCrzHNpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(6666004)(66946007)(31686004)(8676002)(8936002)(5660300002)(36756003)(4326008)(66556008)(66476007)(110136005)(54906003)(478600001)(6486002)(316002)(41300700001)(38100700002)(82960400001)(53546011)(6512007)(186003)(6506007)(31696002)(2616005)(83380400001)(86362001)(26005)(2906002)(15650500001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk1lRzQzTWNzYThObVJGREZNaEpYclpiVmJZcjZuNWZSMUJvbmhLdklZdSs1?=
 =?utf-8?B?MXhhdFhyN1JvZE5LTm1QYTNweEFBQzNaSVRCWlQyeFlIOTdoVzJrVCs5aWZI?=
 =?utf-8?B?cG9KVEg3KzZNeThBWDNXU1J2UXNFc2w0TjdKUGloaERSbkNRYkdaeGw0aUov?=
 =?utf-8?B?T29DaTZscDhueS9wbGducWhRajU5eDU5aVhJT2JsMnhWdk5LRWNmUXQzVEtE?=
 =?utf-8?B?NGZNVEh1M1NWYlFqYUx5SVZmS2JHdlZIZjJtaS9pU3BocnVSckM3UWdKVnZB?=
 =?utf-8?B?dnBWVGRsWWcrMEw1a1dVRUxRME9oR0lpQUJoT0dmenpkazBJby9LRUJBU1Jr?=
 =?utf-8?B?S2RleVRZRkJERTJWRllQOWlKaUw1Q28wRkgwVnpQZFp3bU5kOXhOckN5WUR4?=
 =?utf-8?B?cDdiaE1MU0g2R2VQQlpLR2FnNFZpRlptNE5Jd0VqZHlEQ0RkeiswdmxaV2JL?=
 =?utf-8?B?bE1OTHo2VzFzcWh5WEI5NDB0bVc0c1NWWjVUK3NONXE0OWUyd2NWTkhTcWtu?=
 =?utf-8?B?Ky9ISlFWM2pSckJWeENyeUJ1ejh6d1gwNFN5eHdma2lkT1dldmpGbThCNUpj?=
 =?utf-8?B?SWkvYUw3dVNmMU1xdzYvSEFlQStDc2xrdXA3NmVIbTFBSU52WnFsejB4Q09I?=
 =?utf-8?B?aXFYY2drU0pRMXRTdlN4OHBuZ2lnTnlIZzZDaE5Kb2EvWjY4LzFwZVlEZDcv?=
 =?utf-8?B?b1VLb3B1WGhoYUMvMzdKRVMyMEx1VHpUVjVGdHFuNVdjM25qOVptdUhhSk0r?=
 =?utf-8?B?d05tRi9McEF0VHoya2V1QVQybGR1d25PZ3lKMVBZN0VMNXlqQVkvWmlId1Q0?=
 =?utf-8?B?ditLR3g1aG1EK1loaWs1RGpqb1hsbVVBbUU3alZXeXJ5VGc4enh4RURIcDJm?=
 =?utf-8?B?UGJVSnJPWURaYTU5aU5CeWJFNmpzVDh4TG0yeXAwSXdZR3FwTVBHS0h6RDBM?=
 =?utf-8?B?cmwzdC9oVlpjUE52K1hLMG5GMXJpY00zWDF2cFc2NHpYWWo2blJYU0J0WHVr?=
 =?utf-8?B?VEREU1VtSjFQdXdwTTFZSjZMQXc3SnVVY1V4OXZlc1k2OWl6V2oxZXE5eE01?=
 =?utf-8?B?MCtrS2pyeEF0V2FwQXQ2SnRLRkNvVmhvd2VsWHFnSEZqREt4ZWlNNEY0Zith?=
 =?utf-8?B?NG85OElGaW5pczl3Q0lySVFQME1tZ3Y4dTRRTnlLZHFWWlJ3SDVvM1VRZEY5?=
 =?utf-8?B?M2g3ejRoVGh3T0F5dGxxM0F1c2x6N29SYStzYllnVW92L3RyK0hsNEF3MUZm?=
 =?utf-8?B?TXZHVmo3d1dySnR6d2hnUXM1YzJSM0N1Z0Z4OXpZWThjSUI3d2lJYkhEbnY0?=
 =?utf-8?B?Z3B2Vmpyb2hEcStycEpwVzQ5dy9qUSttTDlpNDNNN1o2U2RCMmJ6QURTeFJD?=
 =?utf-8?B?bm5INmVJZDAyRmJIa1BjR2VmWU9pTDkyYWt5TmxteS9VYUlZblhudHB5RFhY?=
 =?utf-8?B?bGFYUXl4UEVBYVdOS0dtandZSEs1UTFGR3p0ckZMSlBMSkdZOWxRVnF2STB0?=
 =?utf-8?B?amY0NWlkT3F4dXhNbFNocW9HcVdadG5lTDQvSTk4Rm41TzdwMUNZcStlNWph?=
 =?utf-8?B?SjBhWS90anpaUnVlYlVBN25jWGtoYU02b0VRR3Nkdmc2aDg3UFJIRElJOCts?=
 =?utf-8?B?SGZpa0tNaG9VMWdJRE9nV2tyTGRmV3NUaGg0V2p4OExxZWR3U3BKR2kwcWty?=
 =?utf-8?B?Zm9vYjVlUjBJSmszaU9LQi9OSERZejZET3RmcTBlam9tbEpVQUlsWHJiWVFl?=
 =?utf-8?B?NlpvODVIZUpjQ29hbXZGYTVFU0lZaWkwYnliVmxab3B1NTg2dXNQcDZXZzdw?=
 =?utf-8?B?dWh3cDBheTVCVGlYV2lSejNTeTU4eFJLZHBtV3Z2R3BFZW1xUE9DZDBTWHZm?=
 =?utf-8?B?WnltaFVxeEV0U2lOS09reGsxY1FYSG8wMGJlYnp0N25nRkdBQ0FrbG1LSTZX?=
 =?utf-8?B?d0JIUXJpU3VPTkxMVmh5cC9XNTk1Vnc2WXExUFFCV0xTdkc0T0N5a0x2Mk5V?=
 =?utf-8?B?ZW5Xcmp3VURtMlJJcStJYTZNWjlCUzlXU3BxeDV5eHJnTlhQd1l2dGxReWZQ?=
 =?utf-8?B?ME1TUEdkVkFNVUVCZ1dGM2xqdC90TktYOER6aFdYc3ZwWURDelVpVWpKK2dv?=
 =?utf-8?B?NWMwOUtQa0lXK1QzZFNvVlg4U3cvbExmS25GdDBISVdUQ2FuR2NZRnN6OXlS?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vMa0qCvBBTFBXPkQsEoFtyDmZlP2/bFfYgXYtY1RoX2N00dtYWI2dufvg23TkgdaUz7pUv4oB9AQsNL7945/VbTjTYxuFQe2d6AMNfTifEUZGJ8BGbzGhJnt4VUvwlaFbARWwt+bYorpLYbm9ve2XRSiFZJ54ENYf98bZklERY3ATOMesysQTlffi9tRsOhZPmA88lhPQ01j5ZnxQ2ZhvdVu46OplLod/b8M/zLaE5RkslyR55upg83FCKAKbuPl5xErFJ6gW6ymZpfBMStyL95GlKlO9AzOnh1+dgsWkMWq3Nt/WDaUnbzSfjbwz2Z61tXhOmV3WvDT1j5Ok4acgIjZf/p1tewkWxyypAwkeqRXy3Ofo2Os6XhRUNY1/FIMI/vnsSVRM1jFxnfoZcI0yrmaW5U9WxMXyxSwFgpTBLEevXoUbpbAx/CyojCngSav7VmsUqG0NaFvrqCJHwjktSQOwGtKAR465ry/+YSmNcWXTHFbySaw6qP4y4ALxf7SST6EFVUwlRkFO6hT8mnc3syByZHA0qsYzyFFEYN/gItLQP8ykW0ZhDCc4+gSmgBTY1SSEVIt4LVeSG+SsfCoro5n2hlXID4XG/JLcYxSwKaBjhbLtXvp3wHRCxVrBYEB1lku2BOW8rnFXXKVAuZDDFYY8Sy9z9CoY/IdMwr/97wzrD+Xvkg1De+B1cS9xPp8rhmd1TCK/OeqqEYqmpaiSnyeb03HBUot6Fld59w0Hq6xtVwNYBlwYZthbLRdmD6W4K/OAfkb2K6sQ7210KUU3ZxpNDr0JNCpAd64o0IDPd+YzFHAxf1WFt3UdbCYUH9iE89WNlrgAA5WmK8NiBIHQLKWBR4IX0Uav3DMpZny2q0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6dad16-0dfc-43e0-f3f6-08db6b766585
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:54:06.0603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETVxEh48+wH/t6Yiyusxq3R0ULIyhptlA/LFqvYUz7DAopKI5n4VSaWDOTo+wLdf14U+0a8xyKcMpLFw+I6KRDQUs3bv4pvXEZqsBgELEAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5388

On 05/06/2023 6:08 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 4f60d96d98..a4c123118b 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -871,6 +885,15 @@ int __init early_microcode_init(unsigned long *module_map,
>           * present.
>           */
>          ucode_ops = intel_ucode_ops;
> +
> +        /*
> +         * In the case where microcode updates are blocked by the
> +         * DIS_MCU_LOAD bit we can still read the microcode version even if
> +         * we can't change it.
> +         */
> +        if ( !this_cpu_can_install_update() )
> +            ucode_ops = (struct microcode_ops){ .collect_cpu_info =
> +                                    intel_ucode_ops.collect_cpu_info };

I don't see how this (the logic in this_cpu_can_install_update()) can
work, as ...

>          break;
>      }
>  
> @@ -900,6 +923,10 @@ int __init early_microcode_init(unsigned long *module_map,
>      if ( ucode_mod.mod_end || ucode_blob.size )
>          rc = early_microcode_update_cpu();
>  
> +    /*
> +     * We just updated microcode so we must reload the boot_cpu_data bits
> +     * we read before because they might be stale after the updata.
> +     */
>      early_read_cpuid_7d0();
>  
>      /*

... MSR_ARCH_CAPS is read out-of-context down here.

In hindsight, I think swapping patch 2 and 3 might be wise.  The rev ==
~0 case doesn't need any of the cpu_has_* shuffling, and it already
starts to build up the if/else chain of cases where we decide to clobber
the apply_microcode() hook.

The call to this_cpu_can_install_update() should be lower down.  In
principle it's not Intel-specific.

~Andrew

