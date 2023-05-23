Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E170E42C
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 20:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538671.838827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1WXL-0005Kn-FT; Tue, 23 May 2023 18:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538671.838827; Tue, 23 May 2023 18:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1WXL-0005Is-CY; Tue, 23 May 2023 18:15:07 +0000
Received: by outflank-mailman (input) for mailman id 538671;
 Tue, 23 May 2023 18:15:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOGL=BM=citrix.com=prvs=500b25f39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1WXJ-0005Eo-OF
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 18:15:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbd51d29-f995-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 20:15:03 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2023 14:14:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5442.namprd03.prod.outlook.com (2603:10b6:208:291::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 18:14:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 18:14:50 +0000
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
X-Inumbo-ID: bbd51d29-f995-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684865703;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U5MfgQV+qvb64/SKdDtKUqSA7CzyoMsPYyzVmzqmPyI=;
  b=F7RaS+zoZ7af9NNuIoiC43QnVZ/kBgypeLsBLy5y68lo7pThqiUi42g7
   ZDxLyUr+seE4QQFXBgzVjXWUSrhegvfQ6eZeUaAJdn+LoffBFt19pV117
   LH3C2ZAZExf8DeYDqR23sj1JB57UVJOunWH2sKp3MhCdY4orihVsrgsXc
   Y=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 109434699
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jslT3qM79nS8SyjvrR1wlsFynXyQoLVcMsEvi/4bfWQNrUokgzVUz
 2ceUGyAaf2KYmGkLogkO47n8BxQ78fcyoIwSAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5AdmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rtzJEAey
 cY7ExFXQxy+t8mz7paYaeY506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCDpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXKnA95MRezQGvhCuEWRxWwcBQMtWnyXp/6AoR+CB9MEE
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN0uYdUj0qy6+RXCnGiqr52QFgotvFyPDiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:sqGZVK5cxQdbG6x8vgPXwMnXdLJyesId70hD6qkXc3Fom62j+/
 xG+c5w6faaslcssR0b6LW90YO7MBThHOdOkO0s1NSZPDUO2lHHEGgK1+KL/9SHIVycygc379
 YDT0ERMrLN5AhB5vrH3A==
X-Talos-CUID: 9a23:+bK5/W7ZGPZScZVoVtssqUoxO5AZSF7m7S39L3KIImNHbJ62RgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AWGU0sgx7saft+1c+8iCSqFJ3+y6aqJy2CkMNnpg?=
 =?us-ascii?q?YgMajGSp3AhzMsGi2GbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,187,1681185600"; 
   d="scan'208";a="109434699"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsdUPrSxzGU1geVuR6Oxi0P1Som4tfnLNWfe6Hs3nWMT1cYi8o+RfwYZu3DdjR3KNJgy317mz7Sc/n8PJoD/2hI/FWbGeoQUUB0SuGheP9pYfrhrFhCv0RqNVq3aLVGlyuJZ7NXP0ZU1sKOHy+OjWwJnw7lt1QO1eAAleHwliX4WJJwOjBC5DlG2iewSGhiGMshqCwgErvuJihDnPjhj+f2v7ST7t0yHy6qrftBayoG7RNv8dP/ARBexdjGqt1eNn2q1mEVQ7F94ZeymBqcO/BJhGwOaY9TRJ71jJ4d8sOXPLMqHT2vw3xVs+cA0y4jmYGR6RXHUXAS3ycLL2W1vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxCbUoWjhPX7xYxAhVEmLszIZSLW2bqybMohuzmsJ2A=;
 b=ca/KWMG9ePEyRrogsBYij6XbFc4rt6khqNd6S2Ka+r53TIaPHTz2cuXuylkyWsvYJVZPkdIv7qrZjSO1fD1l9RUWcjmZ5pxSIGAIvlqnfQNv3mYtqe82jaSqJy9Ev1Jmc9zniUPxmeUyq5twO2NGXh4l8K8tRLF90rC7NI17vzDX2xY59uZSD9cj2QBrSb3Sfs6cP7r00j7t9Uz7vdY91YqWMgoOX9KavQznhqmeONeT60ZAzlSlZss3gL+Ob7qCGlFOzO9PVYS5cYaFJC5GR/o6GqrryMfgc+RUVir+AnrRL2WhNMJMA/s7guG0K0bHuw+EtHcqi/SUC+9AoZ+WCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxCbUoWjhPX7xYxAhVEmLszIZSLW2bqybMohuzmsJ2A=;
 b=G2VM7SUHAQqR/X8JKmNs0xmBvq7Eda4yBnSkRXOlN7lCeIf6CJflTEFOedJLVI7JJsiqoLRMa2t+924zlXPAggIfE0unDcZhzK7a84jGoz+7Q8GaEt+InxNb3HKnk7t+Lfg/UrA3dzW7ohjn7UtzYAQsFHs5Z1hEyThWCR3BlBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f04c4e98-84b1-acde-5acd-2f5e18f591d7@citrix.com>
Date: Tue, 23 May 2023 19:14:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 13/15] build: fix compile.h compiler version command
 line
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-14-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-14-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0327.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: 968b3dce-eca2-47b3-c759-08db5bb99850
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BTKLmcRdrFRC6gPz3jSdfBiRHQM4nu1JNYFMqJOYL97lb8b3Q9v4W3kIpPp1ZG8iJUmelWjigvekW0Jc17+Nr/GJnVTERScmdrgwtH02iGJrS8oTIW3je+6e6p8E1y/wNkxbYh59v94o3zxhTT9kLoESiJlbjBS7QRSUVMMUU+h6YCdAAFeUK4PzCp0Ei823rX/XuzZfPP5Hu6BjPub2NqaJYUhtb0cwYnHWK43508PUKUy7fxvfB82i69bD8BZ9NOnHky1IQj3txtbUO7TQaLKxO6tSE49wKgUvGqg2rso21kOMOslq6Y+amLEVndGQ3o6Gs69Pss4LB+IFXgcjjN1ImunvK7ZS4gljwK3m8bFbRjVABEV7Ty3SwE8G6nBqXLMp2yrMXqrUe8s9tHq9jtn0fZ3b1loPbNWVxphyDbkzN4vEISk2KDzS2SGlxe/Wb69GulW1LBkuQuESyTWdkd2hebNFc2B/smW4+ZStPnKNCQXOqfIzoEYTk9teroKEnyrkmtxQO9riJFWU273AUIbC8YpI7H6vvv1pFfVsRQyIfdIlfJlq2aBMMPgvLLUEz97tVDjru+ZWizTLMFkzSCDUgrjx7hT6Dqo8Hni7m/0jq3UmcXrB8rHiToHsJszrGtt9SLGfQkc3Jg5MwRwbJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(82960400001)(53546011)(6506007)(186003)(26005)(6512007)(38100700002)(2616005)(36756003)(4744005)(2906002)(54906003)(31696002)(6666004)(316002)(41300700001)(6486002)(478600001)(86362001)(4326008)(31686004)(66946007)(66556008)(66476007)(8676002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2lpS0tyUVdNVDBzem9uZ1FUS0o3dkdKT3B2VFZzNXl3Y3FkdFNON2lnYkFk?=
 =?utf-8?B?aVhRTTdDNTNoaGlBaUxKRU16T0ZPY2hkYzdGRkVrUEhCZnRadHhXdnlIbDlD?=
 =?utf-8?B?SmZkamZ0YWdDV2pJZFVaN09ub1lFQjlVdVU4OFdsdWI2Z2hZWGRJS01ON3Nm?=
 =?utf-8?B?Zjg3WmliWHVRQU42N1BML0ExSCtxVGZseXMxaU9RY0o2SjlhNTk0b0U0YUFq?=
 =?utf-8?B?R0Z3UVRyaklHbjFnRWdONVdWamhOQkFyNStlUHN2dUtMc3YzL205cmRzaS8v?=
 =?utf-8?B?NnI2a3RTa0hlbml2OEl4d0d4T3duS2ljL1BBZ0lGZU54SVQzSm8yVDhBZTA2?=
 =?utf-8?B?bHJBUE9ENFBEWnkvZHptSC9HMUFzOVpIUXpRV3M5Ykp5RFJtTUkwd2gzdnFj?=
 =?utf-8?B?Y1ZNZXA1eXNjdXNHMzdQUzBLd1NZc1VGQXdTNUpuUU9MUVQrRXZRaFhKZlRI?=
 =?utf-8?B?ZHc1Q294Q0t1dGwrMmdpRlJIMU9wQ3l4K2ZBeVVITEpxSkdKazJqcTNVQ1VN?=
 =?utf-8?B?VXFQY05OcTRLOFVpT2VoTlpvUG1zNzByeHhnZUptSlpwcGRlT1FnNzJYQ0tM?=
 =?utf-8?B?bHczbFlmYTVsRlhyQlpacEtGV09oSk8wN0hPZnUyRmU2NVYyQ2FESUNZaEZC?=
 =?utf-8?B?VjhxNXpxWkhkOC9tczNFbEI2TnZhb1RnUU1HWXY0bllIQWhVQzdoMUdxeW5o?=
 =?utf-8?B?bGRxTDRPL00zVGp5b3RHd1ZvYnk1UUhRVThRdEZNcVFzcjA2VDhWdUtMbS9O?=
 =?utf-8?B?OUh0a1ppanRNS0Z0OTByeUlVSFNWU01qUDBzQ1plYVFvUkJldU5PUjhoR2d3?=
 =?utf-8?B?ZnZDdHhGWlRGT0NTaDhLMDFndmxmdnBmVkN2MDh2eDRnUGNYK21YeGhtb3l6?=
 =?utf-8?B?YkVhbnhMdlpDU1M1TWZFd280QjNvQW5hRTdkQmI2SVBnWVlHQkFwT2tJZDg4?=
 =?utf-8?B?Z2VqK3ZoN0ExNFl5YjE0aUZZSTFoZ0F0M2o4Z1VBcGtiZ2ZqdVJJUVhpeUVj?=
 =?utf-8?B?NjF0TW52dHVBd0k3SW1uc0xrMVgvTC9FM3JBTGJWZ3djZnliMHRkQ1lDampW?=
 =?utf-8?B?RTYyL2VlYlpGVU1URzFXeDFJOVZFZHIzRmQxL09nVktnZ3o0NDZxWElaeEQ1?=
 =?utf-8?B?TXE0VnpNNU9oUVNjdzM1bDJldzI2MFNzcWoxZ0tBVm9ZbDNVTVRKMm5najRx?=
 =?utf-8?B?VnZ6a1lDV2hPWFpXd1FmUGhLcjluaXY0VHZVV1Y5UVV4eXE3d29JSVRKZElu?=
 =?utf-8?B?UVorWEhlRjlQWE5YNUtBM0NEM3dTWnNNbnExS2h1ZDVTMWdhR0ErVFFJVWpF?=
 =?utf-8?B?ek1BdUVtanpkQldLMEVReXlGbkR2bDhiZi9Nc1Irdms2cm9WMWlwWkNXMDVJ?=
 =?utf-8?B?RElQUURuVWl2TFVNeVVtOTIzNytDa2lza2NZbERmaTZjMWlmbnd5MWM5UEJW?=
 =?utf-8?B?VEM0SXpGalEzZ3dnTEpkdGZLa2JreStOc2NZcEpZM3lWRGJhNUgxRU83R212?=
 =?utf-8?B?UnlXTUNNNUNhaHNwb0xkQ2hRTGgxL2o3b0YzaEpXSG9sSUFPQjVNOTlsUEFR?=
 =?utf-8?B?WTFHdlVIakE5Y0RTdXYvT2dzcDZIQTdXd1dYV1AyTE1PNzF0S3ZkZ1JHNDdX?=
 =?utf-8?B?U054eitRM0FvR1VTUXVyWDdUSnEyclVzWVlrc3VHZUw3L2FhMjN2ZW9wM0M0?=
 =?utf-8?B?TUI1SlpNcStjdXdTbXdDaUhKOHRkdVpYRTBBYWMyQkkvM3RMZzU2K09MTmFz?=
 =?utf-8?B?MDdFYzZRcHNiemFETG92TmhFbkc4V2N0U1V4OE55ZXBJOVk3bzM0QWc0clFG?=
 =?utf-8?B?RkVGTFNpWXZSUHRpbU1penpHSnNHNDBhZlBxQXMydndHc3dBZnhUblVvSmY4?=
 =?utf-8?B?Q1Z4SDhzNllNV2syTG9CMEJEdWp6OWZCbGVYVUg4OGpxVmFBaVdCUWF4STg3?=
 =?utf-8?B?NmttVXZXQm8vcVNLdnd1V3hZRkQ3S2JwTGdrR29zVXdBbkpzemZSU3h5a0Ux?=
 =?utf-8?B?SEtwZ0g5V1l3bG1sZnNFUzVrcFNsY1REaFg0TGNjWksrNzRMbEZBc09qek1Y?=
 =?utf-8?B?eVZhYkNkUUVweGJwMFBHZ0VUUG5ITW1TUkFzZ3Uzc284S3hTSWtRNmdKYm1x?=
 =?utf-8?B?ODhLdTMxcEpSTzhmeUtCRW9BaDMyWE42ZHkvZDJXY3B5RC9IOXVPRmJhdFZ0?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	juG9qeXJxhrAvhFVg6VjNDHdlrfvaIMA/kO+O3OUSlRZMr67FtlO4xw/3G4TVMXR7aBkiqn2joLl5L4v02B6EyrtNESSmG2fqvFXkGNjwifhRvYRj3hwPkuehBVF0VoxW1fWyarG2irq8pYL2fXwumSWHaqNXu6rNYw0XEtTUNegu2iF6cOCWCZX+yFepE2KWxN6uLqA5hvBMXZoRc0J8kQZOtJnnsoBH5n9GWtm5z4YDxTgH9lVbzq+bFso+BfSLq49tJEhfQN1wOXw9LZSmmxwtIVr9p+iD9Wl/Z12DksWklFjtDmu1/ddvoIu+CPA40f6HrsN9ORInSqSyXnlSHyBk9og7mMQO2MzDeW9p3sCovJwX+ox1LawE1w23ha0FJo7dNombO6d7bCTXnbi/d+fbtAA+nHWOHCgh+Xf7hkXiN7PtVgcLgYS+w+IIlXoQfSibCihkqJV0FJVUdrsDDxe5OZ9uqX1NGLXS9Gko83PHtE/bb7vFTLoSWBKHhoYlkcVJdA95aJHJXCRGF3DawAPlek44kaecEXJ0Wyi9S2QL+JgsC/WKgn9+XfRhacpuFFjmlS96gezdYi1SZ+/lJIlhV2YYIyxQU5tnGrsDLJQK4zDRN3hbvqJITkiNy3CoXr582eSdfrnxGXjh6cccIoWSrc3VS6a9WCKtg6VQh4HqZJSIgvzpmsZiZVO/LX0eZVESJ9PjtPHaRWO11CHDQAITuULzDRPdKhMyZYsoP1jyd4Wqr2+lmPu7pOAp3pMkbxI84tV2TG/AusO9zVmiaHEF7I7ZKurGeMRok2UbY7GX2U1C9WMcuZPshzaxBzdu3xT/H2D+h0wqZNmhFV4NovOnGWFgoe2X0ZV6SHDahQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968b3dce-eca2-47b3-c759-08db5bb99850
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 18:14:50.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ATAkb0oaiFcdb/ub6X7rhK1XAJO6895ALF2eHYTylVc4A8DNnzLzgE1c9zN1h4HEGmfmlOFKz/E1nKyUeUja6pA6zJc2HtFaH8M6BAT8fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5442

On 23/05/2023 5:38 pm, Anthony PERARD wrote:
> CFLAGS is just from Config.mk, instead use the flags used to build
> Xen.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>
> Notes:
>     I don't know if CFLAGS is even useful there, just --version without the
>     flags might produce the same result.

I can't think of any legitimate reason for CFLAGS to be here.

Any compiler which does differ its output based on CLFAGS is probably
one we don't want to be using...

~Andrew

