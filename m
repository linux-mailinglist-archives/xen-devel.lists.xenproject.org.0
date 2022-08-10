Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F18C58F2DF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383862.619070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrAC-0003Y3-5A; Wed, 10 Aug 2022 19:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383862.619070; Wed, 10 Aug 2022 19:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrAC-0003V7-0O; Wed, 10 Aug 2022 19:14:44 +0000
Received: by outflank-mailman (input) for mailman id 383862;
 Wed, 10 Aug 2022 19:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLrAA-0003V1-7s
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:14:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae3c792c-18e0-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:14:40 +0200 (CEST)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 15:14:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5268.namprd03.prod.outlook.com (2603:10b6:a03:219::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 19:14:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 19:14:36 +0000
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
X-Inumbo-ID: ae3c792c-18e0-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660158880;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QTx+Kz/aEwuTzgAjrw6hrgZaNaf8EX8zcO/0uiPVfDc=;
  b=D2wppvezJ8fOmXsImrW5KWlJtIOi8ImEzWSpUAlkMSMayyN0xhu3AIfb
   xFyuSuCvleQdcwNAvOv3VIgV/nSu0ioV+2e10X6LT0m3u39P9hS175aWQ
   AcBhBdt9HWsIqKTsQvyA96ivNgnuDJLbPx2+YlD8AlPW/WprphoeNjhM7
   o=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 78253028
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qwieNqDTDcLtsxVW/zDiw5YqxClBgxIJ4kV8jS/XYbTApDwkgWAEz
 WocDDzVP62KYjCgLYh+PNi0p0MPvsLdzIc2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEsvrb83uDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW17v5Ok2UxoRBrAn1PlLHUMUt
 r9CMwlYO3hvh8ruqF66Ys9Fo517aezUZsYYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbru3yGiG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFZIbCkmLfohpAgMfshTjwdqRNLoGe2eNxvVnPxE4SOgYvAA7TTf6RzxTWt8hkA
 04e9zcqrKMy3Fe2VdS7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebSMu/
 k+EmZXuHzMHjVGOYXeU97PRqCzoPyEQdDcGfXVdFVZD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zl+/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:1I0We60mBX4jTbjk2bsG2QqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="78253028"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwjDWNiGJnHlKQWPGJNHubzNNI2ffHsc0ejHWrILuyzVY+6BGHqZAU9dI5caU1NuWOiZg3WxS1YyBW8lnMW+WNVX4HV77xQF+E71GNskGviIef/eKvmzYfpbl0PnD28LeOyCjmuspiy8hGr77HFltN+SJdAHdGda/ceLaBsVxEqNyUqOzrkQ5QYlwthjcZmb2YmALyeuEuBRPU4FNTsqcvdFc5CHfVBK9ur4OMBAaQltrcCPm97iV1Il/thjEot2hNVZTU+YrWrdZvryyK6Br04oZ/k8NRprHX89BB52ewBMXdThtb4O3SRIQQQmwVRinPOyytcPM6diHd+EbLXwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTx+Kz/aEwuTzgAjrw6hrgZaNaf8EX8zcO/0uiPVfDc=;
 b=ITxFefYg/AqSxU1/ISM32Haejoc0ShNj6qp8MzY79ZSx1BgunkMXtQWXwLpodkZEsd+Lf+TtrVAJL3QWLNBNVKR5IUzUTOadl8hfOUJryH271fGkPn1+1fg/2xkI+Y00O8cTesbMhy/M0Nd52jJnpP+Z8EYUTqz3CFor9dqOV0Xf6AX33+CPo4uSxlHvBfZgln/pY6JWHBSBNUDTHb4UrRkKF5vjjRsLgO0nKIrb8joFby9uEIaSNXW/HS/KmyFfNUPymTyFhiGQUL9tN67nZ1BnBpeaY9FfH3jgJ6Vusn5cTvtzvhMTHPe3gpX1YOmea1OT/fam3HkWjQabUi8vsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTx+Kz/aEwuTzgAjrw6hrgZaNaf8EX8zcO/0uiPVfDc=;
 b=AVbnu1WSZ4GE4i7BgKdlgFfukXVf1PV7QdxS7eYedaenSTh/W2DExY2FHXfAD8jpIY2NxZ3t0NHQRnmoSAH15KOEbf3yE3IshsCKGOG0WGS6+T+Cjx/wl66CJy7ZSOZC/Kut/2LsoK+GiR+T98EKEvDk1HytqJCfPhjuj2rVrLw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 11/11] x86emul: AVX512-FP16 testing
