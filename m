Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C769565F4D8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 20:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472128.732264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDWJd-0008Ok-HY; Thu, 05 Jan 2023 19:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472128.732264; Thu, 05 Jan 2023 19:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDWJd-0008M3-E8; Thu, 05 Jan 2023 19:54:17 +0000
Received: by outflank-mailman (input) for mailman id 472128;
 Thu, 05 Jan 2023 19:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDWJc-0008Lx-DR
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 19:54:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b92b2737-8d32-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 20:54:13 +0100 (CET)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 14:54:03 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB5957.namprd03.prod.outlook.com (2603:10b6:208:310::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 19:53:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 19:53:56 +0000
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
X-Inumbo-ID: b92b2737-8d32-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672948453;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fYJ4tDZPy7y5zf+0cJyZ+4IZankQAXIi/098J4yBmig=;
  b=G1y5Y65rdr7lZ8AgMs9ix8dp0Pdw1h7JJ59QsqbJNCth8Px4KlN8lqeO
   6vTLYGEBLjRPTcEiUSGOpcmxk0RsAfaLHfkTI1pOA3CCnNcv+t4rcuytP
   d4kSXHUqTLJoMrfuyYrECxCNkm/W7N1IwU4gfCopIx/L4NM56AoQZ3Dxi
   I=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 93848175
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7t5sN6PseYxVTN7vrR2TlsFynXyQoLVcMsEvi/4bfWQNrUp31WBVz
 zQaWGrUa/nZa2agLtAgYdyz9E8Dv8fSyt42Gwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo42tB5gFmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vxKGU9T+
 tJbEx5TPjqyvcuk6+uaSdA506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvze7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6UzX+rAd1PfFG+3u9WnWyKw3QBMgBVCgqciqG4u2Kna+sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZiJAbfQ2uclwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRt3jX4iIQ6jxaKVdA6Fqew1ofxAWuon
 2/MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:RX9hPKCmqgbJ/JnlHemV55DYdb4zR+YMi2TDtnoBMCC9F/bzqy
 nAppQmPHPP+VEssVsb6LO90dC7MBHhHP1Oj7X5X43SOTUO0VHAROpfBODZslnd8kPFh4hgPG
 RbH5SWyuecMbG3t6nHCcCDcuod/A==
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="93848175"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjHFKosjOx/x+S9fXC5uTIJEUAXgW8hiR6biz8BAnZPiY3k9IisrgLtSxRWb6x/+mlT8QFZfMyRtAF1rt1f84cL0QoubN6RvDxOjhLIo+pKpa2CD9RVKOMJ4YxYgTyDNqIGxlsnFNlZ3E2FTR0kCGvUThadgNo+E/PL9OipsH55Fa2fwQluS/Amg3GijdIDPryNttNB+h9RuVs8cUW2J7GTNWWsRw3fPlbK541/eBB06lW80BMG6hynykuT5OS1z1fvi2705fv6j0GesJWmvDyNJSOO5yqYwDpTV6crEPxaNfdMo0EBDwP3V++oSJTuf6ejLLIi6PcnBppJv/m2VpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYJ4tDZPy7y5zf+0cJyZ+4IZankQAXIi/098J4yBmig=;
 b=RAzb1rd/Tt0g5yNmw4JdGdNvRVqvm/BZWmVMcC4o0aExQTmglKtL406tQUOYuTeXIy8RGngsEXTEF5xUVNsY4eARfQMFbc0frC+xOopXrMpO8tVSdRwvSt3vmntZtYSThRBpbg1rZtu25W4CiUXk/EMD44xMrBrf4dVksTjQXj9saxzaXZZ1vZ2fnUnPJqzfwBP1k1PS9J93Y8LjS8vVdmEajMbQUvBouzjbX+VNcqH4UqvT7o3vvIFk9jF0SRfvFV2Ua1Vt3LMLqBs0e3WmFnvxlqA8mEpl76gkmJ5ISuMB3vcpzuYJGNUvby5YkjBA6s9H2sGeB8QGy1io50aE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYJ4tDZPy7y5zf+0cJyZ+4IZankQAXIi/098J4yBmig=;
 b=e1xGavS1KQKaEdMUcZnNzoaqAyc9t+w7MVM6Sa4GCF1FiNcy8RsrfFbSyCEmBOH00oytDKBrVf8N6DI55F1XM6V3dFieT7z7+MIisNaIb3td9OqNOXlAar9Dcivs5i14sAlG4Xappgk4MalkN1iCEcpqLoDjkFOyG3tq53MX8EE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/8] x86/paging: move update_paging_modes() hook
