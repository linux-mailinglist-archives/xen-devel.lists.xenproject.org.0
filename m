Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D185751FE9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 13:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563102.880081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJuW5-0005PR-Vb; Thu, 13 Jul 2023 11:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563102.880081; Thu, 13 Jul 2023 11:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJuW5-0005ND-SW; Thu, 13 Jul 2023 11:29:49 +0000
Received: by outflank-mailman (input) for mailman id 563102;
 Thu, 13 Jul 2023 11:29:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8fBF=C7=citrix.com=prvs=5514777d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJuW4-0005MS-3g
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 11:29:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9090ced7-2170-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 13:29:45 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jul 2023 07:29:42 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS0PR03MB7289.namprd03.prod.outlook.com (2603:10b6:8:120::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 13 Jul
 2023 11:29:40 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::e14d:fb6d:9e52:1524]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::e14d:fb6d:9e52:1524%4]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 11:29:40 +0000
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
X-Inumbo-ID: 9090ced7-2170-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689247785;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LWZZBM7HeLS4oc/1CRaZGm4FijTun8EAKlPY/GC7Yn8=;
  b=a2HLp6fQQVWMFc9x5T6NqB8v8dK6Q1nIHUGdufL10L+4/HgbFmBGI8KA
   FCVgIhSt0yF6xThpPCEPrSqTKGRsAE28hwmScagoSzuyjE2/9RyIE9Fjp
   9nxKD16sSjxzfl7gHZOqfQ7qPqLwQNnYEnE6DlLKkBbD83qyF+M4iKXnF
   g=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 116109084
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oHCuEaNBP0DQqffvrR2DlsFynXyQoLVcMsEvi/4bfWQNrUoi3zMPz
 2AdWTvXM6zcajakc9B1PoTk8BgGvcDRx4JrSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tH5wdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t0qOT1F9
 /EaETAqQAyOhe2MnKmxSNA506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyvy37eexXOnMG4UPLS889opnE+z/DQsLAZPe3ibrqKjg2frDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoIY38CRA5cut37+tht3lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:vIRWUa03YiDPvhC0nOgN8AqjBCskLtp133Aq2lEZdPUMSL3hqy
 ncpoVh6faUskdhZJhEo7q90ca7MBXhHPJOkOos1NSZLXnbUQmTXfhfBOLZqlWKdkGQmI886U
 4KSdkaNDSENykcsS+M2njdLz9P+qjkzEniv5al854kd3AWV4hQqz5jDACVC0t3QxQDK6YYOf
 Onl7h6jgvlQG8QaMujAHkDQqzknP3k0LzbQTNuPW9V1OGp5QnYnIIS1yLoqyv3eFt0sMsfGX
 6sqX2H2kyMiYDE9iPh
X-Talos-CUID: 9a23:OHFKsm6+wWAQcEFYrdsszxMsRssnf3/kzFD+P0K6Blw1U7eXcArF
X-Talos-MUID: 9a23:Mln/GAZcAGU+CeBTvjvpoHJ+JudSu5uKExkjsrUJ4NONHHkl
X-IronPort-AV: E=Sophos;i="6.01,202,1684814400"; 
   d="scan'208";a="116109084"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGKGT0CPbEEgcKrtSR5HXCZRyYy/yMlmngXUTs+lPq55MN728DBHBp0yKkX9/k7Hi83/0LlF4NtdJRwlyCn1fqr2YoVt1Zd/QCEBig6BYFNPU2Z5s4/am+ksT70r40YMgBRZHds2kVJVKbAyk/y7ETvtmWWbcTK6zp0AleGrP8BCXAmfLGGTpkMsZIdazyCaB0+1yhYyWPVkW11SQlEKrdG30XQXQpnAM6VOInOtbMrisP9EJOG5fzwRKVAyb/HPGccDCP7GK7IbMXiDQ0y0jv1aldCEmOxZhpg37ZbhVGL/idHhXNJ08+6ETyoccGyWgwhFPx31NUBc4UdlVHyIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSS7ygLTprxq6xSYbXjCyWXIMAU+wteSYsFZ4WKt2Bc=;
 b=PGKygkJaefJJCNeALiHYtjGempr/5ZFbpfJIXRIaJo+Pra7MUXfXmXeWGfzPzyPu9ZFjEbb681Wz9aBHaiWqjoFtSN9wLedGhgfx6w0Uqc6WOFtqbonr0G5YCmXQ19ya31mOFkxDor0TgMszEg3Gv8kSuWaxvFReB+j2W7WdNHdSRacDpDjrVdrAvEsRrq52SRR0ly7pUhLkz+Q6Dg6RxanaXmip36naNjkRZ5TqHNwqxMDQhHFVZIdpJYAV3drwnaN7F1YGFuOmkpEu1hVauwrAj646QlzPX32VnNoZ0PrMIrnTSshhtzlqTjrcjEj90rO0+IO45uZsoLLekMEGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSS7ygLTprxq6xSYbXjCyWXIMAU+wteSYsFZ4WKt2Bc=;
 b=FQ6QMKLfDUQeeRgQkpcwSmU9VOJfNNFvAhq19CqsX+RG/NYyNLQLu188u81CCNUXg5peb2RPMTAxZdXpUtCcQVsJtIdVv1uX2Z3AIrDxHH13tsLMIqx2AJPl2BFRXrNLc4lQK9qea4nlVRc7lnHB9ir0vuL5iMXe8rYh+b2QvpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Jul 2023 13:29:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Message-ID: <ZK_gHltq-1se3fau@MacBook-Air-de-Roger.local>
