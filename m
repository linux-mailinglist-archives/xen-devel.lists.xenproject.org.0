Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D0702728
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534613.831777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTZM-0002N7-NP; Mon, 15 May 2023 08:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534613.831777; Mon, 15 May 2023 08:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTZM-0002Kl-Ka; Mon, 15 May 2023 08:28:36 +0000
Received: by outflank-mailman (input) for mailman id 534613;
 Mon, 15 May 2023 08:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjwX=BE=citrix.com=prvs=492a8bb35=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pyTZK-0002Kf-Sp
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:28:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7960fc14-f2fa-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 10:28:32 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 May 2023 04:28:30 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN9PR03MB6009.namprd03.prod.outlook.com (2603:10b6:408:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 08:28:28 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 08:28:27 +0000
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
X-Inumbo-ID: 7960fc14-f2fa-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684139312;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=A+2w2uIL4CRfbOiI+bsEJtkIHLIf9kj5b50R9RFN5/U=;
  b=GPw+w98JjJd51EqAH2NeyX3uxvmBZwB7I7b/8S78gIGDqygXb7jUVAQF
   005ZKpVaXS5pyrD0b5E0/x3Z0Ob1p4hd5IGM0pn7txoqvtCuVCjTGF50n
   5B9BVMpdUb4Hd+eSbEamgXPvBnWgG6yfUPVdyhQ+Pi42ShK4loRHL0baR
   o=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 109048423
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fLKyz6jJoxQkQ2olMeq/mDRNX161cxEKZh0ujC45NGQN5FlHY01je
 htvXTyCPPvcZ2GmKNlxPYzioE5UscXWnNZgQAZqripmFCMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QaDzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQkciopbS+4ltnvnq+ibbFhwcRzPvXkadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGybLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjCdpOROHirZaGhnXC5FJJNyU4dmfjuNWZ00isVcgHF
 VI9r39GQa8asRbDosPGdxC4rXvHrhMac98NC6sx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9WopWm1876VqXa+PHYTJGpbPCscF1Jav5/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BApJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:MDw8Bqhc/e1UJP+uaElJKExd9nBQXssji2hC6mlwRA09TyX4ra
 2TdZEgvnXJYVkqKRIdcK+7Scu9qB/nm6KdgrN8AV7BZmnbUQKTRelfBODZrAEIdReeygdV79
 YET5RD
X-Talos-CUID: =?us-ascii?q?9a23=3A5+K0j2hlkROsm0OYkk51Kk5FITJuTifH6HTvGF6?=
 =?us-ascii?q?DUDh0UZrNRBiQqLFYnJ87?=
X-Talos-MUID: 9a23:/lQnVgRU8RC8ZYxERXS9pg84C/9GwJj2EWwtyJMUtdPcCzJZbmI=
X-IronPort-AV: E=Sophos;i="5.99,276,1677560400"; 
   d="scan'208";a="109048423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXHEofgmBqIPQiMOeEtMlejjaTUDmWNExm77eQ6REMAa+JeFsKebSICHUExS79ROKEUGxMTElKqngmzu24gBbBPuRJVLeXMrHUXx3tP0S5sMtpod/nBVfQ7iHE+JV1Idc41NdZvp3vaqATtsAut2ZlbVQys7FmU1ehFE3W+vvCL8rShhX9gYo4C9syDVJXCW7pPdQCtu2w9xozgzYeqQQXuV47CLkrf6XzI9VIj/3QyxfULtmz8v/JFt3cSVqRp0Tcw2333hMoPsY57wht919zYFSAKQYZsAbu8hmMTpOqf8++dueUvEYYDKDrZJ3XuGka9BWC8XG+cQCdLTW+4uZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry+RzQIHanrhbQAx87mr7fxRbIKLdK9lz0ghfyCqjuA=;
 b=PqXnOgGOO2frL6oC1cFKxdoMQuJzQnkdIH8UG6OMGP82dIPplMHaAkpCKh4RflO1zdSoeHKB8xprHleuJeGHuXBCUYUvJmvBj0o1MunJ8RVQnfwYvz3P3Ju7nd2SML5sAAqKuhLGN7RlWo2DrbqnBydt9rNxHyVosPep687e+35iSwqWsv4SOvfALXzd5zfRXu+kihEt+U10a7GYZWdRM5ZGkuOY2BnLLdEMaPYf8M2UZLK1y+S1skEj3krH0OjvbkpWgPjSXAR8vJXWch/eX2Fl+v9HnMZqVx9XY6Glge3EmZ1FNOccp7lWdfviIefkKkt2Xr7+cQjjxEaXM9tauA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry+RzQIHanrhbQAx87mr7fxRbIKLdK9lz0ghfyCqjuA=;
 b=QjQyYa6SvF1wEOJtUzeglWOa0y6skSkbsSS1irc0xNnSl9r3sUD9W/PwaAqt4qWUb4BZNAkkBXlRZt945u6gY5fZ++zw6+dG1SUH+0pWknQ91ukiwQjmK+yAScwKSkAPkoIiI/XNVUL2ZfcItSpwMxyyg/OSK9SRnR+GbxOudEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 15 May 2023 10:28:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: PVH feature omission
Message-ID: <ZGHtJlrucK+XcAJi@Air-de-Roger>
References: <ZF7fSeYH/NK105EQ@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZF7fSeYH/NK105EQ@mattapan.m5p.com>
X-ClientProxiedBy: LO4P123CA0545.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN9PR03MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 37253f1a-4003-4f83-85c6-08db551e5b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gKEKnJjW4+nEtkrNWgiPW2f+q7o/HjzLhRncdMsdEghXj4qX4XrR6M2qJcUNPFQUAD35z6AoNT+3r4npej28WxvIrNLDbiLerlmSKJKYeZWDJ0t3lv5QomL52MbFFVZ8aPp96fepBL81UCDuju0Qf2XwZiKonbBZN0jcxLJnKTxKAIIghaNIxNz1GXnTVDY0j+yO+K/Wxj2RCtqo+LLY+vXZBjurd7+V3ApJFbgUPsB77g7Cc7P8A33tvCfWo12Y23TxcpSlwUjzrqiviuqwEJuLaQB7S6H1txXn/2Ep+O1X++QPC9uCdFfNiixFYwBbpC2kq5JoFx2tF66bQbJWmLyB4E/MT5QwPlCunW71wV4QKZ8jATP1aPlG0EmQBErJgLTcQbnSc94kKI1QRu4PqJBIu2A5MWi0rVr4OVdCEvcj1BXVR7botZe4wXQVjvdI5PJl63wqMfkPkH79pOWk3xWmffwV0qhdud0fd4PUoRvGyyuTrvKDHbecj4LH3sWnmqCOfbqCXFfLHAulSUH9Z/PNDf3PFHO0H9L3Lwk9u8B4LS7o3Bip5HnGtwT5l1iyi/q0puKPX7ttyo7q9lvT5gFtwxer5cGX1aF8Gl/OgfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(85182001)(86362001)(316002)(66556008)(66946007)(66476007)(4326008)(966005)(6486002)(478600001)(4744005)(33716001)(8936002)(8676002)(5660300002)(7116003)(6666004)(2906002)(38100700002)(3480700007)(82960400001)(41300700001)(6512007)(26005)(186003)(9686003)(6506007)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkYyRjQ0VDBua0dkRTVWby9adXhGMlBMeU1UZWRxZ29rYzhqdWl0NjZiSjdN?=
 =?utf-8?B?QTNJR2ZjVjlLZ04xK05JVnFRVGFnYjdlbTRBSmFtVHJ4TjI1MDhNMlVOdFFM?=
 =?utf-8?B?M241SUUyNnB2MVNnQnhobkFkdWlMQVRuanlob1cxbGJYMG1TQTd0eWVmMEt5?=
 =?utf-8?B?MWVrMWN5Y3BWSDNzYk1UNzhZTDBTNEJaUkZBK2JSYkN4SjQ0SEdmNFE4MVl3?=
 =?utf-8?B?SXkrL2Y4VHI5SFkrTTNMMTcyYWRjbUVjMnc0aEVub3RSYjNLR2JLVmR0dk5m?=
 =?utf-8?B?dXRUVUlLYURkR09IelVxWWtZcDQyV241Um1lV2daMUMrT21kYVp0bDRJVTJq?=
 =?utf-8?B?NkZZOWp5ZzFxRDg2MHJOVUhxcE9mQnhZeVFZWlp2eVV0UXYveXdXTnVXN01w?=
 =?utf-8?B?YVRsNU1EcWJpY3R2MFZUTnI0dUd2OVpodElxblAzTFZNOEtCVWFYRk1GeU1W?=
 =?utf-8?B?OUJWRkxvSWtuREpNajJjQll6L3l0eXlQWGZTdXVDOHU0a3B0dEg5bkc5VGMx?=
 =?utf-8?B?Z3lyVUFmV1g1YWRxNjFUcXdxMHlRTlFEbXJZcXlwMTVpa1pFbnhLNDZIOFBT?=
 =?utf-8?B?V3VEb1FGRE9RdnpwUW5RVFZKTElDR3hiRlVFMUR3dk5GYWxrUk14WDZYSTJZ?=
 =?utf-8?B?MmhrSFVlaTltWDRYUFdQQkZrOGxNd1pBNFJ2SkorODVZc2pYOHdwL0YwMWVF?=
 =?utf-8?B?eGl1c0l0blV5NUFlaEYrLzliNGlZWlZISWR0bFpmNmpEOC96Nm4xSFJzMVBy?=
 =?utf-8?B?K204RFVVWjVSSlNiSkorcC9FRmhoQmdMUjZGcDJvTDEvbkF4cy9mLzdtdWtu?=
 =?utf-8?B?aVdaUWJJbVIvYjhDcDhaSUhDRGVseXN6ZFIyYldkTUI5OHExVTA4dkxndnVF?=
 =?utf-8?B?MzRQVUU2cWM2dnMrYkxHWmdQY3BPekdsL2pSb0FoL0xNSFI2VDR1blk2M09C?=
 =?utf-8?B?WVJaNCtsMEpuMk1tZUU0VjFrbFZsakJTdUdzT1hhUXIrdHdmR3cwM2RFemZz?=
 =?utf-8?B?d2VFaTVBUzZ2aGlLNWdRYnFhTmxmMklaS0pwS05DL1NSdUMzRFlEVEZSSEVu?=
 =?utf-8?B?UEFQVGE4b1U5VU1zV1FOYmRTRFRKVnEvWGtlMnp5N2dHRDNzbFlCa0ZKUmZZ?=
 =?utf-8?B?Q1dHQTdzaHBTQ2JldlhrZTRNenhlUHN2cHRNR2FjcGRZZ1d5ZXFiN1VMU1Bm?=
 =?utf-8?B?Q3ZBUWZnNzlUbnZNWUV5eEVzQU1jMGI0dVJrWnBuSFd0bUpSSGx3b3J3Nkpp?=
 =?utf-8?B?dXY2QmQzVy9ZMk1ZMGZCNUZLMkhlU0Eyelo1ZEQwVjFSd2FVcVVXdFhRWkxF?=
 =?utf-8?B?eFJBR3JHSXhuRFJVNllzNmF3Tmo0Znp6SnNKN0NyT0dwY0tjS003ZDZUVXN5?=
 =?utf-8?B?b0FKaWxkSmFrNlk4M0JucUFWdkdNT1hLS2FZeU5NRzc4V1VkSS9pSFg4Z3hz?=
 =?utf-8?B?MStrZ2Z6VGFZalBoY0QzZndSYjArVzVtTXBJUERza1NBRmgrVkMxaGNyQlAw?=
 =?utf-8?B?akQrODJtYVhIS2VaL3hjcWp3all4aktwOGV2Q0l4QjdQa0tzTUJCYzhVcWNH?=
 =?utf-8?B?U2lVNEltZjFPRFdlcmtsM0NwWlE0WnovaVdJUWRocXl1SzNxTEJwNUFMUUZm?=
 =?utf-8?B?UVRlZmFPbTVqS01rS2RZbmhhQUdJWDIwZi9USVBXRWR5TUVjb2c2OXVsUUNl?=
 =?utf-8?B?ZGJVOWNhbkNSS0IvZFdOeUl5T2VtcTRhbW96NGN1bnZhNk1YcmZiUTE1UkF1?=
 =?utf-8?B?dWU2Q2xIMktrUW82NVVjc1F4Z1dRY1h6MEM0SjZKTkJIQkt0cVFvTHFBWm5v?=
 =?utf-8?B?NHBrcm9MR0hMcXNxd1ZpUUlSRUJ4REhGby9QRE1kaXNjNVhCUEw3bzBsTjds?=
 =?utf-8?B?RDMvVHJBeTZpekNhNEJjaFZrWmkxUHZzRFhRd1k5S3ZGZ1M0bGFObTVncG15?=
 =?utf-8?B?NlZLWGZ0anoxNmVUcnV1YjNia1E4VzgyRXVGejhHQm1aNFdDWHk1Uk8rQ3NM?=
 =?utf-8?B?WkM4dE5uaERKZ3JXQUNFdkphNG40VS81Wi9EWEdzRDVxZWlQUUE2T0FBbHph?=
 =?utf-8?B?ak1pRUN4SEVmSzRPNHRLeGxZWDUydm94ZTdtb0xmaW91RFNqTUhIeHV4MWo1?=
 =?utf-8?Q?Ynd+PI7+jyX+gVukwNHAJLENE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eA9/5Yxnd6xlmxL2lZLu4DkpNyv1WkmRXtAsUrUVJW1QBbvTY1qWFNNuR9DmHhCDt2YiVSVV2PLW/K2V39qU2mKxNRuB7EYW+mRhy4IayICkWdcwkUBYzc1zlTa1pxp+KOWxzIqA1tuSChY0JifUAXt3MbFLUEzi7a0KcynGxO/uhzasI+IlnHvPXnpHtGQ1GQ8MHUzZlVGwcav0sdCtej6Km23EMrp0ea8d24SkCB5+7WC6bGuHL0wxlRPDstpNY2szTTANDUOaDkpYhCzJwhOMrCyfVmCbYBhyf+aakoMf43q9dbfk9dwbEplIm9t5Xlv4jJwOmoktvmmGUXSi/zVEmCvoiS0eFuraFXjKaJJk6HBkZ86CikR3AVTNA6RmeyJYtv4EVAP7gcFy3pZCrsxUsGJlktUmE+7uiG8dyySXEFQneEmFEA+5fy34pMEh0CkxESterVfKRHNdTE6cCl8Ub+ptzKTltQ6ZWh/Pzo48LWksPKPCXrg8qeJml4RRsix0BB9rvFhmSf6iM2BuzEpHHziB8Da2yjAVf7pNUi1CqGm/A0PHrdNWXSidO/meiLoWZF8sEmzqdyrYIBuBR53Su/Pa0Z4yyrRiivTB2hPn6PIjb0di3cYV1BmJI1PPbXvMQgEAap+eR3PXA6GNtJAWOfxqm3hYc17cv8GK2eU2ZQt1xHAD7j6fwMJGQp0WpNfGz4ibKS4DrP4kVNx05/OnM850WBiA31cVEvVk1TeYunsWfGF5cu4DbSUpl7e16roVcxgLF+hwk1eYXKu8ZJAPO/2xAYO8yP3zuHpkVoU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37253f1a-4003-4f83-85c6-08db551e5b8e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 08:28:27.8224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XjBvSBcL6+NOkb5PjAX6khCH8WHl+dPvvo8QmM5+qJBHtvyRN79ELyNNmCeHasyw5zvIVQNsnDJIAxe5ksy/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6009

On Fri, May 12, 2023 at 05:52:25PM -0700, Elliott Mitchell wrote:
> From tools/libs/light/libxl_x86.c: libxl__arch_passthrough_mode_setdefault()
> 
> "passthrough not yet supported for x86 PVH guests\n"
> 
> So PVH is recommended for most situations, but it is /still/ impossible
> to pass hardware devices to PVH domains?  Seems odd this has never been
> addressed with how long PVH has been around.

I have worked extensively on PVH but didn't get time to work on that
specific feature, and more pressing stuff has keep appearing.

AMD posted an RFC series not long ago:

https://lore.kernel.org/xen-devel/20230312075455.450187-1-ray.huang@amd.com/

That got quite a bit of feedback, we are currently waiting for an
updated version.

Roger.

