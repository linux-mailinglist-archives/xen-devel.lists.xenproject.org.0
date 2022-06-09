Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98D545140
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 17:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345601.571273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKRI-0000N7-TW; Thu, 09 Jun 2022 15:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345601.571273; Thu, 09 Jun 2022 15:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzKRI-0000LK-Q3; Thu, 09 Jun 2022 15:51:16 +0000
Received: by outflank-mailman (input) for mailman id 345601;
 Thu, 09 Jun 2022 15:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+nUK=WQ=citrix.com=prvs=15254dc06=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nzKRH-0000LE-AG
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 15:51:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb6bf6b0-e80b-11ec-8b38-e96605d6a9a5;
 Thu, 09 Jun 2022 17:51:11 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 11:50:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6066.namprd03.prod.outlook.com (2603:10b6:610:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 15:50:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 15:50:26 +0000
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
X-Inumbo-ID: fb6bf6b0-e80b-11ec-8b38-e96605d6a9a5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654789871;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yuceVizFDn5qDctsHHjXyyVu1GYqojQxEMbWf4ogXdE=;
  b=IGZCiLhPTT/DyRr/rW94O2xpcGtjYfyD+WWsJD42D1V+QqLjWwrrO/7x
   ar8WO7KaUomnKSeGw4sshLov/j1lGb8JYCVkC1MRbxTYOck+TJ1/t7d4i
   AjUB4P925Wc/SokvTeTRx1bVtvuhX1KA33mC/nuToyAubphln0FLrPe6p
   Q=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 75800183
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EGk+c6Pw3ynXBG/vrR3XlsFynXyQoLVcMsEvi/4bfWQNrUoq1TMFx
 mJJUG7SOPzeY2anL4wga9m1pEIAu5TcxoUwTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn2t4w2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 oxuiKObRwQQI6z2g8YWfgh3UCZGIvgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHPuiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2IF+ArN/Ppsi4TV5CNy0byzDdqKQdfQGsJtgU+Xt
 E3az2usV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVQBmQsHOC+BkGVLJt//YS7QiMzu/Y5lifD21dFDpZMoV56okxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLTfDdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:bCz7zahng4cMjckUmdpkBoCpQ3BQX4N23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bvYOCUghrTEGgE1/qs/9SAIVyyygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3vpxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJ7iJGofy/gzdktvfrGrCo+
 O85CvI+P4DrU85S1vF5CcFHTOQiQrGpUWSkWNwykGT3PARDAhKd/apw7gpMycxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfdsRKEkjTVo+a07bWvHAUEcYZ
 tTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYYit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tXKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG7fIx8Z0WY9ihz3ekIhlSnfsubDcSqciFcr+Kw5/MCH8bcR/
 G/fJpLHv6LFxqaJbp0
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; 
   d="scan'208";a="75800183"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guHFeR5unr6zjrTZf0lW0yJv2rfzN/Duf071u7uF6EG0Q6vo/RLQEYcwd1UJVdheihvF0V/F4LvOLsCet5mnS+RUQwWigUwK5gAMwvLh4DNXu9reGamwC9NEd+iCxchbcxE0q0XtfgcJCzyUn3XSLra/Uwk5vncE9Tfks2B8zjuGQhoR5o31GEr2vBFX8SvcxcT+TmQYCioT63Ib76882RXdqtaIpJr2DrBoMv9zvIABBjg0AC8F0J07B4WCken1DVMj7WEDzLUCN6t1Zxad0kMUmdUaEecRDTeEciLOUzhACAGooR+hnhMBBBhm+lrSX4DdgEtpN9Zfu5fdFhQvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuceVizFDn5qDctsHHjXyyVu1GYqojQxEMbWf4ogXdE=;
 b=WQ6RxRiYdZjZeJIa8IYnp7D3JlOajXswfDVgCkB7McYUOxftA1ZhIGk2o1kr2G210EYhsDaaKgdMFAkPzynEaiB3D15Zffn8nfeK4f0B9YH6v2IgaF63UeTpeGavJEa9hLJhEaZ6Wf+MKgwoa0khhrxsy1RaB/cPV2D2rKzxoBxSx19a59QLhEhHRIMlAXq2rvALD/xiCf8oA+ogql4kY8iaf2OnHbmFgFjpXiWQ2DormMTC4zBIG2pNGGm0Y6UpmXEtMV576PvCQ9/MddjPgAGm5owkHn6dUditOYbdKlqqNcZdgEuZ0bcytOyeOrvlO3hYAeJlFGqrRn59Bc4fxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuceVizFDn5qDctsHHjXyyVu1GYqojQxEMbWf4ogXdE=;
 b=KKMahrG1AINqUdSIHTUqDswmGuFemiLo4AUOght2GRj8C3JBSsSXoTmnMrRKNTiNcEyhW7DZt37zLezyjw+R3WfK8teo2wQ/7W/4Tuau0wRsilzy8GSBh0GN/C9psHB33ekaTav9oMplEVW72dFCLyOJBt5k3O8losC04ZL6qIA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/mm: further simplify cleanup_page_mappings()
Thread-Topic: [PATCH] x86/mm: further simplify cleanup_page_mappings()
Thread-Index: AQHYfBcxlHJGb8s4Mk+MGPtEwJgQia1HORaA
Date: Thu, 9 Jun 2022 15:50:26 +0000
Message-ID: <756741e4-e736-fe66-6653-775e16114059@citrix.com>
References: <56d16bba-05db-cef1-0746-1591a6744afc@suse.com>
In-Reply-To: <56d16bba-05db-cef1-0746-1591a6744afc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3690bc74-d46d-4d47-4022-08da4a2fc55d
x-ms-traffictypediagnostic: CH0PR03MB6066:EE_
x-microsoft-antispam-prvs:
 <CH0PR03MB606627327C44998719272175BAA79@CH0PR03MB6066.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cuDazsaikBufG1Xj5yVB1N3+s8oBZ2PyzD2CKjtyy5fz8tXHTjgWS1e2oipJDVtkVbOgmmdgpM1Ow2XkLWgo4Zfmb7EOOje4MxxaYHkjsP9L3JhIbpp7AGDlzkLqLFywchAaC3o0kxZ2fuDdpGSPOAzydofzYXv9tj+fZ2uTmhPhK8O6PYRxXHHJhelORcBKZlLl9Uly6ysTzQYd4KF0uGf1TtYJd42fswUwOSBI4aH0hfqSjcKfpiqzYqVGwsLKZVJiuzwiWGcP86B0yzZZNUobjAYs27/CMQxngQInQy6I0qATfR+Llvw1f9eJZmOUQeUt+USeA1uLNzBiAjMeb6fHHk0fV2K7Yhg44ZGVCfJUG6oJelNeFf1tijqi7Vss2MlVFU9qJXCrLYh7oZsKAkdHKd/+z17Dt4X5AOKmNlI53KBqJOv0OX38/ZbFcSq4bV62xdTpgC6gt6cn7pdMuQgU1/mCUR32AhRyNpPebvvKyOqi+ZAdCWsorl6Q4Ul7kVcZlPB1dboMstpkiTDpkOtR1VL+yaCUqckPYwRDjFf+QTl8Teehz1D6DOUDVkmmIUBUbhZwx+FHtsSaTJSeCwYL02NuD3Olt9XxI7Fy5jq8WAfTlfO3D/lmSMdeBGE7UC2nbSwq04hqwhwl1wo2uQnSmt5kVGHOZ7gsEqPVF95uBeuRrIxN93JJM+8nl232XDBLsblI9h40e9xIeh8AvZY6OeUox6WJXV2CJO1oDkjlP9BnX7eb0Z8rEf6A+ZzgTPhkV22Alx4CPFEPVk2uvg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(508600001)(83380400001)(86362001)(82960400001)(31696002)(38070700005)(38100700002)(36756003)(71200400001)(2906002)(6486002)(5660300002)(316002)(64756008)(4744005)(91956017)(110136005)(54906003)(76116006)(8676002)(66446008)(66476007)(66556008)(4326008)(66946007)(8936002)(53546011)(6506007)(186003)(2616005)(26005)(6512007)(107886003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzhVOHVlTVFKTWh0bTBtYWRyVGN6NUdRb1hQTWMzUTNsZy9Td28wbjFVTXda?=
 =?utf-8?B?V3A1c1h0R0VUcWpzUS9UYzdQTElOM0t5bHl3RnlCbkY3cVVZY0hRNjY2SXBu?=
 =?utf-8?B?Wk9oRTZlVVNTY3luMGpqS3hoblFXTjI3TGdNMzMraXJrOVVCZGZvcFZRNWpn?=
 =?utf-8?B?V2E1VnFPZTAxSGRSeFpMQ2xmNFZlWWJjQklOeFVtUHU2SXFHT1Q3dTN4UTdM?=
 =?utf-8?B?Q1k4Nkd1RWRoNWhHYkhDRldCd3VmQ0ZHN1JlTGllcGlib2g4SHhURTlVK0xP?=
 =?utf-8?B?SWJ0SmJvbEhuaDIwYUFIMDh5dzhoclFCMkVQNXdEY1hiWTJ1Smx0RnJzdTZi?=
 =?utf-8?B?eWdzQ3FHZHVwMWNHMzZ0V25OTDE3ckg5aXVWMWVkSXJiaWZOWmxoU29QTjZs?=
 =?utf-8?B?aTNYNkJHWHdVaEJCTzl3MTY3eGZZd05HYWRjVHFvOTVjRWxHcVh5MHltUTRS?=
 =?utf-8?B?SlVWS1lGUVlnRDFjYnAzc2lzcGlHUkZwYm8vSkUvbUR0YXRFRDZIcUNmSUNs?=
 =?utf-8?B?cVVHVTV2L21XMDZweUIvY3JqT2tGUzBmaDY1eVdGSEptRXBwWVNWUkhsUS9M?=
 =?utf-8?B?K1N2N25haHF5ZFUySkNXenBYb2JCZ3EzTDE2R2lQWFNxQ3BVczNBdkJocnB0?=
 =?utf-8?B?akZiTkkwRVl4WG8zN20ycGNUMjB5QkF2Wk5leTJ4Ny8vbmVlM2h6NG1YbCtG?=
 =?utf-8?B?SVhhR2c1RnpnVUdNdFdHK0RNUUxsMVJUVUVySzVKV0REYWQ1VHB5UnJ4RmV0?=
 =?utf-8?B?THdlRGl3dkJVMmE3TVdmUFNqSjJvUjdoelFXK2xXeDhCZ2RYRUJmdzlxUDhy?=
 =?utf-8?B?SGdOUlhjbXU0NExGSnpoYjU5Mm9OREhoTEJDL2tBbnVyNGdPK1BSTGx1OXpS?=
 =?utf-8?B?OGsyMXFaeHFWVXJ3bHlZSUlMRzJKRVE4a0pGR2kxUjlYalVLenhrNmNPN29l?=
 =?utf-8?B?cXlubU5NaldrSXdIbW9PaC9MbU9lZkl2TFBNVDRFaUxmdWtVb1RGZko5VDVK?=
 =?utf-8?B?b2x6QUhBOWU5WWV0ZmRNeGRTM2xkYkdiUGwzczRjSGpnYVZoSHQ1YUxVdWFj?=
 =?utf-8?B?VWQ4VGxJQSttdlZTaVZ2blNVTGxLcnFFM0MwajV2T1g3N0lXZHN5eGF3ZElu?=
 =?utf-8?B?WjZ3SnhZSlFXSDd1OGlZS08vaDNSbnBPWGRKK3B3Y1U2cW8xM1dPSDlGZEhD?=
 =?utf-8?B?ZFhadjJLTnI2dVlyU1pKb3gzTUFLaTdZdGpEclVwczhmUlI5a1lSRTFxQlNN?=
 =?utf-8?B?S09yQWdvTmgvMTdVVFR1bWJURDNSWE40My95Z0Q4UXRBUFYwODNmdGhCNkcz?=
 =?utf-8?B?QmJnVHFtVjk5cndReVVPbGNDbStaMSsrWkVQTy9nTUt5YU1yZWFLWDRpc0Fx?=
 =?utf-8?B?Y3Q4R0FWUmtsT0NGa0Q0R2Y1ZE9wL2lnM0tIMk1CQWlUSEVWNE9GNnhtZGo4?=
 =?utf-8?B?VDF0alFJa3VHblFWdGVlcmI3Wm8zUnlMM0NWOWxQS1c4Q1NteC92RGlzVit4?=
 =?utf-8?B?aFRQcldoL213cGxpUjBsaDRiVlNPM2dOVjA1NEU4bjNSd1pzTWcyK3prTm1H?=
 =?utf-8?B?VTZKN3ZkN2NlUGdYb25RL0hodzdUeThiK0pWM29qenc4YWt4cDFqNTM5dURW?=
 =?utf-8?B?M1pWVnJqQlBYb3FxclZaSmprTlVFT0lsb081cUNOV21hWmZyeGYrUnRGc0lH?=
 =?utf-8?B?UWRqamJONzIvVkREWmd6YXlkaFduL1BqRytMRmhTbGxBQlQzQjZzRDNQY3A1?=
 =?utf-8?B?SUhkWFVVaTYxYlNZbE5jNDUyc2liZng3NWFQalFacndQbUVZZlRIbXl3YXdp?=
 =?utf-8?B?OEJtcHhHamJJRUU4TjFsRWJlc3NwVkZIK3JPdWFYRnlYenV4eVIydEFKNElk?=
 =?utf-8?B?WmdLNlNNMmQyU0tYL0lYOFF2TDcvTGw4QlkzWUlsSEROZld1Sm40KzE1SGpv?=
 =?utf-8?B?VHdzbk12K2hGeVlodm9uMnRqbmFvV09YYkE4Q3JBNDN3TFlCQTdGVmNkT0RG?=
 =?utf-8?B?WnVMTVJpZFZncU9sNlVBcmdOV0ZiZmdaclRUVTZHTGRBU05CWTBZNWZOS0hD?=
 =?utf-8?B?RStKT3VNTHMvWVZyUVIwbVNqMFZMcmNjN09YZ3AzeEhYNmJzWWNJdjJqRWtv?=
 =?utf-8?B?RVQ1bUVKcXVBUndkb2lqUUl6MzBZeW1UMWtkTzZHbEQ5L0I2UHNSZlAyRWYy?=
 =?utf-8?B?SW1yQUhlNHVRbTA0MFlkYy9wSTRVK3YwSEdKeVplL1RDeWl5ZEZZQitzQ2Va?=
 =?utf-8?B?aHVCajVMYktBbXphNU9nN2ZuYmxhUHFlZWdIOTRHTFI2RXVON29yZXBQT3Bu?=
 =?utf-8?B?M2UxYmI1d1UwdzV0S1JpbEU2dG5BdTJKRVpkblIyZ3BVa3pCR3hlTlFwVzZ5?=
 =?utf-8?Q?ud9+/Y0J3wck8JSQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <793C09DFB12A724689E9DF59C568292C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3690bc74-d46d-4d47-4022-08da4a2fc55d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 15:50:26.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LgPri/ZWAb4KcZqJsEmCEPYhhxGeQzZY1ANby4RofbUDfxja/z6btLBuadHcxEqiLG0AYZ44jSAtN4Nj4y0edIReRLjFZ6EM34aPVCwuRDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6066

T24gMDkvMDYvMjAyMiAxNjozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdpdGggdGhlIHJlbW92
YWwgb2YgdXBkYXRlX3hlbl9tYXBwaW5ncygpIHRoZXJlJ3Mgbm8gbmVlZCBhbnltb3JlIGZvciBh
DQo+IDJuZCBlcnJvciBjb2RlIHZhcmlhYmxlIHRvIHRyYW5zaWVudGx5IGhvbGQgdGhlIElPTU1V
IHVubWFwIHJldHVybg0KPiB2YWx1ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KDQpPaCAtIEknZCBub3QgZXZlbiBzcG90dGVkIHRoYXQgc2lt
cGxpZmljYXRpb24uDQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KDQo+IC0tLQ0KPiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJIHdhcyB0ZW1wdGVk
IHRvIGdldCByaWQgb2YgUEFHRV9PUkRFUl80SyBhdCB0aGlzDQo+IG9jY2FzaW9uLCBhcyBpdCBm
ZWVscyBhd2t3YXJkIHRvIG1lIHRvIGhhdmUgc3VjaCBpbiBjbGVhcmx5IHg4Ni1vbmx5DQo+IGNv
ZGUuDQoNCkhhcHB5IGZvciB0aGF0IHRvIGdvIHRvby4NCg0KfkFuZHJldw0K

