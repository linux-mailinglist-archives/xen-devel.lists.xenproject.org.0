Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901B6C310E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512381.792405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peacE-0005Bx-SD; Tue, 21 Mar 2023 11:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512381.792405; Tue, 21 Mar 2023 11:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peacE-00059c-PT; Tue, 21 Mar 2023 11:57:22 +0000
Received: by outflank-mailman (input) for mailman id 512381;
 Tue, 21 Mar 2023 11:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peacC-00059U-SE
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:57:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87136f64-c7df-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 12:57:19 +0100 (CET)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 07:57:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6681.namprd03.prod.outlook.com (2603:10b6:a03:400::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 11:57:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 11:57:05 +0000
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
X-Inumbo-ID: 87136f64-c7df-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679399839;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Aha0monVYwLxxG/mAxKH1zVIuRgQ+5Mujn13hPhmNog=;
  b=WCCDXE3cfGAu33tqaLRrPPe74bilIdmS2b6rOYJ0wgIgrQCAsiAyogyg
   dakSmbGGxV9zU9I0h8FtX3tuwXkQTE6nJpbAeK0wtYWTJDk0Rt/dOWYrf
   NfjeFQPMKNa9fY9SUu6+PPSglB5LgoUi3AFx3hRDVBMVMMUmLUB8GXSmc
   k=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 104109953
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VAwrZq9ZfuAK37Yi8Tm/DrUDxH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GcXDGmEPKqPMDP2eI0kaomx90IHucKBndI1SQts/ik8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoS5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklpy
 Po8BxkJciq73dy156vlScxwxfsseZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUujNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpOTeXpp6Mx6LGV7k4aWSYzbQq8mtqWoAm3BMBOd
 EII9CV7+MDe82TuFLERRSaQp3qJvQUdWpxTDvc94wGOzYLb5g+YAi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L3IGZCICZRsI5Z/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxAAlnKkah8MP06S9/HjEjiiqq5yPSRQ6ji3YX2uj6h5ybaa/ZpKv8lnd5rBLK4PxZlOGt
 nIVltOe6O0LBJelmymEQeFLF7asj96MNDzHnVduBd8v7T2r8H+4VZ9c63d1I0IBGs0DfznuY
 kPapwJKzJBWNXquK6RwZuqM598CyKHhEZHvUKDSZ98XOJxpLlbYoGdpeFKa2H3rnA40i6YjN
 JyHcMGqS3EHFaBgyznwTOAYuVM2+h0DKarobciT53yaPXC2PRZ5lZ9t3IOyU90E
IronPort-HdrOrdr: A9a23:6YW9cqgl9M8s+I4X5mUBMjOIgnBQXg4ji2hC6mlwRA09TySZ//
 re+cjzsiWE8wr5OUtQ4+xoXZPtfZqyz+8T3WB8B8bAYOCkghrXEGgA1/qb/9SDIVyZygcH79
 YeT0EWMrSZZjIW46eb3ODSKadF/DDoytHLuQ7Z9RhQpHlRGthdxjY8Lg6aF01wSk1iBYAlfa
 Dsl/avvwDQBUj/cP7Le0U4Yw==
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="104109953"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFUNsko8SxFM6HC1ujOAHC87/BMs6/q4kdPb22JleMZsy7rMM7cm9Tk4V/0w/Q3VD/9cQd/fDvUm6GZ1776lMuauj3KCbwJ/XffXbaqEQVLSGaWHK6hWnRtUgZmh690gOInmuIGvDDjF4bkhiOwjc87RBgWVFDhmBSeVOi6ydt0dohbHby1vuG8C2LrLiccRrrNsoB/EwfoD/zSn1/35ye87zB+83vef6i/nX2s6lzdL/ozrAmMGjcZ0ybZLW+HGFgMp/KQ32TQLQYopd/dDBzA1pkyEcT8+0fwgrpWFuNvhJx3lCevLnmai/P+jqDbILcqRTIv+J/M6/YI3If9j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTu87o57m8+2mucMQg98cYlH9LpZQWWQjrhThqWhdF0=;
 b=Q0axLU1ne+N++Fzp2mMRi5H3ZME89o+sB2H2EoMoPmapxLw6v+8FBkB36h99Ul7WWJrgG1aEN43dHz3UvFqBDr571Ax7aqYIMmZHN/1QlFfYK8fwq4AAVIoQ3Jqj5VIkQatoYXNEy9wT0ZWyLQAOxO367n7XwGxjT8uw3ycyjFxZrlkn9JlGbqz2mTVqzLOfhqkRY84fU5mKuz698AYkVxCRBslxk6hfSkRqyPb4kjZCHMV5ga4aXgZkrDE3n/y36kzqO/Iu76nYeDVovgG19yT3SGTz5bLQZOMnyyVsUUh/kLSQSADvyJxMCgqHurhP/mhnvyUWVxRcvHGxPPopGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTu87o57m8+2mucMQg98cYlH9LpZQWWQjrhThqWhdF0=;
 b=IOfEHJg1gOWHCsFA2LB/9MAlhA3ZISnsgD36ZLGpEggp6RmJLtaaiXbvOm7rRfhs88v6ySg7lp4X7CfefZgOm5FPd6QVyADNC4oprPVRXhoyK4gME56RRfBNwyLd7R+clweO7QoIM6DF+YQ5ZD3g01eg1NwrOzsy8nAN7cX3an4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <05b04f94-9867-64f4-53e1-57e8238b049d@citrix.com>
Date: Tue, 21 Mar 2023 11:56:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 1/7] xen/riscv: introduce boot information structure
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <553b07e967f56b78eba2d27c9115cce707a45c08.1678976127.git.oleksii.kurochko@gmail.com>
In-Reply-To: <553b07e967f56b78eba2d27c9115cce707a45c08.1678976127.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0276.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: 649bb050-b367-4e1b-9ed4-08db2a0363d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oj16bkHVujLgm0LKj2Ub1kylBtzG8FfI19HlMLrj7kpXUeGXQ2uwZDK4PnYdo9uSYf9MJzcLciiSlPflksqMmdHIb+rWQyTrLaDdKjO7t3++3hCXKRnL2OEBxO2oexIjiG5ME8F7MkNlNa9lcBU/uiO3l8U/Shzn6AJ2wfMuU77iLXcs4OBaj2G8DmmOKbaghrsh50WSyrqfyamKRiiQp/YrN1jkb/IrNb2w3KpXtPJuBOx6epl9InQZ4uvISw1bBAEy7KXU9ZPqVaAXj9jXkU2x2wp0yTf62OpC8g3xlfNqznIRrIYg6/to2+llw4nNNuzDZQxGTWRngAbtEUsp1DvfM8x4M/VkZfg4+HNfnpoe96/WahtHTtWsUsnRCZREIAJxPM7TjOQrSdA5tLcPHHm9hkGNyp63wN+xR5G79fSwkaUO62z5ON/k2ybj1SaQFlpH9pY1VPQWIuHJoHEKFWi++oOo6xSnTlo+r66a5Pchh2xuG6aNaVCSSCEFNEPcuqOmcmiTa81EkvL966rhdVxAMXDgoOquXN3QEbgLMGAPSMFPFvTp5/RvJ+Ru+p+2x+NN56UAvEccs2e1+NEg+E8aJ5/lhszKlkiRdJNkM7MDKF8z4ACWiIO40GKPNX4bLpSpFIPMb0+drOtCdT3BMJpZVBSgQq5SspZinMDJsK5XoQRecOlriXbKfB2aIibQCxClArkpHTqHCd7VKbLHhfv3iITwzhzv5XYmJnKhfeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199018)(6486002)(2616005)(966005)(478600001)(83380400001)(6666004)(316002)(66946007)(66556008)(66476007)(8676002)(186003)(26005)(6506007)(54906003)(53546011)(4326008)(6512007)(31686004)(5660300002)(8936002)(41300700001)(82960400001)(38100700002)(2906002)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDJDVys4NFFidERaeFRaSFBPb1pQeEsxZmgrdTRaMVVtVXFYeGVQVWpzMC82?=
 =?utf-8?B?S0tIeUlUdXN5aE8zSHk3Nmp3bExlLzl5UHdCN2VPb0MxeGtzV3BDM0ZSV0FE?=
 =?utf-8?B?Q3pWeDJPQ3UwcW9tMktqbk1DdXVsRWtiMWdQbEVhR1FCSXJOK3FZVGVEamRH?=
 =?utf-8?B?a0tIeEpBeHYzVjlWSnZQWTFZS2k5SjhLT2hFN2pnNWQzV0FOcmJ2K1A5OHJ1?=
 =?utf-8?B?U09DQXZncC9TVktsK1NUbmxYZENVT2ZGK29xTEVjS1IzRmdKTzRWdzNDZG5y?=
 =?utf-8?B?Wm5EV1RKVDNJYkQ1ME84dm1xT1hyaHpDK3BySXdvRGR5V25SOVpOaTFYU2Zt?=
 =?utf-8?B?ZENSbUpBRDBOSktxQXBuM0Z6LzFPVnBHMEpmNWM2OE9EZXlqYjh0NmZ6Nmxz?=
 =?utf-8?B?SGdtK0pCcWxSdFNwRk9MTy9mMXBBeUJlOTRhZ0tPeXlYMGU3VWZJc1AwN1gv?=
 =?utf-8?B?ZXVoSlgrMUgyN2wzWmxBcXJPWGZ4c1dOUEhuQ09XTm5FcEZMaGVQdkJsa3RQ?=
 =?utf-8?B?VFZ0VWtMZE1wTEcwSDNyV1gzN3grOU9hQmh2Y0xRNGN1YkdVbktqL25KNU9v?=
 =?utf-8?B?TFdKM0dMcWgxZ0Rrb1BaNWhpamZkMWlvWVg0dVdwSU1ydUFFaTNwenBzSTRi?=
 =?utf-8?B?R2w3MmhnT1RUbzVGaXNhVUJmeTFydHVxYXpDQmI0dWw5aHgvRmt3TlNiN0dR?=
 =?utf-8?B?VS9yTVFja29hY1pWaDRYejVuVDJwNXF4TGljUWU2SDQzQnBsUmh3bWtkNWRL?=
 =?utf-8?B?WTJBVldHbXkzVTN3MEQ0QWZFUDg1ZlQvbDY5Y0Zma2NST0thajNOOWhQMy91?=
 =?utf-8?B?SHJMeVY4Uys1dGtQeFdqdjNNelVlU09SNUx2b2hWcm93Z3A4NHpLQnd5ZnQ5?=
 =?utf-8?B?YXZmQk84ek4yazQ4QlkrRnB5cGtxZlNFWmJKaGhFY0JjV0hkb01MQlVuNktS?=
 =?utf-8?B?cnJpKzlFMWhDL3pIdGNoK0FNbHhrOE9mVGkwbFF4WCtDc0NnWUxhS0Y5eUFL?=
 =?utf-8?B?ZGJud3BWUlJnYUdIQTd1MzEyZGk0OU9kOEdXK0NEdVVaM2dVajNCNkZGdGNn?=
 =?utf-8?B?RmJmRVNOSkplZXoxSWxxMnhBMGtRNEpxbDB4b08wSnU0UGVRWmFqYlVBS1Yx?=
 =?utf-8?B?QWxVdTAvdCtiV3l5OGh6ZjFZcmRBOE51SGhqbEsvVk1JQUhmWDhuQ3Z1UDhv?=
 =?utf-8?B?NGdPQllpTTExRDlsV2xFT1BteTlhK2VRWG94MzlJaW0wUUVyTkJ1b2J0Q3N3?=
 =?utf-8?B?ZVhGMHRkaWZQNWt3eDZIU2xSbTF3SmVRbHpjUm5uYVlEcWZNLzluemI1aldK?=
 =?utf-8?B?YlY0T3YvOWwyU1huOE4zQ0FuTHFWbjUzdmYwTmVoWGN3VkhNRHo3S2hBTDVS?=
 =?utf-8?B?NTR5eDI3bGNkT09yM1RqR1Q5TDhwR05wdTgzaGowV3h3c05PaUlIcDNCc3BO?=
 =?utf-8?B?a1lPSVZIMHVjbGhXeTBMUHZqWEpSNjh3MDFhM1dkWGNQMnplWGlrcTY3eGY2?=
 =?utf-8?B?c1gvREpvNy9QckZjSGFXK3pQL25UNTAyL2pvTTZSV1Rqay9pNldmT3pVRWlw?=
 =?utf-8?B?ZXpRMkg5U0pqTEVFSS9lQUl0Wnc0WlJxeVFPZ09OUDlVcjgvNHkrbEtVY0RW?=
 =?utf-8?B?d04zc0JRaTdlTUVIVDhFSDJtMkJsYkJRODAzWHFEL3RjVFBPeWhaTzBVbisw?=
 =?utf-8?B?NGpYdjViMWJoRGg1TWFmanA0Z2d0QURJL2tPc3pGNURqNkVWdS9sVVVvcFZC?=
 =?utf-8?B?RWhTMUxEcW1EWEwvelJvL2Y5WCtFSEttdm9xQ3BWQ0puVVNDQW9CMHZseUNo?=
 =?utf-8?B?UEFIMlFveTVLZ3NEZlgxTnoybnh6dll4djZSQit5V1NjcFFaQm1mOTl3K0Q2?=
 =?utf-8?B?OHJ5UEI5VWNwZG5PWElDdWJtUSt5WFQvamsxb0syMUJ3M0FPRVRxRHY5YnA2?=
 =?utf-8?B?VzJmd285VFRYTDZMbEhDRFlTM015WTEvMll2dzR5NXpSUlVKeUlYQTJLTEdn?=
 =?utf-8?B?V3lxOUxOdFRoMnpDYzlHNnhPbzZXZVJDOVNNaEJuRXZldHNjdGFTa2xVd3l4?=
 =?utf-8?B?ZTZHRVdZVVV2VC9ZN0JjQktwRTIxSy9waFA3N0t1c2JkSjBDTjBvN3h5OWdu?=
 =?utf-8?B?dm93amErakRUbHZqcGxkb2ozTkZpR1hDdVZuYlF1a1BEMGY2TnQ1NVhNVVJr?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?YlZZdXArN0h2MlVMMWViNDkyTkZvczBwTkVrV3ljQlkyTmVVQ0hScTNwQWZM?=
 =?utf-8?B?Q1EvVmFjUHlhK2o4ZVlXU1kxY1lDRWNTRGlxMGpiYkFWaDllWDIrNU5pdDhu?=
 =?utf-8?B?ZE90UzlVZ1JYY2hMcSs4TnU1T2Y3ODZvN2dkcWJEWGU5Z0gvSm12L2lqYlVS?=
 =?utf-8?B?NXNPekQrSFBwbHRFOFk0Z3JqR1F1SkJsbmpSb3ZrZW5rZC9DUm9nMjZ6ODNh?=
 =?utf-8?B?M3d0WHEwbEVrdDhNZXlibWg2SURHMDdBYWlOZkMzYmUwci9xdm40ckpQN0d6?=
 =?utf-8?B?bUE1djJOVG5HL1hScVRYYlFQOVJWcGZBdnl0VUprN1A2VUJqZlUrNzVHVVFQ?=
 =?utf-8?B?R3lZQlpBTWdDMk5jUytVdUgzdW44ZldyeEl5UGtFYzgvTm1uSkRQdnR3T2Zj?=
 =?utf-8?B?SWhlK3NRTzAvQS9rclQzN0tMRDBCVEZPQXNWMmExU3dGNEIyaENBdkdPeUk0?=
 =?utf-8?B?RktpUDBrVlJSMkZlSFlBWmR5Z0JYT2U2bDlacGpCdkdmWHR0WmdhcnpKNElu?=
 =?utf-8?B?enV6OVQza0QxbUZMNU9qaWJYc3pWZTE0enMvRjl1aitpSHdnUkxlTzZFeXho?=
 =?utf-8?B?eE5RSFNPaG9LQnI1eFJ3N251QXB1STJFcU9Ibk5PZ3RsTkRPV3ZpY1dWRVBB?=
 =?utf-8?B?N2tsVnFuNlVYMnVnRUtucGp1OVZoaGs0TFlZU3QyNmxuQ0szY3J6b3F2Rnpp?=
 =?utf-8?B?TGpRc1F4Uk5oemtxZFVwQndjN1QwMEFwTVZDWGphelFPQ21iUkVsUlI2dzlD?=
 =?utf-8?B?aFhrTWhSTHhCTW9LV1VnZ0tYQkpHOWxGSEJCbFlBaGpRL0RWNDc4LzhtclhL?=
 =?utf-8?B?Q0pWU3V3NnlRRTg3WXFycVNwcW5POHRQQTZsMU1JVThOd2JGNXRpQmljWVBY?=
 =?utf-8?B?dGJSaml2V1c2ZGxRL091NWxDdUtSVytSbDNXRHpEUEM3dHRXOVkvMkJoYjVJ?=
 =?utf-8?B?bFBLcmdJWDJLcENTbTRHdytDQk9yZ0x4cTAxdUtMMFhyZGdUZWZrdjIxYzlH?=
 =?utf-8?B?ZmlwK0JnUmVsSWtjMDFneUtCaG5POGVPd3dWU2lsTUw5UmZONmxSRVByazIv?=
 =?utf-8?B?RUVVeE44VlZFeVVVcVJLZGVoR05iQ2NqWFRWUU90QWtOZE0wS25Qb0tQTUNp?=
 =?utf-8?B?ZGlrcmxic2cwTkhubmtCK3VqT3ZMZUxMVThYbzlWeXY2S0FLc3VuZWpCTWt2?=
 =?utf-8?B?TGVqNDJGYjRZK3g5QldYSEdkWGZJSjU1K21sekN5UWRpV1JtcTIrLzlzU0xC?=
 =?utf-8?Q?qTXGduBX9hN4GHE?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649bb050-b367-4e1b-9ed4-08db2a0363d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 11:57:05.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+rbHGGqRMFbxBRi/tZgHG40aSzdR7lZ54eo5vRvQFrbQl71beftK+z/K1SIfal8ygWQMLU9PCetOunRAufQ/kXuB6V+O3WUDalpVsOG8IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6681

