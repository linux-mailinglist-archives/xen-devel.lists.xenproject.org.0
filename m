Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CFB490584
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258063.443997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol1-00007R-Dp; Mon, 17 Jan 2022 09:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258063.443997; Mon, 17 Jan 2022 09:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol1-0008VM-2H; Mon, 17 Jan 2022 09:56:59 +0000
Received: by outflank-mailman (input) for mailman id 258063;
 Mon, 17 Jan 2022 09:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9Oe3-0003a5-Id
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd0b6592-777a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:49:45 +0100 (CET)
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
X-Inumbo-ID: cd0b6592-777a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/O0U0KNImtCyb3JWdKQDPPV0OmQCunJL/NG5QQraSW4=;
  b=IlbFVL5zwezmMYEor9OEeHKMNlcGSmlFVsy3kUuA9b9By3Az310po0uc
   DnTCgMSPvVFZxu0a1ZyiJ5TdvFEZbikm7lPyQlRaknMp/raAiDL+qURJh
   UCfHs2DdxGbPKGocOAidY1cY2jcbE9mkiQvi2Lqy5xJyp+elb9vRYF/Lt
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: u1J2EPNJlQfj3cu5rxHMjyn/AX29nv9qxAeoGWL9V9BiXuUO2+0ZBWo33QoWGls8M9gpx444Zs
 H1nmnwv9Y5N6/O3UNaHfKz4jVKDqKmVhBkytmIKZQ3G+asIVURXnZb4PpxMS+q+ilKMzn662IH
 Vnf9DJwHWLILqlZUdLdnVX0PCpfzudQOG3B3vtL44CRE/b/yUuCbLfnCTJ2a0ieqWLnxPfQ+QW
 jgdO+H6APPOnQdC7NIeURFf+OWLsUroQcsPlOJiNvt0LuPcJEJk4v4Fo31X61UrlZn9YwX29Ru
 +umK8Deg3pB37UikveFEnfX5
X-SBRS: 5.2
X-MesageID: 61616927
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hnXimqmcp44B8KjsBMLNPgjo5gxmIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfUW2EM/bfYWCgfdl2Pt++/UgH7ZHXmIIwGlBvpX82QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29c32YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PFkq7yKTiMMBPTRncsUTUB1ITBSLYQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glp2JkQTKyBD
 yYfQQJTTiScUxdkAGZNA5RuwOCruGi4LgQN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0zmBjkKOdrZziCKmlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFqtoD4mXP51KbQn7S6E1PP50Re1FkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4jDGJGT9bxgbQ+0RqmBNzDJrVml
 CJV8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdoLvWEldBs1bJZsldrVj
 Kn74145CHh7ZirCUEOKS9jpV5RCIVbISLwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2mHxW7T6NFPjTkkT2uZLDNSX9YepUbzOzghURsfnsTPP9q
 YgPbqNnCnx3DYXDX8Ug2dVCcgBRcylqXMCeRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQiwLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:OY3P0K8JASlhKpBgPCBuk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="61616927"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lODJahyR+Gh0vjD0yVnQx+fnm5t7iOrjEqSJ6uxlkXtQgK+Jg7/KjFtVtAH6hTXAkDEpSa+P1+WbNRrpGmOTwSGyMWRX4nC+CLocYEoGSzUgRlqumrOsAQPJ4sjwmp0jlA9YoJznyZaRyXjM8Mz6ykq2UPSHX3G4gJgFWsTDifdo1Qc/gsS+b3SdywJbYXUIy1p6NrokfEgpPqnFiZ9nK/wL/LMYgoKKy/KJAajs2arZn4H7ZhGFEBOkf9oeCpaE4nnsGbOQJkB4biPu4agiBiRj24OPw6aUarfB3QJ3mx46hwnSzNGsbni0hj1jQuAgyOEEp/LQu1+G5mQBnisrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNUn5uJ+65mTyyLibJ5FdU7ew52MqXiRBT0tuNTGnXM=;
 b=ZXaYsRUKTtpkgTq9pUEaIanWJod6r5Wmi2VvO3Bsfp8YHvYD9C4kbLAUIgACxMkm6sGptvEZLMdJYJl7g1raA4IYJe1S0EtU/sTBRYj8zBlc/JqR80pjrTths+2v2XS1VSS/8xk6lVuAYjLh4K6XtiSgyrEjXc1iIc+dtpZe+RRlBFy2oWXYvhaWy9KmFxZfGKa76sdMy1I4cyqQMQ2Q3SEoQVtvNGy8al8xTfJ/E8vAJvrjtIgOzl88qWCRyaU/fTVexFOW5BtNW42OP6nam8PY7/QOiQYvCrIQlJmgTli0kuwtucp7Vath+Bpj/V6/MmaxhXOovOTE6ssBE25/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNUn5uJ+65mTyyLibJ5FdU7ew52MqXiRBT0tuNTGnXM=;
 b=Wq1Mv8AkiHNeo+05+C1grTceFGXGL19JfQxfy4/PEjafdtumMQlXczDtK4lJ7DAh152HUj0SnwExaaOtUzobDQOkLPA46p1baecWNDhBDZa9PIVjhoqymveyZcyDu875PzvpVRKerbLHUYGxj8ltbc8eRpzxgmOS+RxZS2QPT/A=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 08/12] libs/guest: rework xc_cpuid_xend_policy
