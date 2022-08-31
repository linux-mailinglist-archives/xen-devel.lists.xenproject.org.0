Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F55A893D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 00:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396092.636094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTWa4-0004zL-Qo; Wed, 31 Aug 2022 22:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396092.636094; Wed, 31 Aug 2022 22:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTWa4-0004x7-Nn; Wed, 31 Aug 2022 22:53:08 +0000
Received: by outflank-mailman (input) for mailman id 396092;
 Wed, 31 Aug 2022 22:53:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e54F=ZD=citrix.com=prvs=235479cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oTWa3-0004ww-53
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 22:53:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaf7c803-297f-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 00:53:04 +0200 (CEST)
Received: from mail-bn8nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2022 18:52:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6219.namprd03.prod.outlook.com (2603:10b6:510:e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 22:52:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 22:52:50 +0000
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
X-Inumbo-ID: aaf7c803-297f-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661986384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JQqsuMjZhwqDgWVYWRMGbYVoLBBYOvMKs/5jE/XY9lc=;
  b=S3WVQaP5zYypCYFk17O6tcYvUIvjtg6sItl+uk+5NML61DgmODJS679E
   6ew7RI1llx8gb4nmseeg3f72wVtT2KR/qcbfEvPe7+i8LW1gYZ8LXtKlt
   4hYdXiA9LMyujxmAlIOhLDcdnj6TlpBIG1/af7x+ce/FglsVPtNeB6fxd
   E=;
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 79225144
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GThV5KNNT2SdzXPvrR1rlsFynXyQoLVcMsEvi/4bfWQNrUpw3mYHz
 WFKDGDSaKqOa2f1eNkiO9m2oUkCuZaAxtBrTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/na8EgHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFP93M9UF2gkI7czxelWGEFyq
 qUXcSwSO0Xra+KemNpXS8FKr+F7cIzBGtNavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rj0wCWiG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFZYbFlGPZrhpAgMf0gw3EeKFOV4G6ydVE2UTL6H1PGCcJAA7TTf6RzxTWt8hkA
 04b4C01toAp6VemCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc6SzUl2
 V6Om9LBHiF0vfueTnf13q2JrD2/PydTImYFTS4CUQYBpdLkpekbjBjCU9JiG66dlcDuFHf7x
 DXikcQlr7AajMpO3aPr+1nC226ovsKRElNz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:eKyVu6ujrfCp9dxO3W2HfUOV7skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIYO5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.93,279,1654574400"; 
   d="scan'208";a="79225144"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV3YwPimNdAP4lli33a8Xv+812MZQ4cAfXYlTkt1RNAAgFBxRDPAIzwDc91m766ESNzZJ60FELaLw8jEbJJJUtV/rrLIJGA9INM76/gm3uh5Z/SQLR0/xD8i8sBb34+Tk8DSjrrQ2rCiVCSrPHXaoyCLgjlKh9TBH8+G8+UTSqgWFVdRNJGfolZSbelrzFwA+ekwesqeVx6RWgluxJQrQTjvycaw8bvhj7SuaH8YO7dXPLYJYFLw+TVcyHZeBUhVNFv3FokVBIrFwnAmUihySwgtCoTjYwhw8gNeaaVA+WKdxm3spCAjZBvuDOu9xycCYb0ZNNURrS2NgpzjfNNOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQqsuMjZhwqDgWVYWRMGbYVoLBBYOvMKs/5jE/XY9lc=;
 b=kYEjyOHWO0lxINPTQp8LwBRjeDROcWkKs/mXChy7LCNtNlXBVXXijXXPDHF+c3KfeUhVnfPo+lN9EjEcSx5SsU+XWGHMUO+iVmUDPF/ZUVA2v1julg3oDqYe2YDJ3zIJihfMLj+9770Rc6nUmzEBHuDvTi7DZAZrrMiFdwTEZhvpy6mpeavZla4vkoixdbyahK6kBntDJkV1a6Bk6jqHTLHUExrZZzqKZAiJb9v/2hr10hiA7AOp87V223jeFSwZC7yejP/wEitH0vHY0iATeGpW/z4KatRo6p+DLA2EWH/AOT1dprQ/PbOypqRfFcyCf6TnAWqOzbnxoG4Fgw0VLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQqsuMjZhwqDgWVYWRMGbYVoLBBYOvMKs/5jE/XY9lc=;
 b=FePr4pNyphbFlgFP4LYJ7p0PV9J3m6z5cw9OAGVqhQNHsnpW2+YfBshk0XPEFkOf3FnmKpUMimD+jZYa8bDTz35MAaQB9S73G98loUlHWGbJldDr6AFhBveajejH8kxoqoe3V61lAe3X5+f1ZSPCx7/bl5z6uCyF1Zy/u6vfi4U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v3 3/3] xen/sched: fix cpu hotplug
