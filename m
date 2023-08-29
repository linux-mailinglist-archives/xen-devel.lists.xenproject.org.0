Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F71378C77E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592314.925010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazfG-0006eN-Ok; Tue, 29 Aug 2023 14:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592314.925010; Tue, 29 Aug 2023 14:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazfG-0006bX-Ka; Tue, 29 Aug 2023 14:25:54 +0000
Received: by outflank-mailman (input) for mailman id 592314;
 Tue, 29 Aug 2023 14:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiqx=EO=citrix.com=prvs=598c0cf4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qazfF-0006JJ-2c
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:25:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2ef5a58-4677-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 16:25:50 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Aug 2023 10:25:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6641.namprd03.prod.outlook.com (2603:10b6:806:1cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Tue, 29 Aug
 2023 14:25:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 14:25:45 +0000
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
X-Inumbo-ID: f2ef5a58-4677-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693319151;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J66kVp/HDY0A+uQ6sgaKgszLYB9xsKbIFzTdpUpLsWk=;
  b=O1EzuVuC8vMWfVINVTEMB485gIZqnzwPu1EondqbLq/UBc+7DbpPArF6
   gH1VRLNVqEQRLuU+sYBM1jPX/tj3Mg7nXwJddD5djhVljtT9PKD+xVXR+
   p65Xc7zZJu4JefJppdAGThQ82VBjyayF6YnERNz4DnZFSzhxPWimvHeIJ
   Q=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 120855061
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ba6N1qgZn975Nc2BmAYIqiNuX161pBEKZh0ujC45NGQN5FlHY01je
 htvX26Aa/aNYmvzKI0gati/9E4HuJXdzdVgTwBu/ChjEngb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyo0N8klgZmP6sT7AWPzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ1eTsxQDq8qN7x/+yWF8t3lvYpPIr0adZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TefgpqM32APKroAVIBMXZ3H8m6C3sBCBHNZ8F
 HROqggIvLdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebT4r0
 FiJ2dDgAzMps6e9RneU97PSpjS3UQAFIGlHaSIaQA8t59j4vJp1nh/JVsxkEqO+kpvyAz6Y/
 tyRhC03hrFWgctV0ay+pAnDm2j1+MmPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:VrIXuq+mAy93lsuwSyhuk+DYI+orL9Y04lQ7vn2ZKCYlFPBw8v
 rFoB11726XtN9zYhEdcLK7Scy9qBrnnPYfgLX5Vo3SODUO1lHYS72KLrGP/9QjIUDDHyJmup
 uIupIRNDVXYGIK7vrH3A==
X-Talos-CUID: 9a23:vPuXZGNnNkhnie5DdXhsyGA+Je8ZNUKD4SryOF+KA3YqV+jA
X-Talos-MUID: 9a23:q4VWEwu7e3/vk5n8b82nijBQHoBSuqqUVn9KlbY5g5PUFwphJGLI
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="120855061"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtcYb6kdwkLXiP5T56E3bvXtQAQc9luX1/5zVG/02zXKhasdlf5sbLrRwFLa/nmZK89fsHSOMvKcMAJThrhDHa9fV/gY1aetLZh+tI79hnUqqVyN6U/ZCFcipI8osETdBvTUHHvwoDGyBlFsOl4ziLGQW3aMB9CTsPHXS5agOBGTGm1jXWO+cYHynVAYCwED84LFoTioW2JMycWxIYikVNFafuFKxF2siU69wYORyp7eGsDRzh9L4wcT1i9aWOXP/OQ4NV6t7SBraJ4ZoJUIaRrn5EFaUGoUye8WhJKqAdowEvSaqjB7aLb8u30fN3YUAQ4DNnZBp6CcRZaJG9SGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+wQ7Ben+xcbKUHXeLrwASrD+Z+XRv/FK5/PISgOCuY=;
 b=Mkom4c42+c3YzTPtjR+YC9Y3t+eUwXiJ5snvdtMrBN8CVqoyZrw7qTxCPie8uiEOrkMbKaPutUvZx+o5clg5lSR9339/Oy2Mx/3gnYoiiZ6IBZNaX8I9dJ2tkUAqTR+Wl5MCTZLD8fQjKSVC1kgPDFxWmTtyut5YSAIZgeMflzMRlgSR5B5mjl69AM9akHIV9XPOl21fgHZSQyqHgpszsEk4U+/lYYGZYdJY2TIhBjIw3nW0Fsj38Xq4LOJaxTIMnCvnd2HfSXuPxCvOj3YomHTX8SDerafiAXoJtF035KS5G87x3azdcTTM3vFFqS4OSHgju949lPVsJGEU/VQ9vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+wQ7Ben+xcbKUHXeLrwASrD+Z+XRv/FK5/PISgOCuY=;
 b=rpNxjHhxYAj+uULX98mkWNk0x6yOKYJhoN6999txNg6IdMO/GLtlp2cjnoajb4Ljj8ygu6PmPhB5M69QnWPw2JEAmL6ciHVWV0aEE44dhQouKhYgjDxi05my1XLGaAPlLGaXTss1XSA1IV8GhSjImqv/vjhtjh+m9O4ebDOe7Ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <26efdab3-5565-5da3-97ac-d891ba80f2c5@citrix.com>
Date: Tue, 29 Aug 2023 15:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86: Introduce new debug.c for debug register
 infrastructure
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-3-andrew.cooper3@citrix.com>
 <959d2a24-bd66-8235-8497-8b662259fa80@suse.com>
In-Reply-To: <959d2a24-bd66-8235-8497-8b662259fa80@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0304.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8d710e-6f46-4c3e-8c82-08dba89bd500
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PUQdn0z+8xjG4uS8eY/G+6Pb0Gtp6IkO951Ex/1vr1Trnj3FCbU5/pX2J4W9WZJ0HELyoVVtQHcjQ2mPkVcKldbA1VZ5STMWBdRDcDpoCYeN0Jk1yVBKq2D+LJNuhaeJn3ouW2MZ8Xa6bsoRQ85oWGmEbn/wqM2lxADHvK/QDm7O55CM1/Zp+IP6yEByvwy83iK5pkihHs9HFCmssbhtbVLRZ3stJkIw8rWEFtnS9DrEZcBSaV03wAXQ3aKkDrq4DHW7e38vadj5JFFqB4b2GyUgR+7TovhxjF1LCRVv32U7049XeJoJ7oPCcYnvo9Sx6qilP+pzQSF/a/S26fdOCpVh0dxGkz0iQIjmJG0A1zKJ2Goh/wLyMtwTeWK0IHSF16hvGKFQekfVKUaPSdBp8fb4feedkrLmF0zibKL3Uu8KrXk6BNMeYADGPGjlaPiV0B3Z53km2RheZgL/V3502sOafQz7Rz+rHo0TQHR3nx3Wspz8DXW1fQip87/WxsoPLl0IfeRHhiLnn1fbrvf6H2Q1vCQvxO6/i6c/PfsYEr+u2+qx4eXJkIrXcJwNBvCsr7DFrn60ncvbVGmXicztc7y9+h9zIZ9Mg3DEPsyHQvF6Bof/2l1hWqOKFPfb8E1dhS6cRCDWpYebzgmbHFRYUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199024)(1800799009)(186009)(6512007)(38100700002)(316002)(6916009)(41300700001)(82960400001)(2906002)(4326008)(83380400001)(31696002)(86362001)(2616005)(26005)(36756003)(5660300002)(8676002)(8936002)(6666004)(6506007)(6486002)(54906003)(66556008)(66476007)(66946007)(478600001)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG5LVjZUanFEV0lsRHkremRUSGhUZVVPSDhadStKMnlLWWd3b2svMEpxZUpo?=
 =?utf-8?B?WTV3YytoeHp6VlkrNjB2alFPTG1mMmFVVXp2a0VWdmxvSVVMck9xekFWWE9S?=
 =?utf-8?B?cnpISW15NndDM1hPUkI0WVljUHB4dk5YT0lhcjhDQTNyVHhIemY2VkhWZ1ZK?=
 =?utf-8?B?RlF2czNHejAxb2s2NDByTjVNaTIxeDMwdUhJTjRxSlFVYitLREtGcUZVRFJG?=
 =?utf-8?B?Vmk4THltS1NYMitadHJnRXJJOEVGcWU0UTBOTU9ielNNY2loa3YramduK3BU?=
 =?utf-8?B?ME5hdUdoVFduOXlTQmU0V29KTUJ0N2FpWDF5YkRBVUhyTCtvMEZPcDlSZ1FN?=
 =?utf-8?B?eENPUlJ0anBlYWo3YVZwRmM1UTNFR2lCVjN3MGlWVlFBdy9XSEZzblJmWW0y?=
 =?utf-8?B?amJ4R3R6VlRYSmtxVG1sZnBDays0VFAzVzd5M2haS0FiajdkM0pOQWxMdkM1?=
 =?utf-8?B?S3d3RElIdVk0RG5leWJKWTNMRjlNeU80MHNVYUI2QVhvaHpvVytaZ2ZmbHFJ?=
 =?utf-8?B?U1MzLzdmNDh6eTNaQXZ3OTUxMjBmQzhmNlFtTHA2eW9FdHBxWHMvaFJHenI4?=
 =?utf-8?B?M1A1RGRMV0c5cTY3QmozREZZNkxYQ1VWWFJLWnBQWmMwTUQ3WDBSN2R4YWxu?=
 =?utf-8?B?N2hDQml6RFpEcWxLWWdIR1lYcGt2azZTaFFSbjlQcjBBTWxSa3dVbWoxbm1T?=
 =?utf-8?B?ejl2aFd4QnlxYzZFRUhNRldqRWluMmZZQmlvQUNZK0d6YzR6N3JxZEFnWnJJ?=
 =?utf-8?B?dkc1a1p3RXdFSk5SYUt5THZuaGZuZExiRFhrWWRqMUlMM1VmVVZ5OFRvYSta?=
 =?utf-8?B?ZzlkYUh5L2NwR2VVTHB4UW1vbVNjODZ0b1FJeVJkWEl4b1NYU1dJY2kyQmdN?=
 =?utf-8?B?Ly9ZR2MyZWtMOGhHdGNQWjhtZm5uY2ZWazQrWnZ5MzdFeitnOStEQWZRcmJl?=
 =?utf-8?B?U2lqOWxCS2I2VGVqUWl1TlgzMjFSK1RqTGZsSEhHdTVVT3F1OC9KTURPVzc2?=
 =?utf-8?B?Q1F1RDI1S1NLZmNSUFZzNno4aTJSaStGSWNSRkxLTFdwa2xMWE43a1JnRlZx?=
 =?utf-8?B?NVg3RjlTRzBrcUtJMTgvM1NoT0F4OEtVd2prUGVXZ2d4K1JLZUMxdVBiNStk?=
 =?utf-8?B?YzVySTh4M2hoWm5kbDdKRk1lWjFQRTYxZGdBb3VwOTduR1NkU0dNOHdzbWVF?=
 =?utf-8?B?TEpWQ1U5KzBRMERmaVFJZ3BDckFJSEpCQ0xveEIwa3Bsa0RwdVNIYUpWSHB2?=
 =?utf-8?B?UU9lRnhzTklHZldub0xUSVhrbmEzbllGeUJ5M0x4dk9SMkwzM0UxKzZTNjdi?=
 =?utf-8?B?SHlHRFUySG1aMi9PZUJLK0lrdGlMc2NCRC8rV0pDSURhTDJVK3lUVEkvMDE5?=
 =?utf-8?B?QndmTGd6VXpuRWRSc041WHNhYS91RUJkTkc0cXFHNUlJeHkrYzIxcEdBOUtw?=
 =?utf-8?B?WHJ0UGhIVHVqcHh4djJRODNRQmJWVzV0ZWhIaHlMbUIzUlJKeTB0SkcvZ0ZJ?=
 =?utf-8?B?SW9WLzBVVVFvNVZPN1J1ci93aUsyYjlRQ1JUZjh6b1JwaGcrUTc2Q1dPRE9v?=
 =?utf-8?B?RUdHWnc2emk2SjBzYjEzdWRBVlc3UFBvNll5L0tLQXdxNzVzeVoycDhPcWhz?=
 =?utf-8?B?bTRtSUJWQnNHOGpGWFJCREJuTTZUU09xL25mYk5PWEZidE1rQ3lVbEU4UTlv?=
 =?utf-8?B?MXFvekJFMzdGbGxjQ04wdzFvd3hMY2pTVXVGOHgrMHZQUmpubmR3WUU5Yk01?=
 =?utf-8?B?Ykt0UmV1Rk0wV2hiMGNjZUlqUXNsMmErbmZLNHJaSmJMY0dPZmRLVFN1TVlD?=
 =?utf-8?B?b2o5MjBYOFVUNmF2cXZkbWtQWGpCSTAzOW5uOVhHWjNVUUNCbVA0SEgzZ1M1?=
 =?utf-8?B?SG1RRDBYT29FTFROdWZIRU8wcnBwUitGc0g1K1lrZW85STZsOFNmdEpEUEov?=
 =?utf-8?B?Zm9CZlc2Uks2L0xVZGQ1MjZIU3NHbHdjaGUzUlJkMk9hbXY2Z1RSeXdLTzZN?=
 =?utf-8?B?bzlmbC9tTDQ2RE0yRkcxTHYxL1dCRkRhQjVVNjQrOHYzRy9HWWRMZWFERk0x?=
 =?utf-8?B?ZjlvTi9OYzFkQjR3QjE0Vzk3blp2SUxqVEVra1ZXNXRKVjBUMkNsa21uU1ZP?=
 =?utf-8?B?eXVIRngwNkttbk9iZDI5Lzl5N0lOcUZoUVpzcTRHVGFiYWZMbUh1V2s1T0R5?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tNM6JG5iZYIUWBq73At8Gn7OBz7qg1imVDi2UiM6ylUrUaBp0zeaq+T2w0fEy5Ste22TXzogCL8jazg3jo9wE1wI3BdwwwkoJ650sheJsj1HFOFqqTvm3zZNyAzAJgtlVE/mD9TaCtYnNRA3a5rAa7V437WjxCORcBH/tFV/7rVxcJad3XahScQya6Xl4MHe0SChhd0c4AZKZsgCNiYWPaBC8hV6r+3vGF4ImzCsmDw+gzsTDCLSLtVxbUM7/HADZM3fbQQ8qmzN57f4as2N89KAKrIu2ZCU0tTzF+uW3Onc/Y8Dm8wrLiGRKYqvE7dHCmcrslZvL2u5hg6Poh21jmpVkk5xVondgRnWG2oosODAQS8UgoCdXJWTeyxaF9ZFrySAbz4Eo6+xBTZw8K19235kYpRQJ2l9CyM6oj/K6MdAkIlDcBtsyW0Vv9ngbI5nUecfbWd7KGle7r7QZ/u5Qo6pjh8frx0+1/PPF+w3yBEZE1MWsdVHwV+jcSrgWi6GS+sOlJDwJjslcsbOdTO9Fj5Jl1r36Imx4X5h083SwdKGahNW/m2iPt9TeW4LDvtvR0YLwX1fAVUYIsHxi23U1fwj8zizmeXsek66CZ+z7eCjZeF5VITPf2+1tXcidYIOa/YpNhsK1rrwpY7zDp/dudJeMzUk2M2bg469A1aQnrdQslYVO5h+jU1//eizbF3QlaGaIJdWFRfHxQ87gTyOrEQg6A66LJKUorXYk9DrwtocECVCoiVZhg/jhabmRJMpTSylYwmRNMlaDyS//hwV8tvML21+P+ssgfnZBfx0+PMQNMmHIOeNGupzChS/2rvH/B0YLD+rficoAoB3aWmtKxaLjo+wiz9nYb+4mDycFs0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8d710e-6f46-4c3e-8c82-08dba89bd500
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 14:25:45.2586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znfDKs7oQqPDf2PUTGsUQtoqSpGl3vakHI+SMFdIbuhtGVHbxgRvhaHm1xE5WHu/RCxmYdh+lApbD4yNxZ04d+gA7ztcHFZtqSMuJRaPVqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6641

On 29/08/2023 3:10 pm, Jan Beulich wrote:
> On 29.08.2023 15:43, Andrew Cooper wrote:
>> Broken out of the subsequent patch for clarity.
>>
>> Add stub x86_adj_dr{6,7}_rsvd() functions which will be extended in the
>> following patch to fix bugs, and adjust debugreg.h to compile with a more
>> minimal set of includes.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> preferably with (nit) ...
>
>> --- a/xen/arch/x86/include/asm/debugreg.h
>> +++ b/xen/arch/x86/include/asm/debugreg.h
>> @@ -77,7 +77,18 @@
>>      asm volatile ( "mov %%db" #reg ",%0" : "=r" (__val) );  \
>>      __val;                                                  \
>>  })
>> +
>> +struct vcpu;
>>  long set_debugreg(struct vcpu *, unsigned int reg, unsigned long value);
>>  void activate_debugregs(const struct vcpu *);
>>  
>> +struct cpu_policy;
>> +
>> +/*
>> + * Architecturally dr6/7 are full GPR-width, but only the bottom 32 bits may
>> + * legally be non-zero.  We avoid avoid storing the upper bits when possible.
> ... one "avoid" dropped here.

Oops.  Will fix.

Thanks.

~Andrew

