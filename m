Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D04B44B5586
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:04:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272493.467360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdpU-0007Ci-WD; Mon, 14 Feb 2022 16:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272493.467360; Mon, 14 Feb 2022 16:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdpU-0007Af-TF; Mon, 14 Feb 2022 16:03:56 +0000
Received: by outflank-mailman (input) for mailman id 272493;
 Mon, 14 Feb 2022 16:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJdpS-0007AS-LA
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:03:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3a02283-8daf-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 17:03:52 +0100 (CET)
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
X-Inumbo-ID: b3a02283-8daf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644854632;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=StROPKuxRDWHKFtz/wutII19P4YWxQwb/TJitVL2oMI=;
  b=BExa9eCHs36u2LMyp9BzrABBogjuMxcPknHXd4ShaaVu2WbePrKqELE/
   xqTvbWnFxW2Ds3n+zBgLKYg1pRmFL3VeyldJCJNBiPVVmb9H4J7mObhYJ
   5VRBhzIYX2++LM9bAY3neJIB99lBrjKLPk9/0j5T/fS6SEmrreOJYmGBd
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oJ0/g/ThcQyWzIl9twQR8eq5Km5nVpSLzQ+q4Kl4BF0j/W6wjiG+RILhvx8fEb4LoB2Jcj23Ln
 RNyvWXFWQTRhdtavlToX8PycVOpRg/P2UhXZSAcP/xV6ufc2sKGL/CH02w4CWIfANTYTWLIonv
 oc4eCsZFMbyr+UGG4vw2foaGsNrg9PKZFFj0wKHL9i+QRwje0v8Nt6PWHGkK1FTwms5qzsqki0
 TSX0/lJP0D13tFqEQkzKxVUJbgJqni2waSdaQk1WFRrSFkvh/jsmtUnYAV156bXUQrVMd6htOG
 1mjnf9FOAlR1bQvHs+GEXfeV
X-SBRS: 5.1
X-MesageID: 63610258
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MqqHt6NVg0E/+trvrR1xkMFynXyQoLVcMsEvi/4bfWQNrUoqhTFRy
 WJNXzrVaPjbNDT8fY1zOt7k/ENV7JWAztdrTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo27UhIt8y
 etEj7itQ18qZInBuctAECANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmxu35gUQKa2i
 8wxSyJhQTWQYx91Y3QTN50GgfjwhkDbWmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3ErvDLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlbf4wVHVttuGtce9QvVyfDw7ie2Wys9G2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4jDGJGT9bxgbQ+0RqnBNzHJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/q2jyqy7+INgJu2sWyKJV3iEsI2GBX
 aMukVkJuM870IWCMcebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRsv/V/lWNq
 4wHXyZIoj0GONDDjuDs2dd7BXgBLGQhBICwrMpSd+WZJRFhFn1nAPjUqY7NsaQ890iMvuuXr
 Hy7RGFCz1/z2S/OJQmQMygxY7LzR5dv63k8OHV0b1qv3nEiZ6ep7bseKMRrLeV2qrQ7wK4mV
 eQBduWBHu9LFmbN9QMCYMSvt4dlbhmq216DZnL3fDglcpd8bAXV4du4LBD3/SwDA3Pv58szq
 rGtzC3BRp8HS1gwBcracqv3nViwoWIciKR5WE6Reotff0Dl8Y5LLS3tj6Bof5FQeEubnjbDj
 lSYGxYVo+XJsrQZytiRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvocgQbZmyaUyu4nmq7NAl1k2GXzKaxKgC696I2nA1s5K7/UfyrhcsAqwe
 0SO5tgFZunZZJK7SAYcdFg/c+CO9fAIgT2Dv/06LXLz6DJz4LfaA15ZOAOBiXAFIbZ4WG//L
 TzNZCLCB9SDtycX
