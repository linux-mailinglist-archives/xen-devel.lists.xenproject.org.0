Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9826F8637
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 17:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530495.826143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxk3-00025O-3H; Fri, 05 May 2023 15:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530495.826143; Fri, 05 May 2023 15:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxk2-00022j-W4; Fri, 05 May 2023 15:53:06 +0000
Received: by outflank-mailman (input) for mailman id 530495;
 Fri, 05 May 2023 15:53:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puxk1-00022d-6c
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 15:53:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaae084d-eb5c-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 17:53:04 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2023 11:53:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6157.namprd03.prod.outlook.com (2603:10b6:5:398::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 15:52:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 15:52:56 +0000
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
X-Inumbo-ID: eaae084d-eb5c-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683301984;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Sm0s9iLiLjSWIAhlHKEV5b7kBNV8HdDQ0OE9VOheIGc=;
  b=WQJG0GZjArUAdK9UPJTIrUIOspuuvapoQPpcdbeNLm97UD4H2rpLZx81
   MaeZDGJDcELSec2lNEUP4T9SYwzm0ZsN8HQa+jvdCJJ/JfOSfppN+vpL8
   nD5d5rifi7OgD7OFhHhaB6oshtD1vTzFoH5abTzt70bTUOpxhAFBH9EOm
   E=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 106781722
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jPI3pa/EMlGyIaVxqDWJDrUDVX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WMeDGzXPviPa2CmKthwbNvi8hwHscXcy9JmQAQ9+Cs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKgW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklB1
 tEbBzIRaSvZrOGM5+KAdrR+re4KeZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpMS+3hqaQw6LGV7jNMBF4JVH62m+W0iQmPB/EYc
 3ZE5CV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcUbzE30
 l6Cn/vyGCdi9raSTBq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbkRbnXttlVqmvgbXdGyz0w
 j2MhDgzgfMUl8Fj6kmg1VXOgjbpo4eTSAcwv13TRjj8tls/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8JJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:mVFTCKg221Vv/9cObtyo9GDf93BQXmEji2hC6mlwRA09TyVXra
 GTdZMgpHnJYVcqKRYdcLW7UpVoLkmwyXcY2+Us1PKZLWrbUIXBFvAf0WKg+UycJ8XGntQtqp
 uICpIOduEYb2IbsS+K2njdLz96+qj/zEnAv463pEuFDzsaCZ2IiT0XNu/xKDwSeOApP/QE/b
 Onl7t6jgvlV3QLT9ixQkIIV/LEoLTw5ejbSC9DKR47yRWEyQil4r7iExSew34lIkhy6IZn32
 jZshDzop6uufGjyhPayiv64plMlMH6o+EzdPCku4w6KijMlg3tXohnVrGY1QpF2N2S1A==
X-Talos-CUID: 9a23:wMiFvmGef5vLcef8qmJo12MXNcI5dUaH53TqBB+DNTt7Y5e8HAo=
X-Talos-MUID: 9a23:2uUruAVml9q7oCbq/GCziHJ9NeJl2bijCwc8zbZB4/PUKyMlbg==
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="106781722"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chCObT9cUWg4Nc/GOOjYrFuunw80VZy3hjHG3xAeG18yezY8Fo0X5gEprlyJRgidR79r31aYT5VD9pBoCJKnEYzqkRoRsn7/TX5mv7NLSE8jgeymCCDxDRYEFLpiNErVfO1RBjyzLRAETWqKYrpVChcmjt3N4A4X7kfiogCnNv8BFCDBhw8fUWwHvnEeIGZQxo1ot8Cwe7T/XdmjZGnxZy/51k3QQT55/NxD/wrcRSbLOqm5N0L0QdGj4b+FQiI+cRahjhlLJMvQPT2cwjMco3Mp+DbyiVomrW4kaxxqC238BQ2c3FYm0HVTtEReZiIo4A7VcF9WWczMF/CiISKYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fydBFIE5i5DlViiY+5e/fD7VTQF/UTnKjl+sl9XhRgE=;
 b=g3YUyzYZRyB2RmrZklqlfLssmomabhJ5nIneI/h4ezjm5DMnhCdU5ZF/ykuYMZ5ScLldlgRPM+E7zcF6hFCaYJkcDCJwQpBAheGNF8UvM8RUuW1Ia9mPP0WArvV+uta21hTxAuwbeEl1SaF5gV3k8VhSB1kL7xPDFeqnwAe2bFeGBkNM49mk76U9ena73otjGekcF8cBqEXoxkSOVfT5OmF/Nfir9Vkoe/uOHqkFKlPpMOZthonu1+nURbt1Kudyne8pHUHeXwtBeJ/HB7vUcnAKHu6UxzPb9OdDGrSI6kPYRNdgO4seUP8gMbjaWMKWZkDsIrIrMwYCIKhs70urfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fydBFIE5i5DlViiY+5e/fD7VTQF/UTnKjl+sl9XhRgE=;
 b=EBj/G74iOGGASfENyf1UwE9BsQYSadthU8zTa3UIYm61lJ2zQCGO6AdoS5QDE2IjWYZ8JbU2x1wSqaFgF668+4N7Aj7UpI+sOEmmGyTT6ulR+NCfgTR5J8m5AS8e2rSglHOg+hsEtl6FMGRfFKJo/VDQnRxw/zb99Ot1irADJfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <99d08cef-3797-ebe2-d9e9-8cf6dd49ed9c@citrix.com>
Date: Fri, 5 May 2023 16:52:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] LICENSES: Remove the use of deprecated LGPL SPDX tags
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
 <20230505130533.3580545-3-andrew.cooper3@citrix.com>
 <ZFUhLBm1fzlbpAux@perard>