Thread-Topic: [PATCH v3 3/3] xen/sched: fix cpu hotplug
Thread-Index: AQHYsVjUGULgew6mPUO+TQcIZn3wJK3JthgA
Date: Wed, 31 Aug 2022 22:52:50 +0000
Message-ID: <096ed545-f268-ba45-6333-ed51d20fc99c@citrix.com>
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-4-jgross@suse.com>
In-Reply-To: <20220816101317.23014-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ffcd0a9-9fce-4803-49be-08da8ba3882d
x-ms-traffictypediagnostic: PH0PR03MB6219:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iULk4WMhUlYp5jnUY6n9ljNKRRsU+E5jUb/gu949tZNOTM7ztoBuPxlky1gst/b9Dw1KSvjAFYRvX7OYDjthaSmceZwDBtRhqMvOIsHqN/lozGU/qeIIG5mXR6PmfTL7CbATBOEEJnrMJwCQz8/+KRVeFNdwI/xU4Zw163Udx2jGL465WBRvDjTeenK9df9plZlAMiU+FT1bvToc6Sx7012yczNXb3guFSgZ/xhu7zmjmlCD4n1TVow7WiyLW2SkKIa4QfuGIx1ZUvUM+Q3Z+b/PP8EWJacMz9+nZJuZhASq4QvvAKLM1tOtzDTTMzxmzw7TRSzXFERVv4jLNQAkp1Sp6eDJiSRDBq4fMfWvhFmmAjgljcjfATQSmxJjEqt75Po+/VOAKaba+1YEpnfcoJLzlUlTw4LBufBf3C2WedFlDBEoT/U9y913H+HrGXNurx/+29U2rA2G6m0JQNzWFeL9x+PQqVATcPdcE+eUZ5MeitKcC/6DIZHIH4nDREtOrYcJrKFDcddiOAKXhhG77WeQnWWu9gjBGheCb/qfl5wwyvVvalcjubDJI63g+MJoRWx4YwztA7h63GkMVmnlUTxoWs6zp3KfQ+/DYboH35oBZrPOAT/2BDsNIS0gEC7KeatKPYcQ9kpTIyVBF51Ab66APg0hNdxNhcf4maTIAr8/ADEMF4d6xVSdNceK6aU4eoHi7+SfQdFZHazt4L1FQpyabgIESxquyHgOg/CjTd//Q0P8IVfLRPSEbRPUH0vXscw2Kuiy2jASzfN4hBR0hyk0MEsDd6OJZpUe8r+H2hEBCEsrOEihCDCSwg1CqZmDG8/I6sthCyyT2/9GaixHnw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(2906002)(26005)(6512007)(38070700005)(53546011)(6506007)(8936002)(82960400001)(31686004)(36756003)(41300700001)(5660300002)(83380400001)(54906003)(71200400001)(110136005)(38100700002)(4326008)(8676002)(64756008)(66446008)(478600001)(66556008)(66476007)(316002)(122000001)(186003)(91956017)(2616005)(6486002)(76116006)(66946007)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y216Unh2aFA3Z0ZsTCtOczlxV0htWHdka2p0Z1IrMlE3SUNvYUZBUXg1eCtZ?=
 =?utf-8?B?QXR5WExkSmptdnJMN2x6RGhhQ01oZnF6eEEvWUhaYlVmMnVFczZVemdGeHhJ?=
 =?utf-8?B?anFyaVFxV3BSSkMyL3JtanozUEYwODZ1TFBYbDljQlFCNnhCMWlzRmQ5Y3lr?=
 =?utf-8?B?dmhTem8zU25rVUtOV3RKN292SmhIMVNvd2I5R0tSS3plRG5ieGtEYjJhVG5l?=
 =?utf-8?B?WUFzWVpCUFVmcXdxSENRSC9KN3lCQlBjaTNkQTJmdmdhdVQ4dElBYkpOeTU3?=
 =?utf-8?B?TjBmTGtLZFFZZVhmbEpVd3gxNlo1ZWdvRjFoa3VIbVdyajd0am9Dc1o5bDlz?=
 =?utf-8?B?VmNLcEZITlpFbzBGMTI1NWpUcVpXTWZxQ0QraVFWblpZMDY3ZHNFWWQxa21a?=
 =?utf-8?B?Q2V3c0tsZkhUYldOYzRYbHdTKzNVRkh6QUdPczBQYzE5MWM1cTBtbkpNQVRW?=
 =?utf-8?B?eUZwR0J6Yzk2dWRvV0srRXBPeDQ4dWJ1NUttczRrM0VVQzJuRVN4Y1Q4a2s0?=
 =?utf-8?B?bDl4eU1tTkNxaW1JVEE4eDg5S0RzQlhObS9GSyt0UWdreWhCbEhweS9rUGhO?=
 =?utf-8?B?WlFxaWJGck5jUEN4aVdrQ3pWUERiM2lwRW91THpSNi9VT0IvTENDdFRhQi90?=
 =?utf-8?B?Z21GbnozaDVFMmM4eHIwVk0yOHpBZXJlSTN6cXc4Qi9sVWtaS2F3NE1veHZY?=
 =?utf-8?B?SHBRaUxyUzJwT1JveWVqeEF4ZEdsSFFrMjVVb053ZWlRT0ZKYVMxQ2szS3Vr?=
 =?utf-8?B?WDRLVE5uNkJjS2J2QU4wTFozaUozd1BXb3dxMUwvdGs5QkdsaDJIanNhYktJ?=
 =?utf-8?B?d01SemJBOCtMSnVQZEhRNVRXYmhFeG9jR1h4UDZtbzMvL0Z2UWFUU3Jvam44?=
 =?utf-8?B?YVN1RGlHNVl3M25GcE1HVWt1azdlWC9MSUNwMjF3UXRQYzEwb1JZNldNWXdH?=
 =?utf-8?B?dDF3dDl1QlR6Rm9XV0xDV0hhRWpxc0VpWTAzQ0IxMHRMdE1YVHNDblFtUmZT?=
 =?utf-8?B?VFRtYkpaemYyVWc0emFWNGhXeGNkMjBLT1N5NUtnKy83WElTeS9qVkxDSHhC?=
 =?utf-8?B?UjVEb0xtSDR5ZnZ5RExFV1pNZkcxZFV4VEVKSlNQSmhDc3Fzd0NsQTU5L3Vt?=
 =?utf-8?B?V3VsRnV4L0pLcWhEd2QwWXkydFpTRVdRS1FkRXZtWUp3OWRuS3JNcDg5K1lq?=
 =?utf-8?B?dk1DNTZsOWNYcEt4QS9rVFl0S3ZRKzh3T0U3R1A4ZFhXTXhFbzlNQUR3SStK?=
 =?utf-8?B?RmJjVGhoMTVzTFZLcGI1WG5aMXF3d0ZRV2w4NWRhMUlGS1dENnlyMTczOTJQ?=
 =?utf-8?B?QkFZWnJRMzkxaEZocGpwaWF6UGpibmUwRUM3Y2d1dVIzWjVGeC9TNnZZTU82?=
 =?utf-8?B?ODRuaENsRUhubWNlVnVvWnlkVWd3Zm9lV3VYS3VIMzBwTHh5Zk5iOG5qYWNz?=
 =?utf-8?B?b0Nyd3k2aW4rNHdJUEMxZ3k1MDNyVXV3V0p3L0xGNGQ2anlheVpuM0MwQUdV?=
 =?utf-8?B?QlZsalFLWlY2ZTJoWE9SelBwdDIrYzVDUldTcTVJV1VaTjAzNFhsVDRJamJV?=
 =?utf-8?B?dWI3UEdKZ255NnNqUmJYQWdUNEdOaEU2UVVSWHpmS1EvZko1eUQ1Vm0xU0pI?=
 =?utf-8?B?aTRzRThMYWpLSFlxcVlYazQxbEU0ZXNMbGI0aUJONThGZU5vaXlMcXFrRzln?=
 =?utf-8?B?dXhGV0pvT0l5aGYzUE42OVJmeVo0K21LUWhGcWY2Z3FoSkEyMEtyVWFFcjlK?=
 =?utf-8?B?Tjd6YndzVVRCUzVtd2w0VHRqVE52aHRxNzFRY1VTQ0lWTFg3aDZMd0pDL3Y2?=
 =?utf-8?B?YTBDK2FSb3c4T1E4K3FqdWNscHM4VERVTzZ4UHpmTkh6ZlA1Nk1vRjllSm5r?=
 =?utf-8?B?VXZiMnpERWYrRlBINVhlQ0FJV2NRckFMOEh0ekFZK2F2NUxFamt1eTMwbzY1?=
 =?utf-8?B?UmhjaWwvejFmQmFXa1hMd2dIbGFYZ21NWDJSak0vU3RTQ1FGQzZEcXdvVVh0?=
 =?utf-8?B?b2RlMUhoOTdhWWZSRzZGMU5Oc09pSzZSM2xqeUdqeEdueFRnWFRUNlVKN2ZF?=
 =?utf-8?B?SGJ4Y0M1OWcxTXpCQnJvU1d5bVJkVkQrSEMyb0VmVjZjNHFqaUkwNzVBRWNw?=
 =?utf-8?Q?iaYdwhFBOzS4EwGdPTaZVyxJX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6D281D19E9C9145B9634B536644AD80@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffcd0a9-9fce-4803-49be-08da8ba3882d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 22:52:50.6633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7w0XkmWYokxLWfFaE+2tCOBLqK+KHFuaWTkFiyrhZnLO0WJsEFaifuocIHrDYBNY86/cVJAC+Lb0WDxswzzC/HE6itML6rj/DG0+KGNfurY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6219

