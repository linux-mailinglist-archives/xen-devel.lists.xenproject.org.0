Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C282E6F0D1F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 22:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527077.819293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps8EJ-0001TD-IP; Thu, 27 Apr 2023 20:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527077.819293; Thu, 27 Apr 2023 20:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps8EJ-0001QM-Fc; Thu, 27 Apr 2023 20:28:39 +0000
Received: by outflank-mailman (input) for mailman id 527077;
 Thu, 27 Apr 2023 20:28:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ps8EH-0001QG-Uc
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 20:28:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14f8cc1c-e53a-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 22:28:36 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 16:28:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5141.namprd03.prod.outlook.com (2603:10b6:a03:1e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 20:28:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 20:28:20 +0000
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
X-Inumbo-ID: 14f8cc1c-e53a-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682627316;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zhuXYFUYgbFTVQ6BmtHH707YwJfVGzMcZojwzMH9ers=;
  b=NVlOuz4ajK9KBKD7kulJwXbpldn74E4fpeypdXCzIoYPeu/OOfvRK1sb
   hLtpm7TNebB/Q5XJwRDaRI25DkZJ5TdzT19T7EjY7q4NBV+c4Agk3NX7v
   PtD6U0oadkSYSnPJfuQWBrjJ6md475aaGI0QGU0agqMk4/3l1VVDXdKAk
   E=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 107155973
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MwD6NaLLptf9nr5qFE+RBJQlxSXFcZb7ZxGr2PjKsXjdYENS0mNUy
 jAaWWuHPancZ2L0fo8jad/nphlV7ZfUyNdrGwRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gZhPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GP2xDx
 78acQkTb0CjrN+m4amJZfdV05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLk2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHukAd9PReLjnhJsqGS570MMIkQ0bnCYq/2wqh7gVNlzJ
 0NBr0LCqoB3riRHVOLVUBC/unGJ+BIBXd5ZC8Ux7AaQxuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8pDWuOS8TPCkaaDUNVwct6N3kvY11hRXKJv58FIalg9vtAzbyz
 juW6i8kiN0uYdUj0qy6+RXNhW2qr52QFgotvFyPASSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02AQH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:1tBjx65DgGbY444CJAPXwa6CI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HnBEDyewK5yXcT2/htAV7CZnidhILMFu1fBOTZsl7d8kHFh5ZgPO
 JbAtND4b7LfCZHZKTBgDVQeuxIqLfnzEnrv5am854Ed3AUV0gK1XYdNu/0KDwQeOALP+taKH
 LKjfA32wZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLhyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQmgoG2jvH8xu1kHHjqcv2SHYTDNdAv5tQdl/851A7tN9x/a
 pX1ybB3qAnRi/orWDY3ZzlRhtqnk27rT4LlvMStWVWVc87ZKVKpYIS0UtJGNMrHT786qogDO
 5yZfusrMp+QBe/VTT0r2NvyNujUjAaGQqHeFELvoiv3z1fjBlCvj8l7f1auk1F2IM2SpFC6e
 iBGL9vjqtyQsgfar84LPsdQOOsY1a9AC7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBalVFrmQ/EnieR/Fm5Kc7sSwlfV/NHwgEkqpllt1EU/zHNfXW2BS4ORATe5DKmYRaPiXZM8
 zDTa6+TcWTalcGIrw5rDEWa6MiWEX2b/dlyurTe2j+1f4jebeawNDzQbL0GIfHNwoCdyfWPk
 YjNQKDVvmoqHrbFkPFvA==
X-Talos-CUID: =?us-ascii?q?9a23=3AslJlBmoyUOUg5DjCi1++nqLmUfEbf3Dvj3WJGlG?=
 =?us-ascii?q?5WUZCda20Um2/5poxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AvJu9YgxmMtuQqC/V9OcrBxjRgTeaqJ2EIW8Su8w?=
 =?us-ascii?q?kgOKnPyh5G2fDgz+bToByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,232,1677560400"; 
   d="scan'208";a="107155973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhvpZMGzBhhd1MQyTX1UozOHyl8FqeoJZ5oDN5a2Qz9VLNQ/SDbJBEx3PN6r+6eyONteRHokqd3xC6eoJjVtEfweZfx0rkeFlpjHCivPAuSlN3PHUenLu8BtalFq9QaaZXEUm0ks5RY9JBQPY+I1cQU7vguOOspPP2pCDqQRVgGKIlD9R2fgA4VQZGwR2w5TmICmkb/V0Ksc9kTYLLNuirwUnMujwOLaMdelqNwTqGV+vBXMfwV0Qoi9FJA572Zn3HmyMe1HgL3sNzXZd1fvyxpl8ZtfgdmKXD9pWdTIFBQAcr3oHIxvp4HxqvML5HUUCqJ/kYblXPQlgXV1YOSWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcYwePm3wqF18F67BMAPfo29HOUiUXQw1Vx6vSXGZpo=;
 b=A4kFpDvhJc+nfd1hxhBh2dv92tHILIqh/YhTfw7HtBR57xQJFzfuf71XBSMpFwrPQPsOlRx1DuaRNDwqA7O938tqXxDvGyVcUUh/u3DreKQTCkYBbHKvb4As3k/MZXPVRxFPheG/HbkGP9XeAbnxaJB24dxs9Vcv/7KwfSfDyos2tQJN95qr2RtlM/F1CePcNqfCczD+vKbm+2qdL98XkGaSztossak5fo9OIXCR8ansVrAxvEmZ0atx9wY0WMdVmFxie2/FAnLDKOJAqrBI0Jt81p5g0i34dk3AT7GJmbvl+Q1qTDIB+MkworhUT2TOZYgzkKMR4FCDBzijscbh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcYwePm3wqF18F67BMAPfo29HOUiUXQw1Vx6vSXGZpo=;
 b=U9gaHInTJOMqxtL/vwvbDijnKnnRZTD3FV0zPiMxqBqbFZ8z1AbECjetGSHZAlOAf3obAw1K/zrFyj1tAjCmAcrMEwZnQRMIjTAlwB99NhHHFjLk/Uwlgr+ZiaPXfKl1cGIZiNM6c2hDWQZ/DadTJuwtYigxx8ZeUta5kEgon+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <85cbaee4-bffd-6220-19b3-55f544f9f2ce@citrix.com>
Date: Thu, 27 Apr 2023 21:28:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] xenalyze: Handle start-of-day ->RUNNING transitions
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Anthony Perard <anthony.perard@cloud.com>, Wei Liu <wl@xenproject.org>
References: <20230327161326.48851-1-george.dunlap@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230327161326.48851-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c42059-0abb-43af-d350-08db475df0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hqJXAI+qUn9g73Qclto8KRSYzmxt/cby1735FDjVu3CfZbyGbP713+3Oy8wg1Ykommij6nE6zxPr2Ev846AMjIHje9WCBaPY5g7QpG+4FAwF5ZCqPFU+sh9uhM3l/CKBGu4Ccy4fb1C1GRGzBCPjWpIZoS3rEWV+uxFAHvA4gL3MV+tiYxz0ABeSlGhnIYUX7vcOmFmrapzCE5uzFjjgCqIPSyg1FHv1WLM+u18V5g+4SeuzBdyr+Vr7r4Hxru5gZupoxLTRDsN/xX4vIMX4s9Z3sJJB2OwiRdSgzqRPH+zrVjM0vTmPhAyxH3Bbfbz2da3FXcNW9YKop9s+s6hrsveiWX04iC12bnNhHJy5Ey77z9wgH+B/bnQ0f0R6jCLO341LUMpcSiCqf/s9nW+mGHYzIRejI2mLR271x67MnRHBSxD6nzhlABxi6qaMA2CzsRnJfEva81GWXtBMyghqO9hdB2iz3cDuKDgYvSGR/pdru5tfD7EwRvzzajK9HNVXgLTk+PPVIhfALn6vEnkQ3TUhF7O59/or+SwxMsdoEFqFZKQ7vwQiWbQF7CpsVgGUl9Pdeq0lrjvrXckAyMBgtNklkUwUnDaOLKX26xC56XgrzE/ZcU9HANbmw0FZKYjbuZ+cMGbjuyw/bGB25xcxdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(66476007)(4326008)(66946007)(66556008)(8676002)(316002)(2906002)(83380400001)(478600001)(6486002)(6666004)(5660300002)(86362001)(31686004)(82960400001)(38100700002)(54906003)(8936002)(41300700001)(31696002)(36756003)(186003)(53546011)(66899021)(26005)(6512007)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anIxMU9ncjlVbUZCcTRpZ05vT0RwOWlwdVduV1J2UHN6aTgyVU5jUStyZEJw?=
 =?utf-8?B?NmVNcTN5QzBvaWlkcTRrVEIxTGY5cTI4dXR4bjFPUTJnd0thMDdsQ25xVXZr?=
 =?utf-8?B?aDJPUExNbUREbkhpUEFsNzZNMlFHRmVTZytLbjcyK3dvczdxemFWYW1wbWdV?=
 =?utf-8?B?S2JIM1N6RjJrbG5aM2xzWGxmK2tFS0c3K2k3MkR1UUQrbUk5N1RlRUdIUVRS?=
 =?utf-8?B?NFBaRFlWVTE2YnVsc2Vabm04WWZrNy9XY05ud3Y5Tlg5WEFiclN0NVQzd2pn?=
 =?utf-8?B?Q210YzhUYVp1bnRId211eEY4cWoxMjZMM0hKVG82dElKdVNxLzNyMHYxZGtY?=
 =?utf-8?B?NG03TTFpZ0VRdFZNZWhySkYyQjFRNVJIbUw4dEp1NmFOWWtBTXB2VU9CTUth?=
 =?utf-8?B?TmJSUVcycHpDOWh1YUFDSE5LdzlrSUxZdjV3QXZDYU8zZVlrMHBWMEJLU3oy?=
 =?utf-8?B?YTE0c2doZVM3c0x2dGpwb3o3MDhGVTlyNjdORFdFYS9oUCs2cGIvSkE1RmNW?=
 =?utf-8?B?NnA5eHowSTd1c0ZzQ3M4czFLTk1IRHZydTZ4c2FwZm1tcjB1ZHRyVk00SlFm?=
 =?utf-8?B?NXpoWXViczZnUndqUlhDeHdMZVc1czNqSkx3eTVpZEpNTjEvM2xKd0ZtSDVV?=
 =?utf-8?B?NUw3RmxpT1hsYjViYzMvaEVSUzBLWVRLa09DbC9TWmpUL2tTYzVoeElhZktC?=
 =?utf-8?B?WEltaWdSK0IvWDZCcjBBV3dBM3pWWUcwTTYrMDVQSkhYZG96RGNydDFiMStt?=
 =?utf-8?B?aVBxNFZPanVTUG4xM2Q2UWxhMzBTUHJUbVlDOHh1NEZORlNuaklFcEprK3pj?=
 =?utf-8?B?aWNxS0JxaUNoNndjRVM2K0xKTkkwVDgvenhhY2NCa0VKdzlOdzZTZjNKMW5a?=
 =?utf-8?B?NEE3Nk52Y2sxZ2d5eHdDcFhBeFpRQTJEUG96QU91dm5ZNFVOUU1UajJERFZj?=
 =?utf-8?B?cnFIMGM1WDdHRXNKdUs0RWJFbHR2UjZXNlAzRFFVeWhaRUJaaUZDRzg5WWo1?=
 =?utf-8?B?WHBBenR5dk9weFJNMXVvN0I5SXZJdDJHWEQzckRkU0tZWFZlbEF6c1pBTE94?=
 =?utf-8?B?WVFtV2xqaTU1ekUyT09EZnNVRTZTMlp1ODNzK2NmUFUxVDltUEVWUzFDL2xB?=
 =?utf-8?B?RWQ3L2dPb3VIaWZuS2ROb3B4RWEzR1A0cHB5YkFKc29WN0NIdGNWbnBhZDBK?=
 =?utf-8?B?aDBiRjRibkI0K1hDQ3pUVndQVGRKYlcrVG1BWW1HTUd3TytnMnhBeE8zci9O?=
 =?utf-8?B?QkF3d1BiNFRZUHc1S1A1dG9TTERWWUx2L0FuUzYyUVlqbWYxa1J5bXFHeEFH?=
 =?utf-8?B?cldEMUhtMXp4VCtnZ2pGL3dEdFZmNXA3djNJbk03TmFCdGEyTzhSdXErQnNB?=
 =?utf-8?B?dFZvaitCb2s2NkxhZDU3SEw4TGE5UElGRHB4aXhRdnVEbXpQMFF5K2FFbkFq?=
 =?utf-8?B?UzlTRUZNMkZsNFJOc0M3UHVCTHZpM0laZ2Z1c3kyaExUdnpLVlhDL3RkNXlB?=
 =?utf-8?B?Z1FkZ1hVSmxrUmJ0K1dTUHBSY0dtR0lmUWVXN1Vqb0o4Mi9VQWN1cjk0RUM5?=
 =?utf-8?B?a0crb2Y3Sm5pQnlzV2tlcnhRS29tclVCNHQvSTZtQTkvb25Td0ZFZmhVdVNw?=
 =?utf-8?B?Uk12aGNkM04zZHNJbjgwRFZsT2diaUJtZUFwSTJuZU9ZM2FpdVFFV1V0Q2JR?=
 =?utf-8?B?aFgwZ3JPS0g3L3NTYTc2aEZvUUh3bkJWdkFjSkRWRFR3SkNsYkFITXJENzBL?=
 =?utf-8?B?RE4vZUJhTUw3THR0VWJ3THc1cVRKSUhZci8vM2UxY3FVU3JSK0JqNUZMakFI?=
 =?utf-8?B?cnZPY3hHcU9qbHlvQ3BacTE2dy9EV3YvL1NwNktkWkg0czJOK2dGbThEZloz?=
 =?utf-8?B?OVVtUEhTQlBYS3g5N2JwRnlPYUY0bURXWnpFdG82NFlvS1dwNCtWYkpSU2hi?=
 =?utf-8?B?dit3ZXkwQnh4WTB4U1pvTG5CZDlZemx1eVRpNzhSZEtsSU50VkEyaVMwekx6?=
 =?utf-8?B?NnpnVHBCQ3dLckhhRTNpMEc0aVNBcUZXVDgrSDhsWjBiVmUybm5GWXFCZkI0?=
 =?utf-8?B?cHZOMERKR0Q3cFU0SDRQQU1tM01XenVsaFBSTUlwWmlzaVpKcjdxdkc4c01k?=
 =?utf-8?B?NHgvKzVnbVV1K0gzUXZFblJLMTdTaVFXdE5Wc0FhaVZWbXpUVXMzTGNqWlJr?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RZ/K5O9xBrqw9il9KXyoiQnZAZpSi5+AR6spySwz0h1Cwf2RxYC+UsX71DEJBqEHnm3l4dPduj5BmGFkZBkNkV2OfTDvx2cL6GTe/7MsmoZGkwWsnPFplXDfEQmNNfJBJ4W04vQfDSqqrkFvPjCwB7CzRFHK+DxZqu5Nykwg30JPDohIpODIJGL3PCBDXHcY0q+j++BRVDDtPW0TnTbuXz1r8X36IAc3jtkIJ+wKqffmtZ56H7c6Lss9ICrzQoX7MhvV/bbJSR3pRj6gjLQ3XQ1N+Z1IlaVqsAayhbpuHJu8X9d15Tc05an8Hp3uDZAm8vIMAqvOEd2VD5/YCo0elT5RjKH+3hJFn2OioFp0/vX01Hx6VgEqKCo/1OH5MVwe7y++BOB+tP9tn7R46Gyiy1KV1eS/QN5VyXAbxQ2YPeylXMTDaGzeHre2CUKVxmVHq3UryiN0NTK3fL+VmCQVl8bUDUH7ln6u3ro2AXHy8l5CQeVtdTrwG8mKyBoohSQ3SFOeP7A5hCwjY8O0l/6uKr18kN4TTQSZbWCJnHctdHMQ+ZIT52Y+gdZA+upuIKpemPRgNOOSXNeOf3efEoMeQ9sHoIUstcz9jU3i3GOKk0njwqG4VmtljTGMdz9CHtg/rM+l6BN0gqSHvX8m0wToFgtJVWfLm/Z3jB+t8UALi1CCN1oWOnA4Cc6EKsRzbmfTKXmUNYE4eiM4t6kvbeCNIPIIhutuwG+w9A3aTrCJU9QdzLHyY/U0f4VZJLm9etVXkJHq0eCUoOrRW75puSRkYbltz0Ui+0O6lE0iaoGnyCFgAn40O7miOim+W5irU2vK1HBcaDRN5iQxwS7wjCRICg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c42059-0abb-43af-d350-08db475df0a5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 20:28:20.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm7WWum4scBrLbKyYKD8DZmM9NWqYkR1srD1dGGsi6Gx7M1DRxV2FIa1DLpKa56poZXhM/qYSk99WA53G3FbTSWd9xDb/xlbX1J+Vyp06mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5141

