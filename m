Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7AE62F745
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 15:27:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445814.701227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow2Kv-00044P-Ot; Fri, 18 Nov 2022 14:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445814.701227; Fri, 18 Nov 2022 14:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow2Kv-00041L-LW; Fri, 18 Nov 2022 14:27:21 +0000
Received: by outflank-mailman (input) for mailman id 445814;
 Fri, 18 Nov 2022 14:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmIt=3S=citrix.com=prvs=314707d18=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ow2Kt-0003yS-GF
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 14:27:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 194d55da-674d-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 15:27:17 +0100 (CET)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 09:27:13 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB5486.namprd03.prod.outlook.com (2603:10b6:a03:28d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 14:27:09 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 14:27:09 +0000
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
X-Inumbo-ID: 194d55da-674d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668781637;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+qPcSZPRcCEGhfaQTMUwLxLzGhIEdK+SWBMxKB4hHc0=;
  b=YwHrqiXLdYIw5l8930U4EAwmYxS7VTB91i1QoI7a2x+DpMoRIpTUOnr2
   J36LmuVzY0gAoPamsNSVbm5NrYq1lhMTdv/8HCvtvKCA5RPHAmXYjQq3r
   EJ0fPVwgRqE8+LhmMwKyuKU5wjrBv17X3EC80mHIsot2d/qe+QNzBmSU1
   M=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 85540255
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:a8C5zqP5XzYWOu3vrR2VlsFynXyQoLVcMsEvi/4bfWQNrUoh32cHn
 zccDTrTafzfZWajct9waouxoxsHuJPdndBnTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uBtMDthq
 uYBEwI2VBuSu7+H5pK0Y/Y506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCIpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8efwH6nANhPSdVU8NZgqmyzmWlOOCRJbgah+deemHbkWI5Qf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZZYcEinN87Q3otz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJobixvOSpNvFfCzh9isQTXom
 WnS9245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 hDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:+BtNl6kk4E+OQWb4hgjaXFp9W9rpDfNGiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81k2dUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl+6emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FPQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriuknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYZ
 9TJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkloFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MISKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCIPknrVeIyzNaBwg1DwqD3XZ0Wv9ige3ek1hlTEfsukDcXZI2pe0fdJoJ0kc77msr
 iISddr6sTYXBrT8LZyrnLDsqZpWAcjue0uy6MGsgG107b2A7yvkNDnW9DuA5eoOQoYewrEcw
 s+tX7IVY990nw=
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="85540255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek7EuKT8Pv5zJsEzXaFCELMLc0bjXbP+4knfDCODgongd6rNi/ADuHJLEQSzL5asNwWGf1V0AqmPhhNBA783ei3bqTDzGD+K7XxEN90UAeKrFyQSb5Yf+4q2EHbiFoyOhbzM0MI6tjphW7qLKNWy/wskggLJz7MPDUzfVkOI+MJp6beZnzaT1ixKJRSkNS/u/dTJoEkY/K2uXpl77hwtZavhH14QJrbwZnhQZuEBFuOXVHAIIhZeT/rFnYiCZVJ/sJaDObcltIBf0ysFxY6deCTL8rsBofRoS1VsVlXDMM4ObF4dvSAXC+FDtQO2NEjTxu/jk59ID3E8Mek1kROYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qPcSZPRcCEGhfaQTMUwLxLzGhIEdK+SWBMxKB4hHc0=;
 b=Q1Q2He3+Rk9jKUhfHvOzrN8iE6EkhS5YYoD1pZ3/ZY4FYctJSB4SqYnUdSGKrBTNQBPABuP7aVyuq1zYyNdVeFeGbdDxxgPnm8Av1TraMm4UL98NIMimEue0F9U26SKDUZSl5EBg/12OxaqKzgLVQ1vtFxTbTWbH8DoOqRQIbEk1UlGLiaNUKISFCmjJpaHpMsUOwRAlWupiTf50rfentnhrihxdyV6m8FttX8o7Q01cu1r1jb7/WVtrBXt5gsplzv7K9ko/VqeXu3XQjFBtandxfZTgmzqqOlXCpWJE9Ua5/XU6fvCzrBSlenVvOGxNZwQW2cQLLj7rBgKKbDUC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qPcSZPRcCEGhfaQTMUwLxLzGhIEdK+SWBMxKB4hHc0=;
 b=XZM4Uuo0Sw1konxNmkug8oBju5K4/Lb1mvo7Zj66bX/kxTrz8BX+03ZB3kegVs1RGmiaim7E7CL7KSpO1CdyFjMKyxakvJ76D1GcdmyWsKTZqfwMc7Tx0IdKDJiM437f1QVUAfhymT4Y7dpUkJb2S7ak1aZLCmA+usUlEv/usug=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Thread-Topic: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Thread-Index: AQHY+zjv47cM7GZ23kWVhiI/91aGOa5EnVaAgAAGB4CAABnfgA==
Date: Fri, 18 Nov 2022 14:27:09 +0000
Message-ID: <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
In-Reply-To: <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|SJ0PR03MB5486:EE_
x-ms-office365-filtering-correlation-id: 97222673-4b13-4926-db52-08dac970f9f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Oyt78VZHT3zaioAohWSfHu4zKOkpU4f4nCHQPluFumvpZXnsXZNqSfHQtai2PldJZ1PJQv64eGh9dcL7LhLSZcWimUycpZa7s0IqqGy1Av9LlPauouPaG7olCwDrWw2LOFsQTCIsTveOlp3lhCHGi/h7sg9SZJyrDG4jqS2g++MzxVklYdfElt4a38IyBvKB4HvHE22OrR0qPQ76Cw5UGCjPLh7mgMfn+EB61CKKdVtStGD2QdIZNLvnQVZBAQ640nHtsbFeuKiqZIUWpnbzij5+SsR7OLHoafKRP2+XkLX9n1BetSfWWZbYm3PfDDE1fa9iDMt+p8C8Rg8HAkVMut2at1ND4L5NLjC+20gwvXspqk4LvDQqxVA2Y0JLLq5XhO8sbWZaGJ2rFaJyFugejtF0auT9sXGqhaDHyf7u+HXP5HigLDCR3Uyrdzfw3p7gGn+o3BKwidfBGFbfs8AYnidP2suAFUwdgNwAAmqozr3mML1J/H1bXgg4bAVFR1xo4hAiMAWIwBd9AoPDYk7ZJKzfXkPaRxvo6pvdDMERmrvLGgTa4fPInzNuZXX4R574JHPylghgsZI+sdU/cI/XqI/FRt+I4RXFqiAd37uud/ztx0tV/VXZ9CL57V1obcdsmmy/K4ytDy+86C69P/q1rMtHkKuQDCGqgT4l+8X1EiODD6jKp4wr5TIK+QdbuzBqCMXcH/k9kWe5i7K8dAfDxlsIk1xFjCVhBud9rBcQ4EOr7zLPoFr1Ow6ellLhCWwZJUv6aX8aD/Yl3A7jrRGYeQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199015)(6486002)(31686004)(122000001)(86362001)(6506007)(71200400001)(38100700002)(478600001)(82960400001)(31696002)(316002)(186003)(5660300002)(26005)(6512007)(6916009)(53546011)(54906003)(8936002)(8676002)(66556008)(66946007)(64756008)(66476007)(66446008)(91956017)(76116006)(38070700005)(41300700001)(36756003)(2616005)(83380400001)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2paaW92RHpGd0ZaeEtuazRGMWh1MTg1OUgwdVk0VmlYdlczb1BkS1FnZ01L?=
 =?utf-8?B?Ti9kQlVpL3lJV29iZmNVWm1abHV4UkVUNklzNnptT2RGWUxzcE5wYzIwYjVK?=
 =?utf-8?B?TjhBYTN1VUgxK1R6Skp3cmRGdzNzSitjNm10UHMzMUR2Zk56Vmt3Y0ZOV2JR?=
 =?utf-8?B?Z1ZIdzNGQWRSM0JOZGRzdkEvKzRRaWRhaDNMMVpHV01pdUFXay9mNkFTU0o0?=
 =?utf-8?B?N3FnZmE0MHJXSlZuckFORzlhdDlDM1lTZW9mWFBoUGhia1JQV0RZRVZCc2Fv?=
 =?utf-8?B?RnVQYmVZaFFjaW42Unk0TWJVSGdRc3hxSGpnVTdIUHBrRUhMUW01dno5V1pq?=
 =?utf-8?B?TVV0RmlvdEtGQkM0WVl5TlF0M2s0KzdXM2hxMEFNOVc5R0xpWlFyQStZSXhN?=
 =?utf-8?B?aXNGMmZrOG16WUM5OTdJNnRiVE1WMDhJQUlKeTVsOXVuMkU4T015YWQxVkw2?=
 =?utf-8?B?OFBSQU5KeWc2ODMyeTg1TFd4TnR0TnlMQndWK0NPUWR5TjFSMk10YjZzRk9E?=
 =?utf-8?B?ZU10U0FkQ0VKWGlxRjFIOWkwVXpFdUtpL3dYKy8zbWFvRERTTllBK0thSDV3?=
 =?utf-8?B?ZWxycHhvYlBZTHBBWkVoV1ZuQzRmMXd5dlNsYU11VG5qWlJyQVZEaDkvK3FB?=
 =?utf-8?B?cUROUnUyMGdWQWlwN3p5eW12czhZbTcxWWFqZDZsZ0RBQzlaN1NQRFJBcmdv?=
 =?utf-8?B?Y1ZqeUcxZDI5V0tyVmlkYzkwQnFKZEZiVE1CY0JUeGdPSkJIME9Od0dRT21x?=
 =?utf-8?B?clh2VS9yWmkvOGdLdzJjY3lBSnNyem9iUjc5eExzWnY2eFhJTGs3SmlZWkFM?=
 =?utf-8?B?K3Z2bjFUcUN1c1ZxSUV3TEtINHZYRnVlNkIydVFIQi9JemN0b0QxdHNsSUhj?=
 =?utf-8?B?SEVJeTZKTzdCM3ZOSzB1akJFTkxzdjlZMDdZQSt6VHV0Z2JaS1ZmRUFJZTli?=
 =?utf-8?B?Q1Q1YW1JTSs3VkxSN3c2WU80RGsvOXltck5BY1JGTFcweWNOUDBtN2MxV09v?=
 =?utf-8?B?amZXU29mZVY1bUEydWwvQnhLZHJIMmVSdDZKUGdtTXc0VnNoM2pwWEw4aG4x?=
 =?utf-8?B?S2VtNGFYeklENFNHWHRtMW1zdEJ2TW1WUjNtVG16QllUZDl0ZFNxamFTR1BR?=
 =?utf-8?B?RUFtVlh6WDk5WUpSQ1ZvNDROdEhuWHZDRVIxRTJEcDJ0MTFueVZEMjBwWWhX?=
 =?utf-8?B?YzAwTkZpOW13UW9IM3dMNU9sNjhzT21kNGxxVVJEZkNLTVl1RmRlVitweEJo?=
 =?utf-8?B?dUhhc1V2dnhELzZlQVlFUHh1MitFV2tjQjhNYWZHakExWDRLNXIrL1VQL2NX?=
 =?utf-8?B?MEEwc0hqRVhNV1RLbEpRcmxlVTRKSnhpTXdJM0V2UW8rZjBVOVBJais5eW80?=
 =?utf-8?B?SlBtY1BER3VBRERDeUd5YkdQRUFGSGlVV0d3eHdtTnh1YlR2Mmw0RUdBbjVy?=
 =?utf-8?B?dm5JQ0xPcDZVQzRjbmY1RElVQVRjY1kxWXNKOHJvN2RyQ212aGROZ09iTHh0?=
 =?utf-8?B?YXE0VjdUc3JsejVvVXJJczhaUTk5MlNxNHFwOHh2UEhxNC9SQzdQZkJ3cXJz?=
 =?utf-8?B?M0o0V3MwdjY1TlFCZ1lFTmd1bWZ3NTFnNnEyeEtCa1RBeitJKzRoWEdnOENH?=
 =?utf-8?B?L0gwNUF0eE93K0FKeEZiK0pHQisrQXl3UE0xeHdialdFd3EzZ2NIWFI3VWlu?=
 =?utf-8?B?VXJVcHNqbWJkOUc4OTloemYvV3F3ZTVQakpqMWZjU2JvWW1YUHlRcktFbENX?=
 =?utf-8?B?WTRnVjJ2ajgxNk9mV21MTEZwNXE0M1lJQm9PdHcxQndaOWJtVkFBSzZvM0NS?=
 =?utf-8?B?MU9ZN1JHWTRlMDc3UXBKV09ocmxSS2xJVVBEREhiTkFzVGVCeWZJYW5XRjl3?=
 =?utf-8?B?cUZtNEk2Qmp5RGErVE9JU2tHTTVldm5CUWNsdlBMa1FGZjd2dWoyekMxemZY?=
 =?utf-8?B?MTJPditrWUJLUjZYTm5WQzE3TCttWTBvTUdkUWdIekRUWTREQXlkVnFTZ2ky?=
 =?utf-8?B?T0RES05KdytkRnJDdEp5VUJGRFg3WjZ1VUltRU9WbkhJOXByMG9zRWN4NEpW?=
 =?utf-8?B?TGlueWhkeGtpVDR4VzZqTTFjYytETXJJdkgvQnVVSllBZDlCakhqdUluNGRH?=
 =?utf-8?Q?PQn5yhfAZKbpI/oV27Ps4lgHh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DBF54FC315A59458DD89DA4E89AD598@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uTgDMtYOsSCED6U85BWdS4YOwowrHFgqui8wxSNjC1Yu21P7UBNjxvIKDIx2czCiBeASiyQP5iYbULH7htOcRfvLBwkQ8YvdIg5YAnqpV9C/qqHDKzAbqxHWGOf3jNKYgLHYaWSd8a+xRZVhm8/hKfBhX17hXLFy0snT460+KhBaog1F4Jegnj80JGsVDWzWb/9EMePBbZtxHiEGf0H7YFKyqyhFHuy1nSQJZN9DbRtnd3LD0ZMWTa30VQzXd+s4tlbdt2qjaZSl042qQ0I9EdxOEvJ7xnadmUiUf1u8irb25H5wQe8Gq0CXHIkPTh4SLOLaxM2k2aWmGzuSTn4jyRRY8MJqbI1ZaZ+JIBCVhlI0rGXOerGrDPyXpiJq4oZwcrHovpkUCZav5gwURZIAutCl76RhHvh9U952P85/xHFIwkXWYwaNZLehYysc42bew8xjQ/49m3C4X70nLtYA3q20y/Qb0Zy5ZeqhP4ti33SqW+vSXA8IOV1LHSd7GD3G7IWIdIONR7pM6O8n+HFK2RcEvwja3uVMzYihE1/YbALDU0G3lO0FBo7ZhNtwl6EynpOPkZRBi0I48Xey4aqUY+lYIj3Wv3R7JLYSAZkwlfUL+ENwbQ4nDfTDVnCEw+hyNS4FGdnxHAFGz4rtMUifimDABs6Ow7PEPeTUZqW7sYex6yky10HbiSpmV0GTr+7jSJeRg77DhRdliyDk5pTSYjrLL/OTYzQWQoev26A+xKn5/Zjv43JmA/GHhs5U5qoqVNQttPDYqnsXJpTob4NHGLBT45EidDgZrJkXSnjmKYciyH0I0JyDAP78FiJjrfZuCKvaCZY0shOfvwLQRDrlGhjCci5fxFYuRdhx/T2g+Lw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97222673-4b13-4926-db52-08dac970f9f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 14:27:09.3193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2aeJucJoQ8AQN2pdCRNg0M7X0IE5fsdgjevMt1h3G/oCsuOT6pzgyMmeZZ2OFy/ZuEyo3ZI6Eo9x/pE/yT5FOVRB2v4dsq5l3PNeOoS+Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5486

