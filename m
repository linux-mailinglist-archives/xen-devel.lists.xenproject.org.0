Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7E07B561C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611614.951165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKam-0002It-95; Mon, 02 Oct 2023 15:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611614.951165; Mon, 02 Oct 2023 15:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKam-0002G1-4l; Mon, 02 Oct 2023 15:12:16 +0000
Received: by outflank-mailman (input) for mailman id 611614;
 Mon, 02 Oct 2023 15:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKak-0000iK-Ts
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 103a8b3f-6136-11ee-98d2-6d05b1d4d9a1;
 Mon, 02 Oct 2023 17:12:13 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:12:10 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BY1PR03MB7261.namprd03.prod.outlook.com (2603:10b6:a03:526::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Mon, 2 Oct
 2023 15:12:07 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:12:07 +0000
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
X-Inumbo-ID: 103a8b3f-6136-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=pNYDrez4yWL8SFtgFmNWAEo5Kdu51z1s3+A+lxN5AXA=;
  b=IIM0FwDv/i951XMhmPBRPQLZkwxrWvw8+MoLOhqq9KjmRuxCb8Hhe/vz
   gVadLjB62NLZO1nSAtjWLOyScI8IEytnFM+VkqFMogtjrtWKN8CT7x+bo
   niXsid1eClir2K7RFtEe2PLAkqWFROjpslFxXNzqQTek8OQcCyP8HFjt6
   M=;
X-CSE-ConnectionGUID: vHwUt8gsRVKSw/zbV7Fkzw==
X-CSE-MsgGUID: cN34MJP0Qg2FvJ3Ynkek4g==
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 124816976
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:qv5rd6BeKLXiiBVW/97iw5YqxClBgxIJ4kV8jS/XYbTApDongz0Cx
 jQbDW6BOK7fZzP9e9l2aI+y8x4CvsOBx9JqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtA5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5MZoPH0e+
 uciFhM2cVeRjdzp7rGpVbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDC7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC7837Gewn2TtIQ6H5vjqttIuAWqyTY9Fj9NZF24rPrlhRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmgJSCRQLsMvssAeTCYvk
 FSOmrvBBzZirbmUQnK17aqPoHW5Pi19BW0fYS4JSyMV7t+lp5s85jrUVcpqGqOxitzzGBnzz
 iqMoSx4gK8c5eYU042r8FaBhCijzrDLQRQ84gH/V2es/AR/IoWiYuSVBUPz6P9BKMOVSweHt
 X1dwsyGtrlRVdeKiTCHR/gLEPex/fGZPTbAgFlpWZ486zCq/H3ldodViN1jGHpU3g8/UWeBS
 CfuVcl5vve/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:KFtoU6DWkioI2PflHemo55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrNEKhSqafk3j38C2nf24dmpM
 BdmnFFeb/N5I5B/KPH3DU=
X-Talos-CUID: =?us-ascii?q?9a23=3A+kjdX2gc9FAG4UiaVYrvNXXRRjJubF3C8WuALFS?=
 =?us-ascii?q?CN0VSV/qHQ2HP1qB2jJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aw2APjw8KB4rz6ueAUyEKHiqQf8xOuPiLKnhVqJp?=
 =?us-ascii?q?cldembh12ODqe0DviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="124816976"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Un6Ea+ZZWP8TXe+RIm+H/mvs6bU8JCsdkppb+w3vS3YyhtNpfqkBXzLCac03thqvPYWdbKm+eKjyGd7Q/vuI/YICRkTjjP++0UI+j5E5PoZvx97ZseeWkzQUmlX/Dx2+OEwRO4OefCSzFLyC0uEs0q4vnkS1ayXe0SQ5AgUFGXfPaUDuNmCOaZneLzrMpKJttqDdMOOR7Q9jgqOFHCMXb2zRRxvWpAiMqNjY2hypwCJRxXHzps+6OEVVuLtj+MGDNJZqf+w+3qDlR3hFzWLPM/W2Cx5J7YrId9At0InkHhDPFFWnfTABuOcPgTaqXUKKEAjPnjrpKLXmWxuDAZgvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqQYB5GprqLA6zNhgwV+4qSeIntPqXWXOOafhMdSkF4=;
 b=XUhBx5jMh1BJPB+0WTjXYUFwzM0C+hl6CdLbT7ceo91W+eMd9JTSzp3EAFOWafErb2FcprhjXV8kLYCL9mr4CBrOGyI+blmAFRH4aMEq8Ir/nvRbTMjlNw2gIRTRYzpm5ZW94UQx4CBqOAyjGPjBP/3dsHCHBNTgEAhhLIhiAs5U5WQASK96a0aEOrIh44B3HeMNGvSTd9zhtbIKuGgsLMw9sdKe7be1qfgEWzU9gAdTHr6h1nkM44ULlfzPnbTeBTVuo46XCniRjGwCFFJwh0MonSG/kRmSTRBACcVrfiZQR2dqhuQX/pts4KepUklgoKQDiCKj4S/y0RZKkvfTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqQYB5GprqLA6zNhgwV+4qSeIntPqXWXOOafhMdSkF4=;
 b=SOCy4+v0XMwTvVWRIsJR1jhJ3+mc8dJAm5jcL47zYnIJvJ3Q94/+QmulFq/M9ymv148mLQl3yc0msOuWskBSEcod5g4qMg9fgEBxqjOv7xwPzWIGX65+XDWriQsb98vH7iBgHWZRCK/4lUtmW6kPRQjmjQs/Bv+zdebuQBkzpwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 04/10] domain: update GADDR based runstate guest area
