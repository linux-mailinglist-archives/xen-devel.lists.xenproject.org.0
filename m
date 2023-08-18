Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE97813DE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 21:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586524.917785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5Uh-0006Kk-Pe; Fri, 18 Aug 2023 19:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586524.917785; Fri, 18 Aug 2023 19:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5Uh-0006IF-M0; Fri, 18 Aug 2023 19:50:51 +0000
Received: by outflank-mailman (input) for mailman id 586524;
 Fri, 18 Aug 2023 19:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qX5Ug-0006I9-D3
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 19:50:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85c9c660-3e00-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 21:50:47 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 15:50:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5346.namprd03.prod.outlook.com (2603:10b6:a03:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 19:50:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 19:50:42 +0000
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
X-Inumbo-ID: 85c9c660-3e00-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692388247;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PdTcimKJGAEgg7OERLJU6KpXxD6UtrxNz0S3ZZZ1CBU=;
  b=JLRjg+4cr80cDNp7RBknSNjuoAa5qevra2KF7mDc+bFdHFwb/ddJnODh
   1lynh0VVm8RKpNEpCiYprQsrwadeTi0hlAnSfgYvI6DHc80YRRbuGvplS
   AaugbhpROdkSeoozt6CeKe1VF2z7wZcvl2mXfh5Apq6R0A34TyxPehnAW
   k=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 119952401
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kKNN1K49rejAyAqcjZr/EwxRtDTGchMFZxGqfqrLsTDasY5as4F+v
 jYeUGHSb6zfN2fxftB1O97koR8Ev8CDm4AwTQY/qyg0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAS7AeC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 tZHOQ4PcC+/tu+H4J+pE+5VvOB6FZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+GF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLRezlrKIy2TV/wEQSFBIsc3GSv8DpoRKFGPd6B
 lwP9w8h+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScC0
 1aIm5bjA2xpubjME3aFrO7L9HW1JDQfKnIEaWkcVwwZ7tL/oYY1yBXSUtJkF63zhdrwcd3t/
 w23QOEFr+17paY2O2+TpDgrXxrESkD1czMI
IronPort-HdrOrdr: A9a23:U/OopKPoElRVr8BcTuOjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ/uxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykBsS8h2njBLz/8+qjgzEl1v5ak856yd3AWV0kOhz0JczqmLg==
X-Talos-CUID: 9a23:yoc6TGO84DFhV+5DQwM45XAWBP8ZQ3Ds7FrCekiBM0IwcejA
X-Talos-MUID: =?us-ascii?q?9a23=3A4gIK8Q6aKorc6LHzgnCanswexoxp/6uULmokj6x?=
 =?us-ascii?q?WkJW/dglVFieGgRG4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,184,1684814400"; 
   d="scan'208";a="119952401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAa8Ri162LFB0g0OcsYJoIlqay7QDQiYlu3Z46K/F++stTUCKZSKdTU2XGF0KMJHkuycVUES/nu4aSfsZAFkZxI6RNzf+9gV6sUlj+fY718BdNiTwxjFH+LJ7o9cPiR4OerAYpwNCTJwlCk8/ngUjxhjlrgZiJoKJhUVa/fRRe7bpzwJ4O2uCvCS9kNYyJR99zcBt7FlxzhJORAiwjytIibJaa0DnbKXXJA2jSKHd0h8O5EM7POy5KZ99VODQJJnLPM8erRJitEFvpc3KZjmMYXcqC+t4qnbumV9vrOLYeUlfIF7EpANP/C2PIkU8DMVMsG3YWJuqjcI6nijI/vFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDzqrjw1YhNXByOxtuYV1M2FaVATqHIsBauoC8lELjo=;
 b=AfuopdjwSawbH5IaSmeu1IfxZ2cMXFH78JGKmnfPt1UZPhcsfzVpqCI2LRF3NoG7EeIHJW/m/JtrgCyXecsYMz9Jpww5aOcoeOOOT/CujkTJI2qMVKv2sNcOswjaBs6uIRXmK52aEV5Yl9SSU+m08lih3nQHfMqtDhY57z4FeA0wQgP4XYTGfTy7wvElJbEtTdj7u2iL/JlPGpLrm9LPbT5VFG2iuGY+kwIOm19yYZn1+ZzCRS3a9JRw3IAsOy0FN9WqValn7mGBLZnlQEUnlQJBszjBujcjVoMlqd0m4oguDTm+xatyqlcfe78PZKCt4H2xryAbHwPx7k3zW2McRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDzqrjw1YhNXByOxtuYV1M2FaVATqHIsBauoC8lELjo=;
 b=FT/5OWG7SABPvQuMqZ6gYcPd0gpwU6gdmzyUBuIOEpNvLQLRUpnQVdJo4PWdRRxZgdGqo/X4ZE8vNIeg3ZvMgQhS5Kmsf0qXAOIgnIrEbQw5m5AM3R5JoAe2gaZDTLe46h9mm1KRilZltj5CpVaMV2nqUrJRfyO3lJbIZMtEabo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c59f4497-24ea-c250-58e9-b26fd3b00ce1@citrix.com>
Date: Fri, 18 Aug 2023 20:50:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XTF PATCH] xtf-runner: python3 fix
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230817105111.4413-1-anthony.perard@citrix.com>
In-Reply-To: <20230817105111.4413-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5346:EE_
X-MS-Office365-Filtering-Correlation-Id: 221a2137-5441-4204-dccb-08dba02467b8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ssMDIr0kcTfFR/FUBoPfyaxrYfHI0Cyz0UvNDYeP+2EFe3C5L3HeyLL502z2cLTNbCLQw+inQgkn5SQao74em0ppBSDj0BQMn7tSXgeHFBKZ2im0jNJUl+I2tzyRViBsb62w3blVJmDyh4aWQ6vEJT3xaYAPJzeemeTjEgR4EwVCDJtX092EHXhQqdlz+KJN2fXwCaRYravAkjf3MU1IFSceESGwbZXH3/1ncI+q++U4ojaIV6WcnNtGX28lmnGdorLDDRtEvuwMEOOrmxhJu3hADEAuf0kIbuNQ+mFGmFNeDuCdrufCj+ON9TfjI8q10fZ9+r5q+IuKTDDxWgTJs4DryamJkWwQrt2FXUYbJECY6drr/lyZANGvSYyIekc8+49Xgc7kiELAUAa0sAntvw92T7tJa1uEX7GcJFX1lAdajcEynSbfaIaZjXDIx8+7lll3tp3C4WUhL2dpABRpFt/ljRgDJ9kClGOy31vZmw6MVb7b3zKXkw5i0vaLTu67fyeEdIGCyInRutbbvuhRD6V1w9x8tf/C0vs8WJIKO6d2ECVW6GrrA6dZVjWiwgOZ6Vt4Ayr4SowizbcecdDBHZ5W9O3rNrlS1xD2sn5kD6CreLQjeshog5Ynb65IcqWOjLzBF4Kf3EFX81ZAv/6I2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199024)(1800799009)(186009)(2616005)(26005)(6666004)(6512007)(6486002)(6506007)(53546011)(5660300002)(8936002)(8676002)(2906002)(4744005)(41300700001)(478600001)(66556008)(66476007)(316002)(66946007)(38100700002)(82960400001)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlZhWUFvQTVjUkM5citCUFEvSTNJUzM4UnhkL04wS1BsMms1b203aW5zMXFz?=
 =?utf-8?B?V1cvdGRoVjlOYkRDQ0FXSUdYQjBHcm1kVVkvMitCNmZxSDRvTXVkczhRMHdm?=
 =?utf-8?B?YTZkZjVHd25qYmRsQW5SODJtQ3NmWkd6bGJvM3BmZjhCODB5Z3REY01hWiti?=
 =?utf-8?B?Y0ZYVUV2UUFLMkxFNjZSUG9zVm1nSkRxTkxkcHpQZ0hENEtpSktMYnM2OFQ5?=
 =?utf-8?B?cHFhcnFJREtOQXpmZHdJM210NEpxNFFtaDlPUXlRWmZJb3FFWGxYZmhidE1i?=
 =?utf-8?B?cGczWHlCR3d2clh2Ymx2dkwrU3RYRWdHdHE5bnNRZ1dpYkFNV3dUcUEvRGlU?=
 =?utf-8?B?UTNMRXlwajZFRTlDZ2dhN1VhMHAwOEU2ZitPOE5xcFA2K2t3clpZMUtzM1By?=
 =?utf-8?B?WUNSK3R0VFlvQ3k0VVc5TjFnUHJ4V21oKzErdnp0R2luenBpYy9kTThmRzJD?=
 =?utf-8?B?UWZpeTNKL2lmVklpWllrOG0wYmtrS1YwMnZsRkVWL25vUG52OEhWUDdsZGxt?=
 =?utf-8?B?dGl0cXJyL3NCSENPbjdacUQraHI5U09NcGk0TG9Uc0dKUE9DRisydDRiMVBO?=
 =?utf-8?B?KzdzWUFkTVU2amI0b3NUMUZEbEcwamNiNWdwTWRxRnRMOFBGOWkzOURSQUQv?=
 =?utf-8?B?SmxNQ1ROcHlLd3V4U0FwMHVBU0plbyt0b0lGWi9QdVN2cE8wUnpXMUxxaURs?=
 =?utf-8?B?d0htSHdTQjBqdUo5eDczZlBCRW1hb2lpNWZnR0dSc2ZPY0Q0ZUN3b25RRjRl?=
 =?utf-8?B?emJHbm5BWVpPSFVkKzFTRks3ZHROODc5YUdtc3RWcytGYktjeVljMWJnaTRR?=
 =?utf-8?B?Zmo0WkFkdk5CNWNjUkN4M0wvK21LQnVOYmVwYm51VHZQd05OeGhyYTVvQ25m?=
 =?utf-8?B?dHJCWjlDVWN5a1BVL0dNYUIrbS9lc2RmT2U3cnE5Y01BbU1KOGlvVjVTV2R0?=
 =?utf-8?B?REkrcWZjVUZzYmx1MGlRUUxlZGRydHpWT1VCRnF3Q25YLzhCS25ITmxWalNR?=
 =?utf-8?B?d1ppT2loQ01lVlc3cVJTc0FqVkFtbHM2eUtYZTMrMEowbGJjdkJXY1NrZDh0?=
 =?utf-8?B?NzlRUnhiaFZxT0lqejgyTGJELzRKMHR2dDNxbXpwclZnMlcrbVlhdlI2LzJI?=
 =?utf-8?B?VEtlQ01BblY2NGxWMG1EcFg4YS9GclRJNzZxRDN6eDlGLzVLWExIZ2tpQVB3?=
 =?utf-8?B?WlhUWGpXYUhBUzYwYXRlRW9aeUI3VFlYWEYzbkpVKzZUa05LVTBvZ1Y3Vzhm?=
 =?utf-8?B?MDN5b3VveExNSGpObnJSeWhBZXVHNnlsOE0vM1Z2SFpja1M1aXJ3Nm5IYXUw?=
 =?utf-8?B?Q0hJUko3V2dXd3pyeWJualVaZnZDNXdodkNEKzZrTmE0bUg4a3JMOVVpOHZp?=
 =?utf-8?B?bkkzcUM4cHFQK3NKdExta1QxeXU4ditYT0ljR0pFK0pwNDVPQ1lVQWlWV1Q2?=
 =?utf-8?B?SW9FSzJxZjZyOStTU1dyaWVtVFMzalZDWDJMSkxNM2MvKzg4aTg1WjQyVXY1?=
 =?utf-8?B?MkNZQXZ3MXh3aTZRdHFXU3JlMkRaQVVLTE5EeVNLSDFwZzlWQVVvU1lyeTFm?=
 =?utf-8?B?eXlPSWF3d08wR01vOERMS2NEUSswS3hvK3Rsc1BPVDhZTmRwcDl1MGRyZ0lV?=
 =?utf-8?B?bHB4Y0FQUXN2WEk0YUFycksyZnlISE9VcnBqUjNPZ1NLdEoxYjZ2VXRvemZ4?=
 =?utf-8?B?VnY1NFdDWnhXVDluUHZGaUZZaUZGMythL1AxbURCRUl1TnRqVjlmZzhnTkl6?=
 =?utf-8?B?TWtKcGhBTm5PbVZYbWwyMEh0bkV6ejRGWFRxTzZIMjcrSm4vb0lOSWVQMWpI?=
 =?utf-8?B?d1o2UCtJdVE0dWlwdUVIRUNxeXZRYXJteDlQTUJmaURtWTJEV3hDVERNeUcz?=
 =?utf-8?B?eTFwQXJYaVA0RnEvYVdSSlVxRldHWmNXMzhnZm1tSElhUnl3UTdxdENORnRx?=
 =?utf-8?B?b09tR2F2RVVNQ3BNQUV3VFlxYkhhSFBsWW5yb3hHY1gyWUg2a0JEdVZaTXJN?=
 =?utf-8?B?OHdFYzFBWmhzM09naXpQVndVM0k0STRLUjg5ejl1MklLQ0ZiemFjeTVmSzdB?=
 =?utf-8?B?Z1ZOLzR5a2t4YXE4c0cyaUxMM21OWGs5eWRQUG16ckh1bDR6K0l4QnF5Y3FZ?=
 =?utf-8?B?UEtLS2s1NEFJOTFETnVpVHBsemZMYUVkdkxlTDUwSlhjQzhQb3l3NnBucE9p?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ayRbiKBoBH2vDCPq9FA6xcn/cop1lIoep3jq2+ruAIqCZ7EEU7oUKAXjKlmZB++4idDJdDfuU/uoAdaXPR81udi7DgrDOS+xwUyBO7TUk7GFYkonc21LTY7YlGLmBcCL7e0t9n6gFctoBQCpTk4I5/Bsi9hsUcHyXg80iZfQPJlxZTSIOb96seDEvk19DMJicwK0PuUbLoyluOVaKqAkpmy0vzXJh499bYyCeq1rpbuv0NzjDIeK8crDfQJVl/z1g8VFFTzYh4vAZNiNPUWKv6WS+TyfBMdF6HZ9nnQ680pCqk2+P8+OzWhiHZ4rnVm1dcuqPtBV6wfefCMIB/V1wmkKvlZkHl5PSfsu1hm/znxMBGJb8SnC63L/UO0iINZolITJtShZ8INz9/OClY67g6d0iqVc4aOagJrRQk2D5ZHOyYRCDGAB6dM1mn/Hjm2HwJLGYAGijKmA6pQik1aM5EfSW1P2oxWr4WvDPgKPNILwLYJXbya5mHK4vLoyE/GTOFH6a2Hobi5i2ryhM1VVumIEp71sVSm+sfQOorsX21X4XhnE4DwA2k7YkXaKfScyI8W9eCrVI2TR9dlWyIBlokdjnP5JGCwxcL38SY2eDYKtPNOZezQfhkVboKBTV2BeMqSy3OiFO0KjIzZT9+8qvoxdZyew52ezqCLWVPF8uovI/7nujvbwaE7ckGxtmbZeJsnCE/EPB7nSASL9sM8CEObNAwW8K5wq3+UDQNBFf4e6k7JFwaAxqqfAU8QXVDSC4ZJ47bMdrFWdGk+aMCVmuA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221a2137-5441-4204-dccb-08dba02467b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 19:50:42.5481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lw8VpsdJVTgGMHU3mM2fUts1eCUa5FKdePwCscOYiKS5E4DJF7SIt2XQbIKGhDAtp0oKPpLtsu2FYKJ4lnuv08L00EWk3SrQ5GTJAUleGuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5346

On 17/08/2023 11:51 am, Anthony PERARD wrote:
> issue:
>   File "/home/xtf/xtf-runner", line 410, in interpret_selection
>     if not line.startswith("xen_caps"):
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> TypeError: startswith first arg must be bytes or a tuple of bytes, not str
>
> Adding `universal_newlines` open stdout as text file, so line should
> be a `str`. `universal_newlines` is available on python 2.7. A new
> alias `text` is only available in python 3.7.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>
> Notes:
>     I've only tested the patch on Debian Bookworm, with python-is-python3
>     package (python symlink) as osstest run `./xtf-runner ...`.
>     
>     I haven't tried python2.7.

Seems to work on Py2.7.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and pushed.  Thanks.

