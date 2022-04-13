Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01D4FF840
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 15:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304164.518741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedVy-0001fF-B0; Wed, 13 Apr 2022 13:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304164.518741; Wed, 13 Apr 2022 13:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedVy-0001ci-7Q; Wed, 13 Apr 2022 13:58:34 +0000
Received: by outflank-mailman (input) for mailman id 304164;
 Wed, 13 Apr 2022 13:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxri=UX=citrix.com=prvs=095d3edda=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nedVw-0001ca-2w
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 13:58:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc002758-bb31-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 15:58:30 +0200 (CEST)
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
X-Inumbo-ID: cc002758-bb31-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649858310;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CByQ9muaD65LqCjjKGHJMLaPvxP5hjEItaC7vwN6cXY=;
  b=at7nKIPtpYk9W+i8NULyXHFltfLSz0Z9a5NdmpiwaCfWJgmzn3fGWwPh
   jhrnh4AVKYzsJjG87xDSBkz6RYQY8yM+mnZvaKy2tsxTdqrI5Tps3HTcT
   wNWsx/LGEruKJ31h7IXdPQ1bEzHZMc+LlCziuKice3YcfrsxkvLvv7n4I
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68803426
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ErJ3aKisk0RzBldDEj363ANMX1618RAKZh0ujC45NGQN5FlHY01je
 htvWj/XPKqMajSjeNskOYWwpEkP657XmoI2TQE6pSw9Figb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1rW4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQN5NZPtsvgBajgGLApxJotGyZGYG1Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiON
 5JCNWAxBPjGS0BmPwwrBJYFpcihwWPwSSNKqlDSpJNitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEhPLLnC79cJIfEvu/7PECqEKX7nweDlsRT1TTiee+jkmyStdOM
 Xse8yAlrbUx3EGzR9y7VBq9yFactwMYc8pdFas98g7l4qje7hudB2MEZiVcc9Fgv8gzLRQA2
 0WVhdrvCXpKuaeMVHOG3r6OqHW5Pi19BWwPey4CCxcE6t/LoYcvgxaJRdFmeIalg9uwFTzuz
 jSiqCklm65VncMNz7+8/13Mn3SrvJehc+IuzlyJBCT/tFo/PdP7IdzzgbTG0RpeBILJRWegl
 mQYounA08sBFreNpQLSesxYSdlF+M25GDHbhFduGbwo+DKs52OvcOhs3d1uGKt6Gp1aIGG0O
 Sc/rSsUvcYOZyXyMcebdqrrU6wXIb7c+cMJvxw+Rv5HedBPeQCO50mCjmbAjjm2wCDAfUzSU
 Kp3kPpA715HUcyLLxLsHo/xNIPHIAhklAs/orihkXyaPUK2PiL9dFv8GALmghoFxK2Fuh7J1
 N1UKtGHzR5SOMWnPHWGodRLdA5WdiNmbXwTlyCxXrTSSuaBMDt/Y8I9PJt7I9A190irvrqgE
 o6Btr9wlwOk2CyvxfSiYXF/crL/NauTXlpgVRHAyW2AgiB5Ca72tf93X8JuIdEPqbwypdYpH
 qJtU5jRXZxypsHvpm11gW/V99c5KnxGRGumYkKYXdTIV8c5GVeYq4O+I1OHGetnJnPfiPbSa
 oaIj2vzaZECWx5jHIDRbveuxEm2pn8ThKR5WE6gHzWZUBSEHFRCQ8ApssIKHg==
IronPort-HdrOrdr: A9a23:BYsV2qNE5xOSMsBcTqKjsMiBIKoaSvp037BL7SBMoHluGfBw+P
 rCoB1273XJYVUqOU3I5+ruBEDoexq1yXcf2+Us1NmZMjXbhA==