References: <20230707095338.44244-1-roger.pau@citrix.com>
 <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
 <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
 <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
 <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
 <ZK7JwEhrB-70nlla@MacBook-Air-de-Roger.local>
 <6d0ed712-0807-33b6-1586-a0588086c3a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d0ed712-0807-33b6-1586-a0588086c3a7@suse.com>
X-ClientProxiedBy: LO4P302CA0039.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS0PR03MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 6534b019-846b-411c-27b2-08db8394722b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DsCZwohCtLJyKTCkbCB0Bp+vVURcQspdiUuHDGS4JlyyeMR75N+1OAyr67ih7ss3tXom4Y06q8iOOgwuTdut61rOpt+3bfSEPtIdjfydOYQUBmbOfBJ3p6Mq4jsMhEj0nWORJwiBEcvH4f3OyvndrAbW60hNIOISTUU1WMPPDdlsFAo6uBlatjOfquLuU8DVj9NRJ8y08rqdIr/oPiRXMWP9QlNO115uC2YjQ7ypkheFwaCrT9DqJH8bEG+GxnmJosJYT7nxRaXTXTCxRmxZv2dumrBuAqIk0hra22LfsQ4cYsbLIBQ07OoNfFilVhMNAiCzeCBCIC8/qL/pn5bCnoIS1WhFJxPK5+8Qm0z3xsMkPtWozXgXTxxs623r9YnvLJAvAuOSXpNBNVnTEgXg1STc5ncjxBwO/U+YdsBJROgCVXw11cNM3sIYvf0fjzZICnsxmf71r0yjvzyk8KpFlJbkL0SvYwkzOeSfYxqeItuJQvDhdTOl5o5qjpHOSEv6Un0gLtfduUimBwBnO4n7gTNoccqWHtoxZ+LEV8nNPa6tRv2372A7QQ0qG5WapJHw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199021)(86362001)(8936002)(5660300002)(8676002)(41300700001)(38100700002)(316002)(2906002)(66476007)(66556008)(4326008)(66946007)(6916009)(82960400001)(54906003)(83380400001)(6486002)(6666004)(478600001)(186003)(26005)(6506007)(85182001)(6512007)(53546011)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTd1eVArQjlDck5PVjM4bVZha1ljVjhSdmdJNW15QkxBRjBrME51MFlQNEdJ?=
 =?utf-8?B?bEJ2dlA2VndQMXpzSy9hYklLQVp4UHFRbkVuVkk5aXVjLzNmdUUyOS93M3JV?=
 =?utf-8?B?KzRZZS9ERXJ2c1g5K0pCYkZJUWxWdWcraWl6Q09WNWNITmZJblNiZkJxQStM?=
 =?utf-8?B?RUl6TEd1K0tFSldnKzhoalgxSWVnY20zOEw0MUxXTTNFVHkzcElRdmRBdHRS?=
 =?utf-8?B?UEtkVjE1eEg5bXlGelZrZXo4Y3ZkNU12T2ZXcFFsZXh1MVVER0hMcE9jN1Bl?=
 =?utf-8?B?RWE2NVNBc1hMdGhBQUVveWVyUGd2V1Rub1U0VHlmVVRXRzdMREVSdUFhOE9Y?=
 =?utf-8?B?Q0daeXRGS2ZwTjVaY3hUYVFFYjgvRjQ3bFdTc1d1OEpKazMxek5HQmxEdngx?=
 =?utf-8?B?MlJwV0RLQXhKUlpSSU91NUx3ejBJYU1TMHhnaUxERXowYzd0ZVpnSE9NVWky?=
 =?utf-8?B?RG5DWjR0M2I3bmtzbVNxbVcxZ0lEdnd6TDcwNXd0Sll2Q1dhbS9vKzB1UUNX?=
 =?utf-8?B?V1RhNlpLNks4Rms3WWpWMlEweWRodlhranRsczNGdEt6MG1nK2FIMFBBc0Uz?=
 =?utf-8?B?WkR4bUJuVGVZandOd2NxSVJQV2E2U3dCS0JhMWluTGxIWFJKY3dCQ1lnTzB0?=
 =?utf-8?B?dk5DMmI1bkN5cmZzd29ObU5rKzEvR1VpeHQ5c2xYK2dwU3NjRkxva0xGcWUv?=
 =?utf-8?B?NFptSzBGV2tlQjEydTBwYlZ2UDdEZnBiaUFEWVNCVzVpMVdFSVRmZzQwYjRN?=
 =?utf-8?B?QzUxc1dhNGZTWS9VRWVKMXRXTjBwcndjTEJtcnVjZDFUMkkrS0VRLzJuMmdF?=
 =?utf-8?B?MDVFN3BYOUFoU3QvamJFb0NqQVRIZEJQY0hETHI3SC9WZkZRU1djbnlWdEE0?=
 =?utf-8?B?bmFOR1VHbDRINmNOeUo0U0ppcEF3VHBmZlgra3VuODRiYUV6N2FmQ2JOeTQ0?=
 =?utf-8?B?S3FVdXcxNEhWaDJnUE9JSVI1Vi84OVFPdzZkc255SUdwazk1UnB1Z2crS1pn?=
 =?utf-8?B?R0UrRmhhYTQ4cHd2OFVGMU1YVmtlek14dlI1UnNReUlzNzBPREpLYThLTngv?=
 =?utf-8?B?Wm5aQzNRcFB5aXRSU1lra0VqM3NpdU9GY0tubFFvU3ZnWS9SY3k5U0RKTENJ?=
 =?utf-8?B?RER4RzE3Q1dVeUNoSzJvd3FDbFhEb3lJbG52c0JxK2JDOU9LVUxIWG9vMlkv?=
 =?utf-8?B?MUtKVjUySTdCYXdsMEFCSlEwNDZLLzIrR3VQYWFGZmdXZzVraUpheDRoZ3Ay?=
 =?utf-8?B?YlhDMjV4VXdZa3Y5RTIxRDE0Y3U1SFZoZjBpN2laeU8xSXdCSm5aQnhNK3hT?=
 =?utf-8?B?enRRVUZRT2hIaEtDTkxWWHJKV0pseFVwcER3emZNWStmczR3aW15bk9wYWc0?=
 =?utf-8?B?R0FZb0x1UmZXN0owN2owV1h4WFlMRUVlZW5HOFd6SVE4eFZNaDJtUHl0QWRR?=
 =?utf-8?B?YXZMZ3ZKcXBNZkkyUHRZYmJlU0N1NzZTNUhVNGxzSEkvblIva2ZORFNGVi9P?=
 =?utf-8?B?ZWt4N09DNjVSU0xaeDkyQ0VPUlhkV1lhd2xIQ05INHhVK0REQ2Q5Tnk5RTNY?=
 =?utf-8?B?czVTTkJmeDNJK3hTRmpTNGpuY21lRnZQekNoajlIUmRaTVREN3hkaUxoQ0FE?=
 =?utf-8?B?OHNXRFRwSGx3bklHWElab254NW8vbmY4emxTalVldStBVTBSWDZJTnNSQ3pz?=
 =?utf-8?B?VHBwTEVnTnVmL29sOEFxZm12eXo5bDMyK3BlNFlRUWxvRUx1YXdBdHkvTHZJ?=
 =?utf-8?B?ckdXSW1pK0xHdkFJemk4QXUyVFpCdlc5UmRjREhSenhLUzlFUDZBbWJMOG9S?=
 =?utf-8?B?elZncW9INkFPZTZZNGdwaUQ2NTcyNi9JSnBNTDIreG1PRWJLNG9scHBqOElH?=
 =?utf-8?B?WkF0YWVIM0JqSG9jL0xwZUZmeXVaMVhjMUd3enk1cGJtY09zdm1SbXlHS25j?=
 =?utf-8?B?NEZpK2Z5QTBONnRPNkQ4WGVJVEsvZ0hxc0NnRWlGNWwxZEZMZUF5K1ZleURB?=
 =?utf-8?B?Unk4L0xnQS8rTm9pTFgwa2hMSkh6dThuK2ZOMDhxYmhpY3YrZ2V6VnFWSHUx?=
 =?utf-8?B?UFJ6bjRzTklBeHBFazNtSTAxRUI0RDZTVDJmaytucG1xZ0FUTkxQa3lPMGtp?=
 =?utf-8?B?UG5QdGdyREdxV0tCaTJUdzlFZmk5dERmRFVJVFVQVklxKy8xWWJUMXBOa2kz?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rH2n+PGBiAlsD+D01PuC0LGN+wcwN1lpC+3GktHzxa/nWv+aj2ltvfG2GGyefpcJu3XkuxD3wB/ATo0SWjAXlVBdiwDpX5BkzkhIne+bPGHC2HF6wFFpfQ9emhUUt3v2PfWeETSLGwtfvRAEdRNPPHu+MK8n+aGoQ7u3kkg9+YFOYl6Ae5439mOPc3iT16Mf5MqhtZTX27YH7HAD88/PNG9aXiuGpqsseF1QKfECO5h94MJVq1BPWxYMgWOcwvV5kfPErvi+P13X+9nIE4F7Ffl6EoB9KB1+RV9XtEC7ANhTVc4i8VmaGiz/4AaU1Bg6MQyCXcjsLtJYhhj+RTTf8ECFu1yxI2yJSR4OhirLI+zgzFB5+7h6hZKCkVgOgQ3kb4aLAfVlcw+dz4Sdk42vrtCvt4/8/GzBxV2bNgGycR2OZN0ngeQHUOrIirVS1FHgvNJMCFpFiXkrrzyVfZZ/xqkm9DZxDAkJWaBp4XJoiVM1j+/Vg9xomQhlclGVX7YwO8JiWhdy9TVVRJL/UFsHYGWbylTSkFYX9wpMr85w2x+lL9qvFjS0ecD+oqlnbemOg+XCop3Pt9EEhjj2wsDlER//bMja65deRNmQBqJcsACrM6wRWyDum8AVGhUZtR30OAqPoIv570WWcIQIfvBFAn3MWJRFYxsf450VioZqjRX47K1DjWIuucIMdfwFYeXi38lR3dqxKn1SWs+PWmfVM9NNaMt+GzF4/+iG7e506KcyLjdJ1CIOBj6dEeEyilNGNXoBhCujwuyILsv+X7YgQQU44WrPQbEBcpXL5I4y0CJdL3DmEBIzs0yABwklvU8XF0OHzdyeNbYumruBqhoYLQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6534b019-846b-411c-27b2-08db8394722b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 11:29:40.0113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX62XClH5BkluTjk33CppTRxVXQlIH3VdxKyGV3wM3KTpVVumzr5ILGUONmZ1iFGoqpoRfFSekUAQ3JBknbSBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7289

