Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1B78EB2E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 12:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593781.926867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfN8-0000qo-7j; Thu, 31 Aug 2023 10:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593781.926867; Thu, 31 Aug 2023 10:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfN8-0000om-4F; Thu, 31 Aug 2023 10:57:58 +0000
Received: by outflank-mailman (input) for mailman id 593781;
 Thu, 31 Aug 2023 10:57:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e8Cw=EQ=citrix.com=prvs=600b2b7ad=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qbfN6-0000og-4R
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 10:57:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3af963d2-47ed-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 12:57:54 +0200 (CEST)
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2023 06:57:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB7066.namprd03.prod.outlook.com (2603:10b6:510:29c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 10:57:47 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::8a1b:5230:3575:dc68]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::8a1b:5230:3575:dc68%4]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 10:57:45 +0000
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
X-Inumbo-ID: 3af963d2-47ed-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693479474;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0PNWtVvz8yxKGZZ9aShit12k6O6XZB5jv1t22lwWlAE=;
  b=IF08B0+vNe4oUcVQMdlJRA1H8+vGljLSSln9+3OypRiFxTIm83VrVB5b
   fpY+5uYuMnqatI3O51aHPpSPHE8xYRhKIHrJW91iXbLH3fhoD412NCgAj
   yaKFgSYKi1c5vww3+GDIlxvAOCWy8+uA++178JzaGQZHts0e8eEDRkPed
   c=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 121260265
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lTxpE6sV4tb8cMhoKYWOlSyQUOfnVEVfMUV32f8akzHdYApBsoF/q
 tZmKWnXP6qPYWT0eY11Otu+9koD7cCEndU1HANl/iwwQn9D+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A+FziFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwDzJWPzGmjL2P+5WDStZ2h+olLJPFM9ZK0p1g5Wmx4fcOZ7nmG/+Pz/kBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osif6xabI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhAdhMTOfmq5aGhnWzyDEeNgcZZ2C0sKbmoGrvV45FA
 UYtr39GQa8asRbDosPGdz+SrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9dJ6G3rKdrDf3My5MK2YHPXUAVVFdv4Clp5wvhBXSSNolCLSyktD+BTD3x
 XaNsTQ6gLIQy8UM0s1X4Gz6vt5lnbCRJiZd2+kddjvNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:stopra39usbEzdYJk/As+gqjBGMkLtp133Aq2lEZdPWaSL3nqy
 nOpoVr6faaskdqZJhNo6H6BEDEewKlyXcX2/h2AV7BZniahILAFugLjOvfKn/balTDH4VmpN
 tdmsZFeaLN5JtB/KTHCcuDYrUdKRW8gcSVbBnlo0uFtjsBV0id1WlE4/ygeXGeuzMqOXPFLv
 WhDwN81l/QHkgqUg==
X-Talos-CUID: 9a23:zxM4T2HdLNrWt+y2qmJA9hVFO+UuLUTm60/QHFW5J2BpEpOaHAo=
X-Talos-MUID: 9a23:sAz6lwm2HLKNKR621T0gdnpCOppl3b6hOnsCgMpZke3VOXBqET2k2WE=
X-IronPort-AV: E=Sophos;i="6.02,216,1688443200"; 
   d="scan'208";a="121260265"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcFLor7J7i2oWozOWlN7s9Udym6pQT8xjFbZa5VruM+/5Ktvc+GMUkOdRVTNZPGy8bB5fn28JMaERZ2Dsn/7cnFrAC/kvtjyCpzTGzpgODhJoLT/nAjtHuhYR5yn9vFpxXtfxeXUSLYJkHo5f3LRrpyx0+RPo+HHDjqdllS9/Yh/f5n3xCqdaJwJzo625naOD27TivnT1UmKW8dytdHPIS1QbfzNhmNP6kxxNtB8ilkanpCf/OwjsQG9+l49jswTbrzGTAB5uvkv8AzGLjWsjwG4PI29YRgvQS4WOpQ1RN8sBEJ5bpW8H/k5wENIdZgEWijUk6RJ6hVxmR1xyZNm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ6pPdZ64dlIvdahzCXO0jXvLEbc7vLFlD6XfT5ebTk=;
 b=UBhj+AstSFxqtpRRGMtduq/cA+LqhLBlDmh/suw2NWGXQZX2rqLjP1tyROghP+PommQXHkUss7zGDa6PCWZwUN+FIJsXOo8COCKzLe/auLUca2dv2jlhilzv4nKSwwZ4SKDd1fEOjJv0v7DrZiw+QbJjE8hFV07cb7ovAPyipInsSRh4P27KqSknG7t24nNrtgZ3RD9ejSdFRhEWCLz2POHRrmPT3UimFKjgW7V7os0DnFMi4LoH2aauobQlebP0DTfffVJyusnE///WHU1Cy4A+jRLEOc/MxCdmhN6E47U7PCXrYiAhRkJLI52EMo8M55d9y0M+Idryh7NvXB+ZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ6pPdZ64dlIvdahzCXO0jXvLEbc7vLFlD6XfT5ebTk=;
 b=Zig3+9Z4U1ed/hpmuB3pETfkI+iCYdTI8xuiKh4x1yZC0MAALe0D2YCT2HXkhCJXef1W4MrpV4Z7w3Voiy/SpNVtsdUG7UhP5OVXeyJBMgXQ5SZkgbeKrBEujIUuQNtxRPkd8K2VZNbpg17Lx4PUB80/cNr8/IVchOdyS3vBg+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 31 Aug 2023 12:57:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/HVM: adjust hvm_interrupt_blocked()
