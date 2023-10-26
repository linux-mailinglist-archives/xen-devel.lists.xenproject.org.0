Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651DB7D80B8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623663.971722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxZ7-0004IC-Aw; Thu, 26 Oct 2023 10:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623663.971722; Thu, 26 Oct 2023 10:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxZ7-0004Ff-82; Thu, 26 Oct 2023 10:26:13 +0000
Received: by outflank-mailman (input) for mailman id 623663;
 Thu, 26 Oct 2023 10:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvxZ5-00049n-Au
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 10:26:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 119bd3e3-73ea-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 12:26:07 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 06:26:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6587.namprd03.prod.outlook.com (2603:10b6:303:12a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Thu, 26 Oct
 2023 10:26:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 10:26:01 +0000
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
X-Inumbo-ID: 119bd3e3-73ea-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698315967;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+sTUP5qR5fubrejn8M004P6YiRXhreOtEHRwRotQAC8=;
  b=VebcaJ3T5hZpZT3Fay/Qzq0lehLglZK4e/Kx+59hXf0TdzGORDG85Yum
   EA1MlLvvopMub1vnw7CgZTGFzCis2yrNmQ4CeF3P/OtfN0UKgo3WcRrCC
   kiB1fKWZfbpTi2n8L8KPvhekZYbx/cZ1H8kR1fp3syYl8WUUIdsNICTVG
   8=;
X-CSE-ConnectionGUID: YIpGx7LYQ3W+W7KEWPFVrA==
X-CSE-MsgGUID: FfQC0dJ7Sh+Mi5SXc7IWKw==
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 126704757
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:n3Er8azHWro0WbkbBC96t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 DMaWDzVPPyDNjGjctpzbd608UoDscKEndcyGlY6ryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmP64T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVBv7
 dMIdxQ8V0u8xN3p45+EcsdSnO12eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVIhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WRwnunB99NfFG+3tBkuXbLyk5MMx1VcFrmmsmy1W+BeM0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+YUr1EuRHpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:h2RiwKlfqK7wAj3qalcneTbArPXpDfLN3DAbv31ZSRFFG/Fwz/
 re7Mjy1XfP+U4ssQIb6KO90ci7MAThHPFOkPUs1NuZLW/bUS6TXfBfBOjZskvd8k/Fh5FgPM
 5bGsAOa6yTfD0K6bec3OD7Kadf/DDuytHguQ609QYXcegeUdAc0+4PMHfgLqQZfng+OXK2fK
 D22iJVzADLRZ1dVLXIOpBMZZm3mzXI/6iKXfdQPXIaAFHlt1yVALmQKXalNhF0aVJyKbNIyw
 j4eiLCl9Gej80=
X-Talos-CUID: =?us-ascii?q?9a23=3At4e9TGkC2UkbQOK2/hIYKSu/TePXOUz81FjAfGu?=
 =?us-ascii?q?JMD1WC4LKanKvwI1aieM7zg=3D=3D?=
X-Talos-MUID: 9a23:/cqecQbL1CqB8uBTmTHVr2luFphT4+eLCR02oZ5ZmvanKnkl
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="126704757"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFWi5f1Fe/KKLw16XfeZa2wwfNsiIsumcKd+bPG0+4jyjhHZrZ1EQaODx0MpM4u9ZhOTL1zL1B7CAp4JH9vUtYZT5odaQiuG1VHVLdXQt7cqMAmpQZH7ZFa0hDB61Ne5YQYYywbIVW9WCShN2cpNvBXLCQLUhdiJeAgfvqnHiHelvJgkM1mKAlp8cBqVFzoYw3T4VOl8i5N9ggHEA4gKSI6VJvkuo/zLENuAkm1rGoAwtC43IwQxrt0XgylfC2oG7uzlt8cFuaz12tfqT+N4GV/taicLOH4/3ujFmogdD96CbYXlr3aIh+FTgUTienMQkYPB+ynvF3jh+n1/30hdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqfHx1i3lbisw850uEHI/HK5zZIIPkKVGBYLqcS0L1Q=;
 b=UyDEjjcUCsZnvwM2e6+fDAJQBkqbUe+tNlnfy44fnV4qlYXKSTVa1NNRa9zlC4/Z1m/+xgucWsRU5dw7HB+ShDditUvHBDfFM+O5llkg+UxmJVX1zLq14xK9dGCx5eyCIQY1opJ9s5WTGS/GgeJyrMzisfTHii/nd5BkiwKJqfElgzyICumowILOkjc1KGLPOAv06cAjv1SlVu6/AaHU3YmS4o/biqtFM8lgx6E5lhzIOQAcwEHsNg/iWABJkQUlM523Q0+zyNkfCNLGASEoV/JWkPJ371ISR5T3UIL7oJ9DXuzaBHlJ0H+WDOK5twlkXxjW+5O2hZkNlYEAL00wGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqfHx1i3lbisw850uEHI/HK5zZIIPkKVGBYLqcS0L1Q=;
 b=AE5AxTCVnbNDgcdFjFu5H3RwbWQIi+AqGntlS4TRIB4gMvvzEVOILy4kuzkyrxQTNt6Bjlfz04qbOY8hUOMrirDkV9Ou5bD/JpsNkzIIOGagqi6InR8DrDEHctWaz4iKe7YKM+QGTaGi6hQCV+GqIFEY+kL1m968ooYXWR/OF1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 12:25:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/7] x86: detect PIT aliasing on ports other than 0x4[0-3]