X-IronPort-AV: E=Sophos;i="5.90,257,1643691600"; 
   d="scan'208";a="68803426"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGQn8F9qbQKAWQOXmwg8Mt1ZjFsVHkou1kXraSgQ0UF6VFgGhDvu8MnEcuBo1tzlqQK+w8uKA0NVfd/DQa9SI2kXOBMhPVC09tsyhtl4VHkhbJwqZxF5v2d0XAbHt3PbsRysUz4pLBAtSJSE0RNG1Qx4l3Oe3emYDokYCWo6fCUa04Wo/Xd8t+XAMDyAOPLqo0M7a/AZ46uMvOsEHTT3M8dgJZKoTE1MZ6YkUo3YmZcRZBuAAfpte0sYpT5w+BVZVlpMH3C+eeH6FXxbfqD26jjEeItvaVE9C8ODdbRmI2Pz+t8GsQEsFNdYCMMZyLr78kt4A6tE9zMBOWSKsb9WmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yijyodCYhp0irwzOqbT7mgex0fM4CkDeesh7WA4yTkU=;
 b=NpxF7BKoqD+/sTKLDcTFlPyC4rdkQp9hlYkfCdrpuxLVocCqmfQ+xQMsxQwW5Q0loOtmn1gvPsV7DT/qcMap5S2nU6pxc89dmRWZd4tRO94DxQVOZKhjlDxtz25LG8/wdOcLXPkk452G5ODdUgE9pVcFXhrL/+dnGVUPVEU2bcu/byF8aMRx2iQY22qKmImzeUYwHT6vKS8lXVBBvKEKF+lonR8s1IRTPTjzRVMtdnNg80QPf1E/tznDnfpo4izI1SQJnCCs3TvsmJLg7Ce6HyJEA3FFobOMQY5Hr5olXYb+//diYlXmFIBuA6ZuWN09zapAlPwDqjwT2RhTA3ux8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yijyodCYhp0irwzOqbT7mgex0fM4CkDeesh7WA4yTkU=;
 b=xQcDny9/dF9nslaVKOxKJP602ZRqgUr2s8DnC/ZrX+HR91cgtfJbHd30zEHqJdHGRcyyW9CYBBp7/9AjuLSV5URxoAPw7+9eV4lBymzBlpiQgBY+JqVB9QzMVBHGara0XSeO41E1e2BGTzx3fSvhEe+d6HnGObS7+EuBiaPBOZ0=
Date: Wed, 13 Apr 2022 15:58:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Paul
 Durrant <paul@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Message-ID: <YlbW9dKU8MEeHlfz@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
 <6F9FAAD4-59FF-4D52-B08D-13E3920B3925@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6F9FAAD4-59FF-4D52-B08D-13E3920B3925@arm.com>
