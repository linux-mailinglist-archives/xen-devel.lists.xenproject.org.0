Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383FF5B38AF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 15:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404323.646761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdny-0002CP-6D; Fri, 09 Sep 2022 13:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404323.646761; Fri, 09 Sep 2022 13:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdny-00029T-34; Fri, 09 Sep 2022 13:12:22 +0000
Received: by outflank-mailman (input) for mailman id 404323;
 Fri, 09 Sep 2022 13:12:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u2oc=ZM=citrix.com=prvs=2449aa9c6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oWdnw-00029N-Eg
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 13:12:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06218686-3041-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 15:12:17 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Sep 2022 09:12:07 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by PH0PR03MB6621.namprd03.prod.outlook.com (2603:10b6:510:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 13:12:03 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::10e9:90f9:f545:ab95]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::10e9:90f9:f545:ab95%4]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 13:12:03 +0000
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
X-Inumbo-ID: 06218686-3041-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662729137;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9pojS8yM7yUoBtHmyd/FsjiEW8m7TUr4KatlgIq2TBA=;
  b=QkAfX9TCvAlyC9oTj5wZnKhuuwHKCZ7B4KhL8oqDsW4zbYvfzd9cE1m1
   XXqhLCAL4yfGLj7bQp8Vz1mV7ILUIOqXBDZ9H24T8OWbteJEeUG6lSSv6
   bGVxrEornM5M3Ej/C7MGvPIajiJtSz7LFixZJ3U1GJ58QZcv9bCeHgw35
   o=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 79841761
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:n27Ie6JnfXNrPXAPFE+RPZQlxSXFcZb7ZxGr2PjKsXjdYENS0zUHx
 mUXXj2HMq2LazPzKNB2Ydiy80oB6MfQmIVmSQNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/Pb+Us11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE7OdTIHAPJdYkyNlcLXBi7
 fEoDwEKcUXW7w626OrTpuhEoO0GdZOuEKZB/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H11z+mLGcwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPOmWbcrSz17gPJtS+8B94dSvqKzNhnmUGKlnQaOQAMU1Tu9JFVjWb7AbqzM
 Xc8+CU0qrMp3Fe2VdS7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebRwn0
 EWY2ezgAzNHuaeQD3ma89+8sjeaKSUTa2gYakcsTwEI/t3iq4EblQ/UQ5BoF6vdpt/oHTD9x
 RiaoS54gK8c5eYQzLmy913DhzOqp7DKQxQz6wGRWXiqhj6Vf6agbo2srFTes/BJKd/DSkHb5
 Sde3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxezC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:Wpq7i6jWGc1bubUUyMqz0gkC6nBQXioji2hC6mlwRA09TyX5ra
 2TdZUgpHjJYVMqMk3I9uruBEDtex3hHNtOkOos1NSZLW3bUQmTTL2KhLGKq1Hd8m/Fh4xgPM
 9bGJSWY+eAaGSS4/ya3OG5eexQvOVu8sqT9JjjJ6EGd3AVV0lihT0JezpyCidNNW977QJSLu
 vn2iJAzQDQAEg/X4CAKVQuefPMnNHPnIKOW296O/Z2gDP+9Q9B8dTBYmOl4is=
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="79841761"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncDpSqe8kViO1ZtpHeCXDqRZoogrvWMiXYXhXxJeVNEetGe1dJXR+JWOh6qHfZUJCpw+NlIodUg2tT4UymI0eixr/f9Tl7d5M5lBfGIjBMsJjz0gYfBTO7b+pd00KmjB6tW7ZrcYhxXy7QudpHZpLTqBSUpOqRfgxifPWPIXFDMU+K5M/aqu+fPapui6BozZYzSV7xZxsFQEHWYPxI5pWucinVB02hXlqi2u4RekNczPhTF0eI3LS+AwnN874vjwKKd14rORlTnYmBG1/S/vPEqHptj5kfjvygTZt7HP3CanRtMbhOc3PPuOfWZ/ElTeyXLSz8+MZ6rvZdXdxuxdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pojS8yM7yUoBtHmyd/FsjiEW8m7TUr4KatlgIq2TBA=;
 b=a3HazMSgOGIcm5RBK9x/Qkpbn81aZ6VRzkenInmDIAdIhUMntcAf6yf3u/T9fwROOiCZj98ihxFEWLCC6w2oal/N07G4qg4+9CwRoCM/jJPrNYmIXise0d+fSLK3TO7bN/SvsqIFWBf5ZwG+1qYvLiFCq5u20aa6ybg9IiUlwaV4ui85uey28UGuY4c8CuRFgfXTA84//t2c73otIUXuiKAQCbKGF2CI0ewKHbzzxYt5uYKGYgMQUdQr6SQy0xS/S+kVklkBDGmJiEyvrpHrJj6mI592ww7nR8MzWLJak4SGZ176TqUWvmg1+yNhlBVHzpR+Bdt9dQcHQKVoPxEGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pojS8yM7yUoBtHmyd/FsjiEW8m7TUr4KatlgIq2TBA=;
 b=JNIxSheVh3k4lwrYXLPJhWC7NdDJCQXfG75DoynXOIM3szO+pssRmjHwp097H14qbeQYbttx3ea9zKZKoI652XL1rFYwiDWa3aIiDl8RD4M9i8rDcDcaFR8btWE912+w3CUp0W1vaMJhnQkiDvetxteHrQrFc7ZxuPyGGOE2zlQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] xen/gnttab: fix gnttab_acquire_resource()
