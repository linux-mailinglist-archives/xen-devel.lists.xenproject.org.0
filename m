Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3FA75782E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565055.882912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh72-0005lu-52; Tue, 18 Jul 2023 09:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565055.882912; Tue, 18 Jul 2023 09:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh72-0005jn-1A; Tue, 18 Jul 2023 09:35:20 +0000
Received: by outflank-mailman (input) for mailman id 565055;
 Tue, 18 Jul 2023 09:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lOh=DE=citrix.com=prvs=556a0cea9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qLh70-0005JI-69
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:35:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66c7b297-254e-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:35:17 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 05:35:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4978.namprd03.prod.outlook.com (2603:10b6:408:78::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 09:35:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:35:11 +0000
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
X-Inumbo-ID: 66c7b297-254e-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689672916;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R9Llah/rnHWUiuHEiuseJgOjWEtVvLHXOHIcdnT5pNM=;
  b=coC92TSRcqv5V2b29XHFA+qN2JKhhG2ALgBaM2xbXaBeXKMmzXfDO3QE
   p8yApFMUj59wjLXIBEpJ1DY3r/R23O8STwkgy4nwaKKj/yKP9/Hvh8zPA
   av8HkfVsUtbWjuAC489Xujcu8QZf64XCsadyqW39p4TPdgqux04GYjKc7
   w=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 115275188
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VlO0vKlAdjaJNCEPs/VdeJXo5gwnJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZXT2Ba63fMGP0KtxxPo+yoUMFscPSx4NgTwY+/ngyRSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5Q+GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ewiAhQ8ZSKovOSr3Lm9c+dgosMAN9a+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3ieewWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeDiqaMz0A37Kmo7VhI7TX63nKaCtlOEafd9D
 lA3ygkelP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xD2wJTDdHZMYh8tE/QTgn1
 FihlNfuGDApu7qQIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKkxkxbOQ9BLAKOzyNrvFlnYy
 T2QsDI3gblViMcRzri65njOmTfqrZ/MJiYL4QHQUnOg/xlOToevbIy16nDW9f9Fao2eSzGpo
 3wsi8WYqucUAvmlhCGLBekAArytz/KEKyHHx05iGYE78Dag8GLleppfiAySP29sO8cAPDTuO
 UnavFoI4IcJZST3K6hqf4i2FsImi7D6EsjoXezVadwIZYVtcAiA/2dlYkv4M33RrXXAWJoXY
 f+zGftAx15AYUi75FJan9sg7II=
IronPort-HdrOrdr: A9a23:tb2G/6PXceuUZsBcTsKjsMiBIKoaSvp037Dk7TEXdfU1SL3/qy
 nKpp4mPHDP+VUssR0b+exoW5PgfZq/z+8W3WB5B97LNzUO01HYSb2Kg7GSpwEI2BeTygee78
 pdmmRFZ+EYxGIVsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3ArOqDmmsKOTW+S8mYUsuidHaK6Is1SFf5/XziCHS?=
 =?us-ascii?q?+FHpiToSbRXuX27h7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ArwzQ1AzhILu4IYxthvQIbIs02UOaqPqhJVgonah?=
 =?us-ascii?q?ZgPWZDx5VGRKBrwSUcrZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,213,1684814400"; 
   d="scan'208";a="115275188"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLdkYhCa+pfsznKie0ftPQuLP9QHnv52HDmlr2NXr7rQN6dZjzVRPBp5dRmGlTywT2v5awANbZJR35UPNaINC40Dra1t0qpnSR7wyY8l2MEEuJ72GhkCTlAAnQ9nfFy22XjZrtnZ7CPl3j/zGmkPn5LYU5XRAOPue9FjUuxKOs3j9gK+owQZDSXwMcJ2rpdKYlKIVVgPzH2P5yS6Z1OAAY5d+N98PVtNM3n5ehW349581pek6jmA0vvvIm5TzdswmCs/sC//hX1g6Lwzddxwqh5APmyLfhc5jtJMpd5ZI+Q9etc6r5If7AeolJmW1ylfWGvhVxF3m/qGRYHeYNR0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtLv1TAeU+RBC6K3oID2uq6T2gCwle8imeXUz77rNpA=;
 b=Yk7u9VcKOHorsnbg6iF/orazo0BhzR59cJvJo5wFrUZq4rdxU68OdtcBjhjgauE9vJgLv49IfUGAD/e3PArQmUe3+nQ4hH4xenv4XGj1bb/0SHJFgpGet8l+7MMZLnlwTHQSnn33taOvtWACLvSYupuGGvj75M++cuuZ3KWHs2AWP6FG7gh2Za48EgD8yJMV5CZxm+EWuoIFkNNiG44Xf+9RSR1PdqYQG3blPtLJb50/keJjwNHmLJczBiBQGj1UALATNCRV/x5ELoBZ/U3sIJZMKS4Kp0akt4/Etz1ZB+eZgYbKSrdnjF99DnphQavQs5WpBVoa7xBQiopEK9wwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtLv1TAeU+RBC6K3oID2uq6T2gCwle8imeXUz77rNpA=;
 b=jUFiN9HrHf1n3oo7VQHoSX8SDW5nhqJTfE0AZhJ5OeuH/ohFkxLfzZqfsVRUOYCND82KXDilhjIvB9cOd5pDR0rAUPIdRCDfktvM30YExgxl7Qcxw9AFchd8DqL1ZzM0x61fWAzT/Mq9oZ9CcTR3CpVZsgLZcCBaIWJweA3TZVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c06920d5-763e-a141-cd68-dedcecd33da8@citrix.com>
Date: Tue, 18 Jul 2023 10:35:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/8] build: Remove CONFIG_HAS_PDX
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-5-alejandro.vallejo@cloud.com>
 <7e5bd2a4-d810-cc48-cf43-3ad64e501d55@suse.com>