Date: Mon,  2 Oct 2023 17:11:21 +0200
Message-ID: <20231002151127.71020-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0679.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::12) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BY1PR03MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 22aa39ee-72e6-4dcc-f001-08dbc359f15f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DmvnGK0WlALcSSf2igdz6yE1pPOFvUEpk5mTul6FpBoi/tcU+x6BD9/IKc4zB5fo+NG5g+rGEUiIOo1EQDB/OvCaaQsqXnis/QcUY1LAHFmLnlf7iVyp2ItODkZoE0010Eoo7khIRUao//Uug9DRLusmjBlIZU1B9eF+XXISZfnlFcxlJtDJ4pBp6gMGniYkFY9H5hEiB9XXmXrH2pg9nMH0wmPU+V7k2GJsuuErcxPxel2Ts3NPHkmmPlLz/iB2bAvy/Zdf/+H6xtpD7jpC6ZwJrQvLm4qguN9Dt7Vae/UTUEb28ojiale2yWkWsgpXQrbhCEo54wjMNGs9T61vnDrRBVYeuw4GjTPEd24jSKp8hQEkeLimPfidfToGzRmhPgzxq+FVHEba3Rzg+hTCn6N0zG3D2svFY83/5SfNbXp6MwpnJXFnD5Nn4MVqFWKa8D61GIrcdT80T+8jHt8x9JQyNq2C1epnjSCq978Ua7nA42QMrQ3EBo1S1KGtElIm2BP9vPJQh0yoFi/K2C9DhJ9NjqpVCzmNIcMi6U5mZ/s2yUeOfmp4dZKyHYzY3T9H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(4326008)(8676002)(5660300002)(8936002)(6512007)(7416002)(478600001)(6666004)(6486002)(2906002)(15650500001)(6506007)(26005)(1076003)(83380400001)(2616005)(66476007)(66556008)(54906003)(316002)(36756003)(41300700001)(86362001)(82960400001)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzdlanlHNmFmYnVpQ3B2eCtoR2N0Tzdrb092RHNmcmQ0UG9EaG9mOU9xNFRx?=
 =?utf-8?B?UG8wMm1XMENrWkR3algxN3FTRXF0cWdYeUdpaGJzbHhXTVFhMWNDZy9rZHpX?=
 =?utf-8?B?WGExYW1MY1BEOUdsQUFSZUhrdHlhRjVrd0NpZ2Y2TDFoOEtqeWNtVnNQck92?=
 =?utf-8?B?cGloMldoY2FCc0FiV0JSak83WWNja045bFdHTGh0R2RXelBsQ3AzUDNzTk14?=
 =?utf-8?B?OGprSWdBOUVldXZ3YS9YZFJrTzNLVmhUTEFtQ0ZQMXdDT3prdmRSZ2RzOUpx?=
 =?utf-8?B?clRNVSsxUWFuSUFDTm12cFJZWUNPU0R5SHRyZ0doSFQ4Y2QwejdscGpjQnlm?=
 =?utf-8?B?T1NpeEpGSDdvZ0Y2ZlB2T0t1ejJPa1lkS210Wm9jUFBiWmRrbldEbC90RnFM?=
 =?utf-8?B?K1MyYjExVFdReHJYK0x4cDNWcWl4TzNzWG02RmJvMHdrcnVYMnZpMlBRbFI4?=
 =?utf-8?B?WTJUc0NSTG1LOWx6LzZLcGF5WEppa1dCNTc4OTNzQmNUdVhlazhVZHRIL3RF?=
 =?utf-8?B?bm8vR2lCRXNackE0WE92azk3bjh3TVdZbjFBQzNlWjNDSjA0b1hrdDl4VnFJ?=
 =?utf-8?B?d2FaVmRxVXV2MEhMdnNwbElCQllkTmRlTkVJL1JSSWlTVG1mQVpaTEJXdWph?=
 =?utf-8?B?amp6RjIydDVOYzJJam9kOXJOOVg3M3BGSkZDeW5wbDV4U3VRSnc2MGtXdzNM?=
 =?utf-8?B?ZXc1c0tyL0RHRW9GYUJqdjdLUm5FWkF0N2RzcC83RlV1NVdyRzFid2REdG5U?=
 =?utf-8?B?dnp6RlhzYmVwR3dORW9xOVU5emZLU2xBTjhtK05XcGNGTlZiUEd5NG8zSWN6?=
 =?utf-8?B?MzNDNFFsWGNRaTAzQnhxaHpLOWw1WDJWM2JHaXYzNm1JWmIweWVRcmhPNzF0?=
 =?utf-8?B?Y1BFWGxRV1Y3Vmg5V3NlRWVzU0F3RktwcDJVTHRQYlNwdHBhNzlqVFluQlo4?=
 =?utf-8?B?TTVOdDJOMFVyWmlCUkZQYkczNzlzMGh1TkVLdFpHSXpTNjhqN2xYV0ZWVUVG?=
 =?utf-8?B?Mmt4emFpYU93eGFicjZyQWM2TUo2VEtBV1JJbGJlZmxPZnBQaEN0NmZHbDNM?=
 =?utf-8?B?LzBjaGxjOE8rRXpiRk9DekhrTmhENVRKNS9xb1JTdytNbVM5TzhjWFM1d2hD?=
 =?utf-8?B?aFc5eldSRkhnQ0FHNFFSZGVmempKRGJ6M0VodU43cE00UzVORXBBaDBldU40?=
 =?utf-8?B?SFU0MkxiT3Urci9DZGZCSDZkMFBlUXBVTS9VWjdvNDlKSXJDUExOclRicWpW?=
 =?utf-8?B?NEFqRmJGV2ZCQ3Y5cWNiTncxeHhkWVhtSU9HZGZHaFVzemE4bGlQd0hUcUlz?=
 =?utf-8?B?STdsb1ZpK3o0QjhkeFRCQmozUXRGcEFlN1dvcXA4enV1ZGpnSmJaY0ptSURu?=
 =?utf-8?B?TXFwejA5UjB5eStHb2N6OVRhR2J2UWtlNjR3QXMwNUUrMWFRS2dhd2NkdWdL?=
 =?utf-8?B?SjNQS2xsWDBvVGFMd2JGZXNjVEhINDkrcy9vckNCS1hqekFYOUFDa2I5M0Nt?=
 =?utf-8?B?L0VLQjNWeEhudTVWR2M0V2JNMVZraG4xYW5nMWZRcW5EWXdmcGVnV3dwV0V3?=
 =?utf-8?B?aUZVcUhCWnVnZlFnemlzczhmSzFONzdBbEZBTFk2NEswZXdMTXgwcldYV2pU?=
 =?utf-8?B?K1ZmS1A1V3pRQ1pBbEdyNlcxNnovdlM4b1dlSk4zS0NPeEo0MWNpUzlVYkhR?=
 =?utf-8?B?K2JkWEJ4OGY2dHF2MFoxcXovclNGb2FTNXRTclhSMWlrVmhzQ3JZM0hXMGNE?=
 =?utf-8?B?YkQxd0ZmVXB0aktSRStzMzVJRkNuVHdoMlZhNDZET2lUWFpVTVh5YlpRSDNU?=
 =?utf-8?B?ME93am5HZ0kxSDVqaVVhdnVmd005SWNpdSt1V0F3U0hIK0ZjalFldWVKM01J?=
 =?utf-8?B?ZDRtVEU2ZmlTNmVHOWo0akRJbzlWSW12Uzc5MGwyWHdvc3pWRTQvcWpKKytQ?=
 =?utf-8?B?dWRxU0k3Q1dzS2EySGpORit5UlJ5NFZiZDJhcEFGVzFMbVdlYWJKR3pMSVdM?=
 =?utf-8?B?Y3pRaVZzNGFkRC8wNTVDdThiWHR6NkhwV0hjMnhmUGhiSWNFNzBLNkhrcXBR?=
 =?utf-8?B?SmxKbVZ1T0JHRnpRU2pjcXdaZjVuU3A0dUZLcWJDL2tIbWF3U25lbXh6L2ZR?=
 =?utf-8?B?ME5GQUdmK3RHYjhqR2NJZDcwcVpwZVlaVWFmQmVyeGZHWjBJTzZRdmFVbXRI?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dn8WtYHC2WiqRKzT3MDtwP1UOh8aVAQjGoEYQ64ukoG66iamCohRBuhIQhxy/SlGnslH7tWKMElRcq55DTIhB1QJemeLEN2mX2O9v0CqWibLexFw7BLCc54ABHO/OPkMzx3VL2kYgKgXum17R80mABZgTRW2FV8ON8fsO6j7gVZwdziZF4452MfH9IWVNVocbJw3C4MtbXAiLfPqvjNDZBAE6y5TXHsVE3d+oAKO/dEB6BJfDEH4VaWYVXoCBPhLxO+Thi8BiYk2ld0a/FAq24bAc3DnVuGPjIY62w2K7w29PDMlGq7PvlzuaQeqqQJOpHpYO90vz08br7znE8EdFV6hgqvB4wKOI9F+yHoO3Q09MiwdE6FlvzBbKhPcT+ElfvVg05c/qYg+PrqmidahE1aZf+3pDKOSYQlQ0ssktEKOeVT3iIg1VUfl75qQVMghCgH+Or4EGRslXtoIck32PxDmkJkD7YWlc29FMePPdSeG2Yuwpd/IZsCLGmozw1YAH77EUlDwk+vzq4JUIrPU8kq/da2W4XCgKgtVfoDlOBiGu5jnFmfDuHLBWsILTi1NX74nqNT66kYBzWBDExy0dIG/ZubbqSGUUQk/09nGxZuNTTGGL0zgLsxvvI7i9XuaDxC27uxJxpQ+wEGQLLwZkn6/e5jx026CR/65BMcya05IfaeFGkC7P+C1PiTYEiYUIuM1Ebo11E5Y7A2xBtorRnmxyaUL6Lw4qTwMJioJk/hKoPqbi99cGalebtOsi2bFKjlfIt9aojeQ0NegpnD3UpMq44FYrRwdzhNXCx8GGTa4miAtMOh6+mwJbhlzDvEtlXjOVfh1hXnDl2ImT8ik2PEaAjhQPBLcS9mE0hoQbzA810z6uwyWaed683c5xxkDi0owXNPBgoNr50RHwsnhkA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22aa39ee-72e6-4dcc-f001-08dbc359f15f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:12:07.4292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjOKrg4T1TZvzCEIAyGpSoesmMsZUwI8XC5TVnMsMVCgOXjrPead9C0y+nJ9PEPfr0qv8q+1CpxxKobs++0+Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7261

