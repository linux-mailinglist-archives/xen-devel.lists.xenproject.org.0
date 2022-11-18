Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDF62F55E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 13:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445720.701040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0qr-0000yz-Bs; Fri, 18 Nov 2022 12:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445720.701040; Fri, 18 Nov 2022 12:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow0qr-0000wK-9I; Fri, 18 Nov 2022 12:52:13 +0000
Received: by outflank-mailman (input) for mailman id 445720;
 Fri, 18 Nov 2022 12:52:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmcl=3S=citrix.com=prvs=31449dec1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ow0qp-0000w9-82
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 12:52:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb74989-673f-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 13:52:08 +0100 (CET)
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 07:52:05 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6568.namprd03.prod.outlook.com (2603:10b6:a03:389::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Fri, 18 Nov
 2022 12:52:03 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 12:52:02 +0000
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
X-Inumbo-ID: ceb74989-673f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668775927;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Agxby2pijlhMwYVGLa8pxS5eMWT5TtI/GCBc+Zr0uoU=;
  b=NDHCibeu9nDbA8Cq7UFI7YrPBa+4fbKFBJsc4WtOD5LMAf6+Pb0j+/nw
   XfvtPc/biJtt8/8BaH1DVnAi0fwm5p0r9t4AwBITR8WpAM8wx5bu6aEY/
   Q08qW1SXXZOV94YmE9MZVoN2tgQRfnxRLWUlwP6FTbukJ0dG+Pk6gPiH8
   g=;
X-IronPort-RemoteIP: 104.47.73.169
X-IronPort-MID: 84169992
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DLyTkaO8AtH/WtXvrR2QlsFynXyQoLVcMsEvi/4bfWQNrUp2gmQPz
 GEcD2iEbPaPMzTzL992b9m2pkoPsZDVzddlHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tZdP21Ux
 NEmE2gERD+Djf+Yh5Wma+Y506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujaCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toi712L6ezHmTtIQ6DL6h2dFyx2Wv7DZMDh0ScHiCpNX+hRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/v2ARR/vbvTTmiSnp+MpC62ETgYKykFfyBscOcey9zqoYV2iw2VSN9mSPKxloesR2C2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:6fg7XKlbx3tJpjDd7Yh13ioAF7npDfNMiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1Xh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboX0Twk6n7WXdrWrooMT/Sj5/I81dhbhBeh+cz0Y7ptlz3I
 9Cwmrc7vNsfFv9tRW4w+KNewBhl0Kyr3ZnuekPj0ZHWY9bTLNKt4QQ8G5cDZ9FNiPn74IMFv
 VoEajnlb9rWGLfS0qcknhkwdSqUHh2NhCaQnIassjQ6DRSlGAR9Tps+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqeEAX2MFzxGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUWlfqXU5dyvVeIKzNaVwg1DwqViGLHfQIpk03ek6hlS8fsumDcS7ciFuryP6yM9vR/EyWJ
 6ISeBr6rHYXC/T8L1yrn3DsqlpWAcjufIuy6cGsnK107b2w97Rx5vmWceWAobROhAZfU66Kk
 c/fVHIVbZ9BwaQKzLFvCQ=
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="84169992"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix/BDmO+mWR6tWqBelzifYh1yEB5Npb7j0x1zlM+RH71VJ/Cj8DYD8yg85jnxQmV/Bx8btcyVezPA4bEIOtlaFs3AlExTnafARexBqKx0Ykha2VVbqDXTBdTMi8voFcAYRDWkFexbwhTIIrJp1a6/Z0aF80wulHlQ5a6SHFlTe4sQb+FjqA7HL8SE5WRuPlDblbLZ4hAJuvpTQglYyTv79jCvRF4NZJUKdruEle8hfaPEZhYMDpYBZBpfy/HnJ6DRkKXVnouhQe/cyr8FFWDzHkTtakrQvHpUYIhvL/4xEodpW8fOSAZyU3PgFleRosuIod0hh/TWcVjtS2aHeCd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8RNHA89uM0j2X61JYjokoiSPQ3LqYMtOeXQ5jYT2Xk=;
 b=lXMcCAZkp1mf9evurSi+ckfbHZJE5iyK2bFR6eKKkHhz0+dJr3Ne6zN/BiCXyd/9bptdAntShlEekJlT4Xiaoa0CoVYItdzTrLkYUG5AHBKnsyIOckWhswK5bTk+GChuII3Dki2J+Ga53hvJ+82BQI354i33p9TlyR4IPBK4g9b+bSgzNC0MjWCqJDkvsbc3jCEwCmhKf7gq8hsuC6j8bekJXR7/qQ15cy1MWQq2evSHr2u++256RaI69nbh5and3lGK0CaSqYKHXoz3wNZ0XOwzObIkd6LQasx59ZkYRsSgRNskXmswy+XOwC28SyR1c8fmW4SIlHejY2zFJkP7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8RNHA89uM0j2X61JYjokoiSPQ3LqYMtOeXQ5jYT2Xk=;
 b=FS/e4YjOAiELcbwda82hOYSS1kiDo9BimpfvGTuz0Gsj2yC2z5HPYOvAyn7ASgol9P7naSRFSVcmlpn04vgExWOn0rwa2/kqpwps3MI+awlzhIVhD9bnn8jGvIvh1Zyg1pshL7OAtJePLxUVnRM5eDRfbsWrnWl4Jf2fbzzWikw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 18 Nov 2022 13:51:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y3d/7Dv6JmVTpEY1@Air-de-Roger>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b8caec-df8a-49ee-e110-08dac963afe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HGacEQl/g04ZGv+LhCJ5jqxTEIi1j8wGtGtz8oA0QVANlaBLTexy/vv/1qqBfuzN6JaBZPzAUsv5jZpaxRPNSD2GwF1TH9YMpY1KlaN9/S2OY3YS4mAzkpzx0NPgQpc6iBnL2jkyAJa4hbDjx63qyVEjL9DIe8Z0FTnDbA6k7HKdXWzexFa9vtQYzXbVi67Yuu5Qp8v/vBCpi7N/MfTx7ZSQMb7xuWRBCXESALPxSNwZShdAPh8BYE3HUFDXGVBekI/p93B5fX2cdHzD0sOTgm8lJrVrxMHama821DEK2hSv5ExdvRrxksauNEViM+7W7zNKmNAP4trIotbux+X7tdGHvverMmfYdl76IlFiNbZQnE722GA+hjv+dRCcsXCHcXOSVKjSp1NfxBaZqFR4qNXJbUEyF258BGwcdj3Td1WTxAStmc5FmrhLU9wYkkEW18mlYPatJZbE+sL8FZPmQcAuGrJVbevufSyLddEaTfs1/7sRKJV2j21QI0MVuoMnkH/m6k8C9ZQLJV95QGCmzxXA4iZxUGw8UYtTj94cyRErLuFwF8WZDI4PVhtKmfajzVXR7z0GCmyt/kv9bKjlfj0L9LHO2JEUiKCkjnsmv6lg8sIef0nJhSK2m3Gxa+hawqp8CEmK0sWjcPE7WiGLP39HJIc0YB5NM7pud7yCjkmfHRmvOg/jIbwYSEWqXrN+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199015)(6666004)(54906003)(6506007)(5660300002)(8936002)(186003)(8676002)(85182001)(6636002)(6862004)(82960400001)(9686003)(53546011)(66476007)(83380400001)(38100700002)(66556008)(86362001)(66946007)(41300700001)(4326008)(6486002)(26005)(33716001)(2906002)(478600001)(6512007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2RFVElndXJZSXYrTzBheWlaeW4zMkhkQnpBdnFrU1VuL0lNczlCVHc3STFz?=
 =?utf-8?B?aDg4OCtNMnFhZFVJWHNpOHlGR3FnMklMVTdKVEw1cUlSOUxKOVZHZ0hocXMr?=
 =?utf-8?B?Qzhid1VlTmVObnY1NllzRTBzeUExeU5QVytkZEs3N0c5REZkTzR3cEloTytK?=
 =?utf-8?B?Q1dvV2lHbjlqQy9PMXIwZEdRbElMd2k0SXhwQUlLTzlvU0hOb3hZYUNFdWtL?=
 =?utf-8?B?RDVuMzU4ZHJCQkhTUHZxTjZIb3BtMWtMbnRyVWJUUVVaNmc1TzcvejQyeHpP?=
 =?utf-8?B?Z2pGTVQyUktWczJ5OXI1am9CZEVuVUpjVU9IQU5yeWV5czd5SHU5YkNUM3BJ?=
 =?utf-8?B?c3lKK2tDQ1hFVXJmcGxkRDZzSElka0hOaCsvaWlKcFhlbXdoQlVReGhFTFNO?=
 =?utf-8?B?ZDhIc1VXRGMwdUYwWTl6VUloQ05OUnBHN0tJVEx3eG85bFJWQXRwejdHalhJ?=
 =?utf-8?B?bFBraExTQmp3dzBDcU9MTTd2WDlXVEo4OWNjZXpXN3VXTk52NlpTeFlwOWJU?=
 =?utf-8?B?TTZNbWR1YlV1bWtLbHFTYVJEcCtWQmxWK09DUEFvbWxEbmVkbFhvbEtCdmwz?=
 =?utf-8?B?eW5FaDdVdVlkWEUzaFhDNDRVbWRCTlkwUjVQU0ZLckJYRG1sbXVCZFRHK0x3?=
 =?utf-8?B?My8zbHUvME5oZXEwVEZpZnJQME1KZVZIdFZ3eXErMG42WERkSGF3UlpGVkFV?=
 =?utf-8?B?V2NhbEFCOVI1TnJDU0dSOXRTdW1BMXpiN1diNTBZRGdiMlV4M20xMWFLZmJY?=
 =?utf-8?B?bmtPTnYrOVZIWjdvZzFUQUFMTkdZQzY1aC93RlFEcXJkMmMxU0hEeUdpVnZD?=
 =?utf-8?B?WjJWaVNYUExNbnBlWEc0QkxBMVFQSEprall6dGVMQlpzV1laWDA5S1RoL2xS?=
 =?utf-8?B?NHlqd094M1ViVlRCOXFGVmlWeG5NRXN1OVg2L3duYnFRaFhWKy9mTXVGeTJO?=
 =?utf-8?B?U2dNNERiQXh4S1k2R1E1VGgwbXdMcGN5Zm9iYXVYNEZaWjIxcVR6MC9sTHY3?=
 =?utf-8?B?RWNxdy9xS3BjclBvd2QwcGRVbnM5VWxpYnNNcTU1UU9UUWNSSnJQcHc5TERG?=
 =?utf-8?B?MlE3N3NZQ00wWjRLbnlGam9KSDNYd2o3S2NLbFRPeEdCdGM0bTFpTVozWnlH?=
 =?utf-8?B?d0kwYVJubEZvdFJUZFZLSEEwamJmeW4yR25Tcnl0YjNOZnZxdGw3MmFUeGph?=
 =?utf-8?B?cWJjQ2JTck5qbVAxT3ZQQTJPZ3JBMWpCUCtBRmZ6dFVzM3RQZ2U4MTRwUm42?=
 =?utf-8?B?SWVaQ0M4ZHV5dGIzaUx6eTR0Q3RVbncxeHVvOUJxZy9sdStmcmM3RTZtUGE0?=
 =?utf-8?B?bXZ1UUZQSFlSZ3VLZGRnSXpzYS9yVVlqbTlUcWJ0WEgyVjB3SjIzM2JjaFdW?=
 =?utf-8?B?czFWTnJuMUJJOXNEU3N3YWE5cDR1S2xJNWxRM0RSczhOMGhRTWloS2xlbXM4?=
 =?utf-8?B?eXp0VHhpYUIrNG54SGREc1JiVGd4OFFEbjJheUFOZ2xHb1FGOG9DUWEvUUgv?=
 =?utf-8?B?blFlRy9qTFNLY2FXKzJ2ZkRQdTBQWTJMQkVHdFpxajBncWl3WTVVQUZSa0wy?=
 =?utf-8?B?Mk1CU21zdU9lVzAzZjB3L3I4VlFDSVQrQnBqeWwzbDZNaWlkVE9BSDRYN0Uw?=
 =?utf-8?B?dXdaSkEvM3UyZmpWN1ZWQlNaQlZkZjdQTTdkWVJLdEtLS3dYbVo4U1pqTGl1?=
 =?utf-8?B?bVplNEJjTVV6a0E5VXlsTlVjVDY0a1prNm1BMHRaeXovNExYSXFKeFlTTmp3?=
 =?utf-8?B?cHI1VDYwS3JtV3k0dFVhdm10dWgxMWpINmNacHc4QjdqWVdoSTFuc3p4RklF?=
 =?utf-8?B?TCtCUVVhYlBINUVNOTZyTk5YR05oWndObjBZTkJ1TTQvOGxtM0ppVG55TlNz?=
 =?utf-8?B?WVZRTDdrdldQZkwrV1ptL3RYNUZlQTdMVTJlbm0yVGVNbjdRcUpWQmJqdGdQ?=
 =?utf-8?B?NXRxYnN2Q3FoelRQSWFjM1RXbks0K3RQeXhOU21TdWRvb1F0T2JBcnMvb1VO?=
 =?utf-8?B?Sk1sVmU1bTdSUkRrRTZMVUhzUzcveTQ5cTUzWHJvU3JPWkhvdmlHQUkwMmxx?=
 =?utf-8?B?cGp5YXNjZ01zZ0FZeDVVQkRyQkZVSU5XMkdYTnQ0Q2UyMnBJUDVaZkVLS0dp?=
 =?utf-8?Q?Lf8zQPFQnEHnKUOnn7CKGFkW0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DuyFrii1p+PLmLyNqZA0yOjV/KAEP2I1N9cB4Za0YwUcaEcoBzfs+CbLAfC8/iTXe8K+aISSxdL7XdrrL88iXgRncVXWNPCkCur5L/KqLTu+3bRLsSVB+wygL27D9ZDXlQ9WVRogudkxcnwf4YyNYVKIiCSATTyg+4LM9Tx4VPQ0nxbN0njTljhitrwFiM2UNGUbs4cnFejJyAH9o+5xtLIrDzCNoUr33pfM2Hs3X9uZCMxWRaXs73cBRe3In7fiVtj2Aa/VsDLybCFkw1f+h9MRD5rB3rc/D0hQ7dmuQwtOUfOGsmORu4MIlEqwopA1I+odDK3hX2BqeCuPGxVc0/kCE38fyr0KdTzeDkaokZxNjwFfVzDTop8Fx0sNH0jcTlCq8e6LGE0cxiSz4BsWOTzEvy6xVhNW9RPJAZz/U0vQH2VnzYJ+Cl6e+xZHj+kS4QAPYE7V3hTpVoNghLJvrXUjzaFQRFdidBy60D47noUiZ+4ClK7RSxzPBFCd5tALDCz6V74AxcnplIisTzvWvk+OwdSGXezFrzrmNKS77Ai9LbKhH3NFmyzLGla4oE30Qoouq6a4LHj75fHU+XWGl8gbfyUwRYH8J6d6SqkBy02O9rnUkCoIq+LLfZLaQ/xPQWA1qJGYh8l7lhJF7glDoj5zTedYrEmtXP8pmIkRIQZAVULKeyCz1opKI5upYcWmujU7bkEufBAavJKnY7aRGvRvChaj40tR056Y+eh0NoG6adfLTTUGpjRA+AHB7AT1Gcfpb8/ioJq0v1+AiJCYgMAszEOH2pjHfmZAQkKZ+ddDOKg1ssyfhJnaXuF2L86SVmVfHq3E4cxVOaqxvgFBV6szzeLReHjcAx+q19sH9Tg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b8caec-df8a-49ee-e110-08dac963afe9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 12:52:01.9627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEwC30MJ4hXeuGqNRxlc8OY8utmQsEiEq+iFiM8oOM3SUPUKT6Nq9WptOqkRQOm9uzZXReBGkZXDOYgWZRzlJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6568

On Fri, Nov 18, 2022 at 12:33:00PM +0000, Andrew Cooper wrote:
> On 18/11/2022 10:31, Jan Beulich wrote:
> > Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
> > exposed a problem with the marking of the respective vector as
> > pending: For quite some time Linux has been checking whether any stale
> > ISR or IRR bits would still be set while preparing the LAPIC for use.
> > This check is now triggering on the upcall vector, as the registration,
> > at least for APs, happens before the LAPIC is actually enabled.
> >
> > In software-disabled state an LAPIC would not accept any interrupt
> > requests and hence no IRR bit would newly become set while in this
> > state. As a result it is also wrong for us to mark the upcall vector as
> > having a pending request when the vLAPIC is in this state.
> 
> I agree with this.
> 
> > To compensate for the "enabled" check added to the assertion logic, add
> > logic to (conditionally) mark the upcall vector as having a request
> > pending at the time the LAPIC is being software-enabled by the guest.
> 
> But this, I don't think is appropriate.
> 
> The point of raising on enable is allegedly to work around setup race
> conditions.  I'm unconvinced by this reasoning, but it is what it is,
> and the stated behaviour is to raise there and then.
> 
> If a guest enables evtchn while the LAPIC is disabled, then the
> interrupt is lost.  Like every other interrupt in an x86 system.
> 
> I don't think there is any credible way a guest kernel author can expect
> the weird evtchn edgecase to wait for an arbitrary point in the future,
> and it's a corner case that I think is worth not keeping.

We would then need some kind of fix in order to clear
evtchn_upcall_pending, because having that set without an interrupt
pending on the vLAPIC will result in no further event channel callback
interrupts being injected (see vcpu_mark_events_pending()).

Maybe we want to change vcpu_mark_events_pending() so that it always
tries to inject the vector even if evtchn_upcall_pending is already
set by calling hvm_assert_evtchn_irq() unconditionally?

Thanks, Roger.

