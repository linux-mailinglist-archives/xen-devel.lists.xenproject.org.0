Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC36605B6F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426338.674740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS9Q-00038V-MN; Thu, 20 Oct 2022 09:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426338.674740; Thu, 20 Oct 2022 09:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS9Q-00034F-HN; Thu, 20 Oct 2022 09:47:44 +0000
Received: by outflank-mailman (input) for mailman id 426338;
 Thu, 20 Oct 2022 09:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olS9O-0001OM-LX
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 09:47:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bd0cd0f-505c-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 11:47:40 +0200 (CEST)
Received: from mail-sn1anam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 05:47:35 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5003.namprd03.prod.outlook.com (2603:10b6:5:1e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 09:47:33 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:47:33 +0000
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
X-Inumbo-ID: 3bd0cd0f-505c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666259260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kAAdyrIBV5b3v2jo4pvSozj+LaxTfiauFnyu5tTM1Vc=;
  b=WveUFgk3MacFGc9jXE4J8aoR7hOMzlEmZ6xlRJNjPaQVGKA8CLzESx35
   +Pds3++lWKX6Mkhd+RAhz8U/UVtLp3HzEF1M5UmbpVQUAK8lkbksQXXMU
   t8Oiukuq/5SHHRM5gY5o5D9VVW68Yuvdca0G8NuGxMt/Bj26S8k+RdApT
   c=;
X-IronPort-RemoteIP: 104.47.57.46
X-IronPort-MID: 85669458
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6Qrc/q+z+0uZkUohKUhuDrUDpX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 TAWWW7VbqzfN2P2Kdtwa4rnoEpTup/QyINrHFFt+yA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5ARmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sxbOzpPr
 N86EyEuNEuMn+iR5+34WOY506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvza7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVryzy17OSzUsXXqoWGYPmz+M33Ge0nEtUSz85bwO5jb6Q3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBGIJUzpAY9wOr9ItSHoh0
 Vrht8vgGDhHoLCTD3WH+d+pQSiaPCEUKSoZY3YNSwIAu4PnuNtr0kyJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNXNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:NsT4SqDTjDKO3KTlHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wc9HaIGOud5Dt
 v/Q9VVfcl1P6krhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="85669458"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewCm6bVX+99uBKN8XM7piXtfqoikl5qLfZIyF2++Uo6deKJWtzGTOmigtD0Poz5Q4tmp8R1jXfXazv+YVTI6Bvvtv688SIZQAiBxns2tMJ8ONFi37rKw7eN+tUwzxHDzTUzf+CiB8NVCrehLs1tBjhZQyUt1rVVE/CeF4b4NTIYTTeZa11VyVsfPFv4AjaHunXQmlTuWLFR4/HReaNNaaVdGPGHQEIQPG9P55bRgPfgMywR9a5IeRstha2S29oy48/OTBqmo0iI6ldo1FPfx20DJTys6u+7OO0qwC4ZLN4kN3qxmZw6h+FRzPzbaVZd8DxdJxQp0uoxY+P8Njxdq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VZPXsMkn9fam+VCRpitzkT4VDEDmOwmP7P5aKFDPN0=;
 b=hWOziJ2QIKMOBTjxZ2TIF3ewzHIDw2VxS5P3+wNL9G597BHst7lPh6bNsvjHtWBsfxgpl3AiPXzsR4hrJJTmvbOCr34ea0hco5Aywxqro3vdfsaEMhuW54sIqTlQzK/G7PXnsX/qk/2THLqn14QqCM2nns2KlemaujWf/4Nsyej766wTSkFmU6txBesclrZV9ZvjpVapA/PjuLWVU6H2oEYXb8tUk/E0/MZ8t2blBbkfFIast8Bd9JScrD1rU2+KPQT+bmokOFm80yco+IdnOUI7DGz/2RwycpXHgeh5X4SnRNJ4ozVpBemqrIR+MzSlPzBw2QICJVUl350cDv9dDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VZPXsMkn9fam+VCRpitzkT4VDEDmOwmP7P5aKFDPN0=;
 b=hWSnJSh/DUmE0/xyx1yvjg+s4Q5UaiMU6hT+VQoxQb1zJ0I5U8VinqRP8Xv0mFc3m6pvIOKtRMFHcedQi/6WBBVxlwVcKQ2E1G0rM3aUjnDHnaAL27t8vOGmSOHnC3ilKKQUUXwq1Mr6D0i78BkEVlPOI0C0Igly0a+Rn2vJ76U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.17 5/6] pci: do not disable memory decoding for devices
