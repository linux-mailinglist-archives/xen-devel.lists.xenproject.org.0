Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F18756316
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564518.881990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNe4-0001SN-Kv; Mon, 17 Jul 2023 12:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564518.881990; Mon, 17 Jul 2023 12:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNe4-0001PB-Hf; Mon, 17 Jul 2023 12:48:08 +0000
Received: by outflank-mailman (input) for mailman id 564518;
 Mon, 17 Jul 2023 12:48:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLNe3-0001Oj-0G
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:48:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a5c6e98-24a0-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 14:48:04 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 08:48:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5567.namprd03.prod.outlook.com (2603:10b6:a03:28d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Mon, 17 Jul
 2023 12:47:55 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 12:47:55 +0000
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
X-Inumbo-ID: 2a5c6e98-24a0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689598084;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/1zRujvZB+xvZ7jM7A2XS7RXrolrp3u9+0+1/MrUd9E=;
  b=NItKFKx/1xgRMWKnAVHYK03vtt5Oq15SZKEeW6tQ+a7O4hdBfgHnh9Do
   kEf0OMNuNppLxiU1hu17uCtf0o25c1dyfQEgxqLqIU2tQtsOOZAAyBGzg
   A09eoqpI2hGnLv4EVYPswO0C8Hb8CPLiWi4WuKKTbj9znKbavxbRnQC6e
   E=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 116473852
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WQOb4qAjB+T7UBVW/9viw5YqxClBgxIJ4kV8jS/XYbTApGkqhjVWy
 mdJDGmCPaqPZzbwc9l1Oti29ktT68KGyoc2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxB4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwuedKDUQe7
 fgjETEGTxGyq9q65K+Xc7w57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+Oxuuze7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyzw2bSfwHmTtIQ6EuO46P16jFmv32lMIhsvf3yKqt7isxvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/v2ARR/vbvTTmiSnp+PrDa1PyVTJ2YGYSYeTA0t6cTsu4w1gVTESdMLOKG0h9vxBDr5h
 TSXtCEkhrMSpcQW2L62+1+BiDWpzrDSVRI87AjTWmOj7yt6aZSjaoju7kLUhcusN66cR1iF+
 X0bwc6X6blWCYnXzXTSBuIQALuu+vCJdiXGhkJiFIUg8DLr/GO/eYdX43d1I0IB3ts4RAIFq
 XT74Wt5jKK/9lPzBUOrS+pd0/gX8JU=
IronPort-HdrOrdr: A9a23:cSr54aokiHNiBdfQ5hk8oGoaV5oweYIsimQD101hICG9Ffbo9f
 xG/c5rtiMc5wx6ZJhNo7290ey7L080lqQU3WByB9iftWDd0QPCEGgI1+rfKlPbdxHDyg==
X-Talos-CUID: 9a23:QahvqWPpIsSc/e5DGyha+GtEAsQeS3zW7XbhD3e0LXtFcejA
X-Talos-MUID: 9a23:yoFUQAUz+1gJPo7q/DmyhC9hJMts372rV2oLqL8hisKjbhUlbg==
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="116473852"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f50m+bAsX4B+zQeKMSdBczgynViXKZDXKzFBK+1xGxltFc7JdUBBCnO4i0UaMM5JQ/AK0RJSduSKzV45hV2niDmaHU9BLflxVofrG2USxp9vQHhzb7YaRFuFo07W4b83BLmEmv0Fan8rnLqAwCPEEOJES6IdrVjIC695bnwwO8MQRX0+6phVom3GbhSAQYh5FuCLEXBdtBqG6flS/ras2RsS22zO/yVr2vml3C4OtNGQWXAyfNhACEsWRJHq2CqNPVIuSjeiDzmAXksO1I9bpj64P1RTCEOZPbZHGFhcl5pbEyuGwKypGcJXpKJhhi7I7TsDhtZIPPXLMC6bJrDPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozRtPdw8dBfKo/xT+r1wXFtk9WR06Jl6ff4YMjmpPnk=;
 b=EX5XAsYXbkQghTh0ftWfWqMKA230NAF5CMm0syfBRlFq+KAR0k2PNe67Wy9iHx61U2lp9PxHL2NEvVWnR2aodhyzqcV1PM1lDYIAsODEnMrxhxUnztE9aAsGJ0gL2b8/NUdDAsQDrD+w5+yfVjJxURH4HxC3VI6VSgDYwUSLx1wMYxfDb4dwLUUIayWmJURZo84tq/LBM2/MiTn3vpxnNckOE3Ow+8lEvfQeR1gG5Qedfj1wu2pZlAvfhWhHAD0lM7B3Fol3XeKYGwSguNHZ3OYDPwzDwqa0T4ZKa7EzWem5x8XzwYWtq7uZ7MRUunoJhdsVM49g1/cGj7GFVPo/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozRtPdw8dBfKo/xT+r1wXFtk9WR06Jl6ff4YMjmpPnk=;
 b=K46DQbJMbVZJLxqk2CwEVHyEah/xMR3XGJiWJ8J3e82ZlDeS5b1ZTxrRyKVnlJynSjxQUCui0uI7gpIqTuam9/YPjQR2qKDYZ5sz37PeXE6KanKRjft+g3+wH4okO36i3+VXICmuVDVTAk+b3poEYGH1ipZm+JmLLCio1fBMdS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 14:47:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/HVM: adjust pIRQ calculation in hvm_inject_msi()
Message-ID: <ZLU4deYP4lwVYpFs@MacBook-Air-de-Roger.local>
References: <5cfda162-07a3-8a02-4511-b0578b12dbc2@suse.com>
 <ZLUdTB_gZjRzhpJe@MacBook-Air-de-Roger.local>
 <f254729d-1b6c-8aaf-98d5-c1b739519081@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f254729d-1b6c-8aaf-98d5-c1b739519081@suse.com>
X-ClientProxiedBy: LO3P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: 01cb404d-0033-4a4e-701a-08db86c40aa3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDME9epreLVZ2RrM+DQAstG4kNYaOwFM+QyJbtfaN/AGnGC0AwdPfAuaEwXpnx4KOm0DPBQfIj5ZemXSVidVQxQfDJsjVUstempRbBTfUzDWlQIDh2Yt2C2uTx0YkYZR6xarrgtjb5AYqMi6zvb6hu8p7Z5eGbz/FGtBwhYaac+UOpNAM3lQcNe0hTtmaYlCub0ZRewtm+ab4l8x9Iy4MHyQfcuLAPADug57IoxGDpuvIjh4wquld4kS/Dx7/MnQPgiKrvcInTbGKDLISWP/3MUeIe3TieFT1mzcvFhzyps9eWOaGVzx/ketM+WeukNIZ9/uZZtu06KDIiMl9+p37opzOMDGbA7VrvS7G+EtFCVQe/MGCbbK9f55cW+aLvz0+x1SRRF3gwLL5a17975KMqmwdflis+gIQyMYyZFGbTax2wN/S1WMEf2orI4JEiRDXiKYF9LJqDKGT8sWEEyNX+InzT6K5a626L2nWW2hwdip/3GMH2Zz5nAgQM5COqG1JHrBgl2R9SVjwl93Mf1LhC4s5HFf9ACm4hceI4gQ7W+qua4TdqHn7qqAG9y8VOGn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(82960400001)(6666004)(478600001)(83380400001)(186003)(26005)(6506007)(53546011)(6512007)(9686003)(6916009)(8676002)(4326008)(41300700001)(2906002)(316002)(5660300002)(6486002)(86362001)(8936002)(54906003)(66946007)(85182001)(38100700002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW5qaFk5NnNuTmNJbWozYmd2UGJtTVJIci9kL0lTbEQwaS9oVHJMWCtjY1dT?=
 =?utf-8?B?U2RRT09sR0J6SitlZ3NGMkJKRVNxNG5rQjdBcFhTbGZDTHgvTWlvWHExdTJL?=
 =?utf-8?B?T0s0UkttR3JadXBjeGVuKzdtQ09nZkkrZVA5K0FhN2hIYnFVdTExU3d3UjI2?=
 =?utf-8?B?UjhwT1VsVnF4eXppOGd0V0FqMGwvSSs0MEYvK0xCaVlOM3hzck5VdUg3UlhH?=
 =?utf-8?B?bHcyVkhBeGhlSEFzVVRURTBHaGw3ZGxaQVVrRS90Qk04bFlmbS9JSCtzUnBD?=
 =?utf-8?B?SGI0MEljYWw5NmhYZHlsYWliZEg0TTJESmlSQnBZNU14Tkd4eUJhelU5RGl1?=
 =?utf-8?B?bUx0Y2lUVkg3VGdoZjdadWYvUHIxcjBJWE5qMnFQQ1k0aWxOL1p6Q1pJMFlV?=
 =?utf-8?B?VmxnR2ZuNnZoNXhQTU1GREVLTjJxb1g3RDROb2pZZmRqNk9nbG8zRnAyZ1Jx?=
 =?utf-8?B?Z0t0UkVjU1Nhb1VkL01BRHlXdXN0cjhvMnVDcXdPZ2k3Y0ZYTnI5WDBReFIv?=
 =?utf-8?B?Q1RteTN3b2Z2UVFJZUFiY0g5UktNS3lFTS9kcGQ2QVN0WVl1VmFYVDZjQ1hX?=
 =?utf-8?B?YUowSGtwYXpNV25vbEFZZ29qQ2tQRzBTS3VQbkRIMThNTCtqZWZuY0RHQkZS?=
 =?utf-8?B?ZllJOVdOeUl0U1RZRy9ISVNSQVloOXpxdG1oWTFYWEVYZENoZHJ0QzgxYnFh?=
 =?utf-8?B?c21kLy9hZmRZTFhpU1FHMG51OEhFMEozYTFzVzdNVkVlaVltOVNqVWRJeWYr?=
 =?utf-8?B?WHVUQ1R3dENxZ2RlODVLR09LNVY4N3duVWxQUzZtc3E2NTcxNENCK1hKZXFh?=
 =?utf-8?B?NWZvUENxWVNrZmNMY1dnSEltZzU2TDV5MzJ4aUV4ZHkrRXN3QUdwVExGQVd1?=
 =?utf-8?B?TkIrQ3NCcXFMVHQ0SHJXRVRGTWFvT3h6SmZtamdlcnJyM0RkaWJ2VzZEWWxU?=
 =?utf-8?B?ZWQyVkFLZFducGgzOGc4NkYrVnpKR1h4ZUYyQ3NGM2trS2RSazhEK2srOTVz?=
 =?utf-8?B?ajZMMzVRSTdvOUc1OXBsUHNUWEZCbG44bG5BelB6R05zRlZLanZBZXUwWWJj?=
 =?utf-8?B?c20ydzFOazVCZFp1VjNxb0xhOEswUWZLQ1lTVm9PcjJWdlAvdFJkeG4yWjFK?=
 =?utf-8?B?WWswUjRYWmlYb0tVMktqSUhMUE91eVhqMEhJRmRWOUZNQnVWOGMzWDljOUJE?=
 =?utf-8?B?anlqVnlpV1Y5MEdKcEVRMS9HZmZLZEJxUVh2UGhIRkJ1NElpMDdkNzB0Zm0x?=
 =?utf-8?B?Z0pGcktlQ3Y2bW1uMWhGdWQ0WlE1bm4wSGY4S1VRVkJ4TVcySWRhWVhySmdv?=
 =?utf-8?B?VjdzRUtQZlVFdGM4ZTI4enU0QldKVXRMbjlLa2h6MWczeFRhUWQyQkx0TWtB?=
 =?utf-8?B?b3JaeEo0bUdIRGlubFdiNVJPZGF2L1hXV08zUHBaRU5lSlZjNmpuRTBGRE1H?=
 =?utf-8?B?dmE1Q1R2b3FoZ21qaXYxOTljaWpzRmVMK0hHbU40Tm9JK01wMyswS1JtSDRR?=
 =?utf-8?B?UllXa2tmcWduVHFjMnJveDlxOGVORi95OU15K2NqNmVuRlZhei9jM1NmTFlW?=
 =?utf-8?B?VkgxaE9jaktaU3VqTzBGSVUyWDlsaFRuUmx6NFNlVkxwRE5JQ21rak55RXAv?=
 =?utf-8?B?NndGWk9DL08xQTZOdnBxYU9Id0tEclhzc1h3ZVJkeTJFMEdjaUppSW1XOTd2?=
 =?utf-8?B?WWxPZm53UjN2UVZBSWdndW1IeEtJK3lJMXFuNXdJNWxuQ2xSenhHU29GYmF2?=
 =?utf-8?B?Zm9hTDN6eDNRalZ5Vy9neFByNWlRSmdZYlhaRFpxRTBiem82Q2twbnhOWXF1?=
 =?utf-8?B?d3Zhb28yYkpKblR2a2h1cUNuMXhnR3dqbEwybXIxTHYyMEZ6elpucmJLcnVM?=
 =?utf-8?B?bUloWS9qZUJZdVN0enAwbWlzVStsYjA2czZrVEFEQ21zOC9XejhwUHgwUGow?=
 =?utf-8?B?bjIxMy9oeVR6eW1lbCtJcGRPbnFMTnljdm9EZGtZbThKRXZvMmgvQmc1UGYy?=
 =?utf-8?B?T0hPMzBodCtPK3cvbGpnNWc0eWpsTzVyWGR4V2dnckxSRHlPaG1EYnJNNTNF?=
 =?utf-8?B?YnhVNmJUN1A2NFJBK2FaNkxxN2FrbGMxN3QyYVlvNVBPZ3hIc2RhR21UTGlD?=
 =?utf-8?B?MmdXMFB2UXNPbERBOVRpKzJMaXNLLzNhQVJpN05rZXFzNFVoR0RQSHlzNEtR?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/UzGF1UW6O25KffWY3R342PQCWBiytSp0beFp4zSxMWUDsYxnVYTp3Fk3iUhpFRA1aA/b0TsKeT9yyyBKPv51yg9stZaG3KhvyqvnYbapIyHFhtHCIqLacTWffpZWtLqurFQM47S/cSrKe8WgOcavDvhzkhS5VeGDv1O6apGdpfbKTvc40cXcuuB6b1IY4E7GmwvhirgU2LZ3/vAyjcwZbkcQYZJ6WyYy9nUPxgIfV4aYasnsFeFrkgwF3RixB6usJSgC1bBV3tyhVkbHgCoZYzug/V+LAkuJ16kUXm5AXiDYroHV6WQw8x5XuEJeeCPIUwZ0+jGWA3+xtwqNqUz0t5hoYHbPTvvEJ+VyQOGdOn2J1qT92kUA1fu9+iIbiT3ztz5T+oOS5Oj/FiymlXLi23XiK++qR0PtemgwRDUU8EAcJW6eUD2EJNLVdV79j4zluQxseiv2eCp9gm3LU/duXcrePHMzXg8lhiUSehtZIzQRhMX30dh89BIZffpYrNvppPXXvR4ruiwXP8HzJNWcK66YIPODz2ZXlpcnurpzZohPfnJuwMBVhg8qCmGX6nvZIF7VwWJHZJEsVWiuacc4q4lCoDNzTTuYVdCGMup5Pp9cXMfsf5szc9FP5mJ7nmybyHiXY7UiV/81Q6uRw4h9Q8vygAT7MD37eeHfJ0kb9co/Uqx/GakVgBlqkJcSO3VARMag8JQawoByzfu3nsxYr2o0nKx2kWR/ahFS/kQq7KeaH0hNXfn//QjHCrxb36lQnIZh7UMz6J7O7ZN9YOM/Kp1sPskbmTED+Ucdc6F/7U61BY0XODwYTDDh4UDyy89pZISdurHAqLIllrb7EtFJaNCyHm8rxsWl5E5UwYmZQySr8mT1OiEC8w4fwLNily9
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cb404d-0033-4a4e-701a-08db86c40aa3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 12:47:55.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uLZ7udzsJ0enZ/384Bg7akCQl4ylerR0dwfZELGRyL7XJgxXn49+xRsb379BbxO3aNNPAxECM4cgZSG6PidXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5567

On Mon, Jul 17, 2023 at 01:49:43PM +0200, Jan Beulich wrote:
> On 17.07.2023 12:51, Roger Pau Monné wrote:
> > On Mon, Jul 17, 2023 at 11:31:57AM +0200, Jan Beulich wrote:
> >> While the referenced commit came without any update to the public header
> >> (which doesn't clarify how the upper address bits are used), the
> >> intention looks to have been that bits 12..19 and 40..63 form the pIRQ.
> >> Negative values simply make no sense, and pirq_info() also generally
> >> wants invoking with an unsigned (and not just positive) value.
> >>
> >> Since the line was pointed out by Eclair, address Misra rule 7.2 at the
> >> same time, by adding the missing U suffix.
> >>
> >> Fixes: 88fccdd11ca0 ("xen: event channel remapping for emulated MSIs")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > I have a question below, but not related to the change here.
> > 
> >>
> >> --- a/xen/arch/x86/hvm/irq.c
> >> +++ b/xen/arch/x86/hvm/irq.c
> >> @@ -383,7 +383,7 @@ int hvm_inject_msi(struct domain *d, uin
> >>  
> >>      if ( !vector )
> >>      {
> >> -        int pirq = ((addr >> 32) & 0xffffff00) | dest;
> >> +        unsigned int pirq = ((addr >> 32) & 0xffffff00U) | dest;
> >>  
> >>          if ( pirq > 0 )
> > 
> > I do wonder whether this check is also accurate, as pIRQ 0 could be a
> > valid value.  Should it instead use INVALID_PIRQ?
> 
> I think 0 is okay to use here, as the low IRQs (at least the 16 ISA
> ones) are all 1:1 mapped to their "machine" (i.e. Xen's) IRQ numbers.
> And IRQ0 is always the timer, never given to guests (not even to
> Dom0).

I'm kind of confused by this not being dom0, but rather an
HVM guest, so pIRQ 0 of that HVM guest should be available to the
guest itself?

IOW: the possible values here should be the full pIRQ range, as there
are never Xen owned pIRQs in the context of an HVM guest.  One further
limitation is that even in that case pIRQs for (guest) GSIs would
still be identity mapped, so GSI 0 won't be a suitable pIRQ for an MSI
source.

The usage of pIRQs here even for emulated devices makes me very
confused.

Thanks, Roger.

