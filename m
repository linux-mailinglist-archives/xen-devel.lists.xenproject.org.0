Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950D5EC92C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 18:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412827.656300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odDCz-0001fg-MO; Tue, 27 Sep 2022 16:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412827.656300; Tue, 27 Sep 2022 16:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odDCz-0001cD-J7; Tue, 27 Sep 2022 16:13:21 +0000
Received: by outflank-mailman (input) for mailman id 412827;
 Tue, 27 Sep 2022 16:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYJ1=Z6=citrix.com=prvs=262b5a957=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1odDCz-0001c7-0m
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 16:13:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c175c13-3e7f-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 18:13:19 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 12:13:10 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SA0PR03MB5642.namprd03.prod.outlook.com (2603:10b6:806:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 16:13:08 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::4dc1:6b11:9f99:1eec]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::4dc1:6b11:9f99:1eec%7]) with mapi id 15.20.5676.016; Tue, 27 Sep 2022
 16:13:08 +0000
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
X-Inumbo-ID: 4c175c13-3e7f-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664295199;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=W7Ui61OuPdjEgYUwdZeyClV9lhVkX8/EMlQPr18LY3Y=;
  b=Ap6izi/tHBeAr7GWxxZh8JPw/RzZuyOPxNFjRmMrv0ypgsZyk1P+0b8m
   yYP1sgfSGTfGMziYvG2jkuF2ZYUQxYELjqdNqUOB443q5ILHGVMxgLXeo
   uzYf4nzqh0/51fvVBotpKpyUIYZ6nixYdNNZJ3W2J5ZNh2bOYXcrumsQs
   U=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 81111924
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DVKJFaAUcNUf8xVW/zPiw5YqxClBgxIJ4kV8jS/XYbTApGkk12ZSn
 GobCGHTaa7fYTD8e9gjPoqy9k9SvJfTndJmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37a6t4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kGJ4cF3OVbEVtH/
 OIKcg0zSTTAoruPlefTpulE3qzPLeHNFaZG4jRK626cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWIA7gvN9MLb4ECKpOB1+LXhLtvTPMCNX8JWtk2Zu
 njH7yLyBRRy2Nm3mWPcqyv93LOncSXTd71CS52kx/9WqXKe2Ew6UDsPUXm0rqzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8ywqQGGUsVDNKb90i8sgsSlQCy
 Vuhj97vQzt1v9WopWm1876VqXa4P3cTJGpbPSscF1Jdsp/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BDjNAt9RDGJ9W7GV1A==
IronPort-HdrOrdr: A9a23:T+ZmRKC2oapM19TlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5wOJSepLq59ts5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gSwlGl/NLAgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81111924"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWV82Km+U7RQPy/v2Nl724KjSDL/jq5iJBoH7+6681JaxLCD0yvHE1hpL76hUTtD7b/uZ5wyYQYdnxfLigtp1FZ8v/HJM+vUHZ08GD9ki2SHnQbu6UxZnfjRj0G0Ttrj1MRT0NSBbnp5QeuZRj2Jlv3FGFnFUZ61cjF79M9KwpM7OzvTkZx+ldaPHrHklBv/S4orOggL+j1adpW3fjITI79eDa1FqHxOu8IQ0hqHgVIyu0glRK13h++rchfGMZV4cQniKqnAxrk3EPC6sAJ4TPcDI+UNDg2/ovEj/LWDYQoyimWO/fvebd5KUGXv8bd4LpQE/6Vl8r8u+keO0TqTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7Ui61OuPdjEgYUwdZeyClV9lhVkX8/EMlQPr18LY3Y=;
 b=QrVjuuA3IFTT0QLHpzH7bnLEyX2z2KD3cm3xFK9d4YZBZOPj1bh8YGp5Gp+nnJoWtEKC8jq7I3yyqq/TAIGcoPD3i24ZKNjyyBJDy9gsVbf7Y5CoLxn3JUEdZ7FAkkWZ8aLKhkRkVsnBwR2SQcRoVPoFyFYGkKsofREweiO/4uVAyswAqTb7bT0y1TNHrtTlki15As5VCldsYJMQDAX73gr2O4gCplvh3xDhpf/1QKjPyVw7fy2Tn83hW8mElXEl2BANCmG+3J5QiMckAMCoY+a8S2Hg1quEiMziIFnn+oi401SdywIcrJuPzhUFLXS79q2qtSaxJxGmFiyun/sOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7Ui61OuPdjEgYUwdZeyClV9lhVkX8/EMlQPr18LY3Y=;
 b=BqtILVyYTgFg89r4zeBv+wf1psyKqzFAgZY6/KIpg24HxGiviU+fixlVAE9zsKGpHPW3MY57IxnyTxzofqzt/joThxuIPjkFSdt/HVqP+5RVVpPVzuVIleeuEiNh8Ks1mn/jsoPSHgXMph1HlbqSHViRFRcjjmmw688ETmJ3zY8=
