Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9906D02F3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516614.801015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqKB-0004wq-IK; Thu, 30 Mar 2023 11:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516614.801015; Thu, 30 Mar 2023 11:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqKB-0004u2-Fe; Thu, 30 Mar 2023 11:20:11 +0000
Received: by outflank-mailman (input) for mailman id 516614;
 Thu, 30 Mar 2023 11:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phqKA-0004tv-5v
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:20:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d157f40e-ceec-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 13:20:07 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 07:20:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6792.namprd03.prod.outlook.com (2603:10b6:303:164::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 11:19:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 11:19:55 +0000
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
X-Inumbo-ID: d157f40e-ceec-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680175207;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kC93KfM3IacAnsQFtjdIh2gvuT5/bcKCEZ38Xgq4uFg=;
  b=I9qi3HeuHQJNtNjZ2WnhXypJTLAn2dmwzk+KwYUJTnAnBaWe7qEnOaxI
   YtjzQa8E4PTrl3VpLa7+1FBL73dCr1iRyaOP1Oci5g65G9+iHjhg1X2MP
   w/EGLuSK6naPGwihrfbD0mhmUtmAJxsu6anCGsei/1M0TSA4c5/aAxnHx
   I=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 103579191
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:epFhs6KOy80udt/MFE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENShjRVy
 TYeXm3SaPuDZDbzftt2a4XnoU4DsZKEn4JjTgJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QdmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5qClpE5
 fYIGApKSTuHg7y165XrUdlF05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHugBd1DTezhnhJsqEOey2VODgFPbGqYgMW4mBW0S/hBJ
 kNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4P5YnlqYRq1BbXFI89Qeiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:ZzJnM6DGURHl3BrlHemb55DYdb4zR+YMi2TDpHoBMyC9E/bo7v
 xG+c5w6faaskd0ZJhNo6HiBEDiewK7yXcW2/h3AV7KZmCP0wuVxelZjLcKqAeQfhEWg9Qtrp
 uIHZIOauEYzmIXsS852mSF+hobr+VviJrY/ds2Bk0CcT1X
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103579191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+y+oHCJxnzP6VyWkUjSQ1NdZ+1cnSJEqJAzO1UT8VXExyDrpOvvflmpqu0ewjayY57NiCLXDEPWZar3o/eFhEdDTYVQfE12BktXuTbLafge6RU8qjJZMvYNbbPyCCEekSVSkpkC3Si3dvh+nL6Yo7v1BwAJEz45DYEzlpm07Nb87IONNHCOgm6BO3AevE8WdmExuP8dq7uZwmIUW38FHwBIcZeDWpMYhIBRF/CqkgHjbd/ZZwDyvmsVynbjJAV+iZcJlfNLuLNBK/yxBrRV1LDS5aPs706LJFcUxwvnHoOdMi/Qyd4eoQJDvQSHEejktu8z7BwdKP1PevmrPZN7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm5t9wd6Q4AXf+Rr1d85/7NCmxjC6c/bdnbGO4RKlMA=;
 b=Tqkw8OExOV7O4F8kTav+NCzterd84lgaJCBuA+Wz5TEdk81kSRS+qugu6Bo6TKZewZZBsbH0FQRADX9ebwAwFxkltyT3mCyW5Xro6HlEMRuXGwQN8Y+2Kz3c9GDaUcaZMjbCdktVHgProwy0puEJqYSzZ8KHJ23Gm/TrFdZCyqg9kZnWrkab/izgejxmzdy/NQb3GvTdgUhN13tYVRGLk9UZB2LI1+Fa1BlYYYLMOMEHKB2REQKA24vPgcwpuh7HzuBnYpMWxThUR7E/03hQ9JTLAA/7lotdF6u4KJUdMpWK0k//SE3z9AUGZyYH3mExSc9R+jKf4F7KLXOskkAjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm5t9wd6Q4AXf+Rr1d85/7NCmxjC6c/bdnbGO4RKlMA=;
 b=oGJX2zHS9budCqxy/eo/uGi6nq8eUUcUEELSBD8cC1BRm+tLWi5sPprlCN+a0lEoCywb0dgx8+az5nXZTHGH2DMmw8JAyEej4t5Fu4Dwj5bUQeNM7FVFI8Dy3NGCF4ctHYZ5mX73+LliRgONcAn6Vq2YSAStYDYNcdc8Uzifqaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d85a5602-9e97-d7d2-5214-0b019b8a707b@citrix.com>
Date: Thu, 30 Mar 2023 12:19:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/9] x86: Merge the system {cpuid,msr} policy objects
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-6-andrew.cooper3@citrix.com>
 <4051f9f4-2306-204a-1ea7-5cadb6eaa175@suse.com>