X-ClientProxiedBy: LO4P123CA0141.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93533928-bb6d-4998-f31c-08da1d55a9c8
X-MS-TrafficTypeDiagnostic: BY5PR03MB4981:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR03MB4981900365874144ABEC95208FEC9@BY5PR03MB4981.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xfAZhROJZcXgcsJH4G99Dg7a5hFSG77rdbvBl0X3ZPQsZUhZ+TTiqZWotKG7XseqJFyHPN6IsnXn6GJy3Obp8JOMMq/tjfwvKfqEU4nIr9G1HePyg8WbIxQnMTEWvqo6jgRdyhnmsaW0NihukqcYSFsPynxrOwNTbYQJIrAx/ZPzhfXcsg3DaQOx2Zg+1yVTmLhgQvlZvugI7A6VgLhKuRYgEEpV1qpblB3QIwe9C+TRc+X1TMN604qDIfmefAv/oxuYgHTE8+x8Nzxc2LBdB8GOifpdLlT65amlGD61BlbM4Wbe0t4x6YwR+RCBa8kAiEDD5m+T3mK0cR2r0n7J9c/snpLWK2VSPynuQp+XI24KXGXUbQWOyWsPIU0oGZ2EzX0uvDjy3AN0SPeRnbyioqsL1PSv7NaT2warZGzkYBbXeHOgWVqLHNpdNPEhLj0q5o8gEqTipfbLOQ0X8iBwLQEseEkvTIcW/TL2WbHC7CqbtOhX43XofRMPJrQwy+MzeCLGOLWRnj79ktslyVvqBK5sT4kfoldMI/vu2H917CAUZkCV1/SqAMgRtBao+yiutCpPHgg3s7qQfQGogdskUlW9Ci36+u//XeWSpQC+67lfuWUhmp7mNzE+y5cumKTGAA6pz2u+uz85Tw94PUCMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66476007)(66556008)(186003)(4326008)(8676002)(5660300002)(2906002)(6916009)(53546011)(66946007)(26005)(54906003)(33716001)(85182001)(316002)(6486002)(6512007)(9686003)(86362001)(38100700002)(83380400001)(82960400001)(508600001)(6666004)(8936002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0xPbThldVRzNWE4QjhzTWY5enFydzM1NVN3OVhydndPWGxEOXp4akhpbGlY?=
 =?utf-8?B?SzVCZ1NpNG5lK0tiR0kxTUVaZFEzSndiRU90SXJka1dzQmJaRDU0Y2h6N0hw?=
 =?utf-8?B?UG9FaHhlMmY1Nm9EN1lyY2UxWUJ3QU12aEFGVFA5VHh1YVlZODF4MmZGMnlt?=
 =?utf-8?B?Wjc1cXA3dXhQQUFSSUxWNUxMbFBxRFI2QlFYMy91ak9acDA2WEJVeUZtUlhy?=
 =?utf-8?B?WlhWOWNEOVpjRmtrMXhYeXc5L1ZDOGZVZWpiWXZpcDN0bWg1NHNvNFJWSEdV?=
 =?utf-8?B?aWJqcVhDUW14enVVaEg2QWVhMk1BMi9DdVB1MVNHTjlOOFpNOFRJQVFhNXVE?=
 =?utf-8?B?N1c4WmxoWFhXTWUzQVJlT1VrYWxoQVo0N05MSUtQRzA5Ym5oTmN1L2RVdWtR?=
 =?utf-8?B?YTB1Mjk4THYyM0VlVXFObHd5UFVPdk1GUmRWOUtLcHhWaG9JWG0zWUJFOW5D?=
 =?utf-8?B?QkJGczNEZDJOc2pkSjVkdmdHUExQdElucmFSY1oxT08wMkZSV0JwL01Ddm1K?=
 =?utf-8?B?TlNDTGI1eS8xV2lWSHkzY042cFNRNmxuV3ZVa1hYdW5neUsyaVRVc0x4ZTlT?=
 =?utf-8?B?dDU4UWxOZ3l6eFhsVGZQc2NFY1EvSG9sUWJNa0R5U3VHaWRpYmtzSDAySkdl?=
 =?utf-8?B?OTFkZHVrK25vMHpsZGV5VU9vaWxST3ZWUXVJOUQ4cHhvUW9rSHdsM3ZwL3Az?=
 =?utf-8?B?NmpJSWVNemU2N1h1c1FWQ2VIbVRIZFpadzV4QXA5bjN5dktrSmdEWVBkeEtX?=
 =?utf-8?B?UUYrSnVUK0oySWJRSnZVTHlwVEpvNTIvcTErNjBWcHpVNHFBUTAydWFRL0lh?=
 =?utf-8?B?RUJKUGdZc0hFck1aVUwzbjA4U0lSV3RHVCtJVkozRGdMZ1VWOUZaWDlMdjE4?=
 =?utf-8?B?WlV5V2M2Z3pKOTU2aXdqY3A5aitqWVJCeUtEYk9hQ3dYMzVHRGRseXVmNHVj?=
 =?utf-8?B?VVcxWG5ZOERlcVd6Qjd0N2ZWV1V3eCsyOUtvekJObEhIazhuajlhblpuQ0Vh?=
 =?utf-8?B?cmIyUHlrcDFIeFV1VHoySmtQaDVYMngwcWtoY0ozbFlPZ2trSTF6NWpoUlVt?=
 =?utf-8?B?Mmt5em9hTVpBRnk4Qnk5eEF1R0Izc3BtcUtGd2ladmhXaTEyK2k4aUpobW5j?=
 =?utf-8?B?bW5rTEREMEJzQVFRTWIyQk42dkhHbVI5V0hjQ3RKdzJtbzBmQzdRR3hTd2ps?=
 =?utf-8?B?YU5nbHdaS1FnSGo2TjBjUjdjN2RiS3Byd3BjSGNSOFR1MDJVb1FXR0xUYW02?=
 =?utf-8?B?RWVOYUZSUVM1MytFWXBBbWdsUmRLN3VEQ0JOUkdTZmorVFlOM2ErRXJUUkwv?=
 =?utf-8?B?aDZzcFVUalppeFV2RktRRlRWalJkd29TVzRhR0lRL3Bpc2VEL1J2ZnlrbnFG?=
 =?utf-8?B?RVJVYUxVbVVESnovaWlZT0NSd3lhZWFYSkwrZHpqVGRtRGtTRnQxWjA3T3d3?=
 =?utf-8?B?SXJNT1NBOEY4VElFdVY0SEpQeGVuUVRxelZsRmdXRVUwZERNc3NLRDFiemJr?=
 =?utf-8?B?UWVzVEF4VDdWQ1ZybkNQdVhpMk03eVFDdjlaaFpmSXZQbzFWWTJRTmhVNFJq?=
 =?utf-8?B?T0dWOGFXZUpBK25PQ3VuaDRXUThMUG5Mc1BGcHE4S2JISXBkMUZpVE9zakY0?=
 =?utf-8?B?Q1IvYmV3SlJXazErNVVtaHJMWU5pQ1NYOWVFdysxTDZyMXVuc1pyOWxnNDg0?=
 =?utf-8?B?d0R2WGJUdzdJWDE0aUREbnkzZDhZdHFFKzBIVjlTN2JsV2pQaFF5akFxK1NC?=
 =?utf-8?B?MnJ0Z3VXdm0zUUY3ajEwMzZrMW1KdUZiNStyQ3dncFM2SDE2enFzYkdqRjlj?=
 =?utf-8?B?bm5aSmF2bWo1Mkx2R1RhZFBuZlhSWHRXbmlMTWh5a29oUDBRWDVkWlpyZWJa?=
 =?utf-8?B?MUJNTEpwd1JsUUNTdGUvemFLODVsa21MNUlpYnYzSGRBRForajlPZWxtRGkv?=
 =?utf-8?B?cXRmWEtrOTY5S0dnQXBmeW1abmJvdi9ESzZLRTBmeFd0QXJOTE5QNXJ3bk9Q?=
 =?utf-8?B?VXZLRW5GK0FXd1JKVFFNc1V3QlU0bUtXenRYempSZkh5czZPYmdYSU5kMXEz?=
 =?utf-8?B?bTIyb3A0blh2MDJaTHFEdnJzbEFwK2c0bFU3dVZ3SlpQMkFGTEphSDZsTTAx?=
 =?utf-8?B?S2VpYVZick9TNXBzNmYyRkhPSFdXQWFBdm5rd0s0Vk1QY083UjdDcHQ1RlBy?=
 =?utf-8?B?Ty9wR2RLbDViVW5RbEVWcWRUbW9abGtDRlVEMFQxaFRCVnVMbXlNeXpYRERN?=
 =?utf-8?B?RnNacUVwZjNadmw0bHMySE1VV01OUGdXeWNEdHZiTXhUYU5uM0dLdWJsR25o?=
 =?utf-8?B?L0lwVHpXUWF1QXBIekgrU1BjYTZGNVNSOWZXZDBEdmZCNjZ6bUg4a3BybGxM?=
 =?utf-8?Q?ERUj51eF/IKbm1nE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93533928-bb6d-4998-f31c-08da1d55a9c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 13:58:18.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdBnww+oZGlcLxI1q9RWUWQRdo81xoBR8V3wgHlOhkTG9UbmeeaRA9kwVIa3bTj5jcTn6YSX9jYdJNL4IDIqoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4981
