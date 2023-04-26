Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A54D6EEFA0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 09:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526534.818356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZt7-0007NO-UR; Wed, 26 Apr 2023 07:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526534.818356; Wed, 26 Apr 2023 07:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZt7-0007Kl-R1; Wed, 26 Apr 2023 07:48:29 +0000
Received: by outflank-mailman (input) for mailman id 526534;
 Wed, 26 Apr 2023 07:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eKXV=AR=citrix.com=prvs=47345d3e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1prZt5-0007Kf-Ap
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:48:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8727a64-e406-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 09:48:25 +0200 (CEST)
Received: from mail-bn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 03:48:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6465.namprd03.prod.outlook.com (2603:10b6:806:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Wed, 26 Apr
 2023 07:48:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6319.029; Wed, 26 Apr 2023
 07:48:11 +0000
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
X-Inumbo-ID: b8727a64-e406-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682495305;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0sS3ir+vHB082WhzG4V1EoXKV+Oe2aLfXKHjgPJdE7c=;
  b=bifDPeJOh5QaI5g8lBkojp3h4tcXPpMgECHgUrh4gd5p3K91Pr6Z/Srp
   gVGpDF2d0/80KRJ7QSVr2/qgyCMA6jxJS7cawPrSUrpZ2DO2C9bMFoF9V
   1yqxyUDEzhs7f+CigivjgHKVinxQAyab59lvLJeS7TOTHpzPu9rMPZrHz
   g=;
X-IronPort-RemoteIP: 104.47.51.43
X-IronPort-MID: 109336669
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EV5reaLr7sh5JvSnFE+RP5QlxSXFcZb7ZxGr2PjKsXjdYENS1mMPy
 zBJWzvQa6veNGDyLoola4y0/R5QvZaGxt8yT1ZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gZgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5FBHoU9
 MQxEgwOQUqJocac+q26VdBj05FLwMnDZOvzu1lG5BSBV7MMZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dupTSIpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr93bSRw32qMG4UPLGBq6JpjkLN/WM4JyQyWln4ouiJ0kHrDrqzL
 GRRoELCt5Ma8UWxS9DnUh6QoXiavwUdUd5dD+077g6WzqPepQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuwMyUIKW4JZQcfUBAIpdLkpekbjA/LT9tlOL64iJvyAz6Y6
 yuRsCE0irEXjMgK/6a251bKh3SrvJehZhExzhXaWCSi9AwRWWK+T4mh6Fye5/AZKo+cFgOFp
 CJcx5PY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 BG7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:CVNHJahZt4tNJlMA1ghpiSjRRXBQX7123DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/hSQRI+Lpv+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd8gYCXyhJybIC93
 GAtwDi/K2sv9yy1xeZjgbontlrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nwixrw3AvL1ioo9hbZuBWlqEqmhfa8aCMxCsJHi44cWhzF63A4tNU59K
 5QxWqWu7deEBuFxU3GlpP1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYha2E9OCp8PEA/z9YhiOu
 hzC8P34upQbDqhHjjkl1gq5ObpcmU4Hx+ATERHksuJ0wJOlHQ89EcczNx3pAZ1yLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBPlKgupUBXaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuenjpFdaF0PRwg17wqV2GLHfQI/xlltpEUuWWfsuvDcTDciFgryKYmYRePiWBMM
 zDfK6/AJfYXB7T8MhyrkrDsqJpWAkjuf0uy6gGsm2107P2w63Rx5vmmaXoVczQOAdhfF/DKV
 0+exW2DPl8zymQKw3FaV7qKj/QRnA=
X-Talos-CUID: 9a23:ASHsP24dA4SAiz0CKtssxksPQMEdW0fhz1iKKWmcI1x2SaKsRgrF
X-Talos-MUID: 9a23:t7BPjAbLnX6eheBTuwax2DJsK5lT7I+BMWQCk9YFqvncOnkl
X-IronPort-AV: E=Sophos;i="5.99,227,1677560400"; 
   d="scan'208";a="109336669"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXbvAfnkLubOwSTdTHuHYQ7Z69dv97zhDk0oD/nPJzvlnbjWEliYaoGSLm01gWJ8RJ9SDRBfkDo6yC8/IYli5QYxKfxXbhMsaQ3/PHiAVR4GQr7M5Bruqamv8IhbOxuTQaQkauqfz1LEqkIhY1odSOdsltPZzyHYYjjHZORX6mAnvxlKie3qUKCSuW78leNHRu5hxYsu+gdAdxkmkKhRdJzgClOZeSbT/nENFpYxhwrS7lw3B9mvF6EeO18eh6jQnueH/1RSwR0KmsFtVHO1nXGiyLpqT+NzErvc9BBkB+VbwjvxN732nMAIomrxZ4Pa9UdcE4HHMwX4xczsGM4rEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf2xenawkEDBzK8yC2XFCbJS8ncy2Q7HBlgb8stBePE=;
 b=Cjl8NjLrwrhM6tVBdewyy5MpncVSxGeRaujOzE2gTKfXTNKx5oozCa7KdswytnIQRy8r+jEn1KDPq8rAxxdxQxWsXmx1uDonRYqQcK2oes1ahBQRiiSZLHDwypieL0v3RYgxWeyL8YBZzG9HFf057cXKLfI+mHh9QeKgcL2yT6Dl9+Q7b9Dkn38ryrQ+plm6hf6FJTCqtMlf6ZODJ260nDbtpm4nc5js4brq35wdIfohG3P/Cd6G46nlFKwFCOQbh0Umz4Ahu+O1liyutAp7qFwT1PHQBQY+10lpm/OBUv7PP8EY6dgmTysMfI0WqJzmsABMvmmSPor/gPZYmDbanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf2xenawkEDBzK8yC2XFCbJS8ncy2Q7HBlgb8stBePE=;
 b=fqZ64B8zUGUCvzNKnaik5bIMIOfzomdtwo++MADloAUHKEv4R1ZLJ/yu/DpBP3ZG8rRcS8vpLk5r6dU3XYO9oErz7oeVWSFuB7GW5DzHBOlU/f3AiBlQrcF2/IxV47CnRiYpoDQBtBpXf+FPfgSPpXMSasOnxQ/Yx5g0BAkS0ZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Apr 2023 09:48:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI
 console card
Message-ID: <ZEjXNLAVCixClGyl@Air-de-Roger>
References: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: LO4P123CA0545.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6e807c-c7d6-4f5e-3e2c-08db462a9501
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M8CUCcULHxN6C0VGOHOamxJGjfZD3hghanW5CAPimpgiTEWWvrNoXCm166S/z4SSg0IG03VztVbxbEaOUOC3uhuENNzBDQiJkIbNPCWy16FiMvzzMJrXXRMuqK9kwg0DnHd5SHPOEvtk/lzsYV47xFgBF2LUZ6JBRCG7yqYwTxtg16Hk9FK0IoqsRLJHBS4kZjsl28jRO2y7n8Tj4Yd/Iw5J2TSOJqzmLDFo4LMK6G6EZJst0rJY+oGNmMltSMS8WsDryAoxnzizdnDLHMnKsPAScO3huD5GT4Zp0oQPcgkYmtFJ7InsUephAHnW7LTTW/IRaff78+2ip7yzB10V9xQA5hadRbMhCaJ+F2ywAtEOwIgvjLHuEXBtoJ2IHMBlAsGfvOc+Lu3fX3iKyCT+ZP2zC4kKZzeDwALd36RWU3q6GFrV7ykGwlC3WyHxMDtvPjvxPFYDU5iTjzcuRsuPcv5g0rBX1WZsOMF+O+pTur7u93J+xoQ537I2eZMgbwGU0GSfH2dhJsjeVVKaeCy9MOE6fAr6Lre8/j/UNQ6ncQr3RpNTLaaVVscPUgXL/ZCm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(186003)(2906002)(9686003)(85182001)(41300700001)(6506007)(6512007)(26005)(6916009)(83380400001)(66574015)(33716001)(86362001)(54906003)(6486002)(6666004)(66556008)(8676002)(8936002)(5660300002)(82960400001)(316002)(478600001)(38100700002)(66946007)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU1TVDZINTBXWXVmNGxocHFQVXEwNjM2N3p4MWRSczhVK21Hd0lvUHYrajlJ?=
 =?utf-8?B?Zk02U2srOUJHWkZxczlmTFNBRSs3cFpiTmxtNFV1TzlUMlVsUW5sdG5xRm9v?=
 =?utf-8?B?U2MwakhnQ3ZsdUo1ZndwTmNwbTRnS3M2d1JoeG5VaWtTRXlPRlJxbXFpV25D?=
 =?utf-8?B?R0ZtRzVMZVZ5L2FuUFpDRzlqTmxPempraGZUWmhaaXhOOGxYR3NoWDdWdmNG?=
 =?utf-8?B?MXNSYjZPb3NkUGkrSFN2VDlTOU5kM3FieGNySmVhdjdUVlcwNG4vcUsyUTF6?=
 =?utf-8?B?WVo5N0lDVC94enR5dXVxbmlZdGd6VlZOTFRnb2plaEdhRlZuU3N6ek82UVV0?=
 =?utf-8?B?N1B4c3pFUjZ3ZWJoc2t2Q04vMm9NNkQraHFRVlZhSWErQzhuL3MrL21YR0g4?=
 =?utf-8?B?aUsrNXU0eEV2RUp0Nldza2dSVFVubVFqcDV5TG5lRWprK3ZXL3J2cGN5M1Aw?=
 =?utf-8?B?RkEvM0FpMUF5NUtYY2VObUFoNHRXU3A2NEtTY3Z6M04rTlNJQ2w2Y3UydjF4?=
 =?utf-8?B?UytSdVkwMmI0cmFVaE1YM2k1MzhuK3Nld0QrMnQrR2J3anN0VDRUR2hIYVBG?=
 =?utf-8?B?OUJ5TU1rcjRUYVVpeDZCNVcra3RpZlZYOGVjTWpyMHBrQm9kV0t2eHNjRjlu?=
 =?utf-8?B?UkExanpsaGh3Tm5tLzFiSmJheklxcGl0UXM4NVQzWm52RkVnckFCaThOdFBy?=
 =?utf-8?B?aFBuelpOZU9oNVI0bytGdnFSQVVjcEdGMkhTd1BvTWdKSnJlUk1QekVqV1dr?=
 =?utf-8?B?SmFnSGpGWjA3Sjc4bjRNZ3ZBNjVPK0pzemdubjVPZjJkYlFZNUd6S0lKa0M3?=
 =?utf-8?B?b3NYbVZtTTNVb0VxSjAwOGFTZCtjZ2QwcjVZaS84Q0VhTlc4Nnl3dllZei9r?=
 =?utf-8?B?UzVUdlhpZWdzN3NHeENUaStaU2J6bnlzTnpUZml5eXBtOVIvZTRyNkxUeVln?=
 =?utf-8?B?WUFRa1owK01oaFNucy8xQlYrZHFucmwzdzRiclQzQVhITDI1VUhVZ0pJWjhn?=
 =?utf-8?B?Y2xiMENPanlXRUYweHpxL29WZnM0SStMRWdvb3BqV3R3QXVZNGo4Q240SlJG?=
 =?utf-8?B?U2U4N05Sbi9WbHFYbnVSMmJRNFpPTUk3aWNzd2lBY1gyTTRyMDNwNWxXc1Zh?=
 =?utf-8?B?blBSLzFlVlJIQ2Rvc0hVTHFid09oRm1Rc3lRc3dYZHEzMnEyaktoakw0aHFi?=
 =?utf-8?B?QlBxUWw1UEt3Q0x5cklncVpWei9Zd3F6MmhoMjJEQVNDNndPTENwckhiblpz?=
 =?utf-8?B?VHYzU3dTVWxqcTNJVThwd29obkxTd2lyek8vNmNtNkRKSzVPTXJ2Uk1IRS8w?=
 =?utf-8?B?QjRTL2E2NEdoNVorSFJwZkFSRWhLbGJYaTZCVmxlVVNkNXRveXo4eGxQa1dZ?=
 =?utf-8?B?VXhyZlVPKzlUMG5TWnF5ekpKSUpLYmhHVDJna0pyRFlTRWF0VVBERmp2Z1g3?=
 =?utf-8?B?MFdUYVJJYzhUWTZzTzl4SXRITkVTaW1TdGtVU0xTUW54YXBJeHZTRm4xckNq?=
 =?utf-8?B?bE80MnVjdXdOWmMxLzF2b0VJbndjMXByb1U5aE5NNndSbHZhb1h6Sm9PdUVi?=
 =?utf-8?B?WGZ4KzBQUnB4ODlDbldpY1F5Tm1yWWZIQVNHWnNPL3FyRlU2QkVLZlhhLzBN?=
 =?utf-8?B?RUkzQzJTNy84YStDUDNDQzJad3Rhc0piYmZFK2RPNjFKdW8vSm9VblNuMlNY?=
 =?utf-8?B?dGN6SktGNHJuRDZlcnZPYm9JY044NkNPKzByZHoyRXhUNkNOUndudU5UZ0FN?=
 =?utf-8?B?SEJqaG9GYmZweGdOMXpiREJyeURjMWpUWmxLK2owczJIRjJDUVpsUXlZTG5a?=
 =?utf-8?B?MVJ4V2MxaVh5OTdHNGZLanB4TEc2aGhMVldOWkswUEIzNmZEc3ljeURreEZ5?=
 =?utf-8?B?dFQ3SGdVWGVwY252NThQYlJDT2hhZXhFbGlHbnp3T3JzQklEUWp1TGpJeCtz?=
 =?utf-8?B?WUpwS3dwbGxxc1hXR3RxYmtGUzlad3RtZ2dNNE1RMGNpSGFYcnAyVkRKL3hn?=
 =?utf-8?B?ZWxLc1FEc2hLbDJaTWkrWFJwWjdzMjJwdVhXK2tYOVBTQ2oyTTdISnNUTXdS?=
 =?utf-8?B?bDVUMHdGTStIVTlSbVVDZHByem1HRWJEQUlPV2VwdVNGRzBUSFB3aXBHOThq?=
 =?utf-8?Q?3axPNaEb6iY3VpWTEUmMGKW7o?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Yx8WiW3e+UFPzguVOAQc99Qwi+Nyu4UTkZmmKIOAdBgptDk/D+pDgHG1AMJZNdFKXIPNe+yCX6Xha0x4ZGNkPLK99/9urip7vlthcSoT40Or3Dxj9H7kfjxP5UOO6Kr4nnr2pPXYHp6S5OwWpNlz30CJIXiNPU1x8/EoOopy9nsDzFH49q+Ewz2CvSBout0QvB3p7/uVW8rhcE6BDwkRUEsC+gIiQaVuLAX/NnEiuUY09QhrokbI9DKqLLkBrb17kzrZ7TZHvPSPoXI/zBtJrvs2SZsOr2FU4OH5F1yCO3jvisgCZmgOOtXDvsoGk6210Y0UB7Bnk6BgeGUZBU7p/4+JEnYTZ7wRHprN24jkE1FrLdNDug6lOeezTCMxhi7VhyLg+clFY+vWPb2PhtYuRf5RCs1K1/K0XAuYPpJLs6A+UNnEdkDMxHX1vPYVx7vchCU6reKfR+QA1sCZBKaU1S6iwOzaiYBzxfXUHqoO12yFf8PNc4CernYSF6/vy6Jh6Ws7eZ08MKZ5LMv+5pDjIqz3JjXGeYT7hnBWpVLuDvJRiekCWEXSRvEfo3Yv3EUYMyDK9UdZMAeSwEsjQLqvIl/vKqiO6n0ovPP0DJxP8HktS5YPyRP4d3SL9YMebYnUXzzeNjWJAtAxwCQ8r+RfvVNoQHiMGpEilCTHrnueUbPFTNuHeuTiZ6nEgLJCWGlZAlG/nfE90NvcW24vtWVwMVXoXRFDntvq9720HILorQoekrzIu9nj1HFf4Yi/4I89YOlrwyEeec2KanLV3KR7S2ga2FUwWMtnfLIrANv/+tZ/2VPW4u27vezMxuRC2p86JW7Pvndf+IfmWkRRWQ/Wd2UMDnxlkdg7pCIljaV7PB1xDXHVfSXeoaz3qVyVkx39xPetxuKWo84IhJM+NPFixYP6au/cZb4TU5eFnOEe8mg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6e807c-c7d6-4f5e-3e2c-08db462a9501
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 07:48:10.8826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7Hl+eTeD0z0+k2LhUOK8rsf849mapm/dQAKqBOu44usgAKVi77yrRPpqiNkBlQjSs2B8HWEMlIzV6vA9iRLqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6465

On Tue, Apr 25, 2023 at 04:39:02PM +0200, Marek Marczykowski-Górecki wrote:
> pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
> devices, add setting PCI_COMMAND_MEMORY for MMIO-based UART devices too.
> Note the MMIO-based devices in practice need a "pci" sub-option,
> otherwise a few parameters are not initialized (including bar_idx,
> reg_shift, reg_width etc). The "pci" is not supposed to be used with
> explicit BDF, so do not key setting PCI_COMMAND_MEMORY on explicit BDF
> being set. Contrary to the IO-based UART, pci_serial_early_init() will
> not attempt to set BAR0 address, even if user provided io_base manually
> - in most cases, those are with an offest and the current cmdline syntax
> doesn't allow expressing it. Due to this, enable PCI_COMMAND_MEMORY only
> if uart->bar is already populated. In similar spirit, this patch does
> not support setting BAR0 of the bridge.

FWIW (not that should be done here) but I think we also want to
disable memory decoding in pci_uart_config() while sizing the BAR.

> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> This fixes the issue I was talking about on #xendevel. Thanks Roger for
> the hint.
> 
> Changes in v2:
>  - check if uart->bar instead of uart->io_base
>  - move it ahead of !uart->ps_bdf_enable return
>  - expand commit message.
> ---
>  xen/drivers/char/ns16550.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 1b21eb93c45f..34231dcb23ea 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -272,7 +272,15 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>  static void pci_serial_early_init(struct ns16550 *uart)
>  {
>  #ifdef NS16550_PCI
> -    if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
> +    if ( uart->bar )
> +    {
> +        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> +                                  uart->ps_bdf[2]),
> +                         PCI_COMMAND, PCI_COMMAND_MEMORY);

Don't you want to read the current command register first and just
or PCI_COMMAND_MEMORY?

I see that for IO decoding we already do it this way, but I'm not sure
whether it could cause issues down the road by unintentionally
disabling command flags.

Thanks, Roger.

