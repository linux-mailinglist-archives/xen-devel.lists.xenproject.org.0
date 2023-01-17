Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE766E7B4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 21:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479809.743878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHscg-0003eF-0l; Tue, 17 Jan 2023 20:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479809.743878; Tue, 17 Jan 2023 20:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHscf-0003bx-Tx; Tue, 17 Jan 2023 20:31:57 +0000
Received: by outflank-mailman (input) for mailman id 479809;
 Tue, 17 Jan 2023 20:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHscf-0003br-3T
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 20:31:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faaab40b-96a5-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 21:31:55 +0100 (CET)
Received: from mail-mw2nam04lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 15:31:52 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5036.namprd03.prod.outlook.com (2603:10b6:5:1eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 20:31:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 20:31:50 +0000
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
X-Inumbo-ID: faaab40b-96a5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673987515;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZMWaRjhc3+GSYJUKhEBkyEpFF87GRxHX285lgwcegbI=;
  b=YE4dxyR/4DNSWSFVt0ihkm6KIF/aXU288aUXQwQKst8RwJSMRzplhtPN
   cvVvyYYy0buWJdr9yNOmcgGA3CF2VnzFjKvVxVOz57oncFIuQK5F+STs2
   YQqo0UlBXjVNbPQipT/BUmAI4hcIfcVIFLnJgZ+alF3a1J+iJdEl3f31/
   Q=;
X-IronPort-RemoteIP: 104.47.73.177
X-IronPort-MID: 93473961
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:usQaWKMuB0dVIMjvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUp31mBRz
 zAeUDyPM/rcZ2ameop3aIzk9R5T6sKEm9UyHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5wNmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s9wETBx8
 qAHEhMmSzqYvNvsxbiqUOY506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujeMpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexn+kA9NMTdVU8NZgvFTU+GsZFiQQC1i3saaw0HG6YtV2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBSBRf5dDm+N03lkiWEYklF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:dbT4Pq7vWvsCevxx1gPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="93473961"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBJURmkCth4bD4CjNRROwCF84i9FfS412mVLLz+LFqDMdx+Mo1lIdwemqakfjtOV/9i4+U1yLJRrAZoN2Myl46DtIPqTOlZRKWHPReBoFdP3CInt2VpYFHl+n4im/LRSS2jHaSzRoD4f5UzvjK4354elOJX25/ZphX8bS03lFSeA8cRBMCiHGpjlyJpPbwE0pc4WnPXhGOIjJpllbFc86D1JZ9lYsutMSeDzenAPKqoZimMO3Sseoq27rZtvl7svDhgDJQ11SHwgdp+wZiw2DlbcPFgarPMQg7znFC9kU/1kQeZ2uwl5sEJOIhpHjhFCReAd9CAC0GIrZDh00wtpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMWaRjhc3+GSYJUKhEBkyEpFF87GRxHX285lgwcegbI=;
 b=LWAdb+G6T/DoA5WZ2Tx2BNaT86oqzHtAWzqWj+jT56jvQItQpmAhFeiKBMkPICGd7vB0PRN9ueyTdK0/i2PIZzr8Wp3ES8ZVUxoqvh2FXVZUGaiiMJ8QhmkICdzQiKDjmvdlwuAckI72M7vn9z5wf0qNyb4guVKSFgVbyy8aLVd31grjeFnoqYbHOFYN5d5vaGKM6WGWNqvKrvKLbZ1jg4tkJAFoUYjpf2rLPeoxwXdvlIniqiyZRQ1pEX3BZPl/Qq975zZAoRNz7t/Idhj5/B8UwMvMkMoEUazxVBjLqUSj2uglNf+SdzOU//oP9TmY8ymcQbIhcqmeLDssrB3pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMWaRjhc3+GSYJUKhEBkyEpFF87GRxHX285lgwcegbI=;
 b=sEG8wEUXQtd5joBX6VMkjrvX0wBfwHJARc9iGxk9SehI7CI/6MRc2ujiP6bodpPZsmtdrpfQCywfAV3ofS/fg2Q69HUQ2T1SIhm3bUG/UN9rBc0AsnzUFYBRR+zDiHlHV4ovM6YWHeJniT6AUYBDoRfyDxpbEG9uWxBM+vB7Z38=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH RFC 05/10] x86: update GADDR based secondary time area
