Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE179E129
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 09:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601009.936897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKdn-0004cC-3t; Wed, 13 Sep 2023 07:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601009.936897; Wed, 13 Sep 2023 07:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKdn-0004Zl-0X; Wed, 13 Sep 2023 07:50:27 +0000
Received: by outflank-mailman (input) for mailman id 601009;
 Wed, 13 Sep 2023 07:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rq8V=E5=citrix.com=prvs=6130a4f39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgKdk-0004ZM-PZ
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 07:50:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f90212e-520a-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 09:50:22 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2023 03:50:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SN7PR03MB7087.namprd03.prod.outlook.com (2603:10b6:806:357::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 07:50:15 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 07:50:14 +0000
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
X-Inumbo-ID: 2f90212e-520a-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694591422;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wiieqJ/IpmeEnV03xzM3Gaq7Nz4pT6Dno6dQmqHGTpY=;
  b=ZsBK2FY1z7FIXEGLnszmpK/aeUgmoWOwGkoC3aA/IwM6jIDM0MQDbWXP
   Z1UfrOksXmI2WbdnJzlavIXvaUY03TkN8ze58IpsGeu/hC648+tXFi9ea
   NeEa/z1qcaiO2VCACLsfPFsCJuLzGIlIS7pnHgt03tZVWs85MucVlFnY4
   E=;
X-CSE-ConnectionGUID: 3sLjJ/1sRcmj06WMy42Now==
X-CSE-MsgGUID: Zq4fNGcaTj2w8Z/HDT3DeQ==
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 122901703
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:yWvCvKw8CLkt42BDpzZ6t+fGxyrEfRIJ4+MujC+fZmUNrF6WrkVTy
 GcYWz2GOayNZDHxfdFyaIu38U1Tu5TVz9dmHgVv+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRvPKsT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTpV0
 f46b2kWVBuGhbro/5eqFrNKgdt2eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFcZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LWexXqkANl6+LuQxOc2jnu8zWUvCkcJBWn8gdWF0WKzYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxRupPiwYK2IqYjcJSwEe75/kuo5bphfGVNNqCqO2ptzzBzDrw
 jqOoTQ+hrMclsoC3eOw+lWvqz6ho5nhTwgr5x7WVGao8gN4YoG+Y4Wir1Pc6J59wJ2xS1CAu
 D0BhJKY5eVXV5WVznTRG6MKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCNMebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:2WCHsq4VNfHaGGHVpgPXwD7XdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsyMc7Qx6ZJhOo7+90cW7L080sKQFg7X5Xo3SOzUO2lHYT72KhLGKq1Hd8m/Fh4tgPM
 9bGJSWY+eAaWSS4/ya3OG5eexQv+Vu8sqT9JnjJ6EGd3AaV0lihT0JejpyCidNNXB77QJSLu
 vg2iJAzQDQAUg/X4CAKVQuefPMnNHPnIKOW297O/Z2gDP+9g9B8dTBYmKl4is=
X-Talos-CUID: =?us-ascii?q?9a23=3AFHVNCmvL7ERy1kkh4fCh+qkT6It+aVnf7jCJOHW?=
 =?us-ascii?q?zDGQxFoKwWAPK3qR7xp8=3D?=
X-Talos-MUID: 9a23:5i6zJgQjSu3q+4l9RXTenW1sEuhj6pisUl9do9Iml/XfGSFJbmI=
X-IronPort-AV: E=Sophos;i="6.02,142,1688443200"; 
   d="scan'208";a="122901703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWeKi/mbdx7MkGxxxPP5aWgpOFJ424mnUpaQMLyCgmGHsw6756V7iMoUx2imJoGHUkVsb535m526gSOk0XS1MIzZmXj2UWz8y2Yn4oo2ko9TPr5rqrFnkUzF5LH2ssLl+rVIchqGryUr/8S4CsJUgYt8wYSIkdPwM8Qao17JMIjkaYNuRYyeCAu4yU+ckOw+rYi06xefPdJW/evHm50rYGBZVgMLfrcqMDbOCchfokV7mKNsy28gWvkIA3czzbf6REHUloM4Sqw0V91ckx5vCQ6roVumlWY2Ec0oGq5l+JHi4gid2/jFu8C+h15uDhj70XSN6q6fFIYpWwJ4B3T8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaYP/gNg41s9v+sQwz5n6E4SqlW9NJMpl2eVkkx0cM4=;
 b=bz46ga0wrl/UgzJgVSPrk0wIIrrIx3qhEXNsqHobnWQNgLit7ytE14Ko5/IhPwi48V9fgHDRyJGXVpGLHzSf2FlSvQLbMpNU0AvbbAPvenEQRhImTybyQoPR/XmGH2K+ZYuhkBGdHnPeoJ/Ft6KST+ROMAi0gG1huSYGcpETjrZ/3g3uSVz3U1Q+eH5luFgcGUD79wTUxL31Jp6dpAiKxhEgZK/D1RvyDXWP1hNXQNA5iL5nj9TA73wyrPMhxtcv5Gsi4j6SXcULpGrcnFMupcv6xDFyK7ruseCLd0qijDXpNRAM14v+Pou3MsQYVjsfe6bLtCwVpGrwDKcK4TciSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaYP/gNg41s9v+sQwz5n6E4SqlW9NJMpl2eVkkx0cM4=;
 b=IAx5hSUT8cmFANXfC6LzV0drpJzH8G2Un4O4CLHfVZr5hl6agFwPfJq1gl/ZcZWYhWz57/tj0GlCbo4+Co6+dgZyygN19w2mGyNqxXmjyKXTSegspGLpHwcNTWUMoSFZimrZQU+KkKBhVrJT5yJGhhj/7eumu+h67OjgThO5aII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 Sep 2023 09:50:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, solene@openbsd.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Message-ID: <ZQFpr5nIZtRLPNhp@MacBook-MacBook-Pro-de-Roger.local>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
X-ClientProxiedBy: PR1P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SN7PR03MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c41baf8-883a-4015-95a3-08dbb42e109f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oQIuqtVNU1Kpb+QW+txI5LEeP0rNrnEvnqsT5WoBQgOuFjg9Goz9yX9xJ07IDdnWX33tWMeKFA4XSl389PPiObgPAcJhVVlnLhtcoe1oop120jb82Vt35lxR8dKYOLc4ThcVVyb69XLtiXKc7c1F1VBnJNOqGYbEY1LGfsnPEe+pmyoYiSeLBQ532Oj/l3wVMBFb4Va3k8A/vdjVF7K8jtJWsjjG4wyAc5B+EWNa11wmneZo76zhaTclAUUwRxSL58gRXhvcjMMiLk5hLd92OAtMhXdQUO//OY+EOPp5KJuNDnucABaUKwlXrQBI9oOTbTvn260xY8DErCdU5JIOvO4l3O9anPG57C7rpiFskNrp9tWVurqZjws7M05LtvQu8Ef1SHLjDX2OoSicVhKRAJnXe/5aExNlLJYJMm1ltwPvLdDYBmLK9YsVc5VUZThrgC+NgATJfj2Yxl+ryCAuxOV/kN+pAhQ+Za5Ri1+69zjdLyOL7k6j0Tdngo6MEGGuSMnG8pChDKqt7IBZCdSEbVoSRds5LDXrHuvWyH9nv+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199024)(186009)(1800799009)(82960400001)(6506007)(9686003)(53546011)(6486002)(6666004)(966005)(83380400001)(66946007)(478600001)(6512007)(66574015)(41300700001)(26005)(66556008)(2906002)(54906003)(66476007)(8936002)(6862004)(316002)(5660300002)(6636002)(8676002)(85182001)(86362001)(4326008)(38100700002)(66899024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VLaU5nNSs2UnBxZ3lqMER1UkpMWmNnRkptVjY4ZmdZYnVOc0J2eElHUWll?=
 =?utf-8?B?MVVxZFVJQWQ1eEpPUE8zY2IvcExQN3A5WExGZEprOUxLemROaVNvcTVFMEIz?=
 =?utf-8?B?Rnk1bmlGYVBzUkZlblBjYjExQ3VsNE9lSjBDRk5IemVnNzlNRy9pTERTY2Zi?=
 =?utf-8?B?STduS1JHaHBHN1FQdUJuWGlacmN4dFJCcW91VWtvYlFuRDZuRjdNTjc5MU9u?=
 =?utf-8?B?OGV5cFhLNStsUUdIVVlXVXN4T3JrRTNML0paRmZTZGo1S1MxTDFtSEQ2eFQw?=
 =?utf-8?B?R3daa2xhZmZ0eDlsV09xaG9KaUhZTEJnSXZOMlg3U015emxsaHZNdWlnRnRS?=
 =?utf-8?B?ZmU4V0IrL0JzbGIwQTdCK2I5T3d4dTFIL0orMEEvakxqTWl0U2gzbTJsdVhz?=
 =?utf-8?B?cHJrWDNpelFmSDEybjFSZzRqRlRvTDFnNExyUzVjK05JZmxwUlZOMno2ZlUv?=
 =?utf-8?B?dTFqZXRlbUN6SW85Y2djTnZpZVI5Z0RyNUJKUG8wNXZLK2NibVNLTnA3Nmhn?=
 =?utf-8?B?R3Jvcnk3bGJzZmNhRDNWd0dZTTV5ZW0rY0l4b3lqQmJsUk91Z1hydUpVWTFy?=
 =?utf-8?B?TmoySS9OTVUxWis5TTZjcFhiUEhEOGVKVzV1UUorZW1acXFEVTFSOVNlejZY?=
 =?utf-8?B?WGMwdGJ6djdqRWRYNlN6Yzl6L1E3MUJHQU5XOWZtME9LZENpc2gyeU1aR0J0?=
 =?utf-8?B?VG1yQkVHNWx5QWNENVgwRGplM0djL20xZ3FQaldNLzJ4SU1zSnU1TlVRVCtV?=
 =?utf-8?B?QWRaTjJKMHh1aWlCSHM4blBnTUxOSFkvOUFIbjVPeWZCRUpHT1NCK09YV3ZM?=
 =?utf-8?B?RHJzcXpZaXBSbzhpWE9McXIvd0ZjNFBsYU1BcEkybVhZSTI5VnB3TUNSaXBa?=
 =?utf-8?B?Sk5WZWlic1VzYXgxSUxsdnpKNDBuQTM2cjRBbkJiSGxQREVSUTN2Qk8wY0FW?=
 =?utf-8?B?dGxudWpXdEtzMGlSZXBXeklzRXNlNFlIY1l1Sk9vOFhJMlpybmhiV1VrNlVG?=
 =?utf-8?B?WG82dk8yamlsM0ZXcmExcUh4ZDg3WFBiamhsWjV3V0ZLaWF6RHNsRkY5Y1ZW?=
 =?utf-8?B?M3JGUVVUZHdzUnFaNEROeGZMSFJ5MkxHUitqOHYxNGk5bkl6RTIyRkwwdzJU?=
 =?utf-8?B?QUtXbk9kL21ZZVFyaXUyc2VtWWgvZ2N6TEpDeitrTkRTaXRjQW9TbWF1dWt1?=
 =?utf-8?B?RVdDMU5sMlpBMHVQMXVpM3d6eXRuR3BlVlB1SGhuQ2VUZkFScmZ3VGllQ1Ra?=
 =?utf-8?B?SjkrVGN5STdiVVdhdzhCOUdYQmtJTTIyclBTV2d6SDdodUtKeWF0dlNOT0hJ?=
 =?utf-8?B?NkpBLy9sOHhPMHZXOXNJT0FxYUJ6ZFJpWXVhdHlnUDROOThvYnl3NWkwbjY4?=
 =?utf-8?B?Uk5XMDhtYzZtV1pXa0dEVWQvVk1iMXI0VFJjVWxjTWt1RDFZa25DUDZIYmVL?=
 =?utf-8?B?eThrQ0VjZEV1cHlCT0JGUkwrTUVVS1NUWm4rVG1HbVZBQVRwOVhqdVk0bUU4?=
 =?utf-8?B?Q1Z4Z3FnM3NSSC9pWis4RUM2K0o4SHArcVZKcEs3ZytRYUtBeUNYQzF3TEFH?=
 =?utf-8?B?NWdkOXZhdUNtQ2VHNEoxUmxlK09OK1hFMXRCSituZi9TVUtqekFWWHIzclRq?=
 =?utf-8?B?Vnpqb1BoOU02bHVHQ213VVVPcXBrdkUyTHA4ZUhlVjVJZVRuTVg5Z0x4ZExO?=
 =?utf-8?B?d2Y3dHk2eVBCQmx6REYwTWFKOXpBRU9YNmpkdjNvRE0yQWMxeEc2YjJmQlNr?=
 =?utf-8?B?VVU0WGFXbjBRVXFUNytpaHN3ZlI0Z2V4RlZrNllKamh0allmenR6WERnckN5?=
 =?utf-8?B?Ym8wMnNDdjROV0FnOGw3MDNKaUphRFZxRkJJQWtqOVJ6bUpmT29UYVFVNzNt?=
 =?utf-8?B?cEo2dGJ1c05XNUk5N0dJb1U5blpvSWZQL2FBUC91OUd4YTlzOXpyU1RFakZ0?=
 =?utf-8?B?NDhHTm1mQUxzMmhlMDkydDdJQ3pPKzMvS1llRzJqTmxrWkl2TTNueW00Qkdt?=
 =?utf-8?B?dHViWmEvOUxIRFBoNUhIZHRnaXU5N01wSmdVRTNGTVVyZUNodGEvcXZDV04x?=
 =?utf-8?B?NUZTdjE3TWFTYkhhM1E0SmhmKzFmMUduY1VtcnNPK1N0MHV4cEt6SU93UVRU?=
 =?utf-8?Q?BtWmmTsYr7qTQzzzc9jn2JftJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bUZBAg1dE0qrLmLru+9ACW0mvIMzWRfdHF6Ra25xPnPhJBbM2+oBDqVtSEA30nw86SoX9Na+WDVyAEuwnavUlEYdapAQqr5ajIyuRjXHmQUnpHbWqQwK1kJhuvbLQgf0AYZ6KDLOJOwXMFyESk2S+8VVw7Cv/D0YfavV93HlvADzN5vQhZpYmoL8WLP3vEh8i9opLlyYz0HFFlG5Tesw6mi/fNGtnUd4KNDfCKPVRyUpiiUUsKud2Uy7fWgqmX0p42d3aC9xD1D9wbAFTqp1IBcr7Cyb8xBWPLLv6rKaQv9eK4Fv+p7LGFIR5nDaeNqKkWszqJHtle1J3KhCo+JbFvT9/RI3UVbTA10CronYlVJAVWZJ9EcSKa5L9xyz4H/Ci7OFuyud85dTQO3HdQdMEqM6lEEwnVN75kZ1BhNAq/ubRhbjfpGnkx91G73ZL/H/ga0XII+FrkU0JJVgl2kAWR9Ltelr5UJRLJRAT//yNm2kcdtXgyU1G/6oC3TKSIjIgIAmWanPmEcbwkMnvu+JDu/Dlv7zA/Iopp5XBt6vwQsSzmiyEPbHoVJ4A+t+bVBKHyuO1AIutDO3FvuFH7NXsYNbZ7JFObclZ+7CRXh0engV8rBUNQJ/mu6CZVMKfPyORMq53GLFyT9ClhKDuNO7hhFmJhV0FsYZbulhgyUh1x4sP8FGYQs1/Ciz1xTB0Mr6iaLSHzCmoOSRi7OObU5k0yzof3/ZFqCJ9tAFZOZ5SCJzfunoZTXE9k47O10xfu5GLG3F6hbY4yHUPBh7Tme69Dcx7jkGEfnFW3aSvLXh9dGzsLtzPf/esbdFEO7MyH4le9cfPgAg24fnxLJeJ616tinUb5Fww0biGWMAwhwsWn/Zobf78zKznSpNnPhcctFdFprC403HpG+Y6smwpE4liBbz6L833AFYWVofcUl6CrM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c41baf8-883a-4015-95a3-08dbb42e109f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 07:50:14.6473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gTVg+FimNv1AVfanDBZ2+3XfzyuYh76WtoSE2uLSSb+wYN08ivzTnw1Fl6cFdxxa19Ot3zsPtD2CeQi7+GrNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7087

On Tue, Sep 12, 2023 at 05:35:15PM +0100, Andrew Cooper wrote:
> On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
> > OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
> > set, and will also attempt to unconditionally access HWCR if the TSC is
> > reported as Invariant.
> >
> > The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
> > (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
> > a suitable solution.
> >
> > In order to fix expose an empty HWCR.
> 
> At first I was thinking a straight up revert, but AMD's CPUID Faulting
> is an architectural bit in here so it's worth keeping the register around.

A straight up revert won't work, because (as you notice below)
HWCR is architectural, so accesses must not fault.

> >
> > Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Not sure whether we want to expose something when is_cpufreq_controller() is
> > true, seeing as there's a special wrmsr handler for the same MSR in that case.
> > Likely should be done for PV only, but also likely quite bogus.
> >
> > Missing reported by as the issue came from the QubesOS tracker.
> 
> Well - we can at least have a:
> 
> Link: https://github.com/QubesOS/qubes-issues/issues/8502

Sure.

> in the commit message, and it's probably worth asking Solène / Marek
> (both CC'd) if they want a Reported-by tag.

I'm happy to add a Reported-by tag, just didn't have an email to use.

> > ---
> >  xen/arch/x86/msr.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> > index 3f0450259cdf..964d500ff8a1 100644
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >      case MSR_K8_HWCR:
> >          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> >              goto gp_fault;
> > -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
> > -               ? K8_HWCR_TSC_FREQ_SEL : 0;
> > +        /*
> > +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
> > +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
> > +         * also poke at PSTATE0.
> > +         */
> 
> While this is true, the justification for removing this is because
> TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
> 
> Also because it's addition without writing into the migration stream was
> bogus irrespective of the specifics of the bit.
> 
> I'm still of the opinion that it's buggy for OpenBSD to be looking at
> model specific bits when virtualised,

Well, I think we can argue that an OS is free to ignore the CPUID HV
bit and still boot on Xen (even if that leads to non-ideal decisions).

> but given my latest reading of the
> AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
> can see TSC_FREQ_SEL.

Hm, there's no written down note that TSC_FREQ_SEL implies PSTATE0 to
be available (and PSTATE0 is not an architectural MSR), but I can see
how a guest can expect to fetch the P0 frequency if it sees
TSC_FREQ_SEL.  It might have been more fail safe to check for
PSTATE_LIMIT not faulting before attempting to access PSTATE0.

> In some theoretical future where the toolstack better understands MSRs
> and (non)migratable VMs (which is the QubesOS usecase), then it would in
> principle be fine to construct a VM which can see the host TSC_FREQ_SEL
> and PSTATE* values.
> 
> Preferably with an adjusted comment, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks, will reply to other comments before taking the RB and
resending.

Roger.