Thread-Topic: [PATCH v3] xen/gnttab: fix gnttab_acquire_resource()
Thread-Index: AQHYxEs6aZ5V4BIu+E2gLbKrqRKb7K3XEukA
Date: Fri, 9 Sep 2022 13:12:03 +0000
Message-ID: <903fe035-73ae-72cd-f721-1b418295a7c4@citrix.com>
References: <20220909125347.25734-1-jgross@suse.com>
In-Reply-To: <20220909125347.25734-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|PH0PR03MB6621:EE_
x-ms-office365-filtering-correlation-id: cbecc604-bda4-4736-aa9d-08da9264e311
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aoo2RfGVgAUEGCbKZL3Ks7ZUqU54K0JxnEe8nBk2vVKnVyiLGEJKqjlm08UgnccMNXWX/+pxzbOST/O1St6pXa7ToupWvgWrbcpI3idZp3eDgh5AeRwUZaAJe6UpyNOcfXVOg8uUGcumz+Jyjmy08AR/Lc/hupbNEgN4sdpadzAXffRwch39w3d5E/aM7ghNjbmffzpaAE//r/HtrSstVRBJrxGcVNKiswCjx/d70NcFY4Rt+HGMzEvQo7gg0kOh+rCt4lnyBCTIDiEHLV9Us83R9XnR9KpbkMpshkRNdd2vnrpwjQQDsL4FuupjgkxeQPMg9rLpuX5qR97ijAN1/lZB8DGvegvscCIQ/HyO+3wrB88U2TMF6v+b2/tS025asDLmjOResipgElUXCDalZ/8EqiT7OB0E+pqEhys3PAbE1GTLyRIfOXIZE66Wuh4eCSgVr7nqwI9RO4OCUb4Sw5YrJM7qGIF+LHupTtXaO8GQyMW70/GsWkYxmK2NaPN7rsqNiz+AeKa8m+wDj1tm6xuPHojYDFOdlknPQF43OYpTCAEVxHdfXHWPFLajQrDuhLmJpcS5dWR7VdaCATCwala4ugQIUo0+hks529CsLRB4ny1GKSryZ6oXFXCrRhfJQTgiUev2ELqZYq41HwXOmWc7Do0kjN6FAiO2cxlLqM3zQIknZ4wy6t9HBdaPDR2319XMS/HrKF5qq/ZBlBZEWfW+r/7JBdojRCwOQSUxDRbeecWH4Z0YF4yyyHa8/hBwGT7V9EPpeFAzL6HTtLlqXClrAnR6KlRA+BlJwyRXLCIIwyGhCdHZO+hG+8103oy7bDCkX3uih0sZwiOULrQaPQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(8936002)(478600001)(41300700001)(2616005)(2906002)(26005)(6512007)(31696002)(38100700002)(5660300002)(82960400001)(53546011)(122000001)(38070700005)(8676002)(6506007)(186003)(54906003)(86362001)(66556008)(76116006)(66446008)(4326008)(83380400001)(66476007)(64756008)(71200400001)(110136005)(66946007)(91956017)(316002)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2VyVFMrWVlib2tXWjBZTG1UMXltS1NqY0VWaWlNVlM5TkJLb0Jma1FFTTRD?=
 =?utf-8?B?c1VSWFdjT0pNSEV3RzgwdHBUUW5YdVZmSmdJTU42WStmaTBqZC9uVW03YTd4?=
 =?utf-8?B?Z05tUXRFbHFSSEVKcmpadmdMWTRaS1puM2VtS0pCSVJWb1NBRUlDR2F1ZzRy?=
 =?utf-8?B?T2o3eldwZVRuWEVXa3NxcWdBcWROSHZoN1puWmFaK2xnN1ZmMDV2R2x1VHp5?=
 =?utf-8?B?ZWovNUMraVlFUE5BQ3poSjFiUEZZM3FOQmdGQkdXWGp5NnVUNDRZWWplRVBm?=
 =?utf-8?B?UUhGWW1qd3BEWnlqZ29EQWRva2puMGovR1YzWnJJRzA1SHpqblhhWHgxNS91?=
 =?utf-8?B?eEtjSWt1MXMrQ1daSklpSENXdVJGeU80WkxwVXRBTkpNc0J6VmtLZDc5eHNQ?=
 =?utf-8?B?Vk9IL3Y4QmFjWjRUUWtmTUl3OTYwd0FXM2MrQTVtTGJmWkZZbUd3N1hBOERS?=
 =?utf-8?B?Tk1YWHA0Ky9PMnN6RGYxRWZnbFVmQmtnMG1pbFRBTG0yN1pmZEdLZTg3YkRO?=
 =?utf-8?B?Yi8vdmoyQmsralhIdVpjcTk5aDdUUC9nTkd6dzVnSkgvTXd3d0JMVTRTOEgx?=
 =?utf-8?B?cnZzVkQvaHVNczk1TWNNaW9LY3Z3dnVuVEJiSlpzaDFmb2xFbUEzTUdJenVZ?=
 =?utf-8?B?NGFmNjVEVEwyK2ZQY0o3NCtHL0xxZm5rcTZVTlRNZlF3QlIrZC82cHc5eGtW?=
 =?utf-8?B?UEhXZTFrd3lkU05aQ3FrWTEwNi9YdTBjS2Nob0tJeGhCTjc2c084cXhaZGFN?=
 =?utf-8?B?UTRFNWxPOExiNjkxZGJXNllmYnQ4SFVtL20yb1hRdnYrSkhaenB1SFozL3N4?=
 =?utf-8?B?UFc1cGVFbHQraVB3R29OQXlJL3BrMXIxdHMvelFVZUJudWdTSFZuaGNtbzZO?=
 =?utf-8?B?Zy84M1l6VzVMNHRhOWsxcERCSzFTZWJ4WEhtRkN6WlIvWGU1OGxad3pjQVJl?=
 =?utf-8?B?MTBPZ1pUVFdONjJpdnJzZ2l3bUZ2UHcxRDlGZTNzcFhKbnFMMDhXdXhYK3hi?=
 =?utf-8?B?cGtsUDhSWkJtRnNVbjlCK0Y4eGxNTkFKMG5BNjV2OENUSlJUc0lGOVJHU29h?=
 =?utf-8?B?SlBvVk1OZnJHOUFPQldTS2FIMjhsYmQwRjR0RFFOTmpCUHVaNzFSYjZiYTBI?=
 =?utf-8?B?L0sxSGxFVVo0VFVmeGZ2clZnMGVOamFUWEY4d0RVdHVuZ2J1eERFUlNWcXRT?=
 =?utf-8?B?U0RJK1ZOdDV1WERKNTJMMk9FdHdzRFU0dEIvVDRtNXA0TTdhY0pxV0FEOFhB?=
 =?utf-8?B?QUVTMzNOeE5VTXRTdlpDTEh5dWVmc1pzcEtKaXFaSmFDUXJNWElSKzliUTNq?=
 =?utf-8?B?UURDMlRiZXpGOHlzYk1zd0dZajgvZTREcVkrbGQ4Q2p2elZEYW9KdzFRUFhL?=
 =?utf-8?B?SlU0Q2ZneFNDb1hrZ0w2R3hrdU9NM3lCczArczY3NDh2MDVQN1FUZmNFVkFN?=
 =?utf-8?B?ZXpTZ29DY3BwUkI5dm5JbmZwdDhRcHNhNkhUT0JDTlhCdThkN01Gc0hMS3po?=
 =?utf-8?B?YkhtNmVETEhtZWlaOSthQ1ExbUVWK1NuVG5nTmNYLzdFRUpNZU9Ld29zR1VS?=
 =?utf-8?B?aEFHM1NzaWFEcW9nNXNtbHNadk1xVkdxcTlmakNJdmRhUTVWTk5ud01tSEVW?=
 =?utf-8?B?c3huMTFBc2htTGwzNUpTN1gzUEt3Y09nV1lzYmJFUTg0UFdVVHJvdUUzL0hU?=
 =?utf-8?B?N01IZzdXV0J5b0dOalBpWHpNU2x1MzVGQkFoMlVSTFdWYzhiK2dTRHJCRGJE?=
 =?utf-8?B?VGx2Vi91dzdoRWNmWXlGV25tOUJ2a3I5a3RzenEvV3BJcTBTaGlDY2JMK0Zu?=
 =?utf-8?B?bHhsRkZucEZ2Ymc3V0lpVEN4V0JtMFZqSEVvNnNPbndkSHBoaDZobEtSaTVp?=
 =?utf-8?B?S3I4c1NqbGJzNUpiQ1g0TVRoUWJhQTVrbjJCQUx4RUdLcUMrdHFuQ1BISFFm?=
 =?utf-8?B?WGhBV1hsdk05NVU1eTlSSU9LZ25yUUdMbjBLYUovaHY0SWFvVWVmU3pVdUxq?=
 =?utf-8?B?dWFmdFp3SldzQXFidndwd2grOEhCQWdQeGJMVzQzZjBpRG1NVzB3bko2c1JE?=
 =?utf-8?B?Vko3RHphRDEvTDFCTTc0bHBLcGVhZFJuQlM5RTFkT3FjZjVOa0h3L3hzQXVW?=
 =?utf-8?Q?GsSMMu8WMmwNCNvY0vP/3XH1j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9765946058C7C042BBC97CC8961DB58A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbecc604-bda4-4736-aa9d-08da9264e311
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 13:12:03.0160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KApBQ6/EvApmlh+yULIaC4sVdrARP+78F5Pa5E4otuA8xwOHxUV16wpTLSdKwnmTfLJwLkhIpMeaJMeOcDEbD5wTC0yC+qV7H+OYIiaE9sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6621