On 27/03/2023 5:13 pm, George Dunlap wrote:
> A recent xentrace highlighted an unhandled corner case in the vcpu
> "start-of-day" logic, if the trace starts after the last running ->
> non-running transition, but before the first non-running -> running
> transition.  Because start-of-day wasn't handled, vcpu_next_update()
> was expecting p->current to be NULL, and tripping out with the
> following error message when it wasn't:
>
> vcpu_next_update: FATAL: p->current not NULL! (d32768dv$p, runstate RUNSTATE_INIT)
>
> where 32768 is the DEFAULT_DOMAIN, and $p is the pcpu number.
>
> Instead of calling vcpu_start() piecemeal throughout
> sched_runstate_process(), call it at the top of the function if the
> vcpu in question is still in RUNSTATE_INIT, so that we can handle all
> the cases in one place.
>
> Sketch out at the top of the function all cases which we need to
> handle, and what to do in those cases.  Some transitions tell us where
> v is running; some transitions tell us about what is (or is not)
> running on p; some transitions tell us neither.
>
> If a transition tells us where v is now running, update its state;
> otherwise leave it in INIT, in order to avoid having to deal with TSC
> skew on start-up.
>
> If a transition tells us what is or is not running on p, update
> p->current (either to v or NULL).  Otherwise leave it alone.
>
> If neither, do nothing.
>
> Reifying those rules:
>
> - If we're continuing to run, set v to RUNNING, and use p->first_tsc
>   as the runstate time.
>
> - If we're starting to run, set v to RUNNING, and use ri->tsc as the
>   runstate time.
>
> - If v is being deschedled, leave v in the INIT state to avoid dealing
>   with TSC skew; but set p->current to NULL so that whatever is
>   scheduled next won't trigger the assert in vcpu_next_update().
>
> - If a vcpu is waking up (switching from one non-runnable state to
>   another non-runnable state), leave v in INIT, and p in whatever
>   state it's in (which may be the default domain, or some other vcpu
>   which has already run).
>
> While here, fix the comment above vcpu_start; it's called when the
> vcpu state is INIT, not when current is the default domain.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

