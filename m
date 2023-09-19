Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6794C7A664B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 16:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604796.942315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibVG-0006HA-H9; Tue, 19 Sep 2023 14:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604796.942315; Tue, 19 Sep 2023 14:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibVG-0006Dq-EQ; Tue, 19 Sep 2023 14:15:02 +0000
Received: by outflank-mailman (input) for mailman id 604796;
 Tue, 19 Sep 2023 14:15:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qibVE-0006Dk-Ne
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 14:15:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e812e8d5-56f6-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 16:14:56 +0200 (CEST)
Received: from mail-dm6nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 10:14:52 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO1PR03MB5907.namprd03.prod.outlook.com (2603:10b6:303:6e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:14:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:14:49 +0000
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
X-Inumbo-ID: e812e8d5-56f6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695132896;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YuMYEG+iGOkX2rKZ3el/4bqIgn/qMGCfyI2B/Y2bkx8=;
  b=bztqMSmuKdRcVCgOukSxCX5Qk6tSd4/YlFwuZ2Lbk0oe5z7dMicXTktf
   0t3OO/q6BYLla/frpj6yBpA/DzStiIkVLVAZkoOsQN2sLNRdskTM5Kc/m
   rNJjywCeCVwiCg7f4j1Zb8yh0/L7LGJ3W6es7SgTimnD/1aMZfJstL5SF
   4=;
X-CSE-ConnectionGUID: XAkISIv5Sc2jY7n/7Q+QWw==
X-CSE-MsgGUID: MVcuoZisS2Ca0i3GaY/miA==
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 121747094
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:WRBnOKJqYHkLxZ9RFE+RHpQlxSXFcZb7ZxGr2PjKsXjdYENShjICn
 2seXj+HOPffZDakKNx3Pdyx8BkFusSGmNRrQFRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wVvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HKGJvz
 t0GdQsGNBKy2OTxn4v4c9Zz05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj12bOQxXKnMG4UPJiG/eNtslyI/TY4AUUXDnSykL68i2frDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O+8n7ACAzILE7gDfAXILJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqC8p+EoDX0PjIaRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ikcQlr7AajMpO26Dl+1nC226ovsKREl9z4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz63t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:cIOgCqm0Tz59avng+QBcsWmRGsPpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3Api+4omvI8dWE1a4gtPDQD9le6IsVW37891bOfnS?=
 =?us-ascii?q?zU2RYF7vSFmbTwZx7xp8=3D?=
X-Talos-MUID: 9a23:HaqHmwqbd4UgMO4XcPsezxRcP9pv0aW1MxommM0H4OaNBGt1Oh7I2Q==
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="121747094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVUGFn+AEcudLtd/JTGNSeAYe0ktlI+NCZ4459DhShtFzjFXBdjiAuBJhEFifoka98/sIHXKsvusXAVS8IYkrxBus0aUv6TCCbZIGYemESauvgZfUHVm6qdHcWjyASUDPrUidyvdu9FJxgzan3ZWImjzR3cybd6XklhPRkJmhdnD3/1mRxGK3J+GR9sarYDSUkj/iWCjmfrjj9g5DPnkn4VVF2aVCxX0D5yb45NwvN+2bxw07MmPr4+tKWC+0KfVOI/PPY5QSK3ByxIOMXg62ngnRHMZEzHjPDohXpECwy4AEya5PuAOaHrdp9hWKwMr4YGQ9WRbGtG2Uck3FORF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ajS2uRO6wnVyggQd4OqE5WGtuU97nQyAI7MNbKCh70=;
 b=QVFY6uwEDSyTbYDrkK6CKhr6iRMtgktkwexw5jxz01tk09siYYnDwrB2nYut1WvqMWzzqc/bcLxUTgMsg5RjmsCRUhIo+q2BVrLnGsQ49EUDwq0cGc5+0LahGiywxG74Mk16JUbmYLPtZc/y8DnIjeK5x22vmINW39Jm9vKbXSS4imlc+ydkG5Hi19y4+C/B5nIz8MaudmPl9IZRLtmth8bRB36+Jx5oi/qW9CPYAKnawFEp1ajMf3K9YMcD/eSFJRI9gSQaTD6SrbwAVMGyxN++gCEQDF+EARrEe237cZrhV685p3ioqVgb5CfpW2UdZwipw+2lXzjzitURvfGXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ajS2uRO6wnVyggQd4OqE5WGtuU97nQyAI7MNbKCh70=;
 b=XqoyAI3WItsNqbgSNA8zNtrKmiQtsv0wt83bB5xfV/bmeljBWyc878/YmCgrzK2mNtBszG4c2YmJvNENWnNl/YvuGKBsiDJnfP6OWYjqpDOGMJ6UGPQLr2hyXXmWLXxRJtFWSAFvAQufNmW6D3N22u8lTwefWhhSt0gBrvoweYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 19 Sep 2023 16:14:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] console/serial: bump buffer from 16K to 128K