Thread-Topic: [PATCH 11/11] x86emul: AVX512-FP16 testing
Thread-Index: AQHYgKMxj2bzalbWCEimkboyQ2IgqK2o2ZSA
Date: Wed, 10 Aug 2022 19:14:36 +0000
Message-ID: <ec0c4bf4-b3d4-8921-a369-3798c5d36168@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <a64d46c5-53ca-299e-a7f7-7f66f6ae871f@suse.com>
In-Reply-To: <a64d46c5-53ca-299e-a7f7-7f66f6ae871f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c11df64e-d8b0-4f65-8fe3-08da7b049097
x-ms-traffictypediagnostic: BY5PR03MB5268:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FBb0lgEa/fCwkb9BTxrrauG4iQCxXPDrDu0zl3zYrgt5ZR9O4pqzky8ReuvszNUI/G+ndujEBZyNdxyW1+5y/TZPHjmstC3OdNduFOf4rdhoU0TkNVhActmPy/J6jBfea0oh1KfHaVft+qAYeHsOKICF4CZctE5mghhrTlcZNprCVvVs3GeTVUT9Ii5Woy1VW/JybYvyWRbcRSdqL6wIZvDjOsivklvZuFE4JVhTyIX7A8MDdwSCou++U5mbD6kMnxEI+JURzKPd9KRK8FSpd1qqamSoMNgL7a5AEVmZuqzPDeF9dblNA09JG7ZeTbQwBMYYawrgHBsTJ6jweIuTvKGX6zvXUdzaNZzSC9a2mTQdfI7Nofj7ryndEOgIwzubZ6CTXOcNwtOJuKPtOkForp9DsA8h4g74wNN74NdlkN3Ge5TEthG5lnw8UMGtbCmrWpEEnbwqqHrrM59Aicz0BCsI1jT6BH+1sQuxjOSFK1Ajbg8IHhiO/WQlwYmJY7KvbajFjQUTXisj+eppSsI8vjzsunvpHPPiHzF9gtP1cRPQWAifX9a4mtZPnMqir7rT072ODPR+cbne+3QeSw0QWpf9nBKeq69CgolTfotPMSlJY3F4tTx1pNgYPaX580gxbiWTaVapZyssb9f/4EPADqLe/9LdHd2iZerk7F9cPsCVYPm5nKHDOHiwOTEhvbsHrQhK6lPZXHzwt2TNpeiSSZ5byAl5IqB/AOlVJXR29KE4Bh+GOEzr6ZsEaQXnQWbqh2VpDxHRfeQItv0ONv+2PN6cmxvfMi8mqTpOJxJZpoaR0loJxWo3bPEPDk0V6bAb3pzq2xGrn8Yv9XV9TnyJCh29btOlOfw/EuQrJczugpe616JapymcW4o2RfBwVOJO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(53546011)(38100700002)(41300700001)(2906002)(122000001)(83380400001)(2616005)(6506007)(186003)(107886003)(6512007)(26005)(64756008)(66446008)(66946007)(31686004)(66556008)(8676002)(4326008)(66476007)(76116006)(36756003)(31696002)(91956017)(71200400001)(54906003)(316002)(110136005)(5660300002)(82960400001)(8936002)(4744005)(6486002)(478600001)(38070700005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFA4aFFlN285ZXNLaWRFU0FITnV2K2swdFE3VWtDQlprd1EwQ0VGOWI3SVBL?=
 =?utf-8?B?Sjh6bFBxeDVRekdWajRDalBNUENZOU1NVWV2Q1RqOUU1TDNtYTJRRHZTb295?=
 =?utf-8?B?VjZiajBNL29mU0tvVDJrWDVEcExadVd0aUFLdXRKR3dVWGxTL09FMXh4V01L?=
 =?utf-8?B?V1A3SmhKTGtaWFJNU1NkOWU4TzBBMWFKellXYVcyelVwQmNGVXp5N3o2c1pB?=
 =?utf-8?B?NGd5OHRXOXJSOTEycnJTdTE4Rzh5L2x5SldyVGZXdW1IbEY5NEpSWCtTV1hB?=
 =?utf-8?B?Rm9rRmw5NTVPRGY0bXRqT2ZQZytYTGtRenNaZnZXOFVtcUIyRGxnRjlRVjFS?=
 =?utf-8?B?Nkt3cTh1cUdXWU9HQnZHSWw2QnFqQ0FwNUc4TXRXanU5bndxM2RoeitlL0Z1?=
 =?utf-8?B?TkxjZkVVU3RHQlk5d0hiU2VUa0FyKzRxQmw2YmNJejNzQjhnSkl3THNaUXRG?=
 =?utf-8?B?QVFCWmxzQ0IvYmNTNDdMNUprYW03OG1iZThBWFlsWHd4NnJRU2QwY09iZFhj?=
 =?utf-8?B?dG91VDY1WFhjTmRqdDlPUVhYN0U5ZkVBVTJocHdwQjdia3FqR1BQOFlxWUNk?=
 =?utf-8?B?QzArb3ltQjY3dzFZY3grdWdTcncwZENLZE5Zai9wVnRCNTR3SnFOdWRFWEN0?=
 =?utf-8?B?eDZDLzBmT25KajlyZXQ1SUdXTGR5Y09ubktDc25HQnRWbHV3K0dUaElrOWh2?=
 =?utf-8?B?R2lKOGUyai9xMTd1QXlaOGk0TVdwRC91STRNUjA5NWMvMkZUUVFMMGdSNmdX?=
 =?utf-8?B?eFdaOGtwalp6VDZhV3doM3M2bFRDdXVxdVJnUnZOdlpVdEJmMTduc25zSVhr?=
 =?utf-8?B?SWpwRXpCUnVSeXBraFdXM29FaisyMWdLS0Y4ak84RUVGWC9KWU1KNDZLdkRC?=
 =?utf-8?B?YUd1NDVPSWJyK2FVWXJkR0pMSFBJOVo4ZGhWTTFhLzNua1ZoaE9WVWdUNTUz?=
 =?utf-8?B?MnhMRlFvWFR1WTA0ZmJway9obzNsajJudzcvWENqUEtxOHBHb1U2YjFGYnVG?=
 =?utf-8?B?TEg2S2RFWDRiaG8ybnRJMGdGYnRwNzZRKzdpaEF3RDBWUlhwMFNWRU1qdGs2?=
 =?utf-8?B?eEoyS2tFbmYwQWZFdkJieVhmR1IvNW9nSk5yb29XQk1mRXNKUnpuVmNNc1BV?=
 =?utf-8?B?VEJJQUlHeDcvMTBRc1F2WUt5MkkvbkFYWkZVZHJNZ09iSStFUUJxc20rMTIx?=
 =?utf-8?B?TWgzeXh0SjFiS0JZc2NxT1Zpd0RpZ1BFQUNOOXdaNWR1cWQ4UmdYY09ZYnFU?=
 =?utf-8?B?YjdLZGNPVGJCajVUN3BoaEpwZ0VubjVmb04yWHNaR0ZsN2lrS3NoaGtYRC9V?=
 =?utf-8?B?dHVSMUZSaGhpYlNvNXFhK2d6ekEzT1VXWGg3RjhjQll2WU1zOUF1emhzV2xs?=
 =?utf-8?B?VFVYS3dhcXg4dDlmcnRCZ3JkNTU4QUtLUFVTdEZaa0hiTWR6ZmVkeWZIU1Yx?=
 =?utf-8?B?RHVReGR1YVFwWHk4NXZHY3l4cCtqZ29DbEQ2SXlkc2ZBRWhCK0pIZXhtUkNv?=
 =?utf-8?B?akdBdGFiOUpvKzVYSU9ZWTdUREsySmJtZ0E5V3JVZ3VMa2Y2bTlJaHJrSkNQ?=
 =?utf-8?B?WmIvVmpwUnpsZzdMQXA5SFFaSnBpNUpVUjQ1ZW5TOW81VDJGb1p3bjV2Z1Mv?=
 =?utf-8?B?MHEzdnV0bE5lMy9YV0M0ZVpRRlpOK1V2SDFjbG9nbnlmVEk5V1habHAxQWRQ?=
 =?utf-8?B?dy83bGo0Qk8va0lhU0doU0FuQk5xRmptOHd2c2JRdUFBYi9lOW8zY0pvbHBt?=
 =?utf-8?B?UlRhVDRNRFRYUDI0bHFwcE1HdUlCekl6dExVRld6SXQ4K0JBb20xQ21TaFdT?=
 =?utf-8?B?Qm9RMHhpVk1wck1rSVErWHR2WEdpV1h1OGpQWUxPRTJFbWJZdHZROWQyWHp1?=
 =?utf-8?B?WXZvMUV5RUd1TTZrbElyUTdPRkFjT3VSK1FHUGJLR1VkTjdBcUxMZFRZSFZz?=
 =?utf-8?B?b3Y1cVBEallDSmxOeEhLZE5TeTd1SUVnVjFvM3JvemJjMkZKamZwNFF3YWp0?=
 =?utf-8?B?R0g3RWU2dTNjK1RGWjNKbU15TGo2NzdycDRhVkZuWk5STzgzRTNvb2pWYUJL?=
 =?utf-8?B?MTRQckJMd2EvbmNjanNsTlM3NmFBZXpnckozVThYMEJkTHdQM2RrWmtZRmdF?=
 =?utf-8?B?MVBzcU8rV251OUlPOGF5M1UvUHY4NXB5K2xYaTVJSXZ1b0Y2aDNMVE83T0ZT?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <457736151DF53F4DAB420FADCFE2FBA9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jFUtjqUzf82XEIKyXcUO5KUhkROh+i10ToWc34AQx1J4OJ2tGs5Ib9zPQYTaDW35o0+y4Y9ITz7r2lpnLlVkHRUKQdXS1FfTSphDRPB8s9aCNy/0vTEgK9UGtAlWQpZf7Bin8Zil7flYDfJ5UFYCdelEalaPDUM8nDv/Q3I/Bk3Dhg09vkk0q349zt8vjy/PHhBSeJA3/pKxx6xgVJ2SpLzuTdlKURf5sPJjNoaKIbnsqARkI0DIzlHg85gfKT73o0IUnSP+XIzOPSZUrw2pvS92p1PGuM/ZEhVCCiaWvljFfQG0mwBv2OUXtZcnkp2QqvkSlU2dhhV4pAQPL7tQb+d58xl3baeGWAzqexL3TJJJ0J0ChE9fDW5O//ZAbv9sLiMnIbzVWtzlPMcRhz2BB9rIMCPIWV0iAN7jLIoaSazeWv0VDQQVoDxV+EftW4vhO4telzHnlcpjXNt1Ndgx2UAB5KBIuEWJcbqqR1ugfiK2p+ByB0Sqr6X0h9pzNz+CfQsMutPw68F+5+8qeDTsL5jlpFQp3BUArutNLpKPoJRTgrM/ArihPRsdwNSOXjS9J1iD9VRXWQ9JlXAuXE3SbqYJFQWZxBLw8mMY2SnIG7b0GVUghKjaUm6WmHob47jofarmToFkLUFu4aw8Q5smumZ6kYcF8N0Mu0ROnCxw/oD3N8OOth4N+g+nV4bY6w3C/x3WVnlEKFBfr/pxR8ErKXMdA3hpxV6gBZvPbmKHFIMm0Y/TdXOma6G2Y2PPxsxylWYpUoeRSN8B2+v81D0ct7ZhLI3MGWIHzKKXQaNTHnw2j1l+37jwn1MQCIkchoUs
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11df64e-d8b0-4f65-8fe3-08da7b049097
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 19:14:36.1815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxD0Yler7PQHsFZ3vskiRrSb/ISuW2fA+9tnFpFEewMEgqseWQmOPlf4Mh2fq0Pz3G7O6Hp3gjJB6xd4KUHW/k8y+0tiqx/JKQgelv9JNJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5268

T24gMTUvMDYvMjAyMiAxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IC0tLSBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgNCj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaA0KPiBAQCAtMjgxLDcgKzI4MSw3IEBAIFhF
Tl9DUFVGRUFUVVJFKFRTWF9GT1JDRV9BQk9SVCwgOSozMisxMykNCj4gIFhFTl9DUFVGRUFUVVJF
KFNFUklBTElaRSwgICAgIDkqMzIrMTQpIC8qQSAgU0VSSUFMSVpFIGluc24gKi8NCj4gIFhFTl9D
UFVGRUFUVVJFKFRTWExEVFJLLCAgICAgIDkqMzIrMTYpIC8qYSAgVFNYIGxvYWQgdHJhY2tpbmcg
c3VzcGVuZC9yZXN1bWUgaW5zbnMgKi8NCj4gIFhFTl9DUFVGRUFUVVJFKENFVF9JQlQsICAgICAg
IDkqMzIrMjApIC8qICAgQ0VUIC0gSW5kaXJlY3QgQnJhbmNoIFRyYWNraW5nICovDQo+IC1YRU5f
Q1BVRkVBVFVSRShBVlg1MTJfRlAxNiwgICA5KjMyKzIzKSAvKiAgIEFWWDUxMiBGUDE2IGluc3Ry
dWN0aW9ucyAqLw0KPiArWEVOX0NQVUZFQVRVUkUoQVZYNTEyX0ZQMTYsICAgOSozMisyMykgLypB
ICBBVlg1MTIgRlAxNiBpbnN0cnVjdGlvbnMgKi8NCg0KVGhpcyBvdWdodCB0byBiZSAnYScgcmF0
aGVyIHRoYW4gJ0EnIHVudGlsIHNvbWVvbmUncyBhY3R1YWxseSBydW4gdGhlDQpzZXJpZXMgb24g
YSBTUFIgc3lzdGVtLg0KDQpPdGhlcndpc2UsIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

