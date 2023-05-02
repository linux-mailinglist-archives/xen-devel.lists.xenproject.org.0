Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4D6F447B
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528583.821928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpeD-0006m0-OX; Tue, 02 May 2023 13:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528583.821928; Tue, 02 May 2023 13:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpeD-0006jD-Li; Tue, 02 May 2023 13:02:25 +0000
Received: by outflank-mailman (input) for mailman id 528583;
 Tue, 02 May 2023 13:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJpR=AX=citrix.com=prvs=4790f2855=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptpeB-0006j7-Dc
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:02:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 924f5aaf-e8e9-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:02:21 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 09:02:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5910.namprd03.prod.outlook.com (2603:10b6:510:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 13:02:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 13:02:08 +0000
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
X-Inumbo-ID: 924f5aaf-e8e9-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683032541;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MJ3EQEfCQv0MKz4apU7nZmyKA8cw+MX0Adgk9Yd37hU=;
  b=cauv5k62W3DD7EJwjqPC6f0J1u3UjJI/9uu4MRkDQk8EKqIQYdhNH3Kz
   sYw+7HDjdI/aikcJQwIMJk9t92u7bG96zM2qHBgWn30fq+HSPOuYFl11T
   O2GdRlXFs6B/4GCetqlxBeYi79aUycAqfCObYQ9ewLP3soRew4O12NHnq
   c=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 110012958
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fTJgQ6onyDZ4OeuKR6Znnx7yMzFeBmLNZBIvgKrLsJaIsI4StFCzt
 garIBmCaPjcYzShfN52OoXl8UxSv5LdydE2TVFv+y48Hi4Q9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzyNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAA/bgG93ead/JmceuBs19k6A5DHH7pK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKLEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6Yy2QfCmzx75Bs+EmX4n92/gxKCWIgYI
 GsQxzsQsJgN6xn+JjX6d1jiyJKehTYVX9dSGus28gbL1KPQ5wubAUAPSjlcZJots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsUg8t89Tl5oYpgXrnUtdmOL64iJvyAz6Y6
 zKFti8lnJ0IkNUGka68+Dj6bymEo5HISks/4FrRV2f8tgdhPtf9Ocqv9ETR6utGIMCBVF6ds
 XMYms+YqucTEZWKky/LS+IIdF2028u43PTnqQYHN/EcG/6FohZPoag4DOlCGXpU
IronPort-HdrOrdr: A9a23:SRqh6K5UbchOTRt3MgPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:GsyM9G4xLmZaOMAfO9ssxHwUC/5/dlbh51DgKk/pFH9GEZG2cArF
X-Talos-MUID: 9a23:6ElAhgTZQyCLb9FuRXSrunJcEMFhv5itUgcGtpE7qveZBRNvbmI=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="110012958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdvJ2/xy2FrnRNNV1e0isfo+yqma3tE6UiViMjf+Yl34C9XW+QY75mvPzr0dEgK7WmTHgdrGBFZ17llgiJZ2mUxsHvHvWsVkoN1lLaNCPiHHKejfiNQ8ctYtWnndIjqBFPQZsVLtnXaPDF7Gu7Q4cAHHpTzi7Gl9pDEu1m9HgUOFQUXirIbuGaYQyO6ntmdWervTnTYpQL/aUQJV/S+ljUpm87VftsjjuzmdK75GpPbthzbd7QkRPoq39ybMGkXOVxcUj0VflDQhyqlSy1PzaX5r9or7wLXa+uC5j4JHQD2uz4S4JKg4HJmiX3I0M0zM9Kn71qBb4cU6IlQ77dVhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoYYC1NfbPSJoii0IlkINfgKg6sGhzrH7DPoIeM7umk=;
 b=ZOH+s7ZHBUiqfAJz98fb8jAfLxHfFNXWRm95iOpJgtEblOVVYwH+tQ656SxZXxM0XekQPvCa/Q9eHYe1HT/tuUuY+d71kPXVSk+4jCXhKo/UGyHBq59SSMMRYWZfm4/oh7yTlVpfGBJWN5IYYs9xuCvUGYgSW3Nws+iJJti1xj9myHi8pyc2OHvXD5XmYmmtQnC0yVqwsGoJFZaRECykNvgvHHrcCbYUOgle2uda0BAHhlFqjuK4vc2BD0R4REfRY/fji7OS7vGyyFxkARLGjUDVvD+GGZOJyIDUILLVta+6w3m1XRRd0iOnCJOtPLK+N+x0XoLU+1DmcxTpD+macQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoYYC1NfbPSJoii0IlkINfgKg6sGhzrH7DPoIeM7umk=;
 b=nMSWzQJEsWtgWcnrWNDX/6+RagB4AN4xz35D3xFDUrbx2WDQrQJFTrp+zi3wTuQ6ZGpy9UyRbXVDmnoJJdeM09VJcDewEn6yPVSRBBRsjxB57SgThoMPf9+Tan1xqFZ1c9x8S+TALFbYWmenvH8y/soLwD1NJsQf5CNa+Viw6Bc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ad134ec7-cebf-859c-dcc6-55bb0e90f1ea@citrix.com>
Date: Tue, 2 May 2023 14:02:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/3] tools: Use new xc function for some
 xc_domain_getinfo() calls
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
 <20230502111338.16757-3-alejandro.vallejo@cloud.com>
 <6450f182.050a0220.6009b.3ca5@mx.google.com>
