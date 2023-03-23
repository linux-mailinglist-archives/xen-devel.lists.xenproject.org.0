Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32276C73F0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 00:17:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514101.796062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfU9x-0001Yg-TA; Thu, 23 Mar 2023 23:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514101.796062; Thu, 23 Mar 2023 23:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfU9x-0001Wb-QE; Thu, 23 Mar 2023 23:15:53 +0000
Received: by outflank-mailman (input) for mailman id 514101;
 Thu, 23 Mar 2023 23:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfU9w-0001WF-GX
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 23:15:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3363df7-c9d0-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 00:15:47 +0100 (CET)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 19:15:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6735.namprd03.prod.outlook.com (2603:10b6:806:1ef::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 23:15:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 23:15:40 +0000
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
X-Inumbo-ID: a3363df7-c9d0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679613347;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zh/JyFdlR6wywtguwedVtP9BEr3jtmvAJA3r2nKpPac=;
  b=JuDGZW2WPc3PV9NPT7ScCTSHxq6f54lr0nZl5s9gd2evudWU5rMacgDI
   sXgG9FkplhqOL136DOyOT1tfHyNs/c03NowYXOErLkZBaxqOJcQDapEAw
   XllXBCuawco4ItsgbflnOWU6oUQ84bkOPJGNNswOjYA6ebOdDusKqHxYU
   s=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 102519163
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:C7wHaa//7EUbWeFMB7/NDrUDA3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zBKWDrVOKzeZGqhf9x3boq+90IE6sDWzNI1SwBr/no8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoQ5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkUy
 NoSNnchSyuPoP2T4raqZ/Bvt+4aeZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUuj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpISeTpr6Ax6LGV7j0DMTcfWGTgndDnpny1dIliE
 Rcm3jV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hTGvPSkYK0cSaClCShEKi/Hdp4U0ggPKX8xUOqe/hd3oGhn92
 zmP6iM5gt07h8MRy7+y+1yBhju2v4XIVSY8/ACRVWWghitpaYjga4G25Fzz6fdbMJ3fXlSHp
 GIDmcWV8KYJF57lqcCWaOAEHbXs7fDVNjTZ2ARrB8N4qGvr/GO/d4dN5j04PF1uLssPZT7uZ
 gnUpB9V45hQenCtaMebfr6MNijj9oC4ffyNaxweRoAmjkRZHONfwBxTWA==
IronPort-HdrOrdr: A9a23:LEtX7K0rsB4+6LXEAYylSQqjBJAkLtp133Aq2lEZdPU1SL36qy
 nKpp8mPHDP6Qr5NEtQ/OxoQZPwOU80i6QFm7X5TI3DYOCOggLBQL2KwrGN/9SKIVydygcy79
 YFT0BiY+eeMbDI4PyKmTVRW74bquVuusiT6Ns3gRxWPGZXgzAK1XYeNu56encGPzV7OQ==
X-IronPort-AV: E=Sophos;i="5.98,286,1673931600"; 
   d="scan'208";a="102519163"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibw88twzpD8/TzcaJpHeRiXL4egJ7RA8a1OV7oCRzp5tLuls3fROTIe7Mp+1X1n4hl2oVpR2AWQO4NLngNM/z4SAIYinHbXvYcUlWUzskR7JBr27K77+KD0cKtylZ4m8z8oSBV1VyzHoYaFNWiltNEUFsvJ2Az7dw0C9Bm3dcWyeZTj5aYQ+GG/NDI3va2YYnQmtuf5D9qfy4Gt9hndiZ4V+uufuibcxYxtt4K4rObB1I9O2OjAcHgVtfz1eMTN91K0/NNx4ZjDC7qmdJyZtDAhpvruOv8duj1lSyRVchQc8mEY+ev8+s8Ud/DXrYBv8qh0bxSn601zp2YDM9V9JAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh/JyFdlR6wywtguwedVtP9BEr3jtmvAJA3r2nKpPac=;
 b=SHjgHANDmRKskgKxRsIXLvcrHZc0lxxaaptY0d8GcLcPAZL+/XQ1Q7Wj7ny/xdEdaCxqDLTMHwzsrv9crjaAsUV7mPspoTjr6UXLuxquALvaSLpEQfIgdMAbhYI3it4dgK2qTfI6mW219r8Zr+zxieGovKMEMv1+crXfzDaDsXiM7zZyNzjawqUPBcRxt8myCmY8WZtkPt20Nqmg0MiNr5DF2jJZkogPHtXVFHeDORCB2iF7H+22o75BhVVpG81DT8+L4FXloi/CmkMfWenQQh2LPfBS+R7Kmr9NzIfzmLF2ubOmkdj2tt1qoqTkEd6yS6YpTV7/wpJ2w/G2gjY5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh/JyFdlR6wywtguwedVtP9BEr3jtmvAJA3r2nKpPac=;
 b=DEWmwfiNV5txcFeOz1rCh+lyDmEHsX8i4uJQLPOZr6u78/y/ThO5dm1xmkYttwQgLegul5Ww96NbVaJCAr4t1Jmi55ZAl9atlHTCBLWYbY/1Kw27sRDWp6iKwIs5XDoZtpk9GbZ19hBzEDzc4tRG+1qLTxGiWpNdYlKlAkKIFlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b883ed21-6b5b-4212-5dac-12d9691d430a@citrix.com>
Date: Thu, 23 Mar 2023 23:15:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <11398184-dff2-cbe1-bca3-e2862cfbb104@suse.com>
In-Reply-To: <11398184-dff2-cbe1-bca3-e2862cfbb104@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0395.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN4PR03MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f91ff2-9563-4138-7ae7-08db2bf484b8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6RrZ+7bW0drg2/kItLKbKEWWITe5PT6WR195SLPCLN42HsvZN2eLAjYt3XpfzOJA7BOGUeDb+IEikH21bWWTC1kof+aTPZt+f3YwcFB6oK769BMs+lhZSyI40shlfnGXHssMrA2YRoJV1bYJHEuVDYtLI+8vlFDopFTP05oddm7uozf7uP7/sUJa8Y53wfXeXrxRt5tEAsq6jmqHP2JAXIi24B0YsYOgs3RjihLKGrS8tetWd+5/Q+DSUjjJ1w3zcTjevCjEOP2LHAHEaf0V7zhsTY0oCmy3KPrXdssWw94g/s6RFDh35fmSeaY3JgP9oaiDwnnG2HTf3Tv9MviHpQGWPu+9b+fcgdU2+thfF85TK+mHtBB/MTVe0C1/m+z8Pik39XSqzHcUnEyL/grvy4xmXh24yJySiijFAv20LLk9ltCyImqn8jfhTp4213D+rIFf3e9qFgSNl7uCfwKurgL1Xg//Fm3iFpo1sCYqyOEDer7j3K7u/zxjEUDIEVdGZ5UQWy1WDwqaUlsykWdU3XSkIanKrLe4MbqXxBMcn3pOj7QjPkBSeFMnb3gnVUhskA+Ubb87eOHM2XfrDNXoeSPuj2XR8qYMgUD/FxJ2tS6erLs3sVDeLtLSn9pnUCiMkY0kANsNjH0Di+RgRxf3uDzJlD5HTBS+qkRyIWPy61ZFuW1GN562fkQgTikMBkhNgTxWhPfW7m5UVaAs4SzzN/HR/QQd9z2hnGOs5/Ey8WU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199018)(36756003)(38100700002)(6916009)(86362001)(8676002)(4326008)(66476007)(66946007)(66556008)(8936002)(41300700001)(6486002)(316002)(478600001)(54906003)(2906002)(5660300002)(82960400001)(31696002)(26005)(53546011)(6512007)(6506007)(6666004)(186003)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1VINi9PVy9wWUI0cW5iVlk0c054bHZ5SVpCaHZ2TFFnV24xQWswbTRGZnRE?=
 =?utf-8?B?bkxXMTVydEM3NW8vUGhTN25TUTBtY2JNcWtSMXpwU0Rra0VDL2hld0FKam1J?=
 =?utf-8?B?c3VjQzJLVjF1YmhTVWhTRlVJU2pIcnJIbzFBMXR2bXYwSExpYWhnMkl4OUxM?=
 =?utf-8?B?SW44RGxVUzVxcnpqakEvZHMzc09rWDlvQ0Y5RzJCWTZIaWF4QjE0N1hqSlR0?=
 =?utf-8?B?N0htUURmbFhaalRBaUZaZ3RTQndMMGwzME00ei9vZjRsZGJMbjV5Vld0N1BL?=
 =?utf-8?B?S1V3V3hnRHpoeVhxMnhDODlOd0hhejAwaEVXdkFMQ1F4RG5YYXN3QlJTSnA4?=
 =?utf-8?B?bGIyWk15S2NsTlJrWGFUcytxUEhENzNLb1NTNHI3U01MQzhMRUJNTW9vaWgy?=
 =?utf-8?B?bGhqMDhpZ2xYdDUwbmorR2U5cURseXVWV2dzTCtxTDR5Y2tSeVNUd3g4Mk1W?=
 =?utf-8?B?T3RmS28xczBuOEx1Z0U3RHJpRWQwZ2JIUlhTVmNBN3JzVnVRVThib2tLWTho?=
 =?utf-8?B?SWZUMlZrUnhwaWk3ZHVXNC80aHJrUGgyQTBxSWlTWWlOY3VlVzRSc2RwZFdS?=
 =?utf-8?B?WjFRU2lCV1c0SHBCR0ZCeHpGd0JXNThlSVBGM2pyeWpXWGkxTHZFWTF4dU14?=
 =?utf-8?B?NlpUZTlEeFgzYzZVWTlTQmVkeDNVb3l6M1IvY01HTmZDbW1YSERDeWlMdDAz?=
 =?utf-8?B?Y0NneC90d1RHS3FhMmFZZGVyNWp4S2Q1TXVMVzVmRGxwL0o3bTNQQmNBdFEw?=
 =?utf-8?B?MzVZWXhCUEZ1bU1URnZ1UGx2V2NNU3JhTXJPeGZNbkpCaDhzSEpTNHFVMEQ2?=
 =?utf-8?B?bFJueUlaMVU4Uy9xUmpuRXRpcTJxZkV1RFV5ejV2RWZBbFVCRUNIZUVzckN2?=
 =?utf-8?B?Q2IrTWRUeXVtVDJWdExKaFRTaG4rSHUrSVpSTE9NUyszSTJFcDFQRGlTdkhp?=
 =?utf-8?B?cE9qMWU0cTBBelNsc0UydXdmSTc2aElzMzJ1UDFLWkZlYStZdTEwemJTWUd2?=
 =?utf-8?B?ZE9KZUYrY0VCMnZUaGRpVFp2TG56dlpRSlpGYy9uV3VZZ2JJNGJleXdiNEtj?=
 =?utf-8?B?dkdLTHh0VVJEdm9GRFE3QlpKaFhabTU5TTYzWExPcEw0YlBrbzJ3L3NYQmtK?=
 =?utf-8?B?RDZpazg5TGJSV1ppaDF6R20vbFFYbDYrRkkzNHZTaGhoUTQyVDF4T0ROdmla?=
 =?utf-8?B?eFRNcHU1bGRkaitxSDVsYjRHa0pITlAyM0d3WU1Sc1Q3ektRZmZFYTVVeUcy?=
 =?utf-8?B?cHhoZlVETWYrRHE0UjBuT3lLK0E2dDdvTHZCU3J6Y3M5bytUdzBQY01qaXlQ?=
 =?utf-8?B?cmRmNm45bHltdW4zWGhuRzBPOU1CL0UyV3hBUmNoZHJLT0ZTemhubXkwMlRT?=
 =?utf-8?B?RHZMWUNtdURkSHlRNjVqSVE1WndBUU04blhUdGZvZ3RVVWZ0VVp1N3JwdzUv?=
 =?utf-8?B?SythZGx5OXY1dWRzcExocmxvc1FWWnlOMFNJbFZVTTNISHRaUlhLRUlMWmd5?=
 =?utf-8?B?czVabnJhRmtkNFBlczhzTmxJYjhlSENCTzNQWlBmd1kwUE5kYXg1dnROTW9j?=
 =?utf-8?B?SmlTWkpydXBCRTg1ZVhhdWtUZ2ZHMWdlSFl5ZXlQdmtrdzRVMlhrU3pPQUZT?=
 =?utf-8?B?VFMrZ0VVdS92ZFcxL21vZkphajFMbWJqWWllRktVQUc5WnBveXloZzdOUlNK?=
 =?utf-8?B?VUo4U3grc3NNNWwvUVBySWtXVkdsaFg0T2dpYzgzTXFMMU5hZXhzRldwR1p5?=
 =?utf-8?B?NFc2V0l2RlIxSjFaZXNMVk1JRHh2VFpQY045KzZNUXplcHIzS2QybENPN2E5?=
 =?utf-8?B?U2JLbExMeDNWWEN0cmxybEorTVJNUTZYSmE4c29rWDBXcFV5dFRvZEh4N1I5?=
 =?utf-8?B?UzhzSEpTcXgwTFQ4Z3duYVhQNkVkMjFOZnVEQytXV3JRekg5cHBrblV3V2po?=
 =?utf-8?B?V01LNm9RSk0wZE9ab0kzQXp5bStsM2FoeVJiMk5sVWtXL0tQOUxud3NsVktF?=
 =?utf-8?B?RHA5M0s5YzlYU0hHbzhEYVlCZnNKMnhKTnZrUkowOHZVMkR4cUFkZm04WEUw?=
 =?utf-8?B?LzYweXgrT3JYY0JBbUhHV3lRUXE2alpCcll5ajRBWmZ3aFFtTjN2Q041WE1E?=
 =?utf-8?B?MWxKczlHblR5UEt2aTdXa3N2YitmRDBPWmtUUWlmM0dlWStTa2FQK1E4SHJw?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rUE82D64cZ4XvDM9UdpzE6SSFxLkeqiCouQBe9yj/CRMTYl9rEZEr662GgAK8S735xKnFS6Yz9p3VvvamzOlvwl2CkXDU6ojHrkSFv2+vNkTlUjcfHQxopPNQ5KD8cgFtSTiVO7gtnJ0Trfs54Zg38PKFKoPMeBNN4FjDrny2RYXSv3VBk1h+WpIK3wfAJkHS/6swmPel9jLD1fcNM1KPZxKM8rlDhsNCkRWbRR3EKiZBLl8HdYWsYaPwcWAB72ZBf1GT0eE2W79Z0X+fXbqWrx6SkimVcv38/mh0C7wWJUE717NZymqFUlG7O4QTY+z3IQ6djXG7wCcbPq7LHY0XpiX2xrXxpstJcdnZs2xMeHnyXoZMEqkKSAeuEuS5v4+uvYFRDOFokdfTgUkzpMMOy/BsfD5+AEKNrfxjtGeYXXp5YXo2Fbcx70IHYnk2EGvFOgejYIAGS+XD+N21Xq2ENnCo4SPBJWSC7FSha7DpEivMxoNUJj61K5cD2ICkmBztexQgCKWuc9qMoAa5zjuaxx2YkWj513gd36YW3P22WUP+ZRKxR2TqLfm1IyFU29ZE01OkC/b4BrGFIn/aCcYmNKMc+pG5lwp8BxltzShRODEVe3hmpuy39YeOW+D3YSW1B4291cQZPwSUMoZ/ESji3VWX4N9KjKDnoKW7w525DOu5Dx5dn0LdhrnuWhiR3ynjfV2mQquq28MJlahGLsaM8okzkhtXF3JAF5MKNmuAbV4WVytkw+xLJTm0rPPIA2zd160+ipib7JMg3y7kxquVmPjx5gWmoaHKnNi+OKsTJ2YpJLf+HMGb/x6/eF7N4DArTA5duHM6TVnD/KEE0kMmm1wl3Ro79PDIItR9A/mTxkcdiEwYrfuDIhVTE6jMCUilL99HOms/pmFzZ7arb0bjA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f91ff2-9563-4138-7ae7-08db2bf484b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 23:15:40.5816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Zc2oVbnvfmchMKgk6i0o4agezOETM4YxBMRj0uRnjVH9rs6da8/8Pcd22h/hwB6IBiKF+U24xQXckwymr9hGs1O+KEZqottRker5jvDTtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6735

On 04/02/2022 12:54 pm, Jan Beulich wrote:
> On 03.02.2022 14:38, Andrew Cooper wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1693,11 +1693,8 @@ static void load_segments(struct vcpu *n)
>>                   put_guest(uregs->fs,   esp - 5) |
>>                   put_guest(uregs->es,   esp - 6) |
>>                   put_guest(uregs->ds,   esp - 7) )
>> -            {
>> -                gprintk(XENLOG_ERR,
>> -                        "error while creating compat failsafe
>> callback frame\n");
>> -                domain_crash(n->domain);
>> -            }
>> +                domain_crash(n->domain,
>> +                             "Error creating compat failsafe
>> callback frame\n");
>>  
>>              if ( n->arch.pv.vgc_flags & VGCF_failsafe_disables_events )
>>                  vcpu_info(n, evtchn_upcall_mask) = 1;
>> @@ -1732,11 +1729,8 @@ static void load_segments(struct vcpu *n)
>>               put_guest(uregs->ds,   rsp -  9) |
>>               put_guest(regs->r11,   rsp - 10) |
>>               put_guest(regs->rcx,   rsp - 11) )
>> -        {
>> -            gprintk(XENLOG_ERR,
>> -                    "error while creating failsafe callback frame\n");
>> -            domain_crash(n->domain);
>> -        }
>> +            domain_crash(n->domain,
>> +                         "Error creating failsafe callback frame\n");
>
> I assume it wasn't really intended to hide potentially relevant
> information
> (the subject vCPU) by this change, which - by way of gprintk() - did get
> logged before (since we already have n == current at this point)?

The information is not lost.  __domain_crash() prints current too,
albeit in a long-winded way.

~Andrew

