Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2DB644244
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:38:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454735.712275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WHE-0003jV-F6; Tue, 06 Dec 2022 11:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454735.712275; Tue, 06 Dec 2022 11:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WHE-0003hB-Bp; Tue, 06 Dec 2022 11:38:20 +0000
Received: by outflank-mailman (input) for mailman id 454735;
 Tue, 06 Dec 2022 11:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2WHC-0003fc-K3
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:38:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78e642ca-755a-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 12:38:17 +0100 (CET)
Received: from mail-dm3nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 06:38:07 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5070.namprd03.prod.outlook.com (2603:10b6:208:1a4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 11:38:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:38:03 +0000
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
X-Inumbo-ID: 78e642ca-755a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670326697;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gQgt10He7KzTAaYMqaXCjtZGC5//rXfD8vz6ludIS7o=;
  b=TH/O9c8FH/XLwB65qkRb5Q0TpWJG7jTlBccVDc0TldWQC0feRnjyxDCv
   C4cVz+8IrrbK3NB3d0at4zInofiEIyBs5p4WS98GVQJ9ztDYw8VXGtr25
   mNpD6Xw5WFN7yrGDU3pjNzIdKwCzNQsElJlVZD1WJJclkaw6xkbRrh7py
   M=;
X-IronPort-RemoteIP: 104.47.56.42
X-IronPort-MID: 86814856
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SOqgJq5mpH7nnFLw77HkFgxRtL7GchMFZxGqfqrLsTDasY5as4F+v
 jFOCD+AO6uDNmTzftwnao6w/EgCu5PSm4AwGQo6+XtjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 +UIKBAzci65wOfp+46LVOtAmt4YBZy+VG8fkikIITDxK98DGcqGb4CRoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkkotitABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCNxCTeHoq6ACbFu73GAZUU0ZWXmAq/j+hgmQavFzI
 Ewe9X97xUQ13AnxJjXnZDW0rXuFlh8aRdtLEuc+5R2Ny6zb+AKQDC4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9KGYYYCYeQAgt4t/9oZoyhBbCUtZiFqGuitT/Xzr3x
 liiriIzmrEShs4jzLig8BbMhDfEjofNZh444EPQRG3Nxh94Yaa1aoru7kLUhd5CI5yeVUKpp
 2Uflo6V6+VmMH2WvCmEQeFIELTy4f+AaGfYmQQ3Q8Nn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqyPBjaSSvCdrDO6wRw=
IronPort-HdrOrdr: A9a23:kHhLOaC1UsSd8/DlHeiCsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX242oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD1nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZNB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MkiFQJuYdM99RDBmcYa+d
 pVfZjhDTFtAAunhkXizy5SKRqXLy8O91m9MxI/U4euokVrdThCvjclLYok7zQ9HdsGOud5D6
 6vCNUWqJheCsARdq5zH+EHXI++DXHMWwvFNCaILU3gD7xvAQOEl3dZ2sRG2AiGQu1/8HIJou
 WJbHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFlr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2RTN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdDXAXPagAZJQy09Jju7TlbLc8wzT9oW7Jlv2jOHlFrrE8el
 d4Lffujr67zFPGiFr10w==
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="86814856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB73ocq9pkp6h7qSMdAegoUj/sRGu3K9FfdcmctKYyD8njOrp3pPbHmq/YamlyLTrGk10aKediLmAMhTEB1OlC+qHc2uPBxok6sSWUq0yeVsZFdJoYhsMnAD66e3J19MBVFZDy/pvQhmMsQYVV+jZ/HkJKgTyxYHA0KrToTQl6Wrl3SfZ9PqZDbgbANIg+TFf/M7+CKD+OZ/OlONXVzyLbq2HjdZqZpmPdZT4uJJhQPFrkcmAq7Mk0rmOP/SPiY1XaxyOmL9qJyVPVWQDbVqy+BCTPD9wrtF+LdSaKo8iP/a3/Qqdun/V0eNE2cFg6SymudGsOW1AyaX8uWYpuj07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQgt10He7KzTAaYMqaXCjtZGC5//rXfD8vz6ludIS7o=;
 b=keK4fqRT0YsB+VNEwVhMSzhmhVBvlkwKbtRWYtPxPtMVMt0ns6a05Lj6Z5XLopfu22VkKHecSOR8SCwjzacwqIJIqeR9YgwZsI0lzfiumxMyxfwUVmqX5EIx/Wf7SRmyRy+iXRusk32fenSQh87MIWqcsN2ftwNjYDbh3oGeABZCsI0BnH5xrZ9ZMvlJc5paf8loz+W6mnTuYz4s4e3f5MQxjZWu74pNxeefAdOwiWUkE0JCBnPiVEWpNCV1vazXwhBA0ExNCvJDu6CZq2S5hW+SFk77sMPX3ekz46eBFRzwhuXNzJblXOnJCmKVngb6dD/5yVKFLVynhXAe6/zvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQgt10He7KzTAaYMqaXCjtZGC5//rXfD8vz6ludIS7o=;
 b=wl25F2Z1FLVWGNF7NSXJEh19kuDmZO3B8QikoD+JXBnYT7dcm1d+eHRZKfHOXI6TG6A/klt6Ex6pV1WgQNOzFRkMf87kCFodw33c1KO6qzXIKoy5rZMGKRVPnr0fSXnnP/+tDkFqO2rpuxiIb5CQCpJ/zroeKbROMkRj3UtdJzQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT
Thread-Topic: [RFC PATCH 8/8] Use Linux's PAT
Thread-Index: AQHZCSwR5y5i/dykvEaDhCh4UTMiXq5gvA6A
Date: Tue, 6 Dec 2022 11:38:03 +0000
Message-ID: <4b2a87e1-89d1-b5fb-bd92-b891c8cea98a@citrix.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <9f0bd911ba6c7fe1b7285f232154d42807145ced.1670300446.git.demi@invisiblethingslab.com>
In-Reply-To:
 <9f0bd911ba6c7fe1b7285f232154d42807145ced.1670300446.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5070:EE_
x-ms-office365-filtering-correlation-id: 5c72a1d4-016a-4ede-2406-08dad77e5608
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5uskS4LfoNVpQd4jjb83a96iWOdy6PQko1SOgi63YoQWT+kB9gnOAocUOlz0dyim6qxZZH5YkR+e1NQjUjTzuEAlaaFaA4KRjCWlWj8AWUFjJ0o+IPDdmeToA0o88UHMxCn0C3ou1XWD+7qE12hB65lOr32ewzscLAfVYZ22MWtnRIp8spV8EnYfKavAJiAFmDPXqtPIZkQnPebmaCry6H4yXMfPi9WaTKVUQ9ywLSMCA7/tIJnTGcf3ukdvXPW2p0yX5sHJdtuIU+F2Yv9N8Y06Rarma9K5k6GyPIDncu8FiKPf/LZqYGK8fC3YM3qq5drIxISHgjdNp4QfYYCfk3uwaL1kdQGOAOIdBxHKxg2LEIakrUvSassL8wBVxvm9DdhGvKneFaNBCc3SSvEIzqqMl0+/e8u2a4yt43KUo5glt9fKK44IIohF6q3AZrGtBnVjSH4ND9hnATBnXRujXuod6Px8JJUsfXjSHMK01J3X0OlYme5swL0ilUpJufhqd1emXzzYDyXwzF6I9NKA2ma4JMlfzrQ83sBlfjlDMUyd1iVIZTz/P2d10u1MArq/3RdW7t4K6d7C1rWhsd908ZFh1VFafdRvTC0gDWljK7ZAf3lGWTh3UcMujKrhGrmDhu9HUylW5aMtkXjRELiirJeL/1Oe/3JwPJPLDPIgvgDDINmzWzp8KIJWgQgsnAvacsGe96gzjUUPXlqNCm4oK5vu8vOv33qztvenu2DDZd/nVA3ujIBjx0UoP7ptK5BzMNxrsRb72iihoiqMLmTxWg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199015)(31686004)(186003)(316002)(6486002)(54906003)(478600001)(71200400001)(38070700005)(82960400001)(86362001)(31696002)(36756003)(38100700002)(6512007)(122000001)(26005)(6506007)(2616005)(110136005)(53546011)(5660300002)(2906002)(8676002)(41300700001)(4744005)(4326008)(66446008)(66476007)(66946007)(91956017)(8936002)(66556008)(76116006)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUlncWMyK3hhclpkOEtkMzZzcEdzdEF2UGEwM3FLeWN3YmdoVzZjLzhpMWNC?=
 =?utf-8?B?ejNoMHBwL3F5eS9pY3l6RTdmNmFjbG9Jd0ZiT1lMVnMxWmE4aHNXcmF4ZmN3?=
 =?utf-8?B?czFiRmZhMS94NjVDRmRQTmM0U3cyWUFOdWlmclVLUW00bVZrbTZGVlFqdmdv?=
 =?utf-8?B?NHlyNmdHYUdqTjVlRklUTldiSEVZb2ZWaU1hZGFKb3RmR1dUUkoyeVpsbEU5?=
 =?utf-8?B?NldnNVRkeGRqQkQwOWlDYm5jM2ZUZjZpNHdGSVRRRWpRMUo3YUpWQTVMUjND?=
 =?utf-8?B?R25GbDRmRWc3aHp5YlcrUkhzMzIzYnAyY0tzaDlYVUJhSlpkcGxGVHExT0Jn?=
 =?utf-8?B?cXpIdHhnRUNmRHluTjh0WkxoN0Rza0JGaEtPNE0rSHhUa2c2Vmc1OVJ0ZEk1?=
 =?utf-8?B?Z2Z0cTBUUzUwYm5SdUV6TFlNbG1Zb3d1bXZMbHBzRWdNbWVvYUI1WUxHRkZY?=
 =?utf-8?B?L3U4M01lNHVXeGVoUm03RkwxYkRLN3NTY01QV0V5WW9SVEd6dU44WDJtSFNu?=
 =?utf-8?B?ajEyblV0a2QyYlF1SjdHeloyQmltTnoybU96ZEdVNy9ubTZNbUpjVE5kNFJ1?=
 =?utf-8?B?eWNHQ2tPRUR5QkkwTE9TSXZSVjEvMEluRllicXdBZ0RwL3BxcndrQW1VZHo1?=
 =?utf-8?B?VTM3bW11ejYxdmtLdlBOTjNJYnc2VEo1TXovL0JFeHpTaFoyWTdLb0NKenVK?=
 =?utf-8?B?UU50N2hzUG5vaGVteHA1WSt0bEVaK2hsT3hDSnl2M3RuTWliczFtSklvQnND?=
 =?utf-8?B?ZXFWOUpVZ0poMFVLSVVZNDEySEtPbmNBU3d5VWE3YTZCa242UlNQNC9wOXIx?=
 =?utf-8?B?bkRQWHZVZWM3b2RUbllsUTdSNEpaS2s2Nlh6ZkZ3WFNGYnUvcmhmb1Q3Rjlv?=
 =?utf-8?B?NHZyVEQyMXFqWkxCdUZhaXNYZDJYbDg2M2RyYzBwMTd0SFhPVG1TV3Y3NEpH?=
 =?utf-8?B?S2JNV2NPeS9BeUVhU2hNWXplYTFtOFpmUHZQdUNBL20yc1pzZmVrWWJkUXVs?=
 =?utf-8?B?SFBkbHUxc3Y1WGh5dThSckswcmNhR1Y4WG9ZVUJIUG8xajNLYXIyS3J3aVdO?=
 =?utf-8?B?eFZOdlpKOUZqdG5wTDdVN0hiKy9lZ1BzRGhpRmxNVTR5RHkyc0M4NW9zZEpl?=
 =?utf-8?B?WE1SUHc2RU9mR2w1V0Y3NXRiSDg2QlVSbnlEeUdzc1E4WUZ0ZXZiWTI5eUtx?=
 =?utf-8?B?cnY3c1NnczJyMmRPZTE0RjIvc2JVdERkb1FFWktJZmhQcVRYYXpPckhtU0ZJ?=
 =?utf-8?B?OE9jd2kxZ0czcGl5bFBOdnpRcmxGbUxBek02SSthZE9ob1NNVndJTHBjU2VP?=
 =?utf-8?B?ZENneE1Sb1FmYXJ3d2NLaXFjRk4ybm8yWG9LQjQ0djRrbWpKdDlCeDZiQitl?=
 =?utf-8?B?OHI4REhzRWdUSnZ3T3FWWjJzV25jcDE2Sy9xemE1Ylc1RkRBT0VidkluY0dH?=
 =?utf-8?B?T0NxeDdqNnBYNUJjR3hxTHpPazg4WFhiK056TUF5UEkyeXBrQmN2bDlzY1R5?=
 =?utf-8?B?SjNGQy9QYnU0SW5PYVlPeUFHWjJZQjRHVmk3WTFkUzBaNXhsQUhFYnkzRGN4?=
 =?utf-8?B?ZVRXVnlRQkFhTWsyRVJ3MjYzMzhSUXZUbHlUc1IvaTlqUXNPWW5NTlc0bTdS?=
 =?utf-8?B?eUZXU0U0QU53Y2toVXc0ZXY2TzZ1MDBWY3dkb2hkTjI0VkJyUzVCZGxRQUFM?=
 =?utf-8?B?QXR3bEhjUzFseitzSmxDOW1CT1VjNk1LVWNuMDlQeSs2TDVPb1dxeHRmY1Zm?=
 =?utf-8?B?NWg5elBuV0YrYmpQdjhxN0tLYzVLYmJXSzByVW1xeEI4bVZHazUyNWM4bkRk?=
 =?utf-8?B?SjEzTDNuSm91YVdHK08wVDlTaE9GMFc5Ri9SZHJqdmtrWjZRemJGTG9WRXJT?=
 =?utf-8?B?N1E3cWRiQUlWb1JIMjl3Mkp2UEEvVUVqZkljRTlQRzg2QkF4dGh6V20zamNV?=
 =?utf-8?B?QkxwbzZ2c2hYUnE2dHUwbnVxYStPWHBlZVRtYXR4RWo3ZDVka0NtTE1DMDJp?=
 =?utf-8?B?ZnI0NTZ5TThoVXdMYklnOUR1enZhZjdEdStmbTRUamVvMllndGt2VVUwTnFh?=
 =?utf-8?B?WnJMOHZLc3FkYkdiWnhYUDkycm9SVXhSdXBENHhYSDBHYnZWTUp2dWxCMEls?=
 =?utf-8?Q?BWlSbstqicb1WedMDy7hafVPa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF1B8A5159F52D4EA17F27FE26048BF0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?N1UzaTlXRGpkSG1kdkk2NXRDaDN4aFlkYm41dmlQd0VUQWxDSXBNcERGNjNE?=
 =?utf-8?B?djRrMzBkM0JtREpodUdhNDM4WE9OL2xjQXVSNkFvV2dLYmJjRFB2U2x6NUtX?=
 =?utf-8?B?K3Npd1dPSC9pbHBkVmg4aEtoUGNBOWppYkdFTnNiN1pobldNbVoxcU1ReVpj?=
 =?utf-8?B?bHFudVlob2lMZ2cyNHFkb1BwL05idmtVK0loM2RWYVg0bkh3aEZYSVpFYUdi?=
 =?utf-8?B?K2FiTGJ3S2x3Vk0zcVd4RnZWdVd1MUJaaUp3aC9QdXhhdTFCaDlXY1p0ZkRD?=
 =?utf-8?B?V3RQNVFzREQ5Qk15SDRIUE51ZkNOdmYwaHhVcVlxSzE3UVF1K0RDc0ZmY3pz?=
 =?utf-8?B?bjBVQ1QxOXorNklPQlVGdW9BaW1VRG1XYklDVHBOWmtzblZ6TXZwSTNxOVM1?=
 =?utf-8?B?b3FuSjY4dGU3Zy9wL0ZQVFAvZllzeVFFdWUwZmJFbEIybzlIdUNKQ1dMazVV?=
 =?utf-8?B?WnFLQTlrQ3JRakZTYmxFN2ZzbVVTWlZrR3pabXlMamI4TGc0WDVnZC83am9C?=
 =?utf-8?B?OXNSVEhvQnZWTElDTGwxNlVlMWxUYW8zRnFJRG54aVFMdkZxNUlyR1JGSkh0?=
 =?utf-8?B?ZkhLL3c2QUhhOFhNTy9wZ2pnTVpIMjUwN0pQL2taN3NXOFFNTjZxaTZVc0JS?=
 =?utf-8?B?YmdZN1ZaSlFUOUJHbEZGVVhBM0hoL3hkdC9BeWNua0hXdDg3bjVxQ2xJbkZZ?=
 =?utf-8?B?a2cvdzEvQ3FnZlJHdGgxd3RxeEVqcVhwakUybTBUWk01dHpSamRmSXFuZ2ZM?=
 =?utf-8?B?cmhBQTJmaVlVSldlelBOR3pYZ1JpZFMyL3dMVDV2NjdiUitkaEdUdEt0Y3FT?=
 =?utf-8?B?TXZuUDRMTys1Z1Y3TTMveG9oQVBQOHR6MWYvYmJnUmVVZFUweHNKL08rNFB5?=
 =?utf-8?B?NWVUc0E4bS9FeXI3RWtja0swcVR1YWtYNzVOQXB3b0xxZkY5VUlOVzFXWEVY?=
 =?utf-8?B?Qzgyd3dqUzZRc1lsYWY0ZlZma1FtbzZWeml2dEdKOHRjZ3N2cTBBajJ3WHk1?=
 =?utf-8?B?dGRhcHUvQzlKS2xVOVVNZkVjOFFoOHZqYlBNSTFYN0M1Q2lkV3JiYzlVNE8x?=
 =?utf-8?B?NkxtRDBhOTNzWHJGZ0ZPWnBxUVBwcENXdmpUeWsxZzVZOUNORlFoRjdpUjlI?=
 =?utf-8?B?UFJpMi9Ld1BlK3ZHbHVEMUtsNEI1S29tczEvb3ZaVXFuV0J4VGIvU05OVi9w?=
 =?utf-8?B?TTRIRXJwQWVieWtmbGhVUGZJMktTU2EvNDRBSVlpUE9HV1hiVVBabm9OZHRm?=
 =?utf-8?B?a3ZSU0wzVzdyN2F4ZlF1QjdwejFrZTRQWkp3S1NVMk5FMTJZdEwzZGVXS2Zn?=
 =?utf-8?Q?e4ds4TaaHp6x8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c72a1d4-016a-4ede-2406-08dad77e5608
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 11:38:03.5103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXvOu1mIEGLNYe5tuHcMpNXuv1+l4tG/M9vw1nCEy7gu4kz4LAwWpWRmdp62kmBZXIlRajdjMCu2f/9PkQrJS7ZJ7e9/ce0wphR9U5on7GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5070

