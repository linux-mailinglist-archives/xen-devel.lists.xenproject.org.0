Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A61750AE5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 16:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562564.879299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJamY-00072C-W5; Wed, 12 Jul 2023 14:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562564.879299; Wed, 12 Jul 2023 14:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJamY-00070S-TI; Wed, 12 Jul 2023 14:25:30 +0000
Received: by outflank-mailman (input) for mailman id 562564;
 Wed, 12 Jul 2023 14:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJamX-00070C-9W
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 14:25:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2685bff-20bf-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 16:25:28 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PR3PR04MB7212.eurprd04.prod.outlook.com (2603:10a6:102:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 14:25:26 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 14:25:25 +0000
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
X-Inumbo-ID: f2685bff-20bf-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+Whk3ZjwvGog9jqyDMsK572DTqQn41KB7pG6skssYZR3hiZ2sXBiqEu21yd+zSZ1s2uhWK8CxDeN36mjk4jBLzrf8ladfBFuf+lEPy7ZptyCJcmRFMssMRsm/a8tBv+T8SvEBpOazkMiOEouRXqZl//N3OEotm+qWyJO78mK7doAyTvtuwxaZ4+FKSJkIuR8xPnxkxBy3L1HpfAesW2d9UobTxcH1aWhxRP92ft2XKOtQwy6aLMcwaPk94QwxMU73/lLvh2suH4h5mie40MZ02/hpqQw/U703ujwJwmmuUWx5LQzVVCbJmbjQBP/qHdC2LmzdUrsExxmDhESG8oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=actnbxdtcI+RA2YJzPiZ0LnEyvRXEVw+dZc506y8HFE=;
 b=jqg4Np3Se3XGomdJYKG1saVYBVQuN0ZdkkPAvsRISF82ZKojbCsQnFwByQUjGLp+yLXdhVj4Yw30/GvQ4gyXkO+H3LLBdCDUwiZTwWkylU3LCyDeiq3xmmNGTBXyHAA79EsU8Nt08cjVnorstlCiwRM3Vcvv6VS3CDlIlsHuhXAI0amD/oVCnIN1xowKjQhO/KMi9VweAeZsZSu7LGT8NV+ej8rxC2tIOKSLri7moyCVq0i4uDfen9rUukVyefe+TT2p6PWa9EpGT3mqidTwlOuQG0ypm7dPw8jqYFoZoIVE/nEpsnolRAhq48du0ZIWYhTYLvFv+F2RjBUa1erc5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=actnbxdtcI+RA2YJzPiZ0LnEyvRXEVw+dZc506y8HFE=;
 b=TOFD1KCdTxW5HNkL+PfKBC2R3cyCvkNrwAWpdqMBsfd+IHkfNrTFZk4J41Qn3Iun2oX5evhdh+t/WNBqwn7gJfGG8okOzKWw2yQFEf6/KK5ojktxvJt5OMD8XZ9GAOwvRf7OCtw1X8Bl8GMj+jsQ1M+RX90WHhvV0Dh/5g7YouRi2mp/1fEhUeO+I2ZLazgfyFRzjg40hh5yLllsiwXDvKK26DBM69LoucSfB4wSrOsVGPmSizluXeSmeFsviCQ9OqjmyjHD+5hWDymAPPd++D5VkcglGzAm9s6o7whuUeB7YSVuHFOTUa8AvUwGv+9hfNU2TBdCIVWfK39QNEn3gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fdf90115-7ea8-7835-c252-aba55ccf86d3@suse.com>
Date: Wed, 12 Jul 2023 16:25:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH 0.5/3] build: make cc-option properly deal with unrecognized
 sub-options
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
In-Reply-To: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PR3PR04MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a27805-536d-4f20-c776-08db82e3d5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zQ89SBAsJWKrqc6EOnSRfEtmu1C4evK4HYZhy+z30ZzcbuStHJBQ7EYQnfL/Vo0jZhRV9aFGNVMQSTqDnhbVAhZX4JTgOd7caOM97CCpdHc9IaZglriqaqI9gJG1Rxt166erkI8YGhkijk+8WLO/+IAKuOsoiivaCT7s/7i29w4/KkBDeg6+kTKj3uWT4TPFEwJQH3ObilwT8GYHddOU4Kxd1orL0tfguNXtrj7NZqSAXFUERC4hVODLZlBx8jm1ddMId8g6xqgFQ5u9bahyKxLHUR5u2O8PX6Jk/naZIPGgfh8I63TCpIcKgvA6MEIy2X2WQB3mfQDBgegYMhjecY5WV5kBBdXMbxyXcKoYUQObRvdFN/mH9qGPwoSm2PmVe5dO1WF0fhtAeHEQ7X/xDCuwWxsDvpbZdA9PyzdL+cUQ3ou7Uk9NiQxNkrLtVghI2u7223SN8jmGDDTOdQpv4ObUqBt86kt+WhwjEo7UolFHe5/VWIVpEh9BfT+pFvDoQ4w1QAf51VHlXc32GP0KtpimV04BO8q/KzWqC68YP0IFrDnNP7BngZbUionjTGTJKHocrhnQ6iV/6UpIYGJPO+m62jzGDQOlWZGXA8gVVhQaaSRLyrXwwrh8E4dUNngjKz9kUlHHj8xhy/evhWwcyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(8936002)(8676002)(38100700002)(2616005)(41300700001)(2906002)(316002)(5660300002)(31686004)(6916009)(66476007)(4326008)(66946007)(66556008)(6486002)(6512007)(83380400001)(478600001)(36756003)(54906003)(86362001)(6506007)(31696002)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmJTTmNRV0lXd2g0dmUwN1BjZTJPMm5Qc1MwVGRJS3RUb0lLT1c2eE5Wd3R2?=
 =?utf-8?B?SUVDd2EzdkQ3Mm9lWnJJbVF4NHhoYW4vaWdnTHl1cTJjTFpGZ29Qc3JURzll?=
 =?utf-8?B?NW52MUg0MFNrbjByN1FIc1dibWFSOGJXRTJhN2lveWNzRWc0YXQ4WXoyall0?=
 =?utf-8?B?ZTdTYlBVc3NnUUhFZUN2Z2NQNDAzYmFPUDhTczV4V2VoTWRZVWtZeUNiSmRZ?=
 =?utf-8?B?b1JaWWw4aVo2RHpPTlVWMEM2d0V3UXN2bFVnLzB1d08rN0Z4dXUwdEg5TjVx?=
 =?utf-8?B?NGtRRFoxME9SeWNvUzFkc1RWUHFaWU02dHh0c2lCaytHUjB1SER0bjc0WmI0?=
 =?utf-8?B?NExMdWZ4Ny94aE9Jc1QrMzY2ZWh5ZDRQRVdTcVp2eHFCa0lEZDNZTVZOMllv?=
 =?utf-8?B?bWJPcTFKdU5VV1lWNVpvNVpoZ2JzTmxjek03YTJUaDJOM3AxNHpnSC9QcTU2?=
 =?utf-8?B?dUtmZ1NEKzlDWVloOExZZTAzMUdyVXRJRkZ1cWltSy9kTEt2N3oxWjlZa2hl?=
 =?utf-8?B?TWJTaE0raVJ1emgxS21ncGJzY1doM2FuRkwwZFVxcU1uVS9Tc1JxeU9DWXI2?=
 =?utf-8?B?bHloTEtneGcxMHhRUC9WcGxnMjlTYlh1SXFMNXVCT0FNd1J2dEpSNGJKWk9N?=
 =?utf-8?B?QmZ4MkljMUNkeUZUNnFGaFVteTVSbEFBVFFYdW5OQjNaVHlXVEVHbXRXSDhx?=
 =?utf-8?B?aXJIZUhIdHI3OCt4TkhBekRvVzRYbG9zZFI5V1lhVG85NlREWjN1MXE0QzlK?=
 =?utf-8?B?YnlUNEdQMDkzbjJMQmlMblVYOTRqQmVGTnQ2QThLVmsyQkNaNTljeDhDZEJ3?=
 =?utf-8?B?dVBycVpibVBkbkRxeFRnU1VhRWZjNEtjK2NJT2VIazVPdXkvQXJNS2Q4UXU3?=
 =?utf-8?B?R2JDL2ZtR2x2WE1DNE4rWFc1R2NlMjZiYUdQL0diR2Y5NE5DOXorUFI3MnJV?=
 =?utf-8?B?Q2MrOWNUZDBSK3kyV1BzVnpwTDFRYk02T0NrdmdEU3R1MTA4MlowUWx5VzhS?=
 =?utf-8?B?c05XYkZ4WlVwb09sR0xYVGlGSE56WWYxelFiQjd0blFWWklsdTBCcCtIM25U?=
 =?utf-8?B?czdOSy92Sy9ta3pDOHM3TjZEWWt6bEVlSkVvb1pILzVpYnlzV0doandpeHRE?=
 =?utf-8?B?YjhTUzIySkxuMUltVGxXc0laVko4QXJDRFNMZjNVWjB6a0pvbmIvMTRVWm5N?=
 =?utf-8?B?SDhzdERPQzZGL3lORWRza1lncTVRRFI3L3lOODRoTFNZem5vTHkrRXA3eW1G?=
 =?utf-8?B?eHFGQTZCMlpweVp2KzVhK0piaE9URE1vbCtUUGEvMVlUSGZNeldFUW9yZ01G?=
 =?utf-8?B?YVhuZ0tqSys4SXdrajVwWHpTalVraTJiL2lLcyt2eHZ5Nk1CdUJBTGFrMjhR?=
 =?utf-8?B?djg0bHBZS05mcDdOeThYY3FFUjFDM2tqNEgzaitYQ1lzWUtxLytrMUxEeW5G?=
 =?utf-8?B?VThTYXhQSzM2M2wrL3R4Nm1MY0R6Y3lRNUhyODNvZkd0NkdaWHRrd25DZFVY?=
 =?utf-8?B?SDd1cGlQcFJsTjdGWEtLMHI1RlRaZTNHK2JiR2VYOUprQmt0TnYwMmVEaEUx?=
 =?utf-8?B?WFR6VkcyTG5yRlRKMktQYUthbzlnOU0xenR1Sk5ZKzA0NG5uWkRwSzhLbVRK?=
 =?utf-8?B?S1NWSlVST2F2L3oxNDdqUTQwWFNCeDU1WlJ2VERWL2Q3N25uRlpaY2hIbHlu?=
 =?utf-8?B?djkyTkVxK0JNbWxtMGs3WTFISnhnQW11aU1hWnZLL3h0Sy9CeTRrM2U3SUJY?=
 =?utf-8?B?WWVuMTRubHI5NGs1OVlibktIWGIzK2ZvdmFiMXNGcngvUm45MDBGN3JuMUwr?=
 =?utf-8?B?RmVnWCtGSCtxWTRoYzV6S0VIZWp0OU9sMG5BclpyRFJsOUhNbVVydDdiZnUw?=
 =?utf-8?B?VmdYVDd0MWZwVlp3ZXdDSjdUZVd2MitDczY4ZG95My8xY0czZWRXQ3N3YnJV?=
 =?utf-8?B?eFZlZ2dTSU04bnd4VldMOTN5eVBSR093TDJLSSt2OU1NN0w2RlpXVnNjb2RZ?=
 =?utf-8?B?OXd0eEVJVlZyNC8zb1VwdkdWS1RvMWM1ZlNNMjNxTjR1VzN1bEUzT2xEUlBG?=
 =?utf-8?B?ZHVJajljR1FvQThGdDdscUNQSUQyeDlESkI3T1ZRcFpxeCtwb0UxWlpNbmZ1?=
 =?utf-8?Q?y6gaLJhc6KnedrDyFVvxbgqYw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a27805-536d-4f20-c776-08db82e3d5c2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 14:25:25.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpDTHKU9raqA7dirJ34iAXwKoKANbxRWY+wiIqSTMunBLj7n4Y6rcL+ryUqH011DHRFYC/Uc2sEt4BxyeKUw4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7212

In options like -march=, it may be only the sub-option which is
unrecognized by the compiler. In such an event the error message often
splits option and argument, typically saying something like "bad value
'<argument>' for '<option>'. Extend the grep invocation to check for
any of the three resulting variants.

To keep things halfway readable, re-wrap and re-indent the entire
construct.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Config.mk
+++ b/Config.mk
@@ -90,9 +90,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
 # of which would indicate an "unrecognized command-line option" warning/error.
 #
 # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
-cc-option = $(shell if test -z "`echo 'void*p=1;' | \
-              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
-              then echo "$(2)"; else echo "$(3)"; fi ;)
+cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
+                    opt="$${pat%%=*}" arg="$${pat\#*=}"; \
+                    if test -z "`echo 'void*p=1;' | \
+                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
+                                 grep -e "$$pat" -e "$$arg.*$$opt" -e "$$opt.*$$arg" -`"; \
+                    then echo "$(2)"; \
+                    else echo "$(3)"; \
+                    fi;)
 
 # cc-option-add: Add an option to compilation flags, but only if supported.
 # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)