X-OriginatorOrg: citrix.com

On Wed, Apr 13, 2022 at 01:48:14PM +0000, Bertrand Marquis wrote:
> Hi Jan,
> 
> > On 11 Apr 2022, at 10:40, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > There's no good reason to use these when we already have a pci_sbdf_t
> > type object available. This extends to the use of PCI_BUS() in
> > pci_ecam_map_bus() as well.
> > 
> > No change to generated code (with gcc11 at least, and I have to admit
> > that I didn't expect compilers to necessarily be able to spot the
> > optimization potential on the original code).
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Note that the Arm changes are "blind": I haven't been able to spot a way
> > to at least compile test the changes there; the code looks to be
> > entirely dead.
> > 
> > --- a/xen/arch/arm/pci/ecam.c
> > +++ b/xen/arch/arm/pci/ecam.c
> > @@ -28,8 +28,7 @@ void __iomem *pci_ecam_map_bus(struct pc
> >         container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
> >     unsigned int devfn_shift = ops->bus_shift - 8;
> >     void __iomem *base;
> > -
> > -    unsigned int busn = PCI_BUS(sbdf.bdf);
> > +    unsigned int busn = sbdf.bus;
> > 
> >     if ( busn < cfg->busn_start || busn > cfg->busn_end )
> >         return NULL;
> > @@ -37,7 +36,7 @@ void __iomem *pci_ecam_map_bus(struct pc
> >     busn -= cfg->busn_start;
> >     base = cfg->win + (busn << ops->bus_shift);
> > 
> > -    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
> > +    return base + (sbdf.df << devfn_shift) + where;
> 
> I think this should be sbdf.bdf instead (typo you removed the b).

I don't think so, notice PCI_DEVFN2(sbdf.bdf) which is extracting the
devfn from sbdf.bdf. That's not needed, as you can just get the devfn
directly from sbdf.df.

Or else the original code is wrong, and the PCI_DEVFN2 shouldn't be
there.

Thanks, Roger.