Date: Mon, 17 Jan 2022 10:48:23 +0100
Message-ID: <20220117094827.16756-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2007200-2d9c-451a-86bb-08d9d99eaeaf
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059E6E1609C227DB24E72B18F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2QVtYbJTn+7nbwqbLQ26H8V4mtQNSZ5V9uB5Rxx1Z1ULlRIehMmuFGseTimFGisRK5mnGSdRVsu4Lp8+DV2Z0V5MxADkzFXKvZ0wxYce6qh8yMDSMwKdZGLgRHFYw/NNIY8SBhgePONyOXUzbPlW1wXZAnS7ZJWAIl4Huhix8cttK3GReD9qdaCgXuYo70Nz27Bp5flSOX2Eh1kNBn0dwrNfgSe3H2hIZ/bEZxErgp5Zwu2+4UfQyzD1Lz7QC4ryxLU0It2ZBJwzxvN0AiNNvp9VdDQoAsJyfY0JhcTvW9D0tgyTBa9Wig5Ieo6/fuj44fvhEfaWyZ4o3llD7GoLQj4VOARWeCOtUv8uuyD4TkIwj77wpnXGQks4mUfhXC90qacVfPxGxLBoklkfMY1vNilJx6+WiPLyDZlwQuDedoRcyVHzK4TQWXggpjyp/6RLZTY9lNHmmugtcgCjVbExP3kUzywiSzhq8hHeOLYgo55s8oorNr0qJpeZrZY8D6kJz7YfbehycrAmIeYFImWCCwrt6mqGkhIIxzbD684K5zyA0S25WqNLvVsVxWswFxDSB9L1AEiYkr/3D261ce2MIBfGH2tcxMGQjf6DdKKZipYUW9eWibVoNlxo3SHkEYD+o68MtFKa65PGBHahIY82A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEdsWWF3NUxlRUhRY2tsNGFzVE5aT1pIQ3BtVUdPNFZod1ZTYS9wb25uLzZI?=
 =?utf-8?B?Q0hRdzVKelYwNFVJREtCNnNoeDhjUnliNFdnTU1EWmFrQWF0Ukl6cHdtbjgr?=
 =?utf-8?B?VWI5SEJJUzhiZkhyTmtkNXVEREE3b2Noek1MN1p5NVorZ3NqWStETm9CTmly?=
 =?utf-8?B?V3ZsMVhqNW5WamI3b3FpdGpnZDNrbFB1ZVBwNDdUcUVLLzRWajdDdnBDK0pT?=
 =?utf-8?B?N2cySXQ0VHU2eXE2OFI2b0V0S3VSNjhXMFFGWjJ3L3dadzFyZHR6ZWJtZG9Y?=
 =?utf-8?B?RFZ5eXhOdlVPdGt3WThlUm5mV09Vazh6RGxOajhWaG04TnZ0ZU5KYmd0V2Zr?=
 =?utf-8?B?ZjlQU1NFdXZ5QmQ3VmNmTVE0OUp4L1YrYVUvdnFyM2ROOGhPVDVKS2tkak5k?=
 =?utf-8?B?TGx3K3JnMmJ1bnYvci9nR3pTMk5xUkFqQmlDMVl1YTlRK0k1Q2d5R3VFN1A2?=
 =?utf-8?B?VHdxZDh4dDJzdkJRaGo3VHJSQ2NQaTEyS3o5Zk11bkFtYnB3KzBwbGMyNGVR?=
 =?utf-8?B?ZmZqMzBEemg4YmtrcW1oQTQ0ciswTzR2NW13ZWtqSDdvWTRRa05xYVI4a3Zr?=
 =?utf-8?B?RUM5ZWJWRGs3SlJrKzFhWFEzZ3pJc29idDQ3c0F1Q3pXaG9KRzlZY0dDZ3Nm?=
 =?utf-8?B?UThhOTMzY3AveVZzTGtHR3VXZUplMndFeDlZMDFmdkIvQ1lGYms1QWF5eVNF?=
 =?utf-8?B?eDI2cEcxaGljNlRZWU9jSXYvcWJGWktGRURRR3IweGEwMGJkTlJyUDYwK2FL?=
 =?utf-8?B?VCt2dHk3RmZ4UW83Q0FWbk9rREpjekpnNFVINHI2eFpmaldpTzlET3BPUEc3?=
 =?utf-8?B?eDlmUUVhbzZpMEttMTdZVW1wRk1SRkladURpM3hNUVFxaElwSy9QVDVNbHZq?=
 =?utf-8?B?RjFvaVpaZlZUZGtrK244WkxFR3pwQnMxeFJMWWVlelgrMGkvbXBXK2JOblVn?=
 =?utf-8?B?WFd3UmpKaW45SEFSdFdBRDFrSm9meElka1R6bjNlSmNMM0pPZWVLbytDWTI0?=
 =?utf-8?B?SUN1VU8xYXhjeVozV285NXc3anJKMkx1MzVjMnVUSDBQQXNoNHdOTnhHZUU4?=
 =?utf-8?B?T2V4d0VYSzZJSXhNanl2MkRBZEduSUhYT2JQL3RTVWtVNHQ2alZMUUJET2hG?=
 =?utf-8?B?aC9IbWo0cTlGRmFCa2RvRTBNTnBiUXMzQUpRQ3lhMEk1eERNYzFsUDVseVFM?=
 =?utf-8?B?cjhNM3dOTFV4SlRVOHkrczlpaE5DcU1QaXBPQUd4dG54Wkx4b2xIVm1XaXcv?=
 =?utf-8?B?U3lCR0FhaWNzV2lhQ1dtTEQzU3A3VmhqTHRWcUJpdjdKOWoyaUZPWTlNdFcz?=
 =?utf-8?B?cTg3Ukt1K1JuM0FCNldmTnlyRFM1YXR2MGoyOTY3RlN0S0V0TjViQWNqRVRH?=
 =?utf-8?B?N0lFbW5IZGJ6b0w4ZFY2amlQUTBhVmdDeDNJTXhWeTlXSWFSNnFCeFJBWXpV?=
 =?utf-8?B?Wm51V1ppdHh4WVM4MXdGMFY4RUVFSHpaMitlSm5vZUp5VXlsMENBQmtTUmVt?=
 =?utf-8?B?dlhwRWRXWVhGL0c3OG5UWExQWWwxOHAzQnJOZmZHTWd1MW5yWUJkRStZenhJ?=
 =?utf-8?B?UlZlSFdtNWpLeEltY3BCUEVhamt5eTRubmdqMENmUThwamxpWjVvSGZ3bnBI?=
 =?utf-8?B?ZEdONjNPWU9yN1EwMktabHFnOXUyalNlTWJUS2xOZGlOSlArTkdZME1qUzla?=
 =?utf-8?B?Sms5NHNUVVZZL21RL0RHVC96UnlReTRmMk9iNmhNc2h0SFRoT2NycVVEVVRR?=
 =?utf-8?B?RlErZ2lKQWVuYU5SWkhEZ3I4YmcxU3RwWWFZVUczY0hhSkVpRUx5blhseUc5?=
 =?utf-8?B?K0JmRVNSVjYvM3RhVGt0QlpqNjVEeEh1NHQ0ZXZLeWMwUm0zRThFR3BiZGZ6?=
 =?utf-8?B?cFo1Rzk0VEU0NUI3MjVBVTIzT0dwYmRVNWVHWEdibTVZTVFGSGYrTzdBRDM4?=
 =?utf-8?B?R2hJakdHYkd4QXVIK1F5a1dyMElrMnpGTmJaNHlIem1zUmt6N0EzVGkrcGdJ?=
 =?utf-8?B?TWx0bEgwU1gvSkh6R293c2dEZ09keC9uYTl2dnVQL2VOZXpRMEZScWtneUhC?=
 =?utf-8?B?SDZ2cFNRUy96SHJyMmlaUllrRnFGVEhLWkRsRXNuWEUvS1dvRVRlK3Z6MmlE?=
 =?utf-8?B?UE44WWhveDJsTEZHS0NwL2J3N0VsbUlsdjVhdzE3TG1Yb01xK1dUVDBMNjdk?=
 =?utf-8?Q?0ghM7CFv64AuBAbRLjS6/n8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2007200-2d9c-451a-86bb-08d9d99eaeaf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:40.9372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e9K2tszI6YKcoB0XUwtCprNHzNNnsYKpWIfrXlg4jqqH52eEFNXWgWTVgivsurBq7R3U510fU7cjjvTZ9IKXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid and make it