Thread-Topic: [PATCH RFC 05/10] x86: update GADDR based secondary time area
Thread-Index: AQHY4449r21jsZmdvU21bR3R1n+QYq6jnlaA
Date: Tue, 17 Jan 2023 20:31:49 +0000
Message-ID: <d0186b8a-652c-60a2-dc27-50c54d9221f4@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <7d814375-c190-ae0b-793b-a8563a23d318@suse.com>
In-Reply-To: <7d814375-c190-ae0b-793b-a8563a23d318@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5036:EE_
x-ms-office365-filtering-correlation-id: dc6d68cf-38a2-47b4-e0f0-08daf8c9dc9c
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dNGHIz3JvzDSyxLlVWtkiVSVv6aD1VtKGNVHLX/aKdY+EVNDEPrxwvGZAMrGH5YZliDwmu+m4ZmB16S1UOU7yA74LoCo7UuCRbwKoya722Eq6N3eVrzxAQEYZBjvFhEySYVQBRNKpLr50qRZCwcvdzTluiOVP4K6olVyUMR7s1fy9iWyrQcSp7diS9I8rYsfqmgc3MrueXX2JYwRDLb7/A7rTTl3NG3UC9PtfGqE6O62JDrVXIo4tI0bVhN+VSEl4cU3rL2HuGxRXQO7w+mjpItJEI4/9m49J2V2KnkNsb6Dm9PZxmYZFKh5fGXchwW/rRYkx9XY2nPF4aNaQPDrlYgQEmvZ0zWjeFGhNHmiEtIjPQHQaXQlkPnYD6VUgOUGbOtXpKV4GIXRxkDX1odIgePNm3EQsgDXR2CwV9y9WVtbq+VSsy9ZV7aQ4VcBiqO9bkO8m3f6ifOn1eq6gVKRBc6Yb3JlMmlm9XBV6jTlCIn9kYWDjEskv/u7469GNhSJtP6SXXFMbW/q7FoOuKnKOIJrMSTr1mb5dpfSBtIJ2LGguTVjz/HVn1FQDpsIavUa8CSIHac9fOTCj7Bn3vlyo0cV5MOfTRVn4tGBugtindmTvLWWdH5NEZpDtIkS77pMDQ+ydnyCzxY+DTrl1Yv0Lx5+CkiyT5Zk/Lct16G2uwkVQp/KIX7YLvWV5q1HP5rzKIA1QfDgvWRDtOmDlrvTDNpfd0dxppe7zXQfmFyZTDFwCaBRwUJKXQES+pe33Eeh2KC+GSbkoK+rftha/X0lIw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199015)(31686004)(36756003)(15650500001)(38070700005)(86362001)(8936002)(66946007)(66476007)(8676002)(66556008)(66446008)(64756008)(76116006)(2906002)(31696002)(5660300002)(4326008)(82960400001)(83380400001)(38100700002)(122000001)(110136005)(71200400001)(6486002)(478600001)(54906003)(316002)(91956017)(41300700001)(6512007)(53546011)(2616005)(6506007)(26005)(107886003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eExEL3RYNWsrYlNWSWlzNFdGMFpOOE9DcWozMTZOWjRlWW56blhmWFB1NWNy?=
 =?utf-8?B?NWRmMGNRbU9LYkZxbFFVdnpoUmhFYTNwTVVYUG5zNHRvRzl5M2VhSGZtSi9H?=
 =?utf-8?B?b2J0SE5BMDV1YmNhT1RFSW51eElRVGh2QXFSMm1vMTE3aXZ2aUlkUTd4aG9S?=
 =?utf-8?B?ZzRQbkllcFdma1dHMDZUdE8wZlZhRmtVdDF6a25rQW0zYUp6U3VzRmFVdkUx?=
 =?utf-8?B?OWZQZlR2QTBIR2VmUEJwblpUOGVpUVMxdUwrQzR4dG9RcmVzWmp0aEVROHAy?=
 =?utf-8?B?aExGQjJreXVSYjFqaUlhQ1FvaGV6aTdlNjZhT0VYU1hQTnFmUGVyT3Y2Wnpx?=
 =?utf-8?B?MFl0ZFV2aWxEU2RqNTlJL2E2OE5GNDNHenpJeHBSN2RjSktmWi9kU1ljbkZm?=
 =?utf-8?B?MXlIQ3RFVUVFM3IyazFoVUd2MXRraktpcjdibTBVOFpBb2dqTHNIRStkM2o1?=
 =?utf-8?B?cHhPYWlnLy9WdTRlSmdLYTVDc2pTdUsrbUpudk9nY1FZWlNXRGtVK0FJcjVO?=
 =?utf-8?B?eW9PdmtXSjNqVitpQ0pUZ0JzZnNUa0gwZWR0d2JzajQ4YVB5STd6eVpzVVIw?=
 =?utf-8?B?L1JYTE1LUGVNL25RdG1oRDMveEZOZzYrblh3WnhQdzRXY0ZwaVplbGN2Y3Rs?=
 =?utf-8?B?ZU9HSnd0Z3lBMmp6MmZkWXUwcytndGttWldwLzV5cUFJV3JST2FFeWtzZm96?=
 =?utf-8?B?b1Uvelc3emhkQ3FoSEx2L09HeExmUmxoZGZpa1llN1N1ZDdFRzNTZGMwMDFs?=
 =?utf-8?B?ekNNWXZmeHFLN1VwRFN4Z09xZUZvYVlJdTlOU0lVL1JtQkw4NHQ3L1o5UWlP?=
 =?utf-8?B?VFN2TFlmdUtXM21tWWtJMUQ1VXdwY2FpZzNKMzAxdkYyOVZCMFAyZWRBbWZU?=
 =?utf-8?B?V3VzQ29QSWo3OWtzOFNobnUvWGJCSTdJdjNkdVlVVGlERGo1TFZjSTZVcmVG?=
 =?utf-8?B?TGhaQ0FRS2dHdnJNWUtPd1p5NDJWUUZQdkpaZXhtUEM2Z21WVTJtczhKSE5H?=
 =?utf-8?B?SURoR1YyMnFxU3luSTh2MitsZmo5VXF4VkpqYlhUUllaQmxHUUxVOTlBWmxh?=
 =?utf-8?B?WFBPWDdlQ0p0Ukx5aUI3cUFPWkduTERTN3lIVFh6M0dVR003cFllRllsUDF4?=
 =?utf-8?B?Tkt2UThmazhzdnpMR25kMFFJQUxZdmVTWXFWUXY5THdmNytYZlBjb0JyRWlT?=
 =?utf-8?B?MzRqaXNMd0VaT01NT0VkMCtvQ3QremJ2OUJqYk1YdTljMUQ4VFlWQ1RDa2tX?=
 =?utf-8?B?OE4xdG5jUnlzOTI5TncrZEZVMTdKU2Z3Q0t6OE5aNHRObDUyYkFuWm1EVFJN?=
 =?utf-8?B?clhnTmxtMXp1SHdkZVY2aDJzYnVsZkNQUlFHVUozaitDcE5yUE1kbnZVZEp1?=
 =?utf-8?B?dGZWZEhPS0ZkQ0NSblg3cVdMK0ZKNFgzZ29jS0p4dXhPRUpKSlc4N25NaHdy?=
 =?utf-8?B?bjcvZ2Q0ZEhkTUtXSDhPcndVRlJPM1l1Tm51bW5XTDgreVNhVm91T1VUNXNL?=
 =?utf-8?B?dTVmWWx5N1JORGtOWWlaem5OekY5aHVHa2lJdzh5TEpxRytBSGU2TGRoS1J3?=
 =?utf-8?B?YkNoeWl5SmpuOFM4Tm4yTG1VVC92VTRVSkZHbjJ6M2I3dUJwQWt6c25tVE1C?=
 =?utf-8?B?ZXZEeE9NVVl2TzdKaC94Q2FnbnhFMFpJdWtacUhsV0xpb1VEV0dWSlE4cTlW?=
 =?utf-8?B?eThzSytqVWhTVlpPZVZWMHBQTTBNMmhWLzFTSm1vRitSNDc1Mm15anNxcGlT?=
 =?utf-8?B?UVdLMFU2U2JGOVlpNTFhMzNMZk9IWFhOVnhBY3V6ZFcweVVwbFd6azJvVFBs?=
 =?utf-8?B?Tk44YU00Q3F5M1VSNFNndkJsdEVLMk1lcGo2MVJIc1FsWDE2b0hrTCtnYjhk?=
 =?utf-8?B?aldxTWdLMjR2OVE4dEpuNG5JK2hvR040OE9DRWl5MDNYSG1HdjFmQ3pNMitx?=
 =?utf-8?B?aE11STdwajh1T0tDTFQ5QUFLeXJBdTEvQWFMNlY4TDFiQmxFSGdZVEgzNWJV?=
 =?utf-8?B?ZFQxcWhiUVByZUIxbG1kOVVXbmIzTjJ4QWNLWmFHN2psWlE5T2FDWE13Y1Vz?=
 =?utf-8?B?ZjAralg5L25xWW5ZVWZoZDZ5ejFoV2crME9rWjdkY2hQajgxeS9nV1NtYVNn?=
 =?utf-8?Q?xy2mqC62K1NzvoIezPryIY5sW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62E2164B1AD59F4C8085D02A94176C04@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VSpVK54Hq6mOGue0y0kooO9nHsMCO3Ux58ZbOiVoZa4j36yYGgFZLnKBs0JH7OERfivXcJCiuDDmc2jnWvctB7CxIvXnDn+5+Ip1n4dJujeNlH44AfwE4Gv98LiMM7Le88Ld98y9TDmGRxvzRKh2DobxQFh6J5t7VDB+BofR7gvNy2orn/S2z0DMCY5eVlOeSVh1A9mxSsH3o6SUTsMEaHxA8deKgB0ZE+LmwLhnN3ZQzclnMoAnugEsIXq4Cm9PX+p4D/HcM6kidHD28qdeW6mRdtZmEdYfaScuyWhhfNsU5w7jH3Ka9l5vzsZZarn5Y+UedcZ8EqN8Iz3bGHUcc84lvCFYIOH3tDA3vZ2HK4uHspI19785inGRqUR84dZrIJYKc9Je6Vhpyh3XiPBH9/nMIM/CBLKF6+gC6wt2SjGJREP2eJpAIJVFGD29qlXuoA0pj5JBw1PIzNVZ4V6EwC/TFWzAl50M9B2Fg3dAQ2NqZDxYHzgMAy1+NFxir7VC3N4rlHKRBjF7yzpI34e/xJ4fTsgaFfoc3JrcjYgtbIprOpvxrCVbgoYG4OhZvh3ZeOUKLFSZmYrGGl92byEhLmWZKiH69EtdCptYFuNc80K6+Ua9V5HmSDMPbxjQ7uvh/69hZAPnC7gwGBWGymBD9QvkyL7OhdVM5WhgormDb8bnOskm/vlDjMtY294G/7hju6GYBAIZuqru5+reXtNqYm6xXJm2UG1jltslVReChH1SrYtxFXrtK6QEW8/hH+jn1i2T70h3nt/Lre8RtvgxmWNDv6ik1ZTFrCSofISJYxuM8mg2FkGVOGEgvae9UCKC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6d68cf-38a2-47b4-e0f0-08daf8c9dc9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 20:31:49.9105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hX8KaUrttKGoMLvV+IzoQMWeNpqJgvL7QD3FFZBjnVFXV/A4Xe4jmEUGPAPiC9SyBSWXj/OivtRc1iN1IfzEbIHT5fhWjrOTpFLnoFlhtb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5036

T24gMTkvMTAvMjAyMiA4OjQxIGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3RpbWUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvdGltZS5jDQo+IEBAIC0xNDYyLDEy
ICsxNDYyLDM0IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUoc3QNCj4g
ICAgICAgICAgdi0+YXJjaC5wdi5wZW5kaW5nX3N5c3RlbV90aW1lID0gX3U7DQo+ICB9DQo+ICAN
Cj4gK3N0YXRpYyB2b2lkIHdyaXRlX3RpbWVfZ3Vlc3RfYXJlYShzdHJ1Y3QgdmNwdV90aW1lX2lu
Zm8gKm1hcCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgdmNwdV90aW1lX2luZm8gKnNyYykNCj4gK3sNCj4gKyAgICAvKiAxLiBVcGRhdGUgdXNlcnNw
YWNlIHZlcnNpb24uICovDQo+ICsgICAgd3JpdGVfYXRvbWljKCZtYXAtPnZlcnNpb24sIHNyYy0+
dmVyc2lvbik7DQoNCnZlcnNpb25fdXBkYXRlX2JlZ2luKCkNCg0KfkFuZHJldw0KDQo+ICsgICAg
c21wX3dtYigpOw0KPiArDQo+ICsgICAgLyogMi4gVXBkYXRlIGFsbCBvdGhlciB1c2Vyc3BhY2Ug
ZmllbGRzLiAqLw0KPiArICAgICptYXAgPSAqc3JjOw0KPiArDQo+ICsgICAgLyogMy4gVXBkYXRl
IHVzZXJzcGFjZSB2ZXJzaW9uIGFnYWluLiAqLw0KPiArICAgIHNtcF93bWIoKTsNCj4gKyAgICB3
cml0ZV9hdG9taWMoJm1hcC0+dmVyc2lvbiwgdmVyc2lvbl91cGRhdGVfZW5kKHNyYy0+dmVyc2lv
bikpOw0KPiArfQ0KPiArDQo+ICBib29sIHVwZGF0ZV9zZWNvbmRhcnlfc3lzdGVtX3RpbWUoc3Ry
dWN0IHZjcHUgKnYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHZjcHVfdGltZV9pbmZvICp1KQ0KPiAgew0KPiAgICAgIFhFTl9HVUVTVF9IQU5ETEUodmNwdV90
aW1lX2luZm9fdCkgdXNlcl91ID0gdi0+YXJjaC50aW1lX2luZm9fZ3Vlc3Q7DQo+ICsgICAgc3Ry
dWN0IHZjcHVfdGltZV9pbmZvICptYXAgPSB2LT5hcmNoLnRpbWVfZ3Vlc3RfYXJlYS5tYXA7DQo+
ICAgICAgc3RydWN0IGd1ZXN0X21lbW9yeV9wb2xpY3kgcG9saWN5ID0geyAubmVzdGVkX2d1ZXN0
X21vZGUgPSBmYWxzZSB9Ow0KPiAgDQo+ICsgICAgaWYgKCBtYXAgKQ0KPiArICAgIHsNCj4gKyAg
ICAgICAgd3JpdGVfdGltZV9ndWVzdF9hcmVhKG1hcCwgdSk7DQo+ICsgICAgICAgIHJldHVybiB0
cnVlOw0KPiArICAgIH0NCj4gKw0KPiAgICAgIGlmICggZ3Vlc3RfaGFuZGxlX2lzX251bGwodXNl
cl91KSApDQo+ICAgICAgICAgIHJldHVybiB0cnVlOw0KPiAgDQo+DQoNCg==

