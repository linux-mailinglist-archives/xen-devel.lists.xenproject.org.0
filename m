Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF93521C5C
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325744.548465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQv3-0007hg-8e; Tue, 10 May 2022 14:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325744.548465; Tue, 10 May 2022 14:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQv3-0007eH-4V; Tue, 10 May 2022 14:32:57 +0000
Received: by outflank-mailman (input) for mailman id 325744;
 Tue, 10 May 2022 14:32:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lKQ=VS=citrix.com=prvs=12295f6c1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1noQv1-0007YI-LM
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:32:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12a23e21-d06e-11ec-a406-831a346695d4;
 Tue, 10 May 2022 16:32:53 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 10:32:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5747.namprd03.prod.outlook.com (2603:10b6:303:6c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 14:32:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 14:32:47 +0000
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
X-Inumbo-ID: 12a23e21-d06e-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652193173;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ju6sxl7BTQQt7i4sdoh/6ePyA/3BMcrJMDf7/lSoxK4=;
  b=KIZsxo0hGSXWiweUhMHkloBHWSRWMHALi/Z7U41R2vR/UJngf9pJSBaB
   01cgR7rRDtmlms9FJJ2rfgcv7cwXrr3g+q9UOKw9LKoUts7YVc2BVDs9D
   KEBSY0gajsIL6lNg9FQOL99BySpFm5clrnrK8LGA+ZHTSCZPOCilDtj7M
   c=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 71388041
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZnLAdaj2vmD8CwFJ56N65zu7X161WhEKZh0ujC45NGQN5FlHY01je
 htvC2vSMquMNGqnetskPYripxsA6JXTy4RkHQNuq3gzF3gb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrV4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTwLI4HxnNgQaABnKnAvDbd5yLnJL1Hq5KR/z2WeG5ft69NHKRhueKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI8ehW9s7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJoujODnFQtidABNvLvS+asVMkLl3yF5
 XPK0lTEXR1KDt+2nG/tHnWEw7WncTnAcIcbDrix7PNpqFyV2G0ICRcSWEe7oP+2kUq3UZRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC/
 l2Um9LkAxR/vbvTTmiSnp+Pti+7MyURKW4EZAcHQBED7t2lp5s85jrQSv5zHajzicf6cQwc2
 BiPpSk6wrkW08gC0vzj+Uid2mrw4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1UdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:vHxho64bKIZ8oE3NvQPXwVuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJXa
 Z1oaF81kqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFz9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcwa+d
 FVfYDhDcttABOnhyizhBgt/DXsZAV/Iv6+eDlNhiTPuAIm3kyQzCMjtbkidzk7hdcAoqJ/lp
 r525RT5c5zp/AtHNNA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="71388041"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQUb91l8e0jofSDqjsN9zOy8mAJcnqyJHmTcNlv4C4QQsyi6vM5GSfC9l6Mf3caONM824zdbwKwK5v2RbPLqJFCiGTBnzcsTiD8jjpcuHq5x4M7VdBEBz9XOCmHeEHg4XAMDN+5b2H5GmLNEzdtq13K0CVxcgJ6JVWDgkKSPvaGvSV67b+cddz0Xd1o9hb/ZnlIncycTQEZ2R0ROEWmZSWboaKYUDZq39KbfFcBJLOJ9ZhJEW1YFoxXrpGaVG8cTUVQpw/UcoA7l0GIq/qI8fMKfuh0WeAVEdn9mTQ24furbPWDHEYb4EkCJgYNfORg4R4cT3uC/PYbYbL+O8adHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ju6sxl7BTQQt7i4sdoh/6ePyA/3BMcrJMDf7/lSoxK4=;
 b=SY7fb6OX6JMD+fc2Q0QCctBkKEMzpVdv0fs4vv52jDK5S6eixodn2I+R6Pxa/ipQSqdNEeCcNII+0y+wWn6NNMnQ0PP7Qck/Bkmqyg/6MJ0CisLEvQnu+YY4lmRubTjYExfKxZ/JrYTangKvyybO4AnUkHcU2V68Pj9Xv7jz8t2Ke9h4QSPh3hf9sqBt1SF1MTmBjs3TtkUa/P0oj/8fgUv3o+9Ijrzh6bxLJkG6BTybI44Gua0rsI8geeIIsZ9HHso4mcY/Nw+vYrxwKbz1NvbhoJzQJ16FN+qY3YJPDKskD0YnBqwvEYqgQ+OgNsZjh1/ax3+BC1rUCgzs/geQDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju6sxl7BTQQt7i4sdoh/6ePyA/3BMcrJMDf7/lSoxK4=;
 b=PtWJjVammeqR3YBPNQ1DafOYpD8Ymf0QuGa0t3H2YbLwiChY5v3++T6ljyLeTqNJvjpmvM50CAiDo+XSf9QluFkJUdU4+Zl9WnIvKhlttcItitWlx9+SUqAbQm4VcHF0tWGobhSeet8Kee7rPs6FF4ts/iOclh8jbOV1g1QBn94=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] ns16550: Add more device IDs for Intel LPSS UART
