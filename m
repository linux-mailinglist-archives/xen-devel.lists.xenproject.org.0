Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2F264416F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 11:44:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454604.712121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VQY-00062Q-OY; Tue, 06 Dec 2022 10:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454604.712121; Tue, 06 Dec 2022 10:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VQY-000605-L9; Tue, 06 Dec 2022 10:43:54 +0000
Received: by outflank-mailman (input) for mailman id 454604;
 Tue, 06 Dec 2022 10:43:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WlZ+=4E=citrix.com=prvs=3329fe38d=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1p2VQX-0005zw-BY
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 10:43:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deb97941-7552-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 11:43:51 +0100 (CET)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 05:43:49 -0500
Received: from BN6PR03MB3378.namprd03.prod.outlook.com (2603:10b6:405:42::30)
 by SJ0PR03MB5517.namprd03.prod.outlook.com (2603:10b6:a03:279::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 10:43:47 +0000
Received: from BN6PR03MB3378.namprd03.prod.outlook.com
 ([fe80::b47b:e121:d2c1:1e4a]) by BN6PR03MB3378.namprd03.prod.outlook.com
 ([fe80::b47b:e121:d2c1:1e4a%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 10:43:46 +0000
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
X-Inumbo-ID: deb97941-7552-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670323431;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vAWf+ifIjwxHSFIPq0aoWYCUpeD4/zwsmJJWYemYdhM=;
  b=IL4cFHS1WZrey+79SyJ5mTX6y9o7z01KXRGA3RTeQG6nkBJ5Pfajcrw3
   QlZJNeriOXFgkS13HcpE6Gt+gaQAHBQq+UOxkBs8bEV5YG09+XB2+8NJp
   jG3AZw7J8fKzOU3FsMgtOvkl3RZ61J0TzSEelxvbArZLqoYxi8RAsIa9I
   c=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 86806812
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gJAE6aqafSoL3aq8preQEtWlz1ZeBmLdZBIvgKrLsJaIsI4StFCzt
 garIBmCaanYN2byc94nPIvk9x8C6sfSnIUwQQVu+CA9RHsU+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzydNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACsmVQuNqumw+p7hY+lhuOc+dNHXPbpK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKIEjCJbZw9ckKwn
 m/cuU74BgoXHNee1SCE4jSngeqncSbTCNxCTOPor6QCbFu75EAiBTM5dmGH/rrnkXyVBZFFI
 n025X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8+w+EAkAUQzgHb8Yp3OcpQRQ62
 1nPmMnmbRRtrbmURHS15rqS6zSoNkA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 w1mtwA7jrQXyMIOiaOy+Amfhyr2/8CUCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnzjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:8ZIFpKM4RP6EYsBcTvyjsMiBIKoaSvp033AB3UoZc20zTiX+ra
 yTdZUguiMc7Qx7ZJhOo7690cW7IE80l6QFgrX5TI3DYOCOggLBRuxfBODZsl/d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhjVQyuxQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="86806812"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lug4Mk13t02kYbz4PjczHXeg5BpkoUBVJcXC6Wu9VY0V1zd3RwacHcl+TOZMQyIW8Wj3oH9vl1WRDwJTKalSh0spJ2igX0Op1QqUmyBGxKyusXEGYhaqyQYtQ8IcPSq/weefC0NchJi3Do448V6tVDn4Z/8h0XuPOVhHVBXkwk0bhzp5igS6/4cDLjrS2xeyunfY3Ei1pfiLOI9FqwzNEBbojVDJ2dijhAgjVp+wU+gsE5m9/EoBt2CpioqkEfaI/wLBYrICcQy60NRZBlDXoPg81dVSo3AlpNz0bE2eaZXK4d//xySHxQHBQvglzgZ5TdAXjUHUQZdh03nkXpLYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAWf+ifIjwxHSFIPq0aoWYCUpeD4/zwsmJJWYemYdhM=;
 b=VubZeE1NTl4WKGtRFwcInWrB/CIjmWJGQbXXFISIIlXz/DdAY+pqDFw8hx3ZO6ems1u/QKm2zpL+RISoyLyHXCojUZWM1W8FRoOMDAChoKycP22W3FgdD5LR7IJChXFRlamUyolath0LUAgnuc2cUi4cPHgcfvXSDc0v3Q/MwG2av/7QBtpfb6fGEzfdBE1+/bPyGYaCpCmeNIRMMCDvh+i/pg/3lDP1ZB55n69J6tqN8tFfcGMFvBUkLLPpHGKzMGzZgukYkl4p42ry0foVq7NIttoybOYo4fPh1X6VNN6hv2s79SpOcngB6P5u1GjoWylUAwHJ239YeHei0ABf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAWf+ifIjwxHSFIPq0aoWYCUpeD4/zwsmJJWYemYdhM=;
 b=GTgcg6ylVvwLIlRlJHqU74kmAvEXmbRyL4OEbnm1tuQBVA4EtsSTckm5jiBxRzFFxZVznq6EUV71tpXVYu00Jejs3AZe+Q+46pR0zUxjybnUYIhXg7Vjq43LTtI23EQKuLDwe4+A5rY68TEG27i2eQcyO8xvc7t1t7bdhFzgvtw=
From: "Per Bilse (3P)" <Per.Bilse@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] ioreq_broadcast(): accept partial broadcast success
Thread-Topic: [PATCH] ioreq_broadcast(): accept partial broadcast success
Thread-Index: AQHZCV+dQ5gC8MSrQkutQViuEWIcyQ==
Date: Tue, 6 Dec 2022 10:43:46 +0000
Message-ID: <a41a580d-b4e4-2b2b-d58f-7ecdf3f98f56@citrix.com>
References:
 <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
 <d7a42f21-6dd3-108e-9278-74d756d941e6@xen.org>
 <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
In-Reply-To: <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR03MB3378:EE_|SJ0PR03MB5517:EE_
x-ms-office365-filtering-correlation-id: f68471f5-ca14-489b-decf-08dad776c0da
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GHI+T/feG7uWEIKhni5BPKiY4Euzn4C0GkVzpHQxrVtvFl8KOcypHeAH7t+/f6hfrhVUkrkTbib6TLoELWtxfHnh9LbTTqSZeZ9nZH4rjut3nADUQ7EWSjRWL/3TaGQhMIg4zuKCqdU6DMxluAbOW3K5tWloqV5RGyq3OInlJ3eDm1Gm8KghNwMa7g3JOAogRgo/Fg+YVGLynK86u8baNmAvnWNlEaMIJtlLGhWxaQUfX1mhJa2pO3kscbHZYvMOzTuylA1ELpHhX/9ffq3CCRGCioE1FYplLgLVHZW6tMc/O2ZtfeZVV11WGOSAgaCEB9qeIzkEZfFF5cmq3hgZYOt0oYU0FdrAKrk/SH8nCr1B7yfWN2gEKOdjOKvH7i6scfAr4EsP1Cx0bsL2bWE4EG7YxYxuF4NDyOBIKVBJ/kLDir+g2mO+uUWnbnAw35lky2DKHcDOGyu5gwr6E7jy0ctdOlcB+9wTj6NtiZn9KaJbZy1rTJ0P4uk7gNgz1IhDcJC8mc+hXYk5Loo13WACTQUa+qXijU4fsI/oi/BC3mqFKmjaRz5OjK3fEC8B/3+C0VUfqxwO2sJniZoDl3GjbNoHFwoRv9b4RYLaj/P+kXL1gVTWXI9hx8pkf7Yoi34+A92erf+JC74KAO9OLvCL1vQeeIji86+nU8tK8utAO/3pFgKd5lIIJqvbXf2jv8pPk7jBG97IKhdRQfTut/H7FlZfhqWM5gJg900o73tmsuA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR03MB3378.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(36756003)(6486002)(31686004)(38100700002)(31696002)(41300700001)(86362001)(4326008)(38070700005)(8936002)(2906002)(5660300002)(122000001)(83380400001)(66476007)(478600001)(76116006)(66946007)(6916009)(66556008)(2616005)(54906003)(91956017)(71200400001)(316002)(82960400001)(8676002)(66446008)(6512007)(186003)(53546011)(64756008)(6506007)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTZ4Uk4yNVN5Q3haTzNkRTlBRG5RK1NSZVZhNlFFeExzZm5KbXdWb1BkcXNG?=
 =?utf-8?B?aVlCYk1VNzZpWU50RllZNzZxWE5aeWpMKzhqd00vRkpXczRjWEZHQm1uQXBI?=
 =?utf-8?B?NFp4eUdVcmRYcWlYYy9nTnVwZ1dPM2VYdXhEUS94c3hkS0dHTWNGY3RHWXAx?=
 =?utf-8?B?T0tRMnRvZ3UzaUR2Rjc3c1Vrb3plNzc1VEZ6WkIreklSb3hWNG9SRXgzb2xv?=
 =?utf-8?B?eGpsWlNvSVpNYUtYdXBXMW0yeXRzU3RQNHd2ZCsyakFQRTJ3YlV0VjRNYkZX?=
 =?utf-8?B?d0RtejNYTHBBU3ZIOEdoZ1RTU29yRVgvcWpzVWR0cU82NjlrbEpEaGpuVjhw?=
 =?utf-8?B?M0VkRXhFMjJVQThsQmRJdzhjVVFhZG9CTzZBWDdwcXBDenJXWTdtQlM4Yy9v?=
 =?utf-8?B?WFJ1Y2VTRGlZUXZaQk9NWlZ6eGU5b3BpK2N2c0pBRDFsVmlQaVZJYkc2cHJz?=
 =?utf-8?B?SGJ3bmt5TkJqMU9ycUx2VGpheWFhMFZZN1lXTGlxZVBpblcrRkVHZGVrS1hQ?=
 =?utf-8?B?d1djaE4yUmdvUTdyVXlpeURMclM3elBLTk8rUnZ2anpUU015TkNIcVRhN0No?=
 =?utf-8?B?V1cybHpsdDFmVlRoNFdtR0cvR1EzUk82QkdWcEM0QUt5aWttLzJFbVZUOVo2?=
 =?utf-8?B?dUZhWDFNUDZ6Z2U5MW9rK25qUWJxbktEM2dFVDUxZkZGWG9ZUnEvb2VVS09F?=
 =?utf-8?B?bStHTjN6Nm80RUVyVzlTak5mNjZlY1FyeWFlV2F6Y3BkNER0OGxDVXdEVm9G?=
 =?utf-8?B?MC9iVzcwWEtNSGV0ckZyUlEzVWZId2IxYTJHYVRBZVlNaW9KM0dlNURheW03?=
 =?utf-8?B?aXY5R0tZLzJvUUQ2d1cyQ2t2UmtKa3ZycGt0alVqWHcxdE5RZWhROVlQRHFH?=
 =?utf-8?B?RGMrN0lvaDNrazkzc2FsT2JuZmhsQXFoSnh6WWNSS21PWjgrcWVFTVlGeDJl?=
 =?utf-8?B?TVRqSmtML05HZDhrUllGOGFTeCt1ZWJ3OHBnZHhPaThncDdjaDc3Z3ZrRCt2?=
 =?utf-8?B?WFhVSThKVGpMVDRzSTBHV2pabmZwblh3N2M5dHYyclE0ZnZUZFRVSlZJUGRN?=
 =?utf-8?B?WjQ4ek5LNnN0bFh2aDhPWWRPaGhnL1dJZWhqTnEwdEtHYittZ3UzVnp3UTBL?=
 =?utf-8?B?K09Zd0ZJWTAxZUVBc0V4S1J0bUZwdEJtVmk2bDVLelpiZTdKLzUwSDd4am8r?=
 =?utf-8?B?cDQ5Vm1CcStuTGNieGdGRkFnMXRwcEVrdkJNK2VMN2dxeEN4TjdLQVg0MHla?=
 =?utf-8?B?RXNTMlUyZjY4cGZ4ZmNnWlJOMnlLbGJkTmZjR3FZV2JnWlVqcnlMTll4SVhm?=
 =?utf-8?B?Q3Q5ejloYUIzWHB5SnQ3R0pjdjFvcGdua0JjMGI2RGwzTHJxN1RWcG05RU1J?=
 =?utf-8?B?VDFxNWFJYUFad3o4TVZGUGVmRk1DK2lxWFJHSi91NWVHVkJZdlI1N3RoNXFG?=
 =?utf-8?B?R3BWTFAxeDZ0VHl6Zm5jRjMvK3c5WVVNdUtpdUVVYXB1c2c3amZzYm93elF0?=
 =?utf-8?B?RG9Vb1EzVlZTZEhqeGxJVGd3YUVyTWNzTEg4MVZVOEdEejBUV3BxZ1VUd0Ux?=
 =?utf-8?B?dXJ2NkhSZldVTGhCaEMzalBYVFFxYmpZajVWeSsvL1ljbTZUTG9jcXRMSjkx?=
 =?utf-8?B?MGtLMnhtZ3gvUXhXbTNUWmFjcEk2eUhuMkdiZU9lQlg1NHQ5aThVcHhLTlJR?=
 =?utf-8?B?RGdhNmxHcThKL1pOMEVJU0FxMDBMZXliTWU5QndLUGZaK0grcGRKYmx5d1BP?=
 =?utf-8?B?QWRVYnhNQkN6bjgxNTk2dEVaejhMbk1wdlNYSytHL0xubmo4bDVSbHpLTGEx?=
 =?utf-8?B?NTAveXh2NkhFOG9vRVZ1SThycGN2SktuZ0MyQ1lISFhhbEMwSFhESTA2NDQr?=
 =?utf-8?B?L1pRcmJDeWVjbW1zVzIxREc4ako0RDdMWXFma0xwVVduTmdtS21SejlGalYr?=
 =?utf-8?B?TVJPNDlub25zbVROWjFLTzU4eFpUM3g0NUlWYWZ4aE5maXlhSGlnR1IwQlVz?=
 =?utf-8?B?M1V5a0tnRTY5NWNXZ0twWjUrMDlIdnZaeUtHMmpSTmIyOXJqMkJVaUpTQ0py?=
 =?utf-8?B?K2N0WEdVaCtqS2x1b3ZaRXhXYXBSWk9hc3k2MmRaOWRwM0JRbVJzT3Z5UlAy?=
 =?utf-8?Q?Iuxox1j2ka/VIKo+M9x+4T1It?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20A975C1CF5891469D2CC010CA5C6C1A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9tr3jZNdmX4qyFA6Fk4B2ltRKv0iPYEo4vgXyI4SdkduIJyLFhecnFcygJ9Y6edvLmbK2wK1pmLpQuWRDbtYwIQxZtPHZJh78bE624TDAZ4JquClEV3uGesWV+7MgxFl+k9PIN2h0jC0wa0zn3YxWlWRWMXja2JKOLzZEoporoANOJdCZ/ufHidsieGUezOGTA0qW2VsIP052zK56U5zTMaygITw6FNG9r2hsZoeA3ocSGT/M3bMv4lT1nciuOUn1TeFyJjyD1obWvyqat4GKO8p0fPKl+GnqXL51i0ryrb6YxKm83YoZ0CLwKDoDb0r9WrOnjKhNPRLMkrpPnFKkY17oZzDg2pt2SQcbWF5qdW5cm2DdaDPE8JcMHzTTOF5tMpuTqKdoq4CIjPvoLcHybX0rLztprvgns9W8KLOi+dzuMVri1EnbBwIxadgvEBwxIoAg9PEKqylVlUuSIO5X2RdxbOLffRX3YcrPMLylVNvqmk5XUNDmdpnC80bnwelajyJV6YbzsTh2etHlRhTsIBVuWkXIndF9jd1adquYfxQz9J0xdZivOIyCjWBH3r847vXtkOz/dD8O1uFam0iQj+X+1ylkxvxZJ00UD4fns5eBfpK6cxlkwxYkTFLud4DbBhbqJLs+/29JjxgK6VGdnkdaoflP5H/1Ct9TrZTiUceraCaaMMqZXRC2FDDgXZDA30hHBRMf+kZ+i2jQD5TXa4S8TefrW2zuLe4DJFhGqP/m5yYkabN5hzmC5HjlIkYDXT+cBO4BDKAGDypYfhRWIrlkkzYWGBXMN9DTU2oPzUiKfGxFPcnbKJ2Sd9KJLJShdQgjfTbB1/NOS+s2/6hnNH/q0rbzS0UNVGw0jzuI4SwjRkIcKq1TinyCcHeM/Bt
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR03MB3378.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68471f5-ca14-489b-decf-08dad776c0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 10:43:46.7872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HR3NFyBxBD6HWx5spULSqyd0dNl17N9CCMWv3hQbvdoM+hOjL9QNGmOi4oGySSEsaDqSrJzPjc7DYR4yOskf9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5517

T24gMjgvMTEvMjAyMiAwODoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEluIGFkZGl0aW9uIEkg
dGhpbmsgaWdub3JpbmcgZmFpbHVyZSAoYW5kLCBhcyBzYWlkIGJ5IEp1bGllbiwgb25seSBiZWNh
dXNlDQo+IG9mIG5vIGJ1ZmlvcmVxIGJlaW5nIHJlZ2lzdGVyZWQpIGlzIChraW5kIG9mIGltcGxp
Y2l0bHkpIHZhbGlkIG9ubHkgZm9yDQo+IGJ1ZmZlcmVkIHJlcXVlc3RzLiBIZW5jZSBJJ20gdW5j
b252aW5jZWQgb2YgdGhlIG5lZWQgb2YgYSBuZXcgYm9vbGVhbg0KPiBmdW5jdGlvbiBwYXJhbWV0
ZXIuIEluc3RlYWQgSSB0aGluayB3ZSBuZWVkIGEgbmV3IElPUkVRX1NUQVRVU18uLi4gdmFsdWUN
Cj4gcmVwcmVzZW50aW5nIHRoZSAibm90IHJlZ2lzdGVyZWQiIGNhc2UuIEFuZCB0aGF0IGNvdWxk
IHRoZW4gYmUgdXNlZCBieQ0KPiBpb3JlcV9icm9hZGNhc3QoKSB0byBza2lwIGluY3JlbWVudGlu
ZyBvZiAiZmFpbGVkIi4NCg0KSSB0aGluayBJIGhhdmUgYmVlbiB0aGlua2luZyBhYm91dCB0aGlz
IHRoZSB3cm9uZyB3YXkuICBNeSB0aGlua2luZyBoYXMNCmJlZW4gdGhhdCBkcm9wcGluZyBhbiB1
cGRhdGUgKGJ1ZmZlcmVkIG9yIG5vdCkgd291bGQgYmUgY29ycmVjdCBvbmx5DQppbiBzcGVjaWFs
IGNhc2VzIHN1Y2ggYXMgdGltZW9mZnNldCwgYW5kIGl0IHdvdWxkIHRoZXJlZm9yZSBnZW5lcmFs
bHkNCmJlIGFuIGVycm9yIGlmIGEgYnVmZmVyZWQgdXBkYXRlIHdhcyBkaXJlY3RlZCB0byBhIGhh
bmRsZXIgdGhhdCBoYWRuJ3QNCnJlZ2lzdGVyZWQgZm9yIGJ1ZmZlcmVkIHVwZGF0ZXMuICBUaGUg
dGhpbmtpbmcgaW4gdGhpcyBwcm9wb3NhbCBzdWdnZXN0cw0KdGhhdCBoYW5kbGVycyBhcmUgZ2Vu
ZXJhbGx5IGZyZWUgdG8gY2hvb3NlIHdoZXRoZXIgb3Igbm90IHRvIGFjY2VwdA0KYnVmZmVyZWQg
dXBkYXRlcy4gIEkgd291bGRuJ3QgaGF2ZSBzdXNwZWN0ZWQgdGhpcywgYnV0IEkgYXNzdW1lIHRo
ZW4NCnRoYXQgdGhpcyBpcyBwZXJmZWN0bHkgcmVhc29uYWJsZSBpbiB0aGUgY29udGV4dCBvZiBY
ZW4gSU8gaGFuZGxpbmcsIHNvDQpJJ2xsIGdvIHdpdGggdGhhdC4NCg0KQmVzdCwNCg0KICAgLS0g
UGVyDQoNCg==

