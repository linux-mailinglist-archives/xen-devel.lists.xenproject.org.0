Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0B729553
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:34:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545745.852277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YVC-0004oY-8y; Fri, 09 Jun 2023 09:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545745.852277; Fri, 09 Jun 2023 09:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YVC-0004mA-66; Fri, 09 Jun 2023 09:33:50 +0000
Received: by outflank-mailman (input) for mailman id 545745;
 Fri, 09 Jun 2023 09:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7YVA-0004m4-HT
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:33:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba99a4f9-06a8-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 11:33:46 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 05:33:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7223.namprd03.prod.outlook.com (2603:10b6:510:243::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 9 Jun
 2023 09:33:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 09:33:41 +0000
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
X-Inumbo-ID: ba99a4f9-06a8-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686303226;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H79UFLgxw7KKovMhydB+oo927T9/OQ++b5HVQWEzUR4=;
  b=JlZSwz5awxvrdmjCzQgxcXcXzMtuhKJVmdANpBtpejN14Z0xzIJ+J8AB
   CYovncQ9BGsbqvmXVINbYFkBw5GHhubCQlEd9W94ADA4gQjcYo63MFj6W
   V1MRoZcXh+UV854zszKQTRTySVKNGcEc9GhkFrJeOlFsBDTTNDk9aHpBL
   8=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 112073506
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tNqNXaqYVjkDOGA/mBFomxAEg/1eBmLZZBIvgKrLsJaIsI4StFCzt
 garIBmDMquLM2Onft8lb96z9B4BuZ7SmIRnG1NpqSg2RnlAp5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzylNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACIkUFPTuOCI+ruQWK5sisgtNebIYIxK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6Qy3wbOnjJ75Bs+e0aFvvOejmWEAttvb
 HcGvXAOiYEUzRn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsSiNKYZoovck9SDguy
 3eAhdavDjtq2JWXRmia7ay8ti6pNG4eKmpqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0ADa647iMcK0+C3+A7Bijf1/5zRFFdrt0PQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytalUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:AEPOAq5OJkjEpnQeZgPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-Talos-CUID: 9a23:L0bP6WFhrc54HvzjqmJ13XBXSv8nTEfU52WXI0O0B39Ga+GaHAo=
X-Talos-MUID: 9a23:PdzQhQkCBg5GztmVidkIdnpMKfl36YOqI3pUmKVBgNvDbwxUEhGk2WE=
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="112073506"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8XljpCQHiCt4kPe3bRRmB1cFzRtolnmnk1VCLechXPdcagLsthxIDO3qz/axRHeJJ1ZoGyfyIWsfQlH7QSaHDgdPKKwmaNh40gXUPz26OvQWGNqbdg4TPPfoF8lw80IhiKP70GODj5MMKxBVNIV9sq+HDrSgsX9lLQGt5/SxUe0tZRO8Ca7GvD00ukU7djEC1RFECw+KN51J71HLhIcBcHcECLxl72ekBaNqxNFh1jfp9HbD9ineWEJsRpPo9a+vORqZ1d4AwntgXi/UuvYnIei4dhNV+mnqFsjiaQjS8tLPTUdamgM8mrwW03y3KFww7L7gnV3fh4+o3vjG1mnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5h+XW1aJ9yMfSE9dPXkPuSLt2sAT9XbEY8yJCPADeqc=;
 b=i/rqUu6SC8ORfuI0KYs4pHE2r8BabY0w/7ZxkTQyzFqwYUQsGGgJXZX5JlfHuQ3o5PVZlYYOn8uc/RzqKvIDmQCzy2ZRuKcj15wOH0KozwrGhG7xIlrSJ/kYuFEDwtRJoiSnhV9wKniByRqaSESUu7PlFuF82NxloXPtINuRtjdHgnjj8MctDtRQkwrr4/34SHdr7msVW93bbN/kdRV8hVhJQabuA1VILd7QhQzk3oyt7kphGYMa5QdPbD2dSGqTHQmi4xh5vcmUzoyQjK2j6eqpqygsM6GQhAZv9kaIHsjwCO0PBkS7FIh7RPalIB1QndG8OJJAlucEjdxD7hwXRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5h+XW1aJ9yMfSE9dPXkPuSLt2sAT9XbEY8yJCPADeqc=;
 b=DstnYMdMTRTg44nWlK0fhy3cSZPwHWznmNKoPrrOluzY/+GeD7SNSeM38t+q+gtel8kRiff6UwpFkiZDl31l8czG31p73TOEsBmRcTfZwSabA6LGllhVGV8Cq1bOPAoTGoWRFi5obaxroPINiXmSxRaaBp8xk8thuRCPIFiiRYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <de4cb4c7-5087-80a4-7420-799fb468526b@citrix.com>
Date: Fri, 9 Jun 2023 10:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
 <d9162ee1-a6a7-96ce-652e-54eb30a3db78@suse.com>
In-Reply-To: <d9162ee1-a6a7-96ce-652e-54eb30a3db78@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0043.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::31)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e62945-61d7-41b7-dc0f-08db68cc9c2d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S/OplE5lcfUE1wI5hgeVdHV7fxuf/Hb5G67O9GGPGGTOQlblG4FGt7ALbgMZ5+1jLJ1Gn7rYajUmR0Gm3nUJnot6xJY+zUCH1hJGM0EJTZ5YzzsFd9hu3XeakHEV6CrJ3+i10Fg+Oax4P1mUG3NNZov7Zl9W0jJiFq72m32vGohoZjj2b72FR1PHVAxVsYzi5fxhs+i0hlfzANTs7n9cQRdtRQjH36A8e0hSWgMaQ18ADGKiLba7gEKTho7C0eMfIzffaRvU4kZdkfz+o5l7UHYYp57bq+CujjGj1dQWnX4bVITmNyhMBt3NM3RuBatTCD34QWUzaW4Wl6SaOgt0TSc/9vO7w6GOh4JgDotZeiS3vE2a6OuZssM0JpddbKLqa7Swrr6yv2FdOgAJDXJce0ayx7UnhqYBNSWIDn/Pw9Xq/474dz9BRP2HOvCnvzlN1cPXAT+iVD71wGtQUbD08n3Z1ricRuHqPHQjRIzfrBwcgbt1E2D+ynp9rOh+2qRyWyQnSJF9Cz04H7D6Y0HG6YGpssXlEvx4k3kedy0ywryuMSbEnfYWMqadZy1oCdxjSKlbzx+cMAetl9YHAOW+El9y6oukRhvXCZN8MrqTeXRlTjIa7dWUnQlpA9S6h5oi0dniKyaeF4gKhl/lRzgMFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(478600001)(6666004)(53546011)(186003)(86362001)(36756003)(31696002)(6512007)(6486002)(26005)(38100700002)(2616005)(82960400001)(41300700001)(66556008)(4326008)(66476007)(2906002)(4744005)(316002)(5660300002)(31686004)(66946007)(8936002)(6506007)(8676002)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THhjSzhIcUFpWHNESDNNUC8yVmNNc0dVWDQrR255WkhzQ281YVRUalc2VGxz?=
 =?utf-8?B?VFAvV05Sd3ZyMnh2NXl0Vm5kcUc4MzRUd0g3aHRXVGE2U01odGRubHdrZUNI?=
 =?utf-8?B?ZklpLzBWWHE4OHZIYTdwV2NZQzVoMXdrS3h4SFFPZVBZMnZ1bENrTHlMc3FB?=
 =?utf-8?B?dnQxVEVJS1RWRkpBZDhuMU5GR1E4TGtNTFR3ZGw0WnF3dStEUmd3WXNlZjh3?=
 =?utf-8?B?a3RlUDRUc3FaZXBJTS9XZEk5cmZ6MlVEZEg0YVpwemI0SGRHTjRwaGdCLzdQ?=
 =?utf-8?B?bHAwMGQ5SFVPQi9aejdNZzdvSUx4aHlVZm9sNUw3WEF0U2dmeGZHOGhUNHl0?=
 =?utf-8?B?emZ6ckM0bmpTRHhhSjhra1R4S0xlbGI2dHZ1aFo4UUF2RzhiQVFyMTEvLzk0?=
 =?utf-8?B?a1ZyTzd5SnA2Nm0yeGFneXdSd0JJRExIREZWMEx4UDNmRXJ4TCtwVEl3dHRu?=
 =?utf-8?B?QjFWMEhqS2VjTzk0OEg2L1pWeE8yeElFZ1hnaHllZms3WkhabjNaek1hdFp0?=
 =?utf-8?B?c296ekxIZk9xMVVlaGtrVlE0Mm50OGRtMnVRRFpJRWlKNHBKM3o5SFRGd0k2?=
 =?utf-8?B?TGZ5L1JDZnZTVll4a1ZCUldOVTBkcFpUbHBDekk4ZHEwOCtOOHQ5b3JzZFZ3?=
 =?utf-8?B?enpHQk1SSlpBaTNWZG5mamxKbWtLbG96Z0Vrdlpsak00cThWdmptUS9MNkhJ?=
 =?utf-8?B?RXFmbHJ1bUVqSXhkanRqb3BwS1FaZHRwMTU4dmVKVjczc3JUVklHa1Y0VmM5?=
 =?utf-8?B?ZGJlYXBtZEtUNTh5Vjhwc3NEVWp0YzJVeGdUOFFjNEYvYnRmc3kwQ0R5YnhV?=
 =?utf-8?B?bWk1MUlTa3QxbkljTWxscEFPV1RZM2NnRDdzWG5sSEhVUE45ZHdpYU03aXJm?=
 =?utf-8?B?aldVREpKb3RISXppbldhSjZtS3hNMkk2OSt1UFZlUmVTbnlwQlZweU04V0hx?=
 =?utf-8?B?YkJTQVNWZjZreDFscW1ZVm1KNWdOU3A1blRtdnhPcU9aS2V4Y0NlMzdFMnNh?=
 =?utf-8?B?SGlKS2RXVFZDUVlYNXVOd090Z2gybGlnbVlqMXIxejZBZWZxTkhmV3dYcUVr?=
 =?utf-8?B?Y05YaVNiNEpGN0h1UWE0bzR5RGh0djdHOXJIRVR1V29Tc3luNC9FVGVRcVkx?=
 =?utf-8?B?MGFSRTk4QmVuc2ZlY0NnVEFrY1orZW1kMHVVamx6S3M0SzVYWWg1UUg2aXph?=
 =?utf-8?B?T1p5dXdTSFRBbGQ4bzNaSjR2Y2xkOEtvMHRHV1g4OTQ2cGRwdEtjditaRGp6?=
 =?utf-8?B?NmtFem4zcFA2cTVXWjBBRGNlQUtGQ2FnOGdNV292YUo5OThiT0w1M1o1My9m?=
 =?utf-8?B?bityUVV6dEUyTDFzZk1YZUJ5K0JGTTZjeUZhS2NBeGhmOVg1QlF0Rk1pSDBR?=
 =?utf-8?B?MnZCOHVydFE3ckRYV2JmcWZlT044ak45VGFPc0RnSkdpUVN5ZzdUMUJieVVl?=
 =?utf-8?B?bjFKMHFpMzVFR3UzbnhsSUs1Zyt5eTRhSW9qNExJYUhRYnFEeTBSOE04UDda?=
 =?utf-8?B?L3c5Z3ZiTnVxeXdHeEZjRkZnbktVRTlYdzl0cExWSG1KMG5vRVFFdGJjSzN5?=
 =?utf-8?B?WGdHVDNqOWlkREdBZG92YUxvM0RndkxwRkhaY01ZY0oyMXhhTXFEUEdYN0Yy?=
 =?utf-8?B?alRSaGxIWUJwYm1vSWdtUC9CaWgwY3RPZHZsVTloaDhvNDU0azByTHJCZWVo?=
 =?utf-8?B?ckN5RDFqd2dQcmxRd3RHQmczTkk2a3VmSnp5cTM2ZGtxQ1FYbVE2MzR3Sk5r?=
 =?utf-8?B?NEdKbTBJazQ5OW10NkRNbjFmQmMrN2x1Tjcram1pVWlEcnJPOU1WWlJLTXpE?=
 =?utf-8?B?U1RRaXJQOEgwS3JpcjVHSXhtanFaUHhDeEsyS0tabjlCZE9SV3FhNlZhQ1dp?=
 =?utf-8?B?djl1KzFhTGpoam5SYXJnMTRmNmFvaDhoempVU1dRRzQwMm5EZmdtVVYyTGlp?=
 =?utf-8?B?K1BtdENWMzAwWlllYW1wSGdkT3FGQzBSbzJ0dVVJd2hmUDVLbEtldG1IZ2tw?=
 =?utf-8?B?eVRKdUtxeURTaDNETGxoT1VwRHBjTlErMnhXK21haDZVMG4wejcvZzc5MXZR?=
 =?utf-8?B?OWJLME5QdlZuQlQwZ3RBZFhYYnRwR09PYVVpNmY3RGNCSVNCeFEzZExQRlJp?=
 =?utf-8?B?VlZUZkxPRW9HUVpGNndWcUdta2tEMTB2L2tVeVhKeHF3RG15eDE3S1BGVURq?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jKLPobUTMETa/RgYBmtdUBYS0s9WzyAW8fGgFcOkIhyZtnl/E2L4Zk64X0/lN4uOVIg+GgvQBFuNzhmRt0K1ZZ8xWALnFZt3khV4llI05Kzj0lTfSJYJoUVMU0iEv+AGyx6xOA9K7nh0ixtMIxVSyGTCKIgcSc/pvYU8xEgjDWC6TFhsdArcnpURd2Md5ERCBoerJhaDityEu1SL+fMpVLkw/oxP2s1ju3zraH9gMID5ghd5U9EfH15l2Xxv3PK4jZkIAx/VHSU1r0VAtrhTna5S/l6psX3+G5Vz3UhNOqm6zq+Q7qb1PakXQ7ew5rqQs+2RbKhv+4oXZR5wtnRaalsmGt9NietP61GfsvoR4oOohZqmjqMuSSS/G8qw9X9tcWF9uYoCB8icz/9FCajp8eb6XTz9JP29KyY362MLjX151s4GEEfv3mx1gBB5xY204BrsYo78zurcpav+1RI00STqUYGjo2yxBj3uvosAemFUjicwedGHFcnC4XsSMB2IuZbWLYO5pVTuG4RSvHX2Yai8+G7abQfDbOqcrdOoPnx2f65gJt+ZIGWhOhn/L4VbW7s7TBQCiGtt+m7fkXRvEK/fEKczNHzETDXxXscQI+k8pyrtwyyJHN4UJIwMQJMBU82rG8V0T9NKJuLaUZrE1xlEF15LKCyDeVYJrYaRjRVw/JyzNgjy+XiRWIgo0x6/WA9NzGG4xFqAsY2mCoxHu2LM9xoX9ElADmcwCX9hqzxuRJNQWu51A2xn0vOkjCC4syUNklZXtPFEKl7IonheAjgaxb3YsYzP3TI7b46lnEISJ4VG8vcdIuxB7WkM5pW4
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e62945-61d7-41b7-dc0f-08db68cc9c2d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:33:40.8718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zp4sMiuiC4Ju63yn07bE93ub2r0fOFmOyfVlJFgqERL/cBa9NSR9BMp2xnw4WdNU4JG5iF5z4cyCdXJ0rn/vzsWKCtVY9XSdm45Yl3MhS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7223

On 09/06/2023 10:31 am, Jan Beulich wrote:
> On 08.06.2023 19:40, Andrew Cooper wrote:
>> MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.
> Right, that's one thing which should have been done right away.
> The other is that both macros should have been purged from
> tools/tests/x86_emulator/x86-emulate.h (which includes
> xen-tools/common-macros.h). Luca?

Hmm - I explicitly checked that, and concluded they didn't...  Happy to
purge them if I'm wrong.

~Andrew

