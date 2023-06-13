Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A972DB4F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 09:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547861.855509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ygJ-00069G-UX; Tue, 13 Jun 2023 07:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547861.855509; Tue, 13 Jun 2023 07:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ygJ-00066C-Po; Tue, 13 Jun 2023 07:43:11 +0000
Received: by outflank-mailman (input) for mailman id 547861;
 Tue, 13 Jun 2023 07:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgtI=CB=citrix.com=prvs=52172834f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8ygI-0005sr-GA
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 07:43:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeed275c-09bd-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 09:43:07 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2023 03:43:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4981.namprd03.prod.outlook.com (2603:10b6:a03:1f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 07:43:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 07:43:00 +0000
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
X-Inumbo-ID: eeed275c-09bd-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686642188;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q+teAMRlfiEyZECXtGraSo49mSNqG08y085bVVPPq2w=;
  b=WjenxlwThtEvxrP5CkF9wNbwidcSs4truUjxIbWzSvyzhNO62qGJtY0r
   +zPX0QVTGUooTjCWzQNeijkGzXnh/TFmp4uNJCiCsqo6G31OSLmZMUWKT
   y3jgVynnvMjCYjxlbJRktoPBLquIDF7/wtxXdwiadzxKYgVEuZv1PU1rJ
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 115091876
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bNn7ZKimPMiFT91CBC+ffOkiX161TREKZh0ujC45NGQN5FlHY01je
 htvCGzQP/qMY2KkeIolPNy+oRkE75XTyYVlHgBsqnpnESwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQhby8dche82t6mwePlcPk92+ojAdTCadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTlrq8z0ALNroAVIAUaemKYn/njthO3VdVPO
 V1I0AolkKdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ5iELJR9M6Saqt1ISrSHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxod+51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:Nj/9H6k/V3judEnDZU1SRMg2V6/pDfOtimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WBjB8bZYOCGghriEGgG1+ffKlLbakrDH4JmtJ
 uINpIOcOEYbmIKx/oSgjPIderIqePvmM/HuQ6d9QYVcegAUdAD0+4NMHf+LqQAfngiOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYpILSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzS/Bky/JlZAkEuDzYJLiJaIfy/wzdZ9vfqmrCpe
 O84ivI+f4Drk85MFvF5ScFkDOQrQrGo0WStWNwx0GT7PARDQhKdPZplMZXdADU5FEnu8w52K
 VX33iBv54SFh/Ymj/hjuK4IS2Cu3DE1UbKq9Rj+EB3QM8bcvtcvIYf9ERaHNMJGz/78pkuFK
 1rANvH7PhbfFuGZzSB11MfiOCETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 DPM7hulrtJUsgKBJgNTdspUI+yECjAUBjMOGWdLRDuE7wGIWvEr9rt7LA89IiRCek1JNdYou
 WzbLqZjx9BR6vDM7z/4HQQyGGyfIyUZ0Wd9v1j
X-Talos-CUID: 9a23:uVaqAmB8rAnz8Uj6ExAg614IHf94Tm3cnSnqMx7lJ2ZEVZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A9LZ67g4QQHYknWS0sZOxhe82xoxw74uXK34Ny6l?=
 =?us-ascii?q?bsseDJT5hZx29hwm4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="115091876"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7Djlj++AShDlq8sR2FKgg3EsV1tO73nVgfb05z0y8c8mPc4cAINke7wnCa+kwINVdRE48W828Ir6d8ZdGKgT/fcUmSO3qdbjuDDtQvVCWP21ssQuys1zgGp/ft1rhO9uNlyDKpwCUbN6TAJ9Sx7HKZzTHphmGWtdMGajzuNiPD5g57y/DA0O+aEZNC4rI4gOVrVMgUdnL1ayYdsDL9ukOiMz17ulzn7QOebema6K1evGGVL5xHxuhSEd3oJ1T3V+J8lu0coZxUVmt80Y6dcbo+V1++gqnZ5aXHGtyoryVdoZHGGL9r7yex9ZdU/kXTzWv5C5xbhxeFSCuIY5O5LfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+teAMRlfiEyZECXtGraSo49mSNqG08y085bVVPPq2w=;
 b=OAxkDqSgQ/1bLBBFd62b/HfswmaBOXDNxhFjrZzWPpQ681kb95HE6/tHUwfGcmLNcM5zJTLDYc2YqlmlMXHHHDwa/km0+a2R2pVMu+8H80eiv5yNqSUQKDnwAIJ3eCT3ltHm4oF6rHIR/DfFUrbIXr2NuQDWQRlPuyepwbQC4g+ebDvWkHJKbj8drLE36UAQqg+sqPDi80xJoFOxC9LZKp53I79+xo51CSSD6Jy9ibZtu+lWpN6hK03/HymdHVqpcpzJSIlqFtXWuH5FzNi4Kq71VZChYS+gnul5j1jGVWXAzRx2iCmj/BGJhiSHRSco9oXKW13DuqqSlEyrBqTBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+teAMRlfiEyZECXtGraSo49mSNqG08y085bVVPPq2w=;
 b=WtMtFZ8+Syeq6otahSm/GYmXub/af4UXobYHD+owm2GuIdQL+uSjeweVFLHoljr5npr27tXwx++5b8y22EmG8IdILb3F+aTASuN32JNqvS2ihUjHE+2zXAtTZRc2GwkqrFFMtXHXupCGjAO5zjOzA5nqCRRetBF8dPp7aqJptUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <749a746c-6504-3bbd-2040-1b72c7477649@citrix.com>
Date: Tue, 13 Jun 2023 08:42:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: minor tidying of identify_cpu()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <063c5302-9a84-5f3c-5d19-926d09de5623@suse.com>
In-Reply-To: <063c5302-9a84-5f3c-5d19-926d09de5623@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0338.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c80879-f33c-4b11-3aef-08db6be1cfc6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	twOmYzzTYyhIC0H5QQV2pyszWa8VA5y2o2zWIvqtXAhQ965sUj0GY5KXGg5LYNc5v/kgQCgqHL7OndTXrnuXXfOdlLJkXic7aDQNLJWzFO9CEN2iFyMqpawTarzs63LgCn2H3zFSYWQ9VgWHRZSQhctMhOW3nXuyEwxog6pATxkUfZmdwaONLJ/QCa9Hi5Kq/gTrCX9+ZNO3kgpVrwXouLif/9oL2v9qNLzPbgUyxGn1+bqtD+c/OEYQiGNKBHMnGB6hnuAOD3H6NHsMhq3ACmb6Iny4WWA/syvSUbq0lAnDW7k03ndqUSTyvC1snU7PlQ/YQ+qJGQHE0gGnP1hS40Vlty4YY5JzqCI14Jh53jH3ZZkLwvpkNAAV5AW2oAwP9qLK+jab7la2tVLnSQFjMTYEHSWMZ0ZT89072isd5n7i0ByLyQQMidUdk2KbqbFWI8Rn/yhBX2E7DJZdnLon+j6Um0VUiZvXIhfAi3Xf5qDFBUsqZwcq9UjxyFMuqlq+zgzDPqe4KM++FmIczDqWgEphBN3JRY7J+yvsOiy7Ct6kdNl04zt10l06f77yLB4ikRvVc54jnI6M61ON0kELpWBBAehzTIConJtwF5Rjnd/83pF8pWwkH5BuYKAE9Uc56I+DFm6LS3q0PM/1+fwz8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(6486002)(316002)(41300700001)(2616005)(31696002)(6506007)(186003)(107886003)(2906002)(4744005)(26005)(86362001)(53546011)(6512007)(82960400001)(38100700002)(8676002)(5660300002)(36756003)(8936002)(66476007)(66946007)(66556008)(478600001)(54906003)(110136005)(6666004)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm04WGUwc2d5WVFScGdGNEZERWRaK0F2c09NK3NNUmlQc085SjZlVjl3UWRB?=
 =?utf-8?B?bGdHY1FQM3ZvYmxXOWduVEJVWmpnZ2F0Y1hieWowY1U4VWV4Q1BOZ2t4UVQx?=
 =?utf-8?B?QURtV2xNcDdUM2lrSzdtYTlzcjQrUjkxRjVRdnFxTHl5bCtKVzhjWG1mUUtK?=
 =?utf-8?B?N2lRdlhaK21YVjB6SzJaMlpxNjRKczAxQVM3aUV5VmR6Sk1LbkRrdDZndGRp?=
 =?utf-8?B?cVc2TUwrZTVuNktvTHNOdzhLYWRhK3FJZ3VtaTlGaDlGUHZlSFRoWG9XUTVO?=
 =?utf-8?B?WjdZYTV6KzhmUWRReEVUN1Ivd0hVeEwzenB4NWhoZzd1UDF2dE50YzA2Q2Yv?=
 =?utf-8?B?Q2lFWlpQVS9KSjRjSzQ3d3ZhNEtZNkRFUlFQZnVWMGVHbHAyWnlVQW14M2Jt?=
 =?utf-8?B?bnRDUjhDbnpWMEdyQk9ZN0tSVWx2dXg1elYvVThObnhtKzVGdWNSZ2FXaG1m?=
 =?utf-8?B?aCtrYk9FdURxaVlJYVNTZVd0NzNpMHFhcHdOcTFlMzAwMXdIRm9UN2hQMFBU?=
 =?utf-8?B?NU1RTjRwRFY1NlVXQVVNc2xFNXBDWDBpVVpubGEvTWpJMTEwbGdYdnlDeHM4?=
 =?utf-8?B?VjFVWFBOWjBIei82aXBtRTNoTktycVJORFJWdWtVYitVNm5RMVE1VU1jWUZp?=
 =?utf-8?B?dzg1N0hncTNqRHd3VC85QWtmY3hOQWRyUGFRdi9TdGI2bWsvckRQUWFzc2Jz?=
 =?utf-8?B?M0lhOTJHcEhPcjhZcFhhTEhnSXpURTRIRWlPTXIrRXM3anVkN2NscEVreFNp?=
 =?utf-8?B?ejRtNWRLUENzdUdQZEFqdDNjMTNLakEyZFlDVzdoZUdYcUY0Z0FRRUwvVllI?=
 =?utf-8?B?YzZCbEFwQ1QrQjlRbnMwbzI4U0JaL2dIWWl1S01qS2poZVFXaG84ekQycEVv?=
 =?utf-8?B?ekVRa1BPeERncEJEMUhDMko5emNXY2RUbkhpNnQ0a0s0SVNNaTJsUml2eGtP?=
 =?utf-8?B?WXlRdDFLQ3ZUanB6WGJSUXo5T1VSVW11aGE3T001R2xxVUlPaHd1ZkpxTWZs?=
 =?utf-8?B?dmw4SVFRUUM3ZTdZZWh2OVBodG1ZMFRFT0Y1TTNDWGExdFNaWXBjY1JpZC9h?=
 =?utf-8?B?dnVUWGRoQ2JuQld4Z2IzVVdNYXp4d2FOdUlMTk04d0hwa2toZ2d3dDAvWXFJ?=
 =?utf-8?B?WEVVeFN0VE1EQXlGRmZLc3RaWjFaYStoWWx2QjJFOWxiN2lLNWpoTGl4Yzcr?=
 =?utf-8?B?MFdMUU82RmhvQ2tzRFpKNlAxYk5xWWFrMUYweVdaQUt2bWxSaGNYVFEyY3RT?=
 =?utf-8?B?K2RiN1pLeGFtSGI3aDNjZVJLTFdHU003SmgrVEVmNEkxOU16L2Y1UythOThk?=
 =?utf-8?B?dHQvZHkyYkFKZXdXZjFSV1RDWXRjTGw0ZzhKUGYxM003dDVJQnFLZHU3OU0r?=
 =?utf-8?B?N05TRFFDSDlIYUVVM3ZOc1Y2REg0SlU0bHVVMG1YdVpXMysvWDkydHV3TVdZ?=
 =?utf-8?B?aGFFNW1HNmwzOVNrelBOSDg5ZmJHNzI4cWtucHQvbUZMb2Q3UG40dFg4R1lJ?=
 =?utf-8?B?YllEZC9pQ0JkUHozWTJieUlVZjBhUG5MWlJ2TW5hdDU4ZEFoMUNkV0tsYzlm?=
 =?utf-8?B?djFGbEZaTkpDQVpCOEdWY1AvRU5EYXlqbDUxTXpWa2tlOU0wK2NLOVhaV29t?=
 =?utf-8?B?MHhBUzlXNzlQNFN0Q08xZkc2TURrRldFTU1lclJrc3RhcnkyNUhXQ2V5QlBZ?=
 =?utf-8?B?MnJGWWw3OWlqbm9nWmdvN0hvbCtybEZNRjBIVmJ2N3BKRnVRSUcyemVQU3lZ?=
 =?utf-8?B?eFhYNDZHZDUwRXNlOFNKRGJWd0J5SnFJQXJkbDhBN0V3YlQrNWhPaTl0NzFX?=
 =?utf-8?B?YlFJaXRsZ1JmWHBmM2JzM2lEQ2psbHltSmFVUHZORFpSY1JVOFlaLzUyb3Nr?=
 =?utf-8?B?WjZLTHdQSHZMVWl0blY4N1F6Z2ZuR3BJanVrcUFNS3FGZnIrZk1kT2dFWGk3?=
 =?utf-8?B?NkJWQ1YvbnZaQ2F4V2tCVXFpMWRGVHRpMWRZRDFCdFNmR29yMi9najIzaUtB?=
 =?utf-8?B?T3NKKytKOHJZQjFVQjJaUzErZXFLK1hkUStaaXVXK0xqRlRSRWpQNXVxbUIr?=
 =?utf-8?B?ajB6U2ptZDM3VzZadTdsYjJnOFl5UGlXOVppN1V6R0MrLzdIeWtZN0FxdGM4?=
 =?utf-8?B?S00xWUt4bURNaFNhelp6NnNhcUlPTW9QTTI5V3VJU2NCN0c2ZWZkQnFZOFQv?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GhSdm7aVvpmazS/ykhJa8aQ8l+IFHCSPsyvGKaHwt+HqdMyV3ACMB5qKZiSuWmcrsEzGeCkk2HMOo9D/aw199MaFTFVTRIJ2GzKiCy6ESggAON3w0X4faEqt/udhr63KIJb0V+4PiApg7o1T+ujCBS1UorkgygSosKC/+5YE6sy87HHeDny5AAjAhZROZPQN6opW+9qPs+SEGiHZBK+EacVvCpynrygGultPoF3LBBkKLy2iIFoma/aPUGXmbB1heVbglf3XV152ngbOpt8bTbGsd7V1NwYsBubz0wOq/o+ofL7YAAn0XqybX24jx7SVsp3UURyAdeGDy/wxo+v9wAsiWxw1MA9RUI7ozfNFzokkJQ01Ou8Xk3MMFdFVPKnXNl9XW69bJvOQTBYsdEvmpnX3f0u/eGa7e4I+knXspTjSm0h9TOcnIkY8jd6quNmcIf4/DvvLXUI4XQzEnaWrVoBNW32RXKdBWQX72AbmgxDkfQBB2dUgiGzx1DlOmfYx/G76gQHKBb+AkconIpUKKEubzppZGUJls1HDmweTaj1dXiFvGP7i38XY9kmluikB4BKL+WWd9rYbQutRUvw//eC+vgpU5O9d7n8DBEM4zqWmOWcyDPoajZ/ODf1/60HNcIJ5eoaLyz5JvoNpnGXOXYuKWNICBrlwO0FW3S4zcOQyhTguUVFFyMCY/bETlHF3v9duqnjoFWMopHgi15TLOrQQKV0ghhIK2aa+GDi50v/CCALOhX0yy9UywWXd9Ezn+oAkqjjltc8qSIz7GFzIKAAGTukD+mozgfGwGexfw3d2oZE6UGSYWhZYyXL4T5zi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c80879-f33c-4b11-3aef-08db6be1cfc6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:43:00.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHJeLLhcQ+qKZP6oe6ryR2cjQShtygAq/JBWpGxdE7Td+PD2CvMZ1Bhyf9HS+watPp74KZynWNKk0BpYgIZckBCuzwdM2LArh6InhmhHHl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4981

On 13/06/2023 7:12 am, Jan Beulich wrote:
> Fields that generic_identify() sets unconditionally don't need pre-
> setting. (In fact the compiler removes some of those assignments anyway,
> at least in release builds.)
>
> With the setting of ->cpuid_level to -1 gone, also drop the respective
> BUG_ON() from default_init().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I have some far more extensive plans in this, but no work started yet.

