Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD9757C13
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565176.883090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk3m-0002Sk-3l; Tue, 18 Jul 2023 12:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565176.883090; Tue, 18 Jul 2023 12:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLk3l-0002Mw-Ve; Tue, 18 Jul 2023 12:44:09 +0000
Received: by outflank-mailman (input) for mailman id 565176;
 Tue, 18 Jul 2023 12:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jt=DE=citrix.com=prvs=5561f9d71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLk3k-0002IP-5j
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:44:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6d744cc-2568-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 14:44:05 +0200 (CEST)
Received: from mail-mw2nam04lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 08:43:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5317.namprd03.prod.outlook.com (2603:10b6:610:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 12:43:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:43:54 +0000
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
X-Inumbo-ID: c6d744cc-2568-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689684245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vXSrjScc4stYZjmMBMkswDIFJ2P93wZXbU9NQNneoJ8=;
  b=F52PhCtIoC3KAHeCPnwmcqQD8JGcRBT8bMvw2UcvJQJnE7TqMI6S/pxn
   FZLyEDGqms+NRqeahOpqo1v/qyJ3IfDqkcp2xiwdpVj1ssgP+j/ERmJ5T
   r00fjubUJKU+B7peJP537W47SpUYiXW16nNOe503im9uI0Tq+ACYZiJMn
   A=;
X-IronPort-RemoteIP: 104.47.73.172
X-IronPort-MID: 115292209
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0G2DL6DpdZGfShVW/xXiw5YqxClBgxIJ4kV8jS/XYbTApDgrgjUEn
 GYcW2DUbP/fMWGgKNp3Ydyxp08FuZLXmNdgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxB7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9NxxGG1Lr
 q0iNxstRDyjn8OGmrekRbw57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvDK7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqy/217WVxXKTtIQ6EeSIqtxHmXiv3DYpNkAVaEaY+9qXhRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnp+XoC2zP24JLGYETS4CUQYBpdLkpekOYgnnS99iFOuwkYfzEDSon
 zSS9nFh3fMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswKByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:6XV+RqBjTO7IerXlHemG55DYdb4zR+YMi2TDj3oBLSC8cqSj+/
 xG785rsiMc6QxhIE3I/OrqBEDuexPhHPJOi7X5eI3SOTUO21HYV72Kj7GSoAEIcheWntK1l5
 0QEZSWY+eeMbEOt6fHCX6DferIruPrzEniv5a5854kd3ASV51d
X-Talos-CUID: =?us-ascii?q?9a23=3A9NchwWiOtXSLtn2/psmRfYw/9TJufEfb1XvVeB6?=
 =?us-ascii?q?CFk1JYpG1UX6goqZ7nJ87?=
X-Talos-MUID: 9a23:biDFUQuHpxlgBtxPUs2ngWhSaOVF+oGSEho3r8gFhtSnbw9eNGLI
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="115292209"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDXOX7TtFSkifTo0kBLSqHcNlNKY8CcolHXSvFpDQLIMDooRajsE2nxdicim01grsyYOC0NvMZLl++M9gpDZIQ8JyAN/FXZ0ct6BGF2LCHoCJtYjNeED1bjwjVnPnGOp/Trc+WapeQzaj/bG8pXWa3+99AS/UD2yAiIZxcu2U+E+WcSN0ex0n89bL0WGigP8pW2vSVNikNByC+2uUBrfbhPvZnqblbgbCtwIWZcTzkKSL7tisXwJVrKo/wSt36Kq1JrpwOHL3NC7Bfaqmy6V+u7Xz61K5iPOawchxm9j28bqq5962bPbqn4DUjlAFfH58vEnuJfIbH377WGfOHYzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vw1gRyZwe4JBxeOfmYftsFVgq9VUuHpZanmEFCLtcvk=;
 b=dkoR00na7YFZNzaVQxZT7G72BXhNNUjI+jwjmBDv7q1Yaky+GMW3W8iv2g4PKhx2cBaTzdDca7aHemqJg3ILTveC7YyNbLegFs/La1fxz3WDzeG9jbKvQAKgymq9SB9596lZ3ca+rMd2x4hkb/WhDurRI2/3AL4VNnPIGBdO3njXPRDXdLCEiukESLi3hIi8K1OKPzXLg8+WGwl2himXxcpUWabD9+/lngH5DqdgwrbrDWBDEY1BLkZgAWrBJ+PiC0JkwFXkT7/PeKXatfipd9NstIgYnsM6xYNz9n1KZJK8Bu7005UXzFLM6L8KB7NfejEjH8M+eBRDxmxQGstQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vw1gRyZwe4JBxeOfmYftsFVgq9VUuHpZanmEFCLtcvk=;
 b=u98aMxQWVUxx73FDkgg1jK9mLnW2JA5G70us1tK7mBpTRH+ngmNNfEkL4Xh4RJ39pbCSYWXoqcPKOQD9C59q+NC0h0wX5ulrVgq1gx8sYuVxrjRFJdVcgxXbyBWv7QWlf8OZ9UQOa6ch38fR7MuIrwAsQakE67WhWe8ygX31ZEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 1/5] x86/ioapic: add a raw field to RTE struct