On 16/03/2023 2:39 pm, Oleksii Kurochko wrote:
> The structure holds information about:
> 1. linker start/end address
> 2. load start/end address
>
> Also the patch introduces offsets for boot information structure
> members to access them in assembly code.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V5:
>  * the patch was introduced in the current patch series (V5)
> ---
>  xen/arch/riscv/include/asm/boot-info.h | 15 +++++++++++++++
>  xen/arch/riscv/riscv64/asm-offsets.c   |  3 +++
>  2 files changed, 18 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/boot-info.h
>
> diff --git a/xen/arch/riscv/include/asm/boot-info.h b/xen/arch/riscv/include/asm/boot-info.h
> new file mode 100644
> index 0000000000..cda3d278f5
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/boot-info.h
> @@ -0,0 +1,15 @@
> +#ifndef _ASM_BOOT_INFO_H
> +#define _ASM_BOOT_INFO_H
> +
> +extern struct boot_info {
> +    unsigned long linker_start;
> +    unsigned long linker_end;
> +    unsigned long load_start;
> +    unsigned long load_end;
> +} boot_info;
> +
> +/* LINK_TO_LOAD() and LOAD_TO_LINK() works only when MMU isn't enabled. */
> +#define LINK_TO_LOAD(addr) ((addr) - boot_info.linker_start + boot_info.load_start)
> +#define LOAD_TO_LINK(addr) ((addr) - boot_info.load_start + boot_info.linker_start)
> +
> +#endif
> \ No newline at end of file

As a minor point, you should have newlines at the end of each file.

However, I'm not sure boot info like this is a clever move.  You're
creating a 3rd different way of doing something which should be entirely
common.  Some details are in
https://lore.kernel.org/xen-devel/115c178b-f0a7-cf6e-3e33-e6aa49b17baf@srcf.net/
and note how many errors I already found in x86 and ARM.

Perhaps its time to dust that plan off again.  As Jan says, there's
_start and _end (or future variations therefore), and xen_phys_start
which is all that ought to exist in order to build the common functionality.

~Andrew

