Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E776176CB63
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 13:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574873.900498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR9aG-00049j-Oq; Wed, 02 Aug 2023 11:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574873.900498; Wed, 02 Aug 2023 11:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR9aG-00045N-M2; Wed, 02 Aug 2023 11:00:04 +0000
Received: by outflank-mailman (input) for mailman id 574873;
 Wed, 02 Aug 2023 11:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vke=DT=citrix.com=prvs=571ca8ae6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qR9aF-0003oY-EX
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 11:00:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8f9b1c6-3123-11ee-b25f-6b7b168915f2;
 Wed, 02 Aug 2023 13:00:01 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Aug 2023 06:59:54 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6475.namprd03.prod.outlook.com (2603:10b6:303:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 10:59:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 10:59:52 +0000
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
X-Inumbo-ID: b8f9b1c6-3123-11ee-b25f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690974001;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oUgvU7aeNf3v7ae8QQ0uyj+OkUFKYhxjCzflP9AkPQM=;
  b=YKwR7jlqO/tsJ2S2pkB5K2Vm+Kscxfy+4w3xLoJuDD4AIS2lXOMgwCpx
   k2qz4Z4ualmSexU0ew8SlOwyUoyN59fZQfnkLj5ODQb6c4WKjcXkwGsib
   oiikUBxlFFzgmdwPii39zp5NCD2vh4SukYfA/ODDzqippQXphUO4uuHer
   U=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 120876147
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xRzzBKyHrqJ8eHA2Y6N6t+f2xyrEfRIJ4+MujC+fZmUNrF6WrkVUm
 DAYW2HQOKnbYWHyftslOd++9RsPsMeDzt4yTAA5pCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPaoT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUVK8
 aUcDhYUUg2C3fmmxrCEY+dLme12eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAtpCS+PhqqECbFu77TU3OTQvT2OAsNKpl0WfA4luF
 nIe0397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRUcEZCQDSQJD/dT/uoA1jzrFU9l4Hai6yNbyHFnNL
 yuiqSE/g/AfiJAN3qDip1Tf2Wvz+d7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:gktUoaHYTpmPrepTpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AYBsHWWm3YY4pcSk2tIyLuRPVTrvXOVnZyC7UBWm?=
 =?us-ascii?q?hNXtoEqaFT12v0a1DjOM7zg=3D=3D?=
X-Talos-MUID: 9a23:oKz+SwUeGTK6uAbq/BS1oABLDd1Q2LWFGF0GsM1divS6PwUlbg==
X-IronPort-AV: E=Sophos;i="6.01,249,1684814400"; 
   d="scan'208";a="120876147"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAd3yBBpQJQHpAS0lJy4GRnntigoBjVONMwA/CKFngO6AjM+LJYBTPMaSbqNCL0R4qA1YnvIAmfK7M4V+SvVlWhUrEyjpo48fEnN5zbkt7WSeHP8Go/tPWOdU3kjw6j3RYJg2h+If4QYyWYeJfMKExMmbRuJYmLA+zvQLFq7Aqyn7k16pTj4EwCWBQ81GRLv8bA2bjngVzBPxZ2r4W+ItboshdqREQXhoPeGTNeot2w36LkWLpWMmtcGOF37Dqln0jxw+75z4rpPkF3lhHmM8nYsuEWpPk/N6gdumWkGnI0niiJJ7kqiGoPC3j7qu8zLosM+MlZxgNx39AVRAgrn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULTEx47mnRQuAP2u8jn8rm48uieFQBZpTlSRk2k0kvw=;
 b=Zrz1FFUSIjunXEkVEUsqOK4ktc0m4iBfRoLGCovp55m4cSpTO9ZUTl/8YwhJef54+V36YeD+vEfK70EftYeGnNTXwUxtYbEImvlVkCCthwJ6ka+QMLVPY9t1PVZwmDbPQ3P9TO7sLwd6T/HFQ2wf4kHd2niF32kjRsGS1TcoVeWYmLbREKHFeWdnqRaUlbbs0KGhbkKBJjeGcccrqdCeLix6Vok5jRhEy3VcyaSm/iTjEifx0630nvKEMUNcey8CtmzRcfJ7Hnaqw2SGfn/b9LJRyksl+fX+hQ0A7SGlKs8J0qAJzKyOVV81C5c0uxWizwcbxNDv+a9A58ATcbQjZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULTEx47mnRQuAP2u8jn8rm48uieFQBZpTlSRk2k0kvw=;
 b=QSnZKbjOgrqYDMIEzOeURNfPOzV0J7OjDLuqA2WmLUqXWbuViN9id9He1Geia+5R9Cn92g8KicjO5X/3xBQvcgL9LR0nSoFI00BHYNRzis9uQHSxvX2uhxQggQS8kK190rWG8epAzF/9HiJ+7MnrKMEt1req4IrdENuL10mFv1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <423ec861-52b7-67c9-26b6-c069c8bf1df4@citrix.com>
Date: Wed, 2 Aug 2023 11:59:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/gen-cpuid: avoid violations of Misra rule 1.3
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <fd774c2f-d69c-85c4-db0c-b666b7608272@suse.com>
In-Reply-To: <fd774c2f-d69c-85c4-db0c-b666b7608272@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: dd58b1d3-d494-41cd-06e8-08db93479845
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pmszJfu+uXigBOb9MAQpxdEEcX+UjMYVIhQ4xQ+z5bvWF8mk/1oUsZRm6UWEfQ2+FClzyvQBdKFs94H2W6lHzfM2cUJNOg3iUKEZnxt3zWvbpxPk4MPAIAPyUV535l4GzpJDdR60Qm6g2jDAvGY5yOdiEYTeNf3LrAc/ANQtG2aEXSQkC8g8ssc42eGPJYcCZA0tCBCt54q/tDi1WRbSFQDT10XxXKP2WxQfULOizpoe8BzwIootHgqgzhyGiOrZxocUoPXWzz2xyrGaA1oTCVHECQh/T/SyP0ikbuwObPcDLE9jI0LgGJATMYoDt6icTsmwHs19a3rlJbmBHdNYIkBw+iJ1EvZPENfXwRnQa/tIl0ff9GPh8Bg6Y1tjpvKYp9wbMCtLJESdW0i/fLvKl/m8gshbflKaI9ONxK6kxdZ2s//t9YYTI3D0GA7TT5P+b06fEwEBbp3Zqy3hqkvBStPTzCmzpF9fjdPB+tsFTlRECsECgK+RMTzmMvFpVgpQt9iiCqgYyVa1lqe01Wg3N/9FvDjhXCBNVbv35Iy98xSOXdn0ejNPHHeh6qr6xClhd4JsVUfPfdJQan39ymXoqhXSdu79XVvzBY5oO97EbXTTWqGwT2pTH1W4uPBx27+lBIail6ispCEJRXB77pkl9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(8936002)(8676002)(31686004)(41300700001)(5660300002)(2906002)(83380400001)(2616005)(186003)(86362001)(478600001)(54906003)(110136005)(316002)(53546011)(26005)(82960400001)(6506007)(38100700002)(66946007)(6666004)(66476007)(66556008)(31696002)(6486002)(4326008)(6512007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkxGZnlZTjh5Qi9BcGZIbmZWazVUdUtjSzdNbHNJQTJ0T1E1Uk4yN3h4SEdp?=
 =?utf-8?B?VnYvOEFiQXB6ZStiUE56c05RS0puSjZYNkM4M0R3bmxrZlM0RU1Vd2llNSs1?=
 =?utf-8?B?VForUHdyK1FhZ3krcEtrQjlvQllaUjNzRGhGamQ2aXZzQTBxUUpaRmFWc3hV?=
 =?utf-8?B?enRPMXBtTzJ6VTJFL2pjbndMVzRBNUNoY3ZXaVBrMjlNTlB3V2JpQ0tzTWx6?=
 =?utf-8?B?RHlLN3NSdjJhRTBjUWk3Q0w3TjNKK0dNc2dKOXdHRjMrd1kxb2RPS0trMEpG?=
 =?utf-8?B?ZDFmelZXYzRodk5walgwam5IZkdGWEN1VmVrcGpuYUhsckdFZjFMZUVvZXV5?=
 =?utf-8?B?UW1WcHpWSEJ4Tng4KzdCQ2UvK3ZpeDJQMXVUNVFNMTAvSWE0OUJ6WUV2OW45?=
 =?utf-8?B?VzdtYi93S05nNk14UXRNU2cxZ1U2aFROQzIrRVIyelZTSzU2NndMTHNGVzhz?=
 =?utf-8?B?TnJCb3U3eTU0UWFWUVVFVDlEUXRXOHUzbXh4UStYSlBtS3dLVEZkZG5GRTJT?=
 =?utf-8?B?UXUydWpKVjJvT2VaRTNMeWpqTFZ1QUtvTUpXaHBKbUlKcVJyaEVGUzM3eVVI?=
 =?utf-8?B?NGNJNlBhTkl0UHNqd3JoRW1kU014a0lwMTkreVUva2RYekFJSG9zbVBnbzEy?=
 =?utf-8?B?di9rMzEvaEY2UlJWVTdQR2NLb2paVFJLaElSVlNlV1ZyblBhMjFNVGdKMDN0?=
 =?utf-8?B?NDRzMmkwMmxBTVN0NkJYMkZ5ei9ST2xwcHZGdWtYOEtKSE1WQ0M3REgraTEv?=
 =?utf-8?B?QklxRHlWTktLemNzZ3Z6YkZEaVRTeDZBYytOUDczRzZpdFh5ZENOa1lwVUdJ?=
 =?utf-8?B?WC96cUVvM0JCTUZ2MWt3RTNJYlpHYUtiTmhjaE1PWWdYaEwzVDVJYnlJb1Zt?=
 =?utf-8?B?a3dOYmpBUWUwMGVpS1VWUUQrMk5YbkFRTktIOWNjOWZLYkkxWEQva1JWd1F6?=
 =?utf-8?B?dVNKTDNHSksrRndka1g3SlBPRlZ2bU1YTmsrallWVUs4Mk9FYTF3YWJCNFBZ?=
 =?utf-8?B?OWdUTFNQZUhuOVdmUVUzM0svcE9QMkdlSTBUVWdjQ3FFcDBmRzJ2YU5JbEty?=
 =?utf-8?B?ZnlIbEtBRjhscmQydjFreDJuaFpNaE9DQ1pxc3M3WVhrNEpteTVNVkQveTE1?=
 =?utf-8?B?WWNRemM3M3Y3VytvcFA2ME1sanM5emhnbmZJenFudThMODd2ZVRneGlWM0Yy?=
 =?utf-8?B?UWl4MThWTDh1TkZMeTR6RkZBOTRWazEyaVkrRllRQUcwWmxPOFpUUXRjWDc2?=
 =?utf-8?B?ZERKRGdWVmNIcElHNWgyOThmV2FreWQ3TlVVQXgxUW45a0JZVjdueGZ2ckNn?=
 =?utf-8?B?M0pzaGtCU2NoTDRrQWN0WUdqc3FRNVNIMGlDMjdBc0dFK2ZEcjNxSzBlMU9I?=
 =?utf-8?B?SW82a1VNcUFDWGxoM3JZWGZtOHpEZHozYjNDTGx0RmQ4T0wyMktYQ3NaNGpL?=
 =?utf-8?B?eXRoR25nellpUXBxaENLR1hkMGxoVVZFUnpXOFY2dzBjWnZVR1lEM1JDRWR4?=
 =?utf-8?B?V2Ztd3Y2RjlOaUUvaThsMU4zUW8yeld1cmlVdXNNUWFYUHNFdEtEaXF4b2dC?=
 =?utf-8?B?RC94WnVGMERXbWNjN3R3LzlCcmhLY2pRcDhUMFJja0kvdUFMUVpUZW5KUnFG?=
 =?utf-8?B?bGl6U3gwbzMyVFFUZVA0c1IzeXRVZjBPME0vL0pYQUtud1R3R093MGlZNHla?=
 =?utf-8?B?ZlEyNG1NRW1hTGhpVnJOQUd6L3NkOVRZNlhtcG8rV0xTYU9nWExiM29VQTlZ?=
 =?utf-8?B?NVFqWitXUTVjb2wrT1pjS2R5dERTUGVVUjJZUWROeVBDdmltVHBKblNibFFH?=
 =?utf-8?B?Q01OMGNqYXVLRWlROTdlY1BDRjRBNGp0NGFPZk83dHJIcnlpOWl6YmE4ZkU2?=
 =?utf-8?B?V2h5RytMYlZBaktmYTVaNjQ5aW0vQnlUM280QjZvbDZZSUVJLzNuRTBJN0xC?=
 =?utf-8?B?a2JYM04xaE9wb2xJTkR2b1lrUWdINW16d0ZyLzNjTGV0UXdQc0FialcyVXRp?=
 =?utf-8?B?QjRobGUvYUFzbVliVzNXSkpvR0UycmZVd3hrdUZpaGxEcFJjNFB0UWg2TC9S?=
 =?utf-8?B?QXlrZHpRbDkzUjlzTnBOMXBzZS9lMzBwSC9IZVBoOXBtbWVoZXVNQmtxTWUr?=
 =?utf-8?B?K0EvM0E5SGVDbXhnOGJXem5sTCs1NW9hbzZsNWlrWm9ranFZdjcycjF4K2V4?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/pOuDbEfvlXCQ02if9f8ObsGBZ3gI2qibtAfW7h6WFxqdcmlTx8IS+6+H7ucwMYGnyBUgIJUOxyfVUZvqxtKhPjImlg72Y2O1KIY5qMFw6ImU6sL3wWouZcQPycopqv15YyOAvmLHbN01hmnJzlqlFauQkY/hzdYvbmtlTqnX1g22aqqQISSD7Tltcule+R/N5pR1udTwkFQ3fSfA0Krje0jDvF6pkcEH3yUn++Iyv13dKSl3AiSwFDIhgkSLSiA2+46nppKEPlKsKzokP/ZUHMrrlvCL88cOyhDWPG5AyYkP5oGkR0gszQQiBhRdbVuBZRWIHcU08oBQ01MCuZEpJTcduBYzqNlIhNooCoUZ7QGgA7z0Ghx4T6wZ41dsCOASu66O/BRZafz3ndP6LRtPrxJYpu6IdVxhJ0AjjNBqGR5GMVAp+W1fTIkLlDSaYry6SY9mv3VQOFSCNI23OC2d45o9iYvCMvH13lB6fSJCl/QQkx/ThWRuqHGGZhPrNXXD8U80dMbQPAYtanybFJS2u9DgOElzV4gAtegVsNkdA2S/tj6Xv5w1TxjXwk9H5OG6Qt4uFvJXwWsFAJmMvH1mOEbYydzhWWWrTq42nprjpT8/tmGnEgadTdknxPvuriTxf97Jpq3t5vJEMeyla2LD+tZJg6Mz39M/0pYsyE/anVZ+WceTDkFZ0yh2r7vPp2w71pdhtLf1n313GhJnclyD0W7oVQDIHtZanBn4xT2u7mJ7K79zjy7rbZ+ibwk1QLvSbzRjZL/WiFLTr2pENPTLMSbvmW7LUv8HcbCx73UDH7+FbcTO8K8po0z9Z5c1b3UDwsP8rRs36bKPiVx5owjnuflWfIaxpYAqFSCukV6AQs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd58b1d3-d494-41cd-06e8-08db93479845
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 10:59:51.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUD5AkXuR7pkPdJONM5T2gvofUwlj58eelciXI6OXQVMWyFbxJxj9d0x2S2D+AD0+0po4iLadltk5JmPJk9MIebiqP9hXUW+zfQj+ipK+uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6475

On 02/08/2023 10:43 am, Jan Beulich wrote:
> Structures or unions without any named members aren't liked by Misra
> (nor the C standard). Avoid emitting such for leaves without any known
> bits.
>
> At this occasion also add the script to the X86 section in ./MAINTAINERS.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -601,6 +601,7 @@ F:	xen/arch/x86/
>  F:	xen/include/public/arch-x86/
>  F:	xen/include/xen/lib/x86
>  F:	xen/lib/x86
> +F:	xen/tools/gen-cpuid.py
>  F:	tools/firmware/hvmloader/
>  F:	tools/firmware/rombios/
>  F:	tools/firmware/vgabios/
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -367,6 +367,7 @@ def crunch_numbers(state):
>      for word in range(state.nr_entries):
>  
>          names = []
> +        empty = 1
>          for bit in range(32):
>  
>              name = state.names.get(word * 32 + bit, "")
> @@ -380,9 +381,15 @@ def crunch_numbers(state):
>              if name in ("APIC", "OSXSAVE", "OSPKE"):
>                  name = ""
>  
> +            if name:
> +                empty = 0
> +
>              names.append(name.lower())
>  
> -        state.bitfields.append("bool " + ":1, ".join(names) + ":1")
> +        if empty:
> +            state.bitfields.append("unsigned int empty_" + str(word) + ":32")
> +        else:
> +            state.bitfields.append("bool " + ":1, ".join(names) + ":1")

There's no need for the extra empty variable (this is python, not C).

if any(names):
    state.bitfields.append("bool " + ":1, ".join(names) + ":1")
else:
    state.bitfields.append("uint32_t empty_%s" % (word, ))

But there's a related bug later in the script which MISRA won't notice
unless it happens to run on the cset boundary introducing a new leaf.

I'll see about doing a patch to address both.

~Andrew