Date: Tue, 18 Jul 2023 14:43:30 +0200
Message-ID: <20230718124334.36548-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718124334.36548-1-roger.pau@citrix.com>
References: <20230718124334.36548-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d16aa5c-ce59-4f06-14e5-08db878ca587
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	daRqWS4XeaatqH4m54Z1HGB9fvjpoWTws3l1TAe+tO6umm/tZXhAKXk7mFtZqnVGRunMEyYxkhUsPdYXoKbnmhEoQ3OV+qTGBJpo+gZBGnuWQXp0z6K3nPEqohWcSNyHI0mR0UR13As8rHIMJlv8rnKETjmbncUgxymuYTyq1RzoCKkeAamav7N+eTZzoicB7mjP63u0mHBJjjZ7J/bXoKa4SWcS2iEOkbRw0XekyRwNtBVKOJC5IsYDLYsqZ2k99JhxB0C9hpv5fnswvmxGQT5q8sLYB3bzKSvCkLQcpu6p0eHKAUA9LY/VoPAbEUhiKkI9lu6GMUm80yALOqOVncQz/LZkx8p4dyHL2/hiunKaqt4buRPY9FFqOCsyulz8Shj9XbGyc8LAntlZNXirKT1Z6/7g6Fnk20s0XmfRGPPblvzSncHmxOdTl2DjwHprje1N5gdh2owRorvK7wrnxlp5twgikvWdVjc+V1QmifDhPDsUrIP2sIPA6exxiEHInbFnP9asDOMTFS5VYR4Ugr75jzPd52JfbATev7u9y16uSUNDSZXtRq/s12+ZVF8t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(86362001)(2906002)(36756003)(186003)(6512007)(38100700002)(83380400001)(6506007)(1076003)(26005)(54906003)(82960400001)(6486002)(6666004)(4326008)(6916009)(66556008)(66476007)(2616005)(66946007)(316002)(8676002)(478600001)(8936002)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1NpSzY4TzdPM3RiMUIrWm0wTDJvbUMwN3ZIeXRTZTRDK0ZDT1VrZkZOTk45?=
 =?utf-8?B?RWZZb3pCTlA2QUpudGY1WElPUTd2YlowZVRObU9yS2ovYUNhL1FqTEx2UXU1?=
 =?utf-8?B?d1h5anZkc3IxNzlDcjQwOHdoOTZ3ZllHclZEN2FEVG9tbmtpVkZaTHdlcmdZ?=
 =?utf-8?B?aElKYU0xS1ByWkhJMlgvaU5GOThMT1N6cm9YdFY1ZXVXcE51N0ZYMnBUeXhr?=
 =?utf-8?B?aUVTUE5Kdmd5VnhvZFZLNUNxNHBxQUErUEhzazhuME41c0VjaDJKSWRCSDJi?=
 =?utf-8?B?cFpud0E4eTllWDFEaGt5Rk80bkdLMlFJV3gweGtQWTQ1cmdyL2ZkeWRlbVU5?=
 =?utf-8?B?YVFhSWpxN3FMdjlmUi85OTZHYTA1b2JDazQ0NWJwbC8wMWFvS3g5TTNJWWNS?=
 =?utf-8?B?bnQ1UGViZVBmZHlkOGNTUTJ5YWlzd0VkMlRoSUd2eE1HdTdGaklpa3ZLTEdJ?=
 =?utf-8?B?bUhib2Fhc0xtaWd6T05Ga0dmQU9lRWp4cnRobUMrT0FPazFla1dHaVNpWXZ2?=
 =?utf-8?B?aTNIdXB3ZXJJU0RGM1R2WHQ3ck9naG9iUWxDYUJmdCtIc3VWTDcwMGcxcjFr?=
 =?utf-8?B?cHRhK01XTWdIUXpsaUFsVDV1c292TmF4M1AxUXJoU1lKb0dYZzE0c3Z1bG1D?=
 =?utf-8?B?S0xRQWp0aWVpQXlkM21McXVUSHJUeTFqdCtyV2ZtZWtBVjNYbjNXWDRSOU1H?=
 =?utf-8?B?U0QzNE9Yd3o1MVN5MUZvOGIrVDhtS3RYTFlOckhiVHZISStIWWN0YVpyQVFI?=
 =?utf-8?B?Zm9PbG9DcWhweVNZblRKd0JjbzBmMmlWQUo4cUxUcU9MS3pyYmlBcjBvTTF2?=
 =?utf-8?B?Zm96bHVVL3lFWmdKc2NGekx4NUIxT0pXUkk4ZkVlUHRyaEQ2KzhVTG5VVDR4?=
 =?utf-8?B?SEVkRUwwVkRiTzlPaS9ObWxwYkpyVHdqVkN0cDBEK3JTRU5HdFZmWG0wODhi?=
 =?utf-8?B?K0xtUHBYaHVNL0FKVTFEd1RzQkh4UmhRU05UK3JrYkNtVm1lUUZMM1RES1Zp?=
 =?utf-8?B?ZVg2RGdHTHZMd1BsUkY1T0NQeXowMkF6R05Zd3hvQWIyQTdLTXdzNFA3VlFi?=
 =?utf-8?B?UDIySFdmbVUwYzNnTnBOdk1nYXRpZURDbVVBZkd5WjNEdTAwb1FVRjM4NmZ5?=
 =?utf-8?B?aXJ6bUxldjR3djdxaDNCZFBZVWg1NkRKdjdFTlhoZW92UDZtcnZTYkhBc1hu?=
 =?utf-8?B?MGxCakRUd2VYTlNjUXNZSFFPcm96TmQwTG42a0xXM0o4Z1RYMnBBY0xGeFRq?=
 =?utf-8?B?SXAxbEtoQ1d2ZzF1NkRSV3lBM0VDa1pLSE5lbm90RWJIbUcxdnpKWCtHWmJv?=
 =?utf-8?B?K2EzRkNOWVYrLzNQTXkxQUE5NWZSL0FVL1gvbjFBRGo0a0d2b1l1WmgyeElU?=
 =?utf-8?B?YUJvbFdFV1V0aUlZRlJwTFd5WlY3ajB6NjlNRlZFcWFpUjZVQ09OL09rYUFX?=
 =?utf-8?B?OGhUazhmUnZ3UGRFUEpteTk0bWRBbFNnK0Y0c05JeFQ2QU5pNjVPc3R3S3Y4?=
 =?utf-8?B?OEY1V1ZjeldjVUQ1Mk94TmdTM3F2Wm9OZCtZZG1LSkh6czR5UTllR0JMNW5L?=
 =?utf-8?B?Mi9BRmNrVlNVUlZYL2g3QVRRdlVLc1FMU0t0TzBjenh3NC9MSmhCOGthaEVE?=
 =?utf-8?B?RUsrVWcxamE2YmcrcTE2MVkxdWwwR25MUmU4cmFwc1JLdFF4Tm9NZUJrUVpw?=
 =?utf-8?B?OHZjMW83eEt4WnpTb01NV0pvcXBacVZaUXRlNDVvTzA0NmwrMUlRZ2c2ZDlx?=
 =?utf-8?B?cGtYRDlWUE1zRFpKSUZSYW5uMkhSaDhMV29yOEVQTDk1M0ZzbVlkdDJrVm4r?=
 =?utf-8?B?ekZjTWVaUnRwNmNGTnphaTVOMy94ancxUnpueFZKd0llZ2JsTGtSZGpiWS9y?=
 =?utf-8?B?M0tLNEI0aDlhSmZRVXQ4bVZaMG8rQ1RjTEx6eU9JcFk4MCtqYXk3NjJrM3Q1?=
 =?utf-8?B?UnhRNEtreHQyZmZzUXdVckI2cWNBaklLOWFuMFRSL1owcW5EREZvYXZ2ZjJ0?=
 =?utf-8?B?TzhjVkszVndneHV5eC9ORWpIZTd1VmxtYWlvVnZ0Z3pVbXBGL3RtL1NaeWUz?=
 =?utf-8?B?bC94TkxURGdUc0NmcVpxNmFxdnlWUkNoTUVGZFZDUlFxdzExK1BaTVRwd2hJ?=
 =?utf-8?B?UFVHTWNzbjdPOG5yc3dxUnZhWTk2YVNDSlhXQWhPQXNGc2JnOGlVNmwzODIr?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WryD50bkUU1F0R4Rp+y5+i9xwcuXsOK2fbH2WupezntURhWIqgY7vr2CjsKsEZSIgEajZWzeO1Kya75w0gfjrO1+01r1mzl9kw1D4WbiC+EuC0YXkR+varbVS6yaUeEbMHhgnoqgcADHrrGgwY6srnTsTaUfcrAAUSyVLaIsiLwZIIOra1oyxgD1XbWhrbr+GIVbCOm+djMkfsbBDqWewJuhdl87wt2Max4qWcn1ECAJGWtosLyTBBHx139/wlXBKrc+9IAKSTR0oMmbWg2bJ+gNyo1H7efsuYD4EU+dMgVt3EM4I1/rG8e/EqhnjygNoYAK04yGWnqN54w4c8SwENBUzD21w0fjeXujcmwTiVgzV3JvBsfLG2mu1NNzmNDz4tUxIITqMvX5QATRmQHCCQiSfItpP15v7+GHTGq/Cmk05PEAVTgRDvoB+UNKM8u6nRMKHPzT+57pLrHGD5vpbVmHulkjdx5pJwnYShri3iKK+wdsz27DVv2KluLRIyKNvNZKWH3yicvarhECgDz2jdf+cH5eAfaKaxLjugw2oh0lK0SFP2hfDa5bfD3UEK3OhODNIZYg3Pg7GXu2q6Sck760eCE3o/UkqmnjDQBKy3tpQ7DkXukOU/zfIl1ydYZiuWy5RpWIjayV2QLJUOR21JoPd/sSxBBpYqr+FR/RMvbU6Poz9Rn6SXGHBWVrL6yChLzSdKqZY3vsbsxwuBnILgkfdTUzhgOhGQHzwsE4hvYH1MOs7/7Cy6QKm+978koYBFL/V3+5gXL+yrq60itCUn/BJmRYC8WNMzHnLBa9N6DgaKz2upgUqALpXfGltlL0V6BV8GgxmchefoppPRK19wvTTmOXu+bVjytd9oxv4VI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d16aa5c-ce59-4f06-14e5-08db878ca587
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:43:54.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfQu1GSpfCI5N1cDc4NULRHlzOqP7x7+t7k83QFMQFGmJkEB+e/DE4LqlGRwcntC69i3BTaJd//d6Lyn2261yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5317