Thread-Topic: [PATCH 3/8] x86/paging: move update_paging_modes() hook
Thread-Index: AQHZFT/G4QjmyfM5nk+WhnK7qSG8yq54nRIAgADvdgCAFsfagA==
Date: Thu, 5 Jan 2023 19:53:56 +0000
Message-ID: <42d0630e-36d6-f5d2-839f-ef5811714807@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <bee2d51f-534e-f6e2-6385-70f8597eac1e@suse.com>
 <de5343ab-9083-360f-3d7b-8bf84a70732d@citrix.com>
 <96b5613f-144d-29ea-9e17-515509c16300@suse.com>
In-Reply-To: <96b5613f-144d-29ea-9e17-515509c16300@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BL1PR03MB5957:EE_
x-ms-office365-filtering-correlation-id: a406e9f9-10d5-4905-225c-08daef569465
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xNmuFfzB5YK7hzr+qi436xYOIV28x+XRv+lfatVtoXc5XmzyIXEIEDxJJB9FEZwV6QPTx/8AwfI/HZZwuk3E/oP1C9xBvxsv+xSxJBDKEeCpOqz3cNmW3s2HuxLBzWsmABnbDK21wJvHvCSj4zkQAHCnVjYx/M5mjIBWhhgINgqdqrLAKY2A4E7bQ0ZjWzoor6GCq+pEaXzPmznoPeyHxZMKi7ayFPet6tzckg6Ptj2yJ+zEaiiLqkQUBPk5JhPNNkLPNnWbgyFhuXU93p65sjLa0DVQZIPt9WbZc7qm+/FPwbVPLNwURnXVAcvmsR/i6rwr1C3lo4GJhtB9WqUdeFmvaKkGPEi+X5Hqy0Wim14+auOfgvc4X3mnEooIx+Rgcvk0DGSqywV4dOtOFwFfrKwGaqRJ1vm9T7J1KbRpUPaP0xdjFSyU6laatG2XqK5jle+h0H2VmH9FgslZXoPt36HRR81vZW9gwPDLzQMBRrxFzitAsfp2Qb2Cet4vFSKHABeKl0sGEpXFJxBMHzNvK0UlgJTQ6lncw9oX22WWBTYidUIiSFfwxPMG3KmNnEFHqPTLparcNeOQ3i7/ZQfTKJEs3TOLVEalqwQEl46VIvuNad5cC1DcLoLpE5/WQGTOeb85ri54jk+Fwo4WFY6j7E5mKbm3K2ACpeP5c0kN1TMwnmTSzOpAyOduSfWzhEK/rDdhFJqYVGqmsakK8qJtoffWpO4dhuGBijSD9k0yqhs+FhDAIOUMOMyN1HcAUzHaTAH/LaC0fDeSzagnAO9XAQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199015)(83380400001)(26005)(6512007)(6506007)(38070700005)(86362001)(36756003)(31696002)(122000001)(2616005)(82960400001)(38100700002)(53546011)(186003)(316002)(4326008)(478600001)(41300700001)(8676002)(2906002)(5660300002)(8936002)(15650500001)(71200400001)(31686004)(6486002)(76116006)(66476007)(54906003)(66556008)(66446008)(91956017)(6916009)(64756008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y01ZTFp4SDVnRFRXUUNjN2lublZqV3cvd3dwejdmbEtiWU4ybCtjRXhQYm5R?=
 =?utf-8?B?WElTdDlwSlJFNG1UT1VPaWlCZWIzTXlSMHJBRkZwWnFqMEk4VnRwMTJZVVFO?=
 =?utf-8?B?ZVFBdHFUdnRjcVRhSm9nUzBTYlBOY09JcXNla2JNQnl3QzI0dzNBSXlJSWRh?=
 =?utf-8?B?K3JYNjJYelRUYys0aXE2c2lGd3NQTXdCdmt2WW1VREdOYjkyZFFhSFcrNTVZ?=
 =?utf-8?B?cFROSTVkVWZsQ2w3VENuWXNVd05ZTDROd3AyTXMzK005alRPbDZBWTlQb0VD?=
 =?utf-8?B?MzNGWmRoYUJWS3V3ZkluQUQ3TFFvV2hKbnlzMDRWendDZ0dlakVwampFbzd4?=
 =?utf-8?B?S0c3d2hEWktrUVJKSWVuTDdEMFhOOXVDajE3bm4xUTYrTXVDT0FqQStBUi9a?=
 =?utf-8?B?blQwSGV3VndXQUVqbVorYjdRVDZEbzJOVUsvNis1bzhXd2FtcTg0R3c5M0hV?=
 =?utf-8?B?b0hqVXNRR0QvR29Ncm8rS3EvWExHa1BLT0tUNHBhWUhEMXRyV25PTStLbUhL?=
 =?utf-8?B?RnNaODQ0dGxMcTFCWUQwenFkL3dESXdOYWlEaHpPaU03d1h4ZGpmYmd1ZVFn?=
 =?utf-8?B?ZXB4M2dKMGZVWnZiemYxYVNqMHBUT1c3bUxNZysyN1hKelcvTDZsRjRHdGUv?=
 =?utf-8?B?SGpRbm9nUlFUbDR4NkMrdnVLMnd4UmhOYU5sSjhtbUVva1ArUjJBdHVheURQ?=
 =?utf-8?B?ZjVuYTBtZ2ZYWmxjd0YzZHpCcm9KRm12VDdCSUY0ZnlEN2cxOW9VZTZNaEkv?=
 =?utf-8?B?S0N3MmhGbmtXUWVudlIvdW9VVCtTYVhiVS9taEltTm4wYThxUmd4ZzFKNzh3?=
 =?utf-8?B?NGl6OSsxWEhtMmJRdWZVejRsL3VuMmxFNnhhOUo2RWlvV0h5UG1CczkxZzJa?=
 =?utf-8?B?cGVpdXBJRU1VRXdHUTNDcVBnaU5SaERIemFTL3pzOEs3MHBmdHdxUzVtT1o1?=
 =?utf-8?B?K1diZ1c1TUFpY1UweXJYaEZUcFV1Uk9JLzIvYWlLQ1RLaVR2RllwRXhsU0Fl?=
 =?utf-8?B?VHAxaW03VkFJM0dGOGRuNjZiYmtlOTNIU1h1QVF5VTlua3ArSUozVURVQUNs?=
 =?utf-8?B?T1EwM3JnTnJHelo1ZFJpNW5ENUU0NVMvT2FQUzBRYm5NUmdNV1pVdFgvVHJn?=
 =?utf-8?B?dy8zLzJLUGIzUnlCWG9OaGJBeTZVK3FPVkVLeXdwSHdvUnlqSTJlY29XL0RT?=
 =?utf-8?B?NDNzVGZVbU5mYnAwVmQ3Y2tLSTQ2N2ora1Z4WnNjWWR4d21hM2dvNnp3MHlr?=
 =?utf-8?B?cS9lNHQ0UGZPdEdVa0h3UEk1dGM5SDhMM1o4aEVyamUveGZyM3B3WTIvaUFY?=
 =?utf-8?B?ZDBmMEwxcTNSUmJtUHNyOWpDOUhUZmk4dU9CL2JEOFBUUWc0M1hzemhWRmkr?=
 =?utf-8?B?eXhOUGFkdUg2VDkyTXRHamE1ei96U3dOa0E2cUwxMFh2RnhTU2FBSW00SVFo?=
 =?utf-8?B?RnB2aEZOR2JTVHdwYWRiTkhQbFovTlFGeVZIOGJNOEYxYVNzdVF0QmhIQkFX?=
 =?utf-8?B?K2M5b1lyRUJPNi9sMWorTmFyQ0xoZEY2TkdSQVJaOEJtNjRnRFhMcVN1M1E0?=
 =?utf-8?B?eU04akFSaHgzaUpuMFNtTHNzeFBoNjgxeW4yT2ZBZ2luemRjczNWL2U4MXk2?=
 =?utf-8?B?WlJHY1dGay9hQ0l1NkhVWks3NThvVXFWVjhMN3YxMkZ2aG5lV0NIY0o1cjZZ?=
 =?utf-8?B?ZHMrOWxGYUthb2c4R29tOVd5dW5tVGNCNTZ2ekNYVU8vakM5WHRiWkFZdTU1?=
 =?utf-8?B?dHhxWkRDbC9aRVV4aTNkQXowZWsySzlvYTY4UG52YWhlTVhSTmI4ZkRCbTBH?=
 =?utf-8?B?ZER6Nmt5NzlVT3dpdFIvNC90VXQzYzhFemtSU1NTUHJvTkFVcnhhTFAwdito?=
 =?utf-8?B?TG1vQWJiOSsrblVZY0NwQ0pHNGpWM2VBRzZDRnRqZVROQ0NiL1g5MkFuYytL?=
 =?utf-8?B?SjVYQzFpbHZTU1ZNNy9SeHhSczIreU5rU0JYdmZDRmpmU1dHNS9QRG02NzRC?=
 =?utf-8?B?NGVlL0RKODQ1TE9tVWY1cXhBSHI4bnRUbkwvUEhOblZBdmxmZW50NldGTTE1?=
 =?utf-8?B?eVdaVjRDb1dhY2RKMlRFVVUwTXVxWlRaN3lqNlVCeHFJcHhHUXJTVTlFTVNq?=
 =?utf-8?B?ZnhvL0RzMEV0TGhpeTIvY3d4ZTVGQ2VUU2d1UkFhR2FhTDFYS1hpT2xDSzZk?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <196236DCF8F0874888BA9EACB7F358AA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ajULz0UhLgcffh0Kb+50XonyB3hoQVK1kOJMnKmjSjI2Um2ybJnE1dblgj3js4TuECAIVqWMRETrEoB+yJ5QvHXBO8Nj3Yds+HRndpydQoKdO22zIzFnYjZwOv65Mqjq5X36UvoyT0MwDr7kMW+kmMNrK9Kq3itXiwGazRnzO1u2e8wTEBRvoPvblXWd7MPhpvHOIafTjah1P1uvvgrU/Gj10zGI3VGIrULnXpU3s0OlD27t30F1f53ORr/gHjl+hV2Qa2W0iuSUVVq+ksDews+hbdcEXjKDayxE68XLFdIcG/iFsxQ9FvOsLkQtYzoB+UFJ00qYmw6owiBD/GJYzS+rQvyPM7jIIbB8GbTnnGG7Cd5s9NKvjtwPVeZdDWVvX6JcUW/J787IDkP3PWXworeIVtCLpC6Ai9UhCVKtHWlguCGfs63oLZxszzVTFVw6il7XvngmtytXWXDxZ5Ns4A2gL6BEneVscFjcpKV8SiXnzqwXwrCuvUJVErxepxI0uQvyeV8bP48UwtJldj/uQC5O3gQ/70pRQGXtjahIjUAQWXQSWp00mY6WHlvlR0KWU/LNlxaNEQYTaiECBN7GElrM+CD1/I6CHn/K6DruaBPCPJkCd8ZP4SzaR8RAxC1mXzAIYgqz+XcDLA3y57s9hnL4hPpEMS72FBvgMFV8MBpuTON99AWFoUSOZG4HOVAdEpAQh6LIizhahUgR0vd9LdU9aNJL097VteMPdSFGTYBX+oxW+C6n58VomR/yApuDFYstOJJEso/oC6fH1yYd3zpgKbi0KtactSMQRtn2FXjWlUZQF/h59Mk0j9UQ3hGJPPN9IinoOWsSNB5us3YyvA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a406e9f9-10d5-4905-225c-08daef569465
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 19:53:56.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oSYX5YcHIZl4aTmyI//Z2Z4IuAUSfQOO3OvyuWQsy10jMx0GAD3fbGIIzoPCrRY0MN6T6ZtdUkpv90lNMeFF/38ckr3Fl08YnOUrWKZdbVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5957

T24gMjIvMTIvMjAyMiA4OjAwIGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjEuMTIuMjAy
MiAxODo0MywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDIxLzEyLzIwMjIgMToyNSBwbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gVGhlIGhvb2sgaXNuJ3QgbW9kZSBkZXBlbmRlbnQsIGhl
bmNlIGl0J3MgbWlzcGxhY2VkIGluIHN0cnVjdA0KPj4+IHBhZ2luZ19tb2RlLiAoT3IgYWx0ZXJu
YXRpdmVseSBJIHNlZSBubyByZWFzb24gd2h5IHRoZSBhbGxvY19wYWdlKCkgYW5kDQo+Pj4gZnJl
ZV9wYWdlKCkgaG9va3MgZG9uJ3QgYWxzbyBsaXZlIHRoZXJlLikgTW92ZSBpdCB0byBzdHJ1Y3QN
Cj4+PiBwYWdpbmdfZG9tYWluLg0KPj4+DQo+Pj4gV2hpbGUgdGhlcmUgcmVuYW1lIHRoZSBob29r
IGFuZCBIQVAncyBhcyB3ZWxsIGFzIHNoYWRvdydzIGhvb2sgZnVuY3Rpb25zDQo+Pj4gdG8gdXNl
IHNpbmd1bGFyOyBJIG5ldmVyIHVuZGVyc3Rvb2Qgd2h5IHBsdXJhbCB3YXMgdXNlZC4gKFJlbmFt
aW5nIGluDQo+Pj4gcGFydGljdWxhciB0aGUgd3JhcHBlciB3b3VsZCBiZSB0b3VjaGluZyBxdWl0
ZSBhIGxvdCBvZiBvdGhlciBjb2RlLikNCj4+IFRoZXJlIGFyZSBhbHdheXMgdHdvIG1vZGVzOyBY
ZW4ncywgYW5kIHRoZSBndWVzdCdzLg0KPj4NCj4+IFRoaXMgd2FzIHByb2JhYmx5IG1vcmUgdmlz
aWJsZSBiYWNrIGluIHRoZSAzMi1iaXQgZGF5cywgYnV0IHJlbW5hbnRzIG9mDQo+PiBpdCBhcmUg
c3RpbGwgYXJvdW5kIHdpdGggdGhlIGZhY3QgdGhhdCBzdHJ1Y3QgdmNwdSBuZWVkcyB0byBiZSBi
ZWxvdyB0aGUNCj4+IDRHIGJvdW5kYXJ5IGZvciB0aGUgUERQVFJzIGZvciB3aGVuIHRoZSBndWVz
dCBpc24ndCBpbiBMb25nIE1vZGUuDQo+Pg0KPj4gSEFQIGFsc28gaGlkZXMgaXQgZmFpcmx5IHdl
bGwgZ2l2ZW4gdGhlIHVuaWZvcm1pdHkgb2YgRVBUL05QVCAoYW5kDQo+PiBhbHdheXMgNCBsZXZl
bHMgaW4gYSA2NC1iaXQgWGVuKSwgYnV0IEkgc3VzcGVjdCBpdCB3aWxsIGJlY29tZSBtb3JlDQo+
PiB2aXNpYmxlIGFnYWluIHdoZW4gd2Ugc3RhcnQgc3VwcG9ydGluZyBMQTU3Lg0KPiBTbyBkb2Vz
IHRoaXMgYm9pbCBkb3duIHRvIGEgcmVxdWVzdCB0byB1bmRvIHRoZSByZW5hbWU/IE9yIHVuZG8g
aXQganVzdA0KPiBmb3Igc2hhZG93IGNvZGUgKGFzIHRoZSBIQVAgZnVuY3Rpb24gcmVhbGx5IGRv
ZXMgb25seSBvbmUgdGhpbmcpPyBBcyB0bw0KPiBMQTU3LCBJJ20gbm90IGNvbnZpbmNlZCBpdCds
bCBiZWNvbWUgbW9yZSB2aXNpYmxlIGFnYWluIHRoZW4sIGJ1dCBvZg0KPiBjb3Vyc2Ugd2l0aG91
dCBhY3R1YWxseSBkb2luZyB0aGF0IHdvcmsgaXQncyBhbGwgaGFuZC13YXZpbmcgYW55d2F5Lg0K
DQpXaXRoIExBNTcsIEhBUCByZWFsbHkgZG9lcyBiZWNvbWUgMiB0aGluZ3MuwqAgVXNpbmcgYSA1
LWxldmVsIHdhbGsgYXQgdGhlDQpIQVAgbGV2ZWwgaXMgYSBwcmVyZXF1aXNpdGUgZm9yIGJlaW5n
IGFibGUgdG8gVk1FbnRyeSB3aXRoIENSNC5MQTU3IHNldCwNCm9uIGJvdGggSW50ZWwgYW5kIEFN
RCBoYXJkd2FyZSBJSVJDLg0KDQpUaGVuLCBmb3IgVk1zIHdoaWNoIGRvbid0IGVsZWN0IHRvIGVu
YWJsZSBMQTU3LCB3ZSB3aWxsIGJlIGluIGEgNC1vbi01DQoodG8gYm9ycm93IHRoZSBzaGFkb3cg
dGVybWlub2xvZ3kpIHNpdHVhdGlvbi4NCg0KVGhlIGNvbW1lbnQgYnkgcGFnaW5nX3VwZGF0ZV9w
YWdpbmdfbW9kZXMoKSBpcyBmYWlybHkgY2xlYXIgYWJvdXQgdGhpcw0Kb3BlcmF0aW9uIGJlaW5n
IHN0cmljdGx5IHJlbGF0ZWQgdG8gZ3Vlc3Qgc3RhdGUsIHdoaWNoIGZ1cnRoZXINCmRlbW9uc3Ry
YXRlcyB0aGF0IGhhcCB2ZXJzaW9uIHBsYXlpbmcgd2l0aCB0aGUgbW9uaXRvciB0YWJsZSBpcyB3
cm9uZy4NCg0KPg0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbm9uZS5jDQo+Pj4g
KysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9ub25lLmMNCj4+PiBAQCAtMjcsNiArMzIsOSBA
QCBpbnQgc2hhZG93X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+Pj4gICAgICB9Ow0K
Pj4+ICANCj4+PiAgICAgIHBhZ2luZ19sb2dfZGlydHlfaW5pdChkLCAmc2hfbm9uZV9vcHMpOw0K
Pj4+ICsNCj4+PiArICAgIGQtPmFyY2gucGFnaW5nLnVwZGF0ZV9wYWdpbmdfbW9kZSA9IF91cGRh
dGVfcGFnaW5nX21vZGU7DQo+Pj4gKw0KPj4+ICAgICAgcmV0dXJuIGlzX2h2bV9kb21haW4oZCkg
PyAtRU9QTk9UU1VQUCA6IDA7DQo+PiBJIGtub3cgeW91IGhhdmVuJ3QgY2hhbmdlZCB0aGUgbG9n
aWMgaGVyZSwgYnV0IHRoaXMgaG9vayBsb29rcyBicm9rZW4uwqANCj4+IFdoeSBkbyB3ZSBmYWls
IGl0IHJpZ2h0IGF0IHRoZSBlbmQgZm9yIEhWTSBkb21haW5zPw0KPiBJdCdzIGJlZW4gYSBsb25n
IHRpbWUsIGJ1dCBJIGd1ZXNzIG15IHRoaW5raW5nIGJhY2sgdGhlbiB3YXMgdGhhdCBpdCdzDQo+
IGJldHRlciB0byBwdXQgaW4gcGxhY2UgcG9pbnRlcnMgd2hpY2ggb3RoZXIgY29kZSBtYXkgcmVs
eSBvbiBiZWluZyBub24tDQo+IE5VTEwuDQoNCkFueSBjaGFuY2Ugd2UgY291bGQgZ2FpbiBhIC8q
IHNldCB1cCBwb2ludGVycyBmb3Igc2FmZXR5LCB0aGVuIGZhaWwgKi8NCnRoZW4gPw0KDQp+QW5k
cmV3DQo=