On Thu, Jul 13, 2023 at 09:49:14AM +0200, Jan Beulich wrote:
> On 12.07.2023 17:41, Roger Pau Monné wrote:
> > On Wed, Jul 12, 2023 at 04:50:34PM +0200, Jan Beulich wrote:
> >> Hmm. The question really is which of the changes we want to backport.
> >> That one should be first. While it's largely guesswork, I'd be more
> >> inclined to take the change that has less of an effect overall.
> > 
> > My views would be the other way around I think.  Current code already
> > has a comment to notice that IO-APIC pins might be wrongly unmasked,
> > and there's also logic for masking them when the IO-APICs are
> > initialized.  The fact that such logic is placed after the local APIC
> > has been initialized is IMO a bug, as having unmasked unconfigured
> > IO-APIC pins when the local APIC is enabled should be avoided.
> 
> Hmm, if you really meant this (and not setting up / unmasking of
> LVTERR), then your change would still be insufficient. We may enable
> the APIC for the BSP in init_bsp_APIC() (which is called quite a bit
> earlier), and the APIC may also have been enabled by firmware already,
> so I don't view this argument as fully convincing. (That said,
> init_bsp_APIC() calls clear_local_APIC(), so while the LAPIC may be
> enabled, errors would be reported only in ESR, not by delivering
> interrupts.)

