Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8B2780A69
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 12:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585955.917178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwzT-0003aN-1L; Fri, 18 Aug 2023 10:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585955.917178; Fri, 18 Aug 2023 10:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwzS-0003Y4-UQ; Fri, 18 Aug 2023 10:46:02 +0000
Received: by outflank-mailman (input) for mailman id 585955;
 Fri, 18 Aug 2023 10:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWwzR-0003Xy-G4
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 10:46:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69cba587-3db4-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 12:45:58 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 06:45:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5673.namprd03.prod.outlook.com (2603:10b6:806:fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 10:45:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 10:45:46 +0000
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
X-Inumbo-ID: 69cba587-3db4-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692355558;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=oKS85nw8E4VKvcD6RrKEhbuQdUZpHpx7Qgf+6tHSvag=;
  b=d+YdniJd4GjSaYJFjJYubl383PN1ZVMEALChVjHqo6JR3I1NJVHzgm+b
   /r6soMR7V9h7JD9p/KbTlWM8c1JrkHvrW120zsofQdqHmHhiO0tU04uly
   jM7CGbNfXG7a2+e1AU1qbwS7UoMqD1rdFFNptU3FJuD3SHIeV1DltpYX0
   k=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 119158525
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GzBjRa/r0ws03lYEdyBfDrUDvH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GsdXG3Qb6zea2X8ct5+Po63904G6MWEyodiG1E/+yA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmNakb5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl/p
 NICNB8mTCnTrM6/8rilZ7dMmcMKeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpgNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtDTeDoq6Q36LGV7mtMDgE4C2ORmPD6pmCxR+lTK
 Us4wQN7+MDe82TuFLERRSaQr3ODpBERHdZNFekz8CmGzq3J70CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaOiURKX5Ebi8DTCMO597+rMc4iRenczp4OKu8j9mwFTSux
 TmP9XA6n+9K1Z5N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLpeZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:7WA+HaCfBVb7e8rlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:nSo6bmybMgQGN3lserJYBgUlS+4/blL27k6ACGOxO2x3ZeO1Vli5rfY=
X-Talos-MUID: 9a23:6FzeEwTHXPJqmxTPRXTr2zd+GplQyZ2nS2wjnok9t8uDGRdZbmI=
X-IronPort-AV: E=Sophos;i="6.01,182,1684814400"; 
   d="scan'208,217";a="119158525"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co+LhM7fxfuCJyTC5PER7ewfhWcTnQlz1+zJSGJb9Ma2DEZdabtETuQ7RMJfRpkOP6nDf9Ztgu9/ZIeqBgicEZJ8Kih7wX5WmWTdxkFUpHdqc2lTpoEabXS/oQKH9x3cZwgASdeZUvq0bPmKFLajztx92tghPNdq5V5pa7P6ofLRkCvbdmpcn4piIQdWnGWlGAOIKRxZgUgA3HsCu7Nxl1RjdL69WRvDuVnICBedAcurJR3tvuvq3Z+agzx2aKCYGgUgUJs8dl4ULkzmLxPO7Fm6Ey1oacQissM6GaBWCEWR0oLN9FGfCzTmUVYF1s5VDJdC/nhN0wuBsg7igF/JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhLBaAAjDwZAkLJu7Nflpa85fLMHYvy9qv7n6RpEKX8=;
 b=LVkTK7nGf8WnUmetfoQPhNGLfgz3ShMfeWfHOWcidhqrAaqEab6SFGCgBHOTdceeu8qxn+QJ2xPbg2Q8VGxqMZfH5+4W2/O0C4kMsZ3U4Yty4s6EAgfc2dFnWb7DGLQZU/HJg+69rBpVc29NMs154cvB4OO3HSc6NpNtvKIfb9VmSSCBnpPn9sS/jQ/V1Q6Eo1Iy8h+EmLv45/nGGq0Bh7lmev8p3htWkCiBO3BQ5mVdL4xA0kSrs7+WZpi31NJ9O9vlk7VheHtuYfWSIcE058QUmXBckKqpJYCnerSQ8A9Vybi/4/wYC289oj9lpj7MVZwsZ8cEvSRBpBj25UhM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhLBaAAjDwZAkLJu7Nflpa85fLMHYvy9qv7n6RpEKX8=;
 b=si62HpnHm9yo1OBz9VW769ZWO6DzCuHKvmSODinwJ0DF/nUp3GnglU8rdUjAlo0uDtBrV5LS1ZjFM61COjHLi61vZVEQRA093odDdy638Q29TNWdzyLvAHqBypwPYVCchkkFgCbYBW3PmvwHk0OKEBqX1bKECmdin5Muc2xgSZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: multipart/alternative;
 boundary="------------1BC5mWLrzvLccBslg3dMo0mS"
Message-ID: <f820d459-395a-4170-1b3a-df069b734bfa@citrix.com>
Date: Fri, 18 Aug 2023 11:45:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] code-of-conduct.rst: Remove Ian Jackson as a team
 member
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: kelly.choi@cloud.com
References: <20230818103236.51696-1-george.dunlap@cloud.com>
 <CA+zSX=a2Z14uumar+V2VjY6nLCt41CxZ833YpfyGP3NYG5hH8A@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CA+zSX=a2Z14uumar+V2VjY6nLCt41CxZ833YpfyGP3NYG5hH8A@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0076.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 9034a9d8-67e9-4bb6-aefd-08db9fd84762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xvnaIBQcylArdzVI5xOWgDgciOKUKzKqQvYerMWgUA4XU40mhtdiemW+K5ihSL7P2z8imDkiiNZQNinYjsxcEXHcfBGI0LYyxo4Yrhh1lANCR/fSTvTjIrkmT6yqvzi4GQ0ECJNOp+tAy5PDnbZSaO2baJo1mmanyxijTSACVJUKJhDbDCeMLpjSiHrcnsHbawmC7hhtAivV/m/buntQanNhqVGdDvaXX81OARvynWESGtKzti9erlJnkIG/2lryrohQQ/ynSA0AbcsmzAeWXZxac/gESGt2yrvhQeU9Kf6bnSxShtXCU9GV5DXznsx0jVJuK/zBPeGguO7qtcRdRxlHgHHzpKLr5RO8FWgM55n+ZrRjv3ieDIzhorG7vyTbVx4jbna2ZPKZw/sVZKTHdI44+1QsM2tjKn3KFkaXUerOWiLowPsBsgrEfDTAOFDZ6bkKU0yluRY3LPs0agYJQWec0Btp47/RRI3+UDIFLZ4UDYcmlLsTWlBSu+HZ5GVMiWGmaLlx1q/SvYapsewZIkhYTfhpuWyOPNXfnlhcmfr6PL3M7fzxFlyspkphQ3wHemDw85xpuQ4xxcP+VYxK95hGNn0rtCZmYQeG7EW1GQnE117uvBD2c5zCsEQ6xJV48Yvp9KUrP+TwGhilz/nIpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(1800799009)(451199024)(186009)(6666004)(6512007)(6506007)(33964004)(53546011)(6486002)(38100700002)(31696002)(26005)(86362001)(36756003)(82960400001)(2616005)(41300700001)(2906002)(316002)(66556008)(66946007)(66476007)(5660300002)(8676002)(8936002)(4326008)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFVNaWRCMVpNWDI3eVRIbk5kTGZDRXZ4M2JtNDVLM2JSeHBieDJwNUZSTGRF?=
 =?utf-8?B?V2FPU3hLTzJVTnAwenVOdlhVNFFOTU13aHNRU3hZMG12c1FPOENqaXpRNWkr?=
 =?utf-8?B?ZUM0bGI1cXFUOUlxY3dLSWRJUERVS29Xd3YvOXRJUEhBdkZQT2xIdCtRdmNm?=
 =?utf-8?B?ZHUvSXpCMlgvRDF6ZWYxUERsWkRFV0VZZ0Q3c2Rhejg0OXFNRFhyM1hFWjkv?=
 =?utf-8?B?SSttaWw1MnZpZ3NJdzc5M2FSOXc5M0twZXpid0p6Y2tqaVE3QzJVVW5Eczg4?=
 =?utf-8?B?dWpoaFdWRk83T3QvRm1QZkNoanFTU3dmbFJ3b2JaS1ltWklxcW5taDEraUZu?=
 =?utf-8?B?c2Q5QndkMHMxYWhYNjl0bjIzRi9tSHVwTU5kdFJmeUk0Tm5uYVFXRnFXdnl5?=
 =?utf-8?B?SndkWW95dUFOdmRhNFd3NkNLYjJXTXliRlY4bmdsRVd3MnV5SGlxK09XQTA5?=
 =?utf-8?B?UU0wRkxKNHNZTTluUGgvS3liYjdRR3pqVjZnbmlObXJxZGlWaXAwVzFrOFRN?=
 =?utf-8?B?ZTNoVWg2UlpYT2wyQmpnd1VFTytWejRzSGpxVzI5N2hKaEtnc3VKd0YySG9G?=
 =?utf-8?B?VXltbmU4K1IxcHA1Z0hlbzVBZFA1bUFGWGpuRTdlcUdjbkc5c3l3T2luQytC?=
 =?utf-8?B?eTNFNGthbVN2MG4vMS9RWnlKeEhYVEdMRW5zY1JpbVFqY2tTMjcwTXVJbFhG?=
 =?utf-8?B?ZnpuSE9tNlAvaDhQOFhta2dxSjkzOG9QMHN6ZUlOWWh5c1RPTit3ZU4vcy9k?=
 =?utf-8?B?Q3JkTDdtb1ZNWk5pSmwzTTlXSUhtWnUzRzBVNys1b25FcnlnY3A5U0lZeHpR?=
 =?utf-8?B?cmRmMzJtd0NueEsrbE1WRnJCaU9IYmJ6SjA5akRLZ1dWZ0NsRmo1TGhNZENr?=
 =?utf-8?B?NmFhYTJwcUVFN2dtbllXYTQvMnp1TERwODNkSlk3aDRubUIza2RpbXVZbVVN?=
 =?utf-8?B?RTlWKzdReUp4M3hwaFBhWjA2UnBnQ1R6ZnFqNTA0S2kyVHBkZFN0VlZQdkVK?=
 =?utf-8?B?ZHFkdFc4ZlVKbnlRVE9GYlQwYnBWOHRyMXBBNHZSYzdCVWJaZi9jSFFTSDd5?=
 =?utf-8?B?M0dILzVENktjTGJwa3ZINUxGYjM2b3R4OWZYWktQYWJHYXJkcy85NG01b0la?=
 =?utf-8?B?aUtBeVh4cXJHbVJOV0VlOEhBbngvdGFaUi85eFhObjVBSVI3bFN1dUltdFVv?=
 =?utf-8?B?UFJaMkR2S2k0b25mQnRxdVJ0WmY2MmR2YzF4QTkrL2x2cTZtK1NFUmNtQW1p?=
 =?utf-8?B?c2UybEJITXhNUGtsdTBQdU5HSS8rT2w2YWNaRHhUQ3ozdlFaZzJXOXlTMTgz?=
 =?utf-8?B?d2lBOTc2MkxNYy9CM2dvMHZsZHJuUVE1S0VBZXpOV1JmTG5vVmMycGtIRzY4?=
 =?utf-8?B?WXVjcjNoK2gweGZLeGs1dk95NGFRRTUzUDZuMzRlN1JMVUhJSy9KWFE5RVRQ?=
 =?utf-8?B?cDJLUEVUZG8rMGx0bThUUE1CdnBGMFUzaXdxWjBCcE5YTFkwSlE5eDd3Q0lq?=
 =?utf-8?B?VmsvVUtmbFVtMDFHZS9kZmdzVTZTSDdQbTVMNk5selVaRjFmQjdxaUovK2Jl?=
 =?utf-8?B?MmNHczhmNW8vR2Y5WFlpWFkrcXNTM0xzcEFnN2RMTS81ZjJqemR1cHZGNFI5?=
 =?utf-8?B?YmR1V0tsWkx2alV3ZEtoNkJTWVYyMnRoT0NpMWZBRnJTS3ZZRVhuUmlsTm52?=
 =?utf-8?B?Z1Z5Ky9Wbk1mSTkyNEhHbWE1cTZnRHJnUmpIQnFQSDV1eFZ5L29NK3FkdnZ4?=
 =?utf-8?B?NloxZXU0YVVCSTRuTXRidmxLZWhRM1dXUmVhS0hJa0lpbXBCS2NpZlA5Y0xs?=
 =?utf-8?B?d0lJZU01b0ErTnN0ckYzUm1HYmtVVG5pRmdPQkhoRnNXeHFBZ2pYc0VlUVdo?=
 =?utf-8?B?d2NqRXNWLzFkOGozeTVURUpHdHZlRU5ZV1lZOWw5aUJvbmRqemtRUUx1RGw1?=
 =?utf-8?B?emZBSWRodE9XY2RFaE9wTnhXY2xTRDBPOEtiZlE5NGo4S2ViZVNHekxwVG40?=
 =?utf-8?B?MytLUWVLK0VQQWVxMUp1TXExMll6TkF1aVdHakg5UE1aWW9OQXpqMng1SlNm?=
 =?utf-8?B?TlEzL1dDaXgrM2lNMUxOZzY4NU1CVnV1ZHpHSDJiSGlxVnJXNWdCMS9OWS9u?=
 =?utf-8?B?VUE2K2lWQllaRzR6UllxdGNDRkQvTTFCM1gxb0lFYXpqalA3TmFHY1F5VmpN?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xzpp5uPuIKijN23Y5ad+JDzvt8ZbD7JwdVcZ70Nnd762j1Y8+fcKZrdtaAQCUNrZX5Oa/3S5lDM4si2cyr86P/ic81KokfD/x8K52tzmq+cqqibhn5aq5Wpx0wZ3xCT2Q40GMP1Dkd/58uSIDBBKzDKHaxKauOoygYbfKZrMwfCahvan7Cm5XPafX5dyQDoB0tcOAwrL+5ErnMI70bbaEkJkqM2lvdHiKdD1XhfaL1nyN/oO2kZ/T+sLWU03e9XMfQ5OCu4EZiLxB0RewBFx8qWZe4QvhptDxgqvrjxsEU1UrdOeY4CGSzgacoLlmuUrfo82DRnbHgol4ZHxoWIOo2QlNMGZyaKtVV6U7pJ2GBXvX+c2KoMaGOtjPJqNORwjG97tAMpoeUvLhUj6lbxB16XycjVBrvYMIeS3Vvojdvrbqxla93r2zTUwChK/f4yyDBmYhy53yKRkXEf3RSbKqPYHAlnkVqaO4ueyqlRtzsceXihjqDiMCcfdFn3B3uDoRYl2zyEm0/ufhA6MM65CZ9yU00XLCsaIfpV7Vl10mucjredxdmDTXr9bJtOyZIyY4YMQMwxfsPnagHVx8ssIGncRLo4lk47vfO7ne7Qw83uLDb+a1WUD/Io558fcp5K1i2z5XNagDXEIwOR7vXTmjZRd+p9GeMegAztBZbaAA5Bywl+9UEh0gNF/zJcVl6k8lJXCiq9oLkhjz1fivA2a+exTh632rE/L/qtYWiKUp8iOr4id/Y+dPpyyO8YtKDKlzJL+fsfUj9ceBhJM5qcecepCP67KmqVUCKqzBxrkhR+0q+Y+xY/Y3MAWdJws2IbB
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9034a9d8-67e9-4bb6-aefd-08db9fd84762
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 10:45:46.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwjjYBe7cvzn+4rV93TeyFGl2kR8vHys8AmpYMM4czPSI8kBZgRPcQIcieMv1q5yYWeZgbTxHkPX4zHLTTyy40DqAFFVrGgpkc42UdgEcC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5673

