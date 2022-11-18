Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E184062F6A2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445782.701161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow1qM-0005gr-TU; Fri, 18 Nov 2022 13:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445782.701161; Fri, 18 Nov 2022 13:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow1qM-0005e8-QN; Fri, 18 Nov 2022 13:55:46 +0000
Received: by outflank-mailman (input) for mailman id 445782;
 Fri, 18 Nov 2022 13:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmcl=3S=citrix.com=prvs=31449dec1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ow1qK-0005e2-PW
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:55:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aed5e5be-6748-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 14:55:41 +0100 (CET)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 08:55:38 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SN4PR03MB6752.namprd03.prod.outlook.com (2603:10b6:806:213::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 13:55:35 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 13:55:35 +0000
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
X-Inumbo-ID: aed5e5be-6748-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668779741;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0moBXfh8fpbTkG1mYrLvjYi1lqCkiTUgpCg4+pD83XU=;
  b=VZ4xaDW1TT5mQo4sk1MVTqpkCLGk56UkP/rCBhDIZt1Jgu3rW5xl5PB9
   hSq2ivwIlxiSeA2c/dqtcGODvej02aRyJmOlqW5e2uq36NJMuwFMUBX8z
   TPQ52k+EJLrmM72SEMt7/SodiDFuimS9mqPH9udj16yMnNQ5IJuG8CtCb
   o=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 85537105
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Pz3M8KiDkau03NbcyNgVI+rOX161VREKZh0ujC45NGQN5FlHY01je
 htvCjvTOKqOZWDyeY9+aIizphwE65/Uz4RiTAdq/y0zRnkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QaOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQpMgotZUqlnN6U65KZSvNSnNV8PfLkadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGyarI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXOmBdlNTeXlnhJsqG/KwzACE0xIbGemreWHh2OhZ8BBM
 UNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMQvqcseVTEsk
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyLzflTrKR9dnVaKw0Nv8HGipx
 yjQ9XdkwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBe8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:KngGR6PB7gAmIMBcT6H255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVorFgMq8w6HiBKv8frfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIihm9UYMTLljyevfcBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhNV2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYfB9BajYxUXxPF4w541esMmJ
 5j7ia8jd56HBnAlCPy65zhUAxrrFO9pT4HnfQIh3JSfIMCYPt6rJAZ/mlSDJAcdRiKobwPIa
 1LNoXx9fxWeVSVYzTwuXRu+sWlWjAJEhKPUiE5y7mo+gkTuEo841oTxcQZkHtF3ok6UYN46+
 PNNbktvK1ST+cNBJgNStspcI+SMCjgUBjMOGWdLRDMD6ccIU/ArJbx/fEc+PyqQpoV15E/8a
 6xH2+wjVRCO34GNPf+n6Giqnv2MSeAtHXWu41jDqFCy/zBrOGBC1zHdLgs+/HQ0cn3TPerH8
 pbA6gmc8MLHVGeZ7qh4DeOKqW6CUNuJPH96exLLG6mk4bsFrDAkND9XbL6GIfNeAxUKV8XRE
 FzEQTOGA==
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="85537105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWDHxrxxFMQdTBKhUSztP0sl+x6MtBu1g0owkKZe1astjB3O+N0OqS+o8nq40m7JseRR7XCfgF8CLdaNOUS3hczONB+O4C4JQYewLLLXsp14YHkx2VohYwWXqwVBPM212oEyQymDZQSfta64lNFiGicE0wBg4cM+9iRA97btwQf6D+99g6eq8HFav33NlmNjfWogvpJHwZqJHInnsSR2ahOAdiEvWjtWvEDColWomHEK5gBPzUSqjn9VkBJKTXSiRZAPpDgUsVOQdKrkHd3eCeR4YHezFlJtgjm4WRLhKR6MX6WzHiHIJWNZBznCSnH7lmc4ASRq4Ro8r5CB9ei4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vH3u6snomVKL4Rux0jqMDKm9vJjDe0uNRBAXmfFJu4=;
 b=Dxz+VaX9rLx3x2biuuUfgN2KMIuTEoL/D9tNfTWVjBw3aCLL3ndE5W4pSfbV4AmwuvqParEkGMUZ2XxZdo1L6LgBSBOisrzuVw80Hvg7Gr3kmvq9bKNg7D/fSIwm0XAPboWfWDGu/w1yVbPym2mf18xc3gXcoZq6S1uj7xQK4ovBZ5VhUPlF1Miyd/JLL/ZDjFztRwRFP0zIWq7hbldvJVTdTVwW5mwd+8y/zEmCfKrP4BuCuC73KCknyURsCgwk8MfQXPS9VezY9QSlxtM7mY81kepNlTxLWsyCcaJzByrFgQySz8BeAH0dH01DpysU1wLe3fntDgiU//K3OLvB6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vH3u6snomVKL4Rux0jqMDKm9vJjDe0uNRBAXmfFJu4=;
 b=IifXmDu0wXQlIQp7ruLWN1kfn2hSGHS1JQxbcV4EQrvUMsA6wSuyHCbwwySdJ5epJPtsraaGFrdn1k6p9i5C5rbjpsKqv3hsw9VSq6Jn48r5260e6iKdUqMJXn7w0I2VholMkiczi1W/84CVP/xdorZ3dpkRjxZELYPoPeibHJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 18 Nov 2022 14:55:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y3eO0bMKRPYJc2yQ@Air-de-Roger>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
X-ClientProxiedBy: LO2P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::35) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SN4PR03MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eaf47f5-b059-4d3b-6a29-08dac96c90ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P6BEni3FMS559RZrv+5DZuglLmEL0DdDNj8q0NZN5fVQEp4nlQIyMHjJzfIUePi3kvgZESfSgNeV/bg0FsjMbGq1G8bALJidcsBNx4j4pDvvgrqkhGmPl/1EwxVXLroPu1+4R9chT4p4P6vCLL5Ta60k5//fHdeSaJWE1jY7cUgsZ4cC3ad9IgU5FtNFl/acQU4KxyKamS9eMSjp/nJv9hsCT+X5luSfNxfMfANPRF6CLrD66lkN4gGWVSnZbI8Amuil+sEmzQIB+ww9JRGLcpl7y6yZx0At2Nq9qQiosVCuts+pnULX1jnryrTi1sb9RUNdxLjpqIXnBeYxlGSTezyMFRBa0HkoiVj3crgoiHrah09nml54xlFaJ5MnT9/lvrnfFu2NQKT5L9JRoue1iQYu2bXXSejqAr009EcSS11jG4wBdv1kyz8Pvpz95jWEIMZV4rQN0vJQef3MduRtx0UDFR+zrfswO2lKVdUnIbHveX+UhI4n5hAKgL4yHqq+fgpRIfJ6PTgkuzR1tzDCJwvHY9l+4s8bYJAgfeOkZ06/3W6XYQh9xRmmZhHxF1os5y5BHP2qageMSRXxgEkvz3vfQITefAevIE7J5fwEGR/6EeVUnnd3cH4Vx2BbORlDrxVkAtHnGih/JRkJ8eeh5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199015)(2906002)(83380400001)(85182001)(41300700001)(5660300002)(8936002)(86362001)(38100700002)(82960400001)(33716001)(316002)(6666004)(186003)(54906003)(53546011)(6916009)(6506007)(66556008)(66946007)(66476007)(4326008)(8676002)(26005)(9686003)(478600001)(6486002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzFJY0pTM3EzZ2dodU9wK1Iwbkwzb0c5V2JEelZ5L1JNWjVDZUJ0cjdXY0RT?=
 =?utf-8?B?V1paU2FkZE1zcTVBbTUyckJZa1hPMURZVklmeGdTZ1dhVXd5K2lCc3hvN2Js?=
 =?utf-8?B?SVl3Z1lKRktzbGtCZjhSc2RHeWlQS0ZicWMzS1NMT0sycndIeXpHVGlhMGtu?=
 =?utf-8?B?a1BBRmVNRDQxTW9FS3QyNnA5bXEzSmJyL1N6U1RaVDV1emExV2EyU0VXenM4?=
 =?utf-8?B?SHJtQjdPM0d3L3J5SFFGWExVNjJqcDA4U2pkRCtWUWV0K2F3VDBCRzVIVDZQ?=
 =?utf-8?B?SmlzdzVjRWdBVk9zbnBac1ZIbC9mS3NFNk5YTEttaFRvRVBuV0dpTG5GeFU0?=
 =?utf-8?B?NjZTaThreWZGZGdHYUYrL2poblRTaFVBYVF2WWNnMDYyT2RoR2s1a1Mzc29O?=
 =?utf-8?B?S25aZDd5T3BubmVnTGhjR3duQnRBZ014NVpUdENWUFBpcCsrdzhsYVJNODhG?=
 =?utf-8?B?OHIxbS9iN1Q3OU9KSkc0d0N3ZWJtbUtiOFNVR3NQY0hYK0tPUDZKcWp2eUZa?=
 =?utf-8?B?SzZwQ0MzVTU5SzdaMElYNXhzNytXbkkra29rSzMrMzlmWU81VysrWjgxdjJn?=
 =?utf-8?B?YktLc1JBWWxJdStOTTBLaW9ZUS8vdDBEeWVqNC9ub0VldmNucEpJdXhoS2dT?=
 =?utf-8?B?VmNIbnp5YWNUQVVMYWNVZWtiV1JUN09sWUtmVEZuRTdmeUpIUnFqNVhaTmhX?=
 =?utf-8?B?MzhkMEN4MWNXWjRrQnVWV0FoR2Y5UHRKUkhwdjkyMUZCS0daSjdLbmZuT1FO?=
 =?utf-8?B?eUNkR01jditkRWtVWmZSVEZRQ0FGWW9weVNMakV0blZuUUlzSXdWaUFoVEFk?=
 =?utf-8?B?cXpGTGtKb2ZXWXpkQ1RCTmNNTW1YM2ltZFMwUld5K1ZpbVF3YUdQaFRhT2di?=
 =?utf-8?B?YTdvT3FDM3NKMnowSm05TS9xTzJhQmNTbkY4a2R4cXNEcWp5Q3RxY1JzSFJZ?=
 =?utf-8?B?M1R1a21zSG5tR0NGZGY2VGlJSCtiTTd2ZUhjbTJPMFdQUjJZV3AxRFhJRldX?=
 =?utf-8?B?ZG1mMzllQm12RlBQdnZ4SExxSEllWGxQZW0rSGl4ajBCT21NaTRzYS9UMW8x?=
 =?utf-8?B?NmdEZXBJVU5nSWFLWWQ3VE5YS3ZSdmlwaEFYT3Nvd3NVR1NVVGttbjQxaWpz?=
 =?utf-8?B?WFB1bXhKcFh6c0xJb3dUL3p4aWdOb2JwTlNOZHUwaUo2d2J5UlVOVk81UVha?=
 =?utf-8?B?V3ZvUmdsdVcvbVdTNVdUcTFQQlVpTmxlRFRIWVhRTVRWUGNpc1pCeUFBaS9k?=
 =?utf-8?B?bzZyUWZ5a2thZmE5STVmd2Y3WmNlSGZCUG1rSFNSRXlqRzhEN2h2NEQ3R2kx?=
 =?utf-8?B?bmxxL01xWGpNaEdyS3NpR0h3cFYvaEVOL1o5aTdKTWtBRkVTdE5hc1orQmJh?=
 =?utf-8?B?S0gxbWhvbjBUakF5WEU0YzdUUnpSeTFXQk41eVFTSTJLT1F2TExCU0MrdmFp?=
 =?utf-8?B?VUEvOWJPK1Q1RlVSaWtqaFl2aVFGbVJ6RXA1Z2NJTmVUUkxZY1RHM3YvdWJB?=
 =?utf-8?B?NmYxT3NaTUNqVUFheTdYQzFqMElDQkFESTBuSTR4WkpuNTRkWENaMGlVMi9y?=
 =?utf-8?B?K1B4ZkNwL256S2ZMMTBySjZpRm1iNGFzNmlLQVZhU0lVd2p0d2hJOW9iL3dI?=
 =?utf-8?B?SEpSano2bHVXUmNiN2d1ekVSU1lnaG4zTWl0TjltT0g4QVROT1pqYXNXT1JV?=
 =?utf-8?B?VC95dHdxN0ZhTGV2TWRhVzF4ZDdrY3o3VGx0QUlBK1pET2w0TEE2R3FINUJX?=
 =?utf-8?B?UFZKV2NqYzZFZW9JUzN3MnpXUnJwOVM5dnJubEQ2Z2hVcVdaWmh2NlpEdDZ6?=
 =?utf-8?B?T3QvRVBIRnFONDlabzExd3VpQTJhd2dNZ2dNQVF5RDRvbFhkb2Q3d1dacERq?=
 =?utf-8?B?ZFZYMUtZamdXRnRtQk1raGRSLzVBVFBHSXU0Z1hnS1JWVjFHTndaUGt3R1Ev?=
 =?utf-8?B?VTlZVXVOdGxqSGdmUEFteGR1UE9WNUNFL0tjM1g2TVdJS3doaUg0V1ZZcnhv?=
 =?utf-8?B?dDM0WlZVZi95ZUVOT0JRRVVYY0t4U0Z1QkhEaDJPa0MvdWFVQy9lYXRjdVRz?=
 =?utf-8?B?SFpwdmhnTnhkWUlmZG4zbG9UZUZkRXhLdHNSYTk5clp4RFYzUnN2eS81ZUgx?=
 =?utf-8?Q?oRxfNXihweJceh/OJXMYnHSrM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vAQ7huP8+PmgqjnKo/eFl4VvzXkLv8oxUxwum/0ZrLCziDce6H+jJ2U3/xH5T2/1sbrNgbwgpQex4127qQ1wL8/r7WHQ1NCUkvWpxpJwoEe9wvvW7eyP5KpTlZTt5nDmSeSAhwaC64dJLgVTpYzx6Cet1HtL4YopeS2UPFDd0F3yobpPrhRzgdP3cNwgGguLZbw89HYApx1C+3VjdV9HP/MKYQhUEh1dceVle6Ll0h/RUJQmeXj+ph/BtcVgxSjLg11DNcGtB3lpPVAhI0Nbhl1Pov3E8v2vtdObVm3StaprC7m09KIw/sR3opiCA2Nel/rjlQep3lwnVOsJrTjZp2wHkinWMJyhXO5+gHOhP06qqUS4LjtoZfEHUtc1UYr9tNMYVRxS6RpkTJhabR01wjTYcqdJNpd+Y973kTnRhPL9PmIfHB4UK5vjmFeQt4qEHULWInyEVBlDYvu2V5QpeG2jrwbvnKcV9dBkFEcIpbRbmemnr6SjIPQnB6P5ucfkdVcUJCj0siBJ9uWUosTyBu3VjxczRwkkTEWGGpmHT299pcfSz4OEng98o8Nw/kILa1Mb7vTHMvZKOXrnAvsZKKOeL+V4HxtvNXfnAf+RqqqUoiA/suU1lj3LYBypoRf9ZiiCQg3oD/ceURV+wS1FA468U09LuZivyUydmGy9fPRv1GSxLz9SmFJwsPquIRdK2SBzfGk0kDKdeVBzXvlYtPcZoGvyFTdntQyOsiu1xReEEyLjfZ9B9K2Y/IbkHPCe+73g7C+oNoNNAeqM4E8GMAnD61cnhxTnoFLy58SiaHzPachX4Fs6/rUeQ+653L8wC9+C7XcbIykTQv3QE3sflH5OZrlT0fSQjeVcJIPhH9E=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eaf47f5-b059-4d3b-6a29-08dac96c90ff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:55:35.5640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+6SxyH+CNqvEdaANgOFQLe8Y5e1yEIa4Gz4vIYYHprN3XTlmoroE/sNad7aSPKYBOYg7EF25phm5W+g6LyFcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6752