T24gMTYvMDgvMjAyMiAxMToxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQ3B1IGNwdSB1bnBs
dWdnaW5nIGlzIGNhbGxpbmcgc2NoZWR1bGVfY3B1X3JtKCkgdmlhIHN0b3BfbWFjaGluZV9ydW4o
KQ0KDQpDcHUgY3B1Lg0KDQo+IHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCwgdGh1cyBhbnkgbWVt
b3J5IGFsbG9jYXRpb24gb3IgZnJlZWluZyBtdXN0DQo+IGJlIGF2b2lkZWQuDQo+DQo+IFNpbmNl
IGNvbW1pdCA1MDQ3Y2QxZDVkZWEgKCJ4ZW4vY29tbW9uOiBVc2UgZW5oYW5jZWQNCj4gQVNTRVJU
X0FMTE9DX0NPTlRFWFQgaW4geG1hbGxvYygpIikgdGhpcyByZXN0cmljdGlvbiBpcyBiZWluZyBl
bmZvcmNlZA0KPiB2aWEgYW4gYXNzZXJ0aW9uLCB3aGljaCB3aWxsIG5vdyBmYWlsLg0KPg0KPiBC
ZWZvcmUgdGhhdCBjb21taXQgY3B1IHVucGx1Z2dpbmcgaW4gbm9ybWFsIGNvbmZpZ3VyYXRpb25z
IHdhcyB3b3JraW5nDQo+IGp1c3QgYnkgY2hhbmNlIGFzIG9ubHkgdGhlIGNwdSBwZXJmb3JtaW5n
IHNjaGVkdWxlX2NwdV9ybSgpIHdhcyBkb2luZw0KPiBhY3RpdmUgd29yay4gV2l0aCBjb3JlIHNj
aGVkdWxpbmcgZW5hYmxlZCwgaG93ZXZlciwgZmFpbHVyZXMgY291bGQNCj4gcmVzdWx0IGZyb20g
bWVtb3J5IGFsbG9jYXRpb25zIG5vdCBiZWluZyBwcm9wZXJseSBwcm9wYWdhdGVkIHRvIG90aGVy
DQo+IGNwdXMnIFRMQnMuDQoNClRoaXMgaXNuJ3QgYWNjdXJhdGUsIGlzIGl0P8KgIFRoZSBwcm9i
bGVtIHdpdGggaW5pdGlhdGluZyBhIFRMQiBmbHVzaA0Kd2l0aCBJUlFzIGRpc2FibGVkIGlzIHRo
YXQgeW91IGNhbiBkZWFkbG9jayBhZ2FpbnN0IGEgcmVtb3RlIENQVSB3aGljaA0KaXMgd2FpdGlu
ZyBmb3IgeW91IHRvIGVuYWJsZSBJUlFzIGZpcnN0IHRvIHRha2UgYSBUTEIgZmx1c2ggSVBJLg0K
DQpIb3cgZG9lcyBhIG1lbW9yeSBhbGxvY2F0aW9uIG91dCBvZiB0aGUgeGVuaGVhcCByZXN1bHQg
aW4gYSBUTEIgZmx1c2g/wqANCkV2ZW4gd2l0aCBzcGxpdCBoZWFwcywgeW91J3JlIG9ubHkgcG90
ZW50aWFsbHkgYWxsb2NhdGluZyBpbnRvIGEgbmV3DQpzbG90IHdoaWNoIHdhcyB1bnVzZWQuLi4N
Cg0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3Nj
aGVkL2NvcmUuYw0KPiBpbmRleCAyMjg0NzBhYzQxLi5mZmIyZDYyMDJiIDEwMDY0NA0KPiAtLS0g
YS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUu
Yw0KPiBAQCAtMzI2MCw2ICszMjYwLDE3IEBAIHN0YXRpYyBzdHJ1Y3QgY3B1X3JtX2RhdGEgKnNj
aGVkdWxlX2NwdV9ybV9hbGxvYyh1bnNpZ25lZCBpbnQgY3B1KQ0KPiAgICAgIGlmICggIWRhdGEg
KQ0KPiAgICAgICAgICBnb3RvIG91dDsNCj4gIA0KPiArICAgIGlmICggYWZmX2FsbG9jICkNCj4g
KyAgICB7DQo+ICsgICAgICAgIGlmICggIXVwZGF0ZV9ub2RlX2FmZl9hbGxvYygmZGF0YS0+YWZm
aW5pdHkpICkNCg0KSSBzcGVudCBhZ2VzIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoYXQgdGhpcyB3
YXMgZG9pbmcsIGJlZm9yZSByZWFsaXNpbmcNCnRoZSBwcm9ibGVtIGlzIHRoZSBmdW5jdGlvbiBu
YW1lLg0KDQphbGxvYyAoYXMgd2l0aCBmcmVlKSBpcyB0aGUgY3JpdGljYWwgcGllY2Ugb2YgaW5m
b3JtYXRpb24gYW5kIG5lZWRzIHRvDQpjb21lIGZpcnN0LsKgIFRoZSBmYWN0IHdlIHR5cGljYWxs
eSBwYXNzIHRoZSByZXN1bHQgdG8NCnVwZGF0ZV9ub2RlX2FmZihpbml0eSkgaXNuJ3QgcmVsZXZh
bnQsIGFuZCBiZWNvbWVzIGFjdGl2ZWx5IHdyb25nIGhlcmUNCndoZW4gd2UncmUgbm93aGVyZSBu
ZWFyLg0KDQpQYXRjaCAxIG5lZWRzIHRvIG5hbWUgdGhlc2UgaGVscGVyczoNCg0KYm9vbCBhbGxv
Y19hZmZpbml0eV9tYXNrcyhzdHJ1Y3QgYWZmaW5pdHlfbWFza3MgKmFmZmluaXR5KTsNCnZvaWQg
ZnJlZV9hZmZpbml0eV9tYXNrcyhzdHJ1Y3QgYWZmaW5pdHlfbWFza3MgKmFmZmluaXR5KTsNCg0K
YW5kIHRoZW4gcGF0Y2hlcyAyIGFuZCAzIGJlY29tZSBmYXIgZWFzaWVyIHRvIGZvbGxvdy4NCg0K
U2ltaWxhcmx5IGluIHBhdGNoIDIsIHRoZSBuZXcgaGVscGVycyBuZWVkIHRvIGJlDQp7YWxsb2Ms
ZnJlZX1fY3B1X3JtX2RhdGEoKSB0byBtYWtlIHNlbnNlLsKgIFRoZXNlIGhhdmUgbm90aGluZyB0
byBkbyB3aXRoDQpzY2hlZHVsaW5nLg0KDQpBbHNvLCB5b3Ugc2hvdWxkbid0IGludHJvZHVjZSB0
aGUgaGVscGVycyBzdGF0aWMgaW4gcGF0Y2ggMiBhbmQgdGhlbg0KdHVybiB0aGVtIG5vbi1zdGF0
aWMgaW4gcGF0Y2ggMy7CoCBUaGF0IGp1c3QgYWRkcyB1bm5lY2Vzc2FyeSBjaHVybiB0bw0KdGhl
IGNvbXBsaWNhdGVkIHBhdGNoLg0KDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIFhGUkVF
KGRhdGEpOw0KPiArICAgICAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgICAgIH0NCj4gKyAgICB9
DQo+ICsgICAgZWxzZQ0KPiArICAgICAgICBtZW1zZXQoJmRhdGEtPmFmZmluaXR5LCAwLCBzaXpl
b2YoZGF0YS0+YWZmaW5pdHkpKTsNCg0KSSBob25lc3RseSBkb24ndCB0aGluayBpdCBpcyB3b3J0
aCBvcHRpbWlzaW5nIHh6YWxsb2MoKSAtPiB4bWFsbG9jKCnCoA0KZm9yIHRoZSBjb2duaXRpdmUg
Y29tcGxleGl0eSBvZiBoYXZpbmcgdGhpcyBsb2dpYyBoZXJlLg0KDQo+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+
IGluZGV4IDU4ZTA4MmViNGMuLjI1MDY4NjFlNGYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24v
c2NoZWQvY3B1cG9vbC5jDQo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+IEBA
IC00MTEsMjIgKzQxMSwyOCBAQCBpbnQgY3B1cG9vbF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykNCj4gIH0NCj4gIA0KPiAgLyogVXBkYXRlIGFmZmluaXRp
ZXMgb2YgYWxsIGRvbWFpbnMgaW4gYSBjcHVwb29sLiAqLw0KPiAtc3RhdGljIHZvaWQgY3B1cG9v
bF91cGRhdGVfbm9kZV9hZmZpbml0eShjb25zdCBzdHJ1Y3QgY3B1cG9vbCAqYykNCj4gK3N0YXRp
YyB2b2lkIGNwdXBvb2xfdXBkYXRlX25vZGVfYWZmaW5pdHkoY29uc3Qgc3RydWN0IGNwdXBvb2wg
KmMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBh
ZmZpbml0eV9tYXNrcyAqbWFza3MpDQo+ICB7DQo+IC0gICAgc3RydWN0IGFmZmluaXR5X21hc2tz
IG1hc2tzOw0KPiArICAgIHN0cnVjdCBhZmZpbml0eV9tYXNrcyBsb2NhbF9tYXNrczsNCj4gICAg
ICBzdHJ1Y3QgZG9tYWluICpkOw0KPiAgDQo+IC0gICAgaWYgKCAhdXBkYXRlX25vZGVfYWZmX2Fs
bG9jKCZtYXNrcykgKQ0KPiAtICAgICAgICByZXR1cm47DQo+ICsgICAgaWYgKCAhbWFza3MgKQ0K
PiArICAgIHsNCj4gKyAgICAgICAgaWYgKCAhdXBkYXRlX25vZGVfYWZmX2FsbG9jKCZsb2NhbF9t
YXNrcykgKQ0KPiArICAgICAgICAgICAgcmV0dXJuOw0KPiArICAgICAgICBtYXNrcyA9ICZsb2Nh
bF9tYXNrczsNCj4gKyAgICB9DQo+ICANCj4gICAgICByY3VfcmVhZF9sb2NrKCZkb21saXN0X3Jl
YWRfbG9jayk7DQo+ICANCj4gICAgICBmb3JfZWFjaF9kb21haW5faW5fY3B1cG9vbChkLCBjKQ0K
PiAtICAgICAgICBkb21haW5fdXBkYXRlX25vZGVfYWZmKGQsICZtYXNrcyk7DQo+ICsgICAgICAg
IGRvbWFpbl91cGRhdGVfbm9kZV9hZmYoZCwgbWFza3MpOw0KPiAgDQo+ICAgICAgcmN1X3JlYWRf
dW5sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7DQo+ICANCj4gLSAgICB1cGRhdGVfbm9kZV9hZmZf
ZnJlZSgmbWFza3MpOw0KPiArICAgIGlmICggbWFza3MgPT0gJmxvY2FsX21hc2tzICkNCj4gKyAg
ICAgICAgdXBkYXRlX25vZGVfYWZmX2ZyZWUobWFza3MpOw0KPiAgfQ0KPiAgDQo+ICAvKg0KDQpX
aHkgZG8gd2UgbmVlZCB0aGlzIGF0IGFsbD/CoCBkb21haW5fdXBkYXRlX25vZGVfYWZmKCkgYWxy
ZWFkeSBrbm93cyB3aGF0DQp0byBkbyB3aGVuIHBhc3NlZCBOVUxMLCBzbyB0aGlzIHNlZW1zIGxp
a2UgYW4gYXdmdWxseSBjb21wbGljYXRlZCBuby1vcC4NCg0KPiBAQCAtMTAwOCwxMCArMTAxNiwy
MSBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGNwdV9jYWxsYmFjaygNCj4gIHsNCj4gICAgICB1bnNp
Z25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpaGNwdTsNCj4gICAgICBpbnQgcmMgPSAwOw0K
PiArICAgIHN0YXRpYyBzdHJ1Y3QgY3B1X3JtX2RhdGEgKm1lbTsNCj4gIA0KPiAgICAgIHN3aXRj
aCAoIGFjdGlvbiApDQo+ICAgICAgew0KPiAgICAgIGNhc2UgQ1BVX0RPV05fRkFJTEVEOg0KPiAr
ICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA8PSBTWVNfU1RBVEVfYWN0aXZlICkNCj4gKyAgICAg
ICAgew0KPiArICAgICAgICAgICAgaWYgKCBtZW0gKQ0KPiArICAgICAgICAgICAgew0KDQpTbywg
dGhpcyBkb2VzIGNvbXBpbGUgKGFuZCBpbmRlZWQgSSd2ZSB0ZXN0ZWQgdGhlIHJlc3VsdCksIGJ1
dCBJIGNhbid0DQpzZWUgaG93IGl0IHNob3VsZC4NCg0KbWVtIGlzIGd1YXJhbnRlZWQgdG8gYmUg
dW5pbml0aWFsaXNlZCBhdCB0aGlzIHBvaW50LCBhbmQgLi4uDQoNCj4gKyAgICAgICAgICAgICAg
ICBzY2hlZHVsZV9jcHVfcm1fZnJlZShtZW0sIGNwdSk7DQo+ICsgICAgICAgICAgICAgICAgbWVt
ID0gTlVMTDsNCj4gKyAgICAgICAgICAgIH0NCj4gKyAgICAgICAgICAgIHJjID0gY3B1cG9vbF9j
cHVfYWRkKGNwdSk7DQo+ICsgICAgICAgIH0NCj4gKyAgICAgICAgYnJlYWs7DQo+ICAgICAgY2Fz
ZSBDUFVfT05MSU5FOg0KPiAgICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA8PSBTWVNfU1RBVEVf
YWN0aXZlICkNCj4gICAgICAgICAgICAgIHJjID0gY3B1cG9vbF9jcHVfYWRkKGNwdSk7DQo+IEBA
IC0xMDE5LDEyICsxMDM4LDMxIEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgY3B1X2NhbGxiYWNrKA0K
PiAgICAgIGNhc2UgQ1BVX0RPV05fUFJFUEFSRToNCj4gICAgICAgICAgLyogU3VzcGVuZC9SZXN1
bWUgZG9uJ3QgY2hhbmdlIGFzc2lnbm1lbnRzIG9mIGNwdXMgdG8gY3B1cG9vbHMuICovDQo+ICAg
ICAgICAgIGlmICggc3lzdGVtX3N0YXRlIDw9IFNZU19TVEFURV9hY3RpdmUgKQ0KPiArICAgICAg
ICB7DQo+ICAgICAgICAgICAgICByYyA9IGNwdXBvb2xfY3B1X3JlbW92ZV9wcm9sb2d1ZShjcHUp
Ow0KPiArICAgICAgICAgICAgaWYgKCAhcmMgKQ0KPiArICAgICAgICAgICAgew0KPiArICAgICAg
ICAgICAgICAgIEFTU0VSVCghbWVtKTsNCg0KLi4uIGhlcmUsIGFuZCBlYWNoIHN1YnNlcXVlbnQg
YXNzZXJ0aW9uIHRvby4NCg0KR2l2ZW4gdGhhdCBJIHRlc3RlZCB0aGUgcGF0Y2ggYW5kIGl0IGRv
ZXMgZml4IHRoZSBJUlEgYXNzZXJ0aW9uLCBJIGNhbg0Kb25seSBpbWFnaW5lIHRoYXQgaXQgd29y
a3MgYnkgZGV0ZXJtaW5pc3RpY2FsbHkgZmluZGluZyBzdGFjayBydWJibGUNCndoaWNoIGhhcHBl
bnMgdG8gYmUgMC4NCg0KfkFuZHJldw0K

