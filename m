Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7E756685
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564645.882216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPKx-0000Ah-VE; Mon, 17 Jul 2023 14:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564645.882216; Mon, 17 Jul 2023 14:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPKx-00007y-SB; Mon, 17 Jul 2023 14:36:31 +0000
Received: by outflank-mailman (input) for mailman id 564645;
 Mon, 17 Jul 2023 14:36:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLPKx-00007s-2C
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:36:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ff1fb16-24af-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 16:36:29 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 10:36:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5618.namprd03.prod.outlook.com (2603:10b6:208:294::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 14:36:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:36:17 +0000
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
X-Inumbo-ID: 4ff1fb16-24af-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689604589;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zzF2tLxL7wnHTD0WitPj413cxkzP5KQ8HS4icFEuIQo=;
  b=RaVDuhs5qd/zP3QqI2Ba1j/K5WhlHtCmb0Gn3Qoqv8980XL9j4Kdhl4+
   AYAZ0LCGOvAPsE7+gD/mRo77AZU37RgI55ZRkFC1D+TZ82VXXRiqMfzBP
   lWPAzmDil0Us76OvwEVOB/5igOd57+8wDhegVHi2sAE7uX2yRZqX/syMy
   Q=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 115178328
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CGaurqwxEYH+U/AomFp6t+cTxyrEfRIJ4+MujC+fZmUNrF6WrkVWm
 zNOUT2CM6uLNzHxfIp0ad/n/UIC75OAmtc3Tgdr+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPK8T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVpNy
 /w/bwENUjCSh+S0n7TkScJJtv12eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aSxHyrA9hCfFG+3v5LmHKi/2g0MRobT3+Qq6Kjrk6HX+sKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHYDBeSwIAuoHnuNtq1kKJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNXNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:38eJLq3J+1Tlxvh2xIjflQqjBEIkLtp133Aq2lEZdPU0SKGlfq
 GV7ZMmPHrP4gr5N0tOpTntAse9qDbnhP1ICOoqTNOftWvd2FdARbsKheffKn/bak/DH4Zmvp
 uIGJIObeEYY2IasS77ijPIb+rJwrO8gd+VbTG19QYSceloAZsQnjuQEmygYytLrJEtP+tCKH
 KbjPA33gaISDAsQemQIGIKZOTHr82jruOaXfZXbyRXkDVnlFmTmcXHLyQ=
X-Talos-CUID: 9a23:+/WCxmNR30HiNe5DYypZ9GlTK8AZUmzdynWPJRC7IkNZcejA
X-Talos-MUID: =?us-ascii?q?9a23=3AaIe5VQ0f1IO5q2qr1pYkATeMCjUj44W2J3E0lbI?=
 =?us-ascii?q?/vMSeEQd6YC25jA2ze9py?=
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="115178328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3EjOnqP+lKa13o4QM8vjpMjt1Eud6jqD5caCm7KIK+iWyjd6IQ7DL/DxcSAtvjkRGYfjyFVhJPiKEMbVQhi4SeEhyrBXEdt+2jp9bYYgUqHASusivsk4hrWx+/UJHq86nGKuOxuEpM7x2V1zJblrc3RoNL3doWAs2ujVxj7k7s6dPSIeB/IuT1K3Vzq7uu8FPfkbtX0TCbhWRb0INw+M7R2KRxcSRkCejr+oK5UNLXz+dH23uI9AkltjSqnI7d7KKotuLOosHph6Pdg039nq0lh3lGoGxbhJQUYT/dlb0gBqfmqIM19ghbqJeLPHEU81HgUgsDZvRJPCYkkGGW6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfmyvjuK3TGcXoVu8TBn4BNtQvpWL548nD6P46bKv9w=;
 b=KL9c5VY+WLobzx04KZuQJF3lU6evOiIon0j/CNSP3SUDz0AXu6fRiX9LRWJpZK7lAKtcLFaXEykz9OZSjpNbt1FGwk0UoMGGrg2pBMC+kSLK6B3xNQULODhsjFcLvhtkZasYQUkEkktYUp/kb1bnBLcT8Isd1S+qhZubQaVtAuxS0LGQCb1H7YfprjO0F9CODdIjUxLwXvvnx1EpA7hTVMXxhjl3lL5nWrP45ok8jZnES6/i6R6U1o9A+c+u4xwfsN80jnrt5w51jrWgl76OqV/jmHlP8MfJsHWTkJ7VofkKsmTYJR4xQNZ3lwGkoLD8XwEtQh3crd0QZCrrl2yOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfmyvjuK3TGcXoVu8TBn4BNtQvpWL548nD6P46bKv9w=;
 b=NoUQ70jEcdbYIC653wvKbauR7rgg2gLi2FMJ2wggC3ebUqMELjarQHvCacELse7dp2jKo7hrXDlwjkCzby+PlnmuDWNEktUTgy7vlnQG9YrEmk8aM4P/IG5wEJdajNFKEwBtaFblZlCTSDAk2BC+DPvVQGhJ3juRkCUqxS8p8h4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 16:36:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Message-ID: <ZLVR23KbddRHrC5z@MacBook-Air-de-Roger.local>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-4-roger.pau@citrix.com>
 <d7be70e8-611c-4f7d-a585-2a00b1513a92@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7be70e8-611c-4f7d-a585-2a00b1513a92@perard>
X-ClientProxiedBy: LO4P123CA0455.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: c506a535-bb7f-414d-682e-08db86d32e3d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YNyrJfSabpUeQPbPJNf9xFHTQZHYTzDlP+X+68kGrL89NKWWuvsbtF2ImHidO372K8hVK0knMQD/PMy0TwCRFJe86M5B7mPNuuezisr3qhV8+3gzWc7brmPaVp7ANz/dtJvPC2D8I4K/Purn1lPSqFoLKrtSaoTOPrv3H8V6v1IBIDa7JV3LQzkTYd6hsKmY+V8tnwyOOQkQImc+fp1YI6ZdkS2P39l4wHEoSev7BblUgfWSoWZb8Tm0lrESjan687pGMTyq80w500f9lEM8U4NtgiFD0ngEP2JUR6q/kyZyCxmBoTD8oAjXk60njZUfYIhSVxKJOuGh8UDPHjxzMbZg/EiidvhfDmpOlUmG9r+3b6I9R/PEj0WetSFF98o+woqEmQBDkpEo1MUwHdasI7NdMGk/+eVgwN6cjLwsm23MlDE1MkZ+UgCYb0yeZpg+oxJgcCVK2lNEtEp/qV2BxgFNhaFnHBVR4G1u45xDyu12F1ktDLSaZkvSsEXGNkm5LAtA+U8rDUe7uVzTjI+UBMN1ZFdlbUy6eVZBgFfcg2mIdjMhVxKdfB89itoFtCrJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(6862004)(8676002)(41300700001)(82960400001)(86362001)(5660300002)(8936002)(38100700002)(316002)(6636002)(4326008)(83380400001)(66899021)(9686003)(66556008)(66476007)(66946007)(2906002)(85182001)(478600001)(54906003)(6486002)(6666004)(6512007)(186003)(26005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzNUVGhTbXROS2s3OWRRdkQ1T05RZ3ZiY1I2bWowWFBqeVkyckVYcVh5RDkx?=
 =?utf-8?B?LzQ2Yms0YklySVFlVU1KRWVQZXcycWhKQnJLa1BZWGVmeitseVQ0aWFydTFO?=
 =?utf-8?B?QlVqSW1zWUozUVRMSFNFSHJKNTlmNktPYm1ob1lQalRnUmN4UUdtNjdNdUZP?=
 =?utf-8?B?L2JSU2ppS01FcitTNllKZWNyRVgzaTdzRFovcDF0R0tpdy9ZOFNFUkV2VG1t?=
 =?utf-8?B?UitDWm9JU0pRN2piT2MxS2VyZnR1Qlg3enJWS1NlRTlGYytMcXpsWGg1UFFO?=
 =?utf-8?B?YzhFYXV1L1hTanZhZWN3dHBGa0tKdzZXVmkwNnp6Q3ZUanRqaWVFN0xzZ1Q4?=
 =?utf-8?B?cERxbjk5YVh5eTJjL3FubVU3S2lGOC9wbElOS2FWMjhoV3FIb2VPamFjMFVG?=
 =?utf-8?B?aTFnYkxkSmpwcTRkRnY3bW16cTJDa0JOeDVoNG5hN3VhenV5ZWVydTNhTEps?=
 =?utf-8?B?RnlSSG1jenp2OTg0MGY3T2JWVU5JdGxXSjhNbVhWdDA2bzhuM1JxV0ZDZllL?=
 =?utf-8?B?aWMyYm9yaWhWRVptR1AramhkT2M4ZC9Ob0ZaQlROZHExTDhRc1h3Smk5S3hG?=
 =?utf-8?B?SUUwT0xNUzI3dzZPQlptc3ZPSjU4MW93bVN3ZjVXaXF1TWRGd3d3SXJRMHN3?=
 =?utf-8?B?dEpDa2lRM0ErU1lVR1U3R0JhVHU5bk5qWWlOQlorbkhTdUY3SlhocElXeWlj?=
 =?utf-8?B?U25icEdHM2NYK0Y2V09BNE9HQ1Y3V2dRVkRWS0tJYm9zNC9VekdwUzJQNXNa?=
 =?utf-8?B?UXk3QUZ3TnNpTXdkVFhLSHhzYSs1MmwzcmZvcVBMbTJpV3ZOVmZLcFU4cit0?=
 =?utf-8?B?QUdGZCtEdXpkaHBHYzQzZ25QQWN0YlQ3NUZBcU4yS2NPUjRTb3ZDSnR6YUdj?=
 =?utf-8?B?dHlqQ3BON0Z2UkNlTm5IRU5MeWxEZHMrTnYrWnEvMi9La1RBMHlZaDFVLytI?=
 =?utf-8?B?WFZvekpxYkxOTVhjOUE0NlNRaXlGOHprMk53OVZiRnJuSVRFL3pxMkFyNTBC?=
 =?utf-8?B?V0VyQ0tnYU5pMnJMZWVPWmsxMW9LNko2OU5BWXBBNkZQRGhYakdwUEVOSUtj?=
 =?utf-8?B?OFVOaTZxSjVQMW9JVmdzWmZnYVJWWWhQTXJ3dzl6eDQwTk1KL3BxMHJ3cDNR?=
 =?utf-8?B?alhPN2FER1Q0SklsYU9ENS9JakZFNUhxWXE1NFdUMHcwNS9VWHpnTnl1cFRz?=
 =?utf-8?B?ejBqWmJlRkxPaEczYkdTd3RyTlVIem40YUltSXF6SUJuVnJtTFVJTHc5WXpM?=
 =?utf-8?B?VFRjY1ZIQ0VuQ05ueVlkOEYrdEtneVArUnUzaS9MUG1IVkc0VEk5NjhSQ0wx?=
 =?utf-8?B?TEd5VmpYbjdyRzhlN25OcHZVODdhdzJROW9pamorL0tvckl0NnJoWE1ta2cv?=
 =?utf-8?B?OFZpZm5ISlVrcXB4NHdERDJIRTdWS2dPRjZYNkFzM25wN3N0NXEyTkRMOW1X?=
 =?utf-8?B?KzZaZHFBenpiSE9VbnNXRjVJMUZiL25vK0dWdk5wemRjR25Ub0xFbXBOempS?=
 =?utf-8?B?MjBRa2JkcTkrRStXSE4xaU1BNjhtOFhnR01HK1M3QmdhK3N0SUsyR3ZpSWNH?=
 =?utf-8?B?dEd6TU1SV3dUVk52T0d6S0djdXV5UFpZaEhMNkNIbDNmMk10eGM2ajh2d2I2?=
 =?utf-8?B?K241SWtiYzYrODlPZElKVENhTWcvYmdsUnVrRjJ0ZHB2UzNsMlpFeFBxemNv?=
 =?utf-8?B?QVpxTlU0SURtaUUrSkN2MDFCeXdwRXYvb2ovYXp1Z05UUlVBbTFXK0RyZTRa?=
 =?utf-8?B?eFBCSDN5aDU4ZkdTU0dYWUFTTVVlazd6L1Q2TEFiQTVFbFZUdzZNSVMzNWM0?=
 =?utf-8?B?Nm9yL2YwRGlENFZuN2tVdGRFWXdmNVhXS0hTVlQvUkVUQU5iVTNTcUNJNmhx?=
 =?utf-8?B?RXBuaGV4VE1BelR0Y2tMS1RydDdlaW9UMWhDWG1xcXlSS3RGMjFlVmdvc1lH?=
 =?utf-8?B?NDJwdC9QaksreG1mSFA1VThqdEFyOFg1ME5wQ0prUUJQYmI4Zm5pWG9CTEJQ?=
 =?utf-8?B?UkxGNWpCN3pIZHlHNktVZUt6NkdBdVpoQm1WNDVBRFd6VHVNMTZWTlUvcS9J?=
 =?utf-8?B?MTR2NndVMmxiUzJqeGNRdU5FWmpaQXo3VUptRms4ZFJKVU9LbWROQTllZTJC?=
 =?utf-8?B?N21SM1FsZzlTV083RjRDUlNhNjZiZ2V5VE5rWkV2L1FpbkZoakwrNE52ZG8z?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k6Fifo2JZu0eVh49u9dO0GDePciJHFqbS0dY1aDp12jFXZ0b8euxX4PMe2Gf+XNKup4ZqliaYp9BCGcJkTJMc2HNUe4QFEHaMv+g3/ep+h7qdgogjOuvmCJThQujsfR37TrY+4NbpVBD86+shCt7POo+O74SnuFLf/3romzE0hMre3/yEZyf5qCRLztkcDINdpjbgUouJ0xrNLD841O2JrAtT3TN/g9YgevpERlo6NxCQALyEyIxfUF4eNByyRli+dPsCmOi0a84posHvDnJp+mD9w3NEooEhWiulb4LguxpznJhy3Uqb8Zlyk5IlNm/oqsgcpY8Bfw5q0TCLa0LW8AK/IUvpdB51k8elFLwm8AyFGQyEUgqKZ2PmJNgAQ39vQ3VDrtk6DU7/gYZ137tJF1so3yVbhtvUuZzib3Z/VYNvrvZMQMlPerz+RhkxLn/HBKRB/Rf4dtAin9v0eeNk9ofrbX8PCz4uWcEahypHDfopV4LoCQCePZ0Vg8YF8yvELK39uzenVm5fi/80P9pgsjz9fCYXeu/sDIi6VlwSo6fX2uBrpxUKJQ22Mc32HPWN2TbQqzWjXrTOAHFnDfMk4IBjgmt95QNGCrMWMeqqf+4G/9ahmLTVk4jppChHCPyPphA7eoeehzBQx3fwwY+DzaUqOAJbZRNSQYmzxJh+quoTEQtTghLhT9hM8YS5cgvfVy+JnCC2/X72S8OeExUzJjfjUWrdBSwZD+iwIJCJLZdhXA9G4J1ruSupsXYZ/ispky/5DDHdtmM3/2ToJZRJnt4lnCjA/prQ2G8nXscZv5Jsu9HcobTjhaMTHll6I7c
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c506a535-bb7f-414d-682e-08db86d32e3d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:36:17.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ig73PxI+XbVHyGxD1sQmJPjzG8uaIkw6BobMZUP1xXxH/4e97M2FbLeaozXNW1wf+Zl0gwlvexXOMpLEsiwoGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5618

On Wed, Jul 12, 2023 at 05:39:01PM +0100, Anthony PERARD wrote:
> On Tue, Jul 11, 2023 at 11:22:27AM +0200, Roger Pau Monne wrote:
> > Add a new array field to libxl_cpuid_policy in order to store the MSR
> > policies.
> > 
> > Note that libxl_cpuid_policy_list_{copy,length,parse_json,gen_json}
> > are not adjusted to deal with the new MSR array now part of
> > libxl_cpuid_policy_list.
> 
> Why? Isn't this going to be an issue? Or maybe that going to be dealt
> with in a future patch?

I'm unsure what's the point of those?  The CPUID/MSR data is passed as
a migration stream record from the hypervisor, so I don't see much
point into converting it into json.  It also seems quite complex, and
can't likely we done without breaking (or adjusting) the current
format.

My plan was to leave this unimplemented and if someone is in
interested in having the data in json they can as well implement it.

Would you be OK if I add a note to the commit message that
implementing json marshalling is left to implement for interested
parties?

> > 
> > Adding the MSR data in the libxl_cpuid_policy_list type is done so
> > that existing users can seamlessly pass MSR features as part of the
> > CPUID data, without requiring the introduction of a separate
> > domain_build_info field, and a new set of handlers functions.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  tools/libs/light/libxl_cpuid.c    | 6 +++++-
> >  tools/libs/light/libxl_internal.h | 1 +
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > index 724cb4f182d4..65cad28c3ef0 100644
> > --- a/tools/libs/light/libxl_cpuid.c
> > +++ b/tools/libs/light/libxl_cpuid.c
> > @@ -40,6 +40,9 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
> >          free(policy->cpuid);
> >      }
> >  
> > +    if (policy->msr)
> 
> You don't need to test for NULL, you can call free() in this case as
> well.

Right, thanks, will adjust.

Roger.