Message-ID: <ZPByJJEoJOjV3CIY@MacBook-MacBook-Pro-de-Roger.local>
References: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
 <ZPBusqv7NGaJnOoT@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZPBusqv7NGaJnOoT@MacBook-MacBook-Pro-de-Roger.local>
X-ClientProxiedBy: LO4P123CA0569.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: f8afad65-d9e7-4acd-8c5b-08dbaa111b69
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yDJLoljQx4G023aiEyaqLqqzyEWpq5GbiHL9o4Z9bTZkLedC2zsFKiCKy0VjXeeZqBed0h1ZU7tZVynEq/nGf1QAWVEQoidBZt+6ovG6vnIfPfOd2dKUeHUGZrxpm6+jTqgV0fvb9QXSPq0lguJpgQXb7ZI7YtpKDNZWYDhi21FYNRUtdiSltkfqdJxf0r4w9ymcC9Fv8S2xfG614YD1p/RgGmVK/CIHUkZrSvC767I9fBG6BObtjOuJjstJQqpmgjh+oEWs2JINgRpTmaWucWdrdTWT2iPeKT61a6YJJRULR49zLp/V/gyLs+w9y8xAzf86U1fQus9zd4bWKe4S63FjoVWMEz43pQeK6A8SMOezL1bPuE7mSQDlSYVdBH3dcn/XqgtIC3cRG4VWRqTZt8aVCsaQrfxdKYpsWdz/Gb+XJFhwxXDlmJQyu6puqKpTAHSPR17pg3rAywayn64ZVSgH3J8xkfQsJp4ZEuCq5X7VF0vSLxw2tDlDX8KFl9t+SvKaDrheSvQlag4r6lfY4aSJQldMyUwGfbMgoJHniYLldia0pK/4gT4anz8WfRC6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199024)(1800799009)(186009)(4326008)(6486002)(6506007)(9686003)(6666004)(6512007)(41300700001)(478600001)(83380400001)(26005)(8676002)(54906003)(6916009)(66476007)(316002)(66946007)(66556008)(5660300002)(85182001)(38100700002)(107886003)(82960400001)(86362001)(2906002)(8936002)(66899024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEgxcUhVZHhQNFJVTVFhelZVUmZucWthN2QzbXZYNEZnTmMrRkV5UWxXWTEy?=
 =?utf-8?B?Y0l2OFlZMGVzemRDN2hUVjdLcHJBd1VQSlFHRmFZMlZSU0l0NUs2YVdrZzE4?=
 =?utf-8?B?T1dONi95MENReEZLTkhSY1E0WEl2RlhvUEtjYWNJdkNwTVAyMWs0RHNtUXJF?=
 =?utf-8?B?TjJDamFDVHRpZThoMTJINzRoTGRJMlZ5YUthYnl6d0dsV2NTalM1TnlvMzhK?=
 =?utf-8?B?NHlveitKQjcwUk5YZFVIZHVybG9CcnU4KzZFQVE4MGM5N2F6Tm1QQjRlT3Bm?=
 =?utf-8?B?cFVaKytxNXRNa0JTSU8xbTFBaStpWGJ3VDhhQmV0MS9UMnlVRytRczNqQm5h?=
 =?utf-8?B?VS9YN1ByZGd5ZlNsZmNpdzVlVVRzZnVRZmtaTVBwRXJYa2ltRit5ang5cjB5?=
 =?utf-8?B?cmxJeXlFQkRMd2ZWcVlTTmpPTnY2WHBVSW5oSXJMZ01TVzZ4ekNEVmpyMWZa?=
 =?utf-8?B?dVcvYnlOTXZsblRqYVVpd1ZMdnNVbm8xN2s0NEI5Nk9EU3B6cTNjdVpuMVdk?=
 =?utf-8?B?YklTb1dnd3lmYUEvWnFDeDFNTHE1SlphRUhIV2pObWtqZUhWQzRIbXVpSkdr?=
 =?utf-8?B?L0tBZEQ2SGZndjY0ZXJ6UFdMWEEzR1JrejhjNWROU2hDemRqbjJOZE5QUFZV?=
 =?utf-8?B?a1MycFRTa09XQ3lHMlluNzAvdmUwY0FVOGZMSGtBcTh0V1p2SGV3OVY5b2N6?=
 =?utf-8?B?K0NHNGw1TFZrczN4dHN0R3VERUhaLzRMZ2JYaUVTRlFHN29uN1JZU0JJU3h0?=
 =?utf-8?B?VW82dDFkT1p5VFdhOVF1OEdJKzdaL3o5Z1FjemZjSUVhR215ME1ONTlycWE0?=
 =?utf-8?B?anN5eTg1RGltano0ekp4TW1OdkJYK3Zac1doL04xSVV4NzZ5cXRDWkJPcTJn?=
 =?utf-8?B?d0hOUG90dFh6aVR2OUN1ek4xTlMvVmlUL2ZIM3FBNXV2bEpJQmpZSXkrYUJX?=
 =?utf-8?B?K1VHNUtxRnBsUHpLTHhaSEhOVmlTWE1yN04zNWlMZ0VQNXhEWnNEZTFiR0N0?=
 =?utf-8?B?OVVodFJnRVZ3cWNlcnNNR1UzYk5Ka09reko1bndJWjlHaWRoMWUySGVtR29T?=
 =?utf-8?B?UWs1eFhpZXZ2UzdyWWgwc2ZoNDhXbUZpTUc4S2tuaDlhZ1ROMHJtSjYxMXQ3?=
 =?utf-8?B?aHBKMFF3R2VxYUJJQmgwejRJeWp4OTduTFowbnhDVE1mRnZvUmFhK0QvVW5r?=
 =?utf-8?B?VmcyMVZnMnFKQTN3alU5L3FicUd2aE5hcGsxcERBZUN6MkVrWW5wa1NFcWV1?=
 =?utf-8?B?SGVLVzFPZFFKcDlTdTQ0Z25QOU1PWHFRZUlSRmZiRHp2N2JOR1FES0tCbmRr?=
 =?utf-8?B?SWQxL1RCY0VOb3RpOVFxcjJxZzJqWUNvR09kalRLRkV4WW9EOFZsOWFyVWcx?=
 =?utf-8?B?RnNFQjBOZVdFL0x5UTkzYTQ2ZFh2Qmhwektmd2llTjRsUmM4MzNRdm1pN1FI?=
 =?utf-8?B?RkJSVjQwTXp1VCtWSDd5YTY5TC9Gd3d6bkQyVEF3ejRvQW9FeGRXTW1iY1Zx?=
 =?utf-8?B?OXAzazBlY2U2bFlPdi9FUVhLc29pbDZoOExteVJnaDFaVmZuZnBwZElYV29D?=
 =?utf-8?B?YVE1aWRwRjBkNlNVVkxrZ2d6V1dNak9IRjF1TlhJcDlMYXE4eC9nbDc3ZVZj?=
 =?utf-8?B?SlN2d1R4N2ZpSTRxaExra3RaRXdmb0pZcHMrTHU3NlJkOVpoTTJid05UNk5E?=
 =?utf-8?B?WVpac05yczJybk5ZY3FNSkFRSmdFVzQwU2dGWE1HRUZPNWpOVGhjZVNPTm55?=
 =?utf-8?B?SStJTjNodXBpTFdZdzFRdjlraFNwZHRqcnRrUG5vbHJNNGFISGo1cUdZaW1T?=
 =?utf-8?B?RFVaSDZicU5uSmxkM01wNXlQcm9lT283NDhDWG51NlIwWTdoTlYzVjVORXNH?=
 =?utf-8?B?MXRPVkxVRUFnQVh3c24rMXpML1VRam1mL2wvS05pSlFWVHhDaFBHYTNHMVlN?=
 =?utf-8?B?WEtJS2hmNWpaK1NkNDVkMm9jVCtFMUJaa2JYVXFHODRlWGpwaWVXY2NYL0Jl?=
 =?utf-8?B?WjQ2N2hMTDVaWXpsaWRmbFRQdG9vbERQdTUxZ2YrbVlOWkpBWnpBZ1UrVEdi?=
 =?utf-8?B?L3lrbDQzS0VEY3JsaUEveWliYkdBUTRzbXp0ZWsxL1dHWGpybXljalJ5dFlP?=
 =?utf-8?B?QU8xbXZCbnREZDExOHdnenZzUlBNTURmYXYyT2lod203cUU4Z2ZqT2pYRmhY?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1UZ1LDL0MlnWeLB45ICI5ULLfDgx5+1Azu1i6Ua+9Wu8O9p9UCqoTf92I4K3grTrMSMXAtXKB+g3eJLgvSEsfOc8g43cAY+cX57KvYraw8lN+IHTssEOVq2vyy2XWTXYfYMbf5dIfHVlawJUb91CTTRe4YZZPGDiNM5ZXrdf0XT1fkE+ciYLWmzkKrctXc1LdE/wQousHFmW5774RAEa9EGj9nG2diPKT84yk0x96WHEVFZ5SE+PEUgi64NZZgddV4MEWLqUAhe8ftBJpK3ALHfkh8cf4m92WwchX1I/FOkt1I56HGbjSjnTCniK6Gbex2tLwRyWAYVeB8nQbM8obJ5xVS9GeCnYbBrV2jdQXgXLTEXtp/MfznLp4Qx+ShNhuVvkJOjeBMYlyAa3AD66GW8JHdPd+LBie267ZfnevD9ORORohMkP2FQieZAksGnEAkP00Adfv2XNw0XkUylR6om7iiFlUKLjkweJL5ClvVnzM+ksoAjF7AdElkWbpJ1y6L9iQj0Ui07FSAlA2RxOLnDqQS3sHY0OgR0NWNlzAPctreZgWZaW4DfsXNrJJr2ErTKM1sMxft82WGHthAfMF25GrLqa737tEgydgSCHxmxIGMnv6ibOOoSy42IkqCOHvSYLIMu8mRjMVw08eSRY2jwa7ZxGgolZZPkIG9Dvl2643IbcudwWTJHPMl3sLxyDXCEddZubllO+ceyaiatjua+C8CK7ltUDMq7mmOgw/tGe4+65VqH+0AdtgqLKjiEr33UwtvBjN+CFhA4pN8I266m3JSFaVcP5JlFSpcW5dA9HmoACJhoyWUh62H+TNjmQ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8afad65-d9e7-4acd-8c5b-08dbaa111b69
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 10:57:45.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29Q6YhehU21H9KBbclEQeO/OjXxcY5hUPPqh5LsnwC10Z8O1H0IxDyTgw5f0EebD+dhyACRcm+WlO6GT9S0kew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7066

On Thu, Aug 31, 2023 at 12:42:58PM +0200, Roger Pau Monné wrote:
> On Fri, Oct 12, 2018 at 09:58:46AM -0600, Jan Beulich wrote:
> > First of all, hvm_intsrc_mce was not considered here at all, yet nothing
> > blocks #MC (other than an already in-progress #MC, but dealing with this
> > is not the purpose of this patch).
> > 
> > Additionally STI-shadow only blocks maskable interrupts, but not NMI.
> 
> I've found the Table 25-3 on Intel SDM vol3 quite helpful:
> 
> "Execution of STI with RFLAGS.IF = 0 blocks maskable interrupts on the
> instruction boundary following its execution.1 Setting this bit
> indicates that this blocking is in effect."
> 
> And:
> 
> "Execution of a MOV to SS or a POP to SS blocks or suppresses certain
> debug exceptions as well as interrupts (maskable and nonmaskable) on
> the instruction boundary following its execution."
> 
> Might be worth adding to the commit message IMO.

So I've found a further footnote that contains:

"Nonmaskable interrupts and system-management interrupts may also be
inhibited on the instruction boundary following such an execution of
STI."

So we want to take the more restrictive implementation of STI-shadow,
and block #NMI there also.

Thanks, Roger.