In-Reply-To: <4051f9f4-2306-204a-1ea7-5cadb6eaa175@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO3PR03MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 01547176-708b-4713-da65-08db3110b030
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XAsVRdXTtxIO+eqVWM8nNFJdaqNCUvCLkbcJ3SsjTD8iSwRKtH1ZnmxzOa6Fdgs3onXyAI3Nh1MpXQinhQSRXKIjeJ7Arok1V6UUBUQdl0vzQdHAFrT92cXnCOJr5d5ZX+402sX0KOVtaSU+OWuGH6VB6ORGFWDL6o5jE2Jra/zoYvIR+j3kmmc0hzna5ImCKSkyH7gc3ZtMizJsIRh02m/4WfIdeld2cjNsxy1S/OLJplar9k1d9qZUxo8tlIQx+nzOLqWsm8qmwDqiau9+tZpcsopEzpb6HaNtt6bhZsGmzna1vzahWGcpERacgWCWBpFGDtQQWdeXzT2KqX0Qw+XEHms3Cpp/wxcPGX/LDHwmdbpW3uqBsX0u8oHLuDmYBGkjwGtwHUmEYra9cJ9s2bqRvzXd0WZoymhWXs81rZfrpjfRLycGmc0a3tw1sM0K/DlWNKepnFdts3Qk+g3Lh77/dORGJf2QZTL3vJl+c1V27QFsuiAveXgoWFHh6lOjBFvqrl6WuWSCspwe4gIfhdmg+11Ao/5sEvOORF5skaEf7fU1T+fe1QpWtzgl/5aW9pParjbkcqPhHY/HmvQvNxJgRfxaXB5EozkmHGzu5RVJ0v3xR0Vav4vUFPX3K99j1Qu3pPHa31I2et0YMdS7eA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(186003)(478600001)(86362001)(316002)(2616005)(54906003)(2906002)(31696002)(26005)(5660300002)(53546011)(6506007)(6512007)(8936002)(8676002)(83380400001)(6666004)(41300700001)(38100700002)(31686004)(82960400001)(66476007)(66946007)(66556008)(36756003)(6486002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXJtT0JsWTAwN29KNFNmajI0RUZYcDhacm85ckVBaVFpeDJEZi9pSzMyRjk1?=
 =?utf-8?B?M0ZrVWM0aXMvczlPZFNtWllFbThlKy9KdU01S1l5U2Exemg0d2JCS3c1WEUy?=
 =?utf-8?B?NjRSYTlyTytVNlMxR2R6TWJtdUM2eTM4TURTUG1sN0F5MFptTXZxRmhYcjJF?=
 =?utf-8?B?L2NBYmVhTm95Q3BhOGhjRzFYL21OYWpRN3RZVFJYN3pRYXVKYkR3Y3ZuY1ND?=
 =?utf-8?B?ZjVnL0lQbVh6VndSc1lQbThrQVQ4VXpselJxMVZyOVk2MWRQQW1HYmpoNkRn?=
 =?utf-8?B?dXpRdXhiU0UzWDBKL3Y3Ui9SSGc0YllsNk5UaEpJOUFCbDFtNnNjSWhDd0hj?=
 =?utf-8?B?UU1wVnhtY3kyTzMzWmk3UTQxaFZ0emhhS3NUTHBpUUhvR2hmZFZWK0xSMTdT?=
 =?utf-8?B?Wks2aWRTYXV6QzRPZmVwWk5YSktEV3pkSDlPS3NJcG42eFRCWEhFNzNjQXB6?=
 =?utf-8?B?N0lFcjZhZ0xXcGpCdlltYnZEZ1VnanZQUFVqTFpIZFUxTVZKOWNjWjBSN0tQ?=
 =?utf-8?B?VUlqaHloNGdsaFdPdUFXY0libkZVZkhpRkNPL0V2VTJ6cEZ4dGY1bk42YnB3?=
 =?utf-8?B?cmpYVDFPTnY5ZFUxWldaWFN4dmVJTDdWaGJ4QkJGamxZRTJoRERWK0JWcDdN?=
 =?utf-8?B?VXd5WFJNL1Q1QXlRREhVRWp5YUEzc21CajlIOFZ2YWNHaW1VMnNENDdLdHk2?=
 =?utf-8?B?Y0J4WHhsenpYcE9mZHlINC9aWVluaTdBcEVjRUZkN3pLQXhJOEZ2TGo5b3E4?=
 =?utf-8?B?RnQ1dFZYRUkyRG5EUE01YW1mcjZmOE12L2wxSTVTTjBtejUvSmpHSFgzY3A4?=
 =?utf-8?B?enVsUGE1ekRTRERzSEJyYU00WVRtZXJlWllSSzBWUXZCQzM2Rm43ZEN4Mzg3?=
 =?utf-8?B?dUIyUEdhQnhHQjJ1N1haNzdzcHRXblZRcWp4Sk5CcFFPMWdmMUlQRjdvRk56?=
 =?utf-8?B?ZDViUDNLUkc0bWJEVU1idlN3c3BBRWRRakFnLzBFWmlmOWJBM0E0RzhuczI1?=
 =?utf-8?B?cmVSM083QUNVQXVpak4xSW1MVHJ3RmNMaHVCWFhraUYzZEt6VkNhRmtUL1Bl?=
 =?utf-8?B?c21DNmpsMG5PVVlGSi9EM01DMXA1bllZdXJtWlM1U1VwMEVWNFV3ME05UzBa?=
 =?utf-8?B?K3ZhSkdxLzNxWnJlaS9BNWJ2RmUvNVBCOVBFMTBIaG5mTjlJdkpvOGxqa3Z3?=
 =?utf-8?B?SXBVUVEvV0xkV0QreDJqbjlhTHNSamVMbFg1T0p6REhYdEpNUmNTODhzbkpZ?=
 =?utf-8?B?UXUvR2JnMWNIc3k2c1VRdmZGOXY3M29VRGRZdVA2Mkl0M0tWMWpRWVVyTFh1?=
 =?utf-8?B?d0U0WGIzaDhoT2lWSlZoRm4vRndCTDJwS3NlK0t1cUFtNkRvL1NHaGduMHUr?=
 =?utf-8?B?cTM3VGRwOFlVenpKTi9tRTRPNFJmVDg0dndNcHI3NzNvZDBCNlhHQ2oySTMx?=
 =?utf-8?B?UE9GN0ZXL1dFYzRJRWZTWnJkaHFUWVQ4blh0K0JRd1hXK1BLL1NxR0pNWWNt?=
 =?utf-8?B?MEl2T255OXJkYXR5anhtelM0UkJHekVmNFQxL3htSGYxRTI4d3RVMzQ1T0E0?=
 =?utf-8?B?MEVZMzJBdDF2dWtLbFlMNFlNZXJsU2MzMHdCcU9pZVVBVnBRQzNkcXhjS1FB?=
 =?utf-8?B?cXBsSWZLOHA0RWFlK2MyNE1qcDV2UGZGMThPSjdZenMyakEwbi9TM25vRHZP?=
 =?utf-8?B?cFluemZIelRpdmZvV0xQK3oyam1IdUd1bXptNXMvTVUzOEN4TGE5dG5sUXFm?=
 =?utf-8?B?REw4ZUJWVTZpeVJjaVE4ZFJjL0RkRW1lNkljdlJKNkcwSUlyb29XYjVRK2k3?=
 =?utf-8?B?OTJYa0ZmTGhxZlFMODIxN2tmY24xQnFtQVRyc1ZEYjFqNUJNdXlSQXJvdHRP?=
 =?utf-8?B?TlppOC84aVVYcW1VVkxFOC9yaGpjSzR0bUFyYS9ic2V3SFN6aVhFcGppWjRt?=
 =?utf-8?B?dGVtajVVcFdBRXZvb2NPZTBoZzdnZktSSkgxOVZ0eW9UZGx5eVRlNFM0MGp0?=
 =?utf-8?B?VlNHSmk4WElSOWZXcFp5M29HL29iRWdUSFB6K2FaRVNjYWlBVmFFbnV4MkZm?=
 =?utf-8?B?UWFBK3FxTlJ5cHlYeDVhM09EWXp2OGo3Zm9wcXBTZzQ5dWJnalZ0bmkwcEVp?=
 =?utf-8?B?eXZtWUszWWRvWDA2Ry9aV3E5QnZ4NU1vMGlvbFc0ekU0R3VVeUhqZkpheUE3?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PsnmSFWx0hRe/nhUuJsVXbWEx5CZgrSrSXW5XdWphe6RuVKhENvRBZaP8ScJyN4U+GjAsxcodnkRb379kgI2/De0EWqPgsw9XPjRizixTwTM3GO2aNDDNqHvrDUSQdAB4bCDXnG7Q5Y8appkA8mhD17hizbqQQmbpRjZPLGwIdhEHMxtIRfBobiGEaOx9NMq1qZUEewXTZHw4HqgRkSezk/bbErHqeW361xKCAHAvAnV6MI7QcOrS7+Tfbtcbdy8jZa7+vLfK7A41FfDT658pajl2ZrB3hzleu9Aa3+LdMx4ZEDjCf8CM6GHh5n5AnZk/ShF6TvXlQqM3W/8hCIIGqTE62HyATzL8JDb/GwjICKn9hw06NRhGTHImZYpqUNh0siReVxdindVdIeVr6Yk6VqYvMoXu84LfruFWNtHkM1NZrdLQW4YYdARI+3oO35kI5/z+fPalLzRHrKH4WZ4DfPhlQlaHIudRCBl2bdDgqh/hLExCWh7Aah6hdR0Vk1nxuUeW7iphoFv+pxGd9zEY6JvXmTdOpvPSLKsPzHLldWtUg2JmU2gEFeN52xIapWTBifEjDaQof98zHimhgceYqR8DyyOJvVwrAJusAImFICbULN1C1Fj6uBrtk6d9e8KVFqgJ44g7XknJci9adxWJFKJH/R9/5jOyuB6OEo7OZ7c8N+AazVOzbjeqef+zy4Q6CTXAOXrjuDnhsJkC/nyJzAlBs7txoGA3vH8vDQRiazJOIM/hBwhERpXGWZNGUAxjlUzSC01m6mX7eSwUj0vFHsxN/EZNnkkE9EEEdGFIfRk2haVkDMUXQW65iEkFnX5jMTt8Pa2JLqLmfTEcG5oAg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01547176-708b-4713-da65-08db3110b030
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:19:55.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6bevNdh5UCvFsHnuVYYw1hj2cNLe8EsZy/b2WelwSY7KPscc/3nGgmaiykEiFoMPxGkhYeRo8UmBMcHjpobOpsxfTJkqFw1sEkYx3WHYTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6792

On 30/03/2023 10:40 am, Jan Beulich wrote:
> On 29.03.2023 22:51, Andrew Cooper wrote:
>> Right now, they're the same underlying type, containing disjoint information.
>>
>> Introduce a new cpu-policy.{h,c} to be the new location for all policy
>> handling logic.  Place the combined objects in __ro_after_init, which has
>> appeared since the original logic was written.
>>
>> As we're trying to phase out the use of struct old_cpu_policy entirely, rework
>> update_domain_cpu_policy() to not pointer-chase through system_policies[].
>>
>> This in turn allows system_policies[] in sysctl.c to become static and reduced
>> in scope to XEN_SYSCTL_get_cpu_policy.
>>
>> No practical change, but we do half the amount of compile time space required
>> for the system policies, which saves 6x almost-2k at the moment.
> But what you save here is only what was introduced earlier in the series,
> if I'm not mistaken (just like the "containing disjoint" further up)?

Hmm yeah - I should reword to make it clearer that this is returning to
how it was before the series.

> Also do you mean "halve" in place of "half"?

Yes.

>
>> @@ -391,7 +360,19 @@ long arch_do_sysctl(
>>  
>>      case XEN_SYSCTL_get_cpu_policy:
>>      {
>> -        const struct old_cpu_policy *policy;
>> +        static const struct cpu_policy *system_policies[6] = {
> Another const wanted here after *?

Will do.

~Andrew