public. Modify the function internally to use the new xc_cpu_policy_*
set of functions. Also don't apply the passed policy to a domain
directly, and instead modify the provided xc_cpu_policy_t. The caller
will be responsible of applying the modified cpu policy to the domain.

Note that further patches will end up removing this function, as the
callers should have the necessary helpers to modify an xc_cpu_policy_t
themselves.

The find_leaf helper and related comparison function is also removed,
as it's no longer needed to search for cpuid leafs as finding the
matching leaves is now done using xc_cpu_policy_get_cpuid.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Drop find_leaf and comparison helper.
---
 tools/include/xenguest.h        |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 200 +++++++++++++-------------------
 2 files changed, 83 insertions(+), 121 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index bea02cb542..9912116a51 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -825,6 +825,10 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
                                   bool hvm);
 
+/* Apply an xc_xend_cpuid object to the policy. */
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index e7ae133d8d..9060a2f763 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -254,144 +254,107 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-static int compare_leaves(const void *l, const void *r)
-{
-    const xen_cpuid_leaf_t *lhs = l;
-    const xen_cpuid_leaf_t *rhs = r;
-
-    if ( lhs->leaf != rhs->leaf )
-        return lhs->leaf < rhs->leaf ? -1 : 1;
-
-    if ( lhs->subleaf != rhs->subleaf )
-        return lhs->subleaf < rhs->subleaf ? -1 : 1;
-
-    return 0;
-}
-
-static xen_cpuid_leaf_t *find_leaf(
-    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
-{
-    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
-
-    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
-}
-
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm)
 {
     int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
+    xc_cpu_policy_t *host = NULL, *def = NULL;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto fail;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
-
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if ( !host || !def )
     {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to init policies");
+        rc = -ENOMEM;
+        goto out;
     }
 
     /* Get the domain type's default policy. */
-    nr_msrs = 0;
-    nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                            : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_def, def, &nr_msrs, NULL);
+                                  def);
     if ( rc )
     {
-        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
+        goto out;
     }
 
     /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
