Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE5C58FD1C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 15:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384585.619989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM7yK-0004MP-KO; Thu, 11 Aug 2022 13:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384585.619989; Thu, 11 Aug 2022 13:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM7yK-0004Jr-HN; Thu, 11 Aug 2022 13:11:36 +0000
Received: by outflank-mailman (input) for mailman id 384585;
 Thu, 11 Aug 2022 13:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM7yI-0004Jl-EK
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 13:11:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd154ff-1977-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 15:11:32 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 09:11:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5838.namprd03.prod.outlook.com (2603:10b6:a03:2de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 13:11:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 13:11:26 +0000
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
X-Inumbo-ID: 1dd154ff-1977-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660223492;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3xT856k0rdH+tUJBB9brTD1j+Tkm4Ehs0B5LW2Y9Cmo=;
  b=gZRjwc57/24xeJDzjYTeVJSOFqbUjRqOPz2GeKTtwPRYsdMm8fLxsleI
   M+KiRRV4hOA4B2gn1yerzFOTcGYZOY/yqkCdHXLUyKVrRf2DfYOPR2SlI
   2KU6nmwQOFRjfO6EwUBuWcA/6OB6Drap+Y4jUVRfdf+tMpAePLoyXxfMA
   o=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 77111332
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pLrUAaMISZl58tDvrR2TlsFynXyQoLVcMsEvi/4bfWQNrUorgWNTn
 GBMDW6PM/iIMDD0fdt/btjl/U8H68XTyIAxGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/va8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPKxe9ONkUUI7cB0aV6WWRA3
 8EBOAokO0Xra+KemNpXS8FKr+F6dYzHGd1avXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr3wCCgLlW0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4PGkGPeqSjEaunnnjzDWo4iFOSB69VtjgK0y0UBJjRKfA7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQy3
 0KNt8PkA3poqrL9YUiU9qqQ6wizPycVBWYYYGkPSg5t3jX4iIQ6jxaKQtM9Fqew14TxAWupn
 G3MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:qtt4hK2ZlV9GkwJQFat9nAqjBc5xeYIsimQD101hICG9Lfb5qy
 n+ppUmPEHP5gr5AEtQ5exoS5PwPk80lKQFrLX5Uo3SJDUO1FHYSb2KqLGSvgEIFheUygc/79
 YtT0EdMqyKMbESt6+TimTVfKdCsbu6GeKT9J3jJh9WPEdXgspbnmBE43OgYzRLrX59dPwE/f
 Snl656jgvlVFEvKv6wDn4DU+WrnayaqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+qemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0a+SARcR4Z
 jxSiUbTodOAkDqDyOISNzWqkzdOQMVmj/fIJmj8D/eSILCNXUH4oF69Pxkm1PimjsdVZdHof
 t2N6jwjesOMfsC9B6NvOQhLXtR5xeJSSFJq59Os5QaOrFuOYO4aOQkjRlo+FNpJlOk1GjheN
 MeUv00rcwmAW+yfjTXuHJiz8erWWl2FhCaQlIassjQyDROmmtlpnFojPD3s01wgq7VcaM0rt
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzaVwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmL0IdQ+h7ATW2hVXDmy91Y5ZJ+prrgLYCbehGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/0FYNAz2TFKu5vwLklIbkoU/oAKiCzS5jwW/7XX8TgAYPuGIY=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77111332"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ/wjh9CO+A2afr6+qDDAPHiTV6/7xP8bpWTtZKP3IaGmNgjcxVIlYHN8BxSulUXVM7lEQWD+YNvL+ilULXY4OFD7l3fTqRTT35NLbgve+tR9me7iCCZTDn8Fw7CbWVU8YprFZ1X+bLPj/Xy7xRILe/C793GZDIPNSBmvfyXHagJvNeLLxU8TpR26e1U2b0WHio5BqRszJKtqHEEeR80bsC7QfNjq57K+bzPST7EjHmj8gnh/bzpmfhZkMywYL0ykAx/xv6RZu59GF/UvlEKiKwtZpnkTHctABscB75ZMWDiklby+VjBJu7lg5slyOUHRpDM6LjIH1f3dMMjJTP4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xT856k0rdH+tUJBB9brTD1j+Tkm4Ehs0B5LW2Y9Cmo=;
 b=ofwS1JQBUOq4RHBg0qrg15HPaxYOo2otaejvxb0PFhf5seLuMsMUzZhypy1PwogrdlGZd1M3UyHZ1DphCQh82a2Kg4H06++Jb8eFhqejNrR2ioE6cI9WL3lzkmcbdaVQodVS7FVK1SIBPCreMYy1eHtFKSmJ1QaPe4NRsuUCenfIFBDHV/DzCOJdT3bZEG1eVnqa+/MQigHIPGQfprqtA6EmQc9GZYzcVOSVVr99PHcjEXJl8Iv5fq9uLq5dsaHjRE8cGpOmqIK+1EfHzd5SkSGcwTNNTSmTA6NhNfYjmVjLscgbPN+CVq6a77Uj8/2lWtXhj1yeOCOlWmDXbm4BHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xT856k0rdH+tUJBB9brTD1j+Tkm4Ehs0B5LW2Y9Cmo=;
 b=ZzSbw9WcACz38gCW3yV8hUmcR3JdeuTChIHp4E5JD3JhJesBjmTRguGvwdmQWbCqTyLDUXYW4OG7wJCk09229Who4f8A8DWKnC5d0IGuFYOV3fdTNXgXiAJcscxEQOyPVLXnPW8qFngBu4YEUpJIZ6SSSzFegHRpxWi66SLqYvM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Rahul
 Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v2 1/3] PCI: simplify (and thus correct)
 pci_get_pdev{,_by_domain}()
