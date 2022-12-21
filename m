Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909026536B9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 19:59:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468048.727123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p84JF-0003Kb-31; Wed, 21 Dec 2022 18:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468048.727123; Wed, 21 Dec 2022 18:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p84JF-0003Io-0I; Wed, 21 Dec 2022 18:59:21 +0000
Received: by outflank-mailman (input) for mailman id 468048;
 Wed, 21 Dec 2022 18:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbXi=4T=citrix.com=prvs=34759bb5a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p84JD-0002pH-Ll
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 18:59:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91264978-8161-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 19:59:18 +0100 (CET)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:59:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5430.namprd03.prod.outlook.com (2603:10b6:5:2c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 18:59:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 18:59:13 +0000
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
X-Inumbo-ID: 91264978-8161-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671649158;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=t13C45lqPWOkZp3h37qWyVHamFPatIVzeOwOZ5nVNIg=;
  b=ct5XdBzeAiss+OUauI2Ic9Yjf76LhpAh9G6dBQzI8+taglr0cTCUWQlH
   QUtyBEB9gRPydpg7KEWTJ4eYc9GMYf1qiyRkffpcj8S9XJ0JcSFac2JM0
   4kMVORyBrXa4aVMxjZ5URNQCGqFCxYi2GQ+HKQQStNqp1jIAgbrxsJFXk
   Y=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 89546985
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QRb1O6D9gYAxYxVW/xjiw5YqxClBgxIJ4kV8jS/XYbTApDxwgWYHm
 DBMWDjTOKzcambyfN13PYTj8xtT7Z6BndRnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlC5wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxLdrWVBtq
 aYjMG4xNgHetaWmnaqWY7w57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+ewH+lCdJPfFG+3qN3vkaLlzERMj0fSEWggcnkoW2/AvsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaJSkQBX8PY2kDVwRt3jX4iIQ6jxaKRdE6Fqew14TxAWupn
 GnMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgPpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:rwvVgq5wjkaJOEQ39QPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.96,263,1665460800"; 
   d="scan'208";a="89546985"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgQGZYZ/6lfOi4q7F+noddIHuZ9/RlinJHZ1jnJUIxkduvhukTwBXdESTrUcxVgtuGMR8Qk05R63bMLT1WG7i5xo1PGCbSSjEBHAhTewGlg89BrsUrTvNBdFVuVMtRTTvE2ld35056o/RJ3h3ZriuCorbGuvMXXRK1tRqGiRiNXGilhZtAKjTNCJxEj7LFtvSWV+thVrqw+eze6/zQgIsKJMcr9oA0+ViRY4w4/sJPqWvTu5FCltGRBQp0m53YLE1zYrw520PCwKZQrQZ+N1lAP8dPaK5L8QSzU2ZooUULG+Bu/levdZMl8TeZrCHGE6Kc/4Az9vHwZg0U9ErAaWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t13C45lqPWOkZp3h37qWyVHamFPatIVzeOwOZ5nVNIg=;
 b=FW4UuWJpjSAdANnvHVaD+b9jtgrq07hd6vfBJwvH14b2TLUyvFHxakflaEXIQCR9swyR6MGYuMBKXY6JSYwGYmGnEv2NVbkTQct1DSX0ZiNi/6Dhxl/Eo+UdDq+uRbbRzk8t9RRPlFlXCjcXvcnvqRkVTWYOyv/hr8ZEwjK5submJpk48E+fjmGSuDMHXnuOD8A9W3tiOdlgz7mLsM7ycQNspVATgzUTqqpN3/rWcHnL+oqpwf74qdRiBcFNNRY5VrJ3qjX/2A0xeT3Q8bHkrIpnMip+FQyTMOZlr2oDsAGWUcCx2yyy6kmUXlpK8RBXVjbAI42zKj90nt3k8+dkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t13C45lqPWOkZp3h37qWyVHamFPatIVzeOwOZ5nVNIg=;
 b=q0yZIpLBfbRKCXBEmegHpsMIzxbIOJrqsNgkMCmXX2R4CM3VyClKRYlu7HW5L967XH5bIJNWnV5553m/QD+3gwYuOEMKWDRnuaK3YxJJTWt1ZOrFaGrY0+P1y5blzkuf2ng6ObQaiHedUoVT4MpePa2nYIctgJU2QGKGJm+iUPI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 7/8] x86/shadow: don't open-code copy_domain_page()