Message-ID: <ZQms01Wq62yMzGDg@MacBookPdeRoger>
References: <20230919125118.12657-1-roger.pau@citrix.com>
 <46b0b9e0-29b2-d526-d32f-d03415e621fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46b0b9e0-29b2-d526-d32f-d03415e621fb@suse.com>
X-ClientProxiedBy: LO4P123CA0587.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO1PR03MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3c7586-4c41-477c-5e41-08dbb91ac883
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dJen2QbhelGgBq877xzG+WbvKX/navGG3CES39ASeev33ZhT3Qqind+p26kN4w3wQMUCmfsdJi3hUC4XZhJGqfGQFi0FZsUIv4los/UltwNfdNHTXpVRA0kLCs9LD1M7adOfuIZ/L+66AZvq9dY/MxCG3NuPlk6vsh19EcvMG0f6y6KnNDPm5V8p7fRp0/M6LwAar+zYLZZwKpnsdS8PteseufJyHITy/Hytaupv0gZqiMlG/6meoCQXUudtNq1yG9o16xio9svoJf7KjCrA3THzxPpJswSS+a6CBHNpE6a9KDRgn/TpK90WpxRM52/c6Ywo3FMHZPzBouXKQDEs5KkBX/laB0VBijam4G0/seRh7h07QamimB7UI0Mhk+E/6q0TFsANVd1VGfkCwb43IRgCPVPXUy0ojfnNSQNtDSzrrSqFX9wdsk9+ye/vKkVYlp9CSFvIXc0qGPPe2tBaC3h5kKkr2JiDnTbbZDJD3vBiVFhXCTiAmpK5FrIupTrxqjs1Yj21XDBdXEXEzTZ+y/9K5kc9L4OORZI7BTn+mr1Z9Hi87UX0s5qhUNMCZ03r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199024)(186009)(1800799009)(316002)(4326008)(41300700001)(6916009)(5660300002)(9686003)(6506007)(6486002)(6666004)(6512007)(53546011)(2906002)(8676002)(8936002)(54906003)(66556008)(66476007)(66946007)(478600001)(86362001)(33716001)(83380400001)(26005)(85182001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGJJRVFGeXlTOHFqOCtTZm0zNkx2SVBIblNmZUZKOU5yOHlvQit5KzQwWkNp?=
 =?utf-8?B?dmV5Nmx2QjcyQ29CVnlnc2ttNTdmMEZCOGpSZUhGQks1OEhZak50ekd6QWF1?=
 =?utf-8?B?Q3I3ajdTeXZnSE5XUGZqK1Jvenp1OVhlWmQzZDlOa1J1TTlJTmgySmo3NUhj?=
 =?utf-8?B?cnNzMEhSd0hpUEZGY1NtQ0RUcUdyRWhNcjREcEE2YWE3cWNndXJ5KzhURFNG?=
 =?utf-8?B?L2xqQzJ6S3YzYWVWTkErdnk3dzVxOUYzblJqTzZIOERQekZPNTBaVkkwWmc1?=
 =?utf-8?B?SXpZUk1NbUcwQmF6ZVlrSFpaTjhxODZkbVcva0IwREhkbFZuYUE0eWxtSm5s?=
 =?utf-8?B?eU9iRWdwNHMweGFMdDRPOFJFL3pza0NFUy9JTlhuQkNjN283WGpPQmRRbGlM?=
 =?utf-8?B?UTdYdkVrV2p3THRJVWJaSHFpYk9Uc21NaGJKdzRreDhmVzFXZW5MSnpsR3Rj?=
 =?utf-8?B?MUY0ZkVFR2RXSW5Tc2x5NVF5OUpURmo2V0hNZFVjdW5qRXVuSXRGZCtNOXR3?=
 =?utf-8?B?SWNvK2g1MXB1Nm1lZXp0YVZXbjdzaDZTKzZsN3A4N2wzeVM3aHA4ZGdtQVI2?=
 =?utf-8?B?TnNlK0FhL3JGY0M4Q2NKL0xVcjZOYS9YU3ptRmdKR0hSdGtjUWtyRXJnNlla?=
 =?utf-8?B?YWZ1a2drcitNTFFHb0IzU1BpY2xYSDg0Zkc4cE5tTTNESFViZHpjcG1WeXZr?=
 =?utf-8?B?cDk1ZkFpbnJRUHRIMnd1LzZENlNjZEhwMWpTRWc4VDRuUlJCdDExbFh5Vkhu?=
 =?utf-8?B?Tno1NHpyaThsM2E4ZHcvYkZoL2d0RnJiL1B6eW1rSk5GZUxpMGRrMGt2eFJM?=
 =?utf-8?B?cjBhdEsrZWVNeFZ2ZnhtekF0YjJnajFIdlBrNFlGZHVEU2owUFFxV2xTdVpT?=
 =?utf-8?B?N2o2UTdCQUxLSjMyQmZZTitUNzBDNUs5UWtGZGtNREF4UEkxUXRMYm8zMEpn?=
 =?utf-8?B?ZUlFdVJaQThpQ2JHU2FGVU8wa2VWbStqV3FpRmYzUS9VTENKVlorS3E2Q3Er?=
 =?utf-8?B?VzZhK2hGSzNXYWFlMW5GbElQOFFKZ2RvM3Y1YjVsYW11YmRvUU1nQm5mRTVv?=
 =?utf-8?B?SUs3RkxxcUVUN2xDWDZyUmlRcUxxMG94R2FWU1RJYWNYK0tjaWM5R1JNd3p3?=
 =?utf-8?B?QXR4YVhUeHRRS1Z0a2VkeVV6a29BRWxPNE5UaVhrWXhZTEkwM1pvVjFGb2ls?=
 =?utf-8?B?S1hXazl0dENCQTRQOGVqK1dqczVkaXVUNlR2bDMrVVZ0dndhYmZzWUlHckRD?=
 =?utf-8?B?ZFNROHF4S05UMmdBQkcwWjZwN0tmWEdTRHdSNWEwLzFEdXpqcU1mbWpkN2th?=
 =?utf-8?B?alFhUlE4b25YTVpING5VL1Q2SXlnbVFjVnhFSEprdDFBUitKUmNXY0U3NVN1?=
 =?utf-8?B?VlF6UXdrQWsrNFBhYjI3WXkvSDc1QVhRdnJibHFKTVIwT3JJSGZMR292V2Nl?=
 =?utf-8?B?Y3MzS0pFNVAyK1pmdkJHSG91SkhHdkZlbWZZZzAxbHpseFlOdEZrUzkybUVw?=
 =?utf-8?B?Y0srb1d0bUlJY3pvSVl0N2MwSnJKdE00dmRxQXo5TktiK0lKb1ZsQjJQSFVv?=
 =?utf-8?B?ZzVGVDREYURqMGRCRUEvc0pmenlnYVUrUENrMVREVE5PZUJmTFZqb1ZKRGpr?=
 =?utf-8?B?U0ptVlB4b1M1V1VOeTBrYlg4bk1OaVl1UTF6TitjOWFqRVU3V0lySHp3dW9v?=
 =?utf-8?B?eU90WUpOY1BCQ0lzc1pha3JiN092aE1VeDdnYVZaTzBJK2l5ZGs1RU9rc2hD?=
 =?utf-8?B?c0NIQUM4S2d2bkVFdHd0NGw4K1AxdkNBWlBzRWlYRU14N0ZaOHl2cHZKWlpK?=
 =?utf-8?B?VkwxbXVTWVVjenByWDlqbVNXeXVJSEhmcDYyc1JKb1BHT09DMWkzUGtrb01p?=
 =?utf-8?B?R3dpakpiOWtuZkp4QUwxU1IxM3ZvUFh5WVhxNmdOQUErUXMzeXlMNEJQcThU?=
 =?utf-8?B?OVR2bkxiVEFDdElXUlJvQXBTZmVMK0VXY0pwS1MwZU9JQTVxQnlXUzhWd1Jh?=
 =?utf-8?B?SjlvNWVHSGEvN216SU9nTTZCclNBclh5ZHRZR0VJSGlNVE1YUHMvUEdoNkw0?=
 =?utf-8?B?RkRlbDhpdlNCdnl1bzN6Q0lKRjNnWW45MVQ4MU1hcGszZXVsd3FBUktEMWVh?=
 =?utf-8?B?b1pLZnZPT21mL0VFeTRjRWJBcnBPVkh5STdxaVpqYUpJaDArVDFUaGdsWTha?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	350zwEBw+zcSWzhALHYELxyu5JZrkqU55kmjeLlqvXF9UmdG+lH2d+2MLZSTOIgmPnK9crN8aqiNb9t399na102s42P5qbrmBSflnSfh7HQ73MviIUMBrO9kkh5npYylYoKowaNjwhXPyFZuykRDbvKNQIBc6n2ypcDOosKxV9NmK5Kkj4ocLcuHM7/A2eYGxKtZzwWkHb1EgMQRVKgPljDKx2aLF+NhchuRKX7qIViMSujTvMulSTMKpj+MGSvDeK1Ny9EuNk+NjieHx28x8gO3VHb1YeO7+yb8IuqEopVf6AangvcmMJ7QJRfXlc7Dcj2YavmGreMN3Ony3Q18wYz2ZEyHysyrwUCOkWqLavTKdmqN1OILypdXxHr0wP6ZcSryxYY/L/gVr5OFs78Efas6T+LRlctseKu/Sn/K8dmH6katcVzIJZviAky/v2xi1ZC+4f2qmw5zkeWMsnhF3Z8/U+ejCHXH90hBRRHeEPjMNgxm+wIG6PjiuZ/5fCIoixRZHjyEnBkw4yY3veRG+EAPsDTjJkjl5hEvRnPTSxUimZudbGV1mMX9dq7QPNESZmMr8DmqvuGuGb2EsLl5EL6/0jZU2jHmwmQVYCg1oEsZCDS8GTqXSMXZFp+n7i3/1HFLTFpGwImTpQxuuiYiF4epR1PxTNlbR09glT4WE38q1ZrwA/9dfLZbEjG1bthFxQP6a3Fw4rtkCuohkqkhwmy42i3WxKPB/rnIuv4o1SjMe4sXc1q7c6EChXa8fPQAdk1Hn9NR6TmhktaKSuZQqxn1yRwY8PNLBHfTqVY2UQs++YGI3zA1UlOCJoPubqr/FfhOcVcwoE3aCUzvdiilLKIcWvonMdRnAz2uTgfnJw4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3c7586-4c41-477c-5e41-08dbb91ac883
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:14:49.0772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrw796zXX0pIrYxMdBUMt92LicEbxQXmZsK3Gd81CSV50axXtYLxTC+LxDE7G+mllkNBvqbYB61sEEu/csza1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5907

On Tue, Sep 19, 2023 at 03:06:45PM +0200, Jan Beulich wrote:
> On 19.09.2023 14:51, Roger Pau Monne wrote:
> > Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
> > being filled halfway during dom0 boot, and thus a non-trivial chunk of
> > Linux boot messages are dropped.
> > 
> > Increasing the buffer to 128K does fix the issue and Linux boot
> > messages are no longer dropped.  There's no justification either on
> > why 16K was chosen, and hence bumping to 128K in order to cope with
> > current systems generating output faster does seem appropriate to have
> > a better user experience with the provided defaults.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > --
> > Changes since v2:
> >  - Bump to 128K.
> 
> Wow, I was hesitant about 32k, and now we're going all the way up to 128?
> Even the recent report indicated 24k would be fine there ...

24k would be rounded to 32k anyway.

I don't think 32k vs 128k makes that much difference, it's still an
infinitesimal part of the memory on any modern computer.  Simply the
risk of loosing output is IMO not worth us being conservative with
the amount here, specially if we are speaking about KiB, not even MiB.

Thanks, Roger.

