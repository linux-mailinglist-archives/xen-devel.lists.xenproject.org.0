Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D8461B1E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234681.407303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriiH-0001MS-No; Mon, 29 Nov 2021 15:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234681.407303; Mon, 29 Nov 2021 15:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriiH-0001Gi-C3; Mon, 29 Nov 2021 15:37:05 +0000
Received: by outflank-mailman (input) for mailman id 234681;
 Mon, 29 Nov 2021 15:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrihH-0003uH-Tc
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:36:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d5a4127-512a-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:36:01 +0100 (CET)
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
X-Inumbo-ID: 0d5a4127-512a-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=d9tlpzIvXcOXPpebR2FdU5F5aJVq5WGS3uJketsR6ps=;
  b=WFhKzMrlMRxnPxvBdZA2+Gsc4n0+e6tK3BgPzmgEsr1IofrlZG1PbBPj
   +lRB2MxJIj+1Gw+Y7q+90aDP9AarQHZdU6Xhg57nhhvLibXTj29W8hgsP
   BZTI968q9p+N8sDWKuYFlFQUGZ9gQ1JfdNykEkw9bH8uO62MhVT79DXxa
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3IKHmyhzOs8grf709M+ihYZLdZcTQOsp+NKmkaIgnEfuGfC+O0TaQzqlLjICYoDIAMlOQsARca
 zez4yWljbZwiUv+aGYVG16NgTrkOJ4BQbZM/nINaRXMecg2WgpcNhdDGblA7zLx0nw2w/q2zhw
 aRoQDBqTV1tB3HAPiLUxaiERrnaRqjIKCX9By7JuE2kabrd8AzZvhU913gEcZerUAo1+FDvgvM
 4dQQ4asjJbe+QeBVM0DES19ojWoZ7YV6vVyvl9Ogg2opY1EqUp3QIyCipmRTQbMP1XfOaro1a0
 8D+UjFuesAy0LoFUliwGUh9E
X-SBRS: 5.1
X-MesageID: 58773277
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zdH+vqkJXE7LBPkmvggQfrDo5gxjIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeXTyDPquNZzehf4pxYdnn9kgP7ZaDydAxS1RsrHo3RCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 IRA6cThURkzB/DvqukWQgNmHX1aYYQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpg2Z8VR6mBD
 yYfQTpVaz7pORF3AW9UFs1ln+aTrXfOKyIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 G3c+H/iKgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRok+hWfpPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixV2VYFm9ZdsYf6ewESDc7z
 GGHw/e1LGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+xL1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMulGrtlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyM
 BaJ5VwLv8YDYBNGiJObharrUazGKoC6S7zYug38NIISMvCdiifalM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhWdyVmXs6v9JQMHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2B/6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:AXsRAavYgXVieZKeMjY0Tbgm7skC6oMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK6yXcT2/hvAV7CZnibhILMFuBfBOTZskTd8kHFh4tgPO
 JbAtJD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9vgRQpENRGtxdBm9Ce3em+yZNNW977PQCZf
 6hDp0tnUvfRZ1bVLX3OlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mLryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idnrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6fDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amJazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCc2B9vSyLZU5nlhBgr/DT1NU5DWituA3Jy9PB96gIm30yQlCAjtYsidnRpzuN1d3AL3Z
 WDDk1SrsA6ciYhV9MKOA4we7rENoXze2O5DIvrGyWdKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58773277"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFULj7MRVyJGzd15HojUePQQSPwX6jtMNmS1gv60tZuZBBiQXkzBPtq0ztNGXCVXVaRSNBa/aKM5FIK07rukWR9CoMLAllbvqVuQd1BT9Wdkhj9W8mq2USkotpHQSJSWvWbf278gGtNONzhbmDFo5HoLRhw5GNl4wiLbGA09bkyoyT8sm8B1rMyTgxzn3VfsfVhxzwiGb0ys87aVKC7GtlIBAQ0RR8iafMk5sm9ciPDWuPP/cyGxz/vtwy7T7GatZdIGaESIm3sXC8Nh9Xl9PE1LQkDiOS9k9Wdu99gfdiTVjP+aH/mx0wfY4FeIhqrfJx14ppXBKv2xvC/s+bPX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v1JZ3HVnYuxeDPR6w/pprUXGuHXUqzMmPa9m3/Cfl0=;
 b=ICqptspAX7zAQ1pUuLUK9zHu2pJB3Er2WC2CaVwRUQKEOA1e2cdVdcFpS/0cjuHoPPLqozjhIYt4J4nG0D/uNMhhGBnOZJezUeqTzFYDdjoUdNkknSvaCpcL++u7AbdS47IeaTwD2Qpcpb+9/nxWsA/3ad11cVP3X7OEMwKKDlBKntoR2S5IPRNjSgZI/2xcWF8TX+tNJ/nyLsPaN6iMGf1X96R/+clvCPiNxwKbSuTGVYoNaWKaELP1WDTVG7PPP+NkKFM600xuOeN7ZkjII07oca893QpWrRtwcK0CLD9CQlF0I6CQdL1J1t4o9K8eJLDdqAs9PUhJwmp6QHemZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v1JZ3HVnYuxeDPR6w/pprUXGuHXUqzMmPa9m3/Cfl0=;
 b=YHMOF8LrAxE9Kgbr9/vpZDdTEIHNhRAuyqO4k11IFuV3ofxiSuJMzCGKmVyySuJwamtZja2iqpxrG7yN4JV0RsJETbeMrAmRz6NWKopRhvJx11/Ck4MS48JRHnig64jz9fQRbP03eDuQVX2DhEaWd0qgOw7q3yYFDARTeF8lR9c=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 07/12] libs/guest: introduce helper set cpu topology in cpu policy