In-Reply-To: <ZFUhLBm1fzlbpAux@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0417.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cb5b7b-152b-45e8-80f0-08db4d80cb05
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7QxzjctcORRJNHFGHAvF040qxnRYM1xse7wbpLvl+lK0YO9uHvKkEsTvhuuRlG7DUefHtp1jPa2iRIr+Tved5LYy6kv6528A/h68jL03mnkqFM8GXCanCxp7M3DaHmAellmt9FgRcYVyiHd2igyTlSbHELghD/Aw9DaUzQ+J0El4PLZ1iLp0hVZ9E+T9bdVSDkJcSF729bjsxMGyO9d2Zrmfxh35aKcKJLRyZfAQk2cBRU/RwfJMd35XBGkkOJafYsD7FEcAY+r1zWHGOPFter7SGSDBD3GgfTdncJFbXCi/C3g0A9xF4Sk3H/By2bGUI9vqPfDawhVus56JF6TlEnVjeOStJnMCBx1THBqW5y9h+MIkYBoKKoaVtwqD1DAPKUdHEIJbKTLtCh9qtr9wmUADpWIFTGrml/Pk3dO+cUmpb3+qn+jnPkAtKLvoMVOE9Q3LsmhvrLgpW47/h87/3uiSRfXIE63Na9qPYNH8QYUGyh2JzytK7MHjK1sP7dXexBM8AQvtwm2XyHOMkOH95TX+DtkbtUVQ0M2mmN46fCzOgcFIHqeTcOsdzblhfWrjRvUE71oqzlF8uE9L0yYWMkl6CCDbrkTBOXGOsQ+pqfczWw/9oAigsp9uTC6BAa9ZjgI4PP2nQ5yNTpFD1HH24A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199021)(31686004)(6666004)(6486002)(478600001)(36756003)(82960400001)(38100700002)(2616005)(83380400001)(2906002)(26005)(54906003)(37006003)(966005)(186003)(53546011)(6512007)(6506007)(5660300002)(41300700001)(8936002)(8676002)(6862004)(86362001)(31696002)(66476007)(66556008)(4326008)(6636002)(66946007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzU1TFVJNWE0c2hlWHF0YVE5SHJ0M1h0QVE3MENwZm9SMlFCYXd0MEJtSzlR?=
 =?utf-8?B?bVZUdlI4a1VWODM3a1pLYndNcTBSMGdhV2FxdGt0VkZzd1dVTmNHc2JyY0dO?=
 =?utf-8?B?UVNvMFY1T1d2QnBkbXUyV3krY21lQTdiZ0ZtTVg2TmdpLzRnMXhhdDFldmZt?=
 =?utf-8?B?Vkl5SWc5YUw1ZXZtNldiM2ZuOHplT3MrRXcxKzhSOVFsLzU4VFhWTmd1UFk3?=
 =?utf-8?B?NFBiVUxMUDZ4VGk4UHBueUR3U3F2TmtUenZiczdzZG5pZm9Ga1VqRUNCanBj?=
 =?utf-8?B?U3REaGdPay9aa3p2VC9HQzltRjh1UTJiMU5uMjNsbUE1WDFvOVRaWnZ6Q3VP?=
 =?utf-8?B?c2JJelNZSGx0cmxsN0QwbEVEMHl6MDN4TURzYlhxTkZ3ZEl1bm1CK1gwZ0Fh?=
 =?utf-8?B?ZzcwZ1Q1RlJ5UzdCMmw0b1NFelRYamk1QWJQajg2bmJCckoyKzgrazM1Z08w?=
 =?utf-8?B?WWloV3E3M3Qzc0NIbGRyOUsrcEt5M1A4MzNqR0FGaldZUEE3UHpWMFZOWGJ4?=
 =?utf-8?B?UUxKOXpZYkYvSVdLcWVXbzk0U0dSRkp2UnhuRkplRGJWdU1TMmZ2QVVmL3J4?=
 =?utf-8?B?cHh4K1h5dHNqRVdUelNjL1ZqeDVKRWt3aExZb0dseTNkNzBMaUNmSnUrNmN4?=
 =?utf-8?B?WE1sK1NWQTVOTWEybU9PK2lmMWlFUW9GV2kzMDA0U1kzWkJ6OVV2bVc5dkJR?=
 =?utf-8?B?Y2QwVnB2TDI5UGp2ZmhTMk9Ya25iT1NyRFdDTVJTRTNWNEk1S2x5cDdoYUUx?=
 =?utf-8?B?bGYyWnF2N05oKzlHeTZMMzQ1S2VBZ1p3T01aSldaMEpOSnlZTzc2ejBiczRW?=
 =?utf-8?B?cDdwWHdUSmt6MTErUVp5ZEgwZkE2dTRDUmZXazAxZno5WlpDamNodk11NzRR?=
 =?utf-8?B?bWJIQjFnRkVodlVHeVdYMzUyV21IVUJ3d2oyckcrK0RZcUk2bU15azc0bDFI?=
 =?utf-8?B?d21tMHFvdVdjbVU4K3A4ODhZemtkMFlTRkdLRWpuZk5xTmFOUjBPMXpQQUtk?=
 =?utf-8?B?MUwrZ2lqanNMOXZtKy9xdk1zam0wcnlwUk1vM09XQmdJd2JLM3pwZjJranJr?=
 =?utf-8?B?eHZtaEkxeHA4TXJuRkxRbmpUNUdkdDBUTWpKbncvdSt5S1lHdldRanlwRysx?=
 =?utf-8?B?VFRMS04rc3AzUkV1cmNlYXNiK3AvS3VaQ1JpVURod0hSSGRDL3pHRFNkVkV4?=
 =?utf-8?B?VFl6ekRCbDQxYmd1M1l5ZzgzUEkwaW9VYzl6VWJWSHg0KzhLSXBwRWdlY081?=
 =?utf-8?B?UzdUbW95NkFYdmJDTXAwQlU4OWJJcG5uUkordFNIVlpmUzlvam50eTF6UEZ3?=
 =?utf-8?B?QU81ZVhkTVVzUnkrcFdkSnNQbnBnY2RGNVVtckFPb0JuZjBuaXYxczExbXh1?=
 =?utf-8?B?bjVJUEphOGhPeGZvN3hsT0RyQTJ4NGRMSFhNTG1IK0hzenNVcUs0Ky9uSmJM?=
 =?utf-8?B?R2Nkc3E1T3phSnpSZ2JBT0N4VE8rdEszcXVrNFVOdUhVYjJ0T0hERUJGZzFR?=
 =?utf-8?B?VWkrOU4xSWZDS1R5a0ZrR1haa2NGY2R3QkJrck1HdThBTjgvZzJXd2VjTDMy?=
 =?utf-8?B?QTE2WDZEVkVmc0s0ZjJDOVE3WTNQR2JoWFBVdm9qM2FlVWkzeHJiTVlVN1dB?=
 =?utf-8?B?MGVCcmNlK3hlVVBnaUpySW9rcW0weHBrYUhpRmUvNGlQK1VPWFNEYUxnZ1lY?=
 =?utf-8?B?Y1ErbFlDellsRmxpemtZbE5mSFNFemRsbk4zNFlPQnZ4bGtCT1BaYm9zbFg5?=
 =?utf-8?B?SDVjR1lURnpURmdacVlKUzNuZGwyNG54Q1dPWWNYSnFkK3FCakhHbUtqWUJY?=
 =?utf-8?B?SVNrSmZsb1JhQWtuVFE5Z2M3YjVoWmdkUUJTT3l4d2czK3JRcmEyYi91aStG?=
 =?utf-8?B?VkZ6OGh4ckRSRCs0MzU5TUU5SStVbFQ5K25VQnREZGZFcDVDcEtpTnNvVTJp?=
 =?utf-8?B?T2JTR0svQk0wK2JzRUlzcXF4SjQ4bE43WEl3eUFBSjJqaDdGQ0prcEtqNUx6?=
 =?utf-8?B?NXFNQzJ5RnVZSURENTcxTUNrbUhiZmFJS3NQdTVaRnFRUVFkVW5hWUJreGlR?=
 =?utf-8?B?QkZHa3pqc0t2U2k1aE5NMENhRnE0eFkzWVNTTE5xSjl5U0NyR2o1clM1aW9x?=
 =?utf-8?B?Vm42NlFiaFp0cjZIV2tBdWYvTHRpQXJWNkFPNVlBRGNDNmFwV1poWSt6NXNj?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4wjvGzmeYOZvvHlTi7vNURyutoInjjwRHCHL3K8tpc073zb5Yn4OfxZdBIUikdTfuSOPIsoFrNL1RWQnLtoM+XUcWxA3ANWC48re/WKD4wq7TIUwRDq0Etmu2fX4R23Qe46sIKJGoRK4AMgxMaIn2TF57tvHjVCLQEOVEkohgyZnBYq7P36rGxPXR+cs01XOY0kVvTK5wnJV+juuN4zUJT9NYguHQHPhAxikMP8MXeimCb3KXcur1rbda8TbM9VTEh67hDE5Fh6PPKYCuUTkTgUzkHywue1ppTrXxFvzjFTE97oPVs1zT9GiKmb7J0d3Da6hXAS035vpmUE8Cfix9ZD+B8YHa5XFp9K0e2kZbbOULp6VURADFlj1M+GWtoE6aX4+W2CVd1S1jt5nUZFqA+FpbDgNxwbSUsqMM3AiNmJVRg/dtNEqtkhhfM1C+D1U+UBb7vIb9XiZT/uv/u5nVLI4a/lDOj1t3Enjue95+qxY9uNT58KKG/mtVprVrnW47rtYq9mKh8QODLy5SGfBBk1PoGQV+tVqB74Q6o8zDudMoWXONgmZvXp0L3krp7l/TJw6GsIhP7Acale+12uRH+lBLuENBgyIvoZpPnwrtQw06YyQazoXkottCti5P6BtRxtelQGTrMNea9Y6ohNsVYrkY0epcsiUHXduhEOFH8wgPG/1R5xgaF1XdmNzqbMmhyqq5Bf0xdSLULfrSGLIgFIKiySZnzv7YsPqOFqxI6ngsU7jlvCVd1hLChTJM00uvmUvTMP5dfT/pwViDCimZsf6zccSpJIctj4qht9NUOPpvwnljn8LvyO6S6x8JxqawPREW9FQRRsUjW4IhXFl/rcasImQ/1247O+9T7y7t3M=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cb5b7b-152b-45e8-80f0-08db4d80cb05
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 15:52:56.6417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p92S88biTvrHLcGhnd2jy7PuhDXKNcdrIw3g4VhCpteBeOFD4vxQG1zVjLYeTIs2OxWN4u6xeqV61Diw8DZZ7qQKoVjDxdD4Dlx9ezOVcos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6157

On 05/05/2023 4:30 pm, Anthony PERARD wrote:
> On Fri, May 05, 2023 at 02:05:33PM +0100, Andrew Cooper wrote:
>> ---
>>  LICENSES/GPL-2.0                    | 12 ++++++------
>>  LICENSES/LGPL-2.0                   |  8 ++++----
>>  LICENSES/LGPL-2.1                   |  8 ++++----
>>
>> diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
>> index 0022a7c17788..dcd969aa85b5 100644
>> --- a/LICENSES/GPL-2.0
>> +++ b/LICENSES/GPL-2.0
>> @@ -1,8 +1,9 @@
>> -Valid-License-Identifier: GPL-2.0
>>  Valid-License-Identifier: GPL-2.0-only
>> -Valid-License-Identifier: GPL-2.0+
>>  Valid-License-Identifier: GPL-2.0-or-later
>>  
>> +Deprecated-Identifier: GPL-2.0
>> +Deprecated-Identifier: GPL-2.0+
>> +
>>  SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
> You probably want to update the URLs as well, this one point to a page
> with a deprecated notice. New url is:
>     https://spdx.org/licenses/GPL-2.0-only.html
>
> Same remark for the other licences file changed.
>
> Also, maybe they want to be renamed as well, to match the identifier,
> I'm not sure.

Hmm, all good points.  I'll update the URLs because that's easy.

For the files however, the GPL ones already discuss both the "only" or
"or-later" forms, so the filename already doesn't match the SDPX tag
specifically.  I think I'll leave them as-are.

~Andrew