Message-ID: <ZTo-tpk64ew4rk1o@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <042f76dd-d189-c40a-baec-68ded32aa797@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <042f76dd-d189-c40a-baec-68ded32aa797@suse.com>
X-ClientProxiedBy: LO2P265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a873f5-4499-47e8-550b-08dbd60df3b5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YS3/7mTks388NPU2jXPWphwBrKlWYjQsbbCDp+Q6QWAbENvtsyMmtP/7faKBJs3nc8rRqrMqTPLJtW6D6qZiallhhggjUvUmXBjs2kCFIeDZS/ga0654YHVNal0VztB3Xj8NyAj2ljy+is6RcQ+XP04gcQtoFPfVA8bfoeXcrgMoHBefvpdGpFju0Nvqu65zUYz0oZBTXGRzLyVoPT223JR01ieoTqOjjwp3Wsvc8Rbuz42L6ha/nun91X+rcw+UYEAABxjHFXTGbW3PbVKtnX8ggP1SsJCsmRZtIMHi0wCIFYxMaIoj4glGd5R7yntOJPS8tNTGnM3NNmtI8BlGMwcyq0dcopCoa/Yl/Ums/R8qP5LcBX27K7954zLn4HLytEhHeJSaN9movHNUvweVh81++0vULtzQw8PyIME+fR1OwJJ4EdOsbtsO1lTuRVKdm8Y5FMEwed9jtA7zBPToix1m8d81y9KbCAnBdryK2S92xi4yzEh4d3PvwfKKvANE3JQAXKV7750ya7SZEkoL6jWFZVJooSFYwjmFptf/+Wc+ejZCxpHkg78ILO6msI+43qDYywpr+SeXK3lpbR3+1AtP9QldhZw43iu5zjGy5Os=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(9686003)(6512007)(6666004)(41300700001)(6506007)(6486002)(478600001)(83380400001)(26005)(66556008)(66946007)(54906003)(316002)(6916009)(66476007)(86362001)(2906002)(82960400001)(8936002)(38100700002)(8676002)(4326008)(33716001)(5660300002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXIyYnhhL0NFN2szTXY4Sml2RkhvV0lNRXVPdHV0TjJnbDNQUXl4UGQ4YjMz?=
 =?utf-8?B?TzdoVkcvNHRCc2pSdjk3bm51RFNSYUFDc0pQQ2gxY1pRdGtLenlSeHVFeU5l?=
 =?utf-8?B?NHBFVDJlRWF3NGZPTWI0K21ITDQzUm1GYXN1dlVWc2M3WlQwcFZ3SzhzOEJj?=
 =?utf-8?B?Znk1cFV3VVlrU2IzcXJ6Z0xQeWJZcGJUN1Q5TmVsS2dGVmpBVmtUclJZU29B?=
 =?utf-8?B?dUFsaHZTem44Q1BBRkQ1UytuY2hUZ3YySjJ6eHJHYVdKcmNYeEJTZmJnV3ZT?=
 =?utf-8?B?YVMrUmkrUFpabVdsN0VmZUZobFhhS3N4QkEwVDA3UkV2U1hMaXlkS2FnM3JV?=
 =?utf-8?B?cDZsZlpBMm54eHJweVlLeUEySlRGaHkyK3ZzUmNraTZFSUJFVk51YnVMcFZQ?=
 =?utf-8?B?emFSamdPZUhaQ21KZ2szdjJUWU9VU2RKRUJUSzB5U1RLd2dGTnYvSi95YTNl?=
 =?utf-8?B?RFZwVTU5NkdxK1ZIWUJyWHhhOEd6OW1PSjZRUTFodm9CZDZrU25qQkVkdEM3?=
 =?utf-8?B?ajM2NEVzelZpNU4vS1ZBNVdlYUhpUk1EaW9KaCtkZXdCWkVUdDNSMitsb1pr?=
 =?utf-8?B?R05CWStibnBXRHVTbXYyR0crRllFK3J4Nm12blhQOE1OTjZuY1RtV0FOZDk0?=
 =?utf-8?B?WE9LajBqVjNKQUh0YVFJQlNYbHVDMDU3bFJzVGxhRStXZzZaaDMxTmhRTnRB?=
 =?utf-8?B?alU0cGg0cXhoUHdmalRXeS93cXpzN3ZtYkgyZytsR1FEVHI1eXBXUlNILzIv?=
 =?utf-8?B?YjNyd1AwenFjZ09UZGgwRlNORnQxVWZGbGlJNXQ1VXdXZDdsbWtORTBNcWxx?=
 =?utf-8?B?YlE5ekVwWmxOdzhySXNPTG02OFZYSTZYa2R0cHM0VUtXS1RKWHhkR0tqTTdv?=
 =?utf-8?B?eTFsd2JyTnNoRytZZEc0T2JLZW9yQ3JQYWhER3g1b1BNYWZJd3NWV1RvR3Rz?=
 =?utf-8?B?SjFUcEdaWGxCdXBad21DWTZPdEE3QzZ5anMyRUFUWnN2bW5rVjBOb1lLSlgy?=
 =?utf-8?B?N20rc1UvTjl2RXpzTVN2K0VLbE1TWXVVQUhDdW9kcnlKMXk2ZVNEM2lXUUZ2?=
 =?utf-8?B?QTEyRms5eXd5OW9zWjdJTHQ1VzVVVmtmQkVrSng2a1RQdU45NEVJVjJLVnN0?=
 =?utf-8?B?L2F0WlhwTFlRdWFVN2FLL0V0V0V3dGRpZk5LSHRVQWNCSjNnRUtGaUdvQSs5?=
 =?utf-8?B?cG1abXYrdGxMekx0Z3dvb1FZS2lMMlV2UHI2MzRFVUp5MXZaTjJrMHVRd1VR?=
 =?utf-8?B?V3J6WlJWYXdJZmorMWl1SVVsS25Sc2t0TlFPSDVad0MyTWViNEpkTlduRXQv?=
 =?utf-8?B?cndhY1dsem5CbXVzUkxlSlA1ZmVpMDY0QnE1QnVkWHZTWDBRYWtUTUFMTm9m?=
 =?utf-8?B?ZzNsRHZzaDFFdWNlSXZsWGZmS21aTUFIZVAyeTlrdDJWcXZNVmRsR3hadjJm?=
 =?utf-8?B?V25Fa2J1S3p5cWV3dnVEUDdUR2NOMTVBMVZtWU84WUJUSWZyTTZaUGZPMkkv?=
 =?utf-8?B?SmlZdVppUm10RGY1Q2NhOU1JcXFZSWg3SEJHWEdzQU1NNm9ZdUtZeWZRK3gr?=
 =?utf-8?B?QWpFVEV5SVFROCtreVZFRVMxMWFQaTVqVU43MEtack0yczF0d1BpblpSOXov?=
 =?utf-8?B?OVJIYzVkNmF2L3pwVGtPNFB6OERiT1FBT1hSbXJ1Nnl2Y3NzT1o2Y2ROY0l4?=
 =?utf-8?B?NUZ4OFZjODBRL2MzTndFSmdzR09VczdTUnFUTHU1d3FxQzNsR0JPMnVsNGNo?=
 =?utf-8?B?OTNlL3NDdnFPQmo1U3pUM1NhK1FLdTNXQ1RXbEVuQXo2ektxYUVkcVBDWVhE?=
 =?utf-8?B?ekZOQk1rUDlOMEJpL1JhMUdReTBveHpNNXJ3T1pRclpJTXFLcG5hUzMyTGlJ?=
 =?utf-8?B?YjZxSTRhZXE5UTNhTE9GcVlwWmo2SGpCalVUQk9QeldCQXdibmFpaE9Ka0U3?=
 =?utf-8?B?Zjh1QjI4NjFVay9nWGF2bUttSVFiYm1XLzE4bTUxSERObkpwY0lHTi9CZHpt?=
 =?utf-8?B?bklHb1VOUUpUL3JBYTBFbzgvSHZwR3psRE9ITExNdjQvek1hQU4wY1RiZzd0?=
 =?utf-8?B?eUFZR0ZrKzNlQ2x3dTlEd2RQWkFFUE5ENnlOUGJqQ3QxL3BjbDFnS0hCN3ky?=
 =?utf-8?B?U2FjcDNwUloxdlBTc1VzMVl6VlNUanNOMVJ4eUJCUFlWUUZQcC8wSURHQnBx?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uEyPjcbPWNc/LK4GNCa11pRjgO/hf+PkK6Je9u14lik9SnIGUDrIEvRj/6hWCL3wAawv3GTZiEpuMUJTRgiIvvDnlKUOltOrqhjXvVVum1mzK7dUpw5XaMhNECQLixwGgaYoONTY8F5anu7G+bXh18sFc7Tvw4T2GosZPiDaNMtEND0TPn4ovWxuWC72kVEhL6CH/njt37WuJB6Mz/2C2in94At9ZmKmPn5rhw5bXJzrLgaz/2pCMVdLY9lZUA8jLNdkQY0h/FDVI0r4NWwI6y3POWxW2lfgUtssupXXEQSEau5MaTQIMlc2EqEhnbjV7U9dSr84VQDZAlnr4Ykbvxwt9UYNf7t4DURNKUqRrtxejkYs5ZV0Q1YZb6lc4rorKQaLp+oQ3qo8ukMEge9nGPeOr5MDXvP1+3XICVmuVjGxXFIkr+n+NiU0JvTiiKIpvc4fOkd+d9J2lIruCO+f04rzzLMyXygn34TpYTmTLO/rAFBzwTBVdakw7Xb4pxZJFgK5XIbAxVTYptFe+4672RcO75kMf2jPXMJkxn6Iv7fU/XfJ2ifaQcv36VTPy21lE8MhQBDRsTa+gmy6ifPqUjan6V8IPNSM0zFDVUbbHFXxkzxwFhKP46mXb9zsgn8j+H5yJ2MlavW3sZwFyPMagxUcIfAktGgpxRSIFQZVeqaoBBCsESeH3SS9m1m4lQw4S1VabeICOJk4j2LPPlYHhhrmeNH2B1ZOgfU2z6U8SubK2mXEoBOCjAiP3H2i9DSQfm0jJjhFDD+7e1l1B//elWW+XMo5pt/EorxEaEBC2DWtvUIO6+2XNvxInewtTRZntOHJ2c3umEKKACLU72pKVA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a873f5-4499-47e8-550b-08dbd60df3b5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 10:26:01.8658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLLNtvM4aeyxvyWqWcqzRUDPsWj8iV5M4g26iWnkm+qSCe1iGD/Iiuux9Icy/uGeeEmLhYz5fA86s1zMiHRjgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6587

On Thu, May 11, 2023 at 02:07:12PM +0200, Jan Beulich wrote:
> ... in order to also deny Dom0 access through the alias ports. Without
> this it is only giving the impression of denying access to PIT. Unlike
> for CMOS/RTC, do detection pretty early, to avoid disturbing normal
> operation later on (even if typically we won't use much of the PIT).
> 
> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> from the probed alias port won't have side effects (beyond such that PIT
> reads have anyway) in case it does not alias the PIT's.
> 
> At to the port 0x61 accesses: Unlike other accesses we do, this masks
> off the top four bits (in addition to the bottom two ones), following
> Intel chipset documentation saying that these (read-only) bits should
> only be written with zero.

As said in previous patches, I think this is likely too much risk for
little benefit.  I understand the desire to uniformly deny access to
any ports that allow interaction with devices in use by Xen (or not
allowed to be used by dom0), but there's certainly a risk in
configuring such devices in the way that we do by finding a register
that can be read and written to.

I think if anything this alias detection should have a command line
option in order to disable it.

Do you also have figures if the greatly increased amount of accesses
add a noticeable boot time regression?

We are usually cautious is not performing more accesses than strictly
required.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If Xen was running on top of another instance of itself (in HVM mode,
> not PVH, i.e. not as a shim), I'm afraid our vPIT logic would not allow
> the "Try to further make sure ..." check to pass in the Xen running on
> top: We don't respect the gate bit being clear when handling counter
> reads. (There are more unhandled [and unmentioned as being so] aspects
> of PIT behavior though, yet it's unclear in how far addressing at least
> some of them would be useful.)
> 
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -504,7 +504,11 @@ int __init dom0_setup_permissions(struct
>      }
>  
>      /* Interval Timer (PIT). */
> -    rc |= ioports_deny_access(d, 0x40, 0x43);
> +    for ( offs = 0, i = pit_alias_mask & -pit_alias_mask ?: 4;
> +          offs <= pit_alias_mask; offs += i )
> +        if ( !(offs & ~pit_alias_mask) )
> +            rc |= ioports_deny_access(d, 0x40 + offs, 0x43 + offs);
> +
>      /* PIT Channel 2 / PC Speaker Control. */
>      rc |= ioports_deny_access(d, 0x61, 0x61);
>  
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -53,6 +53,7 @@ extern unsigned long highmem_start;
>  #endif
>  
>  extern unsigned int pic_alias_mask;
> +extern unsigned int pit_alias_mask;
>  
>  extern int8_t opt_smt;
>  
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -425,6 +425,69 @@ static struct platform_timesource __init
>      .resume = resume_pit,
>  };
>  
> +unsigned int __initdata pit_alias_mask;
> +
> +static void __init probe_pit_alias(void)
> +{
> +    unsigned int mask = 0x1c;
> +    uint8_t val = 0;
> +
> +    /*
> +     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
> +     * count is loaded independent of counting being / becoming enabled.  Thus
> +     * we have a 16-bit value fully under our control, to write and then check
> +     * whether we can also read it back unaltered.
> +     */
> +
> +    /* Turn off speaker output and disable channel 2 counting. */
> +    outb(inb(0x61) & 0x0c, 0x61);
> +
> +    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
> +
> +    do {
> +        uint8_t val2;
> +        unsigned int offs;
> +
> +        outb(val, PIT_CH2);
> +        outb(val ^ 0xff, PIT_CH2);
> +
> +        /* Wait for the Null Count bit to clear. */
> +        do {
> +            /* Latch status. */
> +            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
> +
> +            /* Try to make sure we're actually having a PIT here. */
> +            val2 = inb(PIT_CH2);
> +            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
> +                return;
> +        } while ( val2 & (1 << 6) );

We should have some kind of timeout here, just in case...

> +
> +        /*
> +         * Try to further make sure we're actually having a PIT here.
> +         *
> +         * NB: Deliberately |, not ||, as we always want both reads.
> +         */
> +        val2 = inb(PIT_CH2);
> +        if ( (val2 ^ val) | (inb(PIT_CH2) ^ val ^ 0xff) )
> +            return;
> +
> +        for ( offs = mask & -mask; offs <= mask; offs <<= 1 )
> +        {
> +            if ( !(mask & offs) )
> +                continue;
> +            val2 = inb(PIT_CH2 + offs);
> +            if ( (val2 ^ val) | (inb(PIT_CH2 + offs) ^ val ^ 0xff) )
> +                mask &= ~offs;
> +        }
> +    } while ( mask && (val += 0x0b) );  /* Arbitrary uneven number. */
> +
> +    if ( mask )
> +    {
> +        dprintk(XENLOG_INFO, "PIT aliasing mask: %02x\n", mask);
> +        pit_alias_mask = mask;
> +    }

Is it fine to leave counting disabled for channel 2?

Shouldn't we restore the previous gate value?

Thanks, Roger.

