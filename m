Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CAD6CBC85
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 12:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515631.798701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6Yq-0006OG-MU; Tue, 28 Mar 2023 10:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515631.798701; Tue, 28 Mar 2023 10:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph6Yq-0006M9-IE; Tue, 28 Mar 2023 10:28:16 +0000
Received: by outflank-mailman (input) for mailman id 515631;
 Tue, 28 Mar 2023 10:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UojI=7U=citrix.com=prvs=444182d81=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ph6Yp-0006M3-BG
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 10:28:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c94900d-cd53-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 12:28:12 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 06:28:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7092.namprd03.prod.outlook.com (2603:10b6:510:2a5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 10:28:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 10:28:01 +0000
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
X-Inumbo-ID: 3c94900d-cd53-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679999292;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eX2lLUjOHCoEVtIeRr6xcJjanCHo2v15xZR4v5Bjj0U=;
  b=cWiOKwQiq1k6Cu5IRiypSQ9osBIkL/LTYW/cNhwBbT94mryb9MEei6m9
   dQPKI7HPXO0kk09J2lT49yyJEA3cEEVUOaOFJJk8Z6H0caXFBYc9wbGRB
   rQFXDPXMzbI4OxEv2dDeOw4j3iTSRs2w7Zo6j183uyvQKWOJTTc7o0+d/
   0=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 105716062
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3cdW9qltMKKo7oivZ30JAnLo5gysJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCj2BOqveZWX0Ktxzatyy8k9X78WGy9QwSQtuq38yHiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5g+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dYBCAAvYFO4vrro75CpdrYrq+MZKeC+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTODnr6Ay3gf7Kmo7EDkfEnrhhuGAu0+kUPgPc
 2Ys1HsulP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5YQs1BTGS487FLbv14WuXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:ZMvwQ6xeXqTteJkzlVrJKrPw671zdoMgy1knxilNoRw8SL3/qy
 nOppQmPHrP4wr5N0tApTntAtjkfZq+z+8N3WByB8bbYOCOggLBQ+9fBOPZskbd8kbFh4pgPM
 lbAs9DIey1IGJWyeDdy2CDf+rIxuPszImYwd3z9TNGayZES49d1C9FKiC9VndbeWB9dPkEPa
 vZ6cpDqyChangMB/7XOlAOQ/LfodnGj7LKCCR2ZSIa1A==
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="105716062"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiqQ1hZFB+vj5QUWVhq8OpNyBrJkoFjUpIXlSCZV3rbMAPi8LFh3fxOTQrJ7gU3EXKhNapAegDnwAsaYQZWuXV9/cv7V6hMreLTsF3BI7aZW13vDQKNagBluuwmddAVLQoJjuIpiX9JwQ4sh86NFCUwqFL+m6pcsADVSp59gfZfuem4pF4mi/3ugbdf9py8IwL6zwl44ocpHMxfDzx44BzeA3XlhEe3n0fYhjo2P6hSNcU1be87ax1StL28By4a7R1ZLSPamzIa2CBPvUHH0qNobAEhd2PvCR0gHRzQyiUARTl3yMPwjCH5pkMOsNYqdclX+gPeG1D/KyOyO5onqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+1/s8iZ851MSYZGrNlrsauuVrtCXjUKHj5dmy4jKTQ=;
 b=cZ1MdMpUNPF17twHU5pNr7yrQlaPlM04dzdJ/F3CZw/e0LPiHAKPPf1iBfxECJUuzuiVPmoE079lOU+nBVCN2KM5SaW63qEYdExKTAQgv8ffSck+vjkIwbpAqhT0ifpd8rblT0luK799DJlXv0Lu4Ozg1jWIG/aJ5fANeRolHq2lcnSaKuEgQCd5wJZroqBc/LNaqwAzsfeDTjMrDJ/gX6K9BHW5qsWjgyhlEP06Epfv5QbMSsO9+HeLWkvC2/eE65wdSFSCjeNlTLGg3vY1geE/jnKo80wUC/CMApw3+SDXmLr4L3YiSXnR65cKvLunbMKOimDwC1FZ7vY03L/16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+1/s8iZ851MSYZGrNlrsauuVrtCXjUKHj5dmy4jKTQ=;
 b=nstahfWW/jzfL6ztkcRHZdF8/AvUECxxnToy2NMGgAt+u/on5zg3sGfPZJ+lNKoYIfq5jNelZh786r7VlCFFlYvgTif7uYTmoWpIPQPmCwCB+AqAC+bfgjeIBm5XdKVhDQeanU1hDmRQKDEQXDsnEsXrWBOrsugV6DZ51nwa9kg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fe6627a6-067d-c3b0-f6f1-25d21bb6a530@citrix.com>
Date: Tue, 28 Mar 2023 11:27:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/boot: Restrict directmap permissions for
 .text/.rodata
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230324220824.3279825-1-andrew.cooper3@citrix.com>
 <d26961b0-0c13-83d8-9102-37e1e297fc4e@suse.com>
In-Reply-To: <d26961b0-0c13-83d8-9102-37e1e297fc4e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 939d1fea-f786-4568-09f8-08db2f771b31
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ic3xi/YfnWbMMTgQD4dmwZI6sRkz0PRCXnNydD0UopwkOVrvYXOZL/t1C7D7OVaUJjlvOkFP5C8u+DR8gX2EGftTJcYNw7aT22eskiaC9n/zxP9+5x64AntbBpr3+EePpoEPv3LU+RYbVBaeCm/4TfyJuj4dD2d9fg2VqzmtpoBR7nV3DcNCPog+5G53TcaQ8ENTFXXRzTCjP99qW8H9/oVYEagRko76iuryFhGTRCY1fvlBGw2QdaMUjKqCg0dKBqzlkis68shPtMnD6OdWtiH49EOOM1v8OcLOaZFC7tcCmOhnWr7bAmCbreoYOIfjM9mvdW2sCVahlguqz7XnvpJVRMIGcjCrbmfoEj/0VnuUa++tR+to6COUCIPh1RnA0diybr3Pk2nAfTe1nwpBfJHmOQmn4n/HCZsnfenzMTEdQL82FAviV5NbMEeI3nODsUIQ6FbE4TKgGeQwVV8wRh6ER3Ek0VPkL89JgGBhNdTHj7ungPMOH4Pn2tBXYzWQlMC8ie59P48CibqG08H7lKWqccmlc8nlqM29AusJ3ch5R0UIMoiaBprV36l3ua9ac0wswlpMfLJkDEmBFHFWAwog0RNlj50tVq006YTXCMhrIGI1zb+4U6DIMn0YP/99rYSldo0BupYIhgjtwK6ojsN5M+Oxrxyd9iLTnI+1mCbYP8qI56FDZ6Iee82bnRqu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(66556008)(8936002)(66946007)(5660300002)(83380400001)(38100700002)(54906003)(31686004)(6916009)(4326008)(8676002)(2906002)(41300700001)(316002)(66476007)(2616005)(478600001)(82960400001)(6486002)(31696002)(86362001)(186003)(6506007)(6512007)(53546011)(26005)(36756003)(6666004)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2V1UXZvV1VzV2VSVFVIT0hRcytkSXdyVm54QTAyMldTU3BOdjlsMnBtdnVp?=
 =?utf-8?B?K3ZJUk1iUUswREl2V3UvWDQ5eGVKZk1FdWdiKzcwUUZ6cVBVS3ZPUjloVWRU?=
 =?utf-8?B?eTdGMVF5eWhqOUFXRUJaeExrWks2REhTekhLZitnVktIMFQzSE5RWS93QXdJ?=
 =?utf-8?B?ekhzczJKTWtJaktrdGJsaWhXU05rd2x1SGJOeE5PY3Q0MHpHak1aZFUzT2lq?=
 =?utf-8?B?K3cyc3lkelFRejc3SnlOckplNk5TMURZVXhTSENjbmoweVpvNnhPZE13S0Zy?=
 =?utf-8?B?Tnh5ZStSZk1XcHg2bGNIVFBJUnVUTDZLV2VhaDBuMWVmT3NLa3p1KzUwaXVl?=
 =?utf-8?B?WldzWVZ6QnhEWGc5ekhJb1lST3Q4QWl0M1VXampvTzVBbFRRKzJqNlU0cW96?=
 =?utf-8?B?TUs2L0hIQ2hBemxmRDFmWTZhM3hTWXo5OUhGdUFaRlFaYVA3VmZ0VDhKdXBW?=
 =?utf-8?B?V3N1alBYL1ZxT1VhM3JkbkZSK0lkbkZRQmFyTHJwbXFwUFdvWVR6T3FMZ3ho?=
 =?utf-8?B?TjNGdDF3Qk1JdTkyR21ZQWdXTGlmTm9vcWJ2akxtN0tvWUFyMW1IMmw0eWJp?=
 =?utf-8?B?RUlsREphbEdmaThvK3RYVWFRNFY3a1dKMXFBNVVnUTZiQkdpYUVTaVV3STVP?=
 =?utf-8?B?d0JCNllMZ2lMS2orUEp1ZUs2WTVEUCt4ZDgvK0NNemptMHVGcVM1MnhRZ1U0?=
 =?utf-8?B?K0EvUGV0a21vVVB2aEZFb1FYQnVDblhqZmtBZmJoUm9IT2RRSmp1cGwwTjBE?=
 =?utf-8?B?bk81YkI0cnRTMldPV2YrS0pUYWQza1lpbC92OTlMTkhvY1ZvVko1SzN5TnAw?=
 =?utf-8?B?Y2RjQmVhUkxOVWtlUVAvLytIeVV2TEQyQmkybFVLOGorWHBSbnhGYWkxNDlY?=
 =?utf-8?B?YjBCMW5xT1A3REM4MzNiZ2FHQTBVRldTMDl3Ym1GRjdqL0JZVWVRY0cvVEMw?=
 =?utf-8?B?MkNmL1orYkN4aGJJcnRySGFKRFFFV1RwclAvN3ZrYVdsaUdSMkdKdkx6SUZM?=
 =?utf-8?B?bnRtbVcrQ0I5RFF3Mkk5cGZKeE1mdXc5eE11bDRxTTFlSlowTThoZ3d2WkdO?=
 =?utf-8?B?ci81NkpXOEg0dXdOUi9NQmV0VE1lZGdkOGdsUEZZSE5GaG5ubitpYXNDWjdL?=
 =?utf-8?B?MTVaYXp3d2RUR0NIeG5wdkNUMExkeUQ1TWtPMk0zVGZ5cHJCbnJNT2NpQUNm?=
 =?utf-8?B?eCs0a056T3F3UlBRSDg1cnFOLzlWWXE0L0lVV3YyUnFjTGR0bHRIMGEvN0tl?=
 =?utf-8?B?WGwyMVBIQlh3Sm9QKzZrRW5yRjVNcW1zV1orOGFTb2NoRi9DL05ZdFczM1dj?=
 =?utf-8?B?RVFDWHkzc1Y0dm9wWjE5YjNrU25VdzNjNFpKWVYxSFltSUlvemNUU2pZdkxi?=
 =?utf-8?B?R3FZKzlwSUhYU2FkYzNSc0xrUUZQUkZXektTOVRtMUJGMTQzRWc4WitKVEF0?=
 =?utf-8?B?ZGxaQTFZbTEwT0Y0NjhTM2NPbTMzMXUxeWFGUUpUTEw3MTgzd0lyTzl2M2pP?=
 =?utf-8?B?ZHhIYnpSUU81UHBqZVZCUktDQVVMaEhRUDVKWDZsSTlhbklqRHZESnE1bUpV?=
 =?utf-8?B?YllXaXorZldrei9zNG0rZzRtQkFCd1ZybEdpOWliSWdFWHd1N0lkaldpN3RR?=
 =?utf-8?B?UnIxUVpFd3ZLR3IvOFhYUmE5dkFBMXJGS3F3QjVsKzk4T210NFpYVVpwdWVE?=
 =?utf-8?B?UmJCOFhHdndjbGxEZEY3RzJQZkthdlRIUE1UQlkyN1VueW16MEJpNmo0Y2pi?=
 =?utf-8?B?dFJ5dTVuUTZXL0R6SzZHTGl2SnI3Z0VoQlppZmRiT2lyZTNQRTlNekdZeDlk?=
 =?utf-8?B?UHVnRmFaTmw3d1UwWW1BdFZTR1NlUEJJMythbm1oS0pMTk9UMWUzVEVmYTVZ?=
 =?utf-8?B?ckZJRlV1RXIxUXg5eDMxT0dzUTJFdUNFQm9zOExRWmF2ajRjYVNQZWpETE5W?=
 =?utf-8?B?NVlpeTM2c2h4Qnl0WkkxRkxtNjFpVDFmUkhjeVJKNWY1ajJIK1lqUzNYNTl6?=
 =?utf-8?B?a1lhQ2luWFJFSDh5Y2ZWMGZUMFR2VWIxLzZOTFNJMXhxYmRwdTZOU1gxR0pr?=
 =?utf-8?B?UDVaWmdFMG9JRGRBSWhjY25rWW5JVWxXWDJTQjkyTXZKZjUxZ241aTJLdklw?=
 =?utf-8?B?VnMrT1h5b2ZiT2NQVi90bTA2Q0tXQ21POFFsWHlFU0paekZnMmduWnJCbTE2?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mCJtUzv7RkKRaNYi4T5lq5yiXzXqhz7XZdD7cGIUsmDeRU5eBwEOgiFxibSoDmEDhNRgR/8QvzSNOcbBZhWAREq7Vky4QCqUueBxe7rlYWs0tH1CyZc57c3sVtiJLAqs0DFB+PvtwjRhARjhgJwyKyH7LA2jPzXLw/9W6UZJtnIyNs4WAwSfdwSBLoOpIKZ6i99ZqwEznYYRuuN8Z2pnAKtE7wKxavSC8jwr41ot2m5jIRNTFdne0BYVWaFW8zDEw6Fx8Qs+PVNtq5lAnJ7+oh9yDmZWKeD+6gDhPxa0kpf2n7/LAB7zl/X6QB2XWiGwpFxAsvXF5ULNiweimmujtoUJ/FvmKl1IR4HrebEMs5FEWQHHSlHTtSllZ7XrxjnMY8HVK8G5TO23Y5+2FjqenpJsqkHu0GUlf0D+LHrFgUsnbe4JIP4mgHfAQeXQC5S1SZt1pJ1FXmUXsnaOz6JFmbFMACZtAxv1Ihs821Aja9K8/Gq/WfREDK2BZfxu+00C3STmbvuQQZyEqr9pYnE0Ym4G20qiCHePJst3MYLZM1SiPu/d7VcCOf9dWHshukj1jJkSz/B1omobbP3UgH2puvB7mCeKFmTiUbR9aNgQDf3rh4gcfDl+kR2vAVZy3M7ebaM3S/QOO7AGQ4tnVYWVE42D4SucuGNjkxRc23RUsJbqCvvG9S66ehy2LRnBg7zAotf8uDts5ZE2GiueV+5yHfarxVYFKkZo4pI4B5ZIKC8fCfmBZh2idLY0ozRFzN/lZ6f/YCtx+0teQvx2gKdcytKdaAQfTWuIHphPyuDpO4UrC+xApPZ+f/6k9oMDYR+OfrlkP4FbwwB/R9mUX41uwA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939d1fea-f786-4568-09f8-08db2f771b31
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 10:28:01.0123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OaVJtKS7hg0BV7biXDZOYM+i5MesHB4vY+5Wd9laKNCas0uf7YX2xIFgxQjXKXMil+7FoPwbvbfrtgLcagretLmn81jtZxwE7tIbCm4RiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7092

On 27/03/2023 4:43 pm, Jan Beulich wrote:
> On 24.03.2023 23:08, Andrew Cooper wrote:
>> While we've been diligent to ensure that the main text/data/rodata mappings
>> have suitable restrictions, their aliases via the directmap were left fully
>> read/write.  Worse, we even had pieces of code making use of this as a
>> feature.
>>
>> Restrict the permissions for .text/rodata, as we have no legitimate need for
>> writeability of these areas via the directmap alias.  Note that the
>> compile-time allocated pagetables do get written through their directmap
>> alias, so need to remain writeable.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> Notes:
>>  * The stubs are still have RX via one alias, RW via another, and these need
>>    to stay.  We should harden this using PKS (available on SPR and later) to
>>    block incidental writes.
>>  * Backing memory for livepatch text/rodata needs similar treatment.
> Right, but there it's somewhat more involved because upon removal the
> attributes also need restoring.

Yeah, I'm going to defer it to a gitlab ticket for now.  And the PKS
addition too.

>>  * For backporting, this patch depends on c/s e7f147bf4ac7 ("x86/crash: Drop
>>    manual hooking of exception_table[]") and c/s e7db635f4428 ("x86/pv-shim:
>>    Don't modify the hypercall table").  No compile error will occur from
>>    getting these dependencies wrong.
> I suppose the latter isn't strictly a prereq, as the modification was done
> from an __init function (i.e. before this new code runs).

This code here runs long before pv_shim_setup_dom().  This dependency
was found experimentally via testing IIRC.

> Iirc we didn't backport prior similar hardening work? So I'm not sure we'd
> want/need to do so in this case.

That patch wasn't backported.  I was originally planning to, as part of
the CET-IBT work for Intel-retbleed, but in the end didn't. 

We went for the "ENDBR on every function" approach on older trees
because it was better than nothing, and far less invasive than
backporting cf_check everywhere.

~Andrew