Indeed.  I should mention the error vector explicitly, as it's not the
local APIC being enabled, but the error vector being setup which
causes the loop here.

> Which gets me back to another aspect of your scenario that I haven't
> fully understood: In the description you say that booting fails.
> Since we handle the errors, the implication is that the pin remains
> constantly active (thus triggering errors over and over again). Yet
> how would this not already cause problems ahead of smp_prepare_cpus()

Before smp_prepare_cpus() (and explicitly before setup_local_APIC())
the error vector is not setup (or that would be my expectation), so
errors are just reported on the ESR, but there's no vector injected.

> if the LAPIC was already enabled? Wouldn't we need to do part of
> clear_local_APIC() from init_bsp_APIC() before bailing from there
> when smp_found_config is set? ("Part of" because as per the comment
> at the top of init_bsp_APIC() we apparently would need to leave LVT0
> [and then perhaps also LVT1] unmasked.)

Right, if the APIC is already enabled by the firmware we do currently
rely on the error vector being masked.  OI think this is a reasonable
expectation, as handing being done with an unknown error vector
unmasked in the local APIC would be bad.  Even with the CPU running
with interrupts disabled we would get error vectors set in IRR.

> 
> >> That said I can see that Linux have their enable_IO_APIC() calls
> >> also ahead of setup_IO_APIC() (but after connect_bsp_APIC() and
> >> setup_local_APIC()). IOW with your change we'd do the masking yet
> >> earlier than them. This may of course even be advantageous, but
> >> there may also be good reasons for the sequence they're using.
> > 
> > Linux calls enable_IO_APIC() before setting up the local
> > APIC LVT Error vector (that's done in end_local_APIC_setup()).  That
> > logic seems to be introduced by commit:
> > 
> > 1c69524c2e5b x86: clear IO_APIC before enabing apic error vector.
> > 
> > Might it be less controversial to do like Linux does and call
> > enable_IO_APIC() before the local APIC ESR is setup?
> 
> You already do so, just that you do it yet earlier. I'm not
> convinced it needs doing from the middle of setup_local_APIC() (or,
> like nowaday's Linux has it, with ESR / LVTERR setup split to a
> separate function, and enable_IO_APIC() called between those two
> LAPIC related calls). You also disliked putting the call at the
> beginning of setup_local_APIC(), so putting it in the middle of it
> might be yet worse when taking that perspective. (Another downside
> of calling it from anywhere in setup_local_APIC() is that this
> would be another __init function called from a non-__init one. We
> have examples of such, and keying the call to "bsp" would leave it
> safe, but avoiding such calls when we easily can is probably a
> worthwhile secondary goal.)

Yes, it's not my preference to call it from setup_local_APIC(),
neither splitting the setup of LVTERR/ESR into a separate function.

> 
> Question is whether it can sensibly be moved at least a little
> later: verify_local_APIC() isn't of much use anyway, first and
> foremost because we ignore its return value. And connect_bsp_APIC()
> largely is concerned about leaving PIC mode. So maybe put the call
> immediately ahead of the setup_local_APIC(true) ones?

Strictly speaking for the issue I have at hand it needs to be done
ahead of setting up LVTERR/ESR.

> A further question is whether, considering that Linux continues to
> use that name, we wouldn't be better off not renaming the function.

Yes, I will leave the name alone, albeit it's IMO a bit misleading,
it's not actually enabling anything, but rather masking the pins and
figuring out the pin where the i8259 might be connected.

> One other thing I finally figured was confusing me in the
> description of the patch; re-quoting that paragraph here:
> 
> "Fix this by moving the masking of IO-APIC pins ahead of the enabling
>  of the local APIC.  Note that before doing such masking Xen attempts
>  to detect the pin where the legacy i8259 is connected, and that logic
>  relies on the pin being unmasked, hence the logic is also moved ahead
>  of enabling the local APIC."
> 
> The last sentence saying "also" is kind of odd with the first one
> already stating this very movement. To me it's therefore unclear what
> exactly the second sentence is intended to be telling me. I guess you
> want to express that together with the making the detection logic is
> also moved (i.e. the entire function is called earlier), but I'm
> afraid this isn't the only way to read that second sentence.

Yes, you are reading it as I was intending.  It's merely a logic that
the i8259 detection is also done slightly earlier, as it relies on the
RTE masking not being tampered with.

What about:

"Fix this by moving the masking of IO-APIC pins ahead of the enabling
 of the local APIC.  Note that before doing such masking Xen attempts
 to detect the pin where the legacy i8259 is connected, and that logic
 relies on the pin being unmasked, hence the logic is also moved ahead
 of enabling the local APIC."

"Move the masking of the IO-APIC pins ahead of the setup of the local
 APIC.  This has the side effect of also moving the detection of the
 pin where the i8259 is connected, as it must be done before masking
 any pins."

Is the aboce any better?  Would you rather prefer me to drop any
mention of the i8259 detection being moved? (as it's just a side
effect of moving the masking).

So to recap, I think we are in agreement that calling enable_IO_APIC()
just ahead of the call to setup_local_APIC() is the preferred
solution?

Thanks, Roger.

