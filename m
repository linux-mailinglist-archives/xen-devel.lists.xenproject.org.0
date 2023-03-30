Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2309E6CFDD5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516445.800525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnOA-0000z5-7a; Thu, 30 Mar 2023 08:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516445.800525; Thu, 30 Mar 2023 08:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnOA-0000xD-4b; Thu, 30 Mar 2023 08:12:06 +0000
Received: by outflank-mailman (input) for mailman id 516445;
 Thu, 30 Mar 2023 08:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiWc=7W=citrix.com=prvs=446b09b9a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phnO8-0000x7-PW
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:12:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b3825bb-ced2-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 10:12:01 +0200 (CEST)
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 04:11:58 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS0PR03MB7179.namprd03.prod.outlook.com (2603:10b6:8:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 08:11:56 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 08:11:56 +0000
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
X-Inumbo-ID: 8b3825bb-ced2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680163921;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MU0usBNDTJED7Cf/cXCCqhllQlDJS/e3zli8TERfLhE=;
  b=QRwWD2+YgOr+/dsN96sxNMd+xHQxrTOWT2oGZKT9Dk73kWWzHkbFnuvc
   OdaFZRbkJx2i3b4ULmOi/nyy6BLuYvKEQDB5t/W2kF81GnUTyq6xmLTKi
   P00FlsmtytTcNdPd6th8BXvuAtGTm9wnAdtmcUQIay2zAUtBUqwcIwIkF
   Q=;
X-IronPort-RemoteIP: 104.47.73.169
X-IronPort-MID: 103666968
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mK4Nqqg0QS65zgROS29Pq3+zX161uBEKZh0ujC45NGQN5FlHY01je
 htvWWyAaP3YazGgetskOtyz9x5T6pHXz9VhGlE++X88Rigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wSGzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQZLDEKQAiyid6o0e7mGvBcl959dujSadZ3VnFIlVk1DN4AaLWbH+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMqluGzYbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjA9xMSuzmppaGhnWf/ElKDiYoCGCU+6GhzRSQd4sPN
 04tr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLR6hycD3IJTRZAbsInr848QTE21
 l6PkMjtDDYpu7qQIVqC8p+EoDX0PjIaRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ihCQ3gbQeiYgI1r2253jAmTunopWPRQkwjjg7RUqg5wJ9IYu6PYqh7ACH6e4addjICF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8zWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:6NHTjK/6WX70TyoryUNuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103666968"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZP7qJHsdyu2xRsPuTu271HV2T4rchWM1tdAW8UJ5XIt6iLpIFZqyXXRaMd4q02sAdZzLr/dQZkChLC8bSpFrAqsj5gCuA0mRe4MqaQ22uLI291qPJhQ2EeMi1YFLaw5Yjv4a2bRhdBkJW8CkmjFE7ZdbYeY9swXoDb+COYPBrMw0jdWSK4ZNGnv6br7eJR8mg1gj4Hjy8QeRE+7I/lMlQVyl0LFdgVaa5RYFoCmfIS7do3FBAYs1bf8rZjrAiyEMyMsQUvPg5HzsYUFft6srwkSJsUHVtMBJ4AugXnbRKJU2euP2PMOsDFbwjUfRKrvqcrvEHOCnOCXGHyhhOUJrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ef3h2gItN7P1uFHlt+Kh39HupcPMIiv0y1HghsB730=;
 b=I9Hlnk1r/5n4NHTEoyHO2LTMoy+8K4LAQKDQuiCdRgXspnug2Ks3HgGWYazkAQ7F4WLvGMJ8UpwvfVFeoUQuO3g99SzmqdgySM4yiHYJdhH86FTyfJs9JRXdgdhNQKxl9mnqwNW5zV4rxeVOX/c2SMFpvGPzGuw3EphSWI1jMR+44GhGSxKxrOLxLfY/DDMjR49GDoggaFGw4bDBHoVNLfsJuiv3/4VS5sDEGg1rUGMRn2I/n1TStBWq/grj6m3Dw6OjIWQD3UIDgpOHvowBTODkvZONBjEIH6KICwLd161w2UDx1G36T6mec6cDZIJrPS63/WgqyQ/BIROPvbdOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ef3h2gItN7P1uFHlt+Kh39HupcPMIiv0y1HghsB730=;
 b=A9pmrP1T2lxnscc12P7J0v37rvnkoV/8c0B1Jz/lj6evV5V0PRQEZ4qdfFTlKgwlnebB9IdjjcrL+yzNvc9WklQ5M4VzuyUbuP9XgnvGsHZiGe+evccptz8UFQMSri3C7VRI/CuQhE2LbqiowkBCN/8U/lmWEAERhIPgyAn3Erw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Mar 2023 10:11:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: marmarek@invisiblethingslab.com,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 4/5] multiboot2: parse console= option when setting GOP
 mode