On Fri, Nov 18, 2022 at 01:54:33PM +0100, Jan Beulich wrote:
> On 18.11.2022 13:33, Andrew Cooper wrote:
> > On 18/11/2022 10:31, Jan Beulich wrote:
> >> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
> >> exposed a problem with the marking of the respective vector as
> >> pending: For quite some time Linux has been checking whether any stale
> >> ISR or IRR bits would still be set while preparing the LAPIC for use.
> >> This check is now triggering on the upcall vector, as the registration,
> >> at least for APs, happens before the LAPIC is actually enabled.
> >>
> >> In software-disabled state an LAPIC would not accept any interrupt
> >> requests and hence no IRR bit would newly become set while in this
> >> state. As a result it is also wrong for us to mark the upcall vector as
> >> having a pending request when the vLAPIC is in this state.
> > 
> > I agree with this.
> > 
> >> To compensate for the "enabled" check added to the assertion logic, add
> >> logic to (conditionally) mark the upcall vector as having a request
> >> pending at the time the LAPIC is being software-enabled by the guest.
> > 
> > But this, I don't think is appropriate.
> > 
> > The point of raising on enable is allegedly to work around setup race
> > conditions.  I'm unconvinced by this reasoning, but it is what it is,
> > and the stated behaviour is to raise there and then.
> > 
> > If a guest enables evtchn while the LAPIC is disabled, then the
> > interrupt is lost.  Like every other interrupt in an x86 system.
> 
> Edge triggered ones you mean, I suppose, but yes.
> 
> > I don't think there is any credible way a guest kernel author can expect
> > the weird evtchn edgecase to wait for an arbitrary point in the future,
> > and it's a corner case that I think is worth not keeping.
> 
> Well - did you look at 7b5b8ca7dffd ("x86/upcall: inject a spurious event
> after setting upcall vector"), referenced by the Fixes: tag? The issue is
> that with evtchn_upcall_pending once set, there would never again be a
> notification. So if what you say is to be the model we follow, then that
> earlier change was perhaps wrong as well. Instead it should then have
> been a guest change (as also implicit from your reply) to clear
> evtchn_upcall_pending after vCPU info registration (there) or LAPIC
> enabling (here), perhaps by way of "manually" invoking the handling of
> that pending event, or by issuing a self-IPI with that vector.
> Especially the LAPIC enabling case would then be yet another Xen-specific
> on a guest code path which better wouldn't have to be aware of Xen.

Another option might be to clear evtchn_upcall_pending once the vLAPIC
is enabled, so that further setting of evtchn_upcall_pending will
inject the vector.  I'm worried however whether that could break
existing users, as this would be an interface behavior change.

Thanks, Roger.

