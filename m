Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235C6AACDB
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 23:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505507.779582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwb-0001u7-Pd; Sat, 04 Mar 2023 22:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505507.779582; Sat, 04 Mar 2023 22:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYZwb-0001fY-EN; Sat, 04 Mar 2023 22:01:33 +0000
Received: by outflank-mailman (input) for mailman id 505507;
 Fri, 03 Mar 2023 00:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqmn=63=wdc.com=prvs=4197e97ac=wilfred.mallawa@srs-se1.protection.inumbo.net>)
 id 1pXtkA-0002kI-Nq
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 00:57:54 +0000
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c35c25f-b95e-11ed-96ad-2f268f93b82a;
 Fri, 03 Mar 2023 01:57:53 +0100 (CET)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 08:57:49 +0800
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BYAPR04MB4934.namprd04.prod.outlook.com (2603:10b6:a03:4f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 00:57:46 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 00:57:46 +0000
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
X-Inumbo-ID: 6c35c25f-b95e-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677805072; x=1709341072;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ecDue/StJ/XNaNyJwfVRAVLNghPAXh2UcTou64FfFE8=;
  b=g3fpQNQvXLJDCrswUcVKKdNEjrxFOr9L8lRVDLcxEc+o+liaC1P57eo/
   mn/yghH78GHezYs6EFspoFBkAEvRaZp2yfsY/eTEP6o/BweQB81QXxcJc
   QIc+L7HsuO/tTfUS+VkgRjI16iM2F/VeeZB4iLG9cdTFtUD5ReRfB6G+M
   NjJJxMdmAd+D/Xzl6ULDIrooFThSSWBbYMfzmsEwrJPO0OMAl1yx2kIZB
   6SPOVwk1JW/rpCIU4WeyCJG1vyoDEhm5iI6vKC2OYI5FHUzIHoali69jJ
   tfg7/d8PwNGkgooymOhk79QgOLyUgRVb/2fVtQhr/xO0FAa5iGruBoCC7
   A==;
X-IronPort-AV: E=Sophos;i="5.98,229,1673884800"; 
   d="scan'208";a="224681042"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHsZM62usFs3QFbTmZmSV7M0ZIBEyVoV7764pOWOphFXUdhP0SSSxLocWjOYrvrpGR+G3FVi/qw7FQFeeHgVqS7mVhdnVSeh8JmOkC8QcdRQdo53cLQSfZZRILG2WMQ8IwrhmmpH6BrzlLjY9TPsOjyZVfDH98vyZ3GUCW9PyoBeAxtY8qg+HxQu0Z/8n/kUQmeJXdterP+zb9/jxoRWEpkHi6r9OshwZCBIXupPwyvJQXk0Vm2Pr20a7X1kUbAWE73IrmZKj2OZ+jAa0zT9Id7Gt/mfS0+buDnDcnS29D8jeG+ixH453MG6hib4DV9kqBqZjit1gEpw/WmCeamVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecDue/StJ/XNaNyJwfVRAVLNghPAXh2UcTou64FfFE8=;
 b=GEsTA7J+DAyGu3l0mCMo6gGNnv0OFuWILXp/ZzPONVGb+2zJdwkSnatPrwQ7hT7Uh2s2pGVNLOnbeIMYzltPWpedG9lpQGO5LAe5ROcR6hnafegvijITm5/kczAz49mxIHat9D50Q3q+SbhuDVLRfPX8+JavWAa8LmHaFCeC4D6JXoWwvGne8JcegrCtuXzgX68ZrD/02PIZikF3S6iUPt9mdi+pLfZdpv+78IjmnDdVY4OWWHFiWEzjZU6PhwxtLcpN5bIc7IWKmOu/f96ZrpAqb8vmQgtowcuhW9EhGeRplxMc26Mr6kjtBdN2QNJ9cw36a1tPL5EfhjqUB/OG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecDue/StJ/XNaNyJwfVRAVLNghPAXh2UcTou64FfFE8=;
 b=pJLc15SzAU4WLXLXWwCdv6d7iP0+gis8AjwJT9xGqC5EzotEHB0iCLgKH8JYrv8wj+t+IzN3GbM6Ef/cK9V9lLrBOvlrgpxqoM1F30z3UFQaSVXP75BuQGJSOuZb+pWiwd5HUBwOJYzKsUuQ+TasAlRLDpPblWfKx4M2hL9sk1c=
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "berrange@redhat.com" <berrange@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "armbru@redhat.com"
	<armbru@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"libvir-list@redhat.com" <libvir-list@redhat.com>, "reinoud@netbsd.org"
	<reinoud@netbsd.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>
Subject: Re: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm
 system emulation jobs
Thread-Topic: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm
 system emulation jobs
Thread-Index: AQHZTSSl9FA3qGnAkEW8XXW1i1T7Fq7oPAuA
Date: Fri, 3 Mar 2023 00:57:46 +0000
Message-ID: <3d9bca01444d248158650d278f90a65422ff7db8.camel@wdc.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <20230302163106.465559-7-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-7-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BYAPR04MB4934:EE_
x-ms-office365-filtering-correlation-id: 1ed937ab-c88f-40bc-29e0-08db1b824db1
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LUcUIloiLOch//TYrR2HKoVm8+RSq5oaBTHRXk5rCYGsZQJ4l8nP5yLlZxGQQG9Zk7qgUCc2xNVQFa05X50RqpDaMRRSdqP6CY1+MF77XvDJuIIe9XlervkL/0XYdNYGngu98X1dAB9iLLU4rfiI/3gfypJtBj1ryhVp/s1Vby2KwfnJKszL8/gKzGVroOUii3JFLEXd/Iw+xbHyaiBFUil1G3EZClqlIrE5qwz7c3YmUMzzPl3KQg9mhm7pg07UFb1trMq/Cja4wSSgnLVXdST4ZUVU4deIM8pxizLhJJ58ToKRDAJFKIA6BBhW9/X9kYDpLS1EwKbWBd7flZk6YaxqSrXQK7ID/8UnAZK6NaJosZsNh3G7IAjCznuz6LQiUmhglynl1Ja9hMEaVRnba5EAFBGN891spxqVEavi21thl9JuKc+9hE5Gzg+b/VCc5eSVXRWxDygxBJdbB2Gy21+x99Q18uXUkJLNwMMgO0hkogv2yC8Gj31a4zClFto3RhekD5Bj93paeagmarj5WV504uWtGVMgIQrmEE9kbX6oi88AGFjfmfmIsKBrd6vwWc6XSKdol+fq2gi+m1r1mUEpRqPZfG6BfiXZpvnMLkghRWmDAQkoD93Llm5MwIVGjq9RANaeU4Zy7mmvkMArVAGZt3C1TqXpQaaWUW/azfLmkuUAdobSF443t6kE9ledDtPXojkL3+uHDEZuoiEXzw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0963.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199018)(4326008)(86362001)(8936002)(36756003)(66946007)(41300700001)(66476007)(64756008)(7416002)(8676002)(66556008)(66446008)(2906002)(5660300002)(44832011)(82960400001)(38070700005)(122000001)(38100700002)(71200400001)(91956017)(478600001)(54906003)(6486002)(316002)(2616005)(76116006)(6512007)(110136005)(83380400001)(26005)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVY1RHJibzJ4VzBrRXM3QjZCM1VhQ0hIYkZnYXpnTnFvYk1VNzV4THFpN1ZF?=
 =?utf-8?B?ejFNWUpBN1dTMHhTQ05xNDFJS0szNnFQL053SDJxdGZyb0dUU0I3bDBLcUFY?=
 =?utf-8?B?RWhFR25CM0lENTV4Wm9MTDlJNm0xV0xxMndLZ1J6VERsUjUzQ2N6N1NSdDZL?=
 =?utf-8?B?YWNYMFRQMlpQYnRzbnk3RmY3L2ErcDRGOTR5SkJtUCt4R0JoRXpaS0tpS1FL?=
 =?utf-8?B?NWUvU1owc3FBaFdFTUhmWHBzU29hTXlmRXcxWDQ5UGpYUlVIZlRiTE5iZ0JF?=
 =?utf-8?B?dnlZenNPTE82aEU4RmhSaTZGd1F4WFRoSWFrdnVLTnhtTUZLaDdoR3VpbmJy?=
 =?utf-8?B?SDlVV0U0U0N2RzJ1dllIclIyYWdKMmxCOC84TGZlU1ZJYkdtUndmbWFqbjk1?=
 =?utf-8?B?N3VOYSt0SUp4cDdEVDNFOUZYWVBLVU9HdHNzS0daNVZWR3V3alZGakdJUDBF?=
 =?utf-8?B?dm1PMmJaS1Vlc0s5SCtEL3hMaGtrQ0d4Tjhvdm9Ja21xc0RLT2tkYUpuanhV?=
 =?utf-8?B?d2JWSi9lWlViS01PdGVNMStrT2ZXOHp4VnBNb2RDT0NENjM2dlBtc21idUJC?=
 =?utf-8?B?NTBqcFhtK3VPSXNsVGZyaTdWbFJkaFNzc0hXTDh4ODJIME9ZYWxKWDVJN3A0?=
 =?utf-8?B?Ylh1RmU0b0ZYckdHdGFEd01TeXF0MVRiZ2p2aGVrWGRIMlVnZURCZ04zK0g3?=
 =?utf-8?B?K0twTmdCdXNUUS9tektONGZIV2FCZzBBbE5HTEF3L0ZkWVU4Q3JyM2xkLzZ5?=
 =?utf-8?B?ak5NaDRLY1ZPSmdhc3ZBdFhWNE1CeUpHUWRDdVhlZEc3RTFPdml6NU82Tmpa?=
 =?utf-8?B?YzJZYktUWk9FQU9YQ0NsZ05LVEhMenpwNG9kZWlLeUFuL243U0ZYWmdnY3FN?=
 =?utf-8?B?eXc0QTAvYTRrTmZVbFZRNWIxKzhZeWJNc24zRFA3dlF2VENDeHpLWDNtWmpw?=
 =?utf-8?B?SWRhckViOXlKOVJYaU13QjhnVmpYNmhuMi9xZGRjMGhhWGFORGs5S2MwdGFu?=
 =?utf-8?B?REhzcTJpSXdMeElVRlZtK2pFZ3VoZVlOWVpzZlFUN2tuQlpnb0I2dTNZVm5D?=
 =?utf-8?B?UlQvNkd4NmFscjYxVXJrNUdHdExtdnJSUTRnTGJTN09HNlB4RUNJc3ZxekFB?=
 =?utf-8?B?L05ZQVNlU29wVGJaVUErNmplQkFWVzV2TXBnNUhQdnBiUHhxdGhuQ0dDb0s5?=
 =?utf-8?B?ZGhhY21XL3k5TzRuZTMydlZzWWg2eXFXTm9ZN1hzM3pvUG1XMEE4aUdwRVJC?=
 =?utf-8?B?aTBiWGhMbWVOcGdPNjJ2VVBpbjI2bnVKKy9hVnhOcGYzVkF3RFY1OGdva245?=
 =?utf-8?B?dXdoS1doUmYzYytRclBvUlJzdjVxZGFLeDh6QjJ4cVU3N2RBVUN4VmRrNThD?=
 =?utf-8?B?ZXd0SnI4dXRLOUQzbVBGYnhiU0xZUnBPUFZVUm5zTy9qTWY1WEZYTHJWVUx5?=
 =?utf-8?B?bEJTNlc5dEFZcFZJcjVrZm1KRFB2VGU3ZVJIQ2R3c01aRnRCY2EwTHhkSTIw?=
 =?utf-8?B?cWwrbzhjUG5raE1GL1ExOGtXWklRdnZqTFArblZqdEVFbXpsNlA5TmNWaHRw?=
 =?utf-8?B?cjVXZEh4UHpUT1lRRUxPcE1Pc1JIbzJKcFIzOHByWFRXU0dIZ3ZnYjJVQ0lN?=
 =?utf-8?B?OG5XZ2s5QkV6VG1qZUFZK250bVp2aGNxMXhwUVIxNnlGSWRGZGhrNWh5NWdY?=
 =?utf-8?B?MGNYKzYxV2R4djRsTitXelA0SDNNRkVuZUhCdkw4K0JSSXVwK1JGRERPcnNG?=
 =?utf-8?B?TGVpVzJORVN6NUVYakNYRk1PZ0JBSkdZcGFaSDdEZW1xVWIzMnhiTXU3ZFhH?=
 =?utf-8?B?b1VvVzBsblBNUTFpOFZVbXFMay9GTWNwQi9XR1pSLzYzZXJXTFF5bEJ1a1dz?=
 =?utf-8?B?VVhsQjdYaFVGSC9HUHhBc0o1ZCttY0Zhb1Z4cGtFRkhSQkxSMEZ0MG9vVFRC?=
 =?utf-8?B?RHQvSmRxbzJpUDUwWWFTbkVYc3dxTGJabnRFeVNDa0JyOVU5bTJ2MTFYRm9q?=
 =?utf-8?B?MXBCNkFqeFVoWmxsc1RtVEUrL3BJeFZQN29qNFdJNGdvSGtsR01XUjdxY0FS?=
 =?utf-8?B?cm5SaDdmaGRaYThDa1hXcEVKeE5TNFpFU09tUnYzK0pMNjdHMzU3Zm9pT09S?=
 =?utf-8?B?Smx5dXIyRnV6OWx0aEJDUGErSnZyNUdOU0RvblZHK3dZUW1KdkhOWmhVL1VF?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A4480D9FD740542B8A5F46E2CB230A4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	09hd2wszvkpkYJ9qtvY8l2F3P1uVp5ji5sE48mlXDMNKnniHZwTJk6fgS3VTRstRAc52gSD+/WXqmwrxOzrwhUKh84Qz0FLgHLzR5czjfs6AzopI2aYYDq6T/TAlUtDsbHw11cPhiDDTy58u4/uVziRNmnBKuIZVqqmrRIYVb3s9uAGQYXyA/CyceW29mXmA9i1JOcFU9ayzNWFZ1xQnyRE79uE0gizAxtT39BFv0kJnLcUFfJGqHtHK6angbZNiTMp5xpcPoEzMxvGJiNf6QfpBVu9fuCVSpcKO2EWdKrUgmbj3yjEnpWbcVdLsUaobIFs9Egr71sgXQhKAxt7XHTyGpi0vE5yYbYtkql68ZGthkFBBsnhturTFDLIW3JKrkGpWV2KgHARxnxyXJetCqk1tqp10F1O9y8VsuzKkJDp4fZai/rmt5AG4qaDuNlPoD9sRhy+CaJKy+mGpuGl8VTtACGJPPOAaKWKcOrMrnkHMTTEXBbS4aU+l6F6kCGnFpIQiYHHc3ycKZILYFwbkav2q3t5iDFyH6LA1wcxPIc04NEkQsvb5CUm9yJs6hrkuvWIArXPvh0lkRqaKd/YITwjgKqT6Mjb5JAVew6z/PQLvFymWwctSUerbdwPIi5VPZ28E1GLzhAXA+TupYp4gVAVZMICmn6KRnBCExo20J6jl63hZ6mUh6IfIJrvEUA24p1pnDxSqKA1Vrqg7x+GwxW57xkS6o1zV2tbUjRWR3A9J+WJ9R6l8Q6d+N0ttkl2Q+H0Dq+kKt5fzMYGde9+YgyHW22xeFklwNU54nMVyZGjw6bYFDnzkTpEaPYDBaQ38f7H0zvp1KxypkVdPiMypB0SWDGkCBP59Ee9s5XaIX/bVtl+35LmRRK8RyYeijBIWceHmv2EjY9xhR2hi57YEQJ6TpZEtP6v2DPUbnF7jwV4=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed937ab-c88f-40bc-29e0-08db1b824db1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 00:57:46.5743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnUVPezUG3wlQefTCNzlm0Myu6rK76zeSsm0DVUPoHa9+1QEgyciGY1gIMpKPX7/R887XfC/utSWtvTXsfeRCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4934

T24gVGh1LCAyMDIzLTAzLTAyIGF0IDE3OjMxICswMTAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
SGFyZGx5IGFueWJvZHkgc3RpbGwgdXNlcyAzMi1iaXQgYXJtIGVudmlyb25tZW50cyBmb3IgcnVu
bmluZyBRRU1VLA0KPiBzbyBsZXQncyBzdG9wIHdhc3Rpbmcgb3VyIHNjYXJjZSBDSSBtaW51dGVz
IHdpdGggdGhlc2Ugam9icy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIdXRoIDx0aHV0
aEByZWRoYXQuY29tPg0KPiAtLS0NCj4gwqAuZ2l0bGFiLWNpLmQvY3Jvc3NidWlsZHMueW1sIHwg
MTQgLS0tLS0tLS0tLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTQgZGVsZXRpb25zKC0pDQpS
ZXZpZXdlZC1ieTogV2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4NCj4g
DQo+IGRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpLmQvY3Jvc3NidWlsZHMueW1sIGIvLmdpdGxhYi0N
Cj4gY2kuZC9jcm9zc2J1aWxkcy55bWwNCj4gaW5kZXggM2NlNTFhZGY3Ny4uNDE5YjBjMmZlMSAx
MDA2NDQNCj4gLS0tIGEvLmdpdGxhYi1jaS5kL2Nyb3NzYnVpbGRzLnltbA0KPiArKysgYi8uZ2l0
bGFiLWNpLmQvY3Jvc3NidWlsZHMueW1sDQo+IEBAIC0xLDEzICsxLDYgQEANCj4gwqBpbmNsdWRl
Og0KPiDCoMKgIC0gbG9jYWw6ICcvLmdpdGxhYi1jaS5kL2Nyb3NzYnVpbGQtdGVtcGxhdGUueW1s
Jw0KPiDCoA0KPiAtY3Jvc3MtYXJtZWwtc3lzdGVtOg0KPiAtwqAgZXh0ZW5kczogLmNyb3NzX3N5
c3RlbV9idWlsZF9qb2INCj4gLcKgIG5lZWRzOg0KPiAtwqDCoMKgIGpvYjogYXJtZWwtZGViaWFu
LWNyb3NzLWNvbnRhaW5lcg0KPiAtwqAgdmFyaWFibGVzOg0KPiAtwqDCoMKgIElNQUdFOiBkZWJp
YW4tYXJtZWwtY3Jvc3MNCj4gLQ0KPiDCoGNyb3NzLWFybWVsLXVzZXI6DQo+IMKgwqAgZXh0ZW5k
czogLmNyb3NzX3VzZXJfYnVpbGRfam9iDQo+IMKgwqAgbmVlZHM6DQo+IEBAIC0xNSwxMyArOCw2
IEBAIGNyb3NzLWFybWVsLXVzZXI6DQo+IMKgwqAgdmFyaWFibGVzOg0KPiDCoMKgwqDCoCBJTUFH
RTogZGViaWFuLWFybWVsLWNyb3NzDQo+IMKgDQo+IC1jcm9zcy1hcm1oZi1zeXN0ZW06DQo+IC3C
oCBleHRlbmRzOiAuY3Jvc3Nfc3lzdGVtX2J1aWxkX2pvYg0KPiAtwqAgbmVlZHM6DQo+IC3CoMKg
wqAgam9iOiBhcm1oZi1kZWJpYW4tY3Jvc3MtY29udGFpbmVyDQo+IC3CoCB2YXJpYWJsZXM6DQo+
IC3CoMKgwqAgSU1BR0U6IGRlYmlhbi1hcm1oZi1jcm9zcw0KPiAtDQo+IMKgY3Jvc3MtYXJtaGYt
dXNlcjoNCj4gwqDCoCBleHRlbmRzOiAuY3Jvc3NfdXNlcl9idWlsZF9qb2INCj4gwqDCoCBuZWVk
czoNCg0K

