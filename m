Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F015396DC
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 21:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340023.564956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw7O6-0003Os-Q2; Tue, 31 May 2022 19:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340023.564956; Tue, 31 May 2022 19:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw7O6-0003MD-MP; Tue, 31 May 2022 19:18:42 +0000
Received: by outflank-mailman (input) for mailman id 340023;
 Tue, 31 May 2022 19:18:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tbfe=WH=citrix.com=prvs=143db7279=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nw7O5-0003M7-DU
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 19:18:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 790bd1d4-e116-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 21:18:39 +0200 (CEST)
Received: from mail-sn1anam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 15:18:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6330.namprd03.prod.outlook.com (2603:10b6:303:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 19:18:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 19:18:33 +0000
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
X-Inumbo-ID: 790bd1d4-e116-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654024719;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FHHPmNQdu/8LaseeoLzbafUTfMJua3Vle91SravkGVY=;
  b=MoCEFbDOdjuu3iClLwDVuk9jzzB1f6rU0wBI3s+y5cQiInU3WV4EhRMU
   /FozG/soovZyFBEe7Ck3PRuj80XxSMS2ZpPcSUJHSbgxlsqh6JM9vGiyF
   6GqZ2G0i2kSnXNSMROtVSv4Hcp+J29aBZqVVFnjr/ZBP4BpfDUlvAmwvu
   A=;
X-IronPort-RemoteIP: 104.47.57.46
X-IronPort-MID: 72561332
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:C5uJgKJLaIyDXvt3FE+Rh5UlxSXFcZb7ZxGr2PjKsXjdYENS0jdSx
 2UYUWHVb63eMGenLtklYIq0pBsF75fSzYVgQAVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Ux2YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PVBhaSwZTY5ApbjnuEAEDxxDyY5D4QTrdcrIVDn2SCS52vvViO2hs5IVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM+FH/uiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2IC9QzM/vFti4TV5C1wj7b8DdXvQfCDettRgQWah
 F+f3nusV3n2M/Tak1Jp6EmEivfUmCLnWKobDLCi6uNxm1qX23ASDxsNE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JuFOk95BCI27DjyQ+TDWgZTRZMcNUj8sQxQFQCy
 Vuhj97vQzt1v9W9Unma6qvSoTqsODM9NnMLfysNR00E5LHLq4EpjwnTSc5jHbTzhdn8AzLY2
 CyDtiw3jfMSiqYj1ay98UrWnjGEqZ3ATwpz7QLSNkqv4xllfoeja8qt4ELC8PdbBI+DSx+Ku
 31ss9OF8OkEAJWJlSqMaOYABrek47CCKjK0qVxyG5gs8Ry99njleppfiBl8Lkp0NscPeRfyf
 VTe/whW4fd7MHSmYKBtaqqtGs8qyu7mDt2jWffKBueiebB0fQ6DuTpoPEeW1mW1ykw0y/ljZ
 9GcbNqmCmscBeJ/1j2qSuwB0LgtgCcj2WfUQpO9xBOiuVaDWEOopX4+GAPmRogEAGms+205L
 /432xO29ihi
IronPort-HdrOrdr: A9a23:W6K8vaOEQOX9nsBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUiFYJuYeU9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="scan'208";a="72561332"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwfBOVIDi1ebPb5l6hTGDtMbwR1quoGh+1Dy661VKkEPvJW6JNEAs6BTz7WAOqPSeR9Ph6k1xAFdvTAz/TVoVNt8k0nfj05cEN31d2R6v2oi4JhDyAsHCDQktRrM4eCJC7QF9rtBXvGHTz/Gw8/8PQ2lBghR9pT3k2AUf6U7Ok3TWDmdQGSYDNi7N4FJbrQFv4muZH5v6FeHdh6d/dlRGknPEb/alFAXOE7buiuQGwoznjacscTms/lWnyKO+JjQxFWTYQKx6QlAqpSRhXq8EFNhRau4UxmVykFwO+XR7D8X6O5yNZA9rY3scW0vkEUYgz/DOfhsWhPxDjoIiQH/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHHPmNQdu/8LaseeoLzbafUTfMJua3Vle91SravkGVY=;
 b=moIwngWll1MNwzNKc6yeeO0vdcs5G9mrATYtX2XjLwJmk5zzkqV5G/GIqnaTE3IUf41bXsuok0Pj+UyC0k+w8IEQ4a1YJO7Mq5GaTNy55WKJxuo4dRirYxFG4rNAar+LMUwkosVfJ+MginD1OQ6wBuivcIQdM9CvO2AhGEayUpFCOKzvOYTrIqfByonB5eA1WV1hzvyiRvPSow/j+iTuwVVXbr+/OQkCgZiunwu6Q55YayJin71x8y6wyoRx9U978bL5Bi7pZzh5+eI03u76jt0TjjQC0o/qdqkba7AORio2InskEeF8LUspnHowdDsjyqvG/DHKDNQuNXi/+d0SOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHHPmNQdu/8LaseeoLzbafUTfMJua3Vle91SravkGVY=;
 b=TDfXgURpsAGawAglmstKHEdZEzthURAeFCsCKuGkJ6fLK792T0zgp0cQhFQ+PBlLtymIFQJoYTkeUYiT6TImTDqn9mjU3/cXlPx07GpEfxh34RUBIh+u3jw/R38mwwJ8Yneyg8GBX9Vo9D/aDIP7L6rW8BMNo1NiZFZyGdNU464=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>,
	"jandryuk@gmail.com" <jandryuk@gmail.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v4 3/3] xsm: properly handle error from XSM init