Date: Mon, 29 Nov 2021 16:33:50 +0100
Message-ID: <20211129153355.60338-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a939fa0-2661-4d32-f541-08d9b34de651
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2842C75A684B16BC93D3E3898F669@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qXA/uMZUKZM02CHloLxKIUH3VU5iPgAZkoI4viK+MIIKQuuP27l8iPK1d1b/qvGxgLhcDzuiBYvuut0ze8p+b4hN6UMitcDgYOgNdt6/03Z0sGFHIL0R/cLz6pYlWv+d6/i06g+4UxmL4NYduJVyM2bU23y+IDM+azo6u967/Augk740KLmTnwkC860x74uWIQYeX2dNP8cqAejv/GMkbuHQ4snYdLtWVT4nv2I462VUAMnEb/bwzV98U6YnGFe4Jp0JBBr6iDOst7QasL29QDXoz9IlM6VfB7aOoQZR3DSDLF1TsVLYbt69vTR/Fq5x1nIl55HGY4/TjI3c7EikYxsu3ncsF/roKixHf2KR3mdJoVymvamZh2QIP1qu1W7tJj4OoQSjkFtnt7k/1rhHMi6BN7N+oqcILTGo/9H96L9HvWVaauuVSKtXX1L+qfMGtvcCdlGSCaUCDcJpFObdkn9MQJ6FgqKqsNAN77CW1/7cbAJ/9/axhUaJmDxjjniXXBeZKqAELs4w0sxsrZ3NBCaZBW983dHpya1wqGm5JW0knof0T+m77K2qgCbONgZvmmBRnmTFEVHHOk2l8Y3M0JNIsgxQN6RdRXhZgYXgvFpsOsCnKwo2l509ITrtTmYcV3DUfPfURoseAF2sKkXnAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(54906003)(8936002)(2906002)(66946007)(6486002)(316002)(8676002)(956004)(6916009)(82960400001)(4326008)(6666004)(66476007)(66556008)(186003)(83380400001)(38100700002)(2616005)(26005)(508600001)(1076003)(36756003)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1dGOU96Vk5PRjNWbnZyejhYcmpxTTlJNzhhTDZ5UkNyUEhnNzJsTnpIQ09q?=
 =?utf-8?B?KzcreHlTQ0t2U2FhNFRoTms2MzFDaVpIT3IxV2ljNlk3SGFqU2MzRXVDejJa?=
 =?utf-8?B?Rk1KdS9xUk1lUWZXUkM4c0w1dzZVWjZFbkFGTVdLdU1ROEwvMkZXTmJIRW16?=
 =?utf-8?B?VjUxWTY5TjlCaTNUSnFHYTB0aGdlWFBGWHZHT3RScUM2UGh2SzVUV2lvWGVw?=
 =?utf-8?B?UGt3Ty9MRGd0SzlUQVlrclZkV3o5RitvTk03anptemE4ZU9sdVA1SHdOSTIv?=
 =?utf-8?B?UUk5VUdmMFA1bmNpRGZUNkdlQWNVbWZhbE5mdW5xVFRYcDBlUkJ3ajVWekV0?=
 =?utf-8?B?cjlKZFVvUVVWK1FrS0tPdURvQWN4UjRwNVdTdWRzYWtRTndxZkUzUy9oc3Qz?=
 =?utf-8?B?MTRYeGdQK1dDT2F5aUhWdFpiV1k0RUZ5aWJld21EbFVkVVdhdng1T1dSaWhM?=
 =?utf-8?B?WkFOR2l2ZGVZNFl3VTdQeFBiU2dhTlBZWXg4NVRJY3FYcnRyRGwwUnVDZ1pZ?=
 =?utf-8?B?aFNtdnVQWEM5YnZ0bFMzakprSlFYd3VwVUR0YTIvdGVaTVlvbVZmVGJxZXB0?=
 =?utf-8?B?SmY4eE5tdk8vditBSWUzczQ5QndZTVR0Y21NRFRzQm9sbWdueE16MWlsaXZO?=
 =?utf-8?B?OVRGV1drL3pPRGNOeE9UajlFMzdwR0s1SGlCSWVwcXBKdnp6U0ppclI4czFh?=
 =?utf-8?B?bnBteUNKUDQvaGxDZ3RwQmg1b3l1NVQwTExTU21icGJja0lQNHB5eEZZSE9n?=
 =?utf-8?B?SGRNUm1HM2Q3REZRRWt1bjd3MTcrMXVFYlR5NDlyK1Fxcms2bnhaYlh2VTBl?=
 =?utf-8?B?U1dKMnpNR2pXRUVMQ1gzdDdab25qb1l4WSt2TmNwYWlFOGRxaU9lTzhVRWE1?=
 =?utf-8?B?SlBjRTdURG9ZMFhGOTRxSE5YZW9FUkZNQnNUb2gxU05qMDB1WUJqMldmVkNJ?=
 =?utf-8?B?VE1DdURnOGhkaGNoRm5wMmVNUTYzYUNUajQ3V2xtZW9jeEFhODUycmlJVlNi?=
 =?utf-8?B?MnBvLzZXclVEdGJ0VURXQnVWWlYrVkN6SW5DVFF6WS96ZXk2TTRQRnRkR0I1?=
 =?utf-8?B?OHEwWloyS01FNm94RWtzLzdlUEMyRHMvYURUeDltNmlEYm5sd1R3OFFQSzV1?=
 =?utf-8?B?bE9mMXE0OTdrb2h0Z3RPVzl4WGI0bGNTTnJXSHdNQWNPaVIxK1FaWXNDQXRu?=
 =?utf-8?B?M1Rzd2NQV1gxV3JsZW9PZG5NTFcxUHkwcXlEREVtRWtoRGMyZXhaL3NLTW1o?=
 =?utf-8?B?SUpSZCtRbndFOEQzelBZZkwvbGRibmFaMFl1RDRURTBvbVdRVEN0czlLTHph?=
 =?utf-8?B?QUZ6NHF0NkZ1K2IrR2xpMmtlUEdwZWQzdnBIVnY0VVFEanZEQkR4QkFCYmlO?=
 =?utf-8?B?djVrWksxRzRhNC9mS3hNWHNVb3F6WVBCcExUaERIYmMrc3VWYmhzYXZwQnhM?=
 =?utf-8?B?aCttdUlUZDVNMmZKMWluNWd4Ylp1THJNcVdOcExGQjBwQkJFaUhoSmdVUnFq?=
 =?utf-8?B?UG1xQkhkbmNpcnF1czZtQVRKdG5ac2tKbC9aYThZZ2FGYks4L1BHSUpuNWVZ?=
 =?utf-8?B?aWc5cFM2bnI1MUN5UWFIeE81OXNScTJpTDRxS1JFazJnZndSWUJaaGxETnd6?=
 =?utf-8?B?NlA4dVMyQnpTR0ZiUnRuaTM2K3VPUmo1eUpVVHUvOEVURTZNaUhxMW83QjA3?=
 =?utf-8?B?WjA0QXpkL1FQNzYwRU9UQXNIeGZLVWgrV0U3cTRwNnlLTXhkTjVERFIzQ0w3?=
 =?utf-8?B?RFBzYnVBcHExc1o2MWZWZDdvVENZU1lFVmRRNmZlbVBON3V3MEV6N2NXamtV?=
 =?utf-8?B?YzhjbVdZTWNzSmpoVzlVYlhvbGkxenZYeElZa09MMnR4NVBIQlNVeFphUytx?=
 =?utf-8?B?b1NsQkJOTmhVcnorUEFpMkE5WW1MMFZnUFRuWDVMd0pMb0xYTmRBeU5heXha?=
 =?utf-8?B?c2EvTm1ha2R4N1FSek9mUVRYbFNKOFhaMS9XcHpTSm9vNUM2d0cvZWQwWUw1?=
 =?utf-8?B?TElOSFVaRUZuYXVHalVaWmZIUFVZV0FrNUlVTWhmQnZtWUFwMzh5MXVDUEls?=
 =?utf-8?B?VlpnZ2wvaisydWROSlNvODU5OTFiQXYwTmZJSTQ1dDlYZExWOHV2V3pVYWJl?=
 =?utf-8?B?Qm5BS05OWGdmSXh1NXlTeE5UZFR3OG5TSnZ1c09IQzF6YjcrK3NldVdWNHNN?=
 =?utf-8?Q?3wl2bgh+8WrNzuzojlqIjj4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a939fa0-2661-4d32-f541-08d9b34de651
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:40.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe4RWt09A7kGhey/HlkTk97Fhvns2misQnhQDMiOe0le3MCdc5QGSB/HqlbCKmXUwABwk0VePndg6Xvvs82CaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