Message-ID: <ZCVERoX9+LdQ/GIL@Air-de-Roger>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-5-roger.pau@citrix.com>
 <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
 <ZCRnU03XDCpqZQ5u@Air-de-Roger>
 <8fb2f771-3354-3f52-f923-e7fe7861cfbf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fb2f771-3354-3f52-f923-e7fe7861cfbf@suse.com>
X-ClientProxiedBy: LNXP265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS0PR03MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b6ee9b-25f2-4de5-5ae1-08db30f66d71
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MlFGQLGb2soFzesxMfgtQw/a2OJYRWaURd63JkatVEC9Pb9XLsRc2OJSXpb//05LBYPCT316qV/Y/zCCuLOpe7qtC+yyAbfFOPhOplCni0qaI4LPIEKqcY0+d9KjMuu0tqW//UNl1/93LKDVqv6t5uTqlh3bfJy/sOqfJxMQeyaxAxFepgTLqSPE3XSOQPAdeNdUb7WkCZ2Tg3vHRrkGKZuDJ0aFMaIglLXvZ7lTyTOxiUokUfwpp1BCPKLgnaYJlcs4QlZpqcWF2p68nEj8s+d7Dv3Yn1uqHI+CNzUDhrzK+OPrFoKdA7MjDK3AboveGlMY1mTS5EduRlPhrHAWMQTF2LXIqVUnnRxnrtyt42ulti/VpSx1+jgBotN52WFwf54+5C8QbgLDq7OfpDZWPXcNXHt+tGfxzXX35e2i7LxyWJ+P1zZz4z7IDkoHeE6ab2frJOKWwzo0JCGj/bJp3Qv/3ALwgPx6Z5MgsBWOoU6GunA/d/lyqC6LYKQoD5JCZOLJGlcXJMpDmHIyx05JBpJPfcYjtS7or8QP9/8p/FWAIS3mJCvXUo+KrUcdRIIv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(26005)(6506007)(6512007)(9686003)(53546011)(186003)(82960400001)(38100700002)(41300700001)(66476007)(478600001)(8936002)(5660300002)(33716001)(6666004)(85182001)(4326008)(86362001)(6486002)(66946007)(8676002)(54906003)(316002)(6916009)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnJJR1Q1OXU0dzh1UzNPbTR0OStwWm4yYXF1NGs0WU5sK2pKalNuRVl4K3dY?=
 =?utf-8?B?V001Y0wvUG1CSjZrUDBnZWloRWlIbXQyYjVmS1VyVGd5NEdDMndmM0dWcVdI?=
 =?utf-8?B?UHNuNm1Pd2FQcytsd2RuM1AvUm1RN0UzQy9jVEtVeGVYRXFvbGI2M3dpRnN0?=
 =?utf-8?B?c3ZHVCtnNE16ZTRvVDkyTkFqV3dITmtaL1NVV3ZHbWRzRHZic3o0OGREYytr?=
 =?utf-8?B?TU9FOWJKR3BuaFZoVU1qTjFvZ1FzdnVBNGhXeVhCS0RlWHAwTFpnUitjMlRW?=
 =?utf-8?B?Y3VSWDRWWGpJalMxaTBPSEpWT0R0S3gzNkFzemFyMmIrMnVRYWJPMVRpK0VP?=
 =?utf-8?B?QzBtMVVtc1FpY0srYzd6b1Q0SWVLY3p0TzJnWTZNWHFXZ0plaktWd3NRZEE0?=
 =?utf-8?B?eWIyYlBIcFAvaG5JcDdWR3JuSFQxT2JEcEFDWUdYMzgxQmRITUd0TXhjTFNm?=
 =?utf-8?B?bWNvYkdHMFNXZTdEZVE3U1l3QndlN08yWENXMEF5bnlrWnF6OVRNNzRmQm9I?=
 =?utf-8?B?d3FvMEgzSFRZSVBKUDFvdXptSUM2bnRYWTVZYmhYNzl5bXhWb0p4SjJiLzdw?=
 =?utf-8?B?WU9qMjlobVQxL3p2dWZLWkQrNDJycGhIOHlWQ2EvSzhDOS9BV3YyR294U2JY?=
 =?utf-8?B?WEthWHZvaXBQSmdBQmh6Z1ptZlF2RVN0c2FxOFlVbFFMVW82cXVpbER1bDhK?=
 =?utf-8?B?SFNLbXk0QTBOZ25lSzZ1ZzhnY0pTaXBLaTFNcHgycVJHMEF4NFFzTENxUW5q?=
 =?utf-8?B?VlNXOHlWSUNEdTZoZUllMnZwNmJYNUhHcjFGb0ljRUJUME8wUUxpbThhQVVx?=
 =?utf-8?B?MjFtMTJ2SHdYMnFadms0aFZwRTZTMDlJWDNZSlVpY3FXMURldWlSRkY4NEZ3?=
 =?utf-8?B?VStvTThWQlRDYkFTSEthZmhRY0dtWGdxYndBd1lKNWNQc0lyQWwxVUFGTldx?=
 =?utf-8?B?OUNvclBDeG5PaGdRaU4rRG9LSml2dDhMNjdhcVI1VjlDd1ovMjc2Rm0zTStC?=
 =?utf-8?B?a3BmNHpTMUhLR0tQanNGTjRiaVVMa3VEUjA5SFNGS1d5cXVEYkcwZE00WXBr?=
 =?utf-8?B?c21BcXl4em51RnlkRitleS9DbW05eEp1SC9zVjFhZTBlc3hldGlMd0NWL3E1?=
 =?utf-8?B?OFhKS0d4L1huMnNnVnBJMVRFL3duTVp0MGh1b0k2ek9NbDNzOG02bEd6VUxk?=
 =?utf-8?B?L2FqWkdJUHJaek4rZXJkM0oyWXJWSDZLdFFGdXcvb1FaYXo3dHRFTGpILzBw?=
 =?utf-8?B?eWZDdVprdmJhVk5JNVdqM1Q0MlpMa2pIbnRvNzJwK1hjSFI1RThmVGhFdnZ2?=
 =?utf-8?B?ZzZHU05IMzhKTVA0S3BQamxGUHJhcEp4eHI3K1loYzhmNFcvangzK2RzREF1?=
 =?utf-8?B?SzZ0aE13NjMzQ0N0OFNGNFZsWmMzM1FIZUJtZUFINnErdUpUYmcwVzg3T1dZ?=
 =?utf-8?B?VzJ5OHFaR2NOTXJKWmRGa0gwQ1BnTXl4cHhVTUxsSGF0bVYzTnB3RFdLd3pm?=
 =?utf-8?B?ZkJvdHRJMFVDdnU2emI5OTZRZ0gwN1Uxa3h5elhEbFRTOTBnSThJNHZ6LzJt?=
 =?utf-8?B?UWZxeWI5VTRUVGF5NUZMOVNQTzFKTDE1bUdheE5hMHpYMnZBb3lKQzBFdnZK?=
 =?utf-8?B?WUJqUXJIVU5lY1lYUkt0K3dGM1FHbjI2NlhFSCtLczcrRnZucnZVeENYUEJP?=
 =?utf-8?B?di9CMldqbzRLVFhoYXpHdGtBQllxc2hmQktVblFCUWswRXg4bE81VDBucVdS?=
 =?utf-8?B?VTBEeFBVL1EzUUNOL1dRSmVXRUJGWG8yL01mYnV6OHA1Q1ZLck9VcklPdHNp?=
 =?utf-8?B?KzA3T2lpTVVwQjdCN25FeGVzS0cxTnpWeEc5Q2JDUGQvbGhnZkFuZ0tDT0Vq?=
 =?utf-8?B?ZENpVTFNNWo1aUVJK2p0eGNFcHlXQ2EzYWVBeTJHVDVuUXJ5cysyeFFwR05V?=
 =?utf-8?B?YTZhcHcwN1VJbHdiVm8wakd1ODM5QUFkcnRwckVZdnQwdlNaTnlqY1drRnVk?=
 =?utf-8?B?Y0xKS1FUQXNMVHBXYkRJUzdNRG9Ta2gwYXZaaVBmWXk1MlkwTjFFNUFzUUNX?=
 =?utf-8?B?V2ltWkl0b1AyN2lsTHJqMXRqejViWTRmbDBGWUVneWw5b0hPT1g4QnFOSXpx?=
 =?utf-8?Q?Cz/u6UE+NfCUIGwPSMuYvn2fK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BygFwxXkflK71ag+LjJp9x/BCc6uq3dlgev4VjZjGyL7UjYeEOqbDTFa/QTgQbZwTZKTx6ChT5vhMaIc8V3LlEo0R7Ok0vP5LKPPJ6cdbuxNnAmTDdoAcq+0l01d5V6S01Idbo70Gg44LlmkjhVPBwtrJFOtTA1ckyFHhMFwrSAVoL6SIo9p8oGyib4boOXflF9JTGzyYy131AFY846TWx91fVqJwdJJ1jVEQr5UiBEwFKQYAFnPUeT/ETJ+omSRWoyXxYhZrpiYzfAgVZGzql5tcdikEaukFp0EbhK2SH2Q6HwNXfXIwpnhU6FFLOoDLgZASOsl6/C9kEIBONfv2+Y6EXNOcrtvvlrfRQ8zv2PWn7iClmCLBWRDc+E76srAZMCpSD8oGsdu1z3g/bJfyPkqgHLM9TcuFVIjs3+5qnwhMAnyNvDDREjL20t2I9mpf5EXAzhHROiwJIgzAR4iJ7Eq5ODieiHmF78QNl5JwFUMwXi2NW5vQZmdQTSF0XR+KE8pcZSlrOGnAqZRRDcEiRaPcRhePYwjZt2Dazh3HxrStvfsxAUammr2yyHF/Eg7Jz1+aHi8yMCn0BOUp3yEADhkD7Hw/6HsPaLoR39GbiwLogqp/Ksi2+mAZKh3j+2VvoSShtPMSgPPR/mD8zzbjKZjtGSZsR/rWlXQRUrP2LhTyU51Jsd8vcXE3WkrRzOAVNai7bhAS2btmgnb0cJNyT5edzM9byzU8NNmoICGhptsUG9q4qFee57OdVxHlK2n3TUq3ByKY41cBRChzFJ/8j3v9fLIxmpuwQSQdgdVjB+vhQBdWB4NYy+cLTl/1EJrDRcPNTLZD5KB+A+D8V82tnFD1MG/VHGk36t59CqTBA8GqW9TXBgrrPJjNtfBhmcBc72pQUJVrKAOqO+gWeGh0MWDOWSMrzS4EZ4hbdq2n7A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b6ee9b-25f2-4de5-5ae1-08db30f66d71
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 08:11:56.1946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKtGhE2ZGYkRq2WKDfY8svfjBpvRCJCjJE6Kn1b9+ATV4mCFSX1RMXnJZVIx7FM5pkcG/HOF30OOLO3t6CLoKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7179

