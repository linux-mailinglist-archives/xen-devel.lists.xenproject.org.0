Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC24B67E1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 10:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272885.467873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJuKf-00065z-Ch; Tue, 15 Feb 2022 09:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272885.467873; Tue, 15 Feb 2022 09:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJuKf-00064A-8f; Tue, 15 Feb 2022 09:41:13 +0000
Received: by outflank-mailman (input) for mailman id 272885;
 Tue, 15 Feb 2022 09:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vySV=S6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJuKe-000644-E7
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 09:41:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66ce1062-8e43-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 10:41:09 +0100 (CET)
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
X-Inumbo-ID: 66ce1062-8e43-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644918069;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=RSuhqeY7HnlBNNGy2i65XswlJ+o1LeiKifGwJsqnO9I=;
  b=TGGciAchI0JT3K26DKLSlr4eeuEpj1OJkol2+LdSPLnYZxh2FM9mwnaD
   7GuRikBJrBallVjIoLbd4bpzvu6eAFtvirsn7aG/pe8c49wkEh61Rasbo
   ozZ2GwEuKGWFnJuSPpOPTHnKwlyJDQjS/wBNDCVmO3og90zvGbTB9AY6N
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jZnQ9vxquUa/lqTDun32g+48I7XEqHw2ypSqd76V/sjyL1TZ2vMl3dXfQPctXZI/gk/lCJ7ZU2
 YtBKlctHcc2EefzGZKwb5npl3MHFyVhPMMQAWQLwmflSSp3kHiFELZ55jrsFZCg/Vwy/A4bia/
 wiEsFBlhpdfYM/wgvIHD6h9mbue3mKohpvNpoEWI6x2/fkqgIfjSzU4DMq1Au3znkYN+L5Ljud
 4jp5lQCYRhA5PrvdL+/wF0zteS0BykkGd4yBVvgTqWA7Gmp2xkY+YbB1ZPMCo9lt/9gZYMJIsx
 ybmMrWWAu5+YE7WJ1zRdCl70
X-SBRS: 5.1
X-MesageID: 64125897
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pzHk+6traEmnsSPD24xBCP9MR+fnVKZZMUV32f8akzHdYApBsoF/q
 tZmKW+EM/jeMzGkf9kjPt+/9xgGscOGz4A3SVBu+S5hEC0S+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IXhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl9p6OF14xJv32sv1BYQBjEChFDYtJ9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JwXR6uON
 pVxhTxHSBuZXUB2AgkuBKkPrMLvrCXDKAJ1twfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoQCbm5+/hCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJH87+rFyuF7ueuhyruCzEuLmY5VQkLQl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdj/9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YalUwYnY1RvHNEghBHFb5I+htDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/S8SoS1C62MN4EUCnSUSONg1HswDXN8Iki3yBR8+U3BE
 cvznTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VWEm
 /4CZpDi40gOD4XDjtz/rNd7waYidiNgW/gbaqV/K4a+H+aRMDh6VaGImep7I9MNcmY8vr6gw
 0xRk3RwkTLXrXbGNR+LejZkbrbuVox4tnU1IWonOlPA5pTpSd/HAH43e8RlcL852vZkyPIoH
 fAJd9/ZWqZESyjd+iRbZp749dQweBOujAOIHiykfDlgIMIwG12XoofpLln16S0DLiurrs9i8
 beu4RzWHMgYTAN4AceINP/2lwGtvWIQkf5ZVlfTJoUBY13l9YVncnSjjvI+L8wWBw/Ewz+Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXb/RLz7HVW7y9KGzX
 slvzqnxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+C94UIObiNP8+5QlcdKBB8M7aG3PAQ3DLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNGuRaijhcKM8qdinEG/muBGXUMTqE7u8xIG4TskAcqlglPbJG05vUaO31ThwGg6nUXH
 wI=
IronPort-HdrOrdr: A9a23:iOLetKh0TQSe/SnvaEWa2XZF1nBQXzZ13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhR4tKPTOWw1dASbsN0WKM+UyHJ8STzJ8+6U
 4CSdkANDSTNykCsS+S2mDReLxBsbq6GciT9JvjJhxWPGZXgs9bnmJE4lHxKDwKeOAKP+txKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+wLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfhWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrzXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MG40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIZLH45JlO11GkbKp
 guMCmFj8wmMW9yLkqp9FWH+ebcEUjaRXy9Mws/Us/86UkioJk29Tpb+CUlpAZwyHsKceg32w
 31CNUXqFhwdL5nUUsEPpZ4fSKWMB27ffueChPlHbzYfJt3SE4l7aSHpYkI2A==