Thread-Topic: [PATCH 7/8] x86/shadow: don't open-code copy_domain_page()
Thread-Index: AQHZFUAI1WfSPAGHZ0up+t1gvUUhyq54siGA
Date: Wed, 21 Dec 2022 18:59:13 +0000
Message-ID: <fef05ae4-4b24-a1f7-26f6-504c83e543db@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <b218e950-d5fe-8e14-cfdc-dbcbb6a7ebf0@suse.com>
In-Reply-To: <b218e950-d5fe-8e14-cfdc-dbcbb6a7ebf0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5430:EE_
x-ms-office365-filtering-correlation-id: 0c0008b9-f95f-4982-5947-08dae385738b
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8e1c9Vc0ubgZZPGJpzcBxg++bstQlGk9H6c4qAD57tgOmcP4d87WeCM6eL9EdneEeJu9SdvbLHu6wvRlkF+v0Ay5Jxw74YDs6S5hRzsiTs3qFcCZOmYbQltGI7e7udqiBZv67umWNXpQX2xa3fJTSR0U6MVxnCf7fv31ouH8IhTaRmYz1reTRgsiZbQYUDAAwUCrC1QnPHaWg8BWOx1+ChlmVi2JAC0l2CgtUQhHwg3V9vmAfAZY59SsWDviAmx6CE1PylxsjVJQACU0IdKEKIQyGj89MolEwMihRa19ZoDEbeRN1gcijvfVK2eTTuJJygfhDn0FGSjomV2wmCCPh/41N4J3yvSSUCnnuidGlZmN4tMyFJ7fgepFUrT0trotRrUGo9Lwf2QHaPbNAPTginrR2PnVAGNEha1mdHWH6ZN2CiPCdkBNPWu3HStTZgLeCjeUX5pZ4zQIVZLuzjHkD2wj9eJxsgzlf4ozXFBGGGM3gyGsQHjcI0ugVnIv676QTX3MCAumr6x//JC6N+o/IjsuLCatDN3AiNd00mkkza8ODQ4oSMqvC+3lLtQZVW6eEuHE1XJTH1RFNPmbG7ghEwAxxJlv4uA3ydOMP4P3eec/wVoA0UfsC220dZ5ZlvnnQ3uLdasi4DrNO0gCU7xA9q0eQjvKIlmt06p4torLGeOjzEL0qaDbrRmCioEjR8iNXM226km8UW8PE4jmQADaRYXA9CxMYgLrdpfmLfdvrwFKzUbtoaJ4VO5KiHwd6JX8mgdvXgGI87UiD8mIVjoY3g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(2906002)(8936002)(82960400001)(38070700005)(38100700002)(122000001)(5660300002)(8676002)(64756008)(66446008)(4326008)(71200400001)(6512007)(41300700001)(26005)(36756003)(91956017)(66556008)(76116006)(66946007)(66476007)(86362001)(2616005)(31686004)(53546011)(6486002)(186003)(316002)(478600001)(31696002)(6506007)(110136005)(54906003)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aWpwS05OQUR1RXAzRXpFS0ZveGR1M1FWYWxsb3ZZY24vYnRLNlRHV3ppWkJ5?=
 =?utf-8?B?TFFVcDRuQlQ1WlNQcHduUHpLT2tpb0R0STR0QlhENFVER00yMEVBWFJ5ZkRw?=
 =?utf-8?B?OVYydEU3bXBMQVZlT21sWGpVSTRLZmtiNlJ4STk2T0JmdHpZdEZUd1FqN3pS?=
 =?utf-8?B?SmZ4dGQyWURIMDF3dUxibjNTNFE1VFhiRlVaMDFEa2ZJb1lxNC9ldUlxeUR5?=
 =?utf-8?B?a1lXZFUxKzE3RTl4eDFUeXkwWno0Sk1hM0dHd1YvREdkNWdmbDU5bm42SVZ1?=
 =?utf-8?B?L2pjMks4Si9YbnNkWHZwS1hqbzJXelVneDYrYnY0RzlSWmIvaitaVXphQzg0?=
 =?utf-8?B?Rk8zdU11bWxmRzM4eFprbjFETmpzMmpOdkNVam5jVjdKRkgya2VGOW56Yk9R?=
 =?utf-8?B?Si9BV3N0V0FKTVZyM1kySzVaWExMWVZpUEdtTWpPTWVVSjhPMUpabG9iY281?=
 =?utf-8?B?UEJLdmdYNXhXUFQ5ZDl2Z3FGWHczVG9tSkpxeHVLSUVwQ1gxSDlZY2hEY2FD?=
 =?utf-8?B?eXNOSHNYYUs0d3JXaVh2bVdpd3hGVGpOUFBRV0UxZVhWQUxtS3pTSVd4Nkdk?=
 =?utf-8?B?K2JuNk9kVHlmQ3B5aHNaMWtvT3kyRUhuaVh3WnVDRHNwbG5hcnpxRWpoU3hy?=
 =?utf-8?B?L0d5ZnIwZkpLQ1o5c2dFRk9rcTE3NzFaVDQvTmpPc1JKVkZEWTBpeTl0Tllq?=
 =?utf-8?B?bkNvYXhKVnNkQm1hRU1DODJhT1R0cGJ1NHZQamUvY240M3lleUlZT1BOcG9R?=
 =?utf-8?B?Q2hiOVdVZEhmS0R6OVZJclkzSGMxeFJ5aGltMnAwMTdIUGJHTDFoMTNnblNK?=
 =?utf-8?B?M2hQc2UyTDdJblZWNHUrNzZQRGlrUVNWTWRSTTRvRE9KMFQ5VVNEYW9pcnVt?=
 =?utf-8?B?MHdTd1NpSUFQQnVUbmhoOGEwL0ErQ0orVHhQL0RjbVJZeUFyd0t0d0xBeDNK?=
 =?utf-8?B?ODRLR0tqdW1tRjRzOTZQeWlwTENXc2p5cnBzbWhwU0sxVEYzOFZTNnB1a0xr?=
 =?utf-8?B?akRrc01jbzBHK3hSMWVZRllBWVBUVmpHNCttS05tUy9aYlVka3pMT0Qwd0c5?=
 =?utf-8?B?VHpRQ0U0K2xrbWljOVJ0R29NdkIvd3JwZjZ0MERXNzg4NCt6Ymt3dXRDWU5x?=
 =?utf-8?B?ck13VHU5eWZkcFZLeDlUVk5JWFFIbDFXMWlidEtMM3ZJT1kzSnJiM1h2b1BS?=
 =?utf-8?B?aUlZaTlqeWlVMmcrd3RLU2ZzMHVOalp2LzNqcjVFc1BpZ2tYSGdpSnJQZTZD?=
 =?utf-8?B?ODdOWEhBbmFPNzJ5L0JaaXFJRFcraFgrN2t3Y0YybVllWWZHSncvc1YybmR6?=
 =?utf-8?B?WUVIeXZza0dFUGVsN0NUZXM5djMzVjl1ODZvODQ5aGxDMlE4ZkIxOG5jN0h4?=
 =?utf-8?B?YXdpbktIZ0JDWUI4b1hleVk4NnVueXlsSVVFTE9GM0Z2Z0FScEdDaGxSZmpF?=
 =?utf-8?B?TFAxUVRWWXJ2T01tVHhxVFVVUFN3U3BjNk1sYkFiL3FEdU1VKzlvbzhnQUNT?=
 =?utf-8?B?QTIzdURLK3pxeDNFSGJqb2o2OUhqYVR5ZW5zNU5aSnRGQUt1LzNnaDBIdjNj?=
 =?utf-8?B?SlpWZGQ3b2lWaGd6MGR3VldFNUtZOE1QcTRqUUs2RzllK2taUW9Da2hOZVNM?=
 =?utf-8?B?SWthcFJlb1J3Tk5iRDNwMXFQakJzNGYvc0U4WFVyNlVmdDVIUWFQVFJmazBW?=
 =?utf-8?B?V292UWREWGF3Z0h6STdvaWJkVHNFVm9GRUFKNDdadWh0OEhrdmRoQTk2ZkxD?=
 =?utf-8?B?aXdBeUExQ28rVjhMQXVOVUsydE1RZVh5OURLVEJjYW9XT0J5Y1hVUytJSlpa?=
 =?utf-8?B?cnVMK2V2OEFMc3ZqVE1jSW4xYWREK2dyTm9ycldxWjM5WGx5ak0zMGxDTzB1?=
 =?utf-8?B?RG9PampPU1ltd2VpZFQ3SUU2ai9XZldIR3hCUlYrNnNxcUtUL0oyV0NndmxW?=
 =?utf-8?B?M3psQm1JanJ1Sy9OQnlDcWNoU24xRXBqV1E2YmU5a2ZDK1pScWZyR3hDaVRk?=
 =?utf-8?B?R2NyMFEvaW9aWXJXVXVFTGlNQTlRK0o3aUhMcVpTdUM4cVpzMDkxdCtMc2RV?=
 =?utf-8?B?aUJIQnp2bmxITUVZcDlDN2d2aFRQK3lOcHpab3BpUkZXaW9Vc2NaM2Jxb0pI?=
 =?utf-8?B?WjNFRGpnbS8wUVM1NFZ5RW1kRUhwNzFxMk9BcHlWWFBiSlJIL0djUmlaMFFS?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF8B6719A7A25F4BABF55BF82954BAF4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0008b9-f95f-4982-5947-08dae385738b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 18:59:13.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6QXYUYorX8hvcfqKQqMY2yqUinIIHVUkMYggTwcepukEaXPCc1PIOzU+0+Dd5QhVXMuwODRPh1kwgzMyedTJQ6a8iJp5JYzxYE+rpkJ0jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5430

T24gMjEvMTIvMjAyMiAxOjI3IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gTGV0J3MgdXNlIHRo
ZSBsaWJyYXJ5LWxpa2UgZnVuY3Rpb24gdGhhdCB3ZSBoYXZlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

