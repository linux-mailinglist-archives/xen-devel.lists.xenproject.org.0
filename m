Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756906F04CF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 13:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526954.819029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1przaK-0002V9-BG; Thu, 27 Apr 2023 11:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526954.819029; Thu, 27 Apr 2023 11:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1przaK-0002TP-6i; Thu, 27 Apr 2023 11:14:48 +0000
Received: by outflank-mailman (input) for mailman id 526954;
 Thu, 27 Apr 2023 11:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1przaI-0002TJ-Cu
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 11:14:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5d76ed1-e4ec-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 13:14:44 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 07:14:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7166.namprd03.prod.outlook.com (2603:10b6:a03:4f8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Thu, 27 Apr
 2023 11:14:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 11:14:31 +0000
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
X-Inumbo-ID: b5d76ed1-e4ec-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682594084;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wyY/1gXo6wIULriHmmDkpKht/oEPM2Yn3JhjFMcZzSg=;
  b=ASUFOcmHIXP5M8PU9RQpgDOqJgQkfoBQU8enss7dTYQKnehJY/adugjs
   yXaqdlXhAkVqlUU2TUcW1uvAP/KjXaBAqHbr/hffBXsaGoL4csajDFqRb
   HD8H7Xie4LDhEOrNAuqQWZkGmoTrhj0votD2gp/LUhCqBBzVO3n04CEh0
   c=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 105827684
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ojwpkq8Bf/rcoOpKQSS8DrUDQX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mcdDTqBO6mKNjfxftF0bYq0oUsOvZ/Rz942SlA/rXw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOaoU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl+9
 t5EAywUUSmnoLqq272qWOdl3eQKeZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpPROfnqK426LGV7nALMBg5exj4m8eSt1PgV9FVL
 24O1iV7+MDe82TuFLERRSaQqXqJvBcaV8BXVfMz7AWAyK386AKeG2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXAGTT8JS00C+daLiIM8lBXUVf54DbW4yNbyHFnNL
 yuiqSE/g/AWkpQN3qDipVTf2Wv0/97OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRe3BCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:j/AJrKOet01afcBcTtCjsMiBIKoaSvp037BL7S1MoHluGaalfq
 +V7ZcmPGDP+VQssR0b9+xoW5PtfZq/z/5ICOAqVN+ftWLd11dAQrsC0WLq+UyEJxHD
X-Talos-CUID: =?us-ascii?q?9a23=3Agct2mms9lD1SduuC1xH4dCLC6IsVcV+B52vJHHa?=
 =?us-ascii?q?cLj51U7KEW1GZo4NNxp8=3D?=
X-Talos-MUID: 9a23:uZBfMwXgIluautHq/CP0vDRNGoQr2ZqFNV1TnZYMv+ueGSMlbg==
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="105827684"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+/auSI0ESX4LY7afQeG2xiH+7XxbVvN/YAYGD13JyNTpeWmXEpHYUxhld6/5ubsru7Ach3lF2JCZbr+OwuYFiUeYaKKKBgWUnF5YXatAtqeOg6L8u5I2kC0ZKjYr30LX/8j0iSCrEFlQgW4sNKUXzH+aBYwRQCwZQT4EmKwGuV7FwLXCB0O8BhBEKYBJL5Lhkj3ufmpl4A5mxeCHGOI+ox5M15ErvrbTX8/j7+o3XHO9OCek19cPzTxmXgojMvLe3dkKKcUk/GCgjoWmxFty437QKnXpIHsqRFn2imTFtVDO2LFgvJgPH1wIbzGInDI5w9rvh3xNfmtxvDHsZflhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du775kTpuiYYRdC1MCLtJ7Y1tKccXrPTqxmMH3KH9CI=;
 b=WRY5rJxaUeUxtxbB++p9obR5MN9u1jZgXBITCI3931YpAEQXPVJ9MpMqXLAcfBjwnPdIwI8SjQOzu13zV22qcGuZg7hmg7H+wa3NyWMKQIiB46v2LA81lKmxRIq9V6JdmmDgOr2gZSl++1zJg3LlrN0aQ6hdN+DA8M/2aQLGnxSd0TMrfSo2DGPvfZgKiP5Dqn7nsSJJ0uQP4uKRGm4Q9mkZgXeQXDC5qpsgLdFDGrfOMb9LwmKouZod5+xXVLPtFcLxJoc0DJ74c8zx8vVokA7W7gbnypUKU3ynkNzSrzd10/DJzM/ufhDOFLJtN4qE4IPTDnNedjYMcx9QC2a0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Du775kTpuiYYRdC1MCLtJ7Y1tKccXrPTqxmMH3KH9CI=;
 b=Vl292L7AdZ/2RAY+x3pU044rcDrXd09zZ6paI+0jPldtP/JdQPM5T60k4IVUZgrX7Ussx1QeU/cBiT/dSJPd91dYmVQPWbSULaT//KN+Tr3sklKSclEhfPkPwsZLA2mDMQnlLAiv9Y8qJgUhjFxwNXandm6xkFrKeGiMLDW7Qpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2bf43f9c-6f24-9997-b676-4a21e1f04e56@citrix.com>
Date: Thu, 27 Apr 2023 12:14:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/7] tools: Modify single-domid callers of
 xc_domain_getinfolist
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-6-alejandro.vallejo@cloud.com>
In-Reply-To: <20230426145932.3340-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0353.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 153acacd-8470-4300-af60-08db4710928e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2emDi5uiSXJza9oqPHXFpq7ZWXeIywQziRW2poI8hAWTgardd0w/lxZasdmrt6hk7R1rQV5Jvja8HLrWEIym2Xp200e9yPSwogwsdiDTIVdDNRl3DeEM6xP0N2G/ZeMVQ3w0YjUrcFgED8p7VvhJV2SHGK4FP5DpcHascFCRY0AtgUHeurDzApeDHpcoZsdlI6hR9mg/Glri6ue7jPrkT269fR9KTpsNoSlEak8Xr/kFQ6+1i8OeYpBnE64h+4eggPDvYqD58Zn23eO/SG/s1sUZucdS21Bdsk8FK9sFF6WI5KNN0W+Xc+mW7D+1o7cMqEbzhlMCcDSbmB1uDyNJhc09QvgFqlnji42a9YNs2l3XxFwF5OVbRYueXHq8sGjTwLFlKDGuXYBXkjKldKQIWtBXJmZQ7mFxVx1yl+g2ZnIlWNEWx83AMWWgFLTwYi8E1WeTe9phlDlUxLPczLek8ALhpM8il0PdVi3l/LmbYK5jEv1tV+pN7Bd6seJjH1iltoZZlOMf3CZM0fy9Bw/3Gazh6a9D6yBYrMvhEypvDkcmViIAW0SnpssDsmptULOz8p/otEOZoUdSqok1fT3rnWa4TAOXimKiOc3c6tiT8GPrrb3ZpEA9kziTkNZRdbXHcRmqDr7U+JbZCVFGoz6a0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(31686004)(6506007)(186003)(26005)(6512007)(316002)(53546011)(8936002)(86362001)(5660300002)(31696002)(66476007)(66946007)(66556008)(41300700001)(110136005)(83380400001)(2616005)(478600001)(8676002)(36756003)(82960400001)(6486002)(4326008)(2906002)(54906003)(6666004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1R0Z2tMYUZGclliTkMrUmE2MmQzMUFRcTVySTZIRU9FakVKL1RHUUtEWStu?=
 =?utf-8?B?RGdtMEhudmpnakx3aUlKajFqekhsbUxOMU11S1pOMVVmUyt4aU9GU05lUHNl?=
 =?utf-8?B?L2l4WTROeUpFSU1RNjcxbnhqM2ZXdDVsS0pacU9uTXlwNmxUL2gwQ2pNckda?=
 =?utf-8?B?amJtVzA3eGQ5RVRnSXlQWjJGY3Yrd3RkQWJka3ZrSGV1R0VPRXMzMnRRV2Nr?=
 =?utf-8?B?eWZ1b0M1ZG10bE5ETUhDWEFSdVMvZVJWUUl2M3g4MXdTdHp0cVRHQXYrSWtp?=
 =?utf-8?B?T1R2VFJwb05Mc05IVHptZTNtUUxYUU5IZnNxZjRwUFc4UDB6ektydDJiMTdu?=
 =?utf-8?B?Y1RhU1JFUytVd2tZWnBldjVQdzJJV0VHMm5HMlNWWG9ZZ2FvK1JNQzlaUDVr?=
 =?utf-8?B?NXBLcEo1REM4VDNJa01MUzU0YWNVSmxwMFVmQ0FyWDZYc1dYMWlzZ245dFBN?=
 =?utf-8?B?YWRON0dtMDlydTVsdWNXSVRaRnFCOCtpaUkzRHJpeVBXNWc2NmR5SjFEK2Fr?=
 =?utf-8?B?d0RSdEhaaXNCd0lzNFhIU3Y0Zk9ubSsrQUpBZGh0eW5nY2xpN3lDUmtCTEF4?=
 =?utf-8?B?bk10MnliMnhibjJBQzBwUmViQjYrVXRnYkdUYlEyWHI4R0pLTm4wNzJIcjlL?=
 =?utf-8?B?MVM0WWQ0M2hkYmRYOEpXMmtzMUl3WGxId2h5QXhwSzBNdFhySzJxL2VTaHdY?=
 =?utf-8?B?OStmYjdjb3U5YldOdXVoajBCVVJIQnBLdlMyamtEOXlVZFlldUFSQkwzWEwx?=
 =?utf-8?B?VVRNclY1TlJLNlpHUDVuVXJieGlMQmF3SGM0ZCtQdHZrVWl3eU45d2tOTmxV?=
 =?utf-8?B?ZG5MR0FjdEtyTTNvanh0elhmZHlCVzd0dlhPc2ZlQU9JTzJtMzhPb2dISTVa?=
 =?utf-8?B?TWxvakVmME9tanQ4SFFIbkNraE9jb2tTb2c2eEdMRjhRaVdoNFJhdDRSSSsr?=
 =?utf-8?B?dW9DWEFjbm11VkM4UEd0cC9RR2pYUm51ck1IZWVVNjdtRHN3UzY0UFlRUUlz?=
 =?utf-8?B?N25kSjdWQldnczl0M2hPMVlpN3RkNm5OaGJNaUM2RTBFMEVRaUFPWFZ1dGhH?=
 =?utf-8?B?cjVjMzUweFIrRW16d2JnL0NpdHRVRXlHUk5hYVB5dnpNRlIvWG45M1RReUtG?=
 =?utf-8?B?ZzA4YnpPTHgrSEhqYXJXMFppV1RNTDQzMVFtMklHcUo5MGpTUUNlaGR2UDRn?=
 =?utf-8?B?bGV4SzNDMFkrbW1wZlFsZUZRSTBvK2NTcS9HcHZtbGw4dnpKMkk2aFEySmZV?=
 =?utf-8?B?ZGZYM3pKQ2xyYzN5dmNaRE8xV2FsRGluYloyNkNlYXM1VmZXeEpTOG83dE5q?=
 =?utf-8?B?N01CZ3BJU0MyeTdYYmppVVdnRkZpVnM2N00vM0dXYWVjYWJUVUtDZEVQNEUy?=
 =?utf-8?B?dHRzM0oxR0xIbGU3bnR2VUVaY0VLWCt3WTgvTkZUNUVpaW5FcEpNUEQ4N1Zm?=
 =?utf-8?B?NzB3eFpWeW9jUERaN2VkY1VDL2ltSTRONWtpVVdnV0UvSXdsM3BUWEh4WFJ5?=
 =?utf-8?B?eUdmTU1nSGgrL3ZvS3pUR1B6ODVZd2VUUENZZkZNbXRkcUNZbFM5bG9DMFJo?=
 =?utf-8?B?TmJaRTdFT0hWUzYwNXFQQzlxUE4zZUE3WUg5R3FFNEMvTkJ2Mll0Q1Bxc2ty?=
 =?utf-8?B?ZmR3QkQxOG1nRFdQdUJZM1AvNWVPZmFQbUEwckI3c0psb1gxZ0t2a2d0UUlP?=
 =?utf-8?B?Qk05VUpzcXg5VHZJZ1VzSmlrRE5yalp2dHhQbnVrZFllSThpNVB0elorckp5?=
 =?utf-8?B?aHhWa1lTQlZYZVEySVVQUnZPY3VFWWp3SjVFWmg2S3R3N1NPTTFHdEpEUGI3?=
 =?utf-8?B?dmI1MTQ2eFhxTGtnVm9JUzRCKzZMME5rdkl1eWdrQkpsbThoNlN3WGZIazdM?=
 =?utf-8?B?cXFwdWVzNkF4N1RKUlIvbm9hNVdFSGFLRUxoUnJ3WjQxdEtmclNNSWtoR1JL?=
 =?utf-8?B?aVpKQkdjK3dWWTIvYXZZUVdtcjhqUnR2eXNNL0taRzJQR3dZaFpsZng1QWdJ?=
 =?utf-8?B?RmNQdURVQTNoNHBUVUVTU1NNUGE2L1VpOE40aEcvTWt4T1VvaW9zdTVyN1Bx?=
 =?utf-8?B?WXY1Z2dWNnRCNmxXY3NsRVdWU08xQXgyY2NVMmREUG1Da3ZGVS95OXBmMHF1?=
 =?utf-8?B?K2prbEVLUGs1NUxJWUZwU1h1aUVzWTFJbFBMVm54TVRMbklLMmc0OXkybUJI?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3fKgkdxyrmpc4GBMlQLdmU8IyNswlo+y8qlXwRHsiXYdVK7hgMaDf/g7TduNpl03YghzSbmhldMaSYTF8SyrPKcFOjBCdyhEVlRN0NZmVvLmkQGQvV+b5o0qCJnDvqk2u4LDhZgYOf79GN8UrLjbIuyhy6khATyPy5zRsVqB8ZW2b05ZdybcDCw6aSfuvFkapYCgbehG8gzKISyyo/uStmW68gPZk76VFnKEaxmu6BkAtkbMKEh8dZ4bU4Awv2pTRjEQpnWY4heZJzYLXMJ88uIkIRTIROOGEuZoUYH5IWWM9c2JzQL5XREk17VT+mlPCADbB+bMom+EDoqbq9JLfrk/L3m4YCyV8a+/E+7W0/6BO2wS+b9hT4vzHUyoROi7/GdViv1HxpBpXBFzbCQJIq2PjDvkbZBNegDxnBR29pOHMgo8sHGJfexJ/FNF8mGLZ3zMT5bBJ3b7l5FfbpXrqavF1mf4NUDNfYDms8ikfoibg26f5EMhlKVF3RM+tqoH5B1qfggH4QJIGvHX/zqluOPaybpnAiKANARVq5Tfe47vNuiY2ci2umdPaWqPWw3w3jWKiHW2ON3eUdbWuZULhbWUdBsDxLxoRLnbb1F6E08ky/mqLJ0vWnQvU6Zc/GRmAl4zixVEbbglkaoNWjXPtL9/+yvEzSU5YilYixg8XpYgYFuad6+jK7RoDpnJ7qNJh0RcTAA8pUZBSdk8Q+wFIWc91X83UgwQ+PcSNXQjou3a8YY5lvh9CQ4SbnzdEkVqD5oWUwpg8+btKHrK7hM8a4v0ETrr2Su2LLAxrmqCzSynu+0vlRB6rzuFumAxyxohg0D2GPEiP4t78Ej7IClF8pMeYZZySPvKT3YRBcZabGo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153acacd-8470-4300-af60-08db4710928e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 11:14:30.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHSlnhhnhTXnEhxJ7j02/Q6V5NkK8Ve/lSZz3E3UU1TCGbC43drNbE0LKKBLAE6HBzzryQQ4iVeZQ+QEyXcx9FpxNUFsKkNpVSGwoxkB+KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7166

On 26/04/2023 3:59 pm, Alejandro Vallejo wrote:
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 25fb716084..482e04b38c 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -70,15 +70,10 @@ int libxl__domain_cpupool(libxl__gc *gc, uint32_t domid)
>      xc_domaininfo_t info;
>      int ret;
>  
> -    ret = xc_domain_getinfolist(CTX->xch, domid, 1, &info);
> -    if (ret != 1)
> +    ret = xc_domain_getinfo_single(CTX->xch, domid, &info);
> +    if (ret < 0)
>      {
> -        LOGE(ERROR, "getinfolist failed %d", ret);
> -        return ERROR_FAIL;
> -    }
> -    if (info.domain != domid)
> -    {
> -        LOGE(ERROR, "got info for dom%d, wanted dom%d\n", info.domain, domid);
> +        LOGE(ERROR, "getinfo_single failed %d", ret);

These are vaguely for human consumption.  This one wants to be

LOGED(ERROR, domid, "get dominfo failed: %d", ret);

I think.  (This code quite possibly predates LOGED() being introduced.)

> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 7f0986c185..33ac8e9ce8 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -349,16 +349,12 @@ int libxl_domain_info(libxl_ctx *ctx, libxl_dominfo *info_r,
>      int ret;
>      GC_INIT(ctx);
>  
> -    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &xcinfo);
> +    ret = xc_domain_getinfo_single(ctx->xch, domid, &xcinfo);
>      if (ret<0) {
> -        LOGED(ERROR, domid, "Getting domain info list");
> +        LOGED(ERROR, domid, "Getting domain info single");

Swapping list for single really isn't very helpful here.  "Getting
domain info" would be better than either of these, but all of these
ought to be updated to print ret, because right now I don't think
there's any qualifying information.

Interpreting -ESRCH is the important thing here, because that's the
common "your domain doesn't (/no longer) exists" case.

> diff --git a/tools/xenpaging/xenpaging.c b/tools/xenpaging/xenpaging.c
> index 6e5490315d..023f2bf295 100644
> --- a/tools/xenpaging/xenpaging.c
> +++ b/tools/xenpaging/xenpaging.c
> @@ -169,10 +169,10 @@ static int xenpaging_get_tot_pages(struct xenpaging *paging)
>      xc_domaininfo_t domain_info;
>      int rc;
>  
> -    rc = xc_domain_getinfolist(xch, paging->vm_event.domain_id, 1, &domain_info);
> -    if ( rc != 1 )
> +    rc = xc_domain_getinfo_single(xch, paging->vm_event.domain_id, &domain_info);
> +    if ( rc < 0 )
>      {
> -        PERROR("Error getting domain info");
> +        PERROR("Error getting domain info single");

These messages I'd just be tempted to leave as-are.  xenpaging hasn't
left experimental status...

~Andrew