T24gMDYvMTIvMjAyMiAwNDozMywgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBUaGlzIGlz
IHB1cmVseSBmb3IgdGVzdGluZywgdG8gc2VlIGlmIGl0IHdvcmtzIGFyb3VuZCBhIGJ1ZyBpbiBp
OTE1LiAgSXQNCj4gaXMgbm90IGludGVuZGVkIHRvIGJlIG1lcmdlZC4NCj4NCj4gTk9ULXNpZ25l
ZC1vZmYtYnk6IERPIE5PVCBNRVJHRQ0KDQpGb2xsb3dpbmcgdXAgb24gTWFyZWsncyByZXBvcnQg
b24gSVJDL01hdHJpeCwgeW91J3JlIHNheWluZyB0aGF0IHRoaXMNCmNoYW5nZSBkb2VzIGFjdHVh
bGx5IGZpeCBzY3JlZW4gY29ycnVwdGlvbiBpc3N1ZXMgb24gQWxkZXJMYWtlLCBhbmQNCnNvbWV0
aGluZyBvbiBUaWdlckxha2UgdG9vPw0KDQpJZiB0aGF0IGlzIGFjdHVhbGx5IHRoZSBjYXNlLCB0
aGVuIG9uZSBvZiB0d28gdGhpbmdzIGlzIGhhcHBlbmluZy7CoCBFaXRoZXIsDQoNCjEpIERyaXZl
cnMgaW4gTGludXggYXJlIGJ5cGFzc2luZyB0aGUgcmVndWxhciBjYWNoaW5nIEFQSXMsIG9yDQoy
KSBUaGUgdHJhbnNsYXRpb24gbG9naWMgYmV0d2VlbiBMaW51eCdzIGlkZWEgb2YgY2FjaGVhYmls
aXR5IGFuZCBYZW4ncw0KUEFUIHZhbHVlcyBpcyBidWdneS4NCg0KfkFuZHJldw0K