--------------1BC5mWLrzvLccBslg3dMo0mS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/08/2023 11:33 am, George Dunlap wrote:
>
> On Fri, Aug 18, 2023 at 11:32 AM George Dunlap
> <george.dunlap@cloud.com> wrote:
>
>     Ian Jackson is no longer involved with the Xen Project.
>
>     Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>
>
> NB that I don't consider these changes as needing a full vote; I'll
> check them in on Monday unless someone wants to argue otherwise.

FWIW, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I don't see any reason to delay these at all.  No amount of community
voting is going to get Ian back, or change the email address your
employer has given you...

~Andrew
--------------1BC5mWLrzvLccBslg3dMo0mS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 18/08/2023 11:33 am, George Dunlap
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+zSX=a2Z14uumar+V2VjY6nLCt41CxZ833YpfyGP3NYG5hH8A@mail.gmail.com">
      
      <div dir="ltr"><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Aug 18, 2023 at
            11:32 AM George Dunlap &lt;<a href="mailto:george.dunlap@cloud.com" moz-do-not-send="true" class="moz-txt-link-freetext">george.dunlap@cloud.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Ian Jackson is no longer
            involved with the Xen Project.<br>
            <br>
            Signed-off-by: George Dunlap &lt;<a href="mailto:george.dunlap@cloud.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">george.dunlap@cloud.com</a>&gt;<br>
          </blockquote>
          <div><br>
          </div>
          <div>NB that I don't consider these changes as needing a full
            vote; I'll check them in on Monday unless someone wants to
            argue otherwise.</div>
        </div>
      </div>
    </blockquote>
    <br>
    FWIW, Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a><br>
    <br>
    I don't see any reason to delay these at all.&nbsp; No amount of
    community voting is going to get Ian back, or change the email
    address your employer has given you...<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------1BC5mWLrzvLccBslg3dMo0mS--

