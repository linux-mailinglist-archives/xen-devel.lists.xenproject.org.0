Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDFC69E11B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498884.769828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSTX-0001c4-MR; Tue, 21 Feb 2023 13:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498884.769828; Tue, 21 Feb 2023 13:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSTX-0001ZA-Hj; Tue, 21 Feb 2023 13:14:31 +0000
Received: by outflank-mailman (input) for mailman id 498884;
 Tue, 21 Feb 2023 13:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUSTW-0001Z4-Og
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:14:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab375334-b1e9-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 14:14:29 +0100 (CET)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 08:14:26 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6123.namprd03.prod.outlook.com (2603:10b6:408:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:14:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 13:14:18 +0000
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
X-Inumbo-ID: ab375334-b1e9-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676985269;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9/DnHKdozb7q5W/ktgv0Wq2StSDL36ifMJlDECpxKog=;
  b=QA9jITpYIrDxzGSeuK0X33LK70foX5fYhpOGMFOI9bzzx2Bk8aam/vZG
   96w607tErCsMquvV3VgXnDjmRb7DanosdkF/ieQV0fWpJSo8fo0YsQLOx
   zdNtn6jeYwEICKdAlfvNg7qdhsZpopAhsJjZ/lccnQN4FHAblbjThflhU
   4=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 97806393
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xvItCKPo5/CFHsTvrR2elsFynXyQoLVcMsEvi/4bfWQNrUomhTVVy
 GBNWz+AOP+IYmWjfNonaduwoBsH6pODyNIyTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5AVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0utKHDxl2
 dMcEywAcAu7rvKt7pjlbPY506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeJpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eewnOjBtlDT9VU8NZ3q0WpnTQLAiQXSFyiiMKgj0SyBttmf
 hl8Fi0G6PJaGFaQZtPgRQ+xpHmIuQEVc9VVGuw+rgqKz8L84QyUG2wFRT5pc8E9uYk9QjlC/
 kCNt8PkA3poqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWdi9T0HXT7x
 GmMpS1n3rEL15dUjeO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComV/lhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:X8CFlKs0v4jhSHyEmAnoZ85d7skDzdV00zEX/kB9WHVpmwKj9v
 xG+85rsyMc6QxhP03I/OrrBEDuex7hHPJOjbX5eI3SPzUPVgOTXf1fBMjZskDd8xSXzJ8j6U
 4YSdkBNDSTNzhHZLfBkW2F+o0bsaC6GcmT7I+0854ud3AJV0gH1WhE422gYyhLrWd9a6bRPa
 Dsl/Zvln6PeWk3cs/+PXUMRe7Fzue77q7OUFopBwMH9ALLtj+j6Kf7Hx+Ety1uKA9n8PMN8X
 Xljwe83amos+i6xhjAk0ff4o9bgsGJ8KoyOOW8zuYUNxTxgUKTaINtV6bqhkFMnN2S
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97806393"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6v16eMDoWQPZngPl/bMOWTL2QoaRVa/CwpbMEF9wCf4geGuEUNSWCP5tkksG82bAH3opGWs0MZdM55cSY4/A1jDwmgTOwTp134GyUtHULdOUU17jwM+7pDJstGxIpYOfFPM/v6H58CFCBqxKHW4ebSPu2+QJaahU3f4cfSINKQoRsKqNg6jDSQ2G2NT2aTH76thqB0to1Nty4hcbsZodOpe9Z3LKh07XTVCUKx+ZIwAp8bUjkhd6z7IR277rlH8KM+H4Hh8WeJoNNDFIFqMpX6PD0+hmkn26GHhCnYTd5Fz/hQifQ+hPkb6faE/DoERBtE24FY67PhpLmG+JkP5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/DnHKdozb7q5W/ktgv0Wq2StSDL36ifMJlDECpxKog=;
 b=BoVjFUJIX8QPUnIxPmtwR77Ts4E+406Tohg5lqpsYqOX1GUYOzi8S9pMfxqc+nxX8WjoPxoud5Ay4tCeeNLRB27WKPZGg5tEaO6P1ulERrqZct/HATWRmQp7gMGl3RGO1g51XRhtbBZlR/yIAEKrcKy9ah3UswrUf38ROw87olXR/MFA2p/dMqFluJWVBco6lEuWeyFyc88sqN29I8pm+naI/HpMMxrAuWhekrmJkreU3JOp4g4C9IMqgLMo9dl01U9+cyG75uC0tfafefVBbDruxX46x1ddjzqRaaCw7Twhk71EE0yRleTBReGtWXJey0zy75d3x0ngLuLJbNkBUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/DnHKdozb7q5W/ktgv0Wq2StSDL36ifMJlDECpxKog=;
 b=H4fyMyrFP7jCsHDHQ+4LvBILjLIFzjdNuom+eYgjbEzxDLH+xh30fN9M2QiRuYsPrv+B0mMud1XICjdslq6W4OTgwZiWRrpgABvQtzrUPS2aDIVYXoKcrmAOK6WRnwUUOboCLYV6AQJVjXszewsU1+/aRbtk+2ZhTqOuGi7r454=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3caf6e6a-e2af-60ad-63ac-ae1a4de8ac92@citrix.com>
Date: Tue, 21 Feb 2023 13:14:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86/svm: cleanup svm.c
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-2-burzalodowa@gmail.com>
 <0f35ee23-c6f2-9015-4328-266baf287156@citrix.com>
 <936cd14b-70b8-0c28-3aa8-85e5b3f2a8c9@gmail.com>
 <12c71fff-a27c-36ca-992e-1b1d1c075c4b@suse.com>
 <712f3022-3760-717d-7683-b320fb8dad3e@gmail.com>
In-Reply-To: <712f3022-3760-717d-7683-b320fb8dad3e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 8143f569-b162-4a9b-a6a5-08db140d8a10
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ufGZfCwLnlWbazvbp4EvgR/vLuTmM/6IlvpkN2NaiDl/eJpX81kVWska9GJuLKuG/te2SCz1DgmbddrPS3KlcXax07B6D40tgR4prIUL0tglECq2xNwlzwWBKlR3YO2dPgBxui+OZNr28pvHN12gC1rC+a9EFPW64BxpN1eldzj2ES9Tttb4b15VQJ3Ilrk9mQ1jTx0RhH0w0U0ZknjWn4L/3jByulKTYqPrzmoQLgnAb0LLVriSRCctZ3uwc5xCyySEIDGBT4hh80bGnStqX+RhA+9JYUC5NmhNGPp5XkajJrDnCyQlslocZlKZnIUD8pCmupmpx1wgqlh3u0gMXyNCKpgr6SJNm9qst798NqoYfE0ZQ1D7JPLKUSrnHYSV8Qytb8KGCcG2sBPfjqttZrUlB5pKRGJR0w7btnD2vtoiE7MouTGaZqhFrwFsPrhvea8KHUE4FS4XeJgpZWn7pepnprzcRJQEh71vfXaEChZVuGhqZTVpouXJBdirjYiB+vW2PjbiVBqQf3HIdiAq8EsdOcSEwqTxUlXlKyriZnijf3qu6CaKx/utAIlefLb81J1fQmwz7E/CmrrLKjCvi3FC1iABvofMT7vk6wbXQA5qaGOravkTpcaDvVZ6H6krxZJs+vlwDzPDr7/oyFeuK/mdhHWu73SfV/YrzavMAPZIA11f8NNnf8c5HPNi7vBfCYZl6eMQsvMP2fuGyPRXfmJAdmdC4kG5MdU/iuXgf0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199018)(31686004)(38100700002)(2906002)(82960400001)(8936002)(5660300002)(6512007)(54906003)(26005)(186003)(83380400001)(41300700001)(2616005)(36756003)(66556008)(8676002)(66946007)(66476007)(4326008)(6486002)(86362001)(6506007)(478600001)(6666004)(31696002)(53546011)(316002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGtNYUNWa3pYQzdrMWNXVnZrVWVhVm1VT0hIcDVrSkMyWnlXSHJwYWphRU5P?=
 =?utf-8?B?N3p4d25PMC9ja2pIcUd3OHRQL241STRJK2NkMmtnSE5vN3BiQ01OQ2VRQkRT?=
 =?utf-8?B?Rmh6Q3BBLzhhaW1qU25RQjBPbnlFa1l4V3BLYkZzbWZNcDhkNGpZdU91Njgr?=
 =?utf-8?B?ZmlNM3EyaXpaa081TUR2aCtHSndlbDl5Z3dyQU5nT3hKZWZHM01maHlRQk5u?=
 =?utf-8?B?M0NaMk03cDFGYnlqbkhSY1VWYzh5RFR2T1dqZFUyb3RvLzZ2dzIwNVpRc2hy?=
 =?utf-8?B?Tlo4aG14bmIvVFlodDlzYWZrdkRNUGd6KzVxb2dlREtIK21qcGRUWWxINEdi?=
 =?utf-8?B?eGM0RVlKcHFGRGFGQk4xTWtreUVYRzVrd3UrZGhhd0dscDVoRjY5UC9BQWJi?=
 =?utf-8?B?aGhtcHFZMlJlenJ4cHJ1SWx0bldmVGNjTHBYSWkxOFJ5VzRCekJFUTRXaGQw?=
 =?utf-8?B?N0JGbWx3eEdidGI0U0ttNnVqc2g1MVNZSGQwL0E0SU9wRUFqMmVscEMwcVFr?=
 =?utf-8?B?a3U4ZUJOTFFEb0NWM3JwZTlyajJ6TDdld2ErcGt1L0QvN3ZoZDlzZDZGQkMr?=
 =?utf-8?B?Yy81VXEybUhybmw1SUNiME1VNGpETm9RY3gzbnF2ZVhLalRrS2o3eTJVMWIr?=
 =?utf-8?B?Y0k2QitJOWZDZnV5U0RWZ3FjRU5hSzRMWkVXcWt1OTA1MURLaytSSmZwb0ZJ?=
 =?utf-8?B?UnFoUTNpc3N0NmdFUWR2azNsUjJLWTFOVlhMbjZENTMvNHFXcTJYK2FYRmtI?=
 =?utf-8?B?NDdSMlRtN0czVnBFLzYxWE44SVJHUnE0ZUpkQmk1bVZQZ1dXcWF0dlAySGhE?=
 =?utf-8?B?Wmx6V2N5bW9EdHozUUYrbzBHeEZvc1V5cytqQTU3K3ZaclpKdHRnUWYxRkZw?=
 =?utf-8?B?N05ZdlErMVExQ2VmdFArcitkK05zMFRFQitQZkxVSlI5TEFRRjNtZXNUc2l1?=
 =?utf-8?B?b21ZRHB6N1liaUhIelFTMWZLTm1ORDQxZy9vY3M2b2tyOE5kdmhnRWpyYUdT?=
 =?utf-8?B?V25BbHdvQ1cya1BhQVlHZVFIcEhkbUVkVG5STmovQkh4OW9lWXRDcXhDRXB2?=
 =?utf-8?B?T3JHMllJZmJWR2ZjRVdFWmNjQWNnT1ZlaHk5WlRCOXBXUTdpN0gxbnNtMElZ?=
 =?utf-8?B?RTRidGZOK1JVRnhCeVQwQXI3WWc0RHhLK09uN1BOU0U1VDVJVkwxNFJuNnAy?=
 =?utf-8?B?NStJZ2Q4TFZGcFVxRHlwaUl6SW9oeEFrZzNPZHRvR3pzTGZ1bXV6L2JCdWNK?=
 =?utf-8?B?Z3FrVzB0OTZVend0SEhtWHFEdWh1SSt1amxGZ05RNm9YZU5vMlgvNGVic3Vo?=
 =?utf-8?B?QU5hZE9Ya0VqOTlwSHlwdk9ielpCNm5iTkZXbkk3UG9aa3hyVWJwZzlLeDA5?=
 =?utf-8?B?OU9FQ3pmc1JpWDMzTGNvdVZEMEpRU3NDRy92YlVlL08xd0JHYUo1WmNDSEhh?=
 =?utf-8?B?RHcrYTd3eTR6NTRCdjRsTEc3TlFvTXE0YkkvejhjYkM2NTdmc0NKR2h5OWhz?=
 =?utf-8?B?ZTBIRDd2bFk5bHo4WGxtV2hsUU9RZWVhQ2toaWNGSEdlbERTWGJUMGxWMVlD?=
 =?utf-8?B?cDZpeW5sWDZEV2UySzFtOEVjYXhSR0MydktvTWJjeFRwQmpjcFdOQkxZdmFQ?=
 =?utf-8?B?Umk5Y0ZDcmtvSkRGS2RDMFhqVnR5N1Q4NWlzR2EyMXZ4dGxyeFplZVY3Q0lx?=
 =?utf-8?B?MVRMSlBjaVFNSml0RVRTV1l6WW5HRVk2b2U1YzlYMVZtSEUzVElXSUprellx?=
 =?utf-8?B?OWN1bUc1UFFHVUlUTHZKZUdzKzllQXh4MDNpT0Y1LzUwQnVsQzFIQWcvdEoz?=
 =?utf-8?B?clhZVEdEWlR5VU4vaUVCSFZ2V1J4YXpMRGRlWkFxcTFYNlp3SW91UnpQR013?=
 =?utf-8?B?ajZ2d0tocXJXTjF3WmdSN1BnRkozV2oveCsvVEgzRzk5T1FGV3U1YWNMVFZB?=
 =?utf-8?B?NkJ2ejMvWSs5OTY3anpodCtqVTVLdGFtTWpGSTZZQXE5Z1Y3dXNYWC9OSG5U?=
 =?utf-8?B?M01rMERjcnFjaFVaMUlXT0JUc08vNi9jeWhLdDQ3eFpWSGh3VDR3djJ6TE1r?=
 =?utf-8?B?Y2I2YkJqRXRHNmFyd3M2VmFnbUZqeGVrRjlCYXVFSDU1OGVZUzFBck5IdHhY?=
 =?utf-8?B?cm1lc3daaVpUWUZMQjQwWlNxSmUvODdhZVk4VW9hTzFOZVRRTU56OHRzMDNy?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xzpcREKU2uB1FiKmXb3pks+dK1hU3lcTsxz2ufmyGufp5SDCb69Zqk7CR1VWtI7uccT3efGAyXQ/WeQEfXrRO7xxAj5iE1kFR25bsQCrccOOnkWIyRJXAZ6oFCK0T4Lj1QjX4SLXuRQZZtkr79iIAvM7tKAVQ8/wD+LdwkCkWNGgGqSavhq2qLOdLcJt5yfJponbwyguDkd8gEyNSoGCNH3WrIZistnm7q7ksccuDWQryicE30L/wbInq+rf7U5v7QK+CxDnYZZpE3sCIO6Dp++zMgBaPcz5w1ROoJPtAVHVnqkMj6cMEUYxxxjW/eFa8AjsCNJclI3CIeGSIXp2jFxDJ5f8JYgsu/WdbB8axvmZx0HqzbiZOZi9rLMQBQy9iAbhwPcdS446sEscChQFWnmIMP7bGA2qfadYxNlY9MpHqaKhsVwW/58ui5Ywi+A0gjDGotvSOqf9kqKnOjGM2K134u5Fmch35S1T36AMZSUIsVO9kQYmAAg6mtpEZRSb5CjVU8FbvaAs5rnj9wHnBny96PgBaLGk+DC9OCbVgB374bVTSgcCQmReitZL2mo6fWPa31KHXD0PPWmufaYyW9SWzj3mnLsqKTcvJJNxwF81wqJsQVlFWl3YH3T10j9tr6/rHq9+VBROdvI19Fnh6AW/YRhZh4CwbP/sSmzQUYYD5XWh3+SF0hS7/Q1Lmm1IHdM2/fO9QlBxmyUQEvjKYOq1y6pRE6r/KnwYGPTS9N1WiymD0/6WjZsa55qyKlyp4UWADfAxCRQdE2EFpUYou7CeyTorZYkczdSvGRBFnrcR7efF6JsnfHCAPUUZ4wIwGvxhVGS+G0GjY/X7481iT6x5b/8W791cRUfqtphyXps=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8143f569-b162-4a9b-a6a5-08db140d8a10
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:14:18.7472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IpdR5uLu75yJ1DYIxmVW47jwHNXmfhaygEUo/f/q01E6kQSKeyro2KnOPKqUTViflnqP/Y87mNcjVyDM3Zj2FsI9rdPhATSZdwfLRZyaDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6123

On 21/02/2023 11:42 am, Xenia Ragiadakou wrote:
>
> On 2/21/23 13:12, Jan Beulich wrote:
>> On 21.02.2023 08:45, Xenia Ragiadakou wrote:
>>> Hi Andrew,
>>>
>>> On 2/21/23 00:12, Andrew Cooper wrote:
>>>> On 17/02/2023 6:48 pm, Xenia Ragiadakou wrote:
>>>>> Do not include the headers:
>>>>>     xen/irq.h
>>>>>     asm/hvm/svm/intr.h
>>>>>     asm/io.h
>>>>>     asm/mem_sharing.h
>>>>>     asm/regs.h
>>>>
>>>> Out of interest, how are you calculating these?  They're accurate
>>>> as far
>>>> as I can tell.
>>>
>>> I do not use a script (at least not a decent one), if that 's the
>>> question :) . I verify that none of the symbols defined or declared in
>>> the header is used in the file including the header.
>>>
>>>>
>>>> Looking at asm/hvm/svm/*, intr.h itself can be straight deleted,
>>>> svmdebug.h can be merged into vmcb.h, and all the others can move into
>>>> xen/arch/x86/hvm/svm/ as local headers.  None of them have any
>>>> business
>>>> being included elsewhere in Xen.
>>>
>>> I can send another patch for that.
>>>
>>>>
>>>>> because none of the declarations and macro definitions in them is
>>>>> used.
>>>>> Sort alphabetically the rest of the headers.
>>>>
>>>> Minor grammar point. "Sort the rest of the headers alphabetically"
>>>> would
>>>> be a more normal way of phrasing this.
>>>
>>> I will fix it in v2.
>>
>> I guess this can be adjusted while committing, seeing that ...
>>
>>>>> Remove the forward declaration of svm_function_table and place
>>>>> start_svm()
>>>>> after the svm_function_table's definition.
>>>>>
>>>>> Replace double new lines with one.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>
>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> ... it's otherwise ready to be committed.
>
> Great, thx.

I already committed this patch, with it fixed up, and one other tweak
that we commonly do which is to leave a blank line between different
groups of headers.

It greatly helps people trying to figure out where to put a new header.

~Andrew