+        goto out;
     }
 
     rc = -EINVAL;
-    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
+    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
 
-        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
+        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
+                                     &cur_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
+                                     &def_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
+                                     &host_leaf);
+        if ( rc )
         {
-            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            ERROR("Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
         }
 
-        for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
+        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
         {
-            uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *def_reg = &def_leaf->a + i;
-            const uint32_t *host_reg = &host_leaf->a + i;
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
 
-            if ( xend->policy[i] == NULL )
+            if ( cpuid->policy[i] == NULL )
                 continue;
 
             for ( unsigned int j = 0; j < 32; j++ )
             {
                 bool val;
 
-                if ( xend->policy[i][j] == '1' )
+                switch ( cpuid->policy[i][j] )
+                {
+                case '1':
                     val = true;
-                else if ( xend->policy[i][j] == '0' )
+                    break;
+
+                case '0':
                     val = false;
-                else if ( xend->policy[i][j] == 'x' )
+                    break;
+
+                case 'x':
                     val = test_bit(31 - j, def_reg);
-                else if ( xend->policy[i][j] == 'k' ||
-                          xend->policy[i][j] == 's' )
+                    break;
+
+                case 'k':
+                case 's':
                     val = test_bit(31 - j, host_reg);
-                else
-                {
+                    break;
+
+                default:
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                          cpuid->policy[i][j], i, cpuid->policy[i]);
+                    goto out;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -399,25 +362,19 @@ static int xc_cpuid_xend_policy(
                     set_bit(31 - j, cur_reg);
             }
         }
-    }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
+        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
+        if ( rc )
+        {
+            PERROR("Failed to set policy leaf %#x subleaf %#x",
+                   cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
     }
 
-    /* Success! */
-
- fail:
-    free(cur);
-    free(def);
-    free(host);
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
@@ -425,7 +382,7 @@ static int xc_cpuid_xend_policy(
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *cpuid)
 {
     int rc;
     xc_dominfo_t di;
@@ -545,6 +502,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     *p = policy.cpuid;
 
+    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
+    if ( rc )
+        goto out;
+
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
@@ -562,9 +523,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
     rc = 0;
 
 out:
-- 
2.34.1