This logic is pulled out from xc_cpuid_apply_policy and placed into a
separate helper. Note the legacy part of the introduced function, as
long term Xen will require a proper topology setter function capable
of expressing a more diverse set of topologies.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 - s/xc_cpu_policy_topology/xc_cpu_policy_legacy_topology/
---
 tools/include/xenguest.h        |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 186 +++++++++++++++++---------------
 2 files changed, 105 insertions(+), 85 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 281454dc60..bea02cb542 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -821,6 +821,10 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
                                    bool hvm);
 
+/* Setup the legacy policy topology. */
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
+                                  bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index bcbf9576c4..eafc1ec7c1 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -429,13 +429,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 {
     int rc;
     xc_dominfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
+    unsigned int nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
     struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -458,22 +456,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          (p = calloc(1, sizeof(*p))) == NULL )
         goto out;
 
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    if ( rc )
-    {
-        /* Tolerate "buffer too small", as we've got the bits we need. */
-        if ( errno == ENOBUFS )
-            rc = 0;
-        else
-        {
-            PERROR("Failed to obtain host featureset");
-            rc = -errno;
-            goto out;
-        }
-    }
-
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -557,72 +539,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    if ( !di.hvm )
-    {
-        /*
-         * On hardware without CPUID Faulting, PV guests see real topology.
-         * As a consequence, they also need to see the host htt/cmp fields.
-         */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
-    }
-    else
-    {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
-
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !p->basic.lppp )
-            p->basic.lppp = 2;
-        else if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
-
-        switch ( p->x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
-            {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
-            }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             *
-             * UPDATE: I addition to avoiding overflow, some
-             * proprietary operating systems have trouble with
-             * apic_id_size values greater than 7.  Limit the value to
-             * 7 for now.
-             */
-            if ( p->extd.nc < 0x7f )
-            {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
-
-                p->extd.nc = (p->extd.nc << 1) | 1;
-            }
-            break;
-        }
-    }
+    policy.cpuid = *p;
+    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
+    if ( rc )
+        goto out;
+    *p = policy.cpuid;
 
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
@@ -944,3 +865,98 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
     xc_cpu_policy_destroy(host);
     return rc;
 }