On Thu, Mar 30, 2023 at 08:24:20AM +0200, Jan Beulich wrote:
> On 29.03.2023 18:29, Roger Pau Monné wrote:
> > On Mon, Dec 05, 2022 at 04:10:28PM +0100, Jan Beulich wrote:
> >> On 23.11.2022 16:45, Roger Pau Monne wrote:
> >>> @@ -265,6 +266,15 @@ __efi64_mb2_start:
> >>>          cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
> >>>          je      .Lrun_bs
> >>>  
> >>> +        /*
> >>> +         * Get command line from Multiboot2 information.
> >>> +         * Must be last parsed tag.
> >>
> >> Why? And how do you guarantee this?
> > 
> > I think the comment is misleading, must be the last checked for tag in
> > the loop that does this in assembly, because it's not using cmove.
> > I've adjusted to:
> > 
> >         /* Get command line from Multiboot2 information. */
> >         cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
> >         jne     .Lno_cmdline
> >         lea     MB2_tag_string(%rcx),%rdx
> >         jmp     .Lefi_mb2_next_tag
> > .Lno_cmdline:
> > 
> > Maybe there's some instruction I'm missing similar to a conditional
> > lea?
> 
> There isn't. If you want to get away without conditional branch, then
> you'll need to LEA to a scratch register (unconditional) and then
> CMOVcc from that scratch register.

Likely not worth it, unless you dislike the extra conditional branch.

Thanks, Roger.

