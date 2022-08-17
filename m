Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3A596D3C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 13:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388866.625636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOGob-00065m-2F; Wed, 17 Aug 2022 11:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388866.625636; Wed, 17 Aug 2022 11:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOGoa-000631-UZ; Wed, 17 Aug 2022 11:02:24 +0000
Received: by outflank-mailman (input) for mailman id 388866;
 Wed, 17 Aug 2022 11:02:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctqM=YV=citrix.com=prvs=221f02cfb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oOGoY-00062v-Tp
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 11:02:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fa605e3-1e1c-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 13:02:20 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Aug 2022 07:02:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5561.namprd03.prod.outlook.com (2603:10b6:806:bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 11:02:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 11:02:14 +0000
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
X-Inumbo-ID: 0fa605e3-1e1c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660734140;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WZOPfjaKgJTc697CmyeiETw13PagHAE/ELw9eD7Uuac=;
  b=SUl94SZIa2EfDsCAWZXRk+c47QW6t0/BNGIha7j3VQf0U4k9m0v8zfy6
   cb1aiXrnLpe12zvLBnuka8AFhqLD3F75IIIdXcToe2GcWkQmOZrow7hL5
   2ss4YqbGd6e0Q0bqZNA0T+xGDoU3ZGG73e5/qZdrYpLv7DQ2YEtuJk1IZ
   k=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 78286885
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AROLWM6ORfdeEKVPvrXNrnJbID4GmJRDwMZ5BO?=
 =?us-ascii?q?5ONyJDMOBg3PpO3+DCIXisKGYBhGxn0FO3MPJFAYd7nTBFKIaVqljQqLPF8/?=
 =?us-ascii?q?x0h4An1Ucm/U3qJCZ8uGh3F4JCBdm++sNodWO/gDMhhgPPm+6Y7KG0rn0cHk?=
 =?us-ascii?q?DXH78mUmbGiEqmVa2nIkXhMO7Y1S8kcGC6pWZ+XM/4wrchxlHZ45iXSAMS2L?=
 =?us-ascii?q?5/8aSfAS5oJYX+eA/HmXv5HD4UrQyttQ2bPTFhHXEpLBb1lqW7khOvYV471B?=
 =?us-ascii?q?i+pK40P/kQWFOQdXk8E7WQ5OTqzd/H2xoeuDvS7JzH9luJWQ63emmXLX5Y/b?=
 =?us-ascii?q?unjnDRBFhpgTR77Q4iCuxoeEuVbGv5DCJEDZqEF3acXp7B35eqjdUVJcbNVp?=
 =?us-ascii?q?o8d3dYFVQA4NC5M9vJCHhDbUSCQOP+DHXCAJShGro2c+RfsPyJM2TeEf/dTY?=
 =?us-ascii?q?Jxkt01n/5dD5/C25VgESxXg/ELfi1ZCXAf8urKSbhHyJfVyDASAJEf6jdlPj?=
 =?us-ascii?q?qUMlNVti6Zdj2i9e2L4hmd+9jDuKphMbfD2eXM63d0T2rpENA0j6Sj7eumju?=
 =?us-ascii?q?QMm4gxY3Kz0PLlziasuonVcJwEJCIeM2TMcIN2CGiC+xzqpXaUslu099Lc1c?=
 =?us-ascii?q?utAVZ6Mjn+Y8ZI+Z15CuVU5kNHm26k5ZSju9IXjNRIYIv2J4Eb+CkrtakUlZ?=
 =?us-ascii?q?S3WR4cavMYKdclWgrBXc9oSSfUnMBHKblriuSVG85IB00yGG4+VFz7cYbddz?=
 =?us-ascii?q?en7VlIVsny2cliJ8uvR1LsHzqie4ncJSSFBLt87Nw990rEfmowWvy/aQN3Wa?=
 =?us-ascii?q?vUEdGLFCzlD23GECGLhLNLv3x99gn0ayJd+7BC0vILmC2R/vY9p+sdrhbMPh?=
 =?us-ascii?q?SZh3NxjNIjYzh6INXLxi6Y7+D3MkQKYRaEYJ6YK7EJ5y92SUC7D74jdurkCT?=
 =?us-ascii?q?L9qIE3rHoFRxykwlna2z7b8S7Peq9z4ALjb69076rr030N7swW0z0E/RkYfg?=
 =?us-ascii?q?4LtBgvos42n0TmaJmiO2KOyFFKcdgT1HGNEXFPs0cQqS2gbrNg8nz7Y2u2Vc?=
 =?us-ascii?q?R8KflS0RA4KyMZso0KshQLo5U0Niq+7tN+g0VzaX+EVVNfNVdbSYEND5AwbY?=
 =?us-ascii?q?+blBP+aMVcO20b+Uj6YJWw3y3Uzxji5yMyT6kiXzRKB3lvOv9PKz6bYxpzCL?=
 =?us-ascii?q?ZqOLiqMPg6oa3XJHHBmoXVz9sRzRLnMLiZj4dSssCcEmScSqZrbRCMOBo2fK?=
 =?us-ascii?q?VVVQzovuDLc05f5GnoRfDYjsYpNeWWfdmc9pHdXNU8P+65tQTuJ79XMO0NNB?=
 =?us-ascii?q?SID3rDmmidPR3OA7aZf03aycSbuaSGdWQKxFkC/jW/H115mE14CEqDKLIGBi?=
 =?us-ascii?q?0ILov3lw0mvkdlbZYCyi9LilpHQUu/8rDLX7D1WSB4sgBVzgbepodC2kBgwl?=
 =?us-ascii?q?cyddnVWsR6TuKhld82ksRiiYSwSbU0NsXKCQlIBYhd3yMB8J2MOdVLt6RXQH?=
 =?us-ascii?q?jZBO7dq/YpOf5Q8X5Sg/Oe9lz8uA/yu5yCFdhvR7nAmI3ScbYXDD29Dqogn7?=
 =?us-ascii?q?7J8vRzAK0WsC4jis/hpRiyv2/WKlZKj1dAEx5rAWWTJY0rhu6zf32OMIeFQJ?=
 =?us-ascii?q?mFwUdCAZ+p3wrKgNrpJ0XVLczHvyQecbdNe0aqPHfOrUupSVgqTe0F6wAux/?=
 =?us-ascii?q?tAri0JIQxkNeO8ayC+AGPgDWH3PsFSB7wu41gO0B0WEJ+OLDX8mtj+vMtuWd?=
 =?us-ascii?q?D9dQkAFcoFVsHI9TIEuURnOg9xarQ0NAaXXI+iNj+PKR5qRl0FIKsz15/5R9?=
 =?us-ascii?q?sPz+p39G+MSEkEm6mCeRsDFFNrIsh/1kU3qG7DKw1gA+0HavIiA0yw+nHGeZ?=
 =?us-ascii?q?P68Yiyjlk5flqBnsujhAw2Gikh++kWKZJ3Kux9cuqC+wsMNlQjXJuXcIlc6C?=
 =?us-ascii?q?xVvn5sErtelPlhy9cmss8JUJE6juAvWmUwgRA8zc7ytHYe0viCuhAihiz5ue?=
 =?us-ascii?q?BWPcVJdVfx7p2lBWL/6qzjDGreVA9aY4WfJUUmKs2qO3Yxx12v542a5wDJH2?=
 =?us-ascii?q?3ATuhXRt1yVzpdPVDUf47aek2U0LQDz4W4kyzTlZ7xj28TILpwaJSe0aRTTz?=
 =?us-ascii?q?Vu4EXsrNnI6V8ZDU7bOTBYuwwu5hZqMZMFcXUGTrJRy67WkER2IyA7PiRhB2?=
 =?us-ascii?q?gWyoF+SKpenxOh4B2mN5P1MNG7nemZvNePZxBZHFVVbOQ+CXJoehlBDdQCE8?=
 =?us-ascii?q?P1P+dLpE+7xAa+yWo/n59aT34WD3SFqy1J/IUxm/uNMW38A6vRE+1PhnIs7M?=
 =?us-ascii?q?GoCzJpFspuMoiqVGA2KchTBzBd2Qnl6xKrNkBxFOYF5gSe0ags3lJbGKVlJr?=
 =?us-ascii?q?3045Ink4T7f+eYjLTT7OZB0jClf+9KsY0Ztuc1B9LX6G/okinMb11s9bJlbo?=
 =?us-ascii?q?2nLyAawLYhiq5/8qP3ffmwPNcDjWjYNyXwkLtq/JddHVzzrM9jE1lCkW/vFv?=
 =?us-ascii?q?8PTwqyZV7Un5YcdfeKuOlmJN+zbc8g3NYgC6qqZ1YdS7rKDr+PxIEjzLzhHl?=
 =?us-ascii?q?DdD4h2kis9V77k/UoajxXmMnIdQ3IGMHLeD5H4VRix7y2JG8l1f8KzrEp3qz?=
 =?us-ascii?q?92+sqhP9SiCr5i+rITpXrj0A7qOJPeBxTLAHYolBiN9sYLYGrFxqJWObvBL6?=
 =?us-ascii?q?zmEJwFmJFzPZctqFJB3/cMnmHr/HhafLw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,242,1654574400"; 
   d="scan'208";a="78286885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc5+Qkv35Ws5Rf8vXz27msThA4Y2S4CdSKKRIqd5hmjDqh1lhtOekNvBFnIO8m4IrfX5s+ImtuTGrV6bjIfvZbewgo78144svuTKdNO6y2yDkTRBtoWfIpEq8HiiProkgdCYgzfuhLnp9FgSrGBdzt4oLQzzi73ZegC5mbLuJdeih7DEE1WMDB8WieyPv9lIaFor6yX29HCrpR5tmJ3y79OpMwqVAS/YjxWMfHLS9cJ8zkD0ZRik6b5TACBsv9ZVBkR5UIU5ZEMGGbYj7EqHfNFCy6r5Y9NRZS0zigaosFMyYziiAQJ0ga2l8cpaxOxXHK+XipDVg0LROaY8jJOHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZOPfjaKgJTc697CmyeiETw13PagHAE/ELw9eD7Uuac=;
 b=CB+FGObeqCGiiP0DlLY/MB2Nu1+i8IBJZPs4DR+6mjrn9OQ3fFG5TMFwzR7AhyCD94FikSK1enDUMhFPFQjkU+3bJHwUIC0H01cXhi/a/pat6a+7l+I8o0vB7bB9TdMBQtfDJqgWGHbN+bF15nYQRfmidvL2hHuTVLPlFIF+8wQ1SCjLwuy5sDtRJjXUKLnonwfVPACi6Dve9qyU7vpzvnD6SPzPPyeO1YEK8sd9UVtRpPs+bidWcngdCnuf0/FeozmWSjKPqHM/DCANYNX1/Oi4uALzglV0UiROLZ1xvjsio5AVjLji8mlPN5C3/Xn+Q/YNEaNmF70i7JTNk59WBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZOPfjaKgJTc697CmyeiETw13PagHAE/ELw9eD7Uuac=;
 b=sBs4T9cFaziiyDdmHnqWwJYJNJRQ5WqHq3VZp2jbmcLpS4WaGHSs4F7tWnv8xTfeBYBkikhd9TT3qynYxCCX0u+FNxsriJsyzVf/PB1AX8MmtNc0ZtWnHGJOkcN711G5Tce6p/xyhXWqgpMlS4O6QOWifQpJ0x2czvjXORuuol8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Thread-Topic: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Thread-Index: AQHYshn1FitJ6Hl8lUq9G/d15az/a62y7WeA
Date: Wed, 17 Aug 2022 11:02:14 +0000
Message-ID: <7f7479d5-71e4-5005-d37b-8d702fd5d871@citrix.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <20220817091540.18949-1-anthony.perard@citrix.com>
In-Reply-To: <20220817091540.18949-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2245100-b03a-44a9-d440-08da803ff11b
x-ms-traffictypediagnostic: SA0PR03MB5561:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0mfhG29cuPGmYXuGpNqbaSqNqL2PkDqmVVA7ATTQMX0lhGqGD/rXdTfJu9ShA4rlhU2oozXPhLCgwBaQwvSKUJgmFlR236pqA6zIm1YDum/61R6yx4ilJMVuRRujmEQCuvTKAtJUUFCHl1sI/WG3N3VGL8KKjbJsVER5ZcBnlBWSKNILqr5Z/4BnEN1/CxLMTFhzbpYrON1QIcYaPtzO5qEHrwvhk60Ur44PoAUYGvTJuz2NQ3YdJABJrU4Wfaa2nmVOc5MBcwX22A1hsUBiJOcCZ5HgXd8KOCrS6HsKhLxB8SMm0Db/etdXuKB4z7LpNeSJIyGpHCnHQHqd1PKTCocRmhUD7mgp3DxoYK/UBAttSqCft01WPD6fhTz3hsOVYXcUOiAqkJrFDFMx1ABbhwmNx2EpY0ZPNZRASa1VtYrICKGmrcmuspU3jtP1Aw5E0oI/M1k3M2OyFfxVf04s6WAToN49XZtwOHE4WHFMbhe0Gt4s8oqmM0t9fELSTUBKsHLjCXvVinG1rfBcoBgHPJfKS0Z9xe3Bs6+5GydO++YKGCKeu80H6N/c9ZV1BIZTegJ9PY4W3zoy1s6awTlpaSC9rdfBLUO8t3fcpW8gVWlFRZRdiSBoxJmPtRtwa9UuL/vqquU6A6q3Klsh+661BJabYxWl8NC1DViut4tnisxJG3hD1MvtFl4xoV9Ct/2AZCH9Bb4zYWUehaQ7FcLsUUWw/t36Y5LZuafroPqW3sxQHlwGuwop/icLTzPnJ0wHIlJ5Sh50oO6DrHp2PcsvJifvcpcT+CDbUHHa2ZCCt0+lzFQnCU7V6Kzx7c6i7TnAUAzDvNqrFoBXIFuZmKITamhHLwLJ25+JhVhTI8OwX9bv4Fjlu7Km4S/bnzsbVD1h
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(83380400001)(53546011)(122000001)(6486002)(478600001)(2616005)(6506007)(6512007)(26005)(107886003)(316002)(2906002)(71200400001)(186003)(54906003)(41300700001)(5660300002)(31696002)(110136005)(4326008)(66556008)(66446008)(66476007)(8936002)(66946007)(8676002)(76116006)(91956017)(64756008)(31686004)(36756003)(38100700002)(38070700005)(86362001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVZqMDlvY2JRZHk5VkhuamU3MWRYUkNSZlBlbk1LazVvb00vTVFTZ21ZQ0JO?=
 =?utf-8?B?N01McXdFOWhVUzFTb0I3bVVxa2d0aEpyckVWUHJmQ3NpVTFaMHhaRlU1T3R2?=
 =?utf-8?B?QzlIQkhUeHBzYi9HUCtjZHFvZnVmdjU5UEhxVHVXOG9PbStjdW1obktyY2Ft?=
 =?utf-8?B?NWJSZHhkNjB0cCtKUy9zMnBManQwc0pEYitpVmxYSjkvWGkrVTFOeTdMb3E2?=
 =?utf-8?B?TlEvWnY2TmR3L3JDeE04bThzaDQ1SWJpSTBDZkdrS1RGbFBzQXF0MnQvMXQx?=
 =?utf-8?B?SVNPMCs2bEZkR0RCcHNUajAzR1drbzZnTVZTK2NnYk8xQ1Z2eU9IQmdOYUZo?=
 =?utf-8?B?V2s3QWlRaHdwakk2ME01NGpRZnZTK3prMUJtSGovb0JGVi9keDNEMEs0WThm?=
 =?utf-8?B?Snp0N0ZvTUdnTkI4L05SYmgwc0k3VjZZcS9NaFh4VTQ2S3ZKWE1adWNOcEh0?=
 =?utf-8?B?VDhTYWRyd0kwNWpLTVdFZjNnS2hNOGxYbkxuUFNNenhRMUtuRlYweDRWOStn?=
 =?utf-8?B?TlNWVXU5eGt1bU5SdGRHUWkxdXpheWNoVWRWWGxwdVJqQWROSS9EUTFyaFll?=
 =?utf-8?B?RFVzZFR2MXBaWTl2QzltQVBIcTBacGNteVNVcE9FRlZsdmhhenlWcGxabjI0?=
 =?utf-8?B?Qk1SWTdGUDk2aGc5L2VYNlVKeTlZZmJzZ3laV1dGdmhJaXpYTEZINmtuOUhV?=
 =?utf-8?B?WTVCSTdERi9MWlJZaXJ0Uk5IdExOQmIzTi9wU29CeE9URWh6bDByMUtMT0dO?=
 =?utf-8?B?OXoyZkRLM0VtWHBvUTF3V3Z1c1VrNm5sYnhWbFdjQzR1b3ZHREI1c1B1dWxz?=
 =?utf-8?B?TjZMWnhFb1grUk1tbjBVWGFzbkcvRitPczdwZWhqeDB2c3BPZ3VhVldjUldT?=
 =?utf-8?B?dnJDOGx6Rm5yV2kxbXVtT2hmYWJaRjZnMzF4NHU4VklDMFNrTGJFWldqRERZ?=
 =?utf-8?B?Mk8zczNJNnZHakVYOExGTHZoTEE1c0o3RWJGV3JpcVVSMTNYbFdUWkxtZjRp?=
 =?utf-8?B?UW8zMDBmWENPc1lwODN3NU5sWVdEN0xwdEhwRm4rZ3d5LzBVOVVHa2hDaW9y?=
 =?utf-8?B?MlFOcnNsU3EzVjNWM1ZHbXBsOU56VWtaK2VKUG16ZFBQNEcwVmVaWFdXaTFS?=
 =?utf-8?B?aE9kVEhhR3BJZ2NlM2ZLUHVLQ3RoTjJIQ0E4L2RMaUZWbjNIWGJtQ01Ja1U4?=
 =?utf-8?B?MFlwUUlPRDkzeVI2SHBtZG1ScERPb05HMjNidTlGVXhLb2Vuak5hVUk2RU9s?=
 =?utf-8?B?SlVTcXpLcUFUalUrVk5ySFV1b2c4WEgyUDkxU0hrRFJkTFlRSjB6VjFpT1Ur?=
 =?utf-8?B?OUsyWkVxOTJSc0xGU0N2b1JXbEhjUm82ZGMrVEZPeVVMYXJzYkJDWmxWcDRv?=
 =?utf-8?B?eC9adUY3U0FWMWErZEE1RE9Oa2dpc0FlcGlleEUvOVNnZ3l3ZnJhay81RHRO?=
 =?utf-8?B?QW9pZnVUcHJYN3EyT2Rub1FCb2RaTWZRc2FnT0duR3JYN2p3WXNXbnUyeEVQ?=
 =?utf-8?B?TzRIMUVhUHo5b1haWDcxakRlRlZIdUFPRG5iOXlVS3Z2YUNZYTE3ZnZlQ0FQ?=
 =?utf-8?B?ODhScmxwMkJIU2kxMUsveVpFaWszNS9xRWFZazdyeDNFUkdsMU9PeS9YVkk0?=
 =?utf-8?B?RXdEMlQzeXNSc01FSlVrK1daKzZFdEZtRGZnV0NCZ21XcEhzZnc4SVlNZmIv?=
 =?utf-8?B?YmROeFZkTWFWVElWSkpuT0s1SE5IUU4xakNqOVM4cVdXdzJtVWVjVEFSb2NS?=
 =?utf-8?B?NnBtMXI0bUVjMkZ0bXhuNFBlSVlQaEFLanc5dzFCckVUYi9qZnoyMWRCdW5L?=
 =?utf-8?B?aFdsQ2k0QlIrK21XUC83RXZLam40cE5NMmJWdGJieXFMNVlyR1NjYzZJcHhv?=
 =?utf-8?B?YThka2x6VVBkbmdUcHFFOCtKYXhEd2k3V1FGaXlKeGRpMEJPUWxYNGFtaXRI?=
 =?utf-8?B?OE1BeGU0MUV4b01INng2aWhDQlNkdlV0ZFpEMStsWE1GMmN5b0VRUGtrb2ly?=
 =?utf-8?B?ZWM4OWJTWUg4bjBpSG1HazBPdzNNcFQzZjdibXFHZno2NklOT0RiR3hpZVpQ?=
 =?utf-8?B?ZldEWmZ4TndaUVJJZk5FckQ0a3hWVHo2RGpqYzJ6RHRGK09Wdi92OWlyWVlh?=
 =?utf-8?Q?HdiN5I5MPSscfmZleSPIYJrLZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <722A485CDA59DE4A802F45A34D84ED10@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?bGl6ZGFOR3RvdDFwbnVBSHRhOEJodlVldU50Yy9jSURUK09tQmIxYzlMR25o?=
 =?utf-8?B?SGQ2aXFDK2k2anVYMURyM1dGT1VlY0QzRjVWTXBzbUJxU0FhYithRnVjeHcx?=
 =?utf-8?B?d3VtUEdhenp5MHk5Z1ZIQjNDQlNZSXpOUXArbzFQVTFYOG1Db2p1NDZuQXhG?=
 =?utf-8?B?VFdFd2dob0FZczQ4VUhsR2xQcjFxVWpJdVVFUkw5anMraUtXT3pmZG9GbWhT?=
 =?utf-8?B?N1Zlem1SUzJ6T1krcXRuY2c5U3BCTXRNbUR1N1FkZE0xUmdvZmRFcU9UWlVz?=
 =?utf-8?B?MGRoTEVpZ05zcGdlSSt5eExCZVZudm50VVE1b0ptVW5jeXl0ZExGZ0FwQmZZ?=
 =?utf-8?B?N3FaZ3JQR2lQanNXMWF2Wm5zcGhnWEwxc2Mya1VlZ0VucCtybjRUZEdwSjNn?=
 =?utf-8?B?bFU3SXVvTTh0V0wzUS9pK2s5U3A1K1hadmNyTi9TYWUvc0JncW5vYWdsZUVv?=
 =?utf-8?B?NFZ2KzhsbEIxRkRJY09iOEp4ZTV5aEZnL1NEYzJxZFR4MUxGOVpzRjZxVHd3?=
 =?utf-8?B?RXRzNnJTUGFjTHNEanREWjFEOXNja0hvdWlHdFllQkVxUVdrUUR1N2x3OGpw?=
 =?utf-8?B?UysvUU8vMm1valFSNGJhZDdYNDBhNmQxNFllaVBFUWkyZktBWjhNT1NXZ0ov?=
 =?utf-8?B?dnl4V21rS2hGVXlQQ05yQ1VPaVlFQW1kSHNjaXdpc20wNGxoUk04dmkyQTAr?=
 =?utf-8?B?U3EzL3IxZDVpbmEwLzREWFQ5WSs4b1k5RzBBWDdxTW1pL2NhVTh2MzBZdlZK?=
 =?utf-8?B?RmlNVTkwL2FrRXVOQkk5ZlVhcjlzUnlieFdBbmpnRDJaMFlLZTdORlNrblMx?=
 =?utf-8?B?bXZDazF3Q2ZzRThtMGlzTWJETW90V2NoM3hmMFZOS3FaOUExQjFPTEVxdUxl?=
 =?utf-8?B?WGxzSVZxblZpZUg1MGliZkNKbmwzUGlXKzFjV0xHMHlvSDZqRDRacDI3NTJE?=
 =?utf-8?B?ZDJORkZDMkJpWXp2L2JBSFF5RWJKVDhGRWd4N0FCd2JmbEFEUlBZdUV0SVFS?=
 =?utf-8?B?QTFlS2tGcUpSRmdjSnlHUDVBUFBwNEZvRHFlRWR3cDhrMFVHM3JlVGl4K0lG?=
 =?utf-8?B?YW5ldzlUOWJTM1hBOEdxQU1NcnlxZm1OWWJLeFE1aVZzMGcvNERHVG5FdDlP?=
 =?utf-8?B?QWZRMS9RZVo1NDN2SGxwSnp6VURmZE53dWhGWUtSNUYzbWJPcy9OOGdjNXky?=
 =?utf-8?B?QVNwR2hhRWZYWDRPdk9aMHhieEtQbVFrM0MxQ3Z2b0piWXRNaEhGanVSZmRE?=
 =?utf-8?B?QmdxMU54MnhRMWkzNnNpRGh5RlZIV3hheWNodXRkd3J6OHl0SU1hdnprdThp?=
 =?utf-8?B?cW5Xa3pMSzdnMUU3YkROSWlKS3B6WFZhQnFVb0VndWR0aFY1Wi85V0hQbW96?=
 =?utf-8?Q?WnvVO6Uh1bn0RyXUYwxYeO32+P1EbjdM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2245100-b03a-44a9-d440-08da803ff11b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 11:02:14.2461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8nvDK13dxrPsU/pvb0nzlS1hLSkL7RlxfZxvA9X4d2eqvU0BOAkBYAVzdVhrnGJhkl12dyJKBUvlwDRlrsIJPi26ktCTwZE053ya3+7+oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5561

T24gMTcvMDgvMjAyMiAxMDoxNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IFdlIGNhbid0IGhh
dmUgYSBzb3VyY2UgZmlsZSB3aXRoIHRoZSBzYW1lIG5hbWUgdGhhdCBleGlzdCBpbiBib3RoIHRo
ZQ0KPiBjb21tb24gY29kZSBhbmQgaW4gdGhlIGFyY2ggc3BlY2lmaWMgY29kZSBmb3IgZWZpLy4g
VGhpcyBjYW4gbGVhZCB0bw0KPiBjb21mdXNpb24gaW4gbWFrZSBhbmQgaXQgY2FuIHBpY2sgdXAg
dGhlIHdyb25nIHNvdXJjZSBmaWxlLiBUaGlzIGlzc3VlDQo+IGxlYWQgdG8gYSBmYWlsdXJlIHRv
IGJ1aWxkIGEgcHYtc2hpbSBmb3IgeDg2IG91dC1vZi10cmVlLCBhcyB0aGlzIGlzDQo+IG9uZSBl
eGFtcGxlIG9mIGFuIHg4NiBidWlsZCB1c2luZyB0aGUgZWZpL3N0dWIuYy4NCj4NCj4gVGhlIGlz
c3VlIGlzIHRoYXQgaW4gb3V0LW9mLXRyZWUsIG1ha2UgbWlnaHQgZmluZCB4ODYvZWZpL3N0dWIu
YyB2aWENCj4gVlBBVEgsIGJ1dCBhcyB0aGUgdGFyZ2V0IG5lZWRzIHRvIGJlIHJlYnVpbHQgZHVl
IHRvIEZPUkNFLCBtYWtlDQo+IGFjdHVhbGx5IGF2b2lkIGNoYW5naW5nIHRoZSBzb3VyY2UgdHJl
ZSBhbmQgcmVidWlsdCB0aGUgdGFyZ2V0IHdpdGgNCj4gVlBBVEggaWdub3JlZCwgc28gJEAgbGVh
ZCB0byB0aGUgYnVpbGQgdHJlZSB3aGVyZSAic3R1Yi5jIiBkb3Nlbid0DQo+IGV4aXN0IHlldCBz
byBhIGxpbmsgaXMgbWFkZSB0byAiY29tbW9uL3N0dWIuYyIuDQo+DQo+IFJld29yayB0aGUgbmV3
IGNvbW1vbi9zdHViLmMgZmlsZSB0byBoYXZlIGEgZGlmZmVyZW50IG5hbWUgdGhhbiB0aGUNCj4g
YWxyZWFkeSBleGlzdGluZyBvbmUsIGJ5IHJlbmFtaW5nIHRoZSBleGlzdGluZyBvbmUuIFdlIHdp
bGwgdGFrZQ0KPiBleGFtcGxlIG9mIGVmaS9ib290LmMgYW5kIGhhdmUgdGhlIGNvbW1vbiBzdHVi
LmMgaW5jbHVkZSBhIHBlci1hcmNoDQo+IHN0dWIuaC4gVGhpcyBhdCBsZWFzdCBhdm9pZCB0aGUg
bmVlZCB0byBleHBvc2UgdG8gQXJtIGJvdGggYWxpYXMNCj4gZWZpX2NvbXBhdF9nZXRfaW5mbyBh
bmQgZWZpX2NvbXBhdF9ydW50aW1lX2NhbGwuDQo+DQo+IEF2b2lkIHVzaW5nICQoRUZJT0JKLXkp
IGFzIGFuIGFsaWFzIGZvciAkKGNsZWFuLWZpbGVzKSwgYWRkDQo+ICJzdHViLmMiIGRpcmVjdGx5
IHRvICQoY2xlYW4tZmlsZXMpLg0KPg0KPiBBbHNvIHVwZGF0ZSAuZ2l0aWdub3JlIGFzIHRoaXMg
d2FzIGFsc28gbWlzc2luZyBmcm9tIHRoZSBvcmlnaW5hbA0KPiBwYXRjaC4NCj4NCj4gRml4ZXM6
IDdmOTY4NTliMGQwMCAoInhlbjogcmV1c2UgeDg2IEVGSSBzdHViIGZ1bmN0aW9ucyBmb3IgQXJt
IikNCj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPg0KDQpUaGlzIHZlcnNpb24gaXMgYnJva2VuIEknbSBhZnJhaWQuDQoNCi9idWlsZGRp
ci9idWlsZC9CVUlMRC94ZW4tNC4xNy4wL3hlbi9idWlsZC1zaGltLXJlbGVhc2UvLi4vYXJjaC94
ODYvc2V0dXAuYzoyMDQ1OiguaW5pdC50ZXh0KzB4M2JjMTQpOg0KcmVsb2NhdGlvbiB0cnVuY2F0
ZWQgdG8gZml0OiBSX1g4Nl82NF9QTFQzMiBhZ2FpbnN0IHVuZGVmaW5lZCBzeW1ib2wNCmBlZmlf
Ym9vdF9tZW1fdW51c2VkJw0KbGQ6IC4vLnhlbi1zeW1zLjA6IGhpZGRlbiBzeW1ib2wgYGVmaV9i
b290X21lbV91bnVzZWQnIGlzbid0IGRlZmluZWQNCmxkOiBmaW5hbCBsaW5rIGZhaWxlZDogYmFk
IHZhbHVlDQoNCn5BbmRyZXcNCg==