Date: Thu, 20 Oct 2022 11:46:48 +0200
Message-Id: <20221020094649.28667-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020094649.28667-1-roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: 52381660-6420-42e6-bec5-08dab2801c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uyJStD2AI4yE3GZ70vKKl16j59nhd0djgGI06h4MT9GsSnOGny1yIXk8nPHEi04lAoBci8uc08Z1GScLIxWhdVqFJxEvBljgyi6d10qSIt3W3jH4BIVdaVDPDxomu5u1YBaRx63783E1Hs4No90HuADssmY6xBYBRsDuT9b/HPiB3vKWzg4MRBKTKKyuHzPjHVqgrdpPXrI8YKp4yFiPS9r1vN64e3zVfQJC0iKdzD9/FXoouyAFJTyd7uSxzH+aHwyJ5D0GaH10DgFhi4VcLa35SwnsioKrnrzs+rlXLcP0GEov8QldH0Z7MoQDjAbo85nQhrqvhbx7EqKIWJ+CSfKMKBeO8/tDSbiYJ/Hn/O/TMNRFxzfq8r0Rac/om5GA8bBkz5jTyX+eCj8sZx54DjutA/ytggm1MJ3CwinIwTuUZgViJu4BK0PloH8gJ9OYj4WmorkpUEDYnnsw/o4FTJ2zcTM1srWQruWT0fAdAL6wuv/5uqvcjsJ0kprdxfzkrilTZ4fMu4uV5Vj+WsB3vxEkHZlf0UaiAKz7J6FqDAdaGnTrXf2UbzSuna5iQm1/uwf+tuZTaVBCS+bdqfnWqaJkUtohHeHIloK94gcYfru74ez4uJHN9ZCqbyzeO6lVhas4aDjKk6PJKnET6zsra37cBBudgTf6HheaamlPLEbA7J9Uf2FeFWFcg6BbAx/TEu4poK/CjQP9gQpppJqQUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199015)(6666004)(41300700001)(6512007)(8936002)(6506007)(6486002)(478600001)(54906003)(4326008)(6916009)(8676002)(36756003)(186003)(86362001)(1076003)(66476007)(38100700002)(82960400001)(2616005)(26005)(83380400001)(316002)(66946007)(2906002)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE14VlIvMmF1ZTlSOHdGdWNzQk5rL2FPSUkrUlpNWGFFUGkzd2NGYWIza0o5?=
 =?utf-8?B?UW4yaWRiWmpxVDVtZjk5TVovZjdKRlhlQlJLNjVZcDcxZjBqeE5qcnRkRjR2?=
 =?utf-8?B?WE0xMjBPLzdwZmJyeWRRTXZrTlNQVE1SUWk0STY2ZmFWRE4reGI2ZmhiMnhC?=
 =?utf-8?B?WXNOR0Ryb1lQZjR0eTFoSTlXNElwUzZjaXM1QzdibFduajBTYzU4Ti8zLzJ4?=
 =?utf-8?B?VS8weWUyZEZMaTlFZDFvUTV1NTMxN2FMUjdvZW1iWG95RmJtNDBsNExVQVBE?=
 =?utf-8?B?MWsvNTZBWWFWeEhyYlpTUG9FaVprQ2tiRjhpMWxad2E0bXBkUXIzZE14UnRm?=
 =?utf-8?B?blFESkkzUHU1OGt0cFhpYUtBK0xqMVI5T0ordWJTRTZOOTJnc2hOempsVFVB?=
 =?utf-8?B?MEl2MkZ1anYxM0xzdkpyQ09nVHpjenVWSnBjdytJWm02VFV1cFE2TGdndmxU?=
 =?utf-8?B?YWI0dTd4VG9HU016NDBKZTRmamdmQjc3TnJlMDIrSkdnZTdEZ2IyZXUvaU14?=
 =?utf-8?B?OTYxVVNlRkU5QVhEeTNKL0IyM1pBNVJvMURUTFVmS1I4QnkwSkNEMWQ3cnVS?=
 =?utf-8?B?cUdXZTVPd3VnaitCVFBCdXF5WHkwcVdYTWdIWnlCTWRhSmFkcnZVb2pMaFMx?=
 =?utf-8?B?d2FiS09ycHdmTlhObXMzaUpGZjdIZFc1dUcxMGNQcUl0K3ZWK1YybGlWcnRC?=
 =?utf-8?B?c1RPYWJZQVBPWTlPMlVCdFkwSzJJaHpjVHZyZzFIVVRpa3p5SlZzcFpialVB?=
 =?utf-8?B?RFFDUEl0bHBERDhhWkdCaTlUUVhIejRKSGx4L25PRlVlSTNmQnIwRmdrbGNG?=
 =?utf-8?B?R1h1Y0V6NWNWQlBLR1c3bW9IMnh0VlY0aVo3VHlpbWQyYzRvQVBDYXl5S1Nz?=
 =?utf-8?B?YWQxY3ZiTzJ5K1JockpMdFlMWktCZjJXRnl3d3BTVWorVGNRa21wQU9Qc1dX?=
 =?utf-8?B?WlI0c0ZaemRTK3oweWJlV1ZEa2tQZUxYbjF4YWM3Qm9vem54UzJxK1BpelRI?=
 =?utf-8?B?d3p4NVNkNUV2Z0tKQ1FES1R6dmhPS1pJa212bllvZGNRc1ZYa0dvSGpQN2Uw?=
 =?utf-8?B?eVVRSXhIN0s1T1hNTXNHQVVqT29yU21LeG5NZlQvZ2lMWmRzQlFIRGN4NkJT?=
 =?utf-8?B?aTh6d2VyNVJwVzlaSmZNVU45S0FKLzl3ckdENm9oVWlMQVZWeUlrZ2RhTzN2?=
 =?utf-8?B?bTFjWE43V3pUVEt3WE5xeDNnY3R6Z0xCTzR4aEl0VVhiU3hscEgvNFRBWHQ4?=
 =?utf-8?B?MHg3dEhnM1ptUi80ZHdINGw2MFlSQlBpOFVzNUZ6OGQwOTFoZ3FEN0VOZGdM?=
 =?utf-8?B?RlNFWmhaTVo3d2o3TU1hbmo4T0VwMEF0VzVkU3JlMUhMOUVLZWQ4UmlBekVz?=
 =?utf-8?B?dFBNOHV3eXR2alRFRlIzd2FwL3VBcE16QmlPNUwwb0Y1a0ptTHByV0x0N1FF?=
 =?utf-8?B?S293ZzV4VHdBUDNJQW94eFYrdklibWhaWXdPY3NwQ2tDYXAxZ29TS0VuWWJ3?=
 =?utf-8?B?aUdWUnhuN0M2M3NqU29kVWt6NjhZRWRWblR0YW1tNnZ3dzR4RVkvS3hoLzJl?=
 =?utf-8?B?VHY4OWk4dWU1Qm1rR0lCYlFsNysveE1IZUNJZkV6WmxDdEg3U0FpNHUvazNZ?=
 =?utf-8?B?RFZJK3ZURlhqVGxTRXVuTHFtMXZ4QmYxbzRFY0hyRk95WFNKbW5WMDNFZnlw?=
 =?utf-8?B?OFV0RCtyWWNUbzBjZUVrQmM2SUlRYUMvN3hjSmlrQ1hBMFdiMGptUm8yQTBW?=
 =?utf-8?B?U0lmS3RFWnMybnhpNDI1WC9rOE5tZS90eFFibTNNbXlpYmpLMU9EUW9Sa25S?=
 =?utf-8?B?aTZqSjBuZjFrQkFsTXBvVFpQYkNjNnpRTnpzYjBNc1hpaFgvbEN4RGdMK0w5?=
 =?utf-8?B?cFFNR2tYV0tpdUVramdsbTIvTHBmeC9SRWtUc2dvc1RNbjFMSUZjZ1krZkwz?=
 =?utf-8?B?OGlYVi9RZ0greHFMaWZWWExleFhIZldEU0FZMCtJM0VnS1dIdTZPb3F5b1VK?=
 =?utf-8?B?dEt5bWN4eG9EVUV2NU9Fd0JMOTMrMnVRS2pNdEsvUHZGV2FSY2xNbE1iQTZB?=
 =?utf-8?B?dXBGTHFYdDJHL1BzclJvdUhkZ281UmtjWXk1KzJ6YjhSdlFMSTIwUDhLdllT?=
 =?utf-8?Q?uIV7jcG98J+pqU2y3qSYDQLAa?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52381660-6420-42e6-bec5-08dab2801c6b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 09:47:33.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4gznc2WFS4AHSZ/JBKcm58c/OcN5PINwncwcO9OmCVXFQi0RZqzYBINZ6TI/g+unO/cl1rdp8oY7PCNM5dcNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5003