In-Reply-To: <6450f182.050a0220.6009b.3ca5@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0667.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdb1618-61f1-4af7-efc7-08db4b0d6f33
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	geco7vsJQSLOKdRCwwEedV3eoi6K06ThRRwec90d7TJpVDbkCAo9hGvIVyDYTC0ENNvh3GzX0gcx+mTAg+RrEi1uHl7JO5FqyijcUjoi6S5Y60ar26gL/EdAzpQWB9HZung1GzS+Anq2JJBK0ZNEGIUG2MqYaqdml12wObCeLfTcR8eC8+H2t63o2Yrhvz4eZzeVFsbibogBh22iM3x3VvKwe88vTPVPAc07XmB7Zwb9/JY+oTA4+yvdl8HOQ/ZFLpkcfq5vhLF4xy4jEPEInsEZIYmy4gkUCq+GzDx6ywwkRk5fnditMbijnxWPyr2mow7wJfwdtHfFjh2mkBwwDo1UGdzedOnnNUiOBYXtSVS7c8QrLZNLPqggXiUhxmnsrNQFyLTbKRWScRYli5EPAU1Lq6R+DwjpYoOWLArbyBVbOURIC77sXHV9XdnODq/PnIlsMQD6DCt231OYy6GjGpy6B2ggT3rBTTQ7IN2gfbVgsODGVOOIQRtW5YKuN/UAU6YL3ZY9BU225or7TaKdbU8cau5pyg4gb6ISzEYZEOJDcev1jGdz4FzGCktgsvpMNPMAzxiw42vAR75pH5mbF7xW7hj1x8rIXWf/QbPnnQ9soAu3K/qOz1dWsyhsypc3iNj0EMTZf1YwPigMjOve5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36756003)(31686004)(2616005)(6486002)(6666004)(4744005)(2906002)(110136005)(478600001)(6512007)(6506007)(26005)(186003)(53546011)(54906003)(316002)(82960400001)(41300700001)(4326008)(66476007)(66556008)(66946007)(5660300002)(86362001)(8936002)(8676002)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk5qU0hIaE5jcmV6WDJsdkhXZ2g3Skh4Qi9wUGxCbHJVS3hEZStNRlZybExt?=
 =?utf-8?B?Umg3OFhuYmgwMk0xUHpZMUh4ampkMzZsSysxMlJTN1lBQTlmc00rTTlOOHJj?=
 =?utf-8?B?bldDck1OR3V3SVNWSC8vZWh6SldleVlkemxxWU5FZXVBd09sYTIzSkh2Q3I1?=
 =?utf-8?B?KzF2cFc3aGdQeXprdDVVT3dzUW8yUllVaTdZS0U4SExTQ0RqbWJHQlRzTFll?=
 =?utf-8?B?cVF0R3Fhc1l5QjRnQytvcndaYVQxdDQyd2pUR3JtSS93Yk42NjJZbTFxTlpm?=
 =?utf-8?B?aUZ2Y3d4MW5RcjQzUDlNV2VaN21LWmdPbnExa2FneVh2MWJHb2Z2cXdWWjMz?=
 =?utf-8?B?L1pMVGdZK25YWTFJaWY3VkIzVVZURDhzVHdFREdidjBUekh0c3NhdEN0bFU3?=
 =?utf-8?B?S3VQV1VjbWp1eGNlV3c3TytaMzFobUlyejZackQ0UFpmVkk2ZEoyMjNLcVk3?=
 =?utf-8?B?ZjRRSE90bENjeXAwWUNSOTVYY1dmd3FEWm9qNVc1V1EvekcyaUloM1pqWVFp?=
 =?utf-8?B?bENMaDB2dEozcGo2Wk5OUlhNTnNUUVhEWmVFUm1idmZLOHJ3MzRzNXdpQXQ0?=
 =?utf-8?B?T3dFd2M2YXV2ZGVWdlV4Y0g4cWlHK0wvUWZZTWlsdWtXVTdraTNBc0JaeDZ3?=
 =?utf-8?B?UlUwVHprSTBnYnFTL1J6bktKM0JEYW5BNXlqdGl3K3pDSXEzcUt0VFZtdUZi?=
 =?utf-8?B?UWZFZUdSSDhCSzRhVXczaGNLNG0rSitsZUlPMUk1WU5SSmpIMzdDcVBCRytZ?=
 =?utf-8?B?SE0xeFdSMTlzY0VreTRkaFFSQjVmUEYzUnB3aFExTTMrNkFMbkk1bTcxaGZn?=
 =?utf-8?B?Z3pJK2RTbkJMd25lNGp4Y2JCaEMyK3dSWmpiS1REYUdRNTBFMUZ2Q2xhSUhC?=
 =?utf-8?B?ZkNVZ3ByekZRMWdidWRaeDBHS2NrMkszOGp2dWJPYVN5K21lUTdRSnozK0hz?=
 =?utf-8?B?SU03VVczV05tUVlFVWloaERkOXNlTXlhKysrNTltekZkVHN3TzIyOGt3MU5p?=
 =?utf-8?B?dlFFODBEOSt2YjZWT1dFT1ROTFhZa0VzTXRwanI5Ujgza1Z3bGRFckErQlRy?=
 =?utf-8?B?K1RvSkx2Tld2WXpiSU1jaldaeG9YNVJUZ3VnbFU2ZnkyQ3VwOVFidnFmMDZK?=
 =?utf-8?B?TlpKVjllcjliMGJ3ZjVLMlNsdUxNTWJVY3lId3VjQm9IN3Vxd3Q4UmhOV2o4?=
 =?utf-8?B?a3RlU2drZytLWEQvMElFNWdwQkxxNkNxTmZPSzYyVHYvbElHZVoyekJsOHVq?=
 =?utf-8?B?TFE3UDFxNzVWMWNFN3N0V3B5a09QUm5ZS0w0OVBCR2ZEY2NycSsxMUdFRTdE?=
 =?utf-8?B?UjRsQ1A0OFZ2S2g5cTVNSHRrZmFNeDhvT2lzTXZ0a2hWYTluS24wTXROWnFt?=
 =?utf-8?B?bVE5L3hqZkE0WEVPWGVpb01Xai9XUzdKelBwdUZieWtBdUMyMDNGQUNlV0dv?=
 =?utf-8?B?RHBwTzhvSDVJTi9KUVJIeVE3ZnZJL28zY2xObWFKeHkxMXpXY2Y0YlFVb1VZ?=
 =?utf-8?B?bkVqV0EyNUVZZnJCYWhDemdKajUzaktPZEhBYXdvRjZGanBkYUZHbWZ5dm1w?=
 =?utf-8?B?Zk02QWh6eUdWT0hvZjFaenNWWkliYmk3a1BjVjJ0STZySlR2MTdxMHBCczY1?=
 =?utf-8?B?VmsvSXBRbFFFeWkxK1Z3NEJWeWxtcmVnZVh3R0lBQ0ZzcVFLQVY5bWZ2Nzdw?=
 =?utf-8?B?OGtrcVlPL1h3Znl6bCtobjVGcm9rVHhZWDJGNlZuV3UvbTcrL1RPNmxuYUEv?=
 =?utf-8?B?RUFGRGdJcU9JUVgrVEZxcncydFl3MnZ1dVduRnNpQkhPZ09MYjg3eWZOaVZM?=
 =?utf-8?B?WEdWT3JsQ09ZL011N0ZQamphUjdQTXVXYzNVUE9UdnZsbXJIdmU0M244c3JJ?=
 =?utf-8?B?V2liTlVyeUVRRnh3cDIrekJSZkxzUmVmYmlwVzdET2ViK1h0clkrODZZNnF6?=
 =?utf-8?B?T3hDK3d1R1ZNYndnVFFta1lUSXprRlRDa3gzdG9aY3BaY3c3dnZScE5SdnAy?=
 =?utf-8?B?dHBuYUFlL0JMSGtOWWcveWdXQmxNWEtObXNreUNzTDFKVHUydURBYXNsVTcx?=
 =?utf-8?B?SHU5bjkwa2NTd0h6WVRDd3JrZjNMLzYxcy92cW1HbnZpU2k3elNRWXFGUUtz?=
 =?utf-8?B?dlpTMnc5dlFmbmJuampHejY3dW1odXdsT0lYcmlNakNBWXh6QisyYlBoOVli?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xZfK6dbcj7T8DNJOCSXMseZmQIoFjiIuAQJpmYXAjWaCOMOsMrV5TM36sIkDtzMPbFFW8mlXpmEq7nmOYLG8lx0U7FuLYrk7LQKN5ItWv5Op2VKBpQ9oorQrdACiXCIOQkm2DoyZO/r0aKADTP4Ihtb2MFJOnYa8CbZZcQlik6K9wQlxAgyzdtPydula16aZcgtCu+d0vpvxCsM/ljqUIMb3OwKj7RJReooiuvzpTy6f9BUO78jwnwa3+dUeVOlejEiakMtgbSr1ka9v5QuBQIeP5llN1MMjqeWPBSch5YstR63RTF+m1A16enmdAPeqarBwNwl4bJcc2SbTWMXKHgeezI9+5N3pY6CHjBKXaEF3c7MqZ/xb2m9rsRWLjC3QuQ6PV0t4adLECdfsuLrhlphMfsqNKBc2L3Je6wCO35rbzZ11HkSDbGv1r0jmb2bOA9P4O0ZUGF153Elq0p1OU2iwYi18jF3y9VHRnJoRKoO5g7svz8/N/TItLvcmO3HGOez6EiNHVNfXVpRSAYq3DrgPWCI8FSTFagjRhkP7DaU1ma/+0O0fzEo4Z5kGLd6xVcRYK//lKIPThrBH1oqSbxEdAIn2bCY/2V3jz6j07toGZaOF6nEiIa8d+d2WuSRrJY6SBR1JhVn6sAu8AuFldaGO3DgrPq+qlTvWqamIFvoSeKjj4kDFxqBwHASdDa0cbtUueIoW/AjvPy5JhXRkoF3pobw7AxHLj1t+mz95/H+E7unm28P1IS/TnINO+74yXIl4ZRDnE0M/VE4IrE/EA0vv+swvVLVtLVQaggjXJj7qO4a3eeYAGhWxH59Ij0ZsqGu+vle6+6d+NmHYg99BX0nlOgYwhW3iDKelgFYcYw4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdb1618-61f1-4af7-efc7-08db4b0d6f33
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:02:07.8685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihLPt+lY4UHNfK/L0uConxJSUceYgoPSg813WrdkE0pD8JZ32+cxTnQPleNgyGkUhjaHhcLmxdTWwFZ7lkYw3MdxjQsyB/LKR4ol3iSOZD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5910

On 02/05/2023 12:18 pm, Alejandro Vallejo wrote:
> On Tue, May 02, 2023 at 12:13:37PM +0100, Alejandro Vallejo wrote:
>> Move calls that require a information about a single precisely identified
>> domain to the new xc_domain_getinfo_single().
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> ---
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: Wei Liu <wl@xen.org>
>> Cc: Anthony PERARD <anthony.perard@citrix.com>
>> Cc: Tim Deegan <tim@xen.org>
>> Cc: George Dunlap <george.dunlap@citrix.com>
>> Cc: Juergen Gross <jgross@suse.com>
>>
>> v3:
>>  * Stylistic changes that fell under the cracks on v2
>>  * Reinserted -errno convention from v1 that had been
>>    removed in v2
> Mistake here. It's _NOT_ supposed to have that "Reviewed-by"

Nevertheless, v3 now looks good.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