Thread-Topic: [PATCH v2 1/3] PCI: simplify (and thus correct)
 pci_get_pdev{,_by_domain}()
Thread-Index: AQHYrXBZXwmbEINJNkq3LaRWDdsBqK2prNgA
Date: Thu, 11 Aug 2022 13:11:26 +0000
Message-ID: <45cf7907-3ff3-49bd-e700-4333c0e45177@citrix.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
 <ad2d9405-9712-79bd-16d7-666ce79bcb3c@suse.com>
In-Reply-To: <ad2d9405-9712-79bd-16d7-666ce79bcb3c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3a17338-2792-4b21-6102-08da7b9aff4b
x-ms-traffictypediagnostic: SJ0PR03MB5838:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NTiSCap6SJXJ54iT/WDRNuRU7kkrbSAMKFBQEnFwotFXWj16DIVAvtSFwXXCFt4mkedldvhrzlkXvYmNej/DvOgLtFMe7PzWiQ8V+pl7VsNdItSIF3kt+dqsBEXXo+/p3IIh5FaEfj4uLelpt1zNbIxpcfZsiZa1BtYesd7bFVPZc261bTYIbsegxJFXPul94LwQpYHbUb38AaQvwfT9hTpTHd1UKBKqVUI+/ELBlGuyiqzEcxnyHApKo9qUghOxo7u0zxGaTR+Jc5Z9vuf8yoMQVNUlTLJfUozYYGSUj7CC64IqyedpOZGGXq6Dv8LmezxkbcwvrRYNTAZ7fh2HvsuS9m2kk6RdS2uxfQxl0J1K3JLJu9ps0G14YWRvNLeXKAFAR8b5Gp5aC77izFvgUgw/Y8C7cvT03XETUjoXQk+ZrMYZImHFxwdZDW2yaC89TgxoiOvY0vUAgBAlGuxoqAlUlbWo0IRiHcYuhT5/5sVvtXV9/v4lRmVbQah/QF3bcrShO1ITqAzXahhBD4JsIDqAds1SJQ3QH4VtvyJBntVGqSm4bRaAoHMi2OoE2Woxm+a8aR1UfVAMr7qojws9xVKWEzBZ2P9O0WKdvkIw1CpErWLtIFTdMw+1nFmL/B0x+yhiBtl9++1sVci+cKr/NBtMqmiaSImGvNmYOu9ZpRcC9CSW1HvdM+KWhjTfSsyXcCqk2tk0AlPKumS7ZdtguaaNaRG2CqJLeRKExRED8NvUg5gLeKPPTYh0yvTQgQr2tBH7+npTbFBPac1zrfFZJO2zk5Vr8yYTiiU5RimeZjG0VYWrbTB9E1lWr4L6YA6ZaPC8ctDVa3ye2LPaBHY23XIh8p1oeCwW9dWaDXlZTRNr8CYAECuWvrR+8oTMoTgI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(38100700002)(316002)(64756008)(4326008)(8676002)(478600001)(83380400001)(36756003)(110136005)(31686004)(66446008)(76116006)(91956017)(66946007)(66556008)(54906003)(6486002)(2906002)(26005)(31696002)(86362001)(5660300002)(8936002)(6512007)(6506007)(41300700001)(71200400001)(66476007)(82960400001)(38070700005)(2616005)(122000001)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWNqN2ZtbXBEbVJDNThWYkZBZVBUeWJnUGR6dDFZRlR5VkxSNThweWFSUnUz?=
 =?utf-8?B?K3V5SFduc3lDcitXcHpoVFU5TmNQNTJnL0xoQTdNZGZWWU03SXJNT3lUY01K?=
 =?utf-8?B?YlVRQ1I4TjJNNk1HdTU4bS96VVdOaGNSRFN4M0hoZEpEU002Y3JZeE1jSWh1?=
 =?utf-8?B?TEZ0YjB2dkpkZjJpTUVuaHpzUXFlZnVnOEREVWszMjlRMi9hbG5aYVJ4S0pH?=
 =?utf-8?B?aUV1WEV4R0YzekUxNCtwYjJTTE1vek91MCtKZnJUS0pTNXVOcENaZWNLc3B2?=
 =?utf-8?B?MWtIdWdDVS9JS3ZVZkhBazhBK1MwWTliSzhzUW1CVi9KbFU1Mmxob3lPZXVN?=
 =?utf-8?B?MzVvZ2pLM0tub1VFSGVXTTBaMG5UekdHalBleCtlYmNEbDVLeWwxTzdjUnN2?=
 =?utf-8?B?TTdXdktEQnVPYzVScHU1UWQ0eDJPUkdaNEswWEo1TG5zTmhaUXFEZ09hRk9T?=
 =?utf-8?B?VER5bzZYMzZ5U0xiV0h4elNVaUR5dzJoWURLcnJldUpOM3JEVU1DeUxVTkti?=
 =?utf-8?B?N3hHK2RrWGptMUp2NjVPVGtRMkF2VnBiT1NGa0o5d3RxdnNRblRzS3ZvS0Zn?=
 =?utf-8?B?WmtEQkJIUTBYWXU0Y2hVTERVazRGMm9Cb3pOL0JQeGdVanZFR0dUZ3p0UmFE?=
 =?utf-8?B?dnB0eTRlZ1JybWVxQ1ZMRitWRWlSS2pQWkJzdHNUU0tESmI5cUtTSUs4d2Vy?=
 =?utf-8?B?R2twZHo1TmxvTXlJMVRSbkI2UW1ZR1hCdjR5TWxuQUdrYlRrNVVuSzJJUUEy?=
 =?utf-8?B?eFBwUUlrREVlM1daMnRvdXpBdG8rY3JPUlZIVlJSTGZyM0NrdERrcDJYLzNn?=
 =?utf-8?B?WElaWVcxaFdLRnFWTGVPK2taUjFXdTE0Q2JnK2xsTjdwNUlRaklJRENMSVFW?=
 =?utf-8?B?MzhIUWlVTkRZMHZBM1lCMkpHeTVVUU8reWhaN2hVeUhqWVZSOXk3NDI4T1JW?=
 =?utf-8?B?c2IxUkIxb3h5UElyNStZc1EwdVlsTVMwN3N1M3llZEY5cVNHR3Q4YU1pL0Ex?=
 =?utf-8?B?aVI5RU1kMTZKeStOby9FSnRRdkdKZjNDbWlZbUhEaGFCNDBGS3VodGN3dFJM?=
 =?utf-8?B?RWVBN00wZy9VQXRlcDNMNmRsME9yamlhaDU2TjIySWY5UWgwRlM4VXBROCtJ?=
 =?utf-8?B?Z2luOVRmU1lpZFdrb2x1dUlhRVNkWXl6VW5oM2tFWktQZmhUM2p2M0lXRXJN?=
 =?utf-8?B?R3V3N2JLeEEvaFVDS2ZvMHJ6MzF0RnF5WUVxWTRRQzFvb1lnQ2NzaHA3b2E1?=
 =?utf-8?B?c2NFWkwyT1Zlek9DWXRnRWMwQkF3T2dxcXR5MWxGcmlDMnI0d3VQZnpRM29h?=
 =?utf-8?B?ZXdMYVpIZmpqRVBITzMra2xDbDhUTGU1eWFEWUQ4VDVGSC9Ha21WMmRyajNT?=
 =?utf-8?B?YVFNdzJ2RE1EY1dEbDZyMWhqWTczNkRkRWp6U2NJdTJaNXRzVGpGMkJSWWdK?=
 =?utf-8?B?b3g3QS9hRXVkYkFEQS83dHYyVlB0YUg1WThqT0hvNkxlUU9sV3NCRm9yUUYx?=
 =?utf-8?B?dlV4VmMvL2tCWnRlTEY3MnlrTG1lZXNZRjR4UXJwamIwZWNhUUUzSzlMenI0?=
 =?utf-8?B?ajhzcndtOTFRdTdTZVZ4WnU5NVF2eXI5dkg3Q1NTYjFoaGZ0blZnMWI3N1ov?=
 =?utf-8?B?RFEzR0gwMjFaU1JqTFZjcDRCeU1UMUJQQlJEd2FWdzlsaFErWjZDdFVDTHcw?=
 =?utf-8?B?VUpaS0Q1eEFHWWV5SHhuZ0YxUThiUkhaK0xSanhhazdpZjZlZUxRaFA3TWtC?=
 =?utf-8?B?UmhOSkYrM1JSaERENmNaVUtVaDhWSWlXR29SMTRHRlVXdjhzZVJjTzRYUWxr?=
 =?utf-8?B?R3VCNVFVOVBNRCs0VGJKZktLQ0ZFZGhHY1JJR3MzSGRCR2R3azZ4UUJjbW0r?=
 =?utf-8?B?UHNUanZNWjB1dDBReElwa25rMS9DQW05ZjNISXNEY3BBMTdtSUxvQWhweFNB?=
 =?utf-8?B?L3RMNUl5QTRmOU9OL0FtSTBNOXdFUzMxUVdqWTdJaWw1V2dZSmNqYUFHWjlM?=
 =?utf-8?B?c1B5amNRWjNQUStYL0VkNEYzV3NJYmUrZjRNOHBZSmw5eUFDRVdMdjhVVkJl?=
 =?utf-8?B?ZVN0bllURWZvKzRJZW9uZHdRTlFQTlNSMnJxVWxRVm9sNkRNNXVVU29PTjZ1?=
 =?utf-8?B?NXgwNkpoNW9iaXQ5eml2NExpSlkxNVhUZDBmMWt1ZUJkak9aUi95NWdiT2pR?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BEF8424476D444AA84F541E413FF6E5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/B0O2GmWwq1/HYE2kfxFtU9bFrc2BpYH4KbXrx7vN8yMLWYb9LAIGlfC7IZLaO6QbtsYh963O4nU0UK7XXEcxXjsKl4tkrvk0GexiyLOJcvYhYwaLKaHnBA1jyj4dBUOcCS7paHLPBeT1RMLSeoUXLQPll5/Xly5nOSYxyUid2xAi7v2ptNT0ZQKV6udUR0w11zM8zAWyhQn8X4usYCCITtOx8n2UKhqC9zf7yfBD5zgN7DrMxqJC3rK8ArOAhRLXPhO5JfwypHuBBJ2nMbHPb6bmZMugoTnRWReD+hmocdP5UBv+QxUf39C+K94W5ML/qhG1R2rftPh5YnTefWu4p4ISDHvxdqMBGPXWD9imOzu4VdAQLL9lrsUmWkk2CktzrSzljnzKyflMIwnPveNFj5VfHQst5Ub8CEjbxFv61OdbaH16RYzetv41F6Gb8cdCq9KsaIXtdLpI4S8PpnEdIXeQi5DpetnnroDrTwrpLuyrmvfjlOCSRrCTuaw3ZdD+LwwuSZCq9O/y6CjvBvaVLfPlfIST/+LTuY4pw0HLQdSoIUYDwrpUCFbhCwqDWUUWKa/JcOgHL0o7bIIS2hPnunzqW+R7ffiokp7KB83EPBoOo6SwFZKjjwD1rj2+Xo/7doJ/LKZiv6xxXdv7yNkp4yKYLAX0OxoR5HbCmtGmmbzr0WBgVfaXiLk4JJx+7LOEmw8/9zFKAC80ATzr0CQsatzW9Mksm54yGdoWXET3eLjZWBs+tsFM6NLh2++l+nx/zIIs/JjXoNahqXLNK/VN9zSPNspxUFFCZWGSynz0NDOoSK10lhiAcCqLUsm2qumzIPLsU56bhVlOZxb8wDgq6Q4lceWvKZG/FC+6endlpBuI5OMYk2pmThkRZvpBQOS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a17338-2792-4b21-6102-08da7b9aff4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 13:11:26.4031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1mbZZ2YfNIQ1YM0BMvJSUPNQqC1GuivztqPsK3maWTZo6X8ySDvpQdkfU41xUwTiKHkblA38ha4T2Ye3uLIIJ160PWXzyoHiYRxf6rSfgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5838