T24gMTgvMTEvMjAyMiAxMjo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE4LjExLjIwMjIg
MTM6MzMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxOC8xMS8yMDIyIDEwOjMxLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBMaW51eCdlcyByZWxhdGl2ZWx5IG5ldyB1c2Ugb2YgSFZNT1Bf
c2V0X2V2dGNobl91cGNhbGxfdmVjdG9yIGhhcw0KPj4+IGV4cG9zZWQgYSBwcm9ibGVtIHdpdGgg
dGhlIG1hcmtpbmcgb2YgdGhlIHJlc3BlY3RpdmUgdmVjdG9yIGFzDQo+Pj4gcGVuZGluZzogRm9y
IHF1aXRlIHNvbWUgdGltZSBMaW51eCBoYXMgYmVlbiBjaGVja2luZyB3aGV0aGVyIGFueSBzdGFs
ZQ0KPj4+IElTUiBvciBJUlIgYml0cyB3b3VsZCBzdGlsbCBiZSBzZXQgd2hpbGUgcHJlcGFyaW5n
IHRoZSBMQVBJQyBmb3IgdXNlLg0KPj4+IFRoaXMgY2hlY2sgaXMgbm93IHRyaWdnZXJpbmcgb24g
dGhlIHVwY2FsbCB2ZWN0b3IsIGFzIHRoZSByZWdpc3RyYXRpb24sDQo+Pj4gYXQgbGVhc3QgZm9y
IEFQcywgaGFwcGVucyBiZWZvcmUgdGhlIExBUElDIGlzIGFjdHVhbGx5IGVuYWJsZWQuDQo+Pj4N
Cj4+PiBJbiBzb2Z0d2FyZS1kaXNhYmxlZCBzdGF0ZSBhbiBMQVBJQyB3b3VsZCBub3QgYWNjZXB0
IGFueSBpbnRlcnJ1cHQNCj4+PiByZXF1ZXN0cyBhbmQgaGVuY2Ugbm8gSVJSIGJpdCB3b3VsZCBu
ZXdseSBiZWNvbWUgc2V0IHdoaWxlIGluIHRoaXMNCj4+PiBzdGF0ZS4gQXMgYSByZXN1bHQgaXQg
aXMgYWxzbyB3cm9uZyBmb3IgdXMgdG8gbWFyayB0aGUgdXBjYWxsIHZlY3RvciBhcw0KPj4+IGhh
dmluZyBhIHBlbmRpbmcgcmVxdWVzdCB3aGVuIHRoZSB2TEFQSUMgaXMgaW4gdGhpcyBzdGF0ZS4N
Cj4+IEkgYWdyZWUgd2l0aCB0aGlzLg0KPj4NCj4+PiBUbyBjb21wZW5zYXRlIGZvciB0aGUgImVu
YWJsZWQiIGNoZWNrIGFkZGVkIHRvIHRoZSBhc3NlcnRpb24gbG9naWMsIGFkZA0KPj4+IGxvZ2lj
IHRvIChjb25kaXRpb25hbGx5KSBtYXJrIHRoZSB1cGNhbGwgdmVjdG9yIGFzIGhhdmluZyBhIHJl
cXVlc3QNCj4+PiBwZW5kaW5nIGF0IHRoZSB0aW1lIHRoZSBMQVBJQyBpcyBiZWluZyBzb2Z0d2Fy
ZS1lbmFibGVkIGJ5IHRoZSBndWVzdC4NCj4+IEJ1dCB0aGlzLCBJIGRvbid0IHRoaW5rIGlzIGFw
cHJvcHJpYXRlLg0KPj4NCj4+IFRoZSBwb2ludCBvZiByYWlzaW5nIG9uIGVuYWJsZSBpcyBhbGxl
Z2VkbHkgdG8gd29yayBhcm91bmQgc2V0dXAgcmFjZQ0KPj4gY29uZGl0aW9ucy7CoCBJJ20gdW5j
b252aW5jZWQgYnkgdGhpcyByZWFzb25pbmcsIGJ1dCBpdCBpcyB3aGF0IGl0IGlzLA0KPj4gYW5k
IHRoZSBzdGF0ZWQgYmVoYXZpb3VyIGlzIHRvIHJhaXNlIHRoZXJlIGFuZCB0aGVuLg0KPj4NCj4+
IElmIGEgZ3Vlc3QgZW5hYmxlcyBldnRjaG4gd2hpbGUgdGhlIExBUElDIGlzIGRpc2FibGVkLCB0
aGVuIHRoZQ0KPj4gaW50ZXJydXB0IGlzIGxvc3QuwqAgTGlrZSBldmVyeSBvdGhlciBpbnRlcnJ1
cHQgaW4gYW4geDg2IHN5c3RlbS4NCj4gRWRnZSB0cmlnZ2VyZWQgb25lcyB5b3UgbWVhbiwgSSBz
dXBwb3NlLCBidXQgeWVzLg0KDQpGb3IgSU8tQVBJQyBzeXN0ZW1zLCB5b3UgbW9zdGx5IGxvc2Ug
bGluZSBpbnRlcnJ1cHRzIHRvbywgZG9uJ3QgeW91Pw0KDQpUaGUgbGluZSB3aWxsIHJlbWFpbiBw
ZW5kaW5nIGF0IHRoZSBJTy1BUElDLCBidXQgbm90aGluZyBpbiB0aGUgc3lzdGVtDQp3aWxsIHVu
d2VkZ2UgdW50aWwgc29tZW9uZSBwb2xscyB0aGUgSU8tQVBJQy4NCg0KRWl0aGVyIHdheS4uLg0K
DQo+DQo+PiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueSBjcmVkaWJsZSB3YXkgYSBndWVzdCBr
ZXJuZWwgYXV0aG9yIGNhbiBleHBlY3QNCj4+IHRoZSB3ZWlyZCBldnRjaG4gZWRnZWNhc2UgdG8g
d2FpdCBmb3IgYW4gYXJiaXRyYXJ5IHBvaW50IGluIHRoZSBmdXR1cmUsDQo+PiBhbmQgaXQncyBh
IGNvcm5lciBjYXNlIHRoYXQgSSB0aGluayBpcyB3b3J0aCBub3Qga2VlcGluZy4NCj4gV2VsbCAt
IGRpZCB5b3UgbG9vayBhdCA3YjViOGNhN2RmZmQgKCJ4ODYvdXBjYWxsOiBpbmplY3QgYSBzcHVy
aW91cyBldmVudA0KPiBhZnRlciBzZXR0aW5nIHVwY2FsbCB2ZWN0b3IiKSwgcmVmZXJlbmNlZCBi
eSB0aGUgRml4ZXM6IHRhZz8gVGhlIGlzc3VlIGlzDQo+IHRoYXQgd2l0aCBldnRjaG5fdXBjYWxs
X3BlbmRpbmcgb25jZSBzZXQsIHRoZXJlIHdvdWxkIG5ldmVyIGFnYWluIGJlIGENCj4gbm90aWZp
Y2F0aW9uLg0KDQpPaywgc28gd2UgZG8gbmVlZCB0byBkbyBzb21ldGhpbmcuDQoNCj4gIFNvIGlm
IHdoYXQgeW91IHNheSBpcyB0byBiZSB0aGUgbW9kZWwgd2UgZm9sbG93LCB0aGVuIHRoYXQNCj4g
ZWFybGllciBjaGFuZ2Ugd2FzIHBlcmhhcHMgd3JvbmcgYXMgd2VsbC4gSW5zdGVhZCBpdCBzaG91
bGQgdGhlbiBoYXZlDQo+IGJlZW4gYSBndWVzdCBjaGFuZ2UgKGFzIGFsc28gaW1wbGljaXQgZnJv
bSB5b3VyIHJlcGx5KSB0byBjbGVhcg0KPiBldnRjaG5fdXBjYWxsX3BlbmRpbmcgYWZ0ZXIgdkNQ
VSBpbmZvIHJlZ2lzdHJhdGlvbiAodGhlcmUpIG9yIExBUElDDQo+IGVuYWJsaW5nIChoZXJlKSwg
cGVyaGFwcyBieSB3YXkgb2YgIm1hbnVhbGx5IiBpbnZva2luZyB0aGUgaGFuZGxpbmcgb2YNCj4g
dGhhdCBwZW5kaW5nIGV2ZW50LCBvciBieSBpc3N1aW5nIGEgc2VsZi1JUEkgd2l0aCB0aGF0IHZl
Y3Rvci4NCj4gRXNwZWNpYWxseSB0aGUgTEFQSUMgZW5hYmxpbmcgY2FzZSB3b3VsZCB0aGVuIGJl
IHlldCBhbm90aGVyIFhlbi1zcGVjaWZpYw0KPiBvbiBhIGd1ZXN0IGNvZGUgcGF0aCB3aGljaCBi
ZXR0ZXIgd291bGRuJ3QgaGF2ZSB0byBiZSBhd2FyZSBvZiBYZW4uIA0KDQpXaXRob3V0IHRyeWlu
ZyB0byBwcmVzY3JpYmUgaG93IHRvIGZpeCB0aGlzIHNwZWNpZmljIGlzc3VlLCB3aGVyZXZlcg0K
cG9zc2libGUgd2Ugc2hvdWxkIGJlIHRyeWluZyB0byBsaW1pdCB0aGUgWGVuLWlzbXMgZnJvbSBu
b24tWGVuIGFyZWFzLsKgDQpUaGVyZSdzIGEgd2hvbGUgbG90IG9mIHBvb3JseSBkZXNjcmliZWQg
YW5kIHN1cnByaXNpbmcgYmVoYXZpb3VycyB3aGljaA0KaGF2ZSBub3Qgc3Rvb2QgdGhlIHRlc3Qg
b2YgdGltZS4NCg0KSW4gdGhpcyBjYXNlLCBpdCBzZWVtcyB0aGF0IHdlIGhhdmUgeWV0IGFub3Ro
ZXIgeDg2IFBWLWlzbSB3aGljaCBoYXNuJ3QNCnRyYW5zbGF0ZWQgd2VsbCB4ODYgSFZNLsKgIFNw
ZWNpZmljYWxseSwgd2UncmUgdHJ5aW5nIHRvIG92ZXJsYXkgYW4NCmVudGlyZWx5IHNoYXJlZC1t
ZW1vcnkgKGFuZCBkZWxheWVkIHJldHVybi10by1ndWVzdCkgaW50ZXJydXB0DQpjb250cm9sbGVy
IG9udG8gb25lIHdoaWNoIGlzIHByb3Blcmx5IGNvbnN0cnVjdGVkIHRvIGhhbmRsZSBldmVudHMg
aW4NCnJlYWx0aW1lLg0KDQoNCkkgZXZlbiBnb3QgYXMgZmFyIGFzIHdyaXRpbmcgdGhhdCBtYXli
ZSBsZWF2aW5nIGl0IGFzLWlzIHdhcyB0aGUgYmVzdA0Kb3B0aW9uIChwcmluY2lwbGUgb2YgbGVh
c3Qgc3VycHJpc2UgZm9yIFhlbiBkZXZlbG9wZXJzKSwgYnV0IG91cg0KImZyaWVuZCIgYXBpYyBh
Y2NlbGVyYXRpb24gc3RyaWtlcyBhZ2Fpbi4NCg0KWGVuIGRvZXNuJ3QgYWx3YXlzIGdldCBhIFZN
RXhpdCB3aGVuIHRoZSBndWVzdCBjbGVhcnMgU1dfRElTQUJMRSwNCmJlY2F1c2UgbWljcm9jb2Rl
IG1heSBoYXZlIGFjY2VsZXJhdGVkIGl0Lg0KDQpBIGNvbnNlcXVlbmNlIG9mIHRoaXMgb2JzZXJ2
YXRpb24gaXMgdGhhdCBYZW4gY2Fubm90IGhhdmUNCm5vbi1MQVBJQy1hcmNodGllY3R1cmFsIGJl
aGF2aW91ciBpbiB0aGUgdmxhcGljIGVtdWxhdGlvbi7CoCBTbyBJIHRoaW5rDQp3ZSBuZWVkIHRv
IGZpbmQgYSBzb2x1dGlvbiB0byB0aGlzIHByb2JsZW0gdGhhdCBkb2Vzbid0IGhvb2sgQVBJQ19T
UElWLg0KDQp+QW5kcmV3DQo=