Thread-Topic: [PATCH v4 3/3] xsm: properly handle error from XSM init
Thread-Index: AQHYdRtxX+A3YwtAuUu8lGLDBtUPnK05XDiA
Date: Tue, 31 May 2022 19:18:33 +0000
Message-ID: <c206a20b-ee5f-aa5b-64ba-fe06469f0f2f@citrix.com>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-4-dpsmith@apertussolutions.com>
In-Reply-To: <20220531182041.10640-4-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c967b1f-86ff-4384-dc3b-08da433a5aed
x-ms-traffictypediagnostic: MW4PR03MB6330:EE_
x-microsoft-antispam-prvs:
 <MW4PR03MB6330F195D99694079F7E0F64BADC9@MW4PR03MB6330.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YE7PnD5igCgWps/rq3qxUzPskVLfdgwPqJe1XmnTVHWu3QAnLAewIl+KiW6Y4xSKwXMSmyLR5W6DnGiHYBwnlf7JMHfHiFs+HbJ6mQzaEgwbDKe3KNNkSlYixshv+skqh8u1kE2+ANn5y7KUSFFbVb+m8NvBTPwccxxdDXsfY5auDrCLF3rmarYnoTbAiXsihnoq7imN333avoEKfzCyr6woAw+0ouSfpMh+6BnLJq0EFgVjqya1BIJEXTVaF0AORsDBqHaKsb4BnapzKOBNL9bYwKDttm2lAzoPxkQdOkW2TVc2Ju2AiYrQ+PouSe3Jnsu7eSKv7MRzsc9q/+Vf2+WGxjXQPxQEiBsRjD8G28fjE7iHPkHHrfDJwqg73uhFifmoWEaBQmuFMxDhZTUxGIRRT3V4lw/yBEwmNzSbTYQFNIZ/SHBQnEXAeaM7lLk92zvXDTQFLkyoYBoh8tjDJheRw8JIc8fgyv9KIHD3noN+1RM0GcqIgA/mPjZD2EGlRMMRCu34geCMvbl3aVUpXFcYLQ/CvGolzs7c5AJDdmnQ3ZHswcD53huDIgq/APbfBWuXrW5oO6Pe/24qVeKKI1s7OjIpu6ECa8/nPYAf7QQfh1Qx6j+lpbvYtLwaEWiRriC9waz2NfqmtZpO7Rwrbn1OgqOKGppjlLVk2FzHDGO+VIBrgq+4rL6Sy1zmYXahE36R9z+U+QBwB5Ekb543WiDTimo4NsN7aX57kb8mbQCKifT1KO5OAqBZE0BenMswlJI8/FWsSx/ODcGZ6cch3A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(6512007)(53546011)(6506007)(38070700005)(66556008)(66476007)(110136005)(4326008)(36756003)(316002)(82960400001)(64756008)(122000001)(76116006)(66946007)(91956017)(66446008)(71200400001)(8676002)(31686004)(8936002)(54906003)(6486002)(5660300002)(7416002)(38100700002)(508600001)(2906002)(86362001)(83380400001)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXNsZFJqQTZHUCsycW9GcmtYVXN6ZzNVM1BhK0FySWROQ1AvcVlWQWRuVWl6?=
 =?utf-8?B?QXBlRk80cnUzQmxUN2xWYWNnUDJXNUM4M2QvY1VTVkRMYTFQeDdFb2lVUUxz?=
 =?utf-8?B?Ty9jV2tiOEdhQ2Mxa0JJODNJVzY5dXRXVGVpUkc3ZUVBUTlOTkpJa0RwSFUx?=
 =?utf-8?B?T1o3R0dtVHF1SGJ0U0VNS3Y5dzVwU3RpazhMVExJOFdXSzVCaW5CbnljTGx2?=
 =?utf-8?B?Sk01TmJ4bUZNbExQODYwU1BlVENxZ3JsOTcxdlJzOGR6UU02R3N2MFB0ZjA3?=
 =?utf-8?B?V1hpMi9vRi8wODlBVzJ6L2IwQ2ZPU3djYmNjdkJHanRDcWlpMVpPdUZJa2Jz?=
 =?utf-8?B?WDhUOFZpZG44NS9mUENORFhObmNkempuN0dNekFHZVd4K29FMTR5VCtsMXFU?=
 =?utf-8?B?S3RINm05R25Sb1U2WEZYdTNoclZ0Ti95UWV0cWphODZOcWI0YjEwSlVEOHNy?=
 =?utf-8?B?bXIyVUQ1ZWxWNmxWSzJYZHFheUJxSnNFRUozYVZsMmhPYXBpZzlvbDREUjNj?=
 =?utf-8?B?TGNDK3ZxOGcwbFpta3M5U1cySFhmV2Q4NU9kUTNpOVJQcG5nTTd4WEpPT083?=
 =?utf-8?B?cTVWSnNEKzZReGZYRkpMVGowQ2NYOGJBZUFQQnJEekVTYmg2aTlDcGpYYnEv?=
 =?utf-8?B?czNrd2RJMCtoR1ZJOXo0WmZNZlBzY254MjZnL2lmUWREZEtkVEFtTmxpYmFI?=
 =?utf-8?B?MW9XN1p1N25QOWVIcUdpSU5sVU9EMGVyRmYwQ2lDMG44aFc1REthQ1lKN2lQ?=
 =?utf-8?B?NkpPTTB3MDFBQU85YVkvOWNXdWdiOHVHNjBxOEVJRmg2T0JYcXBWV2ZlQkNp?=
 =?utf-8?B?dWI5VjZHYlVqQk9DWDdwOGxFdkFRb2hCVmhsSUtEWmFlUFdWNnQzZXVuYjhN?=
 =?utf-8?B?b2RWSitzV3FvVkR2bURaWXFkMVAzdEUydzBVeWhtQ1hOMFEyNjNmTkpwcmFN?=
 =?utf-8?B?THhHRi9vZ1hld3N5S3djaXZEWXJIUldPSzQwS1N1bmJScFhPRkwzN05sL2pp?=
 =?utf-8?B?OHRqdlA3UnBNMXdnMGZaemtReS9XT1cvQnNYQ3VacnR2c0lMaFI1NzFoSENx?=
 =?utf-8?B?WUNjNzh1QW96Rmp1eHVnV29UQ2pSeXVuYU95aEgwWUVKT3hST0FtenNQRlVr?=
 =?utf-8?B?U0JjNHUyRkEzWUh3NTdjY1JuZVVnYWg3Q0ZmWWY1eFc0TEVKbk1IazF6cDY3?=
 =?utf-8?B?WUNsYmJpc2xmWHVOdDVGM3ZKRDJBUzMrWnU5NXdlckFYRjVDRGNJaEVNS1ZL?=
 =?utf-8?B?Mk9zVithRlhSNUVVemFmRTZ1SVBIdnpRZzJzVDNHQUxHeEFrNERialNYbkJv?=
 =?utf-8?B?NnJ0L2krV2QvSEx1OU5ocVZac3hVTThVZWJ3WjlnRDBvSjUyQ2xnMUlOMW96?=
 =?utf-8?B?YVpPdU9lUDY0VVdTYm5tVjJpcVp0MkhqbG9JK1RiY0hmbFJmRVlvNG1jMHhY?=
 =?utf-8?B?L0ZZQ0JqT2VEWGJBUm8vU2VIU1JwYTl3ZzEwdzdzL2tlVHpXUS9mU1pwbUpL?=
 =?utf-8?B?ZVhHUkNWbFNFSmdYYmpmWjhnV0FSbUg4NnAxaXBCT1R5eDI4ZWJqTCsrcG95?=
 =?utf-8?B?WWx1UXFBRm13MUc3TWVWdDBWbmlQL3Z5STkxMDZ4VXYxMWNTWFd1VjQ3eUU5?=
 =?utf-8?B?N3ZMby90TVI4S3k0VW9rWHlpd3QvK25uODlDeGgyRWt0THFjclJ2d2RsMWht?=
 =?utf-8?B?eFplOVEyYzFGRU5LMWUxQ3liMHVvK2o0UEtUY2NCYWZSTWtwK29QUWNJaTBw?=
 =?utf-8?B?d0FUdmpGYjcwNDNYN0dxMVUvbExPM3BTL3BGM1Y2L2krUTRzb1JPSHg5UWF3?=
 =?utf-8?B?YXhFOXZPUW05NlRveEc3VUg1ZHdhbHJ6VThtZ3dtcnV6blJPYittWTFnL0dq?=
 =?utf-8?B?bjFDNmoyQVlGQVRZd0NsL0d5Yi94WnhFTzNjTk02SlJRcWpDUkpBZkNCd3pX?=
 =?utf-8?B?WkdjV21sU2VwK3V6RG15TTIrK0s5dEdTczZHaXFSRmtIU1JjNHg5NE1hbDlz?=
 =?utf-8?B?N1NnZXE4L3BjYXBnUkNXUXRHeXlYVUY5MEtvQk0yejR3enJqVWpBRWIzMTBr?=
 =?utf-8?B?YitlZzFSUFp4blorelkrYkQ5akw5RjFxb3hPa3l5NE05RGM0dk54K0VBQVFv?=
 =?utf-8?B?U0VFUE5hQWp5c0Y1OWZ3UkFCeEptTjBRR1RJTk8welZLZTM2aTFDcTNXQjdC?=
 =?utf-8?B?QzhHbmJSelB6RUZucXM0NTlWN1NQTVZJdURSRU1IcEdoUGdOazZjK2dIejF2?=
 =?utf-8?B?NWl1RytCbmJXY0VuQWExV0VrK1hZV1VrSEcxTzB5R3cyai91eEJ6QmhjTzdL?=
 =?utf-8?B?akxnTUpLbEx6TXdHUXJuWUh2NW5iVFB2VTVSZHZWREJNZjNoUThybk1IaGg0?=
 =?utf-8?Q?jJJgOpe/85t7khWs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89ED2E496A8DEF4B9BE30133F77073BD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c967b1f-86ff-4384-dc3b-08da433a5aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 19:18:33.8579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxLdpEvAUQZYf2LqHJsEDurjIsl5vIk31XjZwx80yUa5nTjeLk4r0KMz3K2D/haWpwlSvbI8aq4CXvwPkbRb6rhmBaJgmkTahwNQVAfW7tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6330