T24gMTEvMDgvMjAyMiAxMTo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSBsYXN0ICJ3aWxk
Y2FyZCIgdXNlIG9mIGVpdGhlciBmdW5jdGlvbiB3ZW50IGF3YXkgd2l0aCBmNTkxNzU1ODIzYTcN
Cj4gKCJJT01NVS9QQ0k6IGRvbid0IGxldCBkb21haW4gY2xlYW51cCBjb250aW51ZSB3aGVuIGRl
dmljZSBkZS1hc3NpZ25tZW50DQo+IGZhaWxlZCIpLiBEb24ndCBhbGxvdyB0aGVtIHRvIGJlIGNh
bGxlZCB0aGlzIHdheSBhbnltb3JlLiBCZXNpZGVzDQo+IHNpbXBsaWZ5aW5nIHRoZSBjb2RlIHRo
aXMgYWxzbyBmaXhlcyB0d28gYnVnczoNCj4NCj4gMSkgV2hlbiBzZWcgIT0gLTEsIHRoZSBvdXRl
ciBsb29wcyBzaG91bGQgaGF2ZSBiZWVuIHRlcm1pbmF0ZWQgYWZ0ZXIgdGhlDQo+ICAgIGZpcnN0
IGl0ZXJhdGlvbiwgb3IgZWxzZSBhIGRldmljZSB3aXRoIHRoZSBzYW1lIEJERiBidXQgb24gYW5v
dGhlcg0KPiAgICBzZWdtZW50IGNvdWxkIGJlIGZvdW5kIC8gcmV0dXJuZWQuDQo+DQo+IFJlcG9y
dGVkLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4NCj4gMikgV2hlbiBz
ZWcgPT0gLTEgY2FsbGluZyBnZXRfcHNlZygpIGlzIGJvZ3VzLiBUaGUgZnVuY3Rpb24gKHRha2lu
ZyBhDQo+ICAgIHUxNikgd291bGQgbG9vayBmb3Igc2VnbWVudCAweGZmZmYsIHdoaWNoIG1pZ2h0
IGV4aXN0LiBJZiBpdCBleGlzdHMsDQo+ICAgIHdlIG1pZ2h0IHRoZW4gZmluZCAvIHJldHVybiBh
IHdyb25nIGRldmljZS4NCj4NCj4gSW4gcGNpX2dldF9wZGV2X2J5X2RvbWFpbigpIGFsc28gc3dp
dGNoIGZyb20gdXNpbmcgdGhlIHBlci1zZWdtZW50IGxpc3QNCj4gdG8gdXNpbmcgdGhlIHBlci1k
b21haW4gb25lLCB3aXRoIHRoZSBleGNlcHRpb24gb2YgdGhlIGhhcmR3YXJlIGRvbWFpbg0KPiAo
c2VlIHRoZSBjb2RlIGNvbW1lbnQgdGhlcmUpLg0KPg0KPiBXaGlsZSB0aGVyZSBhbHNvIGNvbnN0
aWZ5ICJwc2VnIiBhbmQgZHJvcCAicGRldiIncyBhbHJlYWR5IHByZXZpb3VzbHkNCj4gdW5uZWNl
c3NhcnkgaW5pdGlhbGl6ZXIuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQoNCkknbSBub3QgdG90YWxseSBjb252aW5jZWQgdGhhdCBzcGVjaWFs
IGNhc2luZyBod2RvbSBpcyByaWdodCwgYmVjYXVzZQ0KcXVhcmFudGluZSBkZXZpY2VzIGFyZSBk
b21pbyBub3QgaHdkb20uwqAgQnV0IEkgYWxzbyBjYW4ndCBpZGVudGlmeSBhDQpjYXNlIHdoZXJl
IGl0J3MgZGVmaW5pdGVseSB3cm9uZyBlaXRoZXIuDQoNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L3BjaS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPiBAQCAtMTc3LDEwICsxNzcs
MTAgQEAgaW50IHBjaV9hZGRfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTggZA0KPiAgaW50IHBj
aV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pOw0KPiAgaW50IHBjaV9y
b19kZXZpY2UoaW50IHNlZywgaW50IGJ1cywgaW50IGRldmZuKTsNCj4gIGludCBwY2lfaGlkZV9k
ZXZpY2UodW5zaWduZWQgaW50IHNlZywgdW5zaWduZWQgaW50IGJ1cywgdW5zaWduZWQgaW50IGRl
dmZuKTsNCj4gLXN0cnVjdCBwY2lfZGV2ICpwY2lfZ2V0X3BkZXYoaW50IHNlZywgaW50IGJ1cywg
aW50IGRldmZuKTsNCj4gK3N0cnVjdCBwY2lfZGV2ICpwY2lfZ2V0X3BkZXYodWludDE2X3Qgc2Vn
LCB1aW50OF90IGJ1cywgdWludDhfdCBkZXZmbik7DQoNCkkgd2FzIGdvaW5nIHRvIG1ha2UgYSBy
ZXF1ZXN0LCBidXQgSSBjYW4ndCBxdWl0ZSBnZXQgaXQgdG8gY29tcGlsZS4uLg0KDQpQYXNzaW5n
IHNiZGYgYXMgMyBwYXJhbWV0ZXJzIGlzIGEgd2FzdGUsIGFuZCBpdCB3b3VsZCBiZSBncmVhdCBp
ZiB3ZQ0KY291bGQgdGFrZSB0aGlzIG9wcG9ydHVuaXR5IHRvIGltcHJvdmUuDQoNClNhZGx5LA0K
DQotc3RydWN0IHBjaV9kZXYgKnBjaV9nZXRfcGRldih1aW50MTZfdCBzZWcsIHVpbnQ4X3QgYnVz
LCB1aW50OF90IGRldmZuKTsNCitzdHJ1Y3QgcGNpX2RldiAqcGNpX2dldF9wZGV2KHBjaV9zYmRm
X3Qgc2JkZik7DQorDQorI2RlZmluZSBwY2lfZ2V0X3BkZXYoLi4uKcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQorwqDCoMKgICh7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KK8KgwqDCoMKgwqDC
oMKgIGNvdW50X2FyZ3MoX19WQV9BUkdTX18pID09IDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA/IHBjaV9nZXRfcGRldihf
X1ZBX0FSR1NfXynCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQorwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA6IHBjaV9nZXRfcGRldihQQ0lfU0JERihfX1ZBX0FSR1NfXykpO8KgwqDC
oMKgwqAgXA0KK8KgwqDCoCB9KQ0KDQp0aGlzIGRvZXNuJ3QgcXVpdGUgY29tcGlsZSBhcyBhIHRy
YW5zaXRpb24gcGxhbiwgYW5kIEknbSBzdHVjayBmb3INCmZ1cnRoZXIgaWRlYXMuDQoNCn5BbmRy
ZXcNCg==

