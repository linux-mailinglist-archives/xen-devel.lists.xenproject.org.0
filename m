Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D607813B5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 21:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586516.917775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5N0-0004hc-Td; Fri, 18 Aug 2023 19:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586516.917775; Fri, 18 Aug 2023 19:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5N0-0004f2-Qa; Fri, 18 Aug 2023 19:42:54 +0000
Received: by outflank-mailman (input) for mailman id 586516;
 Fri, 18 Aug 2023 19:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qX5Mz-0004ew-LJ
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 19:42:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69b5fa3b-3dff-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 21:42:51 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 15:42:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5798.namprd03.prod.outlook.com (2603:10b6:510:35::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 19:42:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 19:42:43 +0000
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
X-Inumbo-ID: 69b5fa3b-3dff-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692387771;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V8ebfZtuIkfEJ0Dp+1DtTUHn40roQlWG7LfYvdzPDg4=;
  b=WSrnZZHPuEFYJlfkcqg0Awor+pkwPxPphxqjM8jlAPimv9oKk6mZmaO6
   nM3Ofnt9APYQgPFsieBjKf75+NkyFo66MegGZPLC+7dNN70X0WmXGQ7Yz
   qNqts5bgDHz6xTBdMC/CsZLVBNgCPUnFOZUwtJI0EZ+xSdYxNDuKYS8aj
   Q=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 120369544
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:P0CDxqj4T4KP2S49ooruJOQoX161pxEKZh0ujC45NGQN5FlHY01je
 htvUWqGPKuCYWOgLtonbN+19R9TupTWydNmSgBvr3w1Ri0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AaOzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQRBjIhRUuvwNmL46CkVsluvcQBAM/0adZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGyb7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TefgraA73QHProAVIB0faQGrucKfsxa7SvJnG
 1RT9wo+vJFnoSRHSfG4BXVUukWsvB8aXNoWEOQ850eO0ILb5g+YAi4PSTspQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9UQAFIGlHaSIaQA8t59j4vJp1nh/JVsxkEqO+kpvyAz6Y/
 tyRhC03hrFWhslS0ay+pAnDm2j1+cePSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOvxjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:9ElJpaDxkAuOn1TlHemT55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG+c5w6faaskd1ZJhNo6HjBEDEewK+yXcX2+gs1NWZLW3bUQKTRekI0WKh+V3d8kbFh4lgPM
 lbAs5D4R7LYWSST/yW3OB1KbkdKRC8npyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3Axw7S1GuZskt3AQfUBT0wqf2J6IssXH/x5yz8ZHS?=
 =?us-ascii?q?FKnR2VJ2Xcl+y1KV7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AD4yimA++G9WGSlX78kflh4OQf8dh3/6+EHsrqM0?=
 =?us-ascii?q?Dqum8BTQ3NheNnQ3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,184,1684814400"; 
   d="scan'208";a="120369544"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEtYWM/KJ5RFLDdjHks+UlsAmN95R0ThPB9jT/q6y8546yCj4/ooUYCliZP6/wpWPzaZmMNpsjBvGvJVlmITqqHxZq5nkoknPA4ksyz89C/kzplvyAqIVEn6nz7niMlYhmgAThMme3xCLVhQnDkV2yTQ3kUizsvH1IILKCZxrhct8o5ytYVgHvt2x2yTiB0D2erALWjhyALotRvVmHOY6LHMNF0vxgBa2ADrmnvm4Ud1Sf+eKcGpUQ6FgOGeqMhlSiS4d/hj5oxaZ7KMHf9K5lIyCTP5FtfWCf5SlzyRDoDb31bh330Gu9vPiUVV3HlBGBBZUlQ4f8Iwo9M+yAxjZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8ebfZtuIkfEJ0Dp+1DtTUHn40roQlWG7LfYvdzPDg4=;
 b=gZAQrNWaAt4FuS6R4Ot+Idu/6SXPopd0gkjNEEazLPFfz3CezVLK/OUw/6ETwlQ/1jnMhNTJq9O+/MLyd3Lrca8mIBrLGCyi6L1SWTCUZltO9hyNi29euBdubjKYKZiHPiql2BSbNU+y6iQn4XV89xiskHNVrH1MPrMdNXByOUDkU5ZgdZMlAG5UamuK8KFdl7SdniD5G7p+ASMiKJR89+I4JagOPwZ6lFMu0mnTU0j/swEgFcn8JXaByHkLHDVxYAi+yI8KZTe1Dgp3X14cAOOueyZ+EiBtWPkz9X6ufevHDgYfxIu57HiRiBWMIs3gIm7vrM7JGjYB/3oZyw6Z+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8ebfZtuIkfEJ0Dp+1DtTUHn40roQlWG7LfYvdzPDg4=;
 b=IL2I+ndZAq7Zt+hgSbHVN7MFpuH8x/kNaH0T9WiN3Fn8KwGeTtuYEyeHLegaLQnDvCceJ3sglb+671KKsZh5aDUqd4Wn88OHnmu+GUxfSxv2YyhYUhwLwBaCA9xtfYVyNE3l1vBDW0iljo3j2NRFS7nUQGio7Nm4T3gdSkPpxIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <292e7e21-cd7c-ad2c-06d2-c07e5941c776@citrix.com>
Date: Fri, 18 Aug 2023 20:42:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: invert valid condition in
 svm_get_pending_event()
Content-Language: en-GB
To: Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <0a8fabe0-3741-ebc2-d89e-cb3a849a2683@gmail.com>
In-Reply-To: <0a8fabe0-3741-ebc2-d89e-cb3a849a2683@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3281e9-ab31-4340-5965-08dba0234925
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E+789JqgmAQB0yEpNGvQk79vzemhkSUdpQ+oL4XGcMOaZE592KiXNqzryzsCFnc9ohdlcqoiPBdkaZEop52pq2zV44lSEeUgbjPiXlp0XrkTcEamd+hgJGyGGnUfijb4Vc8ZyzSh8anahUhOCkKtQ54r3w+YtufmAlodig35H/57rFeJK4xZJasM0bwaWBKaayuWpIwgh8oRIVdaA43W9RecKexjqXuzh9JQL82EefKV7uaezN1cK3+5Kvkfv5CPqdAvkvn1WervpdeVWRU6a23Qt/3lYXq3YAmfgE1KQwxCj62twz6MwES2Pv2YxZ55+nm4cYhmmEW4v657vNHczNMGkzU/yGX2HT/SGX05m/VDG1O5yL4nboeUjPyBx67y83HDRMBegXxPCYZts/WCeQA4sXSmDZ3HhQbYGK755GxZ+urujfqKAao+EqxJKC3Edn9BdPoMcRNNtjrPx1Se7GiGUye1VnXYNHYo3cwwMxBJK+NG/bDIyr19XEfTbJcrcUfzp5tD19Eih6vgy6PH6h7hZ1KILtO6Jyaph8qgvUPibw0eRpV/bqUu9WhgmlhbaJ+k2nfUPr3C41of9PGiOtQdPDgtXy+n7CRvv+rYhaQ0uBQEoJc5KfCouiR7+PPhXu484D3MSbQPTi1TM4ri7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(1800799009)(186009)(451199024)(6666004)(6486002)(6506007)(38100700002)(6512007)(53546011)(82960400001)(31696002)(26005)(83380400001)(36756003)(2616005)(66556008)(316002)(2906002)(6916009)(54906003)(66476007)(66946007)(4744005)(41300700001)(86362001)(5660300002)(8676002)(4326008)(8936002)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWZZUHF6RitTaUhqcytBejJ1K0QxcktVbit2VWFOMGJEeDA5SkZUQ090elU5?=
 =?utf-8?B?Z1VDc0l6NEtVTGpEMkRYV3NHUnRHZERxY0pLWlhzaHhkaHNJdnFuekNPZnpJ?=
 =?utf-8?B?RzVFWGFJNEZ4SWpNN2tiRTlPQlNPN2Vza0VCTjRHeTFoaGplRFk5Yk5wTUhP?=
 =?utf-8?B?YTRyVGlkTVhJbkpHWVI2MEJSbERDZXQ4aVRDbFh3ZVY1TmhxVTU0bGRUOFpk?=
 =?utf-8?B?cHVjdU1CV3haRG9QV2NEaHA3QzcvSUNGRXZJdG85T0U0b3RtQ2E4a3gvSEp1?=
 =?utf-8?B?bTR0cm04NVV5YTQzWlZ4eURsRng3aUNRT3F4VmFkcW1vYlNoc280cmVCaWFl?=
 =?utf-8?B?WEZxS2dJT3dtVnR6QTBSK2JRZTIxUEtmM1U4azV4Y05FeThqMHdwOGkxMzEw?=
 =?utf-8?B?WDM3YU5lZXRKTlEzY1JITys2aVg4UnhJZzNTOXdWVFNGOTJRalVXZ0ZOVDg4?=
 =?utf-8?B?enJpSDBNUFNqeUtMQ0VNMGQxaHh5L0VybDl3aVJLMi9vdkxOeEFxK2ZyRjF0?=
 =?utf-8?B?K3pKOUlpNVE5dHUxd2xQWW1lWUVJRUZVVVBjMVVGMXVFOWVNTzcwa2cxaG94?=
 =?utf-8?B?WWFNbkU1UGludW5DSktvOFNNaDM3U3g2MWJSbnFWdU9pY1ZWbkRubVk4aGd3?=
 =?utf-8?B?RXE3b0N5NTZ6S2FlZTN6aXIrS0psNG8welFlRXYwdHhTTnJ3OGdack9ZVEJp?=
 =?utf-8?B?ZHU0bjJNb1ltY0EwWmZNci81amgydkhTWHNOWG0ycmJBYVBaMHN5ZjB3L2o2?=
 =?utf-8?B?UExlRGVIaDd5ZXdjK05MeTFpYklqUmI4TUN4TWdRSC9seUdPendNT1pwR3dB?=
 =?utf-8?B?NUNUTDZ4WVdqbkJSS3hVeVQxK3E5ZERrbWNGamFxYTE4Vzd5Y1FnTXJZQmZj?=
 =?utf-8?B?azlpRnZldll6M0VSZWdNdUhmU0twK2FzeDdTT28zRThOczd3NWFjZlp1ekJG?=
 =?utf-8?B?alBtZy9kY2hyVk16QzhRdUE1MWlNSmhua2lWZTlod0l3bjBnR0p3T3Z5VlZF?=
 =?utf-8?B?OVUvZlllaG45b2FBME9xYUJvdlgrSlUwY241YW01dnQ5c21CdzdtODMrZ2lW?=
 =?utf-8?B?L2VFZ0dQTnorS29BdVhMQ1cralBmZ1NRcUdTR2dxaVNhTmdLVUFGeElnckhX?=
 =?utf-8?B?M2xWUi9CZFRKV0VYWmpuWGw4bVhqQ2ZBMWtuSDZEcjhudFlmL0hoeDQ4YVh1?=
 =?utf-8?B?dEE1b2gvdFMzZ2pjaWFNaUN6VjliLzAzZ3czd0IxWWJka3Y3cUpYSHhQZjNh?=
 =?utf-8?B?bWk5YysxNkJYK2ZNQXNieUJmZHFIcFJhSGVTQlJXckc3M2NzTDJZR1BUSm4z?=
 =?utf-8?B?bm9ZSFZ5R2JLUEJobCtEZXp5c1FVeFhhK3VrNUZyNmlRaDVNOTlVSDR0UzZz?=
 =?utf-8?B?dGlGdzNMOURXcUs5STZ0d0VSbWhBOER1b3JIa01sVlRNUUlRSytVTGVxZ1ZQ?=
 =?utf-8?B?eDdXSG1TNEx4VnhNYTIvTWNKdkdySkJkK1hZL3NNZ1NSSVl4Ull6MVo5TXNM?=
 =?utf-8?B?blBQNE9rKytub1NwckhRTll1VFRaTzR3b0haSXIrcjhXc0FLbmFnYVYzdjF1?=
 =?utf-8?B?OWVRSi9mL000MjJ2ekJqUDJUaENkei9wc0daQWUwUldzMG51Vk5ha2ZZUDRw?=
 =?utf-8?B?RjZjei9pQjRLRFcrVkViWCttUW1vVVV1V2c2YzlXd2paS0kzL0hNZ2taMEVt?=
 =?utf-8?B?dWk0MHY5eU9JWElud3dYWEU5Tkp6S09WZ3JjamNnL0R6Y1I4OG92V2lkVzd3?=
 =?utf-8?B?NkgzWTRMWURBZGI3SHQrV3NjS3hIN3hpQkU0Q1d0eWFZWDdNdjBQQlVVQjdD?=
 =?utf-8?B?UURFRW5aSHRnWEN4Zjl6aHZJK09hblhYckRLenlDa1g4TkRHdklkYjZ0ZXls?=
 =?utf-8?B?cFVzMkNQZFdIeDVWZUdCZmpKbjJvcGhmN1hyZEtMVm9INDJ0eDJoYm9PdFdj?=
 =?utf-8?B?akNGbGtVZE5xSXE5VW0vaGU4M0JWbnlWNFJtaVJEaktwR3VDWERteWhGcGlr?=
 =?utf-8?B?UFJmcUdvcmRia2dVS3ZwMXZNTmVHUHBYU3JLMVFmbk05Y08veVNGVi9ZaUxh?=
 =?utf-8?B?SnozVlBIV1lJTlNrT2t6OFpsLzV1MWxQKzRnSUlIQzBMWTlhOURQdjBiTVEy?=
 =?utf-8?B?em9hMXJ0ajNYNStqVnpKckVTNDA0R2YyS0xVM1plYm9WQkJLcFlKbmE4ZEZq?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uGZ8eT5ovfgsfldBvImpYMcVP+0qi1pJo45RhPh4twsTQRzupkQko/IsMchH45g3K0cnZCmMabl3qKDxv6IYaaNWB6lth0f1sergbA/XLPty6AjS1R56AtRAIshnDGTu0gChJB4WZGzaVAm2MjS1Dfmw/zSOdYXk7/DMwLVGIioi5/P++LhHEMYJqot/XD9MGCqVUxQRIn/ly9GxUxQKTYlZPkVEhlUyaGgGPcSKkeQJ5eRc9yGPTaKyt2XSolka/nDHoiV0s3nGd2M9xNRwvcei/n7VeM/Od3HmxQu0VC2vkq+ZbKtVVaumygODc7v0+LLIQIrObGB5xAOzan8o0RNb7+2OOtOpOwVhSdl6VDiCPsFUBSK2i89AIK+Twt0poCCVx11+Hf4rxKN+8YjhebiWcsJz3IIYD0TjJ0HjsV84vF95kuT2iFc6sRR+UbhjEsuoEIdIHZ8GxxqlXHDevekhHdHR9d5DXXVKYthVtO9zd+8DsFDXTXRYGMSUw/QpRh0AH6fEzeR8QezO/uTLw1gvgleSjSYwsSYuNqFcJeo7PewPDhDaPvLVXhgyAkgyQyiNmEmPk5WKzflRPb30sQsugLijp8IrLM0XGd2ur7XefAgXdVWXlIbPOQVJhvMCwMxEc1aQjvHsa+l5VeJjLx8NohpKviACoojI9AiE09+8py5roek8cE6vqmboWe0JvdxaHsrfvcUJXzRUJFROUzTPtP0CTeOHx8oP2Y6qjgEdu1FaHkga3LRB4znWyyvJrIzBMHwcsZpSb+qcEzulHrsOqyY1vt0lwBdSuL7oPynemgy9KGIQ4QDauUWIDD/FwUWHv4LUoZguOJIoMEp83rTSy8cIu5Vyu0F9HX8Kovk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3281e9-ab31-4340-5965-08dba0234925
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 19:42:42.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDc9ZOqPp/47QTBBpiLnorVRM3IMXARHKtGbOJBSOQeUfhV+ly+23BT2ob6qdaaYwrUTRUJbxA3zMAmV2dkZbdDNijaDQRFkH7eBRC/sfsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5798

On 18/08/2023 5:03 pm, Jinoh Kang wrote:
> Fixes: 9864841914c2 ("x86/vm_event: add support for VM_EVENT_REASON_INTERRUPT")
> Signed-off-by: Jinoh Kang <jinoh.kang.kr@gmail.com>

Yeah, that's just straight up broken.  I'm not aware of anyone having
used this in anger on AMD systems yet.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I've tweaked the commit message a little bit on commit, to make it
clearer what you're doing.  (You're not making the valid condition
invalid, which is one interpretation of "invert" in that context).

