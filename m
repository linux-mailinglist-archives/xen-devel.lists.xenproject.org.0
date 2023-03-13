Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8006B7954
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509301.784802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiUw-0001gZ-3W; Mon, 13 Mar 2023 13:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509301.784802; Mon, 13 Mar 2023 13:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiUv-0001eN-WD; Mon, 13 Mar 2023 13:45:58 +0000
Received: by outflank-mailman (input) for mailman id 509301;
 Mon, 13 Mar 2023 13:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EdO=7F=citrix.com=prvs=4292f2e3e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pbiUu-0001eH-Bz
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:45:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f929bd5-c1a5-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 14:45:55 +0100 (CET)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 09:45:50 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS0PR03MB7202.namprd03.prod.outlook.com (2603:10b6:8:121::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:45:48 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Mon, 13 Mar 2023
 13:45:47 +0000
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
X-Inumbo-ID: 5f929bd5-c1a5-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678715155;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QUPjKgY6vngObulWvJduolhMilMM/ohdjEPEbTQgTk0=;
  b=GG/8teaAvFJzuNvKgbYQjp2K0pmpFQ/kfrF4fPozqlQWk90kG3eNGMYb
   9Mr6O2eFeSSfD7NOpc2UmCealx3TRWUDe8KkWF5aG38SkT+RlScF2cAzc
   mSgGUMqhULm9LYCr7xNdyRlkWTecQm75tKB91UGCwJsxws2CPrJ8bwLDp
   E=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 103027884
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:p36+Ka88sT7EFnpDnbrHDrUDpn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zNLWGHQP/bZYjCmc9x2OYXk8U1SuJHcmtcxG1Q6qyA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkQ5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklx1
 LtHFjYsQymBvMKW8vGbTe9KgPYseZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXxnuhB9JCSNVU8NZOjF2u6EELUCE7VFyZuKmchkD5WNJmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBSBRf5dDm+dk3lkiWFoYlF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:Nd57Eqnx8q+LdFzkQIBuTHGmHzLpDfNLiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42G7j5vZZmxm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjsOTj9Vxr8m0G
 7d1yj0/L+qvf2XwgLVkza71eUapPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+Bwlve21714usd
 /U5zMtJd565X/9dny85THtxw7j+jAz7GKK8y7TvVLT5ejCAB4qActIgoxUNjPf9kobpdl5lI
 ZGxXiQuZZ7BQ7J2H2V3amCazha0m6P5VYym+8aiHJSFaMYdb9qtIQauGdYCo0JEi7W4J0uVM
 NuEMbfzvBLdk7yVQGQgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i3AVwcQO901wgK4Vet1h3a
 DpI65onLZBQos9dqRmHtoMRsOxFyjkXQ/MGHj6GyWnKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPVD9GU1pEjyGGCfIyEZ0Wv9ihi3ek6hlWlL4CbdBFrCWpe3PdIms9vQvEyAJ
 2ISdZr6/yKFxqaJW8G5Xy4Z3BoEwhvbCQkgKdEZ7uwmLO7FmTLjJ2tTB+BHsuaLR8UHkXCP1
 AkYB/fYO1902HDYA6LvPGWYQKgRnDC
X-IronPort-AV: E=Sophos;i="5.98,257,1673931600"; 
   d="scan'208";a="103027884"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f13IfpcAXzCCEv6Ae8oMiQZcFyGb1dirub/oAb/JBhV/e39uBjt1rphz/fcaOvUL6u3aYE0wLO+YgWEAknY5QVoHXn9X4ODWoGnc0tVaEa+fJWADln2A+Nen+7ugmqWXFY9Qzw6w5iD3F1khkd98XVBYmhxJN50NMy+FXJzuPJKbTBW/ZaVldwz861nF+mpvBgStsQQfmWKak/j2W9craWV8KIqMwhpIkX28ZmpUIrcwXHaQw1XoZ/pv38YtaCCCI0llIXt9oxpp73T0AnrgaCqRGlvK07LrHkv2Q8I77GiJnr8dFcDqDgTICM3/xTutUgAZwnZz+XNVCbLFm5NcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcEZVfiRREaBTScrMor7pqjpENjntdcSvNpcolj7YhY=;
 b=MEgq8VswwyttoWolETC8zxgNuQBBO1b62nRyja3nC1UXEUZuOS2bg9B+uFLW5txDvWKYRP4QPxGI7qyZ0KLBl0+p73SQVCQ2dPj4ZXd/FSRztJjhuVcpTUsan77AjGD8zl22VcNXg119KeWAt80o9jNIJZD/F9FRr9cnWspV7l6iL9qxuov83PrmrX8d3WhGdNre+A11/zlAvCR9WhCzdXlD+FSv8EqjAKF0VEk3ObWOXG5V/Oy2ITiCA9KgKG0bZu7KsUK++NCr30XOvW0B1KKRZCyQcPBC6Wrwu5ZKll/MqxVfoweHH8Wb7oT5lzUz5SnS07f1cg/WMyw2jgMbGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcEZVfiRREaBTScrMor7pqjpENjntdcSvNpcolj7YhY=;
 b=Z4WALPbpBafiEXACHDEopL5KUOieVIGhy6bqyNzeu+TsVDlmBGhxsiLB48HcQ2T9gHsNbatPIwao0N+XiYg1BWAdWqVnUtclFuxudGVoeycHah1ysSbsDkwGwdfIc5vAdXrLSzk/WnYiFZA7F81cF+jJK8juclD9+DilEWvvwWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Mar 2023 14:45:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/platform: make XENPF_get_dom0_console actually usable
Message-ID: <ZA8pA27iTuaWCBlk@Air-de-Roger>
References: <b1250f72-d268-7bdc-2381-adb75f958ceb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1250f72-d268-7bdc-2381-adb75f958ceb@suse.com>
X-ClientProxiedBy: LO0P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS0PR03MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 33efee6f-8285-454a-177e-08db23c94033
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OQRmW95YYbYY0F6JCrNSYF2IgYQ0FP2ijj96ACqycfOLfU0Vm1BINMFNzmKGDr4W1WoL9DlefDa4c/A49Vsx2QKtZFdYtnvZonre+rbAt6godnNdS5flLlv2oyUS6JGOmjVp0iv6PqJ2o0OmfPAKmOE0OPWwji4LQ6v676jHgpL0nrlc4hadKf4QYIzGle7ejCyVpzh+sDI7yd99jDnuPtR2/fqTRJTa1vhouX1lGT4960OWO97byZeVJF/O/tiSggxokcMhJgFZArlIsyZdRFFdBiTgVJQFQk/IodjyHAURaEUKMEc7/KwCiBCJKz4+OwtGIVi5sZuQUn0pFPMf/YJvw1YraQWvNpbCX9NtdgXA9nG6blExIjyfbGBUZOswOuzICwsPfh3Dm6zKZUg2/UbTvy+Z1trCmFYQMgFcuhpb02ouP/XRY0BX1fHfhNq3U5nlum8RdKiaVbUnluDoS/jr1lalLzsLHTFBTbSom/ZPgo8HaCwaPC9TODvcSERhj79ZDdMq0NeklfP/vCtcY6fHkOBbqk94X/UXyW53X7pUNaGclHgQhofeEJF68K2kHvmBZn0aQ6vGA8aN7M6aE7WsCvQx4ma4W1y6gDxoXl6PSCZ1Pnn/C5LtZ+IKZWRSjhiXLhm2xkvCKo+A61SpQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199018)(41300700001)(54906003)(478600001)(8936002)(4326008)(8676002)(66556008)(66476007)(66946007)(6916009)(33716001)(85182001)(86362001)(38100700002)(82960400001)(6512007)(6506007)(26005)(6486002)(186003)(6666004)(9686003)(4744005)(2906002)(5660300002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlFTUTkraGFYZC9GejQ1aHFMSHpnYzNrbWFQcmZhczRNZlY3czgxNzZBR3hp?=
 =?utf-8?B?dTJUV3Rsbk5Cd0g0NjZxRmRCWjRyRHlVTWw0eU1EelEzTVhMUk5OL1ZFbWZZ?=
 =?utf-8?B?RWFhSE5ZWHZ1U0dnU1k3NFVpNjRDK2s0VVVacStSUTRjSkYrOXFWalBqY0hw?=
 =?utf-8?B?NTEzOFQ4cWJMNlRIaG1wRzVkTFI4c1BrSHgzaDJDSjVZV29EOTFqbGdCWGpV?=
 =?utf-8?B?NlZuaGtJSG9hWW1xSlZHQkJSVGlOSXdER1VmaVV5NnRFb1d0bjdpQitGbEUw?=
 =?utf-8?B?L0QvTFFUdEVhV0c0V0t1SzRnREVNbko2cE92NlkzeVVLNHpZMnF1K2RlVzRB?=
 =?utf-8?B?QnptYSt4NmRrR2cyaHRsWFFtQkJjZDVTRFNCZG5nTFJwOVJRNmlhYU9seHJY?=
 =?utf-8?B?RjBGSUFpeXFPdmhtOEJIaG81czFla3dlZDByMHZBazNCMTVvVVdyY25kWWtZ?=
 =?utf-8?B?cTRpak5wb2Rlb2cvYm80N2IzYlZhLzlWaVYwSGR1eTdyM0tPenpTc01tbE9m?=
 =?utf-8?B?RUtsYWFXd2Jkb3c2cXYxZmVtUFFsY3NOaURRTEJRQUxQS3RLR2RCUTgyY0NS?=
 =?utf-8?B?Q0E5UnM1OEN1TWdlV2dMTG41amN4RkJYNHg5cXl5MDNwTXZ2NnI2LzRoUXY1?=
 =?utf-8?B?MExybXBUVlBNcVk0aWtSd2dvclZXOTFpblpnOU9iWm00aER2TElCU3JMeU45?=
 =?utf-8?B?UVB6M3pOYmtjM1VqWEFja0NFS3E2S1pNWWloSTRpVUtBcGt5QXNjUjlhUlpS?=
 =?utf-8?B?SmNKRitLWWUwV21xN0c3amNjYVZDTjhmRUx5TVdzQmdicDBBcVVGeDVsYlFP?=
 =?utf-8?B?Z2UzSGVCWHRKT0pPeGhLNkVYTW9CTHp6V1VNRlA0QW1jcXR2dzZEQ2Y3alo5?=
 =?utf-8?B?SldRYlk4YjI4QmRxQk9yNnBmTk41REIrNkNXMnM5aGtydStsVDh0TUdHdTl1?=
 =?utf-8?B?T1Rad0NjYTlIOEZqT0luN0U5aGcwU1Qzcnd1MW0zWm4zQ0s0NU4xNXo0MFFu?=
 =?utf-8?B?UjZzTkYyWG5jNzJ5eHJueUE4RVRpVTdPZ3RYR044Q1piOEd5c3czbnhSWW85?=
 =?utf-8?B?M09CSG5RYmpicUNOWXRVWUhURitFRWNzLzlUbFhESGdoNFNOd3NDM1BYVXJV?=
 =?utf-8?B?T09jQjg0akdjbDZNQ3BjYXQ0eHg2aU12aGZGTUtZcUViWkdMV2YzT2FGSjJy?=
 =?utf-8?B?bDEzNiswQ2lsbXkyd2ZOUUFsSEM1WnYwblY5MjZpUXFxSnFlVTVNMnBhaXRN?=
 =?utf-8?B?RjZDVW1TRFEyRXdya0Nrd3Y1VVhHa1VFR3JsaU1ZN25uVU15aWJQMWxRUEFY?=
 =?utf-8?B?RDhHNzNIUGM0aWF6TDF6eTltc3FMSHhuRXROOGdwVm5IY3hmRndOZ3plbHdy?=
 =?utf-8?B?UXF6VitFOFZKNUgrTGgrdjZoaTJiOVl3QVExc2IxbXR5ZzZKVFYyenRPTFNo?=
 =?utf-8?B?SzBpbnpSSjM5ekJVTFEzc2F3SHNMNEZob3hkWlhXV0laQmdXeERGazJ6MUdM?=
 =?utf-8?B?TjlQdHFFMjBXNUM2NG1jZCtBOTJna1RQcHJmbUIvaFJCcjhndktYK04zaG9k?=
 =?utf-8?B?Mmo4aG9kdWNpMTFNanBJVHlqNEt1MGJVT1hNTVA2Q2lhNVk4RERvTHl0U0VP?=
 =?utf-8?B?NXNYeFpGTFRuMUFPMUZKekczRnYxR3d4SStYWE95NnZ1OUVaSUFNb0ZMU20x?=
 =?utf-8?B?L3ZUSkluaVZ4NzloM3QzQ1hKRVV1L09WM2dHNjBGajdDWWYyandyV2trSG4z?=
 =?utf-8?B?RUlPdXE2ejdHbkptQ1lpaW9wTXBEa3JjOTU1Ti9oUFU3ZmVwOWcrQVBSbCt1?=
 =?utf-8?B?K1FzN1RzaTBtUzREV2lBQUUya1hmTHltYUQ3SjE1M2JaNnF6bjdocngxbjl0?=
 =?utf-8?B?dGd3Ym1lTkx4a3pIRmZWY2VkRm10WW9URzM1MHJJZHl4ZzJvdUZRdHY5V3Z6?=
 =?utf-8?B?UVhybFQ0R3F5aXBIQUVjU3ovMzEvMlNITmRjVzJZdDJmcThVZzFlTTBCMEQx?=
 =?utf-8?B?TjR3bXhRakRGM2R2Q1NyMnJrcXV1UGxHNmlzSFcrTHhVNUJRMytaQ3B6Mjh5?=
 =?utf-8?B?bXBGYm1qMjdjYm9RVW1IcDlMNEwyNzJsTHBrR3RUTTVaVit3Ri9IVnFud015?=
 =?utf-8?B?ZDgycXExaHVSRmc1Wlgxb05EbDVOS2VCK2w5Zi9XbDRXSDJkTC9hbHAxaVVX?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rUquFXCVFfrFlVM09dC9L2Mp0DpvQCN9UQOn0B4tjsnEr20L2ToBJ9xULzeYoZaOm0rzh3b60Es0yzlqmn40fW5XhZZEEeKzpY4iOqJQVTgJcEIVmR78tsmrXtNiy5KTD356yQV05PWW34KaiCzsC/bI5vgy61YF2XLbXzNh9pL7JX9o4Pk9f7ZW9iVTbDoihCCtgwOBoowGZlDbyR2YFoT+jEFaME+b5NZm/Eh8pep8L8f7LD3i+wZ8ariD00D2lewb5t1601Hhpp/M7NBpw6X4c8NVPwANwp6N38hR9kO87SGWt00IfnSCi1yhteqDNniGPVflbFYKW+GYdV783ML9nkadA6BfoOnCAmUUrOM7AE5jOUdtPhBqYAHuveRu6iByqUb96H7fJpSKGGO9j/ajYNcmbRBe+seEplRW3joMriMHTCJNdhRQNavawTz+v9EAtO0BTGCZH/Cj1OnmP4breDj8cbz4MsTPgYgxDfXTrdcR+PTAsaY8KQq0GbxUdSXJrzjU76S3Riz4YXDII6sMJEGA8JinfvyTETnzdrrzeYhkNYGH5TrQpoeJaGILa/5Y4C6Vha2mdQYHVYOo0S50Huwt5pcLcORJ7PXk0y/joYzt4T1YFI8kshyte1AlZw+17vdXAKQNsOBjko4W7N9LK5nkrB2prIqYwi45iWgXG2kLgrBrXUOyZLmtvNdchJp2HVbj9pq/tKnJJr2atEJ1CFvgugu4Yqae/Qai450noSXJ2bxFmQqVX4U6uZz5lQUrZwja1m8EZ5qpG5O91pZb20NkJcjX8ABVexxRj20W5tvzocR7HBPPLgAgKvr0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33efee6f-8285-454a-177e-08db23c94033
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:45:47.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsTGPE7ajCrp4pl3bN/TBuK38skH6TiC40XkbTQJ3bpm1JlCAIo0ygFp8Z4kMWdXagE32d/5gSs4fQ2Eok/NaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7202

On Mon, Feb 13, 2023 at 03:51:50PM +0100, Jan Beulich wrote:
> struct dom0_vga_console_info has been extended in the past, and it may
> be extended again. The use in PV Dom0's start info already covers for
> that by supplying the size of the provided data. For the recently
> introduced platform-op size needs providing similarly. Go the easiest
> available route and simply supply size via the hypercall return value.
> 
> While there also add a build-time check that possibly future growth of
> the struct won't affect xen_platform_op_t's size.
> 
> Fixes: 4dd160583c79 ("x86/platform: introduce hypercall to get initial video console settings")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

With the added comment.

Thanks, Roger.