+
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
+                                  bool hvm)
+{
+    if ( !hvm )
+    {
+        xc_cpu_policy_t *host;
+        int rc;
+
+        host = xc_cpu_policy_init();
+        if ( !host )
+        {
+            errno = ENOMEM;
+            return -1;
+        }
+
+        rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy");
+            xc_cpu_policy_destroy(host);
+            return rc;
+        }
+
+
+        /*
+         * On hardware without CPUID Faulting, PV guests see real topology.
+         * As a consequence, they also need to see the host htt/cmp fields.
+         */
+        policy->cpuid.basic.htt = host->cpuid.basic.htt;
+        policy->cpuid.extd.cmp_legacy = host->cpuid.extd.cmp_legacy;
+    }
+    else
+    {
+        unsigned int i;
+
+        /*
+         * Topology for HVM guests is entirely controlled by Xen.  For now, we
+         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
+         */
+        policy->cpuid.basic.htt = true;
+        policy->cpuid.extd.cmp_legacy = false;
+
+        /*
+         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
+         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
+         * overflow.
+         */
+        if ( !policy->cpuid.basic.lppp )
+            policy->cpuid.basic.lppp = 2;
+        else if ( !(policy->cpuid.basic.lppp & 0x80) )
+            policy->cpuid.basic.lppp *= 2;
+
+        switch ( policy->cpuid.x86_vendor )
+        {
+        case X86_VENDOR_INTEL:
+            for ( i = 0; (policy->cpuid.cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(policy->cpuid.cache.raw)); ++i )
+            {
+                policy->cpuid.cache.subleaf[i].cores_per_package =
+                  (policy->cpuid.cache.subleaf[i].cores_per_package << 1) | 1;
+                policy->cpuid.cache.subleaf[i].threads_per_cache = 0;
+            }
+            break;
+
+        case X86_VENDOR_AMD:
+        case X86_VENDOR_HYGON:
+            /*
+             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
+             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
+             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
+             * - overflow,
+             * - going out of sync with leaf 1 EBX[23:16],
+             * - incrementing ApicIdCoreSize when it's zero (which changes the
+             *   meaning of bits 7:0).
+             *
+             * UPDATE: I addition to avoiding overflow, some
+             * proprietary operating systems have trouble with
+             * apic_id_size values greater than 7.  Limit the value to
+             * 7 for now.
+             */
+            if ( policy->cpuid.extd.nc < 0x7f )
+            {
+                if ( policy->cpuid.extd.apic_id_size != 0 &&
+                     policy->cpuid.extd.apic_id_size < 0x7 )
+                    policy->cpuid.extd.apic_id_size++;
+
+                policy->cpuid.extd.nc = (policy->cpuid.extd.nc << 1) | 1;
+            }
+            break;
+        }
+    }
+
+    return 0;
+}
-- 
2.33.0


