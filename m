Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544ED743AA2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 13:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557419.870748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFC7O-0004vW-MU; Fri, 30 Jun 2023 11:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557419.870748; Fri, 30 Jun 2023 11:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFC7O-0004tJ-Jf; Fri, 30 Jun 2023 11:16:50 +0000
Received: by outflank-mailman (input) for mailman id 557419;
 Fri, 30 Jun 2023 11:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFC7N-0004tD-LK
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 11:16:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 983d4cf7-1737-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 13:16:45 +0200 (CEST)
Received: from mail-bn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 07:16:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5751.namprd03.prod.outlook.com (2603:10b6:510:37::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Fri, 30 Jun
 2023 11:16:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 11:16:31 +0000
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
X-Inumbo-ID: 983d4cf7-1737-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688123805;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Az1c92CIyNCg9JJKlowrDDZBFJVCMQxO8+4H/jCF1dE=;
  b=EXucqMa6HEBMn8Zo0PCCnBq/Ho1YvYhpFl8FPJF9Tqeux1uG0ahqSM5D
   7Qio/lB5abrv89g7oI80BsmzHtA66//Y9w3iAZLMCXcnxX2Mi/8uJzTmp
   vt7M15kUuh1REBFEkUDsjfXm5SslmIMYzSlAZSQXec+13BmOy/EV0aMeQ
   I=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 117295938
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+p/4tKP2gjhL+I7vrR1plsFynXyQoLVcMsEvi/4bfWQNrUokhjNVm
 2McW2/QOfaJMzamc9EiYI++8klV6paGndZjHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tG5QRmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t5KDG1E6
 foVEx8MQzTf3NqI5+mnd8A506zPLOGzVG8ekldJ6GmDSNwAGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PNxvzS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWwnmqBdNJRNVU8NZr332ywksNAiQ1XHaWsNKzhXySYI52f
 hl8Fi0G6PJaGFaQZtD5Uh+xpnKeuVgCUt5UHu89wAqJzbfYpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuwNjISNnQqfjIfQE0O5NyLiIM5gw/LT91jOLWoldCzEjb1q
 w1mtwA7jrQXyMQNjqOy+Aidhyr2/sSVCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnzjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:t9fMrKBk5k7yJJ7lHejLsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5K0tQ/exoX5PwO080lKQFmrX5WI3PYOCIghrKEGgP1/qa/9SkIVyHygc/79
 YeT0EdMr3N5DFB5K6VgTVQUexQpuVvmJrY+ds2pE0dKD2CBZsQiDuRRjzrcHGfE2J9dOcE/d
 enl4N6T33KQwVlUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD39jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xir7B8er1vZjXOIi3rqpsL0ABo8Fsp6nIpcNj/U8VApst1Q2L
 9CmzvxjesdMTrw2ADGo/TYXRBjkUS55VIkjO4olnRaFa8TcqVYo4Az9F5cVL0AACX5woY6F/
 QGNrCV2N9mNXehK1zJtGhmx9KhGlw1Axe9W0AH/veY1jBH9UoJu3cw9Yg6pDMt5Zg9Q55L66
 DvKaJzjoxDSccQcOZUGPoBadHfMB2NfTv8dEapZXj3HqAOPHzA77Tt5q8u2e2scJsUiLMvhZ
 X6Vk9Cv2JaQTOhNSS35uwJzvnxehT+Ydy0ofsuoqSR+4eMC4YDCBfzCGzHyKCb0rEi6s6yYY
 fHBHsZOY6lEYLUI/c44+TPYegtFZAgarxlhj8aYSP4niuZEPydisXrNNDuGZHKLREIHkvCP1
 prZkmAGCwH1DHmZkPF
X-Talos-CUID: =?us-ascii?q?9a23=3AaSYig2nPpiN+sk+StKkA7riU7tPXOUXgwXvaP0m?=
 =?us-ascii?q?1MkloZZnJEmeu3/h4ruM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AnLJs7wz1RMJK0Rnk1GK6r4l6PROaqKXxKGEJtos?=
 =?us-ascii?q?MguqNGAFhED2SvhiMHqZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,170,1684814400"; 
   d="scan'208";a="117295938"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aixmwt4+mvfLTLcWgVOoReQX2RTdwpSWWDbIKZo6e3U+ytq+M37nZn5FwlBHYb81tn5VasMEPJ38tAA6rm2itb+nlMOrsrX5MJj0W0ppZ59bRRO3iER9yxOlkAoQ36FCFm4FQv03CbMWLhFd2VBjUP/53dQFRCh1bxIikfcgw+ND1G4D9/vAawhg2UddYgbtz7CXD1HHqB6uLHVPASv4wLDBRwTQrmhURKxcv8gmwfG7cLNeGgXp5l/4H7dC/MSfQ8xqdvIs5EaEoAQXelsvj5CIlBfsepVnheua6/5ia3UJGTWxlcGiu/0WhxWwCQncqTf1niCr5rrSCTF1bskXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eESLJDClJJkI37uLbtZRdHkpiVAVkOXpBRso3k2GTaM=;
 b=hiP1vruFZTOnM+/i/JoSV8QLZxE3ONK141N2AqKpYgOAf9iJbI2I6V5mE/GkFfx/z5u7t9itPpGC780ttvUR/ZFELkfATOsleC+jY8b+Q0kj0o2GKrV+7OTy+j7lc6sxxr7VJKsJXlI856Jfx53IKaaZbYIkO2n4u3GYLP+cPexAHOb1fkyRamE66BRqws4A7hb8dtjCmYfKX0Tj5e2M5eYgBi5Vp7ewe2DFb1HHOyi4XsDBkWMTK+ez1VwCzxCmkpT2SvY6qUpEycdz8435oRTgWz7NB8z8hpLeHsLNgRSWBnV+iRUwb4wna7BXnQX7YCN/+wNhPxJEfyeTbHvsMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eESLJDClJJkI37uLbtZRdHkpiVAVkOXpBRso3k2GTaM=;
 b=G7c8wDPWP4tWepzq5DLHoju4qK/wGxjRAL078QCes5RXkN0Cq5ljheBvYfVkaXnZipLKoZnPMjH+lXK2eccRAizxAn252Ix3cxyL4qPS6OVKjTl8I8NPCD29eoLD4Bo1IGnsbS+Yqcc4gI+ack+yfs5n/neqgDgdwCwC5X3HlfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <524aaef8-1869-ad67-826e-1175fb38795e@citrix.com>
Date: Fri, 30 Jun 2023 12:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/3] tools: Add __AC() macro to common-macros.h
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
 <20230629121713.1211-2-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230629121713.1211-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0425.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ea16c8-4eb3-488f-fe0d-08db795b74d0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l5XN8zKArimOvw0894Ug8FzSfVUXgDMv15YXv6oVSZiBfnaHwzXdNyg+ar9Set2xjW825jwkEhF1y8IEO/+zJb9c2Q9XoxkrS/tVAn1njvCkLRPcllmRyQF2pcOmJBLEiMMuE6go9MwhsTMthDzBln+p0+gQbeNO7H4YPHztFt+otql9uRwMaJpwBpAT+zQu8EdAApW1BYk/WeGSKIXcDu+F5s5Vj6rZcNw07/vEGRQJzRgIjAs9h89r2ng6cDIdbuqGap+VPgRxY71Y/5LuuxLqRdrbevGad/I1mdTBgRjnYoI704dfqTzWY90KL+nVDKD3gDplehz1rgkYoMD4nyv/zZKv1eEINKeWrjKJjRQ+pNUpYBd7VuJOBC8UQdaaVZqwyzse15jh2MM204Cs1FCqTMMFe9JFYRrPPvZfjzBHya/c8igRdOML/qIletp6CS3ZrDgWbwy5mN+ItEuIrV7cJYA7GBqQ6pc1+qvpz4RcCDu7LTY0Dy7uuAdNy816BFIRvv5bnGahoGWbumjEF5CWBcSAC8Tfq92pnBA37vngYPV+TfSa+RtwFXv+AV3qjvfCaaempGIC9/iSG4tQK33f4yeERVF7ndxT8j18kdOMdgB9O3LlJ3QoBMsGpF97iS7caGbLECE5ygRAeMa8Bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199021)(5660300002)(110136005)(478600001)(41300700001)(6486002)(8676002)(316002)(8936002)(186003)(6512007)(26005)(53546011)(6506007)(66476007)(66556008)(31686004)(6636002)(6666004)(66946007)(2906002)(86362001)(31696002)(83380400001)(2616005)(82960400001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0xJLzBReFJtWEpUSmMwaEZ2M1hmdk91SmtaNnFzTkFTMjczOUptb29TUFFM?=
 =?utf-8?B?OW9xdktYUWp1b091a0hMU3FaUVZlY09HUFFHOGd5N3AvN0tuZHJJdS9mTlFD?=
 =?utf-8?B?QUVYMEQrVVh6a08yQ1Y5UjNVUjlTMldDWGt3RnA3MGV4NFg2alV3VGs3Q2p5?=
 =?utf-8?B?L3ZHQmJhTXVBTDZxWVBPR0pxRE1mbE5mamljY0FGNU9VaEowdEZCVDZwajRI?=
 =?utf-8?B?TFQ2L0hCSXhtOUdZZHQzNFYzMEVCUVJkWGdhOW5XQkJ1TmpaKzFLRW5VMWg5?=
 =?utf-8?B?YVBoNyswa1huL3JPc2wwQ0ZJQXR1Z2ZocmJySElwTE5kanVHek11ZFNNbW94?=
 =?utf-8?B?aEs5eHltQ0ZRNTd6MDRhRFlJQ2NTUXRGK0xzTzBXS1ltSVpkV1ppV2hSQzRl?=
 =?utf-8?B?U2pocHljTWd6b3hEalFBb3Rqamo3NXFJTUttNHZXOTZ0MFpNeU53NTNBQVN6?=
 =?utf-8?B?L20vMmlNUzVwUjJ5cjVTemhQeVlzcjlMcm9QOGVUUkRQbEdtREc2dVlEOUN5?=
 =?utf-8?B?ZTllenBITWM3MU5GZXdlWVVFSS96eFl1VW9nTnJZOXlzK3BhNitRUlpncyti?=
 =?utf-8?B?Q0RjWHJQVmU0dFJ3L0lobVNmQ20xQ3RsOUdvQm8xWXpuWFVxL2JOUWRtRGdu?=
 =?utf-8?B?cENSRzlMZk5sL0R2ZisxdDhIZGg1bS84cHRvanRCMU5VN1UzS2dIcWNhV2ti?=
 =?utf-8?B?NlZybU9YYURzS210WDRRUlArN0k2ZERERnRRaVpLVVJUQ1RsT3hDcStUMFVX?=
 =?utf-8?B?V2E1RWJRYWRIeExvRGIwaDdicFEraC9naGV2TjdoQmJ0OWplWkppZ0JrQ0lt?=
 =?utf-8?B?VUxzNVJwTlA4R2VKVmtQcGk5dVhkdTJ5a3RRK2JEc1FORUloNnQ1WVcvOVhM?=
 =?utf-8?B?YTh2dTIvcEQ2RStjOUp1akZwcXAzcnlmUUkyL0VqdFVCT3ZZZFFxcWV4REto?=
 =?utf-8?B?V0JPbXZwQXJCeGlqZUVBOTJacndqNGl4VmVlNEd1eG9ueXFPOTZkdnhyekdj?=
 =?utf-8?B?QW90bkxGeU5jY3hadzBpalI4VitXUHFvOUljTEZidUZ5ZGZuS3BRZ1ZuR0pq?=
 =?utf-8?B?UlB1Ry9ORDY5Mm0vb3d1NmVLYlhub0ZEYlBhSGhTa1RYMnVSZ3lQUy9yUjNT?=
 =?utf-8?B?U2tXMDRBN3laOTMyYmI4OVc4ZDRQWTlvbzUzYVF1Yks5ZnVjZzJNQXVCcmdu?=
 =?utf-8?B?ejdlNmZMMFkrZGp6ZElzTFhhZ0NIdE5MYnBYczV3V0lnT2lZZEdXeGFNQnFm?=
 =?utf-8?B?aUJzVU1wNjR5VHRUOGorQ0gwUldYSXdEUk9IN2ZWbEhpUDc1eTY0eWN2S3l3?=
 =?utf-8?B?QzdzclhZTmJuOUQ1SzVwL3hTUGJUQzUwL1BsM2drZ2dBZTcyTVhxcWpoYWlw?=
 =?utf-8?B?S1RMaE0wT2FvcTBNTWhKNnRSRVJhcmd4TDd0R3FMeGxNVzRyT2N5ZUxGYlEz?=
 =?utf-8?B?TTk2VHBHa3NRWUo5cHM2cVBsUEo3eUJVaHJDSlEzdnNscDJZNHdSVjBFbGdB?=
 =?utf-8?B?ck5qNWtxcTZpN2diMmhhK2svQlZxdE85MmRLb0Zrb3FoN0ZYMU5mc1R6UVJa?=
 =?utf-8?B?cXE0N3FmeFE5NkxCem51ZWFVaDgwOUhPaG54dlUySzl5bDNJd2ZBUTF6OWRo?=
 =?utf-8?B?YktJeGZuZlJyWXNkakFNQjkzUEN6MWR0L0RNU0RkNmZTRzRyOFlDS29zS210?=
 =?utf-8?B?Z0xmUjVKNVhTY0FXdGdQakpzZStWVitSR2RlU1NXc0hZQUI0T2tScXZZTWZM?=
 =?utf-8?B?cjFvRHozaUFSbWhjekFVMVpzS3RLWFJOcDRKNkoyOXZDUm5mbWYzWHl3RkhO?=
 =?utf-8?B?QjF0ZkFpVVNTM1p4WU43VEhvOUxoaWNoZXJzRGFSU2loU3dlY05FdzNIZElK?=
 =?utf-8?B?N2x3ci9uSE9Makl1WURzN0xIckRnZDNUMFB5dE1sS1BOOTRRamptS3pkNFg2?=
 =?utf-8?B?WUxpV013NXRIc2dqbEFTRitOa0JETUh2SXJxcVZ4cW5zV3lxQmxpZHQ1L0t3?=
 =?utf-8?B?RVJlWE5qMGIzUFFGM3VVS1Z6c1ZJcjhRa04zeU5NOE9zQTB6VS9JUEhtdFVp?=
 =?utf-8?B?WlZYdWNCOTUzOVJmYlNaZktWcHU2UzhoYm0vdVVzbUpLdFhvN0pkY0w3aFRO?=
 =?utf-8?B?cDNrOGNmMVFjSTVjSW4rVnNwVU5oaEEvYjJwRTd4VlppZkpIakdYaVdwTmJt?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ICrSjVdlXKOPioRM5KKsdkjtpUbC8wUFlnFJ4AkwlA6HmH+D0/yjGHmfIWs7nor56q/P4jbGsDWixVKyUeyoxqh3K+cWahUb/mZe2Ij1y6HR8Ma5TYrz/FnWOAKYJnFEjkLGMDmgrfxJMsEbfLc8WlZL5xs5XDdN7qB7T/Ss3mrTTKJ2rIBLMmtvL/PoATbqM8PuZiVH4e8GT2ApU6n2uweEeWNLSgeyQtpIUf7pjbaFFd+woBPSx9mdtI2FxWP9Y4jL1o+9ldhQ+C37bLLhZZX0r5K6HtjwDCPc7+H0C+FjSsIw7XERPe3YATzJnsDVg4EHCMF6pw3DAszL6uHExPlUPiqfWN8XBZu21KJO+q+JbkFG9tXF5jcokhwtNirYi09xai9i8Yhyk9+vgy9DBZIU9w2PfSMeMArVsfFzCZ4XbwiWy9ASNjceNEvVH2OrRxp4krIUU8kbAKeUHTy9yU/qqklcGYxgniBx2+1u11gzMZlAq0lN0ha8QaXC00ZpIBlErX79oV2zZBRbSyBqZUZjZ0E+YWm0iNn2DzwRNjcmSP+iiLPXXArLwSQd4Ke6KKCfDwHQvNo3SYuJ5wnEike6UGhxQsdKOyW9foFmwf4GTQB350wEs6862In7kzTB2z9ui/BKz5WSwu32AaektVY0qYxYfGKTSPWbq5YZR6/Rn58wSCAMjdfR1d6TPQ3CJU+XYisDJL5W3NEXVWtmBo/eUHa5G+8eneUDXcXP/XKsBH/CXZiB7YMxFk/qqTkSlhkpZbkxC219SjVBS3u84DUGv2uqeKTUy9LWS2I8qwz2QnJpDJKsu4kM9ShwW1e3cfp7rPS9y0Nvdmp/lk89Vg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ea16c8-4eb3-488f-fe0d-08db795b74d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 11:16:31.4851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzd2KygGocw/hiflaN7Ar3H5iDPJh6MoKZPqaxtJWuqB+Bufe1QJhzZncQMzmNSdaur7xTLEMuWnL2u50t0Q99+tHU2K50fq2KzQ6/pCd9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5751

On 29/06/2023 1:17 pm, Alejandro Vallejo wrote:
> Currently libxl and the x86-emulator tests carry their own versions. Factor
> those out into the common macros header so every library can make use of
> it. This is required so the following patch can add this macro to a header
> used both in Xen and tools/libs.
>
> No functional change.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although ...

> ---
>  tools/include/xen-tools/common-macros.h | 3 +++
>  tools/libs/light/libxl_internal.h       | 2 --
>  tools/tests/x86_emulator/x86-emulate.h  | 3 ---
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
> index 168691be0e..6d7de1bc0a 100644
> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -84,4 +84,7 @@
>      (type *)((char *)mptr__ - offsetof(type, member));  \
>  })
>  
> +#define __AC(X,Y)   (X##Y)
> +#define _AC(X,Y)    __AC(X,Y)

... I'll take the opportunity to do style fixes here.

~Andrew