Commit 75cc460a1b added checks to ensure the position of the BARs from
PCI devices don't overlap with regions defined on the memory map.
When there's a collision memory decoding is left disabled for the
device, assuming that dom0 will reposition the BAR if necessary and
enable memory decoding.

While this would be the case for devices being used by dom0, devices
being used by the firmware itself that have no driver would usually be
left with memory decoding disabled by dom0 if that's the state dom0
found them in, and thus firmware trying to make use of them will not
function correctly.

The initial intent of 75cc460a1b was to prevent vPCI from creating
MMIO mappings on the dom0 p2m over regions that would otherwise
already have mappings established.  It's my view now that we likely
went too far with 75cc460a1b, and Xen disabling memory decoding of
devices (as buggy as they might be) is harmful, and reduces the set of
hardware on which Xen works.

This commits reverts most of 75cc460a1b, and instead adds checks to
vPCI in order to prevent misplaced BARs from being added to the
hardware domain p2m.  Signaling on whether BARs are mapped is tracked
in the vpci structure, so that misplaced BARs are not mapped, and thus
Xen won't attempt to unmap them when memory decoding is disabled.

This restores the behavior of Xen for PV dom0 to the state it was
previous to 75cc460a1b, while also introducing a more contained fix
for the vPCI BAR mapping issues.

Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
AT Citrix we have a system with a device with the following BARs:

BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
BAR [0, 0x1fff] -> not positioned, outside host bridge window

And memory decoding enabled by the firmware.  With the current code
(or any of the previous fix proposals), Xen would still disable memory
decoding for the device, and the system will freeze when attempting to
set EFI vars.

I'm afraid the best solution to avoid regressions caused by 75cc460a1b
is the proposal here.
---
 xen/drivers/passthrough/pci.c | 69 -----------------------------------
 xen/drivers/vpci/header.c     | 22 ++++++++++-
 2 files changed, 20 insertions(+), 71 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 149f68bb6e..b42acb8d7c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -233,9 +233,6 @@ static void check_pdev(const struct pci_dev *pdev)
      PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT | \
      PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY)
     u16 val;
-    unsigned int nbars = 0, rom_pos = 0, i;
-    static const char warn[] = XENLOG_WARNING
-        "%pp disabled: %sBAR [%#lx, %#lx] overlaps with memory map\n";
 
     if ( command_mask )
     {
@@ -254,8 +251,6 @@ static void check_pdev(const struct pci_dev *pdev)
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_BRIDGE:
-        nbars = PCI_HEADER_BRIDGE_NR_BARS;
-        rom_pos = PCI_ROM_ADDRESS1;
         if ( !bridge_ctl_mask )
             break;
         val = pci_conf_read16(pdev->sbdf, PCI_BRIDGE_CONTROL);
@@ -272,75 +267,11 @@ static void check_pdev(const struct pci_dev *pdev)
         }
         break;
 
-    case PCI_HEADER_TYPE_NORMAL:
-        nbars = PCI_HEADER_NORMAL_NR_BARS;
-        rom_pos = PCI_ROM_ADDRESS;
-        break;
-
     case PCI_HEADER_TYPE_CARDBUS:
         /* TODO */
         break;
     }
 #undef PCI_STATUS_CHECK
-
-    /* Check if BARs overlap with other memory regions. */
-    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
-    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
-        return;
-
-    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
-    for ( i = 0; i < nbars; )
-    {
-        uint64_t addr, size;
-        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
-        int rc = 1;
-
-        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
-             PCI_BASE_ADDRESS_SPACE_MEMORY )
-            goto next;
-
-        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
-                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
-        if ( rc < 0 )
-            /* Unable to size, better leave memory decoding disabled. */
-            return;
-        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
-                                    maddr_to_mfn(addr + size - 1)) )
-        {
-            /*
-             * Return without enabling memory decoding if BAR position is not
-             * in IO suitable memory. Let the hardware domain re-position the
-             * BAR.
-             */
-            printk(warn,
-                   &pdev->sbdf, "", PFN_DOWN(addr), PFN_DOWN(addr + size - 1));
-            return;
-        }
-
- next:
-        ASSERT(rc > 0);
-        i += rc;
-    }
-
-    if ( rom_pos &&
-         (pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE) )
-    {
-        uint64_t addr, size;
-        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
-                                  PCI_BAR_ROM);
-
-        if ( rc < 0 )
-            return;
-        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
-                                    maddr_to_mfn(addr + size - 1)) )
-        {
-            printk(warn, &pdev->sbdf, "ROM ", PFN_DOWN(addr),
-                   PFN_DOWN(addr + size - 1));
-            return;
-        }
-    }
-
-    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val);
 }
 
 static void apply_quirks(struct pci_dev *pdev)
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index eb9219a49a..4d7f8f4a30 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -121,7 +121,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
         }
 
         if ( !rom_only &&
-             (bar->type != VPCI_BAR_ROM || header->rom_enabled) )
+             (bar->type != VPCI_BAR_ROM || header->rom_enabled) &&
+             pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
+                           _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
             bar->enabled = map;
     }
 
@@ -234,9 +236,25 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
-                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
+                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
+             /* Skip BARs already in the requested state. */
+             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
             continue;
 
+        /*
+         * Only do BAR position checks for the hardware domain, for guests it's
+         * assumed that the hardware domain has changed the position of any
+         * problematic BARs.
+         */
+        if ( is_hardware_domain(pdev->domain) &&
+             !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
+        {
+            printk(XENLOG_G_WARNING
+                   "%pp: not mapping BAR [%lx, %lx] invalid position\n",
+                   &pdev->sbdf, start, end);
+            continue;
+        }
+
         rc = rangeset_add_range(mem, start, end);
         if ( rc )
         {
-- 
2.37.3