From: Edwin Torok <edvin.torok@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v2 4/5] tools/ocaml/libs/xc: OCaml 5.0 compatibility
Thread-Topic: [PATCH v2 4/5] tools/ocaml/libs/xc: OCaml 5.0 compatibility
Thread-Index: AQHY0mKHWIzo/zbfF0KNs+muY99n/a3zc0gA
Date: Tue, 27 Sep 2022 16:13:08 +0000
Message-ID: <D5BC6A1E-05C8-4044-ADA6-EFA8944CAAD4@citrix.com>
References: <cover.1664276827.git.edvin.torok@citrix.com>
 <7b88cbda20e068bbce1c5dfb0a18af3f4e4b6865.1664276827.git.edvin.torok@citrix.com>
In-Reply-To:
 <7b88cbda20e068bbce1c5dfb0a18af3f4e4b6865.1664276827.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SA0PR03MB5642:EE_
x-ms-office365-filtering-correlation-id: 9d4800eb-fa4b-4493-9b0f-08daa0a32a9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cyK8xhO4TQXMv59kUnpL+n7XSBtXOCRFy1i8TFulTCe0Kz7HfNFOITxk4ZO8EcPMPNX70t2ks1tF3xyS1ais9mO65OecaaNwpQrmX3PoPppTnjtnZTTMZRhHzNglUEdyETn2yKSKi1krizUKUjDIzM1Y7tK6hdHvXIF4F9hT2dEHAADos2M9ON8k9L8daLvcSwSf5DoOGEHARbQxSP7ltLU88sjSqLErVyDhepQAr6/JtZC4aCGszuTZpRKmSfe8iwLyt8R3qV+rfpYBuOc8lx907xA5ek/XSpH9OZ6fAYOTOHshNL3jhPfYqTzpR4ZBmH0rxaq9gEtPymHpRvxW3MwPkkI0o/5X0NACi+bGmWcpaoU0vq/6jD/Xn+U0YCt1nyd+1XHWKhc+Fretk8CGfnms6lTgyboUC+fZQUv4myL8QLzi6DgPNXe2PLQkhpTpbnO/A/DbMRlCJEAO7p0O8gmyjayy8TaI14GnhqleBLA90Aclb96FVrRCvjZ3DWUEMGeIHCWDc6Skd2yvJgjIhjHSzZURBE+2pd1dPALyvaKeldVQbPBe6m4r0rNB141i8KS6W/B9c0YGzloRlO1N+3nGUQo7KyozF9QUHCmJY5K4nNqYZlQtbQawkkxrRCH32ymF2Nm6Tz3ep3haiZje28ssnXXn+i+3jU/pEwqvMQvYpusIzjUhFRe2bbxBPh2hdItvvHGO/HzvglkYbBlIvUm7pKdWDO5oY6ndkjvK8V1TOGcekIokVhj966bF3M0Fsny47SEyRw+bwdK6ecWjNNFBnRcjFsIS4KamhaXjBAN6KptfNEw2Ipq2AuQzRUWnswWvXBhvgpUv9KBWnNqXOQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(45080400002)(6916009)(316002)(54906003)(6486002)(86362001)(966005)(122000001)(478600001)(71200400001)(5660300002)(36756003)(66476007)(91956017)(66946007)(66556008)(66446008)(76116006)(64756008)(8936002)(8676002)(4326008)(33656002)(41300700001)(38100700002)(38070700005)(83380400001)(6512007)(26005)(53546011)(107886003)(6506007)(186003)(2616005)(82960400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjN1WlFXcGJXV1VrbnR1V0JSUWQ2S0w1TUpTQWovN1lDMkR5dHRIdzVtNzFm?=
 =?utf-8?B?K2I0cUswYlJzU1huTUpVMjhmY2JqanN5UUNMMW5ndEVmZUN4S1hvbkNrNG92?=
 =?utf-8?B?akZWckcyNUpyRU1wNnIzcVk3cU54WUtXWGJUaVMrc2lKdTVmQWZHbDkrb3hv?=
 =?utf-8?B?aGdHTFYvRFFxWkJSMHVpcTJKZlZ3eDFWWHNPQS80NkxaekNJc1ZQemNNcGtV?=
 =?utf-8?B?MW9LdFVPVElpNUFwWmJyY2JNcUw4TTkzMWFYajhyNXUwRG1Cb3duZWNIK01u?=
 =?utf-8?B?NGtuL29QYzBDRGlsZkhRazk5b0ZYYjBiZmUzYy9Ec2ptV1NVTG5Qa1RHTlNL?=
 =?utf-8?B?Y3BqNFVkOGFDa1JMSmNObkZXdHhkbTRZVGN2bFk3cm03UHpHb2QxeUloK1VQ?=
 =?utf-8?B?dFBBMGpnWEtXRS9WL2lIOGh2UHFWbTA3dXJqSUJ1azNCK2FscmwyYlFUSm1u?=
 =?utf-8?B?Q21nYUU5R2JWVmRkbXhEb0Rramp6V3NQTE8rRFZwNXFvaDJSVlM5RmdCdnc4?=
 =?utf-8?B?Um9ZMGRjZkRXeS9RSU9XMWVFZkYwRDN5M2FnMGE0Sm9UQ29UWTZaYlZsVGFD?=
 =?utf-8?B?RUNNM0ovM3pPTnB1cFlidytxSjdiOGJXZVVxajJ3QUt0Qm1FVDZmSmI5LzBl?=
 =?utf-8?B?TTFZMk5KRWxVVkVnZDdFc29rdm1LY3htcmNxcXl4TWwvMXdRSVFLWnk5Y3Vz?=
 =?utf-8?B?a01PR2lHelpoSFQzNGxZc2pPZzhCY2VuNGZlTGo1VGN5cWVGVHVwbU5IYTJ3?=
 =?utf-8?B?ZTUvb1FJaElwWFBMRHBpR3BJeGlSZmtDRWNweVRGTHJOQTVNUnZoRE1VM3ky?=
 =?utf-8?B?QW5HY1RsamMvSnE4RXpsUWpLWnI3S01SVDU5djhUdkU1UWV4d29GZS9oblp6?=
 =?utf-8?B?dTFUWndheHBkNWEyRndtTFN1STlmK3JPTmc4dngzSW8xZ3pkWmNqdU9STzhC?=
 =?utf-8?B?Q3hadjRtQlBoNE83cVJpQlhCS2JyMjlTZkZlRXBtWk5LcVA3dUd6SUxiN1FW?=
 =?utf-8?B?eGNWOXUwaGRXdVRKYUg0WXdLSlp1aFJMVm54eVpYOGxVdjlxazlnMDVldmNS?=
 =?utf-8?B?ejlONWJnNGRHdjNabzk3L1ZHd0dmZHNNV012VkkvcWlqeDlnTG5OSVlZY0lj?=
 =?utf-8?B?SEh3RlVzZzkzNFgwTlhGSTI3SFQ1Y2FOVGl4VDJLTjF3QWFNeldpaG4zaFlq?=
 =?utf-8?B?YkRtUUdqN2pIemtGMXUrZ3cva0JHWXdkYU04VktxRkErS0dlSmJZc2h6SnR0?=
 =?utf-8?B?OUtFb3hhVlcrUW83U1hZTVR4OWNlZWlsQzdtaUJOdkJreG9qVGxTcmFGaVc1?=
 =?utf-8?B?RTRmRDUxMCtxVDZxUG43NnBsME1FWW9xVWVDK2lWSmVYMFluNUJWaE9KdzI4?=
 =?utf-8?B?QXllUWdMU0pMcVRvNnJCUzZWcUdtYUl5ZUpObldsa0UzRkJqSDVjcmFBUXJk?=
 =?utf-8?B?L1J3OVkxRWV3MDNwTjNpZHozeXErMmNNVlRjZFcvZVdHQUdkeGJyN25YdkNJ?=
 =?utf-8?B?Sk5hV21Deis0WVphV2xzRmlzMkRsRno0R0dFTkdUbUpzN2MreVk2bXJJZElx?=
 =?utf-8?B?RUxYTTJkSXdQQXBPQ0tvazVqdE53b2IzeXY2TEZYMFBaZkhLMnEwZlg2czF3?=
 =?utf-8?B?VDJPVlhHSHVYOEhQeGxFM21FQlh3ZEU4eE9NK2V5Q1llTHMvVnhIMnNMaWNK?=
 =?utf-8?B?SzZabi9UZVFzbk54V3NWTEYzVkFnaTVlazJzdDZIbWhldExxdURBNmQrQVhv?=
 =?utf-8?B?MlZYQ0FCbTJLcGF0dk5vK3pudElPdVd0V3V1WXdwa2J0WFVPQ1JyZ2xQTjha?=
 =?utf-8?B?dWFYYzlvZVlNM09hSnh2YXJQZUdhc2k1RXZjT3p1Y0h4Z3BTS2w0KzlSQkNK?=
 =?utf-8?B?cVJiUW5ISDlDb3NvcG5QREZ5Y3JQaXNUZlM4OTAwN2FtNHlUUkRwcnBPZGts?=
 =?utf-8?B?MjFjVW45ZnBYSGo5TGFJS2R2Kzh3ZFVyOHFGOVdKRXJtRTM5R0FzZVB1Wk9n?=
 =?utf-8?B?MVEyLzVSVktjUjVQMXJ0TGVJa1FCbEtXeFFzdGNQdFh3cVo2UkppdCtyKytq?=
 =?utf-8?B?dm9RWlZJd0x6UVF2cDdmM1FWWE5RSW8wL1dKTVZKOVVURGJaVzEwQmlwR1JS?=
 =?utf-8?B?aDVPVHgwUmR3UlY0WjUrSWVXVDVyRHQwZm4yS2pnM0s2NUlTTmRERnJzOXNh?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A07A98B75AD3044F955F5F78342CA3CC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4800eb-fa4b-4493-9b0f-08daa0a32a9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 16:13:08.1053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nyshyrr4qf+aJ57yan8CKe2hKdKk4IVhMJ6vTmKfSri4RgFl/QXbOIPRMsx9lsSVxzbqIvGdAE1/lG5U6Ay2Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5642

VGhpcyBhY2NpZGVudGFsbHkgYnJva2UgY29tcGF0aWJpbGl0eSB3aXRoIE9DYW1sIDQuMDIuMywg
DQpvbmx5IHJlYWxpemVkIHdoZW4gSSB3ZW50IGJhY2sgdG8gbXkgRHVuZSBiYXNlZCBidWlsZCBz
eXN0ZW0gd2hpY2ggY2FuIGF1dG9tYXRpY2FsbHkgY29tcGlsZSB3aXRoIG11bHRpcGxlIGNvbXBp
bGVyIHZlcnNpb25zLg0KDQpTZWUgYmVsb3cgZm9yIGEgcGF0Y2ggZm9yIHRoYXQuIEkndmUgaW5j
bHVkZWQgdGhpcyBwYXRjaCBpbiB0aGUgY29ycmVjdCBwbGFjZSAoYmVmb3JlIHRoZSBwYXRjaCB0
aGF0IGJyZWFrcyBpdCkgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0OiANCmh0dHBzOi8vZ2l0aHVi
LmNvbS9lZHdpbnRvcm9rL3hlbi9jb21wYXJlL3ByaXZhdGUvZWR2aW50L3B1YmxpYzANCg0KDQpG
cm9tIDc4YTYxM2NiYjhkYjcwMzNmZTc0MTQ4ODkxMmYyMWIyNGVhYWVmNTYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxDQpNZXNzYWdlLUlkOiA8NzhhNjEzY2JiOGRiNzAzM2ZlNzQxNDg4OTEyZjIx
YjI0ZWFhZWY1Ni4xNjY0Mjk1MDQ2LmdpdC5lZHZpbi50b3Jva0BjaXRyaXguY29tPg0KRnJvbTog
PT9VVEYtOD9xP0Vkd2luPTIwVD1DMz1CNnI9QzM9QjZrPz0gPGVkdmluLnRvcm9rQGNpdHJpeC5j
b20+DQpEYXRlOiBUdWUsIDI3IFNlcCAyMDIyIDE3OjA2OjU3ICswMTAwDQpTdWJqZWN0OiBbUEFU
Q0hdIHRvb2xzL29jYW1sOiBmaXggY29tcGF0aWJpbGl0eSB3aXRoIE9DYW1sIDQuMDIuMw0KTUlN
RS1WZXJzaW9uOiAxLjANCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOA0K
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdA0KDQpTaWduZWQtb2ZmLWJ5OiBFZHdpbiBU
w7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KLS0tDQogdG9vbHMvb2NhbWwvbGlicy9t
bWFwL21tYXBfc3R1YnMuaCB8IDUgKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspDQoNCmRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL21tYXAvbW1hcF9zdHVicy5oIGIv
dG9vbHMvb2NhbWwvbGlicy9tbWFwL21tYXBfc3R1YnMuaA0KaW5kZXggNjVlNDIzOTg5MC4uNWM2
NWNjODZmYiAxMDA2NDQNCi0tLSBhL3Rvb2xzL29jYW1sL2xpYnMvbW1hcC9tbWFwX3N0dWJzLmgN
CisrKyBiL3Rvb2xzL29jYW1sL2xpYnMvbW1hcC9tbWFwX3N0dWJzLmgNCkBAIC0zMCw0ICszMCw5
IEBAIHN0cnVjdCBtbWFwX2ludGVyZmFjZQ0KIAlpbnQgbGVuOw0KIH07DQoNCisvKiBmb3IgY29t
cGF0aWJpbGl0eSB3aXRoIE9DYW1sIDQuMDIuMyAqLw0KKyNpZm5kZWYgRGF0YV9hYnN0cmFjdF92
YWwNCisjZGVmaW5lIERhdGFfYWJzdHJhY3RfdmFsKHYpICgodm9pZCopIE9wX3ZhbCh2KSkNCisj
ZW5kaWYNCisNCiAjZW5kaWYNCi0tDQoyLjM0LjENCg0KPiBPbiAyNyBTZXAgMjAyMiwgYXQgMTI6
MTUsIEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4g
Rm9sbG93IHRoZSBtYW51YWwgdG8gYXZvaWQgbmFrZWQgcG9pbnRlcnM6DQo+IGh0dHBzOi8vbmFt
MDQuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnYy
Lm9jYW1sLm9yZyUyRm1hbnVhbCUyRmludGZjLmh0bWwlMjNzcyUzQWMtb3V0c2lkZS1oZWFkJmFt
cDtkYXRhPTA1JTdDMDElN0NlZHZpbi50b3JvayU0MGNpdHJpeC5jb20lN0M0YmYyOGY3YTMyMDc0
YTQ5Y2RmMDA4ZGFhMDc5YTgwNyU3QzMzNTgzNmRlNDJlZjQzYTJiMTQ1MzQ4YzJlZTljYTViJTdD
MCU3QzAlN0M2Mzc5OTg3NDE2MzQ2MjcxMDUlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9R1UlMkJibUIxYWkwbGxRZzB6NXpXY3R6d1cw
b2NVUVVPSFZsTXhrZUQzVTBVJTNEJmFtcDtyZXNlcnZlZD0wDQo+IA0KPiBObyBmdW5jdGlvbmFs
IGNoYW5nZSwgZXhjZXB0IG9uIE9DYW1sIDUuMCB3aGVyZSBpdCBpcyBhIGJ1Z2ZpeC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQo+
IC0tLQ0KPiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDExICsrKysrKy0t
LS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgYi90
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiBpbmRleCAxOTMzNWJkZjQ1Li43
ZmY0ZTAwMzE0IDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1
YnMuYw0KPiArKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiBAQCAt
MzcsNyArMzcsNyBAQA0KPiANCj4gI2luY2x1ZGUgIm1tYXBfc3R1YnMuaCINCj4gDQo+IC0jZGVm
aW5lIF9IKF9faCkgKCh4Y19pbnRlcmZhY2UgKikoX19oKSkNCj4gKyNkZWZpbmUgX0goX19oKSAq
KCh4Y19pbnRlcmZhY2UgKiopIERhdGFfYWJzdHJhY3RfdmFsKF9faCkpDQo+ICNkZWZpbmUgX0Qo
X19kKSAoKHVpbnQzMl90KUludF92YWwoX19kKSkNCj4gDQo+ICNpZm5kZWYgVmFsX25vbmUNCj4g
QEAgLTcwLDE0ICs3MCwxNSBAQCBzdGF0aWMgdm9pZCBOb3JldHVybiBmYWlsd2l0aF94Yyh4Y19p
bnRlcmZhY2UgKnhjaCkNCj4gQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19pbnRlcmZhY2Vfb3Blbih2
b2lkKQ0KPiB7DQo+IAlDQU1McGFyYW0wKCk7DQo+IC0gICAgICAgIHhjX2ludGVyZmFjZSAqeGNo
Ow0KPiArCUNBTUxsb2NhbDEocmVzdWx0KTsNCj4gDQo+ICsJcmVzdWx0ID0gY2FtbF9hbGxvYygx
LCBBYnN0cmFjdF90YWcpOw0KPiAJLyogRG9uJ3QgYXNzZXJ0IFhDX09QRU5GTEFHX05PTl9SRUVO
VFJBTlQgYmVjYXVzZSB0aGVzZSBiaW5kaW5ncw0KPiAJICogZG8gbm90IHByZXZlbnQgcmUtZW50
cmFuY3kgdG8gbGlieGMgKi8NCj4gLSAgICAgICAgeGNoID0geGNfaW50ZXJmYWNlX29wZW4oTlVM
TCwgTlVMTCwgMCk7DQo+IC0gICAgICAgIGlmICh4Y2ggPT0gTlVMTCkNCj4gKwlfSChyZXN1bHQp
ID0geGNfaW50ZXJmYWNlX29wZW4oTlVMTCwgTlVMTCwgMCk7DQo+ICsJaWYgKF9IKHJlc3VsdCkg
PT0gTlVMTCkNCj4gCQlmYWlsd2l0aF94YyhOVUxMKTsNCj4gLSAgICAgICAgQ0FNTHJldHVybigo
dmFsdWUpeGNoKTsNCj4gKwlDQU1McmV0dXJuKHJlc3VsdCk7DQo+IH0NCj4gDQo+IA0KPiAtLSAN
Cj4gMi4zNC4xDQo+IA0KDQo=