In-Reply-To: <7e5bd2a4-d810-cc48-cf43-3ad64e501d55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: b8cf134a-e45b-4ffc-5120-08db87724823
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kph7wplM5GBUKwmWRcwOcCFGUMieP66ywJm8G1+zjh8ScnU2x7hCYjfZta/SwBXvCEaU8m1jN09VCgFLyjiOD/Rf5WzpezKNtATWofzbQd0kELwlfPju4Ua6ggzP5H97YYjvYUOBcKQTbUKIINSdwX10h8IGqkQJryB23ctLVad4B+uZ91dwbIvjMPGO/4v6AL7ptMMeh7CJ1R1QF4ruz0aBfabrulaXtu7lPW3o94Svp/1dgO9KCgHMQejJ7wBbYCAcho8jBIuSjqdF92dBBplDRBcwrMPLrzW9gmIc3Y5z6IdfG5pC6mTXF8636b12R8aPrf5eL7Yi+lVdJTBPIrYzu8y+7DaCorK0yvQBkX4EhnrUC4GCefc0WTlEdAYr5So5+cg1s/thkEHz2EQOpRcM4iF7O7xUpzoAlOPJuexySONc/gZdHHKlRoEzHvHaoyuaP2hVOROTXI4MYFbgppcaf4P3Q3cKxAwT5w/mvVYo2M2r6PmwOExSLX0C88jIgzwBKaRrI0noQ7UlcFyTn/ZHUySMUfUBMEQKsdPgERAlXYiAYIlIwGq0ZoqhPZh8GyAcqWzxfgsic2Z5Rk5Z03R1MetAT0B/68bLVBsvbmioDL9/YXxciycazKKiqnAW4+OsKuwi8VFDnsZdRxkvgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(7416002)(31686004)(31696002)(86362001)(2906002)(36756003)(66899021)(6512007)(2616005)(186003)(83380400001)(26005)(6506007)(53546011)(38100700002)(82960400001)(6486002)(6666004)(110136005)(54906003)(316002)(5660300002)(478600001)(66556008)(66476007)(66946007)(4326008)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWZkUVlhR0YwaEFRUHFCeE5yc25LaWpHZ29CRmxrNXo4Vm5kRFBkSlBKRytW?=
 =?utf-8?B?Tkh4OXg4aWVqVlVlQkd0c1hnRWc2ZmpjRGlvSjRJSmsxNjJiTTQzNVpueU1u?=
 =?utf-8?B?M2ZseTFoM1JyWGo1bURPYjRmRG5JSDY1Ty9KNnU4TzZ0R1JKRU1nL0ovaEND?=
 =?utf-8?B?OVNlMmd4Z3NLNXZ4ZWx4Z29FTXIxbjNybWVlV1ExTWRXZWUrem9wc0l5Ulp4?=
 =?utf-8?B?V1BZSUI0L3ZUVDF6OWtIZlcrMkdQRFFmTGdwL2xIQ2tYdktqVE54SFZuRkFi?=
 =?utf-8?B?YW5ka3pSeFFGN0QvTnc2NW1zMlFlelIxV3VBQ2FJRHpId1hkSnFuVDB1b25O?=
 =?utf-8?B?eHdoeVJ2Q0Z2SkdXaTV4NE9nVGtIVjM3S2NROXRaMFB1YThJSzFqb3VzaFl5?=
 =?utf-8?B?VFhnVU1iWGdVN3JjekJ1ZFd4NS9RQWwrV3MzOHF5R3pDL2lKV0ZKY1ljWk82?=
 =?utf-8?B?ZUhzbWsybFpOVkFIWFhVYTJNM1p5SVVQaDI5ZWFnLzlTSkxFT0hNWEoxcVI2?=
 =?utf-8?B?U2I2bnBmQ2NaMnl3UkpGbVdycVMrVWVDZ2pNVzVRUVVhUTd5bjNsTjFFVHB5?=
 =?utf-8?B?VGxSNHBzL2UyY3dCMTE0QTBIbE9lT09CWlFvWXJwZUNzN0dhQ1pBV1o4SlNL?=
 =?utf-8?B?WkNaM0FFRUlnNG1oVUZoSzNtUFMvMUpqaDEra05sRzMyVFg3NUlTdFdMbGlO?=
 =?utf-8?B?TjJoVGRQY0U0Qkp1UmRQbTQxTExZTVRZWmcrU256ZkxmRjdkVzN5dHUzT3JO?=
 =?utf-8?B?ekpQdjA5RmxuOHNVNWFxdU9tUlJBQXRBQVE4SlNvTUlabVM0THZ6YkoxL0V4?=
 =?utf-8?B?QkFuQnloVE1zbkEyVEpYNzdsdXhGREFDODVOMnUyczBQa3UwdFpVT1hVemkx?=
 =?utf-8?B?Z2JjekI2WWRSZ3l4M2VrNW1sZ3dxQ3JsVVdobkhZNGNyMGhFR3RGSUZJRHpo?=
 =?utf-8?B?T1B5bWxpb3NEYS80M1ZCMFVFczhCWGJscDllODBFd0hEQzk3dG9yeWRnQjdF?=
 =?utf-8?B?SFE3MVRRTmozakQzTHI0VVVvQUNsQ2VaM0JyVHZBMDVvVU9NTFhzQnl1a0di?=
 =?utf-8?B?SVk2QzhnN0QxdjZHRVJkWGQxTHhzamtEM215Qm5GNGNmM1RTcGtldkoxVmFq?=
 =?utf-8?B?Q0k0VVRSUWducW9MaGFRbFBUR1R2Q01pYWRya0VmRFRsM01KRG5JbHV5YjJz?=
 =?utf-8?B?cXVVdzE2ZkRSZDhBUlBNWitUMWFhTnhjSGExc1ZVS3RLTkg5V1lkTkhScHZt?=
 =?utf-8?B?TWQ2MFdDSU1wallFYjVQRlFMYlBuL3doWG95eXh0NHZ2WTVqSmN6emtIYW5H?=
 =?utf-8?B?OHFWdEdhcU1ja1FpV3p1cXlKNDZOYkpUQ2pwZnBWNTZ5cGVaZE43QlFCZ0d5?=
 =?utf-8?B?c0xLVVVJdFRHOXFBaWUvYklLMGFmN01WRjdIcy9UOXBOeGFiaThXRWJ2R2g3?=
 =?utf-8?B?cFJNU2ZJUXh1N2hCVjVYM2hCTTRqb2lhVlVkcGJ5OXVSTEkyMVBvOGUxS0pO?=
 =?utf-8?B?MUVMeUNLeDJrcTEvajl2VEV3aU5ENEZYZDRST2NUdDR0U3hOTDlWZXBDUlJB?=
 =?utf-8?B?dThpQlVybG9VeitadzVhM0I2QzdXTDJrc2Y4U0tHa2s0WkRMV0xiQnJWNzF4?=
 =?utf-8?B?L1VlbjYyc3VhOExHbnFpRGV3cjdGb0VEYkI0T1REell5MmszK0lpNXZrYnlN?=
 =?utf-8?B?QWxFUTRFckdvMEpndzFXY0hEeTlLRWt0R2ZZRUM0amYybThZYjlIbW1mcWh2?=
 =?utf-8?B?dlBtZG5IdTdWeG41aU9XYmg5KzJGTG9pVHpUMExqWDE4NHgwL0NseHZYZVRY?=
 =?utf-8?B?eENNcDRnTmttd0JnNFN5V2NLVDMzbWZSVDlGTTFISjVrU3RpY0ZYNUEyS2NC?=
 =?utf-8?B?ZDVHU09yb290SUpueFlxdDkyakttcHh3Um05Q0NKRlc0L3RPRDhBWUlBYmNx?=
 =?utf-8?B?SHp1UGgyMTVBSnNYY1BwVVgybEp0Vm5HZEF0Zk5GOUUvUkxEeE4zWTMxYWxn?=
 =?utf-8?B?UTdTRHFEcVdzZ0swbVAxS2tUNXBRd0JZMW1qbFpvb1ZaOWU3K2NiUk5BRlZq?=
 =?utf-8?B?YlgvUHFxTE0zT25GVzMwRDZncHRhWTRUWEJLSkRsYTU4UzB6cFNJVEI1TC85?=
 =?utf-8?B?dms5cUpxNGRjS2Vxakgvd2ZIcmN6YUpVWDNXMVZNcGw4ZUtqMVdGczZ5S2V2?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Szyl7PpYGamaXmXN1S2C2z9oALqMDH04fJQ7KGEUG0tvDn9U6EDgjuXc92K3Mqu9DAof7CbDVMqnwG7udjz85jbC+Gh4WZRqeFjPoCpVptAGkEpIZMJ4LAJ9DEEdGI2KPz+y34o2bqPloZZJnl2aR/SFNpaDOwi7/gtXy8zeMMnpJak/QNLqJPY+VIjUd3TUrlJ5rE974nLPk5L7gBFCM1rEmnleyJUESx5igdnKezPwZJkHUFQdU6O75AMnpLXGacFl2ZqXuo+cyjtP64c38KFcikZmqXOdWsuijyIsqG3f7WU5xfxgeiX1GBNOgGwBIW6VT2fIgrFp9ZzRLrV8xYBBNXCCiZ4FbrJwstqN4zL1e6fGeRzQ3B4IXi7FvTvKd8Q91MmVX1VP4vdDYvWUj2/BuekdcLTPiesTVB35LLZMHSRjnxsSOVraboM72xJvv15OdAG3LxOjaBWi8V3V2jibd4KwR1q25pCCWfT/01vOtvKhWc5+ZrDmy2lnRphIJkM7zNJPGBqj4pd95lAZeenWyE03q4eZ19w4b9uHj46hAEsmGz+RhLVrBDS6r/xdp1sJa06j2SqrpEVnZ/VNqPoaZOOvT7hna8hTIYpRoyfzADbFyiRw0P1ZKBIkEnuldyHZXWt50aA0uiegqqv7xO/qEC5jovx63J2NLrVckIZL03kBX69VaFG0AbMaeUWpL6WCH2c8tuIDlhNj1GSHGAPLS0+3jqZoXtIa/McOlZ5LKpgJKP36mdZ+x9OMb6jgGJzKvyrVyYM2vOMN63z5q0qWTXzJhyT/SYSQTudRJO0qF1nw67enTnH/hwomSaqH72pbXmwjZH+PhVxOmdBtXWTsBHb8lIRdF0B22kmLfhhMEeVFFuAZHCDq04cemeVPO86gyl/rRSGpVhzyGpV8EGBw93C4MMfbzmFRDy7jqRk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cf134a-e45b-4ffc-5120-08db87724823
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:35:11.2299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg76KoHD0GfuoXLC9116C3aR+li7MGGWSLmYbWFrhTaY4vf94N1SbIMgo/Q9ZuYMO2OiV02BHBV2gAjbzF/tW6T2fse/0U6Z8ChBzI78X4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4978