X-IronPort-AV: E=Sophos;i="5.88,370,1635220800"; 
   d="scan'208";a="64125897"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzHbdYxIhbTOnoaaEJWEVPBYKNwl0Awp9OzPqQnrH14pcyyu0FRRkE66uiHmduhYC6qOoVdzTmZnqNMSiglWAlBJl3JuIpnNXTBPWQi+Z4GRkfBaDXUffDtbd1+QW8PDgjFUVVnCHbNs9U6/T3HudhlYa4EwJzyExRa2vlB3B7WneN0SQow5MpQ71F6kGlrqTwBREiHGXmmvqdV2WWuGqn3DGbgyXuM2z+1bgDPflUACov9qgv+uEib+SAseZjcFgwVp/+TfOuWXDCHCGaT5oh6h1MTp5EMuJLdPcHuv9kb4D9XuWgAHkxnRYX0WRmCipUQEAao3bG4ynuc4GuUEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGQ+PEr0Xkvv6f6pzW4fFhaM/PSZBG+XpUJ/niOegzw=;
 b=flrLG3/D4vbxIySzDkGWW2clgHp5GB51qpYbs+N3UqBzQDAl0v/gZFtaQGVp6sw7/V4LP5RNdQhDuzzbroXCdDWZY97ZbcciT09f6wUMVXol6II4wGcXTN3qVPMjU5Gk+vPcbyl7GNaDaJXExJp3UzEbciq/xoG0UEfSlg5bgDqYSrl45NzW3f5KnyXuDM7xnqh+XWztiqEKRApYt0qD2gckaE059U5nS9JBmxIrJi45pYt2mGKcrdxHnECFcy1mr+SAxZheGUt+9MK6mpibkJIcnl8mX22rcu0aMRXF6uf7c71AylXmAT872sFfUCsKmDr0nP1YgVuWDXZ/9tt+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGQ+PEr0Xkvv6f6pzW4fFhaM/PSZBG+XpUJ/niOegzw=;
 b=BdV7f8CF8GWhLTz23mYSJ2vz/1EKX5AL/6KNpsBkhel4iABcIAlY3QFPqDS5tVwfTeO0XPTDNBvWWSvaCWiVkP9tkt4JhW4Fl3Sr921no2h3IBHuJueXjWrKYieKpu37aVOBzXtJ7uUS0ufIgbNblJj+5AUyxwBSvvozA1VoAow=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] rwlock: remove unneeded subtraction
