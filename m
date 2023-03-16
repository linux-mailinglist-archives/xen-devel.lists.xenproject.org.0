Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719436BCCA3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 11:22:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510478.788178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckkm-0007Co-WF; Thu, 16 Mar 2023 10:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510478.788178; Thu, 16 Mar 2023 10:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckkm-00079R-Sz; Thu, 16 Mar 2023 10:22:36 +0000
Received: by outflank-mailman (input) for mailman id 510478;
 Thu, 16 Mar 2023 10:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pckkk-00079L-QG
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 10:22:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 755163e8-c3e4-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 11:22:32 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 06:22:25 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5168.namprd03.prod.outlook.com (2603:10b6:208:1ec::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 10:22:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 10:22:23 +0000
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
X-Inumbo-ID: 755163e8-c3e4-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678962152;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DS3ZiRRlMpEAM1rDkZj4akNm4L9rz/5onK39tSahAy4=;
  b=RAsZso8EScn4kmqXZVAnAuxs5fJF5bnR0bUZ2foXRScbheLuX0fCU2VR
   3XtBohLCpkSI6TCrqHsGPGshMdGFUjEaLq5Wrvb6ct5e0nLT7LY5J4P69
   hJKgHZW3RNJqy/Id35++4Vm6Tnoeoj/l1HryWAv6k2iF7hO+xI9Z9DZvV
   E=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 100459749
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OlakEKlPQ0X9axQ+Yte2Vujo5gxHJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMCGHSOPqIMWKged9+Po6xoRlXusOBm4dqTlFkpCxjFSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QGGyRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cUBLmgkaTXevf2/nL3qe8JLooc9LvC+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOKF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKTOHlp6E20TV/wEQTEEQZTnzhrsPgqRH9dc0YN
 lEEpXEh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTSgAQAge4tilo5wpiRnPTdFLH6u8j9mzEjb1q
 w1mtwA7jrQXyMsUjaOy+Amdhyr2/sSTCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnwjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:PMhP4aMsBBcYAcBcTuyjsMiBIKoaSvp037BL7SFMoHluGfBw+P
 rAoB12726WtN9pYgBapTn/Atj7fZqsz/BICOAqVN/PYOCBghrQEGhM1/qF/9SKIU3DH4BmpM
 VdmtBFeaXN5RATt6zHCEPRKbsdKJftytHM9IOuqEuErWlRGtxd0zs=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="100459749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn2Lf4vLxColKuRcQb+G3SFLoJqCV6r0TwoeJXBk0YAYRof6EwlNSSyRNB0WWfxCYXwCqiAZdm4fnAnYYVgjcSZYPqVqjwiZVTKyCz8/kSqNbb6bAv7UvnczK57qhivfxac96xOljkGHLBFtaX0hzNF2pDx2fXubvLk381DclqczAZNFP36lpP67ADLhXTyfkDPXF9zkdMp7Wmpg35aYuNBQpgxPJzdMY6utPvEOkKuLDZQaS5p1Pyp8wPEfSdULHd6CJiX0Us77b3AeXW//ARMbpP/Y5LkEvymolXIJBucNqaGggD2ICWxBGoarl9aAzBSxBIMrS9HHxIjhFuejVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DS3ZiRRlMpEAM1rDkZj4akNm4L9rz/5onK39tSahAy4=;
 b=gqyAA4C0AXf6wBNXPJHxwvVYQxstfs5RXc440eJwQYM4cFl0fYM33FyFeK+GvZkZ2+YfcClqCFXLswV9qNAJjd56+d12yxSfSGpq1B0jKhNiDMTXGfeVKYzwhUHIfKi+ETlZOgA6cBLWtm7tNLxN8dYM6nQl2h6mdu7gCPswa4SQbjKbFVq4ycqyMSWfTX8yI91SY86s51yuM2Lgq5CrGcvMPy2HhjhyNL7ZAadH6+Vv8oRbPiyJLt9aoj+dDxmT6laQkZzZKvBbxKafLx7j8mJmx9Z3cyDeZjNeMGEL7WywRADEHj5E0FhVt2++/v9c3QmU7AWqagBses0/CV0wPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DS3ZiRRlMpEAM1rDkZj4akNm4L9rz/5onK39tSahAy4=;
 b=s6PWKiltb0bXjnM/bl3exat2VyHULukyOyX8u3gLBmFipe11rkA9AzAu7wBigHcYKKX1UF51dpp4IlIM3po8QdcxrToanfjrmVFnvOqeWmPQ85JBI7lCW076ldauRrtszVj+KLGqiq1yIsmqTfnwj0By7iUX5EU64C63XYZvFf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <973cbab0-61d9-01d0-ad7b-9aa5d98756f4@citrix.com>
Date: Thu, 16 Mar 2023 10:22:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: don't include processor.h from system.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <4f605fa5-b763-bc8b-6bb0-b70e718eb585@suse.com>
In-Reply-To: <4f605fa5-b763-bc8b-6bb0-b70e718eb585@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: 6810e43c-251c-466e-239c-08db260854c6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oMZqXYt9Uw//ZxVqEPX+UEFdYF4svJeEd4Q3aZsqLk+PnRYRNNaf5dpxNJUkG4dj/TIBvYFwQ3KH9vPvmSEUEcGpkJyXg+JtTQtbf/uLfxeKIw0My8/s3V1gtSvtIfTURJYBIwh1a39ZsLRLQW9BbMMGZp7IZyY0DvdcztQ8+N8Lw+HuPk02whdn9ed6z/f/ralyQWtfDeIr294PeqNUxk3Cph3ZcJk1F/87DbgcsTNruIrq7f5LUdqRJTiEVv2uDyhXqma1uBttNRGLT3c8bwleiB0IYd+fQCwpDUhNFqrhJLgtzvverpi+Lsym1e6FE2cHR/5inbjsbQmcPoAMOWRRCtBr8jQYVjRSfM+5Cygn29H3668E8podgPWwc7FfdeBx5AhvUB2ZVNNp+WTQWKfXo64NATqMMPIXskxQsiUCMTE9fc2s4JMCMibAsDq0ijgW32yxgMkpUxTEY90gVTPjtFJL2jJy4eckDP0FdCVOfRMfZn2AYMltZZYK+YZjxybbJyY9eRAPyGUNcYBG1pg3YLHe5xsN8b+2ozdjAih2yNh4P3pg5yuv9k7i+KYo3Spso4li2uLNGYRlZjJ4R8zDcoPj8tuOxVLPiz1vTT5eJ+FqyJr+l3XciUkR+oKg6PrKNkLQhQcCU1QLKoYVZDeFJ7GqJw2AAxo3g0A7/AJqB2+itjH41RoAGEBD+34YbirM2EZBV5Y3pUCUAq6dx7G/L7vH0z0t6hzRf8tiBv0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199018)(31686004)(5660300002)(41300700001)(4744005)(8936002)(2906002)(36756003)(38100700002)(86362001)(31696002)(82960400001)(478600001)(66476007)(66556008)(66946007)(6486002)(6666004)(8676002)(2616005)(4326008)(83380400001)(54906003)(110136005)(316002)(6512007)(6506007)(186003)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE05SjQzZmN1Rld1VXZNTFFlUm1YNGorTTdXZXVSd2dtZHNIZ3c1OWtsd3Bm?=
 =?utf-8?B?MlpiVFNvRjlmN3Z5MkRNYXpXaStFbEVtNC9JOW4raTZPYVNEbzdZL3hQZTVp?=
 =?utf-8?B?ZFl3Ry8xLzNkN0lvK08vWWRnYTFyanF6eGdkT25DU0xCL1c3Y1dFSTVMcUls?=
 =?utf-8?B?dmg5VU0rYkJiZnNuU2EvZEMwV2hPOHliaDMzUlJYL0sxNWNUU05xN0J4MjFH?=
 =?utf-8?B?RG1ZSHowblZUTEdvM1ZFbWU3Z29hYmVnVTZYZjVkMUNtd1FGUFQvQU15WHdq?=
 =?utf-8?B?bXV0T3dzVDMyWXd6NlN6YStyRHpEeTR5ZnIzUXo1U3lDaTZud3daZnR1ZVly?=
 =?utf-8?B?SkRhbGllb2tJNnE3NTFNQ24yVWhkV0dkbXltaVU0UlliMWcxeDQ1dEs1WWhv?=
 =?utf-8?B?QjMzQ3daTEhDL2k2VDF1ZndTalBlb0pabFRCSk1ycTU4VlpzcVErRkNSdkJa?=
 =?utf-8?B?OXVwMGxmcUdlaW1xN0tyU01hRUFiSlI2d0lGUFMxOWhybm5vR21HRnpFdFZK?=
 =?utf-8?B?RzBBaWdzVkVMV2RiUUEyampPOSs4ZkxVbkRDNHJId2VHZS9kcWJ5N0laRFhE?=
 =?utf-8?B?N1V3M2t4enlVMGQvS1h4S0JoMTBsUkJoaktXRFFpTzJVU2lUSDJRSGtBNE1R?=
 =?utf-8?B?U25SVWp6dG5UL25QalZLRXpuc3N6b1hsMnd5Vi94L1M0L0dyTUVwdXY0RWlR?=
 =?utf-8?B?UG5ZdWJITmxydXk0NW1YWkdXSll6aUVXV0RVS05NcTJFb2lNNGl1dEtNZVBC?=
 =?utf-8?B?dmNPZkt4S294OUFUV0Mxd2twMTV1RG50SFYwclgyMDN6WDZGSG5hbEJOaDBX?=
 =?utf-8?B?VTFjb0Z1bW1US1RBbTl5dnJHaEtuY1dkalkyNGk4Ym01UXlRWFplVGNRMlh5?=
 =?utf-8?B?M1NHa2lPSzRaZHEyZlpyODZBTWpvVW8yS1diY0E3RS9XOUFlRXpGZnltaUIw?=
 =?utf-8?B?d3ZTUXp6YnpFMzdnSlVyUk5VM3gyeHBhTEN5YzgvUFdyMXJaTVJLUW5hNHlY?=
 =?utf-8?B?VjVma3RHeWM3ZVQ1bkhMRTkxZlg4YjZJMmVyWHZLT2M1OW0rKytmUHh3RkJz?=
 =?utf-8?B?bHA2VVd4QW9BUXlMZlgzVmtsWW5JdVR3V2tkcTZsOHlFN0NlNnBQWHN6WGNF?=
 =?utf-8?B?UndGWjdSVjAvbXpkSzE2K0h6Tll2REpKK21aVTE5MEo2ak1rbWhWQjlJeTJl?=
 =?utf-8?B?SG1oRWNxSjhCSng0MTJEM0ptem1SNmVYTFI0c0ZIb09YUys4YUJNY2ZYRzNK?=
 =?utf-8?B?OW1jbDZUQ3F3emg4M3VQSU9MdXBadGlkYUNxVmJpVVUwM2tPZkpTcVdzc3ps?=
 =?utf-8?B?d241TjJlQ0tMaGJuZ3BqS3o0QjJSazRVcWhJNWVxOGpub3RESVNJU2FoUlF6?=
 =?utf-8?B?SXFobFZZSTZ6RVk2Z1duSmx6QkhBd1JUdUttdjNHYmIwemFvT1ZQN2lTb215?=
 =?utf-8?B?cE9Yb3JhMk83NXBDNlEvVTdxcnJPQmM3S3dPdFBTaTlnOXNLQkp2NTQ4SWFW?=
 =?utf-8?B?YzgvRTkzYnovRm5YNUFRQ3lZNnk0THprbUJocEV2SkVvMkdKN2xuRWdPTkJZ?=
 =?utf-8?B?MDQvd1BhNmNTTzdxSVhITjE5MXZRK05BUnJ0Q2k3bzA2SXU5cFJVUmU4UURJ?=
 =?utf-8?B?NGZOZzY3MFBVbEx1OTUxTjZEYUhIbFZmblBudjUwN1hRKzlhZElGYTNIYmpy?=
 =?utf-8?B?QmJhcmVmRWhtTXk4SXdIdDFpUHIrZU1BUEE3OS96bGFYd0ZGYklMd0hDUG1i?=
 =?utf-8?B?SGlJZkZZYVFQZHpTcTBqekhUV0dLN0Z2MW1rWmJuaVV2eE40TCtWNmRBQnVr?=
 =?utf-8?B?QS85c0hoMnRkcEZFU01EQ3VrYmF2RzhIQkhOT2hmbWpoYUxuSUp0OER2V0No?=
 =?utf-8?B?Uzl3YURXOXBnaU02c0lna0g0QzdLdS8yOENtN05JYXJWbU9ScndVVGlkbjNH?=
 =?utf-8?B?SFNNaitsVm1sa0llcXlhQWJrZ3o4RHc4YkNOazhIRDhKT2pTNGxxTWZhdVpz?=
 =?utf-8?B?Y2NscVc4cStqeEJrY3R5eEJ3Sk8zSnF0WGdkWk51NlViWmxyd1YraVIzSmRj?=
 =?utf-8?B?RnBJZ2tybVBBb1RwbFNIamFreDkzVmo4djVuWG1wU1RqSFVBSGorZTZEL1Q2?=
 =?utf-8?B?SUhHUlVXNWhLVmx5NkVlTjZWcnAwemVidjhrMDRUaXNBL1RUNHdqMlp0Q09T?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FTcCJDLw0r+1yB/JfLZinZmbYMKhnX8V/9kItJU8sreMFhOfhwIkPDCzsFg6NHibh5+WIAd413hWQqgffE5w5W4nC5Dp5XloIITGTzs96MAPuaN4dyhKyHwpjE6meIoEQPYDVA1INwXCKFH3NWYkQOzUEPMF18h15moS0HUXyV/ZMnwz5oyV9hoXl9tEKVP1lanuP+26dllSns7f0xc2tPNLe+9ZGuZb4UXObGZ/ZohGWJxIFgxdi/rH76XtBZxDzKsMquz9OEPg+W/IzaG5T/PoHxZwCxCCTuJgHpCoivknD1kvREce/JuBQhgK/5Omn2JSB0ts7SB6sBYsKTerwjfxAADSL639vlKLX4T+rg2adbJXJ9qwZlPX7gVQAsjYrGqyhLFoc7h3rHRghPXMHRHyIuGbL3rRml+/pfQBsznZLBUgCBrNNVNYVQchHcwLJOJgHnuxAU0OTsctlGUMgalmRRuF5lXAjVcm9prErDHA+DeW3N4qHoUqhEyAtYX/h3DpaueKY/UkVd5bKGt30XbfmHWvf6D9tLorAUPs+2Hsa19mYX0HtFqW0VioUrBE+zSvSR7yy9sjAKDIIpD2R/I4BPMkR/xzERxcLD9SKqrBeUgWFItgzUaeS3CouMPu50fJtXphhnqNaMFuI0zFM434rEnh1WvLrY74PUHYC+Tcs4Rv+osojTUUX/4izIRzkQFFfe5FnXd/T8OWx+pk8RBM+EQ+butJuJT5Znr17T7lPoMORrYnFg0Zjtj703v7Bn94qyUdRr0SsYxPAHqjORg6eP22QKVOfPpvP1IalIuN1jSXWQmHFj3qcKc3UrnFEZA0hzUyGRyReeiuzfwsWgkfauIR3SaDdJQ56Vlxx9o=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6810e43c-251c-466e-239c-08db260854c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 10:22:22.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brSKgrIV/HEkCji1aXfjozyvDVlBPS03GsBCuDiGsVOD49TdTs7JDdHTL6Mb9+hOaE9GfqA0XxyA7J58TySttdiql2dKzgj8IuL1nxAvwAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5168

On 16/03/2023 10:09 am, Jan Beulich wrote:
> processor.h in particular pulls in xen/smp.h, which is overly heavy for
> a supposedly pretty fundamental header like system.h. To keep things
> building, move the declarations of struct cpuinfo_x86 and boot_cpu_data
> to asm/cpufeature.h (which arguably also is where they belong). In the
> course of the move switch away from using fixed-width types and convert
> plain "int" to "unsigned int" for the two x86_cache_* fields.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I was genuinely thinking of starting to pull the other cpuid() stuff out
of processor.h in order to start tackling this problem.

IMO system.h is still overly large, but this is certainly a step in the
right direction.