T24gMzEvMDUvMjAyMiAxOToyMCwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiBpbmRleCA1
M2E3MzAxMGUwLi5lZDY3YjUwYzlkIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAu
Yw0KPiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiBAQCAtMTcwMCw3ICsxNzAxLDExIEBA
IHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApDQo+
ICAgICAgbW1pb19yb19yYW5nZXMgPSByYW5nZXNldF9uZXcoTlVMTCwgInIvbyBtbWlvIHJhbmdl
cyIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUkFOR0VTRVRGX3ByZXR0
eXByaW50X2hleCk7DQo+ICANCj4gLSAgICB4c21fbXVsdGlib290X2luaXQobW9kdWxlX21hcCwg
bWJpKTsNCj4gKyAgICBpZiAoIHhzbV9tdWx0aWJvb3RfaW5pdChtb2R1bGVfbWFwLCBtYmkpICkN
Cj4gKyAgICAgICAgd2FybmluZ19hZGQoIldBUk5JTkc6IFhTTSBmYWlsZWQgdG8gaW5pdGlhbGl6
ZS5cbiINCj4gKyAgICAgICAgICAgICAgICAgICAgIlRoaXMgaGFzIGltcGxpY2F0aW9ucyBvbiB0
aGUgc2VjdXJpdHkgb2YgdGhlIHN5c3RlbSxcbiINCj4gKyAgICAgICAgICAgICAgICAgICAgImFz
IHVuY29udHJvbGxlZCBjb21tdW5pY2F0aW9ucyBiZXR3ZWVuIHRydXN0ZWQgYW5kXG4iDQo+ICsg
ICAgICAgICAgICAgICAgICAgICJ1bnRydXN0ZWQgZG9tYWlucyBtYXkgb2NjdXIuXG4iKTsNCg0K
VGhlIHByb2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgaXQgZm9yY2VzIGVhY2ggYXJj
aGl0ZWN0dXJlIHRvDQpvcGVuY29kZSB0aGUgZmFpbHVyZSBzdHJpbmcsIGluIGEgZnVuY3Rpb24g
d2hpY2ggaXMgdmVyeSBidXN5IHdpdGggb3RoZXINCnRoaW5ncyB0b28uDQoNCkNvdWxkbid0IHhz
bV97bXVsdGlib290LGR0fV9pbml0KCkgYmUgdm9pZCwgYW5kIHRoZSB3YXJuaW5nX2FkZCgpIG1v
dmUNCmludG8gdGhlbSwgbGlrZSB0aGUgU0xJTyB3YXJuaW5nIGZvciBBUk0gYWxyZWFkeT8NCg0K
VGhhdCB3b3VsZCBzaW1wbGlmeSBib3RoIEFSTSBhbmQgeDg2J3MgX19zdGFydF94ZW4oKSwgYW5k
IGJlIGFuDQppbXByb3ZlbWVudCBmb3IgdGhlIFJJU0MtViBzZXJpZXMganVzdCBwb3N0ZWQgdG8g
eGVuLWRldmVsLi4uDQoNCn5BbmRyZXcNCg==