Date: Tue, 15 Feb 2022 10:39:51 +0100
Message-ID: <20220215093951.97830-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0487.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6df0cf1-0558-4ad5-c11e-08d9f06747b2
X-MS-TrafficTypeDiagnostic: MWHPR03MB3053:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB3053D60CF7CD61FA2059FF688F349@MWHPR03MB3053.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGxWcQzMa6smYIyXYAkdIjeJrLBtcQRANPkq2iiyARE5nlCl9lvzsPjrBPCNkje0tJ4I+5iGPNuKBMMPdz21qNhiRPm+EbGRoCUfXoW9OhLudZ3wwRAhqdelq42rAkmvA3QCjqnBQ7bemf72lfKjO4cpuDNWtFAYUKRDMG+RM+WbNDZ+AowDlMLYaXwsd8TBCXfywXUfeyg9F5QsZRhOGCfecvixiY8kpuVR5sxAC4VUHEJvI1oTaQtfQAYZ5wD+IbqPQR6pDouBNV/A2J7MgwMiCS1VByPfDrWxgjUtvArNBGYwhjC4dLiIvSsjDKPVGW99+FclXFEs5v0uIquaA0mUfQ8FswyER3qy5poGVeA7r2v8TDU/0viutFCQ1/sh/ZK4gZohWEFAzTlpQtt3exoUxDKLlhay970svlMQRsU/uJ+himYHLmudCZ74mn4r4g8GzppnGat2Yw7mUEWta6qXoSJnt6boTXJn1aOuuXIAEsf3drTiq/oeYodmQ2RXlgzTgwuFnfPBzI8PIQvPeB4yuxyN+0BDYx01EqRd6QCvajmfMoOf4dqDi1MjZ2mUQn5SqVYPc0lUD03ATWvGnYM4NXa2bUDH8rYW7uZ5lflVXWCOZZHlTUZkglEi6QcAwp5WhgbTNuquLCORfBWNZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66476007)(66556008)(4326008)(83380400001)(6512007)(6666004)(86362001)(66946007)(36756003)(2616005)(508600001)(1076003)(8936002)(6506007)(5660300002)(6486002)(4744005)(316002)(26005)(186003)(38100700002)(6916009)(82960400001)(2906002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R25jNGNHNitCRG9TYnpOSFpyMTRuMTJqYmR0QkxHWjl6bjZCNHZzSytmOTBa?=
 =?utf-8?B?M1cvU2l6NHdxbFFNUU5kTmVWZHRQRDBmdnh2NjJiVUYyZk16M2ozNEtSd3B0?=
 =?utf-8?B?SHUrbjZnWkFkcm9DL01Ia0s0eFVqRi9PTWVxcmlsYnBWWmpuSWM0OFZhblMw?=
 =?utf-8?B?aU5yOXlPanB4ZnhXQm1aVjJYZE1NMVJMd0lXZktYMkRHbTMvYVdVdzVBL2c4?=
 =?utf-8?B?VjFkdjlxZXA5UFBsTXliWllaangvWGpOWC83U3ZBa2xUYkU2Vm96SEU1KytN?=
 =?utf-8?B?U2FsMmxxdU9IZC9mQkJHYVNibkNpQnpoeVpnam5UOHRNYnltMDlqTGIvT0tC?=
 =?utf-8?B?aGpoN3VnanZxbVo1ZDM3VFhwbTZ6a0FjQmRuREdyTWtlNG5SU2FVMEVNU1RH?=
 =?utf-8?B?U0FTZnFkRTBUSnhwRFRtSml2OWpJa2VjUTdIQ2NGT3VZN2IyelF4T0FBSnJr?=
 =?utf-8?B?OVU1MGNZWkRWSVhsODV0b3d0RkFRZG5jeUFsc1BNKzhxOVNoTWl5T29ZQTBE?=
 =?utf-8?B?SmhqUGJMek5uQVRSOVRkN295d1JLdEVpeENQMThPNytBVVc1K25JR0NJYURQ?=
 =?utf-8?B?TWgva2N6eHpVeXRXNXVYeE1Bdkg3K01NRjJLUXk5TzZBWmp2aEFEaFhPQ08x?=
 =?utf-8?B?bEY3VFl3U05OelZUNnRITE9NM0ZMblJiTFBFM3p3QWkyM2RxdktaQWZRUkY5?=
 =?utf-8?B?dE43Sjd5bjNBUWxXWWtxTTNpMlpuc0o4WjU1bTM0K3l5Wm92UzNoT1pDRWpl?=
 =?utf-8?B?c0tyUUxwZmlqTzIwcDZsOGowZURmbHFDK3FHZmZkY0NJejUwOEtFeDc5RHB3?=
 =?utf-8?B?Mnl6WjQwdElHbXRteEtSa2VMOG5rNGhMQVJnUEQ2VkdYSUcvT0QxVkM3dkFh?=
 =?utf-8?B?bFplR0JwMzVrRy9MaU1aY2dNQkNCMCt3ZGFtMkNXekYxUzFXL0FYbXRPMEhT?=
 =?utf-8?B?RlZrdmlmZFkvMHREdEJkMVl6Nnl6WStQTFNhT2t4NW1ERUFyNytudUl6L2tu?=
 =?utf-8?B?aXNoMVdXMmo5dmxoYVdTNGtmVTlKNnBlSlgyR2pabWlhbVpJNFNVemtLUTZ3?=
 =?utf-8?B?Rnd3WmRMRFNSdmVZUFVGWXIxS2pOQUUwb2k2eWlNS2Q4ZnIrMTZRdnFWZm04?=
 =?utf-8?B?SWM4TVNoMEk4dFdkSC9Ba3A2QStySEFGUFV3UUt6aEsxK1hMQVFuc2U4N2M4?=
 =?utf-8?B?Q0hTbmFUMHlhbkdwNUlqZi81YkVSYllNRmw0M0JoL1QzMWhUVlZlNTlhL3I4?=
 =?utf-8?B?VWZMcmp6UklBZGZDeVdWcHJaNmFFbHdPZ0pZcUFPSTczdWFncXJJa2VpZnAy?=
 =?utf-8?B?VmNEQ2srZ1dZWlFaaXVhT3dXQWFKbEFZejFtQVdtcS9QSVJzTWI0Tkx2VG5O?=
 =?utf-8?B?eU9ZWkRlblRTbkJVbEVwekpUSDlUZG00bjhOR3VIVHdHaEVBZmxFMXNMdzY5?=
 =?utf-8?B?TG9vN01DMTkxVFRLRWlBSnF5ZFBFSkpkekhDOHU0N1ZRaHVFMGN2bytmcyty?=
 =?utf-8?B?RThKeWFhTUQ4dmpmOEU5eEc3RlhTeTVoRFJUSVBiZWFUQVpuMHBLbE1nVVJO?=
 =?utf-8?B?SnNBK1lnZmp4dU0zR0JNcnprRnF3b3RKdTczemVnOWNURmVCNkZSeWdQVWth?=
 =?utf-8?B?Z1RRcVVIRnkrTjZidXEzcFlxWXBCZjlkVkZjK3JlVUhrcUhpczFvemJtQlRE?=
 =?utf-8?B?STNQVmxESXVJYVhpRlNrTnhiaFBQaTdlOGwvdWJGS0dXdU13UklNczhEMjUy?=
 =?utf-8?B?d3YrTTVuSFBZYVNDMy9NblZEd0h0T1Axamp1VHJGaDd3UDJpUHUzbC91WXh5?=
 =?utf-8?B?SVk3NGRJTElNUFl4MExUdks3SkNDNmJOM2VMSEsxdEhOaE1FRUorMlB5K0xo?=
 =?utf-8?B?K1VpMGladW56R1N5YVlVY1d1OWVDNWFGbTJCLzE3aFpqUzRiMFNkSjA0bGwy?=
 =?utf-8?B?QzRiVEdGZXJybmJIaGhiSkxsWGZ1a3B4bUhCWWRNcTBWL2Q0UXpabFR3ZlFS?=
 =?utf-8?B?QlpINUl3dXlOSVJhZnVXNjBYTnFLSnJLZVY1VGdVeFhJVzRCZWlxNE4rQTVk?=
 =?utf-8?B?ZlNQRnVOekpMZkdvVUl4ZlVIRThEV1daM2tiNFlrRUowL3dhbUZTSER2MWZT?=
 =?utf-8?B?ZFlXeHgrWnpYOU1pczJhZ2g2Wkd6bEVvUWcyaHlzUlc1ZmMwWUJUMS8xVVhG?=
 =?utf-8?Q?P5R7Kt2X9CRvJ4lXrljYTAI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6df0cf1-0558-4ad5-c11e-08d9f06747b2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 09:41:02.5768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCKdK+D90pCOBMmZnvgHT6V/weArGTHIOG0KD7oHIhg0kJWihL4xgMkJ7EUfyrK9oH4dpRhnBc2VLQXi7PS/vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3053
X-OriginatorOrg: citrix.com

There's no need to subtract _QR_BIAS from the lock value for storing
in the local cnts variable in the read lock slow path: the users of
the value in cnts only care about the writer-related bits and use a
mask to get the value.

Note that further setting of cnts in rspin_until_writer_unlock already
do not subtract _QR_BIAS.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/rwlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/rwlock.c b/xen/common/rwlock.c
index dadab372b5..aa15529bbe 100644
--- a/xen/common/rwlock.c
+++ b/xen/common/rwlock.c
@@ -47,7 +47,7 @@ void queue_read_lock_slowpath(rwlock_t *lock)
     while ( atomic_read(&lock->cnts) & _QW_WMASK )
         cpu_relax();
 
-    cnts = atomic_add_return(_QR_BIAS, &lock->cnts) - _QR_BIAS;
+    cnts = atomic_add_return(_QR_BIAS, &lock->cnts);
     rspin_until_writer_unlock(lock, cnts);
 
     /*
-- 
2.34.1