IronPort-HdrOrdr: A9a23:xbE/8KjeI9PU7xD8ZuGbuQVj6nBQX3513DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICRF4B8btYOCUghrVEGgE1/qi/9SAIVywygc578
 ldmsdFeaTN5DRB/KXHCUyDYqwdKbq8geCVbIXlvg9QpGhRAskKhWYYNu/YKDwMeOAvP+tiKH
 P23Lsim9PUQwVwUi3NPAhjYwGsnayoqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+aemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aOSARcR4Z
 zxSiUbToNOAkDqDyeISNzWqlDdOQMVmjvfIJmj8CPeSILCNWkH4oF69P1km1PimjQdVZdHof
 92Niuixupq5VmrplWN2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZLIMvW0vFuLA
 BVNrCW2B+WSyLvU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegJ28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1E8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/surqSReoeMMoYDHRfzOmzGovHQ1Mn3WPerKM
 pbEKgmdsPeEQ==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="63610258"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIv5L6bdN1As3NPOqhgTXyY34aGrl5gh336Ba/XFBUtkF+THyiRcPoOCgkzxYoOPBRul8J+7uuidW+Coh70b1m7bnI55yj/Nz3uhALDXkCy2OosB8LuhWyLGzOk0Utb35g2y/uqMSbGT1apUmbEThGxs8wMLo6poYJz44+5ceSLekPc34IR5klclDowj5w6jMU+Xvh6SH442VImR/hJxuMCaEsIqRAtA0VG1+ItB/bSd1kOGLTUNuaxq05IioKsL6TxDVU8ipBGhlIghQ5Yt1faTO/L00DZ5bCQtsn6V2tjjHE6X2QB4UxLq3hhqZ3XVvSS2nCZDuELPyGuboXU4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StROPKuxRDWHKFtz/wutII19P4YWxQwb/TJitVL2oMI=;
 b=NYNI+72uipR6a4GTXx9ab8wEZ2LDfHyBVKBSuM9+2Ii7yGJOYkKWkaeHVs7r5kSBW3sixJ/0WFC+VtGQBHxn0W8GvTtbbXVMMN6U9xh77qxKoqt44uWnTZFin4ezQp/wlCENsh1XC0bwN9fEsgmiq0pnsBXnVUaxKPSSKWrRiBAYiSXToYVbxgipHmOhxROitWZkPkivE0zlHyHXG0A2+stNxG1TWoEzS0oHfEuIyhXMJAh60WnqeUK4+Z/4lj5U/M/rieGbP4r9iEDCz/1lR9ItjJbssuhj6DE7Aw55I9gAmncX2gzRmJnLYKxN018BOpA/+0G+KcRBgnz1U0Dqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StROPKuxRDWHKFtz/wutII19P4YWxQwb/TJitVL2oMI=;
 b=tr7NuNAU3IOawsrVxkObCCqgURe+95iSzEL2nVycovqLvE9wp1b2qQ3AKUm9yPXQCmfXl2NhY5V2XbGMEHoo/kt+c5NzYQN9IANxYCoHDqpXB3mExItEH1/mkULIakmfBIpOpqBwgZO9EHVV8Su2zhQrRg2njfWVuDJfXa/BAKw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Thread-Topic: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Thread-Index: AQHYIaJdlBm1laP+30eCBtzXO5xQTKyTA/+AgAAG84CAAAW9AIAAJPGA
Date: Mon, 14 Feb 2022 16:03:47 +0000
Message-ID: <c053423d-e06f-b349-34bc-9509dc44bcd7@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-4-andrew.cooper3@citrix.com>
 <5d53c6f9-8d1a-3d48-6ea6-14a484d578a0@suse.com>
 <cc4cf340-f02f-a547-08a0-1261bb506bcf@citrix.com>
 <adbd9ee8-46c5-9696-c3eb-3e18b2d60684@suse.com>