On 18/07/2023 10:19 am, Jan Beulich wrote:
> On 17.07.2023 18:03, Alejandro Vallejo wrote:
>> It's set everywhere and can't be turned off because it's presence is
>> assumed in several parts of the codebase. This is an initial patch towards
>> adding a more fine-grained CONFIG_HAS_PDX_COMPRESSION that can actually be
>> disabled on systems that don't typically benefit from it.
>>
>> No functional change.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> On its own I don't think this is okay, as it's unclear whether it would
> affect RISC-V or PPC in a negative way.

Neither could compile without layering violations of PDX logic in common
code, and neither have got that far yet.

Now is an excellent time to be doing this, because it removes work for
RISC-V/PPC...

>  If at all, it should only go in
> together with the later re-introduction of a CONFIG_*. Still I question
> whether that new CONFIG_HAS_PDX_COMPRESSION (which imo ought to be
> CONFIG_PDX_COMPRESSION) then wouldn't better depend on the arch-selected
> HAS_PDX, such that it wouldn't wrongly be offered to choose a value when
> compression isn't supported in the first place.

... although I do agree that the resulting option shouldn't be user
selectable.  It's a property of the architecture, not something a user
should be worrying about.

I also don't see why this patch needs to come here in the series.  The
main refactoring in the following two patches looks to be independent.

~Andrew

