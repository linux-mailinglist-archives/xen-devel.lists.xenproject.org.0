Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A097D5F0C0E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 14:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414215.658379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFWe-0004UQ-Fd; Fri, 30 Sep 2022 12:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414215.658379; Fri, 30 Sep 2022 12:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFWe-0004RN-Cq; Fri, 30 Sep 2022 12:53:56 +0000
Received: by outflank-mailman (input) for mailman id 414215;
 Fri, 30 Sep 2022 12:53:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7LLR=2B=citrix.com=prvs=265fc461d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oeFWc-0004RH-Ic
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 12:53:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee39a2f6-40be-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 14:53:52 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 08:53:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6611.namprd03.prod.outlook.com (2603:10b6:806:1ca::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 12:53:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 12:53:46 +0000
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
X-Inumbo-ID: ee39a2f6-40be-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664542432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J7061ZzpFfw9cltov4YtMRU1Bm+P+oDbBUi0e9qeKnw=;
  b=Nuf34+XrWmU+6gBc4PiKvP5p4D+hMcW2BPrbJYsK7KqwOxQnyH+n98YM
   Ki7bMQBLSwnvZUt/m8GRPKJPL1y5PSph6LHCEagjqA1/Oq3XhT/yBSyMK
   VSRJ4wUvhaz6mslg8x3vJwhyCna8OWXI/En1y2A1b128vZZSJ2qQ6dX5s
   A=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 81715032
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AfKSKsq7RD3rZYrxOikp99gxR2vbMJc67UCYv2?=
 =?us-ascii?q?ybI2n9qXhjvZKvfOBssXYv8Wpfo+PeyQoVEoa+/cxN6ZIJ+4YuAx8zB1MK+9?=
 =?us-ascii?q?aFtG1Ws5A2WgEhWToypr6DmCQ5shkJMLLsDjgZpzCWkm4ZkjSK7VWu5Z6faI?=
 =?us-ascii?q?w6/B3yNhnyGnCyiuGTnhoQMSBwPtd0fB3dE9yZA8oT4hGgLjMLP7qUquXjXW?=
 =?us-ascii?q?GDyci335vdvkTKnT2ln0s0N743uQd7RDqHJG47eyF5tARZmD6pyklETFmfg+?=
 =?us-ascii?q?10acZPqP+R0BDYGTVea3ejJSeU0DohZaBV+UFoFzXLHAt00SkqqdbVfiqWtd?=
 =?us-ascii?q?AKwxJKfMXeDTOnqFnBYsiRj6txcSRzkie2HiRbB4qp/gwhW0oxgkrQFlAR/q?=
 =?us-ascii?q?BaxTzsGCxhLxoK0oFMBVSvnsJ7d/A/Mszf6xJzpVMY+4xbJm+uy77e92AKat?=
 =?us-ascii?q?I/2cCjdvuUy3TycUelu9O8dH4jCz/ejMBzHqn88lOyNiMsKtpP9XjETIrZtc?=
 =?us-ascii?q?vZhtfys/JGvV1akNCJ/qtSdVm27+/opUPr8nxjqiaoiby3Ch/yb9Wwh2ZOsT?=
 =?us-ascii?q?fCustnQ844r/oKGNxtjQDEeXqcBzTy+0BYynv3psbbKZ1PudOVoDW2+WZG0a?=
 =?us-ascii?q?xHHhkEV2R3jctaov5QGShfoZc1fGdaY9HQJUMTR0gX+NPBW3qTMS9Ol88DYq?=
 =?us-ascii?q?YWyIYN0L/tL8J7ADQoXMngpEk1obBHTzp8r8+nfeeCt6uzSxlWEF7flWV5Gw?=
 =?us-ascii?q?BnzgbtujdsiD1x3+ZOuU+Lk/83i6Lnjx9fHX2z81AIZ8MFGxJi0fM914w4/Y?=
 =?us-ascii?q?z5Oxu/3vN9ewVuXdZoxGDLv9vR1PXQWxlFZo0T/JJM4mqMleciuwRD/lWYWm?=
 =?us-ascii?q?TidqNfj2Vs52ODeMq2N+sGvnwE7uRqCFCCLk3NaptgStwyEqkXMm+ltw/xju?=
 =?us-ascii?q?CHGlIM0WDVjGOy4VewiuKqDp6vM141NxBXkMz7YzLP9uT8bvfa5fx17RI2RC?=
 =?us-ascii?q?QFEiAfzgS9VqfPNZOr+4tXxVkZEWYco2fJQIzUOEWlKykDmvQVToMUOLz5fq?=
 =?us-ascii?q?zMiBlUBaWjajCrbhdnrACrLYzzV2tUh2JdgSxc1NnfeaHEcek1dJwd78jKVS?=
 =?us-ascii?q?hT9nzjZ2tBcdaVX9jb3pKHhMIhmq5PU0kN0DHRMJvCkIk9aBoPAd3IzduaLS?=
 =?us-ascii?q?P6OSoRMpbj8FYt1Cz/es2pN2k3Fkx2wJ+QfSBDt9tfDefpICnoWiG5YZNfJh?=
 =?us-ascii?q?mkKDfoNay3Ua/rxKPqh3Y8n7kHx5DmqYe7EPUiFrxBMpRR5OwvX+230Pir7x?=
 =?us-ascii?q?UUVNbxnptzKKm4RR6rYiC4cgeQtxrsxu0u7aroA7y1rv9ROwFkOitZfFVYBq?=
 =?us-ascii?q?QWyyjg30KJ18o7qPMmMB3UYqbMd4FRaXsKiSXxKOkZCWnQ8wz+rabxrIPq1e?=
 =?us-ascii?q?pZ70QCwq+RMafmGdpUvJ+8bHIXjeIPd9ygdO7oHcE9d+z2dxnnZKLzEveeei?=
 =?us-ascii?q?x5mY4MJzDWS1V0M+dqVK7Ck17F4FIxwnqC3r8HTCn1H8ArEcww0M4uc3okLR?=
 =?us-ascii?q?ZhXtwbwc7sdJli4AA1fpFpMhyHH29a7FbQZlnkvSYAmHEu+CgawZy4Mc7MSI?=
 =?us-ascii?q?z0gluqWA4bsaw3ygjdN3as6KucDFSDTMkawrGg9qlDj4DykgzZzWrGlprAa8?=
 =?us-ascii?q?Wz1itKKD+1DbQkcUjDgCAO0WgWXH05Xr9QHQztkyruEi+0QmTfdoam82rBJU?=
 =?us-ascii?q?i+XmYblJIfTv379ho6Y87QuI5tqFAqVddUOtSgKWde/swaoDOKMywQjeQ0B0?=
 =?us-ascii?q?1cq3i3TUb8hQDZI62uqZn2ikVyN9Er6bkOYfAZIW7YsYIduSMekusdN/WZ5a?=
 =?us-ascii?q?h9vVMh+lW7FDri8cvToGXOnJjg7wmKNqH1sY765SlWCOYG84y1DFrYg6oIdi?=
 =?us-ascii?q?Is5bLk92cMgGQRPZpRS65NTFFnmi8vmxaWOdEUqg7Vh87nUnkmaJPzA5X8DA?=
 =?us-ascii?q?387XS9XsqjJeTz0qraXX+tXNu9/Y9hIQ4v0TIpontdFbGSjgeWGpukd/P0Sb?=
 =?us-ascii?q?ECT8f44DEEj8HP4WJdnh6i8oN+TVs+58ZflLaBmaBMIe5IKqgxE60iV55QjS?=
 =?us-ascii?q?YN3rmyDpt/5pTv/8JGxBE5IwgxTZ8x8Ph9Y+/v/8NAoapJYMx5JuGmVkzzKu?=
 =?us-ascii?q?EJUK4tq12dpc+QXHCuiFXXy7NRClTBfckYH8q4wl41gci76QtYTXvBfdwaxr?=
 =?us-ascii?q?db95p0TFWvKZkAyAh/eclIMtoaTNlZfXZiA8Pf0cfNJnGNwWbCz5KVe9OeqH?=
 =?us-ascii?q?gBlwutwNKW13P9a7vrp6YoJvobjmYmGb6Gg9HpFQdvOOfFjIWPku4zlstlFN?=
 =?us-ascii?q?z+RIghHMw3HpvWVOvvI6m596mrEsfwVbp6LYtjndzBX8oVb/yELUSVj35v8u?=
 =?us-ascii?q?Ax1M6iD5NjWCnAEyRUi+CZGQ8Az33vwoPqj/lKzRLYifLNZlcfs9M0E3eXVB?=
 =?us-ascii?q?val2iRonYu5khFwp8OdUgTT6EyuH7jUZai617eDrEVqp4/82MTqjRy0CNSMg?=
 =?us-ascii?q?1Fks/vcPyevEMeEkXiMjGtozV/Xqo1JCAYLb8AI3ataZSI2mHz8BwbsW95p3?=
 =?us-ascii?q?rcSJpE7sSW+yPO6wfUrRbqwz4s7FhGTWmsw7lq+LEwsF2qY/oO87zqcayXG2?=
 =?us-ascii?q?I4l5hDlkNzv6re0NHbcLp35KKOx1XcDpC1BNiRH15rSjI8OrCD5AWAcRzKvo?=
 =?us-ascii?q?ZTGDoIYmLkSbNSNsBSqyyssrQ4oCW/2fDGYAU4pYLjzj5KsAvg4SRhSG5OUc?=
 =?us-ascii?q?NipMAQa6jAS3tys5GY=3D?=
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="81715032"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHDkf7kzY8IERtupepBlHZOTeD2Lx7cvGCo5g3NS8Fkp2JhOJnloaIWuLJPziE2Mf1o2YRKchiPjPstAG8Rj+1OWG519UYk1qwCZnQbZggtbOPix68PIVV4PUjxFMN1lXe3TJtrAy78jTaXoodyUGCBQd1O68qAups51Dg9uxhsxd4JvNoQN0gzJ/HbdU3eHQ1gGm+PvslQ4uIQemnK1zBgQ1dLwhCKpOBa0kdP/bkFh5mI9zkKJ8VwfK20VBd/AB0z2r+TfWcY0zSwYtMjJdAvmX/DRb5tk5cekHFO0w0ZE8xjkVnYoBMGTXuz+YPBpPsPuaTPY3AHU9x4zvP9Cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7061ZzpFfw9cltov4YtMRU1Bm+P+oDbBUi0e9qeKnw=;
 b=PskeCwYpiRxJVTU+6hKCyIC1QBq6ZFf7+u0u3bfl5mUbtsiecpn4IhtcLrzKkzo0O4BJOulgGwMYN2c/CSuJrBS6ncy8uVkai3Cu4oIeMfWvTDDIb9mfeUXoChUgeGDxUOCcETj6b7k1Y4TlZWbOA+/jgSksCL6pokVqlMy2PEMW6+P+egcAWyXU5f4alEV4/AuKWjAZ4oUkoZYSRWKLZ8B0oPSlyD968mZxdWl+sIou78RGeijqsfFehdWFyYbD2w8OGJsGcQuqeMt4qvEejMdLA9znONJQYqRUjl3B7njlE/iLBunIIYlOq9TfnLieb6AvkugP3gDoW9pXj2vpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7061ZzpFfw9cltov4YtMRU1Bm+P+oDbBUi0e9qeKnw=;
 b=di2A8F95AlU/qcjrbpNRZn4l1Hb2osKDHqNansus4u/3EWvtZBUgz4U4KJRWLuRRVaPBwYyd/w4K1sSg9xthR9EKaxe1es+00C2aDIH0s0qSgdloIkzsEz9u5ji6VDu3X1lWfXtpY5q6StUp8iAFy48j7Ymq/aZk65r4a4HzySw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Thread-Topic: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Thread-Index: AQHY1KFbLsYTqKjbvUaNuuSOaOWfM6337hgA
Date: Fri, 30 Sep 2022 12:53:46 +0000
Message-ID: <bd694db3-683e-a856-d4de-97589e4520aa@citrix.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
In-Reply-To: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6611:EE_
x-ms-office365-filtering-correlation-id: 97943b65-5a0d-48e1-a326-08daa2e2d067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ipbP8+mWepCjwegmMYhHUk/55D/NXCE/2l9NYcjVEWklQ+TLX9zk42XCrGFMVloHcywxiVLrcMIQAx5u5O84sXPTGiCJDf5xnuJJ87wujYSH+AvC11b3n3DKSpiZOlOGYXq0wFWNgWJHXSnvcJxCgZJmhGDjC6LyhAIJcNPeYsDACKVVPy9MWwaXrR5IK6+XnoqBhtygLLFOoAUTY/WXIY6ObyAzZCVatlgUHqaW0HU8XxrRDYtyqqZVsvXuKTV0mKAdpXZyoR7xopO5OzAESHu1Rx81XAnTc8DJ/9C7qBjKFJ78SlW7z/Bt5LHq2strFoV2ck203dRD+ERazSHyVG1veClnbUBY5S9vNEdkMpKEvY5bBM5cA1raHHZgTrlswIhcfnaMiBoDn4CaZty0oPD8cx/lZ3RdFHXPE1v2lq3eCaglDPA5cNLvGcNn1Z0b0V+bDoHk679sYcQNZp2rUD+8RRGl24Bx1zIPrx9n0p3hyyAv/JbfgcdutaUUjbBp8UWAxg1FoM1cWKXN01CMmMu289MBOenURR6TI5x7kZJMKNpl6Y3kE5rZdZlA4JkeXxgInQYzJlX3oBEeqkoqGlxGS8FFIUcUdi0q/V6Ycz/rYWo/Bni2oDBCzNWF/x+f+ZdJA+0wmjI3SZ2GGTKenWvP91o0kPDvRwxJdsjMSqfb5QDExkuiSN1Vek5mYU2VV5q3I2cOzIgs8ahIOoUOR2pd/+BV07lpkuzMfV8z1QE96rIFJyH75OyCVTubbRjUO8H+loFytXSw7Xe7rvKTpzoCCYBoXwf6qDjtyKo2pQjXzRUeWz5nLXjiQjDmWH3qqTqAlRzZ08jJVOks0tJPdw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(122000001)(4326008)(8676002)(316002)(82960400001)(66946007)(76116006)(91956017)(64756008)(66446008)(66476007)(66556008)(38100700002)(6506007)(6486002)(2616005)(478600001)(71200400001)(186003)(53546011)(26005)(31696002)(54906003)(110136005)(6512007)(86362001)(36756003)(83380400001)(8936002)(31686004)(4744005)(5660300002)(41300700001)(2906002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUVOM0NmaU9mVThQc241YWxKOVJLV0NPOGRDSnc3UlJCbWpEb0R2WmVaQ3Zo?=
 =?utf-8?B?eFJXY25tK29OS1BqRE1ubTFUWEExK0dLNExtU0VtUmFwbm5kZlhjM001WSsv?=
 =?utf-8?B?UDNCcXhzMzQyZmdZbTBjanViL3pGT2xxUXpVVlU1aWd3RGJBd214Z3hPYzJm?=
 =?utf-8?B?SFBxYWZVbzkyWjRNbWtoSWZrL3lqb055Vjd6bk5UQWZab1NLYlVzUmdrUEVZ?=
 =?utf-8?B?eFpya1RMaG5GZFFzNTI3dnJEdjAwZjRwUlFPMVI0eHM0bHNlSk85ZVFXRy9N?=
 =?utf-8?B?RTF3Yk9URVFKZjVxZEFHN2RmNjhZMEY5ZnlsMVJOQkphVmxzR1MrUCt6SXh0?=
 =?utf-8?B?WTdrSUJuNm1ydnFxSG9LMG9pekJReEtiZUxYTVlxc0hRUHJxMkJabnZQTVlq?=
 =?utf-8?B?cExkZEloNS83UHR2SWJSYnBsN2lzUytxRXFWTGFPZndrV1pLQjRtdFVYSTYw?=
 =?utf-8?B?OXBORllJL0tsWDFkekJWbkFFbTQ4QlBJaTdFQ3BhVnREcjNiRlh6RVBNWDVj?=
 =?utf-8?B?L2tONVpnbklHM21nQUpTZ1R0TWI5WjJiZ2RSYld4QXBGcXUyeUpQQy9TRkt1?=
 =?utf-8?B?ZVVNWVJ6cnBZR0E0TlBGMEJyZjliaVpBakpOeDBlQit2Y0hjR0dQSFA1bmdN?=
 =?utf-8?B?d0J2K0pwbzVCejY3QkIwZDEwWEp0c0tJMW5yb2hXbGh5SVl6aFFSd3ZrZWlr?=
 =?utf-8?B?MERybnI0c0hoTXRpcHFPdTRXaWxMQjNiWThLbkcvbWpWVzRUOUlOL21vTUJE?=
 =?utf-8?B?SDgzd3Z5SDRZSmlvQ21PUDlSTm9rVTRIa29zazMzMHlCa2orVDEyQjNCUjBI?=
 =?utf-8?B?TzhjeXpEamMyMlZHRUk1ZFZ0LzdEMDZJYndjQUdsNXZpVUtwRkZ5RkFBWUo4?=
 =?utf-8?B?YXEzWGJ3b3cycitnRTlxQlF1TStnY1hpaEhsS1BqT01lQmlkV0M5K21LKzF4?=
 =?utf-8?B?WkVrSGhWRS8wZEM3aFRHWFJRbjJWZExjc3pTNGVQTGY3MHNXRm1HUmY2czRO?=
 =?utf-8?B?WjloMnJNcWlrenlabUZNdEFjcDl2TmJOQ2llWEhsdE1XRGt4K3R1c0UxeWRy?=
 =?utf-8?B?UTg1ZXI1ZU5heGpWTzhIcE5qVEhSbFM3a1VKRmQ1eVZRNmtGY0tFYjN6NnFI?=
 =?utf-8?B?WExWZzV1V0VvMjUwZ2tFUjJCK2llbExXelBiS2dTbWNvRGhoR0dkV2syTEow?=
 =?utf-8?B?V0tRckVKZ2dsQjJreG9wTnpWb20wQ2p3ZTJDTUNieTgzMzdvZGVZTGYwUkRX?=
 =?utf-8?B?WWJVMUdiMldrbXRzbUdubVZRZ2dEQmxEQWlySXFKbUkwa09hR0RPT2VzNFBU?=
 =?utf-8?B?WmhUZnptQXRZd2dMMkF6ZUFxbTdFUm5ONjcrUmZUNlNHYlhCZUl3ZEJ6NExL?=
 =?utf-8?B?blFmTEVBSTV4Q1hoMy9NOHRuUU9kc1VoY1VXQ2lGOUVrS3lDS2puVUpidXZh?=
 =?utf-8?B?VVlTVTZwaTFMVWhaWGF3WGM4dlB2bmdSUmtvd2VITC9uaWJaTU9uM1NjRCth?=
 =?utf-8?B?RjZjdGNmTkFYQ2VxMDBJYmJvblFjZnNpR3VlTUpVZVY1cGlCeENacmRkVVhh?=
 =?utf-8?B?TlVaVEM4L2RTQTZQcjBtQ1NNdHMvaXhPeEJqZ2djc2tJUVVOUVVHNzE4dmJT?=
 =?utf-8?B?MGh3alpsakZFVFFralJUOE9iN20xOU1ZU29VZW50S2UwVlJrMUx0QVRYT2tU?=
 =?utf-8?B?UzZYelM3TDhRaUhkdDdrZmNVOTRSeXdiZVB1V0F5QlBxeVM4eEFyMENKd2VL?=
 =?utf-8?B?TGROeEJ2WWViUEZGZmcyVGpkV01xVlRjNTJpMUt0VlhVenlmcDlvMVFlMXBY?=
 =?utf-8?B?dkZGcVVCZzkyWUdPZVJzbUM5VDdGdWc1NGF1amloM0F0aFJZOTVVN1JhZjlM?=
 =?utf-8?B?T3FPR2lCU0RQK3M2N0R1VEx0eHdRY0pPdnp5c2F1dDZuanptNUNMSE8xSGtQ?=
 =?utf-8?B?OG9XdEJzNmk5TzBNeVdzVjBJaUVXbkVvODBZWkRuVFJVS2E3dWppTTcvZ09u?=
 =?utf-8?B?YnFpbXNHdkxSR2FrNGk2WmVpaVFpRnBZamwvWEh1RTc5bTNsaXRDR2l5RkR5?=
 =?utf-8?B?cmx6TXNzMWEveHRoZHZ0TVJ5Z2EvYkgwc2xUNUxKRTdGZmlvcFdPSEVrb2p6?=
 =?utf-8?Q?KOU1b241oHznS7Q5MZ4NXGU8n?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFA52AF9FAB8EA40B4671763B26E2C01@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97943b65-5a0d-48e1-a326-08daa2e2d067
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 12:53:46.8483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TVffPJQMsezRkJeTh6sNi0mVsFQpri4Jqvwsp30cVFvGvyDM0Lfg9APyd3TmMB2+wiLdl86tVkU4udh5g1B/Ov9nFUqUN9Ts6tEwVJuXNbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6611

T24gMzAvMDkvMjAyMiAwODo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IGVmaV9pbml0X21lbW9y
eSgpIGluIGJvdGggcmVsZXZhbnQgcGxhY2VzIGlzIHRyZWF0aW5nIEVGSV9NRU1PUllfUlVOVElN
RQ0KPiBoaWdoZXIgcHJpb3JpdHkgdGhhbiB0aGUgdHlwZSBvZiB0aGUgcmFuZ2UuIFRvIGF2b2lk
IGFjY2Vzc2luZyBtZW1vcnkgYXQNCj4gcnVudGltZSB3aGljaCB3YXMgcmUtdXNlZCBmb3Igb3Ro
ZXIgcHVycG9zZXMsIG1ha2UNCj4gZWZpX2FyY2hfcHJvY2Vzc19tZW1vcnlfbWFwKCkgZm9sbG93
IHN1aXQuIFdoaWxlIG9uIHg4NiBpbiB0aGVvcnkgdGhlDQo+IHNhbWUgd291bGQgYXBwbHkgdG8g
RWZpQUNQSVJlY2xhaW1NZW1vcnksIHdlIGRvbid0IGFjdHVhbGx5ICJyZWNsYWltIg0KPiBFODIw
X0FDUEkgbWVtb3J5IHRoZXJlIGFuZCBoZW5jZSB0aGF0IHR5cGUncyBoYW5kbGluZyBjYW4gYmUg
bGVmdCBhbG9uZS4NCj4NCj4gRml4ZXM6IGJmNjUwMWE2MmU4MCAoIng4Ni02NDogRUZJIGJvb3Qg
Y29kZSIpDQo+IEZpeGVzOiBmYWNhYzBhZjg3ZWYgKCJ4ODYtNjQ6IEVGSSBydW50aW1lIGNvZGUi
KQ0KPiBGaXhlczogNmQ3MGVhMTBkNDlmICgiQWRkIEFSTSBFRkkgYm9vdCBzdXBwb3J0IikNCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpJc24ndCB0
aGlzIGFsc28gbGlhYmxlIHRvIGJlIHRoZSByb290IGNhdXNlIG9mIHRoZSBjcmFzaCByZXBvcnRl
ZCBvbg0KSVJDLCB3aGVyZSBhIHJlYWQtb25seSBwYWdlIHdhcyBiZWluZyBpbnNlcnRlZCBpbnRv
IHRoZSBoZWFwPw0KDQp+QW5kcmV3DQo=