In-Reply-To: <adbd9ee8-46c5-9696-c3eb-3e18b2d60684@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b10190c8-8dfe-4a1f-e13c-08d9efd3957d
x-ms-traffictypediagnostic: DM5PR03MB3385:EE_
x-microsoft-antispam-prvs: <DM5PR03MB3385B6141B541337CC762DE8BA339@DM5PR03MB3385.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OFHM66riLSRAlV8i8xgJd5hAQTH7mlKAw3m0qm8aJYtmCtO5sTeLZglm8X9SyHeS8DbwRFo6/azO4/ak+5FPlWAQHxmsNtGjVVhzosqFyOARY8TU27wrkFMHVUF1UaEa9Ux7+RFrqHJtvx90N5JyLUeJH6+LqeZNOPsRl9aFD4/mA4II2+qcP5gT5LQQXmYIQkACqx3iUaa2UPNBrTfJ1FshLBwcmvO37LDQcGw9yAilE983khxRaGtfdOMdYOYYKgcbAwYP6dur74IrtgC3VA7/V8wNaGYgOuT7MdyPE8NGuuV+gujNmOuFhbSLCYPJlX9lPuaTaIb2qyhtNt7AqT+NlOstuKbRPoJYfGxEjaezehHaf+5/2B/bWuwtPn6MXK3JxBXRWLBklrTf3CXjAEND5K6Hj/okTV6v/1LPradEo2rtm9isssLfZ3w5n1ORMTUz6li28Tlfc5zalt0gvmYufBHTha9VpsJa+wfdH0ifBfv37rJ3y0Z2AFtBWJJsuEpE8Lwi4GOx0XO0rYhzHNe7TgJEl/LXwtFOEmCFl71F2MJPwnyfMAyO+zflV9OrHsDvtUwxSuuIdhMZwiXWzymoFSH09R5QMVqQvSOycVj2HBVwjmdHokadGxBI0eZEngWoW4neE53g38d+bgIQdS2//PQi2AaYez7yr+JmobnmCn1l6qJ5TPUYwecXneuzdG+iizd7uM+YsDXjC1G5mtQcQRByHXCokyVieLgfw3z8Z+OY/HJ5mmklTdUo+l8n
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6486002)(8936002)(31686004)(122000001)(2906002)(38100700002)(82960400001)(36756003)(4326008)(5660300002)(8676002)(316002)(66556008)(31696002)(38070700005)(6916009)(26005)(64756008)(54906003)(76116006)(66946007)(66446008)(66476007)(53546011)(91956017)(71200400001)(6506007)(186003)(2616005)(6512007)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0dJckFyUlBKc3oyeEM4azNnTnFOVmErTUFuQVpkRDZlMHVJNDVOUk9IaUNh?=
 =?utf-8?B?ZnhHOHc4QitZNENPQllQRWR2Smc0Ny9jNXJxU3BCVlhVdjVvME40c3dVclUx?=
 =?utf-8?B?bGFMTWR2SlVrQnlkVkJVTUk1dkRFRDIrcmhIUWhOeVliUmxBdzA4eUZVMHJh?=
 =?utf-8?B?S0tPSEZCcDhiT0hEVVphc2N0cThzME5jTVdTaEVvbHZ3NzFVYVJWbTJIenNz?=
 =?utf-8?B?U0YwNTN1US8yZ081ZCtEMUUwQjlDTUtvS0xqTXl6YzNrMDNVR1dVWUNMcnBi?=
 =?utf-8?B?ZWsyVUplQzJEbnhaL0ZQdHhvVFNrM2ZSdi9hZU1XdXREWWlOV3BBUGRuUjNr?=
 =?utf-8?B?dHlTKyt3c1ZxOWJHaXZVNzh4bysvVUs0OW9CVFJ5alQ2bTl3cjh4MEIyS1py?=
 =?utf-8?B?bzJ4R0ttUWx0YnNGY29HeSsvRDNOMWdBZTdhZGM5S0NFVUpEWG9pNlRodUt5?=
 =?utf-8?B?WjdUMnlmYzdxZWtheHlXWjFFZm5RVHVTRDdBb2VlbTJOdzh0YmNLc1hQUHQy?=
 =?utf-8?B?YlRGRVBTK3MrU3IzMTlxQ2R0R2MrWGdRWHZVZWwybU9rc1ZWMkRMNCtPelQy?=
 =?utf-8?B?Sk9zUVpJdCtmMGEwR3l4T1dXRGthWTBMK2pXUDdIZzJRbkJ1ajNqcTNOdm1K?=
 =?utf-8?B?T05pUjlCeFkwUjkwZ2JPcjY0a2g2Qk9tTElUWUplUDJWRW9WbUUvNlVDcysr?=
 =?utf-8?B?SW50M2xCQ2t5UWpDWVVCL2FVdFcxUVRlWGVFN1lOUlBDNXBtQzcwczFOSVdq?=
 =?utf-8?B?RVF4NWhudWxMM1RFWEtBbzJDSkNhczRuQ09aNmVhUllXWksvek9MaElXRHdK?=
 =?utf-8?B?MjRqRUZVeDVBNUE3OUlWUkF0c1kwTVV2WlhoRDkrdll0NDYzYU5RcnVSeDhl?=
 =?utf-8?B?cSt4dUR6RzJoWXU3SnRJeTFrSnIxcEl5UzNNVmRSMjkrK0FPMTQySFMrUDB2?=
 =?utf-8?B?dTdueVE2Mm1YOGNFMEtYdkJTcGdvbmxxK0ZrZm9nYkV2ekVFRjdVUkxTQjhm?=
 =?utf-8?B?ai93dG5CNzZIWkJoZytLNkd4aGsza3AyWnE3bytST1VnSmdnZVg0d0lTK0I3?=
 =?utf-8?B?N01hSlhWamhwUTJXbmo1QWFBdUdSQnJTZTJ2S05mOVZCOSsvZ2xyNERlandC?=
 =?utf-8?B?ZWl0SjNKaWhpTy9vZGV1QVk0aWx2VVQxUkN6NWhZWFcxMldZR2dhVXFaNXo4?=
 =?utf-8?B?MEYzc0M3dytxajg3M1FRdmFtanBJbUlsVzhldXQrb0U1SG5RWkVOcnFjc1Fq?=
 =?utf-8?B?cm1RT2luM25JSTZRTzlvMEoxMm9SY3puT003NlcxTGVIQnJLb05hVnp4Q3J1?=
 =?utf-8?B?dVJLcTUzeXdLVGR5NVJIRXcxWjJPSmlCOUg2a05QWTNNc2NnVVdTaXA2bkJj?=
 =?utf-8?B?aUJOdWFlc2hpQUVqQVpPRkRtSzRST2xzaE1XZ3U0U3pIcEtBdEF2Tnh5bVhi?=
 =?utf-8?B?Qlh6TUQydVArZzlCNjlhMkVKaUlhcTczWjZlV0NmNUJzUjAxVXdzVlUrQldJ?=
 =?utf-8?B?UUQ1b0tZMzZNbFFnRXRYS2I3aFprRHRXUjFUbEhkZ3JIdkc0YTZoeUNKZjBz?=
 =?utf-8?B?OCsraDZYS045Um1Xa2liSFFIMVZzSG53eXJaWnFqVElKbVVTRzVSS2JEYjJ4?=
 =?utf-8?B?MEJuQVVlZzE2RDlFTXZCeHB2UG1QQjNCTGZBa0lxMmxiVEo5UEw2YnRRUFR1?=
 =?utf-8?B?Wlp0RUhIUFpucThrNHhsSkthOHovUktrUFNCS1l2MkRYRjFxWlRXNXhFVUk0?=
 =?utf-8?B?bVZOU3haSDIzeGh3R2p1ZjZ2cW9zSmJxbS95L2hNNENGUFR0eFg4eVpQUHVx?=
 =?utf-8?B?blpxMjg0Ly9lTEt3VTFPUGhMUW8vMElNNmN3SEZkTENlSzl3czdMaXcxZ0Nw?=
 =?utf-8?B?bVNEdG5EUFRmRUx3bkI4SGc5NVlFdzd1V3hXZ3cyZ1oweCs3UVlySE10T1Nu?=
 =?utf-8?B?R0dVV2dhaHdlcEJqNGpoa3dqM1NpTFVZT2sxK1ZQWGxoTTdjUjhHOUVmVkx0?=
 =?utf-8?B?MWZCWk0xS3I3RThtQVJEUm1EZHhHNEJ3YmJ4eW5ITDdmTXVBUS9RMlhUOHFN?=
 =?utf-8?B?aWloaXdKTzlyR1ZUckhJQ3RvZk55cXNCVGptMXRRenVCSG8zWElITVdwZlM3?=
 =?utf-8?B?bm9oQXdPbUkwNWlJQTZoSjUzRDBQaDQ5OWpxSC9ocHJiKzNPNFpCWWJWaG51?=
 =?utf-8?B?b3RRRWZNY2p5RVZTekcwMjlhaDBQTGxPU0ZEaUJ2aUJ4OVRvS0lIMm5TRDc3?=
 =?utf-8?B?dG96R1owQzhVUjBGdHZVbk9QSDJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B394ABA936C9D44CAA99CBFDA211740A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10190c8-8dfe-4a1f-e13c-08d9efd3957d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 16:03:47.3891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLEnW/2Fem/TO3QjFsFgKOuuL8XFPa/BF34/yBWrRb4brQaBwu3dxPiZjuI3hWk9ILG4bHwVxuCSyFPc/puGZnwY+3fBzXDO2xp2SPhysDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3385
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTQ6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEzOjA2LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMi4yMDIyIDEzOjU2LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBAQCAtMzMwLDYgKzMzMyw0MSBAQCBzdGF0aWMgdm9pZCBpbml0X29yX2xpdmVw
YXRjaCBfYXBwbHlfYWx0ZXJuYXRpdmVzKHN0cnVjdCBhbHRfaW5zdHIgKnN0YXJ0LA0KPj4+PiAg
ICAgICAgICBhZGRfbm9wcyhidWYgKyBhLT5yZXBsX2xlbiwgdG90YWxfbGVuIC0gYS0+cmVwbF9s
ZW4pOw0KPj4+PiAgICAgICAgICB0ZXh0X3Bva2Uob3JpZywgYnVmLCB0b3RhbF9sZW4pOw0KPj4+
PiAgICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgIC8qDQo+Pj4+ICsgICAgICogQ2xvYmJlciBlbmRi
cjY0IGluc3RydWN0aW9ucyBub3cgdGhhdCBhbHRjYWxsIGhhcyBmaW5pc2hlZCBvcHRpbWlzaW5n
DQo+Pj4+ICsgICAgICogYWxsIGluZGlyZWN0IGJyYW5jaGVzIHRvIGRpcmVjdCBvbmVzLg0KPj4+
PiArICAgICAqLw0KPj4+PiArICAgIGlmICggZm9yY2UgJiYgY3B1X2hhc194ZW5faWJ0ICkNCj4+
Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIHZvaWQgKmNvbnN0ICp2YWw7DQo+Pj4+ICsgICAgICAg
IHVuc2lnbmVkIGludCBjbG9iYmVyZWQgPSAwOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIC8qDQo+
Pj4+ICsgICAgICAgICAqIFRoaXMgaXMgc29tZSBtaW5vciBzdHJ1Y3R1cmUgKGFiKXVzZS4gIFdl
IHdhbGsgdGhlIGVudGlyZSBjb250ZW50cw0KPj4+PiArICAgICAgICAgKiBvZiAuaW5pdC57cm8s
fWRhdGEuY2ZfY2xvYmJlciBhcyBpZiBpdCB3ZXJlIGFuIGFycmF5IG9mIHBvaW50ZXJzLg0KPj4+
PiArICAgICAgICAgKg0KPj4+PiArICAgICAgICAgKiBJZiB0aGUgcG9pbnRlciBwb2ludHMgaW50
byAudGV4dCwgYW5kIGF0IGFuIGVuZGJyNjQgaW5zdHJ1Y3Rpb24sDQo+Pj4+ICsgICAgICAgICAq
IG5vcCBvdXQgdGhlIGVuZGJyNjQuICBUaGlzIGNhdXNlcyB0aGUgcG9pbnRlciB0byBubyBsb25n
ZXIgYmUgYQ0KPj4+PiArICAgICAgICAgKiBsZWdhbCBpbmRpcmVjdCBicmFuY2ggdGFyZ2V0IHVu
ZGVyIENFVC1JQlQuICBUaGlzIGlzIGENCj4+Pj4gKyAgICAgICAgICogZGVmZW5jZS1pbi1kZXB0
aCBtZWFzdXJlLCB0byByZWR1Y2UgdGhlIG9wdGlvbnMgYXZhaWxhYmxlIHRvIGFuDQo+Pj4+ICsg
ICAgICAgICAqIGFkdmVyc2FyeSB3aG8gaGFzIG1hbmFnZWQgdG8gaGlqYWNrIGEgZnVuY3Rpb24g
cG9pbnRlci4NCj4+Pj4gKyAgICAgICAgICovDQo+Pj4+ICsgICAgICAgIGZvciAoIHZhbCA9IF9f
aW5pdGRhdGFfY2ZfY2xvYmJlcl9zdGFydDsNCj4+Pj4gKyAgICAgICAgICAgICAgdmFsIDwgX19p
bml0ZGF0YV9jZl9jbG9iYmVyX2VuZDsNCj4+Pj4gKyAgICAgICAgICAgICAgdmFsKysgKQ0KPj4+
PiArICAgICAgICB7DQo+Pj4+ICsgICAgICAgICAgICB2b2lkICpwdHIgPSAqdmFsOw0KPj4+PiAr
DQo+Pj4+ICsgICAgICAgICAgICBpZiAoICFpc19rZXJuZWxfdGV4dChwdHIpIHx8ICFpc19lbmRi
cjY0KHB0cikgKQ0KPj4+PiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+PiArDQo+Pj4+
ICsgICAgICAgICAgICBhZGRfbm9wcyhwdHIsIDQpOw0KPj4+IFRoaXMgbGl0ZXJhbCA0IHdvdWxk
IGJlIG5pY2UgdG8gaGF2ZSBhICNkZWZpbmUgbmV4dCB0byB3aGVyZSB0aGUgRU5EQlI2NA0KPj4+
IGVuY29kaW5nIGhhcyBpdHMgY2VudHJhbCBwbGFjZS4NCj4+IFdlIGRvbid0IGhhdmUgYW4gZW5j
b2Rpbmcgb2YgRU5EQlI2NCBpbiBhIGNlbnRyYWwgcGxhY2UuDQo+Pg0KPj4gVGhlIGJlc3QgeW91
IGNhbiBwcm9iYWJseSBoYXZlIGlzDQo+Pg0KPj4gI2RlZmluZSBFTkRCUjY0X0xFTiA0DQo+Pg0K
Pj4gaW4gZW5kYnIuaCA/DQo+IFBlcmhhcHMuIFRoYXQncyBub3QgaW4gdGhpcyBzZXJpZXMgbm9y
IGluIHN0YWdpbmcgYWxyZWFkeSwgc28gaXQncyBhIGxpdHRsZQ0KPiBoYXJkIHRvIGNoZWNrLiBC
eSAiY2VudHJhbCBwbGFjZSIgSSByZWFsbHkgbWVhbnQgaXNfZW5icjY0KCkgaWYgdGhhdCdzIHRo
ZQ0KPiBvbmx5IHBsYWNlIHdoZXJlIHRoZSBlbmNvZGluZyBhY3R1YWxseSBhcHBlYXJzLg0KDQpl
bmRici5oIGlzIHRoZSBoZWFkZXIgd2hpY2ggY29udGFpbnMgaXNfZW5kYnI2NCgpLCBhbmQgZGVs
aWJlcmF0ZWx5IGRvZXMNCm5vdCBjb250YWluIHRoZSByYXcgZW5jb2RpbmcuDQoNCj4NCj4+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYveGVu
Lmxkcy5TDQo+Pj4+IEBAIC0yMjEsNiArMjIxLDEyIEBAIFNFQ1RJT05TDQo+Pj4+ICAgICAgICAg
KiguaW5pdGNhbGwxLmluaXQpDQo+Pj4+ICAgICAgICAgX19pbml0Y2FsbF9lbmQgPSAuOw0KPj4+
PiAgDQo+Pj4+ICsgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOw0KPj4+PiArICAgICAg
IF9faW5pdGRhdGFfY2ZfY2xvYmJlcl9zdGFydCA9IC47DQo+Pj4+ICsgICAgICAgKiguaW5pdC5k
YXRhLmNmX2Nsb2JiZXIpDQo+Pj4+ICsgICAgICAgKiguaW5pdC5yb2RhdGEuY2ZfY2xvYmJlcikN
Cj4+Pj4gKyAgICAgICBfX2luaXRkYXRhX2NmX2Nsb2JiZXJfZW5kID0gLjsNCj4+Pj4gKw0KPj4+
PiAgICAgICAgICooLmluaXQuZGF0YSkNCj4+Pj4gICAgICAgICAqKC5pbml0LmRhdGEucmVsKQ0K
Pj4+PiAgICAgICAgICooLmluaXQuZGF0YS5yZWwuKikNCj4+PiBXaXRoIHIvbyBkYXRhIGFoZWFk
IGFuZCByL3cgZGF0YSBmb2xsb3dpbmcsIG1heSBJIHN1Z2dlc3QgdG8gZmxpcCB0aGUNCj4+PiBv
cmRlciBvZiB0aGUgdHdvIHNlY3Rpb24gc3BlY2lmaWVycyB5b3UgYWRkPw0KPj4gSSBkb24ndCBm
b2xsb3cuwqAgVGhpcyBpcyBhbGwgaW5pdGRhdGEgd2hpY2ggaXMgbWVyZ2VkIHRvZ2V0aGVyIGlu
dG8gYQ0KPj4gc2luZ2xlIHNlY3Rpb24uDQo+Pg0KPj4gVGhlIG9ubHkgcmVhc29uIGNvbnN0IGRh
dGEgaXMgc3BsaXQgb3V0IGluIHRoZSBmaXJzdCBwbGFjZSBpcyB0byBhcHBlYXNlDQo+PiB0aGUg
dG9vbGNoYWlucywgbm90IGJlY2F1c2UgaXQgbWFrZXMgYSBkaWZmZXJlbmNlLg0KPiBJdCdzIG1h
cmdpbmFsLCBJIGFncmVlLCBidXQgaXQgd291bGQgc3RpbGwgc2VlbSBtb3JlIGNsZWFuIHRvIG1l
IGlmIGFsbA0KPiAocHNldWRvKSByL28gaW5pdCBkYXRhIGxpdmVkIHNpZGUgYnkgc2lkZS4NCg0K
SSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoYXQgeW91J3JlIGFza2luZy4NCg0KVGhlcmUgaXMg
bm8gc3VjaCB0aGluZyBhcyBhY3R1YWxseSByZWFkLW9ubHkgaW5pdCBkYXRhLg0KDQpXaGVyZXZl
ciB0aGUgLmluaXQucm9kYXRhIGdvZXMgaW4gaGVyZSwgaXQncyBib3VuZGVkIGJ5IC5pbml0LmRh
dGEuDQoNCn5BbmRyZXcNCg==