Further changes will require access to the full RTE as a single value
in order to pass it to IOMMU interrupt remapping handlers.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Fix initializers.
---
Tested on gitlab CI, builds on all compilers used there.
---
 xen/arch/x86/include/asm/io_apic.h       | 57 +++++++++++++-----------
 xen/arch/x86/io_apic.c                   |  2 +-
 xen/drivers/passthrough/amd/iommu_intr.c |  4 +-
 xen/drivers/passthrough/vtd/intremap.c   |  4 +-
 4 files changed, 35 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index bd8cb95f46b1..4c4777b68a51 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -90,35 +90,38 @@ enum ioapic_irq_destination_types {
 };
 
 struct IO_APIC_route_entry {
-    unsigned int vector:8;
-    unsigned int delivery_mode:3; /*
-                                   * 000: FIXED
-                                   * 001: lowest prio
-                                   * 111: ExtINT
-                                   */
-    unsigned int dest_mode:1;     /* 0: physical, 1: logical */
-    unsigned int delivery_status:1;
-    unsigned int polarity:1;      /* 0: low, 1: high */
-    unsigned int irr:1;
-    unsigned int trigger:1;       /* 0: edge, 1: level */
-    unsigned int mask:1;          /* 0: enabled, 1: disabled */
-    unsigned int __reserved_2:15;
-
     union {
         struct {
-            unsigned int __reserved_1:24;
-            unsigned int physical_dest:4;
-            unsigned int __reserved_2:4;
-        } physical;
-
-        struct {
-            unsigned int __reserved_1:24;
-            unsigned int logical_dest:8;
-        } logical;
-
-        /* used when Interrupt Remapping with EIM is enabled */
-        unsigned int dest32;
-    } dest;
+            unsigned int vector:8;
+            unsigned int delivery_mode:3; /*
+                                           * 000: FIXED
+                                           * 001: lowest prio
+                                           * 111: ExtINT
+                                           */
+            unsigned int dest_mode:1;     /* 0: physical, 1: logical */
+            unsigned int delivery_status:1;
+            unsigned int polarity:1;      /* 0: low, 1: high */
+            unsigned int irr:1;
+            unsigned int trigger:1;       /* 0: edge, 1: level */
+            unsigned int mask:1;          /* 0: enabled, 1: disabled */
+            unsigned int __reserved_2:15;
+
+            union {
+                struct {
+                    unsigned int __reserved_1:24;
+                    unsigned int physical_dest:4;
+                    unsigned int __reserved_2:4;
+                } physical;
+
+                struct {
+                    unsigned int __reserved_1:24;
+                    unsigned int logical_dest:8;
+                } logical;
+                unsigned int dest32;
+            } dest;
+        };
+        uint64_t raw;
+    };
 };
 
 /*
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 25a08b1ea6c6..aada2ef96c62 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2360,7 +2360,7 @@ int ioapic_guest_read(unsigned long physbase, unsigned int reg, u32 *pval)
 int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
 {
     int apic, pin, irq, ret, pirq;
-    struct IO_APIC_route_entry rte = { 0 };
+    struct IO_APIC_route_entry rte = { };
     unsigned long flags;
     struct irq_desc *desc;
 
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index f4de09f43180..9e6be3be3515 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -352,8 +352,8 @@ static int update_intremap_entry_from_ioapic(
 void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int reg, unsigned int value)
 {
-    struct IO_APIC_route_entry old_rte = { 0 };
-    struct IO_APIC_route_entry new_rte = { 0 };
+    struct IO_APIC_route_entry old_rte = { };
+    struct IO_APIC_route_entry new_rte = { };
     unsigned int rte_lo = (reg & 1) ? reg - 1 : reg;
     unsigned int pin = (reg - 0x10) / 2;
     int seg, bdf, rc;
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index b39bc832821a..786388b4d9c7 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -419,7 +419,7 @@ unsigned int cf_check io_apic_read_remap_rte(
 {
     unsigned int ioapic_pin = (reg - 0x10) / 2;
     int index;
-    struct IO_xAPIC_route_entry old_rte = { 0 };
+    struct IO_xAPIC_route_entry old_rte = { };
     int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
 
@@ -442,7 +442,7 @@ void cf_check io_apic_write_remap_rte(
     unsigned int apic, unsigned int reg, unsigned int value)
 {
     unsigned int ioapic_pin = (reg - 0x10) / 2;
-    struct IO_xAPIC_route_entry old_rte = { 0 };
+    struct IO_xAPIC_route_entry old_rte = { };
     struct IO_APIC_route_remap_entry *remap_rte;
     unsigned int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
-- 
2.41.0


