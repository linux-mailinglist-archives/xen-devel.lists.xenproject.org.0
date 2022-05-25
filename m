Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2D1533810
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336975.561431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntm97-0006ah-6q; Wed, 25 May 2022 08:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336975.561431; Wed, 25 May 2022 08:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntm97-0006Xe-3N; Wed, 25 May 2022 08:13:33 +0000
Received: by outflank-mailman (input) for mailman id 336975;
 Wed, 25 May 2022 08:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7Hr=WB=citrix.com=prvs=137588b7b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntm95-0006XS-Er
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:13:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e054db6-dc02-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 10:13:30 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 04:13:26 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN2PR03MB2384.namprd03.prod.outlook.com (2603:10b6:804:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 08:13:24 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 08:13:24 +0000
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
X-Inumbo-ID: 8e054db6-dc02-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653466410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=POv1bx7iLdSJsiqqXLREhhkckNI2R8ta4CoCgLlMJAo=;
  b=GxtGRH/71K4d9ap1vUH76g5Y+NJWjnQ86HnIUS94HhKmP73R3lZfnaL2
   JkKbFsRpA0pQM2lzHKruQRcxF9QjpR92e5cb2STbhvHkeF8N8cQAZJNhv
   /VARbbcGyS0xXYwrGFG1/zbsahZ0lDBaKiYoPJoX30bf9Js+3+5nYHGdQ
   o=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 72524842
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gWf8N6z476+KTl2bQiZ6t+dDxyrEfRIJ4+MujC+fZmUNrF6WrkVVm
 jEcUWCEO/fcNmb3KNt1a9vl9B8Ovp+HzdAxTlNt+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY124XhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplmKGcTC55Joj1k99HA0BgDwNbL/F/9+qSSZS/mZT7I0zuVVLJmqwrJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTuoIwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKWAC9ALJ/8Lb5UD/kB4o++PHHOCJe+LaT8VImB2en
 0TvqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZsb5dw21pjiDpBF0ZjZLO+gz6QXIwKyE5Q+cXzEAVmQYN4Fgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:p3yZ9Kyiar+6fFHZ+uFMKrPwFb1zdoMgy1knxilNoH1uA7Wlfq
 WV9sjzuiWE7Qr5NEtQ++xofZPwIk80lqQV3WByB8bHYOCOggLBR72Kr7GD/9SKIVyYygcy79
 YHT0G8MrHN5JpB4PoSLDPWLz/o+re6zJw=
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="72524842"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxDXUsvm66e47gMMiMemaWD2VJdj8k6lXhMIRMp5okaFYwmx8GRljMvlCwnCV+m2+sjoLe7QbFuK208Yte0AxP/Xr3/tQxjLX+WvmO6F+sqrpncFz7po6SUfAZo1JQCd1owWTomYg7wveAslVX5ha8ZvposqSX0T53kdhwy1/bT3VRUCCCXu/CIzt4rMuw5mJO6jMqH3KN6Ym8kFf5Jw2CSRE5KXbjHabQez6nI8IIHCaS/uZSjgU2s08WpZIjGCSUssiTw90lBn/3S7sUSP7oCyS5y4JJBKBGwyNLoqvMA1loVSmNhR+3K4O172bG+CxGLxNZgIVqO4Boh+ZIBZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pv4o2EB645bspSYKdAOEJYy3+IXNe5d0keMtqwzqBBs=;
 b=XoHVZyFQaAslN+Vsq6/7vDKjzzFytUhFRGxEYwz2l7yqOjKuW11F186AIv2Gy0FM+9Y6+lAf34XkIzD6jCAjZji055Ug/QNhoD6Ew+O8vZbpNyFBtD0ArH7TOcHNxbtZ/9LaLPdkTotrF2FvhFsAuZkw9LMVIKBaMTkv0CuYF03nJqril8mmhiHIHQXBoGDamHMHqxIblW3wfVAXvX9/izJO4eagq0qp7MfCVjkTbcgHzTB2C+PsKf+CRjI9NYv54492t+mk4w0n3FH0kyanr0V6PY9dlGQtP9tdtAfCUNWm351XE9KT8e3bDlPs4gHxcmBOb+/ZSQVk36JDcfFZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv4o2EB645bspSYKdAOEJYy3+IXNe5d0keMtqwzqBBs=;
 b=xJ6Dd3ldkjn6gMC7uRru43S411gHiYa9N/mLSt8Trbb+UGqL6NnPLsctVGyTKWX8kXQIY3bL/7b/vADaj5wqI8rzwtpSpjvEYYZ4Igau80YClqwhoPCnubY/yMlEu6LUDnnT0rSRFSQzJQaM6dZZ6YuZmpJxPEGKTUoLzqaDatw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Date: Wed, 25 May 2022 10:13:10 +0200
Message-Id: <20220525081311.13416-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220525081311.13416-1-roger.pau@citrix.com>
References: <20220525081311.13416-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0379.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c25b9bf1-0dc4-40e3-c153-08da3e26702b
X-MS-TrafficTypeDiagnostic: SN2PR03MB2384:EE_
X-Microsoft-Antispam-PRVS:
	<SN2PR03MB238474943E215E90BBEF35418FD69@SN2PR03MB2384.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oGdZVQgL8YveeSzbuWPpZ8ulCvnDyHMFcb4Ijx7W37impbPc2/SdUBxdGVGGahULzopoGR4sLGzaYTJxs9MKIpG73MieFOwS0Z1jG+6Rvb2V90kw7Mm55tDF63BRHNn/iTmMEq0htHAm+m3GIwMplPkxZ6CkVa4PAjmh51OjR8kOiA1BFD9QcCaZYiGONkK3bzURumBLjtMiQn2OqipRSLKwttMwZxqG3cSalFxYgoHAiv8bnBhQ44CGHGCkIuqySYcx6LQ6uytxSfcgzSygG7hXniP5y2+/8B/mHv8FH8QPyMqJqZ/fsaf5w28bp4MT1z8U2S6UJSmAA+Pn7N35XaORvn4/MF9PC1DrEZcwlsUyBu2yetalxevHz4cgEKtK53OUUfI+5FwiOpBXzuckIO3azk92L6ijQAJd5GjxJEA9LUH3O67WUTxCeHhnZTvdgqC26+FqBwXVtvpb219iYisYENwdgN7EN8sSSp3uj6S44ZTVpFpyg24VK5TOSh8RVnsTEhyXZl2K676ugMNJqIuNMKLAfjtUUy8HVBANqfFlHfYufR+JrnjjfBhL5/ZamNYPvIB/D1cWyXJ8zlvxCl66h0vfs8T5ON/smKBxETVWbpWt9JTNqo0pvgrc8YIHJXghJxpCpQsvW38Vc7Vrbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(66476007)(6506007)(4326008)(26005)(6512007)(8676002)(82960400001)(86362001)(5660300002)(508600001)(83380400001)(8936002)(6486002)(1076003)(2906002)(38100700002)(316002)(2616005)(6666004)(36756003)(186003)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RStWbGIzbUEySEpCZGV3ajRkYVEvOXVwUXFoOE1TWnJhTithVjJiNm9nMFV0?=
 =?utf-8?B?TlNUZ25WR1dteVRKWEwzSGo2Qm56Vm16c05aNHpYMjh6WkFJTGlSQmJibUQx?=
 =?utf-8?B?d05EcVg1TERSVDJueVNucGsvZFJJci9WVnBhSk9qTXpibURBWWhLd0tKSUll?=
 =?utf-8?B?dUh0SHJFaVhzQ3FJSG1sbzVQcWdTRXVWNXo2ZllxbmlYQUZyOG51V0V1V09X?=
 =?utf-8?B?NWgzVktlbU5wcldObFNSSVJtU01SL0tBTUN1TnBxQVROaTlmMCs4bDJua01h?=
 =?utf-8?B?QzFkUHlIbGZPTHk2TkY1UGx5MitWSGtCRTRocS9wN2NrNTJXWXU5eFpUcGVD?=
 =?utf-8?B?MWxndng3TnBaUFFVcE4yV1pTeWxpSkJVb01KazJrZzRvdGZrY1RBRmU5OE9h?=
 =?utf-8?B?dklsZWhsbWdBN0JvQWh4NloxOXdqZHJlWmZPbEltdjJkYmRlaXo5OVE2VXg1?=
 =?utf-8?B?SDlDSEJWZWMvNjAyRGhDV3N0b2p5dGQwcW1TMWlmbEVXcTNBMW9jcU5iUXMv?=
 =?utf-8?B?QXRrT0FSWW1mQXJ0TkNOZU84SzRUTU5tQU8yOWpGMWhCM0JNaDk2THhub1hl?=
 =?utf-8?B?dEJySGlMbUdqVXYvVXloVE9FbHF1SUhWNERsTk1FOVZrTEQ5ZVA2VmN5WklI?=
 =?utf-8?B?VGg2eUtzckNHOGRYTnJpWnZHSWdNckU0VUJpYWl6cGpCWXExV21qM1RVUVlK?=
 =?utf-8?B?bENMakZUbjg2MDNXQlc0MHFablNwRkNnV1phVENRaldyTmx0TmU5NkZXTFFL?=
 =?utf-8?B?YmZjWlRQVEV0MnJRRXJHM0NUczJNZ01mWWNqWjd3YjVVaElXZEhMVXR3Q3lk?=
 =?utf-8?B?MCsxNlB4aWVXQXo0YW9ON1RvNjdJbElwOVlTTm1JVFJXbUZCaTI2WUFUVmNn?=
 =?utf-8?B?dHc3NFJxd2M1aWFrWFFYU2duVkZvWmlpRzlzZ2Q4K3EzSThuanhBem5mZkZw?=
 =?utf-8?B?L0FFZGV2aFRwTmN4UnZkUm1PU2ppRHFUa2dPYWFxcWx6a1dsdjIxbUJUd1RR?=
 =?utf-8?B?b25IcVZWNU5yWTBYcUEyQmhqYi9tWFBUZlhxRlpFUXY2M3hqYnZuQnVpMHpa?=
 =?utf-8?B?cklvc3JwN2RxWFRXUzQ0Mkh6ZnRyMVBBRGU1NW56ZWZ3K0hzT1VHUnF1RUtX?=
 =?utf-8?B?Z2xVcEsxMFBZbktQek83OG5zbUEvUkhUV2dBSkNqdUl3OGdGa01hTnZKeXRp?=
 =?utf-8?B?cmtkS3o5QnBnMzVFOVFpaTNWUDE3V0I5Qkh3NjhDOHdOTzJWdXhtNy95Zk9D?=
 =?utf-8?B?L2EvTmc2NXAzQk1JMGhvajdnVHpucjhHbkl3MDVwWG5SWVVVRndzMjkrU2h1?=
 =?utf-8?B?WDIyL2kzeU04ME0ySmVzQTBLOVJMV3lRNDFuOUJnMGRUT25VK1pJSGtPeE5h?=
 =?utf-8?B?UjdieWF3YlhqWi9ZL1JCZFZyV3lWbDBkb2tucVVCVTViZ0NMK3h6U0ZHNXg2?=
 =?utf-8?B?eG04Wm9UM0lFTTZOcUNHdmZRUGVIWjdncVVMUG5sK2dFU0VZTnRpdFpGcTdH?=
 =?utf-8?B?MjdteU5TUHVlczBqYmpmSVAwdFcvZzNTb3J0aTBMY1d1T0szWlpDMExqUWVa?=
 =?utf-8?B?MlVoaDl6eXBiQ0l5QUNyL1FXY3pnQjkrN3RDYWlaZVZPaHRDUklvWUc2cEtZ?=
 =?utf-8?B?RkxEMjlJZC9JT0I1aGI3S0pxNk5hS3Q2RmkrTit2dlRHNGpFQWs2WkN5OENQ?=
 =?utf-8?B?NnlrYUM1UDFCcXBMRFpPYTRLUllUZEJPUXZVYjZwamR6QVNaTGN5QWNBUmM2?=
 =?utf-8?B?dkVuQ2JrY2hwd3lpVGJTb1E4WGNKYkRRTFpIQTNlNDdxY3dWWW5kZkk0Zkky?=
 =?utf-8?B?NEE1UzdXeVVKUHovZXBxL3c3MXNucDV6TVcvWWl3NnhPU0JBMXhDRk4rTXJN?=
 =?utf-8?B?cVdGZmtTZkNqajhaTG5FcDFaZElxaXpKTjJwWG1iL3k3N0Y2VE9ycHB5eUVM?=
 =?utf-8?B?djJvTFdPcWg3SlcwNGFpSlhQR01QTi9MUXBaZ01mUVA2RDBERXB2R052aEZJ?=
 =?utf-8?B?ZU9obFFEd0VRRDBQVVVIenZRb012UXpRajBCaFRkNWJpdHJFMWNIMXI3MFhq?=
 =?utf-8?B?MU5zRmplbWl2Y0p4MXU1UHBTUW1kc2VlckdhU05jOXBDNFphdUV1YndCTkJM?=
 =?utf-8?B?ZVFIc0E4WEJFS3F5dDl3ZFhEUHpUdUZPQzlvdzhoenFxYXN3THYzMXJISUtX?=
 =?utf-8?B?bVpXc1gxZVdwVGowMUZyNm8xa1ZJTC9uWWVpTEM4dG45QXBxSjNZM05WcTFn?=
 =?utf-8?B?MU5aTG9DU3BFSlM0RUJKWWt1Y3V4QVNkTC9TUGJaYzhCOFdEcU1rblA4Qngr?=
 =?utf-8?B?OStXT2FaRGhaMjJZVjRPQnhHWWpWbXMxeTRrN2h4Z21XWHN3ZVh2WUZTU3FY?=
 =?utf-8?Q?aTd7evUBfiYChJZ8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25b9bf1-0dc4-40e3-c153-08da3e26702b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 08:13:23.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv2HdBE6MOvPW7xXsW9XTBZu9RVBEaokQYVBW0TZsjnUj/5naqfF9saYFoy1mSRHnitxEWSGJ7LaYZ3oF56zJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2384

Rename the flag to better note that it's not actually forcing any IPIs
to be issued if none is required, but merely avoiding the usage of TLB
flush assistance (which itself can avoid the sending of IPIs to remote
processors).

No functional change expected.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/include/asm/flushtlb.h | 16 ++++++++--------
 xen/arch/x86/mm.c                   |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 18777f1d4c..a461ee36ff 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -128,13 +128,12 @@ void switch_cr3_cr4(unsigned long cr3, unsigned long cr4);
 #endif
 #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 /*
- * Force an IPI to be sent. Note that adding this to the flags passed to
- * flush_area_mask will prevent using the assisted flush without having any
- * other side effect.
+ * Adding this to the flags passed to flush_area_mask will prevent using the
+ * assisted flush without having any other side effect.
  */
-# define FLUSH_FORCE_IPI 0x8000
+# define FLUSH_NO_ASSIST 0x8000
 #else
-# define FLUSH_FORCE_IPI 0
+# define FLUSH_NO_ASSIST 0
 #endif
 
 /* Flush local TLBs/caches. */
@@ -162,11 +161,12 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
     flush_area_mask(mask, (const void *)(v), FLUSH_TLB|FLUSH_ORDER(0))
 
 /*
- * Make the common code TLB flush helper force use of an IPI in order to be
- * on the safe side. Note that not all calls from common code strictly require
+ * Make the common code TLB flush helper disallow the usage of any flush
+ * assistance in order to be on the safe side and interrupt remote processors
+ * requiring a flush. Note that not all calls from common code strictly require
  * this.
  */
-#define arch_flush_tlb_mask(mask) flush_mask(mask, FLUSH_TLB | FLUSH_FORCE_IPI)
+#define arch_flush_tlb_mask(mask) flush_mask(mask, FLUSH_TLB | FLUSH_NO_ASSIST)
 
 /* Flush all CPUs' TLBs */
 #define flush_tlb_all()                         \
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 72dbce43b1..bbb834c3fb 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2988,7 +2988,7 @@ static int _get_page_type(struct page_info *page, unsigned long type,
                     flush_mask(mask,
                                (x & PGT_type_mask) &&
                                (x & PGT_type_mask) <= PGT_root_page_table
-                               ? FLUSH_TLB | FLUSH_FORCE_IPI
+                               ? FLUSH_TLB | FLUSH_NO_ASSIST
                                : FLUSH_TLB);
                 }
 
-- 
2.36.0