T24gMDkvMDkvMjAyMiAxMzo1MywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQ29tbWl0IDlkYzQ2
Mzg2ZDg5ZCAoImdudHRhYjogd29yayBhcm91bmQgIm1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQi
DQo+IHdhcm5pbmciKSB3YXMgd3JvbmcsIGFzIHZhZGRycyBjYW4gbGVnaXRpbWF0ZWx5IGJlIE5V
TEwgaW4gY2FzZQ0KPiBYRU5NRU1fcmVzb3VyY2VfZ3JhbnRfdGFibGVfaWRfc3RhdHVzIHdhcyBz
cGVjaWZpZWQgZm9yIGEgZ3JhbnQgdGFibGUNCj4gdjEuIFRoaXMgd291bGQgcmVzdWx0IGluIGNy
YXNoZXMgaW4gZGVidWcgYnVpbGRzIGR1ZSB0bw0KPiBBU1NFUlRfVU5SRUFDSEFCTEUoKSB0cmln
Z2VyaW5nLg0KPg0KPiBDaGVjayB2YWRkcnMgb25seSB0byBiZSBOVUxMIGluIHRoZSByYyA9PSAw
IGNhc2UuDQo+DQo+IEV4cGFuZCB0aGUgdGVzdHMgaW4gdG9vbHMvdGVzdHMvcmVzb3VyY2UgdG8g
dmVyaWZ5IHRoYXQgdXNpbmcNCj4gWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlX2lkX3N0YXR1
cyBvbiBhIFYxIGdyYW50IHRhYmxlIHdpbGwgcmVzdWx0DQo+IGluIEVJTlZBTC4NCj4NCj4gRml4
ZXM6IDlkYzQ2Mzg2ZDg5ZCAoImdudHRhYjogd29yayBhcm91bmQgIm1heSBiZSB1c2VkIHVuaW5p
dGlhbGl6ZWQiIHdhcm5pbmciKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+ICMgeGVuDQo+IFJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJt
LmNvbT4NCj4gLS0tDQo+IFYyOg0KPiAtIHJld29yayAoSmFuIEJldWxpY2gsIEp1bGllbiBHcmFs
bCkNCj4gVjM6DQo+IC0gYWRkZWQgdGVzdCBzdXBwb3J0IChBbmRyZXcgQ29vcGVyKQ0KPiAtLS0N
Cj4gIHRvb2xzL3Rlc3RzL3Jlc291cmNlL3Rlc3QtcmVzb3VyY2UuYyB8IDExICsrKysrKysrKysr
DQo+ICB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgICAgICAgfCAgMiArLQ0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS90b29scy90ZXN0cy9yZXNvdXJjZS90ZXN0LXJlc291cmNlLmMgYi90b29scy90ZXN0
cy9yZXNvdXJjZS90ZXN0LXJlc291cmNlLmMNCj4gaW5kZXggMTg5MzUzZWJjYi4uNzFhODFmMjA3
ZSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvdGVzdHMvcmVzb3VyY2UvdGVzdC1yZXNvdXJjZS5jDQo+
ICsrKyBiL3Rvb2xzL3Rlc3RzL3Jlc291cmNlL3Rlc3QtcmVzb3VyY2UuYw0KPiBAQCAtMTA2LDYg
KzEwNiwxNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2dudHRhYih1aW50MzJfdCBkb21pZCwgdW5zaWdu
ZWQgaW50IG5yX2ZyYW1lcywNCj4gICAgICBpZiAoIHJjICkNCj4gICAgICAgICAgcmV0dXJuIGZh
aWwoIiAgICBGYWlsOiBVbm1hcCBncmFudCB0YWJsZSAlZCAtICVzXG4iLA0KPiAgICAgICAgICAg
ICAgICAgICAgICBlcnJubywgc3RyZXJyb3IoZXJybm8pKTsNCj4gKw0KPiArICAgIC8qIFZlcmlm
eSB0aGF0IHRoZSBhdHRlbXB0IHRvIG1hcCB0aGUgc3RhdHVzIGZyYW1lcyBpcyBmYWlsaW5nIGZv
ciBWMS4gKi8NCj4gKyAgICByZXMgPSB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSgNCj4g
KyAgICAgICAgZmgsIGRvbWlkLCBYRU5NRU1fcmVzb3VyY2VfZ3JhbnRfdGFibGUsDQo+ICsgICAg
ICAgIFhFTk1FTV9yZXNvdXJjZV9ncmFudF90YWJsZV9pZF9zdGF0dXMsIDAsIDEsDQo+ICsgICAg
ICAgICh2b2lkICoqKSZnbnR0YWIsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsIDApOw0KPiArICAg
IGlmICggcmVzIHx8IGVycm5vICE9IEVJTlZBTCApDQo+ICsgICAgICAgIGZhaWwoIiAgICBGYWls
OiBNYXAgc3RhdHVzIG5vdCBmYWlsaW5nIHdpdGggRUlOVkFMICVkIC0gJXNcbiIsDQo+ICsgICAg
ICAgICAgICAgcmVzID8gMCA6IGVycm5vLCByZXMgPyAibm8gZXJyb3IiIDogc3RyZXJyb3IoZXJy
bm8pKTsNCg0KSSdkIHJlY29tbWVuZCBub3QgY2hlY2tpbmcgZm9yIEVJTlZBTCBzcGVjaWZpY2Fs
bHkuwqAgVGhpcyBoYXMgYml0dGVuIFhURg0KaW4gdGhlIHBhc3Qgd2hlbiBYU0FzIGhhdmUgY2F1
c2VkIG9uZSBlcnJvciB0byB0dXJuIGludG8gYW5vdGhlciwgYW5kDQpwbGVudHkgb2YgaHlwZXJj
YWxscyBoYXZlIGV4YWN0IGVycm5vcyB3aGljaCBjaGFuZ2UgZGVwZW5kaW5nIG9uIGhvdyBYZW4N
CmlzIGNvbXBpbGVkLg0KDQpJJ2QgZ28gd2l0aCB0aGUgbW9yZSBzaW1wbGU6DQoNCmlmICggcmVz
ICkNCnsNCsKgwqDCoCBmYWlsKCLCoMKgwqAgRmFpbDogTWFuYWdlZCB0byBtYXAgZ250dGFiIHYy
IHN0YXR1cyBmcmFtZXMgaW4gdjEgbW9kZVxuIik7DQrCoMKgwqAgeGVuZm9yZWlnbm1lbW9yeV91
bm1hcF9yZXNvdXJjZShmaCwgcmVzKTsNCn0NCg0KRXZlcnl0aGluZyBlbHNlIGxvb2tzIGZpbmUs
IHNvIEknbSBoYXBweSB0byBmaXggdGhpcyB1cCBvbiBjb21taXQuDQoNCn5BbmRyZXcNCg==