Thread-Topic: [PATCH v2 2/2] ns16550: Add more device IDs for Intel LPSS UART
Thread-Index: AQHYZGTwry5z7hjdYUSw2m/jzUjDja0YLNcA
Date: Tue, 10 May 2022 14:32:47 +0000
Message-ID: <065c1ae5-d25e-5939-38b0-3473d57dbfd6@citrix.com>
References: <20220510115546.1779279-1-marmarek@invisiblethingslab.com>
 <20220510115546.1779279-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20220510115546.1779279-2-marmarek@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08b774bf-5329-4e3d-3b6f-08da3291f3fb
x-ms-traffictypediagnostic: CO1PR03MB5747:EE_
x-microsoft-antispam-prvs:
 <CO1PR03MB5747350538838168B35DF776BAC99@CO1PR03MB5747.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jOkG6lN/GIhuoUGPlqbPTeOG/pWTx1oiyXrYD1e1qfT9+tcgdWe47c+WacAeElmFHjE/apye1K5uJJXgJBTyDo9jamlbbsUiRl6jPIve/KV2oS8bi3LcXjNzdPLnYJm+0JgC6+wXassQFFLDLWXVX+LxVVHqhga9RNQ5IgOJhA6TPaq8ZqD6p932vxZgrftQq2WDxNp23/FwFds+vGcZ0Bkzq7pz/mKvjM0KqsN81KrjBIY6qOj+qEAclqlrkD0NuwH9Xbod3uJuJI40q3NHKB9/ony9Nxp6RvJ2UzWbxzbCUdxf3Puyl8sUtnItRfFAC3cepAl3rYxVndd4Lv0n1+YIMO3Os1npre51FyB6aERQNgXWRUfmn7eYheWcdcWSowvP5epbF3PlTlEmz3Vkp/HRCeZb+7VFxXDrT23CwbvWwoPJuM/jpI/MjF2j7nDLbOACXOyoeK8DoU1tuw+bucgt5djQmENPIR9EU2xkzM6JADWADK0rTh7qeHx1F+5xtlE20CVsFlgCdrZfawjzvhSyN26H1DIOFqEVA9FsajR08mkOUcQlGGGYpPohww2jaUmFu77QMehmwwE1EhA6V6Bu+uBcjxv+cECgsM602eD5y0x8XGO/P7Tzj/a9+jMUKaC8BleXLEfK0SWalevJnwGLgCV1OhyYy2qc8VK0AIxmkkhHLDUoz6X2w9qHHAdR/akHhquVolB/3k6/7eywjRcFB8cTzXtupwSYTa+srV220k71dDyxY6Dqv75BYVsUjD9+eDu6JtAuG/PfhLk1rA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(31696002)(26005)(66446008)(64756008)(71200400001)(4326008)(8676002)(2616005)(6506007)(53546011)(38070700005)(8936002)(508600001)(6486002)(86362001)(2906002)(66476007)(36756003)(5660300002)(54906003)(4744005)(31686004)(186003)(110136005)(316002)(66556008)(66574015)(122000001)(66946007)(91956017)(76116006)(82960400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THpaUHFYZHNmM21kK2oxbnNheW12MldNdmg5TGh1TTB3bjkwSEgzTHNTSDNC?=
 =?utf-8?B?K3Q2T3ZxNHo3ZHJCeXhpTHRBd2JUNjhiLzdhSnZuQjhwVnlEamkyTzJnMXF5?=
 =?utf-8?B?bVBvUzExcHphU0pxSW1RSDVVVlBqdTluVWhrbW9vVGt3M3p0V1VKVlRMRTk2?=
 =?utf-8?B?ZmRwM0FXOHUwQ1U4eWZaZURHeUkxS2d1ZlY5RnExV3Fqdys0K3lscVNFcDRD?=
 =?utf-8?B?UFYyK3hWMGlQUXMzMExkY3NJL3Y3aVdqdHpsbENrSmpMK0cxS05PaEZ5Vnh6?=
 =?utf-8?B?d3FndHBrSFpMckRiZUtvSHNjSTMrZ2pRNGN2dGZuUmgrclAyODhoTEcxMFM1?=
 =?utf-8?B?SVN6SXdFVlh5Vks5UkJnbG1ucGY4SEIvU1plNDdFOU9uSEJHRjgwZ1I4Yjhk?=
 =?utf-8?B?YklDR3EwWk5qYXE2ck1PYWdoenNZZ1VLclExc1hJZ0dDbGZsbkkyalVoZW9J?=
 =?utf-8?B?QzBRQWtMWTA2eGZrdysrWWhOR1FNOFZiYUFxeXZSY3NlbEp4cHRLcTltVHQy?=
 =?utf-8?B?QnE2T0VmMWdUQzlLK1hPSUJFR3RoRm9RM0N1QUpIanRKSWtCQk9TWkZNRjNm?=
 =?utf-8?B?M1o4SThWRkp3cktLMkNBYU1ESmpwdkpsU1kvdUxEL0t6eHZTWDJMM2RzSmlx?=
 =?utf-8?B?S08vWXY2SWxqZHRGWW8rbG95ckFLeDdpUzJScW56ZnNBUVBNUktwRzZLZjg5?=
 =?utf-8?B?UXAzZHVlOTFJSFAzdUhubVVERlc0TDljak4zaDhIVllYL0h4cURoWUtnNW5z?=
 =?utf-8?B?ZUV1M21IaEFTMFRkOXM2NkxXVDBvbEFTUTNWQU9vald4N2lkem5DQ0tUZUR4?=
 =?utf-8?B?cFJjOWRyUWRtbXpVc2lZUFl5blZ4eC9xdVdIV1RMOGkvNGZ3czYydzVzS3ky?=
 =?utf-8?B?bDRieFNZMVdNZVpqTm5JVkNiQ0NqdnhMNkdmNzJVczN6TmRCVzBoNCthOTFO?=
 =?utf-8?B?N01hczZaZnVDcEkycms5UUFkTGRmdzlWb2tyZSs3TWtlSWVCT0czRm4xNGVV?=
 =?utf-8?B?NW93WjdmWmVHdXBMbmN6N2RnNnNzaFRFMDV6bVFabGoyYnVlOWNRZUNVM21r?=
 =?utf-8?B?ZG8xVTRCelZDMG94RmF6TUFoWnk5RzgzQWdnSDZscldEUm1taGNIaFZRRUhX?=
 =?utf-8?B?amQ5SXVKMjRWbHRjUTBZMDJyOXFqU0pkaVFaRVppYUswd29aRzRtWnY5NE5R?=
 =?utf-8?B?R1dvOVZTQkduNTFYeTYvWjMzSC9MNWFBdzl1VlhUQXNOemdxcUUrbGk2SnpZ?=
 =?utf-8?B?ZW1rS2pVU0RVUHBIUTdvUVpKVER3S2E5QjVIRG9hUi8xR2UyV0hGbFBSSjVp?=
 =?utf-8?B?S1BRV1pXY0swM0dvTzBpWm1VYlJJK1FVZVN2NEF4UlJYR1FVWHFQU3VKNDg0?=
 =?utf-8?B?UzlHcWdDVXU2NVhUZFg0SWg1eXFHZXRpNU01TWY3WGFXbEwySEU1SUNmclJE?=
 =?utf-8?B?S3dGZno5TmRhaU5USkpZc2hrbXNTRXM3V3pjdWpicExySS82czVxUzNJS3lU?=
 =?utf-8?B?V2V6NGhKT2NCeDRGRG84eEdSYnhJVHJpTmxPVzJINElnSG1xWnFKMUpkcCtZ?=
 =?utf-8?B?Z01TeWJGM3htd3N2alRFanlmZFpKSEJuUHZpWW1lWU5xOUc2Z1JYRG9KTEVk?=
 =?utf-8?B?VnFEWW03RFVwd2NGRkliWUgySzNseS9kUDlkMTdQVUltcENpMjdQTHhPNzNa?=
 =?utf-8?B?N3dTanBwblRCQ21VQjlpa0hEakpTa3o1cXZMaVJFQzd4blBNTnhhTUJXaHlZ?=
 =?utf-8?B?cVZuZ0ZNV21Qd3ZCWUwvM0RVNWMxbWUwR2ZnSlpLK2V4UmFGMm1sREc3RXM2?=
 =?utf-8?B?cDg4aG1nZlh3SnlWcURwVFBoYmRmRjl0U3dtZ3Z6TmZOcnZnS21XRXFFazQx?=
 =?utf-8?B?dllsN0hCdkJQenlzeWlwM1hSSTFmd0d3ZncyTFVjT2VTV08vRHFlOElsSkFv?=
 =?utf-8?B?aUtSNFV1MS9mNDVxbEVEMG54WUJkVDd5ZnU0Kyt5andDQkFzR2RacHdGdlgv?=
 =?utf-8?B?QktEa0lTeWFCU1JVYlNnaHliaGNLKytzNnVEMFF3OURoT2VKVkU2cWtSNU9P?=
 =?utf-8?B?aXRqYXd0LzdMeUdTVE5BMTFzQXA1dUFnd3p6QUlFVUl0QUtyWTJoeTlCeGcw?=
 =?utf-8?B?TWtMVHRmVU1HNHdZWlpybDJVeDM2enc5cWhTdm84VnQ4TEFMQ2thOE5JdWZa?=
 =?utf-8?B?RUJXM0IvTVExeGRGZzB5eFpWbXVLL1FhR2dQdG8vNTNqdFhWaStyTVBqUWpu?=
 =?utf-8?B?OThWOCtqbUxqUDdqQkdHQWR5WmE1LzBjQ29wRTVoNzdjZmxFdWJ0eGwvTnNl?=
 =?utf-8?B?K1BVOVhQUCtJOVVlR2xVVjhLRTVvdUZ4ZmtVZGNJL0Fkc0cyNlhKSGtaT1lw?=
 =?utf-8?Q?8xNOA0rM0pEHHX+4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <946070373A46374FB4ACECD1E46F1497@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b774bf-5329-4e3d-3b6f-08da3291f3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 14:32:47.1009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tKg8efihyn3epM8JZqQ+oRruPyAWpRigYqtGLRNxn2DHs3jk34Vj+1oTdaUGKoNXkk/7JHVHROWxFXBRoZhvHK+HgXB4N2giAmJm7q/A4Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5747

T24gMTAvMDUvMjAyMiAxMjo1NSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0K
PiBUaGlzIGlzIHB1cmVseSBiYXNlZCBvbiB0aGUgc3BlYzoNCj4gLSBJbnRlbCA1MDAgU2VyaWVz
IFBDSDogNjM1MjE4LTAwNg0KPiAtIEludGVsIDYwMCBTZXJpZXMgUENIOiA2OTEyMjItMDAxLCA2
NDgzNjQtMDAzDQo+DQo+IFRoaXMgaXMgdGVzdGVkIG9ubHkgb24gVEdMLUxQIGFkZGVkIGluaXRp
YWxseSwgYnV0IGFjY29yZGluZyB0byB0aGUNCj4gc3BlYywgdGhleSBzaG91bGQgYmVoYXZlIHRo
ZSBzYW1lLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