From: Jan Beulich <jbeulich@suse.com>

Before adding a new vCPU operation to register the runstate area by
guest-physical address, add code to actually keep such areas up-to-date.

Note that updating of the area will be done exclusively following the
model enabled by VMASST_TYPE_runstate_update_flag for virtual-address
based registered areas.

Note further that pages aren't marked dirty when written to (matching
the handling of space mapped by map_vcpu_info()), on the basis that the
registrations are lost anyway across migration (or would need re-
populating at the target for transparent migration). Plus the contents
of the areas in question have to be deemed volatile in the first place
(so saving a "most recent" value is pretty meaningless even for e.g.
snapshotting).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/domain.c     | 43 ++++++++++++++++++++++++++++++++++++++---
 xen/include/xen/sched.h |  2 ++
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 76a4c2072e10..d4958ec5e149 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1644,15 +1644,52 @@ bool update_runstate_area(struct vcpu *v)
     bool rc;
     struct guest_memory_policy policy = { };
     void __user *guest_handle = NULL;
-    struct vcpu_runstate_info runstate;
+    struct vcpu_runstate_info runstate = v->runstate;
+    struct vcpu_runstate_info *map = v->runstate_guest_area.map;
+
+    if ( map )
+    {
+        uint64_t *pset;
+#ifdef CONFIG_COMPAT
+        struct compat_vcpu_runstate_info *cmap = NULL;
+
+        if ( v->runstate_guest_area_compat )
+            cmap = (void *)map;
+#endif
+
+        /*
+         * NB: No VM_ASSIST(v->domain, runstate_update_flag) check here.
+         *     Always using that updating model.
+         */
+#ifdef CONFIG_COMPAT
+        if ( cmap )
+            pset = &cmap->state_entry_time;
+        else
+#endif
+            pset = &map->state_entry_time;
+        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
+        write_atomic(pset, runstate.state_entry_time);
+        smp_wmb();
+
+#ifdef CONFIG_COMPAT
+        if ( cmap )
+            XLAT_vcpu_runstate_info(cmap, &runstate);
+        else
+#endif
+            *map = runstate;
+
+        smp_wmb();
+        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        write_atomic(pset, runstate.state_entry_time);
+
+        return true;
+    }
 
     if ( guest_handle_is_null(runstate_guest(v)) )
         return true;
 
     update_guest_memory_policy(v, &policy);
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
-
     if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
 #ifdef CONFIG_COMPAT
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index f30f3b0ebeab..6e1028785d8c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -232,6 +232,8 @@ struct vcpu
 #ifdef CONFIG_COMPAT
     /* A hypercall is using the compat ABI? */
     bool             hcall_compat;
+    /* Physical runstate area registered via compat ABI? */
+    bool             runstate_guest_area_compat;
 #endif
 
 #ifdef CONFIG_IOREQ_SERVER
-- 
2.42.0


